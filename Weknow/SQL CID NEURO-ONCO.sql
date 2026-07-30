select c.cd_paciente, c.nm_paciente, a.cd_atendimento, to_char(b.dt_gravacao,'dd/mm/yyyy hh24:mi')dt_gravacao, to_char(b.hr_agenda,'dd/mm/yyyy hh24:mi')hr_agenda, trunc(b.hr_agenda-b.dt_gravacao)dias_agenda, to_char(a.hr_atendimento,'dd/mm/yyyy hh24:mi')hr_atendimento,
to_char((select min(x.dh_criacao)
from pw_documento_clinico x
where x.cd_atendimento = a.cd_atendimento
and cd_objeto in (113,466)),'dd/mm/yyyy hh24:mi')dt_anamnese,

(select max(z.cd_cid||' - '||z.ds_cid)
from atendime x, diagnostico_atendime y, cid z
where x.cd_atendimento = y.cd_atendimento
and y.cd_cid = z.cd_cid
and z.cd_cid in ('C70','C71','C72','C75','C700','C701','C709','C710','C711','C712','C713','C714','C715','C716','C717','C718','C719','C720','C722','C723','C724','C725','C728','C729','C751','C752','C753','D33', 'D330', 'D331', 'D332', 'D333', 'D334', 'D337', 'D339','D43','D430','D431','D432','D433','D434','D437','D439')
and x.cd_paciente = a.cd_paciente)ds_cid

from atendime a, it_agenda_central b, paciente c
where a.cd_atendimento = b.cd_atendimento
and a.cd_paciente = c.cd_paciente
and a.cd_atendimento in (select max(v.cd_atendimento)
                        from atendime v
                        where v.cd_paciente in (select distinct(x.cd_paciente)
                                                    from atendime x, diagnostico_atendime y, cid z
                                                    where x.cd_atendimento = y.cd_atendimento
                                                    and y.cd_cid = z.cd_cid
                                                    and z.cd_cid in ('C70','C71','C72','C75','C700','C701','C709','C710','C711','C712','C713','C714','C715','C716','C717','C718','C719','C720','C722','C723','C724','C725','C728','C729','C751','C752','C753','D33', 'D330', 'D331', 'D332', 'D333', 'D334', 'D337', 'D339','D43','D430','D431','D432','D433','D434','D437','D439'))
                        and v.dt_atendimento between '01/01/2020' and '19/08/2024'
                        and v.tp_atendimento = 'A' /*'I','Internação','E','Externo','U','Urgência','A','Ambulatório'*/                    
                        group by v.cd_paciente)
order by a.hr_atendimento asc
;

select distinct(x.cd_paciente)
from atendime x, cid_ate y, cid z
where x.cd_atendimento = y.cd_atendimento
and y.cd_cid = z.cd_cid
and z.cd_cid in ('C70','C71','C72','C75','C700','C701','C709','C710','C711','C712','C713','C714','C715','C716','C717','C718','C719','C720','C722','C723','C724','C725','C728','C729','C751','C752','C753','D33', 'D330', 'D331', 'D332', 'D333', 'D334', 'D337', 'D339','D43','D430','D431','D432','D433','D434','D437','D439')
union all
select distinct(x.cd_paciente)
from atendime x, diagnostico_atendime y, cid z
where x.cd_atendimento = y.cd_atendimento
and y.cd_cid = z.cd_cid
and z.cd_cid in ('C70','C71','C72','C75','C700','C701','C709','C710','C711','C712','C713','C714','C715','C716','C717','C718','C719','C720','C722','C723','C724','C725','C728','C729','C751','C752','C753','D33', 'D330', 'D331', 'D332', 'D333', 'D334', 'D337', 'D339','D43','D430','D431','D432','D433','D434','D437','D439')


/*
72042
118404
115978
*/