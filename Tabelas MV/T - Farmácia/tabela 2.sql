SELECT
    p.cd_produto,
    p.ds_produto,
    p.ds_produto_resumido,
    s.cd_sub_cla,
    c.cd_classe,
    e.cd_especie,
    s.ds_sub_cla,
    c.ds_classe,
    e.ds_especie
FROM
    produto p
JOIN
    sub_clas s ON p.cd_sub_cla = s.cd_sub_cla
JOIN
    classe c ON p.cd_classe = c.cd_classe
JOIN
    ESPECIE e ON p.cd_especie = e.cd_especie
WHERE p.cd_especie IN (1, 2, 3);
