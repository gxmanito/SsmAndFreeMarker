/*
Navicat MySQL Data Transfer

Source Server         : 102
Source Server Version : 80012
Source Host           : localhost:3306
Source Database       : gx-admin

Target Server Type    : MYSQL
Target Server Version : 80012
File Encoding         : 65001

Date: 2018-11-08 16:46:37
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_id
-- ----------------------------
DROP TABLE IF EXISTS `sys_id`;
CREATE TABLE `sys_id` (
  `SYS_ID` varchar(2) DEFAULT NULL COMMENT '系统标识',
  `SYS_NAME` varchar(50) DEFAULT NULL COMMENT '系统名称'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统id表';

-- ----------------------------
-- Records of sys_id
-- ----------------------------
INSERT INTO `sys_id` VALUES ('00', '管理后台');
INSERT INTO `sys_id` VALUES ('01', '银行端');
INSERT INTO `sys_id` VALUES ('02', '开发商端');
INSERT INTO `sys_id` VALUES ('03', '报表调度');
INSERT INTO `sys_id` VALUES ('04', '监控报表');
