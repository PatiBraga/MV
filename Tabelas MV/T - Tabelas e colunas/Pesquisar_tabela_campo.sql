SELECT table_name, column_name
FROM all_tab_columns
WHERE owner = 'DBAMV'
 AND upper(column_name) LIKE upper('%CD_PED_RX')
ORDER BY table_name, column_id;