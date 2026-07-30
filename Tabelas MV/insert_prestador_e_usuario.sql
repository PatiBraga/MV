-- Para fins de teste, executar o código do prestador a ser inserido por último.
-- Deve-se sempre incrementar em 1 unidade o valor a ser carregado.

SELECT MAX(CD_PRESTADOR) FROM PRESTADOR
SELECT MAX(CD_PRES_CON) FROM PRES_CON

SELECT * FROM DBASGU.USUARIOS WHERE CD_USUARIO = '' -- consulta usuário criado.

-- Passo1: Inserir os dados na Abas Prestador e Complemento da Tela Prestadores

INSERT INTO DBAMV.PRESTADOR
        (
            CD_PRESTADOR,     --   1
            CD_BANCO,     --   2
            CD_CONSELHO,     --   3
            CD_TIP_PRESTA,     --   4
            NR_CPF_CGC,     --   5
            TP_SITUACAO,     --   6
            NM_PRESTADOR,     --   7
            NM_MNEMONICO,     --   8
            TP_CORPO_CLINICO,     --   9
            CD_PRESTADOR_MUITOS,     --   10
            DS_EMAIL,     --   11
            DS_ENDERECO,     --   12
            DS_CODIGO_CONSELHO,     --   13
            DS_FACULDADE,     --   14
            DT_CADASTRO,     --   15
            DT_NASCIMENTO,     --   16
            NR_FONE_COMERCIAL,     --   17
            NR_FONE_CONTATO,     --   18
            NR_CEP,     --   19
            NR_AGENCIA,     --   20
            NM_AGENCIA,     --   21
            NR_CONTA,     --   22
            CD_CIDADE,     --   23
            SN_REPASSE_FATURA_AMB_SUS,     --   24
            SN_ANESTESISTA,     --   25
            SN_AUXILIAR,     --   26
            SN_CIRURGIAO,     --   27
            SN_OUTROS,     --   28
            CD_REG_REPASSE,     --   29
            CD_PRESTADOR_REPASSE,     --   30
            DS_OBS,     --   31
            TP_VINCULO,     --   32
            DS_BAIRRO,     --   33
            NR_INSS,     --   34
            NR_CCM,     --   35
            CD_REG_REPASSE_SIA,     --   36
            DS_COMPLEMENTO,     --   37
            NR_DOCUMENTO,     --   38
            DS_ENDERECO_COMERCIAL,     --   39
            DS_BAIRRO_COMERCIAL,     --   40
            CD_CIDADE_COMERCIAL,     --   41
            DS_COMPLEMENTO_COMERCIAL,     --   42
            DS_CEP_COMERCIAL,     --   43
            FOTO,     --   44
            SN_ATUANTE,     --   45
            TP_DOCUMENTACAO,     --   46
            DS_ATRIBUTO1,     --   47
            SN_ALT_DADOS_ORA_APP,     --   48
            NR_PISPASEP,     --   49
            INSCR_AUTONOMO,     --   50
            NM_MAE,     --   51
            NM_PAI,     --   52
            CD_FORNECEDOR,     --   53
            CD_MULTI_EMPRESA,     --   54
            CD_INDICE,     --   55
            DS_SENHA_PRE_INTERNACAO,     --   56
            SN_ADMINISTRADOR_PRESTADOR,     --   57
            DS_CARGO,     --   58
            CD_PRESTADOR_INTEGRA,     --   59
            DT_INTEGRA,     --   60
            CD_SEQ_INTEGRA,     --   61
            DT_INATIVACAO,     --   62
            CD_IDENTIFICACAO,     --   63
            NR_CNS,     --   64
            DT_CAD_COOPERATIVA,     --   65
            NR_MATRICULA_COOPERATIVA,     --   66
            CD_REG_REPASSE_SIH,     --   67
            TP_CAT_PRE_SUS,     --   68
            NR_CAT_PRE_SUS,     --   69
            SN_CESSAO_CREDITO,     --   70
            SN_AUDITOR_SUS,     --   71
            DT_INICIO_ATUACAO,     --   72
            CD_SETOR,     --   73
            TP_PRESTADOR,     --   74
            CD_TIPO_LOGRADOURO,     --   75
            NR_ENDERECO,     --   76
            CD_TIPO_LOGRADOURO_COMERCIAL,     --   77
            NR_ENDERECO_COMERCIAL,     --   78
            NR_CNES,     --   79
            CD_CBOS,     --   80
            TP_ACESSO_DIAGNOSTICO,     --   81
            DS_ORIENTACAO_AGENDAMENTO,     --   82
            SN_MOSTRA_ENDERECO,     --   83
            SN_MOSTRA_ENDERECO_COM,     --   84
            TP_REMESSA,     --   85
            DS_SIGLA_AGENDAMENTO,     --   86
            DV_AGENCIA,     --   87
            DV_CONTA_CORRENTE,     --   88
            NR_PONTUACAO_OCORRENCIA,     --   89
            CD_SITUACAO_FAMILIAR,     --   90
            TP_SEXO,     --   91
            TP_COR,     --   92
            TP_CERTIDAO,     --   93
            DS_OM_IDENTIDADE,     --   94
            CD_CIDADANIA,     --   95
            CD_GRAU_INS,     --   96
            DT_CADASTRO_MANUAL,     --   97
            CD_NATURALIDADE,     --   98
            DT_FINAL_CONTRATO,     --   99
            CD_UF_ORGAO_EMISSOR,     --   100
            DT_EXPEDICAO_ORGAO_EMISSOR,     --   101
            DT_INICIO_CONTRATO,     --   102
            CD_IDENTIFICADOR_PESSOA,     --   103
            CD_ENDERECO_POSTA,     --   104
            CD_ENDERECO_POSTA_COM,     --   105
            CD_INSTITUICAO_EXTERNA,     --   106
            CD_ATIVIDADE_PRINCIPAL,     --   107
            CD_AREA_ATUACAO,     --   108
            CD_CLUE_CONTRATO_NOMINA,     --   109
            CD_CLUE_CONTRATO_REAL,     --   110
            CD_JORNADA,     --   111
            SN_RESIDENCIA_MEDICA,     --   112
            CD_ANO_RESIDENCIA,     --   113
            CD_ESPECIALID_RESIDENTE,     --   114
            TIPO_MODALIDADE_CONTRATO,     --   115
            SN_FIEL,     --   116
            SN_VIGENCIA_FIEL,     --   117
            VL_SALARIO,     --   118
            TP_CONTRATO_EXTERNO,     --   119
            CD_ESTADO_FORMACAO,     --   120
            DS_ORIENTACAO_AGENDAMENTO_WEB     --   121
        )
        VALUES
        (
            35623,     --   1
            '',     --   2
            '1',     --   3
            '8',     --   4
            'inserir o CPF aqui',     --   5
            'A',     --   6
            'nome completo',     --   7
            'guerra',     --   8
            'S',     --   9
            '',     --   10
            '',     --   11
            '',     --   12
            '1234567892',     --   13
            '',     --   14
            '',     --   15
            TO_TIMESTAMP('1980-04-18 10:00:00', 'YYYY-MM-DD HH24:MI:SS'),     --   16
            '',     --   17
            '',     --   18
            '',     --   19
            '',     --   20
            '',     --   21
            '',     --   22
            '3281',     --   23
            'S',     --   24
            'N',     --   25
            'N',     --   26
            'N',     --   27
            'N',     --   28
            '',     --   29
            '',     --   30
            '',     --   31
            'F',     --   32
            '',     --   33
            '',     --   34
            '',     --   35
            '',     --   36
            '',     --   37
            '',     --   38
            '',     --   39
            '',     --   40
            '',     --   41
            '',     --   42
            '',     --   43
            '',     --   44
            'S',     --   45
            'P',     --   46
            '',     --   47
            'S',     --   48
            '',     --   49
            '',     --   50
            '',     --   51
            '',     --   52
            '',     --   53
            '1',     --   54
            '',     --   55
            '',     --   56
            '',     --   57
            '',     --   58
            '',     --   59
            '',     --   60
            '',     --   61
            '',     --   62
            '',     --   63
            '',     --   64
            '',     --   65
            '',     --   66
            '',     --   67
            '',     --   68
            '',     --   69
            'N',     --   70
            'N',     --   71
            '',     --   72
            '',     --   73
            'O',     --   74
            '',     --   75
            '',     --   76
            '',     --   77
            '',     --   78
            '',     --   79
            '',     --   80
            '',     --   81
            '',     --   82
            'N',     --   83
            'N',     --   84
            'P',     --   85
            '',     --   86
            '',     --   87
            '',     --   88
            '',     --   89
            '',     --   90
            'M',     --   91
            '',     --   92
            '',     --   93
            '',     --   94
            '',     --   95
            '',     --   96
            '',     --   97
            '',     --   98
            '',     --   99
            '',     --   100
            '',     --   101
            '',     --   102
            '',     --   103
            '',     --   104
            '',     --   105
            '',     --   106
            '',     --   107
            '',     --   108
            '',     --   109
            '',     --   110
            '',     --   111
            '',     --   112
            '',     --   113
            '',     --   114
            '',     --   115
            '',     --   116
            '',     --   117
            '',     --   118
            '',     --   119
            '',     --   120
            ''     --   121
        );
        
