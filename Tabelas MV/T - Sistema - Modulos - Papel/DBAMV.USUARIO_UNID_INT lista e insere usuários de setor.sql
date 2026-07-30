-- SELECT TABELA usuario_unid_int
SELECT * FROM usuario_unid_int
WHERE cd_setor = '135'
ORDER BY cd_id_usuario;



-- SELECT PARA VALIDAR QUAIS USUARIOS POSSUEM E NAO POSSUEM UM DETERMINADO SETOR
WITH usuarios_esperados AS (
  SELECT 'SALATIEL.ROCHA' AS cd_id_usuario FROM dual UNION ALL
  SELECT 'ANA.PATRICIO' FROM dual UNION ALL
  SELECT 'ALINE.MARGRAF' FROM dual UNION ALL
  SELECT 'ANA.DINIZ' FROM dual UNION ALL
  SELECT 'ANDERSON.SILVA' FROM dual UNION ALL
  SELECT 'EMILLY.SILVA' FROM dual UNION ALL
  SELECT 'FERNANDA.SLIMA' FROM dual UNION ALL
  SELECT 'GABRIELLA.SILVA' FROM dual UNION ALL
  SELECT 'GIOVANNA.RAMOS' FROM dual UNION ALL
  SELECT 'JAMYLE.CORDEIRO' FROM dual UNION ALL
  SELECT 'KELLY.SILVERIO' FROM dual UNION ALL
  SELECT 'LUCAS.LEONARDO' FROM dual UNION ALL
  SELECT 'NADRIA.MATOS' FROM dual UNION ALL
  SELECT 'TAMILLY.SANTOS' FROM dual UNION ALL
  SELECT 'THAMYS.RAYMUNDO' FROM dual UNION ALL
  SELECT 'WESLLEY.SANTOS' FROM dual UNION ALL
  SELECT 'WILLIAM.JESUS' FROM dual UNION ALL
  SELECT 'GABRIELLA.LEITE' FROM dual UNION ALL
  SELECT 'KAMILLA.SILVA' FROM dual UNION ALL
  SELECT 'WALLISON.LARA' FROM dual UNION ALL
  SELECT 'EMERSON.BORGES' FROM dual UNION ALL
  SELECT 'ERIVAN.GAMA' FROM dual UNION ALL
  SELECT 'JHOSEPH.LINDOSO' FROM dual UNION ALL
  SELECT 'JULIA.MOREIRA' FROM dual UNION ALL
  SELECT 'LUIZA.SIENNA' FROM dual UNION ALL
  SELECT 'PRISCILA.SCHROTH' FROM dual UNION ALL
  SELECT 'SOLIMAR.FILHO' FROM dual UNION ALL
  SELECT 'THALISSA.MARTINS' FROM dual
)
SELECT
  ue.cd_id_usuario,
  CASE
    WHEN ui.cd_id_usuario IS NOT NULL THEN 'TEM SETOR 135'
    ELSE 'NÃO TEM SETOR 135'
  END AS status_setor_135
FROM
  usuarios_esperados ue
LEFT JOIN
  usuario_unid_int ui
    ON ue.cd_id_usuario = ui.cd_id_usuario AND ui.cd_setor = '135'
ORDER BY
  ue.cd_id_usuario;







-- *** Lista somente os usu�rios n�o t�m o setor 135

-- Parte 1: CTE � WITH usuarios_esperados AS (...)
-- WITH cria uma CTE (Common Table Expression), que � como uma tabela tempor�ria para essa consulta.
-- A CTE chamada usuarios_esperados cont�m uma lista fixa e expl�cita dos usu�rios que deveriam ter o setor 135.
-- Cada linha seleciona um usu�rio �nico, usando SELECT 'NOME' FROM dual.
-- dual � uma tabela especial do Oracle usada para selecionar valores constantes.
-- UNION ALL concatena essas linhas, formando a lista completa.

