-- Deletar Pedido
-- Validar se tem laudo, exame (deletar), após realizar a exlusão do pedido. 

SELECT * 
FROM atendime
WHERE cd_atendimento = '1017079';


-- Deletar o Laudo
SELECT * FROM LAUDO_RX
WHERE cd_ped_rx  = '161352'; 

DELETE FROM LAUDO_RX
WHERE cd_laudo = '262784' AND cd_ped_rx =  '161352';


-- Deletar exame
SELECT * FROM itped_rx
WHERE cd_ped_rx = '161352';

ALTER TRIGGER MVINTEGRA.TRG_IMVW_SAI_ITSOLIC_PSDI disable;
 
DELETE FROM itped_rx
WHERE cd_ped_rx = '161352' and cd_exa_rx = '1110';

ALTER TRIGGER MVINTEGRA.TRG_IMVW_SAI_ITSOLIC_PSDI enable;


-- Deletar o pedido
SELECT * FROM PED_RX
WHERE CD_PED_RX = 161352;

DELETE FROM PED_RX
WHERE CD_PED_RX = '161352' AND cd_atendimento = '1017079';

///////////////////////////////////////////////////////////////////////////////////////////////////

-- Pedidio 173012

SELECT * 
FROM itped_rx
WHERE cd_ped_rx = 173012; 
/

-- Validar laudo

SELECT cd_laudo, cd_ped_rx
FROM LAUDO_RX
WHERE cd_ped_rx IN ('173012', '173014')

/

ALTER TRIGGER MVINTEGRA.TRG_IMVW_SAI_ITSOLIC_PSDI disable;
ALTER TRIGGER DBAMV.TRG_ITPED_RX_LOG_EXCLUSAO disable;

/
DELETE 
FROM itped_rx
WHERE cd_ped_rx = '173012' 
  AND cd_exa_rx IN ('1114', '1049');
/
DELETE FROM PED_RX 
WHERE CD_PED_RX = 173012;
/
DELETE 
FROM ped_rx_prestador_externo 
WHERE  CD_PED_RX = 173012;
//
-- Pedido 173014 
SELECT * 
FROM itped_rx
WHERE cd_ped_rx = 173014; 
/
DELETE 
FROM itped_rx
WHERE cd_ped_rx = '173014' 
  AND cd_exa_rx IN ('1098','1156','273','256');
/
SELECT *
FROM PED_RX
WHERE cd_ped_rx = 173014;
/
DELETE FROM PED_RX 
WHERE CD_PED_RX = 173014;

/
ALTER TRIGGER MVINTEGRA.TRG_IMVW_SAI_ITSOLIC_PSDI enable;


----------------------------------------------------------------------------------------------------------

  SELECT * 
  FROM ped_rx 
  WHERE cd_ped_rx = 213662


  SELECT *
  FROm itped_rx
  WHERE cd_ped_rx = 213662


SELECT * FROM LAUDO_RX
WHERE cd_ped_rx  = '213662'; 



ALTER TRIGGER MVINTEGRA.TRG_IMVW_SAI_ITSOLIC_PSDI enable;
ALTER TRIGGER DBAMV.TRG_ITPED_RX_LOG_EXCLUSAO enable;

DELETE 
FROM itped_rx
WHERE cd_ped_rx = 213662 
  AND cd_exa_rx = 935;

-----------------------------------------------

DELETE FROM dbamv.ped_rx
WHERE cd_ped_rx = 213662;

