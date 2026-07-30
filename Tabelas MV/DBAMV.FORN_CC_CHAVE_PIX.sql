-- DBAMV.FORN_CC_CHAVE_PIX
-- Create table
create table DBAMV.FORN_CC_CHAVE_PIX
(
  cd_forn_cc_chave_pix   NUMBER(4) not null,
  cd_forn_conta_corrente NUMBER(5) not null,
  tp_chave_pix           VARCHAR2(1) default 'A' not null,
  ds_chave_pix           VARCHAR2(200) not null,
  sn_chave_padrao        VARCHAR2(1) default 'N' not null,
  dt_ativacao            DATE not null,
  sn_ativa               VARCHAR2(1) default 'S' not null
)
tablespace MV2000_D
  pctfree 10
  initrans 1
  maxtrans 255;
-- Add comments to the table
comment on table DBAMV.FORN_CC_CHAVE_PIX
  is 'TABELA DE VINCULO ENTRE FORNECEDOR E PIX';
-- Add comments to the columns
comment on column DBAMV.FORN_CC_CHAVE_PIX.cd_forn_cc_chave_pix
  is 'CHAVE PRIMARIA DA TABELA';
comment on column DBAMV.FORN_CC_CHAVE_PIX.cd_forn_conta_corrente
  is 'CODIGO DA CONTA CORRENTE DO FORNECEDOR';
comment on column DBAMV.FORN_CC_CHAVE_PIX.tp_chave_pix
  is 'TIPO DA CHAVE PIX';
comment on column DBAMV.FORN_CC_CHAVE_PIX.ds_chave_pix
  is 'CHAVE PIX';
comment on column DBAMV.FORN_CC_CHAVE_PIX.sn_chave_padrao
  is 'DEFINE SE A CHAVE E OU N?O UMA CHAVE PADR?O';
comment on column DBAMV.FORN_CC_CHAVE_PIX.dt_ativacao
  is 'DATA DE ATIVAC?O';
comment on column DBAMV.FORN_CC_CHAVE_PIX.sn_ativa
  is 'A CHAVE SE ENCONTRA ATIVA ?';
-- Create/Recreate indexes
create index DBAMV.IND_FORNCCCHAVEPIX_IX01 on DBAMV.FORN_CC_CHAVE_PIX (CD_FORN_CONTA_CORRENTE)
  tablespace MV2000_I
  pctfree 10
  initrans 2
  maxtrans 255;
-- Create/Recreate primary, unique and foreign key constraints
alter table DBAMV.FORN_CC_CHAVE_PIX
  add constraint CNT_FORNCCCHAVEPIX_PK primary key (CD_FORN_CC_CHAVE_PIX)
  using index
  tablespace MV2000_I
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    next 1M
  );
alter table DBAMV.FORN_CC_CHAVE_PIX
  add constraint CNT_FORNCCCHAVEPIX_1_FK foreign key (CD_FORN_CONTA_CORRENTE)
  references DBAMV.FORN_CONTA_CORRENTE (CD_FORN_CONTA_CORRENTE);
-- Create/Recreate check constraints
alter table DBAMV.FORN_CC_CHAVE_PIX
  add constraint CNT_FORNCCCHAVEPIX_1_CK
  check (TP_CHAVE_PIX  IN ('E','T','C','A'));
alter table DBAMV.FORN_CC_CHAVE_PIX
  add constraint CNT_FORNCCCHAVEPIX_2_CK
  check (SN_CHAVE_PADRAO IN ('S','N'));
alter table DBAMV.FORN_CC_CHAVE_PIX
  add constraint CNT_FORNCCCHAVEPIX_3_CK
  check (SN_ATIVA IN ('S','N'));