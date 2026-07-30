WITH RankedProdutos AS (
    SELECT
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
        p.cd_tip_ativ,
        ROW_NUMBER() OVER (PARTITION BY p.cd_produto ORDER BY p.cd_produto) AS rn
    FROM
        ESPECIE e
    JOIN
        CLASSE c ON e.cd_especie = c.cd_especie
    JOIN
        sub_clas s ON c.cd_classe = s.cd_classe
    JOIN
        produto p ON s.cd_sub_cla = p.cd_sub_cla
    WHERE
        e.cd_especie IN (1, 2, 3)
)
SELECT
    cd_produto,
    ds_produto,
    ds_produto_resumido,
    cd_especie,
    ds_especie,
    cd_classe,
    ds_classe,
    cd_sub_cla,
    ds_sub_cla,
    cd_pro_fat,
    cd_tip_ativ
FROM
    RankedProdutos
WHERE
    rn = 1
ORDER BY
    cd_produto, ds_especie;
