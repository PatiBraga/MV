/*
A criação de avisos para captação de órgãos é permitida apenas quando o atendimento é do tipo Busca Ativa na tela de cadastro de cirurgia. 
Dessa forma, ao tentar realizar esse cadastro por meio das telas de cirurgias eletivas, como O_AGENDA e M_AVISO_CIRURGIA, 
o sistema apresentará uma mensagem de validação, impedindo a inclusão.

Diante disso, orientamos que a criação dos avisos relacionados à captação de órgãos seja realizada pela tela M_CADASTRO_CIRURGIA, 
que é a tela adequada para esse tipo de registro no sistema.

Pegar o atendimento de busca ativa, acessar a tela de Cadastro de Cirurgia (M_CADASTRO_CIRURGIA) e proceder com a criação do aviso.
Essa tela tem como finalidade cadastrar a cirurgia do paciente diretamente, sem a necessidade de registro prévio do aviso de cirurgia ou de agendamento. 
Essa tela é geralmente utilizada para efetuar o cadastro de cirurgias de emergência que já foram realizadas, confirmando-as automaticamente. 
Quando acessada pelo menu de Consultas, a tela é apresentada em modo de pesquisa, permitindo a consulta aos registros já cadastrados.
*/

-- 1. Consulta de erros capturados contendo a mensagem "gênero não existe"
SELECT *
  FROM caught_errors
 WHERE UPPER(msg) LIKE UPPER('%genero não existe%')
 ORDER BY dt DESC;
------------------------------------------------------------------------------------

-- 2. Busca de referência da funcionalidade "busca ativa" no código-fonte
SELECT *
  FROM ALL_SOURCE
 WHERE UPPER(TEXT) LIKE UPPER('%busca ativa%');
------------------------------------------------------------------------------------

-- 3. Verificação de identidade de gênero do paciente 111743
SELECT sn_util_identidade_genero, cd_identidade_genero
  FROM paciente
 WHERE cd_paciente = 111743;
------------------------------------------------------------------------------------

-- 4. Verificação de identidade de gênero do paciente 326987
SELECT sn_util_identidade_genero, cd_identidade_genero
  FROM paciente
 WHERE cd_paciente = 326987;
------------------------------------------------------------------------------------

-- 5. Verificação de dados cadastrais do paciente 1092724
SELECT *
  FROM paciente
 WHERE cd_paciente = 1092724;
------------------------------------------------------------------------------------

-- 6. Verificação de busca ativa do paciente 326987
SELECT sn_busca_ativa
  FROM paciente
 WHERE cd_paciente = 326987;
------------------------------------------------------------------------------------

-- 7. Verificação de busca ativa e tipo de atendimento (atendimento 1065907)
SELECT cd_paciente, sn_busca_ativa, tp_atendimento
  FROM atendime
 WHERE cd_atendimento = 1065907;
------------------------------------------------------------------------------------

-- 8. Verificação de atendimentos vinculados ao paciente 1117
SELECT *
  FROM atendime
 WHERE cd_paciente = 1117;
------------------------------------------------------------------------------------

-- 9. Consulta ao domínio de identidade de gênero
SELECT *
  FROM identidade_genero;