-- Passo 2: Insere os dados da Aba Espcialidade da Tela Prestadores.

    INSERT INTO DBAMV.ESP_MED 
    (
        CD_ESPECIALID, -- 1
        CD_PRESTADOR, -- 2
        SN_ESPECIAL_PRINCIPAL, -- 3
        CD_ESP_MED_INTEGRA, -- 4
        DT_INTEGRA, -- 5
        CD_SEQ_INTEGRA, -- 6
        NR_CARGA_HORARIA -- 7
    )
    VALUES
    (
        68, -- 1
        35623, -- 2 
        'S', -- 3
        '', -- 4
        '', -- 5
        '', -- 6
        '' -- 7
    );

-- Passo 3: Insere os dados da Aba Credenciamento da Tela Prestadores.

INSERT INTO DBAMV.PRES_CON
(
    CD_PRESTADOR_CONVENIADO,
    CD_PRES_CON,
    CD_CONVENIO,
    CD_PRESTADOR,
    CD_REG_REPASSE,
    SN_PAGA_PELO_CONVENIO,
    CD_UNIDADE_ORIGEM,
    CD_MULTI_EMPRESA,
    CD_CON_PLA,
    CD_REGRA,
    CD_GRU_PRO,
    CD_PRO_FAT
)
VALUES
(
    1,
    27597,
    1,
    35623,
    NULL,
    'S',
    NULL,
    1,
    NULL,
    NULL,
    NULL,
    NULL
);


