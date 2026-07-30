select
1 qt_total_registro,
1 NR_INDICADOR,
'IND I - PRODUTIVIDADE E PERFIL' INDICADOR,
'Ambulatorial' QUEBRA,
DATE(anomes) DT,
case
when month(anomes) = 1 then 'Janeiro'
when month(anomes) = 2 then 'Fevereiro'
when month(anomes) = 3 then 'Março'
when month(anomes) = 4 then 'Abril'
when month(anomes) = 5 then 'Maio'
when month(anomes) = 6 then 'Junho'
when month(anomes) = 7 then 'Julho'
when month(anomes) = 8 then 'Agosto'
when month(anomes) = 9 then 'Setembro'
when month(anomes) = 10 then 'Outubro'
when month(anomes) = 11 then 'Novembro'
when month(anomes) = 12 then 'Dezembro'
end ds_mes,
month(anomes) mesint,
cast(qt_ambulatorial as numeric(15,2)) VALOR
from
inc_hemodinamica_perfil
union all
select
1 qt_total_registro,
1 NR_INDICADOR,
'IND I - PRODUTIVIDADE E PERFIL' INDICADOR,
'Internado' QUEBRA,
DATE(anomes) DT,
case
when month(anomes) = 1 then 'Janeiro'
when month(anomes) = 2 then 'Fevereiro'
when month(anomes) = 3 then 'Março'
when month(anomes) = 4 then 'Abril'
when month(anomes) = 5 then 'Maio'
when month(anomes) = 6 then 'Junho'
when month(anomes) = 7 then 'Julho'
when month(anomes) = 8 then 'Agosto'
when month(anomes) = 9 then 'Setembro'
when month(anomes) = 10 then 'Outubro'
when month(anomes) = 11 then 'Novembro'
when month(anomes) = 12 then 'Dezembro'
end ds_mes,
month(anomes) mesint,
cast(qt_internado as numeric(15,2)) VALOR
from
inc_hemodinamica_perfil

/*Cardiologia*/
union all
select
1 qt_total_registro,
1 NR_INDICADOR,
'CARDIOLOGIA' INDICADOR,
'BIÓPSIA' QUEBRA,
DATE(anomes) DT,
case
when month(anomes) = 1 then 'Janeiro'
when month(anomes) = 2 then 'Fevereiro'
when month(anomes) = 3 then 'Março'
when month(anomes) = 4 then 'Abril'
when month(anomes) = 5 then 'Maio'
when month(anomes) = 6 then 'Junho'
when month(anomes) = 7 then 'Julho'
when month(anomes) = 8 then 'Agosto'
when month(anomes) = 9 then 'Setembro'
when month(anomes) = 10 then 'Outubro'
when month(anomes) = 11 then 'Novembro'
when month(anomes) = 12 then 'Dezembro'
end ds_mes,
month(anomes) mesint,
cast("BIÓPSIA" as numeric(15,2)) VALOR
from
inc_hemodinamica_cardiologia
union all

select
1 qt_total_registro,
1 NR_INDICADOR,
'CARDIOLOGIA' INDICADOR,
'Diagnóstico' QUEBRA,
DATE(anomes) DT,
case
when month(anomes) = 1 then 'Janeiro'
when month(anomes) = 2 then 'Fevereiro'
when month(anomes) = 3 then 'Março'
when month(anomes) = 4 then 'Abril'
when month(anomes) = 5 then 'Maio'
when month(anomes) = 6 then 'Junho'
when month(anomes) = 7 then 'Julho'
when month(anomes) = 8 then 'Agosto'
when month(anomes) = 9 then 'Setembro'
when month(anomes) = 10 then 'Outubro'
when month(anomes) = 11 then 'Novembro'
when month(anomes) = 12 then 'Dezembro'
end ds_mes,
month(anomes) mesint,
cast(Diagnóstico as numeric(15,2)) VALOR
from
inc_hemodinamica_cardiologia
union all
select
1 qt_total_registro,
1 NR_INDICADOR,
'CARDIOLOGIA' INDICADOR,
'ATC' QUEBRA,
DATE(anomes) DT,
case
when month(anomes) = 1 then 'Janeiro'
when month(anomes) = 2 then 'Fevereiro'
when month(anomes) = 3 then 'Março'
when month(anomes) = 4 then 'Abril'
when month(anomes) = 5 then 'Maio'
when month(anomes) = 6 then 'Junho'
when month(anomes) = 7 then 'Julho'
when month(anomes) = 8 then 'Agosto'
when month(anomes) = 9 then 'Setembro'
when month(anomes) = 10 then 'Outubro'
when month(anomes) = 11 then 'Novembro'
when month(anomes) = 12 then 'Dezembro'
end ds_mes,
month(anomes) mesint,
cast(ATC as numeric(15,2)) VALOR
from
inc_hemodinamica_cardiologia
union all
select
1 qt_total_registro,
1 NR_INDICADOR,
'CARDIOLOGIA' INDICADOR,
'IAM' QUEBRA,
DATE(anomes) DT,
case
when month(anomes) = 1 then 'Janeiro'
when month(anomes) = 2 then 'Fevereiro'
when month(anomes) = 3 then 'Março'
when month(anomes) = 4 then 'Abril'
when month(anomes) = 5 then 'Maio'
when month(anomes) = 6 then 'Junho'
when month(anomes) = 7 then 'Julho'
when month(anomes) = 8 then 'Agosto'
when month(anomes) = 9 then 'Setembro'
when month(anomes) = 10 then 'Outubro'
when month(anomes) = 11 then 'Novembro'
when month(anomes) = 12 then 'Dezembro'
end ds_mes,
month(anomes) mesint,
cast(IAM as numeric(15,2)) VALOR
from
inc_hemodinamica_cardiologia
union all
select
1 qt_total_registro,
1 NR_INDICADOR,
'CARDIOLOGIA' INDICADOR,
'EEF' QUEBRA,
DATE(anomes) DT,
case
when month(anomes) = 1 then 'Janeiro'
when month(anomes) = 2 then 'Fevereiro'
when month(anomes) = 3 then 'Março'
when month(anomes) = 4 then 'Abril'
when month(anomes) = 5 then 'Maio'
when month(anomes) = 6 then 'Junho'
when month(anomes) = 7 then 'Julho'
when month(anomes) = 8 then 'Agosto'
when month(anomes) = 9 then 'Setembro'
when month(anomes) = 10 then 'Outubro'
when month(anomes) = 11 then 'Novembro'
when month(anomes) = 12 then 'Dezembro'
end ds_mes,
month(anomes) mesint,
cast(EEF as numeric(15,2)) VALOR
from
inc_hemodinamica_cardiologia
union all
select
1 qt_total_registro,
1 NR_INDICADOR,
'CARDIOLOGIA' INDICADOR,
'FA' QUEBRA,
DATE(anomes) DT,
case
when month(anomes) = 1 then 'Janeiro'
when month(anomes) = 2 then 'Fevereiro'
when month(anomes) = 3 then 'Março'
when month(anomes) = 4 then 'Abril'
when month(anomes) = 5 then 'Maio'
when month(anomes) = 6 then 'Junho'
when month(anomes) = 7 then 'Julho'
when month(anomes) = 8 then 'Agosto'
when month(anomes) = 9 then 'Setembro'
when month(anomes) = 10 then 'Outubro'
when month(anomes) = 11 then 'Novembro'
when month(anomes) = 12 then 'Dezembro'
end ds_mes,
month(anomes) mesint,
cast(FA as numeric(15,2)) VALOR
from
inc_hemodinamica_cardiologia
union all
select
1 qt_total_registro,
1 NR_INDICADOR,
'CARDIOLOGIA' INDICADOR,
'PFO / CIA' QUEBRA,
DATE(anomes) DT,
case
when month(anomes) = 1 then 'Janeiro'
when month(anomes) = 2 then 'Fevereiro'
when month(anomes) = 3 then 'Março'
when month(anomes) = 4 then 'Abril'
when month(anomes) = 5 then 'Maio'
when month(anomes) = 6 then 'Junho'
when month(anomes) = 7 then 'Julho'
when month(anomes) = 8 then 'Agosto'
when month(anomes) = 9 then 'Setembro'
when month(anomes) = 10 then 'Outubro'
when month(anomes) = 11 then 'Novembro'
when month(anomes) = 12 then 'Dezembro'
end ds_mes,
month(anomes) mesint,
cast("PFO / CIA" as numeric(15,2)) VALOR
from
inc_hemodinamica_cardiologia
union all
select
1 qt_total_registro,
1 NR_INDICADOR,
'CARDIOLOGIA' INDICADOR,
'TAVI / MitraClip / Valvoplastia' QUEBRA,
DATE(anomes) DT,
case
when month(anomes) = 1 then 'Janeiro'
when month(anomes) = 2 then 'Fevereiro'
when month(anomes) = 3 then 'Março'
when month(anomes) = 4 then 'Abril'
when month(anomes) = 5 then 'Maio'
when month(anomes) = 6 then 'Junho'
when month(anomes) = 7 then 'Julho'
when month(anomes) = 8 then 'Agosto'
when month(anomes) = 9 then 'Setembro'
when month(anomes) = 10 then 'Outubro'
when month(anomes) = 11 then 'Novembro'
when month(anomes) = 12 then 'Dezembro'
end ds_mes,
month(anomes) mesint,
cast("TAVI / MitraClip / Valvoplastia" as numeric(15,2)) VALOR
from
inc_hemodinamica_cardiologia
union all
select
1 qt_total_registro,
1 NR_INDICADOR,
'CARDIOLOGIA' INDICADOR,
'Implante de Marcapasso' QUEBRA,
DATE(anomes) DT,
case
when month(anomes) = 1 then 'Janeiro'
when month(anomes) = 2 then 'Fevereiro'
when month(anomes) = 3 then 'Março'
when month(anomes) = 4 then 'Abril'
when month(anomes) = 5 then 'Maio'
when month(anomes) = 6 then 'Junho'
when month(anomes) = 7 then 'Julho'
when month(anomes) = 8 then 'Agosto'
when month(anomes) = 9 then 'Setembro'
when month(anomes) = 10 then 'Outubro'
when month(anomes) = 11 then 'Novembro'
when month(anomes) = 12 then 'Dezembro'
end ds_mes,
month(anomes) mesint,
cast("Implante de Marcapasso" as numeric(15,2)) VALOR
from
inc_hemodinamica_cardiologia
union all
select
1 qt_total_registro,
1 NR_INDICADOR,
'CARDIOLOGIA' INDICADOR,
'US' QUEBRA,
DATE(anomes) DT,
case
when month(anomes) = 1 then 'Janeiro'
when month(anomes) = 2 then 'Fevereiro'
when month(anomes) = 3 then 'Março'
when month(anomes) = 4 then 'Abril'
when month(anomes) = 5 then 'Maio'
when month(anomes) = 6 then 'Junho'
when month(anomes) = 7 then 'Julho'
when month(anomes) = 8 then 'Agosto'
when month(anomes) = 9 then 'Setembro'
when month(anomes) = 10 then 'Outubro'
when month(anomes) = 11 then 'Novembro'
when month(anomes) = 12 then 'Dezembro'
end ds_mes,
month(anomes) mesint,
cast("US" as numeric(15,2)) VALOR
from
inc_hemodinamica_cardiologia

