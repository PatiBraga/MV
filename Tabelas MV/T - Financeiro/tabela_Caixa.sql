select * from caixa
select * from abre_caixa
select * from mov_caixa

select * from caixa
select * from lote_caixa (CD_CAIXA)
select * from mov_caixa (CD_LOTE_CAIXA)


SELECT    
        lote_caixa.Cd_Caixa,
        DECODE(MOV_CAIXA.TP_MOVIMENTACAO,'S','2','E','1') TP_MOVIMENTACAO,
        PROCESSO.DS_PROCESSO,
        MOV_CAIXA.DT_MOVIMENTACAO,
    CASE 
        WHEN MOV_CAIXA.TP_MOVIMENTACAO = 'S' THEN MOV_CAIXA.VL_MOVIMENTACAO * -1
        ELSE MOV_CAIXA.VL_MOVIMENTACAO
    END AS VL_MOVIMENTACAO,
        MOV_CAIXA.CD_PROCESSO,
        PROCESSO.DS_PROCESSO,
        MOV_CAIXA.DS_MOVIMENTACAO_PADRAO,
        MOV_CAIXA.DS_MOVIMENTACAO_PROCESSO,
        MOV_CAIXA.DS_MOV_CAIXA
        
FROM MOV_CAIXA 
     INNER join PROCESSO ON PROCESSO.CD_PROCESSO = MOV_CAIXA.CD_PROCESSO
     inner join lote_caixa on lote_caixa.cd_lote_caixa = mov_caixa.cd_lote_caixa
     /inner join caixa on caixa.cd_caixa =  lote_caixa.cd_caixa/
Where
      mov_caixa.dt_movimentacao > '01-JAN-2025' AND 
      PROCESSO.CD_MULTI_EMPRESA = 1
order by 1,2,3


--  CHECA O LOTE
SELECT LC.*,ROWID FROM LOTE_CAIXA LC
WHERE LC.CD_LOTE_CAIXA=1081;

-- LISTA OS MOVIMENTOS DE CAIXA DO DIA
SELECT * FROM MOV_CAIXA A
WHERE A.CD_LOTE_CAIXA=1081
AND TRUNC(A.DT_MOVIMENTACAO) = '31/05/2017'
ORDER BY 1 ASC;

--  LISTA DE ABERTURA DO CAIXA
SELECT AC.*,ROWID FROM ABRE_CAIXA AC WHERE AC.CD_LOTE_CAIXA=1081
order by 1 asc;