INSERT INTO DBAMV.PRES_CON
(
    CD_PRESTADOR_CONVENIADO,
    CD_PRES_CON,
    CD_CONVENIO,
    CD_PRESTADOR,
    CD_REG_REPASSE,
    SN_PAGA_PELO_CONVENIO,
    CD_UNIDADE_ORIGEM,
    CD_MULTI_EMPRESA,
    CD_CON_PLA,
    CD_REGRA,
    CD_GRU_PRO,
    CD_PRO_FAT
)
VALUES
(
    2,
    27598,
    2,
    35623,
    NULL,
    'S',
    NULL,
    1,
    NULL,
    NULL,
    NULL,
    NULL
);


-- Passo 4: Criar o usuário.

INSERT INTO
    DBASGU.USUARIOS (
        CD_USUARIO, -- 1
        NM_USUARIO, -- 2
        DS_OBSERVACAO, -- 3
        RAMAL, -- 4
        TP_PRIVILEGIO, -- 5
        NR_ID_USUARIO, -- 6
        CD_SENHA, -- 7
        CD_PAPEL, -- 8
        TP_STATUS, -- 9
        CD_PRESTADOR, -- 10
        USER_ID_ORA_APP, -- 11
        SN_ATIVO, -- 12
        SN_SENHA_PLOGIN, -- 13
        SN_ABRE_FECHA_CONTA, -- 14 
        CPF, -- 15
        SN_RECEBE_MSG_EXPIRA_CHAVE, -- 16
        SN_ALTERA_AUDITORIA_IN_LOCO, -- 17
        SN_CADASTRA_PACIENTE, -- 18
        SN_ALTERA_CADASTRO_PACIENTE, -- 19  
        DT_NASCIMENTO, -- 20
        CD_MATRICULA, -- 21
        DS_EMAIL, -- 22
        CD_IDIOMA, -- 23
        SN_CERTIFICADO_DIGITAL, -- 24
        DS_BAIRRO, -- 25
        DS_CIDADE, -- 26
        DS_ESTADO, -- 27
        DS_PAIS, -- 28 
        NR_CEP, -- 29
        DS_ENDERECO, -- 30
        NR_ENDERECO, -- 31
        DS_COMPLEMENTO, -- 32
        SN_AUDITOR_TABELA, -- 33
        SN_PERMITE_DESVINCULO_PACOTE, -- 34 
        SN_CRIA_USUARIO, -- 35
        SN_ALTERA_PACIENTE_SEM_CPF, -- 36 
        NR_DDI, -- 37
        NR_DDD, -- 38
        NR_CELULAR, -- 39
        DH_GRAVACAO_USUARIO, -- 40
        CD_USUARIO_GRAVACAO, -- 41
        DH_ALTERACAO_USUARIO, -- 42
        CD_USUARIO_ALTERACAO, -- 43
        NR_TENTATIVA_LOGIN, -- 44
        SN_ALTERA_OBSERVACAO_GUIA, -- 45
        CD_SENHA_INTEGRA, -- 46
        CD_CBO, -- 47
        NR_MATRICULA, -- 48
        CD_CRACHA, -- 49
        CD_IDENTIFICADOR_PESSOA, -- 50
        CD_PROFISSAO -- 51
    )
