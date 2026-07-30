SELECT * FROM tab_fat
WHERE cd_tab_fat IN (180,290)



INSERT INTO val_pro (cd_tab_fat, cd_pro_fat, dt_vigencia, vl_honorario, vl_operacional, vl_total, sn_ativo)
SELECT 290, cd_pro_fat, dt_vigencia, vl_honorario, vl_operacional, vl_total, sn_ativo
FROM val_pro WHERE cd_tab_fat = 180

INSERT INTO VAL_PORTE_MEDICO (cd_tab_fat, cd_PORTE_MEDICO, DT_VIGENCIA, VL_PORTE_MEDICO)
SELECT 290, cd_PORTE_MEDICO, DT_VIGENCIA, VL_PORTE_MEDICO
FROM val_pORTE_MEDICO WHERE cd_tab_fat = 180;

INSERT INTO VAL_PORTE (DT_VIGENCIA, CD_TAB_FAT, CD_POR_ANE, Vl_PORTE)
SELECT DT_VIGENCIA, 290, CD_POR_ANE, Vl_PORTE
FROM VAL_PORTE WHERE CD_TAB_FAT = 180;

INSERT INTO FILME_TAB (CD_TAB_FAT, CD_PRO_fAT, DT_VIGENCIA, NR_INCIDENCIAS, QT_M2_FILME)
SELECT 290, CD_PRO_fAT, DT_VIGENCIA, NR_INCIDENCIAS, QT_M2_FILME
FROM FILME_TAB WHERE CD_TAB_FAT = 180 ;

COMMIT;
/

UPDATE val_pro SET vl_operacional = 0 WHERE vl_operacional = NULL AND cd_tab_fat = 290
/
UPDATE val_pro SET vl_operacional = 0 WHERE vl_operacional IS NULL AND cd_tab_fat = 290
/


