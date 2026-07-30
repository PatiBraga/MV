-- Conferir antes quais linhas serão alteradas
SELECT *    -- cd_ped_rx, cd_itped_rx,cd_prestador
FROM itped_rx
WHERE cd_ped_rx = 222113                  -- IN ('218810', '218858', '218872')


SELECT *
FROM ped_rx
WHERE cd_atendimento = '1130208' AND cd_ped_rx = '222113'

                     1130254 AND  222139

SELECT *
FROM itped_rx
WHERE cd_ped_rx in ('222113','222139','218810','218858')

 AND cd_exa_rx = '1111'


SELECT *
FROM itped_rx
WHERE cd_ped_rx IN ('222113', '222117','222107')


--------------------------------------------------------

-- Desabilitar o trigger
ALTER TRIGGER mvintegra.trg_imvw_sai_itsolic_psdi DISABLE;


-- Atualizar cd_ped_rx para 3674 apenas nas combinações desejadas
UPDATE itped_rx
   SET cd_prestador = '3881'
 WHERE cd_ped_rx = '222107'
   AND cd_exa_rx = '1111';

-- Para reabilitar quando necessário
ALTER TRIGGER mvintegra.trg_imvw_sai_itsolic_psdi ENABLE;


-- Após executar, valide o status com:
SELECT trigger_name,
       status
  FROM all_triggers
 WHERE trigger_name = 'TRG_IMVW_SAI_ITSOLIC_PSDI'
   AND owner        = 'MVINTEGRA';


--------------------------------------------------------






