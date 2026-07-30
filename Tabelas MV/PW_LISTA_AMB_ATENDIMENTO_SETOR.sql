
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "DBAMV"."PW_LISTA_AMB_ATENDIMENTO_SETOR" ("Origem", "PAR_CD_ATENDIMENTO", "PAR_CD_PACIENTE", "PAR_NM_PACIENTE", "PAR_NM_FILTRO", "PAR_IDADE_PACIENTE", "Hora do Pedido", "Pedido", "Urgente", "Convênio", "Setor Solicitante", "Exame", "Status", "Guia") AS
  select
x.TIPO_ATENDIMENTO AS "Origem",
x.PAR_CD_ATENDIMENTO,
x.PAR_CD_PACIENTE,
x.PAR_NM_PACIENTE,
x.PAR_NM_FILTRO,
x.PAR_IDADE_PACIENTE,
x.HR_PEDIDO AS "Hora do Pedido",
x.CD_PED_RX AS "Pedido",
x.URGENTE,
--LISTAGG(substr(x.DS_EXA_RX,1,25)||CHR(10), '') WITHIN GROUP (ORDER BY x.DS_EXA_RX)EXAMES,
x.NM_CONVENIO AS "Convênio",
x.SETOR_SOLICITANTE AS "Setor Solicitante",
x.EXAME AS "Exame",
--x.PAR_STATUS,
X.STATUS AS "Status",
X.GUIA

