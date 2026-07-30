-- lista de tabelas dos docs eletronicos
select * from dbamv.editor_registro_campo WHERE cd_registro = 187
SELECT * FROM dbamv.editor_tipo_visualizacao
SELECT * FROM dbamv.editor_campo_prop_val
SELECT * FROM dbamv.editor_propriedade
SELECT * FROM dbamv.editor_grupo_documento
SELECT * FROM dbamv.editor_campo_valor  WHERE DS_IDENTIFICADOR = 'Metadado_2974'
SELECT * FROM dbamv.editor_campo WHERE DS_IDENTIFICADOR = 'Metadado_2974'
SELECT * FROM dbamv.editor_campo WHERE cd_metadado = 202 ORDER BY cd_campo
SELECT * FROM dbamv.editor_grupo_campo
SELECT * FROM dbamv.grupo_pergunta_doc
SELECT * FROM dbamv.pergunta_doc
SELECT * FROM dbamv.editor_grupo
SELECT * FROM dbamv.editor_documento WHERE CD_DOCUMENTO = 187
SELECT * FROM dbamv.editor_regra_campo_valor_filt
SELECT * FROM dbamv.editor_tipo_conector
SELECT * FROM dbamv.editor_regra_condicao
SELECT * FROM dbamv.editor_tipo_operacao
SELECT * FROM dbamv.editor_regra
SELECT * FROM dbamv.editor_tipo_regra
SELECT * FROM dbamv.editor_layout_campo
SELECT * FROM dbamv.editor_tipo_item
SELECT * FROM dbamv.editor_versao_documento
SELECT * FROM dbamv.editor_layout
SELECT * FROM dbamv.editor_regra
SELECT * FROM dbamv.editor_tipo_layout
SELECT * FROM dbamv.editor_registro
SELECT * FROM dbamv.editor_regra_campo
SELECT * FROM dbamv.editor_mapeamento_documento
SELECT * FROM dbamv.editor_mapeamento_registro
SELECT * FROM dbamv.editor_mapeamento_campo
SELECT * FROM pw_documento_clinico WHERE cd_atendimento = 7375370
SELECT * FROM pw_documento_clinico WHERE cd_paciente = 1544530
AND cd_objeto = 223
 --CD_DOCUMENTO_CLINICO = 3606319 --CD_DOCUMENTO_CLINICO = 187
SELECT * FROM pw_editor_clinico WHERE CD_DOCUMENTO_CLINICO = 3606319
SELECT * FROM dbamv.pagu_objeto WHERE CD_OBJETO = 5186
SELECT * FROM dbamv.pagu_objeto WHERE tp_objeto IN 'DOCELE'


------------------------------------------------------------------------------

Acho que esse é o passo:
PW_DOCUMENTO_CLINICO (dc)
Documento clínico do atendimento (dc.cd_atendimento, dc.cd_documento_clinico).

PW_EDITOR_CLINICO (ec)
Liga o documento ao editor:
ec.cd_documento_clinico = dc.cd_documento_clinico
e aponta o registro do editor: ec.cd_editor_registro.

EDITOR_REGISTRO (r)
Registro/instância do formulário:
r.cd_registro = ec.cd_editor_registro.

EDITOR_REGISTRO_CAMPO (rc)
Valores preenchidos dos campos do registro:
rc.cd_registro = r.cd_registro
Texto/valor fica aqui: rc.lo_valor (CLOB).

EDITOR_CAMPO (c)
Metadados do campo (qual é o campo):
c.cd_campo = rc.cd_campo
Você filtra pelo campo desejado via c.cd_campo ou c.ds_identificador.



----------------------------------------------------------------------------------