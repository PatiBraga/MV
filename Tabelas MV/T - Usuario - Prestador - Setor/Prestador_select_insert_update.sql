-- Select por unidade de internação
-- coluna cd_unid_int e cd_setor
SELECT * FROM unid_int;


-- Select por setor
-- coluna cd_setor
SELECT * FROM setor
ORDER BY cd_setor ASC;


-- Query 1
-- Verificar setores que faltam em um determinado prestador
-- Mostra no Resultado os que já possuem e precisam incluir

WITH SetoresNecessarios AS ( 
    SELECT 136 AS CD_SETOR FROM DUAL UNION ALL
    -- SELECT 139 FROM DUAL UNION ALL
    -- SELECT 161 FROM DUAL UNION ALL
    SELECT 137 FROM DUAL
),
FiltroSetores AS (
    -- Se quiser filtrar apenas por um setor específico, descomente a linha abaixo:
    -- SELECT 161 AS CD_SETOR FROM DUAL
    SELECT * FROM SetoresNecessarios
),
PrestadorComSetores AS (
    SELECT 
        usu.CD_USUARIO,
        usu.NM_USUARIO,
        int.CD_SETOR
    FROM PRESTADOR prest
    INNER JOIN USUARIOS usu
        ON prest.CD_PRESTADOR = usu.CD_PRESTADOR
    INNER JOIN USUARIO_UNID_INT int
        ON int.CD_ID_USUARIO = usu.CD_USUARIO
    WHERE prest.CD_TIP_PRESTA = '32' AND prest.TP_SITUACAO = 'A'
),
TodosUsuarios AS (
    SELECT DISTINCT CD_USUARIO, NM_USUARIO FROM PrestadorComSetores
),
Possibilidades AS (
    SELECT 
        m.CD_USUARIO,
        m.NM_USUARIO,
        s.CD_SETOR
    FROM TodosUsuarios m
    CROSS JOIN FiltroSetores s
),
Verificacao AS (
    SELECT 
        p.CD_USUARIO,
        p.NM_USUARIO,
        p.CD_SETOR,
        ms.CD_USUARIO AS EXISTE
    FROM Possibilidades p
    LEFT JOIN PrestadorComSetores ms
        ON p.CD_USUARIO = ms.CD_USUARIO AND p.CD_SETOR = ms.CD_SETOR
),
SetoresFaltantes AS (
    SELECT 
        v.CD_USUARIO,
        v.NM_USUARIO,
        v.CD_SETOR
    FROM Verificacao v
    WHERE v.EXISTE IS NULL
),
SetoresAtendidos AS (
    SELECT 
        v.CD_USUARIO,
        v.NM_USUARIO,
        v.CD_SETOR
    FROM Verificacao v
    WHERE v.EXISTE IS NOT NULL
)

SELECT 
    m.CD_USUARIO,
    m.NM_USUARIO,
    NVL(LISTAGG(DISTINCT sf.CD_SETOR, ', ') WITHIN GROUP (ORDER BY sf.CD_SETOR), 'Nenhum') AS SETORES_FALTANTES,
    NVL(LISTAGG(DISTINCT sa.CD_SETOR, ', ') WITHIN GROUP (ORDER BY sa.CD_SETOR), 'Nenhum') AS SETORES_ATENDIDOS,
    COUNT(DISTINCT sf.CD_SETOR) AS TOTAL_SETORES_FALTANTES,
    CASE 
        WHEN COUNT(DISTINCT sf.CD_SETOR) = 0 THEN 'Completo'
        ELSE '? Incompleto'
    END AS SITUACAO
FROM 
    TodosUsuarios m
LEFT JOIN SetoresFaltantes sf ON m.CD_USUARIO = sf.CD_USUARIO
LEFT JOIN SetoresAtendidos sa ON m.CD_USUARIO = sa.CD_USUARIO
GROUP BY 
    m.CD_USUARIO, m.NM_USUARIO
ORDER BY 
     m.NM_USUARIO
;



-- Query 2
-- INSERT EM MASSA -- Inclui setores em um determinando prestador
-- INSERT - Verifica e realiza a inclusão 
INSERT INTO USUARIO_UNID_INT (CD_ID_USUARIO, CD_SETOR)
SELECT 
    v.CD_USUARIO,
    v.CD_SETOR
