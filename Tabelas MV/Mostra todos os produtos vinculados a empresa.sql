-- Mostra todos os produtos vinculados a empresa
select * from empresa_produto e, produto p
where e.cd_produto = p.cd_produto
and e.cd_multi_empresa = 1