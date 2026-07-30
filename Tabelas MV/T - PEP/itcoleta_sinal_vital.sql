SELECT * FROM dbamv.itcoleta_sinal_vital;
/


SELECT *
FROM dbamv.itcoleta_sinal_vital
WHERE  cd_coleta_sinal_vital = '2138884';
-- ORDER BY cd_coleta_sinal_vital desc
-- FETCH FIRST 10 ROWS ONLY;
/


SELECT * FROM sinal_vital
/


SELECT * FROM dbamv.coleta_sinal_vital
WHERE cd_atendimento = '1087527';
/


SELECT pre_med.ds_evolucao FROM dbamv.pre_med
/


SELECT * FROM dbamv.pre_med
WHERE cd_atendimento = '1089921';
/


SELECT ds_evolucao
FROM pre_med , atendime
WHERE
-- atendime.cd_atendimento = pre_med.cd_atendimento
-- AND
atendime.cd_atendimento = 1089921
AND ds_evolucao IS NOT NULL
AND ROWNUM = 1
ORDER BY dt_pre_med DESC

