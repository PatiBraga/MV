-- Consulta para contar os produtos das espécies 1, 2 e 3
SELECT
    COUNT(p.cd_produto) AS total_produtos,  -- Contando o total de produtos
    e.cd_especie,
    e.ds_especie
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
GROUP BY
    e.cd_especie, e.ds_especie  -- Agrupando pela espécie
ORDER BY
    e.cd_especie;  -- Ordenando o resultado pela coluna cd_especie
