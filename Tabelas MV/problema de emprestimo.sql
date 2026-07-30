DECLARE
   CURSOR citlotent
   IS
      SELECT i.cd_itent_pro, i.cd_uni_pro, i.qt_entrada
        FROM dbamv.itent_pro i, dbamv.itlot_ent l
       WHERE i.cd_ent_pro = 34425                             -- código da entrada
         AND i.cd_produto = 9520                           -- código do produto
         AND i.cd_itent_pro = l.cd_itent_pro (+)
         AND nvl(i.qt_entrada,0 ) <> nvl(l.qt_ent_pro,0);


   vitlotent     citlotent%ROWTYPE;
   vcditlotent   NUMBER;
BEGIN
   pkg_mv2000.atribui_empresa (1);  -- Informa empresa

   SELECT seq_t_itlot_ent.NEXTVAL
     INTO vcditlotent
     FROM DUAL;

   OPEN citlotent;
   FETCH citlotent INTO vitlotent;
   CLOSE citlotent;

   INSERT INTO dbamv.itlot_ent
               (cd_itlot_ent, cd_itent_pro, cd_lote,
                dt_validade, qt_ent_pro, cd_uni_pro
               )
        VALUES (vcditlotent, vitlotent.cd_itent_pro, '2040',          -- Lote
                TO_DATE ('30/10/2023', 'dd/mm/yyyy'),              -- Validade
                 vitlotent.qt_entrada,  -- Quantidade do lote
                vitlotent.cd_uni_pro
               );
commit;
END;



4002 - recepcao

92360

ATD.2452015 CONTA: 5373979 E ATD. 2431622 CONTA : 5373233 CONVENIO GEAP

534472

alan- 4001

4555

avenida expedicionários  4681

OS 99164

Adriana

