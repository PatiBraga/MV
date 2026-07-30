   SELECT
    tuss,
    convenio,
    CASE
        WHEN COUNT(*) OVER (PARTITION BY tuss, convenio) > 1 THEN 'Duplicado'
        ELSE 'Único'
    END AS status_duplicidade
FROM
    REPASSE_IMAGEM_SW
ORDER BY status_duplicidade;