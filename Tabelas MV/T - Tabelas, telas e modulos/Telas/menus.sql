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
    s.cd_produto,

    -- Nome do menu (adicionado)
    SUBSTR(
        REPLACE(RTRIM(FNC_OBTEM_MENU(menu.cd_menu), '/ '), '>', '/'),
        1,
        LENGTH(REPLACE(RTRIM(FNC_OBTEM_MENU(menu.cd_menu), '/ '), '>', '/')) - 2
    ) || ' (' || menu.cd_modulo || ')' AS nm_menu

FROM dbasgu.modulos m
FULL JOIN sistema s
    ON m.cd_sistema_dono = s.cd_sistema

LEFT JOIN (
    SELECT cd_modulo, cd_menu, tp_menu
    FROM dbasgu.menu
  --  WHERE tp_menu = 'T'
) menu
    ON m.cd_modulo = menu.cd_modulo

ORDER BY m.cd_sistema_dono;
