-- Inclusão de sala e médico executante
-- Consulta de validação prévia do registro
SELECT cd_recurso, cd_prestador
FROM itped_rx
WHERE cd_ped_rx = 238165;
/

-- Desabilitar a trigger
ALTER TRIGGER MVINTEGRA.TRG_IMVW_SAI_ITSOLIC_PSDI DISABLE;

-- Atualização do recurso e prestador vinculados ao pedido
UPDATE itped_rx
SET
  cd_recurso   = 25,        -- Código do recurso
  cd_prestador = 3651      -- Código do prestador
WHERE cd_ped_rx = 238165;

-- Habilitar a trigger
ALTER TRIGGER MVINTEGRA.TRG_IMVW_SAI_ITSOLIC_PSDI ENABLE;


-- Validação pós-atualização
SELECT *
FROM itped_rx
WHERE cd_ped_rx = 236324;

----------------------------------------------------------------
-- Delete do exame
-- Consulta de validação prévia do registro -
SELECT *
FROM ped_rx
WHERE cd_atendimento = 1159695
  AND cd_ped_rx = 238191;
/

SELECT *
FROM itped_rx
WHERE cd_ped_rx = 238191;
/

ALTER TRIGGER MVINTEGRA.TRG_IMVW_SAI_ITSOLIC_PSDI DISABLE;
ALTER TRIGGER DBAMV.TRG_ITPED_RX_LOG_EXCLUSAO DISABLE;

DELETE FROM ITPED_RX
WHERE CD_PED_RX = 238191
AND CD_EXA_RX = 1110;

ALTER TRIGGER MVINTEGRA.TRG_IMVW_SAI_ITSOLIC_PSDI enable;
ALTER TRIGGER DBAMV.TRG_ITPED_RX_LOG_EXCLUSAO enable;

/

-------------------------------------------------------------------------
-- Delete do pedido
-- Desabilitar trigger de integração
ALTER TRIGGER MVINTEGRA.TRG_IMVW_SAI_ITSOLIC_PSDI DISABLE;

-- Exclusão do pedido
DELETE FROM ped_rx
WHERE cd_atendimento = 1159695
  AND cd_ped_rx = 238191;

-- Reabilitar trigger de integração
ALTER TRIGGER MVINTEGRA.TRG_IMVW_SAI_ITSOLIC_PSDI ENABLE;

-- Validação pós-exclusão
SELECT *
FROM ped_rx
WHERE cd_atendimento = 1159695
  AND cd_ped_rx = 238191;


