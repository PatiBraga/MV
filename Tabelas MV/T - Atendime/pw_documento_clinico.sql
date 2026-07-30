SELECT   
    c.cd_paciente, 
    c.nm_paciente,
    TRUNC(c.dt_nascimento) AS dt_nascimento,
    a.cd_atendimento, 
    TO_CHAR(b.dt_gravacao, 'dd/mm/yyyy hh24:mi') AS dt_gravacao, 
    TO_CHAR(b.hr_agenda, 'dd/mm/yyyy hh24:mi') AS hr_agenda, 
    TRUNC(b.hr_agenda - b.dt_gravacao) AS dias_agenda, 
    TO_CHAR(a.hr_atendimento, 'dd/mm/yyyy hh24:mi') AS hr_atendimento,
    TO_CHAR(
        (SELECT MIN(x.dh_criacao)
         FROM pw_documento_clinico x
         WHERE x.cd_atendimento = a.cd_atendimento
           AND x.cd_objeto IN (113, 466)   -- FICHA ATENDIMENTO AMBULATORIAL - ATENDIMENTO AMBULATORIAL
        ), 'dd/mm/yyyy hh24:mi') AS dt_anamnese,
    (SELECT MAX(z.cd_cid || ' - ' || z.ds_cid)
     FROM atendime x
     JOIN diagnostico_atendime y ON x.cd_atendimento = y.cd_atendimento
     JOIN cid z ON y.cd_cid = z.cd_cid
     WHERE z.cd_cid IN (
         'C70', 'C71', 'C72', 'C75', 'C700', 'C701', 'C709', 'C710', 
         'C711', 'C712', 'C713', 'C714', 'C715', 'C716', 'C717', 'C718', 
         'C719', 'C720', 'C722', 'C723', 'C724', 'C725', 'C728', 'C729', 
         'C751', 'C752', 'C753', 'D33', 'D330', 'D331', 'D332', 'D333', 
         'D334', 'D337', 'D339', 'D43', 'D430', 'D431', 'D432', 'D433', 
         'D434', 'D437', 'D439'
     )
     AND x.cd_paciente = a.cd_paciente
    ) AS ds_cid
FROM atendime a
JOIN it_agenda_central b ON a.cd_atendimento = b.cd_atendimento
JOIN paciente c ON a.cd_paciente = c.cd_paciente
WHERE a.cd_atendimento IN (
        SELECT MAX(v.cd_atendimento)
        FROM atendime v
        WHERE v.cd_paciente IN (
            SELECT DISTINCT x.cd_paciente
            FROM atendime x
            JOIN diagnostico_atendime y ON x.cd_atendimento = y.cd_atendimento
            JOIN cid z ON y.cd_cid = z.cd_cid
            WHERE z.cd_cid IN (
                'C70', 'C71', 'C72', 'C75', 'C700', 'C701', 'C709', 'C710', 
                'C711', 'C712', 'C713', 'C714', 'C715', 'C716', 'C717', 'C718', 
                'C719', 'C720', 'C722', 'C723', 'C724', 'C725', 'C728', 'C729', 
                'C751', 'C752', 'C753', 'D33', 'D330', 'D331', 'D332', 'D333', 
                'D334', 'D337', 'D339', 'D43', 'D430', 'D431', 'D432', 'D433', 
                'D434', 'D437', 'D439'
            )
            --AND v.dt_atendimento BETWEEN :dt_inicial AND :dt_final
            AND v.dt_atendimento BETWEEN to_date('01-01-2025 00:00:00', 'DD-MM-YYYY HH24-MI-SS') AND to_date('25-11-2025 23:59:59', 'DD-MM-YYYY HH24-MI-SS')
            AND v.tp_atendimento = 'A' /* 'I','Internação','E','Externo','U','Urgência','A','Ambulatório' */
            --GROUP BY v.cd_paciente
        )
    )
ORDER BY 
    a.hr_atendimento ASC;

SELECT dt_atendimento FROM atendime 




_______________________________________________________________________________________________________________________________________


-- Debugado no DBeaver

