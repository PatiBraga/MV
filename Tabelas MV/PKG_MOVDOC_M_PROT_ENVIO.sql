CREATE OR REPLACE PACKAGE dbamv.pkg_movdoc_m_prot_envio AS
	-- Exceptions
	FORM_TRIGGER_FAILURE EXCEPTION;
	PRAGMA EXCEPTION_INIT(FORM_TRIGGER_FAILURE, -40000);
	-- Declarations of extracted code units
    /*
    <DATA_CRIACAO>13/01/2011 17:42</DATA_CRIACAO>
    <CRIADO_POR>Ferramenta de Migração ATX</CRIADO_POR>
    <OBJETIVO>P_FACHADA</OBJETIVO>
    <ALTERACOES></ALTERACOES>
    */
    PROCEDURE P_FACHADA(in_params in Clob, out_params out Clob);
    /*
    <DATA_CRIACAO>13/01/2011 17:42</DATA_CRIACAO>
    <CRIADO_POR>Ferramenta de Migração ATX</CRIADO_POR>
    <OBJETIVO>chk_conta_ret</OBJETIVO>
    <ALTERACOES></ALTERACOES>
    */
    FUNCTION F_CHK_CONTA_RET (in_params in Clob, out_params out Clob) RETURN Varchar2;
    /*
    <DATA_CRIACAO>13/01/2011 17:42</DATA_CRIACAO>
    <CRIADO_POR>Ferramenta de Migração ATX</CRIADO_POR>
    <OBJETIVO>SN_DOCUMENTO_REMESSA</OBJETIVO>
    <ALTERACOES></ALTERACOES>
    */
    FUNCTION F_SN_DOCUMENTO_REMESSA (in_params in Clob, out_params out Clob) RETURN varchar;
    /*
    <DATA_CRIACAO>13/01/2011 17:42</DATA_CRIACAO>
    <CRIADO_POR>Ferramenta de Migração ATX</CRIADO_POR>
    <OBJETIVO>SN_PROTOCOLO_REMESSA</OBJETIVO>
    <ALTERACOES></ALTERACOES>
    */
    FUNCTION F_SN_PROTOCOLO_REMESSA (in_params in Clob, out_params out Clob) RETURN varchar;
    /*
    <DATA_CRIACAO>13/01/2011 17:42</DATA_CRIACAO>
    <CRIADO_POR>Ferramenta de Migração ATX</CRIADO_POR>
    <OBJETIVO>SN_PRIMEIRO_DOCUMENTO</OBJETIVO>
    <ALTERACOES></ALTERACOES>
    */
    FUNCTION F_SN_PRIMEIRO_DOCUMENTO (in_params in Clob, out_params out Clob) RETURN varchar;
    /*
    <DATA_CRIACAO>13/01/2011 17:42</DATA_CRIACAO>
    <CRIADO_POR>Ferramenta de Migração ATX</CRIADO_POR>
    <OBJETIVO>FNC_CHK_SITUACAO_CTA</OBJETIVO>
    <ALTERACOES></ALTERACOES>
    */
    FUNCTION F_CHK_SITUACAO_CTA (in_params in Clob, out_params out Clob) RETURN CHAR;
    /*
    <DATA_CRIACAO>13/01/2011 17:42</DATA_CRIACAO>
    <CRIADO_POR>Ferramenta de Migração ATX</CRIADO_POR>
    <OBJETIVO>FNC_RETORNA_CPROC</OBJETIVO>
    <ALTERACOES></ALTERACOES>
    */
    FUNCTION F_RETORNA_CPROC (in_params in Clob, out_params out Clob) RETURN char;
    /*
    <DATA_CRIACAO>13/01/2011 17:42</DATA_CRIACAO>
    <CRIADO_POR>Ferramenta de Migração ATX</CRIADO_POR>
    <OBJETIVO>FNC_RETORNA_SN_INFORMA_CONTA</OBJETIVO>
    <ALTERACOES></ALTERACOES>
    */
    FUNCTION F_RETORNA_SN_INFORMA_CONTA (in_params in Clob, out_params out Clob) RETURN DOCUMENTO_PROT.SN_INFORMA_CONTA%TYPE;
    /*
    <DATA_CRIACAO>13/01/2011 17:42</DATA_CRIACAO>
    <CRIADO_POR>Ferramenta de Migração ATX</CRIADO_POR>
    <OBJETIVO>CGFK$CHK_M_PROT_ENVIO_PROT_DOC</OBJETIVO>
    <ALTERACOES></ALTERACOES>
    */
    PROCEDURE P_CHK_M_PROT_ENVIO_PROT_DOC (in_params in Clob, out_params out Clob);
        /*
    <DATA_CRIACAO>13/01/2011 17:42</DATA_CRIACAO>
    <CRIADO_POR>Ferramenta de Migração ATX</CRIADO_POR>
    <OBJETIVO>CGFK$CHK_M_PROT_ENVIO_SETOR</OBJETIVO>
    <ALTERACOES></ALTERACOES>
    */
    PROCEDURE P_CHK_M_PROT_ENVIO_SETOR (in_params in Clob, out_params out Clob);
        /*
    <DATA_CRIACAO>13/01/2011 17:42</DATA_CRIACAO>
    <CRIADO_POR>Ferramenta de Migração ATX</CRIADO_POR>
    <OBJETIVO>CGRI$CHK_PROTOCOLO_DOC</OBJETIVO>
    <ALTERACOES></ALTERACOES>
    */
    PROCEDURE P_CHK_PROTOCOLO_DOC (in_params in Clob, out_params out Clob);
        /*
    <DATA_CRIACAO>13/01/2011 17:42</DATA_CRIACAO>
    <CRIADO_POR>Ferramenta de Migração ATX</CRIADO_POR>
    <OBJETIVO>CGFK$CHK_M_PROT_ENVIO_ATENDIME</OBJETIVO>
    <ALTERACOES></ALTERACOES>
    */
    PROCEDURE P_CHK_M_PROT_ENVIO_ATENDIME (in_params in Clob, out_params out Clob);
        /*
    <DATA_CRIACAO>13/01/2011 17:42</DATA_CRIACAO>
    <CRIADO_POR>Ferramenta de Migração ATX</CRIADO_POR>
    <OBJETIVO>CGFK$CHK_M_PROT_ENVIO_DOC_PROT</OBJETIVO>
    <ALTERACOES></ALTERACOES>
    */
    PROCEDURE P_CHK_M_PROT_ENVIO_DOC_PROT (in_params in Clob, out_params out Clob);
        /*
    <DATA_CRIACAO>13/01/2011 17:42</DATA_CRIACAO>
    <CRIADO_POR>Ferramenta de Migração ATX</CRIADO_POR>
    <OBJETIVO>CGFK$CHK_M_PROT_ENVIO_CONVENIO</OBJETIVO>
    <ALTERACOES></ALTERACOES>
    */
    PROCEDURE P_CHK_M_PROT_ENVIO_CONVENIO (in_params in Clob, out_params out Clob);
        /*
    <DATA_CRIACAO>13/01/2011 17:42</DATA_CRIACAO>
    <CRIADO_POR>Ferramenta de Migração ATX</CRIADO_POR>
    <OBJETIVO>CGFK$CHK_M_PROT_ENVIO_SETOR_DE</OBJETIVO>
    <ALTERACOES></ALTERACOES>
    */
    PROCEDURE P_CHK_M_PROT_ENVIO_SETOR_DE (in_params in Clob, out_params out Clob);
        /*
    <DATA_CRIACAO>13/01/2011 17:42</DATA_CRIACAO>
    <CRIADO_POR>Ferramenta de Migração ATX</CRIADO_POR>
    <OBJETIVO>CGFK$CHK_M_PROT_ENVIO_CONTA</OBJETIVO>
    <ALTERACOES></ALTERACOES>
    */
    PROCEDURE P_CHK_M_PROT_ENVIO_CONTA (in_params in Clob, out_params out Clob);
        /*
    <DATA_CRIACAO>13/01/2011 17:42</DATA_CRIACAO>
    <CRIADO_POR>Ferramenta de Migração ATX</CRIADO_POR>
    <OBJETIVO>chk_conta</OBJETIVO>
    <ALTERACOES></ALTERACOES>
    */
    PROCEDURE P_CHK_CONTA (in_params in Clob, out_params out Clob);
        /*
    <DATA_CRIACAO>13/01/2011 17:42</DATA_CRIACAO>
    <CRIADO_POR>Ferramenta de Migração ATX</CRIADO_POR>
    <OBJETIVO>CHK_SITUACAO_CTA</OBJETIVO>
    <ALTERACOES></ALTERACOES>
    */
    PROCEDURE P_CHK_SITUACAO_CTA (in_params in Clob, out_params out Clob);
        /*
    <DATA_CRIACAO>13/01/2011 17:42</DATA_CRIACAO>
    <CRIADO_POR>Ferramenta de Migração ATX</CRIADO_POR>
    <OBJETIVO>CHK_M_PROT_ENVIO_REMESSA</OBJETIVO>
    <ALTERACOES></ALTERACOES>
    */
    PROCEDURE P_CHK_M_PROT_ENVIO_REMESSA (in_params in Clob, out_params out Clob);
        /*
    <DATA_CRIACAO>13/01/2011 17:42</DATA_CRIACAO>
    <CRIADO_POR>Ferramenta de Migração ATX</CRIADO_POR>
    <OBJETIVO>CHK_M_PROT_ENVIO_SALVAR</OBJETIVO>
    <ALTERACOES></ALTERACOES>
    */
    PROCEDURE P_CHK_M_PROT_ENVIO_SALVAR (in_params in Clob, out_params out Clob);
        /*
    <DATA_CRIACAO>13/01/2011 17:42</DATA_CRIACAO>
    <CRIADO_POR>Ferramenta de Migração ATX</CRIADO_POR>
    <OBJETIVO>CHK_M_PROT_ENVIO_CONVENIO_CTA</OBJETIVO>
    <ALTERACOES></ALTERACOES>
    */
    PROCEDURE P_CHK_M_PROT_ENVIO_CONVENIO_ (in_params in Clob, out_params out Clob);
        /*
    <DATA_CRIACAO>13/01/2011 17:42</DATA_CRIACAO>
    <CRIADO_POR>Ferramenta de Migração ATX</CRIADO_POR>
    <OBJETIVO>chk_verifica_fluxo_setor</OBJETIVO>
    <ALTERACOES></ALTERACOES>
    */
    PROCEDURE P_CHK_VERIFICA_FLUXO_SETOR (in_params in Clob, out_params out Clob);
        /*
    <DATA_CRIACAO>13/01/2011 17:42</DATA_CRIACAO>
    <CRIADO_POR>Ferramenta de Migração ATX</CRIADO_POR>
    <OBJETIVO>PRC_VALIDA_CD_PROTOCOLO_DOC</OBJETIVO>
    <ALTERACOES></ALTERACOES>
    */
    PROCEDURE P_VALIDA_CD_PROTOCOLO_DOC (in_params in Clob, out_params out Clob);
        /*
    <DATA_CRIACAO>13/01/2011 17:42</DATA_CRIACAO>
    <CRIADO_POR>Ferramenta de Migração ATX</CRIADO_POR>
    <OBJETIVO>PRC_VALIDA_CD_SETOR</OBJETIVO>
    <ALTERACOES></ALTERACOES>
    */
    PROCEDURE P_VALIDA_CD_SETOR (in_params in Clob, out_params out Clob);
        /*
    <DATA_CRIACAO>13/01/2011 17:42</DATA_CRIACAO>
    <CRIADO_POR>Ferramenta de Migração ATX</CRIADO_POR>
    <OBJETIVO>PRC_VALIDA_CD_SETOR_DESTINO</OBJETIVO>
    <ALTERACOES></ALTERACOES>
    */
    PROCEDURE P_VALIDA_CD_SETOR_DESTINO (in_params in Clob, out_params out Clob);
        /*
    <DATA_CRIACAO>13/01/2011 17:42</DATA_CRIACAO>
    <CRIADO_POR>Ferramenta de Migração ATX</CRIADO_POR>
    <OBJETIVO>PRC_CONVENIO_REGFAT</OBJETIVO>
    <ALTERACOES></ALTERACOES>
    */
    PROCEDURE P_CONVENIO_REGFAT (in_params in Clob, out_params out Clob);
        /*
    <DATA_CRIACAO>13/01/2011 17:42</DATA_CRIACAO>
    <CRIADO_POR>Ferramenta de Migração ATX</CRIADO_POR>
    <OBJETIVO>PRC_CONVENIO_REGAMB</OBJETIVO>
    <ALTERACOES></ALTERACOES>
    */
    PROCEDURE P_CONVENIO_REGAMB (in_params in Clob, out_params out Clob);
        /*
    <DATA_CRIACAO>13/01/2011 17:42</DATA_CRIACAO>
    <CRIADO_POR>Ferramenta de Migração ATX</CRIADO_POR>
    <OBJETIVO>PRC_CONVENIO_ATENDIMENTO</OBJETIVO>
    <ALTERACOES></ALTERACOES>
    */
    PROCEDURE P_CONVENIO_ATENDIMENTO (in_params in Clob, out_params out Clob);
        /*
    <DATA_CRIACAO>13/01/2011 17:42</DATA_CRIACAO>
    <CRIADO_POR>Ferramenta de Migração ATX</CRIADO_POR>
    <OBJETIVO>PRC_RETORNA_SETOR</OBJETIVO>
    <ALTERACOES></ALTERACOES>
    */
    PROCEDURE P_RETORNA_SETOR (in_params in Clob, out_params out Clob);
        /*
    <DATA_CRIACAO>13/01/2011 17:42</DATA_CRIACAO>
    <CRIADO_POR>Ferramenta de Migração ATX</CRIADO_POR>
    <OBJETIVO>PROTOCOLO_DOC.PRE-INSERT</OBJETIVO>
    <ALTERACOES></ALTERACOES>
    */
    PROCEDURE P_B_PI_PROTOCOLO_DOC (in_params in Clob, out_params out Clob);
        /*
    <DATA_CRIACAO>13/01/2011 17:42</DATA_CRIACAO>
    <CRIADO_POR>Ferramenta de Migração ATX</CRIADO_POR>
    <OBJETIVO>PROTOCOLO_DOC.PRE-DELETE</OBJETIVO>
    <ALTERACOES></ALTERACOES>
    */
    PROCEDURE P_B_PD_PROTOCOLO_DOC (in_params in Clob, out_params out Clob);
        /*
    <DATA_CRIACAO>13/01/2011 17:42</DATA_CRIACAO>
    <CRIADO_POR>Ferramenta de Migração ATX</CRIADO_POR>
    <OBJETIVO>IT_PROTOCOLO_DOC.CD_ATENDIMENTO.WHEN-VALIDATE-ITEM</OBJETIVO>
    <ALTERACOES></ALTERACOES>
    */
    PROCEDURE P_I_WVI_IPD_CD_ATENDIMENTO (in_params in Clob, out_params out Clob);
        /*
    <DATA_CRIACAO>13/01/2011 17:42</DATA_CRIACAO>
    <CRIADO_POR>Ferramenta de Migração ATX</CRIADO_POR>
    <OBJETIVO>IT_PROTOCOLO_DOC.DSP_CD_CONTA.WHEN-VALIDATE-ITEM</OBJETIVO>
    <ALTERACOES></ALTERACOES>
    */
    PROCEDURE P_I_WVI_IPD_DSP_CD_CONTA (in_params in Clob, out_params out Clob);
        /*
    <DATA_CRIACAO>13/01/2011 17:42</DATA_CRIACAO>
    <CRIADO_POR>Ferramenta de Migração ATX</CRIADO_POR>
    <OBJETIVO>IT_PROTOCOLO_DOC.WHEN-VALIDATE-RECORD</OBJETIVO>
    <ALTERACOES></ALTERACOES>
    */
    PROCEDURE P_B_WVR_IT_PROTOCOLO_DOC (in_params in Clob, out_params out Clob);
        /*
    <DATA_CRIACAO>13/01/2011 17:42</DATA_CRIACAO>
    <CRIADO_POR>Ferramenta de Migração ATX</CRIADO_POR>
    <OBJETIVO>CG$CTRL_IMPORT.CD_DOCUMENTO_PROT.WHEN-VALIDATE-ITEM</OBJETIVO>
    <ALTERACOES></ALTERACOES>
    */
    PROCEDURE P_I_WVI_CI_CD_DOCUMENTO_PROT (in_params in Clob, out_params out Clob);
END Pkg_MOVDOC_M_PROT_ENVIO;
/

CREATE OR REPLACE PACKAGE BODY dbamv.pkg_movdoc_m_prot_envio AS
	-- Struct definitions for passing state from appliction level to the code units
	-- defined in this package
	-- Record to be used as parameter of procedures and functions that access application block CG$CTRL_IMPORT's items
	TYPE CG$CTRL_IMPORTRec IS RECORD (
		CD_SETOR	NUMBER,
		CD_DOCUMENTO_PROT	NUMBER,
		DS_DOCUMENTO_PROT	VARCHAR2(2000),
		SN_IMPORT	VARCHAR2(2000)
	);
	-- Record to be used as parameter of procedures and functions that access application block IT_PROTOCOLO_DOC's items
	TYPE IT_PROTOCOLO_DOCRec IS RECORD (
		CD_DOCUMENTO_PROT	NUMBER,
		DSP_TIPO_ATENDE	VARCHAR2(2000),
		CD_ATENDIMENTO	NUMBER,
		DSP_CD_CONTA	NUMBER,
		CD_REMESSA	NUMBER,
		DSP_DS_DOCUMENTO_PROT	VARCHAR2(2000),
		DT_REALIZACAO	DATE,
		HR_REALIZACAO	DATE,
		CD_CONVENIO	NUMBER,
		DSP_NM_CONVENIO	VARCHAR2(2000),
		CD_REG_FAT	NUMBER,
		CD_LANCAMENTO_FAT	NUMBER,
		CD_REG_AMB	NUMBER,
		CD_LANCAMENTO_AMB	NUMBER,
		DSP_NM_PACIENTE	VARCHAR2(2000),
		DSP_CD_PACIENTE	NUMBER,
		DSP_DT_ATENDIMENTO	DATE,
		DSP_TP_ATENDIMENTO	VARCHAR2(2000),
		DSP_NM_PRESTADOR	VARCHAR2(2000),
		DSP_SN_CODIGO	VARCHAR2(2000),
		TP_CONTA	VARCHAR2(2000)
	);
	-- Record to be used as parameter of procedures and functions that access application block PROTOCOLO_DOC's items
	TYPE PROTOCOLO_DOCRec IS RECORD (
		CD_PROTOCOLO_DOC	NUMBER,
		CD_SETOR	NUMBER,
		DSP_NM_SETOR	VARCHAR2(2000),
		CD_SETOR_DESTINO	NUMBER,
		DSP_NM_SETOR_DESTINO	VARCHAR2(2000),
		DT_ENVIO	Date,
		NM_USUARIO_ENVIO	VARCHAR2(2000)
	);
	-- Record to be used as parameter of procedures and functions that access application level global variables
	TYPE GlobalsRec IS RECORD (
		LG_ATENDIME	VARCHAR2(256)
	);
	-- Record to be used as parameter of procedures and functions that access application level Form parameters
	TYPE FormParamsRec IS RECORD (
		P_CD_MULTI_EMPRESA    NUMBER,
		P_CD_HOSPITAL    NUMBER,
		P_NM_SETOR    VARCHAR2(4000),
		P_CD_SETOR    NUMBER,
		P_TP_CONTROLE_LOTE    VARCHAR2(4000)
	);
    -- Record to be used as parameter of procedures and functions that access package VAR's vars
    TYPE VARRec IS RECORD (
        vMsgErro varchar2(32767) := ''
    );
-- Extracted code units
    FUNCTION F_CHK_CONTA_RET (xml IN OUT NOCOPY PKG_XML.XmlContext,pit_protocolo_doc IN OUT NOCOPY IT_PROTOCOLO_DOCRec,pCd_Documento in Number) RETURN Varchar2;
    FUNCTION F_SN_DOCUMENTO_REMESSA (xml IN OUT NOCOPY PKG_XML.XmlContext,pit_protocolo_doc IN OUT NOCOPY IT_PROTOCOLO_DOCRec, formParams IN OUT NOCOPY FormParamsRec) RETURN varchar;
    FUNCTION F_SN_PROTOCOLO_REMESSA (xml IN OUT NOCOPY PKG_XML.XmlContext,pprotocolo_doc IN OUT NOCOPY PROTOCOLO_DOCRec) RETURN varchar;
    FUNCTION F_SN_PRIMEIRO_DOCUMENTO (xml IN OUT NOCOPY PKG_XML.XmlContext,pprotocolo_doc IN OUT NOCOPY PROTOCOLO_DOCRec) RETURN varchar;
    FUNCTION F_CHK_SITUACAO_CTA (xml IN OUT NOCOPY PKG_XML.XmlContext,pit_protocolo_doc IN OUT NOCOPY IT_PROTOCOLO_DOCRec, pprotocolo_doc IN OUT NOCOPY PROTOCOLO_DOCRec, var IN OUT NOCOPY VARRec, formParams IN OUT NOCOPY FormParamsRec) RETURN CHAR;
    FUNCTION F_RETORNA_CPROC (xml IN OUT NOCOPY PKG_XML.XmlContext,pCd_Doc_Prot DOCUMENTO_PROC.CD_DOCUMENTO_PROT%type) RETURN char;
    FUNCTION F_RETORNA_SN_INFORMA_CONTA (xml IN OUT NOCOPY PKG_XML.XmlContext,pit_protocolo_doc IN OUT NOCOPY IT_PROTOCOLO_DOCRec,P_CD_DOC_PROT IN DOCUMENTO_PROT.CD_DOCUMENTO_PROT%TYPE) RETURN DOCUMENTO_PROT.SN_INFORMA_CONTA%TYPE;
    PROCEDURE P_CHK_M_PROT_ENVIO_PROT_DOC (xml IN OUT NOCOPY PKG_XML.XmlContext,P_CD_PROTOCOLO_DOC IN NUMBER);
    PROCEDURE P_CHK_M_PROT_ENVIO_SETOR (xml IN OUT NOCOPY PKG_XML.XmlContext,pprotocolo_doc IN OUT NOCOPY PROTOCOLO_DOCRec, pit_protocolo_doc IN OUT NOCOPY IT_PROTOCOLO_DOCRec, formParams IN OUT NOCOPY FormParamsRec, FSV_MODE IN OUT NOCOPY varchar2);
    PROCEDURE P_CHK_PROTOCOLO_DOC (xml IN OUT NOCOPY PKG_XML.XmlContext,P_CD_PROTOCOLO_DOC IN NUMBER);
    PROCEDURE P_CHK_M_PROT_ENVIO_ATENDIME (xml IN OUT NOCOPY PKG_XML.XmlContext,pit_protocolo_doc IN OUT NOCOPY IT_PROTOCOLO_DOCRec, formParams IN OUT NOCOPY FormParamsRec,P_CD_ATENDIMENTO IN NUMBER);
    PROCEDURE P_CHK_M_PROT_ENVIO_DOC_PROT (xml IN OUT NOCOPY PKG_XML.XmlContext,pit_protocolo_doc IN OUT NOCOPY IT_PROTOCOLO_DOCRec,P_CD_DOCUMENTO_PROT IN NUMBER,
   P_CD_SETOR IN NUMBER);
    PROCEDURE P_CHK_M_PROT_ENVIO_CONVENIO (xml IN OUT NOCOPY PKG_XML.XmlContext,pit_protocolo_doc IN OUT NOCOPY IT_PROTOCOLO_DOCRec, formParams IN OUT NOCOPY FormParamsRec,P_CD_CONVENIO IN NUMBER,
   P_CD_ATENDIMENTO IN NUMBER);
    PROCEDURE P_CHK_M_PROT_ENVIO_SETOR_DE (xml IN OUT NOCOPY PKG_XML.XmlContext,pprotocolo_doc IN OUT NOCOPY PROTOCOLO_DOCRec, pit_protocolo_doc IN OUT NOCOPY IT_PROTOCOLO_DOCRec, formParams IN OUT NOCOPY FormParamsRec, FSV_MODE IN OUT NOCOPY varchar2);
    PROCEDURE P_CHK_M_PROT_ENVIO_CONTA (xml IN OUT NOCOPY PKG_XML.XmlContext,pit_protocolo_doc IN OUT NOCOPY IT_PROTOCOLO_DOCRec, pcg$ctrl_import IN OUT NOCOPY CG$CTRL_IMPORTRec, global IN OUT NOCOPY GlobalsRec,
	formParams IN OUT NOCOPY FormParamsRec, FSV_RECORD_STATUS IN OUT NOCOPY varchar2,pCD_CONTA IN reg_fat.cd_reg_fat%type);
    PROCEDURE P_CHK_CONTA (xml IN OUT NOCOPY PKG_XML.XmlContext,pit_protocolo_doc IN OUT NOCOPY IT_PROTOCOLO_DOCRec, formParams IN OUT NOCOPY FormParamsRec);
    PROCEDURE P_CHK_SITUACAO_CTA (xml IN OUT NOCOPY PKG_XML.XmlContext,pit_protocolo_doc IN OUT NOCOPY IT_PROTOCOLO_DOCRec, pprotocolo_doc IN OUT NOCOPY PROTOCOLO_DOCRec, formParams IN OUT NOCOPY FormParamsRec);
    PROCEDURE P_CHK_M_PROT_ENVIO_REMESSA (xml IN OUT NOCOPY PKG_XML.XmlContext,pit_protocolo_doc IN OUT NOCOPY IT_PROTOCOLO_DOCRec, formParams IN OUT NOCOPY FormParamsRec,pCd_Remessa in number);
    PROCEDURE P_CHK_M_PROT_ENVIO_SALVAR (xml IN OUT NOCOPY PKG_XML.XmlContext,pit_protocolo_doc IN OUT NOCOPY IT_PROTOCOLO_DOCRec, formParams IN OUT NOCOPY FormParamsRec, FSV_RECORD_STATUS IN OUT NOCOPY varchar2);
    PROCEDURE P_CHK_M_PROT_ENVIO_CONVENIO_ (xml IN OUT NOCOPY PKG_XML.XmlContext,pit_protocolo_doc IN OUT NOCOPY IT_PROTOCOLO_DOCRec, formParams IN OUT NOCOPY FormParamsRec,P_CD_CONVENIO IN NUMBER,
   P_CD_CONTA IN REG_FAT.CD_REG_FAT%TYPE);
    PROCEDURE P_CHK_VERIFICA_FLUXO_SETOR (xml IN OUT NOCOPY PKG_XML.XmlContext,pit_protocolo_doc IN OUT NOCOPY IT_PROTOCOLO_DOCRec, pprotocolo_doc IN OUT NOCOPY PROTOCOLO_DOCRec, FSV_MODE IN OUT NOCOPY varchar2);
    PROCEDURE P_VALIDA_CD_PROTOCOLO_DOC (xml IN OUT NOCOPY PKG_XML.XmlContext,pprotocolo_doc IN OUT NOCOPY PROTOCOLO_DOCRec);
    PROCEDURE P_VALIDA_CD_SETOR (xml IN OUT NOCOPY PKG_XML.XmlContext,pprotocolo_doc IN OUT NOCOPY PROTOCOLO_DOCRec, pit_protocolo_doc IN OUT NOCOPY IT_PROTOCOLO_DOCRec, formParams IN OUT NOCOPY FormParamsRec, FSV_MODE IN OUT NOCOPY varchar2);
    PROCEDURE P_VALIDA_CD_SETOR_DESTINO (xml IN OUT NOCOPY PKG_XML.XmlContext,pprotocolo_doc IN OUT NOCOPY PROTOCOLO_DOCRec, pit_protocolo_doc IN OUT NOCOPY IT_PROTOCOLO_DOCRec, formParams IN OUT NOCOPY FormParamsRec, FSV_MODE IN OUT NOCOPY varchar2);
    PROCEDURE P_CONVENIO_REGFAT (xml IN OUT NOCOPY PKG_XML.XmlContext,pit_protocolo_doc IN OUT NOCOPY IT_PROTOCOLO_DOCRec, formParams IN OUT NOCOPY FormParamsRec,pCd_reg_fat in number);
    PROCEDURE P_CONVENIO_REGAMB (xml IN OUT NOCOPY PKG_XML.XmlContext,pit_protocolo_doc IN OUT NOCOPY IT_PROTOCOLO_DOCRec, formParams IN OUT NOCOPY FormParamsRec,pCd_Reg_Amb in number);
    PROCEDURE P_CONVENIO_ATENDIMENTO (xml IN OUT NOCOPY PKG_XML.XmlContext,pit_protocolo_doc IN OUT NOCOPY IT_PROTOCOLO_DOCRec, formParams IN OUT NOCOPY FormParamsRec);
    PROCEDURE P_RETORNA_SETOR (xml IN OUT NOCOPY PKG_XML.XmlContext,formParams IN OUT NOCOPY FormParamsRec,P_CD_SETOR IN NUMBER, P_RAISE IN BOOLEAN, P_MOSTRA_MENSAGEM IN BOOLEAN);
    PROCEDURE P_B_PI_PROTOCOLO_DOC (xml IN OUT NOCOPY PKG_XML.XmlContext,pprotocolo_doc IN OUT NOCOPY PROTOCOLO_DOCRec);
    PROCEDURE P_B_PD_PROTOCOLO_DOC (xml IN OUT NOCOPY PKG_XML.XmlContext,pprotocolo_doc IN OUT NOCOPY PROTOCOLO_DOCRec);
    PROCEDURE P_I_WVI_IPD_CD_ATENDIMENTO (xml IN OUT NOCOPY PKG_XML.XmlContext,pit_protocolo_doc IN OUT NOCOPY IT_PROTOCOLO_DOCRec, pprotocolo_doc IN OUT NOCOPY PROTOCOLO_DOCRec, formParams IN OUT NOCOPY FormParamsRec);
    PROCEDURE P_I_WVI_IPD_DSP_CD_CONTA (xml IN OUT NOCOPY PKG_XML.XmlContext,pit_protocolo_doc IN OUT NOCOPY IT_PROTOCOLO_DOCRec, pprotocolo_doc IN OUT NOCOPY PROTOCOLO_DOCRec, pcg$ctrl_import IN OUT NOCOPY CG$CTRL_IMPORTRec, var IN OUT NOCOPY VARRec,
	global IN OUT NOCOPY GlobalsRec, formParams IN OUT NOCOPY FormParamsRec, FSV_BLOCK_STATUS IN OUT NOCOPY varchar2, FSV_RECORD_STATUS IN OUT NOCOPY varchar2);
    PROCEDURE P_B_WVR_IT_PROTOCOLO_DOC (xml IN OUT NOCOPY PKG_XML.XmlContext,pit_protocolo_doc IN OUT NOCOPY IT_PROTOCOLO_DOCRec, formParams IN OUT NOCOPY FormParamsRec, FSV_RECORD_STATUS IN OUT NOCOPY varchar2);
    PROCEDURE P_I_WVI_CI_CD_DOCUMENTO_PROT (xml IN OUT NOCOPY PKG_XML.XmlContext,pcg$ctrl_import IN OUT NOCOPY CG$CTRL_IMPORTRec);
    /*
    <DATA_CRIACAO>13/01/2011 17:42</DATA_CRIACAO>
    <CRIADO_POR>Ferramenta de Migração ATX</CRIADO_POR>
    <OBJETIVO>P_FACHADA</OBJETIVO>
    <ALTERACOES></ALTERACOES>
    */
	PROCEDURE P_FACHADA(in_params in Clob, out_params out Clob) IS
	BEGIN
	    null;
	END P_FACHADA;
    /*
    <DATA_CRIACAO>13/01/2011 17:42</DATA_CRIACAO>
    <CRIADO_POR>Ferramenta de Migração ATX</CRIADO_POR>
    <OBJETIVO>chk_conta_ret</OBJETIVO>
    <ALTERACOES></ALTERACOES>
    */
	FUNCTION F_CHK_CONTA_RET (xml IN OUT NOCOPY PKG_XML.XmlContext,pit_protocolo_doc IN OUT NOCOPY IT_PROTOCOLO_DOCRec,pCd_Documento in Number) RETURN Varchar2 IS
		cRet DOCUMENTO_PROT.SN_INFORMA_CONTA%TYPE;
	BEGIN
	  cRet := Pkg_MOVDOC_M_PROT_ENVIO.F_RETORNA_SN_INFORMA_CONTA(xml, pIT_PROTOCOLO_DOC, pIT_PROTOCOLO_DOC.CD_DOCUMENTO_PROT);
	    RETURN cRet;
	END;
	FUNCTION F_CHK_CONTA_RET (in_params in Clob, out_params out Clob) RETURN Varchar2 IS
	    xml PKG_XML.XmlContext;
	    pCd_Documento Number;
	    pit_protocolo_doc IT_PROTOCOLO_DOCRec;
	    result Varchar2(4000);
	BEGIN
        xml := PKG_XML.Init(in_params);
        -- extract input parameters from the XML
        pIT_PROTOCOLO_DOC.CD_DOCUMENTO_PROT:= PKG_XML.GetNUMBER(xml, 'IT_PROTOCOLO_DOC.CD_DOCUMENTO_PROT');
        pCd_Documento:= PKG_XML.GetNumber(xml, 'pCd_Documento');
        BEGIN
            IF Pkg_MOVDOC_M_PROT_ENVIO_C.F_CHK_CONTA_RET_E(xml) THEN
                result:= F_CHK_CONTA_RET(xml, pIT_PROTOCOLO_DOC, pCd_Documento);
                Pkg_MOVDOC_M_PROT_ENVIO_C.F_CHK_CONTA_RET_S(xml);
            END IF;
        EXCEPTION
        WHEN OTHERS THEN
            PKG_XML.AddException(xml, SQLCODE, SQLERRM);
        END;
        -- save output parameters to the XML
        PKG_XML.SetNUMBER(xml, 'IT_PROTOCOLO_DOC.CD_DOCUMENTO_PROT', pIT_PROTOCOLO_DOC.CD_DOCUMENTO_PROT);
        out_params := PKG_XML.GetOutputClob(xml);
     return result;
	END;
    /*
    <DATA_CRIACAO>13/01/2011 17:42</DATA_CRIACAO>
    <CRIADO_POR>Ferramenta de Migração ATX</CRIADO_POR>
    <OBJETIVO>SN_DOCUMENTO_REMESSA</OBJETIVO>
    <ALTERACOES></ALTERACOES>
    */
	FUNCTION F_SN_DOCUMENTO_REMESSA (xml IN OUT NOCOPY PKG_XML.XmlContext,pit_protocolo_doc IN OUT NOCOPY IT_PROTOCOLO_DOCRec, formParams IN OUT NOCOPY FormParamsRec) RETURN varchar IS
	  vLst_Retorno PKG_PARAMETRO.ID_LISTA_PARAM;
	  vLst_Local PKG_PARAMETRO.ID_LISTA_PARAM;
	  vSn_Remessa      Varchar2(1);
	BEGIN
        -- Chamada da Procedure
        --
        M_PKG_MOVDOC_DOCUMENTO_PROT.P_RETORNA_DADOS(xml, pIT_PROTOCOLO_DOC.CD_DOCUMENTO_PROT
                                                                     ,formParams.P_CD_MULTI_EMPRESA
                                                                     ,xml.usuario
                                                                     ,TRUE
                                                                     ,TRUE
                                                                     ,vLst_Retorno);
        --
        vLst_Local  := PKG_PARAMETRO.FN_RECUPERA_LISTA_PARAMETROS(vLst_Retorno);
        --
        PKG_PARAMETRO.PR_RECUPERA_PARAMETRO(vLst_Local,'SN_REMESSA',vSn_Remessa ,false);
        -- Limpando a lista de Parâmetros
        --
        pkg_parametro.pr_limpar_lista_parametros(vLst_Local);
	    return nvl(vSn_Remessa,'N');
	END;
	FUNCTION F_SN_DOCUMENTO_REMESSA (in_params in Clob, out_params out Clob) RETURN varchar IS
	    xml PKG_XML.XmlContext;
	    pit_protocolo_doc IT_PROTOCOLO_DOCRec;
	    formParams FormParamsRec;
	    result varchar(4000);
	BEGIN
        xml := PKG_XML.Init(in_params);
        -- extract input parameters from the XML
        pIT_PROTOCOLO_DOC.CD_DOCUMENTO_PROT:= PKG_XML.GetNUMBER(xml, 'IT_PROTOCOLO_DOC.CD_DOCUMENTO_PROT');
        formParams.P_CD_MULTI_EMPRESA:= PKG_XML.GetNUMBER(xml, 'PARAMETER.P_CD_MULTI_EMPRESA');
        BEGIN
            IF Pkg_MOVDOC_M_PROT_ENVIO_C.F_SN_DOCUMENTO_REMESSA_E(xml) THEN
                result:= F_SN_DOCUMENTO_REMESSA(xml, pIT_PROTOCOLO_DOC, formParams);
                Pkg_MOVDOC_M_PROT_ENVIO_C.F_SN_DOCUMENTO_REMESSA_S(xml);
            END IF;
        EXCEPTION
        WHEN OTHERS THEN
            PKG_XML.AddException(xml, SQLCODE, SQLERRM);
        END;
        -- save output parameters to the XML
        PKG_XML.SetNUMBER(xml, 'IT_PROTOCOLO_DOC.CD_DOCUMENTO_PROT', pIT_PROTOCOLO_DOC.CD_DOCUMENTO_PROT);
        PKG_XML.SetNUMBER(xml, 'PARAMETER.P_CD_MULTI_EMPRESA', formParams.P_CD_MULTI_EMPRESA);
        out_params := PKG_XML.GetOutputClob(xml);
     return result;
