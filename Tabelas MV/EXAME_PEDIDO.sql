-- EXAME_PEDIDO

SELECT
    ep.cd_pedido_his cd_pedido,
    ep.CD_ATENDIMENTO_HIS CD_ATENDIMENTO,
    ep.cd_PACIENTE_his Prontuario,
    ep.NM_PACIENTE,
    ep.NM_MEDICO_SOLICITANTE,
    ep.NM_SETOR,
    ep.NM_SETOR_EXECUTANTE,
    ep.dt_pedido,
    conv.cd_convenio Codigo_Convenio,
    conv.NM_CONVENIO Nome_Convenio,
    plano.DS_CON_PLA,
    l.ds_resumo Leito,
    TRUNC(MONTHS_BETWEEN(SYSDATE, pac.DT_NASCIMENTO) / 12) Idade,
    DECODE(pac.TP_SEXO, 'M', 'Masculino', 'F', 'Feminino', 'Outro') Sexo,
    ep.DS_REGIAO_EXAMINADA Senha,
    ep.CD_EXAME_HIS,
    -- Correção da vírgula e concatenação
    exa.DS_EXA_RX || DECODE(itped.DS_REGIAO, NULL, '', ' - ' || itped.DS_REGIAO) AS DS_EXA_RX,
    lab.DS_LABORATORIO,
    ep.DT_PREVISAO_ENTREGA,
    ep.DS_STATUS,
    ep.CD_ITEM_PEDIDO_HIS
FROM
    IDCE.RS_VW_EXAME_PEDIDO ep
    JOIN atendime a ON a.CD_ATENDIMENTO = ep.CD_ATENDIMENTO_HIS
    JOIN paciente pac ON pac.CD_PACIENTE = a.CD_PACIENTE
    LEFT JOIN leito l ON l.cd_leito = a.cd_leito
    JOIN ped_rx ped ON ped.CD_PED_RX = ep.cd_pedido_his
    JOIN ITPED_RX itped ON itped.CD_ITPED_RX = ep.cd_item_pedido_his
    JOIN exa_rx exa ON exa.cd_exa_rx = itped.cd_exa_rx -- Join adicionado para buscar a descrição do exame
    LEFT JOIN laboratorio lab ON lab.cd_laboratorio = itped.CD_LABORATORIO
    JOIN convenio conv ON conv.CD_CONVENIO = ped.CD_CONVENIO
    LEFT JOIN con_pla plano ON plano.CD_CONVENIO = conv.CD_CONVENIO
                            AND plano.CD_CON_PLA = ped.CD_CON_PLA
WHERE
    ep.CD_ATENDIMENTO_HIS = {cdAtendimento}
ORDER BY
    ep.NM_SETOR_EXECUTANTE,
    DS_EXA_RX