SELECT   
    c.cd_paciente, 
    c.nm_paciente,
    TRUNC(c.dt_nascimento) AS dt_nascimento,
    a.cd_atendimento, 
    TO_CHAR(b.dt_gravacao, 'dd/mm/yyyy hh24:mi') AS dt_gravacao, 
    TO_CHAR(b.hr_agenda, 'dd/mm/yyyy hh24:mi') AS hr_agenda, 
    TRUNC(b.hr_agenda - b.dt_gravacao) AS dias_agenda, 
    TO_CHAR(a.hr_atendimento, 'dd/mm/yyyy hh24:mi') AS hr_atendimento,
    TO_CHAR(
        (SELECT MIN(x.dh_criacao)
         FROM pw_documento_clinico x
         WHERE x.cd_atendimento = a.cd_atendimento
           AND x.cd_objeto IN (113, 466)
        ), 'dd/mm/yyyy hh24:mi') AS dt_anamnese,
    (SELECT MAX(z.cd_cid || ' - ' || z.ds_cid)
     FROM atendime x
     JOIN diagnostico_atendime y ON x.cd_atendimento = y.cd_atendimento
     JOIN cid z ON y.cd_cid = z.cd_cid
     WHERE z.cd_cid IN (
         'C70', 'C71', 'C72', 'C75', 'C700', 'C701', 'C709', 'C710', 
         'C711', 'C712', 'C713', 'C714', 'C715', 'C716', 'C717', 'C718', 
         'C719', 'C720', 'C722', 'C723', 'C724', 'C725', 'C728', 'C729', 
         'C751', 'C752', 'C753', 'D33', 'D330', 'D331', 'D332', 'D333', 
         'D334', 'D337', 'D339', 'D43', 'D430', 'D431', 'D432', 'D433', 
         'D434', 'D437', 'D439'
     )
     AND x.cd_paciente = a.cd_paciente
    ) AS ds_cid
FROM atendime a
JOIN it_agenda_central b ON a.cd_atendimento = b.cd_atendimento
JOIN paciente c ON a.cd_paciente = c.cd_paciente
WHERE a.cd_atendimento IN (
        SELECT MAX(v.cd_atendimento)
        FROM atendime v
        WHERE v.cd_paciente IN (
            SELECT DISTINCT x.cd_paciente
            FROM atendime x
            JOIN diagnostico_atendime y ON x.cd_atendimento = y.cd_atendimento
            JOIN cid z ON y.cd_cid = z.cd_cid
            WHERE z.cd_cid IN (
                'C70', 'C71', 'C72', 'C75', 'C700', 'C701', 'C709', 'C710', 
                'C711', 'C712', 'C713', 'C714', 'C715', 'C716', 'C717', 'C718', 
                'C719', 'C720', 'C722', 'C723', 'C724', 'C725', 'C728', 'C729', 
                'C751', 'C752', 'C753', 'D33', 'D330', 'D331', 'D332', 'D333', 
                'D334', 'D337', 'D339', 'D43', 'D430', 'D431', 'D432', 'D433', 
                'D434', 'D437', 'D439'
            )
            --AND v.dt_atendimento BETWEEN :dt_inicial AND :dt_final
            AND v.dt_atendimento BETWEEN to_date('01-01-2025 00:00:00', 'DD-MM-YYYY HH24-MI-SS') AND to_date('25-11-2025 23:59:59', 'DD-MM-YYYY HH24-MI-SS')
            AND v.tp_atendimento = 'A' /* 'I','Internação','E','Externo','U','Urgência','A','Ambulatório' */
            --GROUP BY v.cd_paciente
        )
    )
ORDER BY 
    a.hr_atendimento ASC;

SELECT dt_atendimento FROM atendime 

_________________________________________________________________________________________________________________________________________________________________________

