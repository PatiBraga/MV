Select
  total.cd_pro_fat_cir,
  total.ds_cirurgia,
  total.dt_referencia,
  total.origem,
	total.cd_atendimento,
  total.cd_setor,
  total.nm_setor,
	total.cd_conta_ffcv,
  total.cd_gru_fat  ,
	total.cd_gru_pro,
	total.ds_gru_pro,
	total.cd_pro_fat,
	total.ds_pro_fat,
  total.cd_pro_fat_int,
  total.ds_pro_Fat_int,
  total.tp_atendimento,
  total.cd_convenio,
  total.nm_convenio,
  total.cd_prestador,
  total.nm_prestador,
  rank() over (partition by cd_atendimento order by cd_atendimento desc) rank,
  sum(qt_lancamento) qt_lancamento,
  case
     when total.cd_gru_fat = 7 and :desc_honorario = 1 then 0
     else sum(total.vl_total)
  end vl_total
From
	(Select
    cirurgia.cd_pro_fat cd_pro_fat_cir,
    cirurgia.ds_cirurgia,
    trunc(r_fat.dt_final)dt_referencia,
    'Internado' origem,
		r_fat.cd_atendimento,
    setor.cd_setor,
    setor.nm_setor,
		r_fat.cd_reg_fat cd_conta_ffcv,
    g_pro.cd_gru_fat,
		p_fat.cd_gru_pro,
		g_pro.ds_gru_pro,
    p_fat.cd_pro_Fat,
    P_fat.ds_pro_Fat,
		pro_fat_int.cd_pro_fat cd_pro_fat_int,
		pro_fat_int.ds_pro_fat ds_pro_Fat_int,
    decode(atendime.tp_atendimento,'A','AMBULATÓRIO','E','EXTERNO','U','URGÊNCIA','I','INTERNAÇÃO')tp_atendimento,
    convenio.cd_convenio,
    convenio.nm_convenio,
    prestador.cd_prestador,
    prestador.nm_prestador,
		'CH' tp_item,
    sum(itreg_fat.qt_lancamento) qt_lancamento,
		Sum(decode(nvl( itlan_med.tp_pagamento, nvl( itreg_fat.tp_pagamento, 'P' ) ), 'C', 0, nvl(itlan_med.vl_liquido, itreg_fat.vl_total_conta))) vl_total
	From
		dbamv.reg_fat r_fat,
		dbamv.pro_fat p_fat,
		dbamv.itreg_fat,
		dbamv.gru_pro g_pro,
		DBAMV.ITLAN_MED,
    atendime,
    pro_fat pro_fat_int,
    convenio ,
    prestador,
    setor,
    (select c.cd_atendimento, d.cd_pro_fat, a.ds_cirurgia
    from cirurgia a, cirurgia_aviso b, aviso_cirurgia c, pro_fat d
    where a.cd_cirurgia = b.cd_cirurgia
    and b.cd_aviso_cirurgia = c.cd_aviso_cirurgia
    and  a.cd_pro_fat = d.cd_pro_fat)cirurgia

	Where
		r_fat.cd_reg_fat = itreg_fat.cd_reg_fat
		and itlan_med.cd_reg_fat( + ) = itreg_fat.cd_reg_fat
		and itlan_med.cd_lancamento( + ) = itreg_fat.cd_lancamento
		and p_fat.cd_pro_fat = itreg_fat.cd_pro_fat
		and g_pro.cd_gru_pro = p_fat.cd_gru_pro
    and atendime.cd_atendimento = r_fat.cd_Atendimento
    and atendime.cd_pro_int = pro_fat_int.cd_pro_fat(+)
    and r_fat.cd_Convenio = convenio.cd_convenio
		and itreg_fat.sn_pertence_pacote = 'N'
    and r_Fat.sn_fechada = 'S'
    --and r_fat.dt_final between :ini and to_date(:fin) + 86399/86400
    and atendime.cd_prestador = prestador.cd_prestador
    and setor.cd_setor(+) = nvl( itreg_fat.cd_setor_produziu, itreg_fat.cd_setor )
    and atendime.cd_atendimento = cirurgia.cd_atendimento (+)

	Group by
    cirurgia.cd_pro_fat,
    cirurgia.ds_cirurgia,
    trunc(r_fat.dt_final),
		r_fat.cd_atendimento,
    setor.cd_setor,
    setor.nm_setor,
		r_fat.cd_reg_fat,
    g_pro.cd_gru_fat,
		p_fat.cd_gru_pro,
		g_pro.ds_gru_pro,
    p_fat.cd_pro_Fat,
    P_fat.ds_pro_Fat,
		pro_fat_int.cd_pro_fat,
		pro_fat_int.ds_pro_fat,
    atendime.tp_atendimento,
    convenio.cd_convenio,
    convenio.nm_convenio ,
    prestador.cd_prestador,
    prestador.nm_prestador

    union all

    Select
    cirurgia.cd_pro_fat cd_pro_fat_cir,
    cirurgia.ds_cirurgia,
    trunc(atendime.dt_atendimento)dt_referencia,
    'Ambulatorial' origem,
		itreg_amb.cd_atendimento,
    setor.cd_setor,
    setor.nm_setor,
		itreg_amb.cd_reg_amb cd_conta_ffcv,
    g_p.cd_gru_fat,
		p_f.cd_gru_pro,
		g_p.ds_gru_pro,
    p_f.cd_pro_Fat,
    P_f.ds_pro_Fat,
		pro_fat_int.cd_pro_fat cd_pro_fat_int,
		pro_fat_int.ds_pro_fat ds_pro_Fat_int,
    decode(atendime.tp_atendimento,'A','AMBULATÓRIO','E','EXTERNO','U','URGÊNCIA','I','INTERNAÇÃO')tp_atendimento,
    convenio.cd_convenio,
    convenio.nm_convenio,
    prestador.cd_prestador,
    prestador.nm_prestador,
		'CA' tp_item,
    sum(itreg_amb.QT_LANCAMENTO) qt_lancamento,
		Sum(decode(itreg_amb.tp_pagamento, 'C', 0, itreg_amb.vl_total_conta) ) vl_total
	From
		dbamv.itreg_amb,
		dbamv.pro_fat p_f,
		dbamv.gru_pro g_p,
    dbamv.atendime,
    pro_fat pro_fat_int,
    reg_amb   ,
    convenio,
    prestador ,
    setor,
    (select c.cd_atendimento, d.cd_pro_fat, a.ds_cirurgia
    from cirurgia a, cirurgia_aviso b, aviso_cirurgia c, pro_fat d
    where a.cd_cirurgia = b.cd_cirurgia
    and b.cd_aviso_cirurgia = c.cd_aviso_cirurgia
    and  a.cd_pro_fat = d.cd_pro_fat)cirurgia

	Where
		itreg_amb.cd_pro_fat = p_f.cd_pro_fat
		and p_f.cd_gru_pro = g_p.cd_gru_pro
		and itreg_amb.sn_pertence_pacote = 'N'
    and reg_amb.sn_fechada = 'S'
    --and atendime.dt_atendimento between :ini and to_date(:fin) + 86399/86400
    and atendime.cd_atendimento = itreg_amb.cd_Atendimento
    and itreg_amb.cd_reg_amb = reg_amb.cd_reg_amb
    and atendime.cd_pro_int = pro_fat_int.cd_pro_fat(+)
    and reg_amb.cd_convenio = convenio.cd_Convenio
    and atendime.cd_prestador = prestador.cd_prestador
    and setor.cd_setor(+) = nvl( itreg_amb.cd_setor_produziu, itreg_amb.cd_setor)
    and atendime.cd_atendimento = cirurgia.cd_atendimento (+)

	Group by
    cirurgia.cd_pro_fat,
    cirurgia.ds_cirurgia,
    trunc(atendime.dt_atendimento),
		itreg_amb.cd_atendimento,
    setor.cd_setor,
    setor.nm_setor,
		itreg_amb.cd_reg_amb ,
    g_p.cd_gru_fat,
		p_f.cd_gru_pro,
		g_p.ds_gru_pro,
    p_f.cd_pro_Fat,
    p_f.ds_pro_Fat,
		pro_fat_int.cd_pro_fat,
		pro_fat_int.ds_pro_fat,
    atendime.tp_atendimento,
    convenio.cd_convenio,
    convenio.nm_convenio ,
    prestador.cd_prestador,
    prestador.nm_prestador) total

where total.dt_referencia >= '01/01/2023'
--and total.cd_atendimento = 908950

Group by
  total.cd_pro_fat_cir,
  total.ds_cirurgia,
  total.dt_referencia,
  total.origem,
	total.cd_atendimento,
  total.cd_setor,
  total.nm_setor,
	total.cd_conta_ffcv,
  total.cd_gru_fat,
	total.cd_gru_pro,
	total.ds_gru_pro,
	total.cd_pro_fat,
	total.ds_pro_fat,
  total.cd_pro_fat_int,
	total.ds_pro_Fat_int,
  total.tp_atendimento,
  total.cd_convenio,
  total.nm_convenio ,
  total.cd_prestador,
  total.nm_prestador