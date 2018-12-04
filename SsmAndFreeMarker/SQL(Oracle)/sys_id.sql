 
create table SYS_ID
(
  SYS_ID   VARCHAR2(2),
  SYS_NAME VARCHAR2(50)
);
comment on table SYS_ID
  is '系统id表';
comment on column SYS_ID.SYS_ID
  is '系统标识';
comment on column SYS_ID.SYS_NAME
  is '系统名称';

insert into SYS_ID (SYS_ID, SYS_NAME)
values ('00', '管理后台');
insert into SYS_ID (SYS_ID, SYS_NAME)
values ('01', '银行端');
insert into SYS_ID (SYS_ID, SYS_NAME)
values ('02', '开发商端');
insert into SYS_ID (SYS_ID, SYS_NAME)
values ('03', '报表调度');
insert into SYS_ID (SYS_ID, SYS_NAME)
values ('04', '监控报表');
commit;
