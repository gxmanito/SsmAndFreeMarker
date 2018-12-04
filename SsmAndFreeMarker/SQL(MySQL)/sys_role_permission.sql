/*
Navicat MySQL Data Transfer

Source Server         : 102
Source Server Version : 80012
Source Host           : localhost:3306
Source Database       : gx-admin

Target Server Type    : MYSQL
Target Server Version : 80012
File Encoding         : 65001

Date: 2018-11-08 16:46:56
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_permission`;
CREATE TABLE `sys_role_permission` (
  `SYS_ID` varchar(2) NOT NULL,
  `ROLE_ID` varchar(5) NOT NULL,
  `PERMISSION` varchar(10) NOT NULL,
  PRIMARY KEY (`SYS_ID`,`ROLE_ID`,`PERMISSION`),
  UNIQUE KEY `PK_SYS_ROLE_PERMISSION` (`SYS_ID`,`ROLE_ID`,`PERMISSION`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role_permission
-- ----------------------------
INSERT INTO `sys_role_permission` VALUES ('01', '02', 'vip');
INSERT INTO `sys_role_permission` VALUES ('02', 'noKey', 'noKey');
