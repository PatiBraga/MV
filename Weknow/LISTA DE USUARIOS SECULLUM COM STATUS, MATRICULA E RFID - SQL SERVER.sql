select pessoas.n_identificador, pessoas.nome, replace(pessoas.n_provisorio,',','')rfid, filtro2.descricao, pessoas.estado, 
case 
	when pessoas.estado = 0 then 'Ativo'
	when pessoas.estado = 2 then 'Livre'
	when pessoas.estado = 3 then 'Desligado'
end status
from pessoas
	left join filtro2 on pessoas.filtro2_id = filtro2.id
--where n_identificador = '85';
