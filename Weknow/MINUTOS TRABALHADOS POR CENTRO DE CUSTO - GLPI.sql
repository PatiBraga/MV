select c.name localizacao, CONVERT(FORMAT(sum((a.actiontime/60)),0),char)minutos 
from glpi_tickettasks a, glpi_tickets b, glpi_locations c, glpi_groups_tickets d
where a.tickets_id = b.id  
and b.locations_id = c.id 
and b.id = d.tickets_id
and d.groups_id in (1,10)
and d.type = 1
and a.date_creation between '2025-11-01' and '2025-11-30'
group by c.name