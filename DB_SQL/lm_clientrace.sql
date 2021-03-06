CREATE TABLE LM_CLIENTRACE
(
  ID               NUMBER(10)                   NOT NULL,
  TITLE            VARCHAR2(2000 BYTE),
  T_ID             NUMBER(8),
  REDATE           DATE,
  U_ID             VARCHAR2(50 BYTE),
  RANK             CHAR(1 BYTE),
  REASON           CHAR(1 BYTE),
  SID              NUMBER(10),
  IDD              VARCHAR2(5 BYTE),
  IFK              VARCHAR2(5 BYTE),
  PRODUCT          VARCHAR2(5 BYTE),
  WILL             VARCHAR2(5 BYTE),
  IS_SUB_MATERIAL  VARCHAR2(5 BYTE),
  IS_GET_CAR       VARCHAR2(5 BYTE),
  GET_CAR_DATE     DATE,
  CARNO            VARCHAR2(30 BYTE),
  DD_TIME          DATE
);

COMMENT ON TABLE LM_CLIENTRACE IS '线索跟进表';

COMMENT ON COLUMN LM_CLIENTRACE.TITLE IS '记录';

COMMENT ON COLUMN LM_CLIENTRACE.T_ID IS '线索表ID';

COMMENT ON COLUMN LM_CLIENTRACE.REDATE IS '记录日期';

COMMENT ON COLUMN LM_CLIENTRACE.U_ID IS '记录人';

COMMENT ON COLUMN LM_CLIENTRACE.RANK IS '等级';

COMMENT ON COLUMN LM_CLIENTRACE.REASON IS '放弃原因 1 A 车型不匹配 2 B 金融方案不满意 3 C 风控原因  (审核未通过) 4 其他原因';

COMMENT ON COLUMN LM_CLIENTRACE.SID IS '追踪人员ID';



CREATE INDEX IDX_CLIENTRACE_TID ON LM_CLIENTRACE
(T_ID);


CREATE UNIQUE INDEX PK_LM_CLUETRACE ON LM_CLIENTRACE
(ID);


ALTER TABLE LM_CLIENTRACE ADD (
  CONSTRAINT PK_LM_CLUETRACE
  PRIMARY KEY
  (ID)
  USING INDEX PK_LM_CLUETRACE
  ENABLE VALIDATE);
