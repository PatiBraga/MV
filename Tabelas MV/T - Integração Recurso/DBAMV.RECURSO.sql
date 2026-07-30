--  consulta a tabela recurso
SELECT * FROM  recurso ORDER BY cd_set_exa asc;

SELECT * FROM itped_rx
WHERE cd_recurso = 26;

UPDATE recurso
SET nm_recurso = 'LOGIQP6' 
WHERE CD_RECURSO = 10;

DELETE FROM RECURSO WHERE cd_recurso = '30';

SELECT * FROM cd_recurso = 26;

SELECT * FROM ITPED_RX_RECURSO

SELECT * FROM modalidade_exame ORDER BY cd_modalidade_exame ASC;


--  consulta a tabela SET_EXA que � referente aos setores dos exames cadastrados
SELECT * FROM SET_exa
ORDER BY cd_set_exa ASC;

-- query para inserir um novo recurso vinculando a um setor (neste caso  foi Ecocardiograma/Doppler)

INSERT INTO recurso (cd_recurso, cd_set_exa, nm_recurso, sn_sala)
  VALUES (
  (SELECT COALESCE(Max(CD_RECURSO), 0) + 1 FROM RECURSO),
  '25',
  'HEMOUS',
  'S'
  );


-- Altera a atividade do recurso
UPDATE RECURSO
SET SN_SALA = 'S'
WHERE CD_RECURSO = 26;


UPDATE RECURSO
SET cd_set_exa = '31'
WHERE CD_RECURSO = 21;


-- Verificar modalidade 

SELECT * FROM MODALIDADE_EXAME
ORDER by cd_modalidade_exame;


SELECT cd_set_exa, nm_set_exa
FROM set_exa
ORDER by cd_set_exa;





