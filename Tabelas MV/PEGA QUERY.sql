/*pega query*/

SELECT to_char(substr(k.SQL_FULLTEXT, 1, 4000)) as teste,
       to_char(substr(k.SQL_FULLTEXT, 4001, 4000)) as teste2,
       to_char(substr(k.SQL_FULLTEXT, 8001, 4000)) as teste3,
       to_char(substr(k.SQL_FULLTEXT, 12001, 4000)) as teste4,
       Sql_Text,
       to_date(First_Load_Time, 'rrrr-mm-dd/hh24:mi:ss') First_Load_Time,
       Plsql_Exec_Time,
       Rows_Processed,
       Parsing_Schema_Name,
       MODULE,
       Action,
       Elapsed_Time,
       to_date(Last_Load_Time, 'rrrr-mm-dd/hh24:mi:ss') Last_Load_Time,
       Last_Active_Time
  FROM v$Sql k
 WHERE (k.Parsing_Schema_Name = 'LUCAS.CARVALHO' OR
       k.PARSING_SCHEMA_NAME IS NULL)
   AND to_date(First_Load_Time, 'rrrr-mm-dd/hh24:mi:ss') BETWEEN
       to_date(TRUNC(SYSDATE), 'dd/mm/rrrr') AND
       to_date(TRUNC(SYSDATE), 'dd/mm/rrrr') + 0.99999
 ORDER BY First_Load_Time DESC



              
              
              
              
              
              
              
              
 
              
              
              
             
              
              
              
              
              
