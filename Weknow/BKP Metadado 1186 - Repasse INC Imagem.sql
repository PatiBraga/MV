/*
>>> ATUALIZAÇÕES <<<

- 16/05/25 - Marcelo Polli - incluido distinct no código cd_tuss das subqueries, exemplo: distinct(cd_tuss), pois estava retornando mais de um valor gerando erro no dashboard.
- 10/06/25 - Marcelo Polli - incluido campo nr_cpf_cgc, chamado 32134
- 21/07/25 - Marcelo Polli - incluido campo "prestador_faturado" para retornar o medico da fatura, criado o NVL para que o sistema relacione primeiro a fatura hospitalar (reg_fat), caso nao encontre, retorna a fatura ambulatorial (reg_amb).
- 21/07/25 - Marcelo Polli - incluido campo "valor_faturado" para retornar o medico da fatura, criado o NVL para que o sistema relacione primeiro a fatura hospitalar (reg_fat), caso nao encontre, retorna a fatura ambulatorial (reg_amb).
- 22/07/25 - Marcelo Polli - incluido setores e medicos da cardiologia conforme analise feita com Liomar
- 23/07/25 - Marcelo Polli - comentado relacionamento "itreg_fat.cd_pro_fat = exa_rx.EXA_RX_CD_PRO_FAT" devido a casos onde o profat na fatura é diferente do cadastro do exame

*/

SELECT
trunc(ped_rx.dt_pedido)dt_pedido,
atendime.cd_atendimento,
set_exa.nm_set_exa,
case
    when set_exa.cd_set_exa in (4,5,7,8,15,20,30,31,32) Then 'INC Imagem Matriz'
    when set_exa.cd_set_exa in (37,38,39,40,41,42) Then 'INC Imagem Barigui'
end unidade,
prestador.nm_prestador,
prestador.nr_cpf_cgc,
convenio.nm_convenio,
(SELECT TUSS FROM
 REPASSE_IMAGEM_SW
 WHERE TUSS = (SELECT distinct(cd_tuss) FROM tuss WHERE tuss.cd_pro_fat = exa_rx.exa_rx_cd_pro_fat AND tuss.cd_convenio IS null)
 AND CONVENIO = CONVENIO.CD_CONVENIO
) repasse_cd_tuss,
(SELECT distinct(cd_tuss) FROM tuss WHERE tuss.cd_pro_fat = exa_rx.exa_rx_cd_pro_fat AND tuss.cd_convenio IS null) cd_tuss,
--null cd_tuss,
pro_fat.ds_pro_fat,
modalidade_exame.ds_modalidade_exame,
paciente.nm_paciente,
CASE
  WHEN itped_rx.nr_faturado IS NULL THEN 1
  WHEN itped_rx.nr_faturado IN (2, 3, 4,5) THEN 1
  ELSE itped_rx.nr_faturado
END AS nr_faturado,
NVL((select distinct(prestador.nm_prestador)
        from itreg_amb, reg_amb, prestador
        where itreg_amb.cd_reg_amb = reg_amb.cd_reg_amb
        and itreg_amb.cd_mvto = itped_rx.cd_ped_rx
        and itreg_amb.cd_itmvto = itped_rx.cd_itped_rx
        --and itreg_amb.cd_pro_fat = exa_rx.EXA_RX_CD_PRO_FAT
        and itreg_amb.cd_prestador = prestador.cd_prestador
        and itreg_amb.cd_atendimento = atendime.cd_atendimento),
            (select distinct(prestador.nm_prestador)
            from itreg_fat, reg_fat, prestador
            where itreg_fat.cd_reg_fat = reg_fat.cd_reg_fat
            and itreg_fat.cd_mvto = itped_rx.cd_ped_rx
            and itreg_fat.cd_itmvto = itped_rx.cd_itped_rx
            --and itreg_fat.cd_pro_fat = exa_rx.EXA_RX_CD_PRO_FAT
            and itreg_fat.cd_prestador = prestador.cd_prestador
            and reg_fat.cd_atendimento = atendime.cd_atendimento))prestador_faturado,
