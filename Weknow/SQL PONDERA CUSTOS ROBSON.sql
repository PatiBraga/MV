select *
from PRO_FAT;

select *
from exa_lab;

select a.cd_exa_rx cd_exame, a.ds_exa_rx ds_Exame, a.exa_rx_cd_pro_fat cd_pro_fat, b.cd_pro_fat_hierarquizado cd_pro_fat_cbhpm
from exa_rx a, pro_fat_hierarquizado b
where a.exa_rx_cd_pro_fat = b.cd_pro_fat (+)
and a.cd_exa_rx = 296 ;

select *
from pro_fat_hierarquizado
where ds_pro_fat_hierarquizado like '%ABDOMEN%';



select *
from exa_rx
where cd_exa_rx = 296; ---802;

select *
from pondera_procedimento
where cd_exa_rx = 33;


