-- Validar AUDITORIA - Tabela REG_AMB

SELECT
    a.cd_reg_amb AS "Código da Conta Ambulatorial",
    a.cd_convenio AS "Código do Convênio",
    a.cd_remessa AS "Código da Remessa",
    a.vl_total_conta AS "Valor Total da Conta",
    a.dt_lancamento AS "Data de Lançamento",
    a.audit_dt_registro AS "Data do Registro de Auditoria",
    a.audit_cd_usuario AS "Usuário da Auditoria",
    a.audit_tp_acao AS "Tipo da Ação",
    a.sn_fechada AS "Conta Fechada"
FROM audit_dbamv.reg_amb a
WHERE a.audit_dt_registro >= DATE '2022-01-01'
  AND a.audit_dt_registro <  DATE '2022-09-01'
ORDER BY a.audit_dt_registro DESC;
