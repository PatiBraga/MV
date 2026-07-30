INSERT INTO USUARIO_UNID_INT (CD_ID_USUARIO, CD_SETOR)
SELECT
    v.CD_USUARIO,
    v.CD_SETOR
FROM (
    WITH SetoresNecessarios AS (
        SELECT 139 AS CD_SETOR FROM DUAL UNION ALL
        -- SELECT 137 FROM DUAL UNION ALL
        -- SELECT 136 FROM DUAL UNION ALL
        -- SELECT 174 FROM DUAL UNION ALL
        -- SELECT 175 FROM DUAL UNION ALL
        -- SELECT 176 FROM DUAL UNION ALL
        -- SELECT 177 FROM DUAL UNION ALL
        SELECT 161 FROM DUAL

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
        CROSS JOIN SetoresNecessarios s
    ),
    Verificacao AS (
        SELECT
            p.CD_USUARIO,
            p.CD_SETOR,
            ms.CD_USUARIO AS EXISTE
        FROM Possibilidades p
        LEFT JOIN PrestadorComSetores ms
            ON p.CD_USUARIO = ms.CD_USUARIO AND p.CD_SETOR = ms.CD_SETOR
    )
    SELECT
        CD_USUARIO,
        CD_SETOR
    FROM Verificacao
    WHERE EXISTE IS NULL
) v;