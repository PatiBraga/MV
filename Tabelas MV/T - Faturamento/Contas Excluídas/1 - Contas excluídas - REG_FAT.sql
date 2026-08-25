-- Validar Auditória - Contas excluídas - REG_FAT
SELECT
    a.cd_reg_fat AS "Código da Conta",
    a.cd_atendimento AS "Código do Atendimento",
    a.cd_convenio AS "Código do Convênio",

    CASE
        WHEN a.cd_remessa IS NULL THEN 'SEM REMESSA'
        ELSE TO_CHAR(a.cd_remessa)
    END AS "Código da Remessa",

    CASE
        WHEN a.vl_total_conta IS NULL THEN 'SEM VALOR'
        ELSE TO_CHAR(a.vl_total_conta, 'FM999G999G999G990D00')
    END AS "Valor da Conta",

    a.audit_dt_registro AS "Aud. Data Registro",
    a.audit_cd_usuario AS "Aud. Usuário",
    a.sn_fechada AS "Fechada",

    CASE
        WHEN a.audit_tp_acao = 'E' THEN 'Excluído'
        ELSE a.audit_tp_acao
    END AS "Tipo da Ação"

FROM audit_dbamv.reg_fat a
WHERE a.audit_tp_acao = 'E'
        AND a.audit_dt_registro >= DATE '2026-01-01'
        AND a.audit_dt_registro < DATE '2026-09-01'
        -- AND a.cd_reg_fat = 115813
ORDER BY a.audit_dt_registro;
