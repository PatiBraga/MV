SELECT
    p.cd_produto,
    p.ds_produto,
    p.ds_produto_resumido,
    p.cd_sub_cla,
    p.cd_classe,
    p.cd_especie,
    p.cd_pro_fat,
    p.cd_tip_ativ,
    e.ds_especie,
    c.ds_classe,
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
    p.cd_especie IN (1, 2, 3);