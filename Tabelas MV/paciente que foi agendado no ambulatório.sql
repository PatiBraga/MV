-- paciente que foi agendado no ambulatório

Select Agenda_central.Cd_Agenda_Central,
           Agenda_Central.Tp_Agenda,
           Agenda_Central.Cd_Unidade_Atendimento,
           Agenda_Central.Cd_Recurso_Central,
           Agenda_Central.Cd_Prestador,
           Agenda_Central.Cd_Setor,
           Agenda_Central.Dt_Agenda,
           Agenda_Central.Cd_Multi_Empresa,
           Prestador.nm_prestador,
           recurso_central.ds_recurso_central,
           unidade_atendimento.ds_unidade_atendimento,
           setor.nm_setor,
           it_agenda_central.Hr_Agenda,
           it_agenda_central.cd_it_agenda_central,
           It_agenda_central.cd_paciente,
           Nvl(It_agenda_central.nm_paciente, paciente.nm_paciente) nm_paciente,
           Nvl(it_agenda_central.Nr_Fone, paciente.nr_fone) Nr_fone,
           Nvl(it_agenda_central.Dt_Nascimento, Paciente.dt_nascimento) dt_nascimento,
           Nvl(Paciente.email, it_agenda_central.ds_email) ds_email,
           Nvl(it_agenda_central.Tp_Sexo, Paciente.tp_sexo)tp_sexo,
           it_agenda_central.cd_convenio,
           convenio.nm_convenio,
           convenio.tp_convenio,
           it_agenda_central.cd_con_pla,
           con_pla.ds_con_pla,
           it_agenda_central.Cd_Item_Agendamento,
           it_agenda_central.Cd_Ser_Dis,
           it_agenda_central.Cd_Tip_Mar,
           it_agenda_central.Dt_Gravacao,
           '' ds_grupo_agenda,
           ser_dis.ds_ser_dis,
           tip_mar.ds_tip_mar,
           item_agendamento.ds_item_agendamento,
           item_agendamento.tp_item,
           usuarios.nm_usuario Usuario_agendamento
   from dbamv.it_agenda_central,
           dbamv.paciente,
           dbamv.ser_dis,
           dbamv.tip_mar,
           dbamv.convenio,
           dbamv.con_pla,
           dbasgu.usuarios,
           dbamv.agenda_central,
           dbamv.prestador,
           dbamv.Recurso_central,
           dbamv.Unidade_atendimento,
           dbamv.Setor,
           dbamv.Item_agendamento
Where agenda_central.cd_prestador                    = prestador.cd_prestador (+)
    And agenda_central.cd_recurso_central           = recurso_central.cd_recurso_central (+)
    And agenda_central.cd_unidade_atendimento = unidade_atendimento.cd_unidade_atendimento (+)
    And agenda_central.cd_agenda_central          = it_agenda_central.cd_agenda_central
    And item_agendamento.cd_item_agendamento = it_agenda_central.cd_item_agendamento
    And agenda_central.cd_setor                           = setor.cd_setor
    And it_agenda_central.cd_paciente                 = paciente.cd_paciente (+)
    And it_agenda_central.cd_ser_dis                    = ser_dis.cd_ser_dis (+)
    And it_agenda_central.cd_tip_mar                    = tip_mar.cd_tip_mar (+)
    And it_agenda_central.cd_convenio                = convenio.cd_convenio
    And it_agenda_central.cd_convenio                = con_pla.cd_convenio
    And it_agenda_central.cd_con_pla                  = con_pla.cd_con_pla
    And it_agenda_central.cd_usuario                   = usuarios.cd_usuario
   And  agenda_central.cd_multi_empresa = 'SUA EMPRESA'