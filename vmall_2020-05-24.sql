# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.26)
# Database: vmall
# Generation Time: 2020-05-24 14:55:59 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table app_categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `app_categories`;

CREATE TABLE `app_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '类目名称',
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '类目icon',
  `type` int(11) DEFAULT NULL COMMENT '0--H5；1--分类',
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '跳转地址（H5才有）',
  `state` int(11) DEFAULT NULL COMMENT '0待审核；1已上架；2已下架；3待开始；4使用中；5已结束',
  `weight` int(11) DEFAULT NULL COMMENT '权重',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `last_update` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '最后修改人',
  `last_update_time` datetime DEFAULT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `app_categories` WRITE;
/*!40000 ALTER TABLE `app_categories` DISABLE KEYS */;

INSERT INTO `app_categories` (`id`, `name`, `icon`, `type`, `url`, `state`, `weight`, `start_time`, `end_time`, `last_update`, `last_update_time`)
VALUES
	(1,'aa','https://wx2.sinaimg.cn/mw690/6b239626gy1gekrz72dbjj209k09kt9i.jpg',0,'bb',0,1,'2020-05-09 17:01:23','2020-05-29 00:00:00','javaboy','2020-05-09 17:02:40'),
	(2,'旅游','https://wx1.sinaimg.cn/mw690/6b239626gy1g74zotqtimj20p00dw11q.jpg',1,'',0,3,'2020-05-09 23:19:08','2020-05-16 00:00:00','javaboy','2020-05-09 23:19:22'),
	(3,'休闲食品','https://wx2.sinaimg.cn/mw690/6b239626gy1g1030jqqlej206s06w0tj.jpg',1,'',0,1,'2020-05-09 23:24:41','2020-05-16 00:00:00','javaboy','2020-05-09 23:24:47'),
	(4,'j精品酒店','https://wx2.sinaimg.cn/mw690/6b239626gy1gewtw1tjl9j20dc0dctb7.jpg',0,'http://www.javaboy.org',0,2,'2020-05-18 17:52:14','2020-05-30 08:00:00','javaboy','2020-05-18 09:52:20');

/*!40000 ALTER TABLE `app_categories` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table app_tabs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `app_tabs`;

CREATE TABLE `app_tabs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Tab名称',
  `active_icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Tab活跃图标',
  `inactive_icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Tab不活跃图标',
  `state` int(11) DEFAULT NULL COMMENT '0待审核；1已上架；2已下架；3待开始；4使用中；5已结束',
  `weight` int(11) DEFAULT NULL COMMENT '权重',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `type` int(11) DEFAULT NULL COMMENT '0 立即生效；1 定时活动',
  `description` text COLLATE utf8mb4_unicode_ci COMMENT '说明',
  `last_update` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '最后修改人',
  `last_update_time` datetime DEFAULT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `app_tabs` WRITE;
/*!40000 ALTER TABLE `app_tabs` DISABLE KEYS */;

INSERT INTO `app_tabs` (`id`, `name`, `active_icon`, `inactive_icon`, `state`, `weight`, `start_time`, `end_time`, `type`, `description`, `last_update`, `last_update_time`)
VALUES
	(1,'aa','http://sang.lan:8004/icon/2020/05/18/b7cf13e3-d11a-4e22-a073-6d0299f74ad2.png','http://sang.lan:8004/icon/2020/05/18/b74363d5-2432-4362-87f9-74737948ac2b.png',0,1,NULL,NULL,NULL,'bb','javaboy','2020-05-18 20:46:21'),
	(2,'bb','http://sang.lan:8004/icon/2020/05/18/a4a16d7b-3db8-42f6-91e6-e3f493b462c6.png','http://sang.lan:8004/icon/2020/05/18/8620507e-1522-4db5-a661-d88fd3966a5e.png',0,1,NULL,NULL,0,'cc','javaboy','2020-05-18 21:05:09'),
	(3,'bb','http://sang.lan:8004/icon/2020/05/18/a4a16d7b-3db8-42f6-91e6-e3f493b462c6.png','http://sang.lan:8004/icon/2020/05/18/8620507e-1522-4db5-a661-d88fd3966a5e.png',0,1,'2020-05-19 05:05:24','2020-05-27 08:00:00',1,'cc','javaboy','2020-05-18 21:05:30'),
	(4,'我的','http://sang.lan:8004/icon/2020/05/19/a697d040-085d-47a1-a7ee-86fc319c00b5.png','http://sang.lan:8004/icon/2020/05/19/1c000c7d-ab20-4278-853f-317a6ea7925b.png',4,100,NULL,NULL,0,'我的','javaboy','2020-05-19 09:46:36'),
	(5,'首页','http://sang.lan:8004/icon/2020/05/19/47271108-7271-43d1-b112-00314a719014.png','http://sang.lan:8004/icon/2020/05/19/9bb75507-0726-474f-8e32-7f1938a0dee6.png',4,400,NULL,NULL,0,'首页','javaboy','2020-05-19 09:48:10'),
	(6,'分类','http://sang.lan:8004/icon/2020/05/19/47271108-7271-43d1-b112-00314a719014.png','http://sang.lan:8004/icon/2020/05/19/9bb75507-0726-474f-8e32-7f1938a0dee6.png',4,300,NULL,NULL,0,'分类','javaboy','2020-05-19 09:52:04'),
	(7,'购物车','http://sang.lan:8004/icon/2020/05/19/47271108-7271-43d1-b112-00314a719014.png','http://sang.lan:8004/icon/2020/05/19/9bb75507-0726-474f-8e32-7f1938a0dee6.png',4,200,NULL,NULL,0,'购物车','javaboy','2020-05-19 10:11:42');

