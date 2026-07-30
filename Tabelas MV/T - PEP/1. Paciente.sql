SELECT
    p.cd_paciente,
    p.nm_paciente,
    a.cd_atendimento,
    sv.ds_sinal_vital AS tipo_sinal,
    g.vl_medido AS valor_sinal,
    g.dt_afericao,
    g.hr_afericao,
    g.cd_prestador AS profissional_responsavel
FROM
    dbamv.paciente p
    JOIN dbamv.atendime a ON a.cd_paciente = p.cd_paciente
    JOIN dbamv.mvpep_tema_grafico_afericao g ON g.cd_atendimento = a.cd_atendimento
    JOIN dbamv.m_sinal_vital sv ON sv.cd_sinal_vital = g.cd_sinal_vital
WHERE
    a.tp_atendimento = 'I' -- somente pacientes internados
    AND a.dt_alta IS NULL   -- ainda internado (opcional)
ORDER BY
    p.nm_paciente,
    g.dt_afericao,
    g.hr_afericao;


SELECT * FROM paciente

SELECT * FROM