/*Neurologia*/
union all

select
1 qt_total_registro,
1 NR_INDICADOR,
'NEUROLOGIA' INDICADOR,
'Diagnóstico' QUEBRA,
DATE(anomes) DT,
case
when month(anomes) = 1 then 'Janeiro'
when month(anomes) = 2 then 'Fevereiro'
when month(anomes) = 3 then 'Março'
when month(anomes) = 4 then 'Abril'
when month(anomes) = 5 then 'Maio'
when month(anomes) = 6 then 'Junho'
when month(anomes) = 7 then 'Julho'
when month(anomes) = 8 then 'Agosto'
when month(anomes) = 9 then 'Setembro'
when month(anomes) = 10 then 'Outubro'
when month(anomes) = 11 then 'Novembro'
when month(anomes) = 12 then 'Dezembro'
end ds_mes,
month(anomes) mesint,
cast("Diagnóstico" as numeric(15,2)) VALOR
from
inc_hemodinamica_NEUROLOGIA
union all
select
1 qt_total_registro,
1 NR_INDICADOR,
'NEUROLOGIA' INDICADOR,
'ATP' QUEBRA,
DATE(anomes) DT,
case
when month(anomes) = 1 then 'Janeiro'
when month(anomes) = 2 then 'Fevereiro'
when month(anomes) = 3 then 'Março'
when month(anomes) = 4 then 'Abril'
when month(anomes) = 5 then 'Maio'
when month(anomes) = 6 then 'Junho'
when month(anomes) = 7 then 'Julho'
when month(anomes) = 8 then 'Agosto'
when month(anomes) = 9 then 'Setembro'
when month(anomes) = 10 then 'Outubro'
when month(anomes) = 11 then 'Novembro'
when month(anomes) = 12 then 'Dezembro'
end ds_mes,
month(anomes) mesint,
cast("ATP" as numeric(15,2)) VALOR
from
inc_hemodinamica_NEUROLOGIA
union all
select
1 qt_total_registro,
1 NR_INDICADOR,
'NEUROLOGIA' INDICADOR,
'Embolização' QUEBRA,
DATE(anomes) DT,
case
when month(anomes) = 1 then 'Janeiro'
when month(anomes) = 2 then 'Fevereiro'
when month(anomes) = 3 then 'Março'
when month(anomes) = 4 then 'Abril'
when month(anomes) = 5 then 'Maio'
when month(anomes) = 6 then 'Junho'
when month(anomes) = 7 then 'Julho'
when month(anomes) = 8 then 'Agosto'
when month(anomes) = 9 then 'Setembro'
when month(anomes) = 10 then 'Outubro'
when month(anomes) = 11 then 'Novembro'
when month(anomes) = 12 then 'Dezembro'
end ds_mes,
month(anomes) mesint,
cast("Embolização" as numeric(15,2)) VALOR
from
inc_hemodinamica_NEUROLOGIA
union all
select
1 qt_total_registro,
1 NR_INDICADOR,
'NEUROLOGIA' INDICADOR,
'Trombólise/ Trombectomia' QUEBRA,
DATE(anomes) DT,
case
when month(anomes) = 1 then 'Janeiro'
when month(anomes) = 2 then 'Fevereiro'
when month(anomes) = 3 then 'Março'
when month(anomes) = 4 then 'Abril'
when month(anomes) = 5 then 'Maio'
when month(anomes) = 6 then 'Junho'
when month(anomes) = 7 then 'Julho'
when month(anomes) = 8 then 'Agosto'
when month(anomes) = 9 then 'Setembro'
when month(anomes) = 10 then 'Outubro'
when month(anomes) = 11 then 'Novembro'
when month(anomes) = 12 then 'Dezembro'
end ds_mes,
month(anomes) mesint,
cast("Trombólise/ Trombectomia" as numeric(15,2)) VALOR
from
inc_hemodinamica_NEUROLOGIA
union all
select
1 qt_total_registro,
1 NR_INDICADOR,
'NEUROLOGIA' INDICADOR,
'Neurotomia' QUEBRA,
DATE(anomes) DT,
case
when month(anomes) = 1 then 'Janeiro'
when month(anomes) = 2 then 'Fevereiro'
when month(anomes) = 3 then 'Março'
when month(anomes) = 4 then 'Abril'
when month(anomes) = 5 then 'Maio'
when month(anomes) = 6 then 'Junho'
when month(anomes) = 7 then 'Julho'
when month(anomes) = 8 then 'Agosto'
when month(anomes) = 9 then 'Setembro'
when month(anomes) = 10 then 'Outubro'
when month(anomes) = 11 then 'Novembro'
when month(anomes) = 12 then 'Dezembro'
end ds_mes,
month(anomes) mesint,
cast("Neurotomia" as numeric(15,2)) VALOR
from
inc_hemodinamica_NEUROLOGIA

