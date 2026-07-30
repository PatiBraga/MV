-- Validação antes do UPDATE
SELECT cd_atendimento,
       sn_retorno
FROM atendime
WHERE cd_atendimento IN ('1129879', '1118949', '1123153', '1124186', '1132860');

-- UPDATE para definir sn_retorno como NULL

ALTER TRIGGER  MVINTEGRA.TRG_IMVW_SAI_ATENDIMENTO  DISABLE;
ALTER TRIGGER  MVINTEGRA.TRG_IMVW_OUT_ATENDIMENTO  DISABLE;
/*
UPDATE atendime
SET sn_retorno = NULL
WHERE cd_atendimento IN ('1118949', '1123153', '1124186');
*/
ALTER TRIGGER  MVINTEGRA.TRG_IMVW_SAI_ATENDIMENTO   ENABLE;
ALTER TRIGGER  MVINTEGRA.TRG_IMVW_OUT_ATENDIMENTO   ENABLE;

-- Validação após o UPDATE
SELECT cd_atendimento,
       sn_retorno
FROM atendime
WHERE cd_atendimento IN ('1129879', '1118949', '1123153', '1124186', '1132860');
/

SELECT *
FROM itreg_amb
WHERE cd_atendimento = 340120


SELECT *
FROM reg_amb
WHERE cd_reg_amb IN ('1011298', '1113509', '333041')


SELECT *
FROM dbamv.remessa_fatura
where  cd_remessa = 62292



                                      cd_reg_amb 333041


 lotdbamv.itcon_rece


SELECT * FROM remessa_fatura ;
-- nr_lote
-- sn_fechada









/
/*
UPDATE reg_amb
SET sn_fechada =
WHERE cd_atendimento = 340120;

