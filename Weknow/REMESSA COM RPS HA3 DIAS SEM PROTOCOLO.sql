select
a.dt_abertura dt_remessa,
d.cd_convenio,
d.nm_convenio,
a.cd_remessa,
f.nr_id_nota_fiscal,
trunc(sysdate - a.dt_abertura)dias,
nvl(count(b.cd_reg_fat),0) qtd_contas,
nvl(sum(b.vl_total_conta),0) valor_contas
from remessa_fatura a, reg_fat b, fatura c, convenio d, itfat_nota_fiscal e, nota_fiscal f, atendime g
where a.cd_remessa = b.cd_remessa
and a.cd_fatura = c.cd_fatura
and c.cd_convenio = d.cd_convenio
and a.cd_remessa = e.cd_remessa
and e.cd_nota_fiscal = f.cd_nota_fiscal
and b.cd_atendimento = g.cd_atendimento
--and a.cd_remessa = 46885
--and c.cd_convenio = 8
and not exists (select 1 from it_protocolo_doc where cd_reg_fat = b.cd_reg_fat)
and not exists (select 1 from it_protocolo_doc where it_protocolo_doc.cd_atendimento = b.cd_atendimento and CD_DOCUMENTO_PROT in (20,23,24))
and (trunc(sysdate) - trunc(a.dt_abertura)) >= 3
and trunc(a.dt_abertura) >= '04/09/2025' --Data da abertura do chamado 34737
group by
a.dt_abertura,
d.cd_convenio,
d.nm_convenio,
a.cd_remessa,
f.nr_id_nota_fiscal