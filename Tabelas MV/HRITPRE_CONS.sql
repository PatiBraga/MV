--
SELECT * FROM DBAMV.HRITPRE_CONS
WHERE  cd_itpre_med IN (

SELECT * FROM dbamv.hritpre_med
WHERE  cd_itpre_med IN (

SELECT * FROM dbamv.log_hritpre_med

SELECT * FROM dbamv.fechamento_pagu