/* Vascular */
union all
select
1 qt_total_registro,
1 NR_INDICADOR,
'VASCULAR' INDICADOR,
'Diagnóstico' QUEBRA,
DATE(anomes) DT,
case
when month(anomes) = 1 then 'Janeiro'
when month(anomes) = 2 then 'Fevereiro'
when month(anomes) = 3 then 'Março'
when month(anomes) = 4 then 'Abril'
when month(anomes) = 5 then 'Maio'
when month(anomes) = 6 then 'Junho'
when month(anomes) = 7 then 'Julho'
when month(anomes) = 8 then 'Agosto'
when month(anomes) = 9 then 'Setembro'
when month(anomes) = 10 then 'Outubro'
when month(anomes) = 11 then 'Novembro'
when month(anomes) = 12 then 'Dezembro'
end ds_mes,
month(anomes) mesint,
cast("Diagnóstico" as numeric(15,2)) VALOR
from
inc_hemodinamica_VASCULAR
union all
select
1 qt_total_registro,
1 NR_INDICADOR,
'VASCULAR' INDICADOR,
'ATP' QUEBRA,
DATE(anomes) DT,
case
when month(anomes) = 1 then 'Janeiro'
when month(anomes) = 2 then 'Fevereiro'
when month(anomes) = 3 then 'Março'
when month(anomes) = 4 then 'Abril'
when month(anomes) = 5 then 'Maio'
when month(anomes) = 6 then 'Junho'
when month(anomes) = 7 then 'Julho'
when month(anomes) = 8 then 'Agosto'
when month(anomes) = 9 then 'Setembro'
when month(anomes) = 10 then 'Outubro'
when month(anomes) = 11 then 'Novembro'
when month(anomes) = 12 then 'Dezembro'
end ds_mes,
month(anomes) mesint,
cast("ATP" as numeric(15,2)) VALOR
from
inc_hemodinamica_VASCULAR
union all
select
1 qt_total_registro,
1 NR_INDICADOR,
'VASCULAR' INDICADOR,
'Embolização' QUEBRA,
DATE(anomes) DT,
case
when month(anomes) = 1 then 'Janeiro'
when month(anomes) = 2 then 'Fevereiro'
when month(anomes) = 3 then 'Março'
when month(anomes) = 4 then 'Abril'
when month(anomes) = 5 then 'Maio'
when month(anomes) = 6 then 'Junho'
when month(anomes) = 7 then 'Julho'
when month(anomes) = 8 then 'Agosto'
when month(anomes) = 9 then 'Setembro'
when month(anomes) = 10 then 'Outubro'
when month(anomes) = 11 then 'Novembro'
when month(anomes) = 12 then 'Dezembro'
end ds_mes,
month(anomes) mesint,
cast("Embolização" as numeric(15,2)) VALOR
from
inc_hemodinamica_VASCULAR
union all
select
1 qt_total_registro,
1 NR_INDICADOR,
'VASCULAR' INDICADOR,
'Endoprotese' QUEBRA,
DATE(anomes) DT,
case
when month(anomes) = 1 then 'Janeiro'
when month(anomes) = 2 then 'Fevereiro'
when month(anomes) = 3 then 'Março'
when month(anomes) = 4 then 'Abril'
when month(anomes) = 5 then 'Maio'
when month(anomes) = 6 then 'Junho'
when month(anomes) = 7 then 'Julho'
when month(anomes) = 8 then 'Agosto'
when month(anomes) = 9 then 'Setembro'
when month(anomes) = 10 then 'Outubro'
when month(anomes) = 11 then 'Novembro'
when month(anomes) = 12 then 'Dezembro'
end ds_mes,
month(anomes) mesint,
cast("Endoprotese" as numeric(15,2)) VALOR
from
inc_hemodinamica_VASCULAR
union all
select
1 qt_total_registro,
1 NR_INDICADOR,
'VASCULAR' INDICADOR,
'Filtro Veia Cava/ Embolectomia' QUEBRA,
DATE(anomes) DT,
case
when month(anomes) = 1 then 'Janeiro'
when month(anomes) = 2 then 'Fevereiro'
when month(anomes) = 3 then 'Março'
when month(anomes) = 4 then 'Abril'
when month(anomes) = 5 then 'Maio'
when month(anomes) = 6 then 'Junho'
when month(anomes) = 7 then 'Julho'
when month(anomes) = 8 then 'Agosto'
when month(anomes) = 9 then 'Setembro'
when month(anomes) = 10 then 'Outubro'
when month(anomes) = 11 then 'Novembro'
when month(anomes) = 12 then 'Dezembro'
end ds_mes,
month(anomes) mesint,
cast("Filtro Veia Cava/ Embolectomia" as numeric(15,2)) VALOR
from
inc_hemodinamica_VASCULAR

/* Taxa de Ocupação de Sala */
union all
select
1 qt_total_registro,
1 NR_INDICADOR,
'IND II - TAXA DE OCUPAÇÃO DA SALA' INDICADOR,
'N° Horas/mês' QUEBRA,
DATE(anomes) DT,
case
when month(anomes) = 1 then 'Janeiro'
when month(anomes) = 2 then 'Fevereiro'
when month(anomes) = 3 then 'Março'
when month(anomes) = 4 then 'Abril'
when month(anomes) = 5 then 'Maio'
when month(anomes) = 6 then 'Junho'
when month(anomes) = 7 then 'Julho'
when month(anomes) = 8 then 'Agosto'
when month(anomes) = 9 then 'Setembro'
when month(anomes) = 10 then 'Outubro'
when month(anomes) = 11 then 'Novembro'
when month(anomes) = 12 then 'Dezembro'
end ds_mes,
month(anomes) mesint,
cast("N° Horas/mês" as numeric(15,2)) VALOR
from
inc_hemodinamica_taxa_ocupacao_sala
union all
select
1 qt_total_registro,
1 NR_INDICADOR,
'IND II - TAXA DE OCUPAÇÃO DA SALA' INDICADOR,
'Taxa de ocupação mensal %' QUEBRA,
DATE(anomes) DT,
case
when month(anomes) = 1 then 'Janeiro'
when month(anomes) = 2 then 'Fevereiro'
when month(anomes) = 3 then 'Março'
when month(anomes) = 4 then 'Abril'
when month(anomes) = 5 then 'Maio'
when month(anomes) = 6 then 'Junho'
when month(anomes) = 7 then 'Julho'
when month(anomes) = 8 then 'Agosto'
when month(anomes) = 9 then 'Setembro'
when month(anomes) = 10 then 'Outubro'
when month(anomes) = 11 then 'Novembro'
when month(anomes) = 12 then 'Dezembro'
end ds_mes,
month(anomes) mesint,
cast("Taxa de ocupação mensal %" as numeric(15,2)) VALOR
from
inc_hemodinamica_taxa_ocupacao_sala

