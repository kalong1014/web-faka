-- MySQL dump 10.13  Distrib 5.7.40, for Linux (x86_64)
--
-- Host: localhost    Database: 666
-- ------------------------------------------------------
-- Server version	5.7.40-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `acg_bill`
--

DROP TABLE IF EXISTS `acg_bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acg_bill` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `owner` int(10) unsigned NOT NULL COMMENT '用户id',
  `amount` decimal(10,2) unsigned NOT NULL COMMENT '金额',
  `balance` decimal(14,2) unsigned NOT NULL COMMENT '余额',
  `type` tinyint(4) NOT NULL COMMENT '类型：0=支出，1=收入',
  `currency` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '货币：0=余额，1=硬币',
  `log` varchar(64) NOT NULL COMMENT '日志',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `owner` (`owner`) USING BTREE,
  KEY `type` (`type`) USING BTREE,
  CONSTRAINT `acg_bill_ibfk_1` FOREIGN KEY (`owner`) REFERENCES `acg_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acg_bill`
--

LOCK TABLES `acg_bill` WRITE;
/*!40000 ALTER TABLE `acg_bill` DISABLE KEYS */;
INSERT INTO `acg_bill` VALUES (1,1000,9999999.00,9999999.00,1,0,'00','2023-04-26 03:48:36');
/*!40000 ALTER TABLE `acg_bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acg_business`
--

DROP TABLE IF EXISTS `acg_business`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acg_business` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `user_id` int(10) unsigned NOT NULL COMMENT '用户id',
  `shop_name` varchar(32) DEFAULT NULL COMMENT '店铺名称',
  `title` varchar(32) DEFAULT NULL COMMENT '浏览器标题',
  `notice` text COMMENT '店铺公告',
  `service_qq` varchar(16) DEFAULT NULL COMMENT '客服QQ',
  `service_url` varchar(255) DEFAULT NULL COMMENT '网页客服链接',
  `subdomain` varchar(64) DEFAULT NULL COMMENT '子域名',
  `topdomain` varchar(64) DEFAULT NULL COMMENT '顶级域名',
  `master_display` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '主站显示：0=否，1=是',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `user_id` (`user_id`) USING BTREE,
  UNIQUE KEY `subdomain` (`subdomain`) USING BTREE,
  UNIQUE KEY `topdomain` (`topdomain`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acg_business`
--

LOCK TABLES `acg_business` WRITE;
/*!40000 ALTER TABLE `acg_business` DISABLE KEYS */;
INSERT INTO `acg_business` VALUES (1,1000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'2023-04-26 03:48:14');
/*!40000 ALTER TABLE `acg_business` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acg_business_level`
--

DROP TABLE IF EXISTS `acg_business_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acg_business_level` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(32) NOT NULL COMMENT '等级名称',
  `icon` varchar(255) DEFAULT NULL COMMENT '图标',
  `cost` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '商家自己的商品，抽成百分比',
  `accrual` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '主站商品，分给商家的收益百分比',
  `substation` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '分站：0=关闭，1=启用',
  `top_domain` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '顶级域名：0=关闭，1=启用',
  `price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '购买价格',
  `supplier` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '供货商权限：0=关闭，1=启用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acg_business_level`
--

LOCK TABLES `acg_business_level` WRITE;
/*!40000 ALTER TABLE `acg_business_level` DISABLE KEYS */;
INSERT INTO `acg_business_level` VALUES (1,'体验版','/assets/static/images/business/v1.png',0.30,0.10,1,0,188.00,1),(3,'普通版','/assets/static/images/business/v2.png',0.25,0.15,1,0,288.00,1),(4,'专业版','/assets/static/images/business/v3.png',0.20,0.20,1,1,388.00,1);
/*!40000 ALTER TABLE `acg_business_level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acg_card`
--

DROP TABLE IF EXISTS `acg_card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acg_card` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `owner` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '所属会员：0=系统，其他等于会员UID',
  `commodity_id` int(10) unsigned NOT NULL COMMENT '商品id',
  `draft` varchar(255) DEFAULT NULL COMMENT '预选信息',
  `secret` varchar(760) NOT NULL COMMENT '卡密信息',
  `create_time` datetime NOT NULL COMMENT '添加时间',
  `purchase_time` datetime DEFAULT NULL COMMENT '购买时间',
  `order_id` int(10) unsigned DEFAULT NULL COMMENT '订单id',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态：0=未出售，1=已出售，2=已锁定',
  `note` varchar(64) DEFAULT NULL COMMENT '备注信息',
  `race` varchar(32) DEFAULT NULL COMMENT '商品种类',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `owner` (`owner`) USING BTREE,
  KEY `commodity_id` (`commodity_id`) USING BTREE,
  KEY `order_id` (`order_id`) USING BTREE,
  KEY `secret` (`secret`) USING BTREE,
  KEY `status` (`status`) USING BTREE,
  KEY `note` (`note`) USING BTREE,
  KEY `race` (`race`) USING BTREE,
  CONSTRAINT `acg_card_ibfk_1` FOREIGN KEY (`commodity_id`) REFERENCES `acg_commodity` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acg_card`
--

LOCK TABLES `acg_card` WRITE;
/*!40000 ALTER TABLE `acg_card` DISABLE KEYS */;
/*!40000 ALTER TABLE `acg_card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acg_cash`
--

DROP TABLE IF EXISTS `acg_cash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acg_cash` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `user_id` int(10) unsigned NOT NULL COMMENT '用户id',
  `amount` decimal(14,2) unsigned NOT NULL COMMENT '提现金额',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '类型：0=自动提现，1=手动提现',
  `card` tinyint(3) unsigned NOT NULL COMMENT '收款：0=支付宝，1=微信',
  `create_time` datetime NOT NULL COMMENT '提现时间',
  `arrive_time` datetime DEFAULT NULL COMMENT '到账时间',
  `cost` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '手续费',
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态：0=处理中，1=成功，2=失败，3=冻结期',
  `message` varchar(64) DEFAULT NULL COMMENT '消息',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `type` (`type`) USING BTREE,
  KEY `message` (`message`) USING BTREE,
  CONSTRAINT `acg_cash_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `acg_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acg_cash`
--

LOCK TABLES `acg_cash` WRITE;
/*!40000 ALTER TABLE `acg_cash` DISABLE KEYS */;
/*!40000 ALTER TABLE `acg_cash` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acg_category`
--

DROP TABLE IF EXISTS `acg_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acg_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(255) CHARACTER SET utf8mb4 NOT NULL COMMENT '商品分类名称',
  `sort` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `owner` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '所属会员：0=系统，其他等于会员UID',
  `icon` varchar(255) DEFAULT NULL COMMENT '分类图标',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态：0=停用，1=启用',
  `hide` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '隐藏：1=隐藏，0=不隐藏',
  `user_level_config` text COMMENT '会员配置',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `owner` (`owner`) USING BTREE,
  KEY `sort` (`sort`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acg_category`
--

LOCK TABLES `acg_category` WRITE;
/*!40000 ALTER TABLE `acg_category` DISABLE KEYS */;
INSERT INTO `acg_category` VALUES (3,'学习资料',1,'2023-04-26 03:50:12',0,NULL,1,0,NULL);
/*!40000 ALTER TABLE `acg_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acg_commodity`
--

DROP TABLE IF EXISTS `acg_commodity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acg_commodity` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `category_id` int(10) unsigned NOT NULL COMMENT '商品分类ID',
  `name` varchar(255) CHARACTER SET utf8mb4 NOT NULL COMMENT '商品名称',
  `description` text CHARACTER SET utf8mb4 COMMENT '商品说明',
  `cover` varchar(255) DEFAULT NULL COMMENT '商品封面图片',
  `factory_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '成本单价',
  `price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '商品单价(未登录)',
  `user_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '商品单价(会员价)',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态：0=下架，1=上架',
  `owner` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '所属会员：0=系统，其他等于会员UID',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `api_status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'API对接：0=关闭，1=启用',
  `code` varchar(64) NOT NULL COMMENT '商品代码(API对接)',
  `delivery_way` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '发货方式：0=自动发货，1=手动发货/插件发货',
  `delivery_auto_mode` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '自动发卡模式：0=旧卡先发，1=随机发卡，2=新卡先发',
  `delivery_message` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '手动发货显示信息',
  `contact_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '联系方式：0=任意，1=手机，2=邮箱，3=QQ',
  `password_status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '订单密码：0=关闭，1=启用',
  `sort` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `coupon` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '优惠卷：0=关闭，1=启用',
  `shared_id` int(10) unsigned DEFAULT NULL COMMENT '共享平台ID',
  `shared_code` varchar(64) DEFAULT NULL COMMENT '共享平台-商品代码',
  `shared_premium` float(10,2) unsigned DEFAULT '0.00' COMMENT '商品加价',
  `shared_premium_type` tinyint(3) unsigned DEFAULT '0' COMMENT '加价模式',
  `seckill_status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '商品秒杀：0=关闭，1=开启',
  `seckill_start_time` datetime DEFAULT NULL COMMENT '秒杀开始时间',
  `seckill_end_time` datetime DEFAULT NULL COMMENT '秒杀结束时间',
  `draft_status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '指定卡密购买：0=关闭，1=启用',
  `draft_premium` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '指定卡密购买时溢价',
  `inventory_hidden` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '隐藏库存：0=否，1=是',
  `leave_message` varchar(255) DEFAULT NULL COMMENT '发货留言',
  `recommend` tinyint(3) unsigned DEFAULT '0' COMMENT '推荐商品：0=否，1=是',
  `send_email` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '发送邮件：0=否，1=是',
  `only_user` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '限制登录购买：0=否，1=是',
  `purchase_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '限制购买数量：0=无限制',
  `widget` text CHARACTER SET utf8mb4 COMMENT '控件',
  `level_price` text COMMENT '会员等级-定制价格',
  `level_disable` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '禁用会员等级折扣，0=关闭，1=启用',
  `minimum` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最低购买数量，0=无限制',
  `maximum` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最大购买数量，0=无限制',
  `shared_sync` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '同步平台价格：0=关，1=开',
  `config` text CHARACTER SET utf8mb4 COMMENT '配置文件',
  `hide` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '隐藏：1=隐藏，0=不隐藏',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `code` (`code`) USING BTREE,
  KEY `owner` (`owner`) USING BTREE,
  KEY `status` (`status`) USING BTREE,
  KEY `sort` (`sort`) USING BTREE,
  KEY `category_id` (`category_id`) USING BTREE,
  KEY `shared_id` (`shared_id`) USING BTREE,
  KEY `seckill_status` (`seckill_status`) USING BTREE,
  KEY `api_status` (`api_status`) USING BTREE,
  KEY `recommend` (`recommend`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acg_commodity`
--

LOCK TABLES `acg_commodity` WRITE;
/*!40000 ALTER TABLE `acg_commodity` DISABLE KEYS */;
/*!40000 ALTER TABLE `acg_commodity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acg_config`
--

DROP TABLE IF EXISTS `acg_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acg_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(128) NOT NULL COMMENT '配置键名称',
  `value` text CHARACTER SET utf8mb4 NOT NULL COMMENT '配置内容',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `key` (`key`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acg_config`
--

LOCK TABLES `acg_config` WRITE;
/*!40000 ALTER TABLE `acg_config` DISABLE KEYS */;
INSERT INTO `acg_config` VALUES (1,'shop_name','异次元店铺'),(2,'title','凡的云小店！'),(3,'description',''),(4,'keywords',''),(14,'user_theme','WorkThemeOne'),(5,'registered_state','1'),(6,'registered_type','0'),(7,'registered_verification','1'),(8,'registered_phone_verification','0'),(9,'registered_email_verification','0'),(10,'sms_config','{\"accessKeyId\":\"\",\"accessKeySecret\":\"\",\"signName\":\"\",\"templateCode\":\"\"}'),(11,'email_config','{\"smtp\":\"smtp.qq.com\",\"secure\":\"0\",\"port\":\"465\",\"username\":\"3157476848@qq.com\",\"password\":\"qfeeyryzkdfpdfee\"}'),(12,'login_verification','1'),(13,'forget_type','0'),(15,'notice','<p>全都是免费商品下面点击领取就OK了！</p>'),(16,'trade_verification','0'),(17,'recharge_welfare','0'),(18,'recharge_welfare_config',''),(19,'promote_rebate_v1','0.1'),(20,'promote_rebate_v2','0.2'),(21,'promote_rebate_v3','0.3'),(22,'substation_display','0'),(24,'domain',''),(25,'service_qq','2912608810'),(26,'service_url',''),(27,'cash_type_alipay','1'),(28,'cash_type_wechat','1'),(29,'cash_cost','5'),(30,'cash_min','100'),(31,'cname',''),(32,'background_url','/assets/cache/images/202304260219275169492.jpg'),(33,'default_category','0'),(34,'substation_display_list','[]'),(35,'closed','0'),(36,'closed_message','我们正在升级，请耐心等待完成'),(37,'recharge_min','10'),(38,'recharge_max','1000'),(39,'user_mobile_theme','WorkThemeOne'),(40,'commodity_recommend','1'),(41,'commodity_name','推荐'),(42,'background_mobile_url','/assets/cache/images/202304260219275169492.jpg'),(43,'username_len','6'),(44,'cash_type_balance','0'),(45,'callback_domain','');
/*!40000 ALTER TABLE `acg_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acg_coupon`
--

DROP TABLE IF EXISTS `acg_coupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acg_coupon` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `code` varchar(32) NOT NULL COMMENT '优惠卷代码',
  `commodity_id` int(10) unsigned NOT NULL COMMENT '商品id',
  `owner` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '所属会员：0=系统，其他等于会员UID',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `expire_time` datetime DEFAULT NULL COMMENT '过期时间',
  `service_time` datetime DEFAULT NULL COMMENT '使用时间',
  `money` decimal(10,2) unsigned NOT NULL COMMENT '抵扣金额',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态：0=未使用，1=已使用，2=锁定',
  `trade_no` char(22) DEFAULT NULL COMMENT '订单号',
  `note` varchar(32) DEFAULT NULL COMMENT '备注信息',
  `mode` tinyint(3) unsigned DEFAULT '0' COMMENT '抵扣模式',
  `category_id` int(10) unsigned DEFAULT '0' COMMENT '商品分类ID',
  `life` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '卡密使用寿命',
  `use_life` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '已使用次数',
  `race` varchar(32) DEFAULT NULL COMMENT '商品类别',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `code` (`code`) USING BTREE,
  KEY `commodity_id` (`commodity_id`) USING BTREE,
  KEY `owner` (`owner`) USING BTREE,
  KEY `create_time` (`create_time`) USING BTREE,
  KEY `money` (`money`) USING BTREE,
  KEY `status` (`status`) USING BTREE,
  KEY `order_id` (`trade_no`) USING BTREE,
  KEY `note` (`note`) USING BTREE,
  KEY `race` (`race`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acg_coupon`
--

LOCK TABLES `acg_coupon` WRITE;
/*!40000 ALTER TABLE `acg_coupon` DISABLE KEYS */;
/*!40000 ALTER TABLE `acg_coupon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acg_manage`
--

DROP TABLE IF EXISTS `acg_manage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acg_manage` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(64) NOT NULL COMMENT '邮箱',
  `password` varchar(64) NOT NULL COMMENT '密码',
  `security_password` varchar(64) DEFAULT NULL COMMENT '安全密码',
  `nickname` varchar(32) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '昵称',
  `salt` varchar(32) NOT NULL COMMENT '盐',
  `avatar` varchar(128) DEFAULT NULL COMMENT '头像',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态：0=冻结，1=正常',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '类型：0=系统账号，1=普通账号(全天)，2=日间账号，3=夜间账号',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `login_time` datetime DEFAULT NULL COMMENT '登录时间',
  `last_login_time` datetime DEFAULT NULL COMMENT '上一次登录时间',
  `login_ip` varchar(128) DEFAULT NULL COMMENT '登录IP',
  `last_login_ip` varchar(128) DEFAULT NULL COMMENT '上一次登录IP',
  `note` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `username` (`email`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acg_manage`
--

LOCK TABLES `acg_manage` WRITE;
/*!40000 ALTER TABLE `acg_manage` DISABLE KEYS */;
INSERT INTO `acg_manage` VALUES (1,'2912608810@qq.com','ed100085674675559d953fe2f0fc8c5d503bc537',NULL,'fyy','bb5c144a87841efa265d1661509bafe2','/favicon.ico',1,0,'1997-01-01 00:00:00','2023-04-28 18:50:25','2023-04-28 17:41:14','223.96.63.184','223.96.60.63',NULL);
/*!40000 ALTER TABLE `acg_manage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acg_manage_log`
--

DROP TABLE IF EXISTS `acg_manage_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acg_manage_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `email` varchar(64) NOT NULL COMMENT '管理员邮箱',
  `nickname` varchar(32) NOT NULL COMMENT '管理员呢称',
  `content` varchar(128) NOT NULL COMMENT '日志内容',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `create_ip` varchar(64) NOT NULL COMMENT 'IP地址',
  `ua` varchar(255) DEFAULT NULL COMMENT '浏览器UA',
  `risk` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '风险：0=正常，1=异常',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `create_ip` (`create_ip`) USING BTREE,
  KEY `create_time` (`create_time`) USING BTREE,
  KEY `risk` (`risk`) USING BTREE,
  KEY `email` (`email`) USING BTREE,
  KEY `nickname` (`nickname`) USING BTREE,
  KEY `content` (`content`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acg_manage_log`
--

LOCK TABLES `acg_manage_log` WRITE;
/*!40000 ALTER TABLE `acg_manage_log` DISABLE KEYS */;
INSERT INTO `acg_manage_log` VALUES (1,'2912608810@qq.com','fyy','登录了后台','2023-04-26 02:11:54','223.96.63.184','Chrome',1),(2,'2912608810@qq.com','fyy','修改了邮件配置','2023-04-26 02:15:50','223.96.63.184','Chrome',1),(3,'2912608810@qq.com','fyy','测试了邮件发送','2023-04-26 02:16:01','223.96.63.184','Chrome',1),(4,'2912608810@qq.com','fyy','修改了其他设置','2023-04-26 02:16:37','223.96.63.184','Chrome',1),(5,'2912608810@qq.com','fyy','修改了邮件配置','2023-04-26 02:18:14','223.96.63.184','Chrome',1),(6,'2912608810@qq.com','fyy','修改了网站设置','2023-04-26 02:19:33','223.96.63.184','Chrome',1),(7,'2912608810@qq.com','fyy','修改了网站设置','2023-04-26 02:20:27','223.96.63.184','Chrome',1),(8,'2912608810@qq.com','fyy','[删除]支付接口，共计：1','2023-04-26 02:21:21','223.96.63.184','Chrome',1),(9,'2912608810@qq.com','fyy','[删除]商品分类','2023-04-26 02:22:22','223.96.63.184','Chrome',1),(10,'2912608810@qq.com','fyy','[新增/修改]商品分类','2023-04-26 02:22:49','223.96.63.184','Chrome',1),(11,'2912608810@qq.com','fyy','[修改/新增]商品','2023-04-26 02:23:59','223.96.63.184','Chrome',1),(12,'2912608810@qq.com','fyy','[导入卡密]共计导入:1张卡密，成功:1张，失败：0张','2023-04-26 02:25:43','223.96.63.184','Chrome',1),(13,'2912608810@qq.com','fyy','[批量更新]商品启停状态','2023-04-26 02:26:38','223.96.63.184','Chrome',1),(14,'2912608810@qq.com','fyy','[修改/新增]商品','2023-04-26 02:30:33','223.96.63.184','Chrome',1),(15,'2912608810@qq.com','fyy','[批量更新]商品启停状态','2023-04-26 02:30:45','223.96.63.184','Chrome',1),(16,'2912608810@qq.com','fyy','[导入卡密]共计导入:1张卡密，成功:1张，失败：0张','2023-04-26 02:31:13','223.96.63.184','Chrome',1),(17,'2912608810@qq.com','fyy','安装了应用(BuiltPayExtend)','2023-04-26 02:33:02','223.96.63.184','Chrome',1),(18,'2912608810@qq.com','fyy','[修改/新增]支付接口','2023-04-26 02:34:28','223.96.63.184','Chrome',1),(19,'2912608810@qq.com','fyy','[修改/新增]支付接口','2023-04-26 02:34:38','223.96.63.184','Chrome',1),(20,'2912608810@qq.com','fyy','安装了应用(PaypalCallback)','2023-04-26 02:35:55','223.96.63.184','Chrome',1),(21,'2912608810@qq.com','fyy','[修改/新增]支付接口','2023-04-26 02:37:15','223.96.63.184','Chrome',1),(22,'2912608810@qq.com','fyy','安装了应用(UsdtPay)','2023-04-26 02:37:51','223.96.63.184','Chrome',1),(23,'2912608810@qq.com','fyy','[修改/新增]支付接口','2023-04-26 02:38:46','223.96.63.184','Chrome',1),(24,'2912608810@qq.com','fyy','安装了应用(Epay)','2023-04-26 02:43:05','223.96.63.184','Chrome',1),(25,'2912608810@qq.com','fyy','安装了应用(WeChat)','2023-04-26 02:43:48','223.96.63.184','Chrome',1),(26,'2912608810@qq.com','fyy','安装了应用(VmqPay)','2023-04-26 02:44:56','223.96.63.184','Chrome',1),(27,'2912608810@qq.com','fyy','卸载了应用(BuiltPayExtend)','2023-04-26 02:45:09','223.96.63.184','Chrome',1),(28,'2912608810@qq.com','fyy','卸载了应用(UsdtPay)','2023-04-26 02:45:13','223.96.63.184','Chrome',1),(29,'2912608810@qq.com','fyy','安装了应用(LiZhi)','2023-04-26 02:46:27','223.96.63.184','Chrome',1),(30,'2912608810@qq.com','fyy','安装了应用(Jshi)','2023-04-26 02:48:32','223.96.63.184','Chrome',1),(31,'2912608810@qq.com','fyy','安装了应用(Paypal)','2023-04-26 02:49:06','223.96.63.184','Chrome',1),(32,'2912608810@qq.com','fyy','修改了支付插件(Epay)的配置信息','2023-04-26 03:01:58','223.96.63.184','Chrome',1),(33,'2912608810@qq.com','fyy','修改了支付插件(Epay)的配置信息','2023-04-26 03:02:03','223.96.63.184','Chrome',1),(34,'2912608810@qq.com','fyy','[修改/新增]支付接口','2023-04-26 03:02:25','223.96.63.184','Chrome',1),(35,'2912608810@qq.com','fyy','[删除]商品','2023-04-26 03:04:02','223.96.63.184','Chrome',1),(36,'2912608810@qq.com','fyy','[修改/新增]商品','2023-04-26 03:04:44','223.96.63.184','Chrome',1),(37,'2912608810@qq.com','fyy','[批量更新]商品启停状态','2023-04-26 03:04:50','223.96.63.184','Chrome',1),(38,'2912608810@qq.com','fyy','[导入卡密]共计导入:1张卡密，成功:1张，失败：0张','2023-04-26 03:05:06','223.96.63.184','Chrome',1),(39,'2912608810@qq.com','fyy','[修改/新增]商品','2023-04-26 03:06:35','223.96.63.184','Chrome',1),(40,'2912608810@qq.com','fyy','修改了支付插件(Epay)的配置信息','2023-04-26 03:11:22','223.96.63.184','Chrome',1),(41,'2912608810@qq.com','fyy','安装了应用(WorkThemeOne)','2023-04-26 03:38:47','223.96.63.184','Chrome',1),(42,'2912608810@qq.com','fyy','修改了网站设置','2023-04-26 03:39:04','223.96.63.184','Chrome',1),(43,'2912608810@qq.com','fyy','修改了网站设置','2023-04-26 03:39:53','223.96.63.184','Chrome',1),(44,'2912608810@qq.com','fyy','安装了应用(WorkThemeTwo)','2023-04-26 03:43:32','223.96.63.184','Chrome',1),(45,'2912608810@qq.com','fyy','安装了应用(UsdtPay)','2023-04-26 03:43:52','223.96.63.184','Chrome',1),(46,'2912608810@qq.com','fyy','卸载了应用(Epay)','2023-04-26 03:43:58','223.96.63.184','Chrome',1),(47,'2912608810@qq.com','fyy','卸载了应用(Jshi)','2023-04-26 03:44:01','223.96.63.184','Chrome',1),(48,'2912608810@qq.com','fyy','卸载了应用(LiZhi)','2023-04-26 03:44:04','223.96.63.184','Chrome',1),(49,'2912608810@qq.com','fyy','卸载了应用(Paypal)','2023-04-26 03:44:06','223.96.63.184','Chrome',1),(50,'2912608810@qq.com','fyy','卸载了应用(UsdtPay)','2023-04-26 03:44:09','223.96.63.184','Chrome',1),(51,'2912608810@qq.com','fyy','卸载了应用(VmqPay)','2023-04-26 03:44:12','223.96.63.184','Chrome',1),(52,'2912608810@qq.com','fyy','[删除]支付接口，共计：1','2023-04-26 03:44:32','223.96.63.184','Chrome',1),(53,'2912608810@qq.com','fyy','[删除]支付接口，共计：1','2023-04-26 03:44:35','223.96.63.184','Chrome',1),(54,'2912608810@qq.com','fyy','[删除]支付接口，共计：1','2023-04-26 03:44:39','223.96.63.184','Chrome',1),(55,'2912608810@qq.com','fyy','[修改/新增]支付接口','2023-04-26 03:44:58','223.96.63.184','Chrome',1),(56,'2912608810@qq.com','fyy','修改了其他设置','2023-04-26 03:46:30','223.96.63.184','Chrome',1),(57,'2912608810@qq.com','fyy','修改了网站设置','2023-04-26 03:47:33','223.96.63.184','Chrome',1),(58,'2912608810@qq.com','fyy','修改了会员(fifuffj)的信息。','2023-04-26 03:48:14','223.96.63.184','Chrome',1),(59,'2912608810@qq.com','fyy','为会员(fifuffj)进行了余额/硬币变动操作，详情查看账变明细','2023-04-26 03:48:36','223.96.63.184','Chrome',1),(60,'2912608810@qq.com','fyy','[删除]商品分类','2023-04-26 03:49:55','223.96.63.184','Chrome',1),(61,'2912608810@qq.com','fyy','[新增/修改]商品分类','2023-04-26 03:50:12','223.96.63.184','Chrome',1),(62,'2912608810@qq.com','fyy','登录了后台','2023-04-26 03:53:40','223.96.63.184','Chrome',0),(63,'2912608810@qq.com','fyy','登录了后台','2023-04-26 04:26:17','223.96.63.184','Chrome',0),(64,'2912608810@qq.com','fyy','登录了后台','2023-04-26 04:27:01','223.96.63.184','Chrome',0),(65,'2912608810@qq.com','fyy','登录了后台','2023-04-26 06:13:38','223.96.63.184','Chrome',0),(66,'2912608810@qq.com','fyy','登录了后台','2023-04-26 07:10:59','112.224.190.108','Chrome',1),(67,'2912608810@qq.com','fyy','登录了后台','2023-04-26 08:05:16','112.224.190.108','Chrome',0),(68,'2912608810@qq.com','fyy','登录了后台','2023-04-28 17:41:14','223.96.60.63','Chrome',1),(69,'2912608810@qq.com','fyy','登录了后台','2023-04-28 18:50:25','223.96.63.184','Chrome',1);
/*!40000 ALTER TABLE `acg_manage_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acg_order`
--

DROP TABLE IF EXISTS `acg_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acg_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `owner` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '所属会员：0=游客，其他等于会员UID',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商户ID：0=系统，其他等于会员ID',
  `trade_no` char(19) NOT NULL COMMENT '订单号',
  `amount` decimal(10,2) unsigned NOT NULL COMMENT '订单金额',
  `commodity_id` int(10) unsigned NOT NULL COMMENT '商品id',
  `card_id` int(10) unsigned DEFAULT NULL COMMENT '预选卡密id',
  `card_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '卡密数量',
  `pay_id` int(10) unsigned NOT NULL COMMENT '支付方式id',
  `create_time` datetime NOT NULL COMMENT '下单时间',
  `create_ip` varchar(64) NOT NULL COMMENT '下单IP',
  `create_device` tinyint(3) unsigned NOT NULL COMMENT '下单设备：0=电脑,1=安卓,2=IOS,3=IPAD',
  `pay_time` datetime DEFAULT NULL COMMENT '支付时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '订单状态：0=未支付，1=已支付',
  `secret` longtext COMMENT '卡密信息',
  `password` varchar(32) DEFAULT NULL COMMENT '查询密码',
  `contact` varchar(32) DEFAULT NULL COMMENT '联系方式',
  `delivery_status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '发货状态：0=未发货，1=已发货',
  `pay_url` varchar(1024) DEFAULT NULL,
  `coupon_id` int(10) unsigned DEFAULT NULL COMMENT '优惠卷id',
  `cost` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '手续费',
  `from` int(10) unsigned DEFAULT NULL COMMENT '推广人id',
  `premium` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '加价',
  `widget` text COMMENT '控件内容',
  `rent` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '成本价',
  `race` varchar(32) DEFAULT NULL COMMENT '商品种类',
  `rebate` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '返利金额',
  `pay_cost` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '支付接口手续费',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `trade_no` (`trade_no`) USING BTREE,
  KEY `commodity_id` (`commodity_id`) USING BTREE,
  KEY `pay_id` (`pay_id`) USING BTREE,
  KEY `contact` (`contact`) USING BTREE,
  KEY `create_ip` (`create_ip`) USING BTREE,
  KEY `owner` (`owner`) USING BTREE,
  KEY `from` (`from`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `card_id` (`card_id`) USING BTREE,
  KEY `create_time` (`create_time`) USING BTREE,
  KEY `delivery_status` (`delivery_status`) USING BTREE,
  KEY `coupon_id` (`coupon_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acg_order`
--

LOCK TABLES `acg_order` WRITE;
/*!40000 ALTER TABLE `acg_order` DISABLE KEYS */;
INSERT INTO `acg_order` VALUES (1,1000,0,'714230426023128541',0.00,3,NULL,1,1,'2023-04-26 02:31:28','223.96.63.184',1,'2023-04-26 02:31:28',1,'123',NULL,'-',1,NULL,NULL,0.00,NULL,0.00,'[]',0.00,NULL,0.00,0.00),(2,0,0,'618230426030753975',0.01,4,NULL,1,5,'2023-04-26 03:07:53','223.96.63.184',1,NULL,0,NULL,'123456','2912608810',0,'http://toff.0msl.icu/submit.php',NULL,0.00,NULL,0.00,'[]',0.00,NULL,0.00,0.00),(3,0,0,'176230426031205921',0.01,4,NULL,1,5,'2023-04-26 03:12:05','223.96.63.184',1,NULL,0,NULL,'123456','2912608810',0,'http://toff.0msl.icu/paypage/?merchant=912dztpY6+s7yuvbC8q6u8+Tk0K8T8MbfO8OyzpHY0uP/submit.php',NULL,0.00,NULL,0.00,'[]',0.00,NULL,0.00,0.00),(4,1000,0,'957230426034527316',0.00,4,NULL,1,6,'2023-04-26 03:45:27','223.96.63.184',1,'2023-04-26 03:45:27',1,'1',NULL,'-',1,NULL,NULL,0.00,NULL,0.00,'[]',0.00,NULL,0.00,0.00);
/*!40000 ALTER TABLE `acg_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acg_order_option`
--

DROP TABLE IF EXISTS `acg_order_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acg_order_option` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `order_id` int(10) unsigned NOT NULL COMMENT '订单id',
  `option` text COMMENT '配置数据',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `order_id` (`order_id`) USING BTREE,
  CONSTRAINT `acg_order_option_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `acg_order` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acg_order_option`
--

LOCK TABLES `acg_order_option` WRITE;
/*!40000 ALTER TABLE `acg_order_option` DISABLE KEYS */;
INSERT INTO `acg_order_option` VALUES (1,2,'{\"pid\":\"1000\",\"name\":\"618230426030753975\",\"type\":\"wxpay\",\"money\":0.01,\"out_trade_no\":\"618230426030753975\",\"notify_url\":\"http:\\/\\/diecu.0msl.icu\\/user\\/api\\/order\\/callback.Epay\",\"return_url\":\"http:\\/\\/diecu.0msl.icu\\/user\\/index\\/query?tradeNo=618230426030753975\",\"sitename\":\"618230426030753975\",\"sign\":\"169c5eab1b3a99ec7793882118d962d0\",\"sign_type\":\"MD5\"}'),(2,3,'{\"pid\":\"1000\",\"name\":\"176230426031205921\",\"type\":\"wxpay\",\"money\":0.01,\"out_trade_no\":\"176230426031205921\",\"notify_url\":\"http:\\/\\/diecu.0msl.icu\\/user\\/api\\/order\\/callback.Epay\",\"return_url\":\"http:\\/\\/diecu.0msl.icu\\/user\\/index\\/query?tradeNo=176230426031205921\",\"sitename\":\"176230426031205921\",\"sign\":\"a143579b0a84bc62496bfe0668026a7d\",\"sign_type\":\"MD5\"}');
/*!40000 ALTER TABLE `acg_order_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acg_pay`
--

DROP TABLE IF EXISTS `acg_pay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acg_pay` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(16) NOT NULL COMMENT '支付名称',
  `icon` varchar(255) DEFAULT NULL COMMENT '图标',
  `code` varchar(32) NOT NULL COMMENT '支付代码',
  `commodity` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '前台状态：0=停用，1=启用',
  `recharge` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '充值状态：0=停用，1=启用',
  `create_time` datetime NOT NULL COMMENT '添加时间',
  `handle` varchar(64) NOT NULL COMMENT '支付平台',
  `sort` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `equipment` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '设备：0=通用，1=手机，2=电脑',
  `cost` decimal(10,3) unsigned DEFAULT '0.000' COMMENT '手续费',
  `cost_type` tinyint(3) unsigned DEFAULT '0' COMMENT '手续费模式：0=单笔固定，1=百分比',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `commodity` (`commodity`) USING BTREE,
  KEY `recharge` (`recharge`) USING BTREE,
  KEY `sort` (`sort`) USING BTREE,
  KEY `equipment` (`equipment`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acg_pay`
--

LOCK TABLES `acg_pay` WRITE;
/*!40000 ALTER TABLE `acg_pay` DISABLE KEYS */;
INSERT INTO `acg_pay` VALUES (1,'余额','/assets/static/images/wallet.png','#system',1,0,'1997-01-01 00:00:00','#system',999,0,0.000,0),(6,'领取',NULL,'1',1,1,'2023-04-26 03:44:58','WeChat',1,0,0.000,0);
/*!40000 ALTER TABLE `acg_pay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acg_shared`
--

DROP TABLE IF EXISTS `acg_shared`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acg_shared` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '对接类型：0=内置，其他待扩展',
  `name` varchar(128) NOT NULL COMMENT '店铺名称',
  `domain` varchar(128) NOT NULL COMMENT '店铺地址',
  `app_id` varchar(32) NOT NULL COMMENT '商户ID',
  `app_key` varchar(64) NOT NULL COMMENT '密钥',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `balance` decimal(14,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '余额(缓存)',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `domain` (`domain`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acg_shared`
--

LOCK TABLES `acg_shared` WRITE;
/*!40000 ALTER TABLE `acg_shared` DISABLE KEYS */;
/*!40000 ALTER TABLE `acg_shared` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acg_user`
--

DROP TABLE IF EXISTS `acg_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acg_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `username` varchar(32) NOT NULL COMMENT '会员名',
  `email` varchar(128) DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(16) DEFAULT NULL COMMENT '手机',
  `qq` varchar(16) DEFAULT NULL COMMENT 'QQ号',
  `password` varchar(64) NOT NULL COMMENT '登录密码',
  `salt` varchar(32) NOT NULL COMMENT '盐',
  `app_key` varchar(32) NOT NULL COMMENT '对接密钥',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像',
  `balance` decimal(14,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '余额',
  `coin` decimal(14,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '硬币，可提现的币',
  `integral` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '积分',
  `create_time` datetime NOT NULL COMMENT '注册时间',
  `login_time` datetime DEFAULT NULL COMMENT '登录时间',
  `last_login_time` datetime DEFAULT NULL COMMENT '上一次登录时间',
  `login_ip` varchar(128) CHARACTER SET utf8 DEFAULT NULL COMMENT '登录IP',
  `last_login_ip` varchar(128) CHARACTER SET utf8 DEFAULT NULL COMMENT '上一次登录IP',
  `pid` int(10) unsigned DEFAULT '0' COMMENT '上级ID',
  `recharge` decimal(14,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '累计充值',
  `total_coin` decimal(14,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '累计获得的硬币',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态：0=封禁，1=正常',
  `business_level` int(10) unsigned DEFAULT NULL COMMENT '商户等级id',
  `nicename` varchar(10) DEFAULT NULL COMMENT '真实姓名',
  `alipay` varchar(64) DEFAULT NULL COMMENT '支付宝账号',
  `wechat` varchar(255) DEFAULT NULL COMMENT '微信收款二维码',
  `settlement` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '自动结算：0=支付宝，1=微信',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `username` (`username`) USING BTREE,
  UNIQUE KEY `email` (`email`) USING BTREE,
  UNIQUE KEY `phone` (`phone`) USING BTREE,
  KEY `pid` (`pid`) USING BTREE,
  KEY `business_level` (`business_level`) USING BTREE,
  KEY `coin` (`coin`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acg_user`
--

LOCK TABLES `acg_user` WRITE;
/*!40000 ALTER TABLE `acg_user` DISABLE KEYS */;
INSERT INTO `acg_user` VALUES (1000,'fifuffj',NULL,NULL,NULL,'5ca95d519f3be428e9afb9f8c2b77dcd10fd9b15','57409fec63ec4fd37c7631016a345e6e','D2478890BA4947B7','/favicon.ico',9999999.00,0.00,0,'2023-04-26 02:27:53','2023-04-26 02:27:53',NULL,'223.96.63.184',NULL,0,10000499.00,0.00,1,4,NULL,NULL,NULL,0);
/*!40000 ALTER TABLE `acg_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acg_user_category`
--

DROP TABLE IF EXISTS `acg_user_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acg_user_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `user_id` int(10) unsigned NOT NULL COMMENT '商家id',
  `category_id` int(10) unsigned NOT NULL COMMENT '分类id',
  `name` varchar(255) DEFAULT NULL COMMENT '自定义分类名称',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态：0=屏蔽，1=显示',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `user_id` (`user_id`,`category_id`) USING BTREE,
  KEY `status` (`status`) USING BTREE,
  KEY `acg_user_category_ibfk_2` (`category_id`) USING BTREE,
  KEY `user_id_2` (`user_id`) USING BTREE,
  CONSTRAINT `acg_user_category_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `acg_user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `acg_user_category_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `acg_category` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acg_user_category`
--

LOCK TABLES `acg_user_category` WRITE;
/*!40000 ALTER TABLE `acg_user_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `acg_user_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acg_user_commodity`
--

DROP TABLE IF EXISTS `acg_user_commodity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acg_user_commodity` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `user_id` int(10) unsigned NOT NULL COMMENT '商家id',
  `commodity_id` int(10) unsigned NOT NULL COMMENT '商品id',
  `premium` float(10,2) unsigned DEFAULT '0.00' COMMENT '商品加价',
  `name` varchar(255) DEFAULT NULL COMMENT '自定义名称',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态：0=隐藏，1=显示',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `user_id` (`user_id`,`commodity_id`) USING BTREE,
  KEY `commodity_id` (`commodity_id`) USING BTREE,
  KEY `user_id_2` (`user_id`) USING BTREE,
  KEY `status` (`status`) USING BTREE,
  CONSTRAINT `acg_user_commodity_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `acg_user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `acg_user_commodity_ibfk_2` FOREIGN KEY (`commodity_id`) REFERENCES `acg_commodity` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acg_user_commodity`
--

LOCK TABLES `acg_user_commodity` WRITE;
/*!40000 ALTER TABLE `acg_user_commodity` DISABLE KEYS */;
/*!40000 ALTER TABLE `acg_user_commodity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acg_user_group`
--

DROP TABLE IF EXISTS `acg_user_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acg_user_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(32) NOT NULL COMMENT '等级名称',
  `icon` varchar(128) DEFAULT NULL COMMENT '等级图标',
  `discount` decimal(4,2) unsigned NOT NULL COMMENT '折扣百分比',
  `cost` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '抽成比例',
  `recharge` decimal(14,2) unsigned NOT NULL COMMENT '累计充值(达到该等级)',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `recharge` (`recharge`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acg_user_group`
--

LOCK TABLES `acg_user_group` WRITE;
/*!40000 ALTER TABLE `acg_user_group` DISABLE KEYS */;
INSERT INTO `acg_user_group` VALUES (1,'一贫如洗','/assets/static/images/group/ic_user level_1.png',0.00,0.30,0.00),(2,'小康之家','/assets/static/images/group/ic_user level_2.png',0.10,0.25,50.00),(3,'腰缠万贯','/assets/static/images/group/ic_user level_3.png',0.20,0.20,100.00),(4,'富甲一方','/assets/static/images/group/ic_user level_4.png',0.30,0.15,200.00),(5,'富可敌国','/assets/static/images/group/ic_user level_5.png',0.40,0.10,300.00),(6,'至尊','/assets/static/images/group/ic_user level_6.png',0.50,0.05,500.00);
/*!40000 ALTER TABLE `acg_user_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acg_user_recharge`
--

DROP TABLE IF EXISTS `acg_user_recharge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acg_user_recharge` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `trade_no` char(22) NOT NULL COMMENT '订单号',
  `user_id` int(10) unsigned NOT NULL COMMENT '用户id',
  `amount` decimal(10,2) unsigned NOT NULL COMMENT '充值金额',
  `pay_id` int(10) unsigned NOT NULL COMMENT '支付id',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态：0=未支付，1=已支付',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `create_ip` varchar(64) NOT NULL COMMENT '下单IP',
  `pay_url` varchar(255) DEFAULT NULL COMMENT '支付地址',
  `pay_time` datetime DEFAULT NULL COMMENT '支付时间',
  `option` text COMMENT '配置参数',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `trade_no` (`trade_no`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `pay_id` (`pay_id`) USING BTREE,
  KEY `status` (`status`) USING BTREE,
  CONSTRAINT `acg_user_recharge_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `acg_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acg_user_recharge`
--

LOCK TABLES `acg_user_recharge` WRITE;
/*!40000 ALTER TABLE `acg_user_recharge` DISABLE KEYS */;
/*!40000 ALTER TABLE `acg_user_recharge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `announce_log`
--

DROP TABLE IF EXISTS `announce_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `announce_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `article_id` int(11) NOT NULL DEFAULT '0' COMMENT '公告ID',
  `create_at` int(11) NOT NULL DEFAULT '0' COMMENT '阅读时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announce_log`
--

LOCK TABLES `announce_log` WRITE;
/*!40000 ALTER TABLE `announce_log` DISABLE KEYS */;
INSERT INTO `announce_log` VALUES (1,1,84,1671355242),(2,2,84,1686838786);
/*!40000 ALTER TABLE `announce_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_menu`
--

DROP TABLE IF EXISTS `app_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `function_id` int(11) NOT NULL COMMENT '唯一值',
  `menu` text NOT NULL COMMENT '菜单项',
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_menu_id_uindex` (`id`),
  UNIQUE KEY `app_menu_function_id_uindex` (`function_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='客户端菜单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_menu`
--

LOCK TABLES `app_menu` WRITE;
/*!40000 ALTER TABLE `app_menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_version`
--

DROP TABLE IF EXISTS `app_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_version` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `platform` enum('android','ios') NOT NULL COMMENT '平台',
  `package` varchar(255) NOT NULL COMMENT '安装包下载地址',
  `create_at` int(10) NOT NULL COMMENT '发布时间',
  `version` varchar(255) NOT NULL COMMENT '安装包版本',
  `remark` text NOT NULL COMMENT '更新说明',
  `create_ip` varchar(255) NOT NULL COMMENT '上传 IP',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客户端版本';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_version`
--

LOCK TABLES `app_version` WRITE;
/*!40000 ALTER TABLE `app_version` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article`
--

DROP TABLE IF EXISTS `article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cate_id` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(50) NOT NULL DEFAULT '',
  `title_img` varchar(255) NOT NULL DEFAULT '' COMMENT '标题图',
  `description` text NOT NULL COMMENT '文章描述',
  `content` text NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `views` int(10) unsigned NOT NULL DEFAULT '0',
  `create_at` int(10) unsigned NOT NULL,
  `update_at` int(10) unsigned NOT NULL DEFAULT '0',
  `is_system` tinyint(4) NOT NULL DEFAULT '0' COMMENT '1表示系统调用到的页面，禁止删除',
  `top` int(10) NOT NULL DEFAULT '0' COMMENT '置顶时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article`
--

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` VALUES (4,2,'1.怎么入驻自动发卡平台,成为商户?','','','&lt;p&gt;通过平台的账户注册功能，即可免费入驻自动发卡平台。&lt;/p&gt;\n\n&lt;p&gt;注册完成后，请将收款信息设置好。&lt;/p&gt;\n',1,1,1607699078,0,0,0),(5,2,'2.怎么登录自动发卡平台商户后台?','','','&lt;p&gt;点此右上角“登录”按钮进入&lt;/p&gt;\n',1,1,1607699069,0,0,0),(6,2,'3.怎么用自动发卡平台销售虚拟商品？','','','&lt;p&gt;商户通过后台可以添加商品，每个商品自动发卡平台都会分配一个购买链接，商户只要将这个链接发送给买家，买家付款后平台自动发货，即可完成交易。&lt;/p&gt;\n',1,1,1607699063,0,0,0),(7,2,'4.自动发卡平台可以卖些什么？','','','&lt;p&gt;虚拟商品(例如软件注册码，论坛帐号，卡密商品，等等,（不能出售法律不允许的商品）&lt;/p&gt;\n',1,1,1607699054,0,0,0),(8,2,'5.自动发卡平台账户的金额满多少自动结算？','','','&lt;p&gt;商户账户金额满10元，手工提现，满100元凌晨1点系统自动帮您提交提现，财务将于第二天12点前结算到您预留的账户，&lt;/p&gt;\n',1,1,1607699048,0,0,0),(9,2,'6.自动发卡平台财务结算商户方式有那些？','','','&lt;p&gt;支持支付宝、微信、请商户后台设置好提现账号并上传收款码即可。&lt;/p&gt;\n',1,1,1607699038,0,0,0),(10,2,'7.如果买家已经付款,但是他说没有收到卡密该怎么办？','','','&lt;p&gt;可以发给客户卡密查询地址&lt;br /&gt;\n或者让客户联系自动发卡平台客服协助查询。&lt;/p&gt;\n',1,1,1607699289,0,0,0),(11,2,'8.自动发卡网安全吗？','','','&lt;p&gt;非常安全，自动发卡平台运用先进的安全技术保护用户在250自动发卡平台账户中存储的个人信息、账户信息以及交易记录的安全。自动发卡平台拥有完善的全监测系统，可以及时发现网站的非正常访问并做相应的安全响应。重金采用高防服务器。让您用着:安全，放心。&lt;/p&gt;\n',1,1,1607699030,0,0,0),(13,3,'注册协议','','','&lt;p&gt;本网站在国家相关法律法规规定的范围内，只按现有状况提供软件注册码在线交易第三方网络平台服务，本网站及其所有者非交易一方，也非交易任何一方之代理人或代表;同时， 本网站及其所有者也未授权任何人代表或代理本网站及其所有者从事任何网络交易行为或做出任何承诺、保证或其他类似行为，除非有明确的书面授权。&lt;/p&gt;\r\n\r\n&lt;p&gt;鉴于互联网及网络交易的特殊性，本网站无法鉴别和判断相关交易各主体之民事权利和行为能力、资质、信用等状况，也无法鉴别和判断虚拟交易或正在交易或已交易虚拟物品来源 、权属、真伪、性能、规格、质量、数量等权利属性、自然属性及其他各种状况。因此，交易各方在交易前应加以仔细辨明，并慎重考虑和评估交易可能产生的各项风险。&lt;/p&gt;\r\n\r\n&lt;p&gt;本网站不希望出现任何因虚拟物品交易而在用户之间及用户与游戏开发运营商之间产生纠纷，但并不保证不发生该类纠纷。对于因前述各类情形而产生的任何纠纷，将由交易各方依 据中华人民共和国现行的有关法律通过适当的方式直接加以解决，本网站及其所有者不参与其中；对于因此类交易而产生的各类纠纷之任何责任和后果，由交易各方承担，本网站及其所有者不承担任何责任及后果。&lt;/p&gt;\r\n\r\n&lt;p&gt;本网站不希望出现任何人利用本网站或因使用本网站而侵犯他人合法权益的行为，但并不保证不会发生此类行为或类似行为。本网站将依据中国法律采取必要的措施防止发生前述各类行为或降低发生这类行为的可能性或者降低由此造成的损失及其后果。对于因前述各类情形而产生的任何纠纷，将由权利受到侵害之人和侵权方依据中华人民共和国现行的有关法律通过适当的方式直接加以 解决，本网站及其所有者不参与其中；对于因此类行为产生的各类纠纷之任何责任和后果，由相关责任方承担，本网站及其所有者不承担任何责任及后果。&lt;/p&gt;\r\n\r\n&lt;p&gt;凡有客户投诉涉及不正常交易或疑似诈骗的帐户，公司有权冻结相应帐户。请相应帐户持有人于冻结之日起30日内提供相应证明材料证明交易的真实性或投诉不属实。在相应时间内 未提供材料或材料审核未通过的，公司有权进行帐户相应款项退回处理。&lt;/p&gt;\r\n\r\n&lt;p&gt;任何非本网站责任而产生的任何其他纠纷，概由纠纷各方依据中国相关法律以适当的方式直接加以解决，本网站不参与其中；对于因该类行为产生的各类纠纷之任何责任和后果，由相关各方承担，本网站及其所有者不承担任何责任及后果。&lt;/p&gt;\r\n',1,9,1531535375,0,1,0),(15,3,'用户协议','','','&lt;p&gt;自动发卡网禁止出售涉、黄、赌、毒、抽奖类、诈骗类、公民身份信息、任何实名制账号如微信支付宝、QQ刷赞、卡盟QQ钻、卡密为联系QQ、东鹏红包码、钓鱼类、套现洗钱、金融相关、等任何违反国家法律的类目，一经发现，立刻冻结账户，不予结算！（不要抱有侥幸心理，不管你伪装的再好，风控系统一定会发现你，一经核查发现将备案相关资料移交给相关部门处理）&lt;/p&gt;\n\n&lt;p&gt;本网站在国家相关法律法规规定的范围内，只按现有状况提供软件注册码在线交易第三方网络平台服务，本网站及其所有者非交易一方，也非交易任何一方之代理人或代表;同时， 本网站及其所有者也未授权任何人代表或代理本网站及其所有者从事任何网络交易行为或做出任何承诺、保证或其他类似行为，除非有明确的书面授权。&lt;/p&gt;\n\n&lt;p&gt;鉴于互联网及网络交易的特殊性，本网站无法鉴别和判断相关交易各主体之民事权利和行为能力、资质、信用等状况，也无法鉴别和判断虚拟交易或正在交易或已交易虚拟物品来源 、权属、真伪、性能、规格、质量、数量等权利属性、自然属性及其他各种状况。因此，交易各方在交易前应加以仔细辨明，并慎重考虑和评估交易可能产生的各项风险。&lt;/p&gt;\n\n&lt;p&gt;本网站不希望出现任何因虚拟物品交易而在用户之间及用户与游戏开发运营商之间产生纠纷，但并不保证不发生该类纠纷。对于因前述各类情形而产生的任何纠纷，将由交易各方依 据中华人民共和国现行的有关法律通过适当的方式直接加以解决，本网站及其所有者不参与其中；对于因此类交易而产生的各类纠纷之任何责任和后果，由交易各方承担，本网站及其所有者不承担任何责任及后果。&lt;/p&gt;\n\n&lt;p&gt;本网站不希望出现任何人利用本网站或因使用本网站而侵犯他人合法权益的行为，但并不保证不会发生此类行为或类似行为。本网站将依据中国法律采取必要的措施防止发生前述各类行为或降低发生这类行为的可能性或者降低由此造成的损失及其后果。对于因前述各类情形而产生的任何纠纷，将由权利受到侵害之人和侵权方依据中华人民共和国现行的有关法律通过适当的方式直接加以 解决，本网站及其所有者不参与其中；对于因此类行为产生的各类纠纷之任何责任和后果，由相关责任方承担，本网站及其所有者不承担任何责任及后果。&lt;/p&gt;\n\n&lt;p&gt;凡有客户投诉涉及不正常交易或疑似诈骗的帐户，公司有权冻结相应帐户。请相应帐户持有人于冻结之日起30日内提供相应证明材料证明交易的真实性或投诉不属实。在相应时间内 未提供材料或材料审核未通过的，公司有权进行帐户相应款项退回处理。&lt;/p&gt;\n\n&lt;p&gt;任何非本网站责任而产生的任何其他纠纷，概由纠纷各方依据中国相关法律以适当的方式直接加以解决，本网站不参与其中；对于因该类行为产生的各类纠纷之任何责任和后果，由相关各方承担，本网站及其所有者不承担任何责任及后果。&lt;/p&gt;\n',1,1,1607699273,0,1,0),(17,3,'关于我们','','','&lt;h2&gt;关于我们&lt;/h2&gt;\n\n&lt;p&gt; &lt;/p&gt;\n\n&lt;p&gt;自动发卡网是全新模式最专业的卡密寄售网站。 &lt;/p&gt;\n\n&lt;p&gt;年轻活力、朝气蓬勃、积极向上、团结互助、善于思考、认真工作、 &lt;br /&gt;&lt;br /&gt;\n核心价值： 客户第一、以人为本、团队利益、诚信负责。&lt;/p&gt;\n\n&lt;p&gt;经营理念 ：不断创新，共同成长 。客户至上，用最真挚的态度为客户服务。 始终如一，为梦想而努力奋斗！ &lt;/p&gt;\n',1,1,1607699267,0,0,0),(18,3,'公司简介','','','&lt;p&gt;本公司旗下的发卡啦自动发卡平台在国家相关法律法规规定的范围内，本网站在国家相关法律法规规定的范围内，只按现有状况提供软件注册码在线交易第三方网络平台服务，本网站及其所有者非交易一方，也非交易任何一方之代理人或代表;同时， 本网站及其所有者也未授权任何人代表或代理本网站及其所有者从事任何网络交易行为或做出任何承诺、保证或其他类似行为，除非有明确的书面授权。&lt;/p&gt;\n\n&lt;p&gt;鉴于互联网及网络交易的特殊性，本网站无法鉴别和判断相关交易各主体之民事权利和行为能力、资质、信用等状况，也无法鉴别和判断虚拟交易或正在交易或已交易虚拟物品来源 、权属、真伪、性能、规格、质量、数量等权利属性、自然属性及其他各种状况。因此，交易各方在交易前应加以仔细辨明，并慎重考虑和评估交易可能产生的各项风险。&lt;/p&gt;\n\n&lt;p&gt;本网站不希望出现任何因虚拟物品交易而在用户之间及用户与游戏开发运营商之间产生纠纷，但并不保证不发生该类纠纷。对于因前述各类情形而产生的任何纠纷，将由交易各方依 据中华人民共和国现行的有关法律通过适当的方式直接加以解决，本网站及其所有者不参与其中；对于因此类交易而产生的各类纠纷之任何责任和后果，由交易各方承担，本网站及其所有者不承担任何责任及后果。&lt;/p&gt;\n\n&lt;p&gt;本网站不希望出现任何人利用本网站或因使用本网站而侵犯他人合法权益的行为，但并不保证不会发生此类行为或类似行为。本网站将依据中国法律采取必要的措施防止发生前述各类行为或降低发生这类行为的可能性或者降低由此造成的损失及其后果。对于因前述各类情形而产生的任何纠纷，将由权利受到侵害之人和侵权方依据中华人民共和国现行的有关法律通过适当的方式直接加以 解决，本网站及其所有者不参与其中；对于因此类行为产生的各类纠纷之任何责任和后果，由相关责任方承担，本网站及其所有者不承担任何责任及后果。&lt;/p&gt;\n\n&lt;p&gt;凡有客户投诉涉及不正常交易或疑似诈骗的帐户，公司有权冻结相应帐户。请相应帐户持有人于冻结之日起30日内提供相应证明材料证明交易的真实性或投诉不属实。在相应时间内 未提供材料或材料审核未通过的，公司有权进行帐户相应款项退回处理。&lt;/p&gt;\n\n&lt;p&gt;任何非本网站责任而产生的任何其他纠纷，概由纠纷各方依据中国相关法律以适当的方式直接加以解决，本网站不参与其中；对于因该类行为产生的各类纠纷之任何责任和后果，由相关各方承担，本网站及其所有者不承担任何责任及后果。&lt;/p&gt;\n',1,1,1607699256,0,0,0),(20,3,'免责声明','','','&lt;p&gt;自动发卡网禁止出售涉、黄、赌、毒、抽奖类、诈骗类、公民身份信息、任何实名制账号如微信支付宝、QQ刷赞、卡盟QQ钻、卡密为联系QQ、东鹏红包码、钓鱼类、套现洗钱、金融相关、等任何违反国家法律的类目，一经发现，立刻冻结账户，不予结算！（不要抱有侥幸心理，不管你伪装的再好，风控系统一定会发现你，一经核查发现将备案相关资料移交给相关部门处理）&lt;/p&gt;\n\n&lt;p&gt;本网站在国家相关法律法规规定的范围内，只按现有状况提供虚拟物品在线自动发卡综合解决方案服务，本网站及其所有者非交易一方，也非交易任何一方之代理人或代表;同时，本网站及其所有者也未授权任何人代表或代理本网站及其所有者从事任何网络交易行为或做出任何承诺、保证或其他类似行为，除非有明确的书面授权。&lt;br /&gt;&lt;br /&gt;\n鉴于互联网及网络交易的特殊性，本网站无法鉴别和判断相关交易各主体之民事权利和行为能力、资质、信用等状况，也无法鉴别和判断虚拟交易或正在交易或已交易虚拟物品来源、权属、真伪、性能、规格、质量、数量等权利属性、自然属性及其他各种状况。因此，交易各方在交易前应加以仔细辨明，并慎重考虑和评估交易可能产生的各项风险。&lt;br /&gt;&lt;br /&gt;\n本网站不希望出现任何因虚拟物品交易而在用户之间及用户与游戏开发运营商之间产生纠纷，但并不保证不发生该类纠纷。对于因前述各类情形而产生的任何纠纷，将由交易各方依据中华人民共和国现行的有关法律通过适当的方式直接加以解决，本网站及其所有者不参与其中；对于因此类交易而产生的各类纠纷之任何责任和后果，由交易各方承担，本网站及其所有者不承担任何责任及后果。&lt;br /&gt;&lt;br /&gt;\n本网站不希望出现任何人利用本网站或因使用本网站而侵犯他人合法权益的行为，但并不保证不会发生此类行为或类似行为。本网站将依据中国法律采取必要的措施防止发生前述各类行为或降低发生这类行为的可能性或者降低由此造成的损失及其后果。对于因前述各类情形而产生的任何纠纷，将由权利受到侵害之人和侵权方依据中华人民共和国现行的有关法律通过适当的方式直接加以解决，本网站及其所有者不参与其中；对于因此类行为产生的各类纠纷之任何责任和后果，由相关责任方承担，本网站及其所有者不承担任何责任及后果。&lt;br /&gt;&lt;br /&gt;\n凡有客户投诉涉及不正常交易或疑似诈骗的帐户，公司有权冻结相应帐户。请相应帐户持有人于冻结之日起30日内提供相应证明材料证明交易的真实性或投诉不属实。在相应时间内未提供材料或材料审核未通过的，公司有权进行帐户相应款项退回处理。&lt;br /&gt;&lt;br /&gt;\n任何非本网站责任而产生的任何其他纠纷，概由纠纷各方依据中国相关法律以适当的方式直接加以解决，本网站不参与其中；对于因该类行为产生的各类纠纷之任何责任和后果，由相关各方承担，本网站及其所有者不承担任何责任及后果。&lt;/p&gt;\n',1,8,1607699176,0,0,0),(46,3,'违规举报','','','&lt;p&gt;自动发卡网（禁止销售以下商品）2020年11月4日更新！&lt;/p&gt;\n\n&lt;p&gt;--------------以下类目严禁接入-----------------&lt;/p&gt;\n\n&lt;p&gt;1.涉黄类（涉及淫秽相关所有商品）如直播盒子.色情网站充值码。&lt;/p&gt;\n\n&lt;p&gt;2.涉赌类（涉及赌博相关所有商品）如赌博网站.博彩网站等。&lt;/p&gt;\n\n&lt;p&gt;3.涉毒类（涉及毒品相关所有商品）如毒品买卖。&lt;/p&gt;\n\n&lt;p&gt;4.诈骗类（涉及骗人相关所有商品）如诱导客户付款.欺骗性质为目的的。&lt;/p&gt;\n\n&lt;p&gt;5.手工类（涉及代充相关所有商品）如会员代充，Q名片赞等。&lt;/p&gt;\n\n&lt;p&gt;6.实物类（所有的实物性质的商品）所有的非虚拟的实物商品交易。&lt;/p&gt;\n\n&lt;p&gt;7.套现类（自己为自己充值的商品）例如 支付宝套现。&lt;/p&gt;\n\n&lt;p&gt;8.实名类（涉及公民信息所有商品）如已实名的支付宝账号.微信账号.身份证号.等。&lt;/p&gt;\n\n&lt;p&gt;9.虚假类（卡密为联系QQ的商品 ）如卡密为联系QQXXXX或者QQ群的商品。&lt;/p&gt;\n\n&lt;p&gt;10.金融类（涉及金融相关所有商品）如投资理财网站.返利网站等。&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;color:#e74c3c;&quot;&gt;&lt;strong&gt;涉及以上类目和任何违反国家法律的类目，一经发现，立刻冻结账户，不予结算！&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;（不要抱有侥幸心理,伪装的再好也逃不过我们的风控系统）违规请自觉绕道。&lt;/p&gt;\n\n&lt;p&gt;打造绿色交易平台-本平台诚邀诚信商户入驻-长期合作共赢-在此祝大家生意兴隆-感谢支持和配合。&lt;/p&gt;\n',1,0,1608096663,0,0,0),(60,1,'自动发卡网 ● 禁售商品名单','','','&lt;p&gt;自动发卡平台（禁止销售以下商品）&lt;/p&gt;\n\n&lt;p&gt;--------------以下类目严禁接入-----------------&lt;/p&gt;\n\n&lt;p&gt;1.涉黄类（涉及淫秽相关所有商品）如直播盒子.色情网站充值码。&lt;/p&gt;\n\n&lt;p&gt;2.涉赌类（涉及赌博相关所有商品）如赌博网站.博彩网站等。&lt;/p&gt;\n\n&lt;p&gt;3.涉毒类（涉及毒品相关所有商品）如毒品买卖。&lt;/p&gt;\n\n&lt;p&gt;4.诈骗类（涉及骗人相关所有商品）如诱导客户付款.欺骗性质为目的的。&lt;/p&gt;\n\n&lt;p&gt;5.手工类（涉及代充相关所有商品）如会员代充，Q名片赞等。&lt;/p&gt;\n\n&lt;p&gt;6.实物类（所有的实物性质的商品）所有的非虚拟的实物商品交易。&lt;/p&gt;\n\n&lt;p&gt;7.套现类（自己为自己充值的商品）例如 支付宝套现。&lt;/p&gt;\n\n&lt;p&gt;8.实名类（涉及公民信息所有商品）如已实名的支付宝账号.微信账号.身份证号.等。&lt;/p&gt;\n\n&lt;p&gt;9.虚假类（卡密为联系QQ的商品 ）如卡密为联系QQXXXX或者QQ群的商品。&lt;/p&gt;\n\n&lt;p&gt;10.金融类（设计金融相关所有商品）如投资理财网站.返利网站等。&lt;/p&gt;\n\n&lt;p&gt;&lt;strong&gt;涉及以上类目和任何违反国家法律的类目，一经发现，立刻冻结账户，不予结算！&lt;/strong&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;strong&gt;涉及以上类目和任何违反国家法律的类目，一经发现，立刻冻结账户，不予结算！&lt;/strong&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;strong&gt;涉及以上类目和任何违反国家法律的类目，一经发现，立刻冻结账户，不予结算！&lt;/strong&gt;&lt;/p&gt;\n\n&lt;p&gt; &lt;/p&gt;\n',1,1,1607699015,0,0,0),(84,5,'自动发卡网 ● 平台结算时间','','','&lt;p&gt;平台结算模式:D+1=当天销售金额次日到账，全年无休，节假日正常结算。&lt;/p&gt;\n\n&lt;p&gt;平台（自动提现）到账时间均为每天晚上12点结算&lt;/p&gt;\n\n&lt;p&gt;自动提现免费（小数点后忽略不计）&lt;/p&gt;\n\n&lt;p&gt;手工提现2元手续费（小数点后忽略不计）&lt;/p&gt;\n\n&lt;p&gt;官方网网站：www.xxxx.com 认准唯一官网，谨防假冒。&lt;/p&gt;\n',1,1,1607699003,0,0,0),(86,4,'2020年12月15日系统自动提现资金已到账','','','&lt;p&gt;各位、财付通、微信、支付宝金额已由系统自动打款(满100元的商户)并且已经全部到账，请检查您的钱包，如未到账请在30分钟之后再查询，银行卡结算的商户会延迟2个小时左右到账请悉知，如需帮助请直接联系快发卡客服。&lt;/p&gt;\n',1,1,1608051881,0,0,0);
/*!40000 ALTER TABLE `article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article_category`
--

DROP TABLE IF EXISTS `article_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `path` varchar(1024) NOT NULL,
  `name` varchar(30) NOT NULL DEFAULT '',
  `alias` varchar(30) NOT NULL DEFAULT '',
  `remark` varchar(255) NOT NULL DEFAULT '',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `create_at` int(10) unsigned NOT NULL,
  `update_at` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article_category`
--

LOCK TABLES `article_category` WRITE;
/*!40000 ALTER TABLE `article_category` DISABLE KEYS */;
INSERT INTO `article_category` VALUES (1,0,'0','平台公告','notice','平台公告，首页显示',1,1520268395,0),(2,0,'0','常见问题','faq','常见问题',1,1520268562,0),(3,0,'0','单页','single','单页',1,1521791915,0),(4,0,'0','结算公告','settlement','结算公告',1,1608051837,0),(5,0,'0','系统公告','system','系统公告，商户端显示',1,1612245570,0),(6,0,'0','新闻动态','news','新闻动态',1,1612245570,0);
/*!40000 ALTER TABLE `article_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auto_unfreeze`
--

DROP TABLE IF EXISTS `auto_unfreeze`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auto_unfreeze` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `money` decimal(10,3) unsigned NOT NULL DEFAULT '0.000' COMMENT '冻结金额',
  `unfreeze_time` int(11) NOT NULL DEFAULT '0' COMMENT '解冻时间',
  `created_at` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `trade_no` varchar(255) NOT NULL DEFAULT '0' COMMENT '冻结资金来源订单号',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '冻结资金记录状态，1：可用，-1：不可用（订单申诉中等情况）',
  PRIMARY KEY (`id`),
  KEY `unfreeze_time` (`unfreeze_time`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='订单金额T+1日自动解冻表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auto_unfreeze`
--

LOCK TABLES `auto_unfreeze` WRITE;
/*!40000 ALTER TABLE `auto_unfreeze` DISABLE KEYS */;
INSERT INTO `auto_unfreeze` VALUES (1,2,9999.960,1686844800,1686839138,'FK2306152220CDWER',1);
/*!40000 ALTER TABLE `auto_unfreeze` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cash`
--

DROP TABLE IF EXISTS `cash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cash` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `type` tinyint(3) unsigned NOT NULL COMMENT '收款产品类型 1支付宝 2微信',
  `collect_info` varchar(1024) NOT NULL DEFAULT '' COMMENT '提现信息',
  `money` decimal(10,2) unsigned NOT NULL COMMENT '提现金额',
  `fee` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '手续费',
  `actual_money` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '实际到账',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态 0审核中 1审核通过 2审核未通过',
  `create_at` int(10) unsigned NOT NULL COMMENT '创建时间',
  `complete_at` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '完成时间',
  `collect_img` tinytext COMMENT '收款二维码',
  `auto_cash` tinyint(4) NOT NULL DEFAULT '0' COMMENT '1 表示自动提现',
  `bank_name` varchar(50) NOT NULL DEFAULT '' COMMENT '银行名称',
  `bank_branch` varchar(150) NOT NULL DEFAULT '' COMMENT '开户地址',
  `bank_card` varchar(50) NOT NULL DEFAULT '' COMMENT '银行卡号',
  `realname` varchar(50) NOT NULL DEFAULT '' COMMENT '真实姓名',
  `idcard_number` varchar(50) NOT NULL DEFAULT '' COMMENT '身份证号码',
  `orderid` varchar(50) NOT NULL DEFAULT '' COMMENT '订单号',
  `account` int(11) NOT NULL DEFAULT '0' COMMENT '代付账号',
  `daifu_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '代付状态（0，未申请，1，已申请）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cash`
--

LOCK TABLES `cash` WRITE;
/*!40000 ALTER TABLE `cash` DISABLE KEYS */;
/*!40000 ALTER TABLE `cash` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cash_channel`
--

DROP TABLE IF EXISTS `cash_channel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cash_channel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL COMMENT '代付渠道名',
  `code` varchar(255) NOT NULL COMMENT '代付渠道代码',
  `account_fields` text NOT NULL COMMENT '代付所需的字段',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1支付宝，2微信，3银行',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '渠道状态，0关闭，1开启',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cash_channel`
--

LOCK TABLES `cash_channel` WRITE;
/*!40000 ALTER TABLE `cash_channel` DISABLE KEYS */;
INSERT INTO `cash_channel` VALUES (1,'支付宝转账','AliTransfer','appId:appId|rsaPrivateKey:rsaPrivateKey|alipayrsaPublicKey:alipayrsaPublicKey',1,0),(2,'新支付宝证书转账','AliNewTransfer','appId:appId|私钥字符串:rsaPrivateKey|应用证书SN(如何获取看文档):appCertSn',1,0);
/*!40000 ALTER TABLE `cash_channel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cash_channel_account`
--

DROP TABLE IF EXISTS `cash_channel_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cash_channel_account` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `channel_id` int(10) unsigned NOT NULL COMMENT '渠道ID',
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '账户名',
  `params` text NOT NULL COMMENT '参数',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态 1启用 0禁用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cash_channel_account`
--

LOCK TABLES `cash_channel_account` WRITE;
/*!40000 ALTER TABLE `cash_channel_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `cash_channel_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `channel`
--

DROP TABLE IF EXISTS `channel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `channel` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '通道ID',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '通道名称',
  `code` varchar(50) NOT NULL DEFAULT '' COMMENT '通道代码',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态 1 开启 0 关闭',
  `lowrate` decimal(10,4) unsigned NOT NULL DEFAULT '0.0000' COMMENT '充值费率',
  `accounting_date` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '结算时间 1、D0 2、D1 3、T0 4、T1',
  `account_fields` varchar(1024) NOT NULL DEFAULT '' COMMENT '账户字段',
  `polling` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '接口模式 0单独 1轮询',
  `updatetime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `paytype` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '支付类型 1 微信扫码 2 微信公众号 3 支付宝扫码 4 支付宝手机 5 网银支付 6',
  `show_name` varchar(255) NOT NULL DEFAULT '' COMMENT '前台展示名称',
  `is_available` tinyint(4) NOT NULL DEFAULT '0' COMMENT '接口可用 0通用 1手机 2电脑',
  `default_fields` varchar(1024) NOT NULL DEFAULT '' COMMENT '字段默认值',
  `applyurl` varchar(255) NOT NULL DEFAULT '' COMMENT '申请地址',
  `is_install` tinyint(4) NOT NULL DEFAULT '0',
  `sort` int(10) NOT NULL DEFAULT '0' COMMENT '渠道排序',
  `is_custom` tinyint(4) NOT NULL DEFAULT '0',
  `is_deposit` tinyint(4) NOT NULL DEFAULT '0',
  `is_airpayx` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COMMENT='支付供应商';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channel`
--

LOCK TABLES `channel` WRITE;
/*!40000 ALTER TABLE `channel` DISABLE KEYS */;
INSERT INTO `channel` VALUES (1,'支付宝扫码','AlipayScan',0,0.0400,1,'支付宝公钥:alipay_public_key|商户私钥:merchant_private_key|支付宝APPID:app_id',0,0,1,'支付宝PC',0,'charset=UTF-8','https://open.alipay.com/platform/homeRoleSelection.htm',0,0,0,0,0),(2,'支付宝H5','AlipayWap',0,0.0400,1,'支付宝公钥:alipay_public_key|商户私钥:merchant_private_key|支付宝APPID:app_id',0,0,2,'支付宝手机',1,'charset=UTF-8','https://open.alipay.com/platform/homeRoleSelection.htm',0,0,0,0,0),(3,'支付宝当面付','AlipayQrcode',0,0.0400,1,'支付宝公钥:alipay_public_key|商户私钥:merchant_private_key|支付宝APPID:app_id',0,0,2,'支付宝当面付',0,'charset=UTF-8','https://open.alipay.com/platform/homeRoleSelection.htm',0,0,0,0,0),(4,'微信官方H5','WeixinH5',0,0.0400,1,'商户号:mchid|公众号APPID:appid|公众号Secret:appKey|商户号apiKey:apiKey|证书PEM路径(pem格式，退款使用):pem_cert|证书KEY路径(pem格式，退款使用):pem_key',0,0,4,'微信官方H5',1,'','https://pay.weixin.qq.com/',0,0,0,0,0),(5,'微信官方Native','WeixinNative',0,0.0400,1,'商户号:mchid|公众号APPID:appid|公众号Secret:appKey|商户号apiKey:apiKey|证书PEM路径(pem格式，退款使用):pem_cert|证书KEY路径(pem格式，退款使用):pem_key',0,0,3,'微信官方扫码',2,'','https://pay.weixin.qq.com/',0,0,0,0,0),(6,'微信官方JsPay','WeixinJspay',0,0.0400,1,'商户号:mchid|公众号APPID:appid|公众号Secret:appKey|商户号apiKey:apiKey|证书PEM路径(pem格式，退款使用):pem_cert|证书KEY路径(pem格式，退款使用):pem_key',0,0,4,'微信官方Jspay',1,'','https://pay.weixin.qq.com/',0,0,0,0,0),(7,'码支付微信','Yipay',1,0.0000,1,'网关:gateway|pid:pid|key:key|支付类型:type',0,0,3,'微信',0,'type=wxpay','',1,0,0,0,0),(8,'官方QQ扫码','QqNative',0,0.0400,1,'商户号:mch_id|商户秘钥:key|操作员ID(退款使用):op_userid|操作员密码(退款使用):op_userpwd|PEM证书路径(退款使用):cert_path|PEM密钥路径(退款使用):key_path',0,0,5,'QQ支付',2,'','https://mp.qpay.tenpay.com/',0,0,0,0,0),(9,'官方QQH5','QqH5',0,0.0400,1,'商户号:mch_id|商户秘钥:key|操作员ID(退款使用):op_userid|操作员密码(退款使用):op_userpwd|PEM证书路径(退款使用):cert_path|PEM密钥路径(退款使用):key_path',0,0,6,'QQ支付',1,'','https://mp.qpay.tenpay.com/',0,0,0,0,0),(10,'鲸支付微信','JingPay',0,0.0400,1,'appid:app_id|key:key|支付类型:type',0,0,3,'微信',0,'','',0,0,0,0,0),(11,'鲸支付支付宝','JingPay',0,0.0400,1,'appid:app_id|key:key|支付类型:type',0,0,1,'支付宝',0,'','',0,0,0,0,0),(12,'官方支付宝扫码','AlipayScan',1,0.0400,1,'支付宝APPID:app_id|商户私钥:merchant_private_key|支付宝公钥:alipay_public_key',0,0,1,'支付宝PC',0,'','',1,0,1,0,0),(13,'官方支付宝H5','AlipayWap',1,0.0400,1,'支付宝公钥:alipay_public_key|商户私钥:merchant_private_key|支付宝APPID:app_id',0,0,2,'支付宝手机',1,'charset=UTF-8','https://open.alipay.com/platform/homeRoleSelection.htm',1,0,1,0,0),(14,'易支付支付宝','Yipay',1,0.0400,1,'网关（submit.php 结尾）:gateway|pid:pid|key:key|支付类型:type',0,0,1,'易支付支付宝',0,'type=alipay','',1,0,1,0,0),(15,'码支付支付宝','FakaCodePay',1,0.0400,1,'appid:appid|appkey:appkey|支付编码:type',0,0,1,'支付宝',0,'type=alipay','',1,0,1,0,0),(16,'码支付微信','FakaCodePay',1,0.0400,1,'appid:appid|appkey:appkey|支付编码:type',0,0,3,'微信',0,'type=wxpay','',1,0,1,0,0),(17,'易支付微信','Yipay',1,0.0400,1,'网关（submit.php 结尾）:gateway|pid:pid|key:key|支付类型:type',0,0,3,'易支付微信',0,'type=wxpay','',1,0,1,0,0),(18,'微信官方Native','WeixinNative',1,0.0400,1,'商户号:mchid|公众号APPID:appid|公众号Secret:appKey|商户号apiKey:apiKey|证书PEM路径(pem格式，退款使用):pem_cert|证书KEY路径(pem格式，退款使用):pem_key',0,0,3,'微信官方扫码',2,'appKey=0|pem_cert=0|pem_key=0','https://pay.weixin.qq.com/',1,0,1,0,0),(19,'官方QQ扫码','QqNative',1,0.0400,1,'商户号:mch_id|商户秘钥:key|操作员ID(退款使用):op_userid|操作员密码(退款使用):op_userpwd|PEM证书路径(退款使用):cert_path|PEM密钥路径(退款使用):key_path',0,0,5,'QQ支付',2,'op_userid=0|op_userpwd=0|cert_path=0|key_path=0','',1,0,1,0,0),(20,'易支付QQ','Yipay',1,0.0400,1,'网关（submit.php 结尾）:gateway|pid:pid|key:key|支付类型:type',0,0,5,'易支付QQ',0,'type=qqpay','',1,0,1,0,0),(21,'支付宝当面付','AlipayQrcode',1,0.0400,1,'支付宝APPID:app_id|商户私钥:merchant_private_key|支付宝公钥:alipay_public_key',0,0,2,'支付宝当面付',0,'charset=UTF-8','https://open.alipay.com/platform/homeRoleSelection.htm',1,0,1,0,0),(22,'码支付支付宝','FakaCodePay',0,0.0400,1,'appid:appid|appkey:appkey|支付编码:type',0,0,1,'支付宝',0,'type=alipay','',0,0,0,0,0),(23,'码支付微信','FakaCodePay',0,0.0400,1,'appid:appid|appkey:appkey|支付编码:type',0,0,3,'微信',0,'type=wxpay','',0,0,0,0,0),(24,'天天支付宝','TtPay',0,0.0400,1,'appid:appid|key:key|支付编码:paytype',0,0,1,'支付宝',0,'paytype=alipay.native','',0,0,0,0,0),(25,'天天微信','TtPay',0,0.0400,1,'appid:appid|key:key|支付编码:paytype',0,0,3,'微信',0,'paytype=wx.h5','',0,0,0,0,0),(26,'U9支付宝','U9Pay',0,0.0400,1,'商户号:pid|秘钥:key|支付方式:paytype',0,0,1,'支付宝',0,'','',0,0,0,0,0),(27,'U9微信','U9Pay',0,0.0400,1,'商户号:pid|秘钥:key|支付方式:paytype',0,0,3,'微信',0,'','',0,0,0,0,0),(28,'ZY支付宝','ZyPay',0,0.0400,1,'网关:gateway|商户号:memberid|秘钥:key|支付方式:type',0,0,1,'支付宝',0,'','',0,0,0,0,0),(29,'ZY微信','ZyPay',0,0.0400,1,'网关:gateway|商户号:memberid|秘钥:key|支付方式:type',0,0,3,'微信',0,'','',0,0,0,0,0),(30,'码支付QQ','FakaCodePay',0,0.0400,1,'appid:appid|appkey:appkey|支付编码:type',0,0,5,'QQ支付',0,'type=qqpay','',0,0,0,0,0),(31,'码支付QQ','FakaCodePay',0,0.0400,1,'appid:appid|appkey:appkey|支付编码:type',0,0,5,'QQ支付',0,'type=qqpay','',1,0,1,0,0),(32,'深海支付宝','SHpay',0,0.0400,1,'appid:appid|apikey:apikey|支付编码:bankcode',0,0,1,'支付宝',0,'','',0,0,0,0,0),(33,'深海微信','SHpay',0,0.0000,1,'appid:appid|apikey:apikey|支付编码:bankcode',0,0,3,'微信',0,'','',0,0,0,0,0),(34,'易速付微信','YisufuPay',0,0.0400,1,'用户编号:open_userid|用户秘钥:open_userkey|子商户号:sub_mch_id|支付方式:channel_type',0,0,3,'微信',0,'channel_type=WECHAT_MP','',0,0,0,0,0),(35,'易速付支付宝','YisufuPay',0,0.0400,1,'用户编号:open_userid|用户秘钥:open_userkey|子商户号:sub_mch_id|支付方式:channel_type',0,0,1,'支付宝',0,'channel_type=ALIPAY','',0,0,0,0,0),(36,'闪电安全支付宝','Airpayx',1,0.0400,1,'支付方式:channel_type',0,0,1,'支付宝',0,'channel_type=alipay','',1,0,1,0,1),(37,'闪电安全微信','Airpayx',1,0.0400,1,'支付方式:channel_type',0,0,3,'微信',0,'channel_type=wxpay','',1,0,1,0,1),(38,'码支付支付宝','Yipay',1,0.0000,1,'网关:gateway|pid:pid|key:key|支付类型:type',0,0,1,'支付宝',0,'type=alipay','',1,0,0,0,0),(39,'码支付qq','Yipay',1,0.0000,1,'网关:gateway|pid:pid|key:key|支付类型:type',0,0,5,'QQ支付',0,'type=qqpay','',1,0,0,0,0);
/*!40000 ALTER TABLE `channel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `channel_account`
--

DROP TABLE IF EXISTS `channel_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `channel_account` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `channel_id` int(10) unsigned NOT NULL COMMENT '渠道ID',
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '账户名',
  `params` text NOT NULL COMMENT '参数',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态 1启用 0禁用',
  `lowrate` decimal(10,4) unsigned NOT NULL DEFAULT '0.0000' COMMENT '充值费率',
  `rate_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '费率设置 0 继承接口  1单独设置',
  `user_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channel_account`
--

LOCK TABLES `channel_account` WRITE;
/*!40000 ALTER TABLE `channel_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `channel_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `complaint`
--

DROP TABLE IF EXISTS `complaint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `complaint` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `trade_no` char(50) NOT NULL DEFAULT '',
  `type` varchar(20) NOT NULL DEFAULT '',
  `qq` varchar(15) NOT NULL DEFAULT '',
  `mobile` varchar(15) NOT NULL DEFAULT '',
  `desc` varchar(1000) NOT NULL DEFAULT '',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0待处理 1已处理',
  `admin_read` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '管理员查看状态',
  `create_at` int(10) unsigned NOT NULL,
  `create_ip` varchar(15) NOT NULL DEFAULT '',
  `pwd` char(10) NOT NULL DEFAULT '123456' COMMENT '投诉单查询密码',
  `result` tinyint(4) NOT NULL DEFAULT '0' COMMENT '申诉结果',
  `expire_at` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '申诉过期时间',
  `proxy_parent_user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级代理商ID',
  `buyer_qrcode` varchar(1000) DEFAULT NULL,
  `select_cards` varchar(1000) DEFAULT NULL,
  `num` int(11) DEFAULT '1',
  `price` decimal(10,2) DEFAULT '0.00',
  `merchant_status` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `complaint`
--

LOCK TABLES `complaint` WRITE;
/*!40000 ALTER TABLE `complaint` DISABLE KEYS */;
INSERT INTO `complaint` VALUES (1,2,'FK2306152220CDWER','无效卡密','2912608810','17694466691','123456',1,1,1686839221,'223.96.57.65','610170',1,1686925622,0,'','',1,10000.00,0);
/*!40000 ALTER TABLE `complaint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `complaint_message`
--

DROP TABLE IF EXISTS `complaint_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `complaint_message` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `trade_no` varchar(255) NOT NULL DEFAULT '0' COMMENT '投诉所属订单',
  `from` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发送人，0为管理员发送的消息',
  `content` varchar(1024) NOT NULL DEFAULT '' COMMENT '对话内容',
  `status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '0未读  1已读',
  `create_at` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发送时间',
  `content_type` varchar(255) NOT NULL DEFAULT '0' COMMENT '投诉内容类型：0：文本消息，1：图片消息',
  `agent_id` int(10) NOT NULL DEFAULT '0' COMMENT '代理ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='投诉会话信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `complaint_message`
--

LOCK TABLES `complaint_message` WRITE;
/*!40000 ALTER TABLE `complaint_message` DISABLE KEYS */;
INSERT INTO `complaint_message` VALUES (1,'FK2306152220CDWER',0,'123456',0,1686839222,'0',0);
/*!40000 ALTER TABLE `complaint_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_code`
--

DROP TABLE IF EXISTS `email_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_code` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL DEFAULT '' COMMENT '邮箱',
  `screen` varchar(30) NOT NULL DEFAULT '' COMMENT '场景',
  `code` char(6) NOT NULL DEFAULT '' COMMENT '验证码',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态：0：未使用 1：已使用',
  `create_at` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_code`
--

LOCK TABLES `email_code` WRITE;
/*!40000 ALTER TABLE `email_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods`
--

DROP TABLE IF EXISTS `goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `cate_id` int(10) unsigned NOT NULL,
  `theme` varchar(15) NOT NULL DEFAULT 'default' COMMENT '主题',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `name` varchar(500) NOT NULL DEFAULT '',
  `price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `cost_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '成本价',
  `wholesale_discount` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '批发优惠',
  `wholesale_discount_list` text NOT NULL COMMENT '批发价',
  `limit_quantity` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '起购数量',
  `inventory_notify` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '库存预警 0表示不报警',
  `inventory_notify_type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '库存预警通知方式 1站内信 2邮件',
  `coupon_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '优惠券 0不支持 1支持',
  `sold_notify` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '售出通知',
  `take_card_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '取卡密码 0关闭 1必填 2选填',
  `visit_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '访问密码',
  `visit_password` varchar(30) NOT NULL DEFAULT '' COMMENT '访问密码',
  `contact_limit` enum('mobile','email','qq','any','default') NOT NULL DEFAULT 'default' COMMENT '客户信息',
  `content` text NOT NULL COMMENT '商品说明',
  `remark` varchar(200) NOT NULL DEFAULT '' COMMENT '使用说明',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '0下架 1上架',
  `create_at` int(10) unsigned NOT NULL DEFAULT '0',
  `is_freeze` tinyint(4) DEFAULT '0',
  `sms_payer` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '短信付费方：0买家 1商户',
  `delete_at` int(11) DEFAULT NULL COMMENT '删除标记',
  `card_order` tinyint(3) NOT NULL DEFAULT '0' COMMENT '发卡顺序 0现卖老卡 1先卖新卡',
  `can_proxy` tinyint(3) NOT NULL DEFAULT '0' COMMENT '代理销售',
  `is_proxy` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否是对接别人的商品',
  `proxy_id` int(20) NOT NULL DEFAULT '0' COMMENT '代理的商品ID',
  `proxy_code` varchar(100) DEFAULT '' COMMENT '商品对接码',
  `proxy_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '代理成本价格',
  `proxy_price_add` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '代理加价',
  `proxy_sync_content` tinyint(4) NOT NULL DEFAULT '0',
  `proxy_price_diy` tinyint(4) NOT NULL DEFAULT '0',
  `is_cross` tinyint(4) DEFAULT '0',
  `cross_id` int(11) DEFAULT '0',
  `cross_params` varchar(255) DEFAULT NULL,
  `selectcard_fee` decimal(10,2) DEFAULT '0.00',
  `proxy_sync_name` tinyint(4) DEFAULT '0',
  `max_quantity` int(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cate_id` (`cate_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `stauts` (`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods`
--

LOCK TABLES `goods` WRITE;
/*!40000 ALTER TABLE `goods` DISABLE KEYS */;
INSERT INTO `goods` VALUES (1,2,2,'diy',0,'10000',100.00,0.00,0,'[]',1,0,1,0,0,0,0,'','default','&lt;p&gt;&lt;br /&gt;&lt;/p&gt;','',1,1686838859,0,0,NULL,0,0,0,0,'1CC1706E149D',0.00,0.00,0,0,0,0,NULL,0.00,0,0);
/*!40000 ALTER TABLE `goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods_card`
--

DROP TABLE IF EXISTS `goods_card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods_card` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `goods_id` int(10) unsigned NOT NULL,
  `number` text,
  `secret` text,
  `status` tinyint(3) NOT NULL DEFAULT '1' COMMENT '-1删除 0不可用 1可用 2已使用',
  `create_at` int(10) unsigned NOT NULL DEFAULT '0',
  `delete_at` int(11) DEFAULT NULL COMMENT '删除标记',
  `sell_time` int(11) DEFAULT NULL COMMENT '售出时间',
  `is_cross` tinyint(4) DEFAULT '0',
  `is_first` int(11) DEFAULT '0',
  `unfreeze_at` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `goods_card_user_id_index` (`user_id`),
  KEY `goods_card_goods_id_index` (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods_card`
--

LOCK TABLES `goods_card` WRITE;
/*!40000 ALTER TABLE `goods_card` DISABLE KEYS */;
INSERT INTO `goods_card` VALUES (1,2,1,'123456','',2,1686838872,NULL,1686839152,0,0,0),(2,2,1,'999999','',1,1687789164,NULL,NULL,0,0,0);
/*!40000 ALTER TABLE `goods_card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods_category`
--

DROP TABLE IF EXISTS `goods_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `name` varchar(100) NOT NULL,
  `sort` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL,
  `create_at` int(10) unsigned NOT NULL,
  `theme` varchar(15) NOT NULL DEFAULT 'default' COMMENT '主题',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods_category`
--

LOCK TABLES `goods_category` WRITE;
/*!40000 ALTER TABLE `goods_category` DISABLE KEYS */;
INSERT INTO `goods_category` VALUES (1,1,'商品1',0,1,1672659131,'default'),(2,2,'66',0,1,1686838815,'diy');
/*!40000 ALTER TABLE `goods_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods_chi`
--

DROP TABLE IF EXISTS `goods_chi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods_chi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `token` varchar(200) DEFAULT NULL,
  `istop` int(1) DEFAULT '0',
  `kefu` varchar(200) DEFAULT NULL,
  `toptime` int(11) DEFAULT NULL,
  `yw` varchar(200) DEFAULT NULL,
  `content` text,
  `addtime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods_chi`
--

LOCK TABLES `goods_chi` WRITE;
/*!40000 ALTER TABLE `goods_chi` DISABLE KEYS */;
/*!40000 ALTER TABLE `goods_chi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods_coupon`
--

DROP TABLE IF EXISTS `goods_coupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods_coupon` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `cate_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '全部',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '类型 1、元  100、%',
  `amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `code` varchar(255) NOT NULL DEFAULT '',
  `remark` varchar(100) NOT NULL DEFAULT '' COMMENT '备注',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '1未使用 2已用',
  `expire_at` int(10) unsigned NOT NULL,
  `create_at` int(10) unsigned NOT NULL,
  `delete_at` int(11) DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods_coupon`
--

LOCK TABLES `goods_coupon` WRITE;
/*!40000 ALTER TABLE `goods_coupon` DISABLE KEYS */;
/*!40000 ALTER TABLE `goods_coupon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods_pool`
--

DROP TABLE IF EXISTS `goods_pool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods_pool` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `sort` int(11) DEFAULT '0',
  `status` tinyint(4) DEFAULT '0',
  `span_id` int(11) DEFAULT '0',
  `expire_at` int(11) DEFAULT NULL,
  `create_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods_pool`
--

LOCK TABLES `goods_pool` WRITE;
/*!40000 ALTER TABLE `goods_pool` DISABLE KEYS */;
/*!40000 ALTER TABLE `goods_pool` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods_pool_span`
--

DROP TABLE IF EXISTS `goods_pool_span`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods_pool_span` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods_pool_span`
--

LOCK TABLES `goods_pool_span` WRITE;
/*!40000 ALTER TABLE `goods_pool_span` DISABLE KEYS */;
INSERT INTO `goods_pool_span` VALUES (1,'年费置顶','#f00'),(2,'平台推荐','#00F');
/*!40000 ALTER TABLE `goods_pool_span` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_account`
--

DROP TABLE IF EXISTS `ims_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_account` (
  `acid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `hash` varchar(8) NOT NULL,
  `type` tinyint(3) unsigned NOT NULL,
  `isconnect` tinyint(4) NOT NULL,
  `isdeleted` tinyint(3) unsigned NOT NULL,
  `endtime` int(10) unsigned NOT NULL,
  `send_account_expire_status` tinyint(1) NOT NULL,
  `send_api_expire_status` tinyint(1) NOT NULL,
  PRIMARY KEY (`acid`),
  KEY `idx_uniacid` (`uniacid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_account`
--

LOCK TABLES `ims_account` WRITE;
/*!40000 ALTER TABLE `ims_account` DISABLE KEYS */;
INSERT INTO `ims_account` VALUES (1,1,'uRr8qvQV',1,1,0,0,0,0);
/*!40000 ALTER TABLE `ims_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_account_aliapp`
--

DROP TABLE IF EXISTS `ims_account_aliapp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_account_aliapp` (
  `acid` int(10) NOT NULL,
  `uniacid` int(10) NOT NULL,
  `level` tinyint(4) unsigned NOT NULL,
  `name` varchar(30) NOT NULL,
  `description` varchar(255) NOT NULL,
  `key` varchar(16) NOT NULL,
  PRIMARY KEY (`acid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_account_aliapp`
--

LOCK TABLES `ims_account_aliapp` WRITE;
/*!40000 ALTER TABLE `ims_account_aliapp` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_account_aliapp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_account_baiduapp`
--

DROP TABLE IF EXISTS `ims_account_baiduapp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_account_baiduapp` (
  `acid` int(10) NOT NULL,
  `uniacid` int(10) NOT NULL,
  `name` varchar(30) NOT NULL,
  `appid` varchar(32) NOT NULL,
  `key` varchar(32) NOT NULL,
  `secret` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`acid`),
  KEY `uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_account_baiduapp`
--

LOCK TABLES `ims_account_baiduapp` WRITE;
/*!40000 ALTER TABLE `ims_account_baiduapp` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_account_baiduapp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_account_phoneapp`
--

DROP TABLE IF EXISTS `ims_account_phoneapp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_account_phoneapp` (
  `acid` int(11) NOT NULL,
  `uniacid` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`acid`),
  KEY `uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_account_phoneapp`
--

LOCK TABLES `ims_account_phoneapp` WRITE;
/*!40000 ALTER TABLE `ims_account_phoneapp` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_account_phoneapp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_account_toutiaoapp`
--

DROP TABLE IF EXISTS `ims_account_toutiaoapp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_account_toutiaoapp` (
  `acid` int(10) NOT NULL,
  `uniacid` int(10) NOT NULL,
  `name` varchar(30) NOT NULL,
  `appid` varchar(32) NOT NULL,
  `key` varchar(32) NOT NULL,
  `secret` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`acid`),
  KEY `uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_account_toutiaoapp`
--

LOCK TABLES `ims_account_toutiaoapp` WRITE;
/*!40000 ALTER TABLE `ims_account_toutiaoapp` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_account_toutiaoapp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_account_webapp`
--

DROP TABLE IF EXISTS `ims_account_webapp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_account_webapp` (
  `acid` int(11) NOT NULL,
  `uniacid` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`acid`),
  KEY `uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_account_webapp`
--

LOCK TABLES `ims_account_webapp` WRITE;
/*!40000 ALTER TABLE `ims_account_webapp` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_account_webapp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_account_wechats`
--

DROP TABLE IF EXISTS `ims_account_wechats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_account_wechats` (
  `acid` int(10) unsigned NOT NULL,
  `uniacid` int(10) unsigned NOT NULL,
  `token` varchar(32) NOT NULL,
  `encodingaeskey` varchar(255) NOT NULL,
  `level` tinyint(4) unsigned NOT NULL,
  `name` varchar(30) NOT NULL,
  `account` varchar(30) NOT NULL,
  `original` varchar(50) NOT NULL,
  `signature` varchar(100) NOT NULL,
  `country` varchar(10) NOT NULL,
  `province` varchar(3) NOT NULL,
  `city` varchar(15) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(32) NOT NULL,
  `lastupdate` int(10) unsigned NOT NULL,
  `key` varchar(50) NOT NULL,
  `secret` varchar(50) NOT NULL,
  `styleid` int(10) unsigned NOT NULL,
  `subscribeurl` varchar(120) NOT NULL,
  `auth_refresh_token` varchar(255) NOT NULL,
  PRIMARY KEY (`acid`),
  KEY `idx_key` (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_account_wechats`
--

LOCK TABLES `ims_account_wechats` WRITE;
/*!40000 ALTER TABLE `ims_account_wechats` DISABLE KEYS */;
INSERT INTO `ims_account_wechats` VALUES (1,1,'omJNpZEhZeHj1ZxFECKkP48B5VFbk1HP','rWUA5pUj5Zw30YSqy0ivdSfJom0Rv8XCtr641mC5K1m',4,'we7team','','','','','','','','',0,'wx5e9120ecd1abc1b0','c79967bfa81fb168690e3e5fe7223785',1,'','');
/*!40000 ALTER TABLE `ims_account_wechats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_account_wxapp`
--

DROP TABLE IF EXISTS `ims_account_wxapp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_account_wxapp` (
  `acid` int(10) unsigned NOT NULL,
  `uniacid` int(10) NOT NULL,
  `token` varchar(32) NOT NULL,
  `encodingaeskey` varchar(43) NOT NULL,
  `level` tinyint(4) NOT NULL,
  `account` varchar(30) NOT NULL,
  `original` varchar(50) NOT NULL,
  `key` varchar(50) NOT NULL,
  `secret` varchar(50) NOT NULL,
  `name` varchar(30) NOT NULL,
  `appdomain` varchar(255) NOT NULL,
  `auth_refresh_token` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`acid`),
  KEY `uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_account_wxapp`
--

LOCK TABLES `ims_account_wxapp` WRITE;
/*!40000 ALTER TABLE `ims_account_wxapp` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_account_wxapp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_account_xzapp`
--

DROP TABLE IF EXISTS `ims_account_xzapp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_account_xzapp` (
  `acid` int(11) NOT NULL,
  `uniacid` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `original` varchar(50) NOT NULL,
  `lastupdate` int(10) NOT NULL,
  `styleid` int(10) NOT NULL,
  `createtime` int(10) NOT NULL,
  `token` varchar(32) NOT NULL,
  `encodingaeskey` varchar(255) NOT NULL,
  `xzapp_id` varchar(30) NOT NULL,
  `level` tinyint(4) unsigned NOT NULL,
  `key` varchar(80) NOT NULL,
  `secret` varchar(80) NOT NULL,
  PRIMARY KEY (`acid`),
  KEY `uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_account_xzapp`
--

LOCK TABLES `ims_account_xzapp` WRITE;
/*!40000 ALTER TABLE `ims_account_xzapp` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_account_xzapp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_activity_clerk_menu`
--

DROP TABLE IF EXISTS `ims_activity_clerk_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_activity_clerk_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `displayorder` int(4) NOT NULL,
  `pid` int(6) NOT NULL,
  `group_name` varchar(20) NOT NULL,
  `title` varchar(20) NOT NULL,
  `icon` varchar(50) NOT NULL,
  `url` varchar(255) NOT NULL,
  `type` varchar(20) NOT NULL,
  `permission` varchar(50) NOT NULL,
  `system` int(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_activity_clerk_menu`
--

LOCK TABLES `ims_activity_clerk_menu` WRITE;
/*!40000 ALTER TABLE `ims_activity_clerk_menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_activity_clerk_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_activity_clerks`
--

DROP TABLE IF EXISTS `ims_activity_clerks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_activity_clerks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `storeid` int(10) unsigned NOT NULL,
  `name` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `openid` varchar(50) NOT NULL,
  `nickname` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `password` (`password`),
  KEY `openid` (`openid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_activity_clerks`
--

LOCK TABLES `ims_activity_clerks` WRITE;
/*!40000 ALTER TABLE `ims_activity_clerks` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_activity_clerks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_article_category`
--

DROP TABLE IF EXISTS `ims_article_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_article_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(30) NOT NULL,
  `displayorder` tinyint(3) unsigned NOT NULL,
  `type` varchar(15) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_article_category`
--

LOCK TABLES `ims_article_category` WRITE;
/*!40000 ALTER TABLE `ims_article_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_article_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_article_comment`
--

DROP TABLE IF EXISTS `ims_article_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_article_comment` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `articleid` int(10) NOT NULL,
  `parentid` int(10) NOT NULL,
  `uid` int(10) NOT NULL,
  `content` varchar(500) DEFAULT NULL,
  `is_like` tinyint(1) NOT NULL,
  `is_reply` tinyint(1) NOT NULL,
  `like_num` int(10) NOT NULL,
  `createtime` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `articleid` (`articleid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_article_comment`
--

LOCK TABLES `ims_article_comment` WRITE;
/*!40000 ALTER TABLE `ims_article_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_article_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_article_news`
--

DROP TABLE IF EXISTS `ims_article_news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_article_news` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cateid` int(10) unsigned NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` mediumtext NOT NULL,
  `thumb` varchar(255) NOT NULL,
  `source` varchar(255) NOT NULL,
  `author` varchar(50) NOT NULL,
  `displayorder` tinyint(3) unsigned NOT NULL,
  `is_display` tinyint(3) unsigned NOT NULL,
  `is_show_home` tinyint(3) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `click` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `title` (`title`),
  KEY `cateid` (`cateid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_article_news`
--

LOCK TABLES `ims_article_news` WRITE;
/*!40000 ALTER TABLE `ims_article_news` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_article_news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_article_notice`
--

DROP TABLE IF EXISTS `ims_article_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_article_notice` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cateid` int(10) unsigned NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` mediumtext NOT NULL,
  `displayorder` tinyint(3) unsigned NOT NULL,
  `is_display` tinyint(3) unsigned NOT NULL,
  `is_show_home` tinyint(3) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `click` int(10) unsigned NOT NULL,
  `style` varchar(200) NOT NULL,
  `group` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `title` (`title`),
  KEY `cateid` (`cateid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_article_notice`
--

LOCK TABLES `ims_article_notice` WRITE;
/*!40000 ALTER TABLE `ims_article_notice` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_article_notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_article_unread_notice`
--

DROP TABLE IF EXISTS `ims_article_unread_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_article_unread_notice` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `notice_id` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `is_new` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `notice_id` (`notice_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_article_unread_notice`
--

LOCK TABLES `ims_article_unread_notice` WRITE;
/*!40000 ALTER TABLE `ims_article_unread_notice` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_article_unread_notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_attachment_group`
--

DROP TABLE IF EXISTS `ims_attachment_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_attachment_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL,
  `name` varchar(25) NOT NULL,
  `uniacid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `type` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_attachment_group`
--

LOCK TABLES `ims_attachment_group` WRITE;
/*!40000 ALTER TABLE `ims_attachment_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_attachment_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_basic_reply`
--

DROP TABLE IF EXISTS `ims_basic_reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_basic_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL,
  `content` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_basic_reply`
--

LOCK TABLES `ims_basic_reply` WRITE;
/*!40000 ALTER TABLE `ims_basic_reply` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_basic_reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_business`
--

DROP TABLE IF EXISTS `ims_business`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_business` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `title` varchar(50) NOT NULL,
  `thumb` varchar(255) NOT NULL,
  `content` varchar(1000) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `qq` varchar(15) NOT NULL,
  `province` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `dist` varchar(50) NOT NULL,
  `address` varchar(500) NOT NULL,
  `lng` varchar(10) NOT NULL,
  `lat` varchar(10) NOT NULL,
  `industry1` varchar(10) NOT NULL,
  `industry2` varchar(10) NOT NULL,
  `createtime` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_lat_lng` (`lng`,`lat`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_business`
--

LOCK TABLES `ims_business` WRITE;
/*!40000 ALTER TABLE `ims_business` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_business` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_core_attachment`
--

DROP TABLE IF EXISTS `ims_core_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_core_attachment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `filename` varchar(255) NOT NULL,
  `attachment` varchar(255) NOT NULL,
  `type` tinyint(3) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `module_upload_dir` varchar(100) NOT NULL,
  `group_id` int(11) NOT NULL,
  `displayorder` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_core_attachment`
--

LOCK TABLES `ims_core_attachment` WRITE;
/*!40000 ALTER TABLE `ims_core_attachment` DISABLE KEYS */;
INSERT INTO `ims_core_attachment` VALUES (1,1,1,'7e246b6207cb4d398c61b4d72c6236c4.jpg','images/1/2022/04/Ucbgy0aW9xbbPgb4W4WEzxP9TWf9bH.jpg',1,1650191932,'',-1,0),(2,1,1,'22.png','images/1/2022/04/tGUU0S9zLz7E0tX0e00wZwS70mza6W.png',1,1650191933,'',-1,0),(3,1,1,'33.png','images/1/2022/04/w3QTPSsWP3USEgEWsm9SS3qVR3E3Ss.png',1,1650191933,'',-1,0),(4,1,1,'55.png','images/1/2022/04/Bln31Lz9cnxzycVr0SBbYXyyGyYXzb.png',1,1650191933,'',-1,0),(5,1,1,'微信图片_20220317012254.jpg','images/1/2022/04/re2ei18viVyv8e4Eee8F1l2BBfxfee.jpg',1,1650191943,'',-1,0),(6,1,1,'微信图片_20220221191945.jpg','images/1/2022/04/aR8RwB5lR8lkr88R27RZ22K2s2iB9n.jpg',1,1650191943,'',-1,0),(7,0,0,'7EDEC470-45C0-4596-A96C-5480386D8815.jpeg','images/1/2022/04/Uo7OiCEUeuu7MxqXYIEioJiU6jJolz.jpeg',1,1650195944,'',0,0),(8,0,0,'C7325E13-B9EF-435B-A11E-8936E202E743.jpeg','images/1/2022/04/jlP6ewh3HdjpzD6H3hZVP63Dw1t61j.jpeg',1,1650196270,'',0,0),(9,0,0,'CCE29940-9782-4B1C-B5C5-6140834F08FA.jpeg','images/1/2022/04/hl4k51p9KhDdA1A54q4sfNaSdd9Dkz.jpeg',1,1650198263,'',0,0),(10,0,0,'06C9249C-54A4-4908-B595-1FE8EDC7D882.png','images/1/2022/04/u0hRy9p6VD6r921hdBada0Tdx9YhBR.png',1,1650198263,'',0,0),(11,0,0,'7CB288DD-D4C3-44C7-A0F3-B6A344E55ACB.jpeg','images/1/2022/04/a88xXPKiKsuc6iuOsBC1kNApS8BAS4.jpeg',1,1650198264,'',0,0),(12,0,0,'45052F85-910C-4A4D-B8E0-6DC0682A7462.jpeg','images/1/2022/04/kP0XXSw0BzjijyZ0sybPlQAWHBWXpk.jpeg',1,1650198264,'',0,0),(13,0,0,'EF80E901-52F8-4322-9BBC-6EBDCAE1DF2C.jpeg','images/1/2022/04/d2c1yMXZUZexlWy6cc5p6cUxZYUI1e.jpeg',1,1650198265,'',0,0),(14,0,0,'2A751208-05A0-45DD-B55F-BE3B4A19CAE2.jpeg','images/1/2022/04/tU2bHrRKFFtbRFZhGg6F5kFhkRh2Gh.jpeg',1,1650198275,'',0,0),(15,0,0,'mmexport1616848064029.jpg','images/1/2022/04/aZ8cU0vhvjioZijajIHRa53CVhi511.jpg',1,1650208574,'',0,0),(16,0,0,'-407e91495a8bdb3.jpg','images/1/2022/04/BnpGNT9GkDmE9Snta3jZPKAp3pZNJK.jpg',1,1650209336,'',0,0),(17,0,0,'jt.png','images/1/2022/04/HgvgYtwlw2jy4q4ltj2Mog2QvvbzgW.png',1,1650247756,'',0,0),(18,0,0,'jt.png','images/1/2022/04/ZqniUyrU0iTr0nWRE1tY641mlz266y.png',1,1650249327,'',0,0),(19,0,0,'jt.png','images/1/2022/04/EK0CrmRbgHa5mg5Ei2IhR5Rkb5CkA0.png',1,1650263185,'',0,0),(20,0,0,'jt.png','images/1/2022/04/hZWWVIjK00mAJZV6XeKPkaKIGvik9c.png',1,1650263282,'',0,0),(21,0,0,'jt.png','images/1/2022/04/LX6J1j9L373m06JXJ6t11tW93qw60j.png',1,1650263388,'',0,0),(22,0,0,'jt.png','images/1/2022/04/uS1HDxLv9dSqNsN31EzC1dxO394CHe.png',1,1650263455,'',0,0),(23,0,0,'jt.png','images/1/2022/04/npKRksW4YHquRpYqS4554UQHL5SrSU.png',1,1650266237,'',0,0),(24,0,0,'jt.png','images/1/2022/04/Tf07eZz8g759eEE9Gx5II9JGAFAxz5.png',1,1650266413,'',0,0),(25,0,0,'jt.png','images/1/2022/04/U1VGCt0W8V1vjWOOjgv8N0006VOoTG.png',1,1650266494,'',0,0),(26,0,0,'jt.png','images/1/2022/04/O2A2BvT4ezxdbKK8wLZkKlMvVKLLKL.png',1,1650266608,'',0,0),(27,0,0,'paymsg.jpeg','images/1/2022/04/fly6Pq8qJAinL1yLhX2Qqqt2t1C2HH.jpeg',1,1650266902,'',0,0),(28,0,0,'paymsg.jpeg','images/1/2022/04/JiC00LVV6pIAVavJVhS9Pyjon7bB62.jpeg',1,1650266984,'',0,0),(29,0,0,'jt.png','images/1/2022/04/Y4zZ88iuR4E5WwE34lEdzj8LlLeSkd.png',1,1650267066,'',0,0),(30,0,0,'jt.png','images/1/2022/04/cap33rY8g6SaHf6Hap34fwIIGA7mA6.png',1,1650267135,'',0,0),(31,0,0,'jt.png','images/1/2022/04/Lp629d99MRxD8QM9p8ycpXmCY2dkyd.png',1,1650271429,'',0,0),(32,0,0,'jt.png','images/1/2022/04/bCp74fTByf0FSbsYsyndzRLrMr4ymM.png',1,1650271479,'',0,0),(33,0,0,'paymsg.jpeg','images/1/2022/04/c0z6fbN65oOOfobfWVOo6B56Fo46V6.jpeg',1,1650271679,'',0,0),(34,0,0,'jt.png','images/1/2022/04/xbTHtdzT3tnGgbsdWPeH7hhhkSBTpP.png',1,1650271738,'',0,0),(35,0,0,'jt.png','images/1/2022/04/btb09N9sWl799ZBscDTQCAlTJWctDT.png',1,1650271832,'',0,0),(36,0,0,'jt.png','images/1/2022/04/TL3FNbOzaNnhFc3DbfMhDXJbVafpId.png',1,1650272137,'',0,0),(37,0,0,'jt.png','images/1/2022/04/CzaKEEbe2v4BD712422dJJKAECpeE6.png',1,1650272206,'',0,0),(38,0,0,'paymsg.jpeg','images/1/2022/04/nFj96P6HtOZP1Hdgt1F6JPoFJ1zOHa.jpeg',1,1650272236,'',0,0),(39,0,0,'BBF45485-72BE-47E7-8120-F52E7780916C.jpeg','images/1/2022/04/v3Uj72KJvRb7uBA6B2RUu3CcruZZ73.jpeg',1,1650288126,'',0,0),(40,0,0,'3DCAB9FB-C42E-4658-9348-663C4CC8A80C.jpeg','images/1/2022/04/BdH2YtaikdULoKMyi2yTAv6t2642HZ.jpeg',1,1650288126,'',0,0),(41,0,0,'A0096FCF-750F-45BF-971F-9A3C459D8C48.jpeg','images/1/2022/04/v0PXx6JGZtEtj6D2J36h6Gge3X7J06.jpeg',1,1650288756,'',0,0),(42,0,0,'DA210383-8414-4FEB-9126-9F231F9D7609.png','images/1/2022/04/IN5zT2ZrYhDCRyldSdSCtrh7TcTh7z.png',1,1650288904,'',0,0),(43,0,0,'E260048F-35F2-46BC-A3F9-EF5B2E163CE7.jpeg','images/1/2022/04/lTIW9S3vjN97N09W0fNEnwIZwZ0700.jpeg',1,1650288938,'',0,0),(44,0,0,'A1CFF862-3622-411E-A8C8-41D7304A7515.png','images/1/2022/04/UxYxNeXY3n5yXyt7XZj37xNNVXf3xI.png',1,1650288942,'',0,0),(45,0,0,'5912987A-9CF9-4574-8224-209F1A3AF17C.png','images/1/2022/04/JqdlObW8s26q9WX2T2t8ezOE16WAqu.png',1,1650288992,'',0,0),(46,0,0,'6423390D-C9B4-4C27-BFFA-FD21D1FCDB8F.jpeg','images/1/2022/04/ZxAFuUpe5pFeQ5UunufaUXNXxaMbbx.jpeg',1,1650289405,'',0,0),(47,0,0,'1C4CFB6D-5C00-4CE7-B7E9-91B4D47A266F.jpeg','images/1/2022/04/O395ltWl9dW5q9isTwJGjZjMBgSJs5.jpeg',1,1650292776,'',0,0),(48,1,1,'mmqrcode1650292195560.png','images/1/2022/04/g03dU88aAA993WQYpvVA0UdWVywbw0.png',1,1650293495,'',-1,0),(49,1,1,'IMG_20220418_232349_gaitubao_100x100.jpg','images/1/2022/04/wPzpeQqff1aoN141o0t7YeAoYYANA1.jpg',1,1650295952,'',-1,0),(50,0,0,'jt.png','images/1/2022/04/U03D0FnZ4a5zP4cF1EcbJ0X7c4nxjh.png',1,1650330582,'',0,0),(51,0,0,'wx_az.png','images/1/2022/04/YeY33xEzXjSuAJRJmsXaMEXM0ES33J.png',1,1650330601,'',0,0),(52,0,0,'jt.png','images/1/2022/04/rOyv0r6yZyY6VIYi77i7YTMYm7MY6o.png',1,1650333916,'',0,0),(53,0,0,'paymsg.jpeg','images/1/2022/04/sGlV8IADlkpGiavRJD0OwMPtI2JLiN.jpeg',1,1650334129,'',0,0),(54,0,0,'jt.png','images/1/2022/04/Qv1ldeAEbarA1GBub4Rl1aFDw7MVUv.png',1,1650334985,'',0,0),(55,0,0,'Screenshot_20220418_133233_com.tencent.mm.jpg','images/1/2022/04/yL9HCRHRRBFYz9G9zE9H0iKK0Bc9Ia.jpg',1,1650337693,'',0,0),(56,0,0,'Screenshot_20220418_133233_com.tencent.mm.jpg','images/1/2022/04/PdaHE48MMe7g4h4d4ideey7DLDIEhJ.jpg',1,1650337823,'',0,0),(57,0,0,'Screenshot_20220418_133233_com.tencent.mm.jpg','images/1/2022/04/RpS6HaFm2ZMahHHAhphqQPqhqmA2fM.jpg',1,1650337979,'',0,0),(58,0,0,'IMG20210904144446.jpg','images/1/2022/04/nR5g1qG5c9rzHDg1EHHE5591h59E51.jpg',1,1650338799,'',0,0),(59,0,0,'QQimg_75E68FAEF8DC500AD7F907A64D460C8A.png','images/1/2022/04/qli2guZiJP2eJ1tW1tWi63IwWppJWT.png',1,1650339897,'',0,0),(63,1,1,'Screenshot_2022-04-19-13-52-20-25_c950200668d8508be5da604eee55b8e3.jpg','images/1/2022/04/vg4y1Y3U1123e262r8s12F24s2Mf1q.jpg',1,1650347637,'',-1,0),(64,0,0,'IMG20210419205315.jpg','images/1/2022/04/tcPoGz5ppPjwoYOnPNpOJzCOeBnXe5.jpg',1,1650349012,'',0,0),(65,0,0,'IMG20210419205026.jpg','images/1/2022/04/W9j8RJ8RZ99C5W4RZCdkvK8hR8K6wf.jpg',1,1650349022,'',0,0),(66,0,0,'IMG20210419205026.jpg','images/1/2022/04/zFWTDBszfwe4D9kdr5SIdrwwdtEwAr.jpg',1,1650359843,'',0,0),(67,0,0,'IMG20210419205315.jpg','images/1/2022/04/a92UULFcL92cnG0UZ9Duu3nz36GzCj.jpg',1,1650359849,'',0,0),(68,0,0,'54F4DBDE-77EC-43E2-90EA-C341BAB717C7.jpeg','images/1/2022/04/VNaG9vwmJVWDN1NndG9e11g9Ejemtn.jpeg',1,1650640878,'',0,0),(69,0,0,'20BDBA52-44D5-4CE3-900F-E2052F0AE3E4.jpeg','images/1/2022/04/D3793H2ed33hHe3dBNH2nD78b7rbFz.jpeg',1,1650641187,'',0,0),(70,0,0,'DDF50643-F423-4CA0-903B-573C830D8995.jpeg','images/1/2022/04/oEZ8xRLQw6xY8X68w2gP89weowel98.jpeg',1,1650641212,'',0,0);
/*!40000 ALTER TABLE `ims_core_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_core_cache`
--

DROP TABLE IF EXISTS `ims_core_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_core_cache` (
  `key` varchar(100) NOT NULL,
  `value` longtext NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_core_cache`
--

LOCK TABLES `ims_core_cache` WRITE;
/*!40000 ALTER TABLE `ims_core_cache` DISABLE KEYS */;
INSERT INTO `ims_core_cache` VALUES ('we7:setting','a:7:{s:9:\"copyright\";a:1:{s:6:\"slides\";a:3:{i:0;s:58:\"https://img.alicdn.com/tps/TB1pfG4IFXXXXc6XXXXXXXXXXXX.jpg\";i:1;s:58:\"https://img.alicdn.com/tps/TB1sXGYIFXXXXc5XpXXXXXXXXXX.jpg\";i:2;s:58:\"https://img.alicdn.com/tps/TB1h9xxIFXXXXbKXXXXXXXXXXXX.jpg\";}}s:8:\"authmode\";i:1;s:5:\"close\";a:2:{s:6:\"status\";s:1:\"0\";s:6:\"reason\";s:0:\"\";}s:8:\"register\";a:4:{s:4:\"open\";i:1;s:6:\"verify\";i:0;s:4:\"code\";i:1;s:7:\"groupid\";i:1;}s:4:\"site\";a:6:{s:3:\"key\";i:505344;s:5:\"token\";s:32:\"0765a9fbf4565c283e94207c8e6aedfe\";s:3:\"url\";s:21:\"http://cpdd.zmwym.com\";s:7:\"version\";s:5:\"2.0.0\";s:6:\"family\";s:1:\"x\";s:4:\"type\";s:8:\"register\";}s:18:\"module_receive_ban\";a:0:{}s:8:\"platform\";a:5:{s:5:\"token\";s:32:\"hZISFd2nyzAByXgsifnBF2SO6ASzbx0y\";s:14:\"encodingaeskey\";s:43:\"RZXNqBvnqqnnzdnEnndnNVN6ZKNnJKbZNnVBkV2wj6j\";s:9:\"appsecret\";s:0:\"\";s:5:\"appid\";s:0:\"\";s:9:\"authstate\";i:1;}}'),('we7:module_receive_enable','a:8:{s:5:\"image\";a:1:{i:0;s:5:\"vp_ph\";}s:9:\"subscribe\";a:1:{i:0;s:5:\"vp_ph\";}s:11:\"unsubscribe\";a:1:{i:0;s:5:\"vp_ph\";}s:5:\"event\";a:1:{i:0;s:5:\"vp_ph\";}s:4:\"scan\";a:1:{i:0;s:5:\"vp_ph\";}s:5:\"click\";a:1:{i:0;s:5:\"vp_ph\";}s:4:\"view\";a:1:{i:0;s:5:\"vp_ph\";}s:17:\"masssendjobfinish\";a:1:{i:0;s:5:\"vp_ph\";}}'),('we7:system_frame:0','a:17:{s:7:\"welcome\";a:7:{s:5:\"title\";s:6:\"首页\";s:4:\"icon\";s:10:\"wi wi-home\";s:3:\"url\";s:48:\"./index.php?c=home&a=welcome&do=system&page=home\";s:7:\"section\";a:0:{}s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:12:\"displayorder\";i:2;}s:14:\"account_manage\";a:8:{s:5:\"title\";s:12:\"平台管理\";s:4:\"icon\";s:21:\"wi wi-platform-manage\";s:9:\"dimension\";i:2;s:3:\"url\";s:31:\"./index.php?c=account&a=manage&\";s:7:\"section\";a:1:{s:14:\"account_manage\";a:2:{s:5:\"title\";s:12:\"平台管理\";s:4:\"menu\";a:4:{s:22:\"account_manage_display\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"平台列表\";s:3:\"url\";s:31:\"./index.php?c=account&a=manage&\";s:15:\"permission_name\";s:22:\"account_manage_display\";s:4:\"icon\";N;s:12:\"displayorder\";i:4;s:2:\"id\";N;s:14:\"sub_permission\";a:1:{i:0;a:2:{s:5:\"title\";s:12:\"帐号停用\";s:15:\"permission_name\";s:19:\"account_manage_stop\";}}}s:22:\"account_manage_recycle\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:9:\"回收站\";s:3:\"url\";s:32:\"./index.php?c=account&a=recycle&\";s:15:\"permission_name\";s:22:\"account_manage_recycle\";s:4:\"icon\";N;s:12:\"displayorder\";i:3;s:2:\"id\";N;s:14:\"sub_permission\";a:2:{i:0;a:2:{s:5:\"title\";s:12:\"帐号删除\";s:15:\"permission_name\";s:21:\"account_manage_delete\";}i:1;a:2:{s:5:\"title\";s:12:\"帐号恢复\";s:15:\"permission_name\";s:22:\"account_manage_recover\";}}}s:30:\"account_manage_system_platform\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:19:\" 微信开放平台\";s:3:\"url\";s:32:\"./index.php?c=system&a=platform&\";s:15:\"permission_name\";s:30:\"account_manage_system_platform\";s:4:\"icon\";N;s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:30:\"account_manage_expired_message\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:22:\" 自定义到期提示\";s:3:\"url\";s:40:\"./index.php?c=account&a=expired-message&\";s:15:\"permission_name\";s:30:\"account_manage_expired_message\";s:4:\"icon\";N;s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}}}s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:12:\"displayorder\";i:3;}s:13:\"module_manage\";a:8:{s:5:\"title\";s:12:\"应用管理\";s:4:\"icon\";s:19:\"wi wi-module-manage\";s:9:\"dimension\";i:2;s:3:\"url\";s:50:\"./index.php?c=module&a=manage-system&do=installed&\";s:7:\"section\";a:1:{s:13:\"module_manage\";a:2:{s:5:\"title\";s:12:\"应用管理\";s:4:\"menu\";a:6:{s:23:\"module_manage_installed\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:15:\"已安装列表\";s:3:\"url\";s:50:\"./index.php?c=module&a=manage-system&do=installed&\";s:15:\"permission_name\";s:23:\"module_manage_installed\";s:4:\"icon\";N;s:12:\"displayorder\";i:6;s:2:\"id\";N;s:14:\"sub_permission\";a:0:{}}s:20:\"module_manage_stoped\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:15:\"已停用列表\";s:3:\"url\";s:54:\"./index.php?c=module&a=manage-system&do=recycle&type=1\";s:15:\"permission_name\";s:20:\"module_manage_stoped\";s:4:\"icon\";N;s:12:\"displayorder\";i:5;s:2:\"id\";N;s:14:\"sub_permission\";a:0:{}}s:27:\"module_manage_not_installed\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:15:\"未安装列表\";s:3:\"url\";s:54:\"./index.php?c=module&a=manage-system&do=not_installed&\";s:15:\"permission_name\";s:27:\"module_manage_not_installed\";s:4:\"icon\";N;s:12:\"displayorder\";i:4;s:2:\"id\";N;s:14:\"sub_permission\";a:0:{}}s:21:\"module_manage_recycle\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:9:\"回收站\";s:3:\"url\";s:54:\"./index.php?c=module&a=manage-system&do=recycle&type=2\";s:15:\"permission_name\";s:21:\"module_manage_recycle\";s:4:\"icon\";N;s:12:\"displayorder\";i:3;s:2:\"id\";N;s:14:\"sub_permission\";a:0:{}}s:23:\"module_manage_subscribe\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"订阅管理\";s:3:\"url\";s:50:\"./index.php?c=module&a=manage-system&do=subscribe&\";s:15:\"permission_name\";s:23:\"module_manage_subscribe\";s:4:\"icon\";N;s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";a:0:{}}s:20:\"module_manage_expire\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:18:\"应用停用提醒\";s:3:\"url\";s:30:\"./index.php?c=module&a=expire&\";s:15:\"permission_name\";s:20:\"module_manage_expire\";s:4:\"icon\";N;s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";a:0:{}}}}}s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:12:\"displayorder\";i:4;}s:11:\"user_manage\";a:8:{s:5:\"title\";s:12:\"用户管理\";s:4:\"icon\";s:16:\"wi wi-user-group\";s:9:\"dimension\";i:2;s:3:\"url\";s:29:\"./index.php?c=user&a=display&\";s:7:\"section\";a:1:{s:11:\"user_manage\";a:2:{s:5:\"title\";s:12:\"用户管理\";s:4:\"menu\";a:6:{s:19:\"user_manage_display\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"用户列表\";s:3:\"url\";s:29:\"./index.php?c=user&a=display&\";s:15:\"permission_name\";s:19:\"user_manage_display\";s:4:\"icon\";N;s:12:\"displayorder\";i:6;s:2:\"id\";N;s:14:\"sub_permission\";a:0:{}}s:19:\"user_manage_founder\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:9:\"副站长\";s:3:\"url\";s:32:\"./index.php?c=founder&a=display&\";s:15:\"permission_name\";s:19:\"user_manage_founder\";s:4:\"icon\";N;s:12:\"displayorder\";i:5;s:2:\"id\";N;s:14:\"sub_permission\";a:0:{}}s:17:\"user_manage_check\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"审核用户\";s:3:\"url\";s:39:\"./index.php?c=user&a=display&type=check\";s:15:\"permission_name\";s:17:\"user_manage_check\";s:4:\"icon\";N;s:12:\"displayorder\";i:4;s:2:\"id\";N;s:14:\"sub_permission\";a:0:{}}s:19:\"user_manage_recycle\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:15:\"用户回收站\";s:3:\"url\";s:41:\"./index.php?c=user&a=display&type=recycle\";s:15:\"permission_name\";s:19:\"user_manage_recycle\";s:4:\"icon\";N;s:12:\"displayorder\";i:3;s:2:\"id\";N;s:14:\"sub_permission\";a:0:{}}s:18:\"user_manage_fields\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:18:\"用户属性设置\";s:3:\"url\";s:39:\"./index.php?c=user&a=fields&do=display&\";s:15:\"permission_name\";s:18:\"user_manage_fields\";s:4:\"icon\";N;s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";a:0:{}}s:26:\"user_manage_expire_setting\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:21:\"自定义到期提示\";s:3:\"url\";s:39:\"./index.php?c=user&a=expire&do=setting&\";s:15:\"permission_name\";s:26:\"user_manage_expire_setting\";s:4:\"icon\";N;s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";a:0:{}}}}}s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:12:\"displayorder\";i:5;}s:10:\"permission\";a:8:{s:5:\"title\";s:9:\"权限组\";s:4:\"icon\";s:22:\"wi wi-userjurisdiction\";s:9:\"dimension\";i:2;s:3:\"url\";s:29:\"./index.php?c=module&a=group&\";s:7:\"section\";a:1:{s:10:\"permission\";a:2:{s:5:\"title\";s:9:\"权限组\";s:4:\"menu\";a:4:{s:23:\"permission_module_group\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:15:\"应用权限组\";s:3:\"url\";s:29:\"./index.php?c=module&a=group&\";s:15:\"permission_name\";s:23:\"permission_module_group\";s:4:\"icon\";N;s:12:\"displayorder\";i:4;s:2:\"id\";N;s:14:\"sub_permission\";a:0:{}}s:31:\"permission_create_account_group\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:15:\"账号权限组\";s:3:\"url\";s:34:\"./index.php?c=user&a=create-group&\";s:15:\"permission_name\";s:31:\"permission_create_account_group\";s:4:\"icon\";N;s:12:\"displayorder\";i:3;s:2:\"id\";N;s:14:\"sub_permission\";a:0:{}}s:21:\"permission_user_group\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:18:\"用户权限组合\";s:3:\"url\";s:27:\"./index.php?c=user&a=group&\";s:15:\"permission_name\";s:21:\"permission_user_group\";s:4:\"icon\";N;s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";a:0:{}}s:24:\"permission_founder_group\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:21:\"副站长权限组合\";s:3:\"url\";s:30:\"./index.php?c=founder&a=group&\";s:15:\"permission_name\";s:24:\"permission_founder_group\";s:4:\"icon\";N;s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";a:0:{}}}}}s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:12:\"displayorder\";i:6;}s:6:\"system\";a:8:{s:5:\"title\";s:12:\"系统功能\";s:4:\"icon\";s:13:\"wi wi-setting\";s:9:\"dimension\";i:3;s:3:\"url\";s:31:\"./index.php?c=article&a=notice&\";s:7:\"section\";a:3:{s:7:\"article\";a:3:{s:5:\"title\";s:12:\"站内公告\";s:4:\"menu\";a:1:{s:14:\"system_article\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"站内公告\";s:3:\"url\";s:31:\"./index.php?c=article&a=notice&\";s:15:\"permission_name\";s:14:\"system_article\";s:4:\"icon\";s:13:\"wi wi-article\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";a:2:{i:0;a:2:{s:5:\"title\";s:12:\"公告列表\";s:15:\"permission_name\";s:26:\"system_article_notice_list\";}i:1;a:2:{s:5:\"title\";s:12:\"公告分类\";s:15:\"permission_name\";s:30:\"system_article_notice_category\";}}}}s:7:\"founder\";b:1;}s:14:\"system_welcome\";a:3:{s:5:\"title\";s:12:\"系统新闻\";s:4:\"menu\";a:1:{s:11:\"system_news\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"系统新闻\";s:3:\"url\";s:29:\"./index.php?c=article&a=news&\";s:15:\"permission_name\";s:11:\"system_news\";s:4:\"icon\";s:13:\"wi wi-article\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";a:2:{i:0;a:2:{s:5:\"title\";s:13:\"新闻列表 \";s:15:\"permission_name\";s:24:\"system_article_news_list\";}i:1;a:2:{s:5:\"title\";s:13:\"新闻分类 \";s:15:\"permission_name\";s:28:\"system_article_news_category\";}}}}s:7:\"founder\";b:1;}s:17:\"system_statistics\";a:3:{s:5:\"title\";s:6:\"统计\";s:4:\"menu\";a:1:{s:23:\"system_account_analysis\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"访问统计\";s:3:\"url\";s:35:\"./index.php?c=statistics&a=account&\";s:15:\"permission_name\";s:23:\"system_account_analysis\";s:4:\"icon\";s:17:\"wi wi-statistical\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}s:7:\"founder\";b:1;}}s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:12:\"displayorder\";i:7;}s:4:\"site\";a:9:{s:5:\"title\";s:12:\"站点设置\";s:4:\"icon\";s:17:\"wi wi-system-site\";s:9:\"dimension\";i:3;s:3:\"url\";s:28:\"./index.php?c=system&a=site&\";s:7:\"section\";a:4:{s:5:\"cloud\";a:2:{s:5:\"title\";s:9:\"云服务\";s:4:\"menu\";a:2:{s:14:\"system_profile\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"系统升级\";s:3:\"url\";s:30:\"./index.php?c=cloud&a=upgrade&\";s:15:\"permission_name\";s:20:\"system_cloud_upgrade\";s:4:\"icon\";s:11:\"wi wi-cache\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:21:\"system_cloud_diagnose\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:15:\"云服务诊断\";s:3:\"url\";s:31:\"./index.php?c=cloud&a=diagnose&\";s:15:\"permission_name\";s:21:\"system_cloud_diagnose\";s:4:\"icon\";s:14:\"wi wi-diagnose\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}}s:7:\"setting\";a:2:{s:5:\"title\";s:6:\"设置\";s:4:\"menu\";a:9:{s:19:\"system_setting_site\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"站点设置\";s:3:\"url\";s:28:\"./index.php?c=system&a=site&\";s:15:\"permission_name\";s:19:\"system_setting_site\";s:4:\"icon\";s:18:\"wi wi-site-setting\";s:12:\"displayorder\";i:9;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:19:\"system_setting_menu\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"菜单设置\";s:3:\"url\";s:28:\"./index.php?c=system&a=menu&\";s:15:\"permission_name\";s:19:\"system_setting_menu\";s:4:\"icon\";s:18:\"wi wi-menu-setting\";s:12:\"displayorder\";i:8;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:25:\"system_setting_attachment\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"附件设置\";s:3:\"url\";s:34:\"./index.php?c=system&a=attachment&\";s:15:\"permission_name\";s:25:\"system_setting_attachment\";s:4:\"icon\";s:16:\"wi wi-attachment\";s:12:\"displayorder\";i:7;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:25:\"system_setting_systeminfo\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"系统信息\";s:3:\"url\";s:34:\"./index.php?c=system&a=systeminfo&\";s:15:\"permission_name\";s:25:\"system_setting_systeminfo\";s:4:\"icon\";s:17:\"wi wi-system-info\";s:12:\"displayorder\";i:6;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:19:\"system_setting_logs\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"查看日志\";s:3:\"url\";s:28:\"./index.php?c=system&a=logs&\";s:15:\"permission_name\";s:19:\"system_setting_logs\";s:4:\"icon\";s:9:\"wi wi-log\";s:12:\"displayorder\";i:5;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:26:\"system_setting_ipwhitelist\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:11:\"IP白名单\";s:3:\"url\";s:35:\"./index.php?c=system&a=ipwhitelist&\";s:15:\"permission_name\";s:26:\"system_setting_ipwhitelist\";s:4:\"icon\";s:8:\"wi wi-ip\";s:12:\"displayorder\";i:4;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:28:\"system_setting_sensitiveword\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:15:\"过滤敏感词\";s:3:\"url\";s:37:\"./index.php?c=system&a=sensitiveword&\";s:15:\"permission_name\";s:28:\"system_setting_sensitiveword\";s:4:\"icon\";s:15:\"wi wi-sensitive\";s:12:\"displayorder\";i:3;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:25:\"system_setting_thirdlogin\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:25:\"用户登录/注册设置\";s:3:\"url\";s:33:\"./index.php?c=user&a=registerset&\";s:15:\"permission_name\";s:25:\"system_setting_thirdlogin\";s:4:\"icon\";s:10:\"wi wi-user\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:20:\"system_setting_oauth\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:18:\"全局借用权限\";s:3:\"url\";s:29:\"./index.php?c=system&a=oauth&\";s:15:\"permission_name\";s:20:\"system_setting_oauth\";s:4:\"icon\";s:11:\"wi wi-oauth\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}}s:7:\"utility\";a:2:{s:5:\"title\";s:12:\"常用工具\";s:4:\"menu\";a:6:{s:24:\"system_utility_filecheck\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:18:\"系统文件校验\";s:3:\"url\";s:33:\"./index.php?c=system&a=filecheck&\";s:15:\"permission_name\";s:24:\"system_utility_filecheck\";s:4:\"icon\";s:10:\"wi wi-file\";s:12:\"displayorder\";i:6;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:23:\"system_utility_optimize\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"性能优化\";s:3:\"url\";s:32:\"./index.php?c=system&a=optimize&\";s:15:\"permission_name\";s:23:\"system_utility_optimize\";s:4:\"icon\";s:14:\"wi wi-optimize\";s:12:\"displayorder\";i:5;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:23:\"system_utility_database\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:9:\"数据库\";s:3:\"url\";s:32:\"./index.php?c=system&a=database&\";s:15:\"permission_name\";s:23:\"system_utility_database\";s:4:\"icon\";s:9:\"wi wi-sql\";s:12:\"displayorder\";i:4;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:19:\"system_utility_scan\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"木马查杀\";s:3:\"url\";s:28:\"./index.php?c=system&a=scan&\";s:15:\"permission_name\";s:19:\"system_utility_scan\";s:4:\"icon\";s:12:\"wi wi-safety\";s:12:\"displayorder\";i:3;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:18:\"system_utility_bom\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:15:\"检测文件BOM\";s:3:\"url\";s:27:\"./index.php?c=system&a=bom&\";s:15:\"permission_name\";s:18:\"system_utility_bom\";s:4:\"icon\";s:9:\"wi wi-bom\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:20:\"system_utility_check\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:18:\"系统常规检测\";s:3:\"url\";s:29:\"./index.php?c=system&a=check&\";s:15:\"permission_name\";s:20:\"system_utility_check\";s:4:\"icon\";s:9:\"wi wi-bom\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}}s:7:\"backjob\";a:2:{s:5:\"title\";s:12:\"后台任务\";s:4:\"menu\";a:1:{s:10:\"system_job\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"后台任务\";s:3:\"url\";s:38:\"./index.php?c=system&a=job&do=display&\";s:15:\"permission_name\";s:10:\"system_job\";s:4:\"icon\";s:9:\"wi wi-job\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}}}s:7:\"founder\";b:1;s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:12:\"displayorder\";i:8;}s:6:\"myself\";a:8:{s:5:\"title\";s:12:\"我的账户\";s:4:\"icon\";s:10:\"wi wi-bell\";s:9:\"dimension\";i:2;s:3:\"url\";s:29:\"./index.php?c=user&a=profile&\";s:7:\"section\";a:0:{}s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:12:\"displayorder\";i:9;}s:7:\"message\";a:8:{s:5:\"title\";s:12:\"消息管理\";s:4:\"icon\";s:12:\"wi wi-xiaoxi\";s:9:\"dimension\";i:2;s:3:\"url\";s:31:\"./index.php?c=message&a=notice&\";s:7:\"section\";a:1:{s:7:\"message\";a:2:{s:5:\"title\";s:12:\"消息管理\";s:4:\"menu\";a:3:{s:14:\"message_notice\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"消息提醒\";s:3:\"url\";s:31:\"./index.php?c=message&a=notice&\";s:15:\"permission_name\";s:14:\"message_notice\";s:4:\"icon\";N;s:12:\"displayorder\";i:3;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:15:\"message_setting\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"消息设置\";s:3:\"url\";s:42:\"./index.php?c=message&a=notice&do=setting&\";s:15:\"permission_name\";s:15:\"message_setting\";s:4:\"icon\";N;s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:22:\"message_wechat_setting\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:18:\"微信提醒设置\";s:3:\"url\";s:49:\"./index.php?c=message&a=notice&do=wechat_setting&\";s:15:\"permission_name\";s:22:\"message_wechat_setting\";s:4:\"icon\";N;s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}}}s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:12:\"displayorder\";i:10;}s:7:\"account\";a:8:{s:5:\"title\";s:9:\"公众号\";s:4:\"icon\";s:18:\"wi wi-white-collar\";s:9:\"dimension\";i:3;s:3:\"url\";s:41:\"./index.php?c=home&a=welcome&do=platform&\";s:7:\"section\";a:6:{s:8:\"platform\";a:4:{s:5:\"title\";s:12:\"增强功能\";s:4:\"menu\";a:6:{s:14:\"platform_reply\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";a:2:{i:0;i:1;i:1;i:3;}s:10:\"is_display\";i:0;s:5:\"title\";s:12:\"自动回复\";s:3:\"url\";s:31:\"./index.php?c=platform&a=reply&\";s:15:\"permission_name\";s:14:\"platform_reply\";s:4:\"icon\";s:11:\"wi wi-reply\";s:12:\"displayorder\";i:6;s:2:\"id\";N;s:14:\"sub_permission\";a:7:{s:22:\"platform_reply_keyword\";a:4:{s:5:\"title\";s:21:\"关键字自动回复\";s:3:\"url\";s:50:\"./index.php?c=platform&a=reply&module_name=keyword\";s:15:\"permission_name\";s:22:\"platform_reply_keyword\";s:6:\"active\";s:7:\"keyword\";}s:22:\"platform_reply_special\";a:4:{s:5:\"title\";s:24:\"非关键字自动回复\";s:3:\"url\";s:50:\"./index.php?c=platform&a=reply&module_name=special\";s:15:\"permission_name\";s:22:\"platform_reply_special\";s:6:\"active\";s:7:\"special\";}s:22:\"platform_reply_welcome\";a:4:{s:5:\"title\";s:24:\"首次访问自动回复\";s:3:\"url\";s:50:\"./index.php?c=platform&a=reply&module_name=welcome\";s:15:\"permission_name\";s:22:\"platform_reply_welcome\";s:6:\"active\";s:7:\"welcome\";}s:22:\"platform_reply_default\";a:4:{s:5:\"title\";s:12:\"默认回复\";s:3:\"url\";s:50:\"./index.php?c=platform&a=reply&module_name=default\";s:15:\"permission_name\";s:22:\"platform_reply_default\";s:6:\"active\";s:7:\"default\";}s:22:\"platform_reply_service\";a:4:{s:5:\"title\";s:12:\"常用服务\";s:3:\"url\";s:50:\"./index.php?c=platform&a=reply&module_name=service\";s:15:\"permission_name\";s:22:\"platform_reply_service\";s:6:\"active\";s:7:\"service\";}s:22:\"platform_reply_userapi\";a:5:{s:5:\"title\";s:21:\"自定义接口回复\";s:3:\"url\";s:50:\"./index.php?c=platform&a=reply&module_name=userapi\";s:15:\"permission_name\";s:22:\"platform_reply_userapi\";s:6:\"active\";s:7:\"userapi\";s:10:\"is_display\";a:2:{i:0;i:1;i:1;i:3;}}s:22:\"platform_reply_setting\";a:4:{s:5:\"title\";s:12:\"回复设置\";s:3:\"url\";s:38:\"./index.php?c=profile&a=reply-setting&\";s:15:\"permission_name\";s:22:\"platform_reply_setting\";s:10:\"is_display\";a:2:{i:0;i:1;i:1;i:3;}}}}s:13:\"platform_menu\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";a:2:{i:0;i:1;i:1;i:3;}s:10:\"is_display\";i:0;s:5:\"title\";s:15:\"自定义菜单\";s:3:\"url\";s:38:\"./index.php?c=platform&a=menu&do=post&\";s:15:\"permission_name\";s:13:\"platform_menu\";s:4:\"icon\";s:16:\"wi wi-custommenu\";s:12:\"displayorder\";i:5;s:2:\"id\";N;s:14:\"sub_permission\";a:2:{s:21:\"platform_menu_default\";a:4:{s:5:\"title\";s:12:\"默认菜单\";s:3:\"url\";s:38:\"./index.php?c=platform&a=menu&do=post&\";s:15:\"permission_name\";s:21:\"platform_menu_default\";s:6:\"active\";s:4:\"post\";}s:25:\"platform_menu_conditional\";a:5:{s:5:\"title\";s:15:\"个性化菜单\";s:3:\"url\";s:47:\"./index.php?c=platform&a=menu&do=display&type=3\";s:15:\"permission_name\";s:25:\"platform_menu_conditional\";s:6:\"active\";s:7:\"display\";s:10:\"is_display\";a:2:{i:0;i:1;i:1;i:3;}}}}s:11:\"platform_qr\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";a:2:{i:0;i:1;i:1;i:3;}s:10:\"is_display\";i:0;s:5:\"title\";s:9:\"二维码\";s:3:\"url\";s:28:\"./index.php?c=platform&a=qr&\";s:15:\"permission_name\";s:11:\"platform_qr\";s:4:\"icon\";s:12:\"wi wi-qrcode\";s:12:\"displayorder\";i:4;s:2:\"id\";N;s:14:\"sub_permission\";a:2:{s:14:\"platform_qr_qr\";a:4:{s:5:\"title\";s:9:\"二维码\";s:3:\"url\";s:36:\"./index.php?c=platform&a=qr&do=list&\";s:15:\"permission_name\";s:14:\"platform_qr_qr\";s:6:\"active\";s:4:\"list\";}s:22:\"platform_qr_statistics\";a:4:{s:5:\"title\";s:21:\"二维码扫描统计\";s:3:\"url\";s:39:\"./index.php?c=platform&a=qr&do=display&\";s:15:\"permission_name\";s:22:\"platform_qr_statistics\";s:6:\"active\";s:7:\"display\";}}}s:17:\"platform_masstask\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";a:2:{i:0;i:1;i:1;i:3;}s:10:\"is_display\";i:0;s:5:\"title\";s:6:\"群发\";s:3:\"url\";s:30:\"./index.php?c=platform&a=mass&\";s:15:\"permission_name\";s:17:\"platform_masstask\";s:4:\"icon\";s:13:\"wi wi-crontab\";s:12:\"displayorder\";i:3;s:2:\"id\";N;s:14:\"sub_permission\";a:2:{s:22:\"platform_masstask_post\";a:4:{s:5:\"title\";s:6:\"群发\";s:3:\"url\";s:38:\"./index.php?c=platform&a=mass&do=post&\";s:15:\"permission_name\";s:22:\"platform_masstask_post\";s:6:\"active\";s:4:\"post\";}s:22:\"platform_masstask_send\";a:4:{s:5:\"title\";s:12:\"群发记录\";s:3:\"url\";s:38:\"./index.php?c=platform&a=mass&do=send&\";s:15:\"permission_name\";s:22:\"platform_masstask_send\";s:6:\"active\";s:4:\"send\";}}}s:17:\"platform_material\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";a:2:{i:0;i:1;i:1;i:3;}s:10:\"is_display\";i:0;s:5:\"title\";s:16:\"素材/编辑器\";s:3:\"url\";s:34:\"./index.php?c=platform&a=material&\";s:15:\"permission_name\";s:17:\"platform_material\";s:4:\"icon\";s:12:\"wi wi-redact\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";a:5:{s:22:\"platform_material_news\";a:4:{s:5:\"title\";s:6:\"图文\";s:3:\"url\";s:43:\"./index.php?c=platform&a=material&type=news\";s:15:\"permission_name\";s:22:\"platform_material_news\";s:6:\"active\";s:4:\"news\";}s:23:\"platform_material_image\";a:4:{s:5:\"title\";s:6:\"图片\";s:3:\"url\";s:44:\"./index.php?c=platform&a=material&type=image\";s:15:\"permission_name\";s:23:\"platform_material_image\";s:6:\"active\";s:5:\"image\";}s:23:\"platform_material_voice\";a:4:{s:5:\"title\";s:6:\"语音\";s:3:\"url\";s:44:\"./index.php?c=platform&a=material&type=voice\";s:15:\"permission_name\";s:23:\"platform_material_voice\";s:6:\"active\";s:5:\"voice\";}s:23:\"platform_material_video\";a:5:{s:5:\"title\";s:6:\"视频\";s:3:\"url\";s:44:\"./index.php?c=platform&a=material&type=video\";s:15:\"permission_name\";s:23:\"platform_material_video\";s:6:\"active\";s:5:\"video\";s:10:\"is_display\";a:2:{i:0;i:1;i:1;i:3;}}s:24:\"platform_material_delete\";a:3:{s:5:\"title\";s:6:\"删除\";s:15:\"permission_name\";s:24:\"platform_material_delete\";s:10:\"is_display\";i:0;}}}s:13:\"platform_site\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";a:2:{i:0;i:1;i:1;i:3;}s:10:\"is_display\";i:0;s:5:\"title\";s:16:\"微官网-文章\";s:3:\"url\";s:27:\"./index.php?c=site&a=multi&\";s:15:\"permission_name\";s:13:\"platform_site\";s:4:\"icon\";s:10:\"wi wi-home\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";a:4:{s:19:\"platform_site_multi\";a:4:{s:5:\"title\";s:9:\"微官网\";s:3:\"url\";s:38:\"./index.php?c=site&a=multi&do=display&\";s:15:\"permission_name\";s:19:\"platform_site_multi\";s:6:\"active\";s:5:\"multi\";}s:19:\"platform_site_style\";a:4:{s:5:\"title\";s:15:\"微官网模板\";s:3:\"url\";s:39:\"./index.php?c=site&a=style&do=template&\";s:15:\"permission_name\";s:19:\"platform_site_style\";s:6:\"active\";s:5:\"style\";}s:21:\"platform_site_article\";a:4:{s:5:\"title\";s:12:\"文章管理\";s:3:\"url\";s:40:\"./index.php?c=site&a=article&do=display&\";s:15:\"permission_name\";s:21:\"platform_site_article\";s:6:\"active\";s:7:\"article\";}s:22:\"platform_site_category\";a:4:{s:5:\"title\";s:18:\"文章分类管理\";s:3:\"url\";s:41:\"./index.php?c=site&a=category&do=display&\";s:15:\"permission_name\";s:22:\"platform_site_category\";s:6:\"active\";s:8:\"category\";}}}}s:18:\"permission_display\";a:2:{i:0;i:1;i:1;i:3;}s:10:\"is_display\";i:0;}s:15:\"platform_module\";a:3:{s:5:\"title\";s:12:\"应用模块\";s:4:\"menu\";a:0:{}s:10:\"is_display\";i:1;}s:2:\"mc\";a:4:{s:5:\"title\";s:6:\"粉丝\";s:4:\"menu\";a:3:{s:7:\"mc_fans\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";a:2:{i:0;i:1;i:1;i:3;}s:10:\"is_display\";i:0;s:5:\"title\";s:12:\"粉丝管理\";s:3:\"url\";s:24:\"./index.php?c=mc&a=fans&\";s:15:\"permission_name\";s:7:\"mc_fans\";s:4:\"icon\";s:16:\"wi wi-fansmanage\";s:12:\"displayorder\";i:3;s:2:\"id\";N;s:14:\"sub_permission\";a:2:{s:15:\"mc_fans_display\";a:4:{s:5:\"title\";s:12:\"全部粉丝\";s:3:\"url\";s:35:\"./index.php?c=mc&a=fans&do=display&\";s:15:\"permission_name\";s:15:\"mc_fans_display\";s:6:\"active\";s:7:\"display\";}s:21:\"mc_fans_fans_sync_set\";a:4:{s:5:\"title\";s:18:\"粉丝同步设置\";s:3:\"url\";s:41:\"./index.php?c=mc&a=fans&do=fans_sync_set&\";s:15:\"permission_name\";s:21:\"mc_fans_fans_sync_set\";s:6:\"active\";s:13:\"fans_sync_set\";}}}s:9:\"mc_member\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";a:3:{i:0;i:1;i:1;i:3;i:2;i:5;}s:10:\"is_display\";i:0;s:5:\"title\";s:12:\"会员管理\";s:3:\"url\";s:26:\"./index.php?c=mc&a=member&\";s:15:\"permission_name\";s:9:\"mc_member\";s:4:\"icon\";s:10:\"wi wi-fans\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";a:7:{s:17:\"mc_member_diaplsy\";a:4:{s:5:\"title\";s:12:\"会员管理\";s:3:\"url\";s:37:\"./index.php?c=mc&a=member&do=display&\";s:15:\"permission_name\";s:17:\"mc_member_diaplsy\";s:6:\"active\";s:7:\"display\";}s:15:\"mc_member_group\";a:4:{s:5:\"title\";s:9:\"会员组\";s:3:\"url\";s:36:\"./index.php?c=mc&a=group&do=display&\";s:15:\"permission_name\";s:15:\"mc_member_group\";s:6:\"active\";s:7:\"display\";}s:12:\"mc_member_uc\";a:5:{s:5:\"title\";s:12:\"会员中心\";s:3:\"url\";s:34:\"./index.php?c=site&a=editor&do=uc&\";s:15:\"permission_name\";s:12:\"mc_member_uc\";s:6:\"active\";s:2:\"uc\";s:10:\"is_display\";a:2:{i:0;i:1;i:1;i:3;}}s:19:\"mc_member_quickmenu\";a:5:{s:5:\"title\";s:12:\"快捷菜单\";s:3:\"url\";s:41:\"./index.php?c=site&a=editor&do=quickmenu&\";s:15:\"permission_name\";s:19:\"mc_member_quickmenu\";s:6:\"active\";s:9:\"quickmenu\";s:10:\"is_display\";a:2:{i:0;i:1;i:1;i:3;}}s:25:\"mc_member_register_seting\";a:5:{s:5:\"title\";s:12:\"注册设置\";s:3:\"url\";s:46:\"./index.php?c=mc&a=member&do=register_setting&\";s:15:\"permission_name\";s:25:\"mc_member_register_seting\";s:6:\"active\";s:16:\"register_setting\";s:10:\"is_display\";a:2:{i:0;i:1;i:1;i:3;}}s:24:\"mc_member_credit_setting\";a:4:{s:5:\"title\";s:12:\"积分设置\";s:3:\"url\";s:44:\"./index.php?c=mc&a=member&do=credit_setting&\";s:15:\"permission_name\";s:24:\"mc_member_credit_setting\";s:6:\"active\";s:14:\"credit_setting\";}s:16:\"mc_member_fields\";a:4:{s:5:\"title\";s:18:\"会员字段管理\";s:3:\"url\";s:34:\"./index.php?c=mc&a=fields&do=list&\";s:15:\"permission_name\";s:16:\"mc_member_fields\";s:6:\"active\";s:4:\"list\";}}}s:10:\"mc_message\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";a:2:{i:0;i:1;i:1;i:3;}s:10:\"is_display\";i:0;s:5:\"title\";s:12:\"留言管理\";s:3:\"url\";s:27:\"./index.php?c=mc&a=message&\";s:15:\"permission_name\";s:10:\"mc_message\";s:4:\"icon\";s:13:\"wi wi-message\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}s:18:\"permission_display\";a:3:{i:0;i:1;i:1;i:3;i:2;i:5;}s:10:\"is_display\";i:0;}s:7:\"profile\";a:4:{s:5:\"title\";s:6:\"配置\";s:4:\"menu\";a:7:{s:15:\"profile_setting\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";a:3:{i:0;i:1;i:1;i:3;i:2;i:5;}s:10:\"is_display\";i:0;s:5:\"title\";s:12:\"参数配置\";s:3:\"url\";s:31:\"./index.php?c=profile&a=remote&\";s:15:\"permission_name\";s:15:\"profile_setting\";s:4:\"icon\";s:23:\"wi wi-parameter-setting\";s:12:\"displayorder\";i:7;s:2:\"id\";N;s:14:\"sub_permission\";a:5:{s:22:\"profile_setting_remote\";a:4:{s:5:\"title\";s:12:\"远程附件\";s:3:\"url\";s:42:\"./index.php?c=profile&a=remote&do=display&\";s:15:\"permission_name\";s:22:\"profile_setting_remote\";s:6:\"active\";s:7:\"display\";}s:24:\"profile_setting_passport\";a:5:{s:5:\"title\";s:12:\"借用权限\";s:3:\"url\";s:42:\"./index.php?c=profile&a=passport&do=oauth&\";s:15:\"permission_name\";s:24:\"profile_setting_passport\";s:6:\"active\";s:5:\"oauth\";s:10:\"is_display\";a:2:{i:0;i:1;i:1;i:3;}}s:25:\"profile_setting_tplnotice\";a:5:{s:5:\"title\";s:18:\"微信通知设置\";s:3:\"url\";s:42:\"./index.php?c=profile&a=tplnotice&do=list&\";s:15:\"permission_name\";s:25:\"profile_setting_tplnotice\";s:6:\"active\";s:4:\"list\";s:10:\"is_display\";a:2:{i:0;i:1;i:1;i:3;}}s:22:\"profile_setting_notify\";a:5:{s:5:\"title\";s:18:\"邮件通知参数\";s:3:\"url\";s:39:\"./index.php?c=profile&a=notify&do=mail&\";s:15:\"permission_name\";s:22:\"profile_setting_notify\";s:6:\"active\";s:4:\"mail\";s:10:\"is_display\";a:2:{i:0;i:1;i:1;i:3;}}s:27:\"profile_setting_upload_file\";a:5:{s:5:\"title\";s:20:\"上传JS接口文件\";s:3:\"url\";s:46:\"./index.php?c=profile&a=common&do=upload_file&\";s:15:\"permission_name\";s:27:\"profile_setting_upload_file\";s:6:\"active\";s:11:\"upload_file\";s:10:\"is_display\";a:2:{i:0;i:1;i:1;i:3;}}}}s:15:\"profile_payment\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";a:3:{i:0;i:1;i:1;i:3;i:2;i:5;}s:10:\"is_display\";i:0;s:5:\"title\";s:12:\"支付参数\";s:3:\"url\";s:32:\"./index.php?c=profile&a=payment&\";s:15:\"permission_name\";s:15:\"profile_payment\";s:4:\"icon\";s:17:\"wi wi-pay-setting\";s:12:\"displayorder\";i:6;s:2:\"id\";N;s:14:\"sub_permission\";a:2:{s:19:\"profile_payment_pay\";a:4:{s:5:\"title\";s:12:\"支付配置\";s:3:\"url\";s:32:\"./index.php?c=profile&a=payment&\";s:15:\"permission_name\";s:19:\"profile_payment_pay\";s:6:\"active\";s:7:\"payment\";}s:22:\"profile_payment_refund\";a:4:{s:5:\"title\";s:12:\"退款配置\";s:3:\"url\";s:42:\"./index.php?c=profile&a=refund&do=display&\";s:15:\"permission_name\";s:22:\"profile_payment_refund\";s:6:\"active\";s:6:\"refund\";}}}s:23:\"profile_app_module_link\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";a:2:{i:0;i:1;i:1;i:3;}s:10:\"is_display\";i:0;s:5:\"title\";s:12:\"数据同步\";s:3:\"url\";s:44:\"./index.php?c=profile&a=module-link-uniacid&\";s:15:\"permission_name\";s:31:\"profile_app_module_link_uniacid\";s:4:\"icon\";s:18:\"wi wi-data-synchro\";s:12:\"displayorder\";i:5;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:19:\"profile_bind_domain\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";a:2:{i:0;i:1;i:1;i:3;}s:10:\"is_display\";i:0;s:5:\"title\";s:12:\"域名绑定\";s:3:\"url\";s:36:\"./index.php?c=profile&a=bind-domain&\";s:15:\"permission_name\";s:19:\"profile_bind_domain\";s:4:\"icon\";s:17:\"wi wi-bind-domain\";s:12:\"displayorder\";i:4;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:18:\"webapp_module_link\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";a:1:{i:0;i:5;}s:10:\"is_display\";i:0;s:5:\"title\";s:12:\"数据同步\";s:3:\"url\";s:44:\"./index.php?c=profile&a=module-link-uniacid&\";s:15:\"permission_name\";s:18:\"webapp_module_link\";s:4:\"icon\";s:18:\"wi wi-data-synchro\";s:12:\"displayorder\";i:3;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:14:\"webapp_rewrite\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";a:1:{i:0;i:5;}s:10:\"is_display\";i:0;s:5:\"title\";s:9:\"伪静态\";s:3:\"url\";s:31:\"./index.php?c=webapp&a=rewrite&\";s:15:\"permission_name\";s:14:\"webapp_rewrite\";s:4:\"icon\";s:13:\"wi wi-rewrite\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:18:\"webapp_bind_domain\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";a:1:{i:0;i:5;}s:10:\"is_display\";i:0;s:5:\"title\";s:18:\"域名访问设置\";s:3:\"url\";s:35:\"./index.php?c=webapp&a=bind-domain&\";s:15:\"permission_name\";s:18:\"webapp_bind_domain\";s:4:\"icon\";s:17:\"wi wi-bind-domain\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}s:18:\"permission_display\";a:3:{i:0;i:1;i:1;i:3;i:2;i:5;}s:10:\"is_display\";i:0;}s:7:\"publish\";a:4:{s:5:\"title\";s:6:\"发布\";s:4:\"menu\";a:1:{s:15:\"publish_setting\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";a:2:{i:0;i:1;i:1;i:3;}s:10:\"is_display\";i:0;s:5:\"title\";s:12:\"发布设置\";s:3:\"url\";s:32:\"./index.php?c=profile&a=publish&\";s:15:\"permission_name\";s:15:\"publish_setting\";s:4:\"icon\";s:10:\"wi wi-send\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}s:18:\"permission_display\";a:2:{i:0;i:1;i:1;i:3;}s:10:\"is_display\";i:0;}s:10:\"statistics\";a:4:{s:5:\"title\";s:6:\"统计\";s:4:\"menu\";a:2:{s:16:\"statistics_visit\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";a:3:{i:0;i:1;i:1;i:3;i:2;i:5;}s:10:\"is_display\";i:0;s:5:\"title\";s:12:\"访问统计\";s:3:\"url\";s:31:\"./index.php?c=statistics&a=app&\";s:15:\"permission_name\";s:16:\"statistics_visit\";s:4:\"icon\";s:17:\"wi wi-statistical\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";a:3:{s:20:\"statistics_visit_app\";a:4:{s:5:\"title\";s:24:\"app端访问统计信息\";s:3:\"url\";s:42:\"./index.php?c=statistics&a=app&do=display&\";s:15:\"permission_name\";s:20:\"statistics_visit_app\";s:6:\"active\";s:3:\"app\";}s:21:\"statistics_visit_site\";a:4:{s:5:\"title\";s:24:\"所有用户访问统计\";s:3:\"url\";s:51:\"./index.php?c=statistics&a=site&do=current_account&\";s:15:\"permission_name\";s:21:\"statistics_visit_site\";s:6:\"active\";s:4:\"site\";}s:24:\"statistics_visit_setting\";a:4:{s:5:\"title\";s:18:\"访问统计设置\";s:3:\"url\";s:46:\"./index.php?c=statistics&a=setting&do=display&\";s:15:\"permission_name\";s:24:\"statistics_visit_setting\";s:6:\"active\";s:7:\"setting\";}}}s:15:\"statistics_fans\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";a:2:{i:0;i:1;i:1;i:3;}s:10:\"is_display\";i:0;s:5:\"title\";s:12:\"用户统计\";s:3:\"url\";s:32:\"./index.php?c=statistics&a=fans&\";s:15:\"permission_name\";s:15:\"statistics_fans\";s:4:\"icon\";s:17:\"wi wi-statistical\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}s:18:\"permission_display\";a:3:{i:0;i:1;i:1;i:3;i:2;i:5;}s:10:\"is_display\";i:0;}}s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:12:\"displayorder\";i:11;}s:5:\"wxapp\";a:8:{s:5:\"title\";s:15:\"微信小程序\";s:4:\"icon\";s:19:\"wi wi-small-routine\";s:9:\"dimension\";i:3;s:3:\"url\";s:38:\"./index.php?c=wxapp&a=display&do=home&\";s:7:\"section\";a:6:{s:14:\"wxapp_entrance\";a:4:{s:5:\"title\";s:15:\"小程序入口\";s:4:\"menu\";a:1:{s:20:\"module_entrance_link\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";a:3:{i:0;i:4;i:1;i:7;i:2;i:8;}s:10:\"is_display\";i:0;s:5:\"title\";s:12:\"入口页面\";s:3:\"url\";s:36:\"./index.php?c=wxapp&a=entrance-link&\";s:15:\"permission_name\";s:19:\"wxapp_entrance_link\";s:4:\"icon\";s:18:\"wi wi-data-synchro\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}s:18:\"permission_display\";a:3:{i:0;i:4;i:1;i:7;i:2;i:8;}s:10:\"is_display\";i:0;}s:15:\"platform_module\";a:3:{s:5:\"title\";s:6:\"应用\";s:4:\"menu\";a:0:{}s:10:\"is_display\";i:1;}s:2:\"mc\";a:4:{s:5:\"title\";s:6:\"粉丝\";s:4:\"menu\";a:1:{s:9:\"mc_member\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";a:3:{i:0;i:4;i:1;i:7;i:2;i:8;}s:10:\"is_display\";i:0;s:5:\"title\";s:6:\"会员\";s:3:\"url\";s:26:\"./index.php?c=mc&a=member&\";s:15:\"permission_name\";s:15:\"mc_wxapp_member\";s:4:\"icon\";s:10:\"wi wi-fans\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";a:4:{s:17:\"mc_member_diaplsy\";a:4:{s:5:\"title\";s:12:\"会员管理\";s:3:\"url\";s:37:\"./index.php?c=mc&a=member&do=display&\";s:15:\"permission_name\";s:17:\"mc_member_diaplsy\";s:6:\"active\";s:7:\"display\";}s:15:\"mc_member_group\";a:4:{s:5:\"title\";s:9:\"会员组\";s:3:\"url\";s:36:\"./index.php?c=mc&a=group&do=display&\";s:15:\"permission_name\";s:15:\"mc_member_group\";s:6:\"active\";s:7:\"display\";}s:24:\"mc_member_credit_setting\";a:4:{s:5:\"title\";s:12:\"积分设置\";s:3:\"url\";s:44:\"./index.php?c=mc&a=member&do=credit_setting&\";s:15:\"permission_name\";s:24:\"mc_member_credit_setting\";s:6:\"active\";s:14:\"credit_setting\";}s:16:\"mc_member_fields\";a:4:{s:5:\"title\";s:18:\"会员字段管理\";s:3:\"url\";s:34:\"./index.php?c=mc&a=fields&do=list&\";s:15:\"permission_name\";s:16:\"mc_member_fields\";s:6:\"active\";s:4:\"list\";}}}}s:18:\"permission_display\";a:3:{i:0;i:4;i:1;i:7;i:2;i:8;}s:10:\"is_display\";i:0;}s:13:\"wxapp_profile\";a:3:{s:5:\"title\";s:6:\"配置\";s:4:\"menu\";a:4:{s:33:\"wxapp_profile_module_link_uniacid\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";a:7:{i:0;i:4;i:1;i:7;i:2;i:8;i:3;i:6;i:4;i:11;i:5;i:12;i:6;i:13;}s:10:\"is_display\";i:0;s:5:\"title\";s:12:\"数据同步\";s:3:\"url\";s:42:\"./index.php?c=wxapp&a=module-link-uniacid&\";s:15:\"permission_name\";s:33:\"wxapp_profile_module_link_uniacid\";s:4:\"icon\";s:18:\"wi wi-data-synchro\";s:12:\"displayorder\";i:5;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:21:\"wxapp_profile_payment\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";a:3:{i:0;i:4;i:1;i:7;i:2;i:8;}s:10:\"is_display\";i:0;s:5:\"title\";s:12:\"支付参数\";s:3:\"url\";s:30:\"./index.php?c=wxapp&a=payment&\";s:15:\"permission_name\";s:21:\"wxapp_profile_payment\";s:4:\"icon\";s:16:\"wi wi-appsetting\";s:12:\"displayorder\";i:4;s:2:\"id\";N;s:14:\"sub_permission\";a:2:{s:17:\"wxapp_payment_pay\";a:4:{s:5:\"title\";s:12:\"支付参数\";s:3:\"url\";s:41:\"./index.php?c=wxapp&a=payment&do=display&\";s:15:\"permission_name\";s:17:\"wxapp_payment_pay\";s:6:\"active\";s:7:\"payment\";}s:20:\"wxapp_payment_refund\";a:4:{s:5:\"title\";s:12:\"退款配置\";s:3:\"url\";s:40:\"./index.php?c=wxapp&a=refund&do=display&\";s:15:\"permission_name\";s:20:\"wxapp_payment_refund\";s:6:\"active\";s:6:\"refund\";}}}s:23:\"wxapp_profile_domainset\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";a:3:{i:0;i:4;i:1;i:7;i:2;i:8;}s:10:\"is_display\";i:0;s:5:\"title\";s:12:\"域名设置\";s:3:\"url\";s:32:\"./index.php?c=wxapp&a=domainset&\";s:15:\"permission_name\";s:23:\"wxapp_profile_domainset\";s:4:\"icon\";s:13:\"wi wi-examine\";s:12:\"displayorder\";i:3;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:22:\"profile_setting_remote\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";a:7:{i:0;i:4;i:1;i:7;i:2;i:8;i:3;i:6;i:4;i:11;i:5;i:12;i:6;i:13;}s:10:\"is_display\";i:0;s:5:\"title\";s:12:\"参数配置\";s:3:\"url\";s:31:\"./index.php?c=profile&a=remote&\";s:15:\"permission_name\";s:22:\"profile_setting_remote\";s:4:\"icon\";s:23:\"wi wi-parameter-setting\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";N;}}s:18:\"permission_display\";a:7:{i:0;i:4;i:1;i:7;i:2;i:8;i:3;i:6;i:4;i:11;i:5;i:12;i:6;i:13;}}s:7:\"publish\";a:4:{s:5:\"title\";s:6:\"发布\";s:4:\"menu\";a:1:{s:22:\"publish_front_download\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";a:7:{i:0;i:4;i:1;i:7;i:2;i:8;i:3;i:6;i:4;i:11;i:5;i:12;i:6;i:13;}s:10:\"is_display\";i:0;s:5:\"title\";s:12:\"发布设置\";s:3:\"url\";s:37:\"./index.php?c=wxapp&a=front-download&\";s:15:\"permission_name\";s:22:\"publish_front_download\";s:4:\"icon\";s:13:\"wi wi-examine\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}s:18:\"permission_display\";a:7:{i:0;i:4;i:1;i:7;i:2;i:8;i:3;i:6;i:4;i:11;i:5;i:12;i:6;i:13;}s:10:\"is_display\";i:0;}s:10:\"statistics\";a:4:{s:5:\"title\";s:6:\"统计\";s:4:\"menu\";a:2:{s:16:\"statistics_visit\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";a:7:{i:0;i:4;i:1;i:7;i:2;i:8;i:3;i:6;i:4;i:11;i:5;i:12;i:6;i:13;}s:10:\"is_display\";i:0;s:5:\"title\";s:12:\"访问统计\";s:3:\"url\";s:31:\"./index.php?c=statistics&a=app&\";s:15:\"permission_name\";s:22:\"statistics_visit_wxapp\";s:4:\"icon\";s:17:\"wi wi-statistical\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";a:3:{s:20:\"statistics_visit_app\";a:4:{s:5:\"title\";s:24:\"app端访问统计信息\";s:3:\"url\";s:42:\"./index.php?c=statistics&a=app&do=display&\";s:15:\"permission_name\";s:20:\"statistics_visit_app\";s:6:\"active\";s:3:\"app\";}s:21:\"statistics_visit_site\";a:4:{s:5:\"title\";s:24:\"所有用户访问统计\";s:3:\"url\";s:51:\"./index.php?c=statistics&a=site&do=current_account&\";s:15:\"permission_name\";s:21:\"statistics_visit_site\";s:6:\"active\";s:4:\"site\";}s:24:\"statistics_visit_setting\";a:4:{s:5:\"title\";s:18:\"访问统计设置\";s:3:\"url\";s:46:\"./index.php?c=statistics&a=setting&do=display&\";s:15:\"permission_name\";s:24:\"statistics_visit_setting\";s:6:\"active\";s:7:\"setting\";}}}s:15:\"statistics_fans\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";a:3:{i:0;i:4;i:1;i:7;i:2;i:8;}s:10:\"is_display\";i:0;s:5:\"title\";s:12:\"用户统计\";s:3:\"url\";s:33:\"./index.php?c=wxapp&a=statistics&\";s:15:\"permission_name\";s:21:\"statistics_fans_wxapp\";s:4:\"icon\";s:17:\"wi wi-statistical\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}s:18:\"permission_display\";a:7:{i:0;i:4;i:1;i:7;i:2;i:8;i:3;i:6;i:4;i:11;i:5;i:12;i:6;i:13;}s:10:\"is_display\";i:0;}}s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:12:\"displayorder\";i:12;}s:6:\"webapp\";a:7:{s:5:\"title\";s:2:\"PC\";s:4:\"icon\";s:8:\"wi wi-pc\";s:3:\"url\";s:39:\"./index.php?c=webapp&a=home&do=display&\";s:7:\"section\";a:0:{}s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:12:\"displayorder\";i:13;}s:8:\"phoneapp\";a:7:{s:5:\"title\";s:3:\"APP\";s:4:\"icon\";s:18:\"wi wi-white-collar\";s:3:\"url\";s:41:\"./index.php?c=phoneapp&a=display&do=home&\";s:7:\"section\";a:2:{s:15:\"platform_module\";a:3:{s:5:\"title\";s:6:\"应用\";s:4:\"menu\";a:0:{}s:10:\"is_display\";i:1;}s:16:\"phoneapp_profile\";a:4:{s:5:\"title\";s:6:\"配置\";s:4:\"menu\";a:2:{s:28:\"profile_phoneapp_module_link\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";a:1:{i:0;i:6;}s:10:\"is_display\";i:0;s:5:\"title\";s:12:\"数据同步\";s:3:\"url\";s:42:\"./index.php?c=wxapp&a=module-link-uniacid&\";s:15:\"permission_name\";s:28:\"profile_phoneapp_module_link\";s:4:\"icon\";s:18:\"wi wi-data-synchro\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:14:\"front_download\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:9:\"下载APP\";s:3:\"url\";s:40:\"./index.php?c=phoneapp&a=front-download&\";s:15:\"permission_name\";s:23:\"phoneapp_front_download\";s:4:\"icon\";s:13:\"wi wi-examine\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}s:10:\"is_display\";i:1;s:18:\"permission_display\";a:1:{i:0;i:6;}}}s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:12:\"displayorder\";i:14;}s:6:\"aliapp\";a:7:{s:5:\"title\";s:18:\"支付宝小程序\";s:4:\"icon\";s:12:\"wi wi-aliapp\";s:3:\"url\";s:40:\"./index.php?c=miniapp&a=display&do=home&\";s:7:\"section\";a:1:{s:15:\"platform_module\";a:3:{s:5:\"title\";s:6:\"应用\";s:4:\"menu\";a:0:{}s:10:\"is_display\";i:1;}}s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:12:\"displayorder\";i:15;}s:8:\"baiduapp\";a:7:{s:5:\"title\";s:15:\"百度小程序\";s:4:\"icon\";s:14:\"wi wi-baiduapp\";s:3:\"url\";s:40:\"./index.php?c=miniapp&a=display&do=home&\";s:7:\"section\";a:1:{s:15:\"platform_module\";a:3:{s:5:\"title\";s:6:\"应用\";s:4:\"menu\";a:0:{}s:10:\"is_display\";i:1;}}s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:12:\"displayorder\";i:16;}s:10:\"toutiaoapp\";a:7:{s:5:\"title\";s:21:\"字节跳动小程序\";s:4:\"icon\";s:16:\"wi wi-toutiaoapp\";s:3:\"url\";s:40:\"./index.php?c=miniapp&a=display&do=home&\";s:7:\"section\";a:1:{s:15:\"platform_module\";a:3:{s:5:\"title\";s:6:\"应用\";s:4:\"menu\";a:0:{}s:10:\"is_display\";i:1;}}s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:12:\"displayorder\";i:17;}s:5:\"store\";a:7:{s:5:\"title\";s:6:\"商城\";s:4:\"icon\";s:11:\"wi wi-store\";s:3:\"url\";s:53:\"./index.php?c=home&a=welcome&do=ext&module_name=store\";s:7:\"section\";a:7:{s:11:\"store_goods\";a:2:{s:5:\"title\";s:12:\"商品分类\";s:4:\"menu\";a:8:{s:18:\"store_goods_module\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"应用模块\";s:3:\"url\";s:79:\"./index.php?c=site&a=entry&do=goodsbuyer&module_name=store&direct=1&type=module\";s:15:\"permission_name\";s:18:\"store_goods_module\";s:4:\"icon\";s:11:\"wi wi-apply\";s:12:\"displayorder\";i:8;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:19:\"store_goods_account\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"平台个数\";s:3:\"url\";s:84:\"./index.php?c=site&a=entry&do=goodsbuyer&module_name=store&direct=1&type=account_num\";s:15:\"permission_name\";s:19:\"store_goods_account\";s:4:\"icon\";s:13:\"wi wi-account\";s:12:\"displayorder\";i:7;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:25:\"store_goods_account_renew\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"平台续费\";s:3:\"url\";s:78:\"./index.php?c=site&a=entry&do=goodsbuyer&module_name=store&direct=1&type=renew\";s:15:\"permission_name\";s:25:\"store_goods_account_renew\";s:4:\"icon\";s:21:\"wi wi-appjurisdiction\";s:12:\"displayorder\";i:6;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:19:\"store_goods_package\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:15:\"应用权限组\";s:3:\"url\";s:74:\"./index.php?c=site&a=entry&do=goodsbuyer&module_name=store&direct=1&type=5\";s:15:\"permission_name\";s:19:\"store_goods_package\";s:4:\"icon\";s:21:\"wi wi-appjurisdiction\";s:12:\"displayorder\";i:5;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:24:\"store_goods_user_account\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:15:\"账号权限组\";s:3:\"url\";s:75:\"./index.php?c=site&a=entry&do=goodsbuyer&module_name=store&direct=1&type=10\";s:15:\"permission_name\";s:24:\"store_goods_user_account\";s:4:\"icon\";s:21:\"wi wi-appjurisdiction\";s:12:\"displayorder\";i:4;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:22:\"store_goods_user_renew\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:15:\"账号有效期\";s:3:\"url\";s:75:\"./index.php?c=site&a=entry&do=goodsbuyer&module_name=store&direct=1&type=29\";s:15:\"permission_name\";s:22:\"store_goods_user_renew\";s:4:\"icon\";s:21:\"wi wi-appjurisdiction\";s:12:\"displayorder\";i:3;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:25:\"store_goods_users_package\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:15:\"用户权限组\";s:3:\"url\";s:74:\"./index.php?c=site&a=entry&do=goodsbuyer&module_name=store&direct=1&type=9\";s:15:\"permission_name\";s:25:\"store_goods_users_package\";s:4:\"icon\";s:22:\"wi wi-userjurisdiction\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:15:\"store_goods_api\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:23:\"应用访问流量(API)\";s:3:\"url\";s:74:\"./index.php?c=site&a=entry&do=goodsbuyer&module_name=store&direct=1&type=6\";s:15:\"permission_name\";s:15:\"store_goods_api\";s:4:\"icon\";s:9:\"wi wi-api\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}}s:16:\"store_wish_goods\";a:2:{s:5:\"title\";s:12:\"预购应用\";s:4:\"menu\";a:2:{s:21:\"store_wish_goods_list\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"应用列表\";s:3:\"url\";s:94:\"./index.php?c=site&a=entry&do=goodsbuyer&module_name=store&direct=1&type=module_wish&is_wish=1\";s:15:\"permission_name\";s:21:\"store_wish_goods_list\";s:4:\"icon\";s:11:\"wi wi-apply\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:21:\"store_wish_goods_edit\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:19:\"添加/设置应用\";s:3:\"url\";s:92:\"./index.php?c=site&a=entry&do=wishgoodsEdit&module_name=store&direct=1&op=wishgoods&status=1\";s:15:\"permission_name\";s:21:\"store_wish_goods_edit\";s:4:\"icon\";s:15:\"wi wi-goods-add\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}}s:12:\"store_manage\";a:3:{s:5:\"title\";s:12:\"商城管理\";s:7:\"founder\";b:1;s:4:\"menu\";a:4:{s:18:\"store_manage_goods\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"添加商品\";s:3:\"url\";s:68:\"./index.php?c=site&a=entry&do=goodsSeller&module_name=store&direct=1\";s:15:\"permission_name\";s:18:\"store_manage_goods\";s:4:\"icon\";s:15:\"wi wi-goods-add\";s:12:\"displayorder\";i:4;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:20:\"store_manage_setting\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"商城设置\";s:3:\"url\";s:64:\"./index.php?c=site&a=entry&do=setting&module_name=store&direct=1\";s:15:\"permission_name\";s:20:\"store_manage_setting\";s:4:\"icon\";s:11:\"wi wi-store\";s:12:\"displayorder\";i:3;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:19:\"store_manage_payset\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"支付设置\";s:3:\"url\";s:67:\"./index.php?c=site&a=entry&do=paySetting&module_name=store&direct=1\";s:15:\"permission_name\";s:19:\"store_manage_payset\";s:4:\"icon\";s:11:\"wi wi-money\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:23:\"store_manage_permission\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:18:\"商城访问权限\";s:3:\"url\";s:67:\"./index.php?c=site&a=entry&do=permission&module_name=store&direct=1\";s:15:\"permission_name\";s:23:\"store_manage_permission\";s:4:\"icon\";s:15:\"wi wi-blacklist\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}}s:12:\"store_orders\";a:2:{s:5:\"title\";s:12:\"订单管理\";s:4:\"menu\";a:2:{s:15:\"store_orders_my\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"我的订单\";s:3:\"url\";s:63:\"./index.php?c=site&a=entry&do=orders&module_name=store&direct=1\";s:15:\"permission_name\";s:15:\"store_orders_my\";s:4:\"icon\";s:17:\"wi wi-sale-record\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:17:\"store_cash_orders\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"分销订单\";s:3:\"url\";s:81:\"./index.php?c=site&a=entry&do=cash&module_name=store&operate=cash_orders&direct=1\";s:15:\"permission_name\";s:17:\"store_cash_orders\";s:4:\"icon\";s:11:\"wi wi-order\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}}s:14:\"store_payments\";a:3:{s:5:\"title\";s:12:\"收入明细\";s:7:\"founder\";b:1;s:4:\"menu\";a:1:{s:8:\"payments\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"收入明细\";s:3:\"url\";s:65:\"./index.php?c=site&a=entry&do=payments&module_name=store&direct=1\";s:15:\"permission_name\";s:8:\"payments\";s:4:\"icon\";s:17:\"wi wi-sale-record\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}}s:17:\"store_cash_manage\";a:3:{s:5:\"title\";s:12:\"分销管理\";s:7:\"founder\";b:1;s:4:\"menu\";a:2:{s:25:\"store_manage_cash_setting\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"分销设置\";s:3:\"url\";s:68:\"./index.php?c=site&a=entry&do=cashsetting&module_name=store&direct=1\";s:15:\"permission_name\";s:25:\"store_manage_cash_setting\";s:4:\"icon\";s:18:\"wi wi-site-setting\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:16:\"store_check_cash\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"提现审核\";s:3:\"url\";s:83:\"./index.php?c=site&a=entry&do=cash&module_name=store&operate=consume_order&direct=1\";s:15:\"permission_name\";s:16:\"store_check_cash\";s:4:\"icon\";s:18:\"wi wi-check-select\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}}s:10:\"store_cash\";a:3:{s:5:\"title\";s:12:\"佣金管理\";s:12:\"vice_founder\";b:1;s:4:\"menu\";a:1:{s:8:\"payments\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"我的佣金\";s:3:\"url\";s:76:\"./index.php?c=site&a=entry&do=cash&module_name=store&operate=mycash&direct=1\";s:15:\"permission_name\";s:8:\"payments\";s:4:\"icon\";s:10:\"wi wi-list\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}}}s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:12:\"displayorder\";i:18;}}'),('we7:unisetting:1','a:30:{s:7:\"uniacid\";s:1:\"1\";s:8:\"passport\";a:3:{s:8:\"focusreg\";i:0;s:4:\"item\";s:5:\"email\";s:4:\"type\";s:8:\"password\";}s:5:\"oauth\";a:2:{s:6:\"status\";s:1:\"0\";s:7:\"account\";s:1:\"0\";}s:11:\"jsauth_acid\";s:1:\"0\";s:6:\"notify\";a:1:{s:3:\"sms\";a:2:{s:7:\"balance\";i:0;s:9:\"signature\";s:0:\"\";}}s:11:\"creditnames\";a:5:{s:7:\"credit1\";a:2:{s:5:\"title\";s:6:\"积分\";s:7:\"enabled\";i:1;}s:7:\"credit2\";a:2:{s:5:\"title\";s:6:\"余额\";s:7:\"enabled\";i:1;}s:7:\"credit3\";a:2:{s:5:\"title\";s:0:\"\";s:7:\"enabled\";i:0;}s:7:\"credit4\";a:2:{s:5:\"title\";s:0:\"\";s:7:\"enabled\";i:0;}s:7:\"credit5\";a:2:{s:5:\"title\";s:0:\"\";s:7:\"enabled\";i:0;}}s:15:\"creditbehaviors\";a:2:{s:8:\"activity\";s:7:\"credit1\";s:8:\"currency\";s:7:\"credit2\";}s:7:\"welcome\";s:0:\"\";s:7:\"default\";s:0:\"\";s:15:\"default_message\";s:0:\"\";s:7:\"payment\";a:5:{s:6:\"credit\";a:1:{s:6:\"switch\";b:0;}s:6:\"alipay\";a:4:{s:6:\"switch\";b:0;s:7:\"account\";s:0:\"\";s:7:\"partner\";s:0:\"\";s:6:\"secret\";s:0:\"\";}s:6:\"wechat\";a:7:{s:6:\"switch\";b:0;s:7:\"account\";b:0;s:7:\"signkey\";s:0:\"\";s:7:\"partner\";s:0:\"\";s:3:\"key\";s:0:\"\";s:10:\"pay_switch\";b:0;s:15:\"recharge_switch\";b:0;}s:8:\"delivery\";a:1:{s:6:\"switch\";b:0;}s:4:\"didi\";a:9:{s:15:\"recharge_switch\";s:4:\"true\";s:10:\"pay_switch\";s:4:\"true\";s:3:\"url\";s:23:\"http://pay.didigov.com/\";s:5:\"mchid\";i:1392;s:10:\"has_config\";s:4:\"true\";s:12:\"recharge_set\";s:4:\"true\";s:11:\"support_set\";s:5:\"false\";s:10:\"has_status\";s:4:\"true\";s:6:\"mchkey\";s:32:\"9db873c4fd73a64e175fbd9ab6f68a6e\";}}s:4:\"stat\";s:0:\"\";s:12:\"default_site\";s:1:\"1\";s:4:\"sync\";s:1:\"0\";s:8:\"recharge\";s:0:\"\";s:9:\"tplnotice\";s:0:\"\";s:10:\"grouplevel\";s:1:\"0\";s:8:\"mcplugin\";s:0:\"\";s:15:\"exchange_enable\";s:1:\"0\";s:11:\"coupon_type\";s:1:\"0\";s:7:\"menuset\";s:0:\"\";s:10:\"statistics\";s:0:\"\";s:11:\"bind_domain\";s:0:\"\";s:14:\"comment_status\";s:1:\"0\";s:13:\"reply_setting\";s:1:\"0\";s:14:\"default_module\";s:0:\"\";s:16:\"attachment_limit\";s:1:\"0\";s:15:\"attachment_size\";s:5:\"14314\";s:11:\"sync_member\";s:1:\"0\";s:6:\"remote\";s:0:\"\";}'),('we7:user_accounts:account:1','a:1:{i:1;a:8:{s:4:\"acid\";s:1:\"1\";s:7:\"uniacid\";s:1:\"1\";s:4:\"name\";s:7:\"we7team\";s:4:\"type\";s:1:\"1\";s:5:\"level\";s:1:\"1\";s:3:\"key\";s:0:\"\";s:6:\"secret\";s:0:\"\";s:5:\"token\";s:32:\"omJNpZEhZeHj1ZxFECKkP48B5VFbk1HP\";}}'),('we7:user_accounts:wxapp:1','a:0:{}'),('we7:user_accounts:webapp:1','a:0:{}'),('we7:user_accounts:phoneapp:1','a:0:{}'),('we7:user_accounts:aliapp:1','a:0:{}'),('we7:user_accounts:baiduapp:1','a:0:{}'),('we7:user_accounts:toutiaoapp:1','a:0:{}'),('we7:module_setting:vp_ph:1','a:7:{s:2:\"id\";s:1:\"1\";s:7:\"uniacid\";s:1:\"1\";s:6:\"module\";s:5:\"vp_ph\";s:7:\"enabled\";s:1:\"1\";s:8:\"settings\";a:132:{s:12:\"set_acc_name\";s:0:\"\";s:12:\"set_acc_logo\";s:0:\"\";s:14:\"set_acc_qrcode\";s:0:\"\";s:20:\"set_acc_notify_close\";i:1;s:9:\"auth_mode\";i:0;s:16:\"set_mobile_valid\";i:0;s:13:\"unknow_shield\";i:0;s:15:\"text_moderation\";i:0;s:16:\"image_moderation\";i:0;s:11:\"feedin_must\";i:1;s:11:\"prop_images\";i:1;s:12:\"prop_contact\";i:1;s:21:\"prop_feed_placeholder\";s:51:\"简单介绍自己 如年龄星座 兴趣爱好等 \";s:11:\"feed_dviews\";i:0;s:11:\"feed_view_1\";i:5;s:11:\"feed_view_2\";i:10;s:11:\"feed_view_3\";i:15;s:5:\"prop1\";i:0;s:10:\"prop1_name\";s:0:\"\";s:10:\"prop1_text\";s:0:\"\";s:5:\"prop2\";i:0;s:10:\"prop2_name\";s:0:\"\";s:10:\"prop2_text\";s:0:\"\";s:3:\"pao\";i:0;s:11:\"pao_domaina\";s:0:\"\";s:11:\"pao_domainb\";s:0:\"\";s:15:\"paytitle_feedin\";N;s:16:\"paytitle_feedout\";N;s:14:\"paytitle_agent\";N;s:16:\"paytitle_buycoin\";N;s:13:\"prop_position\";i:0;s:8:\"qmap_key\";s:35:\"JQ5BZ-GVYWU-5RLVG-BLHUK-5V656-EAFJ2\";s:6:\"slides\";a:2:{i:0;s:51:\"images/1/2022/04/aR8RwB5lR8lkr88R27RZ22K2s2iB9n.jpg\";i:1;s:51:\"images/1/2022/04/re2ei18viVyv8e4Eee8F1l2BBfxfee.jpg\";}s:9:\"box_pic_1\";s:51:\"images/1/2022/04/w3QTPSsWP3USEgEWsm9SS3qVR3E3Ss.png\";s:9:\"box_pic_2\";s:51:\"images/1/2022/04/tGUU0S9zLz7E0tX0e00wZwS70mza6W.png\";s:9:\"MD_BRANCH\";i:10000;s:14:\"set_app_status\";i:0;s:12:\"set_app_hint\";s:0:\"\";s:17:\"set_verify_status\";i:0;s:12:\"set_app_name\";s:18:\"单身恋爱盲盒\";s:12:\"set_app_logo\";N;s:13:\"set_app_bgclb\";N;s:13:\"set_app_bgctr\";N;s:10:\"set_app_bg\";N;s:13:\"set_app_intro\";N;s:13:\"server_qrcode\";s:51:\"images/1/2022/04/g03dU88aAA993WQYpvVA0UdWVywbw0.png\";s:10:\"app_qa_set\";i:1;s:6:\"app_qa\";s:4985:\"<p style=\"white-space: normal; text-align: center;\"><span style=\"font-size: 12px;\"><img src=\"http://img.baidu.com/hi/bobo/B_0001.gif\"/>Hello，</span></p><p helvetica=\"\" vertical-align:=\"\" text-size-adjust:=\"\" color:=\"\" white-space:=\"\" background-color:=\"\" text-align:=\"\" style=\"white-space: normal; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: none; outline: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 14px; line-height: inherit; text-align: center;\"><span style=\"margin: 0px; padding: 0px; outline: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; font-size: 12px;\">恋爱交友盲盒，您所填写内容即为纸条，将会被有缘人抽取</span></p><p style=\"line-height: normal; margin-top: 5px; text-indent: 2em;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<span style=\"text-indent: 2em;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</span><span style=\"text-indent: 2em;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</span><img src=\"http://mh.fionazone.cn:88/attachment/images/1/2022/04/wPzpeQqff1aoN141o0t7YeAoYYANA1.jpg\" alt=\"IMG_20220418_232349_gaitubao_100x100.jpg\" style=\"text-indent: 2em; max-width: 100%;\"/></p><p><br/></p><p pingfang=\"\" white-space:=\"\" text-align:=\"\" helvetica=\"\" vertical-align:=\"\" text-size-adjust:=\"\" color:=\"\" background-color:=\"\" style=\"white-space: normal; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: none; outline: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; text-align: center;\">（长按识别）</p><p pingfang=\"\" white-space:=\"\" text-align:=\"\" helvetica=\"\" vertical-align:=\"\" text-size-adjust:=\"\" color:=\"\" background-color:=\"\" style=\"white-space: normal; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: none; outline: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 14px; line-height: inherit; text-align: center;\"><span style=\"color: rgb(31, 73, 125); background-color: rgb(255, 255, 255);\">遇到搜索不到的纸条 联系客服补单</span><br/></p><p pingfang=\"\" white-space:=\"\" text-align:=\"\" helvetica=\"\" vertical-align:=\"\" text-size-adjust:=\"\" color:=\"\" background-color:=\"\" style=\"white-space: normal; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: none; outline: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 14px; line-height: inherit; text-align: center;\"><span style=\"color: rgb(255, 0, 0); font-family: inherit; font-size: 12px; font-style: inherit; font-variant-ligatures: inherit; font-variant-caps: inherit; font-weight: inherit;\">如您填写联系方式，则代表您同意授权本应用在玩法内，</span></p><p pingfang=\"\" white-space:=\"\" text-align:=\"\" helvetica=\"\" vertical-align:=\"\" text-size-adjust:=\"\" color:=\"\" background-color:=\"\" style=\"white-space: normal; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: none; outline: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 14px; line-height: inherit; text-align: center;\"><span style=\"color: rgb(255, 0, 0); font-family: inherit; font-size: 12px; font-style: inherit; font-variant-ligatures: inherit; font-variant-caps: inherit; font-weight: inherit;\">将您信息展示给有缘人</span></p><p style=\"white-space: normal; text-align: center;\"><span style=\"font-family: inherit; font-size: 12px; font-style: inherit; font-variant-ligatures: inherit; font-variant-caps: inherit; font-weight: inherit; background-color: rgb(255, 255, 255); color: rgb(255, 0, 0);\">盲盒脱单是一款新型的帮助年轻人获取更多脱单可能性的软件</span></p><p style=\"white-space: normal;\"><span style=\"font-family: inherit; font-size: 12px; font-style: inherit; font-variant-ligatures: inherit; font-variant-caps: inherit; font-weight: inherit; background-color: rgb(255, 255, 255); color: rgb(255, 0, 0);\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 在交友过程中谨防警惕诈骗，切勿轻易转账以防被骗</span></p><p><br/></p>\";s:9:\"app_xieyi\";s:87:\"http://mh.fionazone.cn:88/app/index.php?i=1&c=entry&cmd=page&id=840MQ&do=public&m=vp_ph\";s:9:\"app_yinsi\";s:87:\"http://mh.fionazone.cn:88/app/index.php?i=1&c=entry&cmd=page&id=86fMg&do=public&m=vp_ph\";s:13:\"edit_sp_pname\";i:0;s:14:\"edit_sp_images\";i:0;s:9:\"tags_male\";N;s:11:\"tags_female\";N;s:10:\"pos_status\";i:0;s:12:\"set_app_mode\";i:0;s:13:\"set_app_mode1\";i:0;s:8:\"in_limit\";i:0;s:9:\"out_limit\";i:0;s:12:\"coin_reply_1\";i:1;s:12:\"coin_reply_2\";i:1;s:8:\"coin_top\";i:1;s:11:\"coin_top_qu\";i:1;s:7:\"match-s\";i:1;s:5:\"match\";i:1;s:7:\"is_sign\";i:0;s:9:\"sign_coin\";i:0;s:12:\"reply_images\";i:0;s:9:\"coin_icon\";s:51:\"images/1/2022/04/Bln31Lz9cnxzycVr0SBbYXyyGyYXzb.png\";s:9:\"coin_name\";s:6:\"爱心\";s:11:\"inmoney_way\";i:2;s:13:\"inmoney_coin1\";i:1;s:12:\"inmoney_fee1\";d:1;s:13:\"inmoney_coin2\";i:6;s:12:\"inmoney_fee2\";d:5;s:13:\"inmoney_coin3\";i:14;s:12:\"inmoney_fee3\";d:10;s:10:\"coin_in1_1\";i:0;s:9:\"coin_in_1\";i:1;s:10:\"coin_out_1\";i:1;s:10:\"coin_in1_2\";i:0;s:11:\"fee_out_j_2\";d:0;s:12:\"fee_out_j1_2\";i:0;s:13:\"fee_out_t_j_2\";d:0;s:14:\"fee_out_t_j1_2\";i:0;s:11:\"fee_out_t_1\";d:1;s:11:\"fee_out_t_2\";d:1;s:9:\"coin_in_2\";i:1;s:10:\"coin_out_2\";i:1;s:13:\"coin_out_even\";i:9;s:15:\"coin_out_even_2\";i:10;s:9:\"fee_in1_1\";d:0;s:8:\"fee_in_1\";d:0;s:9:\"fee_out_1\";d:0;s:9:\"fee_in1_2\";d:0;s:8:\"fee_in_2\";d:0;s:9:\"fee_out_2\";d:0;s:7:\"pay_way\";i:0;s:7:\"ios_pay\";i:1;s:11:\"outcash_way\";i:1;s:11:\"outcash_min\";i:1;s:11:\"outcash_max\";i:2000;s:10:\"outcash_sp\";i:1;s:13:\"invite_status\";i:0;s:11:\"invite_logo\";N;s:12:\"invite_title\";N;s:11:\"invite_desc\";N;s:11:\"invite_line\";N;s:13:\"invite_poster\";N;s:12:\"invite_prize\";d:0;s:18:\"invite_prize_limit\";i:0;s:11:\"agent_close\";i:0;s:9:\"agent_fee\";d:9.9000000000000004;s:11:\"agent_title\";s:6:\"红娘\";s:10:\"agent_name\";s:6:\"红娘\";s:11:\"agent_intro\";s:3036:\"<p style=\"font-size: medium; white-space: normal; text-align: center;\">成为摊主，在线上或线下摆个摊</p><p style=\"font-size: medium; white-space: normal;\"><br/></p><p style=\"font-size: medium; white-space: normal; text-align: center;\">加入我们拯救单身狗的大军！</p><p style=\"font-size: medium; white-space: normal;\"><br/></p><p helvetica=\"\" style=\"font-size: medium; white-space: normal; margin-top: 0px; margin-bottom: 0px; padding: 0px; outline: 0px; border: currentcolor; text-align: center; line-height: inherit;\">你推广的用户每次抽取纸条可获得收益<span style=\"font-size: 18px; color: rgb(255, 0, 0);\">70<span style=\"font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; margin: 0px; padding: 0px; outline: 0px; border: currentcolor; vertical-align: baseline;\">%</span></span></p><p helvetica=\"\" style=\"font-size: medium; white-space: normal; margin-top: 0px; margin-bottom: 0px; padding: 0px; outline: 0px; border: currentcolor; text-align: center; line-height: inherit;\">发发朋友圈，轻松日赚<span style=\"font-size: 18px; color: rgb(255, 0, 0);\">200<span style=\"font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; margin: 0px; padding: 0px; outline: 0px; border: currentcolor; vertical-align: baseline;\">+</span></span></p><p helvetica=\"\" style=\"font-size: medium; white-space: normal; margin-top: 0px; margin-bottom: 0px; padding: 0px; outline: 0px; border: currentcolor; line-height: inherit;\"><span style=\"font: inherit; margin: 0px; padding: 0px; outline: 0px; border: currentcolor; color: rgb(255, 0, 0); vertical-align: baseline;\"><br/></span></p><p style=\"font-size: medium; white-space: normal; text-align: center;\">当然，咱做这些怎么会是为了钱</p><p style=\"font-size: medium; white-space: normal;\"><br/></p><p style=\"font-size: medium; white-space: normal; text-align: center;\">还不是为国出力，提高结婚率</p><p style=\"font-size: medium; white-space: normal;\"><br/></p><p style=\"font-size: medium; white-space: normal; text-align: center;\">从而提高生育率，减慢老龄化</p><p style=\"font-size: medium; white-space: normal;\"><br/></p><p style=\"font-size: medium; white-space: normal; text-align: center;\">成为店长，限时<span style=\"color: rgb(255, 0, 0);\">9.9元</span><span style=\"color: rgb(255, 0, 0); text-decoration-line: line-through;\">（原价99.98）</span></p><p style=\"font-size: medium; white-space: normal;\"><br/></p><p style=\"font-size: medium; white-space: normal; text-align: center;\">暂时开放<span style=\"color: rgb(255, 0, 0);\">500名</span>，当前名额<span style=\"color: rgb(255, 0, 0);\">【489/500】</span></p><p style=\"font-size: medium; white-space: normal;\"><br/></p><p style=\"font-size: medium; white-space: normal; text-align: center;\">一起稳赚收益！</p><p style=\"font-size: medium; white-space: normal;\"><br/></p><p><br/></p>\";s:11:\"agent_share\";s:0:\"\";s:10:\"agent_rate\";i:70;s:11:\"agent_rate1\";i:0;s:12:\"agent_poster\";s:51:\"images/1/2022/04/vg4y1Y3U1123e262r8s12F24s2Mf1q.jpg\";s:12:\"agent_sphurl\";N;s:13:\"nt_feed_reply\";s:0:\"\";s:10:\"nt_feed_no\";s:0:\"\";s:9:\"zheng_icp\";s:0:\"\";s:10:\"zheng_icpz\";s:0:\"\";s:9:\"zheng_wab\";s:0:\"\";s:15:\"share_post_logo\";s:0:\"\";s:16:\"share_post_title\";s:0:\"\";s:15:\"share_post_desc\";s:0:\"\";s:15:\"share_post_line\";s:0:\"\";s:8:\"auth_key\";s:0:\"\";s:8:\"task_key\";N;}s:8:\"shortcut\";s:1:\"0\";s:12:\"displayorder\";s:1:\"0\";}'),('we7:uniaccount:','a:1:{s:11:\"encrypt_key\";N;}'),('we7:site_store_buy:6:1','i:0;'),('we7:system_frame:1','a:17:{s:7:\"welcome\";a:7:{s:5:\"title\";s:6:\"首页\";s:4:\"icon\";s:10:\"wi wi-home\";s:3:\"url\";s:48:\"./index.php?c=home&a=welcome&do=system&page=home\";s:7:\"section\";a:0:{}s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:12:\"displayorder\";i:2;}s:14:\"account_manage\";a:8:{s:5:\"title\";s:12:\"平台管理\";s:4:\"icon\";s:21:\"wi wi-platform-manage\";s:9:\"dimension\";i:2;s:3:\"url\";s:31:\"./index.php?c=account&a=manage&\";s:7:\"section\";a:1:{s:14:\"account_manage\";a:2:{s:5:\"title\";s:12:\"平台管理\";s:4:\"menu\";a:4:{s:22:\"account_manage_display\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"平台列表\";s:3:\"url\";s:31:\"./index.php?c=account&a=manage&\";s:15:\"permission_name\";s:22:\"account_manage_display\";s:4:\"icon\";N;s:12:\"displayorder\";i:4;s:2:\"id\";N;s:14:\"sub_permission\";a:1:{i:0;a:2:{s:5:\"title\";s:12:\"帐号停用\";s:15:\"permission_name\";s:19:\"account_manage_stop\";}}}s:22:\"account_manage_recycle\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:9:\"回收站\";s:3:\"url\";s:32:\"./index.php?c=account&a=recycle&\";s:15:\"permission_name\";s:22:\"account_manage_recycle\";s:4:\"icon\";N;s:12:\"displayorder\";i:3;s:2:\"id\";N;s:14:\"sub_permission\";a:2:{i:0;a:2:{s:5:\"title\";s:12:\"帐号删除\";s:15:\"permission_name\";s:21:\"account_manage_delete\";}i:1;a:2:{s:5:\"title\";s:12:\"帐号恢复\";s:15:\"permission_name\";s:22:\"account_manage_recover\";}}}s:30:\"account_manage_system_platform\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:19:\" 微信开放平台\";s:3:\"url\";s:32:\"./index.php?c=system&a=platform&\";s:15:\"permission_name\";s:30:\"account_manage_system_platform\";s:4:\"icon\";N;s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:30:\"account_manage_expired_message\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:22:\" 自定义到期提示\";s:3:\"url\";s:40:\"./index.php?c=account&a=expired-message&\";s:15:\"permission_name\";s:30:\"account_manage_expired_message\";s:4:\"icon\";N;s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}}}s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:12:\"displayorder\";i:3;}s:13:\"module_manage\";a:8:{s:5:\"title\";s:12:\"应用管理\";s:4:\"icon\";s:19:\"wi wi-module-manage\";s:9:\"dimension\";i:2;s:3:\"url\";s:50:\"./index.php?c=module&a=manage-system&do=installed&\";s:7:\"section\";a:1:{s:13:\"module_manage\";a:2:{s:5:\"title\";s:12:\"应用管理\";s:4:\"menu\";a:6:{s:23:\"module_manage_installed\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:15:\"已安装列表\";s:3:\"url\";s:50:\"./index.php?c=module&a=manage-system&do=installed&\";s:15:\"permission_name\";s:23:\"module_manage_installed\";s:4:\"icon\";N;s:12:\"displayorder\";i:6;s:2:\"id\";N;s:14:\"sub_permission\";a:0:{}}s:20:\"module_manage_stoped\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:15:\"已停用列表\";s:3:\"url\";s:54:\"./index.php?c=module&a=manage-system&do=recycle&type=1\";s:15:\"permission_name\";s:20:\"module_manage_stoped\";s:4:\"icon\";N;s:12:\"displayorder\";i:5;s:2:\"id\";N;s:14:\"sub_permission\";a:0:{}}s:27:\"module_manage_not_installed\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:15:\"未安装列表\";s:3:\"url\";s:54:\"./index.php?c=module&a=manage-system&do=not_installed&\";s:15:\"permission_name\";s:27:\"module_manage_not_installed\";s:4:\"icon\";N;s:12:\"displayorder\";i:4;s:2:\"id\";N;s:14:\"sub_permission\";a:0:{}}s:21:\"module_manage_recycle\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:9:\"回收站\";s:3:\"url\";s:54:\"./index.php?c=module&a=manage-system&do=recycle&type=2\";s:15:\"permission_name\";s:21:\"module_manage_recycle\";s:4:\"icon\";N;s:12:\"displayorder\";i:3;s:2:\"id\";N;s:14:\"sub_permission\";a:0:{}}s:23:\"module_manage_subscribe\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"订阅管理\";s:3:\"url\";s:50:\"./index.php?c=module&a=manage-system&do=subscribe&\";s:15:\"permission_name\";s:23:\"module_manage_subscribe\";s:4:\"icon\";N;s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";a:0:{}}s:20:\"module_manage_expire\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:18:\"应用停用提醒\";s:3:\"url\";s:30:\"./index.php?c=module&a=expire&\";s:15:\"permission_name\";s:20:\"module_manage_expire\";s:4:\"icon\";N;s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";a:0:{}}}}}s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:12:\"displayorder\";i:4;}s:11:\"user_manage\";a:8:{s:5:\"title\";s:12:\"用户管理\";s:4:\"icon\";s:16:\"wi wi-user-group\";s:9:\"dimension\";i:2;s:3:\"url\";s:29:\"./index.php?c=user&a=display&\";s:7:\"section\";a:1:{s:11:\"user_manage\";a:2:{s:5:\"title\";s:12:\"用户管理\";s:4:\"menu\";a:6:{s:19:\"user_manage_display\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"用户列表\";s:3:\"url\";s:29:\"./index.php?c=user&a=display&\";s:15:\"permission_name\";s:19:\"user_manage_display\";s:4:\"icon\";N;s:12:\"displayorder\";i:6;s:2:\"id\";N;s:14:\"sub_permission\";a:0:{}}s:19:\"user_manage_founder\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:9:\"副站长\";s:3:\"url\";s:32:\"./index.php?c=founder&a=display&\";s:15:\"permission_name\";s:19:\"user_manage_founder\";s:4:\"icon\";N;s:12:\"displayorder\";i:5;s:2:\"id\";N;s:14:\"sub_permission\";a:0:{}}s:17:\"user_manage_check\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"审核用户\";s:3:\"url\";s:39:\"./index.php?c=user&a=display&type=check\";s:15:\"permission_name\";s:17:\"user_manage_check\";s:4:\"icon\";N;s:12:\"displayorder\";i:4;s:2:\"id\";N;s:14:\"sub_permission\";a:0:{}}s:19:\"user_manage_recycle\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:15:\"用户回收站\";s:3:\"url\";s:41:\"./index.php?c=user&a=display&type=recycle\";s:15:\"permission_name\";s:19:\"user_manage_recycle\";s:4:\"icon\";N;s:12:\"displayorder\";i:3;s:2:\"id\";N;s:14:\"sub_permission\";a:0:{}}s:18:\"user_manage_fields\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:18:\"用户属性设置\";s:3:\"url\";s:39:\"./index.php?c=user&a=fields&do=display&\";s:15:\"permission_name\";s:18:\"user_manage_fields\";s:4:\"icon\";N;s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";a:0:{}}s:26:\"user_manage_expire_setting\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:21:\"自定义到期提示\";s:3:\"url\";s:39:\"./index.php?c=user&a=expire&do=setting&\";s:15:\"permission_name\";s:26:\"user_manage_expire_setting\";s:4:\"icon\";N;s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";a:0:{}}}}}s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:12:\"displayorder\";i:5;}s:10:\"permission\";a:8:{s:5:\"title\";s:9:\"权限组\";s:4:\"icon\";s:22:\"wi wi-userjurisdiction\";s:9:\"dimension\";i:2;s:3:\"url\";s:29:\"./index.php?c=module&a=group&\";s:7:\"section\";a:1:{s:10:\"permission\";a:2:{s:5:\"title\";s:9:\"权限组\";s:4:\"menu\";a:4:{s:23:\"permission_module_group\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:15:\"应用权限组\";s:3:\"url\";s:29:\"./index.php?c=module&a=group&\";s:15:\"permission_name\";s:23:\"permission_module_group\";s:4:\"icon\";N;s:12:\"displayorder\";i:4;s:2:\"id\";N;s:14:\"sub_permission\";a:0:{}}s:31:\"permission_create_account_group\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:15:\"账号权限组\";s:3:\"url\";s:34:\"./index.php?c=user&a=create-group&\";s:15:\"permission_name\";s:31:\"permission_create_account_group\";s:4:\"icon\";N;s:12:\"displayorder\";i:3;s:2:\"id\";N;s:14:\"sub_permission\";a:0:{}}s:21:\"permission_user_group\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:18:\"用户权限组合\";s:3:\"url\";s:27:\"./index.php?c=user&a=group&\";s:15:\"permission_name\";s:21:\"permission_user_group\";s:4:\"icon\";N;s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";a:0:{}}s:24:\"permission_founder_group\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:21:\"副站长权限组合\";s:3:\"url\";s:30:\"./index.php?c=founder&a=group&\";s:15:\"permission_name\";s:24:\"permission_founder_group\";s:4:\"icon\";N;s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";a:0:{}}}}}s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:12:\"displayorder\";i:6;}s:6:\"system\";a:8:{s:5:\"title\";s:12:\"系统功能\";s:4:\"icon\";s:13:\"wi wi-setting\";s:9:\"dimension\";i:3;s:3:\"url\";s:31:\"./index.php?c=article&a=notice&\";s:7:\"section\";a:3:{s:7:\"article\";a:3:{s:5:\"title\";s:12:\"站内公告\";s:4:\"menu\";a:1:{s:14:\"system_article\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"站内公告\";s:3:\"url\";s:31:\"./index.php?c=article&a=notice&\";s:15:\"permission_name\";s:14:\"system_article\";s:4:\"icon\";s:13:\"wi wi-article\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";a:2:{i:0;a:2:{s:5:\"title\";s:12:\"公告列表\";s:15:\"permission_name\";s:26:\"system_article_notice_list\";}i:1;a:2:{s:5:\"title\";s:12:\"公告分类\";s:15:\"permission_name\";s:30:\"system_article_notice_category\";}}}}s:7:\"founder\";b:1;}s:14:\"system_welcome\";a:3:{s:5:\"title\";s:12:\"系统新闻\";s:4:\"menu\";a:1:{s:11:\"system_news\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"系统新闻\";s:3:\"url\";s:29:\"./index.php?c=article&a=news&\";s:15:\"permission_name\";s:11:\"system_news\";s:4:\"icon\";s:13:\"wi wi-article\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";a:2:{i:0;a:2:{s:5:\"title\";s:13:\"新闻列表 \";s:15:\"permission_name\";s:24:\"system_article_news_list\";}i:1;a:2:{s:5:\"title\";s:13:\"新闻分类 \";s:15:\"permission_name\";s:28:\"system_article_news_category\";}}}}s:7:\"founder\";b:1;}s:17:\"system_statistics\";a:3:{s:5:\"title\";s:6:\"统计\";s:4:\"menu\";a:1:{s:23:\"system_account_analysis\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"访问统计\";s:3:\"url\";s:35:\"./index.php?c=statistics&a=account&\";s:15:\"permission_name\";s:23:\"system_account_analysis\";s:4:\"icon\";s:17:\"wi wi-statistical\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}s:7:\"founder\";b:1;}}s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:12:\"displayorder\";i:7;}s:4:\"site\";a:9:{s:5:\"title\";s:12:\"站点设置\";s:4:\"icon\";s:17:\"wi wi-system-site\";s:9:\"dimension\";i:3;s:3:\"url\";s:28:\"./index.php?c=system&a=site&\";s:7:\"section\";a:4:{s:5:\"cloud\";a:2:{s:5:\"title\";s:9:\"云服务\";s:4:\"menu\";a:2:{s:14:\"system_profile\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"系统升级\";s:3:\"url\";s:30:\"./index.php?c=cloud&a=upgrade&\";s:15:\"permission_name\";s:20:\"system_cloud_upgrade\";s:4:\"icon\";s:11:\"wi wi-cache\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:21:\"system_cloud_diagnose\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:15:\"云服务诊断\";s:3:\"url\";s:31:\"./index.php?c=cloud&a=diagnose&\";s:15:\"permission_name\";s:21:\"system_cloud_diagnose\";s:4:\"icon\";s:14:\"wi wi-diagnose\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}}s:7:\"setting\";a:2:{s:5:\"title\";s:6:\"设置\";s:4:\"menu\";a:9:{s:19:\"system_setting_site\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"站点设置\";s:3:\"url\";s:28:\"./index.php?c=system&a=site&\";s:15:\"permission_name\";s:19:\"system_setting_site\";s:4:\"icon\";s:18:\"wi wi-site-setting\";s:12:\"displayorder\";i:9;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:19:\"system_setting_menu\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"菜单设置\";s:3:\"url\";s:28:\"./index.php?c=system&a=menu&\";s:15:\"permission_name\";s:19:\"system_setting_menu\";s:4:\"icon\";s:18:\"wi wi-menu-setting\";s:12:\"displayorder\";i:8;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:25:\"system_setting_attachment\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"附件设置\";s:3:\"url\";s:34:\"./index.php?c=system&a=attachment&\";s:15:\"permission_name\";s:25:\"system_setting_attachment\";s:4:\"icon\";s:16:\"wi wi-attachment\";s:12:\"displayorder\";i:7;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:25:\"system_setting_systeminfo\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"系统信息\";s:3:\"url\";s:34:\"./index.php?c=system&a=systeminfo&\";s:15:\"permission_name\";s:25:\"system_setting_systeminfo\";s:4:\"icon\";s:17:\"wi wi-system-info\";s:12:\"displayorder\";i:6;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:19:\"system_setting_logs\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"查看日志\";s:3:\"url\";s:28:\"./index.php?c=system&a=logs&\";s:15:\"permission_name\";s:19:\"system_setting_logs\";s:4:\"icon\";s:9:\"wi wi-log\";s:12:\"displayorder\";i:5;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:26:\"system_setting_ipwhitelist\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:11:\"IP白名单\";s:3:\"url\";s:35:\"./index.php?c=system&a=ipwhitelist&\";s:15:\"permission_name\";s:26:\"system_setting_ipwhitelist\";s:4:\"icon\";s:8:\"wi wi-ip\";s:12:\"displayorder\";i:4;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:28:\"system_setting_sensitiveword\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:15:\"过滤敏感词\";s:3:\"url\";s:37:\"./index.php?c=system&a=sensitiveword&\";s:15:\"permission_name\";s:28:\"system_setting_sensitiveword\";s:4:\"icon\";s:15:\"wi wi-sensitive\";s:12:\"displayorder\";i:3;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:25:\"system_setting_thirdlogin\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:25:\"用户登录/注册设置\";s:3:\"url\";s:33:\"./index.php?c=user&a=registerset&\";s:15:\"permission_name\";s:25:\"system_setting_thirdlogin\";s:4:\"icon\";s:10:\"wi wi-user\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:20:\"system_setting_oauth\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:18:\"全局借用权限\";s:3:\"url\";s:29:\"./index.php?c=system&a=oauth&\";s:15:\"permission_name\";s:20:\"system_setting_oauth\";s:4:\"icon\";s:11:\"wi wi-oauth\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}}s:7:\"utility\";a:2:{s:5:\"title\";s:12:\"常用工具\";s:4:\"menu\";a:6:{s:24:\"system_utility_filecheck\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:18:\"系统文件校验\";s:3:\"url\";s:33:\"./index.php?c=system&a=filecheck&\";s:15:\"permission_name\";s:24:\"system_utility_filecheck\";s:4:\"icon\";s:10:\"wi wi-file\";s:12:\"displayorder\";i:6;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:23:\"system_utility_optimize\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"性能优化\";s:3:\"url\";s:32:\"./index.php?c=system&a=optimize&\";s:15:\"permission_name\";s:23:\"system_utility_optimize\";s:4:\"icon\";s:14:\"wi wi-optimize\";s:12:\"displayorder\";i:5;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:23:\"system_utility_database\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:9:\"数据库\";s:3:\"url\";s:32:\"./index.php?c=system&a=database&\";s:15:\"permission_name\";s:23:\"system_utility_database\";s:4:\"icon\";s:9:\"wi wi-sql\";s:12:\"displayorder\";i:4;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:19:\"system_utility_scan\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"木马查杀\";s:3:\"url\";s:28:\"./index.php?c=system&a=scan&\";s:15:\"permission_name\";s:19:\"system_utility_scan\";s:4:\"icon\";s:12:\"wi wi-safety\";s:12:\"displayorder\";i:3;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:18:\"system_utility_bom\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:15:\"检测文件BOM\";s:3:\"url\";s:27:\"./index.php?c=system&a=bom&\";s:15:\"permission_name\";s:18:\"system_utility_bom\";s:4:\"icon\";s:9:\"wi wi-bom\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:20:\"system_utility_check\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:18:\"系统常规检测\";s:3:\"url\";s:29:\"./index.php?c=system&a=check&\";s:15:\"permission_name\";s:20:\"system_utility_check\";s:4:\"icon\";s:9:\"wi wi-bom\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}}s:7:\"backjob\";a:2:{s:5:\"title\";s:12:\"后台任务\";s:4:\"menu\";a:1:{s:10:\"system_job\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"后台任务\";s:3:\"url\";s:38:\"./index.php?c=system&a=job&do=display&\";s:15:\"permission_name\";s:10:\"system_job\";s:4:\"icon\";s:9:\"wi wi-job\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}}}s:7:\"founder\";b:1;s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:12:\"displayorder\";i:8;}s:6:\"myself\";a:8:{s:5:\"title\";s:12:\"我的账户\";s:4:\"icon\";s:10:\"wi wi-bell\";s:9:\"dimension\";i:2;s:3:\"url\";s:29:\"./index.php?c=user&a=profile&\";s:7:\"section\";a:0:{}s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:12:\"displayorder\";i:9;}s:7:\"message\";a:8:{s:5:\"title\";s:12:\"消息管理\";s:4:\"icon\";s:12:\"wi wi-xiaoxi\";s:9:\"dimension\";i:2;s:3:\"url\";s:31:\"./index.php?c=message&a=notice&\";s:7:\"section\";a:1:{s:7:\"message\";a:2:{s:5:\"title\";s:12:\"消息管理\";s:4:\"menu\";a:3:{s:14:\"message_notice\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"消息提醒\";s:3:\"url\";s:31:\"./index.php?c=message&a=notice&\";s:15:\"permission_name\";s:14:\"message_notice\";s:4:\"icon\";N;s:12:\"displayorder\";i:3;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:15:\"message_setting\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"消息设置\";s:3:\"url\";s:42:\"./index.php?c=message&a=notice&do=setting&\";s:15:\"permission_name\";s:15:\"message_setting\";s:4:\"icon\";N;s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:22:\"message_wechat_setting\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:18:\"微信提醒设置\";s:3:\"url\";s:49:\"./index.php?c=message&a=notice&do=wechat_setting&\";s:15:\"permission_name\";s:22:\"message_wechat_setting\";s:4:\"icon\";N;s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}}}s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:12:\"displayorder\";i:10;}s:7:\"account\";a:8:{s:5:\"title\";s:9:\"公众号\";s:4:\"icon\";s:18:\"wi wi-white-collar\";s:9:\"dimension\";i:3;s:3:\"url\";s:41:\"./index.php?c=home&a=welcome&do=platform&\";s:7:\"section\";a:6:{s:8:\"platform\";a:3:{s:5:\"title\";s:12:\"增强功能\";s:4:\"menu\";a:6:{s:14:\"platform_reply\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";a:2:{i:0;i:1;i:1;i:3;}s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"自动回复\";s:3:\"url\";s:31:\"./index.php?c=platform&a=reply&\";s:15:\"permission_name\";s:14:\"platform_reply\";s:4:\"icon\";s:11:\"wi wi-reply\";s:12:\"displayorder\";i:6;s:2:\"id\";N;s:14:\"sub_permission\";a:7:{s:22:\"platform_reply_keyword\";a:4:{s:5:\"title\";s:21:\"关键字自动回复\";s:3:\"url\";s:50:\"./index.php?c=platform&a=reply&module_name=keyword\";s:15:\"permission_name\";s:22:\"platform_reply_keyword\";s:6:\"active\";s:7:\"keyword\";}s:22:\"platform_reply_special\";a:4:{s:5:\"title\";s:24:\"非关键字自动回复\";s:3:\"url\";s:50:\"./index.php?c=platform&a=reply&module_name=special\";s:15:\"permission_name\";s:22:\"platform_reply_special\";s:6:\"active\";s:7:\"special\";}s:22:\"platform_reply_welcome\";a:4:{s:5:\"title\";s:24:\"首次访问自动回复\";s:3:\"url\";s:50:\"./index.php?c=platform&a=reply&module_name=welcome\";s:15:\"permission_name\";s:22:\"platform_reply_welcome\";s:6:\"active\";s:7:\"welcome\";}s:22:\"platform_reply_default\";a:4:{s:5:\"title\";s:12:\"默认回复\";s:3:\"url\";s:50:\"./index.php?c=platform&a=reply&module_name=default\";s:15:\"permission_name\";s:22:\"platform_reply_default\";s:6:\"active\";s:7:\"default\";}s:22:\"platform_reply_service\";a:4:{s:5:\"title\";s:12:\"常用服务\";s:3:\"url\";s:50:\"./index.php?c=platform&a=reply&module_name=service\";s:15:\"permission_name\";s:22:\"platform_reply_service\";s:6:\"active\";s:7:\"service\";}s:22:\"platform_reply_userapi\";a:5:{s:5:\"title\";s:21:\"自定义接口回复\";s:3:\"url\";s:50:\"./index.php?c=platform&a=reply&module_name=userapi\";s:15:\"permission_name\";s:22:\"platform_reply_userapi\";s:6:\"active\";s:7:\"userapi\";s:10:\"is_display\";a:2:{i:0;i:1;i:1;i:3;}}s:22:\"platform_reply_setting\";a:4:{s:5:\"title\";s:12:\"回复设置\";s:3:\"url\";s:38:\"./index.php?c=profile&a=reply-setting&\";s:15:\"permission_name\";s:22:\"platform_reply_setting\";s:10:\"is_display\";a:2:{i:0;i:1;i:1;i:3;}}}}s:13:\"platform_menu\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";a:2:{i:0;i:1;i:1;i:3;}s:10:\"is_display\";i:1;s:5:\"title\";s:15:\"自定义菜单\";s:3:\"url\";s:38:\"./index.php?c=platform&a=menu&do=post&\";s:15:\"permission_name\";s:13:\"platform_menu\";s:4:\"icon\";s:16:\"wi wi-custommenu\";s:12:\"displayorder\";i:5;s:2:\"id\";N;s:14:\"sub_permission\";a:2:{s:21:\"platform_menu_default\";a:4:{s:5:\"title\";s:12:\"默认菜单\";s:3:\"url\";s:38:\"./index.php?c=platform&a=menu&do=post&\";s:15:\"permission_name\";s:21:\"platform_menu_default\";s:6:\"active\";s:4:\"post\";}s:25:\"platform_menu_conditional\";a:5:{s:5:\"title\";s:15:\"个性化菜单\";s:3:\"url\";s:47:\"./index.php?c=platform&a=menu&do=display&type=3\";s:15:\"permission_name\";s:25:\"platform_menu_conditional\";s:6:\"active\";s:7:\"display\";s:10:\"is_display\";a:2:{i:0;i:1;i:1;i:3;}}}}s:11:\"platform_qr\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";a:2:{i:0;i:1;i:1;i:3;}s:10:\"is_display\";i:1;s:5:\"title\";s:9:\"二维码\";s:3:\"url\";s:28:\"./index.php?c=platform&a=qr&\";s:15:\"permission_name\";s:11:\"platform_qr\";s:4:\"icon\";s:12:\"wi wi-qrcode\";s:12:\"displayorder\";i:4;s:2:\"id\";N;s:14:\"sub_permission\";a:2:{s:14:\"platform_qr_qr\";a:4:{s:5:\"title\";s:9:\"二维码\";s:3:\"url\";s:36:\"./index.php?c=platform&a=qr&do=list&\";s:15:\"permission_name\";s:14:\"platform_qr_qr\";s:6:\"active\";s:4:\"list\";}s:22:\"platform_qr_statistics\";a:4:{s:5:\"title\";s:21:\"二维码扫描统计\";s:3:\"url\";s:39:\"./index.php?c=platform&a=qr&do=display&\";s:15:\"permission_name\";s:22:\"platform_qr_statistics\";s:6:\"active\";s:7:\"display\";}}}s:17:\"platform_masstask\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";a:2:{i:0;i:1;i:1;i:3;}s:10:\"is_display\";i:1;s:5:\"title\";s:6:\"群发\";s:3:\"url\";s:30:\"./index.php?c=platform&a=mass&\";s:15:\"permission_name\";s:17:\"platform_masstask\";s:4:\"icon\";s:13:\"wi wi-crontab\";s:12:\"displayorder\";i:3;s:2:\"id\";N;s:14:\"sub_permission\";a:2:{s:22:\"platform_masstask_post\";a:4:{s:5:\"title\";s:6:\"群发\";s:3:\"url\";s:38:\"./index.php?c=platform&a=mass&do=post&\";s:15:\"permission_name\";s:22:\"platform_masstask_post\";s:6:\"active\";s:4:\"post\";}s:22:\"platform_masstask_send\";a:4:{s:5:\"title\";s:12:\"群发记录\";s:3:\"url\";s:38:\"./index.php?c=platform&a=mass&do=send&\";s:15:\"permission_name\";s:22:\"platform_masstask_send\";s:6:\"active\";s:4:\"send\";}}}s:17:\"platform_material\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";a:2:{i:0;i:1;i:1;i:3;}s:10:\"is_display\";i:1;s:5:\"title\";s:16:\"素材/编辑器\";s:3:\"url\";s:34:\"./index.php?c=platform&a=material&\";s:15:\"permission_name\";s:17:\"platform_material\";s:4:\"icon\";s:12:\"wi wi-redact\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";a:5:{s:22:\"platform_material_news\";a:4:{s:5:\"title\";s:6:\"图文\";s:3:\"url\";s:43:\"./index.php?c=platform&a=material&type=news\";s:15:\"permission_name\";s:22:\"platform_material_news\";s:6:\"active\";s:4:\"news\";}s:23:\"platform_material_image\";a:4:{s:5:\"title\";s:6:\"图片\";s:3:\"url\";s:44:\"./index.php?c=platform&a=material&type=image\";s:15:\"permission_name\";s:23:\"platform_material_image\";s:6:\"active\";s:5:\"image\";}s:23:\"platform_material_voice\";a:4:{s:5:\"title\";s:6:\"语音\";s:3:\"url\";s:44:\"./index.php?c=platform&a=material&type=voice\";s:15:\"permission_name\";s:23:\"platform_material_voice\";s:6:\"active\";s:5:\"voice\";}s:23:\"platform_material_video\";a:5:{s:5:\"title\";s:6:\"视频\";s:3:\"url\";s:44:\"./index.php?c=platform&a=material&type=video\";s:15:\"permission_name\";s:23:\"platform_material_video\";s:6:\"active\";s:5:\"video\";s:10:\"is_display\";a:2:{i:0;i:1;i:1;i:3;}}s:24:\"platform_material_delete\";a:3:{s:5:\"title\";s:6:\"删除\";s:15:\"permission_name\";s:24:\"platform_material_delete\";s:10:\"is_display\";i:0;}}}s:13:\"platform_site\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";a:2:{i:0;i:1;i:1;i:3;}s:10:\"is_display\";i:1;s:5:\"title\";s:16:\"微官网-文章\";s:3:\"url\";s:27:\"./index.php?c=site&a=multi&\";s:15:\"permission_name\";s:13:\"platform_site\";s:4:\"icon\";s:10:\"wi wi-home\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";a:4:{s:19:\"platform_site_multi\";a:4:{s:5:\"title\";s:9:\"微官网\";s:3:\"url\";s:38:\"./index.php?c=site&a=multi&do=display&\";s:15:\"permission_name\";s:19:\"platform_site_multi\";s:6:\"active\";s:5:\"multi\";}s:19:\"platform_site_style\";a:4:{s:5:\"title\";s:15:\"微官网模板\";s:3:\"url\";s:39:\"./index.php?c=site&a=style&do=template&\";s:15:\"permission_name\";s:19:\"platform_site_style\";s:6:\"active\";s:5:\"style\";}s:21:\"platform_site_article\";a:4:{s:5:\"title\";s:12:\"文章管理\";s:3:\"url\";s:40:\"./index.php?c=site&a=article&do=display&\";s:15:\"permission_name\";s:21:\"platform_site_article\";s:6:\"active\";s:7:\"article\";}s:22:\"platform_site_category\";a:4:{s:5:\"title\";s:18:\"文章分类管理\";s:3:\"url\";s:41:\"./index.php?c=site&a=category&do=display&\";s:15:\"permission_name\";s:22:\"platform_site_category\";s:6:\"active\";s:8:\"category\";}}}}s:18:\"permission_display\";a:2:{i:0;i:1;i:1;i:3;}}s:15:\"platform_module\";a:3:{s:5:\"title\";s:12:\"应用模块\";s:4:\"menu\";a:0:{}s:10:\"is_display\";i:1;}s:2:\"mc\";a:3:{s:5:\"title\";s:6:\"粉丝\";s:4:\"menu\";a:3:{s:7:\"mc_fans\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";a:2:{i:0;i:1;i:1;i:3;}s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"粉丝管理\";s:3:\"url\";s:24:\"./index.php?c=mc&a=fans&\";s:15:\"permission_name\";s:7:\"mc_fans\";s:4:\"icon\";s:16:\"wi wi-fansmanage\";s:12:\"displayorder\";i:3;s:2:\"id\";N;s:14:\"sub_permission\";a:2:{s:15:\"mc_fans_display\";a:4:{s:5:\"title\";s:12:\"全部粉丝\";s:3:\"url\";s:35:\"./index.php?c=mc&a=fans&do=display&\";s:15:\"permission_name\";s:15:\"mc_fans_display\";s:6:\"active\";s:7:\"display\";}s:21:\"mc_fans_fans_sync_set\";a:4:{s:5:\"title\";s:18:\"粉丝同步设置\";s:3:\"url\";s:41:\"./index.php?c=mc&a=fans&do=fans_sync_set&\";s:15:\"permission_name\";s:21:\"mc_fans_fans_sync_set\";s:6:\"active\";s:13:\"fans_sync_set\";}}}s:9:\"mc_member\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";a:3:{i:0;i:1;i:1;i:3;i:2;i:5;}s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"会员管理\";s:3:\"url\";s:26:\"./index.php?c=mc&a=member&\";s:15:\"permission_name\";s:9:\"mc_member\";s:4:\"icon\";s:10:\"wi wi-fans\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";a:7:{s:17:\"mc_member_diaplsy\";a:4:{s:5:\"title\";s:12:\"会员管理\";s:3:\"url\";s:37:\"./index.php?c=mc&a=member&do=display&\";s:15:\"permission_name\";s:17:\"mc_member_diaplsy\";s:6:\"active\";s:7:\"display\";}s:15:\"mc_member_group\";a:4:{s:5:\"title\";s:9:\"会员组\";s:3:\"url\";s:36:\"./index.php?c=mc&a=group&do=display&\";s:15:\"permission_name\";s:15:\"mc_member_group\";s:6:\"active\";s:7:\"display\";}s:12:\"mc_member_uc\";a:5:{s:5:\"title\";s:12:\"会员中心\";s:3:\"url\";s:34:\"./index.php?c=site&a=editor&do=uc&\";s:15:\"permission_name\";s:12:\"mc_member_uc\";s:6:\"active\";s:2:\"uc\";s:10:\"is_display\";a:2:{i:0;i:1;i:1;i:3;}}s:19:\"mc_member_quickmenu\";a:5:{s:5:\"title\";s:12:\"快捷菜单\";s:3:\"url\";s:41:\"./index.php?c=site&a=editor&do=quickmenu&\";s:15:\"permission_name\";s:19:\"mc_member_quickmenu\";s:6:\"active\";s:9:\"quickmenu\";s:10:\"is_display\";a:2:{i:0;i:1;i:1;i:3;}}s:25:\"mc_member_register_seting\";a:5:{s:5:\"title\";s:12:\"注册设置\";s:3:\"url\";s:46:\"./index.php?c=mc&a=member&do=register_setting&\";s:15:\"permission_name\";s:25:\"mc_member_register_seting\";s:6:\"active\";s:16:\"register_setting\";s:10:\"is_display\";a:2:{i:0;i:1;i:1;i:3;}}s:24:\"mc_member_credit_setting\";a:4:{s:5:\"title\";s:12:\"积分设置\";s:3:\"url\";s:44:\"./index.php?c=mc&a=member&do=credit_setting&\";s:15:\"permission_name\";s:24:\"mc_member_credit_setting\";s:6:\"active\";s:14:\"credit_setting\";}s:16:\"mc_member_fields\";a:4:{s:5:\"title\";s:18:\"会员字段管理\";s:3:\"url\";s:34:\"./index.php?c=mc&a=fields&do=list&\";s:15:\"permission_name\";s:16:\"mc_member_fields\";s:6:\"active\";s:4:\"list\";}}}s:10:\"mc_message\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";a:2:{i:0;i:1;i:1;i:3;}s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"留言管理\";s:3:\"url\";s:27:\"./index.php?c=mc&a=message&\";s:15:\"permission_name\";s:10:\"mc_message\";s:4:\"icon\";s:13:\"wi wi-message\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}s:18:\"permission_display\";a:3:{i:0;i:1;i:1;i:3;i:2;i:5;}}s:7:\"profile\";a:3:{s:5:\"title\";s:6:\"配置\";s:4:\"menu\";a:7:{s:15:\"profile_setting\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";a:3:{i:0;i:1;i:1;i:3;i:2;i:5;}s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"参数配置\";s:3:\"url\";s:31:\"./index.php?c=profile&a=remote&\";s:15:\"permission_name\";s:15:\"profile_setting\";s:4:\"icon\";s:23:\"wi wi-parameter-setting\";s:12:\"displayorder\";i:7;s:2:\"id\";N;s:14:\"sub_permission\";a:5:{s:22:\"profile_setting_remote\";a:4:{s:5:\"title\";s:12:\"远程附件\";s:3:\"url\";s:42:\"./index.php?c=profile&a=remote&do=display&\";s:15:\"permission_name\";s:22:\"profile_setting_remote\";s:6:\"active\";s:7:\"display\";}s:24:\"profile_setting_passport\";a:5:{s:5:\"title\";s:12:\"借用权限\";s:3:\"url\";s:42:\"./index.php?c=profile&a=passport&do=oauth&\";s:15:\"permission_name\";s:24:\"profile_setting_passport\";s:6:\"active\";s:5:\"oauth\";s:10:\"is_display\";a:2:{i:0;i:1;i:1;i:3;}}s:25:\"profile_setting_tplnotice\";a:5:{s:5:\"title\";s:18:\"微信通知设置\";s:3:\"url\";s:42:\"./index.php?c=profile&a=tplnotice&do=list&\";s:15:\"permission_name\";s:25:\"profile_setting_tplnotice\";s:6:\"active\";s:4:\"list\";s:10:\"is_display\";a:2:{i:0;i:1;i:1;i:3;}}s:22:\"profile_setting_notify\";a:5:{s:5:\"title\";s:18:\"邮件通知参数\";s:3:\"url\";s:39:\"./index.php?c=profile&a=notify&do=mail&\";s:15:\"permission_name\";s:22:\"profile_setting_notify\";s:6:\"active\";s:4:\"mail\";s:10:\"is_display\";a:2:{i:0;i:1;i:1;i:3;}}s:27:\"profile_setting_upload_file\";a:5:{s:5:\"title\";s:20:\"上传JS接口文件\";s:3:\"url\";s:46:\"./index.php?c=profile&a=common&do=upload_file&\";s:15:\"permission_name\";s:27:\"profile_setting_upload_file\";s:6:\"active\";s:11:\"upload_file\";s:10:\"is_display\";a:2:{i:0;i:1;i:1;i:3;}}}}s:15:\"profile_payment\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";a:3:{i:0;i:1;i:1;i:3;i:2;i:5;}s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"支付参数\";s:3:\"url\";s:32:\"./index.php?c=profile&a=payment&\";s:15:\"permission_name\";s:15:\"profile_payment\";s:4:\"icon\";s:17:\"wi wi-pay-setting\";s:12:\"displayorder\";i:6;s:2:\"id\";N;s:14:\"sub_permission\";a:2:{s:19:\"profile_payment_pay\";a:4:{s:5:\"title\";s:12:\"支付配置\";s:3:\"url\";s:32:\"./index.php?c=profile&a=payment&\";s:15:\"permission_name\";s:19:\"profile_payment_pay\";s:6:\"active\";s:7:\"payment\";}s:22:\"profile_payment_refund\";a:4:{s:5:\"title\";s:12:\"退款配置\";s:3:\"url\";s:42:\"./index.php?c=profile&a=refund&do=display&\";s:15:\"permission_name\";s:22:\"profile_payment_refund\";s:6:\"active\";s:6:\"refund\";}}}s:23:\"profile_app_module_link\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";a:2:{i:0;i:1;i:1;i:3;}s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"数据同步\";s:3:\"url\";s:44:\"./index.php?c=profile&a=module-link-uniacid&\";s:15:\"permission_name\";s:31:\"profile_app_module_link_uniacid\";s:4:\"icon\";s:18:\"wi wi-data-synchro\";s:12:\"displayorder\";i:5;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:19:\"profile_bind_domain\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";a:2:{i:0;i:1;i:1;i:3;}s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"域名绑定\";s:3:\"url\";s:36:\"./index.php?c=profile&a=bind-domain&\";s:15:\"permission_name\";s:19:\"profile_bind_domain\";s:4:\"icon\";s:17:\"wi wi-bind-domain\";s:12:\"displayorder\";i:4;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:18:\"webapp_module_link\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";a:1:{i:0;i:5;}s:10:\"is_display\";i:0;s:5:\"title\";s:12:\"数据同步\";s:3:\"url\";s:44:\"./index.php?c=profile&a=module-link-uniacid&\";s:15:\"permission_name\";s:18:\"webapp_module_link\";s:4:\"icon\";s:18:\"wi wi-data-synchro\";s:12:\"displayorder\";i:3;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:14:\"webapp_rewrite\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";a:1:{i:0;i:5;}s:10:\"is_display\";i:0;s:5:\"title\";s:9:\"伪静态\";s:3:\"url\";s:31:\"./index.php?c=webapp&a=rewrite&\";s:15:\"permission_name\";s:14:\"webapp_rewrite\";s:4:\"icon\";s:13:\"wi wi-rewrite\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:18:\"webapp_bind_domain\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";a:1:{i:0;i:5;}s:10:\"is_display\";i:0;s:5:\"title\";s:18:\"域名访问设置\";s:3:\"url\";s:35:\"./index.php?c=webapp&a=bind-domain&\";s:15:\"permission_name\";s:18:\"webapp_bind_domain\";s:4:\"icon\";s:17:\"wi wi-bind-domain\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}s:18:\"permission_display\";a:3:{i:0;i:1;i:1;i:3;i:2;i:5;}}s:7:\"publish\";a:3:{s:5:\"title\";s:6:\"发布\";s:4:\"menu\";a:1:{s:15:\"publish_setting\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";a:2:{i:0;i:1;i:1;i:3;}s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"发布设置\";s:3:\"url\";s:32:\"./index.php?c=profile&a=publish&\";s:15:\"permission_name\";s:15:\"publish_setting\";s:4:\"icon\";s:10:\"wi wi-send\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}s:18:\"permission_display\";a:2:{i:0;i:1;i:1;i:3;}}s:10:\"statistics\";a:3:{s:5:\"title\";s:6:\"统计\";s:4:\"menu\";a:2:{s:16:\"statistics_visit\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";a:3:{i:0;i:1;i:1;i:3;i:2;i:5;}s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"访问统计\";s:3:\"url\";s:31:\"./index.php?c=statistics&a=app&\";s:15:\"permission_name\";s:16:\"statistics_visit\";s:4:\"icon\";s:17:\"wi wi-statistical\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";a:3:{s:20:\"statistics_visit_app\";a:4:{s:5:\"title\";s:24:\"app端访问统计信息\";s:3:\"url\";s:42:\"./index.php?c=statistics&a=app&do=display&\";s:15:\"permission_name\";s:20:\"statistics_visit_app\";s:6:\"active\";s:3:\"app\";}s:21:\"statistics_visit_site\";a:4:{s:5:\"title\";s:24:\"所有用户访问统计\";s:3:\"url\";s:51:\"./index.php?c=statistics&a=site&do=current_account&\";s:15:\"permission_name\";s:21:\"statistics_visit_site\";s:6:\"active\";s:4:\"site\";}s:24:\"statistics_visit_setting\";a:4:{s:5:\"title\";s:18:\"访问统计设置\";s:3:\"url\";s:46:\"./index.php?c=statistics&a=setting&do=display&\";s:15:\"permission_name\";s:24:\"statistics_visit_setting\";s:6:\"active\";s:7:\"setting\";}}}s:15:\"statistics_fans\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";a:2:{i:0;i:1;i:1;i:3;}s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"用户统计\";s:3:\"url\";s:32:\"./index.php?c=statistics&a=fans&\";s:15:\"permission_name\";s:15:\"statistics_fans\";s:4:\"icon\";s:17:\"wi wi-statistical\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}s:18:\"permission_display\";a:3:{i:0;i:1;i:1;i:3;i:2;i:5;}}}s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:12:\"displayorder\";i:11;}s:5:\"wxapp\";a:8:{s:5:\"title\";s:15:\"微信小程序\";s:4:\"icon\";s:19:\"wi wi-small-routine\";s:9:\"dimension\";i:3;s:3:\"url\";s:38:\"./index.php?c=wxapp&a=display&do=home&\";s:7:\"section\";a:6:{s:14:\"wxapp_entrance\";a:4:{s:5:\"title\";s:15:\"小程序入口\";s:4:\"menu\";a:1:{s:20:\"module_entrance_link\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";a:3:{i:0;i:4;i:1;i:7;i:2;i:8;}s:10:\"is_display\";i:0;s:5:\"title\";s:12:\"入口页面\";s:3:\"url\";s:36:\"./index.php?c=wxapp&a=entrance-link&\";s:15:\"permission_name\";s:19:\"wxapp_entrance_link\";s:4:\"icon\";s:18:\"wi wi-data-synchro\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}s:18:\"permission_display\";a:3:{i:0;i:4;i:1;i:7;i:2;i:8;}s:10:\"is_display\";i:0;}s:15:\"platform_module\";a:3:{s:5:\"title\";s:6:\"应用\";s:4:\"menu\";a:0:{}s:10:\"is_display\";i:1;}s:2:\"mc\";a:4:{s:5:\"title\";s:6:\"粉丝\";s:4:\"menu\";a:1:{s:9:\"mc_member\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";a:3:{i:0;i:4;i:1;i:7;i:2;i:8;}s:10:\"is_display\";i:0;s:5:\"title\";s:6:\"会员\";s:3:\"url\";s:26:\"./index.php?c=mc&a=member&\";s:15:\"permission_name\";s:15:\"mc_wxapp_member\";s:4:\"icon\";s:10:\"wi wi-fans\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";a:4:{s:17:\"mc_member_diaplsy\";a:4:{s:5:\"title\";s:12:\"会员管理\";s:3:\"url\";s:37:\"./index.php?c=mc&a=member&do=display&\";s:15:\"permission_name\";s:17:\"mc_member_diaplsy\";s:6:\"active\";s:7:\"display\";}s:15:\"mc_member_group\";a:4:{s:5:\"title\";s:9:\"会员组\";s:3:\"url\";s:36:\"./index.php?c=mc&a=group&do=display&\";s:15:\"permission_name\";s:15:\"mc_member_group\";s:6:\"active\";s:7:\"display\";}s:24:\"mc_member_credit_setting\";a:4:{s:5:\"title\";s:12:\"积分设置\";s:3:\"url\";s:44:\"./index.php?c=mc&a=member&do=credit_setting&\";s:15:\"permission_name\";s:24:\"mc_member_credit_setting\";s:6:\"active\";s:14:\"credit_setting\";}s:16:\"mc_member_fields\";a:4:{s:5:\"title\";s:18:\"会员字段管理\";s:3:\"url\";s:34:\"./index.php?c=mc&a=fields&do=list&\";s:15:\"permission_name\";s:16:\"mc_member_fields\";s:6:\"active\";s:4:\"list\";}}}}s:18:\"permission_display\";a:3:{i:0;i:4;i:1;i:7;i:2;i:8;}s:10:\"is_display\";i:0;}s:13:\"wxapp_profile\";a:3:{s:5:\"title\";s:6:\"配置\";s:4:\"menu\";a:4:{s:33:\"wxapp_profile_module_link_uniacid\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";a:7:{i:0;i:4;i:1;i:7;i:2;i:8;i:3;i:6;i:4;i:11;i:5;i:12;i:6;i:13;}s:10:\"is_display\";i:0;s:5:\"title\";s:12:\"数据同步\";s:3:\"url\";s:42:\"./index.php?c=wxapp&a=module-link-uniacid&\";s:15:\"permission_name\";s:33:\"wxapp_profile_module_link_uniacid\";s:4:\"icon\";s:18:\"wi wi-data-synchro\";s:12:\"displayorder\";i:5;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:21:\"wxapp_profile_payment\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";a:3:{i:0;i:4;i:1;i:7;i:2;i:8;}s:10:\"is_display\";i:0;s:5:\"title\";s:12:\"支付参数\";s:3:\"url\";s:30:\"./index.php?c=wxapp&a=payment&\";s:15:\"permission_name\";s:21:\"wxapp_profile_payment\";s:4:\"icon\";s:16:\"wi wi-appsetting\";s:12:\"displayorder\";i:4;s:2:\"id\";N;s:14:\"sub_permission\";a:2:{s:17:\"wxapp_payment_pay\";a:4:{s:5:\"title\";s:12:\"支付参数\";s:3:\"url\";s:41:\"./index.php?c=wxapp&a=payment&do=display&\";s:15:\"permission_name\";s:17:\"wxapp_payment_pay\";s:6:\"active\";s:7:\"payment\";}s:20:\"wxapp_payment_refund\";a:4:{s:5:\"title\";s:12:\"退款配置\";s:3:\"url\";s:40:\"./index.php?c=wxapp&a=refund&do=display&\";s:15:\"permission_name\";s:20:\"wxapp_payment_refund\";s:6:\"active\";s:6:\"refund\";}}}s:23:\"wxapp_profile_domainset\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";a:3:{i:0;i:4;i:1;i:7;i:2;i:8;}s:10:\"is_display\";i:0;s:5:\"title\";s:12:\"域名设置\";s:3:\"url\";s:32:\"./index.php?c=wxapp&a=domainset&\";s:15:\"permission_name\";s:23:\"wxapp_profile_domainset\";s:4:\"icon\";s:13:\"wi wi-examine\";s:12:\"displayorder\";i:3;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:22:\"profile_setting_remote\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";a:7:{i:0;i:4;i:1;i:7;i:2;i:8;i:3;i:6;i:4;i:11;i:5;i:12;i:6;i:13;}s:10:\"is_display\";i:0;s:5:\"title\";s:12:\"参数配置\";s:3:\"url\";s:31:\"./index.php?c=profile&a=remote&\";s:15:\"permission_name\";s:22:\"profile_setting_remote\";s:4:\"icon\";s:23:\"wi wi-parameter-setting\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";N;}}s:18:\"permission_display\";a:7:{i:0;i:4;i:1;i:7;i:2;i:8;i:3;i:6;i:4;i:11;i:5;i:12;i:6;i:13;}}s:7:\"publish\";a:4:{s:5:\"title\";s:6:\"发布\";s:4:\"menu\";a:1:{s:22:\"publish_front_download\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";a:7:{i:0;i:4;i:1;i:7;i:2;i:8;i:3;i:6;i:4;i:11;i:5;i:12;i:6;i:13;}s:10:\"is_display\";i:0;s:5:\"title\";s:12:\"发布设置\";s:3:\"url\";s:37:\"./index.php?c=wxapp&a=front-download&\";s:15:\"permission_name\";s:22:\"publish_front_download\";s:4:\"icon\";s:13:\"wi wi-examine\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}s:18:\"permission_display\";a:7:{i:0;i:4;i:1;i:7;i:2;i:8;i:3;i:6;i:4;i:11;i:5;i:12;i:6;i:13;}s:10:\"is_display\";i:0;}s:10:\"statistics\";a:4:{s:5:\"title\";s:6:\"统计\";s:4:\"menu\";a:2:{s:16:\"statistics_visit\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";a:7:{i:0;i:4;i:1;i:7;i:2;i:8;i:3;i:6;i:4;i:11;i:5;i:12;i:6;i:13;}s:10:\"is_display\";i:0;s:5:\"title\";s:12:\"访问统计\";s:3:\"url\";s:31:\"./index.php?c=statistics&a=app&\";s:15:\"permission_name\";s:22:\"statistics_visit_wxapp\";s:4:\"icon\";s:17:\"wi wi-statistical\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";a:3:{s:20:\"statistics_visit_app\";a:4:{s:5:\"title\";s:24:\"app端访问统计信息\";s:3:\"url\";s:42:\"./index.php?c=statistics&a=app&do=display&\";s:15:\"permission_name\";s:20:\"statistics_visit_app\";s:6:\"active\";s:3:\"app\";}s:21:\"statistics_visit_site\";a:4:{s:5:\"title\";s:24:\"所有用户访问统计\";s:3:\"url\";s:51:\"./index.php?c=statistics&a=site&do=current_account&\";s:15:\"permission_name\";s:21:\"statistics_visit_site\";s:6:\"active\";s:4:\"site\";}s:24:\"statistics_visit_setting\";a:4:{s:5:\"title\";s:18:\"访问统计设置\";s:3:\"url\";s:46:\"./index.php?c=statistics&a=setting&do=display&\";s:15:\"permission_name\";s:24:\"statistics_visit_setting\";s:6:\"active\";s:7:\"setting\";}}}s:15:\"statistics_fans\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";a:3:{i:0;i:4;i:1;i:7;i:2;i:8;}s:10:\"is_display\";i:0;s:5:\"title\";s:12:\"用户统计\";s:3:\"url\";s:33:\"./index.php?c=wxapp&a=statistics&\";s:15:\"permission_name\";s:21:\"statistics_fans_wxapp\";s:4:\"icon\";s:17:\"wi wi-statistical\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}s:18:\"permission_display\";a:7:{i:0;i:4;i:1;i:7;i:2;i:8;i:3;i:6;i:4;i:11;i:5;i:12;i:6;i:13;}s:10:\"is_display\";i:0;}}s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:12:\"displayorder\";i:12;}s:6:\"webapp\";a:7:{s:5:\"title\";s:2:\"PC\";s:4:\"icon\";s:8:\"wi wi-pc\";s:3:\"url\";s:39:\"./index.php?c=webapp&a=home&do=display&\";s:7:\"section\";a:0:{}s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:12:\"displayorder\";i:13;}s:8:\"phoneapp\";a:7:{s:5:\"title\";s:3:\"APP\";s:4:\"icon\";s:18:\"wi wi-white-collar\";s:3:\"url\";s:41:\"./index.php?c=phoneapp&a=display&do=home&\";s:7:\"section\";a:2:{s:15:\"platform_module\";a:3:{s:5:\"title\";s:6:\"应用\";s:4:\"menu\";a:0:{}s:10:\"is_display\";i:1;}s:16:\"phoneapp_profile\";a:4:{s:5:\"title\";s:6:\"配置\";s:4:\"menu\";a:2:{s:28:\"profile_phoneapp_module_link\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";a:1:{i:0;i:6;}s:10:\"is_display\";i:0;s:5:\"title\";s:12:\"数据同步\";s:3:\"url\";s:42:\"./index.php?c=wxapp&a=module-link-uniacid&\";s:15:\"permission_name\";s:28:\"profile_phoneapp_module_link\";s:4:\"icon\";s:18:\"wi wi-data-synchro\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:14:\"front_download\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:9:\"下载APP\";s:3:\"url\";s:40:\"./index.php?c=phoneapp&a=front-download&\";s:15:\"permission_name\";s:23:\"phoneapp_front_download\";s:4:\"icon\";s:13:\"wi wi-examine\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}s:10:\"is_display\";i:1;s:18:\"permission_display\";a:1:{i:0;i:6;}}}s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:12:\"displayorder\";i:14;}s:6:\"aliapp\";a:7:{s:5:\"title\";s:18:\"支付宝小程序\";s:4:\"icon\";s:12:\"wi wi-aliapp\";s:3:\"url\";s:40:\"./index.php?c=miniapp&a=display&do=home&\";s:7:\"section\";a:1:{s:15:\"platform_module\";a:3:{s:5:\"title\";s:6:\"应用\";s:4:\"menu\";a:0:{}s:10:\"is_display\";i:1;}}s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:12:\"displayorder\";i:15;}s:8:\"baiduapp\";a:7:{s:5:\"title\";s:15:\"百度小程序\";s:4:\"icon\";s:14:\"wi wi-baiduapp\";s:3:\"url\";s:40:\"./index.php?c=miniapp&a=display&do=home&\";s:7:\"section\";a:1:{s:15:\"platform_module\";a:3:{s:5:\"title\";s:6:\"应用\";s:4:\"menu\";a:0:{}s:10:\"is_display\";i:1;}}s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:12:\"displayorder\";i:16;}s:10:\"toutiaoapp\";a:7:{s:5:\"title\";s:21:\"字节跳动小程序\";s:4:\"icon\";s:16:\"wi wi-toutiaoapp\";s:3:\"url\";s:40:\"./index.php?c=miniapp&a=display&do=home&\";s:7:\"section\";a:1:{s:15:\"platform_module\";a:3:{s:5:\"title\";s:6:\"应用\";s:4:\"menu\";a:0:{}s:10:\"is_display\";i:1;}}s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:12:\"displayorder\";i:17;}s:5:\"store\";a:7:{s:5:\"title\";s:6:\"商城\";s:4:\"icon\";s:11:\"wi wi-store\";s:3:\"url\";s:53:\"./index.php?c=home&a=welcome&do=ext&module_name=store\";s:7:\"section\";a:7:{s:11:\"store_goods\";a:2:{s:5:\"title\";s:12:\"商品分类\";s:4:\"menu\";a:8:{s:18:\"store_goods_module\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"应用模块\";s:3:\"url\";s:79:\"./index.php?c=site&a=entry&do=goodsbuyer&module_name=store&direct=1&type=module\";s:15:\"permission_name\";s:18:\"store_goods_module\";s:4:\"icon\";s:11:\"wi wi-apply\";s:12:\"displayorder\";i:8;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:19:\"store_goods_account\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"平台个数\";s:3:\"url\";s:84:\"./index.php?c=site&a=entry&do=goodsbuyer&module_name=store&direct=1&type=account_num\";s:15:\"permission_name\";s:19:\"store_goods_account\";s:4:\"icon\";s:13:\"wi wi-account\";s:12:\"displayorder\";i:7;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:25:\"store_goods_account_renew\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"平台续费\";s:3:\"url\";s:78:\"./index.php?c=site&a=entry&do=goodsbuyer&module_name=store&direct=1&type=renew\";s:15:\"permission_name\";s:25:\"store_goods_account_renew\";s:4:\"icon\";s:21:\"wi wi-appjurisdiction\";s:12:\"displayorder\";i:6;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:19:\"store_goods_package\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:15:\"应用权限组\";s:3:\"url\";s:74:\"./index.php?c=site&a=entry&do=goodsbuyer&module_name=store&direct=1&type=5\";s:15:\"permission_name\";s:19:\"store_goods_package\";s:4:\"icon\";s:21:\"wi wi-appjurisdiction\";s:12:\"displayorder\";i:5;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:24:\"store_goods_user_account\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:15:\"账号权限组\";s:3:\"url\";s:75:\"./index.php?c=site&a=entry&do=goodsbuyer&module_name=store&direct=1&type=10\";s:15:\"permission_name\";s:24:\"store_goods_user_account\";s:4:\"icon\";s:21:\"wi wi-appjurisdiction\";s:12:\"displayorder\";i:4;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:22:\"store_goods_user_renew\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:15:\"账号有效期\";s:3:\"url\";s:75:\"./index.php?c=site&a=entry&do=goodsbuyer&module_name=store&direct=1&type=29\";s:15:\"permission_name\";s:22:\"store_goods_user_renew\";s:4:\"icon\";s:21:\"wi wi-appjurisdiction\";s:12:\"displayorder\";i:3;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:25:\"store_goods_users_package\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:15:\"用户权限组\";s:3:\"url\";s:74:\"./index.php?c=site&a=entry&do=goodsbuyer&module_name=store&direct=1&type=9\";s:15:\"permission_name\";s:25:\"store_goods_users_package\";s:4:\"icon\";s:22:\"wi wi-userjurisdiction\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:15:\"store_goods_api\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:23:\"应用访问流量(API)\";s:3:\"url\";s:74:\"./index.php?c=site&a=entry&do=goodsbuyer&module_name=store&direct=1&type=6\";s:15:\"permission_name\";s:15:\"store_goods_api\";s:4:\"icon\";s:9:\"wi wi-api\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}}s:16:\"store_wish_goods\";a:2:{s:5:\"title\";s:12:\"预购应用\";s:4:\"menu\";a:2:{s:21:\"store_wish_goods_list\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"应用列表\";s:3:\"url\";s:94:\"./index.php?c=site&a=entry&do=goodsbuyer&module_name=store&direct=1&type=module_wish&is_wish=1\";s:15:\"permission_name\";s:21:\"store_wish_goods_list\";s:4:\"icon\";s:11:\"wi wi-apply\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:21:\"store_wish_goods_edit\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:19:\"添加/设置应用\";s:3:\"url\";s:92:\"./index.php?c=site&a=entry&do=wishgoodsEdit&module_name=store&direct=1&op=wishgoods&status=1\";s:15:\"permission_name\";s:21:\"store_wish_goods_edit\";s:4:\"icon\";s:15:\"wi wi-goods-add\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}}s:12:\"store_manage\";a:3:{s:5:\"title\";s:12:\"商城管理\";s:7:\"founder\";b:1;s:4:\"menu\";a:4:{s:18:\"store_manage_goods\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"添加商品\";s:3:\"url\";s:68:\"./index.php?c=site&a=entry&do=goodsSeller&module_name=store&direct=1\";s:15:\"permission_name\";s:18:\"store_manage_goods\";s:4:\"icon\";s:15:\"wi wi-goods-add\";s:12:\"displayorder\";i:4;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:20:\"store_manage_setting\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"商城设置\";s:3:\"url\";s:64:\"./index.php?c=site&a=entry&do=setting&module_name=store&direct=1\";s:15:\"permission_name\";s:20:\"store_manage_setting\";s:4:\"icon\";s:11:\"wi wi-store\";s:12:\"displayorder\";i:3;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:19:\"store_manage_payset\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"支付设置\";s:3:\"url\";s:67:\"./index.php?c=site&a=entry&do=paySetting&module_name=store&direct=1\";s:15:\"permission_name\";s:19:\"store_manage_payset\";s:4:\"icon\";s:11:\"wi wi-money\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:23:\"store_manage_permission\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:18:\"商城访问权限\";s:3:\"url\";s:67:\"./index.php?c=site&a=entry&do=permission&module_name=store&direct=1\";s:15:\"permission_name\";s:23:\"store_manage_permission\";s:4:\"icon\";s:15:\"wi wi-blacklist\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}}s:12:\"store_orders\";a:2:{s:5:\"title\";s:12:\"订单管理\";s:4:\"menu\";a:2:{s:15:\"store_orders_my\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"我的订单\";s:3:\"url\";s:63:\"./index.php?c=site&a=entry&do=orders&module_name=store&direct=1\";s:15:\"permission_name\";s:15:\"store_orders_my\";s:4:\"icon\";s:17:\"wi wi-sale-record\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:17:\"store_cash_orders\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"分销订单\";s:3:\"url\";s:81:\"./index.php?c=site&a=entry&do=cash&module_name=store&operate=cash_orders&direct=1\";s:15:\"permission_name\";s:17:\"store_cash_orders\";s:4:\"icon\";s:11:\"wi wi-order\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}}s:14:\"store_payments\";a:3:{s:5:\"title\";s:12:\"收入明细\";s:7:\"founder\";b:1;s:4:\"menu\";a:1:{s:8:\"payments\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"收入明细\";s:3:\"url\";s:65:\"./index.php?c=site&a=entry&do=payments&module_name=store&direct=1\";s:15:\"permission_name\";s:8:\"payments\";s:4:\"icon\";s:17:\"wi wi-sale-record\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}}s:17:\"store_cash_manage\";a:3:{s:5:\"title\";s:12:\"分销管理\";s:7:\"founder\";b:1;s:4:\"menu\";a:2:{s:25:\"store_manage_cash_setting\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"分销设置\";s:3:\"url\";s:68:\"./index.php?c=site&a=entry&do=cashsetting&module_name=store&direct=1\";s:15:\"permission_name\";s:25:\"store_manage_cash_setting\";s:4:\"icon\";s:18:\"wi wi-site-setting\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:16:\"store_check_cash\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"提现审核\";s:3:\"url\";s:83:\"./index.php?c=site&a=entry&do=cash&module_name=store&operate=consume_order&direct=1\";s:15:\"permission_name\";s:16:\"store_check_cash\";s:4:\"icon\";s:18:\"wi wi-check-select\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}}s:10:\"store_cash\";a:3:{s:5:\"title\";s:12:\"佣金管理\";s:12:\"vice_founder\";b:1;s:4:\"menu\";a:1:{s:8:\"payments\";a:10:{s:9:\"is_system\";i:1;s:18:\"permission_display\";N;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"我的佣金\";s:3:\"url\";s:76:\"./index.php?c=site&a=entry&do=cash&module_name=store&operate=mycash&direct=1\";s:15:\"permission_name\";s:8:\"payments\";s:4:\"icon\";s:10:\"wi wi-list\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}}}s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:12:\"displayorder\";i:18;}}'),('we7:unimodules:1','a:1:{i:0;s:5:\"vp_ph\";}'),('we7:memberinfo:9','a:54:{s:3:\"uid\";s:1:\"9\";s:7:\"uniacid\";s:1:\"1\";s:6:\"mobile\";s:0:\"\";s:5:\"email\";s:39:\"df28223c29bbc4dd6ff964a3512906e8@we7.cc\";s:8:\"password\";s:32:\"17a10411a796d2262f72e7dfb29835fd\";s:4:\"salt\";s:8:\"P8AwZow8\";s:7:\"groupid\";s:1:\"1\";s:7:\"credit1\";d:0;s:7:\"credit2\";d:0;s:7:\"credit3\";d:0;s:7:\"credit4\";d:0;s:7:\"credit5\";d:0;s:7:\"credit6\";d:0;s:10:\"createtime\";s:10:\"1650288764\";s:8:\"realname\";s:0:\"\";s:8:\"nickname\";s:6:\"Tears.\";s:6:\"avatar\";s:129:\"https://thirdwx.qlogo.cn/mmopen/vi_32/5N34zfvABTR4utTHYhHic1xG29knNmyAjwtoxpA0ZhpqW3s2H6Bm5E9t1FLAdVx3FnYLYnCJRZmAKuTgQ4oJldg/132\";s:2:\"qq\";s:0:\"\";s:3:\"vip\";s:1:\"0\";s:6:\"gender\";s:1:\"0\";s:9:\"birthyear\";s:1:\"0\";s:10:\"birthmonth\";s:1:\"0\";s:8:\"birthday\";s:1:\"0\";s:13:\"constellation\";s:0:\"\";s:6:\"zodiac\";s:0:\"\";s:9:\"telephone\";s:0:\"\";s:6:\"idcard\";s:0:\"\";s:9:\"studentid\";s:0:\"\";s:5:\"grade\";s:0:\"\";s:7:\"address\";s:0:\"\";s:7:\"zipcode\";s:0:\"\";s:11:\"nationality\";s:0:\"\";s:14:\"resideprovince\";s:3:\"省\";s:10:\"residecity\";s:3:\"市\";s:10:\"residedist\";s:0:\"\";s:14:\"graduateschool\";s:0:\"\";s:7:\"company\";s:0:\"\";s:9:\"education\";s:0:\"\";s:10:\"occupation\";s:0:\"\";s:8:\"position\";s:0:\"\";s:7:\"revenue\";s:0:\"\";s:15:\"affectivestatus\";s:0:\"\";s:10:\"lookingfor\";s:0:\"\";s:9:\"bloodtype\";s:0:\"\";s:6:\"height\";s:0:\"\";s:6:\"weight\";s:0:\"\";s:6:\"alipay\";s:0:\"\";s:3:\"msn\";s:0:\"\";s:6:\"taobao\";s:0:\"\";s:4:\"site\";s:0:\"\";s:3:\"bio\";s:0:\"\";s:8:\"interest\";s:0:\"\";s:12:\"pay_password\";s:0:\"\";s:9:\"user_from\";s:1:\"0\";}'),('we7:stat_todaylock:1','a:1:{s:6:\"expire\";i:1650199527;}'),('we7:module_info:basic','a:39:{s:3:\"mid\";s:1:\"1\";s:4:\"name\";s:5:\"basic\";s:16:\"application_type\";s:1:\"0\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:18:\"基本文字回复\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:24:\"和您进行简单对话\";s:11:\"description\";s:201:\"一问一答得简单对话. 当访客的对话语句中包含指定关键字, 或对话语句完全等于特定关键字, 或符合某些特定的格式时. 系统自动应答设定好的回复内容.\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:13:\"title_initial\";s:0:\"\";s:13:\"wxapp_support\";s:1:\"1\";s:15:\"welcome_support\";s:1:\"1\";s:10:\"oauth_type\";s:1:\"1\";s:14:\"webapp_support\";s:1:\"1\";s:16:\"phoneapp_support\";s:1:\"1\";s:15:\"account_support\";s:1:\"2\";s:13:\"xzapp_support\";s:1:\"1\";s:14:\"aliapp_support\";s:1:\"1\";s:4:\"logo\";s:0:\"\";s:16:\"baiduapp_support\";s:1:\"1\";s:18:\"toutiaoapp_support\";s:1:\"1\";s:4:\"from\";s:0:\"\";s:12:\"cloud_record\";s:1:\"0\";s:8:\"sections\";s:1:\"0\";s:5:\"label\";s:0:\"\";s:6:\"status\";s:1:\"0\";s:9:\"isdisplay\";i:1;s:7:\"preview\";s:59:\"http://cpdd.zmwym.com/addons/basic/preview.jpg?v=1650191885\";s:11:\"main_module\";b:0;s:12:\"recycle_info\";a:0:{}}'),('we7:module_setting:basic:1','a:1:{s:6:\"module\";s:5:\"basic\";}'),('we7:module_info:news','a:39:{s:3:\"mid\";s:1:\"2\";s:4:\"name\";s:4:\"news\";s:16:\"application_type\";s:1:\"0\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:24:\"基本混合图文回复\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:33:\"为你提供生动的图文资讯\";s:11:\"description\";s:272:\"一问一答得简单对话, 但是回复内容包括图片文字等更生动的媒体内容. 当访客的对话语句中包含指定关键字, 或对话语句完全等于特定关键字, 或符合某些特定的格式时. 系统自动应答设定好的图文回复内容.\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:13:\"title_initial\";s:0:\"\";s:13:\"wxapp_support\";s:1:\"1\";s:15:\"welcome_support\";s:1:\"1\";s:10:\"oauth_type\";s:1:\"1\";s:14:\"webapp_support\";s:1:\"1\";s:16:\"phoneapp_support\";s:1:\"1\";s:15:\"account_support\";s:1:\"2\";s:13:\"xzapp_support\";s:1:\"1\";s:14:\"aliapp_support\";s:1:\"1\";s:4:\"logo\";s:0:\"\";s:16:\"baiduapp_support\";s:1:\"1\";s:18:\"toutiaoapp_support\";s:1:\"1\";s:4:\"from\";s:0:\"\";s:12:\"cloud_record\";s:1:\"0\";s:8:\"sections\";s:1:\"0\";s:5:\"label\";s:0:\"\";s:6:\"status\";s:1:\"0\";s:9:\"isdisplay\";i:1;s:7:\"preview\";s:58:\"http://cpdd.zmwym.com/addons/news/preview.jpg?v=1650191885\";s:11:\"main_module\";b:0;s:12:\"recycle_info\";a:0:{}}'),('we7:module_setting:news:1','a:1:{s:6:\"module\";s:4:\"news\";}'),('we7:module_info:music','a:39:{s:3:\"mid\";s:1:\"3\";s:4:\"name\";s:5:\"music\";s:16:\"application_type\";s:1:\"0\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:18:\"基本音乐回复\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:39:\"提供语音、音乐等音频类回复\";s:11:\"description\";s:183:\"在回复规则中可选择具有语音、音乐等音频类的回复内容，并根据用户所设置的特定关键字精准的返回给粉丝，实现一问一答得简单对话。\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:13:\"title_initial\";s:0:\"\";s:13:\"wxapp_support\";s:1:\"1\";s:15:\"welcome_support\";s:1:\"1\";s:10:\"oauth_type\";s:1:\"1\";s:14:\"webapp_support\";s:1:\"1\";s:16:\"phoneapp_support\";s:1:\"1\";s:15:\"account_support\";s:1:\"2\";s:13:\"xzapp_support\";s:1:\"1\";s:14:\"aliapp_support\";s:1:\"1\";s:4:\"logo\";s:0:\"\";s:16:\"baiduapp_support\";s:1:\"1\";s:18:\"toutiaoapp_support\";s:1:\"1\";s:4:\"from\";s:0:\"\";s:12:\"cloud_record\";s:1:\"0\";s:8:\"sections\";s:1:\"0\";s:5:\"label\";s:0:\"\";s:6:\"status\";s:1:\"0\";s:9:\"isdisplay\";i:1;s:7:\"preview\";s:59:\"http://cpdd.zmwym.com/addons/music/preview.jpg?v=1650191885\";s:11:\"main_module\";b:0;s:12:\"recycle_info\";a:0:{}}'),('we7:module_setting:music:1','a:1:{s:6:\"module\";s:5:\"music\";}'),('we7:module_info:userapi','a:39:{s:3:\"mid\";s:1:\"4\";s:4:\"name\";s:7:\"userapi\";s:16:\"application_type\";s:1:\"0\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:21:\"自定义接口回复\";s:7:\"version\";s:3:\"1.1\";s:7:\"ability\";s:33:\"更方便的第三方接口设置\";s:11:\"description\";s:147:\"自定义接口又称第三方接口，可以让开发者更方便的接入微信魔方系统，高效的与微信公众平台进行对接整合。\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:13:\"title_initial\";s:0:\"\";s:13:\"wxapp_support\";s:1:\"1\";s:15:\"welcome_support\";s:1:\"1\";s:10:\"oauth_type\";s:1:\"1\";s:14:\"webapp_support\";s:1:\"1\";s:16:\"phoneapp_support\";s:1:\"1\";s:15:\"account_support\";s:1:\"2\";s:13:\"xzapp_support\";s:1:\"1\";s:14:\"aliapp_support\";s:1:\"1\";s:4:\"logo\";s:0:\"\";s:16:\"baiduapp_support\";s:1:\"1\";s:18:\"toutiaoapp_support\";s:1:\"1\";s:4:\"from\";s:0:\"\";s:12:\"cloud_record\";s:1:\"0\";s:8:\"sections\";s:1:\"0\";s:5:\"label\";s:0:\"\";s:6:\"status\";s:1:\"0\";s:9:\"isdisplay\";i:1;s:7:\"preview\";s:61:\"http://cpdd.zmwym.com/addons/userapi/preview.jpg?v=1650191885\";s:11:\"main_module\";b:0;s:12:\"recycle_info\";a:0:{}}'),('we7:module_setting:userapi:1','a:1:{s:6:\"module\";s:7:\"userapi\";}'),('we7:module_info:recharge','a:39:{s:3:\"mid\";s:1:\"5\";s:4:\"name\";s:8:\"recharge\";s:16:\"application_type\";s:1:\"0\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:24:\"会员中心充值模块\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:24:\"提供会员充值功能\";s:11:\"description\";s:0:\"\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"0\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:13:\"title_initial\";s:0:\"\";s:13:\"wxapp_support\";s:1:\"1\";s:15:\"welcome_support\";s:1:\"1\";s:10:\"oauth_type\";s:1:\"1\";s:14:\"webapp_support\";s:1:\"1\";s:16:\"phoneapp_support\";s:1:\"1\";s:15:\"account_support\";s:1:\"2\";s:13:\"xzapp_support\";s:1:\"1\";s:14:\"aliapp_support\";s:1:\"1\";s:4:\"logo\";s:0:\"\";s:16:\"baiduapp_support\";s:1:\"1\";s:18:\"toutiaoapp_support\";s:1:\"1\";s:4:\"from\";s:0:\"\";s:12:\"cloud_record\";s:1:\"0\";s:8:\"sections\";s:1:\"0\";s:5:\"label\";s:0:\"\";s:6:\"status\";s:1:\"0\";s:9:\"isdisplay\";i:1;s:7:\"preview\";s:62:\"http://cpdd.zmwym.com/addons/recharge/preview.jpg?v=1650191885\";s:11:\"main_module\";b:0;s:12:\"recycle_info\";a:0:{}}'),('we7:module_setting:recharge:1','a:1:{s:6:\"module\";s:8:\"recharge\";}'),('we7:module_info:images','a:39:{s:3:\"mid\";s:1:\"7\";s:4:\"name\";s:6:\"images\";s:16:\"application_type\";s:1:\"0\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:18:\"基本图片回复\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:18:\"提供图片回复\";s:11:\"description\";s:132:\"在回复规则中可选择具有图片的回复内容，并根据用户所设置的特定关键字精准的返回给粉丝图片。\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:13:\"title_initial\";s:0:\"\";s:13:\"wxapp_support\";s:1:\"1\";s:15:\"welcome_support\";s:1:\"1\";s:10:\"oauth_type\";s:1:\"1\";s:14:\"webapp_support\";s:1:\"1\";s:16:\"phoneapp_support\";s:1:\"1\";s:15:\"account_support\";s:1:\"2\";s:13:\"xzapp_support\";s:1:\"1\";s:14:\"aliapp_support\";s:1:\"1\";s:4:\"logo\";s:0:\"\";s:16:\"baiduapp_support\";s:1:\"1\";s:18:\"toutiaoapp_support\";s:1:\"1\";s:4:\"from\";s:0:\"\";s:12:\"cloud_record\";s:1:\"0\";s:8:\"sections\";s:1:\"0\";s:5:\"label\";s:0:\"\";s:6:\"status\";s:1:\"0\";s:9:\"isdisplay\";i:1;s:7:\"preview\";s:60:\"http://cpdd.zmwym.com/addons/images/preview.jpg?v=1650191885\";s:11:\"main_module\";b:0;s:12:\"recycle_info\";a:0:{}}'),('we7:module_setting:images:1','a:1:{s:6:\"module\";s:6:\"images\";}'),('we7:module_info:video','a:39:{s:3:\"mid\";s:1:\"8\";s:4:\"name\";s:5:\"video\";s:16:\"application_type\";s:1:\"0\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:18:\"基本视频回复\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:18:\"提供图片回复\";s:11:\"description\";s:132:\"在回复规则中可选择具有视频的回复内容，并根据用户所设置的特定关键字精准的返回给粉丝视频。\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:13:\"title_initial\";s:0:\"\";s:13:\"wxapp_support\";s:1:\"1\";s:15:\"welcome_support\";s:1:\"1\";s:10:\"oauth_type\";s:1:\"1\";s:14:\"webapp_support\";s:1:\"1\";s:16:\"phoneapp_support\";s:1:\"1\";s:15:\"account_support\";s:1:\"2\";s:13:\"xzapp_support\";s:1:\"1\";s:14:\"aliapp_support\";s:1:\"1\";s:4:\"logo\";s:0:\"\";s:16:\"baiduapp_support\";s:1:\"1\";s:18:\"toutiaoapp_support\";s:1:\"1\";s:4:\"from\";s:0:\"\";s:12:\"cloud_record\";s:1:\"0\";s:8:\"sections\";s:1:\"0\";s:5:\"label\";s:0:\"\";s:6:\"status\";s:1:\"0\";s:9:\"isdisplay\";i:1;s:7:\"preview\";s:59:\"http://cpdd.zmwym.com/addons/video/preview.jpg?v=1650191885\";s:11:\"main_module\";b:0;s:12:\"recycle_info\";a:0:{}}'),('we7:module_setting:video:1','a:1:{s:6:\"module\";s:5:\"video\";}'),('we7:module_info:voice','a:39:{s:3:\"mid\";s:1:\"9\";s:4:\"name\";s:5:\"voice\";s:16:\"application_type\";s:1:\"0\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:18:\"基本语音回复\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:18:\"提供语音回复\";s:11:\"description\";s:132:\"在回复规则中可选择具有语音的回复内容，并根据用户所设置的特定关键字精准的返回给粉丝语音。\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:13:\"title_initial\";s:0:\"\";s:13:\"wxapp_support\";s:1:\"1\";s:15:\"welcome_support\";s:1:\"1\";s:10:\"oauth_type\";s:1:\"1\";s:14:\"webapp_support\";s:1:\"1\";s:16:\"phoneapp_support\";s:1:\"1\";s:15:\"account_support\";s:1:\"2\";s:13:\"xzapp_support\";s:1:\"1\";s:14:\"aliapp_support\";s:1:\"1\";s:4:\"logo\";s:0:\"\";s:16:\"baiduapp_support\";s:1:\"1\";s:18:\"toutiaoapp_support\";s:1:\"1\";s:4:\"from\";s:0:\"\";s:12:\"cloud_record\";s:1:\"0\";s:8:\"sections\";s:1:\"0\";s:5:\"label\";s:0:\"\";s:6:\"status\";s:1:\"0\";s:9:\"isdisplay\";i:1;s:7:\"preview\";s:59:\"http://cpdd.zmwym.com/addons/voice/preview.jpg?v=1650191885\";s:11:\"main_module\";b:0;s:12:\"recycle_info\";a:0:{}}'),('we7:module_setting:voice:1','a:1:{s:6:\"module\";s:5:\"voice\";}'),('we7:module_info:wxcard','a:39:{s:3:\"mid\";s:2:\"11\";s:4:\"name\";s:6:\"wxcard\";s:16:\"application_type\";s:1:\"0\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:18:\"微信卡券回复\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:18:\"微信卡券回复\";s:11:\"description\";s:18:\"微信卡券回复\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:13:\"title_initial\";s:0:\"\";s:13:\"wxapp_support\";s:1:\"1\";s:15:\"welcome_support\";s:1:\"1\";s:10:\"oauth_type\";s:1:\"1\";s:14:\"webapp_support\";s:1:\"1\";s:16:\"phoneapp_support\";s:1:\"1\";s:15:\"account_support\";s:1:\"2\";s:13:\"xzapp_support\";s:1:\"1\";s:14:\"aliapp_support\";s:1:\"1\";s:4:\"logo\";s:0:\"\";s:16:\"baiduapp_support\";s:1:\"1\";s:18:\"toutiaoapp_support\";s:1:\"1\";s:4:\"from\";s:0:\"\";s:12:\"cloud_record\";s:1:\"0\";s:8:\"sections\";s:1:\"0\";s:5:\"label\";s:0:\"\";s:6:\"status\";s:1:\"0\";s:9:\"isdisplay\";i:1;s:7:\"preview\";s:60:\"http://cpdd.zmwym.com/addons/wxcard/preview.jpg?v=1650191885\";s:11:\"main_module\";b:0;s:12:\"recycle_info\";a:0:{}}'),('we7:module_setting:wxcard:1','a:1:{s:6:\"module\";s:6:\"wxcard\";}'),('we7:module_info:custom','a:39:{s:3:\"mid\";s:1:\"6\";s:4:\"name\";s:6:\"custom\";s:16:\"application_type\";s:1:\"0\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:15:\"多客服转接\";s:7:\"version\";s:5:\"1.0.0\";s:7:\"ability\";s:36:\"用来接入腾讯的多客服系统\";s:11:\"description\";s:0:\"\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:17:\"http://bbs.we7.cc\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";a:0:{}s:7:\"handles\";a:6:{i:0;s:5:\"image\";i:1;s:5:\"voice\";i:2;s:5:\"video\";i:3;s:8:\"location\";i:4;s:4:\"link\";i:5;s:4:\"text\";}s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:13:\"title_initial\";s:0:\"\";s:13:\"wxapp_support\";s:1:\"1\";s:15:\"welcome_support\";s:1:\"1\";s:10:\"oauth_type\";s:1:\"1\";s:14:\"webapp_support\";s:1:\"1\";s:16:\"phoneapp_support\";s:1:\"1\";s:15:\"account_support\";s:1:\"2\";s:13:\"xzapp_support\";s:1:\"1\";s:14:\"aliapp_support\";s:1:\"1\";s:4:\"logo\";s:0:\"\";s:16:\"baiduapp_support\";s:1:\"1\";s:18:\"toutiaoapp_support\";s:1:\"1\";s:4:\"from\";s:0:\"\";s:12:\"cloud_record\";s:1:\"0\";s:8:\"sections\";s:1:\"0\";s:5:\"label\";s:0:\"\";s:6:\"status\";s:1:\"0\";s:9:\"isdisplay\";i:1;s:7:\"preview\";s:60:\"http://cpdd.zmwym.com/addons/custom/preview.jpg?v=1650191885\";s:11:\"main_module\";b:0;s:12:\"recycle_info\";a:0:{}}'),('we7:module_setting:custom:1','a:1:{s:6:\"module\";s:6:\"custom\";}'),('we7:module_info:chats','a:39:{s:3:\"mid\";s:2:\"10\";s:4:\"name\";s:5:\"chats\";s:16:\"application_type\";s:1:\"0\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:18:\"发送客服消息\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:77:\"公众号可以在粉丝最后发送消息的48小时内无限制发送消息\";s:11:\"description\";s:0:\"\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"0\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:13:\"title_initial\";s:0:\"\";s:13:\"wxapp_support\";s:1:\"1\";s:15:\"welcome_support\";s:1:\"1\";s:10:\"oauth_type\";s:1:\"1\";s:14:\"webapp_support\";s:1:\"1\";s:16:\"phoneapp_support\";s:1:\"1\";s:15:\"account_support\";s:1:\"2\";s:13:\"xzapp_support\";s:1:\"1\";s:14:\"aliapp_support\";s:1:\"1\";s:4:\"logo\";s:0:\"\";s:16:\"baiduapp_support\";s:1:\"1\";s:18:\"toutiaoapp_support\";s:1:\"1\";s:4:\"from\";s:0:\"\";s:12:\"cloud_record\";s:1:\"0\";s:8:\"sections\";s:1:\"0\";s:5:\"label\";s:0:\"\";s:6:\"status\";s:1:\"0\";s:9:\"isdisplay\";i:1;s:7:\"preview\";s:59:\"http://cpdd.zmwym.com/addons/chats/preview.jpg?v=1650191885\";s:11:\"main_module\";b:0;s:12:\"recycle_info\";a:0:{}}'),('we7:module_setting:chats:1','a:1:{s:6:\"module\";s:5:\"chats\";}'),('we7:module_info:store','a:39:{s:3:\"mid\";s:2:\"12\";s:4:\"name\";s:5:\"store\";s:16:\"application_type\";s:1:\"0\";s:4:\"type\";s:8:\"business\";s:5:\"title\";s:12:\"站内商城\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:12:\"站内商城\";s:11:\"description\";s:12:\"站内商城\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"0\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:13:\"title_initial\";s:0:\"\";s:13:\"wxapp_support\";s:1:\"1\";s:15:\"welcome_support\";s:1:\"1\";s:10:\"oauth_type\";s:1:\"1\";s:14:\"webapp_support\";s:1:\"1\";s:16:\"phoneapp_support\";s:1:\"1\";s:15:\"account_support\";s:1:\"2\";s:13:\"xzapp_support\";s:1:\"1\";s:14:\"aliapp_support\";s:1:\"1\";s:4:\"logo\";s:0:\"\";s:16:\"baiduapp_support\";s:1:\"1\";s:18:\"toutiaoapp_support\";s:1:\"1\";s:4:\"from\";s:0:\"\";s:12:\"cloud_record\";s:1:\"0\";s:8:\"sections\";s:1:\"0\";s:5:\"label\";s:0:\"\";s:6:\"status\";s:1:\"0\";s:9:\"isdisplay\";i:1;s:7:\"preview\";s:59:\"http://cpdd.zmwym.com/addons/store/preview.jpg?v=1650191885\";s:11:\"main_module\";b:0;s:12:\"recycle_info\";a:0:{}}'),('we7:module_setting:store:1','a:1:{s:6:\"module\";s:5:\"store\";}'),('we7:memberinfo:7','a:54:{s:3:\"uid\";s:1:\"7\";s:7:\"uniacid\";s:1:\"1\";s:6:\"mobile\";s:0:\"\";s:5:\"email\";s:39:\"04cad8a4cf90a0ba738d4d0d19562ab7@we7.cc\";s:8:\"password\";s:32:\"17a10411a796d2262f72e7dfb29835fd\";s:4:\"salt\";s:8:\"ywz746d6\";s:7:\"groupid\";s:1:\"1\";s:7:\"credit1\";d:0;s:7:\"credit2\";d:0;s:7:\"credit3\";d:0;s:7:\"credit4\";d:0;s:7:\"credit5\";d:0;s:7:\"credit6\";d:0;s:10:\"createtime\";s:10:\"1650202210\";s:8:\"realname\";s:0:\"\";s:8:\"nickname\";s:6:\"高志\";s:6:\"avatar\";s:133:\"https://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIYib4d64QBTQxjoyTicQZFhyCicZcdpCFVibpScgwOautsypiaCeem4McdlG0zsOjmxFhpTIxPbz37I2Q/132\";s:2:\"qq\";s:0:\"\";s:3:\"vip\";s:1:\"0\";s:6:\"gender\";s:1:\"0\";s:9:\"birthyear\";s:1:\"0\";s:10:\"birthmonth\";s:1:\"0\";s:8:\"birthday\";s:1:\"0\";s:13:\"constellation\";s:0:\"\";s:6:\"zodiac\";s:0:\"\";s:9:\"telephone\";s:0:\"\";s:6:\"idcard\";s:0:\"\";s:9:\"studentid\";s:0:\"\";s:5:\"grade\";s:0:\"\";s:7:\"address\";s:0:\"\";s:7:\"zipcode\";s:0:\"\";s:11:\"nationality\";s:0:\"\";s:14:\"resideprovince\";s:3:\"省\";s:10:\"residecity\";s:3:\"市\";s:10:\"residedist\";s:0:\"\";s:14:\"graduateschool\";s:0:\"\";s:7:\"company\";s:0:\"\";s:9:\"education\";s:0:\"\";s:10:\"occupation\";s:0:\"\";s:8:\"position\";s:0:\"\";s:7:\"revenue\";s:0:\"\";s:15:\"affectivestatus\";s:0:\"\";s:10:\"lookingfor\";s:0:\"\";s:9:\"bloodtype\";s:0:\"\";s:6:\"height\";s:0:\"\";s:6:\"weight\";s:0:\"\";s:6:\"alipay\";s:0:\"\";s:3:\"msn\";s:0:\"\";s:6:\"taobao\";s:0:\"\";s:4:\"site\";s:0:\"\";s:3:\"bio\";s:0:\"\";s:8:\"interest\";s:0:\"\";s:12:\"pay_password\";s:0:\"\";s:9:\"user_from\";s:1:\"0\";}'),('we7:delete_visit_ip:20220416','b:1;'),('we7:uniaccount:1','a:21:{s:4:\"acid\";s:1:\"1\";s:7:\"uniacid\";s:1:\"1\";s:5:\"token\";s:32:\"omJNpZEhZeHj1ZxFECKkP48B5VFbk1HP\";s:14:\"encodingaeskey\";s:43:\"rWUA5pUj5Zw30YSqy0ivdSfJom0Rv8XCtr641mC5K1m\";s:5:\"level\";s:1:\"4\";s:4:\"name\";s:7:\"we7team\";s:7:\"account\";s:0:\"\";s:8:\"original\";s:0:\"\";s:9:\"signature\";s:0:\"\";s:7:\"country\";s:0:\"\";s:8:\"province\";s:0:\"\";s:4:\"city\";s:0:\"\";s:8:\"username\";s:0:\"\";s:8:\"password\";s:0:\"\";s:10:\"lastupdate\";s:1:\"0\";s:3:\"key\";s:18:\"wx5e9120ecd1abc1b0\";s:6:\"secret\";s:32:\"c79967bfa81fb168690e3e5fe7223785\";s:7:\"styleid\";s:1:\"1\";s:12:\"subscribeurl\";s:0:\"\";s:18:\"auth_refresh_token\";s:0:\"\";s:11:\"encrypt_key\";s:18:\"wx5e9120ecd1abc1b0\";}'),('we7:userbasefields','a:46:{s:7:\"uniacid\";s:17:\"同一公众号id\";s:7:\"groupid\";s:8:\"分组id\";s:7:\"credit1\";s:6:\"积分\";s:7:\"credit2\";s:6:\"余额\";s:7:\"credit3\";s:19:\"预留积分类型3\";s:7:\"credit4\";s:19:\"预留积分类型4\";s:7:\"credit5\";s:19:\"预留积分类型5\";s:7:\"credit6\";s:19:\"预留积分类型6\";s:10:\"createtime\";s:12:\"加入时间\";s:6:\"mobile\";s:12:\"手机号码\";s:5:\"email\";s:12:\"电子邮箱\";s:8:\"realname\";s:12:\"真实姓名\";s:8:\"nickname\";s:6:\"昵称\";s:6:\"avatar\";s:6:\"头像\";s:2:\"qq\";s:5:\"QQ号\";s:6:\"gender\";s:6:\"性别\";s:5:\"birth\";s:6:\"生日\";s:13:\"constellation\";s:6:\"星座\";s:6:\"zodiac\";s:6:\"生肖\";s:9:\"telephone\";s:12:\"固定电话\";s:6:\"idcard\";s:12:\"证件号码\";s:9:\"studentid\";s:6:\"学号\";s:5:\"grade\";s:6:\"班级\";s:7:\"address\";s:6:\"地址\";s:7:\"zipcode\";s:6:\"邮编\";s:11:\"nationality\";s:6:\"国籍\";s:6:\"reside\";s:9:\"居住地\";s:14:\"graduateschool\";s:12:\"毕业学校\";s:7:\"company\";s:6:\"公司\";s:9:\"education\";s:6:\"学历\";s:10:\"occupation\";s:6:\"职业\";s:8:\"position\";s:6:\"职位\";s:7:\"revenue\";s:9:\"年收入\";s:15:\"affectivestatus\";s:12:\"情感状态\";s:10:\"lookingfor\";s:13:\" 交友目的\";s:9:\"bloodtype\";s:6:\"血型\";s:6:\"height\";s:6:\"身高\";s:6:\"weight\";s:6:\"体重\";s:6:\"alipay\";s:15:\"支付宝帐号\";s:3:\"msn\";s:3:\"MSN\";s:6:\"taobao\";s:12:\"阿里旺旺\";s:4:\"site\";s:6:\"主页\";s:3:\"bio\";s:12:\"自我介绍\";s:8:\"interest\";s:12:\"兴趣爱好\";s:8:\"password\";s:6:\"密码\";s:12:\"pay_password\";s:12:\"支付密码\";}'),('we7:usersfields','a:47:{s:8:\"realname\";s:12:\"真实姓名\";s:8:\"nickname\";s:6:\"昵称\";s:6:\"avatar\";s:6:\"头像\";s:2:\"qq\";s:5:\"QQ号\";s:6:\"mobile\";s:12:\"手机号码\";s:3:\"vip\";s:9:\"VIP级别\";s:6:\"gender\";s:6:\"性别\";s:9:\"birthyear\";s:12:\"出生生日\";s:13:\"constellation\";s:6:\"星座\";s:6:\"zodiac\";s:6:\"生肖\";s:9:\"telephone\";s:12:\"固定电话\";s:6:\"idcard\";s:12:\"证件号码\";s:9:\"studentid\";s:6:\"学号\";s:5:\"grade\";s:6:\"班级\";s:7:\"address\";s:12:\"邮寄地址\";s:7:\"zipcode\";s:6:\"邮编\";s:11:\"nationality\";s:6:\"国籍\";s:14:\"resideprovince\";s:12:\"居住地址\";s:14:\"graduateschool\";s:12:\"毕业学校\";s:7:\"company\";s:6:\"公司\";s:9:\"education\";s:6:\"学历\";s:10:\"occupation\";s:6:\"职业\";s:8:\"position\";s:6:\"职位\";s:7:\"revenue\";s:9:\"年收入\";s:15:\"affectivestatus\";s:12:\"情感状态\";s:10:\"lookingfor\";s:13:\" 交友目的\";s:9:\"bloodtype\";s:6:\"血型\";s:6:\"height\";s:6:\"身高\";s:6:\"weight\";s:6:\"体重\";s:6:\"alipay\";s:15:\"支付宝帐号\";s:3:\"msn\";s:3:\"MSN\";s:5:\"email\";s:12:\"电子邮箱\";s:6:\"taobao\";s:12:\"阿里旺旺\";s:4:\"site\";s:6:\"主页\";s:3:\"bio\";s:12:\"自我介绍\";s:8:\"interest\";s:12:\"兴趣爱好\";s:7:\"uniacid\";s:17:\"同一公众号id\";s:7:\"groupid\";s:8:\"分组id\";s:7:\"credit1\";s:6:\"积分\";s:7:\"credit2\";s:6:\"余额\";s:7:\"credit3\";s:19:\"预留积分类型3\";s:7:\"credit4\";s:19:\"预留积分类型4\";s:7:\"credit5\";s:19:\"预留积分类型5\";s:7:\"credit6\";s:19:\"预留积分类型6\";s:10:\"createtime\";s:12:\"加入时间\";s:8:\"password\";s:12:\"用户密码\";s:12:\"pay_password\";s:12:\"支付密码\";}'),('we7:memberinfo:1','a:54:{s:3:\"uid\";s:1:\"1\";s:7:\"uniacid\";s:1:\"1\";s:6:\"mobile\";s:0:\"\";s:5:\"email\";s:39:\"2a733ef1e0a051594a927951119947b5@we7.cc\";s:8:\"password\";s:32:\"17a10411a796d2262f72e7dfb29835fd\";s:4:\"salt\";s:8:\"I8nSYY0m\";s:7:\"groupid\";s:1:\"1\";s:7:\"credit1\";d:0;s:7:\"credit2\";d:0;s:7:\"credit3\";d:0;s:7:\"credit4\";d:0;s:7:\"credit5\";d:0;s:7:\"credit6\";d:0;s:10:\"createtime\";s:10:\"1650192385\";s:8:\"realname\";s:0:\"\";s:8:\"nickname\";s:6:\"逐梦\";s:6:\"avatar\";s:129:\"https://thirdwx.qlogo.cn/mmopen/vi_32/oqo2lpAQL4VxYn81gKoKxzb4QBXhT1sYumKhB0JSvTHRPonWwtwDNWZvn4UC9eJu8DoB3OVglRaicVrbkDOCvxQ/132\";s:2:\"qq\";s:0:\"\";s:3:\"vip\";s:1:\"0\";s:6:\"gender\";s:1:\"0\";s:9:\"birthyear\";s:1:\"0\";s:10:\"birthmonth\";s:1:\"0\";s:8:\"birthday\";s:1:\"0\";s:13:\"constellation\";s:0:\"\";s:6:\"zodiac\";s:0:\"\";s:9:\"telephone\";s:0:\"\";s:6:\"idcard\";s:0:\"\";s:9:\"studentid\";s:0:\"\";s:5:\"grade\";s:0:\"\";s:7:\"address\";s:0:\"\";s:7:\"zipcode\";s:0:\"\";s:11:\"nationality\";s:0:\"\";s:14:\"resideprovince\";s:3:\"省\";s:10:\"residecity\";s:3:\"市\";s:10:\"residedist\";s:0:\"\";s:14:\"graduateschool\";s:0:\"\";s:7:\"company\";s:0:\"\";s:9:\"education\";s:0:\"\";s:10:\"occupation\";s:0:\"\";s:8:\"position\";s:0:\"\";s:7:\"revenue\";s:0:\"\";s:15:\"affectivestatus\";s:0:\"\";s:10:\"lookingfor\";s:0:\"\";s:9:\"bloodtype\";s:0:\"\";s:6:\"height\";s:0:\"\";s:6:\"weight\";s:0:\"\";s:6:\"alipay\";s:0:\"\";s:3:\"msn\";s:0:\"\";s:6:\"taobao\";s:0:\"\";s:4:\"site\";s:0:\"\";s:3:\"bio\";s:0:\"\";s:8:\"interest\";s:0:\"\";s:12:\"pay_password\";s:0:\"\";s:9:\"user_from\";s:1:\"0\";}'),('we7:back_days','a:2:{s:6:\"expire\";i:1650683911;s:4:\"data\";i:-1;}'),('we7:memberinfo:2','a:54:{s:3:\"uid\";s:1:\"2\";s:7:\"uniacid\";s:1:\"1\";s:6:\"mobile\";s:0:\"\";s:5:\"email\";s:39:\"42761767b426bf2e9b42392ba719106b@we7.cc\";s:8:\"password\";s:32:\"17a10411a796d2262f72e7dfb29835fd\";s:4:\"salt\";s:8:\"WtZ9h0RG\";s:7:\"groupid\";s:1:\"1\";s:7:\"credit1\";d:0;s:7:\"credit2\";d:0;s:7:\"credit3\";d:0;s:7:\"credit4\";d:0;s:7:\"credit5\";d:0;s:7:\"credit6\";d:0;s:10:\"createtime\";s:10:\"1650194434\";s:8:\"realname\";s:0:\"\";s:8:\"nickname\";s:6:\"梦凌\";s:6:\"avatar\";s:133:\"https://thirdwx.qlogo.cn/mmopen/vi_32/pR9iaxY5iaqkg0TGcjcdy6ev4zibw8VW6KEmb26upqB6w8akeayhUIn9Et9ZmoTdSIM1ErLqeibPhKnEKCKicC9lahA/132\";s:2:\"qq\";s:0:\"\";s:3:\"vip\";s:1:\"0\";s:6:\"gender\";s:1:\"0\";s:9:\"birthyear\";s:1:\"0\";s:10:\"birthmonth\";s:1:\"0\";s:8:\"birthday\";s:1:\"0\";s:13:\"constellation\";s:0:\"\";s:6:\"zodiac\";s:0:\"\";s:9:\"telephone\";s:0:\"\";s:6:\"idcard\";s:0:\"\";s:9:\"studentid\";s:0:\"\";s:5:\"grade\";s:0:\"\";s:7:\"address\";s:0:\"\";s:7:\"zipcode\";s:0:\"\";s:11:\"nationality\";s:0:\"\";s:14:\"resideprovince\";s:3:\"省\";s:10:\"residecity\";s:3:\"市\";s:10:\"residedist\";s:0:\"\";s:14:\"graduateschool\";s:0:\"\";s:7:\"company\";s:0:\"\";s:9:\"education\";s:0:\"\";s:10:\"occupation\";s:0:\"\";s:8:\"position\";s:0:\"\";s:7:\"revenue\";s:0:\"\";s:15:\"affectivestatus\";s:0:\"\";s:10:\"lookingfor\";s:0:\"\";s:9:\"bloodtype\";s:0:\"\";s:6:\"height\";s:0:\"\";s:6:\"weight\";s:0:\"\";s:6:\"alipay\";s:0:\"\";s:3:\"msn\";s:0:\"\";s:6:\"taobao\";s:0:\"\";s:4:\"site\";s:0:\"\";s:3:\"bio\";s:0:\"\";s:8:\"interest\";s:0:\"\";s:12:\"pay_password\";s:0:\"\";s:9:\"user_from\";s:1:\"0\";}'),('we7:memberinfo:3','a:54:{s:3:\"uid\";s:1:\"3\";s:7:\"uniacid\";s:1:\"1\";s:6:\"mobile\";s:0:\"\";s:5:\"email\";s:39:\"aa4510e028eadda4ac8c8b460f4a4e6a@we7.cc\";s:8:\"password\";s:32:\"17a10411a796d2262f72e7dfb29835fd\";s:4:\"salt\";s:8:\"k8c9lNy8\";s:7:\"groupid\";s:1:\"1\";s:7:\"credit1\";d:0;s:7:\"credit2\";d:0;s:7:\"credit3\";d:0;s:7:\"credit4\";d:0;s:7:\"credit5\";d:0;s:7:\"credit6\";d:0;s:10:\"createtime\";s:10:\"1650195047\";s:8:\"realname\";s:0:\"\";s:8:\"nickname\";s:6:\"逐梦\";s:6:\"avatar\";s:132:\"https://thirdwx.qlogo.cn/mmopen/vi_32/aMAQRXo5yCBQXyEvrLhwNJaSQXOuPEpcppbKleZypjMrW5na7iaKiaibxZe9UTTgqRVFHJv3mYXRGlMLibWxuG8Hpw/132\";s:2:\"qq\";s:0:\"\";s:3:\"vip\";s:1:\"0\";s:6:\"gender\";s:1:\"0\";s:9:\"birthyear\";s:1:\"0\";s:10:\"birthmonth\";s:1:\"0\";s:8:\"birthday\";s:1:\"0\";s:13:\"constellation\";s:0:\"\";s:6:\"zodiac\";s:0:\"\";s:9:\"telephone\";s:0:\"\";s:6:\"idcard\";s:0:\"\";s:9:\"studentid\";s:0:\"\";s:5:\"grade\";s:0:\"\";s:7:\"address\";s:0:\"\";s:7:\"zipcode\";s:0:\"\";s:11:\"nationality\";s:0:\"\";s:14:\"resideprovince\";s:3:\"省\";s:10:\"residecity\";s:3:\"市\";s:10:\"residedist\";s:0:\"\";s:14:\"graduateschool\";s:0:\"\";s:7:\"company\";s:0:\"\";s:9:\"education\";s:0:\"\";s:10:\"occupation\";s:0:\"\";s:8:\"position\";s:0:\"\";s:7:\"revenue\";s:0:\"\";s:15:\"affectivestatus\";s:0:\"\";s:10:\"lookingfor\";s:0:\"\";s:9:\"bloodtype\";s:0:\"\";s:6:\"height\";s:0:\"\";s:6:\"weight\";s:0:\"\";s:6:\"alipay\";s:0:\"\";s:3:\"msn\";s:0:\"\";s:6:\"taobao\";s:0:\"\";s:4:\"site\";s:0:\"\";s:3:\"bio\";s:0:\"\";s:8:\"interest\";s:0:\"\";s:12:\"pay_password\";s:0:\"\";s:9:\"user_from\";s:1:\"0\";}'),('we7:memberinfo:4','a:54:{s:3:\"uid\";s:1:\"4\";s:7:\"uniacid\";s:1:\"1\";s:6:\"mobile\";s:0:\"\";s:5:\"email\";s:39:\"84f467322c10e3dda387839b1ed5c8c4@we7.cc\";s:8:\"password\";s:32:\"17a10411a796d2262f72e7dfb29835fd\";s:4:\"salt\";s:8:\"imPc06X0\";s:7:\"groupid\";s:1:\"1\";s:7:\"credit1\";d:0;s:7:\"credit2\";d:0;s:7:\"credit3\";d:0;s:7:\"credit4\";d:0;s:7:\"credit5\";d:0;s:7:\"credit6\";d:0;s:10:\"createtime\";s:10:\"1650195223\";s:8:\"realname\";s:0:\"\";s:8:\"nickname\";s:5:\"money\";s:6:\"avatar\";s:132:\"https://thirdwx.qlogo.cn/mmopen/vi_32/s6efzSuZdwlKfnZKNm8w9rcxwdIWGfw68S3qkIXGIl8IiaLng4RiaAgZ3PFwNpttibVM1dLt2PQib6rnaVSU11c4YQ/132\";s:2:\"qq\";s:0:\"\";s:3:\"vip\";s:1:\"0\";s:6:\"gender\";s:1:\"0\";s:9:\"birthyear\";s:1:\"0\";s:10:\"birthmonth\";s:1:\"0\";s:8:\"birthday\";s:1:\"0\";s:13:\"constellation\";s:0:\"\";s:6:\"zodiac\";s:0:\"\";s:9:\"telephone\";s:0:\"\";s:6:\"idcard\";s:0:\"\";s:9:\"studentid\";s:0:\"\";s:5:\"grade\";s:0:\"\";s:7:\"address\";s:0:\"\";s:7:\"zipcode\";s:0:\"\";s:11:\"nationality\";s:0:\"\";s:14:\"resideprovince\";s:3:\"省\";s:10:\"residecity\";s:3:\"市\";s:10:\"residedist\";s:0:\"\";s:14:\"graduateschool\";s:0:\"\";s:7:\"company\";s:0:\"\";s:9:\"education\";s:0:\"\";s:10:\"occupation\";s:0:\"\";s:8:\"position\";s:0:\"\";s:7:\"revenue\";s:0:\"\";s:15:\"affectivestatus\";s:0:\"\";s:10:\"lookingfor\";s:0:\"\";s:9:\"bloodtype\";s:0:\"\";s:6:\"height\";s:0:\"\";s:6:\"weight\";s:0:\"\";s:6:\"alipay\";s:0:\"\";s:3:\"msn\";s:0:\"\";s:6:\"taobao\";s:0:\"\";s:4:\"site\";s:0:\"\";s:3:\"bio\";s:0:\"\";s:8:\"interest\";s:0:\"\";s:12:\"pay_password\";s:0:\"\";s:9:\"user_from\";s:1:\"0\";}'),('we7:proxy_wechatpay_account','a:2:{s:7:\"service\";a:0:{}s:6:\"borrow\";a:0:{}}'),('we7:memberinfo:5','a:54:{s:3:\"uid\";s:1:\"5\";s:7:\"uniacid\";s:1:\"1\";s:6:\"mobile\";s:0:\"\";s:5:\"email\";s:39:\"624ccfa7b9f923d30ca2f73ae42ed72a@we7.cc\";s:8:\"password\";s:32:\"17a10411a796d2262f72e7dfb29835fd\";s:4:\"salt\";s:8:\"dZ3D7ZVn\";s:7:\"groupid\";s:1:\"1\";s:7:\"credit1\";d:0;s:7:\"credit2\";d:0;s:7:\"credit3\";d:0;s:7:\"credit4\";d:0;s:7:\"credit5\";d:0;s:7:\"credit6\";d:0;s:10:\"createtime\";s:10:\"1650195923\";s:8:\"realname\";s:0:\"\";s:8:\"nickname\";s:10:\"DiDi支付\";s:6:\"avatar\";s:131:\"https://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLpaqvnFvnzOdojwhru520ibyTpYM2XYibIGFBUkRAQdjyfy7jaox1xBMhNO9vZFpichQFeukurljKSg/132\";s:2:\"qq\";s:0:\"\";s:3:\"vip\";s:1:\"0\";s:6:\"gender\";s:1:\"0\";s:9:\"birthyear\";s:1:\"0\";s:10:\"birthmonth\";s:1:\"0\";s:8:\"birthday\";s:1:\"0\";s:13:\"constellation\";s:0:\"\";s:6:\"zodiac\";s:0:\"\";s:9:\"telephone\";s:0:\"\";s:6:\"idcard\";s:0:\"\";s:9:\"studentid\";s:0:\"\";s:5:\"grade\";s:0:\"\";s:7:\"address\";s:0:\"\";s:7:\"zipcode\";s:0:\"\";s:11:\"nationality\";s:0:\"\";s:14:\"resideprovince\";s:3:\"省\";s:10:\"residecity\";s:3:\"市\";s:10:\"residedist\";s:0:\"\";s:14:\"graduateschool\";s:0:\"\";s:7:\"company\";s:0:\"\";s:9:\"education\";s:0:\"\";s:10:\"occupation\";s:0:\"\";s:8:\"position\";s:0:\"\";s:7:\"revenue\";s:0:\"\";s:15:\"affectivestatus\";s:0:\"\";s:10:\"lookingfor\";s:0:\"\";s:9:\"bloodtype\";s:0:\"\";s:6:\"height\";s:0:\"\";s:6:\"weight\";s:0:\"\";s:6:\"alipay\";s:0:\"\";s:3:\"msn\";s:0:\"\";s:6:\"taobao\";s:0:\"\";s:4:\"site\";s:0:\"\";s:3:\"bio\";s:0:\"\";s:8:\"interest\";s:0:\"\";s:12:\"pay_password\";s:0:\"\";s:9:\"user_from\";s:1:\"0\";}'),('we7:memberinfo:6','a:54:{s:3:\"uid\";s:1:\"6\";s:7:\"uniacid\";s:1:\"1\";s:6:\"mobile\";s:0:\"\";s:5:\"email\";s:39:\"9c90ce7b4b67ad66b25d8b623ab0c259@we7.cc\";s:8:\"password\";s:32:\"17a10411a796d2262f72e7dfb29835fd\";s:4:\"salt\";s:8:\"z6FL69g6\";s:7:\"groupid\";s:1:\"1\";s:7:\"credit1\";d:0;s:7:\"credit2\";d:0;s:7:\"credit3\";d:0;s:7:\"credit4\";d:0;s:7:\"credit5\";d:0;s:7:\"credit6\";d:0;s:10:\"createtime\";s:10:\"1650196621\";s:8:\"realname\";s:0:\"\";s:8:\"nickname\";s:6:\"长安\";s:6:\"avatar\";s:132:\"https://thirdwx.qlogo.cn/mmopen/vi_32/js67LibY9Pb7HX3tX0humLibGZyCtLeaiceWKFO0c4rdCEyicvQ1h7YkAqPTfgQP385TOhU0aBX5y9vrahq7SR6u6w/132\";s:2:\"qq\";s:0:\"\";s:3:\"vip\";s:1:\"0\";s:6:\"gender\";s:1:\"0\";s:9:\"birthyear\";s:1:\"0\";s:10:\"birthmonth\";s:1:\"0\";s:8:\"birthday\";s:1:\"0\";s:13:\"constellation\";s:0:\"\";s:6:\"zodiac\";s:0:\"\";s:9:\"telephone\";s:0:\"\";s:6:\"idcard\";s:0:\"\";s:9:\"studentid\";s:0:\"\";s:5:\"grade\";s:0:\"\";s:7:\"address\";s:0:\"\";s:7:\"zipcode\";s:0:\"\";s:11:\"nationality\";s:0:\"\";s:14:\"resideprovince\";s:3:\"省\";s:10:\"residecity\";s:3:\"市\";s:10:\"residedist\";s:0:\"\";s:14:\"graduateschool\";s:0:\"\";s:7:\"company\";s:0:\"\";s:9:\"education\";s:0:\"\";s:10:\"occupation\";s:0:\"\";s:8:\"position\";s:0:\"\";s:7:\"revenue\";s:0:\"\";s:15:\"affectivestatus\";s:0:\"\";s:10:\"lookingfor\";s:0:\"\";s:9:\"bloodtype\";s:0:\"\";s:6:\"height\";s:0:\"\";s:6:\"weight\";s:0:\"\";s:6:\"alipay\";s:0:\"\";s:3:\"msn\";s:0:\"\";s:6:\"taobao\";s:0:\"\";s:4:\"site\";s:0:\"\";s:3:\"bio\";s:0:\"\";s:8:\"interest\";s:0:\"\";s:12:\"pay_password\";s:0:\"\";s:9:\"user_from\";s:1:\"0\";}'),('we7:delete_visit_ip:20220417','b:1;'),('we7:unisetting:0','a:0:{}'),('we7:memberinfo:8','a:54:{s:3:\"uid\";s:1:\"8\";s:7:\"uniacid\";s:1:\"1\";s:6:\"mobile\";s:0:\"\";s:5:\"email\";s:39:\"72eea268ff8819e18af05a95ead0e0ea@we7.cc\";s:8:\"password\";s:32:\"17a10411a796d2262f72e7dfb29835fd\";s:4:\"salt\";s:8:\"VIfzhiyr\";s:7:\"groupid\";s:1:\"1\";s:7:\"credit1\";d:0;s:7:\"credit2\";d:0;s:7:\"credit3\";d:0;s:7:\"credit4\";d:0;s:7:\"credit5\";d:0;s:7:\"credit6\";d:0;s:10:\"createtime\";s:10:\"1650280540\";s:8:\"realname\";s:0:\"\";s:8:\"nickname\";s:31:\"晓宇(不回消息看朋友圈\";s:6:\"avatar\";s:131:\"https://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eozb7CDVSSzGPiaVayUicAKKZALsXeQ5wWINthA5bVsFbkGazuFjjqANPLX3XVicAkNy1ufEZjq9fSLg/132\";s:2:\"qq\";s:0:\"\";s:3:\"vip\";s:1:\"0\";s:6:\"gender\";s:1:\"0\";s:9:\"birthyear\";s:1:\"0\";s:10:\"birthmonth\";s:1:\"0\";s:8:\"birthday\";s:1:\"0\";s:13:\"constellation\";s:0:\"\";s:6:\"zodiac\";s:0:\"\";s:9:\"telephone\";s:0:\"\";s:6:\"idcard\";s:0:\"\";s:9:\"studentid\";s:0:\"\";s:5:\"grade\";s:0:\"\";s:7:\"address\";s:0:\"\";s:7:\"zipcode\";s:0:\"\";s:11:\"nationality\";s:0:\"\";s:14:\"resideprovince\";s:3:\"省\";s:10:\"residecity\";s:3:\"市\";s:10:\"residedist\";s:0:\"\";s:14:\"graduateschool\";s:0:\"\";s:7:\"company\";s:0:\"\";s:9:\"education\";s:0:\"\";s:10:\"occupation\";s:0:\"\";s:8:\"position\";s:0:\"\";s:7:\"revenue\";s:0:\"\";s:15:\"affectivestatus\";s:0:\"\";s:10:\"lookingfor\";s:0:\"\";s:9:\"bloodtype\";s:0:\"\";s:6:\"height\";s:0:\"\";s:6:\"weight\";s:0:\"\";s:6:\"alipay\";s:0:\"\";s:3:\"msn\";s:0:\"\";s:6:\"taobao\";s:0:\"\";s:4:\"site\";s:0:\"\";s:3:\"bio\";s:0:\"\";s:8:\"interest\";s:0:\"\";s:12:\"pay_password\";s:0:\"\";s:9:\"user_from\";s:1:\"0\";}'),('we7:memberinfo:13','a:54:{s:3:\"uid\";s:2:\"13\";s:7:\"uniacid\";s:1:\"1\";s:6:\"mobile\";s:0:\"\";s:5:\"email\";s:39:\"15c2346ff24414ddb206ea007d676694@we7.cc\";s:8:\"password\";s:32:\"17a10411a796d2262f72e7dfb29835fd\";s:4:\"salt\";s:8:\"P12R1xA6\";s:7:\"groupid\";s:1:\"1\";s:7:\"credit1\";d:0;s:7:\"credit2\";d:0;s:7:\"credit3\";d:0;s:7:\"credit4\";d:0;s:7:\"credit5\";d:0;s:7:\"credit6\";d:0;s:10:\"createtime\";s:10:\"1650292731\";s:8:\"realname\";s:0:\"\";s:8:\"nickname\";s:1:\"Y\";s:6:\"avatar\";s:132:\"https://thirdwx.qlogo.cn/mmopen/vi_32/Q8zMZPaSNF1yfibNfL3ALUo9AryUQOZFTJDOoFF0hWE4vWd74iciaSbcluJG9llg49P2MUgibSkEtPBoUtwMkvHakA/132\";s:2:\"qq\";s:0:\"\";s:3:\"vip\";s:1:\"0\";s:6:\"gender\";s:1:\"0\";s:9:\"birthyear\";s:1:\"0\";s:10:\"birthmonth\";s:1:\"0\";s:8:\"birthday\";s:1:\"0\";s:13:\"constellation\";s:0:\"\";s:6:\"zodiac\";s:0:\"\";s:9:\"telephone\";s:0:\"\";s:6:\"idcard\";s:0:\"\";s:9:\"studentid\";s:0:\"\";s:5:\"grade\";s:0:\"\";s:7:\"address\";s:0:\"\";s:7:\"zipcode\";s:0:\"\";s:11:\"nationality\";s:0:\"\";s:14:\"resideprovince\";s:3:\"省\";s:10:\"residecity\";s:3:\"市\";s:10:\"residedist\";s:0:\"\";s:14:\"graduateschool\";s:0:\"\";s:7:\"company\";s:0:\"\";s:9:\"education\";s:0:\"\";s:10:\"occupation\";s:0:\"\";s:8:\"position\";s:0:\"\";s:7:\"revenue\";s:0:\"\";s:15:\"affectivestatus\";s:0:\"\";s:10:\"lookingfor\";s:0:\"\";s:9:\"bloodtype\";s:0:\"\";s:6:\"height\";s:0:\"\";s:6:\"weight\";s:0:\"\";s:6:\"alipay\";s:0:\"\";s:3:\"msn\";s:0:\"\";s:6:\"taobao\";s:0:\"\";s:4:\"site\";s:0:\"\";s:3:\"bio\";s:0:\"\";s:8:\"interest\";s:0:\"\";s:12:\"pay_password\";s:0:\"\";s:9:\"user_from\";s:1:\"0\";}'),('we7:memberinfo:14','a:54:{s:3:\"uid\";s:2:\"14\";s:7:\"uniacid\";s:1:\"1\";s:6:\"mobile\";s:0:\"\";s:5:\"email\";s:39:\"166eaf4f8802db8e0b7602bba8b15ace@we7.cc\";s:8:\"password\";s:32:\"17a10411a796d2262f72e7dfb29835fd\";s:4:\"salt\";s:8:\"jh9qHzkW\";s:7:\"groupid\";s:1:\"1\";s:7:\"credit1\";d:0;s:7:\"credit2\";d:0;s:7:\"credit3\";d:0;s:7:\"credit4\";d:0;s:7:\"credit5\";d:0;s:7:\"credit6\";d:0;s:10:\"createtime\";s:10:\"1650337677\";s:8:\"realname\";s:0:\"\";s:8:\"nickname\";s:9:\"程海宇\";s:6:\"avatar\";s:131:\"https://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIGmOThwmOWU0oIVVSe7vv5oHKbjBbDacFuKWicr1AAmhQ0h857ibaiacuacMRLuYlMdSVApaO2aZYwA/132\";s:2:\"qq\";s:0:\"\";s:3:\"vip\";s:1:\"0\";s:6:\"gender\";s:1:\"0\";s:9:\"birthyear\";s:1:\"0\";s:10:\"birthmonth\";s:1:\"0\";s:8:\"birthday\";s:1:\"0\";s:13:\"constellation\";s:0:\"\";s:6:\"zodiac\";s:0:\"\";s:9:\"telephone\";s:0:\"\";s:6:\"idcard\";s:0:\"\";s:9:\"studentid\";s:0:\"\";s:5:\"grade\";s:0:\"\";s:7:\"address\";s:0:\"\";s:7:\"zipcode\";s:0:\"\";s:11:\"nationality\";s:0:\"\";s:14:\"resideprovince\";s:3:\"省\";s:10:\"residecity\";s:3:\"市\";s:10:\"residedist\";s:0:\"\";s:14:\"graduateschool\";s:0:\"\";s:7:\"company\";s:0:\"\";s:9:\"education\";s:0:\"\";s:10:\"occupation\";s:0:\"\";s:8:\"position\";s:0:\"\";s:7:\"revenue\";s:0:\"\";s:15:\"affectivestatus\";s:0:\"\";s:10:\"lookingfor\";s:0:\"\";s:9:\"bloodtype\";s:0:\"\";s:6:\"height\";s:0:\"\";s:6:\"weight\";s:0:\"\";s:6:\"alipay\";s:0:\"\";s:3:\"msn\";s:0:\"\";s:6:\"taobao\";s:0:\"\";s:4:\"site\";s:0:\"\";s:3:\"bio\";s:0:\"\";s:8:\"interest\";s:0:\"\";s:12:\"pay_password\";s:0:\"\";s:9:\"user_from\";s:1:\"0\";}'),('we7:memberinfo:10','a:54:{s:3:\"uid\";s:2:\"10\";s:7:\"uniacid\";s:1:\"1\";s:6:\"mobile\";s:0:\"\";s:5:\"email\";s:39:\"1538cb987e1b2c5114d536d784c90227@we7.cc\";s:8:\"password\";s:32:\"17a10411a796d2262f72e7dfb29835fd\";s:4:\"salt\";s:8:\"LoLpkCLZ\";s:7:\"groupid\";s:1:\"1\";s:7:\"credit1\";d:0;s:7:\"credit2\";d:0;s:7:\"credit3\";d:0;s:7:\"credit4\";d:0;s:7:\"credit5\";d:0;s:7:\"credit6\";d:0;s:10:\"createtime\";s:10:\"1650288847\";s:8:\"realname\";s:0:\"\";s:8:\"nickname\";s:6:\"子夫\";s:6:\"avatar\";s:129:\"https://thirdwx.qlogo.cn/mmopen/vi_32/qsxkMxh6rhR2b27JaEddGaokh0iaKhxxCjwoGnmW9rZSUSVJw60vw9AbvRynEAUoaZ5cgGf6QJDAT7BmsTSVd4w/132\";s:2:\"qq\";s:0:\"\";s:3:\"vip\";s:1:\"0\";s:6:\"gender\";s:1:\"0\";s:9:\"birthyear\";s:1:\"0\";s:10:\"birthmonth\";s:1:\"0\";s:8:\"birthday\";s:1:\"0\";s:13:\"constellation\";s:0:\"\";s:6:\"zodiac\";s:0:\"\";s:9:\"telephone\";s:0:\"\";s:6:\"idcard\";s:0:\"\";s:9:\"studentid\";s:0:\"\";s:5:\"grade\";s:0:\"\";s:7:\"address\";s:0:\"\";s:7:\"zipcode\";s:0:\"\";s:11:\"nationality\";s:0:\"\";s:14:\"resideprovince\";s:3:\"省\";s:10:\"residecity\";s:3:\"市\";s:10:\"residedist\";s:0:\"\";s:14:\"graduateschool\";s:0:\"\";s:7:\"company\";s:0:\"\";s:9:\"education\";s:0:\"\";s:10:\"occupation\";s:0:\"\";s:8:\"position\";s:0:\"\";s:7:\"revenue\";s:0:\"\";s:15:\"affectivestatus\";s:0:\"\";s:10:\"lookingfor\";s:0:\"\";s:9:\"bloodtype\";s:0:\"\";s:6:\"height\";s:0:\"\";s:6:\"weight\";s:0:\"\";s:6:\"alipay\";s:0:\"\";s:3:\"msn\";s:0:\"\";s:6:\"taobao\";s:0:\"\";s:4:\"site\";s:0:\"\";s:3:\"bio\";s:0:\"\";s:8:\"interest\";s:0:\"\";s:12:\"pay_password\";s:0:\"\";s:9:\"user_from\";s:1:\"0\";}'),('we7:memberinfo:11','a:54:{s:3:\"uid\";s:2:\"11\";s:7:\"uniacid\";s:1:\"1\";s:6:\"mobile\";s:0:\"\";s:5:\"email\";s:39:\"5a41f528458507d06fe31c86bcc5a024@we7.cc\";s:8:\"password\";s:32:\"17a10411a796d2262f72e7dfb29835fd\";s:4:\"salt\";s:8:\"mugdDDUK\";s:7:\"groupid\";s:1:\"1\";s:7:\"credit1\";d:0;s:7:\"credit2\";d:0;s:7:\"credit3\";d:0;s:7:\"credit4\";d:0;s:7:\"credit5\";d:0;s:7:\"credit6\";d:0;s:10:\"createtime\";s:10:\"1650290027\";s:8:\"realname\";s:0:\"\";s:8:\"nickname\";s:15:\"ᝰꫛꪮꪮꫜ\";s:6:\"avatar\";s:130:\"https://thirdwx.qlogo.cn/mmopen/vi_32/MY9lpHk6lv1j5tv3OibXia3OcxBJmZGjguO5Og7f6ydGkC5XSK5kONA35lUKdL0zx4ajEjsB8LVBOe00ox4Mj7aA/132\";s:2:\"qq\";s:0:\"\";s:3:\"vip\";s:1:\"0\";s:6:\"gender\";s:1:\"0\";s:9:\"birthyear\";s:1:\"0\";s:10:\"birthmonth\";s:1:\"0\";s:8:\"birthday\";s:1:\"0\";s:13:\"constellation\";s:0:\"\";s:6:\"zodiac\";s:0:\"\";s:9:\"telephone\";s:0:\"\";s:6:\"idcard\";s:0:\"\";s:9:\"studentid\";s:0:\"\";s:5:\"grade\";s:0:\"\";s:7:\"address\";s:0:\"\";s:7:\"zipcode\";s:0:\"\";s:11:\"nationality\";s:0:\"\";s:14:\"resideprovince\";s:3:\"省\";s:10:\"residecity\";s:3:\"市\";s:10:\"residedist\";s:0:\"\";s:14:\"graduateschool\";s:0:\"\";s:7:\"company\";s:0:\"\";s:9:\"education\";s:0:\"\";s:10:\"occupation\";s:0:\"\";s:8:\"position\";s:0:\"\";s:7:\"revenue\";s:0:\"\";s:15:\"affectivestatus\";s:0:\"\";s:10:\"lookingfor\";s:0:\"\";s:9:\"bloodtype\";s:0:\"\";s:6:\"height\";s:0:\"\";s:6:\"weight\";s:0:\"\";s:6:\"alipay\";s:0:\"\";s:3:\"msn\";s:0:\"\";s:6:\"taobao\";s:0:\"\";s:4:\"site\";s:0:\"\";s:3:\"bio\";s:0:\"\";s:8:\"interest\";s:0:\"\";s:12:\"pay_password\";s:0:\"\";s:9:\"user_from\";s:1:\"0\";}'),('we7:memberinfo:12','a:54:{s:3:\"uid\";s:2:\"12\";s:7:\"uniacid\";s:1:\"1\";s:6:\"mobile\";s:0:\"\";s:5:\"email\";s:39:\"9e9e799ad2158fd6704e3ad99c3c20a6@we7.cc\";s:8:\"password\";s:32:\"17a10411a796d2262f72e7dfb29835fd\";s:4:\"salt\";s:8:\"KBbBZhBp\";s:7:\"groupid\";s:1:\"1\";s:7:\"credit1\";d:0;s:7:\"credit2\";d:0;s:7:\"credit3\";d:0;s:7:\"credit4\";d:0;s:7:\"credit5\";d:0;s:7:\"credit6\";d:0;s:10:\"createtime\";s:10:\"1650291041\";s:8:\"realname\";s:0:\"\";s:8:\"nickname\";s:6:\"孤玖\";s:6:\"avatar\";s:132:\"https://thirdwx.qlogo.cn/mmopen/vi_32/zxVN0QqibgaibNTzWba5yDibJ8CLOH6z2oOf7Mb4GWQFY932d4qzavUVvd4Yq8tT9QVC4eIw5VvXWaMauiaz2HuJoA/132\";s:2:\"qq\";s:0:\"\";s:3:\"vip\";s:1:\"0\";s:6:\"gender\";s:1:\"0\";s:9:\"birthyear\";s:1:\"0\";s:10:\"birthmonth\";s:1:\"0\";s:8:\"birthday\";s:1:\"0\";s:13:\"constellation\";s:0:\"\";s:6:\"zodiac\";s:0:\"\";s:9:\"telephone\";s:0:\"\";s:6:\"idcard\";s:0:\"\";s:9:\"studentid\";s:0:\"\";s:5:\"grade\";s:0:\"\";s:7:\"address\";s:0:\"\";s:7:\"zipcode\";s:0:\"\";s:11:\"nationality\";s:0:\"\";s:14:\"resideprovince\";s:3:\"省\";s:10:\"residecity\";s:3:\"市\";s:10:\"residedist\";s:0:\"\";s:14:\"graduateschool\";s:0:\"\";s:7:\"company\";s:0:\"\";s:9:\"education\";s:0:\"\";s:10:\"occupation\";s:0:\"\";s:8:\"position\";s:0:\"\";s:7:\"revenue\";s:0:\"\";s:15:\"affectivestatus\";s:0:\"\";s:10:\"lookingfor\";s:0:\"\";s:9:\"bloodtype\";s:0:\"\";s:6:\"height\";s:0:\"\";s:6:\"weight\";s:0:\"\";s:6:\"alipay\";s:0:\"\";s:3:\"msn\";s:0:\"\";s:6:\"taobao\";s:0:\"\";s:4:\"site\";s:0:\"\";s:3:\"bio\";s:0:\"\";s:8:\"interest\";s:0:\"\";s:12:\"pay_password\";s:0:\"\";s:9:\"user_from\";s:1:\"0\";}'),('we7:memberinfo:16','a:54:{s:3:\"uid\";s:2:\"16\";s:7:\"uniacid\";s:1:\"1\";s:6:\"mobile\";s:0:\"\";s:5:\"email\";s:39:\"a70b0bafc99f650cf8429b21ee5b76a3@we7.cc\";s:8:\"password\";s:32:\"17a10411a796d2262f72e7dfb29835fd\";s:4:\"salt\";s:8:\"feEDhvCO\";s:7:\"groupid\";s:1:\"1\";s:7:\"credit1\";d:0;s:7:\"credit2\";d:0;s:7:\"credit3\";d:0;s:7:\"credit4\";d:0;s:7:\"credit5\";d:0;s:7:\"credit6\";d:0;s:10:\"createtime\";s:10:\"1650349376\";s:8:\"realname\";s:0:\"\";s:8:\"nickname\";s:4:\"1.26\";s:6:\"avatar\";s:131:\"https://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKgDR5h5vL78RWWTzGqL89GbiazsLRCZOMVibye1fOsk4Za3ObvUuxjLWpCBAeBzuLQA5MicVYoQ947A/132\";s:2:\"qq\";s:0:\"\";s:3:\"vip\";s:1:\"0\";s:6:\"gender\";s:1:\"0\";s:9:\"birthyear\";s:1:\"0\";s:10:\"birthmonth\";s:1:\"0\";s:8:\"birthday\";s:1:\"0\";s:13:\"constellation\";s:0:\"\";s:6:\"zodiac\";s:0:\"\";s:9:\"telephone\";s:0:\"\";s:6:\"idcard\";s:0:\"\";s:9:\"studentid\";s:0:\"\";s:5:\"grade\";s:0:\"\";s:7:\"address\";s:0:\"\";s:7:\"zipcode\";s:0:\"\";s:11:\"nationality\";s:0:\"\";s:14:\"resideprovince\";s:3:\"省\";s:10:\"residecity\";s:3:\"市\";s:10:\"residedist\";s:0:\"\";s:14:\"graduateschool\";s:0:\"\";s:7:\"company\";s:0:\"\";s:9:\"education\";s:0:\"\";s:10:\"occupation\";s:0:\"\";s:8:\"position\";s:0:\"\";s:7:\"revenue\";s:0:\"\";s:15:\"affectivestatus\";s:0:\"\";s:10:\"lookingfor\";s:0:\"\";s:9:\"bloodtype\";s:0:\"\";s:6:\"height\";s:0:\"\";s:6:\"weight\";s:0:\"\";s:6:\"alipay\";s:0:\"\";s:3:\"msn\";s:0:\"\";s:6:\"taobao\";s:0:\"\";s:4:\"site\";s:0:\"\";s:3:\"bio\";s:0:\"\";s:8:\"interest\";s:0:\"\";s:12:\"pay_password\";s:0:\"\";s:9:\"user_from\";s:1:\"0\";}'),('we7:memberinfo:15','a:54:{s:3:\"uid\";s:2:\"15\";s:7:\"uniacid\";s:1:\"1\";s:6:\"mobile\";s:0:\"\";s:5:\"email\";s:39:\"cd6521cdf73b99da55c95aa60753a45e@we7.cc\";s:8:\"password\";s:32:\"17a10411a796d2262f72e7dfb29835fd\";s:4:\"salt\";s:8:\"dWzJgG65\";s:7:\"groupid\";s:1:\"1\";s:7:\"credit1\";d:0;s:7:\"credit2\";d:0;s:7:\"credit3\";d:0;s:7:\"credit4\";d:0;s:7:\"credit5\";d:0;s:7:\"credit6\";d:0;s:10:\"createtime\";s:10:\"1650338397\";s:8:\"realname\";s:0:\"\";s:8:\"nickname\";s:6:\"梦凌\";s:6:\"avatar\";s:132:\"https://thirdwx.qlogo.cn/mmopen/vi_32/xejeKycdFc7lGWvibJYO0G6Tn2uPVmUSqDZt3Wiap5mtTz5qGePibMDySIJCUcs3XGZZoqibTJg39D3suKY8ttHTfw/132\";s:2:\"qq\";s:0:\"\";s:3:\"vip\";s:1:\"0\";s:6:\"gender\";s:1:\"0\";s:9:\"birthyear\";s:1:\"0\";s:10:\"birthmonth\";s:1:\"0\";s:8:\"birthday\";s:1:\"0\";s:13:\"constellation\";s:0:\"\";s:6:\"zodiac\";s:0:\"\";s:9:\"telephone\";s:0:\"\";s:6:\"idcard\";s:0:\"\";s:9:\"studentid\";s:0:\"\";s:5:\"grade\";s:0:\"\";s:7:\"address\";s:0:\"\";s:7:\"zipcode\";s:0:\"\";s:11:\"nationality\";s:0:\"\";s:14:\"resideprovince\";s:3:\"省\";s:10:\"residecity\";s:3:\"市\";s:10:\"residedist\";s:0:\"\";s:14:\"graduateschool\";s:0:\"\";s:7:\"company\";s:0:\"\";s:9:\"education\";s:0:\"\";s:10:\"occupation\";s:0:\"\";s:8:\"position\";s:0:\"\";s:7:\"revenue\";s:0:\"\";s:15:\"affectivestatus\";s:0:\"\";s:10:\"lookingfor\";s:0:\"\";s:9:\"bloodtype\";s:0:\"\";s:6:\"height\";s:0:\"\";s:6:\"weight\";s:0:\"\";s:6:\"alipay\";s:0:\"\";s:3:\"msn\";s:0:\"\";s:6:\"taobao\";s:0:\"\";s:4:\"site\";s:0:\"\";s:3:\"bio\";s:0:\"\";s:8:\"interest\";s:0:\"\";s:12:\"pay_password\";s:0:\"\";s:9:\"user_from\";s:1:\"0\";}'),('we7:memberinfo:17','a:54:{s:3:\"uid\";s:2:\"17\";s:7:\"uniacid\";s:1:\"1\";s:6:\"mobile\";s:0:\"\";s:5:\"email\";s:39:\"9f390c83c5dc643963c48558ee63ebf1@we7.cc\";s:8:\"password\";s:32:\"17a10411a796d2262f72e7dfb29835fd\";s:4:\"salt\";s:8:\"qbZOHvOf\";s:7:\"groupid\";s:1:\"1\";s:7:\"credit1\";d:0;s:7:\"credit2\";d:0;s:7:\"credit3\";d:0;s:7:\"credit4\";d:0;s:7:\"credit5\";d:0;s:7:\"credit6\";d:0;s:10:\"createtime\";s:10:\"1650351175\";s:8:\"realname\";s:0:\"\";s:8:\"nickname\";s:4:\"YP_s\";s:6:\"avatar\";s:133:\"https://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKEpiaNbpwnNtgC4JUibV5ibsSvnLxuvD6cTPVKmotcvtaibODCTY7ORzHhaHmbj6aSHoSE80HVyicGwRg/132\";s:2:\"qq\";s:0:\"\";s:3:\"vip\";s:1:\"0\";s:6:\"gender\";s:1:\"0\";s:9:\"birthyear\";s:1:\"0\";s:10:\"birthmonth\";s:1:\"0\";s:8:\"birthday\";s:1:\"0\";s:13:\"constellation\";s:0:\"\";s:6:\"zodiac\";s:0:\"\";s:9:\"telephone\";s:0:\"\";s:6:\"idcard\";s:0:\"\";s:9:\"studentid\";s:0:\"\";s:5:\"grade\";s:0:\"\";s:7:\"address\";s:0:\"\";s:7:\"zipcode\";s:0:\"\";s:11:\"nationality\";s:0:\"\";s:14:\"resideprovince\";s:3:\"省\";s:10:\"residecity\";s:3:\"市\";s:10:\"residedist\";s:0:\"\";s:14:\"graduateschool\";s:0:\"\";s:7:\"company\";s:0:\"\";s:9:\"education\";s:0:\"\";s:10:\"occupation\";s:0:\"\";s:8:\"position\";s:0:\"\";s:7:\"revenue\";s:0:\"\";s:15:\"affectivestatus\";s:0:\"\";s:10:\"lookingfor\";s:0:\"\";s:9:\"bloodtype\";s:0:\"\";s:6:\"height\";s:0:\"\";s:6:\"weight\";s:0:\"\";s:6:\"alipay\";s:0:\"\";s:3:\"msn\";s:0:\"\";s:6:\"taobao\";s:0:\"\";s:4:\"site\";s:0:\"\";s:3:\"bio\";s:0:\"\";s:8:\"interest\";s:0:\"\";s:12:\"pay_password\";s:0:\"\";s:9:\"user_from\";s:1:\"0\";}'),('we7:memberinfo:18','a:54:{s:3:\"uid\";s:2:\"18\";s:7:\"uniacid\";s:1:\"1\";s:6:\"mobile\";s:0:\"\";s:5:\"email\";s:39:\"0ce4e4b4222d173ef2888c98b19ae789@we7.cc\";s:8:\"password\";s:32:\"17a10411a796d2262f72e7dfb29835fd\";s:4:\"salt\";s:8:\"B8TXoUO0\";s:7:\"groupid\";s:1:\"1\";s:7:\"credit1\";d:0;s:7:\"credit2\";d:0;s:7:\"credit3\";d:0;s:7:\"credit4\";d:0;s:7:\"credit5\";d:0;s:7:\"credit6\";d:0;s:10:\"createtime\";s:10:\"1650352230\";s:8:\"realname\";s:0:\"\";s:8:\"nickname\";s:24:\"不瘦到一百不改名\";s:6:\"avatar\";s:131:\"https://thirdwx.qlogo.cn/mmopen/vi_32/YSv4tFLeia3BLYvXI9pAmbChK2CNFQZiao1jqxea0B19RGx4Xh2bChFXHCAcWJd2Gwx6pFUlib2YVZOuMINWd4Pdw/132\";s:2:\"qq\";s:0:\"\";s:3:\"vip\";s:1:\"0\";s:6:\"gender\";s:1:\"0\";s:9:\"birthyear\";s:1:\"0\";s:10:\"birthmonth\";s:1:\"0\";s:8:\"birthday\";s:1:\"0\";s:13:\"constellation\";s:0:\"\";s:6:\"zodiac\";s:0:\"\";s:9:\"telephone\";s:0:\"\";s:6:\"idcard\";s:0:\"\";s:9:\"studentid\";s:0:\"\";s:5:\"grade\";s:0:\"\";s:7:\"address\";s:0:\"\";s:7:\"zipcode\";s:0:\"\";s:11:\"nationality\";s:0:\"\";s:14:\"resideprovince\";s:3:\"省\";s:10:\"residecity\";s:3:\"市\";s:10:\"residedist\";s:0:\"\";s:14:\"graduateschool\";s:0:\"\";s:7:\"company\";s:0:\"\";s:9:\"education\";s:0:\"\";s:10:\"occupation\";s:0:\"\";s:8:\"position\";s:0:\"\";s:7:\"revenue\";s:0:\"\";s:15:\"affectivestatus\";s:0:\"\";s:10:\"lookingfor\";s:0:\"\";s:9:\"bloodtype\";s:0:\"\";s:6:\"height\";s:0:\"\";s:6:\"weight\";s:0:\"\";s:6:\"alipay\";s:0:\"\";s:3:\"msn\";s:0:\"\";s:6:\"taobao\";s:0:\"\";s:4:\"site\";s:0:\"\";s:3:\"bio\";s:0:\"\";s:8:\"interest\";s:0:\"\";s:12:\"pay_password\";s:0:\"\";s:9:\"user_from\";s:1:\"0\";}'),('we7:memberinfo:19','a:54:{s:3:\"uid\";s:2:\"19\";s:7:\"uniacid\";s:1:\"1\";s:6:\"mobile\";s:0:\"\";s:5:\"email\";s:39:\"121d862805bc5a16b44993c96393a874@we7.cc\";s:8:\"password\";s:32:\"17a10411a796d2262f72e7dfb29835fd\";s:4:\"salt\";s:8:\"wJGrsaSN\";s:7:\"groupid\";s:1:\"1\";s:7:\"credit1\";d:0;s:7:\"credit2\";d:0;s:7:\"credit3\";d:0;s:7:\"credit4\";d:0;s:7:\"credit5\";d:0;s:7:\"credit6\";d:0;s:10:\"createtime\";s:10:\"1650353949\";s:8:\"realname\";s:0:\"\";s:8:\"nickname\";s:15:\"ᝰꫛꪮꪮꫜ\";s:6:\"avatar\";s:133:\"https://thirdwx.qlogo.cn/mmopen/vi_32/UR4PvjicyIzEF80T6Is67eJPKDWHhUTj0H3yguWt4L5XibygTMgaDtaCLeQibffGciaib8YlUpoWvld1U3wAuOg9jRA/132\";s:2:\"qq\";s:0:\"\";s:3:\"vip\";s:1:\"0\";s:6:\"gender\";s:1:\"0\";s:9:\"birthyear\";s:1:\"0\";s:10:\"birthmonth\";s:1:\"0\";s:8:\"birthday\";s:1:\"0\";s:13:\"constellation\";s:0:\"\";s:6:\"zodiac\";s:0:\"\";s:9:\"telephone\";s:0:\"\";s:6:\"idcard\";s:0:\"\";s:9:\"studentid\";s:0:\"\";s:5:\"grade\";s:0:\"\";s:7:\"address\";s:0:\"\";s:7:\"zipcode\";s:0:\"\";s:11:\"nationality\";s:0:\"\";s:14:\"resideprovince\";s:3:\"省\";s:10:\"residecity\";s:3:\"市\";s:10:\"residedist\";s:0:\"\";s:14:\"graduateschool\";s:0:\"\";s:7:\"company\";s:0:\"\";s:9:\"education\";s:0:\"\";s:10:\"occupation\";s:0:\"\";s:8:\"position\";s:0:\"\";s:7:\"revenue\";s:0:\"\";s:15:\"affectivestatus\";s:0:\"\";s:10:\"lookingfor\";s:0:\"\";s:9:\"bloodtype\";s:0:\"\";s:6:\"height\";s:0:\"\";s:6:\"weight\";s:0:\"\";s:6:\"alipay\";s:0:\"\";s:3:\"msn\";s:0:\"\";s:6:\"taobao\";s:0:\"\";s:4:\"site\";s:0:\"\";s:3:\"bio\";s:0:\"\";s:8:\"interest\";s:0:\"\";s:12:\"pay_password\";s:0:\"\";s:9:\"user_from\";s:1:\"0\";}'),('we7:memberinfo:20','a:54:{s:3:\"uid\";s:2:\"20\";s:7:\"uniacid\";s:1:\"1\";s:6:\"mobile\";s:0:\"\";s:5:\"email\";s:39:\"ddea795a27921e1fdc50e39947cc9869@we7.cc\";s:8:\"password\";s:32:\"17a10411a796d2262f72e7dfb29835fd\";s:4:\"salt\";s:8:\"Bh33jA5l\";s:7:\"groupid\";s:1:\"1\";s:7:\"credit1\";d:0;s:7:\"credit2\";d:0;s:7:\"credit3\";d:0;s:7:\"credit4\";d:0;s:7:\"credit5\";d:0;s:7:\"credit6\";d:0;s:10:\"createtime\";s:10:\"1650356262\";s:8:\"realname\";s:0:\"\";s:8:\"nickname\";s:6:\"Tears.\";s:6:\"avatar\";s:130:\"https://thirdwx.qlogo.cn/mmopen/vi_32/yefhcDLO07ep6cYAGnE3MRZqgaq5c1icd2P8FVDQgspomE38db4X9INXYBXEib96l0WXCLb865B5XfV1vQ44ZWFw/132\";s:2:\"qq\";s:0:\"\";s:3:\"vip\";s:1:\"0\";s:6:\"gender\";s:1:\"0\";s:9:\"birthyear\";s:1:\"0\";s:10:\"birthmonth\";s:1:\"0\";s:8:\"birthday\";s:1:\"0\";s:13:\"constellation\";s:0:\"\";s:6:\"zodiac\";s:0:\"\";s:9:\"telephone\";s:0:\"\";s:6:\"idcard\";s:0:\"\";s:9:\"studentid\";s:0:\"\";s:5:\"grade\";s:0:\"\";s:7:\"address\";s:0:\"\";s:7:\"zipcode\";s:0:\"\";s:11:\"nationality\";s:0:\"\";s:14:\"resideprovince\";s:3:\"省\";s:10:\"residecity\";s:3:\"市\";s:10:\"residedist\";s:0:\"\";s:14:\"graduateschool\";s:0:\"\";s:7:\"company\";s:0:\"\";s:9:\"education\";s:0:\"\";s:10:\"occupation\";s:0:\"\";s:8:\"position\";s:0:\"\";s:7:\"revenue\";s:0:\"\";s:15:\"affectivestatus\";s:0:\"\";s:10:\"lookingfor\";s:0:\"\";s:9:\"bloodtype\";s:0:\"\";s:6:\"height\";s:0:\"\";s:6:\"weight\";s:0:\"\";s:6:\"alipay\";s:0:\"\";s:3:\"msn\";s:0:\"\";s:6:\"taobao\";s:0:\"\";s:4:\"site\";s:0:\"\";s:3:\"bio\";s:0:\"\";s:8:\"interest\";s:0:\"\";s:12:\"pay_password\";s:0:\"\";s:9:\"user_from\";s:1:\"0\";}'),('we7:memberinfo:21','a:54:{s:3:\"uid\";s:2:\"21\";s:7:\"uniacid\";s:1:\"1\";s:6:\"mobile\";s:0:\"\";s:5:\"email\";s:39:\"fefd72b09ca757d5da2aae327919f91d@we7.cc\";s:8:\"password\";s:32:\"17a10411a796d2262f72e7dfb29835fd\";s:4:\"salt\";s:8:\"ySsSf8ij\";s:7:\"groupid\";s:1:\"1\";s:7:\"credit1\";d:0;s:7:\"credit2\";d:0;s:7:\"credit3\";d:0;s:7:\"credit4\";d:0;s:7:\"credit5\";d:0;s:7:\"credit6\";d:0;s:10:\"createtime\";s:10:\"1650358728\";s:8:\"realname\";s:0:\"\";s:8:\"nickname\";s:6:\"长安\";s:6:\"avatar\";s:131:\"https://thirdwx.qlogo.cn/mmopen/vi_32/nfhQ5ibcibez6K0lFRNXjLBJiadFJqojujGrhF1z8r45Gd4nHQhnTQQXGjyhQCvdegUrfht58AQP2Bx0syqEzpwmg/132\";s:2:\"qq\";s:0:\"\";s:3:\"vip\";s:1:\"0\";s:6:\"gender\";s:1:\"0\";s:9:\"birthyear\";s:1:\"0\";s:10:\"birthmonth\";s:1:\"0\";s:8:\"birthday\";s:1:\"0\";s:13:\"constellation\";s:0:\"\";s:6:\"zodiac\";s:0:\"\";s:9:\"telephone\";s:0:\"\";s:6:\"idcard\";s:0:\"\";s:9:\"studentid\";s:0:\"\";s:5:\"grade\";s:0:\"\";s:7:\"address\";s:0:\"\";s:7:\"zipcode\";s:0:\"\";s:11:\"nationality\";s:0:\"\";s:14:\"resideprovince\";s:3:\"省\";s:10:\"residecity\";s:3:\"市\";s:10:\"residedist\";s:0:\"\";s:14:\"graduateschool\";s:0:\"\";s:7:\"company\";s:0:\"\";s:9:\"education\";s:0:\"\";s:10:\"occupation\";s:0:\"\";s:8:\"position\";s:0:\"\";s:7:\"revenue\";s:0:\"\";s:15:\"affectivestatus\";s:0:\"\";s:10:\"lookingfor\";s:0:\"\";s:9:\"bloodtype\";s:0:\"\";s:6:\"height\";s:0:\"\";s:6:\"weight\";s:0:\"\";s:6:\"alipay\";s:0:\"\";s:3:\"msn\";s:0:\"\";s:6:\"taobao\";s:0:\"\";s:4:\"site\";s:0:\"\";s:3:\"bio\";s:0:\"\";s:8:\"interest\";s:0:\"\";s:12:\"pay_password\";s:0:\"\";s:9:\"user_from\";s:1:\"0\";}'),('we7:memberinfo:22','a:54:{s:3:\"uid\";s:2:\"22\";s:7:\"uniacid\";s:1:\"1\";s:6:\"mobile\";s:0:\"\";s:5:\"email\";s:39:\"55bc5e8f4d82c5c4135de87b2fbb4359@we7.cc\";s:8:\"password\";s:32:\"17a10411a796d2262f72e7dfb29835fd\";s:4:\"salt\";s:8:\"HKtpfPpa\";s:7:\"groupid\";s:1:\"1\";s:7:\"credit1\";d:0;s:7:\"credit2\";d:0;s:7:\"credit3\";d:0;s:7:\"credit4\";d:0;s:7:\"credit5\";d:0;s:7:\"credit6\";d:0;s:10:\"createtime\";s:10:\"1650358889\";s:8:\"realname\";s:0:\"\";s:8:\"nickname\";s:6:\"盲盒\";s:6:\"avatar\";s:130:\"https://thirdwx.qlogo.cn/mmopen/vi_32/OJDVARMlVtNRUx9rOyic88828Lk6h86CcqSqH4BhJym5vy0OkfsH0t6oFdVAzHfSndafWAdVaR2ryy6WiaSyPQyw/132\";s:2:\"qq\";s:0:\"\";s:3:\"vip\";s:1:\"0\";s:6:\"gender\";s:1:\"0\";s:9:\"birthyear\";s:1:\"0\";s:10:\"birthmonth\";s:1:\"0\";s:8:\"birthday\";s:1:\"0\";s:13:\"constellation\";s:0:\"\";s:6:\"zodiac\";s:0:\"\";s:9:\"telephone\";s:0:\"\";s:6:\"idcard\";s:0:\"\";s:9:\"studentid\";s:0:\"\";s:5:\"grade\";s:0:\"\";s:7:\"address\";s:0:\"\";s:7:\"zipcode\";s:0:\"\";s:11:\"nationality\";s:0:\"\";s:14:\"resideprovince\";s:3:\"省\";s:10:\"residecity\";s:3:\"市\";s:10:\"residedist\";s:0:\"\";s:14:\"graduateschool\";s:0:\"\";s:7:\"company\";s:0:\"\";s:9:\"education\";s:0:\"\";s:10:\"occupation\";s:0:\"\";s:8:\"position\";s:0:\"\";s:7:\"revenue\";s:0:\"\";s:15:\"affectivestatus\";s:0:\"\";s:10:\"lookingfor\";s:0:\"\";s:9:\"bloodtype\";s:0:\"\";s:6:\"height\";s:0:\"\";s:6:\"weight\";s:0:\"\";s:6:\"alipay\";s:0:\"\";s:3:\"msn\";s:0:\"\";s:6:\"taobao\";s:0:\"\";s:4:\"site\";s:0:\"\";s:3:\"bio\";s:0:\"\";s:8:\"interest\";s:0:\"\";s:12:\"pay_password\";s:0:\"\";s:9:\"user_from\";s:1:\"0\";}'),('we7:memberinfo:23','a:54:{s:3:\"uid\";s:2:\"23\";s:7:\"uniacid\";s:1:\"1\";s:6:\"mobile\";s:0:\"\";s:5:\"email\";s:39:\"facd5ea3fe2782875e0c7368015cd305@we7.cc\";s:8:\"password\";s:32:\"17a10411a796d2262f72e7dfb29835fd\";s:4:\"salt\";s:8:\"dbNuhMuG\";s:7:\"groupid\";s:1:\"1\";s:7:\"credit1\";d:0;s:7:\"credit2\";d:0;s:7:\"credit3\";d:0;s:7:\"credit4\";d:0;s:7:\"credit5\";d:0;s:7:\"credit6\";d:0;s:10:\"createtime\";s:10:\"1650358982\";s:8:\"realname\";s:0:\"\";s:8:\"nickname\";s:5:\".cium\";s:6:\"avatar\";s:130:\"https://thirdwx.qlogo.cn/mmopen/vi_32/icONDnYnxs86LNuCLM6n7YDiapgQZwPNsJ67FeSYjdA6l8A5vwO66aPupqAZBhdjcvVbN7MNWT74SnJDHr9n72LA/132\";s:2:\"qq\";s:0:\"\";s:3:\"vip\";s:1:\"0\";s:6:\"gender\";s:1:\"0\";s:9:\"birthyear\";s:1:\"0\";s:10:\"birthmonth\";s:1:\"0\";s:8:\"birthday\";s:1:\"0\";s:13:\"constellation\";s:0:\"\";s:6:\"zodiac\";s:0:\"\";s:9:\"telephone\";s:0:\"\";s:6:\"idcard\";s:0:\"\";s:9:\"studentid\";s:0:\"\";s:5:\"grade\";s:0:\"\";s:7:\"address\";s:0:\"\";s:7:\"zipcode\";s:0:\"\";s:11:\"nationality\";s:0:\"\";s:14:\"resideprovince\";s:3:\"省\";s:10:\"residecity\";s:3:\"市\";s:10:\"residedist\";s:0:\"\";s:14:\"graduateschool\";s:0:\"\";s:7:\"company\";s:0:\"\";s:9:\"education\";s:0:\"\";s:10:\"occupation\";s:0:\"\";s:8:\"position\";s:0:\"\";s:7:\"revenue\";s:0:\"\";s:15:\"affectivestatus\";s:0:\"\";s:10:\"lookingfor\";s:0:\"\";s:9:\"bloodtype\";s:0:\"\";s:6:\"height\";s:0:\"\";s:6:\"weight\";s:0:\"\";s:6:\"alipay\";s:0:\"\";s:3:\"msn\";s:0:\"\";s:6:\"taobao\";s:0:\"\";s:4:\"site\";s:0:\"\";s:3:\"bio\";s:0:\"\";s:8:\"interest\";s:0:\"\";s:12:\"pay_password\";s:0:\"\";s:9:\"user_from\";s:1:\"0\";}'),('we7:memberinfo:24','a:54:{s:3:\"uid\";s:2:\"24\";s:7:\"uniacid\";s:1:\"1\";s:6:\"mobile\";s:0:\"\";s:5:\"email\";s:39:\"491094ff5b10f820725257343190f059@we7.cc\";s:8:\"password\";s:32:\"17a10411a796d2262f72e7dfb29835fd\";s:4:\"salt\";s:8:\"ERpGNpcG\";s:7:\"groupid\";s:1:\"1\";s:7:\"credit1\";d:0;s:7:\"credit2\";d:0;s:7:\"credit3\";d:0;s:7:\"credit4\";d:0;s:7:\"credit5\";d:0;s:7:\"credit6\";d:0;s:10:\"createtime\";s:10:\"1650359767\";s:8:\"realname\";s:0:\"\";s:8:\"nickname\";s:6:\"yeong7\";s:6:\"avatar\";s:132:\"https://thirdwx.qlogo.cn/mmopen/vi_32/3nQ1r3KiaGb6J75qUXcqbibWnvfv4CzssHxIBRygtYAaTqw7u2FXhHgE3WeF5AGiacahR4YbWLXQPqeLyoW78Eicww/132\";s:2:\"qq\";s:0:\"\";s:3:\"vip\";s:1:\"0\";s:6:\"gender\";s:1:\"0\";s:9:\"birthyear\";s:1:\"0\";s:10:\"birthmonth\";s:1:\"0\";s:8:\"birthday\";s:1:\"0\";s:13:\"constellation\";s:0:\"\";s:6:\"zodiac\";s:0:\"\";s:9:\"telephone\";s:0:\"\";s:6:\"idcard\";s:0:\"\";s:9:\"studentid\";s:0:\"\";s:5:\"grade\";s:0:\"\";s:7:\"address\";s:0:\"\";s:7:\"zipcode\";s:0:\"\";s:11:\"nationality\";s:0:\"\";s:14:\"resideprovince\";s:3:\"省\";s:10:\"residecity\";s:3:\"市\";s:10:\"residedist\";s:0:\"\";s:14:\"graduateschool\";s:0:\"\";s:7:\"company\";s:0:\"\";s:9:\"education\";s:0:\"\";s:10:\"occupation\";s:0:\"\";s:8:\"position\";s:0:\"\";s:7:\"revenue\";s:0:\"\";s:15:\"affectivestatus\";s:0:\"\";s:10:\"lookingfor\";s:0:\"\";s:9:\"bloodtype\";s:0:\"\";s:6:\"height\";s:0:\"\";s:6:\"weight\";s:0:\"\";s:6:\"alipay\";s:0:\"\";s:3:\"msn\";s:0:\"\";s:6:\"taobao\";s:0:\"\";s:4:\"site\";s:0:\"\";s:3:\"bio\";s:0:\"\";s:8:\"interest\";s:0:\"\";s:12:\"pay_password\";s:0:\"\";s:9:\"user_from\";s:1:\"0\";}'),('we7:memberinfo:25','a:54:{s:3:\"uid\";s:2:\"25\";s:7:\"uniacid\";s:1:\"1\";s:6:\"mobile\";s:0:\"\";s:5:\"email\";s:39:\"587d4a3a4b2ad19cd1b19926237683db@we7.cc\";s:8:\"password\";s:32:\"17a10411a796d2262f72e7dfb29835fd\";s:4:\"salt\";s:8:\"DvVvvVHz\";s:7:\"groupid\";s:1:\"1\";s:7:\"credit1\";d:0;s:7:\"credit2\";d:0;s:7:\"credit3\";d:0;s:7:\"credit4\";d:0;s:7:\"credit5\";d:0;s:7:\"credit6\";d:0;s:10:\"createtime\";s:10:\"1650510617\";s:8:\"realname\";s:0:\"\";s:8:\"nickname\";s:2:\"·\";s:6:\"avatar\";s:133:\"https://thirdwx.qlogo.cn/mmopen/vi_32/bhYF8RK2Baic3mwtKiakYlYo1giaGlqK6hqEiaNHSN1oBplbdGFbOsG20u4IhUSGec63nNR8dgnFnCicaIcWLb7TQKg/132\";s:2:\"qq\";s:0:\"\";s:3:\"vip\";s:1:\"0\";s:6:\"gender\";s:1:\"0\";s:9:\"birthyear\";s:1:\"0\";s:10:\"birthmonth\";s:1:\"0\";s:8:\"birthday\";s:1:\"0\";s:13:\"constellation\";s:0:\"\";s:6:\"zodiac\";s:0:\"\";s:9:\"telephone\";s:0:\"\";s:6:\"idcard\";s:0:\"\";s:9:\"studentid\";s:0:\"\";s:5:\"grade\";s:0:\"\";s:7:\"address\";s:0:\"\";s:7:\"zipcode\";s:0:\"\";s:11:\"nationality\";s:0:\"\";s:14:\"resideprovince\";s:3:\"省\";s:10:\"residecity\";s:3:\"市\";s:10:\"residedist\";s:0:\"\";s:14:\"graduateschool\";s:0:\"\";s:7:\"company\";s:0:\"\";s:9:\"education\";s:0:\"\";s:10:\"occupation\";s:0:\"\";s:8:\"position\";s:0:\"\";s:7:\"revenue\";s:0:\"\";s:15:\"affectivestatus\";s:0:\"\";s:10:\"lookingfor\";s:0:\"\";s:9:\"bloodtype\";s:0:\"\";s:6:\"height\";s:0:\"\";s:6:\"weight\";s:0:\"\";s:6:\"alipay\";s:0:\"\";s:3:\"msn\";s:0:\"\";s:6:\"taobao\";s:0:\"\";s:4:\"site\";s:0:\"\";s:3:\"bio\";s:0:\"\";s:8:\"interest\";s:0:\"\";s:12:\"pay_password\";s:0:\"\";s:9:\"user_from\";s:1:\"0\";}'),('we7:memberinfo:26','a:54:{s:3:\"uid\";s:2:\"26\";s:7:\"uniacid\";s:1:\"1\";s:6:\"mobile\";s:0:\"\";s:5:\"email\";s:39:\"a038f78da942d3b2a00290b6c056d2b5@we7.cc\";s:8:\"password\";s:32:\"17a10411a796d2262f72e7dfb29835fd\";s:4:\"salt\";s:8:\"D2pyrNsg\";s:7:\"groupid\";s:1:\"1\";s:7:\"credit1\";d:0;s:7:\"credit2\";d:0;s:7:\"credit3\";d:0;s:7:\"credit4\";d:0;s:7:\"credit5\";d:0;s:7:\"credit6\";d:0;s:10:\"createtime\";s:10:\"1650515227\";s:8:\"realname\";s:0:\"\";s:8:\"nickname\";s:3:\"ᯤ\";s:6:\"avatar\";s:132:\"https://thirdwx.qlogo.cn/mmopen/vi_32/GJCc3BIV33StBWH11Oq1tWFKojW2gIoibFQTfc7e5OibVWiad1Nl9otVbC3APSvxibhrozP8vpYdyTceMtCRVAZ8ng/132\";s:2:\"qq\";s:0:\"\";s:3:\"vip\";s:1:\"0\";s:6:\"gender\";s:1:\"0\";s:9:\"birthyear\";s:1:\"0\";s:10:\"birthmonth\";s:1:\"0\";s:8:\"birthday\";s:1:\"0\";s:13:\"constellation\";s:0:\"\";s:6:\"zodiac\";s:0:\"\";s:9:\"telephone\";s:0:\"\";s:6:\"idcard\";s:0:\"\";s:9:\"studentid\";s:0:\"\";s:5:\"grade\";s:0:\"\";s:7:\"address\";s:0:\"\";s:7:\"zipcode\";s:0:\"\";s:11:\"nationality\";s:0:\"\";s:14:\"resideprovince\";s:3:\"省\";s:10:\"residecity\";s:3:\"市\";s:10:\"residedist\";s:0:\"\";s:14:\"graduateschool\";s:0:\"\";s:7:\"company\";s:0:\"\";s:9:\"education\";s:0:\"\";s:10:\"occupation\";s:0:\"\";s:8:\"position\";s:0:\"\";s:7:\"revenue\";s:0:\"\";s:15:\"affectivestatus\";s:0:\"\";s:10:\"lookingfor\";s:0:\"\";s:9:\"bloodtype\";s:0:\"\";s:6:\"height\";s:0:\"\";s:6:\"weight\";s:0:\"\";s:6:\"alipay\";s:0:\"\";s:3:\"msn\";s:0:\"\";s:6:\"taobao\";s:0:\"\";s:4:\"site\";s:0:\"\";s:3:\"bio\";s:0:\"\";s:8:\"interest\";s:0:\"\";s:12:\"pay_password\";s:0:\"\";s:9:\"user_from\";s:1:\"0\";}'),('we7:memberinfo:27','a:54:{s:3:\"uid\";s:2:\"27\";s:7:\"uniacid\";s:1:\"1\";s:6:\"mobile\";s:0:\"\";s:5:\"email\";s:39:\"77537bbf0c4432bfeb5440492804a3ec@we7.cc\";s:8:\"password\";s:32:\"17a10411a796d2262f72e7dfb29835fd\";s:4:\"salt\";s:8:\"am09BM9a\";s:7:\"groupid\";s:1:\"1\";s:7:\"credit1\";d:0;s:7:\"credit2\";d:0;s:7:\"credit3\";d:0;s:7:\"credit4\";d:0;s:7:\"credit5\";d:0;s:7:\"credit6\";d:0;s:10:\"createtime\";s:10:\"1650624497\";s:8:\"realname\";s:0:\"\";s:8:\"nickname\";s:9:\"抱米花\";s:6:\"avatar\";s:131:\"https://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eqiblJplHqjCOSFBHXR2V0hkHHF8rtVnHk0w0XE4WTPjiaS1Tjo8pDEpcxLHmPDicsGWTt8kr2YgKnUA/132\";s:2:\"qq\";s:0:\"\";s:3:\"vip\";s:1:\"0\";s:6:\"gender\";s:1:\"0\";s:9:\"birthyear\";s:1:\"0\";s:10:\"birthmonth\";s:1:\"0\";s:8:\"birthday\";s:1:\"0\";s:13:\"constellation\";s:0:\"\";s:6:\"zodiac\";s:0:\"\";s:9:\"telephone\";s:0:\"\";s:6:\"idcard\";s:0:\"\";s:9:\"studentid\";s:0:\"\";s:5:\"grade\";s:0:\"\";s:7:\"address\";s:0:\"\";s:7:\"zipcode\";s:0:\"\";s:11:\"nationality\";s:0:\"\";s:14:\"resideprovince\";s:3:\"省\";s:10:\"residecity\";s:3:\"市\";s:10:\"residedist\";s:0:\"\";s:14:\"graduateschool\";s:0:\"\";s:7:\"company\";s:0:\"\";s:9:\"education\";s:0:\"\";s:10:\"occupation\";s:0:\"\";s:8:\"position\";s:0:\"\";s:7:\"revenue\";s:0:\"\";s:15:\"affectivestatus\";s:0:\"\";s:10:\"lookingfor\";s:0:\"\";s:9:\"bloodtype\";s:0:\"\";s:6:\"height\";s:0:\"\";s:6:\"weight\";s:0:\"\";s:6:\"alipay\";s:0:\"\";s:3:\"msn\";s:0:\"\";s:6:\"taobao\";s:0:\"\";s:4:\"site\";s:0:\"\";s:3:\"bio\";s:0:\"\";s:8:\"interest\";s:0:\"\";s:12:\"pay_password\";s:0:\"\";s:9:\"user_from\";s:1:\"0\";}'),('we7:memberinfo:28','a:54:{s:3:\"uid\";s:2:\"28\";s:7:\"uniacid\";s:1:\"1\";s:6:\"mobile\";s:0:\"\";s:5:\"email\";s:39:\"5c895627f3ec8dd47e86db27335db674@we7.cc\";s:8:\"password\";s:32:\"17a10411a796d2262f72e7dfb29835fd\";s:4:\"salt\";s:8:\"OmUtuAox\";s:7:\"groupid\";s:1:\"1\";s:7:\"credit1\";d:0;s:7:\"credit2\";d:0;s:7:\"credit3\";d:0;s:7:\"credit4\";d:0;s:7:\"credit5\";d:0;s:7:\"credit6\";d:0;s:10:\"createtime\";s:10:\"1650634043\";s:8:\"realname\";s:0:\"\";s:8:\"nickname\";s:9:\"沐文梦\";s:6:\"avatar\";s:132:\"https://thirdwx.qlogo.cn/mmopen/vi_32/jK4fNcqpSU3MkTpHVN6ibpfNib05N5qMySWgMIlibHqMRhNAB6MzAM8lQspyUk5dzIcElX5fNWhiajoIK3BURHx2Ng/132\";s:2:\"qq\";s:0:\"\";s:3:\"vip\";s:1:\"0\";s:6:\"gender\";s:1:\"0\";s:9:\"birthyear\";s:1:\"0\";s:10:\"birthmonth\";s:1:\"0\";s:8:\"birthday\";s:1:\"0\";s:13:\"constellation\";s:0:\"\";s:6:\"zodiac\";s:0:\"\";s:9:\"telephone\";s:0:\"\";s:6:\"idcard\";s:0:\"\";s:9:\"studentid\";s:0:\"\";s:5:\"grade\";s:0:\"\";s:7:\"address\";s:0:\"\";s:7:\"zipcode\";s:0:\"\";s:11:\"nationality\";s:0:\"\";s:14:\"resideprovince\";s:3:\"省\";s:10:\"residecity\";s:3:\"市\";s:10:\"residedist\";s:0:\"\";s:14:\"graduateschool\";s:0:\"\";s:7:\"company\";s:0:\"\";s:9:\"education\";s:0:\"\";s:10:\"occupation\";s:0:\"\";s:8:\"position\";s:0:\"\";s:7:\"revenue\";s:0:\"\";s:15:\"affectivestatus\";s:0:\"\";s:10:\"lookingfor\";s:0:\"\";s:9:\"bloodtype\";s:0:\"\";s:6:\"height\";s:0:\"\";s:6:\"weight\";s:0:\"\";s:6:\"alipay\";s:0:\"\";s:3:\"msn\";s:0:\"\";s:6:\"taobao\";s:0:\"\";s:4:\"site\";s:0:\"\";s:3:\"bio\";s:0:\"\";s:8:\"interest\";s:0:\"\";s:12:\"pay_password\";s:0:\"\";s:9:\"user_from\";s:1:\"0\";}'),('we7:user_modules:1','a:1:{s:5:\"vp_ph\";s:3:\"all\";}'),('we7:accesstoken:1','a:2:{s:6:\"expire\";i:1650647740;s:4:\"data\";a:1:{s:5:\"token\";s:157:\"56_Hcac7k9ICstqKgZDt2mxJ105AfYH3vhIe03Rts0kUSr0LbfqTr8lBK0ThyQEO5FY50uN2espOOTn4BbIMYYKbZIENBi1ZCaRPGG0jV8LBfQhQ9NHDQiVCRnGkWd2cT6gyXnhtPxUXf6QkvTyRAMaABAIRD\";}}'),('we7:jsticket:1','a:2:{s:6:\"expire\";i:1650647740;s:4:\"data\";a:1:{s:6:\"ticket\";s:86:\"LIKLckvwlJT9cWIhEQTwfAQ04jrBrtiQ532jrEoJovMxhp7r4udbVlvv5ab7GV8WIEK33YT0_SJYUO6kfLwhbQ\";}}'),('we7:module_info:vp_ph','a:39:{s:3:\"mid\";s:2:\"13\";s:4:\"name\";s:5:\"vp_ph\";s:16:\"application_type\";s:1:\"1\";s:4:\"type\";s:5:\"other\";s:5:\"title\";s:18:\"盲盒交友变现\";s:7:\"version\";s:7:\"1.4.4.9\";s:7:\"ability\";s:18:\"盲盒交友变现\";s:11:\"description\";s:18:\"盲盒交友变现\";s:6:\"author\";s:12:\"君子源码\";s:3:\"url\";s:19:\"http://www./\";s:8:\"settings\";s:1:\"1\";s:10:\"subscribes\";a:8:{i:0;s:5:\"image\";i:1;s:9:\"subscribe\";i:2;s:11:\"unsubscribe\";i:3;s:5:\"event\";i:4;s:4:\"scan\";i:5;s:5:\"click\";i:6;s:4:\"view\";i:7;s:17:\"masssendjobfinish\";}s:7:\"handles\";a:9:{i:0;s:4:\"text\";i:1;s:5:\"image\";i:2;s:9:\"subscribe\";i:3;s:11:\"unsubscribe\";i:4;s:5:\"event\";i:5;s:4:\"scan\";i:6;s:5:\"click\";i:7;s:4:\"view\";i:8;s:17:\"masssendjobfinish\";}s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"0\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:6:\"a:0:{}\";s:13:\"title_initial\";s:1:\"M\";s:13:\"wxapp_support\";s:1:\"1\";s:15:\"welcome_support\";s:1:\"1\";s:10:\"oauth_type\";s:1:\"1\";s:14:\"webapp_support\";s:1:\"1\";s:16:\"phoneapp_support\";s:1:\"1\";s:15:\"account_support\";s:1:\"2\";s:13:\"xzapp_support\";s:1:\"0\";s:14:\"aliapp_support\";s:1:\"1\";s:4:\"logo\";s:42:\"http://162.14.96.235/addons/vp_ph/icon.jpg\";s:16:\"baiduapp_support\";s:1:\"1\";s:18:\"toutiaoapp_support\";s:1:\"1\";s:4:\"from\";s:5:\"local\";s:12:\"cloud_record\";s:1:\"0\";s:8:\"sections\";s:1:\"0\";s:5:\"label\";s:0:\"\";s:6:\"status\";s:1:\"1\";s:9:\"isdisplay\";i:1;s:7:\"preview\";s:58:\"http://162.14.96.235/addons/vp_ph/preview.jpg?v=1650640826\";s:11:\"main_module\";b:0;s:12:\"recycle_info\";a:0:{}}');
/*!40000 ALTER TABLE `ims_core_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_core_cron`
--

DROP TABLE IF EXISTS `ims_core_cron`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_core_cron` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cloudid` int(10) unsigned NOT NULL,
  `module` varchar(50) NOT NULL,
  `uniacid` int(10) unsigned NOT NULL,
  `type` tinyint(3) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `filename` varchar(50) NOT NULL,
  `lastruntime` int(10) unsigned NOT NULL,
  `nextruntime` int(10) unsigned NOT NULL,
  `weekday` tinyint(3) NOT NULL,
  `day` tinyint(3) NOT NULL,
  `hour` tinyint(3) NOT NULL,
  `minute` varchar(255) NOT NULL,
  `extra` varchar(5000) NOT NULL,
  `status` tinyint(3) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `createtime` (`createtime`),
  KEY `nextruntime` (`nextruntime`),
  KEY `uniacid` (`uniacid`),
  KEY `cloudid` (`cloudid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_core_cron`
--

LOCK TABLES `ims_core_cron` WRITE;
/*!40000 ALTER TABLE `ims_core_cron` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_core_cron` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_core_cron_record`
--

DROP TABLE IF EXISTS `ims_core_cron_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_core_cron_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `module` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `tid` int(10) unsigned NOT NULL,
  `note` varchar(500) NOT NULL,
  `tag` varchar(5000) NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `tid` (`tid`),
  KEY `module` (`module`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_core_cron_record`
--

LOCK TABLES `ims_core_cron_record` WRITE;
/*!40000 ALTER TABLE `ims_core_cron_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_core_cron_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_core_job`
--

DROP TABLE IF EXISTS `ims_core_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_core_job` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(4) NOT NULL,
  `uniacid` int(11) NOT NULL,
  `payload` varchar(255) NOT NULL,
  `status` tinyint(3) NOT NULL,
  `title` varchar(22) NOT NULL,
  `handled` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `createtime` int(11) NOT NULL,
  `updatetime` int(11) NOT NULL,
  `endtime` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `isdeleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_core_job`
--

LOCK TABLES `ims_core_job` WRITE;
/*!40000 ALTER TABLE `ims_core_job` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_core_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_core_menu`
--

DROP TABLE IF EXISTS `ims_core_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_core_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL,
  `title` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `url` varchar(255) NOT NULL,
  `append_title` varchar(30) NOT NULL,
  `append_url` varchar(255) NOT NULL,
  `displayorder` tinyint(3) unsigned NOT NULL,
  `type` varchar(15) NOT NULL,
  `is_display` tinyint(3) unsigned NOT NULL,
  `is_system` tinyint(3) unsigned NOT NULL,
  `permission_name` varchar(50) NOT NULL,
  `group_name` varchar(30) NOT NULL,
  `icon` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_core_menu`
--

LOCK TABLES `ims_core_menu` WRITE;
/*!40000 ALTER TABLE `ims_core_menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_core_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_core_menu_shortcut`
--

DROP TABLE IF EXISTS `ims_core_menu_shortcut`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_core_menu_shortcut` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL,
  `uniacid` int(10) NOT NULL,
  `modulename` varchar(100) NOT NULL,
  `displayorder` int(10) NOT NULL,
  `position` varchar(100) NOT NULL,
  `updatetime` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_core_menu_shortcut`
--

LOCK TABLES `ims_core_menu_shortcut` WRITE;
/*!40000 ALTER TABLE `ims_core_menu_shortcut` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_core_menu_shortcut` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_core_paylog`
--

DROP TABLE IF EXISTS `ims_core_paylog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_core_paylog` (
  `plid` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(20) NOT NULL,
  `uniacid` int(11) NOT NULL,
  `acid` int(10) NOT NULL,
  `openid` varchar(40) NOT NULL,
  `uniontid` varchar(64) NOT NULL,
  `tid` varchar(128) NOT NULL,
  `fee` decimal(10,2) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `module` varchar(50) NOT NULL,
  `tag` varchar(2000) NOT NULL,
  `is_usecard` tinyint(3) unsigned NOT NULL,
  `card_type` tinyint(3) unsigned NOT NULL,
  `card_id` varchar(50) NOT NULL,
  `card_fee` decimal(10,2) unsigned NOT NULL,
  `encrypt_code` varchar(100) NOT NULL,
  `is_wish` tinyint(1) NOT NULL,
  `coupon` varchar(1000) NOT NULL,
  PRIMARY KEY (`plid`),
  KEY `idx_openid` (`openid`),
  KEY `idx_tid` (`tid`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `uniontid` (`uniontid`)
) ENGINE=MyISAM AUTO_INCREMENT=68 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_core_paylog`
--

LOCK TABLES `ims_core_paylog` WRITE;
/*!40000 ALTER TABLE `ims_core_paylog` DISABLE KEYS */;
INSERT INTO `ims_core_paylog` VALUES (1,'alipay',1,1,'2','2022041719415300001360654007','COIN_17',2.00,0,'vp_ph','',0,0,'0',2.00,'',0,''),(2,'alipay',1,1,'2','2022041719425400001312084515','COIN_18',2.00,0,'vp_ph','',0,0,'0',2.00,'',0,''),(3,'wechat',1,1,'ogtiH5qGnAd5YQ0Ij4kLDbhywoY0','2022041719575700001322853028','AGENT_19',1.00,0,'vp_ph','a:2:{s:4:\"acid\";s:1:\"1\";s:3:\"uid\";s:1:\"6\";}',0,0,'0',1.00,'',0,''),(4,'wechat',1,1,'ogtiH5qGnAd5YQ0Ij4kLDbhywoY0','2022041720053000001332826660','AGENT_20',1.00,0,'vp_ph','a:2:{s:4:\"acid\";s:1:\"1\";s:3:\"uid\";s:1:\"6\";}',0,0,'0',1.00,'',0,''),(5,'wechat',1,1,'ogtiH5qGnAd5YQ0Ij4kLDbhywoY0','2022041722235400001365822645','COIN_22',2.00,0,'vp_ph','a:2:{s:4:\"acid\";s:1:\"1\";s:3:\"uid\";s:1:\"6\";}',0,0,'0',2.00,'',0,''),(6,'wechat',1,1,'ogtiH5tsdZmcA_rNnGJdbw1SOvQg','2022041810092300001378028512','COIN_24',1.00,0,'vp_ph','a:2:{s:4:\"acid\";s:1:\"1\";s:3:\"uid\";s:1:\"7\";}',0,0,'0',1.00,'',0,''),(7,'wechat',1,1,'ogtiH5tsdZmcA_rNnGJdbw1SOvQg','2022041810353500001316862822','COIN_25',1.00,0,'vp_ph','a:2:{s:4:\"acid\";s:1:\"1\";s:3:\"uid\";s:1:\"7\";}',0,0,'0',1.00,'',0,''),(8,'wechat',1,1,'ogtiH5h8R51UZvkc8iH0ck00cSuQ','2022041810370800001324263043','COIN_26',1.00,0,'vp_ph','a:2:{s:4:\"acid\";s:1:\"1\";s:3:\"uid\";s:1:\"5\";}',0,0,'0',1.00,'',0,''),(9,'alipay',1,1,'7','2022041814263400001322521022','COIN_27',1.00,0,'vp_ph','',0,0,'0',1.00,'',0,''),(10,'alipay',1,1,'7','2022041814280900001371404666','COIN_28',1.00,0,'vp_ph','',0,0,'0',1.00,'',0,''),(11,'didi',1,1,'7','2022041814295500001383615656','COIN_29',1.00,0,'vp_ph','',0,0,'0',1.00,'',0,''),(12,'didi',1,1,'7','2022041814310300001396362232','COIN_30',1.00,0,'vp_ph','',0,0,'0',1.00,'',0,''),(13,'didi',1,1,'7','2022041815172400001304885840','COIN_31',1.00,0,'vp_ph','',0,0,'0',1.00,'',0,''),(14,'didi',1,1,'7','2022041815201900001308848824','COIN_32',1.00,0,'vp_ph','',0,0,'0',1.00,'',0,''),(15,'didi',1,1,'ogtiH5tsdZmcA','rNnGJdbw1SOvQg','COIN_33',1.00,1,'vp_ph','a:1:{s:14:\"transaction_id\";s:2:\"15\";}',0,0,'0',1.00,'',0,''),(16,'didi',1,1,'7','2022041815233500001368608899','COIN_34',1.00,0,'vp_ph','',0,0,'0',1.00,'',0,''),(17,'didi',1,1,'7','2022041815282900001308691672','COIN_35',1.00,0,'vp_ph','',0,0,'0',1.00,'',0,''),(18,'didi',1,1,'7','2022041815294900001376122648','COIN_36',1.00,0,'vp_ph','',0,0,'0',1.00,'',0,''),(19,'didi',1,1,'7','2022041815311200001366224422','COIN_37',1.00,0,'vp_ph','',0,0,'0',1.00,'',0,''),(20,'didi',1,1,'7','2022041815322300001344828424','COIN_38',1.00,0,'vp_ph','',0,0,'0',1.00,'',0,''),(21,'didi',1,1,'6','2022041816014500001347744996','AGENT_39',1.00,0,'vp_ph','',0,0,'0',1.00,'',0,''),(22,'didi',1,1,'6','2022041816031700001308073446','COIN_40',1.00,0,'vp_ph','',0,0,'0',1.00,'',0,''),(23,'didi',1,1,'7','2022041816440400001359054646','AGENT_41',9.90,0,'vp_ph','',0,0,'0',9.90,'',0,''),(24,'didi',1,1,'7','2022041816444500001360704063','COIN_42',1.00,0,'vp_ph','',0,0,'0',1.00,'',0,''),(25,'didi',1,1,'ogtiH5tsdZmcA_rNnGJdbw1SOvQg','1','COIN_43',1.00,1,'vp_ph','a:1:{s:14:\"transaction_id\";s:2:\"25\";}',0,0,'0',1.00,'',0,''),(26,'didi',1,1,'ogtiH5tsdZmcA_rNnGJdbw1SOvQg','1','COIN_44',1.00,1,'vp_ph','a:1:{s:14:\"transaction_id\";s:2:\"26\";}',0,0,'0',1.00,'',0,''),(27,'didi',1,1,'ogtiH5tsdZmcA_rNnGJdbw1SOvQg','1','COIN_45',1.00,1,'vp_ph','a:1:{s:14:\"transaction_id\";s:2:\"27\";}',0,0,'0',1.00,'',0,''),(28,'didi',1,1,'ogtiH5tsdZmcA_rNnGJdbw1SOvQg','1','AGENT_46',9.90,1,'vp_ph','a:1:{s:14:\"transaction_id\";s:2:\"28\";}',0,0,'0',9.90,'',0,''),(29,'didi',1,1,'ogtiH5tsdZmcA_rNnGJdbw1SOvQg','1','COIN_47',1.00,1,'vp_ph','a:1:{s:14:\"transaction_id\";s:2:\"29\";}',0,0,'0',1.00,'',0,''),(30,'didi',1,1,'ogtiH5tsdZmcA_rNnGJdbw1SOvQg','1','COIN_48',1.00,1,'vp_ph','a:1:{s:14:\"transaction_id\";s:2:\"30\";}',0,0,'0',1.00,'',0,''),(31,'didi',1,1,'6','2022041817265800001384742224','COIN_49',1.00,0,'vp_ph','',0,0,'0',1.00,'',0,''),(32,'didi',1,1,'5','2022041817293300001371146260','AGENT_50',9.90,0,'vp_ph','',0,0,'0',9.90,'',0,''),(33,'didi',1,1,'5','2022041817294600001344529206','COIN_51',1.00,0,'vp_ph','',0,0,'0',1.00,'',0,''),(34,'didi',1,1,'5','2022041817300500001363058502','COIN_52',4.00,0,'vp_ph','',0,0,'0',4.00,'',0,''),(35,'didi',1,1,'6','2022041817452800001386234688','AGENT_53',9.90,0,'vp_ph','',0,0,'0',9.90,'',0,''),(36,'didi',1,1,'2','2022041818381600001382859882','COIN_54',1.00,0,'vp_ph','',0,0,'0',1.00,'',0,''),(37,'didi',1,1,'6','2022041820444800001383685679','COIN_55',1.00,0,'vp_ph','',0,0,'0',1.00,'',0,''),(38,'didi',1,1,'6','2022041820482400001387264747','COIN_56',6.00,0,'vp_ph','',0,0,'0',6.00,'',0,''),(39,'didi',1,1,'6','2022041820553100001399842872','COIN_57',4.00,0,'vp_ph','',0,0,'0',4.00,'',0,''),(40,'didi',1,1,'2','2022041821062700001322729436','COIN_58',1.00,0,'vp_ph','',0,0,'0',1.00,'',0,''),(41,'didi',1,1,'5','2022041821080600001346367643','AGENT_59',9.90,0,'vp_ph','',0,0,'0',9.90,'',0,''),(42,'didi',1,1,'2','2022041821100100001382662646','COIN_60',1.00,0,'vp_ph','',0,0,'0',1.00,'',0,''),(43,'didi',1,1,'6','2022041821101900001344984244','COIN_61',1.00,0,'vp_ph','',0,0,'0',1.00,'',0,''),(44,'didi',1,1,'6','2022041821255700001330247282','COIN_62',1.00,0,'vp_ph','',0,0,'0',1.00,'',0,''),(45,'didi',1,1,'10','2022041821353600001361800328','COIN_63',1.00,0,'vp_ph','',0,0,'0',1.00,'',0,''),(46,'didi',1,1,'10','2022041821463900001366608340','COIN_64',1.00,0,'vp_ph','',0,0,'0',1.00,'',0,''),(47,'didi',1,1,'10','2022041821484600001326787482','COIN_65',5.00,0,'vp_ph','',0,0,'0',5.00,'',0,''),(48,'didi',1,1,'10','2022041821491000001358989842','COIN_66',5.00,0,'vp_ph','',0,0,'0',5.00,'',0,''),(49,'didi',1,1,'5','2022041821492400001339844116','COIN_67',1.00,0,'vp_ph','',0,0,'0',1.00,'',0,''),(50,'didi',1,1,'6','2022041821511400001308242902','COIN_68',1.00,0,'vp_ph','',0,0,'0',1.00,'',0,''),(51,'didi',1,1,'2','2022041821525400001327821244','COIN_69',1.00,0,'vp_ph','',0,0,'0',1.00,'',0,''),(52,'didi',1,1,'2','2022041822053400001348485616','COIN_70',1.00,0,'vp_ph','',0,0,'0',1.00,'',0,''),(53,'didi',1,1,'ogtiH5tII9wkl2xhQTOLYtGofSdk','1','COIN_71',1.00,1,'vp_ph','a:1:{s:14:\"transaction_id\";s:2:\"53\";}',0,0,'0',1.00,'',0,''),(54,'didi',1,1,'ogtiH5hQ_tGIyDwvEtDvQghgOgtc','1','COIN_72',1.00,1,'vp_ph','a:1:{s:14:\"transaction_id\";s:2:\"54\";}',0,0,'0',1.00,'',0,''),(55,'didi',1,1,'10','2022041900352500001386449408','AGENT_73',9.90,0,'vp_ph','',0,0,'0',9.90,'',0,''),(56,'didi',1,1,'10','2022041900354100001318900886','AGENT_74',9.90,0,'vp_ph','',0,0,'0',9.90,'',0,''),(57,'didi',1,1,'ogtiH5hQ_tGIyDwvEtDvQghgOgtc','1','COIN_75',5.00,1,'vp_ph','a:1:{s:14:\"transaction_id\";s:2:\"57\";}',0,0,'0',5.00,'',0,''),(58,'didi',1,1,'10','2022041900374500001363766494','AGENT_76',9.90,0,'vp_ph','',0,0,'0',9.90,'',0,''),(59,'didi',1,1,'ogtiH5hQ_tGIyDwvEtDvQghgOgtc','1','AGENT_77',9.90,1,'vp_ph','a:1:{s:14:\"transaction_id\";s:2:\"59\";}',0,0,'0',9.90,'',0,''),(60,'didi',1,1,'6','2022041910060600001349022822','COIN_78',2.00,0,'vp_ph','',0,0,'0',2.00,'',0,''),(61,'didi',1,1,'14','2022041911122800001385112618','COIN_79',5.00,0,'vp_ph','',0,0,'0',5.00,'',0,''),(62,'didi',1,1,'oXDWr6UIjklchpwfNWcb7A_aUo6w','1','COIN_80',2.00,1,'vp_ph','a:1:{s:14:\"transaction_id\";s:2:\"62\";}',0,0,'0',2.00,'',0,''),(63,'didi',1,1,'6','2022041914035700001368718613','COIN_81',1.00,0,'vp_ph','',0,0,'0',1.00,'',0,''),(64,'didi',1,1,'6','2022041915441100001336818785','COIN_82',10.00,0,'vp_ph','',0,0,'0',10.00,'',0,''),(65,'didi',1,1,'6','2022041915443100001369842825','COIN_83',1.00,0,'vp_ph','',0,0,'0',1.00,'',0,''),(66,'didi',1,1,'6','2022041915480700001320932920','COIN_84',10.00,0,'vp_ph','',0,0,'0',10.00,'',0,''),(67,'didi',1,1,'21','2022041916593900001336283218','COIN_85',10.00,0,'vp_ph','',0,0,'0',10.00,'',0,'');
/*!40000 ALTER TABLE `ims_core_paylog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_core_performance`
--

DROP TABLE IF EXISTS `ims_core_performance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_core_performance` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) NOT NULL,
  `runtime` varchar(10) NOT NULL,
  `runurl` varchar(512) NOT NULL,
  `runsql` varchar(512) NOT NULL,
  `createtime` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_core_performance`
--

LOCK TABLES `ims_core_performance` WRITE;
/*!40000 ALTER TABLE `ims_core_performance` DISABLE KEYS */;
INSERT INTO `ims_core_performance` VALUES (1,2,'40','http://mh.fionazone.cn:88/web/index.php?c=module&a=manage-account&do=setting&module_name=vp_ph&version_id=0',' SELECT `value` FROM `ims_core_cache` WHERE `key` = :__key_1  LIMIT 1',1650270023),(2,2,'39','http://mh.fionazone.cn:88/web/index.php?c=platform&a=reply&module_name=vp_ph&version_id=0',' SELECT `value` FROM `ims_core_cache` WHERE `key` = :__key_1  LIMIT 1',1650270023),(3,2,'44','http://mh.fionazone.cn:88/web/index.php?c=module&a=manage-account&do=setting&module_name=vp_ph&version_id=0','REPLACE INTO `ims_core_cache` SET `key` = :key_6 , `value` = :value_7',1650270023);
/*!40000 ALTER TABLE `ims_core_performance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_core_queue`
--

DROP TABLE IF EXISTS `ims_core_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_core_queue` (
  `qid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `acid` int(10) unsigned NOT NULL,
  `message` varchar(2000) NOT NULL,
  `params` varchar(1000) NOT NULL,
  `keyword` varchar(1000) NOT NULL,
  `response` varchar(2000) NOT NULL,
  `module` varchar(50) NOT NULL,
  `type` tinyint(3) unsigned NOT NULL,
  `dateline` int(10) unsigned NOT NULL,
  PRIMARY KEY (`qid`),
  KEY `uniacid` (`uniacid`,`acid`),
  KEY `module` (`module`),
  KEY `dateline` (`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_core_queue`
--

LOCK TABLES `ims_core_queue` WRITE;
/*!40000 ALTER TABLE `ims_core_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_core_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_core_refundlog`
--

DROP TABLE IF EXISTS `ims_core_refundlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_core_refundlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `refund_uniontid` varchar(64) NOT NULL,
  `reason` varchar(80) NOT NULL,
  `uniontid` varchar(64) NOT NULL,
  `fee` decimal(10,2) NOT NULL,
  `status` int(2) NOT NULL,
  `is_wish` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `refund_uniontid` (`refund_uniontid`),
  KEY `uniontid` (`uniontid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_core_refundlog`
--

LOCK TABLES `ims_core_refundlog` WRITE;
/*!40000 ALTER TABLE `ims_core_refundlog` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_core_refundlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_core_resource`
--

DROP TABLE IF EXISTS `ims_core_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_core_resource` (
  `mid` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `media_id` varchar(100) NOT NULL,
  `trunk` int(10) unsigned NOT NULL,
  `type` varchar(10) NOT NULL,
  `dateline` int(10) unsigned NOT NULL,
  PRIMARY KEY (`mid`),
  KEY `acid` (`uniacid`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_core_resource`
--

LOCK TABLES `ims_core_resource` WRITE;
/*!40000 ALTER TABLE `ims_core_resource` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_core_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_core_sendsms_log`
--

DROP TABLE IF EXISTS `ims_core_sendsms_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_core_sendsms_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `content` varchar(255) NOT NULL,
  `result` varchar(255) NOT NULL,
  `createtime` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_core_sendsms_log`
--

LOCK TABLES `ims_core_sendsms_log` WRITE;
/*!40000 ALTER TABLE `ims_core_sendsms_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_core_sendsms_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_core_sessions`
--

DROP TABLE IF EXISTS `ims_core_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_core_sessions` (
  `sid` char(32) NOT NULL,
  `uniacid` int(10) unsigned NOT NULL,
  `openid` varchar(50) NOT NULL,
  `data` varchar(2000) NOT NULL,
  `expiretime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`sid`),
  UNIQUE KEY `sid` (`sid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_core_sessions`
--

LOCK TABLES `ims_core_sessions` WRITE;
/*!40000 ALTER TABLE `ims_core_sessions` DISABLE KEYS */;
INSERT INTO `ims_core_sessions` VALUES ('f486d8f2f1a100cc1108ce1b662890a0',1,'223.104.130.209','acid|s:1:\"1\";uniacid|i:1;token|a:4:{s:4:\"d73Q\";i:1650510612;s:4:\"zb5Z\";i:1650510617;s:4:\"RKNg\";i:1650510619;s:4:\"jC5C\";i:1650510621;}dest_url|s:128:\"http%3A%2F%2Fmh.fionazone.cn%3A88%2Fapp%2Findex.php%3Fi%3D1%26c%3Dentry%26fuid%3Db8bMTI%26auid%3Db8bMTI%26do%3Dindex%26m%3Dvp_ph\";oauth_openid|s:28:\"oXDWr6dx-ApsWOEV9Qn2id1NxvIM\";oauth_acid|s:1:\"1\";openid|s:28:\"oXDWr6dx-ApsWOEV9Qn2id1NxvIM\";userinfo|s:688:\"YToxMDp7czo2OiJvcGVuaWQiO3M6Mjg6Im9YRFdyNmR4LUFwc1dPRVY5UW4yaWQxTnh2SU0iO3M6ODoibmlja25hbWUiO3M6MjoiwrciO3M6Mzoic2V4IjtpOjA7czo4OiJsYW5ndWFnZSI7czowOiIiO3M6NDoiY2l0eSI7czowOiIiO3M6ODoicHJvdmluY2UiO3M6MDoiIjtzOjc6ImNvdW50cnkiO3M6MDoiIjtzOjEwOiJoZWFkaW1ndXJsIjtzOjEzMzoiaHR0cHM6Ly90aGlyZHd4LnFsb2dvLmNuL21tb3Blbi92aV8zMi9iaFlGOFJLMkJhaWMzbXd0S2lha1lsWW8xZ2lhR2xxSzZocUVpYU5IU04xb0JwbGJkR0ZiT3NHMjB1NEloVVNHZWM2M25OUjhkZ25GbkNpY2FJY1dMYjdUUUtnLzEzMiI7czo5OiJwcml2aWxlZ2UiO2E6MDp7fXM6NjoiYXZhdGFyIjtzOjEzMzoiaHR0cHM6Ly90aGlyZHd4LnFsb2dvLmNuL21tb3Blbi92aV8zMi9iaFlGOFJLMkJhaWMzbXd0S2lha1lsWW8xZ2lhR2xxSzZocUVpYU5IU04xb0JwbGJkR0ZiT3NHMjB1NEloVVNHZWM2M25OUjhkZ25GbkNpY2FJY1dMYjdUUUtnLzEzMiI7fQ==\";uid|s:2:\"25\";',1650514221),('81c32e0fff41a547b7f53409af474e75',1,'61.151.178.180','acid|s:1:\"1\";uniacid|i:1;token|a:1:{s:4:\"r080\";i:1650509186;}dest_url|s:96:\"http%3A%2F%2Fmh.fionazone.cn%3A88%2Fapp%2Findex.php%3Fi%3D1%26c%3Dentry%26do%3Dindex%26m%3Dvp_ph\";',1650512786),('e9a27692f4d554d1943f935ea9571a20',1,'61.151.178.163','acid|s:1:\"1\";uniacid|i:1;token|a:1:{s:4:\"LE7G\";i:1650381046;}dest_url|s:123:\"http%3A%2F%2Fmh.fionazone.cn%3A88%2Fapp%2Findex.php%3Fi%3D1%26c%3Dentry%26do%3Dindex%26m%3Dvp_ph%26wxref%3Dmp.weixin.qq.com\";',1650384646),('35626b4453e4c4d8679e9986455f1704',1,'61.151.207.141','acid|s:1:\"1\";uniacid|i:1;token|a:1:{s:4:\"G1J8\";i:1650361608;}dest_url|s:128:\"http%3A%2F%2Fmh.fionazone.cn%3A88%2Fapp%2Findex.php%3Fi%3D1%26c%3Dentry%26fuid%3DbcaMjY%26auid%3DbcaMjY%26do%3Dindex%26m%3Dvp_ph\";',1650365208),('acf70bc4afee2f3a7db78db310789041',1,'61.151.207.141','acid|s:1:\"1\";uniacid|i:1;token|a:1:{s:4:\"jU7i\";i:1650365024;}dest_url|s:128:\"http%3A%2F%2Fmh.fionazone.cn%3A88%2Fapp%2Findex.php%3Fi%3D1%26c%3Dentry%26fuid%3DbcaMjY%26auid%3DbcaMjY%26do%3Dindex%26m%3Dvp_ph\";',1650368624),('b5b79237c4ddcf4ba67cf6e41935c1dc',1,'61.151.178.163','acid|s:1:\"1\";uniacid|i:1;token|a:1:{s:4:\"BD6a\";i:1650365267;}dest_url|s:119:\"http%3A%2F%2Fmh.fionazone.cn%3A88%2Fapp%2Findex.php%3Fi%3D1%26c%3Dentry%26cmd%3Dufeed%26id%3D2%26do%3Dindex%26m%3Dvp_ph\";',1650368867),('f50075b95779f0ddd128c146e79daf28',1,'175.8.19.236','acid|s:1:\"1\";uniacid|i:1;token|a:6:{s:4:\"A7e3\";i:1650366350;s:4:\"pZ8T\";i:1650366351;s:4:\"E4NF\";i:1650366360;s:4:\"ySsv\";i:1650366365;s:4:\"kZ9b\";i:1650366366;s:4:\"JHh0\";i:1650366367;}dest_url|s:128:\"http%3A%2F%2Fmh.fionazone.cn%3A88%2Fapp%2Findex.php%3Fi%3D1%26c%3Dentry%26fuid%3Db8bMTI%26auid%3Db8bMTI%26do%3Dindex%26m%3Dvp_ph\";oauth_openid|s:28:\"oXDWr6fXgq2qVsUUmX4sAFOnNjkI\";oauth_acid|s:1:\"1\";openid|s:28:\"oXDWr6fXgq2qVsUUmX4sAFOnNjkI\";uid|s:2:\"17\";userinfo|s:688:\"YToxMDp7czo2OiJvcGVuaWQiO3M6Mjg6Im9YRFdyNmZYZ3EycVZzVVVtWDRzQUZPbk5qa0kiO3M6ODoibmlja25hbWUiO3M6NDoiWVBfcyI7czozOiJzZXgiO2k6MDtzOjg6Imxhbmd1YWdlIjtzOjA6IiI7czo0OiJjaXR5IjtzOjA6IiI7czo4OiJwcm92aW5jZSI7czowOiIiO3M6NzoiY291bnRyeSI7czowOiIiO3M6MTA6ImhlYWRpbWd1cmwiO3M6MTMzOiJodHRwczovL3RoaXJkd3gucWxvZ28uY24vbW1vcGVuL3ZpXzMyL1EwajRUd0dUZlRLRXBpYU5icHduTnRnQzRKVWliVjVpYnNTdm5MeHV2RDZjVFBWS21vdGN2dGFpYk9EQ1RZN09SekhoYUhtYmo2YVNIb1NFODBIVnlpY0d3UmcvMTMyIjtzOjk6InByaXZpbGVnZSI7YTowOnt9czo2OiJhdmF0YXIiO3M6MTMzOiJodHRwczovL3RoaXJkd3gucWxvZ28uY24vbW1vcGVuL3ZpXzMyL1EwajRUd0dUZlRLRXBpYU5icHduTnRnQzRKVWliVjVpYnNTdm5MeHV2RDZjVFBWS21vdGN2dGFpYk9EQ1RZN09SekhoYUhtYmo2YVNIb1NFODBIVnlpY0d3UmcvMTMyIjt9\";',1650369967),('16cc2445ce67a1154622945eb0de7def',1,'61.151.178.177','acid|s:1:\"1\";uniacid|i:1;token|a:1:{s:4:\"SZzP\";i:1650376696;}dest_url|s:155:\"http%3A%2F%2Fmh.fionazone.cn%3A88%2Fapp%2Findex.php%3Fi%3D1%26c%3Dentry%26fuid%3Db8bMTI%26auid%3Db8bMTI%26do%3Dindex%26m%3Dvp_ph%26wxref%3Dmp.weixin.qq.com\";',1650380296),('42d03a6f25b772d8a72402a8c30efb8d',1,'119.4.253.7','acid|s:1:\"1\";uniacid|i:1;token|a:6:{s:4:\"LFyG\";i:1650359138;s:4:\"T76H\";i:1650359143;s:4:\"d9N5\";i:1650359147;s:4:\"GdLz\";i:1650359151;s:4:\"BPC3\";i:1650359154;s:4:\"m2Nj\";i:1650359186;}dest_url|s:96:\"http%3A%2F%2Fmh.fionazone.cn%3A88%2Fapp%2Findex.php%3Fi%3D1%26c%3Dentry%26do%3Dindex%26m%3Dvp_ph\";oauth_openid|s:28:\"oXDWr6XqRY0QDfYOgH0y9LPpFls8\";oauth_acid|s:1:\"1\";openid|s:28:\"oXDWr6XqRY0QDfYOgH0y9LPpFls8\";uid|s:2:\"15\";userinfo|s:688:\"YToxMDp7czo2OiJvcGVuaWQiO3M6Mjg6Im9YRFdyNlhxUlkwUURmWU9nSDB5OUxQcEZsczgiO3M6ODoibmlja25hbWUiO3M6Njoi5qKm5YeMIjtzOjM6InNleCI7aTowO3M6ODoibGFuZ3VhZ2UiO3M6MDoiIjtzOjQ6ImNpdHkiO3M6MDoiIjtzOjg6InByb3ZpbmNlIjtzOjA6IiI7czo3OiJjb3VudHJ5IjtzOjA6IiI7czoxMDoiaGVhZGltZ3VybCI7czoxMzI6Imh0dHBzOi8vdGhpcmR3eC5xbG9nby5jbi9tbW9wZW4vdmlfMzIveGVqZUt5Y2RGYzdsR1d2aWJKWU8wRzZUbjJ1UFZtVVNxRFp0M1dpYXA1bXRUejVxR2VQaWJNRHlTSUpDVWNzM1hHWlpvcWliVEpnMzlEM3N1S1k4dHRIVGZ3LzEzMiI7czo5OiJwcml2aWxlZ2UiO2E6MDp7fXM6NjoiYXZhdGFyIjtzOjEzMjoiaHR0cHM6Ly90aGlyZHd4LnFsb2dvLmNuL21tb3Blbi92aV8zMi94ZWplS3ljZEZjN2xHV3ZpYkpZTzBHNlRuMnVQVm1VU3FEWnQzV2lhcDVtdFR6NXFHZVBpYk1EeVNJSkNVY3MzWEdaWm9xaWJUSmczOUQzc3VLWTh0dEhUZncvMTMyIjt9\";',1650362786),('00324f8415402f5260646896ee343db7',1,'175.18.156.169','acid|s:1:\"1\";uniacid|i:1;token|a:6:{s:4:\"TkCK\";i:1650337995;s:4:\"k26t\";i:1650337996;s:4:\"YhJa\";i:1650337999;s:4:\"en2b\";i:1650337999;s:4:\"AT75\";i:1650338009;s:4:\"s9Ri\";i:1650338010;}dest_url|s:96:\"http%3A%2F%2Fmh.fionazone.cn%3A88%2Fapp%2Findex.php%3Fi%3D1%26c%3Dentry%26do%3Dindex%26m%3Dvp_ph\";oauth_openid|s:28:\"oXDWr6UIjklchpwfNWcb7A_aUo6w\";oauth_acid|s:1:\"1\";openid|s:28:\"oXDWr6UIjklchpwfNWcb7A_aUo6w\";userinfo|s:692:\"YToxMDp7czo2OiJvcGVuaWQiO3M6Mjg6Im9YRFdyNlVJamtsY2hwd2ZOV2NiN0FfYVVvNnciO3M6ODoibmlja25hbWUiO3M6OToi56iL5rW35a6HIjtzOjM6InNleCI7aTowO3M6ODoibGFuZ3VhZ2UiO3M6MDoiIjtzOjQ6ImNpdHkiO3M6MDoiIjtzOjg6InByb3ZpbmNlIjtzOjA6IiI7czo3OiJjb3VudHJ5IjtzOjA6IiI7czoxMDoiaGVhZGltZ3VybCI7czoxMzE6Imh0dHBzOi8vdGhpcmR3eC5xbG9nby5jbi9tbW9wZW4vdmlfMzIvUTBqNFR3R1RmVElHbU9UaHdtT1dVMG9JVlZTZTd2djVvSEtiakJiRGFjRnVLV2ljcjFBQW1oUTBoODU3aWJhaWFjdWFjTVJMdVlsTWRTVkFwYU8yYVpZd0EvMTMyIjtzOjk6InByaXZpbGVnZSI7YTowOnt9czo2OiJhdmF0YXIiO3M6MTMxOiJodHRwczovL3RoaXJkd3gucWxvZ28uY24vbW1vcGVuL3ZpXzMyL1EwajRUd0dUZlRJR21PVGh3bU9XVTBvSVZWU2U3dnY1b0hLYmpCYkRhY0Z1S1dpY3IxQUFtaFEwaDg1N2liYWlhY3VhY01STHVZbE1kU1ZBcGFPMmFaWXdBLzEzMiI7fQ==\";uid|s:2:\"14\";',1650341610),('5455b14d624c98115da1e265e6b6c87a',1,'101.206.166.17','acid|s:1:\"1\";uniacid|i:1;token|a:4:{s:4:\"ubyq\";i:1650338395;s:4:\"KnX7\";i:1650338397;s:4:\"jbE2\";i:1650338399;s:4:\"NipC\";i:1650338400;}dest_url|s:96:\"http%3A%2F%2Fmh.fionazone.cn%3A88%2Fapp%2Findex.php%3Fi%3D1%26c%3Dentry%26do%3Dindex%26m%3Dvp_ph\";oauth_openid|s:28:\"oXDWr6XqRY0QDfYOgH0y9LPpFls8\";oauth_acid|s:1:\"1\";openid|s:28:\"oXDWr6XqRY0QDfYOgH0y9LPpFls8\";userinfo|s:688:\"YToxMDp7czo2OiJvcGVuaWQiO3M6Mjg6Im9YRFdyNlhxUlkwUURmWU9nSDB5OUxQcEZsczgiO3M6ODoibmlja25hbWUiO3M6Njoi5qKm5YeMIjtzOjM6InNleCI7aTowO3M6ODoibGFuZ3VhZ2UiO3M6MDoiIjtzOjQ6ImNpdHkiO3M6MDoiIjtzOjg6InByb3ZpbmNlIjtzOjA6IiI7czo3OiJjb3VudHJ5IjtzOjA6IiI7czoxMDoiaGVhZGltZ3VybCI7czoxMzI6Imh0dHBzOi8vdGhpcmR3eC5xbG9nby5jbi9tbW9wZW4vdmlfMzIveGVqZUt5Y2RGYzdsR1d2aWJKWU8wRzZUbjJ1UFZtVVNxRFp0M1dpYXA1bXRUejVxR2VQaWJNRHlTSUpDVWNzM1hHWlpvcWliVEpnMzlEM3N1S1k4dHRIVGZ3LzEzMiI7czo5OiJwcml2aWxlZ2UiO2E6MDp7fXM6NjoiYXZhdGFyIjtzOjEzMjoiaHR0cHM6Ly90aGlyZHd4LnFsb2dvLmNuL21tb3Blbi92aV8zMi94ZWplS3ljZEZjN2xHV3ZpYkpZTzBHNlRuMnVQVm1VU3FEWnQzV2lhcDVtdFR6NXFHZVBpYk1EeVNJSkNVY3MzWEdaWm9xaWJUSmczOUQzc3VLWTh0dEhUZncvMTMyIjt9\";uid|s:2:\"15\";',1650342000),('c54ecf4cb63a7369ad39cd13f4c33986',1,'61.151.178.165','acid|s:1:\"1\";uniacid|i:1;token|a:1:{s:4:\"YV58\";i:1650341197;}dest_url|s:111:\"http%3A%2F%2Fmh.fionazone.cn%3A88%2Fapp%2Findex.php%3Fi%3D1%26c%3Dentry%26cmd%3Dverify%26do%3Dadmin%26m%3Dvp_ph\";',1650344797),('380b3f2957a5f85c11fed8db77e15027',1,'61.151.207.141','acid|s:1:\"1\";uniacid|i:1;token|a:1:{s:4:\"JQ5f\";i:1650341446;}dest_url|s:96:\"http%3A%2F%2Fmh.fionazone.cn%3A88%2Fapp%2Findex.php%3Fi%3D1%26c%3Dentry%26do%3Dagent%26m%3Dvp_ph\";',1650345046),('8ac4f81bd3a0a41afeb5ecf6310485aa',1,'101.89.239.120','acid|s:1:\"1\";uniacid|i:1;token|a:1:{s:4:\"D601\";i:1650346774;}dest_url|s:334:\"http%3A%2F%2Fmh.fionazone.cn%3A88%2Fpayment%2Fdidi%2Fpay.php%3Fi%3D1%26auth%3Da6014ffc9306b54bab680cf9437527061c6c5dc7%26ps%3DeyJ0aWQiOiI2MSIsInVuaW9udGlkIjoiMjAyMjA0MTkxMTEyMjgwMDAwMTM4NTExMjYxOCIsInVzZXIiOiJvWERXcjZVSWprbGNocHdmTldjYjdBX2FVbzZ3IiwiZmVlIjoiNS4wMCIsInRpdGxlIjoiNVx1NTE0M1x1OGQyZFx1NGU3MDZcdTcyMzFcdTVmYzMifQ%253D%253D\";',1650350374),('32476929a18cdfb94d9152aa4bf0f8db',1,'223.148.94.147','acid|s:1:\"1\";uniacid|i:1;token|a:4:{s:4:\"NzQv\";i:1650349373;s:4:\"QNnl\";i:1650349376;s:4:\"jq9L\";i:1650349378;s:4:\"te1S\";i:1650349380;}dest_url|s:128:\"http%3A%2F%2Fmh.fionazone.cn%3A88%2Fapp%2Findex.php%3Fi%3D1%26c%3Dentry%26fuid%3Db8bMTI%26auid%3Db8bMTI%26do%3Dindex%26m%3Dvp_ph\";oauth_openid|s:28:\"oXDWr6ZjeqJzIOJcO8E1TPduowwY\";oauth_acid|s:1:\"1\";openid|s:28:\"oXDWr6ZjeqJzIOJcO8E1TPduowwY\";userinfo|s:684:\"YToxMDp7czo2OiJvcGVuaWQiO3M6Mjg6Im9YRFdyNlpqZXFKeklPSmNPOEUxVFBkdW93d1kiO3M6ODoibmlja25hbWUiO3M6NDoiMS4yNiI7czozOiJzZXgiO2k6MDtzOjg6Imxhbmd1YWdlIjtzOjA6IiI7czo0OiJjaXR5IjtzOjA6IiI7czo4OiJwcm92aW5jZSI7czowOiIiO3M6NzoiY291bnRyeSI7czowOiIiO3M6MTA6ImhlYWRpbWd1cmwiO3M6MTMxOiJodHRwczovL3RoaXJkd3gucWxvZ28uY24vbW1vcGVuL3ZpXzMyL1EwajRUd0dUZlRLZ0RSNWg1dkw3OFJXV1R6R3FMODlHYmlhenNMUkNaT01WaWJ5ZTFmT3NrNFphM09idlV1eGpMV3BDQkFlQnp1TFFBNU1pY1ZZb1E5NDdBLzEzMiI7czo5OiJwcml2aWxlZ2UiO2E6MDp7fXM6NjoiYXZhdGFyIjtzOjEzMToiaHR0cHM6Ly90aGlyZHd4LnFsb2dvLmNuL21tb3Blbi92aV8zMi9RMGo0VHdHVGZUS2dEUjVoNXZMNzhSV1dUekdxTDg5R2JpYXpzTFJDWk9NVmlieWUxZk9zazRaYTNPYnZVdXhqTFdwQ0JBZUJ6dUxRQTVNaWNWWW9ROTQ3QS8xMzIiO30=\";uid|s:2:\"16\";',1650352980),('c7e35dcc02938f16cb2dbb11abc12800',1,'101.206.166.17','acid|s:1:\"1\";uniacid|i:1;token|a:6:{s:4:\"yC68\";i:1650290813;s:4:\"h44T\";i:1650290817;s:4:\"CVXR\";i:1650290818;s:4:\"apXH\";i:1650290819;s:4:\"Lz9S\";i:1650290839;s:4:\"by5Y\";i:1650290840;}dest_url|s:96:\"http%3A%2F%2Fmh.fionazone.cn%3A88%2Fapp%2Findex.php%3Fi%3D1%26c%3Dentry%26do%3Dindex%26m%3Dvp_ph\";oauth_openid|s:28:\"ogtiH5tII9wkl2xhQTOLYtGofSdk\";oauth_acid|s:1:\"1\";openid|s:28:\"ogtiH5tII9wkl2xhQTOLYtGofSdk\";uid|s:1:\"2\";userinfo|s:692:\"YToxMDp7czo2OiJvcGVuaWQiO3M6Mjg6Im9ndGlINXRJSTl3a2wyeGhRVE9MWXRHb2ZTZGsiO3M6ODoibmlja25hbWUiO3M6Njoi5qKm5YeMIjtzOjM6InNleCI7aTowO3M6ODoibGFuZ3VhZ2UiO3M6MDoiIjtzOjQ6ImNpdHkiO3M6MDoiIjtzOjg6InByb3ZpbmNlIjtzOjA6IiI7czo3OiJjb3VudHJ5IjtzOjA6IiI7czoxMDoiaGVhZGltZ3VybCI7czoxMzM6Imh0dHBzOi8vdGhpcmR3eC5xbG9nby5jbi9tbW9wZW4vdmlfMzIvcFI5aWF4WTVpYXFrZzBUR2NqY2R5NmV2NHppYnc4Vlc2S0VtYjI2dXBxQjZ3OGFrZWF5aFVJbjlFdDlabW9UZFNJTTFFckxxZWliUGhLbkVLQ0tpY0M5bGFoQS8xMzIiO3M6OToicHJpdmlsZWdlIjthOjA6e31zOjY6ImF2YXRhciI7czoxMzM6Imh0dHBzOi8vdGhpcmR3eC5xbG9nby5jbi9tbW9wZW4vdmlfMzIvcFI5aWF4WTVpYXFrZzBUR2NqY2R5NmV2NHppYnc4Vlc2S0VtYjI2dXBxQjZ3OGFrZWF5aFVJbjlFdDlabW9UZFNJTTFFckxxZWliUGhLbkVLQ0tpY0M5bGFoQS8xMzIiO30=\";',1650294440),('4bd0f9b8737abfe5d160973cbd8f97c1',1,'223.149.152.209','acid|s:1:\"1\";uniacid|i:1;token|a:6:{s:4:\"sd8y\";i:1650353945;s:4:\"sI1F\";i:1650353949;s:4:\"gMw6\";i:1650353951;s:4:\"sRnP\";i:1650353953;s:4:\"did6\";i:1650353971;s:4:\"E4gI\";i:1650353973;}dest_url|s:128:\"http%3A%2F%2Fmh.fionazone.cn%3A88%2Fapp%2Findex.php%3Fi%3D1%26c%3Dentry%26fuid%3Db8bMTI%26auid%3Db8bMTI%26do%3Dindex%26m%3Dvp_ph\";oauth_openid|s:28:\"oXDWr6Zqi77HdtaHb71EtgR7PL9I\";oauth_acid|s:1:\"1\";openid|s:28:\"oXDWr6Zqi77HdtaHb71EtgR7PL9I\";userinfo|s:704:\"YToxMDp7czo2OiJvcGVuaWQiO3M6Mjg6Im9YRFdyNlpxaTc3SGR0YUhiNzFFdGdSN1BMOUkiO3M6ODoibmlja25hbWUiO3M6MTU6IuGdsOqrm+qqruqqruqrnCI7czozOiJzZXgiO2k6MDtzOjg6Imxhbmd1YWdlIjtzOjA6IiI7czo0OiJjaXR5IjtzOjA6IiI7czo4OiJwcm92aW5jZSI7czowOiIiO3M6NzoiY291bnRyeSI7czowOiIiO3M6MTA6ImhlYWRpbWd1cmwiO3M6MTMzOiJodHRwczovL3RoaXJkd3gucWxvZ28uY24vbW1vcGVuL3ZpXzMyL1VSNFB2amljeUl6RUY4MFQ2SXM2N2VKUEtEV0hoVVRqMEgzeWd1V3Q0TDVYaWJ5Z1RNZ2FEdGFDTGVRaWJmZkdjaWFpYjhZbFVwb1d2bGQxVTN3QXVPZzlqUkEvMTMyIjtzOjk6InByaXZpbGVnZSI7YTowOnt9czo2OiJhdmF0YXIiO3M6MTMzOiJodHRwczovL3RoaXJkd3gucWxvZ28uY24vbW1vcGVuL3ZpXzMyL1VSNFB2amljeUl6RUY4MFQ2SXM2N2VKUEtEV0hoVVRqMEgzeWd1V3Q0TDVYaWJ5Z1RNZ2FEdGFDTGVRaWJmZkdjaWFpYjhZbFVwb1d2bGQxVTN3QXVPZzlqUkEvMTMyIjt9\";uid|s:2:\"19\";',1650357573),('d0539281a5f8d2cac23187d04a76d190',1,'61.157.243.116','acid|s:1:\"1\";uniacid|i:1;token|a:4:{s:4:\"ddM3\";i:1650293629;s:4:\"T4m6\";i:1650293630;s:4:\"RJlZ\";i:1650293674;s:4:\"NB7b\";i:1650293675;}dest_url|s:126:\"http%3A%2F%2Fmh.fionazone.cn%3A88%2Fapp%2Findex.php%3Fi%3D1%26c%3Dentry%26fuid%3D714Ng%26auid%3D714Ng%26do%3Dindex%26m%3Dvp_ph\";oauth_openid|s:28:\"ogtiH5oVLqofZYVttr9Tbp-hXmoo\";oauth_acid|s:1:\"1\";openid|s:28:\"ogtiH5oVLqofZYVttr9Tbp-hXmoo\";userinfo|s:688:\"YToxMDp7czo2OiJvcGVuaWQiO3M6Mjg6Im9ndGlINW9WTHFvZlpZVnR0cjlUYnAtaFhtb28iO3M6ODoibmlja25hbWUiO3M6Njoi5a2k546WIjtzOjM6InNleCI7aTowO3M6ODoibGFuZ3VhZ2UiO3M6MDoiIjtzOjQ6ImNpdHkiO3M6MDoiIjtzOjg6InByb3ZpbmNlIjtzOjA6IiI7czo3OiJjb3VudHJ5IjtzOjA6IiI7czoxMDoiaGVhZGltZ3VybCI7czoxMzI6Imh0dHBzOi8vdGhpcmR3eC5xbG9nby5jbi9tbW9wZW4vdmlfMzIvenhWTjBRcWliZ2FpYk5UeldiYTV5RGliSjhDTE9INnoyb09mN01iNEdXUUZZOTMyZDRxemF2VVZ2ZDRZcTh0VDlRVkM0ZUl3NVZ2WFdhTWF1aWF6Mkh1Sm9BLzEzMiI7czo5OiJwcml2aWxlZ2UiO2E6MDp7fXM6NjoiYXZhdGFyIjtzOjEzMjoiaHR0cHM6Ly90aGlyZHd4LnFsb2dvLmNuL21tb3Blbi92aV8zMi96eFZOMFFxaWJnYWliTlR6V2JhNXlEaWJKOENMT0g2ejJvT2Y3TWI0R1dRRlk5MzJkNHF6YXZVVnZkNFlxOHRUOVFWQzRlSXc1VnZYV2FNYXVpYXoySHVKb0EvMTMyIjt9\";uid|s:2:\"12\";',1650297275),('5824d74a48acd2b867d908398a406ce2',1,'129.211.167.166','acid|s:1:\"1\";uniacid|i:1;token|a:1:{s:4:\"YhtH\";i:1650359272;}',1650362872),('a0b0a206c3f5a986ba9795b7fde14fe3',1,'223.149.215.71','acid|s:1:\"1\";uniacid|i:1;token|a:5:{s:4:\"WX4p\";i:1650359764;s:4:\"L1od\";i:1650359767;s:4:\"d33y\";i:1650359769;s:4:\"yXsG\";i:1650359771;s:4:\"hOUU\";i:1650359779;}dest_url|s:128:\"http%3A%2F%2Fmh.fionazone.cn%3A88%2Fapp%2Findex.php%3Fi%3D1%26c%3Dentry%26fuid%3Db8bMTI%26auid%3Db8bMTI%26do%3Dindex%26m%3Dvp_ph\";oauth_openid|s:28:\"oXDWr6WL4RvtewLOxVVNmdwOWO2w\";oauth_acid|s:1:\"1\";openid|s:28:\"oXDWr6WL4RvtewLOxVVNmdwOWO2w\";userinfo|s:688:\"YToxMDp7czo2OiJvcGVuaWQiO3M6Mjg6Im9YRFdyNldMNFJ2dGV3TE94VlZObWR3T1dPMnciO3M6ODoibmlja25hbWUiO3M6NjoieWVvbmc3IjtzOjM6InNleCI7aTowO3M6ODoibGFuZ3VhZ2UiO3M6MDoiIjtzOjQ6ImNpdHkiO3M6MDoiIjtzOjg6InByb3ZpbmNlIjtzOjA6IiI7czo3OiJjb3VudHJ5IjtzOjA6IiI7czoxMDoiaGVhZGltZ3VybCI7czoxMzI6Imh0dHBzOi8vdGhpcmR3eC5xbG9nby5jbi9tbW9wZW4vdmlfMzIvM25RMXIzS2lhR2I2Sjc1cVVYY3FiaWJXbnZmdjRDenNzSHhJQlJ5Z3RZQWFUcXc3dTJGWGhIZ0UzV2VGNUFHaWFjYWhSNFliV0xYUVBxZUx5b1c3OEVpY3d3LzEzMiI7czo5OiJwcml2aWxlZ2UiO2E6MDp7fXM6NjoiYXZhdGFyIjtzOjEzMjoiaHR0cHM6Ly90aGlyZHd4LnFsb2dvLmNuL21tb3Blbi92aV8zMi8zblExcjNLaWFHYjZKNzVxVVhjcWJpYldudmZ2NEN6c3NIeElCUnlndFlBYVRxdzd1MkZYaEhnRTNXZUY1QUdpYWNhaFI0WWJXTFhRUHFlTHlvVzc4RWljd3cvMTMyIjt9\";uid|s:2:\"24\";',1650363379),('4f071b848585f05c57a6d5787f903395',1,'113.108.28.61','acid|s:1:\"1\";uniacid|i:1;token|a:1:{s:4:\"OHfN\";i:1650293729;}dest_url|s:96:\"http%3A%2F%2Fmh.fionazone.cn%3A88%2Fapp%2Findex.php%3Fi%3D1%26c%3Dentry%26do%3Dindex%26m%3Dvp_ph\";',1650297329),('6e485611b5e1df404d9018f75e680832',1,'39.188.5.3','acid|s:1:\"1\";uniacid|i:1;token|a:5:{s:4:\"ZRFb\";i:1650292723;s:4:\"C5fG\";i:1650292731;s:4:\"W28W\";i:1650292733;s:4:\"Ey4R\";i:1650292736;s:4:\"R8gC\";i:1650292777;}dest_url|s:128:\"http%3A%2F%2Fmh.fionazone.cn%3A88%2Fapp%2Findex.php%3Fi%3D1%26c%3Dentry%26fuid%3Db8bMTI%26auid%3Db8bMTI%26do%3Dindex%26m%3Dvp_ph\";oauth_openid|s:28:\"ogtiH5mKTQzrRya8Yveb2esQL8d8\";oauth_acid|s:1:\"1\";openid|s:28:\"ogtiH5mKTQzrRya8Yveb2esQL8d8\";userinfo|s:684:\"YToxMDp7czo2OiJvcGVuaWQiO3M6Mjg6Im9ndGlINW1LVFF6clJ5YThZdmViMmVzUUw4ZDgiO3M6ODoibmlja25hbWUiO3M6MToiWSI7czozOiJzZXgiO2k6MDtzOjg6Imxhbmd1YWdlIjtzOjA6IiI7czo0OiJjaXR5IjtzOjA6IiI7czo4OiJwcm92aW5jZSI7czowOiIiO3M6NzoiY291bnRyeSI7czowOiIiO3M6MTA6ImhlYWRpbWd1cmwiO3M6MTMyOiJodHRwczovL3RoaXJkd3gucWxvZ28uY24vbW1vcGVuL3ZpXzMyL1E4ek1aUGFTTkYxeWZpYk5mTDNBTFVvOUFyeVVRT1pGVEpET29GRjBoV0U0dldkNzRpY2lhU2JjbHVKRzlsbGc0OVAyTVVnaWJTa0V0UEJvVXR3TWt2SGFrQS8xMzIiO3M6OToicHJpdmlsZWdlIjthOjA6e31zOjY6ImF2YXRhciI7czoxMzI6Imh0dHBzOi8vdGhpcmR3eC5xbG9nby5jbi9tbW9wZW4vdmlfMzIvUTh6TVpQYVNORjF5ZmliTmZMM0FMVW85QXJ5VVFPWkZUSkRPb0ZGMGhXRTR2V2Q3NGljaWFTYmNsdUpHOWxsZzQ5UDJNVWdpYlNrRXRQQm9VdHdNa3ZIYWtBLzEzMiI7fQ==\";uid|s:2:\"13\";',1650296377),('bda97c5ed28af75283f28738a449e88b',1,'101.89.239.238','acid|s:1:\"1\";uniacid|i:1;token|a:1:{s:4:\"e0z2\";i:1650292969;}dest_url|s:334:\"http%3A%2F%2Fmh.fionazone.cn%3A88%2Fpayment%2Fdidi%2Fpay.php%3Fi%3D1%26auth%3D151f4fc66db8d8a7e49a36a077e163fddf89d1dd%26ps%3DeyJ0aWQiOiI0MyIsInVuaW9udGlkIjoiMjAyMjA0MTgyMTEwMTkwMDAwMTM0NDk4NDI0NCIsInVzZXIiOiJvZ3RpSDVxR25BZDVZUTBJajRrTERiaHl3b1kwIiwiZmVlIjoiMS4wMCIsInRpdGxlIjoiMVx1NTE0M1x1OGQyZFx1NGU3MDFcdTcyMzFcdTVmYzMifQ%253D%253D\";',1650296569),('4b9e7bc1edb0a22821f9b01b42f76537',1,'101.206.166.17','acid|s:1:\"1\";uniacid|i:1;token|a:6:{s:4:\"Wh3D\";i:1650293611;s:4:\"z33b\";i:1650293613;s:4:\"yDXa\";i:1650293615;s:4:\"F2jd\";i:1650293617;s:4:\"TW0H\";i:1650293620;s:4:\"E87z\";i:1650293622;}dest_url|s:96:\"http%3A%2F%2Fmh.fionazone.cn%3A88%2Fapp%2Findex.php%3Fi%3D1%26c%3Dentry%26do%3Dindex%26m%3Dvp_ph\";oauth_openid|s:28:\"ogtiH5tII9wkl2xhQTOLYtGofSdk\";oauth_acid|s:1:\"1\";openid|s:28:\"ogtiH5tII9wkl2xhQTOLYtGofSdk\";uid|s:1:\"2\";userinfo|s:692:\"YToxMDp7czo2OiJvcGVuaWQiO3M6Mjg6Im9ndGlINXRJSTl3a2wyeGhRVE9MWXRHb2ZTZGsiO3M6ODoibmlja25hbWUiO3M6Njoi5qKm5YeMIjtzOjM6InNleCI7aTowO3M6ODoibGFuZ3VhZ2UiO3M6MDoiIjtzOjQ6ImNpdHkiO3M6MDoiIjtzOjg6InByb3ZpbmNlIjtzOjA6IiI7czo3OiJjb3VudHJ5IjtzOjA6IiI7czoxMDoiaGVhZGltZ3VybCI7czoxMzM6Imh0dHBzOi8vdGhpcmR3eC5xbG9nby5jbi9tbW9wZW4vdmlfMzIvcFI5aWF4WTVpYXFrZzBUR2NqY2R5NmV2NHppYnc4Vlc2S0VtYjI2dXBxQjZ3OGFrZWF5aFVJbjlFdDlabW9UZFNJTTFFckxxZWliUGhLbkVLQ0tpY0M5bGFoQS8xMzIiO3M6OToicHJpdmlsZWdlIjthOjA6e31zOjY6ImF2YXRhciI7czoxMzM6Imh0dHBzOi8vdGhpcmR3eC5xbG9nby5jbi9tbW9wZW4vdmlfMzIvcFI5aWF4WTVpYXFrZzBUR2NqY2R5NmV2NHppYnc4Vlc2S0VtYjI2dXBxQjZ3OGFrZWF5aFVJbjlFdDlabW9UZFNJTTFFckxxZWliUGhLbkVLQ0tpY0M5bGFoQS8xMzIiO30=\";',1650297222),('4784d4132c515198403adb2c5be1501e',1,'36.157.87.43','acid|s:1:\"1\";uniacid|i:1;token|a:1:{s:4:\"UD99\";i:1650354690;}',1650358290),('d9fa99311e3250f30bb673097401e862',1,'61.151.207.186','acid|s:1:\"1\";uniacid|i:1;token|a:1:{s:4:\"KBbz\";i:1650294545;}dest_url|s:155:\"http%3A%2F%2Fmh.fionazone.cn%3A88%2Fapp%2Findex.php%3Fi%3D1%26c%3Dentry%26fuid%3Db8bMTI%26auid%3Db8bMTI%26do%3Dindex%26m%3Dvp_ph%26wxref%3Dmp.weixin.qq.com\";',1650298145),('19185aba80f0292a3ab62bd647c7e956',1,'223.104.130.194','acid|s:1:\"1\";uniacid|i:1;token|a:6:{s:4:\"u6II\";i:1650597437;s:4:\"En7O\";i:1650597443;s:4:\"k8qf\";i:1650597444;s:4:\"HLDQ\";i:1650597448;s:4:\"yZXn\";i:1650597451;s:4:\"c9Qx\";i:1650597452;}dest_url|s:128:\"http%3A%2F%2Fmh.fionazone.cn%3A88%2Fapp%2Findex.php%3Fi%3D1%26c%3Dentry%26fuid%3Db8bMTI%26auid%3Db8bMTI%26do%3Dindex%26m%3Dvp_ph\";oauth_openid|s:28:\"oXDWr6UsYEzcGySOzDwJzoX6yHlI\";oauth_acid|s:1:\"1\";openid|s:28:\"oXDWr6UsYEzcGySOzDwJzoX6yHlI\";uid|s:2:\"21\";userinfo|s:688:\"YToxMDp7czo2OiJvcGVuaWQiO3M6Mjg6Im9YRFdyNlVzWUV6Y0d5U096RHdKem9YNnlIbEkiO3M6ODoibmlja25hbWUiO3M6Njoi6ZW/5a6JIjtzOjM6InNleCI7aTowO3M6ODoibGFuZ3VhZ2UiO3M6MDoiIjtzOjQ6ImNpdHkiO3M6MDoiIjtzOjg6InByb3ZpbmNlIjtzOjA6IiI7czo3OiJjb3VudHJ5IjtzOjA6IiI7czoxMDoiaGVhZGltZ3VybCI7czoxMzE6Imh0dHBzOi8vdGhpcmR3eC5xbG9nby5jbi9tbW9wZW4vdmlfMzIvbmZoUTVpYmNpYmV6NkswbEZSTlhqTEJKaWFkRkpxb2p1akdyaEYxejhyNDVHZDRuSFFoblRRUVhHanloUUN2ZGVnVXJmaHQ1OEFRUDJCeDBzeXFFenB3bWcvMTMyIjtzOjk6InByaXZpbGVnZSI7YTowOnt9czo2OiJhdmF0YXIiO3M6MTMxOiJodHRwczovL3RoaXJkd3gucWxvZ28uY24vbW1vcGVuL3ZpXzMyL25maFE1aWJjaWJlejZLMGxGUk5YakxCSmlhZEZKcW9qdWpHcmhGMXo4cjQ1R2Q0bkhRaG5UUVFYR2p5aFFDdmRlZ1VyZmh0NThBUVAyQngwc3lxRXpwd21nLzEzMiI7fQ==\";',1650601052),('4646391e5953503d3536fa4a28b1de21',1,'113.108.28.57','acid|s:1:\"1\";uniacid|i:1;token|a:1:{s:4:\"bppN\";i:1650359883;}dest_url|s:96:\"http%3A%2F%2Fmh.fionazone.cn%3A88%2Fapp%2Findex.php%3Fi%3D1%26c%3Dentry%26do%3Dindex%26m%3Dvp_ph\";',1650363483),('9e5e3fc37754bdbac88ee7ec4cda0ed8',1,'175.8.19.236','acid|s:1:\"1\";uniacid|i:1;token|a:6:{s:4:\"qnlp\";i:1650351201;s:4:\"Jp4K\";i:1650351203;s:4:\"sk6s\";i:1650351204;s:4:\"PJdX\";i:1650351206;s:4:\"RcCO\";i:1650351207;s:4:\"q3Bd\";i:1650351228;}dest_url|s:128:\"http%3A%2F%2Fmh.fionazone.cn%3A88%2Fapp%2Findex.php%3Fi%3D1%26c%3Dentry%26fuid%3Db8bMTI%26auid%3Db8bMTI%26do%3Dindex%26m%3Dvp_ph\";oauth_openid|s:28:\"oXDWr6fXgq2qVsUUmX4sAFOnNjkI\";oauth_acid|s:1:\"1\";openid|s:28:\"oXDWr6fXgq2qVsUUmX4sAFOnNjkI\";userinfo|s:688:\"YToxMDp7czo2OiJvcGVuaWQiO3M6Mjg6Im9YRFdyNmZYZ3EycVZzVVVtWDRzQUZPbk5qa0kiO3M6ODoibmlja25hbWUiO3M6NDoiWVBfcyI7czozOiJzZXgiO2k6MDtzOjg6Imxhbmd1YWdlIjtzOjA6IiI7czo0OiJjaXR5IjtzOjA6IiI7czo4OiJwcm92aW5jZSI7czowOiIiO3M6NzoiY291bnRyeSI7czowOiIiO3M6MTA6ImhlYWRpbWd1cmwiO3M6MTMzOiJodHRwczovL3RoaXJkd3gucWxvZ28uY24vbW1vcGVuL3ZpXzMyL1EwajRUd0dUZlRLRXBpYU5icHduTnRnQzRKVWliVjVpYnNTdm5MeHV2RDZjVFBWS21vdGN2dGFpYk9EQ1RZN09SekhoYUhtYmo2YVNIb1NFODBIVnlpY0d3UmcvMTMyIjtzOjk6InByaXZpbGVnZSI7YTowOnt9czo2OiJhdmF0YXIiO3M6MTMzOiJodHRwczovL3RoaXJkd3gucWxvZ28uY24vbW1vcGVuL3ZpXzMyL1EwajRUd0dUZlRLRXBpYU5icHduTnRnQzRKVWliVjVpYnNTdm5MeHV2RDZjVFBWS21vdGN2dGFpYk9EQ1RZN09SekhoYUhtYmo2YVNIb1NFODBIVnlpY0d3UmcvMTMyIjt9\";uid|s:2:\"17\";',1650354828),('46b009aecc4fb15e92b681a03337c02e',1,'223.104.52.23','acid|s:1:\"1\";uniacid|i:1;token|a:1:{s:4:\"shc1\";i:1650350239;}dest_url|s:128:\"http%3A%2F%2Fmh.fionazone.cn%3A88%2Fapp%2Findex.php%3Fi%3D1%26c%3Dentry%26fuid%3Db8bMTI%26auid%3Db8bMTI%26do%3Dindex%26m%3Dvp_ph\";',1650353839),('3b8834d8de297f085fef902f2394e712',1,'61.151.178.164','acid|s:1:\"1\";uniacid|i:1;token|a:1:{s:4:\"rzdu\";i:1650297156;}dest_url|s:334:\"http%3A%2F%2Fmh.fionazone.cn%3A88%2Fpayment%2Fdidi%2Fpay.php%3Fi%3D1%26auth%3D1de0966398999afd5b9f443485f578c9a5080571%26ps%3DeyJ0aWQiOiI0OSIsInVuaW9udGlkIjoiMjAyMjA0MTgyMTQ5MjQwMDAwMTMzOTg0NDExNiIsInVzZXIiOiJvZ3RpSDVoOFI1MVVadmtjOGlIMGNrMDBjU3VRIiwiZmVlIjoiMS4wMCIsInRpdGxlIjoiMVx1NTE0M1x1OGQyZFx1NGU3MDFcdTcyMzFcdTVmYzMifQ%253D%253D\";',1650300756),('9abefe02cd7ba63509b1cc5e57f98796',1,'101.89.19.197','acid|s:1:\"1\";uniacid|i:1;token|a:1:{s:4:\"O95b\";i:1650298367;}dest_url|s:334:\"http%3A%2F%2Fmh.fionazone.cn%3A88%2Fpayment%2Fdidi%2Fpay.php%3Fi%3D1%26auth%3D80a712cf3b271c7d9b8887f7f6a90e6ccd54229d%26ps%3DeyJ0aWQiOiI0NSIsInVuaW9udGlkIjoiMjAyMjA0MTgyMTM1MzYwMDAwMTM2MTgwMDMyOCIsInVzZXIiOiJvZ3RpSDVoUV90R0l5RHd2RXREdlFnaGdPZ3RjIiwiZmVlIjoiMS4wMCIsInRpdGxlIjoiMVx1NTE0M1x1OGQyZFx1NGU3MDFcdTcyMzFcdTVmYzMifQ%253D%253D\";',1650301967),('7139d2940b3997967afd29f4c5fc74b0',1,'61.151.178.249','acid|s:1:\"1\";uniacid|i:1;token|a:1:{s:4:\"A1f6\";i:1650298438;}dest_url|s:128:\"http%3A%2F%2Fmh.fionazone.cn%3A88%2Fapp%2Findex.php%3Fi%3D1%26c%3Dentry%26fuid%3Db8bMTI%26auid%3Db8bMTI%26do%3Dindex%26m%3Dvp_ph\";',1650302038),('0634cc2510bcd5b7448c8dba93e97326',1,'36.157.87.43','acid|s:1:\"1\";uniacid|i:1;token|a:6:{s:4:\"d6t2\";i:1650361163;s:4:\"sZuH\";i:1650361169;s:4:\"VnRy\";i:1650361171;s:4:\"YDMx\";i:1650361172;s:4:\"TCjh\";i:1650361267;s:4:\"Qd22\";i:1650361268;}dest_url|s:128:\"http%3A%2F%2Fmh.fionazone.cn%3A88%2Fapp%2Findex.php%3Fi%3D1%26c%3Dentry%26fuid%3Db8bMTI%26auid%3Db8bMTI%26do%3Dindex%26m%3Dvp_ph\";oauth_openid|s:28:\"oXDWr6fY_19_WLwOvhtGRNmJ6wag\";oauth_acid|s:1:\"1\";openid|s:28:\"oXDWr6fY_19_WLwOvhtGRNmJ6wag\";userinfo|s:684:\"YToxMDp7czo2OiJvcGVuaWQiO3M6Mjg6Im9YRFdyNmZZXzE5X1dMd092aHRHUk5tSjZ3YWciO3M6ODoibmlja25hbWUiO3M6Njoi55uy55uSIjtzOjM6InNleCI7aTowO3M6ODoibGFuZ3VhZ2UiO3M6MDoiIjtzOjQ6ImNpdHkiO3M6MDoiIjtzOjg6InByb3ZpbmNlIjtzOjA6IiI7czo3OiJjb3VudHJ5IjtzOjA6IiI7czoxMDoiaGVhZGltZ3VybCI7czoxMzA6Imh0dHBzOi8vdGhpcmR3eC5xbG9nby5jbi9tbW9wZW4vdmlfMzIvT0pEVkFSTWxWdE5SVXg5ck95aWM4ODgyOExrNmg4NkNjcVNxSDRCaEp5bTV2eTBPa2ZzSDB0Nm9GZFZBekhmU25kYWZXQWRWYVIycnl5NldpYVN5UFF5dy8xMzIiO3M6OToicHJpdmlsZWdlIjthOjA6e31zOjY6ImF2YXRhciI7czoxMzA6Imh0dHBzOi8vdGhpcmR3eC5xbG9nby5jbi9tbW9wZW4vdmlfMzIvT0pEVkFSTWxWdE5SVXg5ck95aWM4ODgyOExrNmg4NkNjcVNxSDRCaEp5bTV2eTBPa2ZzSDB0Nm9GZFZBekhmU25kYWZXQWRWYVIycnl5NldpYVN5UFF5dy8xMzIiO30=\";uid|s:2:\"22\";',1650364868),('66b7f2d569a8a842dc57fd47ff701c49',1,'61.151.178.249','acid|s:1:\"1\";uniacid|i:1;token|a:1:{s:4:\"jUUX\";i:1650301048;}dest_url|s:334:\"http%3A%2F%2Fmh.fionazone.cn%3A88%2Fpayment%2Fdidi%2Fpay.php%3Fi%3D1%26auth%3D0fe2f8e77799b4d78d3d16510fe47fa61ed5c37f%26ps%3DeyJ0aWQiOiI1NCIsInVuaW9udGlkIjoiMjAyMjA0MTgyMjA4MTEwMDAwMTMzODg2MjU4NCIsInVzZXIiOiJvZ3RpSDVoUV90R0l5RHd2RXREdlFnaGdPZ3RjIiwiZmVlIjoiMS4wMCIsInRpdGxlIjoiMVx1NTE0M1x1OGQyZFx1NGU3MDFcdTcyMzFcdTVmYzMifQ%253D%253D\";',1650304648),('eff85a65b1e15a9bed53df1479dad439',1,'61.151.179.84','acid|s:1:\"1\";uniacid|i:1;token|a:1:{s:4:\"Gn5N\";i:1650303855;}',1650307455),('305ace5489bdd3514f096592940c2455',1,'61.151.178.180','acid|s:1:\"1\";uniacid|i:1;token|a:1:{s:4:\"VOOn\";i:1650304886;}dest_url|s:334:\"http%3A%2F%2Fmh.fionazone.cn%3A88%2Fpayment%2Fdidi%2Fpay.php%3Fi%3D1%26auth%3D4bca0055d8a04ca4f556394db48e9fea5e920637%26ps%3DeyJ0aWQiOiI1NyIsInVuaW9udGlkIjoiMjAyMjA0MTkwMDM2MzMwMDAwMTM4OTg2NDQ2NiIsInVzZXIiOiJvZ3RpSDVoUV90R0l5RHd2RXREdlFnaGdPZ3RjIiwiZmVlIjoiNS4wMCIsInRpdGxlIjoiNVx1NTE0M1x1OGQyZFx1NGU3MDZcdTcyMzFcdTVmYzMifQ%253D%253D\";',1650308486),('834949942e25b22122ab74c1b55655d7',1,'101.89.239.120','acid|s:1:\"1\";uniacid|i:1;token|a:1:{s:4:\"BHsw\";i:1650305387;}dest_url|s:330:\"http%3A%2F%2Fmh.fionazone.cn%3A88%2Fpayment%2Fdidi%2Fpay.php%3Fi%3D1%26auth%3Db7c48f0b20cb4f42ed06e8c2b4905e5d520b56cb%26ps%3DeyJ0aWQiOiI1OCIsInVuaW9udGlkIjoiMjAyMjA0MTkwMDM3NDUwMDAwMTM2Mzc2NjQ5NCIsInVzZXIiOiJvZ3RpSDVoUV90R0l5RHd2RXREdlFnaGdPZ3RjIiwiZmVlIjoiOS45MCIsInRpdGxlIjoiOS45XHU1MTQzXHU4ZDJkXHU0ZTcwXHU3ZWEyXHU1YTE4In0%253D\";',1650308987),('ed6bd8c36608d5f9b66c548a98d47dce',1,'61.151.178.163','acid|s:1:\"1\";uniacid|i:1;token|a:1:{s:4:\"iQnH\";i:1650305970;}dest_url|s:330:\"http%3A%2F%2Fmh.fionazone.cn%3A88%2Fpayment%2Fdidi%2Fpay.php%3Fi%3D1%26auth%3D34466d90ec0b8960208afe8362af30d272a7e84b%26ps%3DeyJ0aWQiOiI1NSIsInVuaW9udGlkIjoiMjAyMjA0MTkwMDM1MjUwMDAwMTM4NjQ0OTQwOCIsInVzZXIiOiJvZ3RpSDVoUV90R0l5RHd2RXREdlFnaGdPZ3RjIiwiZmVlIjoiOS45MCIsInRpdGxlIjoiOS45XHU1MTQzXHU4ZDJkXHU0ZTcwXHU3ZWEyXHU1YTE4In0%253D\";',1650309570),('652f7eb6d751f1e9479a92ea0ca4a736',1,'61.151.178.164','acid|s:1:\"1\";uniacid|i:1;token|a:1:{s:4:\"ewAg\";i:1650306276;}dest_url|s:330:\"http%3A%2F%2Fmh.fionazone.cn%3A88%2Fpayment%2Fdidi%2Fpay.php%3Fi%3D1%26auth%3D55cef8dbcdc592430023d0f32f8663ee6fba1a96%26ps%3DeyJ0aWQiOiI1OSIsInVuaW9udGlkIjoiMjAyMjA0MTkwMDM4MzUwMDAwMTM2OTQ2NjQyMiIsInVzZXIiOiJvZ3RpSDVoUV90R0l5RHd2RXREdlFnaGdPZ3RjIiwiZmVlIjoiOS45MCIsInRpdGxlIjoiOS45XHU1MTQzXHU4ZDJkXHU0ZTcwXHU3ZWEyXHU1YTE4In0%253D\";',1650309876),('322fefcaf14a07d7ff74e90e16d10351',1,'117.136.0.53','acid|s:1:\"1\";uniacid|i:1;token|a:2:{s:4:\"sdZ9\";i:1650336445;s:4:\"Wn0N\";i:1650336447;}dest_url|s:96:\"http%3A%2F%2Fmh.fionazone.cn%3A88%2Fapp%2Findex.php%3Fi%3D1%26c%3Dentry%26do%3Dindex%26m%3Dvp_ph\";oauth_openid|s:28:\"ogtiH5tsdZmcA_rNnGJdbw1SOvQg\";oauth_acid|s:1:\"1\";openid|s:28:\"ogtiH5tsdZmcA_rNnGJdbw1SOvQg\";uid|s:1:\"7\";userinfo|s:692:\"YToxMDp7czo2OiJvcGVuaWQiO3M6Mjg6Im9ndGlINXRzZFptY0Ffck5uR0pkYncxU092UWciO3M6ODoibmlja25hbWUiO3M6Njoi6auY5b+XIjtzOjM6InNleCI7aTowO3M6ODoibGFuZ3VhZ2UiO3M6MDoiIjtzOjQ6ImNpdHkiO3M6MDoiIjtzOjg6InByb3ZpbmNlIjtzOjA6IiI7czo3OiJjb3VudHJ5IjtzOjA6IiI7czoxMDoiaGVhZGltZ3VybCI7czoxMzM6Imh0dHBzOi8vdGhpcmR3eC5xbG9nby5jbi9tbW9wZW4vdmlfMzIvUTBqNFR3R1RmVElZaWI0ZDY0UUJUUXhqb3lUaWNRWkZoeUNpY1pjZHBDRlZpYnBTY2d3T2F1dHN5cGlhQ2VlbTRNY2RsRzB6c09qbXhGaHBUSXhQYnozN0kyUS8xMzIiO3M6OToicHJpdmlsZWdlIjthOjA6e31zOjY6ImF2YXRhciI7czoxMzM6Imh0dHBzOi8vdGhpcmR3eC5xbG9nby5jbi9tbW9wZW4vdmlfMzIvUTBqNFR3R1RmVElZaWI0ZDY0UUJUUXhqb3lUaWNRWkZoeUNpY1pjZHBDRlZpYnBTY2d3T2F1dHN5cGlhQ2VlbTRNY2RsRzB6c09qbXhGaHBUSXhQYnozN0kyUS8xMzIiO30=\";',1650340047),('db9644fb3b7dc668f3d8404b33f1b614',1,'114.113.221.7','acid|s:1:\"1\";uniacid|i:1;token|a:1:{s:4:\"jzqm\";i:1650336987;}dest_url|s:96:\"http%3A%2F%2Fmh.fionazone.cn%3A88%2Fapp%2Findex.php%3Fi%3D1%26c%3Dentry%26do%3Dindex%26m%3Dvp_ph\";',1650340587),('f191dec1262d9e67eb6f118a4193be42',1,'101.91.62.89','acid|s:1:\"1\";uniacid|i:1;token|a:1:{s:4:\"xXPc\";i:1650333825;}dest_url|s:96:\"http%3A%2F%2Fmh.fionazone.cn%3A88%2Fapp%2Findex.php%3Fi%3D1%26c%3Dentry%26do%3Dindex%26m%3Dvp_ph\";',1650337425),('1ad55b072bb622b9e17a8ed56faba44e',1,'101.91.62.89','acid|s:1:\"1\";uniacid|i:1;token|a:1:{s:4:\"Qec4\";i:1650328130;}dest_url|s:109:\"http%3A%2F%2Fmh.fionazone.cn%3A88%2Fapp%2Findex.php%3Fi%3D1%26c%3Dentry%26cmd%3Diins%26do%3Dindex%26m%3Dvp_ph\";',1650331730),('2297d45d1b54aff2ce541c95850a2a6a',1,'61.151.178.165','acid|s:1:\"1\";uniacid|i:1;token|a:1:{s:4:\"bKRz\";i:1650328173;}dest_url|s:110:\"http%3A%2F%2Fmh.fionazone.cn%3A88%2Fapp%2Findex.php%3Fi%3D1%26c%3Dentry%26cmd%3Diouts%26do%3Dindex%26m%3Dvp_ph\";',1650331773),('9e7621c9af490ba31f45e5a212e7c064',1,'114.113.221.7','acid|s:1:\"1\";uniacid|i:1;token|a:1:{s:4:\"FP84\";i:1650330409;}dest_url|s:96:\"http%3A%2F%2Fmh.fionazone.cn%3A88%2Fapp%2Findex.php%3Fi%3D1%26c%3Dentry%26do%3Dindex%26m%3Dvp_ph\";',1650334009),('e6d85bdba450200ef472ed51ae845f89',1,'114.113.221.7','acid|s:1:\"1\";uniacid|i:1;token|a:4:{s:4:\"FV7c\";i:1650334880;s:4:\"u3Cp\";i:1650334881;s:4:\"xMHH\";i:1650334887;s:4:\"HeCC\";i:1650334891;}dest_url|s:96:\"http%3A%2F%2Fmh.fionazone.cn%3A88%2Fapp%2Findex.php%3Fi%3D1%26c%3Dentry%26do%3Dindex%26m%3Dvp_ph\";oauth_openid|s:28:\"ogtiH5tsdZmcA_rNnGJdbw1SOvQg\";oauth_acid|s:1:\"1\";openid|s:28:\"ogtiH5tsdZmcA_rNnGJdbw1SOvQg\";uid|s:1:\"7\";userinfo|s:692:\"YToxMDp7czo2OiJvcGVuaWQiO3M6Mjg6Im9ndGlINXRzZFptY0Ffck5uR0pkYncxU092UWciO3M6ODoibmlja25hbWUiO3M6Njoi6auY5b+XIjtzOjM6InNleCI7aTowO3M6ODoibGFuZ3VhZ2UiO3M6MDoiIjtzOjQ6ImNpdHkiO3M6MDoiIjtzOjg6InByb3ZpbmNlIjtzOjA6IiI7czo3OiJjb3VudHJ5IjtzOjA6IiI7czoxMDoiaGVhZGltZ3VybCI7czoxMzM6Imh0dHBzOi8vdGhpcmR3eC5xbG9nby5jbi9tbW9wZW4vdmlfMzIvUTBqNFR3R1RmVElZaWI0ZDY0UUJUUXhqb3lUaWNRWkZoeUNpY1pjZHBDRlZpYnBTY2d3T2F1dHN5cGlhQ2VlbTRNY2RsRzB6c09qbXhGaHBUSXhQYnozN0kyUS8xMzIiO3M6OToicHJpdmlsZWdlIjthOjA6e31zOjY6ImF2YXRhciI7czoxMzM6Imh0dHBzOi8vdGhpcmR3eC5xbG9nby5jbi9tbW9wZW4vdmlfMzIvUTBqNFR3R1RmVElZaWI0ZDY0UUJUUXhqb3lUaWNRWkZoeUNpY1pjZHBDRlZpYnBTY2d3T2F1dHN5cGlhQ2VlbTRNY2RsRzB6c09qbXhGaHBUSXhQYnozN0kyUS8xMzIiO30=\";',1650338585),('7b8c229c47b262c104ec0e0f86730494',1,'61.151.179.84','acid|s:1:\"1\";uniacid|i:1;token|a:1:{s:4:\"YS6b\";i:1650330800;}dest_url|s:123:\"http%3A%2F%2Fmh.fionazone.cn%3A88%2Fapp%2Findex.php%3Fi%3D1%26c%3Dentry%26do%3Dindex%26m%3Dvp_ph%26wxref%3Dmp.weixin.qq.com\";',1650334400),('4431a7cb96214ebde3022d56a8a330e3',1,'36.102.210.146','acid|s:1:\"1\";uniacid|i:1;token|a:4:{s:4:\"Hpb7\";i:1650332941;s:4:\"G8e2\";i:1650332944;s:4:\"b500\";i:1650332946;s:4:\"K9R0\";i:1650332948;}dest_url|s:96:\"http%3A%2F%2Fmh.fionazone.cn%3A88%2Fapp%2Findex.php%3Fi%3D1%26c%3Dentry%26do%3Dindex%26m%3Dvp_ph\";oauth_openid|s:28:\"ogtiH5h8R51UZvkc8iH0ck00cSuQ\";oauth_acid|s:1:\"1\";openid|s:28:\"ogtiH5h8R51UZvkc8iH0ck00cSuQ\";uid|s:1:\"5\";userinfo|s:692:\"YToxMDp7czo2OiJvcGVuaWQiO3M6Mjg6Im9ndGlINWg4UjUxVVp2a2M4aUgwY2swMGNTdVEiO3M6ODoibmlja25hbWUiO3M6OToi56iL5rW35a6HIjtzOjM6InNleCI7aTowO3M6ODoibGFuZ3VhZ2UiO3M6MDoiIjtzOjQ6ImNpdHkiO3M6MDoiIjtzOjg6InByb3ZpbmNlIjtzOjA6IiI7czo3OiJjb3VudHJ5IjtzOjA6IiI7czoxMDoiaGVhZGltZ3VybCI7czoxMzI6Imh0dHBzOi8vdGhpcmR3eC5xbG9nby5jbi9tbW9wZW4vdmlfMzIvUTBqNFR3R1RmVExwYXF2bkZ2bnpPZG9qd2hydTUyMGlieVRwWU0yWFlpYklHRkJVa1JBUWRqeWZ5N2phb3gxeEJNaWNOS3ZkZ2JyMUdBYWlieTRWdGtEWUpnLzEzMiI7czo5OiJwcml2aWxlZ2UiO2E6MDp7fXM6NjoiYXZhdGFyIjtzOjEzMjoiaHR0cHM6Ly90aGlyZHd4LnFsb2dvLmNuL21tb3Blbi92aV8zMi9RMGo0VHdHVGZUTHBhcXZuRnZuek9kb2p3aHJ1NTIwaWJ5VHBZTTJYWWliSUdGQlVrUkFRZGp5Znk3amFveDF4Qk1pY05LdmRnYnIxR0FhaWJ5NFZ0a0RZSmcvMTMyIjt9\";',1650336548),('3a95b3d8df580a7a52c4dc7ab67b1b52',1,'114.113.221.7','acid|s:1:\"1\";uniacid|i:1;token|a:1:{s:4:\"LfoF\";i:1650333020;}dest_url|s:96:\"http%3A%2F%2Fmh.fionazone.cn%3A88%2Fapp%2Findex.php%3Fi%3D1%26c%3Dentry%26do%3Dindex%26m%3Dvp_ph\";',1650336620),('ab89e94289faab296bea08eb5f266036',1,'61.151.178.164','acid|s:1:\"1\";uniacid|i:1;token|a:1:{s:4:\"V22L\";i:1650292382;}dest_url|s:96:\"http%3A%2F%2Fmh.fionazone.cn%3A88%2Fapp%2Findex.php%3Fi%3D1%26c%3Dentry%26do%3Dindex%26m%3Dvp_ph\";',1650295982),('50512df1ae0433c654fb6b23c06a38f7',1,'112.17.240.87','acid|s:1:\"1\";uniacid|i:1;token|a:4:{s:4:\"WSoU\";i:1650356257;s:4:\"zb2y\";i:1650356262;s:4:\"n949\";i:1650356264;s:4:\"F33Q\";i:1650356266;}dest_url|s:128:\"http%3A%2F%2Fmh.fionazone.cn%3A88%2Fapp%2Findex.php%3Fi%3D1%26c%3Dentry%26fuid%3Db8bMTI%26auid%3Db8bMTI%26do%3Dindex%26m%3Dvp_ph\";oauth_openid|s:28:\"oXDWr6S5QzBKPvxxpCNqSPyujbLQ\";oauth_acid|s:1:\"1\";openid|s:28:\"oXDWr6S5QzBKPvxxpCNqSPyujbLQ\";userinfo|s:684:\"YToxMDp7czo2OiJvcGVuaWQiO3M6Mjg6Im9YRFdyNlM1UXpCS1B2eHhwQ05xU1B5dWpiTFEiO3M6ODoibmlja25hbWUiO3M6NjoiVGVhcnMuIjtzOjM6InNleCI7aTowO3M6ODoibGFuZ3VhZ2UiO3M6MDoiIjtzOjQ6ImNpdHkiO3M6MDoiIjtzOjg6InByb3ZpbmNlIjtzOjA6IiI7czo3OiJjb3VudHJ5IjtzOjA6IiI7czoxMDoiaGVhZGltZ3VybCI7czoxMzA6Imh0dHBzOi8vdGhpcmR3eC5xbG9nby5jbi9tbW9wZW4vdmlfMzIveWVmaGNETE8wN2VwNmNZQUduRTNNUlpxZ2FxNWMxaWNkMlA4RlZEUWdzcG9tRTM4ZGI0WDlJTlhZQlhFaWI5NmwwV1hDTGI4NjVCNVhmVjF2UTQ0WldGdy8xMzIiO3M6OToicHJpdmlsZWdlIjthOjA6e31zOjY6ImF2YXRhciI7czoxMzA6Imh0dHBzOi8vdGhpcmR3eC5xbG9nby5jbi9tbW9wZW4vdmlfMzIveWVmaGNETE8wN2VwNmNZQUduRTNNUlpxZ2FxNWMxaWNkMlA4RlZEUWdzcG9tRTM4ZGI0WDlJTlhZQlhFaWI5NmwwV1hDTGI4NjVCNVhmVjF2UTQ0WldGdy8xMzIiO30=\";uid|s:2:\"20\";',1650359866),('1a7a13f4eef7153406b5433cc4fa5c6e',1,'223.104.61.111','acid|s:1:\"1\";uniacid|i:1;token|a:6:{s:4:\"uFU7\";i:1650358977;s:4:\"x2Hr\";i:1650358982;s:4:\"utwa\";i:1650358984;s:4:\"LxiI\";i:1650358988;s:4:\"Oqip\";i:1650358997;s:4:\"sBBX\";i:1650358999;}dest_url|s:128:\"http%3A%2F%2Fmh.fionazone.cn%3A88%2Fapp%2Findex.php%3Fi%3D1%26c%3Dentry%26fuid%3Db8bMTI%26auid%3Db8bMTI%26do%3Dindex%26m%3Dvp_ph\";oauth_openid|s:28:\"oXDWr6UHVH5HjioRo9TP7i5os9TU\";oauth_acid|s:1:\"1\";openid|s:28:\"oXDWr6UHVH5HjioRo9TP7i5os9TU\";userinfo|s:684:\"YToxMDp7czo2OiJvcGVuaWQiO3M6Mjg6Im9YRFdyNlVIVkg1SGppb1JvOVRQN2k1b3M5VFUiO3M6ODoibmlja25hbWUiO3M6NToiLmNpdW0iO3M6Mzoic2V4IjtpOjA7czo4OiJsYW5ndWFnZSI7czowOiIiO3M6NDoiY2l0eSI7czowOiIiO3M6ODoicHJvdmluY2UiO3M6MDoiIjtzOjc6ImNvdW50cnkiO3M6MDoiIjtzOjEwOiJoZWFkaW1ndXJsIjtzOjEzMDoiaHR0cHM6Ly90aGlyZHd4LnFsb2dvLmNuL21tb3Blbi92aV8zMi9pY09ORG5ZbnhzODZMTnVDTE02bjdZRGlhcGdRWndQTnNKNjdGZVNZamRBNmw4QTV2d082NmFQdXBxQVpCaGRqY3ZWYk43TU5XVDc0U25KREhyOW43MkxBLzEzMiI7czo5OiJwcml2aWxlZ2UiO2E6MDp7fXM6NjoiYXZhdGFyIjtzOjEzMDoiaHR0cHM6Ly90aGlyZHd4LnFsb2dvLmNuL21tb3Blbi92aV8zMi9pY09ORG5ZbnhzODZMTnVDTE02bjdZRGlhcGdRWndQTnNKNjdGZVNZamRBNmw4QTV2d082NmFQdXBxQVpCaGRqY3ZWYk43TU5XVDc0U25KREhyOW43MkxBLzEzMiI7fQ==\";uid|s:2:\"23\";',1650362599),('a107512ad0ebae0715568e0d7d6383d5',1,'223.149.111.248','acid|s:1:\"1\";uniacid|i:1;token|a:6:{s:4:\"MyYy\";i:1650352226;s:4:\"E478\";i:1650352230;s:4:\"r38E\";i:1650352232;s:4:\"aXXl\";i:1650352237;s:4:\"pJ1u\";i:1650352269;s:4:\"wd5T\";i:1650352272;}dest_url|s:128:\"http%3A%2F%2Fmh.fionazone.cn%3A88%2Fapp%2Findex.php%3Fi%3D1%26c%3Dentry%26fuid%3Db8bMTI%26auid%3Db8bMTI%26do%3Dindex%26m%3Dvp_ph\";oauth_openid|s:28:\"oXDWr6YawEyPNMlud1GjC1rD-CBI\";oauth_acid|s:1:\"1\";openid|s:28:\"oXDWr6YawEyPNMlud1GjC1rD-CBI\";userinfo|s:712:\"YToxMDp7czo2OiJvcGVuaWQiO3M6Mjg6Im9YRFdyNllhd0V5UE5NbHVkMUdqQzFyRC1DQkkiO3M6ODoibmlja25hbWUiO3M6MjQ6IuS4jeeYpuWIsOS4gOeZvuS4jeaUueWQjSI7czozOiJzZXgiO2k6MDtzOjg6Imxhbmd1YWdlIjtzOjA6IiI7czo0OiJjaXR5IjtzOjA6IiI7czo4OiJwcm92aW5jZSI7czowOiIiO3M6NzoiY291bnRyeSI7czowOiIiO3M6MTA6ImhlYWRpbWd1cmwiO3M6MTMxOiJodHRwczovL3RoaXJkd3gucWxvZ28uY24vbW1vcGVuL3ZpXzMyL1lTdjR0RkxlaWEzQkxZdlhJOXBBbWJDaEsyQ05GUVppYW8xanF4ZWEwQjE5Ukd4NFhoMmJDaEZYSENBY1dKZDJHd3g2cEZVbGliMllWWk91TUlOV2Q0UGR3LzEzMiI7czo5OiJwcml2aWxlZ2UiO2E6MDp7fXM6NjoiYXZhdGFyIjtzOjEzMToiaHR0cHM6Ly90aGlyZHd4LnFsb2dvLmNuL21tb3Blbi92aV8zMi9ZU3Y0dEZMZWlhM0JMWXZYSTlwQW1iQ2hLMkNORlFaaWFvMWpxeGVhMEIxOVJHeDRYaDJiQ2hGWEhDQWNXSmQyR3d4NnBGVWxpYjJZVlpPdU1JTldkNFBkdy8xMzIiO30=\";uid|s:2:\"18\";',1650355872),('820323c5f40d14a92c1da87be6f9c779',1,'39.144.190.100','acid|s:1:\"1\";uniacid|i:1;token|a:6:{s:4:\"gsKS\";i:1650515223;s:4:\"ExY7\";i:1650515227;s:4:\"Xfe9\";i:1650515229;s:4:\"hJta\";i:1650515232;s:4:\"mNkE\";i:1650515274;s:4:\"UvSv\";i:1650515282;}dest_url|s:128:\"http%3A%2F%2Fmh.fionazone.cn%3A88%2Fapp%2Findex.php%3Fi%3D1%26c%3Dentry%26fuid%3Db8bMTI%26auid%3Db8bMTI%26do%3Dindex%26m%3Dvp_ph\";oauth_openid|s:28:\"oXDWr6eX33VX9v3yE6Kk2guvqyCk\";oauth_acid|s:1:\"1\";openid|s:28:\"oXDWr6eX33VX9v3yE6Kk2guvqyCk\";userinfo|s:684:\"YToxMDp7czo2OiJvcGVuaWQiO3M6Mjg6Im9YRFdyNmVYMzNWWDl2M3lFNktrMmd1dnF5Q2siO3M6ODoibmlja25hbWUiO3M6Mzoi4a+kIjtzOjM6InNleCI7aTowO3M6ODoibGFuZ3VhZ2UiO3M6MDoiIjtzOjQ6ImNpdHkiO3M6MDoiIjtzOjg6InByb3ZpbmNlIjtzOjA6IiI7czo3OiJjb3VudHJ5IjtzOjA6IiI7czoxMDoiaGVhZGltZ3VybCI7czoxMzI6Imh0dHBzOi8vdGhpcmR3eC5xbG9nby5jbi9tbW9wZW4vdmlfMzIvR0pDYzNCSVYzM1N0QldIMTFPcTF0V0ZLb2pXMmdJb2liRlFUZmM3ZTVPaWJWV2lhZDFObDlvdFZiQzNBUFN2eGliaHJvelA4dnBZZHlUY2VNdENSVkFaOG5nLzEzMiI7czo5OiJwcml2aWxlZ2UiO2E6MDp7fXM6NjoiYXZhdGFyIjtzOjEzMjoiaHR0cHM6Ly90aGlyZHd4LnFsb2dvLmNuL21tb3Blbi92aV8zMi9HSkNjM0JJVjMzU3RCV0gxMU9xMXRXRktvalcyZ0lvaWJGUVRmYzdlNU9pYlZXaWFkMU5sOW90VmJDM0FQU3Z4aWJocm96UDh2cFlkeVRjZU10Q1JWQVo4bmcvMTMyIjt9\";uid|s:2:\"26\";',1650518882),('e606ed71e69f627b44747a5e9625b93c',1,'101.89.239.245','acid|s:1:\"1\";uniacid|i:1;token|a:1:{s:4:\"lHE8\";i:1650603421;}dest_url|s:96:\"http%3A%2F%2Fmh.fionazone.cn%3A88%2Fapp%2Findex.php%3Fi%3D1%26c%3Dentry%26do%3Dagent%26m%3Dvp_ph\";',1650607021),('9cf4b85cc952d6abf2c5f99321a28e85',1,'61.151.178.180','acid|s:1:\"1\";uniacid|i:1;token|a:1:{s:4:\"hMmx\";i:1650603500;}dest_url|s:128:\"http%3A%2F%2Fmh.fionazone.cn%3A88%2Fapp%2Findex.php%3Fi%3D1%26c%3Dentry%26fuid%3Db8bMTI%26auid%3Db8bMTI%26do%3Dindex%26m%3Dvp_ph\";',1650607100),('c70874229d83f09f059f7d1783d8495f',1,'223.147.22.102','acid|s:1:\"1\";uniacid|i:1;token|a:6:{s:4:\"IZ06\";i:1650624497;s:4:\"lF7w\";i:1650624498;s:4:\"c3NS\";i:1650624500;s:4:\"PyVC\";i:1650624508;s:4:\"OX3x\";i:1650624523;s:4:\"FsIT\";i:1650624523;}dest_url|s:128:\"http%3A%2F%2Fmh.fionazone.cn%3A88%2Fapp%2Findex.php%3Fi%3D1%26c%3Dentry%26fuid%3Db8bMTI%26auid%3Db8bMTI%26do%3Dindex%26m%3Dvp_ph\";oauth_openid|s:28:\"oXDWr6ZZwNDPKTxb4OJOprBrl3AY\";oauth_acid|s:1:\"1\";openid|s:28:\"oXDWr6ZZwNDPKTxb4OJOprBrl3AY\";userinfo|s:692:\"YToxMDp7czo2OiJvcGVuaWQiO3M6Mjg6Im9YRFdyNlpad05EUEtUeGI0T0pPcHJCcmwzQVkiO3M6ODoibmlja25hbWUiO3M6OToi5oqx57Gz6IqxIjtzOjM6InNleCI7aTowO3M6ODoibGFuZ3VhZ2UiO3M6MDoiIjtzOjQ6ImNpdHkiO3M6MDoiIjtzOjg6InByb3ZpbmNlIjtzOjA6IiI7czo3OiJjb3VudHJ5IjtzOjA6IiI7czoxMDoiaGVhZGltZ3VybCI7czoxMzE6Imh0dHBzOi8vdGhpcmR3eC5xbG9nby5jbi9tbW9wZW4vdmlfMzIvRFlBSU9ncTgzZXFpYmxKcGxIcWpDT1NGQkhYUjJWMGhrSEhGOHJ0Vm5IazB3MFhFNFdUUGppYVMxVGpvOHBERXBjeExIbVBEaWNzR1dUdDhrcjJZZ0tuVUEvMTMyIjtzOjk6InByaXZpbGVnZSI7YTowOnt9czo2OiJhdmF0YXIiO3M6MTMxOiJodHRwczovL3RoaXJkd3gucWxvZ28uY24vbW1vcGVuL3ZpXzMyL0RZQUlPZ3E4M2VxaWJsSnBsSHFqQ09TRkJIWFIyVjBoa0hIRjhydFZuSGswdzBYRTRXVFBqaWFTMVRqbzhwREVwY3hMSG1QRGljc0dXVHQ4a3IyWWdLblVBLzEzMiI7fQ==\";uid|s:2:\"27\";',1650628123),('87cd15c2f034e435f62c8ed1d55cbed2',1,'61.151.179.84','acid|s:1:\"1\";uniacid|i:1;token|a:1:{s:4:\"fhKb\";i:1650630747;}dest_url|s:96:\"http%3A%2F%2Fmh.fionazone.cn%3A88%2Fapp%2Findex.php%3Fi%3D1%26c%3Dentry%26do%3Dagent%26m%3Dvp_ph\";',1650634347),('7e23e9a5ba55f78766f1af6dcfb8683e',1,'61.151.178.197','acid|s:1:\"1\";uniacid|i:1;token|a:1:{s:4:\"vs4b\";i:1650631338;}dest_url|s:155:\"http%3A%2F%2Fmh.fionazone.cn%3A88%2Fapp%2Findex.php%3Fi%3D1%26c%3Dentry%26fuid%3Db8bMTI%26auid%3Db8bMTI%26do%3Dindex%26m%3Dvp_ph%26wxref%3Dmp.weixin.qq.com\";',1650634938),('285d92cd5b0c311a88b987ebc9e065e8',1,'106.18.171.215','acid|s:1:\"1\";uniacid|i:1;token|a:6:{s:4:\"wHl7\";i:1650634061;s:4:\"JeKK\";i:1650634083;s:4:\"wC7i\";i:1650634099;s:4:\"fl9K\";i:1650634100;s:4:\"y94Y\";i:1650634102;s:4:\"UDUW\";i:1650634103;}dest_url|s:128:\"http%3A%2F%2Fmh.fionazone.cn%3A88%2Fapp%2Findex.php%3Fi%3D1%26c%3Dentry%26fuid%3Db8bMTI%26auid%3Db8bMTI%26do%3Dindex%26m%3Dvp_ph\";oauth_openid|s:28:\"oXDWr6djJz7_IMn__9lp3v7CQO1w\";oauth_acid|s:1:\"1\";openid|s:28:\"oXDWr6djJz7_IMn__9lp3v7CQO1w\";userinfo|s:692:\"YToxMDp7czo2OiJvcGVuaWQiO3M6Mjg6Im9YRFdyNmRqSno3X0lNbl9fOWxwM3Y3Q1FPMXciO3M6ODoibmlja25hbWUiO3M6OToi5rKQ5paH5qKmIjtzOjM6InNleCI7aTowO3M6ODoibGFuZ3VhZ2UiO3M6MDoiIjtzOjQ6ImNpdHkiO3M6MDoiIjtzOjg6InByb3ZpbmNlIjtzOjA6IiI7czo3OiJjb3VudHJ5IjtzOjA6IiI7czoxMDoiaGVhZGltZ3VybCI7czoxMzI6Imh0dHBzOi8vdGhpcmR3eC5xbG9nby5jbi9tbW9wZW4vdmlfMzIvaks0Zk5jcXBTVTNNa1RwSFZONmlicGZOaWIwNU41cU15U1dnTUlsaWJIcU1SaE5BQjZNekFNOGxRc3B5VWs1ZHpJY0VsWDVmTldoaWFqb0lLM0JVUkh4Mk5nLzEzMiI7czo5OiJwcml2aWxlZ2UiO2E6MDp7fXM6NjoiYXZhdGFyIjtzOjEzMjoiaHR0cHM6Ly90aGlyZHd4LnFsb2dvLmNuL21tb3Blbi92aV8zMi9qSzRmTmNxcFNVM01rVHBIVk42aWJwZk5pYjA1TjVxTXlTV2dNSWxpYkhxTVJoTkFCNk16QU04bFFzcHlVazVkekljRWxYNWZOV2hpYWpvSUszQlVSSHgyTmcvMTMyIjt9\";uid|s:2:\"28\";',1650637703),('eefcc92c4f462f2412d9c6f45e9d5d90',1,'101.206.169.184','acid|s:1:\"1\";uniacid|i:1;token|a:6:{s:4:\"SdD6\";i:1650641233;s:4:\"Cv3t\";i:1650641235;s:4:\"t7fF\";i:1650641237;s:4:\"a2ES\";i:1650641242;s:4:\"XFh2\";i:1650641251;s:4:\"Q0p0\";i:1650641252;}dest_url|s:89:\"http%3A%2F%2F162.14.96.235%2Fapp%2Findex.php%3Fi%3D1%26c%3Dentry%26do%3Dindex%26m%3Dvp_ph\";oauth_openid|s:28:\"ogtiH5tII9wkl2xhQTOLYtGofSdk\";oauth_acid|s:1:\"1\";openid|s:28:\"ogtiH5tII9wkl2xhQTOLYtGofSdk\";uid|s:1:\"2\";userinfo|s:688:\"YToxMDp7czo2OiJvcGVuaWQiO3M6Mjg6Im9ndGlINXRJSTl3a2wyeGhRVE9MWXRHb2ZTZGsiO3M6ODoibmlja25hbWUiO3M6Njoi5qKm5YeMIjtzOjM6InNleCI7aTowO3M6ODoibGFuZ3VhZ2UiO3M6MDoiIjtzOjQ6ImNpdHkiO3M6MDoiIjtzOjg6InByb3ZpbmNlIjtzOjA6IiI7czo3OiJjb3VudHJ5IjtzOjA6IiI7czoxMDoiaGVhZGltZ3VybCI7czoxMzE6Imh0dHBzOi8vdGhpcmR3eC5xbG9nby5jbi9tbW9wZW4vdmlfMzIvcFI5aWF4WTVpYXFrZzBUR2NqY2R5NmV2NHppYnc4Vlc2S0VtYjI2dXBxQjZ3OGFrZWF5aFVJbjlFdDlabW9UZFNJTXVQc0RUWjdwbUZnQ3hjem9na0w5T3cvMTMyIjtzOjk6InByaXZpbGVnZSI7YTowOnt9czo2OiJhdmF0YXIiO3M6MTMxOiJodHRwczovL3RoaXJkd3gucWxvZ28uY24vbW1vcGVuL3ZpXzMyL3BSOWlheFk1aWFxa2cwVEdjamNkeTZldjR6aWJ3OFZXNktFbWIyNnVwcUI2dzhha2VheWhVSW45RXQ5Wm1vVGRTSU11UHNEVFo3cG1GZ0N4Y3pvZ2tMOU93LzEzMiI7fQ==\";',1650644852),('ddd381ed0476497bee338b7aa0c24500',1,'113.96.15.135','acid|s:1:\"1\";uniacid|i:1;token|a:1:{s:4:\"h37z\";i:1650641131;}dest_url|s:89:\"http%3A%2F%2F162.14.96.235%2Fapp%2Findex.php%3Fi%3D1%26c%3Dentry%26do%3Dagent%26m%3Dvp_ph\";',1650644731),('222c8ac7c1b591385a4a835316492106',1,'101.91.62.89','acid|s:1:\"1\";uniacid|i:1;token|a:1:{s:4:\"J0Cj\";i:1650647176;}dest_url|s:116:\"http%3A%2F%2F162.14.96.235%2Fapp%2Findex.php%3Fi%3D1%26c%3Dentry%26do%3Dindex%26m%3Dvp_ph%26wxref%3Dmp.weixin.qq.com\";',1650650776),('c599cef6f70afe72197520647cc52c5a',1,'101.91.60.108','acid|s:1:\"1\";uniacid|i:1;token|a:1:{s:4:\"B6DB\";i:1650648464;}dest_url|s:104:\"http%3A%2F%2F162.14.96.235%2Fapp%2Findex.php%3Fi%3D1%26c%3Dentry%26cmd%3Dmatch1%26do%3Dindex%26m%3Dvp_ph\";',1650652064);
/*!40000 ALTER TABLE `ims_core_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_core_settings`
--

DROP TABLE IF EXISTS `ims_core_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_core_settings` (
  `key` varchar(200) NOT NULL,
  `value` mediumtext NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_core_settings`
--

LOCK TABLES `ims_core_settings` WRITE;
/*!40000 ALTER TABLE `ims_core_settings` DISABLE KEYS */;
INSERT INTO `ims_core_settings` VALUES ('copyright','a:1:{s:6:\"slides\";a:3:{i:0;s:58:\"https://img.alicdn.com/tps/TB1pfG4IFXXXXc6XXXXXXXXXXXX.jpg\";i:1;s:58:\"https://img.alicdn.com/tps/TB1sXGYIFXXXXc5XpXXXXXXXXXX.jpg\";i:2;s:58:\"https://img.alicdn.com/tps/TB1h9xxIFXXXXbKXXXXXXXXXXXX.jpg\";}}'),('authmode','i:1;'),('close','a:2:{s:6:\"status\";s:1:\"0\";s:6:\"reason\";s:0:\"\";}'),('register','a:4:{s:4:\"open\";i:1;s:6:\"verify\";i:0;s:4:\"code\";i:1;s:7:\"groupid\";i:1;}'),('site','a:6:{s:3:\"key\";i:505344;s:5:\"token\";s:32:\"0765a9fbf4565c283e94207c8e6aedfe\";s:3:\"url\";s:21:\"http://cpdd.zmwym.com\";s:7:\"version\";s:5:\"2.0.0\";s:6:\"family\";s:1:\"x\";s:4:\"type\";s:8:\"register\";}'),('module_receive_ban','a:0:{}'),('platform','a:5:{s:5:\"token\";s:32:\"hZISFd2nyzAByXgsifnBF2SO6ASzbx0y\";s:14:\"encodingaeskey\";s:43:\"RZXNqBvnqqnnzdnEnndnNVN6ZKNnJKbZNnVBkV2wj6j\";s:9:\"appsecret\";s:0:\"\";s:5:\"appid\";s:0:\"\";s:9:\"authstate\";i:1;}');
/*!40000 ALTER TABLE `ims_core_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_coupon_location`
--

DROP TABLE IF EXISTS `ims_coupon_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_coupon_location` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `acid` int(10) unsigned NOT NULL,
  `sid` int(10) unsigned NOT NULL,
  `location_id` int(10) unsigned NOT NULL,
  `business_name` varchar(50) NOT NULL,
  `branch_name` varchar(50) NOT NULL,
  `category` varchar(255) NOT NULL,
  `province` varchar(15) NOT NULL,
  `city` varchar(15) NOT NULL,
  `district` varchar(15) NOT NULL,
  `address` varchar(50) NOT NULL,
  `longitude` varchar(15) NOT NULL,
  `latitude` varchar(15) NOT NULL,
  `telephone` varchar(20) NOT NULL,
  `photo_list` varchar(10000) NOT NULL,
  `avg_price` int(10) unsigned NOT NULL,
  `open_time` varchar(50) NOT NULL,
  `recommend` varchar(255) NOT NULL,
  `special` varchar(255) NOT NULL,
  `introduction` varchar(255) NOT NULL,
  `offset_type` tinyint(3) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL,
  `message` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`,`acid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_coupon_location`
--

LOCK TABLES `ims_coupon_location` WRITE;
/*!40000 ALTER TABLE `ims_coupon_location` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_coupon_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_cover_reply`
--

DROP TABLE IF EXISTS `ims_cover_reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_cover_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `multiid` int(10) unsigned NOT NULL,
  `rid` int(10) unsigned NOT NULL,
  `module` varchar(30) NOT NULL,
  `do` varchar(30) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `thumb` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_cover_reply`
--

LOCK TABLES `ims_cover_reply` WRITE;
/*!40000 ALTER TABLE `ims_cover_reply` DISABLE KEYS */;
INSERT INTO `ims_cover_reply` VALUES (1,1,0,7,'mc','','进入个人中心','','','./index.php?c=mc&a=home&i=1'),(2,1,1,8,'site','','进入首页','','','./index.php?c=home&i=1&t=1');
/*!40000 ALTER TABLE `ims_cover_reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_custom_reply`
--

DROP TABLE IF EXISTS `ims_custom_reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_custom_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL,
  `start1` int(10) NOT NULL,
  `end1` int(10) NOT NULL,
  `start2` int(10) NOT NULL,
  `end2` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_custom_reply`
--

LOCK TABLES `ims_custom_reply` WRITE;
/*!40000 ALTER TABLE `ims_custom_reply` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_custom_reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_images_reply`
--

DROP TABLE IF EXISTS `ims_images_reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_images_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  `mediaid` varchar(255) NOT NULL,
  `createtime` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_images_reply`
--

LOCK TABLES `ims_images_reply` WRITE;
/*!40000 ALTER TABLE `ims_images_reply` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_images_reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_mc_cash_record`
--

DROP TABLE IF EXISTS `ims_mc_cash_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_mc_cash_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `clerk_id` int(10) unsigned NOT NULL,
  `store_id` int(10) unsigned NOT NULL,
  `clerk_type` tinyint(3) unsigned NOT NULL,
  `fee` decimal(10,2) unsigned NOT NULL,
  `final_fee` decimal(10,2) unsigned NOT NULL,
  `credit1` int(10) unsigned NOT NULL,
  `credit1_fee` decimal(10,2) unsigned NOT NULL,
  `credit2` decimal(10,2) unsigned NOT NULL,
  `cash` decimal(10,2) unsigned NOT NULL,
  `return_cash` decimal(10,2) unsigned NOT NULL,
  `final_cash` decimal(10,2) unsigned NOT NULL,
  `remark` varchar(255) NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `trade_type` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_mc_cash_record`
--

LOCK TABLES `ims_mc_cash_record` WRITE;
/*!40000 ALTER TABLE `ims_mc_cash_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_mc_cash_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_mc_chats_record`
--

DROP TABLE IF EXISTS `ims_mc_chats_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_mc_chats_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `acid` int(10) unsigned NOT NULL,
  `flag` tinyint(3) unsigned NOT NULL,
  `openid` varchar(32) NOT NULL,
  `msgtype` varchar(15) NOT NULL,
  `content` varchar(10000) NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`,`acid`),
  KEY `openid` (`openid`),
  KEY `createtime` (`createtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_mc_chats_record`
--

LOCK TABLES `ims_mc_chats_record` WRITE;
/*!40000 ALTER TABLE `ims_mc_chats_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_mc_chats_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_mc_credits_recharge`
--

DROP TABLE IF EXISTS `ims_mc_credits_recharge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_mc_credits_recharge` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `openid` varchar(50) NOT NULL,
  `tid` varchar(64) NOT NULL,
  `transid` varchar(30) NOT NULL,
  `fee` varchar(10) NOT NULL,
  `type` varchar(15) NOT NULL,
  `tag` varchar(10) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `backtype` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_uniacid_uid` (`uniacid`,`uid`),
  KEY `idx_tid` (`tid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_mc_credits_recharge`
--

LOCK TABLES `ims_mc_credits_recharge` WRITE;
/*!40000 ALTER TABLE `ims_mc_credits_recharge` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_mc_credits_recharge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_mc_credits_record`
--

DROP TABLE IF EXISTS `ims_mc_credits_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_mc_credits_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL,
  `uniacid` int(11) NOT NULL,
  `credittype` varchar(10) NOT NULL,
  `num` decimal(10,2) NOT NULL,
  `operator` int(10) unsigned NOT NULL,
  `module` varchar(30) NOT NULL,
  `clerk_id` int(10) unsigned NOT NULL,
  `store_id` int(10) unsigned NOT NULL,
  `clerk_type` tinyint(3) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `remark` varchar(200) NOT NULL,
  `real_uniacid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_mc_credits_record`
--

LOCK TABLES `ims_mc_credits_record` WRITE;
/*!40000 ALTER TABLE `ims_mc_credits_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_mc_credits_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_mc_fans_groups`
--

DROP TABLE IF EXISTS `ims_mc_fans_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_mc_fans_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `acid` int(10) unsigned NOT NULL,
  `groups` varchar(10000) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_mc_fans_groups`
--

LOCK TABLES `ims_mc_fans_groups` WRITE;
/*!40000 ALTER TABLE `ims_mc_fans_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_mc_fans_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_mc_fans_tag`
--

DROP TABLE IF EXISTS `ims_mc_fans_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_mc_fans_tag` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `fanid` int(11) NOT NULL,
  `openid` varchar(50) NOT NULL,
  `subscribe` int(11) DEFAULT NULL,
  `nickname` varchar(100) DEFAULT NULL,
  `sex` int(11) DEFAULT NULL,
  `language` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `province` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `headimgurl` varchar(150) DEFAULT NULL,
  `subscribe_time` int(11) NOT NULL,
  `unionid` varchar(100) DEFAULT NULL,
  `remark` varchar(250) DEFAULT NULL,
  `groupid` varchar(100) DEFAULT NULL,
  `tagid_list` varchar(250) DEFAULT NULL,
  `subscribe_scene` varchar(100) DEFAULT NULL,
  `qr_scene_str` varchar(250) DEFAULT NULL,
  `qr_scene` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fanid` (`fanid`),
  KEY `openid` (`openid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_mc_fans_tag`
--

LOCK TABLES `ims_mc_fans_tag` WRITE;
/*!40000 ALTER TABLE `ims_mc_fans_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_mc_fans_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_mc_fans_tag_mapping`
--

DROP TABLE IF EXISTS `ims_mc_fans_tag_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_mc_fans_tag_mapping` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `fanid` int(11) unsigned NOT NULL,
  `tagid` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mapping` (`fanid`,`tagid`),
  KEY `fanid_index` (`fanid`),
  KEY `tagid_index` (`tagid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_mc_fans_tag_mapping`
--

LOCK TABLES `ims_mc_fans_tag_mapping` WRITE;
/*!40000 ALTER TABLE `ims_mc_fans_tag_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_mc_fans_tag_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_mc_groups`
--

DROP TABLE IF EXISTS `ims_mc_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_mc_groups` (
  `groupid` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `title` varchar(20) NOT NULL,
  `credit` int(10) unsigned NOT NULL,
  `isdefault` tinyint(4) NOT NULL,
  PRIMARY KEY (`groupid`),
  KEY `uniacid` (`uniacid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_mc_groups`
--

LOCK TABLES `ims_mc_groups` WRITE;
/*!40000 ALTER TABLE `ims_mc_groups` DISABLE KEYS */;
INSERT INTO `ims_mc_groups` VALUES (1,1,'默认会员组',0,1);
/*!40000 ALTER TABLE `ims_mc_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_mc_handsel`
--

DROP TABLE IF EXISTS `ims_mc_handsel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_mc_handsel` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) NOT NULL,
  `touid` int(10) unsigned NOT NULL,
  `fromuid` varchar(32) NOT NULL,
  `module` varchar(30) NOT NULL,
  `sign` varchar(100) NOT NULL,
  `action` varchar(20) NOT NULL,
  `credit_value` int(10) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`touid`),
  KEY `uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_mc_handsel`
--

LOCK TABLES `ims_mc_handsel` WRITE;
/*!40000 ALTER TABLE `ims_mc_handsel` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_mc_handsel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_mc_mapping_fans`
--

DROP TABLE IF EXISTS `ims_mc_mapping_fans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_mc_mapping_fans` (
  `fanid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `acid` int(10) unsigned NOT NULL,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `openid` varchar(50) NOT NULL,
  `nickname` varchar(50) NOT NULL,
  `groupid` varchar(60) NOT NULL,
  `salt` char(8) NOT NULL,
  `follow` tinyint(1) unsigned NOT NULL,
  `followtime` int(10) unsigned NOT NULL,
  `unfollowtime` int(10) unsigned NOT NULL,
  `tag` varchar(1000) NOT NULL,
  `updatetime` int(10) unsigned DEFAULT NULL,
  `unionid` varchar(64) NOT NULL,
  `user_from` tinyint(1) NOT NULL,
  PRIMARY KEY (`fanid`),
  UNIQUE KEY `openid_2` (`openid`),
  KEY `acid` (`acid`),
  KEY `uniacid` (`uniacid`),
  KEY `nickname` (`nickname`),
  KEY `updatetime` (`updatetime`),
  KEY `uid` (`uid`),
  KEY `openid` (`openid`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_mc_mapping_fans`
--

LOCK TABLES `ims_mc_mapping_fans` WRITE;
/*!40000 ALTER TABLE `ims_mc_mapping_fans` DISABLE KEYS */;
INSERT INTO `ims_mc_mapping_fans` VALUES (1,1,1,1,'oM0Q_57eEokhhvQOy6qyPan5T3ac','逐梦','','Kx79vYuM',0,0,0,'YToxMDp7czo2OiJvcGVuaWQiO3M6Mjg6Im9NMFFfNTdlRW9raGh2UU95NnF5UGFuNVQzYWMiO3M6ODoibmlja25hbWUiO3M6Njoi6YCQ5qKmIjtzOjM6InNleCI7aTowO3M6ODoibGFuZ3VhZ2UiO3M6MDoiIjtzOjQ6ImNpdHkiO3M6MDoiIjtzOjg6InByb3ZpbmNlIjtzOjA6IiI7czo3OiJjb3VudHJ5IjtzOjA6IiI7czoxMDoiaGVhZGltZ3VybCI7czoxMjk6Imh0dHBzOi8vdGhpcmR3eC5xbG9nby5jbi9tbW9wZW4vdmlfMzIvb3FvMmxwQVFMNFZ4WW44MWdLb0t4emI0UUJYaFQxc1l1bUtoQjBKU3ZUSFJQb25Xd3R3RE5XWnZuNFVDOWVKdThEb0IzT1ZnbFJhaWNWcmJrRE9DdnhRLzEzMiI7czo5OiJwcml2aWxlZ2UiO2E6MDp7fXM6NjoiYXZhdGFyIjtzOjEyOToiaHR0cHM6Ly90aGlyZHd4LnFsb2dvLmNuL21tb3Blbi92aV8zMi9vcW8ybHBBUUw0VnhZbjgxZ0tvS3h6YjRRQlhoVDFzWXVtS2hCMEpTdlRIUlBvbld3dHdETldadm40VUM5ZUp1OERvQjNPVmdsUmFpY1ZyYmtET0N2eFEvMTMyIjt9',1650192439,'',0),(2,1,1,2,'ogtiH5tII9wkl2xhQTOLYtGofSdk','梦凌','','Ujm63pMl',0,0,0,'YToxMDp7czo2OiJvcGVuaWQiO3M6Mjg6Im9ndGlINXRJSTl3a2wyeGhRVE9MWXRHb2ZTZGsiO3M6ODoibmlja25hbWUiO3M6Njoi5qKm5YeMIjtzOjM6InNleCI7aTowO3M6ODoibGFuZ3VhZ2UiO3M6MDoiIjtzOjQ6ImNpdHkiO3M6MDoiIjtzOjg6InByb3ZpbmNlIjtzOjA6IiI7czo3OiJjb3VudHJ5IjtzOjA6IiI7czoxMDoiaGVhZGltZ3VybCI7czoxMzE6Imh0dHBzOi8vdGhpcmR3eC5xbG9nby5jbi9tbW9wZW4vdmlfMzIvcFI5aWF4WTVpYXFrZzBUR2NqY2R5NmV2NHppYnc4Vlc2S0VtYjI2dXBxQjZ3OGFrZWF5aFVJbjlFdDlabW9UZFNJTXVQc0RUWjdwbUZnQ3hjem9na0w5T3cvMTMyIjtzOjk6InByaXZpbGVnZSI7YTowOnt9czo2OiJhdmF0YXIiO3M6MTMxOiJodHRwczovL3RoaXJkd3gucWxvZ28uY24vbW1vcGVuL3ZpXzMyL3BSOWlheFk1aWFxa2cwVEdjamNkeTZldjR6aWJ3OFZXNktFbWIyNnVwcUI2dzhha2VheWhVSW45RXQ5Wm1vVGRTSU11UHNEVFo3cG1GZ0N4Y3pvZ2tMOU93LzEzMiI7fQ==',1650640740,'',0),(3,1,1,3,'ogtiH5q7stAQeLA3BB-jujxCWdkI','逐梦','','XY1L1JGk',0,0,0,'YToxMDp7czo2OiJvcGVuaWQiO3M6Mjg6Im9ndGlINXE3c3RBUWVMQTNCQi1qdWp4Q1dka0kiO3M6ODoibmlja25hbWUiO3M6Njoi6YCQ5qKmIjtzOjM6InNleCI7aTowO3M6ODoibGFuZ3VhZ2UiO3M6MDoiIjtzOjQ6ImNpdHkiO3M6MDoiIjtzOjg6InByb3ZpbmNlIjtzOjA6IiI7czo3OiJjb3VudHJ5IjtzOjA6IiI7czoxMDoiaGVhZGltZ3VybCI7czoxMzI6Imh0dHBzOi8vdGhpcmR3eC5xbG9nby5jbi9tbW9wZW4vdmlfMzIvYU1BUVJYbzV5Q0JRWHlFdnJMaHdOSmFTUVhPdVBFcGNwcGJLbGVaeXBqTXJXNW5hN2lhS2lhaWJ4WmU5VVRUZ3FSVkZISnYzbVlYUkdsTUxpYld4dUc4SHB3LzEzMiI7czo5OiJwcml2aWxlZ2UiO2E6MDp7fXM6NjoiYXZhdGFyIjtzOjEzMjoiaHR0cHM6Ly90aGlyZHd4LnFsb2dvLmNuL21tb3Blbi92aV8zMi9hTUFRUlhvNXlDQlFYeUV2ckxod05KYVNRWE91UEVwY3BwYktsZVp5cGpNclc1bmE3aWFLaWFpYnhaZTlVVFRncVJWRkhKdjNtWVhSR2xNTGliV3h1RzhIcHcvMTMyIjt9',1650204147,'',0),(4,1,1,4,'ogtiH5t5V4t0ualYfiEQXuBB29W8','money','','tmMVgVds',0,0,0,'YToxMDp7czo2OiJvcGVuaWQiO3M6Mjg6Im9ndGlINXQ1VjR0MHVhbFlmaUVRWHVCQjI5VzgiO3M6ODoibmlja25hbWUiO3M6NToibW9uZXkiO3M6Mzoic2V4IjtpOjA7czo4OiJsYW5ndWFnZSI7czowOiIiO3M6NDoiY2l0eSI7czowOiIiO3M6ODoicHJvdmluY2UiO3M6MDoiIjtzOjc6ImNvdW50cnkiO3M6MDoiIjtzOjEwOiJoZWFkaW1ndXJsIjtzOjEzMjoiaHR0cHM6Ly90aGlyZHd4LnFsb2dvLmNuL21tb3Blbi92aV8zMi9zNmVmelN1WmR3bEtmblpLTm04dzlyY3h3ZElXR2Z3NjhTM3FrSVhHSWw4SWlhTG5nNFJpYUFnWjNQRndOcHR0aWJWTTFkTHQyUFFpYjZybmFWU1UxMWM0WVEvMTMyIjtzOjk6InByaXZpbGVnZSI7YTowOnt9czo2OiJhdmF0YXIiO3M6MTMyOiJodHRwczovL3RoaXJkd3gucWxvZ28uY24vbW1vcGVuL3ZpXzMyL3M2ZWZ6U3VaZHdsS2ZuWktObTh3OXJjeHdkSVdHZnc2OFMzcWtJWEdJbDhJaWFMbmc0UmlhQWdaM1BGd05wdHRpYlZNMWRMdDJQUWliNnJuYVZTVTExYzRZUS8xMzIiO30=',1650288730,'',0),(5,1,1,5,'ogtiH5h8R51UZvkc8iH0ck00cSuQ','程海宇','','vx8Urr1S',0,0,0,'YToxMDp7czo2OiJvcGVuaWQiO3M6Mjg6Im9ndGlINWg4UjUxVVp2a2M4aUgwY2swMGNTdVEiO3M6ODoibmlja25hbWUiO3M6OToi56iL5rW35a6HIjtzOjM6InNleCI7aTowO3M6ODoibGFuZ3VhZ2UiO3M6MDoiIjtzOjQ6ImNpdHkiO3M6MDoiIjtzOjg6InByb3ZpbmNlIjtzOjA6IiI7czo3OiJjb3VudHJ5IjtzOjA6IiI7czoxMDoiaGVhZGltZ3VybCI7czoxMzI6Imh0dHBzOi8vdGhpcmR3eC5xbG9nby5jbi9tbW9wZW4vdmlfMzIvUTBqNFR3R1RmVExwYXF2bkZ2bnpPZG9qd2hydTUyMGlieVRwWU0yWFlpYklHRkJVa1JBUWRqeWZ5N2phb3gxeEJNaWNOS3ZkZ2JyMUdBYWlieTRWdGtEWUpnLzEzMiI7czo5OiJwcml2aWxlZ2UiO2E6MDp7fXM6NjoiYXZhdGFyIjtzOjEzMjoiaHR0cHM6Ly90aGlyZHd4LnFsb2dvLmNuL21tb3Blbi92aV8zMi9RMGo0VHdHVGZUTHBhcXZuRnZuek9kb2p3aHJ1NTIwaWJ5VHBZTTJYWWliSUdGQlVrUkFRZGp5Znk3amFveDF4Qk1pY05LdmRnYnIxR0FhaWJ5NFZ0a0RZSmcvMTMyIjt9',1650332944,'',0),(6,1,1,6,'ogtiH5qGnAd5YQ0Ij4kLDbhywoY0','长安','','exs5k659',0,0,0,'YToxMDp7czo2OiJvcGVuaWQiO3M6Mjg6Im9ndGlINXFHbkFkNVlRMElqNGtMRGJoeXdvWTAiO3M6ODoibmlja25hbWUiO3M6Njoi6ZW/5a6JIjtzOjM6InNleCI7aTowO3M6ODoibGFuZ3VhZ2UiO3M6MDoiIjtzOjQ6ImNpdHkiO3M6MDoiIjtzOjg6InByb3ZpbmNlIjtzOjA6IiI7czo3OiJjb3VudHJ5IjtzOjA6IiI7czoxMDoiaGVhZGltZ3VybCI7czoxMzI6Imh0dHBzOi8vdGhpcmR3eC5xbG9nby5jbi9tbW9wZW4vdmlfMzIvanM2N0xpYlk5UGI3SFgzdFgwaHVtTGliR1p5Q3RMZWFpY2VXS0ZPMGM0cmRDRXlpY3ZRMWg3WWtBcVBUZmdRUDM4NVRZaFEyRlFYOTFVczJybHp0bnBIUG9nLzEzMiI7czo5OiJwcml2aWxlZ2UiO2E6MDp7fXM6NjoiYXZhdGFyIjtzOjEzMjoiaHR0cHM6Ly90aGlyZHd4LnFsb2dvLmNuL21tb3Blbi92aV8zMi9qczY3TGliWTlQYjdIWDN0WDBodW1MaWJHWnlDdExlYWljZVdLRk8wYzRyZENFeWljdlExaDdZa0FxUFRmZ1FQMzg1VFloUTJGUVg5MVVzMnJsenRucEhQb2cvMTMyIjt9',1650333879,'',0),(7,1,1,7,'ogtiH5tsdZmcA_rNnGJdbw1SOvQg','高志','','R778osMO',0,0,0,'YToxMDp7czo2OiJvcGVuaWQiO3M6Mjg6Im9ndGlINXRzZFptY0Ffck5uR0pkYncxU092UWciO3M6ODoibmlja25hbWUiO3M6Njoi6auY5b+XIjtzOjM6InNleCI7aTowO3M6ODoibGFuZ3VhZ2UiO3M6MDoiIjtzOjQ6ImNpdHkiO3M6MDoiIjtzOjg6InByb3ZpbmNlIjtzOjA6IiI7czo3OiJjb3VudHJ5IjtzOjA6IiI7czoxMDoiaGVhZGltZ3VybCI7czoxMzM6Imh0dHBzOi8vdGhpcmR3eC5xbG9nby5jbi9tbW9wZW4vdmlfMzIvUTBqNFR3R1RmVElZaWI0ZDY0UUJUUXhqb3lUaWNRWkZoeUNpY1pjZHBDRlZpYnBTY2d3T2F1dHN5cGlhQ2VlbTRNY2RsRzB6c09qbXhGaHBUSXhQYnozN0kyUS8xMzIiO3M6OToicHJpdmlsZWdlIjthOjA6e31zOjY6ImF2YXRhciI7czoxMzM6Imh0dHBzOi8vdGhpcmR3eC5xbG9nby5jbi9tbW9wZW4vdmlfMzIvUTBqNFR3R1RmVElZaWI0ZDY0UUJUUXhqb3lUaWNRWkZoeUNpY1pjZHBDRlZpYnBTY2d3T2F1dHN5cGlhQ2VlbTRNY2RsRzB6c09qbXhGaHBUSXhQYnozN0kyUS8xMzIiO30=',1650333009,'',0),(8,1,1,8,'ogtiH5iDCCqwp6SF51nJ5eRDHkqY','晓宇(不回消息看朋友圈','','OlIMYz8w',0,0,0,'YToxMDp7czo2OiJvcGVuaWQiO3M6Mjg6Im9ndGlINWlEQ0Nxd3A2U0Y1MW5KNWVSREhrcVkiO3M6ODoibmlja25hbWUiO3M6MzE6IuaZk+WuhyjkuI3lm57mtojmga/nnIvmnIvlj4vlnIgiO3M6Mzoic2V4IjtpOjA7czo4OiJsYW5ndWFnZSI7czowOiIiO3M6NDoiY2l0eSI7czowOiIiO3M6ODoicHJvdmluY2UiO3M6MDoiIjtzOjc6ImNvdW50cnkiO3M6MDoiIjtzOjEwOiJoZWFkaW1ndXJsIjtzOjEzMToiaHR0cHM6Ly90aGlyZHd4LnFsb2dvLmNuL21tb3Blbi92aV8zMi9EWUFJT2dxODNlb3piN0NEVlNTekdQaWFWYXlVaWNBS0taQUxzWGVRNXdXSU50aEE1YlZzRmJrR2F6dUZqanFBTlBMWDNYVmljQWtOeTF1ZkVaanE5ZlNMZy8xMzIiO3M6OToicHJpdmlsZWdlIjthOjA6e31zOjY6ImF2YXRhciI7czoxMzE6Imh0dHBzOi8vdGhpcmR3eC5xbG9nby5jbi9tbW9wZW4vdmlfMzIvRFlBSU9ncTgzZW96YjdDRFZTU3pHUGlhVmF5VWljQUtLWkFMc1hlUTV3V0lOdGhBNWJWc0Zia0dhenVGampxQU5QTFgzWFZpY0FrTnkxdWZFWmpxOWZTTGcvMTMyIjt9',1650280540,'',0),(9,1,1,9,'ogtiH5lfO69ZZ0gf_AqUh2SUm85w','Tears.','','v11z21pH',0,0,0,'YToxMDp7czo2OiJvcGVuaWQiO3M6Mjg6Im9ndGlINWxmTzY5WlowZ2ZfQXFVaDJTVW04NXciO3M6ODoibmlja25hbWUiO3M6NjoiVGVhcnMuIjtzOjM6InNleCI7aTowO3M6ODoibGFuZ3VhZ2UiO3M6MDoiIjtzOjQ6ImNpdHkiO3M6MDoiIjtzOjg6InByb3ZpbmNlIjtzOjA6IiI7czo3OiJjb3VudHJ5IjtzOjA6IiI7czoxMDoiaGVhZGltZ3VybCI7czoxMjk6Imh0dHBzOi8vdGhpcmR3eC5xbG9nby5jbi9tbW9wZW4vdmlfMzIvNU4zNHpmdkFCVFI0dXRUSFloSGljMXhHMjlrbk5teUFqd3RveHBBMFpocHFXM3MySDZCbTVFOXQxRkxBZFZ4M0ZuWUxZbkNKUlptQUt1VGdRNG9KbGRnLzEzMiI7czo5OiJwcml2aWxlZ2UiO2E6MDp7fXM6NjoiYXZhdGFyIjtzOjEyOToiaHR0cHM6Ly90aGlyZHd4LnFsb2dvLmNuL21tb3Blbi92aV8zMi81TjM0emZ2QUJUUjR1dFRIWWhIaWMxeEcyOWtuTm15QWp3dG94cEEwWmhwcVczczJINkJtNUU5dDFGTEFkVngzRm5ZTFluQ0pSWm1BS3VUZ1E0b0psZGcvMTMyIjt9',1650288764,'',0),(10,1,1,10,'ogtiH5hQ_tGIyDwvEtDvQghgOgtc','子夫','','EbG476qG',0,0,0,'YToxMDp7czo2OiJvcGVuaWQiO3M6Mjg6Im9ndGlINWhRX3RHSXlEd3ZFdER2UWdoZ09ndGMiO3M6ODoibmlja25hbWUiO3M6Njoi5a2Q5aSrIjtzOjM6InNleCI7aTowO3M6ODoibGFuZ3VhZ2UiO3M6MDoiIjtzOjQ6ImNpdHkiO3M6MDoiIjtzOjg6InByb3ZpbmNlIjtzOjA6IiI7czo3OiJjb3VudHJ5IjtzOjA6IiI7czoxMDoiaGVhZGltZ3VybCI7czoxMjk6Imh0dHBzOi8vdGhpcmR3eC5xbG9nby5jbi9tbW9wZW4vdmlfMzIvcXN4a014aDZyaFIyYjI3SmFFZGRHYW9raDBpYUtoeHhDandvR25tVzlyWlNVU1ZKdzYwdnc5QWJ2UnluRUFVb2FaNWNnR2Y2UUpEQVQ3Qm1zVFNWZDR3LzEzMiI7czo5OiJwcml2aWxlZ2UiO2E6MDp7fXM6NjoiYXZhdGFyIjtzOjEyOToiaHR0cHM6Ly90aGlyZHd4LnFsb2dvLmNuL21tb3Blbi92aV8zMi9xc3hrTXhoNnJoUjJiMjdKYUVkZEdhb2toMGlhS2h4eENqd29Hbm1XOXJaU1VTVkp3NjB2dzlBYnZSeW5FQVVvYVo1Y2dHZjZRSkRBVDdCbXNUU1ZkNHcvMTMyIjt9',1650299693,'',0),(11,1,1,11,'ogtiH5l3qcVspE9oVKlsXo1gJWyI','ᝰꫛꪮꪮꫜ','','yzjqe4Ql',0,0,0,'YToxMDp7czo2OiJvcGVuaWQiO3M6Mjg6Im9ndGlINWwzcWNWc3BFOW9WS2xzWG8xZ0pXeUkiO3M6ODoibmlja25hbWUiO3M6MTU6IuGdsOqrm+qqruqqruqrnCI7czozOiJzZXgiO2k6MDtzOjg6Imxhbmd1YWdlIjtzOjA6IiI7czo0OiJjaXR5IjtzOjA6IiI7czo4OiJwcm92aW5jZSI7czowOiIiO3M6NzoiY291bnRyeSI7czowOiIiO3M6MTA6ImhlYWRpbWd1cmwiO3M6MTMwOiJodHRwczovL3RoaXJkd3gucWxvZ28uY24vbW1vcGVuL3ZpXzMyL01ZOWxwSGs2bHYxajV0djNPaWJYaWEzT2N4QkptWkdqZ3VPNU9nN2Y2eWRHa0M1WFNLNWtPTkEzNWxVS2RMMHp4NGFqRWpzQjhMVkJPZTAwb3g0TWo3YUEvMTMyIjtzOjk6InByaXZpbGVnZSI7YTowOnt9czo2OiJhdmF0YXIiO3M6MTMwOiJodHRwczovL3RoaXJkd3gucWxvZ28uY24vbW1vcGVuL3ZpXzMyL01ZOWxwSGs2bHYxajV0djNPaWJYaWEzT2N4QkptWkdqZ3VPNU9nN2Y2eWRHa0M1WFNLNWtPTkEzNWxVS2RMMHp4NGFqRWpzQjhMVkJPZTAwb3g0TWo3YUEvMTMyIjt9',1650290027,'',0),(12,1,1,12,'ogtiH5oVLqofZYVttr9Tbp-hXmoo','孤玖','','T7hLzdHU',0,0,0,'YToxMDp7czo2OiJvcGVuaWQiO3M6Mjg6Im9ndGlINW9WTHFvZlpZVnR0cjlUYnAtaFhtb28iO3M6ODoibmlja25hbWUiO3M6Njoi5a2k546WIjtzOjM6InNleCI7aTowO3M6ODoibGFuZ3VhZ2UiO3M6MDoiIjtzOjQ6ImNpdHkiO3M6MDoiIjtzOjg6InByb3ZpbmNlIjtzOjA6IiI7czo3OiJjb3VudHJ5IjtzOjA6IiI7czoxMDoiaGVhZGltZ3VybCI7czoxMzI6Imh0dHBzOi8vdGhpcmR3eC5xbG9nby5jbi9tbW9wZW4vdmlfMzIvenhWTjBRcWliZ2FpYk5UeldiYTV5RGliSjhDTE9INnoyb09mN01iNEdXUUZZOTMyZDRxemF2VVZ2ZDRZcTh0VDlRVkM0ZUl3NVZ2WFdhTWF1aWF6Mkh1Sm9BLzEzMiI7czo5OiJwcml2aWxlZ2UiO2E6MDp7fXM6NjoiYXZhdGFyIjtzOjEzMjoiaHR0cHM6Ly90aGlyZHd4LnFsb2dvLmNuL21tb3Blbi92aV8zMi96eFZOMFFxaWJnYWliTlR6V2JhNXlEaWJKOENMT0g2ejJvT2Y3TWI0R1dRRlk5MzJkNHF6YXZVVnZkNFlxOHRUOVFWQzRlSXc1VnZYV2FNYXVpYXoySHVKb0EvMTMyIjt9',1650291041,'',0),(13,1,1,13,'ogtiH5mKTQzrRya8Yveb2esQL8d8','Y','','l577Gp6Z',0,0,0,'YToxMDp7czo2OiJvcGVuaWQiO3M6Mjg6Im9ndGlINW1LVFF6clJ5YThZdmViMmVzUUw4ZDgiO3M6ODoibmlja25hbWUiO3M6MToiWSI7czozOiJzZXgiO2k6MDtzOjg6Imxhbmd1YWdlIjtzOjA6IiI7czo0OiJjaXR5IjtzOjA6IiI7czo4OiJwcm92aW5jZSI7czowOiIiO3M6NzoiY291bnRyeSI7czowOiIiO3M6MTA6ImhlYWRpbWd1cmwiO3M6MTMyOiJodHRwczovL3RoaXJkd3gucWxvZ28uY24vbW1vcGVuL3ZpXzMyL1E4ek1aUGFTTkYxeWZpYk5mTDNBTFVvOUFyeVVRT1pGVEpET29GRjBoV0U0dldkNzRpY2lhU2JjbHVKRzlsbGc0OVAyTVVnaWJTa0V0UEJvVXR3TWt2SGFrQS8xMzIiO3M6OToicHJpdmlsZWdlIjthOjA6e31zOjY6ImF2YXRhciI7czoxMzI6Imh0dHBzOi8vdGhpcmR3eC5xbG9nby5jbi9tbW9wZW4vdmlfMzIvUTh6TVpQYVNORjF5ZmliTmZMM0FMVW85QXJ5VVFPWkZUSkRPb0ZGMGhXRTR2V2Q3NGljaWFTYmNsdUpHOWxsZzQ5UDJNVWdpYlNrRXRQQm9VdHdNa3ZIYWtBLzEzMiI7fQ==',1650292731,'',0),(14,1,1,14,'oXDWr6UIjklchpwfNWcb7A_aUo6w','程海宇','','fwgxljdj',0,0,0,'YToxMDp7czo2OiJvcGVuaWQiO3M6Mjg6Im9YRFdyNlVJamtsY2hwd2ZOV2NiN0FfYVVvNnciO3M6ODoibmlja25hbWUiO3M6OToi56iL5rW35a6HIjtzOjM6InNleCI7aTowO3M6ODoibGFuZ3VhZ2UiO3M6MDoiIjtzOjQ6ImNpdHkiO3M6MDoiIjtzOjg6InByb3ZpbmNlIjtzOjA6IiI7czo3OiJjb3VudHJ5IjtzOjA6IiI7czoxMDoiaGVhZGltZ3VybCI7czoxMzE6Imh0dHBzOi8vdGhpcmR3eC5xbG9nby5jbi9tbW9wZW4vdmlfMzIvUTBqNFR3R1RmVElHbU9UaHdtT1dVMG9JVlZTZTd2djVvSEtiakJiRGFjRnVLV2ljcjFBQW1oUTBoODU3aWJhaWFjdWFjTVJMdVlsTWRTVkFwYU8yYVpZd0EvMTMyIjtzOjk6InByaXZpbGVnZSI7YTowOnt9czo2OiJhdmF0YXIiO3M6MTMxOiJodHRwczovL3RoaXJkd3gucWxvZ28uY24vbW1vcGVuL3ZpXzMyL1EwajRUd0dUZlRJR21PVGh3bU9XVTBvSVZWU2U3dnY1b0hLYmpCYkRhY0Z1S1dpY3IxQUFtaFEwaDg1N2liYWlhY3VhY01STHVZbE1kU1ZBcGFPMmFaWXdBLzEzMiI7fQ==',1650337677,'',0),(15,1,1,15,'oXDWr6XqRY0QDfYOgH0y9LPpFls8','梦凌','','N4PSSsVO',0,0,0,'YToxMDp7czo2OiJvcGVuaWQiO3M6Mjg6Im9YRFdyNlhxUlkwUURmWU9nSDB5OUxQcEZsczgiO3M6ODoibmlja25hbWUiO3M6Njoi5qKm5YeMIjtzOjM6InNleCI7aTowO3M6ODoibGFuZ3VhZ2UiO3M6MDoiIjtzOjQ6ImNpdHkiO3M6MDoiIjtzOjg6InByb3ZpbmNlIjtzOjA6IiI7czo3OiJjb3VudHJ5IjtzOjA6IiI7czoxMDoiaGVhZGltZ3VybCI7czoxMzI6Imh0dHBzOi8vdGhpcmR3eC5xbG9nby5jbi9tbW9wZW4vdmlfMzIveGVqZUt5Y2RGYzdsR1d2aWJKWU8wRzZUbjJ1UFZtVVNxRFp0M1dpYXA1bXRUejVxR2VQaWJNRHlTSUpDVWNzM1hHWlpvcWliVEpnMzlEM3N1S1k4dHRIVGZ3LzEzMiI7czo5OiJwcml2aWxlZ2UiO2E6MDp7fXM6NjoiYXZhdGFyIjtzOjEzMjoiaHR0cHM6Ly90aGlyZHd4LnFsb2dvLmNuL21tb3Blbi92aV8zMi94ZWplS3ljZEZjN2xHV3ZpYkpZTzBHNlRuMnVQVm1VU3FEWnQzV2lhcDVtdFR6NXFHZVBpYk1EeVNJSkNVY3MzWEdaWm9xaWJUSmczOUQzc3VLWTh0dEhUZncvMTMyIjt9',1650359136,'',0),(16,1,1,16,'oXDWr6ZjeqJzIOJcO8E1TPduowwY','1.26','','rl4eQcBP',0,0,0,'YToxMDp7czo2OiJvcGVuaWQiO3M6Mjg6Im9YRFdyNlpqZXFKeklPSmNPOEUxVFBkdW93d1kiO3M6ODoibmlja25hbWUiO3M6NDoiMS4yNiI7czozOiJzZXgiO2k6MDtzOjg6Imxhbmd1YWdlIjtzOjA6IiI7czo0OiJjaXR5IjtzOjA6IiI7czo4OiJwcm92aW5jZSI7czowOiIiO3M6NzoiY291bnRyeSI7czowOiIiO3M6MTA6ImhlYWRpbWd1cmwiO3M6MTMxOiJodHRwczovL3RoaXJkd3gucWxvZ28uY24vbW1vcGVuL3ZpXzMyL1EwajRUd0dUZlRLZ0RSNWg1dkw3OFJXV1R6R3FMODlHYmlhenNMUkNaT01WaWJ5ZTFmT3NrNFphM09idlV1eGpMV3BDQkFlQnp1TFFBNU1pY1ZZb1E5NDdBLzEzMiI7czo5OiJwcml2aWxlZ2UiO2E6MDp7fXM6NjoiYXZhdGFyIjtzOjEzMToiaHR0cHM6Ly90aGlyZHd4LnFsb2dvLmNuL21tb3Blbi92aV8zMi9RMGo0VHdHVGZUS2dEUjVoNXZMNzhSV1dUekdxTDg5R2JpYXpzTFJDWk9NVmlieWUxZk9zazRaYTNPYnZVdXhqTFdwQ0JBZUJ6dUxRQTVNaWNWWW9ROTQ3QS8xMzIiO30=',1650349376,'',0),(17,1,1,17,'oXDWr6fXgq2qVsUUmX4sAFOnNjkI','YP_s','','b32l3P3P',0,0,0,'YToxMDp7czo2OiJvcGVuaWQiO3M6Mjg6Im9YRFdyNmZYZ3EycVZzVVVtWDRzQUZPbk5qa0kiO3M6ODoibmlja25hbWUiO3M6NDoiWVBfcyI7czozOiJzZXgiO2k6MDtzOjg6Imxhbmd1YWdlIjtzOjA6IiI7czo0OiJjaXR5IjtzOjA6IiI7czo4OiJwcm92aW5jZSI7czowOiIiO3M6NzoiY291bnRyeSI7czowOiIiO3M6MTA6ImhlYWRpbWd1cmwiO3M6MTMzOiJodHRwczovL3RoaXJkd3gucWxvZ28uY24vbW1vcGVuL3ZpXzMyL1EwajRUd0dUZlRLRXBpYU5icHduTnRnQzRKVWliVjVpYnNTdm5MeHV2RDZjVFBWS21vdGN2dGFpYk9EQ1RZN09SekhoYUhtYmo2YVNIb1NFODBIVnlpY0d3UmcvMTMyIjtzOjk6InByaXZpbGVnZSI7YTowOnt9czo2OiJhdmF0YXIiO3M6MTMzOiJodHRwczovL3RoaXJkd3gucWxvZ28uY24vbW1vcGVuL3ZpXzMyL1EwajRUd0dUZlRLRXBpYU5icHduTnRnQzRKVWliVjVpYnNTdm5MeHV2RDZjVFBWS21vdGN2dGFpYk9EQ1RZN09SekhoYUhtYmo2YVNIb1NFODBIVnlpY0d3UmcvMTMyIjt9',1650366323,'',0),(18,1,1,18,'oXDWr6YawEyPNMlud1GjC1rD-CBI','不瘦到一百不改名','','gyd2D6qd',0,0,0,'YToxMDp7czo2OiJvcGVuaWQiO3M6Mjg6Im9YRFdyNllhd0V5UE5NbHVkMUdqQzFyRC1DQkkiO3M6ODoibmlja25hbWUiO3M6MjQ6IuS4jeeYpuWIsOS4gOeZvuS4jeaUueWQjSI7czozOiJzZXgiO2k6MDtzOjg6Imxhbmd1YWdlIjtzOjA6IiI7czo0OiJjaXR5IjtzOjA6IiI7czo4OiJwcm92aW5jZSI7czowOiIiO3M6NzoiY291bnRyeSI7czowOiIiO3M6MTA6ImhlYWRpbWd1cmwiO3M6MTMxOiJodHRwczovL3RoaXJkd3gucWxvZ28uY24vbW1vcGVuL3ZpXzMyL1lTdjR0RkxlaWEzQkxZdlhJOXBBbWJDaEsyQ05GUVppYW8xanF4ZWEwQjE5Ukd4NFhoMmJDaEZYSENBY1dKZDJHd3g2cEZVbGliMllWWk91TUlOV2Q0UGR3LzEzMiI7czo5OiJwcml2aWxlZ2UiO2E6MDp7fXM6NjoiYXZhdGFyIjtzOjEzMToiaHR0cHM6Ly90aGlyZHd4LnFsb2dvLmNuL21tb3Blbi92aV8zMi9ZU3Y0dEZMZWlhM0JMWXZYSTlwQW1iQ2hLMkNORlFaaWFvMWpxeGVhMEIxOVJHeDRYaDJiQ2hGWEhDQWNXSmQyR3d4NnBGVWxpYjJZVlpPdU1JTldkNFBkdy8xMzIiO30=',1650352272,'',0),(19,1,1,19,'oXDWr6Zqi77HdtaHb71EtgR7PL9I','ᝰꫛꪮꪮꫜ','','fo2j0ing',0,0,0,'YToxMDp7czo2OiJvcGVuaWQiO3M6Mjg6Im9YRFdyNlpxaTc3SGR0YUhiNzFFdGdSN1BMOUkiO3M6ODoibmlja25hbWUiO3M6MTU6IuGdsOqrm+qqruqqruqrnCI7czozOiJzZXgiO2k6MDtzOjg6Imxhbmd1YWdlIjtzOjA6IiI7czo0OiJjaXR5IjtzOjA6IiI7czo4OiJwcm92aW5jZSI7czowOiIiO3M6NzoiY291bnRyeSI7czowOiIiO3M6MTA6ImhlYWRpbWd1cmwiO3M6MTMzOiJodHRwczovL3RoaXJkd3gucWxvZ28uY24vbW1vcGVuL3ZpXzMyL1VSNFB2amljeUl6RUY4MFQ2SXM2N2VKUEtEV0hoVVRqMEgzeWd1V3Q0TDVYaWJ5Z1RNZ2FEdGFDTGVRaWJmZkdjaWFpYjhZbFVwb1d2bGQxVTN3QXVPZzlqUkEvMTMyIjtzOjk6InByaXZpbGVnZSI7YTowOnt9czo2OiJhdmF0YXIiO3M6MTMzOiJodHRwczovL3RoaXJkd3gucWxvZ28uY24vbW1vcGVuL3ZpXzMyL1VSNFB2amljeUl6RUY4MFQ2SXM2N2VKUEtEV0hoVVRqMEgzeWd1V3Q0TDVYaWJ5Z1RNZ2FEdGFDTGVRaWJmZkdjaWFpYjhZbFVwb1d2bGQxVTN3QXVPZzlqUkEvMTMyIjt9',1650353973,'',0),(20,1,1,20,'oXDWr6S5QzBKPvxxpCNqSPyujbLQ','Tears.','','N6Cre318',0,0,0,'YToxMDp7czo2OiJvcGVuaWQiO3M6Mjg6Im9YRFdyNlM1UXpCS1B2eHhwQ05xU1B5dWpiTFEiO3M6ODoibmlja25hbWUiO3M6NjoiVGVhcnMuIjtzOjM6InNleCI7aTowO3M6ODoibGFuZ3VhZ2UiO3M6MDoiIjtzOjQ6ImNpdHkiO3M6MDoiIjtzOjg6InByb3ZpbmNlIjtzOjA6IiI7czo3OiJjb3VudHJ5IjtzOjA6IiI7czoxMDoiaGVhZGltZ3VybCI7czoxMzA6Imh0dHBzOi8vdGhpcmR3eC5xbG9nby5jbi9tbW9wZW4vdmlfMzIveWVmaGNETE8wN2VwNmNZQUduRTNNUlpxZ2FxNWMxaWNkMlA4RlZEUWdzcG9tRTM4ZGI0WDlJTlhZQlhFaWI5NmwwV1hDTGI4NjVCNVhmVjF2UTQ0WldGdy8xMzIiO3M6OToicHJpdmlsZWdlIjthOjA6e31zOjY6ImF2YXRhciI7czoxMzA6Imh0dHBzOi8vdGhpcmR3eC5xbG9nby5jbi9tbW9wZW4vdmlfMzIveWVmaGNETE8wN2VwNmNZQUduRTNNUlpxZ2FxNWMxaWNkMlA4RlZEUWdzcG9tRTM4ZGI0WDlJTlhZQlhFaWI5NmwwV1hDTGI4NjVCNVhmVjF2UTQ0WldGdy8xMzIiO30=',1650356262,'',0),(21,1,1,21,'oXDWr6UsYEzcGySOzDwJzoX6yHlI','长安','','FgsP78s9',0,0,0,'YToxMDp7czo2OiJvcGVuaWQiO3M6Mjg6Im9YRFdyNlVzWUV6Y0d5U096RHdKem9YNnlIbEkiO3M6ODoibmlja25hbWUiO3M6Njoi6ZW/5a6JIjtzOjM6InNleCI7aTowO3M6ODoibGFuZ3VhZ2UiO3M6MDoiIjtzOjQ6ImNpdHkiO3M6MDoiIjtzOjg6InByb3ZpbmNlIjtzOjA6IiI7czo3OiJjb3VudHJ5IjtzOjA6IiI7czoxMDoiaGVhZGltZ3VybCI7czoxMzE6Imh0dHBzOi8vdGhpcmR3eC5xbG9nby5jbi9tbW9wZW4vdmlfMzIvbmZoUTVpYmNpYmV6NkswbEZSTlhqTEJKaWFkRkpxb2p1akdyaEYxejhyNDVHZDRuSFFoblRRUVhHanloUUN2ZGVnVXJmaHQ1OEFRUDJCeDBzeXFFenB3bWcvMTMyIjtzOjk6InByaXZpbGVnZSI7YTowOnt9czo2OiJhdmF0YXIiO3M6MTMxOiJodHRwczovL3RoaXJkd3gucWxvZ28uY24vbW1vcGVuL3ZpXzMyL25maFE1aWJjaWJlejZLMGxGUk5YakxCSmlhZEZKcW9qdWpHcmhGMXo4cjQ1R2Q0bkhRaG5UUVFYR2p5aFFDdmRlZ1VyZmh0NThBUVAyQngwc3lxRXpwd21nLzEzMiI7fQ==',1650597237,'',0),(22,1,1,22,'oXDWr6fY_19_WLwOvhtGRNmJ6wag','盲盒','','KlHT7n5u',0,0,0,'YToxMDp7czo2OiJvcGVuaWQiO3M6Mjg6Im9YRFdyNmZZXzE5X1dMd092aHRHUk5tSjZ3YWciO3M6ODoibmlja25hbWUiO3M6Njoi55uy55uSIjtzOjM6InNleCI7aTowO3M6ODoibGFuZ3VhZ2UiO3M6MDoiIjtzOjQ6ImNpdHkiO3M6MDoiIjtzOjg6InByb3ZpbmNlIjtzOjA6IiI7czo3OiJjb3VudHJ5IjtzOjA6IiI7czoxMDoiaGVhZGltZ3VybCI7czoxMzA6Imh0dHBzOi8vdGhpcmR3eC5xbG9nby5jbi9tbW9wZW4vdmlfMzIvT0pEVkFSTWxWdE5SVXg5ck95aWM4ODgyOExrNmg4NkNjcVNxSDRCaEp5bTV2eTBPa2ZzSDB0Nm9GZFZBekhmU25kYWZXQWRWYVIycnl5NldpYVN5UFF5dy8xMzIiO3M6OToicHJpdmlsZWdlIjthOjA6e31zOjY6ImF2YXRhciI7czoxMzA6Imh0dHBzOi8vdGhpcmR3eC5xbG9nby5jbi9tbW9wZW4vdmlfMzIvT0pEVkFSTWxWdE5SVXg5ck95aWM4ODgyOExrNmg4NkNjcVNxSDRCaEp5bTV2eTBPa2ZzSDB0Nm9GZFZBekhmU25kYWZXQWRWYVIycnl5NldpYVN5UFF5dy8xMzIiO30=',1650358889,'',0),(23,1,1,23,'oXDWr6UHVH5HjioRo9TP7i5os9TU','.cium','','d7F1Wpvy',0,0,0,'YToxMDp7czo2OiJvcGVuaWQiO3M6Mjg6Im9YRFdyNlVIVkg1SGppb1JvOVRQN2k1b3M5VFUiO3M6ODoibmlja25hbWUiO3M6NToiLmNpdW0iO3M6Mzoic2V4IjtpOjA7czo4OiJsYW5ndWFnZSI7czowOiIiO3M6NDoiY2l0eSI7czowOiIiO3M6ODoicHJvdmluY2UiO3M6MDoiIjtzOjc6ImNvdW50cnkiO3M6MDoiIjtzOjEwOiJoZWFkaW1ndXJsIjtzOjEzMDoiaHR0cHM6Ly90aGlyZHd4LnFsb2dvLmNuL21tb3Blbi92aV8zMi9pY09ORG5ZbnhzODZMTnVDTE02bjdZRGlhcGdRWndQTnNKNjdGZVNZamRBNmw4QTV2d082NmFQdXBxQVpCaGRqY3ZWYk43TU5XVDc0U25KREhyOW43MkxBLzEzMiI7czo5OiJwcml2aWxlZ2UiO2E6MDp7fXM6NjoiYXZhdGFyIjtzOjEzMDoiaHR0cHM6Ly90aGlyZHd4LnFsb2dvLmNuL21tb3Blbi92aV8zMi9pY09ORG5ZbnhzODZMTnVDTE02bjdZRGlhcGdRWndQTnNKNjdGZVNZamRBNmw4QTV2d082NmFQdXBxQVpCaGRqY3ZWYk43TU5XVDc0U25KREhyOW43MkxBLzEzMiI7fQ==',1650358999,'',0),(24,1,1,24,'oXDWr6WL4RvtewLOxVVNmdwOWO2w','yeong7','','lvDRydim',0,0,0,'YToxMDp7czo2OiJvcGVuaWQiO3M6Mjg6Im9YRFdyNldMNFJ2dGV3TE94VlZObWR3T1dPMnciO3M6ODoibmlja25hbWUiO3M6NjoieWVvbmc3IjtzOjM6InNleCI7aTowO3M6ODoibGFuZ3VhZ2UiO3M6MDoiIjtzOjQ6ImNpdHkiO3M6MDoiIjtzOjg6InByb3ZpbmNlIjtzOjA6IiI7czo3OiJjb3VudHJ5IjtzOjA6IiI7czoxMDoiaGVhZGltZ3VybCI7czoxMzI6Imh0dHBzOi8vdGhpcmR3eC5xbG9nby5jbi9tbW9wZW4vdmlfMzIvM25RMXIzS2lhR2I2Sjc1cVVYY3FiaWJXbnZmdjRDenNzSHhJQlJ5Z3RZQWFUcXc3dTJGWGhIZ0UzV2VGNUFHaWFjYWhSNFliV0xYUVBxZUx5b1c3OEVpY3d3LzEzMiI7czo5OiJwcml2aWxlZ2UiO2E6MDp7fXM6NjoiYXZhdGFyIjtzOjEzMjoiaHR0cHM6Ly90aGlyZHd4LnFsb2dvLmNuL21tb3Blbi92aV8zMi8zblExcjNLaWFHYjZKNzVxVVhjcWJpYldudmZ2NEN6c3NIeElCUnlndFlBYVRxdzd1MkZYaEhnRTNXZUY1QUdpYWNhaFI0WWJXTFhRUHFlTHlvVzc4RWljd3cvMTMyIjt9',1650359767,'',0),(25,1,1,25,'oXDWr6dx-ApsWOEV9Qn2id1NxvIM','·','','ii1nOnLn',0,0,0,'YToxMDp7czo2OiJvcGVuaWQiO3M6Mjg6Im9YRFdyNmR4LUFwc1dPRVY5UW4yaWQxTnh2SU0iO3M6ODoibmlja25hbWUiO3M6MjoiwrciO3M6Mzoic2V4IjtpOjA7czo4OiJsYW5ndWFnZSI7czowOiIiO3M6NDoiY2l0eSI7czowOiIiO3M6ODoicHJvdmluY2UiO3M6MDoiIjtzOjc6ImNvdW50cnkiO3M6MDoiIjtzOjEwOiJoZWFkaW1ndXJsIjtzOjEzMzoiaHR0cHM6Ly90aGlyZHd4LnFsb2dvLmNuL21tb3Blbi92aV8zMi9iaFlGOFJLMkJhaWMzbXd0S2lha1lsWW8xZ2lhR2xxSzZocUVpYU5IU04xb0JwbGJkR0ZiT3NHMjB1NEloVVNHZWM2M25OUjhkZ25GbkNpY2FJY1dMYjdUUUtnLzEzMiI7czo5OiJwcml2aWxlZ2UiO2E6MDp7fXM6NjoiYXZhdGFyIjtzOjEzMzoiaHR0cHM6Ly90aGlyZHd4LnFsb2dvLmNuL21tb3Blbi92aV8zMi9iaFlGOFJLMkJhaWMzbXd0S2lha1lsWW8xZ2lhR2xxSzZocUVpYU5IU04xb0JwbGJkR0ZiT3NHMjB1NEloVVNHZWM2M25OUjhkZ25GbkNpY2FJY1dMYjdUUUtnLzEzMiI7fQ==',1650510617,'',0),(26,1,1,26,'oXDWr6eX33VX9v3yE6Kk2guvqyCk','ᯤ','','yPbIiUu1',0,0,0,'YToxMDp7czo2OiJvcGVuaWQiO3M6Mjg6Im9YRFdyNmVYMzNWWDl2M3lFNktrMmd1dnF5Q2siO3M6ODoibmlja25hbWUiO3M6Mzoi4a+kIjtzOjM6InNleCI7aTowO3M6ODoibGFuZ3VhZ2UiO3M6MDoiIjtzOjQ6ImNpdHkiO3M6MDoiIjtzOjg6InByb3ZpbmNlIjtzOjA6IiI7czo3OiJjb3VudHJ5IjtzOjA6IiI7czoxMDoiaGVhZGltZ3VybCI7czoxMzI6Imh0dHBzOi8vdGhpcmR3eC5xbG9nby5jbi9tbW9wZW4vdmlfMzIvR0pDYzNCSVYzM1N0QldIMTFPcTF0V0ZLb2pXMmdJb2liRlFUZmM3ZTVPaWJWV2lhZDFObDlvdFZiQzNBUFN2eGliaHJvelA4dnBZZHlUY2VNdENSVkFaOG5nLzEzMiI7czo5OiJwcml2aWxlZ2UiO2E6MDp7fXM6NjoiYXZhdGFyIjtzOjEzMjoiaHR0cHM6Ly90aGlyZHd4LnFsb2dvLmNuL21tb3Blbi92aV8zMi9HSkNjM0JJVjMzU3RCV0gxMU9xMXRXRktvalcyZ0lvaWJGUVRmYzdlNU9pYlZXaWFkMU5sOW90VmJDM0FQU3Z4aWJocm96UDh2cFlkeVRjZU10Q1JWQVo4bmcvMTMyIjt9',1650515227,'',0),(27,1,1,27,'oXDWr6ZZwNDPKTxb4OJOprBrl3AY','抱米花','','dqjYdmy8',0,0,0,'YToxMDp7czo2OiJvcGVuaWQiO3M6Mjg6Im9YRFdyNlpad05EUEtUeGI0T0pPcHJCcmwzQVkiO3M6ODoibmlja25hbWUiO3M6OToi5oqx57Gz6IqxIjtzOjM6InNleCI7aTowO3M6ODoibGFuZ3VhZ2UiO3M6MDoiIjtzOjQ6ImNpdHkiO3M6MDoiIjtzOjg6InByb3ZpbmNlIjtzOjA6IiI7czo3OiJjb3VudHJ5IjtzOjA6IiI7czoxMDoiaGVhZGltZ3VybCI7czoxMzE6Imh0dHBzOi8vdGhpcmR3eC5xbG9nby5jbi9tbW9wZW4vdmlfMzIvRFlBSU9ncTgzZXFpYmxKcGxIcWpDT1NGQkhYUjJWMGhrSEhGOHJ0Vm5IazB3MFhFNFdUUGppYVMxVGpvOHBERXBjeExIbVBEaWNzR1dUdDhrcjJZZ0tuVUEvMTMyIjtzOjk6InByaXZpbGVnZSI7YTowOnt9czo2OiJhdmF0YXIiO3M6MTMxOiJodHRwczovL3RoaXJkd3gucWxvZ28uY24vbW1vcGVuL3ZpXzMyL0RZQUlPZ3E4M2VxaWJsSnBsSHFqQ09TRkJIWFIyVjBoa0hIRjhydFZuSGswdzBYRTRXVFBqaWFTMVRqbzhwREVwY3hMSG1QRGljc0dXVHQ4a3IyWWdLblVBLzEzMiI7fQ==',1650624497,'',0),(28,1,1,28,'oXDWr6djJz7_IMn__9lp3v7CQO1w','沐文梦','','mWerY1SC',0,0,0,'YToxMDp7czo2OiJvcGVuaWQiO3M6Mjg6Im9YRFdyNmRqSno3X0lNbl9fOWxwM3Y3Q1FPMXciO3M6ODoibmlja25hbWUiO3M6OToi5rKQ5paH5qKmIjtzOjM6InNleCI7aTowO3M6ODoibGFuZ3VhZ2UiO3M6MDoiIjtzOjQ6ImNpdHkiO3M6MDoiIjtzOjg6InByb3ZpbmNlIjtzOjA6IiI7czo3OiJjb3VudHJ5IjtzOjA6IiI7czoxMDoiaGVhZGltZ3VybCI7czoxMzI6Imh0dHBzOi8vdGhpcmR3eC5xbG9nby5jbi9tbW9wZW4vdmlfMzIvaks0Zk5jcXBTVTNNa1RwSFZONmlicGZOaWIwNU41cU15U1dnTUlsaWJIcU1SaE5BQjZNekFNOGxRc3B5VWs1ZHpJY0VsWDVmTldoaWFqb0lLM0JVUkh4Mk5nLzEzMiI7czo5OiJwcml2aWxlZ2UiO2E6MDp7fXM6NjoiYXZhdGFyIjtzOjEzMjoiaHR0cHM6Ly90aGlyZHd4LnFsb2dvLmNuL21tb3Blbi92aV8zMi9qSzRmTmNxcFNVM01rVHBIVk42aWJwZk5pYjA1TjVxTXlTV2dNSWxpYkhxTVJoTkFCNk16QU04bFFzcHlVazVkekljRWxYNWZOV2hpYWpvSUszQlVSSHgyTmcvMTMyIjt9',1650634103,'',0);
/*!40000 ALTER TABLE `ims_mc_mapping_fans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_mc_mass_record`
--

DROP TABLE IF EXISTS `ims_mc_mass_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_mc_mass_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `acid` int(10) unsigned NOT NULL,
  `groupname` varchar(50) NOT NULL,
  `fansnum` int(10) unsigned NOT NULL,
  `msgtype` varchar(10) NOT NULL,
  `content` varchar(10000) NOT NULL,
  `group` int(10) NOT NULL,
  `attach_id` int(10) unsigned NOT NULL,
  `media_id` varchar(100) NOT NULL,
  `type` tinyint(3) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL,
  `cron_id` int(10) unsigned NOT NULL,
  `sendtime` int(10) unsigned NOT NULL,
  `finalsendtime` int(10) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `msg_id` varchar(50) NOT NULL,
  `msg_data_id` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`,`acid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_mc_mass_record`
--

LOCK TABLES `ims_mc_mass_record` WRITE;
/*!40000 ALTER TABLE `ims_mc_mass_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_mc_mass_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_mc_member_address`
--

DROP TABLE IF EXISTS `ims_mc_member_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_mc_member_address` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(50) unsigned NOT NULL,
  `username` varchar(20) NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `zipcode` varchar(6) NOT NULL,
  `province` varchar(32) NOT NULL,
  `city` varchar(32) NOT NULL,
  `district` varchar(32) NOT NULL,
  `address` varchar(512) NOT NULL,
  `isdefault` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_uinacid` (`uniacid`),
  KEY `idx_uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_mc_member_address`
--

LOCK TABLES `ims_mc_member_address` WRITE;
/*!40000 ALTER TABLE `ims_mc_member_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_mc_member_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_mc_member_fields`
--

DROP TABLE IF EXISTS `ims_mc_member_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_mc_member_fields` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) NOT NULL,
  `fieldid` int(10) NOT NULL,
  `title` varchar(255) NOT NULL,
  `available` tinyint(1) NOT NULL,
  `displayorder` smallint(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_fieldid` (`fieldid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_mc_member_fields`
--

LOCK TABLES `ims_mc_member_fields` WRITE;
/*!40000 ALTER TABLE `ims_mc_member_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_mc_member_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_mc_member_property`
--

DROP TABLE IF EXISTS `ims_mc_member_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_mc_member_property` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `property` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_mc_member_property`
--

LOCK TABLES `ims_mc_member_property` WRITE;
/*!40000 ALTER TABLE `ims_mc_member_property` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_mc_member_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_mc_members`
--

DROP TABLE IF EXISTS `ims_mc_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_mc_members` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `mobile` varchar(18) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(32) NOT NULL,
  `salt` varchar(8) NOT NULL,
  `groupid` int(11) NOT NULL,
  `credit1` decimal(10,2) unsigned NOT NULL,
  `credit2` decimal(10,2) unsigned NOT NULL,
  `credit3` decimal(10,2) unsigned NOT NULL,
  `credit4` decimal(10,2) unsigned NOT NULL,
  `credit5` decimal(10,2) unsigned NOT NULL,
  `credit6` decimal(10,2) NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `realname` varchar(10) NOT NULL,
  `nickname` varchar(20) NOT NULL,
  `avatar` varchar(255) NOT NULL,
  `qq` varchar(15) NOT NULL,
  `vip` tinyint(3) unsigned NOT NULL,
  `gender` tinyint(1) NOT NULL,
  `birthyear` smallint(6) unsigned NOT NULL,
  `birthmonth` tinyint(3) unsigned NOT NULL,
  `birthday` tinyint(3) unsigned NOT NULL,
  `constellation` varchar(10) NOT NULL,
  `zodiac` varchar(5) NOT NULL,
  `telephone` varchar(15) NOT NULL,
  `idcard` varchar(30) NOT NULL,
  `studentid` varchar(50) NOT NULL,
  `grade` varchar(10) NOT NULL,
  `address` varchar(255) NOT NULL,
  `zipcode` varchar(10) NOT NULL,
  `nationality` varchar(30) NOT NULL,
  `resideprovince` varchar(30) NOT NULL,
  `residecity` varchar(30) NOT NULL,
  `residedist` varchar(30) NOT NULL,
  `graduateschool` varchar(50) NOT NULL,
  `company` varchar(50) NOT NULL,
  `education` varchar(10) NOT NULL,
  `occupation` varchar(30) NOT NULL,
  `position` varchar(30) NOT NULL,
  `revenue` varchar(10) NOT NULL,
  `affectivestatus` varchar(30) NOT NULL,
  `lookingfor` varchar(255) NOT NULL,
  `bloodtype` varchar(5) NOT NULL,
  `height` varchar(5) NOT NULL,
  `weight` varchar(5) NOT NULL,
  `alipay` varchar(30) NOT NULL,
  `msn` varchar(30) NOT NULL,
  `taobao` varchar(30) NOT NULL,
  `site` varchar(30) NOT NULL,
  `bio` text NOT NULL,
  `interest` text NOT NULL,
  `pay_password` varchar(30) NOT NULL,
  `user_from` tinyint(1) NOT NULL,
  PRIMARY KEY (`uid`),
  KEY `groupid` (`groupid`),
  KEY `uniacid` (`uniacid`),
  KEY `email` (`email`),
  KEY `mobile` (`mobile`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_mc_members`
--

LOCK TABLES `ims_mc_members` WRITE;
/*!40000 ALTER TABLE `ims_mc_members` DISABLE KEYS */;
INSERT INTO `ims_mc_members` VALUES (1,1,'','2a733ef1e0a051594a927951119947b5@we7.cc','17a10411a796d2262f72e7dfb29835fd','I8nSYY0m',1,0.00,0.00,0.00,0.00,0.00,0.00,1650192385,'','逐梦','https://thirdwx.qlogo.cn/mmopen/vi_32/oqo2lpAQL4VxYn81gKoKxzb4QBXhT1sYumKhB0JSvTHRPonWwtwDNWZvn4UC9eJu8DoB3OVglRaicVrbkDOCvxQ/132','',0,0,0,0,0,'','','','','','','','','','省','市','','','','','','','','','','','','','','','','','','','',0),(2,1,'','42761767b426bf2e9b42392ba719106b@we7.cc','17a10411a796d2262f72e7dfb29835fd','WtZ9h0RG',1,0.00,0.00,0.00,0.00,0.00,0.00,1650194434,'','梦凌','https://thirdwx.qlogo.cn/mmopen/vi_32/pR9iaxY5iaqkg0TGcjcdy6ev4zibw8VW6KEmb26upqB6w8akeayhUIn9Et9ZmoTdSIM1ErLqeibPhKnEKCKicC9lahA/132','',0,0,0,0,0,'','','','','','','','','','省','市','','','','','','','','','','','','','','','','','','','',0),(3,1,'','aa4510e028eadda4ac8c8b460f4a4e6a@we7.cc','17a10411a796d2262f72e7dfb29835fd','k8c9lNy8',1,0.00,0.00,0.00,0.00,0.00,0.00,1650195047,'','逐梦','https://thirdwx.qlogo.cn/mmopen/vi_32/aMAQRXo5yCBQXyEvrLhwNJaSQXOuPEpcppbKleZypjMrW5na7iaKiaibxZe9UTTgqRVFHJv3mYXRGlMLibWxuG8Hpw/132','',0,0,0,0,0,'','','','','','','','','','省','市','','','','','','','','','','','','','','','','','','','',0),(4,1,'','84f467322c10e3dda387839b1ed5c8c4@we7.cc','17a10411a796d2262f72e7dfb29835fd','imPc06X0',1,0.00,0.00,0.00,0.00,0.00,0.00,1650195223,'','money','https://thirdwx.qlogo.cn/mmopen/vi_32/s6efzSuZdwlKfnZKNm8w9rcxwdIWGfw68S3qkIXGIl8IiaLng4RiaAgZ3PFwNpttibVM1dLt2PQib6rnaVSU11c4YQ/132','',0,0,0,0,0,'','','','','','','','','','省','市','','','','','','','','','','','','','','','','','','','',0),(5,1,'','624ccfa7b9f923d30ca2f73ae42ed72a@we7.cc','17a10411a796d2262f72e7dfb29835fd','dZ3D7ZVn',1,0.00,0.00,0.00,0.00,0.00,0.00,1650195923,'','DiDi支付','https://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLpaqvnFvnzOdojwhru520ibyTpYM2XYibIGFBUkRAQdjyfy7jaox1xBMhNO9vZFpichQFeukurljKSg/132','',0,0,0,0,0,'','','','','','','','','','省','市','','','','','','','','','','','','','','','','','','','',0),(6,1,'','9c90ce7b4b67ad66b25d8b623ab0c259@we7.cc','17a10411a796d2262f72e7dfb29835fd','z6FL69g6',1,0.00,0.00,0.00,0.00,0.00,0.00,1650196621,'','长安','https://thirdwx.qlogo.cn/mmopen/vi_32/js67LibY9Pb7HX3tX0humLibGZyCtLeaiceWKFO0c4rdCEyicvQ1h7YkAqPTfgQP385TOhU0aBX5y9vrahq7SR6u6w/132','',0,0,0,0,0,'','','','','','','','','','省','市','','','','','','','','','','','','','','','','','','','',0),(7,1,'','04cad8a4cf90a0ba738d4d0d19562ab7@we7.cc','17a10411a796d2262f72e7dfb29835fd','ywz746d6',1,0.00,0.00,0.00,0.00,0.00,0.00,1650202210,'','高志','https://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIYib4d64QBTQxjoyTicQZFhyCicZcdpCFVibpScgwOautsypiaCeem4McdlG0zsOjmxFhpTIxPbz37I2Q/132','',0,0,0,0,0,'','','','','','','','','','省','市','','','','','','','','','','','','','','','','','','','',0),(8,1,'','72eea268ff8819e18af05a95ead0e0ea@we7.cc','17a10411a796d2262f72e7dfb29835fd','VIfzhiyr',1,0.00,0.00,0.00,0.00,0.00,0.00,1650280540,'','晓宇(不回消息看朋友圈','https://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eozb7CDVSSzGPiaVayUicAKKZALsXeQ5wWINthA5bVsFbkGazuFjjqANPLX3XVicAkNy1ufEZjq9fSLg/132','',0,0,0,0,0,'','','','','','','','','','省','市','','','','','','','','','','','','','','','','','','','',0),(9,1,'','df28223c29bbc4dd6ff964a3512906e8@we7.cc','17a10411a796d2262f72e7dfb29835fd','P8AwZow8',1,0.00,0.00,0.00,0.00,0.00,0.00,1650288764,'','Tears.','https://thirdwx.qlogo.cn/mmopen/vi_32/5N34zfvABTR4utTHYhHic1xG29knNmyAjwtoxpA0ZhpqW3s2H6Bm5E9t1FLAdVx3FnYLYnCJRZmAKuTgQ4oJldg/132','',0,0,0,0,0,'','','','','','','','','','省','市','','','','','','','','','','','','','','','','','','','',0),(10,1,'','1538cb987e1b2c5114d536d784c90227@we7.cc','17a10411a796d2262f72e7dfb29835fd','LoLpkCLZ',1,0.00,0.00,0.00,0.00,0.00,0.00,1650288847,'','子夫','https://thirdwx.qlogo.cn/mmopen/vi_32/qsxkMxh6rhR2b27JaEddGaokh0iaKhxxCjwoGnmW9rZSUSVJw60vw9AbvRynEAUoaZ5cgGf6QJDAT7BmsTSVd4w/132','',0,0,0,0,0,'','','','','','','','','','省','市','','','','','','','','','','','','','','','','','','','',0),(11,1,'','5a41f528458507d06fe31c86bcc5a024@we7.cc','17a10411a796d2262f72e7dfb29835fd','mugdDDUK',1,0.00,0.00,0.00,0.00,0.00,0.00,1650290027,'','ᝰꫛꪮꪮꫜ','https://thirdwx.qlogo.cn/mmopen/vi_32/MY9lpHk6lv1j5tv3OibXia3OcxBJmZGjguO5Og7f6ydGkC5XSK5kONA35lUKdL0zx4ajEjsB8LVBOe00ox4Mj7aA/132','',0,0,0,0,0,'','','','','','','','','','省','市','','','','','','','','','','','','','','','','','','','',0),(12,1,'','9e9e799ad2158fd6704e3ad99c3c20a6@we7.cc','17a10411a796d2262f72e7dfb29835fd','KBbBZhBp',1,0.00,0.00,0.00,0.00,0.00,0.00,1650291041,'','孤玖','https://thirdwx.qlogo.cn/mmopen/vi_32/zxVN0QqibgaibNTzWba5yDibJ8CLOH6z2oOf7Mb4GWQFY932d4qzavUVvd4Yq8tT9QVC4eIw5VvXWaMauiaz2HuJoA/132','',0,0,0,0,0,'','','','','','','','','','省','市','','','','','','','','','','','','','','','','','','','',0),(13,1,'','15c2346ff24414ddb206ea007d676694@we7.cc','17a10411a796d2262f72e7dfb29835fd','P12R1xA6',1,0.00,0.00,0.00,0.00,0.00,0.00,1650292731,'','Y','https://thirdwx.qlogo.cn/mmopen/vi_32/Q8zMZPaSNF1yfibNfL3ALUo9AryUQOZFTJDOoFF0hWE4vWd74iciaSbcluJG9llg49P2MUgibSkEtPBoUtwMkvHakA/132','',0,0,0,0,0,'','','','','','','','','','省','市','','','','','','','','','','','','','','','','','','','',0),(14,1,'','166eaf4f8802db8e0b7602bba8b15ace@we7.cc','17a10411a796d2262f72e7dfb29835fd','jh9qHzkW',1,0.00,0.00,0.00,0.00,0.00,0.00,1650337677,'','程海宇','https://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIGmOThwmOWU0oIVVSe7vv5oHKbjBbDacFuKWicr1AAmhQ0h857ibaiacuacMRLuYlMdSVApaO2aZYwA/132','',0,0,0,0,0,'','','','','','','','','','省','市','','','','','','','','','','','','','','','','','','','',0),(15,1,'','cd6521cdf73b99da55c95aa60753a45e@we7.cc','17a10411a796d2262f72e7dfb29835fd','dWzJgG65',1,0.00,0.00,0.00,0.00,0.00,0.00,1650338397,'','梦凌','https://thirdwx.qlogo.cn/mmopen/vi_32/xejeKycdFc7lGWvibJYO0G6Tn2uPVmUSqDZt3Wiap5mtTz5qGePibMDySIJCUcs3XGZZoqibTJg39D3suKY8ttHTfw/132','',0,0,0,0,0,'','','','','','','','','','省','市','','','','','','','','','','','','','','','','','','','',0),(16,1,'','a70b0bafc99f650cf8429b21ee5b76a3@we7.cc','17a10411a796d2262f72e7dfb29835fd','feEDhvCO',1,0.00,0.00,0.00,0.00,0.00,0.00,1650349376,'','1.26','https://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKgDR5h5vL78RWWTzGqL89GbiazsLRCZOMVibye1fOsk4Za3ObvUuxjLWpCBAeBzuLQA5MicVYoQ947A/132','',0,0,0,0,0,'','','','','','','','','','省','市','','','','','','','','','','','','','','','','','','','',0),(17,1,'','9f390c83c5dc643963c48558ee63ebf1@we7.cc','17a10411a796d2262f72e7dfb29835fd','qbZOHvOf',1,0.00,0.00,0.00,0.00,0.00,0.00,1650351175,'','YP_s','https://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKEpiaNbpwnNtgC4JUibV5ibsSvnLxuvD6cTPVKmotcvtaibODCTY7ORzHhaHmbj6aSHoSE80HVyicGwRg/132','',0,0,0,0,0,'','','','','','','','','','省','市','','','','','','','','','','','','','','','','','','','',0),(18,1,'','0ce4e4b4222d173ef2888c98b19ae789@we7.cc','17a10411a796d2262f72e7dfb29835fd','B8TXoUO0',1,0.00,0.00,0.00,0.00,0.00,0.00,1650352230,'','不瘦到一百不改名','https://thirdwx.qlogo.cn/mmopen/vi_32/YSv4tFLeia3BLYvXI9pAmbChK2CNFQZiao1jqxea0B19RGx4Xh2bChFXHCAcWJd2Gwx6pFUlib2YVZOuMINWd4Pdw/132','',0,0,0,0,0,'','','','','','','','','','省','市','','','','','','','','','','','','','','','','','','','',0),(19,1,'','121d862805bc5a16b44993c96393a874@we7.cc','17a10411a796d2262f72e7dfb29835fd','wJGrsaSN',1,0.00,0.00,0.00,0.00,0.00,0.00,1650353949,'','ᝰꫛꪮꪮꫜ','https://thirdwx.qlogo.cn/mmopen/vi_32/UR4PvjicyIzEF80T6Is67eJPKDWHhUTj0H3yguWt4L5XibygTMgaDtaCLeQibffGciaib8YlUpoWvld1U3wAuOg9jRA/132','',0,0,0,0,0,'','','','','','','','','','省','市','','','','','','','','','','','','','','','','','','','',0),(20,1,'','ddea795a27921e1fdc50e39947cc9869@we7.cc','17a10411a796d2262f72e7dfb29835fd','Bh33jA5l',1,0.00,0.00,0.00,0.00,0.00,0.00,1650356262,'','Tears.','https://thirdwx.qlogo.cn/mmopen/vi_32/yefhcDLO07ep6cYAGnE3MRZqgaq5c1icd2P8FVDQgspomE38db4X9INXYBXEib96l0WXCLb865B5XfV1vQ44ZWFw/132','',0,0,0,0,0,'','','','','','','','','','省','市','','','','','','','','','','','','','','','','','','','',0),(21,1,'','fefd72b09ca757d5da2aae327919f91d@we7.cc','17a10411a796d2262f72e7dfb29835fd','ySsSf8ij',1,0.00,0.00,0.00,0.00,0.00,0.00,1650358728,'','长安','https://thirdwx.qlogo.cn/mmopen/vi_32/nfhQ5ibcibez6K0lFRNXjLBJiadFJqojujGrhF1z8r45Gd4nHQhnTQQXGjyhQCvdegUrfht58AQP2Bx0syqEzpwmg/132','',0,0,0,0,0,'','','','','','','','','','省','市','','','','','','','','','','','','','','','','','','','',0),(22,1,'','55bc5e8f4d82c5c4135de87b2fbb4359@we7.cc','17a10411a796d2262f72e7dfb29835fd','HKtpfPpa',1,0.00,0.00,0.00,0.00,0.00,0.00,1650358889,'','盲盒','https://thirdwx.qlogo.cn/mmopen/vi_32/OJDVARMlVtNRUx9rOyic88828Lk6h86CcqSqH4BhJym5vy0OkfsH0t6oFdVAzHfSndafWAdVaR2ryy6WiaSyPQyw/132','',0,0,0,0,0,'','','','','','','','','','省','市','','','','','','','','','','','','','','','','','','','',0),(23,1,'','facd5ea3fe2782875e0c7368015cd305@we7.cc','17a10411a796d2262f72e7dfb29835fd','dbNuhMuG',1,0.00,0.00,0.00,0.00,0.00,0.00,1650358982,'','.cium','https://thirdwx.qlogo.cn/mmopen/vi_32/icONDnYnxs86LNuCLM6n7YDiapgQZwPNsJ67FeSYjdA6l8A5vwO66aPupqAZBhdjcvVbN7MNWT74SnJDHr9n72LA/132','',0,0,0,0,0,'','','','','','','','','','省','市','','','','','','','','','','','','','','','','','','','',0),(24,1,'','491094ff5b10f820725257343190f059@we7.cc','17a10411a796d2262f72e7dfb29835fd','ERpGNpcG',1,0.00,0.00,0.00,0.00,0.00,0.00,1650359767,'','yeong7','https://thirdwx.qlogo.cn/mmopen/vi_32/3nQ1r3KiaGb6J75qUXcqbibWnvfv4CzssHxIBRygtYAaTqw7u2FXhHgE3WeF5AGiacahR4YbWLXQPqeLyoW78Eicww/132','',0,0,0,0,0,'','','','','','','','','','省','市','','','','','','','','','','','','','','','','','','','',0),(25,1,'','587d4a3a4b2ad19cd1b19926237683db@we7.cc','17a10411a796d2262f72e7dfb29835fd','DvVvvVHz',1,0.00,0.00,0.00,0.00,0.00,0.00,1650510617,'','·','https://thirdwx.qlogo.cn/mmopen/vi_32/bhYF8RK2Baic3mwtKiakYlYo1giaGlqK6hqEiaNHSN1oBplbdGFbOsG20u4IhUSGec63nNR8dgnFnCicaIcWLb7TQKg/132','',0,0,0,0,0,'','','','','','','','','','省','市','','','','','','','','','','','','','','','','','','','',0),(26,1,'','a038f78da942d3b2a00290b6c056d2b5@we7.cc','17a10411a796d2262f72e7dfb29835fd','D2pyrNsg',1,0.00,0.00,0.00,0.00,0.00,0.00,1650515227,'','ᯤ','https://thirdwx.qlogo.cn/mmopen/vi_32/GJCc3BIV33StBWH11Oq1tWFKojW2gIoibFQTfc7e5OibVWiad1Nl9otVbC3APSvxibhrozP8vpYdyTceMtCRVAZ8ng/132','',0,0,0,0,0,'','','','','','','','','','省','市','','','','','','','','','','','','','','','','','','','',0),(27,1,'','77537bbf0c4432bfeb5440492804a3ec@we7.cc','17a10411a796d2262f72e7dfb29835fd','am09BM9a',1,0.00,0.00,0.00,0.00,0.00,0.00,1650624497,'','抱米花','https://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eqiblJplHqjCOSFBHXR2V0hkHHF8rtVnHk0w0XE4WTPjiaS1Tjo8pDEpcxLHmPDicsGWTt8kr2YgKnUA/132','',0,0,0,0,0,'','','','','','','','','','省','市','','','','','','','','','','','','','','','','','','','',0),(28,1,'','5c895627f3ec8dd47e86db27335db674@we7.cc','17a10411a796d2262f72e7dfb29835fd','OmUtuAox',1,0.00,0.00,0.00,0.00,0.00,0.00,1650634043,'','沐文梦','https://thirdwx.qlogo.cn/mmopen/vi_32/jK4fNcqpSU3MkTpHVN6ibpfNib05N5qMySWgMIlibHqMRhNAB6MzAM8lQspyUk5dzIcElX5fNWhiajoIK3BURHx2Ng/132','',0,0,0,0,0,'','','','','','','','','','省','市','','','','','','','','','','','','','','','','','','','',0);
/*!40000 ALTER TABLE `ims_mc_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_mc_oauth_fans`
--

DROP TABLE IF EXISTS `ims_mc_oauth_fans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_mc_oauth_fans` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `oauth_openid` varchar(50) NOT NULL,
  `acid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `openid` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_oauthopenid_acid` (`oauth_openid`,`acid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_mc_oauth_fans`
--

LOCK TABLES `ims_mc_oauth_fans` WRITE;
/*!40000 ALTER TABLE `ims_mc_oauth_fans` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_mc_oauth_fans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_menu_event`
--

DROP TABLE IF EXISTS `ims_menu_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_menu_event` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `keyword` varchar(30) NOT NULL,
  `type` varchar(30) NOT NULL,
  `picmd5` varchar(32) NOT NULL,
  `openid` varchar(128) NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `picmd5` (`picmd5`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_menu_event`
--

LOCK TABLES `ims_menu_event` WRITE;
/*!40000 ALTER TABLE `ims_menu_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_menu_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_message_notice_log`
--

DROP TABLE IF EXISTS `ims_message_notice_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_message_notice_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` varchar(255) NOT NULL,
  `is_read` tinyint(3) NOT NULL,
  `uid` int(11) NOT NULL,
  `sign` varchar(22) NOT NULL,
  `type` tinyint(3) NOT NULL,
  `status` tinyint(3) DEFAULT NULL,
  `create_time` int(11) NOT NULL,
  `end_time` int(11) NOT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_message_notice_log`
--

LOCK TABLES `ims_message_notice_log` WRITE;
/*!40000 ALTER TABLE `ims_message_notice_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_message_notice_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_mobilenumber`
--

DROP TABLE IF EXISTS `ims_mobilenumber`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_mobilenumber` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rid` int(10) NOT NULL,
  `enabled` tinyint(1) unsigned NOT NULL,
  `dateline` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_mobilenumber`
--

LOCK TABLES `ims_mobilenumber` WRITE;
/*!40000 ALTER TABLE `ims_mobilenumber` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_mobilenumber` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_modules`
--

DROP TABLE IF EXISTS `ims_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_modules` (
  `mid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `application_type` tinyint(1) unsigned NOT NULL,
  `type` varchar(20) NOT NULL,
  `title` varchar(100) NOT NULL,
  `version` varchar(15) NOT NULL,
  `ability` varchar(500) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `author` varchar(50) NOT NULL,
  `url` varchar(255) NOT NULL,
  `settings` tinyint(1) NOT NULL,
  `subscribes` varchar(500) NOT NULL,
  `handles` varchar(500) NOT NULL,
  `isrulefields` tinyint(1) NOT NULL,
  `issystem` tinyint(1) unsigned NOT NULL,
  `target` int(10) unsigned NOT NULL,
  `iscard` tinyint(3) unsigned NOT NULL,
  `permissions` varchar(5000) NOT NULL,
  `title_initial` varchar(1) NOT NULL,
  `wxapp_support` tinyint(1) NOT NULL,
  `welcome_support` int(2) NOT NULL,
  `oauth_type` tinyint(1) NOT NULL,
  `webapp_support` tinyint(1) NOT NULL,
  `phoneapp_support` tinyint(1) NOT NULL,
  `account_support` tinyint(1) NOT NULL,
  `xzapp_support` tinyint(1) NOT NULL,
  `aliapp_support` tinyint(1) NOT NULL,
  `logo` varchar(250) NOT NULL,
  `baiduapp_support` tinyint(1) NOT NULL,
  `toutiaoapp_support` tinyint(1) NOT NULL,
  `from` varchar(10) NOT NULL,
  `cloud_record` tinyint(1) NOT NULL,
  `sections` int(10) unsigned NOT NULL,
  `label` varchar(500) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`mid`),
  KEY `idx_name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_modules`
--

LOCK TABLES `ims_modules` WRITE;
/*!40000 ALTER TABLE `ims_modules` DISABLE KEYS */;
INSERT INTO `ims_modules` VALUES (1,'basic',0,'system','基本文字回复','1.0','和您进行简单对话','一问一答得简单对话. 当访客的对话语句中包含指定关键字, 或对话语句完全等于特定关键字, 或符合某些特定的格式时. 系统自动应答设定好的回复内容.','WeEngine Team','http://www.we7.cc/',0,'','',1,1,0,0,'','',1,1,1,1,1,2,1,1,'',1,1,'',0,0,'',0),(2,'news',0,'system','基本混合图文回复','1.0','为你提供生动的图文资讯','一问一答得简单对话, 但是回复内容包括图片文字等更生动的媒体内容. 当访客的对话语句中包含指定关键字, 或对话语句完全等于特定关键字, 或符合某些特定的格式时. 系统自动应答设定好的图文回复内容.','WeEngine Team','http://www.we7.cc/',0,'','',1,1,0,0,'','',1,1,1,1,1,2,1,1,'',1,1,'',0,0,'',0),(3,'music',0,'system','基本音乐回复','1.0','提供语音、音乐等音频类回复','在回复规则中可选择具有语音、音乐等音频类的回复内容，并根据用户所设置的特定关键字精准的返回给粉丝，实现一问一答得简单对话。','WeEngine Team','http://www.we7.cc/',0,'','',1,1,0,0,'','',1,1,1,1,1,2,1,1,'',1,1,'',0,0,'',0),(4,'userapi',0,'system','自定义接口回复','1.1','更方便的第三方接口设置','自定义接口又称第三方接口，可以让开发者更方便的接入微信魔方系统，高效的与微信公众平台进行对接整合。','WeEngine Team','http://www.we7.cc/',0,'','',1,1,0,0,'','',1,1,1,1,1,2,1,1,'',1,1,'',0,0,'',0),(5,'recharge',0,'system','会员中心充值模块','1.0','提供会员充值功能','','WeEngine Team','http://www.we7.cc/',0,'','',0,1,0,0,'','',1,1,1,1,1,2,1,1,'',1,1,'',0,0,'',0),(6,'custom',0,'system','多客服转接','1.0.0','用来接入腾讯的多客服系统','','WeEngine Team','http://bbs.we7.cc',0,'a:0:{}','a:6:{i:0;s:5:\"image\";i:1;s:5:\"voice\";i:2;s:5:\"video\";i:3;s:8:\"location\";i:4;s:4:\"link\";i:5;s:4:\"text\";}',1,1,0,0,'','',1,1,1,1,1,2,1,1,'',1,1,'',0,0,'',0),(7,'images',0,'system','基本图片回复','1.0','提供图片回复','在回复规则中可选择具有图片的回复内容，并根据用户所设置的特定关键字精准的返回给粉丝图片。','WeEngine Team','http://www.we7.cc/',0,'','',1,1,0,0,'','',1,1,1,1,1,2,1,1,'',1,1,'',0,0,'',0),(8,'video',0,'system','基本视频回复','1.0','提供图片回复','在回复规则中可选择具有视频的回复内容，并根据用户所设置的特定关键字精准的返回给粉丝视频。','WeEngine Team','http://www.we7.cc/',0,'','',1,1,0,0,'','',1,1,1,1,1,2,1,1,'',1,1,'',0,0,'',0),(9,'voice',0,'system','基本语音回复','1.0','提供语音回复','在回复规则中可选择具有语音的回复内容，并根据用户所设置的特定关键字精准的返回给粉丝语音。','WeEngine Team','http://www.we7.cc/',0,'','',1,1,0,0,'','',1,1,1,1,1,2,1,1,'',1,1,'',0,0,'',0),(10,'chats',0,'system','发送客服消息','1.0','公众号可以在粉丝最后发送消息的48小时内无限制发送消息','','WeEngine Team','http://www.we7.cc/',0,'','',0,1,0,0,'','',1,1,1,1,1,2,1,1,'',1,1,'',0,0,'',0),(11,'wxcard',0,'system','微信卡券回复','1.0','微信卡券回复','微信卡券回复','WeEngine Team','http://www.we7.cc/',0,'','',1,1,0,0,'','',1,1,1,1,1,2,1,1,'',1,1,'',0,0,'',0),(12,'store',0,'business','站内商城','1.0','站内商城','站内商城','WeEngine Team','http://www.we7.cc/',0,'','',0,1,0,0,'','',1,1,1,1,1,2,1,1,'',1,1,'',0,0,'',0),(13,'vp_ph',1,'other','盲盒交友变现','1.4.4.9','盲盒交友变现','盲盒交友变现','小没源码','http://www.xmzyw.cn/',1,'a:8:{i:0;s:5:\"image\";i:1;s:9:\"subscribe\";i:2;s:11:\"unsubscribe\";i:3;s:5:\"event\";i:4;s:4:\"scan\";i:5;s:5:\"click\";i:6;s:4:\"view\";i:7;s:17:\"masssendjobfinish\";}','a:9:{i:0;s:4:\"text\";i:1;s:5:\"image\";i:2;s:9:\"subscribe\";i:3;s:11:\"unsubscribe\";i:4;s:5:\"event\";i:5;s:4:\"scan\";i:6;s:5:\"click\";i:7;s:4:\"view\";i:8;s:17:\"masssendjobfinish\";}',1,0,0,0,'a:0:{}','M',1,1,1,1,1,2,0,1,'addons/vp_ph/icon.jpg',1,1,'local',0,0,'',1);
/*!40000 ALTER TABLE `ims_modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_modules_bindings`
--

DROP TABLE IF EXISTS `ims_modules_bindings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_modules_bindings` (
  `eid` int(11) NOT NULL AUTO_INCREMENT,
  `module` varchar(100) NOT NULL,
  `entry` varchar(30) NOT NULL,
  `call` varchar(50) NOT NULL,
  `title` varchar(50) NOT NULL,
  `do` varchar(200) NOT NULL,
  `state` varchar(200) NOT NULL,
  `direct` int(11) NOT NULL,
  `url` varchar(100) NOT NULL,
  `icon` varchar(50) NOT NULL,
  `displayorder` tinyint(255) unsigned NOT NULL,
  `multilevel` tinyint(1) NOT NULL,
  `parent` varchar(50) NOT NULL,
  PRIMARY KEY (`eid`),
  KEY `idx_module` (`module`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_modules_bindings`
--

LOCK TABLES `ims_modules_bindings` WRITE;
/*!40000 ALTER TABLE `ims_modules_bindings` DISABLE KEYS */;
INSERT INTO `ims_modules_bindings` VALUES (1,'vp_ph','menu','','纸条管理','feed','',0,'','',0,0,''),(2,'vp_ph','menu','','用户管理','user','',0,'','',0,0,''),(3,'vp_ph','menu','','店主管理','agent','',0,'','',0,0,''),(4,'vp_ph','menu','','消费记录','order','',0,'','',0,0,''),(5,'vp_ph','menu','','提现管理','outcash','',0,'','',0,0,''),(6,'vp_ph','menu','','页面管理','page','',0,'','',0,0,'');
/*!40000 ALTER TABLE `ims_modules_bindings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_modules_cloud`
--

DROP TABLE IF EXISTS `ims_modules_cloud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_modules_cloud` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `application_type` tinyint(1) unsigned NOT NULL,
  `title` varchar(100) NOT NULL,
  `title_initial` varchar(1) NOT NULL,
  `logo` varchar(100) NOT NULL,
  `version` varchar(10) NOT NULL,
  `install_status` tinyint(4) NOT NULL,
  `account_support` tinyint(4) NOT NULL,
  `wxapp_support` tinyint(4) NOT NULL,
  `webapp_support` tinyint(4) NOT NULL,
  `phoneapp_support` tinyint(4) NOT NULL,
  `welcome_support` tinyint(4) NOT NULL,
  `main_module_name` varchar(50) NOT NULL,
  `main_module_logo` varchar(100) NOT NULL,
  `has_new_version` tinyint(1) NOT NULL,
  `has_new_branch` tinyint(1) NOT NULL,
  `is_ban` tinyint(4) NOT NULL,
  `lastupdatetime` int(11) NOT NULL,
  `xzapp_support` tinyint(1) NOT NULL,
  `cloud_id` int(11) NOT NULL,
  `aliapp_support` tinyint(1) NOT NULL,
  `baiduapp_support` tinyint(1) NOT NULL,
  `toutiaoapp_support` tinyint(1) NOT NULL,
  `buytime` int(10) NOT NULL,
  `module_status` tinyint(1) NOT NULL,
  `label` varchar(500) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `lastupdatetime` (`lastupdatetime`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_modules_cloud`
--

LOCK TABLES `ims_modules_cloud` WRITE;
/*!40000 ALTER TABLE `ims_modules_cloud` DISABLE KEYS */;
INSERT INTO `ims_modules_cloud` VALUES (2,'awei_theme03',2,'微擎awei_theme03','A','http://162.14.96.235/app/themes/awei_theme03/preview.jpg','1.0',2,2,1,1,1,1,'','',0,0,0,0,1,0,1,1,1,0,1,''),(3,'chengzi_fctemplate',2,'微擎chengzi_fctemplate','C','http://162.14.96.235/app/themes/chengzi_fctemplate/preview.jpg','1.0',2,2,1,1,1,1,'','',0,0,0,0,1,0,1,1,1,0,1,''),(4,'default',2,'微站默认模板','D','http://162.14.96.235/app/themes/default/preview.jpg','1.0',2,2,1,1,1,1,'','',0,0,0,0,1,0,1,1,1,0,1,''),(5,'hc_style003',2,'经典微站模板NO.003','H','http://162.14.96.235/app/themes/hc_style003/preview.jpg','4.0',2,2,1,1,1,1,'','',0,0,0,0,1,0,1,1,1,0,1,''),(6,'hc_style005',2,'经典微站模板NO.005','H','http://162.14.96.235/app/themes/hc_style005/preview.jpg','4.0',2,2,1,1,1,1,'','',0,0,0,0,1,0,1,1,1,0,1,''),(7,'hc_style012',2,'经典微站模板NO.012','H','http://162.14.96.235/app/themes/hc_style012/preview.jpg','5.0',2,2,1,1,1,1,'','',0,0,0,0,1,0,1,1,1,0,1,''),(8,'hccc04',2,'圆形无限分类','H','http://162.14.96.235/app/themes/hccc04/preview.jpg','3.0',2,2,1,1,1,1,'','',0,0,0,0,1,0,1,1,1,0,1,''),(9,'jh_jh',2,'微擎jh_jh','J','http://162.14.96.235/app/themes/jh_jh/preview.jpg','1.0',2,2,1,1,1,1,'','',0,0,0,0,1,0,1,1,1,0,1,''),(10,'liehuu_wei_01',2,'微擎liehuu_wei_01','L','http://162.14.96.235/app/themes/liehuu_wei_01/preview.jpg','1.0',2,2,1,1,1,1,'','',0,0,0,0,1,0,1,1,1,0,1,''),(11,'mihua03',2,'微擎mihua03','M','http://162.14.96.235/app/themes/mihua03/preview.jpg','1.0',2,2,1,1,1,1,'','',0,0,0,0,1,0,1,1,1,0,1,''),(12,'quick',2,'微信魔方-quick','Q','http://162.14.96.235/web/resource/images/nopic-203.png','1.0',2,2,1,1,1,1,'','',0,0,0,0,1,0,1,1,1,0,1,''),(13,'style1',2,'微站默认模板1','S','http://162.14.96.235/app/themes/style1/preview.jpg','9.1',2,2,1,1,1,1,'','',0,0,0,0,1,0,1,1,1,0,1,''),(14,'style2',2,'微站默认模板2','S','http://162.14.96.235/app/themes/style2/preview.jpg','9.2',2,2,1,1,1,1,'','',0,0,0,0,1,0,1,1,1,0,1,''),(15,'style3',2,'微站默认模板3','S','http://162.14.96.235/app/themes/style3/preview.jpg','10.1.2',2,2,1,1,1,1,'','',0,0,0,0,1,0,1,1,1,0,1,''),(16,'style4',2,'微站默认模板4','S','http://162.14.96.235/app/themes/style4/preview.jpg','9.0.1',2,2,1,1,1,1,'','',0,0,0,0,1,0,1,1,1,0,1,''),(17,'style5',2,'微站默认模板5','S','http://162.14.96.235/app/themes/style5/preview.jpg','6.0',2,2,1,1,1,1,'','',0,0,0,0,1,0,1,1,1,0,1,''),(18,'style6',2,'微站默认模板6','S','http://162.14.96.235/app/themes/style6/preview.jpg','6.0',2,2,1,1,1,1,'','',0,0,0,0,1,0,1,1,1,0,1,''),(19,'style7',2,'微站默认模板7','S','http://162.14.96.235/app/themes/style7/preview.jpg','6.0',2,2,1,1,1,1,'','',0,0,0,0,1,0,1,1,1,0,1,''),(20,'style8',2,'微站默认模板8','S','http://162.14.96.235/app/themes/style8/preview.jpg','9.2',2,2,1,1,1,1,'','',0,0,0,0,1,0,1,1,1,0,1,''),(21,'style9',2,'微擎style9','S','http://162.14.96.235/app/themes/style9/preview.jpg','6.0',2,2,1,1,1,1,'','',0,0,0,0,1,0,1,1,1,0,1,''),(22,'tiger_tkmb',2,'微信淘宝客','T','http://162.14.96.235/app/themes/tiger_tkmb/preview.jpg','1.0',2,2,1,1,1,1,'','',0,0,0,0,1,0,1,1,1,0,1,''),(23,'vcard03',2,'微擎vcard03','V','http://162.14.96.235/app/themes/vcard03/preview.jpg','4.1',2,2,1,1,1,1,'','',0,0,0,0,1,0,1,1,1,0,1,'');
/*!40000 ALTER TABLE `ims_modules_cloud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_modules_ignore`
--

DROP TABLE IF EXISTS `ims_modules_ignore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_modules_ignore` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `version` varchar(15) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_modules_ignore`
--

LOCK TABLES `ims_modules_ignore` WRITE;
/*!40000 ALTER TABLE `ims_modules_ignore` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_modules_ignore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_modules_plugin`
--

DROP TABLE IF EXISTS `ims_modules_plugin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_modules_plugin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `main_module` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `main_module` (`main_module`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_modules_plugin`
--

LOCK TABLES `ims_modules_plugin` WRITE;
/*!40000 ALTER TABLE `ims_modules_plugin` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_modules_plugin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_modules_plugin_rank`
--

DROP TABLE IF EXISTS `ims_modules_plugin_rank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_modules_plugin_rank` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) NOT NULL,
  `uid` int(10) NOT NULL,
  `rank` int(10) NOT NULL,
  `plugin_name` varchar(200) NOT NULL,
  `main_module_name` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_modules_plugin_rank`
--

LOCK TABLES `ims_modules_plugin_rank` WRITE;
/*!40000 ALTER TABLE `ims_modules_plugin_rank` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_modules_plugin_rank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_modules_rank`
--

DROP TABLE IF EXISTS `ims_modules_rank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_modules_rank` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `module_name` varchar(100) NOT NULL,
  `uid` int(10) NOT NULL,
  `rank` int(10) NOT NULL,
  `uniacid` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `module_name` (`module_name`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_modules_rank`
--

LOCK TABLES `ims_modules_rank` WRITE;
/*!40000 ALTER TABLE `ims_modules_rank` DISABLE KEYS */;
INSERT INTO `ims_modules_rank` VALUES (1,'vp_ph',1,0,1);
/*!40000 ALTER TABLE `ims_modules_rank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_modules_recycle`
--

DROP TABLE IF EXISTS `ims_modules_recycle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_modules_recycle` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `type` tinyint(4) NOT NULL,
  `account_support` tinyint(1) NOT NULL,
  `wxapp_support` tinyint(1) NOT NULL,
  `welcome_support` tinyint(1) NOT NULL,
  `webapp_support` tinyint(1) NOT NULL,
  `phoneapp_support` tinyint(1) NOT NULL,
  `xzapp_support` tinyint(1) NOT NULL,
  `aliapp_support` tinyint(1) NOT NULL,
  `baiduapp_support` tinyint(1) NOT NULL,
  `toutiaoapp_support` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_modules_recycle`
--

LOCK TABLES `ims_modules_recycle` WRITE;
/*!40000 ALTER TABLE `ims_modules_recycle` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_modules_recycle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_music_reply`
--

DROP TABLE IF EXISTS `ims_music_reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_music_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  `url` varchar(300) NOT NULL,
  `hqurl` varchar(300) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_music_reply`
--

LOCK TABLES `ims_music_reply` WRITE;
/*!40000 ALTER TABLE `ims_music_reply` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_music_reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_news_reply`
--

DROP TABLE IF EXISTS `ims_news_reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_news_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL,
  `parent_id` int(10) NOT NULL,
  `title` varchar(50) NOT NULL,
  `author` varchar(64) NOT NULL,
  `description` varchar(255) NOT NULL,
  `thumb` varchar(500) NOT NULL,
  `content` mediumtext NOT NULL,
  `url` varchar(255) NOT NULL,
  `displayorder` int(10) NOT NULL,
  `incontent` tinyint(1) NOT NULL,
  `createtime` int(10) NOT NULL,
  `media_id` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_news_reply`
--

LOCK TABLES `ims_news_reply` WRITE;
/*!40000 ALTER TABLE `ims_news_reply` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_news_reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_phoneapp_versions`
--

DROP TABLE IF EXISTS `ims_phoneapp_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_phoneapp_versions` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) NOT NULL,
  `version` varchar(20) NOT NULL,
  `description` varchar(255) NOT NULL,
  `modules` text NOT NULL,
  `createtime` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `version` (`version`),
  KEY `uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_phoneapp_versions`
--

LOCK TABLES `ims_phoneapp_versions` WRITE;
/*!40000 ALTER TABLE `ims_phoneapp_versions` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_phoneapp_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_profile_fields`
--

DROP TABLE IF EXISTS `ims_profile_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_profile_fields` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `field` varchar(255) NOT NULL,
  `available` tinyint(1) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `displayorder` smallint(6) NOT NULL,
  `required` tinyint(1) NOT NULL,
  `unchangeable` tinyint(1) NOT NULL,
  `showinregister` tinyint(1) NOT NULL,
  `field_length` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_profile_fields`
--

LOCK TABLES `ims_profile_fields` WRITE;
/*!40000 ALTER TABLE `ims_profile_fields` DISABLE KEYS */;
INSERT INTO `ims_profile_fields` VALUES (1,'realname',1,'真实姓名','',0,1,1,1,0),(2,'nickname',1,'昵称','',1,1,0,1,0),(3,'avatar',1,'头像','',1,0,0,0,0),(4,'qq',1,'QQ号','',0,0,0,1,0),(5,'mobile',1,'手机号码','',0,0,0,0,0),(6,'vip',1,'VIP级别','',0,0,0,0,0),(7,'gender',1,'性别','',0,0,0,0,0),(8,'birthyear',1,'出生生日','',0,0,0,0,0),(9,'constellation',1,'星座','',0,0,0,0,0),(10,'zodiac',1,'生肖','',0,0,0,0,0),(11,'telephone',1,'固定电话','',0,0,0,0,0),(12,'idcard',1,'证件号码','',0,0,0,0,0),(13,'studentid',1,'学号','',0,0,0,0,0),(14,'grade',1,'班级','',0,0,0,0,0),(15,'address',1,'邮寄地址','',0,0,0,0,0),(16,'zipcode',1,'邮编','',0,0,0,0,0),(17,'nationality',1,'国籍','',0,0,0,0,0),(18,'resideprovince',1,'居住地址','',0,0,0,0,0),(19,'graduateschool',1,'毕业学校','',0,0,0,0,0),(20,'company',1,'公司','',0,0,0,0,0),(21,'education',1,'学历','',0,0,0,0,0),(22,'occupation',1,'职业','',0,0,0,0,0),(23,'position',1,'职位','',0,0,0,0,0),(24,'revenue',1,'年收入','',0,0,0,0,0),(25,'affectivestatus',1,'情感状态','',0,0,0,0,0),(26,'lookingfor',1,' 交友目的','',0,0,0,0,0),(27,'bloodtype',1,'血型','',0,0,0,0,0),(28,'height',1,'身高','',0,0,0,0,0),(29,'weight',1,'体重','',0,0,0,0,0),(30,'alipay',1,'支付宝帐号','',0,0,0,0,0),(31,'msn',1,'MSN','',0,0,0,0,0),(32,'email',1,'电子邮箱','',0,0,0,0,0),(33,'taobao',1,'阿里旺旺','',0,0,0,0,0),(34,'site',1,'主页','',0,0,0,0,0),(35,'bio',1,'自我介绍','',0,0,0,0,0),(36,'interest',1,'兴趣爱好','',0,0,0,0,0);
/*!40000 ALTER TABLE `ims_profile_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_qrcode`
--

DROP TABLE IF EXISTS `ims_qrcode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_qrcode` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `acid` int(10) unsigned NOT NULL,
  `type` varchar(10) NOT NULL,
  `extra` int(10) unsigned NOT NULL,
  `qrcid` bigint(20) NOT NULL,
  `scene_str` varchar(64) NOT NULL,
  `name` varchar(50) NOT NULL,
  `keyword` varchar(100) NOT NULL,
  `model` tinyint(1) unsigned NOT NULL,
  `ticket` varchar(250) NOT NULL,
  `url` varchar(256) NOT NULL,
  `expire` int(10) unsigned NOT NULL,
  `subnum` int(10) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `status` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_qrcid` (`qrcid`),
  KEY `uniacid` (`uniacid`),
  KEY `ticket` (`ticket`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_qrcode`
--

LOCK TABLES `ims_qrcode` WRITE;
/*!40000 ALTER TABLE `ims_qrcode` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_qrcode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_qrcode_stat`
--

DROP TABLE IF EXISTS `ims_qrcode_stat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_qrcode_stat` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `acid` int(10) unsigned NOT NULL,
  `qid` int(10) unsigned NOT NULL,
  `openid` varchar(50) NOT NULL,
  `type` tinyint(1) unsigned NOT NULL,
  `qrcid` bigint(20) unsigned NOT NULL,
  `scene_str` varchar(64) NOT NULL,
  `name` varchar(50) NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_qrcode_stat`
--

LOCK TABLES `ims_qrcode_stat` WRITE;
/*!40000 ALTER TABLE `ims_qrcode_stat` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_qrcode_stat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_rule`
--

DROP TABLE IF EXISTS `ims_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `module` varchar(50) NOT NULL,
  `displayorder` int(10) unsigned NOT NULL,
  `status` tinyint(1) unsigned NOT NULL,
  `containtype` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_rule`
--

LOCK TABLES `ims_rule` WRITE;
/*!40000 ALTER TABLE `ims_rule` DISABLE KEYS */;
INSERT INTO `ims_rule` VALUES (1,0,'城市天气','userapi',255,1,''),(2,0,'百度百科','userapi',255,1,''),(3,0,'即时翻译','userapi',255,1,''),(4,0,'今日老黄历','userapi',255,1,''),(5,0,'看新闻','userapi',255,1,''),(6,0,'快递查询','userapi',255,1,''),(7,1,'个人中心入口设置','cover',0,1,''),(8,1,'微信魔方团队入口设置','cover',0,1,'');
/*!40000 ALTER TABLE `ims_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_rule_keyword`
--

DROP TABLE IF EXISTS `ims_rule_keyword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_rule_keyword` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL,
  `uniacid` int(10) unsigned NOT NULL,
  `module` varchar(50) NOT NULL,
  `content` varchar(255) NOT NULL,
  `type` tinyint(1) unsigned NOT NULL,
  `displayorder` tinyint(3) unsigned NOT NULL,
  `status` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_content` (`content`),
  KEY `rid` (`rid`),
  KEY `idx_rid` (`rid`),
  KEY `idx_uniacid_type_content` (`uniacid`,`type`,`content`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_rule_keyword`
--

LOCK TABLES `ims_rule_keyword` WRITE;
/*!40000 ALTER TABLE `ims_rule_keyword` DISABLE KEYS */;
INSERT INTO `ims_rule_keyword` VALUES (1,1,0,'userapi','^.+天气$',3,255,1),(2,2,0,'userapi','^百科.+$',3,255,1),(3,2,0,'userapi','^定义.+$',3,255,1),(4,3,0,'userapi','^@.+$',3,255,1),(5,4,0,'userapi','日历',1,255,1),(6,4,0,'userapi','万年历',1,255,1),(7,4,0,'userapi','黄历',1,255,1),(8,4,0,'userapi','几号',1,255,1),(9,5,0,'userapi','新闻',1,255,1),(10,6,0,'userapi','^(申通|圆通|中通|汇通|韵达|顺丰|EMS) *[a-z0-9]{1,}$',3,255,1),(11,7,1,'cover','个人中心',1,0,1),(12,8,1,'cover','首页',1,0,1);
/*!40000 ALTER TABLE `ims_rule_keyword` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_site_article`
--

DROP TABLE IF EXISTS `ims_site_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_site_article` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `rid` int(10) unsigned NOT NULL,
  `kid` int(10) unsigned NOT NULL,
  `iscommend` tinyint(1) NOT NULL,
  `ishot` tinyint(1) unsigned NOT NULL,
  `pcate` int(10) unsigned NOT NULL,
  `ccate` int(10) unsigned NOT NULL,
  `template` varchar(300) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` varchar(100) NOT NULL,
  `content` mediumtext NOT NULL,
  `thumb` varchar(255) NOT NULL,
  `incontent` tinyint(1) NOT NULL,
  `source` varchar(255) NOT NULL,
  `author` varchar(50) NOT NULL,
  `displayorder` int(10) unsigned NOT NULL,
  `linkurl` varchar(500) NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `edittime` int(10) NOT NULL,
  `click` int(10) unsigned NOT NULL,
  `type` varchar(10) NOT NULL,
  `credit` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_iscommend` (`iscommend`),
  KEY `idx_ishot` (`ishot`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_site_article`
--

LOCK TABLES `ims_site_article` WRITE;
/*!40000 ALTER TABLE `ims_site_article` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_site_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_site_article_comment`
--

DROP TABLE IF EXISTS `ims_site_article_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_site_article_comment` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) NOT NULL,
  `articleid` int(10) NOT NULL,
  `parentid` int(10) NOT NULL,
  `uid` int(10) NOT NULL,
  `openid` varchar(50) NOT NULL,
  `content` text,
  `is_read` tinyint(1) NOT NULL,
  `iscomment` tinyint(1) NOT NULL,
  `createtime` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `articleid` (`articleid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_site_article_comment`
--

LOCK TABLES `ims_site_article_comment` WRITE;
/*!40000 ALTER TABLE `ims_site_article_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_site_article_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_site_category`
--

DROP TABLE IF EXISTS `ims_site_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_site_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `nid` int(10) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `parentid` int(10) unsigned NOT NULL,
  `displayorder` tinyint(3) unsigned NOT NULL,
  `enabled` tinyint(1) unsigned NOT NULL,
  `icon` varchar(100) NOT NULL,
  `description` varchar(100) NOT NULL,
  `styleid` int(10) unsigned NOT NULL,
  `linkurl` varchar(500) NOT NULL,
  `ishomepage` tinyint(1) NOT NULL,
  `icontype` tinyint(1) unsigned NOT NULL,
  `css` varchar(500) NOT NULL,
  `multiid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_site_category`
--

LOCK TABLES `ims_site_category` WRITE;
/*!40000 ALTER TABLE `ims_site_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_site_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_site_multi`
--

DROP TABLE IF EXISTS `ims_site_multi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_site_multi` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `title` varchar(30) NOT NULL,
  `styleid` int(10) unsigned NOT NULL,
  `site_info` text NOT NULL,
  `status` tinyint(3) unsigned NOT NULL,
  `bindhost` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `bindhost` (`bindhost`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_site_multi`
--

LOCK TABLES `ims_site_multi` WRITE;
/*!40000 ALTER TABLE `ims_site_multi` DISABLE KEYS */;
INSERT INTO `ims_site_multi` VALUES (1,1,'微信魔方团队',1,'',1,'');
/*!40000 ALTER TABLE `ims_site_multi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_site_nav`
--

DROP TABLE IF EXISTS `ims_site_nav`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_site_nav` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `multiid` int(10) unsigned NOT NULL,
  `section` tinyint(4) NOT NULL,
  `module` varchar(50) NOT NULL,
  `displayorder` smallint(5) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `position` tinyint(4) NOT NULL,
  `url` varchar(255) NOT NULL,
  `icon` varchar(500) NOT NULL,
  `css` varchar(1000) NOT NULL,
  `status` tinyint(1) unsigned NOT NULL,
  `categoryid` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `multiid` (`multiid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_site_nav`
--

LOCK TABLES `ims_site_nav` WRITE;
/*!40000 ALTER TABLE `ims_site_nav` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_site_nav` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_site_page`
--

DROP TABLE IF EXISTS `ims_site_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_site_page` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `multiid` int(10) unsigned NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  `params` longtext NOT NULL,
  `html` longtext NOT NULL,
  `multipage` longtext NOT NULL,
  `type` tinyint(1) unsigned NOT NULL,
  `status` tinyint(1) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `goodnum` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `multiid` (`multiid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_site_page`
--

LOCK TABLES `ims_site_page` WRITE;
/*!40000 ALTER TABLE `ims_site_page` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_site_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_site_slide`
--

DROP TABLE IF EXISTS `ims_site_slide`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_site_slide` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `multiid` int(10) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `thumb` varchar(255) NOT NULL,
  `displayorder` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `multiid` (`multiid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_site_slide`
--

LOCK TABLES `ims_site_slide` WRITE;
/*!40000 ALTER TABLE `ims_site_slide` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_site_slide` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_site_store_cash_log`
--

DROP TABLE IF EXISTS `ims_site_store_cash_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_site_store_cash_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `founder_uid` int(10) NOT NULL,
  `number` char(30) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `create_time` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `founder_uid` (`founder_uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_site_store_cash_log`
--

LOCK TABLES `ims_site_store_cash_log` WRITE;
/*!40000 ALTER TABLE `ims_site_store_cash_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_site_store_cash_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_site_store_cash_order`
--

DROP TABLE IF EXISTS `ims_site_store_cash_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_site_store_cash_order` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `number` char(30) NOT NULL,
  `founder_uid` int(10) NOT NULL,
  `order_id` int(10) NOT NULL,
  `goods_id` int(10) NOT NULL,
  `order_amount` decimal(10,2) NOT NULL,
  `cash_log_id` int(10) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `create_time` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `founder_uid` (`founder_uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_site_store_cash_order`
--

LOCK TABLES `ims_site_store_cash_order` WRITE;
/*!40000 ALTER TABLE `ims_site_store_cash_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_site_store_cash_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_site_store_create_account`
--

DROP TABLE IF EXISTS `ims_site_store_create_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_site_store_create_account` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL,
  `uniacid` int(10) NOT NULL,
  `type` tinyint(4) NOT NULL,
  `endtime` int(12) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_site_store_create_account`
--

LOCK TABLES `ims_site_store_create_account` WRITE;
/*!40000 ALTER TABLE `ims_site_store_create_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_site_store_create_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_site_store_goods`
--

DROP TABLE IF EXISTS `ims_site_store_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_site_store_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) NOT NULL,
  `title` varchar(100) NOT NULL,
  `module` varchar(50) NOT NULL,
  `account_num` int(10) NOT NULL,
  `wxapp_num` int(10) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `unit` varchar(15) NOT NULL,
  `slide` varchar(1000) NOT NULL,
  `category_id` int(10) NOT NULL,
  `title_initial` varchar(1) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `createtime` int(10) NOT NULL,
  `synopsis` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `module_group` int(10) NOT NULL,
  `api_num` int(10) NOT NULL,
  `user_group_price` varchar(1000) NOT NULL,
  `user_group` int(10) NOT NULL,
  `account_group` int(10) NOT NULL,
  `is_wish` tinyint(1) NOT NULL,
  `logo` varchar(300) NOT NULL,
  `platform_num` int(10) NOT NULL,
  `aliapp_num` int(10) NOT NULL,
  `baiduapp_num` int(10) NOT NULL,
  `phoneapp_num` int(10) NOT NULL,
  `toutiaoapp_num` int(10) NOT NULL,
  `webapp_num` int(10) NOT NULL,
  `xzapp_num` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `module` (`module`),
  KEY `category_id` (`category_id`),
  KEY `price` (`price`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_site_store_goods`
--

LOCK TABLES `ims_site_store_goods` WRITE;
/*!40000 ALTER TABLE `ims_site_store_goods` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_site_store_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_site_store_goods_cloud`
--

DROP TABLE IF EXISTS `ims_site_store_goods_cloud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_site_store_goods_cloud` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `cloud_id` int(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL,
  `logo` varchar(300) NOT NULL,
  `wish_branch` int(10) NOT NULL,
  `is_edited` tinyint(1) NOT NULL,
  `isdeleted` tinyint(1) NOT NULL,
  `branchs` varchar(6000) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cloud_id` (`cloud_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_site_store_goods_cloud`
--

LOCK TABLES `ims_site_store_goods_cloud` WRITE;
/*!40000 ALTER TABLE `ims_site_store_goods_cloud` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_site_store_goods_cloud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_site_store_order`
--

DROP TABLE IF EXISTS `ims_site_store_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_site_store_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `orderid` varchar(28) NOT NULL,
  `goodsid` int(10) NOT NULL,
  `duration` int(10) NOT NULL,
  `buyer` varchar(50) NOT NULL,
  `buyerid` int(10) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `type` tinyint(1) NOT NULL,
  `changeprice` tinyint(1) NOT NULL,
  `createtime` int(10) NOT NULL,
  `uniacid` int(10) NOT NULL,
  `endtime` int(15) NOT NULL,
  `wxapp` int(15) NOT NULL,
  `is_wish` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `goodid` (`goodsid`),
  KEY `buyerid` (`buyerid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_site_store_order`
--

LOCK TABLES `ims_site_store_order` WRITE;
/*!40000 ALTER TABLE `ims_site_store_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_site_store_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_site_styles`
--

DROP TABLE IF EXISTS `ims_site_styles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_site_styles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `templateid` int(10) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_site_styles`
--

LOCK TABLES `ims_site_styles` WRITE;
/*!40000 ALTER TABLE `ims_site_styles` DISABLE KEYS */;
INSERT INTO `ims_site_styles` VALUES (1,1,13,'微站默认模板_gC5C');
/*!40000 ALTER TABLE `ims_site_styles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_site_styles_vars`
--

DROP TABLE IF EXISTS `ims_site_styles_vars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_site_styles_vars` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `templateid` int(10) unsigned NOT NULL,
  `styleid` int(10) unsigned NOT NULL,
  `variable` varchar(50) NOT NULL,
  `content` text NOT NULL,
  `description` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_site_styles_vars`
--

LOCK TABLES `ims_site_styles_vars` WRITE;
/*!40000 ALTER TABLE `ims_site_styles_vars` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_site_styles_vars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_site_templates`
--

DROP TABLE IF EXISTS `ims_site_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_site_templates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `title` varchar(30) NOT NULL,
  `version` varchar(64) NOT NULL,
  `description` varchar(500) NOT NULL,
  `author` varchar(50) NOT NULL,
  `url` varchar(255) NOT NULL,
  `type` varchar(20) NOT NULL,
  `sections` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_site_templates`
--

LOCK TABLES `ims_site_templates` WRITE;
/*!40000 ALTER TABLE `ims_site_templates` DISABLE KEYS */;
INSERT INTO `ims_site_templates` VALUES (1,'default','微站默认模板','','由微信魔方提供默认微站模板套系','微信魔方团队','http://we7.cc','1',0);
/*!40000 ALTER TABLE `ims_site_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_stat_fans`
--

DROP TABLE IF EXISTS `ims_stat_fans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_stat_fans` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `new` int(10) unsigned NOT NULL,
  `cancel` int(10) unsigned NOT NULL,
  `cumulate` int(10) NOT NULL,
  `date` varchar(8) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`,`date`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_stat_fans`
--

LOCK TABLES `ims_stat_fans` WRITE;
/*!40000 ALTER TABLE `ims_stat_fans` DISABLE KEYS */;
INSERT INTO `ims_stat_fans` VALUES (1,1,0,0,10,'20220416'),(2,1,0,0,10,'20220415'),(3,1,0,0,10,'20220414'),(4,1,0,0,10,'20220413'),(5,1,0,0,10,'20220412'),(6,1,0,0,10,'20220411'),(7,1,0,0,10,'20220410');
/*!40000 ALTER TABLE `ims_stat_fans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_stat_keyword`
--

DROP TABLE IF EXISTS `ims_stat_keyword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_stat_keyword` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `rid` varchar(10) NOT NULL,
  `kid` int(10) unsigned NOT NULL,
  `hit` int(10) unsigned NOT NULL,
  `lastupdate` int(10) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_createtime` (`createtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_stat_keyword`
--

LOCK TABLES `ims_stat_keyword` WRITE;
/*!40000 ALTER TABLE `ims_stat_keyword` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_stat_keyword` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_stat_msg_history`
--

DROP TABLE IF EXISTS `ims_stat_msg_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_stat_msg_history` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `rid` int(10) unsigned NOT NULL,
  `kid` int(10) unsigned NOT NULL,
  `from_user` varchar(50) NOT NULL,
  `module` varchar(50) NOT NULL,
  `message` varchar(1000) NOT NULL,
  `type` varchar(10) NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_createtime` (`createtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_stat_msg_history`
--

LOCK TABLES `ims_stat_msg_history` WRITE;
/*!40000 ALTER TABLE `ims_stat_msg_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_stat_msg_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_stat_rule`
--

DROP TABLE IF EXISTS `ims_stat_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_stat_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `rid` int(10) unsigned NOT NULL,
  `hit` int(10) unsigned NOT NULL,
  `lastupdate` int(10) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_createtime` (`createtime`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_stat_rule`
--

LOCK TABLES `ims_stat_rule` WRITE;
/*!40000 ALTER TABLE `ims_stat_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_stat_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_stat_visit`
--

DROP TABLE IF EXISTS `ims_stat_visit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_stat_visit` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) NOT NULL,
  `module` varchar(100) NOT NULL,
  `count` int(10) unsigned NOT NULL,
  `date` int(10) unsigned NOT NULL,
  `type` varchar(10) NOT NULL,
  `ip_count` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `date` (`date`),
  KEY `module` (`module`),
  KEY `uniacid` (`uniacid`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_stat_visit`
--

LOCK TABLES `ims_stat_visit` WRITE;
/*!40000 ALTER TABLE `ims_stat_visit` DISABLE KEYS */;
INSERT INTO `ims_stat_visit` VALUES (1,0,'',16,20220417,'web',4),(2,1,'we7_account',120,20220417,'web',0),(3,1,'vp_ph',12,20220417,'app',1),(4,1,'',48,20220417,'web',0),(5,1,'we7_api',1,20220417,'app',1),(6,1,'wesite',3,20220417,'app',2),(7,0,'',16,20220418,'web',7),(8,1,'wesite',3,20220418,'app',2),(9,1,'',111,20220418,'web',4),(10,1,'we7_account',183,20220418,'web',0),(11,1,'',66,20220419,'web',5),(12,1,'we7_account',161,20220419,'web',1),(13,0,'',3,20220419,'web',3),(14,1,'',3,20220420,'web',1),(15,1,'we7_account',8,20220420,'web',0),(16,1,'',1,20220421,'web',1),(17,1,'we7_account',4,20220421,'web',0),(18,1,'',14,20220422,'web',1),(19,1,'we7_account',29,20220422,'web',0),(20,0,'',5,20220422,'web',4);
/*!40000 ALTER TABLE `ims_stat_visit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_stat_visit_ip`
--

DROP TABLE IF EXISTS `ims_stat_visit_ip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_stat_visit_ip` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `ip` bigint(10) NOT NULL,
  `uniacid` int(10) NOT NULL,
  `type` varchar(10) NOT NULL,
  `module` varchar(100) NOT NULL,
  `date` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ip_date_module_uniacid` (`ip`,`date`,`module`,`uniacid`)
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_stat_visit_ip`
--

LOCK TABLES `ims_stat_visit_ip` WRITE;
/*!40000 ALTER TABLE `ims_stat_visit_ip` DISABLE KEYS */;
INSERT INTO `ims_stat_visit_ip` VALUES (12,1920064775,1,'app','wesite',20220418),(13,1864036602,0,'web','',20220418),(14,992945666,1,'web','',20220418),(15,992745660,1,'app','wesite',20220418),(16,614291243,1,'web','',20220418),(17,24506702,0,'web','',20220418),(18,1033761655,1,'web','',20220418),(19,2937232553,0,'web','',20220418),(20,1708041745,0,'web','',20220418),(21,1971853466,1,'web','',20220418),(22,614291243,1,'web','',20220419),(23,1864036602,0,'web','',20220419),(24,992745660,1,'web','',20220419),(25,1920064775,1,'web','we7_account',20220419),(26,1864036599,0,'web','',20220419),(27,2937232553,1,'web','',20220419),(28,1999438927,0,'web','',20220419),(29,1971853456,1,'web','',20220419),(30,1863765951,1,'web','',20220419),(31,1863765951,1,'web','',20220420),(32,1863765951,1,'web','',20220421),(33,3748168386,1,'web','',20220422),(34,1033761657,0,'web','',20220422),(35,460553222,0,'web','',20220422),(36,720112212,0,'web','',20220422),(37,720112234,0,'web','',20220422);
/*!40000 ALTER TABLE `ims_stat_visit_ip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_system_stat_visit`
--

DROP TABLE IF EXISTS `ims_system_stat_visit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_system_stat_visit` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) NOT NULL,
  `modulename` varchar(100) NOT NULL,
  `uid` int(10) NOT NULL,
  `displayorder` int(10) NOT NULL,
  `createtime` int(10) NOT NULL,
  `updatetime` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_system_stat_visit`
--

LOCK TABLES `ims_system_stat_visit` WRITE;
/*!40000 ALTER TABLE `ims_system_stat_visit` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_system_stat_visit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_system_welcome_binddomain`
--

DROP TABLE IF EXISTS `ims_system_welcome_binddomain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_system_welcome_binddomain` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL,
  `module_name` varchar(50) NOT NULL,
  `domain` varchar(50) NOT NULL,
  `createtime` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `module_name` (`module_name`),
  KEY `uid` (`uid`),
  KEY `domain` (`domain`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_system_welcome_binddomain`
--

LOCK TABLES `ims_system_welcome_binddomain` WRITE;
/*!40000 ALTER TABLE `ims_system_welcome_binddomain` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_system_welcome_binddomain` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_uni_account`
--

DROP TABLE IF EXISTS `ims_uni_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_uni_account` (
  `uniacid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `groupid` int(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(255) NOT NULL,
  `default_acid` int(10) unsigned NOT NULL,
  `rank` int(10) DEFAULT NULL,
  `title_initial` varchar(1) NOT NULL,
  `createtime` int(10) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `qrcode` varchar(255) NOT NULL,
  `create_uid` int(11) NOT NULL,
  PRIMARY KEY (`uniacid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_uni_account`
--

LOCK TABLES `ims_uni_account` WRITE;
/*!40000 ALTER TABLE `ims_uni_account` DISABLE KEYS */;
INSERT INTO `ims_uni_account` VALUES (1,-1,'微信魔方团队','一个朝气蓬勃的团队',1,NULL,'W',0,'','',0);
/*!40000 ALTER TABLE `ims_uni_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_uni_account_extra_modules`
--

DROP TABLE IF EXISTS `ims_uni_account_extra_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_uni_account_extra_modules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `modules` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_uni_account_extra_modules`
--

LOCK TABLES `ims_uni_account_extra_modules` WRITE;
/*!40000 ALTER TABLE `ims_uni_account_extra_modules` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_uni_account_extra_modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_uni_account_group`
--

DROP TABLE IF EXISTS `ims_uni_account_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_uni_account_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `groupid` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_uni_account_group`
--

LOCK TABLES `ims_uni_account_group` WRITE;
/*!40000 ALTER TABLE `ims_uni_account_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_uni_account_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_uni_account_menus`
--

DROP TABLE IF EXISTS `ims_uni_account_menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_uni_account_menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `menuid` int(10) unsigned NOT NULL,
  `type` tinyint(3) unsigned NOT NULL,
  `title` varchar(30) NOT NULL,
  `sex` tinyint(3) unsigned NOT NULL,
  `group_id` int(10) NOT NULL,
  `client_platform_type` tinyint(3) unsigned NOT NULL,
  `area` varchar(50) NOT NULL,
  `data` text NOT NULL,
  `status` tinyint(3) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `isdeleted` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `menuid` (`menuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_uni_account_menus`
--

LOCK TABLES `ims_uni_account_menus` WRITE;
/*!40000 ALTER TABLE `ims_uni_account_menus` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_uni_account_menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_uni_account_modules`
--

DROP TABLE IF EXISTS `ims_uni_account_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_uni_account_modules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `module` varchar(50) NOT NULL,
  `enabled` tinyint(1) unsigned NOT NULL,
  `settings` text NOT NULL,
  `shortcut` tinyint(1) unsigned NOT NULL,
  `displayorder` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_module` (`module`),
  KEY `idx_uniacid` (`uniacid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_uni_account_modules`
--

LOCK TABLES `ims_uni_account_modules` WRITE;
/*!40000 ALTER TABLE `ims_uni_account_modules` DISABLE KEYS */;
INSERT INTO `ims_uni_account_modules` VALUES (1,1,'vp_ph',1,'a:132:{s:12:\"set_acc_name\";s:0:\"\";s:12:\"set_acc_logo\";s:0:\"\";s:14:\"set_acc_qrcode\";s:0:\"\";s:20:\"set_acc_notify_close\";i:1;s:9:\"auth_mode\";i:0;s:16:\"set_mobile_valid\";i:0;s:13:\"unknow_shield\";i:0;s:15:\"text_moderation\";i:0;s:16:\"image_moderation\";i:0;s:11:\"feedin_must\";i:1;s:11:\"prop_images\";i:1;s:12:\"prop_contact\";i:1;s:21:\"prop_feed_placeholder\";s:51:\"简单介绍自己 如年龄星座 兴趣爱好等 \";s:11:\"feed_dviews\";i:0;s:11:\"feed_view_1\";i:5;s:11:\"feed_view_2\";i:10;s:11:\"feed_view_3\";i:15;s:5:\"prop1\";i:0;s:10:\"prop1_name\";s:0:\"\";s:10:\"prop1_text\";s:0:\"\";s:5:\"prop2\";i:0;s:10:\"prop2_name\";s:0:\"\";s:10:\"prop2_text\";s:0:\"\";s:3:\"pao\";i:0;s:11:\"pao_domaina\";s:0:\"\";s:11:\"pao_domainb\";s:0:\"\";s:15:\"paytitle_feedin\";N;s:16:\"paytitle_feedout\";N;s:14:\"paytitle_agent\";N;s:16:\"paytitle_buycoin\";N;s:13:\"prop_position\";i:0;s:8:\"qmap_key\";s:35:\"JQ5BZ-GVYWU-5RLVG-BLHUK-5V656-EAFJ2\";s:6:\"slides\";a:2:{i:0;s:51:\"images/1/2022/04/aR8RwB5lR8lkr88R27RZ22K2s2iB9n.jpg\";i:1;s:51:\"images/1/2022/04/re2ei18viVyv8e4Eee8F1l2BBfxfee.jpg\";}s:9:\"box_pic_1\";s:51:\"images/1/2022/04/w3QTPSsWP3USEgEWsm9SS3qVR3E3Ss.png\";s:9:\"box_pic_2\";s:51:\"images/1/2022/04/tGUU0S9zLz7E0tX0e00wZwS70mza6W.png\";s:9:\"MD_BRANCH\";i:10000;s:14:\"set_app_status\";i:0;s:12:\"set_app_hint\";s:0:\"\";s:17:\"set_verify_status\";i:0;s:12:\"set_app_name\";s:18:\"单身恋爱盲盒\";s:12:\"set_app_logo\";N;s:13:\"set_app_bgclb\";N;s:13:\"set_app_bgctr\";N;s:10:\"set_app_bg\";N;s:13:\"set_app_intro\";N;s:13:\"server_qrcode\";s:51:\"images/1/2022/04/g03dU88aAA993WQYpvVA0UdWVywbw0.png\";s:10:\"app_qa_set\";i:1;s:6:\"app_qa\";s:4985:\"<p style=\"white-space: normal; text-align: center;\"><span style=\"font-size: 12px;\"><img src=\"http://img.baidu.com/hi/bobo/B_0001.gif\"/>Hello，</span></p><p helvetica=\"\" vertical-align:=\"\" text-size-adjust:=\"\" color:=\"\" white-space:=\"\" background-color:=\"\" text-align:=\"\" style=\"white-space: normal; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: none; outline: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 14px; line-height: inherit; text-align: center;\"><span style=\"margin: 0px; padding: 0px; outline: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; font-size: 12px;\">恋爱交友盲盒，您所填写内容即为纸条，将会被有缘人抽取</span></p><p style=\"line-height: normal; margin-top: 5px; text-indent: 2em;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<span style=\"text-indent: 2em;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</span><span style=\"text-indent: 2em;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</span><img src=\"http://mh.fionazone.cn:88/attachment/images/1/2022/04/wPzpeQqff1aoN141o0t7YeAoYYANA1.jpg\" alt=\"IMG_20220418_232349_gaitubao_100x100.jpg\" style=\"text-indent: 2em; max-width: 100%;\"/></p><p><br/></p><p pingfang=\"\" white-space:=\"\" text-align:=\"\" helvetica=\"\" vertical-align:=\"\" text-size-adjust:=\"\" color:=\"\" background-color:=\"\" style=\"white-space: normal; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: none; outline: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; text-align: center;\">（长按识别）</p><p pingfang=\"\" white-space:=\"\" text-align:=\"\" helvetica=\"\" vertical-align:=\"\" text-size-adjust:=\"\" color:=\"\" background-color:=\"\" style=\"white-space: normal; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: none; outline: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 14px; line-height: inherit; text-align: center;\"><span style=\"color: rgb(31, 73, 125); background-color: rgb(255, 255, 255);\">遇到搜索不到的纸条 联系客服补单</span><br/></p><p pingfang=\"\" white-space:=\"\" text-align:=\"\" helvetica=\"\" vertical-align:=\"\" text-size-adjust:=\"\" color:=\"\" background-color:=\"\" style=\"white-space: normal; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: none; outline: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 14px; line-height: inherit; text-align: center;\"><span style=\"color: rgb(255, 0, 0); font-family: inherit; font-size: 12px; font-style: inherit; font-variant-ligatures: inherit; font-variant-caps: inherit; font-weight: inherit;\">如您填写联系方式，则代表您同意授权本应用在玩法内，</span></p><p pingfang=\"\" white-space:=\"\" text-align:=\"\" helvetica=\"\" vertical-align:=\"\" text-size-adjust:=\"\" color:=\"\" background-color:=\"\" style=\"white-space: normal; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: none; outline: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 14px; line-height: inherit; text-align: center;\"><span style=\"color: rgb(255, 0, 0); font-family: inherit; font-size: 12px; font-style: inherit; font-variant-ligatures: inherit; font-variant-caps: inherit; font-weight: inherit;\">将您信息展示给有缘人</span></p><p style=\"white-space: normal; text-align: center;\"><span style=\"font-family: inherit; font-size: 12px; font-style: inherit; font-variant-ligatures: inherit; font-variant-caps: inherit; font-weight: inherit; background-color: rgb(255, 255, 255); color: rgb(255, 0, 0);\">盲盒脱单是一款新型的帮助年轻人获取更多脱单可能性的软件</span></p><p style=\"white-space: normal;\"><span style=\"font-family: inherit; font-size: 12px; font-style: inherit; font-variant-ligatures: inherit; font-variant-caps: inherit; font-weight: inherit; background-color: rgb(255, 255, 255); color: rgb(255, 0, 0);\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 在交友过程中谨防警惕诈骗，切勿轻易转账以防被骗</span></p><p><br/></p>\";s:9:\"app_xieyi\";s:87:\"http://mh.fionazone.cn:88/app/index.php?i=1&c=entry&cmd=page&id=840MQ&do=public&m=vp_ph\";s:9:\"app_yinsi\";s:87:\"http://mh.fionazone.cn:88/app/index.php?i=1&c=entry&cmd=page&id=86fMg&do=public&m=vp_ph\";s:13:\"edit_sp_pname\";i:0;s:14:\"edit_sp_images\";i:0;s:9:\"tags_male\";N;s:11:\"tags_female\";N;s:10:\"pos_status\";i:0;s:12:\"set_app_mode\";i:0;s:13:\"set_app_mode1\";i:0;s:8:\"in_limit\";i:0;s:9:\"out_limit\";i:0;s:12:\"coin_reply_1\";i:1;s:12:\"coin_reply_2\";i:1;s:8:\"coin_top\";i:1;s:11:\"coin_top_qu\";i:1;s:7:\"match-s\";i:1;s:5:\"match\";i:1;s:7:\"is_sign\";i:0;s:9:\"sign_coin\";i:0;s:12:\"reply_images\";i:0;s:9:\"coin_icon\";s:51:\"images/1/2022/04/Bln31Lz9cnxzycVr0SBbYXyyGyYXzb.png\";s:9:\"coin_name\";s:6:\"爱心\";s:11:\"inmoney_way\";i:2;s:13:\"inmoney_coin1\";i:1;s:12:\"inmoney_fee1\";d:1;s:13:\"inmoney_coin2\";i:6;s:12:\"inmoney_fee2\";d:5;s:13:\"inmoney_coin3\";i:14;s:12:\"inmoney_fee3\";d:10;s:10:\"coin_in1_1\";i:0;s:9:\"coin_in_1\";i:1;s:10:\"coin_out_1\";i:1;s:10:\"coin_in1_2\";i:0;s:11:\"fee_out_j_2\";d:0;s:12:\"fee_out_j1_2\";i:0;s:13:\"fee_out_t_j_2\";d:0;s:14:\"fee_out_t_j1_2\";i:0;s:11:\"fee_out_t_1\";d:1;s:11:\"fee_out_t_2\";d:1;s:9:\"coin_in_2\";i:1;s:10:\"coin_out_2\";i:1;s:13:\"coin_out_even\";i:9;s:15:\"coin_out_even_2\";i:10;s:9:\"fee_in1_1\";d:0;s:8:\"fee_in_1\";d:0;s:9:\"fee_out_1\";d:0;s:9:\"fee_in1_2\";d:0;s:8:\"fee_in_2\";d:0;s:9:\"fee_out_2\";d:0;s:7:\"pay_way\";i:0;s:7:\"ios_pay\";i:1;s:11:\"outcash_way\";i:1;s:11:\"outcash_min\";i:1;s:11:\"outcash_max\";i:2000;s:10:\"outcash_sp\";i:1;s:13:\"invite_status\";i:0;s:11:\"invite_logo\";N;s:12:\"invite_title\";N;s:11:\"invite_desc\";N;s:11:\"invite_line\";N;s:13:\"invite_poster\";N;s:12:\"invite_prize\";d:0;s:18:\"invite_prize_limit\";i:0;s:11:\"agent_close\";i:0;s:9:\"agent_fee\";d:9.9000000000000004;s:11:\"agent_title\";s:6:\"红娘\";s:10:\"agent_name\";s:6:\"红娘\";s:11:\"agent_intro\";s:3036:\"<p style=\"font-size: medium; white-space: normal; text-align: center;\">成为摊主，在线上或线下摆个摊</p><p style=\"font-size: medium; white-space: normal;\"><br/></p><p style=\"font-size: medium; white-space: normal; text-align: center;\">加入我们拯救单身狗的大军！</p><p style=\"font-size: medium; white-space: normal;\"><br/></p><p helvetica=\"\" style=\"font-size: medium; white-space: normal; margin-top: 0px; margin-bottom: 0px; padding: 0px; outline: 0px; border: currentcolor; text-align: center; line-height: inherit;\">你推广的用户每次抽取纸条可获得收益<span style=\"font-size: 18px; color: rgb(255, 0, 0);\">70<span style=\"font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; margin: 0px; padding: 0px; outline: 0px; border: currentcolor; vertical-align: baseline;\">%</span></span></p><p helvetica=\"\" style=\"font-size: medium; white-space: normal; margin-top: 0px; margin-bottom: 0px; padding: 0px; outline: 0px; border: currentcolor; text-align: center; line-height: inherit;\">发发朋友圈，轻松日赚<span style=\"font-size: 18px; color: rgb(255, 0, 0);\">200<span style=\"font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; margin: 0px; padding: 0px; outline: 0px; border: currentcolor; vertical-align: baseline;\">+</span></span></p><p helvetica=\"\" style=\"font-size: medium; white-space: normal; margin-top: 0px; margin-bottom: 0px; padding: 0px; outline: 0px; border: currentcolor; line-height: inherit;\"><span style=\"font: inherit; margin: 0px; padding: 0px; outline: 0px; border: currentcolor; color: rgb(255, 0, 0); vertical-align: baseline;\"><br/></span></p><p style=\"font-size: medium; white-space: normal; text-align: center;\">当然，咱做这些怎么会是为了钱</p><p style=\"font-size: medium; white-space: normal;\"><br/></p><p style=\"font-size: medium; white-space: normal; text-align: center;\">还不是为国出力，提高结婚率</p><p style=\"font-size: medium; white-space: normal;\"><br/></p><p style=\"font-size: medium; white-space: normal; text-align: center;\">从而提高生育率，减慢老龄化</p><p style=\"font-size: medium; white-space: normal;\"><br/></p><p style=\"font-size: medium; white-space: normal; text-align: center;\">成为店长，限时<span style=\"color: rgb(255, 0, 0);\">9.9元</span><span style=\"color: rgb(255, 0, 0); text-decoration-line: line-through;\">（原价99.98）</span></p><p style=\"font-size: medium; white-space: normal;\"><br/></p><p style=\"font-size: medium; white-space: normal; text-align: center;\">暂时开放<span style=\"color: rgb(255, 0, 0);\">500名</span>，当前名额<span style=\"color: rgb(255, 0, 0);\">【489/500】</span></p><p style=\"font-size: medium; white-space: normal;\"><br/></p><p style=\"font-size: medium; white-space: normal; text-align: center;\">一起稳赚收益！</p><p style=\"font-size: medium; white-space: normal;\"><br/></p><p><br/></p>\";s:11:\"agent_share\";s:0:\"\";s:10:\"agent_rate\";i:70;s:11:\"agent_rate1\";i:0;s:12:\"agent_poster\";s:51:\"images/1/2022/04/vg4y1Y3U1123e262r8s12F24s2Mf1q.jpg\";s:12:\"agent_sphurl\";N;s:13:\"nt_feed_reply\";s:0:\"\";s:10:\"nt_feed_no\";s:0:\"\";s:9:\"zheng_icp\";s:0:\"\";s:10:\"zheng_icpz\";s:0:\"\";s:9:\"zheng_wab\";s:0:\"\";s:15:\"share_post_logo\";s:0:\"\";s:16:\"share_post_title\";s:0:\"\";s:15:\"share_post_desc\";s:0:\"\";s:15:\"share_post_line\";s:0:\"\";s:8:\"auth_key\";s:0:\"\";s:8:\"task_key\";N;}',0,0);
/*!40000 ALTER TABLE `ims_uni_account_modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_uni_account_modules_shortcut`
--

DROP TABLE IF EXISTS `ims_uni_account_modules_shortcut`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_uni_account_modules_shortcut` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `url` varchar(250) NOT NULL,
  `icon` varchar(200) NOT NULL,
  `uniacid` int(10) NOT NULL,
  `version_id` int(10) NOT NULL,
  `module_name` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_uni_account_modules_shortcut`
--

LOCK TABLES `ims_uni_account_modules_shortcut` WRITE;
/*!40000 ALTER TABLE `ims_uni_account_modules_shortcut` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_uni_account_modules_shortcut` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_uni_account_users`
--

DROP TABLE IF EXISTS `ims_uni_account_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_uni_account_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `role` varchar(255) NOT NULL,
  `rank` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_memberid` (`uid`),
  KEY `uniacid` (`uniacid`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_uni_account_users`
--

LOCK TABLES `ims_uni_account_users` WRITE;
/*!40000 ALTER TABLE `ims_uni_account_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_uni_account_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_uni_group`
--

DROP TABLE IF EXISTS `ims_uni_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_uni_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `owner_uid` int(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `modules` text NOT NULL,
  `templates` varchar(5000) NOT NULL,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_uni_group`
--

LOCK TABLES `ims_uni_group` WRITE;
/*!40000 ALTER TABLE `ims_uni_group` DISABLE KEYS */;
INSERT INTO `ims_uni_group` VALUES (1,0,'体验套餐服务','N;','N;',0,0);
/*!40000 ALTER TABLE `ims_uni_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_uni_link_uniacid`
--

DROP TABLE IF EXISTS `ims_uni_link_uniacid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_uni_link_uniacid` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) NOT NULL,
  `link_uniacid` int(10) NOT NULL,
  `version_id` int(10) NOT NULL,
  `module_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_uni_link_uniacid`
--

LOCK TABLES `ims_uni_link_uniacid` WRITE;
/*!40000 ALTER TABLE `ims_uni_link_uniacid` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_uni_link_uniacid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_uni_modules`
--

DROP TABLE IF EXISTS `ims_uni_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_uni_modules` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) NOT NULL,
  `module_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_uni_modules`
--

LOCK TABLES `ims_uni_modules` WRITE;
/*!40000 ALTER TABLE `ims_uni_modules` DISABLE KEYS */;
INSERT INTO `ims_uni_modules` VALUES (1,1,'vp_ph');
/*!40000 ALTER TABLE `ims_uni_modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_uni_settings`
--

DROP TABLE IF EXISTS `ims_uni_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_uni_settings` (
  `uniacid` int(10) unsigned NOT NULL,
  `passport` varchar(200) NOT NULL,
  `oauth` varchar(100) NOT NULL,
  `jsauth_acid` int(10) unsigned NOT NULL,
  `notify` varchar(2000) NOT NULL,
  `creditnames` varchar(500) NOT NULL,
  `creditbehaviors` varchar(500) NOT NULL,
  `welcome` varchar(60) NOT NULL,
  `default` varchar(60) NOT NULL,
  `default_message` varchar(2000) NOT NULL,
  `payment` text NOT NULL,
  `stat` varchar(300) NOT NULL,
  `default_site` int(10) unsigned DEFAULT NULL,
  `sync` tinyint(3) unsigned NOT NULL,
  `recharge` varchar(500) NOT NULL,
  `tplnotice` varchar(2000) NOT NULL,
  `grouplevel` tinyint(3) unsigned NOT NULL,
  `mcplugin` varchar(500) NOT NULL,
  `exchange_enable` tinyint(3) unsigned NOT NULL,
  `coupon_type` tinyint(3) unsigned NOT NULL,
  `menuset` text NOT NULL,
  `statistics` varchar(100) NOT NULL,
  `bind_domain` varchar(200) NOT NULL,
  `comment_status` tinyint(1) NOT NULL,
  `reply_setting` tinyint(4) NOT NULL,
  `default_module` varchar(100) NOT NULL,
  `attachment_limit` int(11) NOT NULL,
  `attachment_size` varchar(20) NOT NULL,
  `sync_member` tinyint(1) NOT NULL,
  `remote` varchar(2000) NOT NULL,
  PRIMARY KEY (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_uni_settings`
--

LOCK TABLES `ims_uni_settings` WRITE;
/*!40000 ALTER TABLE `ims_uni_settings` DISABLE KEYS */;
INSERT INTO `ims_uni_settings` VALUES (1,'a:3:{s:8:\"focusreg\";i:0;s:4:\"item\";s:5:\"email\";s:4:\"type\";s:8:\"password\";}','a:2:{s:6:\"status\";s:1:\"0\";s:7:\"account\";s:1:\"0\";}',0,'a:1:{s:3:\"sms\";a:2:{s:7:\"balance\";i:0;s:9:\"signature\";s:0:\"\";}}','a:5:{s:7:\"credit1\";a:2:{s:5:\"title\";s:6:\"积分\";s:7:\"enabled\";i:1;}s:7:\"credit2\";a:2:{s:5:\"title\";s:6:\"余额\";s:7:\"enabled\";i:1;}s:7:\"credit3\";a:2:{s:5:\"title\";s:0:\"\";s:7:\"enabled\";i:0;}s:7:\"credit4\";a:2:{s:5:\"title\";s:0:\"\";s:7:\"enabled\";i:0;}s:7:\"credit5\";a:2:{s:5:\"title\";s:0:\"\";s:7:\"enabled\";i:0;}}','a:2:{s:8:\"activity\";s:7:\"credit1\";s:8:\"currency\";s:7:\"credit2\";}','','','','a:5:{s:6:\"credit\";a:1:{s:6:\"switch\";b:0;}s:6:\"alipay\";a:4:{s:6:\"switch\";b:0;s:7:\"account\";s:0:\"\";s:7:\"partner\";s:0:\"\";s:6:\"secret\";s:0:\"\";}s:6:\"wechat\";a:7:{s:6:\"switch\";b:0;s:7:\"account\";b:0;s:7:\"signkey\";s:0:\"\";s:7:\"partner\";s:0:\"\";s:3:\"key\";s:0:\"\";s:10:\"pay_switch\";b:0;s:15:\"recharge_switch\";b:0;}s:8:\"delivery\";a:1:{s:6:\"switch\";b:0;}s:4:\"didi\";a:9:{s:15:\"recharge_switch\";s:4:\"true\";s:10:\"pay_switch\";s:4:\"true\";s:3:\"url\";s:23:\"http://pay.didigov.com/\";s:5:\"mchid\";i:1392;s:10:\"has_config\";s:4:\"true\";s:12:\"recharge_set\";s:4:\"true\";s:11:\"support_set\";s:5:\"false\";s:10:\"has_status\";s:4:\"true\";s:6:\"mchkey\";s:32:\"9db873c4fd73a64e175fbd9ab6f68a6e\";}}','',1,0,'','',0,'',0,0,'','','',0,0,'',0,'14314',0,'');
/*!40000 ALTER TABLE `ims_uni_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_uni_verifycode`
--

DROP TABLE IF EXISTS `ims_uni_verifycode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_uni_verifycode` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `receiver` varchar(50) NOT NULL,
  `verifycode` varchar(6) NOT NULL,
  `total` tinyint(3) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `failed_count` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_uni_verifycode`
--

LOCK TABLES `ims_uni_verifycode` WRITE;
/*!40000 ALTER TABLE `ims_uni_verifycode` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_uni_verifycode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_userapi_cache`
--

DROP TABLE IF EXISTS `ims_userapi_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_userapi_cache` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(32) NOT NULL,
  `content` text NOT NULL,
  `lastupdate` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_userapi_cache`
--

LOCK TABLES `ims_userapi_cache` WRITE;
/*!40000 ALTER TABLE `ims_userapi_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_userapi_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_userapi_reply`
--

DROP TABLE IF EXISTS `ims_userapi_reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_userapi_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL,
  `description` varchar(300) NOT NULL,
  `apiurl` varchar(300) NOT NULL,
  `token` varchar(32) NOT NULL,
  `default_text` varchar(100) NOT NULL,
  `cachetime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_userapi_reply`
--

LOCK TABLES `ims_userapi_reply` WRITE;
/*!40000 ALTER TABLE `ims_userapi_reply` DISABLE KEYS */;
INSERT INTO `ims_userapi_reply` VALUES (1,1,'\"城市名+天气\", 如: \"北京天气\"','weather.php','','',0),(2,2,'\"百科+查询内容\" 或 \"定义+查询内容\", 如: \"百科姚明\", \"定义自行车\"','baike.php','','',0),(3,3,'\"@查询内容(中文或英文)\"','translate.php','','',0),(4,4,'\"日历\", \"万年历\", \"黄历\"或\"几号\"','calendar.php','','',0),(5,5,'\"新闻\"','news.php','','',0),(6,6,'\"快递+单号\", 如: \"申通1200041125\"','express.php','','',0);
/*!40000 ALTER TABLE `ims_userapi_reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_users`
--

DROP TABLE IF EXISTS `ims_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_users` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `owner_uid` int(10) NOT NULL,
  `groupid` int(10) unsigned NOT NULL,
  `founder_groupid` tinyint(4) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(200) NOT NULL,
  `salt` varchar(10) NOT NULL,
  `type` tinyint(3) unsigned NOT NULL,
  `status` tinyint(4) NOT NULL,
  `joindate` int(10) unsigned NOT NULL,
  `joinip` varchar(15) NOT NULL,
  `lastvisit` int(10) unsigned NOT NULL,
  `lastip` varchar(15) NOT NULL,
  `remark` varchar(500) NOT NULL,
  `starttime` int(10) unsigned NOT NULL,
  `endtime` int(10) unsigned NOT NULL,
  `register_type` tinyint(3) NOT NULL,
  `openid` varchar(50) NOT NULL,
  `welcome_link` tinyint(4) NOT NULL,
  `notice_setting` varchar(5000) NOT NULL,
  `is_bind` tinyint(1) NOT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_users`
--

LOCK TABLES `ims_users` WRITE;
/*!40000 ALTER TABLE `ims_users` DISABLE KEYS */;
INSERT INTO `ims_users` VALUES (1,0,1,0,'admin','','1a328ff2',0,0,1650191818,'',1650640490,'61.157.243.121','',0,0,0,'',0,'',0);
/*!40000 ALTER TABLE `ims_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_users_bind`
--

DROP TABLE IF EXISTS `ims_users_bind`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_users_bind` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `bind_sign` varchar(50) NOT NULL,
  `third_type` tinyint(4) NOT NULL,
  `third_nickname` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `bind_sign` (`bind_sign`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_users_bind`
--

LOCK TABLES `ims_users_bind` WRITE;
/*!40000 ALTER TABLE `ims_users_bind` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_users_bind` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_users_create_group`
--

DROP TABLE IF EXISTS `ims_users_create_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_users_create_group` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(50) NOT NULL,
  `maxaccount` int(10) NOT NULL,
  `maxwxapp` int(10) NOT NULL,
  `maxwebapp` int(10) NOT NULL,
  `maxphoneapp` int(10) NOT NULL,
  `maxxzapp` int(10) NOT NULL,
  `maxaliapp` int(10) NOT NULL,
  `createtime` int(10) NOT NULL,
  `maxbaiduapp` int(10) NOT NULL,
  `maxtoutiaoapp` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_users_create_group`
--

LOCK TABLES `ims_users_create_group` WRITE;
/*!40000 ALTER TABLE `ims_users_create_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_users_create_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_users_extra_group`
--

DROP TABLE IF EXISTS `ims_users_extra_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_users_extra_group` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL,
  `uni_group_id` int(10) NOT NULL,
  `create_group_id` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `uni_group_id` (`uni_group_id`),
  KEY `create_group_id` (`create_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_users_extra_group`
--

LOCK TABLES `ims_users_extra_group` WRITE;
/*!40000 ALTER TABLE `ims_users_extra_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_users_extra_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_users_extra_limit`
--

DROP TABLE IF EXISTS `ims_users_extra_limit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_users_extra_limit` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL,
  `maxaccount` int(10) NOT NULL,
  `maxwxapp` int(10) NOT NULL,
  `maxwebapp` int(10) NOT NULL,
  `maxphoneapp` int(10) NOT NULL,
  `maxxzapp` int(10) NOT NULL,
  `maxaliapp` int(10) NOT NULL,
  `timelimit` int(10) NOT NULL,
  `maxbaiduapp` int(10) NOT NULL,
  `maxtoutiaoapp` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_users_extra_limit`
--

LOCK TABLES `ims_users_extra_limit` WRITE;
/*!40000 ALTER TABLE `ims_users_extra_limit` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_users_extra_limit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_users_extra_modules`
--

DROP TABLE IF EXISTS `ims_users_extra_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_users_extra_modules` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL,
  `module_name` varchar(100) NOT NULL,
  `support` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `module_name` (`module_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_users_extra_modules`
--

LOCK TABLES `ims_users_extra_modules` WRITE;
/*!40000 ALTER TABLE `ims_users_extra_modules` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_users_extra_modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_users_extra_templates`
--

DROP TABLE IF EXISTS `ims_users_extra_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_users_extra_templates` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL,
  `template_id` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `template_id` (`template_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_users_extra_templates`
--

LOCK TABLES `ims_users_extra_templates` WRITE;
/*!40000 ALTER TABLE `ims_users_extra_templates` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_users_extra_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_users_failed_login`
--

DROP TABLE IF EXISTS `ims_users_failed_login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_users_failed_login` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ip` varchar(15) NOT NULL,
  `username` varchar(32) NOT NULL,
  `count` tinyint(1) unsigned NOT NULL,
  `lastupdate` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ip_username` (`ip`,`username`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_users_failed_login`
--

LOCK TABLES `ims_users_failed_login` WRITE;
/*!40000 ALTER TABLE `ims_users_failed_login` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_users_failed_login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_users_founder_group`
--

DROP TABLE IF EXISTS `ims_users_founder_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_users_founder_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `package` varchar(5000) NOT NULL,
  `maxaccount` int(10) unsigned NOT NULL,
  `timelimit` int(10) unsigned NOT NULL,
  `maxwxapp` int(10) unsigned NOT NULL,
  `maxwebapp` int(10) NOT NULL,
  `maxphoneapp` int(10) NOT NULL,
  `maxxzapp` int(10) NOT NULL,
  `maxaliapp` int(10) NOT NULL,
  `maxbaiduapp` int(10) NOT NULL,
  `maxtoutiaoapp` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_users_founder_group`
--

LOCK TABLES `ims_users_founder_group` WRITE;
/*!40000 ALTER TABLE `ims_users_founder_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_users_founder_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_users_founder_own_create_groups`
--

DROP TABLE IF EXISTS `ims_users_founder_own_create_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_users_founder_own_create_groups` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `founder_uid` int(10) NOT NULL,
  `create_group_id` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `founder_uid` (`founder_uid`),
  KEY `create_group_id` (`create_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_users_founder_own_create_groups`
--

LOCK TABLES `ims_users_founder_own_create_groups` WRITE;
/*!40000 ALTER TABLE `ims_users_founder_own_create_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_users_founder_own_create_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_users_founder_own_uni_groups`
--

DROP TABLE IF EXISTS `ims_users_founder_own_uni_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_users_founder_own_uni_groups` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `founder_uid` int(10) NOT NULL,
  `uni_group_id` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `founder_uid` (`founder_uid`),
  KEY `uni_group_id` (`uni_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_users_founder_own_uni_groups`
--

LOCK TABLES `ims_users_founder_own_uni_groups` WRITE;
/*!40000 ALTER TABLE `ims_users_founder_own_uni_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_users_founder_own_uni_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_users_founder_own_users`
--

DROP TABLE IF EXISTS `ims_users_founder_own_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_users_founder_own_users` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL,
  `founder_uid` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `founder_uid` (`founder_uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_users_founder_own_users`
--

LOCK TABLES `ims_users_founder_own_users` WRITE;
/*!40000 ALTER TABLE `ims_users_founder_own_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_users_founder_own_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_users_founder_own_users_groups`
--

DROP TABLE IF EXISTS `ims_users_founder_own_users_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_users_founder_own_users_groups` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `founder_uid` int(10) NOT NULL,
  `users_group_id` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `founder_uid` (`founder_uid`),
  KEY `users_group_id` (`users_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_users_founder_own_users_groups`
--

LOCK TABLES `ims_users_founder_own_users_groups` WRITE;
/*!40000 ALTER TABLE `ims_users_founder_own_users_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_users_founder_own_users_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_users_group`
--

DROP TABLE IF EXISTS `ims_users_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_users_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `owner_uid` int(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `package` varchar(5000) NOT NULL,
  `maxaccount` int(10) unsigned NOT NULL,
  `timelimit` int(10) unsigned NOT NULL,
  `maxwxapp` int(10) unsigned NOT NULL,
  `maxwebapp` int(10) NOT NULL,
  `maxphoneapp` int(10) NOT NULL,
  `maxxzapp` int(10) NOT NULL,
  `maxaliapp` int(10) NOT NULL,
  `maxbaiduapp` int(10) NOT NULL,
  `maxtoutiaoapp` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_users_group`
--

LOCK TABLES `ims_users_group` WRITE;
/*!40000 ALTER TABLE `ims_users_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_users_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_users_invitation`
--

DROP TABLE IF EXISTS `ims_users_invitation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_users_invitation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(64) NOT NULL,
  `fromuid` int(10) unsigned NOT NULL,
  `inviteuid` int(10) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_code` (`code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_users_invitation`
--

LOCK TABLES `ims_users_invitation` WRITE;
/*!40000 ALTER TABLE `ims_users_invitation` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_users_invitation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_users_lastuse`
--

DROP TABLE IF EXISTS `ims_users_lastuse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_users_lastuse` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL,
  `uniacid` int(10) NOT NULL,
  `modulename` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_users_lastuse`
--

LOCK TABLES `ims_users_lastuse` WRITE;
/*!40000 ALTER TABLE `ims_users_lastuse` DISABLE KEYS */;
INSERT INTO `ims_users_lastuse` VALUES (1,1,1,'','account_display'),(2,1,1,'vp_ph','module_display');
/*!40000 ALTER TABLE `ims_users_lastuse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_users_login_logs`
--

DROP TABLE IF EXISTS `ims_users_login_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_users_login_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned NOT NULL,
  `ip` varchar(15) NOT NULL,
  `city` varchar(256) NOT NULL,
  `login_at` int(10) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_users_login_logs`
--

LOCK TABLES `ims_users_login_logs` WRITE;
/*!40000 ALTER TABLE `ims_users_login_logs` DISABLE KEYS */;
INSERT INTO `ims_users_login_logs` VALUES (1,1,'61.157.243.119','',0,1650194043),(2,1,'36.157.87.43','',0,1650197150),(3,1,'101.206.169.24','',0,1650209569),(4,1,'111.26.240.250','',0,1650248444),(5,1,'114.113.221.7','',0,1650250363),(6,1,'36.157.87.43','',0,1650270787),(7,1,'111.26.240.250','',0,1650279314),(8,1,'36.157.87.43','',0,1650280794),(9,1,'61.157.243.119','',0,1650286939),(10,1,'175.18.156.169','',0,1650287328),(11,1,'61.157.243.119','',0,1650291859),(12,1,'111.26.240.250','',0,1650332895),(13,1,'111.26.240.247','',0,1650337287),(14,1,'36.157.87.43','',0,1650347931),(15,1,'61.157.243.121','',0,1650640446),(16,1,'61.157.243.121','',0,1650640490);
/*!40000 ALTER TABLE `ims_users_login_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_users_operate_history`
--

DROP TABLE IF EXISTS `ims_users_operate_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_users_operate_history` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `uniacid` int(10) unsigned NOT NULL,
  `module_name` varchar(100) NOT NULL,
  `createtime` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `type` (`type`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=593 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_users_operate_history`
--

LOCK TABLES `ims_users_operate_history` WRITE;
/*!40000 ALTER TABLE `ims_users_operate_history` DISABLE KEYS */;
INSERT INTO `ims_users_operate_history` VALUES (570,1,1,1,'',1650640494),(592,2,1,1,'vp_ph',1650641075);
/*!40000 ALTER TABLE `ims_users_operate_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_users_operate_star`
--

DROP TABLE IF EXISTS `ims_users_operate_star`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_users_operate_star` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `uniacid` int(10) unsigned NOT NULL,
  `module_name` varchar(100) NOT NULL,
  `rank` int(10) NOT NULL,
  `createtime` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `type` (`type`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_users_operate_star`
--

LOCK TABLES `ims_users_operate_star` WRITE;
/*!40000 ALTER TABLE `ims_users_operate_star` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_users_operate_star` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_users_permission`
--

DROP TABLE IF EXISTS `ims_users_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_users_permission` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `type` varchar(100) NOT NULL,
  `permission` varchar(10000) NOT NULL,
  `url` varchar(255) NOT NULL,
  `modules` text NOT NULL,
  `templates` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_users_permission`
--

LOCK TABLES `ims_users_permission` WRITE;
/*!40000 ALTER TABLE `ims_users_permission` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_users_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_users_profile`
--

DROP TABLE IF EXISTS `ims_users_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_users_profile` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `edittime` int(10) NOT NULL,
  `realname` varchar(10) NOT NULL,
  `nickname` varchar(20) NOT NULL,
  `avatar` varchar(255) NOT NULL,
  `qq` varchar(15) NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `fakeid` varchar(30) NOT NULL,
  `vip` tinyint(3) unsigned NOT NULL,
  `gender` tinyint(1) NOT NULL,
  `birthyear` smallint(6) unsigned NOT NULL,
  `birthmonth` tinyint(3) unsigned NOT NULL,
  `birthday` tinyint(3) unsigned NOT NULL,
  `constellation` varchar(10) NOT NULL,
  `zodiac` varchar(5) NOT NULL,
  `telephone` varchar(15) NOT NULL,
  `idcard` varchar(30) NOT NULL,
  `studentid` varchar(50) NOT NULL,
  `grade` varchar(10) NOT NULL,
  `address` varchar(255) NOT NULL,
  `zipcode` varchar(10) NOT NULL,
  `nationality` varchar(30) NOT NULL,
  `resideprovince` varchar(30) NOT NULL,
  `residecity` varchar(30) NOT NULL,
  `residedist` varchar(30) NOT NULL,
  `graduateschool` varchar(50) NOT NULL,
  `company` varchar(50) NOT NULL,
  `education` varchar(10) NOT NULL,
  `occupation` varchar(30) NOT NULL,
  `position` varchar(30) NOT NULL,
  `revenue` varchar(10) NOT NULL,
  `affectivestatus` varchar(30) NOT NULL,
  `lookingfor` varchar(255) NOT NULL,
  `bloodtype` varchar(5) NOT NULL,
  `height` varchar(5) NOT NULL,
  `weight` varchar(5) NOT NULL,
  `alipay` varchar(30) NOT NULL,
  `msn` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `taobao` varchar(30) NOT NULL,
  `site` varchar(30) NOT NULL,
  `bio` text NOT NULL,
  `interest` text NOT NULL,
  `workerid` varchar(64) NOT NULL,
  `is_send_mobile_status` tinyint(3) NOT NULL,
  `send_expire_status` tinyint(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_users_profile`
--

LOCK TABLES `ims_users_profile` WRITE;
/*!40000 ALTER TABLE `ims_users_profile` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_users_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_video_reply`
--

DROP TABLE IF EXISTS `ims_video_reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_video_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  `mediaid` varchar(255) NOT NULL,
  `createtime` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_video_reply`
--

LOCK TABLES `ims_video_reply` WRITE;
/*!40000 ALTER TABLE `ims_video_reply` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_video_reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_voice_reply`
--

DROP TABLE IF EXISTS `ims_voice_reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_voice_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL,
  `title` varchar(50) NOT NULL,
  `mediaid` varchar(255) NOT NULL,
  `createtime` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_voice_reply`
--

LOCK TABLES `ims_voice_reply` WRITE;
/*!40000 ALTER TABLE `ims_voice_reply` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_voice_reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_vp_ph_alarm`
--

DROP TABLE IF EXISTS `ims_vp_ph_alarm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_vp_ph_alarm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `biz` varchar(80) CHARACTER SET utf8mb4 NOT NULL,
  `feed_id` int(11) NOT NULL,
  `feed_uid` int(11) NOT NULL,
  `feed_reply_id` int(11) NOT NULL,
  `feed_reply_uid` int(11) NOT NULL,
  `content` text CHARACTER SET utf8mb4 NOT NULL,
  `images` text CHARACTER SET utf8mb4 NOT NULL,
  `why` text CHARACTER SET utf8mb4 NOT NULL,
  `create_time` int(11) NOT NULL,
  `verify_status` int(11) NOT NULL,
  `verify_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_vp_ph_alarm`
--

LOCK TABLES `ims_vp_ph_alarm` WRITE;
/*!40000 ALTER TABLE `ims_vp_ph_alarm` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_vp_ph_alarm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_vp_ph_coin`
--

DROP TABLE IF EXISTS `ims_vp_ph_coin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_vp_ph_coin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `biz` varchar(20) CHARACTER SET utf8mb4 NOT NULL COMMENT 'sign:每日签到',
  `biz_name` varchar(80) CHARACTER SET utf8mb4 NOT NULL,
  `coin` int(11) NOT NULL COMMENT '带符号',
  `create_date` date NOT NULL,
  `create_time` int(11) NOT NULL,
  `remark` text CHARACTER SET utf8mb4 NOT NULL,
  `op_uid` int(11) NOT NULL COMMENT '操作者uid',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_vp_ph_coin`
--

LOCK TABLES `ims_vp_ph_coin` WRITE;
/*!40000 ALTER TABLE `ims_vp_ph_coin` DISABLE KEYS */;
INSERT INTO `ims_vp_ph_coin` VALUES (3,1,6,'buycoin','管理员手充',600,'2022-04-17',1650198242,'',6),(4,1,6,'feedin','放入纸条(男生)',-1,'2022-04-17',1650198288,'',6),(5,1,10,'buycoin','管理员手充',100,'2022-04-17',1650206621,'',10),(6,1,10,'feedin','抽取纸条(男生)',-1,'2022-04-17',1650206630,'',10),(7,1,10,'feedin','放入纸条(男生)',-1,'2022-04-17',1650208576,'',10),(8,1,10,'feedin','放入纸条(男生)',-1,'2022-04-17',1650209338,'',10),(9,1,11,'buycoin','购买积分',1,'2022-04-18',1650267798,'',11),(10,1,11,'feedin','放入纸条(男生)',-1,'2022-04-18',1650271431,'',11),(11,1,11,'buycoin','购买积分',1,'2022-04-18',1650271702,'',11),(12,1,11,'feedin','放入纸条(男生)',-1,'2022-04-18',1650271739,'',11),(13,1,11,'buycoin','购买积分',1,'2022-04-18',1650271763,'',11),(14,1,11,'feedin','放入纸条(女生)',-1,'2022-04-18',1650271833,'',11),(15,1,11,'buycoin','购买积分',1,'2022-04-18',1650271864,'',11),(16,1,11,'feedin','放入纸条(男生)',-1,'2022-04-18',1650272138,'',11),(17,1,11,'buycoin','购买积分',1,'2022-04-18',1650272158,'',11),(18,1,11,'feedin','放入纸条(男生)',-1,'2022-04-18',1650272207,'',11),(19,1,11,'buycoin','购买积分',1,'2022-04-18',1650272250,'',11),(20,1,6,'buycoin','购买积分',1,'2022-04-18',1650290835,'',6),(21,1,15,'buycoin','购买积分',1,'2022-04-18',1650290927,'',15),(22,1,15,'buycoin','购买积分',6,'2022-04-19',1650299842,'',15),(23,1,11,'feedin','放入纸条(男生)',-1,'2022-04-19',1650328067,'',11),(24,1,19,'buycoin','购买积分',2,'2022-04-19',1650337969,'',19),(25,1,19,'feedin','放入纸条(男生)',-1,'2022-04-19',1650337984,'',19),(26,1,27,'buycoin','管理员手充',1,'2022-04-19',1650359529,'',27),(27,1,26,'buycoin','管理员手充',1,'2022-04-19',1650359894,'',26),(28,1,26,'feedin','抽取纸条(男生)',-1,'2022-04-19',1650359901,'',26),(29,1,37,'buycoin','管理员手充',455,'2022-04-22',1650641141,'',37),(30,1,37,'feedin','纸条加热',-1,'2022-04-22',1650641150,'',37),(31,1,37,'feedin','放入纸条(男生)',-1,'2022-04-22',1650641191,'',37);
/*!40000 ALTER TABLE `ims_vp_ph_coin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_vp_ph_feed`
--

DROP TABLE IF EXISTS `ims_vp_ph_feed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_vp_ph_feed` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `nickname` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `openid` varchar(80) CHARACTER SET utf8mb4 NOT NULL,
  `sex` tinyint(4) NOT NULL COMMENT '1:男，2:女',
  `content` text CHARACTER SET utf8mb4 NOT NULL,
  `images` text CHARACTER SET utf8mb4 NOT NULL,
  `ctype` varchar(20) CHARACTER SET utf8mb4 NOT NULL,
  `contact` varchar(30) CHARACTER SET utf8mb4 NOT NULL,
  `province` varchar(80) CHARACTER SET utf8mb4 NOT NULL,
  `city` varchar(80) CHARACTER SET utf8mb4 NOT NULL,
  `country` varchar(80) CHARACTER SET utf8mb4 NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lng` double NOT NULL,
  `lat` double NOT NULL,
  `age` tinyint(4) NOT NULL,
  `sign` varchar(20) CHARACTER SET utf8mb4 NOT NULL,
  `prop1` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `prop2` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `dviews` int(11) NOT NULL,
  `is_square` tinyint(4) NOT NULL,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL COMMENT '0:未提交(未付款):1:已提交',
  `verify_status` tinyint(4) NOT NULL COMMENT '0:初次提交待审核，5:修改后待审核，10:审核拒绝，20:审核通过',
  `verify_remark` text CHARACTER SET utf8mb4 NOT NULL,
  `verify_time` int(11) NOT NULL,
  `views` int(11) NOT NULL,
  `is_del` tinyint(4) NOT NULL,
  `is_des` tinyint(4) NOT NULL COMMENT '0:未过生命周期，1：已过',
  `replys` int(11) NOT NULL COMMENT '总传言数',
  `replyns` int(11) NOT NULL COMMENT '新传言数',
  `is_top` tinyint(4) NOT NULL,
  `toptime` int(11) NOT NULL,
  `topexptime` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_vp_ph_feed`
--

LOCK TABLES `ims_vp_ph_feed` WRITE;
/*!40000 ALTER TABLE `ims_vp_ph_feed` DISABLE KEYS */;
INSERT INTO `ims_vp_ph_feed` VALUES (20,1,34,'ᯤ','https://thirdwx.qlogo.cn/mmopen/vi_32/GJCc3BIV33StBWH11Oq1tWFKojW2gIoibFQTfc7e5OibVWiad1Nl9otVbC3APSvxibhrozP8vpYdyTceMtCRVAZ8ng/132','oXDWr6eX33VX9v3yE6Kk2guvqyCk',1,'男 18岁 大专','N;','wx','qhg1405064069qhg','','','','',0,0,0,'','','',5,0,1650515274,0,1,20,'',1650597277,0,0,0,0,0,0,0,0),(21,1,37,'梦凌','https://thirdwx.qlogo.cn/mmopen/vi_32/pR9iaxY5iaqkg0TGcjcdy6ev4zibw8VW6KEmb26upqB6w8akeayhUIn9Et9ZmoTdSIM1ErLqeibPhKnEKCKicC9lahA/132','ogtiH5tII9wkl2xhQTOLYtGofSdk',1,'1111','a:1:{i:0;s:84:\"http://162.14.96.235/attachment/images/1/2022/04/VNaG9vwmJVWDN1NndG9e11g9Ejemtn.jpeg\";}','wx','110','','','','',0,0,0,'','','',5,1,1650640883,0,1,20,'',1650640935,0,0,0,0,0,1,1650641150,1650727550),(22,1,37,'梦凌','https://thirdwx.qlogo.cn/mmopen/vi_32/pR9iaxY5iaqkg0TGcjcdy6ev4zibw8VW6KEmb26upqB6w8akeayhUIn9Et9ZmoTdSIM1ErLqeibPhKnEKCKicC9lahA/132','ogtiH5tII9wkl2xhQTOLYtGofSdk',1,'？？？','a:1:{i:0;s:84:\"http://162.14.96.235/attachment/images/1/2022/04/D3793H2ed33hHe3dBNH2nD78b7rbFz.jpeg\";}','wx','09282828','','','','',0,0,0,'','','',5,1,1650641191,0,1,20,'',1650641227,0,0,0,0,0,0,0,0),(23,1,37,'梦凌','https://thirdwx.qlogo.cn/mmopen/vi_32/pR9iaxY5iaqkg0TGcjcdy6ev4zibw8VW6KEmb26upqB6w8akeayhUIn9Et9ZmoTdSIM1ErLqeibPhKnEKCKicC9lahA/132','ogtiH5tII9wkl2xhQTOLYtGofSdk',2,'282828','a:1:{i:0;s:84:\"http://162.14.96.235/attachment/images/1/2022/04/oEZ8xRLQw6xY8X68w2gP89weowel98.jpeg\";}','wx','88288','','','','',0,0,0,'','','',5,1,1650641214,0,1,20,'',1650641223,0,0,0,0,0,0,0,0);
/*!40000 ALTER TABLE `ims_vp_ph_feed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_vp_ph_feed_reply`
--

DROP TABLE IF EXISTS `ims_vp_ph_feed_reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_vp_ph_feed_reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `feed_id` int(11) NOT NULL,
  `content` text CHARACTER SET utf8mb4 NOT NULL,
  `images` text CHARACTER SET utf8mb4 NOT NULL,
  `feed_uid` int(11) NOT NULL,
  `feed_openid` varchar(80) CHARACTER SET utf8 NOT NULL,
  `reply_uid` int(11) NOT NULL,
  `reply_openid` varchar(80) CHARACTER SET utf8mb4 NOT NULL,
  `status` tinyint(4) NOT NULL COMMENT '暂时无用 0：未被查看，已被查看',
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `is_del` tinyint(4) NOT NULL COMMENT '0:未删除，1：已删除',
  `del_time` int(11) NOT NULL,
  `reback` text CHARACTER SET utf8mb4 NOT NULL,
  `reback_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_vp_ph_feed_reply`
--

LOCK TABLES `ims_vp_ph_feed_reply` WRITE;
/*!40000 ALTER TABLE `ims_vp_ph_feed_reply` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_vp_ph_feed_reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_vp_ph_mobile_valid`
--

DROP TABLE IF EXISTS `ims_vp_ph_mobile_valid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_vp_ph_mobile_valid` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `mobile` varchar(64) CHARACTER SET utf8mb4 NOT NULL,
  `code` varchar(32) CHARACTER SET utf8mb4 NOT NULL,
  `uid` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  `exp_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_vp_ph_mobile_valid`
--

LOCK TABLES `ims_vp_ph_mobile_valid` WRITE;
/*!40000 ALTER TABLE `ims_vp_ph_mobile_valid` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_vp_ph_mobile_valid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_vp_ph_money`
--

DROP TABLE IF EXISTS `ims_vp_ph_money`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_vp_ph_money` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `who` varchar(20) CHARACTER SET utf8mb4 NOT NULL COMMENT '发生对象',
  `who_id` int(11) NOT NULL COMMENT '发生对象ID',
  `uid` int(11) DEFAULT NULL,
  `money` decimal(12,2) NOT NULL COMMENT '金额变化，带符号',
  `biz` varchar(32) CHARACTER SET utf8mb4 NOT NULL,
  `biz_id` int(11) NOT NULL,
  `biz_name` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `create_time` int(11) NOT NULL,
  `remark` text CHARACTER SET utf8mb4 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_vp_ph_money`
--

LOCK TABLES `ims_vp_ph_money` WRITE;
/*!40000 ALTER TABLE `ims_vp_ph_money` DISABLE KEYS */;
INSERT INTO `ims_vp_ph_money` VALUES (1,1,'agent',12,12,0.70,'buycoin',72,'我的用户购买1爱心',1650290927,''),(2,1,'agent',12,12,3.50,'buycoin',75,'我的用户购买6爱心',1650299842,''),(3,1,'agent',12,12,6.93,'agent',77,'我的用户购买红娘',1650300014,'');
/*!40000 ALTER TABLE `ims_vp_ph_money` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_vp_ph_order`
--

DROP TABLE IF EXISTS `ims_vp_ph_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_vp_ph_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `biz` varchar(32) NOT NULL COMMENT '订单业务：购买等级：level',
  `biz_id` int(11) NOT NULL,
  `biz_name` varchar(255) NOT NULL COMMENT '业务商品名',
  `title` varchar(255) NOT NULL COMMENT '交易标题',
  `uid` int(11) NOT NULL COMMENT 'mine的id',
  `openid` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `num` varchar(32) NOT NULL COMMENT '内部订单号',
  `price` decimal(12,2) NOT NULL COMMENT '单价',
  `cnt` int(11) NOT NULL COMMENT '数量',
  `amount` decimal(12,2) NOT NULL COMMENT '总价',
  `fee` decimal(12,2) NOT NULL COMMENT '服务费',
  `cut` decimal(12,2) NOT NULL COMMENT '优惠额度',
  `to_pay` decimal(12,2) NOT NULL COMMENT '实际支付额',
  `agentp` int(11) NOT NULL,
  `agentp_money` decimal(12,2) NOT NULL,
  `agentp1` int(11) NOT NULL,
  `agentp1_money` decimal(12,2) NOT NULL,
  `agentp2` int(11) NOT NULL,
  `agentp2_money` decimal(12,2) NOT NULL,
  `profit` decimal(12,2) NOT NULL COMMENT '平台利润',
  `create_time` int(11) NOT NULL,
  `remark` text NOT NULL,
  `status` tinyint(2) NOT NULL COMMENT '0:未提交，10：已提交未付款，20：交易成功，30：买家已取消，40：卖家已取消',
  `status_time` int(11) DEFAULT NULL,
  `prepay_params` text COMMENT '支付前相关参数',
  `pay_way` int(11) NOT NULL COMMENT '0:直接在线支付，10:后台管理员手动充值',
  `pay` decimal(12,2) DEFAULT NULL COMMENT '实际付款（元）',
  `pay_params` text COMMENT '支付相关参数',
  `pay_time` int(11) DEFAULT NULL COMMENT '实际付款时间',
  `pay_callback` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `refund_status` tinyint(1) NOT NULL COMMENT '0:未退款，1:等待退款，2:退款成功,3:退款失败',
  `refund_money` decimal(12,2) DEFAULT NULL COMMENT '待退款金额',
  `refund` decimal(12,2) DEFAULT NULL COMMENT '实际已退款金额',
  `refund_time` int(11) DEFAULT NULL COMMENT '退款时间',
  `refund_remark` text COMMENT '退款备注',
  `refund_tag` text COMMENT '退款接口反馈信息',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=89 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_vp_ph_order`
--

LOCK TABLES `ims_vp_ph_order` WRITE;
/*!40000 ALTER TABLE `ims_vp_ph_order` DISABLE KEYS */;
INSERT INTO `ims_vp_ph_order` VALUES (17,1,'buycoin',1,'购买1爱心','2元购买1爱心',6,'ogtiH5tII9wkl2xhQTOLYtGofSdk','',2.00,1,2.00,0.00,0.00,2.00,0,0.00,0,0.00,0,0.00,2.00,1650195712,'',10,1650195712,NULL,0,NULL,NULL,NULL,'http://mh.fionazone.cn:88/app/index.php?i=1&c=entry&do=index&m=vp_ph&wxref=mp.weixin.qq.com',0,NULL,NULL,NULL,NULL,NULL),(18,1,'buycoin',1,'购买1爱心','2元购买1爱心',6,'ogtiH5tII9wkl2xhQTOLYtGofSdk','',2.00,1,2.00,0.00,0.00,2.00,0,0.00,0,0.00,0,0.00,2.00,1650195774,'',10,1650195774,NULL,0,NULL,NULL,NULL,'http://mh.fionazone.cn:88/app/index.php?i=1&c=entry&do=index&m=vp_ph',0,NULL,NULL,NULL,NULL,NULL),(19,1,'agent',10,'购买红娘','1元购买红娘',10,'ogtiH5qGnAd5YQ0Ij4kLDbhywoY0','',1.00,1,1.00,0.00,0.00,1.00,6,0.50,0,0.00,0,0.00,0.50,1650196675,'',10,1650196675,NULL,0,NULL,NULL,NULL,'http://mh.fionazone.cn:88/app/index.php?i=1&c=entry&do=agent&m=vp_ph',0,NULL,NULL,NULL,NULL,NULL),(20,1,'agent',10,'购买红娘','1元购买红娘',10,'ogtiH5qGnAd5YQ0Ij4kLDbhywoY0','',1.00,1,1.00,0.00,0.00,1.00,6,0.50,0,0.00,0,0.00,0.50,1650197128,'',10,1650197128,NULL,0,NULL,NULL,NULL,'http://mh.fionazone.cn:88/app/index.php?i=1&c=entry&do=agent&m=vp_ph',0,NULL,NULL,NULL,NULL,NULL),(21,1,'buycoin',600,'手充600爱心','0元手充600爱心',6,'ogtiH5tII9wkl2xhQTOLYtGofSdk','',0.00,600,0.00,0.00,0.00,0.00,0,0.00,0,0.00,0,0.00,0.00,1650198242,'',20,1650198242,NULL,10,0.00,NULL,NULL,'',0,NULL,NULL,NULL,NULL,NULL),(22,1,'buycoin',1,'购买1爱心','2元购买1爱心',10,'ogtiH5qGnAd5YQ0Ij4kLDbhywoY0','',2.00,1,2.00,0.00,0.00,2.00,6,1.00,0,0.00,0,0.00,1.00,1650205433,'',10,1650205433,NULL,0,NULL,NULL,NULL,'http://mh.fionazone.cn:88/app/index.php?i=1&c=entry&do=index&m=vp_ph',0,NULL,NULL,NULL,NULL,NULL),(23,1,'buycoin',100,'手充100爱心','0元手充100爱心',10,'ogtiH5qGnAd5YQ0Ij4kLDbhywoY0','',0.00,100,0.00,0.00,0.00,0.00,6,0.00,0,0.00,0,0.00,0.00,1650206621,'',20,1650206621,NULL,10,0.00,NULL,NULL,'',0,NULL,NULL,NULL,NULL,NULL),(24,1,'buycoin',1,'购买1爱心','1元购买1爱心',11,'ogtiH5tsdZmcA_rNnGJdbw1SOvQg','',1.00,1,1.00,0.00,0.00,1.00,0,0.00,0,0.00,0,0.00,1.00,1650247762,'',10,1650247762,NULL,0,NULL,NULL,NULL,'http://mh.fionazone.cn:88/app/index.php?i=1&c=entry&do=index&m=vp_ph&wxref=mp.weixin.qq.com',0,NULL,NULL,NULL,NULL,NULL),(25,1,'buycoin',1,'购买1爱心','1元购买1爱心',11,'ogtiH5tsdZmcA_rNnGJdbw1SOvQg','',1.00,1,1.00,0.00,0.00,1.00,0,0.00,0,0.00,0,0.00,1.00,1650249334,'',10,1650249334,NULL,0,NULL,NULL,NULL,'http://mh.fionazone.cn:88/app/index.php?i=1&c=entry&do=index&m=vp_ph',0,NULL,NULL,NULL,NULL,NULL),(26,1,'buycoin',1,'购买1爱心','1元购买1爱心',9,'ogtiH5h8R51UZvkc8iH0ck00cSuQ','',1.00,1,1.00,0.00,0.00,1.00,0,0.00,0,0.00,0,0.00,1.00,1650249426,'',10,1650249426,NULL,0,NULL,NULL,NULL,'http://mh.fionazone.cn:88/app/index.php?i=1&c=entry&do=index&m=vp_ph',0,NULL,NULL,NULL,NULL,NULL),(27,1,'buycoin',1,'购买1爱心','1元购买1爱心',11,'ogtiH5tsdZmcA_rNnGJdbw1SOvQg','',1.00,1,1.00,0.00,0.00,1.00,0,0.00,0,0.00,0,0.00,1.00,1650263192,'',10,1650263192,NULL,0,NULL,NULL,NULL,'http://mh.fionazone.cn:88/app/index.php?i=1&c=entry&do=index&m=vp_ph',0,NULL,NULL,NULL,NULL,NULL),(28,1,'buycoin',1,'购买1爱心','1元购买1爱心',11,'ogtiH5tsdZmcA_rNnGJdbw1SOvQg','',1.00,1,1.00,0.00,0.00,1.00,0,0.00,0,0.00,0,0.00,1.00,1650263287,'',10,1650263287,NULL,0,NULL,NULL,NULL,'http://mh.fionazone.cn:88/app/index.php?i=1&c=entry&do=index&m=vp_ph',0,NULL,NULL,NULL,NULL,NULL),(29,1,'buycoin',1,'购买1爱心','1元购买1爱心',11,'ogtiH5tsdZmcA_rNnGJdbw1SOvQg','',1.00,1,1.00,0.00,0.00,1.00,0,0.00,0,0.00,0,0.00,1.00,1650263393,'',10,1650263393,NULL,0,NULL,NULL,NULL,'http://mh.fionazone.cn:88/app/index.php?i=1&c=entry&do=index&m=vp_ph',0,NULL,NULL,NULL,NULL,NULL),(30,1,'buycoin',1,'购买1爱心','1元购买1爱心',11,'ogtiH5tsdZmcA_rNnGJdbw1SOvQg','',1.00,1,1.00,0.00,0.00,1.00,0,0.00,0,0.00,0,0.00,1.00,1650263461,'',10,1650263461,NULL,0,NULL,NULL,NULL,'http://mh.fionazone.cn:88/app/index.php?i=1&c=entry&do=index&m=vp_ph&wxref=mp.weixin.qq.com',0,NULL,NULL,NULL,NULL,NULL),(31,1,'buycoin',1,'购买1爱心','1元购买1爱心',11,'ogtiH5tsdZmcA_rNnGJdbw1SOvQg','',1.00,1,1.00,0.00,0.00,1.00,0,0.00,0,0.00,0,0.00,1.00,1650266242,'',10,1650266242,NULL,0,NULL,NULL,NULL,'http://mh.fionazone.cn:88/app/index.php?i=1&c=entry&do=index&m=vp_ph',0,NULL,NULL,NULL,NULL,NULL),(32,1,'buycoin',1,'购买1爱心','1元购买1爱心',11,'ogtiH5tsdZmcA_rNnGJdbw1SOvQg','',1.00,1,1.00,0.00,0.00,1.00,0,0.00,0,0.00,0,0.00,1.00,1650266418,'',10,1650266418,NULL,0,NULL,NULL,NULL,'http://mh.fionazone.cn:88/app/index.php?i=1&c=entry&do=index&m=vp_ph',0,NULL,NULL,NULL,NULL,NULL),(33,1,'buycoin',1,'购买1爱心','1元购买1爱心',11,'ogtiH5tsdZmcA_rNnGJdbw1SOvQg','',1.00,1,1.00,0.00,0.00,1.00,0,0.00,0,0.00,0,0.00,1.00,1650266499,'',20,1650266499,NULL,0,1.00,NULL,1650267798,'http://mh.fionazone.cn:88/app/index.php?i=1&c=entry&do=index&m=vp_ph',0,NULL,NULL,NULL,NULL,NULL),(34,1,'buycoin',1,'购买1爱心','1元购买1爱心',11,'ogtiH5tsdZmcA_rNnGJdbw1SOvQg','',1.00,1,1.00,0.00,0.00,1.00,0,0.00,0,0.00,0,0.00,1.00,1650266614,'',10,1650266614,NULL,0,NULL,NULL,NULL,'http://mh.fionazone.cn:88/app/index.php?i=1&c=entry&do=index&m=vp_ph',0,NULL,NULL,NULL,NULL,NULL),(35,1,'buycoin',1,'购买1爱心','1元购买1爱心',11,'ogtiH5tsdZmcA_rNnGJdbw1SOvQg','',1.00,1,1.00,0.00,0.00,1.00,0,0.00,0,0.00,0,0.00,1.00,1650266907,'',10,1650266907,NULL,0,NULL,NULL,NULL,'http://mh.fionazone.cn:88/app/index.php?i=1&c=entry&do=index&m=vp_ph',0,NULL,NULL,NULL,NULL,NULL),(36,1,'buycoin',1,'购买1爱心','1元购买1爱心',11,'ogtiH5tsdZmcA_rNnGJdbw1SOvQg','',1.00,1,1.00,0.00,0.00,1.00,0,0.00,0,0.00,0,0.00,1.00,1650266987,'',10,1650266987,NULL,0,NULL,NULL,NULL,'http://mh.fionazone.cn:88/app/index.php?i=1&c=entry&do=index&m=vp_ph',0,NULL,NULL,NULL,NULL,NULL),(37,1,'buycoin',1,'购买1爱心','1元购买1爱心',11,'ogtiH5tsdZmcA_rNnGJdbw1SOvQg','',1.00,1,1.00,0.00,0.00,1.00,0,0.00,0,0.00,0,0.00,1.00,1650267070,'',10,1650267070,NULL,0,NULL,NULL,NULL,'http://mh.fionazone.cn:88/app/index.php?i=1&c=entry&do=index&m=vp_ph',0,NULL,NULL,NULL,NULL,NULL),(38,1,'buycoin',1,'购买1爱心','1元购买1爱心',11,'ogtiH5tsdZmcA_rNnGJdbw1SOvQg','',1.00,1,1.00,0.00,0.00,1.00,0,0.00,0,0.00,0,0.00,1.00,1650267142,'',10,1650267142,NULL,0,NULL,NULL,NULL,'http://mh.fionazone.cn:88/app/index.php?i=1&c=entry&do=index&m=vp_ph',0,NULL,NULL,NULL,NULL,NULL),(39,1,'agent',12,'购买红娘','1元购买红娘',12,'ogtiH5qGnAd5YQ0Ij4kLDbhywoY0','',1.00,1,1.00,0.00,0.00,1.00,0,0.00,0,0.00,0,0.00,1.00,1650268902,'',10,1650268902,NULL,0,NULL,NULL,NULL,'http://mh.fionazone.cn:88/app/index.php?i=1&c=entry&do=agent&m=vp_ph',0,NULL,NULL,NULL,NULL,NULL),(40,1,'buycoin',1,'购买1爱心','1元购买1爱心',12,'ogtiH5qGnAd5YQ0Ij4kLDbhywoY0','',1.00,1,1.00,0.00,0.00,1.00,0,0.00,0,0.00,0,0.00,1.00,1650268995,'',10,1650268995,NULL,0,NULL,NULL,NULL,'http://mh.fionazone.cn:88/app/index.php?i=1&c=entry&do=index&m=vp_ph',0,NULL,NULL,NULL,NULL,NULL),(41,1,'agent',11,'购买红娘','9.9元购买红娘',11,'ogtiH5tsdZmcA_rNnGJdbw1SOvQg','',9.90,1,9.90,0.00,0.00,9.90,0,0.00,0,0.00,0,0.00,9.90,1650271442,'',10,1650271442,NULL,0,NULL,NULL,NULL,'http://mh.fionazone.cn:88/app/index.php?i=1&c=entry&do=agent&m=vp_ph',0,NULL,NULL,NULL,NULL,NULL),(42,1,'buycoin',1,'购买1爱心','1元购买1爱心',11,'ogtiH5tsdZmcA_rNnGJdbw1SOvQg','',1.00,1,1.00,0.00,0.00,1.00,0,0.00,0,0.00,0,0.00,1.00,1650271483,'',10,1650271483,NULL,0,NULL,NULL,NULL,'http://mh.fionazone.cn:88/app/index.php?i=1&c=entry&do=index&m=vp_ph',0,NULL,NULL,NULL,NULL,NULL),(43,1,'buycoin',1,'购买1爱心','1元购买1爱心',11,'ogtiH5tsdZmcA_rNnGJdbw1SOvQg','',1.00,1,1.00,0.00,0.00,1.00,0,0.00,0,0.00,0,0.00,1.00,1650271684,'',20,1650271684,NULL,0,1.00,NULL,1650271702,'http://mh.fionazone.cn:88/app/index.php?i=1&c=entry&do=index&m=vp_ph',0,NULL,NULL,NULL,NULL,NULL),(44,1,'buycoin',1,'购买1爱心','1元购买1爱心',11,'ogtiH5tsdZmcA_rNnGJdbw1SOvQg','',1.00,1,1.00,0.00,0.00,1.00,0,0.00,0,0.00,0,0.00,1.00,1650271752,'',20,1650271752,NULL,0,1.00,NULL,1650271763,'http://mh.fionazone.cn:88/app/index.php?i=1&c=entry&do=index&m=vp_ph&money=1&name=ogtiH5tsdZmcA_rNnGJdbw1SOvQg%3A1&out_trade_no=25&pid=1&trade_no=202204181604099114&trade_status=TRADE_SUCCESS&type=wxpay&sign=1b2fb7e991b6c9437bb9bf9a9a6c8f24&sign_type=MD5',0,NULL,NULL,NULL,NULL,NULL),(45,1,'buycoin',1,'购买1爱心','1元购买1爱心',11,'ogtiH5tsdZmcA_rNnGJdbw1SOvQg','',1.00,1,1.00,0.00,0.00,1.00,0,0.00,0,0.00,0,0.00,1.00,1650271856,'',20,1650271856,NULL,0,1.00,NULL,1650271864,'http://mh.fionazone.cn:88/app/index.php?i=1&c=entry&do=index&m=vp_ph&money=1&name=ogtiH5tsdZmcA_rNnGJdbw1SOvQg%3A1&out_trade_no=26&pid=1&trade_no=202204181604176577&trade_status=TRADE_SUCCESS&type=wxpay&sign=db45ec62332d42b5e20bacf542346b19&sign_type=MD5',0,NULL,NULL,NULL,NULL,NULL),(46,1,'agent',11,'购买红娘','9.9元购买红娘',11,'ogtiH5tsdZmcA_rNnGJdbw1SOvQg','',9.90,1,9.90,0.00,0.00,9.90,0,0.00,0,0.00,0,0.00,9.90,1650271872,'',20,1650271872,NULL,0,9.90,NULL,1650271879,'http://mh.fionazone.cn:88/app/index.php?i=1&c=entry&do=agent&m=vp_ph',0,NULL,NULL,NULL,NULL,NULL),(47,1,'buycoin',1,'购买1爱心','1元购买1爱心',11,'ogtiH5tsdZmcA_rNnGJdbw1SOvQg','',1.00,1,1.00,0.00,0.00,1.00,0,0.00,0,0.00,0,0.00,1.00,1650272149,'',20,1650272149,NULL,0,1.00,NULL,1650272158,'http://mh.fionazone.cn:88/app/index.php?i=1&c=entry&do=index&m=vp_ph',0,NULL,NULL,NULL,NULL,NULL),(48,1,'buycoin',1,'购买1爱心','1元购买1爱心',11,'ogtiH5tsdZmcA_rNnGJdbw1SOvQg','',1.00,1,1.00,0.00,0.00,1.00,0,0.00,0,0.00,0,0.00,1.00,1650272243,'',20,1650272243,NULL,0,1.00,NULL,1650272250,'http://mh.fionazone.cn:88/app/index.php?i=1&c=entry&do=index&m=vp_ph',0,NULL,NULL,NULL,NULL,NULL),(49,1,'buycoin',1,'购买1爱心','1元购买1爱心',12,'ogtiH5qGnAd5YQ0Ij4kLDbhywoY0','',1.00,1,1.00,0.00,0.00,1.00,0,0.00,0,0.00,0,0.00,1.00,1650274016,'',10,1650274016,NULL,0,NULL,NULL,NULL,'http://mh.fionazone.cn:88/app/index.php?i=1&c=entry&do=index&m=vp_ph',0,NULL,NULL,NULL,NULL,NULL),(50,1,'agent',9,'购买红娘','9.9元购买红娘',9,'ogtiH5h8R51UZvkc8iH0ck00cSuQ','',9.90,1,9.90,0.00,0.00,9.90,0,0.00,0,0.00,0,0.00,9.90,1650274171,'',10,1650274171,NULL,0,NULL,NULL,NULL,'http://mh.fionazone.cn:88/app/index.php?i=1&c=entry&do=agent&m=vp_ph',0,NULL,NULL,NULL,NULL,NULL),(51,1,'buycoin',1,'购买1爱心','1元购买1爱心',9,'ogtiH5h8R51UZvkc8iH0ck00cSuQ','',1.00,1,1.00,0.00,0.00,1.00,0,0.00,0,0.00,0,0.00,1.00,1650274184,'',10,1650274184,NULL,0,NULL,NULL,NULL,'http://mh.fionazone.cn:88/app/index.php?i=1&c=entry&do=index&m=vp_ph&wxref=mp.weixin.qq.com',0,NULL,NULL,NULL,NULL,NULL),(52,1,'buycoin',3,'购买3爱心','4元购买3爱心',9,'ogtiH5h8R51UZvkc8iH0ck00cSuQ','',4.00,3,4.00,0.00,0.00,4.00,0,0.00,0,0.00,0,0.00,4.00,1650274203,'',10,1650274203,NULL,0,NULL,NULL,NULL,'http://mh.fionazone.cn:88/app/index.php?i=1&c=entry&do=index&m=vp_ph&wxref=mp.weixin.qq.com',0,NULL,NULL,NULL,NULL,NULL),(53,1,'agent',12,'购买红娘','9.9元购买红娘',12,'ogtiH5qGnAd5YQ0Ij4kLDbhywoY0','',9.90,1,9.90,0.00,0.00,9.90,0,0.00,0,0.00,0,0.00,9.90,1650275126,'',10,1650275126,NULL,0,NULL,NULL,NULL,'http://mh.fionazone.cn:88/app/index.php?i=1&c=entry&do=agent&m=vp_ph',0,NULL,NULL,NULL,NULL,NULL),(54,1,'buycoin',1,'购买1爱心','1元购买1爱心',6,'ogtiH5tII9wkl2xhQTOLYtGofSdk','',1.00,1,1.00,0.00,0.00,1.00,0,0.00,0,0.00,0,0.00,1.00,1650278294,'',10,1650278294,NULL,0,NULL,NULL,NULL,'http://mh.fionazone.cn:88/app/index.php?i=1&c=entry&do=index&m=vp_ph&wxref=mp.weixin.qq.com',0,NULL,NULL,NULL,NULL,NULL),(55,1,'buycoin',1,'购买1爱心','1元购买1爱心',12,'ogtiH5qGnAd5YQ0Ij4kLDbhywoY0','',1.00,1,1.00,0.00,0.00,1.00,0,0.00,0,0.00,0,0.00,1.00,1650285886,'',10,1650285886,NULL,0,NULL,NULL,NULL,'http://mh.fionazone.cn:88/app/index.php?i=1&c=entry&do=index&m=vp_ph',0,NULL,NULL,NULL,NULL,NULL),(56,1,'buycoin',5,'购买5爱心','6元购买5爱心',12,'ogtiH5qGnAd5YQ0Ij4kLDbhywoY0','',6.00,5,6.00,0.00,0.00,6.00,0,0.00,0,0.00,0,0.00,6.00,1650286102,'',10,1650286102,NULL,0,NULL,NULL,NULL,'http://mh.fionazone.cn:88/app/index.php?i=1&c=entry&do=index&m=vp_ph',0,NULL,NULL,NULL,NULL,NULL),(57,1,'buycoin',3,'购买3爱心','4元购买3爱心',12,'ogtiH5qGnAd5YQ0Ij4kLDbhywoY0','',4.00,3,4.00,0.00,0.00,4.00,0,0.00,0,0.00,0,0.00,4.00,1650286529,'',10,1650286529,NULL,0,NULL,NULL,NULL,'http://mh.fionazone.cn:88/app/index.php?i=1&c=entry&do=index&m=vp_ph',0,NULL,NULL,NULL,NULL,NULL),(58,1,'buycoin',1,'购买1爱心','1元购买1爱心',6,'ogtiH5tII9wkl2xhQTOLYtGofSdk','',1.00,1,1.00,0.00,0.00,1.00,0,0.00,0,0.00,0,0.00,1.00,1650287185,'',10,1650287185,NULL,0,NULL,NULL,NULL,'http://mh.fionazone.cn:88/app/index.php?i=1&c=entry&do=index&m=vp_ph&wxref=mp.weixin.qq.com',0,NULL,NULL,NULL,NULL,NULL),(59,1,'agent',9,'购买红娘','9.9元购买红娘',9,'ogtiH5h8R51UZvkc8iH0ck00cSuQ','',9.90,1,9.90,0.00,0.00,9.90,0,0.00,0,0.00,0,0.00,9.90,1650287284,'',10,1650287284,NULL,0,NULL,NULL,NULL,'http://mh.fionazone.cn:88/app/index.php?i=1&c=entry&do=agent&m=vp_ph',0,NULL,NULL,NULL,NULL,NULL),(60,1,'buycoin',1,'购买1爱心','1元购买1爱心',6,'ogtiH5tII9wkl2xhQTOLYtGofSdk','',1.00,1,1.00,0.00,0.00,1.00,0,0.00,0,0.00,0,0.00,1.00,1650287400,'',10,1650287400,NULL,0,NULL,NULL,NULL,'http://mh.fionazone.cn:88/app/index.php?i=1&c=entry&do=index&m=vp_ph',0,NULL,NULL,NULL,NULL,NULL),(61,1,'buycoin',1,'购买1爱心','1元购买1爱心',12,'ogtiH5qGnAd5YQ0Ij4kLDbhywoY0','',1.00,1,1.00,0.00,0.00,1.00,0,0.00,0,0.00,0,0.00,1.00,1650287417,'',10,1650287417,NULL,0,NULL,NULL,NULL,'http://mh.fionazone.cn:88/app/index.php?i=1&c=entry&do=index&m=vp_ph',0,NULL,NULL,NULL,NULL,NULL),(62,1,'buycoin',1,'购买1爱心','1元购买1爱心',12,'ogtiH5qGnAd5YQ0Ij4kLDbhywoY0','',1.00,1,1.00,0.00,0.00,1.00,0,0.00,0,0.00,0,0.00,1.00,1650288356,'',10,1650288356,NULL,0,NULL,NULL,NULL,'http://mh.fionazone.cn:88/app/index.php?i=1&c=entry&do=index&m=vp_ph',0,NULL,NULL,NULL,NULL,NULL),(63,1,'buycoin',1,'购买1爱心','1元购买1爱心',15,'ogtiH5hQ_tGIyDwvEtDvQghgOgtc','',1.00,1,1.00,0.00,0.00,1.00,12,0.70,0,0.00,0,0.00,0.30,1650288934,'',10,1650288934,NULL,0,NULL,NULL,NULL,'http://mh.fionazone.cn:88/app/index.php?i=1&c=entry&fuid=b8bMTI&auid=b8bMTI&do=index&m=vp_ph',0,NULL,NULL,NULL,NULL,NULL),(64,1,'buycoin',1,'购买1爱心','1元购买1爱心',15,'ogtiH5hQ_tGIyDwvEtDvQghgOgtc','',1.00,1,1.00,0.00,0.00,1.00,12,0.70,0,0.00,0,0.00,0.30,1650289598,'',10,1650289598,NULL,0,NULL,NULL,NULL,'http://mh.fionazone.cn:88/app/index.php?i=1&c=entry&fuid=b8bMTI&auid=b8bMTI&do=index&m=vp_ph',0,NULL,NULL,NULL,NULL,NULL),(65,1,'buycoin',6,'购买6爱心','5元购买6爱心',15,'ogtiH5hQ_tGIyDwvEtDvQghgOgtc','',5.00,6,5.00,0.00,0.00,5.00,12,3.50,0,0.00,0,0.00,1.50,1650289724,'',10,1650289724,NULL,0,NULL,NULL,NULL,'http://mh.fionazone.cn:88/app/index.php?i=1&c=entry&fuid=b8bMTI&auid=b8bMTI&do=index&m=vp_ph',0,NULL,NULL,NULL,NULL,NULL),(66,1,'buycoin',6,'购买6爱心','5元购买6爱心',15,'ogtiH5hQ_tGIyDwvEtDvQghgOgtc','',5.00,6,5.00,0.00,0.00,5.00,12,3.50,0,0.00,0,0.00,1.50,1650289749,'',10,1650289749,NULL,0,NULL,NULL,NULL,'http://mh.fionazone.cn:88/app/index.php?i=1&c=entry&fuid=b8bMTI&auid=b8bMTI&do=index&m=vp_ph',0,NULL,NULL,NULL,NULL,NULL),(67,1,'buycoin',1,'购买1爱心','1元购买1爱心',9,'ogtiH5h8R51UZvkc8iH0ck00cSuQ','',1.00,1,1.00,0.00,0.00,1.00,0,0.00,0,0.00,0,0.00,1.00,1650289763,'',10,1650289763,NULL,0,NULL,NULL,NULL,'http://mh.fionazone.cn:88/app/index.php?i=1&c=entry&do=index&m=vp_ph',0,NULL,NULL,NULL,NULL,NULL),(68,1,'buycoin',1,'购买1爱心','1元购买1爱心',12,'ogtiH5qGnAd5YQ0Ij4kLDbhywoY0','',1.00,1,1.00,0.00,0.00,1.00,0,0.00,0,0.00,0,0.00,1.00,1650289872,'',10,1650289872,NULL,0,NULL,NULL,NULL,'http://mh.fionazone.cn:88/app/index.php?i=1&c=entry&do=index&m=vp_ph',0,NULL,NULL,NULL,NULL,NULL),(69,1,'buycoin',1,'购买1爱心','1元购买1爱心',6,'ogtiH5tII9wkl2xhQTOLYtGofSdk','',1.00,1,1.00,0.00,0.00,1.00,0,0.00,0,0.00,0,0.00,1.00,1650289972,'',10,1650289972,NULL,0,NULL,NULL,NULL,'http://mh.fionazone.cn:88/app/index.php?i=1&c=entry&do=index&m=vp_ph&wxref=mp.weixin.qq.com',0,NULL,NULL,NULL,NULL,NULL),(70,1,'buycoin',1,'购买1爱心','1元购买1爱心',6,'ogtiH5tII9wkl2xhQTOLYtGofSdk','',1.00,1,1.00,0.00,0.00,1.00,0,0.00,0,0.00,0,0.00,1.00,1650290733,'',10,1650290733,NULL,0,NULL,NULL,NULL,'http://mh.fionazone.cn:88/app/index.php?i=1&c=entry&fuid=714Ng&auid=714Ng&do=index&m=vp_ph',0,NULL,NULL,NULL,NULL,NULL),(71,1,'buycoin',1,'购买1爱心','1元购买1爱心',6,'ogtiH5tII9wkl2xhQTOLYtGofSdk','',1.00,1,1.00,0.00,0.00,1.00,0,0.00,0,0.00,0,0.00,1.00,1650290817,'',20,1650290817,NULL,0,1.00,NULL,1650290835,'http://mh.fionazone.cn:88/app/index.php?i=1&c=entry&do=index&m=vp_ph',0,NULL,NULL,NULL,NULL,NULL),(72,1,'buycoin',1,'购买1爱心','1元购买1爱心',15,'ogtiH5hQ_tGIyDwvEtDvQghgOgtc','',1.00,1,1.00,0.00,0.00,1.00,12,0.70,0,0.00,0,0.00,0.30,1650290889,'',20,1650290889,NULL,0,1.00,NULL,1650290927,'http://mh.fionazone.cn:88/app/index.php?i=1&c=entry&fuid=b8bMTI&auid=b8bMTI&do=index&m=vp_ph',0,NULL,NULL,NULL,NULL,NULL),(73,1,'agent',15,'购买红娘','9.9元购买红娘',15,'ogtiH5hQ_tGIyDwvEtDvQghgOgtc','',9.90,1,9.90,0.00,0.00,9.90,12,6.93,0,0.00,0,0.00,2.97,1650299723,'',10,1650299723,NULL,0,NULL,NULL,NULL,'http://mh.fionazone.cn:88/app/index.php?i=1&c=entry&do=agent&m=vp_ph',0,NULL,NULL,NULL,NULL,NULL),(74,1,'agent',15,'购买红娘','9.9元购买红娘',15,'ogtiH5hQ_tGIyDwvEtDvQghgOgtc','',9.90,1,9.90,0.00,0.00,9.90,12,6.93,0,0.00,0,0.00,2.97,1650299738,'',10,1650299738,NULL,0,NULL,NULL,NULL,'http://mh.fionazone.cn:88/app/index.php?i=1&c=entry&do=agent&m=vp_ph',0,NULL,NULL,NULL,NULL,NULL),(75,1,'buycoin',6,'购买6爱心','5元购买6爱心',15,'ogtiH5hQ_tGIyDwvEtDvQghgOgtc','',5.00,6,5.00,0.00,0.00,5.00,12,3.50,0,0.00,0,0.00,1.50,1650299791,'',20,1650299791,NULL,0,5.00,NULL,1650299842,'http://mh.fionazone.cn:88/app/index.php?i=1&c=entry&fuid=b8bMTI&auid=b8bMTI&do=index&m=vp_ph',0,NULL,NULL,NULL,NULL,NULL),(76,1,'agent',15,'购买红娘','9.9元购买红娘',15,'ogtiH5hQ_tGIyDwvEtDvQghgOgtc','',9.90,1,9.90,0.00,0.00,9.90,12,6.93,0,0.00,0,0.00,2.97,1650299863,'',10,1650299863,NULL,0,NULL,NULL,NULL,'http://mh.fionazone.cn:88/app/index.php?i=1&c=entry&do=agent&m=vp_ph',0,NULL,NULL,NULL,NULL,NULL),(77,1,'agent',15,'购买红娘','9.9元购买红娘',15,'ogtiH5hQ_tGIyDwvEtDvQghgOgtc','',9.90,1,9.90,0.00,0.00,9.90,12,6.93,0,0.00,0,0.00,2.97,1650299914,'',20,1650299914,NULL,0,9.90,NULL,1650300014,'http://mh.fionazone.cn:88/app/index.php?i=1&c=entry&do=agent&m=vp_ph',0,NULL,NULL,NULL,NULL,NULL),(78,1,'buycoin',2,'购买2爱心','2元购买2爱心',12,'ogtiH5qGnAd5YQ0Ij4kLDbhywoY0','',2.00,2,2.00,0.00,0.00,2.00,0,0.00,0,0.00,0,0.00,2.00,1650333964,'',10,1650333964,NULL,0,NULL,NULL,NULL,'http://mh.fionazone.cn:88/app/index.php?i=1&c=entry&do=index&m=vp_ph',0,NULL,NULL,NULL,NULL,NULL),(79,1,'buycoin',6,'购买6爱心','5元购买6爱心',19,'oXDWr6UIjklchpwfNWcb7A_aUo6w','',5.00,6,5.00,0.00,0.00,5.00,0,0.00,0,0.00,0,0.00,5.00,1650337947,'',10,1650337947,NULL,0,NULL,NULL,NULL,'http://mh.fionazone.cn:88/app/index.php?i=1&c=entry&do=index&m=vp_ph',0,NULL,NULL,NULL,NULL,NULL),(80,1,'buycoin',2,'购买2爱心','2元购买2爱心',19,'oXDWr6UIjklchpwfNWcb7A_aUo6w','',2.00,2,2.00,0.00,0.00,2.00,0,0.00,0,0.00,0,0.00,2.00,1650337958,'',20,1650337958,NULL,0,2.00,NULL,1650337969,'http://mh.fionazone.cn:88/app/index.php?i=1&c=entry&do=index&m=vp_ph',0,NULL,NULL,NULL,NULL,NULL),(81,1,'buycoin',1,'购买1爱心','1元购买1爱心',12,'ogtiH5qGnAd5YQ0Ij4kLDbhywoY0','',1.00,1,1.00,0.00,0.00,1.00,0,0.00,0,0.00,0,0.00,1.00,1650348236,'',10,1650348236,NULL,0,NULL,NULL,NULL,'http://mh.fionazone.cn:88/app/index.php?i=1&c=entry&do=index&m=vp_ph',0,NULL,NULL,NULL,NULL,NULL),(82,1,'buycoin',14,'购买14爱心','10元购买14爱心',12,'ogtiH5qGnAd5YQ0Ij4kLDbhywoY0','',10.00,14,10.00,0.00,0.00,10.00,0,0.00,0,0.00,0,0.00,10.00,1650354250,'',10,1650354250,NULL,0,NULL,NULL,NULL,'http://mh.fionazone.cn:88/app/index.php?i=1&c=entry&fuid=b8bMTI&auid=b8bMTI&do=index&m=vp_ph',0,NULL,NULL,NULL,NULL,NULL),(83,1,'buycoin',1,'购买1爱心','1元购买1爱心',12,'ogtiH5qGnAd5YQ0Ij4kLDbhywoY0','',1.00,1,1.00,0.00,0.00,1.00,0,0.00,0,0.00,0,0.00,1.00,1650354270,'',10,1650354270,NULL,0,NULL,NULL,NULL,'http://mh.fionazone.cn:88/app/index.php?i=1&c=entry&fuid=b8bMTI&auid=b8bMTI&do=index&m=vp_ph',0,NULL,NULL,NULL,NULL,NULL),(84,1,'buycoin',14,'购买14爱心','10元购买14爱心',12,'ogtiH5qGnAd5YQ0Ij4kLDbhywoY0','',10.00,14,10.00,0.00,0.00,10.00,0,0.00,0,0.00,0,0.00,10.00,1650354486,'',10,1650354486,NULL,0,NULL,NULL,NULL,'http://mh.fionazone.cn:88/app/index.php?i=1&c=entry&fuid=b8bMTI&auid=b8bMTI&do=index&m=vp_ph',0,NULL,NULL,NULL,NULL,NULL),(85,1,'buycoin',14,'购买14爱心','10元购买14爱心',26,'oXDWr6UsYEzcGySOzDwJzoX6yHlI','',10.00,14,10.00,0.00,0.00,10.00,12,7.00,0,0.00,0,0.00,3.00,1650358778,'',10,1650358778,NULL,0,NULL,NULL,NULL,'http://mh.fionazone.cn:88/app/index.php?i=1&c=entry&fuid=b8bMTI&auid=b8bMTI&do=index&m=vp_ph',0,NULL,NULL,NULL,NULL,NULL),(86,1,'buycoin',1,'手充1爱心','0元手充1爱心',27,'oXDWr6fY_19_WLwOvhtGRNmJ6wag','',0.00,1,0.00,0.00,0.00,0.00,12,0.00,0,0.00,0,0.00,0.00,1650359529,'',20,1650359529,NULL,10,0.00,NULL,NULL,'',0,NULL,NULL,NULL,NULL,NULL),(87,1,'buycoin',1,'手充1爱心','0元手充1爱心',26,'oXDWr6UsYEzcGySOzDwJzoX6yHlI','',0.00,1,0.00,0.00,0.00,0.00,12,0.00,0,0.00,0,0.00,0.00,1650359894,'',20,1650359894,NULL,10,0.00,NULL,NULL,'',0,NULL,NULL,NULL,NULL,NULL),(88,1,'buycoin',455,'手充455爱心','0元手充455爱心',37,'ogtiH5tII9wkl2xhQTOLYtGofSdk','',0.00,455,0.00,0.00,0.00,0.00,0,0.00,0,0.00,0,0.00,0.00,1650641141,'',20,1650641141,NULL,10,0.00,NULL,NULL,'',0,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `ims_vp_ph_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_vp_ph_outcash`
--

DROP TABLE IF EXISTS `ims_vp_ph_outcash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_vp_ph_outcash` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `biz` varchar(20) NOT NULL COMMENT '提现业务：agent代理提现',
  `biz_id` int(11) NOT NULL COMMENT '业务主体IID，user就是mine[id],city就是city[id]',
  `uid` int(11) NOT NULL,
  `nickname` varchar(40) DEFAULT NULL COMMENT '提现者的名字',
  `weixin` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `mobile` varchar(32) NOT NULL,
  `openid` varchar(100) NOT NULL COMMENT '用户的openid',
  `money_before` decimal(12,2) NOT NULL COMMENT '提现前账户金额(元)',
  `money_after` decimal(12,2) NOT NULL COMMENT '提现后账户金额（元）',
  `money` decimal(12,2) NOT NULL COMMENT '提现金额',
  `cash` decimal(12,2) NOT NULL COMMENT '用户实际获得金额',
  `status` tinyint(1) NOT NULL COMMENT '0：发起\n1：成功\n2：失败（未退帐）\n3：失败（已退帐）',
  `status_remark` text,
  `channel` tinyint(1) DEFAULT NULL COMMENT '1:微信手动转账（收款码）',
  `channel_account` varchar(255) DEFAULT NULL,
  `channel_realname` varchar(64) DEFAULT NULL,
  `tag` text COMMENT '接口订单信息序列化存储',
  `remark` text,
  `fedback` text COMMENT '处理反馈',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  `update_time` int(11) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户提现记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_vp_ph_outcash`
--

LOCK TABLES `ims_vp_ph_outcash` WRITE;
/*!40000 ALTER TABLE `ims_vp_ph_outcash` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_vp_ph_outcash` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_vp_ph_page`
--

DROP TABLE IF EXISTS `ims_vp_ph_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_vp_ph_page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `content` text CHARACTER SET utf8mb4 NOT NULL,
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_vp_ph_page`
--

LOCK TABLES `ims_vp_ph_page` WRITE;
/*!40000 ALTER TABLE `ims_vp_ph_page` DISABLE KEYS */;
INSERT INTO `ims_vp_ph_page` VALUES (1,1,'用户协议','<ol class=\" list-paddingleft-2\" style=\"list-style-type: decimal;\"><li><p>用户在平台存纸条时请务必遵守《网络安全管理条例》不得填写跟黄赌毒等一切有损法律法规的内容</p></li><li><p><br/></p></li><li><p>用户在存纸条时切勿填写真实姓名及家庭住址等有关个人隐私的内容<br/></p></li></ol><p><br/></p>',1650269854),(2,1,'隐私协议','<p>平台将保证用户的个人隐私，纸条的内容不会泄露</p><p><br/></p><p>用户不能以任何形式对抽取人的联系方式进行骚扰</p>',1650270652);
/*!40000 ALTER TABLE `ims_vp_ph_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_vp_ph_pair`
--

DROP TABLE IF EXISTS `ims_vp_ph_pair`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_vp_ph_pair` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `uid` int(11) NOT NULL COMMENT '我的uid',
  `ouid` int(11) NOT NULL COMMENT '对方的uid',
  `create_time` int(11) NOT NULL,
  `pair` tinyint(4) NOT NULL COMMENT '0:未感觉,1:感觉中（表示用户已为该对象消耗过1个匹配额度了）,2:已感觉',
  `pair_time` int(11) NOT NULL,
  `feel` tinyint(4) NOT NULL COMMENT '感觉：0:未感觉 1:无感觉,2:心动,3:心动表白',
  `msg` text CHARACTER SET utf8mb4 NOT NULL COMMENT '心动消息',
  `feel_time` int(11) NOT NULL,
  `msg_time` int(11) NOT NULL,
  `matched` tinyint(4) NOT NULL COMMENT '是否互相心动匹配：0：否，1：是',
  `matched_time` int(11) NOT NULL,
  `peek` tinyint(4) NOT NULL,
  `peek_time` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniacid_uid_ouid` (`uniacid`,`uid`,`ouid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_vp_ph_pair`
--

LOCK TABLES `ims_vp_ph_pair` WRITE;
/*!40000 ALTER TABLE `ims_vp_ph_pair` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_vp_ph_pair` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_vp_ph_user`
--

DROP TABLE IF EXISTS `ims_vp_ph_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_vp_ph_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `ufo` tinyint(1) NOT NULL,
  `uid` int(11) NOT NULL COMMENT '对应mc_member表中的uid,唯一',
  `nickname` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `mobile` varchar(20) CHARACTER SET utf8mb4 NOT NULL,
  `mobile_valid` varchar(255) CHARACTER SET utf8mb4 NOT NULL COMMENT '加密存储用户绑定的手机',
  `openid` varchar(80) CHARACTER SET utf8mb4 NOT NULL,
  `feedin1` int(11) NOT NULL COMMENT '放入男纸条次数',
  `feedin2` int(11) NOT NULL COMMENT '放入女纸条次数',
  `feedout1` int(11) NOT NULL COMMENT '取出男纸条次数',
  `feedout2` int(11) NOT NULL COMMENT '取出女纸条次数',
  `pname` varchar(255) CHARACTER SET utf8mb4 NOT NULL COMMENT '配对昵称',
  `pname_edittime` int(11) NOT NULL COMMENT '称呼修改时间',
  `cover` varchar(255) CHARACTER SET utf8mb4 NOT NULL COMMENT '封面照',
  `images` text CHARACTER SET utf8mb4 NOT NULL COMMENT '相片',
  `images_edittime` int(11) NOT NULL,
  `sex` tinyint(1) NOT NULL COMMENT '1男，2女',
  `age` tinyint(4) NOT NULL,
  `height` float NOT NULL COMMENT '身高，厘米',
  `weight` float NOT NULL COMMENT '体重，公斤',
  `tagi` text CHARACTER SET utf8mb4 NOT NULL COMMENT '我的标签',
  `tagu` text CHARACTER SET utf8mb4 NOT NULL COMMENT '我喜欢的标签',
  `province` varchar(80) CHARACTER SET utf8mb4 NOT NULL,
  `city` varchar(80) CHARACTER SET utf8mb4 NOT NULL,
  `country` varchar(80) CHARACTER SET utf8mb4 NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `lng` double NOT NULL,
  `lat` double NOT NULL,
  `distance` decimal(12,2) NOT NULL,
  `qq` varchar(32) CHARACTER SET utf8mb4 NOT NULL COMMENT '联系方式：QQ',
  `wx` varchar(32) CHARACTER SET utf8mb4 NOT NULL COMMENT '联系方式：微信号',
  `dy` varchar(32) CHARACTER SET utf8mb4 NOT NULL COMMENT '联系方式：抖音号',
  `sj` varchar(32) CHARACTER SET utf8mb4 NOT NULL COMMENT '联系方式：手机号',
  `coin` int(11) NOT NULL,
  `coin_in` int(11) NOT NULL,
  `coin_used` int(11) NOT NULL,
  `money_in` decimal(12,2) NOT NULL COMMENT '我的充值总额',
  `fuid` int(11) NOT NULL,
  `invites` int(11) NOT NULL COMMENT '我邀请的用户数',
  `agentp` int(11) NOT NULL COMMENT '我的直接上级分销商id',
  `agentp1` int(11) NOT NULL COMMENT '我的上上级分销商id',
  `agentp2` int(11) NOT NULL COMMENT '我的上上上级分销商',
  `create_time` int(11) NOT NULL,
  `is_play` tinyint(4) NOT NULL COMMENT '是否加入游戏',
  `play_time` int(11) NOT NULL COMMENT '加入的时间',
  `is_nt` tinyint(4) NOT NULL COMMENT '是否接受通知',
  `verify_status` tinyint(4) NOT NULL COMMENT '0:待审核,10:违规,20:正常',
  `verify_remark` text CHARACTER SET utf8mb4 NOT NULL,
  `verify_time` int(11) NOT NULL,
  `pps` int(11) NOT NULL COMMENT '剩余匹配次数',
  `pped` int(11) NOT NULL COMMENT '已匹配次数',
  `likes` int(11) NOT NULL COMMENT '剩余喜欢数',
  `liked` int(11) NOT NULL COMMENT '已喜欢数',
  `sliked` int(11) NOT NULL COMMENT '已超级喜欢数',
  `likedo` int(11) NOT NULL COMMENT '被喜欢数',
  `slikedo` int(11) NOT NULL COMMENT '被超级喜欢数',
  `peeked` int(11) NOT NULL COMMENT '我偷看数',
  `peekedo` int(11) NOT NULL COMMENT '我被偷看数',
  `matched` int(11) NOT NULL COMMENT '互相心动次数',
  `agent` int(11) NOT NULL COMMENT '0:非分销商，1:普通分销商，2大型分销商，3超大分销商，9管理员',
  `agent_rate` int(11) NOT NULL COMMENT '店主比例',
  `agent_time` int(11) NOT NULL,
  `users` int(11) NOT NULL COMMENT '我推广的直接下级用户数',
  `agentbs` int(11) NOT NULL COMMENT '我的直接下级分销商数',
  `agentb1s` int(11) NOT NULL COMMENT '我的二级分销商数',
  `agentb2s` int(11) NOT NULL COMMENT '我的三级分销商数',
  `agent_money` decimal(12,2) NOT NULL COMMENT '分销商账户余额',
  `agent_money_in` decimal(12,2) NOT NULL COMMENT '分销商账户收入累计',
  `agent_money_outcash` decimal(12,2) NOT NULL COMMENT '分销商账户提现累计',
  `admin` tinyint(4) NOT NULL,
  `is_black` tinyint(4) NOT NULL COMMENT '是否黑名单',
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_vp_ph_user`
--

LOCK TABLES `ims_vp_ph_user` WRITE;
/*!40000 ALTER TABLE `ims_vp_ph_user` DISABLE KEYS */;
INSERT INTO `ims_vp_ph_user` VALUES (34,1,0,26,'ᯤ','https://thirdwx.qlogo.cn/mmopen/vi_32/GJCc3BIV33StBWH11Oq1tWFKojW2gIoibFQTfc7e5OibVWiad1Nl9otVbC3APSvxibhrozP8vpYdyTceMtCRVAZ8ng/132','','','oXDWr6eX33VX9v3yE6Kk2guvqyCk',1,0,0,0,'',0,'','',0,0,0,0,0,'','','','','','',0,0,0.00,'','','','',0,0,0,0.00,12,0,0,0,0,1650515229,0,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0.00,0.00,0.00,0,0),(35,1,0,27,'抱米花','https://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eqiblJplHqjCOSFBHXR2V0hkHHF8rtVnHk0w0XE4WTPjiaS1Tjo8pDEpcxLHmPDicsGWTt8kr2YgKnUA/132','','','oXDWr6ZZwNDPKTxb4OJOprBrl3AY',0,0,0,0,'',0,'','',0,0,0,0,0,'','','','','','',0,0,0.00,'','','','',0,0,0,0.00,12,0,0,0,0,1650624499,0,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0.00,0.00,0.00,0,0),(9,1,0,5,'DiDi支付','https://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLpaqvnFvnzOdojwhru520ibyTpYM2XYibIGFBUkRAQdjyfy7jaox1xBMhNO9vZFpichQFeukurljKSg/132','','','ogtiH5h8R51UZvkc8iH0ck00cSuQ',0,0,0,0,'',0,'','',0,0,0,0,0,'','','','','','',0,0,0.00,'','','','',0,0,0,0.00,0,0,0,0,0,1650195925,0,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0.00,0.00,0.00,0,0),(36,1,0,28,'沐文梦','https://thirdwx.qlogo.cn/mmopen/vi_32/jK4fNcqpSU3MkTpHVN6ibpfNib05N5qMySWgMIlibHqMRhNAB6MzAM8lQspyUk5dzIcElX5fNWhiajoIK3BURHx2Ng/132','','','oXDWr6djJz7_IMn__9lp3v7CQO1w',0,0,0,0,'',0,'','',0,0,0,0,0,'','','','','','',0,0,0.00,'','','','',0,0,0,0.00,12,0,0,0,0,1650634045,0,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0.00,0.00,0.00,0,0),(31,1,0,22,'盲盒','https://thirdwx.qlogo.cn/mmopen/vi_32/OJDVARMlVtNRUx9rOyic88828Lk6h86CcqSqH4BhJym5vy0OkfsH0t6oFdVAzHfSndafWAdVaR2ryy6WiaSyPQyw/132','','','oXDWr6fY_19_WLwOvhtGRNmJ6wag',0,0,0,0,'',0,'','',0,0,0,0,0,'','','','','','',0,0,0.00,'','','','',0,0,0,0.00,26,0,26,0,0,1650361267,0,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0.00,0.00,0.00,0,0),(29,1,0,24,'yeong7','https://thirdwx.qlogo.cn/mmopen/vi_32/3nQ1r3KiaGb6J75qUXcqbibWnvfv4CzssHxIBRygtYAaTqw7u2FXhHgE3WeF5AGiacahR4YbWLXQPqeLyoW78Eicww/132','','','oXDWr6WL4RvtewLOxVVNmdwOWO2w',0,0,0,0,'',0,'','',0,0,0,0,0,'','','','','','',0,0,0.00,'','','','',0,0,0,0.00,12,0,0,0,0,1650359769,0,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0.00,0.00,0.00,0,0),(26,1,0,21,'长安','https://thirdwx.qlogo.cn/mmopen/vi_32/nfhQ5ibcibez6K0lFRNXjLBJiadFJqojujGrhF1z8r45Gd4nHQhnTQQXGjyhQCvdegUrfht58AQP2Bx0syqEzpwmg/132','','','oXDWr6UsYEzcGySOzDwJzoX6yHlI',1,0,1,0,'',0,'','',0,0,0,0,0,'','','','','','',0,0,0.00,'','','','',0,1,1,0.00,12,0,12,0,0,1650358730,0,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,0,1650358919,1,0,0,0,0.00,0.00,0.00,1,0),(32,1,0,17,'YP_s','https://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKEpiaNbpwnNtgC4JUibV5ibsSvnLxuvD6cTPVKmotcvtaibODCTY7ORzHhaHmbj6aSHoSE80HVyicGwRg/132','','','oXDWr6fXgq2qVsUUmX4sAFOnNjkI',0,0,0,0,'',0,'','',0,0,0,0,0,'','','','','','',0,0,0.00,'','','','',0,0,0,0.00,12,0,0,0,0,1650366325,0,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0.00,0.00,0.00,0,0),(28,1,0,23,'.cium','https://thirdwx.qlogo.cn/mmopen/vi_32/icONDnYnxs86LNuCLM6n7YDiapgQZwPNsJ67FeSYjdA6l8A5vwO66aPupqAZBhdjcvVbN7MNWT74SnJDHr9n72LA/132','','','oXDWr6UHVH5HjioRo9TP7i5os9TU',0,0,0,0,'',0,'','',0,0,0,0,0,'','','','','','',0,0,0.00,'','','','',0,0,0,0.00,12,0,12,0,0,1650358985,0,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0.00,0.00,0.00,0,0),(33,1,0,25,'·','https://thirdwx.qlogo.cn/mmopen/vi_32/bhYF8RK2Baic3mwtKiakYlYo1giaGlqK6hqEiaNHSN1oBplbdGFbOsG20u4IhUSGec63nNR8dgnFnCicaIcWLb7TQKg/132','','','oXDWr6dx-ApsWOEV9Qn2id1NxvIM',0,0,0,0,'',0,'','',0,0,0,0,0,'','','','','','',0,0,0.00,'','','','',0,0,0,0.00,12,0,0,0,0,1650510620,0,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0.00,0.00,0.00,0,0),(37,1,0,2,'梦凌','https://thirdwx.qlogo.cn/mmopen/vi_32/pR9iaxY5iaqkg0TGcjcdy6ev4zibw8VW6KEmb26upqB6w8akeayhUIn9Et9ZmoTdSIM1ErLqeibPhKnEKCKicC9lahA/132','','','ogtiH5tII9wkl2xhQTOLYtGofSdk',2,1,0,0,'',0,'','',0,0,0,0,0,'','','','','','',0,0,0.00,'','','','',453,455,2,0.00,0,0,0,0,0,1650640742,0,0,1,0,'',0,0,0,0,0,0,0,0,0,0,0,1,0,1650641073,0,0,0,0,0.00,0.00,0.00,1,0);
/*!40000 ALTER TABLE `ims_vp_ph_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_vp_ph_user_feed`
--

DROP TABLE IF EXISTS `ims_vp_ph_user_feed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_vp_ph_user_feed` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `feed_id` int(11) NOT NULL,
  `feed_uid` int(11) NOT NULL,
  `sex` tinyint(4) NOT NULL,
  `create_time` int(11) NOT NULL,
  `status` int(11) NOT NULL COMMENT '0:未生效，1:已生效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_vp_ph_user_feed`
--

LOCK TABLES `ims_vp_ph_user_feed` WRITE;
/*!40000 ALTER TABLE `ims_vp_ph_user_feed` DISABLE KEYS */;
INSERT INTO `ims_vp_ph_user_feed` VALUES (1,1,10,8,6,1,1650206630,1),(2,1,26,18,12,1,1650359901,1);
/*!40000 ALTER TABLE `ims_vp_ph_user_feed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_wechat_attachment`
--

DROP TABLE IF EXISTS `ims_wechat_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_wechat_attachment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `acid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `filename` varchar(255) NOT NULL,
  `attachment` varchar(255) NOT NULL,
  `media_id` varchar(255) NOT NULL,
  `width` int(10) unsigned NOT NULL,
  `height` int(10) unsigned NOT NULL,
  `type` varchar(15) NOT NULL,
  `model` varchar(25) NOT NULL,
  `tag` varchar(5000) NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `module_upload_dir` varchar(100) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `media_id` (`media_id`),
  KEY `acid` (`acid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_wechat_attachment`
--

LOCK TABLES `ims_wechat_attachment` WRITE;
/*!40000 ALTER TABLE `ims_wechat_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_wechat_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_wechat_news`
--

DROP TABLE IF EXISTS `ims_wechat_news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_wechat_news` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned DEFAULT NULL,
  `attach_id` int(10) unsigned NOT NULL,
  `thumb_media_id` varchar(60) NOT NULL,
  `thumb_url` varchar(255) NOT NULL,
  `title` varchar(50) NOT NULL,
  `author` varchar(30) NOT NULL,
  `digest` varchar(255) NOT NULL,
  `content` mediumtext NOT NULL,
  `content_source_url` varchar(200) NOT NULL,
  `show_cover_pic` tinyint(3) unsigned NOT NULL,
  `url` varchar(200) NOT NULL,
  `displayorder` int(2) NOT NULL,
  `need_open_comment` tinyint(1) NOT NULL,
  `only_fans_can_comment` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `attach_id` (`attach_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_wechat_news`
--

LOCK TABLES `ims_wechat_news` WRITE;
/*!40000 ALTER TABLE `ims_wechat_news` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_wechat_news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_wxapp_general_analysis`
--

DROP TABLE IF EXISTS `ims_wxapp_general_analysis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_wxapp_general_analysis` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) NOT NULL,
  `session_cnt` int(10) NOT NULL,
  `visit_pv` int(10) NOT NULL,
  `visit_uv` int(10) NOT NULL,
  `visit_uv_new` int(10) NOT NULL,
  `type` tinyint(2) NOT NULL,
  `stay_time_uv` varchar(10) NOT NULL,
  `stay_time_session` varchar(10) NOT NULL,
  `visit_depth` varchar(10) NOT NULL,
  `ref_date` varchar(8) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `ref_date` (`ref_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_wxapp_general_analysis`
--

LOCK TABLES `ims_wxapp_general_analysis` WRITE;
/*!40000 ALTER TABLE `ims_wxapp_general_analysis` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_wxapp_general_analysis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_wxapp_register_version`
--

DROP TABLE IF EXISTS `ims_wxapp_register_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_wxapp_register_version` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `version_id` int(10) NOT NULL,
  `auditid` int(11) NOT NULL,
  `version` varchar(20) NOT NULL,
  `description` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `reason` varchar(1000) NOT NULL,
  `upload_time` int(11) NOT NULL,
  `audit_info` text NOT NULL,
  `submit_info` text NOT NULL,
  `developer` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `auditid` (`auditid`),
  KEY `version_id` (`version_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_wxapp_register_version`
--

LOCK TABLES `ims_wxapp_register_version` WRITE;
/*!40000 ALTER TABLE `ims_wxapp_register_version` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_wxapp_register_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_wxapp_reply`
--

DROP TABLE IF EXISTS `ims_wxapp_reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_wxapp_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL,
  `title` varchar(50) NOT NULL,
  `appid` varchar(50) NOT NULL,
  `pagepath` varchar(255) NOT NULL,
  `mediaid` varchar(50) NOT NULL,
  `createtime` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_wxapp_reply`
--

LOCK TABLES `ims_wxapp_reply` WRITE;
/*!40000 ALTER TABLE `ims_wxapp_reply` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_wxapp_reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_wxapp_undocodeaudit_log`
--

DROP TABLE IF EXISTS `ims_wxapp_undocodeaudit_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_wxapp_undocodeaudit_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `version_id` int(10) NOT NULL,
  `auditid` int(11) NOT NULL,
  `revoke_time` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `version_id` (`version_id`),
  KEY `auditid` (`auditid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_wxapp_undocodeaudit_log`
--

LOCK TABLES `ims_wxapp_undocodeaudit_log` WRITE;
/*!40000 ALTER TABLE `ims_wxapp_undocodeaudit_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_wxapp_undocodeaudit_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_wxapp_versions`
--

DROP TABLE IF EXISTS `ims_wxapp_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_wxapp_versions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `multiid` int(10) unsigned NOT NULL,
  `version` varchar(10) NOT NULL,
  `description` varchar(255) NOT NULL,
  `modules` varchar(1000) NOT NULL,
  `design_method` tinyint(1) NOT NULL,
  `template` int(10) NOT NULL,
  `quickmenu` varchar(2500) NOT NULL,
  `createtime` int(10) NOT NULL,
  `type` int(2) NOT NULL,
  `entry_id` int(11) NOT NULL,
  `appjson` text NOT NULL,
  `default_appjson` text NOT NULL,
  `use_default` tinyint(1) NOT NULL,
  `last_modules` varchar(1000) DEFAULT NULL,
  `tominiprogram` varchar(1000) NOT NULL,
  `upload_time` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `version` (`version`),
  KEY `uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_wxapp_versions`
--

LOCK TABLES `ims_wxapp_versions` WRITE;
/*!40000 ALTER TABLE `ims_wxapp_versions` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_wxapp_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_wxcard_reply`
--

DROP TABLE IF EXISTS `ims_wxcard_reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_wxcard_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL,
  `title` varchar(30) NOT NULL,
  `card_id` varchar(50) NOT NULL,
  `cid` int(10) unsigned NOT NULL,
  `brand_name` varchar(30) NOT NULL,
  `logo_url` varchar(255) NOT NULL,
  `success` varchar(255) NOT NULL,
  `error` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_wxcard_reply`
--

LOCK TABLES `ims_wxcard_reply` WRITE;
/*!40000 ALTER TABLE `ims_wxcard_reply` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_wxcard_reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invite_code`
--

DROP TABLE IF EXISTS `invite_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invite_code` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL COMMENT '所有者ID',
  `code` char(32) NOT NULL DEFAULT '' COMMENT '邀请码',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '使用状态 0未使用 1已使用',
  `invite_uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '受邀用户ID',
  `invite_at` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '邀请时间',
  `create_at` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `expire_at` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invite_code`
--

LOCK TABLES `invite_code` WRITE;
/*!40000 ALTER TABLE `invite_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `invite_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `link`
--

DROP TABLE IF EXISTS `link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `link` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `relation_type` varchar(20) NOT NULL DEFAULT '',
  `relation_id` int(10) unsigned NOT NULL DEFAULT '0',
  `token` char(16) NOT NULL DEFAULT '',
  `short_url` varchar(30) NOT NULL,
  `status` tinyint(3) unsigned NOT NULL,
  `original_user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品来源用户ID',
  `agent_type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '代理类型 0：非代理 1：普通代理 2：全站代理',
  `create_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`relation_type`,`relation_id`),
  UNIQUE KEY `token_uindex` (`token`),
  UNIQUE KEY `user_link_index` (`relation_id`,`relation_type`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `link`
--

LOCK TABLES `link` WRITE;
/*!40000 ALTER TABLE `link` DISABLE KEYS */;
INSERT INTO `link` VALUES (1,1,'user',1,'E799AF06','',1,0,0,1672658763),(2,2,'goods',1,'A338E26E','',1,0,0,1686838859),(6,2,'user',2,'336FD52E','',1,0,0,1687789224);
/*!40000 ALTER TABLE `link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `business_type` varchar(20) NOT NULL DEFAULT '' COMMENT '业务类型',
  `content` text NOT NULL COMMENT '内容',
  `ua` varchar(255) NOT NULL DEFAULT '',
  `uri` varchar(255) NOT NULL DEFAULT '',
  `create_at` int(10) unsigned NOT NULL COMMENT '记录时间',
  `create_ip` varchar(15) NOT NULL DEFAULT '' COMMENT 'ip',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log`
--

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
/*!40000 ALTER TABLE `log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `merchant_log`
--

DROP TABLE IF EXISTS `merchant_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `merchant_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ip` char(15) NOT NULL DEFAULT '' COMMENT '操作者IP地址',
  `node` char(200) NOT NULL DEFAULT '' COMMENT '当前操作节点',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '操作人用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `action` varchar(200) NOT NULL DEFAULT '' COMMENT '操作行为',
  `content` text NOT NULL COMMENT '操作内容描述',
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='系统操作日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `merchant_log`
--

LOCK TABLES `merchant_log` WRITE;
/*!40000 ALTER TABLE `merchant_log` DISABLE KEYS */;
INSERT INTO `merchant_log` VALUES (1,'117.176.187.158','merchant/goodscategory/add',1,'ceshi01','添加商品分类成功','添加商品分类成功，ID:1，名称:商品1','2023-01-02 11:32:12'),(2,'223.96.57.65','index/user/dologin',2,'gskvskwgwu','登录成功','登录成功','2023-06-15 14:19:44'),(3,'223.96.57.65','merchant/goodscategory/add',2,'gskvskwgwu','添加商品分类成功','添加商品分类成功，ID:2，名称:66','2023-06-15 14:20:16'),(4,'223.96.57.65','merchant/goods/add',2,'gskvskwgwu','添加商品成功','添加商品成功，商品ID:1,名称:10000,价格:10000','2023-06-15 14:21:01'),(5,'223.96.57.65','merchant/goodscard/add',2,'gskvskwgwu','成功添加卡密','成功添加1张卡密','2023-06-15 14:21:17'),(6,'223.96.61.178','index/user/dologin',2,'gskvskwgwu','登录成功','登录成功','2023-06-26 14:18:35'),(7,'223.96.61.178','merchant/goodscard/add',2,'gskvskwgwu','成功添加卡密','成功添加1张卡密','2023-06-26 14:19:25'),(8,'223.96.61.178','merchant/goods/edit',2,'gskvskwgwu','编辑商品成功','编辑商品成功，商品ID:1','2023-06-26 14:21:08');
/*!40000 ALTER TABLE `merchant_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `from_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '0为管理员',
  `to_id` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(60) NOT NULL DEFAULT '',
  `content` varchar(1024) NOT NULL DEFAULT '',
  `status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '0未读  1已读',
  `create_at` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发送时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (1,0,2,'收到订单投诉','订单：FK2306152220CDWER已被买家投诉，请及时处理！',0,1686839221);
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `migration` (`migration`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nav`
--

DROP TABLE IF EXISTS `nav`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nav` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `pid` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '父id',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '名称',
  `node` varchar(200) NOT NULL DEFAULT '' COMMENT '节点代码',
  `icon` varchar(100) NOT NULL DEFAULT '' COMMENT '菜单图标',
  `url` varchar(400) NOT NULL DEFAULT '' COMMENT '链接',
  `params` varchar(500) DEFAULT '' COMMENT '链接参数',
  `target` varchar(20) NOT NULL DEFAULT '_self' COMMENT '链接打开方式',
  `sort` int(11) unsigned DEFAULT '0' COMMENT '菜单排序',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态(0:禁用,1:启用)',
  `create_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `index_system_menu_node` (`node`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='前台导航表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nav`
--

LOCK TABLES `nav` WRITE;
/*!40000 ALTER TABLE `nav` DISABLE KEYS */;
INSERT INTO `nav` VALUES (1,0,'网站首页','','','/','','0',9,1,0,'2018-03-23 09:20:50'),(2,0,'常见问题','','','/company/faq','','0',5,1,0,'2018-03-23 09:21:11'),(3,0,'联系我们','','','/company/contact','','0',6,1,0,'2018-03-23 09:21:35'),(4,0,'卡密查询','','','/orderquery','','0',8,1,0,'2018-03-23 09:22:09'),(13,0,'投诉进度','','','/complaintquery','','0',7,1,0,'2018-06-25 12:25:05');
/*!40000 ALTER TABLE `nav` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `open_config`
--

DROP TABLE IF EXISTS `open_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `open_config` (
  `x` varchar(200) NOT NULL,
  `j` text,
  PRIMARY KEY (`x`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `open_config`
--

LOCK TABLES `open_config` WRITE;
/*!40000 ALTER TABLE `open_config` DISABLE KEYS */;
INSERT INTO `open_config` VALUES ('web_name','open易支付'),('admin_user','admin'),('admin_pwd','admin'),('web_qq','2246039056'),('logo_url','/assets/images/logo.png'),('cron_key','123456'),('beian','open易支付·极致体验'),('wxtransfer_desc','商户结算'),('payer_show_name','商户结算'),('tenpay_api','0'),('alipay_api','0'),('ali_api_partner',''),('ali_api_seller_email',''),('ali_api_key',''),('ali_epay_api_url',''),('ali_epay_api_id',''),('ali_epay_api_key',''),('alipay_appid',''),('alipayrsaPublicKey',''),('ali_close_info','支付宝通道暂时维护'),('wx_close_info','微信通道暂时维护'),('ten_close_info','财付通通道暂时维护'),('qq_close_info','QQ钱包通道暂时维护'),('qqbz','open易支付QQ自动结算'),('wxbz','open易支付微信自动结算'),('alibz','open易支付支付宝自动结算'),('tenbz','open易支付财付通自动结算'),('local_domain','op.axiwl.cn'),('qqrate','97'),('alirate','97'),('wxrate','97'),('tenrate','97'),('settle_money','10'),('settle_rate','0.005'),('usermb_ys','success'),('adminmb_ys','success'),('sdtx_money_min','1'),('settle_fee_min','0.5'),('settle_fee_max','10'),('settle_open','0'),('yq_open','0'),('web_is','0'),('sdk_is','0'),('phb_open','0'),('price','1'),('qun','https://jq.qq.com/?_wv=1027&k=5w9Z0VV'),('submit',''),('sdk','/SDK/SDK.zip'),('api_tenpay_id',''),('api_tenpay_key',''),('ten_epay_api_url',''),('ten_epay_api_id',''),('ten_epay_api_key',''),('ali_app_id',''),('ali_merchant_private_key',''),('ali_public_key',''),('quicklogin','0'),('is_reg','1'),('login_is','0'),('is_payreg','1'),('logingg','Use these awesome forms to login or create new account in your project for free.'),('reggg','Use these awesome forms to login or create new account in your project for free.'),('reg_pid','10001'),('reg_price','1'),('verifytype','0'),('stype_1','1'),('stype_2','1'),('stype_3','0'),('stype_4','1'),('mail_cloud','0'),('mail_smtp','smtp.qq.com'),('mail_port','465'),('mail_name',''),('sms_appkey','123456'),('mail_pwd',''),('mail_apiuser',''),('mail_apikey',''),('CAPTCHA_ID','“极验”官网注册获取'),('template','default1'),('PRIVATE_KEY','“极验”官网注册获取'),('rsaPrivateKey',''),('wxpay_api','0'),('wx_api_appid',''),('wx_api_mchid',''),('wx_api_key',''),('wx_api_appsecret',''),('wx_epay_api_url',''),('wx_epay_api_id',''),('wx_epay_api_key',''),('wx_eshanghu_sub_mch_id',''),('wx_eshanghu_app_key',''),('wx_eshanghu_app_secret',''),('qqpay_api','0'),('qq_api_mchid',''),('qq_api_mchkey',''),('qq_epay_api_url',''),('qq_epay_api_id',''),('qq_epay_api_key',''),('goods_lj','刷单、小视频、直播、钓鱼'),('goods_ljtis','open易支付提醒您：该订单商品违反了平台允售商品协议，已被安全系统拦截，停止交易。'),('login_offtext','open易支付系统提醒您：管理员已开启商户登录维护模式，请稍后重试！'),('reg_offtext','open易支付系统提醒您：管理员已关闭商户在线申请功能，请稍后重试！'),('web_offtext','open易支付系统正在维护中，请稍后访问！'),('key_no','open易支付系统提醒您：您的商户密钥验证错误，请更正后重新下单！'),('user_no','open易支付系统提醒您：您的商户已被封禁，已禁止登录和支付操作，有问题请联系平台客服！'),('qqtz','0'),('mzf_id',''),('mzf_key',''),('h5_open','0'),('cdnurl','1'),('agreement','        <p>一、总则</p>\n        <p>1.1 open易支付的所有权和运营权归open易支付技术有限公司所有。</p>\n        <p>1.2 用户在注册之前，应当仔细阅读本协议，并同意遵守本协议后方可成为注册用户。一旦注册成功，则用户与open易支付之间自动形成协议关系，用户应当受本协议的约束。用户在使用特殊的服务或产品时，应当同意接受相关协议后方能使用。</p>\n        <p>1.3 本协议则可由open易支付随时更新，用户应当及时关注并同意本站不承担通知义务。本站的通知、公告、声明或其它类似内容是本协议的一部分。</p>\n        <p>二、服务内容</p>\n        <p>2.1 open易支付的具体内容由本站根据实际情况提供。</p>\n        <p>2.2 本站仅提供相关的网络服务，除此之外与相关网络服务有关的设备(如个人电脑、手机、及其他与接入互联网或移动网有关的装置)及所需的费用(如为接入互联网而支付的电话费及上网费、为使用移动网而支付的手机费)均应由用户自行负担。</p>\n        <p>三、用户账号 </p>\n        <p>3.1 经本站注册系统完成注册程序并通过身份认证的用户即成为正式用户，可以获得本站规定用户所应享有的一切权限；未经认证仅享有本站规定的部分会员权限。open易支付有权对会员的权限设计进行变更。</p>\n        <p>3.2 用户只能按照注册要求使用真实姓名，及身份证号注册。用户有义务保证密码和账号的安全，用户利用该密码和账号所进行的一切活动引起的任何损失或损害，由用户自行承担全部责任，本站不承担任何责任。如用户发现账号遭到未授权的使用或发生其他任何安全问题，应立即修改账号密码并妥善保管，如有必要，请通知本站。因黑客行为或用户的保管疏忽导致账号非法使用，本站不承担任何责任。</p>\n        <p>四、使用规则</p>\n        <p>4.1 遵守中华人民共和国相关法律法规，包括但不限于《中华人民共和国计算机信息系统安全保护条例》、《计算机软件保护条例》、《最高人民法院关于审理涉及计算机网络著作权纠纷案件适用法律若干问题的解释(法释[2004]1号)》、《全国人大常委会关于维护互联网安全的决定》、《互联网电子公告服务管理规定》、《互联网新闻信息服务管理规定》、《互联网著作权行政保护办法》和《信息网络传播权保护条例》等有关计算机互联网规定和知识产权的法律和法规、实施办法。 </p>\n        <p>4.2 用户对其自行发表、上传或传送的内容负全部责任，所有用户不得在本站任何页面发布、转载、传送含有下列内容之一的信息，否则本站有权自行处理并不通知用户：</p>\n		<p>(1)违反宪法确定的基本原则的；</p>\n		<p>(2)危害国家安全，泄漏国家机密，颠覆国家政权，破坏国家统一的；</p>\n		<p>(3)损害国家荣誉和利益的；</p>\n		<p>(4)煽动民族仇恨、民族歧视，破坏民族团结的；</p>\n		<p>(5)破坏国家宗教政策，宣扬邪教和封建迷信的；</p>\n		<p>(6)散布谣言，扰乱社会秩序，破坏社会稳定的；</p>\n		<p>(7)散布淫秽、色情、赌博、暴力、恐怖或者教唆犯罪的；</p>\n		<p>(8)侮辱或者诽谤他人，侵害他人合法权益的；</p>\n		<p>(9)煽动非法集会、结社、游行、示威、聚众扰乱社会秩序的；</p>\n		<p>(10)以非法民间组织名义活动的；</p>\n		<p>(11)含有法律、行政法规禁止的其他内容的。</p>\n		<p>(12)禁止未获授权的商户接入(如 私服、小说、影视等)。</p>\n        <p>4.3 用户承诺对其发表或者上传于本站的所有信息(即属于《中华人民共和国著作权法》规定的作品，包括但不限于文字、图片、音乐、电影、表演和录音录像制品和电脑程序等)均享有完整的知识产权，或者已经得到相关权利人的合法授权；如用户违反本条规定造成本站被第三人索赔的，用户应全额补偿本站一切费用(包括但不限于各种赔偿费、诉讼代理费及为此支出的其它合理费用)； </p>\n        <p>4.4 当第三方认为用户发表或者上传于本站的信息侵犯其权利，并根据《信息网络传播权保护条例》或者相关法律规定向本站发送权利通知书时，用户同意本站可以自行判断决定删除涉嫌侵权信息，除非用户提交书面证据材料排除侵权的可能性，本站将不会自动恢复上述删除的信息；</p>\n        <p>(1)不得为任何非法目的而使用网络服务系统；</p>\n        <p>(2)遵守所有与网络服务有关的网络协议、规定和程序； </p>\n        <p>(3)不得利用本站进行任何可能对互联网的正常运转造成不利影响的行为；</p>\n        <p>(4)不得利用本站进行任何不利于本站的行为。</p>\n        <p>4.5 如用户在使用网络服务时违反上述任何规定，本站有权要求用户改正或直接采取一切必要的措施(包括但不限于删除用户张贴的内容、暂停或终止用户使用网络服务的权利)以减轻用户不当行为而造成的影响。</p>\n        <p>五、隐私保护</p>\n        <p>5.1 本站不对外公开或向第三方提供单个用户的注册资料及用户在使用网络服务时存储在本站的非公开内容，但下列情况除外：</p>\n        <p>(1)事先获得用户的明确授权；</p>\n        <p>(2)根据有关的法律法规要求； </p>\n        <p>(3)按照相关政府主管部门的要求；</p>\n        <p>(4)为维护社会公众的利益。</p>\n        <p>5.2 本站可能会与第三方合作向用户提供相关的网络服务，在此情况下，如该第三方同意承担与本站同等的保护用户隐私的责任，则本站有权将用户的注册资料等提供给该第三方。</p>\n        <p>5.3 在不透露单个用户隐私资料的前提下，本站有权对整个用户数据库进行分析并对用户数据库进行商业上的利用。</p>\n        <p>六、版权声明</p>\n        <p>6.1 本站的文字、图片、音频、视频等版权均归open易支付技术有限公司享有或与作者共同享有，未经本站许可，不得任意转载。</p>\n        <p>6.2 本站特有的标识、版面设计、编排方式等版权均属open易支付技术有限公司享有，未经本站许可，不得任意复制或转载。</p>\n        <p>6.3 使用本站的任何内容均应注明“来源于open易支付”及署上作者姓名，按法律规定需要支付稿酬的，应当通知本站及作者及支付稿酬，并独立承担一切法律责任。</p>\n        <p>6.4 本站享有所有作品用于其它用途的优先权，包括但不限于网站、电子杂志、平面出版等，但在使用前会通知作者，并按同行业的标准支付稿酬。 </p>\n        <p>6.5 本站所有内容仅代表作者自己的立场和观点，与本站无关，由作者本人承担一切法律责任。 </p>\n        <p>6.6 恶意转载本站内容的，本站保留将其诉诸法律的权利。 </p>\n        <p>七、责任声明 </p>\n        <p>7.1 用户明确同意其使用本站网络服务所存在的风险及一切后果将完全由用户本人承担，open易支付对此不承担任何责任。 </p>\n        <p>7.2 本站无法保证网络服务一定能满足用户的要求，也不保证网络服务的及时性、安全性、准确性。 </p>\n        <p>7.3 本站不保证为方便用户而设置的外部链接的准确性和完整性，同时，对于该等外部链接指向的不由本站实际控制的任何网页上的内容，本站不承担任何责任。</p>\n        <p>7.4 对于因不可抗力或本站不能控制的原因造成的网络服务中断或其它缺陷，本站不承担任何责任，但将尽力减少因此而给用户造成的损失和影响。 </p>\n        <p>7.5 对于站向用户提供的下列产品或者服务的质量缺陷本身及其引发的任何损失，本站无需承担任何责任： </p>\n        <p>(1)本站向用户免费提供的各项网络服务； </p>\n        <p>(2)本站向用户赠送的任何产品或者服务。 </p>\n        <p>7.6 本站有权于任何时间暂时或永久修改或终止本服务(或其任何部分)，而无论其通知与否，本站对用户和任何第三人均无需承担任何责任。 </p>\n        <p>八、附则</p>\n        <p>8.1 本协议的订立、执行和解释及争议的解决均应适用中华人民共和国法律。 </p>\n        <p>8.2 如本协议中的任何条款无论因何种原因完全或部分无效或不具有执行力，本协议的其余条款仍应有效并且有约束力。 </p>\n        <p>8.3 本协议解释权及修订权归open易支付技术有限公司所有。 open易支付系统官方QQ交流群：733140639</p>'),('shqh','728026829');
/*!40000 ALTER TABLE `open_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `open_gg`
--

DROP TABLE IF EXISTS `open_gg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `open_gg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `nr` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `open_gg`
--

LOCK TABLES `open_gg` WRITE;
/*!40000 ALTER TABLE `open_gg` DISABLE KEYS */;
INSERT INTO `open_gg` VALUES (1,'open易支付系统','欢迎使用open易支付程序，此处为广告内容，管理员请修改，支持html！','www.pxula.cn'),(2,'open易支付系统','欢迎使用open易支付程序，此处为广告内容，管理员请修改，支持html！','www.pxula.cn'),(3,'open易支付系统','欢迎使用open易支付程序，此处为广告内容，管理员请修改，支持html！','www.pxula.cn');
/*!40000 ALTER TABLE `open_gg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `open_shjk`
--

DROP TABLE IF EXISTS `open_shjk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `open_shjk` (
  `id` int(11) NOT NULL,
  `fl` varchar(32) NOT NULL,
  `money` decimal(10,2) NOT NULL,
  `addmoney` varchar(32) NOT NULL,
  `time` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `open_shjk`
--

LOCK TABLES `open_shjk` WRITE;
/*!40000 ALTER TABLE `open_shjk` DISABLE KEYS */;
/*!40000 ALTER TABLE `open_shjk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `goods_id` int(10) unsigned NOT NULL,
  `trade_no` varchar(255) DEFAULT NULL,
  `transaction_id` varchar(60) NOT NULL DEFAULT '' COMMENT '流水号',
  `paytype` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `channel_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '支付渠道',
  `channel_account_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '渠道账号',
  `goods_name` varchar(500) NOT NULL DEFAULT '' COMMENT '商品名称',
  `goods_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '商品单价',
  `goods_cost_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '成本价',
  `quantity` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '数量',
  `coupon_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否使用优惠券',
  `coupon_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '优惠券ID',
  `coupon_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '优惠价格',
  `total_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '总价（买家实付款）',
  `total_cost_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '总成本价',
  `sold_notify` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '售出通知（买家）',
  `take_card_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否需要取卡密码',
  `take_card_password` varchar(20) NOT NULL DEFAULT '' COMMENT '取卡密码',
  `contact` varchar(20) NOT NULL DEFAULT '' COMMENT '联系方式',
  `email_notify` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否邮件通知',
  `email` varchar(60) NOT NULL DEFAULT '' COMMENT '邮箱号',
  `sms_notify` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否短信通知',
  `rate` decimal(10,4) unsigned NOT NULL DEFAULT '0.0000' COMMENT '手续费率',
  `fee` decimal(10,3) unsigned NOT NULL DEFAULT '0.000' COMMENT '手续费',
  `sms_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '短信费',
  `status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '订单状态 0未支付 1已支付 2已关闭',
  `is_freeze` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '冻结状态',
  `create_at` int(10) unsigned NOT NULL COMMENT '创建时间',
  `create_ip` varchar(15) NOT NULL DEFAULT '' COMMENT 'IP',
  `success_at` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '支付成功时间',
  `first_query` tinyint(4) NOT NULL DEFAULT '0' COMMENT '订单第一次查询无需验证码',
  `sms_payer` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '短信付费方：0买家 1商户',
  `total_product_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '商品总价（不含短信费）',
  `sendout` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '已发货数量',
  `fee_payer` tinyint(4) NOT NULL DEFAULT '1' COMMENT '订单手续费支付方，1：商家承担，2买家承担',
  `settlement_type` tinyint(4) unsigned NOT NULL DEFAULT '1' COMMENT '结算方式，1:T1结算，0:T0结算',
  `finally_money` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '商户订单最终收入（已扣除短信费，手续费）',
  `is_proxy` tinyint(4) NOT NULL DEFAULT '0',
  `proxy_id` int(11) NOT NULL DEFAULT '0' COMMENT '代理的商品ID',
  `proxy_parent_user_id` int(11) NOT NULL DEFAULT '0' COMMENT '上级商家user_id',
  `proxy_finally_money` decimal(10,4) NOT NULL DEFAULT '0.0000',
  `select_cards` varchar(500) DEFAULT NULL,
  `is_cross` tinyint(4) DEFAULT '0',
  `cross_id` int(11) DEFAULT '0',
  `cross_params` varchar(255) DEFAULT NULL,
  `cross_orderid` varchar(255) DEFAULT NULL,
  `is_punish` int(11) DEFAULT '0',
  `selectcard_fee_platform` decimal(10,2) DEFAULT '0.00',
  `selectcard_fee_merchant` decimal(10,2) DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `order_create_at_index` (`create_at`),
  KEY `index_contract` (`contact`,`status`) USING BTREE,
  KEY `index_tp_count` (`user_id`,`status`,`success_at`,`channel_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `goods_id` (`goods_id`) USING BTREE,
  KEY `trade_no` (`trade_no`) USING BTREE,
  KEY `channel_id` (`channel_id`) USING BTREE,
  KEY `status` (`status`) USING BTREE,
  KEY `is_freeze` (`is_freeze`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (1,2,1,'FK2306152220CDWER','',3,7,1,'10000',10000.00,0.00,1,0,0,0.00,10000.00,0.00,0,0,'','hvsigeisfdi',0,'',0,0.0000,0.040,0.00,1,0,1686839115,'223.96.57.65',1686839138,1,0,10000.00,1,1,1,9999.9600,0,0,0,0.0000,'',0,0,NULL,NULL,0,0.00,0.00),(2,2,1,'FK2306262280YMPLW','',3,7,1,'10000',10000.00,0.00,1,0,0,0.00,10000.00,0.00,0,0,'','886886',0,'',0,0.0000,0.040,0.00,0,0,1687789243,'223.96.61.178',0,0,0,10000.00,0,1,1,0.0000,0,0,0,0.0000,'',0,0,NULL,NULL,0,0.00,0.00),(3,2,1,'FK2306262280OS5Y1','',3,7,1,'10000',100.00,0.00,1,0,0,0.00,100.00,0.00,0,0,'','886886',0,'',0,0.0000,0.040,0.00,0,0,1687789291,'223.96.61.178',0,0,0,100.00,0,1,1,0.0000,0,0,0,0.0000,'',0,0,NULL,NULL,0,0.00,0.00);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_api`
--

DROP TABLE IF EXISTS `order_api`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_api` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `trade_no` varchar(255) DEFAULT NULL,
  `transaction_id` varchar(255) DEFAULT NULL,
  `goods_name` varchar(100) DEFAULT NULL,
  `paytype` int(11) DEFAULT NULL,
  `channel_id` int(11) DEFAULT NULL,
  `channel_account_id` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '0' COMMENT '1已支付  2取消  3退款',
  `create_at` int(11) DEFAULT NULL,
  `success_at` int(11) DEFAULT NULL,
  `total_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `rate` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '手续费率',
  `fee` decimal(10,3) NOT NULL DEFAULT '0.000',
  `finally_money` decimal(10,4) NOT NULL DEFAULT '0.0000',
  `out_trade_no` varchar(255) DEFAULT NULL,
  `notify_url` varchar(255) DEFAULT NULL,
  `return_url` varchar(255) DEFAULT NULL,
  `repost_count` int(10) DEFAULT '0' COMMENT '回调次数',
  `type_name` varchar(255) DEFAULT NULL,
  `notify_status` tinyint(4) DEFAULT '0',
  `last_reissue_time` int(11) DEFAULT '0',
  `settlement_type` tinyint(4) DEFAULT '1' COMMENT '结算方式，1:T1结算，0:T0结算',
  `sitename` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_api`
--

LOCK TABLES `order_api` WRITE;
/*!40000 ALTER TABLE `order_api` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_api` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_card`
--

DROP TABLE IF EXISTS `order_card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_card` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned NOT NULL,
  `number` text,
  `secret` text,
  `card_id` int(10) NOT NULL DEFAULT '0' COMMENT '虚拟卡ID',
  PRIMARY KEY (`id`),
  KEY `order_card_order_id_index` (`order_id`),
  KEY `order_card_card_id_index` (`card_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_card`
--

LOCK TABLES `order_card` WRITE;
/*!40000 ALTER TABLE `order_card` DISABLE KEYS */;
INSERT INTO `order_card` VALUES (1,1,'123456','',1);
/*!40000 ALTER TABLE `order_card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_master`
--

DROP TABLE IF EXISTS `order_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_master` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trade_no` varchar(255) DEFAULT NULL,
  `model` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `trade_no` (`trade_no`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_master`
--

LOCK TABLES `order_master` WRITE;
/*!40000 ALTER TABLE `order_master` DISABLE KEYS */;
INSERT INTO `order_master` VALUES (1,'FK2306152220CDWER','Order'),(2,'FK2306262280YMPLW','Order'),(3,'FK2306262280OS5Y1','Order');
/*!40000 ALTER TABLE `order_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_query_history`
--

DROP TABLE IF EXISTS `order_query_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_query_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(255) DEFAULT NULL,
  `create_at` int(11) DEFAULT NULL,
  `query_content` varchar(255) DEFAULT NULL,
  `query_type` tinyint(4) DEFAULT '0' COMMENT '0订单号  1联系方式',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_query_history`
--

LOCK TABLES `order_query_history` WRITE;
/*!40000 ALTER TABLE `order_query_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_query_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `panel_log`
--

DROP TABLE IF EXISTS `panel_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `panel_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `date` datetime NOT NULL,
  `city` varchar(20) DEFAULT NULL,
  `data` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `panel_log`
--

LOCK TABLES `panel_log` WRITE;
/*!40000 ALTER TABLE `panel_log` DISABLE KEYS */;
INSERT INTO `panel_log` VALUES (1,1,'登录系统后台','2019-09-21 21:37:40',NULL,'39.130.48.42'),(2,1,'登录系统后台','2023-05-20 23:34:01',NULL,'223.96.63.21'),(3,1,'登录系统后台','2023-05-20 23:37:07',NULL,'223.96.63.21');
/*!40000 ALTER TABLE `panel_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `panel_user`
--

DROP TABLE IF EXISTS `panel_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `panel_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(32) NOT NULL,
  `user` varchar(32) NOT NULL,
  `pwd` varchar(32) NOT NULL,
  `email` varchar(32) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `name` varchar(10) DEFAULT NULL,
  `regtime` datetime DEFAULT NULL,
  `logtime` datetime DEFAULT NULL,
  `level` int(1) NOT NULL DEFAULT '1',
  `type` int(1) NOT NULL DEFAULT '0',
  `active` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `panel_user`
--

LOCK TABLES `panel_user` WRITE;
/*!40000 ALTER TABLE `panel_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `panel_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pay_alipayrisk`
--

DROP TABLE IF EXISTS `pay_alipayrisk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pay_alipayrisk` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel` int(10) unsigned NOT NULL,
  `pid` varchar(40) NOT NULL,
  `smid` varchar(40) DEFAULT NULL,
  `tradeNos` varchar(40) DEFAULT NULL,
  `risktype` varchar(40) DEFAULT NULL,
  `risklevel` varchar(60) DEFAULT NULL,
  `riskDesc` varchar(500) DEFAULT NULL,
  `complainTime` varchar(128) DEFAULT NULL,
  `complainText` varchar(500) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `process_code` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pay_alipayrisk`
--

LOCK TABLES `pay_alipayrisk` WRITE;
/*!40000 ALTER TABLE `pay_alipayrisk` DISABLE KEYS */;
/*!40000 ALTER TABLE `pay_alipayrisk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pay_alisettle`
--

DROP TABLE IF EXISTS `pay_alisettle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pay_alisettle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL,
  `out_trade_no` varchar(32) NOT NULL,
  `username` varchar(10) NOT NULL,
  `account` varchar(32) NOT NULL,
  `money` decimal(10,2) NOT NULL,
  `bz` varchar(32) NOT NULL,
  `time` datetime NOT NULL,
  `status` int(1) NOT NULL DEFAULT '0',
  `transfer_status` int(1) NOT NULL DEFAULT '0',
  `transfer_result` varchar(64) NOT NULL,
  `transfer_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pay_alisettle`
--

LOCK TABLES `pay_alisettle` WRITE;
/*!40000 ALTER TABLE `pay_alisettle` DISABLE KEYS */;
/*!40000 ALTER TABLE `pay_alisettle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pay_anounce`
--

DROP TABLE IF EXISTS `pay_anounce`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pay_anounce` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `content` text,
  `color` varchar(10) DEFAULT NULL,
  `sort` int(11) NOT NULL DEFAULT '1',
  `addtime` datetime DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pay_anounce`
--

LOCK TABLES `pay_anounce` WRITE;
/*!40000 ALTER TABLE `pay_anounce` DISABLE KEYS */;
/*!40000 ALTER TABLE `pay_anounce` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pay_batch`
--

DROP TABLE IF EXISTS `pay_batch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pay_batch` (
  `batch` varchar(20) NOT NULL,
  `allmoney` decimal(10,2) NOT NULL,
  `count` int(11) NOT NULL DEFAULT '0',
  `time` datetime DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`batch`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pay_batch`
--

LOCK TABLES `pay_batch` WRITE;
/*!40000 ALTER TABLE `pay_batch` DISABLE KEYS */;
/*!40000 ALTER TABLE `pay_batch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pay_cache`
--

DROP TABLE IF EXISTS `pay_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pay_cache` (
  `k` varchar(32) NOT NULL,
  `v` longtext,
  `expire` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`k`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pay_cache`
--

LOCK TABLES `pay_cache` WRITE;
/*!40000 ALTER TABLE `pay_cache` DISABLE KEYS */;
INSERT INTO `pay_cache` VALUES ('config','a:58:{s:12:\"admin_paypwd\";s:6:\"123456\";s:9:\"admin_pwd\";s:6:\"123456\";s:10:\"admin_user\";s:5:\"admin\";s:10:\"blockalert\";s:72:\"温馨提醒该商品禁止出售，如有疑问请联系网站客服！\";s:9:\"blockname\";s:18:\"云盘|网盘|Q币\";s:5:\"build\";s:10:\"2023-05-21\";s:10:\"captcha_id\";s:0:\"\";s:11:\"captcha_key\";s:0:\"\";s:12:\"captcha_open\";s:1:\"1\";s:7:\"cronkey\";s:6:\"891934\";s:11:\"description\";s:242:\"聚合易支付是XX公司旗下的免签约支付产品，完美解决支付难题，一站式接入支付宝，微信，财付通，QQ钱包,微信wap，帮助开发者快速集成到自己相应产品，效率高，见效快，费率低！\";s:8:\"homepage\";s:1:\"0\";s:8:\"keywords\";s:121:\"聚合易支付,支付宝免签约即时到账,财付通免签约,微信免签约支付,QQ钱包免签约,免签约支付\";s:4:\"kfqq\";s:9:\"123456789\";s:12:\"login_alipay\";s:1:\"0\";s:20:\"login_alipay_channel\";s:1:\"0\";s:8:\"login_qq\";s:1:\"0\";s:8:\"login_wx\";s:1:\"0\";s:16:\"login_wx_channel\";s:1:\"0\";s:10:\"mail_cloud\";s:1:\"0\";s:9:\"mail_name\";s:0:\"\";s:9:\"mail_port\";s:3:\"465\";s:8:\"mail_pwd\";s:0:\"\";s:9:\"mail_smtp\";s:11:\"smtp.qq.com\";s:15:\"notifyordername\";s:1:\"1\";s:7:\"onecode\";s:1:\"1\";s:7:\"orgname\";s:8:\"XX公司\";s:13:\"pageordername\";s:1:\"1\";s:12:\"pay_maxmoney\";s:4:\"1000\";s:8:\"recharge\";s:1:\"1\";s:8:\"reg_open\";s:1:\"1\";s:7:\"reg_pay\";s:1:\"1\";s:13:\"reg_pay_price\";s:1:\"5\";s:11:\"reg_pay_uid\";s:4:\"1000\";s:13:\"settle_alipay\";s:1:\"1\";s:11:\"settle_bank\";s:1:\"0\";s:14:\"settle_fee_max\";s:2:\"20\";s:14:\"settle_fee_min\";s:3:\"0.1\";s:12:\"settle_money\";s:2:\"30\";s:11:\"settle_open\";s:1:\"1\";s:12:\"settle_qqpay\";s:1:\"1\";s:11:\"settle_rate\";s:3:\"0.5\";s:11:\"settle_type\";s:1:\"1\";s:12:\"settle_wxpay\";s:1:\"1\";s:8:\"sitename\";s:15:\"聚合易支付\";s:7:\"sms_api\";s:1:\"0\";s:6:\"syskey\";s:32:\"A7mAW7wMGZ8Cg98vmmvAjGaNmSS0cG00\";s:8:\"template\";s:6:\"index1\";s:9:\"test_open\";s:1:\"1\";s:12:\"test_pay_uid\";s:4:\"1000\";s:5:\"title\";s:54:\"聚合易支付 - 行业领先的免签约支付平台\";s:15:\"transfer_alipay\";s:1:\"0\";s:13:\"transfer_desc\";s:27:\"聚合易支付自动结算\";s:13:\"transfer_name\";s:15:\"聚合易支付\";s:14:\"transfer_qqpay\";s:1:\"0\";s:14:\"transfer_wxpay\";s:1:\"0\";s:10:\"verifytype\";s:1:\"1\";s:7:\"version\";s:4:\"2027\";}',0),('tongji','a:3:{s:9:\"usermoney\";N;s:11:\"settlemoney\";N;s:11:\"order_today\";a:3:{s:3:\"all\";d:0;s:7:\"paytype\";a:3:{i:1;d:0;i:2;d:0;i:3;d:0;}s:7:\"channel\";N;}}',0);
/*!40000 ALTER TABLE `pay_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pay_channel`
--

DROP TABLE IF EXISTS `pay_channel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pay_channel` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mode` int(1) DEFAULT '0',
  `type` int(11) unsigned NOT NULL,
  `plugin` varchar(30) NOT NULL,
  `name` varchar(30) NOT NULL,
  `rate` decimal(5,2) NOT NULL DEFAULT '100.00',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `appid` varchar(255) DEFAULT NULL,
  `appkey` text,
  `appsecret` text,
  `appurl` varchar(255) DEFAULT NULL,
  `appmchid` varchar(255) DEFAULT NULL,
  `apptype` varchar(50) DEFAULT NULL,
  `daytop` int(10) DEFAULT '0',
  `daystatus` int(1) DEFAULT '0',
  `paymin` varchar(10) DEFAULT NULL,
  `paymax` varchar(10) DEFAULT NULL,
  `appwxmp` int(11) DEFAULT NULL,
  `appwxa` int(11) DEFAULT NULL,
  `appswitch` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pay_channel`
--

LOCK TABLES `pay_channel` WRITE;
/*!40000 ALTER TABLE `pay_channel` DISABLE KEYS */;
INSERT INTO `pay_channel` VALUES (1,0,2,'adapay','000',0.00,0,NULL,NULL,NULL,NULL,NULL,NULL,999,0,'','999999',0,0,0),(2,0,2,'epay','000p',0.00,0,NULL,NULL,NULL,NULL,NULL,NULL,999,0,'','999999',NULL,NULL,NULL);
/*!40000 ALTER TABLE `pay_channel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pay_config`
--

DROP TABLE IF EXISTS `pay_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pay_config` (
  `k` varchar(32) NOT NULL,
  `v` text,
  PRIMARY KEY (`k`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pay_config`
--

LOCK TABLES `pay_config` WRITE;
/*!40000 ALTER TABLE `pay_config` DISABLE KEYS */;
INSERT INTO `pay_config` VALUES ('admin_paypwd','123456'),('admin_pwd','123456'),('admin_user','admin'),('blockalert','温馨提醒该商品禁止出售，如有疑问请联系网站客服！'),('blockname','云盘|网盘|Q币'),('build','2023-05-21'),('captcha_id',''),('captcha_key',''),('captcha_open','1'),('cronkey','891934'),('description','聚合易支付是XX公司旗下的免签约支付产品，完美解决支付难题，一站式接入支付宝，微信，财付通，QQ钱包,微信wap，帮助开发者快速集成到自己相应产品，效率高，见效快，费率低！'),('homepage','0'),('keywords','聚合易支付,支付宝免签约即时到账,财付通免签约,微信免签约支付,QQ钱包免签约,免签约支付'),('kfqq','123456789'),('login_alipay','0'),('login_alipay_channel','0'),('login_qq','0'),('login_wx','0'),('login_wx_channel','0'),('mail_cloud','0'),('mail_name',''),('mail_port','465'),('mail_pwd',''),('mail_smtp','smtp.qq.com'),('notifyordername','1'),('onecode','1'),('orgname','XX公司'),('pageordername','1'),('pay_maxmoney','1000'),('recharge','1'),('reg_open','1'),('reg_pay','1'),('reg_pay_price','5'),('reg_pay_uid','1000'),('settle_alipay','1'),('settle_bank','0'),('settle_fee_max','20'),('settle_fee_min','0.1'),('settle_money','30'),('settle_open','1'),('settle_qqpay','1'),('settle_rate','0.5'),('settle_type','1'),('settle_wxpay','1'),('sitename','聚合易支付'),('sms_api','0'),('syskey','A7mAW7wMGZ8Cg98vmmvAjGaNmSS0cG00'),('template','index1'),('test_open','1'),('test_pay_uid','1000'),('title','聚合易支付 - 行业领先的免签约支付平台'),('tongji_cachetime','1684605390'),('transfer_alipay','0'),('transfer_desc','聚合易支付自动结算'),('transfer_name','聚合易支付'),('transfer_qqpay','0'),('transfer_wxpay','0'),('verifytype','1'),('version','2027');
/*!40000 ALTER TABLE `pay_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pay_dmf`
--

DROP TABLE IF EXISTS `pay_dmf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pay_dmf` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0',
  `f2fid` varchar(32) NOT NULL,
  `f2fkey` varchar(688) NOT NULL,
  `f2fpublic` varchar(1688) NOT NULL,
  `beizhu` varchar(32) DEFAULT NULL COMMENT '备注',
  `nums` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `addtime` datetime DEFAULT NULL COMMENT '添加时间',
  `status` int(1) NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pay_dmf`
--

LOCK TABLES `pay_dmf` WRITE;
/*!40000 ALTER TABLE `pay_dmf` DISABLE KEYS */;
/*!40000 ALTER TABLE `pay_dmf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pay_domain`
--

DROP TABLE IF EXISTS `pay_domain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pay_domain` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `domain` varchar(128) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `addtime` datetime DEFAULT NULL,
  `endtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `domain` (`domain`,`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pay_domain`
--

LOCK TABLES `pay_domain` WRITE;
/*!40000 ALTER TABLE `pay_domain` DISABLE KEYS */;
/*!40000 ALTER TABLE `pay_domain` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pay_down`
--

DROP TABLE IF EXISTS `pay_down`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pay_down` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(18) NOT NULL,
  `url` varchar(88) NOT NULL,
  `readme` varchar(88) NOT NULL,
  `addtime` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pay_down`
--

LOCK TABLES `pay_down` WRITE;
/*!40000 ALTER TABLE `pay_down` DISABLE KEYS */;
INSERT INTO `pay_down` VALUES (1,'对接文档','/doc/index.php','','2018-06-02'),(6,'VHMS 支付集成包','./down/4.zip','','2020-10-11'),(7,'码支付手机版监控','./down/pe.apk','','2020-10-11'),(8,'SDK下载PHP版','./down/SDK.zip','','2020-10-11'),(9,'swap 支付集成包','./down/3.zip','','2020-10-11');
/*!40000 ALTER TABLE `pay_down` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pay_gfg`
--

DROP TABLE IF EXISTS `pay_gfg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pay_gfg` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '排序',
  `pid` int(255) DEFAULT NULL COMMENT '商户PID',
  `mid` mediumtext COMMENT '收款账号MID',
  `username` mediumtext COMMENT '账号备注',
  `typec_id` mediumtext COMMENT '通道ID',
  `typec_name` mediumtext COMMENT '所属通道',
  `zhanghao` mediumtext COMMENT '通道账号',
  `ck` mediumtext COMMENT '通道CK数据',
  `bf` mediumtext COMMENT '通道备份数据',
  `bfbf` mediumtext COMMENT '通道备份数据',
  `bfbfbf` mediumtext COMMENT '通道备份数据',
  `type` mediumtext COMMENT '支付方式',
  `ms` mediumtext COMMENT '支付模式',
  `method` mediumtext COMMENT '回调方式',
  `bug_num` varchar(32) DEFAULT '0' COMMENT '异常次数',
  `bug_data` mediumtext COMMENT '异常原因',
  `time` bigint(20) DEFAULT NULL COMMENT '记录时间（10位）',
  `r_money` double DEFAULT NULL COMMENT '日限额',
  `z_money` double DEFAULT NULL COMMENT '总限额',
  `z_pay` double DEFAULT NULL COMMENT '总充值',
  `jr_pay` double DEFAULT NULL COMMENT '今日充值',
  `zr_pay` double DEFAULT NULL COMMENT '昨日充值',
  `ds_time` int(11) DEFAULT '0' COMMENT '限量配置_设定时间',
  `ds_type` int(11) DEFAULT '0' COMMENT '限量配置_限量模式',
  `ds_num` int(11) DEFAULT '0' COMMENT '限量配置_限量数量',
  `ds_status` int(11) DEFAULT '0' COMMENT '限量配置_限量状态',
  `create_date` bigint(20) DEFAULT NULL COMMENT '创建时间戳（10位）',
  `land_lx` int(11) DEFAULT '1' COMMENT '轮询状态',
  `state` int(11) DEFAULT '1' COMMENT '账号状态',
  `lastheart` varchar(32) DEFAULT '0' COMMENT '最后心跳',
  `jkstate` varchar(32) DEFAULT '0' COMMENT '监控端状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pay_gfg`
--

LOCK TABLES `pay_gfg` WRITE;
/*!40000 ALTER TABLE `pay_gfg` DISABLE KEYS */;
/*!40000 ALTER TABLE `pay_gfg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pay_gogao`
--

DROP TABLE IF EXISTS `pay_gogao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pay_gogao` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编码',
  `title` mediumtext COMMENT '标题',
  `text` mediumtext COMMENT '内容',
  `create_date` bigint(20) DEFAULT NULL COMMENT '发布时间戳（10位）',
  `state` int(11) DEFAULT '0' COMMENT '置顶',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pay_gogao`
--

LOCK TABLES `pay_gogao` WRITE;
/*!40000 ALTER TABLE `pay_gogao` DISABLE KEYS */;
INSERT INTO `pay_gogao` VALUES (1,'发起支付API默认对接文档','<p style=\"margin-top: 0px; margin-bottom: 0px; white-space: normal; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, Tahoma, Arial, sans-serif; font-size: 14px;\"><span style=\"background-color: rgb(255, 255, 255); color: rgb(255, 0, 0); font-size: 18px;\"><strong>发起支付API（POST/GET）：</strong></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; white-space: normal; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, Tahoma, Arial, sans-serif; font-size: 14px;\">&nbsp; &nbsp;&nbsp;</p><pre style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border-radius: 10px; background-color: rgb(43, 43, 43); -webkit-tap-highlight-color: rgba(0, 0, 0, 0); white-space: pre-wrap; overflow-wrap: break-word; color: rgb(169, 183, 198); font-family: &quot;Courier New&quot;; font-size: 13.5pt;\"><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 2em;\"><span style=\"font-size: 16px;\">&nbsp;&nbsp;支付请求地址：请登录平台后在对接接口信息处获取支付请求地址</span><br/></p></pre><p style=\"margin-top: 0px; margin-bottom: 0px; white-space: normal; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, Tahoma, Arial, sans-serif; font-size: 14px;\"><br/></p><p style=\"margin-top: 0px; margin-bottom: 0px; white-space: normal; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, Tahoma, Arial, sans-serif; font-size: 14px;\">请求参数如下：</p><p style=\"margin-top: 0px; margin-bottom: 0px; white-space: normal; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, Tahoma, Arial, sans-serif; font-size: 14px;\"><br/></p><table width=\"100%\"><tbody><tr class=\"firstRow\"><td style=\"padding: 0px; border-color: rgb(242, 242, 242); margin: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); word-break: break-all; background-color: rgb(216, 216, 216);\" width=\"131\" valign=\"top\"><p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 3em;\"><strong>&nbsp; &nbsp;字段名称</strong></p></td><td style=\"padding: 0px; border-color: rgb(242, 242, 242); margin: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); word-break: break-all; background-color: rgb(216, 216, 216);\" width=\"149\" valign=\"top\"><p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 3em;\"><strong>&nbsp; &nbsp;字段类型</strong></p></td><td style=\"padding: 0px; border-color: rgb(242, 242, 242); margin: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); word-break: break-all; background-color: rgb(216, 216, 216);\" width=\"55\" valign=\"top\"><p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 3em;\"><strong>&nbsp; &nbsp;必填</strong></p></td><td style=\"padding: 0px; border-color: rgb(242, 242, 242); margin: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); word-break: break-all; background-color: rgb(216, 216, 216);\" width=\"574\">&nbsp; &nbsp;<strong>字段说明</strong><br/></td></tr><tr><td style=\"padding: 0px; border-color: rgb(242, 242, 242); margin: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); word-break: break-all;\" width=\"138\" valign=\"top\"><p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 3em;\"><span style=\"color: rgb(127, 127, 127);\">&nbsp; api_id</span></p></td><td style=\"padding: 0px; border-color: rgb(242, 242, 242); margin: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); word-break: break-all;\" width=\"149\" valign=\"top\"><p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 3em;\"><span style=\"color: rgb(127, 127, 127);\">&nbsp; string</span></p></td><td style=\"padding: 0px; border-color: rgb(242, 242, 242); margin: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); word-break: break-all;\" width=\"55\" valign=\"top\"><p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 3em;\"><span style=\"color: rgb(127, 127, 127);\">&nbsp; 是</span></p></td><td style=\"padding: 0px; border-color: rgb(242, 242, 242); margin: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); word-break: break-all;\" width=\"574\" valign=\"top\"><p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 3em;\"><span style=\"color: rgb(127, 127, 127);\">&nbsp; 商户PID（商户后台获取）</span></p></td></tr><tr><td style=\"padding: 0px; border-color: rgb(242, 242, 242); margin: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); word-break: break-all;\" width=\"138\" valign=\"top\"><p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 3em;\"><span style=\"color: rgb(127, 127, 127);\">&nbsp; type</span></p></td><td style=\"padding: 0px; border-color: rgb(242, 242, 242); margin: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); word-break: break-all;\" width=\"149\" valign=\"top\"><p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 3em;\"><span style=\"color: rgb(127, 127, 127);\">&nbsp; string</span></p></td><td style=\"padding: 0px; border-color: rgb(242, 242, 242); margin: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); word-break: break-all;\" width=\"55\" valign=\"top\"><p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 3em;\"><span style=\"color: rgb(127, 127, 127);\">&nbsp; 否</span></p></td><td style=\"padding: 0px; border-color: rgb(242, 242, 242); margin: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); word-break: break-all;\" width=\"574\" valign=\"top\"><p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 3em;\"><span style=\"color: rgb(127, 127, 127);\">&nbsp; <span style=\"color: rgb(127, 127, 127);\">支付类型：</span><span style=\"color: rgb(127, 127, 127);\">alipay:支付宝,weixin:微信支付<span style=\"color: rgb(127, 127, 127);\">,qq:QQ支付</span></span></span></p></td></tr><tr><td style=\"padding: 0px; border-color: rgb(242, 242, 242); margin: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); word-break: break-all;\" width=\"138\" valign=\"top\"><p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 3em;\"><span style=\"color: rgb(127, 127, 127);\">&nbsp; record<br/></span></p></td><td style=\"padding: 0px; border-color: rgb(242, 242, 242); margin: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); word-break: break-all;\" width=\"149\" valign=\"top\"><p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 3em;\"><span style=\"color: rgb(127, 127, 127);\">&nbsp; string</span></p></td><td style=\"padding: 0px; border-color: rgb(242, 242, 242); margin: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); word-break: break-all;\" width=\"55\" valign=\"top\"><p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 3em;\"><span style=\"color: rgb(127, 127, 127);\">&nbsp; 是</span></p></td><td style=\"padding: 0px; border-color: rgb(242, 242, 242); margin: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); word-break: break-all;\" width=\"574\" valign=\"top\"><p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 3em;\"><span style=\"color: rgb(127, 127, 127);\">&nbsp; 附加参数（可传入您网站的订单号或用户名等唯一参数）</span></p></td></tr><tr><td style=\"padding: 0px; border-color: rgb(242, 242, 242); margin: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); word-break: break-all;\" width=\"138\" valign=\"top\"><p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 3em;\"><span style=\"color: rgb(127, 127, 127);\">&nbsp;&nbsp;money</span></p></td><td style=\"padding: 0px; border-color: rgb(242, 242, 242); margin: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); word-break: break-all;\" width=\"149\" valign=\"top\"><p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 3em;\"><span style=\"color: rgb(127, 127, 127);\">&nbsp; float（2）</span></p></td><td style=\"padding: 0px; border-color: rgb(242, 242, 242); margin: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); word-break: break-all;\" width=\"71\" valign=\"top\"><p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 3em;\"><span style=\"color: rgb(127, 127, 127);\">&nbsp; 是</span><br/></p></td><td style=\"padding: 0px; border-color: rgb(242, 242, 242); margin: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); word-break: break-all;\" width=\"574\" valign=\"top\"><p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 3em;\"><span style=\"color: rgb(127, 127, 127);\">&nbsp; 充值金额（注意：强制转换2位小数后提交）</span></p></td></tr><tr><td style=\"padding: 0px; border-color: rgb(242, 242, 242); margin: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); word-break: break-all;\" width=\"135\" valign=\"top\"><p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 3em;\"><span style=\"color: rgb(127, 127, 127);\">&nbsp; refer</span></p></td><td style=\"padding: 0px; border-color: rgb(242, 242, 242); margin: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); word-break: break-all;\" width=\"148\" valign=\"top\"><p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 3em;\"><span style=\"color: rgb(127, 127, 127);\">&nbsp; string</span></p></td><td style=\"padding: 0px; border-color: rgb(242, 242, 242); margin: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); word-break: break-all;\" width=\"55\" valign=\"top\"><p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 3em;\"><span style=\"color: rgb(127, 127, 127);\">&nbsp; 是</span></p></td><td style=\"padding: 0px; border-color: rgb(242, 242, 242); margin: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); word-break: break-all;\" width=\"574\" valign=\"top\"><p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 3em;\"><span style=\"color: rgb(127, 127, 127);\">&nbsp; 同步跳转网址（支付成功或支付超时后将跳转到此参数传递的网址）</span></p></td></tr><tr><td style=\"padding: 0px; border-color: rgb(242, 242, 242); margin: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); word-break: break-all;\" valign=\"top\"><p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 3em;\"><span style=\"color: rgb(127, 127, 127);\">&nbsp; notify</span></p></td><td style=\"padding: 0px; border-color: rgb(242, 242, 242); margin: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); word-break: break-all;\" valign=\"top\"><p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 3em;\"><span style=\"color: rgb(127, 127, 127);\">&nbsp; string</span></p></td><td style=\"padding: 0px; border-color: rgb(242, 242, 242); margin: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); word-break: break-all;\" valign=\"top\"><p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 3em;\"><span style=\"color: rgb(127, 127, 127);\">&nbsp; 是</span></p></td><td style=\"padding: 0px; border-color: rgb(242, 242, 242); margin: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); word-break: break-all;\" valign=\"top\"><p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 3em;\"><span style=\"color: rgb(127, 127, 127);\">&nbsp; 异步回调网址</span></p></td></tr><tr><td style=\"padding: 0px; border-color: rgb(242, 242, 242); margin: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); word-break: break-all;\" width=\"138\" valign=\"top\"><p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 3em;\"><span style=\"color: rgb(127, 127, 127);\">&nbsp; mid</span></p></td><td style=\"padding: 0px; border-color: rgb(242, 242, 242); margin: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); word-break: break-all;\" width=\"149\" valign=\"top\"><p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 3em;\"><span style=\"color: rgb(127, 127, 127);\">&nbsp; string</span></p></td><td style=\"padding: 0px; border-color: rgb(242, 242, 242); margin: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); word-break: break-all;\" width=\"55\" valign=\"top\"><p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 3em;\"><span style=\"color: rgb(127, 127, 127);\">&nbsp; 否</span></p></td><td style=\"padding: 0px; border-color: rgb(242, 242, 242); margin: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); word-break: break-all;\" width=\"574\" valign=\"top\"><p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 3em;\"><span style=\"color: rgb(127, 127, 127);\">&nbsp;&nbsp;收款账号MID（传入此参数指定收款账号，为空则随机轮询账号）</span></p></td></tr><tr><td style=\"padding: 0px; border-color: rgb(242, 242, 242); margin: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); word-break: break-all;\" width=\"138\" valign=\"top\"><p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 3em;\"><span style=\"color: rgb(127, 127, 127);\">&nbsp; sign</span></p></td><td style=\"padding: 0px; border-color: rgb(242, 242, 242); margin: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); word-break: break-all;\" width=\"149\" valign=\"top\"><p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 3em;\"><span style=\"color: rgb(127, 127, 127);\">&nbsp; string</span></p></td><td style=\"padding: 0px; border-color: rgb(242, 242, 242); margin: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); word-break: break-all;\" width=\"55\" valign=\"top\"><p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 3em;\"><span style=\"color: rgb(127, 127, 127);\">&nbsp; 是</span></p></td><td style=\"padding: 0px; border-color: rgb(242, 242, 242); margin: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); word-break: break-all;\" width=\"574\" valign=\"top\"><p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 3em;\"><span style=\"color: rgb(127, 127, 127);\">&nbsp; 数据签名（签名方法见下文）</span></p></td></tr></tbody></table><hr style=\"white-space: normal; height: 1px; margin: 10px 0px; border: 0px; clear: both; background-color: rgb(230, 230, 230); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, Tahoma, Arial, sans-serif; font-size: 14px;\"/><p style=\"margin-top: 0px; margin-bottom: 0px; white-space: normal; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, Tahoma, Arial, sans-serif; font-size: 14px;\"><span style=\"color: rgb(255, 0, 0); font-size: 18px;\"></span></p><p style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, 微软雅黑, Arial, sans-serif; margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); color: rgb(89, 89, 89); font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(255, 0, 0); font-size: 18px;\"><strong>异步通知API（POST/GET）：</strong></span><br/></p><p style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, 微软雅黑, Arial, sans-serif; margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); color: rgb(89, 89, 89); font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><br/></p><p style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, 微软雅黑, Arial, sans-serif; margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); color: rgb(89, 89, 89); font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">回调参数：</p><p style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, 微软雅黑, Arial, sans-serif; margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); color: rgb(89, 89, 89); font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><br/></p><table width=\"100%\"><tbody><tr class=\"firstRow\"><td style=\"margin: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); word-break: break-all; background-color: rgb(216, 216, 216); border-color: rgb(242, 242, 242);\" width=\"139\" valign=\"top\"><p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 3em;\"><strong>&nbsp; &nbsp;字段名称</strong></p></td><td style=\"margin: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); word-break: break-all; background-color: rgb(216, 216, 216); border-color: rgb(242, 242, 242);\" width=\"155\" valign=\"top\"><p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 3em;\"><strong>&nbsp; &nbsp;字段类型</strong></p></td><td style=\"margin: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); word-break: break-all; background-color: rgb(216, 216, 216); border-color: rgb(242, 242, 242);\" width=\"697\" valign=\"top\"><p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 3em;\"><strong>&nbsp; &nbsp;字段说明</strong></p></td></tr><tr><td style=\"margin: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); word-break: break-all; border-color: rgb(242, 242, 242);\" width=\"139\" valign=\"top\"><p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 3em;\"><span style=\"color: rgb(127, 127, 127);\">&nbsp; &nbsp;key</span></p></td><td style=\"margin: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); word-break: break-all; border-color: rgb(242, 242, 242);\" width=\"155\" valign=\"top\"><p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 3em;\"><span style=\"color: rgb(127, 127, 127);\">&nbsp; &nbsp;string</span></p></td><td style=\"margin: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); word-break: break-all; border-color: rgb(242, 242, 242);\" width=\"697\" valign=\"top\"><p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 3em;\"><span style=\"color: rgb(127, 127, 127);\">&nbsp; &nbsp;商户密匙KEY（由支付平台返回给回调地址判断）<br/></span></p></td></tr><tr><td style=\"margin: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); word-break: break-all; border-color: rgb(242, 242, 242);\" width=\"139\" valign=\"top\"><p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 3em;\"><span style=\"color: rgb(127, 127, 127);\">&nbsp; &nbsp;type</span></p></td><td style=\"margin: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); word-break: break-all; border-color: rgb(242, 242, 242);\" width=\"155\" valign=\"top\"><p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 3em;\"><span style=\"color: rgb(127, 127, 127);\">&nbsp; &nbsp;string</span></p></td><td style=\"margin: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); word-break: break-all; border-color: rgb(242, 242, 242);\" width=\"697\" valign=\"top\"><p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 3em;\"><span style=\"color: rgb(127, 127, 127);\">&nbsp; &nbsp;<span style=\"color: rgb(127, 127, 127);\">alipay:支付宝,weixin:微信支付</span></span></p></td></tr><tr><td style=\"margin: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); word-break: break-all; border-color: rgb(242, 242, 242);\" width=\"139\" valign=\"top\"><p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 3em;\"><span style=\"color: rgb(127, 127, 127);\">&nbsp; &nbsp;money</span></p></td><td style=\"margin: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); word-break: break-all; border-color: rgb(242, 242, 242);\" width=\"155\" valign=\"top\"><p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 3em;\"><span style=\"color: rgb(127, 127, 127);\">&nbsp; &nbsp;float（2）</span></p></td><td style=\"margin: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); word-break: break-all; border-color: rgb(242, 242, 242);\" width=\"697\" valign=\"top\"><p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 3em;\"><span style=\"color: rgb(127, 127, 127);\">&nbsp; &nbsp;金额（注意：php使用 sprintf(&quot;%.2f&quot;,金额)&nbsp; 接收此参数）</span></p></td></tr><tr><td style=\"margin: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); word-break: break-all; border-color: rgb(242, 242, 242);\" width=\"139\" valign=\"top\"><p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 3em;\"><span style=\"color: rgb(127, 127, 127);\">&nbsp; &nbsp;order</span></p></td><td style=\"margin: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); word-break: break-all; border-color: rgb(242, 242, 242);\" width=\"155\" valign=\"top\"><p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 3em;\"><span style=\"color: rgb(127, 127, 127);\">&nbsp; &nbsp;string</span></p></td><td style=\"margin: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); word-break: break-all; border-color: rgb(242, 242, 242);\" width=\"697\" valign=\"top\"><p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 3em;\"><span style=\"color: rgb(127, 127, 127);\">&nbsp; &nbsp;支付平台创建的云端订单号</span></p></td></tr><tr><td style=\"margin: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); word-break: break-all; border-color: rgb(242, 242, 242);\" width=\"139\" valign=\"top\"><p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 3em;\"><span style=\"color: rgb(127, 127, 127);\">&nbsp; &nbsp;record<br/></span></p></td><td style=\"margin: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); word-break: break-all; border-color: rgb(242, 242, 242);\" width=\"155\" valign=\"top\"><p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 3em;\"><span style=\"color: rgb(127, 127, 127);\">&nbsp; &nbsp;string</span></p></td><td style=\"margin: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); word-break: break-all; border-color: rgb(242, 242, 242);\" width=\"697\" valign=\"top\"><p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 3em;\"><span style=\"color: rgb(127, 127, 127);\">&nbsp; &nbsp;附加参数（发起支付传递的您网站的订单号或用户名等唯一参数）</span></p></td></tr><tr><td style=\"margin: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); word-break: break-all; border-color: rgb(242, 242, 242);\" width=\"139\" valign=\"top\"><p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 3em;\"><span style=\"color: rgb(127, 127, 127);\">&nbsp; &nbsp;sign</span></p></td><td style=\"margin: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); word-break: break-all; border-color: rgb(242, 242, 242);\" width=\"155\" valign=\"top\"><p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 3em;\"><span style=\"color: rgb(127, 127, 127);\">&nbsp; &nbsp;string</span></p></td><td style=\"margin: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); word-break: break-all; border-color: rgb(242, 242, 242);\" width=\"697\" valign=\"top\"><p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 3em;\"><span style=\"color: rgb(127, 127, 127);\">&nbsp; 数据签名（签名方法见下文）</span></p></td></tr></tbody></table><hr style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, 微软雅黑, Arial, sans-serif; height: 1px; margin: 10px 0px; border: 0px; clear: both; background-color: rgb(230, 230, 230); color: rgb(89, 89, 89); font-size: 14px; white-space: normal;\"/><p style=\"margin-top: 0px; margin-bottom: 0px; white-space: normal; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, Tahoma, Arial, sans-serif; font-size: 14px;\"><span style=\"color: rgb(255, 0, 0);\"><strong><span style=\"font-size: 18px;\">数据签名算法：</span></strong></span><br/></p><p style=\"margin-top: 0px; margin-bottom: 0px; white-space: normal; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, Tahoma, Arial, sans-serif; font-size: 14px;\"><span style=\"color: rgb(255, 0, 0);\"><strong><span style=\"font-size: 18px;\"><br/></span></strong></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; white-space: normal; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, Tahoma, Arial, sans-serif; font-size: 14px;\"><span style=\"color: rgb(255, 0, 0);\"><span style=\"font-size: 16px; color: rgb(0, 0, 0);\">php算法</span></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; white-space: normal; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, Tahoma, Arial, sans-serif; font-size: 14px;\"><span style=\"color: rgb(255, 0, 0);\"><span style=\"font-size: 16px; color: rgb(0, 0, 0);\"><br/></span></span></p><pre style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border-radius: 10px; background-color: rgb(43, 43, 43); -webkit-tap-highlight-color: rgba(0, 0, 0, 0); white-space: pre-wrap; overflow-wrap: break-word; color: rgb(169, 183, 198); font-family: &quot;Courier New&quot;; font-size: 13.5pt;\"><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: normal;\"><br/> &nbsp; $data = array(\n		&quot;pid&quot; =&gt; $api[&#39;pid&#39;],//商户ID\n		&quot;type&quot; =&gt; $api[&#39;type&#39;],//支付方式\n		&quot;record&quot;=&gt; $api[&#39;record&#39;],//附加参数\n		&quot;money&quot;	=&gt; $api[&#39;money&#39;],//付款金额\n		&quot;refer&quot; =&gt; $api[&#39;refer&#39;],//同步跳转地址\n		&quot;notify&quot; =&gt; $api[&#39;notify&#39;],//异步通知地址\n &nbsp; &nbsp;);\n &nbsp; &nbsp;ksort($api); //排序GET和POST参数\n &nbsp; &nbsp;reset($api); //内部指针指向数组中的第一个元素\n &nbsp; &nbsp;$sign = &#39;&#39;;//初始化\n &nbsp; &nbsp;foreach ($api AS $key =&gt; $val) { //遍历附加参数\n &nbsp; &nbsp;		if ($val == &#39;&#39; || $key == &#39;sign&#39;) continue; //跳过这些不签名\n &nbsp; &nbsp;		if ($sign) $sign .= &#39;&amp;&#39;; //第一个字符串签名不加&amp; 其他加&amp;连接起来参数\n &nbsp; &nbsp;		$sign .= &quot;$key=$val&quot;; //拼接为url参数形式\n &nbsp; &nbsp;}\n &nbsp; &nbsp;$sign_ok = md5($sign . 您的商户密匙KEY);//md5加密参数<br/><br/></p></pre>',1627399798,1),(2,'发起支付API易支付对接文档','<p style=\"margin-top: 0px; margin-bottom: 0px; white-space: normal; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, Tahoma, Arial, sans-serif; font-size: 14px;\"><span style=\"background-color: rgb(255, 255, 255); color: rgb(255, 0, 0); font-size: 18px;\"><strong>发起支付API（POST/GET）：</strong></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; white-space: normal; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, Tahoma, Arial, sans-serif; font-size: 14px;\">&nbsp; &nbsp;&nbsp;</p><pre style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border-radius: 10px; background-color: rgb(43, 43, 43); -webkit-tap-highlight-color: rgba(0, 0, 0, 0); white-space: pre-wrap; overflow-wrap: break-word; color: rgb(169, 183, 198); font-family: &quot;Courier New&quot;; font-size: 13.5pt;\"><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 2em;\"><span style=\"font-size: 16px;\">&nbsp;&nbsp;支付请求地址：请登录平台后在对接接口信息处获取支付请求地址</span><br/></p></pre><p style=\"margin-top: 0px; margin-bottom: 0px; white-space: normal; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, Tahoma, Arial, sans-serif; font-size: 14px;\"><br/></p><p style=\"margin-top: 0px; margin-bottom: 0px; white-space: normal; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, Tahoma, Arial, sans-serif; font-size: 14px;\">请求参数如下：</p><p style=\"margin-top: 0px; margin-bottom: 0px; white-space: normal; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, Tahoma, Arial, sans-serif; font-size: 14px;\"><br/></p><table width=\"100%\"><tbody><tr class=\"firstRow\"><td valign=\"top\" width=\"131\" style=\"padding: 0px; border-color: rgb(242, 242, 242); margin: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); word-break: break-all; background-color: rgb(216, 216, 216);\"><p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 3em;\"><strong>&nbsp; &nbsp;字段名称</strong></p></td><td valign=\"top\" width=\"149\" style=\"padding: 0px; border-color: rgb(242, 242, 242); margin: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); word-break: break-all; background-color: rgb(216, 216, 216);\"><p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 3em;\"><strong>&nbsp; &nbsp;字段类型</strong></p></td><td valign=\"top\" width=\"55\" style=\"padding: 0px; border-color: rgb(242, 242, 242); margin: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); word-break: break-all; background-color: rgb(216, 216, 216);\"><p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 3em;\"><strong>&nbsp; &nbsp;必填</strong></p></td><td width=\"574\" style=\"padding: 0px; border-color: rgb(242, 242, 242); margin: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); word-break: break-all; background-color: rgb(216, 216, 216);\">&nbsp; &nbsp;<strong>字段说明</strong><br/></td></tr><tr><td valign=\"top\" width=\"138\" style=\"padding: 0px; border-color: rgb(242, 242, 242); margin: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); word-break: break-all;\"><p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 3em;\"><span style=\"color: rgb(127, 127, 127);\">&nbsp; pid</span></p></td><td valign=\"top\" width=\"149\" style=\"padding: 0px; border-color: rgb(242, 242, 242); margin: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); word-break: break-all;\"><p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 3em;\"><span style=\"color: rgb(127, 127, 127);\">&nbsp; string</span></p></td><td valign=\"top\" width=\"55\" style=\"padding: 0px; border-color: rgb(242, 242, 242); margin: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); word-break: break-all;\"><p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 3em;\"><span style=\"color: rgb(127, 127, 127);\">&nbsp; 是</span></p></td><td valign=\"top\" width=\"574\" style=\"padding: 0px; border-color: rgb(242, 242, 242); margin: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); word-break: break-all;\"><p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 3em;\"><span style=\"color: rgb(127, 127, 127);\">&nbsp; 商户PID（商户后台获取）</span></p></td></tr><tr><td valign=\"top\" width=\"138\" style=\"padding: 0px; border-color: rgb(242, 242, 242); margin: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); word-break: break-all;\"><p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 3em;\"><span style=\"color: rgb(127, 127, 127);\">&nbsp; type</span></p></td><td valign=\"top\" width=\"149\" style=\"padding: 0px; border-color: rgb(242, 242, 242); margin: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); word-break: break-all;\"><p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 3em;\"><span style=\"color: rgb(127, 127, 127);\">&nbsp; string</span></p></td><td valign=\"top\" width=\"55\" style=\"padding: 0px; border-color: rgb(242, 242, 242); margin: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); word-break: break-all;\"><p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 3em;\"><span style=\"color: rgb(127, 127, 127);\">&nbsp; 是</span></p></td><td valign=\"top\" width=\"574\" style=\"padding: 0px; border-color: rgb(242, 242, 242); margin: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); word-break: break-all;\"><p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 3em;\"><span style=\"color: rgb(127, 127, 127);\">&nbsp; <span style=\"color: rgb(127, 127, 127);\">支付类型：</span>alipay:支付宝,wxpay:微信支付<span style=\"color: rgb(127, 127, 127);\">,qqpay:QQ支付</span></span></p></td></tr><tr><td width=\"138\" valign=\"top\" style=\"padding: 0px; border-color: rgb(242, 242, 242); margin: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); word-break: break-all;\"><p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 3em;\"><span style=\"color: rgb(127, 127, 127);\">&nbsp; out_trade_no</span></p></td><td width=\"149\" valign=\"top\" style=\"padding: 0px; border-color: rgb(242, 242, 242); margin: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); word-break: break-all;\"><p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 3em;\"><span style=\"color: rgb(127, 127, 127);\">&nbsp; string</span></p></td><td width=\"55\" valign=\"top\" style=\"padding: 0px; border-color: rgb(242, 242, 242); margin: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); word-break: break-all;\"><p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 3em;\"><span style=\"color: rgb(127, 127, 127);\">&nbsp; 是</span></p></td><td width=\"574\" valign=\"top\" style=\"padding: 0px; border-color: rgb(242, 242, 242); margin: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); word-break: break-all;\"><p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 3em;\"><span style=\"color: rgb(127, 127, 127);\">&nbsp; 商户订单号，可以是时间戳，不可重复</span></p></td></tr><tr><td width=\"138\" valign=\"top\" style=\"padding: 0px; border-color: rgb(242, 242, 242); margin: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); word-break: break-all;\"><p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 3em;\"><span style=\"color: rgb(127, 127, 127);\">&nbsp; name</span></p></td><td width=\"149\" valign=\"top\" style=\"padding: 0px; border-color: rgb(242, 242, 242); margin: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); word-break: break-all;\"><p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 3em;\"><span style=\"color: rgb(127, 127, 127);\">&nbsp; string</span></p></td><td width=\"55\" valign=\"top\" style=\"padding: 0px; border-color: rgb(242, 242, 242); margin: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); word-break: break-all;\"><p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 3em;\"><span style=\"color: rgb(127, 127, 127);\">&nbsp; 是</span></p></td><td width=\"574\" valign=\"top\" style=\"padding: 0px; border-color: rgb(242, 242, 242); margin: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); word-break: break-all;\"><p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 3em;\"><span style=\"color: rgb(127, 127, 127);\">&nbsp; 商品名称</span></p></td></tr><tr><td valign=\"top\" width=\"138\" style=\"padding: 0px; border-color: rgb(242, 242, 242); margin: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); word-break: break-all;\"><p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 3em;\"><span style=\"color: rgb(127, 127, 127);\">&nbsp;&nbsp;money</span></p></td><td valign=\"top\" width=\"149\" style=\"padding: 0px; border-color: rgb(242, 242, 242); margin: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); word-break: break-all;\"><p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 3em;\"><span style=\"color: rgb(127, 127, 127);\">&nbsp; float（2）</span></p></td><td valign=\"top\" width=\"71\" style=\"padding: 0px; border-color: rgb(242, 242, 242); margin: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); word-break: break-all;\"><p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 3em;\"><span style=\"color: rgb(127, 127, 127);\">&nbsp; 是</span><br/></p></td><td valign=\"top\" width=\"574\" style=\"padding: 0px; border-color: rgb(242, 242, 242); margin: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); word-break: break-all;\"><p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 3em;\"><span style=\"color: rgb(127, 127, 127);\">&nbsp; 充值金额</span></p></td></tr><tr><td valign=\"top\" width=\"135\" style=\"padding: 0px; border-color: rgb(242, 242, 242); margin: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); word-break: break-all;\"><p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 3em;\"><span style=\"color: rgb(127, 127, 127);\">&nbsp; return_url</span></p></td><td valign=\"top\" width=\"148\" style=\"padding: 0px; border-color: rgb(242, 242, 242); margin: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); word-break: break-all;\"><p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 3em;\"><span style=\"color: rgb(127, 127, 127);\">&nbsp; string</span></p></td><td valign=\"top\" width=\"55\" style=\"padding: 0px; border-color: rgb(242, 242, 242); margin: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); word-break: break-all;\"><p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 3em;\"><span style=\"color: rgb(127, 127, 127);\">&nbsp; 是</span></p></td><td valign=\"top\" width=\"574\" style=\"padding: 0px; border-color: rgb(242, 242, 242); margin: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); word-break: break-all;\"><p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 3em;\"><span style=\"color: rgb(127, 127, 127);\">&nbsp; 同步跳转网址（支付成功或支付超时后将跳转到此参数传递的网址）</span></p></td></tr><tr><td valign=\"top\" style=\"padding: 0px; border-color: rgb(242, 242, 242); margin: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); word-break: break-all;\"><p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 3em;\"><span style=\"color: rgb(127, 127, 127);\">&nbsp; notify_url</span></p></td><td valign=\"top\" style=\"padding: 0px; border-color: rgb(242, 242, 242); margin: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); word-break: break-all;\"><p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 3em;\"><span style=\"color: rgb(127, 127, 127);\">&nbsp; string</span></p></td><td valign=\"top\" style=\"padding: 0px; border-color: rgb(242, 242, 242); margin: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); word-break: break-all;\"><p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 3em;\"><span style=\"color: rgb(127, 127, 127);\">&nbsp; 是</span></p></td><td valign=\"top\" style=\"padding: 0px; border-color: rgb(242, 242, 242); margin: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); word-break: break-all;\"><p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 3em;\"><span style=\"color: rgb(127, 127, 127);\">&nbsp; 异步回调网址</span></p></td></tr><tr><td width=\"138\" valign=\"top\" style=\"padding: 0px; border-color: rgb(242, 242, 242); margin: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); word-break: break-all;\"><p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 3em;\"><span style=\"color: rgb(127, 127, 127);\">&nbsp; mid</span></p></td><td width=\"149\" valign=\"top\" style=\"padding: 0px; border-color: rgb(242, 242, 242); margin: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); word-break: break-all;\"><p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 3em;\"><span style=\"color: rgb(127, 127, 127);\">&nbsp; string</span></p></td><td width=\"55\" valign=\"top\" style=\"padding: 0px; border-color: rgb(242, 242, 242); margin: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); word-break: break-all;\"><p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 3em;\"><span style=\"color: rgb(127, 127, 127);\">&nbsp; 否</span></p></td><td width=\"574\" valign=\"top\" style=\"padding: 0px; border-color: rgb(242, 242, 242); margin: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); word-break: break-all;\"><p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 3em;\"><span style=\"color: rgb(127, 127, 127);\">&nbsp;&nbsp;收款账号MID（传入此参数指定收款账号，为空则随机轮询账号）</span></p></td></tr><tr><td valign=\"top\" width=\"138\" style=\"padding: 0px; border-color: rgb(242, 242, 242); margin: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); word-break: break-all;\"><p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 3em;\"><span style=\"color: rgb(127, 127, 127);\">&nbsp; sign</span></p></td><td valign=\"top\" width=\"149\" style=\"padding: 0px; border-color: rgb(242, 242, 242); margin: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); word-break: break-all;\"><p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 3em;\"><span style=\"color: rgb(127, 127, 127);\">&nbsp; string</span></p></td><td valign=\"top\" width=\"55\" style=\"padding: 0px; border-color: rgb(242, 242, 242); margin: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); word-break: break-all;\"><p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 3em;\"><span style=\"color: rgb(127, 127, 127);\">&nbsp; 是</span></p></td><td valign=\"top\" width=\"574\" style=\"padding: 0px; border-color: rgb(242, 242, 242); margin: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); word-break: break-all;\"><p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 3em;\"><span style=\"color: rgb(127, 127, 127);\">&nbsp; 数据签名（签名方法见下文）</span></p></td></tr></tbody></table><hr style=\"white-space: normal; height: 1px; margin: 10px 0px; border: 0px; clear: both; background-color: rgb(230, 230, 230); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, Tahoma, Arial, sans-serif; font-size: 14px;\"/><p style=\"margin-top: 0px; margin-bottom: 0px; white-space: normal; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, Tahoma, Arial, sans-serif; font-size: 14px;\"><span style=\"color: rgb(255, 0, 0); font-size: 18px;\"></span></p><p style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, 微软雅黑, Arial, sans-serif; margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); color: rgb(89, 89, 89); font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(255, 0, 0); font-size: 18px;\"><strong>异步通知API（POST/GET）：</strong></span><br/></p><p style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, 微软雅黑, Arial, sans-serif; margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); color: rgb(89, 89, 89); font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><br/></p><p style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, 微软雅黑, Arial, sans-serif; margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); color: rgb(89, 89, 89); font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">回调参数：</p><p style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, 微软雅黑, Arial, sans-serif; margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); color: rgb(89, 89, 89); font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><br/></p><table width=\"100%\"><tbody><tr class=\"firstRow\"><td valign=\"top\" width=\"139\" style=\"margin: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); word-break: break-all; background-color: rgb(216, 216, 216); border-color: rgb(242, 242, 242);\"><p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 3em;\"><strong>&nbsp; &nbsp;字段名称</strong></p></td><td valign=\"top\" width=\"155\" style=\"margin: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); word-break: break-all; background-color: rgb(216, 216, 216); border-color: rgb(242, 242, 242);\"><p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 3em;\"><strong>&nbsp; &nbsp;字段类型</strong></p></td><td valign=\"top\" width=\"697\" style=\"margin: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); word-break: break-all; background-color: rgb(216, 216, 216); border-color: rgb(242, 242, 242);\"><p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 3em;\"><strong>&nbsp; &nbsp;字段说明</strong></p></td></tr><tr><td width=\"139\" valign=\"top\" style=\"margin: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); word-break: break-all; border-color: rgb(242, 242, 242);\"><p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 3em;\"><span style=\"color: rgb(127, 127, 127);\">&nbsp; &nbsp;key</span></p></td><td width=\"155\" valign=\"top\" style=\"margin: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); word-break: break-all; border-color: rgb(242, 242, 242);\"><p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 3em;\"><span style=\"color: rgb(127, 127, 127);\">&nbsp; &nbsp;string</span></p></td><td width=\"697\" valign=\"top\" style=\"margin: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); word-break: break-all; border-color: rgb(242, 242, 242);\"><p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 3em;\"><span style=\"color: rgb(127, 127, 127);\">&nbsp; &nbsp;商户密匙KEY（由支付平台返回给回调地址判断）<br/></span></p></td></tr><tr><td width=\"139\" valign=\"top\" style=\"margin: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); word-break: break-all; border-color: rgb(242, 242, 242);\"><p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 3em;\"><span style=\"color: rgb(127, 127, 127);\">&nbsp; &nbsp;pid</span></p></td><td width=\"155\" valign=\"top\" style=\"margin: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); word-break: break-all; border-color: rgb(242, 242, 242);\"><p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 3em;\"><span style=\"color: rgb(127, 127, 127);\">&nbsp; &nbsp;string</span></p></td><td width=\"697\" valign=\"top\" style=\"margin: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); word-break: break-all; border-color: rgb(242, 242, 242);\"><p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 3em;\"><span style=\"color: rgb(127, 127, 127);\">&nbsp; &nbsp;判断请求的商户ID</span></p></td></tr><tr><td width=\"139\" valign=\"top\" style=\"margin: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); word-break: break-all; border-color: rgb(242, 242, 242);\"><p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 3em;\"><span style=\"color: rgb(127, 127, 127);\">&nbsp; &nbsp;trade_no</span></p></td><td width=\"155\" valign=\"top\" style=\"margin: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); word-break: break-all; border-color: rgb(242, 242, 242);\"><p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 3em;\"><span style=\"color: rgb(127, 127, 127);\">&nbsp; &nbsp;string</span></p></td><td width=\"697\" valign=\"top\" style=\"margin: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); word-break: break-all; border-color: rgb(242, 242, 242);\"><p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 3em;\"><span style=\"color: rgb(127, 127, 127);\">&nbsp; &nbsp;云端订单号</span></p></td></tr><tr><td width=\"139\" valign=\"top\" style=\"margin: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); word-break: break-all; border-color: rgb(242, 242, 242);\"><p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 3em;\"><span style=\"color: rgb(127, 127, 127);\">&nbsp; &nbsp;out_trade_no</span></p></td><td width=\"155\" valign=\"top\" style=\"margin: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); word-break: break-all; border-color: rgb(242, 242, 242);\"><p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 3em;\"><span style=\"color: rgb(127, 127, 127);\">&nbsp; &nbsp;string</span></p></td><td width=\"697\" valign=\"top\" style=\"margin: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); word-break: break-all; border-color: rgb(242, 242, 242);\"><p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 3em;\"><span style=\"color: rgb(127, 127, 127);\">&nbsp; &nbsp;商户系统内部的订单号</span></p></td></tr><tr><td valign=\"top\" width=\"139\" style=\"margin: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); word-break: break-all; border-color: rgb(242, 242, 242);\"><p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 3em;\"><span style=\"color: rgb(127, 127, 127);\">&nbsp; &nbsp;name</span></p></td><td valign=\"top\" width=\"155\" style=\"margin: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); word-break: break-all; border-color: rgb(242, 242, 242);\"><p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 3em;\"><span style=\"color: rgb(127, 127, 127);\">&nbsp; &nbsp;string</span></p></td><td valign=\"top\" width=\"697\" style=\"margin: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); word-break: break-all; border-color: rgb(242, 242, 242);\"><p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 3em;\"><span style=\"color: rgb(127, 127, 127);\">&nbsp; &nbsp;商品名称</span></p></td></tr><tr><td valign=\"top\" width=\"139\" style=\"margin: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); word-break: break-all; border-color: rgb(242, 242, 242);\"><p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 3em;\"><span style=\"color: rgb(127, 127, 127);\">&nbsp; &nbsp;money</span></p></td><td valign=\"top\" width=\"155\" style=\"margin: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); word-break: break-all; border-color: rgb(242, 242, 242);\"><p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 3em;\"><span style=\"color: rgb(127, 127, 127);\">&nbsp; &nbsp;float（2）</span></p></td><td valign=\"top\" width=\"697\" style=\"margin: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); word-break: break-all; border-color: rgb(242, 242, 242);\"><p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 3em;\"><span style=\"color: rgb(127, 127, 127);\">&nbsp; &nbsp;商品金额</span></p></td></tr><tr><td valign=\"top\" width=\"139\" style=\"margin: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); word-break: break-all; border-color: rgb(242, 242, 242);\"><p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 3em;\"><span style=\"color: rgb(127, 127, 127);\">&nbsp; &nbsp;trade_status</span></p></td><td valign=\"top\" width=\"155\" style=\"margin: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); word-break: break-all; border-color: rgb(242, 242, 242);\"><p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 3em;\"><span style=\"color: rgb(127, 127, 127);\">&nbsp; &nbsp;string</span></p></td><td valign=\"top\" width=\"697\" style=\"margin: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); word-break: break-all; border-color: rgb(242, 242, 242);\"><p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 3em;\"><span style=\"color: rgb(127, 127, 127);\">&nbsp; &nbsp;TRADE_SUCCESS</span></p></td></tr><tr><td valign=\"top\" width=\"139\" style=\"margin: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); word-break: break-all; border-color: rgb(242, 242, 242);\"><p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 3em;\"><span style=\"color: rgb(127, 127, 127);\">&nbsp; &nbsp;sign</span></p></td><td valign=\"top\" width=\"155\" style=\"margin: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); word-break: break-all; border-color: rgb(242, 242, 242);\"><p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 3em;\"><span style=\"color: rgb(127, 127, 127);\">&nbsp; &nbsp;string</span></p></td><td valign=\"top\" width=\"697\" style=\"margin: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); word-break: break-all; border-color: rgb(242, 242, 242);\"><p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: 3em;\"><span style=\"color: rgb(127, 127, 127);\">&nbsp; 数据签名（签名方法见下文）</span></p></td></tr></tbody></table><hr style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, 微软雅黑, Arial, sans-serif; height: 1px; margin: 10px 0px; border: 0px; clear: both; background-color: rgb(230, 230, 230); color: rgb(89, 89, 89); font-size: 14px; white-space: normal;\"/><p style=\"margin-top: 0px; margin-bottom: 0px; white-space: normal; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, Tahoma, Arial, sans-serif; font-size: 14px;\"><span style=\"color: rgb(255, 0, 0);\"><strong><span style=\"font-size: 18px;\">数据签名算法：</span></strong></span><br/></p><p style=\"margin-top: 0px; margin-bottom: 0px; white-space: normal; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, Tahoma, Arial, sans-serif; font-size: 14px;\"><span style=\"color: rgb(255, 0, 0);\"><strong><span style=\"font-size: 18px;\"><br/></span></strong></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; white-space: normal; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, Tahoma, Arial, sans-serif; font-size: 14px;\"><span style=\"color: rgb(255, 0, 0);\"><span style=\"font-size: 16px; color: rgb(0, 0, 0);\">php算法</span></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; white-space: normal; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, Tahoma, Arial, sans-serif; font-size: 14px;\"><span style=\"color: rgb(255, 0, 0);\"><span style=\"font-size: 16px; color: rgb(0, 0, 0);\"><br/></span></span></p><pre style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border-radius: 10px; background-color: rgb(43, 43, 43); -webkit-tap-highlight-color: rgba(0, 0, 0, 0); white-space: pre-wrap; overflow-wrap: break-word; color: rgb(169, 183, 198); font-family: &quot;Courier New&quot;; font-size: 13.5pt;\"><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: normal;\"><br/> &nbsp; $data = array(<br/> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &#39;pid&#39; =&gt; $api[&#39;pid&#39;],//商户ID<br/> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &#39;trade_no&#39; =&gt; $api[&#39;trade_no&#39;],//云端订单号<br/> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &#39;out_trade_no&#39; =&gt; $api[&#39;out_trade_no&#39;],//商户订单号<br/> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &#39;type&#39; =&gt; $api[&#39;type&#39;],//支付方式<br/> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &#39;name&#39; =&gt; $api[&#39;name&#39;],//商品名称<br/> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &#39;money&#39; =&gt; $api[&#39;money&#39;],//商品金额<br/> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &#39;trade_status&#39; =&gt; $api[&#39;trade_status&#39;],//支付状态\n &nbsp; &nbsp;);\n &nbsp; &nbsp;ksort($api); //排序GET和POST参数\n &nbsp; &nbsp;reset($api); //内部指针指向数组中的第一个元素\n &nbsp; &nbsp;$sign = &#39;&#39;;//初始化\n &nbsp; &nbsp;foreach ($api AS $key =&gt; $val) { //遍历附加参数\n &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if ($val == &#39;&#39; || $key == &#39;sign&#39;) continue; //跳过这些不签名\n &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if ($sign) $sign .= &#39;&amp;&#39;; //第一个字符串签名不加&amp; 其他加&amp;连接起来参数\n &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;$sign .= &quot;$key=$val&quot;; //拼接为url参数形式\n &nbsp; &nbsp;}\n &nbsp; &nbsp;$sign_ok = md5($sign . 您的商户密匙KEY);//md5加密参数<br/><br/></p></pre>',1627399861,1);
/*!40000 ALTER TABLE `pay_gogao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pay_group`
--

DROP TABLE IF EXISTS `pay_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pay_group` (
  `gid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `info` varchar(1024) DEFAULT NULL,
  `isbuy` tinyint(1) NOT NULL DEFAULT '0',
  `price` decimal(10,2) DEFAULT NULL,
  `sort` int(10) NOT NULL DEFAULT '0',
  `expire` int(10) NOT NULL DEFAULT '0',
  `settle_open` int(1) DEFAULT '0',
  `settle_type` int(1) DEFAULT '0',
  `settings` text,
  PRIMARY KEY (`gid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pay_group`
--

LOCK TABLES `pay_group` WRITE;
/*!40000 ALTER TABLE `pay_group` DISABLE KEYS */;
INSERT INTO `pay_group` VALUES (0,'默认用户组','{\"1\":{\"type\":\"\",\"channel\":\"-1\",\"rate\":\"\"},\"2\":{\"type\":\"\",\"channel\":\"-1\",\"rate\":\"\"},\"3\":{\"type\":\"\",\"channel\":\"-1\",\"rate\":\"\"}}',0,NULL,0,0,0,0,NULL);
/*!40000 ALTER TABLE `pay_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pay_jie`
--

DROP TABLE IF EXISTS `pay_jie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pay_jie` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '排序',
  `pid` int(255) DEFAULT NULL COMMENT '商户PID',
  `game_dm` mediumtext COMMENT '通道标识',
  `game_img` mediumtext COMMENT '通道图标',
  `game_name` mediumtext COMMENT '通道名称',
  `game_my` int(11) DEFAULT '1' COMMENT '设为常用',
  `land_count` varchar(250) DEFAULT '0' COMMENT '账号数量',
  `jr_pay` varchar(250) DEFAULT '0' COMMENT '今日收入',
  `zr_pay` varchar(250) DEFAULT '0' COMMENT '昨日收入',
  `state` int(11) DEFAULT '1' COMMENT '通道状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pay_jie`
--

LOCK TABLES `pay_jie` WRITE;
/*!40000 ALTER TABLE `pay_jie` DISABLE KEYS */;
/*!40000 ALTER TABLE `pay_jie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pay_log`
--

DROP TABLE IF EXISTS `pay_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pay_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `type` varchar(20) DEFAULT NULL,
  `date` datetime NOT NULL,
  `ip` varchar(20) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `data` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pay_log`
--

LOCK TABLES `pay_log` WRITE;
/*!40000 ALTER TABLE `pay_log` DISABLE KEYS */;
INSERT INTO `pay_log` VALUES (1,0,'登录后台','2023-05-21 01:56:28','223.96.63.21','',NULL),(2,1000,'普通登录','2023-05-21 01:59:35','223.96.63.21','',NULL);
/*!40000 ALTER TABLE `pay_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pay_notice`
--

DROP TABLE IF EXISTS `pay_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pay_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL COMMENT '公告标题',
  `datatxt` varchar(488) NOT NULL COMMENT '公告内容',
  `color` varchar(20) NOT NULL COMMENT '公告颜色',
  `sort` int(5) NOT NULL COMMENT '公告排序',
  `status` int(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `addtime` datetime DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pay_notice`
--

LOCK TABLES `pay_notice` WRITE;
/*!40000 ALTER TABLE `pay_notice` DISABLE KEYS */;
INSERT INTO `pay_notice` VALUES (1,'联系客服','有问题请联系QQ:1478114933','#0052cc',50,1,'2022-04-28 13:00:39'),(2,'警告','本平台严禁一切淫秽、涉赌、政治、钓鱼、诈骗、理财、借贷、封建迷信等非法网站接入使用！','#ff0000',50,1,'2021-06-25 12:59:31'),(3,'快速指南','前往云端或软件添加收款码，并扫码登入CK状态，即可开启即时到账收款！','#0052cc',50,1,'2021-06-25 13:00:39'),(4,'注意事项','微信添加过二维码后不可改昵称，支付宝需要关闭余额自动转到余额宝，详见使用帮助。','#0052cc',50,1,'2021-06-25 13:00:55');
/*!40000 ALTER TABLE `pay_notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pay_notify`
--

DROP TABLE IF EXISTS `pay_notify`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pay_notify` (
  `trade_no` varchar(64) NOT NULL COMMENT '回调号',
  `pid` varchar(32) NOT NULL COMMENT '商户PID',
  `type` varchar(32) NOT NULL COMMENT '支付方式',
  `money` decimal(10,2) NOT NULL COMMENT '金额',
  `pay_msg` varchar(300) DEFAULT '' COMMENT '回调返回数据',
  `addtime` datetime DEFAULT NULL COMMENT '到账时间',
  PRIMARY KEY (`trade_no`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pay_notify`
--

LOCK TABLES `pay_notify` WRITE;
/*!40000 ALTER TABLE `pay_notify` DISABLE KEYS */;
/*!40000 ALTER TABLE `pay_notify` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pay_order`
--

DROP TABLE IF EXISTS `pay_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pay_order` (
  `trade_no` char(19) NOT NULL,
  `out_trade_no` varchar(150) NOT NULL,
  `api_trade_no` varchar(150) DEFAULT NULL,
  `uid` int(11) unsigned NOT NULL,
  `tid` tinyint(11) unsigned NOT NULL DEFAULT '0',
  `type` int(10) unsigned NOT NULL,
  `channel` int(10) unsigned NOT NULL,
  `name` varchar(64) NOT NULL,
  `money` decimal(10,2) NOT NULL,
  `realmoney` decimal(10,2) DEFAULT NULL,
  `getmoney` decimal(10,2) DEFAULT NULL,
  `notify_url` varchar(255) DEFAULT NULL,
  `return_url` varchar(255) DEFAULT NULL,
  `param` varchar(255) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  `endtime` datetime DEFAULT NULL,
  `date` date DEFAULT NULL,
  `domain` varchar(64) DEFAULT NULL,
  `domain2` varchar(64) DEFAULT NULL,
  `ip` varchar(20) DEFAULT NULL,
  `buyer` varchar(30) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `notify` int(5) NOT NULL DEFAULT '0',
  `notifytime` datetime DEFAULT NULL,
  `invite` int(11) unsigned NOT NULL DEFAULT '0',
  `invitemoney` decimal(10,2) DEFAULT NULL,
  `combine` tinyint(1) NOT NULL DEFAULT '0',
  `profits` int(11) NOT NULL DEFAULT '0',
  `profits2` int(11) NOT NULL DEFAULT '0',
  `settle` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`trade_no`),
  KEY `uid` (`uid`),
  KEY `out_trade_no` (`out_trade_no`,`uid`),
  KEY `api_trade_no` (`api_trade_no`),
  KEY `invite` (`invite`),
  KEY `date` (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pay_order`
--

LOCK TABLES `pay_order` WRITE;
/*!40000 ALTER TABLE `pay_order` DISABLE KEYS */;
INSERT INTO `pay_order` VALUES ('2023052102034481841','226230521020343300',NULL,1000,0,0,0,'226230521020343300',1.00,NULL,NULL,'http://666.foil.asia/user/api/order/callback.Epay','http://666.foil.asia/user/index/query?tradeNo=226230521020343300',NULL,'2023-05-21 02:03:44',NULL,NULL,'666.foil.asia',NULL,'223.96.63.21',NULL,0,0,NULL,0,NULL,0,0,0,0);
/*!40000 ALTER TABLE `pay_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pay_plug`
--

DROP TABLE IF EXISTS `pay_plug`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pay_plug` (
  `id` int(11) NOT NULL,
  `type` varchar(20) DEFAULT NULL COMMENT '类型',
  `name` varchar(20) DEFAULT NULL COMMENT '名称',
  `logimg` varchar(200) DEFAULT NULL COMMENT 'logo照片',
  `title` varchar(300) DEFAULT NULL COMMENT '介绍内容',
  `author` varchar(5) DEFAULT NULL COMMENT '插件作者',
  `download` varchar(400) DEFAULT NULL COMMENT '下载地址',
  `time` datetime DEFAULT NULL COMMENT '发布时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pay_plug`
--

LOCK TABLES `pay_plug` WRITE;
/*!40000 ALTER TABLE `pay_plug` DISABLE KEYS */;
/*!40000 ALTER TABLE `pay_plug` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pay_plugin`
--

DROP TABLE IF EXISTS `pay_plugin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pay_plugin` (
  `name` varchar(30) NOT NULL,
  `showname` varchar(60) DEFAULT NULL,
  `author` varchar(60) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `types` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pay_plugin`
--

LOCK TABLES `pay_plugin` WRITE;
/*!40000 ALTER TABLE `pay_plugin` DISABLE KEYS */;
INSERT INTO `pay_plugin` VALUES ('adapay','AdaPay聚合支付','AdaPay','https://www.adapay.tech/','alipay,wxpay,bank'),('aliold','支付宝旧版接口','支付宝','https://b.alipay.com/signing/productSetV2.htm','alipay'),('alipay','支付宝官方支付','支付宝','https://b.alipay.com/signing/productSetV2.htm','alipay'),('alipayd','支付宝官方支付直付通版','支付宝','https://b.alipay.com/signing/productSetV2.htm','alipay'),('alipaysl','支付宝官方支付服务商版','支付宝','https://b.alipay.com/signing/productSetV2.htm','alipay'),('allinpay','通联支付','通联','https://www.allinpay.com/','alipay,wxpay,qqpay,bank'),('chinaums','银联商务','银联商务','https://open.chinaums.com/','alipay,wxpay,bank'),('duolabao','哆啦宝支付','哆啦宝','http://www.duolabao.com/','alipay,wxpay,qqpay,bank,jdpay'),('epay','彩虹易支付','彩虹',NULL,'alipay,qqpay,wxpay,bank,jdpay'),('fuiou','富友支付(前置商户)','富友','https://www.fuiou.com/','alipay,wxpay,bank'),('hnapay','新生支付','新生支付','https://www.hnapay.com/','alipay,wxpay,qqpay,bank'),('huifu','汇付斗拱平台','汇付天下','https://paas.huifu.com/','alipay,wxpay,bank'),('jdpay','京东支付','京东支付','https://www.jdpay.com/','jdpay'),('jeepay','Jeepay聚合支付','Jeepay','http://www.xxpay.org/','alipay,wxpay,bank'),('kayixin','钱多多分账接口','卡易信','http://trade.kayixin.com/','alipay'),('mirfupay','铭付银通','铭付银通','https://www.mirfupay.com/','alipay,wxpay'),('paypal','PayPal','PayPal','https://www.paypal.com/','paypal'),('qqpay','QQ钱包官方支付','QQ钱包','https://mp.qpay.tenpay.com/','qqpay'),('qxapp','千寻畅付','千寻畅付','https://pay.ctspay.cn/','alipay,wxpay,qqpay,bank'),('swiftpass','威富通RSA','威富通','https://www.swiftpass.cn/','alipay,wxpay,qqpay,bank,jdpay'),('swiftpass2','威富通MD5','威富通','https://www.swiftpass.cn/','alipay,wxpay,qqpay,bank,jdpay'),('umfpay','联动优势','联动优势','https://xy.umfintech.com/','alipay,wxpay,bank'),('unionpay','银联前置','银联','http://www.95516.com/','alipay,wxpay,qqpay,bank,jdpay'),('vmq','V免签','V免签','https://github.com/szvone/vmqphp','alipay,qqpay,wxpay'),('woaizf','我爱支付','我爱支付','https://www.52zhifu.com/','alipay,wxpay,qqpay,bank'),('wxpay','微信官方支付','微信','https://pay.weixin.qq.com/','wxpay'),('wxpayn','微信官方支付V3','微信','https://pay.weixin.qq.com/','wxpay'),('wxpaynp','微信官方支付V3服务商版','微信','https://pay.weixin.qq.com/partner/public/home','wxpay'),('wxpaysl','微信官方支付服务商版','微信','https://pay.weixin.qq.com/partner/public/home','wxpay'),('xorpay','XorPay','XorPay','https://xorpay.com/','alipay,wxpay'),('xunhupay2','虎皮椒支付','虎皮椒','https://www.xunhupay.com/','alipay,wxpay'),('ympay','源铭SAAS平台','源铭','https://www.xgymwl.cn/','alipay,wxpay,bank'),('ysepay','银盛支付','银盛支付','https://www.ysepay.com/','alipay,qqpay,wxpay,bank'),('zhangyishou','掌易收聚合支付','掌易收','http://www.zhangyishou.com/','alipay,qqpay,wxpay,bank'),('zyu','知宇支付','知宇',NULL,'alipay,qqpay,wxpay,bank');
/*!40000 ALTER TABLE `pay_plugin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pay_price`
--

DROP TABLE IF EXISTS `pay_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pay_price` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '排序',
  `pid` int(255) DEFAULT NULL COMMENT '商户ID',
  `user` mediumtext COMMENT '商户账号',
  `money` decimal(10,2) DEFAULT '0.00' COMMENT '余额',
  `order` mediumtext COMMENT '云端订单号',
  `create_date` bigint(20) DEFAULT NULL COMMENT '创建时间戳（10位）',
  `state` int(11) DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pay_price`
--

LOCK TABLES `pay_price` WRITE;
/*!40000 ALTER TABLE `pay_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `pay_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pay_psorder`
--

DROP TABLE IF EXISTS `pay_psorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pay_psorder` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(11) NOT NULL,
  `trade_no` char(19) NOT NULL,
  `api_trade_no` varchar(150) NOT NULL,
  `settle_no` varchar(150) DEFAULT NULL,
  `money` decimal(10,2) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `result` text,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `trade_no` (`trade_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pay_psorder`
--

LOCK TABLES `pay_psorder` WRITE;
/*!40000 ALTER TABLE `pay_psorder` DISABLE KEYS */;
/*!40000 ALTER TABLE `pay_psorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pay_psreceiver`
--

DROP TABLE IF EXISTS `pay_psreceiver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pay_psreceiver` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `channel` int(11) NOT NULL,
  `uid` int(11) DEFAULT NULL,
  `account` varchar(128) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `rate` varchar(10) DEFAULT NULL,
  `minmoney` varchar(10) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `channel` (`channel`,`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pay_psreceiver`
--

LOCK TABLES `pay_psreceiver` WRITE;
/*!40000 ALTER TABLE `pay_psreceiver` DISABLE KEYS */;
/*!40000 ALTER TABLE `pay_psreceiver` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pay_psreceiver2`
--

DROP TABLE IF EXISTS `pay_psreceiver2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pay_psreceiver2` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `channel` int(11) NOT NULL,
  `uid` int(11) DEFAULT NULL,
  `bank_type` tinyint(4) NOT NULL,
  `card_id` varchar(128) NOT NULL,
  `card_name` varchar(128) NOT NULL,
  `tel_no` varchar(20) NOT NULL,
  `cert_id` varchar(30) DEFAULT NULL,
  `bank_code` varchar(20) DEFAULT NULL,
  `prov_code` varchar(20) DEFAULT NULL,
  `area_code` varchar(20) DEFAULT NULL,
  `settleid` varchar(50) DEFAULT NULL,
  `rate` varchar(10) DEFAULT NULL,
  `minmoney` varchar(10) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `channel` (`channel`,`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pay_psreceiver2`
--

LOCK TABLES `pay_psreceiver2` WRITE;
/*!40000 ALTER TABLE `pay_psreceiver2` DISABLE KEYS */;
/*!40000 ALTER TABLE `pay_psreceiver2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pay_qrcode`
--

DROP TABLE IF EXISTS `pay_qrcode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pay_qrcode` (
  `id` int(11) NOT NULL,
  `pid` varchar(32) NOT NULL COMMENT '商户PID',
  `type` varchar(32) NOT NULL COMMENT '二维码类型',
  `qr_id` varchar(200) DEFAULT NULL COMMENT '归属ID',
  `qr_url` varchar(300) NOT NULL COMMENT '二维码url地址',
  `money` decimal(10,2) NOT NULL COMMENT '金额',
  `addtime` datetime DEFAULT NULL COMMENT '二维码添加时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pay_qrcode`
--

LOCK TABLES `pay_qrcode` WRITE;
/*!40000 ALTER TABLE `pay_qrcode` DISABLE KEYS */;
/*!40000 ALTER TABLE `pay_qrcode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pay_qrlist`
--

DROP TABLE IF EXISTS `pay_qrlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pay_qrlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` varchar(32) NOT NULL COMMENT '商户PID',
  `qr_url` varchar(300) NOT NULL COMMENT '二维码url地址',
  `type` varchar(32) NOT NULL COMMENT '二维码类型',
  `beizhu` varchar(32) DEFAULT NULL COMMENT '二维码备注',
  `wx_name` varchar(50) DEFAULT NULL COMMENT '绑定的微信店员',
  `pay_user` varchar(88) DEFAULT '0' COMMENT '登陆账号',
  `pay_pass` varchar(88) DEFAULT '0' COMMENT '登陆密码',
  `data_data` varchar(88) DEFAULT NULL COMMENT '返回信息',
  `cookie` text COMMENT '登录COOKIE',
  `money` decimal(10,2) NOT NULL COMMENT '上次余额记录',
  `status` int(1) NOT NULL DEFAULT '1' COMMENT '二维码状态',
  `nums` int(11) NOT NULL DEFAULT '0' COMMENT '出码排序',
  `crontime` varchar(32) DEFAULT '0' COMMENT '监控时间',
  `Order_time` varchar(32) NOT NULL DEFAULT '0' COMMENT '补单执行时间',
  `hook_type` int(1) DEFAULT '0' COMMENT '挂机类型 0=免挂1=挂机',
  `email_status` int(1) NOT NULL DEFAULT '0' COMMENT '邮箱状态',
  `addtime` datetime DEFAULT NULL COMMENT '二维码添加时间',
  `endtime` datetime DEFAULT NULL COMMENT '二维码失效时间',
  `agreement` int(11) NOT NULL DEFAULT '0' COMMENT '协议',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pay_qrlist`
--

LOCK TABLES `pay_qrlist` WRITE;
/*!40000 ALTER TABLE `pay_qrlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `pay_qrlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pay_record`
--

DROP TABLE IF EXISTS `pay_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pay_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `action` int(1) NOT NULL DEFAULT '0',
  `money` decimal(10,2) NOT NULL,
  `oldmoney` decimal(10,2) NOT NULL,
  `newmoney` decimal(10,2) NOT NULL,
  `type` varchar(20) DEFAULT NULL,
  `trade_no` varchar(64) DEFAULT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `trade_no` (`trade_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pay_record`
--

LOCK TABLES `pay_record` WRITE;
/*!40000 ALTER TABLE `pay_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `pay_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pay_regcode`
--

DROP TABLE IF EXISTS `pay_regcode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pay_regcode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `type` int(1) NOT NULL DEFAULT '0',
  `code` varchar(32) NOT NULL,
  `to` varchar(32) DEFAULT NULL,
  `time` int(11) NOT NULL,
  `ip` varchar(20) DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT '0',
  `errcount` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `code` (`to`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pay_regcode`
--

LOCK TABLES `pay_regcode` WRITE;
/*!40000 ALTER TABLE `pay_regcode` DISABLE KEYS */;
/*!40000 ALTER TABLE `pay_regcode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pay_risk`
--

DROP TABLE IF EXISTS `pay_risk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pay_risk` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `type` int(1) NOT NULL DEFAULT '0',
  `url` varchar(64) DEFAULT NULL,
  `content` varchar(64) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pay_risk`
--

LOCK TABLES `pay_risk` WRITE;
/*!40000 ALTER TABLE `pay_risk` DISABLE KEYS */;
/*!40000 ALTER TABLE `pay_risk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pay_roll`
--

DROP TABLE IF EXISTS `pay_roll`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pay_roll` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` int(11) unsigned NOT NULL,
  `name` varchar(30) NOT NULL,
  `kind` int(1) unsigned NOT NULL DEFAULT '0',
  `info` text,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `index` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pay_roll`
--

LOCK TABLES `pay_roll` WRITE;
/*!40000 ALTER TABLE `pay_roll` DISABLE KEYS */;
/*!40000 ALTER TABLE `pay_roll` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pay_settle`
--

DROP TABLE IF EXISTS `pay_settle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pay_settle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `batch` varchar(20) DEFAULT NULL,
  `auto` int(1) NOT NULL DEFAULT '1',
  `type` int(1) NOT NULL DEFAULT '1',
  `account` varchar(128) NOT NULL,
  `username` varchar(128) NOT NULL,
  `money` decimal(10,2) NOT NULL,
  `realmoney` decimal(10,2) NOT NULL,
  `addtime` datetime DEFAULT NULL,
  `endtime` datetime DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT '0',
  `transfer_status` int(1) NOT NULL DEFAULT '0',
  `transfer_result` varchar(64) DEFAULT NULL,
  `transfer_date` datetime DEFAULT NULL,
  `result` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `batch` (`batch`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pay_settle`
--

LOCK TABLES `pay_settle` WRITE;
/*!40000 ALTER TABLE `pay_settle` DISABLE KEYS */;
/*!40000 ALTER TABLE `pay_settle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pay_sz`
--

DROP TABLE IF EXISTS `pay_sz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pay_sz` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '排序',
  `user` mediumtext COMMENT '商户账号',
  `ip` mediumtext COMMENT '登录IP',
  `web_name` mediumtext COMMENT '站点名称',
  `web_keywords` mediumtext COMMENT '站点关键词',
  `web_description` mediumtext COMMENT '站点描述',
  `web_beian` mediumtext COMMENT '备案号信息',
  `web_kefu` mediumtext COMMENT '客服URL',
  `web_qun` mediumtext COMMENT '加群URL',
  `web_ewm` mediumtext COMMENT '二维码提示',
  `web_user` int(11) DEFAULT '1' COMMENT '商户注册',
  `web_ktheme` varchar(64) DEFAULT '1' COMMENT '首页模板',
  `web_pay` varchar(64) DEFAULT '1' COMMENT '支付模板',
  `web_mail` varchar(30) DEFAULT '2' COMMENT '邮箱通知开关',
  `mail_smtp` varchar(30) DEFAULT NULL COMMENT 'SMTP地址',
  `mail_port` mediumtext COMMENT 'SMTP端口',
  `mail_name` mediumtext COMMENT '邮箱账号',
  `mail_pwd` mediumtext COMMENT '邮箱密码',
  `mail_email` int(11) DEFAULT '1' COMMENT '邮件模板',
  `ds_money` varchar(64) DEFAULT '0' COMMENT '默认余额',
  `ds_fee` varchar(64) DEFAULT '0' COMMENT '默认费率',
  `ds_rul` mediumtext COMMENT '支付网关',
  `ds_todaorul` mediumtext COMMENT '云端网关',
  `ds_zaioc` varchar(11) DEFAULT '2' COMMENT '是否开放商户前台余额在线充值',
  `ds_hfw` varchar(11) DEFAULT '1' COMMENT '是否关闭网站',
  `ds_outr` mediumtext COMMENT '网站关闭提示',
  `ds_zhto` varchar(11) DEFAULT '1' COMMENT '浏览器跳转',
  `ds_user` varchar(11) DEFAULT '1' COMMENT '是否关闭商户注册',
  `ds_txet` mediumtext COMMENT '商户注册关闭提示',
  `tz_denglu` mediumtext COMMENT '登陆通知',
  `tz_todao` mediumtext COMMENT '通道提示',
  `tz_zhanghao` mediumtext COMMENT '账号提示',
  `tz_yue` mediumtext COMMENT '余额提示',
  `ver` varchar(64) DEFAULT '2.0' COMMENT '系统版本',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pay_sz`
--

LOCK TABLES `pay_sz` WRITE;
/*!40000 ALTER TABLE `pay_sz` DISABLE KEYS */;
INSERT INTO `pay_sz` VALUES (1,'admin','127.0.0.1','未速码支付系统','免签支付,未速支付,易支付,码支付,微信,支付宝','国内首屈一指的技术微信和支付宝的免签约收款解决方案平台。','粤ICP备XXXXX号','','','',1,'1','1','2','','','','',1,'6.66','3','','','1','1','演示站，网站关闭','1','1','演示站，关闭注册','','','','','2.0');
/*!40000 ALTER TABLE `pay_sz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pay_taocan`
--

DROP TABLE IF EXISTS `pay_taocan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pay_taocan` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '排序',
  `taocan_name` mediumtext COMMENT '套餐名称',
  `taocan_jiage` mediumtext COMMENT '套餐价格',
  `taocan_quanx1` mediumtext COMMENT '套餐费率权限',
  `taocan_quanx2` varchar(200) DEFAULT '0' COMMENT '套餐免挂(微信)权限',
  `taocan_time` mediumtext COMMENT '套餐时间',
  `state` int(11) DEFAULT '1' COMMENT '套餐状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pay_taocan`
--

LOCK TABLES `pay_taocan` WRITE;
/*!40000 ALTER TABLE `pay_taocan` DISABLE KEYS */;
INSERT INTO `pay_taocan` VALUES (1,'会员套餐一','200','0.1','0','1',1),(2,'会员套餐二','300','0.5','1','0',1),(3,'会员套餐三','300','0.5','1','2',1);
/*!40000 ALTER TABLE `pay_taocan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pay_tmp`
--

DROP TABLE IF EXISTS `pay_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pay_tmp` (
  `pid` mediumtext COMMENT '商户PID',
  `price` varchar(255) NOT NULL COMMENT '付款金额|支付方式|通道标识',
  `order_id` mediumtext COMMENT '云端订单号',
  PRIMARY KEY (`price`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pay_tmp`
--

LOCK TABLES `pay_tmp` WRITE;
/*!40000 ALTER TABLE `pay_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `pay_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pay_type`
--

DROP TABLE IF EXISTS `pay_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pay_type` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL COMMENT '支付名',
  `logo` varchar(255) NOT NULL DEFAULT '' COMMENT 'logo',
  `ico` varchar(255) NOT NULL DEFAULT '' COMMENT '图标',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='支付类型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pay_type`
--

LOCK TABLES `pay_type` WRITE;
/*!40000 ALTER TABLE `pay_type` DISABLE KEYS */;
INSERT INTO `pay_type` VALUES (1,'支付宝扫码','/static/app/payment/icon_zfb.jpg','/static/app/payment/zfb.png'),(2,'支付宝H5','/static/app/payment/icon_zfb.jpg','/static/app/payment/zfb.png'),(3,'微信扫码','/static/app/payment/icon_wx.jpg','/static/app/payment/wx.png'),(4,'微信H5','/static/app/payment/icon_wx.jpg','/static/app/payment/wx.png'),(5,'QQ钱包扫码','/static/app/payment/icon_qq.jpg','/static/app/payment/qq.png'),(6,'QQ钱包H5','/static/app/payment/icon_qq.jpg','/static/app/payment/qq.png'),(7,'网银支付','/static/app/payment/icon_bank.jpg','/static/app/payment/bank.png'),(9,'京东钱包','/static/app/payment/icon_jd.jpg','/static/app/payment/jd.png'),(10,'度小满支付','/static/app/payment/icon_bd.jpg','/static/app/payment/bd.png'),(11,'云闪付','/static/app/payment/icon_ysff.jpg','/static/app/payment/ysff.png');
/*!40000 ALTER TABLE `pay_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pay_user`
--

DROP TABLE IF EXISTS `pay_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pay_user` (
  `uid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `gid` int(11) unsigned NOT NULL DEFAULT '0',
  `upid` int(11) unsigned NOT NULL DEFAULT '0',
  `key` varchar(32) NOT NULL,
  `pwd` varchar(32) DEFAULT NULL,
  `account` varchar(128) DEFAULT NULL,
  `username` varchar(128) DEFAULT NULL,
  `codename` varchar(32) DEFAULT NULL,
  `settle_id` tinyint(4) NOT NULL DEFAULT '1',
  `alipay_uid` varchar(32) DEFAULT NULL,
  `qq_uid` varchar(32) DEFAULT NULL,
  `wx_uid` varchar(32) DEFAULT NULL,
  `money` decimal(10,2) NOT NULL,
  `email` varchar(32) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `qq` varchar(20) DEFAULT NULL,
  `url` varchar(64) DEFAULT NULL,
  `cert` tinyint(4) NOT NULL DEFAULT '0',
  `certtype` tinyint(4) NOT NULL DEFAULT '0',
  `certmethod` tinyint(4) NOT NULL DEFAULT '0',
  `certno` varchar(18) DEFAULT NULL,
  `certname` varchar(32) DEFAULT NULL,
  `certtime` datetime DEFAULT NULL,
  `certtoken` varchar(64) DEFAULT NULL,
  `certcorpno` varchar(30) DEFAULT NULL,
  `certcorpname` varchar(80) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  `lasttime` datetime DEFAULT NULL,
  `endtime` datetime DEFAULT NULL,
  `level` tinyint(1) NOT NULL DEFAULT '1',
  `pay` tinyint(1) NOT NULL DEFAULT '1',
  `settle` tinyint(1) NOT NULL DEFAULT '1',
  `keylogin` tinyint(1) NOT NULL DEFAULT '1',
  `apply` tinyint(1) NOT NULL DEFAULT '0',
  `mode` tinyint(4) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `refund` tinyint(1) NOT NULL DEFAULT '0',
  `channelinfo` text,
  `ordername` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `email` (`email`),
  KEY `phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pay_user`
--

LOCK TABLES `pay_user` WRITE;
/*!40000 ALTER TABLE `pay_user` DISABLE KEYS */;
INSERT INTO `pay_user` VALUES (1000,0,0,'O774774OqyOoNoCd17DqdCCcdPYo4I5n','56fab21a152e0b5bc010b0d6e6e8c379','123456489','fyy',NULL,2,NULL,NULL,NULL,0.00,'1234567@qq.com',NULL,NULL,NULL,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,'2023-05-21 01:59:16','2023-05-21 01:59:35',NULL,1,1,1,1,0,0,1,0,NULL,NULL);
/*!40000 ALTER TABLE `pay_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pay_vip`
--

DROP TABLE IF EXISTS `pay_vip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pay_vip` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL COMMENT '套餐名称',
  `wxpay` decimal(10,2) NOT NULL COMMENT '限制金额',
  `wxpay_free` int(1) NOT NULL COMMENT '免输入0限制1不限',
  `qqpay` decimal(10,2) NOT NULL COMMENT '限制金额',
  `alipay` decimal(10,2) NOT NULL COMMENT '限制金额',
  `alipay_free` int(1) NOT NULL COMMENT '免输入0限制1不限',
  `dmf` int(1) NOT NULL COMMENT '免输入0限制1不限',
  `text` text,
  `money` decimal(10,2) NOT NULL COMMENT '金额',
  `time` varchar(64) NOT NULL COMMENT '月',
  `sort` int(5) NOT NULL COMMENT '排序',
  `status` int(1) NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pay_vip`
--

LOCK TABLES `pay_vip` WRITE;
/*!40000 ALTER TABLE `pay_vip` DISABLE KEYS */;
INSERT INTO `pay_vip` VALUES (1,'默认用户组',99999999.99,1,99999999.99,99999999.99,1,1,'建议购买，其他套餐！！！\r\n',0.00,'1',1,0);
/*!40000 ALTER TABLE `pay_vip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pay_wechat_trumpet`
--

DROP TABLE IF EXISTS `pay_wechat_trumpet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pay_wechat_trumpet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wx_user` varchar(50) NOT NULL COMMENT '微信账号',
  `wx_name` varchar(50) NOT NULL COMMENT '微信昵称',
  `beizhu` varchar(488) NOT NULL COMMENT '微信备注',
  `cookie` text COMMENT '登录COOKIE',
  `login_time` bigint(20) NOT NULL COMMENT '在线刷新时间',
  `sort` int(5) NOT NULL COMMENT '排序',
  `hook_type` int(1) DEFAULT '0' COMMENT '挂机类型 0=免挂1=挂机',
  `status` int(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `addtime` datetime DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pay_wechat_trumpet`
--

LOCK TABLES `pay_wechat_trumpet` WRITE;
/*!40000 ALTER TABLE `pay_wechat_trumpet` DISABLE KEYS */;
/*!40000 ALTER TABLE `pay_wechat_trumpet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pay_weixin`
--

DROP TABLE IF EXISTS `pay_weixin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pay_weixin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `name` varchar(30) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `appid` varchar(150) DEFAULT NULL,
  `appsecret` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pay_weixin`
--

LOCK TABLES `pay_weixin` WRITE;
/*!40000 ALTER TABLE `pay_weixin` DISABLE KEYS */;
/*!40000 ALTER TABLE `pay_weixin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pay_work`
--

DROP TABLE IF EXISTS `pay_work`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pay_work` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(8) DEFAULT NULL,
  `num` varchar(16) NOT NULL,
  `types` varchar(16) NOT NULL,
  `biaoti` text,
  `text` text,
  `qq` varchar(16) NOT NULL,
  `edata` varchar(16) NOT NULL,
  `huifu` text,
  `wdata` varchar(16) NOT NULL,
  `active` varchar(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pay_work`
--

LOCK TABLES `pay_work` WRITE;
/*!40000 ALTER TABLE `pay_work` DISABLE KEYS */;
/*!40000 ALTER TABLE `pay_work` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugin`
--

DROP TABLE IF EXISTS `plugin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '0' COMMENT '开启状态',
  `config` text COMMENT '配置',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugin`
--

LOCK TABLES `plugin` WRITE;
/*!40000 ALTER TABLE `plugin` DISABLE KEYS */;
INSERT INTO `plugin` VALUES (1,'bgdata','bgdata',1,'{\"admin_bgdata\":\"1\",\"merchant_bgdata\":\"1\"}'),(2,'tradetask','tradetask',1,'{\"status\":\"0\",\"activity_name\":\"百万补贴活动\",\"activity_content\":\"&lt;p&gt;&lt;span style=&quot;color:#e74c3c;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:24px;&quot;&gt;百万补贴活动已经上线祝商户们多多进财&lt;\\/span&gt;&lt;\\/strong&gt;&lt;\\/span&gt;&lt;\\/p&gt;\\n\\n&lt;p&gt;&lt;span style=&quot;color:#e74c3c;&quot;&gt;&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;strong&gt;活动流程:&lt;\\/strong&gt;&lt;\\/span&gt;&lt;\\/span&gt;&lt;\\/p&gt;\\n\\n&lt;p&gt;&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;color:#4e5f70;&quot;&gt;&lt;strong&gt;商户后台选择奖励金,需要在规定时间内达到相应的流水后金额奖励金额自动解冻！在后台商户们可以看到奖励金解冻进度！未在期间内达到自己选择的对应流水后,到时间后自动清零!如果商户选择了至尊流水奖励！到时间了流水只有2万则奖励不发放！所以请商户们根据自己情况自行选择！此活动只对新人正常费率的商户们开放！&lt;\\/strong&gt;&lt;\\/span&gt;&lt;\\/span&gt;&lt;span style=&quot;color:#4e5f70;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:16px;&quot;&gt;商户们可以根据自己业务量来选择对应的任务,当满足这些流水后,平台将奖励现金红包,福利超多！（详情可见下方）&lt;\\/span&gt;&lt;\\/strong&gt;&lt;\\/span&gt;&lt;\\/p&gt;\\n\\n&lt;p&gt;&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;color:#e74c3c;&quot;&gt;&lt;strong&gt;活动规则:&lt;\\/strong&gt;&lt;\\/span&gt; &lt;\\/span&gt;&lt;\\/p&gt;\\n\\n&lt;p&gt;&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;color:#4e5f70;&quot;&gt;&lt;strong&gt;1.达到流水后奖励金自动解冻！系统自动将奖励打到商家的收款帐号！&lt;\\/strong&gt;&lt;\\/span&gt;&lt;\\/span&gt;&lt;\\/p&gt;\\n\\n&lt;p&gt;&lt;strong&gt;&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;span style=&quot;color:#4e5f70;&quot;&gt;2.此活动最终解释权归本平台所有！&lt;\\/span&gt;&lt;\\/span&gt;&lt;\\/strong&gt;&lt;\\/p&gt;\\n\\n&lt;p&gt; &lt;\\/p&gt;\\n\",\"repeatapply\":\"1\",\"waitday\":\"0\"}'),(3,'risk','risk',1,'{\"risk_type0\":\"商家存在违规风险\",\"risk_type1\":\"违规产品,请立即整改\",\"risk_type2\":\"投诉量过多,处理不及时\",\"risk_type3\":\"清退封禁\",\"complaint_rate\":\"1\",\"keyword_mode\":\"2\",\"keyword\":\"辅助|外挂\",\"status\":\"0\"}'),(4,'guide','guide',1,'{\"status\":\"0\"}'),(5,'migrate','migrate',1,'{\"app_type\":\"1\",\"db_host\":\"127.0.0.1\",\"db_name\":\"\",\"db_user\":\"\",\"db_pwd\":\"\",\"db_port\":\"3306\",\"migrate_user_repeat\":\"0\",\"migrate_goods\":\"1\",\"migrate_goods_repeat\":\"0\",\"migrate_card\":\"1\",\"migrate_card_repeat\":\"0\",\"status\":\"0\",\"migrate_user\":\"1\"}'),(6,'subdomain','subdomain',1,'{\"status\":\"0\",\"disabled_domains\":\"www|ftp|blog|pay\",\"top_domain\":\"\"}'),(7,'oauth2','oauth2',1,'{\"wechat_open_merchant\":\"0\",\"wechat_open_appid\":\"\",\"wechat_open_secret\":\"\",\"qq_open_merchant\":\"0\",\"qq_open_public\":\"1\",\"qq_open_appid\":\"\",\"qq_open_secret\":\"\"}'),(8,'merchantauth','merchantauth',1,'{\"status\":\"0\",\"auth_type\":\"1\",\"auth_people\":\"1\",\"auth_money\":\"1\",\"start_at\":1615898910,\"auth_type1_appcode\":\"\",\"auth_type2_appcode\":\"\"}'),(9,'app','app',1,'{\"android\":\"\",\"ios\":\"\"}'),(10,'traderank','traderank',1,'{\"status\":\"0\",\"count\":\"10\"}'),(11,'shopdiy','shopdiy',1,'{\"status\":\"1\"}'),(12,'agentsetting','agentsetting',1,'{\"min_money\":\"0.5\",\"poolauth\":\"0\",\"poolauth_tip\":\"查看全网通商品需要申请，请联系客服QQ：888888\",\"autocheck\":\"0\",\"min_rate\":\"50\",\"poolcount_limit\":\"6\"}'),(13,'paysafe','paysafe',1,'{\"status\":\"0\",\"order_count_risk\":\"10\",\"warning_switch\":\"1\",\"warning_minute\":\"15\",\"warning_count\":\"15\",\"order_black_minute\":\"1800\"}'),(14,'cross','cross',1,'{\"status\":\"0\",\"crossauth\":\"1\",\"crossauth_tip\":\"使用跨平台功能需要申请，请联系客服QQ：888888\",\"default_goods_count\":\"50\",\"default_goods_money\":\"1\",\"default_day_count\":\"30\",\"default_day_money\":\"0.5\",\"tip\":\"有几个商品名额 就可以对接卡盟的几个商品，免费送50个对接名额，每新增一个卡盟在送50个名额。\\n警告：请勿对接腾讯软件和国内有代理商的，发现直接冻结账号，不给结算！！！\"}'),(15,'punish','punish',1,'{\"status\":\"0\",\"order_status\":\"0\",\"complaint_point\":\"2\",\"order_count\":\"10\",\"add_rate\":\"4\",\"complaint_status\":\"0\",\"complaint_add_rate\":\"4\",\"goodsoff_status\":\"0\",\"goodsoff_hour\":\"1\",\"goodsoff_count\":\"2\"}'),(16,'lockcard','lockcard',1,'{\"status\":\"0\",\"lock_people\":\"1\",\"lock_time\":\"600\"}'),(17,'payapi','payapi',1,'{\"status\":\"0\",\"tip\":\"使用API支付功能需要申请，请联系客服QQ：888888\",\"channel_alipay_pc\":\"0\",\"channel_wxpay_pc\":\"0\",\"channel_qq_pc\":\"0\",\"channel_alipay_wap\":\"0\",\"channel_wxpay_wap\":\"0\",\"channel_qq_wap\":\"0\"}'),(18,'selectcard','selectcard',1,'{\"status\":\"1\",\"selectcard_fee_min\":\"1\",\"selectcard_fee_platform_rate\":\"50\",\"selectcard_fee_merchant_rate\":\"50\"}'),(21,'custompay','custompay',1,'{\"status\":\"0\",\"need_apply\":\"1\",\"deposit_limit\":\"100\",\"fee_limit\":\"10\",\"custompay_tip\":\"使用自定义支付功能需要申请，请联系客服QQ：888888\"}'),(22,'codepay','codepay',1,'{\"merchant_status\":\"0\",\"uid\":\"\",\"apikey\":\"\",\"need_apply\":\"1\",\"codepay_tip\":\"使用码支付功能需要申请，请联系客服QQ：888888\",\"audio\":\"1\",\"alipay_time\":\"12\",\"weixin_time\":\"6\",\"qq_time\":\"6\",\"step\":0}'),(23,'chat','chat',1,'{\"status\":\"0\"}'),(24,'airpayx','airpayx',1,'{\"status\":\"0\",\"app_key\":\"\",\"app_secret\":\"\",\"airpayxauth\":\"1\",\"airpayxauth_tip\":\"开通闪电安全结算需要申请，请联系客服QQ888888\",\"tip\":\"请认真填写申请信息，严谨黄、赌、诈商户申请\",\"wx_appid\":\"\",\"wx_appsecret\":\"\"}');
/*!40000 ALTER TABLE `plugin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugin_airpayx`
--

DROP TABLE IF EXISTS `plugin_airpayx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugin_airpayx` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `token` varchar(255) NOT NULL,
  `expire_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugin_airpayx`
--

LOCK TABLES `plugin_airpayx` WRITE;
/*!40000 ALTER TABLE `plugin_airpayx` DISABLE KEYS */;
/*!40000 ALTER TABLE `plugin_airpayx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugin_airpayxauth`
--

DROP TABLE IF EXISTS `plugin_airpayxauth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugin_airpayxauth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `status` tinyint(3) DEFAULT '0',
  `create_at` int(10) DEFAULT NULL,
  `merchant_no` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugin_airpayxauth`
--

LOCK TABLES `plugin_airpayxauth` WRITE;
/*!40000 ALTER TABLE `plugin_airpayxauth` DISABLE KEYS */;
/*!40000 ALTER TABLE `plugin_airpayxauth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugin_ambassador`
--

DROP TABLE IF EXISTS `plugin_ambassador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugin_ambassador` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `create_at` int(10) DEFAULT NULL,
  `spread_reward_money` decimal(10,2) DEFAULT '0.00',
  `spread_rebate_rate` decimal(10,3) DEFAULT '0.000',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugin_ambassador`
--

LOCK TABLES `plugin_ambassador` WRITE;
/*!40000 ALTER TABLE `plugin_ambassador` DISABLE KEYS */;
/*!40000 ALTER TABLE `plugin_ambassador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugin_chat`
--

DROP TABLE IF EXISTS `plugin_chat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugin_chat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `apikey` varchar(255) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '0',
  `style` tinyint(4) DEFAULT '0',
  `business_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugin_chat`
--

LOCK TABLES `plugin_chat` WRITE;
/*!40000 ALTER TABLE `plugin_chat` DISABLE KEYS */;
INSERT INTO `plugin_chat` VALUES (1,1,'9abajrbpc353nclv3wh4ujs5sy6c7ra2dkhav8dqv9jge3i2nsa4sizf2arjvb1k',0,0,36950);
/*!40000 ALTER TABLE `plugin_chat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugin_codepay_applist`
--

DROP TABLE IF EXISTS `plugin_codepay_applist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugin_codepay_applist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `appid` varchar(255) DEFAULT NULL,
  `appkey` varchar(255) DEFAULT NULL,
  `create_at` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT '0',
  `alipay_uid` varchar(255) DEFAULT NULL,
  `wordkey` varchar(255) DEFAULT NULL,
  `alipay_type` tinyint(4) DEFAULT '0',
  `alipay_ck` text,
  `alipay_online` tinyint(4) DEFAULT '0',
  `weixin_type` tinyint(4) DEFAULT '0',
  `qq_type` tinyint(4) DEFAULT '1',
  `qq_ck` text,
  `weixin_online` tinyint(4) DEFAULT '0',
  `qq_online` tinyint(4) DEFAULT '0',
  `alipay_open` tinyint(4) DEFAULT '0',
  `weixin_open` tinyint(4) DEFAULT '0',
  `qq_open` tinyint(4) DEFAULT '0',
  `weixin_qrcode` varchar(255) DEFAULT NULL,
  `qq_qrcode` varchar(255) DEFAULT NULL,
  `weixin_ck` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugin_codepay_applist`
--

LOCK TABLES `plugin_codepay_applist` WRITE;
/*!40000 ALTER TABLE `plugin_codepay_applist` DISABLE KEYS */;
/*!40000 ALTER TABLE `plugin_codepay_applist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugin_codepay_auth`
--

DROP TABLE IF EXISTS `plugin_codepay_auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugin_codepay_auth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `status` tinyint(3) DEFAULT '0',
  `create_at` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugin_codepay_auth`
--

LOCK TABLES `plugin_codepay_auth` WRITE;
/*!40000 ALTER TABLE `plugin_codepay_auth` DISABLE KEYS */;
/*!40000 ALTER TABLE `plugin_codepay_auth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugin_codepay_order`
--

DROP TABLE IF EXISTS `plugin_codepay_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugin_codepay_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `appid` int(11) DEFAULT NULL,
  `transaction_id` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugin_codepay_order`
--

LOCK TABLES `plugin_codepay_order` WRITE;
/*!40000 ALTER TABLE `plugin_codepay_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `plugin_codepay_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugin_cross`
--

DROP TABLE IF EXISTS `plugin_cross`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugin_cross` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `platform` varchar(255) DEFAULT NULL,
  `protocol` varchar(255) DEFAULT NULL,
  `domain` varchar(255) DEFAULT NULL,
  `create_at` int(11) DEFAULT NULL,
  `goods_count` int(11) DEFAULT '0',
  `expire_at` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `params` text,
  `token` text,
  `balance` decimal(10,3) DEFAULT '0.000',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugin_cross`
--

LOCK TABLES `plugin_cross` WRITE;
/*!40000 ALTER TABLE `plugin_cross` DISABLE KEYS */;
/*!40000 ALTER TABLE `plugin_cross` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugin_cross_order`
--

DROP TABLE IF EXISTS `plugin_cross_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugin_cross_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `trade_no` varchar(255) DEFAULT NULL,
  `transaction_id` varchar(255) DEFAULT NULL,
  `goods_name` varchar(100) DEFAULT NULL,
  `paytype` int(11) DEFAULT NULL,
  `channel_id` int(11) DEFAULT NULL,
  `channel_account_id` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '0' COMMENT '1已支付  2取消  3退款',
  `create_at` int(11) DEFAULT NULL,
  `success_at` int(11) DEFAULT NULL,
  `total_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `cross_params` int(11) DEFAULT '0' COMMENT '个数或天数',
  `cross_type` tinyint(4) DEFAULT '0' COMMENT '1个数 2天数',
  `cross_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugin_cross_order`
--

LOCK TABLES `plugin_cross_order` WRITE;
/*!40000 ALTER TABLE `plugin_cross_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `plugin_cross_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugin_crossauth`
--

DROP TABLE IF EXISTS `plugin_crossauth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugin_crossauth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `status` tinyint(3) DEFAULT '0',
  `create_at` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugin_crossauth`
--

LOCK TABLES `plugin_crossauth` WRITE;
/*!40000 ALTER TABLE `plugin_crossauth` DISABLE KEYS */;
/*!40000 ALTER TABLE `plugin_crossauth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugin_custompay_auth`
--

DROP TABLE IF EXISTS `plugin_custompay_auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugin_custompay_auth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `status` tinyint(3) DEFAULT '0',
  `create_at` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugin_custompay_auth`
--

LOCK TABLES `plugin_custompay_auth` WRITE;
/*!40000 ALTER TABLE `plugin_custompay_auth` DISABLE KEYS */;
/*!40000 ALTER TABLE `plugin_custompay_auth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugin_custompay_order`
--

DROP TABLE IF EXISTS `plugin_custompay_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugin_custompay_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `trade_no` varchar(255) DEFAULT NULL,
  `transaction_id` varchar(255) DEFAULT NULL,
  `goods_name` varchar(100) DEFAULT NULL,
  `paytype` int(11) DEFAULT NULL,
  `channel_id` int(11) DEFAULT NULL,
  `channel_account_id` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '0' COMMENT '1已支付  2取消  3退款',
  `create_at` int(11) DEFAULT NULL,
  `success_at` int(11) DEFAULT NULL,
  `total_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `money` decimal(11,2) DEFAULT '0.00',
  `recharge_type` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugin_custompay_order`
--

LOCK TABLES `plugin_custompay_order` WRITE;
/*!40000 ALTER TABLE `plugin_custompay_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `plugin_custompay_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugin_guide`
--

DROP TABLE IF EXISTS `plugin_guide`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugin_guide` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `subtitle` varchar(100) DEFAULT NULL,
  `subtitle_line1` varchar(100) DEFAULT NULL,
  `subtitle_line2` varchar(100) DEFAULT NULL,
  `buttons` text,
  `theme_id` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '0' COMMENT '开启，关闭',
  `update_at` int(10) DEFAULT NULL,
  `logo_open` tinyint(4) DEFAULT '1' COMMENT 'logo开关',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugin_guide`
--

LOCK TABLES `plugin_guide` WRITE;
/*!40000 ALTER TABLE `plugin_guide` DISABLE KEYS */;
/*!40000 ALTER TABLE `plugin_guide` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugin_guide_theme`
--

DROP TABLE IF EXISTS `plugin_guide_theme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugin_guide_theme` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `video` text,
  `background` text,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `user_id` int(11) DEFAULT '0',
  `update_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugin_guide_theme`
--

LOCK TABLES `plugin_guide_theme` WRITE;
/*!40000 ALTER TABLE `plugin_guide_theme` DISABLE KEYS */;
INSERT INTO `plugin_guide_theme` VALUES (1,'初音','http://s7.huoying666.com/video/20180705/de0936c7bdd99f5509398365af915637/1530768905c5a15575883fcd15.mp4_last.mp4','https://img.alicdn.com/imgextra/i1/1021358488/O1CN01eN1fUD2CZYO6YlGar_!!1021358488.jpg',1,0,NULL),(2,'林允儿','http://s7.huoying666.com/video/20180318/e380c690cebb1e8377405b66af6855ed/15213064516129f04599be2f70.mp4_pre.mp4','http://img.huoying666.com/forum/201803/29/182634b8k9f3bk4z3n9zkp.png.thumb.jpg',1,0,NULL),(3,'2b姐姐尼尔','https://s7.huoying666.com/video/20210119/efe6ddb0a3917f0b0438b7aaccb5b7d8/16110693238c1524463e66b983.mp4_pre.mp4','https://s7.huoying666.com/video/20210119/efe6ddb0a3917f0b0438b7aaccb5b7d8/16110693231.jpg',1,0,NULL),(4,'Aeolion无缝循环','https://s7.huoying666.com/video/20171016/4d556f631704ad376ca023434780fc17/150811897074f60c9efa0af52d.mp4_pre.mp4','https://s7.huoying666.com/video/20171016/4d556f631704ad376ca023434780fc17/15081189704.jpg',1,0,NULL),(5,'流浪地球','https://s7.huoying666.com/video/20190324/b6d78939813f0699cb0cefae291e8494/15533978883161b052490d9834.mp4_pre.mp4','https://s7.huoying666.com/video/20190324/b6d78939813f0699cb0cefae291e8494/15533978885.jpg',1,0,NULL),(6,'穿越山脉','https://s7.huoying666.com/video/20170913/ff0f16e501acbfd0af8faca63b287a95/1505301123d67ac5fe60daff97.mp4_pre.mp4','https://s7.huoying666.com/video/20170913/ff0f16e501acbfd0af8faca63b287a95/15053011234.jpg',1,0,NULL),(7,'数据壁纸','https://s7.huoying666.com/video/20180321/5d88dfee7b640f6c7a98c56cc71f6d7b/15216054196788b3276f3805cd.mp4_pre.mp4','https://s7.huoying666.com/video/20180321/5d88dfee7b640f6c7a98c56cc71f6d7b/15216054191.jpg',1,0,NULL),(8,'黑客专用','https://s7.huoying666.com/video/20171024/0f08bd0163d9d44893777a25d62e8dfd/1508835758af1cfcbd2957f513.mp4_pre.mp4','https://s7.huoying666.com/video/20171024/0f08bd0163d9d44893777a25d62e8dfd/15088357582.jpg',1,0,NULL),(9,'舔屏八哥','https://s7.huoying666.com/video/20180525/8975788c4afb4e41aa7274d17ee38a0b/1527229400a06364c27ac1da85.mp4_pre.mp4','https://s7.huoying666.com/video/20180525/8975788c4afb4e41aa7274d17ee38a0b/15272294005.jpg',1,0,NULL),(10,'喵斯快跑','https://s7.huoying666.com/video/20201117/387c693c5050c6041fd86950dffb277b/1605612051cd3b9b03b5be42ac.mp4_pre.mp4','https://s7.huoying666.com/video/20201117/387c693c5050c6041fd86950dffb277b/16056120515.jpg',1,0,NULL),(11,'Alon','https://s7.huoying666.com/video/20170909/2601a1f0a3cd480ecce801c664965e15/15049344881128f579fc3427ea.mp4_pre.mp4','https://s7.huoying666.com/video/20170909/2601a1f0a3cd480ecce801c664965e15/15049344881.jpg',1,0,NULL),(12,'韩国主播徐雅','https://s7.huoying666.com/video/20200415/979c7e5ec07440ad6a14fa179a861a58/15869039973dd8701498a34318.mp4_pre.mp4','https://s7.huoying666.com/video/20200415/979c7e5ec07440ad6a14fa179a861a58/15869039974.jpg',1,0,NULL);
/*!40000 ALTER TABLE `plugin_guide_theme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugin_merchantauth`
--

DROP TABLE IF EXISTS `plugin_merchantauth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugin_merchantauth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `card_name` varchar(255) DEFAULT NULL,
  `card_number` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `card_img` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `create_at` int(11) DEFAULT NULL,
  `auth_type` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugin_merchantauth`
--

LOCK TABLES `plugin_merchantauth` WRITE;
/*!40000 ALTER TABLE `plugin_merchantauth` DISABLE KEYS */;
/*!40000 ALTER TABLE `plugin_merchantauth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugin_merchantauth_order`
--

DROP TABLE IF EXISTS `plugin_merchantauth_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugin_merchantauth_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `trade_no` varchar(255) DEFAULT NULL,
  `transaction_id` varchar(255) DEFAULT NULL,
  `goods_name` varchar(100) DEFAULT NULL,
  `paytype` int(11) DEFAULT NULL,
  `channel_id` int(11) DEFAULT NULL,
  `channel_account_id` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '0' COMMENT '1已支付  2取消  3退款',
  `create_at` int(11) DEFAULT NULL,
  `success_at` int(11) DEFAULT NULL,
  `params` text COMMENT 'json格式',
  `auth_status` tinyint(4) DEFAULT '0' COMMENT '0未认证 2失败  1成功',
  `auth_result` varchar(255) DEFAULT NULL,
  `total_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugin_merchantauth_order`
--

LOCK TABLES `plugin_merchantauth_order` WRITE;
/*!40000 ALTER TABLE `plugin_merchantauth_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `plugin_merchantauth_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugin_paysafe`
--

DROP TABLE IF EXISTS `plugin_paysafe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugin_paysafe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel_id` int(11) NOT NULL,
  `min_money` decimal(10,2) NOT NULL DEFAULT '0.00',
  `max_money` decimal(10,2) NOT NULL DEFAULT '0.00',
  `open_random` tinyint(4) NOT NULL DEFAULT '0',
  `random_money` decimal(10,2) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `update_at` int(11) DEFAULT NULL,
  `random_type` tinyint(4) DEFAULT '0',
  `random_rounding` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugin_paysafe`
--

LOCK TABLES `plugin_paysafe` WRITE;
/*!40000 ALTER TABLE `plugin_paysafe` DISABLE KEYS */;
/*!40000 ALTER TABLE `plugin_paysafe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugin_paysafe_ipblack`
--

DROP TABLE IF EXISTS `plugin_paysafe_ipblack`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugin_paysafe_ipblack` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(255) DEFAULT NULL,
  `create_at` int(11) DEFAULT NULL,
  `scene` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugin_paysafe_ipblack`
--

LOCK TABLES `plugin_paysafe_ipblack` WRITE;
/*!40000 ALTER TABLE `plugin_paysafe_ipblack` DISABLE KEYS */;
/*!40000 ALTER TABLE `plugin_paysafe_ipblack` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugin_paysafe_ipvisit`
--

DROP TABLE IF EXISTS `plugin_paysafe_ipvisit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugin_paysafe_ipvisit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(255) DEFAULT NULL,
  `create_at` int(11) DEFAULT NULL,
  `scene` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugin_paysafe_ipvisit`
--

LOCK TABLES `plugin_paysafe_ipvisit` WRITE;
/*!40000 ALTER TABLE `plugin_paysafe_ipvisit` DISABLE KEYS */;
/*!40000 ALTER TABLE `plugin_paysafe_ipvisit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugin_poolauth`
--

DROP TABLE IF EXISTS `plugin_poolauth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugin_poolauth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `status` tinyint(3) DEFAULT '0',
  `create_at` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugin_poolauth`
--

LOCK TABLES `plugin_poolauth` WRITE;
/*!40000 ALTER TABLE `plugin_poolauth` DISABLE KEYS */;
/*!40000 ALTER TABLE `plugin_poolauth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugin_punish`
--

DROP TABLE IF EXISTS `plugin_punish`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugin_punish` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `complaint_count` int(11) DEFAULT '0' COMMENT '用于累积',
  `order_count` int(11) DEFAULT '0',
  `update_at` int(11) DEFAULT NULL,
  `history_count` int(11) DEFAULT '0',
  `history_money` decimal(10,3) DEFAULT '0.000',
  `is_white` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugin_punish`
--

LOCK TABLES `plugin_punish` WRITE;
/*!40000 ALTER TABLE `plugin_punish` DISABLE KEYS */;
/*!40000 ALTER TABLE `plugin_punish` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugin_shopdiy`
--

DROP TABLE IF EXISTS `plugin_shopdiy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugin_shopdiy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `theme_id` int(11) DEFAULT NULL,
  `update_at` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugin_shopdiy`
--

LOCK TABLES `plugin_shopdiy` WRITE;
/*!40000 ALTER TABLE `plugin_shopdiy` DISABLE KEYS */;
INSERT INTO `plugin_shopdiy` VALUES (1,1,0,NULL),(2,2,0,NULL);
/*!40000 ALTER TABLE `plugin_shopdiy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugin_shopdiy_theme`
--

DROP TABLE IF EXISTS `plugin_shopdiy_theme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugin_shopdiy_theme` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `resource` text,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `user_id` int(11) DEFAULT '0',
  `update_at` int(11) DEFAULT NULL,
  `resource_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0视频 1图片',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugin_shopdiy_theme`
--

LOCK TABLES `plugin_shopdiy_theme` WRITE;
/*!40000 ALTER TABLE `plugin_shopdiy_theme` DISABLE KEYS */;
INSERT INTO `plugin_shopdiy_theme` VALUES (1,'萝莉剑豪','http://alimov2.a.yximgs.com/upic/2021/04/13/16/BMjAyMTA0MTMxNjQxMzRfMjMzNDMxODUwNF80Nzc1MTk4NDMxMl8wXzM=_B2b2563ac973ac1e901783dfc9539c244.mp4',1,0,1618318475,0),(2,'慵懒','http://alimov2.a.yximgs.com/upic/2021/04/13/18/BMjAyMTA0MTMxODAyNDVfMjMzNDMxODUwNF80Nzc1NjIxMjIyNl8wXzM=_Bdce2231096b349a67d9bca3f34e5f118.mp4',1,0,1618318316,0),(3,'猫','http://jsmov2.a.yximgs.com/upic/2021/04/13/21/BMjAyMTA0MTMyMTEwMTNfMjMzNDMxODUwNF80Nzc2ODM2MDk2OF8wXzM=_Ba43228b62796ca6566428f7348cb6236.mp4',1,0,1618319477,0),(4,'極楽浄土','http://jsmov.a.yximgs.com/upic/2021/04/13/21/BMjAyMTA0MTMyMTM5MDlfMjMzNDMxODUwNF80Nzc3MDMwNTU0NV8wXzM=_Bd4f298d63510af0d6e46064025ea14d3.mp4',1,0,1618321334,0),(5,'赛博朋克','http://alimov6.a.yximgs.com/upic/2021/04/13/21/BMjAyMTA0MTMyMTU5MjRfMjMzNDMxODUwNF80Nzc3MTU2MDg3MF8wXzM=_B3090c0da1165cd7b56e989e207654aeb.mp4',1,0,1618322824,0),(6,'SSOATV','http://bdmov.a.yximgs.com/upic/2021/04/13/22/BMjAyMTA0MTMyMjIyMDhfMjMzNDMxODUwNF80Nzc3Mjg0NjI3N18wXzM=_B8bf1093a78a090540b0e688dbaf00b6c.mp4',1,0,1618323774,0),(7,'Futari','http://bdmov.a.yximgs.com/upic/2021/04/13/22/BMjAyMTA0MTMyMjMwNTlfMjMzNDMxODUwNF80Nzc3MzMwNjI5NF8wXzM=_B241bba725af2df3290c0068c45e7409c.mp4',1,0,1618324321,0),(8,'Reimu灵梦','http://alimov2.a.yximgs.com/upic/2021/04/13/22/BMjAyMTA0MTMyMjM5MTZfMjMzNDMxODUwNF80Nzc3MzcxMzk0Nl8wXzM=_B27f967d66ddc5795ede6709fa65fbc75.mp4',1,0,1618324837,0),(9,'流浪地球','http://alimov2.a.yximgs.com/upic/2021/04/13/22/BMjAyMTA0MTMyMjQ4NTdfMjMzNDMxODUwNF80Nzc3NDE2MTQ4MF8wXzM=_Bd07bdb8f0192eff6906a479bfb639a08.mp4',1,0,1618325390,0),(10,'少女前线','http://jsmov2.a.yximgs.com/upic/2021/04/13/22/BMjAyMTA0MTMyMjU3MTFfMjMzNDMxODUwNF80Nzc3NDUxODY5Nl8wXzM=_Be4618ff25c0f488d36a98f779e9100eb.mp4',1,0,1618325902,0),(11,'鲸落','http://jsmov2.a.yximgs.com/upic/2021/04/13/23/BMjAyMTA0MTMyMzA5MDVfMjMzNDMxODUwNF80Nzc3NDk5MzYzNV8wXzM=_B5e925390057adceeb80fb742d906dd17.mp4',1,0,1618326578,0);
/*!40000 ALTER TABLE `plugin_shopdiy_theme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugin_tradetask`
--

DROP TABLE IF EXISTS `plugin_tradetask`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugin_tradetask` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `target` decimal(10,2) NOT NULL DEFAULT '0.00',
  `reward` decimal(10,2) NOT NULL DEFAULT '0.00',
  `duration` int(11) NOT NULL DEFAULT '0',
  `desc` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugin_tradetask`
--

LOCK TABLES `plugin_tradetask` WRITE;
/*!40000 ALTER TABLE `plugin_tradetask` DISABLE KEYS */;
INSERT INTO `plugin_tradetask` VALUES (1,'青铜流水奖励',15000.00,108.00,30,'商户在一个月内完成任务即可获得108现金红包奖励'),(2,'白银流水挑战',35000.00,208.00,30,'商户在一个月内完成任务即可获得208现金红包奖励'),(3,'王者流水奖励',80000.00,388.00,30,'商户在一个月内完成任务即可获得388现金红包奖励'),(4,'至尊流水奖励',180000.00,888.00,30,'商户在一个月内完成任务即可获得888现金红包奖励');
/*!40000 ALTER TABLE `plugin_tradetask` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugin_tradetask_order`
--

DROP TABLE IF EXISTS `plugin_tradetask_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugin_tradetask_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `task_id` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0未完成 1已完成  -1放弃',
  `expire_at` int(11) DEFAULT NULL,
  `create_at` int(11) DEFAULT '0',
  `success_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugin_tradetask_order`
--

LOCK TABLES `plugin_tradetask_order` WRITE;
/*!40000 ALTER TABLE `plugin_tradetask_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `plugin_tradetask_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL COMMENT '通道名称',
  `code` varchar(50) NOT NULL COMMENT '通道代码',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态 1 开启 0 关闭',
  `polling` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '接口模式 0单独 1轮询',
  `channel_id` int(10) unsigned NOT NULL,
  `weight` text NOT NULL COMMENT '权重',
  `paytype` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '支付类型 1 微信扫码 2 微信公众号 3 支付宝扫码 4 支付宝手机 5 网银支付 6',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=908 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (901,'微信公众号','WXJSAPI',0,0,0,'[]',2),(902,'微信扫码支付','WXSCAN',0,0,0,'[]',1),(903,'支付宝扫码支付','ALISCAN',0,0,14,'[]',3),(904,'支付宝手机','ALIWAP',0,0,15,'[]',4),(907,'网银支付','DBANK',0,0,0,'[]',5);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proxy`
--

DROP TABLE IF EXISTS `proxy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proxy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户id',
  `pid` int(11) NOT NULL COMMENT '上级代理id',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态 0:待审核  1:已审核 -1:拒绝',
  `qq` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proxy`
--

LOCK TABLES `proxy` WRITE;
/*!40000 ALTER TABLE `proxy` DISABLE KEYS */;
/*!40000 ALTER TABLE `proxy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rate_group`
--

DROP TABLE IF EXISTS `rate_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rate_group` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(20) NOT NULL COMMENT '分组名',
  `create_at` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `delete_at` int(10) unsigned DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='费率分组表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rate_group`
--

LOCK TABLES `rate_group` WRITE;
/*!40000 ALTER TABLE `rate_group` DISABLE KEYS */;
INSERT INTO `rate_group` VALUES (1,'默认分组',1619544090,NULL);
/*!40000 ALTER TABLE `rate_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rate_group_rule`
--

DROP TABLE IF EXISTS `rate_group_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rate_group_rule` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL COMMENT '分组 ID',
  `channel_id` int(11) NOT NULL COMMENT '渠道 ID',
  `rate` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '渠道费率',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态 1：开启 0：关闭',
  PRIMARY KEY (`id`),
  KEY `group_id` (`group_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='分组费率规则';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rate_group_rule`
--

LOCK TABLES `rate_group_rule` WRITE;
/*!40000 ALTER TABLE `rate_group_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `rate_group_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rate_group_user`
--

DROP TABLE IF EXISTS `rate_group_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rate_group_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL COMMENT '分组 ID',
  `user_id` int(11) NOT NULL COMMENT '用户 ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='分组内用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rate_group_user`
--

LOCK TABLES `rate_group_user` WRITE;
/*!40000 ALTER TABLE `rate_group_user` DISABLE KEYS */;
INSERT INTO `rate_group_user` VALUES (1,1,1),(2,1,2);
/*!40000 ALTER TABLE `rate_group_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `request_log`
--

DROP TABLE IF EXISTS `request_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `request_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `request_server` text NOT NULL,
  `request_post` text NOT NULL,
  `request_get` text NOT NULL,
  `input` text NOT NULL,
  `type` varchar(200) NOT NULL,
  `result` text NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request_log`
--

LOCK TABLES `request_log` WRITE;
/*!40000 ALTER TABLE `request_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `request_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `safwl_accpass`
--

DROP TABLE IF EXISTS `safwl_accpass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `safwl_accpass` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pass` varchar(50) DEFAULT NULL,
  `remarks` varchar(200) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `safwl_accpass`
--

LOCK TABLES `safwl_accpass` WRITE;
/*!40000 ALTER TABLE `safwl_accpass` DISABLE KEYS */;
/*!40000 ALTER TABLE `safwl_accpass` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `safwl_accpasslogin`
--

DROP TABLE IF EXISTS `safwl_accpasslogin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `safwl_accpasslogin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL,
  `pass` varchar(30) DEFAULT NULL,
  `ip` varchar(30) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `safwl_accpasslogin`
--

LOCK TABLES `safwl_accpasslogin` WRITE;
/*!40000 ALTER TABLE `safwl_accpasslogin` DISABLE KEYS */;
/*!40000 ALTER TABLE `safwl_accpasslogin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `safwl_blacklist`
--

DROP TABLE IF EXISTS `safwl_blacklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `safwl_blacklist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `data` varchar(200) DEFAULT NULL,
  `remarks` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `safwl_blacklist`
--

LOCK TABLES `safwl_blacklist` WRITE;
/*!40000 ALTER TABLE `safwl_blacklist` DISABLE KEYS */;
/*!40000 ALTER TABLE `safwl_blacklist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `safwl_config`
--

DROP TABLE IF EXISTS `safwl_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `safwl_config` (
  `safwl_k` varchar(255) NOT NULL DEFAULT '',
  `safwl_v` text,
  PRIMARY KEY (`safwl_k`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `safwl_config`
--

LOCK TABLES `safwl_config` WRITE;
/*!40000 ALTER TABLE `safwl_config` DISABLE KEYS */;
INSERT INTO `safwl_config` VALUES ('title','SAF个人发卡网'),('keywords','个人发卡网,SAF发卡网'),('description','QQ：xxx，下载地址：http://www.xqdsw.xyz/'),('zzqq','000000'),('notice2','付款后按提示点击确定跳转到提取页面，不可提前关闭窗口！否则无法提取到卡密！'),('notice3','提取码是订单编号 或者 您的联系方式！'),('notice1','提取卡密后请尽快激活使用或保存好，系统定期清除被提取的卡密'),('foot','Copyright © 2018 SAF发卡网'),('dd_notice','1.联系方式也可以作为你的提卡凭证<br>2.必须等待付款完成自动跳转，不可提前关闭页面，否则会导致订单失效，后果自负'),('admin','admin'),('pwd','f3b4e3b975e0484835e90514f8318e61'),('web_url',''),('payapi','2'),('epay_id',''),('epay_key',''),('showKc','1'),('CC_Defender','2'),('txprotect','2'),('qqtz','0'),('sqlv','1064'),('cyapi','1'),('cyid',''),('cykey',''),('cygg',''),('syslog','1'),('showImgs','1'),('submit','修改'),('switch_alipay','1'),('switch_wxpay','1'),('switch_qqpay','1'),('switch_tenpay','0'),('epay_url',''),('ftitle','购买发卡网：http://www.xqdsw.xyz/'),('view','default'),('sendemail','0'),('mail_stmp','smtp.qq.com'),('mail_port','465'),('mail_name','xxxx@qq.com'),('mail_pwd',''),('mail_title','SAF发卡网'),('tradenotype','2'),('paypasstype','2'),('isaccvtion','0'),('accvtion_notice','<b>请勿共享自己的访问密码。</b><br>\r\n<b>泄漏密码一律停封。</b><br>'),('accvtion_notice2',' <b>请保存好自己的密码不要泄露！后台IP记录。</b>\r\n                       \r\n			<br>\r\n                    '),('mail_content','您已成功购买商品[{@goodsname}],订单编号：{@out_trade_no},您的卡密为：{@kmlist}。'),('sendphonedx','0'),('dx_appid',''),('dx_appkey',''),('dx_content','【订单信息】[{@qqnickname}]您好，恭喜您下单成功！您的订单编号为：{@out_trade_no},卡密信息为：{@kmlist}！'),('coupon_ka_num','8'),('iscoupon','0');
/*!40000 ALTER TABLE `safwl_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `safwl_coupon`
--

DROP TABLE IF EXISTS `safwl_coupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `safwl_coupon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_remarks` varchar(100) DEFAULT NULL,
  `coupon_ka` varchar(100) DEFAULT NULL,
  `coupon_addtime` datetime DEFAULT NULL,
  `coupon_endtime` datetime DEFAULT NULL,
  `coupon_sytime` datetime DEFAULT NULL,
  `coupon_type` int(11) DEFAULT '1',
  `coupon_value` double(10,2) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `coupon_goods_id` int(11) DEFAULT '0',
  `coupon_status` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `safwl_coupon`
--

LOCK TABLES `safwl_coupon` WRITE;
/*!40000 ALTER TABLE `safwl_coupon` DISABLE KEYS */;
/*!40000 ALTER TABLE `safwl_coupon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `safwl_goods`
--

DROP TABLE IF EXISTS `safwl_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `safwl_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gName` varchar(255) DEFAULT NULL,
  `gInfo` text,
  `imgs` varchar(110) DEFAULT NULL,
  `tpId` int(11) NOT NULL,
  `price` float DEFAULT NULL,
  `state` int(11) DEFAULT '1',
  `sotr` int(4) DEFAULT '1',
  `sales` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `safwl_goods`
--

LOCK TABLES `safwl_goods` WRITE;
/*!40000 ALTER TABLE `safwl_goods` DISABLE KEYS */;
/*!40000 ALTER TABLE `safwl_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `safwl_km`
--

DROP TABLE IF EXISTS `safwl_km`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `safwl_km` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gid` int(11) NOT NULL,
  `km` varchar(100) DEFAULT NULL,
  `benTime` datetime DEFAULT NULL,
  `endTime` datetime DEFAULT NULL,
  `out_trade_no` varchar(100) DEFAULT NULL,
  `trade_no` varchar(100) DEFAULT NULL,
  `rel` varchar(50) DEFAULT NULL,
  `stat` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `safwl_km`
--

LOCK TABLES `safwl_km` WRITE;
/*!40000 ALTER TABLE `safwl_km` DISABLE KEYS */;
/*!40000 ALTER TABLE `safwl_km` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `safwl_order`
--

DROP TABLE IF EXISTS `safwl_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `safwl_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `out_trade_no` varchar(100) DEFAULT NULL,
  `trade_no` varchar(100) DEFAULT NULL,
  `md5_trade_no` varchar(100) DEFAULT NULL,
  `paypass` varchar(100) DEFAULT NULL,
  `gid` int(11) DEFAULT NULL,
  `money` float DEFAULT NULL,
  `rel` varchar(30) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `benTime` datetime DEFAULT NULL,
  `endTime` datetime DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `coupon_id` varchar(100) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `sta` int(11) DEFAULT '0',
  `sendE` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `safwl_order`
--

LOCK TABLES `safwl_order` WRITE;
/*!40000 ALTER TABLE `safwl_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `safwl_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `safwl_syslog`
--

DROP TABLE IF EXISTS `safwl_syslog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `safwl_syslog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `log_name` varchar(20) DEFAULT NULL,
  `log_time` datetime DEFAULT NULL,
  `log_txt` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `safwl_syslog`
--

LOCK TABLES `safwl_syslog` WRITE;
/*!40000 ALTER TABLE `safwl_syslog` DISABLE KEYS */;
/*!40000 ALTER TABLE `safwl_syslog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `safwl_type`
--

DROP TABLE IF EXISTS `safwl_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `safwl_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tName` varchar(100) DEFAULT NULL,
  `sort` int(11) DEFAULT '0',
  `state` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `safwl_type`
--

LOCK TABLES `safwl_type` WRITE;
/*!40000 ALTER TABLE `safwl_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `safwl_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_iplist`
--

DROP TABLE IF EXISTS `shop_iplist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop_iplist` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ip` varchar(255) DEFAULT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `create_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_iplist`
--

LOCK TABLES `shop_iplist` WRITE;
/*!40000 ALTER TABLE `shop_iplist` DISABLE KEYS */;
INSERT INTO `shop_iplist` VALUES (1,'117.176.187.158',1,1672659101),(2,'117.176.187.158',1,1672659134),(3,'223.96.57.65',2,1686838891),(4,'223.96.57.65',2,1686839099),(5,'27.115.124.118',2,1686839123),(6,'223.96.57.65',2,1686839144),(7,'223.96.61.178',2,1687789229),(8,'223.96.61.178',2,1687789252),(9,'223.96.61.178',2,1687789277),(10,'223.96.61.178',2,1687789307);
/*!40000 ALTER TABLE `shop_iplist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shua_account`
--

DROP TABLE IF EXISTS `shua_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shua_account` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL,
  `permission` text,
  `addtime` datetime DEFAULT NULL,
  `lasttime` datetime DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shua_account`
--

LOCK TABLES `shua_account` WRITE;
/*!40000 ALTER TABLE `shua_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `shua_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shua_addons`
--

DROP TABLE IF EXISTS `shua_addons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shua_addons` (
  `addon_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) NOT NULL COMMENT '插件名或标识',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '中文名',
  `description` text COMMENT '插件描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `config` text COMMENT '配置',
  `author` varchar(40) DEFAULT '' COMMENT '作者',
  `version` varchar(20) DEFAULT '' COMMENT '版本号',
  `create_time` datetime NOT NULL COMMENT '安装时间',
  `data_flag` tinyint(4) DEFAULT '1',
  `is_config` tinyint(4) DEFAULT '0',
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`addon_id`),
  UNIQUE KEY `name` (`name`) USING HASH
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shua_addons`
--

LOCK TABLES `shua_addons` WRITE;
/*!40000 ALTER TABLE `shua_addons` DISABLE KEYS */;
/*!40000 ALTER TABLE `shua_addons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shua_admin_member`
--

DROP TABLE IF EXISTS `shua_admin_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shua_admin_member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(128) NOT NULL COMMENT '用户名',
  `password` varchar(64) NOT NULL COMMENT '密码 sha256(sha256(password)+salt)',
  `salt` varchar(6) NOT NULL COMMENT '6位数的散列',
  `whiteUrl` text COMMENT '白名单列表',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shua_admin_member`
--

LOCK TABLES `shua_admin_member` WRITE;
/*!40000 ALTER TABLE `shua_admin_member` DISABLE KEYS */;
/*!40000 ALTER TABLE `shua_admin_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shua_apps`
--

DROP TABLE IF EXISTS `shua_apps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shua_apps` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `zid` int(11) unsigned NOT NULL DEFAULT '1',
  `taskid` int(11) unsigned NOT NULL DEFAULT '0',
  `domain` varchar(128) NOT NULL,
  `name` varchar(128) DEFAULT NULL,
  `icon` varchar(256) DEFAULT NULL,
  `package` varchar(128) DEFAULT NULL,
  `android_url` varchar(256) DEFAULT NULL,
  `ios_url` varchar(256) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `domain` (`domain`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shua_apps`
--

LOCK TABLES `shua_apps` WRITE;
/*!40000 ALTER TABLE `shua_apps` DISABLE KEYS */;
/*!40000 ALTER TABLE `shua_apps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shua_article`
--

DROP TABLE IF EXISTS `shua_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shua_article` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `zid` int(11) unsigned NOT NULL DEFAULT '1',
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `keywords` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `color` varchar(20) DEFAULT NULL,
  `addtime` datetime NOT NULL,
  `count` int(11) unsigned NOT NULL DEFAULT '0',
  `top` tinyint(1) NOT NULL DEFAULT '0',
  `active` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shua_article`
--

LOCK TABLES `shua_article` WRITE;
/*!40000 ALTER TABLE `shua_article` DISABLE KEYS */;
/*!40000 ALTER TABLE `shua_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shua_article_list`
--

DROP TABLE IF EXISTS `shua_article_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shua_article_list` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `title` varchar(128) NOT NULL COMMENT '文章标题',
  `content` text COMMENT '文章内容',
  `author` varchar(128) NOT NULL COMMENT '作者名称',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '文章状态 0 不发布 1 发布',
  `imageUrl` varchar(500) DEFAULT NULL COMMENT '文章缩略图',
  `seoTitle` varchar(255) DEFAULT NULL COMMENT 'SEO 标题',
  `seoKeywords` varchar(255) DEFAULT NULL COMMENT 'SEO 关键词',
  `seoDescription` text COMMENT 'SEO 描述',
  `createTime` datetime NOT NULL COMMENT '发布时间',
  PRIMARY KEY (`id`),
  KEY `status` (`status`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shua_article_list`
--

LOCK TABLES `shua_article_list` WRITE;
/*!40000 ALTER TABLE `shua_article_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `shua_article_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shua_cache`
--

DROP TABLE IF EXISTS `shua_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shua_cache` (
  `k` varchar(32) NOT NULL,
  `v` longtext,
  PRIMARY KEY (`k`) USING HASH
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shua_cache`
--

LOCK TABLES `shua_cache` WRITE;
/*!40000 ALTER TABLE `shua_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `shua_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shua_cart`
--

DROP TABLE IF EXISTS `shua_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shua_cart` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userid` varchar(32) NOT NULL,
  `zid` int(11) unsigned NOT NULL DEFAULT '1',
  `tid` int(11) NOT NULL,
  `input` text NOT NULL,
  `num` int(11) unsigned NOT NULL DEFAULT '1',
  `money` varchar(32) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  `endtime` datetime DEFAULT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shua_cart`
--

LOCK TABLES `shua_cart` WRITE;
/*!40000 ALTER TABLE `shua_cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `shua_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shua_cate`
--

DROP TABLE IF EXISTS `shua_cate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shua_cate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL COMMENT '分类id',
  `tid` int(11) NOT NULL,
  `seo_title` varchar(255) NOT NULL,
  `seo_keywords` varchar(255) NOT NULL,
  `seo_description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shua_cate`
--

LOCK TABLES `shua_cate` WRITE;
/*!40000 ALTER TABLE `shua_cate` DISABLE KEYS */;
/*!40000 ALTER TABLE `shua_cate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shua_class`
--

DROP TABLE IF EXISTS `shua_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shua_class` (
  `cid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `zid` int(11) unsigned NOT NULL DEFAULT '1',
  `sort` int(11) NOT NULL DEFAULT '10',
  `name` varchar(255) NOT NULL,
  `shopimg` text,
  `active` tinyint(2) NOT NULL DEFAULT '0',
  `pay_alipay` int(3) NOT NULL DEFAULT '1',
  `pay_wxpay` int(3) NOT NULL DEFAULT '1',
  `pay_qqpay` int(3) NOT NULL DEFAULT '1',
  `pay_rmb` int(3) NOT NULL DEFAULT '1',
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shua_class`
--

LOCK TABLES `shua_class` WRITE;
/*!40000 ALTER TABLE `shua_class` DISABLE KEYS */;
/*!40000 ALTER TABLE `shua_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shua_config`
--

DROP TABLE IF EXISTS `shua_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shua_config` (
  `k` varchar(32) NOT NULL,
  `v` text,
  PRIMARY KEY (`k`) USING HASH
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shua_config`
--

LOCK TABLES `shua_config` WRITE;
/*!40000 ALTER TABLE `shua_config` DISABLE KEYS */;
INSERT INTO `shua_config` VALUES ('admin_pwd','123456'),('admin_user','admin'),('alipay_api','2'),('anounce','<p><li class=\"list-group-item\"><span class=\"btn btn-danger btn-xs\">1</span> QQ名片赞日刷上万，超快空间人气日刷百万，球球冰红茶CDK超低价销售</li><li class=\"list-group-item\"><span class=\"btn btn-success btn-xs\">2</span> 温馨提示：请勿重复下单哦！必须要等待前面任务订单完成才可以下单！</li><li class=\"list-group-item\"><span class=\"btn btn-info btn-xs\">3</span> 下单之前请一定要看完该商品的注意事项再进行下单！</li><li class=\"list-group-item\"><span class=\"btn btn-warning btn-xs\">4</span> 所有业务全部恢复，都可以正常下单，欢迎尝试，有问题可以联系客服</li><li class=\"list-group-item\"><span class=\"btn btn-primary btn-xs\">5</span> 一般下单后会在1-30分钟内提交到服务器，就让单子来的更猛烈些吧！</li><div class=\"btn-group btn-group-justified\"><a target=\"_blank\" class=\"btn btn-info\" href=\"http://wpa.qq.com/msgrd?v=3&uin=123456&site=qq&menu=yes\"><i class=\"fa fa-qq\"></i>联系客服</a><a target=\"_blank\" class=\"btn btn-warning\" href=\"http://qun.qq.com/join.html\"><i class=\"fa fa-users\"></i> 官方Q群</a><a target=\"_blank\" class=\"btn btn-danger\" href=\"./\"><i class=\"fa fa-cloud-download\"></i> APP下载</a></div></p>'),('bottom','<table class=\"table table-bordered\"><tbody><tr height=\"50\"><td><button type=\"button\" class=\"btn btn-block btn-warning\"><a href=\"\" target=\"_blank\"><span style=\"color:#ffffff\">♚导航♚</span></a></button></td><td><button type=\"button\" class=\"btn btn-block btn-warning\"><a href=\"./\" target=\"_blank\"><span style=\"color:#ffffff\">♚导航♚</span></a></button></td></tr><tr height=\"50\"><td><button type=\"button\" class=\"btn btn-block btn-success\"><a href=\"./\" target=\"_blank\"><span style=\"color:#ffffff\">♚友链♚</span></a></button></td><td><button type=\"button\" class=\"btn btn-block btn-success\"><a href=\"./\" target=\"_blank\"><span style=\"color:#ffffff\">♚友链♚</span></a></button></td></tr></tbody></table>'),('build','2023-04-29'),('cache',''),('captcha_open_free','1'),('captcha_open_reg','1'),('cdnpublic','1'),('chatframe',''),('cishu','3'),('cronkey','932332'),('description','QQ代刷网，专业提供国内网红速方案，帮您走出网红的第一步，我们提供最专业的售前指导，提供最优质的售后服务，给您一个放心的平台！'),('epay_notify_verify','1'),('faka_mail','<b>商品名称：</b> [name]<br/><b>购买时间：</b>[date]<br/><b>以下是你的卡密信息：</b><br/>[kmdata]<br/>----------<br/><b>使用说明：</b><br/>[alert]<br/>----------<br/>QQ代刷网自助下单平台<br/>[domain]'),('fenzhan_buy','1'),('fenzhan_expiry','12'),('fenzhan_free','0'),('fenzhan_price','10'),('fenzhan_price2','20'),('fenzhan_tixian','0'),('gg_search','<span class=\"label label-primary\">待处理</span>说明正在努力提交到服务器！<p></p><p></p><span class=\"label label-success\">已完成</span>并不是刷完了只是开始刷了！<p></p><p></p><span class=\"label label-warning\">处理中</span>已经开始为您开单 请耐心等！<p></p><p></p><span class=\"label label-danger\">有异常</span>下单信息有误，联系客服处理！'),('gift_open','0'),('kaurl',''),('keywords','QQ代刷网,QQ云商城,代刷网,自助下单,网红助手,网红速成'),('kfqq','123456789'),('mail_port','465'),('mail_smtp','smtp.qq.com'),('modal',''),('order_set','0'),('pricejk_time','600'),('qiandao_day','15'),('qiandao_mult','1.05'),('qiandao_reward','0.02'),('qqpay_api','2'),('qq_status','1'),('search_open','1'),('shoppingcart','1'),('sitename','QQ代刷网'),('style','1'),('syskey','xQVxAKSf3jew8u2nzCvbtPEbzk7FzWzI'),('template','simple'),('tenpay_api','2'),('tixian_min','10'),('tixian_rate','90'),('tongji_time','300'),('ui_background','3'),('user_open','1'),('verify_open','1'),('version','8.9.5'),('wxpay_api','2');
/*!40000 ALTER TABLE `shua_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shua_faka`
--

DROP TABLE IF EXISTS `shua_faka`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shua_faka` (
  `kid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tid` int(11) unsigned NOT NULL,
  `km` varchar(255) DEFAULT NULL,
  `pw` varchar(255) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  `usetime` datetime DEFAULT NULL,
  `orderid` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`kid`),
  KEY `tid` (`tid`) USING BTREE,
  KEY `orderid` (`orderid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shua_faka`
--

LOCK TABLES `shua_faka` WRITE;
/*!40000 ALTER TABLE `shua_faka` DISABLE KEYS */;
/*!40000 ALTER TABLE `shua_faka` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shua_gift`
--

DROP TABLE IF EXISTS `shua_gift`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shua_gift` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `tid` int(11) unsigned NOT NULL,
  `rate` int(3) NOT NULL,
  `ok` tinyint(1) NOT NULL DEFAULT '0',
  `not` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shua_gift`
--

LOCK TABLES `shua_gift` WRITE;
/*!40000 ALTER TABLE `shua_gift` DISABLE KEYS */;
/*!40000 ALTER TABLE `shua_gift` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shua_giftlog`
--

DROP TABLE IF EXISTS `shua_giftlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shua_giftlog` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `zid` int(11) unsigned NOT NULL DEFAULT '0',
  `tid` int(11) unsigned NOT NULL,
  `gid` int(11) unsigned NOT NULL,
  `userid` varchar(32) NOT NULL,
  `ip` varchar(20) NOT NULL,
  `addtime` datetime DEFAULT NULL,
  `tradeno` varchar(32) DEFAULT NULL,
  `input` varchar(64) DEFAULT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shua_giftlog`
--

LOCK TABLES `shua_giftlog` WRITE;
/*!40000 ALTER TABLE `shua_giftlog` DISABLE KEYS */;
/*!40000 ALTER TABLE `shua_giftlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shua_hooks`
--

DROP TABLE IF EXISTS `shua_hooks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shua_hooks` (
  `hook_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) NOT NULL DEFAULT '' COMMENT '钩子名称',
  `hook_remarks` text NOT NULL COMMENT '描述',
  `hook_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '类型',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `addons` text,
  PRIMARY KEY (`hook_id`),
  UNIQUE KEY `name` (`name`) USING HASH
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shua_hooks`
--

LOCK TABLES `shua_hooks` WRITE;
/*!40000 ALTER TABLE `shua_hooks` DISABLE KEYS */;
INSERT INTO `shua_hooks` VALUES (1,'afterUserLogin','用户登录后',1,'2019-11-19 12:10:25',NULL),(2,'addAdminMenu','在后台页面增加菜单',1,'2019-11-28 16:54:01',NULL),(3,'userTabLabel','用户首页TAB标签',1,'2019-12-03 16:22:14',NULL),(4,'addClassHandle','添加商品分类操作',1,'2019-12-16 14:34:22',NULL),(5,'adminClassPageReady','商品分类页面加载完成后',1,'2019-12-17 14:59:01',NULL),(6,'adminAjaxFunction','调用后台异步函数',2,'2019-12-17 16:44:56',NULL),(7,'userAjaxFunction','调用前台异步函数',2,'2019-12-17 16:46:01',NULL),(8,'publicAjaxFunction','调用公共异步函数',2,'2019-12-17 16:47:08',NULL),(9,'homeLoaded','首页加载后',1,'2019-12-18 10:30:55',NULL),(10,'beforeOrderSubmit','订单提交之前',1,'2019-12-19 14:28:27',NULL),(11,'beforeCartOrderSubmit','购物车订单提交之前',1,'2019-12-19 15:19:46',NULL),(12,'productEditDetail','商品编辑详细信息',1,'2019-12-19 15:55:56',NULL),(13,'afterProductEdit','商品编辑之后',1,'2019-12-19 16:26:28',NULL),(14,'beforeBuyCommodityHome','首页购买商品之前',1,'2020-01-17 11:01:46',NULL),(15,'beforeOrderCancel','订单取消之前',1,'2020-01-17 18:19:53',NULL);
/*!40000 ALTER TABLE `shua_hooks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shua_invite`
--

DROP TABLE IF EXISTS `shua_invite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shua_invite` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `input` text,
  `tid` int(11) unsigned NOT NULL DEFAULT '0',
  `qq` varchar(20) NOT NULL DEFAULT '',
  `key` varchar(30) NOT NULL DEFAULT '',
  `ip` varchar(25) NOT NULL DEFAULT '',
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`) USING HASH
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shua_invite`
--

LOCK TABLES `shua_invite` WRITE;
/*!40000 ALTER TABLE `shua_invite` DISABLE KEYS */;
/*!40000 ALTER TABLE `shua_invite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shua_invite_rules`
--

DROP TABLE IF EXISTS `shua_invite_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shua_invite_rules` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tid` int(11) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '分享类型：0：下单金额，1：累计访问',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0：关闭，1：开启',
  `is_default` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否默认推广商品，0：否，1：是',
  `rule_value` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '规则的值：type为0：金额，1：累计访问数',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `un_tid` (`tid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shua_invite_rules`
--

LOCK TABLES `shua_invite_rules` WRITE;
/*!40000 ALTER TABLE `shua_invite_rules` DISABLE KEYS */;
/*!40000 ALTER TABLE `shua_invite_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shua_invitelog`
--

DROP TABLE IF EXISTS `shua_invitelog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shua_invitelog` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nid` int(11) unsigned NOT NULL,
  `zid` int(11) unsigned NOT NULL DEFAULT '1',
  `date` datetime DEFAULT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `orderid` int(11) unsigned DEFAULT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shua_invitelog`
--

LOCK TABLES `shua_invitelog` WRITE;
/*!40000 ALTER TABLE `shua_invitelog` DISABLE KEYS */;
/*!40000 ALTER TABLE `shua_invitelog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shua_inviteshop`
--

DROP TABLE IF EXISTS `shua_inviteshop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shua_inviteshop` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tid` int(11) unsigned NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `times` tinyint(1) NOT NULL DEFAULT '0',
  `value` decimal(10,2) NOT NULL DEFAULT '0.00',
  `sort` int(11) NOT NULL DEFAULT '10',
  `addtime` datetime DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `tid` (`tid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shua_inviteshop`
--

LOCK TABLES `shua_inviteshop` WRITE;
/*!40000 ALTER TABLE `shua_inviteshop` DISABLE KEYS */;
/*!40000 ALTER TABLE `shua_inviteshop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shua_keyword`
--

DROP TABLE IF EXISTS `shua_keyword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shua_keyword` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `keyword_name` varchar(255) NOT NULL,
  `keyword_url` varchar(255) NOT NULL,
  `addtime` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shua_keyword`
--

LOCK TABLES `shua_keyword` WRITE;
/*!40000 ALTER TABLE `shua_keyword` DISABLE KEYS */;
/*!40000 ALTER TABLE `shua_keyword` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shua_kms`
--

DROP TABLE IF EXISTS `shua_kms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shua_kms` (
  `kid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tid` int(11) unsigned NOT NULL,
  `zid` int(11) unsigned NOT NULL DEFAULT '1',
  `km` varchar(255) NOT NULL,
  `value` int(11) unsigned NOT NULL DEFAULT '0',
  `addtime` timestamp NULL DEFAULT NULL,
  `user` varchar(20) NOT NULL DEFAULT '0',
  `usetime` timestamp NULL DEFAULT NULL,
  `money` varchar(32) DEFAULT NULL,
  `orderid` int(11) unsigned DEFAULT '0',
  PRIMARY KEY (`kid`),
  KEY `tid` (`tid`) USING BTREE,
  KEY `zid` (`zid`) USING BTREE,
  KEY `orderid` (`orderid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shua_kms`
--

LOCK TABLES `shua_kms` WRITE;
/*!40000 ALTER TABLE `shua_kms` DISABLE KEYS */;
/*!40000 ALTER TABLE `shua_kms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shua_logs`
--

DROP TABLE IF EXISTS `shua_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shua_logs` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `action` varchar(32) NOT NULL,
  `param` varchar(255) NOT NULL,
  `result` text,
  `addtime` datetime DEFAULT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shua_logs`
--

LOCK TABLES `shua_logs` WRITE;
/*!40000 ALTER TABLE `shua_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `shua_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shua_message`
--

DROP TABLE IF EXISTS `shua_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shua_message` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `zid` int(11) unsigned NOT NULL DEFAULT '1',
  `type` int(1) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `color` varchar(20) DEFAULT NULL,
  `addtime` datetime NOT NULL,
  `count` int(11) unsigned NOT NULL DEFAULT '0',
  `active` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shua_message`
--

LOCK TABLES `shua_message` WRITE;
/*!40000 ALTER TABLE `shua_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `shua_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shua_orders`
--

DROP TABLE IF EXISTS `shua_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shua_orders` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` varchar(32) DEFAULT '0',
  `tid` int(11) NOT NULL DEFAULT '0',
  `zid` int(11) unsigned NOT NULL DEFAULT '1',
  `input` varchar(500) NOT NULL,
  `input2` varchar(500) DEFAULT NULL,
  `input3` varchar(500) DEFAULT NULL,
  `input4` varchar(500) DEFAULT NULL,
  `input5` varchar(500) DEFAULT NULL,
  `value` int(11) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(2) NOT NULL DEFAULT '0',
  `djzt` tinyint(2) NOT NULL DEFAULT '0',
  `djorder` varchar(32) DEFAULT NULL,
  `url` varchar(32) DEFAULT NULL,
  `result` text,
  `userid` varchar(32) DEFAULT NULL,
  `tradeno` varchar(32) DEFAULT NULL,
  `money` decimal(10,2) NOT NULL DEFAULT '0.00',
  `addtime` datetime DEFAULT NULL,
  `endtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `zid` (`zid`) USING BTREE,
  KEY `input` (`input`) USING BTREE,
  KEY `userid` (`userid`) USING BTREE,
  KEY `tradeno` (`tradeno`) USING BTREE,
  KEY `id` (`id`) USING BTREE,
  KEY `tid` (`tid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shua_orders`
--

LOCK TABLES `shua_orders` WRITE;
/*!40000 ALTER TABLE `shua_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `shua_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shua_pay`
--

DROP TABLE IF EXISTS `shua_pay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shua_pay` (
  `trade_no` varchar(64) NOT NULL,
  `is_red_pack` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '使用红包抵扣订单',
  `discount_money` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '红包抵扣金额',
  `type` varchar(20) DEFAULT NULL,
  `zid` int(11) unsigned NOT NULL DEFAULT '1',
  `tid` int(11) NOT NULL,
  `input` text NOT NULL,
  `num` int(11) unsigned NOT NULL DEFAULT '1',
  `addtime` datetime DEFAULT NULL,
  `endtime` datetime DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  `money` varchar(32) DEFAULT NULL,
  `ip` varchar(20) DEFAULT NULL,
  `userid` varchar(32) DEFAULT NULL,
  `inviteid` int(11) unsigned DEFAULT NULL,
  `domain` varchar(64) DEFAULT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`trade_no`),
  KEY `tradeNo` (`trade_no`) USING BTREE,
  KEY `zid` (`zid`) USING BTREE,
  KEY `tid` (`tid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shua_pay`
--

LOCK TABLES `shua_pay` WRITE;
/*!40000 ALTER TABLE `shua_pay` DISABLE KEYS */;
/*!40000 ALTER TABLE `shua_pay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shua_points`
--

DROP TABLE IF EXISTS `shua_points`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shua_points` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `zid` int(11) unsigned NOT NULL DEFAULT '0',
  `action` varchar(255) NOT NULL,
  `point` decimal(10,2) NOT NULL DEFAULT '0.00',
  `bz` varchar(1024) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  `orderid` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `zid` (`zid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shua_points`
--

LOCK TABLES `shua_points` WRITE;
/*!40000 ALTER TABLE `shua_points` DISABLE KEYS */;
/*!40000 ALTER TABLE `shua_points` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shua_price`
--

DROP TABLE IF EXISTS `shua_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shua_price` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `zid` int(11) unsigned NOT NULL DEFAULT '0',
  `kind` tinyint(2) NOT NULL DEFAULT '0' COMMENT '0 倍数 1 价格',
  `name` varchar(255) NOT NULL,
  `p_0` decimal(8,2) NOT NULL DEFAULT '0.00',
  `p_1` decimal(8,2) NOT NULL DEFAULT '0.00',
  `p_2` decimal(8,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `zid` (`zid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shua_price`
--

LOCK TABLES `shua_price` WRITE;
/*!40000 ALTER TABLE `shua_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `shua_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shua_qiandao`
--

DROP TABLE IF EXISTS `shua_qiandao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shua_qiandao` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `zid` int(11) unsigned NOT NULL DEFAULT '1',
  `qq` varchar(20) DEFAULT NULL,
  `reward` decimal(10,2) NOT NULL DEFAULT '0.00',
  `date` date NOT NULL,
  `time` datetime NOT NULL,
  `continue` int(11) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `zid` (`zid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shua_qiandao`
--

LOCK TABLES `shua_qiandao` WRITE;
/*!40000 ALTER TABLE `shua_qiandao` DISABLE KEYS */;
/*!40000 ALTER TABLE `shua_qiandao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shua_sendcode`
--

DROP TABLE IF EXISTS `shua_sendcode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shua_sendcode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0邮箱 1手机',
  `mode` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0注册 1找回 2改绑',
  `code` varchar(32) NOT NULL,
  `to` varchar(32) DEFAULT NULL,
  `time` int(11) NOT NULL,
  `ip` varchar(20) DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shua_sendcode`
--

LOCK TABLES `shua_sendcode` WRITE;
/*!40000 ALTER TABLE `shua_sendcode` DISABLE KEYS */;
/*!40000 ALTER TABLE `shua_sendcode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shua_shequ`
--

DROP TABLE IF EXISTS `shua_shequ`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shua_shequ` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `paypwd` varchar(255) DEFAULT NULL,
  `paytype` tinyint(1) NOT NULL DEFAULT '0',
  `type` tinyint(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shua_shequ`
--

LOCK TABLES `shua_shequ` WRITE;
/*!40000 ALTER TABLE `shua_shequ` DISABLE KEYS */;
/*!40000 ALTER TABLE `shua_shequ` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shua_site`
--

DROP TABLE IF EXISTS `shua_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shua_site` (
  `zid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `upzid` int(11) unsigned NOT NULL DEFAULT '0',
  `utype` int(1) unsigned NOT NULL DEFAULT '0',
  `power` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `domain` varchar(50) DEFAULT NULL,
  `domain2` varchar(50) DEFAULT NULL,
  `user` varchar(20) NOT NULL,
  `pwd` varchar(32) NOT NULL,
  `rmb` decimal(10,2) NOT NULL DEFAULT '0.00',
  `point` int(11) NOT NULL DEFAULT '0',
  `pay_type` int(1) NOT NULL DEFAULT '0',
  `pay_account` varchar(50) DEFAULT NULL,
  `pay_name` varchar(50) DEFAULT NULL,
  `qq` varchar(12) DEFAULT NULL,
  `qq_openid` varchar(64) NOT NULL DEFAULT '',
  `qq_head_img_url` varchar(255) NOT NULL DEFAULT '',
  `qq_nickname` varchar(255) NOT NULL DEFAULT '',
  `sitename` varchar(80) DEFAULT NULL,
  `title` varchar(80) DEFAULT NULL,
  `keywords` text,
  `description` text,
  `kaurl` varchar(50) DEFAULT NULL,
  `anounce` text,
  `bottom` text,
  `modal` text,
  `alert` text,
  `price` longtext,
  `iprice` text,
  `ktfz_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `ktfz_price2` decimal(10,2) NOT NULL DEFAULT '0.00',
  `ktfz_domain` text,
  `addtime` datetime DEFAULT NULL,
  `lasttime` datetime DEFAULT NULL,
  `endtime` datetime DEFAULT NULL,
  `template` varchar(64) DEFAULT NULL,
  `msgread` varchar(255) DEFAULT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '0',
  `site_status` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `class` text,
  PRIMARY KEY (`zid`),
  KEY `domain` (`domain`) USING BTREE,
  KEY `domain2` (`domain2`) USING BTREE,
  KEY `user` (`user`) USING BTREE,
  KEY `pwd` (`pwd`) USING BTREE,
  KEY `qq` (`qq`) USING BTREE,
  KEY `upzid` (`upzid`) USING BTREE,
  KEY `power` (`power`) USING BTREE,
  KEY `qq_openid` (`qq_openid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shua_site`
--

LOCK TABLES `shua_site` WRITE;
/*!40000 ALTER TABLE `shua_site` DISABLE KEYS */;
/*!40000 ALTER TABLE `shua_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shua_site_attr`
--

DROP TABLE IF EXISTS `shua_site_attr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shua_site_attr` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `zid` int(11) unsigned NOT NULL COMMENT '分站id 也可以称为uid',
  `attrKey` varchar(100) NOT NULL COMMENT '键名',
  `attrValue` text COMMENT '内容',
  `createTime` int(11) unsigned NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `zid` (`zid`,`attrKey`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shua_site_attr`
--

LOCK TABLES `shua_site_attr` WRITE;
/*!40000 ALTER TABLE `shua_site_attr` DISABLE KEYS */;
/*!40000 ALTER TABLE `shua_site_attr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shua_tixian`
--

DROP TABLE IF EXISTS `shua_tixian`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shua_tixian` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `zid` int(11) unsigned NOT NULL,
  `money` decimal(10,2) NOT NULL DEFAULT '0.00',
  `realmoney` decimal(10,2) NOT NULL DEFAULT '0.00',
  `pay_type` int(1) NOT NULL DEFAULT '0',
  `pay_account` varchar(50) NOT NULL,
  `pay_name` varchar(50) NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '0',
  `addtime` datetime DEFAULT NULL,
  `endtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `zid` (`zid`) USING BTREE,
  KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shua_tixian`
--

LOCK TABLES `shua_tixian` WRITE;
/*!40000 ALTER TABLE `shua_tixian` DISABLE KEYS */;
/*!40000 ALTER TABLE `shua_tixian` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shua_tools`
--

DROP TABLE IF EXISTS `shua_tools`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shua_tools` (
  `tid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `zid` int(11) unsigned NOT NULL DEFAULT '1',
  `cid` int(11) unsigned NOT NULL DEFAULT '0',
  `sort` int(11) NOT NULL DEFAULT '10',
  `name` varchar(255) NOT NULL,
  `value` int(11) unsigned NOT NULL DEFAULT '0',
  `attr_shield_type` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `prid` int(11) NOT NULL DEFAULT '0',
  `cost` decimal(10,2) NOT NULL DEFAULT '0.00',
  `cost2` decimal(10,2) NOT NULL DEFAULT '0.00',
  `prices` varchar(100) DEFAULT NULL,
  `input` varchar(250) NOT NULL,
  `inputs` varchar(255) DEFAULT NULL,
  `desc` text,
  `alert` text,
  `shopimg` text,
  `validate` tinyint(2) NOT NULL DEFAULT '0',
  `permission` tinyint(2) NOT NULL DEFAULT '0',
  `min` int(11) NOT NULL DEFAULT '0',
  `max` int(11) NOT NULL DEFAULT '0',
  `is_curl` tinyint(2) NOT NULL DEFAULT '0',
  `curl` varchar(255) DEFAULT NULL,
  `repeat` tinyint(2) NOT NULL DEFAULT '0',
  `multi` tinyint(1) NOT NULL DEFAULT '0',
  `shequ` int(3) NOT NULL DEFAULT '0',
  `goods_id` int(11) NOT NULL DEFAULT '0',
  `goods_type` int(11) NOT NULL DEFAULT '0',
  `goods_param` varchar(180) DEFAULT NULL,
  `close` tinyint(2) NOT NULL DEFAULT '0',
  `active` tinyint(2) NOT NULL DEFAULT '0',
  `uptime` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`tid`),
  KEY `cid` (`cid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shua_tools`
--

LOCK TABLES `shua_tools` WRITE;
/*!40000 ALTER TABLE `shua_tools` DISABLE KEYS */;
/*!40000 ALTER TABLE `shua_tools` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shua_unusual_ip_log`
--

DROP TABLE IF EXISTS `shua_unusual_ip_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shua_unusual_ip_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `attrKey` varchar(100) NOT NULL COMMENT '键值',
  `ip` varchar(48) NOT NULL COMMENT 'Ipv4 或 Ipv6',
  `count` int(11) unsigned DEFAULT '0' COMMENT '计数',
  `updateTime` int(11) unsigned NOT NULL COMMENT '最后保存时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `search1` (`attrKey`,`ip`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shua_unusual_ip_log`
--

LOCK TABLES `shua_unusual_ip_log` WRITE;
/*!40000 ALTER TABLE `shua_unusual_ip_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `shua_unusual_ip_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shua_workorder`
--

DROP TABLE IF EXISTS `shua_workorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shua_workorder` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `zid` int(11) unsigned NOT NULL DEFAULT '1',
  `type` int(1) unsigned NOT NULL DEFAULT '0',
  `orderid` int(11) unsigned NOT NULL DEFAULT '0',
  `content` text NOT NULL,
  `addtime` datetime NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `zid` (`zid`) USING BTREE,
  KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shua_workorder`
--

LOCK TABLES `shua_workorder` WRITE;
/*!40000 ALTER TABLE `shua_workorder` DISABLE KEYS */;
/*!40000 ALTER TABLE `shua_workorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shua_workorder_speedy`
--

DROP TABLE IF EXISTS `shua_workorder_speedy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shua_workorder_speedy` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `text` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shua_workorder_speedy`
--

LOCK TABLES `shua_workorder_speedy` WRITE;
/*!40000 ALTER TABLE `shua_workorder_speedy` DISABLE KEYS */;
/*!40000 ALTER TABLE `shua_workorder_speedy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sky_buylog`
--

DROP TABLE IF EXISTS `sky_buylog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sky_buylog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gid` int(11) DEFAULT NULL COMMENT '商品ID',
  `uid` int(11) DEFAULT NULL COMMENT '兑换人',
  `num` int(11) DEFAULT '1' COMMENT '下单数量',
  `ip` varchar(255) DEFAULT NULL,
  `date` datetime DEFAULT NULL COMMENT '兑换时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sky_buylog`
--

LOCK TABLES `sky_buylog` WRITE;
/*!40000 ALTER TABLE `sky_buylog` DISABLE KEYS */;
/*!40000 ALTER TABLE `sky_buylog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sky_cache`
--

DROP TABLE IF EXISTS `sky_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sky_cache` (
  `K` varchar(255) NOT NULL COMMENT 'cache',
  `V` text,
  PRIMARY KEY (`K`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sky_cache`
--

LOCK TABLES `sky_cache` WRITE;
/*!40000 ALTER TABLE `sky_cache` DISABLE KEYS */;
INSERT INTO `sky_cache` VALUES ('config','a:68:{i:0;a:1:{s:8:\"template\";s:5:\"cloud\";}i:1;a:1:{s:10:\"template_m\";s:4:\"cool\";}i:2;a:1:{s:9:\"cdnpublic\";s:1:\"4\";}i:3;a:1:{s:9:\"cdnserver\";s:1:\"2\";}i:4;a:1:{s:8:\"sitename\";s:15:\"小储云商城\";}i:5;a:1:{s:4:\"kfqq\";s:6:\"123456\";}i:6;a:1:{s:13:\"Communication\";s:12:\"加群链接\";}i:7;a:1:{s:5:\"award\";s:4:\"1000\";}i:8;a:1:{s:8:\"keywords\";s:65:\"小储云商城,名片赞,免费名片赞,刷赞,免费,代刷网\";}i:9;a:1:{s:11:\"description\";s:99:\"小储云商城是一个线上购物网站，你应该可以在里面找到你需要的商品哦！\";}i:10;a:1:{s:4:\"logo\";s:19:\"assets/img/logo.png\";}i:11;a:1:{s:6:\"Signin\";s:3:\"100\";}i:12;a:1:{s:8:\"currency\";s:6:\"积分\";}i:13;a:1:{s:10:\"notice_top\";s:21:\"请手动编辑公告\";}i:14;a:1:{s:12:\"notice_check\";s:21:\"请手动编辑公告\";}i:15;a:1:{s:13:\"notice_bottom\";s:21:\"请手动编辑公告\";}i:16;a:1:{s:11:\"notice_user\";s:21:\"请手动编辑公告\";}i:17;a:1:{s:10:\"statistics\";s:0:\"\";}i:18;a:1:{s:6:\"appurl\";s:0:\"\";}i:19;a:1:{s:10:\"navigation\";s:25:\"百度一下,跳转链接\";}i:20;a:1:{s:9:\"pay_qqapy\";s:2:\"-1\";}i:21;a:1:{s:9:\"pay_wxpay\";s:2:\"-1\";}i:22;a:1:{s:10:\"pay_alipay\";s:2:\"-1\";}i:23;a:1:{s:7:\"pay_url\";s:0:\"\";}i:24;a:1:{s:11:\"pay_partner\";s:0:\"\";}i:25;a:1:{s:7:\"pay_key\";s:0:\"\";}i:26;a:1:{s:11:\"getinreturn\";s:1:\"5\";}i:27;a:1:{s:15:\"getinreturn_all\";s:3:\"100\";}i:28;a:1:{s:7:\"cpay_id\";s:0:\"\";}i:29;a:1:{s:8:\"cpay_key\";s:0:\"\";}i:30;a:1:{s:11:\"prevent_url\";s:0:\"\";}i:31;a:1:{s:12:\"prevent_type\";s:2:\"qq\";}i:32;a:1:{s:14:\"prevent_dwzapi\";s:1:\"2\";}i:33;a:1:{s:14:\"prevent_format\";s:4:\"json\";}i:34;a:1:{s:14:\"prevent_switch\";s:2:\"-1\";}i:35;a:1:{s:10:\"background\";s:1:\"4\";}i:36;a:1:{s:9:\"Interface\";s:1:\"1\";}i:37;a:1:{s:6:\"secret\";s:32:\"7a985842296ff39182509de6a65d2128\";}i:38;a:1:{s:15:\"sms_switch_user\";s:2:\"-1\";}i:39;a:1:{s:16:\"sms_switch_order\";s:2:\"-1\";}i:40;a:1:{s:17:\"alipay_public_key\";s:0:\"\";}i:41;a:1:{s:20:\"merchant_private_key\";s:0:\"\";}i:42;a:1:{s:14:\"alipay_fpay_id\";s:0:\"\";}i:43;a:1:{s:6:\"banner\";s:47:\"/assets/cool/picture/1571065392993013.png*/user\";}i:44;a:1:{s:11:\"weix_notice\";s:2:\"-1\";}i:45;a:1:{s:11:\"alipay_name\";s:0:\"\";}i:46;a:1:{s:11:\"userdeposit\";s:1:\"1\";}i:47;a:1:{s:10:\"userleague\";s:1:\"1\";}i:48;a:1:{s:15:\"userleaguegrade\";s:1:\"2\";}i:49;a:1:{s:16:\"userdepositgrade\";s:1:\"2\";}i:50;a:1:{s:15:\"usergradenotice\";s:1:\"2\";}i:51;a:1:{s:15:\"usergradeprofit\";s:1:\"3\";}i:52;a:1:{s:19:\"usergradegoodsstate\";s:1:\"4\";}i:53;a:1:{s:16:\"userdefaultgrade\";s:1:\"1\";}i:54;a:1:{s:14:\"usersmsbinding\";s:1:\"3\";}i:55;a:1:{s:12:\"usersmslogin\";s:1:\"3\";}i:56;a:1:{s:18:\"userdepositservice\";s:1:\"5\";}i:57;a:1:{s:13:\"usergradecost\";s:2:\"-1\";}i:58;a:1:{s:14:\"userdepositmin\";s:2:\"10\";}i:59;a:1:{s:15:\"userdeposittype\";s:5:\"1,1,1\";}i:60;a:1:{s:12:\"usergradetem\";s:1:\"4\";}i:61;a:1:{s:10:\"userdomain\";s:15:\"tufyf.hwebs.top\";}i:62;a:1:{s:16:\"userdomainretain\";s:5:\"www,m\";}i:63;a:1:{s:18:\"userdomainsetmoney\";s:1:\"5\";}i:64;a:1:{s:14:\"userdomaintype\";s:1:\"1\";}i:65;a:1:{s:9:\"blacklist\";s:0:\"\";}i:66;a:1:{s:14:\"SecurityCenter\";s:1:\"1\";}i:67;a:1:{s:9:\"share_url\";s:92:\"我钱不够买这个东西，能够帮我买一下嘛~，这是付款订单,谢谢啦 [url]\";}}');
/*!40000 ALTER TABLE `sky_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sky_class`
--

DROP TABLE IF EXISTS `sky_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sky_class` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `name` varchar(255) DEFAULT NULL,
  `image` text,
  `state` int(11) DEFAULT '1' COMMENT '1,显示，2隐藏',
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sky_class`
--

LOCK TABLES `sky_class` WRITE;
/*!40000 ALTER TABLE `sky_class` DISABLE KEYS */;
/*!40000 ALTER TABLE `sky_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sky_config`
--

DROP TABLE IF EXISTS `sky_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sky_config` (
  `K` varchar(255) NOT NULL,
  `V` text,
  `C` text,
  PRIMARY KEY (`K`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sky_config`
--

LOCK TABLES `sky_config` WRITE;
/*!40000 ALTER TABLE `sky_config` DISABLE KEYS */;
INSERT INTO `sky_config` VALUES ('template','cloud','PC端模板'),('template_m','cool','手机端模板'),('cdnpublic','4','CDN节点'),('cdnserver','2','动态加速节点'),('sitename','小储云商城','商城名称'),('kfqq','123456','客服QQ'),('Communication','加群链接','官方群链接'),('award','1000','邀请奖励货币数量'),('keywords','小储云商城,名片赞,免费名片赞,刷赞,免费,代刷网','网站关键词'),('description','小储云商城是一个线上购物网站，你应该可以在里面找到你需要的商品哦！','网站描述语句'),('logo','assets/img/logo.png','网站logo图地址'),('Signin','100','签到赠送货币数量'),('currency','积分','积分名称'),('notice_top','请手动编辑公告','首页公告'),('notice_check','请手动编辑公告','首页查单公告'),('notice_bottom','请手动编辑公告','全局底部公告'),('notice_user','请手动编辑公告','分站后台公告'),('statistics','','IP统计代码'),('appurl','','APP下载地址'),('navigation','百度一下,跳转链接','前台导航链接'),('pay_qqapy','-1','QQ支付接口,-1关闭,1易支付,2码支付'),('pay_wxpay','-1','微信支付接口,-1关闭,1易支付,2码支付'),('pay_alipay','-1','支付宝支付接口,-1关闭,1易支付,2码支付'),('pay_url','','易支付接口域名'),('pay_partner','','易支付商户ID'),('pay_key','','易支付商户token'),('getinreturn','5','每日单一用户可用积分兑换商品的次数(包含免费商品)'),('getinreturn_all','100','每日整个网站可用积分兑换商品的次数(包含免费商品)'),('cpay_id','','码支付ID'),('cpay_key','','码支付密钥'),('prevent_url','','防洪接口'),('prevent_type','qq','防洪生成类型qq/vx'),('prevent_dwzapi','2','网址缩短类型'),('prevent_format','json','防洪返回类型[json'),('prevent_switch','-1','-1关闭,1开启'),('background','4','背景图片，1必应每日，2必应随机，3二次元随机'),('Interface','1','API接口列表'),('secret','7a985842296ff39182509de6a65d2128','对接密钥'),('sms_switch_user','-1','-1关闭，1开启，用户后台短信开关'),('sms_switch_order','-1','-1关闭，1开启，订单购买短信开关'),('alipay_public_key','','当面付公钥'),('merchant_private_key','','当面付私钥'),('alipay_fpay_id','','支付宝应用ID'),('banner','/assets/cool/picture/1571065392993013.png*/user','首页banner图'),('weix_notice','-1','公众号订单提醒'),('alipay_name','','当面付商品名称自定义！'),('userdeposit','1','提现开关'),('userleague','1','加盟开关'),('userleaguegrade','2','加盟等级限制'),('userdepositgrade','2','提现等级限制'),('usergradenotice','2','加盟用户多少级可以自定义公告，客服？'),('usergradeprofit','3','加盟店多少级可以自定义利润？,只能多不能少'),('usergradegoodsstate','4','加盟店多少级可以自定义商品状态？'),('userdefaultgrade','1','用户注册默认等级'),('usersmsbinding','3','每日用户换绑短信发送次数'),('usersmslogin','3','每日用户登陆短信发送次数'),('userdepositservice','5','用户提现手续费'),('usergradecost','-1','用户升级费用是否奖励给他的上级？如果有的话'),('userdepositmin','10','用户最少提现多少钱？'),('userdeposittype','1,1,1','用户提现支持方式'),('usergradetem','4','用户多少级可以自定义模板？'),('userdomain','tufyf.hwebs.top','加盟店铺可选域名主体'),('userdomainretain','www,m','主站保留前缀'),('userdomainsetmoney','5','域名修改价格'),('userdomaintype','1','1=泛解析模式,2=cookie绑定模式'),('blacklist','','禁止下单信息'),('SecurityCenter','1','安全中心开关'),('share_url','我钱不够买这个东西，能够帮我买一下嘛~，这是付款订单,谢谢啦 [url]','商品代付款分享语句');
/*!40000 ALTER TABLE `sky_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sky_freight`
--

DROP TABLE IF EXISTS `sky_freight`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sky_freight` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '运费模板名称',
  `region` text COMMENT '地区',
  `money` decimal(11,2) DEFAULT NULL COMMENT '运费,和地区挂钩',
  `nums` int(11) DEFAULT NULL COMMENT '购买数量>=nums则运费为money',
  `exceed` decimal(11,2) DEFAULT NULL COMMENT '高于下单数量额外每件商品的价格',
  `threshold` decimal(11,2) DEFAULT NULL COMMENT '临界点,高于免运费',
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sky_freight`
--

LOCK TABLES `sky_freight` WRITE;
/*!40000 ALTER TABLE `sky_freight` DISABLE KEYS */;
/*!40000 ALTER TABLE `sky_freight` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sky_goods`
--

DROP TABLE IF EXISTS `sky_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sky_goods` (
  `gid` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) DEFAULT '1' COMMENT '分类ID',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `name` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `picture` text COMMENT '商品详情图',
  `money` decimal(24,8) DEFAULT NULL COMMENT '成本价格',
  `profits` decimal(24,0) DEFAULT '100' COMMENT '商品利润比例',
  `min` int(255) DEFAULT '1' COMMENT '最小下单数量',
  `max` int(255) DEFAULT NULL COMMENT '最大下单数量',
  `freight` varchar(255) DEFAULT '-1' COMMENT '运费模板',
  `method` varchar(255) DEFAULT '[1,2,3,4,5,6,7]' COMMENT '商品扩展参数',
  `value` text COMMENT '提交字段名称 | 分割',
  `quota` varchar(255) DEFAULT NULL COMMENT '份数',
  `quantity` varchar(255) DEFAULT NULL COMMENT '每份数量',
  `docs` text COMMENT '商品说明',
  `alert` text COMMENT '弹窗',
  `sqid` int(11) DEFAULT NULL COMMENT '社区ID',
  `state` int(11) DEFAULT '1' COMMENT '1上架,2下架',
  `curl` text COMMENT 'curl链接',
  `post_data` text COMMENT 'POST内容',
  `goods_id` int(11) DEFAULT NULL COMMENT '社区商品编号(亿乐玖伍)',
  `goods_type` int(11) DEFAULT NULL COMMENT '社区商品分类(玖伍)',
  `goods_url` text COMMENT '卡易信下单链接',
  `submit_the_field` varchar(255) DEFAULT NULL COMMENT '提交字段 | 分割',
  `goods_mainKey` text,
  `note` text,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`gid`)
) ENGINE=MyISAM AUTO_INCREMENT=295 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sky_goods`
--

LOCK TABLES `sky_goods` WRITE;
/*!40000 ALTER TABLE `sky_goods` DISABLE KEYS */;
/*!40000 ALTER TABLE `sky_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sky_invite`
--

DROP TABLE IF EXISTS `sky_invite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sky_invite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL COMMENT '邀请者ID',
  `invitee` int(11) DEFAULT NULL COMMENT '被邀请者编号',
  `award` decimal(11,0) DEFAULT NULL COMMENT '邀请奖励金额池',
  `ip` varchar(255) DEFAULT NULL COMMENT '可根据IP配置防刷',
  `draw_time` datetime DEFAULT NULL COMMENT '领取时间',
  `creation_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sky_invite`
--

LOCK TABLES `sky_invite` WRITE;
/*!40000 ALTER TABLE `sky_invite` DISABLE KEYS */;
/*!40000 ALTER TABLE `sky_invite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sky_journal`
--

DROP TABLE IF EXISTS `sky_journal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sky_journal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(255) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL COMMENT '用户ID',
  `count` decimal(24,8) DEFAULT NULL COMMENT '相关数量',
  `name` varchar(255) DEFAULT NULL COMMENT '日志名称',
  `content` text COMMENT '日志内容',
  `date` datetime DEFAULT NULL COMMENT '发生时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sky_journal`
--

LOCK TABLES `sky_journal` WRITE;
/*!40000 ALTER TABLE `sky_journal` DISABLE KEYS */;
/*!40000 ALTER TABLE `sky_journal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sky_login`
--

DROP TABLE IF EXISTS `sky_login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sky_login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(255) DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `state` int(1) DEFAULT '3' COMMENT '1:用户确认，2用户取消，3，待确认',
  `finish_time` datetime DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sky_login`
--

LOCK TABLES `sky_login` WRITE;
/*!40000 ALTER TABLE `sky_login` DISABLE KEYS */;
INSERT INTO `sky_login` VALUES (1,'fyyan','223.96.63.15',1,'2023-05-23 16:04:53','2023-05-23 16:04:47');
/*!40000 ALTER TABLE `sky_login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sky_notice`
--

DROP TABLE IF EXISTS `sky_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sky_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `content` text,
  `browse` text COMMENT '浏览人数,|分割',
  `date` datetime DEFAULT NULL COMMENT '发布时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sky_notice`
--

LOCK TABLES `sky_notice` WRITE;
/*!40000 ALTER TABLE `sky_notice` DISABLE KEYS */;
/*!40000 ALTER TABLE `sky_notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sky_order`
--

DROP TABLE IF EXISTS `sky_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sky_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order` varchar(255) DEFAULT NULL COMMENT '订单号',
  `trade_no` varchar(255) DEFAULT NULL COMMENT '商户订单',
  `uid` int(11) DEFAULT NULL COMMENT '用户ID',
  `ip` varchar(255) DEFAULT NULL,
  `input` varchar(255) DEFAULT NULL,
  `state` int(11) DEFAULT NULL COMMENT '领取状态，1成功，2待处理，3异常，4正在处理，',
  `num` int(11) DEFAULT '1' COMMENT '下单份数',
  `return` text COMMENT '对接返回数据',
  `gid` int(11) DEFAULT NULL COMMENT '商品ID',
  `order_id` text COMMENT '社区返回的订单号',
  `money` decimal(24,8) DEFAULT NULL COMMENT '下单成本',
  `payment` varchar(255) DEFAULT NULL COMMENT '付款方式',
  `price` decimal(24,8) DEFAULT NULL COMMENT '订单金额',
  `user_rmb` decimal(24,8) DEFAULT NULL COMMENT '玖伍返回的余额,亿乐为空',
  `remark` text COMMENT '订单处理信息！',
  `finishtime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '订单完成时间',
  `addtitm` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sky_order`
--

LOCK TABLES `sky_order` WRITE;
/*!40000 ALTER TABLE `sky_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `sky_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sky_pay`
--

DROP TABLE IF EXISTS `sky_pay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sky_pay` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order` varchar(255) NOT NULL COMMENT '本地生成的订单号',
  `trade_no` varchar(255) DEFAULT NULL COMMENT '对接易支付生成的订单号',
  `type` varchar(11) DEFAULT NULL COMMENT '付款方式，qqpayQQ,wxpay微信,alipay支付宝',
  `uid` int(11) DEFAULT NULL COMMENT '操作用户,-1 游客，>0用户',
  `gid` int(11) DEFAULT NULL COMMENT '-1,在线充值, >0购买的商品ID',
  `name` varchar(255) DEFAULT NULL COMMENT '充值标识,如 后台充值,购买商品等',
  `money` decimal(24,8) DEFAULT NULL COMMENT '操作金额',
  `ip` varchar(255) DEFAULT NULL,
  `input` text COMMENT '用户输入的下单内容',
  `num` int(11) DEFAULT '1' COMMENT '下单数量',
  `state` int(11) DEFAULT '2' COMMENT '订单状态,1:已完成,2未完成',
  `verify` varchar(255) DEFAULT '-1' COMMENT '价格监控验证，-1未验证状态！',
  `endtime` datetime DEFAULT NULL COMMENT '结束时间',
  `addtime` datetime DEFAULT NULL COMMENT '发布时间',
  PRIMARY KEY (`id`,`order`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sky_pay`
--

LOCK TABLES `sky_pay` WRITE;
/*!40000 ALTER TABLE `sky_pay` DISABLE KEYS */;
/*!40000 ALTER TABLE `sky_pay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sky_price`
--

DROP TABLE IF EXISTS `sky_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sky_price` (
  `mid` int(12) NOT NULL AUTO_INCREMENT,
  `sort` int(12) DEFAULT NULL COMMENT '排序',
  `name` varchar(255) DEFAULT NULL COMMENT '等级名称',
  `content` text COMMENT '等级说明',
  `priceis` text COMMENT '售价增长比',
  `pointsis` text COMMENT '积分增长比',
  `money` decimal(12,2) DEFAULT '0.00' COMMENT '等级价格,0则默认',
  `state` int(12) DEFAULT '1' COMMENT '等级开关',
  `addtime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`mid`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sky_price`
--

LOCK TABLES `sky_price` WRITE;
/*!40000 ALTER TABLE `sky_price` DISABLE KEYS */;
INSERT INTO `sky_price` VALUES (1,1,'普通用户','普通用户，和游客没什么区别!','30','3000',0.00,1,'2020-03-18 00:00:00'),(2,2,'铜牌代理','铜牌代理，可以加盟分店了,其他用户在你分站下单你可以获得提成!','28','2800',10.00,1,'2020-03-18 00:00:00'),(3,3,'银牌代理','银牌代理，除了可以加盟分店外，还可以赚取下级提成，并且收益比上一级别更高！，推荐购买!','26','2600',20.00,1,'2020-03-18 00:00:00'),(4,4,'金牌代理','金牌代理，除了可以加盟分店外，还可以赚取下级提成，并且收益比上一级别更高！，推荐购买!','24','2400',30.00,1,'2020-03-18 00:00:00'),(5,5,'小站长','小站长，除了可以加盟分店外，还可以赚取下级提成，并且收益比上一级别更高！，推荐购买!','22','2200',40.00,1,'2020-03-18 00:00:00'),(6,6,'平台站长','平台站长，除了可以加盟分店外，还可以赚取下级提成，并且收益比上一级别更高！，推荐购买!','20','2000',50.00,1,'2020-03-18 00:00:00'),(7,7,'高级站长','高级站长，除了可以加盟分店外，还可以赚取下级提成，并且收益比上一级别更高！，推荐购买!','18','1800',60.00,1,'2020-03-18 00:00:00'),(8,8,'领袖站长','领袖站长，除了可以加盟分店外，还可以赚取下级提成，并且收益比上一级别更高！，推荐购买!','16','1600',70.00,1,'2020-03-18 00:00:00');
/*!40000 ALTER TABLE `sky_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sky_shequ`
--

DROP TABLE IF EXISTS `sky_shequ`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sky_shequ` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) DEFAULT NULL,
  `type` int(11) NOT NULL DEFAULT '1' COMMENT '1,玖伍,2亿乐',
  `username` varchar(222) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `secret` varchar(255) DEFAULT NULL,
  `pattern` varchar(255) DEFAULT '1' COMMENT '对接模式',
  `date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sky_shequ`
--

LOCK TABLES `sky_shequ` WRITE;
/*!40000 ALTER TABLE `sky_shequ` DISABLE KEYS */;
/*!40000 ALTER TABLE `sky_shequ` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sky_token`
--

DROP TABLE IF EXISTS `sky_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sky_token` (
  `kid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT '1' COMMENT '购买者UID',
  `gid` int(11) DEFAULT NULL COMMENT '商品ID',
  `code` varchar(255) DEFAULT NULL COMMENT '提卡密码',
  `token` varchar(255) DEFAULT NULL COMMENT '卡密内容',
  `ip` varchar(255) DEFAULT NULL,
  `order` varchar(255) DEFAULT NULL,
  `endtime` datetime DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`kid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sky_token`
--

LOCK TABLES `sky_token` WRITE;
/*!40000 ALTER TABLE `sky_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `sky_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sky_user`
--

DROP TABLE IF EXISTS `sky_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sky_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_idu` varchar(255) NOT NULL COMMENT '唯一识别码',
  `token` varchar(255) DEFAULT NULL COMMENT '同系统对接密钥',
  `ip_white_list` text COMMENT 'IP白名单',
  `superior` int(11) DEFAULT NULL COMMENT '上级编号',
  `currency` decimal(24,0) DEFAULT '0' COMMENT '用户积分',
  `ip` varchar(255) DEFAULT NULL,
  `money` decimal(24,8) DEFAULT '0.00000000' COMMENT '余额',
  `grade` int(255) DEFAULT '1' COMMENT '用户等级！',
  `domain` varchar(255) DEFAULT NULL COMMENT '店铺域名',
  `configuration` text COMMENT '其他配置，以序列格式存在',
  `image` varchar(255) DEFAULT NULL COMMENT '用户头像',
  `name` varchar(255) DEFAULT NULL,
  `qq` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL COMMENT '电话号码',
  `state` int(11) DEFAULT NULL COMMENT '用户状态，1正常，2禁止登陆',
  `recent_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `found_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sky_user`
--

LOCK TABLES `sky_user` WRITE;
/*!40000 ALTER TABLE `sky_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `sky_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sky_withdrawal`
--

DROP TABLE IF EXISTS `sky_withdrawal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sky_withdrawal` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL COMMENT '提现者姓名',
  `account_number` varchar(255) DEFAULT NULL COMMENT '提现账号',
  `uid` int(11) DEFAULT NULL,
  `remarks` text COMMENT '提现者备注',
  `state` int(1) DEFAULT '3' COMMENT '1，已完成,2已退回,3待处理',
  `result_code` text COMMENT '处理结果',
  `money` decimal(12,2) DEFAULT NULL COMMENT '提现金额',
  `endtime` datetime DEFAULT NULL COMMENT '处理时间',
  `addtime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sky_withdrawal`
--

LOCK TABLES `sky_withdrawal` WRITE;
/*!40000 ALTER TABLE `sky_withdrawal` DISABLE KEYS */;
/*!40000 ALTER TABLE `sky_withdrawal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms_code`
--

DROP TABLE IF EXISTS `sms_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms_code` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mobile` varchar(15) NOT NULL DEFAULT '' COMMENT '手机号',
  `screen` varchar(30) NOT NULL DEFAULT '' COMMENT '场景',
  `code` char(6) NOT NULL DEFAULT '' COMMENT '验证码',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态：0：未使用 1：已使用',
  `create_at` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `create_ip` varchar(255) NOT NULL DEFAULT '' COMMENT '请求 ip',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_code`
--

LOCK TABLES `sms_code` WRITE;
/*!40000 ALTER TABLE `sms_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `sms_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `star_admin`
--

DROP TABLE IF EXISTS `star_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `star_admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `nickname` varchar(255) COLLATE utf8mb4_bin NOT NULL COMMENT '昵称',
  `username` varchar(50) COLLATE utf8mb4_bin NOT NULL COMMENT '用户名',
  `password` varchar(40) COLLATE utf8mb4_bin NOT NULL COMMENT '密码',
  `email` varchar(50) COLLATE utf8mb4_bin NOT NULL COMMENT '邮箱',
  `qq` bigint(10) DEFAULT '0' COMMENT 'QQ',
  `salt` varchar(50) COLLATE utf8mb4_bin NOT NULL COMMENT '密码盐',
  `token` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '登录令牌',
  `login_ip` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '登录IP',
  `login_time` bigint(10) DEFAULT '0' COMMENT '登录时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='管理员表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `star_admin`
--

LOCK TABLES `star_admin` WRITE;
/*!40000 ALTER TABLE `star_admin` DISABLE KEYS */;
INSERT INTO `star_admin` VALUES (1,'深秋.','admin','45c28e4a98fa051b1f3fa37f2c0c1e84826c3460','i@kain8.cn',1361582519,'starMQ-Pay_2.0_kaindev8-single-user','','',0);
/*!40000 ALTER TABLE `star_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `star_code`
--

DROP TABLE IF EXISTS `star_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `star_code` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `url` varchar(255) COLLATE utf8mb4_bin NOT NULL COMMENT '二维码地址',
  `type` varchar(10) COLLATE utf8mb4_bin NOT NULL COMMENT '支付方式',
  `jk` int(1) DEFAULT '1' COMMENT '二维码监控类型; 1=app,0=PC',
  `time` bigint(10) NOT NULL COMMENT '添加时间',
  `status` int(1) DEFAULT '1' COMMENT '通道状态；1=启用,0=关闭',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='二维码表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `star_code`
--

LOCK TABLES `star_code` WRITE;
/*!40000 ALTER TABLE `star_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `star_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `star_config`
--

DROP TABLE IF EXISTS `star_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `star_config` (
  `key` varchar(50) COLLATE utf8mb4_bin NOT NULL COMMENT '键',
  `val` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '值',
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='设置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `star_config`
--

LOCK TABLES `star_config` WRITE;
/*!40000 ALTER TABLE `star_config` DISABLE KEYS */;
INSERT INTO `star_config` VALUES ('app_heart',''),('app_status','0'),('appid','1000'),('appkey',''),('beian','湘ICP备888888888'),('callback','0'),('close_time','180'),('desc','2.0全新发布'),('is_tips','1'),('pc_heart',''),('pc_status','0'),('sitename','StarPay'),('smtp_host','smtp.qq.com'),('smtp_pass',''),('smtp_port','465'),('smtp_user',''),('tips','客服QQ：1361582519，如支付后未跳转请联系客服!'),('yuyin','1');
/*!40000 ALTER TABLE `star_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `star_log`
--

DROP TABLE IF EXISTS `star_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `star_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `ip` varchar(50) COLLATE utf8mb4_bin NOT NULL COMMENT '操作IP',
  `time` bigint(10) NOT NULL COMMENT '操作时间',
  `event` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作事件',
  `status` int(10) DEFAULT '0' COMMENT '事件状态',
  `addres` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `star_log`
--

LOCK TABLES `star_log` WRITE;
/*!40000 ALTER TABLE `star_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `star_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `star_order`
--

DROP TABLE IF EXISTS `star_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `star_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `create_time` bigint(10) unsigned NOT NULL COMMENT '创建时间',
  `pay_time` bigint(10) unsigned NOT NULL COMMENT '支付时间',
  `out_trade_no` varchar(100) COLLATE utf8mb4_bin NOT NULL COMMENT '商户订单号',
  `trade_no` varchar(100) COLLATE utf8mb4_bin NOT NULL COMMENT '系统订单号',
  `name` varchar(255) COLLATE utf8mb4_bin NOT NULL COMMENT '商品名',
  `money` decimal(19,2) NOT NULL COMMENT '订单金额',
  `really_money` decimal(19,2) NOT NULL COMMENT '实付金额',
  `sitename` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '网站名称',
  `ip` varchar(50) COLLATE utf8mb4_bin NOT NULL COMMENT 'IP',
  `return_url` varchar(255) COLLATE utf8mb4_bin NOT NULL COMMENT '同步通知地址',
  `notify_url` varchar(255) COLLATE utf8mb4_bin NOT NULL COMMENT '异步通知地址',
  `type` varchar(10) COLLATE utf8mb4_bin NOT NULL COMMENT '支付方式',
  `status` int(1) DEFAULT '0' COMMENT '支付状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='订单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `star_order`
--

LOCK TABLES `star_order` WRITE;
/*!40000 ALTER TABLE `star_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `star_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_auth`
--

DROP TABLE IF EXISTS `system_auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_auth` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(20) NOT NULL COMMENT '权限名称',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '状态(1:禁用,2:启用)',
  `sort` smallint(6) unsigned DEFAULT '0' COMMENT '排序权重',
  `desc` varchar(255) DEFAULT NULL COMMENT '备注说明',
  `create_by` bigint(11) unsigned DEFAULT '0' COMMENT '创建人',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_system_auth_title` (`title`) USING BTREE,
  KEY `index_system_auth_status` (`status`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_auth`
--

LOCK TABLES `system_auth` WRITE;
/*!40000 ALTER TABLE `system_auth` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_auth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_auth_node`
--

DROP TABLE IF EXISTS `system_auth_node`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_auth_node` (
  `auth` bigint(20) unsigned DEFAULT NULL COMMENT '角色ID',
  `node` varchar(200) DEFAULT NULL COMMENT '节点路径',
  KEY `index_system_auth_auth` (`auth`) USING BTREE,
  KEY `index_system_auth_node` (`node`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色与节点关系表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_auth_node`
--

LOCK TABLES `system_auth_node` WRITE;
/*!40000 ALTER TABLE `system_auth_node` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_auth_node` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_config`
--

DROP TABLE IF EXISTS `system_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_config` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL COMMENT '配置编码',
  `value` mediumtext COMMENT '配置值',
  PRIMARY KEY (`id`),
  KEY `index_system_config_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=389 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统参数配置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_config`
--

LOCK TABLES `system_config` WRITE;
/*!40000 ALTER TABLE `system_config` DISABLE KEYS */;
INSERT INTO `system_config` VALUES (148,'site_name','网自助发卡网'),(149,'site_copy','鲸发卡 jingfaka.com © 2021 - 2023 版权'),(164,'storage_type','local'),(165,'storage_qiniu_is_https','1'),(166,'storage_qiniu_bucket','static'),(167,'storage_qiniu_domain','static.ctolog.com'),(168,'storage_qiniu_access_key','wuwei'),(169,'storage_qiniu_secret_key','wuwei'),(170,'storage_qiniu_region','华东'),(173,'app_name','网自助发卡网'),(176,'browser_icon','/static/upload/fd395269cf4b26da/e86a21489408240c.png'),(184,'wechat_appid','.'),(185,'wechat_appsecret','.'),(186,'wechat_token','.'),(187,'wechat_encodingaeskey','.'),(199,'storage_oss_bucket',''),(200,'storage_oss_keyid',''),(201,'storage_oss_secret',''),(202,'storage_oss_domain',''),(203,'storage_oss_is_https','1'),(204,'sms_channel','alidayu'),(205,'smsbao_user','.'),(206,'smsbao_pass','.'),(207,'smsbao_signature','【发卡网】'),(208,'alidayu_key','.'),(209,'alidayu_secret','.'),(210,'alidayu_smstpl','.'),(211,'alidayu_signature','.'),(212,'yixin_sms_user','.'),(213,'yixin_sms_pass','.'),(214,'yixin_sms_signature','.'),(215,'email_name','自动发卡网'),(216,'email_smtp','smtp.qq.com'),(217,'email_port','465'),(218,'email_user','.'),(219,'email_pass','.'),(220,'cash_min_money','10'),(221,'transaction_min_fee','0.04'),(222,'cash_fee_type','1'),(223,'cash_fee','2'),(224,'spread_rebate_rate','0.2'),(225,'site_keywords','自动发卡网,自动发卡,自动发卡平台,卡密寄售,自动发卡平台,发卡平台,自动发卡,发卡,发卡网'),(226,'site_desc','自动发卡网是一款用于软件充值等虚拟卡密24小时在线交易的自动发卡平台,对比其他自动发卡平台费率低,功能全,服务器安全稳定.发卡平台就选自动发卡网！'),(227,'site_status','1'),(228,'site_subtitle','极受欢迎的虚拟卡密自动发卡网平台'),(229,'site_close_tips','站点维护中'),(230,'complaint_limit_num','99'),(231,'cash_status','1'),(232,'cash_close_tips','满50每天12点自动结算，无须手动结算。'),(233,'cash_limit_time_start','0'),(234,'cash_limit_time_end','23'),(235,'cash_limit_num','3'),(236,'cash_limit_num_tips','已达到今日最多提现次数！'),(237,'site_info_tel','QQ88888888'),(238,'site_info_qq','88888888'),(239,'site_info_address','哈尔滨市道外区'),(240,'site_info_email','admin@admin.com'),(241,'site_info_copyright','Copyright © 2018-2020 自动发卡网 All rights reserved. 版权所有'),(242,'site_info_icp','ICP备xxx号'),(243,'site_domain','填自己的'),(244,'site_domain_res','/static'),(245,'site_register_verify','1'),(246,'site_register_status','1'),(247,'site_register_smscode_status','0'),(248,'site_wordfilter_status','1'),(249,'site_wordfilter_danger','习近平|毛泽东|胡锦涛|江泽民|援交|傻逼|二逼|SB|脑残!111|徐才厚|郭伯雄|高清视频|色色网站|黄色|小视频|支付宝套现|会员代充|Q名片赞|毒品|博彩网站|赌博网站|\n'),(250,'disabled_domains','www|ftp|bbs|blog|tes'),(251,'site_domain_short','Suo'),(252,'storage_local_exts','ico,jpg,jpeg,gif,png,apk,ipa'),(253,'site_logo','/static/upload/3e67c4c4471199b5/1789c3f5adf310f4.png'),(254,'site_shop_domain','填自己的'),(255,'yixin_sms_cost','0.1'),(256,'smsbao_cost','0.1'),(257,'alidayu_cost','0.1'),(259,'1cloudsp_key','.'),(260,'1cloudsp_secret','.'),(261,'1cloudsp_smstpl','.'),(262,'1cloudsp_signature','.'),(263,'1cloudsp_cost','.'),(264,'253sms_key','.'),(265,'253sms_secret','.'),(266,'253sms_signature','.'),(267,'253sms_cost','.'),(268,'ip_register_limit','5'),(269,'is_google_auth','0'),(270,'sms_error_limit','10'),(271,'sms_error_time','10'),(272,'wrong_password_times','10'),(273,'site_statistics',''),(274,'admin_login_path','admin'),(276,'announce_push','1'),(277,'spread_reward','0'),(278,'spread_reward_money','0.2'),(279,'spread_invite_code','0'),(282,'wx_auto_login','0'),(283,'is_need_invite_code','0'),(284,'site_register_code_type','email'),(285,'sms_notify_channel','alidayu'),(286,'merchant_logo','/static/upload/ac4d15de82abd8a1/b8fd85c7e2f11e07.png'),(287,'goods_min_price','0'),(288,'goods_max_price','10000'),(291,'auto_cash','1'),(292,'auto_cash_time','0'),(293,'cash_type','[\"1\",\"2\",\"3\"]'),(294,'auto_cash_money','50'),(295,'auto_cash_fee_type','1'),(296,'auto_cash_fee','0'),(297,'sms_complaint_channel','alidayu'),(298,'alidayu_complaint_smstpl','.'),(299,'1cloudsp_complaint_smstpl','.'),(300,'order_query_chkcode','0'),(301,'sms_complaint_notify_channel','alidayu'),(302,'alidayu_complaint_notify_smstpl','.'),(303,'alidayu_order_smstpl','.'),(304,'1cloudsp_complaint_notify_smstpl','.'),(305,'1cloudsp_order_smstpl','.'),(306,'wechat_stock_template','.'),(307,'wechat_sell_template','.'),(308,'order_trade_no_type','1'),(309,'order_trade_no_profix','FK'),(310,'login_auth','1'),(311,'login_auth_type','1'),(312,'buy_protocol','&lt;p&gt;&lt;strong&gt;&lt;span style=&quot;color:rgb(255,102,0);&quot;&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;温馨提示：本站不提供任何担保、私下交易被骗一律与本站无关。&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;color:rgb(255,0,255);&quot;&gt;1、本平台仅提供自动发卡、寄售服务，本平台非销售商，建议先咨询卖家软件使用方法和用途后购买，非卡密问题本站不予受理售后争议。&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;color:rgb(39,174,96);&quot;&gt;2、平台提供卡密查询时间为1个月（购买后请自行保存）如遇假卡/欺诈/涉黄/赌/等违规商品请当天24点前与我们平台客服QQ联系举报。&lt;/span&gt;&lt;/p&gt;\n\n&lt;p&gt;--------------------------------------------&lt;/p&gt;\n\n&lt;p&gt;&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;color:rgb(255,0,0);&quot;&gt;防骗提醒&lt;/span&gt;&lt;/strong&gt;&lt;span style=&quot;color:rgb(255,0,0);&quot;&gt;：&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color:rgb(102,0,255);&quot;&gt;1.卡密内容为&quot;联系QQ取卡或者QQ群拿货&quot; 2.以各种理由推脱到第二天发货 3.商品有问题，卖家不售后 4.承诺充值返现 5.购买的商品为实物，需要快递发货的。请及时联系我们QQ客服：&lt;/span&gt;&lt;/p&gt;\n'),(313,'site_info_tel_desc',''),(314,'site_info_qq_desc',''),(317,'fee_payer','1'),(318,'available_email','0'),(319,'idcard_auth_type','0'),(320,'idcard_auth_path',''),(321,'idcard_auth_appcode',''),(322,'idcard_auth_status_field','status'),(323,'idcard_auth_status_code','01'),(324,'settlement_type','1'),(325,'email_smtp1','smtp.qq.com'),(326,'email_port1','465'),(327,'email_user1','.'),(328,'email_pass1','.'),(329,'email_smtp2','smtp.qq.com'),(330,'email_port2','465'),(331,'email_user2','.'),(332,'email_pass2','.'),(333,'sina_app_key','.'),(334,'sina_app_secret','.'),(335,'suo_app_key','.'),(336,'sina_app_key','.'),(337,'sina_app_secret','.'),(339,'index_theme_list_pc','[\"land1\",\"land2\",\"land3\"]'),(340,'index_theme_mobile','app'),(341,'index_theme_list_mobile','[\"land1\",\"land2\",\"land3\",\"app\"]'),(342,'index_theme_pc','land2'),(343,'merchant_logo_sm','/static/upload/66f9401118aeb58c/93890765b5ab93c2.png'),(345,'invite_code_get_url','http://www.baidu.com'),(346,'order_title_type','1'),(347,'order_title_profix','测试'),(348,'order_title_str','自定义标题'),(350,'wechat_signin_template',''),(351,'wechat_complaint_template',''),(352,'wechat_cash_template',''),(353,'wechat_notify','0'),(354,'complaint_refund','0'),(355,'agreement_read','1'),(356,'tongji_baidu_key',''),(357,'admin_auth_type',NULL),(358,'glock',NULL),(359,'glock_status','540199522a38e14a9a55774b14ca715083cede39'),(360,'merchant_invitecode_open','1'),(361,'cash_weixinnotify_open','1'),(362,'cash_emailnotify_open','0'),(363,'complaint_qrcode','0'),(367,'order_query_limitday','3'),(368,'order_query_limitip','0'),(378,'order_query_blackcontact','12345678|123456789|1234567890|a123456789|123456|qq123456|abc123456|123456789a|WOAINI1314|11111111|123123123|88888888|111111111|147258369|987654321|1111111111|1qaz2wsx|789456123|iloveyou|qwertyuiop|asdfghjkl|1q2w3e4r|123456abc|qazwsxedc|abcd1234|123654789|aa123456|123321123|1234qwer|123456aa|123456123|999999999|741852963|963852741|qwer1234|qweasdzxc|asd123456|123456qq|3.1415926|asdf1234|111222333|147852369|111111|123698745|woaiwojia|123456987|zxcvbnm123|5845201314|1q2w3e4r5t|buzhidao|xiaoxiao|qwe123456|1357924680|yangyang|135792468|AS123456|147896325|888888|123123|123321|a123456|zxcvbnm|123456a|aaaaaaaa|11223344|password|87654321|12344321|31415926|asdasdasd|12121212|12341234|a12345678|asdfasdf|qwertyui|520520520|q1w2e3r4|1234abcd|1qazxsw2|1123581321|123456asd|woaini123|woshishui|12301230|1234554321|12369874|25257758|369258147|zhang123|woainima|woaini520|5845211314|12345678910|jingjing|tiantian|584131421|5841314520|yuanyuan|woailaopo|584131420|5201314|666666|1234567|654321|789456|woaini|112233|1314520|7758521|123|1|123654|520520|147258|aaaaaa|222222|abc123|110110|1111111|5211314|qazwsx|7758258|qwerty|456123|159357|521521|123qwe|456789|1314521|987654|asdfgh|123abc|qweasd|asdasd|qwe123|zxcvbn|asd123|1234560|qaz123|q123456|abcdefg|A12345|123asd|z123456|qweqwe|w123456|caonima|zxc123|123456q|aaa111|00000000|66666666|qqqqqqqq|000000000|0000000000|0123456789|110110110|22222222|a1234567|11112222|521521521|123qweasd|11235813|5201314520|100200300|qazwsx123|wocaonima|q123456789|9876543210|qaz123456|123456QWE|20082008|qq123123|000000|WOJIUSHIWO|sunshine|wodemima|a5201314|zhangwei|110120119|123456789q|woaini521|dongdong|13141314|20080808|14789632|aini1314|zhanglei|worinima|qq5201314|zhangjie|wangyang|love1314|584201314|0|121212|111222|131313|999999|555666|333333|100200|555555|12345|7777777|qqqqqq|zzzzzz|1234|778899|666888|123789|777777|201314|101010|168168|159753|123000|314159|789789|963852|qazqaz|369369|ffffff|131420|584520|741852|456852|131421|111|135246|110119|147852|321321|753951|211314|518518|456456|444444|windows|123457|336699|1111|258369|654123|147369|1q2w3e|119119|321654|7758520|520530|112358|564335|911911|951753|110120|135790|102030|258258|shmily|232323|111000|369258|520025|121314|251314|dddddd|709394|123465|721521|3344520|wwwwww|584521|loveyou|521125|142536|1230123|ssssss|a|332211|120120|3344521|124578|fuckyou|aaa123|112112|mnbvcxz|xxxxxx|nihaoma|134679|521314|321456|a111111|7895123|852456|520123|weiwei|qwaszx|qazxsw|q1w2e3|zxczxc|111111a|baobao|a123123|99999999|123456123456|55555555|asdfghjk|12345678A|321321321|12345600|123456654321|0987654321|z123456789|12345679|123456aaa|1233211234567|321654987|zxc123456|computer|superman|goodluck|a123456a|12qwaszx|12345qwert|aptx4869|77585210|74108520|7894561230|abcd123456|mingming|shanghai|wangjian|www123456|7758521521|qq123456789|25251325|wangjing|110119120|1314520520|nicholas|5201314a|wobuzhidao|xiaoqiang|16897168|longlong|xiaolong|shanshan|110120130|5841314521|zhangjian|qwqwqw|0000000|888999|1314|7654321|11111|ww111111|246810|222333|445566|333666|FOREVER|hao123456|585858|121121|212121|aaaaaaa|wang123|111qqq|159951|147147|maomao|235689|159159|feifei|beyond|898989|7788250|5203344|555888|1234566|a000000|7788521|122333|123456.|jiajia|123123a|wangwei|258456|q123123|520|woaiwoziji|xiaoyu|zhendeaini|asasas|jiushiaini|000000a|ms0083jxj|33333333|qweqweqwe|ffffffff|1234567a|aaa123456|qwerasdf|299792458|123456789.|8888888888|52013145201314|888888888|abc12345|a123123123|123456..|12312312|a1b2c3d4|abc123456789|1a2b3c4d|123456ab|li123456|qq000000|qw123456|w123456789|1234512345|456456456|ab123456|Q1W2E3R4T5|19491001|zz123456|123qwe123|77585217758521|1234567890123|123456as|chenchen|q1234567|123456qaz|qwert12345|52013140|3141592653|qweasd123|52013141314|wang123456|asdf123456|123456798|1234567899|liu123456|123456789abc|123456qw|123456abcd|74107410|ddzj39cb3|zx123456|20092009|nihao123|lxqqqqqq|woainiwoaini|19861212|liangliang|123456789123|13145201314520|eladnbin1104|19861015|123456zxc|qwe123qwe|5201314123|zhangyan|123456...|llllll|yj2009|476730751|007007|0123456|010203|686868|wan0425|666999|989898|000111|777888|787878|888666|000123|999888|234567|abcdef|123567|168888|181818|565656|13|mm123456|131425|012345|556677|0000|11|998877|198512|gggggg|789123|mmmmmm|198611|158158|1234561|198411|142857|winner|qq00000|198511|456321|198612|1q1q1q|119911|131415|wangyut2|808080|10203|7007|1.23457E+11|1230|123520|tiancai|110|dragon|7788414|qq1234|5213344|1122334|123456z|55555|1230456|1231230|5121314|1314159|2597758|wanglei|7788520|198610|770880|aa5201314|caonima123|2525775|1122|1233210|134679852|1.23456E+11|michael|asdzxc|1234568|asd|1314258|1001|a123321|asdf123|s123456|ww123456|1234569|1.23457E+12|7758991|pppppp|@qq.com|qqq123|l123456|qwert123|0.123456|369852|qwertyu|abc1234567|1111111111111111|hao123|abcd123|tingting|dearbook|code8925|zzzzzzzz|77777777|xiazhili|88771024|11111111111111111111|wwwwwwww|10101010|12345678A@|44444444|1122334455|12345612|P@ssw0rd|csdncsdn|05962514787|ssssssss|lilylily|dddddddd|zxczxczxc|369369369|aaaaaaaaa|abcdefgh|123789456|19830209|168168168|helloworld|aaaaaaaaaa|112233445566|zaq12wsx|xxxxxxxx|ds760206|123321123321|789789789|qq111111|13145200|a1111111|google250|123321aa|007007007|66668888|csdn.net|aaaa1111|maidoumaidou|z3255500|01234567|21212121|00001111|12345687|12348765|01020304|23232323|qkvmlia569|passw0rd|77585211|01010101|a11111111|aa123123|mmmmmmmm|qazqazqaz|200919ab|qazxswedc|19841010|20102010|666666666|111111aa|19841020|00000000000000000000|19810914|123456000|10203040|123123123123|12345abcde|13801001020|meiyoumima|518518518|5200251314|hahahaha|13131313|fa1681688|llllllll|19851010|asasasas|012345678|77889900|newhappy|23456789|12365478|1111qqqq|wangpeng|z1234567|w1234567|dgdg7234322|qqqq1111|1234asdf|1234567b|951ljb753|45612300|justdoit|q1111111|11111111a|qqqqqqqqq|19841028|911911911|11110000|19841021|microsoft|258258258|123454321|987456321|qwqwqwqw|19841018|159159159|123123aa|jjjjjjjj|hhhhhhhh|pppppppp|q12345678|19841012|456789123|administrator|a0000000|admin123|lovelove|internet|a00000000|19841023|120120120|asd123123|kkkkkkkk|12131415|admin369|84131421|ybnkoia569|testtest|19851120|42011178|1qaz2wsx3edc|12332100|78787878|66778899|19871024|456123789|z12345678|123123456|123456zx|mac123456|88889999|11111111111|147147147|55667788|miaomiao|qwe123123|12332112|1qaz1qaz|cccccccc|qkvpoia569|youaifa569|oooooooo|12312300|1111111a|imissyou|333333333|19841011|zhimakaimen|xingxing|13572468|19841024|19850603|asdasd123|asd12345|qwe12345|qwerty123|5555555555|1223334444|19821010|19871025|3141592654|1029384756|19841001|19861020|369852147|handsome|12300000|12345678Q|16899168|99998888|a1s2d3f4|qqq11111|19851023|19851025|19851212|112112112|songguang|aaa123123|aaaa0000|19871212|zxcv1234|98765432|98989898|789654123|yyyyyyyy|111111qq|96385274|19861012|19861013|gggggggg|6666666666|19851013|19851019|19841026|19841022|19851218|19861122|19841015|windowsxp|QQQQQqqqqq|12345611|123456456|159753123|11221122|hello123|19861111|1q1q1q1q|qazhuang123|abc12345678|woshitiancai|119119119|19871125|19861028|19851125|19851020|19821016|19861016|19861120|19841017|19881010|wangwang|123123qq|19871012|19841027|111222tianya|980099|323232|393041123|tangkai|dedewang|vicekw|qyahzn|634142554|googletester|tianya|*123456|594232|deeven|9233923|780813|811224bai|qqwwee|az123456|3429795|733733|816618|811009|3353212li|q|ggg111|791127|majiajun|z|523|EtnXtxSa65|zxzxzx|223344|741741|010101|259421|storyofall|always|098765|880312|6|650829yjm|1708|774517397|987987|sgdHhfC4x2|780504|wsky0o0o0o|635241|963963|a00000|9YUE27RI|1qa2ws|000999|19960309|d123456|NBvBB32fa9|114114|20062006|kb9zc8uxtx|2199127551|463395727|113113|ApjSqpM844|d|333222|fashion@000|210316|s1t2o3n4|ye123456|legend|00|734992|789987|000|001280|uifKjhF522|lwxlwx|zzzzz|200810|198410|ndaCebx2wx|8496856|821010|JxsGx2Yd87|801122|312312|jianfei000|sxUaIehAtp|huang|999666|667788|858877108aop|2m66xF2AJT|wanshuai198202|789654321|vjfLkiG522|801018|z1122334455|208884|bbbbbb|3456789|001234|benq*edifer|791028|19891229|199771|summer|qfcFgdA3zx|d54q7xjmhx|6Cxd2X986x|PCwAC33gb9|809998|315315|123987|19871015|198412|b33m6yghef|xm55xExBZS|mcaBdaw2vx|151515|d54p7xjkha|CrkUrrP954|668899|3uc9xN53xH|231997|22|4wdaxQ642F|198211|i97wb6sxq7|831220|lssy123|821222|19991226|theIigD4x2|6666666|e10adc3949ba59abbe56e057f20f88|137900|95368452|17746052|24081986|162752|syq20071003|linjiang|fuanyue47|yx12345678|8675309|operation|1.11111E+17|asd45679|xiaofeng|nishiwoer|a123|genius|tianshi|sakura|332335|86944950|woshishen|19880405|huizhang|szc03137|19840504|killer|5518266|woainia|20052324|asddsa|110112|2587758|xiaoxin|xiaoyao|1.23457E+17|woshishei|gundam|316032611|zhanghang|1063524602|151732|woshizhu|wokaonima|WOshiWO|freedom|39398890|34416912|zhanghao|132456|NISHIZHU|jianjian|198319|diablo|112211|showme|81151007|999|kissme|xiaowei|fantasy|7266979|159632|lee01301228|shangxin|woshiniba|522010|110011|1010110|wenwen|1415926|1234321|213213|19871206|fengfeng|dd123456|932313|wangchao|a45389612|331234|jiejie|xiaofei|965523|2007|19861018|19861225|1232123|zzb19860526|831213|nobodywillknowthispwd|love1314a|goyj2010|117289788|1310613106|xaoyin78|zzzxxx|bensile|411511|AAADDD|admin1234|123456hrr|sam123|g13916055158|QAZXCV|da2khdahda|19810625|z333666|qiye123456|ok100404|x50862356|jthrzok|itbbs20101208PC|123412|2w2w2w|aaasss|loveyou1314|@sohu.com|13245612|8844.8844|ex50867212|88448844|seoer2010|liudu88888|www1234|jkhldfkf12dj|556688|lm292979|2345678|123456rt|sxz123|sidake2bn|lb8844|liuping200|kissbaby|eeeeee|78157878|woyaolp512|123456ok|yixin2011|198361|222888|252323|abc123ddd|adf46sdfsf|818078|5201314q|750250|yy55yy88|xkhl656266|runsystem|hjl80033913|bqueensss|85665684|851010|a123456b|86815945|600242|a88778877|jjjjjj|1987721|aa112288|xkl656266|787878kai|tyc99tycaa|yj123456|okmokm|098098|2616445|zhong133|bqueenssss|liuping1920|831101qsl|asdqwe22|789457dwewee|liuli123|200616|poow29q6666|lingnan123|333777|987453|a123b456|nurk202121|88888888zzk|5655487|laozi124|901027|leon123456|123sv67e9|yiersan|1148878306|qw12345|414512@QQ.com|hld_1209|along0321|feadsf3dW|qqqwww|051123|200884|123124|551188|3edc4rfv5|19851030|qqq111|rui100|qq67890|4451551|123456Bc|123678dd|909090|123654yyy|1qazxsw|q111111|kuai+321=Wen_123|5580817aaa|373518|2895192|ab12345|no1444888|tongji5613|aw123123|zxcvbnm111|447100|LGL6641341|rrrrrr|199065|1985111802|dddfff|15894998@qq.com|62379372|123456t|agiene8547|admdfdsfsdd|kingusj|921212|mashuguang|dmba8898|963258|1234567890000|dg123456|123456k|sxm0627|li9900|2290669|hhhhhh|ucdosa|fcqq12346|111aaa|000123a|2w3e4r|yinchuanqi|love8023|hyp815822|jo@qq.cc|chenqing|eohank1980|6184685521|aa998877|123456ac|123qaz|aqaqaq|oooppp|okok588588|nihao789|windson|111333|1997070101|9861250123|7708801314520|12345678900|1234567891|123456789qq|1472583690|1234567891234567|+|qwertyuiop123|aa123456789|7215217758991|9638527410|wo123456|zhang123456|asdfghjkl123|woaini5201314|ABCD123456789|qwertyuio|123456789aa|woaini1314520|asd123456789|woaini123456|1234567899876543|77585211314|13579246810|zxcvbnm|5205201314|123456789z|13800138000|123456789w|123456789+|abcdefg123|a1314520|www123456789|0000000000000000|qwe123456789|123456789asd|12345678912|qqq123456|123456789*|0147258369|5211314521|laopowoaini|yang123456|qq1314520|qaz123456789|ainiyiwannian|a147258369|l123456789|www123|aaa123456789|woainilaopo|abcd12345|520131400|1213141516|7418529630|nuttertools|1314520123|123456789aaa|as123456789|123456789QWE|zxcvbnm123456|123456789..|qwer123456|wo123456789|123456w|123456789abcd|7758521123|1234567890.|y123456|123456789l|ab123456789|1111122222|m123456|chen123456|a987654321|qw123456789|zxc123456789|li123456789|7758258520|77582581314258|iloveyou1314|qazwsxedcrfv|x123456|987654321a|1314woaini|123698741|huang123|h123456|qwertyuiop123456|1314521521|200820082008|q11111|qq1234567|123456l|12345677654321|0.123456789|poiuytrewq|woxiangni|123456789m|7417417474741|5201314789|123456789zxc|123456789qaz|123456789520|ai123456|52013143344|abcde12345|Love5201314|775852100|123456+|yongyuanaini|131452000|123zxc|147258369a|wohenni|woxihuanni|123456tt|134679258|yang123|zxcvbnm123456789|123456520|7758258123|qazwsx123456|abcdefg123456|123abc456|woaini1314.|wang123456789|s123456789|1357913579|abc5201314|zhangjing|asdfghj|123456780|2582587758|1234567890a|13145201314|520131488|a7758521|74108520963.|Y123456789|010203040506|5201314.|c123456|q5201314|789632145|huang123456|LAOpo520|xiao123456|LAOPO521|woaiwolaopo|zxcv123456|wan1314|m123456789|7410852963|yu123456|123456789ab|5201314qq|x123456789|123456788|a1234567890|BEIJING2008|wu123456|123456qqq|110112119|246813579|aidejiushini|w5201314|h123456789|12345a|123456m|qq147258369|yy123456|102030405060|123.123|123012301230|zhangqiang|asdfghjkl;\'|zhao123456|caonimabi|woaini3344|98765432100|123woaini|WOSHINIDIE|qwer123|12345678999|b123456|123456789as|woaini110|123456789p|love520|77582581314|wei123456|womendeai|00123456789|mengmeng|duibuqiwoaini|123...|iloveyou520|zhangyang|520131|131452|@163.com|12312|12|7936369|775852|521131|)|woain|52052|Adgjmptw|521|7.7088E+12|asdf|12332|woaini131|52152|2|1.23321E+12|Adgjm|aaaaa|321|808000|10101|xxm111|@126.com|woaini52|66666|88888|775825|962464|aaa|8888|8888888|13579|456|12365|5.20131E+13|198711|198712|1988|198811|14725836|2008|98765|125521|qwert|7.21522E+12|welcome|198911|1989|hu1990|14725|1478963|1212|520521|zhang|58452|1987|aaaa|888168|5555555|222|1236987|65432|259758|123369|753159|321123|198812|456654|zhangyu|252525|888|7|2009|1986|qq12345|895623|2222222|456258|11011|dandan|852963'),(379,'order_query_tradeno_limit','60'),(380,'order_query_contact_limit','300'),(381,'buy_protocol_time','5'),(382,'shop_voice',''),(383,'order_query_captcha_type','0'),(384,'cash_auto_status','0'),(385,'cash_auto_channel_id','1'),(386,'cash_auto_user',''),(387,'order_query_second_limit_orderid','1'),(388,'safe_tip','1');
/*!40000 ALTER TABLE `system_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_log`
--

DROP TABLE IF EXISTS `system_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ip` char(15) NOT NULL DEFAULT '' COMMENT '操作者IP地址',
  `node` char(200) NOT NULL DEFAULT '' COMMENT '当前操作节点',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '操作人用户名',
  `action` varchar(200) NOT NULL DEFAULT '' COMMENT '操作行为',
  `content` text NOT NULL COMMENT '操作内容描述',
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8 COMMENT='系统操作日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_log`
--

LOCK TABLES `system_log` WRITE;
/*!40000 ALTER TABLE `system_log` DISABLE KEYS */;
INSERT INTO `system_log` VALUES (1,'182.133.187.86','admin/login/index','admin','系统管理','用户登录系统成功','2022-11-19 02:24:01'),(2,'111.9.5.127','admin/login/index','admin','系统管理','用户登录系统成功','2022-12-18 07:46:10'),(3,'111.9.5.127','admin/config/index','admin','系统管理','系统参数配置成功','2022-12-18 09:09:54'),(4,'111.9.5.127','admin/menu/forbid','admin','系统配置','禁用菜单成功，ID:144,145','2022-12-18 09:10:51'),(5,'111.9.5.127','admin/login/index','admin','系统管理','用户登录系统成功','2022-12-18 09:12:10'),(6,'111.9.5.127','admin/menu/forbid','admin','系统配置','禁用菜单成功，ID:140,141,146','2022-12-18 09:12:55'),(7,'111.9.5.127','admin/menu/resume','admin','系统配置','启用菜单成功，ID:144,145','2022-12-18 09:13:03'),(8,'111.9.5.127','admin/menu/forbid','admin','系统配置','禁用菜单成功，ID:144,145','2022-12-18 09:13:16'),(9,'111.9.5.127','admin/menu/forbid','admin','系统配置','禁用菜单成功，ID:139,147,148,9999,150,151,152,153,154,155,10000,10001,10002,10003,10004,10005,10006,10007,10008,10009,10010,10011,10012,10013,10014,10015,10016,10017,10020,140,141,146,144,145','2022-12-18 09:13:28'),(10,'111.9.5.127','admin/menu/resume','admin','系统配置','启用菜单成功，ID:139,147,148,9999,150,151,152,153,154,155,10000,10001,10002,10003,10004,10005,10006,10007,10008,10009,10010,10011,10012,10013,10014,10015,10016,10017,10020,140,141,146,144,145','2022-12-18 09:13:40'),(11,'111.9.5.127','admin/menu/forbid','admin','系统配置','禁用菜单成功，ID:147','2022-12-18 09:13:46'),(12,'111.9.5.127','admin/menu/forbid','admin','系统配置','禁用菜单成功，ID:148','2022-12-18 09:13:52'),(13,'111.9.5.127','admin/menu/forbid','admin','系统配置','禁用菜单成功，ID:140,141,146','2022-12-18 09:14:34'),(14,'111.9.5.127','admin/menu/forbid','admin','系统配置','禁用菜单成功，ID:144,145','2022-12-18 09:14:40'),(15,'111.9.5.127','manage/user/add','admin','用户管理','添加商户成功，商户ID:1','2022-12-18 09:20:03'),(16,'111.9.5.127','manage/user/login','admin','用户管理','登录商户平台成功，商户ID:1','2022-12-18 09:20:42'),(17,'117.176.187.158','admin/login/index','admin','系统管理','用户登录系统成功','2023-01-02 10:51:49'),(18,'117.176.187.158','admin/config/index','admin','系统管理','系统参数配置成功','2023-01-02 10:52:27'),(19,'117.176.187.158','admin/config/index','admin','系统管理','系统参数配置成功','2023-01-02 10:52:42'),(20,'117.176.187.158','manage/channel/edit','admin','网关通道','编辑接口成功，ID:7','2023-01-02 11:17:13'),(21,'117.176.187.158','manage/channel/add','admin','网关通道','添加接口成功，ID:{\"title\":\"享支付支付宝\",\"lowrate\":0,\"paytype\":1,\"status\":1,\"show_name\":\"支付宝\",\"is_available\":0,\"sort\":0,\"code\":\"Yipay\",\"account_fields\":\"网关:gateway|pid:pid|key:key|支付类型:type\",\"default_fields\":\"type=alipay\",\"applyurl\":\"https:\\/\\/pay.codewo.cn\\/\",\"is_install\":1,\"id\":\"38\"}','2023-01-02 11:19:22'),(22,'117.176.187.158','manage/channel/edit','admin','网关通道','编辑接口成功，ID:7','2023-01-02 11:19:41'),(23,'117.176.187.158','manage/channel/add','admin','网关通道','添加接口成功，ID:{\"title\":\"享支付QQ\",\"lowrate\":0,\"paytype\":5,\"status\":1,\"show_name\":\"QQ支付\",\"is_available\":0,\"sort\":0,\"code\":\"Yipay\",\"account_fields\":\"网关:gateway|pid:pid|key:key|支付类型:type\",\"default_fields\":\"type=qqpay\",\"applyurl\":\"https:\\/\\/pay.codewo.cn\\/\",\"is_install\":1,\"id\":\"39\"}','2023-01-02 11:20:29'),(24,'117.176.187.158','manage/channel/change_status','admin','网关通道','成功开启接口，ID:7','2023-01-02 11:20:37'),(25,'117.176.187.158','manage/user/login','admin','用户管理','登录商户平台成功，商户ID:1','2023-01-02 11:22:03'),(26,'117.176.187.158','manage/site/domain','admin','系统管理','修改域名设置成功','2023-01-02 11:26:33'),(27,'117.176.187.158','manage/user/login','admin','用户管理','登录商户平台成功，商户ID:1','2023-01-02 11:31:10'),(28,'117.176.187.158','manage/site/domain','admin','系统管理','修改域名设置成功','2023-01-02 11:31:38'),(29,'117.176.187.158','manage/site/domain','admin','系统管理','修改域名设置成功','2023-01-02 11:32:58'),(30,'223.96.57.89','admin/login/index','admin','系统管理','用户登录系统成功','2023-06-13 06:45:44'),(31,'223.96.56.230','admin/login/index','admin','系统管理','用户登录系统成功','2023-06-13 12:22:24'),(32,'223.96.56.230','admin/login/index','admin','系统管理','用户登录系统成功','2023-06-13 12:24:27'),(33,'223.96.56.230','admin/config/index','admin','系统管理','系统参数配置成功','2023-06-13 12:24:57'),(34,'223.96.56.230','admin/config/index','admin','系统管理','系统参数配置成功','2023-06-13 12:25:01'),(35,'223.96.56.230','admin/config/index','admin','系统管理','系统参数配置成功','2023-06-13 12:25:20'),(36,'223.96.56.230','admin/config/index','admin','系统管理','系统参数配置成功','2023-06-13 12:25:49'),(37,'223.96.56.230','admin/config/index','admin','系统管理','系统参数配置成功','2023-06-13 12:26:27'),(38,'223.96.57.65','admin/login/index','admin','系统管理','用户登录系统成功','2023-06-15 14:13:20'),(39,'223.96.57.65','manage/site/domain','admin','系统管理','修改域名设置成功','2023-06-15 14:18:25'),(40,'223.96.57.65','manage/channelaccount/add','admin','网关通道','添加接口账号成功，ID:{\"name\":\"1\",\"rate_type\":0,\"status\":1,\"params\":{\"gateway\":\"https:\\/\\/a.ayaal.cn\\/\\/submit.php\",\"pid\":\"1143\",\"key\":\"ab0AkAf8C1Rn6ABqJq1YHi9h2zEeD4TR\",\"type\":\"wxpay\"},\"channel_id\":7,\"id\":\"1\"}','2023-06-15 14:24:19'),(41,'223.96.61.178','admin/login/index','admin','系统管理','用户登录系统成功','2023-06-26 12:55:18'),(42,'223.96.61.178','manage/channel/edit','admin','网关通道','编辑接口成功，ID:7','2023-06-26 14:17:15'),(43,'223.96.61.178','manage/channel/edit','admin','网关通道','编辑接口成功，ID:38','2023-06-26 14:17:29'),(44,'223.96.61.178','manage/channel/edit','admin','网关通道','编辑接口成功，ID:39','2023-06-26 14:17:38'),(45,'223.96.61.178','manage/site/domain','admin','系统管理','修改域名设置成功','2023-06-26 14:19:07'),(46,'223.96.61.178','manage/site/domain','admin','系统管理','修改域名设置成功','2023-06-26 14:19:48'),(47,'223.96.61.178','manage/site/domain','admin','系统管理','修改域名设置成功','2023-06-26 14:19:50'),(48,'223.96.61.178','manage/site/domain','admin','系统管理','修改域名设置成功','2023-06-26 14:19:51'),(49,'223.96.61.178','manage/site/domain','admin','系统管理','修改域名设置成功','2023-06-26 14:20:17'),(50,'223.96.61.178','manage/site/domain','admin','系统管理','修改域名设置成功','2023-06-26 14:20:21'),(51,'223.96.61.178','manage/site/domain','admin','系统管理','修改域名设置成功','2023-06-26 14:22:15'),(52,'223.96.61.178','manage/site/domain','admin','系统管理','修改域名设置成功','2023-06-26 14:22:19'),(53,'223.96.61.178','manage/channel/edit','admin','网关通道','编辑接口成功，ID:7','2023-06-26 14:22:47'),(54,'223.96.61.178','manage/channel/edit','admin','网关通道','编辑接口成功，ID:38','2023-06-26 14:23:07'),(55,'223.96.61.178','manage/channel/edit','admin','网关通道','编辑接口成功，ID:7','2023-06-26 14:23:20'),(56,'223.96.61.178','manage/channel/edit','admin','网关通道','编辑接口成功，ID:39','2023-06-26 14:23:30'),(57,'223.96.61.178','manage/channelaccount/del','admin','网关通道','成功删除供应商账号，ID:1','2023-06-26 14:23:46'),(58,'120.225.149.112','admin/config/index','admin','系统管理','系统参数配置成功','2023-09-14 15:17:09'),(59,'120.225.149.112','admin/config/index','admin','系统管理','系统参数配置成功','2023-09-14 15:18:55');
/*!40000 ALTER TABLE `system_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_menu`
--

DROP TABLE IF EXISTS `system_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_menu` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `pid` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '父id',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '名称',
  `node` varchar(200) NOT NULL DEFAULT '' COMMENT '节点代码',
  `icon` varchar(100) NOT NULL DEFAULT '' COMMENT '菜单图标',
  `url` varchar(400) NOT NULL DEFAULT '' COMMENT '链接',
  `params` varchar(500) DEFAULT '' COMMENT '链接参数',
  `target` varchar(20) NOT NULL DEFAULT '_self' COMMENT '链接打开方式',
  `sort` int(11) unsigned DEFAULT '0' COMMENT '菜单排序',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态(0:禁用,1:启用)',
  `create_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `index_system_menu_node` (`node`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10023 DEFAULT CHARSET=utf8 COMMENT='系统菜单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_menu`
--

LOCK TABLES `system_menu` WRITE;
/*!40000 ALTER TABLE `system_menu` DISABLE KEYS */;
INSERT INTO `system_menu` VALUES (2,0,'系统管理','','fa fa-gear','#','','_self',1000,1,0,'2015-11-16 11:15:38'),(4,2,'系统配置','','','#','','_self',100,1,0,'2016-03-14 10:12:55'),(5,4,'网站参数','','fa fa-apple','admin/config/index','','_self',20,1,0,'2016-05-06 06:36:49'),(6,4,'文件存储','','fa fa-save','admin/config/file','','_self',30,1,0,'2016-05-06 06:39:43'),(9,20,'后台操作日志','','glyphicon glyphicon-console','admin/log/index','','_self',50,1,0,'2017-03-24 07:49:31'),(19,20,'权限管理','','fa fa-user-secret','admin/auth/index','','_self',10,1,0,'2015-11-17 05:18:12'),(20,2,'系统权限','','','#','','_self',200,1,0,'2016-03-14 10:11:41'),(21,20,'系统菜单','','glyphicon glyphicon-menu-hamburger','admin/menu/index','','_self',30,1,0,'2015-11-16 11:16:16'),(22,20,'节点管理','','fa fa-ellipsis-v','admin/node/index','','_self',20,1,0,'2015-11-16 11:16:16'),(29,20,'系统用户','','fa fa-users','admin/user/index','','_self',40,1,0,'2016-10-31 06:31:40'),(61,0,'微信管理','','fa fa-wechat','#','','_self',2000,1,0,'2017-03-29 03:00:21'),(62,61,'微信对接配置','','','#','','_self',100,1,0,'2017-03-29 03:03:38'),(63,62,'微信接口配置\r\n','','fa fa-usb','wechat/config/index','','_self',10,1,0,'2017-03-29 03:04:44'),(65,61,'微信粉丝管理','','','#','','_self',300,1,0,'2017-03-29 03:08:32'),(66,65,'粉丝标签','','fa fa-tags','wechat/tags/index','','_self',10,1,0,'2017-03-29 03:09:41'),(67,65,'已关注粉丝','','fa fa-wechat','wechat/fans/index','','_self',20,1,0,'2017-03-29 03:10:07'),(68,61,'微信订制','','','#','','_self',200,1,0,'2017-03-29 03:10:39'),(69,68,'微信菜单定制','','glyphicon glyphicon-phone','wechat/menu/index','','_self',40,1,0,'2017-03-29 03:11:08'),(70,68,'关键字管理','','fa fa-paw','wechat/keys/index','','_self',10,1,0,'2017-03-29 03:11:49'),(71,68,'关注自动回复','','fa fa-commenting-o','wechat/keys/subscribe','','_self',20,1,0,'2017-03-29 03:12:32'),(81,68,'无配置默认回复','','fa fa-commenting-o','wechat/keys/defaults','','_self',30,1,0,'2017-04-21 06:48:25'),(82,61,'素材资源管理','','','#','','_self',300,1,0,'2017-04-24 03:23:18'),(83,82,'添加图文','','fa fa-folder-open-o','wechat/news/add?id=1','','_self',20,1,0,'2017-04-24 03:23:40'),(85,82,'图文列表','','fa fa-file-pdf-o','wechat/news/index','','_self',10,1,0,'2017-04-24 03:25:45'),(86,65,'粉丝黑名单','','fa fa-reddit-alien','wechat/fans/back','','_self',30,1,0,'2017-05-05 08:17:03'),(87,0,'插件案例','','','#','','_self',3000,0,0,'2017-07-10 07:10:16'),(88,87,'第三方插件','','','#','','_self',0,0,0,'2017-07-10 07:10:37'),(90,88,'PCAS 省市区','','','demo/plugs/region','','_self',0,0,0,'2017-07-10 10:45:47'),(91,87,'内置插件','','','#','','_self',0,0,0,'2017-07-10 10:56:59'),(92,91,'文件上传','','','demo/plugs/file','','_self',0,0,0,'2017-07-10 10:57:22'),(93,88,'富文本编辑器','','','demo/plugs/editor','','_self',0,0,0,'2017-07-28 07:19:44'),(94,0,'后台首页','','','admin/index/main','','_self',0,0,0,'2017-08-08 03:28:43'),(95,0,'网关通道','','fa fa-product-hunt','#','','_self',4000,1,0,'2018-01-18 03:08:57'),(97,95,'支付接口管理','','fa fa-product-hunt','manage/channel/index','','_self',0,1,0,'2018-01-18 03:09:53'),(99,4,'短信配置','','fa fa-envelope-o','manage/sms/index','','_self',50,1,0,'2018-01-18 03:36:42'),(100,4,'邮件配置','','fa fa-envelope-o','manage/email/index','','_self',60,1,0,'2018-01-19 05:45:19'),(101,0,'用户管理','','fa fa-users','#','','_self',5000,1,0,'2018-01-23 02:46:59'),(102,101,'商户管理','','fa fa-users','manage/user/index','','_self',0,1,0,'2018-01-23 02:47:40'),(103,0,'交易明细','','fa fa-bar-chart','#','','_self',6000,1,0,'2018-01-23 08:47:46'),(104,103,'订单列表','','fa fa-list-ol','manage/order/index','','_self',0,1,0,'2018-01-23 08:48:09'),(105,103,'金额变动记录','','fa fa-exchange','manage/log/user_money','','_self',100,1,0,'2018-01-24 07:02:50'),(106,0,'财务管理','','fa fa-google-wallet','#','','_self',8000,1,0,'2018-01-24 07:17:39'),(107,106,'提现管理','','fa fa-cny','manage/cash/index','','_self',0,1,0,'2018-01-24 07:18:06'),(108,4,'后台主页','','fa fa-area-chart','manage/index/main','','_self',0,1,0,'2018-01-26 06:19:38'),(109,106,'提现配置','','fa fa-google-wallet','manage/cash/config','','_self',70,1,0,'2018-01-29 07:29:43'),(110,4,'站点信息','','glyphicon glyphicon-info-sign','manage/site/info','','_self',21,1,0,'2018-01-29 08:26:24'),(111,4,'域名设置','','fa fa-at','manage/site/domain','','_self',25,1,0,'2018-01-29 08:47:15'),(112,4,'注册设置','','fa fa-cog','manage/site/register','','_self',27,1,0,'2018-01-29 10:45:43'),(113,4,'字词过滤','','fa fa-filter','manage/site/wordfilter','','_self',90,1,0,'2018-01-30 06:50:48'),(114,103,'商户分析','','fa fa-area-chart','manage/order/merchant','','_self',40,1,0,'2018-01-31 03:32:00'),(115,103,'渠道分析','','fa fa-area-chart','manage/order/channel','','_self',50,1,0,'2018-01-31 03:32:29'),(116,103,'实时数据','','fa fa-area-chart','manage/order/hour','','_self',60,1,0,'2018-01-31 03:32:57'),(117,0,'商品管理','','fa fa-shopping-bag','#','','_self',5500,1,0,'2018-02-01 10:43:51'),(118,117,'商品管理','','fa fa-shopping-bag','manage/goods/index','','_self',0,1,0,'2018-02-01 10:44:10'),(119,103,'投诉管理','','fa fa-bullhorn','manage/complaint/index','','_self',20,1,0,'2018-02-02 07:34:06'),(120,101,'登录日志','','fa fa-paw','manage/user/loginlog','','_self',0,1,0,'2018-02-05 02:29:10'),(121,0,'内容管理','','fa fa-file-text','#','','_self',4500,1,0,'2018-02-09 02:38:43'),(122,121,'内容管理','','fa fa-file-text','manage/article/index','','_self',0,1,0,'2018-02-09 02:44:51'),(123,121,'分类管理','','fa fa-bars','manage/article_category/index','','_self',0,1,0,'2018-03-05 16:13:26'),(124,4,'备份管理','','fa fa-database','manage/backup/index','','_self',100,0,0,'2018-03-12 11:31:11'),(125,4,'前台导航','','fa fa-navicon','admin/nav/index','','_self',110,1,0,'2018-03-23 09:08:38'),(126,101,'登录解锁','','fa fa-unlock','/manage/user/unlock','','_self',0,1,0,'2018-03-27 03:15:00'),(127,20,'商户操作日志','','fa fa-thumb-tack','/admin/mlog/index','','_self',60,1,0,'2018-03-27 08:19:10'),(128,4,'推广设置','','fa fa-bullhorn','/manage/site/spread','','_self',120,1,0,'2018-03-27 11:19:29'),(129,101,'邀请码管理','','fa fa-user-plus','/manage/invite_code/index','','_self',0,1,0,'2018-03-27 11:54:29'),(130,117,'订单自定义','','fa fa-credit-card-alt','manage/goods/change_trade_no_status','','_self',0,1,0,'2018-04-20 01:03:50'),(131,95,'费率分组管理','','','manage/rate/index','','_self',50,1,0,'2018-07-05 10:26:39'),(133,95,'安装支付接口','','fa fa-futbol-o','manage/channel/index?is_install=0','','_self',0,1,0,'2018-01-17 19:09:53'),(135,106,'代付渠道管理','','fa fa-futbol-o','manage/cashChannel/index','','_self',1000,1,0,'2018-08-07 07:50:38'),(138,117,'商品池管理','','fa fa-shopping-bag','/manage/goods/pool_list','','_self',0,1,0,'2020-05-01 14:51:40'),(139,0,'应用中心','','fa fa-cloud','#','','_self',9000,1,0,'2020-12-17 15:28:08'),(140,139,'应用中心','','','#','','_self',30,0,0,'2020-12-17 15:31:58'),(141,140,'模板主题','','fa fa-tv','admin/cloud/theme','','_self',10,0,0,'2020-12-17 15:35:26'),(144,139,'站长推荐','','','#','','_self',30,0,0,'2020-12-17 15:41:21'),(145,144,'云服务器','','fa fa-server','admin/cloud/server','','_self',10,0,0,'2020-12-17 15:42:15'),(146,140,'支付接口','','fa fa-paypal','admin/cloud/payment','','_self',20,0,0,'2020-12-17 15:43:23'),(147,139,'个人中心','','glyphicon glyphicon-user','admin/cloud/user','','_self',0,0,0,'2020-12-17 15:48:20'),(148,139,'系统升级','','glyphicon glyphicon-cloud','admin/Cloud/upgrade','','_self',10,0,0,'2021-01-20 08:54:14'),(149,117,'商品池标签','','fa fa-cubes','manage/goods/pool_span','','_self',0,1,0,'2021-02-06 15:31:00'),(150,9999,'实时数据可视化','','fa fa-desktop','manage/plugin/bgdata','','_self',0,1,0,'2021-02-10 07:46:38'),(151,9999,'流水挑战','','glyphicon glyphicon-equalizer','manage/plugin/tradetask','','_self',0,1,0,'2021-02-15 02:22:54'),(152,9999,'风控展示','','fa fa-shield','manage/plugin/risk','','_self',0,1,0,'2021-02-17 07:14:47'),(153,9999,'店铺引导页','','fa fa-modx','manage/plugin/guide','','_self',0,1,0,'2021-02-23 08:07:50'),(154,9999,'数据库迁移','','fa fa-random','manage/plugin/migrate','','_self',0,1,0,'2021-02-26 15:48:40'),(155,9999,'商户子域名','','fa fa-link','manage/plugin/subdomain','','_self',0,1,0,'2021-02-28 03:31:20'),(9999,139,'扩展功能','','','#','','_self',20,1,0,'2020-12-17 15:37:09'),(10000,9999,'第三方登录','','fa fa-sign-in','manage/plugin/oauth2','','_self',0,1,0,'2021-03-05 04:10:13'),(10001,9999,'实名认证','','fa fa-shield','manage/plugin/merchantauth','','_self',0,1,0,'2021-03-10 08:59:19'),(10002,9999,'APP打包','','glyphicon glyphicon-phone','manage/plugin/app','','_self',0,1,0,'2021-03-30 07:38:51'),(10003,9999,'流水排行榜','','fa fa-sort-amount-desc','manage/plugin/traderank','','_self',0,1,0,'2021-04-02 13:43:28'),(10004,9999,'购卡页DIY','','fa fa-lemon-o','manage/plugin/shopdiy','','_self',0,1,0,'2021-04-13 05:05:15'),(10005,9999,'代理及全网通','','fa fa-clone','manage/plugin/agentsetting','','_self',0,1,0,'2021-04-21 14:53:18'),(10006,9999,'支付风控策略','','fa fa-product-hunt','manage/plugin/paysafe','','_self',0,1,0,'2021-05-02 12:21:52'),(10007,9999,'系统安全增强','','fa fa-lock','manage/plugin/systemsafe','','_self',0,1,0,'2021-05-04 07:35:06'),(10008,9999,'网关锁','','fa fa-lock','manage/plugin/glock','','_self',0,1,0,'2021-05-16 07:41:14'),(10009,9999,'跨平台对接','','fa fa-connectdevelop','manage/plugin/cross','','_self',0,1,0,'2021-05-26 16:29:28'),(10010,9999,'惩罚机制','','fa fa-frown-o','manage/plugin/punish','','_self',0,1,0,'2021-06-23 02:35:32'),(10011,9999,'锁卡机制','','fa fa-unlock-alt','/manage/plugin/lockcard','','_self',0,1,0,'2021-06-29 11:04:19'),(10012,9999,'站长工具','','fa fa-th','/manage/plugin/tools','','_self',0,1,0,'2021-06-30 03:58:22'),(10013,9999,'支付API','','fa fa-paypal','manage/plugin/payapi','','_self',0,1,0,'2021-06-30 12:26:15'),(10014,9999,'自助选号','','fa fa-gittip','manage/plugin/selectcard','','_self',0,1,0,'2021-07-07 14:23:06'),(10015,9999,'商户自定义支付','','fa fa-puzzle-piece','manage/plugin/custompay','','_self',0,1,0,'2021-07-16 11:00:47'),(10016,9999,'免签码支付','','fa fa-qrcode','manage/plugin/codepay','','_self',0,1,0,'2021-07-25 13:08:58'),(10017,9999,'客服系统','','fa fa-send-o','manage/plugin/chat','','_self',0,1,0,'2021-08-06 09:00:33'),(10018,103,'API订单','','fa fa-paypal','manage/plugin/payapiorder','','_self',0,1,0,'2021-10-19 12:27:57'),(10019,103,'商户API统计','','fa fa-area-chart','manage/order/apimerchant','','_self',45,1,0,'2021-10-22 13:33:31'),(10020,9999,'推广大使','','fa fa-users','manage/plugin/ambassador','','_self',0,1,0,'2021-11-15 14:31:12'),(10021,106,'支付宝全自动打款','','fa fa-credit-card','manage/cash/autoconfig','','_self',1001,1,0,'2022-02-22 13:45:15'),(10022,95,'电商合规支付','','fa fa-leaf','manage/plugin/airpayx','','_self',60,1,0,'2022-02-22 16:03:08');
/*!40000 ALTER TABLE `system_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_node`
--

DROP TABLE IF EXISTS `system_node`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_node` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `node` varchar(100) DEFAULT NULL COMMENT '节点代码',
  `title` varchar(500) DEFAULT NULL COMMENT '节点标题',
  `is_menu` tinyint(1) unsigned DEFAULT '0' COMMENT '是否可设置为菜单',
  `is_auth` tinyint(1) unsigned DEFAULT '1' COMMENT '是否启动RBAC权限控制',
  `is_login` tinyint(1) unsigned DEFAULT '1' COMMENT '是否启动登录控制',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_system_node_node` (`node`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=504 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='系统节点表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_node`
--

LOCK TABLES `system_node` WRITE;
/*!40000 ALTER TABLE `system_node` DISABLE KEYS */;
INSERT INTO `system_node` VALUES (131,'admin/auth/index','权限列表',1,1,1,'2017-08-22 23:45:42'),(132,'admin','后台管理',0,1,1,'2017-08-22 23:45:44'),(133,'admin/auth/apply','节点授权',0,1,1,'2017-08-23 00:05:18'),(134,'admin/auth/add','添加授权',0,1,1,'2017-08-23 00:05:19'),(135,'admin/auth/edit','编辑权限',0,1,1,'2017-08-23 00:05:19'),(136,'admin/auth/forbid','禁用权限',0,1,1,'2017-08-23 00:05:20'),(137,'admin/auth/resume','启用权限',0,1,1,'2017-08-23 00:05:20'),(138,'admin/auth/del','删除权限',0,1,1,'2017-08-23 00:05:21'),(139,'admin/config/index','参数配置',1,1,1,'2017-08-23 00:05:22'),(140,'admin/config/file','文件配置',1,1,1,'2017-08-23 00:05:22'),(141,'admin/log/index','日志列表',1,1,1,'2017-08-23 00:05:23'),(142,'admin/log/del','删除日志',0,1,1,'2017-08-23 00:05:24'),(143,'admin/menu/index','菜单列表',1,1,1,'2017-08-23 00:05:25'),(144,'admin/menu/add','添加菜单',0,1,1,'2017-08-23 00:05:25'),(145,'admin/menu/edit','编辑菜单',0,1,1,'2017-08-23 00:05:26'),(146,'admin/menu/del','删除菜单',0,1,1,'2017-08-23 00:05:26'),(147,'admin/menu/forbid','禁用菜单',0,1,1,'2017-08-23 00:05:27'),(148,'admin/menu/resume','启用菜单',0,1,1,'2017-08-23 00:05:28'),(149,'admin/node/index','节点列表',1,1,1,'2017-08-23 00:05:29'),(150,'admin/node/save','节点更新',0,1,1,'2017-08-23 00:05:30'),(151,'admin/user/index','用户管理',1,1,1,'2017-08-23 00:05:31'),(152,'admin/user/auth','用户授权',0,1,1,'2017-08-23 00:05:32'),(153,'admin/user/add','添加用户',0,1,1,'2017-08-23 00:05:33'),(154,'admin/user/edit','编辑用户',0,1,1,'2017-08-23 00:05:33'),(155,'admin/user/pass','用户密码',0,1,1,'2017-08-23 00:05:34'),(156,'admin/user/del','删除用户',0,1,1,'2017-08-23 00:05:34'),(157,'admin/user/forbid','禁用用户',0,1,1,'2017-08-23 00:05:34'),(158,'admin/user/resume','启用用户',0,1,1,'2017-08-23 00:05:35'),(159,'demo/plugs/file','文件上传',1,1,1,'2017-08-23 00:05:36'),(160,'demo/plugs/region','区域选择',1,1,1,'2017-08-23 00:05:36'),(161,'demo/plugs/editor','富文本器',1,1,1,'2017-08-23 00:05:37'),(162,'wechat/config/index','微信参数',1,1,1,'2017-08-23 00:05:37'),(163,'wechat/config/pay','微信支付',0,1,1,'2017-08-23 00:05:38'),(164,'wechat/fans/index','粉丝列表',1,1,1,'2017-08-23 00:05:39'),(165,'wechat/fans/back','粉丝黑名单',1,1,1,'2017-08-23 00:05:39'),(166,'wechat/fans/backadd','移入黑名单',0,1,1,'2017-08-23 00:05:40'),(167,'wechat/fans/tagset','设置标签',0,1,1,'2017-08-23 00:05:41'),(168,'wechat/fans/backdel','移出黑名单',0,1,1,'2017-08-23 00:05:41'),(169,'wechat/fans/tagadd','添加标签',0,1,1,'2017-08-23 00:05:41'),(170,'wechat/fans/tagdel','删除标签',0,1,1,'2017-08-23 00:05:42'),(171,'wechat/fans/sync','同步粉丝',0,1,1,'2017-08-23 00:05:43'),(172,'wechat/keys/index','关键字列表',1,1,1,'2017-08-23 00:05:44'),(173,'wechat/keys/add','添加关键字',0,1,1,'2017-08-23 00:05:44'),(174,'wechat/keys/edit','编辑关键字',0,1,1,'2017-08-23 00:05:45'),(175,'wechat/keys/del','删除关键字',0,1,1,'2017-08-23 00:05:45'),(176,'wechat/keys/forbid','禁用关键字',0,1,1,'2017-08-23 00:05:46'),(177,'wechat/keys/resume','启用关键字',0,1,1,'2017-08-23 00:05:46'),(178,'wechat/keys/subscribe','关注默认回复',0,1,1,'2017-08-23 00:05:48'),(179,'wechat/keys/defaults','默认响应回复',0,1,1,'2017-08-23 00:05:49'),(180,'wechat/menu/index','微信菜单',1,1,1,'2017-08-23 00:05:51'),(181,'wechat/menu/edit','发布微信菜单',0,1,1,'2017-08-23 00:05:51'),(182,'wechat/menu/cancel','取消微信菜单',0,1,1,'2017-08-23 00:05:52'),(183,'wechat/news/index','微信图文列表',1,1,1,'2017-08-23 00:05:52'),(184,'wechat/news/select','微信图文选择',0,1,1,'2017-08-23 00:05:53'),(185,'wechat/news/image','微信图片选择',0,1,1,'2017-08-23 00:05:53'),(186,'wechat/news/add','添加图文',0,1,1,'2017-08-23 00:05:54'),(187,'wechat/news/edit','编辑图文',0,1,1,'2017-08-23 00:05:56'),(188,'wechat/news/del','删除图文',0,1,1,'2017-08-23 00:05:56'),(189,'wechat/news/push','推送图文',0,1,1,'2017-08-23 00:05:56'),(190,'wechat/tags/index','微信标签列表',1,1,1,'2017-08-23 00:05:58'),(191,'wechat/tags/add','添加微信标签',0,1,1,'2017-08-23 00:05:58'),(192,'wechat/tags/edit','编辑微信标签',0,1,1,'2017-08-23 00:05:58'),(193,'wechat/tags/sync','同步微信标签',0,1,1,'2017-08-23 00:05:59'),(194,'admin/auth','权限管理',0,1,1,'2017-08-23 00:06:58'),(195,'admin/config','系统配置',0,1,1,'2017-08-23 00:07:34'),(196,'admin/log','系统日志',0,1,1,'2017-08-23 00:07:46'),(197,'admin/menu','系统菜单',0,1,1,'2017-08-23 00:08:02'),(198,'admin/node','系统节点',0,1,1,'2017-08-23 00:08:44'),(199,'admin/user','系统用户',0,1,1,'2017-08-23 00:09:43'),(200,'demo','插件案例',0,1,1,'2017-08-23 00:10:43'),(201,'demo/plugs','插件案例',0,1,1,'2017-08-23 00:10:51'),(202,'wechat','微信管理',0,1,1,'2017-08-23 00:11:13'),(203,'wechat/config','微信配置',0,1,1,'2017-08-23 00:11:19'),(204,'wechat/fans','粉丝管理',0,1,1,'2017-08-23 00:11:36'),(205,'wechat/keys','关键字管理',0,1,1,'2017-08-23 00:13:00'),(206,'wechat/menu','微信菜单管理',0,1,1,'2017-08-23 00:14:11'),(207,'wechat/news','微信图文管理',0,1,1,'2017-08-23 00:14:40'),(208,'wechat/tags','微信标签管理',0,1,1,'2017-08-23 00:15:25'),(209,'manage/channel/index','供应商管理',0,1,1,'2018-01-18 21:53:53'),(210,'manage/channel/add','添加供应商',0,1,1,'2018-01-18 21:53:54'),(211,'manage/channel/edit','修改供应商',0,1,1,'2018-01-18 21:53:54'),(212,'manage/channel/del','删除供应商',0,1,1,'2018-01-18 21:53:54'),(213,'manage/channel/change_status','修改供应商状态',0,1,1,'2018-01-18 21:53:55'),(214,'manage/channel/getlistbypaytype','根据支付类型获取支付供应商列表',0,1,1,'2018-01-18 21:53:55'),(215,'manage/channelaccount/add','添加供应商账号',0,1,1,'2018-01-18 21:54:03'),(216,'manage/channelaccount/index','供应商账号管理',0,1,1,'2018-01-18 21:54:04'),(217,'manage/channelaccount/edit','修改供应商账号',0,1,1,'2018-01-18 21:54:05'),(218,'manage/channelaccount/del','删除供应商账号',0,1,1,'2018-01-18 21:54:06'),(219,'manage/channelaccount/clear','清除供应商账号额度',0,1,1,'2018-01-18 21:54:07'),(220,'manage/channelaccount/change_status','修改供应商账号状态',0,1,1,'2018-01-18 21:54:07'),(221,'manage/channelaccount/getfields','获取渠道账户字段',0,1,1,'2018-01-18 21:54:08'),(222,'manage/email/index','邮件配置',0,1,1,'2018-01-18 21:54:10'),(223,'manage/email/test','发信测试',0,1,1,'2018-01-18 21:54:10'),(224,'manage/product/index','支付产品管理',0,1,1,'2018-01-18 21:54:11'),(225,'manage/product/add','添加支付产品',0,1,1,'2018-01-18 21:54:12'),(226,'manage/product/edit','编辑支付产品',0,1,1,'2018-01-18 21:54:12'),(227,'manage/product/del','删除支付产品',0,1,1,'2018-01-18 21:54:14'),(228,'manage/product/change_status','修改支付产品状态',0,1,1,'2018-01-18 21:54:14'),(229,'manage/sms/index','短信配置',0,1,1,'2018-01-18 21:54:15'),(230,'manage/cash/index','提现列表',0,1,1,'2018-01-25 00:47:20'),(231,'manage/cash/detail','提现申请详情',0,1,1,'2018-01-25 00:47:20'),(232,'manage/cash/payqrcode','',0,1,1,'2018-01-25 00:47:21'),(233,'manage/log/user_money','金额变动记录',0,1,1,'2018-01-25 00:47:24'),(234,'manage/order/index','订单列表',0,1,1,'2018-01-25 00:47:25'),(235,'manage/order/detail','订单详情',0,1,1,'2018-01-25 00:47:26'),(236,'manage/user/index','商户管理',0,1,1,'2018-01-25 00:47:29'),(237,'manage/user/change_status','修改商户审核状态',0,1,1,'2018-01-25 00:47:30'),(238,'manage/user/detail','查看商户详情',0,1,1,'2018-01-25 00:47:30'),(239,'manage/user/add','添加商户',0,1,1,'2018-01-25 00:47:31'),(240,'manage/user/edit','编辑商户',0,1,1,'2018-01-25 00:47:31'),(241,'manage/user/del','删除商户',0,1,1,'2018-01-25 00:47:32'),(242,'manage/user/manage_money','商户资金管理',0,1,1,'2018-01-25 00:47:32'),(243,'manage/user/rate','设置商户费率',0,1,1,'2018-01-25 00:47:33'),(244,'manage/cash/config','提现配置',0,1,1,'2018-02-01 01:00:28'),(245,'manage/index/main','主页',0,1,1,'2018-02-01 01:00:33'),(246,'manage/order/merchant','商户分析',0,1,1,'2018-02-01 01:00:35'),(247,'manage/order/channel','渠道分析',0,1,1,'2018-02-01 01:00:36'),(248,'manage/order/hour','实时数据',0,1,1,'2018-02-01 01:00:36'),(249,'manage/site/info','站点信息配置',0,1,1,'2018-02-01 01:00:40'),(250,'manage/site/domain','域名设置',0,1,1,'2018-02-01 01:00:40'),(251,'manage/site/register','注册设置',0,1,1,'2018-02-01 01:00:41'),(252,'manage/site/wordfilter','字词过滤',0,1,1,'2018-02-01 01:00:41'),(253,'manage/user/change_freeze_status','修改商户冻结状态',0,1,1,'2018-02-01 01:00:43'),(254,'manage/user/login','商户登录',0,1,1,'2018-02-01 01:00:45'),(255,'manage/user/message','商户站内信',0,1,1,'2018-02-01 01:00:45'),(256,'merchant/cash/index','',0,0,0,'2018-02-01 01:00:48'),(257,'manage/goods/index','商品管理',0,1,1,'2018-02-01 03:33:28'),(258,'manage/goods/change_status','修改商品上架状态',0,1,1,'2018-02-01 03:33:29'),(259,'manage/complaint/index','投诉管理',0,1,1,'2018-02-02 03:46:10'),(260,'manage/complaint/change_status','修改投诉处理状态',0,1,1,'2018-02-02 03:46:11'),(261,'manage/complaint/change_admin_read','修改投诉读取状态',0,1,1,'2018-02-02 03:46:11'),(262,'manage/complaint/del','删除投诉',0,1,1,'2018-02-02 03:46:12'),(263,'manage/order/change_freeze_status','修改订单冻结状态',0,1,1,'2018-02-05 02:24:23'),(264,'manage/user/loginlog','商户登录日志',0,1,1,'2018-02-05 02:24:31'),(265,'merchant/user/closelink','',0,0,0,'2018-03-19 22:22:03'),(266,'merchant/goodscategory','',0,0,0,'2018-03-19 22:22:32'),(267,'merchant/cash/apply','',0,0,0,'2018-03-19 22:22:35'),(268,'merchant/cash','',0,0,0,'2018-03-19 22:22:38'),(269,'merchant','',0,0,0,'2018-03-19 22:23:00'),(270,'manage/article/add','添加文章',0,1,1,'2018-03-19 22:23:38'),(271,'manage/article/edit','编辑文章',0,1,1,'2018-03-19 22:23:39'),(272,'manage/article/index','内容管理',0,1,1,'2018-03-19 22:23:39'),(273,'manage/article/change_status','修改文章状态',0,1,1,'2018-03-19 22:23:40'),(274,'manage/article/del','删除文章',0,1,1,'2018-03-19 22:23:41'),(275,'manage/articlecategory/index','文章分类管理',0,1,1,'2018-03-19 22:23:53'),(276,'manage/articlecategory/add','添加文章分类',0,1,1,'2018-03-19 22:23:53'),(277,'manage/articlecategory/edit','编辑文章分类',0,1,1,'2018-03-19 22:23:54'),(278,'manage/articlecategory/change_status','修改文章分类状态',0,1,1,'2018-03-19 22:23:54'),(279,'manage/articlecategory/del','删除文章分类',0,1,1,'2018-03-19 22:23:55'),(280,'manage/backup/index','备份管理',0,1,1,'2018-03-19 22:24:04'),(281,'manage/backup/tablist','获取数据表',0,1,1,'2018-03-19 22:24:05'),(282,'manage/backup/backall','备份数据库',0,1,1,'2018-03-19 22:24:06'),(283,'manage/backup/backtables','按表备份',0,1,1,'2018-03-19 22:24:07'),(284,'manage/backup/recover','还原数据库',0,1,1,'2018-03-19 22:24:07'),(285,'manage/backup/downloadbak','下载备份文件',0,1,1,'2018-03-19 22:24:08'),(286,'manage/backup/deletebak','删除备份',0,1,1,'2018-03-19 22:24:09'),(287,'manage/article','内容管理',0,1,1,'2018-03-22 00:32:51'),(288,'admin/auth/google','',0,0,0,'2018-03-22 00:33:13'),(289,'admin/auth/bindgoogle','生成绑定谷歌身份验证器二维码',0,1,1,'2018-03-22 00:39:13'),(290,'manage/user','用户管理',0,1,1,'2018-03-22 00:41:20'),(291,'manage/sms','短信配置',0,1,1,'2018-03-22 00:44:54'),(292,'manage/site','站点信息',0,1,1,'2018-03-22 00:45:04'),(293,'manage/product','支付产品管理',0,1,1,'2018-03-22 00:47:47'),(294,'manage/order/del_batch','批量删除无效订单',0,1,1,'2018-03-22 00:48:42'),(295,'manage/order/del','删除无效订单',0,1,1,'2018-03-22 00:48:43'),(296,'manage/order','交易明细',0,1,1,'2018-03-22 00:50:10'),(297,'manage/log','金额变动记录',0,1,1,'2018-03-22 00:51:25'),(298,'manage/index','主页',0,1,1,'2018-03-22 00:51:55'),(299,'manage/goods','商品管理',0,1,1,'2018-03-22 00:52:09'),(300,'manage/email','邮件配置',0,1,1,'2018-03-22 00:53:07'),(301,'manage/complaint','投诉管理',0,1,1,'2018-03-22 00:54:06'),(302,'manage/channelaccount','供应商账号管理',0,1,1,'2018-03-22 00:54:52'),(303,'manage/channel','供应商管理',0,1,1,'2018-03-22 02:45:06'),(304,'manage/cash','提现管理',0,1,1,'2018-03-22 02:46:43'),(305,'manage/backup','备份管理',0,1,1,'2018-03-22 02:49:14'),(306,'manage/articlecategory','文章分类管理',0,1,1,'2018-03-22 02:53:43'),(307,'manage/goods/change_trade_no_status',NULL,0,1,1,'2018-04-19 17:04:48'),(308,'shop/shop/index',NULL,0,0,0,'2018-06-21 02:19:27'),(309,'shop/shop/category',NULL,0,0,0,'2018-06-21 02:19:28'),(310,'shop/shop/goods',NULL,0,0,0,'2018-06-21 02:20:39'),(311,'shop/shop/getgoodslist',NULL,0,0,0,'2018-06-21 02:20:40'),(312,'shop/shop/getgoodsinfo',NULL,0,0,0,'2018-06-21 02:20:41'),(313,'shop/shop/getrate',NULL,0,0,0,'2018-06-21 02:20:41'),(314,'shop/shop/getdiscounts',NULL,0,0,0,'2018-06-21 02:20:42'),(315,'shop/shop/getdiscount',NULL,0,0,0,'2018-06-21 02:20:43'),(316,'shop/shop/checkvisitpassword',NULL,0,0,0,'2018-06-21 02:20:43'),(317,'shop/shop/checkcoupon',NULL,0,0,0,'2018-06-21 02:20:44'),(318,'manage/agent/close_all_site_agent','',0,1,1,'2019-04-28 01:41:43'),(319,'manage/agent/index',NULL,0,1,1,'2019-04-28 01:41:44'),(320,'admin/mlog/index',NULL,0,1,1,'2019-07-29 09:06:20'),(321,'admin/mlog/del',NULL,0,1,1,'2019-07-29 09:06:21'),(322,'admin/nav/index',NULL,0,1,1,'2019-07-29 09:06:25'),(323,'admin/nav/add',NULL,0,1,1,'2019-07-29 09:06:26'),(324,'manage/cashchannelaccount/index',NULL,0,1,1,'2019-07-29 09:06:40'),(325,'manage/cashchannelaccount/add',NULL,0,1,1,'2019-07-29 09:06:41'),(326,'manage/cashchannelaccount/edit',NULL,0,1,1,'2019-07-29 09:06:42'),(327,'manage/cashchannelaccount/del',NULL,0,1,1,'2019-07-29 09:06:43'),(328,'manage/cashchannelaccount/clear',NULL,0,1,1,'2019-07-29 09:06:43'),(329,'manage/cashchannelaccount/change_status',NULL,0,1,1,'2019-07-29 09:06:44'),(330,'manage/cashchannelaccount/getfields',NULL,0,1,1,'2019-07-29 09:06:44'),(331,'manage/invitecode/delnum',NULL,0,1,1,'2019-07-29 09:07:20'),(332,'manage/invitecode/del',NULL,0,1,1,'2019-07-29 09:07:22'),(333,'manage/invitecode/add',NULL,0,1,1,'2019-07-29 09:07:23'),(334,'manage/invitecode/index',NULL,0,1,1,'2019-07-29 09:07:24'),(335,'manage/goods/del',NULL,0,1,1,'2019-07-29 09:07:31'),(336,'manage/goods/change_freeze',NULL,0,1,1,'2019-07-29 09:07:33'),(337,'manage/content/del',NULL,0,1,1,'2019-07-29 09:08:03'),(338,'manage/channel/change_available',NULL,0,1,1,'2019-07-29 09:08:14'),(339,'manage/channel/install',NULL,0,1,1,'2019-07-29 09:08:15'),(340,'manage/channel/uninstall',NULL,0,1,1,'2019-07-29 09:08:15'),(341,'manage/cashchannel/change_status',NULL,0,1,1,'2019-07-29 09:08:36'),(342,'manage/cashchannel/index',NULL,0,1,1,'2019-07-29 09:08:37'),(343,'manage/cash/pay_batch',NULL,0,1,1,'2019-07-29 09:08:39'),(344,'manage/cash/daifu',NULL,0,1,1,'2019-07-29 09:08:40'),(345,'manage/cash/dumpcashs',NULL,0,1,1,'2019-07-29 09:08:43'),(346,'manage/cash/getcashdata',NULL,0,1,1,'2019-07-29 09:08:45'),(347,'manage/article/top',NULL,0,1,1,'2019-07-29 09:08:53'),(348,'admin/nav/resume',NULL,0,1,1,'2019-07-29 09:09:13'),(349,'admin/nav/forbid',NULL,0,1,1,'2019-07-29 09:09:14'),(350,'admin/nav/del',NULL,0,1,1,'2019-07-29 09:09:15'),(351,'admin/nav/edit',NULL,0,1,1,'2019-07-29 09:09:15'),(353,'manage/complaint/win',NULL,0,1,1,'2019-07-29 09:11:52'),(354,'manage/complaint/detail',NULL,0,1,1,'2019-07-29 09:11:53'),(355,'manage/rate/change_status',NULL,0,1,1,'2019-07-29 09:11:59'),(356,'manage/rate/del',NULL,0,1,1,'2019-07-29 09:12:00'),(357,'manage/rate/save',NULL,0,1,1,'2019-07-29 09:12:01'),(358,'manage/rate/detail',NULL,0,1,1,'2019-07-29 09:12:02'),(359,'manage/rate/add',NULL,0,1,1,'2019-07-29 09:12:03'),(360,'manage/rate/index',NULL,0,1,1,'2019-07-29 09:12:05'),(361,'manage/site/spread',NULL,0,1,1,'2019-07-29 09:12:11'),(362,'manage/site/clearcache',NULL,0,1,1,'2019-07-29 09:12:12'),(363,'manage/user/allow_update',NULL,0,1,1,'2019-07-29 09:12:18'),(364,'manage/user/getraterouteinfo',NULL,0,1,1,'2019-07-29 09:12:23'),(365,'manage/user/unlock',NULL,0,1,1,'2019-07-29 09:12:28'),(366,'manage/user/open_all_site_agent',NULL,0,1,1,'2019-07-29 09:12:29'),(367,'admin/index/index',NULL,0,1,1,'2019-07-29 09:20:02'),(368,'admin/index/main',NULL,0,1,1,'2019-07-29 09:20:03'),(369,'admin/index/pass',NULL,0,1,1,'2019-07-29 09:20:03'),(370,'admin/index/info',NULL,0,1,1,'2019-07-29 09:20:04'),(371,'admin/index/version',NULL,0,1,1,'2019-07-29 09:20:04'),(372,'admin/index/version_update',NULL,0,1,1,'2019-07-29 09:20:05'),(373,'admin/index/autoupdate',NULL,0,1,1,'2019-07-29 09:20:06'),(375,'manage/goods/agentlist',NULL,0,1,1,'2020-12-15 15:24:12'),(376,'manage/goods/check',NULL,0,1,1,'2020-12-15 15:24:13'),(377,'admin/cloud/user',NULL,0,1,1,'2021-01-22 05:40:18'),(378,'admin/cloud/theme',NULL,0,1,1,'2021-01-22 05:40:19'),(379,'admin/cloud/plugin',NULL,0,1,1,'2021-01-22 05:40:21'),(380,'admin/cloud/server',NULL,0,1,1,'2021-01-22 05:40:22'),(381,'admin/cloud/payment',NULL,0,1,1,'2021-01-22 05:40:23'),(382,'admin/cloud/checkversion',NULL,0,1,1,'2021-01-22 05:40:24'),(383,'admin/cloud/upgrade',NULL,0,1,1,'2021-01-22 05:40:25'),(384,'admin/cloud/install',NULL,0,1,1,'2021-01-22 05:40:25'),(385,'manage/complaint/send',NULL,0,1,1,'2021-01-22 05:44:29'),(386,'manage/complaint/sendimg',NULL,0,1,1,'2021-01-22 05:44:29'),(387,'manage/goods/agent_list',NULL,0,1,1,'2021-01-22 05:51:51'),(388,'manage/order/senddelbatchsms',NULL,0,1,1,'2021-01-22 05:52:43'),(389,'admin/cloud/auth',NULL,0,1,1,'2021-01-23 19:00:30'),(390,'admin/cloud',NULL,0,1,1,'2022-11-19 02:24:02'),(391,'admin/index',NULL,0,1,1,'2022-11-19 02:24:02'),(392,'admin/index/agreement',NULL,0,1,1,'2022-11-19 02:24:02'),(393,'admin/mlog',NULL,0,1,1,'2022-11-19 02:24:02'),(394,'admin/nav',NULL,0,1,1,'2022-11-19 02:24:02'),(395,'manage',NULL,0,1,1,'2022-11-19 02:24:02'),(396,'manage/cash/cash_weixinnotify_open',NULL,0,1,1,'2022-11-19 02:24:02'),(397,'manage/cash/cash_emailnotify_open',NULL,0,1,1,'2022-11-19 02:24:02'),(398,'manage/cash/autoconfig',NULL,0,1,1,'2022-11-19 02:24:02'),(399,'manage/cashchannel',NULL,0,1,1,'2022-11-19 02:24:02'),(400,'manage/cashchannelaccount',NULL,0,1,1,'2022-11-19 02:24:02'),(401,'manage/channel/change_deposit',NULL,0,1,1,'2022-11-19 02:24:02'),(402,'manage/complaint/handbatchdel',NULL,0,1,1,'2022-11-19 02:24:02'),(403,'manage/complaint/handbatchmerchant',NULL,0,1,1,'2022-11-19 02:24:03'),(404,'manage/complaint/handbatchbuyer',NULL,0,1,1,'2022-11-19 02:24:03'),(405,'manage/complaint/complaint_refund',NULL,0,1,1,'2022-11-19 02:24:03'),(406,'manage/complaint/complaint_qrcode',NULL,0,1,1,'2022-11-19 02:24:03'),(407,'manage/goods/pool_check',NULL,0,1,1,'2022-11-19 02:24:03'),(408,'manage/goods/batch_pool_check',NULL,0,1,1,'2022-11-19 02:24:03'),(409,'manage/goods/pool_span',NULL,0,1,1,'2022-11-19 02:24:03'),(410,'manage/goods/span_del',NULL,0,1,1,'2022-11-19 02:24:03'),(411,'manage/goods/pool_span_clear',NULL,0,1,1,'2022-11-19 02:24:03'),(412,'manage/goods/pool_span_set',NULL,0,1,1,'2022-11-19 02:24:03'),(413,'manage/goods/pool_sort',NULL,0,1,1,'2022-11-19 02:24:03'),(414,'manage/goods/pool_span_edit',NULL,0,1,1,'2022-11-19 02:24:03'),(415,'manage/goods/pool_list',NULL,0,1,1,'2022-11-19 02:24:03'),(416,'manage/goods/pool_del',NULL,0,1,1,'2022-11-19 02:24:03'),(417,'manage/goods/handbatchdel',NULL,0,1,1,'2022-11-19 02:24:03'),(418,'manage/index/bgdata',NULL,0,1,1,'2022-11-19 02:24:03'),(419,'manage/index/bgdata_ajax',NULL,0,1,1,'2022-11-19 02:24:03'),(420,'manage/invitecode',NULL,0,1,1,'2022-11-19 02:24:03'),(421,'manage/invitecode/merchant_invitecode_open',NULL,0,1,1,'2022-11-19 02:24:03'),(422,'manage/order/apimerchant',NULL,0,1,1,'2022-11-19 02:24:03'),(423,'manage/order/handbatchdel',NULL,0,1,1,'2022-11-19 02:24:03'),(424,'manage/order/notify',NULL,0,1,1,'2022-11-19 02:24:03'),(425,'manage/order/refund',NULL,0,1,1,'2022-11-19 02:24:03'),(426,'manage/plugin',NULL,0,1,1,'2022-11-19 02:24:03'),(427,'manage/plugin/bgdata',NULL,0,1,1,'2022-11-19 02:24:03'),(428,'manage/plugin/tradetask',NULL,0,1,1,'2022-11-19 02:24:03'),(429,'manage/plugin/tradetasklist',NULL,0,1,1,'2022-11-19 02:24:03'),(430,'manage/plugin/tradetaskedit',NULL,0,1,1,'2022-11-19 02:24:03'),(431,'manage/plugin/tradetaskorder',NULL,0,1,1,'2022-11-19 02:24:03'),(432,'manage/plugin/risk',NULL,0,1,1,'2022-11-19 02:24:03'),(433,'manage/plugin/riskkeyword',NULL,0,1,1,'2022-11-19 02:24:03'),(434,'manage/plugin/riskcomplaint',NULL,0,1,1,'2022-11-19 02:24:03'),(435,'manage/plugin/riskaction',NULL,0,1,1,'2022-11-19 02:24:03'),(436,'manage/plugin/riskpedding',NULL,0,1,1,'2022-11-19 02:24:03'),(437,'manage/plugin/riskwhite',NULL,0,1,1,'2022-11-19 02:24:03'),(438,'manage/plugin/riskhistory',NULL,0,1,1,'2022-11-19 02:24:03'),(439,'manage/plugin/riskdefault',NULL,0,1,1,'2022-11-19 02:24:03'),(440,'manage/plugin/riskmanage',NULL,0,1,1,'2022-11-19 02:24:03'),(441,'manage/plugin/riskmanual',NULL,0,1,1,'2022-11-19 02:24:03'),(442,'manage/plugin/guide',NULL,0,1,1,'2022-11-19 02:24:03'),(443,'manage/plugin/guidetheme',NULL,0,1,1,'2022-11-19 02:24:03'),(444,'manage/plugin/guidethemeedit',NULL,0,1,1,'2022-11-19 02:24:03'),(445,'manage/plugin/migrate',NULL,0,1,1,'2022-11-19 02:24:03'),(446,'manage/plugin/subdomain',NULL,0,1,1,'2022-11-19 02:24:03'),(447,'manage/plugin/oauth2',NULL,0,1,1,'2022-11-19 02:24:03'),(448,'manage/plugin/merchantauth',NULL,0,1,1,'2022-11-19 02:24:03'),(449,'manage/plugin/merchantauthlist',NULL,0,1,1,'2022-11-19 02:24:03'),(450,'manage/plugin/merchantauthlistadd',NULL,0,1,1,'2022-11-19 02:24:03'),(451,'manage/plugin/merchantauthorder',NULL,0,1,1,'2022-11-19 02:24:03'),(452,'manage/plugin/zfbcashs',NULL,0,1,1,'2022-11-19 02:24:03'),(453,'manage/plugin/app',NULL,0,1,1,'2022-11-19 02:24:03'),(454,'manage/plugin/traderank',NULL,0,1,1,'2022-11-19 02:24:03'),(455,'manage/plugin/shopdiy',NULL,0,1,1,'2022-11-19 02:24:03'),(456,'manage/plugin/shopdiytheme',NULL,0,1,1,'2022-11-19 02:24:03'),(457,'manage/plugin/shopdiythemeedit',NULL,0,1,1,'2022-11-19 02:24:03'),(458,'manage/plugin/agentsetting',NULL,0,1,1,'2022-11-19 02:24:03'),(459,'manage/plugin/poolauth',NULL,0,1,1,'2022-11-19 02:24:03'),(460,'manage/plugin/poolauthchangestatus',NULL,0,1,1,'2022-11-19 02:24:03'),(461,'manage/plugin/paysafe',NULL,0,1,1,'2022-11-19 02:24:03'),(462,'manage/plugin/paysafesetting',NULL,0,1,1,'2022-11-19 02:24:03'),(463,'manage/plugin/paysafeipblack',NULL,0,1,1,'2022-11-19 02:24:03'),(464,'manage/plugin/systemsafe',NULL,0,1,1,'2022-11-19 02:24:03'),(465,'manage/plugin/glock',NULL,0,1,1,'2022-11-19 02:24:03'),(466,'manage/plugin/cross',NULL,0,1,1,'2022-11-19 02:24:03'),(467,'manage/plugin/crossauth',NULL,0,1,1,'2022-11-19 02:24:03'),(468,'manage/plugin/crossauthchangestatus',NULL,0,1,1,'2022-11-19 02:24:03'),(469,'manage/plugin/crossauthorder',NULL,0,1,1,'2022-11-19 02:24:03'),(470,'manage/plugin/publishsettlement',NULL,0,1,1,'2022-11-19 02:24:03'),(471,'manage/plugin/punish',NULL,0,1,1,'2022-11-19 02:24:03'),(472,'manage/plugin/punishlog',NULL,0,1,1,'2022-11-19 02:24:03'),(473,'manage/plugin/lockcard',NULL,0,1,1,'2022-11-19 02:24:03'),(474,'manage/plugin/tools',NULL,0,1,1,'2022-11-19 02:24:03'),(475,'manage/plugin/toolsuserclear',NULL,0,1,1,'2022-11-19 02:24:03'),(476,'manage/plugin/toolsdataclear',NULL,0,1,1,'2022-11-19 02:24:03'),(477,'manage/plugin/toolssystemclear',NULL,0,1,1,'2022-11-19 02:24:03'),(478,'manage/plugin/payapi',NULL,0,1,1,'2022-11-19 02:24:03'),(479,'manage/plugin/payapiorder',NULL,0,1,1,'2022-11-19 02:24:03'),(480,'manage/plugin/selectcard',NULL,0,1,1,'2022-11-19 02:24:03'),(481,'manage/plugin/custompay',NULL,0,1,1,'2022-11-19 02:24:03'),(482,'manage/plugin/custompaychanneledit',NULL,0,1,1,'2022-11-19 02:24:03'),(483,'manage/plugin/custompayapplylist',NULL,0,1,1,'2022-11-19 02:24:03'),(484,'manage/plugin/custompayorder',NULL,0,1,1,'2022-11-19 02:24:03'),(485,'manage/plugin/custompayauth',NULL,0,1,1,'2022-11-19 02:24:03'),(486,'manage/plugin/custompayauthchangestatus',NULL,0,1,1,'2022-11-19 02:24:03'),(487,'manage/plugin/codepay',NULL,0,1,1,'2022-11-19 02:24:03'),(488,'manage/plugin/codepayauth',NULL,0,1,1,'2022-11-19 02:24:03'),(489,'manage/plugin/codepayauthchangestatus',NULL,0,1,1,'2022-11-19 02:24:03'),(490,'manage/plugin/codepayapplist',NULL,0,1,1,'2022-11-19 02:24:03'),(491,'manage/plugin/codepayappedit',NULL,0,1,1,'2022-11-19 02:24:03'),(492,'manage/plugin/codepaylogin',NULL,0,1,1,'2022-11-19 02:24:03'),(493,'manage/plugin/chat',NULL,0,1,1,'2022-11-19 02:24:03'),(494,'manage/plugin/uploadimg',NULL,0,1,1,'2022-11-19 02:24:03'),(495,'manage/plugin/ambassador',NULL,0,1,1,'2022-11-19 02:24:03'),(496,'manage/plugin/ambassadoredit',NULL,0,1,1,'2022-11-19 02:24:03'),(497,'manage/plugin/alliance',NULL,0,1,1,'2022-11-19 02:24:03'),(498,'manage/plugin/airpayx',NULL,0,1,1,'2022-11-19 02:24:03'),(499,'manage/plugin/airpayxauth',NULL,0,1,1,'2022-11-19 02:24:03'),(500,'manage/plugin/airpayxauthchangestatus',NULL,0,1,1,'2022-11-19 02:24:03'),(501,'manage/rate',NULL,0,1,1,'2022-11-19 02:24:03'),(502,'manage/user/change_channel_status',NULL,0,1,1,'2022-11-19 02:24:03'),(503,'manage/user/handbatchdel',NULL,0,1,1,'2022-11-19 02:24:03');
/*!40000 ALTER TABLE `system_node` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_sequence`
--

DROP TABLE IF EXISTS `system_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_sequence` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` varchar(20) DEFAULT NULL COMMENT '序号类型',
  `sequence` char(50) NOT NULL COMMENT '序号值',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_system_sequence_unique` (`type`,`sequence`) USING BTREE,
  KEY `index_system_sequence_type` (`type`),
  KEY `index_system_sequence_number` (`sequence`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统序号表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_sequence`
--

LOCK TABLES `system_sequence` WRITE;
/*!40000 ALTER TABLE `system_sequence` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_user`
--

DROP TABLE IF EXISTS `system_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL DEFAULT '' COMMENT '用户登录名',
  `password` char(32) NOT NULL DEFAULT '' COMMENT '用户登录密码',
  `qq` varchar(16) DEFAULT NULL COMMENT '联系QQ',
  `mail` varchar(32) DEFAULT NULL COMMENT '联系邮箱',
  `phone` varchar(16) DEFAULT NULL COMMENT '联系手机号',
  `desc` varchar(255) DEFAULT '' COMMENT '备注说明',
  `login_num` bigint(20) unsigned DEFAULT '0' COMMENT '登录次数',
  `login_at` datetime DEFAULT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态(0:禁用,1:启用)',
  `authorize` varchar(255) DEFAULT NULL,
  `is_deleted` tinyint(1) unsigned DEFAULT '0' COMMENT '删除状态(1:删除,0:未删)',
  `create_by` bigint(20) unsigned DEFAULT NULL COMMENT '创建人',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `google_secret_key` varchar(128) DEFAULT '' COMMENT '谷歌令牌密钥',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_system_user_username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10001 DEFAULT CHARSET=utf8 COMMENT='系统用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_user`
--

LOCK TABLES `system_user` WRITE;
/*!40000 ALTER TABLE `system_user` DISABLE KEYS */;
INSERT INTO `system_user` VALUES (10000,'admin','e10adc3949ba59abbe56e057f20f883e','','','','',9,'2023-06-26 20:55:18',1,'',0,NULL,NULL,'');
/*!40000 ALTER TABLE `system_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unique_orderno`
--

DROP TABLE IF EXISTS `unique_orderno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unique_orderno` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trade_no` varchar(100) NOT NULL COMMENT '订单号',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_trade_no` (`trade_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unique_orderno`
--

LOCK TABLES `unique_orderno` WRITE;
/*!40000 ALTER TABLE `unique_orderno` DISABLE KEYS */;
INSERT INTO `unique_orderno` VALUES (2,'FK2306152220CDWER'),(1,'FK2306152220U0RN8'),(4,'FK2306262280OS5Y1'),(3,'FK2306262280YMPLW');
/*!40000 ALTER TABLE `unique_orderno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级ID',
  `openid` varchar(50) NOT NULL DEFAULT '' COMMENT '微信openid',
  `username` varchar(50) NOT NULL,
  `password` char(32) NOT NULL,
  `mobile` varchar(15) NOT NULL DEFAULT '' COMMENT '手机号',
  `qq` varchar(16) NOT NULL,
  `email` varchar(50) NOT NULL,
  `subdomain` varchar(250) NOT NULL DEFAULT '' COMMENT '子域名',
  `shop_name` varchar(20) NOT NULL DEFAULT '' COMMENT '店铺名称',
  `shop_notice` varchar(200) NOT NULL DEFAULT '' COMMENT '公告通知',
  `statis_code` varchar(1024) NOT NULL DEFAULT '' COMMENT '统计代码',
  `pay_theme` varchar(255) NOT NULL DEFAULT 'default' COMMENT '支付页风格',
  `pay_theme_mobile` varchar(100) DEFAULT 'default' COMMENT '支付模板手机端',
  `stock_display` tinyint(3) unsigned NOT NULL DEFAULT '2' COMMENT '库存展示方式 1实际库存 2库存范围',
  `money` decimal(10,3) NOT NULL DEFAULT '0.000',
  `rebate` decimal(10,3) unsigned NOT NULL DEFAULT '0.000',
  `freeze_money` decimal(10,3) NOT NULL DEFAULT '0.000',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '0未审核 1已审核',
  `is_freeze` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否冻结 0否 1是',
  `create_at` int(10) unsigned NOT NULL,
  `ip` varchar(50) DEFAULT '' COMMENT 'IP地址',
  `website` varchar(255) NOT NULL DEFAULT '' COMMENT '商户网站',
  `is_close` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否关闭店铺 0否 1是',
  `shop_notice_auto_pop` tinyint(4) NOT NULL DEFAULT '1' COMMENT '商家公告是否自动弹出',
  `cash_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '提现方式',
  `login_auth` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否开启安全登录',
  `login_auth_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '安全登录验证方式，1：短信，2：邮件，3：谷歌密码验证',
  `google_secret_key` varchar(128) DEFAULT '' COMMENT '谷歌令牌密钥',
  `shop_gouka_protocol_pop` tinyint(4) NOT NULL DEFAULT '1' COMMENT '购卡协议是否自动弹出',
  `user_notice_auto_pop` tinyint(4) NOT NULL DEFAULT '1' COMMENT '商家是否自动弹出',
  `login_key` int(11) NOT NULL DEFAULT '0' COMMENT '用户登录标记',
  `fee_payer` tinyint(4) NOT NULL DEFAULT '0' COMMENT '订单手续费支付方，0：跟随系统，1：商家承担，2买家承担',
  `settlement_type` tinyint(4) NOT NULL DEFAULT '-1' COMMENT '结算方式，-1：跟随系统，1:T1结算，0:T0结算',
  `agent_key` varchar(255) NOT NULL DEFAULT '' COMMENT '代理商品对接密钥',
  `agent_goods_switch` tinyint(1) NOT NULL DEFAULT '0' COMMENT '商品代理功能开关 0：关闭，1：开启',
  `need_check_agent` tinyint(1) NOT NULL DEFAULT '1' COMMENT '代理是否需要审核：0不审核 1审核',
  `music` varchar(100) DEFAULT NULL,
  `pc_template` varchar(50) NOT NULL DEFAULT 'default' COMMENT '用户电脑端模板',
  `mobile_template` varchar(50) NOT NULL DEFAULT 'default' COMMENT '用户手机端模板',
  `wechat_stock_notify` tinyint(1) NOT NULL DEFAULT '1',
  `wechat_sell_notify` tinyint(1) NOT NULL DEFAULT '1',
  `wechat_signin_notify` tinyint(1) NOT NULL DEFAULT '1',
  `wechat_cash_notify` tinyint(1) NOT NULL DEFAULT '1',
  `wechat_complaint_notify` tinyint(1) NOT NULL DEFAULT '1',
  `oauth2_qq_openid` varchar(100) DEFAULT NULL,
  `oauth2_wechat_openid` varchar(100) DEFAULT NULL,
  `rate_type` tinyint(1) DEFAULT '0',
  `lock_card` tinyint(1) DEFAULT '0',
  `payapi` tinyint(1) DEFAULT '0',
  `paykey` varchar(50) DEFAULT NULL,
  `fee_money` decimal(10,3) DEFAULT '0.000',
  `deposit_money` decimal(10,3) DEFAULT '0.000',
  `qqqun` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,0,'','ceshi01','25d55ad283aa400af464c76d713c07ad','15988888888','123456','123456@qq.com','','','','','default','default',2,0.000,0.000,0.000,1,0,1671355203,'','',0,1,1,0,1,'',1,1,0,0,-1,'02633B064CEB',0,1,NULL,'default','default',1,1,1,1,1,NULL,NULL,0,0,0,NULL,0.000,0.000,NULL),(2,0,'','gskvskwgwu','03d6fb71867a4118ad6d2183166b424e','12345678900','12345661681','16484623456@qq.com','','','','','default','default',2,0.000,0.000,9999.960,1,0,1686838772,'223.96.57.65','',0,1,1,0,1,'',1,1,0,0,-1,'509165A8C7F8',0,1,NULL,'default','default',1,1,1,1,1,NULL,NULL,0,0,0,NULL,0.000,0.000,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_analysis`
--

DROP TABLE IF EXISTS `user_analysis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_analysis` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `date` date NOT NULL,
  `day_amount` decimal(10,3) NOT NULL DEFAULT '0.000',
  `order_count` int(11) NOT NULL DEFAULT '0',
  `finally_amount` decimal(10,3) NOT NULL DEFAULT '0.000',
  `profit` decimal(10,3) NOT NULL DEFAULT '0.000' COMMENT '利润',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_analysis`
--

LOCK TABLES `user_analysis` WRITE;
/*!40000 ALTER TABLE `user_analysis` DISABLE KEYS */;
INSERT INTO `user_analysis` VALUES (1,2,'2023-06-15',10000.000,1,9999.960,9999.960);
/*!40000 ALTER TABLE `user_analysis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_channel`
--

DROP TABLE IF EXISTS `user_channel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_channel` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `channel_id` int(10) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `custom_status` tinyint(3) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_channel`
--

LOCK TABLES `user_channel` WRITE;
/*!40000 ALTER TABLE `user_channel` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_channel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_collect`
--

DROP TABLE IF EXISTS `user_collect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_collect` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '类型 1支付宝 2微信 3银行卡',
  `info` text NOT NULL,
  `create_at` int(10) unsigned NOT NULL DEFAULT '0',
  `collect_img` tinytext,
  `allow_update` tinyint(4) NOT NULL DEFAULT '0' COMMENT '1为允许用户修改收款信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_collect`
--

LOCK TABLES `user_collect` WRITE;
/*!40000 ALTER TABLE `user_collect` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_collect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_login_error_log`
--

DROP TABLE IF EXISTS `user_login_error_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_login_error_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login_name` varchar(50) NOT NULL DEFAULT '' COMMENT '登录名',
  `password` varchar(255) NOT NULL DEFAULT '' COMMENT '尝试密码',
  `user_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0：普通用户 1：后台管理员账号',
  `login_from` int(1) NOT NULL DEFAULT '0' COMMENT '登录来源：0：前台 1：总后台',
  `login_time` int(11) NOT NULL DEFAULT '0' COMMENT '登录时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_login_error_log`
--

LOCK TABLES `user_login_error_log` WRITE;
/*!40000 ALTER TABLE `user_login_error_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_login_error_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_login_log`
--

DROP TABLE IF EXISTS `user_login_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_login_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `ip` varchar(15) NOT NULL DEFAULT '',
  `create_at` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_login_log`
--

LOCK TABLES `user_login_log` WRITE;
/*!40000 ALTER TABLE `user_login_log` DISABLE KEYS */;
INSERT INTO `user_login_log` VALUES (1,2,'223.96.57.65',1686838783),(2,2,'223.96.61.178',1687789115);
/*!40000 ALTER TABLE `user_login_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_money_log`
--

DROP TABLE IF EXISTS `user_money_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_money_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `business_type` varchar(100) NOT NULL,
  `user_id` int(10) unsigned NOT NULL COMMENT '用户ID',
  `from_user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '来源用户ID',
  `agent_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '代理模式 1：普通代理 2：全站代理',
  `trade_no` varchar(255) NOT NULL DEFAULT '' COMMENT '相关订单号',
  `money` decimal(10,3) NOT NULL COMMENT '变动金额',
  `balance` decimal(10,3) NOT NULL COMMENT '剩余',
  `reason` varchar(255) NOT NULL DEFAULT '' COMMENT '变动原因',
  `create_at` int(10) unsigned NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `business_type` (`business_type`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_money_log`
--

LOCK TABLES `user_money_log` WRITE;
/*!40000 ALTER TABLE `user_money_log` DISABLE KEYS */;
INSERT INTO `user_money_log` VALUES (1,'goods_sold',2,0,0,'',10000.000,10000.000,'【卖出商品】成功售出商品10000（1张）',1686839138),(2,'goods_sold',2,0,0,'',-0.040,9999.960,'【卖出商品】扣除交易手续费，订单：FK2306152220CDWER',1686839138),(3,'freeze',2,0,0,'',-9999.960,0.000,'【冻结金额】冻结订单：FK2306152220CDWER，冻结金额：9999.96元',1686839138);
/*!40000 ALTER TABLE `user_money_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_proxy`
--

DROP TABLE IF EXISTS `user_proxy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_proxy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `child_user_id` int(11) NOT NULL COMMENT '父级代理id',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态 0:待审核  1:已审核 -1:拒绝',
  `create_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_proxy`
--

LOCK TABLES `user_proxy` WRITE;
/*!40000 ALTER TABLE `user_proxy` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_proxy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_rate`
--

DROP TABLE IF EXISTS `user_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_rate` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL COMMENT '用户ID',
  `channel_id` int(10) unsigned NOT NULL COMMENT '渠道ID',
  `rate` decimal(10,4) unsigned NOT NULL COMMENT '费率',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_rate`
--

LOCK TABLES `user_rate` WRITE;
/*!40000 ALTER TABLE `user_rate` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_rate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_risk`
--

DROP TABLE IF EXISTS `user_risk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_risk` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `risk_type` int(11) NOT NULL DEFAULT '0' COMMENT '0 系统警告  1下架警告 2关闭交易 3封禁',
  `desc` varchar(500) DEFAULT NULL,
  `create_at` int(11) DEFAULT NULL,
  `update_at` int(11) DEFAULT NULL,
  `reason` varchar(500) DEFAULT NULL,
  `hash` varchar(32) DEFAULT NULL,
  `from_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0商品名 1商品描述 2投诉信息  3投诉率 4手动添加',
  `from_id` varchar(50) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0待审核 1已审核  2忽略白名单',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_risk`
--

LOCK TABLES `user_risk` WRITE;
/*!40000 ALTER TABLE `user_risk` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_risk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_token`
--

DROP TABLE IF EXISTS `user_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_token` (
  `user_id` int(10) unsigned NOT NULL COMMENT '用户 id',
  `token` varchar(255) NOT NULL COMMENT '用户登录凭证',
  `platform` varchar(20) NOT NULL COMMENT '用户登录平台',
  `refresh_token` varchar(255) NOT NULL COMMENT '登录凭证刷新凭证',
  `created_at` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间，即登录时间',
  `expire_at` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '凭证过期时间',
  KEY `index_login_user` (`user_id`) USING BTREE,
  KEY `index_login_token` (`token`) USING BTREE,
  KEY `index_login_platform` (`platform`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_token`
--

LOCK TABLES `user_token` WRITE;
/*!40000 ALTER TABLE `user_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `verify_email_error_log`
--

DROP TABLE IF EXISTS `verify_email_error_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `verify_email_error_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT '' COMMENT '前台用户名',
  `admin` varchar(50) DEFAULT '' COMMENT '管理员用户名',
  `email` varchar(20) DEFAULT '' COMMENT '邮箱',
  `code` varchar(10) DEFAULT '' COMMENT '输入验证码',
  `screen` varchar(20) DEFAULT '' COMMENT '使用场景',
  `type` tinyint(1) DEFAULT '0' COMMENT '1：短信验证码 2：谷歌身份验证, 0:邮箱',
  `ctime` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `verify_email_error_log`
--

LOCK TABLES `verify_email_error_log` WRITE;
/*!40000 ALTER TABLE `verify_email_error_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `verify_email_error_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `verify_error_log`
--

DROP TABLE IF EXISTS `verify_error_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `verify_error_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT '' COMMENT '前台用户名',
  `admin` varchar(50) DEFAULT '' COMMENT '管理员用户名',
  `mobile` varchar(20) DEFAULT '' COMMENT '手机号码',
  `code` varchar(10) DEFAULT '' COMMENT '输入验证码',
  `screen` varchar(20) DEFAULT '' COMMENT '使用场景',
  `type` tinyint(1) DEFAULT '0' COMMENT '1：短信验证码 2：谷歌身份验证',
  `ctime` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `verify_error_log`
--

LOCK TABLES `verify_error_log` WRITE;
/*!40000 ALTER TABLE `verify_error_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `verify_error_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wechat_fans`
--

DROP TABLE IF EXISTS `wechat_fans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wechat_fans` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '粉丝表ID',
  `appid` varchar(50) DEFAULT NULL COMMENT '公众号Appid',
  `groupid` bigint(20) unsigned DEFAULT NULL COMMENT '分组ID',
  `tagid_list` varchar(100) DEFAULT '' COMMENT '标签id',
  `is_back` tinyint(1) unsigned DEFAULT '0' COMMENT '是否为黑名单用户',
  `subscribe` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '用户是否订阅该公众号，0：未关注，1：已关注',
  `openid` char(100) NOT NULL DEFAULT '' COMMENT '用户的标识，对当前公众号唯一',
  `spread_openid` char(100) DEFAULT NULL COMMENT '推荐人OPENID',
  `spread_at` datetime DEFAULT NULL,
  `nickname` varchar(100) DEFAULT NULL COMMENT '用户的昵称',
  `sex` tinyint(1) unsigned DEFAULT NULL COMMENT '用户的性别，值为1时是男性，值为2时是女性，值为0时是未知',
  `country` varchar(50) DEFAULT NULL COMMENT '用户所在国家',
  `province` varchar(50) DEFAULT NULL COMMENT '用户所在省份',
  `city` varchar(50) DEFAULT NULL COMMENT '用户所在城市',
  `language` varchar(50) DEFAULT NULL COMMENT '用户的语言，简体中文为zh_CN',
  `headimgurl` varchar(500) DEFAULT NULL COMMENT '用户头像',
  `subscribe_time` bigint(20) unsigned DEFAULT NULL COMMENT '用户关注时间',
  `subscribe_at` datetime DEFAULT NULL COMMENT '关注时间',
  `unionid` varchar(100) DEFAULT NULL COMMENT 'unionid',
  `remark` varchar(50) DEFAULT NULL COMMENT '备注',
  `expires_in` bigint(20) unsigned DEFAULT '0' COMMENT '有效时间',
  `refresh_token` varchar(200) DEFAULT NULL COMMENT '刷新token',
  `access_token` varchar(200) DEFAULT NULL COMMENT '访问token',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `index_wechat_fans_spread_openid` (`spread_openid`) USING BTREE,
  KEY `index_wechat_fans_openid` (`openid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信粉丝';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wechat_fans`
--

LOCK TABLES `wechat_fans` WRITE;
/*!40000 ALTER TABLE `wechat_fans` DISABLE KEYS */;
/*!40000 ALTER TABLE `wechat_fans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wechat_fans_tags`
--

DROP TABLE IF EXISTS `wechat_fans_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wechat_fans_tags` (
  `id` bigint(20) unsigned NOT NULL COMMENT '标签ID',
  `appid` char(50) DEFAULT NULL COMMENT '公众号APPID',
  `name` varchar(35) DEFAULT NULL COMMENT '标签名称',
  `count` int(11) unsigned DEFAULT NULL COMMENT '总数',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  KEY `index_wechat_fans_tags_id` (`id`) USING BTREE,
  KEY `index_wechat_fans_tags_appid` (`appid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信会员标签';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wechat_fans_tags`
--

LOCK TABLES `wechat_fans_tags` WRITE;
/*!40000 ALTER TABLE `wechat_fans_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `wechat_fans_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wechat_keys`
--

DROP TABLE IF EXISTS `wechat_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wechat_keys` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `appid` char(50) DEFAULT NULL COMMENT '公众号APPID',
  `type` varchar(20) DEFAULT NULL COMMENT '类型，text 文件消息，image 图片消息，news 图文消息',
  `keys` varchar(100) DEFAULT NULL COMMENT '关键字',
  `content` text COMMENT '文本内容',
  `image_url` varchar(255) DEFAULT NULL COMMENT '图片链接',
  `voice_url` varchar(255) DEFAULT NULL COMMENT '语音链接',
  `music_title` varchar(100) DEFAULT NULL COMMENT '音乐标题',
  `music_url` varchar(255) DEFAULT NULL COMMENT '音乐链接',
  `music_image` varchar(255) DEFAULT NULL COMMENT '音乐缩略图链接',
  `music_desc` varchar(255) DEFAULT NULL COMMENT '音乐描述',
  `video_title` varchar(100) DEFAULT NULL COMMENT '视频标题',
  `video_url` varchar(255) DEFAULT NULL COMMENT '视频URL',
  `video_desc` varchar(255) DEFAULT NULL COMMENT '视频描述',
  `news_id` bigint(20) unsigned DEFAULT NULL COMMENT '图文ID',
  `sort` bigint(20) unsigned DEFAULT '0' COMMENT '排序字段',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '0 禁用，1 启用',
  `create_by` bigint(20) unsigned DEFAULT NULL COMMENT '创建人',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT=' 微信关键字';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wechat_keys`
--

LOCK TABLES `wechat_keys` WRITE;
/*!40000 ALTER TABLE `wechat_keys` DISABLE KEYS */;
INSERT INTO `wechat_keys` VALUES (1,NULL,'image','subscribe','任何问题请联系平台客服QQ，感谢支持。','http://www.demo.com/static/theme/default/img/image.png','','音乐标题','','https://www.demo.com/static/theme/default/img/image.png','音乐描述','视频标题','','视频描述',0,0,1,NULL,'2021-01-24 07:29:24'),(2,NULL,'text','default','任何问题请联系平台客服QQ，感谢支持。','https://www.demo.com/static/theme/default/img/image.png','','音乐标题','','https://www.demo.com/static/theme/default/img/image.png','音乐描述','视频标题','','视频描述',0,0,1,NULL,'2020-12-11 15:22:16');
/*!40000 ALTER TABLE `wechat_keys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wechat_menu`
--

DROP TABLE IF EXISTS `wechat_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wechat_menu` (
  `id` bigint(16) unsigned NOT NULL AUTO_INCREMENT,
  `index` bigint(20) DEFAULT NULL,
  `pindex` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '父id',
  `type` varchar(24) NOT NULL DEFAULT '' COMMENT '菜单类型 null主菜单 link链接 keys关键字',
  `name` varchar(256) NOT NULL DEFAULT '' COMMENT '菜单名称',
  `content` text NOT NULL COMMENT '文字内容',
  `sort` bigint(20) unsigned DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '状态(0禁用1启用)',
  `create_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `index_wechat_menu_pindex` (`pindex`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=318 DEFAULT CHARSET=utf8 COMMENT='微信菜单配置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wechat_menu`
--

LOCK TABLES `wechat_menu` WRITE;
/*!40000 ALTER TABLE `wechat_menu` DISABLE KEYS */;
INSERT INTO `wechat_menu` VALUES (317,1,0,'view','商户登录','http://www.demo.com/login',0,1,0,'2021-01-19 14:35:48');
/*!40000 ALTER TABLE `wechat_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wechat_news`
--

DROP TABLE IF EXISTS `wechat_news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wechat_news` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `media_id` varchar(100) DEFAULT NULL COMMENT '永久素材MediaID',
  `local_url` varchar(300) DEFAULT NULL COMMENT '永久素材显示URL',
  `article_id` varchar(60) DEFAULT NULL COMMENT '关联图文ID，用，号做分割',
  `is_deleted` tinyint(1) unsigned DEFAULT '0' COMMENT '是否删除',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`id`),
  KEY `index_wechat_new_artcle_id` (`article_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信图文表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wechat_news`
--

LOCK TABLES `wechat_news` WRITE;
/*!40000 ALTER TABLE `wechat_news` DISABLE KEYS */;
/*!40000 ALTER TABLE `wechat_news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wechat_news_article`
--

DROP TABLE IF EXISTS `wechat_news_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wechat_news_article` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL COMMENT '素材标题',
  `local_url` varchar(300) DEFAULT NULL COMMENT '永久素材显示URL',
  `show_cover_pic` tinyint(4) unsigned DEFAULT '0' COMMENT '是否显示封面 0不显示，1 显示',
  `author` varchar(20) DEFAULT NULL COMMENT '作者',
  `digest` varchar(300) DEFAULT NULL COMMENT '摘要内容',
  `content` longtext COMMENT '图文内容',
  `content_source_url` varchar(200) DEFAULT NULL COMMENT '图文消息原文地址',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信素材表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wechat_news_article`
--

LOCK TABLES `wechat_news_article` WRITE;
/*!40000 ALTER TABLE `wechat_news_article` DISABLE KEYS */;
/*!40000 ALTER TABLE `wechat_news_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wechat_news_image`
--

DROP TABLE IF EXISTS `wechat_news_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wechat_news_image` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `md5` varchar(32) DEFAULT NULL COMMENT '文件md5',
  `local_url` varchar(300) DEFAULT NULL COMMENT '本地文件链接',
  `media_url` varchar(300) DEFAULT NULL COMMENT '远程图片链接',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `index_wechat_news_image_md5` (`md5`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信服务器图片';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wechat_news_image`
--

LOCK TABLES `wechat_news_image` WRITE;
/*!40000 ALTER TABLE `wechat_news_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `wechat_news_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wechat_news_media`
--

DROP TABLE IF EXISTS `wechat_news_media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wechat_news_media` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `appid` varchar(200) DEFAULT NULL COMMENT '公众号ID',
  `md5` varchar(32) DEFAULT NULL COMMENT '文件md5',
  `type` varchar(20) DEFAULT NULL COMMENT '媒体类型',
  `media_id` varchar(100) DEFAULT NULL COMMENT '永久素材MediaID',
  `local_url` varchar(300) DEFAULT NULL COMMENT '本地文件链接',
  `media_url` varchar(300) DEFAULT NULL COMMENT '远程图片链接',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信素材表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wechat_news_media`
--

LOCK TABLES `wechat_news_media` WRITE;
/*!40000 ALTER TABLE `wechat_news_media` DISABLE KEYS */;
/*!40000 ALTER TABLE `wechat_news_media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wechat_pay_notify`
--

DROP TABLE IF EXISTS `wechat_pay_notify`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wechat_pay_notify` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `appid` varchar(50) DEFAULT NULL COMMENT '公众号Appid',
  `bank_type` varchar(50) DEFAULT NULL COMMENT '银行类型',
  `cash_fee` bigint(20) DEFAULT NULL COMMENT '现金价',
  `fee_type` char(20) DEFAULT NULL COMMENT '币种，1人民币',
  `is_subscribe` char(1) DEFAULT 'N' COMMENT '是否关注，Y为关注，N为未关注',
  `mch_id` varchar(50) DEFAULT NULL COMMENT '商户MCH_ID',
  `nonce_str` varchar(32) DEFAULT NULL COMMENT '随机串',
  `openid` varchar(50) DEFAULT NULL COMMENT '微信用户openid',
  `out_trade_no` varchar(50) DEFAULT NULL COMMENT '支付平台退款交易号',
  `sign` varchar(100) DEFAULT NULL COMMENT '签名',
  `time_end` datetime DEFAULT NULL COMMENT '结束时间',
  `result_code` varchar(10) DEFAULT NULL,
  `return_code` varchar(10) DEFAULT NULL,
  `total_fee` varchar(11) DEFAULT NULL COMMENT '支付总金额，单位为分',
  `trade_type` varchar(20) DEFAULT NULL COMMENT '支付方式',
  `transaction_id` varchar(64) DEFAULT NULL COMMENT '订单号',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '本地系统时间',
  PRIMARY KEY (`id`),
  KEY `index_wechat_pay_notify_openid` (`openid`) USING BTREE,
  KEY `index_wechat_pay_notify_out_trade_no` (`out_trade_no`) USING BTREE,
  KEY `index_wechat_pay_notify_transaction_id` (`transaction_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='支付日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wechat_pay_notify`
--

LOCK TABLES `wechat_pay_notify` WRITE;
/*!40000 ALTER TABLE `wechat_pay_notify` DISABLE KEYS */;
/*!40000 ALTER TABLE `wechat_pay_notify` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wechat_pay_prepayid`
--

DROP TABLE IF EXISTS `wechat_pay_prepayid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wechat_pay_prepayid` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `appid` char(50) DEFAULT NULL COMMENT '公众号APPID',
  `from` char(32) DEFAULT 'shop' COMMENT '支付来源',
  `fee` bigint(20) unsigned DEFAULT NULL COMMENT '支付费用(分)',
  `trade_type` varchar(20) DEFAULT NULL COMMENT '订单类型',
  `order_no` varchar(50) DEFAULT NULL COMMENT '内部订单号',
  `out_trade_no` varchar(50) DEFAULT NULL COMMENT '外部订单号',
  `prepayid` varchar(500) DEFAULT NULL COMMENT '预支付码',
  `expires_in` bigint(20) unsigned DEFAULT NULL COMMENT '有效时间',
  `transaction_id` varchar(64) DEFAULT NULL COMMENT '微信平台订单号',
  `is_pay` tinyint(1) unsigned DEFAULT '0' COMMENT '1已支付，0未支退款',
  `pay_at` datetime DEFAULT NULL COMMENT '支付时间',
  `is_refund` tinyint(1) unsigned DEFAULT '0' COMMENT '是否退款，退款单号(T+原来订单)',
  `refund_at` datetime DEFAULT NULL COMMENT '退款时间',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '本地系统时间',
  PRIMARY KEY (`id`),
  KEY `index_wechat_pay_prepayid_outer_no` (`out_trade_no`) USING BTREE,
  KEY `index_wechat_pay_prepayid_order_no` (`order_no`) USING BTREE,
  KEY `index_wechat_pay_is_pay` (`is_pay`) USING BTREE,
  KEY `index_wechat_pay_is_refund` (`is_refund`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='支付订单号对应表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wechat_pay_prepayid`
--

LOCK TABLES `wechat_pay_prepayid` WRITE;
/*!40000 ALTER TABLE `wechat_pay_prepayid` DISABLE KEYS */;
/*!40000 ALTER TABLE `wechat_pay_prepayid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zt_order`
--

DROP TABLE IF EXISTS `zt_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zt_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderid` varchar(100) DEFAULT NULL,
  `zdid` int(10) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `paytype` varchar(50) DEFAULT NULL,
  `money` float DEFAULT NULL,
  `status` int(1) DEFAULT '0',
  `trade_no` varchar(100) DEFAULT NULL,
  `paytime` int(10) DEFAULT NULL,
  `addtime` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zt_order`
--

LOCK TABLES `zt_order` WRITE;
/*!40000 ALTER TABLE `zt_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `zt_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database '666'
--

--
-- Dumping routines for database '666'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-14 23:23:29