/*!40000 ALTER TABLE `app_tabs` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table bbt_member_info
# ------------------------------------------------------------

DROP TABLE IF EXISTS `bbt_member_info`;

CREATE TABLE `bbt_member_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `customer_id` bigint(20) DEFAULT NULL,
  `corp_id` varchar(100) DEFAULT NULL COMMENT '企业ID',
  `corp_user_id` varchar(100) DEFAULT NULL COMMENT '企业会员id',
  `mobile` varchar(30) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `pass_word` varchar(300) DEFAULT NULL COMMENT '密码',
  `nick` varchar(50) DEFAULT NULL COMMENT '昵称',
  `avatar` varchar(200) DEFAULT NULL COMMENT '头像',
  `sex` varchar(10) DEFAULT NULL COMMENT '性别',
  `age` int(2) DEFAULT NULL,
  `birthday` datetime DEFAULT NULL COMMENT '出生日期',
  `open_id` varchar(200) DEFAULT NULL,
  `height` double DEFAULT NULL COMMENT '身高',
  `weight` double DEFAULT NULL COMMENT '体重',
  `profession` varchar(100) DEFAULT NULL COMMENT '职业',
  `province` bigint(20) DEFAULT NULL COMMENT '省份',
  `city` bigint(20) DEFAULT NULL COMMENT '城市',
  `area` bigint(20) DEFAULT NULL COMMENT '地区',
  `street` bigint(20) DEFAULT NULL COMMENT '街道',
  `address` varchar(300) DEFAULT NULL COMMENT '详细地址',
  `province_name` varchar(100) DEFAULT NULL,
  `street_name` varchar(100) DEFAULT NULL,
  `area_name` varchar(100) DEFAULT NULL,
  `city_name` varchar(100) DEFAULT NULL,
  `last_login_time` datetime NOT NULL,
  `last_login_ip` varchar(128) NOT NULL,
  `authorize_ip` int(2) DEFAULT NULL COMMENT '是否授权获取ip地址',
  `proxy_power` int(2) DEFAULT NULL COMMENT '1表示有权限',
  `qiye_wx_user_id` varchar(100) DEFAULT NULL COMMENT '企业微信用户ID',
  `tb_user_id` varchar(128) DEFAULT NULL COMMENT '淘宝用户ID',
  `tb_user_valid_time` datetime DEFAULT NULL COMMENT '淘宝用户生效时间',
  `wx_union_id` varchar(100) DEFAULT NULL COMMENT '微信用户唯一标识',
  `job_number` varchar(100) DEFAULT NULL COMMENT '工号',
  `status` int(2) DEFAULT '1' COMMENT '用户状态 1正常 2 冻结',
  `carrier_type` int(2) DEFAULT NULL COMMENT '运营商用户',
  `create_time` datetime DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_open_id` (`open_id`),
  KEY `index_mobile` (`mobile`),
  KEY `index_last_login_time` (`last_login_time`),
  KEY `index_corp_id` (`corp_id`),
  KEY `index_mall_id` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table oauth_client_details
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oauth_client_details`;

CREATE TABLE `oauth_client_details` (
  `client_id` varchar(48) NOT NULL,
  `resource_ids` varchar(256) DEFAULT NULL,
  `client_secret` varchar(256) DEFAULT NULL,
  `scope` varchar(256) DEFAULT NULL,
  `authorized_grant_types` varchar(256) DEFAULT NULL,
  `web_server_redirect_uri` varchar(256) DEFAULT NULL,
  `authorities` varchar(256) DEFAULT NULL,
  `access_token_validity` int(11) DEFAULT NULL,
  `refresh_token_validity` int(11) DEFAULT NULL,
  `additional_information` varchar(4096) DEFAULT NULL,
  `autoapprove` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `oauth_client_details` WRITE;
/*!40000 ALTER TABLE `oauth_client_details` DISABLE KEYS */;

