-- query do R_EST_ATEN_ORIGEM
SELECT Decode( aten.TP_ATENDIMENTO, 'I', 'INTERNACAO',
                                    'A', 'AMBULATORIAL',
                                    'E', 'EXTERNO',
                                    'U', 'URGENCIA/EMERGENCIA',
                                    'H', 'HOME CARE',
                                    'O', 'ATENDIMENTO SOS',
                                    'S', 'AIH',
                                    'NAO IDENTIFICADO' ) TP_ATENDIMENTO,
               orig.DS_ORI_ATE,
               orig.CD_ORI_ATE,
               COUNT(*)         QTDATD
FROM    DBAMV.ATENDIME  aten,
               DBAMV.ORI_ATE   orig,
               DBAMV.CONVENIO  conv
WHERE aten.CD_ORI_ATE  =  orig.CD_ORI_ATE
AND       aten.DT_ATENDIMENTO between
to_date(to_char($P{P_DATINI},'dd/mm/yyyy')||' 00:00:00','dd/mm/yyyy HH24:MI:SS') AND to_date(to_char($P{P_DATFIM},'dd/mm/yyyy')||' 23:59:59','dd/mm/yyyy HH24:MI:SS')
AND      aten.CD_CONVENIO = conv.CD_CONVENIO
AND       ATEN.CD_MULTI_EMPRESA = $P{P_CD_MULTI_EMPRESA}  /PDA 205491/
AND       ATEN.CD_ATENDIMENTO_PAI IS NULL
$P!{FC_TIPOATEND}
$P!{CF_ORI_ATE}
$P!{CF_MULTI_EMPRESA}
$P!{CF_CONVENIO}
GROUP BY aten.TP_ATENDIMENTO,
                    orig.DS_ORI_ATE,
                    orig.CD_ORI_ATE
)
ORDER BY TP_ATENDIMENTO, QTDATD  DESC;
