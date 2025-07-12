-- phpMyAdmin SQL Dump
-- version 3.5.1-rc1
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2014 年 12 月 15 日 08:43
-- 服务器版本: 5.5.20
-- PHP 版本: 5.2.9-2

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `test`
--

-- --------------------------------------------------------

--
-- 表的结构 `yjcode_ad`
--

CREATE TABLE IF NOT EXISTS `yjcode_ad` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bh` char(50) DEFAULT NULL,
  `type1` char(30) DEFAULT NULL,
  `jpggif` char(20) DEFAULT NULL,
  `tit` varchar(250) DEFAULT NULL,
  `adbh` char(30) DEFAULT NULL,
  `txt` text,
  `sj` datetime DEFAULT NULL,
  `aurl` varchar(250) DEFAULT NULL,
  `sm` varchar(250) DEFAULT NULL,
  `xh` int(11) DEFAULT NULL,
  `aw` int(11) DEFAULT NULL,
  `ah` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=32 ;

--
-- 转存表中的数据 `yjcode_ad`
--

INSERT INTO `yjcode_ad` (`id`, `bh`, `type1`, `jpggif`, `tit`, `adbh`, `txt`, `sj`, `aurl`, `sm`, `xh`, `aw`, `ah`) VALUES
(5, '1414134080ad4', '图片', 'gif', '底部广告', 'ADI01', '', '2014-10-24 15:01:42', 'http://shopt5.yj99.cn/help/view8.html', NULL, 1, 0, 0),
(8, '1414141966ad63', '图片', 'jpg', '会员中心右侧广告', 'ADU01', '', '2014-10-24 17:12:46', 'http://shopt5.yj99.cn/help/view8.html', NULL, 1, 0, 0),
(9, '1414141969ad100', '图片', 'jpg', '会员中心右侧广告', 'ADU01', '', '2014-10-24 17:12:49', 'http://shopt5.yj99.cn/help/view8.html', NULL, 2, 0, 0),
(10, '1414141971ad11', '图片', 'jpg', '会员中心右侧广告', 'ADU01', '', '2014-10-24 17:12:51', 'http://shopt5.yj99.cn/help/view8.html', NULL, 3, 0, 0),
(11, '1415160861ad38', '图片', 'jpg', '商品详情左侧广告', 'ADP01', '', '2014-11-05 12:14:21', 'http://shopt5.yj99.cn/help/view8.html', NULL, 1, 0, 0),
(12, '1415976888ad14', '图片', 'jpg', '商品列表左上广告', 'ADP02', '', '2014-11-14 22:54:48', 'http://shopt5.yj99.cn/help/view8.html', NULL, 1, 0, 0),
(14, '1416020955ad88', '图片', 'jpg', '登录框左侧广告', 'ADO01', '', '2014-11-15 11:09:15', 'http://shopt5.yj99.cn/help/view8.html', NULL, 1, 0, 0),
(15, '1416024835ad70', '图片', 'jpg', '商家列表页左上广告', 'ADS01', '', '2014-11-15 12:13:55', 'http://shopt5.yj99.cn/help/view8.html', NULL, 1, 0, 0),
(16, '1416039894ad11', '文字', '', '房产系统', 'ADI02', '', '2014-11-15 16:24:54', 'http://shopt5.yj99.cn/product/search_j3v_k43v_m50v.html', NULL, 1, 0, 0),
(17, '1416115010ad94', '图片', 'jpg', '双十一来了', 'ADI04', '', '2014-11-16 13:16:50', 'http://shopt5.yj99.cn/help/view8.html', NULL, 1, 0, 0),
(18, '1416115023ad76', '图片', 'jpg', '华为', 'ADI04', '', '2014-11-16 13:17:03', 'http://shopt5.yj99.cn/help/view8.html', NULL, 2, 0, 0),
(19, '1416208251ad54', '图片', 'jpg', '计算机/互联网', 'ADN01', '', '2014-11-17 15:10:51', 'http://shopt5.yj99.cn/help/view8.html', NULL, 1, 0, 0),
(20, '1416210641ad45', '图片', 'jpg', '资讯正文页右侧广告', 'ADNV01', '', '2014-11-17 15:50:41', 'http://shopt5.yj99.cn/help/view8.html', NULL, 1, 0, 0),
(21, '1416210731ad4', '图片', 'jpg', '资讯详情页最新发布上方横幅', 'ADNV02', '', '2014-11-17 15:52:11', 'http://shopt5.yj99.cn/help/view8.html', NULL, 1, 0, 0),
(22, '1416211155ad4', '文字', '', '新闻资讯', 'ADI02', '', '2014-11-17 15:59:15', 'http://shopt5.yj99.cn/news/', NULL, 2, 0, 0),
(23, '1416211172ad39', '文字', '', '商家风采', 'ADI02', '', '2014-11-17 15:59:32', 'http://shopt5.yj99.cn/shop/', NULL, 3, 0, 0),
(24, '1416212227ad5', '图片', 'jpg', '资讯列表页右侧广告', 'ADNV04', '', '2014-11-17 16:17:07', 'http://shopt5.yj99.cn/help/view8.html', NULL, 1, 0, 0),
(25, '1416230127ad47', '图片', 'jpg', 'Pinterest: 下一代社交巨头', 'ADN00', '', '2014-11-17 21:15:27', 'http://shopt5.yj99.cn/help/view8.html', NULL, 1, 0, 0),
(26, '1416230204ad53', '图片', 'jpg', '饿了么VS美团外卖：来自一个大学生的“硬碰硬”报告', 'ADN00', '', '2014-11-17 21:16:44', 'http://shopt5.yj99.cn/help/view8.html', NULL, 2, 0, 0),
(27, '1416235302ad45', '图片', 'jpg', '资讯首页切换下方横幅', 'ADN02', '', '2014-11-17 22:41:42', 'http://shopt5.yj99.cn/help/view8.html', NULL, 1, 0, 0),
(29, '1416391161ad64', '文字', '', '源码类', 'ADI02', '', '2014-11-20 13:52:15', 'http://shopt5.yj99.cn/product/search_j3v.html', NULL, 0, 0, 0),
(30, '1416469699ad31', '图片', 'jpg', '首页拉屏广告', 'ADLP', '', '2014-11-20 15:48:19', 'http://shopt5.yj99.cn/help/view8.html', NULL, 1, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `yjcode_admin`
--

CREATE TABLE IF NOT EXISTS `yjcode_admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `adminuid` char(50) DEFAULT NULL,
  `adminpwd` char(50) DEFAULT NULL,
  `uname` char(50) DEFAULT NULL,
  `qx` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- 表的结构 `yjcode_car`