INSERT INTO `oauth_client_details` (`client_id`, `resource_ids`, `client_secret`, `scope`, `authorized_grant_types`, `web_server_redirect_uri`, `authorities`, `access_token_validity`, `refresh_token_validity`, `additional_information`, `autoapprove`)
VALUES
	('javaboy','www.javaboy.org','$2a$10$oJMstM2qARFzKekkOnB6QOT41.Qq5cBfKMepdtr9pcKJASb6qwSmC','seller-auth','password,refresh_token','http://localhost:8080/index.html',NULL,7200,259200,NULL,'true');

/*!40000 ALTER TABLE `oauth_client_details` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table vmall_seller
# ------------------------------------------------------------

DROP TABLE IF EXISTS `vmall_seller`;

CREATE TABLE `vmall_seller` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户数字ID',
  `seller_nick` varchar(45) NOT NULL COMMENT '用户nick',
  `customer_remark` varchar(50) DEFAULT NULL,
  `password` varchar(200) NOT NULL DEFAULT '' COMMENT '用户密码',
  `app_key` bigint(20) DEFAULT NULL COMMENT 'app_key',
  `app_secret` varchar(100) NOT NULL COMMENT '用户app_secret',
  `callback_url` varchar(255) DEFAULT NULL,
  `refresh_token` varchar(225) DEFAULT NULL,
  `w2_expires_in` bigint(10) DEFAULT '0' COMMENT '短授权有效时间（单位：秒）',
  `avatar` varchar(200) DEFAULT NULL,
  `mobile` varchar(59) DEFAULT NULL COMMENT '手机号码',
  `email` varchar(60) DEFAULT NULL COMMENT '电子邮箱',
  `parent_nick` varchar(45) DEFAULT NULL COMMENT '父账号nick',
  `subscribe_version` int(2) DEFAULT NULL COMMENT '用户版本号',
  `dead_line` datetime DEFAULT NULL COMMENT '到期时间',
  `type` int(2) NOT NULL DEFAULT '0' COMMENT '用户类型 0表示普通用户 1表示高级用户 9表示vip',
  `plus_time` datetime DEFAULT NULL COMMENT '赠送时间',
  `gift_version` int(2) DEFAULT NULL COMMENT '赠送版本',
  `last_login_time` datetime DEFAULT NULL,
  `last_login_ip` varchar(128) DEFAULT NULL,
  `settlement_type` int(2) DEFAULT '0' COMMENT '结算类型 0表示时结算 1表示月结算',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `username` char(255) DEFAULT NULL COMMENT '用户名',
  `account_non_expired` bit(1) DEFAULT b'1',
  `account_non_locked` bit(1) DEFAULT b'1',
  `credentials_non_expired` bit(1) DEFAULT b'1',
  `enabled` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `seller_nick` (`seller_nick`) USING BTREE,
  UNIQUE KEY `app_key` (`app_key`) USING BTREE,
  KEY `parent_nick` (`parent_nick`) USING BTREE,
  KEY `create_time` (`create_time`) USING BTREE,
  KEY `customer_mobile` (`mobile`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';

LOCK TABLES `vmall_seller` WRITE;
/*!40000 ALTER TABLE `vmall_seller` DISABLE KEYS */;

INSERT INTO `vmall_seller` (`id`, `seller_nick`, `customer_remark`, `password`, `app_key`, `app_secret`, `callback_url`, `refresh_token`, `w2_expires_in`, `avatar`, `mobile`, `email`, `parent_nick`, `subscribe_version`, `dead_line`, `type`, `plus_time`, `gift_version`, `last_login_time`, `last_login_ip`, `settlement_type`, `create_time`, `modify_time`, `username`, `account_non_expired`, `account_non_locked`, `credentials_non_expired`, `enabled`)
VALUES
	(1,'江南一点雨',NULL,'$2a$10$0h2Y2CGMYKDfj0wD5OARFeCpYCnHYfAoNsSL57WydHE4OA6C4cyOi',NULL,'',NULL,NULL,0,'http://img.itboyhub.com/2020/03/123.png','18568886666','123@javaboy.org',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,0,'2020-04-22 14:46:09','2020-05-08 01:02:48','javaboy',b'1',b'1',b'1',b'1');

/*!40000 ALTER TABLE `vmall_seller` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
