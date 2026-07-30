-- DELETE FROM REPASSE_IMAGEM_SW
  --  WHERE tuss = '41001117'
   -- AND convenio = 8
-- AND vl_total = '494,10';



-- INSERT INTO REPASSE_IMAGEM_SW (TUSS, CONVENIO, VL_TOTAL)
-- VALUES ('41001117', '8', '494,10');


🔎 Visão geral
-- Tabela REPASSE_IMAGEM_SW possui as colunas:
• TUSS
• CONVENIO
• VL_TOTAL

-- Para impedir que o mesmo par (TUSS, CONVENIO) seja inserido mais de uma vez, você precisa criar uma unique constraint composta.

🔒 Como criar a constraint
ALTER TABLE REPASSE_IMAGEM_SW
ADD CONSTRAINT UK_REPASSE_IMG_TUSS_CONV
UNIQUE (TUSS, CONVENIO);
 0
-- 🧠 Explicação detalhada (frase‑a‑frase)
• O comando ALTER TABLE abre a modificação da tabela existente.
• ADD CONSTRAINT indica que você está adicionando uma nova regra.
• O nome UK_REPASSE_IMG_TUSS_CONV serve para identificar a constraint (pode ser outro nome).
• UNIQUE (TUSS, CONVENIO) significa que a combinação dos dois valores deve ser única.
• Assim, é permitido repetir TUSS em convênios diferentes.
• Mas não é permitido repetir TUSS dentro do mesmo CONVENIO.
• Caso tente inserir duplicado, o banco lançará erro automaticamente.

-- 🔍 Verificação de duplicidades antes de criar a constraint
SELECT TUSS,
       CONVENIO,
       COUNT(*) AS QTD
FROM REPASSE_IMAGEM_SW
GROUP BY TUSS, CONVENIO
HAVING COUNT(*) > 1;
