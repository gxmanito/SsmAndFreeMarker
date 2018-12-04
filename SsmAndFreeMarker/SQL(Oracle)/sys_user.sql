 
create table SYS_USER
(
  USER_ID      VARCHAR2(20) not null,
  USER_PWD     VARCHAR2(24) not null,
  USER_NAME    VARCHAR2(500) not null,
  USER_PY      VARCHAR2(30) not null,
  EMAIL        VARCHAR2(350),
  SEX          NUMBER(1) default 0,
  MOBILE_PHONE VARCHAR2(18),
  STATE        NUMBER(3) default 0 not null,
  REMARKS      VARCHAR2(250),
  GMT_CREATE   DATE,
  GMT_UPDATE   DATE,
  GMT_LOGIN    DATE,
  USER_ORG     VARCHAR2(50)
);
comment on table SYS_USER
  is '角色权限';
comment on column SYS_USER.USER_ID
  is '账号';
comment on column SYS_USER.USER_PWD
  is '密码';
comment on column SYS_USER.USER_NAME
  is '名称';
comment on column SYS_USER.USER_PY
  is '姓名拼音';
comment on column SYS_USER.EMAIL
  is '邮箱';
comment on column SYS_USER.SEX
  is '性别 0：未知 1：男 2：女';
comment on column SYS_USER.MOBILE_PHONE
  is '手机号';
comment on column SYS_USER.STATE
  is '状态 sys_code.code_type=1';
comment on column SYS_USER.REMARKS
  is '备注';
comment on column SYS_USER.GMT_CREATE
  is '创建时间';
comment on column SYS_USER.GMT_UPDATE
  is '密码更新时间';
comment on column SYS_USER.GMT_LOGIN
  is '最后登陆时间';
comment on column SYS_USER.USER_ORG
  is '用户所属机构 sys_user_org.code';
alter table SYS_USER
  add constraint PK_SYS_USER primary key (USER_ID);
 
