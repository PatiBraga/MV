 SELECT DISTINCT
    p.cd_produto,
    p.ds_produto,
    p.ds_produto_resumido,
    e.cd_especie,
    e.ds_especie,
    c.cd_classe,
    c.ds_classe,
    s.cd_sub_cla,
    s.ds_sub_cla,
    CASE
        WHEN p.cd_pro_fat IS NULL THEN 'Não possui'
        ELSE p.cd_pro_fat
    END AS cd_pro_fat,
    p.cd_tip_ativ
FROM
    produto p
JOIN
    especie e ON e.cd_especie = p.cd_especie  -- Relacionando ESPECIE e PRODUTO pela coluna cd_especie
JOIN
    classe c ON c.cd_especie = e.cd_especie  -- Relacionando ESPECIE e CLASSE pela coluna cd_especie
JOIN
    sub_clas s ON s.cd_classe = c.cd_classe   -- Relacionando CLASSE e SUB_CLAS pela coluna cd_classe
WHERE
    e.cd_especie IN (1, 2, 3)  -- Filtrando para as espécies 1, 2, e 3
ORDER BY
    p.cd_produto, e.ds_especie;  -- Ordenando o resultado pela coluna cd_produto
