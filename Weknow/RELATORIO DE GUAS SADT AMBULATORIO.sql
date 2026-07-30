select a.cd_atendimento, h.nm_paciente, a.cd_pre_med, a.cd_prestador, a.dt_pre_med, c.nm_prestador, b.cd_itpre_med, b.cd_tip_presc, d.ds_tip_presc, e.nm_setor, f.ds_tip_esq
from pre_med a, itpre_med b, prestador c, tip_presc d, setor e, tip_esq f, atendime g, paciente h
where a.cd_setor in (35,74,69,111,93,91,50)
and a.cd_pre_med = b.cd_pre_med
and a.cd_objeto = 8
and a.dh_impressao is not null
and a.cd_prestador = c.cd_prestador
and b.cd_tip_presc = d.cd_tip_presc
and a.cd_setor = e.cd_setor
and d.cd_tip_esq = f.cd_tip_esq
and a.cd_atendimento = g.cd_atendimento
and g.cd_paciente = h.cd_paciente
--and a.cd_atendimento = 947708
;


select *
from setor
where cd_setor in (35,74,69,111,93,91,50);