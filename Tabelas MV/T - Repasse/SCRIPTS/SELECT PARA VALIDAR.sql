-- SELECT PARA VALIDAR

SELECT
    tuss,
    convenio,
    vl_total,
     TO_CHAR(vl_total, 'FM999G990D00', 'NLS_NUMERIC_CHARACTERS='',.''') AS vl_total_formatado
FROM
    REPASSE_IMAGEM_SW
WHERE
    (tuss = '40901157' AND convenio = 5) OR
    (tuss = '40901203' AND convenio = 5) OR
    (tuss = '40901122' AND convenio = 5) OR
    (tuss = '40901300' AND convenio = 5) OR
    (tuss = '40901114' AND convenio = 5) OR
    (tuss = '40901173' AND convenio = 5) OR
    (tuss = '40901130' AND convenio = 5) OR
    (tuss = '40901386' AND convenio = 5) OR
    (tuss = '40901122' AND convenio = 78) OR
    (tuss = '40901114' AND convenio = 78) OR
    (tuss = '40901157' AND convenio = 48) OR
    (tuss = '40901203' AND convenio = 48) OR
    (tuss = '40901122' AND convenio = 48) OR
    (tuss = '40901173' AND convenio = 48) OR
    (tuss = '40901203' AND convenio = 53) OR
    (tuss = '40901122' AND convenio = 53) OR
    (tuss = '40901769' AND convenio = 53) OR
    (tuss = '40901173' AND convenio = 53) OR
    (tuss = '40901122' AND convenio = 49) OR
    (tuss = '40901122' AND convenio = 16) OR
    (tuss = '40901300' AND convenio = 16) OR
    (tuss = '40901114' AND convenio = 16) OR
    (tuss = '40901211' AND convenio = 16) OR
    (tuss = '40901122' AND convenio = 51) OR
    (tuss = '40901114' AND convenio = 15) OR
    (tuss = '40901173' AND convenio = 30) OR
    (tuss = '40901114' AND convenio = 30) OR
    (tuss = '40901211' AND convenio = 30) OR
    (tuss = '40901122' AND convenio = 88) OR
    (tuss = '40901300' AND convenio = 88) OR
    (tuss = '40901114' AND convenio = 88) OR
    (tuss = '40901300' AND convenio = 3) OR
    (tuss = '40901114' AND convenio = 10) OR
    (tuss = '40901122' AND convenio = 10) OR
    (tuss = '40901130' AND convenio = 10) OR
    (tuss = '40901173' AND convenio = 10) OR
    (tuss = '40901203' AND convenio = 10) OR
    (tuss = '40901211' AND convenio = 10) OR
    (tuss = '40901300' AND convenio = 10) OR
    (tuss = '40901768' AND convenio = 10)
ORDER BY
    convenio;


--------------------------------------------

SELECT
    tuss,
    convenio,
    vl_total,
     TO_CHAR(vl_total, 'FM999G990D00', 'NLS_NUMERIC_CHARACTERS='',.''') AS vl_total_formatado
FROM
    REPASSE_IMAGEM_SW
WHERE
    (tuss = '40805026' AND convenio = 12)  OR  -- ASSOCIACAO MEDICA - SINAM
    (tuss = '40808017' AND convenio = 8)    -- UNIMED

ORDER BY
    convenio;
