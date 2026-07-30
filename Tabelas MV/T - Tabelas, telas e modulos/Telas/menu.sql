       SELECT
    m.tp_perfil,
    s.nm_sistema,
    s.cd_produto,
    m.cd_sistema_dono,
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
    m.sn_html5,
    m.sn_bike,
    m.sn_utiliza_customizacao,
    -- Nome do menu
    SUBSTR(
        REPLACE(RTRIM(FNC_OBTEM_MENU(me.CD_MENU), '/ '), '>', '/'),
        1,
        LENGTH(REPLACE(RTRIM(FNC_OBTEM_MENU(me.CD_MENU), '/ '), '>', '/')) - 2
    ) || ' (' || me.CD_MODULO || ')' AS NM_MENU
FROM dbasgu.modulos m
FULL JOIN sistema s ON m.cd_sistema_dono = s.cd_sistema
FULL OUTER JOIN DBASGU.MENU me ON m.cd_modulo = me.cd_modulo
-- WHERE me.TP_MENU = 'T'
ORDER BY m.cd_sistema_dono;
