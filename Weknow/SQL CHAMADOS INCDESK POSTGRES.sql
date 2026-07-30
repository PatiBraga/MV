select
a.id,
('http://incdesk.hospitalinc.com.br/front/ticket.form.php?id='||a.id)link,
a.name titulo,
Case
    when a.status = 1 then 'Aberto'  /*novo não iniciado*/
    when a.status = 2 then 'Processando (Atribuido)' /*em atendimento*/
    when a.status = 3 then 'Processando (Planejado)' /*em atendimento*/
    when a.status = 4 then 'Pendente' /*Pendente Usuário*/
    when a.status = 5 then 'Solucionado'
    when a.status = 6 then 'Fechado'
    else a.status
  End as status,
a.date dataabertura,
(case
	when (select min(y.date)
			from glpi_itilfollowups y
			where y.itemtype = 'Ticket'
			and y.users_id in (select users_id x
								from glpi_groups_users x
								where x.groups_id in (1,10,14))
			and y.items_id = a.id) is null
				then (select min(y.date_creation)
						from glpi_itilsolutions y
						where y.itemtype = 'Ticket'
						and y.users_id in (select users_id x
											from glpi_groups_users x
											where x.groups_id in (1,10,14))
						and y.items_id = a.id)
	else (select min(y.date)
			from glpi_itilfollowups y
			where y.itemtype = 'Ticket'
			and y.users_id in (select users_id x
								from glpi_groups_users x
								where x.groups_id in (1,10,14))
			and y.items_id = a.id)
end)datatriagem,
a.date_mod ultima_atualizacao,
concat(b.firstname,' ',b.realname) usuarioabertura,
/*a.locations_id,*/
d.name localizacao,
e.name categoriaresumida,
e.completename categoriacompleta,
CASE
	when substr(e.completename,1,37) = 'Tecnologia da Informação > Sistemas >' then 'Sistemas'
	when substr(e.completename,1,43) = 'Tecnologia da Informação > Infraestrutura >' then 'Infraestrutura'
	when substr(e.completename,1,36) = 'Tecnologia da Informação > Segurança' then 'Segurança da Informação'
END grupoatendimento,
nvl((select concat(h.firstname,' ',h.realname)
from glpi_tickets_users g, glpi_users h
where g.users_id = h.id
and g.id = (select min(f.id)
from glpi_tickets_users f
where f.tickets_id = a.id
and f.type = 2)),'Não atribuido')tecnico,
(select k.name from glpi_groups k
where k.id = j.groups_id) grupo,
CASE
	when a.priority = '1' then 'Muito baixa'
	when a.priority = '2' then 'Baixa'
	when a.priority = '3' then 'Media'
	when a.priority = '4' then 'Alta'
	when a.priority = '5' then 'Muito alta'
	when a.priority = '6' then 'Critica'
END prioridade,
NULL origem,

NVL((select
CASE
	when h.status = 2 then 'Aguardando'
	when h.status = 3 then 'Concedido'
	when h.status = 4 then 'Recusado'
END
from glpi_ticketvalidations h
where h.tickets_id = a.id
and h.submission_date = (select max(x.submission_date) from glpi_ticketvalidations x where x.tickets_id  = h.tickets_id)
),'Não está sujeita a aprovação')aprovacao,
(select
i.name
from glpi_ticketvalidations h, glpi_users i
where h.tickets_id = a.id
and h.users_id_validate = i.id
and h.submission_date = (select max(x.submission_date) from glpi_ticketvalidations x where x.tickets_id  = h.tickets_id))usuarioaprovacao,

(select x.name
from glpi_plugin_fields_tipodeatendimentofielddropdowns x, glpi_plugin_fields_tickettecnologiadainformaos y
where y.plugin_fields_tipodeatendimentofielddropdowns_id = x.id
and y.items_id = a.id)tipoatendimento,

