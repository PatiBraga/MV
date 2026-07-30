SELECT *
FROM dbamv.itcoleta_sinal_vital
ORDER BY cd_atendimento desc
FETCH FIRST 10 ROWS ONLY;




WHERE cd_paciente = 330406
  AND status = 'ABERTO';


  SELECT table_name, column_name
FROM all_tab_columns
WHERE owner = 'DBAMV'  -- ou o seu schema específico
  AND column_name LIKE '%sinal%'  -- Para buscar colunas relacionadas a sinais vitais
  AND column_name LIKE '%temperatura%';  -- Para buscar colunas específicas de temperatura







