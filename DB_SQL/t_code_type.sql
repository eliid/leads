CREATE TABLE T_CODE_TYPE
(
  NAME         VARCHAR2(100 BYTE),
  CODE_TYPE    VARCHAR2(10 BYTE)                NOT NULL,
  CREATE_DATE  DATE                             DEFAULT sysdate,
  STATUS       VARCHAR2(2 BYTE)                 DEFAULT 1,
  SQL          NVARCHAR2(2000),
  TYPE         VARCHAR2(1 BYTE)                 DEFAULT 1
);

COMMENT ON TABLE T_CODE_TYPE IS '码表类型';

COMMENT ON COLUMN T_CODE_TYPE.NAME IS '名称';

COMMENT ON COLUMN T_CODE_TYPE.CODE_TYPE IS '类型';

COMMENT ON COLUMN T_CODE_TYPE.CREATE_DATE IS '创建时间';

COMMENT ON COLUMN T_CODE_TYPE.STATUS IS '是否有效 0失效';

COMMENT ON COLUMN T_CODE_TYPE.SQL IS '编写执行的SQL';

COMMENT ON COLUMN T_CODE_TYPE.TYPE IS '类型，1为标准类型，0非标准类型（执行SQL取得下拉name,value）';



CREATE UNIQUE INDEX PK_CODE_TYPE ON T_CODE_TYPE
(CODE_TYPE);


ALTER TABLE T_CODE_TYPE ADD (
  CONSTRAINT PK_CODE_TYPE
  PRIMARY KEY
  (CODE_TYPE)
  USING INDEX PK_CODE_TYPE
  ENABLE VALIDATE);
