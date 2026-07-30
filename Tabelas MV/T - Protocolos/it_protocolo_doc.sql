SELECT * FROM it_protocolo_doc;
/
SELECT *
FROM (
    SELECT *
    FROM it_protocolo_doc
    ORDER BY cd_protocolo_doc DESC
)
WHERE cd_protocolo_doc = '92676';
/


SELECT * FROM dbamv.protocolo_doc WHERE cd_protocolo_doc = 92676
SELECT sn_ativo FROM dbamv.setor WHERE cd_setor = 5

C_PROT_DOC    - Consulta de moviemtação
M_PROT_ENVIO - Envio de Documentos

                       dbamv.M_PKG_GLOBAL_SETOR

                      Pkg_MOVDOC_M_PROT_ENVIO.P_CHK_M_PROT_ENVIO_SETOR_DE

                       dbamv.pkg_pari_int_pacok

        SELECT * FROM audit_dbamv.protocolo_doc WHERE cd_protocolo_doc = 92676



        SELECT * FROM all_source WHERE Upper(text) LIKE Upper('%insert into dbamv.protocolo_doc%');



                         PKG_MOVDOC_PASTA_PARCIAL