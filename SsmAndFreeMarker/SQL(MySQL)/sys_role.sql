/*
Navicat MySQL Data Transfer

Source Server         : 102
Source Server Version : 80012
Source Host           : localhost:3306
Source Database       : gx-admin

Target Server Type    : MYSQL
Target Server Version : 80012
File Encoding         : 65001

Date: 2018-11-08 16:46:49
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `SYS_ID` varchar(2) NOT NULL COMMENT '系统id',
  `ROLE_ID` varchar(5) NOT NULL COMMENT '角色id',
  `ROLE_NAME` varchar(30) NOT NULL COMMENT '角色名称',
  `REMARKS` varchar(250) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`SYS_ID`,`ROLE_ID`),
  UNIQUE KEY `PK_SYS_ROLE` (`SYS_ID`,`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户角色';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('00', 'admin', '管理员', null);
INSERT INTO `sys_role` VALUES ('01', '01', '银行抵押', null);
INSERT INTO `sys_role` VALUES ('01', '02', '高级用户', null);
INSERT INTO `sys_role` VALUES ('01', 'admin', '管理员', null);
INSERT INTO `sys_role` VALUES ('02', '02', 'ukey', '房地产业务(vip)有key');
INSERT INTO `sys_role` VALUES ('02', 'admin', '管理员', null);
INSERT INTO `sys_role` VALUES ('02', 'noKey', 'noKey', 'noKey');
INSERT INTO `sys_role` VALUES ('03', '01', '报表管理', null);
INSERT INTO `sys_role` VALUES ('03', '02', '监管', null);
INSERT INTO `sys_role` VALUES ('03', '03', '公共账号', null);
INSERT INTO `sys_role` VALUES ('03', '04', '县区监管', null);
INSERT INTO `sys_role` VALUES ('03', 'admin', '管理员', null);
INSERT INTO `sys_role` VALUES ('04', '01', '监控角色', null);
INSERT INTO `sys_role` VALUES ('04', 'admin', '管理员', null);
