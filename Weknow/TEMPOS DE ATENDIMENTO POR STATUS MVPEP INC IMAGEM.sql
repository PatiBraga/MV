SELECT
  PED_RX.HR_PEDIDO,
(SELECT max(m.dh_criacao)
                     FROM dbamv.PW_DOCUMENTO_CLINICO m, dbamv.PW_EDITOR_CLINICO n, editor.EDITOR_REGISTRO o, editor.EDITOR_REGISTRO_CAMPO p, editor.EDITOR_CAMPO q
                     where n.cd_documento_clinico = m.cd_documento_clinico
                     AND n.cd_editor_registro = o.cd_registro
                     and p.cd_registro = o.cd_registro
                     AND p.cd_campo = editor.q.cd_campo
                     and n.cd_documento = 61
                     and q.ds_identificador IN ('STATUS')
                     and to_char(REGEXP_REPLACE(p.lo_conteudo, '[^A-Za-z ]', '')) = 'Em preparo'
                     and (tp_status = 'ASSINADO' or tp_status = 'FECHADO')
                     and m.cd_atendimento = ATENDIME.CD_ATENDIMENTO
                     and m.CD_DOCUMENTO_CLINICO = (select distinct r.CD_DOCUMENTO_CLINICO
                                         FROM dbamv.PW_DOCUMENTO_CLINICO r, dbamv.PW_EDITOR_CLINICO s, editor.EDITOR_REGISTRO t, editor.EDITOR_REGISTRO_CAMPO u, editor.EDITOR_CAMPO v
                                         where s.cd_documento_clinico = m.cd_documento_clinico
                                         and r.cd_documento_clinico = s.cd_documento_clinico
                                         AND s.cd_editor_registro = t.cd_registro
                                         and u.cd_registro = t.cd_registro
                                         AND u.cd_campo = editor.v.cd_campo
                                         and s.cd_documento = 61
                                         and v.ds_identificador IN ('EXAME')
                                         and (tp_status = 'ASSINADO' or tp_status = 'FECHADO')
                                         and r.cd_atendimento = ATENDIME.CD_ATENDIMENTO
                                         and to_number(REGEXP_SUBSTR(u.lo_conteudo, '^[0-9]+')) = ITPED_RX.CD_ITPED_RX))HR_PREPARO,
(SELECT max(m.dh_criacao)
                     FROM dbamv.PW_DOCUMENTO_CLINICO m, dbamv.PW_EDITOR_CLINICO n, editor.EDITOR_REGISTRO o, editor.EDITOR_REGISTRO_CAMPO p, editor.EDITOR_CAMPO q
                     where n.cd_documento_clinico = m.cd_documento_clinico
                     AND n.cd_editor_registro = o.cd_registro
                     and p.cd_registro = o.cd_registro
                     AND p.cd_campo = editor.q.cd_campo
                     and n.cd_documento = 61
                     and q.ds_identificador IN ('STATUS')
                     and to_char(REGEXP_REPLACE(p.lo_conteudo, '[^A-Za-z ]', '')) = 'Em exame'
                     and (tp_status = 'ASSINADO' or tp_status = 'FECHADO')
                     and m.cd_atendimento = ATENDIME.CD_ATENDIMENTO
                     and m.CD_DOCUMENTO_CLINICO = (select distinct r.CD_DOCUMENTO_CLINICO
                                         FROM dbamv.PW_DOCUMENTO_CLINICO r, dbamv.PW_EDITOR_CLINICO s, editor.EDITOR_REGISTRO t, editor.EDITOR_REGISTRO_CAMPO u, editor.EDITOR_CAMPO v
                                         where s.cd_documento_clinico = m.cd_documento_clinico
                                         and r.cd_documento_clinico = s.cd_documento_clinico
                                         and u.cd_registro = t.cd_registro
                                         AND u.cd_campo = editor.v.cd_campo
                                         and s.cd_documento = 61
                                         and v.ds_identificador IN ('EXAME')
                                         and (tp_status = 'ASSINADO' or tp_status = 'FECHADO')
                                         and r.cd_atendimento = ATENDIME.CD_ATENDIMENTO
                                         and to_number(REGEXP_SUBSTR(u.lo_conteudo, '^[0-9]+')) = ITPED_RX.CD_ITPED_RX))HR_EXAME,                     
