select atendime.sn_retorno
from atendime
where atendime.cd_atendimento = 887645;

update atendime
set atendime.sn_retorno = 'N'
where atendime.cd_atendimento = 887645;

ALTER TRIGGER MVINTEGRA.TRG_IMVW_SAI_ATENDIMENTO ENABLE;
ALTER TRIGGER MVINTEGRA.TRG_IMVW_OUT_ATENDIMENTO ENABLE;