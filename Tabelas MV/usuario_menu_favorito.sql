--  usuario_menu_favorito


select * from dbasgu.usuario_menu_favorito
WHERE usuario_menu_favorito.cd_usuario = 'DBAMV'
/

INSERT INTO dbasgu.usuario_menu_favorito
(
    CD_USUARIO,
    CD_MENU_FAV, -- <<< CAMPO OBRIGATÓRIO REINCLUÍDO
    CD_MENU_FAV_PAI,
    NR_ORDEM,
    TP_MENU,
    CD_TEXTO,
    NM_MENU,
    CD_MODULO,
    NM_LINK,
    NM_ICON,
    CD_MENU
)
SELECT
    -- 1. NOVO USUÁRIO:
    '264927' AS CD_USUARIO,

    -- 2. CHAMADA DA SEQUENCE PARA GERAR NOVO ID PARA CADA LINHA:
    DBASGU.SEQ_USU_MENU_FAVORITOS.NEXTVAL AS CD_MENU_FAV, -- <<< AQUI ESTÁ A CORREÇÃO

    -- 3. DEMAIS COLUNAS COPIADAS DA ORIGEM ('DBAMV'):
    fav_origem.CD_MENU_FAV_PAI,
    fav_origem.NR_ORDEM,
    fav_origem.TP_MENU,
    fav_origem.CD_TEXTO,
    fav_origem.NM_MENU,
    fav_origem.CD_MODULO,
    fav_origem.NM_LINK,
    fav_origem.NM_ICON,
    fav_origem.CD_MENU

FROM
    dbasgu.usuario_menu_favorito fav_origem

WHERE
    fav_origem.CD_USUARIO = 'DBAMV'

    -- Cláusula para evitar duplicidade:
    AND NOT EXISTS (
        SELECT 1
        FROM dbasgu.usuario_menu_favorito fav_destino
        WHERE
            fav_destino.CD_USUARIO = '264927'
            AND fav_destino.CD_MENU = fav_origem.CD_MENU
    );


/

