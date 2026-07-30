-- ped_rx
SELECT *
  FROM ped_rx
 WHERE cd_ped_rx = 148534;
/

-- itped_rx
SELECT *
  FROM itped_rx
 WHERE cd_ped_rx IN  ('222116', '222104');  -- cd_itped_rx = 185891 e 185892  -- cd_exa_rx = 296 e 813 ...
/


-- laudo_rx
SELECT *
  FROM laudo_rx
  WHERE cd_laudo IN  ('348840', '340868');
/


SELECT *
  FROM laudo_rx
  WHERE cd_laudo = 348840   AND  cd_ped_rx = 222116

--  WHERE cd_laudo = 340868   AND  cd_ped_rx = 222104
/


-- 1. Desabilitar a FK na tabela correta
ALTER TABLE DBAMV.ITPED_RX
  DISABLE CONSTRAINT ITPED_RX_LAUDO_RX_FK;

-- 2. Executar os DELETEs
DELETE FROM DBAMV.LAUDO_RX
 WHERE cd_laudo  = 348840
   AND cd_ped_rx = 222116;

DELETE FROM DBAMV.LAUDO_RX
 WHERE cd_laudo  = 340868
   AND cd_ped_rx = 222104;

-- 3. Confirmar
COMMIT;

-- 4. Reabilitar a FK
ALTER TABLE DBAMV.ITPED_RX
  ENABLE CONSTRAINT ITPED_RX_LAUDO_RX_FK;

ALTER TABLE DBAMV.ITPED_RX ENABLE NOVALIDATE CONSTRAINT ITPED_RX_LAUDO_RX_FK;
/

-- mvto_estoque
SELECT *
  FROM mvto_estoque
 WHERE cd_itped_rx = 185891;  -- cd_mvto_estoque = 2784386
/

-- itmvto_estoque
SELECT *
  FROM itmvto_estoque
 WHERE cd_mvto_estoque = 2784386;


-- itmvto_estoque_custo
SELECT *
  FROM itmvto_estoque_custo
 WHERE cd_mvto_estoque = 2784386;



