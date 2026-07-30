SELECT
t.cd_registro_auditoria,
cd_atendimento,
t.nm_maquina_registro_auditoria,
t.ds_modulo_auditoria,
t.cd_usuario_registro_auditoria,
decode(TP_REGISTRO_AUDITORIA,
'ACE', 'ACESSO',
'AUT', 'AUTORIZACAO',
'ALT', 'ALTERACAO',
'EXC', 'EXCLUSAO',
'CON', 'CONSULTA',
'INC', 'INCLUSAO',
'FEC', 'FECHAMENTO',
'IMP', 'IMPRESSAO',
'COP', 'COPIA',
'SUS', 'SUPENSAO',
'ASS', 'ASSUMIR') TIPO_ACESSO,

TO_CHAR(t.tz_registro_auditoria, 'DD-MM-YYYY HH24:MI:SS') AS tz_registro_auditoria

FROM
REGISTRO_AUDITORIA t
WHERE t.cd_atendimento IN (547700, 546495, 547727) --INSERIR ATENDIMENTO AQUI

ORDER BY 7 DESC