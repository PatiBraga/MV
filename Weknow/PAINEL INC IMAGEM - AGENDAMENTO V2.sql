
--QUERY RETORNA OS PACIENTES DE AGENDAMENTO EXTERNO GERADO PELA AGENDA
SELECT
  TO_CHAR(IT_AGENDA_CENTRAL.hr_agenda,'DD/MM/YYYY HH24:MI') DATA_HORA,
  'Externo' tipo_atendimento,
  IT_AGENDA_CENTRAL.CD_PACIENTE,
  IT_AGENDA_CENTRAL.cd_atendimento,
  ITPED_RX.CD_PED_RX,
  it_Agenda_central.nm_paciente,
  EXA_RX.CD_EXA_RX,
  EXA_RX.DS_EXA_RX,
  decode(ITPED_RX.TP_MOTIVO,'U','Sim',null)URGENTE,
  nvl(PRESTADOR.NM_PRESTADOR,'<img src="/data/images_externas/20p_ate.png">')NM_PRESTADOR,
  nvl(RECURSO.NM_RECURSO,'<img src="/data/images_externas/20p_ate.png">')NM_RECURSO,
NVL((SELECT to_char(REGEXP_REPLACE(p.lo_conteudo, '[^A-Za-z ]', ''))
                     FROM dbamv.PW_DOCUMENTO_CLINICO m, dbamv.PW_EDITOR_CLINICO n, editor.EDITOR_REGISTRO o, editor.EDITOR_REGISTRO_CAMPO p, editor.EDITOR_CAMPO q
                     where n.cd_documento_clinico = m.cd_documento_clinico
                     AND n.cd_editor_registro = o.cd_registro
                     and p.cd_registro = o.cd_registro
                     AND p.cd_campo = editor.q.cd_campo
                     and n.cd_documento = 61
                     and q.ds_identificador IN ('STATUS')
                     and (tp_status = 'ASSINADO' or tp_status = 'FECHADO')
                     and m.cd_atendimento = IT_AGENDA_CENTRAL.CD_ATENDIMENTO
                     and m.dh_criacao = (select max(m.dh_criacao)
                                         FROM dbamv.PW_DOCUMENTO_CLINICO m, dbamv.PW_EDITOR_CLINICO n, editor.EDITOR_REGISTRO o, editor.EDITOR_REGISTRO_CAMPO p, editor.EDITOR_CAMPO q
                                         where n.cd_documento_clinico = m.cd_documento_clinico
                                         AND n.cd_editor_registro = o.cd_registro
                                         and p.cd_registro = o.cd_registro
                                         AND p.cd_campo = editor.q.cd_campo
                                         and n.cd_documento = 61
                                         and q.ds_identificador IN ('EXAME')
                                         and (tp_status = 'ASSINADO' or tp_status = 'FECHADO')
                                         and m.cd_atendimento = IT_AGENDA_CENTRAL.CD_ATENDIMENTO
                                         and to_number(REGEXP_SUBSTR(p.lo_conteudo, '^[0-9]+')) = ITPED_RX.CD_ITPED_RX)),
    CASE
        WHEN IT_AGENDA_CENTRAL.cd_atendimento IS NULL THEN 'Agendado'
        WHEN IT_AGENDA_CENTRAL.cd_atendimento IS NOT NULL AND (ITPED_RX.CD_PRESTADOR is null
                                                          OR ITPED_RX.CD_RECURSO is null
                                                          OR (select x.tp_situacao from guia x where x.cd_guia = ITPED_RX.cd_guia) in ('P','S','G','N'))
                                                          THEN 'Aguardando Recepção'
        WHEN IT_AGENDA_CENTRAL.cd_atendimento IS NOT NULL AND ITPED_RX.CD_PRESTADOR IS NOT NULL AND ITPED_RX.CD_RECURSO IS NOT NULL THEN 'Aguardando Enfermagem'
    END)STATUS,
