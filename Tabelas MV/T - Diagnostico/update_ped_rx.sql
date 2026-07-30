UPDATE ped_rx
SET cd_prestador = (SELECT cd_pres_ext
                    FROM prestador_externo
                    WHERE prestador_externo.cd_pres_ext = '4603')
WHERE cd_ped_rx = '162780' AND cd_atendimento = '1019774';

/* Realizar um UPDATE na tabela ped_rx com base na informação do prestador que está na tabela prestador_externo
-- ped_rx \ prestador_externo.

-- UPDATE - prestador_externo para atualizar a tabela ped_rx.

1. A tabela ped_rx possui a coluna cd_prestador, que você deseja atualizar com base nos dados da tabela prestador_externo.
2. A tabela prestador_externo tem o campo cd_pres_ext como a chave que você está usando para fazer a correspondência entre as tabelas.
3. Você deseja atualizar a tabela ped_rx, substituindo o valor de cd_prestador com o valor de cd_pres_ext da tabela prestador_externo para os 
registros que correspondem ao cd_pres_ext = 4603.

Explicação:

1. Subconsulta no SET: A subconsulta dentro do SET seleciona o valor cd_pres_ext da tabela prestador_externo onde cd_pres_ext = 4603. O valor retornado por 
essa subconsulta será usado para atualizar a coluna cd_prestador da tabela ped_rx.
2. WHERE: A condição WHERE cd_ped_rx = '162780' AND cd_atendimento = '1019774' garante que o UPDATE será realizado apenas no registro específico da tabela 
ped_rx que corresponde a esses valores de cd_ped_rx e cd_atendimento.

Considerações:
- Chave estrangeira: Certifique-se de que o valor '4603' existe na tabela prestador_externo. Caso contrário, o comando UPDATE pode gerar um erro ou não 
atualizar nada, já que a subconsulta não retornaria um valor válido.

- Garantir que a subconsulta retorna apenas um valor: A subconsulta deve garantir que existe exatamente um valor correspondente em prestador_externo para o 
cd_pres_ext = 4603. Se a subconsulta retornar mais de um valor, o UPDATE falhará. 
Certifique-se de que a chave cd_pres_ext na tabela prestador_externo seja única.
*/

UPDATE ped_rx
SET cd_prestador = (SELECT cd_pres_ext 
                    FROM prestador_externo 
                    WHERE cd_pres_ext = 4603 AND),
    nr_crm_prestador = (SELECT nr_conselho 
                        FROM prestador_externo 
                        WHERE nr_conselho = 28843)
WHERE cd_ped_rx = '162780' AND cd_atendimento = '1019774';


SELECT *
FROM ped_rx
WHERE  cd_ped_rx = 162780;



cd_prestador  e nr_crm_prestador




codigo 4603 
NR 28843


nr_crm_prestador = '28843'

 
UPDATE ped_rx
SET cd_prestador = '4603', nr_crm_prestador = '28843'  
WHERE cd_ped_rx = '162780' and cd_atendimento = '1019774';



SELECT * FROM prestador_externo
WHERE cd_pres_ext = 4603 AND nr_conselho = 28843;



ALTER TABLE ped_rx  DISABLE CONSTRAINT DBAMV.PED_RX_PRESTADOR_FK;


UPDATE ped_rx
SET cd_prestador = '4603'  
WHERE cd_ped_rx = '162780' and cd_atendimento = '1019774'
