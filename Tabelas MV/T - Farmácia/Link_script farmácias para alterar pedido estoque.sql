-- Link farmácias para alterar

http://172.16.80.4:82/app/MV/farmacia/Farmacia_Atendente.asp

CD_ESTOQUE = 3 --FARMACIA CENTRAL
CD_ESTOQUE = 5 --FARMACIA UTI

select *
from setor
where cd_setor in (37,38,39);
/

select *
from CONFIG_ESTOQUE
where cd_setor in (37,38,39);



