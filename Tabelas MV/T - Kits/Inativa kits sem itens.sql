CREATE OR REPLACE PROCEDURE dbamv.prc_corrigereservakit IS
  -- A vari?vel v_empresa ? a ?nica configura??o manual necess?ria.
  v_empresa NUMBER := 1; -- <------------------ COLOCAR EMPRESA AQUI ------------------
  NvlLoteConstante CONSTANT VARCHAR2(3) := '|@|';
  NvlDataConstante CONSTANT DATE := DATE '1900-01-01';

BEGIN

  FOR r_empresas IN (
    SELECT cd_multi_empresa
    FROM dbamv.multi_empresas
  ) LOOP

    dbamv.pkg_mv2000.atribui_empresa(r_empresas.cd_multi_empresa);

    IF (DBAMV.PKT_CONFIGEST.Retorna_Campo('SN_CONTROLA_KIT') = 'N') THEN
      RETURN;
    END IF;

    -- ==========================================================================================
    --  Passo 1 (V6): Inativa kits sem itens.
    -- ==========================================================================================
    UPDATE dbamv.identificador_etiqueta
    SET sn_ativo = 'N'
    WHERE cd_identificador IN (
      SELECT dbamv.fnc_mges_valida_cod_barra(m.dsp_cd_barras)
      FROM dbamv.mvto_kit_produzido m
      WHERE m.sn_kit_armazenado = 'S'
        AND m.cd_estoque IN (SELECT cd_estoque FROM dbamv.estoque WHERE cd_multi_empresa = r_empresas.cd_multi_empresa)
        AND NOT EXISTS (SELECT 1 FROM dbamv.itmvto_kit_produzido i WHERE m.cd_mvto_estoque = i.cd_mvto_estoque)
    );

    UPDATE dbamv.mvto_kit_produzido
    SET sn_kit_armazenado = 'N'
    WHERE sn_kit_armazenado = 'S'
      AND cd_estoque IN (SELECT cd_estoque FROM dbamv.estoque WHERE cd_multi_empresa = r_empresas.cd_multi_empresa)
      AND NOT EXISTS (SELECT 1 FROM dbamv.itmvto_kit_produzido i WHERE mvto_kit_produzido.cd_mvto_estoque = i.cd_mvto_estoque);

    COMMIT;

    -- ==========================================================================================
    --  Passo 2 (V3): Inativa os kits sem cd_kit.
    -- ==========================================================================================
    UPDATE dbamv.identificador_etiqueta
    SET sn_ativo = 'N'
    WHERE cd_identificador IN (
      SELECT dbamv.fnc_mges_valida_cod_barra(m.dsp_cd_barras)
      FROM dbamv.mvto_kit_produzido m
      WHERE m.cd_kit IS NULL
        AND m.cd_estoque IN (SELECT cd_estoque FROM dbamv.estoque WHERE cd_multi_empresa = r_empresas.cd_multi_empresa)
    );

    UPDATE dbamv.mvto_kit_produzido
    SET sn_kit_armazenado = 'N'
    WHERE cd_kit IS NULL
      AND cd_estoque IN (SELECT cd_estoque FROM dbamv.estoque WHERE cd_multi_empresa = r_empresas.cd_multi_empresa);

    COMMIT;

    -- ==========================================================================================
    --  Passo 3 (V2): Corre??o para kits fantasmas (kit inativo com etiqueta ativa).
    -- ==========================================================================================
    UPDATE dbamv.identificador_etiqueta ie
    SET ie.sn_ativo = 'N'
    WHERE ie.sn_ativo = 'S'
      AND ie.cd_identificador IN (
        SELECT dbamv.fnc_mges_valida_cod_barra(m.dsp_cd_barras)
        FROM dbamv.mvto_kit_produzido m
        WHERE m.sn_kit_armazenado = 'N'
          AND m.cd_estoque IN (SELECT cd_estoque FROM dbamv.estoque WHERE cd_multi_empresa = r_empresas.cd_multi_empresa)
          AND m.cd_mvto_estoque = (SELECT MAX(m2.cd_mvto_estoque) FROM dbamv.mvto_kit_produzido m2 WHERE m2.dsp_cd_barras = m.dsp_cd_barras)
      );

    COMMIT;

    -- ==========================================================================================
    --  Passo 4 (V3): Inativa kits para cobrir estoque negativo (QT_ESTOQUE_ATUAL < QT_RESERVADO).
    --  Bloco PL/SQL CORRIGIDO.
    -- ==========================================================================================
    DECLARE
      CURSOR c_kits_ativos(p_cd_produto NUMBER, p_cd_estoque NUMBER, p_cd_lote VARCHAR2, p_dt_validade DATE) IS
        select  Decode(mvto.tp_mvto_estoque, 'T', mvto.cd_estoque_destino, mvto.cd_estoque) cd_estoque
				        ,mvto.cd_mvto_estoque
                ,identificador_etiqueta.cd_identificador
                ,(itmvto.qt_movimentacao * u.vl_fator) qt_produzida
            from dbamv.itmvto_kit_produzido itmvto,
                dbamv.mvto_kit_produzido mvto,
                dbamv.identificador_etiqueta,
                dbamv.lot_pro lot,
                dbamv.uni_pro u
            where mvto.cd_mvto_estoque = itmvto.cd_mvto_estoque
                  AND u.cd_uni_pro = itmvto.cd_uni_pro
                  and identificador_etiqueta.cd_identificador = dbamv.fnc_mges_valida_cod_barra(mvto.dsp_cd_barras)
                  AND lot.cd_produto = itmvto.cd_produto
                  AND lot.cd_estoque = Nvl(mvto.cd_estoque_destino, mvto.cd_estoque)
                  AND Nvl(lot.cd_lote,NvlLoteConstante) = Nvl(itmvto.cd_lote,NvlLoteConstante)
                  AND Nvl(lot.dt_validade,NvlDataConstante) = Nvl(itmvTo.dt_validade,NvlDataConstante)
                AND itmvto.cd_produto = p_cd_produto
                AND Nvl(lot.cd_lote,NvlLoteConstante) = Nvl(p_cd_lote,NvlLoteConstante)
                AND Nvl(lot.dt_validade, NvlDataConstante) = Nvl(p_dt_validade, NvlDataConstante)
                AND lot.cd_estoque = p_cd_estoque
                AND mvto.sn_kit_armazenado = 'S' AND identificador_etiqueta.sn_ativo = 'S'
            ORDER BY mvto.cd_mvto_estoque;

      r_kits_ativos c_kits_ativos%ROWTYPE;

      CURSOR c_estoque_tp1 IS
        SELECT 1 tp
                , sem_saldo."CD_ESTOQUE_ATUAL",sem_saldo."CD_PRODUTO",sem_saldo."CD_LOTE",sem_saldo."DT_VALIDADE",sem_saldo."QT_ESTOQUE_ATUAL"
                ,sem_saldo."QT_KIT",sem_saldo."QT_RESERVADO"
          FROM (SELECT Decode(m.tp_mvto_estoque, 'T', m.cd_estoque_destino, m.cd_estoque) cd_estoque_atual
                    , i.cd_produto
                    , i.cd_lote
                    , i.dt_validade
                    , l.qt_estoque_atual
                    , l.qt_kit
                    , Sum(mges.f_checa_uni_pro(i.cd_uni_pro,i.cd_produto) * i.qt_movimentacao) qt_reservado
                FROM dbamv.identificador_Etiqueta e
                    , dbamv.mvto_kit_produzido m
                    , dbamv.itmvto_kit_produzido i
                    , dbamv.estoque t
                    , dbamv.lot_pro l
                WHERE  m.cd_mvto_estoque = i.cd_mvto_estoque  -- para o processo antigo
                  AND e.cd_identificador = DBAMV.fnc_mges_valida_cod_barra(m.dsp_cd_barras)
                  AND Nvl(m.cd_estoque_destino,m.cd_estoque) = t.cd_estoque
                  AND t.cd_estoque = l.cd_estoque
                  AND i.cd_produto = l.cd_produto
                  AND Nvl(i.cd_lote,NvlLoteConstante) = Nvl(l.cd_lote,NvlLoteConstante)
                  AND Nvl(i.dt_validade,NvlDataConstante) = Nvl(l.dt_validade,NvlDataConstante)
                  AND t.cd_multi_empresa = r_empresas.cd_multi_empresa
                  AND e.sn_ativo = 'S'
                  AND m.sn_kit_armazenado = 'S'
                  AND m.dsp_cd_barras IS NOT null
            GROUP BY Decode(m.tp_mvto_estoque, 'T', m.cd_estoque_destino, m.cd_estoque)
                    , i.cd_produto
                    , i.cd_lote
                    , i.dt_validade
                    , l.qt_kit
                    , l.qt_estoque_atual
            ORDER BY Decode(m.tp_mvto_estoque, 'T', m.cd_estoque_destino, m.cd_estoque)) sem_saldo
              WHERE  QT_KIT <> QT_RESERVADO
                AND QT_ESTOQUE_ATUAL < QT_RESERVADO;

      r_estoque_tp1 c_estoque_tp1%ROWTYPE;

      v_qt_estoque_extra NUMBER;
    BEGIN
      LOOP
        OPEN c_estoque_tp1;
        FETCH c_estoque_tp1 INTO r_estoque_tp1;
          EXIT WHEN (c_estoque_tp1%NOTFOUND);

          v_qt_estoque_extra := r_estoque_tp1.qt_reservado - r_estoque_tp1.qt_estoque_atual;

          FOR r_kits_ativos IN c_kits_ativos (r_estoque_tp1.cd_produto, r_estoque_tp1.cd_estoque_atual, r_estoque_tp1.cd_lote, r_estoque_tp1.dt_validade) LOOP
            EXIT WHEN (Nvl(v_qt_estoque_extra,0) <= 0);
            v_qt_estoque_extra := v_qt_estoque_extra - r_kits_ativos.qt_produzida;

            UPDATE dbamv.mvto_kit_produzido SET sn_kit_armazenado = 'N' WHERE cd_mvto_estoque = r_kits_ativos.cd_mvto_estoque;
            UPDATE dbamv.identificador_etiqueta SET sn_ativo = 'N' WHERE cd_identificador = r_kits_ativos.cd_identificador;
          END LOOP;

        CLOSE c_estoque_tp1;
      END LOOP;

    END;
    COMMIT;


    -- ==========================================================================================
    --  Passo 5 (Tipos 2 e 3): Principal corre??o de `lot_pro.qt_kit`.
    -- ==========================================================================================
    MERGE INTO dbamv.lot_pro lp
    USING (
      WITH dados_calculados AS (
        SELECT
          cd_estoque_atual, cd_produto, cd_lote, dt_validade, qt_reservado
        FROM (
          SELECT Decode(m.tp_mvto_estoque, 'T', m.cd_estoque_destino, m.cd_estoque) cd_estoque_atual,
                 i.cd_produto, i.cd_lote, i.dt_validade, l.qt_kit, l.qt_estoque_atual,
                 Sum(mges.f_checa_uni_pro(i.cd_uni_pro,i.cd_produto) * i.qt_movimentacao) qt_reservado
          FROM dbamv.identificador_Etiqueta e, dbamv.mvto_kit_produzido m, dbamv.itmvto_kit_produzido i, dbamv.lot_pro l
          WHERE m.cd_mvto_estoque = i.cd_mvto_estoque
            AND e.cd_identificador = DBAMV.fnc_mges_valida_cod_barra(m.dsp_cd_barras)
            AND Nvl(m.cd_estoque_destino,m.cd_estoque) = l.cd_estoque
            AND i.cd_produto = l.cd_produto
            AND Nvl(i.cd_lote,NvlLoteConstante) = Nvl(l.cd_lote,NvlLoteConstante)
            AND Nvl(i.dt_validade,NvlDataConstante) = Nvl(l.dt_validade,NvlDataConstante)
            AND l.cd_estoque IN (SELECT cd_estoque FROM dbamv.estoque WHERE cd_multi_empresa = r_empresas.cd_multi_empresa)
            AND e.sn_ativo = 'S' AND m.sn_kit_armazenado = 'S' AND m.dsp_cd_barras IS NOT NULL
          GROUP BY Decode(m.tp_mvto_estoque, 'T', m.cd_estoque_destino, m.cd_estoque), i.cd_produto, i.cd_lote, i.dt_validade, l.qt_kit, l.qt_estoque_atual
        ) com_saldo
        WHERE qt_kit <> qt_reservado AND qt_estoque_atual >= qt_reservado AND qt_reservado > 0

        UNION ALL

        SELECT l.cd_estoque AS cd_estoque_atual, l.cd_produto, l.cd_lote, l.dt_validade, 0 AS qt_reservado
        FROM dbamv.lot_pro l
        WHERE l.qt_kit > 0
          AND l.cd_estoque IN (SELECT cd_estoque FROM dbamv.estoque WHERE cd_multi_empresa = r_empresas.cd_multi_empresa)
          AND NOT EXISTS (
              SELECT 1 FROM dbamv.itmvto_kit_produzido ik
              JOIN dbamv.mvto_kit_produzido m ON ik.cd_mvto_estoque = m.cd_mvto_estoque
              JOIN dbamv.identificador_etiqueta ie ON ie.cd_identificador = DBAMV.fnc_mges_valida_cod_barra(m.dsp_cd_barras)
              WHERE ie.sn_ativo = 'S'
                AND m.sn_kit_armazenado = 'S'
                AND ik.cd_produto = l.cd_produto
                AND Decode(m.tp_mvto_estoque, 'T', m.cd_estoque_destino, m.cd_estoque) = l.cd_estoque
                AND Nvl(ik.cd_lote, NvlLoteConstante) = Nvl(l.cd_lote, NvlLoteConstante)
          )
      )
      SELECT * FROM dados_calculados dc
      WHERE NOT EXISTS (
        SELECT 'X' FROM dbamv.contagem c JOIN dbamv.itContagem_da_abertura i ON i.cd_contagem = c.cd_contagem
        WHERE c.sn_aberto = 'S' AND i.cd_produto = dc.cd_produto AND c.cd_estoque = dc.cd_estoque_atual
      )
    ) origem
    ON (
        lp.cd_produto = origem.cd_produto
        AND lp.cd_estoque = origem.cd_estoque_atual
        AND Nvl(lp.cd_lote, NvlLoteConstante) = Nvl(origem.cd_lote, NvlLoteConstante)
        AND Nvl(lp.dt_validade, NvlDataConstante) = Nvl(origem.dt_validade, NvlDataConstante)
    )
    WHEN MATCHED THEN
      UPDATE SET lp.qt_kit = origem.qt_reservado
      WHERE lp.qt_kit <> origem.qt_reservado;

    COMMIT;

    -- ==========================================================================================
    --  Passo 6 (Tipo 4): Corrige `qt_kit` e `qt_estoque_atual` do produto MESTRE.
    -- ==========================================================================================
    MERGE INTO dbamv.lot_pro l2_mestre
    USING (
      SELECT
        p.cd_produto_tem AS pro_tem,
        l.cd_estoque AS pro_tem_est,
        l.cd_lote AS pro_tem_lot,
        l.dt_validade AS pro_tem_validade,
        Sum(l.qt_estoque_atual) AS pro_qt,
        Sum(l.qt_kit) AS pro_qt_kit
      FROM dbamv.lot_pro l
      INNER JOIN dbamv.produto p ON p.cd_produto = l.cd_produto
      WHERE l.qt_estoque_atual <> 0
        AND l.cd_estoque IN (SELECT cd_estoque FROM dbamv.estoque WHERE cd_multi_empresa = r_empresas.cd_multi_empresa)
      GROUP BY p.cd_produto_tem, l.cd_estoque, l.cd_lote, l.dt_validade
    ) origem
    ON (
        l2_mestre.cd_produto = origem.pro_tem
        AND l2_mestre.cd_estoque = origem.pro_tem_est
        AND Nvl(l2_mestre.cd_lote, NvlLoteConstante) = Nvl(origem.pro_tem_lot, NvlLoteConstante)
        AND Nvl(l2_mestre.dt_validade, NvlDataConstante) = Nvl(origem.pro_tem_validade, NvlDataConstante)
    )
    WHEN MATCHED THEN
      UPDATE SET
        l2_mestre.qt_kit = origem.pro_qt_kit,
        l2_mestre.qt_estoque_atual = origem.pro_qt
      WHERE l2_mestre.qt_kit <> origem.pro_qt_kit OR l2_mestre.qt_estoque_atual <> origem.pro_qt;

    COMMIT;

    -- ==========================================================================================
    --  Passo 7 (V6): Corrige a quantidade da `est_pro` do produto tipo kit.
    -- ==========================================================================================
    MERGE INTO dbamv.est_pro ep
    USING (
      SELECT
        mvto.cd_kit,
        Decode(mvto.tp_mvto_estoque, 'T', mvto.cd_estoque_destino, mvto.cd_estoque) AS cd_estoque,
        Count(DISTINCT mvto.dsp_cd_barras) AS qtd_correta
      FROM dbamv.mvto_kit_produzido mvto
      JOIN dbamv.identificador_etiqueta ie ON ie.cd_identificador = dbamv.fnc_mges_valida_cod_barra(mvto.dsp_cd_barras)
      WHERE mvto.cd_mvto_estoque = (SELECT Max(m2.cd_mvto_estoque) FROM dbamv.mvto_kit_produzido m2 WHERE m2.dsp_cd_barras = mvto.dsp_cd_barras)
        AND mvto.sn_kit_armazenado = 'S'
        AND ie.sn_ativo = 'S'
        AND Decode(mvto.tp_mvto_estoque, 'T', mvto.cd_estoque_destino, mvto.cd_estoque) IN (SELECT cd_estoque FROM dbamv.estoque WHERE cd_multi_empresa = r_empresas.cd_multi_empresa)
      GROUP BY mvto.cd_kit, Decode(mvto.tp_mvto_estoque, 'T', mvto.cd_estoque_destino, mvto.cd_estoque)
    ) origem
    ON (ep.cd_produto = origem.cd_kit AND ep.cd_estoque = origem.cd_estoque)
    WHEN MATCHED THEN
      UPDATE SET ep.qt_estoque_atual = origem.qtd_correta
      WHERE ep.qt_estoque_atual <> origem.qtd_correta;

    COMMIT;

  END LOOP;

EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    RAISE;
END prc_corrigereservakit;
/


BEGIN
  dbamv.prc_corrigereservakit;
END;


