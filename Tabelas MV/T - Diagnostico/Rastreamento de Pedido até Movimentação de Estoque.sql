Fluxo de Consultas
1. Consulta ao Pedido de RX

SELECT * FROM ped_rx WHERE cd_ped_rx = 148534;
Recupera os dados do pedido de exame identificado pelo código 148534.


2. Itens do Pedido

SELECT * FROM itped_rx WHERE cd_ped_rx = 148534;
Retorna os itens vinculados ao pedido, via tabela itped_rx.


3. Laudo Associado

SELECT * FROM laudo_rx WHERE cd_ped_rx = 148534;
Consulta o laudo gerado para o pedido.


4. Movimentação de Estoque pelo Item

SELECT * FROM mvto_estoque WHERE cd_itped_rx = 185891;
-- cd_mvto_estoque = 2784386
Localiza a movimentação de estoque relacionada ao item do pedido.


5. Itens da Movimentação

SELECT * FROM itmMvto_estoque WHERE cd_mvto_estoque = 2784386;
Lista os produtos movimentados com quantidades, datas e estoque de origem.


6. Custos da Movimentação

SELECT * FROM itmMvto_estoque_custo WHERE cd_mvto_estoque = 2784386;
Detalha os custos unitários e totais associados à movimentação.

Resultado Retornado — Tabela itmMvto_estoque
Campo	Descrição
cd_itmvto_estoque	Identificador único do item de movimento
cd_mvto_estoque	Código da movimentação (2784386)
cd_produto	Código do produto movimentado
qt_movimento	Quantidade movimentada
dh_mvto_estoque	Data/hora do movimento (ex.: 03/02/2025 21:36:07)
cd_estoque	Identificador do almoxarifado (ex.: 24)

Conclusão
O rastreamento demonstra o caminho completo de um pedido de exame até o consumo de materiais no estoque, passando pelas entidades: Pedido → Item do Pedido → Laudo → Movimentação → Itens Movimentados → Custos.

