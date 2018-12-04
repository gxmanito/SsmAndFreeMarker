 
create table SYS_RESOURCE
(
  SYS_ID     VARCHAR2(2) not null,
  RES_ID     NUMBER(10) not null,
  PARENT     NUMBER(10) not null,
  RES_NAME   VARCHAR2(50) not null,
  RES_PY     VARCHAR2(50),
  RES_TYPE   NUMBER(3) not null,
  RES_URL    VARCHAR2(200),
  ICON       VARCHAR2(50),
  STATE      NUMBER(3) default 0 not null,
  PERMISSION VARCHAR2(10),
  REMARKS    VARCHAR2(250),
  LVL        NUMBER(3),
  LFT        NUMBER(10),
  RGT        NUMBER(10)
);
comment on table SYS_RESOURCE
  is '系统资源';
comment on column SYS_RESOURCE.SYS_ID
  is '系统id';
comment on column SYS_RESOURCE.RES_ID
  is '资源id';
comment on column SYS_RESOURCE.PARENT
  is '上级资源id';
comment on column SYS_RESOURCE.RES_NAME
  is '资源名称';
comment on column SYS_RESOURCE.RES_PY
  is '名称拼音';
comment on column SYS_RESOURCE.RES_TYPE
  is '资源类型 sys_code.code_type=2';
comment on column SYS_RESOURCE.RES_URL
  is '资源地址';
comment on column SYS_RESOURCE.ICON
  is '显示图标';
comment on column SYS_RESOURCE.STATE
  is '状态 sys_code.code_type=3';
comment on column SYS_RESOURCE.PERMISSION
  is '所需权限';
comment on column SYS_RESOURCE.REMARKS
  is '备注';
comment on column SYS_RESOURCE.LVL
  is '等级/深度';
comment on column SYS_RESOURCE.LFT
  is '左值';
comment on column SYS_RESOURCE.RGT
  is '右值';
alter table SYS_RESOURCE
  add constraint PK_SYS_RESOURCE primary key (SYS_ID, RES_ID);
 
