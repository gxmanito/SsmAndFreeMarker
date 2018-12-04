/*
Navicat MySQL Data Transfer

Source Server         : 102
Source Server Version : 80012
Source Host           : localhost:3306
Source Database       : gx-admin

Target Server Type    : MYSQL
Target Server Version : 80012
File Encoding         : 65001

Date: 2018-11-08 16:46:31
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_code
-- ----------------------------
DROP TABLE IF EXISTS `sys_code`;
CREATE TABLE `sys_code` (
  `CODE_TYPE` decimal(5,0) NOT NULL COMMENT '代码类型',
  `TYPE_NAME` varchar(30) DEFAULT NULL COMMENT '类型名称',
  `CODE` varchar(10) NOT NULL COMMENT '代码',
  `NAME` varchar(100) DEFAULT NULL COMMENT '名称',
  `REMARKS` varchar(250) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`CODE_TYPE`,`CODE`),
  UNIQUE KEY `PK_SYS_CODE` (`CODE_TYPE`,`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='代码字典表';

-- ----------------------------
-- Records of sys_code
-- ----------------------------
INSERT INTO `sys_code` VALUES ('0', '性别', '0', '未知', null);
INSERT INTO `sys_code` VALUES ('0', '性别', '1', '男性', null);
INSERT INTO `sys_code` VALUES ('0', '性别', '2', '女性', null);
INSERT INTO `sys_code` VALUES ('1', '用户状态', '0', '正常', null);
INSERT INTO `sys_code` VALUES ('1', '用户状态', '1', '失效', null);
INSERT INTO `sys_code` VALUES ('1', '用户状态', '2', '锁定', null);
INSERT INTO `sys_code` VALUES ('1', '用户状态', '3', '禁用', null);
INSERT INTO `sys_code` VALUES ('2', '资源类型', '0', '目录', null);
INSERT INTO `sys_code` VALUES ('2', '资源类型', '1', '菜单', null);
INSERT INTO `sys_code` VALUES ('2', '资源类型', '2', '功能', null);
INSERT INTO `sys_code` VALUES ('3', '资源状态', '0', '正常', null);
INSERT INTO `sys_code` VALUES ('3', '资源状态', '1', '失效', null);
INSERT INTO `sys_code` VALUES ('4', '权利人类型', '1', '个人', null);
INSERT INTO `sys_code` VALUES ('4', '权利人类型', '2', '企业', null);
INSERT INTO `sys_code` VALUES ('4', '权利人类型', '3', '事业单位', null);
INSERT INTO `sys_code` VALUES ('4', '权利人类型', '4', '国家机关', null);
INSERT INTO `sys_code` VALUES ('4', '权利人类型', '99', '其他', null);
INSERT INTO `sys_code` VALUES ('5', '证件种类', '1', '身份证', null);
INSERT INTO `sys_code` VALUES ('5', '证件种类', '2', '港澳通行证（台湾居民来往大陆通行证）', null);
INSERT INTO `sys_code` VALUES ('5', '证件种类', '3', '护照', null);
INSERT INTO `sys_code` VALUES ('5', '证件种类', '4', '户口簿', null);
INSERT INTO `sys_code` VALUES ('5', '证件种类', '5', '军官证（士兵证）', null);
INSERT INTO `sys_code` VALUES ('5', '证件种类', '6', '组织机构代码', null);
INSERT INTO `sys_code` VALUES ('5', '证件种类', '7', '营业执照', null);
INSERT INTO `sys_code` VALUES ('5', '证件种类', '99', '其他', null);
INSERT INTO `sys_code` VALUES ('6', '共有方式', '0', '单独所有', null);
INSERT INTO `sys_code` VALUES ('6', '共有方式', '1', '共同共有', null);
INSERT INTO `sys_code` VALUES ('6', '共有方式', '2', '按份共有', '填写占有比例');
INSERT INTO `sys_code` VALUES ('6', '共有方式', '3', '其他共有', null);
INSERT INTO `sys_code` VALUES ('7', '受理状态', '0', '待受理', null);
INSERT INTO `sys_code` VALUES ('7', '受理状态', '1', '已受理', null);
INSERT INTO `sys_code` VALUES ('7', '受理状态', '3', '不予受理', null);
INSERT INTO `sys_code` VALUES ('8', '登记类型', '0101', '房地首次登记', null);
INSERT INTO `sys_code` VALUES ('8', '登记类型', '0102', '房地转移登记', null);
INSERT INTO `sys_code` VALUES ('8', '登记类型', '0201', '抵押设立登记', null);
INSERT INTO `sys_code` VALUES ('8', '登记类型', '0204', '抵押注销登记', null);
INSERT INTO `sys_code` VALUES ('8', '登记类型', '0221', '联合抵押登记', null);
INSERT INTO `sys_code` VALUES ('8', '登记类型', '0303', '预售商品房买卖预告登记', null);
INSERT INTO `sys_code` VALUES ('8', '登记类型', '0304', '预购商品房抵押权预告登记', null);
INSERT INTO `sys_code` VALUES ('8', '登记类型', '0305', '预告注销登记', null);
INSERT INTO `sys_code` VALUES ('9', '地类代码', '01', '耕地', null);
INSERT INTO `sys_code` VALUES ('9', '地类代码', '011', '水田', null);
INSERT INTO `sys_code` VALUES ('9', '地类代码', '013', '旱地', null);
INSERT INTO `sys_code` VALUES ('9', '地类代码', '02', '园地', null);
INSERT INTO `sys_code` VALUES ('9', '地类代码', '021', '果园', null);
INSERT INTO `sys_code` VALUES ('9', '地类代码', '023', '其他园地', null);
INSERT INTO `sys_code` VALUES ('9', '地类代码', '03', '林地', null);
INSERT INTO `sys_code` VALUES ('9', '地类代码', '031', '有林地', null);
INSERT INTO `sys_code` VALUES ('9', '地类代码', '05', '商服用地', null);
INSERT INTO `sys_code` VALUES ('9', '地类代码', '051', '批发零售用地', null);
INSERT INTO `sys_code` VALUES ('9', '地类代码', '052', '住宿餐饮用地', null);
INSERT INTO `sys_code` VALUES ('9', '地类代码', '053', '商务金融用地', null);
INSERT INTO `sys_code` VALUES ('9', '地类代码', '054', '其它商服用地', null);
INSERT INTO `sys_code` VALUES ('9', '地类代码', '06', '工矿仓储用地', null);
INSERT INTO `sys_code` VALUES ('9', '地类代码', '061', '工业用地', null);
INSERT INTO `sys_code` VALUES ('9', '地类代码', '063', '仓储用地', null);
INSERT INTO `sys_code` VALUES ('9', '地类代码', '07', '住宅用地', null);
INSERT INTO `sys_code` VALUES ('9', '地类代码', '071', '城镇住宅用地', null);
INSERT INTO `sys_code` VALUES ('9', '地类代码', '072', '农村宅基地', null);
INSERT INTO `sys_code` VALUES ('9', '地类代码', '08', '公共管理与公共服务用地', null);
INSERT INTO `sys_code` VALUES ('9', '地类代码', '081', '机关团体用地', null);
INSERT INTO `sys_code` VALUES ('9', '地类代码', '082', '新闻出版用地', null);
INSERT INTO `sys_code` VALUES ('9', '地类代码', '083', '科教用地', null);
INSERT INTO `sys_code` VALUES ('9', '地类代码', '084', '医卫慈善用地', null);
INSERT INTO `sys_code` VALUES ('9', '地类代码', '085', '文体娱乐用地', null);
INSERT INTO `sys_code` VALUES ('9', '地类代码', '086', '公共设施用地', null);
INSERT INTO `sys_code` VALUES ('9', '地类代码', '087', '公园与绿地', null);
INSERT INTO `sys_code` VALUES ('9', '地类代码', '088', '风景名胜设施用地', null);
INSERT INTO `sys_code` VALUES ('9', '地类代码', '09', '特殊用地', null);
INSERT INTO `sys_code` VALUES ('9', '地类代码', '091', '军事设施用地', null);
INSERT INTO `sys_code` VALUES ('9', '地类代码', '093', '监教场所用地', null);
INSERT INTO `sys_code` VALUES ('9', '地类代码', '094', '宗教用地', null);
INSERT INTO `sys_code` VALUES ('9', '地类代码', '095', '殡葬用地', null);
INSERT INTO `sys_code` VALUES ('9', '地类代码', '10', '交通运输用地', null);
INSERT INTO `sys_code` VALUES ('9', '地类代码', '101', '铁路用地', null);
INSERT INTO `sys_code` VALUES ('9', '地类代码', '102', '公路用地', null);
INSERT INTO `sys_code` VALUES ('9', '地类代码', '103', '街巷用地', null);
INSERT INTO `sys_code` VALUES ('9', '地类代码', '105', '机场用地', null);
INSERT INTO `sys_code` VALUES ('9', '地类代码', '107', '管道运输用地', null);
INSERT INTO `sys_code` VALUES ('9', '地类代码', '11', '水域及水利设施用地', null);
INSERT INTO `sys_code` VALUES ('9', '地类代码', '113', '水库水面', null);
INSERT INTO `sys_code` VALUES ('9', '地类代码', '114', '坑塘水面', null);
INSERT INTO `sys_code` VALUES ('9', '地类代码', '117', '沟渠', null);
INSERT INTO `sys_code` VALUES ('9', '地类代码', '118', '水工建筑用地', null);
INSERT INTO `sys_code` VALUES ('9', '地类代码', '119', '冰川及永久积雪', null);
INSERT INTO `sys_code` VALUES ('9', '地类代码', '12', '其它土地', null);
INSERT INTO `sys_code` VALUES ('9', '地类代码', '122', '设施农用地', null);
INSERT INTO `sys_code` VALUES ('9', '地类代码', '205', '风景名胜及特殊用地', null);
INSERT INTO `sys_code` VALUES ('9', '地类代码', '302', '建设用地', null);
INSERT INTO `sys_code` VALUES ('10', '产权来源', '1', '存量房因继承（受遗赠）转移登记', null);
INSERT INTO `sys_code` VALUES ('10', '产权来源', '11', '因企业破产兼并、合并的转移登记', null);
INSERT INTO `sys_code` VALUES ('10', '产权来源', '12', '因单位优惠出售公有住房的转移登记', null);
INSERT INTO `sys_code` VALUES ('10', '产权来源', '13', '因法院判决（协助执行）的转移登记', null);
INSERT INTO `sys_code` VALUES ('10', '产权来源', '14', '因房改房收回的转移登记', null);
INSERT INTO `sys_code` VALUES ('10', '产权来源', '15', '因司法拍卖房屋的转移登记', null);
INSERT INTO `sys_code` VALUES ('10', '产权来源', '16', '因国有、集体企业改制的转移登记', null);
INSERT INTO `sys_code` VALUES ('10', '产权来源', '17', '非住宅类房屋因同一所有权人分割、合并的转移登记', null);
INSERT INTO `sys_code` VALUES ('10', '产权来源', '2', '因夫妻离婚析产的转移登记', null);
INSERT INTO `sys_code` VALUES ('10', '产权来源', '20', '因征收、拆迁安置的转移登记', null);
INSERT INTO `sys_code` VALUES ('10', '产权来源', '21', '因开发建设单位出售商品房（含经济适用房）的转移登记', null);
INSERT INTO `sys_code` VALUES ('10', '产权来源', '22', '因委托拍卖机构拍卖房屋的转移登记', null);
INSERT INTO `sys_code` VALUES ('10', '产权来源', '23', '因房改房产权比例变更的转移登记', null);
INSERT INTO `sys_code` VALUES ('10', '产权来源', '24', '因有权机关没收、罚没后拍卖取得的转移登记', null);
INSERT INTO `sys_code` VALUES ('10', '产权来源', '3', '因私有房屋交易的转移登记', null);
INSERT INTO `sys_code` VALUES ('10', '产权来源', '4', '夫妻关系存续期间私有房屋因增加共有人（婚前财产）的转移登记', null);
INSERT INTO `sys_code` VALUES ('10', '产权来源', '6', '因委托拍卖机构拍卖房屋的转移登记', null);
INSERT INTO `sys_code` VALUES ('10', '产权来源', '8', '因单位房屋转让的转移登记', null);
INSERT INTO `sys_code` VALUES ('10', '产权来源', '9', '因以房产作价入股的转移登记', null);
INSERT INTO `sys_code` VALUES ('11', '个人报卷转移登记办理网点', '1-3-10', '郑东', null);
INSERT INTO `sys_code` VALUES ('11', '个人报卷转移登记办理网点', '1-3-11', '高新', null);
INSERT INTO `sys_code` VALUES ('11', '个人报卷转移登记办理网点', '1-3-4', '二七', null);
INSERT INTO `sys_code` VALUES ('11', '个人报卷转移登记办理网点', '1-3-5', '金水', null);
INSERT INTO `sys_code` VALUES ('11', '个人报卷转移登记办理网点', '1-3-6', '中原', null);
INSERT INTO `sys_code` VALUES ('11', '个人报卷转移登记办理网点', '1-3-7', '管城', null);
INSERT INTO `sys_code` VALUES ('11', '个人报卷转移登记办理网点', '1-3-8', '惠济', null);
INSERT INTO `sys_code` VALUES ('11', '个人报卷转移登记办理网点', '1-3-9', '经开', null);
INSERT INTO `sys_code` VALUES ('12', '个人报卷转移登记办理网点', '1-17', '新密', null);
INSERT INTO `sys_code` VALUES ('13', '个人报卷转移登记办理网点', '1-14', '中牟', null);
INSERT INTO `sys_code` VALUES ('14', '个人报卷转移登记办理网点', '1-13', '登封', null);
INSERT INTO `sys_code` VALUES ('15', '个人报卷转移登记办理网点', '1-18', '航空港区', null);
