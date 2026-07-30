-- ============================================================
-- OBJETIVO: Identificar itens do protocolo de documento 102754
--           que não possuem atendimento correspondente
--           na tabela ATENDIME (registros órfãos).
-- SCHEMA   : DBAMV
-- AUTOR    : Pati Braga
-- DATA     : 24/06/2026
-- ============================================================

SELECT *
FROM dbamv.it_protocolo_doc i   -- Tabela de itens vinculados a protocolos de documentos
WHERE i.cd_protocolo_doc = 102754  -- Filtra pelo protocolo específico de número 102754
  AND NOT EXISTS (
      -- Subconsulta correlacionada: verifica se existe atendimento
      -- correspondente ao cd_atendimento do item do protocolo.
      -- Caso NÃO exista nenhuma linha, o item é incluído no resultado,
      -- indicando uma inconsistência referencial (atendimento inexistente).
      SELECT 1
      FROM atendime a
      WHERE a.cd_atendimento = i.cd_atendimento  -- Correlação com a tabela principal
  );
-- ============================================================
-- RESULTADO ESPERADO:
-- Retorna os itens do protocolo 102754 cujo cd_atendimento
-- não possui registro correspondente na tabela ATENDIME.
-- Esses registros indicam possível inconsistência de dados
-- e podem ser candidatos a correção ou investigação.
-- ============================================================
/

SELECT i.*
FROM dbamv.it_protocolo_doc i
LEFT JOIN atendime a ON a.cd_atendimento = i.cd_atendimento
WHERE i.cd_protocolo_doc = 102754
  AND a.cd_atendimento IS NULL;
/

SELECT * FROM itreg_amb WHERE cd_reg_amb = 1195023
/

SELECT * FROM atendime WHERE cd_atendimento =  1180226      -- cd_paciente  = 299398
/

SELECT * FROM dbamv.it_protocolo_doc i WHERE cd_atendimento = 1180226
/


SELECT * FROM dbamv.protocolo_doc i WHERE cd_protocolo_doc = 102782
/

SELECT *
FROM dbamv.it_protocolo_doc i   -- Tabela de itens vinculados a protocolos de documentos
WHERE i.cd_protocolo_doc = 102754 ORDER BY 1
/

                                corrigido --  8180226
UPDATE dbamv.it_protocolo_doc
SET cd_atendimento = 1180226
WHERE cd_it_protocolo_doc = 1210592;

