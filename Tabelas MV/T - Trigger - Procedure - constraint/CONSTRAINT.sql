/*
Se o sistema MV estiver em uso intenso e você não puder esperar o tempo de validação
de todos os registros da tabela, use o NOVALIDATE. Isso habilita a regra para
novos registros imediatamente, sem conferir os antigos (o que evita o lock prolongado)
*/

ALTER TABLE DBAMV.PED_RX ENABLE NOVALIDATE CONSTRAINT PED_RX_PRESTADOR_FK;

-- DESABILITAR CONSTRAINT
ALTER TABLE DBAMV.PED_RX DISABLE NOVALIDATE CONSTRAINT PED_RX_PRESTADOR_FK;

-- HABILITAR CONSTRAINT
ALTER TABLE DBAMV.PED_RX ENABLE CONSTRAINT PED_RX_PRESTADOR_FK;


-----------------------------------------------------------------------------------------------------------------------------


?? Explicação detalhada (frase a frase)
ALTER TABLE DBAMV.PED_RX
• Modifica a estrutura da tabela PED_RX no schema DBAMV.

ENABLE
• Ativa a constraint (Foreign Key).

NOVALIDATE
• NÃO verifica os dados que já existem na tabela.
• Ignora registros antigos que possam violar a regra.
• Evita lock prolongado e erro ORA-00054.

CONSTRAINT PED_RX_PRESTADOR_FK
• Nome da Foreign Key que liga PED_RX à tabela PRESTADOR (ou PRESTADOR_EXTERNO).