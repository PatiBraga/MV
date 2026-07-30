-- mapear ou apresentar quantas vezes o mesmo paciente passou na unidade
select 
cd_paciente,
count(cd_multi_empresa),
cd_multi_empresa
from  atendime
group by cd_multi_empresa , cd_paciente
having count(cd_multi_empresa) >1;


Select nm_paciente ,
Count (cd_atendimento) qtd 
From atendime
Join paciente on paciente.cd_paciente = atendime.cd_paciente
Group by nm_paciente