NVL((select distinct(itreg_amb.vl_total_conta)
        from itreg_amb, reg_amb, prestador
        where itreg_amb.cd_reg_amb = reg_amb.cd_reg_amb
        and itreg_amb.cd_mvto = itped_rx.cd_ped_rx
        and itreg_amb.cd_itmvto = itped_rx.cd_itped_rx
        --and itreg_amb.cd_pro_fat = exa_rx.EXA_RX_CD_PRO_FAT
        and itreg_amb.cd_prestador = prestador.cd_prestador
        and itreg_amb.cd_atendimento = atendime.cd_atendimento),
            (select distinct(itreg_fat.vl_total_conta)
            from itreg_fat, reg_fat, prestador
            where itreg_fat.cd_reg_fat = reg_fat.cd_reg_fat
            and itreg_fat.cd_mvto = itped_rx.cd_ped_rx
            and itreg_fat.cd_itmvto = itped_rx.cd_itped_rx
            --and itreg_fat.cd_pro_fat = exa_rx.EXA_RX_CD_PRO_FAT
            and itreg_fat.cd_prestador = prestador.cd_prestador
            and reg_fat.cd_atendimento = atendime.cd_atendimento))valor_faturado,
(SELECT VL_TOTAL FROM
 REPASSE_IMAGEM_SW
 WHERE TUSS = (SELECT distinct(cd_tuss) FROM tuss WHERE tuss.cd_pro_fat = exa_rx.exa_rx_cd_pro_fat AND tuss.cd_convenio IS null)
 AND CONVENIO = CONVENIO.CD_CONVENIO
) vl_incividual

FROM itped_rx

INNER JOIN exa_rx ON exa_rx.cd_exa_rx = itped_rx.cd_exa_rx
INNER JOIN laudo_rx ON laudo_rx.cd_laudo = itped_rx.cd_laudo
INNER JOIN ped_rx ON ped_rx.cd_ped_rx = itped_rx.cd_ped_rx
INNER JOIN atendime ON atendime.cd_atendimento = ped_rx.cd_atendimento
INNER JOIN paciente ON paciente.cd_paciente = atendime.cd_paciente
INNER JOIN prestador ON prestador.cd_prestador = itped_rx.cd_prestador
INNER JOIN modalidade_exame ON modalidade_exame.cd_modalidade_exame = exa_rx.cd_modalidade_exame
INNER JOIN convenio ON convenio.cd_convenio = ped_rx.cd_convenio
INNER JOIN pro_fat ON pro_fat.cd_pro_fat = exa_rx.exa_rx_cd_pro_fat
INNER JOIN set_exa ON set_exa.cd_set_exa = ped_rx.cd_set_exa
--AND tuss.cd_convenio IS null

WHERE ped_rx.cd_set_exa IN (4,5,7,8,15,20,30,31,32,37,38,39,40,41,42)

AND prestador.cd_prestador IN (66,3030,106,3692,3532,3381,2801,2792,2683,1816,1811,541,218,131,61,48,3674, 43,48,66,185,131,418,541,1816,2801,2834,2841,2947,3020,3319,3381,3651,3674,3871,3881)

--AND Trunc ( ped_rx.dt_pedido)  BETWEEN To_Date ( '01/04/2024' , 'dd/mm/yyyy')    AND To_Date ( '30/04/2024' , 'dd/mm/yyyy')

UNION ALL

SELECT

trunc(ped_rx.dt_pedido)dt_pedido,
atendime.cd_atendimento,
set_exa.nm_set_exa,
case
    when set_exa.cd_set_exa in (4,5,7,8,15,20,30,31,32) Then 'INC Imagem Matriz'
    when set_exa.cd_set_exa in (37,38,39,40,41,42) Then 'INC Imagem Barigui'
end unidade,
prestador.nm_prestador,
prestador.nr_cpf_cgc,
convenio.nm_convenio,
(SELECT DISTINCT(TUSS) FROM
 REPASSE_IMAGEM_SW
 WHERE TUSS = (SELECT distinct(cd_tuss) FROM tuss WHERE tuss.cd_pro_fat = exa_rx.exa_rx_cd_pro_fat)
 AND CONVENIO = CONVENIO.CD_CONVENIO
) repasse_cd_tuss,
(SELECT distinct(cd_tuss) FROM tuss WHERE tuss.cd_pro_fat = exa_rx.exa_rx_cd_pro_fat) cd_tuss,
--null cd_tuss,
pro_fat.ds_pro_fat,
modalidade_exame.ds_modalidade_exame,
paciente.nm_paciente,
CASE
  WHEN itped_rx.nr_faturado IS NULL THEN 1
  WHEN itped_rx.nr_faturado IN (2, 3, 4,5) THEN 1
  ELSE itped_rx.nr_faturado