/* Suspensão de Procedimentos */
union all
select
1 qt_total_registro,
1 NR_INDICADOR,
'IND III - SUSPENSÃO DE PROCEDIMENTOS' INDICADOR,
'VAVOPLASTIA' QUEBRA,
DATE(anomes) DT,
case
when month(anomes) = 1 then 'Janeiro'
when month(anomes) = 2 then 'Fevereiro'
when month(anomes) = 3 then 'Março'
when month(anomes) = 4 then 'Abril'
when month(anomes) = 5 then 'Maio'
when month(anomes) = 6 then 'Junho'
when month(anomes) = 7 then 'Julho'
when month(anomes) = 8 then 'Agosto'
when month(anomes) = 9 then 'Setembro'
when month(anomes) = 10 then 'Outubro'
when month(anomes) = 11 then 'Novembro'
when month(anomes) = 12 then 'Dezembro'
end ds_mes,
month(anomes) mesint,
cast("VAVOPLASTIA" as numeric(15,2)) VALOR
from
inc_hemodinamica_suspensao_procedimento
union all
select
1 qt_total_registro,
1 NR_INDICADOR,
'IND III - SUSPENSÃO DE PROCEDIMENTOS' INDICADOR,
'Diagnóstico' QUEBRA,
DATE(anomes) DT,
case
when month(anomes) = 1 then 'Janeiro'
when month(anomes) = 2 then 'Fevereiro'
when month(anomes) = 3 then 'Março'
when month(anomes) = 4 then 'Abril'
when month(anomes) = 5 then 'Maio'
when month(anomes) = 6 then 'Junho'
when month(anomes) = 7 then 'Julho'
when month(anomes) = 8 then 'Agosto'
when month(anomes) = 9 then 'Setembro'
when month(anomes) = 10 then 'Outubro'
when month(anomes) = 11 then 'Novembro'
when month(anomes) = 12 then 'Dezembro'
end ds_mes,
month(anomes) mesint,
cast("Diagnóstico" as numeric(15,2)) VALOR
from
inc_hemodinamica_suspensao_procedimento
union all
select
1 qt_total_registro,
1 NR_INDICADOR,
'IND III - SUSPENSÃO DE PROCEDIMENTOS' INDICADOR,
'ATC' QUEBRA,
DATE(anomes) DT,
case
when month(anomes) = 1 then 'Janeiro'
when month(anomes) = 2 then 'Fevereiro'
when month(anomes) = 3 then 'Março'
when month(anomes) = 4 then 'Abril'
when month(anomes) = 5 then 'Maio'
when month(anomes) = 6 then 'Junho'
when month(anomes) = 7 then 'Julho'
when month(anomes) = 8 then 'Agosto'
when month(anomes) = 9 then 'Setembro'
when month(anomes) = 10 then 'Outubro'
when month(anomes) = 11 then 'Novembro'
when month(anomes) = 12 then 'Dezembro'
end ds_mes,
month(anomes) mesint,
cast("ATC" as numeric(15,2)) VALOR
from
inc_hemodinamica_suspensao_procedimento
union all
select
1 qt_total_registro,
1 NR_INDICADOR,
'IND III - SUSPENSÃO DE PROCEDIMENTOS' INDICADOR,
'EEF' QUEBRA,
DATE(anomes) DT,
case
when month(anomes) = 1 then 'Janeiro'
when month(anomes) = 2 then 'Fevereiro'
when month(anomes) = 3 then 'Março'
when month(anomes) = 4 then 'Abril'
when month(anomes) = 5 then 'Maio'
when month(anomes) = 6 then 'Junho'
when month(anomes) = 7 then 'Julho'
when month(anomes) = 8 then 'Agosto'
when month(anomes) = 9 then 'Setembro'
when month(anomes) = 10 then 'Outubro'
when month(anomes) = 11 then 'Novembro'
when month(anomes) = 12 then 'Dezembro'
end ds_mes,
month(anomes) mesint,
cast("EEF" as numeric(15,2)) VALOR
from
inc_hemodinamica_suspensao_procedimento
union all
select
1 qt_total_registro,
1 NR_INDICADOR,
'IND III - SUSPENSÃO DE PROCEDIMENTOS' INDICADOR,
'FA' QUEBRA,
DATE(anomes) DT,
case
when month(anomes) = 1 then 'Janeiro'
when month(anomes) = 2 then 'Fevereiro'
when month(anomes) = 3 then 'Março'
when month(anomes) = 4 then 'Abril'
when month(anomes) = 5 then 'Maio'
when month(anomes) = 6 then 'Junho'
when month(anomes) = 7 then 'Julho'
when month(anomes) = 8 then 'Agosto'
when month(anomes) = 9 then 'Setembro'
when month(anomes) = 10 then 'Outubro'
when month(anomes) = 11 then 'Novembro'
when month(anomes) = 12 then 'Dezembro'
end ds_mes,
month(anomes) mesint,
cast("FA" as numeric(15,2)) VALOR
from
inc_hemodinamica_suspensao_procedimento
union all
select
1 qt_total_registro,
1 NR_INDICADOR,
'IND III - SUSPENSÃO DE PROCEDIMENTOS' INDICADOR,
'PFO / CIA' QUEBRA,
DATE(anomes) DT,
case
when month(anomes) = 1 then 'Janeiro'
when month(anomes) = 2 then 'Fevereiro'
when month(anomes) = 3 then 'Março'
when month(anomes) = 4 then 'Abril'
when month(anomes) = 5 then 'Maio'
when month(anomes) = 6 then 'Junho'
when month(anomes) = 7 then 'Julho'
when month(anomes) = 8 then 'Agosto'
when month(anomes) = 9 then 'Setembro'
when month(anomes) = 10 then 'Outubro'
when month(anomes) = 11 then 'Novembro'
when month(anomes) = 12 then 'Dezembro'
end ds_mes,
month(anomes) mesint,
cast("PFO / CIA" as numeric(15,2)) VALOR
from
inc_hemodinamica_suspensao_procedimento
union all
select
1 qt_total_registro,
1 NR_INDICADOR,
'IND III - SUSPENSÃO DE PROCEDIMENTOS' INDICADOR,
'TAVI' QUEBRA,
DATE(anomes) DT,
case
when month(anomes) = 1 then 'Janeiro'
when month(anomes) = 2 then 'Fevereiro'
when month(anomes) = 3 then 'Março'
when month(anomes) = 4 then 'Abril'
when month(anomes) = 5 then 'Maio'
when month(anomes) = 6 then 'Junho'
when month(anomes) = 7 then 'Julho'
when month(anomes) = 8 then 'Agosto'
when month(anomes) = 9 then 'Setembro'
when month(anomes) = 10 then 'Outubro'
when month(anomes) = 11 then 'Novembro'
when month(anomes) = 12 then 'Dezembro'
end ds_mes,
month(anomes) mesint,
cast("TAVI" as numeric(15,2)) VALOR
from
inc_hemodinamica_suspensao_procedimento
union all
select
1 qt_total_registro,
1 NR_INDICADOR,
'IND III - SUSPENSÃO DE PROCEDIMENTOS' INDICADOR,
'US' QUEBRA,
DATE(anomes) DT,
case
when month(anomes) = 1 then 'Janeiro'
when month(anomes) = 2 then 'Fevereiro'
when month(anomes) = 3 then 'Março'
when month(anomes) = 4 then 'Abril'
when month(anomes) = 5 then 'Maio'
when month(anomes) = 6 then 'Junho'
when month(anomes) = 7 then 'Julho'
when month(anomes) = 8 then 'Agosto'
when month(anomes) = 9 then 'Setembro'
when month(anomes) = 10 then 'Outubro'
when month(anomes) = 11 then 'Novembro'
when month(anomes) = 12 then 'Dezembro'
end ds_mes,
month(anomes) mesint,
cast("US" as numeric(15,2)) VALOR
from
inc_hemodinamica_suspensao_procedimento
union all
select
1 qt_total_registro,
1 NR_INDICADOR,
'IND III - SUSPENSÃO DE PROCEDIMENTOS' INDICADOR,
'ATP' QUEBRA,
DATE(anomes) DT,
case
when month(anomes) = 1 then 'Janeiro'
when month(anomes) = 2 then 'Fevereiro'
when month(anomes) = 3 then 'Março'
when month(anomes) = 4 then 'Abril'
when month(anomes) = 5 then 'Maio'
when month(anomes) = 6 then 'Junho'
when month(anomes) = 7 then 'Julho'
when month(anomes) = 8 then 'Agosto'
when month(anomes) = 9 then 'Setembro'
when month(anomes) = 10 then 'Outubro'
when month(anomes) = 11 then 'Novembro'
when month(anomes) = 12 then 'Dezembro'
end ds_mes,
month(anomes) mesint,
cast("ATP" as numeric(15,2)) VALOR
from
inc_hemodinamica_suspensao_procedimento
union all
select
1 qt_total_registro,
1 NR_INDICADOR,
'IND III - SUSPENSÃO DE PROCEDIMENTOS' INDICADOR,
'Embolização' QUEBRA,
DATE(anomes) DT,
case
when month(anomes) = 1 then 'Janeiro'
when month(anomes) = 2 then 'Fevereiro'
when month(anomes) = 3 then 'Março'
when month(anomes) = 4 then 'Abril'
when month(anomes) = 5 then 'Maio'
when month(anomes) = 6 then 'Junho'
when month(anomes) = 7 then 'Julho'
when month(anomes) = 8 then 'Agosto'
when month(anomes) = 9 then 'Setembro'
when month(anomes) = 10 then 'Outubro'
when month(anomes) = 11 then 'Novembro'
when month(anomes) = 12 then 'Dezembro'
end ds_mes,
month(anomes) mesint,
cast("Embolização" as numeric(15,2)) VALOR
from
inc_hemodinamica_suspensao_procedimento
union all
select
1 qt_total_registro,
1 NR_INDICADOR,
'IND III - SUSPENSÃO DE PROCEDIMENTOS' INDICADOR,
'Endoprotese' QUEBRA,
DATE(anomes) DT,
case
when month(anomes) = 1 then 'Janeiro'
when month(anomes) = 2 then 'Fevereiro'
when month(anomes) = 3 then 'Março'
when month(anomes) = 4 then 'Abril'
when month(anomes) = 5 then 'Maio'
when month(anomes) = 6 then 'Junho'
when month(anomes) = 7 then 'Julho'
when month(anomes) = 8 then 'Agosto'
when month(anomes) = 9 then 'Setembro'
when month(anomes) = 10 then 'Outubro'
when month(anomes) = 11 then 'Novembro'
when month(anomes) = 12 then 'Dezembro'
end ds_mes,
month(anomes) mesint,
cast("Endoprotese" as numeric(15,2)) VALOR
from
inc_hemodinamica_suspensao_procedimento
union all
select
1 qt_total_registro,
1 NR_INDICADOR,
'IND III - SUSPENSÃO DE PROCEDIMENTOS' INDICADOR,
'Retirada Corpo Estranho' QUEBRA,
DATE(anomes) DT,
case
when month(anomes) = 1 then 'Janeiro'
when month(anomes) = 2 then 'Fevereiro'
when month(anomes) = 3 then 'Março'
when month(anomes) = 4 then 'Abril'
when month(anomes) = 5 then 'Maio'
when month(anomes) = 6 then 'Junho'
when month(anomes) = 7 then 'Julho'
when month(anomes) = 8 then 'Agosto'
when month(anomes) = 9 then 'Setembro'
when month(anomes) = 10 then 'Outubro'
when month(anomes) = 11 then 'Novembro'
when month(anomes) = 12 then 'Dezembro'
end ds_mes,
month(anomes) mesint,
cast("Retirada Corpo Estranho" as numeric(15,2)) VALOR
from
inc_hemodinamica_suspensao_procedimento
union all
select
1 qt_total_registro,
1 NR_INDICADOR,
'IND III - SUSPENSÃO DE PROCEDIMENTOS' INDICADOR,
'Biópsia' QUEBRA,
DATE(anomes) DT,
case
when month(anomes) = 1 then 'Janeiro'
when month(anomes) = 2 then 'Fevereiro'
when month(anomes) = 3 then 'Março'
when month(anomes) = 4 then 'Abril'
when month(anomes) = 5 then 'Maio'
when month(anomes) = 6 then 'Junho'
when month(anomes) = 7 then 'Julho'
when month(anomes) = 8 then 'Agosto'
when month(anomes) = 9 then 'Setembro'
when month(anomes) = 10 then 'Outubro'
when month(anomes) = 11 then 'Novembro'
when month(anomes) = 12 then 'Dezembro'
end ds_mes,
month(anomes) mesint,
cast("Biópsia" as numeric(15,2)) VALOR
from
inc_hemodinamica_suspensao_procedimento

