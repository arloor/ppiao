-- MySQL dump 10.13  Distrib 5.7.21, for Win64 (x86_64)
--
-- Host: mysql.moontell.cn    Database: maipiaopiao
-- ------------------------------------------------------
-- Server version	5.5.56-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `至暗时刻_seats`
--

DROP TABLE IF EXISTS `至暗时刻_seats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `至暗时刻_seats` (
  `pname` varchar(255) NOT NULL,
  `stype` varchar(255) NOT NULL,
  `row` int(10) NOT NULL,
  `col` int(10) NOT NULL,
  `uname` varchar(255) NOT NULL DEFAULT 'untaken',
  `status` varchar(255) NOT NULL DEFAULT 'untaken',
  PRIMARY KEY (`pname`,`stype`,`row`,`col`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `至暗时刻_seats`
--

LOCK TABLES `至暗时刻_seats` WRITE;
/*!40000 ALTER TABLE `至暗时刻_seats` DISABLE KEYS */;
INSERT INTO `至暗时刻_seats` (`pname`, `stype`, `row`, `col`, `uname`, `status`) VALUES ('至暗时刻','A',1,1,'guestorder','taken'),('至暗时刻','A',1,2,'guestorder','taken'),('至暗时刻','A',1,3,'guestorder','taken'),('至暗时刻','A',1,4,'guestorder','taken'),('至暗时刻','A',1,5,'guestorder','taken'),('至暗时刻','A',1,6,'guestorder','taken'),('至暗时刻','A',1,7,'guestorder','taken'),('至暗时刻','A',1,8,'guestorder','taken'),('至暗时刻','A',1,9,'guestorder','taken'),('至暗时刻','A',1,10,'guestorder','taken'),('至暗时刻','A',2,1,'untaken','untaken'),('至暗时刻','A',2,2,'untaken','untaken'),('至暗时刻','A',2,3,'untaken','untaken'),('至暗时刻','A',2,4,'untaken','untaken'),('至暗时刻','A',2,5,'untaken','untaken'),('至暗时刻','A',2,6,'untaken','untaken'),('至暗时刻','A',2,7,'untaken','untaken'),('至暗时刻','A',2,8,'untaken','untaken'),('至暗时刻','A',2,9,'untaken','untaken'),('至暗时刻','A',2,10,'untaken','untaken'),('至暗时刻','A',3,1,'untaken','untaken'),('至暗时刻','A',3,2,'untaken','untaken'),('至暗时刻','A',3,3,'untaken','untaken'),('至暗时刻','A',3,4,'untaken','untaken'),('至暗时刻','A',3,5,'untaken','untaken'),('至暗时刻','A',3,6,'untaken','untaken'),('至暗时刻','A',3,7,'untaken','untaken'),('至暗时刻','A',3,8,'untaken','untaken'),('至暗时刻','A',3,9,'untaken','untaken'),('至暗时刻','A',3,10,'untaken','untaken'),('至暗时刻','A',4,1,'untaken','untaken'),('至暗时刻','A',4,2,'untaken','untaken'),('至暗时刻','A',4,3,'untaken','untaken'),('至暗时刻','A',4,4,'untaken','untaken'),('至暗时刻','A',4,5,'untaken','untaken'),('至暗时刻','A',4,6,'untaken','untaken'),('至暗时刻','A',4,7,'untaken','untaken'),('至暗时刻','A',4,8,'untaken','untaken'),('至暗时刻','A',4,9,'untaken','untaken'),('至暗时刻','A',4,10,'untaken','untaken'),('至暗时刻','A',5,1,'untaken','untaken'),('至暗时刻','A',5,2,'untaken','untaken'),('至暗时刻','A',5,3,'untaken','untaken'),('至暗时刻','A',5,4,'untaken','untaken'),('至暗时刻','A',5,5,'untaken','untaken'),('至暗时刻','A',5,6,'untaken','untaken'),('至暗时刻','A',5,7,'untaken','untaken'),('至暗时刻','A',5,8,'untaken','untaken'),('至暗时刻','A',5,9,'untaken','untaken'),('至暗时刻','A',5,10,'untaken','untaken'),('至暗时刻','A',6,1,'untaken','untaken'),('至暗时刻','A',6,2,'untaken','untaken'),('至暗时刻','A',6,3,'untaken','untaken'),('至暗时刻','A',6,4,'untaken','untaken'),('至暗时刻','A',6,5,'untaken','untaken'),('至暗时刻','A',6,6,'untaken','untaken'),('至暗时刻','A',6,7,'untaken','untaken'),('至暗时刻','A',6,8,'untaken','untaken'),('至暗时刻','A',6,9,'untaken','untaken'),('至暗时刻','A',6,10,'untaken','untaken'),('至暗时刻','A',7,1,'untaken','untaken'),('至暗时刻','A',7,2,'untaken','untaken'),('至暗时刻','A',7,3,'untaken','untaken'),('至暗时刻','A',7,4,'untaken','untaken'),('至暗时刻','A',7,5,'untaken','untaken'),('至暗时刻','A',7,6,'untaken','untaken'),('至暗时刻','A',7,7,'untaken','untaken'),('至暗时刻','A',7,8,'untaken','untaken'),('至暗时刻','A',7,9,'untaken','untaken'),('至暗时刻','A',7,10,'untaken','untaken'),('至暗时刻','A',8,1,'untaken','untaken'),('至暗时刻','A',8,2,'untaken','untaken'),('至暗时刻','A',8,3,'untaken','untaken'),('至暗时刻','A',8,4,'untaken','untaken'),('至暗时刻','A',8,5,'untaken','untaken'),('至暗时刻','A',8,6,'untaken','untaken'),('至暗时刻','A',8,7,'untaken','untaken'),('至暗时刻','A',8,8,'untaken','untaken'),('至暗时刻','A',8,9,'untaken','untaken'),('至暗时刻','A',8,10,'untaken','untaken'),('至暗时刻','A',9,1,'untaken','untaken'),('至暗时刻','A',9,2,'untaken','untaken'),('至暗时刻','A',9,3,'untaken','untaken'),('至暗时刻','A',9,4,'untaken','untaken'),('至暗时刻','A',9,5,'untaken','untaken'),('至暗时刻','A',9,6,'untaken','untaken'),('至暗时刻','A',9,7,'untaken','untaken'),('至暗时刻','A',9,8,'untaken','untaken'),('至暗时刻','A',9,9,'untaken','untaken'),('至暗时刻','A',9,10,'untaken','untaken'),('至暗时刻','A',10,1,'untaken','untaken'),('至暗时刻','A',10,2,'untaken','untaken'),('至暗时刻','A',10,3,'untaken','untaken'),('至暗时刻','A',10,4,'untaken','untaken'),('至暗时刻','A',10,5,'untaken','untaken'),('至暗时刻','A',10,6,'untaken','untaken'),('至暗时刻','A',10,7,'untaken','untaken'),('至暗时刻','A',10,8,'guestorder','taken'),('至暗时刻','A',10,9,'guestorder','taken'),('至暗时刻','A',10,10,'untaken','untaken');
/*!40000 ALTER TABLE `至暗时刻_seats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `黑豹_seats`
--

