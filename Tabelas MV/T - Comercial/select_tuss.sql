-- Tabela para validar os tipos de terminologias 
SELECT * FROM tip_tuss



-- COUNT - Conta a quantidade de linhas
SELECT COUNT(*) AS QUANTIDADE 
FROM TUSS 
WHERE cd_tip_tuss = 19;


SELECT SUM(cd_tip_tuss) AS QUANTIDADE 
FROM TUSS 
WHERE cd_tip_tuss = 19;



SELECT * FROM tip_tuss
ORDER BY cd_tip_tuss;



-- Tabela Tuss
SELECT * FROM  TUSS
WHERE cd_tuss = '70270791';



-- Tabela TUSS 
SELECT *
FROM TUSS
WHERE cd_tip_tuss = 19
ORDER BY dt_fim_vigencia DESC;



-- Trás todas as colunas 
SELECT 
  TUSS.*, 
  NULL AS imagem_coluna
FROM TUSS
WHERE cd_tip_tuss = '20' 
  AND dt_fim_vigencia IS NULL
ORDER BY ds_tuss;


-- Trás somente as colunas Código- Descrição- Conv- Profat(Proced) preenchidas com as descrições  
SELECT cd_tip_tuss "Codigo Tuss",cd_tuss "Codigo",ds_tuss "Descriçao",cd_convenio "Convenio",cd_pro_fat "Profat",dt_fim_vigencia "Vigencia"
FROM TUSS
WHERE cd_tip_tuss = '22' 
  AND dt_fim_vigencia IS NULL
ORDER BY ds_tuss;


-- Trás somente as colunas Código- Descrição- Conv- Profat(Proced)  
SELECT cd_tip_tuss,cd_tuss,ds_tuss,cd_convenio,cd_pro_fat,dt_fim_vigencia
FROM TUSS
WHERE cd_tip_tuss = '19' 
  AND dt_fim_vigencia IS NULL
ORDER BY ds_tuss;



-- Trás todas as colunas
SELECT *
FROM TUSS
WHERE cd_tip_tuss = '19' 
  AND dt_fim_vigencia IS NULL
ORDER BY ds_tuss;



SELECT cd_tip_tuss, cd_tuss, ds_tuss, cd_convenio, cd_pro_fat, dt_fim_vigencia
FROM (
    SELECT cd_tip_tuss, cd_tuss, ds_tuss, cd_convenio, cd_pro_fat, dt_fim_vigencia, ROWNUM rnum
    FROM TUSS
    WHERE cd_tip_tuss = '19'
      AND dt_fim_vigencia IS NULL
    ORDER BY ds_tuss
)
WHERE rnum BETWEEN 1 AND 100000;



SELECT cd_tip_tuss, cd_tuss, ds_tuss, cd_convenio, cd_pro_fat, dt_fim_vigencia
FROM (
    SELECT cd_tip_tuss, cd_tuss, ds_tuss, cd_convenio, cd_pro_fat, dt_fim_vigencia, ROWNUM rnum
    FROM TUSS
    WHERE cd_tip_tuss = '19'
      AND dt_fim_vigencia IS NULL
    ORDER BY ds_tuss
)
WHERE rnum BETWEEN 1 AND 600000;



-- Exemplos de consultas 
SELECT cd_tip_tuss, cd_tuss, ds_tuss, cd_convenio, cd_pro_fat, dt_fim_vigencia
FROM (
  SELECT cd_tip_tuss, cd_tuss, ds_tuss, cd_convenio, cd_pro_fat, dt_fim_vigencia
  FROM TUSS
  WHERE cd_tip_tuss = '19'
    AND dt_fim_vigencia IS NULL
  ORDER BY ds_tuss
)
WHERE ROWNUM <= 600000;



WITH OrderedTuss AS (
  SELECT cd_tip_tuss, cd_tuss, ds_tuss, cd_convenio, cd_pro_fat, dt_fim_vigencia,
         ROW_NUMBER() OVER (ORDER BY ds_tuss) AS row_num
  FROM TUSS
  WHERE cd_tip_tuss = '19'
    AND dt_fim_vigencia IS NULL
)
SELECT cd_tip_tuss, cd_tuss, ds_tuss, cd_convenio, cd_pro_fat, dt_fim_vigencia
FROM OrderedTuss
WHERE row_num > 500000;



WITH OrderedTuss AS (
  SELECT cd_tip_tuss, cd_tuss, ds_tuss, cd_convenio, cd_pro_fat, dt_fim_vigencia,
         ROW_NUMBER() OVER (ORDER BY ds_tuss) AS row_num
  FROM TUSS
  WHERE cd_tip_tuss = '19'
    AND dt_fim_vigencia IS NULL
)
SELECT cd_tip_tuss, cd_tuss, ds_tuss, cd_convenio, cd_pro_fat, dt_fim_vigencia
FROM OrderedTuss
WHERE row_num BETWEEN 1 AND 500000;