FROM (
    WITH SetoresNecessarios AS ( 
        SELECT 139 AS CD_SETOR FROM DUAL UNION ALL
        -- SELECT 139 FROM DUAL UNION ALL
        -- SELECT 161 FROM DUAL UNION ALL
        SELECT 161 FROM DUAL
    ),
    PrestadorComSetores AS (
        SELECT 
            usu.CD_USUARIO,
            usu.NM_USUARIO,
            int.CD_SETOR
        FROM PRESTADOR prest
        INNER JOIN USUARIOS usu
            ON prest.CD_PRESTADOR = usu.CD_PRESTADOR
        INNER JOIN USUARIO_UNID_INT int
            ON int.CD_ID_USUARIO = usu.CD_USUARIO
        WHERE prest.CD_TIP_PRESTA = '32' AND prest.TP_SITUACAO = 'A'
    ),
    TodosUsuarios AS (
        SELECT DISTINCT CD_USUARIO, NM_USUARIO FROM PrestadorComSetores
    ),
    Possibilidades AS (
        SELECT 
            m.CD_USUARIO,
            m.NM_USUARIO,
            s.CD_SETOR
        FROM TodosUsuarios m
        CROSS JOIN SetoresNecessarios s
    ),
    Verificacao AS (
        SELECT 
            p.CD_USUARIO,
            p.CD_SETOR,
            ms.CD_USUARIO AS EXISTE
        FROM Possibilidades p
        LEFT JOIN PrestadorComSetores ms
            ON p.CD_USUARIO = ms.CD_USUARIO AND p.CD_SETOR = ms.CD_SETOR
    )
    SELECT 
        CD_USUARIO,
        CD_SETOR
    FROM Verificacao
    WHERE EXISTE IS NULL
) v;



-- Query 3
-- Deletar setores por Prestador
DELETE FROM USUARIO_UNID_INT uui
WHERE uui.CD_SETOR IN (161, 139)  -- ?? Troque aqui pelos setores que quiser remover
AND EXISTS (
    SELECT 1
    FROM USUARIOS usu
    JOIN PRESTADOR prest ON prest.CD_PRESTADOR = usu.CD_PRESTADOR
    WHERE prest.CD_TIP_PRESTA = '8'
      AND prest.TP_SITUACAO = 'A'
      AND usu.CD_USUARIO = uui.CD_ID_USUARIO
);

/*
Como usar:
Substitua os números 999, 888 na cláusula IN (...) 
pelos códigos dos setores que você deseja deletar.
Essa query não afeta outros vínculos — só os setores 
específicos e só se estiverem ligados a médicos ativos.
*/


-- QUERY 4
-- Incluir Unidade de Internação e Setor por Prestador
INSERT INTO USUARIO_UNID_INT (CD_ID_USUARIO, CD_UNID_INT, CD_SETOR)
SELECT 
    v.CD_USUARIO,
    v.CD_UNID_INT,
    v.CD_SETOR
