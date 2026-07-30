SELECT
  T.*,
  "DS_EVENTO"||' ('||"CD_EVENTO"||')' CDDS_EVENTO,
  COALESCE(GRUPO_CARGO."DS_GRUPO_CC_CARGO",COALESCE(GRUPO."DS_GRUPO_CC",'NÃO INFORMADO')) "DS_GRUPO_CENTRO_CUSTO",

  CASE
    WHEN CAST(:INDICADOR AS VARCHAR(100)) = 'Todos os Eventos' then COALESCE("VL_EVENTO",0)
    WHEN CAST(:INDICADOR AS VARCHAR(100)) = 'Salário Base' then COALESCE("VL_SALARIO_BASE",0)
    WHEN CAST(:INDICADOR AS VARCHAR(100)) = 'Salário Líquido' then COALESCE("VL_PROVENTO",0) + COALESCE("VL_VANTAGEM",0) - COALESCE("VL_DESCONTO",0)
    WHEN CAST(:INDICADOR AS VARCHAR(100)) = 'ATS' then COALESCE("VL_ATS",0)
    WHEN CAST(:INDICADOR AS VARCHAR(100)) = 'Insalubridade' then COALESCE("VL_INSALUBRIDADE" ,0)
    WHEN CAST(:INDICADOR AS VARCHAR(100)) = 'Provento' then COALESCE("VL_PROVENTO" ,0)
    WHEN CAST(:INDICADOR AS VARCHAR(100)) = 'Vantagem' then COALESCE("VL_VANTAGEM"  ,0)
    WHEN CAST(:INDICADOR AS VARCHAR(100)) = 'Desconto' then COALESCE("VL_DESCONTO"  ,0)
    WHEN CAST(:INDICADOR AS VARCHAR(100)) = 'Outros' then COALESCE("VL_OUTROS",0)
    WHEN CAST(:INDICADOR AS VARCHAR(100)) = 'Outros Proventos' then COALESCE("VL_OUTROS_PROVENTO",0)
    WHEN CAST(:INDICADOR AS VARCHAR(100)) = 'Outros Descontos' then COALESCE("VL_OUTROS_DESCONTO" ,0)
    WHEN CAST(:INDICADOR AS VARCHAR(100)) = 'Gratificações' then COALESCE("VL_GRATIFICACAO" ,0)
    WHEN CAST(:INDICADOR AS VARCHAR(100)) = 'Vale Alimentação' then COALESCE("VL_VALE_ALIMENTACAO" ,0)
    WHEN CAST(:INDICADOR AS VARCHAR(100)) = 'Vale Transporte' then COALESCE( "VL_VALE_TRANSPORTE" ,0)
    WHEN CAST(:INDICADOR AS VARCHAR(100)) = 'Plano Saúde' then COALESCE("VL_PLANO_SAUDE",0)
    WHEN CAST(:INDICADOR AS VARCHAR(100)) = 'Férias' then COALESCE("VL_FERIAS"   ,0)
    WHEN CAST(:INDICADOR AS VARCHAR(100)) = '13º Salário' then COALESCE("VL_13SALARIO" ,0)
    WHEN CAST(:INDICADOR AS VARCHAR(100)) = 'Horas Extras' then COALESCE("VL_HORA_EXTRA" ,0)
    WHEN CAST(:INDICADOR AS VARCHAR(100)) = 'INSS Funcionário' then COALESCE( "VL_INSS" ,0)
    WHEN CAST(:INDICADOR AS VARCHAR(100)) = 'FGTS' then COALESCE("VL_FGTS"    ,0)
    WHEN CAST(:INDICADOR AS VARCHAR(100)) = 'IRRF Funcionário' then COALESCE("VL_IRRF"  ,0)
    WHEN CAST(:INDICADOR AS VARCHAR(100)) = 'INSS Empresa' and "TIPO_CONTRATACAO" <>  'ESTAGIÁRIO' then COALESCE(("VL_PROVENTO" + "VL_VANTAGEM") * 0.2,0)
    WHEN CAST(:INDICADOR AS VARCHAR(100)) = 'Custo da Folha' then
        case
           when "TIPO_CONTRATACAO" in ('EMPREGADO','APRENDIZ') THEN COALESCE("VL_PROVENTO",0)
                                                                             + COALESCE("VL_VANTAGEM",0)
                                                                             + COALESCE("VL_VALE_TRANSPORTE",0)
                                                                             + COALESCE("VL_VALE_ALIMENTACAO",0)
                                                                             + COALESCE( "VL_PLANO_SAUDE",0)
                                                                             + COALESCE("VL_FGTS",0)
                                                                             + ((COALESCE("VL_PROVENTO",0) + COALESCE("VL_VANTAGEM",0)) * 0.2)  --Proventos, vale transporte, vale alimentação, plano de saude,  fgts e INSS empresa
                                                                             -- tratamento abaixo inserido em 08-04-2024 solicitado por Sthefanie Luiza e Marcia Guidolin necessidade de ajuste valor custo folha
                                                                             + ((COALESCE("VL_PROVENTO",0) - ((case when "CD_EVENTO" = 3  then "VL_EVENTO" else 0 end) -- evento falta
																			                                                                        + (case when "CD_EVENTO" = 4 then "VL_EVENTO" else 0 end) -- evento  DSR
																			                                                                        + (case when "CD_EVENTO" = 3014 then "VL_EVENTO" else 0 end)) -- evento  Atraso
																			        				                                                     		)* 0.058) --  impostos terceiros-- + impostos terceiros
                                                                             + ((COALESCE("VL_PROVENTO",0) - ((case when "CD_EVENTO" = 3  then "VL_EVENTO" else 0 end)
																			                                                                        + (case when "CD_EVENTO" = 4 then "VL_EVENTO" else 0 end)
																			                                                                        + (case when "CD_EVENTO" = 3014 then "VL_EVENTO" else 0 end))
																			        				                                                     		)* 0.03)-- + RAT/FAP

           when "TIPO_CONTRATACAO" =  'ESTAGIÁRIO'             THEN COALESCE("VL_PROVENTO",0)
                                                                             + COALESCE("VL_VANTAGEM",0)
                                                                             + COALESCE("VL_VALE_TRANSPORTE",0)
                                                                             + COALESCE("VL_VALE_ALIMENTACAO",0)   --Proventos, vale transporte, vale alimentação

           when "TIPO_CONTRATACAO" IN ('TERCEIRO','DIRETOR')   THEN COALESCE("VL_PROVENTO",0)
                                                                  + COALESCE("VL_VANTAGEM",0)
                                                                  + ((COALESCE("VL_PROVENTO",0) + COALESCE("VL_VANTAGEM",0)) * 0.2)  --Proventos e INSS empresa
                                                                  + ((COALESCE("VL_PROVENTO",0) - ((case when "CD_EVENTO" = 3  then "VL_EVENTO" end)
																			                                                                        + (case when "CD_EVENTO" = 4 then "VL_EVENTO" else 0 end)
																			                                                                        + (case when "CD_EVENTO" = 3014 then "VL_EVENTO" else 0 end))
																			        				                                                     		)* 0.058) --  impostos terceiros-- + impostos terceiros
                                                                  + ((COALESCE("VL_PROVENTO",0) - ((case when "CD_EVENTO" = 3  then "VL_EVENTO" end)
																			                                                                        + (case when "CD_EVENTO" = 4 then "VL_EVENTO" else 0 end)
																			                                                                        + (case when "CD_EVENTO" = 3014 then "VL_EVENTO" else 0 end))
																			        				                                                     		)* 0.03)-- + RAT/FAP

        ELSE 0 END
    ELSE 0
  END VL_INDICADOR,
  COALESCE("VL_PROVENTO",0) + COALESCE("VL_VANTAGEM",0) - COALESCE("VL_DESCONTO",0) VL_SALARIO_LIQUIDO ,
  COALESCE("VL_PROVENTO",0) + COALESCE("VL_VANTAGEM",0)   "VL_TOTAL_PROVENTOS",
  case when "TIPO_CONTRATACAO" <>  'ESTAGIÁRIO' then (COALESCE("VL_PROVENTO",0) + COALESCE("VL_VANTAGEM",0)) * 0.2
        end "VL_INSS_EMPRESA" ,
  case
   when "TIPO_CONTRATACAO" in ('EMPREGADO','APRENDIZ') THEN COALESCE("VL_PROVENTO",0)
                                                                     + COALESCE("VL_VANTAGEM",0)
                                                                     + COALESCE("VL_VALE_TRANSPORTE",0)
                                                                     + COALESCE("VL_VALE_ALIMENTACAO",0)
                                                                     + COALESCE( "VL_PLANO_SAUDE",0)
                                                                     + COALESCE("VL_FGTS",0)
                                                                     + ((COALESCE("VL_PROVENTO",0) + COALESCE("VL_VANTAGEM",0)) * 0.2)  --Proventos, vale transporte, vale alimentação, plano de saude,  fgts e INSS empresa
                                                                     + ((COALESCE("VL_PROVENTO",0) - ((case when "CD_EVENTO" = 3  then "VL_EVENTO" end)
																			                                                                        + (case when "CD_EVENTO" = 4 then "VL_EVENTO" end)
																			                                                                        + (case when "CD_EVENTO" = 3014 then "VL_EVENTO" end))
																			        				                                                     		)* 0.058) --  impostos terceiros-- + impostos terceiros
                                                                     + ((COALESCE("VL_PROVENTO",0) - ((case when "CD_EVENTO" = 3  then "VL_EVENTO" end)
																			                                                                        + (case when "CD_EVENTO" = 4 then "VL_EVENTO" end)
																			                                                                        + (case when "CD_EVENTO" = 3014 then "VL_EVENTO" end))
																			        				                                                     		)* 0.03)-- + RAT/FAP

   when "TIPO_CONTRATACAO" =  'ESTAGIÁRIO'             THEN COALESCE("VL_PROVENTO",0)
                                                                     + COALESCE("VL_VANTAGEM",0)
                                                                     + COALESCE("VL_VALE_TRANSPORTE",0)
                                                                     + COALESCE("VL_VALE_ALIMENTACAO",0)   --Proventos, vale transporte, vale alimentação

   when "TIPO_CONTRATACAO" IN ('TERCEIRO','DIRETOR')   THEN COALESCE("VL_PROVENTO",0)
                                                          + COALESCE("VL_VANTAGEM",0)
                                                          + ((COALESCE("VL_PROVENTO",0) + COALESCE("VL_VANTAGEM",0)) * 0.2)  --Proventos e INSS empresa
                                                          + ((COALESCE("VL_PROVENTO",0) - ((case when "CD_EVENTO" = 3  then "VL_EVENTO" end)
																			                                                                        + (case when "CD_EVENTO" = 4 then "VL_EVENTO" end)
																			                                                                        + (case when "CD_EVENTO" = 3014 then "VL_EVENTO" end))
																			        				                                                     		)* 0.058) --  impostos terceiros-- + impostos terceiros
                                                          + ((COALESCE("VL_PROVENTO",0) - ((case when "CD_EVENTO" = 3  then "VL_EVENTO" end)
																			                                                                        + (case when "CD_EVENTO" = 4 then "VL_EVENTO" end)
																			                                                                        + (case when "CD_EVENTO" = 3014 then "VL_EVENTO" end))
																			        				                                                     		)* 0.03)-- + RAT/FAP
    ELSE 0
  END "VL_CUSTO_FOLHA" ,

  ((COALESCE("VL_PROVENTO",0) - ((case when "CD_EVENTO" = 3  then "VL_EVENTO" ELSE 0 end)
														  + (case when "CD_EVENTO" = 4 then "VL_EVENTO"  ELSE 0 end)
														  + (case when "CD_EVENTO" = 3014 then "VL_EVENTO" ELSE 0 end))
														   )* 0.058) VL_IMP_TERCEIRO,
 ((COALESCE("VL_PROVENTO",0) - ((case when "CD_EVENTO" = 3  then "VL_EVENTO" ELSE 0  end)
														  + (case when "CD_EVENTO" = 4 then "VL_EVENTO" ELSE 0 end)
														  + (case when "CD_EVENTO" = 3014 then "VL_EVENTO" ELSE 0 end))
														)* 0.03) VL_RAT_FAP

