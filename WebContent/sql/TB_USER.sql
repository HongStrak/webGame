/*
 Navicat Premium Data Transfer

 Source Server         : oracle
 Source Server Type    : Oracle
 Source Server Version : 110200
 Source Host           : localhost:1521
 Source Schema         : SCOTT

 Target Server Type    : Oracle
 Target Server Version : 110200
 File Encoding         : 65001

 Date: 08/07/2019 08:42:58
*/


-- ----------------------------
-- Table structure for TB_USER
-- ----------------------------

DROP TABLE "SCOTT"."TB_USER";
CREATE TABLE "SCOTT"."TB_USER" (
  "ID" NUMBER(11) NOT NULL ,
  "USERNAME" VARCHAR2(16 BYTE) ,
  "PASSWORD" VARCHAR2(16 BYTE) ,
  "CREDIT" NUMBER(11) ,
  "CDAY" NUMBER(11) 
)
TABLESPACE "USERS"
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Records of TB_USER
-- ----------------------------
INSERT INTO "SCOTT"."TB_USER" VALUES ('1', 'kaiy01', '987654321', '100', '0');
INSERT INTO "SCOTT"."TB_USER" VALUES ('2', 'kaiy02', '987654321', '60', '10');
INSERT INTO "SCOTT"."TB_USER" VALUES ('3', 'kaiy02', '987654321', '50', '20');
INSERT INTO "SCOTT"."TB_USER" VALUES ('7', 'kaiy02', '987654321', '50', '20');
INSERT INTO "SCOTT"."TB_USER" VALUES ('6', 'kaiy02', '987654321', '50', '20');
INSERT INTO "SCOTT"."TB_USER" VALUES ('4', 'kaiy02', '987654321', '50', '20');
INSERT INTO "SCOTT"."TB_USER" VALUES ('5', 'kaiy02', '987654321', '50', '20');

-- ----------------------------
-- Primary Key structure for table TB_USER
-- ----------------------------
ALTER TABLE "SCOTT"."TB_USER" ADD CONSTRAINT "SYS_C0012358" PRIMARY KEY ("ID");

-- ----------------------------
-- Triggers structure for table TB_USER
-- ----------------------------
CREATE TRIGGER "SCOTT"."USER_TRIGGER" BEFORE INSERT ON "SCOTT"."TB_USER" REFERENCING OLD AS "OLD" NEW AS "NEW" FOR EACH ROW WHEN (new.id is null) 
begin
           select user_seq.nextval into:NEW.ID from dual;
         end;
/
