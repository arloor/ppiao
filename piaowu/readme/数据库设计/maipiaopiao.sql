/*
Navicat MariaDB Data Transfer

Source Server         : mysql-飘麦
Source Server Version : 50556
Source Host           : mysql.moontell.cn:3306
Source Database       : maipiaopiao

Target Server Type    : MariaDB
Target Server Version : 50556
File Encoding         : 65001

Date: 2018-03-12 10:07:41
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
  `pname` varchar(255) NOT NULL COMMENT '演出id',
  `stype` varchar(255) NOT NULL COMMENT '座位类型',
  `fares` decimal(10,2) DEFAULT NULL COMMENT '价格',
  PRIMARY KEY (`pname`,`stype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='计划的分座位等级的价格表';

-- ----------------------------
-- Records of pfares
-- ----------------------------
INSERT INTO `pfares` VALUES ('复仇者联盟', 'A', '52.00');
INSERT INTO `pfares` VALUES ('黑豹-漫威超级英雄电影', 'A座', '85.00');
INSERT INTO `pfares` VALUES ('黑豹-漫威超级英雄电影', 'B座', '60.00');

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
INSERT INTO `plays` VALUES ('复仇者联盟', '幸福蓝海国际影城', '1厅', '2018-03-29', '16:30', '电影', '复仇者联盟啊');
INSERT INTO `plays` VALUES ('黑豹-漫威超级英雄电影', '幸福蓝海国际影城', '杜比厅', '2018-03-18', '12:25', '电影', '漫威黑人英雄！');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='场馆信息的表\r\n';

-- ----------------------------
-- Records of venues
-- ----------------------------
INSERT INTO `venues` VALUES ('1', '幸福蓝海国际影城', '123456', '汉口路222号', 'valid', '暂无简介', 'ROLE_VENUES');

-- ----------------------------
-- Table structure for 复仇者联盟_seats
-- ----------------------------
DROP TABLE IF EXISTS `复仇者联盟_seats`;
CREATE TABLE `复仇者联盟_seats` (
  `pname` varchar(255) NOT NULL,
  `stype` varchar(255) NOT NULL,
  `row` varchar(255) NOT NULL,
  `col` varchar(255) NOT NULL,
  `orderid` int(20) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`pname`,`stype`,`row`,`col`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of 复仇者联盟_seats
-- ----------------------------
INSERT INTO `复仇者联盟_seats` VALUES ('复仇者联盟', 'A', '1', '1', null, null);
INSERT INTO `复仇者联盟_seats` VALUES ('复仇者联盟', 'A', '1', '10', null, null);
INSERT INTO `复仇者联盟_seats` VALUES ('复仇者联盟', 'A', '1', '2', null, null);
INSERT INTO `复仇者联盟_seats` VALUES ('复仇者联盟', 'A', '1', '3', null, null);
INSERT INTO `复仇者联盟_seats` VALUES ('复仇者联盟', 'A', '1', '4', null, null);
INSERT INTO `复仇者联盟_seats` VALUES ('复仇者联盟', 'A', '1', '5', null, null);
INSERT INTO `复仇者联盟_seats` VALUES ('复仇者联盟', 'A', '1', '6', null, null);
INSERT INTO `复仇者联盟_seats` VALUES ('复仇者联盟', 'A', '1', '7', null, null);
INSERT INTO `复仇者联盟_seats` VALUES ('复仇者联盟', 'A', '1', '8', null, null);
INSERT INTO `复仇者联盟_seats` VALUES ('复仇者联盟', 'A', '1', '9', null, null);
INSERT INTO `复仇者联盟_seats` VALUES ('复仇者联盟', 'A', '10', '1', null, null);
INSERT INTO `复仇者联盟_seats` VALUES ('复仇者联盟', 'A', '10', '10', null, null);
INSERT INTO `复仇者联盟_seats` VALUES ('复仇者联盟', 'A', '10', '2', null, null);
INSERT INTO `复仇者联盟_seats` VALUES ('复仇者联盟', 'A', '10', '3', null, null);
INSERT INTO `复仇者联盟_seats` VALUES ('复仇者联盟', 'A', '10', '4', null, null);
INSERT INTO `复仇者联盟_seats` VALUES ('复仇者联盟', 'A', '10', '5', null, null);
INSERT INTO `复仇者联盟_seats` VALUES ('复仇者联盟', 'A', '10', '6', null, null);
INSERT INTO `复仇者联盟_seats` VALUES ('复仇者联盟', 'A', '10', '7', null, null);
INSERT INTO `复仇者联盟_seats` VALUES ('复仇者联盟', 'A', '10', '8', null, null);
INSERT INTO `复仇者联盟_seats` VALUES ('复仇者联盟', 'A', '10', '9', null, null);
INSERT INTO `复仇者联盟_seats` VALUES ('复仇者联盟', 'A', '2', '1', null, null);
INSERT INTO `复仇者联盟_seats` VALUES ('复仇者联盟', 'A', '2', '10', null, null);
INSERT INTO `复仇者联盟_seats` VALUES ('复仇者联盟', 'A', '2', '2', null, null);
INSERT INTO `复仇者联盟_seats` VALUES ('复仇者联盟', 'A', '2', '3', null, null);
INSERT INTO `复仇者联盟_seats` VALUES ('复仇者联盟', 'A', '2', '4', null, null);
INSERT INTO `复仇者联盟_seats` VALUES ('复仇者联盟', 'A', '2', '5', null, null);
INSERT INTO `复仇者联盟_seats` VALUES ('复仇者联盟', 'A', '2', '6', null, null);
INSERT INTO `复仇者联盟_seats` VALUES ('复仇者联盟', 'A', '2', '7', null, null);
INSERT INTO `复仇者联盟_seats` VALUES ('复仇者联盟', 'A', '2', '8', null, null);
INSERT INTO `复仇者联盟_seats` VALUES ('复仇者联盟', 'A', '2', '9', null, null);
INSERT INTO `复仇者联盟_seats` VALUES ('复仇者联盟', 'A', '3', '1', null, null);
INSERT INTO `复仇者联盟_seats` VALUES ('复仇者联盟', 'A', '3', '10', null, null);
INSERT INTO `复仇者联盟_seats` VALUES ('复仇者联盟', 'A', '3', '2', null, null);
INSERT INTO `复仇者联盟_seats` VALUES ('复仇者联盟', 'A', '3', '3', null, null);
INSERT INTO `复仇者联盟_seats` VALUES ('复仇者联盟', 'A', '3', '4', null, null);
INSERT INTO `复仇者联盟_seats` VALUES ('复仇者联盟', 'A', '3', '5', null, null);
INSERT INTO `复仇者联盟_seats` VALUES ('复仇者联盟', 'A', '3', '6', null, null);
INSERT INTO `复仇者联盟_seats` VALUES ('复仇者联盟', 'A', '3', '7', null, null);
INSERT INTO `复仇者联盟_seats` VALUES ('复仇者联盟', 'A', '3', '8', null, null);
INSERT INTO `复仇者联盟_seats` VALUES ('复仇者联盟', 'A', '3', '9', null, null);
INSERT INTO `复仇者联盟_seats` VALUES ('复仇者联盟', 'A', '4', '1', null, null);
INSERT INTO `复仇者联盟_seats` VALUES ('复仇者联盟', 'A', '4', '10', null, null);
INSERT INTO `复仇者联盟_seats` VALUES ('复仇者联盟', 'A', '4', '2', null, null);
INSERT INTO `复仇者联盟_seats` VALUES ('复仇者联盟', 'A', '4', '3', null, null);
INSERT INTO `复仇者联盟_seats` VALUES ('复仇者联盟', 'A', '4', '4', null, null);
INSERT INTO `复仇者联盟_seats` VALUES ('复仇者联盟', 'A', '4', '5', null, null);
INSERT INTO `复仇者联盟_seats` VALUES ('复仇者联盟', 'A', '4', '6', null, null);
INSERT INTO `复仇者联盟_seats` VALUES ('复仇者联盟', 'A', '4', '7', null, null);
INSERT INTO `复仇者联盟_seats` VALUES ('复仇者联盟', 'A', '4', '8', null, null);
INSERT INTO `复仇者联盟_seats` VALUES ('复仇者联盟', 'A', '4', '9', null, null);
INSERT INTO `复仇者联盟_seats` VALUES ('复仇者联盟', 'A', '5', '1', null, null);
INSERT INTO `复仇者联盟_seats` VALUES ('复仇者联盟', 'A', '5', '10', null, null);
INSERT INTO `复仇者联盟_seats` VALUES ('复仇者联盟', 'A', '5', '2', null, null);
INSERT INTO `复仇者联盟_seats` VALUES ('复仇者联盟', 'A', '5', '3', null, null);
INSERT INTO `复仇者联盟_seats` VALUES ('复仇者联盟', 'A', '5', '4', null, null);
INSERT INTO `复仇者联盟_seats` VALUES ('复仇者联盟', 'A', '5', '5', null, null);
INSERT INTO `复仇者联盟_seats` VALUES ('复仇者联盟', 'A', '5', '6', null, null);
INSERT INTO `复仇者联盟_seats` VALUES ('复仇者联盟', 'A', '5', '7', null, null);
INSERT INTO `复仇者联盟_seats` VALUES ('复仇者联盟', 'A', '5', '8', null, null);
INSERT INTO `复仇者联盟_seats` VALUES ('复仇者联盟', 'A', '5', '9', null, null);
INSERT INTO `复仇者联盟_seats` VALUES ('复仇者联盟', 'A', '6', '1', null, null);
INSERT INTO `复仇者联盟_seats` VALUES ('复仇者联盟', 'A', '6', '10', null, null);
INSERT INTO `复仇者联盟_seats` VALUES ('复仇者联盟', 'A', '6', '2', null, null);
INSERT INTO `复仇者联盟_seats` VALUES ('复仇者联盟', 'A', '6', '3', null, null);
INSERT INTO `复仇者联盟_seats` VALUES ('复仇者联盟', 'A', '6', '4', null, null);
INSERT INTO `复仇者联盟_seats` VALUES ('复仇者联盟', 'A', '6', '5', null, null);
INSERT INTO `复仇者联盟_seats` VALUES ('复仇者联盟', 'A', '6', '6', null, null);
INSERT INTO `复仇者联盟_seats` VALUES ('复仇者联盟', 'A', '6', '7', null, null);
INSERT INTO `复仇者联盟_seats` VALUES ('复仇者联盟', 'A', '6', '8', null, null);
INSERT INTO `复仇者联盟_seats` VALUES ('复仇者联盟', 'A', '6', '9', null, null);
INSERT INTO `复仇者联盟_seats` VALUES ('复仇者联盟', 'A', '7', '1', null, null);
INSERT INTO `复仇者联盟_seats` VALUES ('复仇者联盟', 'A', '7', '10', null, null);
INSERT INTO `复仇者联盟_seats` VALUES ('复仇者联盟', 'A', '7', '2', null, null);
INSERT INTO `复仇者联盟_seats` VALUES ('复仇者联盟', 'A', '7', '3', null, null);
INSERT INTO `复仇者联盟_seats` VALUES ('复仇者联盟', 'A', '7', '4', null, null);
INSERT INTO `复仇者联盟_seats` VALUES ('复仇者联盟', 'A', '7', '5', null, null);
INSERT INTO `复仇者联盟_seats` VALUES ('复仇者联盟', 'A', '7', '6', null, null);
INSERT INTO `复仇者联盟_seats` VALUES ('复仇者联盟', 'A', '7', '7', null, null);
INSERT INTO `复仇者联盟_seats` VALUES ('复仇者联盟', 'A', '7', '8', null, null);
INSERT INTO `复仇者联盟_seats` VALUES ('复仇者联盟', 'A', '7', '9', null, null);
INSERT INTO `复仇者联盟_seats` VALUES ('复仇者联盟', 'A', '8', '1', null, null);
INSERT INTO `复仇者联盟_seats` VALUES ('复仇者联盟', 'A', '8', '10', null, null);
INSERT INTO `复仇者联盟_seats` VALUES ('复仇者联盟', 'A', '8', '2', null, null);
INSERT INTO `复仇者联盟_seats` VALUES ('复仇者联盟', 'A', '8', '3', null, null);
INSERT INTO `复仇者联盟_seats` VALUES ('复仇者联盟', 'A', '8', '4', null, null);
INSERT INTO `复仇者联盟_seats` VALUES ('复仇者联盟', 'A', '8', '5', null, null);
INSERT INTO `复仇者联盟_seats` VALUES ('复仇者联盟', 'A', '8', '6', null, null);
INSERT INTO `复仇者联盟_seats` VALUES ('复仇者联盟', 'A', '8', '7', null, null);
INSERT INTO `复仇者联盟_seats` VALUES ('复仇者联盟', 'A', '8', '8', null, null);
INSERT INTO `复仇者联盟_seats` VALUES ('复仇者联盟', 'A', '8', '9', null, null);
INSERT INTO `复仇者联盟_seats` VALUES ('复仇者联盟', 'A', '9', '1', null, null);
INSERT INTO `复仇者联盟_seats` VALUES ('复仇者联盟', 'A', '9', '10', null, null);
INSERT INTO `复仇者联盟_seats` VALUES ('复仇者联盟', 'A', '9', '2', null, null);
INSERT INTO `复仇者联盟_seats` VALUES ('复仇者联盟', 'A', '9', '3', null, null);
INSERT INTO `复仇者联盟_seats` VALUES ('复仇者联盟', 'A', '9', '4', null, null);
INSERT INTO `复仇者联盟_seats` VALUES ('复仇者联盟', 'A', '9', '5', null, null);
INSERT INTO `复仇者联盟_seats` VALUES ('复仇者联盟', 'A', '9', '6', null, null);
INSERT INTO `复仇者联盟_seats` VALUES ('复仇者联盟', 'A', '9', '7', null, null);
INSERT INTO `复仇者联盟_seats` VALUES ('复仇者联盟', 'A', '9', '8', null, null);
INSERT INTO `复仇者联盟_seats` VALUES ('复仇者联盟', 'A', '9', '9', null, null);

-- ----------------------------
-- Table structure for 黑豹-漫威超级英雄电影_seats
-- ----------------------------
DROP TABLE IF EXISTS `黑豹-漫威超级英雄电影_seats`;
CREATE TABLE `黑豹-漫威超级英雄电影_seats` (
  `pname` varchar(255) NOT NULL,
  `stype` varchar(255) NOT NULL,
  `row` varchar(255) NOT NULL,
  `col` varchar(255) NOT NULL,
  `orderid` int(20) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`pname`,`stype`,`row`,`col`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of 黑豹-漫威超级英雄电影_seats
-- ----------------------------
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'A座', '1', '1', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'A座', '1', '10', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'A座', '1', '2', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'A座', '1', '3', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'A座', '1', '4', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'A座', '1', '5', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'A座', '1', '6', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'A座', '1', '7', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'A座', '1', '8', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'A座', '1', '9', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'A座', '10', '1', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'A座', '10', '10', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'A座', '10', '2', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'A座', '10', '3', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'A座', '10', '4', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'A座', '10', '5', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'A座', '10', '6', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'A座', '10', '7', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'A座', '10', '8', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'A座', '10', '9', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'A座', '2', '1', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'A座', '2', '10', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'A座', '2', '2', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'A座', '2', '3', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'A座', '2', '4', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'A座', '2', '5', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'A座', '2', '6', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'A座', '2', '7', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'A座', '2', '8', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'A座', '2', '9', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'A座', '3', '1', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'A座', '3', '10', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'A座', '3', '2', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'A座', '3', '3', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'A座', '3', '4', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'A座', '3', '5', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'A座', '3', '6', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'A座', '3', '7', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'A座', '3', '8', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'A座', '3', '9', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'A座', '4', '1', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'A座', '4', '10', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'A座', '4', '2', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'A座', '4', '3', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'A座', '4', '4', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'A座', '4', '5', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'A座', '4', '6', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'A座', '4', '7', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'A座', '4', '8', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'A座', '4', '9', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'A座', '5', '1', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'A座', '5', '10', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'A座', '5', '2', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'A座', '5', '3', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'A座', '5', '4', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'A座', '5', '5', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'A座', '5', '6', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'A座', '5', '7', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'A座', '5', '8', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'A座', '5', '9', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'A座', '6', '1', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'A座', '6', '10', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'A座', '6', '2', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'A座', '6', '3', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'A座', '6', '4', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'A座', '6', '5', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'A座', '6', '6', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'A座', '6', '7', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'A座', '6', '8', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'A座', '6', '9', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'A座', '7', '1', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'A座', '7', '10', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'A座', '7', '2', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'A座', '7', '3', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'A座', '7', '4', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'A座', '7', '5', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'A座', '7', '6', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'A座', '7', '7', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'A座', '7', '8', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'A座', '7', '9', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'A座', '8', '1', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'A座', '8', '10', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'A座', '8', '2', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'A座', '8', '3', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'A座', '8', '4', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'A座', '8', '5', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'A座', '8', '6', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'A座', '8', '7', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'A座', '8', '8', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'A座', '8', '9', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'A座', '9', '1', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'A座', '9', '10', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'A座', '9', '2', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'A座', '9', '3', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'A座', '9', '4', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'A座', '9', '5', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'A座', '9', '6', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'A座', '9', '7', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'A座', '9', '8', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'A座', '9', '9', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'B座', '1', '1', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'B座', '1', '10', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'B座', '1', '2', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'B座', '1', '3', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'B座', '1', '4', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'B座', '1', '5', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'B座', '1', '6', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'B座', '1', '7', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'B座', '1', '8', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'B座', '1', '9', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'B座', '10', '1', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'B座', '10', '10', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'B座', '10', '2', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'B座', '10', '3', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'B座', '10', '4', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'B座', '10', '5', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'B座', '10', '6', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'B座', '10', '7', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'B座', '10', '8', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'B座', '10', '9', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'B座', '2', '1', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'B座', '2', '10', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'B座', '2', '2', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'B座', '2', '3', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'B座', '2', '4', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'B座', '2', '5', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'B座', '2', '6', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'B座', '2', '7', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'B座', '2', '8', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'B座', '2', '9', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'B座', '3', '1', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'B座', '3', '10', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'B座', '3', '2', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'B座', '3', '3', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'B座', '3', '4', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'B座', '3', '5', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'B座', '3', '6', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'B座', '3', '7', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'B座', '3', '8', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'B座', '3', '9', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'B座', '4', '1', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'B座', '4', '10', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'B座', '4', '2', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'B座', '4', '3', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'B座', '4', '4', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'B座', '4', '5', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'B座', '4', '6', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'B座', '4', '7', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'B座', '4', '8', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'B座', '4', '9', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'B座', '5', '1', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'B座', '5', '10', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'B座', '5', '2', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'B座', '5', '3', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'B座', '5', '4', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'B座', '5', '5', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'B座', '5', '6', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'B座', '5', '7', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'B座', '5', '8', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'B座', '5', '9', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'B座', '6', '1', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'B座', '6', '10', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'B座', '6', '2', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'B座', '6', '3', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'B座', '6', '4', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'B座', '6', '5', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'B座', '6', '6', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'B座', '6', '7', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'B座', '6', '8', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'B座', '6', '9', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'B座', '7', '1', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'B座', '7', '10', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'B座', '7', '2', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'B座', '7', '3', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'B座', '7', '4', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'B座', '7', '5', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'B座', '7', '6', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'B座', '7', '7', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'B座', '7', '8', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'B座', '7', '9', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'B座', '8', '1', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'B座', '8', '10', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'B座', '8', '2', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'B座', '8', '3', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'B座', '8', '4', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'B座', '8', '5', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'B座', '8', '6', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'B座', '8', '7', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'B座', '8', '8', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'B座', '8', '9', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'B座', '9', '1', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'B座', '9', '10', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'B座', '9', '2', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'B座', '9', '3', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'B座', '9', '4', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'B座', '9', '5', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'B座', '9', '6', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'B座', '9', '7', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'B座', '9', '8', null, null);
INSERT INTO `黑豹-漫威超级英雄电影_seats` VALUES ('黑豹-漫威超级英雄电影', 'B座', '9', '9', null, null);
SET FOREIGN_KEY_CHECKS=1;