NVL((select x.name
from glpi_plugin_fields_estgiofielddropdowns x, glpi_plugin_fields_ticketinformaesadicionais y
where y.plugin_fields_estgiofielddropdowns_id = x.id
and y.items_id = a.id),'Normal')estagio,
NVL((select x.name
from glpi_plugin_fields_complexidadefielddropdowns x, glpi_plugin_fields_ticketinformaesadicionais y
where y.plugin_fields_complexidadefielddropdowns_id = x.id
and y.items_id = a.id),'Não informado')complexidade,
a.internal_time_to_own tempointernoatendimento,
a.solvedate datasolucao,
TIMESTAMPDIFF(DAY,a.date,a.solvedate)tma_dias,
NULL tarefaduracao,
NULL tarefacategoria,
(select h.satisfaction from glpi_ticketsatisfactions h
where h.tickets_id = a.id)satisfacao,
CASE
	when a.type = 1 then 'Incidente'
	when a.type = 2 then 'Requisicao'
END tipo,
a.time_to_resolve temposolucao,
CASE
	when a.time_to_resolve < now() then 'S'
	else 'N'
END atraso,
CASE
	WHEN a.time_to_resolve IS NULL THEN 'Não'
	ELSE 'Sim'
END possui_sla,
CASE
	WHEN a.time_to_resolve > nvl(a.solvedate,now()) THEN 'Dentro do SLA'
  WHEN a.time_to_resolve IS NULL THEN NULL
	ELSE 'Vencido'
END situacao_sla,
CASE
  WHEN  DATE_FORMAT(a.time_to_resolve,'%d/%m/%Y') = DATE_FORMAT(now(),'%d/%m/%Y') THEN 1
  ELSE 0
END vence_hoje,
(select min(x.date_mod)
from glpi_logs x
where x.itemtype = 'Ticket'
and x.new_value = 2 /*Status - Mudança de Pendente para Processando (atribuído)*/
and x.items_id = a.id)dt_atendimento,
a.takeintoaccount_delay_stat, -- valor em segundos com o tempo da abertura do atendimento até a atribuição no usuario
round(a.takeintoaccount_delay_stat/60) tempoatendimento,
CASE
	WHEN (a.takeintoaccount_delay_stat/60) <= 480 THEN 'Dentro do SLA - Atendimento'
	ELSE 'Vencido'
END situacao_sla_atendimento,
(select n.id
from glpi_items_tickets m, glpi_printers n, glpi_printermodels o
where n.id = m.items_id
and m.tickets_id = a.id
and n.printermodels_id = o.id)id_imp,
(select n.name
from glpi_items_tickets m, glpi_printers n, glpi_printermodels o
where n.id = m.items_id
and m.tickets_id = a.id
and n.printermodels_id = o.id)nome_imp,
(select o.name
from glpi_items_tickets m, glpi_printers n, glpi_printermodels o
where n.id = m.items_id
and m.tickets_id = a.id
and n.printermodels_id = o.id)modelo_imp,
(select sum(h.actiontime)
from glpi_tickettasks h
where h.tickets_id = a.id)tempo_tarefa,
k.itemtype,
(select CONVERT(FORMAT(sum((l.actiontime/60)),0),char)
from glpi_tickettasks l
where l.tickets_id = a.id)tarefa_minutos,
(select concat(y.firstname,' ',y.realname)
from glpi_itilsolutions x, glpi_users y
where x.users_id = y.id
and x.items_id = a.id
and x.id = (select max(xy.id) from glpi_itilsolutions xy where xy.items_id = x.items_id)
)usuario_solucao,
(select distinct(case when (select 1 from glpi_itilsolutions where items_id = y.id) = 1 then 'Finalizada' else 'Pendente' end) status_compra
from glpi_tickets_tickets x, glpi_tickets y, glpi_groups_tickets z
where x.tickets_id_2 = y.id
and y.id = z.tickets_id
and z.groups_id = 5
and z.type = 1
and x.tickets_id_1 = a.id)status_compra
from glpi_tickets a LEFT JOIN glpi_items_tickets k ON a.id = k.tickets_id, glpi_users b, glpi_locations d, glpi_itilcategories e, glpi_groups_tickets j
where a.users_id_recipient = b.id
and a.locations_id = d.id
and a.itilcategories_id = e.id
and a.id = j.tickets_id
and j.groups_id in (1,10)
and j.type = 1
and a.is_deleted = 0