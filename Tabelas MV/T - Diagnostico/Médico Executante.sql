SELECT * FROM itped_rx
WHERE cd_ped_rx = 131741


ALTER TRIGGER mvintegra.trg_imvw_sai_itsolic_psdi DISABLE;

UPDATE itped_rx SET cd_prestador = 2947 WHERE cd_ped_rx = 131741;

COMMIT;
ALTER TRIGGER mvintegra.trg_imvw_sai_itsolic_psdi ENABLE;

__________________________________________________________________________________________________________________

SELECT * FROM itped_rx
WHERE cd_ped_rx = 128643 AND cd_exa_rx = 847;


SELECT cd_prestador 
FROM itped_rx
WHERE cd_ped_rx = 128643 AND cd_exa_rx = 847;
 
ALTER TRIGGER mvintegra.trg_imvw_sai_itsolic_psdi DISABLE;

UPDATE itped_rx SET cd_prestador = 2263 WHERE cd_ped_rx = 128643 AND cd_exa_rx = 847;


COMMIT;
ALTER TRIGGER mvintegra.trg_imvw_sai_itsolic_psdi ENABLE;

___________________________________________________________________________________________________________________

-- PEDIDO 135150
SELECT * FROM PED_RX
WHERE CD_PED_RX = 135150;

SELECT * FROM ITPED_RX
WHERE CD_PED_RX = 135150;

ALTER TRIGGER mvintegra.trg_imvw_sai_itsolic_psdi DISABLE;

--ALTER TRIGGER mvintegra.prc_imvw_sai_itsolic_psdi DISABLE;

UPDATE itped_rx SET cd_recurso = 8 WHERE cd_itped_rx = 170073;

UPDATE itped_rx SET cd_prestador = 2845 WHERE cd_itped_rx = 170073;

COMMIT;

ALTER TRIGGER mvintegra.trg_imvw_sai_itsolic_psdi ENABLE;


