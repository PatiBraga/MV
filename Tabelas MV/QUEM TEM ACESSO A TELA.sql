-- QUEM TEM ACESSO A TELA
--CONSULTA USUÁRIOS POR TELA
select * from DBASGU.AUT_MOD t
where t.cd_modulo = 'O_CAIXA_ABERT'
for update

-- CONSULTA PAPEL POR TELAS
select * from dbasgu.papel_mod a, dbasgu.papel b
where a.cd_papel = b.cd_papel
and cd_modulo = 'O_CAIXA_ABERT'


--CONSULTA USUÁRIOS POR PAPEL
SELECT * FROM DBASGU.PAPEL_USUARIOS
WHERE CD_PAPEL = 67