-- Criação de Sinônimo Público para a Tabela PACIENTE

  CREATE OR REPLACE NONEDITIONABLE PUBLIC SYNONYM "PACIENTE" FOR "DBAMV"."PACIENTE";

/*
-> CREATE OR REPLACE -> Cria o objeto caso não exista, ou substitui o sinônimo já existente com o mesmo nome, sem necessidade de excluí-lo antes.
-> NONEDITIONABLE -> Indica que o sinônimo não é sensível a edições (recurso de edições do Oracle, usado em ambientes com múltiplas versões de objetos ativos simultaneamente). Na prática, para sinônimos, esse é o comportamento padrão.
-> PUBLIC SYNONYM "PACIENTE" -> Cria um sinônimo público chamado PACIENTE, acessível por qualquer usuário do banco de dados com permissão de consulta, sem precisar especificar o schema (DBAMV).
-> FOR "DBAMV"."PACIENTE" -> Define o objeto real representado pelo sinônimo: a tabela PACIENTE localizada no schema DBAMV.

Na prática, esse comando permite executar SELECT * FROM PACIENTE; sem precisar digitar DBAMV.PACIENTE, pois o Oracle redireciona automaticamente a chamada para a tabela correta do schema DBAMV.
*/