END;
    /*
    <DATA_CRIACAO>13/01/2011 17:42</DATA_CRIACAO>
    <CRIADO_POR>Ferramenta de Migração ATX</CRIADO_POR>
    <OBJETIVO>SN_PROTOCOLO_REMESSA</OBJETIVO>
    <ALTERACOES></ALTERACOES>
    */
	FUNCTION F_SN_PROTOCOLO_REMESSA (xml IN OUT NOCOPY PKG_XML.XmlContext,pprotocolo_doc IN OUT NOCOPY PROTOCOLO_DOCRec) RETURN varchar IS
BEGIN
    declare
  -- indica se há remessa no protocolo
  cursor c_sn_protocolo_remessa is
      select count(*) qtd
        from it_protocolo_doc
       where cd_protocolo_doc = pPROTOCOLO_DOC.CD_PROTOCOLO_DOC
         and cd_remessa is not null;
  v_sn_protocolo_remessa     c_sn_protocolo_remessa%rowtype;
    begin
    open c_sn_protocolo_remessa;
    fetch c_sn_protocolo_remessa into v_sn_protocolo_remessa;
    close c_sn_protocolo_remessa;
      if v_sn_protocolo_remessa.qtd > 0 then
        -- há remessa no protocolo
         return 'S';
    else
        -- não há remessa no protocolo
        return 'N';
    end if;
    end;
END;
FUNCTION F_SN_PROTOCOLO_REMESSA (in_params in Clob, out_params out Clob) RETURN varchar IS
    xml PKG_XML.XmlContext;
    pprotocolo_doc PROTOCOLO_DOCRec;
    result varchar(4000);
BEGIN
        xml := PKG_XML.Init(in_params);
        -- extract input parameters from the XML
        pPROTOCOLO_DOC.CD_PROTOCOLO_DOC:= PKG_XML.GetNUMBER(xml, 'PROTOCOLO_DOC.CD_PROTOCOLO_DOC');
        BEGIN
            IF Pkg_MOVDOC_M_PROT_ENVIO_C.F_SN_PROTOCOLO_REMESSA_E(xml) THEN
                result:= F_SN_PROTOCOLO_REMESSA(xml, pPROTOCOLO_DOC);
                Pkg_MOVDOC_M_PROT_ENVIO_C.F_SN_PROTOCOLO_REMESSA_S(xml);
            END IF;
        EXCEPTION
        WHEN OTHERS THEN
            PKG_XML.AddException(xml, SQLCODE, SQLERRM);
        END;
        -- save output parameters to the XML
        PKG_XML.SetNUMBER(xml, 'PROTOCOLO_DOC.CD_PROTOCOLO_DOC', pPROTOCOLO_DOC.CD_PROTOCOLO_DOC);
        out_params := PKG_XML.GetOutputClob(xml);
     return result;
END;
    /*
    <DATA_CRIACAO>13/01/2011 17:42</DATA_CRIACAO>
    <CRIADO_POR>Ferramenta de Migração ATX</CRIADO_POR>
    <OBJETIVO>SN_PRIMEIRO_DOCUMENTO</OBJETIVO>
    <ALTERACOES></ALTERACOES>
    */
	FUNCTION F_SN_PRIMEIRO_DOCUMENTO (xml IN OUT NOCOPY PKG_XML.XmlContext,pprotocolo_doc IN OUT NOCOPY PROTOCOLO_DOCRec) RETURN varchar IS
BEGIN
    declare
  -- indica se há algum documento no protocolo
  cursor c_sn_primeiro_docunento is
      select count(*) qtd
        from it_protocolo_doc
       where cd_protocolo_doc = pPROTOCOLO_DOC.CD_PROTOCOLO_DOC;
  v_sn_primeiro_docunento      c_sn_primeiro_docunento%rowtype;
    begin
    open c_sn_primeiro_docunento;
    fetch c_sn_primeiro_docunento into v_sn_primeiro_docunento;
    close c_sn_primeiro_docunento;
      if v_sn_primeiro_docunento.qtd <= 1 then
        -- primeiro documento do protocolo
         return 'S';
    else
        -- há mais de um documento no protocolo
        return 'N';
    end if;
    end;
END;
FUNCTION F_SN_PRIMEIRO_DOCUMENTO (in_params in Clob, out_params out Clob) RETURN varchar IS
    xml PKG_XML.XmlContext;
    pprotocolo_doc PROTOCOLO_DOCRec;
    result varchar(4000);
BEGIN
        xml := PKG_XML.Init(in_params);
        -- extract input parameters from the XML
        pPROTOCOLO_DOC.CD_PROTOCOLO_DOC:= PKG_XML.GetNUMBER(xml, 'PROTOCOLO_DOC.CD_PROTOCOLO_DOC');
        BEGIN
            IF Pkg_MOVDOC_M_PROT_ENVIO_C.F_SN_PRIMEIRO_DOCUMENTO_E(xml) THEN
                result:= F_SN_PRIMEIRO_DOCUMENTO(xml, pPROTOCOLO_DOC);
                Pkg_MOVDOC_M_PROT_ENVIO_C.F_SN_PRIMEIRO_DOCUMENTO_S(xml);
            END IF;
        EXCEPTION
        WHEN OTHERS THEN
            PKG_XML.AddException(xml, SQLCODE, SQLERRM);
        END;
        -- save output parameters to the XML
        PKG_XML.SetNUMBER(xml, 'PROTOCOLO_DOC.CD_PROTOCOLO_DOC', pPROTOCOLO_DOC.CD_PROTOCOLO_DOC);
        out_params := PKG_XML.GetOutputClob(xml);
     return result;
END;
    /*
    <DATA_CRIACAO>13/01/2011 17:42</DATA_CRIACAO>
    <CRIADO_POR>Ferramenta de Migração ATX</CRIADO_POR>
    <OBJETIVO>FNC_CHK_SITUACAO_CTA</OBJETIVO>
    <ALTERACOES></ALTERACOES>
    */
	FUNCTION F_CHK_SITUACAO_CTA (xml IN OUT NOCOPY PKG_XML.XmlContext,pit_protocolo_doc IN OUT NOCOPY IT_PROTOCOLO_DOCRec, pprotocolo_doc IN OUT NOCOPY PROTOCOLO_DOCRec, var IN OUT NOCOPY VARRec, formParams IN OUT NOCOPY FormParamsRec) RETURN CHAR IS
     Cursor c_conta_fat Is
        Select Distinct a.dt_recebimento,
               a.dt_devolucao,
               a.cd_protocolo_doc,
               a.cd_reg_fat cd_reg_amb,
               b.cd_setor,
               b.cd_setor_destino
        From it_protocolo_doc a, protocolo_doc b
        Where a.cd_protocolo_doc = b.cd_protocolo_doc
          AND  pIT_PROTOCOLO_DOC.DSP_TIPO_ATENDE in ('H','B','HO','I','T')
          And a.cd_reg_fat       = pit_protocolo_doc.dsp_cd_conta
          And a.cd_protocolo_doc = ( select max(i.cd_protocolo_doc)
                                     From it_protocolo_doc i
                                     Where i.cd_documento_prot = pit_protocolo_doc.cd_documento_prot
                                      and  i.cd_reg_fat = pit_protocolo_doc.dsp_cd_conta )
        union
        Select Distinct a.dt_recebimento,
               a.dt_devolucao,
               a.cd_protocolo_doc,
               a.cd_reg_amb,
               b.cd_setor,
               b.cd_setor_destino
        From it_protocolo_doc a, protocolo_doc b
        Where a.cd_protocolo_doc = b.cd_protocolo_doc
          AND  pIT_PROTOCOLO_DOC.DSP_TIPO_ATENDE in ('U','E','AM','A','T')
          And a.cd_reg_amb       = pit_protocolo_doc.dsp_cd_conta
          And a.cd_protocolo_doc = ( select max(i.cd_protocolo_doc)
                                     From it_protocolo_doc i
                                     Where i.cd_documento_prot = pit_protocolo_doc.cd_documento_prot
                                      and  i.cd_reg_amb = pit_protocolo_doc.dsp_cd_conta );
    vNm_Setor setor.nm_setor%type;
    Linha_Reg c_conta_fat%RowType;
  BEGIN
    if Nvl( formParams.P_CD_HOSPITAL,1) = 267 then
     return 'S';
    end if;
    -- OP 34289 - 13/04/2016 - Usando um cursor só por causa da mudança no uso do parâmetro DSP_TIPO_ATENDE.
    Open c_conta_fat;
    Fetch c_conta_fat into Linha_reg;
    If  c_conta_fat%Found Then
      If Linha_reg.dt_recebimento is not null Then
            If  pProtocolo_doc.Cd_setor <> Linha_reg.Cd_setor_Destino then
                  var.VMsgErro := ' A Conta '||Linha_reg.cd_reg_amb||' não encontra-se neste setor';
                return 'N';
            End If;
      Elsif Linha_reg.dt_Devolucao is not null Then
            If  pProtocolo_doc.Cd_setor <> Linha_reg.Cd_setor Then
                  var.VMsgErro := ' A Conta '||Linha_reg.cd_reg_amb||' não encontra-se neste setor';
                  return 'N';
            End If;
      Elsif Linha_reg.dt_recebimento is null And Linha_reg.dt_devolucao is null Then
	    if  pProtocolo_doc.Cd_setor <> Linha_reg.Cd_setor_Destino THEN  -- FATURCONV-2674 - não fazer essa validação se o setor for igual ao setor de destino encontrado.
          Pkg_MOVDOC_M_PROT_ENVIO.P_RETORNA_SETOR(xml, formParams, Linha_reg.cd_setor_destino, true, true);
          vNm_Setor := formParams.P_NM_SETOR;
          var.VMsgErro := 'Conta '||Linha_reg.cd_reg_amb||' encontra-se no setor '||vNm_Setor||' - PROTOCOLO : '||Linha_reg.cd_protocolo_doc; -- OP 45829
          return 'N';
		end if;
      End If;
    End If;
    Close c_conta_fat;
    return 'S';
END;
FUNCTION F_CHK_SITUACAO_CTA (in_params in Clob, out_params out Clob) RETURN CHAR IS
    xml PKG_XML.XmlContext;
    pit_protocolo_doc IT_PROTOCOLO_DOCRec;
    pprotocolo_doc PROTOCOLO_DOCRec;
    var VARRec;
    formParams FormParamsRec;
    result CHAR;
BEGIN
        xml := PKG_XML.Init(in_params);
        -- extract input parameters from the XML
        pIT_PROTOCOLO_DOC.DSP_CD_CONTA:= PKG_XML.GetNUMBER(xml, 'IT_PROTOCOLO_DOC.DSP_CD_CONTA');
        pIT_PROTOCOLO_DOC.CD_DOCUMENTO_PROT:= PKG_XML.GetNUMBER(xml, 'IT_PROTOCOLO_DOC.CD_DOCUMENTO_PROT');
        pIT_PROTOCOLO_DOC.DSP_TIPO_ATENDE:= PKG_XML.GetVARCHAR2(xml, 'IT_PROTOCOLO_DOC.DSP_TIPO_ATENDE');
        pPROTOCOLO_DOC.CD_SETOR:= PKG_XML.GetNUMBER(xml, 'PROTOCOLO_DOC.CD_SETOR');
        VAR.vMsgErro:= PKG_XML.Getvarchar2(xml, 'VAR.VMSGERRO');
        formParams.P_CD_HOSPITAL:= PKG_XML.GetNUMBER(xml, 'PARAMETER.P_CD_HOSPITAL');
        formParams.P_NM_SETOR:= PKG_XML.GetVARCHAR2(xml, 'PARAMETER.P_NM_SETOR');
        formParams.P_CD_MULTI_EMPRESA:= PKG_XML.GetNUMBER(xml, 'PARAMETER.P_CD_MULTI_EMPRESA');
        formParams.P_CD_SETOR:= PKG_XML.GetNUMBER(xml, 'PARAMETER.P_CD_SETOR');
        BEGIN
            IF Pkg_MOVDOC_M_PROT_ENVIO_C.F_CHK_SITUACAO_CTA_E(xml) THEN
                result:= F_CHK_SITUACAO_CTA(xml, pIT_PROTOCOLO_DOC, pPROTOCOLO_DOC, VAR, formParams);
                Pkg_MOVDOC_M_PROT_ENVIO_C.F_CHK_SITUACAO_CTA_S(xml);
            END IF;
        EXCEPTION
        WHEN OTHERS THEN
            PKG_XML.AddException(xml, SQLCODE, SQLERRM);
        END;
        -- save output parameters to the XML
        PKG_XML.SetNUMBER(xml, 'IT_PROTOCOLO_DOC.DSP_CD_CONTA', pIT_PROTOCOLO_DOC.DSP_CD_CONTA);
        PKG_XML.SetNUMBER(xml, 'IT_PROTOCOLO_DOC.CD_DOCUMENTO_PROT', pIT_PROTOCOLO_DOC.CD_DOCUMENTO_PROT);
        PKG_XML.SetVARCHAR2(xml, 'IT_PROTOCOLO_DOC.DSP_TIPO_ATENDE', pIT_PROTOCOLO_DOC.DSP_TIPO_ATENDE);
        PKG_XML.SetNUMBER(xml, 'PROTOCOLO_DOC.CD_SETOR', pPROTOCOLO_DOC.CD_SETOR);
        PKG_XML.Setvarchar2(xml, 'VAR.VMSGERRO', VAR.vMsgErro);
        PKG_XML.SetNUMBER(xml, 'PARAMETER.P_CD_HOSPITAL', formParams.P_CD_HOSPITAL);
        PKG_XML.SetVARCHAR2(xml, 'PARAMETER.P_NM_SETOR', formParams.P_NM_SETOR);
        PKG_XML.SetNUMBER(xml, 'PARAMETER.P_CD_MULTI_EMPRESA', formParams.P_CD_MULTI_EMPRESA);
        PKG_XML.SetNUMBER(xml, 'PARAMETER.P_CD_SETOR', formParams.P_CD_SETOR);
        out_params := PKG_XML.GetOutputClob(xml);
     return result;
END;
    /*
    <DATA_CRIACAO>13/01/2011 17:42</DATA_CRIACAO>
    <CRIADO_POR>Ferramenta de Migração ATX</CRIADO_POR>
    <OBJETIVO>FNC_RETORNA_CPROC</OBJETIVO>
    <ALTERACOES></ALTERACOES>
    */
	FUNCTION F_RETORNA_CPROC (xml IN OUT NOCOPY PKG_XML.XmlContext,pCd_Doc_Prot DOCUMENTO_PROC.CD_DOCUMENTO_PROT%type) RETURN char IS
vVar_Retorno DOCUMENTO_PROC.CD_PRO_FAT%TYPE;
CURSOR  cProc  is
  SELECT  DOCUMENTO_PROC.CD_PRO_FAT
    FROM  DOCUMENTO_PROC
   WHERE  DOCUMENTO_PROC.CD_DOCUMENTO_PROT =  pCd_Doc_Prot;
BEGIN
  open cProc;
  fetch cProc into vVar_retorno;
  close cProc;
  return vVar_retorno;
END;
FUNCTION F_RETORNA_CPROC (in_params in Clob, out_params out Clob) RETURN char IS
    xml PKG_XML.XmlContext;
    pCd_Doc_Prot NUMBER;
    result char;
BEGIN
        xml := PKG_XML.Init(in_params);
        -- extract input parameters from the XML
        pCd_Doc_Prot:= PKG_XML.GetNUMBER(xml, 'pCd_Doc_Prot');
        BEGIN
            IF Pkg_MOVDOC_M_PROT_ENVIO_C.F_RETORNA_CPROC_E(xml) THEN
                result:= F_RETORNA_CPROC(xml, pCd_Doc_Prot);
                Pkg_MOVDOC_M_PROT_ENVIO_C.F_RETORNA_CPROC_S(xml);
            END IF;
        EXCEPTION
        WHEN OTHERS THEN
            PKG_XML.AddException(xml, SQLCODE, SQLERRM);
        END;
        -- save output parameters to the XML
        out_params := PKG_XML.GetOutputClob(xml);
     return result;
END;
    /*
    <DATA_CRIACAO>13/01/2011 17:42</DATA_CRIACAO>
    <CRIADO_POR>Ferramenta de Migração ATX</CRIADO_POR>
    <OBJETIVO>FNC_RETORNA_SN_INFORMA_CONTA</OBJETIVO>
    <ALTERACOES></ALTERACOES>
    */
	FUNCTION F_RETORNA_SN_INFORMA_CONTA (xml IN OUT NOCOPY PKG_XML.XmlContext,pit_protocolo_doc IN OUT NOCOPY IT_PROTOCOLO_DOCRec,P_CD_DOC_PROT IN DOCUMENTO_PROT.CD_DOCUMENTO_PROT%TYPE) RETURN DOCUMENTO_PROT.SN_INFORMA_CONTA%TYPE IS
CURSOR C_SN_INFORMA_CONTA IS
    SELECT SN_INFORMA_CONTA
      FROM DOCUMENTO_PROT
     WHERE CD_DOCUMENTO_PROT = pIT_PROTOCOLO_DOC.CD_DOCUMENTO_PROT;
vSN_INFORMA_CONTA DOCUMENTO_PROT.SN_INFORMA_CONTA%TYPE;
BEGIN
    OPEN C_SN_INFORMA_CONTA;
    FETCH C_SN_INFORMA_CONTA INTO vSN_INFORMA_CONTA;
  IF C_SN_INFORMA_CONTA%NOTFOUND THEN
    CLOSE C_SN_INFORMA_CONTA;
    RAISE NO_DATA_FOUND;
  END IF;
  CLOSE C_SN_INFORMA_CONTA;
    RETURN vSN_INFORMA_CONTA;
END;
FUNCTION F_RETORNA_SN_INFORMA_CONTA (in_params in Clob, out_params out Clob) RETURN DOCUMENTO_PROT.SN_INFORMA_CONTA%TYPE IS
    xml PKG_XML.XmlContext;
    P_CD_DOC_PROT NUMBER;
    pit_protocolo_doc IT_PROTOCOLO_DOCRec;
    result DOCUMENTO_PROT.SN_INFORMA_CONTA%TYPE;
BEGIN
        xml := PKG_XML.Init(in_params);
        -- extract input parameters from the XML
        pIT_PROTOCOLO_DOC.CD_DOCUMENTO_PROT:= PKG_XML.GetNUMBER(xml, 'IT_PROTOCOLO_DOC.CD_DOCUMENTO_PROT');
        P_CD_DOC_PROT:= PKG_XML.GetNUMBER(xml, 'P_CD_DOC_PROT');
        BEGIN
            IF Pkg_MOVDOC_M_PROT_ENVIO_C.F_RETORNA_SN_INFORMA_CONTA_E(xml) THEN
                result:= F_RETORNA_SN_INFORMA_CONTA(xml, pIT_PROTOCOLO_DOC, P_CD_DOC_PROT);
                Pkg_MOVDOC_M_PROT_ENVIO_C.F_RETORNA_SN_INFORMA_CONTA_S(xml);
            END IF;
        EXCEPTION
        WHEN OTHERS THEN
            PKG_XML.AddException(xml, SQLCODE, SQLERRM);
        END;
        -- save output parameters to the XML
        PKG_XML.SetNUMBER(xml, 'IT_PROTOCOLO_DOC.CD_DOCUMENTO_PROT', pIT_PROTOCOLO_DOC.CD_DOCUMENTO_PROT);
        out_params := PKG_XML.GetOutputClob(xml);
     return result;
END;
    /*
    <DATA_CRIACAO>13/01/2011 17:42</DATA_CRIACAO>
    <CRIADO_POR>Ferramenta de Migração ATX</CRIADO_POR>
    <OBJETIVO>CGFK$CHK_M_PROT_ENVIO_PROT_DOC</OBJETIVO>
    <ALTERACOES></ALTERACOES>
    */
	PROCEDURE P_CHK_M_PROT_ENVIO_PROT_DOC (xml IN OUT NOCOPY PKG_XML.XmlContext,P_CD_PROTOCOLO_DOC IN NUMBER) IS
vProtocolo varchar2(1);
BEGIN
  DECLARE
    CURSOR C IS
      SELECT 'X'
      FROM   PROTOCOLO_DOC
           , It_Protocolo_Doc
           , SETOR
      WHERE  PROTOCOLO_DOC.CD_PROTOCOLO_DOC = P_CD_PROTOCOLO_DOC
        AND  PROTOCOLO_DOC.CD_SETOR = SETOR.CD_SETOR
        AND  PROTOCOLO_DOC.CD_PROTOCOLO_DOC = IT_PROTOCOLO_DOC.CD_PROTOCOLO_DOC
        AND  IT_PROTOCOLO_DOC.CD_DOCUMENTO_PASTA_PARCIAL IS NULL;
  BEGIN
    OPEN C;
    FETCH C
    INTO    vProtocolo;
    IF C%NOTFOUND THEN
      CLOSE C;
      RAISE NO_DATA_FOUND;
    END IF;
    CLOSE C;
  END;
END;
PROCEDURE P_CHK_M_PROT_ENVIO_PROT_DOC (in_params in Clob, out_params out Clob) IS
    xml PKG_XML.XmlContext;
    P_CD_PROTOCOLO_DOC NUMBER;
