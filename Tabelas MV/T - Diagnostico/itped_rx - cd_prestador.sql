SELECT *
FROM itped_rx
WHERE cd_ped_rx = '212361';


UPDATE itped_rx
SET cd_prestador = '3553'
WHERE cd_ped_rx = '212361' AND cd_exa_rx = '1108';



SELECT * FROM itped_rx
WHERE cd_ped_rx = 212361 AND cd_exa_rx = 847;


SELECT cd_prestador
FROM itped_rx
WHERE cd_ped_rx = 128643 AND cd_exa_rx = 847;


ALTER TRIGGER mvintegra.trg_imvw_sai_itsolic_psdi DISABLE;

UPDATE itped_rx
SET cd_prestador = 2263
WHERE cd_ped_rx = 128643 AND cd_exa_rx = 847;


COMMIT;
ALTER TRIGGER mvintegra.trg_imvw_sai_itsolic_psdi ENABLE;