--movdoc

--unico protocolo
SELECT * FROM it_protocolo_doc
WHERE cd_atendimento = 1000638


DELETE FROM it_protocolo_doc
WHERE cd_atendimento = 942977


--- quando existe mais de um e é necessário excluir um dos dois.
SELECT * FROM it_protocolo_doc
WHERE cd_reg_fat = 95809


DELETE it_protocolo_doc
WHERE cd_atendimento = 926515 and 
cd_it_protocolo_doc = 935212

SELECT * FROM   it_protocolo_doc

SELECT cd_atendimento, cd_protocolo_doc, cd_reg_fat
FROM it_protocolo_doc
WHERE cd_atendimento = 851846;   

---------------------------------------------

DELETE FROM it_protocolo_doc
WHERE cd_atendimento = '851846'
      AND cd_protocolo_doc = '80682'  
      AND cd_reg_fat = ''; 



/* Era bom vc fazer uma conta e validar com a solicitante se esta correto no sentido de não precisar 
excluir de mais nenhuma tabela mas acho q nao eu quando eu fiz eu confirmei com a solicitanta */


-- mais de um atendimento
-- SELECT que traz apenas os pares (cd_atendimento, cd_reg_fat)
SELECT DISTINCT cd_atendimento, cd_reg_fat
FROM it_protocolo_doc
WHERE
    (cd_atendimento = 1002413 AND cd_reg_fat = 101476) OR
    (cd_atendimento = 1004044 AND cd_reg_fat = 101555) OR
    (cd_atendimento = 1011861 AND cd_reg_fat = 1013871) OR
    (cd_atendimento = 1020252 AND cd_reg_fat = 102453) OR
    (cd_atendimento = 660786 AND cd_reg_fat = 75512) OR
    (cd_atendimento = 665846 AND cd_reg_fat = 75853) OR
    (cd_atendimento = 665846 AND cd_reg_fat = 680530) OR
    (cd_atendimento = 701602 AND cd_reg_fat = 78690) OR
    (cd_atendimento = 706176 AND cd_reg_fat = 78828) OR
    (cd_atendimento = 708806 AND cd_reg_fat = 79011) OR
    (cd_atendimento = 716326 AND cd_reg_fat = 79572) OR
    (cd_atendimento = 727563 AND cd_reg_fat = 80430) OR
    (cd_atendimento = 736736 AND cd_reg_fat = 81100) OR
    (cd_atendimento = 747740 AND cd_reg_fat = 81978) OR
    (cd_atendimento = 813147 AND cd_reg_fat = 86669) OR
    (cd_atendimento = 837003 AND cd_reg_fat = 832890) OR
    (cd_atendimento = 837859 AND cd_reg_fat = 88519) OR
    (cd_atendimento = 841051 AND cd_reg_fat = 836994) OR
    (cd_atendimento = 851846 AND cd_reg_fat = 89530) OR
    (cd_atendimento = 855054 AND cd_reg_fat = 89800) OR
    (cd_atendimento = 860903 AND cd_reg_fat = 90295) OR
    (cd_atendimento = 861045 AND cd_reg_fat = 857367) OR
    (cd_atendimento = 871090 AND cd_reg_fat = 867948) OR
    (cd_atendimento = 878013 AND cd_reg_fat = 91779) OR
    (cd_atendimento = 89664 AND cd_reg_fat = 88319) OR
    (cd_atendimento = 907304 AND cd_reg_fat = 904648) OR
    (cd_atendimento = 959880 AND cd_reg_fat = 95896) OR
    (cd_atendimento = 963035 AND cd_reg_fat = 98338) OR
    (cd_atendimento = 970085 AND cd_reg_fat = 98886) OR
    (cd_atendimento = 970101 AND cd_reg_fat = 98887) OR
    (cd_atendimento = 975221 AND cd_reg_fat = 974534) OR
    (cd_atendimento = 985671 AND cd_reg_fat = 985220) OR
    (cd_atendimento = 99939 AND cd_reg_fat = 98169);



