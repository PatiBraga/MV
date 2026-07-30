-- Conta extra e conta atendimento
-- Alterar setor e setor executante

-- Validar colunas e informa��es
SELECT * FROM ITREG_AMB FETCH FIRST 5 ROWS ONLY;

-- Pesquisar Pedido
SELECT * FROM ITREG_AMB
WHERE cd_atendimento = 1011760;


-- Validar ajuste

SELECT *
  FROM itreg_amb
 WHERE cd_atendimento = 1012360
   AND cd_reg_amb     = 1013157
   AND cd_pro_fat     = 73000036;
-----------------------------------------------------


SELECT *
  FROM itreg_amb
 WHERE cd_atendimento = 1012338
   AND cd_reg_amb     = 1015371
   AND cd_pro_fat IN (36010014, 73000025);



-- Validar colunas e informa��es
SELECT * FROM ITREG_AMB FETCH FIRST 5 ROWS ONLY;


-- Realizar update
UPDATE ITREG_AMB
SET cd_setor_produziu = '136'
 WHERE cd_atendimento = 1012360
   AND cd_reg_amb     = 1013157
   AND cd_pro_fat     = 73000036;


-----------------------------------------


UPDATE ITREG_AMB
SET cd_setor_produziu = '169',
    cd_setor = '106'
   WHERE cd_atendimento = 1014205
   AND cd_reg_amb     = 1015589
   AND cd_pro_fat     = 20401552;

-------------------------------------------

UPDATE ITREG_AMB
SET cd_setor_produziu = '169',
    cd_setor = '106'
  WHERE cd_atendimento = 1012338
   AND cd_pro_fat     = 36010014
   AND cd_reg_amb     = 1015371;


-----------------------------------------------


-- Verificar setores
SELECT cd_setor, nm_setor
FROM setor
WHERE cd_setor in ('106', '136','169');


