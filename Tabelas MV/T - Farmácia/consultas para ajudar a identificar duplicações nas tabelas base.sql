-- consultas para ajudar a identificar duplicações nas tabelas base

-- Verificar duplicados na tabela CLASSE por cd_especie e cd_classe
SELECT cd_especie, cd_classe, COUNT(*)
FROM CLASSE
GROUP BY cd_especie, cd_classe
HAVING COUNT(*) > 1;

-- Verificar duplicados na tabela sub_clas por cd_classe e cd_sub_cla
SELECT cd_classe, cd_sub_cla, COUNT(*)
FROM sub_clas
GROUP BY cd_classe, cd_sub_cla
HAVING COUNT(*) > 1;

-- Verificar duplicados na tabela produto por cd_sub_cla e cd_produto
SELECT cd_sub_cla, cd_produto, COUNT(*)
FROM produto
GROUP BY cd_sub_cla, cd_produto
HAVING COUNT(*) > 1;
