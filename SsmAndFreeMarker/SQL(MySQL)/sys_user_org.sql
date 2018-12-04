/*
Navicat MySQL Data Transfer

Source Server         : 102
Source Server Version : 80012
Source Host           : localhost:3306
Source Database       : gx-admin

Target Server Type    : MYSQL
Target Server Version : 80012
File Encoding         : 65001

Date: 2018-11-08 16:47:14
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_user_org
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_org`;
CREATE TABLE `sys_user_org` (
  `CODE` varchar(50) NOT NULL COMMENT '代码',
  `PARENT` varchar(10) NOT NULL COMMENT '父级代码',
  `NAME` varchar(1000) NOT NULL COMMENT '机构名称',
  `PHONE` varchar(20) DEFAULT NULL COMMENT '联系电话',
  `BUSI_LICENSE` varchar(500) DEFAULT NULL COMMENT '营业执照/组织机构代码/其他',
  `DELEGATE` varchar(250) DEFAULT NULL COMMENT '法人代表',
  `REMARKS` varchar(250) DEFAULT NULL COMMENT '备注',
  `LVL` decimal(3,0) NOT NULL,
  `LFT` decimal(10,0) NOT NULL,
  `RGT` decimal(10,0) NOT NULL,
  `CERT_TYPE` varchar(2) DEFAULT NULL COMMENT '证件类型sys_code.code_type=5 只取6：组织机构代码 7：营业执照 99：其他',
  `ADDRESS` varchar(1000) DEFAULT NULL COMMENT '联系地址',
  `DELEGATE_PHONE` varchar(20) DEFAULT NULL COMMENT '法人电话',
  `REFERRED` varchar(20) DEFAULT NULL COMMENT '简称',
  PRIMARY KEY (`CODE`),
  UNIQUE KEY `KEY_SYS_USER_ORG` (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户机构表';

-- ----------------------------
-- Records of sys_user_org
-- ----------------------------
INSERT INTO `sys_user_org` VALUES ('00', '0', '监管用户', null, null, null, null, '0', '1', '38', null, null, null, null);
INSERT INTO `sys_user_org` VALUES ('01', '0', '银行用户', null, null, null, null, '0', '39', '104', null, null, null, null);
INSERT INTO `sys_user_org` VALUES ('0101', '01', '中原银行股份有限公司', '85517932', '9141000031741675X6（1-2）', null, null, '1', '88', '103', '7', '河南省郑州市郑东新区CBD商务外环路23号中科金座大厦', null, '中原银行1');
INSERT INTO `sys_user_org` VALUES ('010101', '0101', '中原银行股份有限公司郑州农业路支行', '13523582716', '91410100556930377C(1-1)', null, null, '2', '101', '102', '7', '郑州市金水区农业路东41-3号', null, null);
INSERT INTO `sys_user_org` VALUES ('010102', '0101', '中原银行股份有限公司郑州建设路支行', '18037771726', '91410100MA3X6AA49P(1-1)', null, null, '2', '97', '98', '7', '郑州市中原区建设路与秦岭路交叉口荣成大厦', null, null);
INSERT INTO `sys_user_org` VALUES ('010103', '010101', '中原银行股份有限公司郑州金杯路支行', '65568385', '91410100MA3X6PMX3B(1-1)', null, null, '2', '95', '96', '7', '河南省郑州市惠济区金杯路与宏达街交叉口东南角', null, null);
INSERT INTO `sys_user_org` VALUES ('010104', '0101', '中原银行股份有限公司郑州分行', '18039675113', '91410100MA3X69ND28(1-1)', '高兴', null, '2', '93', '94', '7', '郑州市金水区金水路219号', '037165732233', null);
INSERT INTO `sys_user_org` VALUES ('010105', '0101', '中原银行股份有限公司郑州第八大街支行', '0371-65568594', '91410100MA40F4322X(1-1)', null, null, '2', '91', '92', '7', '河南省郑州经济技术开发区第八大街与经北一路东北角', null, null);
INSERT INTO `sys_user_org` VALUES ('010106', '0', '中原银行股份有限公司郑州象湖支行', null, '91410100MA40YW8910（1-1）', null, '王戍疆', '2', '99', '100', '7', null, null, null);
INSERT INTO `sys_user_org` VALUES ('010107', '0101', '长安国际信托股份有限公司', null, '916101312206074534', '高成程', null, '2', '89', '90', '7', '西安市高新区科技路33号高新国际商务中心23、24层', null, null);
INSERT INTO `sys_user_org` VALUES ('0102', '0', '中国邮政储蓄银行股份有限公司', null, '91410100670055350B', '吕周谦', null, '1', '82', '87', '7', null, null, 'mt2');
INSERT INTO `sys_user_org` VALUES ('010201', '0201', '中国邮政储蓄银行股份有限公司郑州市分行', null, '91410100670055350B', '吕周谦', null, '2', '85', '86', '7', '郑州市管城区紫荆山路61号', null, 'mt');
INSERT INTO `sys_user_org` VALUES ('010202', '0', '中国邮政储蓄银行股份有限公司郑州金水东路支行', null, '91410100551630666J', '李亚东', null, '2', '83', '84', '7', '河南省郑州市郑东新区金水东路10号院40号楼一层附2号', null, 'mt1');
INSERT INTO `sys_user_org` VALUES ('0103', '01', '中国民生银行股份有限公司郑州分行', null, '91410100675386052M', '王毅', null, '1', '80', '81', '6', '郑州市郑东新区CBD商务外环路1号民生银行大厦', null, null);
INSERT INTO `sys_user_org` VALUES ('0104', '0', '交通银行河南省分行', null, '914101009718599507（1一1）', '单增健', null, '1', '78', '79', '6', '郑州市金水区郑花路11号', null, null);
INSERT INTO `sys_user_org` VALUES ('0105', '0', '华夏银行股份有限公司郑州分行', null, '91410000594878354X', '程春涛', null, '1', '76', '77', '7', null, null, null);
INSERT INTO `sys_user_org` VALUES ('0106', '01', '中国建设银行股份有限公司河南省分行', null, '9141000086995250X4', '李尚荣', null, '1', '74', '75', '6', null, null, null);
INSERT INTO `sys_user_org` VALUES ('0107', '01', '中国工商银行股份有限公司河南省分行营业部', null, '91410100X14746495P(1-1)', '王晓东', null, '1', '72', '73', '7', '郑州市金水区花园路24号', null, null);
INSERT INTO `sys_user_org` VALUES ('0108', '01', '郑州金水厦农商村镇银行股份有限公司', null, '91410100MA3X5NNQ1N', '杜彪', null, '1', '70', '71', '7', '郑州市金水区花园路114号1层07号', null, null);
INSERT INTO `sys_user_org` VALUES ('0109', '01', '上海浦东发展银行股份有限公司郑州分行', null, '91410100727025903N(1-1)', '董琢理', null, '1', '68', '69', '7', '商务外环和东四街交叉口郑州市房管局二楼浦发银行抵押办公室', null, null);
INSERT INTO `sys_user_org` VALUES ('0110', '01', '中国银行股份有限公司', null, null, null, null, '1', '48', '67', '6', null, null, null);
INSERT INTO `sys_user_org` VALUES ('011001', '1001', '中国银行股份有限公司郑州自贸区分行', null, '9141010087004279X9', '王小军', null, '2', '65', '66', '7', null, null, null);
INSERT INTO `sys_user_org` VALUES ('011002', '1001', '中国银行股份有限公司郑州陇西支行', null, '91410100870042829R', '任立谦', null, '2', '63', '64', '7', null, null, null);
INSERT INTO `sys_user_org` VALUES ('011003', '1001', '中国银行股份有限公司郑州高新技术开发区支行', null, '91410100X14707314Y（1-1）', '李自玉', null, '2', '61', '62', '7', null, null, null);
INSERT INTO `sys_user_org` VALUES ('011004', '1001', '中国银行股份有限公司郑州文化支行', null, '91410100721804850M', '郜瑞峰', null, '2', '59', '60', '7', null, null, null);
INSERT INTO `sys_user_org` VALUES ('011005', '1001', '中国银行股份有限公司郑州商品交易所支行', null, '91410100721828553A', '朱桐新', null, '2', '57', '58', '7', null, null, null);
INSERT INTO `sys_user_org` VALUES ('011006', '1001', '中国银行股份有限公司郑州金水支行', null, '914101009718464472', '李红杰', null, '2', '55', '56', '7', null, null, null);
INSERT INTO `sys_user_org` VALUES ('011007', '1001', '中国银行股份有限公司郑州航空港分行', null, '91410100739061274R', '田阳春', null, '2', '53', '54', '7', null, null, null);
INSERT INTO `sys_user_org` VALUES ('011008', '1001', '中国银行股份有限公司河南省分行', null, '91410000869953094T(1-1)', '何方恩', null, '2', '51', '52', '7', null, null, null);
INSERT INTO `sys_user_org` VALUES ('011009', '1001', '中国银行股份有限公司郑州花园支行', null, '91410100719167135W', '刘宝琴', null, '2', '49', '50', '7', null, null, null);
INSERT INTO `sys_user_org` VALUES ('0111', '01', '郑州住房置业担保有限责任公司', null, '91410100727019618B', '刘继军', null, '1', '46', '47', '7', '郑州市建设西路188号（房地产大厦4楼）', null, null);
INSERT INTO `sys_user_org` VALUES ('0112', '01', '广发银行股份有限公司郑州分行', null, '91410100869971321H（1-1）', '高奇志', null, '1', '42', '45', '7', null, null, null);
INSERT INTO `sys_user_org` VALUES ('011201', '0112', '广发银行股份有限公司郑州商都支行', null, '91410100577638965K(1-1)', '韩保林', null, '2', '43', '44', '7', '郑州市郑东新区商都路31号3号楼1-12层', null, null);
INSERT INTO `sys_user_org` VALUES ('0113', '01', '郑州市市郊农村信用合作联社', '18339960666', '914101007991791519', '董金泉', null, '1', '40', '41', '7', null, null, '11');
INSERT INTO `sys_user_org` VALUES ('02', '0', '开发商用户', null, null, null, null, '0', '105', '148', '6', null, null, null);
INSERT INTO `sys_user_org` VALUES ('0201', '02', '郑州玉安联合置业有限公司', null, '91410100569808290P', '高国安', null, '1', '146', '147', '7', '郑州市二七区马寨镇东方路6号马寨产业聚集区管委会办公用房3号楼2层201,202,203', null, null);
INSERT INTO `sys_user_org` VALUES ('02011', '02', '郑州华图利合实业发展有限责任公司', '13393568403', '914101007440978617', null, null, '1', '142', '143', '6', null, null, null);
INSERT INTO `sys_user_org` VALUES ('020112', '02', '河南天海置业有限公司', null, '91410100568637346F', null, null, '1', '140', '141', '7', null, null, null);
INSERT INTO `sys_user_org` VALUES ('0202', '02', '河南亚星置业集团有限公司', null, '914101067126274937', '高国安', null, '1', '136', '139', '7', '郑州市上街区许昌路西段', null, null);
INSERT INTO `sys_user_org` VALUES ('020201', '0102', '郑州创富房地产开发有限公司', null, '91410100719147003E(1-1)', '高国安', null, '2', '137', '138', '7', '郑州市二七区长江路南、嵩山路西亚星盛世星尚中心1号楼26层', null, null);
INSERT INTO `sys_user_org` VALUES ('02021', '02', '河南建业泰宏置业有限公司', '13137146168', '914101006728547030', null, null, '1', '118', '119', '7', null, null, null);
INSERT INTO `sys_user_org` VALUES ('0203', '02', '河南绿地陆港置业有限公司', null, '914101003302043218', '方东兴', null, '1', '134', '135', '7', '郑州经济技术开发区第八大街和经南二路交叉口创业园孵化基地3楼367号', null, null);
INSERT INTO `sys_user_org` VALUES ('0204', '02', '郑州清华大溪地置业有限公司', null, '9141018256980883X6', '李轩', null, '1', '132', '133', '7', '荥阳市郑上路与商隐路交叉口西南侧市民广场文化庭院（四合院）1号楼', null, null);
INSERT INTO `sys_user_org` VALUES ('0205', '02', '河南新田置业有限公司', null, '910101002717356746', '田中飞', null, '1', '130', '131', '7', '郑州市金水区黄河路95号', null, null);
INSERT INTO `sys_user_org` VALUES ('0206', '02', '郑州瀚宇置业有限公司', null, '910101820675534008', '杨宝宏', null, '1', '128', '129', '7', '荥阳市郑上路与滨河路交叉口向南300米瀚宇天悦湾', null, null);
INSERT INTO `sys_user_org` VALUES ('0207', '02', '河南吉地置业有限公司', '037163296967', '914101007583708654（1-1）', '安东方', null, '1', '126', '127', '7', '郑州市郑东新区郑开大道19号13楼1301、1308', null, null);
INSERT INTO `sys_user_org` VALUES ('0208', '02', '郑州新顺意置业有限公司', '13592531551', '914101007522826530', '苏玉斌', null, '1', '114', '115', '6', null, null, null);
INSERT INTO `sys_user_org` VALUES ('020801', '02', '河南正弘实业有限公司', '13673603981', '91410101000508890042', '李向清', null, '1', '124', '125', '7', null, null, null);
INSERT INTO `sys_user_org` VALUES ('0209', '02', '郑州万翔房地产开发有限公司', '13460315792', '91410122775137870H', '胡淑杰', null, '1', '122', '123', '7', null, null, null);
INSERT INTO `sys_user_org` VALUES ('0210', '02', '河南省顺泰达置业有限公司', '13523429278', '91410122661898380P', '张玉笋', null, '1', '120', '121', '6', null, null, null);
INSERT INTO `sys_user_org` VALUES ('0211', '02', '郑州杰人置业有限公司', '0371-56573791', '91410100678063515W', '周亮', null, '1', '112', '113', '7', null, null, null);
INSERT INTO `sys_user_org` VALUES ('0212', '02', '河南省锦美置业有限公司', '65727999', '91410100070092692U', '唐浩浩', null, '1', '116', '117', '7', null, null, null);
INSERT INTO `sys_user_org` VALUES ('0221', '02', '郑州雅居乐房地产开发有限公司', '13133336666', '94152658956256298K', null, null, '1', '110', '111', '7', null, null, null);
INSERT INTO `sys_user_org` VALUES ('0222', '02', '河南裕鸿置业有限公司', '18508886666', '9415282828098K', null, null, '1', '108', '109', '7', null, null, null);
INSERT INTO `sys_user_org` VALUES ('0223', '02', '河南鑫苑顺晟置业有限公司', '65291155', '91410100MA3X6JLY95', null, null, '1', '106', '107', '7', null, null, null);
INSERT INTO `sys_user_org` VALUES ('1-12', '00', '新郑', null, null, null, null, '1', '28', '29', '6', null, null, null);
INSERT INTO `sys_user_org` VALUES ('1-13', '00', '登封', null, null, null, null, '1', '34', '35', '6', null, null, null);
INSERT INTO `sys_user_org` VALUES ('1-14', '00', '中牟', null, null, null, null, '1', '26', '27', '6', null, null, null);
INSERT INTO `sys_user_org` VALUES ('1-15', '00', '荥阳', null, null, null, null, '1', '30', '31', '6', null, null, null);
INSERT INTO `sys_user_org` VALUES ('1-16', '00', '上街', null, null, null, null, '1', '32', '33', '6', null, null, null);
INSERT INTO `sys_user_org` VALUES ('1-17', '00', '新密', null, null, null, null, '1', '4', '5', '6', null, null, null);
INSERT INTO `sys_user_org` VALUES ('1-18', '00', '航空港区', null, null, null, null, '1', '36', '37', '6', null, null, null);
INSERT INTO `sys_user_org` VALUES ('1-19', '00', '托管区', null, null, null, null, '1', '2', '3', '6', null, null, null);
INSERT INTO `sys_user_org` VALUES ('1-3', '00', '市局', null, null, null, null, '1', '6', '25', '6', null, null, null);
INSERT INTO `sys_user_org` VALUES ('1-3-10', '1-3', '郑东新区', null, null, null, null, '2', '9', '10', '6', null, null, null);
INSERT INTO `sys_user_org` VALUES ('1-3-11', '1-3', '高新', null, null, null, null, '2', '11', '12', '6', null, null, null);
INSERT INTO `sys_user_org` VALUES ('1-3-2', '1-3', '市中心', null, null, null, null, '2', '7', '8', '6', null, null, null);
INSERT INTO `sys_user_org` VALUES ('1-3-4', '1-3', '二七', null, null, null, null, '2', '21', '22', '6', null, null, null);
INSERT INTO `sys_user_org` VALUES ('1-3-5', '1-3', '金水', null, null, null, null, '2', '19', '20', '6', null, null, null);
INSERT INTO `sys_user_org` VALUES ('1-3-6', '1-3', '中原', null, null, null, null, '2', '17', '18', '6', null, null, null);
INSERT INTO `sys_user_org` VALUES ('1-3-7', '1-3', '管城', null, null, null, null, '2', '23', '24', '6', null, null, null);
INSERT INTO `sys_user_org` VALUES ('1-3-8', '1-3', '惠济', null, null, null, null, '2', '15', '16', '6', null, null, null);
INSERT INTO `sys_user_org` VALUES ('1-3-9', '1-3', '经开', null, null, null, null, '2', '13', '14', '6', null, null, null);
INSERT INTO `sys_user_org` VALUES ('124128284189800000', '02', 'lguser', null, '124128284189800000', 'lguser', null, '2', '144', '145', '6', null, '18538556338', null);
