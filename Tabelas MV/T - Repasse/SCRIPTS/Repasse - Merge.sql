SELECT *
FROM REPASSE_IMAGEM_SW
WHERE tuss IN ('40901181', '40901190', '40901475', '40901459', '40901394', '40901408', '40901513', '40901416', '40901424')
  AND convenio = '8'
ORDER BY tuss;

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


MERGE INTO REPASSE_IMAGEM_SW T
USING (
    SELECT '40901181' AS TUSS, 8 AS CONVENIO, 82.76 AS vl_total FROM DUAL UNION ALL
    SELECT '40901173', 8, 78.92 FROM DUAL UNION ALL
    SELECT '40901130', 8, 94.00 FROM DUAL UNION ALL
    SELECT '40901122', 8, 131.07 FROM DUAL UNION ALL
    SELECT '40901769', 8, 82.07 FROM DUAL UNION ALL
    SELECT '40901220', 8, 79.00 FROM DUAL
) S
ON (T.TUSS = S.TUSS AND T.CONVENIO = S.CONVENIO)
WHEN MATCHED THEN
    UPDATE SET
        T.vl_total = S.vl_total
WHEN NOT MATCHED THEN
    INSERT (TUSS, CONVENIO, vl_total)
    VALUES (S.TUSS, S.CONVENIO, S.vl_total);

COMMIT;


----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


MERGE INTO REPASSE_IMAGEM_SW T
USING (
    SELECT '40901181' AS tuss, 8 AS convenio,  82.76  AS vl_total FROM DUAL UNION ALL
    SELECT '40901173'        , 8          , 78.92               FROM DUAL UNION ALL
    SELECT '40901459'        , 8          , 264.35               FROM DUAL UNION ALL
    SELECT '40901394'        , 8          , 202.66               FROM DUAL UNION ALL
    SELECT '40901408'        , 8          , 192.59               FROM DUAL UNION ALL
    SELECT '40901513'        , 8          , 154.36               FROM DUAL UNION ALL
    SELECT '40901130'        , 8          , 94.00               FROM DUAL
) S
ON (T.tuss = S.tuss AND T.convenio = S.convenio)
WHEN MATCHED THEN
    UPDATE SET
        T.vl_total = S.vl_total
WHEN NOT MATCHED THEN
    INSERT (tuss, convenio, vl_total)
    VALUES (S.tuss, S.convenio, S.vl_total);

COMMIT;

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Alterar somente um convenio 

MERGE INTO REPASSE_IMAGEM_SW T
USING (
    SELECT '40901769' AS tuss, 5 AS convenio, 78.92 AS vl_total FROM DUAL
) S
ON (T.tuss = S.tuss AND T.convenio = S.convenio)
WHEN MATCHED THEN
    UPDATE SET
        T.vl_total = S.vl_total
WHEN NOT MATCHED THEN
    INSERT (tuss, convenio, vl_total)
    VALUES (S.tuss, S.convenio, S.vl_total);

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Validar alterações 

SELECT *
FROM REPASSE_IMAGEM_SW
WHERE tuss = '40901769' 
  AND convenio = '5'
ORDER BY tuss;

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT *
FROM REPASSE_IMAGEM_SW
WHERE tuss IN ('40901181', '40901173', '40901130')
  AND convenio = '8'
ORDER BY tuss;


----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT *
FROM REPASSE_IMAGEM_SW
WHERE convenio

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT *
FROM convenio
WHERE nm_convenio LIKE '%AMIL%'
ORDER BY  cd_convenio;

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Query pronta 10/02/2026

MERGE INTO REPASSE_IMAGEM_SW T
USING (
    SELECT '41001435' AS tuss, 3  AS convenio, 244.82 AS vl_total FROM DUAL UNION ALL
    SELECT '41001451'        , 3              , 244.82            FROM DUAL UNION ALL
    SELECT '41101308'       , 3              , 471.59            FROM DUAL UNION ALL
    SELECT '40901203'        , 78             , 167.56            FROM DUAL UNION ALL
    SELECT '41101537'        , 16             , 530.70            FROM DUAL UNION ALL
    SELECT '41101545'        , 16             , 530.70            FROM DUAL UNION ALL
    SELECT '41101626'        , 16             , 530.70            FROM DUAL UNION ALL
    SELECT '40901084'        , 5              , 232.00            FROM DUAL UNION ALL
    SELECT '40901084'        , 21             , 232.00            FROM DUAL
) S
ON (T.tuss = S.tuss AND T.convenio = S.convenio)
WHEN MATCHED THEN
    UPDATE SET
        T.vl_total = S.vl_total
