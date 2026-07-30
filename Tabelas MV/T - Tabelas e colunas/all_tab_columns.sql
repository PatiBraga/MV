SELECT table_name, column_name
FROM all_tab_columns
WHERE owner = 'DBAMV'  -- Ou o seu schema específico
  AND column_name LIKE '%sinal%'  -- Para buscar sinais vitais
  AND column_name LIKE '%status%';  -- Para verificar colunas relacionadas ao status
