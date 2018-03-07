/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50718
Source Host           : localhost:3306
Source Database       : maipiaopiao

Target Server Type    : MYSQL
Target Server Version : 50718
File Encoding         : 65001

Date: 2018-03-07 17:36:54
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
INSERT INTO `halls` VALUES ('幸福蓝海国际影城', '杜比厅', 'A', '10', '0000010');
INSERT INTO `halls` VALUES ('幸福蓝海国际影城', '杜比厅', 'B', '10', '0000010');

-- ----------------------------
-- Table structure for memberorder
-- ----------------------------
DROP TABLE IF EXISTS `memberorder`;
CREATE TABLE `memberorder` (
  `oid` int(20) NOT NULL AUTO_INCREMENT COMMENT '订单编号',
  `uname` varchar(20) DEFAULT NULL,
  `pid` int(20) DEFAULT NULL COMMENT '活动id',
  `state` varchar(20) DEFAULT NULL COMMENT '未支付、已支付、取消、完成',
  `seatnum` int(11) DEFAULT NULL COMMENT '订票的座位数量',
  `seatarranged` int(1) DEFAULT NULL COMMENT '是否安排了座位，安排为1，未安排为0',
  `booktime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `charge` int(11) DEFAULT NULL,
  `pay` int(11) DEFAULT NULL,
  `ticketid` int(11) DEFAULT NULL COMMENT '使用的优惠券',
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='使用网站的订单';

-- ----------------------------
-- Records of memberorder
-- ----------------------------

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
INSERT INTO `members` VALUES ('1293181335@qq.com', 'arloor', 'arloor', 'ROLE_MEMBER', '123456', '100', '100', '1234', '2018-02-02 05:29:47', null, '5666', '71');
INSERT INTO `members` VALUES ('1293181335@qq.com', 'pig', '123456', 'ROLE_MEMBER', '123456', '0', '0', '0', '2018-03-06 13:24:06', null, '72597', '1');

-- ----------------------------
-- Table structure for memberticket
-- ----------------------------
DROP TABLE IF EXISTS `memberticket`;
CREATE TABLE `memberticket` (
  `ticketid` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户拥有的券的表示',
  `uname` varchar(20) DEFAULT NULL,
  `ticketname` varchar(20) DEFAULT NULL,
  `used` int(11) DEFAULT NULL COMMENT '0未使用',
  `gettime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `usetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ticketid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户所有优惠券';

-- ----------------------------
-- Records of memberticket
-- ----------------------------

-- ----------------------------
-- Table structure for pfares
-- ----------------------------
DROP TABLE IF EXISTS `pfares`;
CREATE TABLE `pfares` (
  `pid` int(20) NOT NULL COMMENT '演出id',
  `stype` varchar(255) NOT NULL COMMENT '座位类型',
  `fares` decimal(10,2) DEFAULT NULL COMMENT '价格',
  PRIMARY KEY (`pid`,`stype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='计划的分座位等级的价格表';

-- ----------------------------
-- Records of pfares
-- ----------------------------

-- ----------------------------
-- Table structure for plays
-- ----------------------------
DROP TABLE IF EXISTS `plays`;
CREATE TABLE `plays` (
  `pid` int(20) NOT NULL COMMENT '演出计划id',
  `vid` int(7) DEFAULT NULL COMMENT '演出所在的场馆',
  `hid` varchar(255) DEFAULT NULL COMMENT '演出所在的厅',
  `pname` varchar(255) DEFAULT NULL COMMENT '演出名',
  `ptime` varchar(255) DEFAULT NULL,
  `ptype` varchar(255) DEFAULT NULL COMMENT '演出类型',
  `pinfo` varchar(255) DEFAULT NULL COMMENT '演出的描述',
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='演出计划表';

-- ----------------------------
-- Records of plays
-- ----------------------------

-- ----------------------------
-- Table structure for ticket
-- ----------------------------
DROP TABLE IF EXISTS `ticket`;
CREATE TABLE `ticket` (
  `ticketname` varchar(20) NOT NULL COMMENT '优惠券名',
  `type` int(11) DEFAULT '0' COMMENT '优惠券类型：根据此值确定param,,的含义',
  `param0` varchar(10) DEFAULT NULL,
  `param1` varchar(10) DEFAULT NULL,
  `param2` varchar(10) DEFAULT NULL,
  `left` int(11) DEFAULT NULL COMMENT '剩余数量',
  PRIMARY KEY (`ticketname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='平台优惠券';

-- ----------------------------
-- Records of ticket
-- ----------------------------

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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='场馆信息的表\r\n';

-- ----------------------------
-- Records of venues
-- ----------------------------
INSERT INTO `venues` VALUES ('1', '幸福蓝海国际影城', '123456', '汉口路222号', 'sign', '暂无简介', 'ROLE_VENUES');
SET FOREIGN_KEY_CHECKS=1;
