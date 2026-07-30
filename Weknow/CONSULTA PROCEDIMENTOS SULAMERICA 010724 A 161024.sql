select a.cd_convenio, d.nm_convenio, a.cd_atendimento, a.cd_pro_fat, c.ds_pro_fat, f.ds_gru_fat, e.nm_setor, a.cd_setor_produziu, a.qt_lancamento, a.vl_unitario, a.vl_total_conta, a.dt_fechamento
from itreg_amb a, reg_amb b, pro_fat c, convenio d, setor e, gru_fat f
where a.cd_reg_amb = b.cd_reg_amb
and a.cd_pro_fat = c.cd_pro_fat
and a.cd_convenio = d.cd_convenio
and a.cd_setor = e.cd_setor
and a.cd_gru_fat = f.cd_gru_fat
--and a.cd_atendimento = 949483
and a.cd_convenio = 3
and a.dt_fechamento between '01/07/2024' and '16/10/2024'
;