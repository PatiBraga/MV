-- RELATÓRIO REPORT ATENDIMENTO TOTEM - RECEPÇÃO - TRIAGEM - MÉDICO´- MEDICAÇÃO

select distinct
       a.cd_atendimento ATENDIMENTO,
       a.nm_paciente NOME_PACIENTE,
       b.nm_usuario_alta MEDICO,
       paciente.ds_endereco,
       paciente.nr_endereco,
       paciente.nr_cep,
       paciente.nm_bairro,
       cidade.nm_cidade,
       cidade.cd_uf ESTADO,
       a.cd_usuario USUARIO_CLASSIFICA,
       b.nm_usuario USUARIO_RECEPCAO,

       cor.nm_cor,
       e.ds_especialid,
       tip_res.ds_tip_res,

       stp.dh_cadastro_totem data_totem,


       stp.dh_class_chamada data_chamada_class,


       stp.dh_class_inicio data_inicio_class,


       stp.dh_class_final data_fim_class,

       stp.dh_med_chamada data_chamada_med,


       stp.dh_med_inicio data_inicio_med,

       pre_med.dh_impressao data_prescricao,


       b.hr_alta_medica data_alta_medica,

       laudo_aih.dt_emissao,

       ROUND((stp.dh_class_final - stp.dh_class_inicio) * 24 * 60, 2) as tempo_class_min,
       to_char(stp.dh_class_inicio, 'HH24') as hora_class

from dbamv.triagem_atendimento a
join dbamv.atendime b
  on a.cd_atendimento = b.cd_atendimento

join paciente
  on paciente.cd_paciente = b.cd_paciente

left join laudo_aih
  on laudo_aih.cd_atendimento = b.cd_atendimento

join cidade
  on cidade.cd_cidade = paciente.cd_cidade

join dbamv.sacr_cor_referencia cor
  on a.cd_cor_referencia = cor.cd_cor_referencia

join especialid e
  on e.cd_especialid = a.cd_especialid

left join tip_res
  on b.cd_tip_res = tip_res.cd_tip_res

left join (
    select cd_atendimento,
           min(hr_pre_med) dh_impressao
      from pre_med
     group by cd_atendimento
) pre_med
  on pre_med.cd_atendimento = b.cd_atendimento

left join (
    select
        cd_atendimento,

        max(case when cd_tipo_tempo_processo = 1
                 then dh_processo end) as dh_cadastro_totem,

        max(case when cd_tipo_tempo_processo = 10
                 then dh_processo end) as dh_class_chamada,

        max(case when cd_tipo_tempo_processo = 11
                 then dh_processo end) as dh_class_inicio,

        max(case when cd_tipo_tempo_processo = 12
                 then dh_processo end) as dh_class_final,

        min(case when cd_tipo_tempo_processo = 20
                 then dh_processo end) as dh_adm_chamada,

        min(case when cd_tipo_tempo_processo = 21
                 then dh_processo end) as dh_adm_inicio,

        max(case when cd_tipo_tempo_processo = 22
                 then dh_processo end) as dh_adm_final,

        min(case when cd_tipo_tempo_processo = 30
                 then dh_processo end) as dh_med_chamada,

        min(case when cd_tipo_tempo_processo = 31
                 then dh_processo end) as dh_med_inicio,

        max(case when cd_tipo_tempo_processo = 32
                 then dh_processo end) as dh_med_final

    from sacr_tempo_processo
    group by cd_atendimento
) stp
on stp.cd_atendimento = b.cd_atendimento


where b.dt_atendimento between
      to_date(&< name = "DATA INICIAL" required = "yes" type = "string" default = "select trunc(sysdate) from dual" >)
  and to_date(&< name = "DATA FINAL" required = "yes" type = "string" default = "select trunc(sysdate) from dual" >)

and b.cd_ori_ate in (
    select ori_ate.cd_ori_ate
      from ori_ate
     where ori_ate.ds_ori_ate like (&< name = "Origem"
                                     hint = "Escolha a Origem"
                                     required = "yes"
                                     type = "string"
                                     default = "%"
                                     list ="select oriate.ds_ori_ate
                                              from ori_ate oriate
                                             where oriate.sn_ativo = 'S'
                                             order by 1 asc">)
)

order by 1,2