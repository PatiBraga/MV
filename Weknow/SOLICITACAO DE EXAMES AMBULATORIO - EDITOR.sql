select a.cd_atendimento, g.nm_paciente, a.CD_DOCUMENTO_CLINICO cd_pre_med, a.CD_PRESTADOR, a.DH_CRIACAO dt_pre_med, h.nm_prestador, null cd_itpre_med, null cd_tip_presc, TRIM(REGEXP_SUBSTR(d.lo_conteudo,'- (.*)', 1, 1, NULL, 1))ds_tip_presc, l.ds_ori_ate, 
null ds_tip_esq, to_number(SUBSTR(d.lo_conteudo,1,INSTR(d.lo_conteudo, '||') - 1)) cd_amb,
j.cd_exa_rx,

(select min(i.dt_pedido)
from ped_rx i, atendime j, itped_rx l
where i.cd_atendimento = j.cd_atendimento
and i.cd_ped_rx = l.cd_ped_rx
and j.cd_paciente = g.cd_paciente
and l.cd_exa_rx = j.cd_exa_rx
and i.dt_pedido > a.DH_CRIACAO
and (i.dt_pedido - a.DH_CRIACAO) <= 20)dt_pedido,

(select min(i.dt_pedido)
from ped_rx i, atendime j, itped_rx l
where i.cd_atendimento = j.cd_atendimento
and i.cd_ped_rx = l.cd_ped_rx
and j.cd_paciente = g.cd_paciente
and l.cd_exa_rx = j.cd_exa_rx
and i.dt_pedido > a.DH_CRIACAO
and (i.dt_pedido - a.DH_CRIACAO) <= 20)dt_pedido20dias,

(select min(i.dt_pedido)
from ped_rx i, atendime j, itped_rx l
where i.cd_atendimento = j.cd_atendimento
and i.cd_ped_rx = l.cd_ped_rx
and j.cd_paciente = g.cd_paciente
and l.cd_exa_rx = j.cd_exa_rx
and i.dt_pedido > a.DH_CRIACAO
and (i.dt_pedido - a.DH_CRIACAO) <= 45)dt_pedido45dias,

(select min(i.dt_pedido)
from ped_rx i, atendime j, itped_rx l
where i.cd_atendimento = j.cd_atendimento
and i.cd_ped_rx = l.cd_ped_rx
and j.cd_paciente = g.cd_paciente
and l.cd_exa_rx = j.cd_exa_rx
and i.dt_pedido > a.DH_CRIACAO
and (i.dt_pedido - a.DH_CRIACAO) <= 90)dt_pedido90dias

from dbamv.PW_DOCUMENTO_CLINICO a, dbamv.PW_EDITOR_CLINICO b, editor.EDITOR_REGISTRO c, editor.EDITOR_REGISTRO_CAMPO d, editor.EDITOR_CAMPO e, atendime f, paciente g, prestador h, exa_rx j, ori_ate l
where a.cd_documento_clinico = b.cd_documento_clinico
and b.cd_editor_registro = c.cd_registro
and c.cd_registro = d.cd_registro
and d.cd_campo = e.cd_campo
and b.cd_documento = 1
and a.cd_atendimento = f.cd_atendimento
and a.cd_prestador = h.cd_prestador
and f.cd_paciente = g.cd_paciente
and f.cd_ori_ate = l.cd_ori_ate
and to_number(SUBSTR(d.lo_conteudo,1,INSTR(d.lo_conteudo, '||') - 1)) = j.exa_rx_cd_pro_fat (+)
and f.tp_atendimento = 'A'
and SUBSTR(d.lo_conteudo,1,INSTR(d.lo_conteudo, '||') - 1) is not null
and e.cd_campo in (3239,3237,3232)
--and a.cd_atendimento = 1106510
and a.DH_CRIACAO >= '03/12/2025'

;


select * from exa_rx where cd_ExA_rx = 811;

select *
from PW_DOCUMENTO_CLINICO a, PW_EDITOR_CLINICO b
where a.cd_documento_clinico = b.cd_documento_clinico
and cd_documento = 1
and a.cd_atendimento = 1106510;