-- unificar cadastros duplicados (dois prontuários/pacientes) no MV, usando a rotina de Transferência de Dados de Pacientes (M_TROCPAC), que faz a “unificação dos prontuários” transferindo os dados de um paciente origem para um paciente destino .

Pré-requisitos (importante)
Permissão/acesso ao módulo Serviços de Apoio / Serviço Arquivo Médico e à rotina Transferência de Dados de Paciente (M_TROCPAC) .
O usuário precisa ter acesso às movimentações relacionadas ao Cadastro de Paciente (pois a transferência impacta os dados cadastrais) .
Se o paciente de origem tiver pasta/prontuário SAME gerado com movimentações/documentos, pode ser necessário regularizar isso antes (detalho abaixo) .
Passo a passo (unificação de dois cadastros)
Acesse: Serviços de Apoio / Serviço Arquivo Médico / Configurações / Transferência de Dados de Paciente (rotina M_TROCPAC)
No bloco Paciente Origem, informe o código do paciente origem (o cadastro que será “absorvido”).
No bloco Paciente Destino, informe o código do paciente destino (cadastro correto que permanecerá).
Preencha o Motivo e clique em Continuar.
Confirme as mensagens: o sistema avisa que os dados do paciente origem serão transferidos para o destino e que o processo é irreversível
Ao final, o sistema pode perguntar se você deseja excluir o paciente original (origem)
Se der erro/bloqueio (pontos que mais travam)
Datas de nascimento divergentes entre origem e destino: o sistema impede a transferência .
Conflito de internação (paciente origem com internação em conflito com o destino): também impede a unificação .
Se o paciente origem tiver pasta/prontuário SAME e movimentações, a transferência não ocorre até excluir:
os documentos/movimentações na tela Manutenção de Documentos e depois
a pasta (prontuário) SAME na tela Cadastro de Prontuários
Depois disso, os documentos excluídos devem ser lançados no paciente destino para manter o histórico .
Para auditoria, o log da transferência pode ser consultado em Atendimento / Internação / Consultas / Log de Transferência de Pacientes .
Me confirma rapidinho: qual CD_PACIENTE vai ficar como Destino (o “correto”) e qual é o Origem (duplicado)?
— Assistente de Suporte MV