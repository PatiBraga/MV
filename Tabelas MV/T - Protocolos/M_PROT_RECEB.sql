SELECT * FROM dbamv.it_protocolo_doc i WHERE cd_protocolo_doc = 97311  -- ORDER BY 1 desc
AND NOT EXISTS (SELECT 1 FROM atendime a WHERE a.cd_atendimento = i.cd_atendimento)


 SELECT * FROM itreg_amb WHERE cd_reg_amb = 1111064

 SELECT * FROM dbamv.it_protocolo_doc i WHERE  cd_atendimento =  1104776


 SELECT * FROM atendime WHERE cd_atendimento =  1104776
             --  6024776
  UPDATE dbamv.it_protocolo_doc
  SET cd_atendimento = 1038294
  WHERE cd_it_protocolo_doc = 1052067



 SELECT * FROM itreg_amb WHERE cd_reg_amb = 1040319


  SELECT * FROM dbamv.it_protocolo_doc i WHERE cd_protocolo_doc = 93112   -- ORDER BY 1 desc
AND NOT EXISTS (SELECT 1 FROM atendime a WHERE a.cd_atendimento = i.cd_atendimento)


  SELECT * FROM dbamv.protocolo_doc i WHERE cd_protocolo_doc IN (96875,97311)