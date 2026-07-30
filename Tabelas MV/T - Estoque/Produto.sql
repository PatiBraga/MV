SELECT CD_PRODUTO, SN_CONSIGNADO FROM DBAMV.PRODUTO
WHERE CD_PRODUTO IN (17662,2102,1625,1757,1759,3971)


SELECT * FROM DBAMV.LOT_PRO
WHERE CD_PRODUTO = 17662
AND QT_ESTOQUE_ATUAL > 0

SELECT e.cd_ent_pro, e.dt_entrada, e.tp_documento_entrada, e.cd_estoque, e.cd_fornecedor, i.cd_produto, l.cd_lote, l.dt_validade, l.qt_ent_pro
FROM dbamv.ent_pro e, dbamv.itent_pro i, dbamv.itlot_ent l
WHERE e.cd_ent_pro = i.cd_ent_pro
AND i.cd_itent_pro = l.cd_itent_pro
AND i.cd_produto = 17662
AND l.cd_lote = '210716001'
ORDER BY dt_entrada DESC

543 2
304 1

SELECT ( e.qt_estoque_consignado
- e.qt_estoque_consumido
+ e.qt_estoque_transferencia
- e.qt_baixada ) saldo_atual, e.*
FROM dbamv.est_consig_forn e
WHERE cd_produto = 3971
--AND cd_fornecedor =  3172
AND cd_estoque = 19

UPDATE dbamv.est_consig_forn
SET qt_estoque_consignado = qt_estoque_consignado + 4
WHERE cd_produto = 3971
AND cd_estoque = 19
AND cd_fornecedor = 543


ENTRADA
17662

CORRIGIR
2102 - 409
1625 - 409
1757 - 543
1759 - 543
3971 - 543

3971
543