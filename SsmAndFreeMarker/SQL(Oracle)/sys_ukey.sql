prompt PL/SQL Developer import file
prompt Created on 2018年11月8日 by Administrator
set feedback off
set define off
prompt Disabling triggers for SYS_UKEY...
alter table SYS_UKEY disable all triggers;
prompt Loading SYS_UKEY...
insert into SYS_UKEY (UKEY_ID, STATE, USER_ID, TYPE, PUBLIC_KEY, PRIVATE_KEY, GMTKEY_CREATE)
values ('12027cba12c98479', 2, 'zzxsy_jingliping', 0, null, null, to_date('19-04-2018 09:03:55', 'dd-mm-yyyy hh24:mi:ss'));
insert into SYS_UKEY (UKEY_ID, STATE, USER_ID, TYPE, PUBLIC_KEY, PRIVATE_KEY, GMTKEY_CREATE)
values ('12027e1512c985d4', 2, 'hnjd_renfei', 0, null, null, to_date('20-04-2018 10:59:39', 'dd-mm-yyyy hh24:mi:ss'));
insert into SYS_UKEY (UKEY_ID, STATE, USER_ID, TYPE, PUBLIC_KEY, PRIVATE_KEY, GMTKEY_CREATE)
values ('12027e0c12c985cb', 2, 'zzjr_diaopingping', 0, null, null, to_date('25-04-2018 16:53:18', 'dd-mm-yyyy hh24:mi:ss'));
insert into SYS_UKEY (UKEY_ID, STATE, USER_ID, TYPE, PUBLIC_KEY, PRIVATE_KEY, GMTKEY_CREATE)
values ('12027c9f12c9845e', 2, 'miaoshuaishuai', 0, null, null, to_date('17-04-2018 15:01:36', 'dd-mm-yyyy hh24:mi:ss'));
insert into SYS_UKEY (UKEY_ID, STATE, USER_ID, TYPE, PUBLIC_KEY, PRIVATE_KEY, GMTKEY_CREATE)
values ('1201c28d12c8ca4c', 2, 'yaxing_humingming', 0, null, null, to_date('21-04-2018 22:03:29', 'dd-mm-yyyy hh24:mi:ss'));
insert into SYS_UKEY (UKEY_ID, STATE, USER_ID, TYPE, PUBLIC_KEY, PRIVATE_KEY, GMTKEY_CREATE)
values ('12027cd812c98497', 2, 'hnsstd_loujun', 0, null, null, to_date('21-04-2018 12:05:21', 'dd-mm-yyyy hh24:mi:ss'));
insert into SYS_UKEY (UKEY_ID, STATE, USER_ID, TYPE, PUBLIC_KEY, PRIVATE_KEY, GMTKEY_CREATE)
values ('12027cf612c984b5', 2, 'zzwx_wujing', 0, null, null, to_date('21-04-2018 11:58:24', 'dd-mm-yyyy hh24:mi:ss'));
insert into SYS_UKEY (UKEY_ID, STATE, USER_ID, TYPE, PUBLIC_KEY, PRIVATE_KEY, GMTKEY_CREATE)
values ('1203d95e12cae11d', 2, 'daxidi', 0, null, null, to_date('19-06-2018 17:54:12', 'dd-mm-yyyy hh24:mi:ss'));
insert into SYS_UKEY (UKEY_ID, STATE, USER_ID, TYPE, PUBLIC_KEY, PRIVATE_KEY, GMTKEY_CREATE)
values ('1203da0612cae1c5', 2, 'kfs_ceshi', 0, null, null, to_date('13-06-2018 17:53:55', 'dd-mm-yyyy hh24:mi:ss'));
insert into SYS_UKEY (UKEY_ID, STATE, USER_ID, TYPE, PUBLIC_KEY, PRIVATE_KEY, GMTKEY_CREATE)
values ('1111', 3, 'zyyh_chenxi', 0, null, null, to_date('13-06-2018 18:41:18', 'dd-mm-yyyy hh24:mi:ss'));
commit;
prompt 10 records loaded
prompt Enabling triggers for SYS_UKEY...
alter table SYS_UKEY enable all triggers;
set feedback on
set define on
prompt Done.
