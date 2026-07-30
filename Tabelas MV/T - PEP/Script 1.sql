   SELECT * FROM dbamv.atendime WHERE cd_atendimento = 1089921

   SELECT * FROM dbamv.atendime WHERE cd_paciente = '330406';


  SELECT * FROM dbamv.paciente WHERE cd_paciente = 154226


  SELECT * FROM DBAMV.PW_DOCUMENTO_CLINICO WHERE cd_paciente = '330406' AND  tp_status = 'ABERTO' -- AND cd_tipo_documento IN (35)



   SELECT * FROM DBAMV.PW_TIPO_DOCUMENTO ORDER BY 2




   UPDATE PW_DOCUMENTO_CLINICO SET TP_STATUS = 'CANCELADO' WHERE CD_DOCUMENTO_CLINICO IN  (7596227, 7791705, 7735704)




SELECT *
FROM DBAMV.PW_DOCUMENTO_CLINICO dc
INNER JOIN DBAMV.PW_TIPO_DOCUMENTO td
    ON dc.cd_tipo_documento = td.cd_tipo_documento
WHERE
    dc.cd_paciente = '330406'
    AND dc.tp_status = 'ABERTO'
  --  AND dc.cd_atendimento = '1089921'
ORDER BY
    dh_referencia DESC;