VALUES
    (
        'nome de usuário', --1
        'nome completo', --2
        'TESTE DO PROCESSO DE AUTOMACAO DO CADASTRO DE USUARIO.', --3
        NULL, --4
        'U', --5
        NULL, --6
        'igual a nome de usuário', --7 (senha padr�o: 1..8 = XXL[^ZeffZilhsjlnprtvxz|~����� 1..9 XXL[^ZeBEHKNQTWlnprtvxz|~�����
        152, --8
        'R', --9
        35623, --10
        NULL, --11
        'S', --12
        'S', --13
        'N', --14
        'CPF',  --15 -- CPF Likely needs to be treated as a string '0'
        'N', --16
        'N', --17
        'S', --18
        'N', --19
        TO_DATE('1980-04-18', 'YYYY-MM-DD'),  --20 -- Correct Date Format
        0, --21
        0, --22
        'pt-br', --23 
        'N', --24
        NULL, --25
        NULL, --26
        NULL, --27
        NULL, --28
        NULL, --29
        NULL, --30
        NULL, --31
        NULL, --32
        'N', --33
        'N', --34
        'N', --35
        'N', --36
        NULL, --37
        NULL, --38
        NULL, --39
        TO_TIMESTAMP('2024-04-18 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),  --40 -- Timestamp
        'DBAMV', --41
        TO_TIMESTAMP('2024-04-18 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),  --42 -- Timestamp
        'ACESSOPRD', -- 43
        NULL, --44
        'N', --45
        NULL, --46
        142510, --47
        NULL, --48
        NULL, --49
        NULL, --50
        736 --51
    );

-- Passo 5: Insere o Papel do Usuário.

INSERT 
    INTO DBASGU.PAPEL_USUARIOS 
         (
         CD_USUARIO, 
         CD_PAPEL,
         TP_PAPEL,
         SN_USUARIO_MASTER
         ) 
    VALUES 
         (
         'ARTHURLB',
         192,
         'A',
         'N'
         );

-- Passo 6: Associar a empresa.

INSERT 
    INTO DBAMV.USUARIO_MULTI_EMPRESA 
         (
             CD_MULTI_EMPRESA, 
             CD_ID_USUARIO
         ) 
    VALUES 
         (
             1,
             'ARTHURLB'
         );
