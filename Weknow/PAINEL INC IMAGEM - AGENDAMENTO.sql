SELECT
  IT_AGENDA_CENTRAL.CD_PEDIDO,
  TO_CHAR(IT_AGENDA_CENTRAL.hr_agenda,'DD/MM/YYYY HH24:MI') DATA_HORA,
  'Externo' tipo_atendimento,
  IT_AGENDA_CENTRAL.CD_PACIENTE,
  IT_AGENDA_CENTRAL.cd_atendimento,
  PED_RX.CD_PED_RX,
  it_Agenda_central.nm_paciente,
  EXA_RX.CD_EXA_RX,
  EXA_RX.DS_EXA_RX,
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
        WHEN IT_AGENDA_CENTRAL.cd_atendimento IS NULL THEN 'Aguardando Recepção'
        WHEN IT_AGENDA_CENTRAL.cd_atendimento IS NOT NULL AND (ITPED_RX.CD_PRESTADOR is null 
                                                          OR ITPED_RX.CD_RECURSO is null 
                                                          OR (select x.tp_situacao from guia x where x.cd_guia = ITPED_RX.cd_guia) in ('P','S','G','N')) 
                                                          THEN 'Aguardando Liberação'
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
  LEFT OUTER JOIN PED_RX ON IT_AGENDA_CENTRAL.cd_atendimento = PED_RX.CD_ATENDIMENTO
  LEFT JOIN ITPED_RX ON ITPED_RX.CD_PED_RX = PED_RX.CD_PED_RX AND ITPED_RX.CD_EXA_RX = ITEM_AGENDAMENTO.CD_EXA_RX
  LEFT JOIN RECURSO ON RECURSO.CD_RECURSO = ITPED_RX.CD_RECURSO
  LEFT JOIN PRESTADOR ON ITPED_RX.CD_PRESTADOR = PRESTADOR.CD_PRESTADOR
WHERE NVL(AGENDA_CENTRAL.SN_ATIVO,'N') = 'S'
AND TRUNC(AGENDA_CENTRAL.DT_AGENDA) = trunc(SYSDATE)
AND AGENDA_CENTRAL.TP_AGENDA = 'I'
AND IT_AGENDA_CENTRAL.CD_IT_AGENDA_PAI is null
AND EXA_RX.CD_EXA_RX IN (select CD_EXA_RX from EXA_SET where EXA_SET.CD_EXA_RX = EXA_RX.CD_EXA_RX AND CD_SET_EXA IN (24,4,5,7,8,30,31,32))
--AND IT_AGENDA_CENTRAL.CD_PACIENTE = 112359
--and it_Agenda_central.nm_paciente = 'JOSE RENATO CARNIELETTO '
order by 1 asc;



from PED_RX a, ITPED_RX b, EXA_RX c, ATENDIME c, PACIENTE d, CONVENIO e, SETOR f, SET_EXA g
        where a.cd_ped_rx = b.cd_ped_rx
        and b.cd_exa_rx = c.cd_exa_rx
        and a.cd_atendimento = c.cd_atendimento
        and c.cd_paciente = d.cd_paciente
        and c.cd_convenio = e.cd_convenio
        and a.cd_setor = f.cd_setor
        and a.cd_set_exa = g.cd_set_exa
        and trunc(a.dt_pedido) = trunc(sysdate)
        and g.cd_set_exa in (4,5,7,8,20,30,31,32) -- setores do inc imagem
        and b.cd_prestador is not null -- exibir somente com prestador informado no exame
        and b.cd_recurso is not null -- exibir somente com sala informada no exame
        and (((select x.tp_situacao from guia x where x.cd_guia = b.cd_guia) in ('A','G')) or (b.cd_guia is null))
        and a.hr_pedido > trunc(sysdate)-2
        --and a.cd_atendimento = 1046761

