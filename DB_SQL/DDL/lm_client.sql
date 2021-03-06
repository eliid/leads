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

COMMENT ON TABLE LM_CLIENT IS '客户线索';

COMMENT ON COLUMN LM_CLIENT.TEL IS '电话';

COMMENT ON COLUMN LM_CLIENT.SEX IS '是否删除 0删除1正常';

COMMENT ON COLUMN LM_CLIENT.PERSONID IS '身份证号';

COMMENT ON COLUMN LM_CLIENT.FROMTYPE IS '信息来源';

COMMENT ON COLUMN LM_CLIENT.TITLE IS '咨询';

COMMENT ON COLUMN LM_CLIENT.QDATE IS '咨询日期';

COMMENT ON COLUMN LM_CLIENT.BIG_PID IS '业务类型大类';

COMMENT ON COLUMN LM_CLIENT.SMALL_PID IS '业务类型小类';

COMMENT ON COLUMN LM_CLIENT.RID IS '接收人';

COMMENT ON COLUMN LM_CLIENT.IFURGENT IS '是否加急';

COMMENT ON COLUMN LM_CLIENT.CITYID IS '对应orgcompa表里的ORGAN_CODE';

COMMENT ON COLUMN LM_CLIENT.COMPANYID IS '分公司';

COMMENT ON COLUMN LM_CLIENT.SID IS '处理人';

COMMENT ON COLUMN LM_CLIENT.DDATE IS '处理日期';

COMMENT ON COLUMN LM_CLIENT.NEXTDATE IS '下次跟踪日期';

COMMENT ON COLUMN LM_CLIENT.RANK IS '等级';

COMMENT ON COLUMN LM_CLIENT.STATUS IS '电话具体原因';

COMMENT ON COLUMN LM_CLIENT.QQ IS 'qq';

COMMENT ON COLUMN LM_CLIENT.WEIXIN IS '微信';

COMMENT ON COLUMN LM_CLIENT.PHONE IS '电话';

COMMENT ON COLUMN LM_CLIENT.REASON IS '放弃原因 1 A 车型不匹配 2 B 金融方案不满意 3 C 风控原因  (审核未通过) 4 其他原因 ';

COMMENT ON COLUMN LM_CLIENT.REASONCONT IS '放弃其他原因说明';

COMMENT ON COLUMN LM_CLIENT.IDD IS '是否到店   1是 0否';

COMMENT ON COLUMN LM_CLIENT.IFK IS '是否通过风控   1是 0否';

COMMENT ON COLUMN LM_CLIENT.ALLOTDATE IS '分配时间';

COMMENT ON COLUMN LM_CLIENT.CONTRACTNO IS '合同号';

COMMENT ON COLUMN LM_CLIENT.INIT_RANK IS '初始等级 C或空';

COMMENT ON COLUMN LM_CLIENT.PRODUCT IS '租赁产品 select * from t_code_item where code_type=''1036''';

COMMENT ON COLUMN LM_CLIENT.WILL IS '购车意愿 1强烈2一般3暂无';

COMMENT ON COLUMN LM_CLIENT.IS_SUB_MATERIAL IS '是否提交材料1是0否';

COMMENT ON COLUMN LM_CLIENT.IS_GET_CAR IS '是否提车1是2否';

COMMENT ON COLUMN LM_CLIENT.GET_CAR_DATE IS '提车时间';

COMMENT ON COLUMN LM_CLIENT.CREDIT_STATUS IS '同步erp系统信审状态';

COMMENT ON COLUMN LM_CLIENT.DEPOSIT_STATUS IS '定金支付状态';

COMMENT ON COLUMN LM_CLIENT.TEL1 IS '手机号1';

COMMENT ON COLUMN LM_CLIENT.FROMTYPE_BIG IS '线索大类';



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
