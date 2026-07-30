-- DBAMV.AGENDA_CENTRAL


SELECT  AC.CD_AGENDA_CENTRAL
      , AC.CD_SETOR
      , S.NM_SETOR
      , AC.CD_RECURSO_CENTRAL
      , RC.DS_RECURSO_CENTRAL
      , AC.TP_AGENDA
      , AC.CD_PRESTADOR
      , AC.DT_AGENDA
      , AC.HR_INICIO
      , AC.HR_FIM
      , AC.SN_ATIVO
      --, AC.CD_USUARIO
      , IAC.CD_IT_AGENDA_CENTRAL
      , IAC.HR_AGENDA
      , IAC.CD_PACIENTE
      , IAC.NM_PACIENTE, IAC.VL_ALTURA, IAC.QT_PESO, IAC.DT_NASCIMENTO,IAC.SN_ATENDIDO,IAC.SN_ENCAIXE,IAC.CD_ATENDIMENTO
      , IAC.CD_ITEM_AGENDAMENTO, IAC.CD_USUARIO, IAC.CD_CONVENIO
      , IA.DS_ITEM_AGENDAMENTO
FROM   DBAMV.AGENDA_CENTRAL AC
     , DBAMV.SETOR S
     , DBAMV.RECURSO_CENTRAL RC
     , DBAMV.IT_AGENDA_CENTRAL IAC
     , DBAMV.ITEM_AGENDAMENTO IA
WHERE AC.CD_SETOR = S.CD_SETOR
AND RC.CD_RECURSO_CENTRAL = AC.CD_RECURSO_CENTRAL
AND IAC.CD_AGENDA_CENTRAL = AC.CD_AGENDA_CENTRAL
AND IAC.CD_IT_AGENDA_PAI IS NULL
AND IAC.CD_ITEM_AGENDAMENTO = IA.CD_ITEM_AGENDAMENTO (+)
AND trunc(AC.DT_AGENDA) between to_date('16/07/2020','dd/mm/yyyy') and to_date('16/07/2020','dd/mm/yyyy')
--AND trunc(AC.DT_AGENDA) between  $DataInicioFormatada$ and  $DataFimFormatada$
AND AC.CD_SETOR = 197
AND IAC.CD_PACIENTE IS NOT NULL -- HORARIO AGENDADO -- PACIENTE NO ITEM DE AGENDAMENTO
--AND AC.CD_AGENDA_CENTRAL = 702242
ORDER BY AC.CD_RECURSO_CENTRAL, AC.DT_AGENDA, AC.HR_INICIO
;

select * from dbamv.agenda_central ac
where cd_agenda_central = 702242;

select * from dbamv.recurso_central
where cd_recurso_central = 83;

select * from dbamv.escala_central
where cd_escala_central = 511;

select * from dbamv.it_agenda_central ac
where cd_agenda_central = 702242
and cd_it_agenda_pai is null;

select * from dbamv.item_agendamento
where cd_item_agendamento = 1485;