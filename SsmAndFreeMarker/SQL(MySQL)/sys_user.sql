/*
Navicat MySQL Data Transfer

Source Server         : 102
Source Server Version : 80012
Source Host           : localhost:3306
Source Database       : gx-admin

Target Server Type    : MYSQL
Target Server Version : 80012
File Encoding         : 65001

Date: 2018-11-08 16:47:08
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `USER_ID` varchar(20) NOT NULL COMMENT '账号',
  `USER_PWD` varchar(24) NOT NULL COMMENT '密码',
  `USER_NAME` varchar(500) NOT NULL COMMENT '名称',
  `USER_PY` varchar(30) NOT NULL COMMENT '姓名拼音',
  `EMAIL` varchar(350) DEFAULT NULL COMMENT '邮箱',
  `SEX` decimal(1,0) DEFAULT '0' COMMENT '性别 0：未知 1：男 2：女',
  `MOBILE_PHONE` varchar(18) DEFAULT NULL COMMENT '手机号',
  `STATE` decimal(3,0) NOT NULL DEFAULT '0' COMMENT '状态 sys_code.code_type=1',
  `REMARKS` varchar(250) DEFAULT NULL COMMENT '备注',
  `GMT_CREATE` date DEFAULT NULL COMMENT '创建时间',
  `GMT_UPDATE` date DEFAULT NULL COMMENT '密码更新时间',
  `GMT_LOGIN` date DEFAULT NULL COMMENT '最后登陆时间',
  `USER_ORG` varchar(50) DEFAULT NULL COMMENT '用户所属机构 sys_user_org.code',
  PRIMARY KEY (`USER_ID`),
  UNIQUE KEY `PK_SYS_USER` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('admin_123', 'EU+DqCEa04kKfeVhJNEfLQ==', 'admin', 'admin', null, '0', null, '0', null, '2018-04-17', '2018-04-17', '2018-05-30', '1-3-2');
INSERT INTO `sys_user` VALUES ('daxidi', 'GIYLXtGzRJs+Nd9Qq4lDgQ==', '大溪地', 'dxd', null, '0', null, '0', null, '2018-05-10', '2018-05-10', '2018-08-31', '0201');
INSERT INTO `sys_user` VALUES ('yinhang', 'KZkGN1U1GufblakllfGd0g==', 'yinhang', 'yinhang', null, '0', null, '0', null, '2018-05-08', '2018-05-08', '2018-11-07', '010104');
INSERT INTO `sys_user` VALUES ('zyyh_ceshi', 'F/s1nrzV+MCtG7BcfqakdQ==', '测试', 'cs', null, '0', null, '0', null, '2017-12-06', '2018-03-19', '2018-10-23', '010107');
INSERT INTO `sys_user` VALUES ('zyyh_chenxi', 'To2i5s7i7rR622c4Idu8Ag==', '陈玺', 'cx', null, '0', '15393702660', '0', null, '2017-09-09', '2018-06-05', '2018-06-07', '010101');
