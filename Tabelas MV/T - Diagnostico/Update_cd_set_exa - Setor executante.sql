SELECT *
FROM dbamv.ped_rx
WHERE cd_atendimento = 1151326;
/

SELECT *
FROM itped_rx
WHERE cd_ped_rx = 233679
/

SELECT cd_set_exa
FROM ped_rx
WHERE cd_atendimento = 1150896
/
SELECT *
FROM atendime
WHERE cd_atendimento = 1151326
/

UPDATE dbamv.ped_rx
SET cd_set_exa = 41
WHERE cd_atendimento = 1150896 AND cd_ped_rx = 233473

--------------------------------------------------------------------------------------------------------------------------