-- Parte 2: Consulta principal
-- usuarios_esperados ue: a CTE, renomeada como ue.
-- LEFT JOIN usuario_unid_int ui: junta os usu�rios esperados com os registros existentes na tabela usuario_unid_int.
-- A jun��o � feita: Pelo usu�rio: ue.cd_id_usuario = ui.cd_id_usuario E pelo setor: ui.cd_setor = '135' � ou seja, s� junta se o usu�rio tem o setor 135.
-- LEFT JOIN garante que todos os usu�rios da lista usuarios_esperados aparecer�o, mesmo que n�o tenham registro na tabela usuario_unid_int.
-- WHERE ui.cd_id_usuario IS NULL filtra apenas os usu�rios que n�o t�m um registro na tabela usuario_unid_int com o setor 135 (porque no LEFT JOIN, se n�o encontrar, ui fica com valores nulos).
-- ORDER BY ue.cd_id_usuario ordena os resultados pelo nome do usu�rio.

-- Resumo do que a query faz:
-- Define uma lista fixa dos usu�rios que devem ter setor 135 (CTE usuarios_esperados).
-- Busca na tabela real usuario_unid_int se eles j� t�m esse setor.
-- Retorna s� os usu�rios da lista que n�o possuem o setor 135 cadastrado.
-- Ordena por nome.

WITH usuarios_esperados AS (
  SELECT 'SALATIEL.ROCHA' AS cd_id_usuario FROM dual UNION ALL
  SELECT 'ANA.PATRICIO' FROM dual UNION ALL
  SELECT 'ALINE.MARGRAF' FROM dual UNION ALL
  SELECT 'ANA.DINIZ' FROM dual UNION ALL
  SELECT 'ANDERSON.SILVA' FROM dual UNION ALL
  SELECT 'EMILLY.SILVA' FROM dual UNION ALL
  SELECT 'FERNANDA.SLIMA' FROM dual UNION ALL
  SELECT 'GABRIELLA.SILVA' FROM dual UNION ALL
  SELECT 'GIOVANNA.RAMOS' FROM dual UNION ALL
  SELECT 'JAMYLE.CORDEIRO' FROM dual UNION ALL
  SELECT 'KELLY.SILVERIO' FROM dual UNION ALL
  SELECT 'LUCAS.LEONARDO' FROM dual UNION ALL
  SELECT 'NADRIA.MATOS' FROM dual UNION ALL
  SELECT 'TAMILLY.SANTOS' FROM dual UNION ALL
  SELECT 'THAMYS.RAYMUNDO' FROM dual UNION ALL
  SELECT 'WESLLEY.SANTOS' FROM dual UNION ALL
  SELECT 'WILLIAM.JESUS' FROM dual UNION ALL
  SELECT 'GABRIELLA.LEITE' FROM dual UNION ALL
  SELECT 'KAMILLA.SILVA' FROM dual UNION ALL
  SELECT 'WALLISON.LARA' FROM dual UNION ALL
  SELECT 'EMERSON.BORGES' FROM dual UNION ALL
  SELECT 'ERIVAN.GAMA' FROM dual UNION ALL
  SELECT 'JHOSEPH.LINDOSO' FROM dual UNION ALL
  SELECT 'JULIA.MOREIRA' FROM dual UNION ALL
  SELECT 'LUIZA.SIENNA' FROM dual UNION ALL
  SELECT 'PRISCILA.SCHROTH' FROM dual UNION ALL
  SELECT 'SOLIMAR.FILHO' FROM dual UNION ALL
  SELECT 'THALISSA.MARTINS' FROM dual
)
SELECT
  ue.cd_id_usuario
FROM
  usuarios_esperados ue
LEFT JOIN
  usuario_unid_int ui
    ON ue.cd_id_usuario = ui.cd_id_usuario AND ui.cd_setor = '181'
WHERE
  ui.cd_id_usuario IS NULL
ORDER BY
  ue.cd_id_usuario;