WHEN NOT MATCHED THEN
    INSERT (tuss, convenio, vl_total)
    VALUES (S.tuss, S.convenio, S.vl_total);

COMMIT;

-------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Validar informações incluidas na tabela 

    SELECT
    S.tuss                                          AS tuss_esperado,
    S.convenio                                      AS convenio_esperado,
    TO_CHAR(S.vl_total, 'FM999G990D00')             AS vl_esperado,
    T.tuss                                          AS tuss_tabela,
    T.convenio                                      AS convenio_tabela,
    TO_CHAR(T.vl_total, 'FM999G990D00')             AS vl_tabela,
    CASE
        WHEN T.tuss IS NULL THEN 'NÃO ENCONTRADO'
        WHEN T.vl_total = S.vl_total THEN 'OK'
        ELSE '?? VALOR DIVERGENTE'
    END                                             AS status
FROM (
    SELECT '41001079' AS tuss, 45 AS convenio, 226.25 AS vl_total FROM DUAL UNION ALL
    SELECT '41101014'        , 45            , 450.00            FROM DUAL UNION ALL
    SELECT '40901300'        , 45            , 171.81            FROM DUAL UNION ALL
    SELECT '40901114'        , 45            , 163.97            FROM DUAL UNION ALL
    SELECT '40901211'        , 45            , 157.70            FROM DUAL UNION ALL
    SELECT '41101316'        , 78            , 494.10            FROM DUAL UNION ALL
    SELECT '40901033'        , 26            , 124.91            FROM DUAL UNION ALL
    SELECT '40901300'        , 26            , 125.14            FROM DUAL UNION ALL
    SELECT '40901220'        , 28            , 107.88            FROM DUAL UNION ALL
    SELECT '40901157'        , 3             , 90.35             FROM DUAL UNION ALL
    SELECT '40901157'        , 19            , 139.25            FROM DUAL UNION ALL
    SELECT '40901383'        , 49            , 387.34            FROM DUAL UNION ALL
    SELECT '40901173'        , 49            , 183.81            FROM DUAL UNION ALL
    SELECT '40901386'        , 67            , 220.79            FROM DUAL UNION ALL
    SELECT '40901386'        , 15            , 320.40            FROM DUAL UNION ALL
    SELECT '40901211'        , 15            , 131.07            FROM DUAL UNION ALL
    SELECT '40901211'        , 88            , 127.97            FROM DUAL
) S
LEFT JOIN REPASSE_IMAGEM_SW T
    ON T.tuss    = S.tuss
   AND T.convenio = S.convenio
ORDER BY
    status,
    S.convenio,
    S.tuss;


------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--11/03/2026

MERGE INTO REPASSE_IMAGEM_SW T
USING (
    SELECT '41001079' AS tuss, 45 AS convenio, 226.25 AS vl_total FROM DUAL UNION ALL
    SELECT '41101014'        , 45            , 450.00            FROM DUAL UNION ALL
    SELECT '40901300'        , 45            , 171.81            FROM DUAL UNION ALL
    SELECT '40901114'        , 45            , 163.97            FROM DUAL UNION ALL
    SELECT '40901211'        , 45            , 157.70            FROM DUAL UNION ALL
    SELECT '41101316'        , 78            , 494.10            FROM DUAL UNION ALL
    SELECT '40901033'        , 26            , 124.91            FROM DUAL UNION ALL
    SELECT '40901300'        , 26            , 125.14            FROM DUAL UNION ALL
    SELECT '40901220'        , 28            , 107.88            FROM DUAL UNION ALL
    SELECT '40901157'        , 3             , 90.35             FROM DUAL UNION ALL
    SELECT '40901157'        , 19            , 139.25            FROM DUAL UNION ALL
    SELECT '40901383'        , 49            , 387.34            FROM DUAL UNION ALL
    SELECT '40901173'        , 49            , 183.81            FROM DUAL UNION ALL
    SELECT '40901386'        , 67            , 220.79            FROM DUAL UNION ALL
    SELECT '40901386'        , 15            , 320.40            FROM DUAL UNION ALL
    SELECT '40901211'        , 15            , 131.07            FROM DUAL UNION ALL
    SELECT '40901211'        , 88            , 127.97            FROM DUAL
) S
ON (T.tuss = S.tuss AND T.convenio = S.convenio)
WHEN MATCHED THEN
    UPDATE SET
        T.vl_total = S.vl_total
