CREATE TABLE LM_SALE_PLAN
(
  ID           NUMBER(10)                       NOT NULL,
  USER_ID      NUMBER(10),
  MONTH        VARCHAR2(10 BYTE),
  PLAN_NUM     NUMBER(5),
  FIRST_TIP    VARCHAR2(5 BYTE)                 DEFAULT 0,
  CREATE_DATE  DATE                             DEFAULT sysdate,
  PERFORM      NUMBER(5)                        DEFAULT 0
);

COMMENT ON TABLE LM_SALE_PLAN IS '销售计划表';

COMMENT ON COLUMN LM_SALE_PLAN.ID IS '数据ID';

COMMENT ON COLUMN LM_SALE_PLAN.USER_ID IS '销售人员ID';

COMMENT ON COLUMN LM_SALE_PLAN.MONTH IS '年月';

COMMENT ON COLUMN LM_SALE_PLAN.PLAN_NUM IS '销售数量';

COMMENT ON COLUMN LM_SALE_PLAN.FIRST_TIP IS '是否提示过默认0 1提示过';

COMMENT ON COLUMN LM_SALE_PLAN.CREATE_DATE IS '创建时间';

COMMENT ON COLUMN LM_SALE_PLAN.PERFORM IS '完成的任务数量';



CREATE UNIQUE INDEX PK_LM_SALE_PLAN ON LM_SALE_PLAN
(ID);


ALTER TABLE LM_SALE_PLAN ADD (
  CONSTRAINT PK_LM_SALE_PLAN
  PRIMARY KEY
  (ID)
  USING INDEX PK_LM_SALE_PLAN
  ENABLE VALIDATE);
