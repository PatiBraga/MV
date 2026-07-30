-- Validar protocolo
SELECT * FROM protocolo_doc
WHERE cd_protocolo_doc = 90915;

-- Verificar setores  
SELECT cd_setor, nm_setor  FROM SETOR
ORDER BY cd_setor ASC;

-- Realizar update 
UPDATE protocolo_doc
SET cd_setor_destino = '10'
WHERE cd_protocolo_doc = '90915';

