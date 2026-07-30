-- dbamv.pagu_avaliacao

SELECT * FROM (select
 t1.*
from
(
Select
  av.cd_atendimento,
  pc.cd_paciente,
  pc.nm_paciente,
  av.cd_avaliacao,
  av.dh_avaliacao,
  av.nm_usuario,
  av.vl_resultado,
  case
    when av.vl_resultado BETWEEN 7 AND 11 then 'MENOR RISCO'
    when av.vl_resultado BETWEEN 12 AND 22 then 'MAIOR RISCO'
  end RISO_QUEDA_CRIANCA,
    avt.cd_pergunta,
    avt.ds_resposta
from
  dbamv.pagu_avaliacao av
  inner join dbamv.pagu_formula f on (av.cd_formula = f.cd_formula)
  inner join dbamv.atendime at on (av.cd_atendimento = at.cd_atendimento)
  inner join dbamv.paciente pc on (at.cd_paciente = pc.cd_paciente)
  INNER JOIN dbamv.pagu_itavaliacao avt ON av.cd_avaliacao = avt.cd_avaliacao
  LEFT JOIN PW_DOCUMENTO_CLINICO pdc ON av.cd_documento_clinico = pdc.cd_documento_clinico
where
  at.cd_multi_empresa = 1
  and f.cd_formula = 18 -- Formula Risco Queda Pediatria
  and av.dh_avaliacao between :ini and to_date(:fin) + 86399/86400
  AND pdc.tp_status IN ('FECHADO', 'ASSINADO')
) t1)
PIVOT (
   max(ds_resposta)
   FOR cd_pergunta IN (
  	558 AS "IDADE", 559 AS "SEXO", 560 AS "DIAGNÓSTICO",
  	561 AS "FATORES AMBIENTAIS", 562 AS "MEDICAÇÃO USADA",
  	563 AS "DEFICIÊNCIA S COGNITIVAS", 564 AS "CIRURGIA / SEDAÇÃO / ANESTESIA"
   )
)