SELECT
    p.cd_especie,
    e.ds_especie,
    p.cd_classe,
    c.ds_classe,
    p.cd_sub_cla,
    s.ds_sub_cla
FROM
    produto p
LEFT JOIN
    ESPECIE e ON e.cd_especie = p.cd_especie
LEFT JOIN
    classe c ON c.cd_classe = p.cd_classe
LEFT JOIN
    sub_clas s ON s.cd_sub_cla = p.cd_sub_cla
WHERE
    p.cd_especie IS NOT NULL
    AND p.cd_classe IS NOT NULL
    AND p.cd_sub_cla IS NOT NULL;