FROM (
    WITH SetoresNecessarios AS ( 
        SELECT 31 AS CD_SETOR, 9 AS CD_UNID_INT FROM DUAL UNION ALL
        SELECT 32, 7 FROM DUAL UNION ALL
        SELECT 34, 8 FROM DUAL UNION ALL
        SELECT 37, 1 FROM DUAL UNION ALL
        SELECT 38, 2 FROM DUAL UNION ALL
        SELECT 39, 6 FROM DUAL UNION ALL
        SELECT 36, 10 FROM DUAL UNION ALL
        SELECT 107, 11 FROM DUAL UNION ALL
        SELECT 139, 13 FROM DUAL
    ),
    PrestadorComSetores AS (
        SELECT 
            usu.CD_USUARIO,
            usu.NM_USUARIO,
            int.CD_SETOR
        FROM PRESTADOR prest
        INNER JOIN USUARIOS usu
            ON prest.CD_PRESTADOR = usu.CD_PRESTADOR
        INNER JOIN USUARIO_UNID_INT int
            ON int.CD_ID_USUARIO = usu.CD_USUARIO
        WHERE prest.CD_TIP_PRESTA = '8' AND prest.TP_SITUACAO = 'A'
    ),
    TodosUsuarios AS (
        SELECT DISTINCT CD_USUARIO, NM_USUARIO FROM PrestadorComSetores
    ),
    Possibilidades AS (
        SELECT 
            m.CD_USUARIO,
            s.CD_UNID_INT,
            s.CD_SETOR
        FROM TodosUsuarios m
        CROSS JOIN SetoresNecessarios s
    ),
    Verificacao AS (
        SELECT 
            p.CD_USUARIO,
            p.CD_UNID_INT,
            p.CD_SETOR,
            pcs.CD_USUARIO AS EXISTE
        FROM Possibilidades p
        LEFT JOIN PrestadorComSetores pcs
            ON p.CD_USUARIO = pcs.CD_USUARIO AND p.CD_SETOR = pcs.CD_SETOR
    )
    SELECT 
        CD_USUARIO,
        CD_UNID_INT,
        CD_SETOR
    FROM Verificacao
    WHERE EXISTE IS NULL
) v;


-- EXPLICAÇÃO DA QUERY 1
/*
-- Objetivo da Query
A consulta retorna uma lista de prestadores (usuários médicos), mostrando:
Setores que estão faltando (em que ele deveria atuar, mas não atua)
Setores que ele já atende
A quantidade de setores faltantes
Uma coluna "SITUAÇÃO" dizendo se está "Completo" ou "Incompleto"

-- Explicação por bloco CTE (Common Table Expression)
1. SetoresNecessarios
Define quais setores são considerados obrigatórios (podem ser vários, aqui estão alguns 
comentados):

WITH SetoresNecessarios AS ( 
    SELECT 136 AS CD_SETOR FROM DUAL UNION ALL
    -- SELECT 139 FROM DUAL UNION ALL
    -- SELECT 161 FROM DUAL UNION ALL
    SELECT 137 FROM DUAL
),


2. FiltroSetores
Permite filtrar apenas um setor se desejar, substituindo SetoresNecessarios (facilita testes):

FiltroSetores AS (
    -- SELECT 161 AS CD_SETOR FROM DUAL  -- descomente para filtrar só o 161
    SELECT * FROM SetoresNecessarios
),


3. PrestadorComSetores
Lista os usuários ativos que são prestadores do tipo '32', junto com os setores em que já atuam:

PrestadorComSetores AS (
    SELECT 
        usu.CD_USUARIO,
        usu.NM_USUARIO,
        int.CD_SETOR
    FROM PRESTADOR prest
    INNER JOIN USUARIOS usu ON prest.CD_PRESTADOR = usu.CD_PRESTADOR
    INNER JOIN USUARIO_UNID_INT int ON int.CD_ID_USUARIO = usu.CD_USUARIO
    WHERE prest.CD_TIP_PRESTA = '32' AND prest.TP_SITUACAO = 'A'
),


4. TodosUsuarios
Garante uma lista única de médicos/prestadores:

TodosUsuarios AS (
    SELECT DISTINCT CD_USUARIO, NM_USUARIO FROM PrestadorComSetores
),


5. Possibilidades
Cria a combinação de todos os médicos × todos os setores necessários, ou seja, o que deveria existir:

Possibilidades AS (
    SELECT 
        m.CD_USUARIO,
        m.NM_USUARIO,
        s.CD_SETOR
    FROM TodosUsuarios m
    CROSS JOIN FiltroSetores s
),


6. Verificacao
Verifica se o médico já atende o setor necessário. Se EXISTE for NULL, está faltando:

Verificacao AS (
    SELECT 
        p.CD_USUARIO,
        p.NM_USUARIO,
        p.CD_SETOR,
        ms.CD_USUARIO AS EXISTE
    FROM Possibilidades p
    LEFT JOIN PrestadorComSetores ms
        ON p.CD_USUARIO = ms.CD_USUARIO AND p.CD_SETOR = ms.CD_SETOR
),


7. SetoresFaltantes
Filtra os que estão faltando (quando EXISTE for NULL):

SetoresFaltantes AS (
    SELECT 
        v.CD_USUARIO,
        v.NM_USUARIO,
        v.CD_SETOR
    FROM Verificacao v
    WHERE v.EXISTE IS NULL
),


8. SetoresAtendidos
Filtra os setores que o médico já atende (quando EXISTE NÃO é NULL):

SetoresAtendidos AS (
    SELECT 
        v.CD_USUARIO,
        v.NM_USUARIO,
        v.CD_SETOR
    FROM Verificacao v
    WHERE v.EXISTE IS NOT NULL
)


9. Consulta Final (SELECT)
O que é exibido:
Nome e código do usuário
Lista de setores faltantes (ou "Nenhum")
Lista de setores já atendidos (ou "Nenhum")
Quantidade de setores faltantes
Situação: "Completo" se não falta nenhum setor, "? Incompleto" caso contrário

SELECT 
    m.CD_USUARIO,
    m.NM_USUARIO,
    NVL(LISTAGG(DISTINCT sf.CD_SETOR, ', ') WITHIN GROUP (ORDER BY sf.CD_SETOR), 'Nenhum') AS SETORES_FALTANTES,
    NVL(LISTAGG(DISTINCT sa.CD_SETOR, ', ') WITHIN GROUP (ORDER BY sa.CD_SETOR), 'Nenhum') AS SETORES_ATENDIDOS,
    COUNT(DISTINCT sf.CD_SETOR) AS TOTAL_SETORES_FALTANTES,
    CASE 
        WHEN COUNT(DISTINCT sf.CD_SETOR) = 0 THEN 'Completo'
        ELSE '? Incompleto'
    END AS SITUACAO
FROM 
    TodosUsuarios m
LEFT JOIN SetoresFaltantes sf ON m.CD_USUARIO = sf.CD_USUARIO
LEFT JOIN SetoresAtendidos sa ON m.CD_USUARIO = sa.CD_USUARIO
GROUP BY 
    m.CD_USUARIO, m.NM_USUARIO
ORDER BY 
    m.NM_USUARIO;

*/