WHEN NOT MATCHED THEN
    INSERT (tuss, convenio, vl_total)
    VALUES (S.tuss, S.convenio, S.vl_total);


----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Validar informações incluidas 

SELECT
    T.tuss,
    T.convenio,
    T.vl_total
FROM REPASSE_IMAGEM_SW T
WHERE (T.tuss, T.convenio) IN (
    SELECT '41001079', 45 FROM DUAL UNION ALL
    SELECT '41101014', 45 FROM DUAL UNION ALL
    SELECT '40901300', 45 FROM DUAL UNION ALL
    SELECT '40901114', 45 FROM DUAL UNION ALL
    SELECT '40901211', 45 FROM DUAL UNION ALL
    SELECT '41101316', 78 FROM DUAL UNION ALL
    SELECT '40901033', 26 FROM DUAL UNION ALL
    SELECT '40901300', 26 FROM DUAL UNION ALL
    SELECT '40901220', 28 FROM DUAL UNION ALL
    SELECT '40901157', 3  FROM DUAL UNION ALL
    SELECT '40901157', 19 FROM DUAL UNION ALL
    SELECT '40901383', 49 FROM DUAL UNION ALL
    SELECT '40901173', 49 FROM DUAL UNION ALL
    SELECT '40901386', 67 FROM DUAL UNION ALL
    SELECT '40901386', 15 FROM DUAL UNION ALL
    SELECT '40901211', 15 FROM DUAL UNION ALL
    SELECT '40901211', 88 FROM DUAL
)
ORDER BY
    T.convenio
    T.tuss;


----------------------------------------------------------------------------------------------------------------------------------------------------------------------

Data: 13/05//2026


MERGE INTO REPASSE_IMAGEM_SW T
USING (
    SELECT '40901570' AS tuss, 82 AS convenio, 446.30 AS vl_total FROM DUAL UNION ALL
    SELECT '41101588'        , 82            , 446.30            FROM DUAL UNION ALL
    SELECT '40901033'        , 82            ,  86.93             FROM DUAL UNION ALL

    SELECT '40901570'        , 10            , 446.30             FROM DUAL UNION ALL
    SELECT '41101588'        , 10            , 446.30             FROM DUAL UNION ALL
    SELECT '40901033'        , 10            ,  86.93             FROM DUAL UNION ALL

    SELECT '40901386'        , 48            , 224.05             FROM DUAL UNION ALL
    SELECT '40901300'        , 28            , 113.62             FROM DUAL UNION ALL

    SELECT '40901459'        , 49            , 590.06             FROM DUAL UNION ALL
    SELECT '40901475'        , 49            , 453.94             FROM DUAL UNION ALL
    SELECT '40901467'        , 49            , 645.96             FROM DUAL UNION ALL
    SELECT '40901483'        , 49            , 645.96             FROM DUAL UNION ALL
    SELECT '40901130'        , 49            , 213.68             FROM DUAL UNION ALL

    SELECT '40901386'        , 16            , 105.03             FROM DUAL UNION ALL
    SELECT '40901378'        , 40            , 300.00             FROM DUAL UNION ALL
    SELECT '41001141'        , 19            , 192.31             FROM DUAL UNION ALL
    SELECT '40901130'        , 12            , 182.75             FROM DUAL
) S
ON (T.tuss = S.tuss AND T.convenio = S.convenio)
WHEN MATCHED THEN
    UPDATE SET
        T.vl_total = S.vl_total
WHEN NOT MATCHED THEN
    INSERT (tuss, convenio, vl_total)
    VALUES (S.tuss, S.convenio, S.vl_total);

COMMIT;

_______________________________________________________________________________________________

   -- Confirma se todos os registros foram gravados corretamente