--

CREATE TABLE IF NOT EXISTS `yjcode_car` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `probh` char(50) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `sj` datetime DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `yjcode_clear`
--

CREATE TABLE IF NOT EXISTS `yjcode_clear` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bh` char(50) DEFAULT NULL,
  `tp` char(50) DEFAULT NULL,
  `type1` char(50) DEFAULT NULL,
  `sj` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `yjcode_control`
--

CREATE TABLE IF NOT EXISTS `yjcode_control` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weburlv` char(50) DEFAULT NULL,
  `webnamev` char(50) DEFAULT NULL,
  `webtit` varchar(250) DEFAULT NULL,
  `webkey` varchar(250) DEFAULT NULL,
  `webdes` text,
  `webtj` text,
  `dbsj` int(11) DEFAULT NULL,
  `ycsj` int(11) DEFAULT NULL,
  `tksj` int(11) DEFAULT NULL,
  `webtelv` char(50) DEFAULT NULL,
  `webqqv` varchar(250) DEFAULT NULL,
  `selltc` float DEFAULT NULL,
  `regmoney` float DEFAULT NULL,
  `pjjf` int(11) DEFAULT NULL,
  `zftype` int(11) DEFAULT NULL,
  `partner` char(50) DEFAULT NULL,
  `security_code` char(50) DEFAULT NULL,
  `seller_email` char(50) DEFAULT NULL,
  `ifsell` char(10) DEFAULT NULL,
  `openshop` float DEFAULT NULL,
  `ifproduct` char(10) DEFAULT NULL,
  `mailname` char(50) DEFAULT NULL,
  `mailsmtp` char(50) DEFAULT NULL,
  `mailpwd` char(50) DEFAULT NULL,
  `maildk` char(10) DEFAULT NULL,
  `tenpay1` char(50) DEFAULT NULL,
  `tenpay2` varchar(250) DEFAULT NULL,
  `qqappid` char(50) DEFAULT NULL,
  `qqappkey` varchar(200) DEFAULT NULL,
  `ifmob` char(10) DEFAULT NULL,
  `smsfun` text,
  `ifkf` char(10) DEFAULT NULL,
  `beian` char(50) DEFAULT NULL,
  `websyposv` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `yjcode_control`
--

INSERT INTO `yjcode_control` (`id`, `weburlv`, `webnamev`, `webtit`, `webkey`, `webdes`, `webtj`, `dbsj`, `ycsj`, `tksj`, `webtelv`, `webqqv`, `selltc`, `regmoney`, `pjjf`, `zftype`, `partner`, `security_code`, `seller_email`, `ifsell`, `openshop`, `ifproduct`, `mailname`, `mailsmtp`, `mailpwd`, `maildk`, `tenpay1`, `tenpay2`, `qqappid`, `qqappkey`, `ifmob`, `smsfun`, `ifkf`, `beian`, `websyposv`) VALUES
(1, 'http://localhost/', '友价商城t5源码', '友价商城源码t5演示站-友价源码', '友价源码,友价商城,友价T5商城,虚拟商品交易网站,源码交易平台', '', '<script src="http://s21.cnzz.com/stat.php?id=4982939&web_id=4982939&show=pic" language="JavaScript"></script>', 3, 7, 5, '400 004 8280', '199243290*技术咨询,2403653050*售前小郑,2468437512*客服鸯鸯', 0.7, 1, 20, 0, '', '', '199243290@qq.com', 'on', 100, 'off', 'shop@yj99.cn', 'smtp.exmail.qq.com', '', '25', '', '', '', '', 'on', '', 'off', 'ICP证：浙B1-008008', 9);

-- --------------------------------------------------------

--
-- 表的结构 `yjcode_db`
--