/*
- Explicação:
Objetivo da query: O código é uma consulta SQL para recuperar dados relacionados aos atendimentos de pacientes, incluindo informações sobre diagnósticos, agendamentos e anamnese, especificamente para pacientes com certos tipos de diagnóstico (listados pelo código CID).

- Tabelas envolvidas:
-- atendime: Contém informações sobre o atendimento dos pacientes.
-- it_agenda_central: Relaciona os atendimentos aos agendamentos.
-- paciente: Contém os dados dos pacientes.
-- pw_documento_clinico: Contém registros de documentos clínicos relacionados aos atendimentos.
-- diagnostico_atendime: Relaciona os atendimentos aos diagnósticos.
-- cid: Contém os códigos de diagnósticos (CID).

- Particularidades:
-- A consulta utiliza várias subconsultas para:
    - Obter a data de anamnese, que é a data mínima de criação de documentos clínicos relacionados ao atendimento.
    - Obter o diagnóstico máximo relacionado ao paciente, com base em uma lista específica de CIDs (códigos de diagnósticos).
--  A subconsulta principal filtra os atendimentos para obter apenas o mais recente para cada paciente, considerando diagnósticos específicos entre as datas de :dt_inicial e dt_final.

- Campos selecionados:
-- Informações de paciente como cd_paciente, nm_paciente, e a data de nascimento formatada (dt_nascimento).
-- Dados de agendamento e atendimento, como data e hora de gravação do agendamento (dt_gravacao), hora do agendamento (hr_agenda), e data/hora do atendimento (hr_atendimento).
-- Diferença entre o horário de agendamento e gravação, calculada como dias_agenda.
-- A data da anamnese, extraída do documento clínico mais antigo.
-- O diagnóstico máximo do paciente, baseado em uma lista de CIDs específicos.

- Filtros:
-- Apenas os atendimentos mais recentes são considerados, com base na data de atendimento.
-- O tipo de atendimento é limitado a 'A' (Ambulatório), mas poderia ser expandido para outros tipos como 'I' (Internação), 'E' (Externo), ou 'U' (Urgência).
*/


SELECT 
    c.cd_paciente, 
    c.nm_paciente, 
    TRUNC(c.dt_nascimento) AS dt_nascimento, 
    a.cd_atendimento, 
    TO_CHAR(b.dt_gravacao, 'dd/mm/yyyy hh24:mi') AS dt_gravacao, 
    TO_CHAR(b.hr_agenda, 'dd/mm/yyyy hh24:mi') AS hr_agenda, 
    TRUNC(b.hr_agenda - b.dt_gravacao) AS dias_agenda, 
    TO_CHAR(a.hr_atendimento, 'dd/mm/yyyy hh24:mi') AS hr_atendimento,
    
    TO_CHAR(
        (SELECT MIN(x.dh_criacao)
         FROM pw_documento_clinico x
         WHERE x.cd_atendimento = a.cd_atendimento
           AND x.cd_objeto IN (113, 466)
        ), 'dd/mm/yyyy hh24:mi') AS dt_anamnese,

    (SELECT MAX(z.cd_cid || ' - ' || z.ds_cid)
     FROM atendime x
     JOIN diagnostico_atendime y ON x.cd_atendimento = y.cd_atendimento
     JOIN cid z ON y.cd_cid = z.cd_cid
     WHERE z.cd_cid IN (
         'C70', 'C71', 'C72', 'C75', 'C700', 'C701', 'C709', 'C710', 
         'C711', 'C712', 'C713', 'C714', 'C715', 'C716', 'C717', 'C718', 
         'C719', 'C720', 'C722', 'C723', 'C724', 'C725', 'C728', 'C729', 
         'C751', 'C752', 'C753', 'D33', 'D330', 'D331', 'D332', 'D333', 
         'D334', 'D337', 'D339', 'D43', 'D430', 'D431', 'D432', 'D433', 
         'D434', 'D437', 'D439'
     )
     AND x.cd_paciente = a.cd_paciente
    ) AS ds_cid
FROM 
    atendime a
JOIN it_agenda_central b ON a.cd_atendimento = b.cd_atendimento
JOIN paciente c ON a.cd_paciente = c.cd_paciente
WHERE 
    a.cd_atendimento IN (
        SELECT MAX(v.cd_atendimento)
        FROM atendime v
        WHERE v.cd_paciente IN (
            SELECT DISTINCT x.cd_paciente
            FROM atendime x
            JOIN diagnostico_atendime y ON x.cd_atendimento = y.cd_atendimento
            JOIN cid z ON y.cd_cid = z.cd_cid
            WHERE z.cd_cid IN (
                'C70', 'C71', 'C72', 'C75', 'C700', 'C701', 'C709', 'C710', 
                'C711', 'C712', 'C713', 'C714', 'C715', 'C716', 'C717', 'C718', 
                'C719', 'C720', 'C722', 'C723', 'C724', 'C725', 'C728', 'C729', 
                'C751', 'C752', 'C753', 'D33', 'D330', 'D331', 'D332', 'D333', 
                'D334', 'D337', 'D339', 'D43', 'D430', 'D431', 'D432', 'D433', 
                'D434', 'D437', 'D439'
            )
            AND v.dt_atendimento BETWEEN :dt_inicial AND :dt_final
            AND v.tp_atendimento = 'A' /* 'I','Internação','E','Externo','U','Urgência','A','Ambulatório' */
            GROUP BY v.cd_paciente
        )
    )