BEGIN
        xml := PKG_XML.Init(in_params);
        -- extract input parameters from the XML
        P_CD_PROTOCOLO_DOC:= PKG_XML.GetNUMBER(xml, 'P_CD_PROTOCOLO_DOC');
        BEGIN
            IF Pkg_MOVDOC_M_PROT_ENVIO_C.P_CHK_M_PROT_ENVIO_PROT_DOC_E(xml) THEN
                P_CHK_M_PROT_ENVIO_PROT_DOC(xml, P_CD_PROTOCOLO_DOC);
                Pkg_MOVDOC_M_PROT_ENVIO_C.P_CHK_M_PROT_ENVIO_PROT_DOC_S(xml);
            END IF;
        EXCEPTION
        WHEN OTHERS THEN
            PKG_XML.AddException(xml, SQLCODE, SQLERRM);
        END;
        -- save output parameters to the XML
        out_params := PKG_XML.GetOutputClob(xml);
END;
    /*
    <DATA_CRIACAO>13/01/2011 17:42</DATA_CRIACAO>
    <CRIADO_POR>Ferramenta de Migração ATX</CRIADO_POR>
    <OBJETIVO>CGFK$CHK_M_PROT_ENVIO_SETOR</OBJETIVO>
    <ALTERACOES></ALTERACOES>
    */
	PROCEDURE P_CHK_M_PROT_ENVIO_SETOR (xml IN OUT NOCOPY PKG_XML.XmlContext,pprotocolo_doc IN OUT NOCOPY PROTOCOLO_DOCRec, pit_protocolo_doc IN OUT NOCOPY IT_PROTOCOLO_DOCRec, formParams IN OUT NOCOPY FormParamsRec, FSV_MODE IN OUT NOCOPY varchar2) IS
BEGIN
    if  FSV_mode <> 'QUERY' then
    Pkg_MOVDOC_M_PROT_ENVIO.P_RETORNA_SETOR(xml, formParams, pPROTOCOLO_DOC.CD_SETOR, true, true);
    else
        Pkg_MOVDOC_M_PROT_ENVIO.P_RETORNA_SETOR(xml, formParams, pPROTOCOLO_DOC.CD_SETOR, true, true);
    end if;
  pPROTOCOLO_DOC.DSP_NM_SETOR := formParams.P_NM_SETOR;
  Pkg_MOVDOC_M_PROT_ENVIO.P_CHK_VERIFICA_FLUXO_SETOR(xml, pIT_PROTOCOLO_DOC, pPROTOCOLO_DOC, FSV_MODE);
END;
PROCEDURE P_CHK_M_PROT_ENVIO_SETOR (in_params in Clob, out_params out Clob) IS
    xml PKG_XML.XmlContext;
    pprotocolo_doc PROTOCOLO_DOCRec;
    pit_protocolo_doc IT_PROTOCOLO_DOCRec;
    formParams FormParamsRec;
    FSV_MODE VARCHAR2(4000);
BEGIN
        xml := PKG_XML.Init(in_params);
        -- extract input parameters from the XML
        pIT_PROTOCOLO_DOC.CD_DOCUMENTO_PROT:= PKG_XML.GetNUMBER(xml, 'IT_PROTOCOLO_DOC.CD_DOCUMENTO_PROT');
        pPROTOCOLO_DOC.CD_SETOR:= PKG_XML.GetNUMBER(xml, 'PROTOCOLO_DOC.CD_SETOR');
        pPROTOCOLO_DOC.DSP_NM_SETOR:= PKG_XML.GetVARCHAR2(xml, 'PROTOCOLO_DOC.DSP_NM_SETOR');
        pPROTOCOLO_DOC.CD_SETOR_DESTINO:= PKG_XML.GetNUMBER(xml, 'PROTOCOLO_DOC.CD_SETOR_DESTINO');
        formParams.P_NM_SETOR:= PKG_XML.GetVARCHAR2(xml, 'PARAMETER.P_NM_SETOR');
        formParams.P_CD_MULTI_EMPRESA:= PKG_XML.GetNUMBER(xml, 'PARAMETER.P_CD_MULTI_EMPRESA');
        formParams.P_CD_SETOR:= PKG_XML.GetNUMBER(xml, 'PARAMETER.P_CD_SETOR');
        FSV_MODE:= PKG_XML.GetVARCHAR2(xml, 'FSV_MODE');
        BEGIN
            IF Pkg_MOVDOC_M_PROT_ENVIO_C.P_CHK_M_PROT_ENVIO_SETOR_E(xml) THEN
                P_CHK_M_PROT_ENVIO_SETOR(xml, pPROTOCOLO_DOC, pIT_PROTOCOLO_DOC, formParams, FSV_MODE);
                Pkg_MOVDOC_M_PROT_ENVIO_C.P_CHK_M_PROT_ENVIO_SETOR_S(xml);
            END IF;
        EXCEPTION
        WHEN OTHERS THEN
            PKG_XML.AddException(xml, SQLCODE, SQLERRM);
        END;
        -- save output parameters to the XML
        PKG_XML.SetNUMBER(xml, 'IT_PROTOCOLO_DOC.CD_DOCUMENTO_PROT', pIT_PROTOCOLO_DOC.CD_DOCUMENTO_PROT);
        PKG_XML.SetNUMBER(xml, 'PROTOCOLO_DOC.CD_SETOR', pPROTOCOLO_DOC.CD_SETOR);
        PKG_XML.SetVARCHAR2(xml, 'PROTOCOLO_DOC.DSP_NM_SETOR', pPROTOCOLO_DOC.DSP_NM_SETOR);
        PKG_XML.SetNUMBER(xml, 'PROTOCOLO_DOC.CD_SETOR_DESTINO', pPROTOCOLO_DOC.CD_SETOR_DESTINO);
        PKG_XML.SetVARCHAR2(xml, 'PARAMETER.P_NM_SETOR', formParams.P_NM_SETOR);
        PKG_XML.SetNUMBER(xml, 'PARAMETER.P_CD_MULTI_EMPRESA', formParams.P_CD_MULTI_EMPRESA);
        PKG_XML.SetNUMBER(xml, 'PARAMETER.P_CD_SETOR', formParams.P_CD_SETOR);
        PKG_XML.SetVARCHAR2(xml, 'FSV_MODE', FSV_MODE);
        out_params := PKG_XML.GetOutputClob(xml);
END;
    /*
    <DATA_CRIACAO>13/01/2011 17:42</DATA_CRIACAO>
    <CRIADO_POR>Ferramenta de Migração ATX</CRIADO_POR>
    <OBJETIVO>CGRI$CHK_PROTOCOLO_DOC</OBJETIVO>
    <ALTERACOES></ALTERACOES>
    */
	PROCEDURE P_CHK_PROTOCOLO_DOC (xml IN OUT NOCOPY PKG_XML.XmlContext,P_CD_PROTOCOLO_DOC IN NUMBER) IS
CURSOR  cItens IS
    SELECT  'X'
      FROM  IT_PROTOCOLO_DOC
     WHERE  CD_PROTOCOLO_DOC = P_CD_PROTOCOLO_DOC
       AND (DT_RECEBIMENTO IS NOT NULL  OR  DT_DEVOLUCAO IS NOT NULL);
     vITENS varchar2(1);
BEGIN
    OPEN  cItens;
    FETCH  cItens  INTO  vITENS;
    IF  cItens%FOUND  THEN
          --MULTI-IDIOMA: Utilização do pkg_rmi_traducao.extrair_msg para mensagens (MSG_5)
          --MULTI-IDIOMA: Utilização do pkg_rmi_traducao.extrair_msg para mensagens (MSG_6)
          PKG_XML_MGS.CHAMA_MENSAGEM(xml, pkg_rmi_traducao.extrair_pkg_msg('MSG_5', 'PKG_MOVDOC_M_PROT_ENVIO', 'Atenção:'),
		  pkg_rmi_traducao.extrair_pkg_msg('MSG_6', 'PKG_MOVDOC_M_PROT_ENVIO', 'Este protocolo já possui itens recebidos ou devolvidos, não pode ser excluído!'),true);
  END IF;
END;
PROCEDURE P_CHK_PROTOCOLO_DOC (in_params in Clob, out_params out Clob) IS
    xml PKG_XML.XmlContext;
    P_CD_PROTOCOLO_DOC NUMBER;
BEGIN
        xml := PKG_XML.Init(in_params);
        -- extract input parameters from the XML
        P_CD_PROTOCOLO_DOC:= PKG_XML.GetNUMBER(xml, 'P_CD_PROTOCOLO_DOC');
        BEGIN
            IF Pkg_MOVDOC_M_PROT_ENVIO_C.P_CHK_PROTOCOLO_DOC_E(xml) THEN
                P_CHK_PROTOCOLO_DOC(xml, P_CD_PROTOCOLO_DOC);
                Pkg_MOVDOC_M_PROT_ENVIO_C.P_CHK_PROTOCOLO_DOC_S(xml);
            END IF;
        EXCEPTION
        WHEN OTHERS THEN
            PKG_XML.AddException(xml, SQLCODE, SQLERRM);
        END;
        -- save output parameters to the XML
        out_params := PKG_XML.GetOutputClob(xml);
END;
    /*
    <DATA_CRIACAO>13/01/2011 17:42</DATA_CRIACAO>
    <CRIADO_POR>Ferramenta de Migração ATX</CRIADO_POR>
    <OBJETIVO>CGFK$CHK_M_PROT_ENVIO_ATENDIME</OBJETIVO>
    <ALTERACOES></ALTERACOES>
    */
	PROCEDURE P_CHK_M_PROT_ENVIO_ATENDIME (xml IN OUT NOCOPY PKG_XML.XmlContext,pit_protocolo_doc IN OUT NOCOPY IT_PROTOCOLO_DOCRec, formParams IN OUT NOCOPY FormParamsRec,P_CD_ATENDIMENTO IN NUMBER) IS
BEGIN
  DECLARE
    --Considerar atendimentos do tipo 'B' - Busca Ativa
    CURSOR C IS
      select  atendime.cd_paciente dsp_cd_paciente,
              atendime.dt_atendimento dsp_dt_atendimento,
              decode(atendime.tp_atendimento,'I','HOSPITALAR',
                     'A','AMBULATÓRIO',
                     'E','EXTERNO',
                     'U','URGÊNCIA',
                     'H','HOME CARE',
                     'B','BUSCA ATIVA',
                     ' ') dsp_tp_atendimento,
              paciente.nm_paciente dsp_nm_paciente,
              prestador.nm_prestador dsp_nm_prestador,
               CONVENIO.CD_CONVENIO CD_CONVENIO,
              CONVENIO.NM_CONVENIO DSP_NM_CONVENIO
        from  atendime atendime,
              paciente paciente,
              prestador prestador,
              convenio convenio
       Where  atendime.cd_multi_empresa  =  formParams.P_CD_MULTI_EMPRESA
         and  atendime.cd_paciente  =  paciente.cd_paciente
         and  atendime.cd_prestador  =  prestador.cd_prestador(+)
         and  atendime.cd_convenio  =  convenio.cd_convenio

         -- OP 34289 - 18/04/2016 - Novos tipos de atendimento no campo de seleção.
         AND (   (( Nvl(pIT_PROTOCOLO_DOC.DSP_TIPO_ATENDE,'T') in ('HO', 'I', 'T') ) and atendime.tp_atendimento = 'I' )
              or (( Nvl(pIT_PROTOCOLO_DOC.DSP_TIPO_ATENDE,'T') in ('HO', 'H', 'T') ) and atendime.tp_atendimento = 'H' )
              or (( Nvl(pIT_PROTOCOLO_DOC.DSP_TIPO_ATENDE,'T') in ('HO', 'B', 'T') ) and atendime.tp_atendimento = 'B' )
			  or (( Nvl(pIT_PROTOCOLO_DOC.DSP_TIPO_ATENDE,'T') in ('HO', 'H', 'T') ) and atendime.tp_atendimento = 'S' )
              or (( Nvl(pIT_PROTOCOLO_DOC.DSP_TIPO_ATENDE,'T') in ('AM', 'A', 'T') ) and atendime.tp_atendimento = 'A' )
              or (( Nvl(pIT_PROTOCOLO_DOC.DSP_TIPO_ATENDE,'T') in ('AM', 'E', 'T') ) and atendime.tp_atendimento = 'E' )
              or (( Nvl(pIT_PROTOCOLO_DOC.DSP_TIPO_ATENDE,'T') in ('AM', 'U', 'T') ) and atendime.tp_atendimento = 'U' )
              )
         --AND  ((atendime.tp_atendimento IN ('A','E','U') AND nvl(pIT_PROTOCOLO_DOC.DSP_TIPO_ATENDE, 'A') = 'A')
         -- OR   (atendime.tp_atendimento IN ('I','H')AND nvl(pIT_PROTOCOLO_DOC.DSP_TIPO_ATENDE, 'H') = 'H')
         -- OR   (atendime.tp_atendimento IN ('B') AND nvl(pIT_PROTOCOLO_DOC.DSP_TIPO_ATENDE, 'B') = 'B'))

         and  atendime.cd_atendimento  =  P_CD_ATENDIMENTO;

   -- PDA 388517 PDA de ERRO 387950 - 11/05/2011 - André Piana - incluindo cursor para trazer o convênio do atendimento
   cursor cConvenio is
		   SELECT conta.cd_convenio, convenio.nm_convenio
			   FROM (SELECT cd_convenio
					       FROM dbamv.reg_fat
					      WHERE cd_reg_fat = pIT_PROTOCOLO_DOC.DSP_CD_CONTA
					        AND cd_atendimento = pIT_PROTOCOLO_DOC.CD_ATENDIMENTO
					        and cd_multi_empresa =  formParams.P_CD_MULTI_EMPRESA
					      UNION
					     SELECT r.cd_convenio
					       FROM dbamv.reg_amb r, dbamv.itreg_amb it
					      WHERE r.cd_reg_amb = pIT_PROTOCOLO_DOC.DSP_CD_CONTA
					        AND r.cd_reg_amb = it.cd_reg_amb
					        AND it.cd_atendimento = pIT_PROTOCOLO_DOC.CD_ATENDIMENTO
					        and r.cd_multi_empresa =  formParams.P_CD_MULTI_EMPRESA  ) conta,
					     dbamv.convenio
					WHERE convenio.cd_convenio = conta.cd_convenio;
  BEGIN
    OPEN C;
    FETCH C
    INTO     pIT_PROTOCOLO_DOC.DSP_CD_PACIENTE,
             pIT_PROTOCOLO_DOC.DSP_DT_ATENDIMENTO,
             pIT_PROTOCOLO_DOC.DSP_TP_ATENDIMENTO,
             pIT_PROTOCOLO_DOC.DSP_NM_PACIENTE,
             pIT_PROTOCOLO_DOC.DSP_NM_PRESTADOR,
             pIT_PROTOCOLO_DOC.CD_CONVENIO,
	           pIT_PROTOCOLO_DOC.DSP_NM_CONVENIO;
       /* PDA 388517 PDA de ERRO 387950 - 11/05/2011 - André Piana
        caso a conta não esteja nula, o convenio a ser recuperado deve ser o da conta */
    	 if pIT_PROTOCOLO_DOC.DSP_CD_CONTA is not null then
    			open cConvenio;
    			fetch cConvenio into pIT_PROTOCOLO_DOC.CD_CONVENIO,pIT_PROTOCOLO_DOC.DSP_NM_CONVENIO;
    			close cConvenio;
    	 end if;
     -- PDA  388517  - Fim
    IF C%NOTFOUND THEN
      CLOSE C;
      RAISE NO_DATA_FOUND;
    END IF;
    CLOSE C;
  END;
END;
PROCEDURE P_CHK_M_PROT_ENVIO_ATENDIME (in_params in Clob, out_params out Clob) IS
    xml PKG_XML.XmlContext;
    P_CD_ATENDIMENTO NUMBER;
    pit_protocolo_doc IT_PROTOCOLO_DOCRec;
    formParams FormParamsRec;
BEGIN
        xml := PKG_XML.Init(in_params);
        -- extract input parameters from the XML
        pIT_PROTOCOLO_DOC.DSP_TIPO_ATENDE:= PKG_XML.GetVARCHAR2(xml, 'IT_PROTOCOLO_DOC.DSP_TIPO_ATENDE');
        pIT_PROTOCOLO_DOC.DSP_CD_PACIENTE:= PKG_XML.GetNUMBER(xml, 'IT_PROTOCOLO_DOC.DSP_CD_PACIENTE');
        pIT_PROTOCOLO_DOC.DSP_DT_ATENDIMENTO:= PKG_XML.GetDATE(xml, 'IT_PROTOCOLO_DOC.DSP_DT_ATENDIMENTO');
        pIT_PROTOCOLO_DOC.DSP_TP_ATENDIMENTO:= PKG_XML.GetVARCHAR2(xml, 'IT_PROTOCOLO_DOC.DSP_TP_ATENDIMENTO');
        pIT_PROTOCOLO_DOC.DSP_NM_PACIENTE:= PKG_XML.GetVARCHAR2(xml, 'IT_PROTOCOLO_DOC.DSP_NM_PACIENTE');
        pIT_PROTOCOLO_DOC.DSP_NM_PRESTADOR:= PKG_XML.GetVARCHAR2(xml, 'IT_PROTOCOLO_DOC.DSP_NM_PRESTADOR');
        formParams.P_CD_MULTI_EMPRESA:= PKG_XML.GetNUMBER(xml, 'PARAMETER.P_CD_MULTI_EMPRESA');
        P_CD_ATENDIMENTO:= PKG_XML.GetNUMBER(xml, 'P_CD_ATENDIMENTO');
        BEGIN
            IF Pkg_MOVDOC_M_PROT_ENVIO_C.P_CHK_M_PROT_ENVIO_ATENDIME_E(xml) THEN
                P_CHK_M_PROT_ENVIO_ATENDIME(xml, pIT_PROTOCOLO_DOC, formParams, P_CD_ATENDIMENTO);
                Pkg_MOVDOC_M_PROT_ENVIO_C.P_CHK_M_PROT_ENVIO_ATENDIME_S(xml);
            END IF;
        EXCEPTION
        WHEN OTHERS THEN
            PKG_XML.AddException(xml, SQLCODE, SQLERRM);
        END;
        -- save output parameters to the XML
        PKG_XML.SetVARCHAR2(xml, 'IT_PROTOCOLO_DOC.DSP_TIPO_ATENDE', pIT_PROTOCOLO_DOC.DSP_TIPO_ATENDE);
        PKG_XML.SetNUMBER(xml, 'IT_PROTOCOLO_DOC.DSP_CD_PACIENTE', pIT_PROTOCOLO_DOC.DSP_CD_PACIENTE);
        PKG_XML.SetDATE(xml, 'IT_PROTOCOLO_DOC.DSP_DT_ATENDIMENTO', pIT_PROTOCOLO_DOC.DSP_DT_ATENDIMENTO);
        PKG_XML.SetVARCHAR2(xml, 'IT_PROTOCOLO_DOC.DSP_TP_ATENDIMENTO', pIT_PROTOCOLO_DOC.DSP_TP_ATENDIMENTO);
        PKG_XML.SetVARCHAR2(xml, 'IT_PROTOCOLO_DOC.DSP_NM_PACIENTE', pIT_PROTOCOLO_DOC.DSP_NM_PACIENTE);
        PKG_XML.SetVARCHAR2(xml, 'IT_PROTOCOLO_DOC.DSP_NM_PRESTADOR', pIT_PROTOCOLO_DOC.DSP_NM_PRESTADOR);
        PKG_XML.SetNUMBER(xml, 'PARAMETER.P_CD_MULTI_EMPRESA', formParams.P_CD_MULTI_EMPRESA);
        out_params := PKG_XML.GetOutputClob(xml);
END;
    /*
    <DATA_CRIACAO>13/01/2011 17:42</DATA_CRIACAO>
    <CRIADO_POR>Ferramenta de Migração ATX</CRIADO_POR>
    <OBJETIVO>CGFK$CHK_M_PROT_ENVIO_DOC_PROT</OBJETIVO>
    <ALTERACOES></ALTERACOES>
    */
	PROCEDURE P_CHK_M_PROT_ENVIO_DOC_PROT (xml IN OUT NOCOPY PKG_XML.XmlContext,pit_protocolo_doc IN OUT NOCOPY IT_PROTOCOLO_DOCRec,P_CD_DOCUMENTO_PROT IN NUMBER,
   P_CD_SETOR IN NUMBER) IS
BEGIN
  DECLARE
    CURSOR C IS
      select  documento_prot.ds_documento_prot dsp_ds_documento_prot,
              documento_prot.sn_codigo dsp_sn_codigo
        from  documento_prot,
              gru_doc gru_doc
       where  documento_prot.cd_gru_doc = gru_doc.cd_gru_doc
         and  documento_prot.sn_protocolo  =  'S'
         and  documento_prot.cd_documento_prot in (select distinct cd_documento_prot
                                                   from documento_set
                                                   where cd_setor = P_CD_SETOR)
         and  documento_prot.cd_documento_prot  =  P_CD_DOCUMENTO_PROT;
  BEGIN
    OPEN C;
    FETCH C
    INTO  pIT_PROTOCOLO_DOC.DSP_DS_DOCUMENTO_PROT,
          pIT_PROTOCOLO_DOC.DSP_SN_CODIGO;
    IF C%NOTFOUND THEN
      CLOSE C;
      RAISE NO_DATA_FOUND;
    END IF;
    CLOSE C;
  END;
END;
PROCEDURE P_CHK_M_PROT_ENVIO_DOC_PROT (in_params in Clob, out_params out Clob) IS
    xml PKG_XML.XmlContext;
    P_CD_DOCUMENTO_PROT NUMBER;
    P_CD_SETOR NUMBER;
    pit_protocolo_doc IT_PROTOCOLO_DOCRec;
BEGIN
        xml := PKG_XML.Init(in_params);
        -- extract input parameters from the XML
        pIT_PROTOCOLO_DOC.DSP_DS_DOCUMENTO_PROT:= PKG_XML.GetVARCHAR2(xml, 'IT_PROTOCOLO_DOC.DSP_DS_DOCUMENTO_PROT');
        pIT_PROTOCOLO_DOC.DSP_SN_CODIGO:= PKG_XML.GetVARCHAR2(xml, 'IT_PROTOCOLO_DOC.DSP_SN_CODIGO');
        P_CD_DOCUMENTO_PROT:= PKG_XML.GetNUMBER(xml, 'P_CD_DOCUMENTO_PROT');
        P_CD_SETOR:= PKG_XML.GetNUMBER(xml, 'P_CD_SETOR');
        BEGIN
            IF Pkg_MOVDOC_M_PROT_ENVIO_C.P_CHK_M_PROT_ENVIO_DOC_PROT_E(xml) THEN
                P_CHK_M_PROT_ENVIO_DOC_PROT(xml, pIT_PROTOCOLO_DOC, P_CD_DOCUMENTO_PROT, P_CD_SETOR);
                Pkg_MOVDOC_M_PROT_ENVIO_C.P_CHK_M_PROT_ENVIO_DOC_PROT_S(xml);
            END IF;
        EXCEPTION
        WHEN OTHERS THEN
            PKG_XML.AddException(xml, SQLCODE, SQLERRM);
        END;
        -- save output parameters to the XML
        PKG_XML.SetVARCHAR2(xml, 'IT_PROTOCOLO_DOC.DSP_DS_DOCUMENTO_PROT', pIT_PROTOCOLO_DOC.DSP_DS_DOCUMENTO_PROT);
        PKG_XML.SetVARCHAR2(xml, 'IT_PROTOCOLO_DOC.DSP_SN_CODIGO', pIT_PROTOCOLO_DOC.DSP_SN_CODIGO);
        out_params := PKG_XML.GetOutputClob(xml);
END;
    /*
    <DATA_CRIACAO>13/01/2011 17:42</DATA_CRIACAO>
    <CRIADO_POR>Ferramenta de Migração ATX</CRIADO_POR>
    <OBJETIVO>CGFK$CHK_M_PROT_ENVIO_CONVENIO</OBJETIVO>
    <ALTERACOES></ALTERACOES>
    */
	PROCEDURE P_CHK_M_PROT_ENVIO_CONVENIO (xml IN OUT NOCOPY PKG_XML.XmlContext,pit_protocolo_doc IN OUT NOCOPY IT_PROTOCOLO_DOCRec, formParams IN OUT NOCOPY FormParamsRec,P_CD_CONVENIO IN NUMBER,
   P_CD_ATENDIMENTO IN NUMBER) IS
BEGIN
  DECLARE
    CURSOR cConvenio IS
      select  convenio.nm_convenio dsp_nm_convenio
        from  convenio convenio
       Where  convenio.cd_convenio in (select distinct reg_fat.cd_convenio
                                         from reg_fat
                                        where reg_fat.cd_atendimento = P_CD_ATENDIMENTO
                                         AND REG_FAT.CD_MULTI_EMPRESA = formParams.P_CD_MULTI_EMPRESA
                                       union
                                       select distinct eve_siasus.cd_convenio
                                         from eve_siasus
                                       where eve_siasus.cd_atendimento = P_CD_ATENDIMENTO
                                         AND eve_siasus.CD_MULTI_EMPRESA = formParams.P_CD_MULTI_EMPRESA
          union
                                        select distinct reg_amb.cd_convenio
                                         from reg_amb,
                                              itreg_amb
                                        where itreg_amb.cd_atendimento = P_CD_ATENDIMENTO
                                          AND REG_AMB.CD_MULTI_EMPRESA = formParams.P_CD_MULTI_EMPRESA
                                          and itreg_amb.cd_reg_amb = reg_amb.cd_reg_amb
                                       union
                                        select atendime.cd_convenio
                                         from atendime
                                        where (atendime.cd_atendimento = P_CD_ATENDIMENTO
                                           or  atendime.cd_atendimento = (select cd_atendimento_pai
                                                                             from atendime
                                                                            where cd_atendimento = P_CD_ATENDIMENTO
                                                                              AND atendime.CD_MULTI_EMPRESA = formParams.P_CD_MULTI_EMPRESA))
                                          AND atendime.cd_multi_empresa = formParams.P_CD_MULTI_EMPRESA)
         and  convenio.cd_convenio  =  P_CD_CONVENIO;
  BEGIN
    OPEN cConvenio;
    FETCH cConvenio
    INTO     pIT_PROTOCOLO_DOC.DSP_NM_CONVENIO;
    IF cConvenio%NOTFOUND THEN
      CLOSE cConvenio;
      RAISE NO_DATA_FOUND;
    END IF;
    CLOSE cConvenio;
  END;
END;
PROCEDURE P_CHK_M_PROT_ENVIO_CONVENIO (in_params in Clob, out_params out Clob) IS
    xml PKG_XML.XmlContext;
    P_CD_CONVENIO NUMBER;
    P_CD_ATENDIMENTO NUMBER;
    pit_protocolo_doc IT_PROTOCOLO_DOCRec;
    formParams FormParamsRec;
BEGIN
        xml := PKG_XML.Init(in_params);
        -- extract input parameters from the XML
        pIT_PROTOCOLO_DOC.DSP_NM_CONVENIO:= PKG_XML.GetVARCHAR2(xml, 'IT_PROTOCOLO_DOC.DSP_NM_CONVENIO');
        formParams.P_CD_MULTI_EMPRESA:= PKG_XML.GetNUMBER(xml, 'PARAMETER.P_CD_MULTI_EMPRESA');
        P_CD_CONVENIO:= PKG_XML.GetNUMBER(xml, 'P_CD_CONVENIO');
        P_CD_ATENDIMENTO:= PKG_XML.GetNUMBER(xml, 'P_CD_ATENDIMENTO');
        BEGIN
            IF Pkg_MOVDOC_M_PROT_ENVIO_C.P_CHK_M_PROT_ENVIO_CONVENIO_E(xml) THEN
                P_CHK_M_PROT_ENVIO_CONVENIO(xml, pIT_PROTOCOLO_DOC, formParams, P_CD_CONVENIO, P_CD_ATENDIMENTO);
                Pkg_MOVDOC_M_PROT_ENVIO_C.P_CHK_M_PROT_ENVIO_CONVENIO_S(xml);
            END IF;
        EXCEPTION
        WHEN OTHERS THEN
            PKG_XML.AddException(xml, SQLCODE, SQLERRM);
        END;
        -- save output parameters to the XML
        PKG_XML.SetVARCHAR2(xml, 'IT_PROTOCOLO_DOC.DSP_NM_CONVENIO', pIT_PROTOCOLO_DOC.DSP_NM_CONVENIO);
        PKG_XML.SetNUMBER(xml, 'PARAMETER.P_CD_MULTI_EMPRESA', formParams.P_CD_MULTI_EMPRESA);
        out_params := PKG_XML.GetOutputClob(xml);
END;
    /*
    <DATA_CRIACAO>13/01/2011 17:42</DATA_CRIACAO>
    <CRIADO_POR>Ferramenta de Migração ATX</CRIADO_POR>
    <OBJETIVO>CGFK$CHK_M_PROT_ENVIO_SETOR_DE</OBJETIVO>
    <ALTERACOES></ALTERACOES>
    */
	PROCEDURE P_CHK_M_PROT_ENVIO_SETOR_DE (xml IN OUT NOCOPY PKG_XML.XmlContext,pprotocolo_doc IN OUT NOCOPY PROTOCOLO_DOCRec, pit_protocolo_doc IN OUT NOCOPY IT_PROTOCOLO_DOCRec, formParams IN OUT NOCOPY FormParamsRec, FSV_MODE IN OUT NOCOPY varchar2) IS
