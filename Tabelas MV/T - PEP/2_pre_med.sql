




                SELECT Dbms_Lob.SubStr (pre_med.ds_evolucao , 4000, 1)  AS ds_evolucao_txt
                FROM pre_med
                WHERE pre_med.cd_objeto = 411
                AND cd_pre_med = 1
                AND pre_med.cd_atendimento = 2








                    SELECT nm_mae
                    FROM paciente , atendime
                    WHERE  paciente.cd_paciente = atendime.cd_paciente
                   and atendime.cd_atendimento = &<PAR_CD_ATENDIMENTO>