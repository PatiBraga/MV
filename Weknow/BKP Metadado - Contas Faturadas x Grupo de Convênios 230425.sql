select
  anomes,
  'Todos os Tipos' AS tipo_atendimento_filtrado,  -- Como os filtros estão NULL, mostra todos
  total_unimed,
  total_assgratuita,
  total_part_sinam,
  total_conta_extra,
  total_outros,
  total_geral,
  sum(total_geral) over (partition by '') / count(*) over (partition by '') media
from
(
select
  anomes,
  sum(case when cd_convenio in (8,64) then 1 else 0 end) total_unimed,
  sum(case when cd_convenio in (13) then 1 else 0 end) total_assgratuita,
  sum(case when cd_convenio in (40,12) then 1 else 0 end) total_part_sinam,
  sum(case when cd_convenio in (76) then 1 else 0 end) total_conta_extra,
  sum(case when cd_convenio not in (8,64,40,13,12,76) then 1 else 0 end) total_outros,
  count(*) as total_geral
from
 (
 Select Distinct
   to_char(Fatura.Dt_Competencia,'yyyy/mm') as anomes,
   Reg_Fat.cd_reg_Fat,
   reg_fat.cd_convenio
 From
   Dbamv.reg_fat
   ,Dbamv.Itreg_Fat
   ,Dbamv.Atendime
   ,Dbamv.Remessa_Fatura
   ,Dbamv.Fatura
   ,dbamv.convenio
 where
   reg_fat.cd_multi_empresa = :empresa
   and Reg_fat.cd_reg_fat = ItReg_fat.cd_reg_Fat
   and Reg_Fat.Cd_Atendimento = Atendime.cd_Atendimento
   and Remessa_Fatura.cd_remessa = Reg_fat.cd_remessa
   and Fatura.cd_fatura = remessa_fatura.cd_fatura
   and trunc(Fatura.Dt_Competencia) between :ini and :fin
   and Nvl(ItReg_Fat.Sn_Pertence_Pacote,'N') = 'N'
   and Nvl(ItReg_Fat.Tp_Pagamento,'P') = 'P'
   AND Nvl(Reg_fat.Sn_fechada,'N') = 'S'
   AND Nvl(Remessa_fatura.Sn_Fechada,'N') = 'S'
   and reg_fat.cd_convenio = convenio.cd_convenio
   and convenio.tp_convenio <> 'H'
   -- Filtros fixos conforme solicitado
   AND (NULL IS NULL OR ATENDIME.TP_ATENDIMENTO = 'A')
   AND (NULL IS NULL OR ATENDIME.TP_ATENDIMENTO = 'U')
   AND (NULL IS NULL OR ATENDIME.TP_ATENDIMENTO = 'I')
   AND (NULL IS NULL OR ATENDIME.TP_ATENDIMENTO = 'E')
      -- Filtro para AMBULATÓRIO apenas
   --AND ATENDIME.TP_ATENDIMENTO = 'A'  -- Filtro direto sem verificação de NULL
   and :origem in (null,'TODAS','INTERNO')


 UNION ALL

 select distinct
      to_char(Fatura.Dt_Competencia,'yyyy/mm') anomes,
      ItReg_Amb.Cd_Reg_Amb,
      reg_amb.cd_convenio
   From
      Dbamv.Reg_Amb,
      Dbamv.Atendime,
      Dbamv.Remessa_Fatura,
      Dbamv.ItReg_Amb,
      Dbamv.Fatura,
      dbamv.convenio
   where
      atendime.cd_multi_empresa in :empresa
      and ItReg_Amb.Cd_Atendimento = Atendime.cd_Atendimento
      and Remessa_Fatura.cd_remessa = Reg_Amb.cd_remessa
      and Itreg_Amb.Cd_Reg_Amb = Reg_Amb.Cd_Reg_Amb
      and Fatura.cd_fatura = remessa_fatura.cd_fatura
      AND Fatura.Cd_Convenio = iTReg_Amb.Cd_Convenio
      and Nvl(ItReg_Amb.Sn_Pertence_Pacote,'N') = 'N'
      and Nvl(ItReg_Amb.Tp_Pagamento,'X') <> 'C'
      AND Nvl(ItReg_Amb.Sn_fechada,'N') = 'S'
      AND Nvl(Remessa_fatura.Sn_Fechada,'N') = 'S'
      and itreg_amb.cd_convenio = convenio.cd_convenio
      and convenio.tp_convenio <> 'A'
      AND trunc(Fatura.Dt_Competencia) between :ini and :fin
      -- Filtros consistentes com a primeira parte
      AND (NULL IS NULL OR ATENDIME.TP_ATENDIMENTO = 'A')
      AND (NULL IS NULL OR ATENDIME.TP_ATENDIMENTO = 'U')
      AND (NULL IS NULL OR ATENDIME.TP_ATENDIMENTO = 'I')
      AND (NULL IS NULL OR ATENDIME.TP_ATENDIMENTO = 'E')
      -- Filtro consistente para AMBULATÓRIO
      --AND ATENDIME.TP_ATENDIMENTO = 'A'  -- Filtro direto sem verificação de NULL
      and :origem in (null,'TODAS','EXTERNO')
 )
group by
  anomes
)