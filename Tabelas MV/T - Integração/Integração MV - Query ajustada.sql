SELECT
       PR.cd_ped_rx, -- Código pedido de Exame
       IT.cd_itped_rx, -- Código do Item do exame
       IT.cd_exa_rx, -- Código do Exame
       EX.ds_exa_rx, -- Código do exame
  --   ME.cd_modalidade_exame, -- Código Modalidade
       DM.ds_modalidade_exame, -- Descrição de exame
       PR.cd_setor,  -- código do setor
       TO_CHAR(PR.dt_pedido, 'DD/MM/YYYY') AS dt_pedido, -- Data do Pedido
       IT.cd_laudo, -- Código do laudo
       IT.dt_realizado
  FROM dbamv.ped_rx PR
  JOIN dbamv.itped_rx IT ON PR.cd_ped_rx = IT.cd_ped_rx
  JOIN dbamv.exa_rx ex ON IT.cd_exa_rx = ex.cd_exa_rx
  JOIN dbamv.exa_rx me ON IT.cd_exa_rx = ME.cd_exa_rx
  JOIN dbamv.modalidade_exame DM ON  me.cd_modalidade_exame = dm.cd_modalidade_exame
 WHERE 1 = 1
   AND PR.dt_pedido BETWEEN
       TO_DATE('01/11/2025 00:00:00', 'DD/MM/YYYY HH24:MI:SS') AND
       TO_DATE('30/11/2025 23:59:59', 'DD/MM/YYYY HH24:MI:SS')
   AND IT.cd_laudo IS NULL
   AND IT.dt_realizado IS NULL
   AND IT.cd_exa_rx NOT IN (1169, 797, 1173, 1158, 1087, 1079, 1071, 1069, 1034, 1008, 799, 796) -- Filtro para não trazer os códigos 1169 e 797
-- AND IT.cd_exa_rx != 1169 -- Filtro para não trazer o código 1169
-- AND PR.cd_setor IN (106, 184, 36); -- Filtro para setor 106, 184 ou 36
-- ORDER BY dt_pedido DESC;
   ORDER BY cd_exa_rx;
