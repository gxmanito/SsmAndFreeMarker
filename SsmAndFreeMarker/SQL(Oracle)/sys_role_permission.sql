 
create table SYS_ROLE_PERMISSION
(
  SYS_ID     VARCHAR2(2) not null,
  ROLE_ID    VARCHAR2(5) not null,
  PERMISSION VARCHAR2(10) not null
);
comment on table SYS_ROLE_PERMISSION
  is 'SYS_ROLE_PERMISSION';
alter table SYS_ROLE_PERMISSION
  add primary key (SYS_ID, ROLE_ID, PERMISSION);
 
insert into SYS_ROLE_PERMISSION (SYS_ID, ROLE_ID, PERMISSION)
values ('01', '02', 'vip');
insert into SYS_ROLE_PERMISSION (SYS_ID, ROLE_ID, PERMISSION)
values ('02', 'noKey', 'noKey');
commit;
