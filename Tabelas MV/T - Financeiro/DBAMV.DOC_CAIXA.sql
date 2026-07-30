SELECT * FROM mov_caixa
WHERE cd_doc_caixa =  34503;

SELECT * FROM caixa;
13 CAIXA INC IMAGEM

SELECT * FROM doc_caixa
WHERE nr_documento = '201857';
-- ORDER by nr_documento ASC;


SELECT cd_doc_caixa,tp_doc_caixa,nr_documento, ds_documento, cd_fin_car  FROM doc_caixa
WHERE cd_fin_car = 3
ORDER BY cd_doc_caixa ASC;


SELECT cd_doc_caixa, ds_documento, cd_fin_car, nr_documento FROM doc_caixa
WHERE cd_doc_caixa =  34503;

-- ORDER BY cd_doc_caixa ASC;


----------------------------------------------------------

SELECT *
FROM mov_caixa
ORDER BY cd_lote_caixa  desc;

SELECT cd_lote_caixa, ds_mov_caixa, cd_doc_caixa, ds_movimentacao_processo
FROM mov_caixa
WHERE cd_doc_caixa = 34503;
-- ORDER BY cd_lote_caixa  desc;

-- lote - cd_lote_caixa
-- Código - cd_doc_caixa


SELECT *
FROM mov_caixa
WHERE cd_doc_caixa = 34507;

