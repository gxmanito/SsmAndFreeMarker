 
create table SYS_ROLE
(
  SYS_ID    VARCHAR2(2) not null,
  ROLE_ID   VARCHAR2(5) not null,
  ROLE_NAME VARCHAR2(30) not null,
  REMARKS   VARCHAR2(250)
);
comment on table SYS_ROLE
  is '用户角色';
comment on column SYS_ROLE.SYS_ID
  is '系统id';
comment on column SYS_ROLE.ROLE_ID
  is '角色id';
comment on column SYS_ROLE.ROLE_NAME
  is '角色名称';
comment on column SYS_ROLE.REMARKS
  is '备注';
alter table SYS_ROLE
  add constraint PK_SYS_ROLE primary key (SYS_ID, ROLE_ID);
 
insert into SYS_ROLE (SYS_ID, ROLE_ID, ROLE_NAME, REMARKS)
values ('03', '04', '县区监管', null);
insert into SYS_ROLE (SYS_ID, ROLE_ID, ROLE_NAME, REMARKS)
values ('03', '03', '公共账号', null);
insert into SYS_ROLE (SYS_ID, ROLE_ID, ROLE_NAME, REMARKS)
values ('00', 'admin', '管理员', null);
insert into SYS_ROLE (SYS_ID, ROLE_ID, ROLE_NAME, REMARKS)
values ('01', 'admin', '管理员', null);
insert into SYS_ROLE (SYS_ID, ROLE_ID, ROLE_NAME, REMARKS)
values ('02', 'admin', '管理员', null);
insert into SYS_ROLE (SYS_ID, ROLE_ID, ROLE_NAME, REMARKS)
values ('03', 'admin', '管理员', null);
insert into SYS_ROLE (SYS_ID, ROLE_ID, ROLE_NAME, REMARKS)
values ('04', 'admin', '管理员', null);
insert into SYS_ROLE (SYS_ID, ROLE_ID, ROLE_NAME, REMARKS)
values ('01', '01', '银行抵押', null);
insert into SYS_ROLE (SYS_ID, ROLE_ID, ROLE_NAME, REMARKS)
values ('02', '02', 'ukey', '房地产业务(vip)有key');
insert into SYS_ROLE (SYS_ID, ROLE_ID, ROLE_NAME, REMARKS)
values ('03', '01', '报表管理', null);
insert into SYS_ROLE (SYS_ID, ROLE_ID, ROLE_NAME, REMARKS)
values ('03', '02', '监管', null);
insert into SYS_ROLE (SYS_ID, ROLE_ID, ROLE_NAME, REMARKS)
values ('04', '01', '监控角色', null);
insert into SYS_ROLE (SYS_ID, ROLE_ID, ROLE_NAME, REMARKS)
values ('01', '02', '高级用户', null);
insert into SYS_ROLE (SYS_ID, ROLE_ID, ROLE_NAME, REMARKS)
values ('02', 'noKey', 'noKey', 'noKey');
commit;
