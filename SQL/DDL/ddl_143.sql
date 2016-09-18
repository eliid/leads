-- Create table
create table T_MILEAGE_CAR
(
  ID          NUMBER(10) not null,
  CUSTOMERID  NUMBER(10),
  CUSTOMERTEL VARCHAR2(20),
  CARVIN      VARCHAR2(30),
  BRANDTYPE   VARCHAR2(30),
  DELIVERDATE DATE
);
-- Add comments to the table 
comment on table T_MILEAGE_CAR
  is '�����Ϣ�ó���';
-- Add comments to the columns 
comment on column T_MILEAGE_CAR.ID
  is 'ID';
comment on column T_MILEAGE_CAR.CUSTOMERID
  is '�ͻ�ID';
comment on column T_MILEAGE_CAR.CUSTOMERTEL
  is '�ͻ��绰';
comment on column T_MILEAGE_CAR.CARVIN
  is '���ܺ�';
comment on column T_MILEAGE_CAR.BRANDTYPE
  is 'Ʒ���ͺ�';
comment on column T_MILEAGE_CAR.DELIVERDATE
  is '��������';
-- Create/Recreate primary, unique and foreign key constraints 
alter table T_MILEAGE_CAR
  add constraint PK_T_MILEAGE_CAR primary key (ID);


create sequence S_MILEAGE_CAR;



-- Create table
create table T_MILEAGE_CUSTOMER
(
  ID                NUMBER(10) not null,
  SUBSIDIARY        VARCHAR2(20),
  STORE             VARCHAR2(50),
  CUSTOMERNAME      VARCHAR2(20),
  TEL               VARCHAR2(20),
  INVESTIGATOR      VARCHAR2(20),
  INVESTIGATORSEX   CHAR(1),
  INVESTIGATIONDATE DATE,
  CONNECTSTATUS     VARCHAR2(100)
);
-- Add comments to the table 
comment on table T_MILEAGE_CUSTOMER
  is '�����Ϣ�ͻ���';
-- Add comments to the columns 
comment on column T_MILEAGE_CUSTOMER.ID
  is 'ID';
comment on column T_MILEAGE_CUSTOMER.SUBSIDIARY
  is '�ӹ�˾';
comment on column T_MILEAGE_CUSTOMER.STORE
  is '�ŵ�';
comment on column T_MILEAGE_CUSTOMER.CUSTOMERNAME
  is '�ͻ�����';
comment on column T_MILEAGE_CUSTOMER.TEL
  is '�ͻ��绰';
comment on column T_MILEAGE_CUSTOMER.INVESTIGATOR
  is '������';
comment on column T_MILEAGE_CUSTOMER.INVESTIGATORSEX
  is '�������Ա� 0 Ů 1 ��';
comment on column T_MILEAGE_CUSTOMER.INVESTIGATIONDATE
  is '��������';
comment on column T_MILEAGE_CUSTOMER.CONNECTSTATUS
  is '��ͨ���';
-- Create/Recreate primary, unique and foreign key constraints 
alter table T_MILEAGE_CUSTOMER
  add constraint PK_T_MILEAGE_CUSTOMER primary key (ID);

create sequence S_MILEAGE_CUSTOMER;



-- Create table
create table T_MILEAGE_CUSTOMER_MILEAGE
(
  ID          NUMBER(10) not null,
  CARID       NUMBER(10),
  MILEAGE     NUMBER,
  LASTMILEAGE NUMBER,
  ISREMIND    CHAR(1)
);

-- Add comments to the columns 
comment on column T_MILEAGE_CUSTOMER_MILEAGE.ID
  is 'ID';
comment on column T_MILEAGE_CUSTOMER_MILEAGE.CARID
  is '����ID';
comment on column T_MILEAGE_CUSTOMER_MILEAGE.MILEAGE
  is '��ʻ���';
comment on column T_MILEAGE_CUSTOMER_MILEAGE.LASTMILEAGE
  is '�ϴ���ʻ���';
comment on column T_MILEAGE_CUSTOMER_MILEAGE.ISREMIND
  is '�Ƿ������� 0 δ���� 1 ������';
-- Create/Recreate primary, unique and foreign key constraints 
alter table T_MILEAGE_CUSTOMER_MILEAGE
  add constraint PK_T_CUSTOMER_MILEAGE primary key (ID);

create sequence S_MILEAGE_CUSTOMER_MILEAGE;



-- Create table
create table T_MILEAGE_SATISFACTION
(
  ID           NUMBER(10) not null,
  CUSTOMERID   NUMBER(10),
  CUSTOMERTEL  VARCHAR2(20),
  QUESTIONID   NUMBER(10),
  ANSWER       VARCHAR2(100),
  DETAILANSWER VARCHAR2(300)
);

-- Add comments to the table 
comment on table T_MILEAGE_SATISFACTION
  is '�ͻ�����ȵ����';
-- Add comments to the columns 
comment on column T_MILEAGE_SATISFACTION.ID
  is 'ID';
comment on column T_MILEAGE_SATISFACTION.CUSTOMERID
  is '�ͻ�ID';
comment on column T_MILEAGE_SATISFACTION.CUSTOMERTEL
  is '�ͻ��绰';
comment on column T_MILEAGE_SATISFACTION.QUESTIONID
  is '��Ӧ����';
comment on column T_MILEAGE_SATISFACTION.ANSWER
  is '��';
comment on column T_MILEAGE_SATISFACTION.DETAILANSWER
  is '������';
-- Create/Recreate primary, unique and foreign key constraints 
alter table T_MILEAGE_SATISFACTION
  add constraint PK_T_SATISFACTION primary key (ID);

create sequence S_MILEAGE_SATISFACTION;



-- Create table
create table T_SATISFACTION_QUESTION
(
  ID          NUMBER(10) not null,
  SHORTNAME   VARCHAR2(20),
  QUESTION    VARCHAR2(500),
  OPTIONA     VARCHAR2(100),
  OPTIONB     VARCHAR2(100),
  OPTIONC     VARCHAR2(100),
  OPTIOND     VARCHAR2(100),
  OPTIONE     VARCHAR2(100),
  INPUTOPTION CHAR(1)
);

-- Add comments to the table 
comment on table T_SATISFACTION_QUESTION
  is '����ȵ�������';
-- Add comments to the columns 
comment on column T_SATISFACTION_QUESTION.ID
  is 'ID';
comment on column T_SATISFACTION_QUESTION.SHORTNAME
  is '�������';
comment on column T_SATISFACTION_QUESTION.QUESTION
  is '����';
comment on column T_SATISFACTION_QUESTION.OPTIONA
  is 'ѡ��A';
comment on column T_SATISFACTION_QUESTION.OPTIONB
  is 'ѡ��B';
comment on column T_SATISFACTION_QUESTION.OPTIONC
  is 'ѡ��C';
comment on column T_SATISFACTION_QUESTION.OPTIOND
  is 'ѡ��D';
comment on column T_SATISFACTION_QUESTION.OPTIONE
  is 'ѡ��E';
comment on column T_SATISFACTION_QUESTION.INPUTOPTION
  is '��Ҫ�ֶ���д��ѡ��';
-- Create/Recreate primary, unique and foreign key constraints 
alter table T_SATISFACTION_QUESTION
  add constraint PK_T_QUESTION primary key (ID);

alter table lm_client_import add channel varchar2(100);
comment on column lm_client_import.channel is '������ϸ';