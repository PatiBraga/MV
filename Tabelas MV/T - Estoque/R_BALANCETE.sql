SELECT    A.CD_CONTABIL           CD_CONTABIL
         ,A.DS_CONTA              DS_CONTA
         ,A.CD_GRAU               CD_GRAU
         ,A.TP_CONTA              TP_CONTA
         ,A.VL_SALDO_ANT          VL_SALDO_ANT
         ,SUM( A.VL_DEBITO )     VL_DEBITO
         ,SUM( A.VL_CREDITO )    VL_CREDITO
         ,SUM( A.VL_SALDO_ATU )   VL_SALDO_ATU
         ,Max(A.DT_SALDO_MES)      DT_SALDO_MES
FROM (
SELECT   pc.cd_contabil cd_contabil
        ,pc.ds_conta ds_conta
        ,pc.cd_grau_da_conta cd_grau
        ,pc.tp_conta tp_conta
        ,sm.cd_reduzido
        ,sm_ant.vl_saldo_mes vl_saldo_ant
        ,NVL (sm.vl_debito, 0) vl_debito
        ,NVL (sm.vl_credito, 0) vl_credito
        ,sm.vl_saldo_mes        vl_saldo_atu
        ,sm.dt_saldo_mes dt_saldo_mes
    FROM dbamv.plano_contas pc
        , ( SELECT
         cd_reduzido
        ,vl_debito
        ,vl_credito
        ,vl_saldo_mes
        ,dt_saldo_mes
      FROM dbamv.saldo_mensal
      WHERE  = 'S'
      UNION ALL
      SELECT
         cd_reduzido
        ,vl_debito
        ,vl_credito
        ,vl_saldo_mes
        ,dt_saldo_mes
      FROM dbamv.saldo_mes_sem_apuracao
      WHERE  = 'N'
     ) sm
        , (SELECT sm_aux.dt_saldo_mes dt_saldo_mes
                 ,sm_aux.cd_reduzido cd_reduzido
                 ,sm_aux.vl_saldo_mes vl_saldo_mes
             FROM dbamv.saldo_mensal sm_aux
                 , (SELECT   MAX (sm_max.dt_saldo_mes) dt_saldo_mes
                            ,cd_reduzido
                        FROM dbamv.saldo_mensal sm_max
                       WHERE sm_max.dt_saldo_mes <= Decode(,'C',To_Date('01/'|| ||'/'||,'DD/MM/YYYY') , Add_Months(,-1))
                    GROUP BY sm_max.cd_reduzido) ult_sm
            WHERE sm_aux.dt_saldo_mes <=  Decode(,'C',To_Date('01/'|| ||'/'||,'DD/MM/YYYY') , Add_Months(,-1))
              AND sm_aux.dt_saldo_mes = ult_sm.dt_saldo_mes
              AND sm_aux.cd_reduzido = ult_sm.cd_reduzido) sm_ant
   WHERE pc.cd_multi_empresa = 
     AND pc.cd_grau_da_conta <= 
     AND pc.cd_reduzido = sm.cd_reduzido(+)
     AND pc.sn_imprime IN ('S', )
     AND pc.cd_reduzido = sm_ant.cd_reduzido(+)
     AND ( = 'N' or  = 'S'
     AND EXISTS
	 (SELECT
             CD_REDUZIDO
	  FROM
             DBAMV.PLANO_USUARIO_MULTI_EMPRESA PU
   	   WHERE
              PU.CD_REDUZIDO       = PC.CD_REDUZIDO
	  AND PU.CD_MULTI_EMPRESA  = 
                  AND PU.CD_ID_USUARIO     = USER  ))
     AND = 'L'
UNION
SELECT   pc.cd_contabil cd_contabil
        ,pc.ds_conta ds_conta
        ,pc.cd_grau_da_conta cd_grau
        ,pc.tp_conta tp_conta
        ,sm.cd_reduzido
        ,sm_ant.vl_saldo_mes vl_saldo_ant
        ,NVL (sm.vl_debito, 0) vl_debito
        ,NVL (sm.vl_credito, 0) vl_credito
        ,sm.vl_saldo_mes        vl_saldo_atu
        ,sm.dt_saldo_mes dt_saldo_mes
    FROM dbamv.plano_contas pc
        ,( SELECT
         cd_reduzido
        ,vl_debito
        ,vl_credito
        ,vl_saldo_mes
        ,dt_saldo_mes
        ,cd_multi_empresa_origem
      FROM dbamv.saldo_mensal_emp
      WHERE  = 'S'
      UNION ALL
      SELECT
         cd_reduzido
        ,vl_debito
        ,vl_credito
        ,vl_saldo_mes
        ,dt_saldo_mes
        ,cd_multi_empresa_origem
      FROM dbamv.saldo_mes_empresa_sem_apuracao
      WHERE  = 'N'
     ) sm
        , (SELECT sm_aux.dt_saldo_mes dt_saldo_mes
                 ,sm_aux.cd_reduzido cd_reduzido
                 ,sm_aux.vl_saldo_mes vl_saldo_mes
             FROM dbamv.saldo_mensal_emp sm_aux
                 , (SELECT   MAX (sm_max.dt_saldo_mes) dt_saldo_mes
                            ,cd_reduzido
                        FROM dbamv.saldo_mensal_emp sm_max
                       WHERE sm_max.dt_saldo_mes <= Decode(,'C',To_Date('01/'|| ||'/'||,'DD/MM/YYYY') , Add_Months(,-1))
                        AND sm_max.cd_multi_empresa_origem = 
                    GROUP BY sm_max.cd_reduzido) ult_sm
            WHERE sm_aux.dt_saldo_mes <= Decode(,'C',To_Date('01/'|| ||'/'||,'DD/MM/YYYY') , Add_Months(,-1))
              AND sm_aux.dt_saldo_mes = ult_sm.dt_saldo_mes
              AND sm_aux.cd_reduzido = ult_sm.cd_reduzido
              AND sm_aux.cd_multi_empresa_origem = ) sm_ant
   WHERE  pc.cd_multi_empresa = dbamv.Pkg_MV2000.Le_Empresa
     AND pc.cd_grau_da_conta <= 
     AND pc.cd_reduzido = sm.cd_reduzido(+)
 AND pc.sn_imprime IN ('S', )
     AND pc.cd_reduzido = sm_ant.cd_reduzido(+)
     AND ( = 'N' or  = 'S'
     AND EXISTS
	 (SELECT
             CD_REDUZIDO
	  FROM
             DBAMV.PLANO_USUARIO_MULTI_EMPRESA PU
   	   WHERE
              PU.CD_REDUZIDO       = PC.CD_REDUZIDO
	  AND PU.CD_MULTI_EMPRESA  = dbamv.Pkg_MV2000.Le_Empresa
                  AND PU.CD_ID_USUARIO     = USER  ))
     AND sm.cd_multi_empresa_origem(+) = 
     AND = 'M'
) A
GROUP BY  A.CD_CONTABIL
         ,A.DS_CONTA
         ,A.CD_GRAU
         ,A.TP_CONTA
         ,a.VL_SALDO_ANT
ORDER BY  A.CD_CONTABIL