BEGIN
    if  FSV_mode <> 'QUERY' then
      Pkg_MOVDOC_M_PROT_ENVIO.P_RETORNA_SETOR(xml, formParams, pPROTOCOLO_DOC.CD_SETOR_DESTINO, true, true);
    else
        Pkg_MOVDOC_M_PROT_ENVIO.P_RETORNA_SETOR(xml, formParams, pPROTOCOLO_DOC.CD_SETOR_DESTINO, false, false);
    end if;
  IF  formParams.P_CD_SETOR <>  pPROTOCOLO_DOC.CD_SETOR then
         pPROTOCOLO_DOC.DSP_NM_SETOR_DESTINO := formParams.P_NM_SETOR;
    ELSE
         --MULTI-IDIOMA: Utilização do pkg_rmi_traducao.extrair_msg para mensagens (MSG_5)
         --MULTI-IDIOMA: Utilização do pkg_rmi_traducao.extrair_msg para mensagens (MSG_7)
         PKG_XML_MGS.CHAMA_MENSAGEM(xml, pkg_rmi_traducao.extrair_pkg_msg('MSG_5', 'PKG_MOVDOC_M_PROT_ENVIO', 'Atenção:'),
		 pkg_rmi_traducao.extrair_pkg_msg('MSG_7', 'PKG_MOVDOC_M_PROT_ENVIO', 'Erro: Setor de destino não pode ser igual ao setor de origem.%sAção: Escolha um novo setor de destino.', arg_list(chr(10))), true);
    END IF;
    Pkg_MOVDOC_M_PROT_ENVIO.P_CHK_VERIFICA_FLUXO_SETOR(xml, pIT_PROTOCOLO_DOC, pPROTOCOLO_DOC, FSV_MODE);
END;
PROCEDURE P_CHK_M_PROT_ENVIO_SETOR_DE (in_params in Clob, out_params out Clob) IS
    xml PKG_XML.XmlContext;
    pprotocolo_doc PROTOCOLO_DOCRec;
    pit_protocolo_doc IT_PROTOCOLO_DOCRec;
    formParams FormParamsRec;
    FSV_MODE VARCHAR2(4000);
BEGIN
        xml := PKG_XML.Init(in_params);
        -- extract input parameters from the XML
        pIT_PROTOCOLO_DOC.CD_DOCUMENTO_PROT:= PKG_XML.GetNUMBER(xml, 'IT_PROTOCOLO_DOC.CD_DOCUMENTO_PROT');
        pPROTOCOLO_DOC.CD_SETOR_DESTINO:= PKG_XML.GetNUMBER(xml, 'PROTOCOLO_DOC.CD_SETOR_DESTINO');
        pPROTOCOLO_DOC.CD_SETOR:= PKG_XML.GetNUMBER(xml, 'PROTOCOLO_DOC.CD_SETOR');
        pPROTOCOLO_DOC.DSP_NM_SETOR_DESTINO:= PKG_XML.GetVARCHAR2(xml, 'PROTOCOLO_DOC.DSP_NM_SETOR_DESTINO');
        formParams.P_CD_SETOR:= PKG_XML.GetNUMBER(xml, 'PARAMETER.P_CD_SETOR');
        formParams.P_NM_SETOR:= PKG_XML.GetVARCHAR2(xml, 'PARAMETER.P_NM_SETOR');
        formParams.P_CD_MULTI_EMPRESA:= PKG_XML.GetNUMBER(xml, 'PARAMETER.P_CD_MULTI_EMPRESA');
        FSV_MODE:= PKG_XML.GetVARCHAR2(xml, 'FSV_MODE');
        BEGIN
            IF Pkg_MOVDOC_M_PROT_ENVIO_C.P_CHK_M_PROT_ENVIO_SETOR_DE_E(xml) THEN
                P_CHK_M_PROT_ENVIO_SETOR_DE(xml, pPROTOCOLO_DOC, pIT_PROTOCOLO_DOC, formParams, FSV_MODE);
                Pkg_MOVDOC_M_PROT_ENVIO_C.P_CHK_M_PROT_ENVIO_SETOR_DE_S(xml);
            END IF;
        EXCEPTION
        WHEN OTHERS THEN
            PKG_XML.AddException(xml, SQLCODE, SQLERRM);
        END;
        -- save output parameters to the XML
        PKG_XML.SetNUMBER(xml, 'IT_PROTOCOLO_DOC.CD_DOCUMENTO_PROT', pIT_PROTOCOLO_DOC.CD_DOCUMENTO_PROT);
        PKG_XML.SetNUMBER(xml, 'PROTOCOLO_DOC.CD_SETOR_DESTINO', pPROTOCOLO_DOC.CD_SETOR_DESTINO);
        PKG_XML.SetNUMBER(xml, 'PROTOCOLO_DOC.CD_SETOR', pPROTOCOLO_DOC.CD_SETOR);
        PKG_XML.SetVARCHAR2(xml, 'PROTOCOLO_DOC.DSP_NM_SETOR_DESTINO', pPROTOCOLO_DOC.DSP_NM_SETOR_DESTINO);
        PKG_XML.SetNUMBER(xml, 'PARAMETER.P_CD_SETOR', formParams.P_CD_SETOR);
        PKG_XML.SetVARCHAR2(xml, 'PARAMETER.P_NM_SETOR', formParams.P_NM_SETOR);
        PKG_XML.SetNUMBER(xml, 'PARAMETER.P_CD_MULTI_EMPRESA', formParams.P_CD_MULTI_EMPRESA);
        PKG_XML.SetVARCHAR2(xml, 'FSV_MODE', FSV_MODE);
        out_params := PKG_XML.GetOutputClob(xml);
END;
    /*
    <DATA_CRIACAO>13/01/2011 17:42</DATA_CRIACAO>
    <CRIADO_POR>Ferramenta de Migração ATX</CRIADO_POR>
    <OBJETIVO>CGFK$CHK_M_PROT_ENVIO_CONTA</OBJETIVO>
    <ALTERACOES></ALTERACOES>
    */
	PROCEDURE P_CHK_M_PROT_ENVIO_CONTA (xml IN OUT NOCOPY PKG_XML.XmlContext,pit_protocolo_doc IN OUT NOCOPY IT_PROTOCOLO_DOCRec,
	pcg$ctrl_import IN OUT NOCOPY CG$CTRL_IMPORTRec, global IN OUT NOCOPY GlobalsRec, formParams IN OUT NOCOPY FormParamsRec, FSV_RECORD_STATUS IN OUT NOCOPY varchar2,pCD_CONTA IN reg_fat.cd_reg_fat%type) IS
BEGIN
    DECLARE
          Cursor c_conta(cCd_Conta in reg_fat.cd_reg_fat%type) is
         select distinct cd_conta_ffcv, tp_conta, cd_atendimento
            From (Select reg_fat.cd_reg_fat  cd_conta_ffcv,
                'Hospitalar' tp_conta,
                atendime.cd_atendimento
           From reg_fat, atendime
          Where reg_fat.cd_atendimento = atendime.cd_atendimento
            AND REG_FAT.CD_MULTI_EMPRESA = formParams.P_CD_MULTI_EMPRESA
            and reg_fat.cd_reg_fat = cCd_Conta
            AND reg_fat.cd_atendimento = Nvl(pIT_PROTOCOLO_DOC.CD_ATENDIMENTO, reg_fat.cd_atendimento) -- OP 46197
            and atendime.tp_atendimento in ('I', 'H') -- PDA 392354 PDA de erro 391516
            and pIT_PROTOCOLO_DOC.dsp_tipo_atende in ('H','HO','I','T')  --OP48429
        Union All
         Select itreg_amb.cd_reg_amb,
                'Ambulatorial' tp_conta,
                atendime.cd_atendimento
             from atendime, itreg_amb
            Where itreg_amb.cd_atendimento = atendime.cd_atendimento
              AND atendime.CD_MULTI_EMPRESA = formParams.P_CD_MULTI_EMPRESA
              and itreg_amb.cd_reg_amb = cCd_Conta
              AND itreg_amb.cd_atendimento = Nvl(pIT_PROTOCOLO_DOC.CD_ATENDIMENTO, itreg_amb.cd_atendimento)  -- OP 46197
              and atendime.tp_atendimento in ('A','E','U')
             and pIT_PROTOCOLO_DOC.dsp_tipo_atende IN ( 'A','AM','U','E','T')--OP48429
        Union All
           Select reg_fat.cd_reg_fat  cd_conta_ffcv,
                'Hospitalar' tp_conta,
                atendime.cd_atendimento
           From reg_fat, atendime
          Where reg_fat.cd_atendimento(+) = atendime.cd_atendimento
            AND REG_FAT.CD_MULTI_EMPRESA = formParams.P_CD_MULTI_EMPRESA
            and reg_fat.cd_reg_fat = cCd_Conta
            AND reg_fat.cd_atendimento = Nvl(pIT_PROTOCOLO_DOC.CD_ATENDIMENTO, reg_fat.cd_atendimento) -- OP 46197
            and atendime.tp_atendimento = 'B'
           and pIT_PROTOCOLO_DOC.dsp_tipo_atende in ('B','T') --OP48429
              ) order by cd_atendimento DESC;
      LINHA  C_CONTA%ROWTYPE;
    BEGIN
   OPEN C_CONTA(pCd_Conta);
    FETCH C_CONTA INTO LINHA;
    IF  C_CONTA%NOTFOUND  THEN
         CLOSE C_CONTA;
         RAISE NO_DATA_FOUND;
    END IF;
    CLOSE C_CONTA;
    If   ( FSV_Record_Status <> 'QUERY' OR  global.Lg_Atendime='TRUE') and nvl( pCG$CTRL_IMPORT.SN_IMPORT, 'N') = 'N' Then
         pIT_PROTOCOLO_DOC.TP_CONTA:=LINHA.TP_CONTA;
         pIT_PROTOCOLO_DOC.CD_ATENDIMENTO:=LINHA.CD_ATENDIMENTO;
    End if;
  END;
END;
PROCEDURE P_CHK_M_PROT_ENVIO_CONTA (in_params in Clob, out_params out Clob) IS
    xml PKG_XML.XmlContext;
    pCD_CONTA NUMBER;
    pit_protocolo_doc IT_PROTOCOLO_DOCRec;
    pcg$ctrl_import CG$CTRL_IMPORTRec;
    global GlobalsRec;
    formParams FormParamsRec;
    FSV_RECORD_STATUS VARCHAR2(4000);
BEGIN
        xml := PKG_XML.Init(in_params);
        -- extract input parameters from the XML
        pCG$CTRL_IMPORT.SN_IMPORT:= PKG_XML.GetVARCHAR2(xml, 'CG$CTRL_IMPORT.SN_IMPORT');
        pIT_PROTOCOLO_DOC.DSP_TIPO_ATENDE:= PKG_XML.GetVARCHAR2(xml, 'IT_PROTOCOLO_DOC.DSP_TIPO_ATENDE');
        pIT_PROTOCOLO_DOC.TP_CONTA:= PKG_XML.GetVARCHAR2(xml, 'IT_PROTOCOLO_DOC.TP_CONTA');
        pIT_PROTOCOLO_DOC.CD_ATENDIMENTO:= PKG_XML.GetNUMBER(xml, 'IT_PROTOCOLO_DOC.CD_ATENDIMENTO');
        global.LG_ATENDIME:= PKG_XML.GetVARCHAR2(xml, 'GLOBAL.LG_ATENDIME');
        formParams.P_CD_MULTI_EMPRESA:= PKG_XML.GetNUMBER(xml, 'PARAMETER.P_CD_MULTI_EMPRESA');
        FSV_RECORD_STATUS:= PKG_XML.GetVARCHAR2(xml, 'FSV_RECORD_STATUS');
        pCD_CONTA:= PKG_XML.GetNUMBER(xml, 'pCD_CONTA');
        BEGIN
            IF Pkg_MOVDOC_M_PROT_ENVIO_C.P_CHK_M_PROT_ENVIO_CONTA_E(xml) THEN
                P_CHK_M_PROT_ENVIO_CONTA(xml, pIT_PROTOCOLO_DOC, pCG$CTRL_IMPORT, global, formParams, FSV_RECORD_STATUS, pCD_CONTA);
                Pkg_MOVDOC_M_PROT_ENVIO_C.P_CHK_M_PROT_ENVIO_CONTA_S(xml);
            END IF;
        EXCEPTION
        WHEN OTHERS THEN
            PKG_XML.AddException(xml, SQLCODE, SQLERRM);
        END;
        -- save output parameters to the XML
        PKG_XML.SetVARCHAR2(xml, 'CG$CTRL_IMPORT.SN_IMPORT', pCG$CTRL_IMPORT.SN_IMPORT);
        PKG_XML.SetVARCHAR2(xml, 'IT_PROTOCOLO_DOC.DSP_TIPO_ATENDE', pIT_PROTOCOLO_DOC.DSP_TIPO_ATENDE);
        PKG_XML.SetVARCHAR2(xml, 'IT_PROTOCOLO_DOC.TP_CONTA', pIT_PROTOCOLO_DOC.TP_CONTA);
        PKG_XML.SetNUMBER(xml, 'IT_PROTOCOLO_DOC.CD_ATENDIMENTO', pIT_PROTOCOLO_DOC.CD_ATENDIMENTO);
        PKG_XML.SetVARCHAR2(xml, 'GLOBAL.LG_ATENDIME', global.LG_ATENDIME);
        PKG_XML.SetNUMBER(xml, 'PARAMETER.P_CD_MULTI_EMPRESA', formParams.P_CD_MULTI_EMPRESA);
        PKG_XML.SetVARCHAR2(xml, 'FSV_RECORD_STATUS', FSV_RECORD_STATUS);
        out_params := PKG_XML.GetOutputClob(xml);
END;
    /*
    <DATA_CRIACAO>13/01/2011 17:42</DATA_CRIACAO>
    <CRIADO_POR>Ferramenta de Migração ATX</CRIADO_POR>
    <OBJETIVO>chk_conta</OBJETIVO>
    <ALTERACOES></ALTERACOES>
    */
	PROCEDURE P_CHK_CONTA (xml IN OUT NOCOPY PKG_XML.XmlContext,pit_protocolo_doc IN OUT NOCOPY IT_PROTOCOLO_DOCRec, formParams IN OUT NOCOPY FormParamsRec) IS
cSn_Conta  DOCUMENTO_PROT.SN_INFORMA_CONTA%TYPE;
BEGIN
  cSn_Conta := Pkg_MOVDOC_M_PROT_ENVIO.F_RETORNA_SN_INFORMA_CONTA(xml, pIT_PROTOCOLO_DOC, pIT_PROTOCOLO_DOC.CD_DOCUMENTO_PROT);
        if  pIT_PROTOCOLO_DOC.DSP_TIPO_ATENDE in ('H','B','I','HO') then
            if cSn_Conta = 'S' then
                --Habilita conta e desabilita atendimento-inicio
                if PKG_XML.GetPropVarChar2(xml, 'ITEM','IT_PROTOCOLO_DOC.DSP_CD_CONTA','ENABLED') = 'FALSE' then
                    PKG_XML.SetPropBoolean(xml, 'ITEM','IT_PROTOCOLO_DOC.DSP_CD_CONTA','ENABLED',true);
                    PKG_XML.SetPropBoolean(xml, 'ITEM','IT_PROTOCOLO_DOC.DSP_CD_CONTA','NAVIGABLE',true);
                    PKG_XML.SetPropBoolean(xml, 'ITEM','IT_PROTOCOLO_DOC.DSP_CD_CONTA','INSERT_ALLOWED',true);
                    PKG_XML.SetPropBoolean(xml, 'ITEM','IT_PROTOCOLO_DOC.DSP_CD_CONTA','UPDATEABLE',true);
                end if;
                if PKG_XML.GetPropVarChar2(xml, 'ITEM','IT_PROTOCOLO_DOC.CD_ATENDIMENTO','ENABLED') = 'TRUE' then
                    PKG_XML.SetPropBoolean(xml, 'ITEM','IT_PROTOCOLO_DOC.CD_ATENDIMENTO','ENABLED',false);
                    PKG_XML.SetPropBoolean(xml, 'ITEM','IT_PROTOCOLO_DOC.CD_ATENDIMENTO','NAVIGABLE',false);
                    PKG_XML.SetPropBoolean(xml, 'ITEM','IT_PROTOCOLO_DOC.CD_ATENDIMENTO','INSERT_ALLOWED',false);
                    PKG_XML.SetPropBoolean(xml, 'ITEM','IT_PROTOCOLO_DOC.CD_ATENDIMENTO','UPDATEABLE',false);
                    PKG_XML.SetPropBoolean(xml, 'ITEM','IT_PROTOCOLO_DOC.CD_ATENDIMENTO','REQUIRED',false);
                end if;
                --Habilita conta e desabilita atendimento-Fim
                elsif cSn_Conta = 'N' then
                --Habilita atendimento e desabilita conta - Inicio
                if PKG_XML.GetPropVarChar2(xml, 'ITEM','IT_PROTOCOLO_DOC.CD_ATENDIMENTO','ENABLED') = 'FALSE' then
                    PKG_XML.SetPropBoolean(xml, 'ITEM','IT_PROTOCOLO_DOC.CD_ATENDIMENTO','ENABLED',true);
                    PKG_XML.SetPropBoolean(xml, 'ITEM','IT_PROTOCOLO_DOC.CD_ATENDIMENTO','NAVIGABLE',true);
                    PKG_XML.SetPropBoolean(xml, 'ITEM','IT_PROTOCOLO_DOC.CD_ATENDIMENTO','INSERT_ALLOWED',true);
                    PKG_XML.SetPropBoolean(xml, 'ITEM','IT_PROTOCOLO_DOC.CD_ATENDIMENTO','UPDATEABLE',true);
                end if;
                if PKG_XML.GetPropVarChar2(xml, 'ITEM','IT_PROTOCOLO_DOC.DSP_CD_CONTA','ENABLED') = 'TRUE' then
                    PKG_XML.SetPropBoolean(xml, 'ITEM','IT_PROTOCOLO_DOC.DSP_CD_CONTA','ENABLED',false);
                    PKG_XML.SetPropBoolean(xml, 'ITEM','IT_PROTOCOLO_DOC.DSP_CD_CONTA','NAVIGABLE',false);
                    PKG_XML.SetPropBoolean(xml, 'ITEM','IT_PROTOCOLO_DOC.DSP_CD_CONTA','INSERT_ALLOWED',false);
                    PKG_XML.SetPropBoolean(xml, 'ITEM','IT_PROTOCOLO_DOC.DSP_CD_CONTA','UPDATEABLE',false);
                    PKG_XML.SetPropBoolean(xml, 'ITEM','IT_PROTOCOLO_DOC.CD_ATENDIMENTO','REQUIRED',false);
                end if;
                --Habilita atendimento e desabilita conta - Fim
            end if;
        else --Tipo Ambulatorial
            if  formParams.P_TP_CONTROLE_LOTE = 'A' then --Vários atendimentos por lote
                --Habilita atendimento e desabilita conta - Inicio
                if PKG_XML.GetPropVarChar2(xml, 'ITEM','IT_PROTOCOLO_DOC.CD_ATENDIMENTO','ENABLED') = 'FALSE' then
                    PKG_XML.SetPropBoolean(xml, 'ITEM','IT_PROTOCOLO_DOC.CD_ATENDIMENTO','ENABLED',true);
                    PKG_XML.SetPropBoolean(xml, 'ITEM','IT_PROTOCOLO_DOC.CD_ATENDIMENTO','NAVIGABLE',true);
                    PKG_XML.SetPropBoolean(xml, 'ITEM','IT_PROTOCOLO_DOC.CD_ATENDIMENTO','INSERT_ALLOWED',true);
                    PKG_XML.SetPropBoolean(xml, 'ITEM','IT_PROTOCOLO_DOC.CD_ATENDIMENTO','UPDATEABLE',true);
                end if;
                --Habilita atendimento e desabilita conta - Fim
                elsif  formParams.P_TP_CONTROLE_LOTE = 'U' then --Um atendimento por lote
                if cSn_Conta = 'S' then
                  --Habilita conta e desabilita atendimento-inicio
                    if PKG_XML.GetPropVarChar2(xml, 'ITEM','IT_PROTOCOLO_DOC.DSP_CD_CONTA','ENABLED') = 'FALSE' then
                        PKG_XML.SetPropBoolean(xml, 'ITEM','IT_PROTOCOLO_DOC.DSP_CD_CONTA','ENABLED',true);
                        PKG_XML.SetPropBoolean(xml, 'ITEM','IT_PROTOCOLO_DOC.DSP_CD_CONTA','NAVIGABLE',true);
                        PKG_XML.SetPropBoolean(xml, 'ITEM','IT_PROTOCOLO_DOC.DSP_CD_CONTA','INSERT_ALLOWED',true);
                        PKG_XML.SetPropBoolean(xml, 'ITEM','IT_PROTOCOLO_DOC.DSP_CD_CONTA','UPDATEABLE',true);
                    end if;
                    if PKG_XML.GetPropVarChar2(xml, 'ITEM','IT_PROTOCOLO_DOC.CD_ATENDIMENTO','ENABLED') = 'TRUE' then
                        PKG_XML.SetPropBoolean(xml, 'ITEM','IT_PROTOCOLO_DOC.CD_ATENDIMENTO','ENABLED',false);
                        PKG_XML.SetPropBoolean(xml, 'ITEM','IT_PROTOCOLO_DOC.CD_ATENDIMENTO','NAVIGABLE',false);
                        PKG_XML.SetPropBoolean(xml, 'ITEM','IT_PROTOCOLO_DOC.CD_ATENDIMENTO','INSERT_ALLOWED',false);
                        PKG_XML.SetPropBoolean(xml, 'ITEM','IT_PROTOCOLO_DOC.CD_ATENDIMENTO','UPDATEABLE',false);
                        PKG_XML.SetPropBoolean(xml, 'ITEM','IT_PROTOCOLO_DOC.CD_ATENDIMENTO','REQUIRED',false);
                    end if;
                    --Habilita conta e desabilita atendimento-Fim
                    elsif cSn_Conta = 'N' then
                    --Habilita atendimento e desabilita conta - Inicio
                    if PKG_XML.GetPropVarChar2(xml, 'ITEM','IT_PROTOCOLO_DOC.CD_ATENDIMENTO','ENABLED') = 'FALSE' then
                        PKG_XML.SetPropBoolean(xml, 'ITEM','IT_PROTOCOLO_DOC.CD_ATENDIMENTO','ENABLED',true);
                        PKG_XML.SetPropBoolean(xml, 'ITEM','IT_PROTOCOLO_DOC.CD_ATENDIMENTO','NAVIGABLE',true);
                        PKG_XML.SetPropBoolean(xml, 'ITEM','IT_PROTOCOLO_DOC.CD_ATENDIMENTO','INSERT_ALLOWED',true);
                        PKG_XML.SetPropBoolean(xml, 'ITEM','IT_PROTOCOLO_DOC.CD_ATENDIMENTO','UPDATEABLE',true);
                    end if;
                    if PKG_XML.GetPropVarChar2(xml, 'ITEM','IT_PROTOCOLO_DOC.DSP_CD_CONTA','ENABLED') = 'TRUE' then
                        PKG_XML.SetPropBoolean(xml, 'ITEM','IT_PROTOCOLO_DOC.DSP_CD_CONTA','ENABLED',false);
                        PKG_XML.SetPropBoolean(xml, 'ITEM','IT_PROTOCOLO_DOC.DSP_CD_CONTA','NAVIGABLE',false);
                        PKG_XML.SetPropBoolean(xml, 'ITEM','IT_PROTOCOLO_DOC.DSP_CD_CONTA','INSERT_ALLOWED',false);
                        PKG_XML.SetPropBoolean(xml, 'ITEM','IT_PROTOCOLO_DOC.DSP_CD_CONTA','UPDATEABLE',false);
                        PKG_XML.SetPropBoolean(xml, 'ITEM','IT_PROTOCOLO_DOC.CD_ATENDIMENTO','REQUIRED',false);
                    end if;
                    --Habilita atendimento e desabilita conta - Fim
                end if;
            end if;
        end if;
END;
PROCEDURE P_CHK_CONTA (in_params in Clob, out_params out Clob) IS
    xml PKG_XML.XmlContext;
    pit_protocolo_doc IT_PROTOCOLO_DOCRec;
    formParams FormParamsRec;
BEGIN
        xml := PKG_XML.Init(in_params);
        -- extract input parameters from the XML
        pIT_PROTOCOLO_DOC.CD_DOCUMENTO_PROT:= PKG_XML.GetNUMBER(xml, 'IT_PROTOCOLO_DOC.CD_DOCUMENTO_PROT');
        pIT_PROTOCOLO_DOC.DSP_TIPO_ATENDE:= PKG_XML.GetVARCHAR2(xml, 'IT_PROTOCOLO_DOC.DSP_TIPO_ATENDE');
        formParams.P_TP_CONTROLE_LOTE:= PKG_XML.GetVARCHAR2(xml, 'PARAMETER.P_TP_CONTROLE_LOTE');
        BEGIN
            IF Pkg_MOVDOC_M_PROT_ENVIO_C.P_CHK_CONTA_E(xml) THEN
                P_CHK_CONTA(xml, pIT_PROTOCOLO_DOC, formParams);
                Pkg_MOVDOC_M_PROT_ENVIO_C.P_CHK_CONTA_S(xml);
            END IF;
        EXCEPTION
        WHEN OTHERS THEN
            PKG_XML.AddException(xml, SQLCODE, SQLERRM);
        END;
        -- save output parameters to the XML
        PKG_XML.SetNUMBER(xml, 'IT_PROTOCOLO_DOC.CD_DOCUMENTO_PROT', pIT_PROTOCOLO_DOC.CD_DOCUMENTO_PROT);
        PKG_XML.SetVARCHAR2(xml, 'IT_PROTOCOLO_DOC.DSP_TIPO_ATENDE', pIT_PROTOCOLO_DOC.DSP_TIPO_ATENDE);
        PKG_XML.SetVARCHAR2(xml, 'PARAMETER.P_TP_CONTROLE_LOTE', formParams.P_TP_CONTROLE_LOTE);
        out_params := PKG_XML.GetOutputClob(xml);
END;
    /*
    <DATA_CRIACAO>13/01/2011 17:42</DATA_CRIACAO>
    <CRIADO_POR>Ferramenta de Migração ATX</CRIADO_POR>
    <OBJETIVO>CHK_SITUACAO_CTA</OBJETIVO>
    <ALTERACOES></ALTERACOES>
    */
	PROCEDURE P_CHK_SITUACAO_CTA (xml IN OUT NOCOPY PKG_XML.XmlContext,pit_protocolo_doc IN OUT NOCOPY IT_PROTOCOLO_DOCRec, pprotocolo_doc IN OUT NOCOPY PROTOCOLO_DOCRec, formParams IN OUT NOCOPY FormParamsRec) IS
Cursor c_conta_fat Is
      Select Distinct a.dt_recebimento,
               a.dt_devolucao,
               a.cd_protocolo_doc,
               a.cd_reg_fat cd_reg_amb,
               b.cd_setor,
               b.cd_setor_destino
         From it_protocolo_doc a, protocolo_doc b
        Where a.cd_protocolo_doc = b.cd_protocolo_doc
          AND pIT_PROTOCOLO_DOC.DSP_TIPO_ATENDE in ('H','B','HO','I','T')
          And a.cd_reg_fat       = pit_protocolo_doc.dsp_cd_conta
          And a.cd_protocolo_doc = ( select max(i.cd_protocolo_doc)
                                     From it_protocolo_doc i
                                     Where i.cd_documento_prot = pit_protocolo_doc.cd_documento_prot
                                      and  i.cd_reg_fat = pit_protocolo_doc.dsp_cd_conta)
        union
        Select Distinct a.dt_recebimento,
               a.dt_devolucao,
               a.cd_protocolo_doc,
               a.cd_reg_amb,
               b.cd_setor,
               b.cd_setor_destino
        From it_protocolo_doc a, protocolo_doc b
        Where a.cd_protocolo_doc = b.cd_protocolo_doc
          AND pIT_PROTOCOLO_DOC.DSP_TIPO_ATENDE in ('A','E','AM','U','T')
          And a.cd_reg_amb       = pit_protocolo_doc.dsp_cd_conta
          And a.cd_protocolo_doc = ( select max(i.cd_protocolo_doc)
                                     From it_protocolo_doc i
                                     Where i.cd_documento_prot = pit_protocolo_doc.cd_documento_prot
                                      and  i.cd_reg_amb = pit_protocolo_doc.dsp_cd_conta );
    vNm_Setor  setor.nm_setor%type;
    Linha_Reg  c_conta_fat%RowType;
