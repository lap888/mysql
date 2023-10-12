# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: bj-cdb-061ud0fa.sql.tencentcdb.com (MySQL 5.7.18-txsql-log)
# Database: sph_db
# Generation Time: 2023-10-12 10:23:21 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table comments_dz
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comments_dz`;

CREATE TABLE `comments_dz` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `channel` varchar(200) DEFAULT NULL,
  `wxId` varchar(200) DEFAULT NULL,
  `dzId` varchar(500) DEFAULT NULL,
  `ctime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table comments_dz_jb
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comments_dz_jb`;

CREATE TABLE `comments_dz_jb` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `channel` varchar(200) NOT NULL DEFAULT 'system',
  `proId` varchar(200) NOT NULL DEFAULT '1001',
  `isSph` int(1) NOT NULL DEFAULT '0',
  `dzName` varchar(500) NOT NULL DEFAULT '',
  `ctime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table ddlh_coin
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ddlh_coin`;

CREATE TABLE `ddlh_coin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uId` int(11) NOT NULL,
  `ons` int(11) NOT NULL DEFAULT '1',
  `symbol` varchar(50) NOT NULL DEFAULT '',
  `totalAmount` decimal(10,4) NOT NULL DEFAULT '100.0000',
  `fristAmount` decimal(10,4) NOT NULL DEFAULT '0.0100',
  `rightPpAmount` decimal(10,4) NOT NULL DEFAULT '0.0000',
  `lErrorAddCount` int(11) NOT NULL DEFAULT '0',
  `lRightAddCount` int(11) NOT NULL DEFAULT '0',
  `sErrorAddCount` int(11) NOT NULL DEFAULT '0',
  `sRightAddCount` int(11) NOT NULL,
  `errorAddMax` int(11) NOT NULL DEFAULT '7',
  `rightAddMax` int(11) NOT NULL DEFAULT '20',
  `errorAddBl` varchar(500) NOT NULL DEFAULT '3.36,6.82,9.18,12.86,20.0,30.0,40.0',
  `rightAddBl` decimal(10,4) NOT NULL DEFAULT '3.4200',
  `backRate` decimal(10,4) NOT NULL DEFAULT '1.0000',
  `status` int(1) NOT NULL DEFAULT '0',
  `lockStatus` int(11) NOT NULL DEFAULT '0',
  `lockAmount` decimal(10,4) NOT NULL DEFAULT '10.0000',
  `unLockIncome` decimal(10,4) NOT NULL DEFAULT '0.0000',
  `gIncome` decimal(10,4) NOT NULL DEFAULT '0.0000',
  `unLockCount` decimal(10,4) NOT NULL DEFAULT '1.0000',
  `whoLock` varchar(10) NOT NULL,
  `lPrice` decimal(10,6) NOT NULL DEFAULT '0.000000',
  `sPrice` decimal(10,6) NOT NULL DEFAULT '0.000000',
  `gPrice` decimal(10,6) NOT NULL DEFAULT '0.000000',
  `isGrid` int(11) NOT NULL DEFAULT '1',
  `gCount` int(11) NOT NULL DEFAULT '0',
  `gRate` decimal(10,4) NOT NULL DEFAULT '2.3800',
  `fkRate` int(11) NOT NULL DEFAULT '1',
  `totalIncome` decimal(10,4) NOT NULL DEFAULT '0.0000',
  `ctime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `utime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table ddlh_order
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ddlh_order`;

