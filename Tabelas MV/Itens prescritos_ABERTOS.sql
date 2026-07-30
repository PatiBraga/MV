 select * from itpre_med where cd_pre_med in(
-- update itpre_med set TP_SITUACAO = 'S' WHERE cd_pre_med IN (2063679,2063951)

select DISTINCT pre_med.cd_pre_med

from dbamv.itpre_med itpre_med
    ,dbamv.pre_med pre_med
    ,dbamv.setor setor
    ,dbamv.tip_presc tip_presc
    ,dbamv.tip_esq esquema
    ,dbamv.atendime atendime
    ,dbamv.prestador prestador
    ,dbamv.leito leito
    ,dbamv.convenio convenio
    ,dbamv.paciente paciente
where pre_med.cd_pre_med     = itpre_med.cd_pre_med
  and pre_med.cd_atendimento = atendime.cd_atendimento
  and pre_med.cd_prestador   = prestador.cd_prestador
  and tip_presc.cd_tip_presc = itpre_med.cd_tip_presc
  and esquema.cd_tip_esq     = itpre_med.cd_tip_esq
  and setor.cd_setor         = pre_med.cd_setor
  and atendime.cd_leito      = leito.cd_leito (+)
  and atendime.cd_convenio   = convenio.cd_convenio
  and atendime.cd_paciente   = paciente.cd_paciente
  and setor.cd_multi_empresa = 10
  AND PRE_MED.DT_PRE_MED between to_date('03/07/2024', 'dd/mm/yyyy') AND to_date('04/07/2024', 'dd/mm/yyyy')+0.99999
  and nvl(itpre_med.sn_cancelado,'N') = 'N'
  and atendime.cd_atendimento = 699250	)

  and DH_FINAL is not null
  and DH_FINAL > to_date('04/07/2024 11:30', 'dd/mm/yyyy hh24:MI')
  AND SN_CANCELADO = 'N'
  --AND TP_SITUACAO = 'N'