SELECT 
    T.tuss,
    T.convenio,
    T.vl_total                          AS vl_gravado,
    S.vl_total                          AS vl_esperado,
    CASE 
        WHEN T.vl_total = S.vl_total    THEN 'OK'
        ELSE                                 'DIVERGENTE'
    END                                 AS status_validacao
FROM REPASSE_IMAGEM_SW T
INNER JOIN (
    SELECT '40901570' AS tuss, 82 AS convenio, 446.30 AS vl_total FROM DUAL UNION ALL
    SELECT '41101588'        , 82            , 446.30             FROM DUAL UNION ALL
    SELECT '40901033'        , 82            ,  86.93             FROM DUAL UNION ALL
    SELECT '40901570'        , 10            , 446.30             FROM DUAL UNION ALL
    SELECT '41101588'        , 10            , 446.30             FROM DUAL UNION ALL
    SELECT '40901033'        , 10            ,  86.93             FROM DUAL UNION ALL
    SELECT '40901386'        , 48            , 224.05             FROM DUAL UNION ALL
    SELECT '40901300'        , 28            , 113.62             FROM DUAL UNION ALL
    SELECT '40901459'        , 49            , 590.06             FROM DUAL UNION ALL
    SELECT '40901475'        , 49            , 453.94             FROM DUAL UNION ALL
    SELECT '40901467'        , 49            , 645.96             FROM DUAL UNION ALL
    SELECT '40901483'        , 49            , 645.96             FROM DUAL UNION ALL
    SELECT '40901130'        , 49            , 213.68             FROM DUAL UNION ALL
    SELECT '40901386'        , 16            , 105.03             FROM DUAL UNION ALL
    SELECT '40901378'        , 40            , 300.00             FROM DUAL UNION ALL
    SELECT '41001141'        , 19            , 192.31             FROM DUAL UNION ALL
    SELECT '40901130'        , 12            , 182.75             FROM DUAL
) S ON (T.tuss = S.tuss AND T.convenio = S.convenio)
ORDER BY status_validacao DESC, T.tuss, T.convenio;

___________________________________________________________________________________________________________

12/06/2026


MERGE INTO REPASSE_IMAGEM_SW T
USING (
    SELECT '41001460' AS tuss, 53 AS convenio, 256.50 AS vl_total FROM DUAL UNION ALL
    SELECT '41001443'        , 53            , 256.50            FROM DUAL UNION ALL
    SELECT '40901203'        , 88            , 133.08            FROM DUAL UNION ALL
    SELECT '40901386'        , 12            , 300.00            FROM DUAL UNION ALL
    SELECT '40901300'        , 15            , 159.69            FROM DUAL UNION ALL
    SELECT '40901220'        , 49            , 184.03            FROM DUAL UNION ALL
    SELECT '41101120'        , 49            , 465.00            FROM DUAL UNION ALL
    SELECT '41001150'        , 26            , 236.01            FROM DUAL UNION ALL
    SELECT '41101260'        , 78            , 494.10            FROM DUAL UNION ALL
    SELECT '40901130'        , 51            , 149.62            FROM DUAL UNION ALL
    SELECT '41101618'        , 79            , 382.50            FROM DUAL UNION ALL
    SELECT '41001109'        , 3             , 233.22             FROM DUAL UNION ALL
    SELECT '41101189'        , 82            , 567.58            FROM DUAL UNION ALL
    SELECT '41101170'        , 82            , 539.91            FROM DUAL UNION ALL
    SELECT '41101189'        , 10            , 567.58            FROM DUAL UNION ALL
    SELECT '41101170'        , 10            , 539.91            FROM DUAL UNION ALL
    SELECT '41101278'        , 16            , 522.00            FROM DUAL
) S
ON (T.tuss = S.tuss AND T.convenio = S.convenio)
WHEN MATCHED THEN
    UPDATE SET
        T.vl_total = S.vl_total
WHEN NOT MATCHED THEN
    INSERT (tuss, convenio, vl_total)
    VALUES (S.tuss, S.convenio, S.vl_total);


_____________________________________________________________________________________________________________


SELECT
    T.TUSS,
    T.CONVENIO,
    T.VL_TOTAL
    -- TO_CHAR(T.VL_TOTAL, 'FM999G990D00', 'NLS_NUMERIC_CHARACTERS = '',.''') AS VL_TOTAL_FMT
