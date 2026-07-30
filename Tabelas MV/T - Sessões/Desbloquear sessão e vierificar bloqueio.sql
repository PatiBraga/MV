-- MAPA VISUAL HORIZONTAL
-> Identificar sessão bloqueada -> Coletar SID e SERIAL# -> Validar usuário/máquina -> Executar KILL SESSION -> Confirmar término

SID ? Identificador da sessão
SERIAL# ? Número serial da sessão
USERNAME ? Usuário dono da sessão
MACHINE ? Máquina de origem

-- 1) Identifique e libere o bloqueio

SELECT s.sid, s.serial#, s.username, s.machine
FROM gv$locked_object l
JOIN dba_objects o ON o.object_id = l.object_id
JOIN gv$session s ON s.sid = l.session_id
WHERE o.object_name = 'PED_RX';
/


SELECT
    s.sid,
    s.serial#,
    s.username,
    s.machine,
    s.program,
    s.status
FROM gv$locked_object l
JOIN dba_objects o ON o.object_id = l.object_id
JOIN gv$session s ON s.sid = l.session_id
WHERE o.object_name = 'PED_RX';


-- 2?? Matar a sessão
ALTER SYSTEM KILL SESSION 'SID = '2282', SERIAL# = 38082';


-- Exemplo prática
ALTER SYSTEM KILL SESSION '1234,56789';


-- ?? Forçar término imediato (se necessário)
ALTER SYSTEM KILL SESSION '1234,56789' IMMEDIATE;


-- Aguarde 10 segundos e tente com WAIT
ALTER TABLE "DBAMV"."PED_RX"
ENABLE CONSTRAINT "PED_RX_PRESTADOR_FK"
WAIT 60;


-- Se falhar novamente, use NOVALIDATE
ALTER TABLE "DBAMV"."PED_RX"
ENABLE NOVALIDATE CONSTRAINT "PED_RX_PRESTADOR_FK";
-- Ativa a constraint sem validar dados antigos — evita lock prolongado.


-- ?? Confirmar que a sessão foi encerrada
SELECT sid, serial#, username, status
FROM v$session
WHERE sid = 2282;


-- Valide depois (em horário de menor uso)
ALTER TABLE "DBAMV"."PED_RX"
VALIDATE CONSTRAINT "PED_RX_PRESTADOR_FK";


------------------------------------------------------
Comando	Resultado
1??	Identifique bloqueio ->	Encontra sessão travada
2??	KILL SESSION	-> Libera lock
3??	ENABLE CONSTRAINT WAIT 60 ->	Tenta com paciência
4??	ENABLE NOVALIDATE	-> Ativa sem validar (seguro)
-------------------------------------------------------