/*Motivo da Suspensão de Procedimentos */
union all

select
1 qt_total_registro,
1 NR_INDICADOR,
'MOTIVOS DE PROCEDIMENTOS SUSPENSOS' INDICADOR,
'Falta de preparo' QUEBRA,
DATE(anomes) DT,
case
when month(anomes) = 1 then 'Janeiro'
when month(anomes) = 2 then 'Fevereiro'
when month(anomes) = 3 then 'Março'
when month(anomes) = 4 then 'Abril'
when month(anomes) = 5 then 'Maio'
when month(anomes) = 6 then 'Junho'
when month(anomes) = 7 then 'Julho'
when month(anomes) = 8 then 'Agosto'
when month(anomes) = 9 then 'Setembro'
when month(anomes) = 10 then 'Outubro'
when month(anomes) = 11 then 'Novembro'
when month(anomes) = 12 then 'Dezembro'
end ds_mes,
month(anomes) mesint,
cast("Falta de preparo" as numeric(15,2)) VALOR
from
inc_hemodinamica_motivo_suspensao_procedimento
union all
select
1 qt_total_registro,
1 NR_INDICADOR,
'MOTIVOS DE PROCEDIMENTOS SUSPENSOS' INDICADOR,
'Falta de vaga em leito - UTI / UCC' QUEBRA,
DATE(anomes) DT,
case
when month(anomes) = 1 then 'Janeiro'
when month(anomes) = 2 then 'Fevereiro'
when month(anomes) = 3 then 'Março'
when month(anomes) = 4 then 'Abril'
when month(anomes) = 5 then 'Maio'
when month(anomes) = 6 then 'Junho'
when month(anomes) = 7 then 'Julho'
when month(anomes) = 8 then 'Agosto'
when month(anomes) = 9 then 'Setembro'
when month(anomes) = 10 then 'Outubro'
when month(anomes) = 11 then 'Novembro'
when month(anomes) = 12 then 'Dezembro'
end ds_mes,
month(anomes) mesint,
cast("Falta de vaga em leito - UTI / UCC" as numeric(15,2)) VALOR
from
inc_hemodinamica_motivo_suspensao_procedimento
union all
select
1 qt_total_registro,
1 NR_INDICADOR,
'MOTIVOS DE PROCEDIMENTOS SUSPENSOS' INDICADOR,
'Condições clínicas do pcte' QUEBRA,
DATE(anomes) DT,
case
when month(anomes) = 1 then 'Janeiro'
when month(anomes) = 2 then 'Fevereiro'
when month(anomes) = 3 then 'Março'
when month(anomes) = 4 then 'Abril'
when month(anomes) = 5 then 'Maio'
when month(anomes) = 6 then 'Junho'
when month(anomes) = 7 then 'Julho'
when month(anomes) = 8 then 'Agosto'
when month(anomes) = 9 then 'Setembro'
when month(anomes) = 10 then 'Outubro'
when month(anomes) = 11 then 'Novembro'
when month(anomes) = 12 then 'Dezembro'
end ds_mes,
month(anomes) mesint,
cast("Condições clínicas do pcte" as numeric(15,2)) VALOR
from
inc_hemodinamica_motivo_suspensao_procedimento
union all
select
1 qt_total_registro,
1 NR_INDICADOR,
'MOTIVOS DE PROCEDIMENTOS SUSPENSOS' INDICADOR,
'Cancelado pelo médico' QUEBRA,
DATE(anomes) DT,
case
when month(anomes) = 1 then 'Janeiro'
when month(anomes) = 2 then 'Fevereiro'
when month(anomes) = 3 then 'Março'
when month(anomes) = 4 then 'Abril'
when month(anomes) = 5 then 'Maio'
when month(anomes) = 6 then 'Junho'
when month(anomes) = 7 then 'Julho'
when month(anomes) = 8 then 'Agosto'
when month(anomes) = 9 then 'Setembro'
when month(anomes) = 10 then 'Outubro'
when month(anomes) = 11 then 'Novembro'
when month(anomes) = 12 then 'Dezembro'
end ds_mes,
month(anomes) mesint,
cast("Cancelado pelo médico" as numeric(15,2)) VALOR
from
inc_hemodinamica_motivo_suspensao_procedimento
union all
select
1 qt_total_registro,
1 NR_INDICADOR,
'MOTIVOS DE PROCEDIMENTOS SUSPENSOS' INDICADOR,
'Cancelado pelo paciente' QUEBRA,
DATE(anomes) DT,
case
when month(anomes) = 1 then 'Janeiro'
when month(anomes) = 2 then 'Fevereiro'
when month(anomes) = 3 then 'Março'
when month(anomes) = 4 then 'Abril'
when month(anomes) = 5 then 'Maio'
when month(anomes) = 6 then 'Junho'
when month(anomes) = 7 then 'Julho'
when month(anomes) = 8 then 'Agosto'
when month(anomes) = 9 then 'Setembro'
when month(anomes) = 10 then 'Outubro'
when month(anomes) = 11 then 'Novembro'
when month(anomes) = 12 then 'Dezembro'
end ds_mes,
month(anomes) mesint,
cast("Cancelado pelo paciente" as numeric(15,2)) VALOR
from
inc_hemodinamica_motivo_suspensao_procedimento
union all
select
1 qt_total_registro,
1 NR_INDICADOR,
'MOTIVOS DE PROCEDIMENTOS SUSPENSOS' INDICADOR,
'Problemas com Liberação' QUEBRA,
DATE(anomes) DT,
case
when month(anomes) = 1 then 'Janeiro'
when month(anomes) = 2 then 'Fevereiro'
when month(anomes) = 3 then 'Março'
when month(anomes) = 4 then 'Abril'
when month(anomes) = 5 then 'Maio'
when month(anomes) = 6 then 'Junho'
when month(anomes) = 7 then 'Julho'
when month(anomes) = 8 then 'Agosto'
when month(anomes) = 9 then 'Setembro'
when month(anomes) = 10 then 'Outubro'
when month(anomes) = 11 then 'Novembro'
when month(anomes) = 12 then 'Dezembro'
end ds_mes,
month(anomes) mesint,
cast("Problemas com Liberação" as numeric(15,2)) VALOR
from
inc_hemodinamica_motivo_suspensao_procedimento
union all
select
1 qt_total_registro,
1 NR_INDICADOR,
'MOTIVOS DE PROCEDIMENTOS SUSPENSOS' INDICADOR,
'Falta de material/problemas técnicos' QUEBRA,
DATE(anomes) DT,
case
when month(anomes) = 1 then 'Janeiro'
when month(anomes) = 2 then 'Fevereiro'
when month(anomes) = 3 then 'Março'
when month(anomes) = 4 then 'Abril'
when month(anomes) = 5 then 'Maio'
when month(anomes) = 6 then 'Junho'
when month(anomes) = 7 then 'Julho'
when month(anomes) = 8 then 'Agosto'
when month(anomes) = 9 then 'Setembro'
when month(anomes) = 10 then 'Outubro'
when month(anomes) = 11 then 'Novembro'
when month(anomes) = 12 then 'Dezembro'
end ds_mes,
month(anomes) mesint,
cast("Falta de material/problemas técnicos" as numeric(15,2)) VALOR
from
inc_hemodinamica_motivo_suspensao_procedimento