ORDER BY 
    a.hr_atendimento ASC;


____________________________________________________________________________________________________________________________

Estrutura da Query:
1. Selecionando os dados principais:
A primeira parte da query seleciona as colunas que retornam os dados de interesse. Os dados incluem informações do paciente, atendimento, agendamento e diagnóstico.

SELECT 
    c.cd_paciente, 
    c.nm_paciente, 
    TRUNC(c.dt_nascimento) AS dt_nascimento, 
    a.cd_atendimento, 
    TO_CHAR(b.dt_gravacao, 'dd/mm/yyyy hh24:mi') AS dt_gravacao, 
    TO_CHAR(b.hr_agenda, 'dd/mm/yyyy hh24:mi') AS hr_agenda, 
    TRUNC(b.hr_agenda - b.dt_gravacao) AS dias_agenda, 
    TO_CHAR(a.hr_atendimento, 'dd/mm/yyyy hh24:mi') AS hr_atendimento,

cd_paciente, nm_paciente: Código e nome do paciente.
dt_nascimento: A data de nascimento do paciente, truncada (removendo a parte da hora).
cd_atendimento: Código do atendimento.
dt_gravacao: Data e hora de gravação do agendamento, formatada.
hr_agenda: Data e hora do agendamento, também formatada.
dias_agenda: Diferença em dias entre o agendamento e a gravação.
hr_atendimento: Data e hora do atendimento formatada.


2. Subconsultas:
Subconsulta 1: dt_anamnese
Aqui, a subconsulta seleciona a data mínima de criação de um documento clínico relacionado ao atendimento. A subconsulta retorna o primeiro documento clínico com um dos códigos de objeto especificados (113 e 466).

TO_CHAR(
    (SELECT MIN(x.dh_criacao)
     FROM pw_documento_clinico x
     WHERE x.cd_atendimento = a.cd_atendimento
       AND x.cd_objeto IN (113, 466)
    ), 'dd/mm/yyyy hh24:mi') AS dt_anamnese,

Objetivo: Obter a data de criação do primeiro documento clínico relacionado ao atendimento.
Tabela usada: pw_documento_clinico, que contém os registros de documentos clínicos.
Filtragem: A subconsulta filtra apenas os documentos com os objetos 113 e 466, que podem ser identificadores para tipos específicos de documentos.

Subconsulta 2: ds_cid
A segunda subconsulta retorna o diagnóstico do paciente baseado nos códigos CID (Classificação Internacional de Doenças). A consulta verifica se algum diagnóstico corresponde aos CIDs listados, com um JOIN entre as tabelas atendime, diagnostico_atendime, e cid.

(SELECT MAX(z.cd_cid || ' - ' || z.ds_cid)
 FROM atendime x
 JOIN diagnostico_atendime y ON x.cd_atendimento = y.cd_atendimento
 JOIN cid z ON y.cd_cid = z.cd_cid
 WHERE z.cd_cid IN (
     'C70', 'C71', 'C72', 'C75', 'C700', 'C701', 'C709', 'C710', 
     'C711', 'C712', 'C713', 'C714', 'C715', 'C716', 'C717', 'C718', 
     'C719', 'C720', 'C722', 'C723', 'C724', 'C725', 'C728', 'C729', 
     'C751', 'C752', 'C753', 'D33', 'D330', 'D331', 'D332', 'D333', 
     'D334', 'D337', 'D339', 'D43', 'D430', 'D431', 'D432', 'D433', 
     'D434', 'D437', 'D439'
 )
 AND x.cd_paciente = a.cd_paciente
) AS ds_cid


Objetivo: Recuperar o diagnóstico relacionado ao atendimento do paciente, incluindo o código CID e a descrição.
Filtragem: A lista de CIDs usada para filtrar os diagnósticos é extensa, cobrindo tipos específicos de câncer e outras doenças.
JOINs:
atendime x: Relaciona o atendimento.
diagnostico_atendime y: Relaciona o diagnóstico ao atendimento.
cid z: Tabela que contém as informações sobre os CIDs.

3. Filtragem Principal:
A cláusula WHERE é responsável por definir quais atendimentos serão selecionados. Basicamente, ela garante que:
   O atendimento é o mais recente para cada paciente, dado pelo filtro MAX(v.cd_atendimento).
   O paciente tem diagnósticos com CIDs específicos.
   O atendimento ocorre dentro do intervalo de datas determinado pelos parâmetros :dt_inicial e :dt_final.

