-- Controle canal de integração
SELECT *
FROM dbamv.control_integ_carestream
WHERE cd_itped_rx = '204178'
ORDER by dt_integra desc
FETCH FIRST 500 ROWS ONLY;
/
SELECT *
FROM dbamv.control_integ_carestream
WHERE cd_itped_rx = ''
ORDER by dt_integra desc
FETCH FIRST 500 ROWS ONLY;
/

SELECT * FROM view_integracao_carestream
ORDER by "date" DESC;


/
--
SELECT *
FROM dbamv.itped_rx
WHERE cd_itped_rx = '260339'
ORDER BY dt_entrega desc
FETCH FIRST 500 ROWS ONLY
/

SELECT
FROM PED_RX



SELECT *
 /*   site,
    patient_id,
    patient_name,
    TO_CHAR(TO_DATE(patient_birthdate, 'YYYYMMDD'), 'YYYY-MM-DD') AS patient_birthdate,
    patient_class,
    accession_number,
    visit_number,
    referring_physician_id,
 --   TO_CHAR(TO_DATE("date", 'YYYYMMDD'), 'YYYY-MM-DD') AS "date",
    nr_atendimento   */
FROM dbamv.view_integracao_carestream
ORDER BY nr_atendimento desc
FETCH FIRST 300 ROWS ONLY;

/

SELECT *
FROM IMV_LOG_REQUISICAO
WHERE nm_servico = 'LAUDO_EXAME_IMAGEM'
      AND
ORDER BY dh_criacao_log DESC
FETCH FIRST 300 ROWS ONLY;
/

SELECT * FROM dbamv.ped_rx WHERE cd_ped_rx =  '204003';

SELECT * FROM dbamv.itped_rx WHERE cd_ped_rx =  '204003';

SELECT * FROM dbamv.laudo_rx WHERE cd_ped_rx =  '204003';





