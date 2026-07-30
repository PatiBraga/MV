  SELECT
    cd_recurso_central AS "Código",
    ds_recurso_central AS "Descrição",
    CASE tp_recurso
        WHEN 'S' THEN 'SALA'
        WHEN 'E' THEN 'EQUIPAMENTO'
        WHEN 'P' THEN 'PRESTADOR'
        WHEN 'O' THEN 'OUTROS'
        ELSE tp_recurso
    END AS "Tipo de Recurso",
    CASE sn_ativo
        WHEN 'S' THEN 'ATIVO'
        WHEN 'N' THEN 'INATIVO'
        ELSE sn_ativo
    END AS "Situação",
    ds_sigla_agendamento AS "Sigla"
FROM dbamv.recurso_central
ORDER BY ds_recurso_central;
