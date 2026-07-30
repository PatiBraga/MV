SELECT
   p.nm_paciente,
   p.cd_paciente,
   a.dt_atendimento,
   a.tp_atendimento,
   a.cd_cid
   --   a.*,

FROM atendime a
INNER JOIN paciente p ON p.cd_paciente = a.cd_paciente
WHERE a.cd_cid     = 'I670'
  AND a.tp_atendimento = 'I'
  AND a.dt_atendimento >= TO_DATE('01/01/2016', 'DD/MM/YYYY')
ORDER BY a.dt_atendimento, p.nm_paciente ASC
FETCH FIRST 100 ROWS ONLY;
