
select DISTINCT pre_med.cd_pre_med
      ,pre_med.cd_setor
      ,setor.nm_setor
      ,tip_presc.ds_tip_presc ds_tip_presc
      ,ds_for_apl
      ,paciente.nm_paciente atendime_pac
      ,atendime.cd_atendimento||' - '||paciente.nm_paciente atendime_pac2
      ,leito.ds_leito ds_leito
      ,convenio.nm_convenio
      ,decode(atendime.dt_alta,null,'N','S') alta
      ,prestador.nm_prestador nm_prestador
      ,dbamv.pack_internamento.retorna_idade(dbamv.Fnc_Mv_Recupera_Data_Hora( NVL(atendime.dt_atendimento,SYSDATE), NVL(atendime.hr_atendimento,SYSDATE)),
               decode(atendime.dt_alta,null,sysdate,dbamv.Fnc_Mv_Recupera_Data_Hora(atendime.dt_alta,atendime.hr_alta))) tmp_internacao
      ,esquema.ds_tip_esq
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
    ,dbamv.for_apl
where pre_med.cd_pre_med     = itpre_med.cd_pre_med
  and pre_med.cd_atendimento = atendime.cd_atendimento
  and pre_med.cd_prestador   = prestador.cd_prestador
  and tip_presc.cd_tip_presc = itpre_med.cd_tip_presc
  and esquema.cd_tip_esq     = itpre_med.cd_tip_esq
  and setor.cd_setor         = pre_med.cd_setor
  and atendime.cd_leito      = leito.cd_leito (+)
  AND itpre_med.cd_for_apl = for_apl.cd_for_apl(+)
  and atendime.cd_convenio   = convenio.cd_convenio
  and atendime.cd_paciente   = paciente.cd_paciente
  and setor.cd_multi_empresa = 1
  AND PRE_MED.DT_PRE_MED between to_date('01/04/2021', 'dd/mm/yyyy') AND to_date('04/04/2021', 'dd/mm/yyyy')+0.99999
  and nvl(itpre_med.sn_cancelado,'N') = 'N'

  AND itpre_med.cd_for_apl LIKE 'IM'



