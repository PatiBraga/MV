SELECT * FROM (
SELECT  ESPECIE.CD_ESPECIE           CD_ESPECIE
               ,ESPECIE.DS_ESPECIE           DS_ESPECIE
               ,PRODUTO.CD_PRODUTO           CD_PRODUTO
               ,PRODUTO.DS_PRODUTO           DS_PRODUTO
         , Nvl(sum(EST_PRO.QT_ESTOQUE_DOADO ) / verif_vl_fator_prod(produto.cd_produto),0)  QT_ESTOQUE_DOADO
           , ( verif_vl_custo_medio(produto.cd_produto,sysdate, 'H' ,produto.vl_custo_medio,sysdate) * verif_vl_fator_prod ( produto.cd_produto )  )     VL_CUSTO_MEDIO
           , Nvl(sum(est_pro.qt_estoque_atual - EST_PRO.QT_ESTOQUE_DOADO) / verif_vl_fator_prod(produto.cd_produto),0)   QT_ESTOQUE    -- PDA 264767
FROM     DBAMV.ESTOQUE                ESTOQUE
              ,DBAMV.EST_PRO                EST_PRO
              ,(SELECT PRODUTO.cd_produto,
PRODUTO.cd_sub_cla,
PRODUTO.cd_classe,
PRODUTO.cd_especie,
PRODUTO.cd_produto_tem,
PRODUTO.ds_produto,
PRODUTO.dt_cadastro,
PRODUTO.tp_ativo,
PRODUTO.qt_estoque_atual,
PRODUTO.dt_ultima_entrada,
PRODUTO.sn_controle_validade,
PRODUTO.sn_pscotropico,
PRODUTO.vl_custo_medio,
PRODUTO.vl_margem_lucro,
PRODUTO.vl_preco_de_venda,
PRODUTO.vl_tempo_de_reposicao,
PRODUTO.sn_mestre,
PRODUTO.hr_ultima_entrada,
PRODUTO.sn_medicamento,
PRODUTO.tp_classificacao_xyz,
PRODUTO.sn_fracionado,
PRODUTO.cd_tip_ativ,
PRODUTO.sn_imprime_etiqueta,
PRODUTO.sn_lote,
PRODUTO.cd_pro_fat,
PRODUTO.nr_ordem_preferencia,
PRODUTO.vl_fator_pro_fat,
PRODUTO.cd_dcb,
PRODUTO.cd_lista_codigo_medicamento,
PRODUTO.vl_ultima_entrada,
PRODUTO.cd_ultimo_fornecedor,
PRODUTO.tp_sexo,
PRODUTO.qt_ultima_entrada,
PRODUTO.ds_produto_resumido,
PRODUTO.cd_sican,
PRODUTO.sn_kit,
PRODUTO.vl_ultima_custo_real,
PRODUTO.sn_consignado,
PRODUTO.cd_item_res,
PRODUTO.sn_invasivo,
PRODUTO.cd_pro_fat_sus,
PRODUTO.ds_atributo1,
PRODUTO.cd_fornecedor_principal,
PRODUTO.tp_atualizacao_preco,
PRODUTO.vl_percentual_variacao,
PRODUTO.vl_ultima_compra_ipi,
PRODUTO.sn_admitido,
PRODUTO.tp_horas_esterelizar,
PRODUTO.qt_caixa_cirurgica,
PRODUTO.qt_inativa,
PRODUTO.tp_classificacao_tributaria,
PRODUTO.nr_ordem_impressao,
PRODUTO.cd_produto_tem_integra,
PRODUTO.cd_produto_integra,
PRODUTO.dt_integra,
PRODUTO.cd_seq_integra,
PRODUTO.cd_usuario_inc,
PRODUTO.dt_inc_usuario,
PRODUTO.cd_usuario_alt,
PRODUTO.dt_alt_usuario,
PRODUTO.tp_cx_cirurgica,
PRODUTO.nr_crf_laboratorio,
PRODUTO.tp_mensagem_sus,
PRODUTO.tp_carater,
PRODUTO.qt_concentracao,
PRODUTO.cd_procedimento_sus,
PRODUTO.dt_validade_registro,
PRODUTO.sn_opme,
PRODUTO.tp_calculo_media_ponderada,
PRODUTO.ds_comercial,
PRODUTO.ds_especificacao_detalhada,
PRODUTO.sn_bloqueio_sol_ord_compra,
PRODUTO.ds_especificacao,
PRODUTO.vl_percentual_lucro,
PRODUTO.sn_marca_obrigatoria,
PRODUTO.tp_status_unificado,
PRODUTO.tp_descricao,
PRODUTO.cd_produto_novo,
PRODUTO.ds_restricao,
PRODUTO.sn_controla_serie,
PRODUTO.sn_acondicionado,
PRODUTO.cd_img_produto,
PRODUTO.sn_registro_anvisa,
PRODUTO.sn_produto_rouparia,
PRODUTO.cd_produto_santos,
PRODUTO.sn_integra_farmacia_amb,
PRODUTO.cd_ncm,
PRODUTO.qt_dias_valid_esterilizacao,
PRODUTO.ds_complemento,
PRODUTO.nr_referencia,
PRODUTO.cd_substancia_principal,
                       DECODE(DBAMV.PKT_CONFIGEST.RETORNA_CAMPO('SN_PADRONIZADO_EMP'), 'S',EMPRESA_PRODUTO.SN_PADRONIZADO,PRODUTO.SN_PADRONIZADO) SN_PADRONIZADO,
                       DECODE(DBAMV.PKT_CONFIGEST.RETORNA_CAMPO('SN_LOTE_VAL_PRD_EMP'), 'S',EMPRESA_PRODUTO.SN_MOVIMENTACAO,PRODUTO.SN_MOVIMENTACAO) SN_MOVIMENTACAO,
                       DECODE(DBAMV.PKT_CONFIGEST.RETORNA_CAMPO('SN_LOTE_VAL_PRD_EMP'), 'S',EMPRESA_PRODUTO.SN_BLOQUEIO_DE_COMPRA,PRODUTO.SN_BLOQUEIO_DE_COMPRA) SN_BLOQUEIO_DE_COMPRA
                  FROM PRODUTO,
                       EMPRESA_PRODUTO
                 WHERE PRODUTO.CD_PRODUTO = EMPRESA_PRODUTO.CD_PRODUTO
                   AND EMPRESA_PRODUTO.CD_MULTI_EMPRESA = DBAMV.pkg_mv2000.LE_EMPRESA) PRODUTO
              ,DBAMV.ESPECIE                   ESPECIE
              ,DBAMV.CLASSE                 CLASSE
              ,DBAMV.SUB_CLAS                  SUB_CLAS
WHERE  estoque.cd_estoque  = est_pro.cd_estoque
AND    est_pro.cd_produto  in ( Select Cd_Produto
                                From Dbamv.Produto a
                                Where A.Cd_Produto = Produto.Cd_Produto  )  -- PDA 336220
AND    produto.cd_sub_cla  = sub_clas.cd_sub_cla
AND    produto.cd_classe     = sub_clas.cd_classe
AND    produto.cd_especie  = sub_clas.cd_especie
AND    sub_clas.cd_classe   = classe.cd_classe
AND    sub_clas.cd_especie = classe.cd_especie
AND    classe.cd_especie     = especie.cd_especie
AND    Nvl(est_pro.qt_estoque_atual,0) >= 0
And  ( ( $P{P_MESTRE} = 'N' And Produto.Sn_Mestre = 'N')
          Or ($P{P_MESTRE} = 'S' And produto.Sn_Mestre = Produto.Sn_Mestre) )
and   estoque.cd_multi_empresa = $P{P_CD_MULTI_EMPRESA}
And ($P{PS_CD_LOCALIZACAO} = '%' Or EST_PRO.CD_LOCALIZACAO = $P{PS_CD_LOCALIZACAO})
$P!{CF_QT_ZERO}
$P!{CF_ESTOQUE}
$P!{CF_PRODUTO}
$P!{CF_ESPECIE}
$P!{CF_CLASSE}
$P!{CF_ACONDICIONADO}
$P!{CF_SUB_CLA}
$P!{CF_P_DETALHES}
$P!{CF_KIT}
GROUP BY
                ESPECIE.CD_ESPECIE
               ,ESPECIE.DS_ESPECIE
               ,PRODUTO.CD_PRODUTO
               ,PRODUTO.VL_CUSTO_MEDIO
               ,PRODUTO.DS_PRODUTO
)
ORDER BY CD_ESPECIE , DS_PRODUTO , CD_PRODUTO