END AS nr_faturado,
NVL((select distinct(prestador.nm_prestador)
        from itreg_amb, reg_amb, prestador
        where itreg_amb.cd_reg_amb = reg_amb.cd_reg_amb
        and itreg_amb.cd_mvto = itped_rx.cd_ped_rx
        and itreg_amb.cd_itmvto = itped_rx.cd_itped_rx
        --and itreg_amb.cd_pro_fat = exa_rx.EXA_RX_CD_PRO_FAT
        and itreg_amb.cd_prestador = prestador.cd_prestador
        and itreg_amb.cd_atendimento = atendime.cd_atendimento),
            (select distinct(prestador.nm_prestador)
            from itreg_fat, reg_fat, prestador
            where itreg_fat.cd_reg_fat = reg_fat.cd_reg_fat
            and itreg_fat.cd_mvto = itped_rx.cd_ped_rx
            and itreg_fat.cd_itmvto = itped_rx.cd_itped_rx
            --and itreg_fat.cd_pro_fat = exa_rx.EXA_RX_CD_PRO_FAT
            and itreg_fat.cd_prestador = prestador.cd_prestador
            and reg_fat.cd_atendimento = atendime.cd_atendimento))prestador_faturado,
NVL((select distinct(itreg_amb.vl_total_conta)
        from itreg_amb, reg_amb, prestador
        where itreg_amb.cd_reg_amb = reg_amb.cd_reg_amb
        and itreg_amb.cd_mvto = itped_rx.cd_ped_rx
        and itreg_amb.cd_itmvto = itped_rx.cd_itped_rx
        --and itreg_amb.cd_pro_fat = exa_rx.EXA_RX_CD_PRO_FAT
        and itreg_amb.cd_prestador = prestador.cd_prestador
        and itreg_amb.cd_atendimento = atendime.cd_atendimento),
            (select distinct(itreg_fat.vl_total_conta)
            from itreg_fat, reg_fat, prestador
            where itreg_fat.cd_reg_fat = reg_fat.cd_reg_fat
            and itreg_fat.cd_mvto = itped_rx.cd_ped_rx
            and itreg_fat.cd_itmvto = itped_rx.cd_itped_rx
            --and itreg_fat.cd_pro_fat = exa_rx.EXA_RX_CD_PRO_FAT
            and itreg_fat.cd_prestador = prestador.cd_prestador
            and reg_fat.cd_atendimento = atendime.cd_atendimento))valor_faturado,
(SELECT DISTINCT(VL_TOTAL) FROM
 REPASSE_IMAGEM_SW
 WHERE TUSS = (SELECT distinct(cd_tuss) FROM tuss WHERE tuss.cd_pro_fat = exa_rx.exa_rx_cd_pro_fat)
 AND CONVENIO = CONVENIO.CD_CONVENIO
) vl_individual

FROM itped_rx

INNER JOIN exa_rx ON exa_rx.cd_exa_rx = itped_rx.cd_exa_rx
INNER JOIN laudo_rx ON laudo_rx.cd_laudo = itped_rx.cd_laudo
INNER JOIN ped_rx ON ped_rx.cd_ped_rx = itped_rx.cd_ped_rx
INNER JOIN atendime ON atendime.cd_atendimento = ped_rx.cd_atendimento
INNER JOIN paciente ON paciente.cd_paciente = atendime.cd_paciente
INNER JOIN prestador ON prestador.cd_prestador = laudo_rx.cd_prestador
INNER JOIN modalidade_exame ON modalidade_exame.cd_modalidade_exame = exa_rx.cd_modalidade_exame
INNER JOIN convenio ON convenio.cd_convenio = ped_rx.cd_convenio
INNER JOIN pro_fat ON pro_fat.cd_pro_fat = exa_rx.exa_rx_cd_pro_fat
INNER JOIN set_exa ON set_exa.cd_set_exa = ped_rx.cd_set_exa
--AND tuss.cd_convenio IS null
--and trunc(ped_rx.dt_pedido) between '01/05/2025' and '30/05/2025'
WHERE ped_rx.cd_set_exa IN (4,5,7,8,15,20,30,31,32,37,38,39,40,41,42)

AND prestador.cd_prestador NOT IN (66,3030,106,3692,3532,3381,2801,2792,2683,1816,1811,541,218,131,61,48,3674, 43,48,66,185,131,418,541,1816,2801,2834,2841,2947,3020,3319,3381,3651,3674,3871,3881)