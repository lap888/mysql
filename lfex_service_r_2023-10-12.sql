# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: bj-cdb-061ud0fa.sql.tencentcdb.com (MySQL 5.7.18-txsql-log)
# Database: lfex_service_r
# Generation Time: 2023-10-12 10:21:17 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table appeals
# ------------------------------------------------------------

DROP TABLE IF EXISTS `appeals`;

CREATE TABLE `appeals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderId` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `picUrl` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` int(3) DEFAULT '0' COMMENT '0: 待处理; 1:处理中; 2:已处理',
  `createdAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `appealResult` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单申诉表';



# Dump of table authentication_infos
# ------------------------------------------------------------

DROP TABLE IF EXISTS `authentication_infos`;

CREATE TABLE `authentication_infos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` bigint(20) NOT NULL,
  `trueName` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pic` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pic1` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pic2` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `idNum` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `authType` int(11) NOT NULL DEFAULT '0' COMMENT '认证类型 0:人脸 1:手动',
  `failReason` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `certifyId` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `user_id` (`userId`) USING BTREE,
  UNIQUE KEY `UK_certifyId` (`certifyId`) USING BTREE,
  UNIQUE KEY `UNIQUE_IDNUM` (`idNum`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='实名认证信息表';



# Dump of table backstage_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `backstage_user`;

CREATE TABLE `backstage_user` (
  `Id` varchar(36) NOT NULL DEFAULT '',
  `LoginName` varchar(50) NOT NULL DEFAULT '' COMMENT '登录用户',
  `Password` varchar(50) NOT NULL DEFAULT '123456' COMMENT '密码',
  `LastLoginIp` varchar(50) NOT NULL DEFAULT '' COMMENT '上次登录Ip',
  `Email` varchar(50) NOT NULL DEFAULT '' COMMENT '邮箱',
  `UpdateTime` datetime DEFAULT NULL COMMENT '修改时间',
  `CreateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `LastLoginTime` datetime DEFAULT NULL COMMENT '上次登录时间',
  `RoleId` int(11) NOT NULL DEFAULT '0' COMMENT '角色Id',
  `FullName` varchar(50) DEFAULT '' COMMENT '全名',
  `Mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '手机号',
  `Gender` int(1) DEFAULT '0' COMMENT '性别',
  `IdCard` varchar(50) DEFAULT '' COMMENT '身份证',
  `AccountType` int(11) NOT NULL DEFAULT '0' COMMENT '用户类别',
  `AccountStatus` int(11) NOT NULL DEFAULT '0' COMMENT '用户状态',
  `SourceType` int(11) NOT NULL DEFAULT '0' COMMENT '来源渠道',
  PRIMARY KEY (`Id`) USING BTREE,
  KEY `rId` (`RoleId`) USING BTREE,
  CONSTRAINT `rId` FOREIGN KEY (`RoleId`) REFERENCES `system_roles` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table city_candy_dividend
# ------------------------------------------------------------

DROP TABLE IF EXISTS `city_candy_dividend`;

CREATE TABLE `city_candy_dividend` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `CityNo` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '城市编号',
  `DividendType` int(2) NOT NULL COMMENT '分红类型',
  `Amount` decimal(18,4) NOT NULL COMMENT '分红金额',
  `StartDate` date NOT NULL COMMENT '开始时间',
  `EndDate` date NOT NULL COMMENT '结束时间',
  `State` int(11) NOT NULL COMMENT '发红状态',
  `CreateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `UpdateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `Remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`Id`) USING BTREE,
  UNIQUE KEY `UNIQUE_CITY_DATE` (`CityNo`,`StartDate`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table city_candy_dividend_record
# ------------------------------------------------------------

DROP TABLE IF EXISTS `city_candy_dividend_record`;

CREATE TABLE `city_candy_dividend_record` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `CityNo` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '城市编号',
  `ModifyType` int(2) NOT NULL COMMENT '变更类型',
  `ModifyDesc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '变更描述信息',
  `PreChange` decimal(18,6) NOT NULL COMMENT '变更前金额',
  `Incurred` decimal(18,6) NOT NULL COMMENT '发生金额',
  `PostChange` decimal(18,6) NOT NULL COMMENT '变更后金额',
  `CreateTime` datetime DEFAULT NULL COMMENT '创建时间',
  `Remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table city_cash_dividend
# ------------------------------------------------------------

DROP TABLE IF EXISTS `city_cash_dividend`;

CREATE TABLE `city_cash_dividend` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `CityNo` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '城市编号',
  `DividendType` int(2) NOT NULL COMMENT '分红类型',
  `Amount` decimal(18,4) NOT NULL COMMENT '分红金额',
  `StartDate` date NOT NULL COMMENT '开始时间',
  `EndDate` date NOT NULL COMMENT '结束时间',
  `State` int(11) NOT NULL COMMENT '发红状态',
  `CreateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `UpdateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `Remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`Id`) USING BTREE,
  UNIQUE KEY `UNIQUE_CITY_DATE` (`CityNo`,`StartDate`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table city_cash_dividend_record
# ------------------------------------------------------------

DROP TABLE IF EXISTS `city_cash_dividend_record`;

CREATE TABLE `city_cash_dividend_record` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `CityNo` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '城市编号',
  `ModifyType` int(2) NOT NULL COMMENT '变更类型',
  `ModifyDesc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '变更描述信息',
  `PreChange` decimal(18,6) NOT NULL COMMENT '变更前金额',
  `Incurred` decimal(18,6) NOT NULL COMMENT '发生金额',
  `PostChange` decimal(18,6) NOT NULL COMMENT '变更后金额',
  `CreateTime` datetime DEFAULT NULL COMMENT '创建时间',
  `Remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table city_earnings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `city_earnings`;

CREATE TABLE `city_earnings` (
  `CityNo` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '城市编号',
  `Cash` decimal(16,4) NOT NULL DEFAULT '0.0000' COMMENT '现金',
  `Candy` decimal(16,4) NOT NULL DEFAULT '0.0000' COMMENT '糖果',
  `People` int(11) NOT NULL COMMENT '人数',
  `CreateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `Remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`CityNo`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table coin_move_record
# ------------------------------------------------------------

DROP TABLE IF EXISTS `coin_move_record`;

CREATE TABLE `coin_move_record` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userId` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户ID',
  `refId` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '三方引用ID',
  `address` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '第三方转入用户ID',
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '0 转出 1转入',
  `amount` decimal(18,5) NOT NULL DEFAULT '0.00000' COMMENT '转入币种数量',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '0待确定 1 成功 2失败',
  `coinType` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '币种类型',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table coin_trade
# ------------------------------------------------------------

DROP TABLE IF EXISTS `coin_trade`;

CREATE TABLE `coin_trade` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `tradeNumber` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `buyerUid` int(11) DEFAULT NULL COMMENT '买方用户ID',
  `buyerAlipay` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sellerUid` int(11) DEFAULT NULL COMMENT '卖方用户ID',
  `sellerAlipay` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(32,4) DEFAULT NULL COMMENT '币种数量',
  `price` decimal(18,8) DEFAULT NULL COMMENT '单价',
  `totalPrice` decimal(18,8) DEFAULT NULL COMMENT '总价',
  `trendSide` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pictureUrl` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(255) DEFAULT NULL COMMENT '订单状态：0正常，1正常，2未付款，3已付款，4已完成 5申诉订单， 6冻结订单',
  `entryOrderTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '挂单时间',
  `paidTime` timestamp NULL DEFAULT NULL COMMENT '付款时间',
  `payCoinTime` timestamp NULL DEFAULT NULL COMMENT '放币时间',
  `dealTime` timestamp NULL DEFAULT NULL COMMENT '成交时间',
  `finishTime` timestamp NULL DEFAULT NULL COMMENT '交易完成时间',
  `ctime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `coinType` varchar(50) CHARACTER SET utf8mb4 NOT NULL DEFAULT 'USDT' COMMENT '订单币种类',
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'bibi' COMMENT '法币/币币',
  `utime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `fee` decimal(18,8) DEFAULT NULL,
  `appealTime` timestamp NULL DEFAULT NULL COMMENT '订单申诉时间',
  `paidEndTime` timestamp NULL DEFAULT NULL COMMENT '订单支付截止时间',
  `dealEndTime` timestamp NULL DEFAULT NULL COMMENT '订单成交截止时间',
  `buyerBan` tinyint(1) DEFAULT '0',
  `sellerBan` tinyint(1) DEFAULT '0',
  `monthlyTradeCount` int(11) DEFAULT NULL COMMENT '最近30天交易成功笔数',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `trend_side` (`trendSide`) USING BTREE,
  KEY `status` (`status`) USING BTREE,
  KEY `buyer_uid` (`buyerUid`) USING BTREE,
  KEY `seller_uid` (`sellerUid`) USING BTREE,
  KEY `deal_time` (`dealTime`) USING BTREE,
  KEY `FK_buyerAlipay` (`buyerAlipay`) USING BTREE,
  KEY `NORMAL` (`trendSide`,`status`) USING BTREE,
  KEY `NORMAL_PAIDENDTIME` (`paidEndTime`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='糖果交易表';



# Dump of table coin_trade_ext
# ------------------------------------------------------------

DROP TABLE IF EXISTS `coin_trade_ext`;

CREATE TABLE `coin_trade_ext` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT 'USDT' COMMENT '币种类',
  `sysMaxPrice` double NOT NULL DEFAULT '100' COMMENT '系统最高价',
  `sysMinPrice` double NOT NULL DEFAULT '0.001' COMMENT '系统最低价',
  `todayAmount` double NOT NULL DEFAULT '0' COMMENT '当前价格',
  `todayAvgPrice` double NOT NULL DEFAULT '0' COMMENT '今日均价',
  `todayMaxPrice` double NOT NULL DEFAULT '0',
  `todayTradeAmount` int(11) NOT NULL DEFAULT '0' COMMENT '今日交易量',
  `upRate` double NOT NULL DEFAULT '0.01' COMMENT '涨幅',
  `ctime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table coin_trade_location
# ------------------------------------------------------------

DROP TABLE IF EXISTS `coin_trade_location`;

CREATE TABLE `coin_trade_location` (
  `TradeId` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Buyer_Location_X` decimal(18,6) NOT NULL DEFAULT '0.000000',
  `Buyer_Location_Y` decimal(18,6) NOT NULL DEFAULT '0.000000',
  `Buyer_Province` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `Buyer_City` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `Buyer_CityCode` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `Buyer_Area` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `Buyer_AreaCode` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `Sell_Location_X` decimal(18,6) NOT NULL DEFAULT '0.000000',
  `Sell_Location_Y` decimal(18,6) NOT NULL DEFAULT '0.000000',
  `Sell_Province` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `Sell_City` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `Sell_CityCode` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `Sell_Area` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `Sell_AreaCode` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`TradeId`) USING BTREE,
  KEY `FK_Buyer_CityCode` (`Buyer_CityCode`) USING BTREE,
  KEY `FK_Buyer_AreaCode` (`Buyer_AreaCode`) USING BTREE,
  KEY `FK_Sell_CityCode` (`Sell_CityCode`) USING BTREE,
  KEY `FK_Sell_AreaCode` (`Sell_AreaCode`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table coin_type
# ------------------------------------------------------------

DROP TABLE IF EXISTS `coin_type`;

CREATE TABLE `coin_type` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'USDT' COMMENT '币名称',
  `fee` decimal(18,5) NOT NULL DEFAULT '0.00000' COMMENT '手续费',
  `count24` int(11) NOT NULL DEFAULT '0' COMMENT '24小时交易量',
  `countTotal` int(11) NOT NULL DEFAULT '1000000' COMMENT '发行总量',
  `minCanMove` int(11) NOT NULL DEFAULT '10' COMMENT '最低',
  `nowPrice` decimal(18,5) NOT NULL DEFAULT '0.00000' COMMENT '最新价格',
  `lastPrice` decimal(18,5) NOT NULL DEFAULT '0.00000' COMMENT '昨日收盘价',
  `upDown` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '涨跌幅',
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '币状态0未上线 1上线',
  `cstatus` int(1) NOT NULL DEFAULT '0' COMMENT '冲币状态 0 未开放 1开放',
  `type` int(2) NOT NULL DEFAULT '0' COMMENT '币种类 0 法币 1 币币',
  `remark` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '币说明',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table com_info_update_records
# ------------------------------------------------------------

DROP TABLE IF EXISTS `com_info_update_records`;

CREATE TABLE `com_info_update_records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `oldValue` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `newValue` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` int(11) NOT NULL COMMENT '0:支付宝',
  `udate` date DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='支付宝修改记录';



# Dump of table face_init_record
# ------------------------------------------------------------

DROP TABLE IF EXISTS `face_init_record`;

CREATE TABLE `face_init_record` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `CertifyId` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '认证编号',
  `CertifyUrl` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '认证地址',
  `TrueName` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '真实姓名',
  `IDCardNum` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '身份证号',
  `Alipay` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '支付宝号',
  `IsUsed` int(2) NOT NULL DEFAULT '0' COMMENT '是否已使用 0 未使用，  1已使用',
  `CreateTime` datetime DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`Id`) USING BTREE,
  UNIQUE KEY `UNIQUE_CID` (`CertifyId`,`IDCardNum`) USING BTREE,
  KEY `NORMAL_IDCARD` (`IDCardNum`,`TrueName`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='会员刷脸认证记录表';



# Dump of table game_categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `game_categories`;

CREATE TABLE `game_categories` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '''全部'', ''棋牌'', ''角色'', ''传奇'', ''策略'', ''卡牌'', ''挂机'', ''经营'', ''休闲'', ''女生''',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='游戏类别';



# Dump of table game_info_ext
# ------------------------------------------------------------

DROP TABLE IF EXISTS `game_info_ext`;

CREATE TABLE `game_info_ext` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `gameId` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `appKey` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `appSecret` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cpUserId` int(11) NOT NULL DEFAULT '0' COMMENT 'cp用户id',
  `gamePlatform` int(11) NOT NULL DEFAULT '0' COMMENT '平台：1.H5 2.Android 3.IOS',
  `ipWhiteList` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `callbackUrl` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isOpen` int(1) NOT NULL DEFAULT '0' COMMENT '是否开启',
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='游戏信息拓展';



# Dump of table game_infos
# ------------------------------------------------------------

DROP TABLE IF EXISTS `game_infos`;

CREATE TABLE `game_infos` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gType` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gPlatform` int(11) DEFAULT NULL,
  `gTitle` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isFirstPublish` tinyint(1) DEFAULT NULL,
  `synopsis` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gtProportionl` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gtVIP` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gPinyin` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gameCategoryId` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gSize` decimal(10,0) DEFAULT NULL,
  `gVersion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount` decimal(18,2) DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `gH5Url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gameSupplierId` int(11) DEFAULT NULL,
  `useGem` tinyint(1) DEFAULT '0' COMMENT '是否可用糖果抵扣',
  `useGemRate` float DEFAULT '0' COMMENT '糖果抵扣比例',
  `isShow` tinyint(1) DEFAULT '1' COMMENT '是否在app中展示',
  `companyShareRatio` float DEFAULT '0' COMMENT '公司所占分成',
  `sdwId` int(11) NOT NULL DEFAULT '0' COMMENT '电魂网络 游戏 id',
  `gSort` decimal(10,0) DEFAULT NULL COMMENT '游戏排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='游戏主信息';



# Dump of table game_login_history
# ------------------------------------------------------------

DROP TABLE IF EXISTS `game_login_history`;

CREATE TABLE `game_login_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL DEFAULT '0' COMMENT '账号id',
  `gameAppid` int(11) NOT NULL DEFAULT '0' COMMENT '游戏appid',
  `source` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `roleId` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `roleName` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `roleLevel` int(11) NOT NULL DEFAULT '0' COMMENT '角色等级',
  `serverId` int(11) NOT NULL DEFAULT '0' COMMENT '所在服务器id',
  `serverName` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='游戏登陆记录';



# Dump of table game_suppliers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `game_suppliers`;

CREATE TABLE `game_suppliers` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isEnable` tinyint(1) DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='游戏供应商';



# Dump of table gem_records
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gem_records`;

CREATE TABLE `gem_records` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userId` bigint(20) NOT NULL,
  `num` decimal(18,8) DEFAULT '0.00000000',
  `gemMinningAt` datetime DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `description` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gemSource` int(3) DEFAULT '0' COMMENT '1 做任务产出 4兑换任务消耗3 卖 5 买 2 下级任务加成',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `user_id` (`userId`,`gemSource`) USING BTREE,
  KEY `time` (`createdAt`) USING BTREE,
  KEY `gemSource` (`gemSource`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='糖果流水';



# Dump of table gold_flows
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gold_flows`;

CREATE TABLE `gold_flows` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userId` bigint(20) NOT NULL,
  `discribe` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `num` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `isRead` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table lfex_everyday_dividend
# ------------------------------------------------------------

DROP TABLE IF EXISTS `lfex_everyday_dividend`;

CREATE TABLE `lfex_everyday_dividend` (
  `DividendDate` date NOT NULL,
  `CandyFee` decimal(18,6) NOT NULL,
  `Star1` decimal(18,6) NOT NULL,
  `People1` int(11) NOT NULL,
  `Star2` decimal(18,6) NOT NULL,
  `People2` int(11) NOT NULL,
  `Star3` decimal(18,6) NOT NULL,
  `People3` int(11) NOT NULL,
  `Star4` decimal(18,6) NOT NULL,
  `People4` int(11) NOT NULL,
  `Star5` decimal(18,6) NOT NULL,
  `People5` int(11) NOT NULL,
  PRIMARY KEY (`DividendDate`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table lfex_member_star_now
# ------------------------------------------------------------

DROP TABLE IF EXISTS `lfex_member_star_now`;

CREATE TABLE `lfex_member_star_now` (
  `UserId` bigint(20) NOT NULL,
  `teamStart` int(11) NOT NULL DEFAULT '0',
  `teamCandyH` decimal(11,4) NOT NULL DEFAULT '0.0000',
  `bigCandyH` decimal(11,4) NOT NULL DEFAULT '0.0000',
  `littleCandyH` decimal(11,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table login_history
# ------------------------------------------------------------

DROP TABLE IF EXISTS `login_history`;

CREATE TABLE `login_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `mobile` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uniqueId` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `systemName` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `systemVersion` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deviceName` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `appVersion` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unLockCount` int(11) NOT NULL DEFAULT '0' COMMENT '记录解绑次数',
  `ctime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `utime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后登陆时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_mobile` (`mobile`) USING BTREE,
  KEY `NORMAL_UNIQUEID_MOBILE` (`uniqueId`,`mobile`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='登陆记录';



# Dump of table look_up_income
# ------------------------------------------------------------

DROP TABLE IF EXISTS `look_up_income`;

CREATE TABLE `look_up_income` (
  `id` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `userId` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `amount` decimal(11,4) NOT NULL DEFAULT '0.0000' COMMENT '锁仓金额',
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '锁仓类型',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '锁仓中0 已赎回',
  `startTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '开始时间',
  `endTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '失效时间',
  `cTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `sopTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '赎回时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table look_up_setting
# ------------------------------------------------------------

DROP TABLE IF EXISTS `look_up_setting`;

CREATE TABLE `look_up_setting` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '名称',
  `type` int(1) NOT NULL DEFAULT '0' COMMENT '0 灵活存取1 30天2 60天3 90天',
  `income` decimal(11,4) NOT NULL DEFAULT '0.0000' COMMENT '收益率',
  `remark` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '备注',
  `cTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table minnings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `minnings`;

CREATE TABLE `minnings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` bigint(20) NOT NULL COMMENT '用户id',
  `minningId` int(11) NOT NULL COMMENT '矿机类型 id',
  `beginTime` datetime NOT NULL COMMENT '生效时间',
  `endTime` datetime NOT NULL COMMENT '失效时间',
  `status` tinyint(1) DEFAULT '1' COMMENT 'true:生效中; false:已失效',
  `minningStatus` int(11) NOT NULL DEFAULT '0' COMMENT '矿机运行状态 0未挖矿 1 正在进行挖矿 2完成挖矿',
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `workingTime` datetime DEFAULT NULL COMMENT '做任务开始时间',
  `workingEndTime` datetime DEFAULT NULL COMMENT '挖矿结束时间',
  `source` int(3) DEFAULT NULL COMMENT '0:系统赠送(试炼矿机); 1:购买/兑换; 2:达人奖励；3：游戏奖励；4：城市合伙人赠送',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `begin_time` (`beginTime`) USING BTREE,
  KEY `user_id` (`userId`) USING BTREE,
  KEY `end_time` (`endTime`) USING BTREE,
  KEY `source` (`source`) USING BTREE,
  KEY `NORMAL_USERID_STATUS` (`userId`,`status`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='任务';



# Dump of table notice_infos
# ------------------------------------------------------------

DROP TABLE IF EXISTS `notice_infos`;

CREATE TABLE `notice_infos` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userId` bigint(20) NOT NULL,
  `title` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `isRead` int(1) NOT NULL DEFAULT '0',
  `refId` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ceratedAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_userId` (`userId`) USING BTREE,
  KEY `FK_type` (`type`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='消息信息';



# Dump of table order_games
# ------------------------------------------------------------

DROP TABLE IF EXISTS `order_games`;

CREATE TABLE `order_games` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `gameAppid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `orderId` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `candy` decimal(18,8) DEFAULT NULL,
  `candyAmount` decimal(18,2) DEFAULT NULL,
  `orderAmount` decimal(18,2) DEFAULT NULL,
  `realAmount` decimal(18,2) DEFAULT NULL,
  `status` int(1) DEFAULT '0' COMMENT '订单状态 0未支付， 1支付成功，5已退款',
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `UNIQUE_ORDERID` (`orderId`) USING BTREE,
  KEY `FK_orderId_userId` (`orderId`,`userId`) USING BTREE,
  KEY `FK_createdAt` (`createdAt`) USING BTREE,
  KEY `FK_updatedAt` (`updatedAt`) USING BTREE,
  KEY `FK_gameAppid_userId_status` (`gameAppid`,`userId`,`status`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='游戏订单';



# Dump of table phone_attribution
# ------------------------------------------------------------

DROP TABLE IF EXISTS `phone_attribution`;

CREATE TABLE `phone_attribution` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Prefix` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Phone` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `Province` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `City` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ISP` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `Postcode` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `AreaCode` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ChinaCode` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`Id`) USING BTREE,
  UNIQUE KEY `UNIQUE_PHONE` (`Phone`) USING BTREE,
  KEY `NORMAL_PREFIX` (`Prefix`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table pictures
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pictures`;

CREATE TABLE `pictures` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `imageableType` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `imageableId` int(11) DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_pictures_on_imageable_type_and_imageable_id` (`imageableType`,`imageableId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='图片';



# Dump of table relation_stats
# ------------------------------------------------------------

DROP TABLE IF EXISTS `relation_stats`;

CREATE TABLE `relation_stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `f1Id` int(11) DEFAULT NULL COMMENT '父一级',
  `f2Id` int(11) DEFAULT NULL COMMENT '父二级',
  `f3Id` int(11) DEFAULT NULL COMMENT '父三级',
  `f4Id` int(11) DEFAULT NULL COMMENT '父四级',
  `f5Id` int(11) DEFAULT NULL COMMENT '父五级',
  `f6Id` int(11) DEFAULT NULL COMMENT '父六级',
  `f7Id` int(11) DEFAULT NULL COMMENT '父七级',
  `f8Id` int(11) DEFAULT NULL COMMENT '父八级',
  `f9Id` int(11) DEFAULT NULL COMMENT '父九级',
  `f10Id` int(11) DEFAULT NULL COMMENT '父十级',
  `createdAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='关系统计';



# Dump of table relations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `relations`;

CREATE TABLE `relations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mobile` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `inviterMobile` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='关系';



# Dump of table sys_banner
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_banner`;

CREATE TABLE `sys_banner` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `queue` tinyint(3) NOT NULL COMMENT '轮播图排序',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `imageUrl` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` tinyint(3) NOT NULL COMMENT '点击操作类型 0、WebView 1、系统界面 ...',
  `source` tinyint(3) NOT NULL COMMENT '轮播图来源 0、 系统轮播 1、游戏轮播 ... 2.广告 3.任务推荐',
  `status` tinyint(3) NOT NULL DEFAULT '1' COMMENT '0、下线 1、在线',
  `params` text COLLATE utf8mb4_unicode_ci,
  `cityCode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='系统轮播图';



# Dump of table sys_client_versions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_client_versions`;

CREATE TABLE `sys_client_versions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `currentVersion` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isSilent` tinyint(1) NOT NULL,
  `isHotReload` tinyint(1) NOT NULL,
  `deviceSystem` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updateContent` text COLLATE utf8mb4_unicode_ci,
  `production` tinyint(1) NOT NULL,
  `isNecessary` tinyint(1) NOT NULL DEFAULT '1',
  `downloadUrl` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='App版本控制';



# Dump of table system_actions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `system_actions`;

CREATE TABLE `system_actions` (
  `ActionId` varchar(36) NOT NULL DEFAULT '' COMMENT '权限Id',
  `ActionDescription` varchar(100) NOT NULL DEFAULT '' COMMENT '权限描述',
  `ActionName` varchar(255) NOT NULL DEFAULT '' COMMENT '权限名称',
  `CreateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `Url` varchar(255) NOT NULL DEFAULT '' COMMENT 'URL',
  `Orders` int(11) DEFAULT NULL COMMENT '排序',
  `ParentAction` varchar(255) DEFAULT NULL COMMENT '父级权限',
  `Icon` varchar(100) DEFAULT NULL COMMENT 'Icon',
  PRIMARY KEY (`ActionId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table system_role_permission
# ------------------------------------------------------------

DROP TABLE IF EXISTS `system_role_permission`;

CREATE TABLE `system_role_permission` (
  `RoleId` int(11) NOT NULL DEFAULT '0' COMMENT '角色Id',
  `ActionId` varchar(36) NOT NULL COMMENT '权限Id',
  `CreateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`RoleId`,`ActionId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table system_roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `system_roles`;

CREATE TABLE `system_roles` (
  `Id` int(11) NOT NULL DEFAULT '0' COMMENT '角色Id',
  `Name` varchar(50) NOT NULL DEFAULT '' COMMENT '角色名称',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户唯一id，从10000开始',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '用户状态：0-登记未激活，1-激活，2-冻结，3-关闭',
  `auditState` int(11) DEFAULT NULL COMMENT '0:审核中, 1:审核通过, 2:审核未通过',
  `type` int(1) NOT NULL DEFAULT '0' COMMENT '0 普通会员 1代理',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rcode` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contryCode` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '86',
  `mobile` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `candyNum` decimal(18,8) DEFAULT '0.00000000' COMMENT '糖果数量',
  `candyP` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '果皮',
  `freezeCandyNum` decimal(18,8) DEFAULT '0.00000000' COMMENT '冻结糖果',
  `cnadyDoAt` datetime DEFAULT NULL COMMENT '做任务时间',
  `inviterMobile` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `passwordSalt` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ctime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `utime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `avatarUrl` varchar(225) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'lfex/images/avatar/default/1.png',
  `cCount` int(11) DEFAULT '0',
  `todayAvaiableGolds` int(11) DEFAULT '5',
  `golds` decimal(18,8) DEFAULT '0.00000000',
  `uuid` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `level` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'lv0',
  `monthlyTradeCount` int(11) DEFAULT '0' COMMENT '最近三十天交易量',
  `tradePwd` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alipay` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alipayUid` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alipayPic` varchar(225) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '支付宝图片',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `id_UNIQUE` (`id`) USING BTREE,
  UNIQUE KEY `rcode` (`rcode`) USING BTREE,
  UNIQUE KEY `UK_mobile` (`mobile`) USING BTREE,
  KEY `inviter_mobile` (`inviterMobile`,`mobile`,`status`) USING BTREE,
  KEY `ctime` (`ctime`) USING BTREE,
  KEY `audit_state` (`auditState`) USING BTREE,
  KEY `rcode_2` (`rcode`) USING BTREE,
  KEY `FK_inviter_mobile` (`inviterMobile`) USING BTREE,
  KEY `NORMAL_ALIPAY_AUDITSTATE` (`alipay`,`auditState`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户表';



# Dump of table user_account_equity
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_account_equity`;

CREATE TABLE `user_account_equity` (
  `AccountId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '账户ID',
  `UserId` bigint(20) NOT NULL COMMENT '用户ID',
  `Revenue` decimal(18,5) NOT NULL COMMENT '总收入',
  `Expenses` decimal(18,5) NOT NULL COMMENT '总支出',
  `Balance` decimal(18,5) NOT NULL COMMENT '余额',
  `Frozen` decimal(18,5) NOT NULL COMMENT '冻结',
  `ModifyTime` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`AccountId`) USING BTREE,
  UNIQUE KEY `FK_UserId` (`UserId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table user_account_equity_record
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_account_equity_record`;

CREATE TABLE `user_account_equity_record` (
  `RecordId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '记录ID',
  `AccountId` bigint(20) NOT NULL COMMENT '账户ID',
  `PreChange` decimal(12,5) NOT NULL COMMENT '变更前金额',
  `Incurred` decimal(12,5) NOT NULL COMMENT '发生金额',
  `PostChange` decimal(12,5) NOT NULL COMMENT '变更后金额',
  `ModifyType` int(11) NOT NULL COMMENT '变更类型',
  `ModifyDesc` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '变更描述信息',
  `ModifyTime` datetime NOT NULL COMMENT '变更时间',
  PRIMARY KEY (`RecordId`) USING BTREE,
  KEY `FK_AccountId` (`AccountId`) USING BTREE,
  KEY `FK_ModifyType` (`ModifyType`) USING BTREE,
  KEY `FK_ModifyTime` (`ModifyTime`) USING BTREE,
  KEY `NORMAL_AID_MT` (`AccountId`,`ModifyType`) USING BTREE,
  KEY `NORMAL_MT_AID` (`ModifyType`,`AccountId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table user_account_ticket
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_account_ticket`;

CREATE TABLE `user_account_ticket` (
  `AccountId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '账户ID',
  `UserId` bigint(20) NOT NULL COMMENT '用户ID',
  `Revenue` decimal(18,5) NOT NULL COMMENT '总收入',
  `Expenses` decimal(18,5) NOT NULL COMMENT '总支出',
  `Balance` decimal(18,5) NOT NULL COMMENT '余额',
  `Frozen` decimal(18,5) NOT NULL COMMENT '冻结',
  `State` int(2) NOT NULL DEFAULT '0' COMMENT '状态 0未开启  1已开启',
  `ModifyTime` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`AccountId`) USING BTREE,
  UNIQUE KEY `FK_UserId` (`UserId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table user_account_ticket_record
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_account_ticket_record`;

CREATE TABLE `user_account_ticket_record` (
  `RecordId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '记录ID',
  `AccountId` bigint(20) NOT NULL COMMENT '账户ID',
  `PreChange` decimal(12,5) NOT NULL COMMENT '变更前金额',
  `Incurred` decimal(12,5) NOT NULL COMMENT '发生金额',
  `PostChange` decimal(12,5) NOT NULL COMMENT '变更后金额',
  `ModifyType` int(11) NOT NULL COMMENT '变更类型',
  `ModifyDesc` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '变更描述信息',
  `ModifyTime` datetime NOT NULL COMMENT '变更时间',
  PRIMARY KEY (`RecordId`) USING BTREE,
  KEY `FK_AccountId` (`AccountId`) USING BTREE,
  KEY `FK_ModifyType` (`ModifyType`) USING BTREE,
  KEY `FK_ModifyTime` (`ModifyTime`) USING BTREE,
  KEY `NORMAL_AID_MT` (`AccountId`,`ModifyType`) USING BTREE,
  KEY `NORMAL_MT_AID` (`ModifyType`,`AccountId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table user_account_wallet
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_account_wallet`;

CREATE TABLE `user_account_wallet` (
  `AccountId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '账户ID',
  `UserId` bigint(20) NOT NULL COMMENT '用户ID',
  `Type` int(3) NOT NULL DEFAULT '0' COMMENT '币类型法币OR币币 0币币 1发币',
  `CoinType` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'USDT' COMMENT '币种类',
  `Revenue` decimal(18,5) NOT NULL COMMENT '总收入',
  `Expenses` decimal(18,5) NOT NULL COMMENT '总支出',
  `Balance` decimal(18,5) NOT NULL COMMENT '余额',
  `Frozen` decimal(18,5) NOT NULL COMMENT '冻结',
  `ModifyTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`AccountId`) USING BTREE,
  UNIQUE KEY `T_U_KEY` (`CoinType`,`UserId`),
  KEY `FK_UserId` (`UserId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table user_account_wallet_record
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_account_wallet_record`;

CREATE TABLE `user_account_wallet_record` (
  `RecordId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '记录ID',
  `AccountId` bigint(20) NOT NULL COMMENT '账户ID',
  `PreChange` decimal(18,4) NOT NULL COMMENT '变更前金额',
  `Incurred` decimal(18,4) NOT NULL COMMENT '发生金额',
  `PostChange` decimal(18,4) NOT NULL COMMENT '变更后金额',
  `ModifyType` int(11) NOT NULL COMMENT '变更类型',
  `ModifyDesc` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '变更描述信息',
  `ModifyTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '变更时间',
  PRIMARY KEY (`RecordId`) USING BTREE,
  KEY `FK_AccountId` (`AccountId`) USING BTREE,
  KEY `FK_ModifyType` (`ModifyType`) USING BTREE,
  KEY `FK_ModifyTime` (`ModifyTime`) USING BTREE,
  KEY `NORMAL_AID_MT` (`AccountId`,`ModifyType`) USING BTREE,
  KEY `NORMAL_MT_AID` (`ModifyType`,`AccountId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table user_balance
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_balance`;

CREATE TABLE `user_balance` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `balanceNormal` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '正常余额',
  `balanceLock` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '冻结余额',
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `index_user_balances_on_user_id_unique` (`userId`) USING BTREE,
  KEY `index_user_balances_on_sender_id` (`userId`) USING BTREE,
  KEY `index_user_balances_on_receiver_id` (`balanceNormal`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='钱包';



# Dump of table user_balance_flow
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_balance_flow`;

CREATE TABLE `user_balance_flow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `tag` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amountChange` decimal(10,4) DEFAULT '0.0000' COMMENT '变化金额',
  `refId` int(11) NOT NULL DEFAULT '0' COMMENT '设计具体业务表id',
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='钱包流水';



# Dump of table user_candyp
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_candyp`;

CREATE TABLE `user_candyp` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `candyP` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '果皮',
  `content` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `source` smallint(6) NOT NULL DEFAULT '0' COMMENT '0:直推实名用户，1：买糖果，2：卖糖果',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_userId_source` (`userId`,`source`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='果皮记录';



# Dump of table user_expand
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_expand`;

CREATE TABLE `user_expand` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `UserId` bigint(20) NOT NULL,
  `Mobile` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Wechat` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreateTime` datetime NOT NULL,
  `Remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table user_ext
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_ext`;

CREATE TABLE `user_ext` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `userId` bigint(20) NOT NULL DEFAULT '0' COMMENT '关联用户id',
  `teamStart` int(11) NOT NULL DEFAULT '0' COMMENT '团队星级',
  `teamCount` int(11) NOT NULL DEFAULT '0' COMMENT '团队人数',
  `authCount` int(11) NOT NULL DEFAULT '0' COMMENT '直推人数',
  `teamCandyH` decimal(11,4) NOT NULL DEFAULT '0.0000' COMMENT '团队果核',
  `bigCandyH` decimal(11,4) NOT NULL DEFAULT '0.0000' COMMENT '大区果核',
  `littleCandyH` decimal(11,4) NOT NULL DEFAULT '0.0000',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `user_unique` (`userId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table user_game_bonus_detail
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_game_bonus_detail`;

CREATE TABLE `user_game_bonus_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `orderId` int(11) NOT NULL DEFAULT '0' COMMENT '订单号',
  `bonusAmount` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '分红金额',
  `content` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='游戏分红记录';



# Dump of table user_locations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_locations`;

CREATE TABLE `user_locations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userId` bigint(20) NOT NULL,
  `latitude` decimal(10,6) NOT NULL DEFAULT '0.000000',
  `longitude` decimal(10,6) NOT NULL DEFAULT '0.000000',
  `province` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provinceCode` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cityCode` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `area` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `areaCode` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_cityCode` (`cityCode`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='位置记录';



# Dump of table user_vcodes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_vcodes`;

CREATE TABLE `user_vcodes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mobile` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `msgId` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `NORMAL_MOBILE` (`mobile`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='验证码';



# Dump of table user_withdraw_history
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_withdraw_history`;

CREATE TABLE `user_withdraw_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `userId` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `withdrawType` int(11) NOT NULL DEFAULT '0' COMMENT '提现方式 1：支付宝 （之后可扩展）',
  `withdrawTo` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `orderCode` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '提现金额',
  `content` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '提现状态 0：提现中 1：提现成功 2：提现失败',
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `failReason` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='提现记录';



# Dump of table yoyo_activity
# ------------------------------------------------------------

DROP TABLE IF EXISTS `yoyo_activity`;

CREATE TABLE `yoyo_activity` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '活动标题',
  `Figure` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '活动图',
  `Description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '活动描述',
  `StartTime` datetime NOT NULL COMMENT '活动开始时间',
  `EndTime` datetime NOT NULL COMMENT '活动结束时间',
  `StartLotteryTime` time DEFAULT NULL COMMENT '抽奖开始时间段',
  `EndLotteryTime` time DEFAULT NULL COMMENT '抽奖结束时间段',
  `UseCandy` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '消耗糖果',
  `UsePeel` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '消耗果皮',
  `DailyLimit` int(11) NOT NULL DEFAULT '0' COMMENT '每日参与次数 0为不限制',
  `ActivityLimit` int(11) NOT NULL DEFAULT '0' COMMENT '活动参与总数限制 0为不限制',
  `State` int(11) NOT NULL DEFAULT '0' COMMENT '活动状态，0正常，1暂停，2结束，3删除',
  `CreateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `Remark` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`Id`) USING BTREE,
  KEY `NORMAL_STATE` (`State`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table yoyo_activity_coupon
# ------------------------------------------------------------

DROP TABLE IF EXISTS `yoyo_activity_coupon`;

CREATE TABLE `yoyo_activity_coupon` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `UserId` bigint(20) NOT NULL COMMENT '会员编号',
  `WinId` bigint(20) NOT NULL COMMENT '中奖编号',
  `CouponType` int(11) NOT NULL COMMENT '券类型',
  `EffectiveTime` datetime NOT NULL COMMENT '生效时间',
  `UseTime` datetime DEFAULT NULL COMMENT '使用时间',
  `ExpireTime` datetime NOT NULL COMMENT '过期时间',
  `State` int(2) NOT NULL COMMENT '状态 1正常 2生效中 3已使用 4已过期',
  `CreateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `Remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`Id`) USING BTREE,
  KEY `UserId` (`UserId`) USING BTREE,
  KEY `WinId` (`WinId`) USING BTREE,
  KEY `UserId_Type` (`UserId`,`CouponType`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table yoyo_activity_prize
# ------------------------------------------------------------

DROP TABLE IF EXISTS `yoyo_activity_prize`;

CREATE TABLE `yoyo_activity_prize` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ActivityId` bigint(20) NOT NULL COMMENT '活动编号',
  `PrizeTitle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '奖品名',
  `Figure` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '奖品图',
  `PrizeDesc` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '奖品描述',
  `PrizeType` int(2) NOT NULL DEFAULT '0' COMMENT '奖品类型 0为空奖 1为糖果  2为果皮 3为任务 4为实物',
  `AutoDeal` int(2) NOT NULL DEFAULT '0' COMMENT '自动发放，0不自动，1自动 （ 仅类型为 1 2 3 可用）',
  `Bonus` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '奖金额/任务编号/实物价格',
  `Quantity` int(11) NOT NULL DEFAULT '0' COMMENT '奖品数量',
  `WinRatio` int(11) NOT NULL DEFAULT '0' COMMENT '中奖率',
  `DailyWins` int(11) NOT NULL DEFAULT '0' COMMENT '出奖率(百分比)（0为不限制）',
  `State` int(2) NOT NULL DEFAULT '0' COMMENT '状态 0正常  1删除',
  `CreateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `Remark` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`Id`) USING BTREE,
  KEY `NORMAL_PRIZETYPE` (`PrizeType`) USING BTREE,
  KEY `NORMAL_ACTIVITYID` (`ActivityId`,`PrizeType`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table yoyo_activity_raffle_ecord
# ------------------------------------------------------------

DROP TABLE IF EXISTS `yoyo_activity_raffle_ecord`;

CREATE TABLE `yoyo_activity_raffle_ecord` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ActivityId` bigint(20) NOT NULL DEFAULT '0' COMMENT '活动编号',
  `PrizeId` bigint(20) NOT NULL DEFAULT '0' COMMENT '奖品编号',
  `UserId` bigint(20) NOT NULL DEFAULT '0' COMMENT '会员编号',
  `UseCandy` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '消耗糖果',
  `UsePeel` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '消耗果皮',
  `CreateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `Remark` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`Id`) USING BTREE,
  KEY `NORMAL_ACTIVITYID` (`ActivityId`) USING BTREE,
  KEY `NORMAL_PRIZEID` (`PrizeId`) USING BTREE,
  KEY `NORMAL_USERID` (`UserId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table yoyo_activity_win_record
# ------------------------------------------------------------

DROP TABLE IF EXISTS `yoyo_activity_win_record`;

CREATE TABLE `yoyo_activity_win_record` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ActivityId` bigint(20) NOT NULL DEFAULT '0' COMMENT '活动编号',
  `PrizeId` bigint(20) NOT NULL DEFAULT '0' COMMENT '奖品编号',
  `UserId` bigint(20) NOT NULL DEFAULT '0' COMMENT '会员编号',
  `WinningTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '中奖时间',
  `Person` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '联系人',
  `Contact` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '联系电话',
  `Postcode` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '邮编',
  `MailingAddress` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '邮寄地址',
  `State` int(2) NOT NULL DEFAULT '0' COMMENT '领取状态，0未领取， 1待发货 ， 2已发货  ，4已完成',
  `ReceiveTime` datetime DEFAULT NULL COMMENT '领取时间',
  `Remark` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`Id`) USING BTREE,
  KEY `NORMAL_ACTIVITYID` (`ActivityId`) USING BTREE,
  KEY `NORMAL_PRIZEID_STATE` (`PrizeId`,`State`) USING BTREE,
  KEY `NORMAL_USERID_STATE` (`UserId`,`State`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table yoyo_ad_click
# ------------------------------------------------------------

DROP TABLE IF EXISTS `yoyo_ad_click`;

CREATE TABLE `yoyo_ad_click` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `AdId` int(11) NOT NULL,
  `UserId` bigint(20) NOT NULL,
  `CandyP` decimal(18,2) NOT NULL,
  `ClickId` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ClickDate` date NOT NULL,
  `ClickTime` datetime NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  UNIQUE KEY `FK_ClickId_ClickDate` (`ClickId`,`ClickDate`) USING BTREE,
  KEY `FK_UserId,_ClickDate` (`UserId`,`ClickDate`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table yoyo_ad_master
# ------------------------------------------------------------

DROP TABLE IF EXISTS `yoyo_ad_master`;

CREATE TABLE `yoyo_ad_master` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Type` int(2) NOT NULL COMMENT '广告类型',
  `Place` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '位置',
  `ImgSrc` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '图片路径',
  `Alt` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '简述',
  `Url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '跳转地址',
  `Sort` int(3) NOT NULL COMMENT '排序',
  `Status` int(2) NOT NULL COMMENT '状态',
  `StartDate` datetime NOT NULL COMMENT '开始时间',
  `EndDate` datetime NOT NULL COMMENT '结束时间',
  `CreateTime` datetime NOT NULL COMMENT '创建时间',
  `Remark` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '备注',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table yoyo_bang_appeals
# ------------------------------------------------------------

DROP TABLE IF EXISTS `yoyo_bang_appeals`;

CREATE TABLE `yoyo_bang_appeals` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `RecordId` bigint(20) NOT NULL COMMENT '任务记录编号',
  `TaskId` bigint(20) NOT NULL COMMENT '任务编号',
  `Pictures` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '申诉图',
  `Reason` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '原因',
  `State` int(2) NOT NULL COMMENT '状态',
  `CreateTime` datetime NOT NULL COMMENT '创建时间',
  `Remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`Id`) USING BTREE,
  KEY `NORMAL_TASK_RECORD` (`TaskId`,`RecordId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table yoyo_bang_category
# ------------------------------------------------------------

DROP TABLE IF EXISTS `yoyo_bang_category`;

CREATE TABLE `yoyo_bang_category` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `Name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '分类名',
  `Icon` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '图标',
  `MinPrice` decimal(10,2) NOT NULL DEFAULT '1.00' COMMENT '最小单价',
  `Desc` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '说明',
  `Sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `Pid` bigint(20) NOT NULL DEFAULT '0' COMMENT '父类编号',
  `IsDel` int(2) NOT NULL DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`Id`) USING BTREE,
  KEY `NORMAL_PID_SORT` (`Pid`,`Sort`) USING BTREE,
  KEY `NORMAL_PID` (`Sort`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table yoyo_bang_rank
# ------------------------------------------------------------

DROP TABLE IF EXISTS `yoyo_bang_rank`;

CREATE TABLE `yoyo_bang_rank` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `TaskId` bigint(20) NOT NULL COMMENT '任务编号',
  `TaskType` int(2) NOT NULL COMMENT '任务类型',
  `OfferPrice` decimal(10,2) NOT NULL COMMENT '出价',
  `EffectiveTime` datetime NOT NULL COMMENT '生效时间',
  `ExpirationTime` datetime NOT NULL COMMENT '失效时间',
  `CreateTime` datetime NOT NULL COMMENT '创建时间',
  `Remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`Id`) USING BTREE,
  KEY `NORMAL_TASK_TYPE` (`TaskId`,`TaskType`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table yoyo_bang_record
# ------------------------------------------------------------

DROP TABLE IF EXISTS `yoyo_bang_record`;

CREATE TABLE `yoyo_bang_record` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `UserId` bigint(20) NOT NULL COMMENT '会员编号',
  `TaskId` bigint(20) NOT NULL DEFAULT '0' COMMENT '任务编号',
  `TaskDetail` varchar(4000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '任务详情',
  `EntryTime` datetime NOT NULL COMMENT '报名时间',
  `SubmitTime` datetime DEFAULT NULL COMMENT '提交时间',
  `CutoffTime` datetime NOT NULL COMMENT '截止时间',
  `AuditTime` datetime DEFAULT NULL COMMENT '审核时间',
  `State` int(2) NOT NULL COMMENT '状态',
  `Remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`Id`) USING BTREE,
  KEY `NORMAL_USER_TASK` (`UserId`,`TaskId`,`State`) USING BTREE,
  KEY `NORMAL_TASK_USERID` (`TaskId`,`UserId`,`State`) USING BTREE,
  KEY `NORMAL_STATE` (`State`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table yoyo_bang_step
# ------------------------------------------------------------

DROP TABLE IF EXISTS `yoyo_bang_step`;

CREATE TABLE `yoyo_bang_step` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `TaskId` bigint(64) NOT NULL DEFAULT '0' COMMENT '任务编号',
  `Type` int(2) NOT NULL DEFAULT '0' COMMENT '类型',
  `Describe` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '描述',
  `Content` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '内容',
  `Sort` int(2) NOT NULL COMMENT '排序',
  `Remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table yoyo_bang_task
# ------------------------------------------------------------

DROP TABLE IF EXISTS `yoyo_bang_task`;

CREATE TABLE `yoyo_bang_task` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `Publisher` bigint(20) NOT NULL COMMENT '发布人编号',
  `Project` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '项目名',
  `Title` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '标题',
  `CateId` bigint(20) NOT NULL COMMENT '分类编号',
  `Desc` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '说明',
  `SubmitHour` int(2) NOT NULL DEFAULT '0' COMMENT '任务时长',
  `Step` int(2) NOT NULL COMMENT '步骤数',
  `AuditHour` int(2) NOT NULL DEFAULT '0' COMMENT '审核时长',
  `IsRepeat` int(1) NOT NULL DEFAULT '0' COMMENT '是否重复可做',
  `RewardType` int(2) NOT NULL COMMENT '奖励类型 1 现金  2 糖果  3果皮',
  `UnitPrice` decimal(18,2) NOT NULL COMMENT '单次金额',
  `Complete` int(11) NOT NULL DEFAULT '0' COMMENT '完成数',
  `FeeRate` decimal(6,4) NOT NULL DEFAULT '1.0000' COMMENT '手续费折扣比率',
  `Total` int(11) NOT NULL DEFAULT '0' COMMENT '总量',
  `State` int(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `CreateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `UpdateTime` datetime DEFAULT NULL COMMENT '修改时间',
  `Remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`Id`) USING BTREE,
  KEY `NORMAL_PUBLISHER_STATE` (`Publisher`,`State`) USING BTREE,
  KEY `NORMAL_REPEAT` (`IsRepeat`) USING BTREE,
  KEY `NORMAL_TYPE` (`RewardType`) USING BTREE,
  KEY `NORMAL_STATE` (`State`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table yoyo_box_activity
# ------------------------------------------------------------

DROP TABLE IF EXISTS `yoyo_box_activity`;

CREATE TABLE `yoyo_box_activity` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Period` int(11) NOT NULL DEFAULT '1' COMMENT '期次',
  `PrizePool` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '奖池',
  `UnitPrice` decimal(16,4) NOT NULL COMMENT '起始单价',
  `BuyTotal` int(11) NOT NULL COMMENT '购买总数',
  `EndTime` datetime NOT NULL COMMENT '结束时间',
  `State` int(2) NOT NULL COMMENT '状态 0未启动  1正常  2已完成',
  `CreateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `Remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`Id`) USING BTREE,
  UNIQUE KEY `UNIQUE_PERIOD` (`Period`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table yoyo_box_record
# ------------------------------------------------------------

DROP TABLE IF EXISTS `yoyo_box_record`;

CREATE TABLE `yoyo_box_record` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Period` int(11) NOT NULL COMMENT '期次',
  `UserId` bigint(18) NOT NULL COMMENT '会员编号',
  `UnitPrice` decimal(16,4) NOT NULL COMMENT '购买单价',
  `BuyTotal` int(11) NOT NULL COMMENT '购买数量',
  `CreateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '购买时间',
  `Remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`Id`) USING BTREE,
  KEY `NORMAL_USER_PERIOD` (`UserId`,`Period`) USING BTREE,
  KEY `NORMAL_PERIOD_USER` (`Period`,`UserId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table yoyo_box_winer
# ------------------------------------------------------------

DROP TABLE IF EXISTS `yoyo_box_winer`;

CREATE TABLE `yoyo_box_winer` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Period` int(11) NOT NULL COMMENT '期次',
  `RecordId` bigint(16) NOT NULL COMMENT '中奖编号',
  `UserId` bigint(16) NOT NULL COMMENT '中奖人',
  `Award` decimal(18,4) NOT NULL COMMENT '中奖奖金',
  `Dividend` decimal(18,4) NOT NULL COMMENT '中奖分红',
  `SingleValue` decimal(18,4) NOT NULL COMMENT '单个分红',
  `CreateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `Remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`Id`) USING BTREE,
  UNIQUE KEY `UNIQUE_PERIOD` (`Period`) USING BTREE,
  KEY `NORMAL_WINER` (`UserId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table yoyo_cash_dividend
# ------------------------------------------------------------

DROP TABLE IF EXISTS `yoyo_cash_dividend`;

CREATE TABLE `yoyo_cash_dividend` (
  `CashDate` date NOT NULL,
  `Cash` decimal(16,2) NOT NULL,
  `SingleCandy` decimal(16,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`CashDate`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table yoyo_city_master
# ------------------------------------------------------------

DROP TABLE IF EXISTS `yoyo_city_master`;

CREATE TABLE `yoyo_city_master` (
  `CityId` int(11) NOT NULL AUTO_INCREMENT,
  `UserId` bigint(20) NOT NULL,
  `CityCode` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CityName` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `WeChat` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `Mobile` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `StartTime` date NOT NULL,
  `EndTime` date NOT NULL,
  PRIMARY KEY (`CityId`) USING BTREE,
  UNIQUE KEY `FK_CityCode` (`CityCode`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table yoyo_everyday_dividend
# ------------------------------------------------------------

DROP TABLE IF EXISTS `yoyo_everyday_dividend`;

CREATE TABLE `yoyo_everyday_dividend` (
  `DividendDate` date NOT NULL,
  `CandyFee` decimal(18,6) NOT NULL,
  `Star1` decimal(18,6) NOT NULL,
  `People1` int(11) NOT NULL,
  `Star2` decimal(18,6) NOT NULL,
  `People2` int(11) NOT NULL,
  `Star3` decimal(18,6) NOT NULL,
  `People3` int(11) NOT NULL,
  `Star4` decimal(18,6) NOT NULL,
  `People4` int(11) NOT NULL,
  `Star5` decimal(18,6) NOT NULL,
  `People5` int(11) NOT NULL,
  PRIMARY KEY (`DividendDate`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table yoyo_luckydraw_defaultuser
# ------------------------------------------------------------

DROP TABLE IF EXISTS `yoyo_luckydraw_defaultuser`;

CREATE TABLE `yoyo_luckydraw_defaultuser` (
  `UserId` bigint(20) NOT NULL,
  PRIMARY KEY (`UserId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table yoyo_luckydraw_prize
# ------------------------------------------------------------

DROP TABLE IF EXISTS `yoyo_luckydraw_prize`;

CREATE TABLE `yoyo_luckydraw_prize` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Level` int(11) NOT NULL,
  `Name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Mark` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Pic` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `StatusDesc` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedTime` datetime(6) NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  KEY `IX_yoyo_luckydraw_prize_Name` (`Name`) USING BTREE,
  KEY `IX_yoyo_luckydraw_prize_CreatedTime` (`CreatedTime`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table yoyo_luckydraw_round
# ------------------------------------------------------------

DROP TABLE IF EXISTS `yoyo_luckydraw_round`;

CREATE TABLE `yoyo_luckydraw_round` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Level` int(11) NOT NULL,
  `PrizeId` int(11) NOT NULL,
  `Status` int(11) DEFAULT NULL,
  `NeedRoundNumber` int(11) NOT NULL,
  `CurrentRoundNumber` int(11) NOT NULL,
  `MaxNumber` int(11) NOT NULL,
  `AutoNext` bit(1) NOT NULL,
  `WinnerType` int(11) NOT NULL,
  `DelayHour` int(11) NOT NULL,
  `OpenTime` datetime(6) DEFAULT NULL,
  `UpdatedTime` datetime(6) DEFAULT NULL,
  `CreatedTime` datetime(6) NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  KEY `IX_yoyo_luckydraw_round_Status` (`Status`) USING BTREE,
  KEY `IX_yoyo_luckydraw_round_Level` (`Level`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table yoyo_luckydraw_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `yoyo_luckydraw_user`;

CREATE TABLE `yoyo_luckydraw_user` (
  `Id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `RoundId` int(11) NOT NULL,
  `UserId` bigint(20) NOT NULL,
  `AddressId` int(11) DEFAULT NULL,
  `CandyCount` int(11) NOT NULL,
  `IsWin` bit(1) NOT NULL,
  `PrizeId` int(11) DEFAULT NULL,
  `CreatedTime` datetime(6) NOT NULL,
  PRIMARY KEY (`UserId`,`RoundId`) USING BTREE,
  KEY `IX_yoyo_luckydraw_user_RoundId` (`RoundId`) USING BTREE,
  KEY `IX_yoyo_luckydraw_user_CreatedTime` (`CreatedTime`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table yoyo_mall_order
# ------------------------------------------------------------

DROP TABLE IF EXISTS `yoyo_mall_order`;

CREATE TABLE `yoyo_mall_order` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '订单编号',
  `UserId` bigint(20) NOT NULL COMMENT '团长ID',
  `UnionNo` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '联盟订单编号',
  `UnionType` int(11) NOT NULL COMMENT '订单类型',
  `UnionPid` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '联盟推广位ID',
  `UnionCustom` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '自定义参数',
  `GoodsId` bigint(20) NOT NULL COMMENT '商品ID',
  `GoodsName` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '商品名称',
  `GoodsImage` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '商品图片',
  `GoodsPrice` decimal(18,2) NOT NULL COMMENT '商品单价',
  `GoodsQuantity` int(11) NOT NULL COMMENT '购买数量',
  `OrderAmount` decimal(18,2) NOT NULL COMMENT '订单金额',
  `Commission` decimal(18,4) NOT NULL COMMENT '团长佣金',
  `OrderStatus` int(11) NOT NULL COMMENT '本地结算状态',
  `CreateTime` datetime NOT NULL COMMENT '订单创建时间',
  `ModifyTime` datetime DEFAULT NULL COMMENT '订单更新时间',
  `Remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`Id`) USING BTREE,
  UNIQUE KEY `UNIQUE_UNION_NO` (`UnionNo`) USING BTREE,
  KEY `FK_USERID` (`UserId`) USING BTREE,
  KEY `FK_ORDERSTATUS` (`OrderStatus`) USING BTREE,
  KEY `FK_UNIONTYPE` (`UnionType`) USING BTREE,
  KEY `FK_CREATETIME` (`CreateTime`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table yoyo_member_active
# ------------------------------------------------------------

DROP TABLE IF EXISTS `yoyo_member_active`;

CREATE TABLE `yoyo_member_active` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `UserId` bigint(20) NOT NULL,
  `JPushId` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ActiveTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Remark` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`Id`) USING BTREE,
  UNIQUE KEY `UNIQUE_USERID` (`UserId`) USING BTREE,
  KEY `NORMAL_ACTIVE` (`ActiveTime`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table yoyo_member_address
# ------------------------------------------------------------

DROP TABLE IF EXISTS `yoyo_member_address`;

CREATE TABLE `yoyo_member_address` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `UserId` bigint(20) NOT NULL,
  `Name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Phone` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Province` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `City` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Area` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `PostCode` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `IsDefault` int(11) NOT NULL,
  `IsDel` int(11) NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  KEY `FK_UserId` (`UserId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table yoyo_member_daily_task
# ------------------------------------------------------------

DROP TABLE IF EXISTS `yoyo_member_daily_task`;

CREATE TABLE `yoyo_member_daily_task` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `UserId` bigint(20) NOT NULL,
  `TaskId` int(11) NOT NULL,
  `Carry` int(11) NOT NULL,
  `CompleteDate` date NOT NULL,
  `Completed` int(11) NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  UNIQUE KEY `UK_UserTask` (`UserId`,`TaskId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table yoyo_member_devote
# ------------------------------------------------------------

DROP TABLE IF EXISTS `yoyo_member_devote`;

CREATE TABLE `yoyo_member_devote` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `UserId` bigint(20) NOT NULL,
  `DevoteDate` date NOT NULL,
  `Devote` decimal(18,2) NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  UNIQUE KEY `UK_UserId_DevoteDate` (`UserId`,`DevoteDate`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table yoyo_member_duplicate
# ------------------------------------------------------------

DROP TABLE IF EXISTS `yoyo_member_duplicate`;

CREATE TABLE `yoyo_member_duplicate` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Date` date NOT NULL,
  `UserId` bigint(20) NOT NULL,
  `Duplicate` decimal(18,5) NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  UNIQUE KEY `UK_Date_UserId` (`Date`,`UserId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table yoyo_member_invite_ranking
# ------------------------------------------------------------

DROP TABLE IF EXISTS `yoyo_member_invite_ranking`;

CREATE TABLE `yoyo_member_invite_ranking` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Phase` int(11) NOT NULL,
  `UserId` bigint(20) NOT NULL,
  `InviteTotal` int(11) NOT NULL,
  `InviteToday` int(11) NOT NULL,
  `InviteDate` date NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  UNIQUE KEY `FK_Phase_UserId` (`Phase`,`UserId`) USING BTREE,
  KEY `FK_InviteTotal` (`InviteTotal`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table yoyo_member_relation
# ------------------------------------------------------------

DROP TABLE IF EXISTS `yoyo_member_relation`;

CREATE TABLE `yoyo_member_relation` (
  `MemberId` bigint(20) NOT NULL COMMENT '会员ID',
  `ParentId` bigint(20) NOT NULL COMMENT '父级用户ID',
  `RelationLevel` int(11) NOT NULL COMMENT '关系层级',
  `Topology` text COLLATE utf8mb4_unicode_ci,
  `CreateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`MemberId`) USING BTREE,
  KEY `FK_ParentId` (`ParentId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table yoyo_pay_record
# ------------------------------------------------------------

DROP TABLE IF EXISTS `yoyo_pay_record`;

CREATE TABLE `yoyo_pay_record` (
  `PayId` bigint(20) NOT NULL AUTO_INCREMENT,
  `UserId` bigint(20) NOT NULL,
  `Channel` int(8) NOT NULL,
  `Currency` int(8) NOT NULL,
  `Amount` decimal(10,2) NOT NULL,
  `Fee` decimal(10,2) NOT NULL,
  `ActionType` int(8) NOT NULL COMMENT '操作类型',
  `Custom` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `PayStatus` int(11) NOT NULL COMMENT '-1,无效,0未支付,1已完成,2已退款',
  `ChannelUID` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '第三方支付平台ID',
  `CreateTime` datetime NOT NULL,
  `ModifyTime` datetime DEFAULT NULL,
  PRIMARY KEY (`PayId`) USING BTREE,
  KEY `FK_UserId` (`UserId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table yoyo_recharge_order
# ------------------------------------------------------------

DROP TABLE IF EXISTS `yoyo_recharge_order`;

CREATE TABLE `yoyo_recharge_order` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `OrderNo` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '订单号',
  `ChannelNo` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '渠道订单号',
  `OrderType` int(11) NOT NULL DEFAULT '1' COMMENT '订单类型 1 话费充值',
  `UserId` bigint(20) NOT NULL DEFAULT '0' COMMENT '会员编号',
  `ProductId` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '商品编号',
  `ProductName` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '商品名',
  `FaceValue` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '面值',
  `Account` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '账号',
  `Price` decimal(16,4) NOT NULL DEFAULT '0.0000' COMMENT '单价',
  `BuyNum` int(11) NOT NULL DEFAULT '1' COMMENT '数量',
  `PurchasePrice` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '进货价',
  `PayCandy` decimal(16,4) NOT NULL DEFAULT '0.0000' COMMENT '支付糖果数',
  `PayPeel` decimal(16,4) NOT NULL COMMENT '支付果皮数',
  `State` int(11) NOT NULL COMMENT '状态',
  `CreateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `UpdateTime` datetime DEFAULT NULL COMMENT '更新时间',
  `Remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  KEY `OrderNo` (`OrderNo`) USING BTREE,
  KEY `ChannelNo` (`ChannelNo`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table yoyo_shandw_order
# ------------------------------------------------------------

DROP TABLE IF EXISTS `yoyo_shandw_order`;

CREATE TABLE `yoyo_shandw_order` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ChannelNo` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '渠道号',
  `ChannelUid` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '渠道会员编号',
  `ChannelOrderNo` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '渠道订单号',
  `GameAppId` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '游戏编号',
  `Product` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '商品',
  `UserId` bigint(16) NOT NULL COMMENT '会员编号',
  `PayMoney` decimal(18,4) NOT NULL COMMENT '支付金额',
  `Amount` decimal(18,4) NOT NULL COMMENT '分红金额',
  `PayTime` datetime DEFAULT NULL COMMENT '支付时间',
  `State` int(11) NOT NULL COMMENT '0 未分红 1已分红',
  `CreateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `Remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`Id`) USING BTREE,
  UNIQUE KEY `UNIQUE_ORDER_NO` (`ChannelOrderNo`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table yoyo_sign_record
# ------------------------------------------------------------

DROP TABLE IF EXISTS `yoyo_sign_record`;

CREATE TABLE `yoyo_sign_record` (
  `Sign` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ServerTime` datetime NOT NULL,
  `ClientTime` datetime NOT NULL,
  `ControllerName` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ActionName` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`Sign`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table yoyo_system_copywriting
# ------------------------------------------------------------

DROP TABLE IF EXISTS `yoyo_system_copywriting`;

CREATE TABLE `yoyo_system_copywriting` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` int(11) NOT NULL,
  `title` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table yoyo_system_task
# ------------------------------------------------------------

DROP TABLE IF EXISTS `yoyo_system_task`;

CREATE TABLE `yoyo_system_task` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Sort` int(11) NOT NULL,
  `TaskType` int(11) NOT NULL COMMENT '0=用户注册，1=广告分享，2=买单，3=卖单，4=游戏',
  `TaskTitle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TaskDesc` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Reward` decimal(18,2) NOT NULL,
  `Aims` int(11) NOT NULL,
  `Unit` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Devote` decimal(18,2) NOT NULL COMMENT '活跃贡献值',
  `Status` int(11) NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table yoyo_task_record
# ------------------------------------------------------------

DROP TABLE IF EXISTS `yoyo_task_record`;

CREATE TABLE `yoyo_task_record` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `MId` bigint(20) NOT NULL DEFAULT '0' COMMENT '矿机Id',
  `UserId` bigint(20) NOT NULL COMMENT '会员编号',
  `Schedule` decimal(11,2) NOT NULL COMMENT '进度',
  `Source` int(3) NOT NULL COMMENT '来源',
  `CreateDate` date NOT NULL COMMENT '创建时间',
  `StartTime` datetime DEFAULT NULL,
  `EndTime` datetime DEFAULT NULL,
  `UpdateDate` datetime NOT NULL COMMENT '更新时间',
  `Remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `USER_DATE` (`MId`,`UserId`,`CreateDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
