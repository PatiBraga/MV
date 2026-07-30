-- campo do MV vcs costumam ver se uma agenda é cancelada

Select
It_agenda_central.tp_situacao
From It_agenda_central
Where It_agenda_central.tp_situacao = 'C'