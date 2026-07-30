-- Consulta de validação prévia do registro para delete do item do pedido

SELECT *
FROM itped_rx
WHERE cd_ped_rx = 236327;
/

ALTER TRIGGER MVINTEGRA.TRG_IMVW_SAI_ITSOLIC_PSDI DISABLE;
ALTER TRIGGER DBAMV.TRG_ITPED_RX_LOG_EXCLUSAO DISABLE;

DELETE FROM ITPED_RX
WHERE CD_PED_RX = 236327  
AND CD_EXA_RX = 296;

ALTER TRIGGER MVINTEGRA.TRG_IMVW_SAI_ITSOLIC_PSDI enable;
ALTER TRIGGER DBAMV.TRG_ITPED_RX_LOG_EXCLUSAO enable;
/

-- Consulta de validação prévia do registro delete pedido
SELECT *
FROM ped_rx
WHERE cd_atendimento = 1156038
  AND cd_ped_rx = 236327;
/

-- Exclusão do pedido
DELETE FROM ped_rx
WHERE cd_atendimento = 1156038
  AND cd_ped_rx = 236327;
/


-- Validação pós-exclusão
SELECT *
FROM ped_rx
WHERE cd_atendimento = 1156038
/

-- Consulta de validação prévia do registro
SELECT * 
FROM itped_rx
WHERE cd_ped_rx = 236324;

-- Atualização do recurso e prestador vinculados ao pedido
UPDATE itped_rx
SET
  cd_recurso   = 8,        -- Código do recurso
  cd_prestador = 2846      -- Código do prestador
WHERE cd_ped_rx = 236324;

-- Validação pós-atualização
SELECT * 
FROM itped_rx
WHERE cd_ped_rx = 236324;


/
SELECT
    owner         AS schema,
    trigger_name,
    status,
    table_name,
    trigger_type,
    triggering_event
FROM dba_triggers
WHERE (owner = 'MVINTEGRA' AND trigger_name = 'TRG_IMVW_SAI_ITSOLIC_PSDI')
   OR (owner = 'DBAMV'     AND trigger_name = 'TRG_ITPED_RX_LOG_EXCLUSAO')
ORDER BY owner, trigger_name;