FROM REPASSE_IMAGEM_SW T
WHERE (T.TUSS, T.CONVENIO, T.VL_TOTAL) IN (
    ('41001460', 53, 256.50),
    ('41001443', 53, 256.50),
    ('40901203', 88, 133.08),
    ('40901386', 12, 300.00),
    ('40901300', 15, 159.69),
    ('40901220', 49, 184.03),
    ('41101120', 49, 465.00),
    ('41001150', 26, 236.01),
    ('41101260', 78, 494.10),
    ('40901130', 51, 149.62),
    ('41101618', 79, 382.50),
    ('41001109',  3, 233.22),
    ('41101189', 82, 567.58),
    ('41101170', 82, 539.91),
    ('41101189', 10, 567.58),
    ('41101170', 10, 539.91),
    ('41101278', 16, 522.00)
)
ORDER BY T.TUSS, T.CONVENIO;
__________________________________________________________________________________________________________________

-- Data 09/07/2026

MERGE INTO REPASSE_IMAGEM_SW T
USING (
    SELECT '41101030' AS tuss, 53 AS convenio, 486.00    AS vl_total FROM DUAL UNION ALL
    SELECT '40901386'        , 53            , 177.53                   FROM DUAL UNION ALL
    SELECT '40901173'        , 19            , 139.25                   FROM DUAL UNION ALL
    SELECT '40901203'        , 19            , 112.46                   FROM DUAL UNION ALL
    SELECT '40901300'        , 19            , 138.60                   FROM DUAL UNION ALL
    SELECT '41101618'        , 10            , 539.91                   FROM DUAL UNION ALL
    SELECT '41101057'        , 10            , 188.02                   FROM DUAL UNION ALL
    SELECT '41101618'        , 82            , 539.91                   FROM DUAL UNION ALL
    SELECT '41101057'        , 82            , 188.02                   FROM DUAL UNION ALL
    SELECT '40901033'        , 67            , 95.64                    FROM DUAL UNION ALL
    SELECT '41001109'        , 15            , 256.41                   FROM DUAL UNION ALL
    SELECT '40901386'        , 49            , 387.34                   FROM DUAL UNION ALL
    SELECT '41101189'        , 86            , 395.25                   FROM DUAL UNION ALL
    SELECT '41101170'        , 86            , 395.25                   FROM DUAL
) S
ON (T.tuss = S.tuss AND T.convenio = S.convenio)
WHEN MATCHED THEN
    UPDATE SET
        T.vl_total = S.vl_total
WHEN NOT MATCHED THEN
    INSERT (tuss, convenio, vl_total)
    VALUES (S.tuss, S.convenio, S.vl_total);

--------------------------------------------------------------------------------------------------------

-- Query para validar se todos os registros foram  gravados 

SELECT T.tuss,
       T.convenio,
       T.vl_total
  FROM REPASSE_IMAGEM_SW T
 WHERE (T.tuss, T.convenio, T.vl_total) IN (
       SELECT '41101030', 53, 486.00   FROM DUAL UNION ALL
       SELECT '40901386', 53, 177.53   FROM DUAL UNION ALL
       SELECT '40901173', 19, 139.25   FROM DUAL UNION ALL
       SELECT '40901203', 19, 112.46   FROM DUAL UNION ALL
       SELECT '40901300', 19, 138.60   FROM DUAL UNION ALL
       SELECT '41101618', 10, 539.91   FROM DUAL UNION ALL
       SELECT '41101057', 10, 188.02   FROM DUAL UNION ALL
       SELECT '41101618', 82, 539.91   FROM DUAL UNION ALL
       SELECT '41101057', 82, 188.02   FROM DUAL UNION ALL
       SELECT '40901033', 67, 95.64    FROM DUAL UNION ALL
       SELECT '41001109', 15, 256.41   FROM DUAL UNION ALL
       SELECT '40901386', 49, 387.34   FROM DUAL UNION ALL
       SELECT '41101189', 86, 395.25   FROM DUAL UNION ALL
       SELECT '41101170', 86, 395.25   FROM DUAL
 )
 ORDER BY T.convenio;


























































