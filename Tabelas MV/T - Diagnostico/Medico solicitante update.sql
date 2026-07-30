-- Select ped_rx
SELECT *
FROM ped_rx
WHERE cd_ped_rx =  '213936'

-- Verifica se o prestador esta cadastro
SELECT * FROM dbamv.prestador_externo
WHERE nr_conselho = '14785';

-- Vincular o prestador externo ao pedido  para que as informações do prestador externo, apareça ao clicar no botão externo.
INSERT INTO DBAMV.PED_RX_PRESTADOR_EXTERNO (cd_ped_rx, cd_pres_ext)
VALUES ('213936', 5877);

-- Realizar o update na ped_rx para o nome do médico sair no campo médico solicitante
UPDATE ped_rx
SET cd_prestador = 'null'
 nm_prestador = 'ERON FABIO MIRANDA',
 nr_crm_prestador = '14785'
WHERE cd_ped_rx = '213936';
COMMIT;