insert into SYS_USER (USER_ID, USER_PWD, USER_NAME, USER_PY, EMAIL, SEX, MOBILE_PHONE, STATE, REMARKS, GMT_CREATE, GMT_UPDATE, GMT_LOGIN, USER_ORG)
values ('zyyh_chenxi', 'To2i5s7i7rR622c4Idu8Ag==', '陈玺', 'cx', null, 0, '15393702660', 0, null, to_date('09-09-2017 09:12:25', 'dd-mm-yyyy hh24:mi:ss'), to_date('05-06-2018 19:37:21', 'dd-mm-yyyy hh24:mi:ss'), to_date('07-06-2018 15:53:19', 'dd-mm-yyyy hh24:mi:ss'), '010101');
insert into SYS_USER (USER_ID, USER_PWD, USER_NAME, USER_PY, EMAIL, SEX, MOBILE_PHONE, STATE, REMARKS, GMT_CREATE, GMT_UPDATE, GMT_LOGIN, USER_ORG)
values ('zyyh_chenli', 'MzSKr05Nu82eYq2roRNHxg==', '陈力', 'cl', null, 0, '18037886537', 0, '411502198907210510', to_date('09-11-2017 10:04:52', 'dd-mm-yyyy hh24:mi:ss'), to_date('14-12-2017 17:32:47', 'dd-mm-yyyy hh24:mi:ss'), to_date('26-04-2018 15:16:10', 'dd-mm-yyyy hh24:mi:ss'), '010106');
insert into SYS_USER (USER_ID, USER_PWD, USER_NAME, USER_PY, EMAIL, SEX, MOBILE_PHONE, STATE, REMARKS, GMT_CREATE, GMT_UPDATE, GMT_LOGIN, USER_ORG)
values ('gsyh_fenghuanhuan', 'WlLSCNIFf+nkyxH4L4eTCQ==', '冯欢欢', 'fhh', null, 0, '13783606486', 0, null, to_date('23-11-2017 09:36:58', 'dd-mm-yyyy hh24:mi:ss'), to_date('23-11-2017 09:50:29', 'dd-mm-yyyy hh24:mi:ss'), to_date('06-02-2018 11:32:35', 'dd-mm-yyyy hh24:mi:ss'), '0107');
insert into SYS_USER (USER_ID, USER_PWD, USER_NAME, USER_PY, EMAIL, SEX, MOBILE_PHONE, STATE, REMARKS, GMT_CREATE, GMT_UPDATE, GMT_LOGIN, USER_ORG)
values ('zyyh_ceshi', 'F/s1nrzV+MCtG7BcfqakdQ==', '测试', 'cs', null, 0, null, 0, null, to_date('06-12-2017 12:35:32', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-03-2018 08:38:02', 'dd-mm-yyyy hh24:mi:ss'), to_date('23-10-2018 17:09:55', 'dd-mm-yyyy hh24:mi:ss'), '010107');
insert into SYS_USER (USER_ID, USER_PWD, USER_NAME, USER_PY, EMAIL, SEX, MOBILE_PHONE, STATE, REMARKS, GMT_CREATE, GMT_UPDATE, GMT_LOGIN, USER_ORG)
values ('gsyh_cuiyingying', 'VOUgbW6Gczy/xV0kGNRjFQ==', '崔莹莹', 'cyy', null, 0, '13838162383', 0, null, to_date('23-11-2017 09:39:10', 'dd-mm-yyyy hh24:mi:ss'), to_date('23-11-2017 09:51:58', 'dd-mm-yyyy hh24:mi:ss'), to_date('05-12-2017 11:16:06', 'dd-mm-yyyy hh24:mi:ss'), '0107');
insert into SYS_USER (USER_ID, USER_PWD, USER_NAME, USER_PY, EMAIL, SEX, MOBILE_PHONE, STATE, REMARKS, GMT_CREATE, GMT_UPDATE, GMT_LOGIN, USER_ORG)
values ('gsyh_liubing', 'FT9ZUnd9HvKwwrXU85cRhw==', '刘冰', 'lb', null, 0, '13837193785', 0, null, to_date('23-11-2017 09:40:13', 'dd-mm-yyyy hh24:mi:ss'), to_date('23-11-2017 09:53:01', 'dd-mm-yyyy hh24:mi:ss'), to_date('07-02-2018 08:20:15', 'dd-mm-yyyy hh24:mi:ss'), '0107');
insert into SYS_USER (USER_ID, USER_PWD, USER_NAME, USER_PY, EMAIL, SEX, MOBILE_PHONE, STATE, REMARKS, GMT_CREATE, GMT_UPDATE, GMT_LOGIN, USER_ORG)
values ('gsyh_zhaowanjuan', '32YfSAS3N4YbrQ+mVAZqvg==', '赵万娟', 'zwj', null, 0, '15136407106', 0, null, to_date('24-11-2017 09:02:17', 'dd-mm-yyyy hh24:mi:ss'), to_date('24-11-2017 09:15:05', 'dd-mm-yyyy hh24:mi:ss'), to_date('24-11-2017 09:04:59', 'dd-mm-yyyy hh24:mi:ss'), '0107');
insert into SYS_USER (USER_ID, USER_PWD, USER_NAME, USER_PY, EMAIL, SEX, MOBILE_PHONE, STATE, REMARKS, GMT_CREATE, GMT_UPDATE, GMT_LOGIN, USER_ORG)
values ('csyh_haha', 'dLBgFbVjBcEz96JjBWjoiA==', '哈哈', 'hh', null, 0, null, 0, null, to_date('09-01-2018 14:21:35', 'dd-mm-yyyy hh24:mi:ss'), to_date('09-01-2018 14:21:23', 'dd-mm-yyyy hh24:mi:ss'), to_date('29-08-2018 10:38:28', 'dd-mm-yyyy hh24:mi:ss'), '0109');
insert into SYS_USER (USER_ID, USER_PWD, USER_NAME, USER_PY, EMAIL, SEX, MOBILE_PHONE, STATE, REMARKS, GMT_CREATE, GMT_UPDATE, GMT_LOGIN, USER_ORG)
values ('zgyh_sunlu', 'zkx4dSNaPjrgvttnaCmQBw==', '孙璐', 'sl', null, 0, null, 0, '410102198803050046', to_date('19-01-2018 10:24:26', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-01-2018 10:19:21', 'dd-mm-yyyy hh24:mi:ss'), to_date('08-05-2018 19:10:02', 'dd-mm-yyyy hh24:mi:ss'), '011009');
insert into SYS_USER (USER_ID, USER_PWD, USER_NAME, USER_PY, EMAIL, SEX, MOBILE_PHONE, STATE, REMARKS, GMT_CREATE, GMT_UPDATE, GMT_LOGIN, USER_ORG)
values ('gjj_renzhe', '6ijHG8qgIbV2SWtM49dsUA==', '任喆', 'rz', null, 0, '18613712178', 0, null, to_date('22-01-2018 13:49:15', 'dd-mm-yyyy hh24:mi:ss'), to_date('15-05-2018 16:47:21', 'dd-mm-yyyy hh24:mi:ss'), to_date('23-04-2018 09:24:20', 'dd-mm-yyyy hh24:mi:ss'), '0111');
insert into SYS_USER (USER_ID, USER_PWD, USER_NAME, USER_PY, EMAIL, SEX, MOBILE_PHONE, STATE, REMARKS, GMT_CREATE, GMT_UPDATE, GMT_LOGIN, USER_ORG)
values ('zyyh_lixiyang', 'DfIX0tBk29fR+w8x0xxJ4w==', '李曦阳', 'lxy', null, 0, '18039675113', 0, null, to_date('05-09-2017 18:10:02', 'dd-mm-yyyy hh24:mi:ss'), to_date('14-12-2017 17:30:05', 'dd-mm-yyyy hh24:mi:ss'), to_date('27-04-2018 13:58:11', 'dd-mm-yyyy hh24:mi:ss'), '010104');
insert into SYS_USER (USER_ID, USER_PWD, USER_NAME, USER_PY, EMAIL, SEX, MOBILE_PHONE, STATE, REMARKS, GMT_CREATE, GMT_UPDATE, GMT_LOGIN, USER_ORG)
values ('jsyh_wanghaikui', 'wFuSb7fhTIIflslNtiQXMA==', '王海奎', 'whk', null, 0, '13676929363', 0, null, to_date('20-11-2017 15:19:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('20-11-2017 15:32:33', 'dd-mm-yyyy hh24:mi:ss'), null, '0106');
insert into SYS_USER (USER_ID, USER_PWD, USER_NAME, USER_PY, EMAIL, SEX, MOBILE_PHONE, STATE, REMARKS, GMT_CREATE, GMT_UPDATE, GMT_LOGIN, USER_ORG)
values ('zzxsy_jingliping', 'PO2SbtzDutnmnMFzSF4fwQ==', '荆丽萍', 'jlp', null, 0, null, 0, null, to_date('19-04-2018 09:02:19', 'dd-mm-yyyy hh24:mi:ss'), to_date('15-10-2018 16:40:35', 'dd-mm-yyyy hh24:mi:ss'), to_date('15-10-2018 16:42:18', 'dd-mm-yyyy hh24:mi:ss'), '020112');
insert into SYS_USER (USER_ID, USER_PWD, USER_NAME, USER_PY, EMAIL, SEX, MOBILE_PHONE, STATE, REMARKS, GMT_CREATE, GMT_UPDATE, GMT_LOGIN, USER_ORG)
values ('admin', 'PMVDuEzP+DPMfC/rGVoqNw==', '管理员', 'gly', null, 1, '037165732233', 0, null, null, to_date('28-04-2018 16:20:01', 'dd-mm-yyyy hh24:mi:ss'), to_date('08-11-2018 13:08:56', 'dd-mm-yyyy hh24:mi:ss'), '00');
insert into SYS_USER (USER_ID, USER_PWD, USER_NAME, USER_PY, EMAIL, SEX, MOBILE_PHONE, STATE, REMARKS, GMT_CREATE, GMT_UPDATE, GMT_LOGIN, USER_ORG)
values ('zyyh_chenyingying', '84hs5KlzQykUoc0TCSPxsA==', '陈颖颖', 'cyy', null, 0, '13783686200', 0, '41272419870728614X', to_date('09-11-2017 10:00:53', 'dd-mm-yyyy hh24:mi:ss'), to_date('09-11-2017 10:14:15', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2018 10:44:49', 'dd-mm-yyyy hh24:mi:ss'), '0101');
insert into SYS_USER (USER_ID, USER_PWD, USER_NAME, USER_PY, EMAIL, SEX, MOBILE_PHONE, STATE, REMARKS, GMT_CREATE, GMT_UPDATE, GMT_LOGIN, USER_ORG)
values ('ycyh_wanglindong', 'QFxDnXvVO5Kv9PwPCtvBfg==', '王林栋', 'wld', null, 0, '13939086086', 0, null, to_date('18-11-2017 11:48:57', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-11-2017 12:02:25', 'dd-mm-yyyy hh24:mi:ss'), to_date('05-03-2018 11:06:01', 'dd-mm-yyyy hh24:mi:ss'), '010201');
insert into SYS_USER (USER_ID, USER_PWD, USER_NAME, USER_PY, EMAIL, SEX, MOBILE_PHONE, STATE, REMARKS, GMT_CREATE, GMT_UPDATE, GMT_LOGIN, USER_ORG)
values ('ycyh_songkai', '82Cdspp9wEfFP3lPYQdVSg==', '宋凯', 'sk', null, 0, '18625567096', 0, null, to_date('18-11-2017 11:50:31', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-11-2017 12:03:59', 'dd-mm-yyyy hh24:mi:ss'), to_date('23-10-2018 17:04:36', 'dd-mm-yyyy hh24:mi:ss'), '010201');
insert into SYS_USER (USER_ID, USER_PWD, USER_NAME, USER_PY, EMAIL, SEX, MOBILE_PHONE, STATE, REMARKS, GMT_CREATE, GMT_UPDATE, GMT_LOGIN, USER_ORG)
values ('ycyh_mabaocheng', 'Lv1OqRD/+EUyb992wIE2Ig==', '马宝成', 'mbc', null, 1, '18603869808', 0, null, to_date('18-11-2017 11:51:27', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-11-2017 12:04:55', 'dd-mm-yyyy hh24:mi:ss'), to_date('08-05-2018 17:16:35', 'dd-mm-yyyy hh24:mi:ss'), '010202');
insert into SYS_USER (USER_ID, USER_PWD, USER_NAME, USER_PY, EMAIL, SEX, MOBILE_PHONE, STATE, REMARKS, GMT_CREATE, GMT_UPDATE, GMT_LOGIN, USER_ORG)
values ('jtyh_houqiyong', 'JWHhnHOeJhbaX7qD4QLVHQ==', '侯其永', 'hqy', null, 0, '13592625808', 0, null, to_date('18-11-2017 12:02:16', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-11-2017 12:15:44', 'dd-mm-yyyy hh24:mi:ss'), to_date('20-11-2017 10:38:59', 'dd-mm-yyyy hh24:mi:ss'), '0104');
insert into SYS_USER (USER_ID, USER_PWD, USER_NAME, USER_PY, EMAIL, SEX, MOBILE_PHONE, STATE, REMARKS, GMT_CREATE, GMT_UPDATE, GMT_LOGIN, USER_ORG)
values ('jtyh_dupeng', 'EKj+T0+rH30RlCisVE1ZkA==', '杜鹏', 'dp', null, 0, '13203850132', 0, null, to_date('18-11-2017 12:02:59', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-11-2017 12:16:27', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-01-2018 09:58:52', 'dd-mm-yyyy hh24:mi:ss'), '0104');
insert into SYS_USER (USER_ID, USER_PWD, USER_NAME, USER_PY, EMAIL, SEX, MOBILE_PHONE, STATE, REMARKS, GMT_CREATE, GMT_UPDATE, GMT_LOGIN, USER_ORG)
values ('jsyh_zhangxiaohui', 'h85Q5vquAdaJf/qgRhiXRw==', '张晓辉', 'zxh', null, 0, '13938262648', 0, null, to_date('20-11-2017 15:17:47', 'dd-mm-yyyy hh24:mi:ss'), to_date('08-12-2017 10:28:21', 'dd-mm-yyyy hh24:mi:ss'), to_date('08-12-2017 10:15:02', 'dd-mm-yyyy hh24:mi:ss'), '0106');
insert into SYS_USER (USER_ID, USER_PWD, USER_NAME, USER_PY, EMAIL, SEX, MOBILE_PHONE, STATE, REMARKS, GMT_CREATE, GMT_UPDATE, GMT_LOGIN, USER_ORG)
values ('pfyh_liyan', 'lISgWzwXBYd4hozYOytBBQ==', '李艳', 'ly', null, 0, '13633866928', 0, '411122198309217521', to_date('07-12-2017 16:55:16', 'dd-mm-yyyy hh24:mi:ss'), to_date('07-12-2017 17:20:13', 'dd-mm-yyyy hh24:mi:ss'), to_date('14-03-2018 17:10:41', 'dd-mm-yyyy hh24:mi:ss'), '0109');
insert into SYS_USER (USER_ID, USER_PWD, USER_NAME, USER_PY, EMAIL, SEX, MOBILE_PHONE, STATE, REMARKS, GMT_CREATE, GMT_UPDATE, GMT_LOGIN, USER_ORG)
values ('zgyh_weizhongyuan', 'S3UNUiTTLM/vMOpVaBD85w==', '魏中元', 'wzy', null, 0, null, 0, '412823197908150454', to_date('19-01-2018 10:23:46', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-01-2018 10:18:41', 'dd-mm-yyyy hh24:mi:ss'), to_date('26-04-2018 14:21:17', 'dd-mm-yyyy hh24:mi:ss'), '011008');
insert into SYS_USER (USER_ID, USER_PWD, USER_NAME, USER_PY, EMAIL, SEX, MOBILE_PHONE, STATE, REMARKS, GMT_CREATE, GMT_UPDATE, GMT_LOGIN, USER_ORG)
values ('report', 'a6FOeVZ029m+fpgOafU/7g==', '报表管理', 'bbgl', null, 0, null, 0, null, to_date('21-12-2017 14:01:29', 'dd-mm-yyyy hh24:mi:ss'), to_date('21-12-2017 14:09:42', 'dd-mm-yyyy hh24:mi:ss'), to_date('24-04-2018 18:06:52', 'dd-mm-yyyy hh24:mi:ss'), '00');
insert into SYS_USER (USER_ID, USER_PWD, USER_NAME, USER_PY, EMAIL, SEX, MOBILE_PHONE, STATE, REMARKS, GMT_CREATE, GMT_UPDATE, GMT_LOGIN, USER_ORG)
values ('jianguan', 'J+bo1LSBw/4T4V5kR00GIw==', '监管', 'jg', null, 0, null, 2, null, to_date('31-01-2018 08:46:41', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-01-2018 08:47:31', 'dd-mm-yyyy hh24:mi:ss'), to_date('05-02-2018 11:38:04', 'dd-mm-yyyy hh24:mi:ss'), '00');
insert into SYS_USER (USER_ID, USER_PWD, USER_NAME, USER_PY, EMAIL, SEX, MOBILE_PHONE, STATE, REMARKS, GMT_CREATE, GMT_UPDATE, GMT_LOGIN, USER_ORG)
values ('LIUXIAOXUE', '9LCocpgvIMOBtuHMRyytdA==', '刘晓雪', 'lxx', null, 0, null, 2, null, to_date('06-02-2018 10:54:18', 'dd-mm-yyyy hh24:mi:ss'), to_date('06-02-2018 10:53:45', 'dd-mm-yyyy hh24:mi:ss'), null, '00');
insert into SYS_USER (USER_ID, USER_PWD, USER_NAME, USER_PY, EMAIL, SEX, MOBILE_PHONE, STATE, REMARKS, GMT_CREATE, GMT_UPDATE, GMT_LOGIN, USER_ORG)
values ('liyang', 'BvyhGsc9hy/Re9K3Z1EsmA==', '李阳', 'lxx', null, 0, null, 0, null, to_date('08-02-2018 09:56:05', 'dd-mm-yyyy hh24:mi:ss'), to_date('08-02-2018 09:55:57', 'dd-mm-yyyy hh24:mi:ss'), to_date('08-02-2018 09:58:12', 'dd-mm-yyyy hh24:mi:ss'), '00');
insert into SYS_USER (USER_ID, USER_PWD, USER_NAME, USER_PY, EMAIL, SEX, MOBILE_PHONE, STATE, REMARKS, GMT_CREATE, GMT_UPDATE, GMT_LOGIN, USER_ORG)
values ('zhongyuan', 'CrxwtsmWNYui+w39YClDNg==', '中原区', 'zyq', null, 0, null, 0, null, to_date('09-02-2018 16:10:18', 'dd-mm-yyyy hh24:mi:ss'), to_date('09-02-2018 16:09:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('25-04-2018 15:53:45', 'dd-mm-yyyy hh24:mi:ss'), '1-3-6');
insert into SYS_USER (USER_ID, USER_PWD, USER_NAME, USER_PY, EMAIL, SEX, MOBILE_PHONE, STATE, REMARKS, GMT_CREATE, GMT_UPDATE, GMT_LOGIN, USER_ORG)
values ('dongqulianhe', 'nyrWd5QvKBnEuEAD9Y6XAQ==', '东区（熊儿河）', 'dqxeh', null, 0, null, 0, null, to_date('09-02-2018 16:14:03', 'dd-mm-yyyy hh24:mi:ss'), to_date('09-02-2018 16:13:31', 'dd-mm-yyyy hh24:mi:ss'), to_date('25-04-2018 16:06:10', 'dd-mm-yyyy hh24:mi:ss'), '1-3-10');
insert into SYS_USER (USER_ID, USER_PWD, USER_NAME, USER_PY, EMAIL, SEX, MOBILE_PHONE, STATE, REMARKS, GMT_CREATE, GMT_UPDATE, GMT_LOGIN, USER_ORG)
values ('dongquhuanghenanlu', 'Kh32xCxxZ7Ru0FvNUyVi8Q==', '东区黄河南路', 'dongquhuanghenanlu', null, 0, null, 0, null, to_date('09-02-2018 16:16:01', 'dd-mm-yyyy hh24:mi:ss'), to_date('09-02-2018 16:15:28', 'dd-mm-yyyy hh24:mi:ss'), to_date('27-04-2018 13:44:29', 'dd-mm-yyyy hh24:mi:ss'), '1-3-10');
insert into SYS_USER (USER_ID, USER_PWD, USER_NAME, USER_PY, EMAIL, SEX, MOBILE_PHONE, STATE, REMARKS, GMT_CREATE, GMT_UPDATE, GMT_LOGIN, USER_ORG)
values ('zzxqjg', 'EBY6WEvlaA+8hd2h9gWO5A==', '县区', 'xq', null, 0, null, 0, null, to_date('09-02-2018 17:52:56', 'dd-mm-yyyy hh24:mi:ss'), to_date('09-02-2018 17:52:23', 'dd-mm-yyyy hh24:mi:ss'), to_date('27-04-2018 11:31:31', 'dd-mm-yyyy hh24:mi:ss'), '00');
insert into SYS_USER (USER_ID, USER_PWD, USER_NAME, USER_PY, EMAIL, SEX, MOBILE_PHONE, STATE, REMARKS, GMT_CREATE, GMT_UPDATE, GMT_LOGIN, USER_ORG)
values ('xiqulianhe', 'Mh+gEAze3a7swuUGKADC2Q==', '西区', 'xq', null, 0, null, 0, null, to_date('09-02-2018 16:13:16', 'dd-mm-yyyy hh24:mi:ss'), to_date('09-02-2018 16:12:43', 'dd-mm-yyyy hh24:mi:ss'), to_date('27-04-2018 13:07:56', 'dd-mm-yyyy hh24:mi:ss'), '1-3');
insert into SYS_USER (USER_ID, USER_PWD, USER_NAME, USER_PY, EMAIL, SEX, MOBILE_PHONE, STATE, REMARKS, GMT_CREATE, GMT_UPDATE, GMT_LOGIN, USER_ORG)
values ('jinshui', 'hpxrVr9pG+zFgBbrVb5EnA==', '金水区', 'jsq', null, 0, null, 0, null, to_date('09-02-2018 16:09:26', 'dd-mm-yyyy hh24:mi:ss'), to_date('14-02-2018 11:20:47', 'dd-mm-yyyy hh24:mi:ss'), to_date('27-04-2018 09:15:41', 'dd-mm-yyyy hh24:mi:ss'), '1-3-5');
insert into SYS_USER (USER_ID, USER_PWD, USER_NAME, USER_PY, EMAIL, SEX, MOBILE_PHONE, STATE, REMARKS, GMT_CREATE, GMT_UPDATE, GMT_LOGIN, USER_ORG)
values ('erqiqu', 'rfZuHAfQ8e9OxpElXteC+A==', '二七区', 'eqq', null, 0, null, 0, null, to_date('09-02-2018 16:11:34', 'dd-mm-yyyy hh24:mi:ss'), to_date('09-02-2018 16:11:02', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-04-2018 15:40:11', 'dd-mm-yyyy hh24:mi:ss'), '1-3-4');
insert into SYS_USER (USER_ID, USER_PWD, USER_NAME, USER_PY, EMAIL, SEX, MOBILE_PHONE, STATE, REMARKS, GMT_CREATE, GMT_UPDATE, GMT_LOGIN, USER_ORG)
values ('beiqulianhe', 'AClGxGYgh0erygw5+6PfNw==', '惠济区（北区）', 'hjqbq', null, 0, null, 0, null, to_date('09-02-2018 16:12:57', 'dd-mm-yyyy hh24:mi:ss'), to_date('09-02-2018 16:12:24', 'dd-mm-yyyy hh24:mi:ss'), to_date('25-04-2018 15:29:26', 'dd-mm-yyyy hh24:mi:ss'), '1-3-8');
insert into SYS_USER (USER_ID, USER_PWD, USER_NAME, USER_PY, EMAIL, SEX, MOBILE_PHONE, STATE, REMARKS, GMT_CREATE, GMT_UPDATE, GMT_LOGIN, USER_ORG)
values ('dongqucbd', '+zbFHIq65h8OWGf98EUQUg==', '东区cbd', 'dongqucbd', null, 0, null, 0, null, to_date('09-02-2018 16:14:57', 'dd-mm-yyyy hh24:mi:ss'), to_date('09-02-2018 16:14:24', 'dd-mm-yyyy hh24:mi:ss'), to_date('27-04-2018 10:03:43', 'dd-mm-yyyy hh24:mi:ss'), '1-3-10');
insert into SYS_USER (USER_ID, USER_PWD, USER_NAME, USER_PY, EMAIL, SEX, MOBILE_PHONE, STATE, REMARKS, GMT_CREATE, GMT_UPDATE, GMT_LOGIN, USER_ORG)
values ('gaoxin', 'Vmx1pfqcL12es2t/1tIZIg==', '高新区', 'gxq', null, 0, null, 0, null, to_date('09-02-2018 16:16:30', 'dd-mm-yyyy hh24:mi:ss'), to_date('09-02-2018 16:15:57', 'dd-mm-yyyy hh24:mi:ss'), to_date('25-04-2018 15:54:16', 'dd-mm-yyyy hh24:mi:ss'), '1-3');
insert into SYS_USER (USER_ID, USER_PWD, USER_NAME, USER_PY, EMAIL, SEX, MOBILE_PHONE, STATE, REMARKS, GMT_CREATE, GMT_UPDATE, GMT_LOGIN, USER_ORG)
values ('guancheng', 'HutnjTc4Rh6gGDqmTwT9MA==', '管城区', 'gcq', null, 0, null, 0, null, to_date('09-02-2018 16:17:04', 'dd-mm-yyyy hh24:mi:ss'), to_date('09-02-2018 16:16:32', 'dd-mm-yyyy hh24:mi:ss'), to_date('25-04-2018 15:54:37', 'dd-mm-yyyy hh24:mi:ss'), '1-3');
insert into SYS_USER (USER_ID, USER_PWD, USER_NAME, USER_PY, EMAIL, SEX, MOBILE_PHONE, STATE, REMARKS, GMT_CREATE, GMT_UPDATE, GMT_LOGIN, USER_ORG)
values ('shizhongxin', 'KaMfelAiX8vQLTOTS/y+4Q==', '市局', 'sj', null, 0, null, 0, null, to_date('09-02-2018 16:20:39', 'dd-mm-yyyy hh24:mi:ss'), to_date('09-02-2018 16:20:06', 'dd-mm-yyyy hh24:mi:ss'), to_date('27-04-2018 14:29:08', 'dd-mm-yyyy hh24:mi:ss'), '1-3');
insert into SYS_USER (USER_ID, USER_PWD, USER_NAME, USER_PY, EMAIL, SEX, MOBILE_PHONE, STATE, REMARKS, GMT_CREATE, GMT_UPDATE, GMT_LOGIN, USER_ORG)
values ('jingkai', 'KLohuxeWudQKCeTdwLXaAA==', '经开区', 'jkq', null, 0, null, 0, null, to_date('09-02-2018 16:23:46', 'dd-mm-yyyy hh24:mi:ss'), to_date('09-02-2018 16:23:39', 'dd-mm-yyyy hh24:mi:ss'), to_date('25-04-2018 15:53:57', 'dd-mm-yyyy hh24:mi:ss'), '1-3');
insert into SYS_USER (USER_ID, USER_PWD, USER_NAME, USER_PY, EMAIL, SEX, MOBILE_PHONE, STATE, REMARKS, GMT_CREATE, GMT_UPDATE, GMT_LOGIN, USER_ORG)
values ('gangqu_zhoujianwei', 'OCAhqZH4ZHrDsqjYvnPP7Q==', '周建伟', 'zjw', null, 0, null, 0, null, to_date('22-03-2018 09:44:54', 'dd-mm-yyyy hh24:mi:ss'), to_date('27-03-2018 13:54:49', 'dd-mm-yyyy hh24:mi:ss'), to_date('27-04-2018 10:56:49', 'dd-mm-yyyy hh24:mi:ss'), '1-18');
insert into SYS_USER (USER_ID, USER_PWD, USER_NAME, USER_PY, EMAIL, SEX, MOBILE_PHONE, STATE, REMARKS, GMT_CREATE, GMT_UPDATE, GMT_LOGIN, USER_ORG)
values ('gfyh_wangdongxu', 'Fd0pNON5cXMtueYyvcA9uQ==', '王东旭', 'wdx', null, 0, '18838156368', 0, '410105197405052753', to_date('24-03-2018 09:00:15', 'dd-mm-yyyy hh24:mi:ss'), to_date('24-03-2018 09:00:15', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-03-2018 08:48:31', 'dd-mm-yyyy hh24:mi:ss'), '0112');
insert into SYS_USER (USER_ID, USER_PWD, USER_NAME, USER_PY, EMAIL, SEX, MOBILE_PHONE, STATE, REMARKS, GMT_CREATE, GMT_UPDATE, GMT_LOGIN, USER_ORG)
values ('shangdu_wangdongxu', 'hARPzY0DwEccCz+jVuG92w==', '王东旭', 'wdx', null, 0, '18838156368', 0, '410105197405052753', to_date('27-03-2018 17:05:42', 'dd-mm-yyyy hh24:mi:ss'), to_date('27-03-2018 17:05:42', 'dd-mm-yyyy hh24:mi:ss'), to_date('27-03-2018 17:06:44', 'dd-mm-yyyy hh24:mi:ss'), '011201');
insert into SYS_USER (USER_ID, USER_PWD, USER_NAME, USER_PY, EMAIL, SEX, MOBILE_PHONE, STATE, REMARKS, GMT_CREATE, GMT_UPDATE, GMT_LOGIN, USER_ORG)
values ('gaoxing', 'AeXQMLW57Dhy5SAa1E7XMw==', '高兴', 'gx', null, 0, null, 0, null, to_date('03-04-2018 14:42:01', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2018 14:42:01', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2018 16:35:28', 'dd-mm-yyyy hh24:mi:ss'), '0206');
insert into SYS_USER (USER_ID, USER_PWD, USER_NAME, USER_PY, EMAIL, SEX, MOBILE_PHONE, STATE, REMARKS, GMT_CREATE, GMT_UPDATE, GMT_LOGIN, USER_ORG)
values ('hnjd_renfei', 'cUf4vslogOyzPwVlb/xACw==', '任菲', 'rf', null, 0, null, 0, null, to_date('20-04-2018 10:57:59', 'dd-mm-yyyy hh24:mi:ss'), to_date('15-10-2018 16:50:03', 'dd-mm-yyyy hh24:mi:ss'), to_date('22-10-2018 14:19:32', 'dd-mm-yyyy hh24:mi:ss'), '0207');
insert into SYS_USER (USER_ID, USER_PWD, USER_NAME, USER_PY, EMAIL, SEX, MOBILE_PHONE, STATE, REMARKS, GMT_CREATE, GMT_UPDATE, GMT_LOGIN, USER_ORG)
values ('zyyh_zhangaiyun', 'CoMwb79dCrJGfCqXDipXdA==', '张爱云', 'zay', null, 0, '18037771726', 0, null, to_date('06-09-2017 11:33:20', 'dd-mm-yyyy hh24:mi:ss'), to_date('14-12-2017 17:33:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('12-04-2018 09:31:40', 'dd-mm-yyyy hh24:mi:ss'), '010102');
insert into SYS_USER (USER_ID, USER_PWD, USER_NAME, USER_PY, EMAIL, SEX, MOBILE_PHONE, STATE, REMARKS, GMT_CREATE, GMT_UPDATE, GMT_LOGIN, USER_ORG)
values ('zyyh_yangzi', 'NZyI5aV/ED6q+g3DZPnMZQ==', '杨梓', 'yz', null, 0, '13523582716', 0, null, to_date('06-09-2017 11:35:04', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-10-2017 08:48:10', 'dd-mm-yyyy hh24:mi:ss'), to_date('27-04-2018 14:05:02', 'dd-mm-yyyy hh24:mi:ss'), '010104');
insert into SYS_USER (USER_ID, USER_PWD, USER_NAME, USER_PY, EMAIL, SEX, MOBILE_PHONE, STATE, REMARKS, GMT_CREATE, GMT_UPDATE, GMT_LOGIN, USER_ORG)
values ('zyyh_zhangqi', 'eTNURJFjEfU8Jv7DEBmohg==', '张淇', 'zq', null, 0, '15838715666', 0, null, to_date('06-09-2017 11:39:50', 'dd-mm-yyyy hh24:mi:ss'), to_date('14-12-2017 17:32:14', 'dd-mm-yyyy hh24:mi:ss'), to_date('11-04-2018 14:50:16', 'dd-mm-yyyy hh24:mi:ss'), '010103');
insert into SYS_USER (USER_ID, USER_PWD, USER_NAME, USER_PY, EMAIL, SEX, MOBILE_PHONE, STATE, REMARKS, GMT_CREATE, GMT_UPDATE, GMT_LOGIN, USER_ORG)
values ('zyyh_liurui', 'UUKF4hh1cteC/b2PQSsh/w==', '刘锐', 'lr', null, 0, '18336373560', 0, null, to_date('06-09-2017 11:40:37', 'dd-mm-yyyy hh24:mi:ss'), to_date('06-09-2017 11:44:49', 'dd-mm-yyyy hh24:mi:ss'), null, '0101');
insert into SYS_USER (USER_ID, USER_PWD, USER_NAME, USER_PY, EMAIL, SEX, MOBILE_PHONE, STATE, REMARKS, GMT_CREATE, GMT_UPDATE, GMT_LOGIN, USER_ORG)
values ('zyyh_zhangyongqiang', 'nOYE2zl084FntEoeScgk2Q==', '张永强', 'zyq', null, 0, '18003896127', 0, null, to_date('06-09-2017 11:41:16', 'dd-mm-yyyy hh24:mi:ss'), to_date('06-09-2017 11:45:28', 'dd-mm-yyyy hh24:mi:ss'), null, '010105');
insert into SYS_USER (USER_ID, USER_PWD, USER_NAME, USER_PY, EMAIL, SEX, MOBILE_PHONE, STATE, REMARKS, GMT_CREATE, GMT_UPDATE, GMT_LOGIN, USER_ORG)
values ('hxyh_chenzenan', 'UheyJV/P/vpczZuPnck26w==', '陈泽南', 'czn', null, 0, '15225072534', 0, '6502051993012503', to_date('20-11-2017 08:51:01', 'dd-mm-yyyy hh24:mi:ss'), to_date('22-11-2017 16:52:12', 'dd-mm-yyyy hh24:mi:ss'), to_date('07-12-2017 11:26:25', 'dd-mm-yyyy hh24:mi:ss'), '0105');
insert into SYS_USER (USER_ID, USER_PWD, USER_NAME, USER_PY, EMAIL, SEX, MOBILE_PHONE, STATE, REMARKS, GMT_CREATE, GMT_UPDATE, GMT_LOGIN, USER_ORG)
values ('xns_songke', 'EY7VtnZDJEm1ceNY8gYTZA==', '宋科', 'sk', null, 0, '13513707081', 0, null, to_date('04-12-2017 14:53:09', 'dd-mm-yyyy hh24:mi:ss'), to_date('04-12-2017 15:05:58', 'dd-mm-yyyy hh24:mi:ss'), to_date('05-12-2017 15:16:28', 'dd-mm-yyyy hh24:mi:ss'), '0108');
insert into SYS_USER (USER_ID, USER_PWD, USER_NAME, USER_PY, EMAIL, SEX, MOBILE_PHONE, STATE, REMARKS, GMT_CREATE, GMT_UPDATE, GMT_LOGIN, USER_ORG)
values ('caxt_yueyang', 'D5f6+IWJVGFt5uWo3JamoQ==', '岳洋', 'yy', null, 0, '15136169561', 0, '410105199309050095', to_date('04-12-2017 15:02:15', 'dd-mm-yyyy hh24:mi:ss'), to_date('04-12-2017 15:15:04', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-05-2018 16:43:10', 'dd-mm-yyyy hh24:mi:ss'), '010107');
insert into SYS_USER (USER_ID, USER_PWD, USER_NAME, USER_PY, EMAIL, SEX, MOBILE_PHONE, STATE, REMARKS, GMT_CREATE, GMT_UPDATE, GMT_LOGIN, USER_ORG)
values ('zgyh_hetaizhou', 'JEFlThkF3/EVVAItN8dVCw==', '何太州', 'htz', null, 0, null, 0, '410202197206271511', to_date('17-01-2018 15:56:40', 'dd-mm-yyyy hh24:mi:ss'), to_date('17-01-2018 15:56:20', 'dd-mm-yyyy hh24:mi:ss'), to_date('26-04-2018 15:01:49', 'dd-mm-yyyy hh24:mi:ss'), '011001');
insert into SYS_USER (USER_ID, USER_PWD, USER_NAME, USER_PY, EMAIL, SEX, MOBILE_PHONE, STATE, REMARKS, GMT_CREATE, GMT_UPDATE, GMT_LOGIN, USER_ORG)
values ('zgyh_zhangyawei', 'zI4pnf+t25IynphTegukkg==', '张亚伟', 'zyw', null, 0, null, 0, '410103196106032413', to_date('17-01-2018 15:57:33', 'dd-mm-yyyy hh24:mi:ss'), to_date('17-01-2018 15:57:13', 'dd-mm-yyyy hh24:mi:ss'), to_date('24-04-2018 15:53:35', 'dd-mm-yyyy hh24:mi:ss'), '011002');
insert into SYS_USER (USER_ID, USER_PWD, USER_NAME, USER_PY, EMAIL, SEX, MOBILE_PHONE, STATE, REMARKS, GMT_CREATE, GMT_UPDATE, GMT_LOGIN, USER_ORG)
values ('zgyh_yangxingru', 'MtOB9zXtESZDWPNa8zCQlg==', '杨杏茹', 'yxr', null, 0, null, 0, '91410100X14707314Y（1-1）', to_date('17-01-2018 15:58:28', 'dd-mm-yyyy hh24:mi:ss'), to_date('17-01-2018 15:58:08', 'dd-mm-yyyy hh24:mi:ss'), to_date('26-04-2018 10:30:06', 'dd-mm-yyyy hh24:mi:ss'), '011003');
insert into SYS_USER (USER_ID, USER_PWD, USER_NAME, USER_PY, EMAIL, SEX, MOBILE_PHONE, STATE, REMARKS, GMT_CREATE, GMT_UPDATE, GMT_LOGIN, USER_ORG)
values ('zgyh_shaoxin', 'Y1Bz3EzHuu5vzh5tEoPiVg==', '邵昕', 'sx', null, 0, null, 0, '41040319880314554X', to_date('17-01-2018 16:00:25', 'dd-mm-yyyy hh24:mi:ss'), to_date('17-01-2018 16:00:05', 'dd-mm-yyyy hh24:mi:ss'), to_date('20-04-2018 14:03:52', 'dd-mm-yyyy hh24:mi:ss'), '011005');
insert into SYS_USER (USER_ID, USER_PWD, USER_NAME, USER_PY, EMAIL, SEX, MOBILE_PHONE, STATE, REMARKS, GMT_CREATE, GMT_UPDATE, GMT_LOGIN, USER_ORG)
values ('zgyh_wangfei', 'k6ul6ZZzfWpHo4P1/LNspA==', '王斐', 'wf', null, 0, null, 0, '410928198511170019', to_date('17-01-2018 16:01:09', 'dd-mm-yyyy hh24:mi:ss'), to_date('17-01-2018 16:00:49', 'dd-mm-yyyy hh24:mi:ss'), to_date('20-04-2018 15:34:34', 'dd-mm-yyyy hh24:mi:ss'), '011006');
insert into SYS_USER (USER_ID, USER_PWD, USER_NAME, USER_PY, EMAIL, SEX, MOBILE_PHONE, STATE, REMARKS, GMT_CREATE, GMT_UPDATE, GMT_LOGIN, USER_ORG)
values ('zgyh_wudi', 'tCApVXf0j7AGm5AGLE6now==', '吴迪', 'wd', null, 0, null, 0, '411402199404064039', to_date('17-01-2018 16:01:52', 'dd-mm-yyyy hh24:mi:ss'), to_date('17-01-2018 16:01:32', 'dd-mm-yyyy hh24:mi:ss'), to_date('20-04-2018 14:02:11', 'dd-mm-yyyy hh24:mi:ss'), '011007');
insert into SYS_USER (USER_ID, USER_PWD, USER_NAME, USER_PY, EMAIL, SEX, MOBILE_PHONE, STATE, REMARKS, GMT_CREATE, GMT_UPDATE, GMT_LOGIN, USER_ORG)
values ('gjj_jianghongli', 'BuSthKbJgrDnPUQm+Q2Kdw==', '姜红丽', 'jhl', null, 2, '13938414668', 0, null, to_date('22-01-2018 13:47:30', 'dd-mm-yyyy hh24:mi:ss'), to_date('25-01-2018 16:03:57', 'dd-mm-yyyy hh24:mi:ss'), to_date('27-04-2018 14:34:54', 'dd-mm-yyyy hh24:mi:ss'), '0111');
insert into SYS_USER (USER_ID, USER_PWD, USER_NAME, USER_PY, EMAIL, SEX, MOBILE_PHONE, STATE, REMARKS, GMT_CREATE, GMT_UPDATE, GMT_LOGIN, USER_ORG)
values ('ncxys_wangshujun', '5g//WsuQw0BvpTOOyg7omQ==', '王淑君', 'wsj', null, 0, '18339960666', 0, '410112197107015421', to_date('03-04-2018 16:29:10', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-04-2018 16:29:10', 'dd-mm-yyyy hh24:mi:ss'), to_date('27-04-2018 13:46:04', 'dd-mm-yyyy hh24:mi:ss'), '0113');
insert into SYS_USER (USER_ID, USER_PWD, USER_NAME, USER_PY, EMAIL, SEX, MOBILE_PHONE, STATE, REMARKS, GMT_CREATE, GMT_UPDATE, GMT_LOGIN, USER_ORG)
values ('zzjr_diaopingping', 'EZYEP8wUfykI2ontmnYV+A==', '刁平平', 'dpp', null, 0, null, 0, null, to_date('25-04-2018 16:55:36', 'dd-mm-yyyy hh24:mi:ss'), to_date('25-04-2018 16:55:36', 'dd-mm-yyyy hh24:mi:ss'), to_date('26-04-2018 08:21:08', 'dd-mm-yyyy hh24:mi:ss'), '0211');
insert into SYS_USER (USER_ID, USER_PWD, USER_NAME, USER_PY, EMAIL, SEX, MOBILE_PHONE, STATE, REMARKS, GMT_CREATE, GMT_UPDATE, GMT_LOGIN, USER_ORG)
values ('ycyh_zhaolujun', 'ugcFTaE+waXxTNFUVPJbmw==', '赵鲁军', 'zlj', null, 0, '13633818053', 0, null, to_date('18-11-2017 11:48:03', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-11-2017 12:00:51', 'dd-mm-yyyy hh24:mi:ss'), to_date('23-04-2018 08:49:21', 'dd-mm-yyyy hh24:mi:ss'), '010201');
insert into SYS_USER (USER_ID, USER_PWD, USER_NAME, USER_PY, EMAIL, SEX, MOBILE_PHONE, STATE, REMARKS, GMT_CREATE, GMT_UPDATE, GMT_LOGIN, USER_ORG)
values ('zyyh_zhangziyi', 'QS1N7w31BcGEmJgv4QnBoA==', '张子毅', 'zzy', null, 0, '17737790030', 0, null, to_date('09-09-2017 09:13:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('14-12-2017 17:31:37', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-03-2018 10:40:24', 'dd-mm-yyyy hh24:mi:ss'), '010104');
insert into SYS_USER (USER_ID, USER_PWD, USER_NAME, USER_PY, EMAIL, SEX, MOBILE_PHONE, STATE, REMARKS, GMT_CREATE, GMT_UPDATE, GMT_LOGIN, USER_ORG)
values ('zyyh_wangjingyu', 'qkxsvhOQ/AY9KwqnSqKrJw==', '王径宇', 'wjy', null, 0, '17737790030', 0, null, to_date('09-09-2017 09:14:56', 'dd-mm-yyyy hh24:mi:ss'), to_date('15-12-2017 15:44:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('24-04-2018 15:12:42', 'dd-mm-yyyy hh24:mi:ss'), '010101');
insert into SYS_USER (USER_ID, USER_PWD, USER_NAME, USER_PY, EMAIL, SEX, MOBILE_PHONE, STATE, REMARKS, GMT_CREATE, GMT_UPDATE, GMT_LOGIN, USER_ORG)
values ('msyh_lidongping', 'TGpGz5lUc7VJMHo9gKuvqg==', '李东萍', 'ldp', null, 0, '13303859292', 0, null, to_date('18-11-2017 11:59:06', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-11-2017 12:11:54', 'dd-mm-yyyy hh24:mi:ss'), null, '0103');
insert into SYS_USER (USER_ID, USER_PWD, USER_NAME, USER_PY, EMAIL, SEX, MOBILE_PHONE, STATE, REMARKS, GMT_CREATE, GMT_UPDATE, GMT_LOGIN, USER_ORG)
values ('msyh_laidawei', '4y+e5H+TtYd4SHCe1qoISg==', '赖大为', 'ldw', null, 1, '13919400178', 0, null, to_date('18-11-2017 12:00:24', 'dd-mm-yyyy hh24:mi:ss'), to_date('20-11-2017 09:42:44', 'dd-mm-yyyy hh24:mi:ss'), to_date('21-11-2017 08:57:19', 'dd-mm-yyyy hh24:mi:ss'), '0103');
insert into SYS_USER (USER_ID, USER_PWD, USER_NAME, USER_PY, EMAIL, SEX, MOBILE_PHONE, STATE, REMARKS, GMT_CREATE, GMT_UPDATE, GMT_LOGIN, USER_ORG)
values ('jsyh_jiaomingrui', 'Rq0TXcnPqZA/DjydKzoBGw==', '焦明瑞', 'jmr', null, 0, '18837270702', 0, null, to_date('20-11-2017 15:18:31', 'dd-mm-yyyy hh24:mi:ss'), to_date('20-11-2017 15:32:00', 'dd-mm-yyyy hh24:mi:ss'), null, '0106');
insert into SYS_USER (USER_ID, USER_PWD, USER_NAME, USER_PY, EMAIL, SEX, MOBILE_PHONE, STATE, REMARKS, GMT_CREATE, GMT_UPDATE, GMT_LOGIN, USER_ORG)
values ('zgyh_yaozhenjiang', 'eiuzKn5Jqq1llDV1c2efhQ==', '姚振江', 'yzj', null, 0, null, 0, '410104197005263010', to_date('17-01-2018 15:59:08', 'dd-mm-yyyy hh24:mi:ss'), to_date('17-01-2018 15:59:02', 'dd-mm-yyyy hh24:mi:ss'), to_date('27-04-2018 09:05:09', 'dd-mm-yyyy hh24:mi:ss'), '011004');
insert into SYS_USER (USER_ID, USER_PWD, USER_NAME, USER_PY, EMAIL, SEX, MOBILE_PHONE, STATE, REMARKS, GMT_CREATE, GMT_UPDATE, GMT_LOGIN, USER_ORG)
values ('yaxing_humingming', 'BwcrUAYaS7QEEV3YdQpwOw==', '户明明', 'hmm', null, 0, '18838975725', 0, null, to_date('24-11-2017 10:23:23', 'dd-mm-yyyy hh24:mi:ss'), to_date('24-11-2017 10:12:22', 'dd-mm-yyyy hh24:mi:ss'), to_date('24-04-2018 19:33:51', 'dd-mm-yyyy hh24:mi:ss'), '0202');
insert into SYS_USER (USER_ID, USER_PWD, USER_NAME, USER_PY, EMAIL, SEX, MOBILE_PHONE, STATE, REMARKS, GMT_CREATE, GMT_UPDATE, GMT_LOGIN, USER_ORG)
values ('ldlg_hanshuai', '4KRAJLMZA29KLRizO9tlcg==', '韩帅', 'hs', '10315590@qq.com', 1, '15378770888', 2, '412702198904117419', to_date('23-01-2018 09:50:57', 'dd-mm-yyyy hh24:mi:ss'), to_date('23-01-2018 09:39:30', 'dd-mm-yyyy hh24:mi:ss'), null, '0203');
insert into SYS_USER (USER_ID, USER_PWD, USER_NAME, USER_PY, EMAIL, SEX, MOBILE_PHONE, STATE, REMARKS, GMT_CREATE, GMT_UPDATE, GMT_LOGIN, USER_ORG)
values ('kfs_ceshi', '/udSwrH1k/SHAvw9BJqLGA==', '测试', 'cs', null, 0, '13137146168', 0, null, to_date('13-06-2018 17:49:34', 'dd-mm-yyyy hh24:mi:ss'), to_date('13-06-2018 17:49:34', 'dd-mm-yyyy hh24:mi:ss'), to_date('08-11-2018 13:52:34', 'dd-mm-yyyy hh24:mi:ss'), '0212');
insert into SYS_USER (USER_ID, USER_PWD, USER_NAME, USER_PY, EMAIL, SEX, MOBILE_PHONE, STATE, REMARKS, GMT_CREATE, GMT_UPDATE, GMT_LOGIN, USER_ORG)
values ('xyceshi', 'KUDgrb6BwKkXxQAfmUC06w==', '荥阳测试', 'yycs', '90964106@qq.com', 0, '18655201254', 0, null, to_date('03-08-2018 08:50:06', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-08-2018 08:50:06', 'dd-mm-yyyy hh24:mi:ss'), to_date('03-08-2018 08:52:28', 'dd-mm-yyyy hh24:mi:ss'), '0206');
insert into SYS_USER (USER_ID, USER_PWD, USER_NAME, USER_PY, EMAIL, SEX, MOBILE_PHONE, STATE, REMARKS, GMT_CREATE, GMT_UPDATE, GMT_LOGIN, USER_ORG)
values ('wyz123', 'd4bhbiGRpw3m6Rp3y26PeA==', 'wyz', 'wyz', null, 0, null, 0, null, to_date('21-05-2018 11:04:35', 'dd-mm-yyyy hh24:mi:ss'), to_date('21-05-2018 11:04:35', 'dd-mm-yyyy hh24:mi:ss'), null, '0112');
insert into SYS_USER (USER_ID, USER_PWD, USER_NAME, USER_PY, EMAIL, SEX, MOBILE_PHONE, STATE, REMARKS, GMT_CREATE, GMT_UPDATE, GMT_LOGIN, USER_ORG)
values ('yinhang123', 'VNXZgF/Jxni2LLaa43QYmg==', 'yinhaqng123', 'yinhaqng123', null, 0, null, 0, null, to_date('30-05-2018 18:28:12', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-05-2018 18:28:12', 'dd-mm-yyyy hh24:mi:ss'), null, '010105');
insert into SYS_USER (USER_ID, USER_PWD, USER_NAME, USER_PY, EMAIL, SEX, MOBILE_PHONE, STATE, REMARKS, GMT_CREATE, GMT_UPDATE, GMT_LOGIN, USER_ORG)
values ('zhangsan', 'yCTrB8azF68OzPYEvD3qLQ==', '张三', 'zs', null, 0, null, 0, null, to_date('19-09-2018 09:23:19', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-09-2018 09:23:19', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-09-2018 09:25:50', 'dd-mm-yyyy hh24:mi:ss'), '0101');
insert into SYS_USER (USER_ID, USER_PWD, USER_NAME, USER_PY, EMAIL, SEX, MOBILE_PHONE, STATE, REMARKS, GMT_CREATE, GMT_UPDATE, GMT_LOGIN, USER_ORG)
values ('wangwu', 'tiJlxYSrcKCgMbhCEwWKfA==', '王五', 'ww', null, 0, null, 0, null, to_date('19-09-2018 09:27:30', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-09-2018 09:27:30', 'dd-mm-yyyy hh24:mi:ss'), null, '010101');
insert into SYS_USER (USER_ID, USER_PWD, USER_NAME, USER_PY, EMAIL, SEX, MOBILE_PHONE, STATE, REMARKS, GMT_CREATE, GMT_UPDATE, GMT_LOGIN, USER_ORG)
values ('qhdxd_dingqin', 'cKPUbweBuVOvO0tNHhI4bQ==', '丁琴', 'dq', null, 0, '18539269540', 0, '150122198706271623', to_date('31-01-2018 08:54:35', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-01-2018 08:55:17', 'dd-mm-yyyy hh24:mi:ss'), to_date('15-06-2018 10:51:19', 'dd-mm-yyyy hh24:mi:ss'), '0204');
insert into SYS_USER (USER_ID, USER_PWD, USER_NAME, USER_PY, EMAIL, SEX, MOBILE_PHONE, STATE, REMARKS, GMT_CREATE, GMT_UPDATE, GMT_LOGIN, USER_ORG)
values ('xtzy_huangyuanyuan', 'GaZ2Qzp4xISX9Wk6G9IpxA==', '黄园园', 'hyy', null, 0, '15038116243', 0, '410381199002243543', to_date('31-01-2018 08:56:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-01-2018 08:56:42', 'dd-mm-yyyy hh24:mi:ss'), to_date('09-05-2018 18:23:17', 'dd-mm-yyyy hh24:mi:ss'), '0205');
insert into SYS_USER (USER_ID, USER_PWD, USER_NAME, USER_PY, EMAIL, SEX, MOBILE_PHONE, STATE, REMARKS, GMT_CREATE, GMT_UPDATE, GMT_LOGIN, USER_ORG)
values ('hyzy_zhengying', 'FALmzZn31Chh3eLzZpn6eA==', '郑迎', 'zy', null, 0, '13523015661', 0, '411423198807084023', to_date('31-01-2018 08:56:58', 'dd-mm-yyyy hh24:mi:ss'), to_date('06-02-2018 14:35:51', 'dd-mm-yyyy hh24:mi:ss'), to_date('20-03-2018 12:29:48', 'dd-mm-yyyy hh24:mi:ss'), '0206');
insert into SYS_USER (USER_ID, USER_PWD, USER_NAME, USER_PY, EMAIL, SEX, MOBILE_PHONE, STATE, REMARKS, GMT_CREATE, GMT_UPDATE, GMT_LOGIN, USER_ORG)
values ('yuan_humingming', '0tRhHhY+lzd15Viy6/qWvQ==', '户明明', 'hmm', null, 0, '18838975725', 0, null, to_date('24-11-2017 10:22:37', 'dd-mm-yyyy hh24:mi:ss'), to_date('24-11-2017 10:11:36', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-04-2018 18:46:43', 'dd-mm-yyyy hh24:mi:ss'), '0201');
insert into SYS_USER (USER_ID, USER_PWD, USER_NAME, USER_PY, EMAIL, SEX, MOBILE_PHONE, STATE, REMARKS, GMT_CREATE, GMT_UPDATE, GMT_LOGIN, USER_ORG)
values ('chuangfu_humingming', '6otjdOTWTLlw9XyuCKCEkw==', '户明明', 'hmm', null, 0, '18838975725', 0, null, to_date('19-01-2018 11:00:12', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-01-2018 10:48:46', 'dd-mm-yyyy hh24:mi:ss'), to_date('08-05-2018 16:59:28', 'dd-mm-yyyy hh24:mi:ss'), '020201');
insert into SYS_USER (USER_ID, USER_PWD, USER_NAME, USER_PY, EMAIL, SEX, MOBILE_PHONE, STATE, REMARKS, GMT_CREATE, GMT_UPDATE, GMT_LOGIN, USER_ORG)
values ('admin_123', 'EU+DqCEa04kKfeVhJNEfLQ==', 'admin', 'admin', null, 0, null, 0, null, to_date('17-04-2018 11:27:56', 'dd-mm-yyyy hh24:mi:ss'), to_date('17-04-2018 11:27:56', 'dd-mm-yyyy hh24:mi:ss'), to_date('30-05-2018 15:49:32', 'dd-mm-yyyy hh24:mi:ss'), '1-3-2');
insert into SYS_USER (USER_ID, USER_PWD, USER_NAME, USER_PY, EMAIL, SEX, MOBILE_PHONE, STATE, REMARKS, GMT_CREATE, GMT_UPDATE, GMT_LOGIN, USER_ORG)
values ('miaoshuaishuai', 'me5cRwsIVhbe/sIDIqyzwg==', '苗帅帅', 'mss', null, 2, '13673603981', 0, null, to_date('17-04-2018 14:45:09', 'dd-mm-yyyy hh24:mi:ss'), to_date('17-04-2018 14:45:09', 'dd-mm-yyyy hh24:mi:ss'), to_date('27-04-2018 09:17:46', 'dd-mm-yyyy hh24:mi:ss'), '020801');
insert into SYS_USER (USER_ID, USER_PWD, USER_NAME, USER_PY, EMAIL, SEX, MOBILE_PHONE, STATE, REMARKS, GMT_CREATE, GMT_UPDATE, GMT_LOGIN, USER_ORG)
values ('zzwx_wujing', '/FrpX2oxI3pbtaOQaMyQvw==', '武静', 'wj', null, 0, '13460315792', 0, null, to_date('21-04-2018 11:46:57', 'dd-mm-yyyy hh24:mi:ss'), to_date('21-04-2018 11:46:57', 'dd-mm-yyyy hh24:mi:ss'), to_date('23-04-2018 11:32:02', 'dd-mm-yyyy hh24:mi:ss'), '0209');
insert into SYS_USER (USER_ID, USER_PWD, USER_NAME, USER_PY, EMAIL, SEX, MOBILE_PHONE, STATE, REMARKS, GMT_CREATE, GMT_UPDATE, GMT_LOGIN, USER_ORG)
values ('hnsstd_loujun', 'mUrVBCeOfaOFpKXj0m8qMA==', '娄珺', 'lj', null, 0, '13523429278', 0, null, to_date('21-04-2018 11:53:55', 'dd-mm-yyyy hh24:mi:ss'), to_date('21-04-2018 11:53:55', 'dd-mm-yyyy hh24:mi:ss'), to_date('25-04-2018 16:46:14', 'dd-mm-yyyy hh24:mi:ss'), '0210');
insert into SYS_USER (USER_ID, USER_PWD, USER_NAME, USER_PY, EMAIL, SEX, MOBILE_PHONE, STATE, REMARKS, GMT_CREATE, GMT_UPDATE, GMT_LOGIN, USER_ORG)
values ('zhongguoyinhang', '++UPg7PYunkSaQ4VZZSeZw==', '中国银行', 'zgyx', null, 0, null, 0, null, to_date('09-05-2018 13:51:39', 'dd-mm-yyyy hh24:mi:ss'), to_date('09-05-2018 13:51:39', 'dd-mm-yyyy hh24:mi:ss'), to_date('23-05-2018 16:44:44', 'dd-mm-yyyy hh24:mi:ss'), '0110');
insert into SYS_USER (USER_ID, USER_PWD, USER_NAME, USER_PY, EMAIL, SEX, MOBILE_PHONE, STATE, REMARKS, GMT_CREATE, GMT_UPDATE, GMT_LOGIN, USER_ORG)
values ('yinhang', 'KZkGN1U1GufblakllfGd0g==', 'yinhang', 'yinhang', null, 0, null, 0, null, to_date('08-05-2018 17:26:33', 'dd-mm-yyyy hh24:mi:ss'), to_date('08-05-2018 17:26:33', 'dd-mm-yyyy hh24:mi:ss'), to_date('07-11-2018 11:17:11', 'dd-mm-yyyy hh24:mi:ss'), '010104');
insert into SYS_USER (USER_ID, USER_PWD, USER_NAME, USER_PY, EMAIL, SEX, MOBILE_PHONE, STATE, REMARKS, GMT_CREATE, GMT_UPDATE, GMT_LOGIN, USER_ORG)
values ('daxidi', 'GIYLXtGzRJs+Nd9Qq4lDgQ==', '大溪地', 'dxd', null, 0, null, 0, null, to_date('10-05-2018 08:50:23', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-05-2018 08:50:23', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-08-2018 15:33:45', 'dd-mm-yyyy hh24:mi:ss'), '0201');
insert into SYS_USER (USER_ID, USER_PWD, USER_NAME, USER_PY, EMAIL, SEX, MOBILE_PHONE, STATE, REMARKS, GMT_CREATE, GMT_UPDATE, GMT_LOGIN, USER_ORG)
values ('lguser', 'imRKi1QuuK+vtWa6f43p8g==', 'lguser', 'lguser', '275562382@qq.com', 0, '18538556338', 0, '8070450532247939834', to_date('07-09-2018 09:02:06', 'dd-mm-yyyy hh24:mi:ss'), to_date('07-09-2018 09:02:06', 'dd-mm-yyyy hh24:mi:ss'), null, '0208');
insert into SYS_USER (USER_ID, USER_PWD, USER_NAME, USER_PY, EMAIL, SEX, MOBILE_PHONE, STATE, REMARKS, GMT_CREATE, GMT_UPDATE, GMT_LOGIN, USER_ORG)
values ('nephilim', '7XQzO595FqNx4LKN2BURoQ==', '测试中原银行农业支行', 'cszyyxnyzx', null, 0, null, 0, null, to_date('05-07-2018 09:09:14', 'dd-mm-yyyy hh24:mi:ss'), to_date('05-07-2018 09:09:14', 'dd-mm-yyyy hh24:mi:ss'), to_date('05-07-2018 10:45:17', 'dd-mm-yyyy hh24:mi:ss'), '010101');
commit;
