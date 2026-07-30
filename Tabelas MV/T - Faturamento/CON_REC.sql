SELECT
    C.CD_CON_REC                              AS CODIGO,
    C.CD_FORNECEDOR                           AS CLIENTE,
    C.NM_CLIENTE                              AS NOME_DO_CLIENTE,
    C.NR_DOCUMENTO                            AS NR_DOCUMENTO,
    C.DT_EMISSAO                              AS DT_EMISSAO,

    TO_CHAR(I.VL_DUPLICATA, 'FM999G999G990D00')       AS VALOR_DUPLI,
    TO_CHAR(I.VL_SOMA_RECEBIDO, 'FM999G999G990D00')   AS VALOR_RECEB,
    TO_CHAR(I.VL_MOEDA, 'FM999G999G990D00')           AS VALOR_A_RECEB,
    I.TP_QUITACAO                             AS TIPO_DE_QUITACAO,
    RF.CD_REMESSA                             AS REMESSA,
    RF.NR_SEQ_LOTE                            AS LOTE,
    RF.CD_FATURA                              AS NF_NR_DOCUMENTO
FROM
    CON_REC C
JOIN ITCON_REC I
    ON I.CD_CON_REC = C.CD_CON_REC
LEFT JOIN REMESSA_FATURA RF
    ON RF.CD_REMESSA = C.CD_REMESSA

--WHERE tp_con_rec = 'C'
ORDER BY
    C.CD_CON_REC DESC
FETCH FIRST 100 ROWS ONLY;




 SELECT * FROM REMESSA
 ORDER BY cd_remessa desc
FETCH FIRST 100 ROWS ONLY;


lote