WHERE 
    a.cd_atendimento IN (
        SELECT MAX(v.cd_atendimento)
        FROM atendime v
        WHERE v.cd_paciente IN (
            SELECT DISTINCT x.cd_paciente
            FROM atendime x
            JOIN diagnostico_atendime y ON x.cd_atendimento = y.cd_atendimento
            JOIN cid z ON y.cd_cid = z.cd_cid
            WHERE z.cd_cid IN (
                'C70', 'C71', 'C72', 'C75', 'C700', 'C701', 'C709', 'C710', 
                'C711', 'C712', 'C713', 'C714', 'C715', 'C716', 'C717', 'C718', 
                'C719', 'C720', 'C722', 'C723', 'C724', 'C725', 'C728', 'C729', 
                'C751', 'C752', 'C753', 'D33', 'D330', 'D331', 'D332', 'D333', 
                'D334', 'D337', 'D339', 'D43', 'D430', 'D431', 'D432', 'D433', 
                'D434', 'D437', 'D439'
            )
            AND v.dt_atendimento BETWEEN :dt_inicial AND :dt_final
            AND v.tp_atendimento = 'A' 
            GROUP BY v.cd_paciente
        )
    )


Objetivo: Selecionar os atendimentos mais recentes de pacientes com diagnósticos específicos dentro do intervalo de datas fornecido.
Subconsulta: A subconsulta interna garante que a seleção dos atendimentos seja feita apenas para os pacientes que atendem aos critérios de CID.


4. Ordenação:
Por fim, a consulta é ordenada pela data e hora do atendimento:

ORDER BY 
    a.hr_atendimento ASC;

Objetivo: Organizar os resultados em ordem crescente de hora de atendimento.

Resumo:
A query é uma consulta complexa que busca informações detalhadas sobre atendimentos, agendamentos e diagnósticos de pacientes com certos CIDs. 
Ela utiliza subconsultas para recuperar dados sobre a anamnese e os diagnósticos, garantindo que apenas os atendimentos mais recentes de pacientes com 
os CIDs especificados e dentro de um intervalo de datas determinado sejam selecionados.









____________________________________________________________________________________________________________________________

SELECT 
    c.cd_paciente,                          -- 1. Retorna o código único do paciente da tabela 'paciente' (c).
    c.nm_paciente,                          -- 2. Retorna o nome completo do paciente da tabela 'paciente' (c).
    TRUNC(c.dt_nascimento) AS dt_nascimento, -- 3. Retorna a data de nascimento do paciente truncada (remove a parte de hora, minuto e segundo).
    a.cd_atendimento,                       -- 4. Retorna o código único do atendimento da tabela 'atendime' (a).
    TO_CHAR(b.dt_gravacao, 'dd/mm/yyyy hh24:mi') AS dt_gravacao, -- 5. Formata a data de gravação de 'it_agenda_central' (b) para o formato 'dd/mm/yyyy hh24:mi'.
    TO_CHAR(b.hr_agenda, 'dd/mm/yyyy hh24:mi') AS hr_agenda,     -- 6. Formata a hora agendada de 'it_agenda_central' (b) para o formato 'dd/mm/yyyy hh24:mi'.
    TRUNC(b.hr_agenda - b.dt_gravacao) AS dias_agenda, -- 7. Calcula a diferença em **dias** entre a hora agendada e a data de gravação. A função `TRUNC` remove a parte de horas/minutos.
    TO_CHAR(a.hr_atendimento, 'dd/mm/yyyy hh24:mi') AS hr_atendimento, -- 8. Formata a hora de atendimento de 'atendime' (a) para o formato 'dd/mm/yyyy hh24:mi'.

    -- 9. Subconsulta para obter a menor data de criação dos documentos clínicos associados ao atendimento atual
    TO_CHAR(
        (
            SELECT MIN(x.dh_criacao) 
            FROM pw_documento_clinico x 
            WHERE x.cd_atendimento = a.cd_atendimento  -- 9.1 Filtra documentos clínicos que pertencem ao atendimento específico
            AND x.cd_objeto IN (113, 466)              -- 9.2 Filtra apenas os documentos com códigos 113 e 466 (presumivelmente relacionados a anamnese)
        ),
        'dd/mm/yyyy hh24:mi'
    ) AS dt_anamnese, -- 9.3 Formata a data mínima de criação do documento clínico como 'dd/mm/yyyy hh24:mi'

    -- 10. Subconsulta para obter o CID e a descrição associada
    (
        SELECT MAX(z.cd_cid || ' - ' || z.ds_cid)  -- 10.1 Concatena o código do CID e a descrição.
        FROM atendime x 
        JOIN diagnostico_atendime y ON x.cd_atendimento = y.cd_atendimento -- 10.2 Junta as tabelas 'atendime' e 'diagnostico_atendime' para obter os diagnósticos.
        JOIN cid z ON y.cd_cid = z.cd_cid -- 10.3 Junta com a tabela 'cid' para obter a descrição do CID.
        WHERE z.cd_cid IN (               -- 10.4 Filtra os CIDs relevantes que estão na lista fornecida.
            'C70','C71','C72','C75','C700','C701','C709','C710','C711','C712',
            'C713','C714','C715','C716','C717','C718','C719','C720','C722','C723',
            'C724','C725','C728','C729','C751','C752','C753','D33','D330','D331',
            'D332','D333','D334','D337','D339','D43','D430','D431','D432','D433',
            'D434','D437','D439'
        ) 
        AND x.cd_paciente = a.cd_paciente   -- 10.5 Filtra os diagnósticos para o paciente atual (com base em 'cd_paciente')
    ) AS ds_cid  -- 10.6 Retorna o CID concatenado com a descrição do diagnóstico.

