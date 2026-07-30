--Mudar o tipo da versão do Documento Eletrônico de Publicado para Edição

UPDATE EDITOR_VERSAO_DOCUMENTO
SET SN_FOI_PUBLICADO = 'N', CD_TIPO_VERSAO = 1
WHERE CD_DOCUMENTO = 576 --Código do Doucumento
AND VL_VERSAO = 9 --Versão atual do documento