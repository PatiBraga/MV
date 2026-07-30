select a.cd_especie, a.cd_produto, a.ds_Produto, a.vl_custo_medio, a.vl_ultima_entrada, a.vl_ultima_custo_real, a.ds_comercial, a.cd_pro_fat, b.ds_pro_fat
from produto a, pro_fat b
where a.cd_especie = 2
and a.cd_pro_fat = b.cd_pro_fat
and a.cd_pro_fat is not null