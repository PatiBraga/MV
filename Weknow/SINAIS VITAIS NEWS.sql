select
-- SOMA TODOS OS PONTOS DOS SINAIS VITAIS E GLASGOW PARA GERAR O NEWS
(SUM(PT_TEMP_NEWS) + SUM(PT_SATU_NEWS) + SUM(PT_PULSO_NEWS) + SUM(PT_RESP_NEWS) + SUM(PT_PAS_NEWS) + SUM(PT_GLASGOW_NEWS))PT_NEWS,
case
    when (SUM(PT_TEMP_NEWS) + SUM(PT_SATU_NEWS) + SUM(PT_PULSO_NEWS) + SUM(PT_RESP_NEWS) + SUM(PT_PAS_NEWS) + SUM(PT_GLASGOW_NEWS)) = 0
        then '6/6 horas'
    when (SUM(PT_TEMP_NEWS) + SUM(PT_SATU_NEWS) + SUM(PT_PULSO_NEWS) + SUM(PT_RESP_NEWS) + SUM(PT_PAS_NEWS) + SUM(PT_GLASGOW_NEWS)) between 1 and 2
        then 'Máximo 4 - 6 horas'        
    when (SUM(PT_TEMP_NEWS) + SUM(PT_SATU_NEWS) + SUM(PT_PULSO_NEWS) + SUM(PT_RESP_NEWS) + SUM(PT_PAS_NEWS) + SUM(PT_GLASGOW_NEWS)) between 3 and 4
        then 'Máximo 1 hora'
    when (SUM(PT_TEMP_NEWS) + SUM(PT_SATU_NEWS) + SUM(PT_PULSO_NEWS) + SUM(PT_RESP_NEWS) + SUM(PT_PAS_NEWS) + SUM(PT_GLASGOW_NEWS)) between 5 and 6
        then 'Máximo 1 hora'        
    when (SUM(PT_TEMP_NEWS) + SUM(PT_SATU_NEWS) + SUM(PT_PULSO_NEWS) + SUM(PT_RESP_NEWS) + SUM(PT_PAS_NEWS) + SUM(PT_GLASGOW_NEWS)) >= 7
        then 'Monitoramento contínuo'
end intervalo, 
case
    when (SUM(PT_TEMP_NEWS) + SUM(PT_SATU_NEWS) + SUM(PT_PULSO_NEWS) + SUM(PT_RESP_NEWS) + SUM(PT_PAS_NEWS) + SUM(PT_GLASGOW_NEWS)) = 0
        then 'Continuar rotina de monitoramento NEWS.'
    when (SUM(PT_TEMP_NEWS) + SUM(PT_SATU_NEWS) + SUM(PT_PULSO_NEWS) + SUM(PT_RESP_NEWS) + SUM(PT_PAS_NEWS) + SUM(PT_GLASGOW_NEWS)) between 1 and 2
        then 'Informar o enfermeiro. Enfermeiro: Deve visitar o paciente, avaliar e definir necessidade de avaliação médica.'        
    when (SUM(PT_TEMP_NEWS) + SUM(PT_SATU_NEWS) + SUM(PT_PULSO_NEWS) + SUM(PT_RESP_NEWS) + SUM(PT_PAS_NEWS) + SUM(PT_GLASGOW_NEWS)) between 3 and 4
        then 'Informar o enfermeiro. Enfermeiro: Deve informar o time médico responsável pelo paciente e avaliar o paciente. É necessária a revisão e decisão para aumento de cuidados necessários.'
    when (SUM(PT_TEMP_NEWS) + SUM(PT_SATU_NEWS) + SUM(PT_PULSO_NEWS) + SUM(PT_RESP_NEWS) + SUM(PT_PAS_NEWS) + SUM(PT_GLASGOW_NEWS)) between 5 and 6
        then 'Informar o enfermeiro. Enfermeiro: Deve solicitar imediata presença de médico para urgência e avaliar o paciente. É necessário providenciar cuidados clinicos com monitoramento constante.'        
    when (SUM(PT_TEMP_NEWS) + SUM(PT_SATU_NEWS) + SUM(PT_PULSO_NEWS) + SUM(PT_RESP_NEWS) + SUM(PT_PAS_NEWS) + SUM(PT_GLASGOW_NEWS)) >= 7
        then 'Informar o enfermeiro. Enfermeiro: Deve solicitar imediata presença de médico para emergência, avaliar o paciente e levar o carrinho de emergência ao quarto. Considerar a transferência de cuidados em ambiente intensivo (UTI ou UCC) e cuidados clínicos com monitoramento contínuo.'
