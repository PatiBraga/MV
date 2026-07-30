SELECT
    e.cd_especie,
    e.ds_especie,
    c.cd_classe,
    c.ds_classe,
    s.cd_sub_cla,
    s.ds_sub_cla,
    p.cd_produto,
    p.ds_produto,
    p.ds_produto_resumido,
    CASE
        WHEN p.cd_pro_fat IS NULL THEN 'Não possui'
        ELSE p.cd_pro_fat
    END AS cd_pro_fat,  -- Substituindo NULL diretamente na coluna cd_pro_fat
    p.cd_tip_ativ,
    (SELECT COUNT(*)
     FROM ESPECIE e2
     WHERE e2.cd_especie IN (1, 2, 3)) AS total_count -- Contando o total de registros para cd_especie 1, 2, 3
FROM
    ESPECIE e
JOIN
    CLASSE c ON e.cd_especie = c.cd_especie  -- Relacionando ESPECIE e CLASSE pela coluna cd_especie
JOIN
    sub_clas s ON c.cd_classe = s.cd_classe   -- Relacionando CLASSE e sub_clas pela coluna cd_classe
JOIN
    produto p ON s.cd_sub_cla = p.cd_sub_cla  -- Relacionando sub_clas e produto pela coluna cd_sub_cla
WHERE
    e.cd_especie IN (1, 2, 3)  -- Filtrando para as espécies 1, 2, e 3
    AND c.cd_classe = '10'
    AND s.cd_sub_cla = '6'
ORDER BY
    e.cd_especie;  -- Ordenando o resultado pela coluna cd_especie
