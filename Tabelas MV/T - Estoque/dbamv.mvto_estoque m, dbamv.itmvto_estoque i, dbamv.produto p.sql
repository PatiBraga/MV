SELECT m.cd_mvto_estoque, M.TP_MVTO_ESTOQUE, M.CD_AVISO_CIRURGIA, m.cd_estoque, m.cd_estoque_destino, m.dt_mvto_estoque, i.cd_produto, i.cd_uni_pro, i.qt_movimentacao
FROM dbamv.mvto_estoque m, dbamv.itmvto_estoque i, dbamv.produto p
WHERE m.cd_mvto_estoque = i.cd_mvto_estoque
AND i.cd_produto = p.cd_produto
AND m.cd_aviso_cirurgia = 57995
AND p.sn_consignado = 'S'
ORDER BY 1 DESC

SELECT * FROM DBAMV.AVISO_CIRURGIA
WHERE CD_AVISO_CIRURGIA = 57995