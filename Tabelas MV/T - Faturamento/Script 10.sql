SELECT * FROM itreg_fat_original
WHERE cd_reg_fat = 106554



SELECT * FROM atendime
WHERE cd_atendimento = 1073378

SELECT * FROM mov_int
WHERE cd_atendimento = 1073378



SELECT * FROM mvto_estoque
WHERE cd_atendimento = 1073378
AND dt_mvto_estoque betweeN To_Date('11/09/2025 00:00:00', 'DD/MM/YYYY HH24:MI:SS')
                        AND To_Date('20/09/2025 23:59:59', 'DD/MM/YYYY HH24:MI:SS')

ORDER BY DT_MVTO_ESTOQUE ASC

11/09 A 20/09



SELECT * FROM mvto_estoque
WHERE cd_mvtO_ESTOQUE = 3021229


SELECT cd_pro_Fat FROM produto
WHERE cd_produto = 2440


 SELECT * FROM log_falha_importacao
 WHERE cd_reg_fat = 106654


  SELECT * FROM audit_dbamv.reg_fat
  WHERE cd_reg_fat = 106866--106554





 SELECT * FROM log_diaria_automatica
 WHERE cd_reg_fat = 106866


          SELECT *
FROM ITREG_AMB
ORDER BY  DESC
FETCH FIRST 10 ROWS ONLY;


REG_AMB - CONTA AMBULATÓRIO
ITREG_AMB - ITENS LANÇADOS
REG_FAT - CONTA INTERNAMENTO
ITREG_AMB - ITENS LANÇADOS