/* Hematomas */
union all

select
1 qt_total_registro,
1 NR_INDICADOR,
'IND IV - HEMATOMAS' INDICADOR,
'Pequeno (< 5 cm)' QUEBRA,
DATE(anomes) DT,
case
when month(anomes) = 1 then 'Janeiro'
when month(anomes) = 2 then 'Fevereiro'
when month(anomes) = 3 then 'Março'
when month(anomes) = 4 then 'Abril'
when month(anomes) = 5 then 'Maio'
when month(anomes) = 6 then 'Junho'
when month(anomes) = 7 then 'Julho'
when month(anomes) = 8 then 'Agosto'
when month(anomes) = 9 then 'Setembro'
when month(anomes) = 10 then 'Outubro'
when month(anomes) = 11 then 'Novembro'
when month(anomes) = 12 then 'Dezembro'
end ds_mes,
month(anomes) mesint,
cast("Pequeno (< 5 cm)" as numeric(15,2)) VALOR
from
inc_hemodinamica_hematomas
union all
select
1 qt_total_registro,
1 NR_INDICADOR,
'IND IV - HEMATOMAS' INDICADOR,
'Médio (5 A 10 cm)' QUEBRA,
DATE(anomes) DT,
case
when month(anomes) = 1 then 'Janeiro'
when month(anomes) = 2 then 'Fevereiro'
when month(anomes) = 3 then 'Março'
when month(anomes) = 4 then 'Abril'
when month(anomes) = 5 then 'Maio'
when month(anomes) = 6 then 'Junho'
when month(anomes) = 7 then 'Julho'
when month(anomes) = 8 then 'Agosto'
when month(anomes) = 9 then 'Setembro'
when month(anomes) = 10 then 'Outubro'
when month(anomes) = 11 then 'Novembro'
when month(anomes) = 12 then 'Dezembro'
end ds_mes,
month(anomes) mesint,
cast("Médio (5 A 10 cm)" as numeric(15,2)) VALOR
from
inc_hemodinamica_hematomas
union all
select
1 qt_total_registro,
1 NR_INDICADOR,
'IND IV - HEMATOMAS' INDICADOR,
'Grande (> 10 cm)' QUEBRA,
DATE(anomes) DT,
case
when month(anomes) = 1 then 'Janeiro'
when month(anomes) = 2 then 'Fevereiro'
when month(anomes) = 3 then 'Março'
when month(anomes) = 4 then 'Abril'
when month(anomes) = 5 then 'Maio'
when month(anomes) = 6 then 'Junho'
when month(anomes) = 7 then 'Julho'
when month(anomes) = 8 then 'Agosto'
when month(anomes) = 9 then 'Setembro'
when month(anomes) = 10 then 'Outubro'
when month(anomes) = 11 then 'Novembro'
when month(anomes) = 12 then 'Dezembro'
end ds_mes,
month(anomes) mesint,
cast("Grande (> 10 cm)" as numeric(15,2)) VALOR
from
inc_hemodinamica_hematomas

