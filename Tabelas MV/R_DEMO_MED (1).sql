SELECT * FROM (
SELECT DECODE('S','S',tmp.CD_PRESTADOR,NULL) QUEBRA_PREST
              ,tmp.DT_INICIO
              ,tmp.DT_FINAL
              ,tmp.CD_ATENDIMENTO
              ,tmp.CD_PACIENTE
              ,tmp.NM_PACIENTE
              ,tmp.CD_PRESTADOR
              ,tmp.NM_PRESTADOR
              ,tmp.CD_REG_REPASSE
              ,tmp.CD_CONVENIO
              ,tmp.NM_CONVENIO
              ,tmp.CD_PRO_FAT
              ,tmp.DS_PRO_FAT
              ,tmp.DS_ATI_MED
	          ,decode(nvl(itr.vl_procedimento+itr.vl_percent_pago,0),
	                    0,tmp.VALOR_PAGAR,decode(nvl(itr.vl_procedimento,0),
			                                     0,tmp.VALOR_PAGAR/100,itr.vl_procedimento)) VALOR_PAGAR
             ,tmp.QT_LANCAMENTO
             ,tmp.DT_ENTREGA
             ,tmp.HR_LANCA
             ,tmp.CONTA
             ,tmp.DT_LANCAMENTO
             ,tmp.TP_PAGAMENTO
             ,tmp.CD_CONVENIO2

FROM dbamv.itreg_repasse itr,
(
SELECT TRUNC(REG_FAT.DT_INICIO)                    DT_INICIO
              ,TRUNC(REG_FAT.DT_FINAL)                    DT_FINAL
              ,ATENDIME.CD_ATENDIMENTO                CD_ATENDIMENTO
              ,PACIENTE.CD_PACIENTE                          CD_PACIENTE
              ,PACIENTE.NM_PACIENTE                         NM_PACIENTE
              ,PRESTADOR.CD_PRESTADOR                CD_PRESTADOR
              ,PRESTADOR.NM_PRESTADOR                NM_PRESTADOR
              ,PRESTADOR.CD_REG_REPASSE             CD_REG_REPASSE
              ,decode('Sim', 'Sim', CONVENIO.CD_CONVENIO, to_number(null) ) CD_CONVENIO
              ,decode('Sim', 'Sim', CONVENIO.NM_CONVENIO, null)             NM_CONVENIO
              ,PRO_FAT.CD_PRO_FAT                             CD_PRO_FAT
              ,PRO_FAT.DS_PRO_FAT                             DS_PRO_FAT
              ,ATI_MED.DS_ATI_MED                              DS_ATI_MED

             ,DECODE( 'Não',
             'Sim', ITLAN_MED.VL_LIQUIDO,
             'Não', (ITLAN_MED.VL_ATO * ITREG_FAT.QT_LANCAMENTO)       )   VALOR_PAGAR

             ,ITREG_FAT.QT_LANCAMENTO                                          QT_LANCAMENTO
             ,TRUNC(REMESSA.DT_ENTREGA_DA_FATURA)              DT_ENTREGA
             ,TO_CHAR(ITREG_FAT.HR_LANCAMENTO, 'HH24:MI')     HR_LANCA
             ,ITREG_FAT.CD_REG_FAT                                                  CONTA
             ,ITREG_FAT.DT_LANCAMENTO                                          DT_LANCAMENTO
             ,ITLAN_MED.TP_PAGAMENTO                                            TP_PAGAMENTO
             ,CONVENIO.CD_CONVENIO                                                  CD_CONVENIO2
             ,ITREG_FAT.CD_LANCAMENTO
FROM   DBAMV.ATENDIME                       ATENDIME
            ,DBAMV.PACIENTE                        PACIENTE
            ,DBAMV.REG_FAT                         REG_FAT
            ,DBAMV.CONVENIO                       CONVENIO
            ,DBAMV.ITREG_FAT                      ITREG_FAT
            ,DBAMV.PRO_FAT                         PRO_FAT
            ,DBAMV.ITLAN_MED                     ITLAN_MED
            ,DBAMV.PRESTADOR                   PRESTADOR
            ,DBAMV.ATI_MED                          ATI_MED
            ,DBAMV.REMESSA_FATURA        REMESSA
            ,DBAMV.FATURA                           FATURA
            ,DBAMV.ITAGRUPAMENTO          ITAGRUPAMENTO
WHERE --$P!{CF_COND_FATURADO}
              REMESSA.CD_FATURA = FATURA.CD_FATURA
AND FATURA.DT_COMPETENCIA = To_Date('12/2019','MM/YYYY')
AND         REMESSA.CD_REMESSA = REG_FAT.CD_REMESSA
AND        REG_FAT.CD_REG_FAT = ITREG_FAT.CD_REG_FAT
AND        ITREG_FAT.CD_PRO_FAT = PRO_FAT.CD_PRO_FAT
AND        ITREG_FAT.CD_REG_FAT = ITLAN_MED.CD_REG_FAT
AND        ITREG_FAT.CD_LANCAMENTO = ITLAN_MED.CD_LANCAMENTO
AND        ITLAN_MED.CD_PRESTADOR = PRESTADOR.CD_PRESTADOR
AND        ITLAN_MED.CD_ATI_MED = ATI_MED.CD_ATI_MED
and         itreg_fat.sn_pertence_pacote = 'N'
AND         REG_FAT.CD_CONVENIO = CONVENIO.CD_CONVENIO
AND         REG_FAT.CD_ATENDIMENTO = ATENDIME.CD_ATENDIMENTO
AND        ATENDIME.CD_PACIENTE = PACIENTE.CD_PACIENTE
and        atendime.cd_multi_empresa = 1
AND	REMESSA.CD_AGRUPAMENTO = ITAGRUPAMENTO.CD_AGRUPAMENTO(+)
AND       ( (ATENDIME.CD_ORI_ATE = ITAGRUPAMENTO.CD_ORI_ATE                         AND
                 REG_FAT.CD_CONVENIO = ITAGRUPAMENTO.CD_CONVENIO                     AND
                 REMESSA.CD_AGRUPAMENTO = ITAGRUPAMENTO.CD_AGRUPAMENTO AND
                 ITAGRUPAMENTO.TP_AGRUPAMENTO = 'H'                          AND
                 REMESSA.CD_AGRUPAMENTO IS NOT NULL )
                OR
                REMESSA.CD_AGRUPAMENTO IS NULL )
and         nvl(reg_fat.sn_diagno, 'N') = 'N'
  AND        ATENDIME.CD_MULTI_EMPRESA = 1
AND        CONVENIO.TP_CONVENIO <> 'H'
/*$P!{CF_COND_CONV}
$P!{CF_COND_ORI}
$P!{CF_COND_PRESTA}
$P!{CF_COND_AGRUPA}
$P!{CF_COND_TP_HOSP}
$P!{CF_COND_CREDEN_ITLAN}
$P!{CF_COND_CONV_PART}
$P!{CF_CD_GRU_PRO}
$P!{CF_CD_PRO_FAT}
$P!{CF_IMP_PAGA}
$P!{CF_COND_REPASSE_ITLAN}*/
UNION ALL
SELECT TRUNC(REG_FAT.DT_INICIO)                    DT_INICIO
              ,TRUNC(REG_FAT.DT_FINAL)                    DT_FINAL
             ,ATENDIME.CD_ATENDIMENTO                 CD_ATENDIMENTO
             ,PACIENTE.CD_PACIENTE                           CD_PACIENTE
             ,PACIENTE.NM_PACIENTE                          NM_PACIENTE
             ,PRESTADOR.CD_PRESTADOR                 CD_PRESTADOR
             ,PRESTADOR.NM_PRESTADOR                 NM_PRESTADOR
             ,PRESTADOR.CD_REG_REPASSE             CD_REG_REPASSE
              ,decode('Sim', 'Sim', CONVENIO.CD_CONVENIO, to_number(null) ) CD_CONVENIO
              ,decode('Sim', 'Sim', CONVENIO.NM_CONVENIO, null)             NM_CONVENIO
             ,PRO_FAT.CD_PRO_FAT                              CD_PRO_FAT
             ,PRO_FAT.DS_PRO_FAT                              DS_PRO_FAT
             ,' '                                                                    DS_ATI_MED
             ,DECODE( 'Não', 'Não', (ITREG_FAT.VL_TOTAL_CONTA + NVL(ITREG_FAT.VL_DESCONTO,0) - NVL(ITREG_FAT.VL_ACRESCIMO,0)),
                                     'Sim', ITREG_FAT.VL_TOTAL_CONTA)  VALOR_PAGAR
             ,ITREG_FAT.QT_LANCAMENTO                    QT_LANCAMENTO
             ,TRUNC(REMESSA.DT_ENTREGA_DA_FATURA)     DT_ENTREGA
             ,TO_CHAR(ITREG_FAT.HR_LANCAMENTO, 'HH24:MI')    HR_LANCA
             ,ITREG_FAT.CD_REG_FAT                                                  CONTA
             ,ITREG_FAT.DT_LANCAMENTO                                          DT_LANCAMENTO
             ,ITREG_FAT.TP_PAGAMENTO                      TP_PAGAMENTO
             ,CONVENIO.CD_CONVENIO                                                  CD_CONVENIO2
             ,ITREG_FAT.CD_LANCAMENTO
FROM   DBAMV.ATENDIME                    ATENDIME
            ,DBAMV.PACIENTE                     PACIENTE
            ,DBAMV.REG_FAT                      REG_FAT
            ,DBAMV.CONVENIO                    CONVENIO
            ,DBAMV.ITREG_FAT                   ITREG_FAT
            ,DBAMV.PRO_FAT                      PRO_FAT
            ,DBAMV.PRESTADOR                PRESTADOR
            ,DBAMV.REMESSA_FATURA     REMESSA
            ,DBAMV.FATURA                        FATURA
            ,DBAMV.ITAGRUPAMENTO       ITAGRUPAMENTO
WHERE  --$P!{CF_COND_FATURADO}
               REMESSA.CD_FATURA = FATURA.CD_FATURA
AND FATURA.DT_COMPETENCIA = To_Date('12/2019','MM/YYYY')
AND        REMESSA.CD_REMESSA = REG_FAT.CD_REMESSA
AND        REG_FAT.CD_REG_FAT = ITREG_FAT.CD_REG_FAT
and         itreg_fat.sn_pertence_pacote = 'N'
AND        ITREG_FAT.CD_PRO_FAT = PRO_FAT.CD_PRO_FAT
AND        ITREG_FAT.CD_PRESTADOR = PRESTADOR.CD_PRESTADOR
AND        REG_FAT.CD_CONVENIO = CONVENIO.CD_CONVENIO
AND        REG_FAT.CD_ATENDIMENTO = ATENDIME.CD_ATENDIMENTO
AND        ATENDIME.CD_PACIENTE = PACIENTE.CD_PACIENTE
and        atendime.cd_multi_empresa = 1
AND        ATENDIME.CD_MULTI_EMPRESA = 1
AND	REMESSA.CD_AGRUPAMENTO = ITAGRUPAMENTO.CD_AGRUPAMENTO(+)
AND       ( (ATENDIME.CD_ORI_ATE = ITAGRUPAMENTO.CD_ORI_ATE                         AND
                 REG_FAT.CD_CONVENIO = ITAGRUPAMENTO.CD_CONVENIO                     AND
                 REMESSA.CD_AGRUPAMENTO = ITAGRUPAMENTO.CD_AGRUPAMENTO AND
                 ITAGRUPAMENTO.TP_AGRUPAMENTO = 'H'                          AND
                 REMESSA.CD_AGRUPAMENTO IS NOT NULL )
                OR
                REMESSA.CD_AGRUPAMENTO IS NULL )
and         nvl(reg_fat.sn_diagno, 'N') = 'N'
AND        CONVENIO.TP_CONVENIO <> 'H'
/*$P!{CF_COND_CONV}
$P!{CF_COND_ORI}
$P!{CF_COND_PRESTA}
$P!{CF_COND_AGRUPA}
$P!{CF_COND_TP_HOSP}
$P!{CF_COND_CREDEN}
$P!{CF_COND_CONV_PART}
$P!{CF_CD_GRU_PRO}
$P!{CF_IMP_PAGA}
$P!{CF_CD_PRO_FAT}
$P!{CF_COND_REPASSE_FAT}*/
UNION
SELECT distinct  TRUNC(ATENDIME.DT_ATENDIMENTO)                    DT_INICIO
              ,TRUNC(ATENDIME.DT_ATENDIMENTO)                    DT_FINAL
              ,ATENDIME.CD_ATENDIMENTO                                  CD_ATENDIMENTO
              ,PACIENTE.CD_PACIENTE                                            CD_PACIENTE
              ,PACIENTE.NM_PACIENTE                                           NM_PACIENTE
              ,PRESTADOR.CD_PRESTADOR                                   CD_PRESTADOR
              ,PRESTADOR.NM_PRESTADOR                                  NM_PRESTADOR
              ,PRESTADOR.CD_REG_REPASSE                               CD_REG_REPASSE
              ,decode('Sim', 'Sim', CONVENIO.CD_CONVENIO, to_number(null) ) CD_CONVENIO
              ,decode('Sim', 'Sim', CONVENIO.NM_CONVENIO, null)             NM_CONVENIO
              ,PRO_FAT.CD_PRO_FAT                                               CD_PRO_FAT
              ,PRO_FAT.DS_PRO_FAT                                               DS_PRO_FAT
              ,ATI_MED.DS_ATI_MED                                                DS_ATI_MED
             ,DECODE( 'Não', 'Não', (ITREG_AMB.VL_TOTAL_CONTA + NVL(ITREG_AMB.VL_DESCONTO,0) - NVL(ITREG_AMB.VL_ACRESCIMO,0)),
                                     'Sim', ITREG_AMB.VL_TOTAL_CONTA)  VALOR_PAGAR
              ,ITREG_AMB.QT_LANCAMENTO                                   QT_LANCAMENTO
             ,TRUNC(REMESSA.DT_ENTREGA_DA_FATURA)         DT_ENTREGA
             ,TO_CHAR(ITREG_AMB.HR_LANCAMENTO, 'HH24:MI')     HR_LANCA
             ,ITREG_AMB.CD_REG_AMB                                                  CONTA
             ,ATENDIME.DT_ATENDIMENTO                                          DT_LANCAMENTO
             ,ITREG_AMB.TP_PAGAMENTO                                        TP_PAGAMENTO
             ,CONVENIO.CD_CONVENIO                                                  CD_CONVENIO2
             ,ITREG_AMB.CD_LANCAMENTO
FROM   DBAMV.ATENDIME                   ATENDIME
            ,DBAMV.PACIENTE                    PACIENTE
            ,DBAMV.CONVENIO                   CONVENIO
            ,DBAMV.ITREG_AMB                 ITREG_AMB
            ,DBAMV.REG_AMB                     REG_AMB
            ,DBAMV.PRO_FAT                      PRO_FAT
            ,DBAMV.PRESTADOR                PRESTADOR
            ,DBAMV.REMESSA_FATURA     REMESSA
            ,DBAMV.FATURA                        FATURA
            ,DBAMV.ITAGRUPAMENTO       ITAGRUPAMENTO
            ,DBAMV.ATI_MED                      ATI_MED
WHERE  --$P!{CF_COND_FATURADO}
            REMESSA.CD_FATURA        = FATURA.CD_FATURA
AND FATURA.DT_COMPETENCIA = To_Date('12/2019','MM/YYYY')
AND        REMESSA.CD_REMESSA        =  REG_AMB.CD_REMESSA
AND        REG_AMB.CD_REG_AMB        = ITREG_AMB.CD_REG_AMB
and        itreg_amb.sn_pertence_pacote = 'N'
AND        ITREG_AMB.CD_CONVENIO      = CONVENIO.CD_CONVENIO
AND        ITREG_AMB.CD_ATENDIMENTO   = ATENDIME.CD_ATENDIMENTO
AND        ATENDIME.CD_PACIENTE       = PACIENTE.CD_PACIENTE
AND        atendime.Cd_Multi_Empresa = 1
AND        ITREG_AMB.CD_PRO_FAT       = PRO_FAT.CD_PRO_FAT
AND        ITREG_AMB.CD_PRESTADOR     = PRESTADOR.CD_PRESTADOR
AND        ITREG_AMB.CD_ATI_MED       = ATI_MED.CD_ATI_MED(+)
AND       (ATENDIME.CD_ORI_ATE        = ITAGRUPAMENTO.CD_ORI_ATE
           AND ITREG_AMB.CD_CONVENIO  = ITAGRUPAMENTO.CD_CONVENIO
           AND REMESSA.CD_AGRUPAMENTO = ITAGRUPAMENTO.CD_AGRUPAMENTO
           AND  ITAGRUPAMENTO.TP_AGRUPAMENTO = 'A'
           AND REMESSA.CD_AGRUPAMENTO IS NOT NULL )
and        nvl(reg_amb.sn_diagno, 'N') = 'N'
AND        REG_AMB.CD_MULTI_EMPRESA = 1
AND        CONVENIO.TP_CONVENIO <> 'H'
/*$P!{CF_COND_CONV}
$P!{CF_COND_ORI}
$P!{CF_COND_PRESTA}
$P!{CF_COND_AGRUPA}
$P!{CF_COND_TP_AMB}
$P!{CF_CD_PRO_FAT}
$P!{CF_COND_CREDEN_AMB}
$P!{CF_COND_CONV_PART}
$P!{CF_CD_GRU_PRO}
$P!{CF_IMP_PAGA}
$P!{CF_COND_REPASSE_AMB}*/
UNION
SELECT distinct  TRUNC(ATENDIME.DT_ATENDIMENTO)                    DT_INICIO
              ,TRUNC(ATENDIME.DT_ATENDIMENTO)                    DT_FINAL
              ,ATENDIME.CD_ATENDIMENTO                                  CD_ATENDIMENTO
              ,PACIENTE.CD_PACIENTE                                            CD_PACIENTE
              ,PACIENTE.NM_PACIENTE                                           NM_PACIENTE
              ,PRESTADOR.CD_PRESTADOR                                   CD_PRESTADOR
              ,PRESTADOR.NM_PRESTADOR                                  NM_PRESTADOR
              ,PRESTADOR.CD_REG_REPASSE                               CD_REG_REPASSE
              ,decode('Sim', 'Sim', CONVENIO.CD_CONVENIO, to_number(null) ) CD_CONVENIO
              ,decode('Sim', 'Sim', CONVENIO.NM_CONVENIO, null)             NM_CONVENIO
              ,PRO_FAT.CD_PRO_FAT                                               CD_PRO_FAT
              ,PRO_FAT.DS_PRO_FAT                                               DS_PRO_FAT
              ,ATI_MED.DS_ATI_MED                                                DS_ATI_MED
             ,DECODE( 'Não', 'Não', (ITREG_AMB.VL_TOTAL_CONTA + NVL(ITREG_AMB.VL_DESCONTO,0) - NVL(ITREG_AMB.VL_ACRESCIMO,0)),
                                     'Sim', ITREG_AMB.VL_TOTAL_CONTA)  VALOR_PAGAR
              ,ITREG_AMB.QT_LANCAMENTO                                   QT_LANCAMENTO
             ,TRUNC(REMESSA.DT_ENTREGA_DA_FATURA)         DT_ENTREGA
             ,TO_CHAR(ITREG_AMB.HR_LANCAMENTO, 'HH24:MI')     HR_LANCA
             ,ITREG_AMB.CD_REG_AMB                                                  CONTA
             ,ATENDIME.DT_ATENDIMENTO                                          DT_LANCAMENTO
             ,ITREG_AMB.TP_PAGAMENTO                                        TP_PAGAMENTO
             ,CONVENIO.CD_CONVENIO                                                  CD_CONVENIO2
             ,ITREG_AMB.CD_LANCAMENTO
FROM   DBAMV.ATENDIME                   ATENDIME
            ,DBAMV.PACIENTE                    PACIENTE
            ,DBAMV.CONVENIO                   CONVENIO
            ,DBAMV.ITREG_AMB                 ITREG_AMB
            ,DBAMV.REG_AMB                     REG_AMB
            ,DBAMV.PRO_FAT                      PRO_FAT
            ,DBAMV.PRESTADOR                PRESTADOR
            ,DBAMV.REMESSA_FATURA     REMESSA
            ,DBAMV.FATURA                        FATURA
            ,DBAMV.ATI_MED                      ATI_MED
WHERE  --$P!{CF_COND_FATURADO}
               REMESSA.CD_FATURA    = FATURA.CD_FATURA
AND FATURA.DT_COMPETENCIA = To_Date('12/2019','MM/YYYY')
AND        REMESSA.CD_REMESSA =  REG_AMB.CD_REMESSA
AND        REG_AMB.CD_REG_AMB = ITREG_AMB.CD_REG_AMB
and        itreg_amb.sn_pertence_pacote = 'N'
AND        ITREG_AMB.CD_CONVENIO = CONVENIO.CD_CONVENIO
AND        ITREG_AMB.CD_ATENDIMENTO =  ATENDIME.CD_ATENDIMENTO
AND        ATENDIME.CD_PACIENTE = PACIENTE.CD_PACIENTE
AND        ITREG_AMB.CD_PRO_FAT = PRO_FAT.CD_PRO_FAT
AND        ITREG_AMB.CD_PRESTADOR = PRESTADOR.CD_PRESTADOR
AND        ITREG_AMB.CD_ATI_MED = ATI_MED.CD_ATI_MED(+)
AND        REMESSA.CD_AGRUPAMENTO IS NULL
and        nvl(reg_amb.sn_diagno, 'N') = 'N'
AND        REG_AMB.CD_MULTI_EMPRESA = 1
AND        atendime.Cd_Multi_Empresa = 1
AND        CONVENIO.TP_CONVENIO <> 'H'
/*$P!{CF_COND_CONV}
$P!{CF_COND_ORI}
$P!{CF_COND_PRESTA}
$P!{CF_COND_CREDEN_AMB}
$P!{CF_COND_CONV_PART}
$P!{CF_CD_PRO_FAT}
$P!{CF_CD_GRU_PRO}
$P!{CF_IMP_PAGA}
$P!{CF_COND_REPASSE_AMB}*/
UNION
SELECT TRUNC(REG_FAT.DT_INICIO)                    DT_INICIO
              ,TRUNC(REG_FAT.DT_FINAL)                    DT_FINAL
              ,ATENDIME.CD_ATENDIMENTO                CD_ATENDIMENTO
              ,PACIENTE.CD_PACIENTE                          CD_PACIENTE
              ,PACIENTE.NM_PACIENTE                         NM_PACIENTE
              ,PRESTADOR.CD_PRESTADOR                CD_PRESTADOR
              ,PRESTADOR.NM_PRESTADOR                NM_PRESTADOR
              ,PRESTADOR.CD_REG_REPASSE             CD_REG_REPASSE
              ,decode('Sim', 'Sim', CONVENIO.CD_CONVENIO, to_number(null) ) CD_CONVENIO
              ,decode('Sim', 'Sim', CONVENIO.NM_CONVENIO, null)             NM_CONVENIO
              ,PRO_FAT.CD_PRO_FAT                             CD_PRO_FAT
              ,PRO_FAT.DS_PRO_FAT                             DS_PRO_FAT
              ,ATI_MED.DS_ATI_MED                              DS_ATI_MED

             ,DECODE( 'Não',
             'Sim', ITLAN_MED.VL_LIQUIDO,
             'Não', (ITLAN_MED.VL_ATO * ITREG_FAT.QT_LANCAMENTO)       )   VALOR_PAGAR

             ,ITREG_FAT.QT_LANCAMENTO                                          QT_LANCAMENTO
             ,TRUNC(REMESSA.DT_ENTREGA_DA_FATURA)              DT_ENTREGA
             ,TO_CHAR(ITREG_FAT.HR_LANCAMENTO, 'HH24:MI')     HR_LANCA
             ,ITREG_FAT.CD_REG_FAT                                                  CONTA
             ,ITREG_FAT.DT_LANCAMENTO                                          DT_LANCAMENTO
             ,ITLAN_MED.TP_PAGAMENTO                                           TP_PAGAMENTO
             ,CONVENIO.CD_CONVENIO                                                  CD_CONVENIO2
             ,ITREG_FAT.CD_LANCAMENTO
FROM   DBAMV.ATENDIME                       ATENDIME
            ,DBAMV.PACIENTE                        PACIENTE
            ,DBAMV.REG_FAT                         REG_FAT
            ,DBAMV.CONVENIO                       CONVENIO
            ,DBAMV.ITREG_FAT                      ITREG_FAT
            ,DBAMV.PRO_FAT                         PRO_FAT
            ,DBAMV.ITLAN_MED                     ITLAN_MED
            ,DBAMV.PRESTADOR                   PRESTADOR
            ,DBAMV.ATI_MED                          ATI_MED
            ,DBAMV.REMESSA_FATURA        REMESSA
            ,DBAMV.FATURA                           FATURA
            ,DBAMV.ITAGRUPAMENTO          ITAGRUPAMENTO
WHERE   1=2 and  --$P!{CF_COND_CONSUMIDO}
               REMESSA.CD_FATURA  = FATURA.CD_FATURA
AND FATURA.DT_COMPETENCIA = To_Date('12/2019','MM/YYYY')
AND        REMESSA.CD_REMESSA = REG_FAT.CD_REMESSA
AND        nvl(reg_fat.sn_diagno, 'N') = 'N'
AND        REG_FAT.CD_REG_FAT = ITREG_FAT.CD_REG_FAT
AND        ITREG_FAT.CD_REG_FAT = ITLAN_MED.CD_REG_FAT
AND        ITREG_FAT.CD_LANCAMENTO = ITLAN_MED.CD_LANCAMENTO
AND        ITLAN_MED.CD_PRESTADOR = PRESTADOR.CD_PRESTADOR
AND        ITLAN_MED.CD_ATI_MED = ATI_MED.CD_ATI_MED
AND        ITREG_FAT.CD_PRO_FAT = PRO_FAT.CD_PRO_FAT
AND        PRO_FAT.SN_PACOTE = 'N'
AND        REG_FAT.CD_CONVENIO = CONVENIO.CD_CONVENIO
--$P!{CF_COND_CONV}
AND        REG_FAT.CD_ATENDIMENTO = ATENDIME.CD_ATENDIMENTO
AND        ATENDIME.CD_PACIENTE = PACIENTE.CD_PACIENTE
AND        atendime.Cd_Multi_Empresa = 1
AND	REMESSA.CD_AGRUPAMENTO = ITAGRUPAMENTO.CD_AGRUPAMENTO(+)
AND       ( (ATENDIME.CD_ORI_ATE = ITAGRUPAMENTO.CD_ORI_ATE                         AND
                 REG_FAT.CD_CONVENIO = ITAGRUPAMENTO.CD_CONVENIO                     AND
                 REMESSA.CD_AGRUPAMENTO = ITAGRUPAMENTO.CD_AGRUPAMENTO AND
                 ITAGRUPAMENTO.TP_AGRUPAMENTO = 'H'                          AND
                 REMESSA.CD_AGRUPAMENTO IS NOT NULL )
                OR
                REMESSA.CD_AGRUPAMENTO IS NULL )
AND        REG_FAT.CD_MULTI_EMPRESA = 1
AND        CONVENIO.TP_CONVENIO <> 'H'
/*$P!{CF_COND_PRESTA}
$P!{CF_COND_AGRUPA}
$P!{CF_COND_ORI}
$P!{CF_CD_PRO_FAT}
$P!{CF_COND_TP_HOSP}
$P!{CF_COND_CREDEN_ITLAN}
$P!{CF_COND_CONV_PART}
$P!{CF_CD_GRU_PRO}
$P!{CF_IMP_PAGA}
$P!{CF_COND_REPASSE_ITLAN}*/
UNION
SELECT  TRUNC(REG_FAT.DT_INICIO)                    DT_INICIO
              ,TRUNC(REG_FAT.DT_FINAL)                    DT_FINAL
             ,ATENDIME.CD_ATENDIMENTO                 CD_ATENDIMENTO
             ,PACIENTE.CD_PACIENTE                           CD_PACIENTE
             ,PACIENTE.NM_PACIENTE                          NM_PACIENTE
             ,PRESTADOR.CD_PRESTADOR                 CD_PRESTADOR
             ,PRESTADOR.NM_PRESTADOR                 NM_PRESTADOR
             ,PRESTADOR.CD_REG_REPASSE             CD_REG_REPASSE
             ,decode('Sim', 'Sim', CONVENIO.CD_CONVENIO, to_number(null) ) CD_CONVENIO
             ,decode('Sim', 'Sim', CONVENIO.NM_CONVENIO, null)             NM_CONVENIO
             ,PRO_FAT.CD_PRO_FAT                              CD_PRO_FAT
             ,PRO_FAT.DS_PRO_FAT                              DS_PRO_FAT
             ,' '                                                                    DS_ATI_MED
             ,DECODE( 'Não', 'Não', (ITREG_FAT.VL_TOTAL_CONTA + NVL(ITREG_FAT.VL_DESCONTO,0) - NVL(ITREG_FAT.VL_ACRESCIMO,0)),
                                     'Sim', ITREG_FAT.VL_TOTAL_CONTA)  VALOR_PAGAR
             ,ITREG_FAT.QT_LANCAMENTO                    QT_LANCAMENTO
             ,TRUNC(REMESSA.DT_ENTREGA_DA_FATURA)     DT_ENTREGA
             ,TO_CHAR(ITREG_FAT.HR_LANCAMENTO, 'HH24:MI')    HR_LANCA
             ,ITREG_FAT.CD_REG_FAT                            CONTA
             ,ITREG_FAT.DT_LANCAMENTO                    DT_LANCAMENTO
             ,ITREG_FAT.TP_PAGAMENTO                      TP_PAGAMENTO
             ,CONVENIO.CD_CONVENIO                           CD_CONVENIO2
             ,ITREG_FAT.CD_LANCAMENTO
FROM   DBAMV.ATENDIME                    ATENDIME
            ,DBAMV.PACIENTE                     PACIENTE
            ,DBAMV.REG_FAT                      REG_FAT
            ,DBAMV.CONVENIO                    CONVENIO
            ,DBAMV.ITREG_FAT                   ITREG_FAT
            ,DBAMV.PRO_FAT                      PRO_FAT
            ,DBAMV.PRESTADOR                PRESTADOR
            ,DBAMV.REMESSA_FATURA     REMESSA
            ,DBAMV.FATURA                        FATURA
            ,DBAMV.ITAGRUPAMENTO       ITAGRUPAMENTO
WHERE  1=2 and  --$P!{CF_COND_CONSUMIDO}
             REMESSA.CD_FATURA  = FATURA.CD_FATURA
AND FATURA.DT_COMPETENCIA = To_Date('12/2019','MM/YYYY')
AND        REMESSA.CD_REMESSA = REG_FAT.CD_REMESSA
AND        REG_FAT.CD_CONVENIO = CONVENIO.CD_CONVENIO
--$P!{CF_COND_CONV}
and         nvl(reg_fat.sn_diagno, 'N') = 'N'
AND        REG_FAT.CD_REG_FAT = ITREG_FAT.CD_REG_FAT
AND        ITREG_FAT.CD_PRESTADOR = PRESTADOR.CD_PRESTADOR
AND        ITREG_FAT.CD_PRO_FAT = PRO_FAT.CD_PRO_FAT
AND        PRO_FAT.SN_PACOTE = 'N'
AND        REG_FAT.CD_ATENDIMENTO =  ATENDIME.CD_ATENDIMENTO
AND        ATENDIME.CD_PACIENTE = PACIENTE.CD_PACIENTE
AND        atendime.Cd_Multi_Empresa = 1
AND	REMESSA.CD_AGRUPAMENTO = ITAGRUPAMENTO.CD_AGRUPAMENTO(+)
AND       ( (ATENDIME.CD_ORI_ATE = ITAGRUPAMENTO.CD_ORI_ATE                         AND
                 REG_FAT.CD_CONVENIO = ITAGRUPAMENTO.CD_CONVENIO                     AND
                 REMESSA.CD_AGRUPAMENTO = ITAGRUPAMENTO.CD_AGRUPAMENTO AND
                 ITAGRUPAMENTO.TP_AGRUPAMENTO = 'H'                          AND
                 REMESSA.CD_AGRUPAMENTO IS NOT NULL )
                OR
                REMESSA.CD_AGRUPAMENTO IS NULL )
AND        CONVENIO.TP_CONVENIO <> 'H'
/*$P!{CF_COND_PRESTA}
$P!{CF_COND_AGRUPA}
$P!{CF_COND_ORI}
$P!{CF_COND_TP_HOSP}
$P!{CF_COND_CREDEN}
$P!{CF_COND_CONV_PART}
$P!{CF_CD_GRU_PRO}
$P!{CF_IMP_PAGA}
$P!{CF_CD_PRO_FAT}
$P!{CF_COND_REPASSE_FAT}*/
UNION
SELECT distinct  TRUNC(ATENDIME.DT_ATENDIMENTO)                    DT_INICIO
              ,TRUNC(ATENDIME.DT_ATENDIMENTO)                    DT_FINAL
              ,ATENDIME.CD_ATENDIMENTO                                  CD_ATENDIMENTO
              ,PACIENTE.CD_PACIENTE                                            CD_PACIENTE
              ,PACIENTE.NM_PACIENTE                                           NM_PACIENTE
              ,PRESTADOR.CD_PRESTADOR                                   CD_PRESTADOR
              ,PRESTADOR.NM_PRESTADOR                                  NM_PRESTADOR
              ,PRESTADOR.CD_REG_REPASSE                               CD_REG_REPASSE
              ,decode('Sim', 'Sim', CONVENIO.CD_CONVENIO, to_number(null) ) CD_CONVENIO
              ,decode('Sim', 'Sim', CONVENIO.NM_CONVENIO, null)             NM_CONVENIO
              ,PRO_FAT.CD_PRO_FAT                                               CD_PRO_FAT
              ,PRO_FAT.DS_PRO_FAT                                               DS_PRO_FAT
              ,ATI_MED.DS_ATI_MED                                                DS_ATI_MED
             ,DECODE( 'Não', 'Não', (ITREG_AMB.VL_TOTAL_CONTA + NVL(ITREG_AMB.VL_DESCONTO,0) - NVL(ITREG_AMB.VL_ACRESCIMO,0)),
                                     'Sim', ITREG_AMB.VL_TOTAL_CONTA)  VALOR_PAGAR
              ,ITREG_AMB.QT_LANCAMENTO                                   QT_LANCAMENTO
             ,TRUNC(REMESSA.DT_ENTREGA_DA_FATURA)         DT_ENTREGA
             ,TO_CHAR(ITREG_AMB.HR_LANCAMENTO, 'HH24:MI')     HR_LANCA
             ,ITREG_AMB.CD_REG_AMB                                                  CONTA
             ,ATENDIME.DT_ATENDIMENTO                                           DT_LANCAMENTO
             ,ITREG_AMB.TP_PAGAMENTO                                        TP_PAGAMENTO
             ,CONVENIO.CD_CONVENIO                                                  CD_CONVENIO2
             ,ITREG_AMB.CD_LANCAMENTO
FROM   DBAMV.ATENDIME                   ATENDIME
            ,DBAMV.PACIENTE                    PACIENTE
            ,DBAMV.CONVENIO                   CONVENIO
            ,DBAMV.ITREG_AMB                 ITREG_AMB
            ,DBAMV.REG_AMB                     REG_AMB
            ,DBAMV.PRO_FAT                      PRO_FAT
            ,DBAMV.PRESTADOR                PRESTADOR
            ,DBAMV.REMESSA_FATURA     REMESSA
            ,DBAMV.FATURA                        FATURA
            ,DBAMV.ITAGRUPAMENTO       ITAGRUPAMENTO
            ,DBAMV.ATI_MED                      ATI_MED
WHERE  1=2 and  --$P!{CF_COND_CONSUMIDO}
                REMESSA.CD_FATURA     = FATURA.CD_FATURA
AND FATURA.DT_COMPETENCIA = To_Date('12/2019','MM/YYYY')
AND        REMESSA.CD_REMESSA = REG_AMB.CD_REMESSA
AND        REG_AMB.CD_REG_AMB = ITREG_AMB.CD_REG_AMB
AND        ITREG_AMB.CD_PRESTADOR = PRESTADOR.CD_PRESTADOR
AND        ITREG_AMB.CD_CONVENIO = CONVENIO.CD_CONVENIO
--$P!{CF_COND_CONV}
AND         ITREG_AMB.CD_ATENDIMENTO = ATENDIME.CD_ATENDIMENTO
AND        ATENDIME.CD_PACIENTE = PACIENTE.CD_PACIENTE
AND         atendime.Cd_Multi_Empresa = 1
AND        ITREG_AMB.CD_PRO_FAT = PRO_FAT.CD_PRO_FAT
AND        PRO_FAT.SN_PACOTE = 'N'
AND        ITREG_AMB.CD_ATI_MED = ATI_MED.CD_ATI_MED(+)
AND        (ATENDIME.CD_ORI_ATE = ITAGRUPAMENTO.CD_ORI_ATE
            AND ITREG_AMB.CD_CONVENIO = ITAGRUPAMENTO.CD_CONVENIO
            AND REMESSA.CD_AGRUPAMENTO = ITAGRUPAMENTO.CD_AGRUPAMENTO
            AND ITAGRUPAMENTO.TP_AGRUPAMENTO = 'A'
            AND REMESSA.CD_AGRUPAMENTO IS NOT NULL )
and         nvl(reg_amb.sn_diagno, 'N') = 'N'
AND        REG_AMB.CD_MULTI_EMPRESA = 1
AND        CONVENIO.TP_CONVENIO <> 'H'
/*$P!{CF_COND_PRESTA}
$P!{CF_COND_AGRUPA}
$P!{CF_COND_TP_AMB}
$P!{CF_CD_PRO_FAT}
$P!{CF_COND_ORI}
$P!{CF_COND_CREDEN_AMB}
$P!{CF_COND_CONV_PART}
$P!{CF_CD_GRU_PRO}
$P!{CF_IMP_PAGA}
$P!{CF_COND_REPASSE_AMB}
*/
UNION
SELECT distinct TRUNC(ATENDIME.DT_ATENDIMENTO)                    DT_INICIO
              ,TRUNC(ATENDIME.DT_ATENDIMENTO)                    DT_FINAL
              ,ATENDIME.CD_ATENDIMENTO                                  CD_ATENDIMENTO
              ,PACIENTE.CD_PACIENTE                                            CD_PACIENTE
              ,PACIENTE.NM_PACIENTE                                           NM_PACIENTE
              ,PRESTADOR.CD_PRESTADOR                                   CD_PRESTADOR
              ,PRESTADOR.NM_PRESTADOR                                  NM_PRESTADOR
              ,PRESTADOR.CD_REG_REPASSE                               CD_REG_REPASSE
              ,decode('Sim', 'Sim', CONVENIO.CD_CONVENIO, to_number(null) ) CD_CONVENIO
              ,decode('Sim', 'Sim', CONVENIO.NM_CONVENIO, null)             NM_CONVENIO
              ,PRO_FAT.CD_PRO_FAT                                               CD_PRO_FAT
              ,PRO_FAT.DS_PRO_FAT                                               DS_PRO_FAT
              ,ATI_MED.DS_ATI_MED                                                DS_ATI_MED
             ,DECODE( 'Não', 'Não', (ITREG_AMB.VL_TOTAL_CONTA + NVL(ITREG_AMB.VL_DESCONTO,0) - NVL(ITREG_AMB.VL_ACRESCIMO,0)),
                                     'Sim', ITREG_AMB.VL_TOTAL_CONTA)  VALOR_PAGAR
              ,ITREG_AMB.QT_LANCAMENTO                                   QT_LANCAMENTO
             ,TRUNC(REMESSA.DT_ENTREGA_DA_FATURA)         DT_ENTREGA
             ,TO_CHAR(ITREG_AMB.HR_LANCAMENTO, 'HH24:MI')     HR_LANCA
             ,ITREG_AMB.CD_REG_AMB                                                  CONTA
             ,ATENDIME.DT_ATENDIMENTO                                           DT_LANCAMENTO
             ,ITREG_AMB.TP_PAGAMENTO                                        TP_PAGAMENTO
             ,CONVENIO.CD_CONVENIO                                                  CD_CONVENIO2
             ,ITREG_AMB.CD_LANCAMENTO
FROM   DBAMV.ATENDIME                   ATENDIME
            ,DBAMV.PACIENTE                    PACIENTE
            ,DBAMV.CONVENIO                   CONVENIO
            ,DBAMV.ITREG_AMB                 ITREG_AMB
            ,DBAMV.REG_AMB                     REG_AMB
            ,DBAMV.PRO_FAT                      PRO_FAT
            ,DBAMV.PRESTADOR                PRESTADOR
            ,DBAMV.REMESSA_FATURA     REMESSA
            ,DBAMV.FATURA                        FATURA
            ,DBAMV.ATI_MED                      ATI_MED
WHERE  1=2 and  --$P!{CF_COND_CONSUMIDO}
           REMESSA.CD_FATURA     = FATURA.CD_FATURA
AND FATURA.DT_COMPETENCIA = To_Date('12/2019','MM/YYYY')
AND        REMESSA.CD_REMESSA = REG_AMB.CD_REMESSA
AND        REG_AMB.CD_REG_AMB = ITREG_AMB.CD_REG_AMB
AND        ITREG_AMB.CD_PRESTADOR = PRESTADOR.CD_PRESTADOR
AND        ITREG_AMB.CD_CONVENIO = CONVENIO.CD_CONVENIO
--$P!{CF_COND_CONV}
AND        ITREG_AMB.CD_ATENDIMENTO = ATENDIME.CD_ATENDIMENTO
AND        ATENDIME.CD_PACIENTE = PACIENTE.CD_PACIENTE
AND          atendime.Cd_Multi_Empresa = 1
AND        ITREG_AMB.CD_PRO_FAT = PRO_FAT.CD_PRO_FAT
AND        PRO_FAT.SN_PACOTE = 'N'
AND        ITREG_AMB.CD_ATI_MED = ATI_MED.CD_ATI_MED(+)
AND        REMESSA.CD_AGRUPAMENTO IS NULL
and        nvl(reg_amb.sn_diagno, 'N') = 'N'
AND        REG_AMB.CD_MULTI_EMPRESA = 1
AND        CONVENIO.TP_CONVENIO <> 'H'

/*$P!{CF_COND_PRESTA}
$P!{CF_COND_ORI}
$P!{CF_COND_CREDEN_AMB}
$P!{CF_COND_CONV_PART}
$P!{CF_CD_PRO_FAT}
$P!{CF_CD_GRU_PRO}
$P!{CF_IMP_PAGA}
$P!{CF_COND_REPASSE_AMB}*/
) tmp
where itr.cd_reg_repasse(+) = tmp.cd_reg_repasse
  and itr.cd_pro_fat(+) = tmp.cd_pro_fat
  and itr.cd_convenio(+) = tmp.cd_convenio
--$P!{CF_ORDEM}
)
ORDER BY QUEBRA_PREST,
NM_PRESTADOR,CD_PRESTADOR,CD_REG_REPASSE,
NM_CONVENIO,CD_CONVENIO,
CD_ATENDIMENTO,DT_INICIO,DT_ENTREGA,CD_PACIENTE,NM_PACIENTE,CONTA,DT_FINAL,
DT_LANCAMENTO,HR_LANCA,CD_PRO_FAT,DS_PRO_FAT,DS_ATI_MED,TP_PAGAMENTO