BEGIN
    if Nvl( formParams.P_CD_HOSPITAL,1) = 267 then
      Open c_conta_fat;
      Fetch c_conta_fat into Linha_reg;
      If  c_conta_fat%Found Then
        If Linha_reg.dt_recebimento is not null Then
             If  pProtocolo_doc.Cd_setor <> Linha_reg.Cd_setor_Destino then
                        --MULTI-IDIOMA: Utilização do pkg_rmi_traducao.extrair_msg para mensagens (MSG_5)
                        --MULTI-IDIOMA: Utilização do pkg_rmi_traducao.extrair_msg para mensagens (MSG_8)
                        PKG_XML_MGS.CHAMA_MENSAGEM(xml, pkg_rmi_traducao.extrair_pkg_msg('MSG_5', 'PKG_MOVDOC_M_PROT_ENVIO', 'Atenção:'),
						pkg_rmi_traducao.extrair_pkg_msg('MSG_8', 'PKG_MOVDOC_M_PROT_ENVIO', 'Erro: A Conta não encontra-se neste setor!%sAção:  Informe um setor válido para a conta.', arg_list(chr(10))),true);
             End If;
        Elsif Linha_reg.dt_Devolucao is not null Then
             If  pProtocolo_doc.Cd_setor <> Linha_reg.Cd_setor Then
                  --MULTI-IDIOMA: Utilização do pkg_rmi_traducao.extrair_msg para mensagens (MSG_5)
                  --MULTI-IDIOMA: Utilização do pkg_rmi_traducao.extrair_msg para mensagens (MSG_8)
                  PKG_XML_MGS.CHAMA_MENSAGEM(xml, pkg_rmi_traducao.extrair_pkg_msg('MSG_5', 'PKG_MOVDOC_M_PROT_ENVIO', 'Atenção:'),
				  pkg_rmi_traducao.extrair_pkg_msg('MSG_8', 'PKG_MOVDOC_M_PROT_ENVIO', 'Erro: A Conta não encontra-se neste setor!%sAção:  Informe um setor válido para a conta.', arg_list(chr(10))),true);
             End If;
        Elsif Linha_reg.dt_recebimento is null And Linha_reg.dt_devolucao is null Then
                    Pkg_MOVDOC_M_PROT_ENVIO.P_RETORNA_SETOR(xml, formParams, Linha_reg.cd_setor,true,true);
                vNm_Setor := formParams.P_NM_SETOR;
            If  nvl( pIT_PROTOCOLO_DOC.cd_reg_fat,0) <> Nvl(Linha_reg.cd_reg_amb,0) Then
                       --MULTI-IDIOMA: Utilização do pkg_rmi_traducao.extrair_msg para mensagens (MSG_5)
                       --MULTI-IDIOMA: Utilização do pkg_rmi_traducao.extrair_msg para mensagens (MSG_8)
                       PKG_XML_MGS.CHAMA_MENSAGEM(xml, pkg_rmi_traducao.extrair_pkg_msg('MSG_5', 'PKG_MOVDOC_M_PROT_ENVIO', 'Atenção:'),
					   pkg_rmi_traducao.extrair_pkg_msg('MSG_8', 'PKG_MOVDOC_M_PROT_ENVIO', 'Erro: A Conta não encontra-se neste setor!%sAção:  Informe um setor válido para a conta.', arg_list(chr(10))),true);
            End if;
        End If;
      End If;
      Close c_conta_fat;
    end if;
END;
PROCEDURE P_CHK_SITUACAO_CTA (in_params in Clob, out_params out Clob) IS
    xml PKG_XML.XmlContext;
    pit_protocolo_doc IT_PROTOCOLO_DOCRec;
    pprotocolo_doc PROTOCOLO_DOCRec;
    formParams FormParamsRec;
BEGIN
        xml := PKG_XML.Init(in_params);
        -- extract input parameters from the XML
        pIT_PROTOCOLO_DOC.DSP_CD_CONTA:= PKG_XML.GetNUMBER(xml, 'IT_PROTOCOLO_DOC.DSP_CD_CONTA');
        pIT_PROTOCOLO_DOC.CD_DOCUMENTO_PROT:= PKG_XML.GetNUMBER(xml, 'IT_PROTOCOLO_DOC.CD_DOCUMENTO_PROT');
        pIT_PROTOCOLO_DOC.DSP_TIPO_ATENDE:= PKG_XML.GetVARCHAR2(xml, 'IT_PROTOCOLO_DOC.DSP_TIPO_ATENDE');
        pIT_PROTOCOLO_DOC.CD_REG_FAT:= PKG_XML.GetNUMBER(xml, 'IT_PROTOCOLO_DOC.CD_REG_FAT');
        pIT_PROTOCOLO_DOC.CD_REG_AMB:= PKG_XML.GetNUMBER(xml, 'IT_PROTOCOLO_DOC.CD_REG_AMB');
        pPROTOCOLO_DOC.CD_SETOR:= PKG_XML.GetNUMBER(xml, 'PROTOCOLO_DOC.CD_SETOR');
        formParams.P_CD_HOSPITAL:= PKG_XML.GetNUMBER(xml, 'PARAMETER.P_CD_HOSPITAL');
        formParams.P_NM_SETOR:= PKG_XML.GetVARCHAR2(xml, 'PARAMETER.P_NM_SETOR');
        formParams.P_CD_MULTI_EMPRESA:= PKG_XML.GetNUMBER(xml, 'PARAMETER.P_CD_MULTI_EMPRESA');
        formParams.P_CD_SETOR:= PKG_XML.GetNUMBER(xml, 'PARAMETER.P_CD_SETOR');
        BEGIN
            IF Pkg_MOVDOC_M_PROT_ENVIO_C.P_CHK_SITUACAO_CTA_E(xml) THEN
                P_CHK_SITUACAO_CTA(xml, pIT_PROTOCOLO_DOC, pPROTOCOLO_DOC, formParams);
                Pkg_MOVDOC_M_PROT_ENVIO_C.P_CHK_SITUACAO_CTA_S(xml);
            END IF;
        EXCEPTION
        WHEN OTHERS THEN
            PKG_XML.AddException(xml, SQLCODE, SQLERRM);
        END;
        -- save output parameters to the XML
        PKG_XML.SetNUMBER(xml, 'IT_PROTOCOLO_DOC.DSP_CD_CONTA', pIT_PROTOCOLO_DOC.DSP_CD_CONTA);
        PKG_XML.SetNUMBER(xml, 'IT_PROTOCOLO_DOC.CD_DOCUMENTO_PROT', pIT_PROTOCOLO_DOC.CD_DOCUMENTO_PROT);
        PKG_XML.SetVARCHAR2(xml, 'IT_PROTOCOLO_DOC.DSP_TIPO_ATENDE', pIT_PROTOCOLO_DOC.DSP_TIPO_ATENDE);
        PKG_XML.SetNUMBER(xml, 'IT_PROTOCOLO_DOC.CD_REG_FAT', pIT_PROTOCOLO_DOC.CD_REG_FAT);
        PKG_XML.SetNUMBER(xml, 'IT_PROTOCOLO_DOC.CD_REG_AMB', pIT_PROTOCOLO_DOC.CD_REG_AMB);
        PKG_XML.SetNUMBER(xml, 'PROTOCOLO_DOC.CD_SETOR', pPROTOCOLO_DOC.CD_SETOR);
        PKG_XML.SetNUMBER(xml, 'PARAMETER.P_CD_HOSPITAL', formParams.P_CD_HOSPITAL);
        PKG_XML.SetVARCHAR2(xml, 'PARAMETER.P_NM_SETOR', formParams.P_NM_SETOR);
        PKG_XML.SetNUMBER(xml, 'PARAMETER.P_CD_MULTI_EMPRESA', formParams.P_CD_MULTI_EMPRESA);
        PKG_XML.SetNUMBER(xml, 'PARAMETER.P_CD_SETOR', formParams.P_CD_SETOR);
        out_params := PKG_XML.GetOutputClob(xml);
END;
    /*
    <DATA_CRIACAO>13/01/2011 17:42</DATA_CRIACAO>
    <CRIADO_POR>Ferramenta de Migração ATX</CRIADO_POR>
    <OBJETIVO>CHK_M_PROT_ENVIO_REMESSA</OBJETIVO>
    <ALTERACOES></ALTERACOES>
    */
	PROCEDURE P_CHK_M_PROT_ENVIO_REMESSA (xml IN OUT NOCOPY PKG_XML.XmlContext,pit_protocolo_doc IN OUT NOCOPY IT_PROTOCOLO_DOCRec, formParams IN OUT NOCOPY FormParamsRec,pCd_Remessa in number) IS
vLst_Retorno PKG_PARAMETRO.ID_LISTA_PARAM;
  vLst_Local PKG_PARAMETRO.ID_LISTA_PARAM;
BEGIN
  -- Chamada da Procedure
  --
  M_PKG_FFCV_CONVENIO.P_DADOS_CONVENIO_POR_REME(xml, pCd_Remessa
                                         ,formParams.P_CD_MULTI_EMPRESA
                                         ,xml.usuario
                                         ,TRUE
                                         ,TRUE
                                         ,vLst_Retorno);
  --
  vLst_Local  := PKG_PARAMETRO.FN_RECUPERA_LISTA_PARAMETROS(vLst_Retorno);
  --
  PKG_PARAMETRO.PR_RECUPERA_PARAMETRO(vLst_Local,'CD_CONVENIO',pIT_PROTOCOLO_DOC.CD_CONVENIO     ,false);
  PKG_PARAMETRO.PR_RECUPERA_PARAMETRO(vLst_Local,'NM_CONVENIO',pIT_PROTOCOLO_DOC.DSP_NM_CONVENIO ,false);
  -- Limpando a lista de Parâmetros
  --
  pkg_parametro.pr_limpar_lista_parametros(vLst_Local);
END;
PROCEDURE P_CHK_M_PROT_ENVIO_REMESSA (in_params in Clob, out_params out Clob) IS
    xml PKG_XML.XmlContext;
    pCd_Remessa number;
    pit_protocolo_doc IT_PROTOCOLO_DOCRec;
    formParams FormParamsRec;
BEGIN
        xml := PKG_XML.Init(in_params);
        -- extract input parameters from the XML
        pIT_PROTOCOLO_DOC.CD_CONVENIO:= PKG_XML.GetNUMBER(xml, 'IT_PROTOCOLO_DOC.CD_CONVENIO');
        pIT_PROTOCOLO_DOC.DSP_NM_CONVENIO:= PKG_XML.GetVARCHAR2(xml, 'IT_PROTOCOLO_DOC.DSP_NM_CONVENIO');
        formParams.P_CD_MULTI_EMPRESA:= PKG_XML.GetNUMBER(xml, 'PARAMETER.P_CD_MULTI_EMPRESA');
        pCd_Remessa:= PKG_XML.Getnumber(xml, 'pCd_Remessa');
        BEGIN
            IF Pkg_MOVDOC_M_PROT_ENVIO_C.P_CHK_M_PROT_ENVIO_REMESSA_E(xml) THEN
                P_CHK_M_PROT_ENVIO_REMESSA(xml, pIT_PROTOCOLO_DOC, formParams, pCd_Remessa);
                Pkg_MOVDOC_M_PROT_ENVIO_C.P_CHK_M_PROT_ENVIO_REMESSA_S(xml);
            END IF;
        EXCEPTION
        WHEN OTHERS THEN
            PKG_XML.AddException(xml, SQLCODE, SQLERRM);
        END;
        -- save output parameters to the XML
        PKG_XML.SetNUMBER(xml, 'IT_PROTOCOLO_DOC.CD_CONVENIO', pIT_PROTOCOLO_DOC.CD_CONVENIO);
        PKG_XML.SetVARCHAR2(xml, 'IT_PROTOCOLO_DOC.DSP_NM_CONVENIO', pIT_PROTOCOLO_DOC.DSP_NM_CONVENIO);
        PKG_XML.SetNUMBER(xml, 'PARAMETER.P_CD_MULTI_EMPRESA', formParams.P_CD_MULTI_EMPRESA);
        out_params := PKG_XML.GetOutputClob(xml);
END;
  /*
  <DATA_CRIACAO>13/01/2011 17:42</DATA_CRIACAO>
  <CRIADO_POR>Ferramenta de Migração ATX</CRIADO_POR>
  <OBJETIVO>CHK_M_PROT_ENVIO_SALVAR</OBJETIVO>
  <ALTERACOES></ALTERACOES>
  */
PROCEDURE P_CHK_M_PROT_ENVIO_SALVAR (xml IN OUT NOCOPY PKG_XML.XmlContext,pit_protocolo_doc IN OUT NOCOPY IT_PROTOCOLO_DOCRec, formParams IN OUT NOCOPY FormParamsRec, FSV_RECORD_STATUS IN OUT NOCOPY varchar2) IS
  cSn_Conta  DOCUMENTO_PROT.SN_INFORMA_CONTA%TYPE;
	-- OP 18190 - 04/04/2014 - usando um cursor direto pois a rotina usada anteriormente não funcionava
  -- indica se o documento é remessa
	cursor c_sn_documento_remessa is
	  select nvl(sn_remessa,'N') sn_remessa
	    from dbamv.documento_prot
	   where cd_documento_prot= pIT_PROTOCOLO_DOC.CD_DOCUMENTO_PROT;
	v_sn_documento_remessa 	VARCHAR2(10);
BEGIN
  cSn_Conta := Pkg_MOVDOC_M_PROT_ENVIO.F_RETORNA_SN_INFORMA_CONTA(xml, pIT_PROTOCOLO_DOC, pIT_PROTOCOLO_DOC.CD_DOCUMENTO_PROT);
  if  FSV_Record_Status = 'INSERT' or  FSV_Record_Status = 'CHANGED' then
	-- OP 18190 - 04/04/2014 - usando um cursor direto pois a rotina usada anteriormente não funcionava
    open c_sn_documento_remessa;
    fetch c_sn_documento_remessa into v_sn_documento_remessa;
    close c_sn_documento_remessa;
      if v_sn_documento_remessa = 'S' then
          -- Documento remessa: NÃO pode ter atendimento nem conta.
            pIT_PROTOCOLO_DOC.CD_ATENDIMENTO:= null;
            pIT_PROTOCOLO_DOC.DSP_CD_CONTA:= null;
            if  pIT_PROTOCOLO_DOC.CD_REMESSA is null then
                --MULTI-IDIOMA: Utilização do pkg_rmi_traducao.extrair_msg para mensagens (MSG_5)
                --MULTI-IDIOMA: Utilização do pkg_rmi_traducao.extrair_msg para mensagens (MSG_10)
                PKG_XML_MGS.CHAMA_MENSAGEM(xml, pkg_rmi_traducao.extrair_pkg_msg('MSG_5', 'PKG_MOVDOC_M_PROT_ENVIO', 'Atenção:'),
				pkg_rmi_traducao.extrair_pkg_msg('MSG_10', 'PKG_MOVDOC_M_PROT_ENVIO', 'Erro: Remessa não informada!%sAção: Informe uma remessa ou escolha na lista de valores.', arg_list(chr(10))),true);
            end if;
        else
            -- Documento NÃO é remessa: tem que ter atendimento ou conta.
            pIT_PROTOCOLO_DOC.CD_REMESSA:= null;
            if  ( pIT_PROTOCOLO_DOC.CD_ATENDIMENTO is null and pIT_PROTOCOLO_DOC.DSP_CD_CONTA is null ) and cSn_Conta = 'S'  THEN   -- OP 34289 - 18/04/2016 - Acertando condição.
                --MULTI-IDIOMA: Utilização do pkg_rmi_traducao.extrair_msg para mensagens (MSG_5)
                --MULTI-IDIOMA: Utilização do pkg_rmi_traducao.extrair_msg para mensagens (MSG_11)
                PKG_XML_MGS.CHAMA_MENSAGEM(xml, pkg_rmi_traducao.extrair_pkg_msg('MSG_5', 'PKG_MOVDOC_M_PROT_ENVIO', 'Atenção:'),
				pkg_rmi_traducao.extrair_pkg_msg('MSG_11', 'PKG_MOVDOC_M_PROT_ENVIO', 'Erro: Atendimento ou conta não informados!%sAção: Informe um atendimento ou uma conta válida,ou escolha na lista de valores.', arg_list(chr(10))),true);
            end if;
        end if;
    end if;
END;
PROCEDURE P_CHK_M_PROT_ENVIO_SALVAR (in_params in Clob, out_params out Clob) IS
    xml PKG_XML.XmlContext;
    pit_protocolo_doc IT_PROTOCOLO_DOCRec;
    formParams FormParamsRec;
    FSV_RECORD_STATUS VARCHAR2(4000);
BEGIN
        xml := PKG_XML.Init(in_params);
        -- extract input parameters from the XML
        pIT_PROTOCOLO_DOC.CD_DOCUMENTO_PROT:= PKG_XML.GetNUMBER(xml, 'IT_PROTOCOLO_DOC.CD_DOCUMENTO_PROT');
        pIT_PROTOCOLO_DOC.CD_ATENDIMENTO:= PKG_XML.GetNUMBER(xml, 'IT_PROTOCOLO_DOC.CD_ATENDIMENTO');
        pIT_PROTOCOLO_DOC.DSP_CD_CONTA:= PKG_XML.GetNUMBER(xml, 'IT_PROTOCOLO_DOC.DSP_CD_CONTA');
        pIT_PROTOCOLO_DOC.CD_REMESSA:= PKG_XML.GetNUMBER(xml, 'IT_PROTOCOLO_DOC.CD_REMESSA');
        formParams.P_CD_MULTI_EMPRESA:= PKG_XML.GetNUMBER(xml, 'PARAMETER.P_CD_MULTI_EMPRESA');
        FSV_RECORD_STATUS:= PKG_XML.GetVARCHAR2(xml, 'FSV_RECORD_STATUS');
        BEGIN
            IF Pkg_MOVDOC_M_PROT_ENVIO_C.P_CHK_M_PROT_ENVIO_SALVAR_E(xml) THEN
                P_CHK_M_PROT_ENVIO_SALVAR(xml, pIT_PROTOCOLO_DOC, formParams, FSV_RECORD_STATUS);
                Pkg_MOVDOC_M_PROT_ENVIO_C.P_CHK_M_PROT_ENVIO_SALVAR_S(xml);
            END IF;
        EXCEPTION
        WHEN OTHERS THEN
            PKG_XML.AddException(xml, SQLCODE, SQLERRM);
        END;
        -- save output parameters to the XML
        PKG_XML.SetNUMBER(xml, 'IT_PROTOCOLO_DOC.CD_DOCUMENTO_PROT', pIT_PROTOCOLO_DOC.CD_DOCUMENTO_PROT);
        PKG_XML.SetNUMBER(xml, 'IT_PROTOCOLO_DOC.CD_ATENDIMENTO', pIT_PROTOCOLO_DOC.CD_ATENDIMENTO);
        PKG_XML.SetNUMBER(xml, 'IT_PROTOCOLO_DOC.DSP_CD_CONTA', pIT_PROTOCOLO_DOC.DSP_CD_CONTA);
        PKG_XML.SetNUMBER(xml, 'IT_PROTOCOLO_DOC.CD_REMESSA', pIT_PROTOCOLO_DOC.CD_REMESSA);
        PKG_XML.SetNUMBER(xml, 'PARAMETER.P_CD_MULTI_EMPRESA', formParams.P_CD_MULTI_EMPRESA);
        PKG_XML.SetVARCHAR2(xml, 'FSV_RECORD_STATUS', FSV_RECORD_STATUS);
        out_params := PKG_XML.GetOutputClob(xml);
END;
    /*
    <DATA_CRIACAO>13/01/2011 17:42</DATA_CRIACAO>
    <CRIADO_POR>Ferramenta de Migração ATX</CRIADO_POR>
    <OBJETIVO>CHK_M_PROT_ENVIO_CONVENIO_CTA</OBJETIVO>
    <ALTERACOES></ALTERACOES>
    */
	PROCEDURE P_CHK_M_PROT_ENVIO_CONVENIO_ (xml IN OUT NOCOPY PKG_XML.XmlContext,pit_protocolo_doc IN OUT NOCOPY IT_PROTOCOLO_DOCRec, formParams IN OUT NOCOPY FormParamsRec,P_CD_CONVENIO IN NUMBER,
   P_CD_CONTA IN REG_FAT.CD_REG_FAT%TYPE) IS
BEGIN
  DECLARE
    CURSOR cConv IS
      select  convenio.nm_convenio dsp_nm_convenio
        from  convenio convenio
       Where  convenio.cd_convenio in (select distinct reg_fat.cd_convenio
                                         from reg_fat
                                        where reg_fat.cd_reg_fat = P_CD_CONTA
                                         AND REG_FAT.CD_MULTI_EMPRESA = formParams.P_CD_MULTI_EMPRESA
                    union
                                        select distinct reg_amb.cd_convenio
                                         from reg_amb,
                                              itreg_amb
                                        where itreg_amb.cd_reg_amb = P_CD_CONTA
                                          AND REG_AMB.CD_MULTI_EMPRESA = formParams.P_CD_MULTI_EMPRESA
                                          and itreg_amb.cd_reg_amb = reg_amb.cd_reg_amb)
         and  convenio.cd_convenio  =  P_CD_CONVENIO;
  BEGIN
    OPEN cConv;
    FETCH cConv
    INTO     pIT_PROTOCOLO_DOC.DSP_NM_CONVENIO;
    IF cConv%NOTFOUND THEN
      CLOSE cConv;
      RAISE NO_DATA_FOUND;
    END IF;
    CLOSE cConv;
  END;
END;
PROCEDURE P_CHK_M_PROT_ENVIO_CONVENIO_ (in_params in Clob, out_params out Clob) IS
    xml PKG_XML.XmlContext;
    P_CD_CONVENIO NUMBER;
    P_CD_CONTA NUMBER;
    pit_protocolo_doc IT_PROTOCOLO_DOCRec;
    formParams FormParamsRec;
BEGIN
        xml := PKG_XML.Init(in_params);
        -- extract input parameters from the XML
        pIT_PROTOCOLO_DOC.DSP_NM_CONVENIO:= PKG_XML.GetVARCHAR2(xml, 'IT_PROTOCOLO_DOC.DSP_NM_CONVENIO');
        formParams.P_CD_MULTI_EMPRESA:= PKG_XML.GetNUMBER(xml, 'PARAMETER.P_CD_MULTI_EMPRESA');
        P_CD_CONVENIO:= PKG_XML.GetNUMBER(xml, 'P_CD_CONVENIO');
        P_CD_CONTA:= PKG_XML.GetNUMBER(xml, 'P_CD_CONTA');
        BEGIN
            IF Pkg_MOVDOC_M_PROT_ENVIO_C.P_CHK_M_PROT_ENVIO_CONVENIO__E(xml) THEN
                P_CHK_M_PROT_ENVIO_CONVENIO_(xml, pIT_PROTOCOLO_DOC, formParams, P_CD_CONVENIO, P_CD_CONTA);
                Pkg_MOVDOC_M_PROT_ENVIO_C.P_CHK_M_PROT_ENVIO_CONVENIO__S(xml);
            END IF;
        EXCEPTION
        WHEN OTHERS THEN
            PKG_XML.AddException(xml, SQLCODE, SQLERRM);
        END;
        -- save output parameters to the XML
        PKG_XML.SetVARCHAR2(xml, 'IT_PROTOCOLO_DOC.DSP_NM_CONVENIO', pIT_PROTOCOLO_DOC.DSP_NM_CONVENIO);
        PKG_XML.SetNUMBER(xml, 'PARAMETER.P_CD_MULTI_EMPRESA', formParams.P_CD_MULTI_EMPRESA);
        out_params := PKG_XML.GetOutputClob(xml);
END;
    /*
    <DATA_CRIACAO>13/01/2011 17:42</DATA_CRIACAO>
    <CRIADO_POR>Ferramenta de Migração ATX</CRIADO_POR>
    <OBJETIVO>chk_verifica_fluxo_setor</OBJETIVO>
    <ALTERACOES></ALTERACOES>
    */
	PROCEDURE P_CHK_VERIFICA_FLUXO_SETOR (xml IN OUT NOCOPY PKG_XML.XmlContext,pit_protocolo_doc IN OUT NOCOPY IT_PROTOCOLO_DOCRec, pprotocolo_doc IN OUT NOCOPY PROTOCOLO_DOCRec, FSV_MODE IN OUT NOCOPY varchar2) IS
cursor c_Setor is
      select cd_setor_dest
        from fluxo_documento
       where cd_documento=pit_protocolo_doc.cd_documento_prot
         and cd_setor_orig=pPROTOCOLO_DOC.CD_SETOR
         and cd_setor_dest=pPROTOCOLO_DOC.CD_SETOR_DESTINO;
     cursor c_SetorDest is
      select distinct cd_setor_dest
        from fluxo_documento
       where cd_documento=pit_protocolo_doc.cd_documento_prot
         and cd_setor_orig=pPROTOCOLO_DOC.CD_SETOR;
 vCdSetor      number:=0;
 vCdSetorDest  varchar2(2000);   -- OP 36371 - Aumentando o tamanho da variável que estava 200.
BEGIN
  if  pit_protocolo_doc.cd_documento_prot is not null and
         pPROTOCOLO_DOC.CD_SETOR is not null and
         pPROTOCOLO_DOC.CD_SETOR_DESTINO is not null then
 Open C_Setor;
     Fetch C_Setor into vCdSetor;
      If C_Setor%notfound Then
           For x in  C_SetorDest loop
           vCdSetorDest:=vCdSetorDest||','||x.cd_setor_dest;
           End Loop;
            vCdSetorDest:=substr(vCdSetorDest,2,200);
           If vCdSetorDest is not null Then
               if  FSV_mode <> 'QUERY' then
             --MULTI-IDIOMA: Utilização do pkg_rmi_traducao.extrair_msg para mensagens (MSG_5)
             --MULTI-IDIOMA: Utilização do pkg_rmi_traducao.extrair_msg para mensagens (MSG_12)
             PKG_XML_MGS.CHAMA_MENSAGEM(xml, pkg_rmi_traducao.extrair_pkg_msg('MSG_5', 'PKG_MOVDOC_M_PROT_ENVIO', 'Atenção:'),
			 pkg_rmi_traducao.extrair_pkg_msg('MSG_12', 'PKG_MOVDOC_M_PROT_ENVIO', 'Erro: Este documento encontra-se no Setor %s e não pode ser protocolado para o Setor %s.
			 Os setores destino possíveis são: %s.%s%sCausa: O setor não esta cadastrado para o setor destino ou não existe fluxo do documento para os setores informados.%s%sAção:
			 Cadastre na tela de documentos por setor o setor autorizado a movimentar o documento, e depois na tela fluxo por setorcadastre o fluxo do documento do setor de envio para o setor destino.',
			 arg_list(pPROTOCOLO_DOC.CD_SETOR, pPROTOCOLO_DOC.CD_SETOR_DESTINO, vCdSetorDest, chr(10), chr(10), chr(10), chr(10))), false);
               RAISE FORM_TRIGGER_FAILURE;
               end if;
          Else
               if  FSV_mode <> 'QUERY' then
                    --MULTI-IDIOMA: Utilização do pkg_rmi_traducao.extrair_msg para mensagens (MSG_5)
                    --MULTI-IDIOMA: Utilização do pkg_rmi_traducao.extrair_msg para mensagens (MSG_13)
                    PKG_XML_MGS.CHAMA_MENSAGEM(xml, pkg_rmi_traducao.extrair_pkg_msg('MSG_5', 'PKG_MOVDOC_M_PROT_ENVIO', 'Atenção:'),
					pkg_rmi_traducao.extrair_pkg_msg('MSG_13', 'PKG_MOVDOC_M_PROT_ENVIO', 'Erro: Este documento encontra-se no Setor %s e não pode ser protocolado para o Setor %s. Não existe setor de destino cadastrado.%s%sCausa:
					O setor não esta cadastrado para o setor destino ou não existe fluxo do documento para os setores informados.%s%sAção:
					Cadastre na tela de documentos por setor o setor autorizado a movimentar o documento, e depois na tela fluxo por setorcadastre o fluxo do documento do setor de envio para o setor destino.',
					arg_list(pPROTOCOLO_DOC.CD_SETOR, pPROTOCOLO_DOC.CD_SETOR_DESTINO, chr(10), chr(10), chr(10), chr(10))), false);
            RAISE FORM_TRIGGER_FAILURE;
               end if;
           End if;
      End If;
    Close C_Setor;
 end if;
end;
PROCEDURE P_CHK_VERIFICA_FLUXO_SETOR (in_params in Clob, out_params out Clob) IS
    xml PKG_XML.XmlContext;
    pit_protocolo_doc IT_PROTOCOLO_DOCRec;
    pprotocolo_doc PROTOCOLO_DOCRec;
    FSV_MODE VARCHAR2(4000);
BEGIN
        xml := PKG_XML.Init(in_params);
        -- extract input parameters from the XML
        pIT_PROTOCOLO_DOC.CD_DOCUMENTO_PROT:= PKG_XML.GetNUMBER(xml, 'IT_PROTOCOLO_DOC.CD_DOCUMENTO_PROT');
        pPROTOCOLO_DOC.CD_SETOR:= PKG_XML.GetNUMBER(xml, 'PROTOCOLO_DOC.CD_SETOR');
        pPROTOCOLO_DOC.CD_SETOR_DESTINO:= PKG_XML.GetNUMBER(xml, 'PROTOCOLO_DOC.CD_SETOR_DESTINO');
        FSV_MODE:= PKG_XML.GetVARCHAR2(xml, 'FSV_MODE');
        BEGIN
            IF Pkg_MOVDOC_M_PROT_ENVIO_C.P_CHK_VERIFICA_FLUXO_SETOR_E(xml) THEN
                P_CHK_VERIFICA_FLUXO_SETOR(xml, pIT_PROTOCOLO_DOC, pPROTOCOLO_DOC, FSV_MODE);
                Pkg_MOVDOC_M_PROT_ENVIO_C.P_CHK_VERIFICA_FLUXO_SETOR_S(xml);
            END IF;
        EXCEPTION
        WHEN OTHERS THEN
            PKG_XML.AddException(xml, SQLCODE, SQLERRM);
        END;
        -- save output parameters to the XML
        PKG_XML.SetNUMBER(xml, 'IT_PROTOCOLO_DOC.CD_DOCUMENTO_PROT', pIT_PROTOCOLO_DOC.CD_DOCUMENTO_PROT);
        PKG_XML.SetNUMBER(xml, 'PROTOCOLO_DOC.CD_SETOR', pPROTOCOLO_DOC.CD_SETOR);
        PKG_XML.SetNUMBER(xml, 'PROTOCOLO_DOC.CD_SETOR_DESTINO', pPROTOCOLO_DOC.CD_SETOR_DESTINO);
        PKG_XML.SetVARCHAR2(xml, 'FSV_MODE', FSV_MODE);
        out_params := PKG_XML.GetOutputClob(xml);