union all

select
1 qt_total_registro,
1 NR_INDICADOR,
'IND V - COMPLICAÇÕES VASCULARES' INDICADOR,
'Com presença de pseudo-aneurisma' QUEBRA,
DATE(anomes) DT,
case
when month(anomes) = 1 then 'Janeiro'
when month(anomes) = 2 then 'Fevereiro'
when month(anomes) = 3 then 'Março'
when month(anomes) = 4 then 'Abril'
when month(anomes) = 5 then 'Maio'
when month(anomes) = 6 then 'Junho'
when month(anomes) = 7 then 'Julho'
when month(anomes) = 8 then 'Agosto'
when month(anomes) = 9 then 'Setembro'
when month(anomes) = 10 then 'Outubro'
when month(anomes) = 11 then 'Novembro'
when month(anomes) = 12 then 'Dezembro'
end ds_mes,
month(anomes) mesint,
cast("Com presença de pseudo-aneurisma" as numeric(15,2)) VALOR
from
inc_hemodinamica_complicacoes_vasculares
union all
select
1 qt_total_registro,
1 NR_INDICADOR,
'IND V - COMPLICAÇÕES VASCULARES' INDICADOR,
'Sem presença de pseudo-aneurisma' QUEBRA,
DATE(anomes) DT,
case
when month(anomes) = 1 then 'Janeiro'
when month(anomes) = 2 then 'Fevereiro'
when month(anomes) = 3 then 'Março'
when month(anomes) = 4 then 'Abril'
when month(anomes) = 5 then 'Maio'
when month(anomes) = 6 then 'Junho'
when month(anomes) = 7 then 'Julho'
when month(anomes) = 8 then 'Agosto'
when month(anomes) = 9 then 'Setembro'
when month(anomes) = 10 then 'Outubro'
when month(anomes) = 11 then 'Novembro'
when month(anomes) = 12 then 'Dezembro'
end ds_mes,
month(anomes) mesint,
cast("Sem presença de pseudo-aneurisma" as numeric(15,2)) VALOR
from
inc_hemodinamica_complicacoes_vasculares
union all
select
1 qt_total_registro,
1 NR_INDICADOR,
'IND V - COMPLICAÇÕES VASCULARES' INDICADOR,
'Outras Complicações' QUEBRA,
DATE(anomes) DT,
case
when month(anomes) = 1 then 'Janeiro'
when month(anomes) = 2 then 'Fevereiro'
when month(anomes) = 3 then 'Março'
when month(anomes) = 4 then 'Abril'
when month(anomes) = 5 then 'Maio'
when month(anomes) = 6 then 'Junho'
when month(anomes) = 7 then 'Julho'
when month(anomes) = 8 then 'Agosto'
when month(anomes) = 9 then 'Setembro'
when month(anomes) = 10 then 'Outubro'
when month(anomes) = 11 then 'Novembro'
when month(anomes) = 12 then 'Dezembro'
end ds_mes,
month(anomes) mesint,
cast("Outras Complicações" as numeric(15,2)) VALOR
from
inc_hemodinamica_complicacoes_vasculares

/*Emergências Cardiológicas */
union all

select
1 qt_total_registro,
1 NR_INDICADOR,
'EMERGÊNCIAS CARDIOLÓGICAS' INDICADOR,
'IAMCSST' QUEBRA,
DATE(anomes) DT,
case
when month(anomes) = 1 then 'Janeiro'
when month(anomes) = 2 then 'Fevereiro'
when month(anomes) = 3 then 'Março'
when month(anomes) = 4 then 'Abril'
when month(anomes) = 5 then 'Maio'
when month(anomes) = 6 then 'Junho'
when month(anomes) = 7 then 'Julho'
when month(anomes) = 8 then 'Agosto'
when month(anomes) = 9 then 'Setembro'
when month(anomes) = 10 then 'Outubro'
when month(anomes) = 11 then 'Novembro'
when month(anomes) = 12 then 'Dezembro'
end ds_mes,
month(anomes) mesint,
cast("IAMCSST" as numeric(15,2)) VALOR
from
inc_hemodinamica_emergencia_cardio
union all
select
1 qt_total_registro,
1 NR_INDICADOR,
'EMERGÊNCIAS CARDIOLÓGICAS' INDICADOR,
'IAMSSST' QUEBRA,
DATE(anomes) DT,
case
when month(anomes) = 1 then 'Janeiro'
when month(anomes) = 2 then 'Fevereiro'
when month(anomes) = 3 then 'Março'
when month(anomes) = 4 then 'Abril'
when month(anomes) = 5 then 'Maio'
when month(anomes) = 6 then 'Junho'
when month(anomes) = 7 then 'Julho'
when month(anomes) = 8 then 'Agosto'
when month(anomes) = 9 then 'Setembro'
when month(anomes) = 10 then 'Outubro'
when month(anomes) = 11 then 'Novembro'
when month(anomes) = 12 then 'Dezembro'
end ds_mes,
month(anomes) mesint,
cast("IAMSSST" as numeric(15,2)) VALOR
from
inc_hemodinamica_emergencia_cardio

/*Tempo Porta Balão */
union all

