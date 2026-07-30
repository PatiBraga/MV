SELECT
trunc(ped_rx.dt_pedido)dt_pedido,
prestador.nm_prestador,
convenio.nm_convenio,
(SELECT TUSS FROM
 REPASSE_IMAGEM_SW
 WHERE TUSS = (SELECT cd_tuss FROM tuss WHERE tuss.cd_pro_fat = exa_rx.exa_rx_cd_pro_fat AND tuss.cd_convenio IS null)
 AND CONVENIO = CONVENIO.CD_CONVENIO
) repasse_cd_tuss,
--(SELECT cd_tuss FROM
-- tuss
-- WHERE tuss.cd_pro_fat = exa_rx.exa_rx_cd_pro_fat
--) cd_tuss,
null cd_tuss,
pro_fat.ds_pro_fat,
modalidade_exame.ds_modalidade_exame,
paciente.nm_paciente,
itped_rx.nr_faturado,
(SELECT VL_TOTAL FROM
 REPASSE_IMAGEM_SW
 WHERE TUSS = (SELECT cd_tuss FROM tuss WHERE tuss.cd_pro_fat = exa_rx.exa_rx_cd_pro_fat AND tuss.cd_convenio IS null)
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
--AND tuss.cd_convenio IS null

WHERE ped_rx.cd_set_exa IN (4,5,7,8,31,32)

AND prestador.cd_prestador IN (66,3030,106,3692,3532,3381,2801,2792,2683,1816,1811,541,218,131,61,48,3674)

--AND Trunc ( ped_rx.dt_pedido)  BETWEEN To_Date ( '01/04/2024' , 'dd/mm/yyyy')    AND To_Date ( '30/04/2024' , 'dd/mm/yyyy')

UNION ALL

SELECT

trunc(ped_rx.dt_pedido)dt_pedido,
prestador.nm_prestador,
convenio.nm_convenio,
(SELECT DISTINCT(TUSS) FROM
 REPASSE_IMAGEM_SW
 WHERE TUSS = (SELECT cd_tuss FROM tuss WHERE tuss.cd_pro_fat = exa_rx.exa_rx_cd_pro_fat)
 AND CONVENIO = CONVENIO.CD_CONVENIO
) repasse_cd_tuss,
(SELECT cd_tuss FROM
 tuss
 WHERE tuss.cd_pro_fat = exa_rx.exa_rx_cd_pro_fat
) cd_tuss,
pro_fat.ds_pro_fat,
modalidade_exame.ds_modalidade_exame,
paciente.nm_paciente,
itped_rx.nr_faturado,
(SELECT DISTINCT(VL_TOTAL) FROM
 REPASSE_IMAGEM_SW
 WHERE TUSS = (SELECT cd_tuss FROM tuss WHERE tuss.cd_pro_fat = exa_rx.exa_rx_cd_pro_fat)
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
--AND tuss.cd_convenio IS null

WHERE ped_rx.cd_set_exa IN (4,5,7,8,31,32)

AND prestador.cd_prestador NOT IN (66,3030,106,3692,3532,3381,2801,2792,2683,1816,1811,541,218,131,61,48,3674)

--AND Trunc ( ped_rx.dt_pedido)  BETWEEN To_Date ( '01/04/2024' , 'dd/mm/yyyy')    AND To_Date ( '30/04/2024' , 'dd/mm/yyyy')







🔗 Entender JOINs no SQL pode mudar a forma como você analisa dados!

No início da minha jornada com SQL, eu achava que JOIN era algo complexo demais. Tantas siglas: I𝗡𝗡𝗘𝗥 𝗝𝗢𝗜𝗡, 𝗟𝗘𝗙𝗧 𝗝𝗢𝗜𝗡, 𝗥𝗜𝗚𝗛𝗧 𝗝𝗢𝗜𝗡, 𝗙𝗨𝗟𝗟 𝗝𝗢𝗜𝗡... 

Até que entendi que Join é o segredo para cruzar dados e encontrar respostas completas.

ℍ𝕠𝕛𝕖, 𝕖𝕩𝕡𝕝𝕚𝕔𝕠 𝕁𝕆𝕀ℕ𝕤 𝕒𝕤𝕤𝕚𝕞:
📌 𝐈𝐍𝐍𝐄𝐑 𝐉𝐎𝐈𝐍: só traz o que existe nas duas tabelas. É o famoso "quem está nos dois lados".

 📌𝐋𝐄𝐅𝐓 𝐉𝐎𝐈𝐍: traz tudo da esquerda, e o que existir da direita. Muito usado quando a tabela da esquerda é a principal.

 📌 𝐑𝐈𝐆𝐇𝐓 𝐉𝐎𝐈𝐍: o contrário do LEFT. Traz tudo da direita e o que existir da esquerda.

 📌 𝐅𝐔𝐋𝐋 𝐉𝐎𝐈𝐍: une tudo de ambos os lados, mesmo que não haja correspondência. Ideal para análises completas.

💡 𝑫𝒊𝒄𝒂 𝒑𝒂𝒓𝒂 𝒒𝒖𝒆𝒎 𝒆𝒔𝒕á 𝒄𝒐𝒎𝒆ç𝒂r: JOINs são como pontes entre ilhas de informação. Saber construir essas pontes é o que transforma um simples analista num resolvedor de problemas.