end resposta_clinica
from (
/*
- PEGA ÚLTIMO REGISTRO DE SINAIS VITAIS NO PEP
- ANALISA O RESULTADO DOS SINAIS VITAIS E CONVERTE PARA PONTUACAO NEWS CONFORME REFERENCIA
*/
select c.cd_sinal_vital, c.ds_sinal_vital, b.valor, d.ds_unidade_afericao,
case
    when c.cd_sinal_vital = 1 and b.valor between '37,1' and '38' then 0
    when c.cd_sinal_vital = 1 and b.valor between '35,1' and '36' then 1
    when c.cd_sinal_vital = 1 and b.valor between '38,1' and '39' then 1
    when c.cd_sinal_vital = 1 and b.valor >= '39,1' then 2
    when c.cd_sinal_vital = 1 and b.valor <= '35' then 3
end pt_temp_news,
case
    when c.cd_sinal_vital = 43 and b.valor >= 96 then 0
    when c.cd_sinal_vital = 43 and b.valor between 94 and 95 then 1
    when c.cd_sinal_vital = 43 and b.valor between 92 and 93 then 2
    when c.cd_sinal_vital = 43 and b.valor <= 91 then 3
end pt_satu_news,
case
    when c.cd_sinal_vital = 2 and b.valor between 51 and 90 then 0
    when c.cd_sinal_vital = 2 and b.valor between 41 and 50 then 1
    when c.cd_sinal_vital = 2 and b.valor between 91 and 110 then 1
    when c.cd_sinal_vital = 2 and b.valor between 111 and 130 then 2
    when c.cd_sinal_vital = 2 and b.valor >= 131 then 3
    when c.cd_sinal_vital = 2 and b.valor <= 40 then 3
end pt_pulso_news,
case
    when c.cd_sinal_vital = 3 and b.valor between 12 and 20 then 0
    when c.cd_sinal_vital = 3 and b.valor between 9 and 11 then 1
    when c.cd_sinal_vital = 3 and b.valor between 21 and 24 then 2
    when c.cd_sinal_vital = 3 and b.valor <= 8 then 3
    when c.cd_sinal_vital = 3 and b.valor >= 25 then 3
end pt_resp_news,
case
    when c.cd_sinal_vital = 4 and b.valor between 111 and 160 then 0
    when c.cd_sinal_vital = 4 and b.valor between 161 and 180 then 1
    when c.cd_sinal_vital = 4 and b.valor between 101 and 110 then 1
    when c.cd_sinal_vital = 4 and b.valor between 181 and 200 then 2
    when c.cd_sinal_vital = 4 and b.valor between 91 and 100 then 2
    when c.cd_sinal_vital = 4 and b.valor between 201 and 219 then 3
    when c.cd_sinal_vital = 4 and b.valor >= 220 then 3
    when c.cd_sinal_vital = 4 and b.valor <= 90 then 3
end pt_pas_news,
null pt_glasgow_news
from coleta_sinal_vital a, itcoleta_sinal_vital b, sinal_vital c, pw_unidade_afericao d, pw_documento_clinico e
where a.cd_coleta_sinal_vital = b.cd_coleta_sinal_vital
and a.cd_documento_clinico = e.cd_documento_clinico
and b.cd_sinal_vital = c.cd_sinal_vital
and b.cd_unidade_afericao = d.cd_unidade_afericao
and e.tp_status <> 'CANCELADO'
and a.cd_atendimento = 1118357
and c.cd_sinal_vital in (1,2,3,4,43)
and a.data_coleta = (select max(x.data_coleta) from coleta_sinal_vital x, pw_documento_clinico y where  x.cd_documento_clinico = y.cd_documento_clinico and y.tp_status <> 'CANCELADO' and x.cd_atendimento = a.cd_atendimento)

UNION ALL
/*
- PEGA ÚLTIMO REGISTRO DE GLASGOW NO PEP
- ANALISA O RESULTADO E CONVERTE PARA PONTUACAO NEWS CONFORME REFERENCIA
*/
select 
a.cd_formula cd_sinal_vital, 'GLASGOW' ds_sinal_vital, a.vl_resultado valor, 'PTS' ds_unidade_afericao,
null pt_temp_news,
null pt_satu_news,
null pt_pulso_news,
null pt_resp_news,
null pt_pas_news,
case when a.vl_resultado >= 14 then 0 else 3 end pt_glasgow_news
from pagu_avaliacao a, pw_documento_clinico b
where a.cd_documento_clinico = b.cd_documento_clinico
and b.tp_status <> 'CANCELADO'
and a.cd_atendimento = 1118357
and a.cd_formula = 17
and a.cd_avaliacao = (select max(x.cd_avaliacao) from pagu_avaliacao x, pw_documento_clinico y where x.cd_documento_clinico = y.cd_documento_clinico and y.tp_status <> 'CANCELADO' and x.cd_atendimento = a.cd_atendimento and x.cd_formula = a.cd_formula)
);