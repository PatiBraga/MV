-- Documentos anexados
SELECT * FROM dbamv.arquivo_atendimento a, dbamv.arquivo_documento b, dbamv.pw_documento_clinico p
WHERE a.cd_arquivo_documento  =  b.cd_arquivo_documento
AND a.cd_documento_clinico = p.cd_documento_clinico
AND a.cd_paciente =1168333


SELECT * FROM dbamv.arquivo_atendimento
SELECT * FROM dbamv.arquivo_documento
SELECT * FROM dbamv.pw_documento_clinico