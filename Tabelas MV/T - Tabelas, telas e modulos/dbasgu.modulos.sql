/*
Explicação:
JOIN: Utilizamos o JOIN para combinar as duas tabelas, especificando a condição m.cd_sistema_dono = s.cd_sistema, que é a chave de ligação entre elas.
Alias: Usamos m como alias para a tabela modulos e s como alias para a tabela sistema para tornar o código mais legível.
ORDER BY: A ordenação é feita com base na coluna cd_sistema_dono da tabela modulos.
Esse código traz as colunas das duas tabelas de forma combinada, ordenadas pelo campo cd_sistema_dono.
*/

-- JOIN

SELECT 
    s.nm_sistema,
    m.cd_sistema_dono,
    s.cd_produto,
    m.nm_modulo,
    m.cd_modulo, 
    m.tp_modulo, 
    m.ds_observacao, 
    m.cd_cliente, 
    m.cd_help,
    m.dt_criacao, 
    m.sn_ativo_rel_especifico,
    m.sn_armazena_parametro,
    m.sn_cf_acesso,
    m.ds_menu_principal,
    m.ds_tipo_segmento,
    m.sn_seg_ativo,
    m.tp_tela,
    m.ds_caminho,
    m.lo_icone,
    m.tp_perfil,
    m.sn_html5,
    m.sn_bike,
    m.sn_utiliza_customizacao
FROM dbasgu.modulos m
JOIN sistema s ON m.cd_sistema_dono = s.cd_sistema
ORDER BY m.cd_sistema_dono;



/*
Explicação:
FULL JOIN: Um FULL JOIN retorna todos os registros de ambas as tabelas. Se não houver correspondência, os campos da tabela que não têm correspondência serão preenchidos com NULL.
ON m.cd_sistema_dono = s.cd_sistema: Condição para combinar as duas tabelas com base na coluna cd_sistema_dono da tabela modulos e cd_sistema da tabela sistema.
ORDER BY m.cd_sistema_dono: A ordenação é feita pela coluna cd_sistema_dono da tabela modulos.
*/
-- FULL JOIN


Fazer dos dois selects um só, trazer o nm_menu da tabela  DBASGU.MENU 

SELECT 
    m.cd_modulo, 
    m.nm_modulo,
    m.tp_modulo, 
    m.ds_observacao, 
    m.cd_cliente, 
    m.cd_help,
    m.dt_criacao,
    m.cd_sistema_dono, 
    m.sn_ativo_rel_especifico,
    m.sn_armazena_parametro,
    m.sn_cf_acesso,
    m.ds_menu_principal,
    m.ds_tipo_segmento,
    m.sn_seg_ativo,
    m.tp_tela,
    m.ds_caminho,
    m.lo_icone,
    m.tp_perfil,
    m.sn_html5,
    m.sn_bike,
    m.sn_utiliza_customizacao,
    s.nm_sistema, 
    s.cd_produto
FROM dbasgu.modulos m
FULL JOIN sistema s ON m.cd_sistema_dono = s.cd_sistema
ORDER BY m.cd_sistema_dono;



SELECT 
    CD_MODULO,
    SUBSTR(
        REPLACE(RTRIM(FNC_OBTEM_MENU(CD_MENU), '/ '), '>', '/'),
        1,
        LENGTH(REPLACE(RTRIM(FNC_OBTEM_MENU(CD_MENU), '/ '), '>', '/')) - 2
    ) || ' (' || CD_MODULO || ')' AS NM_MENU
FROM 
    DBASGU.MENU





SELECT 
    s.nm_sistema,
    m.cd_sistema_dono,
    s.cd_produto,
    m.nm_modulo,
    m.cd_modulo, 
    m.tp_modulo, 
    m.ds_observacao, 
    m.sn_ativo_rel_especifico,
    m.sn_armazena_parametro,
    m.sn_cf_acesso,
    m.ds_menu_principal,
    m.tp_tela,
    m.ds_caminho,
    m.lo_icone,
    m.tp_perfil,
    m.sn_html5,
    m.sn_bike,
    m.sn_utiliza_customizacao,
    m.dt_criacao,
    m.ds_tipo_segmento,
    m.sn_seg_ativo,
    m.cd_cliente, 
    m.cd_help
FROM dbasgu.modulos m
FULL JOIN sistema s ON m.cd_sistema_dono = s.cd_sistema
ORDER BY m.cd_sistema_dono;





-- TABELA dbasgu.modulos
SELECT cd_modulo, 
nm_modulo,
tp_modulo, 
ds_observacao, 
cd_cliente, 
cd_help,
dt_criacao,
cd_sistema_dono, 
sn_ativo_rel_especifico,
sn_armazena_parametro,
sn_cf_acesso,
ds_menu_principal,
ds_tipo_segmento,
sn_seg_ativo,
tp_tela,
ds_caminho,
lo_icone,
tp_perfil,
sn_html5,
sn_bike,
sn_utiliza_customizacao
FROM dbasgu.modulos
ORDER BY cd_sistema_dono;


-- TABELA sistema
SELECT cd_sistema, 
nm_sistema, 
cd_produto 
FROM sistema;