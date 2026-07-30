-- Pesquisar Pedido
SELECT * FROM ITREG_AMB
WHERE cd_atendimento = 1012422;


-- Validar ajuste
SELECT * FROM ITREG_AMB
WHERE cd_atendimento = 1012422 AND cd_reg_amb = 1013935;


-- Validar colunas e informações 
SELECT * FROM ITREG_AMB FETCH FIRST 5 ROWS ONLY;


-- Realizar update 
UPDATE ITREG_AMB
SET cd_setor_produziu = '169'
WHERE cd_reg_amb = '1013935' AND cd_pro_fat = '20401552';


-- Verificar setores
SELECT cd_setor, nm_setor 
FROM setor
WHERE cd_setor in ('106', '136','169');



-- Incluir mais de um registro 