CREATE TABLE IF NOT EXISTS `yjcode_db` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `money1` float DEFAULT NULL,
  `sj` datetime DEFAULT NULL,
  `selluserid` int(11) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `dboksj` datetime DEFAULT NULL,
  `probh` char(50) DEFAULT NULL,
  `tit` varchar(250) DEFAULT NULL,
  `orderbh` char(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `yjcode_dingdang`
--

CREATE TABLE IF NOT EXISTS `yjcode_dingdang` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bh` char(50) DEFAULT NULL,
  `ddbh` char(50) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `sj` datetime DEFAULT NULL,
  `uip` char(50) DEFAULT NULL,
  `money1` float DEFAULT NULL,
  `ddzt` char(50) DEFAULT NULL,
  `alipayzt` char(50) DEFAULT NULL,
  `bz` varchar(250) NOT NULL,
  `ifok` int(11) DEFAULT NULL,
  `probh` varchar(250) DEFAULT NULL,
  `pronum` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `yjcode_djl`
--

CREATE TABLE IF NOT EXISTS `yjcode_djl` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `sj` datetime DEFAULT NULL,
  `uip` char(40) DEFAULT NULL,
  `admin` char(4) DEFAULT NULL,
  `bhid` char(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `yjcode_help`
--

CREATE TABLE IF NOT EXISTS `yjcode_help` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bh` char(50) DEFAULT NULL,
  `ty1id` int(11) DEFAULT NULL,
  `ty2id` int(11) DEFAULT NULL,
  `tit` varchar(250) DEFAULT NULL,
  `txt` text,
  `sj` datetime DEFAULT NULL,
  `zt` int(11) DEFAULT NULL,
  `wkey` varchar(250) DEFAULT NULL,
  `wdes` text,
  `djl` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `yjcode_helptype`
--

CREATE TABLE IF NOT EXISTS `yjcode_helptype` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sj` datetime DEFAULT NULL,
  `admin` int(11) DEFAULT NULL,
  `name1` char(50) DEFAULT NULL,
  `name2` char(50) DEFAULT NULL,
  `xh` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=33 ;

--
-- 转存表中的数据 `yjcode_helptype`
--

INSERT INTO `yjcode_helptype` (`id`, `sj`, `admin`, `name1`, `name2`, `xh`) VALUES
(9, '2014-10-15 17:27:48', 1, '买家指南', NULL, 1),
(10, '2014-10-15 17:27:53', 1, '卖家指南', NULL, 2),
(11, '2014-10-15 17:27:58', 1, '安全交易', NULL, 3),
(12, '2014-10-15 17:28:02', 1, '常见问题', NULL, 4),
(13, '2014-10-15 17:28:05', 1, '服务中心', NULL, 5),
(14, '2014-10-15 17:28:28', 2, '买家指南', '如何注册', 1),
(15, '2014-10-15 17:28:33', 2, '买家指南', '如何购买', 2),
(16, '2014-10-15 17:28:37', 2, '买家指南', '搜索商品', 3),
(17, '2014-10-15 17:28:41', 2, '买家指南', '支付方式', 4),
(18, '2014-10-15 17:28:47', 2, '卖家指南', '如何出售', 1),
(19, '2014-10-15 17:28:55', 2, '卖家指南', '收费标准', 2),
(20, '2014-10-15 17:29:02', 2, '卖家指南', '入驻签约', 3),
(21, '2014-10-15 17:29:24', 2, '安全交易', '钓鱼防骗', 1),
(22, '2014-10-15 17:29:31', 2, '安全交易', '预防盗号', 2),
(23, '2014-10-15 17:29:37', 2, '安全交易', '谨防诈骗', 3),
(24, '2014-10-15 17:29:44', 2, '安全交易', '实名认证', 4),
(25, '2014-10-15 17:30:30', 2, '常见问题', '如何充值', 1),
(26, '2014-10-15 17:30:35', 2, '常见问题', '如何提现', 2),
(27, '2014-10-15 17:30:41', 2, '常见问题', '真假客服', 3),
(28, '2014-10-15 17:30:47', 2, '常见问题', '忘记密码', 4),
(29, '2014-10-15 17:30:56', 2, '服务中心', '我要咨询', 1),
(30, '2014-10-15 17:31:01', 2, '服务中心', '我要建议', 2),
(31, '2014-10-15 17:31:12', 2, '服务中心', '我要投诉', 3),
(32, '2014-10-15 17:31:16', 2, '服务中心', 'QQ客服', 4);

-- --------------------------------------------------------

--
-- 表的结构 `yjcode_jfrecord`
--

CREATE TABLE IF NOT EXISTS `yjcode_jfrecord` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `tit` varchar(250) DEFAULT NULL,
  `jfnum` float DEFAULT NULL,
  `sj` datetime DEFAULT NULL,
  `uip` char(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `yjcode_loginlog`
--

CREATE TABLE IF NOT EXISTS `yjcode_loginlog` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `admin` int(11) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `sj` datetime DEFAULT NULL,
  `uip` char(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `yjcode_moneyrecord`
--

CREATE TABLE IF NOT EXISTS `yjcode_moneyrecord` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bh` char(50) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `tit` varchar(250) DEFAULT NULL,
  `moneynum` float DEFAULT NULL,
  `sj` datetime DEFAULT NULL,
  `uip` char(40) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `yjcode_news`
--

CREATE TABLE IF NOT EXISTS `yjcode_news` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type1id` int(11) DEFAULT NULL,
  `type2id` int(11) DEFAULT NULL,
  `tit` varchar(250) DEFAULT NULL,
  `txt` text,
  `djl` int(11) DEFAULT NULL,
  `sj` datetime DEFAULT NULL,
  `lastsj` datetime DEFAULT NULL,
  `uip` char(50) DEFAULT NULL,
  `bh` char(50) DEFAULT NULL,
  `ifjc` int(11) DEFAULT NULL,
  `titys` char(20) DEFAULT NULL,
  `zze` char(50) DEFAULT NULL,
  `ly` char(50) DEFAULT NULL,
  `lyurl` varchar(250) DEFAULT NULL,
  `wkey` varchar(250) DEFAULT NULL,
  `wdes` text,
  `zt` int(11) DEFAULT NULL,
  `iftp` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `yjcode_newstype`
--

CREATE TABLE IF NOT EXISTS `yjcode_newstype` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name1` char(50) DEFAULT NULL,
  `name2` char(50) DEFAULT NULL,
  `admin` int(11) DEFAULT NULL,
  `xh` int(11) DEFAULT NULL,
  `sj` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=66 ;

--
-- 转存表中的数据 `yjcode_newstype`
--

INSERT INTO `yjcode_newstype` (`id`, `name1`, `name2`, `admin`, `xh`, `sj`) VALUES
(21, '计算机/互联网', NULL, 1, 1, '2014-11-17 14:21:07'),
(22, '管理/营销/职场', NULL, 1, 2, '2014-11-17 14:21:16'),
(23, '金融/投资', NULL, 1, 3, '2014-11-17 14:21:20'),
(24, '数码/游戏/手机', NULL, 1, 4, '2014-11-17 14:21:28'),
(25, '生活百科', NULL, 1, 5, '2014-11-17 14:21:43'),
(26, '计算机/互联网', 'PC操作系统', 2, 1, '2014-11-17 14:22:06'),
(27, '计算机/互联网', '办公软件', 2, 2, '2014-11-17 14:22:11'),
(28, '计算机/互联网', '常用软件', 2, 3, '2014-11-17 14:22:16'),
(29, '计算机/互联网', '程序设计开发', 2, 4, '2014-11-17 16:23:11'),
(30, '计算机/互联网', '存储', 2, 5, '2014-11-17 14:22:33'),
(31, '计算机/互联网', '多媒体', 2, 6, '2014-11-17 14:22:37'),
(32, '计算机/互联网', '服务器应用', 2, 7, '2014-11-17 16:23:18'),
(33, '计算机/互联网', '互联网', 2, 8, '2014-11-17 14:22:46'),
(34, '管理/营销/职场', '职场/励志', 2, 1, '2014-11-17 14:23:07'),
(35, '管理/营销/职场', '资料范文', 2, 2, '2014-11-17 14:23:13'),
(36, '管理/营销/职场', '面试指南', 2, 3, '2014-11-17 14:23:17'),
(37, '管理/营销/职场', '简历攻略', 2, 4, '2014-11-17 14:23:21'),
(38, '管理/营销/职场', '企业管理', 2, 5, '2014-11-17 14:23:25'),
(39, '管理/营销/职场', '人力资源', 2, 6, '2014-11-17 14:23:29'),
(40, '管理/营销/职场', '市场推广', 2, 7, '2014-11-17 14:23:33'),
(41, '管理/营销/职场', '销售营销', 2, 8, '2014-11-17 14:23:37'),
(42, '金融/投资', '创业', 2, 1, '2014-11-17 14:24:00'),
(43, '金融/投资', '股票', 2, 2, '2014-11-17 14:24:04'),
(44, '金融/投资', '行业投资', 2, 3, '2014-11-17 14:24:07'),
(45, '金融/投资', '理财知识', 2, 4, '2014-11-17 14:24:11'),
(46, '金融/投资', '经济贸易', 2, 5, '2014-11-17 14:24:16'),
(47, '金融/投资', '基金', 2, 6, '2014-11-17 14:24:19'),
(48, '金融/投资', '债券', 2, 7, '2014-11-17 14:24:26'),
(49, '金融/投资', '外汇', 2, 8, '2014-11-17 14:24:30'),
(50, '数码/游戏/手机', 'Andriod(安卓)', 2, 1, '2014-11-17 16:23:30'),
(51, '数码/游戏/手机', 'iOS(苹果)', 2, 2, '2014-11-17 16:23:24'),
(52, '数码/游戏/手机', '网络游戏', 2, 3, '2014-11-17 14:24:57'),
(53, '数码/游戏/手机', '网页游戏', 2, 4, '2014-11-17 14:25:01'),
(54, '数码/游戏/手机', '单机游戏', 2, 5, '2014-11-17 14:25:05'),
(55, '数码/游戏/手机', 'Windows Phone', 2, 6, '2014-11-17 14:25:09'),
(56, '数码/游戏/手机', '数码相机', 2, 7, '2014-11-17 14:25:13'),
(57, '数码/游戏/手机', '数码摄像机', 2, 8, '2014-11-17 14:25:17'),
(58, '生活百科', '养生保健', 2, 1, '2014-11-17 14:25:43'),
(59, '生活百科', '美容时尚', 2, 2, '2014-11-17 14:25:46'),
(60, '生活百科', '美食烹饪', 2, 3, '2014-11-17 14:25:50'),
(61, '生活百科', '购房置业', 2, 4, '2014-11-17 14:25:53'),
(62, '生活百科', '家居装修', 2, 5, '2014-11-17 14:25:57'),
(63, '生活百科', '家电维修', 2, 6, '2014-11-17 14:26:01'),
(64, '生活百科', '汽车保养', 2, 7, '2014-11-17 14:26:04'),
(65, '生活百科', '育儿母婴', 2, 8, '2014-11-17 14:26:08');

-- --------------------------------------------------------

--
-- 表的结构 `yjcode_onecontrol`
--

CREATE TABLE IF NOT EXISTS `yjcode_onecontrol` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sj` datetime DEFAULT NULL,
  `tyid` int(11) DEFAULT NULL,
  `txt` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- 转存表中的数据 `yjcode_onecontrol`
--

INSERT INTO `yjcode_onecontrol` (`id`, `sj`, `tyid`, `txt`) VALUES
(1, '2014-10-15 15:45:43', 1, '<p><strong>尊敬的用户：您好！</strong></p><p>欢迎光临友价源码（www.yj99.cn）网站（以下简称“本站”）。</p><p>用户需要同意本服务条款才能成为本站的注册用户并享受本网站所提供的各项服务。用户注册是完全免费的，继续注册前请先阅读服务条款。</p><p><br/></p><p><strong>1. 本站服务条款确认与接纳</strong></p><p>本协议是用户（您）与本站之间的协议，本站依据本协议条款为您提供服务。</p><p>1.1 本协议服务条款构成您（无论是个人或者单位）使用本站所提供服务之先决条件。如您不同意本协议服务条款或其随时对其的修改，您应不使用或主动取消本站提供的服务。您的使用行为将被视为您对本协议服务条款及其随时修改版本的完全接受；</p><p>1.2 这些条款可由本站随时更新，且毋须另行通知。修改后的服务条款一旦在本站上公布即取代替原来的服务条款，并构成本条款整体之一部分。您可随时访问本站查阅最新的服务条款。</p><p><br/></p><p><strong>2. 本站提供的服务</strong></p><p>2.1 本站向您提供包括但不限于如下服务：</p><p>（1）本站主页www.yj99.cn（含其他任何由本站直接所有或运营的任何网站）；&nbsp;</p><p>（2）本站利用直接拥有或运营的服务器、为您提供的信息网络存储空间；&nbsp;</p><p>（3）本站网站联盟（包括其他第三方网站）；&nbsp;</p><p>（4）本站提供给您的任何其他技术和/或服务。</p><p>本站仅根据您的指令，提供信息网络存储空间（或信息登记）及相关平台服务，本身不直接上传（发布）任何内容。您利用本站服务上传的内容包括但不限于文档（文字）、图片、音视频课件等，您担保对利用本站服务上传、传播的内容负全部法律责任。</p><p>2.2 您在此明确陈述并保证对所有上传、传播到本站上的内容，拥有或取得了所有必要的权利并承担全部的法律责任，包括但不限于：您有权或已取得必要的许可、授权、准许来使用或授权本站使用所有与上传作品有关的所有专利、商标、商业秘密、版权、表演者权及其他私有权利；</p><p>2.3 对所有上传至本站的内容（您在此保证已获得权利人的明确授权），您在此同意授予本站对所有上述作品和内容的在全球范围内的免费、不可撤销的、无限期的、并且可转让的非独家使用权许可；本站有权视情况展示、散布及推广前述内容，有权对前述内容进行任何形式的复制、修改、出版、发行及以其他方式使用或者授权第三方进行复制、修改、出版、发行及以其他方式使</p><p>用；<br/></p><p>2.4 本站并不担保您所有上传内容能够通过本站服务为其他用户所获取、浏览，本站没有义务和责任对所有您上传、传播的内容进行监测；但本站保留根据国家法律、法规的要求对上传、传播的内容进行不定时抽查的权利，并有权在不事先通知的情况下移除获断开链接违法、侵权的内容。此款的规定并不排除您对上传内容的版权担保，亦并非表明本站有责任及能力判断您上传内容的版权归属 。</p><p><br/></p><p><strong>3. 用户注册</strong></p><p>如果您使用本站提供的网络存储空间进行资料上传、传播服务，您需要注册一个账号、密码，并确保注册信息的真实性、正确性及完整性，如果上述注册信息发生变化，您应及时更改。在安全完成本服务的登记程序并收到一个密码及账号后，您应维持密码及账号的机密安全。您应对任何人利用您的密码及账号所进行的活动负完全的责任，本站无法对非法或未经您授权使用您账号及</p><p>密码的行为做出甄别，因此本站不承担任何责任。在此，您同意并承诺做到：<br/></p><p>3.1 当您的密码或账号遭到未获授权的使用，或者发生其他任何安全问题时，您会立即有效地通知到本站；</p><p>3.2 当您每次登录本站或使用其他相关服务后，会将有关账号等安全退出；</p><p>3.3 您同意接受本站通过电子邮件、客户端、网页或其他合法方式向您发送相关商业信息。在使用电信增值服务的情况下，您同意接受本站及其合作公司通过增值服务系统或其他方式向您发送的相关服务信息或其他信息，其他信息包括但不限于通知信息、宣传信息、广告信息等；</p><p>3.4 您承诺不在注册、使用本站账号时从事下列行为：</p><p>（1） 故意冒用他人信息为自己注册本站账号；&nbsp;</p><p>（2） 未经他人合法授权以他人名义注册本站账号；</p><p>（3） 使用侮辱、诽谤、色情等违反公序良俗的词语注册本站账号。</p><p>3.5 您在此同意，本站有权根据自己的判定，对违反上述条款的用户拒绝提供账号注册或取消该账号的使用；</p><p>3.6 本站保证，您提供给本站的所有注册信息将根据本站隐私保护政策予以保密，但根据国家法律强制性要求予以披露的除外。</p><p><br/></p><p><strong>4. 用户行为与承诺</strong></p><p>您单独承担发布内容的责任。您对服务的使用是根据所有适用于服务的地方法律、国家法律和国际法律标准的。</p><p>用户承诺：</p><p>4.1 在本站的网页上发布信息或者利用本站的服务时必须符合中国有关法规，不得在本站的网页上或者利用本站的服务制作、复制、发布、传播以下信息：</p><p>（1）反对宪法所确定的基本原则的；</p><p>（2）危害国家安全，泄露国家秘密，颠覆国家政权，破坏国家统一的；</p><p>（3）损害国家荣誉和利益的；</p><p>（4）煽动民族仇恨、民族歧视，破坏民族团结的；</p><p>（5）破坏国家宗教政策，宣扬邪教和封建迷信的；</p><p>（6）散布谣言，扰乱社会秩序，破坏社会稳定的；</p><p>（7）散布淫秽、色情、赌博、暴力、凶杀、恐怖或者教唆犯罪的；</p><p>（8）侮辱或者诽谤他人，侵害他人合法权益的；</p><p>（9）煽动非法集会、结社、游行、示威、聚众扰乱社会秩序的；</p><p>（10）以非法民间组织名义活动的；</p><p>（11）含有法律、行政法规禁止的其他内容的。</p><p>4.2 不利用本站的服务从事以下活动：</p><p>（1）未经允许，进入计算机信息网络或者使用计算机信息网络资源的；</p><p>（2）未经允许，对计算机信息网络功能进行删除、修改或者增加的；&nbsp;</p><p>（3）未经允许，对进入计算机信息网络中存储、处理或者传输的数据和应用程序进行删除、修改或者增加的；</p><p>（4）故意制作、传播计算机病毒等破坏性程序的；</p><p>（5）其他危害计算机信息网络安全的行为。</p><p>4.3 遵守本站的所有其他规定和程序。</p><p><br/></p><p><strong>5. 隐私保护</strong></p><p>当您注册本站的服务时，您须提供个人信息。本站收集个人信息的目的是为您提供尽可能多的个人化网上服务。本站不会在未经合法获得您授权时，公开、编辑或透露您的个人信息及保存在本站中的非公开内容，除非有下列情况：</p><p>（1）有关法律规定或本站合法服务程序规定；&nbsp;</p><p>（2）在紧急情况下，为维护您及公众的权益；&nbsp;</p><p>（3）为维护本站的商标权、专利权及其他任何合法权益；</p><p>（4）其他依法需要公开、编辑或透露个人信息的情况。</p><p><br/></p><p><strong>6. 免责声明</strong></p><p>6.1本站本身不直接上传、发布任何包括但不限于文档（文字）、图片、音视频课件等内容。所有内容均由用户上传、发布，本站合理信赖内容上传（发布）者是原创作者或是已经征得著作权人的同意并与著作权人就相关问题做出了妥善处理。内容上传（发布）者担保对利用本站服务上传、传播的内容负全部法律责任，本站不负担任何责任。</p><p>6.2 本网站发布的各类数字产品文档，访问者在本网站发表的观点以及以链接形式推荐的其他网站内容，仅为提供更多信息以参考使用或者学习交流，并不代表本网站观点，也不构成任何销售建议。</p><p>6.3以下情形导致的个人信息泄露，本站免责：&nbsp;</p><p>（1）政府部门、司法机关等依照法定程序要求本站披露个人资料时，本站将根据执法单位之要求或为公共安全之目的提供个人资料；&nbsp;</p><p>（2）由于用户将个人密码告知他人或与他人共享注册账户，由此导致的任何个人资料泄露；&nbsp;</p><p>（3）任何由于计算机问题、黑客攻击、计算机病毒侵入或发作、因政府管制而造成的暂时性关闭等影响网络正常经营的不可抗力而造成的个人资料泄露、丢失、被盗用或被窜改等；&nbsp;</p><p>（4）由于与本站链接的其他网站所造成之个人资料泄露；&nbsp;</p><p>6.4 本站若因线路及本站控制范围外的硬件故障或其它不可抗力而导致暂停服务，暂停服务期间给用户造成的一切损失，本站不承担任何法律责任。</p><p>6.5 除本站注明之服务条款外，其他一切因使用本站而引致之任何意外、疏忽、诽谤、版权或知识产权侵犯及其所造成的损失（包括因下载而感染电脑病毒），本站不承担任何法律责任。&nbsp;</p><p>6.6 为方便您使用，本站服务可能会提供与第三方国际互联网网站或资源进行链接。除非另有声明，本站无法对第三方网站服务进行控制，您因使用或依赖上述网站或资源所产生的损失或损害，本站不负担任何责任。</p><p><br/></p><p><strong>7. 版权政策</strong></p><p>本站根据用户指令提供内容上传、传播的信息网络存储空间，我们充分尊重原创作者的著作权和知识产权。根据《中国人民共和国版权法》、《信息网络传播权保护条例》、《互联网著作权行政保护办法》等相关法律、法规的规定，本站针对网络侵权采取如下版权政策：</p><p>（1）本站对网络版权保护尽合理、审慎的义务，在有理由确信有任何明显侵犯任何第三人版权的内容存在时，有权不事先通知随时删除该侵权内容；</p><p>（2）在接到符合法定要求的版权通知时，迅速删除涉嫌侵权内容；</p><p>（3）采取必要的技术措施，尽量防止相同侵权内容的再次上传；</p><p>（4）对有证据证明反复上传侵权内容的用户随时停止提供网络存储空间的技术服务和信息发布服务。</p><p><br/></p><p><strong>8. 服务终止</strong></p><p>8.1 您同意本站有权基于其自行之考虑，因任何理由，包括但不限于缺乏使用或本站认为您已经违反本协议的文字及精神，而终止您的账号或服务之全部或任何部分，并将您在本站的服务内的任何内容加以移除并删除；</p><p>8.2 您同意依本协议任何规定提供之服务，无需进行事先通知即可中断或终止，您承认并同意，本站可立即关闭或删除您的账号及您账号中所有相关信息及文件，及/或禁止继续使用前述文件或本站的服务。</p><p>此外，您同意若本站的服务之使用被中断、终止或您的账号及相关信息和文件被关闭、删除，本站对您或任何第三人均不承担任何责任。</p><p><br/></p><p><strong>9. 其他</strong></p><p>请确认您已仔细阅读了本服务条款，接受本站服务条款全部内容，成为本站的正式用户。用户在享受本站服务时必须完全、严格遵守本服务条款。&nbsp;</p><p>本服务条款的所有解释权归本站所有。</p>'),
(2, '2014-10-26 12:05:26', 2, '<p>关于我们资料正在整理中……<br/></p>'),
(3, '2014-11-19 14:38:48', 3, '<p>广告合作资料正在整理中……</p>'),
(4, '2014-10-26 12:05:39', 4, '<p>联系我们资料正在整理中……</p>'),
(5, '2014-10-26 12:05:45', 5, '<p>隐私条款资料正在整理中……</p>'),
(6, '2014-10-26 12:05:51', 6, '<p>免责声明资料正在整理中……</p>'),
(7, '2014-10-30 16:58:10', 7, '<p>开店协议资料整理中……</p>'),
(8, '2014-11-02 14:00:30', 8, '<p>商品发布条款正在整理中</p>');

-- --------------------------------------------------------

--
-- 表的结构 `yjcode_order`
--

CREATE TABLE IF NOT EXISTS `yjcode_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `probh` char(50) DEFAULT NULL,
  `sj` datetime DEFAULT NULL,
  `fhsj` datetime DEFAULT NULL,
  `oksj` datetime DEFAULT NULL,
  `uip` char(40) DEFAULT NULL,
  `selluserid` int(11) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `money1` float DEFAULT NULL,
  `orderbh` char(50) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `tit` varchar(250) DEFAULT NULL,
  `ddzt` char(15) DEFAULT NULL,
  `tksj` datetime DEFAULT NULL,
  `tkly` text,
  `tkjg` varchar(250) DEFAULT NULL,
  `tkoksj` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `yjcode_pro`
--

CREATE TABLE IF NOT EXISTS `yjcode_pro` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bh` char(50) DEFAULT NULL,
  `mybh` char(50) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `sj` datetime DEFAULT NULL,
  `lastsj` datetime DEFAULT NULL,
  `uip` char(50) DEFAULT NULL,
  `ty1id` int(11) DEFAULT NULL,
  `ty2id` int(11) DEFAULT NULL,
  `ty3id` int(11) DEFAULT NULL,
  `zt` int(11) DEFAULT NULL,
  `tysx` varchar(250) DEFAULT NULL,
  `tit` varchar(250) DEFAULT NULL,
  `txt` text,
  `djl` int(11) DEFAULT NULL,
  `xsnum` int(11) DEFAULT NULL,
  `kcnum` int(11) DEFAULT NULL,
  `money1` float DEFAULT NULL,
  `money2` float DEFAULT NULL,
  `money3` float DEFAULT NULL,
  `yhxs` int(11) DEFAULT NULL,
  `yhsm` char(50) DEFAULT NULL,
  `yhsj1` datetime DEFAULT NULL,
  `yhsj2` datetime DEFAULT NULL,
  `ifxj` int(11) DEFAULT NULL,
  `iftuan` int(11) DEFAULT NULL,
  `pf1` float DEFAULT NULL,
  `pf2` float DEFAULT NULL,
  `pf3` float DEFAULT NULL,
  `iftj` int(11) DEFAULT NULL,
  `fhxs` int(11) DEFAULT NULL,
  `wpurl` varchar(250) DEFAULT NULL,
  `wppwd` char(50) DEFAULT NULL,
  `upf` char(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `yjcode_profav`
--

CREATE TABLE IF NOT EXISTS `yjcode_profav` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `probh` char(50) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `sj` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `yjcode_propj`
--

CREATE TABLE IF NOT EXISTS `yjcode_propj` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `probh` char(50) DEFAULT NULL,
  `selluserid` int(11) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `sj` datetime DEFAULT NULL,
  `uip` char(50) DEFAULT NULL,
  `pf1` int(11) DEFAULT NULL,
  `pf2` int(11) DEFAULT NULL,
  `pf3` int(11) DEFAULT NULL,
  `txt` text,
  `hf` text,
  `hfsj` datetime DEFAULT NULL,
  `orderbh` char(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `yjcode_shopfav`
--

CREATE TABLE IF NOT EXISTS `yjcode_shopfav` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shopid` int(11) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `sj` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `yjcode_tag`
--

CREATE TABLE IF NOT EXISTS `yjcode_tag` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sj` datetime DEFAULT NULL,
  `djl` int(11) DEFAULT NULL,
  `name1` char(50) DEFAULT NULL,
  `admin` int(11) DEFAULT NULL,
  `zt` int(11) DEFAULT NULL,
  `ifjc` int(11) DEFAULT NULL,
  `titys` char(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `yjcode_tixian`
--

CREATE TABLE IF NOT EXISTS `yjcode_tixian` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bh` char(50) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `money1` float DEFAULT NULL,
  `sj` datetime DEFAULT NULL,
  `uip` char(40) DEFAULT NULL,
  `txyh` char(30) DEFAULT NULL,
  `txname` char(30) DEFAULT NULL,
  `txzh` char(50) DEFAULT NULL,
  `txkhh` char(50) DEFAULT NULL,
  `zt` int(11) DEFAULT NULL,
  `sm` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `yjcode_tk`
--

CREATE TABLE IF NOT EXISTS `yjcode_tk` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `money1` float DEFAULT NULL,
  `sj` datetime DEFAULT NULL,
  `tkoksj` datetime DEFAULT NULL,
  `selluserid` int(11) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `probh` char(50) DEFAULT NULL,
  `tkly` text,
  `orderbh` char(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `yjcode_tp`
--

CREATE TABLE IF NOT EXISTS `yjcode_tp` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bh` char(50) DEFAULT NULL,
  `tp` char(50) DEFAULT NULL,
  `type1` char(30) DEFAULT NULL,
  `iffm` int(11) DEFAULT NULL,
  `sj` datetime DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `xh` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `yjcode_type`
--

CREATE TABLE IF NOT EXISTS `yjcode_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `admin` int(11) DEFAULT NULL,
  `type1` char(50) DEFAULT NULL,
  `type2` char(50) DEFAULT NULL,
  `type3` char(50) DEFAULT NULL,
  `xh` int(11) DEFAULT NULL,
  `sj` datetime DEFAULT NULL,
  `col` char(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `yjcode_typesx`
--

CREATE TABLE IF NOT EXISTS `yjcode_typesx` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `typeid` int(11) DEFAULT NULL,
  `name1` char(50) DEFAULT NULL,
  `name2` char(50) DEFAULT NULL,
  `admin` int(11) DEFAULT NULL,
  `xh` int(11) DEFAULT NULL,
  `sj` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `yjcode_update`
--

CREATE TABLE IF NOT EXISTS `yjcode_update` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sj` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `yjcode_user`
--

CREATE TABLE IF NOT EXISTS `yjcode_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` char(40) DEFAULT NULL,
  `pwd` char(50) DEFAULT NULL,
  `sj` datetime DEFAULT NULL,
  `uip` char(40) DEFAULT NULL,
  `money1` float DEFAULT NULL,
  `jf` int(11) DEFAULT NULL,
  `nc` char(30) DEFAULT NULL,
  `mot` char(50) DEFAULT NULL,
  `ifmot` int(11) DEFAULT NULL,
  `email` char(50) DEFAULT NULL,
  `ifemail` int(11) DEFAULT NULL,
  `uqq` varchar(250) DEFAULT NULL,
  `weixin` char(50) DEFAULT NULL,
  `yxsj` datetime DEFAULT NULL,
  `openid` char(50) DEFAULT NULL,
  `ifqq` int(11) DEFAULT NULL,
  `djl` int(11) DEFAULT NULL,
  `shopname` char(50) DEFAULT NULL,
  `seokey` varchar(250) DEFAULT NULL,
  `seodes` varchar(250) DEFAULT NULL,
  `txt` text,
  `pm` int(11) DEFAULT NULL,
  `zt` int(11) DEFAULT NULL,
  `openshop` float DEFAULT NULL,
  `shopzt` int(11) DEFAULT NULL,
  `shopztsm` varchar(250) DEFAULT NULL,
  `getpwd` char(20) DEFAULT NULL,
  `bdmot` char(20) DEFAULT NULL,
  `bdemail` char(20) DEFAULT NULL,
  `txyh` char(30) DEFAULT NULL,
  `txname` char(30) DEFAULT NULL,
  `txzh` char(50) DEFAULT NULL,
  `txkhh` char(50) DEFAULT NULL,
  `zfmm` char(50) DEFAULT NULL,
  `sellmall` float DEFAULT NULL,
  `sellmyue` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
