-- lOCALIZAR SINTOMAS DA CLASSIFICAÇÃO DE RISCO

SELECT *
  FROM (
SELECT t.cd_sintoma_avaliacao,
       s.ds_sintoma,
       pp.cd_pergunta,
       pp.ds_pergunta,
       COUNT(1) qtde
  FROM dbamv.triagem_atendimento      t,
       dbamv.sacr_classificacao_risco c,
       dbamv.sacr_resposta_paciente   r,
       dbamv.sacr_pergunta_avaliacao  p,
       dbamv.pagu_pergunta            pp,
       dbamv.sacr_sintoma_avaliacao   s
 WHERE t.cd_triagem_atendimento       = c.cd_triagem_atendimento
   AND c.cd_classificacao_risco       = r.cd_classificacao_risco
   AND r.cd_pergunta_avaliacao        = p.cd_pergunta_avaliacao
   AND p.cd_pergunta_triagem          = pp.cd_pergunta
   AND t.cd_sintoma_avaliacao         = s.cd_sintoma_avaliacao
   AND t.dh_pre_atendimento >= TO_DATE('01/03/2026','DD/MM/YYYY')
   AND t.dh_pre_atendimento <  TO_DATE('18/03/2026','DD/MM/YYYY')
 GROUP BY t.cd_sintoma_avaliacao,
          s.ds_sintoma,
          pp.cd_pergunta,
          pp.ds_pergunta
 ORDER BY qtde DESC )