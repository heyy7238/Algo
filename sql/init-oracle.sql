--------------------------------------------------------
--  파일이 생성됨 - 목요일-3월-19-2020   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence ORDERSLOG_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "ORDERSLOG_SEQ"  MINVALUE 1 MAXVALUE 9999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQUENCE1
--------------------------------------------------------

   CREATE SEQUENCE  "SEQUENCE1"  MINVALUE 0 MAXVALUE 9999999999 INCREMENT BY 1 START WITH 0 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Table APP_USER
--------------------------------------------------------

  CREATE TABLE "APP_USER" 
   (	"USER_NUM" NUMBER(10,0), 
	"EMAIL" VARCHAR2(256 BYTE), 
	"PW" VARCHAR2(80 BYTE), 
	"TEL" VARCHAR2(20 BYTE), 
	"NICKNAME" VARCHAR2(40 BYTE), 
	"GENDER" CHAR(3 BYTE), 
	"ADDRESS" VARCHAR2(150 BYTE), 
	"BIRTH" DATE, 
	"CREATED_AT" TIMESTAMP (6), 
	"UPDATED_AT" TIMESTAMP (6), 
	"TYPE" CHAR(1 BYTE), 
	"COLUMN1" VARCHAR2(20 BYTE), 
	"COLUMN2" VARCHAR2(20 BYTE), 
	"COLUMN3" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "APP_USER"."USER_NUM" IS '유저 번호';
   COMMENT ON COLUMN "APP_USER"."EMAIL" IS '메일주소';
   COMMENT ON COLUMN "APP_USER"."PW" IS '비밀번호';
   COMMENT ON COLUMN "APP_USER"."TEL" IS '전화번호';
   COMMENT ON COLUMN "APP_USER"."NICKNAME" IS '별명';
   COMMENT ON COLUMN "APP_USER"."GENDER" IS '성별';
   COMMENT ON COLUMN "APP_USER"."ADDRESS" IS '주소';
   COMMENT ON COLUMN "APP_USER"."BIRTH" IS '생년월일';
   COMMENT ON COLUMN "APP_USER"."CREATED_AT" IS '생성일시';
   COMMENT ON COLUMN "APP_USER"."UPDATED_AT" IS '수정일시';
   COMMENT ON COLUMN "APP_USER"."TYPE" IS '유형(학습자/튜터)';
--------------------------------------------------------
--  DDL for Table CHALLENGE
--------------------------------------------------------

  CREATE TABLE "CHALLENGE" 
   (	"C_NUM" NUMBER(10,0), 
	"CONTENT" CLOB, 
	"TITLE" VARCHAR2(1024 BYTE), 
	"PASS_NUM" NUMBER(10,0), 
	"CREATED_AT" TIMESTAMP (6), 
	"UPDATED_AT" TIMESTAMP (6), 
	"COL1" VARCHAR2(30 BYTE), 
	"COL2" VARCHAR2(30 BYTE), 
	"USER_NUM" NUMBER(10,0), 
	"TIME_LIMIT" NUMBER(10,0), 
	"MEMORY_LIMIT" NUMBER(16,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" 
 LOB ("CONTENT") STORE AS BASICFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) ;

   COMMENT ON COLUMN "CHALLENGE"."C_NUM" IS '도전문제 번호';
   COMMENT ON COLUMN "CHALLENGE"."CONTENT" IS '도전문제 내용';
   COMMENT ON COLUMN "CHALLENGE"."TITLE" IS '도전문제 제목';
   COMMENT ON COLUMN "CHALLENGE"."PASS_NUM" IS '문제를 통과한 사람 수';
   COMMENT ON COLUMN "CHALLENGE"."CREATED_AT" IS '생성일시';
   COMMENT ON COLUMN "CHALLENGE"."UPDATED_AT" IS '수정일시';
   COMMENT ON COLUMN "CHALLENGE"."USER_NUM" IS '출제자';
   COMMENT ON COLUMN "CHALLENGE"."TIME_LIMIT" IS '시간제한';
   COMMENT ON COLUMN "CHALLENGE"."MEMORY_LIMIT" IS '메모리제한';
--------------------------------------------------------
--  DDL for Table CHALLENGE_CASE
--------------------------------------------------------

  CREATE TABLE "CHALLENGE_CASE" 
   (	"CASE_NUM" NUMBER(10,0), 
	"C_NUM" NUMBER(10,0), 
	"INPUT" CLOB, 
	"OUTPUT" CLOB, 
	"USER_NUM" NUMBER(10,0), 
	"CREATED_AT" TIMESTAMP (6) DEFAULT SYSTIMESTAMP, 
	"UPDATED_AT" TIMESTAMP (6) DEFAULT SYSTIMESTAMP, 
	"COL1" VARCHAR2(30 BYTE), 
	"COL2" VARCHAR2(30 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" 
 LOB ("INPUT") STORE AS BASICFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) 
 LOB ("OUTPUT") STORE AS BASICFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) ;

   COMMENT ON COLUMN "CHALLENGE_CASE"."CASE_NUM" IS '케이스번호';
   COMMENT ON COLUMN "CHALLENGE_CASE"."C_NUM" IS '도전문제번호';
   COMMENT ON COLUMN "CHALLENGE_CASE"."INPUT" IS '입력';
   COMMENT ON COLUMN "CHALLENGE_CASE"."OUTPUT" IS '출력(입력에 대응되는 정답';
   COMMENT ON COLUMN "CHALLENGE_CASE"."USER_NUM" IS '답안작성자';
   COMMENT ON COLUMN "CHALLENGE_CASE"."CREATED_AT" IS '생성일시';
   COMMENT ON COLUMN "CHALLENGE_CASE"."UPDATED_AT" IS '수정일시';
   COMMENT ON COLUMN "CHALLENGE_CASE"."COL1" IS '임시1';
   COMMENT ON COLUMN "CHALLENGE_CASE"."COL2" IS '임시2';
--------------------------------------------------------
--  DDL for Table CHALLENGE_RESULT
--------------------------------------------------------

  CREATE TABLE "CHALLENGE_RESULT" 
   (	"RESULT_NUM" NUMBER(10,0), 
	"USER_NUM" NUMBER(10,0), 
	"RESULT_COMMENT" VARCHAR2(1024 BYTE), 
	"STATUS" VARCHAR2(5 BYTE), 
	"CREATED_AT" TIMESTAMP (6), 
	"UPDATED_AT" TIMESTAMP (6), 
	"CODE" CLOB, 
	"C_NUM" NUMBER(10,0), 
	"USED_MEMORY" NUMBER(16,0), 
	"PROCESSING_TIME" NUMBER(10,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" 
 LOB ("CODE") STORE AS BASICFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) ;

   COMMENT ON COLUMN "CHALLENGE_RESULT"."RESULT_NUM" IS '결과번호';
   COMMENT ON COLUMN "CHALLENGE_RESULT"."USER_NUM" IS '결과 번호';
   COMMENT ON COLUMN "CHALLENGE_RESULT"."RESULT_COMMENT" IS '결과 코멘트';
   COMMENT ON COLUMN "CHALLENGE_RESULT"."STATUS" IS '결과상태';
   COMMENT ON COLUMN "CHALLENGE_RESULT"."CREATED_AT" IS '생성일시';
   COMMENT ON COLUMN "CHALLENGE_RESULT"."UPDATED_AT" IS '수정일시';
   COMMENT ON COLUMN "CHALLENGE_RESULT"."CODE" IS '제출답안';
   COMMENT ON COLUMN "CHALLENGE_RESULT"."C_NUM" IS '도전문제번호';
   COMMENT ON COLUMN "CHALLENGE_RESULT"."USED_MEMORY" IS '사용메모리';
   COMMENT ON COLUMN "CHALLENGE_RESULT"."PROCESSING_TIME" IS '처리시간';
--------------------------------------------------------
--  DDL for Table FNSH_RESULT
--------------------------------------------------------

  CREATE TABLE "FNSH_RESULT" 
   (	"RESULT_NUM" NUMBER(10,0), 
	"TEST_NUM" NUMBER(10,0), 
	"ANSWER" VARCHAR2(1024 BYTE), 
	"STATUS" CHAR(3 BYTE), 
	"CREATED_AT" TIMESTAMP (6) DEFAULT SYSTIMESTAMP, 
	"UPDATED_AT" TIMESTAMP (6) DEFAULT SYSTIMESTAMP, 
	"COL1" VARCHAR2(30 BYTE), 
	"COL2" VARCHAR2(30 BYTE), 
	"USER_NUM" NUMBER(10,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "FNSH_RESULT"."RESULT_NUM" IS '결과번호';
   COMMENT ON COLUMN "FNSH_RESULT"."TEST_NUM" IS '마무리문제 번호';
   COMMENT ON COLUMN "FNSH_RESULT"."ANSWER" IS '제출답안';
   COMMENT ON COLUMN "FNSH_RESULT"."STATUS" IS '정답여부';
   COMMENT ON COLUMN "FNSH_RESULT"."CREATED_AT" IS '생성일시';
   COMMENT ON COLUMN "FNSH_RESULT"."UPDATED_AT" IS '수정일시';
   COMMENT ON COLUMN "FNSH_RESULT"."COL1" IS '임시1';
   COMMENT ON COLUMN "FNSH_RESULT"."COL2" IS '임시2';
   COMMENT ON COLUMN "FNSH_RESULT"."USER_NUM" IS '제출자';
--------------------------------------------------------
--  DDL for Table FNSH_TEST
--------------------------------------------------------

  CREATE TABLE "FNSH_TEST" 
   (	"TEST_NUM" NUMBER(10,0), 
	"UNIT_NUM" NUMBER(10,0), 
	"TITLE" VARCHAR2(256 BYTE), 
	"CONTENT" CLOB, 
	"DIFFICULTY" NUMBER(3,0), 
	"CORRECT_ANSWER" VARCHAR2(1024 BYTE), 
	"SOLUTION" CLOB, 
	"CREATED_AT" TIMESTAMP (6) DEFAULT SYSTIMESTAMP, 
	"UPDATED_AT" TIMESTAMP (6) DEFAULT SYSTIMESTAMP, 
	"COL1" VARCHAR2(20 BYTE), 
	"COL2" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" 
 LOB ("CONTENT") STORE AS BASICFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) 
 LOB ("SOLUTION") STORE AS BASICFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) ;

   COMMENT ON COLUMN "FNSH_TEST"."TEST_NUM" IS '문제번호';
   COMMENT ON COLUMN "FNSH_TEST"."UNIT_NUM" IS '단원번호';
   COMMENT ON COLUMN "FNSH_TEST"."TITLE" IS '문제명';
   COMMENT ON COLUMN "FNSH_TEST"."CONTENT" IS '문제내용';
   COMMENT ON COLUMN "FNSH_TEST"."DIFFICULTY" IS '난이도';
   COMMENT ON COLUMN "FNSH_TEST"."CORRECT_ANSWER" IS '정답';
   COMMENT ON COLUMN "FNSH_TEST"."SOLUTION" IS '풀이';
   COMMENT ON COLUMN "FNSH_TEST"."CREATED_AT" IS '생성일시';
   COMMENT ON COLUMN "FNSH_TEST"."UPDATED_AT" IS '수정일시';
   COMMENT ON COLUMN "FNSH_TEST"."COL1" IS '임시1';
   COMMENT ON COLUMN "FNSH_TEST"."COL2" IS '임시2';
--------------------------------------------------------
--  DDL for Table SUBJECT
--------------------------------------------------------

  CREATE TABLE "SUBJECT" 
   (	"SUBJECT_NUM" NUMBER(10,0), 
	"TITLE" VARCHAR2(256 BYTE), 
	"USER_NUM" NUMBER(10,0), 
	"CREATE_AT" TIMESTAMP (6) DEFAULT SYSTIMESTAMP, 
	"UPDATED_AT" TIMESTAMP (6) DEFAULT SYSTIMESTAMP, 
	"COL1" VARCHAR2(30 BYTE), 
	"COL2" VARCHAR2(30 BYTE), 
	"COL3" VARCHAR2(30 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "SUBJECT"."SUBJECT_NUM" IS '과목번호';
   COMMENT ON COLUMN "SUBJECT"."TITLE" IS '과목명';
   COMMENT ON COLUMN "SUBJECT"."USER_NUM" IS '출제자';
   COMMENT ON COLUMN "SUBJECT"."CREATE_AT" IS '생성일시';
   COMMENT ON COLUMN "SUBJECT"."UPDATED_AT" IS '수정일시';
   COMMENT ON COLUMN "SUBJECT"."COL1" IS '임시1';
   COMMENT ON COLUMN "SUBJECT"."COL2" IS '임시2';
   COMMENT ON COLUMN "SUBJECT"."COL3" IS '임시3';
--------------------------------------------------------
--  DDL for Table UNIT
--------------------------------------------------------

  CREATE TABLE "UNIT" 
   (	"UNIT_NUM" NUMBER(10,0), 
	"SUBJECT_NUM" NUMBER(10,0), 
	"CONTENT" CLOB, 
	"TITLE" VARCHAR2(256 BYTE), 
	"CHAPTER_DEPTH" NVARCHAR2(50), 
	"CREATED_AT" TIMESTAMP (6) DEFAULT SYSTIMESTAMP, 
	"UPDATE_AT" TIMESTAMP (6) DEFAULT SYSTIMESTAMP, 
	"COL1" VARCHAR2(30 BYTE), 
	"COL2" VARCHAR2(30 BYTE), 
	"COL3" VARCHAR2(30 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" 
 LOB ("CONTENT") STORE AS BASICFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) ;

   COMMENT ON COLUMN "UNIT"."UNIT_NUM" IS '단원번호';
   COMMENT ON COLUMN "UNIT"."SUBJECT_NUM" IS '과목번호';
   COMMENT ON COLUMN "UNIT"."CONTENT" IS '내용(HTML)';
   COMMENT ON COLUMN "UNIT"."TITLE" IS '단원제목';
   COMMENT ON COLUMN "UNIT"."CHAPTER_DEPTH" IS '과목 내 챕터 번호';
   COMMENT ON COLUMN "UNIT"."CREATED_AT" IS '생성일시';
   COMMENT ON COLUMN "UNIT"."UPDATE_AT" IS '수정일시';
   COMMENT ON COLUMN "UNIT"."COL1" IS '임시1';
   COMMENT ON COLUMN "UNIT"."COL2" IS '임시2';
   COMMENT ON COLUMN "UNIT"."COL3" IS '임시3';
--------------------------------------------------------
--  DDL for Table UNIT_COMPLETION
--------------------------------------------------------

  CREATE TABLE "UNIT_COMPLETION" 
   (	"COM_NUM" NUMBER(10,0), 
	"USER_NUM1" NUMBER(10,0), 
	"UNIT_NUM1" NUMBER(10,0), 
	"STATUS" CHAR(1 BYTE), 
	"CREATED_AT" TIMESTAMP (6), 
	"UPDATED_AT" TIMESTAMP (6), 
	"COL1" VARCHAR2(20 BYTE), 
	"COL2" VARCHAR2(20 BYTE), 
	"COL3" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "UNIT_COMPLETION"."COM_NUM" IS '완료번호';
   COMMENT ON COLUMN "UNIT_COMPLETION"."USER_NUM1" IS '유저번호';
   COMMENT ON COLUMN "UNIT_COMPLETION"."UNIT_NUM1" IS '과목번호';
   COMMENT ON COLUMN "UNIT_COMPLETION"."STATUS" IS '완료상태';
   COMMENT ON COLUMN "UNIT_COMPLETION"."CREATED_AT" IS '생성일시';
   COMMENT ON COLUMN "UNIT_COMPLETION"."UPDATED_AT" IS '수정일시';
   COMMENT ON COLUMN "UNIT_COMPLETION"."COL1" IS '임시1';
   COMMENT ON COLUMN "UNIT_COMPLETION"."COL2" IS '임시2';
   COMMENT ON COLUMN "UNIT_COMPLETION"."COL3" IS '임시3';
REM INSERTING into APP_USER
SET DEFINE OFF;
REM INSERTING into CHALLENGE
SET DEFINE OFF;
REM INSERTING into CHALLENGE_CASE
SET DEFINE OFF;
REM INSERTING into CHALLENGE_RESULT
SET DEFINE OFF;
REM INSERTING into FNSH_RESULT
SET DEFINE OFF;
REM INSERTING into FNSH_TEST
SET DEFINE OFF;
REM INSERTING into SUBJECT
SET DEFINE OFF;
REM INSERTING into UNIT
SET DEFINE OFF;
REM INSERTING into UNIT_COMPLETION
SET DEFINE OFF;
--------------------------------------------------------
--  DDL for Index UNIT_COMPLETION_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "UNIT_COMPLETION_PK" ON "UNIT_COMPLETION" ("COM_NUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index CHALLENGE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CHALLENGE_PK" ON "CHALLENGE" ("C_NUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index CHALLENGE_RESULT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CHALLENGE_RESULT_PK" ON "CHALLENGE_RESULT" ("RESULT_NUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SUBJECT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SUBJECT_PK" ON "SUBJECT" ("SUBJECT_NUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index FNSH_TEST_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "FNSH_TEST_PK" ON "FNSH_TEST" ("TEST_NUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index FNSH_RESULT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "FNSH_RESULT_PK" ON "FNSH_RESULT" ("RESULT_NUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index TABLE1_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "TABLE1_PK" ON "CHALLENGE_CASE" ("CASE_NUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index UNIT_COMPLETION_PK2
--------------------------------------------------------

  CREATE UNIQUE INDEX "UNIT_COMPLETION_PK2" ON "UNIT_COMPLETION" ("COM_NUM", "USER_NUM1") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "JAVA_STUDY" ;
--------------------------------------------------------
--  DDL for Index UNIT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "UNIT_PK" ON "UNIT" ("UNIT_NUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index APP_USER_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "APP_USER_PK" ON "APP_USER" ("USER_NUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Procedure BOOKINSERTORUPDATE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "BOOKINSERTORUPDATE" (
  p_bookid IN Book.bookid%TYPE,
  p_bookname IN Book.bookname%TYPE,
  p_publisher IN Book.publisher%TYPE,
  p_price   IN Book.price%TYPE,
  r_errcode OUT NUMBER,
  r_errmsg OUT VARCHAR2
)
AS 
l_count NUMBER;
BEGIN
  SELECT COUNT(*) INTO l_count 
  FROM Book 
  WHERE bookname = p_bookname
    AND publisher = p_publisher;
  IF l_count != 0 THEN
    UPDATE Book SET price = p_price
    WHERE bookname = p_bookname
    AND publisher = p_publisher;
  ELSE 
    INSERT INTO Book(bookid, bookname, publisher, price)
    VALUES (p_bookid, p_bookname, p_publisher, p_price);
  END IF;
EXCEPTION 
  WHEN OTHERS THEN
    ROLLBACK;
    r_errcode := SQLCODE;
    r_errmsg := SQLERRM;
    DBMS_OUTPUT.PUT_LINE('ERROR:'||SQLCODE||'-'||SQLERRM);
END;


/
--------------------------------------------------------
--  DDL for Function GRADE
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "GRADE" (
  p_custid Customer.custid%TYPE
) RETURN VARCHAR2
IS 
l_grade VARCHAR(6);
l_sum NUMBER;
BEGIN
  SELECT SUM(saleprice)  INTO l_sum
    FROM Orders 
    where custid = p_custid;
  IF l_sum >=100 THEN
    l_grade := '우수';
  ELSE 
    l_grade := '일반';
  END IF;
  RETURN l_grade;
END;


/
--------------------------------------------------------
--  Constraints for Table SUBJECT
--------------------------------------------------------

  ALTER TABLE "SUBJECT" MODIFY ("SUBJECT_NUM" NOT NULL ENABLE);
  ALTER TABLE "SUBJECT" MODIFY ("TITLE" NOT NULL ENABLE);
  ALTER TABLE "SUBJECT" MODIFY ("USER_NUM" NOT NULL ENABLE);
  ALTER TABLE "SUBJECT" MODIFY ("CREATE_AT" NOT NULL ENABLE);
  ALTER TABLE "SUBJECT" ADD CONSTRAINT "SUBJECT_PK" PRIMARY KEY ("SUBJECT_NUM")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CHALLENGE
--------------------------------------------------------

  ALTER TABLE "CHALLENGE" MODIFY ("MEMORY_LIMIT" NOT NULL ENABLE);
  ALTER TABLE "CHALLENGE" MODIFY ("TIME_LIMIT" NOT NULL ENABLE);
  ALTER TABLE "CHALLENGE" MODIFY ("C_NUM" NOT NULL ENABLE);
  ALTER TABLE "CHALLENGE" MODIFY ("CONTENT" NOT NULL ENABLE);
  ALTER TABLE "CHALLENGE" MODIFY ("TITLE" NOT NULL ENABLE);
  ALTER TABLE "CHALLENGE" MODIFY ("PASS_NUM" NOT NULL ENABLE);
  ALTER TABLE "CHALLENGE" MODIFY ("CREATED_AT" NOT NULL ENABLE);
  ALTER TABLE "CHALLENGE" ADD CONSTRAINT "CHALLENGE_PK" PRIMARY KEY ("C_NUM")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "CHALLENGE" MODIFY ("USER_NUM" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table FNSH_TEST
--------------------------------------------------------

  ALTER TABLE "FNSH_TEST" MODIFY ("TEST_NUM" NOT NULL ENABLE);
  ALTER TABLE "FNSH_TEST" MODIFY ("UNIT_NUM" NOT NULL ENABLE);
  ALTER TABLE "FNSH_TEST" MODIFY ("TITLE" NOT NULL ENABLE);
  ALTER TABLE "FNSH_TEST" MODIFY ("CONTENT" NOT NULL ENABLE);
  ALTER TABLE "FNSH_TEST" MODIFY ("DIFFICULTY" NOT NULL ENABLE);
  ALTER TABLE "FNSH_TEST" MODIFY ("CORRECT_ANSWER" NOT NULL ENABLE);
  ALTER TABLE "FNSH_TEST" MODIFY ("CREATED_AT" NOT NULL ENABLE);
  ALTER TABLE "FNSH_TEST" ADD CONSTRAINT "FNSH_TEST_PK" PRIMARY KEY ("TEST_NUM")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CHALLENGE_RESULT
--------------------------------------------------------

  ALTER TABLE "CHALLENGE_RESULT" MODIFY ("PROCESSING_TIME" NOT NULL ENABLE);
  ALTER TABLE "CHALLENGE_RESULT" MODIFY ("USED_MEMORY" NOT NULL ENABLE);
  ALTER TABLE "CHALLENGE_RESULT" ADD CONSTRAINT "CHALLENGE_RESULT_PK" PRIMARY KEY ("RESULT_NUM")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "CHALLENGE_RESULT" MODIFY ("C_NUM" NOT NULL ENABLE);
  ALTER TABLE "CHALLENGE_RESULT" MODIFY ("CODE" NOT NULL ENABLE);
  ALTER TABLE "CHALLENGE_RESULT" MODIFY ("RESULT_NUM" NOT NULL ENABLE);
  ALTER TABLE "CHALLENGE_RESULT" MODIFY ("USER_NUM" NOT NULL ENABLE);
  ALTER TABLE "CHALLENGE_RESULT" MODIFY ("STATUS" NOT NULL ENABLE);
  ALTER TABLE "CHALLENGE_RESULT" MODIFY ("CREATED_AT" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table FNSH_RESULT
--------------------------------------------------------

  ALTER TABLE "FNSH_RESULT" MODIFY ("RESULT_NUM" NOT NULL ENABLE);
  ALTER TABLE "FNSH_RESULT" MODIFY ("TEST_NUM" NOT NULL ENABLE);
  ALTER TABLE "FNSH_RESULT" MODIFY ("ANSWER" NOT NULL ENABLE);
  ALTER TABLE "FNSH_RESULT" MODIFY ("STATUS" NOT NULL ENABLE);
  ALTER TABLE "FNSH_RESULT" MODIFY ("CREATED_AT" NOT NULL ENABLE);
  ALTER TABLE "FNSH_RESULT" ADD CONSTRAINT "FNSH_RESULT_PK" PRIMARY KEY ("RESULT_NUM")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "FNSH_RESULT" MODIFY ("USER_NUM" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CHALLENGE_CASE
--------------------------------------------------------

  ALTER TABLE "CHALLENGE_CASE" MODIFY ("CASE_NUM" NOT NULL ENABLE);
  ALTER TABLE "CHALLENGE_CASE" MODIFY ("C_NUM" NOT NULL ENABLE);
  ALTER TABLE "CHALLENGE_CASE" MODIFY ("INPUT" NOT NULL ENABLE);
  ALTER TABLE "CHALLENGE_CASE" MODIFY ("OUTPUT" NOT NULL ENABLE);
  ALTER TABLE "CHALLENGE_CASE" MODIFY ("USER_NUM" NOT NULL ENABLE);
  ALTER TABLE "CHALLENGE_CASE" MODIFY ("CREATED_AT" NOT NULL ENABLE);
  ALTER TABLE "CHALLENGE_CASE" ADD CONSTRAINT "TABLE1_PK" PRIMARY KEY ("CASE_NUM")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table APP_USER
--------------------------------------------------------

  ALTER TABLE "APP_USER" MODIFY ("USER_NUM" NOT NULL ENABLE);
  ALTER TABLE "APP_USER" MODIFY ("EMAIL" NOT NULL ENABLE);
  ALTER TABLE "APP_USER" MODIFY ("PW" NOT NULL ENABLE);
  ALTER TABLE "APP_USER" MODIFY ("NICKNAME" NOT NULL ENABLE);
  ALTER TABLE "APP_USER" MODIFY ("CREATED_AT" NOT NULL ENABLE);
  ALTER TABLE "APP_USER" MODIFY ("TYPE" NOT NULL ENABLE);
  ALTER TABLE "APP_USER" ADD CONSTRAINT "APP_USER_PK" PRIMARY KEY ("USER_NUM")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table UNIT_COMPLETION
--------------------------------------------------------

  ALTER TABLE "UNIT_COMPLETION" MODIFY ("COM_NUM" NOT NULL ENABLE);
  ALTER TABLE "UNIT_COMPLETION" MODIFY ("USER_NUM1" NOT NULL ENABLE);
  ALTER TABLE "UNIT_COMPLETION" MODIFY ("UNIT_NUM1" NOT NULL ENABLE);
  ALTER TABLE "UNIT_COMPLETION" MODIFY ("STATUS" NOT NULL ENABLE);
  ALTER TABLE "UNIT_COMPLETION" MODIFY ("CREATED_AT" NOT NULL ENABLE);
  ALTER TABLE "UNIT_COMPLETION" ADD CONSTRAINT "UNIT_COMPLETION_PK" PRIMARY KEY ("COM_NUM", "USER_NUM1")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "JAVA_STUDY"  ENABLE;
--------------------------------------------------------
--  Constraints for Table UNIT
--------------------------------------------------------

  ALTER TABLE "UNIT" MODIFY ("UNIT_NUM" NOT NULL ENABLE);
  ALTER TABLE "UNIT" MODIFY ("SUBJECT_NUM" NOT NULL ENABLE);
  ALTER TABLE "UNIT" MODIFY ("CONTENT" NOT NULL ENABLE);
  ALTER TABLE "UNIT" MODIFY ("TITLE" NOT NULL ENABLE);
  ALTER TABLE "UNIT" MODIFY ("CHAPTER_DEPTH" NOT NULL ENABLE);
  ALTER TABLE "UNIT" MODIFY ("CREATED_AT" NOT NULL ENABLE);
  ALTER TABLE "UNIT" ADD CONSTRAINT "UNIT_PK" PRIMARY KEY ("UNIT_NUM")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table CHALLENGE
--------------------------------------------------------

  ALTER TABLE "CHALLENGE" ADD CONSTRAINT "CHALLENGE_FK1" FOREIGN KEY ("USER_NUM")
	  REFERENCES "APP_USER" ("USER_NUM") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table CHALLENGE_CASE
--------------------------------------------------------

  ALTER TABLE "CHALLENGE_CASE" ADD CONSTRAINT "CHALLENGE_CASE_FK1" FOREIGN KEY ("C_NUM")
	  REFERENCES "CHALLENGE" ("C_NUM") ENABLE;
  ALTER TABLE "CHALLENGE_CASE" ADD CONSTRAINT "CHALLENGE_CASE_FK2" FOREIGN KEY ("USER_NUM")
	  REFERENCES "APP_USER" ("USER_NUM") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table CHALLENGE_RESULT
--------------------------------------------------------

  ALTER TABLE "CHALLENGE_RESULT" ADD CONSTRAINT "CHALLENGE_RESULT_FK1" FOREIGN KEY ("C_NUM")
	  REFERENCES "CHALLENGE" ("C_NUM") ENABLE;
  ALTER TABLE "CHALLENGE_RESULT" ADD CONSTRAINT "CHALLENGE_RESULT_FK2" FOREIGN KEY ("USER_NUM")
	  REFERENCES "APP_USER" ("USER_NUM") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table FNSH_RESULT
--------------------------------------------------------

  ALTER TABLE "FNSH_RESULT" ADD CONSTRAINT "FNSH_RESULT_FK1" FOREIGN KEY ("TEST_NUM")
	  REFERENCES "FNSH_TEST" ("TEST_NUM") ENABLE;
  ALTER TABLE "FNSH_RESULT" ADD CONSTRAINT "FNSH_RESULT_FK2" FOREIGN KEY ("USER_NUM")
	  REFERENCES "APP_USER" ("USER_NUM") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table FNSH_TEST
--------------------------------------------------------

  ALTER TABLE "FNSH_TEST" ADD CONSTRAINT "FNSH_TEST_FK1" FOREIGN KEY ("UNIT_NUM")
	  REFERENCES "UNIT" ("UNIT_NUM") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table SUBJECT
--------------------------------------------------------

  ALTER TABLE "SUBJECT" ADD CONSTRAINT "SUBJECT_FK1" FOREIGN KEY ("USER_NUM")
	  REFERENCES "APP_USER" ("USER_NUM") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table UNIT
--------------------------------------------------------

  ALTER TABLE "UNIT" ADD CONSTRAINT "UNIT_FK1" FOREIGN KEY ("SUBJECT_NUM")
	  REFERENCES "SUBJECT" ("SUBJECT_NUM") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table UNIT_COMPLETION
--------------------------------------------------------

  ALTER TABLE "UNIT_COMPLETION" ADD CONSTRAINT "UNIT_COMPLETION_FK1" FOREIGN KEY ("UNIT_NUM1")
	  REFERENCES "UNIT" ("UNIT_NUM") ENABLE;
  ALTER TABLE "UNIT_COMPLETION" ADD CONSTRAINT "UNIT_COMPLETION_FK2" FOREIGN KEY ("USER_NUM1")
	  REFERENCES "APP_USER" ("USER_NUM") ENABLE;
