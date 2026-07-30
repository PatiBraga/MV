--S R_PROD_CONSIG
--Consumo de pordutos consignados/aviso de cirurgia
SELECT mvto . cd_aviso_cirurgia cd_aviso_cirurgia,
       SUM (DECODE (tp_mvto_estoque,
                    'P',
                    1,
                    'C' , - 1) * itmvto . qt_movimentacao * uni_pro . vl_fator) / verif_vl_fator_prod (itmvto . cd_produto) qt_consumo,
           itmvto . cd_produto cd_produto,
           produto . ds_produto,
           dbamv . verif_ds_unid_prod (itmvto . cd_produto) ds_uni_pro,
           mvto . cd_estoque cd_estoque,
           itmvto . cd_fornecedor cd_fornecedor,
           aviso_cirurgia . dt_aviso_cirurgia,
           aviso_cirurgia . cd_atendimento,
           aviso_cirurgia . nm_paciente,
           fornecedor . nm_fornecedor,
           estoque . ds_estoque,
           aviso_cirurgia . dt_prev_inter dt_prev_inter
FROM dbamv . mvto_estoque mvto,
     dbamv . itmvto_estoque itmvto,
     dbamv . produto produto,
     dbamv . uni_pro uni_pro,
     dbamv . estoque estoque,
     dbamv . aviso_cirurgia,
     dbamv . fornecedor
WHERE mvto.cd_mvto_estoque = itmvto.cd_mvto_estoque
  AND itmvto.cd_produto = produto.cd_produto
  AND itmvto.cd_uni_pro = uni_pro.cd_uni_pro
  AND itmvto.cd_fornecedor = fornecedor.cd_fornecedor
  AND mvto.cd_estoque = estoque.cd_estoque
  AND mvto.tp_mvto_estoque IN ('C',
                               'P')
  AND estoque.cd_multi_empresa = pkg_mv2000.le_empresa
  AND produto.sn_consignado IN ('S')
  AND mvto.cd_aviso_cirurgia = aviso_cirurgia.cd_aviso_cirurgia
  AND mvto.dt_mvto_estoque >= TO_DATE ('01/08/2025',
                                       'dd/mm/rrrr')
  AND mvto.dt_mvto_estoque < TO_DATE ('30/09/2025',
                                      'dd/mm/rrrr')                                 cd_ itsolsai_pro
GROUP BY mvto.cd_aviso_cirurgia,
         itmvto.cd_produto,
         produto.ds_produto,
         dbamv.verif_ds_unid_prod (itmvto.cd_produto),
         mvto.cd_estoque,
         itmvto.cd_fornecedor,
         aviso_cirurgia.dt_aviso_cirurgia,
         aviso_cirurgia.cd_atendimento,
         aviso_cirurgia.nm_paciente,
         fornecedor.nm_fornecedor,
         estoque.ds_estoque,
         aviso_cirurgia.dt_prev_inter
HAVING SUM (DECODE (tp_mvto_estoque,
                    'P',
                    1,
                    'C' , - 1) * itmvto.qt_movimentacao * uni_pro.vl_fator) / verif_vl_fator_prod (itmvto.cd_produto) > 0
ORDER BY 1 ASC,
         8 ASC,
         9 ASC,
         10 ASC,
         13 ASC,
         6 ASC,
         12 ASC,
         MVTO.CD_AVISO_CIRURGIA,
         ITMVTO.CD_PRODUTO,
         ITMVTO.CD_FORNECEDOR