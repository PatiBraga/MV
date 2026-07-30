SELECT * FROM audit_dbamv.itreg_fat;
/
SELECT * FROM audit_dbamv.reg_fat
WHERE ROWNUM <= 10
ORDER BY cd_reg_fat DESC;
/
SELECT * FROM audit_dbamv.atendime
WHERE ROWNUM <= 10
ORDER BY cd_atendimento DESC;
/