FROM 
    atendime a  -- 11. A consulta começa pela tabela 'atendime' (aliased como 'a').
JOIN it_agenda_central b ON a.cd_atendimento = b.cd_atendimento  -- 12. Junta a tabela 'it_agenda_central' (aliased como 'b') com a tabela de atendimentos, usando o código do atendimento.
JOIN paciente c ON a.cd_paciente = c.cd_paciente  -- 13. Junta a tabela 'paciente' (aliased como 'c') com a tabela de atendimentos, usando o código do paciente.

WHERE 
    a.cd_atendimento IN (
        -- 14. Subconsulta para selecionar o último atendimento de cada paciente (máximo código de atendimento).
        SELECT MAX(v.cd_atendimento) 
        FROM atendime v
        WHERE v.cd_paciente IN (
            -- 15. Subconsulta interna que filtra os pacientes com diagnósticos de CIDs específicos dentro de um intervalo de datas.
            SELECT DISTINCT(x.cd_paciente) 
            FROM atendime x 
            JOIN diagnostico_atendime y ON x.cd_atendimento = y.cd_atendimento  -- 15.1 Junta as tabelas de 'atendime' e 'diagnostico_atendime'.
            JOIN cid z ON y.cd_cid = z.cd_cid  -- 15.2 Junta a tabela 'cid' para obter as informações sobre o CID.
            WHERE z.cd_cid IN (                -- 15.3 Filtra pacientes com CIDs relevantes (lista de códigos CID específicos).
                'C70','C71','C72','C75','C700','C701','C709','C710','C711','C712',
                'C713','C714','C715','C716','C717','C718','C719','C720','C722','C723',
                'C724','C725','C728','C729','C751','C752','C753','D33','D330','D331',
                'D332','D333','D334','D337','D339','D43','D430','D431','D432','D433',
                'D434','D437','D439'
            ) 
            AND v.dt_atendimento BETWEEN :dt_inicial AND :dt_final  -- 15.4 Filtra os atendimentos que ocorreram entre as datas fornecidas.
            AND v.tp_atendimento = 'A'  -- 15.5 Filtra os atendimentos do tipo 'A' (Ambulatório).
            GROUP BY v.cd_paciente -- 15.6 Agrupa os resultados por paciente, para garantir que o último atendimento de cada paciente seja selecionado.
        )
    )

ORDER BY 
    a.hr_atendimento ASC; -- 16. Ordena os resultados pela hora do atendimento de forma ascendente (do mais antigo para o mais recente).


_____________________________________________________________________________________________________________________________________________



Explicação Linha por Linha
1. Seleção dos dados do paciente
c.cd_paciente,                          -- Retorna o código único do paciente da tabela 'paciente' (c).
c.nm_paciente                           -- Retorna o nome completo do paciente da tabela 'paciente' (c).

cd_paciente e nm_paciente retornam o código e nome do paciente, respectivamente. Esses dados são provenientes da tabela paciente (aliased como c).

