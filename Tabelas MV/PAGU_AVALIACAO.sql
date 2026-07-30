-- PAGU_AVALIACAO
SELECT
                      A.VL_RESULTADO
                     FROM
                      PAGU_AVALIACAO A
                     ,PAGU_FORMULA  C
                     WHERE
                     C.CD_FORMULA = P_CD_FORMULA
                     AND A.CD_FORMULA = C.CD_FORMULA
                     AND A.CD_ATENDIMENTO = P_CD_ATENDIMENTO
                     ORDER BY A.cd_avaliacao ASC