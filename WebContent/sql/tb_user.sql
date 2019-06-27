prompt PL/SQL Developer import file
prompt Created on 2019Äê6ÔÂ25ÈÕ by ÕÔ½¡
set feedback off
set define off
prompt Disabling triggers for TB_USER...
alter table TB_USER disable all triggers;
prompt Disabling foreign key constraints for TB_USER...
alter table TB_USER disable constraint SYS_C0011360;
prompt Deleting TB_USER...
delete from TB_USER;
commit;
prompt Loading TB_USER...
insert into TB_USER (rid, password)
values (161009140, '123456');
commit;
prompt 1 records loaded
prompt Enabling foreign key constraints for TB_USER...
alter table TB_USER enable constraint SYS_C0011360;
prompt Enabling triggers for TB_USER...
alter table TB_USER enable all triggers;
set feedback on
set define on
prompt Done.
