-- Atualiza fornecedor

BEGIN


   -- 2. Atualiza o Fornecedor no Processo
   UPDATE dbamv.processo_consignado
   SET cd_fornecedor = :novo_cd_fornecedor
   WHERE cd_processo = :processo;

   -- 3. Atualiza o Fornecedor na Entrada que originou o processo
   -- (Isso é crucial para o recebimento da NF)
   UPDATE dbamv.ent_psdi
   SET cd_fornecedor = :novo_cd_fornecedor
   WHERE cd_ent_psdi = (SELECT cd_ent_psdi
                        FROM dbamv.processo_consignado
                        WHERE cd_processo = :processo);

   COMMIT;

   DBMS_OUTPUT.PUT_LINE('Fornecedor alterado com sucesso!');
END;