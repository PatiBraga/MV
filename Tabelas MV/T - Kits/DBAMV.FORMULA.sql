-- KITS

SELECT f.cd_produto,
       f.cd_uni_pro,
       f.cd_formula,
       f.nr_dias_valido,
       f.qt_padrao,
       CASE f.sn_ativo
           WHEN 'S' THEN 'PRODUÇÃO DE KITS'
           WHEN 'N' THEN 'FÓRMULA'
           ELSE f.sn_ativo
       END AS sn_ativo,
       f.sn_permite_similar,
       f.sn_producao,
       f.tp_acondicionamento,
       f.tp_formula
FROM dbamv.formula f
ORDER BY f.sn_ativo, cd_produto;

------------------------------------------------------------
-- ITEM DOS KITS

SELECT f.cd_produto,
       p.ds_produto,
       f.cd_produto_tem,
       f.cd_uni_pro,
       f.qt_padrao,
       f.cd_formula
FROM dbamv.itformula f
INNER JOIN dbamv.produto p
        ON f.cd_produto_tem = p.cd_produto
WHERE f.cd_produto = '21084'
  AND f.cd_formula = 107
ORDER BY f.cd_produto_tem;



