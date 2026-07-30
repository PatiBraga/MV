   SELECT
    tuss,
    convenio,
    vl_total,
    CASE
        WHEN COUNT(*) OVER (PARTITION BY tuss, convenio, vl_total) > 1 THEN 'Duplicado'
        ELSE 'Único'
    END AS status_duplicidade
FROM
    REPASSE_IMAGEM_SW;

/

SELECT
    tuss,
    convenio,
    vl_total,
    COUNT(*) AS count_duplicates
FROM
    REPASSE_IMAGEM_SW
GROUP BY
    tuss,
    convenio,
    vl_total
HAVING
    COUNT(*) > 1;

/

SELECT
    tuss,
    convenio,
    vl_total,
    CASE
        WHEN COUNT(*) OVER (PARTITION BY tuss) > 1 THEN 'Duplicado'
        ELSE 'Único'
    END AS status_duplicidade
FROM
    REPASSE_IMAGEM_SW;


/

SELECT
    tuss,
    convenio,
  --  vl_total,
    CASE
        WHEN COUNT(*) OVER (PARTITION BY convenio, tuss) > 1 THEN 'Duplicado'
        ELSE 'Único'
    END AS status_duplicidade
FROM
    REPASSE_IMAGEM_SW;


/

SELECT
    tuss,
    convenio,
    vl_total,
    CASE
        WHEN COUNT(*) OVER (PARTITION BY convenio, tuss) > 1 THEN 'Duplicado'
        ELSE 'Único'
    END AS status_duplicidade
FROM
    REPASSE_IMAGEM_SW;

/

SELECT
    convenio,
    tuss,
    COUNT(*) AS count_duplicates
FROM
    REPASSE_IMAGEM_SW
GROUP BY
    convenio, tuss
HAVING
    COUNT(*) > 1;

/
SELECT
    convenio,
    tuss,
    COUNT(*) OVER (PARTITION BY convenio, tuss) AS count_duplicates,
    CASE
        WHEN COUNT(*) OVER (PARTITION BY convenio, tuss) > 1 THEN 'Duplicado'
        ELSE 'Único'
    END AS status_duplicidade
FROM
    REPASSE_IMAGEM_SW;
