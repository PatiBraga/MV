SELECT s.sid,
       s.serial#,
       s.username,
       s.osuser,
       s.status AS session_status,
       s.machine,
       s.program,
       ss.sql_text,
       s.sql_id,
       s.event AS waiting_event,
       w.sid AS blocking_sid,
       w.serial# AS blocking_serial,
       NVL('Blocked by ' || TO_CHAR(w.sid), 'No blocking session') AS block_status,
       ROUND(s.last_call_et / 60, 2) AS elapsed_time_minutes,
       'ALTER SYSTEM KILL SESSION ''' || s.sid || ',' || s.serial# ||
       ''' IMMEDIATE;' AS kill_session_sql,
       'alter system kill session ''' || s.sid || ',' || s.serial# || ',@' ||
       s.inst_id || ''' immediate' comando_RAC
FROM gv$session s
LEFT JOIN v$sql ss
       ON s.sql_id = ss.sql_id
LEFT JOIN gv$session w
       ON s.blocking_session = w.sid
WHERE s.username IS NOT NULL
  AND s.status = 'ACTIVE'
  and s.USERNAME not in ('DBAMV', 'ACESSOPRD', 'SYSRAC', 'SYS', 'GH_CDS')
  AND s.sql_id IS NOT NULL
ORDER BY elapsed_time_minutes DESC;