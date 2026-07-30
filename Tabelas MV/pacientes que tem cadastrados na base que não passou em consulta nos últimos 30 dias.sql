-- pacientes que tem cadastrados na base que não passou em consulta nos últimos 30 dias


SELECT p.cd_paciente,
       p.nm_paciente
FROM   paciente p
WHERE  NOT EXISTS (
          SELECT 1
          FROM   atendime a
          WHERE  a.cd_paciente = p.cd_paciente
          AND    a.dt_atendimento   >= TRUNC(SYSDATE) - 30
       );