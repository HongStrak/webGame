---------------------------------------------
-- Export file for user SCOTT              --
-- Created by 26312 on 2019/6/26, 15:35:37 --
---------------------------------------------

set define off
spool employee.log

prompt
prompt Creating table EMPLOYEE
prompt =======================
prompt
create table SCOTT.EMPLOYEE
(
  id       NUMBER(11) not null,
  username VARCHAR2(16),
  password VARCHAR2(16)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table SCOTT.EMPLOYEE
  add constraint EMPLOYEE_ID_PK primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );


spool off
