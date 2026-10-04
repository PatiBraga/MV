
SELECT
    s.sid,
    s.serial#,
    s.username,
    s.osuser,
    s.machine,
    s.program,
    s.status,
    o.object_name,
    l.locked_mode,
    s.logon_time,
    q.sql_text
FROM
    v$locked_object l
    JOIN all_objects o ON o.object_id = l.object_id
    JOIN v$session s ON s.sid = l.session_id
    LEFT JOIN v$sql q ON q.sql_id = s.sql_id
WHERE
    o.object_name = 'IT_AGENDA_CENTRAL'
ORDER BY s.logon_time;
-------------------------------------------------
/*
Comando utilizado em bancos de dados Oracle para encerrar (matar) uma sessão específica que está em execução no servidor.
ALTER SYSTEM KILL SESSION 'SID,SERIAL#' IMMEDIATE;

-- Significado de cada parte:
ALTER SYSTEM — comando administrativo que altera configurações ou estado do sistema de banco de dados, exigindo privilégios elevados (normalmente SYSDBA ou privilégio ALTER SYSTEM).
KILL SESSION — instrução que solicita ao Oracle o encerramento de uma sessão de usuário específica.
2343 → SID (Session ID), o identificador numérico da sessão dentro da instância.
4639 → SERIAL# (número de série), usado para garantir que o SID corresponda exatamente àquela sessão (evita matar uma sessão diferente que tenha reutilizado o mesmo SID após reinício).
IMMEDIATE — instrui o Oracle a realizar rollback de transações pendentes e liberar recursos da sessão o mais rápido possível, sem aguardar o próximo momento de verificação interna do banco.
*/

ALTER SYSTEM KILL SESSION '2343,4639' IMMEDIATE;


ALTER SYSTEM KILL SESSION '888,12920' IMMEDIATE;


ALTER SYSTEM KILL SESSION '887,33611' IMMEDIATE;


ALTER SYSTEM KILL SESSION '215,6646' IMMEDIATE;
---------------------------------------------------

/*
Script para Encerrar Múltiplas Sessões no Oracle
O comando ALTER SYSTEM KILL SESSION não aceita múltiplos SIDs em uma única instrução. Para derrubar vários usuários de uma vez, utiliza-se um bloco PL/SQL com cursor, ou a geração dinâmica dos comandos.
*/
-- Opção 1: Bloco PL/SQL automático

BEGIN
  FOR sessao IN (
    SELECT sid, serial#
    FROM v$session
    WHERE username = 'NOME_DO_USUARIO'
  ) LOOP
    EXECUTE IMMEDIATE
      'ALTER SYSTEM KILL SESSION ''' || sessao.sid || ',' || sessao.serial# || ''' IMMEDIATE';
  END LOOP;
END;
/   
-- Descrição -> O bloco percorre todas as sessões do usuário informado e executa o encerramento de forma dinâmica, sem necessidade de listar SID e SERIAL# manualmente.
---------------------------------------------------
    
-- Opção 2: Gerar os comandos para execução manual
    
SELECT 'ALTER SYSTEM KILL SESSION ''' || sid || ',' || serial# || ''' IMMEDIATE;' AS comando
FROM v$session
WHERE username IN ('USUARIO1', 'USUARIO2', 'USUARIO3');
-- Descrição -> Gera uma lista de comandos prontos para colar e executar, útil quando se deseja revisar antes de aplicar.
---------------------------------------------------

-- Opção 3: Filtrar por critério (ex: sessões inativas)

BEGIN
  FOR sessao IN (
    SELECT sid, serial#
    FROM v$session
    WHERE status = 'INACTIVE'
    AND username IS NOT NULL
  ) LOOP
    EXECUTE IMMEDIATE
      'ALTER SYSTEM KILL SESSION ''' || sessao.sid || ',' || sessao.serial# || ''' IMMEDIATE';
  END LOOP;
END;
/
-- Descrição -> Encerra todas as sessões inativas de usuários, mantendo apenas as conexões ativas no banco.
---------------------------------------------------

-- Encerramento de Sessões Ativas por Critério

BEGIN
  FOR sessao IN (
    SELECT sid, serial#
    FROM v$session
    WHERE status = 'ACTIVE'
    AND username IS NOT NULL
  ) LOOP
    EXECUTE IMMEDIATE
      'ALTER SYSTEM KILL SESSION ''' || sessao.sid || ',' || sessao.serial# || ''' IMMEDIATE';
  END LOOP;
END;
/

-- Descrição -> Encerra todas as sessões com status ativo no banco, exceto conexões internas sem usuário associado.
-- Observação -> Sessões ativas podem estar executando transações em andamento; o encerramento forçado causa rollback automático.