-- Inserir setor para o usu�rio, com todas as permissões ativadas ('S')
INSERT INTO usuario_unid_int (
    cd_id_usuario,                 -- código do usuário
    cd_setor,                      -- código do setor
    sn_solicitacao_produto_setor,  -- permissão solicitação produto no setor
    sn_solicitacao_produto_gas_sal,-- permissão solicitação produto gas/sala
    sn_solicitacao_produto_pacient,-- permissão solicitção produto paciente
    sn_solicitacao_produto_estoq,  -- permissão solicitação produto estoque
    sn_solicitacao_produto_emp,    -- permissão solicitação produto empresa
    sn_movimentacao_setor,         -- permissão movimentação no setor
    sn_movimentacao_gasto_sala,    -- permissão movimentação gasto sala
    sn_movimentacao_paciente,      -- permissão movimentação paciente
    sn_movimentacao_estoque,       -- permissão movimentação estoque
    sn_movimentacao_empresa,       -- permissão movimentação empresa
    sn_confirmacao_recebimento     -- permissão confirmação recebimento
) VALUES (
    'GABRIELLA.LEITE',  -- usuário
    '181',        -- setor
    'S', 'S', 'S', 'S', 'S',  -- todas as permissões ativadas
    'S', 'S', 'S', 'S', 'S', 'S'
);

  

-- Exemplo de INSERT com sequência
INSERT INTO usuario_unid_int (
    cd_id_usuario,                  -- código do usuário
    cd_setor,                        -- código do setor
    sn_solicitacao_produto_setor,    -- permissão solicitação produto no setor
    sn_solicitacao_produto_gas_sal,  -- permissão solicitação produto gás/sala
    sn_solicitacao_produto_pacient,  -- permissão solicitação produto paciente
    sn_solicitacao_produto_estoq,    -- permissão solicitação produto estoque
    sn_solicitacao_produto_emp,      -- permissão solicitação produto empresa
    sn_movimentacao_setor,           -- permissão movimentação no setor
    sn_movimentacao_gasto_sala,      -- permissão movimentação gasto sala
    sn_movimentacao_paciente,        -- permissão movimentação paciente
    sn_movimentacao_estoque,         -- permissão movimentação estoque
    sn_movimentacao_empresa,         -- permissão movimentação empresa
    sn_confirmacao_recebimento       -- permissão confirmação recebimento
) VALUES (
    usuario_unid_int_seq.NEXTVAL,    -- chave primária gerada pela sequência
    '135',                           -- código do setor
    'S', 'S', 'S', 'S', 'S',          -- todas as permissões ativadas
    'S', 'S', 'S', 'S', 'S', 'S'
);

/*
Explicação:
usuario_unid_int_seq.NEXTVAL: Esta expressão obtém o próximo valor da sequência usuario_unid_int_seq e o insere 
na coluna cd_id_usuario, que é a chave primária da tabela.
Os demais valores são inseridos conforme os dados fornecidos para cada coluna, como o código do setor e as permissões.
O que fazer se não houver sequência?
Verifique se a sequência existe: Para evitar esse erro, primeiro, verifique se a sequência foi criada corretamente. 
Você pode fazer isso com a seguinte consulta:
*/

SELECT sequence_name
FROM user_sequences
WHERE sequence_name = 'USUARIO_UNID_INT_SEQ';


-- Fazer a inclusão em vários usuários
INSERT INTO usuario_unid_int (
    cd_id_usuario,                 
    cd_setor,                      
    sn_solicitacao_produto_setor,  
    sn_solicitacao_produto_gas_sal,
    sn_solicitacao_produto_pacient,
    sn_solicitacao_produto_estoq,  
    sn_solicitacao_produto_emp,    
    sn_movimentacao_setor,         
    sn_movimentacao_gasto_sala,    
    sn_movimentacao_paciente,      
    sn_movimentacao_estoque,       
    sn_movimentacao_empresa,       
    sn_confirmacao_recebimento     
)
VALUES 
    ('WILLIAM.JESUS', '148', 'S', 'S', 'S', 'S', 'S', 'S', 'S', 'S', 'S', 'S', 'S'),
    ('WESLLEY.SANTOS', '148', 'S', 'S', 'S', 'S', 'S', 'S', 'S', 'S', 'S', 'S', 'S'),
    ('WALLISON.LARA', '148', 'S', 'S', 'S', 'S', 'S', 'S', 'S', 'S', 'S', 'S', 'S'),
    ('THAMYS.RAYMUNDO', '148', 'S', 'S', 'S', 'S', 'S', 'S', 'S', 'S', 'S', 'S', 'S'),
    ('TAMILLY.SANTOS', '148', 'S', 'S', 'S', 'S', 'S', 'S', 'S', 'S', 'S', 'S', 'S'),
    ('SOLIMAR.FILHO', '148', 'S', 'S', 'S', 'S', 'S', 'S', 'S', 'S', 'S', 'S', 'S'),
    ('SALATIEL.ROCHA', '148', 'S', 'S', 'S', 'S', 'S', 'S', 'S', 'S', 'S', 'S', 'S'),
    ('PRISCILA.SCHROTH', '148', 'S', 'S', 'S', 'S', 'S', 'S', 'S', 'S', 'S', 'S', 'S'),
    ('NADRIA.MATOS', '148', 'S', 'S', 'S', 'S', 'S', 'S', 'S', 'S', 'S', 'S', 'S'),
    ('LUIZA.SIENNA', '148', 'S', 'S', 'S', 'S', 'S', 'S', 'S', 'S', 'S', 'S', 'S');




