 
create table SYS_ROLE_RESOURCE
(
  SYS_ID  VARCHAR2(2) not null,
  ROLE_ID VARCHAR2(5) not null,
  RES_ID  NUMBER(10) not null
);
comment on table SYS_ROLE_RESOURCE
  is '角色资源';
alter table SYS_ROLE_RESOURCE
  add constraint PK_SYS_ROLE_RESOURCE primary key (SYS_ID, ROLE_ID, RES_ID);
--给用户授权
--grant select on SYS_ROLE_RESOURCE to BBTJ;

 
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('00', 'admin', 99);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('00', 'admin', 9901);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('00', 'admin', 9902);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('00', 'admin', 9903);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('00', 'admin', 9904);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('00', 'admin', 9905);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('00', 'admin', 9906);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('01', '01', 15);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('01', '01', 1501);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('01', '01', 1502);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('01', '01', 1503);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('01', '01', 1504);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('01', '01', 1505);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('01', '01', 1507);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('01', '01', 1508);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('01', '01', 1509);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('01', '02', 15);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('01', '02', 30);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('01', '02', 40);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('01', '02', 1501);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('01', '02', 1502);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('01', '02', 1503);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('01', '02', 1504);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('01', '02', 1505);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('01', '02', 1506);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('01', '02', 1507);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('01', '02', 1508);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('01', '02', 1509);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('01', '02', 3001);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('01', '02', 3002);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('01', '02', 4002);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('01', '02', 4003);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('01', 'admin', 15);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('01', 'admin', 30);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('01', 'admin', 40);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('01', 'admin', 1501);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('01', 'admin', 1502);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('01', 'admin', 1503);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('01', 'admin', 1504);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('01', 'admin', 1505);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('01', 'admin', 1506);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('01', 'admin', 1507);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('01', 'admin', 1508);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('01', 'admin', 1509);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('01', 'admin', 3001);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('01', 'admin', 3002);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('01', 'admin', 3003);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('01', 'admin', 3004);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('01', 'admin', 4002);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('01', 'admin', 4003);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('02', '02', 16);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('02', '02', 1601);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('02', '02', 1602);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('02', '02', 1603);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('02', 'admin', 16);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('02', 'admin', 1601);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('02', 'admin', 1602);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('02', 'admin', 1603);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('02', 'admin', 1604);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('02', 'admin', 160301);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('02', 'noKey', 16);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('02', 'noKey', 1601);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('02', 'noKey', 1602);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('02', 'noKey', 1603);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('02', 'noKey', 1604);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('03', '01', 40);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('03', '01', 50);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('03', '01', 60);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('03', '01', 99);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('03', '01', 4001);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('03', '01', 4002);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('03', '01', 5001);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('03', '01', 5002);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('03', '01', 5003);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('03', '01', 5004);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('03', '01', 6001);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('03', '01', 6002);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('03', '01', 9907);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('03', '02', 50);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('03', '02', 5001);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('03', '02', 5002);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('03', '02', 5003);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('03', '02', 5004);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('03', '02', 5005);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('03', '03', 40);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('03', '03', 50);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('03', '03', 60);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('03', '03', 4001);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('03', '03', 4002);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('03', '03', 4003);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('03', '03', 4004);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('03', '03', 4005);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('03', '03', 4006);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('03', '03', 4007);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('03', '03', 4008);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('03', '03', 5001);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('03', '03', 5002);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('03', '03', 5003);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('03', '03', 5004);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('03', '03', 5005);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('03', '03', 6001);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('03', '03', 6002);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('03', '04', 40);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('03', '04', 50);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('03', '04', 60);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('03', '04', 4001);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('03', '04', 4002);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('03', '04', 4003);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('03', '04', 4004);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('03', '04', 4005);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('03', '04', 5001);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('03', '04', 5002);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('03', '04', 5005);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('03', '04', 6001);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('03', '04', 6002);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('03', 'admin', 40);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('03', 'admin', 50);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('03', 'admin', 60);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('03', 'admin', 80);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('03', 'admin', 99);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('03', 'admin', 4001);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('03', 'admin', 4002);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('03', 'admin', 4003);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('03', 'admin', 4004);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('03', 'admin', 4005);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('03', 'admin', 4006);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('03', 'admin', 4007);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('03', 'admin', 4008);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('03', 'admin', 4009);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('03', 'admin', 4010);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('03', 'admin', 4011);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('03', 'admin', 4012);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('03', 'admin', 5001);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('03', 'admin', 5002);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('03', 'admin', 5003);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('03', 'admin', 5004);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('03', 'admin', 5005);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('03', 'admin', 5006);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('03', 'admin', 6001);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('03', 'admin', 6002);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('03', 'admin', 8001);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('03', 'admin', 8002);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('03', 'admin', 9906);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('03', 'admin', 9907);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('04', '01', 30);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('04', '01', 40);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('04', '01', 50);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('04', '01', 3001);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('04', '01', 3002);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('04', '01', 3003);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('04', '01', 3004);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('04', '01', 4001);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('04', '01', 4002);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('04', '01', 4003);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('04', '01', 4004);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('04', '01', 4005);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('04', '01', 4006);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('04', '01', 4007);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('04', '01', 5001);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('04', '01', 5002);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('04', 'admin', 30);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('04', 'admin', 40);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('04', 'admin', 50);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('04', 'admin', 3001);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('04', 'admin', 3002);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('04', 'admin', 3003);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('04', 'admin', 3004);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('04', 'admin', 4001);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('04', 'admin', 4002);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('04', 'admin', 4003);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('04', 'admin', 4004);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('04', 'admin', 4005);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('04', 'admin', 4006);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('04', 'admin', 4007);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('04', 'admin', 4008);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('04', 'admin', 5001);
insert into SYS_ROLE_RESOURCE (SYS_ID, ROLE_ID, RES_ID)
values ('04', 'admin', 5002);
commit;
