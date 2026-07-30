-- Paciente Óbito não consegue lançar pedido
-- Tabela paciente
SELECT * FROM paciente


-- Verificar paciente com situaçãoo de óbito
SELECT tp_situacao
FROM paciente
WHERE tp_situacao = 'O';


-- Situação de obito
SELECT tp_situacao, nm_paciente, cd_paciente FROM paciente
WHERE tp_situacao = 'O';


-- Verificar paciente para realizar a retirado do óbito
SELECT tp_situacao, nm_paciente, cd_paciente 
FROM paciente
WHERE CD_PACIENTE = 113815;

-- Tirar o óbito
UPDATE paciente SET tp_situacao = 'N' WHERE CD_PACIENTE = 113815;

-- Voltar o óbito
UPDATE paciente SET tp_situacao = 'O' WHERE CD_PACIENTE = 113815;

