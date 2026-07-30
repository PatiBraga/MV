SELECT
    p.cd_paciente,
    p.nm_paciente,
    a.cd_atendimento,
    CASE
        WHEN a.tp_atendimento = 'I' THEN 'Internação'
        ELSE a.tp_atendimento
    END AS tp_atendimento,
     TO_CHAR(a.dt_atendimento, 'DD/MM/YYYY') AS dt_atendimento,
    d.cd_cid,
    c.ds_cid
FROM
    dbamv.paciente p
JOIN
    dbamv.atendime a ON a.cd_paciente = p.cd_paciente
JOIN
    dbamv.diagnostico_atendime d ON a.cd_atendimento = d.cd_atendimento
JOIN
    cid c ON d.cd_cid = c.cd_cid
WHERE
     a.tp_atendimento = 'I'
    AND d.cd_cid IN ('C71', 'C72', 'C79', 'C73', 'C793')
    AND a.dt_atendimento BETWEEN TO_DATE('01-01-2024 00:00:00', 'DD-MM-YYYY HH24:MI:SS')
                             AND TO_DATE('31-12-2024 23:59:59', 'DD-MM-YYYY HH24:MI:SS')
ORDER BY
    a.dt_atendimento DESC;

