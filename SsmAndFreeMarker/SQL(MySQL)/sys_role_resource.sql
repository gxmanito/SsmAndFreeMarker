/*
Navicat MySQL Data Transfer

Source Server         : 102
Source Server Version : 80012
Source Host           : localhost:3306
Source Database       : gx-admin

Target Server Type    : MYSQL
Target Server Version : 80012
File Encoding         : 65001

Date: 2018-11-08 16:47:02
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_role_resource
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_resource`;
CREATE TABLE `sys_role_resource` (
  `SYS_ID` varchar(2) NOT NULL,
  `ROLE_ID` varchar(5) NOT NULL,
  `RES_ID` decimal(10,0) NOT NULL,
  PRIMARY KEY (`SYS_ID`,`ROLE_ID`,`RES_ID`),
  UNIQUE KEY `PK_SYS_ROLE_RESOURCE` (`SYS_ID`,`ROLE_ID`,`RES_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色资源';

-- ----------------------------
-- Records of sys_role_resource
-- ----------------------------
INSERT INTO `sys_role_resource` VALUES ('00', 'admin', '99');
INSERT INTO `sys_role_resource` VALUES ('00', 'admin', '9901');
INSERT INTO `sys_role_resource` VALUES ('00', 'admin', '9902');
INSERT INTO `sys_role_resource` VALUES ('00', 'admin', '9903');
INSERT INTO `sys_role_resource` VALUES ('00', 'admin', '9904');
INSERT INTO `sys_role_resource` VALUES ('00', 'admin', '9905');
INSERT INTO `sys_role_resource` VALUES ('00', 'admin', '9906');
INSERT INTO `sys_role_resource` VALUES ('01', '01', '15');
INSERT INTO `sys_role_resource` VALUES ('01', '01', '1501');
INSERT INTO `sys_role_resource` VALUES ('01', '01', '1502');
INSERT INTO `sys_role_resource` VALUES ('01', '01', '1503');
INSERT INTO `sys_role_resource` VALUES ('01', '01', '1504');
INSERT INTO `sys_role_resource` VALUES ('01', '01', '1505');
INSERT INTO `sys_role_resource` VALUES ('01', '01', '1507');
INSERT INTO `sys_role_resource` VALUES ('01', '01', '1508');
INSERT INTO `sys_role_resource` VALUES ('01', '01', '1509');
INSERT INTO `sys_role_resource` VALUES ('01', '02', '15');
INSERT INTO `sys_role_resource` VALUES ('01', '02', '30');
INSERT INTO `sys_role_resource` VALUES ('01', '02', '40');
INSERT INTO `sys_role_resource` VALUES ('01', '02', '1501');
INSERT INTO `sys_role_resource` VALUES ('01', '02', '1502');
INSERT INTO `sys_role_resource` VALUES ('01', '02', '1503');
INSERT INTO `sys_role_resource` VALUES ('01', '02', '1504');
INSERT INTO `sys_role_resource` VALUES ('01', '02', '1505');
INSERT INTO `sys_role_resource` VALUES ('01', '02', '1506');
INSERT INTO `sys_role_resource` VALUES ('01', '02', '1507');
INSERT INTO `sys_role_resource` VALUES ('01', '02', '1508');
INSERT INTO `sys_role_resource` VALUES ('01', '02', '1509');
INSERT INTO `sys_role_resource` VALUES ('01', '02', '3001');
INSERT INTO `sys_role_resource` VALUES ('01', '02', '3002');
INSERT INTO `sys_role_resource` VALUES ('01', '02', '4002');
INSERT INTO `sys_role_resource` VALUES ('01', '02', '4003');
INSERT INTO `sys_role_resource` VALUES ('01', 'admin', '15');
INSERT INTO `sys_role_resource` VALUES ('01', 'admin', '30');
INSERT INTO `sys_role_resource` VALUES ('01', 'admin', '40');
INSERT INTO `sys_role_resource` VALUES ('01', 'admin', '1501');
INSERT INTO `sys_role_resource` VALUES ('01', 'admin', '1502');
INSERT INTO `sys_role_resource` VALUES ('01', 'admin', '1503');
INSERT INTO `sys_role_resource` VALUES ('01', 'admin', '1504');
INSERT INTO `sys_role_resource` VALUES ('01', 'admin', '1505');
INSERT INTO `sys_role_resource` VALUES ('01', 'admin', '1506');
INSERT INTO `sys_role_resource` VALUES ('01', 'admin', '1507');
INSERT INTO `sys_role_resource` VALUES ('01', 'admin', '1508');
INSERT INTO `sys_role_resource` VALUES ('01', 'admin', '1509');
INSERT INTO `sys_role_resource` VALUES ('01', 'admin', '3001');
INSERT INTO `sys_role_resource` VALUES ('01', 'admin', '3002');
INSERT INTO `sys_role_resource` VALUES ('01', 'admin', '3003');
INSERT INTO `sys_role_resource` VALUES ('01', 'admin', '3004');
INSERT INTO `sys_role_resource` VALUES ('01', 'admin', '4002');
INSERT INTO `sys_role_resource` VALUES ('01', 'admin', '4003');
INSERT INTO `sys_role_resource` VALUES ('02', '02', '16');
INSERT INTO `sys_role_resource` VALUES ('02', '02', '1601');
INSERT INTO `sys_role_resource` VALUES ('02', '02', '1602');
INSERT INTO `sys_role_resource` VALUES ('02', '02', '1603');
INSERT INTO `sys_role_resource` VALUES ('02', 'admin', '16');
INSERT INTO `sys_role_resource` VALUES ('02', 'admin', '1601');
INSERT INTO `sys_role_resource` VALUES ('02', 'admin', '1602');
INSERT INTO `sys_role_resource` VALUES ('02', 'admin', '1603');
INSERT INTO `sys_role_resource` VALUES ('02', 'admin', '1604');
INSERT INTO `sys_role_resource` VALUES ('02', 'admin', '160301');
INSERT INTO `sys_role_resource` VALUES ('02', 'noKey', '16');
INSERT INTO `sys_role_resource` VALUES ('02', 'noKey', '1601');
INSERT INTO `sys_role_resource` VALUES ('02', 'noKey', '1602');
INSERT INTO `sys_role_resource` VALUES ('02', 'noKey', '1603');
INSERT INTO `sys_role_resource` VALUES ('02', 'noKey', '1604');
INSERT INTO `sys_role_resource` VALUES ('03', '01', '40');
INSERT INTO `sys_role_resource` VALUES ('03', '01', '50');
INSERT INTO `sys_role_resource` VALUES ('03', '01', '60');
INSERT INTO `sys_role_resource` VALUES ('03', '01', '99');
INSERT INTO `sys_role_resource` VALUES ('03', '01', '4001');
INSERT INTO `sys_role_resource` VALUES ('03', '01', '4002');
INSERT INTO `sys_role_resource` VALUES ('03', '01', '5001');
INSERT INTO `sys_role_resource` VALUES ('03', '01', '5002');
INSERT INTO `sys_role_resource` VALUES ('03', '01', '5003');
INSERT INTO `sys_role_resource` VALUES ('03', '01', '5004');
INSERT INTO `sys_role_resource` VALUES ('03', '01', '6001');
INSERT INTO `sys_role_resource` VALUES ('03', '01', '6002');
INSERT INTO `sys_role_resource` VALUES ('03', '01', '9907');
INSERT INTO `sys_role_resource` VALUES ('03', '02', '50');
INSERT INTO `sys_role_resource` VALUES ('03', '02', '5001');
INSERT INTO `sys_role_resource` VALUES ('03', '02', '5002');
INSERT INTO `sys_role_resource` VALUES ('03', '02', '5003');
INSERT INTO `sys_role_resource` VALUES ('03', '02', '5004');
INSERT INTO `sys_role_resource` VALUES ('03', '02', '5005');
INSERT INTO `sys_role_resource` VALUES ('03', '03', '40');
INSERT INTO `sys_role_resource` VALUES ('03', '03', '50');
INSERT INTO `sys_role_resource` VALUES ('03', '03', '60');
INSERT INTO `sys_role_resource` VALUES ('03', '03', '4001');
INSERT INTO `sys_role_resource` VALUES ('03', '03', '4002');
INSERT INTO `sys_role_resource` VALUES ('03', '03', '4003');
INSERT INTO `sys_role_resource` VALUES ('03', '03', '4004');
INSERT INTO `sys_role_resource` VALUES ('03', '03', '4005');
INSERT INTO `sys_role_resource` VALUES ('03', '03', '4006');
INSERT INTO `sys_role_resource` VALUES ('03', '03', '4007');
INSERT INTO `sys_role_resource` VALUES ('03', '03', '4008');
INSERT INTO `sys_role_resource` VALUES ('03', '03', '5001');
INSERT INTO `sys_role_resource` VALUES ('03', '03', '5002');
INSERT INTO `sys_role_resource` VALUES ('03', '03', '5003');
INSERT INTO `sys_role_resource` VALUES ('03', '03', '5004');
INSERT INTO `sys_role_resource` VALUES ('03', '03', '5005');
INSERT INTO `sys_role_resource` VALUES ('03', '03', '6001');
INSERT INTO `sys_role_resource` VALUES ('03', '03', '6002');
INSERT INTO `sys_role_resource` VALUES ('03', '04', '40');
INSERT INTO `sys_role_resource` VALUES ('03', '04', '50');
INSERT INTO `sys_role_resource` VALUES ('03', '04', '60');
INSERT INTO `sys_role_resource` VALUES ('03', '04', '4001');
INSERT INTO `sys_role_resource` VALUES ('03', '04', '4002');
INSERT INTO `sys_role_resource` VALUES ('03', '04', '4003');
INSERT INTO `sys_role_resource` VALUES ('03', '04', '4004');
INSERT INTO `sys_role_resource` VALUES ('03', '04', '4005');
INSERT INTO `sys_role_resource` VALUES ('03', '04', '5001');
INSERT INTO `sys_role_resource` VALUES ('03', '04', '5002');
INSERT INTO `sys_role_resource` VALUES ('03', '04', '5005');
INSERT INTO `sys_role_resource` VALUES ('03', '04', '6001');
INSERT INTO `sys_role_resource` VALUES ('03', '04', '6002');
INSERT INTO `sys_role_resource` VALUES ('03', 'admin', '40');
INSERT INTO `sys_role_resource` VALUES ('03', 'admin', '50');
INSERT INTO `sys_role_resource` VALUES ('03', 'admin', '60');
INSERT INTO `sys_role_resource` VALUES ('03', 'admin', '80');
INSERT INTO `sys_role_resource` VALUES ('03', 'admin', '99');
INSERT INTO `sys_role_resource` VALUES ('03', 'admin', '4001');
INSERT INTO `sys_role_resource` VALUES ('03', 'admin', '4002');
INSERT INTO `sys_role_resource` VALUES ('03', 'admin', '4003');
INSERT INTO `sys_role_resource` VALUES ('03', 'admin', '4004');
INSERT INTO `sys_role_resource` VALUES ('03', 'admin', '4005');
INSERT INTO `sys_role_resource` VALUES ('03', 'admin', '4006');
INSERT INTO `sys_role_resource` VALUES ('03', 'admin', '4007');
INSERT INTO `sys_role_resource` VALUES ('03', 'admin', '4008');
INSERT INTO `sys_role_resource` VALUES ('03', 'admin', '4009');
INSERT INTO `sys_role_resource` VALUES ('03', 'admin', '4010');
INSERT INTO `sys_role_resource` VALUES ('03', 'admin', '4011');
INSERT INTO `sys_role_resource` VALUES ('03', 'admin', '4012');
INSERT INTO `sys_role_resource` VALUES ('03', 'admin', '5001');
INSERT INTO `sys_role_resource` VALUES ('03', 'admin', '5002');
INSERT INTO `sys_role_resource` VALUES ('03', 'admin', '5003');
INSERT INTO `sys_role_resource` VALUES ('03', 'admin', '5004');
INSERT INTO `sys_role_resource` VALUES ('03', 'admin', '5005');
INSERT INTO `sys_role_resource` VALUES ('03', 'admin', '5006');
INSERT INTO `sys_role_resource` VALUES ('03', 'admin', '6001');
INSERT INTO `sys_role_resource` VALUES ('03', 'admin', '6002');
INSERT INTO `sys_role_resource` VALUES ('03', 'admin', '8001');
INSERT INTO `sys_role_resource` VALUES ('03', 'admin', '8002');
INSERT INTO `sys_role_resource` VALUES ('03', 'admin', '9906');
INSERT INTO `sys_role_resource` VALUES ('03', 'admin', '9907');
INSERT INTO `sys_role_resource` VALUES ('04', '01', '30');
INSERT INTO `sys_role_resource` VALUES ('04', '01', '40');
INSERT INTO `sys_role_resource` VALUES ('04', '01', '50');
INSERT INTO `sys_role_resource` VALUES ('04', '01', '3001');
INSERT INTO `sys_role_resource` VALUES ('04', '01', '3002');
INSERT INTO `sys_role_resource` VALUES ('04', '01', '3003');
INSERT INTO `sys_role_resource` VALUES ('04', '01', '3004');
INSERT INTO `sys_role_resource` VALUES ('04', '01', '4001');
INSERT INTO `sys_role_resource` VALUES ('04', '01', '4002');
INSERT INTO `sys_role_resource` VALUES ('04', '01', '4003');
INSERT INTO `sys_role_resource` VALUES ('04', '01', '4004');
INSERT INTO `sys_role_resource` VALUES ('04', '01', '4005');
INSERT INTO `sys_role_resource` VALUES ('04', '01', '4006');
INSERT INTO `sys_role_resource` VALUES ('04', '01', '4007');
INSERT INTO `sys_role_resource` VALUES ('04', '01', '5001');
INSERT INTO `sys_role_resource` VALUES ('04', '01', '5002');
INSERT INTO `sys_role_resource` VALUES ('04', 'admin', '30');
INSERT INTO `sys_role_resource` VALUES ('04', 'admin', '40');
INSERT INTO `sys_role_resource` VALUES ('04', 'admin', '50');
INSERT INTO `sys_role_resource` VALUES ('04', 'admin', '3001');
INSERT INTO `sys_role_resource` VALUES ('04', 'admin', '3002');
INSERT INTO `sys_role_resource` VALUES ('04', 'admin', '3003');
INSERT INTO `sys_role_resource` VALUES ('04', 'admin', '3004');
INSERT INTO `sys_role_resource` VALUES ('04', 'admin', '4001');
INSERT INTO `sys_role_resource` VALUES ('04', 'admin', '4002');
INSERT INTO `sys_role_resource` VALUES ('04', 'admin', '4003');
INSERT INTO `sys_role_resource` VALUES ('04', 'admin', '4004');
INSERT INTO `sys_role_resource` VALUES ('04', 'admin', '4005');
INSERT INTO `sys_role_resource` VALUES ('04', 'admin', '4006');
INSERT INTO `sys_role_resource` VALUES ('04', 'admin', '4007');
INSERT INTO `sys_role_resource` VALUES ('04', 'admin', '4008');
INSERT INTO `sys_role_resource` VALUES ('04', 'admin', '5001');
INSERT INTO `sys_role_resource` VALUES ('04', 'admin', '5002');
