    SELECT sysdate FROM dual;

-- _logRequisicao

SELECT
    FROM imv_log_requisicao
    WHERE nm_servico = 'LAUDO_EXAME_IMAGEM'
    AND dh_criacao BETWEEN To_Date('09/12/2025 00:00:00', 'dd/mm/yyyy hh24:mi:ss')
    AND To_Date('09/12/2025 23:59:59', 'dd/mm/yyyy hh24:mi:ss')
--  AND DBMS_LOB.INSTR(10, message, utl_raw.cast_to_raw('<codigoitemPedido>268011</>'), 1) > 0
ORDER BY 1 DESC;
/

SELECT *
FROM imv_log_requisicao
WHERE nm_servico = 'LAUDO_EXAME_IMAGEM'
-- AND dh_criacao_log BETWEEN TO_DATE('01/11/2025 00:00:00', 'DD/MM/YYYY HH24:MI:SS')
-- AND TO_DATE('30/11/2025 00:00:00', 'DD/MM/YYYY HH24:MI:SS')
 AND cd_imv_log_requisicao = '21506528'
ORDER BY dh_criacao_log DESC;
/
-- Query enviada pelo José (MV)
SELECT *
FROM imv_log_requisicao
WHERE nm_servico = 'LAUDO_EXAME_IMAGEM'
-- AND dh_criacao_log BETWEEN TO_DATE('01/11/2025 00:00:00', 'DD/MM/YYYY HH24:MI:SS')
-- AND TO_DATE('30/11/2025 00:00:00', 'DD/MM/YYYY HH24:MI:SS')
AND DBMS_LOB.INSTR(lo_mensagem, utl_raw.cast_to_raw('<codigoItemPedido>260810'), 1, 1) > 0
ORDER BY dh_criacao_log DESC;





SELECT * FROM dbamv.ped_rx WHERE cd_ped_rx = '210853';
/
SELECT *
FROM  dbamv.ped_rx
 by dt_pedido desc;
/

SELECT * FROM dbamv.itped_rx WHERE cd_ped_rx = '210853';
/

SELECT * FROM dbamv.laudo_rx WHERE cd_ped_rx ='210853';
/

SELECT cd_ped_rx, cd_laudo, cd_laudo_integra, sn_entregue, sn_assinado

FROM dbamv.laudo_rx
WHERE cd_ped_rx ='207004';

SELECT *
FROM dbamv.ent_psdi
ORDER BY dt_entrega DESC
/

SELECT PR.cd_ped_rx, -- Código pedido de Exame
       IT.cd_itped_rx, -- Código do Item do exame
       IT.cd_exa_rx, -- Exemplo: Código do Exame
       EX.ds_exa_rx,
       PR.cd_setor,
       IT.cd_laudo, --
       IT.dt_realizado --
  FROM dbamv.ped_rx PR
  JOIN dbamv.itped_rx IT ON PR.cd_ped_rx = IT.cd_ped_rx
  JOIN dbamv.exa_rx ex ON it.cd_exa_rx = ex.cd_exa_rx
 WHERE 1 = 1
   AND dt_pedido BETWEEN
       To_Date('01/11/2025 00:00:00', 'dd/mm/yyyy hh24:mi:ss') AND
       To_Date('30/11/2025 23:59:59', 'dd/mm/yyyy hh24:mi:ss')
   AND IT.cd_laudo IS NULL
   AND IT.dt_realizado IS NULL;
/

-- Query para validar se exames integram no MV
SELECT
       PR.cd_ped_rx, -- Código pedido de Exame
       IT.cd_itped_rx, -- Código do Item do exame
       IT.cd_exa_rx, -- Código do Exame
       EX.ds_exa_rx, -- Código do exame
       PR.cd_setor,  -- código do setor
       TO_CHAR(PR.dt_pedido, 'DD/MM/YYYY') AS dt_pedido, -- Data do Pedido
       IT.cd_laudo, -- Código do laudo
       IT.dt_realizado -- Data
  FROM dbamv.ped_rx PR
  JOIN dbamv.itped_rx IT ON PR.cd_ped_rx = IT.cd_ped_rx
  JOIN dbamv.exa_rx ex ON IT.cd_exa_rx = ex.cd_exa_rx
 WHERE 1 = 1
   AND PR.dt_pedido BETWEEN
       TO_DATE('01/12/2025 00:00:00', 'DD/MM/YYYY HH24:MI:SS') AND
       TO_DATE('11/12/2025 23:59:59', 'DD/MM/YYYY HH24:MI:SS')
   AND IT.cd_laudo IS NULL
   AND IT.dt_realizado IS NULL
   AND IT.cd_exa_rx NOT IN (1169, 797) -- Filtro para não trazer os códigos 1169 e 797
-- AND IT.cd_exa_rx != 1169 -- Filtro para não trazer o código 1169
-- AND PR.cd_setor IN (106, 184, 36); -- Filtro para setor 106, 184 ou 36
    ORDER BY dt_pedido DESC;
/