##################################################################################################

-- EXPLICAÇÃO DA QUERY 2
/* O INSERT insere os setores que estão faltando para determinados prestadores. A ideia é completar os registros 
que ainda não existem na tabela USUARIO_UNID_INT.
-- Objetivo geral da query
O comando:

INSERT INTO USUARIO_UNID_INT (CD_ID_USUARIO, CD_SETOR)

Irá inserir os setores em que o prestador do tipo '32' e ativos ('A') ainda não estão cadastrados, mas que deveriam 
estar conforme a lista definida em SetoresNecessarios.

-- Blocos explicados (CTEs - WITH)
1. SetoresNecessarios
Define quais setores devem estar cadastrados para todos os prestadores. Aqui, você quer garantir que os 
setores 139 e 161 existam para cada um:
SetoresNecessarios AS ( 

SELECT 139 AS CD_SETOR FROM DUAL UNION ALL
    SELECT 161 FROM DUAL
)


2. PrestadorComSetores
Lista os usuários que:
São prestadores (tipo '32')
Estão ativos (TP_SITUACAO = 'A')
Já possuem alguma associação com setores na tabela USUARIO_UNID_INT

PrestadorComSetores AS (
    SELECT 
        usu.CD_USUARIO,
        usu.NM_USUARIO,
        int.CD_SETOR
    FROM PRESTADOR prest
    INNER JOIN USUARIOS usu ON prest.CD_PRESTADOR = usu.CD_PRESTADOR
    INNER JOIN USUARIO_UNID_INT int ON int.CD_ID_USUARIO = usu.CD_USUARIO
    WHERE prest.CD_TIP_PRESTA = '32' AND prest.TP_SITUACAO = 'A'
)


3. TodosUsuarios
Pega todos os usuários únicos da CTE anterior:

TodosUsuarios AS (
    SELECT DISTINCT CD_USUARIO, NM_USUARIO FROM PrestadorComSetores
)


4. Possibilidades
Faz o produto cartesiano (CROSS JOIN) entre todos os usuários e os setores 
necessários — ou seja, combina cada usuário com cada setor que ele deveria ter:

Possibilidades AS (
    SELECT 
        m.CD_USUARIO,
        m.NM_USUARIO,
        s.CD_SETOR
    FROM TodosUsuarios m
    CROSS JOIN SetoresNecessarios s
)


5. Verificacao
Verifica quais combinações ainda não existem na base:

Verificacao AS (
    SELECT 
        p.CD_USUARIO,
        p.CD_SETOR,
        ms.CD_USUARIO AS EXISTE
    FROM Possibilidades p
    LEFT JOIN PrestadorComSetores ms
        ON p.CD_USUARIO = ms.CD_USUARIO AND p.CD_SETOR = ms.CD_SETOR
)
Se EXISTE for NULL, significa que a combinação CD_USUARIO + CD_SETOR não existe ainda e precisa ser inserida.


6. Final: o SELECT com os dados a serem inseridos

SELECT 
    CD_USUARIO,
    CD_SETOR
FROM Verificacao
WHERE EXISTE IS NULL
Só pega os registros que não existem atualmente, ou seja, os setores que estão faltando para cada prestador.


7. Resultado final
Esse INSERT:
Preenche automaticamente os setores faltantes para o prestador do tipo '32'
Evita duplicações, pois só insere o que ainda não existe
É seguro e eficiente, ideal para completar cadastros com base em regras
*/




