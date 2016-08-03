CREATE TABLE LM_CLIENT
(
  ID                 NUMBER(10)                 NOT NULL,
  CLIENT_NAME        VARCHAR2(300 BYTE)         NOT NULL,
  TEL                VARCHAR2(20 BYTE),
  SEX                CHAR(1 BYTE),
  PERSONID           VARCHAR2(30 BYTE),
  EMAIL              VARCHAR2(30 BYTE),
  FROMTYPE           NUMBER(5),
  TITLE              VARCHAR2(2000 BYTE),
  QDATE              DATE,
  BIG_PID            NUMBER(4),
  SMALL_PID          NUMBER(4),
  RID                NUMBER(10),
  IFURGENT           CHAR(1 BYTE),
  CITYID             VARCHAR2(20 BYTE),
  COMPANYID          VARCHAR2(20 BYTE),
  SID                NUMBER(10),
  DDATE              DATE,
  NEXTDATE           DATE,
  RANK               CHAR(1 BYTE)               DEFAULT 'D',
  STATUS             CHAR(1 BYTE),
  QQ                 VARCHAR2(30 BYTE),
  WEIXIN             VARCHAR2(50 BYTE),
  PHONE              VARCHAR2(20 BYTE),
  REASON             CHAR(1 BYTE)               DEFAULT null,
  REASONCONT         VARCHAR2(500 BYTE),
  IDD                CHAR(1 BYTE),
  IFK                CHAR(1 BYTE),
  ALLOTDATE          DATE,
  CONTRACTNO         VARCHAR2(20 BYTE),
  INIT_RANK          CHAR(1 BYTE),
  PRODUCT            VARCHAR2(2 BYTE),
  WILL               VARCHAR2(2 BYTE),
  IS_SUB_MATERIAL    VARCHAR2(2 BYTE),
  IS_GET_CAR         VARCHAR2(2 BYTE),
  GET_CAR_DATE       DATE,
  CREDIT_STATUS      VARCHAR2(200 BYTE),
  DEPOSIT_STATUS     VARCHAR2(5 BYTE),
  TEL1               VARCHAR2(20 BYTE),
  CARNO              VARCHAR2(30 BYTE),
  FIRST_TIME_COMING  DATE,
  FROMTYPE_BIG       VARCHAR2(5 BYTE),
  CHANNEL            VARCHAR2(50 BYTE)
);

COMMENT ON TABLE LM_CLIENT IS '�ͻ�����';

COMMENT ON COLUMN LM_CLIENT.TEL IS '�绰';

COMMENT ON COLUMN LM_CLIENT.SEX IS '�Ƿ�ɾ�� 0ɾ��1����';

COMMENT ON COLUMN LM_CLIENT.PERSONID IS '����֤��';

COMMENT ON COLUMN LM_CLIENT.FROMTYPE IS '��Ϣ��Դ';

COMMENT ON COLUMN LM_CLIENT.TITLE IS '��ѯ';

COMMENT ON COLUMN LM_CLIENT.QDATE IS '��ѯ����';

COMMENT ON COLUMN LM_CLIENT.BIG_PID IS 'ҵ�����ʹ���';

COMMENT ON COLUMN LM_CLIENT.SMALL_PID IS 'ҵ������С��';

COMMENT ON COLUMN LM_CLIENT.RID IS '������';

COMMENT ON COLUMN LM_CLIENT.IFURGENT IS '�Ƿ�Ӽ�';

COMMENT ON COLUMN LM_CLIENT.CITYID IS '��Ӧorgcompa�����ORGAN_CODE';

COMMENT ON COLUMN LM_CLIENT.COMPANYID IS '�ֹ�˾';

COMMENT ON COLUMN LM_CLIENT.SID IS '������';

COMMENT ON COLUMN LM_CLIENT.DDATE IS '��������';

COMMENT ON COLUMN LM_CLIENT.NEXTDATE IS '�´θ�������';

COMMENT ON COLUMN LM_CLIENT.RANK IS '�ȼ�';

COMMENT ON COLUMN LM_CLIENT.STATUS IS '�绰����ԭ��';

COMMENT ON COLUMN LM_CLIENT.QQ IS 'qq';

COMMENT ON COLUMN LM_CLIENT.WEIXIN IS '΢��';

COMMENT ON COLUMN LM_CLIENT.PHONE IS '�绰';

COMMENT ON COLUMN LM_CLIENT.REASON IS '����ԭ�� 1 A ���Ͳ�ƥ�� 2 B ���ڷ��������� 3 C ���ԭ��  (���δͨ��) 4 ����ԭ�� ';

COMMENT ON COLUMN LM_CLIENT.REASONCONT IS '��������ԭ��˵��';

COMMENT ON COLUMN LM_CLIENT.IDD IS '�Ƿ񵽵�   1�� 0��';

COMMENT ON COLUMN LM_CLIENT.IFK IS '�Ƿ�ͨ�����   1�� 0��';

COMMENT ON COLUMN LM_CLIENT.ALLOTDATE IS '����ʱ��';

COMMENT ON COLUMN LM_CLIENT.CONTRACTNO IS '��ͬ��';

COMMENT ON COLUMN LM_CLIENT.INIT_RANK IS '��ʼ�ȼ� C���';

COMMENT ON COLUMN LM_CLIENT.PRODUCT IS '���޲�Ʒ select * from t_code_item where code_type=''1036''';

COMMENT ON COLUMN LM_CLIENT.WILL IS '������Ը 1ǿ��2һ��3����';

COMMENT ON COLUMN LM_CLIENT.IS_SUB_MATERIAL IS '�Ƿ��ύ����1��0��';

COMMENT ON COLUMN LM_CLIENT.IS_GET_CAR IS '�Ƿ��ᳵ1��2��';

COMMENT ON COLUMN LM_CLIENT.GET_CAR_DATE IS '�ᳵʱ��';

COMMENT ON COLUMN LM_CLIENT.CREDIT_STATUS IS 'ͬ��erpϵͳ����״̬';

COMMENT ON COLUMN LM_CLIENT.DEPOSIT_STATUS IS '����֧��״̬';

COMMENT ON COLUMN LM_CLIENT.TEL1 IS '�ֻ���1';

COMMENT ON COLUMN LM_CLIENT.FROMTYPE_BIG IS '��������';



CREATE INDEX DIX_CLIENT_QDAET ON LM_CLIENT
(QDATE);


CREATE INDEX IDX_ALLOTDATE ON LM_CLIENT
(ALLOTDATE);


CREATE INDEX IDX_CLIENT_COMPANYID ON LM_CLIENT
(COMPANYID);


CREATE INDEX IDX_CLIENT_RID ON LM_CLIENT
(RID);


CREATE INDEX IDX_CLIENT_SID ON LM_CLIENT
(SID);


CREATE UNIQUE INDEX PK_LM_CLIENT ON LM_CLIENT
(ID);


ALTER TABLE LM_CLIENT ADD (
  CONSTRAINT PK_LM_CLIENT
  PRIMARY KEY
  (ID)
  USING INDEX PK_LM_CLIENT
  ENABLE VALIDATE);