select 
a.id,
h.name as cliente,
f.name as nome_coordenador,
(a.name::json ->> 'pt_BR') name,
regexp_replace(regexp_replace(a.description,'<div[^>]*>','','g'),'</div>','','g')descricao,
a.create_date,
a.date_start,
a.date,
c.name as task_name,
c.id,
case 
	when a.stage_id = 1 then 'Aguardando'
	when a.stage_id = 2 then 'Iniciado'
	when a.stage_id = 3 then 'Concluído'
	when a.stage_id = 4 then 'Cancelado'
end estagio_projeto,
case 
	when c.stage_id = 37 then 'Pendente'
	when c.stage_id = 38 then 'Andamento'
	when c.stage_id = 20 then 'Concluído'
end estagio,

case
	when c.stage_id = 20 then 1
	else 0
end task_done,

c.state,
c.date_deadline as dt_prazo,
(select x.date 
from mail_message x, mail_message_subtype y
where x.model = 'project.task' 
and x.subtype_id = y.id
and (y.name::json ->> 'pt_BR') = 'Tarefa concluída'
and x.res_id = c.id)dt_conclusao,

case
	when c.date_deadline < (select x.date 
			from mail_message x, mail_message_subtype y
			where x.model = 'project.task' 
			and x.subtype_id = y.id
			and (y.name::json ->> 'pt_BR') = 'Tarefa concluída'
			and x.res_id = c.id) then 'Em atraso'
	when c.date_deadline < now() then 'Em atraso'			
	else 'No prazo'		
end status_prazo,

case
	when c.date_deadline < (select x.date 
			from mail_message x, mail_message_subtype y
			where x.model = 'project.task' 
			and x.subtype_id = y.id
			and (y.name::json ->> 'pt_BR') = 'Tarefa concluída'
			and x.res_id = c.id) then 0
	when c.date_deadline < now() then 0			
	else 1
end task_done_time,


c.date_last_stage_update as dt_utima_atualizacao,
g.name as usuario_atividade,
EXTRACT(DAY FROM AGE(c.date_deadline,now()))dias_entrega,
(select x.body
from mail_message x, mail_message_subtype y
where x.model = 'project.task' 
and x.subtype_id = y.id
and y.id in (1,2)
and x.message_type = 'comment'
and x.date = (select max(mail_message.date) from mail_message where mail_message.res_id = x.res_id)
and x.res_id = c.id)last_message
from project_project a
	left join res_users b on a.user_id = b.id
	left join project_task c on a.id = c.project_id
	left join project_task_user_rel d on c.id = d.task_id
	left join res_users e on d.user_id = e.id
	left join res_partner f on b.partner_id = f.id 
	left join res_partner g on e.partner_id = g.id
	left join res_partner h on a.partner_id = h.id
where a.id = 5;

select *
from project_project
where id = 5;

select *
from res_partner;

select *
from project_task c
	where project_id = 5
	and id = 32;

select

select *
from res_users;

select *
from project_project_stage;

select *
from mail_compose_message;

--pendente 37
--andamento 38
--concluido 20

select * from project_project_stage;

select * from project_task_type;

select x.body
from mail_message x, mail_message_subtype y
where x.model = 'project.task' 
and x.subtype_id = y.id
and y.id in (1,2)
and x.message_type = 'comment'
and x.date = (select max(mail_message.date) from mail_message where mail_message.res_id = x.res_id)
and x.res_id = 62;


select 
regexp_replace(x.body,'</?p[^>]*>','','g')teste
from mail_message x
where x.model = 'project.project' 
and x.message_type = 'comment'
and x.date = (select max(mail_message.date) from mail_message where mail_message.model = 'project.project' and mail_message.res_id = x.res_id)
and res_id = 5;

select * from mail_message_subtype where res_model = 'project.task';