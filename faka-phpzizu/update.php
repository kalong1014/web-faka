<?php
include './includes/common.php';
@header('Content-Type:text/html;charset=utf8');
$DB->query('DROP TABLE IF EXISTS `shua_gonggao`;'); //新建数据表
$DB->query('CREATE TABLE `shua_gonggao`(
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` TEXT CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `body` TEXT CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `look` INT NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;');
$DB->query('ALTER TABLE `shua_tools` ADD `shopimg` TEXT NOT NULL AFTER `active`; ');
$DB->close();
@unlink(__FILE__);
header('Location:./');
exit();