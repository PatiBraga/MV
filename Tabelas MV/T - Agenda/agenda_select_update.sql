SELECT * 
FROM it_agenda_central
WHERE cd_agenda_central = 285700
-----

SELECT * 
from   log_opera_agenda_central
WHERE cd_log_opera_agenda =  3231820      
-----

SELECT tabela setor
-----

SELECT * FROM SETOR
ORDER BY cd_setor;


-- SELECT tabela  
SELECT cd_agenda_central, cd_escala_central, cd_unidade_atendimento, cd_prestador, cd_setor
FROM agenda_central
WHERE  cd_escala_central = 27867
/

SELECT cd_escala_central, cd_unidade_atendimento, cd_setor
FROM escala_central


SELECT * escala_central;
FROM escala_central
WHERE cd_setor = 1
/

-- SELECT entre as tabelas agenda_central e escala_central
SELECT
    ac.cd_agenda_central,
    ac.cd_escala_central,
    ac.cd_unidade_atendimento,
    ac.cd_prestador,
    ac.cd_setor,
    ec.cd_unidade_atendimento AS escala_cd_unidade_atendimento,
    ec.cd_setor AS escala_cd_setor
FROM
    agenda_central ac
JOIN
    escala_central ec ON ac.cd_escala_central = ec.cd_escala_central
WHERE
    ac.cd_escala_central = 27867;

/*
Explicação do JOIN entre as duas tabelas agenda_central e escala_central
1. FROM agenda_central ac: Começamos pela tabela agenda_central, dando o alias ac.
2. JOIN escala_central ec ON ac.cd_escala_central = ec.cd_escala_central: Realizamos o JOIN com a tabela escala_central, usando cd_escala_central como chave de 
junção. A tabela escala_central recebe o alias ec.
3. WHERE ac.cd_escala_central = 27867: Filtramos os registros onde cd_escala_central seja igual a 27867 na tabela agenda_central.
4. Seleção das colunas: Selecionamos as colunas da tabela agenda_central (cd_agenda_central, cd_escala_central, cd_unidade_atendimento, cd_prestador, cd_setor) 
e também as colunas de escala_central (cd_unidade_atendimento, cd_setor), mas renomeando para não haver conflito de nomes (escala_cd_unidade_atendimento, 
escala_cd_setor).
*/

/
UPDATE escala_central
SET cd_setor = 35
WHERE cd_escala_central = 27867
/

COMMIT;
/
-- Select tabela
SELECT * FROM it_agenda_central
/
