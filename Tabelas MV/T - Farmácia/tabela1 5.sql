SELECT
    p.cd_produto AS "Cód. Produto",
    p.ds_produto AS "Desc. Produto",
    p.ds_produto_resumido AS "Desc. Pdt. Res.",
    p.cd_especie AS "Desc. Especie",
    e.ds_especie AS "Espécie Produto",
    p.cd_classe AS "Cód. Classe",
    c.ds_classe AS "Desc. Classe",
    p.cd_sub_cla AS "Cód. Sub Classe",
    s.ds_sub_cla AS "Desc. Sub Classe",
    CASE
        WHEN p.cd_pro_fat IS NULL THEN 'Não possui'
        ELSE p.cd_pro_fat
    END AS "Profat",
    p.cd_tip_ativ AS "Tipo Ativo"
    t.ds_tip_ativ AS "Desc. Ativo"
FROM
    produto p
INNER JOIN
    especie e ON e.cd_especie = p.cd_especie
INNER JOIN
    classe c ON c.cd_classe = p.cd_classe AND c.cd_especie = p.cd_especie
INNER JOIN
    sub_clas s ON s.cd_sub_cla = p.cd_sub_cla AND s.cd_especie = p.cd_especie AND s.cd_classe = p.cd_classe
INNER JOIN
    tip_ativ t ON t.cd_tip_ativ = p.cd_tip_ativ
WHERE
    p.cd_especie IN (1, 2, 3)
ORDER BY
    p.cd_produto;


////////////////////////////////////////////////////////



 SELECT
    p.cd_produto AS "Cód. Produto",
    p.ds_produto AS "Desc. Produto",
    p.ds_produto_resumido AS "Desc. Pdt. Res.",
    p.cd_especie AS "Cód. Especie",
    e.ds_especie AS "Desc. Especie",
    p.cd_classe AS "Cód. Classe",
    c.ds_classe AS "Desc. Classe",
    p.cd_sub_cla AS "Cód. Sub Classe",
    s.ds_sub_cla AS "Desc. Sub Classe",
    CASE
        WHEN p.cd_pro_fat IS NULL THEN 'Não possui'
        ELSE p.cd_pro_fat
    END AS "Profat",
    p.cd_tip_ativ AS "Tipo Ativo",
    t.ds_tip_ativ AS "Desc. Ativo"
FROM
    produto p
INNER JOIN
    especie e ON e.cd_especie = p.cd_especie
INNER JOIN
    classe c ON c.cd_classe = p.cd_classe AND c.cd_especie = p.cd_especie
INNER JOIN
    sub_clas s ON s.cd_sub_cla = p.cd_sub_cla AND s.cd_especie = p.cd_especie AND s.cd_classe = p.cd_classe
INNER JOIN
    tip_ativ t ON t.cd_tip_ativ = p.cd_tip_ativ
WHERE
    p.cd_especie IN (1, 2, 3)
ORDER BY
    p.cd_produto;