(select decode(x.tp_situacao,'P','Pendente','S','Solicitada','A','Autorizada','N','Negada','G','Negociação')
from guia x
where x.cd_guia = ITPED_RX.cd_guia)status_guia

FROM
  DBAMV.AGENDA_CENTRAL
  INNER JOIN IT_AGENDA_CENTRAL ON AGENDA_CENTRAL.cd_agenda_central = it_agenda_central.cd_agenda_central
  INNER JOIN ITEM_AGENDAMENTO ON IT_AGENDA_CENTRAL.CD_ITEM_AGENDAMENTO = ITEM_AGENDAMENTO.CD_ITEM_AGENDAMENTO
  INNER JOIN EXA_RX ON ITEM_AGENDAMENTO.CD_EXA_RX = EXA_RX.CD_EXA_RX
  LEFT OUTER JOIN (SELECT ITPED_RX.CD_PED_RX, ITPED_RX.CD_EXA_RX,ITPED_RX.CD_ITPED_RX, ITPED_RX.CD_GUIA ,PED_RX.CD_ATENDIMENTO, PED_RX.TP_MOTIVO, ITPED_RX.CD_RECURSO, ITPED_RX.CD_PRESTADOR FROM ITPED_RX, PED_RX WHERE ITPED_RX.CD_PED_RX = PED_RX.CD_PED_RX)ITPED_RX
    ON IT_AGENDA_CENTRAL.cd_atendimento = ITPED_RX.CD_ATENDIMENTO AND ITPED_RX.CD_EXA_RX = ITEM_AGENDAMENTO.CD_EXA_RX
  LEFT JOIN RECURSO ON RECURSO.CD_RECURSO = ITPED_RX.CD_RECURSO
  LEFT JOIN PRESTADOR ON ITPED_RX.CD_PRESTADOR = PRESTADOR.CD_PRESTADOR
WHERE NVL(AGENDA_CENTRAL.SN_ATIVO,'N') = 'S'
AND TRUNC(AGENDA_CENTRAL.DT_AGENDA) = trunc(SYSDATE)
AND AGENDA_CENTRAL.TP_AGENDA = 'I'
AND IT_AGENDA_CENTRAL.CD_IT_AGENDA_PAI is null
AND EXA_RX.CD_EXA_RX IN (select CD_EXA_RX from EXA_SET where EXA_SET.CD_EXA_RX = EXA_RX.CD_EXA_RX AND CD_SET_EXA IN (24,4,5,7,8,30,31,32))
AND EXA_RX.CD_EXA_RX NOT IN (1050,1051)
and IT_AGENDA_CENTRAL.hr_agenda <= sysdate+1/24 --exibir somente agendas com no máximo 1h após horário atual
--and it_Agenda_central.nm_paciente = 'JOSE RENATO CARNIELETTO '


UNION  ALL

