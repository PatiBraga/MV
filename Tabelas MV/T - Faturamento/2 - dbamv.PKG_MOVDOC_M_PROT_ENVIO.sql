dbamv.PKG_MOVDOC_M_PROT_ENVIO
/
select valor
from dbamv.configuracao
  where cd_sistema = 'MOVDOC' and chave = 'SN_VALIDA_DEVO_PROT_SETOR'
	and cd_multi_empresa = 1
/

 --Cursor c_conta_fat Is
        Select Distinct a.dt_recebimento,
               a.dt_devolucao,
               a.cd_protocolo_doc,
               a.cd_reg_fat cd_reg_amb,
               b.cd_setor,
               b.cd_setor_destino
        From it_protocolo_doc a, protocolo_doc b
        Where a.cd_protocolo_doc = b.cd_protocolo_doc
          AND  'I' in ('H','B','HO','I','T')
          And a.cd_reg_fat       = 102712
          And a.cd_protocolo_doc = ( select max(i.cd_protocolo_doc)
                                     From it_protocolo_doc i
                                     Where i.cd_documento_prot = pit_protocolo_doc.cd_documento_prot
                                      and  i.cd_reg_fat = 102712 )
        union
        Select Distinct a.dt_recebimento,
               a.dt_devolucao,
               a.cd_protocolo_doc,
               a.cd_reg_amb,
               b.cd_setor,
               b.cd_setor_destino
        From it_protocolo_doc a, protocolo_doc b
        Where a.cd_protocolo_doc = b.cd_protocolo_doc
          AND  'I' in ('U','E','AM','A','T')
          And a.cd_reg_amb       = 102712
          And a.cd_protocolo_doc = ( select max(i.cd_protocolo_doc)
                                     From it_protocolo_doc i
                                     Where i.cd_documento_prot = pit_protocolo_doc.cd_documento_prot
                                      and  i.cd_reg_amb = 102712 );
/
SELECT cd_remessa FROM dbamv.reg_fat WHERE cd_reg_fat = 102712