from    (--SOMENTE SETORES QUE PRECISAM DA SALA E MEDICO EXECUTOR INFORMADO, PARA O PACS
select
        decode(c.tp_atendimento,'I','Internação','A','Ambulatório','E','Externo','U','Pronto Atendimento')tipo_atendimento,
        a.cd_atendimento PAR_CD_ATENDIMENTO,
        d.cd_paciente PAR_CD_PACIENTE,
        d.nm_paciente PAR_NM_PACIENTE,
       decode(c.tp_atendimento,'I','Internação','A','Ambulatório','E','Externo','U','Pronto Atendimento') PAR_NM_FILTRO,
        Decode(d.dt_nascimento, NULL, NULL, dbamv.fn_idade(d.dt_nascimento, 'a A m M', sysdate)) AS PAR_IDADE_PACIENTE,
        a.cd_ped_rx,
        decode(a.tp_motivo,'U','Sim',null)urgente,
        c.ds_exa_rx,
        e.nm_convenio,
        --to_char(a.hr_pedido,'HH:MM')hr_pedido,
        a.hr_pedido,
        f.nm_setor SETOR_SOLICITANTE,
        c.ds_exa_rx EXAME,
        dbamv.fnc_mv_retor_stat_list_pacien(c.tp_Atendimento,
                                            c.cd_Atendimento,
                                            Null,
                                            Null,
                                            Pkg_MVPEP_Area_Pessoal.Fn_Get_Cd_Prestador,
                                            null,
                                            null,
                                            c.cd_ori_ate,
                                            'O')Par_Status,
        NVL((SELECT distinct(to_char(REGEXP_REPLACE(p.lo_conteudo, '[^A-Za-z ]', '')))
                     FROM dbamv.PW_DOCUMENTO_CLINICO m, dbamv.PW_EDITOR_CLINICO n, editor.EDITOR_REGISTRO o, editor.EDITOR_REGISTRO_CAMPO p, editor.EDITOR_CAMPO q
                     where n.cd_documento_clinico = m.cd_documento_clinico
                     AND n.cd_editor_registro = o.cd_registro
                     and p.cd_registro = o.cd_registro
                     AND p.cd_campo = editor.q.cd_campo
                     and n.cd_documento = 61
                     and q.ds_identificador IN ('STATUS')
                     and (tp_status = 'ASSINADO' or tp_status = 'FECHADO')
                     and m.cd_atendimento = a.cd_atendimento
                     and m.CD_DOCUMENTO_CLINICO = (select max(m.CD_DOCUMENTO_CLINICO)
                                         FROM dbamv.PW_DOCUMENTO_CLINICO m, dbamv.PW_EDITOR_CLINICO n, editor.EDITOR_REGISTRO o, editor.EDITOR_REGISTRO_CAMPO p, editor.EDITOR_CAMPO q
                                         where n.cd_documento_clinico = m.cd_documento_clinico
                                         AND n.cd_editor_registro = o.cd_registro
                                         and p.cd_registro = o.cd_registro
                                         AND p.cd_campo = editor.q.cd_campo
                                         and n.cd_documento = 61
                                         and q.ds_identificador IN ('EXAME')
                                         and (tp_status = 'ASSINADO' or tp_status = 'FECHADO')
                                         and m.cd_atendimento = a.cd_atendimento
                                         and to_number(REGEXP_SUBSTR(p.lo_conteudo, '^[0-9]+')) = b.cd_itped_rx)),'Recepção')status,
                    nvl((select decode(x.tp_situacao,'P','Pendente','S','Solicitada','A','Autorizada','N','Negada','G','Negociação')
                    from guia x
                    where x.cd_guia = b.cd_guia),'Sem Guia')guia
        from PED_RX a, ITPED_RX b, EXA_RX c, ATENDIME c, PACIENTE d, CONVENIO e, SETOR f, SET_EXA g
        where a.cd_ped_rx = b.cd_ped_rx
        and b.cd_exa_rx = c.cd_exa_rx
        and a.cd_atendimento = c.cd_atendimento
        and c.cd_paciente = d.cd_paciente
        and c.cd_convenio = e.cd_convenio
        and a.cd_setor = f.cd_setor
        and a.cd_set_exa = g.cd_set_exa
        --and c.cd_ori_ate = 53 -- INC IMAGEM - BARIGUI
        and a.cd_setor = 184 -- INC IMAGEM - BARIGUI
        and trunc(a.dt_pedido) = trunc(sysdate)
        and g.cd_set_exa in (37,38,39,40,42) -- setores do inc imagem barigui
        and b.cd_exa_rx not in (1050,1051,896,1110) --ecg, ecodoppler e anestesia
        and b.cd_prestador is not null -- exibir somente com prestador informado no exame
        and b.cd_recurso is not null -- exibir somente com sala informada no exame
        --and (((select x.tp_situacao from guia x where x.cd_guia = b.cd_guia) in ('A','G')) or (b.cd_guia is null))
        --and a.cd_atendimento = 1046761
        and (((SELECT distinct(to_number(REGEXP_REPLACE(p.lo_conteudo, '[^0-9]', '')))
            FROM dbamv.PW_DOCUMENTO_CLINICO m, dbamv.PW_EDITOR_CLINICO n, editor.EDITOR_REGISTRO o, editor.EDITOR_REGISTRO_CAMPO p, editor.EDITOR_CAMPO q
            where n.cd_documento_clinico = m.cd_documento_clinico
             AND n.cd_editor_registro = o.cd_registro
             and p.cd_registro = o.cd_registro
             AND p.cd_campo = editor.q.cd_campo
             and n.cd_documento = 61
              and q.ds_identificador IN ('STATUS')
             and (tp_status = 'ASSINADO' or tp_status = 'FECHADO')
             and m.cd_atendimento = a.cd_atendimento
             and m.CD_DOCUMENTO_CLINICO = (select max(m.CD_DOCUMENTO_CLINICO)
                                         FROM dbamv.PW_DOCUMENTO_CLINICO m, dbamv.PW_EDITOR_CLINICO n, editor.EDITOR_REGISTRO o, editor.EDITOR_REGISTRO_CAMPO p, editor.EDITOR_CAMPO q
                                         where n.cd_documento_clinico = m.cd_documento_clinico
                                         AND n.cd_editor_registro = o.cd_registro
                                         and p.cd_registro = o.cd_registro
                                         AND p.cd_campo = editor.q.cd_campo
                                         and n.cd_documento = 61
                                         and q.ds_identificador IN ('EXAME')
                                         and (tp_status = 'ASSINADO' or tp_status = 'FECHADO')
                                         and m.cd_atendimento = a.cd_atendimento
                                         and to_number(REGEXP_SUBSTR(p.lo_conteudo, '^[0-9]+')) = b.cd_itped_rx)) <> 63)
            or ((SELECT distinct(to_number(REGEXP_REPLACE(p.lo_conteudo, '[^0-9]', '')))
            FROM dbamv.PW_DOCUMENTO_CLINICO m, dbamv.PW_EDITOR_CLINICO n, editor.EDITOR_REGISTRO o, editor.EDITOR_REGISTRO_CAMPO p, editor.EDITOR_CAMPO q
            where n.cd_documento_clinico = m.cd_documento_clinico
             AND n.cd_editor_registro = o.cd_registro
             and p.cd_registro = o.cd_registro
             AND p.cd_campo = editor.q.cd_campo
             and n.cd_documento = 61
              and q.ds_identificador IN ('STATUS')
             and (tp_status = 'ASSINADO' or tp_status = 'FECHADO')
             and m.cd_atendimento = a.cd_atendimento
             and m.CD_DOCUMENTO_CLINICO = (select max(m.CD_DOCUMENTO_CLINICO)
                                         FROM dbamv.PW_DOCUMENTO_CLINICO m, dbamv.PW_EDITOR_CLINICO n, editor.EDITOR_REGISTRO o, editor.EDITOR_REGISTRO_CAMPO p, editor.EDITOR_CAMPO q
                                         where n.cd_documento_clinico = m.cd_documento_clinico
                                         AND n.cd_editor_registro = o.cd_registro
                                         and p.cd_registro = o.cd_registro
                                         AND p.cd_campo = editor.q.cd_campo
                                         and n.cd_documento = 61
                                         and q.ds_identificador IN ('EXAME')
                                         and (tp_status = 'ASSINADO' or tp_status = 'FECHADO')
                                         and m.cd_atendimento = a.cd_atendimento
                                         and to_number(REGEXP_SUBSTR(p.lo_conteudo, '^[0-9]+')) = b.cd_itped_rx)) is null))
UNION ALL

--SOMENTE SETORES QUE >> NÃO << PRECISAM DA SALA E MEDICO EXECUTOR INFORMADO
select
        decode(c.tp_atendimento,'I','Internação','A','Ambulatório','E','Externo','U','Pronto Atendimento')tipo_atendimento,
        a.cd_atendimento PAR_CD_ATENDIMENTO,
        d.cd_paciente PAR_CD_PACIENTE,
        d.nm_paciente PAR_NM_PACIENTE,
       decode(c.tp_atendimento,'I','Internação','A','Ambulatório','E','Externo','U','Pronto Atendimento') PAR_NM_FILTRO,
        Decode(d.dt_nascimento, NULL, NULL, dbamv.fn_idade(d.dt_nascimento, 'a A m M', sysdate)) AS PAR_IDADE_PACIENTE,
        a.cd_ped_rx,
        decode(a.tp_motivo,'U','Sim',null)urgente,
        c.ds_exa_rx,
        e.nm_convenio,
        --to_char(a.hr_pedido,'HH:MM')hr_pedido,
        a.hr_pedido,
        f.nm_setor SETOR_SOLICITANTE,
        c.ds_exa_rx EXAME,
        dbamv.fnc_mv_retor_stat_list_pacien(c.tp_Atendimento,
                                            c.cd_Atendimento,
                                            Null,
                                            Null,
                                            Pkg_MVPEP_Area_Pessoal.Fn_Get_Cd_Prestador,
                                            null,
                                            null,
                                            c.cd_ori_ate,
                                            'O')Par_Status,
        NVL((SELECT distinct(to_char(REGEXP_REPLACE(p.lo_conteudo, '[^A-Za-z ]', '')))
                     FROM dbamv.PW_DOCUMENTO_CLINICO m, dbamv.PW_EDITOR_CLINICO n, editor.EDITOR_REGISTRO o, editor.EDITOR_REGISTRO_CAMPO p, editor.EDITOR_CAMPO q
                     where n.cd_documento_clinico = m.cd_documento_clinico
                     AND n.cd_editor_registro = o.cd_registro
                     and p.cd_registro = o.cd_registro
                     AND p.cd_campo = editor.q.cd_campo
                     and n.cd_documento = 61
                     and q.ds_identificador IN ('STATUS')
                     and (tp_status = 'ASSINADO' or tp_status = 'FECHADO')
                     and m.cd_atendimento = a.cd_atendimento
                     and m.CD_DOCUMENTO_CLINICO = (select max(m.CD_DOCUMENTO_CLINICO)
                                         FROM dbamv.PW_DOCUMENTO_CLINICO m, dbamv.PW_EDITOR_CLINICO n, editor.EDITOR_REGISTRO o, editor.EDITOR_REGISTRO_CAMPO p, editor.EDITOR_CAMPO q
                                         where n.cd_documento_clinico = m.cd_documento_clinico
                                         AND n.cd_editor_registro = o.cd_registro
                                         and p.cd_registro = o.cd_registro
                                         AND p.cd_campo = editor.q.cd_campo
                                         and n.cd_documento = 61
                                         and q.ds_identificador IN ('EXAME')
                                         and (tp_status = 'ASSINADO' or tp_status = 'FECHADO')
                                         and m.cd_atendimento = a.cd_atendimento
                                         and to_number(REGEXP_SUBSTR(p.lo_conteudo, '^[0-9]+')) = b.cd_itped_rx)),'Recepção')status,
                    nvl((select decode(x.tp_situacao,'P','Pendente','S','Solicitada','A','Autorizada','N','Negada','G','Negociação')
                    from guia x
                    where x.cd_guia = b.cd_guia),'Sem Guia')guia
        from PED_RX a, ITPED_RX b, EXA_RX c, ATENDIME c, PACIENTE d, CONVENIO e, SETOR f, SET_EXA g
        where a.cd_ped_rx = b.cd_ped_rx
        and b.cd_exa_rx = c.cd_exa_rx
        and a.cd_atendimento = c.cd_atendimento
        and c.cd_paciente = d.cd_paciente
        and c.cd_convenio = e.cd_convenio
        and a.cd_setor = f.cd_setor
        and a.cd_set_exa = g.cd_set_exa
        --and c.cd_ori_ate = 53 -- INC IMAGEM - BARIGUI
        and a.cd_setor = 184 -- INC IMAGEM - BARIGUI
        and b.cd_exa_rx not in (1050,1051,896,1110) --ecg, ecodoppler e anestesia
        and trunc(a.dt_pedido) = trunc(sysdate)
        and g.cd_set_exa in (41,43) -- setores do inc imagem barigui
        --and (((select x.tp_situacao from guia x where x.cd_guia = b.cd_guia) in ('A','G')) or (b.cd_guia is null))
        --and a.cd_atendimento = 1046761
        and (((SELECT distinct(to_number(REGEXP_REPLACE(p.lo_conteudo, '[^0-9]', '')))
            FROM dbamv.PW_DOCUMENTO_CLINICO m, dbamv.PW_EDITOR_CLINICO n, editor.EDITOR_REGISTRO o, editor.EDITOR_REGISTRO_CAMPO p, editor.EDITOR_CAMPO q
            where n.cd_documento_clinico = m.cd_documento_clinico
             AND n.cd_editor_registro = o.cd_registro
             and p.cd_registro = o.cd_registro
             AND p.cd_campo = editor.q.cd_campo
             and n.cd_documento = 61
              and q.ds_identificador IN ('STATUS')
             and (tp_status = 'ASSINADO' or tp_status = 'FECHADO')
             and m.cd_atendimento = a.cd_atendimento
             and m.CD_DOCUMENTO_CLINICO = (select max(m.CD_DOCUMENTO_CLINICO)
                                         FROM dbamv.PW_DOCUMENTO_CLINICO m, dbamv.PW_EDITOR_CLINICO n, editor.EDITOR_REGISTRO o, editor.EDITOR_REGISTRO_CAMPO p, editor.EDITOR_CAMPO q
                                         where n.cd_documento_clinico = m.cd_documento_clinico
                                         AND n.cd_editor_registro = o.cd_registro
                                         and p.cd_registro = o.cd_registro
                                         AND p.cd_campo = editor.q.cd_campo
                                         and n.cd_documento = 61
                                         and q.ds_identificador IN ('EXAME')
                                         and (tp_status = 'ASSINADO' or tp_status = 'FECHADO')
                                         and m.cd_atendimento = a.cd_atendimento
                                         and to_number(REGEXP_SUBSTR(p.lo_conteudo, '^[0-9]+')) = b.cd_itped_rx)) <> 63)
            or ((SELECT distinct(to_number(REGEXP_REPLACE(p.lo_conteudo, '[^0-9]', '')))
            FROM dbamv.PW_DOCUMENTO_CLINICO m, dbamv.PW_EDITOR_CLINICO n, editor.EDITOR_REGISTRO o, editor.EDITOR_REGISTRO_CAMPO p, editor.EDITOR_CAMPO q
            where n.cd_documento_clinico = m.cd_documento_clinico
             AND n.cd_editor_registro = o.cd_registro
             and p.cd_registro = o.cd_registro
             AND p.cd_campo = editor.q.cd_campo
             and n.cd_documento = 61
              and q.ds_identificador IN ('STATUS')
             and (tp_status = 'ASSINADO' or tp_status = 'FECHADO')
             and m.cd_atendimento = a.cd_atendimento
             and m.CD_DOCUMENTO_CLINICO = (select max(m.CD_DOCUMENTO_CLINICO)
                                         FROM dbamv.PW_DOCUMENTO_CLINICO m, dbamv.PW_EDITOR_CLINICO n, editor.EDITOR_REGISTRO o, editor.EDITOR_REGISTRO_CAMPO p, editor.EDITOR_CAMPO q
                                         where n.cd_documento_clinico = m.cd_documento_clinico
                                         AND n.cd_editor_registro = o.cd_registro
                                         and p.cd_registro = o.cd_registro
                                         AND p.cd_campo = editor.q.cd_campo
                                         and n.cd_documento = 61
                                         and q.ds_identificador IN ('EXAME')
                                         and (tp_status = 'ASSINADO' or tp_status = 'FECHADO')
                                         and m.cd_atendimento = a.cd_atendimento
                                         and to_number(REGEXP_SUBSTR(p.lo_conteudo, '^[0-9]+')) = b.cd_itped_rx)) is null))
        )x
group by
x.TIPO_ATENDIMENTO,
x.PAR_CD_ATENDIMENTO,
x.PAR_CD_PACIENTE,
x.PAR_NM_PACIENTE,
x.PAR_NM_FILTRO,
x.PAR_IDADE_PACIENTE,
x.CD_PED_RX,
x.URGENTE,
x.NM_CONVENIO,
x.HR_PEDIDO,
x.SETOR_SOLICITANTE,
x.EXAME,
--x.PAR_STATUS,
x.STATUS,
X.GUIA

order by x.URGENTE desc, x.HR_PEDIDO asc;