SELECT
    p.cd_paciente AS "Cód. Paciente",
    p.nm_paciente AS "Nome Paciente",
    a.cd_atendimento AS "Cód. Atendimento",
       CASE
          WHEN a.tp_atendimento = 'I' THEN 'Internação'  -- Converte 'I' para 'INTERNAMENTO'
          ELSE a.tp_atendimento
    END AS "Tipo atendimento",
    TO_CHAR(a.dt_atendimento, 'DD/MM/YYYY') AS dt_atendimento,
    c.cd_cid AS "Cód. Cid",
    c.ds_cid AS "Desc. Cid"
FROM
    atendime a
JOIN
    paciente p ON a.cd_paciente = p.cd_paciente
JOIN
    cid c ON a.cd_cid = c.cd_cid
WHERE
    a.tp_atendimento = 'I'  -- Filtro para atendimentos do tipo 'Internação'
    AND c.cd_cid IN ('C71', 'C72', 'C79', 'C73', 'C793')  -- Descomentando se necessário filtrar pelos CIDs
  --  AND c.cd_cid LIKE 'C%'  -- Inclui todos os CIDs que começam com 'C'
    AND a.dt_atendimento BETWEEN TO_DATE('01-01-2024 00:00:00', 'DD-MM-YYYY HH24:MI:SS')
                             AND TO_DATE('31-12-2024 23:59:59', 'DD-MM-YYYY HH24:MI:SS')
ORDER BY
    a.dt_atendimento DESC
-- FETCH FIRST 100 ROWS ONLY;



