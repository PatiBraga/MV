-- relatório default do MV R_POS_EST

SELECT * FROM (
    SELECT
        estoque.cd_estoque,
        estoque.ds_estoque,
        especie.cd_especie,
        especie.ds_especie,
        classe.cd_classe,
        classe.ds_classe,
        sub_clas.cd_sub_cla,
        sub_clas.ds_sub_cla,
        produto.cd_produto,
        produto.ds_produto,
        NVL(Sum(est_pro.qt_estoque_maximo) / Verif_Vl_Fator_Prod(Produto.Cd_Produto), 0) qt_estoque_maximo,
        NVL(Sum(est_pro.qt_estoque_minimo) / Verif_Vl_Fator_Prod(Produto.Cd_Produto), 0) qt_estoque_minimo,
        NVL(Sum(est_pro.qt_ponto_de_pedido) / Verif_Vl_Fator_Prod(Produto.Cd_Produto), 0) qt_ponto_de_pedido,
        NVL((verif_vl_custo_medio(produto.cd_produto, SYSDATE, 'H', produto.vl_custo_medio, SYSDATE) * verif_vl_fator_prod(produto.cd_produto)), 0) vl_custo_medio,
        NVL((
            SELECT Sum(lot_pro.qt_estoque_atual) / verif_vl_fator_prod(produto.cd_produto)
            FROM lot_pro
            WHERE lot_pro.cd_produto = Produto.Cd_Produto
              AND lot_pro.cd_estoque = estoque.cd_estoque
              AND lot_pro.sn_bloqueio = 'N'
        ), 0) qt_estoque,
        Verif_Ds_Unid_Prod(Produto.Cd_Produto) Ds_Unidade
    FROM
        dbamv.estoque,
        dbamv.est_pro,
        (
            SELECT
                p.vl_custo_medio,
                p.cd_produto_tem,
                p.cd_especie,
                p.cd_produto,
                p.sn_padronizado,
                p.cd_pro_fat,
                DECODE(DBAMV.PKT_CONFIGEST.RETORNA_CAMPO('SN_LOTE_VAL_PRD_EMP'), 'S', EMPRESA_PRODUTO.SN_MOVIMENTACAO, p.SN_MOVIMENTACAO) sn_movimentacao,
                p.sn_consignado,
                DECODE(DBAMV.PKT_CONFIGEST.RETORNA_CAMPO('SN_LOTE_VAL_PRD_EMP'), 'S', EMPRESA_PRODUTO.SN_BLOQUEIO_DE_COMPRA, p.SN_BLOQUEIO_DE_COMPRA) sn_bloqueio_de_compra,
                p.sn_admitido,
                p.cd_classe,
                p.cd_sub_cla,
                p.ds_produto,
                p.sn_mestre,
                p.sn_kit,
                p.sn_pscotropico
            FROM dbamv.produto p, dbamv.Empresa_Produto Empresa_Produto
            WHERE Empresa_Produto.cd_produto = p.cd_produto
              AND Empresa_Produto.cd_multi_empresa = 1
        ) produto,
        dbamv.sub_clas,
        dbamv.classe,
        dbamv.especie
    WHERE  estoque.cd_estoque = est_pro.cd_estoque
      AND    est_pro.cd_produto = produto.cd_produto
      AND    produto.cd_sub_cla = sub_clas.cd_sub_cla
      AND    produto.cd_classe = sub_clas.cd_classe
      AND    produto.cd_especie = sub_clas.cd_especie
      AND    sub_clas.cd_classe = classe.cd_classe
      AND    sub_clas.cd_especie = classe.cd_especie
      AND    classe.cd_especie = especie.cd_especie
      AND    NVL(est_pro.qt_estoque_atual, 0) >= 0
      AND    estoque.cd_multi_empresa = 1
    GROUP BY
        produto.ds_produto,
        estoque.cd_estoque,
        estoque.ds_estoque,
        especie.cd_especie,
        especie.ds_especie,
        classe.cd_classe,
        classe.ds_classe,
        sub_clas.cd_sub_cla,
        sub_clas.ds_sub_cla,
        produto.cd_produto,
        produto.vl_custo_medio
)
WHERE 1=1
ORDER BY
    CD_ESPECIE,
    DS_ESPECIE,
    CD_CLASSE,
    DS_CLASSE,
    CD_SUB_CLA,
    DS_SUB_CLA,
    ds_produto,
    cd_estoque