-- Para realizar uma inserção em massa eficiente usando PL/SQL com FORALL, ou com a cláusula INSERT ALL, ambos são ótimos métodos para reduzir o número de comandos INSERT e melhorar a performance, especialmente quando há muitos registros a serem inseridos.
-- Aqui estão dois exemplos de como você pode fazer isso:
-- 1. Usando FORALL no PL/SQL:
-- O FORALL é uma estrutura PL/SQL que permite executar uma operação em massa para vários elementos em uma coleção (como uma tabela, array ou VARRAY), evitando múltiplos contextos de troca entre o PL/SQL e o SQL. 
-- Aqui está como você pode usar o FORALL para inserir múltiplos registros em uma tabela de forma eficiente:
-- Exemplo de código PL/SQL com FORALL:

DECLARE
    TYPE usuario_unid_int_t IS TABLE OF usuario_unid_int%ROWTYPE;
    v_usuarios usuario_unid_int_t;
BEGIN
    -- Preenche a coleção com os dados que você quer inserir
    v_usuarios := usuario_unid_int_t(
        ('', '148', 'S', 'S', 'S', 'S', 'S', 'S', 'S', 'S', 'S', 'S', 'S'),
        ('', '148', 'S', 'S', 'S', 'S', 'S', 'S', 'S', 'S', 'S', 'S', 'S'),
        ('', '148', 'S', 'S', 'S', 'S', 'S', 'S', 'S', 'S', 'S', 'S', 'S'),
        ('', '148', 'S', 'S', 'S', 'S', 'S', 'S', 'S', 'S', 'S', 'S', 'S'),
        ('', '148', 'S', 'S', 'S', 'S', 'S', 'S', 'S', 'S', 'S', 'S', 'S'),
        ('', '148', 'S', 'S', 'S', 'S', 'S', 'S', 'S', 'S', 'S', 'S', 'S'),
        ('', '148', 'S', 'S', 'S', 'S', 'S', 'S', 'S', 'S', 'S', 'S', 'S'),
        ('', '148', 'S', 'S', 'S', 'S', 'S', 'S', 'S', 'S', 'S', 'S', 'S'),
        ('', '148', 'S', 'S', 'S', 'S', 'S', 'S', 'S', 'S', 'S', 'S', 'S'),
        ('', '148', 'S', 'S', 'S', 'S', 'S', 'S', 'S', 'S', 'S', 'S', 'S')
    );
    

    -- Inserir os dados em massa
    FORALL i IN 1..v_usuarios.COUNT
        INSERT INTO usuario_unid_int (
            cd_id_usuario, 
            cd_setor, 
            sn_solicitacao_produto_setor, 
            sn_solicitacao_produto_gas_sal, 
            sn_solicitacao_produto_pacient, 
            sn_solicitacao_produto_estoq, 
            sn_solicitacao_produto_emp, 
            sn_movimentacao_setor, 
            sn_movimentacao_gasto_sala, 
            sn_movimentacao_paciente, 
            sn_movimentacao_estoque, 
            sn_movimentacao_empresa, 
            sn_confirmacao_recebimento
        ) VALUES (
            v_usuarios(i).cd_id_usuario,
            v_usuarios(i).cd_setor,
            v_usuarios(i).sn_solicitacao_produto_setor,
            v_usuarios(i).sn_solicitacao_produto_gas_sal,
            v_usuarios(i).sn_solicitacao_produto_pacient,
            v_usuarios(i).sn_solicitacao_produto_estoq,
            v_usuarios(i).sn_solicitacao_produto_emp,
            v_usuarios(i).sn_movimentacao_setor,
            v_usuarios(i).sn_movimentacao_gasto_sala,
            v_usuarios(i).sn_movimentacao_paciente,
            v_usuarios(i).sn_movimentacao_estoque,
            v_usuarios(i).sn_movimentacao_empresa,
            v_usuarios(i).sn_confirmacao_recebimento
        );
