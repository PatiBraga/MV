SELECT * FROM mov_int WHERE  cd_atendimento  = '1011298';


SELECT * FROM itmvto_conta WHERE  cd_atendimento  = '1011298';

SELECT * FROM reg_fat WHERE cd_atendimento = '1011298';


SELECT * FROM reg_amb WHERE cd_atendimento = '1011292';


SELECT * FROM remessa_fatura WHERE cd_remessa = '207680';   --  207680


SELECT Max(dt_abertura) FROM remessa_fatura WHERE  To_Char(dt_abertura , 'DD/MM/YYYY HH24:MI:SS') < '18.09.2201 00:00:00';
-- 09.12.2025


SELECT * FROM itreg_amb  ;


SELECT * FROM itreg_fat;

SELECT * FROM con_rec WHERE cd_atendimento = '1011292';

SELECT * FROM itcon_rec WHERE cd_con_rec = '1011298' ;


SELECT * FROM con_pag WHERE  cd_atendimento = '1011292';


SELECT * FROM remessa_fatura ;
-- nr_lote
-- sn_fechada


SELECT * FROM atendime WHERE cd_atendimento = '1113509';

SELECT * FROM con_rec WHERE cd_atendimento = '1072065' and cd_remessa = '216414';

SELECT * FROM  canc_reg_amb WHERE cd_atendimento = '1113509';

SELECT * FROM remessa_fatura WHERE cd_atendimento =   '1072065';