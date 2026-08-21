SELECT *
FROM  ped_rx
WHERE cd_ped_rx = 242172
/


SELECT  *
FROM  itped_rx
WHERE cd_ped_rx = 242172
/



ALTER TRIGGER mvintegra.trg_imvw_sai_itsolic_psdi DISABLE;

UPDATE itped_rx
SET cd_recurso = 21
WHERE cd_ped_rx = 242172
AND cd_exa_rx = 1137;

ALTER TRIGGER mvintegra.trg_imvw_sai_itsolic_psdi ENABLE;
/

-- Validar o status da trigger pela view ALL_TRIGGERS:
 SELECT
    OWNER,
    TRIGGER_NAME,
    TABLE_OWNER,
    TABLE_NAME,
    STATUS,
    TRIGGERING_EVENT,
    TRIGGER_TYPE
FROM ALL_TRIGGERS
WHERE OWNER = 'MVINTEGRA'
  AND TRIGGER_NAME = 'TRG_IMVW_SAI_ITSOLIC_PSDI';
/

-- Caso esteja conectado com o proprietário da trigger (MVINTEGRA), também pode utilizar:
SELECT
    TRIGGER_NAME,
    TABLE_NAME,
    STATUS
FROM USER_TRIGGERS
WHERE TRIGGER_NAME = 'TRG_IMVW_SAI_ITSOLIC_PSDI';

