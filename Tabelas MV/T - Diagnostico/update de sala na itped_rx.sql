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

