PROMPT CREATE OR REPLACE FUNCTION fnc_converter_long_para_clob
CREATE OR REPLACE FUNCTION dbamv.fnc_converter_long_para_clob_nutri(
    p_cd_atendimento IN NUMBER
) RETURN CLOB
IS
    v_clob CLOB;
    v_long LONG;
BEGIN

    SELECT pre_med.ds_evolucao
    INTO v_long
    FROM dbamv.pre_med , dbamv.atendime
    WHERE atendime.cd_atendimento = pre_med.cd_atendimento
      AND atendime.cd_atendimento = p_cd_atendimento
      AND ds_evolucao IS NOT NULL
      AND ROWNUM = 1
    ORDER BY dt_pre_med DESC;

    v_clob := TO_CLOB(v_long);

    RETURN v_clob;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN NULL;
    WHEN OTHERS THEN
        RETURN NULL;
END fnc_converter_long_para_clob_nutri;
/




  SELECT pre_med.ds_evolucao
   -- INTO v_long
    FROM dbamv.pre_med , dbamv.atendime
    WHERE atendime.cd_atendimento = pre_med.cd_atendimento
      AND atendime.cd_atendimento = 1088619
      AND ds_evolucao IS NOT NULL
      AND ROWNUM = 1
    ORDER BY dt_pre_med DESC

    DROP FUNCTION fnc_converter_long_para_clob_nutri

      Segue atendimentos 1088619 - 1085919



        SELECT owner, object_name from dba_objects
        WHERE object_name = 'FNC_CONVERTER_LONG_PARA_CLOB_NUTRI'



        GRANT EXECUTE ON dbamv.FNC_CONVERTER_LONG_PARA_CLOB TO editor;
GRANT EXECUTE ON dbamv.FNC_CONVERTER_LONG_PARA_CLOB TO mv2000;
