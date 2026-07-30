SELECT *
FROM dbamv.itcoleta_sinal_vital
WHERE
ORDER BY cd_coleta_sinal_vital desc
FETCH FIRST 10 ROWS ONLY;
/


SELECT * FROM paciente
WHERE cd_paciente = 62861
  AND status = 'ABERTO';
/

SELECT * FROM  dbamv.pw_documento_clinico  WHERE cd_paciente = '62861' AND tp_status = 'ABERTO';
/


SELECT * FROM pw_editor_clinico WHERE CD_DOCUMENTO_CLINICO = 7855884;
/


  SELECT table_name, column_name
FROM all_tab_columns
WHERE owner = 'DBAMV'  -- ou o seu schema específico
  AND column_name LIKE '%sinal%'  -- Para buscar colunas relacionadas a sinais vitais
  AND column_name LIKE '%temperatura%';  -- Para buscar colunas específicas de temperatura
/


SELECT * FROM dbamv.pw_log_documento_clinico
            WHERE nm_paciente = 'GABRIEL DIAS CHAVONI'

      --  WHERE cd_usuario = 'BRUNO.PAULA'     -- 'JANAINA.CARVALHO'
ORDER BY dh_processo DESC





 WHERE cd_documento_clinico = '7880928';


