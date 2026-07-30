  -- Validação antes do UPDATE
SELECT *
FROM atendime
WHERE cd_atendimento IN ('112235', '340120');
/

SELECT *
FROM reg_amb
ORDER BY cd_reg_amb desc
FETCH FIRST 500 ROWS ONLY;
WHERE cd_atendimento = 340120
/

SELECT *
FROM reg_amb
WHERE cd_reg_amb = 333041



/
UPDATE reg_amb
SET sn_fechada = 'S'
WHERE cd_reg_amb = 333041 AND cd_remessa = 62292;

-
SELECT *
FROM remessa_fatura
WHERE cd_remessa = 62292



SELECT *
FROM con_rec
WHERE cd_remessa = 62292



SELECT *
FROM reg_amb
WHERE cd_reg_amb IN ('1011298', '1113509', '333041')


SELECT *
FROM dbamv.remessa_fatura
where  cd_remessa = 62292


fatura



SELECT * FROM remessa_fatura ;
-- nr_lote
-- sn_fechada









/


