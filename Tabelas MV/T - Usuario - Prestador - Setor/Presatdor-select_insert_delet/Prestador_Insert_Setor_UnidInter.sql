INSERT INTO USUARIO_UNID_INT (CD_ID_USUARIO, CD_UNID_INT, CD_SETOR)
SELECT
    v.CD_USUARIO,
    v.CD_UNID_INT,
    v.CD_SETOR
FROM (
    WITH SetoresNecessarios AS (
        SELECT 31 AS CD_SETOR, 9 AS CD_UNID_INT FROM DUAL UNION ALL
        SELECT 32, 7 FROM DUAL UNION ALL
        SELECT 34, 8 FROM DUAL UNION ALL
        SELECT 37, 1 FROM DUAL UNION ALL
        SELECT 38, 2 FROM DUAL UNION ALL
        SELECT 39, 6 FROM DUAL UNION ALL
        SELECT 36, 10 FROM DUAL UNION ALL
        SELECT 107, 11 FROM DUAL UNION ALL
        SELECT 139, 13 FROM DUAL
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
            s.CD_UNID_INT,
            s.CD_SETOR
        FROM TodosUsuarios m
        CROSS JOIN SetoresNecessarios s
    ),
    Verificacao AS (
        SELECT
            p.CD_USUARIO,
            p.CD_UNID_INT,
            p.CD_SETOR,
            pcs.CD_USUARIO AS EXISTE
        FROM Possibilidades p
        LEFT JOIN PrestadorComSetores pcs
            ON p.CD_USUARIO = pcs.CD_USUARIO AND p.CD_SETOR = pcs.CD_SETOR
    )
    SELECT
        CD_USUARIO,
        CD_UNID_INT,
        CD_SETOR
    FROM Verificacao
    WHERE EXISTE IS NULL
) v;
