SELECT p.cd_produto,
       p.ds_produto,
       e.cd_especie,
       c.cd_classe,
       s.cd_sub_cla,
       p.cd_pro_fat,
       p.vl_fator_pro_fat
FROM PRODUTO p
JOIN ESPECIE e ON p.cd_especie = e.cd_especie  -- Relacionamento entre PRODUTO e ESPECIE
JOIN CLASSE c ON p.cd_classe = c.cd_classe      -- Relacionamento entre PRODUTO e CLASSE
JOIN SUB_CLAS s ON p.cd_sub_cla = s.cd_sub_cla  -- Relacionamento entre PRODUTO e SUB_CLAS
/


SELECT DISTINCT
       p.cd_produto AS "Código do produto",
       p.ds_produto AS "Descrição do produto",
       e.ds_especie AS "Espécie do produto",   -- Nome ou descrição da espécie
       c.ds_classe AS "Classe do produto",     -- Nome ou descrição da classe
       s.ds_sub_cla AS "Subclasse do produto",   -- Nome ou descrição da subclasse
       p.cd_pro_fat

FROM PRODUTO p
JOIN ESPECIE e ON p.cd_especie = e.cd_especie  -- Relacionamento entre PRODUTO e ESPECIE
JOIN CLASSE c ON p.cd_classe = c.cd_classe      -- Relacionamento entre PRODUTO e CLASSE
JOIN SUB_CLAS s ON p.cd_sub_cla = s.cd_sub_cla  -- Relacionamento entre PRODUTO e SUB_CLAS
FETCH FIRST 300 ROWS ONLY



