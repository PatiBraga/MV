-- Verificar sessões que estão usando a tabela (mesmo sem lock exclusivo)
SELECT
s.sid,
s.serial#,
s.username,
s.machine,
s.program,
s.sql_id,
q.sql_text
FROM v$session s
JOIN v$sql q ON s.sql_id = q.sql_id
WHERE UPPER(q.sql_text) LIKE '%PED_RX%';