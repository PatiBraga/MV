SELECT convenio, tuss, COUNT(*) AS total_linhas
FROM REPASSE_IMAGEM_SW
GROUP BY convenio, tuss
HAVING COUNT(*) > 1;
/
SELECT convenio, tuss, COUNT(*) AS total_linhas
FROM REPASSE_IMAGEM_SW
GROUP BY convenio, tuss
HAVING COUNT(*) > 1;
/

SELECT convenio, tuss, vl_total, Count(*)
FROM repasse_imagem_sw
GROUP BY convenio, tuss, vl_total
ORDER BY convenio, tuss;

