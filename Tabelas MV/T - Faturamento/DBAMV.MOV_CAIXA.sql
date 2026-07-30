SELECT *
FROM mov_caixa
ORDER BY cd_lote_caixa  desc;

SELECT cd_lote_caixa, ds_mov_caixa, cd_doc_caixa, ds_movimentacao_processo
FROM mov_caixa
WHERE cd_doc_caixa = 34503;
-- ORDER BY cd_lote_caixa  desc;

-- lote - cd_lote_caixa
-- C�digo - cd_doc_caixa


SELECT *
FROM mov_caixa
WHERE cd_doc_caixa = 34507;







