-- inclusão de uns protocolos médicos no PEP
Contexto técnico (curto)
Módulo: PEP / Gerenciamento de Unidades
Objetos/Telas: Alertas de Protocolos (M_ALERTA_PROTOCOLO), Configurações de Protocolo (M_CONFIGURACOES_PROTOCOLO), Ordem do Protocolo (M_ORDEM_PROTOCOLO)
Evidência na base: o MV orienta cadastrar o “protocolo” como alerta com evento de disparo, podendo anexar PDF e vincular documento a ser preenchido

Orientação prática (curta)
Onde configurar/consultar: Clínica e Assistencial ? Gerenciamento de Unidades ? Configuração ? Tabelas ? PEP ? Alertas de Protocolos
O que fazer:

Criar a mensagem do alerta (descrição, tipos de prestador, setores, mensagem padrão)
(Opcional) anexar documento PDF para exibição junto do alerta
Definir “Disparar evento ao” (ex.: Prescrição, Finalizar Documento, Transferir Leito etc.)
Configurar critérios de disparo/entrada/saída e Documento a ser preenchido (Documento ou Grupo de Documento) + validade
Se quiser exibir na Lista de Pacientes, marcar “Habilita visualização…” e definir sigla, cor, criticidade e ordem
Onde ajustar ordem/criticidade: … ? Tabelas ? PEP ? Ordem do Protocolo (M_ORDEM_PROTOCOLO)
Resumo técnico final (curto)
Impacto técnico: protocolo no PEP é operacionalizado como alerta vinculado a evento + critérios + (opcional) documento, com possibilidade de gerar ação/prescrição conforme configuração
Analista Técnico MV Assist