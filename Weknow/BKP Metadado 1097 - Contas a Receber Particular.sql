select
x.NM_PACIENTE,x.TIPO_ATENDIMENTO,x.ORIGEM_ATENDIMENTO, x.CD_ATENDIMENTO, x.CD_CONTA, x.STATUS, x.NOTA_FISCAL, x.DT_EMISSAO,x.DT_EMISSAO_GROUP, x.DT_VENCIMENTO, x.VL_PREVISTO, NVL(SUM(x.VL_RECEBIDO),0)VL_RECEBIDO,NVL(SUM(x.VL_DESCONTO),0)VL_DESCONTO, (x.VL_PREVISTO-NVL(SUM(x.VL_RECEBIDO),0)-NVL(SUM(x.VL_DESCONTO),0))VL_SALDO, /*x.TIPO_RECEBIMENTO,*/ NVL(x.DS_HISTORICO_PADRAO,'Não Informado')DS_HISTORICO_PADRAO, x.DS_OBSERVACAO, x.NM_CONVENIO, x.DS_PLANO_CONVENIO, x.TIPO_CONVENIO
from (
select
a.dt_emissao,
case
    when to_char(a.dt_emissao,'YYYY') < 2022 then to_char(a.dt_emissao,'YYYY')
    else
        case
            when to_char(a.dt_emissao,'MM') = 01 then 'Jan'||'/'||to_char(a.dt_emissao,'YYYY')
            when to_char(a.dt_emissao,'MM') = 02 then 'Fev'||'/'||to_char(a.dt_emissao,'YYYY')
            when to_char(a.dt_emissao,'MM') = 03 then 'Mar'||'/'||to_char(a.dt_emissao,'YYYY')
            when to_char(a.dt_emissao,'MM') = 04 then 'Abr'||'/'||to_char(a.dt_emissao,'YYYY')
            when to_char(a.dt_emissao,'MM') = 05 then 'Mai'||'/'||to_char(a.dt_emissao,'YYYY')
            when to_char(a.dt_emissao,'MM') = 06 then 'Jun'||'/'||to_char(a.dt_emissao,'YYYY')
            when to_char(a.dt_emissao,'MM') = 07 then 'Jul'||'/'||to_char(a.dt_emissao,'YYYY')
            when to_char(a.dt_emissao,'MM') = 08 then 'Ago'||'/'||to_char(a.dt_emissao,'YYYY')
            when to_char(a.dt_emissao,'MM') = 09 then 'Set'||'/'||to_char(a.dt_emissao,'YYYY')
            when to_char(a.dt_emissao,'MM') = 10 then 'Out'||'/'||to_char(a.dt_emissao,'YYYY')
            when to_char(a.dt_emissao,'MM') = 11 then 'Nov'||'/'||to_char(a.dt_emissao,'YYYY')
            when to_char(a.dt_emissao,'MM') = 12 then 'Dez'||'/'||to_char(a.dt_emissao,'YYYY')
            else NULL
        end
end dt_emissao_group,

d.nm_paciente,
decode(c.tp_atendimento,
        'A','Ambulatorial',
        'B','Busca Ativa',
        'E','Externo',
        'H','Home Care',
        'I','Internação',
        'S','SUS - AIH',
        'U','Urgência')tipo_atendimento,
g.ds_ori_ate ORIGEM_ATENDIMENTO,
c.cd_atendimento,
j.cd_reg_fat cd_conta,
decode(b.tp_quitacao,
        'C','Comprometido',
        'G','Quitado com glosa',
        'L','Cancelado',
        'P','Parcialmente quitado',
        'Q','Quitado',
        'R','Protestado',
        'V','Previsto')status,
a.nr_documento nota_fiscal,
b.dt_vencimento,
b.VL_DUPLICATA VL_PREVISTO /*a.vl_previsto*/, --alterado devido a inicio de parcelamento por boletos 19/12/23 Marcelo TI
e.vl_recebido,
e.vl_desconto,
decode(e.tp_recebimento,
        '1','Cheque',
        '10','TEF',
        '2','Cartão',
        '3','Dinheiro',
        '4','Crédito c/c',
        '5','Borderô',
        '6','Boleto',
        '7','DOC',
        '8','Duplicata',
        '9','Nota promissória')tipo_recebimento,
        f.ds_historico_padrao,
        a.ds_observacao,
        h.nm_convenio,
        nvl((select x.ds_con_pla
        from con_pla x
        where x.cd_con_pla = j.cd_con_pla
        and x.cd_convenio = j.cd_convenio),
        (select x.ds_con_pla
        from con_pla x
        where x.cd_con_pla = c.cd_con_pla
        and x.cd_convenio = c.cd_convenio))ds_plano_convenio,
        decode(h.tp_convenio,'A','SIA/SUS = AMBULATORIAL',
                             'C','CONVÊNIO',
                             'H','SIH/SUS - PARTICULAR',
                             'P','PARTICULAR')tipo_convenio
from con_rec a, itcon_rec b, atendime c, paciente d, reccon_rec e, historico_padrao f, ori_ate g, convenio h, reg_fat j
where a.cd_con_rec = b.cd_con_rec (+)
and b.cd_itcon_rec = e.cd_itcon_rec (+)
and a.cd_historico_padrao = f.cd_historico_padrao (+)
and a.cd_reg_fat = j.cd_reg_fat (+)
and a.cd_atendimento = j.cd_atendimento
and c.cd_ori_ate = g.cd_ori_ate (+)
and nvl(j.cd_convenio,c.cd_convenio) = h.cd_convenio
and a.cd_atendimento = c.cd_atendimento
and c.cd_paciente = d.cd_paciente

) x
group by x.NM_PACIENTE, x.TIPO_ATENDIMENTO, x.ORIGEM_ATENDIMENTO, x.CD_ATENDIMENTO, x.CD_CONTA, x.STATUS, x.NOTA_FISCAL, x.DT_EMISSAO, x.DT_EMISSAO_GROUP, x.DT_VENCIMENTO, x.VL_PREVISTO, /*x.TIPO_RECEBIMENTO,*/ x.DS_HISTORICO_PADRAO, x.DS_OBSERVACAO, x.NM_CONVENIO, x.DS_PLANO_CONVENIO, x.TIPO_CONVENIO