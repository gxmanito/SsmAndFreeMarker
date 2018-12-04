 
create table SYS_USER_ROLE
(
  SYS_ID  VARCHAR2(2) not null,
  USER_ID VARCHAR2(20) not null,
  ROLE_ID VARCHAR2(5) not null
);
comment on table SYS_USER_ROLE
  is '系统用户';
alter table SYS_USER_ROLE
  add constraint PK_SYS_USER_ROLE primary key (SYS_ID, USER_ID, ROLE_ID);
 
insert into SYS_USER_ROLE (SYS_ID, USER_ID, ROLE_ID)
values ('00', 'admin', 'admin');
insert into SYS_USER_ROLE (SYS_ID, USER_ID, ROLE_ID)
values ('01', 'admin', 'admin');
insert into SYS_USER_ROLE (SYS_ID, USER_ID, ROLE_ID)
values ('01', 'caxt_yueyang', '01');
insert into SYS_USER_ROLE (SYS_ID, USER_ID, ROLE_ID)
values ('01', 'csyh_haha', '01');
insert into SYS_USER_ROLE (SYS_ID, USER_ID, ROLE_ID)
values ('01', 'csyh_haha', '02');
insert into SYS_USER_ROLE (SYS_ID, USER_ID, ROLE_ID)
values ('01', 'gfyh_wangdongxu', '01');
insert into SYS_USER_ROLE (SYS_ID, USER_ID, ROLE_ID)
values ('01', 'gjj_jianghongli', '01');
insert into SYS_USER_ROLE (SYS_ID, USER_ID, ROLE_ID)
values ('01', 'gjj_renzhe', '01');
insert into SYS_USER_ROLE (SYS_ID, USER_ID, ROLE_ID)
values ('01', 'gsyh_cuiyingying', '01');
insert into SYS_USER_ROLE (SYS_ID, USER_ID, ROLE_ID)
values ('01', 'gsyh_fenghuanhuan', '01');
insert into SYS_USER_ROLE (SYS_ID, USER_ID, ROLE_ID)
values ('01', 'gsyh_liubing', '01');
insert into SYS_USER_ROLE (SYS_ID, USER_ID, ROLE_ID)
values ('01', 'gsyh_zhaowanjuan', '01');
insert into SYS_USER_ROLE (SYS_ID, USER_ID, ROLE_ID)
values ('01', 'hxyh_chenzenan', '01');
insert into SYS_USER_ROLE (SYS_ID, USER_ID, ROLE_ID)
values ('01', 'jsyh_jiaomingrui', '01');
insert into SYS_USER_ROLE (SYS_ID, USER_ID, ROLE_ID)
values ('01', 'jsyh_wanghaikui', '01');
insert into SYS_USER_ROLE (SYS_ID, USER_ID, ROLE_ID)
values ('01', 'jsyh_zhangxiaohui', '01');
insert into SYS_USER_ROLE (SYS_ID, USER_ID, ROLE_ID)
values ('01', 'jtyh_dupeng', '01');
insert into SYS_USER_ROLE (SYS_ID, USER_ID, ROLE_ID)
values ('01', 'jtyh_houqiyong', '01');
insert into SYS_USER_ROLE (SYS_ID, USER_ID, ROLE_ID)
values ('01', 'msyh_laidawei', '01');
insert into SYS_USER_ROLE (SYS_ID, USER_ID, ROLE_ID)
values ('01', 'msyh_lidongping', '01');
insert into SYS_USER_ROLE (SYS_ID, USER_ID, ROLE_ID)
values ('01', 'ncxys_wangshujun', '01');
insert into SYS_USER_ROLE (SYS_ID, USER_ID, ROLE_ID)
values ('01', 'nephilim', '01');
insert into SYS_USER_ROLE (SYS_ID, USER_ID, ROLE_ID)
values ('01', 'nephilim', '02');
insert into SYS_USER_ROLE (SYS_ID, USER_ID, ROLE_ID)
values ('01', 'pfyh_liyan', '01');
insert into SYS_USER_ROLE (SYS_ID, USER_ID, ROLE_ID)
values ('01', 'shangdu_wangdongxu', '01');
insert into SYS_USER_ROLE (SYS_ID, USER_ID, ROLE_ID)
values ('01', 'wangwu', '02');
insert into SYS_USER_ROLE (SYS_ID, USER_ID, ROLE_ID)
values ('01', 'wyz123', '01');
insert into SYS_USER_ROLE (SYS_ID, USER_ID, ROLE_ID)
values ('01', 'wyz123', '02');
insert into SYS_USER_ROLE (SYS_ID, USER_ID, ROLE_ID)
values ('01', 'xns_songke', '01');
insert into SYS_USER_ROLE (SYS_ID, USER_ID, ROLE_ID)
values ('01', 'ycyh_mabaocheng', '01');
insert into SYS_USER_ROLE (SYS_ID, USER_ID, ROLE_ID)
values ('01', 'ycyh_songkai', '01');
insert into SYS_USER_ROLE (SYS_ID, USER_ID, ROLE_ID)
values ('01', 'ycyh_wanglindong', '01');
insert into SYS_USER_ROLE (SYS_ID, USER_ID, ROLE_ID)
values ('01', 'ycyh_zhaolujun', '01');
insert into SYS_USER_ROLE (SYS_ID, USER_ID, ROLE_ID)
values ('01', 'yinhang', '01');
insert into SYS_USER_ROLE (SYS_ID, USER_ID, ROLE_ID)
values ('01', 'yinhang', '02');
insert into SYS_USER_ROLE (SYS_ID, USER_ID, ROLE_ID)
values ('01', 'yinhang123', '01');
insert into SYS_USER_ROLE (SYS_ID, USER_ID, ROLE_ID)
values ('01', 'yinhang123', '02');
insert into SYS_USER_ROLE (SYS_ID, USER_ID, ROLE_ID)
values ('01', 'zgyh_hetaizhou', '01');
insert into SYS_USER_ROLE (SYS_ID, USER_ID, ROLE_ID)
values ('01', 'zgyh_shaoxin', '01');
insert into SYS_USER_ROLE (SYS_ID, USER_ID, ROLE_ID)
values ('01', 'zgyh_sunlu', '01');
insert into SYS_USER_ROLE (SYS_ID, USER_ID, ROLE_ID)
values ('01', 'zgyh_sunlu', '02');
insert into SYS_USER_ROLE (SYS_ID, USER_ID, ROLE_ID)
values ('01', 'zgyh_wangfei', '01');
insert into SYS_USER_ROLE (SYS_ID, USER_ID, ROLE_ID)
values ('01', 'zgyh_weizhongyuan', '01');
insert into SYS_USER_ROLE (SYS_ID, USER_ID, ROLE_ID)
values ('01', 'zgyh_wudi', '01');
insert into SYS_USER_ROLE (SYS_ID, USER_ID, ROLE_ID)
values ('01', 'zgyh_yangxingru', '01');
insert into SYS_USER_ROLE (SYS_ID, USER_ID, ROLE_ID)
values ('01', 'zgyh_yaozhenjiang', '01');
insert into SYS_USER_ROLE (SYS_ID, USER_ID, ROLE_ID)
values ('01', 'zgyh_zhangyawei', '01');
insert into SYS_USER_ROLE (SYS_ID, USER_ID, ROLE_ID)
values ('01', 'zhangsan', '01');
insert into SYS_USER_ROLE (SYS_ID, USER_ID, ROLE_ID)
values ('01', 'zhangsan', '02');
insert into SYS_USER_ROLE (SYS_ID, USER_ID, ROLE_ID)
values ('01', 'zhongguoyinhang', '01');
insert into SYS_USER_ROLE (SYS_ID, USER_ID, ROLE_ID)
values ('01', 'zhongguoyinhang', '02');
insert into SYS_USER_ROLE (SYS_ID, USER_ID, ROLE_ID)
values ('01', 'zyyh_ceshi', '01');
insert into SYS_USER_ROLE (SYS_ID, USER_ID, ROLE_ID)
values ('01', 'zyyh_ceshi', '02');
insert into SYS_USER_ROLE (SYS_ID, USER_ID, ROLE_ID)
values ('01', 'zyyh_chenli', '01');
insert into SYS_USER_ROLE (SYS_ID, USER_ID, ROLE_ID)
values ('01', 'zyyh_chenxi', '01');
insert into SYS_USER_ROLE (SYS_ID, USER_ID, ROLE_ID)
values ('01', 'zyyh_chenyingying', '01');
insert into SYS_USER_ROLE (SYS_ID, USER_ID, ROLE_ID)
values ('01', 'zyyh_liurui', '01');
insert into SYS_USER_ROLE (SYS_ID, USER_ID, ROLE_ID)
values ('01', 'zyyh_lixiyang', '01');
insert into SYS_USER_ROLE (SYS_ID, USER_ID, ROLE_ID)
values ('01', 'zyyh_wangjingyu', '01');
insert into SYS_USER_ROLE (SYS_ID, USER_ID, ROLE_ID)
values ('01', 'zyyh_yangzi', '01');
insert into SYS_USER_ROLE (SYS_ID, USER_ID, ROLE_ID)
values ('01', 'zyyh_zhangaiyun', '01');
insert into SYS_USER_ROLE (SYS_ID, USER_ID, ROLE_ID)
values ('01', 'zyyh_zhangqi', '01');
insert into SYS_USER_ROLE (SYS_ID, USER_ID, ROLE_ID)
values ('01', 'zyyh_zhangyongqiang', '01');
insert into SYS_USER_ROLE (SYS_ID, USER_ID, ROLE_ID)
values ('01', 'zyyh_zhangziyi', '01');
insert into SYS_USER_ROLE (SYS_ID, USER_ID, ROLE_ID)
values ('02', 'admin', 'noKey');
insert into SYS_USER_ROLE (SYS_ID, USER_ID, ROLE_ID)
values ('02', 'chuangfu_humingming', '02');
insert into SYS_USER_ROLE (SYS_ID, USER_ID, ROLE_ID)
values ('02', 'daxidi', 'noKey');
insert into SYS_USER_ROLE (SYS_ID, USER_ID, ROLE_ID)
values ('02', 'devetest', '02');
insert into SYS_USER_ROLE (SYS_ID, USER_ID, ROLE_ID)
values ('02', 'gaoxing', '02');
insert into SYS_USER_ROLE (SYS_ID, USER_ID, ROLE_ID)
values ('02', 'hnjd_renfei', 'noKey');
insert into SYS_USER_ROLE (SYS_ID, USER_ID, ROLE_ID)
values ('02', 'hnsstd_loujun', '02');
insert into SYS_USER_ROLE (SYS_ID, USER_ID, ROLE_ID)
values ('02', 'hyzy_zhengying', '02');
insert into SYS_USER_ROLE (SYS_ID, USER_ID, ROLE_ID)
values ('02', 'jsyh_wanghaikui', '02');
insert into SYS_USER_ROLE (SYS_ID, USER_ID, ROLE_ID)
values ('02', 'kfs_ceshi', 'noKey');
insert into SYS_USER_ROLE (SYS_ID, USER_ID, ROLE_ID)
values ('02', 'ldlg_hanshuai', '02');
insert into SYS_USER_ROLE (SYS_ID, USER_ID, ROLE_ID)
values ('02', 'lguser', '03');
insert into SYS_USER_ROLE (SYS_ID, USER_ID, ROLE_ID)
values ('02', 'lguser', 'noKey');
insert into SYS_USER_ROLE (SYS_ID, USER_ID, ROLE_ID)
values ('02', 'miaoshuaishuai', '02');
insert into SYS_USER_ROLE (SYS_ID, USER_ID, ROLE_ID)
values ('02', 'qhdxd_dingqin', '02');
insert into SYS_USER_ROLE (SYS_ID, USER_ID, ROLE_ID)
values ('02', 'xtzy_huangyuanyuan', '02');
insert into SYS_USER_ROLE (SYS_ID, USER_ID, ROLE_ID)
values ('02', 'xyceshi', '02');
insert into SYS_USER_ROLE (SYS_ID, USER_ID, ROLE_ID)
values ('02', 'xyceshi', 'noKey');
insert into SYS_USER_ROLE (SYS_ID, USER_ID, ROLE_ID)
values ('02', 'yaxing_humingming', '02');
insert into SYS_USER_ROLE (SYS_ID, USER_ID, ROLE_ID)
values ('02', 'yuan_humingming', '02');
insert into SYS_USER_ROLE (SYS_ID, USER_ID, ROLE_ID)
values ('02', 'zzjr_diaopingping', '02');
insert into SYS_USER_ROLE (SYS_ID, USER_ID, ROLE_ID)
values ('02', 'zzwx_wujing', '02');
insert into SYS_USER_ROLE (SYS_ID, USER_ID, ROLE_ID)
values ('02', 'zzxsy_jingliping', 'noKey');
insert into SYS_USER_ROLE (SYS_ID, USER_ID, ROLE_ID)
values ('03', 'admin', 'admin');
insert into SYS_USER_ROLE (SYS_ID, USER_ID, ROLE_ID)
values ('03', 'beiqulianhe', '03');
insert into SYS_USER_ROLE (SYS_ID, USER_ID, ROLE_ID)
values ('03', 'dongqucbd', '03');
insert into SYS_USER_ROLE (SYS_ID, USER_ID, ROLE_ID)
values ('03', 'dongquhuanghenanlu', '03');
insert into SYS_USER_ROLE (SYS_ID, USER_ID, ROLE_ID)
values ('03', 'dongqulianhe', '03');
insert into SYS_USER_ROLE (SYS_ID, USER_ID, ROLE_ID)
values ('03', 'erqiqu', '03');
insert into SYS_USER_ROLE (SYS_ID, USER_ID, ROLE_ID)
values ('03', 'gangqu_zhoujianwei', '04');
insert into SYS_USER_ROLE (SYS_ID, USER_ID, ROLE_ID)
values ('03', 'gaoxin', '03');
insert into SYS_USER_ROLE (SYS_ID, USER_ID, ROLE_ID)
values ('03', 'guancheng', '03');
insert into SYS_USER_ROLE (SYS_ID, USER_ID, ROLE_ID)
values ('03', 'jianguan', '02');
insert into SYS_USER_ROLE (SYS_ID, USER_ID, ROLE_ID)
values ('03', 'jingkai', '03');
insert into SYS_USER_ROLE (SYS_ID, USER_ID, ROLE_ID)
values ('03', 'jinshui', '03');
insert into SYS_USER_ROLE (SYS_ID, USER_ID, ROLE_ID)
values ('03', 'liyang', '02');
insert into SYS_USER_ROLE (SYS_ID, USER_ID, ROLE_ID)
values ('03', 'report', '01');
insert into SYS_USER_ROLE (SYS_ID, USER_ID, ROLE_ID)
values ('03', 'shizhongxin', '03');
insert into SYS_USER_ROLE (SYS_ID, USER_ID, ROLE_ID)
values ('03', 'xiqulianhe', '03');
insert into SYS_USER_ROLE (SYS_ID, USER_ID, ROLE_ID)
values ('03', 'zhongyuan', '03');
insert into SYS_USER_ROLE (SYS_ID, USER_ID, ROLE_ID)
values ('03', 'zzxqjg', '04');
insert into SYS_USER_ROLE (SYS_ID, USER_ID, ROLE_ID)
values ('04', 'admin', 'admin');
insert into SYS_USER_ROLE (SYS_ID, USER_ID, ROLE_ID)
values ('04', 'admin_123', '01');
insert into SYS_USER_ROLE (SYS_ID, USER_ID, ROLE_ID)
values ('04', 'admin_123', 'admin');
insert into SYS_USER_ROLE (SYS_ID, USER_ID, ROLE_ID)
values ('04', 'monitor', '01');
commit;
