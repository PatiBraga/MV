PROMPT CREATE OR REPLACE VIEW vdic_scm_antimicrob_n_inic_d1
CREATE OR REPLACE VIEW vdic_scm_antimicrob_n_inic_d1 (
  cd_atendimento,
  cd_ori_ate,
  dt_alta,
  hr_alta,
  tipo,
  cd_produto,
  ds_produto,
  nm_antimicrob,
  ds_tip_presc,
  cd_leito,
  ds_leito,
  cd_unid_int,
  cd_convenio,
  cd_paciente,
  dt_hr,
  dt_pre_med,
  cd_antimicrob,
  cd_prestador,
  nm_prestador,
  nm_paciente,
  dt_prevista_alta,
  cd_cid,
  ds_cid,
  dh_alta,
  cd_solsai_pro,
  cd_pre_med,
  cd_itpre_med,
  dose_freq,
  cd_itpre_med_justificativa,
  ds_justificativa,
  qt_dias,
  dias_aplic,
  nr_dose,
  data_prescricao,
  hr_pre_med,
  cd_tip_presc,
  cd_mvto_estoque,
  cd_itmvto_estoque,
  cd_atendimento_pai,
  tp_pre_med,
  sn_atm_prorrogacao,
  cd_multi_empresa,
  sn_cancelado,
  tp_situacao,
  cd_ser_dis,
  tp_atendimento,
  sn_mestre,
  sn_restrito,
  cd_itsolsai_pro
) AS
SELECT DISTINCT pm.cd_atendimento,
	a.CD_ORI_ATE,
	a.DT_ALTA,
	a.HR_ALTA,
	Decode(prod.CD_PRODUTO, prod.CD_PRODUTO, Decode(Nvl(sai.QT_ATENDIDA,0), 0, '2', '1'), '3') TIPO, -- Tipo 3 - Prescrito e atendido pela farmacia (ROXO) --Esse estava com problema
	tp.CD_PRODUTO,
	prod.DS_PRODUTO,
	an.NM_ANTIMICROB ,
	tp.ds_tip_presc,
	a.CD_LEITO,
	l.DS_LEITO,
	l.CD_UNID_INT,
	a.CD_CONVENIO,
	a.CD_PACIENTE,
	Dbamv.Fnc_Mv_Recupera_Data_Hora( TO_DATE(TO_CHAR(pm.DT_PRE_MED,'DD-MM-YYYY'),'DD-MM-YYYY'), TO_DATE(TO_CHAR(pm.HR_PRE_MED,'DD-MM-YYYY HH24:MI'),'DD-MM-YYYY HH24:MI') ) DT_HR,
	pm.DT_PRE_MED,
	ap.CD_ANTIMICROB,
	sol.CD_PRESTADOR,
	prest.NM_PRESTADOR,
	p.NM_PACIENTE,
	a.DT_PREVISTA_ALTA,
	a.CD_CID,
	c.DS_CID,
	Dbamv.Fnc_Mv_Recupera_Data_Hora( TO_DATE(TO_CHAR(a.DT_ALTA,'DD-MM-YYYY'),'DD-MM-YYYY'), TO_DATE(TO_CHAR(a.HR_ALTA,'DD-MM-YYYY HH24:MI'),'DD-MM-YYYY HH24:MI') ) DH_ALTA,
 sol.CD_SOLSAI_PRO, --Esse estava com problema
	pm.CD_PRE_MED,
	ipm.CD_ITPRE_MED,
	ipm.QT_ITPRE_MED||' '||up.cd_UNIDADE||' - '||tfr.DS_TIP_FRE_RESUMIDA as dose_freq,
	ipm.CD_ITPRE_MED_JUSTIFICATIVA,
	ipm.DS_JUSTIFICATIVA,
	ipm.QT_DIAS,
	ipm.nr_dia||'/'||ipm.qt_dias as dias_aplic,
	round(Decode ( pm.CD_PRE_MED, NULL , 0, DECODE(nvl(dbamv.pkg_mv2000.le_configuracao('PSIH', 'SN_DOSE_PRESCRICAO'),'N'), 'N', DBAMV.FNC_PSIH_RETORNA_DOSE(a.CD_ATENDIMENTO,ipm.CD_PRE_MED,prod.CD_PRODUTO,sol.CD_SOLSAI_PRO ), DBAMV.FNC_PSIH_RETORNA_DOSE(a.CD_ATENDIMENTO,ipm.CD_PRE_MED,prod.CD_PRODUTO,ipm.CD_ITPRE_MED ) ) ),3) NR_DOSE, --PDA 531106 - funcão dbamv.fnc_psih_retorna_dose incluir o filtro do nro da solicitação da farmácia --Esse estava com problema
	trunc(pm.dt_pre_med) as data_prescricao,
	pm.hr_pre_med,
	tp.CD_TIP_PRESC,
	'...' CD_MVTO_ESTOQUE,
	'...' CD_ITMVTO_ESTOQUE,
	a.CD_ATENDIMENTO_PAI,
	pm.TP_PRE_MED,
	NVL(ipm.SN_ATM_PRORROGACAO,'N') SN_ATM_PRORROGACAO,
	a.cd_multi_empresa,
	IPM.SN_CANCELADO,
	sol.TP_SITUACAO, --Esse estava com problema
	A.CD_SER_DIS,
	A.TP_ATENDIMENTO,
	prod.SN_MESTRE,
	an.SN_RESTRITO,
	sai.CD_ITSOLSAI_PRO      --Esse estava com problema
