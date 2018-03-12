/*
Navicat MariaDB Data Transfer

Source Server         : mysql-飘麦
Source Server Version : 50556
Source Host           : mysql.moontell.cn:3306
Source Database       : maipiaopiao

Target Server Type    : MariaDB
Target Server Version : 50556
File Encoding         : 65001

Date: 2018-03-12 22:38:10
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for halls
-- ----------------------------
DROP TABLE IF EXISTS `halls`;
CREATE TABLE `halls` (
  `vname` varchar(255) NOT NULL,
  `hname` varchar(20) NOT NULL COMMENT '厅 比如 杜比音响厅',
  `stype` varchar(255) NOT NULL COMMENT '座位类型，比如 A B，内场，外场',
  `rownum` int(7) DEFAULT NULL COMMENT '排数',
  `colnum` int(7) unsigned zerofill DEFAULT NULL COMMENT '列数',
  PRIMARY KEY (`vname`,`hname`,`stype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='场馆的厅';

-- ----------------------------
-- Records of halls
-- ----------------------------
INSERT INTO `halls` VALUES ('幸福蓝海国际影城', '1厅', 'A', '10', '0000010');
INSERT INTO `halls` VALUES ('幸福蓝海国际影城', '杜比厅', 'A座', '10', '0000010');
INSERT INTO `halls` VALUES ('幸福蓝海国际影城', '杜比厅', 'B座', '10', '0000010');

-- ----------------------------
-- Table structure for memberorder
-- ----------------------------
DROP TABLE IF EXISTS `memberorder`;
CREATE TABLE `memberorder` (
  `oid` int(20) NOT NULL AUTO_INCREMENT COMMENT '订单编号',
  `uname` varchar(20) DEFAULT NULL,
  `pname` varchar(255) NOT NULL COMMENT '活动id',
  `state` varchar(20) DEFAULT NULL COMMENT '未支付、已支付、取消、完成',
  `seatnum` int(11) DEFAULT NULL COMMENT '订票的座位数量',
  `seatarranged` int(1) DEFAULT NULL COMMENT '是否安排了座位，安排为1，未安排为0',
  `booktime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `charge` int(11) DEFAULT NULL,
  `pay` int(11) DEFAULT NULL,
  `ticketname` varchar(255) DEFAULT NULL COMMENT '使用的优惠券',
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='使用网站的订单';

-- ----------------------------
-- Records of memberorder
-- ----------------------------
INSERT INTO `memberorder` VALUES ('5', 'arloor', '至暗时刻', '已支付', '10', '0', '2018-03-12 22:36:56', '550', '550', '不使用优惠卷');

-- ----------------------------
-- Table structure for members
-- ----------------------------
DROP TABLE IF EXISTS `members`;
CREATE TABLE `members` (
  `email` varchar(20) DEFAULT NULL COMMENT '会员邮箱（不可更改）',
  `uname` varchar(20) NOT NULL COMMENT '会员名（使用英文+数字，不可更改）',
  `passwd` varchar(20) DEFAULT NULL COMMENT '使用mysql加密的用户密码',
  `role` varchar(25) DEFAULT 'ROLE_MEMBER',
  `paykey` varchar(20) DEFAULT NULL COMMENT '支付密码',
  `balance` int(11) DEFAULT '0' COMMENT '用户余额，整数',
  `bonus` int(11) DEFAULT '0' COMMENT '会员积分',
  `paynum` int(11) DEFAULT '0' COMMENT '消费总金额，决定会员等级',
  `timesign` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '注册时间',
  `timecancel` timestamp NULL DEFAULT NULL COMMENT '注销时间，如果为null，说明账号有效',
  `pin` varchar(6) DEFAULT NULL COMMENT '各种用途的验证码',
  `pinindex` int(11) DEFAULT '0' COMMENT '验证码序号，用于确定验证码是否失效',
  PRIMARY KEY (`uname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员表';

-- ----------------------------
-- Records of members
-- ----------------------------
INSERT INTO `members` VALUES ('1293181335@qq.com', 'arloor', 'arloor', 'ROLE_MEMBER', '123456', '450', '550', '1550', '2018-02-02 05:29:47', null, '5666', '71');

-- ----------------------------
-- Table structure for memberticket
-- ----------------------------
DROP TABLE IF EXISTS `memberticket`;
CREATE TABLE `memberticket` (
  `ticketid` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户拥有的券的表示',
  `uname` varchar(20) DEFAULT NULL,
  `ticketname` varchar(20) DEFAULT NULL,
  `used` int(11) DEFAULT '0' COMMENT '0未使用',
  `gettime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ticketid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='用户所有优惠券';

-- ----------------------------
-- Records of memberticket
-- ----------------------------
INSERT INTO `memberticket` VALUES ('1', 'arloor', '3月新用户尊享', '0', '2018-03-12 05:20:32');
INSERT INTO `memberticket` VALUES ('2', 'arloor', '3月积分兑换', '0', '2018-03-12 13:23:14');

-- ----------------------------
-- Table structure for pfares
-- ----------------------------
DROP TABLE IF EXISTS `pfares`;
CREATE TABLE `pfares` (
  `pname` varchar(255) NOT NULL COMMENT '演出id',
  `stype` varchar(255) NOT NULL COMMENT '座位类型',
  `fares` decimal(10,2) DEFAULT NULL COMMENT '价格',
  PRIMARY KEY (`pname`,`stype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='计划的分座位等级的价格表';

-- ----------------------------
-- Records of pfares
-- ----------------------------
INSERT INTO `pfares` VALUES ('至暗时刻', 'A', '55.00');

-- ----------------------------
-- Table structure for plays
-- ----------------------------
DROP TABLE IF EXISTS `plays`;
CREATE TABLE `plays` (
  `pname` varchar(255) NOT NULL COMMENT '演出名',
  `vname` varchar(255) NOT NULL COMMENT '演出所在的场馆',
  `hname` varchar(255) NOT NULL COMMENT '演出所在的厅',
  `pdate` varchar(255) NOT NULL,
  `ptime` varchar(255) NOT NULL,
  `ptype` varchar(255) NOT NULL COMMENT '演出类型',
  `pinfo` varchar(255) NOT NULL COMMENT '演出的描述',
  PRIMARY KEY (`pname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='演出计划表';

-- ----------------------------
-- Records of plays
-- ----------------------------
INSERT INTO `plays` VALUES ('至暗时刻', '幸福蓝海国际影城', '1厅', '2018-03-24', '10:25', '电影', '至暗时刻的小老头');

-- ----------------------------
-- Table structure for ticket
-- ----------------------------
DROP TABLE IF EXISTS `ticket`;
CREATE TABLE `ticket` (
  `ticketname` varchar(20) NOT NULL COMMENT '优惠券名',
  `type` varchar(255) DEFAULT '折扣' COMMENT '优惠券类型 折扣 立减：根据此值确定param,,的含义',
  `param0` varchar(10) DEFAULT '',
  `param1` varchar(10) DEFAULT '',
  `param2` varchar(10) DEFAULT '',
  `left` int(11) DEFAULT NULL COMMENT '剩余数量',
  PRIMARY KEY (`ticketname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='平台优惠券';

-- ----------------------------
-- Records of ticket
-- ----------------------------
INSERT INTO `ticket` VALUES ('3月新用户尊享', '折扣', '300', '0.8', '', '49');
INSERT INTO `ticket` VALUES ('3月积分兑换', '立减', '100', '5', '', '38');

-- ----------------------------
-- Table structure for venues
-- ----------------------------
DROP TABLE IF EXISTS `venues`;
CREATE TABLE `venues` (
  `vid` int(7) NOT NULL AUTO_INCREMENT COMMENT '7位识别码，登陆依据',
  `vname` varchar(255) NOT NULL,
  `vpasswd` varchar(255) DEFAULT NULL,
  `vaddr` varchar(255) DEFAULT NULL,
  `vstatus` varchar(255) DEFAULT 'sign' COMMENT '场馆的状态：valid-通过审核、有效 sign-刚注册、待审核 tocheck-修改信息后待审核',
  `vinfo` varchar(255) DEFAULT NULL COMMENT '场馆简介',
  `role` varchar(255) DEFAULT 'ROLE_VENUES' COMMENT '用于spring security的字段',
  PRIMARY KEY (`vname`),
  UNIQUE KEY `venues_vid_uindex` (`vid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='场馆信息的表\r\n';

-- ----------------------------
-- Records of venues
-- ----------------------------
INSERT INTO `venues` VALUES ('1', '幸福蓝海国际影城', '123456', '汉口路222号', 'valid', '暂无简介', 'ROLE_VENUES');

-- ----------------------------
-- Table structure for 至暗时刻_seats
-- ----------------------------
DROP TABLE IF EXISTS `至暗时刻_seats`;
CREATE TABLE `至暗时刻_seats` (
  `pname` varchar(255) NOT NULL,
  `stype` varchar(255) NOT NULL,
  `row` int(10) NOT NULL,
  `col` int(10) NOT NULL,
  `uname` varchar(255) NOT NULL DEFAULT 'untaken',
  `status` varchar(255) NOT NULL DEFAULT 'untaken',
  PRIMARY KEY (`pname`,`stype`,`row`,`col`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of 至暗时刻_seats
-- ----------------------------
INSERT INTO `至暗时刻_seats` VALUES ('至暗时刻', 'A', '1', '1', 'untaken', 'untaken');
INSERT INTO `至暗时刻_seats` VALUES ('至暗时刻', 'A', '1', '2', 'untaken', 'untaken');
INSERT INTO `至暗时刻_seats` VALUES ('至暗时刻', 'A', '1', '3', 'untaken', 'untaken');
INSERT INTO `至暗时刻_seats` VALUES ('至暗时刻', 'A', '1', '4', 'untaken', 'untaken');
INSERT INTO `至暗时刻_seats` VALUES ('至暗时刻', 'A', '1', '5', 'untaken', 'untaken');
INSERT INTO `至暗时刻_seats` VALUES ('至暗时刻', 'A', '1', '6', 'untaken', 'untaken');
INSERT INTO `至暗时刻_seats` VALUES ('至暗时刻', 'A', '1', '7', 'untaken', 'untaken');
INSERT INTO `至暗时刻_seats` VALUES ('至暗时刻', 'A', '1', '8', 'untaken', 'untaken');
INSERT INTO `至暗时刻_seats` VALUES ('至暗时刻', 'A', '1', '9', 'untaken', 'untaken');
INSERT INTO `至暗时刻_seats` VALUES ('至暗时刻', 'A', '1', '10', 'untaken', 'untaken');
INSERT INTO `至暗时刻_seats` VALUES ('至暗时刻', 'A', '2', '1', 'untaken', 'untaken');
INSERT INTO `至暗时刻_seats` VALUES ('至暗时刻', 'A', '2', '2', 'untaken', 'untaken');
INSERT INTO `至暗时刻_seats` VALUES ('至暗时刻', 'A', '2', '3', 'untaken', 'untaken');
INSERT INTO `至暗时刻_seats` VALUES ('至暗时刻', 'A', '2', '4', 'untaken', 'untaken');
INSERT INTO `至暗时刻_seats` VALUES ('至暗时刻', 'A', '2', '5', 'untaken', 'untaken');
INSERT INTO `至暗时刻_seats` VALUES ('至暗时刻', 'A', '2', '6', 'untaken', 'untaken');
INSERT INTO `至暗时刻_seats` VALUES ('至暗时刻', 'A', '2', '7', 'untaken', 'untaken');
INSERT INTO `至暗时刻_seats` VALUES ('至暗时刻', 'A', '2', '8', 'untaken', 'untaken');
INSERT INTO `至暗时刻_seats` VALUES ('至暗时刻', 'A', '2', '9', 'untaken', 'untaken');
INSERT INTO `至暗时刻_seats` VALUES ('至暗时刻', 'A', '2', '10', 'untaken', 'untaken');
INSERT INTO `至暗时刻_seats` VALUES ('至暗时刻', 'A', '3', '1', 'untaken', 'untaken');
INSERT INTO `至暗时刻_seats` VALUES ('至暗时刻', 'A', '3', '2', 'untaken', 'untaken');
INSERT INTO `至暗时刻_seats` VALUES ('至暗时刻', 'A', '3', '3', 'untaken', 'untaken');
INSERT INTO `至暗时刻_seats` VALUES ('至暗时刻', 'A', '3', '4', 'untaken', 'untaken');
INSERT INTO `至暗时刻_seats` VALUES ('至暗时刻', 'A', '3', '5', 'untaken', 'untaken');
INSERT INTO `至暗时刻_seats` VALUES ('至暗时刻', 'A', '3', '6', 'untaken', 'untaken');
INSERT INTO `至暗时刻_seats` VALUES ('至暗时刻', 'A', '3', '7', 'untaken', 'untaken');
INSERT INTO `至暗时刻_seats` VALUES ('至暗时刻', 'A', '3', '8', 'untaken', 'untaken');
INSERT INTO `至暗时刻_seats` VALUES ('至暗时刻', 'A', '3', '9', 'untaken', 'untaken');
INSERT INTO `至暗时刻_seats` VALUES ('至暗时刻', 'A', '3', '10', 'untaken', 'untaken');
INSERT INTO `至暗时刻_seats` VALUES ('至暗时刻', 'A', '4', '1', 'untaken', 'untaken');
INSERT INTO `至暗时刻_seats` VALUES ('至暗时刻', 'A', '4', '2', 'untaken', 'untaken');
INSERT INTO `至暗时刻_seats` VALUES ('至暗时刻', 'A', '4', '3', 'untaken', 'untaken');
INSERT INTO `至暗时刻_seats` VALUES ('至暗时刻', 'A', '4', '4', 'untaken', 'untaken');
INSERT INTO `至暗时刻_seats` VALUES ('至暗时刻', 'A', '4', '5', 'untaken', 'untaken');
INSERT INTO `至暗时刻_seats` VALUES ('至暗时刻', 'A', '4', '6', 'untaken', 'untaken');
INSERT INTO `至暗时刻_seats` VALUES ('至暗时刻', 'A', '4', '7', 'untaken', 'untaken');
INSERT INTO `至暗时刻_seats` VALUES ('至暗时刻', 'A', '4', '8', 'untaken', 'untaken');
INSERT INTO `至暗时刻_seats` VALUES ('至暗时刻', 'A', '4', '9', 'untaken', 'untaken');
INSERT INTO `至暗时刻_seats` VALUES ('至暗时刻', 'A', '4', '10', 'untaken', 'untaken');
INSERT INTO `至暗时刻_seats` VALUES ('至暗时刻', 'A', '5', '1', 'untaken', 'untaken');
INSERT INTO `至暗时刻_seats` VALUES ('至暗时刻', 'A', '5', '2', 'untaken', 'untaken');
INSERT INTO `至暗时刻_seats` VALUES ('至暗时刻', 'A', '5', '3', 'untaken', 'untaken');
INSERT INTO `至暗时刻_seats` VALUES ('至暗时刻', 'A', '5', '4', 'untaken', 'untaken');
INSERT INTO `至暗时刻_seats` VALUES ('至暗时刻', 'A', '5', '5', 'untaken', 'untaken');
INSERT INTO `至暗时刻_seats` VALUES ('至暗时刻', 'A', '5', '6', 'untaken', 'untaken');
INSERT INTO `至暗时刻_seats` VALUES ('至暗时刻', 'A', '5', '7', 'untaken', 'untaken');
INSERT INTO `至暗时刻_seats` VALUES ('至暗时刻', 'A', '5', '8', 'untaken', 'untaken');
INSERT INTO `至暗时刻_seats` VALUES ('至暗时刻', 'A', '5', '9', 'untaken', 'untaken');
INSERT INTO `至暗时刻_seats` VALUES ('至暗时刻', 'A', '5', '10', 'untaken', 'untaken');
INSERT INTO `至暗时刻_seats` VALUES ('至暗时刻', 'A', '6', '1', 'untaken', 'untaken');
INSERT INTO `至暗时刻_seats` VALUES ('至暗时刻', 'A', '6', '2', 'untaken', 'untaken');
INSERT INTO `至暗时刻_seats` VALUES ('至暗时刻', 'A', '6', '3', 'untaken', 'untaken');
INSERT INTO `至暗时刻_seats` VALUES ('至暗时刻', 'A', '6', '4', 'untaken', 'untaken');
INSERT INTO `至暗时刻_seats` VALUES ('至暗时刻', 'A', '6', '5', 'untaken', 'untaken');
INSERT INTO `至暗时刻_seats` VALUES ('至暗时刻', 'A', '6', '6', 'untaken', 'untaken');
INSERT INTO `至暗时刻_seats` VALUES ('至暗时刻', 'A', '6', '7', 'untaken', 'untaken');
INSERT INTO `至暗时刻_seats` VALUES ('至暗时刻', 'A', '6', '8', 'untaken', 'untaken');
INSERT INTO `至暗时刻_seats` VALUES ('至暗时刻', 'A', '6', '9', 'untaken', 'untaken');
INSERT INTO `至暗时刻_seats` VALUES ('至暗时刻', 'A', '6', '10', 'untaken', 'untaken');
INSERT INTO `至暗时刻_seats` VALUES ('至暗时刻', 'A', '7', '1', 'untaken', 'untaken');
INSERT INTO `至暗时刻_seats` VALUES ('至暗时刻', 'A', '7', '2', 'untaken', 'untaken');
INSERT INTO `至暗时刻_seats` VALUES ('至暗时刻', 'A', '7', '3', 'untaken', 'untaken');
INSERT INTO `至暗时刻_seats` VALUES ('至暗时刻', 'A', '7', '4', 'untaken', 'untaken');
INSERT INTO `至暗时刻_seats` VALUES ('至暗时刻', 'A', '7', '5', 'untaken', 'untaken');
INSERT INTO `至暗时刻_seats` VALUES ('至暗时刻', 'A', '7', '6', 'untaken', 'untaken');
INSERT INTO `至暗时刻_seats` VALUES ('至暗时刻', 'A', '7', '7', 'untaken', 'untaken');
INSERT INTO `至暗时刻_seats` VALUES ('至暗时刻', 'A', '7', '8', 'untaken', 'untaken');
INSERT INTO `至暗时刻_seats` VALUES ('至暗时刻', 'A', '7', '9', 'untaken', 'untaken');
INSERT INTO `至暗时刻_seats` VALUES ('至暗时刻', 'A', '7', '10', 'untaken', 'untaken');
INSERT INTO `至暗时刻_seats` VALUES ('至暗时刻', 'A', '8', '1', 'untaken', 'untaken');
INSERT INTO `至暗时刻_seats` VALUES ('至暗时刻', 'A', '8', '2', 'untaken', 'untaken');
INSERT INTO `至暗时刻_seats` VALUES ('至暗时刻', 'A', '8', '3', 'untaken', 'untaken');
INSERT INTO `至暗时刻_seats` VALUES ('至暗时刻', 'A', '8', '4', 'untaken', 'untaken');
INSERT INTO `至暗时刻_seats` VALUES ('至暗时刻', 'A', '8', '5', 'untaken', 'untaken');
INSERT INTO `至暗时刻_seats` VALUES ('至暗时刻', 'A', '8', '6', 'untaken', 'untaken');
INSERT INTO `至暗时刻_seats` VALUES ('至暗时刻', 'A', '8', '7', 'untaken', 'untaken');
INSERT INTO `至暗时刻_seats` VALUES ('至暗时刻', 'A', '8', '8', 'untaken', 'untaken');
INSERT INTO `至暗时刻_seats` VALUES ('至暗时刻', 'A', '8', '9', 'untaken', 'untaken');
INSERT INTO `至暗时刻_seats` VALUES ('至暗时刻', 'A', '8', '10', 'untaken', 'untaken');
INSERT INTO `至暗时刻_seats` VALUES ('至暗时刻', 'A', '9', '1', 'untaken', 'untaken');
INSERT INTO `至暗时刻_seats` VALUES ('至暗时刻', 'A', '9', '2', 'untaken', 'untaken');
INSERT INTO `至暗时刻_seats` VALUES ('至暗时刻', 'A', '9', '3', 'untaken', 'untaken');
INSERT INTO `至暗时刻_seats` VALUES ('至暗时刻', 'A', '9', '4', 'untaken', 'untaken');
INSERT INTO `至暗时刻_seats` VALUES ('至暗时刻', 'A', '9', '5', 'untaken', 'untaken');
INSERT INTO `至暗时刻_seats` VALUES ('至暗时刻', 'A', '9', '6', 'untaken', 'untaken');
INSERT INTO `至暗时刻_seats` VALUES ('至暗时刻', 'A', '9', '7', 'untaken', 'untaken');
INSERT INTO `至暗时刻_seats` VALUES ('至暗时刻', 'A', '9', '8', 'untaken', 'untaken');
INSERT INTO `至暗时刻_seats` VALUES ('至暗时刻', 'A', '9', '9', 'untaken', 'untaken');
INSERT INTO `至暗时刻_seats` VALUES ('至暗时刻', 'A', '9', '10', 'untaken', 'untaken');
INSERT INTO `至暗时刻_seats` VALUES ('至暗时刻', 'A', '10', '1', 'untaken', 'untaken');
INSERT INTO `至暗时刻_seats` VALUES ('至暗时刻', 'A', '10', '2', 'untaken', 'untaken');
INSERT INTO `至暗时刻_seats` VALUES ('至暗时刻', 'A', '10', '3', 'untaken', 'untaken');
INSERT INTO `至暗时刻_seats` VALUES ('至暗时刻', 'A', '10', '4', 'untaken', 'untaken');
INSERT INTO `至暗时刻_seats` VALUES ('至暗时刻', 'A', '10', '5', 'untaken', 'untaken');
INSERT INTO `至暗时刻_seats` VALUES ('至暗时刻', 'A', '10', '6', 'untaken', 'untaken');
INSERT INTO `至暗时刻_seats` VALUES ('至暗时刻', 'A', '10', '7', 'untaken', 'untaken');
INSERT INTO `至暗时刻_seats` VALUES ('至暗时刻', 'A', '10', '8', 'untaken', 'untaken');
INSERT INTO `至暗时刻_seats` VALUES ('至暗时刻', 'A', '10', '9', 'untaken', 'untaken');
INSERT INTO `至暗时刻_seats` VALUES ('至暗时刻', 'A', '10', '10', 'untaken', 'untaken');
SET FOREIGN_KEY_CHECKS=1;
