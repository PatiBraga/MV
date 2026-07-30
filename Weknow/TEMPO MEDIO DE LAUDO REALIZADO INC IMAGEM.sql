-- ANGIOPLASTIA 5 DIAS
-- RESTANTE DOS EXAMES 3 DIAS
select 
b.cd_itped_rx cd_acession_number,
c.cd_atendimento, 
a.cd_ped_rx, 
d.nm_paciente, 
e.nm_setor nm_setor_solicitante, 
f.nm_set_exa, 
g.nm_convenio, 
h.ds_exa_rx, 
k.nm_prestador nm_prestador_solicitante, 
j.nm_prestador nm_prestador_laudo, 
a.dt_pedido, 
--b.dt_realizado, -- não corresponde a data de realização, validado no Carestream
i.dt_laudo,
trunc((i.dt_laudo - a.dt_pedido))tempo_laudo, 
case
    when upper(ds_exa_rx) like upper('ANGIO%') then 5
    else 3
end prazo_laudo,
case
    when trunc((i.dt_laudo - a.dt_pedido)) > case when upper(ds_exa_rx) like upper('ANGIO%') then 5 else 3 end then 'N' else 'S' 
end laudo_dentro_prazo
from PED_RX a, ITPED_RX b, ATENDIME c, PACIENTE d, SETOR e, SET_EXA f, CONVENIO g, EXA_RX h, LAUDO_RX i, PRESTADOR j, PRESTADOR k
where a.cd_ped_rx = b.cd_ped_rx
and a.cd_atendimento = c.cd_atendimento
and c.cd_paciente = d.cd_paciente
and a.cd_setor = e.cd_setor
and a.cd_set_exa = f.cd_set_exa
and a.cd_convenio = g.cd_convenio
and b.cd_exa_rx = h.cd_exa_rx
and b.cd_laudo = i.cd_laudo
and i.cd_prestador_assinatura = j.cd_prestador
and a.cd_prestador = k.cd_prestador
--and i.dt_laudo between '01/02/2025' and '28/02/2025'
--and c.cd_atendimento = 	999508
--and a.cd_ped_rx = 150073