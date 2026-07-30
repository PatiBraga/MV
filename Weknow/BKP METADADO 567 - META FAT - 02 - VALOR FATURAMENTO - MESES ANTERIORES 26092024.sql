Select
  faturamento.anomes,
  faturamento.ano,
  to_number(faturamento.mes) mes,
  faturamento.mes_extenso,
  sum(faturamento.valor) valor,
  meta_faturamento.valor as meta,
  meta_faturamento.valor - sum(faturamento.valor) as faltante,
  sum(faturamento.valor) /meta_faturamento.valor  * 100 AS PERCENTUAL,
  sum(vl_s_imagem) vl_s_imagem,
  sum(vl_c_imagem) vl_c_imagem
from
 (
  Select
    to_char(fatura.dt_competencia,'yyyymm') as anomes,
    to_char(fatura.dt_competencia,'YYYY') as ano,
    to_char(fatura.dt_competencia,'mm') as mes,
    to_char(fatura.dt_competencia,'MONTH') as mes_extenso,
    Nvl(sum(ItReg_Fat.vl_total_conta),0) Valor,
    sum(case
      when ITREG_FAT.cd_setor_produziu IN (106,135,136,137,138) then Nvl(ItReg_Fat.vl_total_conta,0)
      else 0
    end) vl_c_imagem  ,
    sum(case
      when ITREG_FAT.cd_setor_produziu NOT in (106,135,136,137,138) then Nvl(ItReg_Fat.vl_total_conta,0)
      else 0
    end) vl_s_imagem
  From
    Dbamv.reg_fat,
    Dbamv.ItReg_Fat,
    Dbamv.Atendime,
    Dbamv.Remessa_Fatura,
    Dbamv.Fatura,
    dbamv.convenio
  where
    reg_fat.cd_multi_empresa = :empresa
    and Reg_Fat.Cd_Atendimento    = Atendime.cd_Atendimento
    and Reg_Fat.cd_Reg_Fat = ItReg_Fat.Cd_Reg_Fat
    and Nvl(ItReg_Fat.Sn_Pertence_Pacote,'N') = 'N'
    AND Nvl(Reg_fat.Sn_fechada,'N') = 'S'
    AND Nvl(Remessa_fatura.Sn_Fechada,'N') = 'S'
    and Nvl(ItReg_Fat.Tp_Pagamento,'P')       = 'P'
    and Remessa_Fatura.cd_remessa = Reg_fat.cd_remessa
    and Fatura.cd_fatura          = remessa_fatura.cd_fatura
    and Fatura.Dt_Competencia between :ini and to_date(:fin) + 86399/86400
    and reg_fat.cd_convenio = convenio.cd_convenio
    and convenio.tp_convenio <> 'H'
    and :origem in (null,'TODAS','INTERNO')
  group by
    fatura.dt_competencia

  union all

  select
    to_char(Fatura.Dt_Competencia,'yyyymm') anomes,
    to_char(fatura.dt_competencia,'YYYY') as ano,
    to_char(fatura.dt_competencia,'mm') as mes,
    to_char(fatura.dt_competencia,'MONTH') as mes_extenso,
    sum(Nvl(ItReg_Amb.vl_total_conta,0)) Valor,
    sum(case
      when ITREG_AMB.cd_setor_produziu IN (106,135,136,137,138) then Nvl(ItReg_Amb.vl_total_conta,0)
      else 0
    end) vl_c_imagem  ,
    sum(case
      when ITREG_AMB.cd_setor_produziu NOT in (106,135,136,137,138) then Nvl(ItReg_Amb.vl_total_conta,0)
      else 0
    end) vl_s_imagem
  From
    Dbamv.Reg_Amb,
    Dbamv.Atendime,
    Dbamv.Remessa_Fatura,
    Dbamv.ItReg_Amb,
    Dbamv.Fatura,
    dbamv.convenio
  where
    atendime.cd_multi_empresa = :empresa
    and ItReg_Amb.Cd_Atendimento  = Atendime.cd_Atendimento
    and Remessa_Fatura.cd_remessa = Reg_Amb.cd_remessa
    and Itreg_Amb.Cd_Reg_Amb      = Reg_Amb.Cd_Reg_Amb
    and Fatura.cd_fatura          = remessa_fatura.cd_fatura
    AND Fatura.Cd_Convenio        = ItReg_Amb.Cd_Convenio
    and Nvl(ItReg_Amb.Sn_Pertence_Pacote,'N') = 'N'
    and Nvl(ItReg_Amb.Tp_Pagamento,'X')      <> 'C'
    AND Nvl(ItReg_Amb.Sn_fechada,'N')         = 'S'
    AND Nvl(Remessa_fatura.Sn_Fechada,'N')    = 'S'
    and itreg_amb.cd_convenio = convenio.cd_convenio
    and convenio.tp_convenio <> 'A'
    AND Fatura.Dt_Competencia between :ini and  to_date(:fin) + 86399/86400
    and :origem in (null,'TODAS','EXTERNO')
  group by
    Fatura.Dt_Competencia
  ) faturamento
  left join weknow.weknow_meta meta_faturamento on (faturamento.anomes = to_Char(meta_faturamento.anomes) and meta_faturamento.indicador = 'FATURAMENTO')
  group by
  faturamento.anomes,
  faturamento.ano,
  faturamento.mes,
  faturamento.mes_extenso,
  meta_faturamento.valor