(SELECT max(m.dh_criacao)
                     FROM dbamv.PW_DOCUMENTO_CLINICO m, dbamv.PW_EDITOR_CLINICO n, editor.EDITOR_REGISTRO o, editor.EDITOR_REGISTRO_CAMPO p, editor.EDITOR_CAMPO q
                     where n.cd_documento_clinico = m.cd_documento_clinico
                     AND n.cd_editor_registro = o.cd_registro
                     and p.cd_registro = o.cd_registro
                     AND p.cd_campo = editor.q.cd_campo
                     and n.cd_documento = 61
                     and q.ds_identificador IN ('STATUS')
                     and to_char(REGEXP_REPLACE(p.lo_conteudo, '[^A-Za-z ]', '')) = 'Finalizado'
                     and (tp_status = 'ASSINADO' or tp_status = 'FECHADO')
                     and m.cd_atendimento = ATENDIME.CD_ATENDIMENTO
                     and m.CD_DOCUMENTO_CLINICO = (select distinct r.CD_DOCUMENTO_CLINICO
                                         FROM dbamv.PW_DOCUMENTO_CLINICO r, dbamv.PW_EDITOR_CLINICO s, editor.EDITOR_REGISTRO t, editor.EDITOR_REGISTRO_CAMPO u, editor.EDITOR_CAMPO v
                                         where s.cd_documento_clinico = m.cd_documento_clinico
                                         and r.cd_documento_clinico = s.cd_documento_clinico
                                         and u.cd_registro = t.cd_registro
                                         AND u.cd_campo = editor.v.cd_campo
                                         and s.cd_documento = 61
                                         and v.ds_identificador IN ('EXAME')
                                         and (tp_status = 'ASSINADO' or tp_status = 'FECHADO')
                                         and r.cd_atendimento = ATENDIME.CD_ATENDIMENTO
                                         and to_number(REGEXP_SUBSTR(u.lo_conteudo, '^[0-9]+')) = ITPED_RX.CD_ITPED_RX))HR_FINALIZADO,               
  DECODE(ATENDIME.TP_ATENDIMENTO,'U','Emergência','I','Internado','E','Externo')tipo_atendimento,
  PACIENTE.CD_PACIENTE,
  ATENDIME.cd_atendimento,
  ITPED_RX.CD_PED_RX,
  PACIENTE.nm_paciente,
  EXA_RX.CD_EXA_RX,
  EXA_RX.DS_EXA_RX,
  decode(PED_RX.TP_MOTIVO,'U','Sim',null)URGENTE,
  PRESTADOR.NM_PRESTADOR,
  RECURSO.NM_RECURSO
FROM
  DBAMV.PED_RX
  INNER JOIN ITPED_RX ON PED_RX.CD_PED_RX = ITPED_RX.CD_PED_RX
  INNER JOIN ATENDIME ON PED_RX.CD_ATENDIMENTO = ATENDIME.CD_ATENDIMENTO
  INNER JOIN PACIENTE ON PACIENTE.CD_PACIENTE = ATENDIME.CD_PACIENTE
  INNER JOIN EXA_RX ON ITPED_RX.CD_EXA_RX = EXA_RX.CD_EXA_RX
  LEFT JOIN RECURSO ON RECURSO.CD_RECURSO = ITPED_RX.CD_RECURSO
  LEFT JOIN PRESTADOR ON ITPED_RX.CD_PRESTADOR = PRESTADOR.CD_PRESTADOR
WHERE PED_RX.HR_PEDIDO between '20/09/2025' and '21/09/2025'
--AND EXA_RX.CD_EXA_RX IN (select CD_EXA_RX from EXA_SET where EXA_SET.CD_EXA_RX = EXA_RX.CD_EXA_RX AND CD_SET_EXA IN (24,4,5,7,8,30,31,32))
AND PED_RX.CD_SET_EXA IN (4,5,7,8,20,30,31,32)
AND EXA_RX.CD_EXA_RX NOT IN (1050,1051)
--AND ITPED_RX.CD_PED_RX = 193375