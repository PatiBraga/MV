SELECT
    p.nm_paciente,
    dc.cd_atendimento,
    dc.cd_prestador,
    dc.cd_documento_clinico,
    dc.cd_tipo_documento,
    tc.ds_tipo_documento,
    td.nm_tabela,
    dc.cd_usuario,
    dc.tp_status,
    dc.dh_fechamento,
    dc.cd_documento_cancelado,
    dc.dh_documento,
    td.sn_ativo,
    dc.cd_setor,
    td.sn_pendencia_impeditiva_alta
FROM
    DBAMV.PW_DOCUMENTO_CLINICO dc
JOIN
    DBAMV.PW_TIPO_DOCUMENTO td ON dc.cd_tipo_documento = td.cd_tipo_documento
JOIN
    dbamv.paciente p ON p.cd_paciente = dc.cd_paciente
LEFT JOIN
    DBAMV.PW_TIPO_DOCUMENTO tc ON dc.cd_tipo_documento = tc.cd_tipo_documento  -- Corrigindo o relacionamento para o tipo de documento
WHERE
  --  dc.cd_paciente = '296852'  -- Filtro pelo código do paciente
 --   AND dc.tp_status = 'ABERTO'  -- Filtro pelo status do documento
 --   AND td.cd_tipo_documento = 19  -- Filtro pelo tipo de documento
   dc.cd_atendimento = '1107383'  -- Filtro opcional pelo código de atendimento
ORDER BY
    dc.dh_documento DESC;  -- Ordenação pela data do documento
/

-- UPDATE para realizar alteração nas tabelas.

UPDATE DBAMV.PW_DOCUMENTO_CLINICO
SET tp_status = 'FECHADO'
WHERE cd_atendimento = '1107383'
      AND cd_documento_clinico = '8031078'
      AND cd_prestador;