FROM
(
select
  1 "ORDEM",
  'SALÁRIO BASE' AS "TP_CONSULTA",
  "DH_CARGA",
  "DT_REFERENCIA",
  "CD_CENTRO_CUSTO",
  "DS_CENTRO_CUSTO",
  "CD_COLABORADOR",
  "DS_COLABORADOR",
  "TIPO_CONTRATACAO",
  "CD_CARGO",
  "DS_CARGO",
  "CDDS_CENTRO_CUSTO",
  "CDDS_COLABORADOR",
  "CDDS_CARGO",
  "DT_ADMISSAO",
  "SN_AFASTADO",
  COALESCE("VL_SALARIO_BASE",0) "VL_SALARIO_BASE",
  CAST(0 AS FLOAT) "CD_EVENTO",
  CAST('Salário Base' AS VARCHAR(1000)) "DS_EVENTO",
  CAST('SALÁRIO BASE' AS VARCHAR(1000)) AS "TIPO_EVENTO",
  0 "REF_EVENTO",
  MAX(COALESCE("VL_SALARIO_BASE",0)) "VL_EVENTO",
  CAST(0 AS FLOAT) AS "VL_ATS",
  CAST(0 AS FLOAT) AS "VL_INSALUBRIDADE",
  CAST(0 AS FLOAT) AS "VL_GRATIFICACAO",
  CAST(0 AS FLOAT) AS "VL_VALE_ALIMENTACAO",
  CAST(0 AS FLOAT) AS "VL_VALE_TRANSPORTE",
  CAST(0 AS FLOAT) AS "VL_PLANO_SAUDE",
  CAST(0 AS FLOAT) AS "VL_PROVENTO",
  CAST(0 AS FLOAT) AS "VL_VANTAGEM",
  CAST(0 AS FLOAT) AS "VL_DESCONTO",
  CAST(0 AS FLOAT) AS "VL_OUTROS",
  CAST(0 AS FLOAT) AS "VL_OUTROS_PROVENTO",
  CAST(0 AS FLOAT) AS "VL_OUTROS_DESCONTO",
  CAST(0 AS FLOAT) AS "VL_FERIAS",
  CAST(0 AS FLOAT) AS "VL_13SALARIO",
  CAST(0 AS FLOAT) AS "VL_HORA_EXTRA",
  CAST(0 AS FLOAT) AS "VL_INSS",
  CAST(0 AS FLOAT) AS "VL_FGTS",
  CAST(0 AS FLOAT) AS "VL_IRRF"
FROM
  %EVENTOS%
WHERE
  CAST(:INDICADOR AS VARCHAR(100)) IN ('Todos os Eventos','Salário Base')
GROUP BY
  "DH_CARGA",
  "DT_REFERENCIA",
  "CD_CENTRO_CUSTO",
  "DS_CENTRO_CUSTO",
  "CD_COLABORADOR",
  "DS_COLABORADOR",
  "TIPO_CONTRATACAO",
  "CD_CARGO",
  "DS_CARGO",
  "CDDS_CENTRO_CUSTO",
  "CDDS_COLABORADOR",
  "CDDS_CARGO",
  "DT_ADMISSAO",
  "SN_AFASTADO" ,
  COALESCE("VL_SALARIO_BASE",0)


UNION ALL

select
  CASE
    WHEN "TIPO_EVENTO" = 'PROVENTO'             THEN 2.1
    WHEN "TIPO_EVENTO" = 'VANTAGEM'             THEN 2.2
    WHEN "TIPO_EVENTO" = 'DESCONTO'             THEN 2.3
    WHEN "TIPO_EVENTO" = 'OUTROS ENV. PROVENTO' THEN 2.4
    WHEN "TIPO_EVENTO" = 'OUTROS ENV. DESCONTO' THEN 2.5
    WHEN "TIPO_EVENTO" = 'OUTROS' THEN 2.6
  END  "ORDEM",
  'EVENTOS' AS "TP_CONSULTA",
  "DH_CARGA",
  "DT_REFERENCIA",
  "CD_CENTRO_CUSTO",
  "DS_CENTRO_CUSTO",
  "CD_COLABORADOR",
  "DS_COLABORADOR",
  "TIPO_CONTRATACAO",
  "CD_CARGO",
  "DS_CARGO",
  "CDDS_CENTRO_CUSTO",
  "CDDS_COLABORADOR",
  "CDDS_CARGO",
  "DT_ADMISSAO",
  "SN_AFASTADO",
  CAST(0 AS FLOAT) "VL_SALARIO_BASE",
  "CD_EVENTO" "CD_EVENTO",
  CAST("DS_EVENTO" AS VARCHAR(1000)) "DS_EVENTO",
  "TIPO_EVENTO",
  "REF_EVENTO",
  COALESCE("VL_EVENTO",0) "VL_EVENTO",
  CASE
    WHEN "CD_EVENTO" = 1967 THEN COALESCE("VL_EVENTO",0)
    ELSE 0
  END as "VL_ATS",

  CASE
    WHEN "CD_EVENTO" = 1951 THEN COALESCE("VL_EVENTO",0)
    ELSE 0
  END as "VL_INSALUBRIDADE",

  CASE
    WHEN "CD_EVENTO" IN (3028,3080,3081,1965,3026) THEN COALESCE("VL_EVENTO",0)
    ELSE 0
  END as "VL_GRATIFICACAO",

  CAST(0 AS FLOAT) AS "VL_VALE_ALIMENTACAO",

  CASE
    WHEN "CD_EVENTO" = 1651  THEN COALESCE("VL_EVENTO",0)
    ELSE 0
  END AS "VL_VALE_TRANSPORTE",

  CASE
    WHEN "CD_EVENTO" = 3143  THEN COALESCE("VL_EVENTO",0)
    ELSE 0
  END AS "VL_PLANO_SAUDE",

  CASE
    WHEN "TIPO_EVENTO" = 'PROVENTO' THEN COALESCE("VL_EVENTO",0)
    ELSE 0
  END  AS "VL_PROVENTO",

  CASE
    WHEN "TIPO_EVENTO" = 'VANTAGEM' THEN COALESCE("VL_EVENTO",0)
    ELSE 0
  END  AS "VL_VANTAGEM",

  CASE
    WHEN "TIPO_EVENTO" = 'DESCONTO' THEN COALESCE("VL_EVENTO",0)
    ELSE 0
  END  AS "VL_DESCONTO",

  CASE
    WHEN "TIPO_EVENTO" = 'OUTROS' THEN COALESCE("VL_EVENTO",0)
    ELSE 0
  END  AS "VL_OUTROS",

  CASE
    WHEN "TIPO_EVENTO" = 'OUTROS ENV. PROVENTO' THEN COALESCE("VL_EVENTO",0)
    ELSE 0
  END  AS "VL_OUTROS_PROVENTO",

  CASE
    WHEN "TIPO_EVENTO" = 'OUTROS ENV. DESCONTO' THEN COALESCE("VL_EVENTO",0)
    ELSE 0
  END AS "VL_OUTROS_DESCONTO",

  CASE
    WHEN "CD_EVENTO" IN (5,551,552,553,554,557,558,561,562,563,564,565,567,600,601,602,603,604,606,609,614,615,615,616,616,2002,2014) THEN COALESCE("VL_EVENTO",0)
    ELSE 0
  END AS "VL_FERIAS",

  CASE
    WHEN "CD_EVENTO" IN  (750,800,801,802,803,805,806,816,820,2003,2005,2201,2505) THEN COALESCE("VL_EVENTO",0)
    ELSE 0
  END AS "VL_13SALARIO",

  CASE
    WHEN "CD_EVENTO" IN (3083,3084,3085,3086,259,257,259,257,265,266,3174,267) THEN COALESCE("VL_EVENTO",0)
    ELSE 0
  END AS "VL_HORA_EXTRA",
  CAST(0 AS FLOAT) AS "VL_INSS",
  CAST(0 AS FLOAT) AS "VL_FGTS",
  CAST(0 AS FLOAT) AS "VL_IRRF"
from
  %EVENTOS%
WHERE
  CAST(:INDICADOR AS VARCHAR(100)) IN ('Todos os Eventos','Salário Líquido','ATS','Insalubridade','Provento','Desconto','Gratificações','Vale Alimentação'
                                       ,'Vale Transporte','Plano Saúde','Férias','13º Salário','Horas Extras','INSS Empresa','Custo da Folha'
                                       ,'Outros','Outros Proventos','Outros Descontos')


UNION ALL

SELECT
  3 "ORDEM",
  'VALE ALIMENTAÇÃO' AS "TP_CONSULTA",
  NULL AS "DH_CARGA",
  VALE_EVENTOS."DT_REFERENCIA",
  VALE_EVENTOS."CD_CENTRO_CUSTO",
  VALE_EVENTOS."DS_CENTRO_CUSTO",
  VALE_EVENTOS."CD_COLABORADOR",
  VALE_EVENTOS."DS_COLABORADOR",
  VALE_EVENTOS."TIPO_CONTRATACAO",
  VALE_EVENTOS."CD_CARGO",
  VALE_EVENTOS."DS_CARGO",
  VALE_EVENTOS."CD_CENTRO_CUSTO"||'-'||VALE_EVENTOS."DS_CENTRO_CUSTO" AS "CDDS_CENTRO_CUSTO",
  VALE_EVENTOS."CD_COLABORADOR"||'-'||VALE_EVENTOS."DS_COLABORADOR" AS "CDDS_COLABORADOR",
  VALE_EVENTOS."CDDS_CARGO",
  VALE_EVENTOS."DT_ADMISSAO",
  VALE_EVENTOS."SN_AFASTADO",
  CAST(0 AS FLOAT) AS "VL_SALARIO_BASE",
  "cd_evento" "CD_EVENTO",
  CAST("ds_evento" AS VARCHAR(1000)) "DS_EVENTO",
  'VALE ALIMENTAÇÃO' "TIPO_EVENTO",
  0 "REF_EVENTO",
  COALESCE("vl_evento",0) AS "VL_EVENTO" ,
  CAST(0 AS FLOAT) AS "VL_ATS",
  CAST(0 AS FLOAT) AS "VL_INSALUBRIDADE",
  CAST(0 AS FLOAT) AS "VL_GRATIFICACAO",
  COALESCE("vl_evento",0) AS "VL_VALE_ALIMENTACAO",
  CAST(0 AS FLOAT) AS "VL_VALE_TRANSPORTE",
  CAST(0 AS FLOAT) AS "VL_PLANO_SAUDE",
  CAST(0 AS FLOAT) AS "VL_PROVENTO",
  CAST(0 AS FLOAT) AS "VL_VANTAGEM",
  CAST(0 AS FLOAT) AS "VL_DESCONTO",
  CAST(0 AS FLOAT) AS "VL_OUTROS",
  CAST(0 AS FLOAT) AS "VL_OUTROS_PROVENTO",
  CAST(0 AS FLOAT) AS "VL_OUTROS_DESCONTO",
  CAST(0 AS FLOAT) AS "VL_FERIAS" ,
  CAST(0 AS FLOAT) AS "VL_13SALARIO",
  CAST(0 AS FLOAT) AS "VL_HORA_EXTRA",
  CAST(0 AS FLOAT) AS "VL_INSS",
  CAST(0 AS FLOAT) AS "VL_FGTS",
  CAST(0 AS FLOAT) AS "VL_IRRF"
FROM
 %VALE_ALIM%
 INNER JOIN  (SELECT DISTINCT "CD_CENTRO_CUSTO",
                              "DS_CENTRO_CUSTO",
                              "CD_CARGO",
                              "DS_CARGO",
                              "CDDS_CARGO",
                              "DT_ADMISSAO",
                              "SN_AFASTADO",
                              "VL_SALARIO_BASE",
                              "DT_REFERENCIA",
                              "CD_COLABORADOR",
                              "DS_COLABORADOR",
                              "TIPO_CONTRATACAO"
                        FROM %EVENTOS%
                       WHERE "TIPO_CONTRATACAO" IN ('EMPREGADO','ESTAGIÁRIO','APRENDIZ')
              ) VALE_EVENTOS on cast(VALE_ALIM."cd_colaborador" as float) = cast( VALE_EVENTOS."CD_COLABORADOR" as float)
                                and VALE_ALIM."dt_referencia" =  VALE_EVENTOS."DT_REFERENCIA"

WHERE
  CAST(:INDICADOR AS VARCHAR(100)) IN ('Todos os Eventos','Vale Alimentação','Custo da Folha')

UNION ALL

SELECT
  5 "ORDEM",
  'INSS FUNCIONÁRIO' AS "TP_CONSULTA",
  IMPOSTOS."DH_CARGA",
  IMPOSTOS."DT_REFERENCIA",
  IMPOSTOS."CD_CENTRO_CUSTO",
  IMPOSTOS."DS_CENTRO_CUSTO",
  IMPOSTOS."CD_COLABORADOR",
  IMPOSTOS."DS_COLABORADOR",
  "TIPO_CONTRATACAO",
  IMPOSTOS."CD_CARGO",
  IMPOSTOS."DS_CARGO",
  IMPOSTOS."CD_CENTRO_CUSTO"||'-'||IMPOSTOS."DS_CENTRO_CUSTO" AS "CDDS_CENTRO_CUSTO",
  IMPOSTOS."CD_COLABORADOR"||'-'||IMPOSTOS."DS_COLABORADOR" AS "CDDS_COLABORADOR",
  IMPOSTOS."CD_CARGO"||'-'||IMPOSTOS."DS_CARGO" AS "CDDS_CARGO",
  IMPOSTOS."DT_ADMISSAO",
  IMPOSTOS."SN_AFASTADO",
  CAST(0 AS FLOAT) AS "VL_SALARIO_BASE",
  CAST(0 AS FLOAT) AS "CD_EVENTO",
  REPLACE("DADOS_INSS",'|','\n') AS "DS_EVENTO",
  'INSS Funcionário' "TIPO_EVENTO",
  0 "REF_EVENTO",
  COALESCE(IMPOSTOS."VL_INSS",0) AS "VL_EVENTO",
  CAST(0 AS FLOAT) AS "VL_ATS",
  CAST(0 AS FLOAT) AS "VL_INSALUBRIDADE",
  CAST(0 AS FLOAT) AS "VL_GRATIFICACAO",
  CAST(0 AS FLOAT) AS "VL_VALE_ALIMENTACAO",
  CAST(0 AS FLOAT) AS "VL_VALE_TRANSPORTE",
  CAST(0 AS FLOAT) AS "VL_PLANO_SAUDE",
  CAST(0 AS FLOAT) AS "VL_PROVENTO",
  CAST(0 AS FLOAT) AS "VL_VANTAGEM",
  CAST(0 AS FLOAT) AS "VL_DESCONTO",
  CAST(0 AS FLOAT) AS "VL_OUTROS",
  CAST(0 AS FLOAT) AS "VL_OUTROS_PROVENTO",
  CAST(0 AS FLOAT) AS "VL_OUTROS_DESCONTO",
  CAST(0 AS FLOAT) AS "VL_FERIAS" ,
  CAST(0 AS FLOAT) AS "VL_13SALARIO",
  CAST(0 AS FLOAT) AS "VL_HORA_EXTRA",
  COALESCE(IMPOSTOS."VL_INSS",0) "VL_INSS",
  CAST(0 AS FLOAT) "VL_FGTS",
  CAST(0 AS FLOAT) "VL_IRRF"
FROM
 %IMPOSTOS%
WHERE
  CAST(:INDICADOR AS VARCHAR(100)) IN ('Todos os Eventos','INSS Funcionário')

UNION ALL

SELECT
  4 "ORDEM",
 'FGTS' AS "TP_CONSULTA",
  IMPOSTOS."DH_CARGA",
  IMPOSTOS."DT_REFERENCIA",
  IMPOSTOS."CD_CENTRO_CUSTO",
  IMPOSTOS."DS_CENTRO_CUSTO",
  IMPOSTOS."CD_COLABORADOR",
  IMPOSTOS."DS_COLABORADOR",
  "TIPO_CONTRATACAO",
  IMPOSTOS."CD_CARGO",
  IMPOSTOS."DS_CARGO",
  IMPOSTOS."CD_CENTRO_CUSTO"||'-'||IMPOSTOS."DS_CENTRO_CUSTO" AS "CDDS_CENTRO_CUSTO",
  IMPOSTOS."CD_COLABORADOR"||'-'||IMPOSTOS."DS_COLABORADOR" AS "CDDS_COLABORADOR",
  IMPOSTOS."CD_CARGO"||'-'||IMPOSTOS."DS_CARGO" AS "CDDS_CARGO",
  IMPOSTOS."DT_ADMISSAO",
  IMPOSTOS."SN_AFASTADO",
  CAST(0 AS FLOAT) AS "VL_SALARIO_BASE",
  CAST(0 AS FLOAT) AS "CD_EVENTO",
  'FGTS' AS "DS_EVENTO",
  'FGTS' "TIPO_EVENTO",
  0 "REF_EVENTO",
  COALESCE(IMPOSTOS."VL_FGTS",0) AS "VL_EVENTO",
  CAST(0 AS FLOAT) AS "VL_ATS",
  CAST(0 AS FLOAT) AS "VL_INSALUBRIDADE",
  CAST(0 AS FLOAT) AS "VL_GRATIFICACAO",
  CAST(0 AS FLOAT) AS "VL_VALE_ALIMENTACAO",
  CAST(0 AS FLOAT) AS "VL_VALE_TRANSPORTE",
  CAST(0 AS FLOAT) AS "VL_PLANO_SAUDE",
  CAST(0 AS FLOAT) AS "VL_PROVENTO",
  CAST(0 AS FLOAT) AS "VL_VANTAGEM",
  CAST(0 AS FLOAT) AS "VL_DESCONTO",
  CAST(0 AS FLOAT) AS "VL_OUTROS",
  CAST(0 AS FLOAT) AS "VL_OUTROS_PROVENTO",
  CAST(0 AS FLOAT) AS "VL_OUTROS_DESCONTO",
  CAST(0 AS FLOAT) AS "VL_FERIAS" ,
  CAST(0 AS FLOAT) AS "VL_13SALARIO",
  CAST(0 AS FLOAT) AS "VL_HORA_EXTRA",
  CAST(0 AS FLOAT) "VL_INSS",
  COALESCE(IMPOSTOS."VL_FGTS",0) "VL_FGTS",
  CAST(0 AS FLOAT) "VL_IRRF"
FROM
 %IMPOSTOS%
WHERE
  CAST(:INDICADOR AS VARCHAR(100)) IN ('Todos os Eventos','FGTS','Custo da Folha')

UNION ALL

SELECT
  6 "ORDEM",
 'IRRF FUNCIONÁRIO' AS "TP_CONSULTA",
  IMPOSTOS."DH_CARGA",
  IMPOSTOS."DT_REFERENCIA",
  IMPOSTOS."CD_CENTRO_CUSTO",
  IMPOSTOS."DS_CENTRO_CUSTO",
  IMPOSTOS."CD_COLABORADOR",
  IMPOSTOS."DS_COLABORADOR",
  "TIPO_CONTRATACAO",
  IMPOSTOS."CD_CARGO",
  IMPOSTOS."DS_CARGO",
  IMPOSTOS."CD_CENTRO_CUSTO"||'-'||IMPOSTOS."DS_CENTRO_CUSTO" AS "CDDS_CENTRO_CUSTO",
  IMPOSTOS."CD_COLABORADOR"||'-'||IMPOSTOS."DS_COLABORADOR" AS "CDDS_COLABORADOR",
  IMPOSTOS."CD_CARGO"||'-'||IMPOSTOS."DS_CARGO" AS "CDDS_CARGO",
  IMPOSTOS."DT_ADMISSAO",
  IMPOSTOS."SN_AFASTADO",
  CAST(0 AS FLOAT) AS "VL_SALARIO_BASE",
  CAST(0 AS FLOAT) AS "CD_EVENTO",
  REPLACE("DADOS_IRRF",'|','\n') AS "DS_EVENTO",
  'IRRF Funcionário' "TIPO_EVENTO",
  0 "REF_EVENTO",
  COALESCE(IMPOSTOS."VL_IRRF",0) AS "VL_EVENTO",
  CAST(0 AS FLOAT) AS "VL_ATS",
  CAST(0 AS FLOAT) AS "VL_INSALUBRIDADE",
  CAST(0 AS FLOAT) AS "VL_GRATIFICACAO",
  CAST(0 AS FLOAT) AS "VL_VALE_ALIMENTACAO",
  CAST(0 AS FLOAT) AS "VL_VALE_TRANSPORTE",
  CAST(0 AS FLOAT) AS "VL_PLANO_SAUDE",
  CAST(0 AS FLOAT) AS "VL_PROVENTO",
  CAST(0 AS FLOAT) AS "VL_VANTAGEM",
  CAST(0 AS FLOAT) AS "VL_DESCONTO",
  CAST(0 AS FLOAT) AS "VL_OUTROS",
  CAST(0 AS FLOAT) AS "VL_OUTROS_PROVENTO",
  CAST(0 AS FLOAT) AS "VL_OUTROS_DESCONTO",
  CAST(0 AS FLOAT) AS "VL_FERIAS" ,
  CAST(0 AS FLOAT) AS "VL_13SALARIO",
  CAST(0 AS FLOAT) AS "VL_HORA_EXTRA",
  CAST(0 AS FLOAT) AS "VL_INSS",
  CAST(0 AS FLOAT) AS "VL_FGTS",
  COALESCE(IMPOSTOS."VL_IRRF",0) AS "VL_IRRF"
FROM
 %IMPOSTOS%
WHERE
  CAST(:INDICADOR AS VARCHAR(100)) IN ('Todos os Eventos','IRRF Funcionário')

UNION ALL

select
  7 "ORDEM",
  'INSS Empresa' AS "TP_CONSULTA",
  "DH_CARGA",
  "DT_REFERENCIA",
  "CD_CENTRO_CUSTO",
  "DS_CENTRO_CUSTO",
  "CD_COLABORADOR",
  "DS_COLABORADOR",
  "TIPO_CONTRATACAO",
  "CD_CARGO",
  "DS_CARGO",
  "CDDS_CENTRO_CUSTO",
  "CDDS_COLABORADOR",
  "CDDS_CARGO",
  "DT_ADMISSAO",
  "SN_AFASTADO",
  CAST(0 AS FLOAT) "VL_SALARIO_BASE",
  0 "CD_EVENTO",
  '20% de Proventos e Vantagens' "DS_EVENTO",
  'INSS Empresa' "TIPO_EVENTO",
  0 "REF_EVENTO",
  sum(CASE
        WHEN "TIPO_CONTRATACAO" <> 'ESTAGIÁRIO'
             AND "TIPO_EVENTO" in ('VANTAGEM','PROVENTO') THEN COALESCE("VL_EVENTO",0) *0.2
        ELSE 0
       END)  AS "VL_EVENTO",
  CAST(0 AS FLOAT) AS "VL_ATS",
  CAST(0 AS FLOAT) AS "VL_INSALUBRIDADE",
  CAST(0 AS FLOAT) AS "VL_GRATIFICACAO",
  CAST(0 AS FLOAT) AS "VL_VALE_ALIMENTACAO",
  CAST(0 AS FLOAT) AS "VL_VALE_TRANSPORTE",
  CAST(0 AS FLOAT) AS "VL_PLANO_SAUDE",
  CAST(0 AS FLOAT) AS "VL_PROVENTO",
  CAST(0 AS FLOAT) AS "VL_VANTAGEM",
  CAST(0 AS FLOAT) AS "VL_DESCONTO",
  CAST(0 AS FLOAT) AS "VL_OUTROS",
  CAST(0 AS FLOAT) AS "VL_OUTROS_PROVENTO",
  CAST(0 AS FLOAT) AS "VL_OUTROS_DESCONTO",
  CAST(0 AS FLOAT) AS "VL_FERIAS" ,
  CAST(0 AS FLOAT) AS "VL_13SALARIO",
  CAST(0 AS FLOAT) AS "VL_HORA_EXTRA",
  CAST(0 AS FLOAT) AS "VL_INSS",
  CAST(0 AS FLOAT) AS "VL_FGTS",
  CAST(0 AS FLOAT) AS "VL_IRRF"
from
  %EVENTOS%
WHERE
  CAST(:INDICADOR AS VARCHAR(100)) IN ('Todos os Eventos','INSS Empresa')
GROUP BY
  "DH_CARGA",
  "DT_REFERENCIA",
  "CD_CENTRO_CUSTO",
  "DS_CENTRO_CUSTO",
  "CD_COLABORADOR",
  "DS_COLABORADOR",
  "TIPO_CONTRATACAO",
  "CD_CARGO",
  "DS_CARGO",
  "CDDS_CENTRO_CUSTO",
  "CDDS_COLABORADOR",
  "CDDS_CARGO",
  "DT_ADMISSAO",
  "SN_AFASTADO"
) T
  LEFT JOIN (SELECT * FROM %GRUPO_CC%) GRUPO ON  T."DS_CENTRO_CUSTO" = GRUPO."DS_CENTRO_CUSTO"
                                                  AND GRUPO."DS_CARGO" IS NULL

  LEFT JOIN (SELECT * FROM %GRUPO_CC%) GRUPO_CARGO ON  T."DS_CENTRO_CUSTO" = GRUPO_CARGO."DS_CENTRO_CUSTO"
                                                          AND T."DS_CARGO" = GRUPO_CARGO."DS_CARGO"