-- SELECT, mas sem o DISTINCT — ou seja, ele vai trazer todos os registros correspondentes, inclusive duplicados se existirem:
SELECT cd_atendimento, cd_reg_fat
FROM it_protocolo_doc
WHERE
    (cd_atendimento = 1002413 AND cd_reg_fat = 101476) OR
    (cd_atendimento = 1004044 AND cd_reg_fat = 101555) OR
    (cd_atendimento = 1011861 AND cd_reg_fat = 1013871) OR
    (cd_atendimento = 1020252 AND cd_reg_fat = 102453) OR
    (cd_atendimento = 660786 AND cd_reg_fat = 75512) OR
    (cd_atendimento = 665846 AND cd_reg_fat = 75853) OR
    (cd_atendimento = 665846 AND cd_reg_fat = 680530) OR
    (cd_atendimento = 701602 AND cd_reg_fat = 78690) OR
    (cd_atendimento = 706176 AND cd_reg_fat = 78828) OR
    (cd_atendimento = 708806 AND cd_reg_fat = 79011) OR
    (cd_atendimento = 716326 AND cd_reg_fat = 79572) OR
    (cd_atendimento = 727563 AND cd_reg_fat = 80430) OR
    (cd_atendimento = 736736 AND cd_reg_fat = 81100) OR
    (cd_atendimento = 747740 AND cd_reg_fat = 81978) OR
    (cd_atendimento = 813147 AND cd_reg_fat = 86669) OR
    (cd_atendimento = 837003 AND cd_reg_fat = 832890) OR
    (cd_atendimento = 837859 AND cd_reg_fat = 88519) OR
    (cd_atendimento = 841051 AND cd_reg_fat = 836994) OR
    (cd_atendimento = 851846 AND cd_reg_fat = 89530) OR
    (cd_atendimento = 855054 AND cd_reg_fat = 89800) OR
    (cd_atendimento = 860903 AND cd_reg_fat = 90295) OR
    (cd_atendimento = 861045 AND cd_reg_fat = 857367) OR
    (cd_atendimento = 871090 AND cd_reg_fat = 867948) OR
    (cd_atendimento = 878013 AND cd_reg_fat = 91779) OR
    (cd_atendimento = 89664 AND cd_reg_fat = 88319) OR
    (cd_atendimento = 907304 AND cd_reg_fat = 904648) OR
    (cd_atendimento = 959880 AND cd_reg_fat = 95896) OR
    (cd_atendimento = 963035 AND cd_reg_fat = 98338) OR
    (cd_atendimento = 970085 AND cd_reg_fat = 98886) OR
    (cd_atendimento = 970101 AND cd_reg_fat = 98887) OR
    (cd_atendimento = 975221 AND cd_reg_fat = 974534) OR
    (cd_atendimento = 985671 AND cd_reg_fat = 985220) OR
    (cd_atendimento = 99939 AND cd_reg_fat = 98169);



--  SELECT trazendo somente as colunas cd_atendimento e cd_reg_fat, filtrando apenas pelo cd_atendimento da sua lista, sem se preocupar com cd_reg_fat:
SELECT cd_atendimento, cd_reg_fat
FROM it_protocolo_doc
WHERE cd_atendimento IN (
    1000638,
    1002413,
    1004044,
    1011861,
    1020252,
    660786,
    665846,
    701602,
    706176,
    708806,
    716326,
    727563,
    736736,
    747740,
    813147,
    837003,
    837859,
    841051,
    851846,
    855054,
    860903,
    861045,
    871090,
    878013,
    89664,
    907304,
    959880,
    963035,
    970085,
    970101,
    975221,
    985671,
    99939
);



-- DELETE
DELETE FROM it_protocolo_doc
WHERE
    (cd_atendimento = 1002413 AND cd_reg_fat = 101476) OR
    (cd_atendimento = 1004044 AND cd_reg_fat = 101555) OR
    (cd_atendimento = 1011861 AND cd_reg_fat = 1013871) OR
    (cd_atendimento = 1020252 AND cd_reg_fat = 102453) OR
    (cd_atendimento = 660786 AND cd_reg_fat = 75512) OR
    (cd_atendimento = 665846 AND cd_reg_fat = 75853) OR
    (cd_atendimento = 665846 AND cd_reg_fat = 680530) OR
    (cd_atendimento = 701602 AND cd_reg_fat = 78690) OR
    (cd_atendimento = 706176 AND cd_reg_fat = 78828) OR
    (cd_atendimento = 708806 AND cd_reg_fat = 79011) OR
    (cd_atendimento = 716326 AND cd_reg_fat = 79572) OR
    (cd_atendimento = 727563 AND cd_reg_fat = 80430) OR
    (cd_atendimento = 736736 AND cd_reg_fat = 81100) OR
    (cd_atendimento = 747740 AND cd_reg_fat = 81978) OR
    (cd_atendimento = 813147 AND cd_reg_fat = 86669) OR
    (cd_atendimento = 837003 AND cd_reg_fat = 832890) OR
    (cd_atendimento = 837859 AND cd_reg_fat = 88519) OR
    (cd_atendimento = 841051 AND cd_reg_fat = 836994) OR
    (cd_atendimento = 851846 AND cd_reg_fat = 89530) OR
    (cd_atendimento = 855054 AND cd_reg_fat = 89800) OR
    (cd_atendimento = 860903 AND cd_reg_fat = 90295) OR
    (cd_atendimento = 861045 AND cd_reg_fat = 857367) OR
    (cd_atendimento = 871090 AND cd_reg_fat = 867948) OR
    (cd_atendimento = 878013 AND cd_reg_fat = 91779) OR
    (cd_atendimento = 89664 AND cd_reg_fat = 88319) OR
    (cd_atendimento = 907304 AND cd_reg_fat = 904648) OR
    (cd_atendimento = 959880 AND cd_reg_fat = 95896) OR
    (cd_atendimento = 963035 AND cd_reg_fat = 98338) OR
    (cd_atendimento = 970085 AND cd_reg_fat = 98886) OR
    (cd_atendimento = 970101 AND cd_reg_fat = 98887) OR
    (cd_atendimento = 975221 AND cd_reg_fat = 974534) OR
    (cd_atendimento = 985671 AND cd_reg_fat = 985220) OR
    (cd_atendimento = 99939 AND cd_reg_fat = 98169);


    -- Contas para incluir no chamado 
Atendimento	Conta 	Protocolo
704455	78690	66562
851846	89530	80178
861045	857367	80882
860903	90295	80882
907304	904648	84405
871090	867948	91527
899210	896520	83840
899210	899284	91527
99939	98169	91527
841051	836994	79050
837859	88519	79050
1027693	102990	92211
89664	88319	78615
