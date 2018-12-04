/*
Navicat MySQL Data Transfer

Source Server         : 102
Source Server Version : 80012
Source Host           : localhost:3306
Source Database       : gx-admin

Target Server Type    : MYSQL
Target Server Version : 80012
File Encoding         : 65001

Date: 2018-11-08 16:47:28
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `SYS_ID` varchar(2) NOT NULL,
  `USER_ID` varchar(20) NOT NULL,
  `ROLE_ID` varchar(5) NOT NULL,
  PRIMARY KEY (`SYS_ID`,`USER_ID`,`ROLE_ID`),
  UNIQUE KEY `PK_SYS_USER_ROLE` (`SYS_ID`,`USER_ID`,`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('00', 'admin', 'admin');
INSERT INTO `sys_user_role` VALUES ('01', 'admin', 'admin');
INSERT INTO `sys_user_role` VALUES ('01', 'caxt_yueyang', '01');
INSERT INTO `sys_user_role` VALUES ('01', 'csyh_haha', '01');
INSERT INTO `sys_user_role` VALUES ('01', 'csyh_haha', '02');
INSERT INTO `sys_user_role` VALUES ('01', 'gfyh_wangdongxu', '01');
INSERT INTO `sys_user_role` VALUES ('01', 'gjj_jianghongli', '01');
INSERT INTO `sys_user_role` VALUES ('01', 'gjj_renzhe', '01');
INSERT INTO `sys_user_role` VALUES ('01', 'gsyh_cuiyingying', '01');
INSERT INTO `sys_user_role` VALUES ('01', 'gsyh_fenghuanhuan', '01');
INSERT INTO `sys_user_role` VALUES ('01', 'gsyh_liubing', '01');
INSERT INTO `sys_user_role` VALUES ('01', 'gsyh_zhaowanjuan', '01');
INSERT INTO `sys_user_role` VALUES ('01', 'hxyh_chenzenan', '01');
INSERT INTO `sys_user_role` VALUES ('01', 'jsyh_jiaomingrui', '01');
INSERT INTO `sys_user_role` VALUES ('01', 'jsyh_wanghaikui', '01');
INSERT INTO `sys_user_role` VALUES ('01', 'jsyh_zhangxiaohui', '01');
INSERT INTO `sys_user_role` VALUES ('01', 'jtyh_dupeng', '01');
INSERT INTO `sys_user_role` VALUES ('01', 'jtyh_houqiyong', '01');
INSERT INTO `sys_user_role` VALUES ('01', 'msyh_laidawei', '01');
INSERT INTO `sys_user_role` VALUES ('01', 'msyh_lidongping', '01');
INSERT INTO `sys_user_role` VALUES ('01', 'ncxys_wangshujun', '01');
INSERT INTO `sys_user_role` VALUES ('01', 'nephilim', '01');
INSERT INTO `sys_user_role` VALUES ('01', 'nephilim', '02');
INSERT INTO `sys_user_role` VALUES ('01', 'pfyh_liyan', '01');
INSERT INTO `sys_user_role` VALUES ('01', 'shangdu_wangdongxu', '01');
INSERT INTO `sys_user_role` VALUES ('01', 'wangwu', '02');
INSERT INTO `sys_user_role` VALUES ('01', 'wyz123', '01');
INSERT INTO `sys_user_role` VALUES ('01', 'wyz123', '02');
INSERT INTO `sys_user_role` VALUES ('01', 'xns_songke', '01');
INSERT INTO `sys_user_role` VALUES ('01', 'ycyh_mabaocheng', '01');
INSERT INTO `sys_user_role` VALUES ('01', 'ycyh_songkai', '01');
INSERT INTO `sys_user_role` VALUES ('01', 'ycyh_wanglindong', '01');
INSERT INTO `sys_user_role` VALUES ('01', 'ycyh_zhaolujun', '01');
INSERT INTO `sys_user_role` VALUES ('01', 'yinhang', '01');
INSERT INTO `sys_user_role` VALUES ('01', 'yinhang', '02');
INSERT INTO `sys_user_role` VALUES ('01', 'yinhang123', '01');
INSERT INTO `sys_user_role` VALUES ('01', 'yinhang123', '02');
INSERT INTO `sys_user_role` VALUES ('01', 'zgyh_hetaizhou', '01');
INSERT INTO `sys_user_role` VALUES ('01', 'zgyh_shaoxin', '01');
INSERT INTO `sys_user_role` VALUES ('01', 'zgyh_sunlu', '01');
INSERT INTO `sys_user_role` VALUES ('01', 'zgyh_sunlu', '02');
INSERT INTO `sys_user_role` VALUES ('01', 'zgyh_wangfei', '01');
INSERT INTO `sys_user_role` VALUES ('01', 'zgyh_weizhongyuan', '01');
INSERT INTO `sys_user_role` VALUES ('01', 'zgyh_wudi', '01');
INSERT INTO `sys_user_role` VALUES ('01', 'zgyh_yangxingru', '01');
INSERT INTO `sys_user_role` VALUES ('01', 'zgyh_yaozhenjiang', '01');
INSERT INTO `sys_user_role` VALUES ('01', 'zgyh_zhangyawei', '01');
INSERT INTO `sys_user_role` VALUES ('01', 'zhangsan', '01');
INSERT INTO `sys_user_role` VALUES ('01', 'zhangsan', '02');
INSERT INTO `sys_user_role` VALUES ('01', 'zhongguoyinhang', '01');
INSERT INTO `sys_user_role` VALUES ('01', 'zhongguoyinhang', '02');
INSERT INTO `sys_user_role` VALUES ('01', 'zyyh_ceshi', '01');
INSERT INTO `sys_user_role` VALUES ('01', 'zyyh_ceshi', '02');
INSERT INTO `sys_user_role` VALUES ('01', 'zyyh_chenli', '01');
INSERT INTO `sys_user_role` VALUES ('01', 'zyyh_chenxi', '01');
INSERT INTO `sys_user_role` VALUES ('01', 'zyyh_chenyingying', '01');
INSERT INTO `sys_user_role` VALUES ('01', 'zyyh_liurui', '01');
INSERT INTO `sys_user_role` VALUES ('01', 'zyyh_lixiyang', '01');
INSERT INTO `sys_user_role` VALUES ('01', 'zyyh_wangjingyu', '01');
INSERT INTO `sys_user_role` VALUES ('01', 'zyyh_yangzi', '01');
INSERT INTO `sys_user_role` VALUES ('01', 'zyyh_zhangaiyun', '01');
INSERT INTO `sys_user_role` VALUES ('01', 'zyyh_zhangqi', '01');
INSERT INTO `sys_user_role` VALUES ('01', 'zyyh_zhangyongqiang', '01');
INSERT INTO `sys_user_role` VALUES ('01', 'zyyh_zhangziyi', '01');
INSERT INTO `sys_user_role` VALUES ('02', 'admin', 'noKey');
INSERT INTO `sys_user_role` VALUES ('02', 'chuangfu_humingming', '02');
INSERT INTO `sys_user_role` VALUES ('02', 'daxidi', 'noKey');
INSERT INTO `sys_user_role` VALUES ('02', 'devetest', '02');
INSERT INTO `sys_user_role` VALUES ('02', 'gaoxing', '02');
INSERT INTO `sys_user_role` VALUES ('02', 'hnjd_renfei', 'noKey');
INSERT INTO `sys_user_role` VALUES ('02', 'hnsstd_loujun', '02');
INSERT INTO `sys_user_role` VALUES ('02', 'hyzy_zhengying', '02');
INSERT INTO `sys_user_role` VALUES ('02', 'jsyh_wanghaikui', '02');
INSERT INTO `sys_user_role` VALUES ('02', 'kfs_ceshi', 'noKey');
INSERT INTO `sys_user_role` VALUES ('02', 'ldlg_hanshuai', '02');
INSERT INTO `sys_user_role` VALUES ('02', 'lguser', '03');
INSERT INTO `sys_user_role` VALUES ('02', 'lguser', 'noKey');
INSERT INTO `sys_user_role` VALUES ('02', 'miaoshuaishuai', '02');
INSERT INTO `sys_user_role` VALUES ('02', 'qhdxd_dingqin', '02');
INSERT INTO `sys_user_role` VALUES ('02', 'xtzy_huangyuanyuan', '02');
INSERT INTO `sys_user_role` VALUES ('02', 'xyceshi', '02');
INSERT INTO `sys_user_role` VALUES ('02', 'xyceshi', 'noKey');
INSERT INTO `sys_user_role` VALUES ('02', 'yaxing_humingming', '02');
INSERT INTO `sys_user_role` VALUES ('02', 'yuan_humingming', '02');
INSERT INTO `sys_user_role` VALUES ('02', 'zzjr_diaopingping', '02');
INSERT INTO `sys_user_role` VALUES ('02', 'zzwx_wujing', '02');
INSERT INTO `sys_user_role` VALUES ('02', 'zzxsy_jingliping', 'noKey');
INSERT INTO `sys_user_role` VALUES ('03', 'admin', 'admin');
INSERT INTO `sys_user_role` VALUES ('03', 'beiqulianhe', '03');
INSERT INTO `sys_user_role` VALUES ('03', 'dongqucbd', '03');
INSERT INTO `sys_user_role` VALUES ('03', 'dongquhuanghenanlu', '03');
INSERT INTO `sys_user_role` VALUES ('03', 'dongqulianhe', '03');
INSERT INTO `sys_user_role` VALUES ('03', 'erqiqu', '03');
INSERT INTO `sys_user_role` VALUES ('03', 'gangqu_zhoujianwei', '04');
INSERT INTO `sys_user_role` VALUES ('03', 'gaoxin', '03');
INSERT INTO `sys_user_role` VALUES ('03', 'guancheng', '03');
INSERT INTO `sys_user_role` VALUES ('03', 'jianguan', '02');
INSERT INTO `sys_user_role` VALUES ('03', 'jingkai', '03');
INSERT INTO `sys_user_role` VALUES ('03', 'jinshui', '03');
INSERT INTO `sys_user_role` VALUES ('03', 'liyang', '02');
INSERT INTO `sys_user_role` VALUES ('03', 'report', '01');
INSERT INTO `sys_user_role` VALUES ('03', 'shizhongxin', '03');
INSERT INTO `sys_user_role` VALUES ('03', 'xiqulianhe', '03');
INSERT INTO `sys_user_role` VALUES ('03', 'zhongyuan', '03');
INSERT INTO `sys_user_role` VALUES ('03', 'zzxqjg', '04');
INSERT INTO `sys_user_role` VALUES ('04', 'admin', 'admin');
INSERT INTO `sys_user_role` VALUES ('04', 'admin_123', '01');
INSERT INTO `sys_user_role` VALUES ('04', 'admin_123', 'admin');
INSERT INTO `sys_user_role` VALUES ('04', 'monitor', '01');