2. Data de nascimento truncada
TRUNC(c.dt_nascimento) AS dt_nascimento, -- Trunca a data de nascimento do paciente (removendo horas, minutos e segundos).

TRUNC(c.dt_nascimento) remove a parte de hora, minuto e segundo da data de nascimento do paciente, retornando apenas a data.

3. Informações do atendimento e agendamento
a.cd_atendimento,                       -- Retorna o código único do atendimento da tabela 'atendime' (a).
TO_CHAR(b.dt_gravacao, 'dd/mm/yyyy hh24:mi') AS dt_gravacao, -- Converte a data de gravação da agenda para o formato 'dd/mm/yyyy hh24:mi'.
TO_CHAR(b.hr_agenda, 'dd/mm/yyyy hh24:mi') AS hr_agenda,     -- Converte a hora agendada para o formato 'dd/mm/yyyy hh24:mi'.
TRUNC(b.hr_agenda - b.dt_gravacao) AS dias_agenda, -- Calcula a diferença em dias entre a hora agendada e a data de gravação.
TO_CHAR(a.hr_atendimento, 'dd/mm/yyyy hh24:mi') AS hr_atendimento, -- Converte a hora do atendimento para o formato 'dd/mm/yyyy hh24:mi'.


Essas linhas recuperam informações sobre o atendimento e o agendamento do paciente. O formato de data e hora é padronizado para dd/mm/yyyy hh24:mi usando a função TO_CHAR.

A diferença entre b.hr_agenda e b.dt_gravacao é calculada em dias usando a função TRUNC.

4. Subconsulta para a data de anamnese
TO_CHAR(
    (SELECT MIN(x.dh_criacao)
    FROM pw_documento_clinico x 
    WHERE x.cd_atendimento = a.cd_atendimento
    AND x.cd_objeto IN (113, 466)), 'dd/mm/yyyy hh24:mi') AS dt_anamnese,

Esta subconsulta retorna a menor data de criação (MIN(x.dh_criacao)) de documentos clínicos associados ao atendimento atual (a.cd_atendimento), filtrados para objetos específicos (113, 466). O valor é formatado como dd/mm/yyyy hh24:mi.

5. Subconsulta para o CID
(
    SELECT MAX(z.cd_cid || ' - ' || z.ds_cid)
    FROM atendime x 
    JOIN diagnostico_atendime y ON x.cd_atendimento = y.cd_atendimento 
    JOIN cid z ON y.cd_cid = z.cd_cid
    WHERE z.cd_cid IN (...) 
    AND x.cd_paciente = a.cd_paciente
) AS ds_cid


A subconsulta encontra o diagnóstico CID do paciente, concatenando o código CID com a descrição do CID.

Filtra para um conjunto específico de CIDs relevantes (como C70, C71, etc.) e garante que os resultados sejam para o paciente associado ao atendimento atual.

6. Subconsulta para encontrar o último atendimento do paciente
a.cd_atendimento IN (
    SELECT MAX(v.cd_atendimento)
    FROM atendime v
    WHERE v.cd_paciente IN (
        SELECT DISTINCT(x.cd_paciente) 
        FROM atendime x 
        JOIN diagnostico_atendime y ON x.cd_atendimento = y.cd_atendimento 
        JOIN cid z ON y.cd_cid = z.cd_cid 
        WHERE z.cd_cid IN (...)
        AND v.dt_atendimento BETWEEN :dt_inicial AND :dt_final
        AND v.tp_atendimento = 'A'
        GROUP BY v.cd_paciente
    )
)


A subconsulta encontra o último atendimento (usando MAX(v.cd_atendimento)) para cada paciente que tenha um diagnóstico com um dos CIDs específicos dentro de um intervalo de datas definido (:dt_inicial e :dt_final).

7. Ordenação do resultado
ORDER BY a.hr_atendimento ASC;

Finalmente, a consulta ordena os resultados pela hora do atendimento (a.hr_atendimento) de forma crescente (ASC), ou seja, da consulta mais antiga para a mais recente.

Conclusão:
Essa consulta SQL está projetada para retornar informações detalhadas sobre atendimentos médicos, incluindo dados do paciente, agendamentos, diagnósticos de CIDs específicos e documentos clínicos relacionados. Ela utiliza subconsultas para recuperar informações adicionais como a data da anamnese e os últimos atendimentos dos pacientes, tudo com base em critérios específicos de CIDs e datas.