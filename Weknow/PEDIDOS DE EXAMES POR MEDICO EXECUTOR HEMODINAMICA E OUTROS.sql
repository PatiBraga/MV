select a.cd_set_exa cd_setor_executante, e.nm_set_exa nm_setor_executante, b.cd_ped_rx, f.cd_atendimento, g.cd_paciente, g.nm_paciente, a.hr_pedido, c.cd_exa_rx, c.ds_exa_rx, d.nm_prestador nm_executor, h.nm_convenio, 
from ped_rx a, itped_rx b, exa_rx c, prestador d, set_exa e, atendime f, paciente g, convenio h
where a.cd_ped_rx = b.cd_ped_rx
and b.cd_exa_rx = c.cd_exa_rx
and b.cd_prestador = d.cd_prestador
and a.cd_set_exa = e.cd_set_exa
and a.cd_atendimento = f.cd_atendimento
and f.cd_paciente = g.cd_paciente
and a.cd_convenio = h.cd_convenio
order by a.hr_pedido desc