-- EXPLICAÇÃO QUERY 3
/* A Query de DELETE remove os setores específicos dos usuários ativos de um determinado tipo de prestador.

-- Objetivo da query
Remover registros da tabela USUARIO_UNID_INT que:
São de setores específicos (161, 139 — ou outros que você queira colocar).
Pertencem a usuários de um detrminado prestador ativos, mais precisamente com:
Tipo de prestador = '8'
Situação = 'A' (ativo)


-- Estrutura da query

DELETE FROM USUARIO_UNID_INT uui
WHERE uui.CD_SETOR IN (161, 139)  -- Setores que deseja remover
AND EXISTS (
    SELECT 1
    FROM USUARIOS usu
    JOIN PRESTADOR prest ON prest.CD_PRESTADOR = usu.CD_PRESTADOR
    WHERE prest.CD_TIP_PRESTA = '8'
      AND prest.TP_SITUACAO = 'A'
      AND usu.CD_USUARIO = uui.CD_ID_USUARIO
);


-- Explicando em partes

DELETE FROM USUARIO_UNID_INT uui
-- Está dizendo que você vai apagar registros da tabela USUARIO_UNID_INT, que guarda a relação entre usuários 
e setores de internação.

WHERE uui.CD_SETOR IN (161, 139)
-- Só apaga os registros que pertencem aos setores 161 ou 139.

-- Você pode alterar esses valores para os setores que quiser excluir.
Exemplo: IN (137, 136) se quiser trocar.

AND EXISTS (...)
-- Esse bloco verifica se o registro está ligado a um determinando usuario ativo do tipo 8 (Prestador).

Dentro do EXISTS:

SELECT 1
FROM USUARIOS usu
JOIN PRESTADOR prest ON prest.CD_PRESTADOR = usu.CD_PRESTADOR
WHERE prest.CD_TIP_PRESTA = '8'
AND prest.TP_SITUACAO = 'A'
AND usu.CD_USUARIO = uui.CD_ID_USUARIO

Aqui, o filtro está dizendo:
Só apaga se o usuário do registro da USUARIO_UNID_INT for encontrado entre os usuários ligados 
a prestadores tipo '8' e ativos.


-- Resumo prático
Situação - Ação
Médico - tipo '8' - ativo - Pode ser apagado
Setor diferente de 161/139 - Ignorado
Médico inativo ou outro tipo - Ignorado
*/




