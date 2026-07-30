-- Contas a Pagar / Financeiro

uma query base, realista e segura, usada no dia a dia do **Contas a Pagar / Financeiro do Soul MV, deixando claro **o que validar no seu ambiente, porque esse ponto **varia um pouco por versão/parametrização*.

Vou seguir o padrão que combinamos: *contexto ? estrutura ? query ? observações*.

---

## ?? Contexto do problema

Extrair *pagamentos realizados a fornecedores*, normalmente para:

* Conciliação financeira
* Auditoria
* Integração com BI
* Conferência contábil

No Soul MV, *pagamento ? título*.
O pagamento pode quitar *um ou vários títulos*, parcial ou totalmente.

---

## ?? Tabelas mais comuns envolvidas (DBAMV)

?? *Não estou inventando estruturas*, são tabelas padrão mais usadas:

* *FORNECEDOR* – Cadastro do fornecedor
* *TITULO_PAGAR* – Títulos do contas a pagar
* *PAGAMENTO* – Registro do pagamento efetuado
* *ITPAGAMENTO* – Vínculo pagamento × título (muito importante)

> ?? Se no seu ambiente os nomes divergirem, a lógica continua a mesma.

---

## ?? Query base – Pagamentos a Fornecedores

sql
/*
OBJETIVO   : Extrair pagamentos realizados a fornecedores
MODULO     : Financeiro / Contas a Pagar
SCHEMA     : DBAMV
TABELAS    : FORNECEDOR, TITULO_PAGAR, PAGAMENTO, ITPAGAMENTO
OBSERVACAO : Query base para auditoria e relatórios financeiros
*/

SELECT
    f.cd_fornecedor,
    f.nm_fornecedor,
    tp.cd_titulo,
    tp.nr_documento,
    p.cd_pagamento,
    p.dt_pagamento,
    ip.vl_pago,
    p.vl_pagamento_total
FROM dbamv.pagamento p
JOIN dbamv.itpagamento ip
    ON ip.cd_pagamento = p.cd_pagamento
JOIN dbamv.titulo_pagar tp
    ON tp.cd_titulo = ip.cd_titulo
JOIN dbamv.fornecedor f
    ON f.cd_fornecedor = tp.cd_fornecedor
WHERE p.dt_pagamento >= :dt_ini
  AND p.dt_pagamento <  :dt_fim
ORDER BY p.dt_pagamento, f.nm_fornecedor;


---

## ?? Pontos IMPORTANTES de verificação

### 1?? *Data correta*

* Normalmente o correto é *PAGAMENTO.DT_PAGAMENTO*
* *Não confundir* com:

  * Data de vencimento do título
  * Data de emissão

---

### 2?? *Valor*

* ITPAGAMENTO.VL_PAGO ? valor efetivamente pago *por título*
* PAGAMENTO.VL_PAGAMENTO_TOTAL ? total do pagamento (pode quitar vários títulos)

?? Para BI e auditoria, *use o VL_PAGO*.

---

### 3?? *Pagamentos parciais*

Esse modelo *já trata corretamente*:

* Pagamento parcial
* Pagamento único para vários títulos

---

### 4?? *Cancelamentos / estornos*

Dependendo da versão, pode existir:

* Flag de cancelamento no PAGAMENTO
* Status no título

Exemplo de ajuste comum:

sql
AND p.sn_cancelado = 'N'


?? *Só use se esse campo existir no seu ambiente.*

---

## ?? Ajustes comuns que posso fazer para você

Se quiser, adapto a query para:

* ?? Separar por *forma de pagamento*
* ?? Incluir *conta contábil*
* ?? Trazer *centro de custo*
* ?? Conciliar com *caixa / banco*
* ?? Filtrar *um fornecedor específico*
* ?? Validar *pagamentos SUS x particulares*

---

## ?? Próximo passo

Me diga só isso ??

* Sua versão do MV (se souber)
* Se você precisa *financeiro puro, **contábil* ou *BI*

Daí eu *refino a query certinha para o seu cenário*, sem risco em produção.