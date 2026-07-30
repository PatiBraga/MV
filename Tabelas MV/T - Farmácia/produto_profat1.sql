SELECT DISTINCT
       p.cd_produto AS "Código do produto",
       p.ds_produto AS "Descrição do produto",
       e.ds_especie AS "Espécie do produto",
       c.ds_classe AS "Classe do produto",
       s.ds_sub_cla AS "Subclasse do produto",
       CASE
           WHEN p.cd_pro_fat IS NULL THEN 'Não possui'
           ELSE p.cd_pro_fat
       END AS "Código do fator"
FROM PRODUTO p
JOIN ESPECIE e ON p.cd_especie = e.cd_especie  -- Relacionamento entre PRODUTO e ESPECIE
JOIN CLASSE c ON p.cd_classe = c.cd_classe      -- Relacionamento entre PRODUTO e CLASSE
JOIN SUB_CLAS s ON p.cd_sub_cla = s.cd_sub_cla  -- Relacionamento entre PRODUTO e SUB_CLAS
FETCH FIRST 100 ROWS ONLY;
/

SELECT DISTINCT
       p.cd_produto AS "Código do produto",
       p.ds_produto AS "Descrição do produto",
       e.ds_especie AS "Espécie do produto",
       c.ds_classe AS "Classe do produto",
       s.ds_sub_cla AS "Subclasse do produto",
       CASE
           WHEN p.cd_pro_fat IS NULL THEN 'Não possui'
           ELSE p.cd_pro_fat
       END AS "Código Profat"
FROM PRODUTO p
JOIN ESPECIE e ON p.cd_especie = e.cd_especie  -- Relacionamento entre PRODUTO e ESPECIE
JOIN CLASSE c ON p.cd_classe = c.cd_classe      -- Relacionamento entre PRODUTO e CLASSE
JOIN SUB_CLAS s ON p.cd_sub_cla = s.cd_sub_cla  -- Relacionamento entre PRODUTO e SUB_CLAS
WHERE e.cd_especie IN (1, 2, 3, 4)              -- Filtro para trazer cd_especie 1, 2, 3 e 4
FETCH FIRST 100 ROWS ONLY;
/

WITH produto_detalhado AS (
    SELECT DISTINCT
           p.cd_produto AS "Código do produto",
           p.ds_produto AS "Descrição do produto",
           e.ds_especie AS "Espécie do produto",
           c.ds_classe AS "Classe do produto",
           s.ds_sub_cla AS "Subclasse do produto",
           CASE
               WHEN p.cd_pro_fat IS NULL THEN 'Não possui'
               ELSE p.cd_pro_fat
           END AS "Código Profat"
    FROM PRODUTO p
    JOIN ESPECIE e ON p.cd_especie = e.cd_especie  -- Relacionamento entre PRODUTO e ESPECIE
    JOIN CLASSE c ON p.cd_classe = c.cd_classe      -- Relacionamento entre PRODUTO e CLASSE
    JOIN SUB_CLAS s ON p.cd_sub_cla = s.cd_sub_cla  -- Relacionamento entre PRODUTO e SUB_CLAS
    WHERE e.cd_especie IN (1, 2, 3, 4)              -- Filtro para trazer cd_especie 1, 2, 3 e 4
)
SELECT *
FROM produto_detalhado
FETCH FIRST 500 ROWS ONLY;


/

SELECT * FROM ESPECIE
ORDER BY cd_especie;
/

SELECT *
FROM produto
WHERE cd_especie IN (1, 2, 3, 4)
ORDER BY cd_pro_fat
FETCH FIRST 300 ROWS ONLY;
/

SELECT *
FROM produto
WHERE cd_pro_fat = '07000073'  07002773    08002265     07002534
  AND cd_especie IN (1, 2, 3)
ORDER BY cd_pro_fat
FETCH FIRST 300 ROWS ONLY;
/

SELECT *
FROM produto
WHERE cd_pro_fat IN ('07000073', '07002773', '08002265', '07002534')
  AND cd_especie IN (1, 2, 3, 4)
ORDER BY cd_pro_fat
-- FETCH FIRST 300 ROWS ONLY;
/

SELECT COUNT(*) AS "Total de Produtos"
FROM produto;
/

SELECT cd_especie, COUNT(*) AS "Total de Produtos"
FROM produto
GROUP BY cd_especie
ORDER BY cd_especie;
/

SELECT e.cd_especie, e.ds_especie, COUNT(p.cd_produto) AS "Total de Produtos"
FROM produto p
JOIN especie e ON p.cd_especie = e.cd_especie  -- Junção entre as tabelas produto e especie
GROUP BY e.cd_especie, e.ds_especie
ORDER BY e.cd_especie;