select
1 qt_total_registro,
1 NR_INDICADOR,
'IND VI - TEMPO PORTA BALÃO - IAMCSST' INDICADOR,
'> 90 min' QUEBRA,
DATE(anomes) DT,
case
when month(anomes) = 1 then 'Janeiro'
when month(anomes) = 2 then 'Fevereiro'
when month(anomes) = 3 then 'Março'
when month(anomes) = 4 then 'Abril'
when month(anomes) = 5 then 'Maio'
when month(anomes) = 6 then 'Junho'
when month(anomes) = 7 then 'Julho'
when month(anomes) = 8 then 'Agosto'
when month(anomes) = 9 then 'Setembro'
when month(anomes) = 10 then 'Outubro'
when month(anomes) = 11 then 'Novembro'
when month(anomes) = 12 then 'Dezembro'
end ds_mes,
month(anomes) mesint,
cast("> 90 min" as numeric(15,2)) VALOR
from
inc_hemodinamica_tempo_porta_balao
union all
select
1 qt_total_registro,
1 NR_INDICADOR,
'IND VI - TEMPO PORTA BALÃO - IAMCSST' INDICADOR,
'< 90 min' QUEBRA,
DATE(anomes) DT,
case
when month(anomes) = 1 then 'Janeiro'
when month(anomes) = 2 then 'Fevereiro'
when month(anomes) = 3 then 'Março'
when month(anomes) = 4 then 'Abril'
when month(anomes) = 5 then 'Maio'
when month(anomes) = 6 then 'Junho'
when month(anomes) = 7 then 'Julho'
when month(anomes) = 8 then 'Agosto'
when month(anomes) = 9 then 'Setembro'
when month(anomes) = 10 then 'Outubro'
when month(anomes) = 11 then 'Novembro'
when month(anomes) = 12 then 'Dezembro'
end ds_mes,
month(anomes) mesint,
cast("< 90 min" as numeric(15,2)) VALOR
from
inc_hemodinamica_tempo_porta_balao
union all
select
1 qt_total_registro,
1 NR_INDICADOR,
'IND VI - TEMPO PORTA BALÃO - IAMCSST' INDICADOR,
'Igual a 90 min' QUEBRA,
DATE(anomes) DT,
case
when month(anomes) = 1 then 'Janeiro'
when month(anomes) = 2 then 'Fevereiro'
when month(anomes) = 3 then 'Março'
when month(anomes) = 4 then 'Abril'
when month(anomes) = 5 then 'Maio'
when month(anomes) = 6 then 'Junho'
when month(anomes) = 7 then 'Julho'
when month(anomes) = 8 then 'Agosto'
when month(anomes) = 9 then 'Setembro'
when month(anomes) = 10 then 'Outubro'
when month(anomes) = 11 then 'Novembro'
when month(anomes) = 12 then 'Dezembro'
end ds_mes,
month(anomes) mesint,
cast("Igual a 90 min" as numeric(15,2)) VALOR
from
inc_hemodinamica_tempo_porta_balao
union all
select
1 qt_total_registro,
1 NR_INDICADOR,
'IND VI - TEMPO PORTA BALÃO - IAMCSST' INDICADOR,
'Não Aberto/ Não Preenchido' QUEBRA,
DATE(anomes) DT,
case
when month(anomes) = 1 then 'Janeiro'
when month(anomes) = 2 then 'Fevereiro'
when month(anomes) = 3 then 'Março'
when month(anomes) = 4 then 'Abril'
when month(anomes) = 5 then 'Maio'
when month(anomes) = 6 then 'Junho'
when month(anomes) = 7 then 'Julho'
when month(anomes) = 8 then 'Agosto'
when month(anomes) = 9 then 'Setembro'
when month(anomes) = 10 then 'Outubro'
when month(anomes) = 11 then 'Novembro'
when month(anomes) = 12 then 'Dezembro'
end ds_mes,
month(anomes) mesint,
cast("Não Aberto/ Não Preenchido" as numeric(15,2)) VALOR
from
inc_hemodinamica_tempo_porta_balao
union all
select
1 qt_total_registro,
1 NR_INDICADOR,
'IND VI - TEMPO PORTA BALÃO - IAMCSST' INDICADOR,
'Indeterminado' QUEBRA,
DATE(anomes) DT,
case
when month(anomes) = 1 then 'Janeiro'
when month(anomes) = 2 then 'Fevereiro'
when month(anomes) = 3 then 'Março'
when month(anomes) = 4 then 'Abril'
when month(anomes) = 5 then 'Maio'
when month(anomes) = 6 then 'Junho'
when month(anomes) = 7 then 'Julho'
when month(anomes) = 8 then 'Agosto'
when month(anomes) = 9 then 'Setembro'
when month(anomes) = 10 then 'Outubro'
when month(anomes) = 11 then 'Novembro'
when month(anomes) = 12 then 'Dezembro'
end ds_mes,
month(anomes) mesint,
cast("Indeterminado" as numeric(15,2)) VALOR
from
inc_hemodinamica_tempo_porta_balao
union all
select
1 qt_total_registro,
1 NR_INDICADOR,
'IND VI - TEMPO PORTA BALÃO - IAMCSST' INDICADOR,
'Sem recanalização' QUEBRA,
DATE(anomes) DT,
case
when month(anomes) = 1 then 'Janeiro'
when month(anomes) = 2 then 'Fevereiro'
when month(anomes) = 3 then 'Março'
when month(anomes) = 4 then 'Abril'
when month(anomes) = 5 then 'Maio'
when month(anomes) = 6 then 'Junho'
when month(anomes) = 7 then 'Julho'
when month(anomes) = 8 then 'Agosto'
when month(anomes) = 9 then 'Setembro'
when month(anomes) = 10 then 'Outubro'
when month(anomes) = 11 then 'Novembro'
when month(anomes) = 12 then 'Dezembro'
end ds_mes,
month(anomes) mesint,
cast("Sem recanalização" as numeric(15,2)) VALOR
from
inc_hemodinamica_tempo_porta_balao

/* RAM */
union all

select
1 qt_total_registro,
1 NR_INDICADOR,
'IND VII - N° RAM' INDICADOR,
'Outros' QUEBRA,
DATE(anomes) DT,
case
when month(anomes) = 1 then 'Janeiro'
when month(anomes) = 2 then 'Fevereiro'
when month(anomes) = 3 then 'Março'
when month(anomes) = 4 then 'Abril'
when month(anomes) = 5 then 'Maio'
when month(anomes) = 6 then 'Junho'
when month(anomes) = 7 then 'Julho'
when month(anomes) = 8 then 'Agosto'
when month(anomes) = 9 then 'Setembro'
when month(anomes) = 10 then 'Outubro'
when month(anomes) = 11 then 'Novembro'
when month(anomes) = 12 then 'Dezembro'
end ds_mes,
month(anomes) mesint,
cast("Outros" as numeric(15,2)) VALOR
from
inc_hemodinamica_ram
union all

select
1 qt_total_registro,
1 NR_INDICADOR,
'IND VII - N° RAM' INDICADOR,
'NIC' QUEBRA,
DATE(anomes) DT,
case
when month(anomes) = 1 then 'Janeiro'
when month(anomes) = 2 then 'Fevereiro'
when month(anomes) = 3 then 'Março'
when month(anomes) = 4 then 'Abril'
when month(anomes) = 5 then 'Maio'
when month(anomes) = 6 then 'Junho'
when month(anomes) = 7 then 'Julho'
when month(anomes) = 8 then 'Agosto'
when month(anomes) = 9 then 'Setembro'
when month(anomes) = 10 then 'Outubro'
when month(anomes) = 11 then 'Novembro'
when month(anomes) = 12 then 'Dezembro'
end ds_mes,
month(anomes) mesint,
cast("NIC" as numeric(15,2)) VALOR
from
inc_hemodinamica_ram
union all
select
1 qt_total_registro,
1 NR_INDICADOR,
'IND VII - N° RAM' INDICADOR,
'Reações anafiláticas por contraste' QUEBRA,
DATE(anomes) DT,
case
when month(anomes) = 1 then 'Janeiro'
when month(anomes) = 2 then 'Fevereiro'
when month(anomes) = 3 then 'Março'
when month(anomes) = 4 then 'Abril'
when month(anomes) = 5 then 'Maio'
when month(anomes) = 6 then 'Junho'
when month(anomes) = 7 then 'Julho'
when month(anomes) = 8 then 'Agosto'
when month(anomes) = 9 then 'Setembro'
when month(anomes) = 10 then 'Outubro'
when month(anomes) = 11 then 'Novembro'
when month(anomes) = 12 then 'Dezembro'
end ds_mes,
month(anomes) mesint,
cast("Reações anafiláticas por contraste" as numeric(15,2)) VALOR
from
inc_hemodinamica_ram


