-- Texto de uma evolução
SELECT
 ROWNUM LINHA
 ,A.*
 FROM(SELECT ate.cd_atendimento, ate.cd_paciente,p.nm_paciente,p.nr_cns,ci.nm_cidade,to_char(ate.dt_atendimento, 'DD/MM/YYYY')DATA_ATEND,decode(ATE.TP_ATENDIMENTO,'A','AMBULATORIAL', 'U', 'URGÊNCIA') TIPO, dbms_lob.substr(c.lo_valor) PROCEDIMENTO,to_char(e.dh_fechamento,'DD/MM/YYYY') DT_FECHAMENTO ,E.CD_USUARIO
       FROM pw_editor_clinico a
 ,dbamv.editor_documento b
 --
 ,editor_registro_campo c
 ,editor_campo d
 --
 ,dbamv.pw_documento_clinico e
 ,DBAMV.ATENDIME ate
 ,dbamv.paciente p
,dbamv.cidade ci
WHERE a.cd_documento = b.cd_documento
and p.cd_cidade = ci.cd_cidade
AND a.cd_documento_clinico = e.cd_documento_clinico
and e.cd_atendimento = ate.cd_atendimento
and e.cd_paciente = p.cd_paciente
and a.cd_editor_registro = c.cd_registro(+)
and c.cd_campo = d.cd_campo
and a.cd_documento = 723
and e.tp_status = 'FECHADO'
and d.ds_identificador in ('procedimento_sus_1', 'PROCED_APAC_SUS_OFICIAL_GERAL_1')
and d.cd_metadado in (205819,291986)
and ate.tp_atendimento in ('U','A')
and ate.cd_convenio = 2
and dbms_lob.substr(c.lo_valor,4000) like '%ULTRASSONOGRAFIA%'
and trunc(e.dh_fechamento) between  $pgmvDataIni$  and  $pgmvDataFim$
--AND ate.dt_atendimento between '28/11/2023' and '28/11/2023'
order by ate.dt_atendimento, p.nm_paciente)A