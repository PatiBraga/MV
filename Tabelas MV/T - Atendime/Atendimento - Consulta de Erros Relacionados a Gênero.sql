-- Consulta de Erros Relacionados a Gênero

SELECT *
FROM   caught_errors
WHERE  UPPER(msg) LIKE UPPER('%genero não existe%')
ORDER BY dt DESC;
--------------------------------------------------------------------------

-- Título: Consulta do Código-Fonte com Referência a Identidade de Gênero

SELECT *
FROM   all_source
WHERE  UPPER(text) LIKE UPPER('%identidade genero%');
--------------------------------------------------------------------------

-- Título: Consulta dos Dados de Identidade de Gênero do Paciente

SELECT sn_util_identidade_genero,
       cd_identidade_genero
FROM   paciente
WHERE  cd_paciente = 111743;
--------------------------------------------------------------------------

-- Título: Consulta dos Dados de Identidade de Gênero do Paciente 326987

SELECT sn_util_identidade_genero,
       cd_identidade_genero
FROM   paciente
WHERE  cd_paciente = 326987;
--------------------------------------------------------------------------

-- Título: Consulta dos Atendimentos do Paciente 
 
SELECT *
FROM   atendime
WHERE  cd_paciente = 111743;
--------------------------------------------------------------------------

-- Título: Consulta do Atendimento 

SELECT *
FROM   atendime
WHERE  cd_atendimento = 1065907;