END;
    /*
    <DATA_CRIACAO>13/01/2011 17:42</DATA_CRIACAO>
    <CRIADO_POR>Ferramenta de Migração ATX</CRIADO_POR>
    <OBJETIVO>PRC_VALIDA_CD_PROTOCOLO_DOC</OBJETIVO>
    <ALTERACOES></ALTERACOES>
    */
	PROCEDURE P_VALIDA_CD_PROTOCOLO_DOC (xml IN OUT NOCOPY PKG_XML.XmlContext,pprotocolo_doc IN OUT NOCOPY PROTOCOLO_DOCRec) IS
BEGIN
  IF  pPROTOCOLO_DOC.CD_PROTOCOLO_DOC IS NOT NULL THEN
   BEGIN
   Pkg_MOVDOC_M_PROT_ENVIO.P_CHK_M_PROT_ENVIO_PROT_DOC(xml, pPROTOCOLO_DOC.CD_PROTOCOLO_DOC);
   EXCEPTION
    WHEN NO_DATA_FOUND THEN
      --MULTI-IDIOMA: Utilização do pkg_rmi_traducao.extrair_msg para mensagens (MSG_1)
      PKG_XML_MGS.msg_alert(xml, pkg_rmi_traducao.extrair_pkg_msg('MSG_1', 'PKG_MOVDOC_M_PROT_ENVIO', 'Erro: Este protocolo não existe ou não foi enviado pelo usuário logado'), 'E', true);
    WHEN OTHERS THEN
      RAISE;
    END;
  END IF;
END;
PROCEDURE P_VALIDA_CD_PROTOCOLO_DOC (in_params in Clob, out_params out Clob) IS
    xml PKG_XML.XmlContext;
    pprotocolo_doc PROTOCOLO_DOCRec;
BEGIN
        xml := PKG_XML.Init(in_params);
        -- extract input parameters from the XML
        pPROTOCOLO_DOC.CD_PROTOCOLO_DOC:= PKG_XML.GetNUMBER(xml, 'PROTOCOLO_DOC.CD_PROTOCOLO_DOC');
        BEGIN
            IF Pkg_MOVDOC_M_PROT_ENVIO_C.P_VALIDA_CD_PROTOCOLO_DOC_E(xml) THEN
                P_VALIDA_CD_PROTOCOLO_DOC(xml, pPROTOCOLO_DOC);
                Pkg_MOVDOC_M_PROT_ENVIO_C.P_VALIDA_CD_PROTOCOLO_DOC_S(xml);
            END IF;
        EXCEPTION
        WHEN OTHERS THEN
            PKG_XML.AddException(xml, SQLCODE, SQLERRM);
        END;
        -- save output parameters to the XML
        PKG_XML.SetNUMBER(xml, 'PROTOCOLO_DOC.CD_PROTOCOLO_DOC', pPROTOCOLO_DOC.CD_PROTOCOLO_DOC);
        out_params := PKG_XML.GetOutputClob(xml);
END;
    /*
    <DATA_CRIACAO>13/01/2011 17:42</DATA_CRIACAO>
    <CRIADO_POR>Ferramenta de Migração ATX</CRIADO_POR>
    <OBJETIVO>PRC_VALIDA_CD_SETOR</OBJETIVO>
    <ALTERACOES></ALTERACOES>
    */
	PROCEDURE P_VALIDA_CD_SETOR (xml IN OUT NOCOPY PKG_XML.XmlContext,pprotocolo_doc IN OUT NOCOPY PROTOCOLO_DOCRec, pit_protocolo_doc IN OUT NOCOPY IT_PROTOCOLO_DOCRec, formParams IN OUT NOCOPY FormParamsRec, FSV_MODE IN OUT NOCOPY varchar2) IS
BEGIN
      IF  pPROTOCOLO_DOC.CD_SETOR IS NOT NULL THEN
     Pkg_MOVDOC_M_PROT_ENVIO.P_CHK_M_PROT_ENVIO_SETOR(xml, pPROTOCOLO_DOC, pIT_PROTOCOLO_DOC, formParams, FSV_MODE);
  END IF;
END;
PROCEDURE P_VALIDA_CD_SETOR (in_params in Clob, out_params out Clob) IS
    xml PKG_XML.XmlContext;
    pprotocolo_doc PROTOCOLO_DOCRec;
    pit_protocolo_doc IT_PROTOCOLO_DOCRec;
    formParams FormParamsRec;
    FSV_MODE VARCHAR2(4000);
BEGIN
        xml := PKG_XML.Init(in_params);
        -- extract input parameters from the XML
        pIT_PROTOCOLO_DOC.CD_DOCUMENTO_PROT:= PKG_XML.GetNUMBER(xml, 'IT_PROTOCOLO_DOC.CD_DOCUMENTO_PROT');
        pPROTOCOLO_DOC.CD_SETOR:= PKG_XML.GetNUMBER(xml, 'PROTOCOLO_DOC.CD_SETOR');
        pPROTOCOLO_DOC.DSP_NM_SETOR:= PKG_XML.GetVARCHAR2(xml, 'PROTOCOLO_DOC.DSP_NM_SETOR');
        pPROTOCOLO_DOC.CD_SETOR_DESTINO:= PKG_XML.GetNUMBER(xml, 'PROTOCOLO_DOC.CD_SETOR_DESTINO');
        formParams.P_NM_SETOR:= PKG_XML.GetVARCHAR2(xml, 'PARAMETER.P_NM_SETOR');
        formParams.P_CD_MULTI_EMPRESA:= PKG_XML.GetNUMBER(xml, 'PARAMETER.P_CD_MULTI_EMPRESA');
        formParams.P_CD_SETOR:= PKG_XML.GetNUMBER(xml, 'PARAMETER.P_CD_SETOR');
        FSV_MODE:= PKG_XML.GetVARCHAR2(xml, 'FSV_MODE');
        BEGIN
            IF Pkg_MOVDOC_M_PROT_ENVIO_C.P_VALIDA_CD_SETOR_E(xml) THEN
                P_VALIDA_CD_SETOR(xml, pPROTOCOLO_DOC, pIT_PROTOCOLO_DOC, formParams, FSV_MODE);
                Pkg_MOVDOC_M_PROT_ENVIO_C.P_VALIDA_CD_SETOR_S(xml);
            END IF;
        EXCEPTION
        WHEN OTHERS THEN
            PKG_XML.AddException(xml, SQLCODE, SQLERRM);
        END;
        -- save output parameters to the XML
        PKG_XML.SetNUMBER(xml, 'IT_PROTOCOLO_DOC.CD_DOCUMENTO_PROT', pIT_PROTOCOLO_DOC.CD_DOCUMENTO_PROT);
        PKG_XML.SetNUMBER(xml, 'PROTOCOLO_DOC.CD_SETOR', pPROTOCOLO_DOC.CD_SETOR);
        PKG_XML.SetVARCHAR2(xml, 'PROTOCOLO_DOC.DSP_NM_SETOR', pPROTOCOLO_DOC.DSP_NM_SETOR);
        PKG_XML.SetNUMBER(xml, 'PROTOCOLO_DOC.CD_SETOR_DESTINO', pPROTOCOLO_DOC.CD_SETOR_DESTINO);
        PKG_XML.SetVARCHAR2(xml, 'PARAMETER.P_NM_SETOR', formParams.P_NM_SETOR);
        PKG_XML.SetNUMBER(xml, 'PARAMETER.P_CD_MULTI_EMPRESA', formParams.P_CD_MULTI_EMPRESA);
        PKG_XML.SetNUMBER(xml, 'PARAMETER.P_CD_SETOR', formParams.P_CD_SETOR);
        PKG_XML.SetVARCHAR2(xml, 'FSV_MODE', FSV_MODE);
        out_params := PKG_XML.GetOutputClob(xml);
END;
    /*
    <DATA_CRIACAO>13/01/2011 17:42</DATA_CRIACAO>
    <CRIADO_POR>Ferramenta de Migração ATX</CRIADO_POR>
    <OBJETIVO>PRC_VALIDA_CD_SETOR_DESTINO</OBJETIVO>
    <ALTERACOES></ALTERACOES>
    */
	PROCEDURE P_VALIDA_CD_SETOR_DESTINO (xml IN OUT NOCOPY PKG_XML.XmlContext,pprotocolo_doc IN OUT NOCOPY PROTOCOLO_DOCRec,
	pit_protocolo_doc IN OUT NOCOPY IT_PROTOCOLO_DOCRec, formParams IN OUT NOCOPY FormParamsRec, FSV_MODE IN OUT NOCOPY varchar2) IS
BEGIN
  IF  pPROTOCOLO_DOC.CD_SETOR_DESTINO IS NOT NULL THEN
    Pkg_MOVDOC_M_PROT_ENVIO.P_CHK_M_PROT_ENVIO_SETOR_DE(xml, pPROTOCOLO_DOC, pIT_PROTOCOLO_DOC, formParams, FSV_MODE);
  END IF;
END;
PROCEDURE P_VALIDA_CD_SETOR_DESTINO (in_params in Clob, out_params out Clob) IS
    xml PKG_XML.XmlContext;
    pprotocolo_doc PROTOCOLO_DOCRec;
    pit_protocolo_doc IT_PROTOCOLO_DOCRec;
    formParams FormParamsRec;
    FSV_MODE VARCHAR2(4000);
BEGIN
        xml := PKG_XML.Init(in_params);
        -- extract input parameters from the XML
        pIT_PROTOCOLO_DOC.CD_DOCUMENTO_PROT:= PKG_XML.GetNUMBER(xml, 'IT_PROTOCOLO_DOC.CD_DOCUMENTO_PROT');
        pPROTOCOLO_DOC.CD_SETOR_DESTINO:= PKG_XML.GetNUMBER(xml, 'PROTOCOLO_DOC.CD_SETOR_DESTINO');
        pPROTOCOLO_DOC.CD_SETOR:= PKG_XML.GetNUMBER(xml, 'PROTOCOLO_DOC.CD_SETOR');
        pPROTOCOLO_DOC.DSP_NM_SETOR_DESTINO:= PKG_XML.GetVARCHAR2(xml, 'PROTOCOLO_DOC.DSP_NM_SETOR_DESTINO');
        formParams.P_CD_SETOR:= PKG_XML.GetNUMBER(xml, 'PARAMETER.P_CD_SETOR');
        formParams.P_NM_SETOR:= PKG_XML.GetVARCHAR2(xml, 'PARAMETER.P_NM_SETOR');
        formParams.P_CD_MULTI_EMPRESA:= PKG_XML.GetNUMBER(xml, 'PARAMETER.P_CD_MULTI_EMPRESA');
        FSV_MODE:= PKG_XML.GetVARCHAR2(xml, 'FSV_MODE');
        BEGIN
            IF Pkg_MOVDOC_M_PROT_ENVIO_C.P_VALIDA_CD_SETOR_DESTINO_E(xml) THEN
                P_VALIDA_CD_SETOR_DESTINO(xml, pPROTOCOLO_DOC, pIT_PROTOCOLO_DOC, formParams, FSV_MODE);
                Pkg_MOVDOC_M_PROT_ENVIO_C.P_VALIDA_CD_SETOR_DESTINO_S(xml);
            END IF;
        EXCEPTION
        WHEN OTHERS THEN
            PKG_XML.AddException(xml, SQLCODE, SQLERRM);
        END;
        -- save output parameters to the XML
        PKG_XML.SetNUMBER(xml, 'IT_PROTOCOLO_DOC.CD_DOCUMENTO_PROT', pIT_PROTOCOLO_DOC.CD_DOCUMENTO_PROT);
        PKG_XML.SetNUMBER(xml, 'PROTOCOLO_DOC.CD_SETOR_DESTINO', pPROTOCOLO_DOC.CD_SETOR_DESTINO);
        PKG_XML.SetNUMBER(xml, 'PROTOCOLO_DOC.CD_SETOR', pPROTOCOLO_DOC.CD_SETOR);
        PKG_XML.SetVARCHAR2(xml, 'PROTOCOLO_DOC.DSP_NM_SETOR_DESTINO', pPROTOCOLO_DOC.DSP_NM_SETOR_DESTINO);
        PKG_XML.SetNUMBER(xml, 'PARAMETER.P_CD_SETOR', formParams.P_CD_SETOR);
        PKG_XML.SetVARCHAR2(xml, 'PARAMETER.P_NM_SETOR', formParams.P_NM_SETOR);
        PKG_XML.SetNUMBER(xml, 'PARAMETER.P_CD_MULTI_EMPRESA', formParams.P_CD_MULTI_EMPRESA);
        PKG_XML.SetVARCHAR2(xml, 'FSV_MODE', FSV_MODE);
        out_params := PKG_XML.GetOutputClob(xml);
END;
    /*
    <DATA_CRIACAO>13/01/2011 17:42</DATA_CRIACAO>
    <CRIADO_POR>Ferramenta de Migração ATX</CRIADO_POR>
    <OBJETIVO>PRC_CONVENIO_REGFAT</OBJETIVO>
    <ALTERACOES></ALTERACOES>
    */
	PROCEDURE P_CONVENIO_REGFAT (xml IN OUT NOCOPY PKG_XML.XmlContext,pit_protocolo_doc IN OUT NOCOPY IT_PROTOCOLO_DOCRec, formParams IN OUT NOCOPY FormParamsRec,pCd_reg_fat in number) IS
CURSOR cConvenio_reg_fat IS
    SELECT CONVENIO.CD_CONVENIO,
           CONVENIO.NM_CONVENIO
      FROM CONVENIO,
           REG_FAT
     WHERE REG_FAT.CD_REG_FAT  =  pCd_reg_fat
       AND REG_FAT.CD_MULTI_EMPRESA = formParams.P_CD_MULTI_EMPRESA
       AND REG_FAT.CD_CONVENIO  =  CONVENIO.CD_CONVENIO;
BEGIN
        OPEN  cConvenio_reg_fat;
        FETCH cConvenio_reg_fat INTO  pIT_PROTOCOLO_DOC.CD_CONVENIO,  pIT_PROTOCOLO_DOC.DSP_NM_CONVENIO ;
        CLOSE cConvenio_reg_fat;
END;
PROCEDURE P_CONVENIO_REGFAT (in_params in Clob, out_params out Clob) IS
    xml PKG_XML.XmlContext;
    pCd_reg_fat number;
    pit_protocolo_doc IT_PROTOCOLO_DOCRec;
    formParams FormParamsRec;
BEGIN
        xml := PKG_XML.Init(in_params);
        -- extract input parameters from the XML
        pIT_PROTOCOLO_DOC.CD_CONVENIO:= PKG_XML.GetNUMBER(xml, 'IT_PROTOCOLO_DOC.CD_CONVENIO');
        pIT_PROTOCOLO_DOC.DSP_NM_CONVENIO:= PKG_XML.GetVARCHAR2(xml, 'IT_PROTOCOLO_DOC.DSP_NM_CONVENIO');
        formParams.P_CD_MULTI_EMPRESA:= PKG_XML.GetNUMBER(xml, 'PARAMETER.P_CD_MULTI_EMPRESA');
        pCd_reg_fat:= PKG_XML.Getnumber(xml, 'pCd_reg_fat');
        BEGIN
            IF Pkg_MOVDOC_M_PROT_ENVIO_C.P_CONVENIO_REGFAT_E(xml) THEN
                P_CONVENIO_REGFAT(xml, pIT_PROTOCOLO_DOC, formParams, pCd_reg_fat);
                Pkg_MOVDOC_M_PROT_ENVIO_C.P_CONVENIO_REGFAT_S(xml);
            END IF;
        EXCEPTION
        WHEN OTHERS THEN
            PKG_XML.AddException(xml, SQLCODE, SQLERRM);
        END;
        -- save output parameters to the XML
        PKG_XML.SetNUMBER(xml, 'IT_PROTOCOLO_DOC.CD_CONVENIO', pIT_PROTOCOLO_DOC.CD_CONVENIO);
        PKG_XML.SetVARCHAR2(xml, 'IT_PROTOCOLO_DOC.DSP_NM_CONVENIO', pIT_PROTOCOLO_DOC.DSP_NM_CONVENIO);
        PKG_XML.SetNUMBER(xml, 'PARAMETER.P_CD_MULTI_EMPRESA', formParams.P_CD_MULTI_EMPRESA);
        out_params := PKG_XML.GetOutputClob(xml);
END;
    /*
    <DATA_CRIACAO>13/01/2011 17:42</DATA_CRIACAO>
    <CRIADO_POR>Ferramenta de Migração ATX</CRIADO_POR>
    <OBJETIVO>PRC_CONVENIO_REGAMB</OBJETIVO>
    <ALTERACOES></ALTERACOES>
    */
	PROCEDURE P_CONVENIO_REGAMB (xml IN OUT NOCOPY PKG_XML.XmlContext,pit_protocolo_doc IN OUT NOCOPY IT_PROTOCOLO_DOCRec, formParams IN OUT NOCOPY FormParamsRec,pCd_Reg_Amb in number) IS
CURSOR cConvenio_reg_amb IS
       SELECT CONVENIO.CD_CONVENIO,
            CONVENIO.NM_CONVENIO
       FROM CONVENIO,
            REG_AMB
      WHERE REG_AMB.CD_REG_AMB  =  pCd_Reg_Amb
        AND REG_AMB.CD_MULTI_EMPRESA = formParams.P_CD_MULTI_EMPRESA
        AND REG_AMB.CD_CONVENIO  =  CONVENIO.CD_CONVENIO;
BEGIN
  OPEN cConvenio_reg_amb;
  FETCH cConvenio_reg_amb INTO  pIT_PROTOCOLO_DOC.CD_CONVENIO,  pIT_PROTOCOLO_DOC.DSP_NM_CONVENIO;
  CLOSE cConvenio_reg_amb;
END;
PROCEDURE P_CONVENIO_REGAMB (in_params in Clob, out_params out Clob) IS
    xml PKG_XML.XmlContext;
    pCd_Reg_Amb number;
    pit_protocolo_doc IT_PROTOCOLO_DOCRec;
    formParams FormParamsRec;
BEGIN
        xml := PKG_XML.Init(in_params);
        -- extract input parameters from the XML
        pIT_PROTOCOLO_DOC.CD_CONVENIO:= PKG_XML.GetNUMBER(xml, 'IT_PROTOCOLO_DOC.CD_CONVENIO');
        pIT_PROTOCOLO_DOC.DSP_NM_CONVENIO:= PKG_XML.GetVARCHAR2(xml, 'IT_PROTOCOLO_DOC.DSP_NM_CONVENIO');
        formParams.P_CD_MULTI_EMPRESA:= PKG_XML.GetNUMBER(xml, 'PARAMETER.P_CD_MULTI_EMPRESA');
        pCd_Reg_Amb:= PKG_XML.Getnumber(xml, 'pCd_Reg_Amb');
        BEGIN
            IF Pkg_MOVDOC_M_PROT_ENVIO_C.P_CONVENIO_REGAMB_E(xml) THEN
                P_CONVENIO_REGAMB(xml, pIT_PROTOCOLO_DOC, formParams, pCd_Reg_Amb);
                Pkg_MOVDOC_M_PROT_ENVIO_C.P_CONVENIO_REGAMB_S(xml);
            END IF;
        EXCEPTION
        WHEN OTHERS THEN
            PKG_XML.AddException(xml, SQLCODE, SQLERRM);
        END;
        -- save output parameters to the XML
        PKG_XML.SetNUMBER(xml, 'IT_PROTOCOLO_DOC.CD_CONVENIO', pIT_PROTOCOLO_DOC.CD_CONVENIO);
        PKG_XML.SetVARCHAR2(xml, 'IT_PROTOCOLO_DOC.DSP_NM_CONVENIO', pIT_PROTOCOLO_DOC.DSP_NM_CONVENIO);
        PKG_XML.SetNUMBER(xml, 'PARAMETER.P_CD_MULTI_EMPRESA', formParams.P_CD_MULTI_EMPRESA);
        out_params := PKG_XML.GetOutputClob(xml);
END;
    /*
    <DATA_CRIACAO>13/01/2011 17:42</DATA_CRIACAO>
    <CRIADO_POR>Ferramenta de Migração ATX</CRIADO_POR>
    <OBJETIVO>PRC_CONVENIO_ATENDIMENTO</OBJETIVO>
    <ALTERACOES></ALTERACOES>
    */
	PROCEDURE P_CONVENIO_ATENDIMENTO (xml IN OUT NOCOPY PKG_XML.XmlContext,pit_protocolo_doc IN OUT NOCOPY IT_PROTOCOLO_DOCRec, formParams IN OUT NOCOPY FormParamsRec) IS
CURSOR cConvenio_atendimento IS
        SELECT CONVENIO.CD_CONVENIO,
              CONVENIO.NM_CONVENIO
         FROM CONVENIO,
              ATENDIME
        WHERE ATENDIME.CD_ATENDIMENTO  =  pIT_PROTOCOLO_DOC.CD_ATENDIMENTO
          AND ATENDIME.CD_MULTI_EMPRESA = formParams.P_CD_MULTI_EMPRESA
          AND ATENDIME.CD_CONVENIO  =  CONVENIO.CD_CONVENIO;
BEGIN
  OPEN cConvenio_atendimento;
  FETCH cConvenio_atendimento INTO  pIT_PROTOCOLO_DOC.CD_CONVENIO,  pIT_PROTOCOLO_DOC.DSP_NM_CONVENIO;
  CLOSE cConvenio_atendimento;
END;
PROCEDURE P_CONVENIO_ATENDIMENTO (in_params in Clob, out_params out Clob) IS
    xml PKG_XML.XmlContext;
    pit_protocolo_doc IT_PROTOCOLO_DOCRec;
    formParams FormParamsRec;
BEGIN
        xml := PKG_XML.Init(in_params);
        -- extract input parameters from the XML
        pIT_PROTOCOLO_DOC.CD_ATENDIMENTO:= PKG_XML.GetNUMBER(xml, 'IT_PROTOCOLO_DOC.CD_ATENDIMENTO');
        pIT_PROTOCOLO_DOC.CD_CONVENIO:= PKG_XML.GetNUMBER(xml, 'IT_PROTOCOLO_DOC.CD_CONVENIO');
        pIT_PROTOCOLO_DOC.DSP_NM_CONVENIO:= PKG_XML.GetVARCHAR2(xml, 'IT_PROTOCOLO_DOC.DSP_NM_CONVENIO');
        formParams.P_CD_MULTI_EMPRESA:= PKG_XML.GetNUMBER(xml, 'PARAMETER.P_CD_MULTI_EMPRESA');
        BEGIN
            IF Pkg_MOVDOC_M_PROT_ENVIO_C.P_CONVENIO_ATENDIMENTO_E(xml) THEN
                P_CONVENIO_ATENDIMENTO(xml, pIT_PROTOCOLO_DOC, formParams);
                Pkg_MOVDOC_M_PROT_ENVIO_C.P_CONVENIO_ATENDIMENTO_S(xml);
            END IF;
        EXCEPTION
        WHEN OTHERS THEN
            PKG_XML.AddException(xml, SQLCODE, SQLERRM);
        END;
        -- save output parameters to the XML
        PKG_XML.SetNUMBER(xml, 'IT_PROTOCOLO_DOC.CD_ATENDIMENTO', pIT_PROTOCOLO_DOC.CD_ATENDIMENTO);
        PKG_XML.SetNUMBER(xml, 'IT_PROTOCOLO_DOC.CD_CONVENIO', pIT_PROTOCOLO_DOC.CD_CONVENIO);
        PKG_XML.SetVARCHAR2(xml, 'IT_PROTOCOLO_DOC.DSP_NM_CONVENIO', pIT_PROTOCOLO_DOC.DSP_NM_CONVENIO);
        PKG_XML.SetNUMBER(xml, 'PARAMETER.P_CD_MULTI_EMPRESA', formParams.P_CD_MULTI_EMPRESA);
        out_params := PKG_XML.GetOutputClob(xml);
END;
    /*
    <DATA_CRIACAO>13/01/2011 17:42</DATA_CRIACAO>
    <CRIADO_POR>Ferramenta de Migração ATX</CRIADO_POR>
    <OBJETIVO>PRC_RETORNA_SETOR</OBJETIVO>
    <ALTERACOES></ALTERACOES>
    */
	PROCEDURE P_RETORNA_SETOR (xml IN OUT NOCOPY PKG_XML.XmlContext,formParams IN OUT NOCOPY FormParamsRec,P_CD_SETOR IN NUMBER, P_RAISE IN BOOLEAN, P_MOSTRA_MENSAGEM IN BOOLEAN) IS
vLst_Retorno PKG_PARAMETRO.ID_LISTA_PARAM;
  vLst_Local PKG_PARAMETRO.ID_LISTA_PARAM;
Begin
    -- Chamada da Procedure
  --
  M_PKG_GLOBAL_SETOR.P_RETORNA_DADOS(xml, P_CD_SETOR
                                     ,formParams.P_CD_MULTI_EMPRESA
                                     ,xml.usuario
                                     ,P_RAISE           --false -- colocar parametros para quando for validate item mostra a mensagem
                                     ,P_MOSTRA_MENSAGEM -- false -- colocar parametros para quando for validate item mostra a mensagem
                                     ,vLst_Retorno);
  --
  vLst_Local  := PKG_PARAMETRO.FN_RECUPERA_LISTA_PARAMETROS(vLst_Retorno);
  --
  PKG_PARAMETRO.PR_RECUPERA_PARAMETRO(vLst_Local,'CD_SETOR',formParams.P_CD_SETOR,True);
  PKG_PARAMETRO.PR_RECUPERA_PARAMETRO(vLst_Local,'NM_SETOR',formParams.P_NM_SETOR,True);
  -- Limpando a lista de Parâmetros
  --
  pkg_parametro.pr_limpar_lista_parametros(vLst_Local);
END;
PROCEDURE P_RETORNA_SETOR (in_params in Clob, out_params out Clob) IS
    xml PKG_XML.XmlContext;
    P_CD_SETOR NUMBER;
    P_RAISE BOOLEAN;
    P_MOSTRA_MENSAGEM BOOLEAN;
    formParams FormParamsRec;
BEGIN
        xml := PKG_XML.Init(in_params);
        -- extract input parameters from the XML
        formParams.P_CD_MULTI_EMPRESA:= PKG_XML.GetNUMBER(xml, 'PARAMETER.P_CD_MULTI_EMPRESA');
        formParams.P_CD_SETOR:= PKG_XML.GetNUMBER(xml, 'PARAMETER.P_CD_SETOR');
        formParams.P_NM_SETOR:= PKG_XML.GetVARCHAR2(xml, 'PARAMETER.P_NM_SETOR');
        P_CD_SETOR:= PKG_XML.GetNUMBER(xml, 'P_CD_SETOR');
        P_RAISE:= PKG_XML.GetBOOLEAN(xml, 'P_RAISE');
        P_MOSTRA_MENSAGEM:= PKG_XML.GetBOOLEAN(xml, 'P_MOSTRA_MENSAGEM');
        BEGIN
            IF Pkg_MOVDOC_M_PROT_ENVIO_C.P_RETORNA_SETOR_E(xml) THEN
                P_RETORNA_SETOR(xml, formParams, P_CD_SETOR, P_RAISE, P_MOSTRA_MENSAGEM);
                Pkg_MOVDOC_M_PROT_ENVIO_C.P_RETORNA_SETOR_S(xml);
            END IF;
        EXCEPTION
        WHEN OTHERS THEN
            PKG_XML.AddException(xml, SQLCODE, SQLERRM);
        END;
        -- save output parameters to the XML
        PKG_XML.SetNUMBER(xml, 'PARAMETER.P_CD_MULTI_EMPRESA', formParams.P_CD_MULTI_EMPRESA);
        PKG_XML.SetNUMBER(xml, 'PARAMETER.P_CD_SETOR', formParams.P_CD_SETOR);
        PKG_XML.SetVARCHAR2(xml, 'PARAMETER.P_NM_SETOR', formParams.P_NM_SETOR);
        out_params := PKG_XML.GetOutputClob(xml);
END;
    /*
    <DATA_CRIACAO>13/01/2011 17:42</DATA_CRIACAO>
    <CRIADO_POR>Ferramenta de Migração ATX</CRIADO_POR>
    <OBJETIVO>PROTOCOLO_DOC.PRE-INSERT</OBJETIVO>
    <ALTERACOES></ALTERACOES>
    */
	PROCEDURE P_B_PI_PROTOCOLO_DOC (xml IN OUT NOCOPY PKG_XML.XmlContext,pprotocolo_doc IN OUT NOCOPY PROTOCOLO_DOCRec) IS
