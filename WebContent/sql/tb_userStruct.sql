-----------------------------------------
-- Export file for user SCOTT          --
-- Created by �Խ� on 2019/6/25, 9:49:47 --
-----------------------------------------

set define off
spool tb_userStruct.log

prompt
prompt Creating table TB_USER
prompt ======================
prompt
create table TB_USER
(
  rid      varchar2(8),
  password VARCHAR2(20)
)
;
alter table TB_USER
  add foreign key (RID)
  references READER (RID);


spool off
