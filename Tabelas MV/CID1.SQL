SELECT
    p.nm_paciente,
    p.cd_paciente,
    TO_CHAR(a.dt_atendimento, 'DD/MM/YYYY')        AS dt_atendimento,
--    TO_CHAR(a.dt_atendimento, 'HH24:MI:SS')        AS hr_atendimento,
    CASE a.tp_atendimento
        WHEN 'I' THEN 'Internado'
    END AS tp_atendimento,
    a.cd_cid

FROM atendime a
INNER JOIN paciente p ON p.cd_paciente = a.cd_paciente

WHERE a.cd_cid          = 'I670'
  AND a.tp_atendimento  = 'I'
  AND a.dt_atendimento >= TO_DATE('01/01/2016', 'DD/MM/YYYY')

ORDER BY a.dt_atendimento ASC, p.nm_paciente ASC;