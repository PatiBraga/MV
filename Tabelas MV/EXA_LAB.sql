SELECT
       cd_exa_lab,
       nm_exa_lab,
       cd_pro_fat
  FROM EXA_LAB
WHERE nm_exa_lab LIKE 'IGA TOTAL%'   -- começa com TESTE
    OR nm_exa_lab LIKE 'IGA_%'    -- começa com LAB_
    OR nm_exa_lab LIKE '%_IGA';   -- termina com _OLD
/


SELECT
       cd_exa_lab,
       nm_exa_lab,
       cd_pro_fat
  FROM EXA_LAB
 WHERE UPPER(nm_exa_lab) LIKE UPPER('Hepatite%')
