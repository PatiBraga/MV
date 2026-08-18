SELECT
    p.cd_paciente AS "Código Paciente",
    p.nm_paciente AS "Nome Paciente",
    a.cd_atendimento "Código Paciente",
    CASE
        WHEN a.tp_atendimento = 'I' THEN 'Internação'
        WHEN a.tp_atendimento = 'A' THEN 'Ambulatório'
        WHEN a.tp_atendimento = 'U' THEN 'Urgência'
        ELSE a.tp_atendimento AS "Tipo atendimento"
    END AS tp_atendimento,
    TO_CHAR(a.dt_atendimento, 'DD/MM/YYYY') AS dt_atendimento AS "Data Atendimento" ,
    d.cd_cid AS "Código CID",
    c.ds_cid AS "Descrição CID"
FROM paciente p
JOIN atendime a
    ON a.cd_paciente = p.cd_paciente
JOIN dbamv.diagnostico_atendime d
    ON d.cd_atendimento = a.cd_atendimento
JOIN cid c
    ON c.cd_cid = d.cd_cid
WHERE UPPER(TRIM(d.cd_cid)) LIKE 'G36%'
ORDER BY
    a.dt_atendimento DESC;




/*
Com filtros adicionais
Para filtrar apenas Internação, CIDs específicos e período, inclua as condições com AND:

WHERE UPPER(TRIM(d.cd_cid)) LIKE 'G36%'
  AND a.tp_atendimento = 'I'
  AND d.cd_cid IN ('C71', 'C72', 'C79', 'C73', 'C793')
  AND a.dt_atendimento >= TO_DATE('01/01/2024', 'DD/MM/YYYY')
  AND a.dt_atendimento <  TO_DATE('01/01/2025', 'DD/MM/YYYY')
*/
