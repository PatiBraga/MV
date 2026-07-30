select a.cd_tab_fat, d.ds_tab_fat, c.cd_gru_pro, c.ds_gru_pro, a.cd_pro_fat, b.ds_pro_fat, a.vl_honorario, a.vl_operacional, a.vl_total, a.dt_vigencia
from val_pro a, pro_fat b, gru_pro c, tab_fat d
where a.cd_tab_fat = 1
and a.cd_pro_fat = b.cd_pro_fat
and a.sn_ativo = 'S'
and b.cd_gru_pro = c.cd_gru_pro
and a.cd_tab_fat = d.cd_tab_fat
and a.dt_vigencia = (select max(x.dt_vigencia)
                    from val_pro x, pro_fat y
                    where x.cd_tab_fat = a.cd_tab_fat
                    and x.cd_pro_fat = y.cd_pro_fat
                    and x.cd_pro_fat = a.cd_pro_fat
                    and x.sn_ativo = 'S') 
order by c.ds_gru_pro, b.ds_pro_fat asc