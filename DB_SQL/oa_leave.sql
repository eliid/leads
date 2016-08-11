CREATE TABLE OA_LEAVE
(
  ID                   NUMBER(10)               NOT NULL,
  PROCESS_INSTANCE_ID  VARCHAR2(64 BYTE),
  USER_ID              VARCHAR2(20 BYTE)        NOT NULL,
  START_TIME           TIMESTAMP(6)             NOT NULL,
  END_TIME             TIMESTAMP(6)             NOT NULL,
  LEAVE_TYPE           VARCHAR2(20 BYTE),
  REASON               VARCHAR2(2000 BYTE),
  APPLY_TIME           TIMESTAMP(6)             NOT NULL,
  REALITY_START_TIME   TIMESTAMP(6),
  REALITY_END_TIME     TIMESTAMP(6)
);


CREATE UNIQUE INDEX PK_OA_LEAVE ON OA_LEAVE
(ID);


ALTER TABLE OA_LEAVE ADD (
  CONSTRAINT PK_OA_LEAVE
  PRIMARY KEY
  (ID)
  USING INDEX PK_OA_LEAVE
  ENABLE VALIDATE);