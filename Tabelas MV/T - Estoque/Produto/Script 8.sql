SELECT
    p.cd_produto,
    p.ds_produto,
    p.ds_produto_resumido,
    p.cd_especie,
    e.ds_especie,
    p.cd_classe,
    c.ds_classe,
    p.cd_sub_cla,
    s.ds_sub_cla,
    CASE
        WHEN p.cd_pro_fat IS NULL THEN 'Não possui'
        ELSE p.cd_pro_fat
    END AS cd_pro_fat,  -- Substituindo NULL diretamente na coluna cd_pro_fat
    p.cd_tip_ativ

FROM
    produto p
INNER JOIN
    especie e ON e.cd_especie = p.cd_especie
INNER JOIN
    classe c ON c.cd_classe = p.cd_classe AND C.CD_ESPECIE = P.CD_ESPECIE
INNER JOIN
    sub_clas s ON s.cd_sub_cla = p.cd_sub_cla AND s.CD_ESPECIE = P.CD_ESPECIE AND s.cd_classe = p.cd_classe
WHERE
    p.cd_especie IN (1, 2, 3)
ORDER BY
    p.cd_produto;


