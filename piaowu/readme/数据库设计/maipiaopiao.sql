/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50718
Source Host           : localhost:3306
Source Database       : maipiaopiao

Target Server Type    : MYSQL
Target Server Version : 50718
File Encoding         : 65001

Date: 2018-03-06 13:07:26
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for memberorder
-- ----------------------------
DROP TABLE IF EXISTS `memberorder`;
CREATE TABLE `memberorder` (
  `uname` varchar(20) DEFAULT NULL,
  `placeid` int(11) DEFAULT NULL COMMENT '场馆id',
  `eventid` int(11) DEFAULT NULL COMMENT '活动id',
  `state` varchar(20) DEFAULT NULL COMMENT 'weizhifu、yizhifu、quxiao、wancheng',
  `seatnum` int(11) DEFAULT NULL COMMENT '订票的座位数量',
  `seatarrange` int(11) DEFAULT NULL COMMENT '座位安排id',
  `booktime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `charge` int(11) DEFAULT NULL,
  `pay` int(11) DEFAULT NULL,
  `ticketid` int(11) DEFAULT NULL COMMENT '使用的优惠券'
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
-- Table structure for seatarrange
-- ----------------------------
DROP TABLE IF EXISTS `seatarrange`;
CREATE TABLE `seatarrange` (
  `seatarrangeid` int(11) NOT NULL,
  `seatindex` int(11) NOT NULL,
  `part` varchar(20) DEFAULT NULL COMMENT '座位类型（一等、二等、）（a去，b区）',
  `row` int(11) DEFAULT NULL,
  `colum` int(11) DEFAULT NULL,
  PRIMARY KEY (`seatindex`,`seatarrangeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='座位安排表';

-- ----------------------------
-- Records of seatarrange
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
SET FOREIGN_KEY_CHECKS=1;
