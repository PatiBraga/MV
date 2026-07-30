SELECT
    p.cd_produto,
    p.ds_produto,
    p.tp_produto,
    p.cd_especie,
    e.ds_especie,
    p.cd_classe,
    c.ds_classe,
    p.cd_sub_cla,
    s.ds_sub_cla,
    -- p.cd_grupo,          -- Descomente se precisar de dados de grupo
    -- g.ds_grupo,          -- Descomente se precisar de dados de grupo
    -- p.cd_unidade,        -- Descomente se precisar de dados de unidade
    -- u.ds_unidade,        -- Descomente se precisar de dados de unidade
    p.sn_ativo
FROM
    dbamv.produto p
    -- LEFT JOIN dbamv.grupo g        ON g.cd_grupo = p.cd_grupo -- Descomente se precisar
    -- LEFT JOIN dbamv.unidade u      ON u.cd_unidade = p.cd_unidade -- Descomente se precisar
    LEFT JOIN dbamv.especie e      ON e.cd_especie = p.cd_especie
    LEFT JOIN dbamv.classe c       ON c.cd_classe = p.cd_classe
    LEFT JOIN dbamv.sub_cla s      ON s.cd_sub_cla = p.cd_sub_cla
WHERE
    p.sn_ativo = 'S'
ORDER BY
    e.ds_especie,
    c.ds_classe,
    s.ds_sub_cla,
    p.ds_produto;
