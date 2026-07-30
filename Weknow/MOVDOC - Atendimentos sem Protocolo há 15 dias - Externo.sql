select
	trunc(atendime.dt_atendimento) dt_atendimento,
	trunc(atendime.dt_alta) dt_alta,
	ORI_ATE.cd_ORI_ATE,
	ORI_ATE.DS_ORI_ATE origem,
	convenio.cd_convenio,
	convenio.nm_convenio,
	atendime.cd_atendimento,
	atendime.cd_paciente,
	paciente.nm_paciente,
	nvl(Atendime.sn_retorno,'N') sn_retorno ,
	trunc(sysdate) - trunc(atendime.dt_atendimento) dias
from
	atendime
	inner join paciente on (atendime.cd_paciente = paciente.cd_paciente)
	left join ori_ate on (atendime.cd_ori_ate = ori_ate.cd_ori_ate)
	inner join convenio on (atendime.cd_convenio = convenio.cd_convenio)
where
	atendime.dt_atendimento >= '01/07/2017' --considera apenas atendimentos a partir de 01/07/2017
	and atendime.cd_multi_empresa = :empresa

	and ATENDIME.tp_atendimento <> 'I' --desconsidera internado
	and nvl(atendime.sn_importa_auto,'N') <> 'S' --desconsidera atendimento importados automaticamente
	and (trunc(sysdate) - trunc(atendime.dt_atendimento)) >= 15 --pendentes há 15 dias ou mais

  and nvl(atendime.sn_retorno,'N') = 'N' --desconsidera atendimento de retorno
	and not exists --desconsidera atendimento já protocolados
		( select
			1
		from
			it_protocolo_doc
		where
			it_protocolo_doc.cd_atendimento = atendime.cd_atendimento
			and CD_DOCUMENTO_PROT in (20,23,24)
		)

	and not exists --desconsidera se a conta do atendimento estiver fechada e em remessa
			( select
				1
			from
				itreg_amb
				inner join reg_amb on itreg_amb.cd_reg_amb = reg_amb.cd_reg_amb
				inner join remessa_fatura on(reg_amb.cd_remessa = remessa_fatura.cd_remessa)
			where
				atendime.cd_atendimento = itreg_amb.cd_atendimento
        and nvl(itreg_amb.sn_fechada,'N') = 'S'
			)
    and not exists (-- NÃO RETONAR QUANDO CONVENIO FOR UNIMED E POSSUIR REMESSA - CHAMADO 35170
                    select 1
                from remessa_fatura x, reg_amb y
                where x.cd_remessa = y.cd_remessa
                and y.cd_convenio = convenio.cd_convenio
                and y.cd_convenio = 8)            