END;
/

-- Explicação:

-- Utilizamos uma coleção do tipo TABLE (usuario_unid_int_t) para armazenar os registros a serem inseridos.

-- Usamos o comando FORALL para inserir todos os registros da coleção de uma vez só, sem a necessidade de fazer um INSERT individual para cada linha, o que melhora bastante a performance.

-- 2. Usando INSERT ALL:
-- O INSERT ALL permite inserir vários registros em uma única instrução INSERT, o que também melhora a performance, especialmente em situações de inserções em lote.

-- Exemplo de código com INSERT ALL:


INSERT ALL
    INTO usuario_unid_int (cd_id_usuario, cd_setor, sn_solicitacao_produto_setor, sn_solicitacao_produto_gas_sal,
                            sn_solicitacao_produto_pacient, sn_solicitacao_produto_estoq, sn_solicitacao_produto_emp,
                            sn_movimentacao_setor, sn_movimentacao_gasto_sala, sn_movimentacao_paciente,
                            sn_movimentacao_estoque, sn_movimentacao_empresa, sn_confirmacao_recebimento)
    VALUES ('ALINE.MARGRAF', '148', 'S', 'S', 'S', 'S', 'S', 'S', 'S', 'S', 'S', 'S', 'S')
    INTO usuario_unid_int (cd_id_usuario, cd_setor, sn_solicitacao_produto_setor, sn_solicitacao_produto_gas_sal,
                            sn_solicitacao_produto_pacient, sn_solicitacao_produto_estoq, sn_solicitacao_produto_emp,
                            sn_movimentacao_setor, sn_movimentacao_gasto_sala, sn_movimentacao_paciente,
                            sn_movimentacao_estoque, sn_movimentacao_empresa, sn_confirmacao_recebimento)
    VALUES ('ANA.DINIZ', '148', 'S', 'S', 'S', 'S', 'S', 'S', 'S', 'S', 'S', 'S', 'S')
    INTO usuario_unid_int (cd_id_usuario, cd_setor, sn_solicitacao_produto_setor, sn_solicitacao_produto_gas_sal,
                            sn_solicitacao_produto_pacient, sn_solicitacao_produto_estoq, sn_solicitacao_produto_emp,
                            sn_movimentacao_setor, sn_movimentacao_gasto_sala, sn_movimentacao_paciente,
                            sn_movimentacao_estoque, sn_movimentacao_empresa, sn_confirmacao_recebimento)
    VALUES ('JOÃO.SILVA', '148', 'S', 'S', 'S', 'S', 'S', 'S', 'S', 'S', 'S', 'S', 'S')
    -- Adicione mais registros conforme necessário
SELECT * FROM dual;

-- Explicação:
-- A sintaxe INSERT ALL permite inserir múltiplos registros em uma única transação.
-- O SELECT * FROM dual é necessário para executar a instrução como uma única consulta de inserção.
-- Vantagens:
-- FORALL (PL/SQL): É mais flexível e poderoso, pois pode lidar com coleções complexas e permite o controle fino do código.
-- INSERT ALL: É mais simples de usar e funciona bem para inserções em massa simples sem a necessidade de PL/SQL.
-- Ambos os métodos ajudam a reduzir o número de comandos INSERT, melhorando a performance de inserções em grandes volumes de dados.