BEGIN
BEGIN
  IF ( pPROTOCOLO_DOC.CD_PROTOCOLO_DOC IS NULL) THEN
  DECLARE
    CURSOR C IS
      SELECT  SEQ_PROTOCOLO_DOC.NEXTVAL
      FROM    SYS.DUAL;
  BEGIN
    OPEN C;
    FETCH C
    INTO     pPROTOCOLO_DOC.CD_PROTOCOLO_DOC;
    IF C%NOTFOUND THEN
      --MULTI-IDIOMA: Utilização do pkg_rmi_traducao.extrair_msg para mensagens (MSG_2)
      PKG_XML_MGS.msg_alert(xml, pkg_rmi_traducao.extrair_pkg_msg('MSG_2', 'PKG_MOVDOC_M_PROT_ENVIO', 'Erro Interno: Nenhuma linha na tabela SYS.DUAL'),'E', true);
    END IF;
    CLOSE C;
  EXCEPTION
    WHEN OTHERS THEN
      RAISE;
  END;
  if  pPROTOCOLO_DOC.CD_SETOR is null then
    --MULTI-IDIOMA: Utilização do pkg_rmi_traducao.extrair_msg para mensagens (MSG_14)
    --MULTI-IDIOMA: Utilização do pkg_rmi_traducao.extrair_msg para mensagens (MSG_15)
    PKG_XML_MGS.CHAMA_MENSAGEM(xml, pkg_rmi_traducao.extrair_pkg_msg('MSG_14', 'PKG_MOVDOC_M_PROT_ENVIO', 'Atenção'),
	pkg_rmi_traducao.extrair_pkg_msg('MSG_15', 'PKG_MOVDOC_M_PROT_ENVIO', 'Erro: Informar o setor do protocolo !%sCausa: Não foi encontrado o setor do protocolo. %sAção: Escolher na lista disponível e informar o setor do protocolo.',
	arg_list(chr(10), chr(10)))
                   ,TRUE);
  end if;
  pPROTOCOLO_DOC.DT_ENVIO := SYSDATE;
  pPROTOCOLO_DOC.NM_USUARIO_ENVIO := user;    -- OP 10726
  END IF;
END;
END P_B_PI_PROTOCOLO_DOC;
PROCEDURE P_B_PI_PROTOCOLO_DOC (in_params in Clob, out_params out Clob) IS
    xml PKG_XML.XmlContext;
    pprotocolo_doc PROTOCOLO_DOCRec;
BEGIN
        xml := PKG_XML.Init(in_params);
        -- extract input parameters from the XML
        pPROTOCOLO_DOC.CD_PROTOCOLO_DOC:= PKG_XML.GetNUMBER(xml, 'PROTOCOLO_DOC.CD_PROTOCOLO_DOC');
        pPROTOCOLO_DOC.CD_SETOR:= PKG_XML.GetNUMBER(xml, 'PROTOCOLO_DOC.CD_SETOR');
        pPROTOCOLO_DOC.DT_ENVIO:= PKG_XML.GetDate(xml, 'PROTOCOLO_DOC.DT_ENVIO');
        pPROTOCOLO_DOC.NM_USUARIO_ENVIO:= PKG_XML.GetVARCHAR2(xml, 'PROTOCOLO_DOC.NM_USUARIO_ENVIO');
        BEGIN
            IF Pkg_MOVDOC_M_PROT_ENVIO_C.P_B_PI_PROTOCOLO_DOC_E(xml) THEN
                P_B_PI_PROTOCOLO_DOC(xml, pPROTOCOLO_DOC);
                Pkg_MOVDOC_M_PROT_ENVIO_C.P_B_PI_PROTOCOLO_DOC_S(xml);
            END IF;
        EXCEPTION
        WHEN OTHERS THEN
            PKG_XML.AddException(xml, SQLCODE, SQLERRM);
        END;
        -- save output parameters to the XML
        PKG_XML.SetNUMBER(xml, 'PROTOCOLO_DOC.CD_PROTOCOLO_DOC', pPROTOCOLO_DOC.CD_PROTOCOLO_DOC);
        PKG_XML.SetNUMBER(xml, 'PROTOCOLO_DOC.CD_SETOR', pPROTOCOLO_DOC.CD_SETOR);
        PKG_XML.SetDate(xml, 'PROTOCOLO_DOC.DT_ENVIO', pPROTOCOLO_DOC.DT_ENVIO);
        PKG_XML.SetVARCHAR2(xml, 'PROTOCOLO_DOC.NM_USUARIO_ENVIO', pPROTOCOLO_DOC.NM_USUARIO_ENVIO);
        out_params := PKG_XML.GetOutputClob(xml);
END;
    /*
    <DATA_CRIACAO>13/01/2011 17:42</DATA_CRIACAO>
    <CRIADO_POR>Ferramenta de Migração ATX</CRIADO_POR>
    <OBJETIVO>PROTOCOLO_DOC.PRE-DELETE</OBJETIVO>
    <ALTERACOES></ALTERACOES>
    */
	PROCEDURE P_B_PD_PROTOCOLO_DOC (xml IN OUT NOCOPY PKG_XML.XmlContext,pprotocolo_doc IN OUT NOCOPY PROTOCOLO_DOCRec) IS
BEGIN
BEGIN
    DELETE FROM IT_PROTOCOLO_DOC
    WHERE  CD_PROTOCOLO_DOC = pPROTOCOLO_DOC.CD_PROTOCOLO_DOC;
END;
END P_B_PD_PROTOCOLO_DOC;
PROCEDURE P_B_PD_PROTOCOLO_DOC (in_params in Clob, out_params out Clob) IS
    xml PKG_XML.XmlContext;
    pprotocolo_doc PROTOCOLO_DOCRec;
BEGIN
        xml := PKG_XML.Init(in_params);
        -- extract input parameters from the XML
        pPROTOCOLO_DOC.CD_PROTOCOLO_DOC:= PKG_XML.GetNUMBER(xml, 'PROTOCOLO_DOC.CD_PROTOCOLO_DOC');
        BEGIN
            IF Pkg_MOVDOC_M_PROT_ENVIO_C.P_B_PD_PROTOCOLO_DOC_E(xml) THEN
                P_B_PD_PROTOCOLO_DOC(xml, pPROTOCOLO_DOC);
                Pkg_MOVDOC_M_PROT_ENVIO_C.P_B_PD_PROTOCOLO_DOC_S(xml);
            END IF;
        EXCEPTION
        WHEN OTHERS THEN
            PKG_XML.AddException(xml, SQLCODE, SQLERRM);
        END;
        -- save output parameters to the XML
        PKG_XML.SetNUMBER(xml, 'PROTOCOLO_DOC.CD_PROTOCOLO_DOC', pPROTOCOLO_DOC.CD_PROTOCOLO_DOC);
        out_params := PKG_XML.GetOutputClob(xml);
END;
    /*
    <DATA_CRIACAO>13/01/2011 17:42</DATA_CRIACAO>
    <CRIADO_POR>Ferramenta de Migração ATX</CRIADO_POR>
    <OBJETIVO>IT_PROTOCOLO_DOC.CD_ATENDIMENTO.WHEN-VALIDATE-ITEM</OBJETIVO>
    <ALTERACOES></ALTERACOES>
    */
	PROCEDURE P_I_WVI_IPD_CD_ATENDIMENTO (xml IN OUT NOCOPY PKG_XML.XmlContext,pit_protocolo_doc IN OUT NOCOPY IT_PROTOCOLO_DOCRec, pprotocolo_doc IN OUT NOCOPY PROTOCOLO_DOCRec, formParams IN OUT NOCOPY FormParamsRec) IS
BEGIN
declare
        cursor c_atendimento is
            select dt_envio
              from protocolo_doc prot_doc
                 , it_protocolo_doc it_prot_doc
             where it_prot_doc.cd_atendimento    = pit_protocolo_doc.cd_atendimento
               and it_prot_doc.cd_documento_prot = pit_protocolo_doc.cd_documento_prot
               and ((it_prot_doc.cd_reg_amb = pit_protocolo_doc.dsp_cd_conta and it_prot_doc.cd_reg_amb is not null)
                or  (it_prot_doc.cd_reg_fat = pit_protocolo_doc.dsp_cd_conta and it_prot_doc.cd_reg_fat is not null)
                or  (it_prot_doc.cd_reg_fat is null and it_prot_doc.cd_reg_amb is null and pit_protocolo_doc.dsp_cd_conta is null))
               and prot_doc.cd_protocolo_doc     = it_prot_doc.cd_protocolo_doc
               and prot_doc.cd_setor             = pprotocolo_doc.cd_setor
               and prot_doc.cd_setor_destino     = pprotocolo_doc.cd_setor_destino
               and dt_devolucao is null
               and dt_recebimento is null;
    vEncontrou date;
  -- OP 18229	- identificando parâmetro
	cursor cConf is
		select valor from dbamv.configuracao
		 where cd_sistema = 'MOVDOC'
			 and chave = 'SN_VALIDA_DEVO_PROT_SETOR'
			 and cd_multi_empresa = dbamv.pkg_mv2000.le_empresa;
	vcConf    dbamv.configuracao.valor%type;

  -- FATURCONV-2674
     Cursor c_conta_fat Is
        Select Distinct a.dt_recebimento,
               a.dt_devolucao,
               a.cd_protocolo_doc,
               a.cd_reg_fat cd_reg_amb,
               b.cd_setor,
               b.cd_setor_destino
        From it_protocolo_doc a, protocolo_doc b
        Where a.cd_protocolo_doc = b.cd_protocolo_doc
          AND  pIT_PROTOCOLO_DOC.DSP_TIPO_ATENDE in ('H','B','HO','I','T')
          And a.cd_reg_fat       = pit_protocolo_doc.dsp_cd_conta
          And a.cd_protocolo_doc = ( select max(i.cd_protocolo_doc)
                                     From it_protocolo_doc i
                                     Where i.cd_documento_prot = pit_protocolo_doc.cd_documento_prot
                                      and  i.cd_reg_fat = pit_protocolo_doc.dsp_cd_conta )
        union
        Select Distinct a.dt_recebimento,
               a.dt_devolucao,
               a.cd_protocolo_doc,
               a.cd_reg_amb,
               b.cd_setor,
               b.cd_setor_destino
        From it_protocolo_doc a, protocolo_doc b
        Where a.cd_protocolo_doc = b.cd_protocolo_doc
          AND  pIT_PROTOCOLO_DOC.DSP_TIPO_ATENDE in ('U','E','AM','A','T')
          And a.cd_reg_amb       = pit_protocolo_doc.dsp_cd_conta
          And a.cd_protocolo_doc = ( select max(i.cd_protocolo_doc)
                                     From it_protocolo_doc i
                                     Where i.cd_documento_prot = pit_protocolo_doc.cd_documento_prot
                                      and  i.cd_reg_amb = pit_protocolo_doc.dsp_cd_conta );
    Linha_Reg c_conta_fat%RowType;

begin
  if Nvl( formParams.P_CD_HOSPITAL,1) <> 267 then
    BEGIN
      IF  pIT_PROTOCOLO_DOC.CD_ATENDIMENTO IS NOT NULL THEN
          BEGIN
						-- OP 18229	- 06/04/2014 - identificando parâmetro que permite movimentar o documento novamente sem ter dado baixa
						vcConf := null;
						open  cConf;
						fetch cConf into vcConf;
						close cConf;
		  -- OP 18229	- usar somente o parâmetro para verificar a validação
					/* pda 430401 - incluindo cliente 970 na condição */
            /* pda 455805/455658 - Cliente 970 solicitou a removoção da validação */
           -- if  formParams.P_CD_HOSPITAL in ('1150', '759', '267') then
            if nvl(vcConf,'N') = 'S' then
              -- FATURCONV-2674
              Open c_conta_fat;
              Fetch c_conta_fat into Linha_reg;
              CLOSE c_conta_fat;
       	      if  pProtocolo_doc.Cd_setor <> Linha_reg.Cd_setor_Destino THEN  -- FATURCONV-2674 - não fazer essa validação se o setor for igual ao setor de destino encontrado.
                open c_atendimento;
                    fetch c_atendimento into vEncontrou;
                    if c_atendimento%found then
                      --MULTI-IDIOMA: Utilização do pkg_rmi_traducao.extrair_msg para mensagens (MSG_14)
                      --MULTI-IDIOMA: Utilização do pkg_rmi_traducao.extrair_msg para mensagens (MSG_16)
                      PKG_XML_MGS.CHAMA_MENSAGEM(xml, pkg_rmi_traducao.extrair_pkg_msg('MSG_14', 'PKG_MOVDOC_M_PROT_ENVIO', 'Atenção'),
					  pkg_rmi_traducao.extrair_pkg_msg('MSG_16', 'PKG_MOVDOC_M_PROT_ENVIO', 'O Atendimento %s teve o documento %s protocolado entre os setores %s(Origem) e %s(Destino) em %s',
arg_list(pit_protocolo_doc.cd_atendimento, pit_protocolo_doc.dsp_ds_documento_prot, pprotocolo_doc.dsp_nm_setor, pprotocolo_doc.dsp_nm_setor_destino, to_char(vEncontrou, 'dd/mm/yyyy'))), true);
                    end if;
                  close c_atendimento;
			  END IF;
            end if;
             Pkg_MOVDOC_M_PROT_ENVIO.P_CHK_M_PROT_ENVIO_ATENDIME(xml, pIT_PROTOCOLO_DOC, formParams, pIT_PROTOCOLO_DOC.CD_ATENDIMENTO);
         EXCEPTION
          WHEN NO_DATA_FOUND THEN
              --MULTI-IDIOMA: Utilização do pkg_rmi_traducao.extrair_msg para mensagens (MSG_3)
              PKG_XML_MGS.msg_alert(xml, pkg_rmi_traducao.extrair_pkg_msg('MSG_3', 'PKG_MOVDOC_M_PROT_ENVIO', 'Erro: Este atendimento não existe ou não pertence a um convênio do tipo CONVÊNIO'),'E',true);
          WHEN OTHERS THEN
                RAISE;
        END;
      	/*PDA.: 595282 - 03/06/2013 - Emanoel Deivison (inicio)
      	  Descrição: Substituído o "union all" por "union" pois quando o cursor de contas hospitalares não retornava valor,
      		           o campo estava vindo nulo e com isso o cursor estava sempre pegando o valor nulo para atendimendos do
      		           tipo ambulatorial.
      	*/
          if  formParams.P_CD_HOSPITAL = 360 then
                declare
                    cursor cConta is
                      select max(reg_fat.cd_reg_fat) cd_conta
                        from reg_fat
                       where reg_fat.cd_atendimento = pIT_PROTOCOLO_DOC.CD_ATENDIMENTO
                      union all
                      select max(itreg_amb.cd_reg_amb) cd_conta
                        from itreg_amb
                       where itreg_amb.cd_atendimento = pIT_PROTOCOLO_DOC.CD_ATENDIMENTO;
                    nConta   number;
                begin
                    if  pIT_PROTOCOLO_DOC.DSP_CD_CONTA is null then
                      open  cConta;
                      fetch cConta  into  nConta;
                      close cConta;
                      pIT_PROTOCOLO_DOC.DSP_CD_CONTA := nConta;
                    end if;
                end;
          end if;
      /*PDA.: 595282 - 03/06/2013 - Emanoel Deivison (fim)*/
      END IF;
    END;
  end if;
end;
END P_I_WVI_IPD_CD_ATENDIMENTO;
PROCEDURE P_I_WVI_IPD_CD_ATENDIMENTO (in_params in Clob, out_params out Clob) IS
    xml PKG_XML.XmlContext;
    pit_protocolo_doc IT_PROTOCOLO_DOCRec;
    pprotocolo_doc PROTOCOLO_DOCRec;
    formParams FormParamsRec;
BEGIN
        xml := PKG_XML.Init(in_params);
        -- extract input parameters from the XML
        pIT_PROTOCOLO_DOC.CD_ATENDIMENTO:= PKG_XML.GetNUMBER(xml, 'IT_PROTOCOLO_DOC.CD_ATENDIMENTO');
        pIT_PROTOCOLO_DOC.CD_DOCUMENTO_PROT:= PKG_XML.GetNUMBER(xml, 'IT_PROTOCOLO_DOC.CD_DOCUMENTO_PROT');
        pIT_PROTOCOLO_DOC.DSP_CD_CONTA:= PKG_XML.GetNUMBER(xml, 'IT_PROTOCOLO_DOC.DSP_CD_CONTA');
        pIT_PROTOCOLO_DOC.DSP_DS_DOCUMENTO_PROT:= PKG_XML.GetVARCHAR2(xml, 'IT_PROTOCOLO_DOC.DSP_DS_DOCUMENTO_PROT');
        pIT_PROTOCOLO_DOC.DSP_TIPO_ATENDE:= PKG_XML.GetVARCHAR2(xml, 'IT_PROTOCOLO_DOC.DSP_TIPO_ATENDE');
        pIT_PROTOCOLO_DOC.DSP_CD_PACIENTE:= PKG_XML.GetNUMBER(xml, 'IT_PROTOCOLO_DOC.DSP_CD_PACIENTE');
        pIT_PROTOCOLO_DOC.DSP_DT_ATENDIMENTO:= PKG_XML.GetDATE(xml, 'IT_PROTOCOLO_DOC.DSP_DT_ATENDIMENTO');
        pIT_PROTOCOLO_DOC.DSP_TP_ATENDIMENTO:= PKG_XML.GetVARCHAR2(xml, 'IT_PROTOCOLO_DOC.DSP_TP_ATENDIMENTO');
        pIT_PROTOCOLO_DOC.DSP_NM_PACIENTE:= PKG_XML.GetVARCHAR2(xml, 'IT_PROTOCOLO_DOC.DSP_NM_PACIENTE');
        pIT_PROTOCOLO_DOC.DSP_NM_PRESTADOR:= PKG_XML.GetVARCHAR2(xml, 'IT_PROTOCOLO_DOC.DSP_NM_PRESTADOR');
        pPROTOCOLO_DOC.CD_SETOR:= PKG_XML.GetNUMBER(xml, 'PROTOCOLO_DOC.CD_SETOR');
        pPROTOCOLO_DOC.CD_SETOR_DESTINO:= PKG_XML.GetNUMBER(xml, 'PROTOCOLO_DOC.CD_SETOR_DESTINO');
        pPROTOCOLO_DOC.DSP_NM_SETOR:= PKG_XML.GetVARCHAR2(xml, 'PROTOCOLO_DOC.DSP_NM_SETOR');
        pPROTOCOLO_DOC.DSP_NM_SETOR_DESTINO:= PKG_XML.GetVARCHAR2(xml, 'PROTOCOLO_DOC.DSP_NM_SETOR_DESTINO');
        formParams.P_CD_HOSPITAL:= PKG_XML.GetNUMBER(xml, 'PARAMETER.P_CD_HOSPITAL');
        formParams.P_CD_MULTI_EMPRESA:= PKG_XML.GetNUMBER(xml, 'PARAMETER.P_CD_MULTI_EMPRESA');
        BEGIN
            IF Pkg_MOVDOC_M_PROT_ENVIO_C.P_I_WVI_IPD_CD_ATENDIMENTO_E(xml) THEN
                P_I_WVI_IPD_CD_ATENDIMENTO(xml, pIT_PROTOCOLO_DOC, pPROTOCOLO_DOC, formParams);
                Pkg_MOVDOC_M_PROT_ENVIO_C.P_I_WVI_IPD_CD_ATENDIMENTO_S(xml);
            END IF;
        EXCEPTION
        WHEN OTHERS THEN
            PKG_XML.AddException(xml, SQLCODE, SQLERRM);
        END;
        -- save output parameters to the XML
        PKG_XML.SetNUMBER(xml, 'IT_PROTOCOLO_DOC.CD_ATENDIMENTO', pIT_PROTOCOLO_DOC.CD_ATENDIMENTO);
        PKG_XML.SetNUMBER(xml, 'IT_PROTOCOLO_DOC.CD_DOCUMENTO_PROT', pIT_PROTOCOLO_DOC.CD_DOCUMENTO_PROT);
        PKG_XML.SetNUMBER(xml, 'IT_PROTOCOLO_DOC.DSP_CD_CONTA', pIT_PROTOCOLO_DOC.DSP_CD_CONTA);
        PKG_XML.SetVARCHAR2(xml, 'IT_PROTOCOLO_DOC.DSP_DS_DOCUMENTO_PROT', pIT_PROTOCOLO_DOC.DSP_DS_DOCUMENTO_PROT);
        PKG_XML.SetVARCHAR2(xml, 'IT_PROTOCOLO_DOC.DSP_TIPO_ATENDE', pIT_PROTOCOLO_DOC.DSP_TIPO_ATENDE);
        PKG_XML.SetNUMBER(xml, 'IT_PROTOCOLO_DOC.DSP_CD_PACIENTE', pIT_PROTOCOLO_DOC.DSP_CD_PACIENTE);
        PKG_XML.SetDATE(xml, 'IT_PROTOCOLO_DOC.DSP_DT_ATENDIMENTO', pIT_PROTOCOLO_DOC.DSP_DT_ATENDIMENTO);
        PKG_XML.SetVARCHAR2(xml, 'IT_PROTOCOLO_DOC.DSP_TP_ATENDIMENTO', pIT_PROTOCOLO_DOC.DSP_TP_ATENDIMENTO);
        PKG_XML.SetVARCHAR2(xml, 'IT_PROTOCOLO_DOC.DSP_NM_PACIENTE', pIT_PROTOCOLO_DOC.DSP_NM_PACIENTE);
        PKG_XML.SetVARCHAR2(xml, 'IT_PROTOCOLO_DOC.DSP_NM_PRESTADOR', pIT_PROTOCOLO_DOC.DSP_NM_PRESTADOR);
        PKG_XML.SetNUMBER(xml, 'PROTOCOLO_DOC.CD_SETOR', pPROTOCOLO_DOC.CD_SETOR);
        PKG_XML.SetNUMBER(xml, 'PROTOCOLO_DOC.CD_SETOR_DESTINO', pPROTOCOLO_DOC.CD_SETOR_DESTINO);
        PKG_XML.SetVARCHAR2(xml, 'PROTOCOLO_DOC.DSP_NM_SETOR', pPROTOCOLO_DOC.DSP_NM_SETOR);
        PKG_XML.SetVARCHAR2(xml, 'PROTOCOLO_DOC.DSP_NM_SETOR_DESTINO', pPROTOCOLO_DOC.DSP_NM_SETOR_DESTINO);
        PKG_XML.SetNUMBER(xml, 'PARAMETER.P_CD_HOSPITAL', formParams.P_CD_HOSPITAL);
        PKG_XML.SetNUMBER(xml, 'PARAMETER.P_CD_MULTI_EMPRESA', formParams.P_CD_MULTI_EMPRESA);
        out_params := PKG_XML.GetOutputClob(xml);
END;
    /*
    <DATA_CRIACAO>13/01/2011 17:42</DATA_CRIACAO>
    <CRIADO_POR>Ferramenta de Migração ATX</CRIADO_POR>
    <OBJETIVO>IT_PROTOCOLO_DOC.DSP_CD_CONTA.WHEN-VALIDATE-ITEM</OBJETIVO>
    <ALTERACOES></ALTERACOES>
    */
	PROCEDURE P_I_WVI_IPD_DSP_CD_CONTA (xml IN OUT NOCOPY PKG_XML.XmlContext,pit_protocolo_doc IN OUT NOCOPY IT_PROTOCOLO_DOCRec, pprotocolo_doc IN OUT NOCOPY PROTOCOLO_DOCRec,
	pcg$ctrl_import IN OUT NOCOPY CG$CTRL_IMPORTRec, var IN OUT NOCOPY VARRec, global IN OUT NOCOPY GlobalsRec, formParams IN OUT NOCOPY FormParamsRec, FSV_BLOCK_STATUS IN OUT NOCOPY varchar2, FSV_RECORD_STATUS IN OUT NOCOPY varchar2) IS
BEGIN
declare
  -- OP 34289 - Ajuste na seleção dos tipos de atendimento
  cursor c_conta is
    select dt_envio
      from protocolo_doc prot_doc
         , it_protocolo_doc it_prot_doc
     where it_prot_doc.cd_reg_amb            = pit_protocolo_doc.dsp_cd_conta
       and ( pit_protocolo_doc.dsp_tipo_atende IN ('AM','A','E','U','T') )
       and it_prot_doc.cd_documento_prot     = pit_protocolo_doc.cd_documento_prot
       and prot_doc.cd_protocolo_doc         = it_prot_doc.cd_protocolo_doc
       and prot_doc.cd_setor                 = pprotocolo_doc.cd_setor
       and prot_doc.cd_setor_destino         = pprotocolo_doc.cd_setor_destino
       and it_prot_doc.dt_devolucao is null
union
    select dt_envio
      from protocolo_doc prot_doc
         , it_protocolo_doc it_prot_doc
     where it_prot_doc.cd_reg_fat            = pit_protocolo_doc.dsp_cd_conta
       and ( pit_protocolo_doc.dsp_tipo_atende IN ('HO','I','H','B','T') )
       and it_prot_doc.cd_documento_prot     = pit_protocolo_doc.cd_documento_prot
       and prot_doc.cd_protocolo_doc         = it_prot_doc.cd_protocolo_doc
       and prot_doc.cd_setor                 = pprotocolo_doc.cd_setor
       and prot_doc.cd_setor_destino         = pprotocolo_doc.cd_setor_destino
       and it_prot_doc.dt_devolucao is NULL;
    vEncontrou Date;
  -- OP 18229	- identificando parâmetro
	cursor cConf is
		select valor from dbamv.configuracao
		 where cd_sistema = 'MOVDOC'
			 and chave = 'SN_VALIDA_DEVO_PROT_SETOR'
			 and cd_multi_empresa = dbamv.pkg_mv2000.le_empresa;
	vcConf    dbamv.configuracao.valor%type;
BEGIN
  IF  pIT_PROTOCOLO_DOC.DSP_CD_CONTA IS NOT NULL THEN
    BEGIN
			-- OP 18229	- 06/04/2014 - identificando parâmetro que permite movimentar o documento novamente sem ter dado baixa
			vcConf := null;
		  open  cConf;
			fetch cConf into vcConf;
			close cConf;
		  -- OP 18229	- usar somente o parâmetro para verificar a validação
      /* pda 430401 - incluindo cliente 970 na condição */
      /* pda 455805/455658 - Cliente 970 solicitou a removoção da validação */
      --if  formParams.P_CD_HOSPITAL in ('759', '267') and nvl(vcConf,'N') = 'S' then
      if nvl(vcConf,'N') = 'S' then
        open c_conta;
        fetch c_conta into vEncontrou;
        if c_conta%found then
          --MULTI-IDIOMA: Utilização do pkg_rmi_traducao.extrair_msg para mensagens (MSG_14)
          --MULTI-IDIOMA: Utilização do pkg_rmi_traducao.extrair_msg para mensagens (MSG_17)
          PKG_XML_MGS.CHAMA_MENSAGEM(xml, pkg_rmi_traducao.extrair_pkg_msg('MSG_14', 'PKG_MOVDOC_M_PROT_ENVIO', 'Atenção'),pkg_rmi_traducao.extrair_pkg_msg('MSG_17', 'PKG_MOVDOC_M_PROT_ENVIO',
		      	  'A conta %s teve o documento %s protocolado entre os setores %s(Origem) e %s(Destino) em %s.',
			        arg_list(pit_protocolo_doc.dsp_cd_conta, pit_protocolo_doc.dsp_ds_documento_prot, pprotocolo_doc.dsp_nm_setor, pprotocolo_doc.dsp_nm_setor_destino, to_char(vEncontrou, 'dd/mm/yyyy'))), true);
        end if;
        close c_conta;
      end if;
      Pkg_MOVDOC_M_PROT_ENVIO.P_CHK_M_PROT_ENVIO_CONTA(xml, pIT_PROTOCOLO_DOC, pCG$CTRL_IMPORT, global, formParams, FSV_RECORD_STATUS, pIT_PROTOCOLO_DOC.DSP_CD_CONTA);
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
             if  FSV_Block_Status = 'QUERY' then
                 --MULTI-IDIOMA: Utilização do pkg_rmi_traducao.extrair_msg para mensagens (MSG_5)
                 --MULTI-IDIOMA: Utilização do pkg_rmi_traducao.extrair_msg para mensagens (MSG_18)
                 PKG_XML_MGS.CHAMA_MENSAGEM(xml, pkg_rmi_traducao.extrair_pkg_msg('MSG_5', 'PKG_MOVDOC_M_PROT_ENVIO', 'Atenção:'),
				 pkg_rmi_traducao.extrair_pkg_msg('MSG_18', 'PKG_MOVDOC_M_PROT_ENVIO', 'Erro: Conta %s não existe%sAção: Informe uma conta válida.', arg_list(pIT_PROTOCOLO_DOC.DSP_CD_CONTA, chr(10))),true);
             else
               --MULTI-IDIOMA: Utilização do pkg_rmi_traducao.extrair_msg para mensagens (MSG_4)
               PKG_XML_MGS.msg_alert(xml, pkg_rmi_traducao.extrair_pkg_msg('MSG_4', 'PKG_MOVDOC_M_PROT_ENVIO', 'Erro: Conta não existe'),'E',true);
             end if;
           WHEN OTHERS THEN
        RAISE;
    END;
  END IF;
END;
-- checa onde esta a conta no momento nao permitindo que o setor envie a conta sem que esta com ele.
declare
    VContinua varchar(1) := 'N';
