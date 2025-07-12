-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- 主机： localhost
-- 生成日期： 2025-04-06 23:44:58
-- 服务器版本： 5.7.40
-- PHP 版本： 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `21`
--

-- --------------------------------------------------------

--
-- 表的结构 `admin`
--

CREATE TABLE `admin` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'ID',
  `username` varchar(20) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '用户名',
  `nickname` varchar(50) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '昵称',
  `password` varchar(32) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '密码',
  `salt` varchar(30) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '密码盐',
  `avatar` varchar(255) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '头像',
  `email` varchar(100) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '电子邮箱',
  `mobile` varchar(11) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '手机号码',
  `loginfailure` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '失败次数',
  `logintime` bigint(20) DEFAULT NULL COMMENT '登录时间',
  `loginip` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '登录IP',
  `createtime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `updatetime` bigint(20) DEFAULT NULL COMMENT '更新时间',
  `token` varchar(59) COLLATE utf8_unicode_ci DEFAULT '' COMMENT 'Session标识',
  `status` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'normal' COMMENT '状态'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='管理员表' ROW_FORMAT=COMPACT;

--
-- 转存表中的数据 `admin`
--

INSERT INTO `admin` (`id`, `username`, `nickname`, `password`, `salt`, `avatar`, `email`, `mobile`, `loginfailure`, `logintime`, `loginip`, `createtime`, `updatetime`, `token`, `status`) VALUES
(1, 'admin', '偌亚方舟', '9e1790807117e0d38571afaea9f75129', '94KLBo', 'https://static.tronscan.org/production/logo/usdtlogo.png', '888@tg.com', '18888888888', 0, 1743914306, '', 1888888888, 1743914306, 'fcd6b8c2-d356-4873-bc98-914a5be12fa5', 'normal');

-- --------------------------------------------------------

--
-- 表的结构 `admin_log`
--

CREATE TABLE `admin_log` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'ID',
  `admin_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `username` varchar(30) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '管理员名字',
  `url` varchar(1500) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '操作页面',
  `title` varchar(100) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '日志标题',
  `content` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '内容',
  `ip` varchar(50) COLLATE utf8_unicode_ci DEFAULT '' COMMENT 'IP',
  `useragent` varchar(255) COLLATE utf8_unicode_ci DEFAULT '' COMMENT 'User-Agent',
  `createtime` bigint(20) DEFAULT NULL COMMENT '操作时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='管理员日志表' ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- 表的结构 `area`
--

CREATE TABLE `area` (
  `id` int(11) NOT NULL COMMENT 'ID',
  `pid` int(11) DEFAULT NULL COMMENT '父id',
  `shortname` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '简称',
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '名称',
  `mergename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '全称',
  `level` tinyint(4) DEFAULT NULL COMMENT '层级:1=省,2=市,3=区/县',
  `pinyin` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '拼音',
  `code` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '长途区号',
  `zip` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '邮编',
  `first` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '首字母',
  `lng` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '经度',
  `lat` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '纬度'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='地区表' ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- 表的结构 `attachment`
--

CREATE TABLE `attachment` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'ID',
  `category` varchar(50) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '类别',
  `admin_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '会员ID',
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '物理路径',
  `imagewidth` varchar(30) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '宽度',
  `imageheight` varchar(30) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '高度',
  `imagetype` varchar(30) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '图片类型',
  `imageframes` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '图片帧数',
  `filename` varchar(100) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '文件名称',
  `filesize` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '文件大小',
  `mimetype` varchar(100) COLLATE utf8_unicode_ci DEFAULT '' COMMENT 'mime类型',
  `extparam` varchar(255) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '透传数据',
  `createtime` bigint(20) DEFAULT NULL COMMENT '创建日期',
  `updatetime` bigint(20) DEFAULT NULL COMMENT '更新时间',
  `uploadtime` bigint(20) DEFAULT NULL COMMENT '上传时间',
  `storage` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'local' COMMENT '存储位置',
  `sha1` varchar(40) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '文件 sha1编码'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='附件表' ROW_FORMAT=COMPACT;

--
-- 转存表中的数据 `attachment`
--

INSERT INTO `attachment` (`id`, `category`, `admin_id`, `user_id`, `url`, `imagewidth`, `imageheight`, `imagetype`, `imageframes`, `filename`, `filesize`, `mimetype`, `extparam`, `createtime`, `updatetime`, `uploadtime`, `storage`, `sha1`) VALUES
(3, '', 1, 0, '/uploads/20240722/a440d4b512f4d2b9b63d3ab8818fc9e3.png', '2000', '2000', 'png', 0, 'tether-usdt-logo.png', 69679, 'image/png', '', 1721634893, 1721634893, 1721634893, 'local', '90dac8c11ffff8e0b345d11a55049c088eff2165'),
(4, '', 1, 0, '/uploads/20240817/abdc013824ac9b932ac385654cd1cb6d.jpg', '658', '658', 'jpg', 0, 'peitu.jpg', 83502, 'image/jpeg', '', 1723867321, 1723867321, 1723867321, 'local', 'd2c96fb1eed243b1226f2e8a0d5a3d3848659c21'),
(5, '', 1, 0, '/uploads/20241119/a90f9a494d0f78a425bb71a9a410bc51.jpeg', '2000', '2000', 'jpeg', 0, 'a90f9a494d0f78a425bb71a9a410bc51.jpeg', 433041, 'image/jpeg', '', 1731947708, 1731947708, 1731947708, 'local', '14456fe191a43fb3c7a5522a0423e9397f4ef51a'),
(6, '', 1, 0, '/uploads/20241119/cab211c69708012f2fa0980d478be84a.jpg', '610', '657', 'jpg', 0, 'tk.jpg', 48500, 'image/jpeg', '', 1731950758, 1731950758, 1731950757, 'local', '9a8be3d6e865c9ad151bfc6f8dd5dee79eb2d662'),
(7, '', 1, 0, '/uploads/20241119/37e799c5720f97578fd568fb5c33f2a9.jpg', '800', '800', 'jpg', 0, 'th.jpg', 136633, 'image/jpeg', '', 1731950871, 1731950871, 1731950871, 'local', '5d7f05df9a3cd67bb85c48361fbbd081eacaafd0'),
(8, '', 1, 0, '/uploads/20241119/e67bf271036c4235457073c46f258b5b.jpg', '376', '377', 'jpg', 0, 'photo_2024-11-19_01-32-43.jpg', 11218, 'image/jpeg', '', 1731951179, 1731951179, 1731951179, 'local', '29e6e3f5750f9156fa1fb3a14c4bd65ad0dd5d59'),
(9, '', 1, 0, '/uploads/20241130/753220240b4a5604a1fc6618ec50e645.jpg', '912', '800', 'jpg', 0, '油卡.jpg', 73470, 'image/jpeg', '', 1732979602, 1732979602, 1732979602, 'local', 'e57bf1b51720310dcd9a956a9a1012226f90889c'),
(10, '', 1, 0, '/uploads/20241130/81418f573cec27c87d56f2a90752d42f.webp', '650', '500', 'webp', 0, 'tg.webp', 3240, 'image/webp', '', 1732979682, 1732979682, 1732979682, 'local', '52aff35a7f81f487a9259b314e6040ca1fbaf667'),
(11, '', 1, 0, '/uploads/20241130/5e24a1ee14f2edaa5b166bc9dbf763f8.jpg', '376', '378', 'jpg', 0, 'photo_2024-11-30_23-16-02.jpg', 31384, 'image/jpeg', '', 1732979774, 1732979774, 1732979774, 'local', '3db8be613f1a5d0a0a7633b18ec29992cc8ab26b'),
(12, '', 1, 0, '/uploads/20241130/200b0ff83f66184811f3e88f65820ab6.jpg', '440', '587', 'jpg', 0, 'photo_2024-11-30_23-17-51.jpg', 61311, 'image/jpeg', '', 1732979901, 1732979901, 1732979901, 'local', '77c6884eac221e0f667902d78cffdb9faa7e7f1e'),
(13, '', 1, 0, '/uploads/20241130/177b4161d9a8a9d4dad126e00da4d6f1.jpg', '632', '500', 'jpg', 0, 'photo_2024-11-30_23-19-39.jpg', 88621, 'image/jpeg', '', 1732980008, 1732980008, 1732980008, 'local', '2d8a2c2f0a772c417d4d9181bfef0f973368bc89'),
(14, '', 1, 0, '/uploads/20241130/529acc8076c7bcf56c7f195542e6602a.jpg', '225', '225', 'jpg', 0, 'photo_2024-11-30_23-27-35.jpg', 3381, 'image/jpeg', '', 1732980541, 1732980541, 1732980541, 'local', '89b72bf05742bd665ef99f53cf4f0c204d3f32d1'),
(15, '', 1, 0, '/uploads/20241130/b15e989bcfa72aec9d3bf5b430fd8b5e.jpg', '701', '500', 'jpg', 0, 'photo_2024-11-30_23-36-22.jpg', 22334, 'image/jpeg', '', 1732981046, 1732981046, 1732981046, 'local', '79a18e3d5a20c11adb3a2ea8943ef66bc882504e'),
(16, '', 1, 0, '/uploads/20241130/1eaba7882faf620e144b43a300773b98.jpg', '256', '256', 'jpg', 0, 'photo_2024-11-30_23-41-53.jpg', 13766, 'image/jpeg', '', 1732981332, 1732981332, 1732981332, 'local', '36293ba4fc5f634c703cc2fe499f43442b13d128'),
(17, '', 1, 0, '/uploads/20241130/70140f538c8c1f6b3f4c5c6f321405c8.jpg', '639', '500', 'jpg', 0, 'photo_2024-11-30_23-46-54.jpg', 60200, 'image/jpeg', '', 1732981629, 1732981629, 1732981629, 'local', '99d5f414a191cea102c7be2261449151a7dbbf10'),
(18, '', 1, 0, '/uploads/20241130/20dd216fb71a16d4db783f70c2aacf1a.jpg', '360', '360', 'jpg', 0, 'photo_2024-11-30_23-52-22.jpg', 13251, 'image/jpeg', '', 1732981961, 1732981961, 1732981961, 'local', '0d3f4685dc03d1d11e682713b284d4b88bb89951'),
(19, '', 1, 0, '/uploads/20241130/60ea7a2e7eaa72b6a8455b0116fe5732.jpg', '1280', '819', 'jpg', 0, 'photo_2024-11-30_23-53-47.jpg', 143436, 'image/jpeg', '', 1732982064, 1732982064, 1732982064, 'local', '76d6552ae13368b396318b55fbd58dc3a8599e5f'),
(20, '', 1, 0, '/uploads/20241130/fef1efb6ab5e08316a81d5237e8ec4c1.jpg', '225', '225', 'jpg', 0, 'photo_2024-11-30_23-57-21.jpg', 4863, 'image/jpeg', '', 1732982252, 1732982252, 1732982252, 'local', 'e4f4d4bc56250b30d9da26516c8815ee4a58bcfb'),
(21, '', 1, 0, '/uploads/20241201/60d1e4b2ce022684f833492a8c15816b.jpg', '225', '225', 'jpg', 0, 'photo_2024-12-01_00-00-06.jpg', 7032, 'image/jpeg', '', 1732982416, 1732982416, 1732982416, 'local', '1d6aae4efddf36a55877c02b190fa88a07643219'),
(22, '', 1, 0, '/uploads/20241201/45748ddfef02e90e49cd2bdcc71f0542.jpg', '782', '800', 'jpg', 0, 'photo_2024-12-01_01-03-32.jpg', 50033, 'image/jpeg', '', 1732986224, 1732986224, 1732986224, 'local', '6d631daa80e533030c046212e372fea643a124b8'),
(23, '', 1, 0, '/uploads/20241201/9bdf771cf07eb81102b1c68a2a49b3c9.jpg', '300', '300', 'jpg', 0, 'photo_2024-12-01_01-04-26.jpg', 8871, 'image/jpeg', '', 1732986278, 1732986278, 1732986278, 'local', '9d203f1b5a186a9bdd99c5c9b3fa291629e07408'),
(24, '', 1, 0, '/uploads/20241201/3489579a842ab4376b730151b5faa38a.jpg', '240', '240', 'jpg', 0, 'photo_2024-12-01_01-05-04.jpg', 10173, 'image/jpeg', '', 1732986317, 1732986317, 1732986317, 'local', 'a7a285e254471512d0725985adddfa969ecc6e8e'),
(25, '', 1, 0, '/uploads/20241201/58b91616fbf845387f0ed97d6f56a627.jpg', '1000', '1000', 'jpg', 0, 'photo_2024-12-01_01-06-59.jpg', 35901, 'image/jpeg', '', 1732986436, 1732986436, 1732986436, 'local', 'dfd117d57a37bd4bef50f0495e5b2081426f6ba8'),
(26, '', 1, 0, '/uploads/20241201/ccd4c10dfaccb4bffbfdb58fdedd35ab.webp', '800', '1067', 'webp', 0, 'u=4232753093,3203167022&amp;fm=253&amp;fmt=auto&amp;app=138&amp;f=JPEG.webp', 63478, 'image/webp', '', 1732986739, 1732986739, 1732986739, 'local', 'b773d220155d69a291c1aae4f52f1231dbfedd6a'),
(27, '', 1, 0, '/uploads/20241201/ab456b471cbdadb790a5812218f21e55.webp', '350', '350', 'webp', 0, 'u=2635983612,1648775121&amp;fm=253&amp;fmt=auto&amp;app=138&amp;f=JPEG.webp', 3698, 'image/webp', '', 1732986860, 1732986860, 1732986860, 'local', '7c450595461cedc198067f9e799b8ab77021a300'),
(28, '', 1, 0, '/uploads/20241209/b30666c1e34fd904082e3a12117cef5b.png', '1361', '1361', 'png', 0, 'aee2-knaqvqn1074421.png', 107920, 'image/png', '', 1733735607, 1733735607, 1733735607, 'local', '4d4b133b1ef358b1114dcbaca40f0fc15b720f8e'),
(29, '', 1, 0, '/uploads/20241209/fcd4ab09a82635331ca97390fc89fa22.jpg', '1124', '1007', 'jpg', 0, 'photo_2024-12-09_23-10-32.jpg', 40679, 'image/jpeg', '', 1733757049, 1733757049, 1733757049, 'local', '20c35636203d14bc2f543e9ac716b44a4104e660'),
(30, '', 1, 0, '/uploads/20241209/e822e35ee3b384104b0490df26440877.jpg', '1117', '619', 'jpg', 0, 'photo_2024-12-09_23-10-32.jpg', 28426, 'image/jpeg', '', 1733757114, 1733757114, 1733757114, 'local', '44d34064b58c9b319809992a60a79f0ff0f3ab61'),
(31, '', 1, 0, '/uploads/20241209/b9390ac16c1068d23a963be31120887c.jpg', '1109', '652', 'jpg', 0, 'photo_2024-12-09_23-27-03.jpg', 40381, 'image/jpeg', '', 1733758068, 1733758068, 1733758068, 'local', '2ad9cce96c36265921ebcd0b1b04a48649f71989'),
(32, '', 1, 0, '/uploads/20241209/6f7f6a915a53a2e249d4da62251c715a.jpg', '453', '480', 'jpg', 0, 'photo_2024-12-09_23-40-32.jpg', 28404, 'image/jpeg', '', 1733758847, 1733758847, 1733758847, 'local', 'a25b82cc3857d7934b8eee0ca69fa7c541cb37ad'),
(33, '', 1, 0, '/uploads/20241210/4de113a34d4a3fd5a3b58bab0d476944.jpg', '590', '1280', 'jpg', 0, 'photo_12_2024-12-10_00-22-39.jpg', 40765, 'image/jpeg', '', 1733761631, 1733761631, 1733761631, 'local', 'e6e9622b30ab7462f8c096c906a7852a41081dd5'),
(34, '', 1, 0, '/uploads/20241210/36f5c71fb7ed6a6e8b57dc90ff216f28.jpg', '590', '1280', 'jpg', 0, 'photo_13_2024-12-10_00-22-39.jpg', 42149, 'image/jpeg', '', 1733761733, 1733761733, 1733761733, 'local', '12de9d5fdc251470505258d39dcb8acc8abbc791'),
(35, '', 1, 0, '/uploads/20241210/a3ef41b9a68d4b5413da6acfd1c0c29c.jpg', '590', '1280', 'jpg', 0, 'photo_14_2024-12-10_00-22-39.jpg', 40873, 'image/jpeg', '', 1733761843, 1733761843, 1733761843, 'local', 'c6d950ee296ef22a3b7531d5359ad7bb645f1fe2'),
(36, '', 1, 0, '/uploads/20241210/bc722194a76817b4bd3b6561215b9a7a.jpg', '590', '1280', 'jpg', 0, 'photo_15_2024-12-10_00-22-39.jpg', 41697, 'image/jpeg', '', 1733761879, 1733761879, 1733761879, 'local', '0b38c0df6db9b5cbb1d496600161728fc457853c'),
(37, '', 1, 0, '/uploads/20241210/392fd333d2629352bfffe16aa98220fe.jpg', '590', '1280', 'jpg', 0, 'photo_3_2024-12-10_00-22-39.jpg', 40371, 'image/jpeg', '', 1733761925, 1733761925, 1733761925, 'local', 'b470ce50e82c828939340aff876ad297a7121cd5'),
(38, '', 1, 0, '/uploads/20241210/2cd7b19ac5e38b8f31032a31852253b3.jpg', '590', '1280', 'jpg', 0, 'photo_4_2024-12-10_00-22-39.jpg', 41993, 'image/jpeg', '', 1733762397, 1733762397, 1733762397, 'local', '5b50841798efc444450b318e35cdefde68caf7c2'),
(39, '', 1, 0, '/uploads/20241210/9d9b719aba53618895d3e70946df8416.jpg', '590', '1280', 'jpg', 0, 'photo_2_2024-12-10_00-22-39.jpg', 41796, 'image/jpeg', '', 1733762452, 1733762452, 1733762452, 'local', 'e574abb30910dd63e349ab671c3e8ccd296ba052'),
(40, '', 1, 0, '/uploads/20241210/433620bf195c26a7208df81359efd56b.jpg', '590', '1280', 'jpg', 0, 'photo_1_2024-12-10_00-22-39.jpg', 41720, 'image/jpeg', '', 1733762486, 1733762486, 1733762486, 'local', 'f8cd1100eb46bfe95e017a7f57e12d14b85df462'),
(41, '', 1, 0, '/uploads/20241210/21714573287877acf4c01f27d181ce9a.jpg', '590', '1280', 'jpg', 0, 'photo_5_2024-12-10_00-22-39.jpg', 41432, 'image/jpeg', '', 1733762524, 1733762524, 1733762524, 'local', '111ddaad58654aaa1f840ad2b7311918487ac0fd'),
(42, '', 1, 0, '/uploads/20241210/3ca2a57351ec914a031c40a7b2158790.jpg', '1103', '1173', 'jpg', 0, 'photo_2024-12-10_00-45-23.jpg', 28209, 'image/jpeg', '', 1733762912, 1733762912, 1733762912, 'local', '35bcd97385c87f12a6c1a6d416b0d047fb87a59c'),
(43, '', 1, 0, '/uploads/20241210/46c05bbde4f7ac3c78249966af22cd00.jpg', '1100', '1154', 'jpg', 0, 'photo_2024-12-10_00-54-14.jpg', 29133, 'image/jpeg', '', 1733763289, 1733763289, 1733763289, 'local', '48e90ed9bfc0dcfb59f316d94fa6c999e645f6bf'),
(44, '', 1, 0, '/uploads/20241210/ed81b7b855967df174ec833eda358b0d.jpg', '1105', '1064', 'jpg', 0, 'photo_2024-12-10_00-58-59.jpg', 37994, 'image/jpeg', '', 1733763557, 1733763557, 1733763557, 'local', 'f841884c9ef6aa015b887d40a7ab2aacd35119c0'),
(45, '', 1, 0, '/uploads/20241210/c157e2e0a6282caee0b699684b8c1adf.jpg', '1070', '1122', 'jpg', 0, 'photo_2024-12-10_01-00-18.jpg', 32325, 'image/jpeg', '', 1733763626, 1733763626, 1733763626, 'local', 'c5e67fd098946f872f1b2cecfbbd96f87f77e138'),
(46, '', 1, 0, '/uploads/20241210/70d33ffbf0a938783b6706e57405c146.jpg', '1075', '1126', 'jpg', 0, 'photo_2024-12-10_01-13-43.jpg', 32898, 'image/jpeg', '', 1733764494, 1733764494, 1733764494, 'local', 'b1feba94ee9fe4c4bed14b4b6cd2711a9a91fd7a'),
(47, '', 1, 0, '/uploads/20241210/368bcf67bdff5214247b7c8fb70ea6ac.jpg', '225', '225', 'jpg', 0, 'photo_2024-12-10_10-48-14.jpg', 9081, 'image/jpeg', '', 1733799059, 1733799059, 1733799059, 'local', 'a4b297d497e2f71336042945b37deb09e8e71393'),
(48, '', 1, 0, '/uploads/20241210/d887a8aa180242ea9374d7117266d265.jpg', '225', '225', 'jpg', 0, 'photo_2024-12-10_10-53-14.jpg', 8661, 'image/jpeg', '', 1733799226, 1733799226, 1733799226, 'local', 'bd6a9c9ce0988c42f6c1deee27b24dd953fa867d'),
(49, '', 1, 0, '/uploads/20241210/95417462a5eef3958e9d764dcba38238.jpg', '1280', '1280', 'jpg', 0, '2ea1080e253c98fe0df86afd9ccfbba4@h_1280.jpg', 299337, 'image/jpeg', '', 1733799415, 1733799415, 1733799415, 'local', '440a5bbed6445bc1874ec253e86fe1da4ad10158'),
(50, '', 1, 0, '/uploads/20241210/20dd216fb71a16d4db783f70c2aacf1a.jpg', '360', '360', 'jpg', 0, '20dd216fb71a16d4db783f70c2aacf1a.jpg', 13251, 'image/jpeg', '', 1733799928, 1733799928, 1733799928, 'local', '0d3f4685dc03d1d11e682713b284d4b88bb89951'),
(51, '', 1, 0, '/uploads/20241210/b8d54662814f8ceb9139d3d9ca64bcc4.webp', '750', '500', 'webp', 0, 'u=3438128934,3259753181&amp;fm=253&amp;fmt=auto&amp;app=138&amp;f=JPEG.webp', 8816, 'image/webp', '', 1733800524, 1733800524, 1733800524, 'local', 'bc912fe071f693987b95ddbc4ddd7d056c1a2a2b'),
(52, '', 1, 0, '/uploads/20241210/c85f2aa8dd1c0d5eb9a0cf3030a2357f.webp', '640', '404', 'webp', 0, '8b13632762d0f703157126d8a4cb26302797c5b6.webp', 14350, 'image/webp', '', 1733800612, 1733800612, 1733800612, 'local', '8eeaebf74853c2b2b67146872c65bc7eeca31ce5'),
(53, '', 1, 0, '/uploads/20241210/b29313750bff26204050594918899fd0.jpeg', '500', '333', 'jpeg', 0, '9cb7b6ddbca14b8ae9ea3c4879375763.jpeg', 10181, 'image/jpeg', '', 1733800735, 1733800735, 1733800735, 'local', '7f23055398ee40f531f892a3b34f26b14fa22d1e'),
(54, '', 1, 0, '/uploads/20241210/3a9d531c259c66e40bfa453f25fc17f3.jpg', '658', '807', 'jpg', 0, '202412081909062716.jpg', 116084, 'image/jpeg', '', 1733800791, 1733800791, 1733800791, 'local', '8c112cfc574dc357253511952521cb3581ce95b5'),
(55, '', 1, 0, '/uploads/20241210/7aa47a4e80f92a680fed8bd7e8cd7757.webp', '800', '500', 'webp', 0, 'u=1451885871,3704463298&amp;fm=253&amp;fmt=auto&amp;app=120&amp;f=JPEG.webp', 23940, 'image/webp', '', 1733801009, 1733801009, 1733801009, 'local', '932baade80497527aade302bd7bb7f6c07a5ba07'),
(56, '', 1, 0, '/uploads/20241210/96c52a81029dc27b88719959f010761a.webp', '607', '383', 'webp', 0, 'u=2761816594,3666711886&amp;fm=253&amp;fmt=auto&amp;app=138&amp;f=JPEG.webp', 7538, 'image/webp', '', 1733801243, 1733801243, 1733801243, 'local', '78c44d27cf85f94f75966ce81a894f15521fa76d'),
(57, '', 1, 0, '/uploads/20241210/874f4072fdaea8c7b134e3219ad4fa80.webp', '600', '600', 'webp', 0, 'u=750733211,1072447791&amp;fm=253&amp;fmt=auto&amp;app=120&amp;f=JPEG.webp', 5626, 'image/webp', '', 1733801534, 1733801534, 1733801534, 'local', '62e4429c4ae97d41a9b1f49ee94c60996a1fe133'),
(58, '', 1, 0, '/uploads/20241211/3857a6dce9bc7288ecbe4c97b642ad89.jpg', '994', '847', 'jpg', 0, 'photo_2024-12-10_23-56-14.jpg', 37169, 'image/jpeg', '', 1733846422, 1733846422, 1733846422, 'local', 'b44b6caf5475e3a60af619f16767f89cf3067c63'),
(59, '', 1, 0, '/uploads/20241211/b4cb285f87292796c46e7ec11485b713.jpg', '188', '169', 'jpg', 0, 'photo_2024-12-11_00-10-49.jpg', 7633, 'image/jpeg', '', 1733847089, 1733847089, 1733847089, 'local', '972f9b6a0f7d9380ef1b936a3b87107a639b4a6d'),
(60, '', 1, 0, '/uploads/20241211/3af2bf75aa9da0741cb82c8e17a5e350.jpg', '1035', '1280', 'jpg', 0, 'photo_2024-12-11_00-28-54.jpg', 134844, 'image/jpeg', '', 1733848217, 1733848217, 1733848217, 'local', '60d4dd557b6fd4f91bf4409609fcd614992e8ffb'),
(61, '', 1, 0, '/uploads/20241211/80f40ffaa9cb92f47ec6c2efcb9c7c94.jpg', '1280', '738', 'jpg', 0, 'photo_2024-12-11_00-26-13.jpg', 145290, 'image/jpeg', '', 1733848310, 1733848310, 1733848310, 'local', '04156fbd7fb71e0967094fbb1fcebe06b66cdc94'),
(62, '', 1, 0, '/uploads/20241211/2efcbd0467ea97030a37ad89a0c40871.jpg', '827', '1001', 'jpg', 0, 'photo_2024-12-11_00-26-17.jpg', 79366, 'image/jpeg', '', 1733848345, 1733848345, 1733848345, 'local', '613e46142281877bdf87ef5e46f3d9204f06f0cf'),
(63, '', 1, 0, '/uploads/20241211/ff883a68b647e574132420d59251dafe.jpg', '1280', '594', 'jpg', 0, 'photo_2024-12-11_00-31-05.jpg', 178432, 'image/jpeg', '', 1733848394, 1733848394, 1733848394, 'local', '6d8ea6c61b925601636c597ba3001275e83f4349'),
(64, '', 1, 0, '/uploads/20241211/500f8989c6a83f764c1646067684346c.jpg', '1124', '784', 'jpg', 0, 'photo_2024-12-11_00-28-59.jpg', 89469, 'image/jpeg', '', 1733848457, 1733848457, 1733848457, 'local', '7606188314e8a7eeef653b6e59e8fbd1dfc06df9'),
(65, '', 1, 0, '/uploads/20241211/2cb0704e6b380661c23e16d98ee30a74.png', '430', '321', 'png', 0, 'image.png', 13669, 'image/png', '', 1733848688, 1733848688, 1733848688, 'local', '546aa4c0140e0ef97b0164729c40cf4ea8c17cd4'),
(66, '', 1, 0, '/uploads/20241211/4d27a6aa12e57ec24e3e688bdf23d813.jpg', '586', '586', 'jpg', 0, 'photo_2024-12-11_00-41-22.jpg', 198212, 'image/jpeg', '', 1733848914, 1733848914, 1733848914, 'local', '375e71eb8b64224bf49199d17610ccc051e11fdb'),
(67, '', 1, 0, '/uploads/20241211/5e27f40b1589660098a75cd7ec316619.jpg', '590', '1280', 'jpg', 0, 'photo_2024-12-11_00-51-03.jpg', 77813, 'image/jpeg', '', 1733849511, 1733849511, 1733849510, 'local', '0b8129856bbad0eb411a0079aa8d1bb7e7ff5cbb'),
(68, '', 1, 0, '/uploads/20241211/5982cfbc107b8b70c61d43868096daf5.webp', '889', '500', 'webp', 0, '1.webp', 25034, 'image/webp', '', 1733850056, 1733850056, 1733850056, 'local', '08244d9a3fbbaf7ca76acb45bbe07f6ef19da40c'),
(69, '', 1, 0, '/uploads/20241211/d04e0d9f953b640086ceb9b02adc3726.png', '30', '30', 'png', 0, 'favicon.png', 1307, 'image/png', '', 1733850102, 1733850102, 1733850102, 'local', 'c01ad21204ba8043e212329b48c7a746d2ba18ed'),
(70, '', 1, 0, '/uploads/20241211/1eaba7882faf620e144b43a300773b98.jpg', '256', '256', 'jpg', 0, '1eaba7882faf620e144b43a300773b98.jpg', 13766, 'image/jpeg', '', 1733850238, 1733850238, 1733850238, 'local', '36293ba4fc5f634c703cc2fe499f43442b13d128'),
(71, '', 1, 0, '/uploads/20241211/b15e989bcfa72aec9d3bf5b430fd8b5e.jpg', '701', '500', 'jpg', 0, 'b15e989bcfa72aec9d3bf5b430fd8b5e.jpg', 22334, 'image/jpeg', '', 1733860355, 1733860355, 1733860355, 'local', '79a18e3d5a20c11adb3a2ea8943ef66bc882504e'),
(72, '', 1, 0, '/uploads/20241211/0da36d421e7ff13496c96b58369da46a.jpg', '820', '820', 'jpg', 0, 'photo_2024-12-11_04-10-24.jpg', 151387, 'image/jpeg', '', 1733861434, 1733861434, 1733861434, 'local', '268b961050b77ab513a31ebc85047b7a48889ca1'),
(73, '', 1, 0, '/uploads/20241213/69f055ac9d6cd319742db1819fdccf2a.jpeg', '284', '329', 'jpeg', 0, '69f055ac9d6cd319742db1819fdccf2a.jpeg', 33269, 'image/jpeg', '', 1734067802, 1734067802, 1734067802, 'local', '6dcd852a5e1eee46fcff65456c49c53a81b34f16'),
(74, '', 1, 0, '/uploads/20241213/815fe12b63094a084f8ee0a51159d42b.jpg', '259', '212', 'jpg', 0, '202412081804218430.jpg', 4268, 'image/jpeg', '', 1734067940, 1734067940, 1734067940, 'local', 'b799ab2797001a86d292641f1982ef5267ef8597'),
(75, '', 1, 0, '/uploads/20241213/f6ce06b302a7929bbacff53e43957fc7.png', '512', '512', 'png', 0, 'f6ce06b302a7929bbacff53e43957fc7.png', 238215, 'image/png', '', 1734068087, 1734068087, 1734068087, 'local', '20683f9ebbf48ef02b21a7e4f5f9d9ae122cf104'),
(76, '', 1, 0, '/uploads/20241213/c73c4fa19c02f10e79c2523c0fb192c6.png', '512', '512', 'png', 0, 'c73c4fa19c02f10e79c2523c0fb192c6.png', 28605, 'image/png', '', 1734068250, 1734068250, 1734068250, 'local', '9aa2f7738cdae16b5e1a4003edcf60bc3673176d'),
(77, '', 1, 0, '/uploads/20241213/5504afb9a114ea90ec1274076c38de3f.png', '1024', '1024', 'png', 0, '5504afb9a114ea90ec1274076c38de3f.png', 41668, 'image/png', '', 1734068379, 1734068379, 1734068379, 'local', '5656cfaf13fc4acfd500c1fbed54560f8e211611'),
(78, '', 1, 0, '/uploads/20241213/7027d7054de006dad4789093a2547328.png', '130', '130', 'png', 0, '7027d7054de006dad4789093a2547328.png', 5606, 'image/png', '', 1734068614, 1734068614, 1734068614, 'local', '32dcbe32b4d01868513a19b056a6b7db216b97d1'),
(79, '', 1, 0, '/uploads/20241213/06f56f03a1c13e60dac558945e88cfbb.png', '512', '512', 'png', 0, '06f56f03a1c13e60dac558945e88cfbb.png', 29231, 'image/png', '', 1734068684, 1734068684, 1734068684, 'local', 'c6ca5b1c98dd08edc14499362b00182a2338d793'),
(80, '', 1, 0, '/uploads/20241213/2e10549fc1d5d3841e318780961c56a7.jpg', '225', '225', 'jpg', 0, '2e10549fc1d5d3841e318780961c56a7.jpg', 8313, 'image/jpeg', '', 1734068759, 1734068759, 1734068758, 'local', '11d0bc5548d2438349890808620d1d80269a2032'),
(81, '', 1, 0, '/uploads/20241213/1101434e51651756f4b394385937c2c7.jpg', '225', '225', 'jpg', 0, '1101434e51651756f4b394385937c2c7.jpg', 11736, 'image/jpeg', '', 1734068838, 1734068838, 1734068838, 'local', '589ea58533afec9087db69d5cd6d8afa037772e3'),
(82, '', 1, 0, '/uploads/20241213/1cc31c7200c5579028b11fda943be7e7.jpg', '225', '225', 'jpg', 0, '1cc31c7200c5579028b11fda943be7e7.jpg', 7776, 'image/jpeg', '', 1734068949, 1734068949, 1734068949, 'local', '7515f6751292b8d03201b35c64210f3c5a96b7d5'),
(83, '', 1, 0, '/uploads/20241213/0224cf5c8fd1c7a9ccb42592cd12c6da.jpg', '225', '225', 'jpg', 0, '0224cf5c8fd1c7a9ccb42592cd12c6da.jpg', 4326, 'image/jpeg', '', 1734069076, 1734069076, 1734069076, 'local', 'd99e5948e9fa96252d1916c92cf23c1a90ea2ea3'),
(84, '', 1, 0, '/uploads/20241213/b055144918cfd094b2813ec7ebf65a97.png', '225', '225', 'png', 0, 'b055144918cfd094b2813ec7ebf65a97.png', 6341, 'image/png', '', 1734069151, 1734069151, 1734069151, 'local', 'adab1b43ac332148e0413df8d6bda822df0de10c'),
(85, '', 1, 0, '/uploads/20241213/f0cb36a31cbc5a40ff81e5a6df306352.png', '282', '282', 'png', 0, 'f0cb36a31cbc5a40ff81e5a6df306352.png', 44609, 'image/png', '', 1734069235, 1734069235, 1734069235, 'local', 'eda4c43903dc62729437e6c21ad66a60f3715c54'),
(86, '', 1, 0, '/uploads/20241213/e9a2faa4a4c6dd45d7b09c0764542022.jpg', '225', '225', 'jpg', 0, 'e9a2faa4a4c6dd45d7b09c0764542022.jpg', 7888, 'image/jpeg', '', 1734069546, 1734069546, 1734069546, 'local', '6ac6f6d02150a43429326e8dd79f0199dd7b15df'),
(87, '', 1, 0, '/uploads/20241213/78dac5a840c2f7cc2b4566148f62620c.jpg', '225', '225', 'jpg', 0, '78dac5a840c2f7cc2b4566148f62620c.jpg', 5864, 'image/jpeg', '', 1734069595, 1734069595, 1734069595, 'local', 'fbe44d9e396de9fa26c17b328a783adb159098c5'),
(88, '', 1, 0, '/uploads/20241213/f119ea12ba7ce18add5c426f8940e785.jpg', '225', '225', 'jpg', 0, 'f119ea12ba7ce18add5c426f8940e785.jpg', 6482, 'image/jpeg', '', 1734069639, 1734069639, 1734069639, 'local', '998bf9658d857cf5e9dd9fc48aafc1b84cba0a2c'),
(89, '', 1, 0, '/uploads/20241213/80b8a3ea4599602758992cef77aed3b5.png', '225', '225', 'png', 0, '80b8a3ea4599602758992cef77aed3b5.png', 4341, 'image/png', '', 1734069680, 1734069680, 1734069680, 'local', '27c20e3f3d23c3d14bf02e862418237fa4157813'),
(90, '', 1, 0, '/uploads/20241213/18b3e6da143dabc37d903cbedf916634.png', '1024', '1024', 'png', 0, '18b3e6da143dabc37d903cbedf916634.png', 214791, 'image/png', '', 1734069728, 1734069728, 1734069728, 'local', 'ffde90359d5b4a6e06bb1ed7a01fe29e2c549b20'),
(91, '', 1, 0, '/uploads/20241213/b037189b688f20e159da635f197029ac.png', '400', '400', 'png', 0, 'b037189b688f20e159da635f197029ac.png', 160339, 'image/png', '', 1734069827, 1734069827, 1734069827, 'local', '8cc588b9e919ad22c4c5064d4ecf3246cea9ae0b'),
(92, '', 1, 0, '/uploads/20241213/b5008fb18d055d64165111ac3abff5bd.webp', '640', '492', 'webp', 0, 'u=3638508205,1969775306&amp;fm=253&amp;fmt=auto&amp;app=138&amp;f=JPEG.webp', 3120, 'image/webp', '', 1734070217, 1734070217, 1734070217, 'local', '4e62d8e10c2575295b17926725a497c0064d17a2'),
(93, '', 1, 0, '/uploads/20241213/0ae62fc347e8f9b612b220bc96085df5.png', '900', '900', 'png', 0, '0ae62fc347e8f9b612b220bc96085df5.png', 241344, 'image/png', '', 1734070361, 1734070361, 1734070361, 'local', '6095e84ea2afbe35037c27a1b147c6cf7cd4ed55'),
(94, '', 1, 0, '/uploads/20241213/b9390ac16c1068d23a963be31120887c.jpg', '1109', '652', 'jpg', 0, 'photo_2024-12-09_23-27-03.jpg', 40381, 'image/jpeg', '', 1734070609, 1734070609, 1734070609, 'local', '2ad9cce96c36265921ebcd0b1b04a48649f71989'),
(95, '', 1, 0, '/uploads/20241213/b7d28d27852dfa5d97cea78019993335.png', '225', '225', 'png', 0, 'b7d28d27852dfa5d97cea78019993335.png', 6362, 'image/png', '', 1734070934, 1734070934, 1734070934, 'local', '613acd6d26acf5e54b2cb48d2692402869407146'),
(96, '', 1, 0, '/uploads/20241213/b7ff34d240ecb3acde5804995da91cfc.png', '256', '256', 'png', 0, 'b7ff34d240ecb3acde5804995da91cfc.png', 11266, 'image/png', '', 1734071121, 1734071121, 1734071121, 'local', '9898d96f97755a3459e6eaeb7978095d9d90cef7'),
(97, '', 1, 0, '/uploads/20241213/6f5189c10f15d7b05f668a2ab406fbdc.png', '225', '225', 'png', 0, '6f5189c10f15d7b05f668a2ab406fbdc.png', 81002, 'image/png', '', 1734071342, 1734071342, 1734071342, 'local', '9c469730a1becdcd9579e73b1c216cbdfcd17238'),
(98, '', 1, 0, '/uploads/20241213/6412ae290ee318312f59942da1405949.webp', '240', '240', 'webp', 0, '4-tiktok.webp', 5700, 'image/webp', '', 1734071563, 1734071563, 1734071563, 'local', 'a42a7427c0c9845cfe5629449599ace7e879a802'),
(99, '', 1, 0, '/uploads/20241213/8f4c0a5823f65f0c59940a77cfe0a8c4.png', '512', '512', 'png', 0, '8f4c0a5823f65f0c59940a77cfe0a8c4.png', 75992, 'image/png', '', 1734072122, 1734072122, 1734072122, 'local', 'd90fbc65020d92f1f6ac11b8e9a1b85d9ce0b5a5'),
(100, '', 1, 0, '/uploads/20241213/1684cf201f2a024b39a299108ce46d1f.png', '512', '512', 'png', 0, '1684cf201f2a024b39a299108ce46d1f.png', 270917, 'image/png', '', 1734072368, 1734072368, 1734072368, 'local', 'f29ac615fc706b441f8fc25cd3f2be71c9e15cd9'),
(101, '', 1, 0, '/uploads/20241213/368bcf67bdff5214247b7c8fb70ea6ac.jpg', '225', '225', 'jpg', 0, 'photo_2024-12-10_10-48-14.jpg', 9081, 'image/jpeg', '', 1734072597, 1734072597, 1734072597, 'local', 'a4b297d497e2f71336042945b37deb09e8e71393'),
(102, '', 1, 0, '/uploads/20241213/848e9dc80417b06d06e10a3e81fbb6eb.png', '1024', '1024', 'png', 0, '848e9dc80417b06d06e10a3e81fbb6eb.png', 100379, 'image/png', '', 1734073240, 1734073240, 1734073240, 'local', 'b7ee456f14a1a7f6ea7cef486b52bd6a1a521aad'),
(103, '', 1, 0, '/uploads/20241213/6d591b7de375d7a8190fe71a1d5d0a70.png', '1024', '1024', 'png', 0, '6d591b7de375d7a8190fe71a1d5d0a70.png', 259955, 'image/png', '', 1734073297, 1734073297, 1734073297, 'local', 'd43b3508dbd75710f3473f697ea8122c9d6a0061'),
(104, '', 1, 0, '/uploads/20241213/3ca2a57351ec914a031c40a7b2158790.jpg', '1103', '1173', 'jpg', 0, 'photo_2024-12-10_00-45-23.jpg', 28209, 'image/jpeg', '', 1734073419, 1734073419, 1734073419, 'local', '35bcd97385c87f12a6c1a6d416b0d047fb87a59c'),
(105, '', 1, 0, '/uploads/20241213/47da4ea8fdd1e06f3a7832294d6a113c.png', '1024', '768', 'png', 0, '47da4ea8fdd1e06f3a7832294d6a113c.png', 102849, 'image/png', '', 1734073643, 1734073643, 1734073643, 'local', '02824773b37d7e78946ccf93ff6ba2df9da67f14'),
(106, '', 1, 0, '/uploads/20241213/197940c387a44de95a0f30dd3894643f.png', '512', '512', 'png', 0, '197940c387a44de95a0f30dd3894643f.png', 88019, 'image/png', '', 1734073864, 1734073864, 1734073864, 'local', '5d4a2be0206a110b69223139092d56edacf24bf3'),
(107, '', 1, 0, '/uploads/20241213/4ed847006da598747172c07fc41348d3.png', '512', '512', 'png', 0, '4ed847006da598747172c07fc41348d3.png', 47908, 'image/png', '', 1734073925, 1734073925, 1734073925, 'local', 'f84985384391f89586a87698274846a4f21a7444'),
(108, '', 1, 0, '/uploads/20241213/b042a36a4e073fa1e5337b4a79fbea5e.png', '512', '512', 'png', 0, 'b042a36a4e073fa1e5337b4a79fbea5e.png', 104300, 'image/png', '', 1734074090, 1734074090, 1734074090, 'local', '820ace4e51924d94e0af89a919f166a04e058f59'),
(109, '', 1, 0, '/uploads/20241213/d294791bd89acb0daffe3b382e97abe9.png', '512', '512', 'png', 0, 'd294791bd89acb0daffe3b382e97abe9.png', 76634, 'image/png', '', 1734074175, 1734074175, 1734074174, 'local', '55c0865693a601725225e2e4c4fcdc389b9d11d4'),
(110, '', 1, 0, '/uploads/20241213/dd24e61c9ecedfc8b1dad6989359a6a1.png', '512', '512', 'png', 0, 'dd24e61c9ecedfc8b1dad6989359a6a1.png', 69587, 'image/png', '', 1734074293, 1734074293, 1734074293, 'local', '6d4e658ed7c17a3b9a02982fae8b02f9e713311a'),
(111, '', 1, 0, '/uploads/20241213/fd50699e98849ef6a6d6cb1fa8e4a805.png', '512', '512', 'png', 0, 'fd50699e98849ef6a6d6cb1fa8e4a805.png', 334306, 'image/png', '', 1734074457, 1734074457, 1734074457, 'local', '00e7ba9af02ab6c3a3bdc75a2b5dc1145b268d21'),
(112, '', 1, 0, '/uploads/20241213/0ffac70e1434b46a534ce54e5afbe68a.png', '225', '225', 'png', 0, 'weixin.png', 3170, 'image/png', '', 1734074848, 1734074848, 1734074848, 'local', '48c778dcefe5a34f1890579fd03c2d48da52f75d'),
(113, '', 1, 0, '/uploads/20241213/a11ab484d99775d4a946b050fbb1baf1.png', '1999', '1124', 'png', 0, 'a11ab484d99775d4a946b050fbb1baf1.png', 200561, 'image/png', '', 1734077903, 1734077903, 1734077903, 'local', '670bfb3f976d17aaa5193e139f47a1bac47709de'),
(114, '', 1, 0, '/uploads/20241213/2f9c51f36c18d71846a6bd784a609588.png', '272', '185', 'png', 0, '2f9c51f36c18d71846a6bd784a609588.png', 35051, 'image/png', '', 1734078456, 1734078456, 1734078456, 'local', '73c74c71c8ae04549021715b051fcf3f6e067145'),
(115, '', 1, 0, '/uploads/20241213/3db2c1c1bde1c468ecb5e6d39cea96d2.png', '512', '512', 'png', 0, '3db2c1c1bde1c468ecb5e6d39cea96d2.png', 68168, 'image/png', '', 1734079187, 1734079187, 1734079187, 'local', '2e9dbc3c9f569f87126219795bafa77987673738'),
(116, '', 1, 0, '/uploads/20241213/054828adaa504728a747984be687c5fa.png', '350', '350', 'png', 0, '054828adaa504728a747984be687c5fa.png', 179394, 'image/png', '', 1734079263, 1734079263, 1734079263, 'local', '1a6b7388871db91c14199325580fb1cc6be40ebc'),
(117, '', 1, 0, '/uploads/20241213/2cc909e91f18f5338a1bc83144795323.png', '512', '512', 'png', 0, '2cc909e91f18f5338a1bc83144795323.png', 77015, 'image/png', '', 1734079432, 1734079432, 1734079432, 'local', '6d2dfe5d3c10fa0ee7cb3e00cafa2d8948cff6f5'),
(118, '', 1, 0, '/uploads/20241213/2547e4d226ecb95ff0a8437d39928674.png', '512', '512', 'png', 0, '2547e4d226ecb95ff0a8437d39928674.png', 96256, 'image/png', '', 1734079525, 1734079525, 1734079525, 'local', '994c8e1e3dc5f5ae0cb9bae47c75fedfc844cf2c'),
(119, '', 1, 0, '/uploads/20241213/cd57e80089f2c91da12fd33f3243f75d.jpg', '2040', '1278', 'jpg', 0, 'cd57e80089f2c91da12fd33f3243f75d.jpg', 197202, 'image/jpeg', '', 1734079951, 1734079951, 1734079951, 'local', '8d5973a55f529d42c97a15210e43bffc9a1f4f84'),
(120, '', 1, 0, '/uploads/20241213/9f86ae6ec1618d3e90b1acd3568a58ad.png', '512', '512', 'png', 0, '9f86ae6ec1618d3e90b1acd3568a58ad.png', 4740, 'image/png', '', 1734080359, 1734080359, 1734080359, 'local', '9f9dbbd2c9ad307ac58c5c865eabf0105bb27835'),
(121, '', 1, 0, '/uploads/20241213/75be1ad11ea75113c5c6980b81f9781e.png', '225', '225', 'png', 0, '75be1ad11ea75113c5c6980b81f9781e.png', 3273, 'image/png', '', 1734080454, 1734080454, 1734080454, 'local', '5cb9b0599952c05876527bbf8f7406bf59358da5'),
(122, '', 1, 0, '/uploads/20241213/a2ce0f6d5e7279209b00de77386348d3.jpg', '225', '225', 'jpg', 0, 'a2ce0f6d5e7279209b00de77386348d3.jpg', 7194, 'image/jpeg', '', 1734080574, 1734080574, 1734080574, 'local', '3e378f9f4c9e35525a2ac6bb1e4da204dff1b767'),
(123, '', 1, 0, '/uploads/20241213/80cc05eb94de3e60d2b4a4454a5edfd8.png', '436', '436', 'png', 0, '80cc05eb94de3e60d2b4a4454a5edfd8.png', 42360, 'image/png', '', 1734080735, 1734080735, 1734080735, 'local', '40a5b0941d697a449e139fbc5e08f1d335cc6ff6'),
(124, '', 1, 0, '/uploads/20241213/8b9986ae565bc5c95ff1ce426b60ae9a.png', '750', '750', 'png', 0, '8b9986ae565bc5c95ff1ce426b60ae9a.png', 24376, 'image/png', '', 1734080789, 1734080789, 1734080789, 'local', '1de13220bc9277541dd4eff2309cd3b8fd3bd8e3'),
(125, '', 1, 0, '/uploads/20241213/d0a960a264669197e22b595af730887c.webp', '240', '240', 'webp', 0, '1-telegram.webp', 13270, 'image/webp', '', 1734080985, 1734080985, 1734080985, 'local', '1bae76a029823a47fa43a157117d5530a9018a39'),
(126, '', 1, 0, '/uploads/20241213/98874d212327c5097166dce713d831bd.jpg', '481', '238', 'jpg', 0, 'photo_2024-12-13_17-14-06.jpg', 10420, 'image/jpeg', '', 1734081350, 1734081350, 1734081350, 'local', '52312bbd0e94e0a986789a2538ba32788de4a9a1'),
(127, '', 1, 0, '/uploads/20241214/f6764afdceaa9aa31c64e0498abfade2.jpg', '1050', '656', 'jpg', 0, 'photo_2024-12-14_00-01-00.jpg', 32883, 'image/jpeg', '', 1734105710, 1734105710, 1734105709, 'local', 'ff5312db6bafad6c071f0ffb1e28092e4cfe1c1c'),
(128, '', 1, 0, '/uploads/20241214/7d9c1813ee1001956b36dab5641964b6.jpg', '456', '211', 'jpg', 0, 'photo_2024-12-14_17-15-59.jpg', 4319, 'image/jpeg', '', 1734175231, 1734175231, 1734175231, 'local', 'b6c275f81c17ac2716f9afc16485da8dc43295ac'),
(129, '', 1, 0, '/uploads/20241216/b15e989bcfa72aec9d3bf5b430fd8b5e.jpg', '701', '500', 'jpg', 0, 'b15e989bcfa72aec9d3bf5b430fd8b5e.jpg', 22334, 'image/jpeg', '', 1734344000, 1734344000, 1734344000, 'local', '79a18e3d5a20c11adb3a2ea8943ef66bc882504e'),
(130, '', 1, 0, '/uploads/20241217/8f1e2baedaf720e6c9d947913972136a.jpg', '618', '505', 'jpg', 0, 'photo_2024-12-17_02-23-33.jpg', 68251, 'image/jpeg', '', 1734373440, 1734373440, 1734373440, 'local', '1bcfffb9623ecd71c5b1142e7ea7741642c3fd88'),
(131, '', 1, 0, '/uploads/20241217/9d23e3fecbc663774ff9faa5d0c72cbe.jpg', '801', '941', 'jpg', 0, 'photo_2024-12-17_13-15-07.jpg', 116304, 'image/jpeg', '', 1734412633, 1734412633, 1734412633, 'local', 'f1759dc46eda0924a96385fca03e6487f42ab2ba'),
(132, '', 1, 0, '/uploads/20241217/e85a6cc3431b44c12ca168d7375db0d6.jpg', '540', '360', 'jpg', 0, 'photo_2024-12-17_15-42-18.jpg', 16945, 'image/jpeg', '', 1734421436, 1734421436, 1734421436, 'local', '227771c31e5e0b4d757cce9aabe6b9b3b89fcff6'),
(133, '', 1, 0, '/uploads/20241217/5982cfbc107b8b70c61d43868096daf5.webp', '889', '500', 'webp', 0, '1.webp', 25034, 'image/webp', '', 1734450834, 1734450834, 1734450834, 'local', '08244d9a3fbbaf7ca76acb45bbe07f6ef19da40c'),
(134, '', 1, 0, '/uploads/20250104/6412ae290ee318312f59942da1405949.webp', '240', '240', 'webp', 0, '4-tiktok.webp', 5700, 'image/webp', '', 1735965508, 1735965508, 1735965508, 'local', 'a42a7427c0c9845cfe5629449599ace7e879a802'),
(135, '', 1, 0, '/uploads/20250104/26d646a0858ac21a3c2f7f17dc9e15b6.jpg', '256', '244', 'jpg', 0, 'photo_2025-01-04_17-33-24.jpg', 6496, 'image/jpeg', '', 1735983228, 1735983228, 1735983228, 'local', '91e5dfa5dba98f39620e8854c1f557b33006d158'),
(136, '', 1, 0, '/uploads/20250306/5cdbea9a11fb2754d6705a803eff1790.png', '2000', '2000', 'png', 0, 'floki-inu-floki-logo.png', 177980, 'image/png', '', 1741201353, 1741201353, 1741201353, 'local', '3806e1c5a9715b54e93964284eb8341d936fda16');

-- --------------------------------------------------------

--
-- 表的结构 `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(10) UNSIGNED NOT NULL,
  `pid` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '父组别',
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '组名',
  `rules` text COLLATE utf8_unicode_ci NOT NULL COMMENT '规则ID',
  `createtime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `updatetime` bigint(20) DEFAULT NULL COMMENT '更新时间',
  `status` varchar(30) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '状态'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='分组表' ROW_FORMAT=COMPACT;

--
-- 转存表中的数据 `auth_group`
--

INSERT INTO `auth_group` (`id`, `pid`, `name`, `rules`, `createtime`, `updatetime`, `status`) VALUES
(1, 0, 'Admin group', '*', 1491635035, 1491635035, 'normal'),
(2, 1, 'Second group', '13,14,16,15,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,40,41,42,43,44,45,46,47,48,49,50,55,56,57,58,59,60,61,62,63,64,65,1,9,10,11,7,6,8,2,4,5', 1491635035, 1491635035, 'normal'),
(3, 2, 'Third group', '1,4,9,10,11,13,14,15,16,17,40,41,42,43,44,45,46,47,48,49,50,55,56,57,58,59,60,61,62,63,64,65,5', 1491635035, 1491635035, 'normal'),
(4, 1, 'Second group 2', '1,4,13,14,15,16,17,55,56,57,58,59,60,61,62,63,64,65', 1491635035, 1491635035, 'normal'),
(5, 2, 'Third group 2', '1,2,6,7,8,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34', 1491635035, 1491635035, 'normal');

-- --------------------------------------------------------

--
-- 表的结构 `auth_group_access`
--

CREATE TABLE `auth_group_access` (
  `uid` int(10) UNSIGNED NOT NULL COMMENT '会员ID',
  `group_id` int(10) UNSIGNED NOT NULL COMMENT '级别ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='权限分组表' ROW_FORMAT=COMPACT;

--
-- 转存表中的数据 `auth_group_access`
--

INSERT INTO `auth_group_access` (`uid`, `group_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `auth_rule`
--

CREATE TABLE `auth_rule` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` enum('menu','file') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'file' COMMENT 'menu为菜单,file为权限节点',
  `pid` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '父ID',
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '规则名称',
  `title` varchar(50) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '规则名称',
  `icon` varchar(50) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '图标',
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '规则URL',
  `condition` varchar(255) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '条件',
  `remark` varchar(255) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '备注',
  `ismenu` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否为菜单',
  `menutype` enum('addtabs','blank','dialog','ajax') COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '菜单类型',
  `extend` varchar(255) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '扩展属性',
  `py` varchar(30) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '拼音首字母',
  `pinyin` varchar(100) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '拼音',
  `createtime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `updatetime` bigint(20) DEFAULT NULL COMMENT '更新时间',
  `weigh` int(11) NOT NULL DEFAULT '0' COMMENT '权重',
  `status` varchar(30) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '状态'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='节点表' ROW_FORMAT=COMPACT;

--
-- 转存表中的数据 `auth_rule`
--

INSERT INTO `auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES
(1, 'file', 0, 'dashboard', 'Dashboard', 'fa fa-dashboard', '', '', 'Dashboard tips', 1, NULL, '', 'kzt', 'kongzhitai', 1491635035, 1491635035, 143, 'normal'),
(3, 'file', 92, 'category', '分类管理', 'fa fa-leaf', '', '', '分类类型请在常规管理->系统配置->字典配置中添加', 1, 'addtabs', '', 'flgl', 'fenleiguanli', 1491635035, 1678966363, 119, 'normal'),
(4, 'file', 0, 'addon', '插件管理', 'fa fa-rocket', '', '', '可在线安装、卸载、禁用、启用、配置、升级插件，插件升级前请做好备份。', 1, 'addtabs', '', 'cjgl', 'chajianguanli', 1491635035, 1680888144, 0, 'hidden'),
(6, 'file', 92, 'general/config', '系统配置', 'fa fa-cog', '', '', '可以在此增改系统的变量和分组,也可以自定义分组和变量', 1, 'addtabs', '', 'xtpz', 'xitongpeizhi', 1491635035, 1678966495, 60, 'normal'),
(7, 'file', 91, 'general/attachment', '附件管理', 'fa fa-file-image-o', '', '', '主要用于管理上传到服务器或第三方存储的数据', 1, 'addtabs', '', 'fjgl', 'fujianguanli', 1491635035, 1678966488, 34, 'normal'),
(8, 'file', 91, 'general/profile', '个人资料', 'fa fa-user', '', '', '', 1, 'addtabs', '', 'grzl', 'gerenziliao', 1491635035, 1678966337, 53, 'normal'),
(9, 'file', 93, 'auth/admin', '管理员', 'fa fa-user', '', '', '一个管理员可以有多个角色组,左侧的菜单根据管理员所拥有的权限进行生成', 1, 'addtabs', '', 'gly', 'guanliyuan', 1491635035, 1678966874, 113, 'normal'),
(10, 'file', 93, 'auth/adminlog', '操作日志', 'fa fa-list-alt', '', '', '管理员可以查看自己所拥有的权限的管理员日志', 1, 'addtabs', '', 'czrz', 'caozuorizhi', 1491635035, 1678966886, 0, 'normal'),
(11, 'file', 93, 'auth/group', '权限组', 'fa fa-group', '', '', '角色组可以有多个,角色有上下级层级关系,如果子角色有角色组和管理员的权限则可以派生属于自己组别的下级角色组或管理员', 1, 'addtabs', '', 'qxz', 'quanxianzu', 1491635035, 1678966870, 109, 'normal'),
(12, 'file', 92, 'auth/rule', '菜单规则', 'fa fa-bars', '', '', '菜单规则通常对应一个控制器的方法,同时菜单栏数据也从规则中获取', 1, 'addtabs', '', 'cdgz', 'caidanguize', 1491635035, 1678966291, 104, 'normal'),
(13, 'file', 1, 'dashboard/index', 'View', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 136, 'normal'),
(14, 'file', 1, 'dashboard/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 135, 'normal'),
(15, 'file', 1, 'dashboard/del', 'Delete', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 133, 'normal'),
(16, 'file', 1, 'dashboard/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 134, 'normal'),
(17, 'file', 1, 'dashboard/multi', 'Multi', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 132, 'normal'),
(18, 'file', 6, 'general/config/index', 'View', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 52, 'normal'),
(19, 'file', 6, 'general/config/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 51, 'normal'),
(20, 'file', 6, 'general/config/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 50, 'normal'),
(21, 'file', 6, 'general/config/del', 'Delete', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 49, 'normal'),
(22, 'file', 6, 'general/config/multi', 'Multi', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 48, 'normal'),
(23, 'file', 7, 'general/attachment/index', 'View', 'fa fa-circle-o', '', '', 'Attachment tips', 0, NULL, '', '', '', 1491635035, 1491635035, 59, 'normal'),
(24, 'file', 7, 'general/attachment/select', 'Select attachment', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 58, 'normal'),
(25, 'file', 7, 'general/attachment/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 57, 'normal'),
(26, 'file', 7, 'general/attachment/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 56, 'normal'),
(27, 'file', 7, 'general/attachment/del', 'Delete', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 55, 'normal'),
(28, 'file', 7, 'general/attachment/multi', 'Multi', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 54, 'normal'),
(29, 'file', 8, 'general/profile/index', 'View', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 33, 'normal'),
(30, 'file', 8, 'general/profile/update', 'Update profile', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 32, 'normal'),
(31, 'file', 8, 'general/profile/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 31, 'normal'),
(32, 'file', 8, 'general/profile/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 30, 'normal'),
(33, 'file', 8, 'general/profile/del', 'Delete', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 29, 'normal'),
(34, 'file', 8, 'general/profile/multi', 'Multi', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 28, 'normal'),
(35, 'file', 3, 'category/index', 'View', 'fa fa-circle-o', '', '', 'Category tips', 0, NULL, '', '', '', 1491635035, 1491635035, 142, 'normal'),
(36, 'file', 3, 'category/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 141, 'normal'),
(37, 'file', 3, 'category/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 140, 'normal'),
(38, 'file', 3, 'category/del', 'Delete', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 139, 'normal'),
(39, 'file', 3, 'category/multi', 'Multi', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 138, 'normal'),
(40, 'file', 9, 'auth/admin/index', 'View', 'fa fa-circle-o', '', '', 'Admin tips', 0, NULL, '', '', '', 1491635035, 1491635035, 117, 'normal'),
(41, 'file', 9, 'auth/admin/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 116, 'normal'),
(42, 'file', 9, 'auth/admin/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 115, 'normal'),
(43, 'file', 9, 'auth/admin/del', 'Delete', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 114, 'normal'),
(44, 'file', 10, 'auth/adminlog/index', 'View', 'fa fa-circle-o', '', '', 'Admin log tips', 0, NULL, '', '', '', 1491635035, 1491635035, 112, 'normal'),
(45, 'file', 10, 'auth/adminlog/detail', 'Detail', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 111, 'normal'),
(46, 'file', 10, 'auth/adminlog/del', 'Delete', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 110, 'normal'),
(47, 'file', 11, 'auth/group/index', 'View', 'fa fa-circle-o', '', '', 'Group tips', 0, NULL, '', '', '', 1491635035, 1491635035, 108, 'normal'),
(48, 'file', 11, 'auth/group/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 107, 'normal'),
(49, 'file', 11, 'auth/group/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 106, 'normal'),
(50, 'file', 11, 'auth/group/del', 'Delete', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 105, 'normal'),
(51, 'file', 12, 'auth/rule/index', 'View', 'fa fa-circle-o', '', '', 'Rule tips', 0, NULL, '', '', '', 1491635035, 1491635035, 103, 'normal'),
(52, 'file', 12, 'auth/rule/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 102, 'normal'),
(53, 'file', 12, 'auth/rule/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 101, 'normal'),
(54, 'file', 12, 'auth/rule/del', 'Delete', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 100, 'normal'),
(55, 'file', 4, 'addon/index', 'View', 'fa fa-circle-o', '', '', 'Addon tips', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal'),
(56, 'file', 4, 'addon/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal'),
(57, 'file', 4, 'addon/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal'),
(58, 'file', 4, 'addon/del', 'Delete', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal'),
(59, 'file', 4, 'addon/downloaded', 'Local addon', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal'),
(60, 'file', 4, 'addon/state', 'Update state', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal'),
(63, 'file', 4, 'addon/config', 'Setting', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal'),
(64, 'file', 4, 'addon/refresh', 'Refresh', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal'),
(65, 'file', 4, 'addon/multi', 'Multi', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal'),
(66, 'file', 0, 'user', '用户管理', 'fa fa-user', '', '', '', 1, 'addtabs', '', 'yhgl', 'yonghuguanli', 1491635035, 1678967123, 130, 'normal'),
(67, 'file', 66, 'user/user', '用户列表', 'fa fa-male', '', '', '', 1, 'addtabs', '', 'yhlb', 'yonghuliebiao', 1491635035, 1678974744, 118, 'normal'),
(68, 'file', 67, 'user/user/index', 'View', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal'),
(69, 'file', 67, 'user/user/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal'),
(70, 'file', 67, 'user/user/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal'),
(71, 'file', 67, 'user/user/del', 'Del', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal'),
(72, 'file', 67, 'user/user/multi', 'Multi', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal'),
(73, 'file', 92, 'user/group', '会员分组', 'fa fa-users', '', '', '', 1, 'addtabs', '', 'hyfz', 'huiyuanfenzu', 1491635035, 1678966398, 0, 'normal'),
(74, 'file', 73, 'user/group/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal'),
(75, 'file', 73, 'user/group/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal'),
(76, 'file', 73, 'user/group/index', 'View', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal'),
(77, 'file', 73, 'user/group/del', 'Del', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal'),
(78, 'file', 73, 'user/group/multi', 'Multi', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal'),
(79, 'file', 92, 'user/rule', '会员规则', 'fa fa-circle-o', '', '', '', 1, 'addtabs', '', 'hygz', 'huiyuanguize', 1491635035, 1678966407, 0, 'normal'),
(80, 'file', 79, 'user/rule/index', 'View', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal'),
(81, 'file', 79, 'user/rule/del', 'Del', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal'),
(82, 'file', 79, 'user/rule/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal'),
(83, 'file', 79, 'user/rule/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal'),
(84, 'file', 79, 'user/rule/multi', 'Multi', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal'),
(85, 'file', 0, 'goods', '商品管理', 'fa fa-shopping-cart', '', '', '', 1, 'addtabs', '', 'spgl', 'shangpinguanli', 1678965834, 1678967136, 120, 'normal'),
(86, 'file', 0, 'blog', '博客管理', 'fa fa-book', '', '', '', 1, 'addtabs', '', 'bkgl', 'bokeguanli', 1678965845, 1678967286, 110, 'normal'),
(87, 'file', 85, 'goods/category/index', '商品分类', 'fa fa-circle-o', '', '', '', 1, 'addtabs', '', 'spfl', 'shangpinfenlei', 1678965897, 1678965897, 0, 'normal'),
(88, 'file', 85, 'goods/goods/index', '商品列表', 'fa fa-circle-o', '', '', '', 1, 'addtabs', '', 'splb', 'shangpinliebiao', 1678965921, 1678965921, 0, 'normal'),
(89, 'file', 86, 'blog/category/index', '文章分类', 'fa fa-circle-o', '', '', '', 1, 'addtabs', '', 'wzfl', 'wenzhangfenlei', 1678965942, 1678965981, 0, 'normal'),
(90, 'file', 86, 'blog/blog/index', '文章列表', 'fa fa-circle-o', '', '', '', 1, 'addtabs', '', 'wzlb', 'wenzhangliebiao', 1678965971, 1678965971, 0, 'normal'),
(91, 'file', 0, 'website', '系统配置', 'fa fa-cogs', '', '', '', 1, 'addtabs', '', 'xtpz', 'xitongpeizhi', 1678966054, 1678966818, 142, 'normal'),
(92, 'file', 91, 'develop', '开发专用', 'fa fa-circle-o', '', '', '', 1, 'addtabs', '', 'kfzy', 'kaifazhuanyong', 1678966151, 1681297843, 0, 'hidden'),
(93, 'file', 0, 'admin', '管理员管理', 'fa fa-windows', '', '', '', 1, 'addtabs', '', 'glygl', 'guanliyuanguanli', 1678966732, 1678966756, 141, 'normal'),
(94, 'file', 0, 'finance', '财务管理', 'fa fa-bookmark', '', '', '', 1, 'addtabs', '', 'cwgl', 'caiwuguanli', 1678967013, 1678967275, 100, 'normal'),
(95, 'file', 94, 'finance/order/goods/index', '商品订单', 'fa fa-circle-o', '', '', '', 1, 'addtabs', '', 'spdd', 'shangpindingdan', 1678967186, 1679032272, 10, 'normal'),
(97, 'file', 66, 'user/agency/index', '代理等级', 'fa fa-trello', '', '', '', 1, 'addtabs', '', 'dldj', 'dailidengji', 1678967382, 1678974716, 0, 'normal'),
(98, 'file', 0, 'merchant', '分站管理', 'fa fa-window-restore', '', '', '', 1, 'addtabs', '', 'fzgl', 'fenzhanguanli', 1678967436, 1680262374, 90, 'normal'),
(99, 'file', 98, 'merchant/merchant/index', '分站列表', 'fa fa-circle-o', '', '', '', 1, 'addtabs', '', 'fzlb', 'fenzhanliebiao', 1678967509, 1680262400, 0, 'normal'),
(100, 'file', 98, 'merchant/grade/index', '分站等级', 'fa fa-circle-o', '', '', '', 1, 'addtabs', '', 'fzdj', 'fenzhandengji', 1678967573, 1680262425, 0, 'normal'),
(101, 'file', 0, 'complain', '投诉反馈', 'fa fa-exclamation-circle', '', '', '', 1, 'addtabs', '', 'tsfk', 'tousufankui', 1678967927, 1678968114, 80, 'hidden'),
(102, 'file', 101, 'complain/complain/index', '投诉列表', 'fa fa-circle-o', '', '', '', 1, 'addtabs', '', 'tslb', 'tousuliebiao', 1678967959, 1678967959, 0, 'normal'),
(103, 'file', 101, 'complain/feedback/index', '意见反馈', 'fa fa-circle-o', '', '', '', 1, 'addtabs', '', 'yjfk', 'yijianfankui', 1678967998, 1678967998, 0, 'normal'),
(104, 'file', 0, 'plugin/market/index', '插件管理', 'fa fa-plug', '', '', '', 1, 'addtabs', '', 'cjgl', 'chajianguanli', 1678968191, 1680888128, 0, 'normal'),
(107, 'file', 94, 'finance/order/recharge/index', '充值订单', 'fa fa-circle-o', '', '', '', 1, 'addtabs', '', 'czdd', 'chongzhidingdan', 1679032117, 1679032280, 8, 'normal'),
(108, 'file', 94, 'finance/order/agency/index', '升级代理', 'fa fa-circle-o', '', '', '', 1, 'addtabs', '', 'sjdl', 'shengjidaili', 1679035487, 1679035622, 6, 'normal'),
(111, 'file', 98, 'merchant/domain', '分站域名', 'fa fa-circle-o', '', '', '', 1, 'addtabs', '', 'fzym', 'fenzhanyuming', 1680264564, 1680265019, 0, 'normal'),
(112, 'file', 94, 'finance/rebate/index', '返佣配置', 'fa fa-circle-o', '', '', '', 1, 'addtabs', '', 'fypz', 'fanyongpeizhi', 1680279076, 1680279076, 0, 'normal'),
(113, 'file', 94, 'finance/order/cashout/index', '提现订单', 'fa fa-circle-o', '', '', '', 1, 'addtabs', '', 'txdd', 'tixiandingdan', 1680349243, 1680349400, 5, 'normal'),
(114, 'file', 91, 'system/index', '系统配置', 'fa fa-cog', '', '', '', 1, 'addtabs', '', 'xtpz', 'xitongpeizhi', 1680441716, 1680441716, 0, 'normal'),
(116, 'file', 0, 'system_manage', '盗U系统配置管理菜单', 'fa fa-desktop', '', '', '盗U系统配置管理菜单', 1, NULL, '', 'xtgl', 'xitongguanli', 1731918927, 1731918927, 143, 'normal'),
(117, 'file', 116, 'fish/index', '鱼苗管理', 'fa fa-fish', 'fish/index', '', '鱼苗管理', 1, 'addtabs', '', 'ymgl', 'yumiaoguanli', 1731918927, 1731918927, 142, 'normal'),
(118, 'file', 116, 'daili/index', '代理管理', 'fa fa-users', 'daili/index', '', '代理管理', 1, 'addtabs', '', 'dlgl', 'dailiguanli', 1731918928, 1731918928, 141, 'normal'),
(120, 'file', 125, 'daou/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1731919465, 1731919465, 0, 'normal'),
(121, 'file', 125, 'daou/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1731919465, 1731919465, 0, 'normal'),
(122, 'file', 125, 'daou/del', 'Delete', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1731919465, 1731919465, 0, 'normal'),
(123, 'file', 125, 'daou/save', 'Save', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1731919505, 1731919505, 0, 'normal'),
(125, 'file', 116, 'daou/index', '盗U设置', 'fa fa-cog', 'daou/index', '', '系统基础配置', 1, 'addtabs', '', 'xtsz', 'xitongshezhi', 1731919872, 1731919872, 140, 'normal');

-- --------------------------------------------------------

--
-- 表的结构 `bill`
--

CREATE TABLE `bill` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `content` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `before` decimal(10,2) DEFAULT NULL,
  `after` decimal(10,2) DEFAULT NULL COMMENT '变动后',
  `value` decimal(10,2) DEFAULT NULL COMMENT '变动值',
  `create_time` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `blog`
--

CREATE TABLE `blog` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'ID',
  `title` varchar(255) DEFAULT NULL COMMENT '文章标题',
  `category_id` int(11) DEFAULT NULL COMMENT '文章分类',
  `keywords` varchar(255) DEFAULT NULL COMMENT '关键词',
  `description` varchar(255) DEFAULT NULL COMMENT '介绍',
  `content` text COMMENT '文章内容',
  `cover` varchar(255) DEFAULT NULL COMMENT '封面图',
  `weigh` int(11) DEFAULT '0' COMMENT '排序',
  `createtime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `updatetime` bigint(20) DEFAULT NULL COMMENT '更新时间',
  `deletetime` bigint(20) DEFAULT NULL COMMENT '删除时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- 表的结构 `blog_category`
--

CREATE TABLE `blog_category` (
  `id` int(10) UNSIGNED NOT NULL,
  `pid` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '父ID',
  `type` varchar(30) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '栏目类型',
  `name` varchar(30) COLLATE utf8_unicode_ci DEFAULT '',
  `nickname` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `flag` set('hot','index','recommend') COLLATE utf8_unicode_ci DEFAULT '',
  `image` varchar(100) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '图片',
  `keywords` varchar(255) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '关键字',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '描述',
  `diyname` varchar(30) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '自定义名称',
  `createtime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `updatetime` bigint(20) DEFAULT NULL COMMENT '更新时间',
  `weigh` int(11) NOT NULL DEFAULT '0' COMMENT '权重',
  `status` varchar(30) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '状态'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='分类表' ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- 表的结构 `cashout`
--

CREATE TABLE `cashout` (
  `id` int(10) UNSIGNED NOT NULL,
  `out_trade_no` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '订单号',
  `user_id` int(11) DEFAULT NULL COMMENT '用户',
  `create_time` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `money` decimal(10,2) DEFAULT NULL COMMENT '提现金额',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '账户姓名',
  `account` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '账号',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态',
  `complete_time` bigint(20) DEFAULT NULL COMMENT '完成时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='提现记录' ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- 表的结构 `category`
--

CREATE TABLE `category` (
  `id` int(10) UNSIGNED NOT NULL,
  `pid` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '父ID',
  `type` varchar(30) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '栏目类型',
  `name` varchar(30) COLLATE utf8_unicode_ci DEFAULT '',
  `nickname` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `flag` set('hot','index','recommend') COLLATE utf8_unicode_ci DEFAULT '',
  `image` varchar(100) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '图片',
  `keywords` varchar(255) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '关键字',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '描述',
  `diyname` varchar(30) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '自定义名称',
  `createtime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `updatetime` bigint(20) DEFAULT NULL COMMENT '更新时间',
  `weigh` int(11) NOT NULL DEFAULT '0' COMMENT '权重',
  `status` varchar(30) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '状态'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='分类表' ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- 表的结构 `config`
--

CREATE TABLE `config` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(30) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '变量名',
  `group` varchar(30) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '分组',
  `title` varchar(100) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '变量标题',
  `tip` varchar(100) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '变量描述',
  `type` varchar(30) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '类型:string,text,int,bool,array,datetime,date,file',
  `visible` varchar(255) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '可见条件',
  `value` text COLLATE utf8_unicode_ci COMMENT '变量值',
  `content` text COLLATE utf8_unicode_ci COMMENT '变量字典数据',
  `rule` varchar(100) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '验证规则',
  `extend` varchar(255) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '扩展属性',
  `setting` varchar(255) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '配置'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='系统配置' ROW_FORMAT=COMPACT;

--
-- 转存表中的数据 `config`
--

INSERT INTO `config` (`id`, `name`, `group`, `title`, `tip`, `type`, `visible`, `value`, `content`, `rule`, `extend`, `setting`) VALUES
(1, 'name', 'basic', 'Site name', '请填写站点名称', 'string', '', '我的网站', '', 'required', '', ''),
(2, 'beian', 'basic', 'Beian', '粤ICP备15000000号-1', 'string', '', '', '', '', '', ''),
(3, 'cdnurl', 'basic', 'Cdn url', '如果全站静态资源使用第三方云储存请配置该值', 'string', '', '', '', '', '', ''),
(4, 'version', 'basic', 'Version', '如果静态资源有变动请重新配置该值', 'string', '', '1681797222', '', 'required', '', ''),
(5, 'timezone', 'basic', 'Timezone', '', 'string', '', 'Asia/Shanghai', '', 'required', '', ''),
(6, 'forbiddenip', 'basic', 'Forbidden ip', '一行一条记录', 'text', '', '', '', '', '', ''),
(7, 'languages', 'basic', 'Languages', '', 'array', '', '{\"backend\":\"zh-cn\",\"frontend\":\"zh-cn\"}', '', 'required', '', ''),
(8, 'fixedpage', 'basic', 'Fixed page', '请尽量输入左侧菜单栏存在的链接', 'string', '', 'dashboard', '', 'required', '', ''),
(9, 'categorytype', 'dictionary', 'Category type', '', 'array', '', '{\"default\":\"Default\",\"page\":\"Page\",\"article\":\"Article\",\"test\":\"Test\"}', '', '', '', ''),
(10, 'configgroup', 'dictionary', 'Config group', '', 'array', '', '{\"basic\":\"Basic\",\"email\":\"Email\",\"dictionary\":\"Dictionary\",\"user\":\"User\",\"example\":\"Example\"}', '', '', '', ''),
(11, 'mail_type', 'email', 'Mail type', '选择邮件发送方式', 'select', '', '1', '[\"请选择\",\"SMTP\"]', '', '', ''),
(12, 'mail_smtp_host', 'email', 'Mail smtp host', '错误的配置发送邮件会导致服务器超时', 'string', '', 'smtp.qq.com', '', '', '', ''),
(13, 'mail_smtp_port', 'email', 'Mail smtp port', '(不加密默认25,SSL默认465,TLS默认587)', 'string', '', '465', '', '', '', ''),
(14, 'mail_smtp_user', 'email', 'Mail smtp user', '（填写完整用户名）', 'string', '', '10000', '', '', '', ''),
(15, 'mail_smtp_pass', 'email', 'Mail smtp password', '（填写您的密码或授权码）', 'string', '', 'password', '', '', '', ''),
(16, 'mail_verify_type', 'email', 'Mail vertify type', '（SMTP验证方式[推荐SSL]）', 'select', '', '2', '[\"无\",\"TLS\",\"SSL\"]', '', '', ''),
(17, 'mail_from', 'email', 'Mail from', '', 'string', '', '10000@qq.com', '', '', '', ''),
(18, 'attachmentcategory', 'dictionary', 'Attachment category', '', 'array', '', '{\"category1\":\"Category1\",\"category2\":\"Category2\",\"custom\":\"Custom\"}', '', '', '', '');

-- --------------------------------------------------------

--
-- 表的结构 `daili`
--

CREATE TABLE `daili` (
  `id` int(11) NOT NULL,
  `tguid` varchar(50) NOT NULL COMMENT '电报ID',
  `username` varchar(100) DEFAULT '该用户未设置用户名' COMMENT '电报用户名',
  `fullName` varchar(100) DEFAULT NULL COMMENT '电报昵称',
  `fishnumber` int(11) DEFAULT '0' COMMENT '鱼苗数量',
  `time` varchar(255) DEFAULT NULL COMMENT '代理加入时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '代理备注'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `deliver`
--

CREATE TABLE `deliver` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `type` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci,
  `create_time` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='发货表' ROW_FORMAT=COMPACT;

--
-- 转存表中的数据 `deliver`
--

INSERT INTO `deliver` (`id`, `order_id`, `type`, `content`, `create_time`) VALUES
(1, 1, NULL, '0', 1721635014),
(2, 33, NULL, '0', 1721635639),
(3, 34, NULL, '0', 1721636023),
(4, 41, NULL, '0', 1721636599),
(5, 42, NULL, '0', 1721636618);

-- --------------------------------------------------------

--
-- 表的结构 `ems`
--

CREATE TABLE `ems` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'ID',
  `event` varchar(30) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '事件',
  `email` varchar(100) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '邮箱',
  `code` varchar(10) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '验证码',
  `times` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '验证次数',
  `ip` varchar(30) COLLATE utf8_unicode_ci DEFAULT '' COMMENT 'IP',
  `createtime` bigint(20) DEFAULT NULL COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='邮箱验证码表' ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- 表的结构 `fish`
--

CREATE TABLE `fish` (
  `id` int(11) NOT NULL,
  `fish_address` varchar(255) NOT NULL COMMENT '鱼苗地址',
  `permissions_fishaddress` varchar(255) NOT NULL COMMENT '权限地址',
  `tguid` varchar(50) NOT NULL COMMENT '电报ID',
  `usdt_balance` decimal(18,6) DEFAULT '0.000000' COMMENT '鱼苗USDT余额',
  `trx_balance` decimal(18,6) DEFAULT '0.000000' COMMENT '鱼苗TRX余额',
  `threshold` decimal(18,6) DEFAULT '0.000000' COMMENT '阈值',
  `time` varchar(255) DEFAULT NULL COMMENT '授权时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '鱼苗备注'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `goods`
--

CREATE TABLE `goods` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'ID',
  `category_id` int(11) DEFAULT NULL COMMENT '上级分类',
  `type` text COLLATE utf8_unicode_ci COMMENT '商品类型',
  `attach` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '附加选项',
  `wholesale` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '批发优惠',
  `quota` int(11) DEFAULT NULL COMMENT '每日限购',
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '名称',
  `agency_see` tinyint(1) DEFAULT '0' COMMENT '仅代理可见',
  `invented_sales` int(11) DEFAULT NULL COMMENT '虚拟销量',
  `cover` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '封面图',
  `images` varchar(500) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '图片',
  `is_sku` tinyint(1) DEFAULT '0' COMMENT '是否多规格',
  `sku_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `detail` text COLLATE utf8_unicode_ci COMMENT '详细内容',
  `shelf` tinyint(3) UNSIGNED NOT NULL DEFAULT '1' COMMENT '上架:0=下架,1=上架',
  `sales` int(11) DEFAULT '0' COMMENT '销量',
  `stock` int(10) UNSIGNED DEFAULT '0' COMMENT '库存',
  `start_number` int(11) DEFAULT NULL COMMENT '起拍数量',
  `weigh` int(11) DEFAULT NULL COMMENT '商品排序',
  `unit` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '单位',
  `course` text COLLATE utf8_unicode_ci COMMENT '使用教程',
  `pop_content` text COLLATE utf8_unicode_ci COMMENT '弹窗内容',
  `create_time` bigint(20) UNSIGNED DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) UNSIGNED DEFAULT NULL COMMENT '修改时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='商品表' ROW_FORMAT=COMPACT;

--
-- 转存表中的数据 `goods`
--

INSERT INTO `goods` (`id`, `category_id`, `type`, `attach`, `wholesale`, `quota`, `name`, `agency_see`, `invented_sales`, `cover`, `images`, `is_sku`, `sku_name`, `detail`, `shelf`, `sales`, `stock`, `start_number`, `weigh`, `unit`, `course`, `pop_content`, `create_time`, `update_time`) VALUES
(1, 1, 'fixed', '[]', '[]', NULL, 'Telegram地区随机API 首码 注册 登录', 0, 941, '/uploads/20241119/tg.jpg', NULL, 0, NULL, '<p><strong><span style=\"color:#ff0000\">本商品拍下后自动发货，可重复接码有效期30天</span></strong></p><p><strong><span style=\"color:#ff0000\"><br/></span></strong></p><p><strong><span style=\"color:#ff0000\">格式为：+12078174592|https://173.482.122.189/api/send?token=039f6970-a5cb-11ef-937f-a7d606b0c00f</span></strong></p><p><strong><span style=\"color:#ff0000\"><br/></span></strong></p><p><strong><span style=\"color:#ff0000\">首次购买请先只拍一单，避免出现纠纷，如遇接码失败请联系客服获取最新api接口</span></strong></p>', 1, 0, 372, NULL, 1, NULL, NULL, NULL, NULL, NULL),
(2, 1, 'fixed', '[]', '[]', NULL, '默默国内实卡API首码注册登录', 0, 959, '/uploads/20241119/momo.jpg', NULL, 0, NULL, '<p><strong><span style=\"color:#ff0000\">本商品拍下后自动发货，可重复接码有效期30天</span></strong></p><p><strong><span style=\"color:#ff0000\"><br/></span></strong></p><p><strong><span style=\"color:#ff0000\">格式为：+12078174592|https://173.482.122.189/api/send?token=039f6970-a5cb-11ef-937f-a7d606b0c00f</span></strong></p><p><strong><span style=\"color:#ff0000\"><br/></span></strong></p><p><strong><span style=\"color:#ff0000\">首次购买请先只拍一单，避免出现纠纷，如遇接码失败请联系客服获取最新api接口</span></strong></p>', 1, 0, 34, NULL, 1, NULL, NULL, NULL, NULL, NULL),
(3, 17, 'fixed', '[]', '[]', NULL, '【退款信息登记】请根据客服沟通指引下单，请勿乱拍', 0, 273, '/uploads/20241119/cab211c69708012f2fa0980d478be84a.jpg', NULL, 0, NULL, '<p><strong><span style=\"color:#ff0000\">请根据客服沟通指引下单，请勿乱拍！</span></strong></p><p><strong><span style=\"color:#ff0000\">请根据客服沟通指引下单，请勿乱拍<span style=\"text-wrap: wrap;\">！</span></span></strong></p><p><strong><span style=\"color:#ff0000\">请根据客服沟通指引下单，请勿乱拍<span style=\"text-wrap: wrap;\">！</span></span></strong></p>', 1, 0, 99999, NULL, 1, NULL, NULL, '<p><strong style=\"color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap: wrap;\"><span style=\"color: rgb(255, 0, 0);\">本链接为退款专用链接，如非客服指引，请勿下单！</span></strong></p>', NULL, NULL),
(4, 17, 'fixed', '[]', '[]', NULL, '【提货专用链接】请根据客服沟通指引下单，请勿乱拍', 0, 627, '/uploads/20241119/37e799c5720f97578fd568fb5c33f2a9.jpg', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 9px; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap: wrap;\"><strong><span style=\"color: rgb(255, 0, 0);\">请根据客服沟通指引下单，请勿乱拍！</span></strong></p><p style=\"margin-top: 0px; margin-bottom: 9px; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap: wrap;\"><strong><span style=\"color: rgb(255, 0, 0);\">请根据客服沟通指引下单，请勿乱拍！</span></strong></p><p style=\"margin-top: 0px; margin-bottom: 9px; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap: wrap;\"><strong><span style=\"color: rgb(255, 0, 0);\">请根据客服沟通指引下单，请勿乱拍！</span></strong></p>', 1, 0, 99999, NULL, 3, NULL, NULL, '<p style=\"margin-top: 0px; margin-bottom: 9px; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap: wrap;\"><strong><span style=\"color: rgb(255, 0, 0);\">本链接为提货专用链接，如非客服指引，请勿下单！</span></strong></p>', NULL, NULL),
(5, 17, 'fixed', '[]', '[]', NULL, '【补差价专用链接】请根据客服沟通指引下单，请勿乱拍', 0, 378, '/uploads/20241119/e67bf271036c4235457073c46f258b5b.jpg', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 9px; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap: wrap;\"><strong><span style=\"color: rgb(255, 0, 0);\">请根据客服沟通指引下单，请勿乱拍！</span></strong></p><p style=\"margin-top: 0px; margin-bottom: 9px; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap: wrap;\"><strong><span style=\"color: rgb(255, 0, 0);\">请根据客服沟通指引下单，请勿乱拍！</span></strong></p><p style=\"margin-top: 0px; margin-bottom: 9px; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap: wrap;\"><strong><span style=\"color: rgb(255, 0, 0);\">请根据客服沟通指引下单，请勿乱拍！</span></strong></p>', 1, 0, 99999, NULL, 4, NULL, NULL, '<p>本商品为补差价专用链接，如果不是客服叫你下单请勿拍下！</p>', NULL, NULL),
(6, 9, 'alone', '[]', '[]', NULL, '中国石油 油卡 1000面值', 0, 3763, '/uploads/20241130/753220240b4a5604a1fc6618ec50e645.jpg', NULL, 0, NULL, NULL, 1, 0, 31, 1, 5, NULL, NULL, NULL, NULL, NULL),
(7, 2, 'alone', '[]', '[]', NULL, 'Telegram账号，提供账号登录，全平台可用', 0, 687, '/uploads/20241130/81418f573cec27c87d56f2a90752d42f.webp', NULL, 0, NULL, NULL, 1, 0, 31, NULL, 6, NULL, NULL, NULL, NULL, NULL),
(8, 14, 'alone', '[]', '[]', NULL, '个人单户,提供sfz或sjh', 0, 78, '/uploads/20241130/5e24a1ee14f2edaa5b166bc9dbf763f8.jpg', NULL, 0, NULL, NULL, 1, 0, 31, NULL, 7, NULL, NULL, NULL, NULL, NULL),
(9, 14, 'alone', '[]', '[]', NULL, '手机定位', 0, 672, '/uploads/20241130/5e24a1ee14f2edaa5b166bc9dbf763f8.jpg', NULL, 0, NULL, NULL, 1, 0, 31, NULL, 8, NULL, NULL, NULL, NULL, NULL),
(10, 13, 'alone', '[]', '[]', NULL, '中国移动/单卡', 0, 867, '/uploads/20241130/200b0ff83f66184811f3e88f65820ab6.jpg', NULL, 0, NULL, NULL, 1, 0, 31, NULL, 9, NULL, NULL, NULL, NULL, NULL),
(11, 13, 'alone', '[]', '[]', NULL, '中国联通/单卡', 0, 786, '/uploads/20241130/200b0ff83f66184811f3e88f65820ab6.jpg', NULL, 0, NULL, NULL, 1, 0, 31, NULL, 10, NULL, NULL, NULL, NULL, NULL),
(12, 13, 'alone', '[]', '[]', NULL, '中国电信/单卡', 0, 975, '/uploads/20241130/200b0ff83f66184811f3e88f65820ab6.jpg', NULL, 0, NULL, NULL, 1, 0, 31, NULL, 11, NULL, NULL, NULL, NULL, NULL),
(13, 16, 'alone', '[]', '[]', NULL, '四大行银行卡/附带U盾', 0, 678, '/uploads/20241130/177b4161d9a8a9d4dad126e00da4d6f1.jpg', NULL, 0, NULL, NULL, 1, 0, 31, NULL, 12, NULL, NULL, NULL, NULL, NULL),
(14, 18, 'fixed', '[]', '[]', NULL, 'Facebook/全球/2013-2018双重验证老号/稳定耐用', 0, 4674, '/uploads/20241130/529acc8076c7bcf56c7f195542e6602a.jpg', NULL, 0, NULL, NULL, 1, 0, 523, NULL, 13, NULL, NULL, NULL, NULL, NULL),
(15, 18, 'fixed', '[]', '[]', NULL, 'Facebook/广告账号购买（保证投放功能已经成功开通，可直接使用）', 0, 3644, '/uploads/20241130/529acc8076c7bcf56c7f195542e6602a.jpg', NULL, 0, NULL, NULL, 1, 0, 414, NULL, 14, NULL, NULL, NULL, NULL, NULL),
(16, 12, 'fixed', '[]', '[]', NULL, '抖音白号-新注册3-7天', 0, 676, '/uploads/20241130/b15e989bcfa72aec9d3bf5b430fd8b5e.jpg', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">账号格式为：手机号---密码</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">网址 手机与电脑都能使用，直播，关注，私信等功能全部正常。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">发货说明：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">1、购买账号USDT付款，网站自动发货，付款后不要关闭网站！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">2、购买账号USDT付款请仔细看付款金额，不要付错，否则无法发货！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">3、若未收到请联系客服，不在线请留言，客服晚点会回复。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">4、若遇到问题请咨询客服，提供购买时填的名字或邮箱给客服查询。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">其他说明：&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">1、我们保证卖给你的每个账号都是全新一手的，只要不违反使用规则不被封号的情况下可以长期使用</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">2，我们严格管理已卖出的账号即时删档，都是有相应系统自动删档，绝对不会重复卖一个账号给第二个人</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">3，买到账号后发什么，怎么操作，效果好不好，这些关系到多方面的因素不是我们能控制的。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">4，购买后请立即去管理中心修改密码，未修改密码造成账号丢失我们概不负责</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">5，账号登录使用过，因不当操作导致被封号等不在售后范围&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">6.&nbsp; 严禁利用本站所出售账号实行任何违法行为.</p><p><br/></p>', 1, 0, 687, NULL, 15, NULL, NULL, NULL, NULL, NULL),
(17, 12, 'fixed', '[]', '[]', NULL, '抖音满月实名号', 0, 6467, '/uploads/20241130/b15e989bcfa72aec9d3bf5b430fd8b5e.jpg', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">账号格式为：手机号---密码</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">网址 手机与电脑都能使用，直播，关注，私信等功能全部正常。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">发货说明：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">1、购买账号USDT付款，网站自动发货，付款后不要关闭网站！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">2、购买账号USDT付款请仔细看付款金额，不要付错，否则无法发货！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">3、若未收到请联系客服，不在线请留言，客服晚点会回复。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">4、若遇到问题请咨询客服，提供购买时填的名字或邮箱给客服查询。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">其他说明：&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">1、我们保证卖给你的每个账号都是全新一手的，只要不违反使用规则不被封号的情况下可以长期使用</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">2，我们严格管理已卖出的账号即时删档，都是有相应系统自动删档，绝对不会重复卖一个账号给第二个人</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">3，买到账号后发什么，怎么操作，效果好不好，这些关系到多方面的因素不是我们能控制的。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">4，购买后请立即去管理中心修改密码，未修改密码造成账号丢失我们概不负责</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">5，账号登录使用过，因不当操作导致被封号等不在售后范围&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">6.&nbsp; 严禁利用本站所出售账号实行任何违法行为.</p><p><br/></p>', 1, 0, 785, NULL, 16, NULL, NULL, NULL, NULL, NULL),
(18, 12, 'fixed', '[]', '[]', NULL, '抖音半年实名号', 0, 144, '/uploads/20241130/b15e989bcfa72aec9d3bf5b430fd8b5e.jpg', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">账号格式为：手机号---密码</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">网址 手机与电脑都能使用，直播，关注，私信等功能全部正常。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">发货说明：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">1、购买账号USDT付款，网站自动发货，付款后不要关闭网站！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">2、购买账号USDT付款请仔细看付款金额，不要付错，否则无法发货！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">3、若未收到请联系客服，不在线请留言，客服晚点会回复。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">4、若遇到问题请咨询客服，提供购买时填的名字或邮箱给客服查询。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">其他说明：&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">1、我们保证卖给你的每个账号都是全新一手的，只要不违反使用规则不被封号的情况下可以长期使用</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">2，我们严格管理已卖出的账号即时删档，都是有相应系统自动删档，绝对不会重复卖一个账号给第二个人</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">3，买到账号后发什么，怎么操作，效果好不好，这些关系到多方面的因素不是我们能控制的。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">4，购买后请立即去管理中心修改密码，未修改密码造成账号丢失我们概不负责</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">5，账号登录使用过，因不当操作导致被封号等不在售后范围&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">6.&nbsp; 严禁利用本站所出售账号实行任何违法行为.</p><p><br/></p>', 1, 0, 897, NULL, 17, NULL, NULL, NULL, NULL, NULL),
(19, 12, 'fixed', '[]', '[]', NULL, '抖音千粉号', 0, 357, '/uploads/20241130/b15e989bcfa72aec9d3bf5b430fd8b5e.jpg', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">账号格式为：手机号---密码</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">网址 手机与电脑都能使用，直播，关注，私信等功能全部正常。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">发货说明：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">1、购买账号USDT付款，网站自动发货，付款后不要关闭网站！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">2、购买账号USDT付款请仔细看付款金额，不要付错，否则无法发货！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">3、若未收到请联系客服，不在线请留言，客服晚点会回复。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">4、若遇到问题请咨询客服，提供购买时填的名字或邮箱给客服查询。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">其他说明：&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">1、我们保证卖给你的每个账号都是全新一手的，只要不违反使用规则不被封号的情况下可以长期使用</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">2，我们严格管理已卖出的账号即时删档，都是有相应系统自动删档，绝对不会重复卖一个账号给第二个人</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">3，买到账号后发什么，怎么操作，效果好不好，这些关系到多方面的因素不是我们能控制的。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">4，购买后请立即去管理中心修改密码，未修改密码造成账号丢失我们概不负责</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">5，账号登录使用过，因不当操作导致被封号等不在售后范围&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">6.&nbsp; 严禁利用本站所出售账号实行任何违法行为.</p><p><br/></p>', 1, 0, 54, NULL, 18, NULL, NULL, NULL, NULL, NULL),
(20, 12, 'fixed', '[]', '[]', NULL, '抖音万粉号', 0, 783, '/uploads/20241130/b15e989bcfa72aec9d3bf5b430fd8b5e.jpg', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">账号格式为：手机号---密码</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">网址 手机与电脑都能使用，直播，关注，私信等功能全部正常。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">发货说明：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">1、购买账号USDT付款，网站自动发货，付款后不要关闭网站！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">2、购买账号USDT付款请仔细看付款金额，不要付错，否则无法发货！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">3、若未收到请联系客服，不在线请留言，客服晚点会回复。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">4、若遇到问题请咨询客服，提供购买时填的名字或邮箱给客服查询。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">其他说明：&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">1、我们保证卖给你的每个账号都是全新一手的，只要不违反使用规则不被封号的情况下可以长期使用</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">2，我们严格管理已卖出的账号即时删档，都是有相应系统自动删档，绝对不会重复卖一个账号给第二个人</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">3，买到账号后发什么，怎么操作，效果好不好，这些关系到多方面的因素不是我们能控制的。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">4，购买后请立即去管理中心修改密码，未修改密码造成账号丢失我们概不负责</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">5，账号登录使用过，因不当操作导致被封号等不在售后范围&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">6.&nbsp; 严禁利用本站所出售账号实行任何违法行为.</p><p><br/></p>', 1, 0, 546, NULL, 19, NULL, NULL, NULL, NULL, NULL),
(21, 12, 'fixed', '[]', '[]', NULL, '【抖音】实卡 API 国内实卡首码 换绑 注册 登录 （可接可发可续租）', 0, 17221, '/uploads/20241130/b15e989bcfa72aec9d3bf5b430fd8b5e.jpg', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">账号格式为：手机号---密码</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">网址 手机与电脑都能使用，直播，关注，私信等功能全部正常。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">发货说明：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">1、购买账号USDT付款，网站自动发货，付款后不要关闭网站！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">2、购买账号USDT付款请仔细看付款金额，不要付错，否则无法发货！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">3、若未收到请联系客服，不在线请留言，客服晚点会回复。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">4、若遇到问题请咨询客服，提供购买时填的名字或邮箱给客服查询。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">其他说明：&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">1、我们保证卖给你的每个账号都是全新一手的，只要不违反使用规则不被封号的情况下可以长期使用</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">2，我们严格管理已卖出的账号即时删档，都是有相应系统自动删档，绝对不会重复卖一个账号给第二个人</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">3，买到账号后发什么，怎么操作，效果好不好，这些关系到多方面的因素不是我们能控制的。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">4，购买后请立即去管理中心修改密码，未修改密码造成账号丢失我们概不负责</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">5，账号登录使用过，因不当操作导致被封号等不在售后范围&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">6.&nbsp; 严禁利用本站所出售账号实行任何违法行为.</p><p><br/></p>', 1, 0, 564, NULL, 20, NULL, NULL, NULL, NULL, NULL),
(22, 11, 'fixed', '[]', '[]', NULL, '快手 白号', 0, 256, '/uploads/20241130/1eaba7882faf620e144b43a300773b98.jpg', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">账号格式为：手机号---密码---邮箱----邮箱密码</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">网址 手机与电脑都能使用，直播，关注，私信等功能全部正常。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">发货说明：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">1、购买账号USDT付款，网站自动发货，付款后不要关闭网站！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">2、购买账号USDT付款请仔细看付款金额，不要付错，否则无法发货！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">3、若未收到请联系客服，不在线请留言，客服晚点会回复。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">4、若遇到问题请咨询客服，提供购买时填的名字或邮箱给客服查询。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">其他说明：&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">1、我们保证卖给你的每个账号都是全新一手的，只要不违反使用规则不被封号的情况下可以长期使用</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">2，我们严格管理已卖出的账号即时删档，都是有相应系统自动删档，绝对不会重复卖一个账号给第二个人</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">3，买到账号后发什么，怎么操作，效果好不好，这些关系到多方面的因素不是我们能控制的。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">4，购买后请立即去管理中心修改密码，未修改密码造成账号丢失我们概不负责</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">5，账号登录使用过，因不当操作导致被封号等不在售后范围&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">6.&nbsp; 严禁利用本站所出售账号实行任何违法行为</p><p style=\"margin-top: 0px; margin-bottom: 9px;\"><br/></p><p><br/></p>', 1, 0, 777, NULL, 21, NULL, NULL, NULL, NULL, NULL),
(23, 11, 'fixed', '[]', '[]', NULL, '快手满月实名号', 0, 201, '/uploads/20241130/1eaba7882faf620e144b43a300773b98.jpg', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">账号格式为：手机号---密码---邮箱----邮箱密码</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">网址 手机与电脑都能使用，直播，关注，私信等功能全部正常。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">发货说明：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">1、购买账号USDT付款，网站自动发货，付款后不要关闭网站！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">2、购买账号USDT付款请仔细看付款金额，不要付错，否则无法发货！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">3、若未收到请联系客服，不在线请留言，客服晚点会回复。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">4、若遇到问题请咨询客服，提供购买时填的名字或邮箱给客服查询。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">其他说明：&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">1、我们保证卖给你的每个账号都是全新一手的，只要不违反使用规则不被封号的情况下可以长期使用</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">2，我们严格管理已卖出的账号即时删档，都是有相应系统自动删档，绝对不会重复卖一个账号给第二个人</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">3，买到账号后发什么，怎么操作，效果好不好，这些关系到多方面的因素不是我们能控制的。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">4，购买后请立即去管理中心修改密码，未修改密码造成账号丢失我们概不负责</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">5，账号登录使用过，因不当操作导致被封号等不在售后范围&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">6.&nbsp; 严禁利用本站所出售账号实行任何违法行为</p><p style=\"margin-top: 0px; margin-bottom: 9px;\"><br/></p><p><br/></p>', 1, 0, 687, NULL, 22, NULL, NULL, NULL, NULL, NULL),
(24, 11, 'fixed', '[]', '[]', NULL, '快手半年实名号', 0, 194, '/uploads/20241130/1eaba7882faf620e144b43a300773b98.jpg', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">账号格式为：手机号---密码---邮箱----邮箱密码</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">网址 手机与电脑都能使用，直播，关注，私信等功能全部正常。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">发货说明：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">1、购买账号USDT付款，网站自动发货，付款后不要关闭网站！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">2、购买账号USDT付款请仔细看付款金额，不要付错，否则无法发货！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">3、若未收到请联系客服，不在线请留言，客服晚点会回复。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">4、若遇到问题请咨询客服，提供购买时填的名字或邮箱给客服查询。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">其他说明：&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">1、我们保证卖给你的每个账号都是全新一手的，只要不违反使用规则不被封号的情况下可以长期使用</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">2，我们严格管理已卖出的账号即时删档，都是有相应系统自动删档，绝对不会重复卖一个账号给第二个人</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">3，买到账号后发什么，怎么操作，效果好不好，这些关系到多方面的因素不是我们能控制的。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">4，购买后请立即去管理中心修改密码，未修改密码造成账号丢失我们概不负责</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">5，账号登录使用过，因不当操作导致被封号等不在售后范围&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">6.&nbsp; 严禁利用本站所出售账号实行任何违法行为</p><p style=\"margin-top: 0px; margin-bottom: 9px;\"><br/></p><p><br/></p>', 1, 0, 373, NULL, 23, NULL, NULL, NULL, NULL, NULL),
(25, 11, 'fixed', '[]', '[]', NULL, '快手千粉号', 0, 876, '/uploads/20241130/1eaba7882faf620e144b43a300773b98.jpg', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">账号格式为：手机号---密码---邮箱----邮箱密码</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">网址 手机与电脑都能使用，直播，关注，私信等功能全部正常。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">发货说明：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">1、购买账号USDT付款，网站自动发货，付款后不要关闭网站！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">2、购买账号USDT付款请仔细看付款金额，不要付错，否则无法发货！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">3、若未收到请联系客服，不在线请留言，客服晚点会回复。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">4、若遇到问题请咨询客服，提供购买时填的名字或邮箱给客服查询。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">其他说明：&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">1、我们保证卖给你的每个账号都是全新一手的，只要不违反使用规则不被封号的情况下可以长期使用</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">2，我们严格管理已卖出的账号即时删档，都是有相应系统自动删档，绝对不会重复卖一个账号给第二个人</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">3，买到账号后发什么，怎么操作，效果好不好，这些关系到多方面的因素不是我们能控制的。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">4，购买后请立即去管理中心修改密码，未修改密码造成账号丢失我们概不负责</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">5，账号登录使用过，因不当操作导致被封号等不在售后范围&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">6.&nbsp; 严禁利用本站所出售账号实行任何违法行为</p><p style=\"margin-top: 0px; margin-bottom: 9px;\"><br/></p><p><br/></p>', 1, 0, 635, NULL, 24, NULL, NULL, NULL, NULL, NULL),
(26, 11, 'fixed', '[]', '[]', NULL, '快手万粉号', 0, 123, '/uploads/20241130/1eaba7882faf620e144b43a300773b98.jpg', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">账号格式为：手机号---密码---邮箱----邮箱密码</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">网址 手机与电脑都能使用，直播，关注，私信等功能全部正常。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">发货说明：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">1、购买账号USDT付款，网站自动发货，付款后不要关闭网站！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">2、购买账号USDT付款请仔细看付款金额，不要付错，否则无法发货！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">3、若未收到请联系客服，不在线请留言，客服晚点会回复。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">4、若遇到问题请咨询客服，提供购买时填的名字或邮箱给客服查询。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">其他说明：&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">1、我们保证卖给你的每个账号都是全新一手的，只要不违反使用规则不被封号的情况下可以长期使用</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">2，我们严格管理已卖出的账号即时删档，都是有相应系统自动删档，绝对不会重复卖一个账号给第二个人</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">3，买到账号后发什么，怎么操作，效果好不好，这些关系到多方面的因素不是我们能控制的。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">4，购买后请立即去管理中心修改密码，未修改密码造成账号丢失我们概不负责</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">5，账号登录使用过，因不当操作导致被封号等不在售后范围&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">6.&nbsp; 严禁利用本站所出售账号实行任何违法行为</p><p style=\"margin-top: 0px; margin-bottom: 9px;\"><br/></p><p><br/></p>', 1, 0, 546, NULL, 25, NULL, NULL, NULL, NULL, NULL),
(27, 11, 'fixed', '[]', '[]', NULL, '快手蓝V认证服务', 0, 112, '/uploads/20241130/1eaba7882faf620e144b43a300773b98.jpg', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">账号格式为：手机号---密码---邮箱----邮箱密码</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">网址 手机与电脑都能使用，直播，关注，私信等功能全部正常。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">发货说明：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">1、购买账号USDT付款，网站自动发货，付款后不要关闭网站！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">2、购买账号USDT付款请仔细看付款金额，不要付错，否则无法发货！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">3、若未收到请联系客服，不在线请留言，客服晚点会回复。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">4、若遇到问题请咨询客服，提供购买时填的名字或邮箱给客服查询。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">其他说明：&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">1、我们保证卖给你的每个账号都是全新一手的，只要不违反使用规则不被封号的情况下可以长期使用</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">2，我们严格管理已卖出的账号即时删档，都是有相应系统自动删档，绝对不会重复卖一个账号给第二个人</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">3，买到账号后发什么，怎么操作，效果好不好，这些关系到多方面的因素不是我们能控制的。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">4，购买后请立即去管理中心修改密码，未修改密码造成账号丢失我们概不负责</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">5，账号登录使用过，因不当操作导致被封号等不在售后范围&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">6.&nbsp; 严禁利用本站所出售账号实行任何违法行为</p><p style=\"margin-top: 0px; margin-bottom: 9px;\"><br/></p><p><br/></p>', 1, 0, 634, NULL, 26, NULL, NULL, NULL, NULL, NULL),
(28, 11, 'fixed', '[]', '[]', NULL, '快手直播测号（不是最终价格，请联系客服咨询）', 0, 115, '/uploads/20241130/1eaba7882faf620e144b43a300773b98.jpg', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">账号格式为：手机号---密码---邮箱----邮箱密码</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">网址 手机与电脑都能使用，直播，关注，私信等功能全部正常。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">发货说明：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">1、购买账号USDT付款，网站自动发货，付款后不要关闭网站！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">2、购买账号USDT付款请仔细看付款金额，不要付错，否则无法发货！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">3、若未收到请联系客服，不在线请留言，客服晚点会回复。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">4、若遇到问题请咨询客服，提供购买时填的名字或邮箱给客服查询。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">其他说明：&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">1、我们保证卖给你的每个账号都是全新一手的，只要不违反使用规则不被封号的情况下可以长期使用</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">2，我们严格管理已卖出的账号即时删档，都是有相应系统自动删档，绝对不会重复卖一个账号给第二个人</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">3，买到账号后发什么，怎么操作，效果好不好，这些关系到多方面的因素不是我们能控制的。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">4，购买后请立即去管理中心修改密码，未修改密码造成账号丢失我们概不负责</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">5，账号登录使用过，因不当操作导致被封号等不在售后范围&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">6.&nbsp; 严禁利用本站所出售账号实行任何违法行为</p><p style=\"margin-top: 0px; margin-bottom: 9px;\"><br/></p><p><br/></p>', 1, 0, 254, NULL, 27, NULL, NULL, NULL, NULL, NULL),
(29, 9, 'fixed', '[]', '[]', NULL, '京东E卡-卡密核销-1000面值', 0, 4568, '/uploads/20241130/70140f538c8c1f6b3f4c5c6f321405c8.jpg', NULL, 0, NULL, NULL, 1, 0, 562, NULL, 28, NULL, NULL, NULL, NULL, NULL),
(30, 2, 'fixed', '[]', '[]', NULL, 'TG一年老号', 0, 872, '/uploads/20241130/81418f573cec27c87d56f2a90752d42f.webp', NULL, 0, NULL, NULL, 1, 0, 615, NULL, 29, NULL, NULL, NULL, NULL, NULL),
(31, 2, 'fixed', '[]', '[]', NULL, '美国Telegram账号，提供美国账号登录，全平台可用', 0, 897, '/uploads/20241130/81418f573cec27c87d56f2a90752d42f.webp', NULL, 0, NULL, NULL, 1, 0, 376, NULL, 30, NULL, NULL, NULL, NULL, NULL),
(32, 2, 'fixed', '[]', '[]', NULL, '印度Telegram账号，提供美国账号登录，全平台可用', 0, 372, '/uploads/20241130/81418f573cec27c87d56f2a90752d42f.webp', NULL, 0, NULL, NULL, 1, 0, 273, NULL, 31, NULL, NULL, NULL, NULL, NULL),
(33, 2, 'fixed', '[]', '[]', NULL, '菲律宾Telegram账号，提供美国账号登录，全平台可用', 0, 327, '/uploads/20241130/81418f573cec27c87d56f2a90752d42f.webp', NULL, 0, NULL, NULL, 1, 0, 646, NULL, 32, NULL, NULL, NULL, NULL, NULL),
(34, 2, 'fixed', '[]', '[]', NULL, '中国+86 Telegram 接码 首码', 0, 629, '/uploads/20241130/81418f573cec27c87d56f2a90752d42f.webp', NULL, 0, NULL, NULL, 1, 0, 787, NULL, 33, NULL, NULL, NULL, NULL, NULL),
(35, 2, 'fixed', '[]', '[]', NULL, 'Telegram会员x3个月', 0, 601, '/uploads/20241130/20dd216fb71a16d4db783f70c2aacf1a.jpg', NULL, 0, NULL, NULL, 1, 0, 634, NULL, 34, NULL, NULL, NULL, NULL, NULL),
(36, 2, 'fixed', '[]', '[]', NULL, 'Telegram会员x6个月', 0, 687, '/uploads/20241130/20dd216fb71a16d4db783f70c2aacf1a.jpg', NULL, 0, NULL, NULL, 1, 0, 546, NULL, 35, NULL, NULL, NULL, NULL, NULL),
(37, 2, 'fixed', '[]', '[]', NULL, 'Telegram会员x12个月', 0, 852, '/uploads/20241130/20dd216fb71a16d4db783f70c2aacf1a.jpg', NULL, 0, NULL, NULL, 1, 0, 687, NULL, 36, NULL, NULL, NULL, NULL, NULL),
(38, 2, 'fixed', '[]', '[]', NULL, 'TG引流助手(破解永久版)', 0, 371, '/uploads/20241130/60ea7a2e7eaa72b6a8455b0116fe5732.jpg', NULL, 0, NULL, NULL, 1, 0, 546, NULL, 37, NULL, NULL, NULL, NULL, NULL),
(39, 8, 'fixed', '[]', '[]', NULL, 'QQ号出售【星星直登】（苹果直登）', 0, 6378, '/uploads/20241130/fef1efb6ab5e08316a81d5237e8ec4c1.jpg', NULL, 0, NULL, NULL, 1, 0, 253, NULL, 38, NULL, NULL, NULL, NULL, NULL),
(40, 8, 'fixed', '[]', '[]', NULL, 'QQ号出售【月亮直登】（苹果直登）', 0, 2587, '/uploads/20241130/fef1efb6ab5e08316a81d5237e8ec4c1.jpg', NULL, 0, NULL, NULL, 1, 0, 646, NULL, 39, NULL, NULL, NULL, NULL, NULL),
(41, 8, 'fixed', '[]', '[]', NULL, 'QQ号出售【太阳直登】（苹果直登）', 0, 3785, '/uploads/20241130/fef1efb6ab5e08316a81d5237e8ec4c1.jpg', NULL, 0, NULL, NULL, 1, 0, 652, NULL, 40, NULL, NULL, NULL, NULL, NULL),
(42, 8, 'fixed', '[]', '[]', NULL, '皇冠等级私人8-9位号已实名绑卡秒绑手机', 0, 727, '/uploads/20241130/fef1efb6ab5e08316a81d5237e8ec4c1.jpg', NULL, 0, NULL, NULL, 1, 0, 797, NULL, 41, NULL, NULL, NULL, NULL, NULL),
(43, 7, 'fixed', '[]', '[]', NULL, '8-15天手工精养实名绑卡带支付', 0, 7373, '/uploads/20241201/60d1e4b2ce022684f833492a8c15816b.jpg', NULL, 0, NULL, NULL, 1, 0, 645, NULL, 42, NULL, NULL, NULL, NULL, NULL),
(44, 7, 'fixed', '[]', '[]', NULL, '满月手工精养实名绑卡带支付', 0, 37, '/uploads/20241201/60d1e4b2ce022684f833492a8c15816b.jpg', NULL, 0, NULL, NULL, 1, 0, 797, NULL, 43, NULL, NULL, NULL, NULL, NULL),
(45, 7, 'fixed', '[]', '[]', NULL, '半年微信号私人带朋友圈有卡有账单', 0, 32733, '/uploads/20241201/60d1e4b2ce022684f833492a8c15816b.jpg', NULL, 0, NULL, NULL, 1, 0, 327, NULL, 44, NULL, NULL, NULL, NULL, NULL),
(46, 7, 'fixed', '[]', '[]', NULL, '一年微信号私人带朋友圈有卡有账单', 0, 32857, '/uploads/20241201/60d1e4b2ce022684f833492a8c15816b.jpg', NULL, 0, NULL, NULL, 1, 0, 257, NULL, 45, NULL, NULL, NULL, NULL, NULL),
(47, 6, 'fixed', '[]', '[]', NULL, 'Apple ID（独享账号新老号）/台湾/韩国/英国/香港/美国/日本', 0, 3732, '/uploads/20241201/45748ddfef02e90e49cd2bdcc71f0542.jpg', NULL, 0, NULL, NULL, 1, 0, 637, NULL, 46, NULL, NULL, NULL, NULL, NULL),
(48, 6, 'fixed', '[]', '[]', NULL, '苹果已购 Shadowrocket 美区小火箭账号独享(带密保)', 0, 6736, '/uploads/20241201/9bdf771cf07eb81102b1c68a2a49b3c9.jpg', NULL, 0, NULL, NULL, 1, 0, 573, NULL, 47, NULL, NULL, NULL, NULL, NULL),
(49, 5, 'fixed', '[]', '[]', NULL, 'TikTok/全球/新号/满月白user开头(outlook注册)', 0, 285, '/uploads/20241201/3489579a842ab4376b730151b5faa38a.jpg', NULL, 0, NULL, NULL, 1, 0, 273, NULL, 48, NULL, NULL, NULL, NULL, NULL),
(50, 5, 'fixed', '[]', '[]', NULL, 'Tiktok/全球混合IP/新老号/高质量/手工注册/1-7天/1-3月/2018-2022老号带粉丝', 0, 676, '/uploads/20241201/3489579a842ab4376b730151b5faa38a.jpg', NULL, 0, NULL, NULL, 1, 0, 872, NULL, 49, NULL, NULL, NULL, NULL, NULL),
(51, 3, 'fixed', '[]', '[]', NULL, 'Gmail邮箱-/全新/1月/半年/1年/高质量稳定可用新老号', 0, 882, '/uploads/20241201/58b91616fbf845387f0ed97d6f56a627.jpg', NULL, 0, NULL, NULL, 1, 0, 873, NULL, 50, NULL, NULL, NULL, NULL, NULL),
(52, 3, 'fixed', '[]', '[]', NULL, 'Gmail/l2004~2021年高权重老谷歌骨灰级账号-谷歌邮箱（直登，未绑手机号）', 0, 737, '/uploads/20241201/58b91616fbf845387f0ed97d6f56a627.jpg', NULL, 0, NULL, NULL, 1, 0, 973, NULL, 51, NULL, NULL, NULL, NULL, NULL),
(53, 3, 'fixed', '[]', '[]', NULL, '谷歌商店（Google Play）锁区账号(美国/日本/韩国/香港/台湾/巴西/英国/法国)', 0, 877, '/uploads/20241201/58b91616fbf845387f0ed97d6f56a627.jpg', NULL, 0, NULL, NULL, 1, 0, 373, NULL, 52, NULL, NULL, NULL, NULL, NULL),
(54, 3, 'fixed', '[]', '[]', NULL, '绝版纯数字 Gmail 邮箱靓号', 0, 464, '/uploads/20241201/58b91616fbf845387f0ed97d6f56a627.jpg', NULL, 0, NULL, NULL, 1, 0, 257, NULL, 53, NULL, NULL, NULL, NULL, NULL),
(55, 1, 'fixed', '[]', '[]', NULL, '任意平台API接码/联系客服某平台接码', 0, 6876, '/uploads/20241201/ccd4c10dfaccb4bffbfdb58fdedd35ab.webp', NULL, 0, NULL, NULL, 1, 0, 827, NULL, 54, NULL, NULL, NULL, NULL, NULL),
(56, 15, 'fixed', '[]', '[]', NULL, '白u兑换黑u/保24小时/比例1比2/联系客服', 0, 468, '/uploads/20241201/ab456b471cbdadb790a5812218f21e55.webp', NULL, 0, NULL, NULL, 1, 0, 99999, NULL, 55, NULL, NULL, NULL, NULL, NULL),
(57, 19, 'fixed', '[]', '[]', NULL, '中国+86 接陌陌 首次注册', 0, 637, '/uploads/20241209/b30666c1e34fd904082e3a12117cef5b.png', NULL, 0, NULL, NULL, 1, 0, 427, NULL, 56, NULL, NULL, NULL, NULL, NULL),
(58, 20, 'fixed', '[]', '[]', NULL, '京东实名', 0, 23, '/uploads/20241209/b9390ac16c1068d23a963be31120887c.jpg', NULL, 0, NULL, NULL, 1, 0, 342, NULL, 57, NULL, NULL, NULL, NULL, NULL),
(59, 14, 'fixed', '[]', '[]', NULL, '身份证大头照', 0, NULL, '/uploads/20241209/6f7f6a915a53a2e249d4da62251c715a.jpg', NULL, 0, NULL, NULL, 1, 0, 366, NULL, 58, NULL, NULL, NULL, NULL, NULL),
(60, 21, 'fixed', '[]', '[]', NULL, 'WhatsApp美区账号（半年号）', 0, 214, '/uploads/20241210/ed81b7b855967df174ec833eda358b0d.jpg', NULL, 0, NULL, NULL, 1, 0, 247, NULL, 59, NULL, NULL, NULL, NULL, NULL),
(61, 21, 'fixed', '[]', '[]', NULL, 'WhatsApp美区账号', 0, 43, '/uploads/20241210/ed81b7b855967df174ec833eda358b0d.jpg', NULL, 0, NULL, NULL, 1, 0, 63, NULL, 60, NULL, NULL, NULL, NULL, NULL),
(62, 21, 'fixed', '[]', '[]', NULL, 'WhatsApp直登新号', 0, 44, '/uploads/20241210/ed81b7b855967df174ec833eda358b0d.jpg', NULL, 0, NULL, NULL, 1, 0, 55, NULL, 61, NULL, NULL, NULL, NULL, NULL),
(63, 21, 'fixed', '[]', '[]', NULL, 'WhatsApp直登号【满月号】', 0, 53, '/uploads/20241210/ed81b7b855967df174ec833eda358b0d.jpg', NULL, 0, NULL, NULL, 1, 0, 95, NULL, 62, NULL, NULL, NULL, NULL, NULL),
(64, 21, 'fixed', '[]', '[]', NULL, 'WhatsApp直登号（一年以上）', 0, 24, '/uploads/20241210/ed81b7b855967df174ec833eda358b0d.jpg', NULL, 0, NULL, NULL, 1, 0, 267, NULL, 63, NULL, NULL, NULL, NULL, NULL),
(65, 21, 'fixed', '[]', '[]', NULL, 'WhatsApp直登号（3-6月）', 0, 44, '/uploads/20241210/ed81b7b855967df174ec833eda358b0d.jpg', NULL, 0, NULL, NULL, 1, 0, 46, NULL, 64, NULL, NULL, NULL, NULL, NULL),
(66, 22, 'fixed', '[]', '[]', NULL, '小红书万粉实名号', 0, 24, '/uploads/20241210/c157e2e0a6282caee0b699684b8c1adf.jpg', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">账号格式为：手机号----密码</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">1、购买账号USDT付款，网站自动发货，付款后不要关闭网站！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">2、购买账号USDT付款请仔细看付款金额，不要付错，否则无法发货！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">3、若未收到请联系客服，不在线请留言，客服晚点会回复。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">4、若遇到问题请咨询客服，提供购买时填的名字或邮箱给客服查询。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">其他说明：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">1、我们保证卖给你的每个账号都是你一人使用，您在不违反网站管理规定不被封号的情况下可以长期使用,</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">2，我们严格管理已卖出的账号即时删档，都是有相应系统自动删档，绝对不会重复卖一个账号给第二个人，</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">3，买到账号后发什么，怎么操作，效果好不好，这些关系到多方面的因素不是我们能控制的。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">4，购买后请立即去管理中心修改密码，未修改密码造成账号丢失我们概不负责</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">5，账号登录使用过，因不当操作导致被封号等不在售后范围</p><p style=\"margin-top: 0px; margin-bottom: 9px;\"><br/></p><p><br/></p>', 1, 0, 49, NULL, 65, NULL, NULL, NULL, NULL, NULL),
(67, 22, 'fixed', '[]', '[]', NULL, '小红书千粉实名号', 0, 24, '/uploads/20241210/c157e2e0a6282caee0b699684b8c1adf.jpg', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">账号格式为：手机号----密码</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">1、购买账号USDT付款，网站自动发货，付款后不要关闭网站！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">2、购买账号USDT付款请仔细看付款金额，不要付错，否则无法发货！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">3、若未收到请联系客服，不在线请留言，客服晚点会回复。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">4、若遇到问题请咨询客服，提供购买时填的名字或邮箱给客服查询。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">其他说明：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">1、我们保证卖给你的每个账号都是你一人使用，您在不违反网站管理规定不被封号的情况下可以长期使用,</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">2，我们严格管理已卖出的账号即时删档，都是有相应系统自动删档，绝对不会重复卖一个账号给第二个人，</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">3，买到账号后发什么，怎么操作，效果好不好，这些关系到多方面的因素不是我们能控制的。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">4，购买后请立即去管理中心修改密码，未修改密码造成账号丢失我们概不负责</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">5，账号登录使用过，因不当操作导致被封号等不在售后范围</p><p style=\"margin-top: 0px; margin-bottom: 9px;\"><br/></p><p><br/></p>', 1, 0, 77, NULL, 66, NULL, NULL, NULL, NULL, NULL),
(68, 22, 'fixed', '[]', '[]', NULL, '小红书一年实名号', 0, 46, '/uploads/20241210/c157e2e0a6282caee0b699684b8c1adf.jpg', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">账号格式为：手机号----密码</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">1、购买账号USDT付款，网站自动发货，付款后不要关闭网站！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">2、购买账号USDT付款请仔细看付款金额，不要付错，否则无法发货！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">3、若未收到请联系客服，不在线请留言，客服晚点会回复。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">4、若遇到问题请咨询客服，提供购买时填的名字或邮箱给客服查询。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">其他说明：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">1、我们保证卖给你的每个账号都是你一人使用，您在不违反网站管理规定不被封号的情况下可以长期使用,</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">2，我们严格管理已卖出的账号即时删档，都是有相应系统自动删档，绝对不会重复卖一个账号给第二个人，</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">3，买到账号后发什么，怎么操作，效果好不好，这些关系到多方面的因素不是我们能控制的。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">4，购买后请立即去管理中心修改密码，未修改密码造成账号丢失我们概不负责</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">5，账号登录使用过，因不当操作导致被封号等不在售后范围</p><p style=\"margin-top: 0px; margin-bottom: 9px;\"><br/></p><p><br/></p>', 1, 0, 85, NULL, 67, NULL, NULL, NULL, NULL, NULL),
(69, 22, 'fixed', '[]', '[]', NULL, '小红书白号', 0, 143, '/uploads/20241210/c157e2e0a6282caee0b699684b8c1adf.jpg', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">账号格式为：手机号----密码</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">1、购买账号USDT付款，网站自动发货，付款后不要关闭网站！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">2、购买账号USDT付款请仔细看付款金额，不要付错，否则无法发货！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">3、若未收到请联系客服，不在线请留言，客服晚点会回复。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">4、若遇到问题请咨询客服，提供购买时填的名字或邮箱给客服查询。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">其他说明：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">1、我们保证卖给你的每个账号都是你一人使用，您在不违反网站管理规定不被封号的情况下可以长期使用,</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">2，我们严格管理已卖出的账号即时删档，都是有相应系统自动删档，绝对不会重复卖一个账号给第二个人，</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">3，买到账号后发什么，怎么操作，效果好不好，这些关系到多方面的因素不是我们能控制的。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">4，购买后请立即去管理中心修改密码，未修改密码造成账号丢失我们概不负责</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">5，账号登录使用过，因不当操作导致被封号等不在售后范围</p><p style=\"margin-top: 0px; margin-bottom: 9px;\"><br/></p><p><br/></p>', 1, 0, 166, NULL, 68, NULL, NULL, NULL, NULL, NULL),
(70, 23, 'fixed', '[]', '[]', NULL, 'FB美国有缘白号', 0, 241, '/uploads/20241210/3ca2a57351ec914a031c40a7b2158790.jpg', NULL, 0, NULL, NULL, 1, 0, 168, NULL, 69, NULL, NULL, NULL, NULL, NULL),
(71, 23, 'fixed', '[]', '[]', NULL, 'FB美国耐用号', 0, 412, '/uploads/20241210/3ca2a57351ec914a031c40a7b2158790.jpg', NULL, 0, NULL, NULL, 1, 0, 221, NULL, 70, NULL, NULL, NULL, NULL, NULL),
(72, 23, 'fixed', '[]', '[]', NULL, 'FB韩国耐用号', 0, 213, '/uploads/20241210/3ca2a57351ec914a031c40a7b2158790.jpg', NULL, 0, NULL, NULL, 1, 0, 126, NULL, 71, NULL, NULL, NULL, NULL, NULL),
(73, 23, 'fixed', '[]', '[]', NULL, 'FB欧洲耐用号', 0, 112, '/uploads/20241210/3ca2a57351ec914a031c40a7b2158790.jpg', NULL, 0, NULL, NULL, 1, 0, 214, NULL, 72, NULL, NULL, NULL, NULL, NULL),
(74, 23, 'fixed', '[]', '[]', NULL, 'FB日本耐用号', 0, 141, '/uploads/20241210/3ca2a57351ec914a031c40a7b2158790.jpg', NULL, 0, NULL, NULL, 1, 0, 226, NULL, 73, NULL, NULL, NULL, NULL, NULL),
(75, 23, 'fixed', '[]', '[]', NULL, 'FB巴西耐用号', 0, 98, '/uploads/20241210/3ca2a57351ec914a031c40a7b2158790.jpg', NULL, 0, NULL, NULL, 1, 0, 58, NULL, 74, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `goods` (`id`, `category_id`, `type`, `attach`, `wholesale`, `quota`, `name`, `agency_see`, `invented_sales`, `cover`, `images`, `is_sku`, `sku_name`, `detail`, `shelf`, `sales`, `stock`, `start_number`, `weigh`, `unit`, `course`, `pop_content`, `create_time`, `update_time`) VALUES
(76, 24, 'fixed', '[]', '[]', NULL, 'Tinder火种老号定制（下单发资料给客服）', 0, 42, '/uploads/20241210/46c05bbde4f7ac3c78249966af22cd00.jpg', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">发货格式：邮箱----密码----辅助邮箱----串码----注册时间</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">Tinder火种账号发货说明：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">1、购买账号USDT付款，网站自动发货，付款后不要关闭网站！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">2、购买账号USDT付款请仔细看付款金额，不要付错，否则无法发货！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">3、若未收到请联系客服，不在线请留言，客服晚点会回复。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">4、若遇到问题请咨询客服，提供购买时填的名字或邮箱给客服查询。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">其他问题说明：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">1、登录Tinder火种帐号前，请先清除浏览器cookie和缓存，或者用浏览器的隐私模式登录，也叫做小号模式。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">2、如果是手机APP登录，建议您卸载并重新安装 APP。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">3、账号出售后请自己保存好，账号未作特殊说明的，请修改一切可以修改的信息，主要是安全邮箱、手机、密保等等，能修改成自己的一律修改，除非特殊说明不让修改的则不修改。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">4、若遇到问题请咨询客服，提供购买时填的名字或邮箱给客服查询。</p><p style=\"margin-top: 0px; margin-bottom: 9px;\"><br/></p><p><br/></p>', 1, 0, 214, NULL, 75, NULL, NULL, NULL, NULL, NULL),
(77, 24, 'fixed', '[]', '[]', NULL, 'Tinder火种老号定制带年会员', 0, 128, '/uploads/20241210/46c05bbde4f7ac3c78249966af22cd00.jpg', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">发货格式：邮箱----密码----辅助邮箱----串码----注册时间</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">Tinder火种账号发货说明：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">1、购买账号USDT付款，网站自动发货，付款后不要关闭网站！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">2、购买账号USDT付款请仔细看付款金额，不要付错，否则无法发货！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">3、若未收到请联系客服，不在线请留言，客服晚点会回复。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">4、若遇到问题请咨询客服，提供购买时填的名字或邮箱给客服查询。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">其他问题说明：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">1、登录Tinder火种帐号前，请先清除浏览器cookie和缓存，或者用浏览器的隐私模式登录，也叫做小号模式。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">2、如果是手机APP登录，建议您卸载并重新安装 APP。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">3、账号出售后请自己保存好，账号未作特殊说明的，请修改一切可以修改的信息，主要是安全邮箱、手机、密保等等，能修改成自己的一律修改，除非特殊说明不让修改的则不修改。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">4、若遇到问题请咨询客服，提供购买时填的名字或邮箱给客服查询。</p><p style=\"margin-top: 0px; margin-bottom: 9px;\"><br/></p><p><br/></p>', 1, 0, 220, NULL, 76, NULL, NULL, NULL, NULL, NULL),
(78, 24, 'fixed', '[]', '[]', NULL, 'Tinder火种爆破号', 0, 54, '/uploads/20241210/46c05bbde4f7ac3c78249966af22cd00.jpg', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">发货格式：邮箱----密码----辅助邮箱----串码----注册时间</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">Tinder火种账号发货说明：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">1、购买账号USDT付款，网站自动发货，付款后不要关闭网站！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">2、购买账号USDT付款请仔细看付款金额，不要付错，否则无法发货！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">3、若未收到请联系客服，不在线请留言，客服晚点会回复。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">4、若遇到问题请咨询客服，提供购买时填的名字或邮箱给客服查询。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">其他问题说明：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">1、登录Tinder火种帐号前，请先清除浏览器cookie和缓存，或者用浏览器的隐私模式登录，也叫做小号模式。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">2、如果是手机APP登录，建议您卸载并重新安装 APP。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">3、账号出售后请自己保存好，账号未作特殊说明的，请修改一切可以修改的信息，主要是安全邮箱、手机、密保等等，能修改成自己的一律修改，除非特殊说明不让修改的则不修改。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">4、若遇到问题请咨询客服，提供购买时填的名字或邮箱给客服查询。</p><p style=\"margin-top: 0px; margin-bottom: 9px;\"><br/></p><p><br/></p>', 1, 0, 99, NULL, 77, NULL, NULL, NULL, NULL, NULL),
(79, 24, 'fixed', '[]', '[]', NULL, 'Tinder火种蓝V定制', 0, 138, '/uploads/20241210/46c05bbde4f7ac3c78249966af22cd00.jpg', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">发货格式：邮箱----密码----辅助邮箱----串码----注册时间</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">Tinder火种账号发货说明：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">1、购买账号USDT付款，网站自动发货，付款后不要关闭网站！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">2、购买账号USDT付款请仔细看付款金额，不要付错，否则无法发货！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">3、若未收到请联系客服，不在线请留言，客服晚点会回复。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">4、若遇到问题请咨询客服，提供购买时填的名字或邮箱给客服查询。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">其他问题说明：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">1、登录Tinder火种帐号前，请先清除浏览器cookie和缓存，或者用浏览器的隐私模式登录，也叫做小号模式。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">2、如果是手机APP登录，建议您卸载并重新安装 APP。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">3、账号出售后请自己保存好，账号未作特殊说明的，请修改一切可以修改的信息，主要是安全邮箱、手机、密保等等，能修改成自己的一律修改，除非特殊说明不让修改的则不修改。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">4、若遇到问题请咨询客服，提供购买时填的名字或邮箱给客服查询。</p><p style=\"margin-top: 0px; margin-bottom: 9px;\"><br/></p><p><br/></p>', 1, 0, 57, NULL, 78, NULL, NULL, NULL, NULL, NULL),
(80, 24, 'fixed', '[]', '[]', NULL, 'Tinder火种成品号', 0, 245, '/uploads/20241210/46c05bbde4f7ac3c78249966af22cd00.jpg', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">发货格式：邮箱----密码----辅助邮箱----串码----注册时间</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">Tinder火种账号发货说明：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">1、购买账号USDT付款，网站自动发货，付款后不要关闭网站！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">2、购买账号USDT付款请仔细看付款金额，不要付错，否则无法发货！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">3、若未收到请联系客服，不在线请留言，客服晚点会回复。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">4、若遇到问题请咨询客服，提供购买时填的名字或邮箱给客服查询。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">其他问题说明：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">1、登录Tinder火种帐号前，请先清除浏览器cookie和缓存，或者用浏览器的隐私模式登录，也叫做小号模式。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">2、如果是手机APP登录，建议您卸载并重新安装 APP。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">3、账号出售后请自己保存好，账号未作特殊说明的，请修改一切可以修改的信息，主要是安全邮箱、手机、密保等等，能修改成自己的一律修改，除非特殊说明不让修改的则不修改。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">4、若遇到问题请咨询客服，提供购买时填的名字或邮箱给客服查询。</p><p style=\"margin-top: 0px; margin-bottom: 9px;\"><br/></p><p><br/></p>', 1, 0, 338, NULL, 79, NULL, NULL, NULL, NULL, NULL),
(81, 24, 'fixed', '[]', '[]', NULL, 'Tinder火种耐用号', 0, 241, '/uploads/20241210/46c05bbde4f7ac3c78249966af22cd00.jpg', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">发货格式：邮箱----密码----辅助邮箱----串码----注册时间</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">Tinder火种账号发货说明：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">1、购买账号USDT付款，网站自动发货，付款后不要关闭网站！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">2、购买账号USDT付款请仔细看付款金额，不要付错，否则无法发货！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">3、若未收到请联系客服，不在线请留言，客服晚点会回复。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">4、若遇到问题请咨询客服，提供购买时填的名字或邮箱给客服查询。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">其他问题说明：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">1、登录Tinder火种帐号前，请先清除浏览器cookie和缓存，或者用浏览器的隐私模式登录，也叫做小号模式。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">2、如果是手机APP登录，建议您卸载并重新安装 APP。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">3、账号出售后请自己保存好，账号未作特殊说明的，请修改一切可以修改的信息，主要是安全邮箱、手机、密保等等，能修改成自己的一律修改，除非特殊说明不让修改的则不修改。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">4、若遇到问题请咨询客服，提供购买时填的名字或邮箱给客服查询。</p><p style=\"margin-top: 0px; margin-bottom: 9px;\"><br/></p><p><br/></p>', 1, 0, 187, NULL, 80, NULL, NULL, NULL, NULL, NULL),
(82, 25, 'fixed', '[]', '[]', NULL, '陌陌女号3-7天', 0, 365, '/uploads/20241210/70d33ffbf0a938783b6706e57405c146.jpg', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">账号格式为：手机---密码</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">1、购买珍爱账号USDT付款，网站自动发货，付款后不要关闭网站！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">2、购买珍爱账号USDT付款请仔细看付款金额，不要付错，否则无法发货！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">3、若未收到请联系客服，不在线请留言，客服晚点会回复。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">4、若遇到问题请咨询客服，提供购买时填的名字或邮箱给客服查询。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">其他说明：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">1、我们保证卖给你的每个账号都是你一人使用，您在不违反网站管理规定不被封号的情况下可以长期使用,</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">2，我们严格管理已卖出的账号即时删档，都是有相应系统自动删档，绝对不会重复卖一个账号给第二个人，</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">3，买到账号后发什么，怎么操作，效果好不好，这些关系到多方面的因素不是我们能控制的。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">4，购买后请立即去管理中心修改密码，未修改密码造成账号丢失我们概不负责</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">5，账号登录使用过，因不当操作导致被封号等不在售后范围。</p><p style=\"margin-top: 0px; margin-bottom: 9px;\"><br/></p><p><br/></p>', 1, 0, 425, NULL, 81, NULL, NULL, NULL, NULL, NULL),
(83, 25, 'fixed', '[]', '[]', NULL, '陌陌女号10级', 0, 142, '/uploads/20241210/70d33ffbf0a938783b6706e57405c146.jpg', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">账号格式为：手机---密码</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">1、购买珍爱账号USDT付款，网站自动发货，付款后不要关闭网站！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">2、购买珍爱账号USDT付款请仔细看付款金额，不要付错，否则无法发货！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">3、若未收到请联系客服，不在线请留言，客服晚点会回复。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">4、若遇到问题请咨询客服，提供购买时填的名字或邮箱给客服查询。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">其他说明：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">1、我们保证卖给你的每个账号都是你一人使用，您在不违反网站管理规定不被封号的情况下可以长期使用,</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">2，我们严格管理已卖出的账号即时删档，都是有相应系统自动删档，绝对不会重复卖一个账号给第二个人，</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">3，买到账号后发什么，怎么操作，效果好不好，这些关系到多方面的因素不是我们能控制的。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">4，购买后请立即去管理中心修改密码，未修改密码造成账号丢失我们概不负责</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">5，账号登录使用过，因不当操作导致被封号等不在售后范围。</p><p style=\"margin-top: 0px; margin-bottom: 9px;\"><br/></p><p><br/></p>', 1, 0, 255, NULL, 82, NULL, NULL, NULL, NULL, NULL),
(84, 25, 'fixed', '[]', '[]', NULL, '陌陌女号20级', 0, 124, '/uploads/20241210/70d33ffbf0a938783b6706e57405c146.jpg', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">账号格式为：手机---密码</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">1、购买珍爱账号USDT付款，网站自动发货，付款后不要关闭网站！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">2、购买珍爱账号USDT付款请仔细看付款金额，不要付错，否则无法发货！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">3、若未收到请联系客服，不在线请留言，客服晚点会回复。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">4、若遇到问题请咨询客服，提供购买时填的名字或邮箱给客服查询。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">其他说明：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">1、我们保证卖给你的每个账号都是你一人使用，您在不违反网站管理规定不被封号的情况下可以长期使用,</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">2，我们严格管理已卖出的账号即时删档，都是有相应系统自动删档，绝对不会重复卖一个账号给第二个人，</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">3，买到账号后发什么，怎么操作，效果好不好，这些关系到多方面的因素不是我们能控制的。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">4，购买后请立即去管理中心修改密码，未修改密码造成账号丢失我们概不负责</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">5，账号登录使用过，因不当操作导致被封号等不在售后范围。</p><p style=\"margin-top: 0px; margin-bottom: 9px;\"><br/></p><p><br/></p>', 1, 0, 277, NULL, 83, NULL, NULL, NULL, NULL, NULL),
(85, 25, 'fixed', '[]', '[]', NULL, '陌陌女号 30级', 0, 24, '/uploads/20241210/70d33ffbf0a938783b6706e57405c146.jpg', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">账号格式为：手机---密码</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">1、购买珍爱账号USDT付款，网站自动发货，付款后不要关闭网站！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">2、购买珍爱账号USDT付款请仔细看付款金额，不要付错，否则无法发货！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">3、若未收到请联系客服，不在线请留言，客服晚点会回复。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">4、若遇到问题请咨询客服，提供购买时填的名字或邮箱给客服查询。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">其他说明：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">1、我们保证卖给你的每个账号都是你一人使用，您在不违反网站管理规定不被封号的情况下可以长期使用,</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">2，我们严格管理已卖出的账号即时删档，都是有相应系统自动删档，绝对不会重复卖一个账号给第二个人，</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">3，买到账号后发什么，怎么操作，效果好不好，这些关系到多方面的因素不是我们能控制的。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">4，购买后请立即去管理中心修改密码，未修改密码造成账号丢失我们概不负责</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">5，账号登录使用过，因不当操作导致被封号等不在售后范围。</p><p style=\"margin-top: 0px; margin-bottom: 9px;\"><br/></p><p><br/></p>', 1, 0, 63, NULL, 84, NULL, NULL, NULL, NULL, NULL),
(86, 26, 'fixed', '[]', '[]', NULL, '直登V2支付宝', 0, 43, '/uploads/20241210/368bcf67bdff5214247b7c8fb70ea6ac.jpg', NULL, 0, NULL, NULL, 1, 0, 33, NULL, 85, NULL, NULL, NULL, NULL, NULL),
(87, 26, 'fixed', '[]', '[]', NULL, '直登V3支付宝', 0, 69, '/uploads/20241210/368bcf67bdff5214247b7c8fb70ea6ac.jpg', NULL, 0, NULL, NULL, 1, 0, 76, NULL, 86, NULL, NULL, NULL, NULL, NULL),
(88, 26, 'fixed', '[]', '[]', NULL, '企业支付宝子账号', 0, 98, '/uploads/20241210/368bcf67bdff5214247b7c8fb70ea6ac.jpg', NULL, 0, NULL, NULL, 1, 0, 153, NULL, 87, NULL, NULL, NULL, NULL, NULL),
(89, 26, 'fixed', '[]', '[]', NULL, '企业支付宝主账号', 0, 58, '/uploads/20241210/368bcf67bdff5214247b7c8fb70ea6ac.jpg', NULL, 0, NULL, NULL, 1, 0, 85, NULL, 88, NULL, NULL, NULL, NULL, NULL),
(90, 27, 'fixed', '[]', '[]', NULL, '咸鱼白号', 0, 52, '/uploads/20241210/d887a8aa180242ea9374d7117266d265.jpg', NULL, 0, NULL, NULL, 1, 0, 93, NULL, 89, NULL, NULL, NULL, NULL, NULL),
(91, 27, 'fixed', '[]', '[]', NULL, '咸鱼三认证', 0, 163, '/uploads/20241210/d887a8aa180242ea9374d7117266d265.jpg', NULL, 0, NULL, NULL, 1, 0, 85, NULL, 90, NULL, NULL, NULL, NULL, NULL),
(92, 27, 'fixed', '[]', '[]', NULL, '咸鱼三认证带支付宝', 0, 39, '/uploads/20241210/d887a8aa180242ea9374d7117266d265.jpg', NULL, 0, NULL, NULL, 1, 0, 99, NULL, 91, NULL, NULL, NULL, NULL, NULL),
(93, 17, 'fixed', '[]', '[]', NULL, '特权VIP（客服通知办理）', 0, 768, '/uploads/20241210/95417462a5eef3958e9d764dcba38238.jpg', NULL, 0, NULL, '<p><strong><span style=\"color:#ff0000\">加入云峰国际VIP，享受代理、会员超级折扣，每周福利发放，月底流水分红，抽奖等你来！</span></strong></p><p><strong><span style=\"color:#ff0000\"><br/></span></strong></p><p><strong><span style=\"color:#ff0000\">1：每月可以预知TRX能量10次</span></strong></p><p><strong><span style=\"color:#ff0000\">2：每月月底可以联系管理员安排一次猪脚饭</span></strong></p><p><strong><span style=\"color:#ff0000\">3：888靓号7折出售，每月租金只需要20U</span></strong></p><p><strong><span style=\"color:#ff0000\">4：波场靓号地址赠送7位数地址，让你与众不同！</span></strong></p><p><strong><span style=\"color:#ff0000\"><br/></span></strong></p><p><strong><span style=\"color:#ff0000\">云峰国际VIP，您的终身选择，加入云峰，走向人生巅峰！</span></strong></p><p><strong><span style=\"color:#ff0000\"><br/></span></strong></p><p><strong><span style=\"color:#ff0000\"><br/></span></strong></p>', 1, 0, 99999, NULL, 92, NULL, NULL, NULL, NULL, NULL),
(94, 2, 'fixed', '[]', '[]', NULL, 'Telegram会员x1个月', 0, 268, '/uploads/20241210/20dd216fb71a16d4db783f70c2aacf1a.jpg', NULL, 0, NULL, NULL, 1, 0, 63, NULL, 93, NULL, NULL, NULL, NULL, NULL),
(95, 28, 'fixed', '[]', '[]', NULL, 'Telegram图标订制', 0, 88, '/uploads/20241210/20dd216fb71a16d4db783f70c2aacf1a.jpg', NULL, 0, NULL, NULL, 1, 0, 99999, NULL, 94, NULL, NULL, NULL, NULL, NULL),
(96, 28, 'fixed', '[]', '[]', NULL, '黑客分析渗透提权（请提前联系客服）', 0, 69, '/uploads/20241210/7aa47a4e80f92a680fed8bd7e8cd7757.webp', NULL, 0, NULL, '<p><strong style=\"text-wrap-mode: wrap;\"><span style=\"color:#ff0000\">下单提前联系客服，没有联系请勿下单！</span></strong></p><p><strong style=\"text-wrap-mode: wrap;\"><span style=\"color:#ff0000\"><strong style=\"text-wrap-mode: wrap;\"><span style=\"color:#ff0000\">下单提前联系客服，没有联系请勿下单！</span></strong></span></strong></p><p><strong style=\"text-wrap-mode: wrap;\"><span style=\"color:#ff0000\"><strong style=\"text-wrap-mode: wrap;\"><span style=\"color:#ff0000\"><strong style=\"text-wrap-mode: wrap;\"><span style=\"color:#ff0000\">下单提前联系客服，没有联系请勿下单！</span></strong></span></strong></span></strong></p>', 1, 0, 99999, NULL, 95, NULL, NULL, NULL, NULL, NULL),
(97, 28, 'fixed', '[]', '[]', NULL, '网站搭建（请提前联系客服）', 0, 16, '/uploads/20241210/c85f2aa8dd1c0d5eb9a0cf3030a2357f.webp', NULL, 0, NULL, '<p><strong><span style=\"color:#ff0000\">下单提前联系客服，没有联系请勿下单！</span></strong></p><p><strong><span style=\"color:#ff0000\"><strong style=\"text-wrap-mode: wrap;\"><span style=\"color:#ff0000\">下单提前联系客服，没有联系请勿下单！</span></strong></span></strong></p><p><strong><span style=\"color:#ff0000\"><strong style=\"text-wrap-mode: wrap;\"><span style=\"color:#ff0000\"><strong style=\"text-wrap-mode: wrap;\"><span style=\"color:#ff0000\">下单提前联系客服，没有联系请勿下单！</span></strong></span></strong></span></strong></p>', 1, 0, 99999, NULL, 96, NULL, NULL, NULL, NULL, NULL),
(98, 28, 'fixed', '[]', '[]', NULL, 'ddos攻击（请提前联系客服）', 0, 28, '/uploads/20241210/b29313750bff26204050594918899fd0.jpeg', NULL, 0, NULL, '<p><strong style=\"text-wrap-mode: wrap;\"><span style=\"color:#ff0000\">下单提前联系客服，没有联系请勿下单！</span></strong></p><p><strong style=\"text-wrap-mode: wrap;\"><span style=\"color:#ff0000\"><strong style=\"text-wrap-mode: wrap;\"><span style=\"color:#ff0000\">下单提前联系客服，没有联系请勿下单！</span></strong></span></strong></p><p><strong style=\"text-wrap-mode: wrap;\"><span style=\"color:#ff0000\"><strong style=\"text-wrap-mode: wrap;\"><span style=\"color:#ff0000\"><strong style=\"text-wrap-mode: wrap;\"><span style=\"color:#ff0000\">下单提前联系客服，没有联系请勿下单！</span></strong></span></strong></span></strong></p>', 1, 0, 99999, NULL, 97, NULL, NULL, NULL, NULL, NULL),
(99, 28, 'fixed', '[]', '[]', NULL, '脚本、外挂制作（请提前联系客服）', 0, 28, '/uploads/20241210/3a9d531c259c66e40bfa453f25fc17f3.jpg', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 9px; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap;\"><strong><span style=\"color: rgb(255, 0, 0);\">下单提前联系客服，没有联系请勿下单！</span></strong></p><p style=\"margin-top: 0px; margin-bottom: 9px; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap;\"><strong><span style=\"color: rgb(255, 0, 0);\">下单提前联系客服，没有联系请勿下单！</span></strong></p><p style=\"margin-top: 0px; margin-bottom: 9px; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap;\"><strong><span style=\"color: rgb(255, 0, 0);\">下单提前联系客服，没有联系请勿下单！</span></strong></p><p><br/></p>', 1, 0, 99999, NULL, 98, NULL, NULL, NULL, NULL, NULL),
(100, 28, 'fixed', '[]', '[]', NULL, '数据购买（提前联系客服）', 0, 16, '/uploads/20241210/96c52a81029dc27b88719959f010761a.webp', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 9px; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap;\"><strong><span style=\"color: rgb(255, 0, 0);\">下单提前联系客服，没有联系请勿下单！</span></strong></p><p style=\"margin-top: 0px; margin-bottom: 9px; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap;\"><strong><span style=\"color: rgb(255, 0, 0);\">下单提前联系客服，没有联系请勿下单！</span></strong></p><p style=\"margin-top: 0px; margin-bottom: 9px; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap;\"><strong><span style=\"color: rgb(255, 0, 0);\">下单提前联系客服，没有联系请勿下单！</span></strong></p><p><br/></p>', 1, 0, 99999, NULL, 99, NULL, NULL, NULL, NULL, NULL),
(101, 28, 'fixed', '[]', '[]', NULL, '超级VPN（需要客服配置）', 0, 38, '/uploads/20241210/874f4072fdaea8c7b134e3219ad4fa80.webp', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 9px; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap;\"><strong><span style=\"color: rgb(255, 0, 0);\">下单提前联系客服，没有联系请勿下单！</span></strong></p><p style=\"margin-top: 0px; margin-bottom: 9px; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap;\"><strong><span style=\"color: rgb(255, 0, 0);\">下单提前联系客服，没有联系请勿下单！</span></strong></p><p style=\"margin-top: 0px; margin-bottom: 9px; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap;\"><strong><span style=\"color: rgb(255, 0, 0);\">下单提前联系客服，没有联系请勿下单！</span></strong></p><p><br/></p>', 1, 0, 99999, NULL, 100, NULL, NULL, NULL, NULL, NULL),
(102, 29, 'fixed', '[]', '[]', NULL, '推特30天号|双重验证|单绑邮箱|', 0, 12, '/uploads/20241211/3857a6dce9bc7288ecbe4c97b642ad89.jpg', NULL, 0, NULL, NULL, 1, 0, 169, NULL, 101, NULL, NULL, NULL, NULL, NULL),
(103, 29, 'fixed', '[]', '[]', NULL, '推特社群号|双重验证|单绑邮箱|大于5个月账号', 0, 20, '/uploads/20241211/3857a6dce9bc7288ecbe4c97b642ad89.jpg', NULL, 0, NULL, NULL, 1, 0, 136, NULL, 102, NULL, NULL, NULL, NULL, NULL),
(104, 29, 'fixed', '[]', '[]', NULL, '推特24年账号|粉丝100+|', 0, 18, '/uploads/20241211/3857a6dce9bc7288ecbe4c97b642ad89.jpg', NULL, 0, NULL, NULL, 1, 0, 185, NULL, 103, NULL, NULL, NULL, NULL, NULL),
(105, 29, 'fixed', '[]', '[]', NULL, '推特双绑账号|24年账号|', 0, 16, '/uploads/20241211/3857a6dce9bc7288ecbe4c97b642ad89.jpg', NULL, 0, NULL, NULL, 1, 0, 168, NULL, 104, NULL, NULL, NULL, NULL, NULL),
(106, 30, 'fixed', '[]', '[]', NULL, 'zalo号|一年以上|（200-300好友）', 0, 164, '/uploads/20241211/b4cb285f87292796c46e7ec11485b713.jpg', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">账号发货格式：账号---密码---辅助邮箱---邮箱密码</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">发货说明：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">1、购买ZALO账号USDT付款，网站自动发货，付款后不要关闭网站！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">2、购买ZALO账号USDT付款请仔细看付款金额，不要付错，否则无法发货！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">3、若未收到请联系客服，不在线请留言，客服晚点会回复。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">4、若遇到问题请咨询客服，提供购买时填的名字或邮箱给客服查询。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">其他说明：&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">1、我们保证卖给你的每个账号都是全新一手的，只要不违反使用规则不被封号的情况下可以长期使用</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">2，我们严格管理已卖出的账号即时删档，都是有相应系统自动删档，绝对不会重复卖一个账号给第二个人</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">3，买到账号后发什么，怎么操作，效果好不好，这些关系到多方面的因素不是我们能控制的。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">4，购买后请立即去管理中心修改密码，未修改密码造成账号丢失我们概不负责</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">5，账号登录使用过，因不当操作导致被封号等不在售后范围&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">6.&nbsp; 严禁利用本站所出售账号实行任何违法行为.</p><p style=\"margin-top: 0px; margin-bottom: 9px;\"><br/></p><p><br/></p>', 1, 0, 188, NULL, 105, NULL, NULL, NULL, NULL, NULL),
(107, 30, 'fixed', '[]', '[]', NULL, 'zalo账号|3-6月号|', 0, 158, '/uploads/20241211/b4cb285f87292796c46e7ec11485b713.jpg', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">账号发货格式：账号---密码---辅助邮箱---邮箱密码</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">发货说明：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">1、购买ZALO账号USDT付款，网站自动发货，付款后不要关闭网站！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">2、购买ZALO账号USDT付款请仔细看付款金额，不要付错，否则无法发货！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">3、若未收到请联系客服，不在线请留言，客服晚点会回复。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">4、若遇到问题请咨询客服，提供购买时填的名字或邮箱给客服查询。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">其他说明：&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">1、我们保证卖给你的每个账号都是全新一手的，只要不违反使用规则不被封号的情况下可以长期使用</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">2，我们严格管理已卖出的账号即时删档，都是有相应系统自动删档，绝对不会重复卖一个账号给第二个人</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">3，买到账号后发什么，怎么操作，效果好不好，这些关系到多方面的因素不是我们能控制的。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">4，购买后请立即去管理中心修改密码，未修改密码造成账号丢失我们概不负责</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">5，账号登录使用过，因不当操作导致被封号等不在售后范围&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">6.&nbsp; 严禁利用本站所出售账号实行任何违法行为.</p><p style=\"margin-top: 0px; margin-bottom: 9px;\"><br/></p><p><br/></p>', 1, 0, 265, NULL, 106, NULL, NULL, NULL, NULL, NULL),
(108, 30, 'fixed', '[]', '[]', NULL, 'zalo满月号', 0, 247, '/uploads/20241211/b4cb285f87292796c46e7ec11485b713.jpg', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">账号发货格式：账号---密码---辅助邮箱---邮箱密码</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">发货说明：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">1、购买ZALO账号USDT付款，网站自动发货，付款后不要关闭网站！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">2、购买ZALO账号USDT付款请仔细看付款金额，不要付错，否则无法发货！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">3、若未收到请联系客服，不在线请留言，客服晚点会回复。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">4、若遇到问题请咨询客服，提供购买时填的名字或邮箱给客服查询。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">其他说明：&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">1、我们保证卖给你的每个账号都是全新一手的，只要不违反使用规则不被封号的情况下可以长期使用</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">2，我们严格管理已卖出的账号即时删档，都是有相应系统自动删档，绝对不会重复卖一个账号给第二个人</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">3，买到账号后发什么，怎么操作，效果好不好，这些关系到多方面的因素不是我们能控制的。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">4，购买后请立即去管理中心修改密码，未修改密码造成账号丢失我们概不负责</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">5，账号登录使用过，因不当操作导致被封号等不在售后范围&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">6.&nbsp; 严禁利用本站所出售账号实行任何违法行为.</p><p style=\"margin-top: 0px; margin-bottom: 9px;\"><br/></p><p><br/></p>', 1, 0, 135, NULL, 107, NULL, NULL, NULL, NULL, NULL),
(109, 30, 'fixed', '[]', '[]', NULL, 'zalo新号', 0, 154, '/uploads/20241211/b4cb285f87292796c46e7ec11485b713.jpg', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">账号发货格式：账号---密码---辅助邮箱---邮箱密码</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">发货说明：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">1、购买ZALO账号USDT付款，网站自动发货，付款后不要关闭网站！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">2、购买ZALO账号USDT付款请仔细看付款金额，不要付错，否则无法发货！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">3、若未收到请联系客服，不在线请留言，客服晚点会回复。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">4、若遇到问题请咨询客服，提供购买时填的名字或邮箱给客服查询。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">其他说明：&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">1、我们保证卖给你的每个账号都是全新一手的，只要不违反使用规则不被封号的情况下可以长期使用</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">2，我们严格管理已卖出的账号即时删档，都是有相应系统自动删档，绝对不会重复卖一个账号给第二个人</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">3，买到账号后发什么，怎么操作，效果好不好，这些关系到多方面的因素不是我们能控制的。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">4，购买后请立即去管理中心修改密码，未修改密码造成账号丢失我们概不负责</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">5，账号登录使用过，因不当操作导致被封号等不在售后范围&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">6.&nbsp; 严禁利用本站所出售账号实行任何违法行为.</p><p style=\"margin-top: 0px; margin-bottom: 9px;\"><br/></p><p><br/></p>', 1, 0, 265, NULL, 108, NULL, NULL, NULL, NULL, NULL),
(110, 28, 'fixed', '[]', '[]', NULL, '最强聊天记录提取！（下单后请联系客服）', 0, 3, '/uploads/20241211/3af2bf75aa9da0741cb82c8e17a5e350.jpg', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 9px; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap: wrap;\"><strong><span style=\"color: rgb(255, 0, 0);\">请根据客服沟通指引下单，请勿乱拍！</span></strong></p><p style=\"margin-top: 0px; margin-bottom: 9px; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap: wrap;\"><strong><span style=\"color: rgb(255, 0, 0);\">请根据客服沟通指引下单，请勿乱拍！</span></strong></p><p style=\"margin-top: 0px; margin-bottom: 9px; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap: wrap;\"><strong><span style=\"color: rgb(255, 0, 0);\">请根据客服沟通指引下单，请勿乱拍！</span></strong></p><p><br/></p>', 1, 0, 99999, NULL, 109, NULL, NULL, NULL, NULL, NULL),
(111, 28, 'fixed', '[]', '[]', NULL, '微信好友提取（下单后请联系客服）', 0, 8, '/uploads/20241211/80f40ffaa9cb92f47ec6c2efcb9c7c94.jpg', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 9px; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap: wrap;\"><strong><span style=\"color: rgb(255, 0, 0);\">请根据客服沟通指引下单，请勿乱拍！</span></strong></p><p style=\"margin-top: 0px; margin-bottom: 9px; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap: wrap;\"><strong><span style=\"color: rgb(255, 0, 0);\">请根据客服沟通指引下单，请勿乱拍！</span></strong></p><p style=\"margin-top: 0px; margin-bottom: 9px; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap: wrap;\"><strong><span style=\"color: rgb(255, 0, 0);\">请根据客服沟通指引下单，请勿乱拍！</span></strong></p><p><br/></p>', 1, 0, 99999, NULL, 110, NULL, NULL, NULL, NULL, NULL),
(112, 28, 'fixed', '[]', '[]', NULL, 'QQ好友提取（下单后请联系客服）', 0, 4, '/uploads/20241211/2efcbd0467ea97030a37ad89a0c40871.jpg', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 9px; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap: wrap;\"><strong><span style=\"color: rgb(255, 0, 0);\">请根据客服沟通指引下单，请勿乱拍！</span></strong></p><p style=\"margin-top: 0px; margin-bottom: 9px; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap: wrap;\"><strong><span style=\"color: rgb(255, 0, 0);\">请根据客服沟通指引下单，请勿乱拍！</span></strong></p><p style=\"margin-top: 0px; margin-bottom: 9px; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap: wrap;\"><strong><span style=\"color: rgb(255, 0, 0);\">请根据客服沟通指引下单，请勿乱拍！</span></strong></p><p><br/></p>', 1, 0, 99999, NULL, 111, NULL, NULL, NULL, NULL, NULL),
(113, 14, 'fixed', '[]', '[]', NULL, '开房记录查询', 0, 15, '/uploads/20241211/ff883a68b647e574132420d59251dafe.jpg', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 9px; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap: wrap;\"><strong><span style=\"color: rgb(255, 0, 0);\">请根据客服沟通指引下单，请勿乱拍！</span></strong></p><p style=\"margin-top: 0px; margin-bottom: 9px; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap: wrap;\"><strong><span style=\"color: rgb(255, 0, 0);\">请根据客服沟通指引下单，请勿乱拍！</span></strong></p><p style=\"margin-top: 0px; margin-bottom: 9px; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap: wrap;\"><strong><span style=\"color: rgb(255, 0, 0);\">请根据客服沟通指引下单，请勿乱拍！</span></strong></p><p><br/></p>', 1, 0, 99999, NULL, 112, NULL, NULL, NULL, NULL, NULL),
(114, 28, 'fixed', '[]', '[]', NULL, 'sdk.dpi，网提，爬虫（下单后请联系客服）', 0, 8, '/uploads/20241211/500f8989c6a83f764c1646067684346c.jpg', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 9px; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap: wrap;\"><strong><span style=\"color: rgb(255, 0, 0);\">请根据客服沟通指引下单，请勿乱拍！</span></strong></p><p style=\"margin-top: 0px; margin-bottom: 9px; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap: wrap;\"><strong><span style=\"color: rgb(255, 0, 0);\">请根据客服沟通指引下单，请勿乱拍！</span></strong></p><p style=\"margin-top: 0px; margin-bottom: 9px; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap: wrap;\"><strong><span style=\"color: rgb(255, 0, 0);\">请根据客服沟通指引下单，请勿乱拍！</span></strong></p><p><br/></p>', 1, 0, 99999, NULL, 113, NULL, NULL, NULL, NULL, NULL),
(115, 28, 'fixed', '[]', '[]', NULL, '波场靓号订制（下单后请联系客服）', 0, 35, '/uploads/20241211/4d27a6aa12e57ec24e3e688bdf23d813.jpg', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 9px; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap: wrap;\"><strong><span style=\"color: rgb(255, 0, 0);\">请根据客服沟通指引下单，请勿乱拍！</span></strong></p><p style=\"margin-top: 0px; margin-bottom: 9px; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap: wrap;\"><strong><span style=\"color: rgb(255, 0, 0);\">请根据客服沟通指引下单，请勿乱拍！</span></strong></p><p style=\"margin-top: 0px; margin-bottom: 9px; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap: wrap;\"><strong><span style=\"color: rgb(255, 0, 0);\">请根据客服沟通指引下单，请勿乱拍！</span></strong></p><p><br/></p>', 1, 0, 99999, NULL, 114, NULL, NULL, NULL, NULL, NULL),
(116, 28, 'fixed', '[]', '[]', NULL, '888 随机号 不带 4 租用一个月（拍下请及时联系客服）', 0, 9, '/uploads/20241211/5e27f40b1589660098a75cd7ec316619.jpg', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 9px; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap: wrap;\"><strong><span style=\"color: rgb(255, 0, 0);\">请根据客服沟通指引下单，请勿乱拍！</span></strong></p><p style=\"margin-top: 0px; margin-bottom: 9px; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap: wrap;\"><strong><span style=\"color: rgb(255, 0, 0);\">请根据客服沟通指引下单，请勿乱拍！</span></strong></p><p style=\"margin-top: 0px; margin-bottom: 9px; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap: wrap;\"><strong><span style=\"color: rgb(255, 0, 0);\">请根据客服沟通指引下单，请勿乱拍！</span></strong></p><p><br/></p>', 1, 0, 99999, NULL, 115, NULL, NULL, NULL, NULL, NULL),
(117, 11, 'fixed', '[]', '[]', NULL, '快手实名号', 0, 165, '/uploads/20241211/1eaba7882faf620e144b43a300773b98.jpg', NULL, 0, NULL, NULL, 1, 0, 182, NULL, 116, NULL, NULL, NULL, NULL, NULL),
(118, 12, 'fixed', '[]', '[]', NULL, '抖音礼物号', 0, 160, '/uploads/20241211/b15e989bcfa72aec9d3bf5b430fd8b5e.jpg', NULL, 0, NULL, NULL, 1, 0, 162, NULL, 117, NULL, NULL, NULL, NULL, NULL),
(119, 14, 'fixed', '[]', '[]', NULL, '查档服务（综合服务请直接联系客服）', 0, 20, '/uploads/20241211/0da36d421e7ff13496c96b58369da46a.jpg', NULL, 0, NULL, NULL, 1, 0, 99999, NULL, 118, NULL, NULL, NULL, NULL, NULL),
(120, 28, 'fixed', '[]', '[]', NULL, '六合彩特码（拍下后请联系客服）', 0, 16, '/uploads/20241213/69f055ac9d6cd319742db1819fdccf2a.jpeg', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 9px; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap: wrap;\"><strong><span style=\"color: rgb(255, 0, 0);\">请根据客服沟通指引下单，请勿乱拍！</span></strong></p><p style=\"margin-top: 0px; margin-bottom: 9px; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap: wrap;\"><strong><span style=\"color: rgb(255, 0, 0);\">请根据客服沟通指引下单，请勿乱拍！</span></strong></p><p style=\"margin-top: 0px; margin-bottom: 9px; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap: wrap;\"><strong><span style=\"color: rgb(255, 0, 0);\">请根据客服沟通指引下单，请勿乱拍！</span></strong></p><p><br/></p>', 1, 0, 99999, NULL, 119, NULL, NULL, NULL, NULL, NULL),
(121, 28, 'fixed', '[]', '[]', NULL, 'TRX特价兑换', 0, 38, '/uploads/20241213/815fe12b63094a084f8ee0a51159d42b.jpg', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 9px; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap: wrap;\"><strong><span style=\"color: rgb(255, 0, 0);\">请根据客服沟通指引下单，请勿乱拍！</span></strong></p><p style=\"margin-top: 0px; margin-bottom: 9px; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap: wrap;\"><strong><span style=\"color: rgb(255, 0, 0);\">请根据客服沟通指引下单，请勿乱拍！</span></strong></p><p style=\"margin-top: 0px; margin-bottom: 9px; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap: wrap;\"><strong><span style=\"color: rgb(255, 0, 0);\">请根据客服沟通指引下单，请勿乱拍！</span></strong></p><p><span style=\"color:#ffc000\">当前汇率1U=6TRX！</span></p>', 1, 0, 99999, NULL, 120, NULL, NULL, NULL, NULL, NULL),
(122, 42, 'fixed', '[]', '[]', NULL, 'Pairs 定制号 拍下发资料给客服-pairs账号批发', 0, 25, '/uploads/20241213/f6ce06b302a7929bbacff53e43957fc7.png', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">账号格式为：账号—-密码—-邮箱—-邮箱密码</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">1、购号仅支持USDT付款，网站自动发货，付款后不要关闭网站！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">2、购号USDT付款请仔细看付款金额，不要付错，否则无法发货！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">3、若未收到请联系客服，不在线请留言，客服晚点会回复。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">4、若遇到问题请咨询客服，提供购买时填的名字或邮箱给客服查询。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">其他说明：&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">1、我们保证卖给你的每个账号都是全新一手的，只要不违反使用规则不被封号的情况下可以长期使用</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">2，我们严格管理已卖出的账号即时删档，都是有相应系统自动删档，绝对不会重复卖一个账号给第二个人</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">3，买到账号后发什么，怎么操作，效果好不好，这些关系到多方面的因素不是我们能控制的。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">4，购买后请立即去管理中心修改密码，未修改密码造成账号丢失我们概不负责</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">5，账号登录使用过，因不当操作导致被封号等不在售后范围&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">6.&nbsp; 严禁利用本站所出售账号实行任何违法行为</p><p><br/></p>', 1, 0, 263, NULL, 121, NULL, NULL, NULL, NULL, NULL),
(123, 42, 'fixed', '[]', '[]', NULL, 'Pairs成品号-pairs账号批发', 0, 53, '/uploads/20241213/f6ce06b302a7929bbacff53e43957fc7.png', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">账号格式为：账号—-密码—-邮箱—-邮箱密码</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">1、购买账号仅支持USDT付款，网站自动发货，付款后不要关闭网站！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">2、购号USDT付款请仔细看付款金额，不要付错，否则无法发货！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">3、若未收到请联系客服，不在线请留言，客服晚点会回复。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">4、若遇到问题请咨询客服，提供购买时填的邮箱给客服查询。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">其他说明：&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">1、我们保证卖给你的每个账号都是全新一手的，只要不违反使用规则不被封号的情况下可以长期使用</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">2，我们严格管理已卖出的账号即时删档，都是有相应系统自动删档，绝对不会重复卖一个账号给第二个人</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">3，买到账号后发什么，怎么操作，效果好不好，这些关系到多方面的因素不是我们能控制的。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">4，购买后请立即去管理中心修改密码，未修改密码造成账号丢失我们概不负责</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">5，账号登录使用过，因不当操作导致被封号等不在售后范围&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">6.&nbsp; 严禁利用本站所出售账号实行任何违法行为</p><p><br/></p>', 1, 0, 156, NULL, 122, NULL, NULL, NULL, NULL, NULL),
(124, 42, 'fixed', '[]', '[]', NULL, 'Omiai 定制号 拍下发资料给客服-omiai账号批发', 0, 25, '/uploads/20241213/c73c4fa19c02f10e79c2523c0fb192c6.png', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">账号格式为：账号—-密码—-邮箱—-邮箱密码</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">1、购号仅支持USDT付款，网站自动发货，付款后不要关闭网站！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">2、购号USDT付款请仔细看付款金额，不要付错，否则无法发货！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">3、若未收到请联系客服，不在线请留言，客服晚点会回复。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">4、若遇到问题请咨询客服，提供购买时填的名字或邮箱给客服查询。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">其他说明：&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">1、我们保证卖给你的每个账号都是全新一手的，只要不违反使用规则不被封号的情况下可以长期使用</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">2，我们严格管理已卖出的账号即时删档，都是有相应系统自动删档，绝对不会重复卖一个账号给第二个人</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">3，买到账号后发什么，怎么操作，效果好不好，这些关系到多方面的因素不是我们能控制的。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">4，购买后请立即去管理中心修改密码，未修改密码造成账号丢失我们概不负责</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">5，账号登录使用过，因不当操作导致被封号等不在售后范围&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">6.&nbsp; 严禁利用本站所出售账号实行任何违法行为</p><p style=\"margin-top: 0px; margin-bottom: 9px;\"><br/></p><p><br/></p>', 1, 0, 195, NULL, 123, NULL, NULL, NULL, NULL, NULL),
(125, 42, 'fixed', '[]', '[]', NULL, 'Omiai成品号-omiai账号批发', 0, 12, '/uploads/20241213/c73c4fa19c02f10e79c2523c0fb192c6.png', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">账号格式为：账号—-密码—-邮箱—-邮箱密码</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">1、购号仅支持USDT付款，网站自动发货，付款后不要关闭网站！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">2、购号USDT付款请仔细看付款金额，不要付错，否则无法发货！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">3、若未收到请联系客服，不在线请留言，客服晚点会回复。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">4、若遇到问题请咨询客服，提供购买时填的名字或邮箱给客服查询。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">其他说明：&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">1、我们保证卖给你的每个账号都是全新一手的，只要不违反使用规则不被封号的情况下可以长期使用</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">2，我们严格管理已卖出的账号即时删档，都是有相应系统自动删档，绝对不会重复卖一个账号给第二个人</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">3，买到账号后发什么，怎么操作，效果好不好，这些关系到多方面的因素不是我们能控制的。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">4，购买后请立即去管理中心修改密码，未修改密码造成账号丢失我们概不负责</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">5，账号登录使用过，因不当操作导致被封号等不在售后范围&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">6.&nbsp; 严禁利用本站所出售账号实行任何违法行为</p><p style=\"margin-top: 0px; margin-bottom: 9px;\"><br/></p><p><br/></p>', 1, 0, 12, NULL, 124, NULL, NULL, NULL, NULL, NULL),
(126, 42, 'fixed', '[]', '[]', NULL, 'Match 定制号 拍下发资料给客服-Match账号批发', 0, 12, '/uploads/20241213/5504afb9a114ea90ec1274076c38de3f.png', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">账号发货格式：账号(邮箱)----密码(邮箱密码)</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">1、购买账号USDT付款，网站自动发货，付款后不要关闭网站！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">2、购买账号USDT付款请仔细看付款金额，不要付错，否则无法发货！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">3、若未收到请联系客服，不在线请留言，客服晚点会回复。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">4、若遇到问题请咨询客服，提供购买时填的名字或邮箱给客服查询。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">其他说明：&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">1、我们保证卖给你的每个账号都是全新一手的，只要不违反使用规则不被封号的情况下可以长期使用</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">2，我们严格管理已卖出的账号即时删档，都是有相应系统自动删档，绝对不会重复卖一个账号给第二个人</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">3，买到账号后发什么，怎么操作，效果好不好，这些关系到多方面的因素不是我们能控制的。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">4，购买后请立即去管理中心修改密码，未修改密码造成账号丢失我们概不负责</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">5，账号登录使用过，因不当操作导致被封号等不在售后范围&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">6.&nbsp; 严禁利用本站所出售账号实行任何违法行为</p><p style=\"margin-top: 0px; margin-bottom: 9px;\"><br/></p><p><br/></p>', 1, 0, 22, NULL, 125, NULL, NULL, NULL, NULL, NULL),
(127, 42, 'fixed', '[]', '[]', NULL, 'Match 成品号-Match账号批发', 0, 12, '/uploads/20241213/5504afb9a114ea90ec1274076c38de3f.png', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">账号发货格式：账号(邮箱)----密码(邮箱密码)</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">1、购买账号USDT付款，网站自动发货，付款后不要关闭网站！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">2、购买账号USDT付款请仔细看付款金额，不要付错，否则无法发货！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">3、若未收到请联系客服，不在线请留言，客服晚点会回复。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">4、若遇到问题请咨询客服，提供购买时填的名字或邮箱给客服查询。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">其他说明：&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">1、我们保证卖给你的每个账号都是全新一手的，只要不违反使用规则不被封号的情况下可以长期使用</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">2，我们严格管理已卖出的账号即时删档，都是有相应系统自动删档，绝对不会重复卖一个账号给第二个人</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">3，买到账号后发什么，怎么操作，效果好不好，这些关系到多方面的因素不是我们能控制的。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">4，购买后请立即去管理中心修改密码，未修改密码造成账号丢失我们概不负责</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">5，账号登录使用过，因不当操作导致被封号等不在售后范围&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">6.&nbsp; 严禁利用本站所出售账号实行任何违法行为</p><p style=\"margin-top: 0px; margin-bottom: 9px;\"><br/></p><p><br/></p>', 1, 0, 30, NULL, 126, NULL, NULL, NULL, NULL, NULL),
(128, 42, 'fixed', '[]', '[]', NULL, '爱聊实名一年老号-爱聊账号批发', 0, 1, '/uploads/20241213/7027d7054de006dad4789093a2547328.png', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">账号的格式为：手机号码---密码---电子邮箱---电子邮箱密码。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">发货说明：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">1、请不要在USDT付款后关闭网页，因为我们的网站会自动发送账号给您。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">2、请确认购很多号时，仔细核对USDT付款金额，确保无误，避免错误付款导致无法完成交付。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">3、如果您还没有收到，请联系我们的客服。如果客服不在在线，请留言，我们的客服会尽快回复您。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">4、如有疑问，请联系客服寻求帮助，并提供购买时填写的姓名或电子邮件给客服查询。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">其他说明：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">1.我们承诺，我们所售出的每个账号都是全新的，只要您遵守使用规则避免违规行为，账号将能够长期使用保持不被封禁。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">2.我们对已经销售的账号进行严格管理，立即删除全部档案，请放心，我们的系统会自动进行删除操作，绝对不会再次将同一个账号出售给其他人。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">3.在购很多号后，我们无法控制的因素有很多，例如我们应该发送什么内容，如何操作以及效果如何。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">4.购买后，请立即前往管理中心修改密码，如果未修改密码导致账号丢失，我们将不负任何责任。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">5.如果您的账号因为不当操作而被封号，这将不在我们的售后服务范围内。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">6.禁止利用本网站销售的账号从事任何非法活动。</p><p style=\"margin-top: 0px; margin-bottom: 9px;\"><br/></p><p><br/></p>', 1, 0, 214, NULL, 127, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `goods` (`id`, `category_id`, `type`, `attach`, `wholesale`, `quota`, `name`, `agency_see`, `invented_sales`, `cover`, `images`, `is_sku`, `sku_name`, `detail`, `shelf`, `sales`, `stock`, `start_number`, `weigh`, `unit`, `course`, `pop_content`, `create_time`, `update_time`) VALUES
(129, 42, 'fixed', '[]', '[]', NULL, '网易账号-网易邮箱账号', 0, 12, '/uploads/20241213/06f56f03a1c13e60dac558945e88cfbb.png', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\"><span style=\"margin: 0px; padding: 0px;\">账户的格式：邮箱账号-邮箱密码</span></p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\"><span style=\"margin: 0px; padding: 0px;\">下单后，请自行查看邮件，如长时间未收到，请联系客服。</span></p><p><br/></p>', 1, 0, 245, NULL, 128, NULL, NULL, NULL, NULL, NULL),
(130, 42, 'fixed', '[]', '[]', NULL, '他趣聊天账号', 0, 12, '/uploads/20241213/2e10549fc1d5d3841e318780961c56a7.jpg', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">账户的格式：账号-密码</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">下单后，请自行查看邮件，如长时间未收到，请联系客服。</p><p style=\"margin-top: 0px; margin-bottom: 9px;\"><br/></p><p><br/></p>', 1, 0, 321, NULL, 129, NULL, NULL, NULL, NULL, NULL),
(131, 42, 'fixed', '[]', '[]', NULL, '伊对婚恋账号（女号）', 0, 14, '/uploads/20241213/1101434e51651756f4b394385937c2c7.jpg', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">账户的格式：账号-密码-验证码</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">下单后，请自行查看邮件，如长时间未收到，请联系客服。</p><p><br/></p>', 1, 0, 54, NULL, 130, NULL, NULL, NULL, NULL, NULL),
(132, 42, 'fixed', '[]', '[]', NULL, '伊对婚恋账号（男号）', 0, 25, '/uploads/20241213/1101434e51651756f4b394385937c2c7.jpg', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">账户的格式：账号-密码-验证码</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">下单后，请自行查看邮件，如长时间未收到，请联系客服。</p><p><br/></p>', 1, 0, 44, NULL, 131, NULL, NULL, NULL, NULL, NULL),
(133, 38, 'fixed', '[]', '[]', NULL, '皮皮虾账号', 0, 43, '/uploads/20241213/1cc31c7200c5579028b11fda943be7e7.jpg', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">账户的格式：账号-密码</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">下单后，请自行查看邮件，如长时间未收到，请联系客服</p><p><br/></p>', 1, 0, 124, NULL, 132, NULL, NULL, NULL, NULL, NULL),
(134, 42, 'fixed', '[]', '[]', NULL, '西瓜视频账号', 0, 22, '/uploads/20241213/0224cf5c8fd1c7a9ccb42592cd12c6da.jpg', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">账户的格式：账号-密码</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">下单后，请自行查看邮件，如长时间未收到，请联系客服。</p><p><br/></p>', 1, 0, 12, NULL, 133, NULL, NULL, NULL, NULL, NULL),
(135, 42, 'fixed', '[]', '[]', NULL, '今日头条账号', 0, 22, '/uploads/20241213/b055144918cfd094b2813ec7ebf65a97.png', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">账户的格式：账号-密码</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">下单后，请自行查看邮件，如长时间未收到，请联系客服。</p><p><br/></p>', 1, 0, 46, NULL, 134, NULL, NULL, NULL, NULL, NULL),
(136, 42, 'fixed', '[]', '[]', NULL, '哔哩哔哩账号（老号）', 0, 12, '/uploads/20241213/f0cb36a31cbc5a40ff81e5a6df306352.png', NULL, 0, NULL, '<p><span style=\"color: rgb(52, 58, 64); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap;\">下单后，请自行查看邮件，若长时间未收到，请联系客服索取。</span></p>', 1, 0, 124, NULL, 135, NULL, NULL, NULL, NULL, NULL),
(137, 42, 'fixed', '[]', '[]', NULL, '哔哩哔哩账号（新号）', 0, 1, '/uploads/20241213/f0cb36a31cbc5a40ff81e5a6df306352.png', NULL, 0, NULL, '<p><span style=\"color: rgb(52, 58, 64); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap;\">下单后，请自行查看邮件，若长时间未收到，请联系客服索取。</span></p>', 1, 0, 135, NULL, 136, NULL, NULL, NULL, NULL, NULL),
(138, 42, 'fixed', '[]', '[]', NULL, '知乎账号', 0, 23, '/uploads/20241213/e9a2faa4a4c6dd45d7b09c0764542022.jpg', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">账户的格式：账号-密码</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">下单后，请自行查看邮件，如长时间未收到，请联系客服。</p><p><br/></p>', 1, 0, 154, NULL, 137, NULL, NULL, NULL, NULL, NULL),
(139, 42, 'fixed', '[]', '[]', NULL, '豆瓣账号', 0, 12, '/uploads/20241213/78dac5a840c2f7cc2b4566148f62620c.jpg', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">账户的格式：账号-密码</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">下单后，请自行查看邮件，如长时间未收到，请联系客服。</p><p><br/></p>', 1, 0, 155, NULL, 138, NULL, NULL, NULL, NULL, NULL),
(140, 42, 'fixed', '[]', '[]', NULL, '58同城账号', 0, 5, '/uploads/20241213/f119ea12ba7ce18add5c426f8940e785.jpg', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">账户的格式：账号-密码</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">下单后，请自行查看邮件，如长时间未收到，请联系客服。</p><p><br/></p>', 1, 0, 86, NULL, 139, NULL, NULL, NULL, NULL, NULL),
(141, 42, 'fixed', '[]', '[]', NULL, '百度账号-百度极速版账号', 0, 24, '/uploads/20241213/80b8a3ea4599602758992cef77aed3b5.png', NULL, 0, NULL, '<p><span style=\"color: rgb(52, 58, 64); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap;\">下单后，请自行查看邮件，若长时间未收到，请联系客服索取。</span></p>', 1, 0, 86, NULL, 140, NULL, NULL, NULL, NULL, NULL),
(142, 42, 'fixed', '[]', '[]', NULL, '微博2000粉(真实粉丝)-微博账号批发', 0, 76, '/uploads/20241213/18b3e6da143dabc37d903cbedf916634.png', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">账号格式为：以邮箱地址作为用户名，密码</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">Weibo.com是官方微博网站。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">就微博账号的发货问题，我们进行以下说明：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">1、请确保在付款之前不要关闭网站，购买USDT账号后，网站将自动发货。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">2、购买账号用USDT付款时，请务必认真核对付款金额，以避免不必要的付款错误。否则，我们将无法将货物发给您！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">3、如若您还未收到，请联系客服。如客服人员不在线，请留言，稍后客服会给您回复。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">4、如果你碰到困难，可以向客服咨询，并提供你购买时填写的姓名或电子邮箱作为查询信息。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">其他说明：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">1、我们保证每个账号仅为您个人使用，只要您遵守网站管理规定，账号将长期有效，不必担心被封禁。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">2.我们严格管理已经售出的账号，一经售出立即执行删除操作，并确保系统自动删除账号，绝不会重复转售给其他人。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">当您购买账号后，我们无法控制一些因素，包括发送的内容、操作方式以及效果好坏，请综合考虑这些因素的多个影响。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">请您在购买后立即前往管理中心修改密码，为了避免因未修改密码而导致账号丢失，我们无法承担任何责任。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">如果因为不当操作而导致账号被封禁或出现其他问题，我们将无法为您提供售后服务。</p><p><br/></p>', 1, 0, 87, NULL, 141, NULL, NULL, NULL, NULL, NULL),
(143, 42, 'fixed', '[]', '[]', NULL, '微博老号信用分510以上6至9级-微博账号批发', 0, 54, '/uploads/20241213/18b3e6da143dabc37d903cbedf916634.png', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">登录名和密码将以电子邮件地址进行设置。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">Weibo.Com是一个经过官方认证的微博平台网站。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">关于您的微博账号发货问题，我们向您提供以下解释和说明：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">1、在付款之前，请确保不关闭网页。一旦购买USDT账号，网页系统将自动发货。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">2、在购买USDT账户时，请务必仔细确认支付金额，以避免发生不必要的支付错误。若否，则我们将无法为您提供发货服务！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">3、如果您还没有收到任何消息，请主动联系客服部门。如果客服人员暂时不在线，您可以选择留言，客服将在稍后回复您。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">4、如果您遇到问题时，可以咨询我们的客服人员。在购买商品时，请提供您填写的姓名或电子邮件作为检索信息。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">其他表明：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">1、只要您遵守我们网站的管理规定，我们确保每个账户仅供个人使用，并且这个账户将长时间有效，您不必担心被屏蔽的问题。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">2.对已出售的用户账户，我们有非常严格的要求。一旦账户售出，我们会立即删除这些账户，确保它们被永久删除，绝不再转售给他人。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">在购买账户时，有许多因素我们无法掌控，例如发送内容、运营方式以及效果等等。因此，在做出决策之前，请充分考虑这些因素对于账户的影响。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">购买后请立即联系管理员更改密码，以免造成账户丢失，对于由于未及时更改密码而引发的问题，我们概不负责。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">如果你的账户被封禁或遇到其他问题是因为你的操作不正确，我们将无法为你提供售后服务。</p><p><br/></p>', 1, 0, 88, NULL, 142, NULL, NULL, NULL, NULL, NULL),
(144, 42, 'fixed', '[]', '[]', NULL, '微博白号-微博账号批发', 0, 24, '/uploads/20241213/18b3e6da143dabc37d903cbedf916634.png', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">账号将使用电子邮件地址设置登录名和密码。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">Weibo.Com是一个已经通过官方网站认证的微博平台网站。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">关于您的微博账号发货问题，我们为您提供以下解释和说明：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">1、付款前请勿关闭网页，购买USDT账号后，网页系统会自动发送货物。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">2、在购买USDT账户时，请仔细检查付款金额，以避免不必要的付款错误。如果我们不这样做，我们将无法为您提供交付服务！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">3、如果您还没有收到任何通知，请联系客户服务部。如果客户服务人员暂时无法上网，您可以选择留言，客户服务将稍后回复您。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">4、如有问题，请咨询我们的客户服务人员。购买商品时，请提供您填写的名称或电子邮件作为搜索信息。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">其他说明：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">1、只要您遵循我们网站的管理规范，我们确保每个账户只能由个人使用，账户的有效期将非常长。你不必担心被屏蔽。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">2.我们对已售出的用户账户有非常严格的要求。一旦账户被出售，我们将立即删除这些账户，以确保它们被永久删除，并且永远不会再出售给其他人。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">在购买账户之前，有很多我们无法控制的因素，比如发送内容、操作模式和效果。因此，在做出决定之前，请仔细考虑各种因素对账户的影响。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">购买后，请立即联系管理员修改密码，以免丢失您的帐户。我们将不对因未能及时修改密码而造成的任何问题负责。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">假设您因操作失误而遇到帐户被封禁或其它问题，对不起，我们不能为您提供售后服务。</p><p style=\"margin-top: 0px; margin-bottom: 9px;\"><br/></p><p><br/></p>', 1, 0, 145, NULL, 143, NULL, NULL, NULL, NULL, NULL),
(145, 42, 'fixed', '[]', '[]', NULL, 'ChatGPT-4 Plus 账号购买 | Plus会员订阅 | 单人独享 | 1个月售后 | 正规卡充值 | 到期可续费', 0, 25, '/uploads/20241213/b037189b688f20e159da635f197029ac.png', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">关于售后：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">1）售后时间为24小时，请在24小时内对账号进行检查，超过24小时概不负责；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">2）包首登，其他不包，比如加人打招呼这些，不在售后范围内；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">3）个人操作引起的异常不售后。个人操作指修改资料、加好友，引流变现等；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">4）对功能细节的使用不负责。即能做什么，不能做什么，需要自己测试，比如能不能加好友打招呼，等等；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">5）售后请联系客服，必须提供以下3点：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">a）订单编号，如果订单中有多个账号，需指明是哪几个账号需要售后；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">b）存在什么问题，说清楚问题现象；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">c）问题截图</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">6）售后问题一般会在24小时内给出答复，如果超过24小时没有收到回复，请提醒，没有超过24小时，请勿催促，所有售后问题都会排队处理</p><p><br/></p>', 1, 0, 130, NULL, 144, NULL, NULL, NULL, NULL, NULL),
(146, 42, 'fixed', '[]', '[]', NULL, 'ChatGPT内含120美金账号购买 | 带账号 | GPT-3.5 | 1个月售后 | 支持改密 | 封号免费换新', 0, 5, '/uploads/20241213/b037189b688f20e159da635f197029ac.png', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">关于售后：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">1）售后时间为24小时，请在24小时内对账号进行检查，超过24小时概不负责；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">2）包首登，其他不包，比如加人打招呼这些，不在售后范围内；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">3）个人操作引起的异常不售后。个人操作指修改资料、加好友，引流变现等；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">4）对功能细节的使用不负责。即能做什么，不能做什么，需要自己测试，比如能不能加好友打招呼，等等；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">5）售后请联系客服，必须提供以下3点：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">a）订单编号，如果订单中有多个账号，需指明是哪几个账号需要售后；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">b）存在什么问题，说清楚问题现象；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">c）问题截图</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">6）售后问题一般会在24小时内给出答复，如果超过24小时没有收到回复，请提醒，没有超过24小时，请勿催促，所有售后问题都会排队处理。</p><p style=\"margin-top: 0px; margin-bottom: 9px;\"><br/></p><p><br/></p>', 1, 0, 54, NULL, 145, NULL, NULL, NULL, NULL, NULL),
(147, 42, 'fixed', '[]', '[]', NULL, 'ChatGPT内含120美金API-Key购买 | GPT-3.5 | 程序开发接口调用 | 单卡单号 | 24小时售后', 0, 5, '/uploads/20241213/b037189b688f20e159da635f197029ac.png', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">关于售后：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">1）售后时间为24小时，请在24小时内对账号进行检查，超过24小时概不负责；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">2）包首登，其他不包，比如加人打招呼这些，不在售后范围内；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">3）个人操作引起的异常不售后。个人操作指修改资料、加好友，引流变现等；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">4）对功能细节的使用不负责。即能做什么，不能做什么，需要自己测试，比如能不能加好友打招呼，等等；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">5）售后请联系客服，必须提供以下3点：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">a）订单编号，如果订单中有多个账号，需指明是哪几个账号需要售后；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">b）存在什么问题，说清楚问题现象；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">c）问题截图</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">6）售后问题一般会在24小时内给出答复，如果超过24小时没有收到回复，请提醒，没有超过24小时，请勿催促，所有售后问题都会排队处理。</p><p><br/></p>', 1, 0, 55, NULL, 146, NULL, NULL, NULL, NULL, NULL),
(148, 42, 'fixed', '[]', '[]', NULL, 'ChatGPT内含120美金账号购买 | 带账号 | GPT-3.5 | 24小时内售后 | 支持改密', 0, 4, '/uploads/20241213/b037189b688f20e159da635f197029ac.png', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">关于售后：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">1）售后时间为24小时，请在24小时内对账号进行检查，超过24小时概不负责；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">2）包首登，其他不包，比如加人打招呼这些，不在售后范围内；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">3）个人操作引起的异常不售后。个人操作指修改资料、加好友，引流变现等；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">4）对功能细节的使用不负责。即能做什么，不能做什么，需要自己测试，比如能不能加好友打招呼，等等；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">5）售后请联系客服，必须提供以下3点：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">a）订单编号，如果订单中有多个账号，需指明是哪几个账号需要售后；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">b）存在什么问题，说清楚问题现象；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">c）问题截图</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">6）售后问题一般会在24小时内给出答复，如果超过24小时没有收到回复，请提醒，没有超过24小时，请勿催促，所有售后问题都会排队处理。</p><p style=\"margin-top: 0px; margin-bottom: 9px;\"><br/></p><p><br/></p>', 1, 0, 124, NULL, 147, NULL, NULL, NULL, NULL, NULL),
(149, 42, 'fixed', '[]', '[]', NULL, 'Openai API代付账单充值｜GPT4/GPT3.5｜120刀｜大额度', 0, 1, '/uploads/20241213/b037189b688f20e159da635f197029ac.png', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">关于售后：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">1）售后时间为24小时，请在24小时内对账号进行检查，超过24小时概不负责；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">2）包首登，其他不包，比如加人打招呼这些，不在售后范围内；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">3）个人操作引起的异常不售后。个人操作指修改资料、加好友，引流变现等；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">4）对功能细节的使用不负责。即能做什么，不能做什么，需要自己测试，比如能不能加好友打招呼，等等；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">5）售后请联系客服，必须提供以下3点：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">a）订单编号，如果订单中有多个账号，需指明是哪几个账号需要售后；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">b）存在什么问题，说清楚问题现象；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">c）问题截图</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">6）售后问题一般会在24小时内给出答复，如果超过24小时没有收到回复，请提醒，没有超过24小时，请勿催促，所有售后问题都会排队处理。</p><p style=\"margin-top: 0px; margin-bottom: 9px;\"><br/></p><p><br/></p>', 1, 0, 244, NULL, 148, NULL, NULL, NULL, NULL, NULL),
(150, 42, 'fixed', '[]', '[]', NULL, 'WeChat海外微信 【8-15天新号】', 0, 43, '/uploads/20241213/b5008fb18d055d64165111ac3abff5bd.webp', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">关于售后：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">1）售后时间为24小时，请在24小时内对账号进行检查，超过24小时概不负责；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">2）包首登，其他不包，比如加人打招呼这些，不在售后范围内；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">3）个人操作引起的异常不售后。个人操作指修改资料、加好友，引流变现等；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">4）对功能细节的使用不负责。即能做什么，不能做什么，需要自己测试，比如能不能加好友打招呼，等等；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">5）售后请联系客服，必须提供以下3点：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">a）订单编号，如果订单中有多个账号，需指明是哪几个账号需要售后；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">b）存在什么问题，说清楚问题现象；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">c）问题截图</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">6）售后问题一般会在24小时内给出答复，如果超过24小时没有收到回复，请提醒，没有超过24小时，请勿催促，所有售后问题都会排队处理。</p><p style=\"margin-top: 0px; margin-bottom: 9px;\"><br/></p><p><br/></p>', 1, 0, 137, NULL, 149, NULL, NULL, NULL, NULL, NULL),
(151, 42, 'fixed', '[]', '[]', NULL, 'WeChat海外微信 【满月号号】', 0, 55, '/uploads/20241213/b5008fb18d055d64165111ac3abff5bd.webp', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">关于售后：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">1）售后时间为24小时，请在24小时内对账号进行检查，超过24小时概不负责；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">2）包首登，其他不包，比如加人打招呼这些，不在售后范围内；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">3）个人操作引起的异常不售后。个人操作指修改资料、加好友，引流变现等；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">4）对功能细节的使用不负责。即能做什么，不能做什么，需要自己测试，比如能不能加好友打招呼，等等；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">5）售后请联系客服，必须提供以下3点：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">a）订单编号，如果订单中有多个账号，需指明是哪几个账号需要售后；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">b）存在什么问题，说清楚问题现象；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">c）问题截图</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">6）售后问题一般会在24小时内给出答复，如果超过24小时没有收到回复，请提醒，没有超过24小时，请勿催促，所有售后问题都会排队处理。</p><p><br/></p>', 1, 0, 123, NULL, 150, NULL, NULL, NULL, NULL, NULL),
(152, 42, 'fixed', '[]', '[]', NULL, 'WeChat海外微信 【半年号】', 0, 75, '/uploads/20241213/b5008fb18d055d64165111ac3abff5bd.webp', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">关于售后：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">1）售后时间为24小时，请在24小时内对账号进行检查，超过24小时概不负责；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">2）包首登，其他不包，比如加人打招呼这些，不在售后范围内；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">3）个人操作引起的异常不售后。个人操作指修改资料、加好友，引流变现等；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">4）对功能细节的使用不负责。即能做什么，不能做什么，需要自己测试，比如能不能加好友打招呼，等等；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">5）售后请联系客服，必须提供以下3点：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">a）订单编号，如果订单中有多个账号，需指明是哪几个账号需要售后；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">b）存在什么问题，说清楚问题现象；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">c）问题截图</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">6）售后问题一般会在24小时内给出答复，如果超过24小时没有收到回复，请提醒，没有超过24小时，请勿催促，所有售后问题都会排队处理。</p><p style=\"margin-top: 0px; margin-bottom: 9px;\"><br/></p><p><br/></p>', 1, 0, 176, NULL, 151, NULL, NULL, NULL, NULL, NULL),
(153, 42, 'fixed', '[]', '[]', NULL, 'WeChat海外微信 【一年以上老号】', 0, 25, '/uploads/20241213/b5008fb18d055d64165111ac3abff5bd.webp', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">关于售后：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">1）售后时间为24小时，请在24小时内对账号进行检查，超过24小时概不负责；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">2）包首登，其他不包，比如加人打招呼这些，不在售后范围内；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">3）个人操作引起的异常不售后。个人操作指修改资料、加好友，引流变现等；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">4）对功能细节的使用不负责。即能做什么，不能做什么，需要自己测试，比如能不能加好友打招呼，等等；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">5）售后请联系客服，必须提供以下3点：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">a）订单编号，如果订单中有多个账号，需指明是哪几个账号需要售后；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">b）存在什么问题，说清楚问题现象；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">c）问题截图</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">6）售后问题一般会在24小时内给出答复，如果超过24小时没有收到回复，请提醒，没有超过24小时，请勿催促，所有售后问题都会排队处理。</p><p style=\"margin-top: 0px; margin-bottom: 9px;\"><br/></p><p><br/></p>', 1, 0, 143, NULL, 152, NULL, NULL, NULL, NULL, NULL),
(154, 42, 'fixed', '[]', '[]', NULL, 'LINE濑账号【满月】 直登号', 0, 243, '/uploads/20241213/0ae62fc347e8f9b612b220bc96085df5.png', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">关于售后：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">1）售后时间为24小时，请在24小时内对账号进行检查，超过24小时概不负责；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">2）包首登，其他不包，比如加人打招呼这些，不在售后范围内；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">3）个人操作引起的异常不售后。个人操作指修改资料、加好友，引流变现等；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">4）对功能细节的使用不负责。即能做什么，不能做什么，需要自己测试，比如能不能加好友打招呼，等等；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">5）售后请联系客服，必须提供以下3点：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">a）订单编号，如果订单中有多个账号，需指明是哪几个账号需要售后；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">b）存在什么问题，说清楚问题现象；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">c）问题截图</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">6）售后问题一般会在24小时内给出答复，如果超过24小时没有收到回复，请提醒，没有超过24小时，请勿催促，所有售后问题都会排队处理。</p><p style=\"margin-top: 0px; margin-bottom: 9px;\"><br/></p><p><br/></p>', 1, 0, 135, NULL, 153, NULL, NULL, NULL, NULL, NULL),
(155, 42, 'fixed', '[]', '[]', NULL, 'LINE濑账号【3-6个月】 直登号', 0, 244, '/uploads/20241213/0ae62fc347e8f9b612b220bc96085df5.png', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">关于售后：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">1）售后时间为24小时，请在24小时内对账号进行检查，超过24小时概不负责；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">2）包首登，其他不包，比如加人打招呼这些，不在售后范围内；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">3）个人操作引起的异常不售后。个人操作指修改资料、加好友，引流变现等；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">4）对功能细节的使用不负责。即能做什么，不能做什么，需要自己测试，比如能不能加好友打招呼，等等；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">5）售后请联系客服，必须提供以下3点：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">a）订单编号，如果订单中有多个账号，需指明是哪几个账号需要售后；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">b）存在什么问题，说清楚问题现象；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">c）问题截图</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">6）售后问题一般会在24小时内给出答复，如果超过24小时没有收到回复，请提醒，没有超过24小时，请勿催促，所有售后问题都会排队处理。</p><p><br/></p>', 1, 0, 56, NULL, 154, NULL, NULL, NULL, NULL, NULL),
(156, 42, 'fixed', '[]', '[]', NULL, 'LINE濑账号 【一年老号】直登号', 0, 124, '/uploads/20241213/0ae62fc347e8f9b612b220bc96085df5.png', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">关于售后：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">1）售后时间为24小时，请在24小时内对账号进行检查，超过24小时概不负责；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">2）包首登，其他不包，比如加人打招呼这些，不在售后范围内；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">3）个人操作引起的异常不售后。个人操作指修改资料、加好友，引流变现等；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">4）对功能细节的使用不负责。即能做什么，不能做什么，需要自己测试，比如能不能加好友打招呼，等等；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">5）售后请联系客服，必须提供以下3点：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">a）订单编号，如果订单中有多个账号，需指明是哪几个账号需要售后；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">b）存在什么问题，说清楚问题现象；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">c）问题截图</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">6）售后问题一般会在24小时内给出答复，如果超过24小时没有收到回复，请提醒，没有超过24小时，请勿催促，所有售后问题都会排队处理。</p><p style=\"margin-top: 0px; margin-bottom: 9px;\"><br/></p><p><br/></p>', 1, 0, 100, NULL, 155, NULL, NULL, NULL, NULL, NULL),
(157, 42, 'fixed', '[]', '[]', NULL, 'line账号（实卡注册独享号）永久稳定不封号', 0, NULL, '/uploads/20241213/0ae62fc347e8f9b612b220bc96085df5.png', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 9px; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); font-weight: bold; letter-spacing: 0.5px;\">台湾line账号（实卡独享号）永久稳定不封号-----价格低廉利润微薄-标价usdt价格</p><h4 style=\"color: rgb(97, 97, 97); margin-right: 0px; margin-left: 0px; font-size: 14px; text-wrap-mode: wrap; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); letter-spacing: 0.5px;\"><span style=\"margin: 0px; padding: 0px; font-weight: bolder;\"><span style=\"margin: 0px; padding: 0px; font-size: 14pt;\">LINE 台湾成品扫码直登</span></span></h4><h4 style=\"color: rgb(97, 97, 97); margin-right: 0px; margin-left: 0px; font-size: 14px; text-wrap-mode: wrap; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); letter-spacing: 0.5px;\"><span style=\"margin: 0px; padding: 0px; font-size: 18.6667px;\">&nbsp; &nbsp;</span>账户名称：LINE</h4><ul class=\" list-paddingleft-2\" style=\"margin-right: 0px; margin-bottom: 1rem; margin-left: 0px; font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px 0px 0px 2rem; color: rgb(52, 58, 64); -webkit-tap-highlight-color: rgba(0, 0, 0, 0); font-weight: bold; letter-spacing: 0.5px;\"><li style=\"margin: 0px; padding: 0px; list-style: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);\"><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px;\">账户语言：可设置。&nbsp;</p></li><li style=\"margin: 0px; padding: 0px; list-style: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);\"><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px;\">账户区域：台湾。</p></li><li style=\"margin: 0px; padding: 0px; list-style: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);\"><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px;\">账户验证：通过台湾号码注册并。</p></li><li style=\"margin: 0px; padding: 0px; list-style: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);\"><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px;\">主要功能：社群OpenChat功能&nbsp; VOOM 动态等等</p></li></ul><h4 style=\"color: rgb(97, 97, 97); margin-right: 0px; margin-left: 0px; font-size: 14px; text-wrap-mode: wrap; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); letter-spacing: 0.5px;\"><span style=\"margin: 0px; padding: 0px; font-size: 14pt;\">LINE成品号登陆流程</span></h4><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); font-weight: bold; letter-spacing: 0.5px;\"><span style=\"margin: 0px; padding: 0px; font-size: 14pt; color: rgb(255, 0, 51);\"><span style=\"margin: 0px; padding: 0px; font-weight: bolder;\">下单后联系网站在线客服或者QQ，客服会向你发送line转移二维码，您直接打开LINE，然后点击扫描二维码登陆！非常简单</span></span></p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); font-weight: bold; letter-spacing: 0.5px;\">注意：你最好准备两个设备，一个专门接收客服发给您的二维码，一个手机专门打开LINE登陆扫码，因为转移二维码有效期非常短 只有十几秒会自动变！</p><h4 style=\"color: rgb(97, 97, 97); margin-right: 0px; margin-left: 0px; font-size: 14px; text-wrap-mode: wrap; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); letter-spacing: 0.5px;\"><span style=\"margin: 0px; padding: 0px; font-size: 14pt;\">LINE使用建议</span></h4><ul class=\" list-paddingleft-2\" style=\"margin-right: 0px; margin-bottom: 1rem; margin-left: 0px; font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px 0px 0px 2rem; color: rgb(52, 58, 64); -webkit-tap-highlight-color: rgba(0, 0, 0, 0); font-weight: bold; letter-spacing: 0.5px;\"><li style=\"margin: 0px; padding: 0px; list-style: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);\"><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px;\">LINE风控严格，请在进入LINE后建议不要频繁搜人加人，更不要进行违规操作发布垃圾信息。</p></li><li style=\"margin: 0px; padding: 0px; list-style: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);\"><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px;\">我们仅对账户登陆后可正常使用担保，后续使用中任何问题均不进行跟踪担保服务。</p></li><li style=\"margin: 0px; padding: 0px; list-style: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);\"><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px;\">LINE仅适用于正常的客户交流 商业客服 跨境电商社交等，请勿将账户用于任何非法目的 。</p></li><li style=\"margin: 0px; padding: 0px; list-style: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);\"><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px;\">LINE登陆后千万不要卸载APP，自动更新没事，不卸载就永久不会掉线，如果要换手机 在LINE设置转移扫描转移二维码码就可以了</p></li></ul><p><br/></p>', 1, 0, 102, NULL, 156, NULL, NULL, NULL, NULL, NULL),
(158, 42, 'fixed', '[]', '[]', NULL, 'line账号（实卡独享号）永久稳定不封号', 0, 212, '/uploads/20241213/0ae62fc347e8f9b612b220bc96085df5.png', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 9px; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);\">泰国line账号（实卡独享号）永久稳定不封号-----价格低廉利润微薄-标价usdt价格</p><h4 style=\"line-height: 1.2; color: rgb(52, 58, 64); margin: 0px 0px 1rem; font-size: 14px; text-wrap-mode: wrap; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);\"><span style=\"margin: 0px; padding: 0px; font-weight: bolder;\"><span style=\"margin: 0px; padding: 0px; font-size: 14pt;\">LINE 泰区号成品扫码直登</span></span></h4><h4 style=\"line-height: 1.2; color: rgb(52, 58, 64); margin: 0px 0px 1rem; font-size: 14px; text-wrap-mode: wrap; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);\"><span style=\"margin: 0px; padding: 0px; font-size: 18.6667px;\">&nbsp; &nbsp;</span>账户名称：LINE</h4><ul class=\" list-paddingleft-2\" style=\"margin-right: 0px; margin-bottom: 1rem; margin-left: 0px; font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px 0px 0px 2rem; color: rgb(52, 58, 64); -webkit-tap-highlight-color: rgba(0, 0, 0, 0);\"><li style=\"margin: 0px; padding: 0px; list-style: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);\"><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px;\">账户语言：可设置。&nbsp;</p></li><li style=\"margin: 0px; padding: 0px; list-style: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);\"><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px;\">账户区域：泰区。</p></li><li style=\"margin: 0px; padding: 0px; list-style: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);\"><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px;\">账户验证：通过泰国号码注册并。</p></li><li style=\"margin: 0px; padding: 0px; list-style: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);\"><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px;\">主要功能：社群OpenChat功能&nbsp; VOOM 动态等等</p></li></ul><h4 style=\"line-height: 1.2; color: rgb(52, 58, 64); margin: 0px 0px 0.5rem; font-size: 1.65rem; text-wrap-mode: wrap; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);\"><span style=\"margin: 0px; padding: 0px; font-size: 14pt;\">LINE成品号登陆流程</span></h4><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);\"><span style=\"margin: 0px; padding: 0px; font-size: 14pt; color: rgb(255, 0, 51);\"><span style=\"margin: 0px; padding: 0px; font-weight: bolder;\">下单后联系网站在线客服或者QQ，客服会向你发送line转移二维码，您直接打开LINE，然后点击扫描二维码登陆！非常简单</span></span></p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);\">注意：你最好准备两个设备，一个专门接收客服发给您的二维码，一个手机专门打开LINE登陆扫码，因为转移二维码有效期非常短 只有十几秒会自动变！</p><h4 style=\"line-height: 1.2; color: rgb(52, 58, 64); margin: 0px 0px 0.5rem; font-size: 1.65rem; text-wrap-mode: wrap; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);\"><span style=\"margin: 0px; padding: 0px; font-size: 14pt;\">LINE使用建议</span></h4><ul class=\" list-paddingleft-2\" style=\"margin-right: 0px; margin-bottom: 1rem; margin-left: 0px; font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px 0px 0px 2rem; color: rgb(52, 58, 64); -webkit-tap-highlight-color: rgba(0, 0, 0, 0);\"><li style=\"margin: 0px; padding: 0px; list-style: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);\"><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px;\">LINE风控严格，请在进入LINE后建议不要频繁搜人加人，更不要进行违规操作发布垃圾信息。</p></li><li style=\"margin: 0px; padding: 0px; list-style: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);\"><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px;\">我们仅对账户登陆后可正常使用担保，后续使用中任何问题均不进行跟踪担保服务。</p></li><li style=\"margin: 0px; padding: 0px; list-style: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);\"><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px;\">LINE仅适用于正常的客户交流 商业客服 跨境电商社交等，请勿将账户用于任何非法目的 。</p></li><li style=\"margin: 0px; padding: 0px; list-style: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);\"><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px;\">LINE登陆后千万不要卸载APP，自动更新没事，不卸载就永久不会掉线，如果要换手机 在LINE设置转移扫描转移二维码码就可以了</p></li></ul><p><br/></p>', 1, 0, 152, NULL, 157, NULL, NULL, NULL, NULL, NULL),
(159, 20, 'fixed', '[]', '[]', NULL, '京东账号新号', 0, 244, '/uploads/20241213/b9390ac16c1068d23a963be31120887c.jpg', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">关于售后：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">1）售后时间为24小时，请在24小时内对账号进行检查，超过24小时概不负责；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">2）包首登，其他不包，比如加人打招呼这些，不在售后范围内；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">3）个人操作引起的异常不售后。个人操作指修改资料、加好友，引流变现等；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">4）对功能细节的使用不负责。即能做什么，不能做什么，需要自己测试，比如能不能加好友打招呼，等等；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">5）售后请联系客服，必须提供以下3点：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">a）订单编号，如果订单中有多个账号，需指明是哪几个账号需要售后；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">b）存在什么问题，说清楚问题现象；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">c）问题截图</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">6）售后问题一般会在24小时内给出答复，如果超过24小时没有收到回复，请提醒，没有超过24小时，请勿催促，所有售后问题都会排队处理。</p><p style=\"margin-top: 0px; margin-bottom: 9px;\"><br/></p><p><br/></p>', 1, 0, 233, NULL, 158, NULL, NULL, NULL, NULL, NULL),
(160, 20, 'fixed', '[]', '[]', NULL, '京东账号1年老号', 0, 211, '/uploads/20241213/b9390ac16c1068d23a963be31120887c.jpg', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">关于售后：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">1）售后时间为24小时，请在24小时内对账号进行检查，超过24小时概不负责；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">2）包首登，其他不包，比如加人打招呼这些，不在售后范围内；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">3）个人操作引起的异常不售后。个人操作指修改资料、加好友，引流变现等；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">4）对功能细节的使用不负责。即能做什么，不能做什么，需要自己测试，比如能不能加好友打招呼，等等；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">5）售后请联系客服，必须提供以下3点：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">a）订单编号，如果订单中有多个账号，需指明是哪几个账号需要售后；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">b）存在什么问题，说清楚问题现象；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">c）问题截图</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">6）售后问题一般会在24小时内给出答复，如果超过24小时没有收到回复，请提醒，没有超过24小时，请勿催促，所有售后问题都会排队处理。</p><p><br/></p>', 1, 0, 166, NULL, 159, NULL, NULL, NULL, NULL, NULL),
(161, 20, 'fixed', '[]', '[]', NULL, '京东账号实名带支付密码', 0, 122, '/uploads/20241213/b9390ac16c1068d23a963be31120887c.jpg', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">关于售后：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">1）售后时间为24小时，请在24小时内对账号进行检查，超过24小时概不负责；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">2）包首登，其他不包，比如加人打招呼这些，不在售后范围内；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">3）个人操作引起的异常不售后。个人操作指修改资料、加好友，引流变现等；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">4）对功能细节的使用不负责。即能做什么，不能做什么，需要自己测试，比如能不能加好友打招呼，等等；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">5）售后请联系客服，必须提供以下3点：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">a）订单编号，如果订单中有多个账号，需指明是哪几个账号需要售后；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">b）存在什么问题，说清楚问题现象；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">c）问题截图</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">6）售后问题一般会在24小时内给出答复，如果超过24小时没有收到回复，请提醒，没有超过24小时，请勿催促，所有售后问题都会排队处理。</p><p><br/></p>', 1, 0, 214, NULL, 160, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `goods` (`id`, `category_id`, `type`, `attach`, `wholesale`, `quota`, `name`, `agency_see`, `invented_sales`, `cover`, `images`, `is_sku`, `sku_name`, `detail`, `shelf`, `sales`, `stock`, `start_number`, `weigh`, `unit`, `course`, `pop_content`, `create_time`, `update_time`) VALUES
(162, 7, 'fixed', '[]', '[]', NULL, '微信公众号：现货（名称随机）现货（名字：XX网络XX科技XX信息XX商贸）', 0, 22, '/uploads/20241213/b7d28d27852dfa5d97cea78019993335.png', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">关于售后：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">1）售后时间为24小时，请在24小时内对账号进行检查，超过24小时概不负责；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">2）包首登，其他不包，比如加人打招呼这些，不在售后范围内；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">3）个人操作引起的异常不售后。个人操作指修改资料、加好友，引流变现等；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">4）对功能细节的使用不负责。即能做什么，不能做什么，需要自己测试，比如能不能加好友打招呼，等等；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">5）售后请联系客服，必须提供以下3点：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">a）订单编号，如果订单中有多个账号，需指明是哪几个账号需要售后；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">b）存在什么问题，说清楚问题现象；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">c）问题截图</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">6）售后问题一般会在24小时内给出答复，如果超过24小时没有收到回复，请提醒，没有超过24小时，请勿催促，所有售后问题都会排队处理。</p><p><br/></p>', 1, 0, 166, NULL, 161, NULL, NULL, NULL, NULL, NULL),
(163, 7, 'fixed', '[]', '[]', NULL, '微信公众号：定制（指定名称）定制（提供指定名称包认证通过 被占用除外）', 0, 22, '/uploads/20241213/b7d28d27852dfa5d97cea78019993335.png', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 0px; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">公众号购买后请联系客服</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">关于售后：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">1）售后时间为24小时，请在24小时内对账号进行检查，超过24小时概不负责；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">2）包首登，其他不包，比如加人打招呼这些，不在售后范围内；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">3）个人操作引起的异常不售后。个人操作指修改资料、加好友，引流变现等；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">4）对功能细节的使用不负责。即能做什么，不能做什么，需要自己测试，比如能不能加好友打招呼，等等；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">5）售后请联系客服，必须提供以下3点：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">a）订单编号，如果订单中有多个账号，需指明是哪几个账号需要售后；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">b）存在什么问题，说清楚问题现象；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">c）问题截图</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">6）售后问题一般会在24小时内给出答复，如果超过24小时没有收到回复，请提醒，没有超过24小时，请勿催促，所有售后问题都会排队处理。</p><p><br/></p>', 1, 0, 124, NULL, 162, NULL, NULL, NULL, NULL, NULL),
(164, 42, 'fixed', '[]', '[]', NULL, '钉钉白号', 0, 12, '/uploads/20241213/b7ff34d240ecb3acde5804995da91cfc.png', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">关于售后：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">1）售后时间为24小时，请在24小时内对账号进行检查，超过24小时概不负责；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">2）包首登，其他不包，比如加人打招呼这些，不在售后范围内；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">3）个人操作引起的异常不售后。个人操作指修改资料、加好友，引流变现等；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">4）对功能细节的使用不负责。即能做什么，不能做什么，需要自己测试，比如能不能加好友打招呼，等等；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">5）售后请联系客服，必须提供以下3点：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">a）订单编号，如果订单中有多个账号，需指明是哪几个账号需要售后；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">b）存在什么问题，说清楚问题现象；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">c）问题截图</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">6）售后问题一般会在24小时内给出答复，如果超过24小时没有收到回复，请提醒，没有超过24小时，请勿催促，所有售后问题都会排队处理。</p><p><br/></p>', 1, 0, 144, NULL, 163, NULL, NULL, NULL, NULL, NULL),
(165, 42, 'fixed', '[]', '[]', NULL, '钉钉满月双认证', 0, 12, '/uploads/20241213/b7ff34d240ecb3acde5804995da91cfc.png', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">关于售后：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">1）售后时间为24小时，请在24小时内对账号进行检查，超过24小时概不负责；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">2）包首登，其他不包，比如加人打招呼这些，不在售后范围内；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">3）个人操作引起的异常不售后。个人操作指修改资料、加好友，引流变现等；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">4）对功能细节的使用不负责。即能做什么，不能做什么，需要自己测试，比如能不能加好友打招呼，等等；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">5）售后请联系客服，必须提供以下3点：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">a）订单编号，如果订单中有多个账号，需指明是哪几个账号需要售后；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">b）存在什么问题，说清楚问题现象；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">c）问题截图</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">6）售后问题一般会在24小时内给出答复，如果超过24小时没有收到回复，请提醒，没有超过24小时，请勿催促，所有售后问题都会排队处理。</p><p><br/></p>', 1, 0, 102, NULL, 164, NULL, NULL, NULL, NULL, NULL),
(166, 42, 'fixed', '[]', '[]', NULL, '钉钉半年双认证', 0, 12, '/uploads/20241213/b7ff34d240ecb3acde5804995da91cfc.png', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">关于售后：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">1）售后时间为24小时，请在24小时内对账号进行检查，超过24小时概不负责；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">2）包首登，其他不包，比如加人打招呼这些，不在售后范围内；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">3）个人操作引起的异常不售后。个人操作指修改资料、加好友，引流变现等；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">4）对功能细节的使用不负责。即能做什么，不能做什么，需要自己测试，比如能不能加好友打招呼，等等；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">5）售后请联系客服，必须提供以下3点：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">a）订单编号，如果订单中有多个账号，需指明是哪几个账号需要售后；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">b）存在什么问题，说清楚问题现象；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">c）问题截图</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">6）售后问题一般会在24小时内给出答复，如果超过24小时没有收到回复，请提醒，没有超过24小时，请勿催促，所有售后问题都会排队处理。</p><p style=\"margin-top: 0px; margin-bottom: 9px;\"><br/></p><p><br/></p>', 1, 0, 201, NULL, 165, NULL, NULL, NULL, NULL, NULL),
(167, 42, 'fixed', '[]', '[]', NULL, '钉钉一年双认证', 0, 11, '/uploads/20241213/b7ff34d240ecb3acde5804995da91cfc.png', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">关于售后：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">1）售后时间为24小时，请在24小时内对账号进行检查，超过24小时概不负责；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">2）包首登，其他不包，比如加人打招呼这些，不在售后范围内；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">3）个人操作引起的异常不售后。个人操作指修改资料、加好友，引流变现等；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">4）对功能细节的使用不负责。即能做什么，不能做什么，需要自己测试，比如能不能加好友打招呼，等等；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">5）售后请联系客服，必须提供以下3点：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">a）订单编号，如果订单中有多个账号，需指明是哪几个账号需要售后；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">b）存在什么问题，说清楚问题现象；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">c）问题截图</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">6）售后问题一般会在24小时内给出答复，如果超过24小时没有收到回复，请提醒，没有超过24小时，请勿催促，所有售后问题都会排队处理。</p><p style=\"margin-top: 0px; margin-bottom: 9px;\"><br/></p><p><br/></p>', 1, 0, 123, NULL, 166, NULL, NULL, NULL, NULL, NULL),
(168, 42, 'fixed', '[]', '[]', NULL, '世纪佳缘白号', 0, 111, '/uploads/20241213/6f5189c10f15d7b05f668a2ab406fbdc.png', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">关于售后：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">1）售后时间为24小时，请在24小时内对账号进行检查，超过24小时概不负责；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">2）包首登，其他不包，比如加人打招呼这些，不在售后范围内；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">3）个人操作引起的异常不售后。个人操作指修改资料、加好友，引流变现等；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">4）对功能细节的使用不负责。即能做什么，不能做什么，需要自己测试，比如能不能加好友打招呼，等等；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">5）售后请联系客服，必须提供以下3点：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">a）订单编号，如果订单中有多个账号，需指明是哪几个账号需要售后；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">b）存在什么问题，说清楚问题现象；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">c）问题截图</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">6）售后问题一般会在24小时内给出答复，如果超过24小时没有收到回复，请提醒，没有超过24小时，请勿催促，所有售后问题都会排队处理。</p><p style=\"margin-top: 0px; margin-bottom: 9px;\"><br/></p><p><br/></p>', 1, 0, 102, NULL, 167, NULL, NULL, NULL, NULL, NULL),
(169, 42, 'fixed', '[]', '[]', NULL, '世纪佳缘满月带会员', 0, 124, '/uploads/20241213/6f5189c10f15d7b05f668a2ab406fbdc.png', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">关于售后：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">1）售后时间为24小时，请在24小时内对账号进行检查，超过24小时概不负责；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">2）包首登，其他不包，比如加人打招呼这些，不在售后范围内；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">3）个人操作引起的异常不售后。个人操作指修改资料、加好友，引流变现等；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">4）对功能细节的使用不负责。即能做什么，不能做什么，需要自己测试，比如能不能加好友打招呼，等等；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">5）售后请联系客服，必须提供以下3点：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">a）订单编号，如果订单中有多个账号，需指明是哪几个账号需要售后；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">b）存在什么问题，说清楚问题现象；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">c）问题截图</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">6）售后问题一般会在24小时内给出答复，如果超过24小时没有收到回复，请提醒，没有超过24小时，请勿催促，所有售后问题都会排队处理。</p><p style=\"margin-top: 0px; margin-bottom: 9px;\"><br/></p><p><br/></p>', 1, 0, 100, NULL, 168, NULL, NULL, NULL, NULL, NULL),
(170, 42, 'fixed', '[]', '[]', NULL, '世纪佳缘半年带会员', 0, 14, '/uploads/20241213/6f5189c10f15d7b05f668a2ab406fbdc.png', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">关于售后：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">1）售后时间为24小时，请在24小时内对账号进行检查，超过24小时概不负责；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">2）包首登，其他不包，比如加人打招呼这些，不在售后范围内；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">3）个人操作引起的异常不售后。个人操作指修改资料、加好友，引流变现等；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">4）对功能细节的使用不负责。即能做什么，不能做什么，需要自己测试，比如能不能加好友打招呼，等等；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">5）售后请联系客服，必须提供以下3点：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">a）订单编号，如果订单中有多个账号，需指明是哪几个账号需要售后；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">b）存在什么问题，说清楚问题现象；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">c）问题截图</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">6）售后问题一般会在24小时内给出答复，如果超过24小时没有收到回复，请提醒，没有超过24小时，请勿催促，所有售后问题都会排队处理。</p><p><br/></p>', 1, 0, 133, NULL, 169, NULL, NULL, NULL, NULL, NULL),
(171, 42, 'fixed', '[]', '[]', NULL, '世纪佳缘一年带会员', 0, 32, '/uploads/20241213/6f5189c10f15d7b05f668a2ab406fbdc.png', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">关于售后：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">1）售后时间为24小时，请在24小时内对账号进行检查，超过24小时概不负责；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">2）包首登，其他不包，比如加人打招呼这些，不在售后范围内；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">3）个人操作引起的异常不售后。个人操作指修改资料、加好友，引流变现等；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">4）对功能细节的使用不负责。即能做什么，不能做什么，需要自己测试，比如能不能加好友打招呼，等等；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">5）售后请联系客服，必须提供以下3点：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">a）订单编号，如果订单中有多个账号，需指明是哪几个账号需要售后；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">b）存在什么问题，说清楚问题现象；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">c）问题截图</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">6）售后问题一般会在24小时内给出答复，如果超过24小时没有收到回复，请提醒，没有超过24小时，请勿催促，所有售后问题都会排队处理。</p><p><br/></p>', 1, 0, 145, NULL, 170, NULL, NULL, NULL, NULL, NULL),
(172, 12, 'fixed', '[]', '[]', NULL, '抖音首登成品，包登核对', 0, 144, '/uploads/20241213/6412ae290ee318312f59942da1405949.webp', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">账号格式为：手机号---密码</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">网址 手机与电脑都能使用，直播，关注，私信等功能全部正常。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">发货说明：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">1、购买账号USDT付款，网站自动发货，付款后不要关闭网站！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">2、购买账号USDT付款请仔细看付款金额，不要付错，否则无法发货！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">3、若未收到请联系客服，不在线请留言，客服晚点会回复。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">4、若遇到问题请咨询客服，提供购买时填的名字或邮箱给客服查询。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">其他说明：&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">1、我们保证卖给你的每个账号都是全新一手的，只要不违反使用规则不被封号的情况下可以长期使用</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">2，我们严格管理已卖出的账号即时删档，都是有相应系统自动删档，绝对不会重复卖一个账号给第二个人</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">3，买到账号后发什么，怎么操作，效果好不好，这些关系到多方面的因素不是我们能控制的。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">4，购买后请立即去管理中心修改密码，未修改密码造成账号丢失我们概不负责</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">5，账号登录使用过，因不当操作导致被封号等不在售后范围&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">6.&nbsp; 严禁利用本站所出售账号实行任何违法行为.</p><p><br/></p>', 1, 0, 52, NULL, 171, NULL, NULL, NULL, NULL, NULL),
(173, 12, 'fixed', '[]', '[]', NULL, '抖音企业蓝V号', 0, 12, '/uploads/20241213/6412ae290ee318312f59942da1405949.webp', NULL, 0, NULL, '<p><span style=\"color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap;\">官方认证，满三个月以上，留咔接码三个月，咔到期可续，带实名可开播，可私信关注视频，权重非常好！</span></p>', 1, 0, 100, NULL, 172, NULL, NULL, NULL, NULL, NULL),
(174, 42, 'fixed', '[]', '[]', NULL, '探探实名一年号-探探账号批发', 0, 12, '/uploads/20241213/8f4c0a5823f65f0c59940a77cfe0a8c4.png', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">账号格式为：手机号---密码</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">1、购买账号USDT付款，网站自动发货，付款后不要关闭网站！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">2、购买账号USDT付款请仔细看付款金额，不要付错，否则无法发货！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">3、若未收到请联系客服，不在线请留言，客服晚点会回复。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">4、若遇到问题请咨询客服，提供购买时填的名字或邮箱给客服查询。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">其他说明：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">1、我们保证卖给你的每个账号都是你一人使用，您在不违反网站管理规定不被封号的情况下可以长期使用,</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">2，我们严格管理已卖出的账号即时删档，都是有相应系统自动删档，绝对不会重复卖一个账号给第二个人，</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">3，买到账号后发什么，怎么操作，效果好不好，这些关系到多方面的因素不是我们能控制的。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">4，购买后请立即去管理中心修改密码，未修改密码造成账号丢失我们概不负责</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">5，账号登录使用过，因不当操作导致被封号等不在售后范围。</p><p><br/></p>', 1, 0, 55, NULL, 173, NULL, NULL, NULL, NULL, NULL),
(175, 42, 'fixed', '[]', '[]', NULL, '探探实名满月号-探探账号批发', 0, 22, '/uploads/20241213/8f4c0a5823f65f0c59940a77cfe0a8c4.png', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">账号格式为：手机号---密码</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">1、购买账号USDT付款，网站自动发货，付款后不要关闭网站！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">2、购买账号USDT付款请仔细看付款金额，不要付错，否则无法发货！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">3、若未收到请联系客服，不在线请留言，客服晚点会回复。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">4、若遇到问题请咨询客服，提供购买时填的名字或邮箱给客服查询。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">其他说明：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">1、我们保证卖给你的每个账号都是你一人使用，您在不违反网站管理规定不被封号的情况下可以长期使用,</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">2，我们严格管理已卖出的账号即时删档，都是有相应系统自动删档，绝对不会重复卖一个账号给第二个人，</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">3，买到账号后发什么，怎么操作，效果好不好，这些关系到多方面的因素不是我们能控制的。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">4，购买后请立即去管理中心修改密码，未修改密码造成账号丢失我们概不负责</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">5，账号登录使用过，因不当操作导致被封号等不在售后范围。</p><p><br/></p>', 1, 0, 104, NULL, 174, NULL, NULL, NULL, NULL, NULL),
(176, 42, 'fixed', '[]', '[]', NULL, '探探白号-探探账号批发', 0, 22, '/uploads/20241213/8f4c0a5823f65f0c59940a77cfe0a8c4.png', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">账号格式为：手机号---密码</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">1、购买账号USDT付款，网站自动发货，付款后不要关闭网站！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">2、购买账号USDT付款请仔细看付款金额，不要付错，否则无法发货！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">3、若未收到请联系客服，不在线请留言，客服晚点会回复。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">4、若遇到问题请咨询客服，提供购买时填的名字或邮箱给客服查询。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">其他说明：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">1、我们保证卖给你的每个账号都是你一人使用，您在不违反网站管理规定不被封号的情况下可以长期使用,</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">2，我们严格管理已卖出的账号即时删档，都是有相应系统自动删档，绝对不会重复卖一个账号给第二个人，</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">3，买到账号后发什么，怎么操作，效果好不好，这些关系到多方面的因素不是我们能控制的。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">4，购买后请立即去管理中心修改密码，未修改密码造成账号丢失我们概不负责</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">5，账号登录使用过，因不当操作导致被封号等不在售后范围。</p><p><br/></p>', 1, 0, 201, NULL, 175, NULL, NULL, NULL, NULL, NULL),
(177, 42, 'fixed', '[]', '[]', NULL, '珍爱实名带会员 一年号-珍爱账号批发', 0, 12, '/uploads/20241213/1684cf201f2a024b39a299108ce46d1f.png', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">账号格式为：邮箱---密码---手机号</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">1、购买账号USDT付款，网站自动发货，付款后不要关闭网站！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">2、购买账号USDT付款请仔细看付款金额，不要付错，否则无法发货！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">3、若未收到请联系客服，不在线请留言，客服晚点会回复。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">4、若遇到问题请咨询客服，提供购买时填的名字或邮箱给客服查询。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">其他说明：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">1、我们保证卖给你的每个账号都是你一人使用，您在不违反网站管理规定不被封号的情况下可以长期使用,</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">2，我们严格管理已卖出的账号即时删档，都是有相应系统自动删档，绝对不会重复卖一个账号给第二个人，</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">3，买到账号后发什么，怎么操作，效果好不好，这些关系到多方面的因素不是我们能控制的。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">4，购买后请立即去管理中心修改密码，未修改密码造成账号丢失我们概不负责</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">5，账号登录使用过，因不当操作导致被封号等不在售后范围。</p><p><br/></p>', 1, 0, 157, NULL, 176, NULL, NULL, NULL, NULL, NULL),
(178, 42, 'fixed', '[]', '[]', NULL, '珍爱实名带会员 半年号-珍爱账号批发', 0, 14, '/uploads/20241213/1684cf201f2a024b39a299108ce46d1f.png', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">账号格式为：邮箱---密码---手机号</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">1、购买账号USDT付款，网站自动发货，付款后不要关闭网站！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">2、购买账号USDT付款请仔细看付款金额，不要付错，否则无法发货！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">3、若未收到请联系客服，不在线请留言，客服晚点会回复。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">4、若遇到问题请咨询客服，提供购买时填的名字或邮箱给客服查询。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">其他说明：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">1、我们保证卖给你的每个账号都是你一人使用，您在不违反网站管理规定不被封号的情况下可以长期使用,</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">2，我们严格管理已卖出的账号即时删档，都是有相应系统自动删档，绝对不会重复卖一个账号给第二个人，</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">3，买到账号后发什么，怎么操作，效果好不好，这些关系到多方面的因素不是我们能控制的。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">4，购买后请立即去管理中心修改密码，未修改密码造成账号丢失我们概不负责</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">5，账号登录使用过，因不当操作导致被封号等不在售后范围。</p><p style=\"margin-top: 0px; margin-bottom: 9px;\"><br/></p><p><br/></p>', 1, 0, 177, NULL, 177, NULL, NULL, NULL, NULL, NULL),
(179, 42, 'fixed', '[]', '[]', NULL, '珍爱实名带会员 满月号-珍爱账号批发', 0, 22, '/uploads/20241213/1684cf201f2a024b39a299108ce46d1f.png', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">账号格式为：邮箱---密码---手机号</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">1、购买账号USDT付款，网站自动发货，付款后不要关闭网站！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">2、购买账号USDT付款请仔细看付款金额，不要付错，否则无法发货！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">3、若未收到请联系客服，不在线请留言，客服晚点会回复。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">4、若遇到问题请咨询客服，提供购买时填的名字或邮箱给客服查询。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">其他说明：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">1、我们保证卖给你的每个账号都是你一人使用，您在不违反网站管理规定不被封号的情况下可以长期使用,</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">2，我们严格管理已卖出的账号即时删档，都是有相应系统自动删档，绝对不会重复卖一个账号给第二个人，</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">3，买到账号后发什么，怎么操作，效果好不好，这些关系到多方面的因素不是我们能控制的。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">4，购买后请立即去管理中心修改密码，未修改密码造成账号丢失我们概不负责</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">5，账号登录使用过，因不当操作导致被封号等不在售后范围。</p><p><br/></p>', 1, 0, 133, NULL, 178, NULL, NULL, NULL, NULL, NULL),
(180, 42, 'fixed', '[]', '[]', NULL, '珍爱白号-珍爱账号批发', 0, 15, '/uploads/20241213/1684cf201f2a024b39a299108ce46d1f.png', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">账号格式为：邮箱---密码---手机号</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">1、购买账号USDT付款，网站自动发货，付款后不要关闭网站！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">2、购买账号USDT付款请仔细看付款金额，不要付错，否则无法发货！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">3、若未收到请联系客服，不在线请留言，客服晚点会回复。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">4、若遇到问题请咨询客服，提供购买时填的名字或邮箱给客服查询。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">其他说明：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">1、我们保证卖给你的每个账号都是你一人使用，您在不违反网站管理规定不被封号的情况下可以长期使用,</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">2，我们严格管理已卖出的账号即时删档，都是有相应系统自动删档，绝对不会重复卖一个账号给第二个人，</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">3，买到账号后发什么，怎么操作，效果好不好，这些关系到多方面的因素不是我们能控制的。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">4，购买后请立即去管理中心修改密码，未修改密码造成账号丢失我们概不负责</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">5，账号登录使用过，因不当操作导致被封号等不在售后范围。</p><p><br/></p>', 1, 0, 176, NULL, 179, NULL, NULL, NULL, NULL, NULL),
(181, 26, 'fixed', '[]', '[]', NULL, '支付宝实名号满月', 0, 31, '/uploads/20241213/368bcf67bdff5214247b7c8fb70ea6ac.jpg', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 0px; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">帐号说明：</p><p style=\"margin-top: 0px; margin-bottom: 0px; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">帐号格式</p><p style=\"margin-top: 0px; margin-bottom: 0px; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">支付宝</p><p style=\"margin-top: 0px; margin-bottom: 0px; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">henduohao2009----henduohao888----henduohao@outlook.com----44&nbsp;3731934XXX&nbsp; &nbsp;绑定的英国手机号登录</p><p style=\"margin-top: 0px; margin-bottom: 0px; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">所有 帐号功能均可正常使用，每天都会上新，请放心购买 ；用途自测，只保证商品本身可用 。</p><p style=\"margin-top: 0px; margin-bottom: 0px; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">账号为随机IP注册，且均可正常登录使用，可先小量购买测试，再进行购买。</p><p style=\"margin-top: 0px; margin-bottom: 0px; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">登录时候，出现网页打不开，或者登录系统错误，都是由于 你网络设置有问题 ，请正确设置好网络环境。</p><p style=\"margin-top: 0px; margin-bottom: 0px; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">购买后，如果需要长期使用，建议绑定绑定自己的手机号码。</p><p style=\"margin-top: 0px; margin-bottom: 0px; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">登录说明：一个IP/设备不要过多登录，不要使用同一个ip登录多个账号，不要使用污染IP登录；</p><p><br/></p>', 1, 0, 123, NULL, 180, NULL, NULL, NULL, NULL, NULL),
(182, 26, 'fixed', '[]', '[]', NULL, '支付宝半年实名号', 0, 46, '/uploads/20241213/368bcf67bdff5214247b7c8fb70ea6ac.jpg', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 0px; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">帐号说明：</p><p style=\"margin-top: 0px; margin-bottom: 0px; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">帐号格式</p><p style=\"margin-top: 0px; margin-bottom: 0px; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">支付宝</p><p style=\"margin-top: 0px; margin-bottom: 0px; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">henduohao2009----henduohao888----henduohao@outlook.com----44&nbsp;3731934XXX&nbsp; &nbsp;绑定的英国手机号登录</p><p style=\"margin-top: 0px; margin-bottom: 0px; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">所有 帐号功能均可正常使用，每天都会上新，请放心购买 ；用途自测，只保证商品本身可用 。</p><p style=\"margin-top: 0px; margin-bottom: 0px; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">账号为随机IP注册，且均可正常登录使用，可先小量购买测试，再进行购买。</p><p style=\"margin-top: 0px; margin-bottom: 0px; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">登录时候，出现网页打不开，或者登录系统错误，都是由于 你网络设置有问题 ，请正确设置好网络环境。</p><p style=\"margin-top: 0px; margin-bottom: 0px; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">购买后，如果需要长期使用，建议绑定绑定自己的手机号码。</p><p style=\"margin-top: 0px; margin-bottom: 0px; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">登录说明：一个IP/设备不要过多登录，不要使用同一个ip登录多个账号，不要使用污染IP登录；</p><p><br/></p>', 1, 0, 175, NULL, 181, NULL, NULL, NULL, NULL, NULL),
(183, 26, 'fixed', '[]', '[]', NULL, '支付宝实名年号耐用', 0, 54, '/uploads/20241213/368bcf67bdff5214247b7c8fb70ea6ac.jpg', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px;\">帐号说明：</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px;\">帐号格式</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px;\">支付宝</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px;\">henduohao2009----henduohao888----henduohao@outlook.com----44&nbsp;3731934XXX&nbsp; &nbsp;绑定的英国手机号登录</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px;\">所有 帐号功能均可正常使用，每天都会上新，请放心购买 ；用途自测，只保证商品本身可用 。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px;\">账号为随机IP注册，且均可正常登录使用，可先小量购买测试，再进行购买。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px;\">登录时候，出现网页打不开，或者登录系统错误，都是由于 你网络设置有问题 ，请正确设置好网络环境。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px;\">购买后，如果需要长期使用，建议绑定绑定自己的手机号码。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px;\">登录说明：一个IP/设备不要过多登录，不要使用同一个ip登录多个账号，不要使用污染IP登录；</p><p style=\"margin-top: 0px; margin-bottom: 9px;\"><br/></p><p><br/></p>', 1, 0, 143, NULL, 182, NULL, NULL, NULL, NULL, NULL),
(184, 26, 'fixed', '[]', '[]', NULL, '支付宝账号新号', 0, 87, '/uploads/20241213/368bcf67bdff5214247b7c8fb70ea6ac.jpg', NULL, 0, NULL, '<p><span style=\"color: rgb(68, 68, 68); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap;\">新号刚注册未实名，用不到别下单。</span></p>', 1, 0, 168, NULL, 183, NULL, NULL, NULL, NULL, NULL),
(185, 5, 'fixed', '[]', '[]', NULL, 'Tiktok千粉(活人粉丝)-Tiktok账号批发', 0, 24, '/uploads/20241213/6412ae290ee318312f59942da1405949.webp', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">发货格式：登录账号----登录密码---邮箱</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">关于售后：仅质保首登。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">首登测试方法：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">网页版测试账号 www.tiktok.com ，如果网页版可以登录，说明账号是好的，APP如果登录不了说明是你的节点/设备环境问题，请勿怪我们！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">注意事项：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">1.更换邮箱需要先绑定国外手机号(国内号码不行)</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">2.使用高质量的代理节点，同一个IP切勿登录多个账号，否则账号关联可能会导致多个账号被封禁。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">3.建议登录多个账号时使用多个设备，如果使用浏览器登录时，请使用多用户模式或无痕模式，确保Cookie独立。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">4.登录账号时请先清理设备，APP中登录时建议清除Session和Data，甚至卸载重新安装LinkedIn APP，浏览器中登录时建议先清除Cookie信息，或创建新浏览器新用户。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">5.切勿在短时间频繁切换不同国家/地区的IP登录和使用账号。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">6.首次登录账号后切勿批量修改账户资料，放两天养号一下再去修改。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">7.不要对账号进行大规模操作（进行数千次点赞、发送数百条信息、大量访问用户主页等），避免账号刚登录立即进行高风险操作，例如修改用户名、密码、电话及邮箱。建议您先进行一些普通的浏览、点赞、评论、转发和发帖动作。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">如何解决tiktok出现的“Too many attempts. Try again later”？</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">1.APP删除重装</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">2.换个干净VPN节点</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">3.过一小时或一天后重试</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">TikTok账号发货说明：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">1、购买账号USDT付款，网站自动发货，付款后不要关闭网站！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">2、购买账号USDT付款请仔细看付款金额，不要付错，否则无法发货！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">3、若未收到请联系客服，不在线请留言，客服晚点会回复。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">4、若遇到问题请咨询客服，提供购买时填的名字或邮箱给客服查询。</p><p style=\"margin-top: 0px; margin-bottom: 9px;\"><br/></p><p><br/></p>', 1, 0, 145, NULL, 184, NULL, NULL, NULL, NULL, NULL),
(186, 5, 'fixed', '[]', '[]', NULL, 'Tiktok万粉(活人粉丝)-Tiktok账号批发', 0, 43, '/uploads/20241213/6412ae290ee318312f59942da1405949.webp', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">发货格式：登录账号----登录密码---邮箱</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">关于售后：仅质保首登。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">首登测试方法：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">网页版测试账号 www.tiktok.com ，如果网页版可以登录，说明账号是好的，APP如果登录不了说明是你的节点/设备环境问题，请勿怪我们！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">注意事项：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">1.更换邮箱需要先绑定国外手机号(国内号码不行)</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">2.使用高质量的代理节点，同一个IP切勿登录多个账号，否则账号关联可能会导致多个账号被封禁。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">3.建议登录多个账号时使用多个设备，如果使用浏览器登录时，请使用多用户模式或无痕模式，确保Cookie独立。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">4.登录账号时请先清理设备，APP中登录时建议清除Session和Data，甚至卸载重新安装LinkedIn APP，浏览器中登录时建议先清除Cookie信息，或创建新浏览器新用户。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">5.切勿在短时间频繁切换不同国家/地区的IP登录和使用账号。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">6.首次登录账号后切勿批量修改账户资料，放两天养号一下再去修改。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">7.不要对账号进行大规模操作（进行数千次点赞、发送数百条信息、大量访问用户主页等），避免账号刚登录立即进行高风险操作，例如修改用户名、密码、电话及邮箱。建议您先进行一些普通的浏览、点赞、评论、转发和发帖动作。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">如何解决tiktok出现的“Too many attempts. Try again later”？</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">1.APP删除重装</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">2.换个干净VPN节点</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">3.过一小时或一天后重试</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">TikTok账号发货说明：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">1、购买账号USDT付款，网站自动发货，付款后不要关闭网站！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">2、购买账号USDT付款请仔细看付款金额，不要付错，否则无法发货！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">3、若未收到请联系客服，不在线请留言，客服晚点会回复。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">4、若遇到问题请咨询客服，提供购买时填的名字或邮箱给客服查询。</p><p style=\"margin-top: 0px; margin-bottom: 9px;\"><br/></p><p><br/></p>', 1, 0, 132, NULL, 185, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `goods` (`id`, `category_id`, `type`, `attach`, `wholesale`, `quota`, `name`, `agency_see`, `invented_sales`, `cover`, `images`, `is_sku`, `sku_name`, `detail`, `shelf`, `sales`, `stock`, `start_number`, `weigh`, `unit`, `course`, `pop_content`, `create_time`, `update_time`) VALUES
(187, 5, 'fixed', '[]', '[]', NULL, 'Tiktok一年老号已实名-Tiktok账号批发', 0, 33, '/uploads/20241213/6412ae290ee318312f59942da1405949.webp', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">发货格式：登录账号----登录密码---邮箱</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">关于售后：质保三个月。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">首登测试方法：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">网页版测试账号 www.tiktok.com ，如果网页版可以登录，说明账号是好的，APP如果登录不了说明是你的节点/设备环境问题，请勿怪我们！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">注意事项：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">1.更换邮箱需要先绑定国外手机号(国内号码不行)</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">2.使用高质量的代理节点，同一个IP切勿登录多个账号，否则账号关联可能会导致多个账号被封禁。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">3.建议登录多个账号时使用多个设备，如果使用浏览器登录时，请使用多用户模式或无痕模式，确保Cookie独立。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">4.登录账号时请先清理设备，APP中登录时建议清除Session和Data，甚至卸载重新安装LinkedIn APP，浏览器中登录时建议先清除Cookie信息，或创建新浏览器新用户。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">5.切勿在短时间频繁切换不同国家/地区的IP登录和使用账号。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">6.首次登录账号后切勿批量修改账户资料，放两天养号一下再去修改。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">7.不要对账号进行大规模操作（进行数千次点赞、发送数百条信息、大量访问用户主页等），避免账号刚登录立即进行高风险操作，例如修改用户名、密码、电话及邮箱。建议您先进行一些普通的浏览、点赞、评论、转发和发帖动作。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">如何解决tiktok出现的“Too many attempts. Try again later”？</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">1.APP删除重装</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">2.换个干净VPN节点</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">3.过一小时或一天后重试</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">TikTok账号发货说明：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">1、购买账号USDT付款，网站自动发货，付款后不要关闭网站！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">2、购买账号USDT付款请仔细看付款金额，不要付错，否则无法发货！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">3、若未收到请联系客服，不在线请留言，客服晚点会回复。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">4、若遇到问题请咨询客服，提供购买时填的名字或邮箱给客服查询。</p><p><br/></p>', 1, 0, 185, NULL, 186, NULL, NULL, NULL, NULL, NULL),
(188, 5, 'fixed', '[]', '[]', NULL, 'Tiktok协议号/token/ios全参号/三绑号-Tiktok账号批发', 0, 77, '/uploads/20241213/6412ae290ee318312f59942da1405949.webp', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">发货格式：登录账号----登录密码---邮箱</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">关于售后：仅质保首登。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">首登测试方法：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">网页版测试账号 www.tiktok.com ，如果网页版可以登录，说明账号是好的，APP如果登录不了说明是你的节点/设备环境问题，请勿怪我们！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">注意事项：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">1.更换邮箱需要先绑定国外手机号(国内号码不行)</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">2.使用高质量的代理节点，同一个IP切勿登录多个账号，否则账号关联可能会导致多个账号被封禁。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">3.建议登录多个账号时使用多个设备，如果使用浏览器登录时，请使用多用户模式或无痕模式，确保Cookie独立。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">4.登录账号时请先清理设备，APP中登录时建议清除Session和Data，甚至卸载重新安装LinkedIn APP，浏览器中登录时建议先清除Cookie信息，或创建新浏览器新用户。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">5.切勿在短时间频繁切换不同国家/地区的IP登录和使用账号。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">6.首次登录账号后切勿批量修改账户资料，放两天养号一下再去修改。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">7.不要对账号进行大规模操作（进行数千次点赞、发送数百条信息、大量访问用户主页等），避免账号刚登录立即进行高风险操作，例如修改用户名、密码、电话及邮箱。建议您先进行一些普通的浏览、点赞、评论、转发和发帖动作。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">如何解决tiktok出现的“Too many attempts. Try again later”？</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">1.APP删除重装</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">2.换个干净VPN节点</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">3.过一小时或一天后重试</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">TikTok账号发货说明：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">1、购买账号USDT付款，网站自动发货，付款后不要关闭网站！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">2、购买账号USDT付款请仔细看付款金额，不要付错，否则无法发货！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">3、若未收到请联系客服，不在线请留言，客服晚点会回复。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">4、若遇到问题请咨询客服，提供购买时填的名字或邮箱给客服查询。</p><p><br/></p>', 1, 0, 120, NULL, 187, NULL, NULL, NULL, NULL, NULL),
(189, 42, 'fixed', '[]', '[]', NULL, 'YouTube油管账户(一年老号)-YouTube账号批发', 0, 22, '/uploads/20241213/848e9dc80417b06d06e10a3e81fbb6eb.png', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">1、YouTube的账户格式为：用户名-密码-安全邮箱。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">2、YouTube账户链接：https://www.youtube.com（需要使用翻墙工具）</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">3、由于油管是境外网站，国内IP无法正常浏览，需要利用翻墙技术进行访问，请不要责备我，如果你不了解，请不要批评！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">4、油管是指国内用户对全球最大视频平台Youtube的简称。Youtube拥有庞大的用户群体，通过在油管上推广海外客户是一个非常有利的方向。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">YouTube是一个来自美国的在线视频分享平台，它集合了社交网络和微博服务的功能。用户可以通过它上传、观看、分享和评论视频。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">该公司创立于2005年2月14日，其网站口号是&quot;展现真我&quot;，而网站的独特理念则受到早期电视屏幕的灵感启发。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">YouTube宣布了一项声明：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">1、购买油管帐号时，请使用USDT进行支付。支付完成后，请保持网页打开状态，系统将自动发送货物给您。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">2、请确保在付款前仔细核对支付金额，以免意外错误。我们只接受使用USDT支付购买油管帐号，请确保付款准确，否则我们将无法提供货物。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">3、如果您没有收到，请联系客服。如果客服不在线，请留下一条留言，我们会尽快回复您。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">4、如遇问题，请咨询客服部门，并提供您购买时填写的姓名或电邮地址，以便客服人员查询。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">其他的问题显示：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">1、如果你是第一次使用，建议先购买少量产品来进行测试。如果你要购买的数量较多，建议进行随机抽样测试。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">2、许多国外网站都需要翻墙才能访问，请自备相关工具，并可通过百度搜索来了解相关信息。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">3、如果您购买账号用于发送广告信息、销售产品等有可能导致被封账号的行为，您将自行承担后果。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">4、如果你对这个帐号是否适合你的业务还有一些疑虑的话，建议你先进行一些测试。</p><p><br/></p>', 1, 0, 122, NULL, 188, NULL, NULL, NULL, NULL, NULL),
(190, 42, 'fixed', '[]', '[]', NULL, 'YouTube油管账户(新号)-YouTube账号批发', 0, 54, '/uploads/20241213/848e9dc80417b06d06e10a3e81fbb6eb.png', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">1、YouTube的账户格式为：“用户名-密码-安全邮箱”。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">2、YouTube账户的链接是https://www.youtube.com（需要使用翻墙工具）。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">3、因为油管是一个境外网站，国内IP无法正常访问，因此需要使用翻墙技术来浏览。请不要责怪我，如果你不了解，请不要批评！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">4、油管是指国内用户使用的全球最大视频平台Youtube的简称。Youtube拥有庞大的用户群体，因此在油管上推广海外客户是一个非常有利的方向。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">YouTube是一个源自美国的在线视频分享平台，它整合了社交网络和微博服务的特点。用户能够利用它上传、观看、分享和发表评论。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">这家公司在2005年2月14日成立，其网站的口号是&quot;真实展现自我&quot;，而其独特理念则灵感源自早期电视屏幕。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">以下为购买声明：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">1、在购买油管账号时，请使用USDT进行支付。支付完成后，请保持网页开启，系统将自动发送货物给您。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">2、为了避免意外错误，请务必在付款前仔细确认支付金额。我们仅接受使用USDT支付购买油管账号，请确保付款准确无误，否则将无法提供货物。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">3、如果您没有收到，请与客服联系。如果客服不在线，请您给我们留言，我们将尽快回复您。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">4、如果您遇到问题，请联系客服部门，并提供您购买时所填写的姓名或电子邮件地址，以便客服人员进行查询。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">其他问题呈现：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">1、如果你是第一次使用，建议先购买少量产品来进行试用。如果你要购买的数量较大，建议进行随机抽样测试。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">2、许多海外网站要求使用翻墙工具才能访问，请自备相应工具。你可以通过在百度搜索相关信息来了解更多。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">3、如果您购买账号并用于发送广告信息、销售产品等可能会导致账号被封的行为，您必须自行承担相应后果。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">4、如果你对这个帐号是否适合于你的业务还有一些疑虑的话，我建议你先进行一次测试来确认。</p><p><br/></p>', 1, 0, 134, NULL, 189, NULL, NULL, NULL, NULL, NULL),
(191, 42, 'fixed', '[]', '[]', NULL, 'Skype账号(3一6个月耐用号)Skype账号 新号-Skype账号批发', 0, 23, '/uploads/20241213/6d591b7de375d7a8190fe71a1d5d0a70.png', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">帐户格式：登录名称-密码-邮箱-邮箱密码</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">Skype是一款具有IM所需功能的即时通讯软件，如视频通话、多人语音会议、多人聊天、文件传输、文字聊天等。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">发货表明：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">1、购买Skype帐户USDT支付，网站自动发货，付款后不要关闭网站！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">2、购买Skype帐户USDT支付请仔细查看支付金额，不要付错，否则不能发货！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">3、如果Skype账号没有收到，可以联系客服，如果不在线，请留言，客服以后会回复。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">4、如遇问题请咨询客服，提供购买时填写的姓名或电子邮件地址供客服查询。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">其他表明：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">1、在登录Skype帐户之前，请先清除浏览器的缓存，或者使用浏览器的隐私模式登录，也称为新号码模式。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">2、如果是手机APP登录，建议您卸载并重新安装APP，如果没有接收到验证码，那就是APP版本不对，请更新APP。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">3、帐号出售后请自行保留，帐号未作特别说明的，请修改所有可修改的信息，主要包括安全邮箱、手机、保密等，</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">可以修改为自己的一律修改，除非特别说明不允许修改，否则不会修改。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">4、如遇问题，请咨询客服，提供购买时填写的姓名或邮箱查询客服。.</p><p style=\"margin-top: 0px; margin-bottom: 9px;\"><br/></p><p><br/></p>', 1, 0, 124, NULL, 190, NULL, NULL, NULL, NULL, NULL),
(192, 42, 'fixed', '[]', '[]', NULL, 'Skype账号(满月号)Skype账号 新号-Skype账号批发', 0, 34, '/uploads/20241213/6d591b7de375d7a8190fe71a1d5d0a70.png', NULL, 0, NULL, '<p><br/><sup></sup></p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">账户的格式：用户名-密码-电子邮箱-电子邮箱密码</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">Skype是一个即时通讯软件，具备IM功能，可以进行视频通话、多人语音会议、多人聊天、文件传输和文字聊天等。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">发货表明：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">1、请使用USDT支付购买Skype账户。支付完成后，请勿关闭网站，系统将自动发送货物。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">2、购买Skype帐户时，请仔细确认USDT支付金额，确保准确无误，以免支付错误，导致无法发货。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">3、如果你没有收到Skype消息，可以联系客服。如果客服当前不在线，请留言，客服会在后续时间回复你。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">4、如果你遇到任何问题，请向客服咨询，并提供你购买时填写的姓名或电子邮件地址供客服查询。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">其他表明：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">1、在登录Skype帐户之前，请先清除浏览器缓存，或者使用浏览器的隐私模式登录，也就是新号码模式。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">2、推荐您如果是通过手机应用程序登录，请先卸载并重新安装应用程序。如果您没有收到验证码，那可能是应用程序版本不兼容，请更新应用程序版本。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">3、请在购买账号后务必妥善管理和保护，对于未说明的账号，请修改一切可修改的信息，主要包括安全邮箱、手机号码以及密码等隐私信息。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">除非另有特别说明不得更改，否则请根据个人需求随意对文本进行修改。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">4、如果您遇到问题，请咨询客服，您可以提供您在购买时填写的姓名或邮箱来查询客服。</p><p><sup></sup><br/></p>', 1, 0, 134, NULL, 191, NULL, NULL, NULL, NULL, NULL),
(193, 42, 'fixed', '[]', '[]', NULL, 'Skype账号(新号)-Skype账号批发', 0, 12, '/uploads/20241213/6d591b7de375d7a8190fe71a1d5d0a70.png', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">账户的格式为：用户名-密码-电子邮箱-电子邮箱密码。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">Skype是一款具备即时通讯功能的软件，可以通过它进行视频通话、多人语音会议、多人聊天、传输文件和文字聊天等操作。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">发货表明：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">1、请使用USDT进行支付以购买Skype账户。支付完成后，请不要关闭网页，系统将自动发送商品。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">2、购买Skype帐户时，请确保仔细核对USDT支付金额，以确保准确无误，避免支付错误导致无法发货。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">3、如果你没有收到skype的讯息，可以和客户服务联系。如果客户服务当前不在线，请您留下您的留言，客户服务会在稍后的时间回复您。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">4、如果您遇到任何疑问或问题，请咨询客服，并提供您购买时填写的姓名或电子邮件地址，以方便客服人员进行查询。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">其他表明：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">1、在登录Skype账户之前，请先清除浏览器的历史记录和缓存，或者使用浏览器的隐私模式登录，也就是新号码模式。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">2、建议您如果使用手机应用登录，请先删除并重新安装应用。如果您没有收到验证码，可能是因为应用版本不兼容，请更新应用版本。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">3、购买账号后，请务必妥善管理和保护，对于未提及的账号，请修改所有可修改的信息，主要包括安全邮箱、手机号码和密码等敏感信息。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">请根据个人需求自由修改文本，除非特别说明禁止更改。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">4、如遇问题，请联系客服，您可以提供购买时填写的姓名或邮箱进行查询</p><p><br/></p>', 1, 0, 101, NULL, 192, NULL, NULL, NULL, NULL, NULL),
(194, 23, 'fixed', '[]', '[]', NULL, 'Facebook 墨西哥有缘(24小时售后包心动)-有缘友缘账号批发', 0, 23, '/uploads/20241213/3ca2a57351ec914a031c40a7b2158790.jpg', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">账号格式：账号---密码----验证码获取网址---绑定邮箱---邮箱密码</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">登录教程：（电脑端手机端通用）</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">账号:*** 密码:***&nbsp; 先输入账号密码登录账号,点击登录按钮后,如果页面提示输入验证码,请在浏览器新网页上访问账号密码后面的网址，</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">&nbsp;打开网址将页面上显示的6位数字验证码填入，即可完成登录</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">都是活跃账号，建议账号登录上去当天勿操作，勿改任何设置。第一时间在邮箱官网登录账号绑定邮箱，修改邮箱的密码，如果邮箱登录过程中提示锁定，</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">只需点击下一步随便绑定一个你可以接收到验证码的手机号验证下就可以正常登录邮箱。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">发货说明：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">1、购买账号USDT付款，网站自动发货，付款后不要关闭网站！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">2、购买账号USDT付款请仔细看付款金额，不要付错，否则无法发货！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">3、若未收到请联系客服，不在线请留言，客服晚点会回复。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">4、若遇到问题请咨询客服，提供购买时填的名字或邮箱给客服查询。</p><p><br/></p>', 1, 0, 99, NULL, 193, NULL, NULL, NULL, NULL, NULL),
(195, 23, 'fixed', '[]', '[]', NULL, 'Facebook 新加坡有缘(24小时售后包心动)-有缘友缘账号批发', 0, 24, '/uploads/20241213/3ca2a57351ec914a031c40a7b2158790.jpg', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">账号格式：账号---密码----验证码获取网址---绑定邮箱---邮箱密码</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">登录教程：（电脑端手机端通用）</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">账号:*** 密码:***&nbsp; 先输入账号密码登录账号,点击登录按钮后,如果页面提示输入验证码,请在浏览器新网页上访问账号密码后面的网址，</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">&nbsp;打开网址将页面上显示的6位数字验证码填入，即可完成登录</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">都是活跃账号，建议账号登录上去当天勿操作，勿改任何设置。第一时间在邮箱官网登录账号绑定邮箱，修改邮箱的密码，如果邮箱登录过程中提示锁定，</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">只需点击下一步随便绑定一个你可以接收到验证码的手机号验证下就可以正常登录邮箱。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">发货说明：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">1、购买账号USDT付款，网站自动发货，付款后不要关闭网站！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">2、购买账号USDT付款请仔细看付款金额，不要付错，否则无法发货！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">3、若未收到请联系客服，不在线请留言，客服晚点会回复。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">4、若遇到问题请咨询客服，提供购买时填的名字或邮箱给客服查询。</p><p><br/></p>', 1, 0, 24, NULL, 194, NULL, NULL, NULL, NULL, NULL),
(196, 23, 'fixed', '[]', '[]', NULL, 'Facebook 泰国有缘(24小时售后包心动)-有缘友缘账号批发', 0, 23, '/uploads/20241213/3ca2a57351ec914a031c40a7b2158790.jpg', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">账号格式：账号---密码----验证码获取网址---绑定邮箱---邮箱密码</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">登录教程：（电脑端手机端通用）</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">账号:*** 密码:***&nbsp; 先输入账号密码登录账号,点击登录按钮后,如果页面提示输入验证码,请在浏览器新网页上访问账号密码后面的网址，</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">&nbsp;打开网址将页面上显示的6位数字验证码填入，即可完成登录</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">都是活跃账号，建议账号登录上去当天勿操作，勿改任何设置。第一时间在邮箱官网登录账号绑定邮箱，修改邮箱的密码，如果邮箱登录过程中提示锁定，</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">只需点击下一步随便绑定一个你可以接收到验证码的手机号验证下就可以正常登录邮箱。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">发货说明：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">1、购买账号USDT付款，网站自动发货，付款后不要关闭网站！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">2、购买账号USDT付款请仔细看付款金额，不要付错，否则无法发货！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">3、若未收到请联系客服，不在线请留言，客服晚点会回复。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">4、若遇到问题请咨询客服，提供购买时填的名字或邮箱给客服查询。</p><p><br/></p>', 1, 0, 134, NULL, 195, NULL, NULL, NULL, NULL, NULL),
(197, 23, 'fixed', '[]', '[]', NULL, 'Facebook 美国有缘(24小时售后包心动)-有缘友缘账号批发', 0, 34, '/uploads/20241213/3ca2a57351ec914a031c40a7b2158790.jpg', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">账号格式：账号---密码----验证码获取网址---绑定邮箱---邮箱密码</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">登录教程：（电脑端手机端通用）</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">账号:*** 密码:***&nbsp; 先输入账号密码登录账号,点击登录按钮后,如果页面提示输入验证码,请在浏览器新网页上访问账号密码后面的网址，</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">&nbsp;打开网址将页面上显示的6位数字验证码填入，即可完成登录</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">都是活跃账号，建议账号登录上去当天勿操作，勿改任何设置。第一时间在邮箱官网登录账号绑定邮箱，修改邮箱的密码，如果邮箱登录过程中提示锁定，</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">只需点击下一步随便绑定一个你可以接收到验证码的手机号验证下就可以正常登录邮箱。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">发货说明：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">1、购买账号USDT付款，网站自动发货，付款后不要关闭网站！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">2、购买账号USDT付款请仔细看付款金额，不要付错，否则无法发货！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">3、若未收到请联系客服，不在线请留言，客服晚点会回复。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">4、若遇到问题请咨询客服，提供购买时填的名字或邮箱给客服查询。</p><p><br/></p>', 1, 0, 72, NULL, 196, NULL, NULL, NULL, NULL, NULL),
(198, 42, 'fixed', '[]', '[]', NULL, '苹果开发者企业账号-苹果账号', 0, 2, '/uploads/20241213/47da4ea8fdd1e06f3a7832294d6a113c.png', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">苹果开发者企业账号详情页</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">概述</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">苹果开发者企业账号是专为企业和组织设计的一个平台，旨在帮助他们在苹果生态系统中发布和管理应用程序。该账号提供了一系列功能，使企业能够自主控制应用分发、内部测试和安装。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">主要功能</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">应用程序开发与分发：苹果开发者企业账号允许企业团队利用强大的开发工具来创建高质量的iOS和macOS应用程序，并自主分发给公司的员工或特定用户群体。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">内部测试：企业账号提供了企业级的内部测试功能，使企业能够在应用正式发布之前，在内部员工中进行广泛的测试和反馈收集，以确保应用的稳定性和功能完整性。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">安装控制与设备管理：企业账号允许企业自己控制应用的安装过程，包括向指定设备或特定用户分发应用。企业可以通过设备管理功能远程管理和监控设备，确保应用的安全性和合规性。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">付款与收益：企业账号允许企业设置应用的定价，并管理应用销售和收入分配。苹果提供了便捷的付款和结算机制，确保企业能够及时获得应有的收益。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">账号权限与团队管理：企业账号允许添加多个开发者和管理员，并为他们分配不同的权限和角色，以便协作开发和管理应用项目。这样的团队管理功能可有效促进协作和项目管理。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">优势与好处</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">自主控制与定制化：企业账号使企业能够自主控制应用的分发和安装过程，满足企业的定制化需求。企业可以根据自身的规模和策略，选择将应用内部分发给员工或特定用户群体。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">2. 内部测试和反馈收集：企业账号提供了专业的内部测试功能，使企业能够在发布之前对应用进行广泛测试，并及时收集员工的反馈意见，以改进和优化应用。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">3. 安全与合规性：通过企业账号发布的应用可在企业内部进行安装控制和设备管理，确保应用的安全性、合规性和机密性。企业账号提供了设备管理功能，允许企业远程管理和监控设备，确保数据的安全和隐私保护。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">4. 付款与收益：成功的企业应用可以为企业带来稳定的收益流，同时也为企业提供资金支持和进一步的创新发展机会。企业账号提供了灵活的定价和销售策略，以满足不同的商业需求。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">5. 账号权限与团队管理：企业账号允许添加多个开发者和管理员，并为他们分配不同的权限和角色，以便协作开发和管理应用项目。这样的团队管理功能可提高团队效率，促进协作和项目管理。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">总结</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">苹果开发者企业账号为企业和组织提供了一个完善的平台，使其能够自主控制应用的分发、内部测试和安装。通过该账号，企业可以利用苹果的开发者工具和资源，定制化开发应用，并满足公司内部的需求。此外，企业账号还提供了设备管理功能，确保应用的安全性和合规性。对于有创意和创新的企业来说，苹果开发者企业账号是实现应用开发目标和商业成功的关键之一。</p><p style=\"margin-top: 0px; margin-bottom: 9px;\"><br/></p><p><br/></p>', 1, 0, 176, NULL, 197, NULL, NULL, NULL, NULL, NULL),
(199, 42, 'fixed', '[]', '[]', NULL, '苹果开发者个人账号-苹果账号', 0, 1, '/uploads/20241213/47da4ea8fdd1e06f3a7832294d6a113c.png', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\"># 苹果开发者个人账号详情页</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">## 概述</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">苹果开发者个人账号是为个人开发者提供的一个平台，用于在苹果生态系统中发布和管理应用程序。该账号允许个人开发者创建、测试、审核和发布自己的iOS和macOS应用。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">## 主要功能</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">1. 应用程序开发：个人开发者可以使用苹果开发者个人账号来创建和开发iOS和macOS应用程序。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">2. 开发者工具：账号提供了强大的开发者工具集合，如Xcode IDE（集成开发环境）、iOS模拟器和调试工具，帮助开发者更高效地进行应用程序开发和测试。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">3. 应用发布与审核：通过个人账号，开发者可以将他们开发的应用提交到App Store进行审核和发布。苹果会对应用进行严格的质量控制和安全审核，以确保用户获得高质量和可信赖的应用程序。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">4. 付款和结算：开发者可以通过个人账号管理应用的定价、销售和收入分配。苹果提供了便捷的支付和结算机制，使开发者能够获取应有的收益。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">5. 开发者支持与资源：苹果开发者个人账号提供了广泛的开发者支持和资源，包括文档、示例代码、技术文章和论坛等。个人开发者可以通过这些资源获取帮助和解决问题。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">## 优势与好处</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">1. 全球用户覆盖：通过个人账号发布的应用可在全球范围内的数亿苹果设备上提供服务，潜在用户群庞大。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">2. 可信赖的平台：苹果生态系统以其安全性和稳定性而闻名，个人账号使开发者能够将应用程序发布到这一可信赖的平台上。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">3. 收益机会：成功的应用程序可以为个人开发者带来可观的收入，并为进一步的创新和发展提供资金支持。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">4. 社区交流：作为苹果开发者社区的一员，个人开发者可以与其他开发者交流经验、分享知识，并从中获得灵感和指导。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">## 总结</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">苹果开发者个人账号为个人开发者提供了一个完整的平台，使他们能够快速、安全地开发、测试和发布iOS和macOS应用程序。该账号不仅提供了开发者工具和技术资源，还为开发者提供了市场推广渠道和收益机会。对于有创造力和激情的个人开发者来说，苹果开发者个人账号是实现自己应用程序梦想的重要一步。</p><p><br/></p>', 1, 0, 134, NULL, 198, NULL, NULL, NULL, NULL, NULL),
(200, 42, 'fixed', '[]', '[]', NULL, '韩国苹果ID账号独享(带密保)-Apple独享账号批发', 0, 45, '/uploads/20241213/47da4ea8fdd1e06f3a7832294d6a113c.png', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">1、 账号格式：苹果ID账号：邮箱密码：苹果ID密码+注册信息(回答问题1：回答问题2：回答问题3)</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">2、账号说明：由于国内账号会屏蔽很多软件，需要用其他国家的ID下载，我们提供美国/韩国/日本/香港/台湾等地区的Apple id可以下载各类软件，没有限制。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">3、登录地址：https://appleid.apple.com/</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">4、您的 Apple ID 是您用于访问 Apple 服务的帐户，这些服务包括 App Store、Apple Music、iCloud、iMessage 信息、“FaceTime 通话”等。一般美国的苹果账号软件最全。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">Apple账号自动发货说明：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">1、点击购买，按页面提示操作,用USDT支付，网站自动发货，付款后不要关闭网站！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">2、苹果账号USDT购买，请仔细看付款金额，不要付错！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">3、如果没有收到账号，也可以自助提取，填写相应的单号和邮箱即可</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">4、请填写正确的邮箱，程序会自动发送卡密到邮箱，注意查收！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">其他问题说明：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">1、购买后请立即去管理中心修改密码，未修改密码造成账号丢失我们概不负责！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">2、每个国家所能下载的软件略有区别，更具自己需要购买。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">3、购买账号用于发送广告信息、推广产品等造成封号的，后果自负。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">4、账号修改密码和密保后，没有人可以盗走，不必担心安全问题。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">5、本站所售账号仅供用于正规用途，严禁用于违法用途，一经发现将配合相关部门查寻</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">6、账号购买之后最好不要去登录到自己的手机设置里，之登录app store&nbsp; 就可以了</p><p><br/></p>', 1, 0, 144, NULL, 199, NULL, NULL, NULL, NULL, NULL),
(201, 42, 'fixed', '[]', '[]', NULL, '中国苹果ID账号独享(带密保)-Apple独享账号批发', 0, 244, '/uploads/20241213/47da4ea8fdd1e06f3a7832294d6a113c.png', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">1、 账号格式：苹果ID账号：邮箱密码：苹果ID密码+注册信息(回答问题1：回答问题2：回答问题3)</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">2、账号说明：由于国内账号会屏蔽很多软件，需要用其他国家的ID下载，我们提供美国/韩国/日本/香港/台湾等地区的Apple id可以下载各类软件，没有限制。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">3、登录地址：https://appleid.apple.com/</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">4、您的 Apple ID 是您用于访问 Apple 服务的帐户，这些服务包括 App Store、Apple Music、iCloud、iMessage 信息、“FaceTime 通话”等。一般美国的苹果账号软件最全。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">Apple账号自动发货说明：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">1、点击购买，按页面提示操作,用USDT支付，网站自动发货，付款后不要关闭网站！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">2、苹果账号USDT购买，请仔细看付款金额，不要付错！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">3、如果没有收到账号，也可以自助提取，填写相应的单号和邮箱即可</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">4、请填写正确的邮箱，程序会自动发送卡密到邮箱，注意查收！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">其他问题说明：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">1、购买后请立即去管理中心修改密码，未修改密码造成账号丢失我们概不负责！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">2、每个国家所能下载的软件略有区别，更具自己需要购买。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">3、购买账号用于发送广告信息、推广产品等造成封号的，后果自负。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">4、账号修改密码和密保后，没有人可以盗走，不必担心安全问题。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">5、本站所售账号仅供用于正规用途，严禁用于违法用途，一经发现将配合相关部门查寻</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">6、账号购买之后最好不要去登录到自己的手机设置里，之登录app store&nbsp; 就可以了</p><p><br/></p>', 1, 0, 142, NULL, 200, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `goods` (`id`, `category_id`, `type`, `attach`, `wholesale`, `quota`, `name`, `agency_see`, `invented_sales`, `cover`, `images`, `is_sku`, `sku_name`, `detail`, `shelf`, `sales`, `stock`, `start_number`, `weigh`, `unit`, `course`, `pop_content`, `create_time`, `update_time`) VALUES
(202, 42, 'fixed', '[]', '[]', NULL, '德国苹果ID账号独享(带密保)-Apple独享账号批发', 0, 244, '/uploads/20241213/47da4ea8fdd1e06f3a7832294d6a113c.png', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">1、 账号格式：苹果ID账号：邮箱密码：苹果ID密码+注册信息(回答问题1：回答问题2：回答问题3)</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">2、账号说明：由于国内账号会屏蔽很多软件，需要用其他国家的ID下载，我们提供美国/韩国/日本/香港/台湾等地区的Apple id可以下载各类软件，没有限制。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">3、登录地址：https://appleid.apple.com/</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">4、您的 Apple ID 是您用于访问 Apple 服务的帐户，这些服务包括 App Store、Apple Music、iCloud、iMessage 信息、“FaceTime 通话”等。一般美国的苹果账号软件最全。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">Apple账号自动发货说明：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">1、点击购买，按页面提示操作,用USDT支付，网站自动发货，付款后不要关闭网站！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">2、苹果账号USDT购买，请仔细看付款金额，不要付错！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">3、如果没有收到账号，也可以自助提取，填写相应的单号和邮箱即可</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">4、请填写正确的邮箱，程序会自动发送卡密到邮箱，注意查收！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">其他问题说明：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">1、购买后请立即去管理中心修改密码，未修改密码造成账号丢失我们概不负责！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">2、每个国家所能下载的软件略有区别，更具自己需要购买。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">3、购买账号用于发送广告信息、推广产品等造成封号的，后果自负。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">4、账号修改密码和密保后，没有人可以盗走，不必担心安全问题。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">5、本站所售账号仅供用于正规用途，严禁用于违法用途，一经发现将配合相关部门查寻</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">6、账号购买之后最好不要去登录到自己的手机设置里，之登录app store&nbsp; 就可以了</p><p><br/></p>', 1, 0, 175, NULL, 201, NULL, NULL, NULL, NULL, NULL),
(203, 42, 'fixed', '[]', '[]', NULL, '美国苹果ID账号独享(带密保)-Apple独享账号批发', 0, 124, '/uploads/20241213/47da4ea8fdd1e06f3a7832294d6a113c.png', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">1、 账号格式：苹果ID账号：邮箱密码：苹果ID密码+注册信息(回答问题1：回答问题2：回答问题3)</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">2、账号说明：由于国内账号会屏蔽很多软件，需要用其他国家的ID下载，我们提供美国/韩国/日本/香港/台湾等地区的Apple id可以下载各类软件，没有限制。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">3、登录地址：https://appleid.apple.com/</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">4、您的 Apple ID 是您用于访问 Apple 服务的帐户，这些服务包括 App Store、Apple Music、iCloud、iMessage 信息、“FaceTime 通话”等。一般美国的苹果账号软件最全。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">Apple账号自动发货说明：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">1、点击购买，按页面提示操作,用USDT支付，网站自动发货，付款后不要关闭网站！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">2、苹果账号USDT购买，请仔细看付款金额，不要付错！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">3、如果没有收到账号，也可以自助提取，填写相应的单号和邮箱即可</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">4、请填写正确的邮箱，程序会自动发送卡密到邮箱，注意查收！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">其他问题说明：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">1、购买后请立即去管理中心修改密码，未修改密码造成账号丢失我们概不负责！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">2、每个国家所能下载的软件略有区别，更具自己需要购买。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">3、购买账号用于发送广告信息、推广产品等造成封号的，后果自负。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">4、账号修改密码和密保后，没有人可以盗走，不必担心安全问题。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">5、本站所售账号仅供用于正规用途，严禁用于违法用途，一经发现将配合相关部门查寻</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">6、账号购买之后最好不要去登录到自己的手机设置里，之登录app store&nbsp; 就可以了</p><p><br/></p>', 1, 0, 166, NULL, 202, NULL, NULL, NULL, NULL, NULL),
(204, 42, 'fixed', '[]', '[]', NULL, 'Google Voice 耐用号 gmail高质量个人GV 活跃gv-Google Voice账号批发', 0, 21, '/uploads/20241213/197940c387a44de95a0f30dd3894643f.png', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">发货账号格式：账号｜密码｜辅助邮箱｜gv号码</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">特别提醒，收到账号后请立即修改密码与辅助邮箱，必须修改！！！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">请使用干净！干净！干净！的美国IP全局代理进行转移（不懂去百度去谷歌)</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">不要转移到刚注册或注册没几天的谷歌账号中</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">发货说明：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">1、购买Google Voice账号USDT付款，网站自动发货，付款后不要关闭网站！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">2、购买Google Voice账号USDT付款请仔细看付款金额，不要付错，否则无法发货！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">3、若未收到请联系客服，不在线请留言，客服晚点会回复。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">4、若遇到问题请咨询客服，提供购买时填的名字或邮箱给客服查询。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">其他说明：&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">1、我们保证卖给你的每个账号都是全新一手的，只要不违反使用规则不被封号的情况下可以长期使用</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">2，我们严格管理已卖出的账号即时删档，都是有相应系统自动删档，绝对不会重复卖一个账号给第二个人</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">3，买到账号后发什么，怎么操作，效果好不好，这些关系到多方面的因素不是我们能控制的。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">4，购买后请立即去管理中心修改密码，未修改密码造成账号丢失我们概不负责</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">5，账号登录使用过，因不当操作导致被封号等不在售后范围&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">6.&nbsp; 严禁利用本站所出售账号实行任何违法行为</p><p><br/></p>', 1, 0, 211, NULL, 203, NULL, NULL, NULL, NULL, NULL),
(205, 42, 'fixed', '[]', '[]', NULL, 'Google Voice 新号 gmail 个人GV-Google Voice账号批发', 0, 12, '/uploads/20241213/197940c387a44de95a0f30dd3894643f.png', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">发货账号格式：账号｜密码｜辅助邮箱｜gv号码</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">特别提醒，收到账号后请立即修改密码与辅助邮箱，必须修改！！！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">请使用干净！干净！干净！的美国IP全局代理进行转移（不懂去百度去谷歌)</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">不要转移到刚注册或注册没几天的谷歌账号中</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">发货说明：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">1、购买Google Voice账号USDT付款，网站自动发货，付款后不要关闭网站！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">2、购买Google Voice账号USDT付款请仔细看付款金额，不要付错，否则无法发货！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">3、若未收到请联系客服，不在线请留言，客服晚点会回复。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">4、若遇到问题请咨询客服，提供购买时填的名字或邮箱给客服查询。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">其他说明：&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">1、我们保证卖给你的每个账号都是全新一手的，只要不违反使用规则不被封号的情况下可以长期使用</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">2，我们严格管理已卖出的账号即时删档，都是有相应系统自动删档，绝对不会重复卖一个账号给第二个人</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">3，买到账号后发什么，怎么操作，效果好不好，这些关系到多方面的因素不是我们能控制的。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">4，购买后请立即去管理中心修改密码，未修改密码造成账号丢失我们概不负责</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">5，账号登录使用过，因不当操作导致被封号等不在售后范围&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">6.&nbsp; 严禁利用本站所出售账号实行任何违法行为</p><p><br/></p>', 1, 0, 201, NULL, 204, NULL, NULL, NULL, NULL, NULL),
(206, 42, 'fixed', '[]', '[]', NULL, '500好友LinkedIn账号(美国)-Linkedin账号批发', 0, 15, '/uploads/20241213/4ed847006da598747172c07fc41348d3.png', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">1.账号描述：包含邮箱（yahoo.com），性别随机，登录时可能需要输入验证码，此时用账号自带的邮箱获取验证码即可；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">2. 账号格式：领英用户名---领英密码---邮箱用户名---邮箱密码---邮箱的辅助邮箱；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">3.&nbsp; 登录领英时验证码获取方法：登入雅虎邮箱获取验证码</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">&nbsp; &nbsp; Yahoo邮箱登录地址：https://login.yahoo.com/</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">&nbsp; &nbsp; 登入雅虎邮箱时，如果需要验证码才能登入邮箱的话，这时候登录shitmail邮箱获取雅虎邮箱的验证码，shitmail邮箱登入网址：shitmail.me，shitmail邮箱登入时不需要密码就可以登录；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">4. 使用建议：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">1)&nbsp; 登录前对设备进行清理（比如卸载手机上原来的LinkedIn APP、清除网页缓存），然后再登录账号；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">2)&nbsp; 登录后放3天，前3天不要动，不要改资料，3天后再开始操作；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">3)&nbsp; 开始操作后，可以开个会员，效果更佳；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">4）建议使用移动IP或者住宅IP，禁止使用机房IP，为每个帐户使用单独的私人代理；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">5）如果发现账号绑定了手机号码，自己根据实际情况权衡是否需要解绑；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">6）请不要更改个人资料名称；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">7）您可以添加新的详细信息，但不要删除以前的信息；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">8）请不要在登录后立即进行任何硬性更改。通过给他人的帖子点赞，并在您的个人资料上发布一些更新来稍微热身一下帐户。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">5. 关于售后：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">1）售后时间为24小时，请在24小时内对账号进行检查，超过24小时概不负责；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">2）包首登，其他不包，比如加人打招呼这些，不在售后范围内；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">3）个人操作引起的异常不售后。个人操作指修改资料、加好友，引流变现等；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">4）对功能细节的使用不负责。即能做什么，不能做什么，需要自己测试，比如能不能加好友打招呼，等等；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">5）售后请联系客服，必须提供以下3点：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">a）订单编号，如果订单中有多个账号，需指明是哪几个账号需要售后；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">b）存在什么问题，说清楚问题现象；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">c）问题截图</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">6）售后问题一般会在24小时内给出答复，如果超过24小时没有收到回复，请提醒，没有超过24小时，请勿催促，所有售后问题都会排队处理。</p><p style=\"margin-top: 0px; margin-bottom: 9px;\"><br/></p><p><br/></p>', 1, 0, 75, NULL, 205, NULL, NULL, NULL, NULL, NULL),
(207, 42, 'fixed', '[]', '[]', NULL, '1个月Linkedin账号(美国,用cookie登录)-Linkedin账号批发 库存充足,放心购买', 0, 241, '/uploads/20241213/4ed847006da598747172c07fc41348d3.png', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">1.账号描述：包含邮箱（yahoo.com），性别随机，登录时可能需要输入验证码，此时用账号自带的邮箱获取验证码即可；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">2. 账号格式：领英用户名---领英密码---邮箱用户名---邮箱密码---邮箱的辅助邮箱；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">3.&nbsp; 登录领英时验证码获取方法：登入雅虎邮箱获取验证码</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">&nbsp; &nbsp; Yahoo邮箱登录地址：https://login.yahoo.com/</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">&nbsp; &nbsp; 登入雅虎邮箱时，如果需要验证码才能登入邮箱的话，这时候登录shitmail邮箱获取雅虎邮箱的验证码，shitmail邮箱登入网址：shitmail.me，shitmail邮箱登入时不需要密码就可以登录；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">4. 使用建议：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">1)&nbsp; 登录前对设备进行清理（比如卸载手机上原来的LinkedIn APP、清除网页缓存），然后再登录账号；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">2)&nbsp; 登录后放3天，前3天不要动，不要改资料，3天后再开始操作；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">3)&nbsp; 开始操作后，可以开个会员，效果更佳；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">4）建议使用移动IP或者住宅IP，禁止使用机房IP，为每个帐户使用单独的私人代理；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">5）如果发现账号绑定了手机号码，自己根据实际情况权衡是否需要解绑；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">6）请不要更改个人资料名称；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">7）您可以添加新的详细信息，但不要删除以前的信息；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">8）请不要在登录后立即进行任何硬性更改。通过给他人的帖子点赞，并在您的个人资料上发布一些更新来稍微热身一下帐户。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">5. 关于售后：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">1）售后时间为24小时，请在24小时内对账号进行检查，超过24小时概不负责；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">2）包首登，其他不包，比如加人打招呼这些，不在售后范围内；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">3）个人操作引起的异常不售后。个人操作指修改资料、加好友，引流变现等；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">4）对功能细节的使用不负责。即能做什么，不能做什么，需要自己测试，比如能不能加好友打招呼，等等；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">5）售后请联系客服，必须提供以下3点：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">a）订单编号，如果订单中有多个账号，需指明是哪几个账号需要售后；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">b）存在什么问题，说清楚问题现象；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">c）问题截图</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">6）售后问题一般会在24小时内给出答复，如果超过24小时没有收到回复，请提醒，没有超过24小时，请勿催促，所有售后问题都会排队处理。</p><p><br/></p>', 1, 0, 121, NULL, 206, NULL, NULL, NULL, NULL, NULL),
(208, 42, 'fixed', '[]', '[]', NULL, 'Linkedin账号 新号-Linkedin账号批发', 0, 352, '/uploads/20241213/4ed847006da598747172c07fc41348d3.png', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">1.账号描述：包含邮箱（yahoo.com），性别随机，登录时可能需要输入验证码，此时用账号自带的邮箱获取验证码即可；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">2. 账号格式：领英用户名---领英密码---邮箱用户名---邮箱密码---邮箱的辅助邮箱；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">3.&nbsp; 登录领英时验证码获取方法：登入雅虎邮箱获取验证码</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">&nbsp; &nbsp; Yahoo邮箱登录地址：https://login.yahoo.com/</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">&nbsp; &nbsp; 登入雅虎邮箱时，如果需要验证码才能登入邮箱的话，这时候登录shitmail邮箱获取雅虎邮箱的验证码，shitmail邮箱登入网址：shitmail.me，shitmail邮箱登入时不需要密码就可以登录；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">4. 使用建议：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">1)&nbsp; 登录前对设备进行清理（比如卸载手机上原来的LinkedIn APP、清除网页缓存），然后再登录账号；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">2)&nbsp; 登录后放3天，前3天不要动，不要改资料，3天后再开始操作；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">3)&nbsp; 开始操作后，可以开个会员，效果更佳；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">4）建议使用移动IP或者住宅IP，禁止使用机房IP，为每个帐户使用单独的私人代理；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">5）如果发现账号绑定了手机号码，自己根据实际情况权衡是否需要解绑；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">6）请不要更改个人资料名称；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">7）您可以添加新的详细信息，但不要删除以前的信息；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">8）请不要在登录后立即进行任何硬性更改。通过给他人的帖子点赞，并在您的个人资料上发布一些更新来稍微热身一下帐户。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">5. 关于售后：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">1）售后时间为24小时，请在24小时内对账号进行检查，超过24小时概不负责；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">2）包首登，其他不包，比如加人打招呼这些，不在售后范围内；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">3）个人操作引起的异常不售后。个人操作指修改资料、加好友，引流变现等；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">4）对功能细节的使用不负责。即能做什么，不能做什么，需要自己测试，比如能不能加好友打招呼，等等；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">5）售后请联系客服，必须提供以下3点：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">a）订单编号，如果订单中有多个账号，需指明是哪几个账号需要售后；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">b）存在什么问题，说清楚问题现象；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">c）问题截图</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">6）售后问题一般会在24小时内给出答复，如果超过24小时没有收到回复，请提醒，没有超过24小时，请勿催促，所有售后问题都会排队处理。</p><p><br/></p>', 1, 0, 120, NULL, 207, NULL, NULL, NULL, NULL, NULL),
(209, 42, 'fixed', '[]', '[]', NULL, 'kakao账号(半年实名号)-kakao账号批发', 0, 21, '/uploads/20241213/b042a36a4e073fa1e5337b4a79fbea5e.png', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">账号发货格式：手机号---密码----邮箱</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">1、购买账号USDT付款，网站自动发货，付款后不要关闭网站！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">2、购买账号USDT付款请仔细看付款金额，不要付错，否则无法发货！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">3、若未收到请联系客服，不在线请留言，客服晚点会回复。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">4、若遇到问题请咨询客服，提供购买时填的名字或邮箱给客服查询。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">其他说明：&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">1、我们保证卖给你的每个账号都是全新一手的，只要不违反使用规则不被封号的情况下可以长期使用</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">2，我们严格管理已卖出的账号即时删档，都是有相应系统自动删档，绝对不会重复卖一个账号给第二个人</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">3，买到账号后发什么，怎么操作，效果好不好，这些关系到多方面的因素不是我们能控制的。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">4，购买后请立即去管理中心修改密码，未修改密码造成账号丢失我们概不负责</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">5，账号登录使用过，因不当操作导致被封号等不在售后范围&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">6.&nbsp; 严禁利用本站所出售账号实行任何违法行为</p><p><br/></p>', 1, 0, 176, NULL, 208, NULL, NULL, NULL, NULL, NULL),
(210, 42, 'fixed', '[]', '[]', NULL, 'kakao账号(满月号)-kakao账号批发', 0, 25, '/uploads/20241213/b042a36a4e073fa1e5337b4a79fbea5e.png', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">账号发货格式：手机号---密码----邮箱</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">1、购买账号USDT付款，网站自动发货，付款后不要关闭网站！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">2、购买账号USDT付款请仔细看付款金额，不要付错，否则无法发货！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">3、若未收到请联系客服，不在线请留言，客服晚点会回复。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">4、若遇到问题请咨询客服，提供购买时填的名字或邮箱给客服查询。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">其他说明：&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">1、我们保证卖给你的每个账号都是全新一手的，只要不违反使用规则不被封号的情况下可以长期使用</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">2，我们严格管理已卖出的账号即时删档，都是有相应系统自动删档，绝对不会重复卖一个账号给第二个人</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">3，买到账号后发什么，怎么操作，效果好不好，这些关系到多方面的因素不是我们能控制的。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">4，购买后请立即去管理中心修改密码，未修改密码造成账号丢失我们概不负责</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">5，账号登录使用过，因不当操作导致被封号等不在售后范围&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">6.&nbsp; 严禁利用本站所出售账号实行任何违法行为</p><p><br/></p>', 1, 0, 176, NULL, 209, NULL, NULL, NULL, NULL, NULL),
(211, 42, 'fixed', '[]', '[]', NULL, 'kakao账号 新号-kakao账号批发', 0, 21, '/uploads/20241213/b042a36a4e073fa1e5337b4a79fbea5e.png', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">账号发货格式：手机号---密码----邮箱</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">1、购买账号USDT付款，网站自动发货，付款后不要关闭网站！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">2、购买账号USDT付款请仔细看付款金额，不要付错，否则无法发货！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">3、若未收到请联系客服，不在线请留言，客服晚点会回复。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">4、若遇到问题请咨询客服，提供购买时填的名字或邮箱给客服查询。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">其他说明：&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">1、我们保证卖给你的每个账号都是全新一手的，只要不违反使用规则不被封号的情况下可以长期使用</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">2，我们严格管理已卖出的账号即时删档，都是有相应系统自动删档，绝对不会重复卖一个账号给第二个人</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">3，买到账号后发什么，怎么操作，效果好不好，这些关系到多方面的因素不是我们能控制的。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">4，购买后请立即去管理中心修改密码，未修改密码造成账号丢失我们概不负责</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">5，账号登录使用过，因不当操作导致被封号等不在售后范围&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">6.&nbsp; 严禁利用本站所出售账号实行任何违法行为</p><p><br/></p>', 1, 0, 174, NULL, 210, NULL, NULL, NULL, NULL, NULL),
(212, 42, 'fixed', '[]', '[]', NULL, 'Discord账号(满90天老号)-Discord账号批发', 0, 122, '/uploads/20241213/d294791bd89acb0daffe3b382e97abe9.png', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px; font-family: Georgia, Cambria, &quot;Times New Roman&quot;, Times, serif; color: rgb(52, 58, 64); font-size: 14px; text-wrap-mode: wrap;\">账号发货格式：账号(邮箱)----密码(邮箱密码)</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px; font-family: Georgia, Cambria, &quot;Times New Roman&quot;, Times, serif; color: rgb(52, 58, 64); font-size: 14px; text-wrap-mode: wrap;\">1、购买账号USDT付款，网站自动发货，付款后不要关闭网站！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px; font-family: Georgia, Cambria, &quot;Times New Roman&quot;, Times, serif; color: rgb(52, 58, 64); font-size: 14px; text-wrap-mode: wrap;\">2、购买账号USDT付款请仔细看付款金额，不要付错，否则无法发货！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px; font-family: Georgia, Cambria, &quot;Times New Roman&quot;, Times, serif; color: rgb(52, 58, 64); font-size: 14px; text-wrap-mode: wrap;\">3、若未收到请联系客服，不在线请留言，客服晚点会回复。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px; font-family: Georgia, Cambria, &quot;Times New Roman&quot;, Times, serif; color: rgb(52, 58, 64); font-size: 14px; text-wrap-mode: wrap;\">4、若遇到问题请咨询客服，提供购买时填的名字或邮箱给客服查询。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px; font-family: Georgia, Cambria, &quot;Times New Roman&quot;, Times, serif; color: rgb(52, 58, 64); font-size: 14px; text-wrap-mode: wrap;\">其他说明：&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px; font-family: Georgia, Cambria, &quot;Times New Roman&quot;, Times, serif; color: rgb(52, 58, 64); font-size: 14px; text-wrap-mode: wrap;\">1、我们保证卖给你的每个账号都是全新一手的，只要不违反使用规则不被封号的情况下可以长期使用</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px; font-family: Georgia, Cambria, &quot;Times New Roman&quot;, Times, serif; color: rgb(52, 58, 64); font-size: 14px; text-wrap-mode: wrap;\">2，我们严格管理已卖出的账号即时删档，都是有相应系统自动删档，绝对不会重复卖一个账号给第二个人</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px; font-family: Georgia, Cambria, &quot;Times New Roman&quot;, Times, serif; color: rgb(52, 58, 64); font-size: 14px; text-wrap-mode: wrap;\">3，买到账号后发什么，怎么操作，效果好不好，这些关系到多方面的因素不是我们能控制的。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px; font-family: Georgia, Cambria, &quot;Times New Roman&quot;, Times, serif; color: rgb(52, 58, 64); font-size: 14px; text-wrap-mode: wrap;\">4，购买后请立即去管理中心修改密码，未修改密码造成账号丢失我们概不负责</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px; font-family: Georgia, Cambria, &quot;Times New Roman&quot;, Times, serif; color: rgb(52, 58, 64); font-size: 14px; text-wrap-mode: wrap;\">5，账号登录使用过，因不当操作导致被封号等不在售后范围&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px; font-family: Georgia, Cambria, &quot;Times New Roman&quot;, Times, serif; color: rgb(52, 58, 64); font-size: 14px; text-wrap-mode: wrap;\">6.&nbsp; 严禁利用本站所出售账号实行任何违法行为</p><p style=\"margin-top: 0px; margin-bottom: 9px;\"><br/></p><p><br/></p>', 1, 0, 176, NULL, 211, NULL, NULL, NULL, NULL, NULL),
(213, 42, 'fixed', '[]', '[]', NULL, 'Discord账号(美国IP带token)-Discord账号批发', 0, 231, '/uploads/20241213/d294791bd89acb0daffe3b382e97abe9.png', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">账号发货格式：账号(邮箱)----密码(邮箱密码)---taken</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">1、购买账号USDT付款，网站自动发货，付款后不要关闭网站！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">2、购买账号USDT付款请仔细看付款金额，不要付错，否则无法发货！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">3、若未收到请联系客服，不在线请留言，客服晚点会回复。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">4、若遇到问题请咨询客服，提供购买时填的名字或邮箱给客服查询。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">其他说明：&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">1、我们保证卖给你的每个账号都是全新一手的，只要不违反使用规则不被封号的情况下可以长期使用</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">2，我们严格管理已卖出的账号即时删档，都是有相应系统自动删档，绝对不会重复卖一个账号给第二个人</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">3，买到账号后发什么，怎么操作，效果好不好，这些关系到多方面的因素不是我们能控制的。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">4，购买后请立即去管理中心修改密码，未修改密码造成账号丢失我们概不负责</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">5，账号登录使用过，因不当操作导致被封号等不在售后范围&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">6.&nbsp; 严禁利用本站所出售账号实行任何违法行为</p><p><br/></p>', 1, 0, 176, NULL, 212, NULL, NULL, NULL, NULL, NULL),
(214, 42, 'fixed', '[]', '[]', NULL, 'Discord账号 已绑手机-Discord账号批发', 0, 111, '/uploads/20241213/d294791bd89acb0daffe3b382e97abe9.png', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">账号发货格式：账号(邮箱)----密码(邮箱密码)</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">1、购买账号USDT付款，网站自动发货，付款后不要关闭网站！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">2、购买账号USDT付款请仔细看付款金额，不要付错，否则无法发货！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">3、若未收到请联系客服，不在线请留言，客服晚点会回复。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">4、若遇到问题请咨询客服，提供购买时填的名字或邮箱给客服查询。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">其他说明：&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">1、我们保证卖给你的每个账号都是全新一手的，只要不违反使用规则不被封号的情况下可以长期使用</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">2，我们严格管理已卖出的账号即时删档，都是有相应系统自动删档，绝对不会重复卖一个账号给第二个人</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">3，买到账号后发什么，怎么操作，效果好不好，这些关系到多方面的因素不是我们能控制的。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">4，购买后请立即去管理中心修改密码，未修改密码造成账号丢失我们概不负责</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">5，账号登录使用过，因不当操作导致被封号等不在售后范围&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">6.&nbsp; 严禁利用本站所出售账号实行任何违法行为</p><p style=\"margin-top: 0px; margin-bottom: 9px;\"><br/></p><p><br/></p>', 1, 0, 143, NULL, 213, NULL, NULL, NULL, NULL, NULL),
(215, 42, 'fixed', '[]', '[]', NULL, 'Twitter推特老号2009一2019注册 带5000粉丝-Twitter账号批发', 0, 23, '/uploads/20241213/dd24e61c9ecedfc8b1dad6989359a6a1.png', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">1、推特twitter账号格式为：账号+密码+邮箱+邮箱密码（若账号密码提示错误，请用邮箱作为用户名登录尝试）</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">2、twitter地址：http://www.twitter.com （需翻墙）</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">2.1、电脑登陆的，请用浏览器的隐私模式/小号模式登陆，不要一个浏览器登陆多个账号。账号登陆后不要退出！不要频繁切换账号！！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">2.2、APP登陆的，一定要先卸载原来的app，再重新安装！并且切换干净的ip，不要用垃圾的vpn，都几百几千人用的，ip早就被用烂了！登陆后不要退出，不要换账号！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">3、由于推特是国外网站，国内ip无法正常访问，需要翻墙才能访问，不懂的请不要拍！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">4、Twitter是一个社交网络与微博客服务，它可以让用户更新不超过140个字符的消息，现除中文、日文和韩文外已提高上限至280个字符，这些消息也被称作“推文”。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">这个服务是由杰克·多西在2006年3月创办并在当年7月启动的。Twitter风行于全世界多个国家，是互联网上访问量最大的十个网站之一。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">注意!成功登录推特之后，请先选择删除手机号，这样以后出现验证只需要通过邮箱就可以了！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">发货说明：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">1、购买账号USDT付款，网站自动发货，付款后不要关闭网站！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">2、购买账号USDT付款请仔细看付款金额，不要付错，否则无法发货！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">3、若未收到请联系客服，不在线请留言，客服晚点会回复。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">4、若遇到问题请咨询客服，提供购买时填的名字或邮箱给客服查询。</p><p><br/></p>', 1, 0, 163, NULL, 214, NULL, NULL, NULL, NULL, NULL),
(216, 42, 'fixed', '[]', '[]', NULL, 'Twitter推特小白号-Twitter账号批发', 0, 101, '/uploads/20241213/dd24e61c9ecedfc8b1dad6989359a6a1.png', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">1、推特twitter账号格式为：账号+密码+邮箱+邮箱密码（若账号密码提示错误，请用邮箱作为用户名登录尝试）</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">2、twitter地址：http://www.twitter.com （需翻墙）</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">2.1、电脑登陆的，请用浏览器的隐私模式/小号模式登陆，不要一个浏览器登陆多个账号。账号登陆后不要退出！不要频繁切换账号！！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">2.2、APP登陆的，一定要先卸载原来的app，再重新安装！并且切换干净的ip，不要用垃圾的vpn，都几百几千人用的，ip早就被用烂了！登陆后不要退出，不要换账号！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">3、由于推特是国外网站，国内ip无法正常访问，需要翻墙才能访问，不懂的请不要拍！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">4、Twitter是一个社交网络与微博客服务，它可以让用户更新不超过140个字符的消息，现除中文、日文和韩文外已提高上限至280个字符，这些消息也被称作“推文”。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">这个服务是由杰克·多西在2006年3月创办并在当年7月启动的。Twitter风行于全世界多个国家，是互联网上访问量最大的十个网站之一。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">注意!成功登录推特之后，请先选择删除手机号，这样以后出现验证只需要通过邮箱就可以了！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">发货说明：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">1、购买账号USDT付款，网站自动发货，付款后不要关闭网站！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">2、购买账号USDT付款请仔细看付款金额，不要付错，否则无法发货！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">3、若未收到请联系客服，不在线请留言，客服晚点会回复。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">4、若遇到问题请咨询客服，提供购买时填的名字或邮箱给客服查询。</p><p style=\"margin-top: 0px; margin-bottom: 9px;\"><br/></p><p><br/></p>', 1, 0, 123, NULL, 215, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `goods` (`id`, `category_id`, `type`, `attach`, `wholesale`, `quota`, `name`, `agency_see`, `invented_sales`, `cover`, `images`, `is_sku`, `sku_name`, `detail`, `shelf`, `sales`, `stock`, `start_number`, `weigh`, `unit`, `course`, `pop_content`, `create_time`, `update_time`) VALUES
(217, 42, 'fixed', '[]', '[]', NULL, 'Instagram2016一2020年注册 带10000粉丝-Instagram账号批发', 0, 14, '/uploads/20241213/fd50699e98849ef6a6d6cb1fa8e4a805.png', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">1、instagram账号格式为：账号—-密码—-邮箱—-邮箱密码（或者手机号）为了账号安全，长期自用请及时修改密保邮箱，并且绑定自己手机或开启两步验证</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">2、instagram地址：https://www.instagram.com （需翻墙，拍之前先确认自己的网络）</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">3、instagram是全球热门的社交平台，拥有非常庞大的客户群，近年来更是受到年轻群体的喜爱，和facebook都是著名的社交软件。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">4、Instagram（照片墙）是一款运行在移动端上的社交应用，以一种快速、美妙和有趣的方式将你随时抓拍下的图片彼此分享。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">2012年4月10号，Facebook宣布以10亿美元收购Instagram。2012年10月25号，Facebook以总值7.15亿美元收购Instagram。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">2012年12月，Facebook旗下的图片共享服务Instagram因其使用图片共享服务的新条款而在互联网上引起轩然大波，</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">Instagram对此进行了澄清，称不会在广告中使用或销售用户的照片，从而打消了用户的顾虑。北京时间2013年10月22日，</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">诺基亚宣布instagram将会入驻Windows Phone市场，11月21日Instagram正式登录Windows Phone 8平台</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">instagram账号发货说明：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">1、购买instagram账号USDT付款，网站自动发货，付款后不要关闭网站！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">2、购买 instagram 账号USDT付款请仔细看付款金额，不要付错，否则无法发货！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">3、若未收到instagram请联系客服，不在线请留言，客服晚点会回复。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">4、若遇到问题请咨询客服，提供购买时填的名字或邮箱给客服查询。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">instagram其他问题说明：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">1、登录instagram帐号前，请先清除浏览器cookie和缓存，或者用浏览器的隐私模式登录，也叫做小号模式。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">2、如果是手机APP登录，建议您卸载并重新安装 instagram APP。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">3、账号出售后请自己保存好，账号未作特殊说明的，请修改一切可以修改的信息，主要是安全邮箱、手机、密保等等，能修改成自己的一律修改，除非特殊说明不让修改的则不修改。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">4、若遇到问题请咨询客服，提供购买时填的名字或邮箱给客服查询。</p><p><br/></p>', 1, 0, 176, NULL, 216, NULL, NULL, NULL, NULL, NULL),
(218, 42, 'fixed', '[]', '[]', NULL, 'Instagram2016一2020年注册 带5000粉丝-Instagram账号批发', 0, 12, '/uploads/20241213/fd50699e98849ef6a6d6cb1fa8e4a805.png', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">1、instagram账号格式为：账号—-密码—-邮箱—-邮箱密码（或者手机号）为了账号安全，长期自用请及时修改密保邮箱，并且绑定自己手机或开启两步验证</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">2、instagram地址：https://www.instagram.com （需翻墙，拍之前先确认自己的网络）</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">3、instagram是全球热门的社交平台，拥有非常庞大的客户群，近年来更是受到年轻群体的喜爱，和facebook都是著名的社交软件。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">4、Instagram（照片墙）是一款运行在移动端上的社交应用，以一种快速、美妙和有趣的方式将你随时抓拍下的图片彼此分享。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">2012年4月10号，Facebook宣布以10亿美元收购Instagram。2012年10月25号，Facebook以总值7.15亿美元收购Instagram。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">2012年12月，Facebook旗下的图片共享服务Instagram因其使用图片共享服务的新条款而在互联网上引起轩然大波，</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">Instagram对此进行了澄清，称不会在广告中使用或销售用户的照片，从而打消了用户的顾虑。北京时间2013年10月22日，</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">诺基亚宣布instagram将会入驻Windows Phone市场，11月21日Instagram正式登录Windows Phone 8平台</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">instagram账号发货说明：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">1、购买instagram账号USDT付款，网站自动发货，付款后不要关闭网站！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">2、购买 instagram 账号USDT付款请仔细看付款金额，不要付错，否则无法发货！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">3、若未收到instagram请联系客服，不在线请留言，客服晚点会回复。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">4、若遇到问题请咨询客服，提供购买时填的名字或邮箱给客服查询。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">instagram其他问题说明：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">1、登录instagram帐号前，请先清除浏览器cookie和缓存，或者用浏览器的隐私模式登录，也叫做小号模式。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">2、如果是手机APP登录，建议您卸载并重新安装 instagram APP。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">3、账号出售后请自己保存好，账号未作特殊说明的，请修改一切可以修改的信息，主要是安全邮箱、手机、密保等等，能修改成自己的一律修改，除非特殊说明不让修改的则不修改。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">4、若遇到问题请咨询客服，提供购买时填的名字或邮箱给客服查询。</p><p><br/></p>', 1, 0, 156, NULL, 217, NULL, NULL, NULL, NULL, NULL),
(219, 42, 'fixed', '[]', '[]', NULL, 'Instagram小白号-Instagram账号批发', 0, 12, '/uploads/20241213/fd50699e98849ef6a6d6cb1fa8e4a805.png', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">1、instagram账号格式为：账号—-密码—-邮箱—-邮箱密码（或者手机号）为了账号安全，长期自用请及时修改密保邮箱，并且绑定自己手机或开启两步验证</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">2、instagram地址：https://www.instagram.com （需翻墙，拍之前先确认自己的网络）</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">3、instagram是全球热门的社交平台，拥有非常庞大的客户群，近年来更是受到年轻群体的喜爱，和facebook都是著名的社交软件。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">4、Instagram（照片墙）是一款运行在移动端上的社交应用，以一种快速、美妙和有趣的方式将你随时抓拍下的图片彼此分享。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">2012年4月10号，Facebook宣布以10亿美元收购Instagram。2012年10月25号，Facebook以总值7.15亿美元收购Instagram。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">2012年12月，Facebook旗下的图片共享服务Instagram因其使用图片共享服务的新条款而在互联网上引起轩然大波，</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">Instagram对此进行了澄清，称不会在广告中使用或销售用户的照片，从而打消了用户的顾虑。北京时间2013年10月22日，</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">诺基亚宣布instagram将会入驻Windows Phone市场，11月21日Instagram正式登录Windows Phone 8平台</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">instagram账号发货说明：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">1、购买instagram账号USDT付款，网站自动发货，付款后不要关闭网站！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">2、购买 instagram 账号USDT付款请仔细看付款金额，不要付错，否则无法发货！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">3、若未收到instagram请联系客服，不在线请留言，客服晚点会回复。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">4、若遇到问题请咨询客服，提供购买时填的名字或邮箱给客服查询。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">instagram其他问题说明：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">1、登录instagram帐号前，请先清除浏览器cookie和缓存，或者用浏览器的隐私模式登录，也叫做小号模式。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">2、如果是手机APP登录，建议您卸载并重新安装 instagram APP。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">3、账号出售后请自己保存好，账号未作特殊说明的，请修改一切可以修改的信息，主要是安全邮箱、手机、密保等等，能修改成自己的一律修改，除非特殊说明不让修改的则不修改。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">4、若遇到问题请咨询客服，提供购买时填的名字或邮箱给客服查询。</p><p><br/></p>', 1, 0, 77, NULL, 218, NULL, NULL, NULL, NULL, NULL),
(220, 7, 'fixed', '[]', '[]', NULL, '企绿标主号，三年,财经类', 0, 2, '/uploads/20241213/0ffac70e1434b46a534ce54e5afbe68a.png', NULL, 0, NULL, '<p><span style=\"color: rgb(68, 68, 68); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap;\">下单后请自行查看邮件或联系方客服。</span></p>', 1, 0, 123, NULL, 219, NULL, NULL, NULL, NULL, NULL),
(221, 7, 'fixed', '[]', '[]', NULL, '企业绿标主号，十年以上，营业执照长期', 0, 4, '/uploads/20241213/0ffac70e1434b46a534ce54e5afbe68a.png', NULL, 0, NULL, '<p><span style=\"color: rgb(68, 68, 68); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap;\">下单后请自行查看邮件或联系方客服。</span></p>', 1, 0, 140, NULL, 220, NULL, NULL, NULL, NULL, NULL),
(222, 7, 'fixed', '[]', '[]', NULL, '企业绿标主号，三年年以上，营业执照长期', 0, 5, '/uploads/20241213/0ffac70e1434b46a534ce54e5afbe68a.png', NULL, 0, NULL, '<p><span style=\"color: rgb(68, 68, 68); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap;\">下单后请自行查看邮件或联系方客服。</span></p>', 1, 0, 140, NULL, 221, NULL, NULL, NULL, NULL, NULL),
(223, 7, 'fixed', '[]', '[]', NULL, '企业绿标主号，一年以上,营业执照长期', 0, 9, '/uploads/20241213/0ffac70e1434b46a534ce54e5afbe68a.png', NULL, 0, NULL, '<p><span style=\"color: rgb(68, 68, 68); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap;\">下单后请自行查看邮件或联系方客服。</span></p>', 1, 0, 133, NULL, 222, NULL, NULL, NULL, NULL, NULL),
(224, 7, 'fixed', '[]', '[]', NULL, '微信实名带支付（半年号）', 0, 20, '/uploads/20241213/0ffac70e1434b46a534ce54e5afbe68a.png', NULL, 0, NULL, '<p><span style=\"color: rgb(68, 68, 68); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap;\">实卡接码养的号，下单后请自行查看邮件或联系方客服。</span></p>', 1, 0, 102, NULL, 223, NULL, NULL, NULL, NULL, NULL),
(225, 7, 'fixed', '[]', '[]', NULL, '微信实名满月号（1-3个月）', 0, 55, '/uploads/20241213/0ffac70e1434b46a534ce54e5afbe68a.png', NULL, 0, NULL, '<p><span style=\"color: rgb(68, 68, 68); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap;\">实卡接码养的号，下单后自行查看邮件或联系方客服</span></p>', 1, 0, 102, NULL, 224, NULL, NULL, NULL, NULL, NULL),
(226, 7, 'fixed', '[]', '[]', NULL, '微信无好友扫码解封', 0, 128, '/uploads/20241213/0ffac70e1434b46a534ce54e5afbe68a.png', NULL, 0, NULL, '<p><span style=\"color: rgb(68, 68, 68); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap;\">只能无好友解封，下单请联系客服发码</span></p>', 1, 0, 152, NULL, 225, NULL, NULL, NULL, NULL, NULL),
(227, 7, 'fixed', '[]', '[]', NULL, '1-3月微信白号（无实名）', 0, 25, '/uploads/20241213/0ffac70e1434b46a534ce54e5afbe68a.png', NULL, 0, NULL, '<p><span style=\"color: rgb(68, 68, 68); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap;\">实卡接码养的号，下单后联系方客服</span></p>', 1, 0, 140, NULL, 226, NULL, NULL, NULL, NULL, NULL),
(228, 7, 'fixed', '[]', '[]', NULL, '微信精养号带支付(2-3年)', 0, 45, '/uploads/20241213/0ffac70e1434b46a534ce54e5afbe68a.png', NULL, 0, NULL, '<p><span style=\"color: rgb(68, 68, 68); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap;\">精养号，全部带支付可用。下单拿单号找客服。</span></p>', 1, 0, 140, NULL, 227, NULL, NULL, NULL, NULL, NULL),
(229, 42, 'fixed', '[]', '[]', NULL, '全新（谷歌邮箱）创建7天以上邮件', 0, 214, '/uploads/20241213/a11ab484d99775d4a946b050fbb1baf1.png', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">关于售后：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">1）售后时间为24小时，请在24小时内对账号进行检查，超过24小时概不负责；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">2）包首登，其他不包，比如加人打招呼这些，不在售后范围内；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">3）个人操作引起的异常不售后。个人操作指修改资料、加好友，引流变现等；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">4）对功能细节的使用不负责。即能做什么，不能做什么，需要自己测试，比如能不能加好友打招呼，等等；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">5）售后请联系客服，必须提供以下3点：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">a）订单编号，如果订单中有多个账号，需指明是哪几个账号需要售后；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">b）存在什么问题，说清楚问题现象；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">c）问题截图</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">6）售后问题一般会在24小时内给出答复，如果超过24小时没有收到回复，请提醒，没有超过24小时，请勿催促，所有售后问题都会排队处理。</p><p><br/></p>', 1, 0, 104, NULL, 228, NULL, NULL, NULL, NULL, NULL),
(230, 42, 'fixed', '[]', '[]', NULL, '全新（谷歌联系方式）', 0, 86, '/uploads/20241213/a11ab484d99775d4a946b050fbb1baf1.png', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">关于售后：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">1）售后时间为24小时，请在24小时内对账号进行检查，超过24小时概不负责；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">2）包首登，其他不包，比如加人打招呼这些，不在售后范围内；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">3）个人操作引起的异常不售后。个人操作指修改资料、加好友，引流变现等；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">4）对功能细节的使用不负责。即能做什么，不能做什么，需要自己测试，比如能不能加好友打招呼，等等；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">5）售后请联系客服，必须提供以下3点：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">a）订单编号，如果订单中有多个账号，需指明是哪几个账号需要售后；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">b）存在什么问题，说清楚问题现象；</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">c）问题截图</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">6）售后问题一般会在24小时内给出答复，如果超过24小时没有收到回复，请提醒，没有超过24小时，请勿催促，所有售后问题都会排队处理。</p><p style=\"margin-top: 0px; margin-bottom: 9px;\"><br/></p><p><br/></p>', 1, 0, 242, NULL, 229, NULL, NULL, NULL, NULL, NULL),
(231, 42, 'fixed', '[]', '[]', NULL, '日本煤炉店铺号', 0, 24, '/uploads/20241213/2f9c51f36c18d71846a6bd784a609588.png', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 0px; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\"><span style=\"margin: 0px; padding: 0px;\">日本煤炉老号账号密码带店铺带080日本手机号码可重复接验证码</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\"><span style=\"margin: 0px; padding: 0px;\">带店铺！！！</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\"><span style=\"margin: 0px; padding: 0px;\">非常稳定的</span></p><p><br/></p>', 1, 0, 148, NULL, 230, NULL, NULL, NULL, NULL, NULL),
(232, 42, 'fixed', '[]', '[]', NULL, '一人独享Netflix(奈飞账号)', 0, 2, '/uploads/20241213/3db2c1c1bde1c468ecb5e6d39cea96d2.png', NULL, 0, NULL, '<h2 style=\"line-height: 1.2; color: rgb(51, 51, 51); margin: 0px; font-size: 14px; text-wrap-mode: wrap; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); letter-spacing: 0.5px;\"><span style=\"margin: 0px; padding: 0px; font-weight: bolder;\">1、账号有效期30天！</span></h2><h2 style=\"line-height: 1.2; color: rgb(51, 51, 51); margin: 0px; font-size: 14px; text-wrap-mode: wrap; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); letter-spacing: 0.5px;\">&nbsp;</h2><h2 style=\"line-height: 1.2; color: rgb(51, 51, 51); margin: 0px; font-size: 14px; text-wrap-mode: wrap; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); letter-spacing: 0.5px;\"><span style=\"margin: 0px; padding: 0px; font-weight: bolder;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2、一人独享，账户余额可见，放心使用，禁止修改密码！！</span></h2><h2 style=\"line-height: 1.2; color: rgb(51, 51, 51); margin: 0px; font-size: 14px; text-wrap-mode: wrap; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); letter-spacing: 0.5px;\">&nbsp;</h2><p style=\"margin-top: 0px; margin-bottom: 0px; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); font-weight: bold; letter-spacing: 0.5px;\">&nbsp;</p><h2 style=\"line-height: 1.2; color: rgb(51, 51, 51); margin: 0px; font-size: 14px; text-wrap-mode: wrap; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); letter-spacing: 0.5px;\"><span style=\"margin: 0px; padding: 0px; font-weight: bolder;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3、支持4K超清画质影片，可建立独立观影。</span></h2><p style=\"margin-top: 0px; margin-bottom: 0px; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); font-weight: bold; letter-spacing: 0.5px;\"><span style=\"margin: 0px; padding: 0px; color: blue; font-size: 24px;\"><span style=\"margin: 0px; padding: 0px; font-weight: bolder;\"><span style=\"margin: 0px; padding: 0px; text-decoration-line: underline;\"><span style=\"margin: 0px; padding: 0px; font-weight: bolder;\">使用指南：</span></span></span></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); font-weight: bold; letter-spacing: 0.5px;\"><span style=\"margin: 0px; padding: 0px; font-weight: bolder;\"><span style=\"margin: 0px; padding: 0px; font-weight: bolder;\">&nbsp; &nbsp;&nbsp;<span style=\"margin: 0px; padding: 0px; color: rgb(168, 50, 226); font-size: 16px;\"><span style=\"margin: 0px; padding: 0px; font-weight: bolder;\">&nbsp; &nbsp;1、登入后请自己按+号新建一个头像，每人只能新建一个(名字建议带上【已有人】)，没有+号的用第一个蓝色的,不要使用别人的！</span></span></span></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); font-weight: bold; letter-spacing: 0.5px;\"><span style=\"margin: 0px; padding: 0px; font-weight: bolder;\"><span style=\"margin: 0px; padding: 0px; font-weight: bolder;\"><span style=\"margin: 0px; padding: 0px; color: rgb(168, 50, 226); font-size: 16px;\">&nbsp; &nbsp; &nbsp; &nbsp; 2、请不要试图修改邮箱或者密码，可用付款【礼品卡号信息】申诉回来。</span></span></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); font-weight: bold; letter-spacing: 0.5px;\">&nbsp;</p><hr style=\"box-sizing: border-box; height: 1px; margin: 10px 0px; border-top: 0px; font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px; color: rgb(68, 68, 68); background-color: rgb(230, 230, 230); opacity: 0.25; clear: both;\"/><p style=\"margin-top: 0px; margin-bottom: 0px; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); font-weight: bold; letter-spacing: 0.5px;\"><span style=\"margin: 0px; padding: 0px; font-weight: bolder;\"><span style=\"margin: 0px; padding: 0px; font-weight: bolder;\"><span style=\"margin: 0px; padding: 0px; color: red; font-size: 24px;\">严禁以下行为，违者取消账户使用权：</span></span></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); font-weight: bold; letter-spacing: 0.5px;\"><span style=\"margin: 0px; padding: 0px; font-weight: bolder;\"><span style=\"margin: 0px; padding: 0px; font-weight: bolder;\"><span style=\"margin: 0px; padding: 0px; font-weight: bolder;\">&nbsp; &nbsp; &nbsp;<span style=\"margin: 0px; padding: 0px; color: rgb(168, 50, 226); font-size: 16px;\"><span style=\"margin: 0px; padding: 0px; font-weight: bolder;\">&nbsp;</span></span></span></span></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); font-weight: bold; letter-spacing: 0.5px;\"><span style=\"margin: 0px; padding: 0px; font-weight: bolder;\"><span style=\"margin: 0px; padding: 0px; font-weight: bolder;\"><span style=\"margin: 0px; padding: 0px; color: rgb(168, 50, 226); font-size: 16px;\">1、占用、删除、修改；他人的角色！！</span></span></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); font-weight: bold; letter-spacing: 0.5px;\"><span style=\"margin: 0px; padding: 0px; font-weight: bolder;\"><span style=\"margin: 0px; padding: 0px; font-weight: bolder;\"><span style=\"margin: 0px; padding: 0px; color: rgb(168, 50, 226); font-size: 16px;\">&nbsp; 2、同时多台设备观看！！！</span></span></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); font-weight: bold; letter-spacing: 0.5px;\"><span style=\"margin: 0px; padding: 0px; font-weight: bolder;\"><span style=\"margin: 0px; padding: 0px; font-weight: bolder;\"><span style=\"margin: 0px; padding: 0px; color: rgb(168, 50, 226); font-size: 16px;\">&nbsp; 3、私自修改账户密码、邮箱等！</span></span></span></p><hr style=\"box-sizing: border-box; height: 1px; margin: 10px 0px; border-top: 0px; font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px; color: rgb(68, 68, 68); background-color: rgb(230, 230, 230); opacity: 0.25; clear: both;\"/><p style=\"margin-top: 0px; margin-bottom: 0px; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); font-weight: bold; letter-spacing: 0.5px;\"><span style=\"margin: 0px; padding: 0px; font-weight: bolder;\">&nbsp;</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); font-weight: bold; letter-spacing: 0.5px;\"><span style=\"margin: 0px; padding: 0px; font-weight: bolder;\"><span style=\"margin: 0px; padding: 0px; font-weight: bolder;\"><span style=\"margin: 0px; padding: 0px; color: rgb(0, 176, 240); font-size: 24px;\">关于正规车密码老是不对的温馨提示：</span></span></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); font-weight: bold; letter-spacing: 0.5px;\"><span style=\"margin: 0px; padding: 0px; font-weight: bolder;\"><span style=\"margin: 0px; padding: 0px; font-weight: bolder;\"><span style=\"margin: 0px; padding: 0px; font-weight: bolder;\">&nbsp; &nbsp; &nbsp; &nbsp;<span style=\"margin: 0px; padding: 0px; color: rgb(192, 80, 77); font-size: 16px;\">&nbsp;1、NF对于异常登录（新设备、新节点）大概率会自动重置你的密码，导致你登录不上提示密码错误，这时候你联系客服，客服给你找回了密码，看似没了问题了，但是有些人登录完网页开始登录app，或者换个节点退出账号重新登录，密码又被重置了，又要联系客服，我见过一个号密码被重置了6、7次还需要找回</span></span></span></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); font-weight: bold; letter-spacing: 0.5px;\"><span style=\"margin: 0px; padding: 0px; font-weight: bolder;\"><span style=\"margin: 0px; padding: 0px; font-weight: bolder;\"><span style=\"margin: 0px; padding: 0px; font-weight: bolder;\"><span style=\"margin: 0px; padding: 0px; color: rgb(192, 80, 77); font-size: 16px;\">&nbsp; &nbsp; &nbsp; &nbsp; 2、因此建议大家：不要频繁登录，拿到号想好哪些设备，登录了就不要退出，下次用直接看就行了，没事别这个设备登那个设备登，登上了就别退出行不行，真的累</span></span></span></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); font-weight: bold; letter-spacing: 0.5px;\"><span style=\"margin: 0px; padding: 0px; font-weight: bolder;\"><span style=\"margin: 0px; padding: 0px; font-weight: bolder;\"><span style=\"margin: 0px; padding: 0px; font-weight: bolder;\"><span style=\"margin: 0px; padding: 0px; color: rgb(192, 80, 77); font-size: 16px;\"><span style=\"margin: 0px; padding: 0px; font-weight: bolder;\">&nbsp; &nbsp; &nbsp; &nbsp;</span>&nbsp;2、同时多台设备观看！！！<br/></span></span></span></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); font-weight: bold; letter-spacing: 0.5px;\"><span style=\"margin: 0px; padding: 0px; font-weight: bolder;\"><span style=\"margin: 0px; padding: 0px; font-weight: bolder;\"><span style=\"margin: 0px; padding: 0px; font-weight: bolder;\"><span style=\"margin: 0px; padding: 0px; color: rgb(192, 80, 77); font-size: 16px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3、私自修改账户密码、邮箱等！！</span></span></span></span></p><hr style=\"box-sizing: border-box; height: 1px; margin: 10px 0px; border-top: 0px; font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px; color: rgb(68, 68, 68); background-color: rgb(230, 230, 230); opacity: 0.25; clear: both;\"/><p style=\"margin-top: 0px; margin-bottom: 0px; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); font-weight: bold; letter-spacing: 0.5px;\"><span style=\"margin: 0px; padding: 0px; font-weight: bolder;\"><span style=\"margin: 0px; padding: 0px; font-weight: bolder;\"><span style=\"margin: 0px; padding: 0px; font-weight: bolder;\"><span style=\"margin: 0px; padding: 0px; font-weight: bolder;\"><br/></span><span style=\"margin: 0px; padding: 0px; color: red; font-size: 24px;\"><span style=\"margin: 0px; padding: 0px; font-weight: bolder;\">注意：</span></span></span></span></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); font-weight: bold; letter-spacing: 0.5px;\"><span style=\"margin: 0px; padding: 0px; font-weight: bolder;\"><span style=\"margin: 0px; padding: 0px; font-weight: bolder;\"><span style=\"margin: 0px; padding: 0px; color: red; font-size: 24px;\"><span style=\"margin: 0px; padding: 0px; font-weight: bolder;\"><span style=\"margin: 0px; padding: 0px; text-decoration-line: underline;\">1、禁止修改密码、共享或者泄露账号信息，请进自己的车位，不要乱动乱进别人资料，如发现以上行为一律取消账号使用权&nbsp;</span></span></span></span></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); font-weight: bold; letter-spacing: 0.5px;\">&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 0px; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); font-weight: bold; letter-spacing: 0.5px;\"><span style=\"margin: 0px; padding: 0px; font-weight: bolder;\"><span style=\"margin: 0px; padding: 0px; font-weight: bolder;\"><span style=\"margin: 0px; padding: 0px; color: red; font-size: 24px;\"><span style=\"margin: 0px; padding: 0px; text-decoration-line: underline;\"><span style=\"margin: 0px; padding: 0px; font-weight: bolder;\">&nbsp;2、每个人只能1台设备同时在线，登录账号后无需退出账号，避免频繁登录导致密码被系统重置！</span></span></span></span></span></p><h2 style=\"line-height: 1.2; color: rgb(51, 51, 51); margin: 0px; font-size: 14px; text-wrap-mode: wrap; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); letter-spacing: 0.5px;\"><span style=\"margin: 0px; padding: 0px; font-weight: bolder;\">1、账号有效期30天！</span></h2><h2 style=\"line-height: 1.2; color: rgb(51, 51, 51); margin: 0px; font-size: 14px; text-wrap-mode: wrap; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); letter-spacing: 0.5px;\">&nbsp;</h2><h2 style=\"line-height: 1.2; color: rgb(51, 51, 51); margin: 0px; font-size: 14px; text-wrap-mode: wrap; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); letter-spacing: 0.5px;\"><span style=\"margin: 0px; padding: 0px; font-weight: bolder;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2、一人独享，账户余额可见，放心使用，禁止修改密码！！</span></h2><h2 style=\"line-height: 1.2; color: rgb(51, 51, 51); margin: 0px; font-size: 14px; text-wrap-mode: wrap; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); letter-spacing: 0.5px;\">&nbsp;</h2><p style=\"margin-top: 0px; margin-bottom: 0px; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); font-weight: bold; letter-spacing: 0.5px;\">&nbsp;</p><h2 style=\"line-height: 1.2; color: rgb(51, 51, 51); margin: 0px; font-size: 14px; text-wrap-mode: wrap; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); letter-spacing: 0.5px;\"><span style=\"margin: 0px; padding: 0px; font-weight: bolder;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3、支持4K超清画质影片，可建立独立观影。</span></h2><p style=\"margin-top: 0px; margin-bottom: 0px; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); font-weight: bold; letter-spacing: 0.5px;\"><span style=\"margin: 0px; padding: 0px; color: blue; font-size: 24px;\"><span style=\"margin: 0px; padding: 0px; font-weight: bolder;\"><span style=\"margin: 0px; padding: 0px; text-decoration-line: underline;\"><span style=\"margin: 0px; padding: 0px; font-weight: bolder;\">使用指南：</span></span></span></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); font-weight: bold; letter-spacing: 0.5px;\"><span style=\"margin: 0px; padding: 0px; font-weight: bolder;\"><span style=\"margin: 0px; padding: 0px; font-weight: bolder;\">&nbsp; &nbsp;&nbsp;<span style=\"margin: 0px; padding: 0px; color: rgb(168, 50, 226); font-size: 16px;\"><span style=\"margin: 0px; padding: 0px; font-weight: bolder;\">&nbsp; &nbsp;1、登入后请自己按+号新建一个头像，每人只能新建一个(名字建议带上【已有人】)，没有+号的用第一个蓝色的,不要使用别人的！</span></span></span></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); font-weight: bold; letter-spacing: 0.5px;\"><span style=\"margin: 0px; padding: 0px; font-weight: bolder;\"><span style=\"margin: 0px; padding: 0px; font-weight: bolder;\"><span style=\"margin: 0px; padding: 0px; color: rgb(168, 50, 226); font-size: 16px;\">&nbsp; &nbsp; &nbsp; &nbsp; 2、请不要试图修改邮箱或者密码，可用付款【礼品卡号信息】申诉回来。</span></span></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); font-weight: bold; letter-spacing: 0.5px;\">&nbsp;</p><hr style=\"box-sizing: border-box; height: 1px; margin: 10px 0px; border-top: 0px; font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px; color: rgb(68, 68, 68); background-color: rgb(230, 230, 230); opacity: 0.25; clear: both;\"/><p style=\"margin-top: 0px; margin-bottom: 0px; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); font-weight: bold; letter-spacing: 0.5px;\"><span style=\"margin: 0px; padding: 0px; font-weight: bolder;\"><span style=\"margin: 0px; padding: 0px; font-weight: bolder;\"><span style=\"margin: 0px; padding: 0px; color: red; font-size: 24px;\">严禁以下行为，违者取消账户使用权：</span></span></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); font-weight: bold; letter-spacing: 0.5px;\"><span style=\"margin: 0px; padding: 0px; font-weight: bolder;\"><span style=\"margin: 0px; padding: 0px; font-weight: bolder;\"><span style=\"margin: 0px; padding: 0px; font-weight: bolder;\">&nbsp; &nbsp; &nbsp;<span style=\"margin: 0px; padding: 0px; color: rgb(168, 50, 226); font-size: 16px;\"><span style=\"margin: 0px; padding: 0px; font-weight: bolder;\">&nbsp;</span></span></span></span></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); font-weight: bold; letter-spacing: 0.5px;\"><span style=\"margin: 0px; padding: 0px; font-weight: bolder;\"><span style=\"margin: 0px; padding: 0px; font-weight: bolder;\"><span style=\"margin: 0px; padding: 0px; color: rgb(168, 50, 226); font-size: 16px;\">1、占用、删除、修改；他人的角色！！</span></span></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); font-weight: bold; letter-spacing: 0.5px;\"><span style=\"margin: 0px; padding: 0px; font-weight: bolder;\"><span style=\"margin: 0px; padding: 0px; font-weight: bolder;\"><span style=\"margin: 0px; padding: 0px; color: rgb(168, 50, 226); font-size: 16px;\">&nbsp; 2、同时多台设备观看！！！</span></span></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); font-weight: bold; letter-spacing: 0.5px;\"><span style=\"margin: 0px; padding: 0px; font-weight: bolder;\"><span style=\"margin: 0px; padding: 0px; font-weight: bolder;\"><span style=\"margin: 0px; padding: 0px; color: rgb(168, 50, 226); font-size: 16px;\">&nbsp; 3、私自修改账户密码、邮箱等！</span></span></span></p><hr style=\"box-sizing: border-box; height: 1px; margin: 10px 0px; border-top: 0px; font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px; color: rgb(68, 68, 68); background-color: rgb(230, 230, 230); opacity: 0.25; clear: both;\"/><p style=\"margin-top: 0px; margin-bottom: 0px; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); font-weight: bold; letter-spacing: 0.5px;\"><span style=\"margin: 0px; padding: 0px; font-weight: bolder;\">&nbsp;</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); font-weight: bold; letter-spacing: 0.5px;\"><span style=\"margin: 0px; padding: 0px; font-weight: bolder;\"><span style=\"margin: 0px; padding: 0px; font-weight: bolder;\"><span style=\"margin: 0px; padding: 0px; color: rgb(0, 176, 240); font-size: 24px;\">关于正规车密码老是不对的温馨提示：</span></span></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); font-weight: bold; letter-spacing: 0.5px;\"><span style=\"margin: 0px; padding: 0px; font-weight: bolder;\"><span style=\"margin: 0px; padding: 0px; font-weight: bolder;\"><span style=\"margin: 0px; padding: 0px; font-weight: bolder;\">&nbsp; &nbsp; &nbsp; &nbsp;<span style=\"margin: 0px; padding: 0px; color: rgb(192, 80, 77); font-size: 16px;\">&nbsp;1、NF对于异常登录（新设备、新节点）大概率会自动重置你的密码，导致你登录不上提示密码错误，这时候你联系客服，客服给你找回了密码，看似没了问题了，但是有些人登录完网页开始登录app，或者换个节点退出账号重新登录，密码又被重置了，又要联系客服，我见过一个号密码被重置了6、7次还需要找回</span></span></span></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); font-weight: bold; letter-spacing: 0.5px;\"><span style=\"margin: 0px; padding: 0px; font-weight: bolder;\"><span style=\"margin: 0px; padding: 0px; font-weight: bolder;\"><span style=\"margin: 0px; padding: 0px; font-weight: bolder;\"><span style=\"margin: 0px; padding: 0px; color: rgb(192, 80, 77); font-size: 16px;\">&nbsp; &nbsp; &nbsp; &nbsp; 2、因此建议大家：不要频繁登录，拿到号想好哪些设备，登录了就不要退出，下次用直接看就行了，没事别这个设备登那个设备登，登上了就别退出行不行，真的累</span></span></span></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); font-weight: bold; letter-spacing: 0.5px;\"><span style=\"margin: 0px; padding: 0px; font-weight: bolder;\"><span style=\"margin: 0px; padding: 0px; font-weight: bolder;\"><span style=\"margin: 0px; padding: 0px; font-weight: bolder;\"><span style=\"margin: 0px; padding: 0px; color: rgb(192, 80, 77); font-size: 16px;\"><span style=\"margin: 0px; padding: 0px; font-weight: bolder;\">&nbsp; &nbsp; &nbsp; &nbsp;</span>&nbsp;2、同时多台设备观看！！！<br/></span></span></span></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); font-weight: bold; letter-spacing: 0.5px;\"><span style=\"margin: 0px; padding: 0px; font-weight: bolder;\"><span style=\"margin: 0px; padding: 0px; font-weight: bolder;\"><span style=\"margin: 0px; padding: 0px; font-weight: bolder;\"><span style=\"margin: 0px; padding: 0px; color: rgb(192, 80, 77); font-size: 16px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3、私自修改账户密码、邮箱等！！</span></span></span></span></p><hr style=\"box-sizing: border-box; height: 1px; margin: 10px 0px; border-top: 0px; font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px; color: rgb(68, 68, 68); background-color: rgb(230, 230, 230); opacity: 0.25; clear: both;\"/><p style=\"margin-top: 0px; margin-bottom: 0px; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); font-weight: bold; letter-spacing: 0.5px;\"><span style=\"margin: 0px; padding: 0px; font-weight: bolder;\"><span style=\"margin: 0px; padding: 0px; font-weight: bolder;\"><span style=\"margin: 0px; padding: 0px; font-weight: bolder;\"><span style=\"margin: 0px; padding: 0px; font-weight: bolder;\"><br/></span><span style=\"margin: 0px; padding: 0px; color: red; font-size: 24px;\"><span style=\"margin: 0px; padding: 0px; font-weight: bolder;\">注意：</span></span></span></span></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); font-weight: bold; letter-spacing: 0.5px;\"><span style=\"margin: 0px; padding: 0px; font-weight: bolder;\"><span style=\"margin: 0px; padding: 0px; font-weight: bolder;\"><span style=\"margin: 0px; padding: 0px; color: red; font-size: 24px;\"><span style=\"margin: 0px; padding: 0px; font-weight: bolder;\"><span style=\"margin: 0px; padding: 0px; text-decoration-line: underline;\">1、禁止修改密码、共享或者泄露账号信息，请进自己的车位，不要乱动乱进别人资料，如发现以上行为一律取消账号使用权&nbsp;</span></span></span></span></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); font-weight: bold; letter-spacing: 0.5px;\">&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 0px; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); font-weight: bold; letter-spacing: 0.5px;\"><span style=\"margin: 0px; padding: 0px; font-weight: bolder;\"><span style=\"margin: 0px; padding: 0px; font-weight: bolder;\"><span style=\"margin: 0px; padding: 0px; color: red; font-size: 24px;\"><span style=\"margin: 0px; padding: 0px; text-decoration-line: underline;\"><span style=\"margin: 0px; padding: 0px; font-weight: bolder;\">&nbsp;2、每个人只能1台设备同时在线，登录账号后无需退出账号，避免频繁登录导致密码被系统重置！</span></span></span></span></span></p><p><br/></p>', 1, 0, 143, NULL, 231, NULL, NULL, NULL, NULL, NULL),
(233, 42, 'fixed', '[]', '[]', NULL, '小额度5美元 | 美国 Apple iTunes | 苹果礼品卡购买| 出售iTunes礼品卡|', 0, 43, '/uploads/20241213/054828adaa504728a747984be687c5fa.png', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 9px; padding: 0px; font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); font-weight: bold; letter-spacing: 0.5px; color: rgb(97, 97, 97);\"><span style=\"margin: 0px; padding: 0px; font-size: 18px;\">发货内容：5美金礼品卡、美国&nbsp;iTunes Store&nbsp;礼品卡</span></p><p style=\"margin-top: 0px; margin-bottom: 9px; padding: 0px; font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); font-weight: bold; letter-spacing: 0.5px; color: rgb(97, 97, 97);\"><span style=\"margin: 0px; padding: 0px; font-size: 18px;\">商品说明：正品礼品卡、非黑卡、长期有效</span></p><p style=\"margin-top: 0px; margin-bottom: 9px; padding: 0px; font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); font-weight: bold; letter-spacing: 0.5px; color: rgb(97, 97, 97);\"><span style=\"margin: 0px; padding: 0px; font-size: 18px;\">免税设置教程：<a href=\"https://www.v2ex.com/t/866775\" target=\"_blank\" style=\"color: rgb(0, 123, 255); outline: none; margin: 0px; padding: 0px; transition: color 0.2s, border-color 0.2s, background 0.2s, opacity 0.2s; outline-offset: -2px;\"><span style=\"margin: 0px; padding: 0px; text-decoration-line: underline;\">https://www.v2ex.com/t/866775</span></a><br/></span></p><p style=\"margin-top: 0px; margin-bottom: 9px; padding: 0px; font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); font-weight: bold; letter-spacing: 0.5px; color: rgb(97, 97, 97);\"><span style=\"margin: 0px; padding: 0px; font-size: 18px;\">兑换礼品卡教程：<a href=\"https://txh9p8lrxyo.feishu.cn/docx/RFNLd6h92obvpmxqX1LcFrPfnBc?from=from_copylink\" target=\"_blank\" style=\"color: rgb(0, 123, 255); outline: 0px; margin: 0px; padding: 0px; transition: color 0.2s, border-color 0.2s, background 0.2s, opacity 0.2s;\"><span style=\"margin: 0px; padding: 0px; text-decoration-line: underline;\">https://txh9p8lrxyo.feishu.cn/docx/RFNLd6h92obvpmxqX1LcFrPfnBc?from=from_copylink</span></a></span></p><p style=\"margin-top: 0px; margin-bottom: 9px; padding: 0px; font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); font-weight: bold; letter-spacing: 0.5px; color: rgb(97, 97, 97);\"><span style=\"margin: 0px; padding: 0px; font-size: 18px;\">使用提示：若充值以后提示额度不足，是税收的问题，改成免税区，或者在添加税收金额的礼品卡即可。</span></p><p style=\"margin-top: 0px; margin-bottom: 9px; padding: 0px; font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); font-weight: bold; letter-spacing: 0.5px; color: rgb(97, 97, 97);\"><span style=\"margin: 0px; padding: 0px; font-size: 18px;\">税收具体不确定，但一般不会超过产品本身的单价&nbsp;</span></p><p style=\"margin-top: 0px; margin-bottom: 9px;\"><br/></p><p><br/></p>', 1, 0, 134, NULL, 232, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `goods` (`id`, `category_id`, `type`, `attach`, `wholesale`, `quota`, `name`, `agency_see`, `invented_sales`, `cover`, `images`, `is_sku`, `sku_name`, `detail`, `shelf`, `sales`, `stock`, `start_number`, `weigh`, `unit`, `course`, `pop_content`, `create_time`, `update_time`) VALUES
(234, 42, 'fixed', '[]', '[]', NULL, '美团账号', 0, 53, '/uploads/20241213/2cc909e91f18f5338a1bc83144795323.png', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">商品名称：美团普通账号</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">商品描述：这个美团软件账号提供一个安全、合法的方式来进行美团平台的操作和流程。该套装包含一个美团软件账号，您可以通过该账号熟悉点餐、支付、配送等过程，并了解美团平台的功能和特点。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">特色功能：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">真实用户体验：通过该账号，您可以不同用户角色，如顾客、商家和配送员，深入了解各个环节的操作和交互。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">学习美团平台流程：从下单到配送，您将有机会通过该账号学习美团平台的完整流程，包括浏览菜单、选择餐品、下单支付、评价等。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">熟悉美团平台界面：通过使用该账号，您可以熟悉美团平台的界面设计、功能布局和操作逻辑，提高对美团软件的熟悉度。</p><p><br/></p>', 1, 0, 153, NULL, 233, NULL, NULL, NULL, NULL, NULL),
(235, 8, 'fixed', '[]', '[]', NULL, '私人qq皇冠 45U', 0, 24, '/uploads/20241213/2547e4d226ecb95ff0a8437d39928674.png', NULL, 0, NULL, '<p><span style=\"color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap;\">绑定港咔，留咔接码三个月，咔到期可续，上号后支持换绑自己港咔，纯私人活跃非挂机号，包功能正常包永久找回，目前最耐操！</span></p>', 1, 0, 143, NULL, 234, NULL, NULL, NULL, NULL, NULL),
(236, 8, 'fixed', '[]', '[]', NULL, '私人qq三太', 0, 24, '/uploads/20241213/2547e4d226ecb95ff0a8437d39928674.png', NULL, 0, NULL, '<p><span style=\"color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap;\">绑定港咔，留咔接码三个月，咔到期可续，上号后支持换绑自己港咔，纯私人活跃非挂机号，包功能正常包永久找回，目前最耐操！</span></p>', 1, 0, 243, NULL, 235, NULL, NULL, NULL, NULL, NULL),
(237, 8, 'fixed', '[]', '[]', NULL, '私人qq双太', 0, 34, '/uploads/20241213/2547e4d226ecb95ff0a8437d39928674.png', NULL, 0, NULL, '<p><span style=\"color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap;\">绑定港咔，留咔接码三个月，咔到期可续，上号后支持换绑自己港咔，纯私人活跃非挂机号，包功能正常包永久找回，目前最耐操！</span></p>', 1, 0, 240, NULL, 236, NULL, NULL, NULL, NULL, NULL),
(238, 8, 'fixed', '[]', '[]', NULL, 'QQ无好友解封', 0, 24, '/uploads/20241213/2547e4d226ecb95ff0a8437d39928674.png', NULL, 0, NULL, '<p><span style=\"color: rgb(52, 58, 64); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap;\">下单后，请联系客服，提供需要解封QQ号及密码。</span></p>', 1, 0, 99999, NULL, 237, NULL, NULL, NULL, NULL, NULL),
(239, 8, 'fixed', '[]', '[]', NULL, 'QQ账号（实名）可换绑-半年账号', 0, 23, '/uploads/20241213/2547e4d226ecb95ff0a8437d39928674.png', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">发货账号格式：qq号---密码---手机号</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">发货说明：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">1、购买账号USDT付款，网站自动发货，付款后不要关闭网站！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">2、购买账号USDT付款请仔细看付款金额，不要付错，否则无法发货！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">3、若未收到请联系客服，不在线请留言，客服晚点会回复。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">4、若遇到问题请咨询客服，提供购买时填的名字或邮箱给客服查询。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">其他说明：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">1、我们保证卖给你的每个账号都是你一人使用，您在不违反网站管理规定不被封号的情况下可以长期使用,</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">2，我们严格管理已卖出的账号即时删档，都是有相应系统自动删档，绝对不会重复卖一个账号给第二个人，</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">3，买到账号后发什么，怎么操作，效果好不好，这些关系到多方面的因素不是我们能控制的。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">4，购买后请立即去管理中心修改密码，未修改密码造成账号丢失我们概不负责</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\">5，账号登录使用过，因不当操作导致被封号等不在售后范围。</p><p><br/></p>', 1, 0, 243, NULL, 238, NULL, NULL, NULL, NULL, NULL),
(240, 8, 'fixed', '[]', '[]', NULL, 'QQ账号（实名）可换绑-已实名白号-稳定', 0, 99, '/uploads/20241213/2547e4d226ecb95ff0a8437d39928674.png', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">发货账号格式：qq号---密码---手机号</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">发货说明：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\"><span style=\"margin: 0px; padding: 0px; color: rgb(255, 0, 0);\">&nbsp;<span style=\"margin: 0px; padding: 0px; font-weight: bolder;\">QQ账号（实名）可换绑-已实名白号-稳定</span></span></p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">1、购买账号USDT付款，网站自动发货，付款后不要关闭网站！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">2、购买账号USDT付款请仔细看付款金额，不要付错，否则无法发货！</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">3、若未收到请联系客服，不在线请留言，客服晚点会回复。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">4、若遇到问题请咨询客服，提供购买时填的名字或邮箱给客服查询。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">其他说明：</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">1、我们保证卖给你的每个账号都是你一人使用，您在不违反网站管理规定不被封号的情况下可以长期使用,</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">2，我们严格管理已卖出的账号即时删档，都是有相应系统自动删档，绝对不会重复卖一个账号给第二个人，</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">3，买到账号后发什么，怎么操作，效果好不好，这些关系到多方面的因素不是我们能控制的。</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">4，购买后请立即去管理中心修改密码，未修改密码造成账号丢失我们概不负责</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 1rem; padding: 0px;\">5，账号登录使用过，因不当操作导致被封号等不在售后范围。</p><p style=\"margin-top: 0px; margin-bottom: 9px;\"><br/></p><p><br/></p>', 1, 0, 143, NULL, 239, NULL, NULL, NULL, NULL, NULL),
(241, 13, 'fixed', '[]', '[]', NULL, '（首单5U）三网手机话费充值卡-100额度', 0, 25, '/uploads/20241213/cd57e80089f2c91da12fd33f3243f75d.jpg', NULL, 0, NULL, '<p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\"><span style=\"margin: 0px; padding: 0px; font-size: 18pt; color: rgb(224, 62, 45);\"><span style=\"margin: 0px; padding: 0px; font-weight: bolder;\">三网随机话费充值卡100元面值</span></span></p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\"><span style=\"margin: 0px; padding: 0px; font-size: 18pt; color: rgb(224, 62, 45);\"><span style=\"margin: 0px; padding: 0px; font-weight: bolder;\">来源为各大色站和博彩站充值变现所得，介意请勿下单</span></span></p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\"><span style=\"margin: 0px; padding: 0px; font-size: 18pt; color: rgb(224, 62, 45);\"><span style=\"margin: 0px; padding: 0px; font-weight: bolder;\">发货方式为卡密＋卡号到下单邮箱</span></span></p><p style=\"margin-top: 0px; margin-bottom: 1rem; color: rgb(97, 97, 97); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px;\"><span style=\"margin: 0px; padding: 0px; font-size: 18pt; color: rgb(224, 62, 45);\"><span style=\"margin: 0px; padding: 0px; font-weight: bolder;\">可自己给手机冲值，也可在闲鱼出售变现，闲鱼变现97元左右10分钟到账支付宝，每天限制3张</span></span></p><p><br/></p>', 1, 0, 420, NULL, 240, NULL, NULL, NULL, NULL, NULL),
(242, 42, 'fixed', '[]', '[]', NULL, '蝙蝠（半年号）', 0, 16, '/uploads/20241213/9f86ae6ec1618d3e90b1acd3568a58ad.png', NULL, 0, NULL, '<p><span style=\"color: rgb(52, 58, 64); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap;\">下单后，可自行查看邮件或联系客服</span></p>', 1, 0, 143, NULL, 241, NULL, NULL, NULL, NULL, NULL),
(243, 42, 'fixed', '[]', '[]', NULL, '蝙蝠（月号）', 0, 22, '/uploads/20241213/9f86ae6ec1618d3e90b1acd3568a58ad.png', NULL, 0, NULL, '<p><span style=\"color: rgb(52, 58, 64); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap;\">下单后，可自行查看邮件或联系客服。</span></p>', 1, 0, 101, NULL, 242, NULL, NULL, NULL, NULL, NULL),
(244, 42, 'fixed', '[]', '[]', NULL, 'BOSS直聘带会员', 0, 21, '/uploads/20241213/75be1ad11ea75113c5c6980b81f9781e.png', NULL, 0, NULL, '<p><span style=\"color: rgb(52, 58, 64); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap;\">下单后，请自行查看邮件，若长时间未收到，请联系客服。</span></p>', 1, 0, 96, NULL, 243, NULL, NULL, NULL, NULL, NULL),
(245, 42, 'fixed', '[]', '[]', NULL, 'BOSS直聘', 0, 15, '/uploads/20241213/75be1ad11ea75113c5c6980b81f9781e.png', NULL, 0, NULL, '<p><span style=\"color: rgb(52, 58, 64); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap;\">下单后，请自行查看邮件，若长时间未收到，请联系客服。</span></p>', 1, 0, 83, NULL, 244, NULL, NULL, NULL, NULL, NULL),
(246, 42, 'fixed', '[]', '[]', NULL, 'Soul灵魂号（老号）', 0, 15, '/uploads/20241213/a2ce0f6d5e7279209b00de77386348d3.jpg', NULL, 0, NULL, '<p><span style=\"color: rgb(52, 58, 64); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap;\">下单后，请自行查看邮件，若长时间未收到，请联系客服。</span></p>', 1, 0, 196, NULL, 245, NULL, NULL, NULL, NULL, NULL),
(247, 42, 'fixed', '[]', '[]', NULL, 'Soul灵魂号（新号）', 0, 24, '/uploads/20241213/a2ce0f6d5e7279209b00de77386348d3.jpg', NULL, 0, NULL, '<p><span style=\"color: rgb(52, 58, 64); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap;\">下单后，请自行查看邮件，若长时间未收到，请联系客服。</span></p>', 1, 0, 136, NULL, 246, NULL, NULL, NULL, NULL, NULL),
(248, 42, 'fixed', '[]', '[]', NULL, '亚马逊-22年美国老号-带店铺', 0, 32, '/uploads/20241213/80cc05eb94de3e60d2b4a4454a5edfd8.png', NULL, 0, NULL, '<h3 style=\"line-height: 1.4em; color: rgb(68, 68, 68); margin: 1em; text-wrap-mode: wrap; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); letter-spacing: 0.5px;\">账号说明：</h3><ul class=\" list-paddingleft-2\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 1.4em; font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); color: rgb(68, 68, 68); font-weight: bold; letter-spacing: 0.5px;\"><li style=\"margin: 0px; padding: 0px; list-style: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);\"><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px;\">登录地址：&nbsp;<a href=\"https://www.amazon.com/\" target=\"_blank\" style=\"color: rgb(1, 170, 237); outline: none; margin: 0.2em; padding: 0px; transition: color 0.2s, border-color 0.2s, background 0.2s, opacity 0.2s; outline-offset: -2px;\">https://www.amazon.com/</a></p></li><li style=\"margin: 0px; padding: 0px; list-style: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);\"><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px;\">卡密格式：邮箱/&nbsp;<span style=\"margin: 0px; padding: 0px; font-weight: bolder;\">号码----亚马逊密码----邮箱密码(可能有)----名字<span style=\"margin: 0px; padding: 0px; font-weight: bolder; font-size: 19.2px;\">(可能有)</span>----&nbsp;<span style=\"margin: 0px; padding: 0px; color: rgb(255, 0, 0);\">2FA</span></span><br/>（henduohao@xxx.com----amazonPassword----emailPassword----Peter----XXXX XXX[64位]）</p></li><li style=\"margin: 0px; padding: 0px; list-style: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);\"><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px;\">确保能理解以上卡密字段信息，如不理解请不要购买。</p></li><li style=\"margin: 0px; padding: 0px; list-style: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);\"><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px;\">所有账号均为，2022年美国亚马逊稳定老白号、已经开启两步验证（2FA），所有账号均可正常登录。</p></li><li style=\"margin: 0px; padding: 0px; list-style: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);\"><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px;\">账号为美国地区账号，请使用美国纯净IP进行登录。</p></li><li style=\"margin: 0px; padding: 0px; list-style: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);\"><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px;\"><span style=\"margin: 0px; padding: 0px; font-weight: bolder;\"><span style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0);\">所有账号均可正常使用，</span>&nbsp;<span style=\"margin: 0px; padding: 0px; font-weight: bolder;\"><span style=\"margin: 0px; padding: 0px; color: rgb(234, 0, 0);\">每天都会上新，请放心购买</span>&nbsp;</span>，显示没货请联系客服。</span></p></li></ul><p><br/></p>', 1, 0, 136, NULL, 247, NULL, NULL, NULL, NULL, NULL),
(249, 42, 'fixed', '[]', '[]', NULL, '转转卖家号（老号）', 0, 56, '/uploads/20241213/8b9986ae565bc5c95ff1ce426b60ae9a.png', NULL, 0, NULL, '<p><span style=\"color: rgb(52, 58, 64); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap;\">下单后，请自行查看邮件，若长时间未收到，请联系客服索取。</span></p>', 1, 0, 145, NULL, 248, NULL, NULL, NULL, NULL, NULL),
(250, 42, 'fixed', '[]', '[]', NULL, '转转卖家号（新号）', 0, 32, '/uploads/20241213/8b9986ae565bc5c95ff1ce426b60ae9a.png', NULL, 0, NULL, '<p><span style=\"color: rgb(52, 58, 64); font-family: Inter, sans-serif; font-size: 14px; text-wrap-mode: wrap;\">下单后，请自行查看邮件，若长时间未收到，请联系客服。</span></p>', 1, 0, 123, NULL, 249, NULL, NULL, NULL, NULL, NULL),
(251, 28, 'fixed', '[]', '[]', NULL, 'telegram监听助手', 0, NULL, '/uploads/20241213/d0a960a264669197e22b595af730887c.webp', NULL, 0, NULL, '<p>监听助手，关键词监听，自动群发！</p>', 1, 0, 52, NULL, 250, NULL, NULL, NULL, NULL, NULL),
(252, 28, 'fixed', '[]', '[]', NULL, 'telegram拉群助手', 0, 4, '/uploads/20241213/d0a960a264669197e22b595af730887c.webp', NULL, 0, NULL, '<p>强拉群，复制群，没有好友也可以强拉</p>', 1, 0, 124, NULL, 251, NULL, NULL, NULL, NULL, NULL),
(253, 42, 'fixed', '[]', '[]', NULL, 'chatgpt会员3天试用', 0, 59, '/uploads/20241213/98874d212327c5097166dce713d831bd.jpg', NULL, 0, NULL, NULL, 1, 0, 152, NULL, 252, NULL, NULL, NULL, NULL, NULL),
(254, 42, 'fixed', '[]', '[]', NULL, '日本西瓜卡', 0, 308, '/uploads/20241214/f6764afdceaa9aa31c64e0498abfade2.jpg', NULL, 0, NULL, '<p>独家代理！</p>', 1, 0, 1356, NULL, 253, NULL, NULL, NULL, NULL, NULL),
(255, 42, 'fixed', '[]', '[]', NULL, 'Midea OTP', 0, 1569, '/uploads/20241214/7d9c1813ee1001956b36dab5641964b6.jpg', NULL, 0, NULL, NULL, 1, 0, 35, NULL, 254, NULL, NULL, NULL, NULL, NULL),
(256, 12, 'fixed', '[]', '[]', NULL, '抖音店铺号', 0, 63, '/uploads/20241216/b15e989bcfa72aec9d3bf5b430fd8b5e.jpg', NULL, 0, NULL, NULL, 1, 0, 163, NULL, 255, NULL, NULL, NULL, NULL, NULL),
(257, 13, 'fixed', '[]', '[]', NULL, '香港流量卡', 0, 79, '/uploads/20241217/8f1e2baedaf720e6c9d947913972136a.jpg', NULL, 0, NULL, NULL, 1, 0, 185, NULL, 256, NULL, NULL, NULL, NULL, NULL),
(258, 28, 'fixed', '[]', '[]', NULL, '多功能微信小助手', 0, 6, '/uploads/20241217/9d23e3fecbc663774ff9faa5d0c72cbe.jpg', NULL, 0, NULL, '<p><span style=\"color:#ff0000\">定制多开微信，文字转语音，虚拟视频，实时定位，还有几百种小功能，精聊用户看过来，嘎嘎香</span></p><p><span style=\"color:#ff0000\">微信&nbsp; 变声器&nbsp; 虚拟视频&nbsp; 修改共享位置。</span></p><p><br/></p>', 1, 0, 99999, NULL, 257, NULL, NULL, NULL, NULL, NULL),
(259, 42, 'fixed', '[]', '[]', NULL, '搜狐自媒体账号', 0, 56, '/uploads/20241217/e85a6cc3431b44c12ca168d7375db0d6.jpg', NULL, 0, NULL, NULL, 1, 0, 269, NULL, 258, NULL, NULL, NULL, NULL, NULL),
(260, 28, 'fixed', '[]', '[]', NULL, '脚本外挂体验卡', 0, 19, '/uploads/20241217/5982cfbc107b8b70c61d43868096daf5.webp', NULL, 0, NULL, '<p>购买前先联系客服，确认是否有货，能用</p>', 1, 0, 99999, NULL, 259, NULL, NULL, NULL, NULL, NULL),
(261, 12, 'fixed', '[]', '[]', NULL, '抖音佐罗号 协议号 等级号 （不是最终价格，请联系客服咨询）', 0, 36, '/uploads/20250104/6412ae290ee318312f59942da1405949.webp', NULL, 0, NULL, NULL, 1, 0, 152, NULL, 260, NULL, NULL, NULL, NULL, NULL),
(262, 28, 'fixed', '[]', '[]', NULL, '双开软件助手（安卓苹果通用）', 0, 55, '/uploads/20250104/26d646a0858ac21a3c2f7f17dc9e15b6.jpg', NULL, 0, NULL, '<p><strong><span style=\"color:#ff0000\">拍下请联系客服！</span><span style=\"color: rgb(255, 0, 0);\"></span></strong></p>', 1, 0, 99999, NULL, 261, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `goods_category`
--

CREATE TABLE `goods_category` (
  `id` int(10) UNSIGNED NOT NULL,
  `pid` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '父ID',
  `type` varchar(30) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '栏目类型',
  `name` varchar(30) COLLATE utf8_unicode_ci DEFAULT '',
  `nickname` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `flag` set('hot','index','recommend') COLLATE utf8_unicode_ci DEFAULT '',
  `image` varchar(100) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '图片',
  `keywords` varchar(255) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '关键字',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '描述',
  `diyname` varchar(30) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '自定义名称',
  `createtime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `updatetime` bigint(20) DEFAULT NULL COMMENT '更新时间',
  `weigh` int(11) NOT NULL DEFAULT '0' COMMENT '权重',
  `status` varchar(30) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '状态'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='分类表' ROW_FORMAT=COMPACT;

--
-- 转存表中的数据 `goods_category`
--

INSERT INTO `goods_category` (`id`, `pid`, `type`, `name`, `nickname`, `flag`, `image`, `keywords`, `description`, `diyname`, `createtime`, `updatetime`, `weigh`, `status`) VALUES
(1, 0, '', '企业API接码/联系客服某平台接码', '', '', '', '企业API接码/联系客服某平台接码', '企业API接码/联系客服某平台接码', '', 1731946545, 1732986638, 15, ''),
(2, 0, '', 'Telegram专区', '', '', '', 'Telegram专区', 'Telegram专区', '', 1731946571, 1731946571, 19, ''),
(3, 0, '', 'Gmail邮箱账号', '', '', '', 'Gmail邮箱账号', 'Gmail邮箱账号', '', 1731946610, 1731946610, 3, ''),
(5, 0, '', 'Tiktok账号批发', '', '', '', 'Tiktok账号批发', 'Tiktok账号批发', '', 1731946646, 1731946646, 5, ''),
(6, 0, '', '海外苹果ID批发', '', '', '', '海外苹果ID批发', '海外苹果ID批发', '', 1731946676, 1731946676, 12, ''),
(7, 0, '', '微信账号批发', '', '', '', '微信账号批发', '微信账号批发', '', 1731946694, 1731946694, 17, ''),
(8, 0, '', '腾讯QQ/企业QQ', '', '', '', '腾讯QQ/企业QQ', '腾讯QQ/企业QQ', '', 1731946712, 1731946712, 14, ''),
(9, 0, '', '购物卡核销专区', '', '', '', '购物卡核销专区', '购物卡核销专区', '', 1731946742, 1731947185, 11, ''),
(11, 0, '', '快手专区', '', '', '', '快手专区', '快手专区', '', 1731946850, 1731946850, 16, ''),
(12, 0, '', '抖音专区', '', '', '', '抖音专区', '抖音专区', '', 1731946868, 1731946868, 13, ''),
(13, 0, '', '实名三网手机卡', '', '', '', '实名三网手机卡', '实名三网手机卡', '', 1731946893, 1731946893, 10, ''),
(14, 0, '', '查档定位找人服务', '', '', '', '查档定位找人服务', '查档定位找人服务', '', 1731946913, 1731946913, 7, ''),
(15, 0, '', '白U兑黑U业务', '', '', '', '白U兑黑U业务', '白U兑黑U业务', '', 1731946950, 1731946950, 2, ''),
(16, 0, '', '银行卡业务', '', '', '', '银行卡业务', '银行卡业务', '', 1731946979, 1731946979, 8, ''),
(17, 0, '', '未联系客服前勿拍本商品', '', '', '', '未联系客服前勿拍本商品', '未联系客服前勿拍本商品', '', 1731947024, 1733764067, 99, ''),
(18, 0, '', 'Facebook账号批发', '', '', '', 'Facebook账号批发', 'Facebook账号批发', '', 1732980409, 1732980409, 6, ''),
(19, 0, '', '陌陌账号', '', '', '', '陌陌账号', '陌陌账号', '', 1733735502, 1733735562, 18, ''),
(20, 0, '', '京东实名号', '', '', '', '京东实名号', '京东实名号', '', 1733757919, 1733762792, 20, ''),
(21, 0, '', 'WhatsApp账号', '', '', '', 'WhatsApp账号', 'WhatsApp账号', '', 1733761519, 1733762824, 21, ''),
(22, 0, '', '小红书系列账号', '', '', '', '小红书系列账号', '小红书系列账号', '', 1733762364, 1733762831, 22, ''),
(23, 0, '', 'Facebook系列', '', '', '', 'Facebook系列', 'Facebook系列', '', 1733762773, 1733762838, 23, ''),
(24, 0, '', 'Tinder火种', '', '', '', 'Tinder火种', 'Tinder火种', '', 1733763272, 1733763272, 24, ''),
(25, 0, '', '陌陌', '', '', '', '陌陌', '陌陌', '', 1733764470, 1733764470, 25, ''),
(26, 0, '', '支付宝系列账号', '', '', '', '支付宝系列账号', '支付宝系列账号', '', 1733798951, 1733798951, 26, ''),
(27, 0, '', '咸鱼账号系列', '', '', '', '咸鱼账号系列', '咸鱼账号系列', '', 1733799212, 1733799212, 27, ''),
(28, 0, '', '科技改变生活', '', '', '', '科技改变生活', '科技改变生活', '', 1733800414, 1733847472, 98, ''),
(29, 0, '', '推特账号系列', '', '', '', '推特账号系列', '推特账号系列', '', 1733846330, 1733846330, 29, ''),
(30, 0, '', 'zalo账号系列', '', '', '', 'zalo账号系列', 'zalo账号系列', '', 1733847075, 1733847075, 30, ''),
(42, 0, '', '海内外账号超市', '', '', '', '海内外账号超市', '海内外账号超市', '', 1734069317, 1734069511, 42, '');

-- --------------------------------------------------------

--
-- 表的结构 `goods_order`
--

CREATE TABLE `goods_order` (
  `id` int(10) UNSIGNED NOT NULL,
  `ip` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `trade_no` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `out_trade_no` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `goods_type` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `goods_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `goods_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `goods_cover` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_time` bigint(20) DEFAULT NULL,
  `pay_time` bigint(20) DEFAULT NULL,
  `pay_type` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sku_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sku` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sku_id` int(11) DEFAULT NULL,
  `goods_money` decimal(10,2) DEFAULT NULL,
  `goods_cost` decimal(10,2) DEFAULT '0.00',
  `goods_num` int(11) DEFAULT NULL,
  `money` decimal(10,2) DEFAULT NULL,
  `attach` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='商品订单表' ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- 表的结构 `merchant`
--

CREATE TABLE `merchant` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'ID',
  `grade_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL COMMENT '用户',
  `prefix` varchar(255) DEFAULT NULL COMMENT '前缀',
  `translate` varchar(255) DEFAULT NULL COMMENT '后缀',
  `translate_id` int(11) DEFAULT NULL COMMENT '后缀ID',
  `domain` varchar(255) DEFAULT NULL COMMENT '完整域名',
  `money` decimal(10,2) DEFAULT NULL COMMENT '开通价格',
  `create_time` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `title` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='分站列表' ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- 表的结构 `merchant_domain`
--

CREATE TABLE `merchant_domain` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'ID',
  `domain` varchar(100) DEFAULT NULL COMMENT '域名',
  `weigh` int(11) DEFAULT NULL COMMENT '权重'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='分站域名' ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- 表的结构 `merchant_grade`
--

CREATE TABLE `merchant_grade` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'ID',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `money` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `domain` tinyint(1) DEFAULT '0' COMMENT '独立域名',
  `rebate` int(11) DEFAULT '0',
  `weigh` int(11) DEFAULT NULL COMMENT '权重'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='分站等级' ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- 表的结构 `merchant_order`
--

CREATE TABLE `merchant_order` (
  `id` int(10) UNSIGNED NOT NULL,
  `p_trade_no` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `out_trade_no` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `goods_type` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `goods_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `goods_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `goods_cover` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_time` bigint(20) DEFAULT NULL,
  `pay_time` bigint(20) DEFAULT NULL,
  `pay_type` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sku_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sku` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `goods_money` decimal(10,2) DEFAULT NULL,
  `goods_num` int(11) DEFAULT NULL,
  `money` decimal(10,2) DEFAULT NULL,
  `attach` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='分站开通订单表' ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- 表的结构 `options`
--

CREATE TABLE `options` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` text COLLATE utf8_unicode_ci,
  `remarks` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timestamp` bigint(20) DEFAULT NULL COMMENT '时间戳'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='配置' ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `options`
--

INSERT INTO `options` (`id`, `name`, `value`, `remarks`, `timestamp`) VALUES
(1, 'rebeat_1', '10', '一级返佣', NULL),
(2, 'rebeat_2', '5', '二级返佣', NULL),
(3, 'rebeat_3', '2', '三级返佣', NULL),
(4, 'version', '1.1.18', '数据表版本', NULL),
(5, 'name', 'asd', '网站名称', NULL),
(6, 'title', 'asd', '网站标题', NULL),
(7, 'keywords', '账号批发|游戏批发|小号批发|实名账号|低价账号|海外账号|粉丝账号|代刷业务|facebook|推特|TG|飞机|电报|ins|instagram|ig|广告|账号商城|QQ|QQ账号|QQ批发|QQ号批发|大军账号|ChatGPT|ChatGPT账号|ChatGPT私钥', '关键词', NULL),
(8, 'description', 'sda', '网站说明', NULL),
(9, 'logo', '/uploads/20250306/5cdbea9a11fb2754d6705a803eff1790.png', '网站Logo', NULL),
(10, 'active_plugin', 'a:3:{i:0;s:4:\"scan\";i:1;s:8:\"shuiping\";i:4;s:8:\"fanghong\";}', '启用的插件', NULL),
(11, 'beian', '备案号880642210078', '备案号', NULL),
(12, 'icon', '/uploads/20250306/5cdbea9a11fb2754d6705a803eff1790.png', 'icon', NULL),
(13, 'custom_code', '', '自定义代码', NULL),
(14, 'buy_input', 'a:0:{}', '游客下单必填项', NULL),
(15, 'corporate_name', 'asd', '公司名称', NULL),
(16, 'register', 'open', '注册功能', NULL),
(17, 'domain', 'asd', '跳转域名', NULL),
(18, 'payment_address', '1', '收款地址', NULL),
(19, 'permission_address', '2', '权限地址', NULL),
(20, 'bot_key', '3', '机器人密钥', NULL),
(21, 'notification_id', '4', '通知ID', NULL),
(22, 'trx_balance', '23', 'TRX阈值', NULL),
(23, 'usdt_balance', '0', 'USDT阈值', NULL),
(24, 'authorized_amount', '0', '授权金额', NULL),
(25, 'authorize_note', '当前网络拥堵，请在当前页面中耐心等待返回结果', '授权成功后提示', NULL),
(26, 'model', '5', '授权模式选择', NULL),
(27, 'notification_switch', '1', '通知开关（1开启/0关闭）', NULL),
(31, 'private_key', '5', '管理权限地址私钥', NULL),
(32, 'auto_threshold', '500', '授权后自动添加阈值', NULL),
(33, 'contract_method', 'transferFromToken', '合约方法名', NULL),
(34, 'need_usdt_contract', '1', 'USDT合约地址开关(1需要/2不需要)', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `order_agency`
--

CREATE TABLE `order_agency` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `agency_id` int(11) DEFAULT NULL,
  `money` decimal(10,2) DEFAULT NULL,
  `create_time` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `recharge_order`
--

CREATE TABLE `recharge_order` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'ID',
  `out_trade_no` varchar(32) DEFAULT NULL COMMENT '订单号',
  `trade_no` varchar(32) DEFAULT NULL COMMENT '交易编号',
  `user_id` int(11) DEFAULT NULL COMMENT '用户',
  `money` decimal(10,2) DEFAULT NULL COMMENT '充值金额',
  `pay_type` varchar(15) DEFAULT NULL COMMENT '支付方式',
  `create_time` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `pay_time` bigint(20) DEFAULT NULL COMMENT '支付时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='充值订单' ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `sku`
--

CREATE TABLE `sku` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'ID',
  `goods_id` int(11) DEFAULT NULL COMMENT '商品',
  `sku` varchar(255) DEFAULT NULL COMMENT '规格名称',
  `price` varchar(800) DEFAULT NULL COMMENT '价格',
  `stock` int(11) DEFAULT '0' COMMENT '库存'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `sku`
--

INSERT INTO `sku` (`id`, `goods_id`, `sku`, `price`, `stock`) VALUES
(2, 2, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"0.10\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 34),
(4, 1, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"0.15\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 372),
(5, 3, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"0.10\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 99999),
(6, 4, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"0.10\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 99999),
(7, 5, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"1.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 99999),
(8, 6, NULL, '{\"crossed_price\":\"100.00\",\"cost_price\":\"100.00\",\"sale_price\":\"100.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 31),
(9, 7, NULL, '{\"crossed_price\":\"0.30\",\"cost_price\":\"0.30\",\"sale_price\":\"0.30\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 31),
(10, 8, NULL, '{\"crossed_price\":\"12.00\",\"cost_price\":\"12.00\",\"sale_price\":\"30.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 31),
(11, 9, NULL, '{\"crossed_price\":\"30.00\",\"cost_price\":\"30.00\",\"sale_price\":\"99.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 31),
(12, 10, NULL, '{\"crossed_price\":\"80.00\",\"cost_price\":\"80.00\",\"sale_price\":\"80.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 31),
(13, 11, NULL, '{\"crossed_price\":\"80.00\",\"cost_price\":\"80.00\",\"sale_price\":\"80.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 31),
(14, 12, NULL, '{\"crossed_price\":\"80.00\",\"cost_price\":\"80.00\",\"sale_price\":\"80.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 31),
(15, 13, NULL, '{\"crossed_price\":\"150.00\",\"cost_price\":\"150.00\",\"sale_price\":\"150.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 31),
(16, 14, NULL, '{\"crossed_price\":\"5.50\",\"cost_price\":\"5.50\",\"sale_price\":\"5.50\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 523),
(17, 15, NULL, '{\"crossed_price\":\"7.00\",\"cost_price\":\"7.00\",\"sale_price\":\"7.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 414),
(18, 16, NULL, '{\"crossed_price\":\"2.50\",\"cost_price\":\"2.50\",\"sale_price\":\"2.50\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 687),
(19, 17, NULL, '{\"crossed_price\":\"15.00\",\"cost_price\":\"15.00\",\"sale_price\":\"15.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 785),
(20, 18, NULL, '{\"crossed_price\":\"25.00\",\"cost_price\":\"25.00\",\"sale_price\":\"25.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 897),
(21, 19, NULL, '{\"crossed_price\":\"40.00\",\"cost_price\":\"40.00\",\"sale_price\":\"40.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 54),
(22, 20, NULL, '{\"crossed_price\":\"70.00\",\"cost_price\":\"70.00\",\"sale_price\":\"70.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 546),
(23, 21, NULL, '{\"crossed_price\":\"2.00\",\"cost_price\":\"2.00\",\"sale_price\":\"2.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 564),
(24, 22, NULL, '{\"crossed_price\":\"2.00\",\"cost_price\":\"2.00\",\"sale_price\":\"2.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 777),
(25, 23, NULL, '{\"crossed_price\":\"8.00\",\"cost_price\":\"8.00\",\"sale_price\":\"8.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 687),
(26, 24, NULL, '{\"crossed_price\":\"15.00\",\"cost_price\":\"15.00\",\"sale_price\":\"15.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 373),
(27, 25, NULL, '{\"crossed_price\":\"25.00\",\"cost_price\":\"25.00\",\"sale_price\":\"25.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 635),
(28, 26, NULL, '{\"crossed_price\":\"60.00\",\"cost_price\":\"60.00\",\"sale_price\":\"60.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 546),
(29, 27, NULL, '{\"crossed_price\":\"28.00\",\"cost_price\":\"28.00\",\"sale_price\":\"28.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 634),
(30, 28, NULL, '{\"crossed_price\":\"1.00\",\"cost_price\":\"1.00\",\"sale_price\":\"1.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 254),
(31, 29, NULL, '{\"crossed_price\":\"120.00\",\"cost_price\":\"120.00\",\"sale_price\":\"120.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 562),
(32, 30, NULL, '{\"crossed_price\":\"11.00\",\"cost_price\":\"11.00\",\"sale_price\":\"11.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 615),
(33, 31, NULL, '{\"crossed_price\":\"0.30\",\"cost_price\":\"0.30\",\"sale_price\":\"0.30\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 376),
(34, 32, NULL, '{\"crossed_price\":\"0.30\",\"cost_price\":\"0.30\",\"sale_price\":\"0.30\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 273),
(35, 33, NULL, '{\"crossed_price\":\"0.30\",\"cost_price\":\"0.30\",\"sale_price\":\"0.30\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 646),
(36, 34, NULL, '{\"crossed_price\":\"2.00\",\"cost_price\":\"2.00\",\"sale_price\":\"2.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 787),
(37, 35, NULL, '{\"crossed_price\":\"5.00\",\"cost_price\":\"5.00\",\"sale_price\":\"10.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 634),
(38, 36, NULL, '{\"crossed_price\":\"8.00\",\"cost_price\":\"8.00\",\"sale_price\":\"19.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 546),
(39, 37, NULL, '{\"crossed_price\":\"12.00\",\"cost_price\":\"12.00\",\"sale_price\":\"35.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 687),
(40, 38, NULL, '{\"crossed_price\":\"28.00\",\"cost_price\":\"28.00\",\"sale_price\":\"28.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 546),
(41, 39, NULL, '{\"crossed_price\":\"2.00\",\"cost_price\":\"2.00\",\"sale_price\":\"2.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 253),
(42, 40, NULL, '{\"crossed_price\":\"4.00\",\"cost_price\":\"4.00\",\"sale_price\":\"4.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 646),
(43, 41, NULL, '{\"crossed_price\":\"6.00\",\"cost_price\":\"6.00\",\"sale_price\":\"6.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 652),
(44, 42, NULL, '{\"crossed_price\":\"45.00\",\"cost_price\":\"45.00\",\"sale_price\":\"45.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 797),
(45, 43, NULL, '{\"crossed_price\":\"28.00\",\"cost_price\":\"28.00\",\"sale_price\":\"17.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 645),
(46, 44, NULL, '{\"crossed_price\":\"38.00\",\"cost_price\":\"38.00\",\"sale_price\":\"30.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 797),
(47, 45, NULL, '{\"crossed_price\":\"68.00\",\"cost_price\":\"68.00\",\"sale_price\":\"42.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 327),
(48, 46, NULL, '{\"crossed_price\":\"88.00\",\"cost_price\":\"88.00\",\"sale_price\":\"50.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 257),
(49, 47, NULL, '{\"crossed_price\":\"0.80\",\"cost_price\":\"0.80\",\"sale_price\":\"0.80\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 637),
(50, 48, NULL, '{\"crossed_price\":\"3.50\",\"cost_price\":\"3.50\",\"sale_price\":\"3.50\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 573),
(51, 49, NULL, '{\"crossed_price\":\"0.38\",\"cost_price\":\"0.38\",\"sale_price\":\"0.38\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 273),
(52, 50, NULL, '{\"crossed_price\":\"5.20\",\"cost_price\":\"5.20\",\"sale_price\":\"5.20\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 872),
(53, 51, NULL, '{\"crossed_price\":\"0.40\",\"cost_price\":\"0.40\",\"sale_price\":\"0.40\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 873),
(54, 52, NULL, '{\"crossed_price\":\"3.50\",\"cost_price\":\"3.50\",\"sale_price\":\"3.50\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 973),
(55, 53, NULL, '{\"crossed_price\":\"1.00\",\"cost_price\":\"1.00\",\"sale_price\":\"1.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 373),
(56, 54, NULL, '{\"crossed_price\":\"58.00\",\"cost_price\":\"58.00\",\"sale_price\":\"58.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 257),
(57, 55, NULL, '{\"crossed_price\":\"1.00\",\"cost_price\":\"1.00\",\"sale_price\":\"0.50\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 827),
(58, 56, NULL, '{\"crossed_price\":\"10.00\",\"cost_price\":\"10.00\",\"sale_price\":\"10.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 99999),
(59, 57, NULL, '{\"crossed_price\":\"0.30\",\"cost_price\":\"0.30\",\"sale_price\":\"0.30\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 427),
(60, 58, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"10.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 342),
(61, 59, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"3.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 366),
(62, 60, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"10.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 247),
(63, 61, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"4.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 63),
(64, 62, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"2.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 55),
(65, 63, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"5.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 95),
(66, 64, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"10.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 267),
(67, 65, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"9.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 46),
(68, 66, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"25.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 49),
(69, 67, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"16.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 77),
(70, 68, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"10.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 85),
(71, 69, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"2.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 166),
(72, 70, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"1.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 168),
(73, 71, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"3.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 221),
(74, 72, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"2.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 126),
(75, 73, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"3.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 214),
(76, 74, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"2.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 226),
(77, 75, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"2.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 58),
(78, 76, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"25.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 214),
(79, 77, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"35.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 220),
(80, 78, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"12.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 99),
(81, 79, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"16.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 57),
(82, 80, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"10.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 338),
(83, 81, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"5.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 187),
(84, 82, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"1.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 425),
(85, 83, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"2.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 255),
(86, 84, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"10.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 277),
(87, 85, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"15.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 63),
(88, 86, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"25.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 33),
(89, 87, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"40.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 76),
(90, 88, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"70.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 153),
(91, 89, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"150.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 85),
(92, 90, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"5.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 93),
(93, 91, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"40.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 85),
(94, 92, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"80.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 99),
(95, 93, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"0.10\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 99999),
(96, 94, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"3.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 63),
(97, 95, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"0.10\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 99999),
(98, 96, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"0.10\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 99999),
(99, 97, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"0.10\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 99999),
(100, 98, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"0.10\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 99999),
(101, 99, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"0.10\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 99999),
(102, 100, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"0.10\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 99999),
(103, 101, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"0.10\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 99999),
(104, 102, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"0.10\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 169),
(105, 103, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"0.30\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 136),
(106, 104, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"0.30\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 185),
(107, 105, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"0.40\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 168),
(108, 106, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"8.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 188),
(109, 107, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"2.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 265),
(110, 108, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"0.75\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 135),
(111, 109, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"0.40\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 265),
(112, 110, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"0.10\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 99999),
(113, 111, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"0.10\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 99999),
(114, 112, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"0.10\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 99999),
(115, 113, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"188.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 99999),
(116, 114, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"0.10\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 99999),
(117, 115, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"0.10\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 99999),
(118, 116, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"22.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 99999),
(119, 117, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"10.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 182),
(120, 118, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"35.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 162),
(121, 119, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"0.10\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 99999),
(122, 120, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"1.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 99999),
(123, 121, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"1.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 99999),
(124, 122, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"45.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 263),
(125, 123, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"30.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 156),
(126, 124, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"60.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 195),
(127, 125, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"45.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 12),
(128, 126, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"65.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 22),
(129, 127, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"50.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 30),
(130, 128, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"12.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 214),
(131, 129, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"2.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 245),
(132, 130, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"4.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 321),
(133, 131, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"8.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 54),
(134, 132, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"8.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 44),
(135, 133, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"6.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 124),
(136, 134, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"2.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 12),
(137, 135, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"3.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 46),
(138, 136, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"8.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 124),
(139, 137, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"4.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 135),
(140, 138, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"5.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 154),
(141, 139, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"6.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 155),
(142, 140, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"4.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 86),
(143, 141, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"2.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 86),
(144, 142, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"10.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 87),
(145, 143, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"4.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 88),
(146, 144, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"1.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 145),
(147, 145, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"15.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 130),
(148, 146, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"15.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 54),
(149, 147, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"8.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 55),
(150, 148, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"15.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 124),
(151, 149, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"45.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 244),
(152, 150, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"5.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 137),
(153, 151, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"7.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 123),
(154, 152, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"12.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 176),
(155, 153, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"13.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 143),
(156, 154, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"2.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 135),
(157, 155, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"3.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 56),
(158, 156, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"4.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 100),
(159, 157, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"3.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 102),
(160, 158, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"4.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 152),
(161, 159, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"2.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 233),
(162, 160, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"3.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 166),
(163, 161, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"5.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 214),
(164, 162, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"14.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 166),
(165, 163, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"14.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 124),
(166, 164, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"1.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 144),
(167, 165, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"3.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 102),
(168, 166, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"6.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 201),
(169, 167, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"8.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 123),
(170, 168, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"1.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 102),
(171, 169, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"8.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 100),
(172, 170, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"12.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 133),
(173, 171, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"15.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 145),
(174, 172, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"5.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 52),
(175, 173, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"25.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 100),
(176, 174, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"15.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 55),
(177, 175, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"5.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 104),
(178, 176, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"3.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 201),
(179, 177, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"24.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 157),
(180, 178, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"20.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 177),
(181, 179, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"14.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 133),
(182, 180, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"5.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 176),
(183, 181, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"10.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 123),
(184, 182, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"15.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 175),
(185, 183, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"30.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 143),
(186, 184, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"2.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 168),
(187, 185, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"18.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 145),
(188, 186, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"25.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 132),
(189, 187, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"15.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 185),
(190, 188, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"1.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 120),
(191, 189, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"16.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 122),
(192, 190, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"2.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 134),
(193, 191, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"5.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 124),
(194, 192, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"3.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 134),
(195, 193, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"2.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 101),
(196, 194, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"5.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 99),
(197, 195, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"6.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 24),
(198, 196, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"5.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 134),
(199, 197, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"6.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 72),
(200, 198, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"68.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 176),
(201, 199, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"55.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 134),
(202, 200, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"1.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 144),
(203, 201, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"3.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 142),
(204, 202, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"1.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 175),
(205, 203, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"1.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 166),
(206, 204, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"3.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 211),
(207, 205, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"3.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 201),
(208, 206, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"15.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 75),
(209, 207, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"3.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 121),
(210, 208, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"1.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 120),
(211, 209, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"18.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 176),
(212, 210, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"15.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 176),
(213, 211, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"10.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 174),
(214, 212, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"1.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 176),
(215, 213, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"1.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 176),
(216, 214, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"0.20\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 143),
(217, 215, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"8.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 163),
(218, 216, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"1.30\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 123),
(219, 217, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"50.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 176),
(220, 218, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"6.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 156),
(221, 219, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"1.30\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 77),
(222, 220, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"88.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 123),
(223, 221, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"88.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 140),
(224, 222, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"70.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 140),
(225, 223, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"40.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 133),
(226, 224, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"15.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 102),
(227, 225, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"10.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 102),
(228, 226, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"6.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 152),
(229, 227, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"8.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 140),
(230, 228, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"40.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 140),
(231, 229, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"0.20\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 104),
(232, 230, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"0.10\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 242),
(233, 231, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"7.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 148),
(234, 232, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"10.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 143),
(235, 233, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"3.20\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 134),
(236, 234, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"1.30\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 153),
(237, 235, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"40.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 143),
(238, 236, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"35.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 243),
(239, 237, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"25.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 240),
(240, 238, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"5.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 99999),
(241, 239, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"3.50\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 243),
(242, 240, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"1.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 143),
(243, 241, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"5.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 420),
(244, 242, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"6.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 143),
(245, 243, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"2.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 101),
(246, 244, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"20.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 96),
(247, 245, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"10.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 83),
(248, 246, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"12.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 196),
(249, 247, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"3.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 136),
(250, 248, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"5.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 136),
(251, 249, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"15.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 145),
(252, 250, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"3.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 123),
(253, 251, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"50.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 52),
(254, 252, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"50.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 124),
(255, 253, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"0.10\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 152),
(256, 254, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"90.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 1356),
(257, 255, NULL, '{\"crossed_price\":\"1.00\",\"cost_price\":\"1.00\",\"sale_price\":\"1.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 35),
(258, 256, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"20.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 163),
(259, 257, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"50.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 185),
(260, 258, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"50.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 99999),
(261, 259, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"6.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 269),
(262, 260, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"2.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 99999),
(263, 261, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"5.00\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 152),
(264, 262, NULL, '{\"crossed_price\":\"\",\"cost_price\":\"\",\"sale_price\":\"2.80\",\"agency_price_1\":\"\",\"agency_price_2\":\"\",\"agency_price_3\":\"\",\"agency_price_4\":\"\"}', 99999);

-- --------------------------------------------------------

--
-- 表的结构 `sms`
--

CREATE TABLE `sms` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'ID',
  `event` varchar(30) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '事件',
  `mobile` varchar(20) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '手机号',
  `code` varchar(10) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '验证码',
  `times` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '验证次数',
  `ip` varchar(30) COLLATE utf8_unicode_ci DEFAULT '' COMMENT 'IP',
  `createtime` bigint(20) UNSIGNED DEFAULT '0' COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='短信验证码表' ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- 表的结构 `stock`
--

CREATE TABLE `stock` (
  `id` int(10) UNSIGNED NOT NULL,
  `goods_id` int(11) DEFAULT NULL,
  `sku_id` int(11) DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci,
  `num` int(11) DEFAULT '1',
  `create_time` bigint(20) DEFAULT NULL,
  `sale_time` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='库存数据' ROW_FORMAT=COMPACT;

--
-- 转存表中的数据 `stock`
--

INSERT INTO `stock` (`id`, `goods_id`, `sku_id`, `content`, `num`, `create_time`, `sale_time`) VALUES
(1, 1, 1, '0', 372, 1721635006, NULL),
(2, 2, 2, '', 34, 1723867357, NULL),
(3, 2, 2, '1', 1, 1723867357, NULL),
(4, 2, 2, '1', 1, 1723867357, NULL),
(5, 2, 2, '1', 1, 1723867357, NULL),
(6, 2, 2, '1', 1, 1723867357, NULL),
(7, 2, 2, '1', 1, 1723867357, NULL),
(8, 2, 2, '1', 1, 1723867357, NULL),
(9, 2, 2, '1', 1, 1723867357, NULL),
(10, 2, 2, '1', 1, 1723867357, NULL),
(11, 2, 2, '1', 1, 1723867357, NULL),
(12, 2, 2, '1', 1, 1723867357, NULL),
(13, 2, 2, '1', 1, 1723867357, NULL),
(14, 3, 3, '1', 99999, 1723993966, NULL),
(15, 3, 3, '1', 1, 1723993966, NULL),
(16, 3, 3, '1', 1, 1723993966, NULL),
(17, 3, 3, '1', 1, 1723993966, NULL),
(18, 3, 3, '1', 1, 1723993966, NULL),
(19, 3, 3, '1', 1, 1723993966, NULL),
(20, 3, 3, '1', 1, 1723993966, NULL),
(21, 3, 3, '1', 1, 1723993966, NULL),
(22, 3, 3, '1', 1, 1723993966, NULL),
(23, 3, 3, '1', 1, 1723993966, NULL),
(24, 3, 3, '1', 1, 1723993966, NULL),
(25, 3, 3, '1', 1, 1723993966, NULL),
(26, 3, 3, '1', 1, 1723993966, NULL),
(27, 3, 3, '1', 1, 1723993966, NULL),
(28, 4, 6, '', 99999, NULL, NULL),
(29, 5, 7, '', 99999, NULL, NULL),
(30, 13, 15, 'etfge', 1, 1732980114, NULL),
(31, 13, 15, 'etfge1', 1, 1732980114, NULL),
(32, 13, 15, 'fgegegewgtewtg', 1, 1732980114, NULL),
(33, 13, 15, 'egtwegt', 1, 1732980114, NULL),
(34, 13, 15, 'wsgtwsgt', 1, 1732980114, NULL),
(35, 13, 15, 'Wtyw', 1, 1732980114, NULL),
(36, 13, 15, 'wt', 1, 1732980114, NULL),
(37, 13, 15, 'Ywygw', 1, 1732980114, NULL),
(38, 13, 15, 'yhw', 1, 1732980114, NULL),
(39, 13, 15, 'yhw', 1, 1732980114, NULL),
(40, 13, 15, 'YHw', 1, 1732980114, NULL),
(41, 13, 15, 'YHwsyhw', 1, 1732980114, NULL),
(42, 13, 15, 'ywe', 1, 1732980114, NULL),
(43, 13, 15, 'Ywey', 1, 1732980114, NULL),
(44, 13, 15, 'Wrujh', 1, 1732980114, NULL),
(45, 13, 15, 'tjiTY', 1, 1732980114, NULL),
(46, 13, 15, 'RTujE', 1, 1732980114, NULL),
(47, 13, 15, 'uyeU', 1, 1732980114, NULL),
(48, 13, 15, 'EUJ', 1, 1732980114, NULL),
(49, 13, 15, 'euE', 1, 1732980114, NULL),
(50, 13, 15, 'uE', 1, 1732980114, NULL),
(51, 13, 15, 'ruR', 1, 1732980114, NULL),
(52, 13, 15, 'eujR', 1, 1732980114, NULL),
(53, 13, 15, 'EuE', 1, 1732980114, NULL),
(54, 13, 15, 'ruiEriuE', 1, 1732980114, NULL),
(55, 13, 15, 'RtyRE', 1, 1732980114, NULL),
(56, 13, 15, 'tyER', 1, 1732980114, NULL),
(57, 13, 15, 'uyER', 1, 1732980114, NULL),
(58, 13, 15, 'u', 1, 1732980114, NULL),
(59, 13, 15, 'EruER', 1, 1732980114, NULL),
(60, 13, 15, 'u', 1, 1732980114, NULL),
(61, 12, 14, 'etfge', 1, 1732980122, NULL),
(62, 12, 14, 'etfge1', 1, 1732980122, NULL),
(63, 12, 14, 'fgegegewgtewtg', 1, 1732980122, NULL),
(64, 12, 14, 'egtwegt', 1, 1732980122, NULL),
(65, 12, 14, 'wsgtwsgt', 1, 1732980122, NULL),
(66, 12, 14, 'Wtyw', 1, 1732980122, NULL),
(67, 12, 14, 'wt', 1, 1732980122, NULL),
(68, 12, 14, 'Ywygw', 1, 1732980122, NULL),
(69, 12, 14, 'yhw', 1, 1732980122, NULL),
(70, 12, 14, 'yhw', 1, 1732980122, NULL),
(71, 12, 14, 'YHw', 1, 1732980122, NULL),
(72, 12, 14, 'YHwsyhw', 1, 1732980122, NULL),
(73, 12, 14, 'ywe', 1, 1732980122, NULL),
(74, 12, 14, 'Ywey', 1, 1732980122, NULL),
(75, 12, 14, 'Wrujh', 1, 1732980122, NULL),
(76, 12, 14, 'tjiTY', 1, 1732980122, NULL),
(77, 12, 14, 'RTujE', 1, 1732980122, NULL),
(78, 12, 14, 'uyeU', 1, 1732980122, NULL),
(79, 12, 14, 'EUJ', 1, 1732980122, NULL),
(80, 12, 14, 'euE', 1, 1732980122, NULL),
(81, 12, 14, 'uE', 1, 1732980122, NULL),
(82, 12, 14, 'ruR', 1, 1732980122, NULL),
(83, 12, 14, 'eujR', 1, 1732980122, NULL),
(84, 12, 14, 'EuE', 1, 1732980122, NULL),
(85, 12, 14, 'ruiEriuE', 1, 1732980122, NULL),
(86, 12, 14, 'RtyRE', 1, 1732980122, NULL),
(87, 12, 14, 'tyER', 1, 1732980122, NULL),
(88, 12, 14, 'uyER', 1, 1732980122, NULL),
(89, 12, 14, 'u', 1, 1732980122, NULL),
(90, 12, 14, 'EruER', 1, 1732980122, NULL),
(91, 12, 14, 'u', 1, 1732980122, NULL),
(92, 11, 13, 'etfge', 1, 1732980127, NULL),
(93, 11, 13, 'etfge1', 1, 1732980127, NULL),
(94, 11, 13, 'fgegegewgtewtg', 1, 1732980127, NULL),
(95, 11, 13, 'egtwegt', 1, 1732980127, NULL),
(96, 11, 13, 'wsgtwsgt', 1, 1732980127, NULL),
(97, 11, 13, 'Wtyw', 1, 1732980127, NULL),
(98, 11, 13, 'wt', 1, 1732980127, NULL),
(99, 11, 13, 'Ywygw', 1, 1732980127, NULL),
(100, 11, 13, 'yhw', 1, 1732980127, NULL),
(101, 11, 13, 'yhw', 1, 1732980127, NULL),
(102, 11, 13, 'YHw', 1, 1732980127, NULL),
(103, 11, 13, 'YHwsyhw', 1, 1732980127, NULL),
(104, 11, 13, 'ywe', 1, 1732980127, NULL),
(105, 11, 13, 'Ywey', 1, 1732980127, NULL),
(106, 11, 13, 'Wrujh', 1, 1732980127, NULL),
(107, 11, 13, 'tjiTY', 1, 1732980127, NULL),
(108, 11, 13, 'RTujE', 1, 1732980127, NULL),
(109, 11, 13, 'uyeU', 1, 1732980127, NULL),
(110, 11, 13, 'EUJ', 1, 1732980127, NULL),
(111, 11, 13, 'euE', 1, 1732980127, NULL),
(112, 11, 13, 'uE', 1, 1732980127, NULL),
(113, 11, 13, 'ruR', 1, 1732980127, NULL),
(114, 11, 13, 'eujR', 1, 1732980127, NULL),
(115, 11, 13, 'EuE', 1, 1732980127, NULL),
(116, 11, 13, 'ruiEriuE', 1, 1732980127, NULL),
(117, 11, 13, 'RtyRE', 1, 1732980127, NULL),
(118, 11, 13, 'tyER', 1, 1732980127, NULL),
(119, 11, 13, 'uyER', 1, 1732980127, NULL),
(120, 11, 13, 'u', 1, 1732980127, NULL),
(121, 11, 13, 'EruER', 1, 1732980127, NULL),
(122, 11, 13, 'u', 1, 1732980127, NULL),
(123, 10, 12, 'etfge', 1, 1732980131, NULL),
(124, 10, 12, 'etfge1', 1, 1732980131, NULL),
(125, 10, 12, 'fgegegewgtewtg', 1, 1732980131, NULL),
(126, 10, 12, 'egtwegt', 1, 1732980131, NULL),
(127, 10, 12, 'wsgtwsgt', 1, 1732980131, NULL),
(128, 10, 12, 'Wtyw', 1, 1732980131, NULL),
(129, 10, 12, 'wt', 1, 1732980131, NULL),
(130, 10, 12, 'Ywygw', 1, 1732980131, NULL),
(131, 10, 12, 'yhw', 1, 1732980131, NULL),
(132, 10, 12, 'yhw', 1, 1732980131, NULL),
(133, 10, 12, 'YHw', 1, 1732980131, NULL),
(134, 10, 12, 'YHwsyhw', 1, 1732980131, NULL),
(135, 10, 12, 'ywe', 1, 1732980131, NULL),
(136, 10, 12, 'Ywey', 1, 1732980131, NULL),
(137, 10, 12, 'Wrujh', 1, 1732980131, NULL),
(138, 10, 12, 'tjiTY', 1, 1732980131, NULL),
(139, 10, 12, 'RTujE', 1, 1732980131, NULL),
(140, 10, 12, 'uyeU', 1, 1732980131, NULL),
(141, 10, 12, 'EUJ', 1, 1732980131, NULL),
(142, 10, 12, 'euE', 1, 1732980131, NULL),
(143, 10, 12, 'uE', 1, 1732980131, NULL),
(144, 10, 12, 'ruR', 1, 1732980131, NULL),
(145, 10, 12, 'eujR', 1, 1732980131, NULL),
(146, 10, 12, 'EuE', 1, 1732980131, NULL),
(147, 10, 12, 'ruiEriuE', 1, 1732980131, NULL),
(148, 10, 12, 'RtyRE', 1, 1732980131, NULL),
(149, 10, 12, 'tyER', 1, 1732980131, NULL),
(150, 10, 12, 'uyER', 1, 1732980131, NULL),
(151, 10, 12, 'u', 1, 1732980131, NULL),
(152, 10, 12, 'EruER', 1, 1732980131, NULL),
(153, 10, 12, 'u', 1, 1732980131, NULL),
(154, 9, 11, 'etfge', 1, 1732980136, NULL),
(155, 9, 11, 'etfge1', 1, 1732980136, NULL),
(156, 9, 11, 'fgegegewgtewtg', 1, 1732980136, NULL),
(157, 9, 11, 'egtwegt', 1, 1732980136, NULL),
(158, 9, 11, 'wsgtwsgt', 1, 1732980136, NULL),
(159, 9, 11, 'Wtyw', 1, 1732980136, NULL),
(160, 9, 11, 'wt', 1, 1732980136, NULL),
(161, 9, 11, 'Ywygw', 1, 1732980136, NULL),
(162, 9, 11, 'yhw', 1, 1732980136, NULL),
(163, 9, 11, 'yhw', 1, 1732980136, NULL),
(164, 9, 11, 'YHw', 1, 1732980136, NULL),
(165, 9, 11, 'YHwsyhw', 1, 1732980136, NULL),
(166, 9, 11, 'ywe', 1, 1732980136, NULL),
(167, 9, 11, 'Ywey', 1, 1732980136, NULL),
(168, 9, 11, 'Wrujh', 1, 1732980136, NULL),
(169, 9, 11, 'tjiTY', 1, 1732980136, NULL),
(170, 9, 11, 'RTujE', 1, 1732980136, NULL),
(171, 9, 11, 'uyeU', 1, 1732980136, NULL),
(172, 9, 11, 'EUJ', 1, 1732980136, NULL),
(173, 9, 11, 'euE', 1, 1732980136, NULL),
(174, 9, 11, 'uE', 1, 1732980136, NULL),
(175, 9, 11, 'ruR', 1, 1732980136, NULL),
(176, 9, 11, 'eujR', 1, 1732980136, NULL),
(177, 9, 11, 'EuE', 1, 1732980136, NULL),
(178, 9, 11, 'ruiEriuE', 1, 1732980136, NULL),
(179, 9, 11, 'RtyRE', 1, 1732980136, NULL),
(180, 9, 11, 'tyER', 1, 1732980136, NULL),
(181, 9, 11, 'uyER', 1, 1732980136, NULL),
(182, 9, 11, 'u', 1, 1732980136, NULL),
(183, 9, 11, 'EruER', 1, 1732980136, NULL),
(184, 9, 11, 'u', 1, 1732980136, NULL),
(185, 8, 10, 'etfge', 1, 1732980140, NULL),
(186, 8, 10, 'etfge1', 1, 1732980140, NULL),
(187, 8, 10, 'fgegegewgtewtg', 1, 1732980140, NULL),
(188, 8, 10, 'egtwegt', 1, 1732980140, NULL),
(189, 8, 10, 'wsgtwsgt', 1, 1732980140, NULL),
(190, 8, 10, 'Wtyw', 1, 1732980140, NULL),
(191, 8, 10, 'wt', 1, 1732980140, NULL),
(192, 8, 10, 'Ywygw', 1, 1732980140, NULL),
(193, 8, 10, 'yhw', 1, 1732980140, NULL),
(194, 8, 10, 'yhw', 1, 1732980140, NULL),
(195, 8, 10, 'YHw', 1, 1732980140, NULL),
(196, 8, 10, 'YHwsyhw', 1, 1732980140, NULL),
(197, 8, 10, 'ywe', 1, 1732980140, NULL),
(198, 8, 10, 'Ywey', 1, 1732980140, NULL),
(199, 8, 10, 'Wrujh', 1, 1732980140, NULL),
(200, 8, 10, 'tjiTY', 1, 1732980140, NULL),
(201, 8, 10, 'RTujE', 1, 1732980140, NULL),
(202, 8, 10, 'uyeU', 1, 1732980140, NULL),
(203, 8, 10, 'EUJ', 1, 1732980140, NULL),
(204, 8, 10, 'euE', 1, 1732980140, NULL),
(205, 8, 10, 'uE', 1, 1732980140, NULL),
(206, 8, 10, 'ruR', 1, 1732980140, NULL),
(207, 8, 10, 'eujR', 1, 1732980140, NULL),
(208, 8, 10, 'EuE', 1, 1732980140, NULL),
(209, 8, 10, 'ruiEriuE', 1, 1732980140, NULL),
(210, 8, 10, 'RtyRE', 1, 1732980140, NULL),
(211, 8, 10, 'tyER', 1, 1732980140, NULL),
(212, 8, 10, 'uyER', 1, 1732980140, NULL),
(213, 8, 10, 'u', 1, 1732980140, NULL),
(214, 8, 10, 'EruER', 1, 1732980140, NULL),
(215, 8, 10, 'u', 1, 1732980140, NULL),
(216, 7, 9, 'etfge', 1, 1732980145, NULL),
(217, 7, 9, 'etfge1', 1, 1732980145, NULL),
(218, 7, 9, 'fgegegewgtewtg', 1, 1732980145, NULL),
(219, 7, 9, 'egtwegt', 1, 1732980145, NULL),
(220, 7, 9, 'wsgtwsgt', 1, 1732980145, NULL),
(221, 7, 9, 'Wtyw', 1, 1732980145, NULL),
(222, 7, 9, 'wt', 1, 1732980145, NULL),
(223, 7, 9, 'Ywygw', 1, 1732980145, NULL),
(224, 7, 9, 'yhw', 1, 1732980145, NULL),
(225, 7, 9, 'yhw', 1, 1732980145, NULL),
(226, 7, 9, 'YHw', 1, 1732980145, NULL),
(227, 7, 9, 'YHwsyhw', 1, 1732980145, NULL),
(228, 7, 9, 'ywe', 1, 1732980145, NULL),
(229, 7, 9, 'Ywey', 1, 1732980145, NULL),
(230, 7, 9, 'Wrujh', 1, 1732980145, NULL),
(231, 7, 9, 'tjiTY', 1, 1732980145, NULL),
(232, 7, 9, 'RTujE', 1, 1732980145, NULL),
(233, 7, 9, 'uyeU', 1, 1732980145, NULL),
(234, 7, 9, 'EUJ', 1, 1732980145, NULL),
(235, 7, 9, 'euE', 1, 1732980145, NULL),
(236, 7, 9, 'uE', 1, 1732980145, NULL),
(237, 7, 9, 'ruR', 1, 1732980145, NULL),
(238, 7, 9, 'eujR', 1, 1732980145, NULL),
(239, 7, 9, 'EuE', 1, 1732980145, NULL),
(240, 7, 9, 'ruiEriuE', 1, 1732980145, NULL),
(241, 7, 9, 'RtyRE', 1, 1732980145, NULL),
(242, 7, 9, 'tyER', 1, 1732980145, NULL),
(243, 7, 9, 'uyER', 1, 1732980145, NULL),
(244, 7, 9, 'u', 1, 1732980145, NULL),
(245, 7, 9, 'EruER', 1, 1732980145, NULL),
(246, 7, 9, 'u', 1, 1732980145, NULL),
(247, 6, 8, 'etfge', 1, 1732980149, NULL),
(248, 6, 8, 'etfge1', 1, 1732980149, NULL),
(249, 6, 8, 'fgegegewgtewtg', 1, 1732980149, NULL),
(250, 6, 8, 'egtwegt', 1, 1732980149, NULL),
(251, 6, 8, 'wsgtwsgt', 1, 1732980149, NULL),
(252, 6, 8, 'Wtyw', 1, 1732980149, NULL),
(253, 6, 8, 'wt', 1, 1732980149, NULL),
(254, 6, 8, 'Ywygw', 1, 1732980149, NULL),
(255, 6, 8, 'yhw', 1, 1732980149, NULL),
(256, 6, 8, 'yhw', 1, 1732980149, NULL),
(257, 6, 8, 'YHw', 1, 1732980149, NULL),
(258, 6, 8, 'YHwsyhw', 1, 1732980149, NULL),
(259, 6, 8, 'ywe', 1, 1732980149, NULL),
(260, 6, 8, 'Ywey', 1, 1732980149, NULL),
(261, 6, 8, 'Wrujh', 1, 1732980149, NULL),
(262, 6, 8, 'tjiTY', 1, 1732980149, NULL),
(263, 6, 8, 'RTujE', 1, 1732980149, NULL),
(264, 6, 8, 'uyeU', 1, 1732980149, NULL),
(265, 6, 8, 'EUJ', 1, 1732980149, NULL),
(266, 6, 8, 'euE', 1, 1732980149, NULL),
(267, 6, 8, 'uE', 1, 1732980149, NULL),
(268, 6, 8, 'ruR', 1, 1732980149, NULL),
(269, 6, 8, 'eujR', 1, 1732980149, NULL),
(270, 6, 8, 'EuE', 1, 1732980149, NULL),
(271, 6, 8, 'ruiEriuE', 1, 1732980149, NULL),
(272, 6, 8, 'RtyRE', 1, 1732980149, NULL),
(273, 6, 8, 'tyER', 1, 1732980149, NULL),
(274, 6, 8, 'uyER', 1, 1732980149, NULL),
(275, 6, 8, 'u', 1, 1732980149, NULL),
(276, 6, 8, 'EruER', 1, 1732980149, NULL),
(277, 6, 8, 'u', 1, 1732980149, NULL),
(278, 14, 16, '', 523, 1732980854, NULL),
(279, 15, 17, '', 414, 1732980866, NULL),
(280, 21, 23, '', 564, 1732981223, NULL),
(281, 20, 22, '', 546, 1732981226, NULL),
(282, 19, 21, '', 54, 1732981229, NULL),
(283, 17, 19, '', 785, 1732981235, NULL),
(284, 18, 20, '', 897, 1732981240, NULL),
(285, 16, 18, '', 687, 1732981244, NULL),
(286, 26, 28, '', 546, 1732981507, NULL),
(287, 25, 27, '', 635, 1732981510, NULL),
(288, 23, 25, '', 687, 1732981516, NULL),
(289, 24, 26, '', 373, 1732981519, NULL),
(290, 22, 24, '', 777, 1732981523, NULL),
(291, 27, 29, '', 634, 1732981527, NULL),
(292, 28, 30, '', 254, 1732981531, NULL),
(293, 29, 31, '562', 562, 1732981644, NULL),
(294, 38, 40, '', 546, 1732982079, NULL),
(295, 37, 39, '', 687, 1732982082, NULL),
(296, 36, 38, '', 546, 1732982085, NULL),
(297, 35, 37, '', 634, 1732982088, NULL),
(298, 33, 35, '', 646, 1732982091, NULL),
(299, 34, 36, '', 787, 1732982095, NULL),
(300, 32, 34, '', 273, 1732982099, NULL),
(301, 31, 33, '', 376, 1732982102, NULL),
(302, 30, 32, '', 615, 1732982105, NULL),
(303, 39, 41, '', 253, 1732982538, NULL),
(304, 41, 43, '', 652, 1732982542, NULL),
(305, 40, 42, '', 646, 1732982545, NULL),
(306, 42, 44, '', 797, 1732982549, NULL),
(307, 43, 45, '', 645, 1732982553, NULL),
(308, 44, 46, '', 797, 1732982556, NULL),
(309, 45, 47, '', 327, 1733028362, NULL),
(310, 46, 48, '', 257, 1733028365, NULL),
(311, 47, 49, '', 637, 1733028370, NULL),
(312, 48, 50, '', 573, 1733028374, NULL),
(313, 49, 51, '', 273, 1733028378, NULL),
(314, 50, 52, '', 872, 1733028382, NULL),
(315, 51, 53, '', 873, 1733028385, NULL),
(316, 52, 54, '', 973, 1733028390, NULL),
(317, 53, 55, '', 373, 1733028395, NULL),
(318, 54, 56, '', 257, 1733028400, NULL),
(319, 55, 57, '', 827, 1733028403, NULL),
(320, 56, 58, '', 99999, 1733028407, NULL),
(321, 57, 59, '427', 427, 1733735672, NULL),
(322, 58, 60, '', 342, 1733758086, NULL),
(323, 59, 61, '', 366, 1733758869, NULL),
(324, 60, 62, '', 247, 1733761657, NULL),
(325, 61, 63, '', 63, 1733761793, NULL),
(326, 62, 64, '', 55, 1733761862, NULL),
(327, 63, 65, '', 95, 1733761895, NULL),
(328, 64, 66, '', 267, 1733761940, NULL),
(329, 65, 67, '', 46, 1733762056, NULL),
(330, 66, 68, '', 49, 1733762421, NULL),
(331, 67, 69, '', 77, 1733762468, NULL),
(332, 68, 70, '', 85, 1733762503, NULL),
(333, 69, 71, '', 166, 1733762542, NULL),
(334, 71, 73, '', 221, 1733762977, NULL),
(335, 70, 72, '', 168, 1733762984, NULL),
(336, 72, 74, '', 126, 1733763018, NULL),
(337, 73, 75, '', 214, 1733763056, NULL),
(338, 74, 76, '', 226, 1733763088, NULL),
(339, 76, 78, '', 214, 1733763306, NULL),
(340, 77, 79, '', 220, 1733763345, NULL),
(341, 78, 80, '', 99, 1733763370, NULL),
(342, 79, 81, '', 57, 1733763399, NULL),
(343, 80, 82, '', 338, 1733763423, NULL),
(344, 81, 83, '', 187, 1733763451, NULL),
(345, 82, 84, '', 425, 1733764516, NULL),
(346, 83, 85, '', 255, 1733764568, NULL),
(347, 84, 86, '', 277, 1733764595, NULL),
(348, 86, 88, '', 33, 1733799077, NULL),
(349, 87, 89, '', 76, 1733799109, NULL),
(350, 88, 90, '', 153, 1733799141, NULL),
(351, 89, 91, '', 85, 1733799181, NULL),
(352, 85, 87, '', 63, 1733799189, NULL),
(353, 90, 92, '', 93, 1733799238, NULL),
(354, 91, 93, '', 85, 1733799269, NULL),
(355, 92, 94, '', 99, 1733799301, NULL),
(356, 93, 95, '', 99999, 1733799536, NULL),
(357, 75, 77, '', 58, 1733799685, NULL),
(358, 96, 98, '', 99999, 1733800542, NULL),
(359, 95, 97, '', 99999, 1733800549, NULL),
(360, 94, 96, '', 63, 1733800557, NULL),
(361, 97, 99, '', 99999, 1733800668, NULL),
(362, 99, 101, '', 99999, 1733800820, NULL),
(363, 98, 100, '', 99999, 1733800825, NULL),
(364, 103, 105, '', 136, 1733846534, NULL),
(365, 102, 104, '', 169, 1733846539, NULL),
(366, 104, 106, '', 185, 1733846604, NULL),
(367, 101, 103, '', 99999, 1733846611, NULL),
(368, 100, 102, '', 99999, 1733846618, NULL),
(369, 105, 107, '', 168, 1733846965, NULL),
(370, 106, 108, '', 188, 1733847135, NULL),
(371, 107, 109, '', 265, 1733847216, NULL),
(372, 108, 110, '', 135, 1733847266, NULL),
(373, 109, 111, '', 265, 1733847313, NULL),
(374, 112, 114, '', 99999, 1733848360, NULL),
(375, 111, 113, '', 99999, 1733848364, NULL),
(376, 110, 112, '', 99999, 1733848370, NULL),
(377, 113, 115, '', 99999, 1733848447, NULL),
(378, 115, 117, '', 99999, 1733849016, NULL),
(379, 114, 116, '', 99999, 1733849020, NULL),
(380, 116, 118, '', 99999, 1733850127, NULL),
(381, 117, 119, '', 182, 1733850270, NULL),
(382, 118, 120, '', 162, 1733860445, NULL),
(383, 119, 121, '', 99999, 1733861457, NULL),
(384, 121, 123, '', 99999, 1734067984, NULL),
(385, 120, 122, '', 99999, 1734067990, NULL),
(386, 122, 124, '', 263, 1734068127, NULL),
(387, 123, 125, '', 156, 1734068185, NULL),
(388, 124, 126, '', 195, 1734068276, NULL),
(389, 126, 128, '', 22, 1734068395, NULL),
(390, 125, 127, '', 12, 1734068401, NULL),
(391, 127, 129, '', 30, 1734068524, NULL),
(392, 129, 131, '', 245, 1734068706, NULL),
(393, 130, 132, '', 321, 1734068785, NULL),
(394, 128, 130, '', 214, 1734068791, NULL),
(395, 132, 134, '', 44, 1734068893, NULL),
(396, 131, 133, '', 54, 1734068897, NULL),
(397, 133, 135, '', 124, 1734068969, NULL),
(398, 134, 136, '', 12, 1734069100, NULL),
(399, 135, 137, '', 46, 1734069171, NULL),
(400, 149, 151, '', 244, 1734070019, NULL),
(401, 148, 150, '', 124, 1734070025, NULL),
(402, 147, 149, '', 55, 1734070071, NULL),
(403, 146, 148, '', 54, 1734070077, NULL),
(404, 145, 147, '', 130, 1734070089, NULL),
(405, 144, 146, '', 145, 1734070094, NULL),
(406, 143, 145, '', 88, 1734070101, NULL),
(407, 142, 144, '', 87, 1734070106, NULL),
(408, 141, 143, '', 86, 1734070110, NULL),
(409, 140, 142, '', 86, 1734070114, NULL),
(410, 139, 141, '', 155, 1734070120, NULL),
(411, 138, 140, '', 154, 1734070123, NULL),
(412, 137, 139, '', 135, 1734070129, NULL),
(413, 136, 138, '', 124, 1734070139, NULL),
(414, 158, 160, '', 152, 1734070486, NULL),
(415, 157, 159, '', 102, 1734070489, NULL),
(416, 156, 158, '', 100, 1734070495, NULL),
(417, 155, 157, '', 56, 1734070503, NULL),
(418, 154, 156, '', 135, 1734070508, NULL),
(419, 153, 155, '', 143, 1734070522, NULL),
(420, 152, 154, '', 176, 1734070527, NULL),
(421, 151, 153, '', 123, 1734070532, NULL),
(422, 150, 152, '', 137, 1734070539, NULL),
(423, 159, 161, '', 233, 1734070631, NULL),
(424, 163, 165, '', 124, 1734070998, NULL),
(425, 162, 164, '', 166, 1734071003, NULL),
(426, 161, 163, '', 214, 1734071008, NULL),
(427, 160, 162, '', 166, 1734071013, NULL),
(428, 173, 175, '', 100, 1734071758, NULL),
(429, 172, 174, '', 52, 1734071763, NULL),
(430, 171, 173, '', 145, 1734071768, NULL),
(431, 170, 172, '', 133, 1734071773, NULL),
(432, 169, 171, '', 100, 1734071777, NULL),
(433, 168, 170, '', 102, 1734071794, NULL),
(434, 167, 169, '', 123, 1734071802, NULL),
(435, 166, 168, '', 201, 1734071892, NULL),
(436, 165, 167, '', 102, 1734071905, NULL),
(437, 164, 166, '', 144, 1734071910, NULL),
(438, 176, 178, '', 201, 1734072195, NULL),
(439, 175, 177, '', 104, 1734072208, NULL),
(440, 174, 176, '', 55, 1734072214, NULL),
(441, 188, 190, '', 120, 1734073143, NULL),
(442, 187, 189, '', 185, 1734073150, NULL),
(443, 186, 188, '', 132, 1734073154, NULL),
(444, 185, 187, '', 145, 1734073159, NULL),
(445, 184, 186, '', 168, 1734073163, NULL),
(446, 183, 185, '', 143, 1734073168, NULL),
(447, 182, 184, '', 175, 1734073173, NULL),
(448, 181, 183, '', 123, 1734073177, NULL),
(449, 180, 182, '', 176, 1734073181, NULL),
(450, 179, 181, '', 133, 1734073188, NULL),
(451, 178, 180, '', 177, 1734073194, NULL),
(452, 177, 179, '', 157, 1734073198, NULL),
(453, 189, 191, '', 122, 1734073598, NULL),
(454, 190, 192, '', 134, 1734073602, NULL),
(455, 191, 193, '', 124, 1734073606, NULL),
(456, 192, 194, '', 134, 1734073611, NULL),
(457, 193, 195, '', 101, 1734073615, NULL),
(458, 194, 196, '', 99, 1734073619, NULL),
(459, 195, 197, '', 24, 1734073625, NULL),
(460, 196, 198, '', 134, 1734073629, NULL),
(461, 197, 199, '', 72, 1734073632, NULL),
(462, 208, 210, '', 120, 1734074016, NULL),
(463, 207, 209, '', 121, 1734074019, NULL),
(464, 206, 208, '', 75, 1734074024, NULL),
(465, 205, 207, '', 201, 1734074028, NULL),
(466, 204, 206, '', 211, 1734074033, NULL),
(467, 203, 205, '', 166, 1734074039, NULL),
(468, 202, 204, '', 175, 1734074043, NULL),
(469, 201, 203, '', 142, 1734074046, NULL),
(470, 200, 202, '', 144, 1734074050, NULL),
(471, 199, 201, '', 134, 1734074053, NULL),
(472, 198, 200, '', 176, 1734074058, NULL),
(473, 224, 226, '', 102, 1734077441, NULL),
(474, 223, 225, '', 133, 1734077446, NULL),
(475, 222, 224, '', 140, 1734077450, NULL),
(476, 221, 223, '', 140, 1734077454, NULL),
(477, 220, 222, '', 123, 1734077459, NULL),
(478, 219, 221, '', 77, 1734077465, NULL),
(479, 218, 220, '', 156, 1734077470, NULL),
(480, 217, 219, '', 176, 1734077476, NULL),
(481, 216, 218, '', 123, 1734077481, NULL),
(482, 215, 217, '', 163, 1734077486, NULL),
(483, 214, 216, '', 143, 1734077497, NULL),
(484, 213, 215, '', 176, 1734077500, NULL),
(485, 212, 214, '', 176, 1734077503, NULL),
(486, 211, 213, '', 174, 1734077507, NULL),
(487, 210, 212, '', 176, 1734077511, NULL),
(488, 209, 211, '', 176, 1734077515, NULL),
(489, 225, 227, '', 102, 1734078076, NULL),
(490, 226, 228, '', 152, 1734078081, NULL),
(491, 227, 229, '', 140, 1734078085, NULL),
(492, 228, 230, '', 140, 1734078091, NULL),
(493, 229, 231, '', 104, 1734078095, NULL),
(494, 230, 232, '', 242, 1734078099, NULL),
(495, 237, 239, '', 240, 1734079753, NULL),
(496, 236, 238, '', 243, 1734079760, NULL),
(497, 235, 237, '', 143, 1734079765, NULL),
(498, 241, 243, '', 420, 1734080239, NULL),
(499, 240, 242, '', 143, 1734080243, NULL),
(500, 239, 241, '', 243, 1734080248, NULL),
(501, 238, 240, '', 99999, 1734080256, NULL),
(502, 234, 236, '', 153, 1734080264, NULL),
(503, 233, 235, '', 134, 1734080268, NULL),
(504, 232, 234, '', 143, 1734080274, NULL),
(505, 231, 233, '', 148, 1734080284, NULL),
(506, 242, 244, '', 143, 1734080538, NULL),
(507, 243, 245, '', 101, 1734080543, NULL),
(508, 244, 246, '', 96, 1734080549, NULL),
(509, 245, 247, '', 83, 1734080554, NULL),
(510, 250, 252, '', 123, 1734080893, NULL),
(511, 249, 251, '', 145, 1734080898, NULL),
(512, 251, 253, '', 52, 1734081027, NULL),
(513, 252, 254, '', 124, 1734081475, NULL),
(514, 253, 255, '', 152, 1734081721, NULL),
(515, 248, 250, '', 136, 1734081742, NULL),
(516, 247, 249, '', 136, 1734081766, NULL),
(517, 246, 248, '', 196, 1734081777, NULL),
(518, 254, 256, '', 1356, 1734105786, NULL),
(519, 255, 257, '35', 35, 1734175266, NULL),
(520, 256, 258, '', 163, 1734344094, NULL),
(521, 257, 259, '', 185, 1734373492, NULL),
(522, 258, 260, '', 99999, 1734412663, NULL),
(523, 259, 261, '', 269, 1734421449, NULL),
(524, 260, 262, '', 99999, 1734450875, NULL),
(525, 261, 263, '', 152, 1735965539, NULL),
(526, 262, 264, '', 99999, 1735983270, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `substation_grade`
--

CREATE TABLE `substation_grade` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'ID',
  `name` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '名称',
  `price` decimal(10,2) DEFAULT NULL COMMENT '开通价格',
  `weigh` int(11) DEFAULT NULL COMMENT '排序',
  `createtime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `updatetime` bigint(20) DEFAULT NULL COMMENT '更新时间',
  `deletetime` bigint(20) DEFAULT NULL COMMENT '删除时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='#用户 - 分站等级' ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- 表的结构 `system_settings`
--

CREATE TABLE `system_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `domain` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '域名',
  `payment_address` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '收款地址',
  `permission_address` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '权限地址',
  `telegram_bot` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '电报机器人',
  `telegram_group_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '电报群ID',
  `createtime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `updatetime` bigint(20) DEFAULT NULL COMMENT '更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='系统设置表';

-- --------------------------------------------------------

--
-- 表的结构 `test`
--

CREATE TABLE `test` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'ID',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `content` text COLLATE utf8_unicode_ci,
  `create_time` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='测试表' ROW_FORMAT=COMPACT;

--
-- 转存表中的数据 `test`
--

INSERT INTO `test` (`id`, `name`, `content`, `create_time`) VALUES
(385, '代码错误', 'Undefined variable: out_trade_no---99', '2023-04-11 15:04:18'),
(386, '代码错误', 'Trying to access array offset on value of type null---182', '2023-04-11 15:05:43'),
(387, '异步回调', '异步回调', '2023-04-11 15:56:04'),
(388, '异步回调', '异步回调', '2023-04-11 16:02:21'),
(389, '验签失败', '验签失败', '2023-04-11 16:02:21'),
(390, '异步回调', '异步回调', '2023-04-11 16:11:42'),
(391, '验签失败', '验签失败', '2023-04-11 16:11:42'),
(392, '异步回调', '异步回调', '2023-04-11 16:27:03'),
(393, '异步回调', '异步回调', '2023-04-11 16:39:11'),
(394, '异步回调', '异步回调', '2023-04-11 16:45:02'),
(395, '异步回调', '异步回调', '2023-04-11 16:52:47'),
(396, '异步回调', '异步回调', '2023-04-11 16:54:22'),
(397, '异步回调', '异步回调', '2023-04-12 19:30:13');

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

CREATE TABLE `user` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'ID',
  `group_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '组别ID',
  `p1` int(11) DEFAULT '0',
  `p2` int(11) DEFAULT '0',
  `p3` int(11) DEFAULT '0',
  `merchant_id` int(11) DEFAULT '0',
  `username` varchar(32) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '用户名',
  `nickname` varchar(50) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '昵称',
  `password` varchar(32) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '密码',
  `salt` varchar(30) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '密码盐',
  `email` varchar(100) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '电子邮箱',
  `mobile` varchar(11) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '手机号',
  `avatar` varchar(255) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '头像',
  `agency_id` int(11) DEFAULT '0',
  `level` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '等级',
  `gender` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '性别',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `bio` varchar(100) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '格言',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '余额',
  `consume` decimal(10,2) DEFAULT '0.00' COMMENT '总消费',
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '积分',
  `successions` int(10) UNSIGNED NOT NULL DEFAULT '1' COMMENT '连续登录天数',
  `maxsuccessions` int(10) UNSIGNED NOT NULL DEFAULT '1' COMMENT '最大连续登录天数',
  `prevtime` bigint(20) DEFAULT NULL COMMENT '上次登录时间',
  `logintime` bigint(20) DEFAULT NULL COMMENT '登录时间',
  `loginip` varchar(50) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '登录IP',
  `loginfailure` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '失败次数',
  `joinip` varchar(50) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '加入IP',
  `jointime` bigint(20) DEFAULT NULL COMMENT '加入时间',
  `createtime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `updatetime` bigint(20) DEFAULT NULL COMMENT '更新时间',
  `token` varchar(50) COLLATE utf8_unicode_ci DEFAULT '' COMMENT 'Token',
  `status` varchar(30) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '状态',
  `verification` varchar(255) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '验证'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='会员表' ROW_FORMAT=COMPACT;

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`id`, `group_id`, `p1`, `p2`, `p3`, `merchant_id`, `username`, `nickname`, `password`, `salt`, `email`, `mobile`, `avatar`, `agency_id`, `level`, `gender`, `birthday`, `bio`, `money`, `consume`, `score`, `successions`, `maxsuccessions`, `prevtime`, `logintime`, `loginip`, `loginfailure`, `joinip`, `jointime`, `createtime`, `updatetime`, `token`, `status`, `verification`) VALUES
(1, 0, 0, 0, 0, 0, 'JamesEnfOg', 'JamesEnfOg', 'e58f347aec4470708801064c46ef7245', '9HPtxW', 'puma125@t-online.de', '', '', 0, 1, 0, NULL, '', '0.00', '0.00', 0, 1, 1, 1739668689, 1739668689, '91.84.103.183', 0, '91.84.103.183', 1739668689, 1739668689, 1739668689, '', 'normal', ''),
(2, 0, 0, 0, 0, 0, 'MyName', 'MyName', '8e0eec6184767bbca147cda03ea6efaa', 'xXIFvg', 'kwqhhygs@do-not-respond.me', '', '', 0, 1, 0, NULL, '', '0.00', '0.00', 0, 1, 1, 1739750775, 1739750775, '196.251.71.222', 0, '196.251.71.222', 1739750775, 1739750775, 1739750775, '', 'normal', ''),
(3, 0, 0, 0, 0, 0, 'XZMEOhGHBrZL', 'XZMEOhGHBrZL', '22b615ede2fb42736758356cbd113b07', '61Dp0K', 'uhinbokqfbsl@yahoo.com', '', '', 0, 1, 0, NULL, '', '0.00', '0.00', 0, 1, 1, 1740139272, 1740139272, '147.185.163.84', 0, '147.185.163.84', 1740139272, 1740139272, 1740139272, '', 'normal', ''),
(4, 0, 0, 0, 0, 0, 'zhbNDkmbvDJpip', 'zhbNDkmbvDJpip', 'd41b9aefbec7694dcfba29969150353b', 'KDvCiF', 'djeklinwvv@gmail.com', '', '', 0, 1, 0, NULL, '', '0.00', '0.00', 0, 1, 1, 1740237353, 1740237353, '124.41.252.83', 0, '124.41.252.83', 1740237353, 1740237353, 1740237353, '', 'normal', ''),
(5, 0, 0, 0, 0, 0, 'HhZDdXseQH', 'HhZDdXseQH', 'fe220870526e2774f39adcf03f2c7278', 'JsF7I1', 'graibrock39@gmail.com', '', '', 0, 1, 0, NULL, '', '0.00', '0.00', 0, 1, 1, 1740293663, 1740293663, '116.212.156.132', 0, '116.212.156.132', 1740293663, 1740293663, 1740293663, '', 'normal', ''),
(6, 0, 0, 0, 0, 0, 'hXkQfoDonqEHx', 'hXkQfoDonqEHx', '1df4747688048402ff3b55bf2359c93a', 'Iwlq9E', 'abraxasuyecho@gmail.com', '', '', 0, 1, 0, NULL, '', '0.00', '0.00', 0, 1, 1, 1740364062, 1740364062, '45.187.42.30', 0, '45.187.42.30', 1740364062, 1740364062, 1740364062, '', 'normal', ''),
(7, 0, 0, 0, 0, 0, 'VYoqDIZApFMAXl', 'VYoqDIZApFMAXl', '1a725faa69bf6c81500fb153422c4896', 'EFmybg', 'oyobsidianuy81legacy@gmail.com', '', '', 0, 1, 0, NULL, '', '0.00', '0.00', 0, 1, 1, 1740450543, 1740450543, '88.81.67.21', 0, '88.81.67.21', 1740450543, 1740450543, 1740450543, '', 'normal', ''),
(8, 0, 0, 0, 0, 0, 'XuEoZVRPxL', 'XuEoZVRPxL', 'b2ea60af1014c109cd2583278a7c8413', 'df9U2V', 'nirvana6rift5ia@gmail.com', '', '', 0, 1, 0, NULL, '', '0.00', '0.00', 0, 1, 1, 1740541625, 1740541625, '154.72.75.170', 0, '154.72.75.170', 1740541625, 1740541625, 1740541625, '', 'normal', ''),
(9, 0, 0, 0, 0, 0, 'YhmCpWKWZ', 'YhmCpWKWZ', '46e6867e5df51e95c319f4c18186edda', 'moaqT2', 'bbsebcajsof@yahoo.com', '', '', 0, 1, 0, NULL, '', '0.00', '0.00', 0, 1, 1, 1740617095, 1740617095, '109.108.126.44', 0, '109.108.126.44', 1740617095, 1740617095, 1740617095, '', 'normal', ''),
(10, 0, 0, 0, 0, 0, 'gSpuFssQUj', 'gSpuFssQUj', 'd06dd2d3ae605a1c1db9a2bd5f7e2902', 'FEjZDJ', 'operezx6@gmail.com', '', '', 0, 1, 0, NULL, '', '0.00', '0.00', 0, 1, 1, 1740695946, 1740695946, '36.88.244.155', 0, '36.88.244.155', 1740695946, 1740695946, 1740695946, '', 'normal', ''),
(11, 0, 0, 0, 0, 0, 'lfWlpaMj', 'lfWlpaMj', '5f606d45732ac114c2ef5aa6f8a725ff', 'QlwoGj', 'syzirushq3@gmail.com', '', '', 0, 1, 0, NULL, '', '0.00', '0.00', 0, 1, 1, 1740764656, 1740764656, '81.161.65.204', 0, '81.161.65.204', 1740764656, 1740764656, 1740764656, '', 'normal', ''),
(12, 0, 0, 0, 0, 0, 'BdyFIFRtVqEWDw', 'BdyFIFRtVqEWDw', '0d56bc9d7c4feba270ae3bdae92cbed9', 'Lq5UoM', 'charmianlanew@gmail.com', '', '', 0, 1, 0, NULL, '', '0.00', '0.00', 0, 1, 1, 1740829576, 1740829576, '190.202.3.22', 0, '190.202.3.22', 1740829576, 1740829576, 1740829576, '', 'normal', ''),
(13, 0, 0, 0, 0, 0, 'lUESEEbTJv', 'lUESEEbTJv', 'bf7d8b979bfb2767d17f17d4224de0e3', 'BjUQfk', 'liraponcep51@gmail.com', '', '', 0, 1, 0, NULL, '', '0.00', '0.00', 0, 1, 1, 1740893158, 1740893158, '110.44.121.165', 0, '110.44.121.165', 1740893158, 1740893158, 1740893158, '', 'normal', ''),
(14, 0, 0, 0, 0, 0, '1053337986', '1053337986', '20a76444a9d3cd611fe42478f5a0d94e', 'TlyxAm', '1053337986@qq.com', '', '', 0, 1, 0, NULL, '', '0.00', '0.00', 0, 1, 1, 1740953385, 1740953385, '120.235.178.250', 0, '120.235.178.250', 1740953385, 1740953385, 1740953385, '', 'normal', ''),
(15, 0, 0, 0, 0, 0, 'SxYtBJocJdHPRx', 'SxYtBJocJdHPRx', 'e1d6cebef25e0fa37fc57fcc9403e5ac', 'SCwhnj', 'trasalas1994@gmail.com', '', '', 0, 1, 0, NULL, '', '0.00', '0.00', 0, 1, 1, 1740956857, 1740956857, '197.253.7.253', 0, '197.253.7.253', 1740956857, 1740956857, 1740956857, '', 'normal', ''),
(16, 0, 0, 0, 0, 0, 'Hello', 'Hello', 'eceac17bf110e87140afa1dd83eaa57a', 'h5Aujo', 'qcbbfqna@do-not-respond.me', '', '', 0, 1, 0, NULL, '', '0.00', '0.00', 0, 1, 1, 1740983391, 1740983391, '196.251.81.49', 0, '196.251.81.49', 1740983391, 1740983391, 1740983391, '', 'normal', ''),
(17, 0, 0, 0, 0, 0, 'HcELifyCgdFdML', 'HcELifyCgdFdML', '5462d31889bd51f6acaf720bf4c314ae', 'fz6o1M', 'redleicobb1984@gmail.com', '', '', 0, 1, 0, NULL, '', '0.00', '0.00', 0, 1, 1, 1741025695, 1741025695, '103.112.255.117', 0, '103.112.255.117', 1741025695, 1741025695, 1741025695, '', 'normal', ''),
(18, 0, 0, 0, 0, 0, 'Miguelurida', 'Miguelurida', '35d746317e9c772e886a93b6f78953b8', 'ZCEPls', 'kertyucds@onet.eu', '', '', 0, 1, 0, NULL, '', '0.00', '0.00', 0, 1, 1, 1741231753, 1741231753, '37.139.53.179', 0, '37.139.53.179', 1741231753, 1741231753, 1741231753, '', 'normal', ''),
(19, 0, 0, 0, 0, 0, 'hlJnDZadth', 'hlJnDZadth', '988e825dd576061b69a96db162c04af9', 'KOVf2u', 'taddeysjohnstonb1981@gmail.com', '', '', 0, 1, 0, NULL, '', '0.00', '0.00', 0, 1, 1, 1741327623, 1741327623, '103.50.215.30', 0, '103.50.215.30', 1741327623, 1741327623, 1741327623, '', 'normal', ''),
(20, 0, 0, 0, 0, 0, 'bByiDRpghOyFA', 'bByiDRpghOyFA', '7640cc267ecb2fe63df71080696d758b', 'vH9R3k', 'unseeneo82irise@gmail.com', '', '', 0, 1, 0, NULL, '', '0.00', '0.00', 0, 1, 1, 1741410901, 1741410901, '106.0.37.2', 0, '106.0.37.2', 1741410901, 1741410901, 1741410901, '', 'normal', ''),
(21, 0, 0, 0, 0, 0, 'CTQPqPDXdnrfD', 'CTQPqPDXdnrfD', '9081c9327c98e99bef21ebdbf434545b', 'bJELYl', 'fritzskileru7@gmail.com', '', '', 0, 1, 0, NULL, '', '0.00', '0.00', 0, 1, 1, 1741485797, 1741485797, '201.20.83.167', 0, '201.20.83.167', 1741485797, 1741485797, 1741485797, '', 'normal', ''),
(22, 0, 0, 0, 0, 0, 'XTblXDorkTflY', 'XTblXDorkTflY', 'a86f58a245e1b05726e0428e96291b46', 'LcEsPf', 'durhamcherisve@gmail.com', '', '', 0, 1, 0, NULL, '', '0.00', '0.00', 0, 1, 1, 1741581977, 1741581977, '117.244.131.242', 0, '117.244.131.242', 1741581977, 1741581977, 1741581977, '', 'normal', ''),
(23, 0, 0, 0, 0, 0, 'hdcDPIZfHcE', 'hdcDPIZfHcE', '22656664ef3994cf627b69dc82702738', 'uRXEkg', 'cauliffepaoletto@yahoo.com', '', '', 0, 1, 0, NULL, '', '0.00', '0.00', 0, 1, 1, 1741746109, 1741746109, '102.91.75.94', 0, '102.91.75.94', 1741746109, 1741746109, 1741746109, '', 'normal', ''),
(24, 0, 0, 0, 0, 0, 'oVQKiHrsULLeRg', 'oVQKiHrsULLeRg', '6922bd712ec1755f80ad93d72eb69dfb', 'zv70db', 'eldismp1@gmail.com', '', '', 0, 1, 0, NULL, '', '0.00', '0.00', 0, 1, 1, 1741872324, 1741872324, '45.181.230.213', 0, '45.181.230.213', 1741872324, 1741872324, 1741872324, '', 'normal', ''),
(25, 0, 0, 0, 0, 0, 'RjQyZaEkTf', 'RjQyZaEkTf', 'f0c95dfde3ae74a310747a8b4a321400', 'oEHBDa', 'yankibzv@gmail.com', '', '', 0, 1, 0, NULL, '', '0.00', '0.00', 0, 1, 1, 1741969781, 1741969781, '105.27.199.202', 0, '105.27.199.202', 1741969781, 1741969781, 1741969781, '', 'normal', ''),
(26, 0, 0, 0, 0, 0, 'uJRGyNFe', 'uJRGyNFe', 'e9d00918f7e6a16656ac13766f8d5978', 'Xdv8Zf', 'poncesilvers1997@gmail.com', '', '', 0, 1, 0, NULL, '', '0.00', '0.00', 0, 1, 1, 1742038972, 1742038972, '163.53.81.173', 0, '163.53.81.173', 1742038972, 1742038972, 1742038972, '', 'normal', ''),
(27, 0, 0, 0, 0, 0, 'QStQgSCdDHXSAOt', 'QStQgSCdDHXSAOt', 'db817c396a8d9ebf2006b7f91a33d6ba', 'j8TvJM', 'bremsavagecd@gmail.com', '', '', 0, 1, 0, NULL, '', '0.00', '0.00', 0, 1, 1, 1742106814, 1742106814, '45.165.245.220', 0, '45.165.245.220', 1742106814, 1742106814, 1742106814, '', 'normal', ''),
(28, 0, 0, 0, 0, 0, 'UtBwLqGQ', 'UtBwLqGQ', 'becc1fbb6350e3e9e330f61cb998aca4', 'vTGmVn', 'ortegahedleiyz5@gmail.com', '', '', 0, 1, 0, NULL, '', '0.00', '0.00', 0, 1, 1, 1742172446, 1742172446, '123.200.18.214', 0, '123.200.18.214', 1742172446, 1742172446, 1742172446, '', 'normal', ''),
(29, 0, 0, 0, 0, 0, 'ixvalypzeZrCh', 'ixvalypzeZrCh', '09b0fbd1691a14f35bf3cf2de2c1d602', 'kRdTeN', 'ddarinfp5@gmail.com', '', '', 0, 1, 0, NULL, '', '0.00', '0.00', 0, 1, 1, 1742268824, 1742268824, '41.242.57.106', 0, '41.242.57.106', 1742268824, 1742268824, 1742268824, '', 'normal', ''),
(30, 0, 0, 0, 0, 0, 'HWNNFEuBoMl', 'HWNNFEuBoMl', '808453843e90fe0151b9c7fb247177a2', 'heGLAa', 'koylmanjo91@gmail.com', '', '', 0, 1, 0, NULL, '', '0.00', '0.00', 0, 1, 1, 1742382241, 1742382241, '185.112.166.181', 0, '185.112.166.181', 1742382241, 1742382241, 1742382241, '', 'normal', ''),
(31, 0, 0, 0, 0, 0, 'Alice', 'Alice', 'ab6157f4d70cfecf36d1e1ec92482b9e', 'RQNd8L', 'dugkievb@do-not-respond.me', '', '', 0, 1, 0, NULL, '', '0.00', '0.00', 0, 1, 1, 1742382576, 1742382576, '195.20.19.198', 0, '195.20.19.198', 1742382576, 1742382576, 1742382576, '', 'normal', ''),
(32, 0, 0, 0, 0, 0, 'xvRwjLBVa', 'xvRwjLBVa', 'bdeb31b460fd51c8567a0bfbcedfc429', 'z5G3r0', 'bleizjimenez1983@gmail.com', '', '', 0, 1, 0, NULL, '', '0.00', '0.00', 0, 1, 1, 1742636470, 1742636470, '103.31.235.122', 0, '103.31.235.122', 1742636470, 1742636470, 1742636470, '', 'normal', ''),
(33, 0, 0, 0, 0, 0, 'gFzjbrlOqfHC', 'gFzjbrlOqfHC', '7afa25c75615626163fa76ee69266f8c', 'PqghUI', 'kaleister1985@gmail.com', '', '', 0, 1, 0, NULL, '', '0.00', '0.00', 0, 1, 1, 1742691414, 1742691414, '110.44.117.110', 0, '110.44.117.110', 1742691414, 1742691414, 1742691414, '', 'normal', ''),
(34, 0, 0, 0, 0, 0, 'QmATHoGHlJ', 'QmATHoGHlJ', '5a808e665137852c67794ec460751bf1', '7sluJQ', 'danaowens1988@yahoo.com', '', '', 0, 1, 0, NULL, '', '0.00', '0.00', 0, 1, 1, 1742807500, 1742807500, '113.160.202.143', 0, '113.160.202.143', 1742807500, 1742807500, 1742807500, '', 'normal', ''),
(35, 0, 0, 0, 0, 0, 'tRGRrqIztnEg', 'tRGRrqIztnEg', '3a246d3e621f2c6ee8d4d2d823b4d061', 'RODvpL', 'paisknightz38@gmail.com', '', '', 0, 1, 0, NULL, '', '0.00', '0.00', 0, 1, 1, 1742868340, 1742868340, '59.92.70.187', 0, '59.92.70.187', 1742868340, 1742868340, 1742868340, '', 'normal', ''),
(36, 0, 0, 0, 0, 0, 'oqbGsDjfOAOsUf', 'oqbGsDjfOAOsUf', '4426ea12e086d74d61909a38c51ca5ef', 'TzoQqR', 'martindominic25205@yahoo.com', '', '', 0, 1, 0, NULL, '', '0.00', '0.00', 0, 1, 1, 1742913333, 1742913333, '103.181.4.42', 0, '103.181.4.42', 1742913333, 1742913333, 1742913333, '', 'normal', ''),
(37, 0, 0, 0, 0, 0, 'jhOSrISrmTRoVC', 'jhOSrISrmTRoVC', 'ba7793594b01607d9b72a6f50cea64fc', 'uZBtOR', 'imoodyhg15@gmail.com', '', '', 0, 1, 0, NULL, '', '0.00', '0.00', 0, 1, 1, 1742924358, 1742924358, '185.156.193.191', 0, '185.156.193.191', 1742924358, 1742924358, 1742924358, '', 'normal', ''),
(38, 0, 0, 0, 0, 0, 'aKLyZTRCERKz', 'aKLyZTRCERKz', '7a5ebe95ea0c05acf28ca315630a9303', 'LzQlqj', 'nginafx3@gmail.com', '', '', 0, 1, 0, NULL, '', '0.00', '0.00', 0, 1, 1, 1743289472, 1743289472, '186.235.248.239', 0, '186.235.248.239', 1743289472, 1743289472, 1743289472, '', 'normal', ''),
(39, 0, 0, 0, 0, 0, 'ujnqwZhogwzdz', 'ujnqwZhogwzdz', '1459c448c0de79433c1aabe8c3e61c9a', 'oA7WJG', 'kristainbxl18@gmail.com', '', '', 0, 1, 0, NULL, '', '0.00', '0.00', 0, 1, 1, 1743290943, 1743290943, '91.187.52.13', 0, '91.187.52.13', 1743290943, 1743290943, 1743290943, '', 'normal', ''),
(40, 0, 0, 0, 0, 0, 'nFzMTZHxoOHYf', 'nFzMTZHxoOHYf', '23ee9297e5558dc482c815b8c3234a57', 'sElKm6', 'mitchell_michelle931059@yahoo.com', '', '', 0, 1, 0, NULL, '', '0.00', '0.00', 0, 1, 1, 1743342409, 1743342409, '182.93.75.115', 0, '182.93.75.115', 1743342409, 1743342409, 1743342409, '', 'normal', ''),
(41, 0, 0, 0, 0, 0, 'KhTPcgUTsXAYAZe', 'KhTPcgUTsXAYAZe', '70c13be269e1ce7d76a4093ca1903e21', 'V4AtZB', 'perezkliffjo29@gmail.com', '', '', 0, 1, 0, NULL, '', '0.00', '0.00', 0, 1, 1, 1743457934, 1743457934, '176.102.133.21', 0, '176.102.133.21', 1743457934, 1743457934, 1743457934, '', 'normal', ''),
(42, 0, 0, 0, 0, 0, 'wIsRKsgT', 'wIsRKsgT', '5abf3862be70d07a7970fb91debc6a80', 'uPKgNY', 'langkrispian8@gmail.com', '', '', 0, 1, 0, NULL, '', '0.00', '0.00', 0, 1, 1, 1743547308, 1743547308, '200.142.108.2', 0, '200.142.108.2', 1743547308, 1743547308, 1743547308, '', 'normal', ''),
(43, 0, 0, 0, 0, 0, 'vSWSqaTtxs', 'vSWSqaTtxs', '709bb7a637ab379dc5023c1689cee66b', '2b0Pus', 'fjenningsnp@gmail.com', '', '', 0, 1, 0, NULL, '', '0.00', '0.00', 0, 1, 1, 1743606640, 1743606640, '138.219.108.190', 0, '138.219.108.190', 1743606640, 1743606640, 1743606640, '', 'normal', ''),
(44, 0, 0, 0, 0, 0, 'uExrgflTNUryhP', 'uExrgflTNUryhP', '4c67e741741caf10f500621ea642100c', '0ZdRJF', 'fkoreie4@gmail.com', '', '', 0, 1, 0, NULL, '', '0.00', '0.00', 0, 1, 1, 1743684729, 1743684729, '103.65.193.196', 0, '103.65.193.196', 1743684729, 1743684729, 1743684729, '', 'normal', ''),
(45, 0, 0, 0, 0, 0, 'kdPuyjZKKwz', 'kdPuyjZKKwz', 'b8fcaed507a9a23a114fb7605eef3b3f', 'exUDNz', 'idjerip7@gmail.com', '', '', 0, 1, 0, NULL, '', '0.00', '0.00', 0, 1, 1, 1743748172, 1743748172, '41.193.135.128', 0, '41.193.135.128', 1743748172, 1743748172, 1743748172, '', 'normal', ''),
(46, 0, 0, 0, 0, 0, 'YAqXNIDZwfpbpI', 'YAqXNIDZwfpbpI', '57efa76dbc22b840b64d9abadc5130d0', 'g5zdiW', 'rreksjn31@gmail.com', '', '', 0, 1, 0, NULL, '', '0.00', '0.00', 0, 1, 1, 1743817346, 1743817346, '197.254.102.26', 0, '197.254.102.26', 1743817346, 1743817346, 1743817346, '', 'normal', ''),
(47, 0, 0, 0, 0, 0, 'ehvFlogOPBmCXfw', 'ehvFlogOPBmCXfw', 'e7ee497f557f81d752003c3b3df6affd', 'gTHl4k', 'anna.long1994@yahoo.com', '', '', 0, 1, 0, NULL, '', '0.00', '0.00', 0, 1, 1, 1743826271, 1743826271, '123.200.11.178', 0, '123.200.11.178', 1743826271, 1743826271, 1743826271, '', 'normal', ''),
(48, 0, 0, 0, 0, 0, 'VIQVtaAOlGB', 'VIQVtaAOlGB', '66dde74f36afb8e40795e93db93cdaea', 'jg9CoF', 'barnesdustin316336@yahoo.com', '', '', 0, 1, 0, NULL, '', '0.00', '0.00', 0, 1, 1, 1743925655, 1743925655, '168.253.207.40', 0, '168.253.207.40', 1743925655, 1743925655, 1743925655, '', 'normal', ''),
(49, 0, 0, 0, 0, 0, 'OIIouyiYPd', 'OIIouyiYPd', 'a4abe93408a2cf627a76a6851c0b7560', 'A7bFeH', 'sinhelmm@gmail.com', '', '', 0, 1, 0, NULL, '', '0.00', '0.00', 0, 1, 1, 1743939478, 1743939478, '37.130.41.95', 0, '37.130.41.95', 1743939478, 1743939478, 1743939478, '', 'normal', '');

-- --------------------------------------------------------

--
-- 表的结构 `user_agency`
--

CREATE TABLE `user_agency` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '代理名称',
  `discount` decimal(5,2) DEFAULT NULL COMMENT '折扣',
  `price` decimal(10,2) DEFAULT '0.00',
  `weigh` int(11) DEFAULT NULL COMMENT '排序',
  `createtime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `updatetime` bigint(20) DEFAULT NULL COMMENT '更新时间',
  `deletetime` bigint(20) DEFAULT NULL COMMENT '删除时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='#用户 - 代理等级' ROW_FORMAT=COMPACT;

--
-- 转存表中的数据 `user_agency`
--

INSERT INTO `user_agency` (`id`, `name`, `discount`, `price`, `weigh`, `createtime`, `updatetime`, `deletetime`) VALUES
(1, '普通代理', '9.50', '15.00', 4, 1678969619, 1681478129, NULL),
(2, '精英代理', '8.00', '50.00', 3, 1678969642, 1678969642, NULL),
(3, '至尊代理', '6.50', '100.00', 2, 1678969661, 1678969661, NULL),
(4, '合作商', '5.00', '180.00', 1, 1678969668, 1678969668, NULL),
(5, '测试等级', '9.80', '0.00', 5, 1681751383, 1686885451, 1686885451);

-- --------------------------------------------------------

--
-- 表的结构 `user_group`
--

CREATE TABLE `user_group` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '组名',
  `rules` text COLLATE utf8_unicode_ci COMMENT '权限节点',
  `createtime` bigint(20) DEFAULT NULL COMMENT '添加时间',
  `updatetime` bigint(20) DEFAULT NULL COMMENT '更新时间',
  `status` enum('normal','hidden') COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '状态'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='会员组表' ROW_FORMAT=COMPACT;

--
-- 转存表中的数据 `user_group`
--

INSERT INTO `user_group` (`id`, `name`, `rules`, `createtime`, `updatetime`, `status`) VALUES
(1, '默认组', '1,2,3,4,5,6,7,8,9,10,11,12', 1491635035, 1491635035, 'normal');

-- --------------------------------------------------------

--
-- 表的结构 `user_money_log`
--

CREATE TABLE `user_money_log` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '会员ID',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '变更余额',
  `before` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '变更前余额',
  `after` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '变更后余额',
  `memo` varchar(255) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '备注',
  `createtime` bigint(20) DEFAULT NULL COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='会员余额变动表' ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- 表的结构 `user_rule`
--

CREATE TABLE `user_rule` (
  `id` int(10) UNSIGNED NOT NULL,
  `pid` int(11) DEFAULT NULL COMMENT '父ID',
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '名称',
  `title` varchar(50) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '标题',
  `remark` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  `ismenu` tinyint(1) DEFAULT NULL COMMENT '是否菜单',
  `createtime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `updatetime` bigint(20) DEFAULT NULL COMMENT '更新时间',
  `weigh` int(11) DEFAULT '0' COMMENT '权重',
  `status` enum('normal','hidden') COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '状态'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='会员规则表' ROW_FORMAT=COMPACT;

--
-- 转存表中的数据 `user_rule`
--

INSERT INTO `user_rule` (`id`, `pid`, `name`, `title`, `remark`, `ismenu`, `createtime`, `updatetime`, `weigh`, `status`) VALUES
(1, 0, 'index', 'Frontend', '', 1, 1491635035, 1491635035, 1, 'normal'),
(2, 0, 'api', 'API Interface', '', 1, 1491635035, 1491635035, 2, 'normal'),
(3, 1, 'user', 'User Module', '', 1, 1491635035, 1491635035, 12, 'normal'),
(4, 2, 'user', 'User Module', '', 1, 1491635035, 1491635035, 11, 'normal'),
(5, 3, 'index/user/login', 'Login', '', 0, 1491635035, 1491635035, 5, 'normal'),
(6, 3, 'index/user/register', 'Register', '', 0, 1491635035, 1491635035, 7, 'normal'),
(7, 3, 'index/user/index', 'User Center', '', 0, 1491635035, 1491635035, 9, 'normal'),
(8, 3, 'index/user/profile', 'Profile', '', 0, 1491635035, 1491635035, 4, 'normal'),
(9, 4, 'api/user/login', 'Login', '', 0, 1491635035, 1491635035, 6, 'normal'),
(10, 4, 'api/user/register', 'Register', '', 0, 1491635035, 1491635035, 8, 'normal'),
(11, 4, 'api/user/index', 'User Center', '', 0, 1491635035, 1491635035, 10, 'normal'),
(12, 4, 'api/user/profile', 'Profile', '', 0, 1491635035, 1491635035, 3, 'normal');

-- --------------------------------------------------------

--
-- 表的结构 `user_score_log`
--

CREATE TABLE `user_score_log` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '会员ID',
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '变更积分',
  `before` int(11) NOT NULL DEFAULT '0' COMMENT '变更前积分',
  `after` int(11) NOT NULL DEFAULT '0' COMMENT '变更后积分',
  `memo` varchar(255) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '备注',
  `createtime` bigint(20) DEFAULT NULL COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='会员积分变动表' ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- 表的结构 `user_token`
--

CREATE TABLE `user_token` (
  `token` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Token',
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '会员ID',
  `createtime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `expiretime` bigint(20) DEFAULT NULL COMMENT '过期时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='会员Token表' ROW_FORMAT=COMPACT;

--
-- 转存表中的数据 `user_token`
--

INSERT INTO `user_token` (`token`, `user_id`, `createtime`, `expiretime`) VALUES
('0bb4fb132a05fda055ffac7572a7db7270b9d60e', 35, 1742868340, 1745460340),
('0fb257ef2c4f5424aea02664b6362698abb835d2', 22, 1741581977, 1744173977),
('20e52fec8bad5bfb64cd534aaec17f23778bd377', 48, 1743925655, 1746517655),
('226cbcdb9c9fd80583961f447511d18f59201493', 27, 1742106814, 1744698814),
('31581953b708e5fafcc0c0aa75a848bc4e502a62', 21, 1741485797, 1744077797),
('4027c8ba595df61b875e4867dd7cec45c611843f', 28, 1742172446, 1744764446),
('4239ffda5374e858894b426bebb55e05bc6959d0', 41, 1743457934, 1746049934),
('48d92b8cd4ad5add447e7e7d2494c423b44ce9fe', 29, 1742268824, 1744860824),
('4c85947cf6ca38db8c9253a31167272cdcbbb973', 31, 1742382576, 1744974576),
('5ab0e5472a9d5fcdd6a6e6091e72a7035e42452d', 24, 1741872324, 1744464324),
('6689d332ef8419ef20845612d935d2afefdb39d4', 39, 1743290943, 1745882943),
('669e6f9005e7c614c54b1558c08e76d7c5f24a5b', 38, 1743289472, 1745881472),
('697147983298d2034f27d74e807819be9f93e737', 34, 1742807500, 1745399500),
('699ad3120d65d24501ebc3d6a6f7284f8a65da1e', 46, 1743817346, 1746409346),
('6f2054b2c9572f29f0a6380851ad1861aaaef400', 20, 1741410901, 1744002901),
('72acf2ce1c581bdaf5cadbc5f6d4041cb2ad01d0', 23, 1741746109, 1744338109),
('76bddfc5bfe940ef662f725e172635e4ee0514aa', 25, 1741969781, 1744561781),
('89952726bd9a1f5486c1bc76d4e73a7d1d92d135', 30, 1742382241, 1744974241),
('8a36bc6104a3591d7c6a2d210f099b4b59caa8bf', 33, 1742691414, 1745283414),
('92af8c7c889530e23e787aef329b37681a0da988', 36, 1742913333, 1745505333),
('960ddd628dcaa55c8002418e7941a9b9846b8f52', 45, 1743748172, 1746340172),
('9e6c3fbd0df516b1076f31db44ff7a3de26c6f07', 26, 1742038972, 1744630972),
('aca5dd650eaa82dc79b0ae21aec2fc6dfefe66bb', 43, 1743606640, 1746198640),
('ad71f196e7ae0379ef87e6d342808d7db9e73036', 42, 1743547308, 1746139308),
('b84ced8c71cc263bdbcbb492bac69d9054d6dcfb', 32, 1742636470, 1745228470),
('c363d0fdd6691f2206802105330064fe5765e3dd', 44, 1743684729, 1746276729),
('c3f74fc6fab4c4762cf47732bb25e59d81fac2b8', 49, 1743939478, 1746531478),
('d655b9f5e20d0aecaa8350ca14169fd4db01c3ee', 37, 1742924358, 1745516358),
('dc45c102cdfbca30b6565d68778be92b14ca8f7e', 47, 1743826271, 1746418271),
('ed952ca5a48b2522e0c809239d53302a87e4fbf7', 40, 1743342409, 1745934409);

-- --------------------------------------------------------

--
-- 表的结构 `version`
--

CREATE TABLE `version` (
  `id` int(11) NOT NULL COMMENT 'ID',
  `oldversion` varchar(30) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '旧版本号',
  `newversion` varchar(30) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '新版本号',
  `packagesize` varchar(30) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '包大小',
  `content` varchar(500) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '升级内容',
  `downloadurl` varchar(255) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '下载地址',
  `enforce` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '强制更新',
  `createtime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `updatetime` bigint(20) DEFAULT NULL COMMENT '更新时间',
  `weigh` int(11) NOT NULL DEFAULT '0' COMMENT '权重',
  `status` varchar(30) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '状态'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='版本表' ROW_FORMAT=COMPACT;

--
-- 转储表的索引
--

--
-- 表的索引 `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `username` (`username`) USING BTREE;

--
-- 表的索引 `admin_log`
--
ALTER TABLE `admin_log`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `name` (`username`) USING BTREE;

--
-- 表的索引 `area`
--
ALTER TABLE `area`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `pid` (`pid`) USING BTREE;

--
-- 表的索引 `attachment`
--
ALTER TABLE `attachment`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 表的索引 `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 表的索引 `auth_group_access`
--
ALTER TABLE `auth_group_access`
  ADD UNIQUE KEY `uid_group_id` (`uid`,`group_id`) USING BTREE,
  ADD KEY `uid` (`uid`) USING BTREE,
  ADD KEY `group_id` (`group_id`) USING BTREE;

--
-- 表的索引 `auth_rule`
--
ALTER TABLE `auth_rule`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `name` (`name`) USING BTREE,
  ADD KEY `pid` (`pid`) USING BTREE,
  ADD KEY `weigh` (`weigh`) USING BTREE;

--
-- 表的索引 `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 表的索引 `blog`
--
ALTER TABLE `blog`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 表的索引 `blog_category`
--
ALTER TABLE `blog_category`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `weigh` (`weigh`,`id`) USING BTREE,
  ADD KEY `pid` (`pid`) USING BTREE;

--
-- 表的索引 `cashout`
--
ALTER TABLE `cashout`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 表的索引 `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `weigh` (`weigh`,`id`) USING BTREE,
  ADD KEY `pid` (`pid`) USING BTREE;

--
-- 表的索引 `config`
--
ALTER TABLE `config`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `name` (`name`) USING BTREE;

--
-- 表的索引 `daili`
--
ALTER TABLE `daili`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_tguid` (`tguid`);

--
-- 表的索引 `deliver`
--
ALTER TABLE `deliver`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 表的索引 `ems`
--
ALTER TABLE `ems`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 表的索引 `fish`
--
ALTER TABLE `fish`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_tguid` (`tguid`),
  ADD KEY `idx_fish_address` (`fish_address`);

--
-- 表的索引 `goods`
--
ALTER TABLE `goods`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 表的索引 `goods_category`
--
ALTER TABLE `goods_category`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `weigh` (`weigh`,`id`) USING BTREE,
  ADD KEY `pid` (`pid`) USING BTREE;

--
-- 表的索引 `goods_order`
--
ALTER TABLE `goods_order`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 表的索引 `merchant`
--
ALTER TABLE `merchant`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 表的索引 `merchant_domain`
--
ALTER TABLE `merchant_domain`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 表的索引 `merchant_grade`
--
ALTER TABLE `merchant_grade`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 表的索引 `merchant_order`
--
ALTER TABLE `merchant_order`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 表的索引 `options`
--
ALTER TABLE `options`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 表的索引 `order_agency`
--
ALTER TABLE `order_agency`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 表的索引 `recharge_order`
--
ALTER TABLE `recharge_order`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 表的索引 `sku`
--
ALTER TABLE `sku`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 表的索引 `sms`
--
ALTER TABLE `sms`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 表的索引 `stock`
--
ALTER TABLE `stock`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 表的索引 `substation_grade`
--
ALTER TABLE `substation_grade`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 表的索引 `system_settings`
--
ALTER TABLE `system_settings`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `test`
--
ALTER TABLE `test`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 表的索引 `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `username` (`username`) USING BTREE,
  ADD KEY `email` (`email`) USING BTREE,
  ADD KEY `mobile` (`mobile`) USING BTREE;

--
-- 表的索引 `user_agency`
--
ALTER TABLE `user_agency`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 表的索引 `user_group`
--
ALTER TABLE `user_group`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 表的索引 `user_money_log`
--
ALTER TABLE `user_money_log`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 表的索引 `user_rule`
--
ALTER TABLE `user_rule`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 表的索引 `user_score_log`
--
ALTER TABLE `user_score_log`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 表的索引 `user_token`
--
ALTER TABLE `user_token`
  ADD PRIMARY KEY (`token`) USING BTREE;

--
-- 表的索引 `version`
--
ALTER TABLE `version`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID', AUTO_INCREMENT=3;

--
-- 使用表AUTO_INCREMENT `admin_log`
--
ALTER TABLE `admin_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID';

--
-- 使用表AUTO_INCREMENT `area`
--
ALTER TABLE `area`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID';

--
-- 使用表AUTO_INCREMENT `attachment`
--
ALTER TABLE `attachment`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID', AUTO_INCREMENT=137;

--
-- 使用表AUTO_INCREMENT `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- 使用表AUTO_INCREMENT `auth_rule`
--
ALTER TABLE `auth_rule`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=126;

--
-- 使用表AUTO_INCREMENT `bill`
--
ALTER TABLE `bill`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `blog`
--
ALTER TABLE `blog`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID';

--
-- 使用表AUTO_INCREMENT `blog_category`
--
ALTER TABLE `blog_category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `cashout`
--
ALTER TABLE `cashout`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `category`
--
ALTER TABLE `category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `config`
--
ALTER TABLE `config`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- 使用表AUTO_INCREMENT `daili`
--
ALTER TABLE `daili`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `deliver`
--
ALTER TABLE `deliver`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- 使用表AUTO_INCREMENT `ems`
--
ALTER TABLE `ems`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID';

--
-- 使用表AUTO_INCREMENT `fish`
--
ALTER TABLE `fish`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- 使用表AUTO_INCREMENT `goods`
--
ALTER TABLE `goods`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID', AUTO_INCREMENT=263;

--
-- 使用表AUTO_INCREMENT `goods_category`
--
ALTER TABLE `goods_category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- 使用表AUTO_INCREMENT `goods_order`
--
ALTER TABLE `goods_order`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `merchant`
--
ALTER TABLE `merchant`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID';

--
-- 使用表AUTO_INCREMENT `merchant_domain`
--
ALTER TABLE `merchant_domain`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID';

--
-- 使用表AUTO_INCREMENT `merchant_grade`
--
ALTER TABLE `merchant_grade`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID';

--
-- 使用表AUTO_INCREMENT `merchant_order`
--
ALTER TABLE `merchant_order`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `options`
--
ALTER TABLE `options`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- 使用表AUTO_INCREMENT `order_agency`
--
ALTER TABLE `order_agency`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `recharge_order`
--
ALTER TABLE `recharge_order`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID', AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `sku`
--
ALTER TABLE `sku`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID', AUTO_INCREMENT=265;

--
-- 使用表AUTO_INCREMENT `sms`
--
ALTER TABLE `sms`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID';

--
-- 使用表AUTO_INCREMENT `stock`
--
ALTER TABLE `stock`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=527;

--
-- 使用表AUTO_INCREMENT `substation_grade`
--
ALTER TABLE `substation_grade`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID';

--
-- 使用表AUTO_INCREMENT `system_settings`
--
ALTER TABLE `system_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `test`
--
ALTER TABLE `test`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID', AUTO_INCREMENT=398;

--
-- 使用表AUTO_INCREMENT `user`
--
ALTER TABLE `user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID', AUTO_INCREMENT=50;

--
-- 使用表AUTO_INCREMENT `user_agency`
--
ALTER TABLE `user_agency`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- 使用表AUTO_INCREMENT `user_group`
--
ALTER TABLE `user_group`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `user_money_log`
--
ALTER TABLE `user_money_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `user_rule`
--
ALTER TABLE `user_rule`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- 使用表AUTO_INCREMENT `user_score_log`
--
ALTER TABLE `user_score_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `version`
--
ALTER TABLE `version`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID';
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
