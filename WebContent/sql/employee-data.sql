TEXPORT:V11.02.00
USCOTT
RTABLES
2048
0
64
0
TT�                                               ������ 6�� 26 15:42:9 2019F:\employee-data.sql                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            d    `$	
#G###A�# �T�                                     d    `$	
#G###A�# �TT                                      +00:00   BYTE UNUSED 2 INTERPRETED DISABLE:ALL  
METRICST
TABLE "EMPLOYEE"
CREATE TABLE "EMPLOYEE" ("ID" NUMBER(11, 0), "USERNAME" VARCHAR2(16), "PASSWORD" VARCHAR2(16))  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT) TABLESPACE "USERS" LOGGING NOCOMPRESS
INSERT INTO "EMPLOYEE" ("ID", "USERNAME", "PASSWORD") VALUES (:1, :2, :3)
     T   T      � admin 123456  ��
CREATE UNIQUE INDEX "EMPLOYEE_ID_PK" ON "EMPLOYEE" ("ID" )  PCTFREE 10 INITRANS 2 MAXTRANS 255 STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT) TABLESPACE "USERS" LOGGING
ANALSTATS IS "EMPLOYEE"
_ BEGIN  DBMS_STATS.SET_INDEX_STATS(NULL,'"EMPLOYEE_ID_PK"',NULL,NULL,NULL,1,1,1,1,1,1,0,6); END;
ALTER TABLE "EMPLOYEE" ADD  CONSTRAINT "EMPLOYEE_ID_PK" PRIMARY KEY ("ID") USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT) TABLESPACE "USERS" LOGGING ENABLE 
ANALSTATS TS "EMPLOYEE"
R BEGIN  DBMS_STATS.SET_TABLE_STATS(NULL,'"EMPLOYEE"',NULL,NULL,NULL,1,5,16,6); END;
ANALSTATS TS "EMPLOYEE"
��{ DECLARE  SREC DBMS_STATS.STATREC; BEGIN SREC.MINVAL := 'C102'; SREC.MAXVAL := 'C102'; SREC.EAVS := 0; SREC.CHVALS := NULL; # SREC.NOVALS := DBMS_STATS.NUMARRAY( 1,1& ); SREC.BKVALS := DBMS_STATS.NUMARRAY( 0,1m ); SREC.EPC := 2; DBMS_STATS.SET_COLUMN_STATS(NULL,'"EMPLOYEE"','"ID"', NULL ,NULL,NULL,1,1,0,srec,3,6); END;  
ANALSTATS TS "EMPLOYEE"
��� DECLARE  SREC DBMS_STATS.STATREC; BEGIN SREC.MINVAL := '61646D696E'; SREC.MAXVAL := '61646D696E'; SREC.EAVS := 0; SREC.CHVALS := NULL; # SREC.NOVALS := DBMS_STATS.NUMARRAY(I 505689704736865000000000000000000000,505689704736865000000000000000000000& ); SREC.BKVALS := DBMS_STATS.NUMARRAY( 0,1s ); SREC.EPC := 2; DBMS_STATS.SET_COLUMN_STATS(NULL,'"EMPLOYEE"','"USERNAME"', NULL ,NULL,NULL,1,1,0,srec,6,6); END;  
ANALSTATS TS "EMPLOYEE"
��� DECLARE  SREC DBMS_STATS.STATREC; BEGIN SREC.MINVAL := '313233343536'; SREC.MAXVAL := '313233343536'; SREC.EAVS := 0; SREC.CHVALS := NULL; # SREC.NOVALS := DBMS_STATS.NUMARRAY(I 255440723342226000000000000000000000,255440723342226000000000000000000000& ); SREC.BKVALS := DBMS_STATS.NUMARRAY( 0,1s ); SREC.EPC := 2; DBMS_STATS.SET_COLUMN_STATS(NULL,'"EMPLOYEE"','"PASSWORD"', NULL ,NULL,NULL,1,1,0,srec,7,6); END;  
METRICST��������Լ������
METRICET 1
METRICST����
TABLE "EMPLOYEE"
CREATE FORMAT92TRIG 
�� trigger employee_trigger
!        before insert on employee
        for each row
          when(new.id is null)
          begin
A            select employee_id_seq.nextval into:NEW.ID from dual;
          end;
  
ALTER TRIGGER "EMPLOYEE_TRIGGER"  ENABLE
ENDTABLE
METRICET 2
METRICSTͼ, �����������Ϳ���չ����
METRICET 2
METRICST�ڱ��
METRICET 2
METRICSTPost-inst procedural actions 
METRICET 2
METRICSTDeferred analyze commands 
TABLE "EMPLOYEE"
ANALCOMPUTE TS "EMPLOYEE" ANALYZE  TABLE "EMPLOYEE"  ESTIMATE STATISTICS 
ENDTABLE
METRICET 3
METRICETG0
EXIT
EXIT
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    