begin
  If FSV_Block_Status <> 'QUERY'
     and Pkg_MOVDOC_M_PROT_ENVIO.F_CHK_CONTA_RET(xml, pIT_PROTOCOLO_DOC,  pIT_PROTOCOLO_DOC.CD_DOCUMENTO_PROT) = 'S'
     -- AND pIT_PROTOCOLO_DOC.DSP_CD_CONTA IS NOT NULL  -- pda RE 523980/243825 - comentado
     then
      VContinua := Pkg_MOVDOC_M_PROT_ENVIO.F_CHK_SITUACAO_CTA(xml, pIT_PROTOCOLO_DOC, pPROTOCOLO_DOC, VAR, formParams);
  End If;
  if vContinua = 'S' then
	  IF   pIT_PROTOCOLO_DOC.DSP_TIPO_ATENDE IN ('HO','I','H','B') AND  pIT_PROTOCOLO_DOC.DSP_CD_CONTA IS NOT NULL  THEN
		  Pkg_MOVDOC_M_PROT_ENVIO.P_CONVENIO_REGFAT(xml, pIT_PROTOCOLO_DOC, formParams, pIT_PROTOCOLO_DOC.DSP_CD_CONTA);
	  ELSIF  pIT_PROTOCOLO_DOC.DSP_TIPO_ATENDE = 'A' AND  pIT_PROTOCOLO_DOC.DSP_CD_CONTA IS NOT NULL  THEN
			Pkg_MOVDOC_M_PROT_ENVIO.P_CONVENIO_REGAMB(xml, pIT_PROTOCOLO_DOC, formParams, pIT_PROTOCOLO_DOC.DSP_CD_CONTA);
	  ELSIF  pIT_PROTOCOLO_DOC.CD_ATENDIMENTO IS NOT NULL THEN
			Pkg_MOVDOC_M_PROT_ENVIO.P_CONVENIO_ATENDIMENTO(xml, pIT_PROTOCOLO_DOC, formParams);
	  ELSE
	   pIT_PROTOCOLO_DOC.CD_CONVENIO := NULL;
	   pIT_PROTOCOLO_DOC.DSP_NM_CONVENIO := NULL;
	  END IF;
  else
		if nvl( pCG$CTRL_IMPORT.SN_IMPORT, 'N') = 'N' and length(var.VMsgErro) > 0 then
		   --MULTI-IDIOMA: Utilização do pkg_rmi_traducao.extrair_msg para mensagens (MSG_5)
		   --MULTI-IDIOMA: Utilização do pkg_rmi_traducao.extrair_msg para mensagens (MSG_19)
		   PKG_XML_MGS.CHAMA_MENSAGEM(xml, pkg_rmi_traducao.extrair_pkg_msg('MSG_5', 'PKG_MOVDOC_M_PROT_ENVIO', 'Atenção:'),pkg_rmi_traducao.extrair_pkg_msg('MSG_19', 'PKG_MOVDOC_M_PROT_ENVIO', 'Erro: %s.', arg_list(var.VMsgErro)),true);
		end if;
  end if;
end;
END P_I_WVI_IPD_DSP_CD_CONTA;
PROCEDURE P_I_WVI_IPD_DSP_CD_CONTA (in_params in Clob, out_params out Clob) IS
    xml PKG_XML.XmlContext;
    pit_protocolo_doc IT_PROTOCOLO_DOCRec;
    pprotocolo_doc PROTOCOLO_DOCRec;
    pcg$ctrl_import CG$CTRL_IMPORTRec;
    var VARRec;
    global GlobalsRec;
    formParams FormParamsRec;
    FSV_BLOCK_STATUS VARCHAR2(4000);
    FSV_RECORD_STATUS VARCHAR2(4000);
BEGIN
        xml := PKG_XML.Init(in_params);
        -- extract input parameters from the XML
        pCG$CTRL_IMPORT.SN_IMPORT:= PKG_XML.GetVARCHAR2(xml, 'CG$CTRL_IMPORT.SN_IMPORT');
        pIT_PROTOCOLO_DOC.DSP_CD_CONTA:= PKG_XML.GetNUMBER(xml, 'IT_PROTOCOLO_DOC.DSP_CD_CONTA');
        pIT_PROTOCOLO_DOC.DSP_TIPO_ATENDE:= PKG_XML.GetVARCHAR2(xml, 'IT_PROTOCOLO_DOC.DSP_TIPO_ATENDE');
        pIT_PROTOCOLO_DOC.CD_DOCUMENTO_PROT:= PKG_XML.GetNUMBER(xml, 'IT_PROTOCOLO_DOC.CD_DOCUMENTO_PROT');
        pIT_PROTOCOLO_DOC.DSP_DS_DOCUMENTO_PROT:= PKG_XML.GetVARCHAR2(xml, 'IT_PROTOCOLO_DOC.DSP_DS_DOCUMENTO_PROT');
        pIT_PROTOCOLO_DOC.CD_ATENDIMENTO:= PKG_XML.GetNUMBER(xml, 'IT_PROTOCOLO_DOC.CD_ATENDIMENTO');
        pIT_PROTOCOLO_DOC.CD_CONVENIO:= PKG_XML.GetNUMBER(xml, 'IT_PROTOCOLO_DOC.CD_CONVENIO');
        pIT_PROTOCOLO_DOC.DSP_NM_CONVENIO:= PKG_XML.GetVARCHAR2(xml, 'IT_PROTOCOLO_DOC.DSP_NM_CONVENIO');
        pIT_PROTOCOLO_DOC.TP_CONTA:= PKG_XML.GetVARCHAR2(xml, 'IT_PROTOCOLO_DOC.TP_CONTA');
        pPROTOCOLO_DOC.CD_SETOR:= PKG_XML.GetNUMBER(xml, 'PROTOCOLO_DOC.CD_SETOR');
        pPROTOCOLO_DOC.CD_SETOR_DESTINO:= PKG_XML.GetNUMBER(xml, 'PROTOCOLO_DOC.CD_SETOR_DESTINO');
        pPROTOCOLO_DOC.DSP_NM_SETOR:= PKG_XML.GetVARCHAR2(xml, 'PROTOCOLO_DOC.DSP_NM_SETOR');
        pPROTOCOLO_DOC.DSP_NM_SETOR_DESTINO:= PKG_XML.GetVARCHAR2(xml, 'PROTOCOLO_DOC.DSP_NM_SETOR_DESTINO');
        VAR.vMsgErro:= PKG_XML.Getvarchar2(xml, 'VAR.VMSGERRO');
        global.LG_ATENDIME:= PKG_XML.GetVARCHAR2(xml, 'GLOBAL.LG_ATENDIME');
        formParams.P_CD_HOSPITAL:= PKG_XML.GetNUMBER(xml, 'PARAMETER.P_CD_HOSPITAL');
        formParams.P_NM_SETOR:= PKG_XML.GetVARCHAR2(xml, 'PARAMETER.P_NM_SETOR');
        formParams.P_CD_MULTI_EMPRESA:= PKG_XML.GetNUMBER(xml, 'PARAMETER.P_CD_MULTI_EMPRESA');
        formParams.P_CD_SETOR:= PKG_XML.GetNUMBER(xml, 'PARAMETER.P_CD_SETOR');
        FSV_BLOCK_STATUS:= PKG_XML.GetVARCHAR2(xml, 'FSV_BLOCK_STATUS');
        FSV_RECORD_STATUS:= PKG_XML.GetVARCHAR2(xml, 'FSV_RECORD_STATUS');
        BEGIN
            IF Pkg_MOVDOC_M_PROT_ENVIO_C.P_I_WVI_IPD_DSP_CD_CONTA_E(xml) THEN
                P_I_WVI_IPD_DSP_CD_CONTA(xml, pIT_PROTOCOLO_DOC, pPROTOCOLO_DOC, pCG$CTRL_IMPORT, VAR, global, formParams, FSV_BLOCK_STATUS, FSV_RECORD_STATUS);
                Pkg_MOVDOC_M_PROT_ENVIO_C.P_I_WVI_IPD_DSP_CD_CONTA_S(xml);
            END IF;
        EXCEPTION
        WHEN OTHERS THEN
            PKG_XML.AddException(xml, SQLCODE, SQLERRM);
        END;
        -- save output parameters to the XML
        PKG_XML.SetVARCHAR2(xml, 'CG$CTRL_IMPORT.SN_IMPORT', pCG$CTRL_IMPORT.SN_IMPORT);
        PKG_XML.SetNUMBER(xml, 'IT_PROTOCOLO_DOC.DSP_CD_CONTA', pIT_PROTOCOLO_DOC.DSP_CD_CONTA);
        PKG_XML.SetVARCHAR2(xml, 'IT_PROTOCOLO_DOC.DSP_TIPO_ATENDE', pIT_PROTOCOLO_DOC.DSP_TIPO_ATENDE);
        PKG_XML.SetNUMBER(xml, 'IT_PROTOCOLO_DOC.CD_DOCUMENTO_PROT', pIT_PROTOCOLO_DOC.CD_DOCUMENTO_PROT);
        PKG_XML.SetVARCHAR2(xml, 'IT_PROTOCOLO_DOC.DSP_DS_DOCUMENTO_PROT', pIT_PROTOCOLO_DOC.DSP_DS_DOCUMENTO_PROT);
        PKG_XML.SetNUMBER(xml, 'IT_PROTOCOLO_DOC.CD_ATENDIMENTO', pIT_PROTOCOLO_DOC.CD_ATENDIMENTO);
        PKG_XML.SetNUMBER(xml, 'IT_PROTOCOLO_DOC.CD_CONVENIO', pIT_PROTOCOLO_DOC.CD_CONVENIO);
        PKG_XML.SetVARCHAR2(xml, 'IT_PROTOCOLO_DOC.DSP_NM_CONVENIO', pIT_PROTOCOLO_DOC.DSP_NM_CONVENIO);
        PKG_XML.SetVARCHAR2(xml, 'IT_PROTOCOLO_DOC.TP_CONTA', pIT_PROTOCOLO_DOC.TP_CONTA);
        PKG_XML.SetNUMBER(xml, 'PROTOCOLO_DOC.CD_SETOR', pPROTOCOLO_DOC.CD_SETOR);
        PKG_XML.SetNUMBER(xml, 'PROTOCOLO_DOC.CD_SETOR_DESTINO', pPROTOCOLO_DOC.CD_SETOR_DESTINO);
        PKG_XML.SetVARCHAR2(xml, 'PROTOCOLO_DOC.DSP_NM_SETOR', pPROTOCOLO_DOC.DSP_NM_SETOR);
        PKG_XML.SetVARCHAR2(xml, 'PROTOCOLO_DOC.DSP_NM_SETOR_DESTINO', pPROTOCOLO_DOC.DSP_NM_SETOR_DESTINO);
        PKG_XML.Setvarchar2(xml, 'VAR.VMSGERRO', VAR.vMsgErro);
        PKG_XML.SetVARCHAR2(xml, 'GLOBAL.LG_ATENDIME', global.LG_ATENDIME);
        PKG_XML.SetNUMBER(xml, 'PARAMETER.P_CD_HOSPITAL', formParams.P_CD_HOSPITAL);
        PKG_XML.SetVARCHAR2(xml, 'PARAMETER.P_NM_SETOR', formParams.P_NM_SETOR);
        PKG_XML.SetNUMBER(xml, 'PARAMETER.P_CD_MULTI_EMPRESA', formParams.P_CD_MULTI_EMPRESA);
        PKG_XML.SetNUMBER(xml, 'PARAMETER.P_CD_SETOR', formParams.P_CD_SETOR);
        PKG_XML.SetVARCHAR2(xml, 'FSV_BLOCK_STATUS', FSV_BLOCK_STATUS);
        PKG_XML.SetVARCHAR2(xml, 'FSV_RECORD_STATUS', FSV_RECORD_STATUS);
        out_params := PKG_XML.GetOutputClob(xml);
END;
/*
<DATA_CRIACAO>13/01/2011 17:42</DATA_CRIACAO>
<CRIADO_POR>Ferramenta de Migração ATX</CRIADO_POR>
<OBJETIVO>IT_PROTOCOLO_DOC.WHEN-VALIDATE-RECORD</OBJETIVO>
<ALTERACOES></ALTERACOES>
*/
PROCEDURE P_B_WVR_IT_PROTOCOLO_DOC (xml IN OUT NOCOPY PKG_XML.XmlContext,pit_protocolo_doc IN OUT NOCOPY IT_PROTOCOLO_DOCRec, formParams IN OUT NOCOPY FormParamsRec, FSV_RECORD_STATUS IN OUT NOCOPY varchar2) IS
BEGIN
DECLARE
	-- OP 18190 - 04/04/2014 - usando um cursor direto pois a rotina usada anteriormente não funcionava
  -- indica se o documento é remessa
	cursor c_sn_documento_remessa is
	  select nvl(sn_remessa,'N') sn_remessa
	    from dbamv.documento_prot
	   where cd_documento_prot= pIT_PROTOCOLO_DOC.CD_DOCUMENTO_PROT;
	v_sn_documento_remessa 	VARCHAR2(10);
BEGIN
	-- OP 18190 - 04/04/2014 - usando um cursor direto pois a rotina usada anteriormente não funcionava
    open c_sn_documento_remessa;
    fetch c_sn_documento_remessa into v_sn_documento_remessa;
    close c_sn_documento_remessa;
  IF  pIT_PROTOCOLO_DOC.CD_CONVENIO IS NOT NULL
        and Pkg_MOVDOC_M_PROT_ENVIO.F_CHK_CONTA_RET(xml, pIT_PROTOCOLO_DOC,  pIT_PROTOCOLO_DOC.CD_DOCUMENTO_PROT) = 'N' and
     ( FSV_record_status = 'INSERT' or  FSV_record_status = 'CHANGED')
     and v_sn_documento_remessa = 'N' THEN
        DECLARE
            CURSOR cRegFat is
          select reg_fat.cd_reg_fat,
                  itreg_fat.cd_lancamento
            from itreg_fat,
                 reg_fat,
                 documento_proc
           where to_char(itreg_fat.dt_lancamento,'DDMMYYYY') =
                 to_char(pIT_PROTOCOLO_DOC.DT_REALIZACAO,'DDMMYYYY')
             and to_char(itreg_fat.hr_lancamento,'HH24MI') =
                 to_char(pIT_PROTOCOLO_DOC.HR_REALIZACAO,'HH24MI')
             AND REG_FAT.CD_MULTI_EMPRESA = formParams.P_CD_MULTI_EMPRESA
             and reg_fat.cd_convenio = pIT_PROTOCOLO_DOC.CD_CONVENIO
             and itreg_fat.cd_reg_fat = reg_fat.cd_reg_fat
             and itreg_fat.cd_pro_fat = documento_proc.cd_pro_fat
             and documento_proc.cd_documento_prot = pIT_PROTOCOLO_DOC.CD_DOCUMENTO_PROT
             and reg_fat.cd_atendimento = pIT_PROTOCOLO_DOC.CD_ATENDIMENTO
             and rownum = 1
           order by reg_fat.cd_reg_fat;
            CURSOR cRegAmb is
             select reg_amb.cd_reg_amb,
                    itreg_amb.cd_lancamento
            from itreg_amb,
                 reg_amb,
                 documento_proc
           where to_char(pIT_PROTOCOLO_DOC.DSP_DT_ATENDIMENTO,'DDMMYYYY') =
                 to_char(pIT_PROTOCOLO_DOC.DT_REALIZACAO,'DDMMYYYY')
             and to_char(itreg_amb.hr_lancamento,' HH24MI') =
                 to_char(pIT_PROTOCOLO_DOC.HR_REALIZACAO,'HH24MI')
             AND REG_AMB.CD_MULTI_EMPRESA = formParams.P_CD_MULTI_EMPRESA
             and reg_amb.cd_convenio = pIT_PROTOCOLO_DOC.CD_CONVENIO
             and itreg_amb.cd_reg_amb = reg_amb.cd_reg_amb
             and itreg_amb.cd_pro_fat = documento_proc.cd_pro_fat
             and documento_proc.cd_documento_prot = pIT_PROTOCOLO_DOC.CD_DOCUMENTO_PROT
             and itreg_amb.cd_atendimento = pIT_PROTOCOLO_DOC.CD_ATENDIMENTO
             and rownum = 1
           order by reg_amb.cd_reg_amb;
          cProFat DOCUMENTO_PROC.CD_PRO_FAT%TYPE;
        BEGIN
       cProFat := Pkg_MOVDOC_M_PROT_ENVIO.F_RETORNA_CPROC(xml, pIT_PROTOCOLO_DOC.CD_DOCUMENTO_PROT);
             IF cProFat IS NOT NULL THEN
               pIT_PROTOCOLO_DOC.DSP_CD_CONTA := NULL;
               pIT_PROTOCOLO_DOC.CD_REG_FAT   := NULL;
               pIT_PROTOCOLO_DOC.CD_REG_AMB   := NULL;
                if    pIT_PROTOCOLO_DOC.DSP_TP_ATENDIMENTO = 'HOSPITALAR'  then
                             OPEN  cRegFat;
                             FETCH  cRegFat  INTO   pIT_PROTOCOLO_DOC.CD_REG_FAT,   pIT_PROTOCOLO_DOC.CD_LANCAMENTO_FAT;
                             CLOSE  cRegFat;
                Else
                             OPEN  cRegAmb;
                             FETCH  cRegAmb  INTO   pIT_PROTOCOLO_DOC.CD_REG_AMB,   pIT_PROTOCOLO_DOC.CD_LANCAMENTO_AMB;
                             CLOSE  cRegAmb;
                End if;
                pIT_PROTOCOLO_DOC.DSP_CD_CONTA := NVL(pIT_PROTOCOLO_DOC.CD_REG_FAT,pIT_PROTOCOLO_DOC.CD_REG_AMB);
                if   pIT_PROTOCOLO_DOC.DSP_CD_CONTA is null  then
                     --MULTI-IDIOMA: Utilização do pkg_rmi_traducao.extrair_msg para mensagens (MSG_5)
                     --MULTI-IDIOMA: Utilização do pkg_rmi_traducao.extrair_msg para mensagens (MSG_20)
                     PKG_XML_MGS.CHAMA_MENSAGEM(xml, pkg_rmi_traducao.extrair_pkg_msg('MSG_5', 'PKG_MOVDOC_M_PROT_ENVIO', 'Atenção:'),
					 pkg_rmi_traducao.extrair_pkg_msg('MSG_20', 'PKG_MOVDOC_M_PROT_ENVIO',
					 ' Este documento de protocolo está vinculado a procedimentos. %sNão foi encontrada nenhuma conta com lançamento de procedimentos %scom vinculo ao documento para este atendimento, convênio, %sdata e hora.',
					 arg_list(chr(10), chr(10), chr(10))), true);
                End if;
           end if;
        END;
    END IF;
END;
END P_B_WVR_IT_PROTOCOLO_DOC;
PROCEDURE P_B_WVR_IT_PROTOCOLO_DOC (in_params in Clob, out_params out Clob) IS
    xml PKG_XML.XmlContext;
    pit_protocolo_doc IT_PROTOCOLO_DOCRec;
    formParams FormParamsRec;
    FSV_RECORD_STATUS VARCHAR2(4000);
BEGIN
        xml := PKG_XML.Init(in_params);
        -- extract input parameters from the XML
        pIT_PROTOCOLO_DOC.CD_CONVENIO:= PKG_XML.GetNUMBER(xml, 'IT_PROTOCOLO_DOC.CD_CONVENIO');
        pIT_PROTOCOLO_DOC.CD_DOCUMENTO_PROT:= PKG_XML.GetNUMBER(xml, 'IT_PROTOCOLO_DOC.CD_DOCUMENTO_PROT');
        pIT_PROTOCOLO_DOC.DT_REALIZACAO:= PKG_XML.GetDATE(xml, 'IT_PROTOCOLO_DOC.DT_REALIZACAO');
        pIT_PROTOCOLO_DOC.HR_REALIZACAO:= PKG_XML.GetDATE(xml, 'IT_PROTOCOLO_DOC.HR_REALIZACAO');
        pIT_PROTOCOLO_DOC.CD_ATENDIMENTO:= PKG_XML.GetNUMBER(xml, 'IT_PROTOCOLO_DOC.CD_ATENDIMENTO');
        pIT_PROTOCOLO_DOC.DSP_DT_ATENDIMENTO:= PKG_XML.GetDATE(xml, 'IT_PROTOCOLO_DOC.DSP_DT_ATENDIMENTO');
        pIT_PROTOCOLO_DOC.DSP_CD_CONTA:= PKG_XML.GetNUMBER(xml, 'IT_PROTOCOLO_DOC.DSP_CD_CONTA');
        pIT_PROTOCOLO_DOC.CD_REG_FAT:= PKG_XML.GetNUMBER(xml, 'IT_PROTOCOLO_DOC.CD_REG_FAT');
        pIT_PROTOCOLO_DOC.CD_REG_AMB:= PKG_XML.GetNUMBER(xml, 'IT_PROTOCOLO_DOC.CD_REG_AMB');
        pIT_PROTOCOLO_DOC.DSP_TP_ATENDIMENTO:= PKG_XML.GetVARCHAR2(xml, 'IT_PROTOCOLO_DOC.DSP_TP_ATENDIMENTO');
        pIT_PROTOCOLO_DOC.CD_LANCAMENTO_FAT:= PKG_XML.GetNUMBER(xml, 'IT_PROTOCOLO_DOC.CD_LANCAMENTO_FAT');
        pIT_PROTOCOLO_DOC.CD_LANCAMENTO_AMB:= PKG_XML.GetNUMBER(xml, 'IT_PROTOCOLO_DOC.CD_LANCAMENTO_AMB');
        formParams.P_CD_MULTI_EMPRESA:= PKG_XML.GetNUMBER(xml, 'PARAMETER.P_CD_MULTI_EMPRESA');
        FSV_RECORD_STATUS:= PKG_XML.GetVARCHAR2(xml, 'FSV_RECORD_STATUS');
        BEGIN
            IF Pkg_MOVDOC_M_PROT_ENVIO_C.P_B_WVR_IT_PROTOCOLO_DOC_E(xml) THEN
                P_B_WVR_IT_PROTOCOLO_DOC(xml, pIT_PROTOCOLO_DOC, formParams, FSV_RECORD_STATUS);
                Pkg_MOVDOC_M_PROT_ENVIO_C.P_B_WVR_IT_PROTOCOLO_DOC_S(xml);
            END IF;
        EXCEPTION
        WHEN OTHERS THEN
            PKG_XML.AddException(xml, SQLCODE, SQLERRM);
        END;
        -- save output parameters to the XML
        PKG_XML.SetNUMBER(xml, 'IT_PROTOCOLO_DOC.CD_CONVENIO', pIT_PROTOCOLO_DOC.CD_CONVENIO);
        PKG_XML.SetNUMBER(xml, 'IT_PROTOCOLO_DOC.CD_DOCUMENTO_PROT', pIT_PROTOCOLO_DOC.CD_DOCUMENTO_PROT);
        PKG_XML.SetDATE(xml, 'IT_PROTOCOLO_DOC.DT_REALIZACAO', pIT_PROTOCOLO_DOC.DT_REALIZACAO);
        PKG_XML.SetDATE(xml, 'IT_PROTOCOLO_DOC.HR_REALIZACAO', pIT_PROTOCOLO_DOC.HR_REALIZACAO);
        PKG_XML.SetNUMBER(xml, 'IT_PROTOCOLO_DOC.CD_ATENDIMENTO', pIT_PROTOCOLO_DOC.CD_ATENDIMENTO);
        PKG_XML.SetDATE(xml, 'IT_PROTOCOLO_DOC.DSP_DT_ATENDIMENTO', pIT_PROTOCOLO_DOC.DSP_DT_ATENDIMENTO);
        PKG_XML.SetNUMBER(xml, 'IT_PROTOCOLO_DOC.DSP_CD_CONTA', pIT_PROTOCOLO_DOC.DSP_CD_CONTA);
        PKG_XML.SetNUMBER(xml, 'IT_PROTOCOLO_DOC.CD_REG_FAT', pIT_PROTOCOLO_DOC.CD_REG_FAT);
        PKG_XML.SetNUMBER(xml, 'IT_PROTOCOLO_DOC.CD_REG_AMB', pIT_PROTOCOLO_DOC.CD_REG_AMB);
        PKG_XML.SetVARCHAR2(xml, 'IT_PROTOCOLO_DOC.DSP_TP_ATENDIMENTO', pIT_PROTOCOLO_DOC.DSP_TP_ATENDIMENTO);
        PKG_XML.SetNUMBER(xml, 'IT_PROTOCOLO_DOC.CD_LANCAMENTO_FAT', pIT_PROTOCOLO_DOC.CD_LANCAMENTO_FAT);
        PKG_XML.SetNUMBER(xml, 'IT_PROTOCOLO_DOC.CD_LANCAMENTO_AMB', pIT_PROTOCOLO_DOC.CD_LANCAMENTO_AMB);
        PKG_XML.SetNUMBER(xml, 'PARAMETER.P_CD_MULTI_EMPRESA', formParams.P_CD_MULTI_EMPRESA);
        PKG_XML.SetVARCHAR2(xml, 'FSV_RECORD_STATUS', FSV_RECORD_STATUS);
        out_params := PKG_XML.GetOutputClob(xml);
END;
    /*
    <DATA_CRIACAO>13/01/2011 17:42</DATA_CRIACAO>
    <CRIADO_POR>Ferramenta de Migração ATX</CRIADO_POR>
    <OBJETIVO>CG$CTRL_IMPORT.CD_DOCUMENTO_PROT.WHEN-VALIDATE-ITEM</OBJETIVO>
    <ALTERACOES></ALTERACOES>
    */
	PROCEDURE P_I_WVI_CI_CD_DOCUMENTO_PROT (xml IN OUT NOCOPY PKG_XML.XmlContext,pcg$ctrl_import IN OUT NOCOPY CG$CTRL_IMPORTRec) IS
BEGIN
Declare
Cursor C_Setor(vDocProt in number,vSetor in number) is
  SELECT DISTINCT prot.ds_documento_prot
  FROM dbamv.documento_set seto, dbamv.documento_prot prot, dbamv.fluxo_documento flu
 WHERE seto.cd_documento_prot = prot.cd_documento_prot
   AND flu.cd_documento = prot.cd_documento_prot
   AND nvl(prot.sn_remessa, 'N') <> 'S'
   AND flu.cd_setor_orig = vSetor AND prot.cd_documento_prot = vDocProt;
vDsSetor varchar2(60);
Begin
 If  pcg$ctrl_import.cd_documento_prot is not null Then
    Open C_Setor(pcg$ctrl_import.cd_documento_prot,pcg$ctrl_import.cd_setor);
     Fetch C_Setor into vDsSetor;
      If C_Setor%notfound Then
       Close C_Setor;
       --MULTI-IDIOMA: Utilização do pkg_rmi_traducao.extrair_msg para mensagens (MSG_5)
       --MULTI-IDIOMA: Utilização do pkg_rmi_traducao.extrair_msg para mensagens (MSG_21)
       PKG_XML_MGS.CHAMA_MENSAGEM(xml, pkg_rmi_traducao.extrair_pkg_msg('MSG_5', 'PKG_MOVDOC_M_PROT_ENVIO', 'Atenção:'),
	   pkg_rmi_traducao.extrair_pkg_msg('MSG_21', 'PKG_MOVDOC_M_PROT_ENVIO', 'Erro: Setor inválido.%sCausa: O setor informado não existe ou não é válido.%sAção: Informe um setor válido. ', arg_list(chr(10), chr(10))),true);
      Else
          pcg$ctrl_import.ds_documento_prot := vDsSetor;
      End If;
    Close C_Setor;
 End If;
End;
END P_I_WVI_CI_CD_DOCUMENTO_PROT;
PROCEDURE P_I_WVI_CI_CD_DOCUMENTO_PROT (in_params in Clob, out_params out Clob) IS
    xml PKG_XML.XmlContext;
    pcg$ctrl_import CG$CTRL_IMPORTRec;
BEGIN
        xml := PKG_XML.Init(in_params);
        -- extract input parameters from the XML
        pCG$CTRL_IMPORT.CD_DOCUMENTO_PROT:= PKG_XML.GetNUMBER(xml, 'CG$CTRL_IMPORT.CD_DOCUMENTO_PROT');
        pCG$CTRL_IMPORT.CD_SETOR:= PKG_XML.GetNUMBER(xml, 'CG$CTRL_IMPORT.CD_SETOR');
        pCG$CTRL_IMPORT.DS_DOCUMENTO_PROT:= PKG_XML.GetVARCHAR2(xml, 'CG$CTRL_IMPORT.DS_DOCUMENTO_PROT');
        BEGIN
            IF Pkg_MOVDOC_M_PROT_ENVIO_C.P_I_WVI_CI_CD_DOCUMENTO_PROT_E(xml) THEN
                P_I_WVI_CI_CD_DOCUMENTO_PROT(xml, pCG$CTRL_IMPORT);
                Pkg_MOVDOC_M_PROT_ENVIO_C.P_I_WVI_CI_CD_DOCUMENTO_PROT_S(xml);
            END IF;
        EXCEPTION
        WHEN OTHERS THEN
            PKG_XML.AddException(xml, SQLCODE, SQLERRM);
        END;
        -- save output parameters to the XML
        PKG_XML.SetNUMBER(xml, 'CG$CTRL_IMPORT.CD_DOCUMENTO_PROT', pCG$CTRL_IMPORT.CD_DOCUMENTO_PROT);
        PKG_XML.SetNUMBER(xml, 'CG$CTRL_IMPORT.CD_SETOR', pCG$CTRL_IMPORT.CD_SETOR);
        PKG_XML.SetVARCHAR2(xml, 'CG$CTRL_IMPORT.DS_DOCUMENTO_PROT', pCG$CTRL_IMPORT.DS_DOCUMENTO_PROT);
        out_params := PKG_XML.GetOutputClob(xml);
END;
END Pkg_MOVDOC_M_PROT_ENVIO;
/

