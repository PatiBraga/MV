select
mov_int.cd_mov_int,
trunc(mov_int.dt_mov_int) + (mov_int.hr_mov_int - trunc(mov_int.hr_mov_int)) dt_mov_int,
trunc(mov_int.dt_lib_mov) + (mov_int.hr_lib_mov - trunc(mov_int.hr_lib_mov)) dt_lib_mov,
mov_int.ds_motivo,
case
     when mov_int.tp_mov = 'I' and motivo_transf_leito.ds_motivo_transf_leito is null then 'Internação'
     when mov_int.tp_mov <> 'I' and motivo_transf_leito.ds_motivo_transf_leito is null then 'Não Informado'
     else motivo_transf_leito.ds_motivo_transf_leito
end ds_motivo_transf_leito,
--mov_int.tp_mov,
decode(
mov_int.tp_mov,'A','Acompanhante','F','Infecção','I','Internação',
'L','Limpeza','M','Manutenção','O','Transfêrencia',
'R','Reserva','C','Inter/Infecção','T','Interditado/Isolamento'
)ds_tp_mov,
unidade_origem.cd_unid_int cd_unidade_origem,
unidade_origem.ds_unid_int ds_unidade_origem,
leito_origem.cd_leito cd_leito_origem,
leito_origem.ds_leito ds_leito_origem,
unidade_destino.cd_unid_int cd_unidade_destino,
unidade_destino.ds_unid_int ds_unidade_destino,
leito_destino.cd_leito cd_leito_destino,
leito_destino.ds_leito ds_leito_destino,
usuarios.nm_usuario,
--dados da internacao
atendime.cd_atendimento cd_atendimento,
atendime.dt_atendimento + (atendime.hr_atendimento - trunc(atendime.hr_atendimento)) dh_atendimento,
atendime.dt_alta + (atendime.hr_alta - trunc(atendime.hr_alta)) dh_alta,
paciente.cd_paciente cd_paciente,
paciente.nm_paciente nm_paciente,
convenio.cd_convenio cd_convenio,
convenio.nm_convenio nm_convenio,
case convenio.tp_convenio
    when 'C' then 'Convênio'
    when 'P' then 'Particular'
    else 'SUS'
end ds_tipo_convenio,
--decode(convenio.tp_convenio,'C','CONVÊNIO','P','PARTICULAR','A','SUS','H','SUS',convenio.tp_convenio) ds_tipo_convenio,
prestador.cd_prestador cd_prestador,
prestador.nm_prestador nm_prestador,
tipo_internacao.cd_tipo_internacao cd_tipo_internacao,
tipo_internacao.ds_tipo_internacao ds_tipo_internacao,
--verifica se a movimentação é internada na unidade, apenas troca de leito
case
    when unidade_destino.cd_unid_int <> unidade_origem.cd_unid_int
         or mov_int.tp_mov = 'I'  then 1
    else 0
end sn_mov_unidade,
--verifica se houve uma alta EM 48H anterior, caracterizando um reinternacao
(select min(trunc(t.dt_mov_int) + (t.hr_mov_int - trunc(t.hr_mov_int)))
     from mov_int t
          inner join leito l_destino on t.cd_leito = l_destino.cd_leito
          left join  leito l_origem on t.cd_leito_anterior = l_origem.cd_leito
    where atendime.cd_atendimento = t.cd_atendimento
          and l_destino.cd_unid_int <> l_origem.cd_unid_int --unidades diferentes
          and leito_origem.cd_unid_int = l_destino.cd_unid_int
          and t.cd_mov_int > mov_int.cd_mov_int
          and t.dt_mov_int - mov_int.dt_mov_int < 2
) dt_reinternacao

from
mov_int
join leito leito_destino on mov_int.cd_leito = leito_destino.cd_leito
join unid_int unidade_destino on leito_destino.cd_unid_int = unidade_destino.cd_unid_int
join setor on unidade_destino.cd_setor = setor.cd_setor
left join leito leito_origem on mov_int.cd_leito_anterior =  leito_origem.cd_leito
left join unid_int unidade_origem on leito_origem.cd_unid_int = unidade_origem.cd_unid_int
left join motivo_transf_leito  on mov_int.cd_motivo_transf_leito = motivo_transf_leito.cd_motivo_transf_leito
left join atendime on mov_int.cd_atendimento = atendime.cd_atendimento
and atendime.tp_atendimento = 'I' --somente internação
left join paciente on atendime.cd_paciente = paciente.cd_paciente
left join convenio on atendime.cd_convenio = convenio.cd_convenio
left join tipo_internacao on atendime.cd_tipo_internacao = tipo_internacao.cd_tipo_internacao
left join prestador on atendime.cd_prestador = prestador.cd_prestador
left join usuarios on mov_int.nm_usuario = usuarios.cd_usuario
where
mov_int.dt_mov_int = to_date('02/10/2025','DD/MM/YYYY')
