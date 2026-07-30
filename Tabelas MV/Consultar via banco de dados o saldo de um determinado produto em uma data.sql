--  Consultar via banco de dados o saldo de um determinado produto em uma data


-- Rodar uma vez
BEGIN
  PKG_MV2000.Atribui_Empresa(5);
END;
/

-- Buscar saldo do dia retroativo:
SELECT
    p.cd_produto,
    DBAMV.fnc_mges_saldo_anterior(17, p.cd_produto, TO_DATE('01/01/2024', 'DD/MM/YYYY')) AS saldo_anterior
FROM dbamv.produto p
WHERE p.cd_produto IN (8707)
ORDER BY p.cd_produto;


 na função :

DBAMV.fnc_mges_saldo_anterior(17, p.cd_produto, TO_DATE('01/01/2024', 'DD/MM/YYYY')) AS saldo_anterior


tu coloca o estoque| o produto e a data desejada.