select
e.cd_convenio,
e.nm_convenio,
a.cd_con_rec,
c.dt_recebimento,
f.nm_usuario,
nvl(sum(c.vl_recebido),0)vl_recebido
from con_rec a, itcon_rec b, reccon_rec c, fornecedor d, convenio e, usuarios f
where c.cd_itcon_rec = b.cd_itcon_rec
and a.cd_con_rec = b.cd_con_rec
and c.nm_usuario = f.cd_usuario (+)
and a.cd_fornecedor = d.cd_fornecedor
and d.cd_fornecedor = e.cd_fornecedor (+)
--and c.DT_RECEBIMENTO BETWEEN '01/08/2025' AND '29/08/2025'
--and c.vl_recebido = '4444,62'
--and a.cd_con_rec = 216624
group by
e.cd_convenio,
e.nm_convenio,
a.cd_con_rec,
c.dt_recebimento,
f.nm_usuario;