WITH SetoresNecessarios AS (
    SELECT 136 AS CD_SETOR FROM DUAL UNION ALL
    SELECT 139 FROM DUAL UNION ALL
    SELECT 161 FROM DUAL UNION ALL
    SELECT 32 FROM DUAL UNION ALL
    SELECT 34 FROM DUAL UNION ALL
    SELECT 36 FROM DUAL UNION ALL
    SELECT 38 FROM DUAL UNION ALL
    SELECT 39 FROM DUAL UNION ALL
    SELECT 32 FROM DUAL UNION ALL
    SELECT 31 FROM DUAL UNION ALL
    SELECT 137 FROM DUAL
),
FiltroSetores AS (
    -- Se quiser filtrar apenas por um setor específico, descomente a linha abaixo:
    -- SELECT 161 AS CD_SETOR FROM DUAL
    SELECT * FROM SetoresNecessarios
),
PrestadorComSetores AS (
    SELECT
        usu.CD_USUARIO,
        usu.NM_USUARIO,
        int.CD_SETOR
    FROM PRESTADOR prest
    INNER JOIN USUARIOS usu
        ON prest.CD_PRESTADOR = usu.CD_PRESTADOR
    INNER JOIN USUARIO_UNID_INT int
        ON int.CD_ID_USUARIO = usu.CD_USUARIO
    WHERE prest.CD_TIP_PRESTA = '8' AND prest.TP_SITUACAO = 'A'
),
TodosUsuarios AS (
    SELECT DISTINCT CD_USUARIO, NM_USUARIO FROM PrestadorComSetores
),
Possibilidades AS (
    SELECT
        m.CD_USUARIO,
        m.NM_USUARIO,
        s.CD_SETOR
    FROM TodosUsuarios m
    CROSS JOIN FiltroSetores s
),
Verificacao AS (
    SELECT
        p.CD_USUARIO,
        p.NM_USUARIO,
        p.CD_SETOR,
        ms.CD_USUARIO AS EXISTE
    FROM Possibilidades p
    LEFT JOIN PrestadorComSetores ms
        ON p.CD_USUARIO = ms.CD_USUARIO AND p.CD_SETOR = ms.CD_SETOR
),
SetoresFaltantes AS (
    SELECT
        v.CD_USUARIO,
        v.NM_USUARIO,
        v.CD_SETOR
    FROM Verificacao v
    WHERE v.EXISTE IS NULL
),
SetoresAtendidos AS (
    SELECT
        v.CD_USUARIO,
        v.NM_USUARIO,
        v.CD_SETOR
    FROM Verificacao v
    WHERE v.EXISTE IS NOT NULL
)

SELECT
    m.CD_USUARIO,
    m.NM_USUARIO,
    NVL(LISTAGG(DISTINCT sf.CD_SETOR, ', ') WITHIN GROUP (ORDER BY sf.CD_SETOR), 'Nenhum') AS SETORES_FALTANTES,
    NVL(LISTAGG(DISTINCT sa.CD_SETOR, ', ') WITHIN GROUP (ORDER BY sa.CD_SETOR), 'Nenhum') AS SETORES_ATENDIDOS,
    COUNT(DISTINCT sf.CD_SETOR) AS TOTAL_SETORES_FALTANTES,
    CASE
        WHEN COUNT(DISTINCT sf.CD_SETOR) = 0 THEN 'Completo'
        ELSE '? Incompleto'
    END AS SITUACAO
FROM
    TodosUsuarios m
LEFT JOIN SetoresFaltantes sf ON m.CD_USUARIO = sf.CD_USUARIO
LEFT JOIN SetoresAtendidos sa ON m.CD_USUARIO = sa.CD_USUARIO
GROUP BY
    m.CD_USUARIO, m.NM_USUARIO
ORDER BY
    m.NM_USUARIO;
