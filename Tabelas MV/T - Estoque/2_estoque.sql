
select  itmvto.cd_produto
    ,mvto.cd_estoque
    ,mvto.cd_mvto_estoque
    ,itmvto.cd_lote
    ,itmvTo.dt_validade
    ,identificador_etiqueta.sn_ativo
    ,mvto.sn_kit_armazenado
    ,Sum(itmvto.qt_movimentacao * u.vl_fator) OVER() qt_teste
    ,itmvto.qt_movimentacao * u.vl_fator qt_produzida
    ,lot.qt_kit qt_reservada
    ,lot.qt_estoque_atual
    ,identificador_etiqueta.cd_identificador
    ,mvto.dsp_cd_barras
from dbamv.itmvto_kit_produzido itmvto,
    dbamv.mvto_kit_produzido mvto,
    dbamv.produto prod,
    dbamv.identificador_etiqueta,
    dbamv.lot_pro lot,
    dbamv.uni_pro u
where mvto.cd_mvto_estoque = itmvto.cd_mvto_estoque
      and prod.cd_produto = mvto.cd_kit
      AND u.cd_uni_pro = itmvto.cd_uni_pro
      and identificador_etiqueta.cd_identificador = dbamv.fnc_mges_valida_cod_barra(mvto.dsp_cd_barras)
      AND lot.cd_produto = itmvto.cd_produto
	  --V2 - correção transferencia
	  AND lot.cd_estoque = Decode(mvto.tp_mvto_estoque, 'T', mvto.cd_estoque_destino, mvto.cd_estoque)
      AND Nvl(lot.cd_lote,'XXXXXX') = Nvl(itmvto.cd_lote,'XXXXXX')
      AND Nvl(lot.dt_validade,To_Date('01/01/3000','DD/MM/YYYY')) = Nvl(itmvTo.dt_validade,To_Date('01/01/3000','DD/MM/YYYY')  )
    -- A PARTIR DAQUI, MODIFICAR CONFORME O QUE DESEJA VERIFICAR
    --AND itmvto.cd_produto = 1469
    --AND mvto.cd_kit = 100 -- AQUI
    --AND lot.cd_lote = '201113329'
    --AND lot.dt_validade = To_Date('30/04/2021','DD/MM/YYYY')
    --AND mvto.cd_mvto_estoque in (7098159,7131963)
    --AND lot.cd_estoque =  2
	--V2 - pegar só a última transferencia
    --AND mvto.cd_mvto_estoque = (SELECT Max (cd_mvto_estoque) FROM dbamv.mvto_kit_produzido m2 WHERE m2.dsp_cd_barras = mvto.dsp_cd_barras)
    AND identificador_etiqueta.cd_identificador = dbamv.fnc_mges_valida_cod_barra('2000001435496')
    AND mvto.sn_kit_armazenado = 'S' AND identificador_etiqueta.sn_ativo = 'S'
    --and (mvto.sn_kit_armazenado  = 'S' or identificador_etiqueta.sn_ativo = 'S')
ORDER BY mvto.cd_mvto_estoque;




SELECT e.cd_estoque, mvto.cd_kit, Count( DISTINCT mvto.dsp_cd_barras) qtd, e.qt_Estoque_atual
      FROM dbamv.itmvto_kit_produzido itmvto,
          dbamv.mvto_kit_produzido mvto,
          dbamv.identificador_etiqueta,
          dbamv.est_Pro e
      WHERE mvto.cd_mvto_estoque = itmvto.cd_mvto_estoque
            and identificador_etiqueta.cd_identificador = dbamv.fnc_mges_valida_cod_barra(mvto.dsp_cd_barras)
            AND mvto.cd_mvto_estoque = (SELECT Max (cd_mvto_estoque) FROM dbamv.mvto_kit_produzido m2 WHERE m2.dsp_cd_barras = mvto.dsp_cd_barras)
            AND mvto.sn_kit_armazenado = 'S' AND identificador_etiqueta.sn_ativo = 'S'
            AND e.cd_estoque = Decode(mvto.tp_mvto_estoque, 'T', mvto.cd_estoque_destino, mvto.cd_estoque)
            AND e.cd_produto = mvto.cd_kit
            --AND e.cd_estoque IN (SELECT cd_Estoque FROM dbamv.estoque e WHERE e.cd_multi_empresa = r_empresas.cd_multi_empresa)
      GROUP BY mvto.cd_kit, e.cd_estoque, e.qt_Estoque_atual
      HAVING Count( DISTINCT mvto.dsp_cd_barras) <> e.qt_Estoque_atual
      ORDER BY e.cd_estoque, mvto.cd_kit


SELECT * FROM dbamv.est_pro where cd_produto = 19119 AND cd_estoque = 31