-- EXPLICAÇÃO DA QUERY 4
/* Esta Query insere setores faltantes com suas respectivas unidades de internação para usuários ativos do tipo 8 
que ainda não estão vinculados a um determinado setor.

-- Objetivo da query
Inserir na tabela USUARIO_UNID_INT os setores e unidades de internação que ainda não estão atribuídos a 
determinados usuários.

-- Estrutura da query

INSERT INTO USUARIO_UNID_INT (CD_ID_USUARIO, CD_UNID_INT, CD_SETOR)
SELECT
    v.CD_USUARIO,
    v.CD_UNID_INT,
    v.CD_SETOR
FROM (
    -- Bloco com CTEs (subconsultas nomeadas)
) v;


-- A ideia é:
Criar um conjunto de combinações possíveis entre médicos e setores.
Verificar quais não existem ainda na tabela USUARIO_UNID_INT.
Inserir essas que estão faltando.

-- Explicando as partes internas (WITH)
1. SetoresNecessarios
Define quais setores devem ser vinculados, junto com as respectivas unidades de internação.

SELECT 31 AS CD_SETOR, 9 AS CD_UNID_INT FROM DUAL UNION ALL
SELECT 32, 7 FROM DUAL UNION ALL
...
SELECT 139, 13 FROM DUAL
-- Exemplo: setor 31 está ligado à unidade de internação 9.


2. PrestadorComSetores
Seleciona os usuários do tipo '8' que estão ativos, já com os setores nos quais eles atuam.

FROM PRESTADOR prest
JOIN USUARIOS usu ON prest.CD_PRESTADOR = usu.CD_PRESTADOR
JOIN USUARIO_UNID_INT int ON int.CD_ID_USUARIO = usu.CD_USUARIO


3. TodosUsuarios
Pega a lista única de usuários do passo anterior.

SELECT DISTINCT CD_USUARIO, NM_USUARIO FROM PrestadorComSetores


4. Possibilidades
Gera todas as combinações possíveis entre usuários e setores/unidades necessárias usando CROSS JOIN.

TodosUsuarios CROSS JOIN SetoresNecessarios
-- Isso cria um “tabuleiro” com todas as possibilidades de vínculo que deveriam existir.


5. Verificacao
Aqui se verifica quais vínculos já existem.

LEFT JOIN PrestadorComSetores pcs
ON p.CD_USUARIO = pcs.CD_USUARIO AND p.CD_SETOR = pcs.CD_SETOR
Se não encontrar (EXISTE IS NULL), significa que o vínculo está faltando e deve ser criado.

6. Resultado final

SELECT CD_USUARIO, CD_UNID_INT, CD_SETOR
FROM Verificacao
WHERE EXISTE IS NULL
-- Somente os vínculos ausentes são selecionados para serem inseridos.

7. Conclusão
-- Este INSERT:
Evita duplicações (verificando antes de inserir).
Garante que todos os usuários tipo 8 ativos estejam associados aos setores e unidades necessários.
Funciona como um “completador automático” da tabela USUARIO_UNID_INT.
*/






















































-- feito pelo Ygor

WITH SetoresNecessarios AS (
    SELECT 37 AS CD_SETOR FROM DUAL UNION ALL
    SELECT 139 FROM DUAL
),
MedicosComSetores AS (
    SELECT 
        usu.CD_USUARIO,
        usu.NM_USUARIO,
        int.CD_SETOR
    FROM PRESTADOR prest
    INNER JOIN USUARIOS usu
        ON prest.CD_PRESTADOR = usu.CD_PRESTADOR
    INNER JOIN USUARIO_UNID_INT int
        ON int.CD_ID_USUARIO = usu.CD_USUARIO
    WHERE prest.CD_TIP_PRESTA = '8' AND prest.TP_SITUACAO = 'A'
)

SELECT 
    m.CD_USUARIO,
    m.NM_USUARIO,
    LISTAGG(s.CD_SETOR, ', ') WITHIN GROUP (ORDER BY s.CD_SETOR) AS SETORES_FALTANTES,
    COUNT(s.CD_SETOR) AS TOTAL_SETORES_FALTANTES
FROM 
    (SELECT DISTINCT CD_USUARIO, NM_USUARIO FROM MedicosComSetores) m
CROSS JOIN SetoresNecessarios s
LEFT JOIN MedicosComSetores ms
    ON m.CD_USUARIO = ms.CD_USUARIO AND s.CD_SETOR = ms.CD_SETOR
WHERE ms.CD_SETOR IS NULL
GROUP BY 
    m.CD_USUARIO, m.NM_USUARIO
ORDER BY 
    m.NM_USUARIO
;