from dbamv.pre_med pm
inner join dbamv.itpre_med ipm on ipm.cd_pre_med = pm.cd_pre_med
inner join dbamv.tip_presc tp on tp.cd_tip_presc = ipm.cd_tip_presc
inner join dbamv.tip_fre tfr on tfr.CD_TIP_FRE = ipm.CD_TIP_FRE
inner join dbamv.ant_pro ap on ap.cd_produto = tp.cd_produto
inner join dbamv.antimicrob an on an.cd_antimicrob = ap.cd_antimicrob
inner join dbamv.atendime a on a.cd_atendimento = pm.cd_atendimento
inner join dbamv.paciente p on p.CD_PACIENTE = a.CD_PACIENTE
inner join dbamv.leito l on l.cd_leito = a.cd_leito
inner join dbamv.uni_pro up on up.CD_UNI_PRO = ipm.CD_UNI_PRO
------ verifica copia ----
left join dbamv.itpre_med ipmcop on ipmcop.cd_itpre_med = ipm.cd_itpre_med_copia
left join dbamv.pre_med pmcop on pmcop.cd_pre_med = ipmcop.cd_pre_med
------------
left JOIN dbamv.prestador prest ON a.cd_prestador = prest.cd_prestador
left JOIN dbamv.itsolsai_pro sai ON sai.CD_ITPRE_MED = ipm.CD_ITPRE_MED
left JOIN dbamv.SOLSAI_PRO sol ON  sol.cd_solsai_pro = sai.cd_solsai_pro
left JOIN dbamv.cid c ON a.cd_cid = c.cd_cid
left join dbamv.produto prod on prod.cd_produto = tp.cd_produto
------------
where an.sn_vigilancia = 'S' -- antimicrobiano de vigilancia
  and pm.fl_impresso = 'S' -- somente prescrição assinada
  and (pm.cd_atendimento != pmcop.cd_atendimento -- verifica se é copia de prescrição do mesmo atendimento, o q indica nao ser o primeiro dia na santa casa
  or ipm.cd_itpre_med_copia is null)
  and ipm.nr_dia > 1 -- retira os itens de primeiro dia
  and a.dt_alta is null
  and a.tp_atendimento = 'I'
/

GRANT DELETE,INSERT,SELECT,UPDATE ON vdic_scm_antimicrob_n_inic_d1 TO dbaps;
GRANT DELETE,INSERT,SELECT,UPDATE ON vdic_scm_antimicrob_n_inic_d1 TO dbasgu;
GRANT DELETE,INSERT,SELECT,UPDATE ON vdic_scm_antimicrob_n_inic_d1 TO mv2000;
GRANT DELETE,INSERT,SELECT,UPDATE ON vdic_scm_antimicrob_n_inic_d1 TO mvintegra;
