SELECT
CD_MODULO,
    SUBSTR(
        REPLACE(RTRIM(FNC_OBTEM_MENU(CD_MENU), '/ '), '>', '/'),
        1,
        LENGTH(REPLACE(RTRIM(FNC_OBTEM_MENU(CD_MENU), '/ '), '>', '/')) - 2
    ) || ' (' || CD_MODULO || ')' AS NM_MENU
FROM
    DBASGU.MENU
WHERE
    TP_MENU = 'T'
AND CD_MODULO LIKE UPPER('M_LAN_AMB');



SELECT
    CD_MODULO,
    SUBSTR(
        REPLACE(RTRIM(FNC_OBTEM_MENU(CD_MENU), '/ '), '>', '/'),
        1,
        LENGTH(REPLACE(RTRIM(FNC_OBTEM_MENU(CD_MENU), '/ '), '>', '/')) - 2
    ) || ' (' || CD_MODULO || ')' AS NM_MENU
FROM
    DBASGU.MENU
ORDER BY cd_modulo;

