/*
 Navicat Premium Data Transfer

 Source Server         : My_MySQL
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : gxadmin

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 14/04/2020 10:53:22
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_code
-- ----------------------------
DROP TABLE IF EXISTS `sys_code`;
CREATE TABLE `sys_code`  (
  `CODE_TYPE` decimal(5, 0) NOT NULL COMMENT '代码类型',
  `TYPE_NAME` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型名称',
  `CODE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '代码',
  `NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `REMARKS` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`CODE_TYPE`, `CODE`) USING BTREE,
  UNIQUE INDEX `PK_SYS_CODE`(`CODE_TYPE`, `CODE`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码字典表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_code
-- ----------------------------
INSERT INTO `sys_code` VALUES (0, '性别', '0', '未知', NULL);
INSERT INTO `sys_code` VALUES (0, '性别', '1', '男性', NULL);
INSERT INTO `sys_code` VALUES (0, '性别', '2', '女性', NULL);
INSERT INTO `sys_code` VALUES (1, '用户状态', '0', '正常', NULL);
INSERT INTO `sys_code` VALUES (1, '用户状态', '1', '失效', NULL);
INSERT INTO `sys_code` VALUES (1, '用户状态', '2', '锁定', NULL);
INSERT INTO `sys_code` VALUES (1, '用户状态', '3', '禁用', NULL);
INSERT INTO `sys_code` VALUES (2, '资源类型', '0', '目录', NULL);
INSERT INTO `sys_code` VALUES (2, '资源类型', '1', '菜单', NULL);
INSERT INTO `sys_code` VALUES (2, '资源类型', '2', '功能', NULL);
INSERT INTO `sys_code` VALUES (3, '资源状态', '0', '正常', NULL);
INSERT INTO `sys_code` VALUES (3, '资源状态', '1', '失效', NULL);
INSERT INTO `sys_code` VALUES (4, '权利人类型', '1', '个人', NULL);
INSERT INTO `sys_code` VALUES (4, '权利人类型', '2', '企业', NULL);
INSERT INTO `sys_code` VALUES (4, '权利人类型', '3', '事业单位', NULL);
INSERT INTO `sys_code` VALUES (4, '权利人类型', '4', '国家机关', NULL);
INSERT INTO `sys_code` VALUES (4, '权利人类型', '99', '其他', NULL);
INSERT INTO `sys_code` VALUES (5, '证件种类', '1', '身份证', NULL);
INSERT INTO `sys_code` VALUES (5, '证件种类', '2', '港澳通行证（台湾居民来往大陆通行证）', NULL);
INSERT INTO `sys_code` VALUES (5, '证件种类', '3', '护照', NULL);
INSERT INTO `sys_code` VALUES (5, '证件种类', '4', '户口簿', NULL);
INSERT INTO `sys_code` VALUES (5, '证件种类', '5', '军官证（士兵证）', NULL);
INSERT INTO `sys_code` VALUES (5, '证件种类', '6', '组织机构代码', NULL);
INSERT INTO `sys_code` VALUES (5, '证件种类', '7', '营业执照', NULL);
INSERT INTO `sys_code` VALUES (5, '证件种类', '99', '其他', NULL);
INSERT INTO `sys_code` VALUES (6, '共有方式', '0', '单独所有', NULL);
INSERT INTO `sys_code` VALUES (6, '共有方式', '1', '共同共有', NULL);
INSERT INTO `sys_code` VALUES (6, '共有方式', '2', '按份共有', '填写占有比例');
INSERT INTO `sys_code` VALUES (6, '共有方式', '3', '其他共有', NULL);
INSERT INTO `sys_code` VALUES (7, '受理状态', '0', '待受理', NULL);
INSERT INTO `sys_code` VALUES (7, '受理状态', '1', '已受理', NULL);
INSERT INTO `sys_code` VALUES (7, '受理状态', '3', '不予受理', NULL);
INSERT INTO `sys_code` VALUES (8, '登记类型', '0101', '房地首次登记', NULL);
INSERT INTO `sys_code` VALUES (8, '登记类型', '0102', '房地转移登记', NULL);
INSERT INTO `sys_code` VALUES (8, '登记类型', '0201', '抵押设立登记', NULL);
INSERT INTO `sys_code` VALUES (8, '登记类型', '0204', '抵押注销登记', NULL);
INSERT INTO `sys_code` VALUES (8, '登记类型', '0221', '联合抵押登记', NULL);
INSERT INTO `sys_code` VALUES (8, '登记类型', '0303', '预售商品房买卖预告登记', NULL);
INSERT INTO `sys_code` VALUES (8, '登记类型', '0304', '预购商品房抵押权预告登记', NULL);
INSERT INTO `sys_code` VALUES (8, '登记类型', '0305', '预告注销登记', NULL);
INSERT INTO `sys_code` VALUES (9, '地类代码', '01', '耕地', NULL);
INSERT INTO `sys_code` VALUES (9, '地类代码', '011', '水田', NULL);
INSERT INTO `sys_code` VALUES (9, '地类代码', '013', '旱地', NULL);
INSERT INTO `sys_code` VALUES (9, '地类代码', '02', '园地', NULL);
INSERT INTO `sys_code` VALUES (9, '地类代码', '021', '果园', NULL);
INSERT INTO `sys_code` VALUES (9, '地类代码', '023', '其他园地', NULL);
INSERT INTO `sys_code` VALUES (9, '地类代码', '03', '林地', NULL);
INSERT INTO `sys_code` VALUES (9, '地类代码', '031', '有林地', NULL);
INSERT INTO `sys_code` VALUES (9, '地类代码', '05', '商服用地', NULL);
INSERT INTO `sys_code` VALUES (9, '地类代码', '051', '批发零售用地', NULL);
INSERT INTO `sys_code` VALUES (9, '地类代码', '052', '住宿餐饮用地', NULL);
INSERT INTO `sys_code` VALUES (9, '地类代码', '053', '商务金融用地', NULL);
INSERT INTO `sys_code` VALUES (9, '地类代码', '054', '其它商服用地', NULL);
INSERT INTO `sys_code` VALUES (9, '地类代码', '06', '工矿仓储用地', NULL);
INSERT INTO `sys_code` VALUES (9, '地类代码', '061', '工业用地', NULL);
INSERT INTO `sys_code` VALUES (9, '地类代码', '063', '仓储用地', NULL);
INSERT INTO `sys_code` VALUES (9, '地类代码', '07', '住宅用地', NULL);
INSERT INTO `sys_code` VALUES (9, '地类代码', '071', '城镇住宅用地', NULL);
INSERT INTO `sys_code` VALUES (9, '地类代码', '072', '农村宅基地', NULL);
INSERT INTO `sys_code` VALUES (9, '地类代码', '08', '公共管理与公共服务用地', NULL);
INSERT INTO `sys_code` VALUES (9, '地类代码', '081', '机关团体用地', NULL);
INSERT INTO `sys_code` VALUES (9, '地类代码', '082', '新闻出版用地', NULL);
INSERT INTO `sys_code` VALUES (9, '地类代码', '083', '科教用地', NULL);
INSERT INTO `sys_code` VALUES (9, '地类代码', '084', '医卫慈善用地', NULL);
INSERT INTO `sys_code` VALUES (9, '地类代码', '085', '文体娱乐用地', NULL);
INSERT INTO `sys_code` VALUES (9, '地类代码', '086', '公共设施用地', NULL);
INSERT INTO `sys_code` VALUES (9, '地类代码', '087', '公园与绿地', NULL);
INSERT INTO `sys_code` VALUES (9, '地类代码', '088', '风景名胜设施用地', NULL);
INSERT INTO `sys_code` VALUES (9, '地类代码', '09', '特殊用地', NULL);
INSERT INTO `sys_code` VALUES (9, '地类代码', '091', '军事设施用地', NULL);
INSERT INTO `sys_code` VALUES (9, '地类代码', '093', '监教场所用地', NULL);
INSERT INTO `sys_code` VALUES (9, '地类代码', '094', '宗教用地', NULL);
INSERT INTO `sys_code` VALUES (9, '地类代码', '095', '殡葬用地', NULL);
INSERT INTO `sys_code` VALUES (9, '地类代码', '10', '交通运输用地', NULL);
INSERT INTO `sys_code` VALUES (9, '地类代码', '101', '铁路用地', NULL);
INSERT INTO `sys_code` VALUES (9, '地类代码', '102', '公路用地', NULL);
INSERT INTO `sys_code` VALUES (9, '地类代码', '103', '街巷用地', NULL);
INSERT INTO `sys_code` VALUES (9, '地类代码', '105', '机场用地', NULL);
INSERT INTO `sys_code` VALUES (9, '地类代码', '107', '管道运输用地', NULL);
INSERT INTO `sys_code` VALUES (9, '地类代码', '11', '水域及水利设施用地', NULL);
INSERT INTO `sys_code` VALUES (9, '地类代码', '113', '水库水面', NULL);
INSERT INTO `sys_code` VALUES (9, '地类代码', '114', '坑塘水面', NULL);
INSERT INTO `sys_code` VALUES (9, '地类代码', '117', '沟渠', NULL);
INSERT INTO `sys_code` VALUES (9, '地类代码', '118', '水工建筑用地', NULL);
INSERT INTO `sys_code` VALUES (9, '地类代码', '119', '冰川及永久积雪', NULL);
INSERT INTO `sys_code` VALUES (9, '地类代码', '12', '其它土地', NULL);
INSERT INTO `sys_code` VALUES (9, '地类代码', '122', '设施农用地', NULL);
INSERT INTO `sys_code` VALUES (9, '地类代码', '205', '风景名胜及特殊用地', NULL);
INSERT INTO `sys_code` VALUES (9, '地类代码', '302', '建设用地', NULL);
INSERT INTO `sys_code` VALUES (10, '产权来源', '1', '存量房因继承（受遗赠）转移登记', NULL);
INSERT INTO `sys_code` VALUES (10, '产权来源', '11', '因企业破产兼并、合并的转移登记', NULL);
INSERT INTO `sys_code` VALUES (10, '产权来源', '12', '因单位优惠出售公有住房的转移登记', NULL);
INSERT INTO `sys_code` VALUES (10, '产权来源', '13', '因法院判决（协助执行）的转移登记', NULL);
INSERT INTO `sys_code` VALUES (10, '产权来源', '14', '因房改房收回的转移登记', NULL);
INSERT INTO `sys_code` VALUES (10, '产权来源', '15', '因司法拍卖房屋的转移登记', NULL);
INSERT INTO `sys_code` VALUES (10, '产权来源', '16', '因国有、集体企业改制的转移登记', NULL);
INSERT INTO `sys_code` VALUES (10, '产权来源', '17', '非住宅类房屋因同一所有权人分割、合并的转移登记', NULL);
INSERT INTO `sys_code` VALUES (10, '产权来源', '2', '因夫妻离婚析产的转移登记', NULL);
INSERT INTO `sys_code` VALUES (10, '产权来源', '20', '因征收、拆迁安置的转移登记', NULL);
INSERT INTO `sys_code` VALUES (10, '产权来源', '21', '因开发建设单位出售商品房（含经济适用房）的转移登记', NULL);
INSERT INTO `sys_code` VALUES (10, '产权来源', '22', '因委托拍卖机构拍卖房屋的转移登记', NULL);
INSERT INTO `sys_code` VALUES (10, '产权来源', '23', '因房改房产权比例变更的转移登记', NULL);
INSERT INTO `sys_code` VALUES (10, '产权来源', '24', '因有权机关没收、罚没后拍卖取得的转移登记', NULL);
INSERT INTO `sys_code` VALUES (10, '产权来源', '3', '因私有房屋交易的转移登记', NULL);
INSERT INTO `sys_code` VALUES (10, '产权来源', '4', '夫妻关系存续期间私有房屋因增加共有人（婚前财产）的转移登记', NULL);
INSERT INTO `sys_code` VALUES (10, '产权来源', '6', '因委托拍卖机构拍卖房屋的转移登记', NULL);
INSERT INTO `sys_code` VALUES (10, '产权来源', '8', '因单位房屋转让的转移登记', NULL);
INSERT INTO `sys_code` VALUES (10, '产权来源', '9', '因以房产作价入股的转移登记', NULL);
INSERT INTO `sys_code` VALUES (11, '个人报卷转移登记办理网点', '1-3-10', '郑东', NULL);
INSERT INTO `sys_code` VALUES (11, '个人报卷转移登记办理网点', '1-3-11', '高新', NULL);
INSERT INTO `sys_code` VALUES (11, '个人报卷转移登记办理网点', '1-3-4', '二七', NULL);
INSERT INTO `sys_code` VALUES (11, '个人报卷转移登记办理网点', '1-3-5', '金水', NULL);
INSERT INTO `sys_code` VALUES (11, '个人报卷转移登记办理网点', '1-3-6', '中原', NULL);
INSERT INTO `sys_code` VALUES (11, '个人报卷转移登记办理网点', '1-3-7', '管城', NULL);
INSERT INTO `sys_code` VALUES (11, '个人报卷转移登记办理网点', '1-3-8', '惠济', NULL);
INSERT INTO `sys_code` VALUES (11, '个人报卷转移登记办理网点', '1-3-9', '经开', NULL);
INSERT INTO `sys_code` VALUES (12, '个人报卷转移登记办理网点', '1-17', '新密', NULL);
INSERT INTO `sys_code` VALUES (13, '个人报卷转移登记办理网点', '1-14', '中牟', NULL);
INSERT INTO `sys_code` VALUES (14, '个人报卷转移登记办理网点', '1-13', '登封', NULL);
INSERT INTO `sys_code` VALUES (15, '个人报卷转移登记办理网点', '1-18', '航空港区', NULL);

-- ----------------------------
-- Table structure for sys_id
-- ----------------------------
DROP TABLE IF EXISTS `sys_id`;
CREATE TABLE `sys_id`  (
  `SYS_ID` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '系统标识',
  `SYS_NAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '系统名称'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统id表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_id
-- ----------------------------
INSERT INTO `sys_id` VALUES ('00', '管理后台');
INSERT INTO `sys_id` VALUES ('01', '银行端');
INSERT INTO `sys_id` VALUES ('02', '开发商端');
INSERT INTO `sys_id` VALUES ('03', '报表调度');
INSERT INTO `sys_id` VALUES ('04', '监控报表');

-- ----------------------------
-- Table structure for sys_resource
-- ----------------------------
DROP TABLE IF EXISTS `sys_resource`;
CREATE TABLE `sys_resource`  (
  `SYS_ID` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '系统id',
  `RES_ID` decimal(10, 0) NOT NULL COMMENT '资源id',
  `PARENT` decimal(10, 0) NOT NULL COMMENT '上级资源id',
  `RES_NAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '资源名称',
  `RES_PY` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称拼音',
  `RES_TYPE` decimal(3, 0) NOT NULL COMMENT '资源类型 sys_code.code_type=2',
  `RES_URL` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资源地址',
  `ICON` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '显示图标',
  `STATE` decimal(3, 0) NOT NULL DEFAULT 0 COMMENT '状态 sys_code.code_type=3',
  `PERMISSION` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所需权限',
  `REMARKS` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `LVL` decimal(3, 0) NULL DEFAULT NULL COMMENT '等级/深度',
  `LFT` decimal(10, 0) NULL DEFAULT NULL COMMENT '左值',
  `RGT` decimal(10, 0) NULL DEFAULT NULL COMMENT '右值',
  PRIMARY KEY (`SYS_ID`, `RES_ID`) USING BTREE,
  UNIQUE INDEX `PK_SYS_RESOURCE`(`SYS_ID`, `RES_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统资源' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_resource
-- ----------------------------
INSERT INTO `sys_resource` VALUES ('00', 99, 0, '系统管理', 'xtgl', 0, '/sys/**', 'settings', 0, NULL, NULL, 0, 1, 14);
INSERT INTO `sys_resource` VALUES ('00', 9901, 99, '资源管理', 'zygl', 1, '/sys/res', NULL, 0, NULL, NULL, 1, 2, 3);
INSERT INTO `sys_resource` VALUES ('00', 9902, 99, '用户管理', 'yhgl', 1, '/sys/user', NULL, 0, NULL, NULL, 1, 4, 5);
INSERT INTO `sys_resource` VALUES ('00', 9903, 99, '角色管理', 'jsgl', 1, '/sys/role', NULL, 0, NULL, NULL, 1, 6, 7);
INSERT INTO `sys_resource` VALUES ('00', 9904, 99, '数据字典管理', 'sjzdgl', 1, '/sys/dict', NULL, 0, NULL, NULL, 1, 8, 9);
INSERT INTO `sys_resource` VALUES ('00', 9905, 99, '用户机构管理', 'yhjggl', 1, '/sys/userOrg', NULL, 0, NULL, NULL, 1, 10, 11);
INSERT INTO `sys_resource` VALUES ('00', 9906, 99, 'Ukeyc管理', 'Ukeycgl', 1, '/uKey/uKeyView', NULL, 0, NULL, NULL, 1, 12, 13);
INSERT INTO `sys_resource` VALUES ('01', 15, 0, '登记申请', 'djsq', 0, '/bank/**', NULL, 0, NULL, NULL, 0, 1, 20);
INSERT INTO `sys_resource` VALUES ('01', 30, 0, '登记查询', 'djcx', 0, NULL, NULL, 0, NULL, NULL, 0, 21, 40);
INSERT INTO `sys_resource` VALUES ('01', 40, 0, '登记缴费', 'djjf', 0, NULL, NULL, 0, NULL, NULL, 0, 41, 46);
INSERT INTO `sys_resource` VALUES ('01', 1501, 15, '现房抵押申请', 'xfdysq', 1, '/bank/pledge?registType=0201', NULL, 0, NULL, NULL, 1, 2, 3);
INSERT INTO `sys_resource` VALUES ('01', 1502, 15, '预购商品房抵押申请', 'ygspfdysq', 1, '/bank/pledge?registType=0304', NULL, 0, NULL, NULL, 1, 4, 5);
INSERT INTO `sys_resource` VALUES ('01', 1503, 15, '已受理业务查询', 'yslywcx', 1, '/bank/pledge-history', NULL, 0, NULL, NULL, 1, 14, 15);
INSERT INTO `sys_resource` VALUES ('01', 1504, 15, '现房抵押注销申请', 'xfdyzxsq', 1, '/bank/arrivedCancel-pledge?registType=0204', NULL, 0, NULL, NULL, 1, 6, 7);
INSERT INTO `sys_resource` VALUES ('01', 1505, 15, '预购商品房抵押注销申请', 'ygspfdyzxsq', 1, '/bank/arrivedCancel-pledge?registType=0305', NULL, 0, NULL, NULL, 1, 8, 9);
INSERT INTO `sys_resource` VALUES ('01', 1506, 15, '综合业务查询', 'zhywcx', 1, '/bank/comprehensive', NULL, 0, NULL, NULL, 1, 18, 19);
INSERT INTO `sys_resource` VALUES ('01', 1507, 15, '联合抵押申请', 'lhdysq', 1, '/bank/union-pledge?registType=0221', NULL, 0, NULL, NULL, 1, 10, 11);
INSERT INTO `sys_resource` VALUES ('01', 1508, 15, '联合抵押注销申请', 'lhdyzxsq', 1, '/bank/unionDYCancel?registType=0224', NULL, 0, NULL, NULL, 1, 12, 13);
INSERT INTO `sys_resource` VALUES ('01', 1509, 15, '贷后监管', 'dhjg', 1, '/bank/supervise', NULL, 0, NULL, NULL, 1, 16, 17);
INSERT INTO `sys_resource` VALUES ('01', 3001, 30, '不动产权属状态查询', 'bdcqsztcx', 1, '/bank/query', NULL, 0, NULL, NULL, 1, 22, 25);
INSERT INTO `sys_resource` VALUES ('01', 3002, 30, '登记进度查询', 'djjdcx', 1, '/bank/queryInfo', NULL, 0, NULL, NULL, 1, 26, 29);
INSERT INTO `sys_resource` VALUES ('01', 3003, 30, '登记证明查询', 'djzmcx', 1, '/bank/admissibilityNumber', NULL, 0, NULL, NULL, 1, 30, 33);
INSERT INTO `sys_resource` VALUES ('01', 3004, 30, '打印', 'dy', 1, '/print', NULL, 0, NULL, NULL, 1, 34, 39);
INSERT INTO `sys_resource` VALUES ('01', 4002, 40, '未缴费查询', 'wjfcx', 1, '/noPayReport/report', NULL, 0, NULL, NULL, 1, 42, 43);
INSERT INTO `sys_resource` VALUES ('01', 4003, 40, '已缴费查询', 'yjfcx', 1, '/report/report', NULL, 0, NULL, NULL, 1, 44, 45);
INSERT INTO `sys_resource` VALUES ('01', 300101, 3001, '不动产情况查询fun', 'bdcqkcxfun', 2, '/bank/queryPropertyPermits', NULL, 0, 'vip', NULL, 2, 23, 24);
INSERT INTO `sys_resource` VALUES ('01', 300201, 3002, '办理进度查询fun', 'bljdcxfun', 2, '/bank/status-queryStatus', NULL, 0, 'vip', NULL, 2, 27, 28);
INSERT INTO `sys_resource` VALUES ('01', 300301, 3003, '登记证明查询fun', 'djzmcxfun', 2, '/bank/getAdmissibilityNumber', NULL, 0, 'vip', NULL, 2, 31, 32);
INSERT INTO `sys_resource` VALUES ('01', 300401, 3004, '抵押合同打印', 'dyhtdy', 2, '/bank/contractCopy', NULL, 0, 'vip', NULL, 2, 35, 36);
INSERT INTO `sys_resource` VALUES ('01', 300402, 3004, '申请审批表打印', 'sqspbdy', 2, '/bank/applicationPrint', NULL, 0, 'vip', NULL, 2, 37, 38);
INSERT INTO `sys_resource` VALUES ('02', 16, 0, '开发商业务', 'kfsyw', 0, '/developers/**', NULL, 0, NULL, NULL, 0, 1, 12);
INSERT INTO `sys_resource` VALUES ('02', 1601, 16, '预告登记', 'ygdj', 1, '/developers/regist?registType=0303', NULL, 0, NULL, NULL, 1, 2, 3);
INSERT INTO `sys_resource` VALUES ('02', 1602, 16, '首次登记', 'scdj', 1, '/developers/regist?registType=0101', NULL, 0, NULL, NULL, 1, 4, 5);
INSERT INTO `sys_resource` VALUES ('02', 1603, 16, '转移登记', 'zydj', 1, '/developers/regist?registType=0102', NULL, 0, NULL, NULL, 1, 8, 11);
INSERT INTO `sys_resource` VALUES ('02', 1604, 16, '转移预告', 'zyyg', 1, '/developers/regist?registType=0301', NULL, 0, NULL, NULL, 1, 6, 7);
INSERT INTO `sys_resource` VALUES ('02', 160301, 1603, '无key登录', 'wkeydl', 2, '111', NULL, 0, 'noKey', NULL, 2, 9, 10);
INSERT INTO `sys_resource` VALUES ('03', 40, 0, '数据统计', 'sjtj', 0, NULL, NULL, 0, NULL, NULL, 0, 15, 40);
INSERT INTO `sys_resource` VALUES ('03', 50, 0, '数据监控', 'sjjk', 0, NULL, NULL, 0, NULL, NULL, 0, 1, 14);
INSERT INTO `sys_resource` VALUES ('03', 60, 0, '绩效分析', 'jxfx', 0, NULL, NULL, 0, NULL, NULL, 0, 41, 46);
INSERT INTO `sys_resource` VALUES ('03', 80, 0, '调度管理', 'ddgl', 0, '/schedule/**', 'clock', 0, NULL, NULL, 0, 47, 52);
INSERT INTO `sys_resource` VALUES ('03', 99, 0, '系统管理', 'xtgl', 0, '/sys/**', 'settings', 0, NULL, NULL, 0, 53, 58);
INSERT INTO `sys_resource` VALUES ('03', 4001, 40, '综合业务统计表', 'zhywtjb', 1, '/stats/countPage', NULL, 0, NULL, NULL, 1, 16, 17);
INSERT INTO `sys_resource` VALUES ('03', 4002, 40, '业务受理统计表', 'ywsltjb', 1, '/stats/integrated', NULL, 0, NULL, NULL, 1, 18, 19);
INSERT INTO `sys_resource` VALUES ('03', 4003, 40, '业务受理明细表', 'ywslmxb', 1, '/stats/fzxywsl', NULL, 0, NULL, NULL, 1, 20, 21);
INSERT INTO `sys_resource` VALUES ('03', 4004, 40, '业务收费统计表', 'ywsftjb', 1, '/stats/centerBusiCharge', NULL, 0, NULL, NULL, 1, 22, 23);
INSERT INTO `sys_resource` VALUES ('03', 4005, 40, '业务收费明细表', 'ywsfmxb', 1, '/stats/fzxywsf', NULL, 0, NULL, NULL, 1, 24, 25);
INSERT INTO `sys_resource` VALUES ('03', 4006, 40, '微信预约统计表', 'wxyytjb', 1, '/stats/wxReCount', NULL, 0, NULL, NULL, 1, 26, 27);
INSERT INTO `sys_resource` VALUES ('03', 4007, 40, '微信预约明细表', 'wxyymxb', 1, '/stats/wxReDetail', NULL, 0, NULL, NULL, 1, 28, 29);
INSERT INTO `sys_resource` VALUES ('03', 4008, 40, '评价意见统计表', 'pjyjtjb', 1, '/stats/evaluate', NULL, 0, NULL, NULL, 1, 30, 31);
INSERT INTO `sys_resource` VALUES ('03', 4009, 40, 'EMS邮寄统计', 'EMSyjtj', 1, '/stats/emsMailOrder', NULL, 0, NULL, NULL, 1, 32, 33);
INSERT INTO `sys_resource` VALUES ('03', 4010, 40, '登簿量统计', 'dbltj', 1, '/half/month', NULL, 0, NULL, NULL, 1, 34, 35);
INSERT INTO `sys_resource` VALUES ('03', 4011, 40, '不动产登记报表结果输出', 'bdcdjbbjgsc', 1, '/real/estate', NULL, 0, NULL, NULL, 1, 36, 37);
INSERT INTO `sys_resource` VALUES ('03', 4012, 40, '不动产登记中土地抵押情况统计表', 'bdcdjztddyqktjb', 1, '/bdc/landPledge', NULL, 0, NULL, NULL, 1, 38, 39);
INSERT INTO `sys_resource` VALUES ('03', 5001, 50, '实时监控', 'ssjk', 1, '/stats/monitorPage', NULL, 0, NULL, NULL, 1, 2, 3);
INSERT INTO `sys_resource` VALUES ('03', 5002, 50, '综合监控', 'zhjk', 1, '/stats/integratedMonitor', NULL, 0, NULL, NULL, 1, 4, 5);
INSERT INTO `sys_resource` VALUES ('03', 5003, 50, '中心预约监控', 'zxyyjk', 1, '/stats/wxMonitoringReverseDept', NULL, 0, NULL, NULL, 1, 6, 7);
INSERT INTO `sys_resource` VALUES ('03', 5004, 50, '业务预约监控', 'ywyyjk', 1, '/stats/wxMonitoringReverseBusi', NULL, 0, NULL, NULL, 1, 8, 9);
INSERT INTO `sys_resource` VALUES ('03', 5005, 50, '案卷受理状态监控', 'ajslztjk', 1, '/stats/caseAccept', NULL, 0, NULL, NULL, 1, 12, 13);
INSERT INTO `sys_resource` VALUES ('03', 5006, 50, '预约预警监控', 'yyyjjk', 1, '/stats/wxReverseWarn', NULL, 0, NULL, NULL, 1, 10, 11);
INSERT INTO `sys_resource` VALUES ('03', 6001, 60, '人员绩效统计表', 'ryjxtjb', 1, '/stats/fzxryjx', NULL, 0, NULL, NULL, 1, 42, 43);
INSERT INTO `sys_resource` VALUES ('03', 6002, 60, '中心绩效统计表', 'zxjxtjb', 1, '/stats/zxjx', NULL, 0, NULL, NULL, 1, 44, 45);
INSERT INTO `sys_resource` VALUES ('03', 8001, 80, '任务管理', 'rwgl', 1, '/schedule/sched', NULL, 0, NULL, NULL, 1, 48, 49);
INSERT INTO `sys_resource` VALUES ('03', 8002, 80, '调度日志', 'ddrz', 1, '/schedule/jobExecLog', NULL, 0, NULL, NULL, 1, 50, 51);
INSERT INTO `sys_resource` VALUES ('03', 9906, 99, '登记类型归类', 'djlxgl', 1, '/sys/regist', NULL, 0, NULL, NULL, 1, 54, 55);
INSERT INTO `sys_resource` VALUES ('03', 9907, 99, '综合业务指标', 'zhywzb', 1, '/sys/integrated', NULL, 0, NULL, NULL, 1, 56, 57);
INSERT INTO `sys_resource` VALUES ('04', 30, 0, '数据监控', 'sjjk', 0, NULL, NULL, 0, NULL, NULL, 0, 1, 10);
INSERT INTO `sys_resource` VALUES ('04', 40, 0, '数据统计', 'sjtj', 0, NULL, 'ios-pulse-strong', 0, NULL, NULL, 0, 11, 28);
INSERT INTO `sys_resource` VALUES ('04', 50, 0, '绩效分析', 'jxfx', 0, NULL, NULL, 0, NULL, NULL, 0, 29, 34);
INSERT INTO `sys_resource` VALUES ('04', 3001, 30, '实时监控', 'ssjk', 1, '/stats/monitorPage', NULL, 0, NULL, NULL, 1, 2, 3);
INSERT INTO `sys_resource` VALUES ('04', 3002, 30, '综合监控', 'zhjk', 1, '/stats/integratedMonitor', NULL, 0, NULL, NULL, 1, 4, 5);
INSERT INTO `sys_resource` VALUES ('04', 3003, 30, '中心预约监控', 'zxyyjk', 1, '/stats/wxMonitoringReverseDept', NULL, 0, NULL, NULL, 1, 6, 7);
INSERT INTO `sys_resource` VALUES ('04', 3004, 30, '业务预约监控', 'ywyyjk', 1, '/stats/wxMonitoringReverseBusi', NULL, 0, NULL, NULL, 1, 8, 9);
INSERT INTO `sys_resource` VALUES ('04', 4001, 40, '综合业务统计表', 'zhywtjb', 1, '/stats/countPage', NULL, 0, NULL, NULL, 1, 12, 13);
INSERT INTO `sys_resource` VALUES ('04', 4002, 40, '业务受理统计表', 'ywsltjb', 1, '/stats/integrated', NULL, 0, NULL, NULL, 1, 14, 15);
INSERT INTO `sys_resource` VALUES ('04', 4003, 40, '业务受理明细表', 'ywslmxb', 1, '/stats/fzxywsl', NULL, 0, NULL, NULL, 1, 16, 17);
INSERT INTO `sys_resource` VALUES ('04', 4004, 40, '业务收费统计表', 'ywsftjb', 1, '/stats/centerBusiCharge', NULL, 0, NULL, NULL, 1, 18, 19);
INSERT INTO `sys_resource` VALUES ('04', 4005, 40, '业务收费明细表', 'ywsfmxb', 1, '/stats/fzxywsl', NULL, 0, NULL, NULL, 1, 20, 21);
INSERT INTO `sys_resource` VALUES ('04', 4006, 40, '微信预约统计表', 'wxyytjb', 1, '/stats/wxReCount', NULL, 0, NULL, NULL, 1, 22, 23);
INSERT INTO `sys_resource` VALUES ('04', 4007, 40, '微信预约明细表', 'wxyymxb', 1, '/stats/wxReDetail', NULL, 0, NULL, NULL, 1, 24, 25);
INSERT INTO `sys_resource` VALUES ('04', 4008, 40, '评价意见统计表', 'pjyjtjb', 1, '/stats/evaluate', NULL, 0, NULL, NULL, 1, 26, 27);
INSERT INTO `sys_resource` VALUES ('04', 5001, 50, '人员绩效统计表', 'ryjxtjb', 1, '/stats/fzxryjx', NULL, 0, NULL, NULL, 1, 30, 31);
INSERT INTO `sys_resource` VALUES ('04', 5002, 50, '中心绩效统计表', 'zxjxtjb', 1, '/stats/zxjx', NULL, 0, NULL, NULL, 1, 32, 33);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `SYS_ID` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '系统id',
  `ROLE_ID` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色id',
  `ROLE_NAME` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `REMARKS` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`SYS_ID`, `ROLE_ID`) USING BTREE,
  UNIQUE INDEX `PK_SYS_ROLE`(`SYS_ID`, `ROLE_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户角色' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('00', 'admin', '管理员', NULL);
INSERT INTO `sys_role` VALUES ('01', '01', '银行抵押', NULL);
INSERT INTO `sys_role` VALUES ('01', '02', '高级用户', NULL);
INSERT INTO `sys_role` VALUES ('01', 'admin', '管理员', NULL);
INSERT INTO `sys_role` VALUES ('02', '02', 'ukey', '房地产业务(vip)有key');
INSERT INTO `sys_role` VALUES ('02', 'admin', '管理员', NULL);
INSERT INTO `sys_role` VALUES ('02', 'noKey', 'noKey', 'noKey');
INSERT INTO `sys_role` VALUES ('03', '01', '报表管理', NULL);
INSERT INTO `sys_role` VALUES ('03', '02', '监管', NULL);
INSERT INTO `sys_role` VALUES ('03', '03', '公共账号', NULL);
INSERT INTO `sys_role` VALUES ('03', '04', '县区监管', NULL);
INSERT INTO `sys_role` VALUES ('03', 'admin', '管理员', NULL);
INSERT INTO `sys_role` VALUES ('04', '01', '监控角色', NULL);
INSERT INTO `sys_role` VALUES ('04', 'admin', '管理员', NULL);

-- ----------------------------
-- Table structure for sys_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_permission`;
CREATE TABLE `sys_role_permission`  (
  `SYS_ID` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ROLE_ID` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `PERMISSION` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`SYS_ID`, `ROLE_ID`, `PERMISSION`) USING BTREE,
  UNIQUE INDEX `PK_SYS_ROLE_PERMISSION`(`SYS_ID`, `ROLE_ID`, `PERMISSION`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_permission
-- ----------------------------
INSERT INTO `sys_role_permission` VALUES ('01', '02', 'vip');
INSERT INTO `sys_role_permission` VALUES ('02', 'noKey', 'noKey');

-- ----------------------------
-- Table structure for sys_role_resource
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_resource`;
CREATE TABLE `sys_role_resource`  (
  `SYS_ID` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ROLE_ID` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `RES_ID` decimal(10, 0) NOT NULL,
  PRIMARY KEY (`SYS_ID`, `ROLE_ID`, `RES_ID`) USING BTREE,
  UNIQUE INDEX `PK_SYS_ROLE_RESOURCE`(`SYS_ID`, `ROLE_ID`, `RES_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色资源' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_resource
-- ----------------------------
INSERT INTO `sys_role_resource` VALUES ('00', 'admin', 99);
INSERT INTO `sys_role_resource` VALUES ('00', 'admin', 9901);
INSERT INTO `sys_role_resource` VALUES ('00', 'admin', 9902);
INSERT INTO `sys_role_resource` VALUES ('00', 'admin', 9903);
INSERT INTO `sys_role_resource` VALUES ('00', 'admin', 9904);
INSERT INTO `sys_role_resource` VALUES ('00', 'admin', 9905);
INSERT INTO `sys_role_resource` VALUES ('00', 'admin', 9906);
INSERT INTO `sys_role_resource` VALUES ('01', '01', 15);
INSERT INTO `sys_role_resource` VALUES ('01', '01', 1501);
INSERT INTO `sys_role_resource` VALUES ('01', '01', 1502);
INSERT INTO `sys_role_resource` VALUES ('01', '01', 1503);
INSERT INTO `sys_role_resource` VALUES ('01', '01', 1504);
INSERT INTO `sys_role_resource` VALUES ('01', '01', 1505);
INSERT INTO `sys_role_resource` VALUES ('01', '01', 1507);
INSERT INTO `sys_role_resource` VALUES ('01', '01', 1508);
INSERT INTO `sys_role_resource` VALUES ('01', '01', 1509);
INSERT INTO `sys_role_resource` VALUES ('01', '02', 15);
INSERT INTO `sys_role_resource` VALUES ('01', '02', 30);
INSERT INTO `sys_role_resource` VALUES ('01', '02', 40);
INSERT INTO `sys_role_resource` VALUES ('01', '02', 1501);
INSERT INTO `sys_role_resource` VALUES ('01', '02', 1502);
INSERT INTO `sys_role_resource` VALUES ('01', '02', 1503);
INSERT INTO `sys_role_resource` VALUES ('01', '02', 1504);
INSERT INTO `sys_role_resource` VALUES ('01', '02', 1505);
INSERT INTO `sys_role_resource` VALUES ('01', '02', 1506);
INSERT INTO `sys_role_resource` VALUES ('01', '02', 1507);
INSERT INTO `sys_role_resource` VALUES ('01', '02', 1508);
INSERT INTO `sys_role_resource` VALUES ('01', '02', 1509);
INSERT INTO `sys_role_resource` VALUES ('01', '02', 3001);
INSERT INTO `sys_role_resource` VALUES ('01', '02', 3002);
INSERT INTO `sys_role_resource` VALUES ('01', '02', 4002);
INSERT INTO `sys_role_resource` VALUES ('01', '02', 4003);
INSERT INTO `sys_role_resource` VALUES ('01', 'admin', 15);
INSERT INTO `sys_role_resource` VALUES ('01', 'admin', 30);
INSERT INTO `sys_role_resource` VALUES ('01', 'admin', 40);
INSERT INTO `sys_role_resource` VALUES ('01', 'admin', 1501);
INSERT INTO `sys_role_resource` VALUES ('01', 'admin', 1502);
INSERT INTO `sys_role_resource` VALUES ('01', 'admin', 1503);
INSERT INTO `sys_role_resource` VALUES ('01', 'admin', 1504);
INSERT INTO `sys_role_resource` VALUES ('01', 'admin', 1505);
INSERT INTO `sys_role_resource` VALUES ('01', 'admin', 1506);
INSERT INTO `sys_role_resource` VALUES ('01', 'admin', 1507);
INSERT INTO `sys_role_resource` VALUES ('01', 'admin', 1508);
INSERT INTO `sys_role_resource` VALUES ('01', 'admin', 1509);
INSERT INTO `sys_role_resource` VALUES ('01', 'admin', 3001);
INSERT INTO `sys_role_resource` VALUES ('01', 'admin', 3002);
INSERT INTO `sys_role_resource` VALUES ('01', 'admin', 3003);
INSERT INTO `sys_role_resource` VALUES ('01', 'admin', 3004);
INSERT INTO `sys_role_resource` VALUES ('01', 'admin', 4002);
INSERT INTO `sys_role_resource` VALUES ('01', 'admin', 4003);
INSERT INTO `sys_role_resource` VALUES ('02', '02', 16);
INSERT INTO `sys_role_resource` VALUES ('02', '02', 1601);
INSERT INTO `sys_role_resource` VALUES ('02', '02', 1602);
INSERT INTO `sys_role_resource` VALUES ('02', '02', 1603);
INSERT INTO `sys_role_resource` VALUES ('02', 'admin', 16);
INSERT INTO `sys_role_resource` VALUES ('02', 'admin', 1601);
INSERT INTO `sys_role_resource` VALUES ('02', 'admin', 1602);
INSERT INTO `sys_role_resource` VALUES ('02', 'admin', 1603);
INSERT INTO `sys_role_resource` VALUES ('02', 'admin', 1604);
INSERT INTO `sys_role_resource` VALUES ('02', 'admin', 160301);
INSERT INTO `sys_role_resource` VALUES ('02', 'noKey', 16);
INSERT INTO `sys_role_resource` VALUES ('02', 'noKey', 1601);
INSERT INTO `sys_role_resource` VALUES ('02', 'noKey', 1602);
INSERT INTO `sys_role_resource` VALUES ('02', 'noKey', 1603);
INSERT INTO `sys_role_resource` VALUES ('02', 'noKey', 1604);
INSERT INTO `sys_role_resource` VALUES ('03', '01', 40);
INSERT INTO `sys_role_resource` VALUES ('03', '01', 50);
INSERT INTO `sys_role_resource` VALUES ('03', '01', 60);
INSERT INTO `sys_role_resource` VALUES ('03', '01', 99);
INSERT INTO `sys_role_resource` VALUES ('03', '01', 4001);
INSERT INTO `sys_role_resource` VALUES ('03', '01', 4002);
INSERT INTO `sys_role_resource` VALUES ('03', '01', 5001);
INSERT INTO `sys_role_resource` VALUES ('03', '01', 5002);
INSERT INTO `sys_role_resource` VALUES ('03', '01', 5003);
INSERT INTO `sys_role_resource` VALUES ('03', '01', 5004);
INSERT INTO `sys_role_resource` VALUES ('03', '01', 6001);
INSERT INTO `sys_role_resource` VALUES ('03', '01', 6002);
INSERT INTO `sys_role_resource` VALUES ('03', '01', 9907);
INSERT INTO `sys_role_resource` VALUES ('03', '02', 50);
INSERT INTO `sys_role_resource` VALUES ('03', '02', 5001);
INSERT INTO `sys_role_resource` VALUES ('03', '02', 5002);
INSERT INTO `sys_role_resource` VALUES ('03', '02', 5003);
INSERT INTO `sys_role_resource` VALUES ('03', '02', 5004);
INSERT INTO `sys_role_resource` VALUES ('03', '02', 5005);
INSERT INTO `sys_role_resource` VALUES ('03', '03', 40);
INSERT INTO `sys_role_resource` VALUES ('03', '03', 50);
INSERT INTO `sys_role_resource` VALUES ('03', '03', 60);
INSERT INTO `sys_role_resource` VALUES ('03', '03', 4001);
INSERT INTO `sys_role_resource` VALUES ('03', '03', 4002);
INSERT INTO `sys_role_resource` VALUES ('03', '03', 4003);
INSERT INTO `sys_role_resource` VALUES ('03', '03', 4004);
INSERT INTO `sys_role_resource` VALUES ('03', '03', 4005);
INSERT INTO `sys_role_resource` VALUES ('03', '03', 4006);
INSERT INTO `sys_role_resource` VALUES ('03', '03', 4007);
INSERT INTO `sys_role_resource` VALUES ('03', '03', 4008);
INSERT INTO `sys_role_resource` VALUES ('03', '03', 5001);
INSERT INTO `sys_role_resource` VALUES ('03', '03', 5002);
INSERT INTO `sys_role_resource` VALUES ('03', '03', 5003);
INSERT INTO `sys_role_resource` VALUES ('03', '03', 5004);
INSERT INTO `sys_role_resource` VALUES ('03', '03', 5005);
INSERT INTO `sys_role_resource` VALUES ('03', '03', 6001);
INSERT INTO `sys_role_resource` VALUES ('03', '03', 6002);
INSERT INTO `sys_role_resource` VALUES ('03', '04', 40);
INSERT INTO `sys_role_resource` VALUES ('03', '04', 50);
INSERT INTO `sys_role_resource` VALUES ('03', '04', 60);
INSERT INTO `sys_role_resource` VALUES ('03', '04', 4001);
INSERT INTO `sys_role_resource` VALUES ('03', '04', 4002);
INSERT INTO `sys_role_resource` VALUES ('03', '04', 4003);
INSERT INTO `sys_role_resource` VALUES ('03', '04', 4004);
INSERT INTO `sys_role_resource` VALUES ('03', '04', 4005);
INSERT INTO `sys_role_resource` VALUES ('03', '04', 5001);
INSERT INTO `sys_role_resource` VALUES ('03', '04', 5002);
INSERT INTO `sys_role_resource` VALUES ('03', '04', 5005);
INSERT INTO `sys_role_resource` VALUES ('03', '04', 6001);
INSERT INTO `sys_role_resource` VALUES ('03', '04', 6002);
INSERT INTO `sys_role_resource` VALUES ('03', 'admin', 40);
INSERT INTO `sys_role_resource` VALUES ('03', 'admin', 50);
INSERT INTO `sys_role_resource` VALUES ('03', 'admin', 60);
INSERT INTO `sys_role_resource` VALUES ('03', 'admin', 80);
INSERT INTO `sys_role_resource` VALUES ('03', 'admin', 99);
INSERT INTO `sys_role_resource` VALUES ('03', 'admin', 4001);
INSERT INTO `sys_role_resource` VALUES ('03', 'admin', 4002);
INSERT INTO `sys_role_resource` VALUES ('03', 'admin', 4003);
INSERT INTO `sys_role_resource` VALUES ('03', 'admin', 4004);
INSERT INTO `sys_role_resource` VALUES ('03', 'admin', 4005);
INSERT INTO `sys_role_resource` VALUES ('03', 'admin', 4006);
INSERT INTO `sys_role_resource` VALUES ('03', 'admin', 4007);
INSERT INTO `sys_role_resource` VALUES ('03', 'admin', 4008);
INSERT INTO `sys_role_resource` VALUES ('03', 'admin', 4009);
INSERT INTO `sys_role_resource` VALUES ('03', 'admin', 4010);
INSERT INTO `sys_role_resource` VALUES ('03', 'admin', 4011);
INSERT INTO `sys_role_resource` VALUES ('03', 'admin', 4012);
INSERT INTO `sys_role_resource` VALUES ('03', 'admin', 5001);
INSERT INTO `sys_role_resource` VALUES ('03', 'admin', 5002);
INSERT INTO `sys_role_resource` VALUES ('03', 'admin', 5003);
INSERT INTO `sys_role_resource` VALUES ('03', 'admin', 5004);
INSERT INTO `sys_role_resource` VALUES ('03', 'admin', 5005);
INSERT INTO `sys_role_resource` VALUES ('03', 'admin', 5006);
INSERT INTO `sys_role_resource` VALUES ('03', 'admin', 6001);
INSERT INTO `sys_role_resource` VALUES ('03', 'admin', 6002);
INSERT INTO `sys_role_resource` VALUES ('03', 'admin', 8001);
INSERT INTO `sys_role_resource` VALUES ('03', 'admin', 8002);
INSERT INTO `sys_role_resource` VALUES ('03', 'admin', 9906);
INSERT INTO `sys_role_resource` VALUES ('03', 'admin', 9907);
INSERT INTO `sys_role_resource` VALUES ('04', '01', 30);
INSERT INTO `sys_role_resource` VALUES ('04', '01', 40);
INSERT INTO `sys_role_resource` VALUES ('04', '01', 50);
INSERT INTO `sys_role_resource` VALUES ('04', '01', 3001);
INSERT INTO `sys_role_resource` VALUES ('04', '01', 3002);
INSERT INTO `sys_role_resource` VALUES ('04', '01', 3003);
INSERT INTO `sys_role_resource` VALUES ('04', '01', 3004);
INSERT INTO `sys_role_resource` VALUES ('04', '01', 4001);
INSERT INTO `sys_role_resource` VALUES ('04', '01', 4002);
INSERT INTO `sys_role_resource` VALUES ('04', '01', 4003);
INSERT INTO `sys_role_resource` VALUES ('04', '01', 4004);
INSERT INTO `sys_role_resource` VALUES ('04', '01', 4005);
INSERT INTO `sys_role_resource` VALUES ('04', '01', 4006);
INSERT INTO `sys_role_resource` VALUES ('04', '01', 4007);
INSERT INTO `sys_role_resource` VALUES ('04', '01', 5001);
INSERT INTO `sys_role_resource` VALUES ('04', '01', 5002);
INSERT INTO `sys_role_resource` VALUES ('04', 'admin', 30);
INSERT INTO `sys_role_resource` VALUES ('04', 'admin', 40);
INSERT INTO `sys_role_resource` VALUES ('04', 'admin', 50);
INSERT INTO `sys_role_resource` VALUES ('04', 'admin', 3001);
INSERT INTO `sys_role_resource` VALUES ('04', 'admin', 3002);
INSERT INTO `sys_role_resource` VALUES ('04', 'admin', 3003);
INSERT INTO `sys_role_resource` VALUES ('04', 'admin', 3004);
INSERT INTO `sys_role_resource` VALUES ('04', 'admin', 4001);
INSERT INTO `sys_role_resource` VALUES ('04', 'admin', 4002);
INSERT INTO `sys_role_resource` VALUES ('04', 'admin', 4003);
INSERT INTO `sys_role_resource` VALUES ('04', 'admin', 4004);
INSERT INTO `sys_role_resource` VALUES ('04', 'admin', 4005);
INSERT INTO `sys_role_resource` VALUES ('04', 'admin', 4006);
INSERT INTO `sys_role_resource` VALUES ('04', 'admin', 4007);
INSERT INTO `sys_role_resource` VALUES ('04', 'admin', 4008);
INSERT INTO `sys_role_resource` VALUES ('04', 'admin', 5001);
INSERT INTO `sys_role_resource` VALUES ('04', 'admin', 5002);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `USER_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账号',
  `USER_PWD` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `USER_NAME` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `USER_PY` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '姓名拼音',
  `EMAIL` varchar(350) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `SEX` decimal(1, 0) NULL DEFAULT 0 COMMENT '性别 0：未知 1：男 2：女',
  `MOBILE_PHONE` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `STATE` decimal(3, 0) NOT NULL DEFAULT 0 COMMENT '状态 sys_code.code_type=1',
  `REMARKS` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `GMT_CREATE` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `GMT_UPDATE` datetime(0) NULL DEFAULT NULL COMMENT '密码更新时间',
  `GMT_LOGIN` datetime(0) NULL DEFAULT NULL COMMENT '最后登陆时间',
  `USER_ORG` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户所属机构 sys_user_org.code',
  PRIMARY KEY (`USER_ID`) USING BTREE,
  UNIQUE INDEX `PK_SYS_USER`(`USER_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('admin', 'VbMmP+CxFgR0xfVN1AaADQ==', 'admin', 'admin', NULL, 0, NULL, 0, NULL, '2020-04-14 02:43:34', '2020-04-14 02:43:34', NULL, '1-3-2');
INSERT INTO `sys_user` VALUES ('admin123', '034GF5sdziY5mdIL9jRUUA==', 'admin123', 'admin123', NULL, 0, NULL, 0, NULL, '2020-04-14 02:40:22', '2020-04-14 02:40:22', '2020-04-14 10:52:45', '1-3-2');
INSERT INTO `sys_user` VALUES ('daxidi', 'GIYLXtGzRJs+Nd9Qq4lDgQ==', '大溪地', 'dxd', NULL, 0, NULL, 0, NULL, '2018-05-10 00:00:00', '2018-05-10 00:00:00', '2018-08-31 00:00:00', '0201');
INSERT INTO `sys_user` VALUES ('yinhang', 'KZkGN1U1GufblakllfGd0g==', 'yinhang', 'yinhang', NULL, 0, NULL, 0, NULL, '2018-05-08 00:00:00', '2018-05-08 00:00:00', '2018-11-07 00:00:00', '010104');
INSERT INTO `sys_user` VALUES ('zyyh_ceshi', 'F/s1nrzV+MCtG7BcfqakdQ==', '测试', 'cs', NULL, 0, NULL, 0, NULL, '2017-12-06 00:00:00', '2018-03-19 00:00:00', '2018-10-23 00:00:00', '010107');
INSERT INTO `sys_user` VALUES ('zyyh_chenxi', 'To2i5s7i7rR622c4Idu8Ag==', '陈玺', 'cx', NULL, 0, '15393702660', 0, NULL, '2017-09-09 00:00:00', '2018-06-05 00:00:00', '2018-06-07 00:00:00', '010101');

-- ----------------------------
-- Table structure for sys_user_org
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_org`;
CREATE TABLE `sys_user_org`  (
  `CODE` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '代码',
  `PARENT` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '父级代码',
  `NAME` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '机构名称',
  `PHONE` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `BUSI_LICENSE` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '营业执照/组织机构代码/其他',
  `DELEGATE` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '法人代表',
  `REMARKS` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `LVL` decimal(3, 0) NOT NULL,
  `LFT` decimal(10, 0) NOT NULL,
  `RGT` decimal(10, 0) NOT NULL,
  `CERT_TYPE` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件类型sys_code.code_type=5 只取6：组织机构代码 7：营业执照 99：其他',
  `ADDRESS` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址',
  `DELEGATE_PHONE` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '法人电话',
  `REFERRED` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '简称',
  PRIMARY KEY (`CODE`) USING BTREE,
  UNIQUE INDEX `KEY_SYS_USER_ORG`(`CODE`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户机构表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_org
-- ----------------------------
INSERT INTO `sys_user_org` VALUES ('00', '0', '监管用户', NULL, NULL, NULL, NULL, 0, 1, 38, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_org` VALUES ('01', '0', '银行用户', NULL, NULL, NULL, NULL, 0, 39, 104, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_org` VALUES ('0101', '01', '中原银行股份有限公司', '85517932', '9141000031741675X6（1-2）', NULL, NULL, 1, 88, 103, '7', '河南省郑州市郑东新区CBD商务外环路23号中科金座大厦', NULL, '中原银行1');
INSERT INTO `sys_user_org` VALUES ('010101', '0101', '中原银行股份有限公司郑州农业路支行', '13523582716', '91410100556930377C(1-1)', NULL, NULL, 2, 101, 102, '7', '郑州市金水区农业路东41-3号', NULL, NULL);
INSERT INTO `sys_user_org` VALUES ('010102', '0101', '中原银行股份有限公司郑州建设路支行', '18037771726', '91410100MA3X6AA49P(1-1)', NULL, NULL, 2, 97, 98, '7', '郑州市中原区建设路与秦岭路交叉口荣成大厦', NULL, NULL);
INSERT INTO `sys_user_org` VALUES ('010103', '010101', '中原银行股份有限公司郑州金杯路支行', '65568385', '91410100MA3X6PMX3B(1-1)', NULL, NULL, 2, 95, 96, '7', '河南省郑州市惠济区金杯路与宏达街交叉口东南角', NULL, NULL);
INSERT INTO `sys_user_org` VALUES ('010104', '0101', '中原银行股份有限公司郑州分行', '18039675113', '91410100MA3X69ND28(1-1)', '高兴', NULL, 2, 93, 94, '7', '郑州市金水区金水路219号', '037165732233', NULL);
INSERT INTO `sys_user_org` VALUES ('010105', '0101', '中原银行股份有限公司郑州第八大街支行', '0371-65568594', '91410100MA40F4322X(1-1)', NULL, NULL, 2, 91, 92, '7', '河南省郑州经济技术开发区第八大街与经北一路东北角', NULL, NULL);
INSERT INTO `sys_user_org` VALUES ('010106', '0', '中原银行股份有限公司郑州象湖支行', NULL, '91410100MA40YW8910（1-1）', NULL, '王戍疆', 2, 99, 100, '7', NULL, NULL, NULL);
INSERT INTO `sys_user_org` VALUES ('010107', '0101', '长安国际信托股份有限公司', NULL, '916101312206074534', '高成程', NULL, 2, 89, 90, '7', '西安市高新区科技路33号高新国际商务中心23、24层', NULL, NULL);
INSERT INTO `sys_user_org` VALUES ('0102', '0', '中国邮政储蓄银行股份有限公司', NULL, '91410100670055350B', '吕周谦', NULL, 1, 82, 87, '7', NULL, NULL, 'mt2');
INSERT INTO `sys_user_org` VALUES ('010201', '0201', '中国邮政储蓄银行股份有限公司郑州市分行', NULL, '91410100670055350B', '吕周谦', NULL, 2, 85, 86, '7', '郑州市管城区紫荆山路61号', NULL, 'mt');
INSERT INTO `sys_user_org` VALUES ('010202', '0', '中国邮政储蓄银行股份有限公司郑州金水东路支行', NULL, '91410100551630666J', '李亚东', NULL, 2, 83, 84, '7', '河南省郑州市郑东新区金水东路10号院40号楼一层附2号', NULL, 'mt1');
INSERT INTO `sys_user_org` VALUES ('0103', '01', '中国民生银行股份有限公司郑州分行', NULL, '91410100675386052M', '王毅', NULL, 1, 80, 81, '6', '郑州市郑东新区CBD商务外环路1号民生银行大厦', NULL, NULL);
INSERT INTO `sys_user_org` VALUES ('0104', '0', '交通银行河南省分行', NULL, '914101009718599507（1一1）', '单增健', NULL, 1, 78, 79, '6', '郑州市金水区郑花路11号', NULL, NULL);
INSERT INTO `sys_user_org` VALUES ('0105', '0', '华夏银行股份有限公司郑州分行', NULL, '91410000594878354X', '程春涛', NULL, 1, 76, 77, '7', NULL, NULL, NULL);
INSERT INTO `sys_user_org` VALUES ('0106', '01', '中国建设银行股份有限公司河南省分行', NULL, '9141000086995250X4', '李尚荣', NULL, 1, 74, 75, '6', NULL, NULL, NULL);
INSERT INTO `sys_user_org` VALUES ('0107', '01', '中国工商银行股份有限公司河南省分行营业部', NULL, '91410100X14746495P(1-1)', '王晓东', NULL, 1, 72, 73, '7', '郑州市金水区花园路24号', NULL, NULL);
INSERT INTO `sys_user_org` VALUES ('0108', '01', '郑州金水厦农商村镇银行股份有限公司', NULL, '91410100MA3X5NNQ1N', '杜彪', NULL, 1, 70, 71, '7', '郑州市金水区花园路114号1层07号', NULL, NULL);
INSERT INTO `sys_user_org` VALUES ('0109', '01', '上海浦东发展银行股份有限公司郑州分行', NULL, '91410100727025903N(1-1)', '董琢理', NULL, 1, 68, 69, '7', '商务外环和东四街交叉口郑州市房管局二楼浦发银行抵押办公室', NULL, NULL);
INSERT INTO `sys_user_org` VALUES ('0110', '01', '中国银行股份有限公司', NULL, NULL, NULL, NULL, 1, 48, 67, '6', NULL, NULL, NULL);
INSERT INTO `sys_user_org` VALUES ('011001', '1001', '中国银行股份有限公司郑州自贸区分行', NULL, '9141010087004279X9', '王小军', NULL, 2, 65, 66, '7', NULL, NULL, NULL);
INSERT INTO `sys_user_org` VALUES ('011002', '1001', '中国银行股份有限公司郑州陇西支行', NULL, '91410100870042829R', '任立谦', NULL, 2, 63, 64, '7', NULL, NULL, NULL);
INSERT INTO `sys_user_org` VALUES ('011003', '1001', '中国银行股份有限公司郑州高新技术开发区支行', NULL, '91410100X14707314Y（1-1）', '李自玉', NULL, 2, 61, 62, '7', NULL, NULL, NULL);
INSERT INTO `sys_user_org` VALUES ('011004', '1001', '中国银行股份有限公司郑州文化支行', NULL, '91410100721804850M', '郜瑞峰', NULL, 2, 59, 60, '7', NULL, NULL, NULL);
INSERT INTO `sys_user_org` VALUES ('011005', '1001', '中国银行股份有限公司郑州商品交易所支行', NULL, '91410100721828553A', '朱桐新', NULL, 2, 57, 58, '7', NULL, NULL, NULL);
INSERT INTO `sys_user_org` VALUES ('011006', '1001', '中国银行股份有限公司郑州金水支行', NULL, '914101009718464472', '李红杰', NULL, 2, 55, 56, '7', NULL, NULL, NULL);
INSERT INTO `sys_user_org` VALUES ('011007', '1001', '中国银行股份有限公司郑州航空港分行', NULL, '91410100739061274R', '田阳春', NULL, 2, 53, 54, '7', NULL, NULL, NULL);
INSERT INTO `sys_user_org` VALUES ('011008', '1001', '中国银行股份有限公司河南省分行', NULL, '91410000869953094T(1-1)', '何方恩', NULL, 2, 51, 52, '7', NULL, NULL, NULL);
INSERT INTO `sys_user_org` VALUES ('011009', '1001', '中国银行股份有限公司郑州花园支行', NULL, '91410100719167135W', '刘宝琴', NULL, 2, 49, 50, '7', NULL, NULL, NULL);
INSERT INTO `sys_user_org` VALUES ('0111', '01', '郑州住房置业担保有限责任公司', NULL, '91410100727019618B', '刘继军', NULL, 1, 46, 47, '7', '郑州市建设西路188号（房地产大厦4楼）', NULL, NULL);
INSERT INTO `sys_user_org` VALUES ('0112', '01', '广发银行股份有限公司郑州分行', NULL, '91410100869971321H（1-1）', '高奇志', NULL, 1, 42, 45, '7', NULL, NULL, NULL);
INSERT INTO `sys_user_org` VALUES ('011201', '0112', '广发银行股份有限公司郑州商都支行', NULL, '91410100577638965K(1-1)', '韩保林', NULL, 2, 43, 44, '7', '郑州市郑东新区商都路31号3号楼1-12层', NULL, NULL);
INSERT INTO `sys_user_org` VALUES ('0113', '01', '郑州市市郊农村信用合作联社', '18339960666', '914101007991791519', '董金泉', NULL, 1, 40, 41, '7', NULL, NULL, '11');
INSERT INTO `sys_user_org` VALUES ('02', '0', '开发商用户', NULL, NULL, NULL, NULL, 0, 105, 148, '6', NULL, NULL, NULL);
INSERT INTO `sys_user_org` VALUES ('0201', '02', '郑州玉安联合置业有限公司', NULL, '91410100569808290P', '高国安', NULL, 1, 146, 147, '7', '郑州市二七区马寨镇东方路6号马寨产业聚集区管委会办公用房3号楼2层201,202,203', NULL, NULL);
INSERT INTO `sys_user_org` VALUES ('02011', '02', '郑州华图利合实业发展有限责任公司', '13393568403', '914101007440978617', NULL, NULL, 1, 142, 143, '6', NULL, NULL, NULL);
INSERT INTO `sys_user_org` VALUES ('020112', '02', '河南天海置业有限公司', NULL, '91410100568637346F', NULL, NULL, 1, 140, 141, '7', NULL, NULL, NULL);
INSERT INTO `sys_user_org` VALUES ('0202', '02', '河南亚星置业集团有限公司', NULL, '914101067126274937', '高国安', NULL, 1, 136, 139, '7', '郑州市上街区许昌路西段', NULL, NULL);
INSERT INTO `sys_user_org` VALUES ('020201', '0102', '郑州创富房地产开发有限公司', NULL, '91410100719147003E(1-1)', '高国安', NULL, 2, 137, 138, '7', '郑州市二七区长江路南、嵩山路西亚星盛世星尚中心1号楼26层', NULL, NULL);
INSERT INTO `sys_user_org` VALUES ('02021', '02', '河南建业泰宏置业有限公司', '13137146168', '914101006728547030', NULL, NULL, 1, 118, 119, '7', NULL, NULL, NULL);
INSERT INTO `sys_user_org` VALUES ('0203', '02', '河南绿地陆港置业有限公司', NULL, '914101003302043218', '方东兴', NULL, 1, 134, 135, '7', '郑州经济技术开发区第八大街和经南二路交叉口创业园孵化基地3楼367号', NULL, NULL);
INSERT INTO `sys_user_org` VALUES ('0204', '02', '郑州清华大溪地置业有限公司', NULL, '9141018256980883X6', '李轩', NULL, 1, 132, 133, '7', '荥阳市郑上路与商隐路交叉口西南侧市民广场文化庭院（四合院）1号楼', NULL, NULL);
INSERT INTO `sys_user_org` VALUES ('0205', '02', '河南新田置业有限公司', NULL, '910101002717356746', '田中飞', NULL, 1, 130, 131, '7', '郑州市金水区黄河路95号', NULL, NULL);
INSERT INTO `sys_user_org` VALUES ('0206', '02', '郑州瀚宇置业有限公司', NULL, '910101820675534008', '杨宝宏', NULL, 1, 128, 129, '7', '荥阳市郑上路与滨河路交叉口向南300米瀚宇天悦湾', NULL, NULL);
INSERT INTO `sys_user_org` VALUES ('0207', '02', '河南吉地置业有限公司', '037163296967', '914101007583708654（1-1）', '安东方', NULL, 1, 126, 127, '7', '郑州市郑东新区郑开大道19号13楼1301、1308', NULL, NULL);
INSERT INTO `sys_user_org` VALUES ('0208', '02', '郑州新顺意置业有限公司', '13592531551', '914101007522826530', '苏玉斌', NULL, 1, 114, 115, '6', NULL, NULL, NULL);
INSERT INTO `sys_user_org` VALUES ('020801', '02', '河南正弘实业有限公司', '13673603981', '91410101000508890042', '李向清', NULL, 1, 124, 125, '7', NULL, NULL, NULL);
INSERT INTO `sys_user_org` VALUES ('0209', '02', '郑州万翔房地产开发有限公司', '13460315792', '91410122775137870H', '胡淑杰', NULL, 1, 122, 123, '7', NULL, NULL, NULL);
INSERT INTO `sys_user_org` VALUES ('0210', '02', '河南省顺泰达置业有限公司', '13523429278', '91410122661898380P', '张玉笋', NULL, 1, 120, 121, '6', NULL, NULL, NULL);
INSERT INTO `sys_user_org` VALUES ('0211', '02', '郑州杰人置业有限公司', '0371-56573791', '91410100678063515W', '周亮', NULL, 1, 112, 113, '7', NULL, NULL, NULL);
INSERT INTO `sys_user_org` VALUES ('0212', '02', '河南省锦美置业有限公司', '65727999', '91410100070092692U', '唐浩浩', NULL, 1, 116, 117, '7', NULL, NULL, NULL);
INSERT INTO `sys_user_org` VALUES ('0221', '02', '郑州雅居乐房地产开发有限公司', '13133336666', '94152658956256298K', NULL, NULL, 1, 110, 111, '7', NULL, NULL, NULL);
INSERT INTO `sys_user_org` VALUES ('0222', '02', '河南裕鸿置业有限公司', '18508886666', '9415282828098K', NULL, NULL, 1, 108, 109, '7', NULL, NULL, NULL);
INSERT INTO `sys_user_org` VALUES ('0223', '02', '河南鑫苑顺晟置业有限公司', '65291155', '91410100MA3X6JLY95', NULL, NULL, 1, 106, 107, '7', NULL, NULL, NULL);
INSERT INTO `sys_user_org` VALUES ('1-12', '00', '新郑', NULL, NULL, NULL, NULL, 1, 28, 29, '6', NULL, NULL, NULL);
INSERT INTO `sys_user_org` VALUES ('1-13', '00', '登封', NULL, NULL, NULL, NULL, 1, 34, 35, '6', NULL, NULL, NULL);
INSERT INTO `sys_user_org` VALUES ('1-14', '00', '中牟', NULL, NULL, NULL, NULL, 1, 26, 27, '6', NULL, NULL, NULL);
INSERT INTO `sys_user_org` VALUES ('1-15', '00', '荥阳', NULL, NULL, NULL, NULL, 1, 30, 31, '6', NULL, NULL, NULL);
INSERT INTO `sys_user_org` VALUES ('1-16', '00', '上街', NULL, NULL, NULL, NULL, 1, 32, 33, '6', NULL, NULL, NULL);
INSERT INTO `sys_user_org` VALUES ('1-17', '00', '新密', NULL, NULL, NULL, NULL, 1, 4, 5, '6', NULL, NULL, NULL);
INSERT INTO `sys_user_org` VALUES ('1-18', '00', '航空港区', NULL, NULL, NULL, NULL, 1, 36, 37, '6', NULL, NULL, NULL);
INSERT INTO `sys_user_org` VALUES ('1-19', '00', '托管区', NULL, NULL, NULL, NULL, 1, 2, 3, '6', NULL, NULL, NULL);
INSERT INTO `sys_user_org` VALUES ('1-3', '00', '市局', NULL, NULL, NULL, NULL, 1, 6, 25, '6', NULL, NULL, NULL);
INSERT INTO `sys_user_org` VALUES ('1-3-10', '1-3', '郑东新区', NULL, NULL, NULL, NULL, 2, 9, 10, '6', NULL, NULL, NULL);
INSERT INTO `sys_user_org` VALUES ('1-3-11', '1-3', '高新', NULL, NULL, NULL, NULL, 2, 11, 12, '6', NULL, NULL, NULL);
INSERT INTO `sys_user_org` VALUES ('1-3-2', '1-3', '市中心', NULL, NULL, NULL, NULL, 2, 7, 8, '6', NULL, NULL, NULL);
INSERT INTO `sys_user_org` VALUES ('1-3-4', '1-3', '二七', NULL, NULL, NULL, NULL, 2, 21, 22, '6', NULL, NULL, NULL);
INSERT INTO `sys_user_org` VALUES ('1-3-5', '1-3', '金水', NULL, NULL, NULL, NULL, 2, 19, 20, '6', NULL, NULL, NULL);
INSERT INTO `sys_user_org` VALUES ('1-3-6', '1-3', '中原', NULL, NULL, NULL, NULL, 2, 17, 18, '6', NULL, NULL, NULL);
INSERT INTO `sys_user_org` VALUES ('1-3-7', '1-3', '管城', NULL, NULL, NULL, NULL, 2, 23, 24, '6', NULL, NULL, NULL);
INSERT INTO `sys_user_org` VALUES ('1-3-8', '1-3', '惠济', NULL, NULL, NULL, NULL, 2, 15, 16, '6', NULL, NULL, NULL);
INSERT INTO `sys_user_org` VALUES ('1-3-9', '1-3', '经开', NULL, NULL, NULL, NULL, 2, 13, 14, '6', NULL, NULL, NULL);
INSERT INTO `sys_user_org` VALUES ('124128284189800000', '02', 'lguser', NULL, '124128284189800000', 'lguser', NULL, 2, 144, 145, '6', NULL, '18538556338', NULL);

-- ----------------------------
-- Table structure for sys_user_org_bak
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_org_bak`;
CREATE TABLE `sys_user_org_bak`  (
  `USER_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ROLE_ID` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_org_bak
-- ----------------------------
INSERT INTO `sys_user_org_bak` VALUES ('admin', '01');
INSERT INTO `sys_user_org_bak` VALUES ('admin', 'admin');
INSERT INTO `sys_user_org_bak` VALUES ('caxt_yueyang', '01');
INSERT INTO `sys_user_org_bak` VALUES ('csyh_haha', '01');
INSERT INTO `sys_user_org_bak` VALUES ('devetest', '02');
INSERT INTO `sys_user_org_bak` VALUES ('gjj_jianghongli', '01');
INSERT INTO `sys_user_org_bak` VALUES ('gjj_renzhe', '01');
INSERT INTO `sys_user_org_bak` VALUES ('gsyh_cuiyingying', '01');
INSERT INTO `sys_user_org_bak` VALUES ('gsyh_fenghuanhuan', '01');
INSERT INTO `sys_user_org_bak` VALUES ('gsyh_liubing', '01');
INSERT INTO `sys_user_org_bak` VALUES ('gsyh_zhaowanjuan', '01');
INSERT INTO `sys_user_org_bak` VALUES ('hxyh_chenzenan', '01');
INSERT INTO `sys_user_org_bak` VALUES ('jsyh_jiaomingrui', '01');
INSERT INTO `sys_user_org_bak` VALUES ('jsyh_wanghaikui', '01');
INSERT INTO `sys_user_org_bak` VALUES ('jsyh_zhangxiaohui', '01');
INSERT INTO `sys_user_org_bak` VALUES ('jtyh_dupeng', '01');
INSERT INTO `sys_user_org_bak` VALUES ('jtyh_houqiyong', '01');
INSERT INTO `sys_user_org_bak` VALUES ('msyh_laidawei', '01');
INSERT INTO `sys_user_org_bak` VALUES ('msyh_lidongping', '01');
INSERT INTO `sys_user_org_bak` VALUES ('pfyh_liyan', '01');
INSERT INTO `sys_user_org_bak` VALUES ('xns_songke', '01');
INSERT INTO `sys_user_org_bak` VALUES ('ycyh_mabaocheng', '01');
INSERT INTO `sys_user_org_bak` VALUES ('ycyh_songkai', '01');
INSERT INTO `sys_user_org_bak` VALUES ('ycyh_wanglindong', '01');
INSERT INTO `sys_user_org_bak` VALUES ('ycyh_zhaolujun', '01');
INSERT INTO `sys_user_org_bak` VALUES ('zgyh_hetaizhou', '01');
INSERT INTO `sys_user_org_bak` VALUES ('zgyh_shaoxin', '01');
INSERT INTO `sys_user_org_bak` VALUES ('zgyh_sunlu', '01');
INSERT INTO `sys_user_org_bak` VALUES ('zgyh_wangfei', '01');
INSERT INTO `sys_user_org_bak` VALUES ('zgyh_weizhongyuan', '01');
INSERT INTO `sys_user_org_bak` VALUES ('zgyh_wudi', '01');
INSERT INTO `sys_user_org_bak` VALUES ('zgyh_yangxingru', '01');
INSERT INTO `sys_user_org_bak` VALUES ('zgyh_yaozhenjiang', '01');
INSERT INTO `sys_user_org_bak` VALUES ('zgyh_zhangyawei', '01');
INSERT INTO `sys_user_org_bak` VALUES ('zyyh_ceshi', '01');
INSERT INTO `sys_user_org_bak` VALUES ('zyyh_chenli', '01');
INSERT INTO `sys_user_org_bak` VALUES ('zyyh_chenxi', '01');
INSERT INTO `sys_user_org_bak` VALUES ('zyyh_chenyingying', '01');
INSERT INTO `sys_user_org_bak` VALUES ('zyyh_liurui', '01');
INSERT INTO `sys_user_org_bak` VALUES ('zyyh_lixiyang', '01');
INSERT INTO `sys_user_org_bak` VALUES ('zyyh_wangjingyu', '01');
INSERT INTO `sys_user_org_bak` VALUES ('zyyh_yangzi', '01');
INSERT INTO `sys_user_org_bak` VALUES ('zyyh_zhangaiyun', '01');
INSERT INTO `sys_user_org_bak` VALUES ('zyyh_zhangqi', '01');
INSERT INTO `sys_user_org_bak` VALUES ('zyyh_zhangyongqiang', '01');
INSERT INTO `sys_user_org_bak` VALUES ('zyyh_zhangziyi', '01');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `SYS_ID` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `USER_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ROLE_ID` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`SYS_ID`, `USER_ID`, `ROLE_ID`) USING BTREE,
  UNIQUE INDEX `PK_SYS_USER_ROLE`(`SYS_ID`, `USER_ID`, `ROLE_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('00', 'admin', 'admin');
INSERT INTO `sys_user_role` VALUES ('00', 'admin123', 'admin');
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

SET FOREIGN_KEY_CHECKS = 1;
