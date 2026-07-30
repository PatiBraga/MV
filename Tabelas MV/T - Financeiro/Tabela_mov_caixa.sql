SELECT cd_caixa,
 ds_caixa, 
 SUM(tot_ent) AS tot_ent,
 SUM(tot_sai) AS tot_sai,
 tp_rec
FROM (
 SELECT lote_caixa.cd_caixa,
 caixa.ds_caixa, -- Adicionado ds_caixa
 mov_caixa.cd_lote_caixa,
 mov_caixa.cd_doc_caixa,
 doc_caixa.nr_documento,
 SUM(vl_movimentacao) AS tot_sai,
 SUM(0) AS tot_ent,
 DECODE(mov_caixa.cd_doc_caixa,
 NULL, 'Dinheiro',
 DECODE(doc_caixa.tp_doc_caixa,
 '2', 'Cheque',
 '3', 'Cartão',
 '4', 'TEF',
 '5', 'Promissoria',
 '6', 'Duplicata'
 )
 ) AS tp_rec
 FROM dbamv.mov_caixa,
 dbamv.doc_caixa,
 dbamv.lote_caixa,
 dbamv.caixa
 WHERE mov_caixa.cd_doc_caixa = doc_caixa.cd_doc_caixa(+)
 AND dt_cancelamento IS NULL
 AND mov_caixa.cd_lote_caixa = lote_caixa.cd_lote_caixa
 AND lote_caixa.cd_caixa = caixa.cd_caixa -- Relacionado com tabela caixa
 AND lote_caixa.cd_caixa = 1 -- Condição CD_CAIXA = 1
 AND tp_movimentacao = 'S'
 AND mov_caixa.cd_lote_caixa = (
 SELECT MAX(cd_lote_caixa) 
 FROM dbamv.lote_caixa 
 WHERE cd_caixa = 1 -- Considera apenas o lote mais atual para o caixa 1
 )
 GROUP BY lote_caixa.cd_caixa, caixa.ds_caixa, mov_caixa.cd_lote_caixa, mov_caixa.cd_doc_caixa, doc_caixa.nr_documento,
 doc_caixa.tp_doc_caixa

 UNION ALL

 SELECT lote_caixa.cd_caixa,
 caixa.ds_caixa, -- Adicionado ds_caixa
 mov_caixa.cd_lote_caixa,
 mov_caixa.cd_doc_caixa,
 doc_caixa.nr_documento,
 SUM(0) AS tot_sai,
 SUM(vl_movimentacao) AS tot_ent,
 DECODE(mov_caixa.cd_doc_caixa,
 NULL, 'Dinheiro',
 DECODE(doc_caixa.tp_doc_caixa,
 '2', 'Cheque',
 '3', 'Cartão',
 '4', 'TEF',
 '5', 'Promissoria',
 '6', 'Duplicata'
 )
 ) AS tp_rec
 FROM dbamv.mov_caixa,
 dbamv.doc_caixa,
 dbamv.lote_caixa,
 dbamv.caixa
 WHERE mov_caixa.cd_doc_caixa = doc_caixa.cd_doc_caixa(+)
 AND dt_cancelamento IS NULL
 AND mov_caixa.cd_lote_caixa = lote_caixa.cd_lote_caixa
 AND lote_caixa.cd_caixa = caixa.cd_caixa -- Relacionado com tabela caixa
 AND lote_caixa.cd_caixa = 1 -- Condição CD_CAIXA = 1
 AND tp_movimentacao = 'E'
 AND mov_caixa.cd_lote_caixa = (
 SELECT MAX(cd_lote_caixa) 
 FROM dbamv.lote_caixa 
 WHERE cd_caixa = 1 -- Considera apenas o lote mais atual para o caixa 1
 )
 GROUP BY lote_caixa.cd_caixa, caixa.ds_caixa, mov_caixa.cd_lote_caixa, mov_caixa.cd_doc_caixa, doc_caixa.nr_documento,
 doc_caixa.tp_doc_caixa
)
GROUP BY cd_caixa, ds_caixa, tp_rec
ORDER BY ds_caixa