CREATE TABLE `ddlh_order` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `sId` int(11) NOT NULL,
  `symbol` varchar(50) NOT NULL DEFAULT '',
  `action` varchar(50) NOT NULL DEFAULT '',
  `cPrice` decimal(10,6) NOT NULL DEFAULT '0.000000',
  `gPrice` decimal(10,6) NOT NULL DEFAULT '0.000000',
  `income` decimal(10,6) NOT NULL DEFAULT '0.000000',
  `ctime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table g_sph
# ------------------------------------------------------------

DROP TABLE IF EXISTS `g_sph`;

CREATE TABLE `g_sph` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` varchar(200) NOT NULL DEFAULT '',
  `pid` varchar(200) NOT NULL DEFAULT '',
  `url1` varchar(1000) NOT NULL DEFAULT '',
  `url2` varchar(1000) NOT NULL DEFAULT '',
  `title` varchar(200) NOT NULL DEFAULT '',
  `cname` varchar(200) NOT NULL DEFAULT '',
  `ctime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table hms
# ------------------------------------------------------------

DROP TABLE IF EXISTS `hms`;

CREATE TABLE `hms` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uId` int(11) NOT NULL DEFAULT '0',
  `dId` varchar(500) NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  `title` varchar(200) NOT NULL,
  `fpic` varchar(500) NOT NULL DEFAULT 'http://pvqidlovp.shop/uploads/cc16869ae671482f9c5819de34be71b8.jpeg',
  `status` int(11) NOT NULL DEFAULT '1',
  `note` varchar(500) NOT NULL DEFAULT '',
  `content` mediumtext NOT NULL,
  `remark` text NOT NULL,
  `ctime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dId` (`dId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table hms_ip
# ------------------------------------------------------------

DROP TABLE IF EXISTS `hms_ip`;

CREATE TABLE `hms_ip` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip` varchar(200) DEFAULT NULL,
  `dId` varchar(300) NOT NULL DEFAULT '',
  `ctime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table hms_url
# ------------------------------------------------------------

DROP TABLE IF EXISTS `hms_url`;

CREATE TABLE `hms_url` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `dId` varchar(200) NOT NULL DEFAULT '0',
  `url` varchar(200) NOT NULL DEFAULT 'http://',
  `status` int(1) NOT NULL DEFAULT '1',
  `ctime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table md_coin
# ------------------------------------------------------------

DROP TABLE IF EXISTS `md_coin`;

CREATE TABLE `md_coin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uId` int(11) NOT NULL,
  `symbol` varchar(50) NOT NULL DEFAULT '',
  `totalAmount` decimal(10,4) NOT NULL DEFAULT '1000.0000',
  `fristAmount` decimal(10,4) NOT NULL DEFAULT '50.0000',
  `lErrorAddCount` int(11) NOT NULL DEFAULT '0',
  `sErrorAddCount` int(11) NOT NULL DEFAULT '0',
  `unLockCount` decimal(10,4) NOT NULL DEFAULT '1.0000',
  `errorAddMax` int(11) NOT NULL DEFAULT '6',
  `errorAddBl` varchar(500) NOT NULL DEFAULT '2.36,4.82,6.18,9.86,15.0,18.0,20.0',
  `backRate` decimal(10,4) NOT NULL DEFAULT '1.0000',
  `fkRate` decimal(10,4) NOT NULL DEFAULT '1.0000',
  `incomeRate` decimal(10,4) NOT NULL DEFAULT '3.5000',
  `status` int(1) NOT NULL DEFAULT '0',
  `lockStatus` int(11) NOT NULL DEFAULT '0',
  `lockAmount` decimal(10,4) NOT NULL DEFAULT '10.0000',
  `lPrice` decimal(10,6) NOT NULL DEFAULT '0.000000',
  `sPrice` decimal(10,6) NOT NULL DEFAULT '0.000000',
  `unLockIncome` decimal(10,4) NOT NULL DEFAULT '0.0000',
  `totalIncome` decimal(10,4) NOT NULL DEFAULT '0.0000',
  `doAction` varchar(10) NOT NULL DEFAULT 'L',
  `ctime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `utime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL DEFAULT '',
  `pwd` varchar(500) NOT NULL DEFAULT '',
  `status` int(11) NOT NULL DEFAULT '1',
  `deviceId` varchar(300) NOT NULL DEFAULT '',
  `channel` varchar(200) NOT NULL DEFAULT 'system',
  `ctime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table v2_sph
# ------------------------------------------------------------

DROP TABLE IF EXISTS `v2_sph`;

CREATE TABLE `v2_sph` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `channel` varchar(200) DEFAULT NULL,
  `username` varchar(200) DEFAULT NULL,
  `nickname` varchar(200) DEFAULT NULL,
  `doNum` bigint(20) NOT NULL DEFAULT '0',
  `ctime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table wx_live_say
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wx_live_say`;

CREATE TABLE `wx_live_say` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `proId` varchar(200) NOT NULL DEFAULT '1001',
  `action` varchar(200) NOT NULL DEFAULT 'system',
  `status` int(1) NOT NULL DEFAULT '1',
  `name` varchar(500) NOT NULL DEFAULT '',
  `context` text NOT NULL,
  `ctime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table wx_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wx_user`;

CREATE TABLE `wx_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userId` varchar(200) NOT NULL DEFAULT 'system',
  `nickName` varchar(200) NOT NULL DEFAULT '',
  `signName` varchar(1000) NOT NULL DEFAULT '',
  `sex` varchar(20) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `anwTxt` varchar(500) DEFAULT '',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '0 刚导入 1等待设置 2 已设置回复 3 已添加',
  `ctime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table xq_coin
# ------------------------------------------------------------

DROP TABLE IF EXISTS `xq_coin`;

CREATE TABLE `xq_coin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uId` int(11) NOT NULL DEFAULT '1001',
  `ons` int(11) NOT NULL DEFAULT '1',
  `action` varchar(50) NOT NULL DEFAULT 'S',
  `symbol` varchar(50) NOT NULL DEFAULT '',
  `totalAmount` decimal(10,4) NOT NULL DEFAULT '1000.0000',
  `fristAmount` decimal(10,4) NOT NULL DEFAULT '16.0000',
  `rightPpAmount` decimal(10,4) NOT NULL DEFAULT '8.0000',
  `lErrorAddCount` int(11) NOT NULL DEFAULT '0',
  `lRightAddCount` int(11) NOT NULL DEFAULT '0',
  `sErrorAddCount` int(11) NOT NULL DEFAULT '0',
  `sRightAddCount` int(11) NOT NULL DEFAULT '0',
  `rightAddMax` int(11) NOT NULL DEFAULT '200',
  `level` int(11) NOT NULL DEFAULT '10',
  `status` int(1) NOT NULL DEFAULT '0',
  `lossAmount` decimal(10,4) NOT NULL DEFAULT '8.0000',
  `lIncome` decimal(10,4) NOT NULL DEFAULT '0.0000',
  `sIncome` decimal(10,4) NOT NULL DEFAULT '0.0000',
  `lPrice` decimal(10,6) NOT NULL DEFAULT '0.000000',
  `sPrice` decimal(10,6) NOT NULL DEFAULT '0.000000',
  `totalIncome` decimal(10,4) NOT NULL DEFAULT '0.0000',
  `ctime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dtime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `utime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table xq_pos
# ------------------------------------------------------------

DROP TABLE IF EXISTS `xq_pos`;

CREATE TABLE `xq_pos` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `symbol` varchar(50) NOT NULL DEFAULT '',
  `ep` decimal(20,6) NOT NULL,
  `up` decimal(20,6) NOT NULL,
  `pa` decimal(20,6) NOT NULL,
  `pp` decimal(20,6) NOT NULL,
  `price` decimal(20,6) NOT NULL,
  `ctime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
