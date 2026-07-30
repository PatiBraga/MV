-- SELECT PARA VALIDAR TUSS POR CONVENIO
SELECT *
FROM REPASSE_IMAGEM_SW
WHERE tuss IN ('40901181', '40901190', '40901475', '40901459', '40901394', '40901408', '40901513', '40901416', '40901424')
  AND convenio = '8'
ORDER BY tuss;

-----------------------------------------------------------------------------------------------------------------------------
-- SELECT PARA VERIFICAR CÓDIGO DO CONVENIO

SELECT *
FROM REPASSE_IMAGEM_SW
WHERE convenio

SELECT *
FROM convenio
WHERE
    nm_convenio LIKE '%AMIL%'
    OR nm_convenio LIKE '%BANCO CENTRAL%'
    OR nm_convenio LIKE '%COPEL%'
    OR nm_convenio LIKE '%ICS%'
    OR nm_convenio LIKE '%JUDICEMED%'
    OR nm_convenio LIKE '%MEDISERVICE%'
    OR nm_convenio LIKE '%SANEPAR%'
    OR nm_convenio LIKE '%CEF%'
    OR nm_convenio LIKE '%PETROBRAS%'
    OR nm_convenio LIKE '%SUL AMERICA%'
    OR nm_convenio LIKE '%BRADESCO%'
    OR nm_convenio LIKE '%SELECT%'
    OR nm_convenio LIKE '%SINAM%'
ORDER BY
    cd_convenio, nm_convenio;

------------------------------------------------------------------------------------------------------------------------------

-- SELECT / INSERT / UPDATE - TABELA REPASSE_IMAGEM_SW

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

---------------------------------------------------------------------------------------------
-- SELECT / INSERT / UPDATE - TABELA REPASSE_IMAGEM_SW

MERGE INTO REPASSE_IMAGEM_SW T
USING (
    SELECT '40901181' AS tuss, 8 AS convenio,  82.76  AS vl_total FROM DUAL UNION ALL
    SELECT '40901173'        , 8          , 78.92               FROM DUAL UNION ALL
 --   SELECT '40901459'        , 8          , 264.35               FROM DUAL UNION ALL
 --   SELECT '40901394'        , 8          , 202.66               FROM DUAL UNION ALL
 --   SELECT '40901408'        , 8          , 192.59               FROM DUAL UNION ALL
--    SELECT '40901513'        , 8          , 154.36               FROM DUAL UNION ALL
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

-----------------------------------------------------------------------------------------------------------------------------

SELECT *
FROM REPASSE_IMAGEM_SW
WHERE tuss IN ('40901181', '40901173', '40901130')
  AND convenio = '8'
ORDER BY tuss;

-----------------------------------------------------------------------------------------------------------------------------

SELECT *
FROM REPASSE_IMAGEM_SW
WHERE convenio

SELECT *
FROM convenio
WHERE
    nm_convenio LIKE '%AMIL%'
    OR nm_convenio LIKE '%BANCO CENTRAL%'
    OR nm_convenio LIKE '%COPEL%'
    OR nm_convenio LIKE '%ICS%'
    OR nm_convenio LIKE '%JUDICEMED%'
    OR nm_convenio LIKE '%MEDISERVICE%'
    OR nm_convenio LIKE '%SANEPAR%'
    OR nm_convenio LIKE '%CEF%'
    OR nm_convenio LIKE '%PETROBRAS%'
    OR nm_convenio LIKE '%SUL AMERICA%'
    OR nm_convenio LIKE '%BRADESCO%'
    OR nm_convenio LIKE '%SELECT%'
    OR nm_convenio LIKE '%SINAM%'
ORDER BY
    cd_convenio, nm_convenio;

------------------------------------------------------------------------------------------------------------------------------





