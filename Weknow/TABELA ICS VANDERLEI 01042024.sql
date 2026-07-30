select
h.nm_convenio,
b.cd_conta,
b.cd_pro_fat,
e.ds_pro_fat,
case
    when exists (select 1 from tuss x where x.cd_pro_fat = b.cd_pro_fat and h.cd_convenio = x.cd_convenio and x.cd_tip_tuss = 0)  
        then (select x.cd_tuss from tuss x where x.cd_pro_fat = b.cd_pro_fat and h.cd_convenio = x.cd_convenio and x.cd_tip_tuss = 0) 
    when exists (select 1 from tuss x where x.cd_pro_fat = b.cd_pro_fat and h.cd_convenio = x.cd_convenio and x.cd_tip_tuss = 18)  
        then (select x.cd_tuss from tuss x where x.cd_pro_fat = b.cd_pro_fat and h.cd_convenio = x.cd_convenio and x.cd_tip_tuss = 18)        
    when exists (select 1 from tuss x where x.cd_pro_fat = b.cd_pro_fat and h.cd_convenio = x.cd_convenio and x.cd_tip_tuss = 19)  
        then (select x.cd_tuss from tuss x where x.cd_pro_fat = b.cd_pro_fat and h.cd_convenio = x.cd_convenio and x.cd_tip_tuss = 19)
    when exists (select 1 from tuss x where x.cd_pro_fat = b.cd_pro_fat and h.cd_convenio = x.cd_convenio and x.cd_tip_tuss = 20)  
        then (select x.cd_tuss from tuss x where x.cd_pro_fat = b.cd_pro_fat and h.cd_convenio = x.cd_convenio and x.cd_tip_tuss = 20)     
    when exists (select 1 from tuss x where x.cd_pro_fat = b.cd_pro_fat and h.cd_convenio = x.cd_convenio and x.cd_tip_tuss = 22)  
        then (select x.cd_tuss from tuss x where x.cd_pro_fat = b.cd_pro_fat and h.cd_convenio = x.cd_convenio and x.cd_tip_tuss = 22)        
    when exists (select 1 from tuss x where x.cd_pro_fat = b.cd_pro_fat and x.cd_convenio is null and x.cd_tip_tuss = 18)  
        then (select x.cd_tuss from tuss x where x.cd_pro_fat = b.cd_pro_fat and x.cd_convenio is null and x.cd_tip_tuss = 18)   
    when exists (select 1 from tuss x where x.cd_pro_fat = b.cd_pro_fat and x.cd_convenio is null and x.cd_tip_tuss = 19)  
        then (select x.cd_tuss from tuss x where x.cd_pro_fat = b.cd_pro_fat and x.cd_convenio is null and x.cd_tip_tuss = 19)           
    when exists (select 1 from tuss x where x.cd_pro_fat = b.cd_pro_fat and x.cd_convenio is null and x.cd_tip_tuss = 20)  
        then (select x.cd_tuss from tuss x where x.cd_pro_fat = b.cd_pro_fat and x.cd_convenio is null and x.cd_tip_tuss = 20)
    when exists (select 1 from tuss x where x.cd_pro_fat = b.cd_pro_fat and x.cd_convenio is null and x.cd_tip_tuss = 22)  
        then (select x.cd_tuss from tuss x where x.cd_pro_fat = b.cd_pro_fat and x.cd_convenio is null and x.cd_tip_tuss = 22)        
    else null
end cd_tuss,
f.ds_gru_fat,
a.dt_recebimento,
d.qt_lancamento,
  (nvl((select itreg_fat.vl_total_conta
     from itreg_fat
    where /*tab.origem = 'INTERNO'
          and*/ b.cd_conta = itreg_fat.cd_reg_fat
          and d.cd_lancamento = itreg_fat.cd_lancamento
          and Nvl(ItReg_Fat.Sn_Pertence_Pacote,'N') = 'N'
          and Nvl(ItReg_Fat.Tp_Pagamento,'P') = 'P'),0)
   +
  nvl((select itreg_amb.vl_total_conta
     from itreg_amb
    where /*tab.origem = 'EXTERNO'
          and*/ b.cd_conta = itreg_amb.cd_reg_amb
          and d.cd_lancamento = itreg_amb.cd_lancamento
          and Nvl(ItReg_Amb.Sn_Pertence_Pacote,'N') = 'N'
          and Nvl(ItReg_Amb.Tp_Pagamento,'X') <> 'C'
          AND Nvl(ItReg_Amb.Sn_fechada,'N') = 'S'),0)) total_faturado,
          
b.vl_recebido,
b.vl_glosa,
b.vl_acrescimo
from v_ajustes_recebimento a, v_ajustes_recebimento_det b, ITFAT_NOTA_FISCAL c, itreg_fat d, pro_fat e, gru_fat f, convenio h
where a.CD_RECCON_REC = b.CD_RECCON_REC
and a.cd_convenio = h.cd_convenio
and c.cd_reg_fat = d.cd_reg_fat 
and c.cd_lancamento_fat = d.cd_lancamento
and b.CD_ITFAT_NF = c.CD_ITFAT_NF
and d.cd_pro_fat = e.cd_pro_fat
and d.cd_gru_fat = f.cd_gru_fat
--and b.cd_pro_fat = '08002410'--'34010130'
and a.DT_RECEBIMENTO BETWEEN :ini and to_date(:fin) + 86399/86400
and a.CD_CONVENIO = 53