insert into SYS_RESOURCE (SYS_ID, RES_ID, PARENT, RES_NAME, RES_PY, RES_TYPE, RES_URL, ICON, STATE, PERMISSION, REMARKS, LVL, LFT, RGT)
values ('04', 4008, 40, '评价意见统计表', 'pjyjtjb', 1, '/stats/evaluate', null, 0, null, null, 1, 26, 27);
insert into SYS_RESOURCE (SYS_ID, RES_ID, PARENT, RES_NAME, RES_PY, RES_TYPE, RES_URL, ICON, STATE, PERMISSION, REMARKS, LVL, LFT, RGT)
values ('00', 9906, 99, 'Ukeyc管理', 'Ukeycgl', 1, '/uKey/uKeyView', null, 0, null, null, 1, 12, 13);
insert into SYS_RESOURCE (SYS_ID, RES_ID, PARENT, RES_NAME, RES_PY, RES_TYPE, RES_URL, ICON, STATE, PERMISSION, REMARKS, LVL, LFT, RGT)
values ('00', 99, 0, '系统管理', 'xtgl', 0, '/sys/**', 'settings', 0, null, null, 0, 1, 14);
insert into SYS_RESOURCE (SYS_ID, RES_ID, PARENT, RES_NAME, RES_PY, RES_TYPE, RES_URL, ICON, STATE, PERMISSION, REMARKS, LVL, LFT, RGT)
values ('00', 9901, 99, '资源管理', 'zygl', 1, '/sys/res', null, 0, null, null, 1, 2, 3);
insert into SYS_RESOURCE (SYS_ID, RES_ID, PARENT, RES_NAME, RES_PY, RES_TYPE, RES_URL, ICON, STATE, PERMISSION, REMARKS, LVL, LFT, RGT)
values ('00', 9902, 99, '用户管理', 'yhgl', 1, '/sys/user', null, 0, null, null, 1, 4, 5);
insert into SYS_RESOURCE (SYS_ID, RES_ID, PARENT, RES_NAME, RES_PY, RES_TYPE, RES_URL, ICON, STATE, PERMISSION, REMARKS, LVL, LFT, RGT)
values ('00', 9904, 99, '数据字典管理', 'sjzdgl', 1, '/sys/dict', null, 0, null, null, 1, 8, 9);
insert into SYS_RESOURCE (SYS_ID, RES_ID, PARENT, RES_NAME, RES_PY, RES_TYPE, RES_URL, ICON, STATE, PERMISSION, REMARKS, LVL, LFT, RGT)
values ('00', 9905, 99, '用户机构管理', 'yhjggl', 1, '/sys/userOrg', null, 0, null, null, 1, 10, 11);
insert into SYS_RESOURCE (SYS_ID, RES_ID, PARENT, RES_NAME, RES_PY, RES_TYPE, RES_URL, ICON, STATE, PERMISSION, REMARKS, LVL, LFT, RGT)
values ('01', 15, 0, '登记申请', 'djsq', 0, '/bank/**', null, 0, null, null, 0, 1, 20);
insert into SYS_RESOURCE (SYS_ID, RES_ID, PARENT, RES_NAME, RES_PY, RES_TYPE, RES_URL, ICON, STATE, PERMISSION, REMARKS, LVL, LFT, RGT)
values ('01', 1501, 15, '现房抵押申请', 'xfdysq', 1, '/bank/pledge?registType=0201', null, 0, null, null, 1, 2, 3);
insert into SYS_RESOURCE (SYS_ID, RES_ID, PARENT, RES_NAME, RES_PY, RES_TYPE, RES_URL, ICON, STATE, PERMISSION, REMARKS, LVL, LFT, RGT)
values ('01', 1502, 15, '预购商品房抵押申请', 'ygspfdysq', 1, '/bank/pledge?registType=0304', null, 0, null, null, 1, 4, 5);
insert into SYS_RESOURCE (SYS_ID, RES_ID, PARENT, RES_NAME, RES_PY, RES_TYPE, RES_URL, ICON, STATE, PERMISSION, REMARKS, LVL, LFT, RGT)
values ('01', 1504, 15, '现房抵押注销申请', 'xfdyzxsq', 1, '/bank/arrivedCancel-pledge?registType=0204', null, 0, null, null, 1, 6, 7);
insert into SYS_RESOURCE (SYS_ID, RES_ID, PARENT, RES_NAME, RES_PY, RES_TYPE, RES_URL, ICON, STATE, PERMISSION, REMARKS, LVL, LFT, RGT)
values ('01', 1505, 15, '预购商品房抵押注销申请', 'ygspfdyzxsq', 1, '/bank/arrivedCancel-pledge?registType=0305', null, 0, null, null, 1, 8, 9);
insert into SYS_RESOURCE (SYS_ID, RES_ID, PARENT, RES_NAME, RES_PY, RES_TYPE, RES_URL, ICON, STATE, PERMISSION, REMARKS, LVL, LFT, RGT)
values ('01', 1503, 15, '已受理业务查询', 'yslywcx', 1, '/bank/pledge-history', null, 0, null, null, 1, 14, 15);
insert into SYS_RESOURCE (SYS_ID, RES_ID, PARENT, RES_NAME, RES_PY, RES_TYPE, RES_URL, ICON, STATE, PERMISSION, REMARKS, LVL, LFT, RGT)
values ('02', 16, 0, '开发商业务', 'kfsyw', 0, '/developers/**', null, 0, null, null, 0, 1, 12);
insert into SYS_RESOURCE (SYS_ID, RES_ID, PARENT, RES_NAME, RES_PY, RES_TYPE, RES_URL, ICON, STATE, PERMISSION, REMARKS, LVL, LFT, RGT)
values ('02', 1602, 16, '首次登记', 'scdj', 1, '/developers/regist?registType=0101', null, 0, null, null, 1, 4, 5);
insert into SYS_RESOURCE (SYS_ID, RES_ID, PARENT, RES_NAME, RES_PY, RES_TYPE, RES_URL, ICON, STATE, PERMISSION, REMARKS, LVL, LFT, RGT)
values ('02', 1603, 16, '转移登记', 'zydj', 1, '/developers/regist?registType=0102', null, 0, null, null, 1, 8, 11);
insert into SYS_RESOURCE (SYS_ID, RES_ID, PARENT, RES_NAME, RES_PY, RES_TYPE, RES_URL, ICON, STATE, PERMISSION, REMARKS, LVL, LFT, RGT)
values ('03', 50, 0, '数据监控', 'sjjk', 0, null, null, 0, null, null, 0, 1, 14);
insert into SYS_RESOURCE (SYS_ID, RES_ID, PARENT, RES_NAME, RES_PY, RES_TYPE, RES_URL, ICON, STATE, PERMISSION, REMARKS, LVL, LFT, RGT)
values ('03', 5001, 50, '实时监控', 'ssjk', 1, '/stats/monitorPage', null, 0, null, null, 1, 2, 3);
insert into SYS_RESOURCE (SYS_ID, RES_ID, PARENT, RES_NAME, RES_PY, RES_TYPE, RES_URL, ICON, STATE, PERMISSION, REMARKS, LVL, LFT, RGT)
values ('03', 5002, 50, '综合监控', 'zhjk', 1, '/stats/integratedMonitor', null, 0, null, null, 1, 4, 5);
insert into SYS_RESOURCE (SYS_ID, RES_ID, PARENT, RES_NAME, RES_PY, RES_TYPE, RES_URL, ICON, STATE, PERMISSION, REMARKS, LVL, LFT, RGT)
values ('03', 5003, 50, '中心预约监控', 'zxyyjk', 1, '/stats/wxMonitoringReverseDept', null, 0, null, null, 1, 6, 7);
insert into SYS_RESOURCE (SYS_ID, RES_ID, PARENT, RES_NAME, RES_PY, RES_TYPE, RES_URL, ICON, STATE, PERMISSION, REMARKS, LVL, LFT, RGT)
values ('03', 5004, 50, '业务预约监控', 'ywyyjk', 1, '/stats/wxMonitoringReverseBusi', null, 0, null, null, 1, 8, 9);
insert into SYS_RESOURCE (SYS_ID, RES_ID, PARENT, RES_NAME, RES_PY, RES_TYPE, RES_URL, ICON, STATE, PERMISSION, REMARKS, LVL, LFT, RGT)
values ('03', 5005, 50, '案卷受理状态监控', 'ajslztjk', 1, '/stats/caseAccept', null, 0, null, null, 1, 12, 13);
insert into SYS_RESOURCE (SYS_ID, RES_ID, PARENT, RES_NAME, RES_PY, RES_TYPE, RES_URL, ICON, STATE, PERMISSION, REMARKS, LVL, LFT, RGT)
values ('03', 40, 0, '数据统计', 'sjtj', 0, null, null, 0, null, null, 0, 15, 40);
insert into SYS_RESOURCE (SYS_ID, RES_ID, PARENT, RES_NAME, RES_PY, RES_TYPE, RES_URL, ICON, STATE, PERMISSION, REMARKS, LVL, LFT, RGT)
values ('03', 4001, 40, '综合业务统计表', 'zhywtjb', 1, '/stats/countPage', null, 0, null, null, 1, 16, 17);
insert into SYS_RESOURCE (SYS_ID, RES_ID, PARENT, RES_NAME, RES_PY, RES_TYPE, RES_URL, ICON, STATE, PERMISSION, REMARKS, LVL, LFT, RGT)
values ('03', 4002, 40, '业务受理统计表', 'ywsltjb', 1, '/stats/integrated', null, 0, null, null, 1, 18, 19);
insert into SYS_RESOURCE (SYS_ID, RES_ID, PARENT, RES_NAME, RES_PY, RES_TYPE, RES_URL, ICON, STATE, PERMISSION, REMARKS, LVL, LFT, RGT)
values ('03', 4003, 40, '业务受理明细表', 'ywslmxb', 1, '/stats/fzxywsl', null, 0, null, null, 1, 20, 21);
insert into SYS_RESOURCE (SYS_ID, RES_ID, PARENT, RES_NAME, RES_PY, RES_TYPE, RES_URL, ICON, STATE, PERMISSION, REMARKS, LVL, LFT, RGT)
values ('03', 4004, 40, '业务收费统计表', 'ywsftjb', 1, '/stats/centerBusiCharge', null, 0, null, null, 1, 22, 23);
insert into SYS_RESOURCE (SYS_ID, RES_ID, PARENT, RES_NAME, RES_PY, RES_TYPE, RES_URL, ICON, STATE, PERMISSION, REMARKS, LVL, LFT, RGT)
values ('03', 4005, 40, '业务收费明细表', 'ywsfmxb', 1, '/stats/fzxywsf', null, 0, null, null, 1, 24, 25);
insert into SYS_RESOURCE (SYS_ID, RES_ID, PARENT, RES_NAME, RES_PY, RES_TYPE, RES_URL, ICON, STATE, PERMISSION, REMARKS, LVL, LFT, RGT)
values ('03', 4006, 40, '微信预约统计表', 'wxyytjb', 1, '/stats/wxReCount', null, 0, null, null, 1, 26, 27);
insert into SYS_RESOURCE (SYS_ID, RES_ID, PARENT, RES_NAME, RES_PY, RES_TYPE, RES_URL, ICON, STATE, PERMISSION, REMARKS, LVL, LFT, RGT)
values ('03', 4007, 40, '微信预约明细表', 'wxyymxb', 1, '/stats/wxReDetail', null, 0, null, null, 1, 28, 29);
insert into SYS_RESOURCE (SYS_ID, RES_ID, PARENT, RES_NAME, RES_PY, RES_TYPE, RES_URL, ICON, STATE, PERMISSION, REMARKS, LVL, LFT, RGT)
values ('03', 60, 0, '绩效分析', 'jxfx', 0, null, null, 0, null, null, 0, 41, 46);
insert into SYS_RESOURCE (SYS_ID, RES_ID, PARENT, RES_NAME, RES_PY, RES_TYPE, RES_URL, ICON, STATE, PERMISSION, REMARKS, LVL, LFT, RGT)
values ('03', 6001, 60, '人员绩效统计表', 'ryjxtjb', 1, '/stats/fzxryjx', null, 0, null, null, 1, 42, 43);
insert into SYS_RESOURCE (SYS_ID, RES_ID, PARENT, RES_NAME, RES_PY, RES_TYPE, RES_URL, ICON, STATE, PERMISSION, REMARKS, LVL, LFT, RGT)
values ('03', 6002, 60, '中心绩效统计表', 'zxjxtjb', 1, '/stats/zxjx', null, 0, null, null, 1, 44, 45);
insert into SYS_RESOURCE (SYS_ID, RES_ID, PARENT, RES_NAME, RES_PY, RES_TYPE, RES_URL, ICON, STATE, PERMISSION, REMARKS, LVL, LFT, RGT)
values ('03', 80, 0, '调度管理', 'ddgl', 0, '/schedule/**', 'clock', 0, null, null, 0, 47, 52);
insert into SYS_RESOURCE (SYS_ID, RES_ID, PARENT, RES_NAME, RES_PY, RES_TYPE, RES_URL, ICON, STATE, PERMISSION, REMARKS, LVL, LFT, RGT)
values ('03', 8001, 80, '任务管理', 'rwgl', 1, '/schedule/sched', null, 0, null, null, 1, 48, 49);
insert into SYS_RESOURCE (SYS_ID, RES_ID, PARENT, RES_NAME, RES_PY, RES_TYPE, RES_URL, ICON, STATE, PERMISSION, REMARKS, LVL, LFT, RGT)
values ('03', 8002, 80, '调度日志', 'ddrz', 1, '/schedule/jobExecLog', null, 0, null, null, 1, 50, 51);
insert into SYS_RESOURCE (SYS_ID, RES_ID, PARENT, RES_NAME, RES_PY, RES_TYPE, RES_URL, ICON, STATE, PERMISSION, REMARKS, LVL, LFT, RGT)
values ('03', 99, 0, '系统管理', 'xtgl', 0, '/sys/**', 'settings', 0, null, null, 0, 53, 58);
insert into SYS_RESOURCE (SYS_ID, RES_ID, PARENT, RES_NAME, RES_PY, RES_TYPE, RES_URL, ICON, STATE, PERMISSION, REMARKS, LVL, LFT, RGT)
values ('03', 9906, 99, '登记类型归类', 'djlxgl', 1, '/sys/regist', null, 0, null, null, 1, 54, 55);
insert into SYS_RESOURCE (SYS_ID, RES_ID, PARENT, RES_NAME, RES_PY, RES_TYPE, RES_URL, ICON, STATE, PERMISSION, REMARKS, LVL, LFT, RGT)
values ('03', 9907, 99, '综合业务指标', 'zhywzb', 1, '/sys/integrated', null, 0, null, null, 1, 56, 57);
insert into SYS_RESOURCE (SYS_ID, RES_ID, PARENT, RES_NAME, RES_PY, RES_TYPE, RES_URL, ICON, STATE, PERMISSION, REMARKS, LVL, LFT, RGT)
values ('04', 30, 0, '数据监控', 'sjjk', 0, null, null, 0, null, null, 0, 1, 10);
insert into SYS_RESOURCE (SYS_ID, RES_ID, PARENT, RES_NAME, RES_PY, RES_TYPE, RES_URL, ICON, STATE, PERMISSION, REMARKS, LVL, LFT, RGT)
values ('04', 3001, 30, '实时监控', 'ssjk', 1, '/stats/monitorPage', null, 0, null, null, 1, 2, 3);
insert into SYS_RESOURCE (SYS_ID, RES_ID, PARENT, RES_NAME, RES_PY, RES_TYPE, RES_URL, ICON, STATE, PERMISSION, REMARKS, LVL, LFT, RGT)
values ('04', 3002, 30, '综合监控', 'zhjk', 1, '/stats/integratedMonitor', null, 0, null, null, 1, 4, 5);
insert into SYS_RESOURCE (SYS_ID, RES_ID, PARENT, RES_NAME, RES_PY, RES_TYPE, RES_URL, ICON, STATE, PERMISSION, REMARKS, LVL, LFT, RGT)
values ('04', 3003, 30, '中心预约监控', 'zxyyjk', 1, '/stats/wxMonitoringReverseDept', null, 0, null, null, 1, 6, 7);
insert into SYS_RESOURCE (SYS_ID, RES_ID, PARENT, RES_NAME, RES_PY, RES_TYPE, RES_URL, ICON, STATE, PERMISSION, REMARKS, LVL, LFT, RGT)
values ('04', 3004, 30, '业务预约监控', 'ywyyjk', 1, '/stats/wxMonitoringReverseBusi', null, 0, null, null, 1, 8, 9);
insert into SYS_RESOURCE (SYS_ID, RES_ID, PARENT, RES_NAME, RES_PY, RES_TYPE, RES_URL, ICON, STATE, PERMISSION, REMARKS, LVL, LFT, RGT)
values ('04', 40, 0, '数据统计', 'sjtj', 0, null, 'ios-pulse-strong', 0, null, null, 0, 11, 28);
insert into SYS_RESOURCE (SYS_ID, RES_ID, PARENT, RES_NAME, RES_PY, RES_TYPE, RES_URL, ICON, STATE, PERMISSION, REMARKS, LVL, LFT, RGT)
values ('04', 4001, 40, '综合业务统计表', 'zhywtjb', 1, '/stats/countPage', null, 0, null, null, 1, 12, 13);
insert into SYS_RESOURCE (SYS_ID, RES_ID, PARENT, RES_NAME, RES_PY, RES_TYPE, RES_URL, ICON, STATE, PERMISSION, REMARKS, LVL, LFT, RGT)
values ('04', 4002, 40, '业务受理统计表', 'ywsltjb', 1, '/stats/integrated', null, 0, null, null, 1, 14, 15);
insert into SYS_RESOURCE (SYS_ID, RES_ID, PARENT, RES_NAME, RES_PY, RES_TYPE, RES_URL, ICON, STATE, PERMISSION, REMARKS, LVL, LFT, RGT)
values ('04', 4003, 40, '业务受理明细表', 'ywslmxb', 1, '/stats/fzxywsl', null, 0, null, null, 1, 16, 17);
insert into SYS_RESOURCE (SYS_ID, RES_ID, PARENT, RES_NAME, RES_PY, RES_TYPE, RES_URL, ICON, STATE, PERMISSION, REMARKS, LVL, LFT, RGT)
values ('04', 4004, 40, '业务收费统计表', 'ywsftjb', 1, '/stats/centerBusiCharge', null, 0, null, null, 1, 18, 19);
insert into SYS_RESOURCE (SYS_ID, RES_ID, PARENT, RES_NAME, RES_PY, RES_TYPE, RES_URL, ICON, STATE, PERMISSION, REMARKS, LVL, LFT, RGT)
values ('04', 4005, 40, '业务收费明细表', 'ywsfmxb', 1, '/stats/fzxywsl', null, 0, null, null, 1, 20, 21);
insert into SYS_RESOURCE (SYS_ID, RES_ID, PARENT, RES_NAME, RES_PY, RES_TYPE, RES_URL, ICON, STATE, PERMISSION, REMARKS, LVL, LFT, RGT)
values ('04', 4006, 40, '微信预约统计表', 'wxyytjb', 1, '/stats/wxReCount', null, 0, null, null, 1, 22, 23);
insert into SYS_RESOURCE (SYS_ID, RES_ID, PARENT, RES_NAME, RES_PY, RES_TYPE, RES_URL, ICON, STATE, PERMISSION, REMARKS, LVL, LFT, RGT)
values ('04', 4007, 40, '微信预约明细表', 'wxyymxb', 1, '/stats/wxReDetail', null, 0, null, null, 1, 24, 25);
insert into SYS_RESOURCE (SYS_ID, RES_ID, PARENT, RES_NAME, RES_PY, RES_TYPE, RES_URL, ICON, STATE, PERMISSION, REMARKS, LVL, LFT, RGT)
values ('04', 50, 0, '绩效分析', 'jxfx', 0, null, null, 0, null, null, 0, 29, 34);
insert into SYS_RESOURCE (SYS_ID, RES_ID, PARENT, RES_NAME, RES_PY, RES_TYPE, RES_URL, ICON, STATE, PERMISSION, REMARKS, LVL, LFT, RGT)
values ('04', 5001, 50, '人员绩效统计表', 'ryjxtjb', 1, '/stats/fzxryjx', null, 0, null, null, 1, 30, 31);
insert into SYS_RESOURCE (SYS_ID, RES_ID, PARENT, RES_NAME, RES_PY, RES_TYPE, RES_URL, ICON, STATE, PERMISSION, REMARKS, LVL, LFT, RGT)
values ('04', 5002, 50, '中心绩效统计表', 'zxjxtjb', 1, '/stats/zxjx', null, 0, null, null, 1, 32, 33);
insert into SYS_RESOURCE (SYS_ID, RES_ID, PARENT, RES_NAME, RES_PY, RES_TYPE, RES_URL, ICON, STATE, PERMISSION, REMARKS, LVL, LFT, RGT)
values ('03', 4008, 40, '评价意见统计表', 'pjyjtjb', 1, '/stats/evaluate', null, 0, null, null, 1, 30, 31);
insert into SYS_RESOURCE (SYS_ID, RES_ID, PARENT, RES_NAME, RES_PY, RES_TYPE, RES_URL, ICON, STATE, PERMISSION, REMARKS, LVL, LFT, RGT)
values ('01', 3001, 30, '不动产权属状态查询', 'bdcqsztcx', 1, '/bank/query', null, 0, null, null, 1, 22, 25);
insert into SYS_RESOURCE (SYS_ID, RES_ID, PARENT, RES_NAME, RES_PY, RES_TYPE, RES_URL, ICON, STATE, PERMISSION, REMARKS, LVL, LFT, RGT)
values ('01', 30, 0, '登记查询', 'djcx', 0, null, null, 0, null, null, 0, 21, 40);
insert into SYS_RESOURCE (SYS_ID, RES_ID, PARENT, RES_NAME, RES_PY, RES_TYPE, RES_URL, ICON, STATE, PERMISSION, REMARKS, LVL, LFT, RGT)
values ('01', 300101, 3001, '不动产情况查询fun', 'bdcqkcxfun', 2, '/bank/queryPropertyPermits', null, 0, 'vip', null, 2, 23, 24);
insert into SYS_RESOURCE (SYS_ID, RES_ID, PARENT, RES_NAME, RES_PY, RES_TYPE, RES_URL, ICON, STATE, PERMISSION, REMARKS, LVL, LFT, RGT)
values ('01', 3002, 30, '登记进度查询', 'djjdcx', 1, '/bank/queryInfo', null, 0, null, null, 1, 26, 29);
insert into SYS_RESOURCE (SYS_ID, RES_ID, PARENT, RES_NAME, RES_PY, RES_TYPE, RES_URL, ICON, STATE, PERMISSION, REMARKS, LVL, LFT, RGT)
values ('01', 300201, 3002, '办理进度查询fun', 'bljdcxfun', 2, '/bank/status-queryStatus', null, 0, 'vip', null, 2, 27, 28);
insert into SYS_RESOURCE (SYS_ID, RES_ID, PARENT, RES_NAME, RES_PY, RES_TYPE, RES_URL, ICON, STATE, PERMISSION, REMARKS, LVL, LFT, RGT)
values ('01', 3003, 30, '登记证明查询', 'djzmcx', 1, '/bank/admissibilityNumber', null, 0, null, null, 1, 30, 33);
insert into SYS_RESOURCE (SYS_ID, RES_ID, PARENT, RES_NAME, RES_PY, RES_TYPE, RES_URL, ICON, STATE, PERMISSION, REMARKS, LVL, LFT, RGT)
values ('01', 300301, 3003, '登记证明查询fun', 'djzmcxfun', 2, '/bank/getAdmissibilityNumber', null, 0, 'vip', null, 2, 31, 32);
insert into SYS_RESOURCE (SYS_ID, RES_ID, PARENT, RES_NAME, RES_PY, RES_TYPE, RES_URL, ICON, STATE, PERMISSION, REMARKS, LVL, LFT, RGT)
values ('01', 3004, 30, '打印', 'dy', 1, '/print', null, 0, null, null, 1, 34, 39);
insert into SYS_RESOURCE (SYS_ID, RES_ID, PARENT, RES_NAME, RES_PY, RES_TYPE, RES_URL, ICON, STATE, PERMISSION, REMARKS, LVL, LFT, RGT)
values ('01', 300401, 3004, '抵押合同打印', 'dyhtdy', 2, '/bank/contractCopy', null, 0, 'vip', null, 2, 35, 36);
insert into SYS_RESOURCE (SYS_ID, RES_ID, PARENT, RES_NAME, RES_PY, RES_TYPE, RES_URL, ICON, STATE, PERMISSION, REMARKS, LVL, LFT, RGT)
values ('01', 300402, 3004, '申请审批表打印', 'sqspbdy', 2, '/bank/applicationPrint', null, 0, 'vip', null, 2, 37, 38);
insert into SYS_RESOURCE (SYS_ID, RES_ID, PARENT, RES_NAME, RES_PY, RES_TYPE, RES_URL, ICON, STATE, PERMISSION, REMARKS, LVL, LFT, RGT)
values ('01', 4002, 40, '未缴费查询', 'wjfcx', 1, '/noPayReport/report', null, 0, null, null, 1, 42, 43);
insert into SYS_RESOURCE (SYS_ID, RES_ID, PARENT, RES_NAME, RES_PY, RES_TYPE, RES_URL, ICON, STATE, PERMISSION, REMARKS, LVL, LFT, RGT)
values ('01', 40, 0, '登记缴费', 'djjf', 0, null, null, 0, null, null, 0, 41, 46);
insert into SYS_RESOURCE (SYS_ID, RES_ID, PARENT, RES_NAME, RES_PY, RES_TYPE, RES_URL, ICON, STATE, PERMISSION, REMARKS, LVL, LFT, RGT)
values ('01', 4003, 40, '已缴费查询', 'yjfcx', 1, '/report/report', null, 0, null, null, 1, 44, 45);
insert into SYS_RESOURCE (SYS_ID, RES_ID, PARENT, RES_NAME, RES_PY, RES_TYPE, RES_URL, ICON, STATE, PERMISSION, REMARKS, LVL, LFT, RGT)
values ('01', 1506, 15, '综合业务查询', 'zhywcx', 1, '/bank/comprehensive', null, 0, null, null, 1, 18, 19);
insert into SYS_RESOURCE (SYS_ID, RES_ID, PARENT, RES_NAME, RES_PY, RES_TYPE, RES_URL, ICON, STATE, PERMISSION, REMARKS, LVL, LFT, RGT)
values ('02', 1601, 16, '预告登记', 'ygdj', 1, '/developers/regist?registType=0303', null, 0, null, null, 1, 2, 3);
insert into SYS_RESOURCE (SYS_ID, RES_ID, PARENT, RES_NAME, RES_PY, RES_TYPE, RES_URL, ICON, STATE, PERMISSION, REMARKS, LVL, LFT, RGT)
values ('03', 4009, 40, 'EMS邮寄统计', 'EMSyjtj', 1, '/stats/emsMailOrder', null, 0, null, null, 1, 32, 33);
insert into SYS_RESOURCE (SYS_ID, RES_ID, PARENT, RES_NAME, RES_PY, RES_TYPE, RES_URL, ICON, STATE, PERMISSION, REMARKS, LVL, LFT, RGT)
values ('01', 1508, 15, '联合抵押注销申请', 'lhdyzxsq', 1, '/bank/unionDYCancel?registType=0224', null, 0, null, null, 1, 12, 13);
insert into SYS_RESOURCE (SYS_ID, RES_ID, PARENT, RES_NAME, RES_PY, RES_TYPE, RES_URL, ICON, STATE, PERMISSION, REMARKS, LVL, LFT, RGT)
values ('01', 1509, 15, '贷后监管', 'dhjg', 1, '/bank/supervise', null, 0, null, null, 1, 16, 17);
insert into SYS_RESOURCE (SYS_ID, RES_ID, PARENT, RES_NAME, RES_PY, RES_TYPE, RES_URL, ICON, STATE, PERMISSION, REMARKS, LVL, LFT, RGT)
values ('02', 160301, 1603, '无key登录', 'wkeydl', 2, '111', null, 0, 'noKey', null, 2, 9, 10);
insert into SYS_RESOURCE (SYS_ID, RES_ID, PARENT, RES_NAME, RES_PY, RES_TYPE, RES_URL, ICON, STATE, PERMISSION, REMARKS, LVL, LFT, RGT)
values ('03', 4012, 40, '不动产登记中土地抵押情况统计表', 'bdcdjztddyqktjb', 1, '/bdc/landPledge', null, 0, null, null, 1, 38, 39);
insert into SYS_RESOURCE (SYS_ID, RES_ID, PARENT, RES_NAME, RES_PY, RES_TYPE, RES_URL, ICON, STATE, PERMISSION, REMARKS, LVL, LFT, RGT)
values ('03', 4010, 40, '登簿量统计', 'dbltj', 1, '/half/month', null, 0, null, null, 1, 34, 35);
insert into SYS_RESOURCE (SYS_ID, RES_ID, PARENT, RES_NAME, RES_PY, RES_TYPE, RES_URL, ICON, STATE, PERMISSION, REMARKS, LVL, LFT, RGT)
values ('03', 4011, 40, '不动产登记报表结果输出', 'bdcdjbbjgsc', 1, '/real/estate', null, 0, null, null, 1, 36, 37);
insert into SYS_RESOURCE (SYS_ID, RES_ID, PARENT, RES_NAME, RES_PY, RES_TYPE, RES_URL, ICON, STATE, PERMISSION, REMARKS, LVL, LFT, RGT)
values ('03', 5006, 50, '预约预警监控', 'yyyjjk', 1, '/stats/wxReverseWarn', null, 0, null, null, 1, 10, 11);
insert into SYS_RESOURCE (SYS_ID, RES_ID, PARENT, RES_NAME, RES_PY, RES_TYPE, RES_URL, ICON, STATE, PERMISSION, REMARKS, LVL, LFT, RGT)
values ('00', 9903, 99, '角色管理', 'jsgl', 1, '/sys/role', null, 0, null, null, 1, 6, 7);
insert into SYS_RESOURCE (SYS_ID, RES_ID, PARENT, RES_NAME, RES_PY, RES_TYPE, RES_URL, ICON, STATE, PERMISSION, REMARKS, LVL, LFT, RGT)
values ('01', 1507, 15, '联合抵押申请', 'lhdysq', 1, '/bank/union-pledge?registType=0221', null, 0, null, null, 1, 10, 11);
insert into SYS_RESOURCE (SYS_ID, RES_ID, PARENT, RES_NAME, RES_PY, RES_TYPE, RES_URL, ICON, STATE, PERMISSION, REMARKS, LVL, LFT, RGT)
values ('02', 1604, 16, '转移预告', 'zyyg', 1, '/developers/regist?registType=0301', null, 0, null, null, 1, 6, 7);
commit;
