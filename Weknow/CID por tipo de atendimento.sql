select x.dt_atendimento, h.nm_paciente, x.tp_atendimento, z.cd_cid, z.ds_cid
from atendime x, diagnostico_atendime y, cid z, paciente h
where x.cd_atendimento = y.cd_atendimento
and x.cd_paciente = h.cd_paciente
and y.cd_cid = z.cd_cid
and x.tp_atendimento = 'I'
--and z.cd_cid in ('G454')
and z.cd_sgru_cid in ('F05','R41')

union all

select x.dt_atendimento, h.nm_paciente, x.tp_atendimento, z.cd_cid, z.ds_cid
from atendime x, diagnostico_atendime y, cid z, paciente h
where x.cd_atendimento = y.cd_atendimento
and x.cd_paciente = h.cd_paciente
and y.cd_cid = z.cd_cid
and x.tp_atendimento = 'I'
and z.cd_cid in ('G454')