--QUERY RETORNA OS PACIENTES INTERNADOS OU URGÊNCIA
SELECT
  TO_CHAR(PED_RX.HR_PEDIDO,'DD/MM/YYYY HH24:MI') DATA_HORA,
  DECODE(ATENDIME.TP_ATENDIMENTO,'U','Emergência','I','Internado','E','Externo')tipo_atendimento,
  PACIENTE.CD_PACIENTE,
  ATENDIME.cd_atendimento,
  ITPED_RX.CD_PED_RX,
  PACIENTE.nm_paciente,
  EXA_RX.CD_EXA_RX,
  EXA_RX.DS_EXA_RX,
  decode(PED_RX.TP_MOTIVO,'U','Sim',null)URGENTE,
  nvl(PRESTADOR.NM_PRESTADOR,'<img src="/data/images_externas/20p_ate.png">')NM_PRESTADOR,
  nvl(RECURSO.NM_RECURSO,'<img src="/data/images_externas/20p_ate.png">')NM_RECURSO,

  NVL((SELECT to_char(REGEXP_REPLACE(p.lo_conteudo, '[^A-Za-z ]', ''))
                     FROM dbamv.PW_DOCUMENTO_CLINICO m, dbamv.PW_EDITOR_CLINICO n, editor.EDITOR_REGISTRO o, editor.EDITOR_REGISTRO_CAMPO p, editor.EDITOR_CAMPO q
                     where n.cd_documento_clinico = m.cd_documento_clinico
                     AND n.cd_editor_registro = o.cd_registro
                     and p.cd_registro = o.cd_registro
                     AND p.cd_campo = editor.q.cd_campo
                     and n.cd_documento = 61
                     and q.ds_identificador IN ('STATUS')
                     and (tp_status = 'ASSINADO' or tp_status = 'FECHADO')
                     and m.cd_atendimento = ATENDIME.CD_ATENDIMENTO
                     and m.dh_criacao = (select max(m.dh_criacao)
                                         FROM dbamv.PW_DOCUMENTO_CLINICO m, dbamv.PW_EDITOR_CLINICO n, editor.EDITOR_REGISTRO o, editor.EDITOR_REGISTRO_CAMPO p, editor.EDITOR_CAMPO q
                                         where n.cd_documento_clinico = m.cd_documento_clinico
                                         AND n.cd_editor_registro = o.cd_registro
                                         and p.cd_registro = o.cd_registro
                                         AND p.cd_campo = editor.q.cd_campo
                                         and n.cd_documento = 61
                                         and q.ds_identificador IN ('EXAME')
                                         and (tp_status = 'ASSINADO' or tp_status = 'FECHADO')
                                         and m.cd_atendimento = ATENDIME.CD_ATENDIMENTO
                                         and to_number(REGEXP_SUBSTR(p.lo_conteudo, '^[0-9]+')) = ITPED_RX.CD_ITPED_RX)),
    CASE
        WHEN ATENDIME.cd_atendimento IS NULL THEN 'Agendado'
        WHEN ATENDIME.cd_atendimento IS NOT NULL AND (ITPED_RX.CD_PRESTADOR is null
                                                          OR ITPED_RX.CD_RECURSO is null
                                                          OR (select x.tp_situacao from guia x where x.cd_guia = ITPED_RX.cd_guia) in ('P','S','G','N'))
                                                          THEN 'Aguardando Recepção'
        WHEN ATENDIME.cd_atendimento IS NOT NULL AND ITPED_RX.CD_PRESTADOR IS NOT NULL AND ITPED_RX.CD_RECURSO IS NOT NULL THEN 'Aguardando Enfermagem'
    END)STATUS,

(select decode(x.tp_situacao,'P','Pendente','S','Solicitada','A','Autorizada','N','Negada','G','Negociação')
from guia x
where x.cd_guia = ITPED_RX.cd_guia)status_guia

FROM
  DBAMV.PED_RX
  INNER JOIN ITPED_RX ON PED_RX.CD_PED_RX = ITPED_RX.CD_PED_RX
  INNER JOIN ATENDIME ON PED_RX.CD_ATENDIMENTO = ATENDIME.CD_ATENDIMENTO
  INNER JOIN PACIENTE ON PACIENTE.CD_PACIENTE = ATENDIME.CD_PACIENTE
  INNER JOIN EXA_RX ON ITPED_RX.CD_EXA_RX = EXA_RX.CD_EXA_RX
  LEFT JOIN RECURSO ON RECURSO.CD_RECURSO = ITPED_RX.CD_RECURSO
  LEFT JOIN PRESTADOR ON ITPED_RX.CD_PRESTADOR = PRESTADOR.CD_PRESTADOR
WHERE TRUNC(PED_RX.HR_PEDIDO) = trunc(SYSDATE)
AND ATENDIME.TP_ATENDIMENTO NOT IN ('E')
AND EXA_RX.CD_EXA_RX IN (select CD_EXA_RX from EXA_SET where EXA_SET.CD_EXA_RX = EXA_RX.CD_EXA_RX AND CD_SET_EXA IN (24,4,5,7,8,30,31,32))
AND EXA_RX.CD_EXA_RX NOT IN (1050,1051)
