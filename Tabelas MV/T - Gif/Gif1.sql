SELECT * FROM gif.log_auditoria_itens WHERE cd_conta = 1086204

SELECT * FROM dbamv.itreg_amb WHERE cd_reg_amb = 1086204


SELECT * FROM gif.log_auditoria_itens WHERE cd_conta = 106554



SELECT * FROM dbamv.reg_fat WHERE cd_reg_fat = 106554




SELECT * FROM audit_dbamv.itreg_fat WHERE cd_reg_fat = 106554


SELECT * FROM dbamv.log_itreg_fat_reg_lanc WHERE cd_reg_fat = 106554


SELECT * FROM gif.log_erro_item


1073378

SELECT * FROM dbamv.canc_itreg_fat
SELECT * FROM dbamv.itreg_fat_espelho

SELECT * FROM dbamv.itreg_fat_original WHERE cd_reg_fat = 106554

SELECT * FROM dbamv.itreg_fat_original WHERE cd_reg_fat = 1086204





SELECT
    timestamp,
    --db_user,
   -- os_user,
    terminal,
    action_name,
    sql_text
FROM
    dba_audit_trail
WHERE
    action_name = 'DELETE'
    AND owner = 'DBAMV'
    AND obj_name = 'ITREG_FAT'
ORDER BY
    timestamp DESC;