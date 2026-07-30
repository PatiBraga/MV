/* Movimentei incorretamente para o setor incorreto por equivoco, teria possibilidade 
de cancelar o protocolo ou mudar para o setor correto seria do seto de faturamento (5) 
para same (10):*/

-- Tela M_PROT_RECEB
-- Tablela - PROTOCOLO_DOC.CD_PROTOCOLO_DOC
-- Verificar doc

SELECT * FROM protocolo_doc
WHERE cd_protocolo_doc = 90915;

-- Verificar setores  
SELECT cd_setor, nm_setor  FROM SETOR
ORDER BY cd_setor ASC;

-- Realizar update 
UPDATE protocolo_doc
SET cd_setor_destino = '10'
WHERE cd_protocolo_doc = '90915';

-- FETCH FIRST 10 ROWS ONLY


