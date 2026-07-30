-- query para tentar descobrir quem está com a solicitação em aberto

-- identificar quem está com o registro bloqueado verificando as tabelas de lock de sessão.

SELECT
    a.sid,
    a.serial#,
    a.username AS usuario_oracle,
    a.machine AS terminal,
    a.program AS aplicacao,
    b.object_name,
    b.object_type,
    c.cd_usuario,
    c.nm_usuario
FROM gv$session a
JOIN gv$locked_object l ON a.sid = l.session_id
JOIN dba_objects b ON l.object_id = b.object_id
LEFT JOIN DBASGU.USUARIOS c ON UPPER(a.username) = UPPER(c.CD_USUARIO)
WHERE b.object_name LIKE '%SOLSAI%'
   OR b.object_name LIKE '%MOVPROD%'
   OR b.object_name LIKE '%SOLIC%'
ORDER BY a.logon_time DESC;