UNION ALL

select
h.nm_convenio,
b.cd_conta,
b.cd_pro_fat,
e.ds_pro_fat,
case
    when exists (select 1 from tuss x where x.cd_pro_fat = b.cd_pro_fat and h.cd_convenio = x.cd_convenio and x.cd_tip_tuss = 0)  
        then (select x.cd_tuss from tuss x where x.cd_pro_fat = b.cd_pro_fat and h.cd_convenio = x.cd_convenio and x.cd_tip_tuss = 0) 
    when exists (select 1 from tuss x where x.cd_pro_fat = b.cd_pro_fat and h.cd_convenio = x.cd_convenio and x.cd_tip_tuss = 18)  
        then (select x.cd_tuss from tuss x where x.cd_pro_fat = b.cd_pro_fat and h.cd_convenio = x.cd_convenio and x.cd_tip_tuss = 18)        
    when exists (select 1 from tuss x where x.cd_pro_fat = b.cd_pro_fat and h.cd_convenio = x.cd_convenio and x.cd_tip_tuss = 19)  
        then (select x.cd_tuss from tuss x where x.cd_pro_fat = b.cd_pro_fat and h.cd_convenio = x.cd_convenio and x.cd_tip_tuss = 19)
    when exists (select 1 from tuss x where x.cd_pro_fat = b.cd_pro_fat and h.cd_convenio = x.cd_convenio and x.cd_tip_tuss = 20)  
        then (select x.cd_tuss from tuss x where x.cd_pro_fat = b.cd_pro_fat and h.cd_convenio = x.cd_convenio and x.cd_tip_tuss = 20)
    when exists (select 1 from tuss x where x.cd_pro_fat = b.cd_pro_fat and h.cd_convenio = x.cd_convenio and x.cd_tip_tuss = 22)  
        then (select x.cd_tuss from tuss x where x.cd_pro_fat = b.cd_pro_fat and h.cd_convenio = x.cd_convenio and x.cd_tip_tuss = 22)             
    when exists (select 1 from tuss x where x.cd_pro_fat = b.cd_pro_fat and x.cd_convenio is null and x.cd_tip_tuss = 18)  
        then (select x.cd_tuss from tuss x where x.cd_pro_fat = b.cd_pro_fat and x.cd_convenio is null and x.cd_tip_tuss = 18)   
    when exists (select 1 from tuss x where x.cd_pro_fat = b.cd_pro_fat and x.cd_convenio is null and x.cd_tip_tuss = 19)  
        then (select x.cd_tuss from tuss x where x.cd_pro_fat = b.cd_pro_fat and x.cd_convenio is null and x.cd_tip_tuss = 19)           
    when exists (select 1 from tuss x where x.cd_pro_fat = b.cd_pro_fat and x.cd_convenio is null and x.cd_tip_tuss = 20)  
        then (select x.cd_tuss from tuss x where x.cd_pro_fat = b.cd_pro_fat and x.cd_convenio is null and x.cd_tip_tuss = 20)           
    when exists (select 1 from tuss x where x.cd_pro_fat = b.cd_pro_fat and x.cd_convenio is null and x.cd_tip_tuss = 22)  
        then (select x.cd_tuss from tuss x where x.cd_pro_fat = b.cd_pro_fat and x.cd_convenio is null and x.cd_tip_tuss = 22)         
    else null
end cd_tuss,
f.ds_gru_fat,
a.dt_recebimento,
d.qt_lancamento,
  (nvl((select itreg_fat.vl_total_conta
     from itreg_fat
    where /*tab.origem = 'INTERNO'
          and*/ b.cd_conta = itreg_fat.cd_reg_fat
          and d.cd_lancamento = itreg_fat.cd_lancamento
          and Nvl(ItReg_Fat.Sn_Pertence_Pacote,'N') = 'N'
          and Nvl(ItReg_Fat.Tp_Pagamento,'P') = 'P'),0)
   +
  nvl((select itreg_amb.vl_total_conta
     from itreg_amb
    where /*tab.origem = 'EXTERNO'
          and*/ b.cd_conta = itreg_amb.cd_reg_amb
          and d.cd_lancamento = itreg_amb.cd_lancamento
          and Nvl(ItReg_Amb.Sn_Pertence_Pacote,'N') = 'N'
          and Nvl(ItReg_Amb.Tp_Pagamento,'X') <> 'C'
          AND Nvl(ItReg_Amb.Sn_fechada,'N') = 'S'),0)) total_faturado,
          
b.vl_recebido,
b.vl_glosa,
b.vl_acrescimo
from v_ajustes_recebimento a, v_ajustes_recebimento_det b, ITFAT_NOTA_FISCAL c, itreg_amb d, pro_fat e, gru_fat f, convenio h
where a.CD_RECCON_REC = b.CD_RECCON_REC
and a.cd_convenio = h.cd_convenio
and c.cd_reg_amb = d.cd_reg_amb
and c.cd_lancamento_amb = d.cd_lancamento
and b.CD_ITFAT_NF = c.CD_ITFAT_NF
and d.cd_pro_fat = e.cd_pro_fat
and d.cd_gru_fat = f.cd_gru_fat
--and b.cd_pro_fat = '08002410'--'34010130'
and a.DT_RECEBIMENTO BETWEEN :ini and to_date(:fin) + 86399/86400
and a.CD_CONVENIO = 53;