DROP TABLE IF EXISTS `黑豹_seats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `黑豹_seats` (
  `pname` varchar(255) NOT NULL,
  `stype` varchar(255) NOT NULL,
  `row` int(10) NOT NULL,
  `col` int(10) NOT NULL,
  `uname` varchar(255) NOT NULL DEFAULT 'untaken',
  `status` varchar(255) NOT NULL DEFAULT 'untaken',
  PRIMARY KEY (`pname`,`stype`,`row`,`col`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `黑豹_seats`
--

LOCK TABLES `黑豹_seats` WRITE;
/*!40000 ALTER TABLE `黑豹_seats` DISABLE KEYS */;
INSERT INTO `黑豹_seats` (`pname`, `stype`, `row`, `col`, `uname`, `status`) VALUES ('黑豹','A座',1,1,'guestorder','taken'),('黑豹','A座',1,2,'guestorder','taken'),('黑豹','A座',1,3,'untaken','untaken'),('黑豹','A座',1,4,'untaken','untaken'),('黑豹','A座',1,5,'untaken','untaken'),('黑豹','A座',1,6,'untaken','untaken'),('黑豹','A座',1,7,'untaken','untaken'),('黑豹','A座',1,8,'untaken','untaken'),('黑豹','A座',1,9,'untaken','untaken'),('黑豹','A座',1,10,'untaken','untaken'),('黑豹','A座',2,1,'untaken','untaken'),('黑豹','A座',2,2,'untaken','untaken'),('黑豹','A座',2,3,'untaken','untaken'),('黑豹','A座',2,4,'untaken','untaken'),('黑豹','A座',2,5,'untaken','untaken'),('黑豹','A座',2,6,'untaken','untaken'),('黑豹','A座',2,7,'untaken','untaken'),('黑豹','A座',2,8,'untaken','untaken'),('黑豹','A座',2,9,'untaken','untaken'),('黑豹','A座',2,10,'untaken','untaken'),('黑豹','A座',3,1,'untaken','untaken'),('黑豹','A座',3,2,'untaken','untaken'),('黑豹','A座',3,3,'untaken','untaken'),('黑豹','A座',3,4,'untaken','untaken'),('黑豹','A座',3,5,'untaken','untaken'),('黑豹','A座',3,6,'untaken','untaken'),('黑豹','A座',3,7,'untaken','untaken'),('黑豹','A座',3,8,'untaken','untaken'),('黑豹','A座',3,9,'untaken','untaken'),('黑豹','A座',3,10,'untaken','untaken'),('黑豹','A座',4,1,'untaken','untaken'),('黑豹','A座',4,2,'untaken','untaken'),('黑豹','A座',4,3,'untaken','untaken'),('黑豹','A座',4,4,'untaken','untaken'),('黑豹','A座',4,5,'untaken','untaken'),('黑豹','A座',4,6,'untaken','untaken'),('黑豹','A座',4,7,'untaken','untaken'),('黑豹','A座',4,8,'untaken','untaken'),('黑豹','A座',4,9,'untaken','untaken'),('黑豹','A座',4,10,'untaken','untaken'),('黑豹','A座',5,1,'untaken','untaken'),('黑豹','A座',5,2,'untaken','untaken'),('黑豹','A座',5,3,'untaken','untaken'),('黑豹','A座',5,4,'untaken','untaken'),('黑豹','A座',5,5,'untaken','untaken'),('黑豹','A座',5,6,'untaken','untaken'),('黑豹','A座',5,7,'untaken','untaken'),('黑豹','A座',5,8,'untaken','untaken'),('黑豹','A座',5,9,'untaken','untaken'),('黑豹','A座',5,10,'untaken','untaken'),('黑豹','A座',6,1,'untaken','untaken'),('黑豹','A座',6,2,'untaken','untaken'),('黑豹','A座',6,3,'untaken','untaken'),('黑豹','A座',6,4,'untaken','untaken'),('黑豹','A座',6,5,'untaken','untaken'),('黑豹','A座',6,6,'untaken','untaken'),('黑豹','A座',6,7,'untaken','untaken'),('黑豹','A座',6,8,'untaken','untaken'),('黑豹','A座',6,9,'untaken','untaken'),('黑豹','A座',6,10,'untaken','untaken'),('黑豹','A座',7,1,'untaken','untaken'),('黑豹','A座',7,2,'untaken','untaken'),('黑豹','A座',7,3,'untaken','untaken'),('黑豹','A座',7,4,'untaken','untaken'),('黑豹','A座',7,5,'untaken','untaken'),('黑豹','A座',7,6,'untaken','untaken'),('黑豹','A座',7,7,'untaken','untaken'),('黑豹','A座',7,8,'untaken','untaken'),('黑豹','A座',7,9,'untaken','untaken'),('黑豹','A座',7,10,'untaken','untaken'),('黑豹','A座',8,1,'untaken','untaken'),('黑豹','A座',8,2,'untaken','untaken'),('黑豹','A座',8,3,'untaken','untaken'),('黑豹','A座',8,4,'untaken','untaken'),('黑豹','A座',8,5,'untaken','untaken'),('黑豹','A座',8,6,'untaken','untaken'),('黑豹','A座',8,7,'untaken','untaken'),('黑豹','A座',8,8,'untaken','untaken'),('黑豹','A座',8,9,'untaken','untaken'),('黑豹','A座',8,10,'untaken','untaken'),('黑豹','A座',9,1,'untaken','untaken'),('黑豹','A座',9,2,'untaken','untaken'),('黑豹','A座',9,3,'untaken','untaken'),('黑豹','A座',9,4,'untaken','untaken'),('黑豹','A座',9,5,'untaken','untaken'),('黑豹','A座',9,6,'untaken','untaken'),('黑豹','A座',9,7,'untaken','untaken'),('黑豹','A座',9,8,'untaken','untaken'),('黑豹','A座',9,9,'untaken','untaken'),('黑豹','A座',9,10,'untaken','untaken'),('黑豹','A座',10,1,'untaken','untaken'),('黑豹','A座',10,2,'untaken','untaken'),('黑豹','A座',10,3,'untaken','untaken'),('黑豹','A座',10,4,'untaken','untaken'),('黑豹','A座',10,5,'untaken','untaken'),('黑豹','A座',10,6,'untaken','untaken'),('黑豹','A座',10,7,'untaken','untaken'),('黑豹','A座',10,8,'untaken','untaken'),('黑豹','A座',10,9,'untaken','untaken'),('黑豹','A座',10,10,'untaken','untaken'),('黑豹','B座',1,1,'untaken','untaken'),('黑豹','B座',1,2,'untaken','untaken'),('黑豹','B座',1,3,'untaken','untaken'),('黑豹','B座',1,4,'untaken','untaken'),('黑豹','B座',1,5,'untaken','untaken'),('黑豹','B座',1,6,'untaken','untaken'),('黑豹','B座',1,7,'untaken','untaken'),('黑豹','B座',1,8,'untaken','untaken'),('黑豹','B座',1,9,'untaken','untaken'),('黑豹','B座',1,10,'untaken','untaken'),('黑豹','B座',2,1,'untaken','untaken'),('黑豹','B座',2,2,'untaken','untaken'),('黑豹','B座',2,3,'untaken','untaken'),('黑豹','B座',2,4,'untaken','untaken'),('黑豹','B座',2,5,'untaken','untaken'),('黑豹','B座',2,6,'untaken','untaken'),('黑豹','B座',2,7,'untaken','untaken'),('黑豹','B座',2,8,'untaken','untaken'),('黑豹','B座',2,9,'untaken','untaken'),('黑豹','B座',2,10,'untaken','untaken'),('黑豹','B座',3,1,'untaken','untaken'),('黑豹','B座',3,2,'untaken','untaken'),('黑豹','B座',3,3,'untaken','untaken'),('黑豹','B座',3,4,'untaken','untaken'),('黑豹','B座',3,5,'untaken','untaken'),('黑豹','B座',3,6,'untaken','untaken'),('黑豹','B座',3,7,'untaken','untaken'),('黑豹','B座',3,8,'untaken','untaken'),('黑豹','B座',3,9,'untaken','untaken'),('黑豹','B座',3,10,'untaken','untaken'),('黑豹','B座',4,1,'untaken','untaken'),('黑豹','B座',4,2,'untaken','untaken'),('黑豹','B座',4,3,'untaken','untaken'),('黑豹','B座',4,4,'untaken','untaken'),('黑豹','B座',4,5,'untaken','untaken'),('黑豹','B座',4,6,'untaken','untaken'),('黑豹','B座',4,7,'untaken','untaken'),('黑豹','B座',4,8,'untaken','untaken'),('黑豹','B座',4,9,'untaken','untaken'),('黑豹','B座',4,10,'untaken','untaken'),('黑豹','B座',5,1,'untaken','untaken'),('黑豹','B座',5,2,'untaken','untaken'),('黑豹','B座',5,3,'untaken','untaken'),('黑豹','B座',5,4,'untaken','untaken'),('黑豹','B座',5,5,'untaken','untaken'),('黑豹','B座',5,6,'untaken','untaken'),('黑豹','B座',5,7,'untaken','untaken'),('黑豹','B座',5,8,'untaken','untaken'),('黑豹','B座',5,9,'untaken','untaken'),('黑豹','B座',5,10,'untaken','untaken'),('黑豹','B座',6,1,'untaken','untaken'),('黑豹','B座',6,2,'untaken','untaken'),('黑豹','B座',6,3,'untaken','untaken'),('黑豹','B座',6,4,'untaken','untaken'),('黑豹','B座',6,5,'untaken','untaken'),('黑豹','B座',6,6,'untaken','untaken'),('黑豹','B座',6,7,'untaken','untaken'),('黑豹','B座',6,8,'untaken','untaken'),('黑豹','B座',6,9,'untaken','untaken'),('黑豹','B座',6,10,'untaken','untaken'),('黑豹','B座',7,1,'untaken','untaken'),('黑豹','B座',7,2,'untaken','untaken'),('黑豹','B座',7,3,'untaken','untaken'),('黑豹','B座',7,4,'untaken','untaken'),('黑豹','B座',7,5,'untaken','untaken'),('黑豹','B座',7,6,'untaken','untaken'),('黑豹','B座',7,7,'untaken','untaken'),('黑豹','B座',7,8,'untaken','untaken'),('黑豹','B座',7,9,'untaken','untaken'),('黑豹','B座',7,10,'untaken','untaken'),('黑豹','B座',8,1,'untaken','untaken'),('黑豹','B座',8,2,'untaken','untaken'),('黑豹','B座',8,3,'untaken','untaken'),('黑豹','B座',8,4,'untaken','untaken'),('黑豹','B座',8,5,'untaken','untaken'),('黑豹','B座',8,6,'untaken','untaken'),('黑豹','B座',8,7,'untaken','untaken'),('黑豹','B座',8,8,'untaken','untaken'),('黑豹','B座',8,9,'untaken','untaken'),('黑豹','B座',8,10,'untaken','untaken'),('黑豹','B座',9,1,'untaken','untaken'),('黑豹','B座',9,2,'untaken','untaken'),('黑豹','B座',9,3,'untaken','untaken'),('黑豹','B座',9,4,'untaken','untaken'),('黑豹','B座',9,5,'untaken','untaken'),('黑豹','B座',9,6,'untaken','untaken'),('黑豹','B座',9,7,'untaken','untaken'),('黑豹','B座',9,8,'untaken','untaken'),('黑豹','B座',9,9,'untaken','untaken'),('黑豹','B座',9,10,'untaken','untaken'),('黑豹','B座',10,1,'untaken','untaken'),('黑豹','B座',10,2,'untaken','untaken'),('黑豹','B座',10,3,'untaken','untaken'),('黑豹','B座',10,4,'untaken','untaken'),('黑豹','B座',10,5,'untaken','untaken'),('黑豹','B座',10,6,'untaken','untaken'),('黑豹','B座',10,7,'untaken','untaken'),('黑豹','B座',10,8,'untaken','untaken'),('黑豹','B座',10,9,'untaken','untaken'),('黑豹','B座',10,10,'untaken','untaken');
/*!40000 ALTER TABLE `黑豹_seats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guestorder`
--

DROP TABLE IF EXISTS `guestorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guestorder` (
  `pname` varchar(255) NOT NULL COMMENT '活动id',
  `seatstype` varchar(255) DEFAULT NULL,
  `seatnum` int(11) DEFAULT NULL COMMENT '订票的座位数量',
  `booktime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `pay` int(11) DEFAULT NULL,
  PRIMARY KEY (`pname`,`booktime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='非会员订单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guestorder`
--

LOCK TABLES `guestorder` WRITE;
/*!40000 ALTER TABLE `guestorder` DISABLE KEYS */;
INSERT INTO `guestorder` (`pname`, `seatstype`, `seatnum`, `booktime`, `pay`) VALUES ('guest','A',10,'2018-03-20 09:42:08',100),('至暗时刻','A',10,'2018-03-20 09:44:43',100),('至暗时刻','A',10,'2018-03-20 09:57:38',550),('黑豹','A',10,'2018-03-20 09:45:02',100),('黑豹','A',10,'2018-03-20 09:45:58',100),('黑豹','A座',10,'2018-03-20 09:46:32',100);
/*!40000 ALTER TABLE `guestorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `halls`
--

DROP TABLE IF EXISTS `halls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `halls` (
  `vname` varchar(255) NOT NULL,
  `hname` varchar(20) NOT NULL COMMENT '厅 比如 杜比音响厅',
  `stype` varchar(255) NOT NULL COMMENT '座位类型，比如 A B，内场，外场',
  `rownum` int(7) DEFAULT NULL COMMENT '排数',
  `colnum` int(7) unsigned zerofill DEFAULT NULL COMMENT '列数',
  PRIMARY KEY (`vname`,`hname`,`stype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='场馆的厅';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `halls`
--

LOCK TABLES `halls` WRITE;
/*!40000 ALTER TABLE `halls` DISABLE KEYS */;
INSERT INTO `halls` (`vname`, `hname`, `stype`, `rownum`, `colnum`) VALUES ('幸福蓝海国际影城','1厅','A',10,0000010),('幸福蓝海国际影城','杜比厅','A座',10,0000010),('幸福蓝海国际影城','杜比厅','B座',10,0000010);
/*!40000 ALTER TABLE `halls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `halls_temp`
--

DROP TABLE IF EXISTS `halls_temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `halls_temp` (
  `vname` varchar(255) NOT NULL,
  `hname` varchar(20) NOT NULL COMMENT '厅 比如 杜比音响厅',
  `stype` varchar(255) NOT NULL COMMENT '座位类型，比如 A B，内场，外场',
  `rownum` int(7) DEFAULT NULL COMMENT '排数',
  `colnum` int(7) unsigned zerofill DEFAULT NULL COMMENT '列数',
  PRIMARY KEY (`vname`,`hname`,`stype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='暂存场馆的厅';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `halls_temp`
--

LOCK TABLES `halls_temp` WRITE;
/*!40000 ALTER TABLE `halls_temp` DISABLE KEYS */;
INSERT INTO `halls_temp` (`vname`, `hname`, `stype`, `rownum`, `colnum`) VALUES ('幸福蓝海国际影城','杜比厅','A',10,0000009),('幸福蓝海国际影城','杜比厅','B',10,0000009),('幸福蓝海国际影城','鸟巢体育馆','A',20,0000009),('幸福蓝海国际影城','鸟巢体育馆','B',20,0000009);
/*!40000 ALTER TABLE `halls_temp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `memberorder`
--

DROP TABLE IF EXISTS `memberorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `memberorder` (
  `uname` varchar(20) NOT NULL,
  `pname` varchar(255) NOT NULL COMMENT '活动id',
  `state` varchar(20) DEFAULT NULL COMMENT '未支付、已支付、取消、完成',
  `seatnum` int(11) DEFAULT NULL COMMENT '订票的座位数量',
  `seatarranged` int(1) DEFAULT NULL COMMENT '是否安排了座位，安排为1，未安排为0',
  `booktime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `charge` int(11) DEFAULT NULL,
  `pay` int(11) DEFAULT NULL,
  `ticketname` varchar(255) DEFAULT NULL COMMENT '使用的优惠券',
  PRIMARY KEY (`uname`,`pname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='使用网站的订单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `memberorder`
--

LOCK TABLES `memberorder` WRITE;
/*!40000 ALTER TABLE `memberorder` DISABLE KEYS */;
INSERT INTO `memberorder` (`uname`, `pname`, `state`, `seatnum`, `seatarranged`, `booktime`, `charge`, `pay`, `ticketname`) VALUES ('arloor','至暗时刻','已取消',20,0,'2018-03-17 14:56:10',1100,1100,'不使用优惠卷'),('arloor','黑豹','已取消',2,1,'2018-03-17 13:41:13',200,200,'不使用优惠卷'),('test1','至暗时刻','已取消',6,1,'2018-03-17 11:22:35',330,330,'不使用优惠卷'),('test1','黑豹','已取消',20,0,'2018-03-17 13:46:33',1700,1700,'不使用优惠卷'),('test2','至暗时刻','已取消',2,1,'2018-03-17 11:23:16',110,110,'不使用优惠卷'),('test2','黑豹','已取消',5,1,'2018-03-17 11:27:23',500,500,'不使用优惠卷');
/*!40000 ALTER TABLE `memberorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` (`email`, `uname`, `passwd`, `role`, `paykey`, `balance`, `bonus`, `paynum`, `timesign`, `timecancel`, `pin`, `pinindex`) VALUES ('1293181335@qq.com','arloor','arloor','ROLE_MEMBER','123456',80,2620,3620,'2018-02-01 21:29:47',NULL,'5666',71),('1293181335@qq.com','test1','123456','ROLE_MEMBER','123456',665,4435,4435,'2018-03-17 11:20:45',NULL,'47032',1),('1293181335@qq.com','test2','123456','ROLE_MEMBER','123456',0,0,0,'2018-03-17 11:21:28',NULL,'52706',1);
/*!40000 ALTER TABLE `members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `memberticket`
--

DROP TABLE IF EXISTS `memberticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `memberticket` (
  `ticketid` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户拥有的券的表示',
  `uname` varchar(20) DEFAULT NULL,
  `ticketname` varchar(20) DEFAULT NULL,
  `used` int(11) DEFAULT '0' COMMENT '0未使用',
  `gettime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ticketid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='用户所有优惠券';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `memberticket`
--

LOCK TABLES `memberticket` WRITE;
/*!40000 ALTER TABLE `memberticket` DISABLE KEYS */;
INSERT INTO `memberticket` (`ticketid`, `uname`, `ticketname`, `used`, `gettime`) VALUES (1,'arloor','3月新用户尊享',0,'2018-03-11 21:20:32'),(2,'arloor','3月积分兑换',0,'2018-03-12 05:23:14');
/*!40000 ALTER TABLE `memberticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pfares`
--

DROP TABLE IF EXISTS `pfares`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pfares` (
  `pname` varchar(255) NOT NULL COMMENT '演出id',
  `stype` varchar(255) NOT NULL COMMENT '座位类型',
  `fares` decimal(10,2) DEFAULT NULL COMMENT '价格',
  PRIMARY KEY (`pname`,`stype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='计划的分座位等级的价格表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pfares`
--

LOCK TABLES `pfares` WRITE;
/*!40000 ALTER TABLE `pfares` DISABLE KEYS */;
INSERT INTO `pfares` (`pname`, `stype`, `fares`) VALUES ('至暗时刻','A',55.00),('黑豹','A座',100.00),('黑豹','B座',85.00);
/*!40000 ALTER TABLE `pfares` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plays`
--

DROP TABLE IF EXISTS `plays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plays`
--

LOCK TABLES `plays` WRITE;
/*!40000 ALTER TABLE `plays` DISABLE KEYS */;
INSERT INTO `plays` (`pname`, `vname`, `hname`, `pdate`, `ptime`, `ptype`, `pinfo`) VALUES ('至暗时刻','幸福蓝海国际影城','1厅','2018-03-24','10:25','电影','至暗时刻的小老头'),('黑豹','幸福蓝海国际影城','杜比厅','2018-04-04','17:12','电影','就是超级好看的电影');
/*!40000 ALTER TABLE `plays` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ticket` (
  `ticketname` varchar(20) NOT NULL COMMENT '优惠券名',
  `type` varchar(255) DEFAULT '折扣' COMMENT '优惠券类型 折扣 立减：根据此值确定param,,的含义',
  `param0` varchar(10) DEFAULT '',
  `param1` varchar(10) DEFAULT '',
  `param2` varchar(10) DEFAULT '',
  `left` int(11) DEFAULT NULL COMMENT '剩余数量',
  PRIMARY KEY (`ticketname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='平台优惠券';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
INSERT INTO `ticket` (`ticketname`, `type`, `param0`, `param1`, `param2`, `left`) VALUES ('3月新用户尊享','折扣','300','0.8','',49),('3月积分兑换','立减','100','5','',38);
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venues`
--

DROP TABLE IF EXISTS `venues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venues`
--

LOCK TABLES `venues` WRITE;
/*!40000 ALTER TABLE `venues` DISABLE KEYS */;
INSERT INTO `venues` (`vid`, `vname`, `vpasswd`, `vaddr`, `vstatus`, `vinfo`, `role`) VALUES (1,'幸福蓝海国际影城','123456','汉口路222号','valid','暂无简介','ROLE_VENUES');
/*!40000 ALTER TABLE `venues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venues_temp`
--

DROP TABLE IF EXISTS `venues_temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `venues_temp` (
  `vname` varchar(255) NOT NULL,
  `vpasswd` varchar(255) DEFAULT NULL,
  `vaddr` varchar(255) DEFAULT NULL,
  `vstatus` varchar(255) DEFAULT 'tocheck' COMMENT '场馆的状态：valid-通过审核、有效 sign-刚注册、待审核 tocheck-修改信息后待审核',
  `vinfo` varchar(255) DEFAULT NULL COMMENT '场馆简介',
  PRIMARY KEY (`vname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='暂存场馆信息的表\r\n';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venues_temp`
--

LOCK TABLES `venues_temp` WRITE;
/*!40000 ALTER TABLE `venues_temp` DISABLE KEYS */;
INSERT INTO `venues_temp` (`vname`, `vpasswd`, `vaddr`, `vstatus`, `vinfo`) VALUES ('幸福蓝海国际影城','12345678','汉口路222号哈哈哈哈哈哈','tocheck','暂无简');
/*!40000 ALTER TABLE `venues_temp` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-03-20 18:04:05
