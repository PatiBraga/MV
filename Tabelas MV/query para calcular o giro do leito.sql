-- query para calcular o giro do leito
-- Oq vc vai ter que ficar atento para passar a informação correta:

1 - A taxa de ocupação vai ser calculada em cima da Capacidade Instalada ou Capacidade Operacional? (Sugiro fazer e mostrar as duas)
2 - Leitos Extras e Virtuais, os leitos Extras Ocupados vai entrar na Taxa?
3 - Verificar como identificar o tipo de Leito (UI, UTI, SEMI, etc), nem sempre o cadastro esta bonitinho, dai tem que fazer alguns armengues

A base da tua query vai ser essa:

SELECT S.ID_MULTI_EMPRESA,
                       EMP.DS_SIGLA,
                       EMP.DS_MULTI_EMPRESA,
                       UI.CD_UNID_INT,
                       UI.DS_UNID_INT,
                       L.CD_LEITO,
                       L.CD_LEITO,
                       L.DS_LEITO,
                       L.DS_RESUMO,
                       L.TP_LEITO,
                       CASE WHEN L.TP_SITUACAO = 'A' THEN 1 ELSE 0 END QT_LEITOS_ATIVOS,
                       CASE WHEN L.TP_SITUACAO = 'I' THEN 1 ELSE 0 END QT_LEITOS_INATIVOS,
                       CASE WHEN L.TP_OCUPACAO = 'V' THEN 1 ELSE 0 END QT_LEITOS_VAGOS,
                       CASE WHEN L.TP_OCUPACAO = 'R' THEN 1 ELSE 0 END QT_LEITOS_RESERVADOS,
                       CASE WHEN L.TP_OCUPACAO = 'I' THEN 1 ELSE 0 END QT_LEITOS_INFECTADOS,
                       CASE WHEN L.TP_OCUPACAO = 'M' THEN 1 ELSE 0 END QT_LEITOS_EM_MANUTENCAO,
                       CASE WHEN L.TP_OCUPACAO = 'E' THEN 1 ELSE 0 END QT_LEITOS_REFORMA,
                       CASE WHEN L.TP_OCUPACAO = 'T' THEN 1
                            WHEN L.TP_OCUPACAO = 'N' THEN 1 ELSE 0 END QT_LEITOS_TEMP_INTERDITADO,
                       CASE WHEN L.TP_OCUPACAO = 'A' THEN 1 ELSE 0 END QT_LEITOS_ACOMPANHANTES,
                       CASE WHEN L.TP_OCUPACAO = 'O' THEN 1 ELSE 0 END QT_LEITOS_OCUPADOS,
                       CASE WHEN L.TP_OCUPACAO = 'L' THEN 1 ELSE 0 END QT_LEITOS_EM_LIMPEZA
                FROM DBAMV.LEITO L
                JOIN DBAMV.UNID_INT UI ON L.CD_UNID_INT = UI.CD_UNID_INT
                JOIN DBAMV.SETOR S ON S.CD_SETOR = UI.CD_SETOR
                JOIN DBAMV.MULTI_EMPRESAS EMP ON S.CD_MULTI_EMPRESA = EMP.CD_MULTI_EMPRESA
                WHERE UI.SN_ATIVO = 'S'
                AND   L.TP_SITUACAO = 'A'
                AND   L.DS_LEITO IS NOT NULL