DROP TABLE IF EXISTS `lss_about`;

CREATE TABLE `lss_about` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `content` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO `lss_about` (`id`, `content`)
VALUES
	(1,'* 独立之精神\n* 自由之思想');


DROP TABLE IF EXISTS `lss_article`;

CREATE TABLE `lss_article` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT '',
  `tags` varchar(255) DEFAULT '',
  `createTime` datetime NOT NULL,
  `publishTime` datetime NOT NULL,
  `content` longtext NOT NULL,
  `isPublished` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO `lss_article` (`id`, `title`, `tags`, `createTime`, `publishTime`, `content`, `isPublished`)
VALUES
	(220,'欢迎来到WebLss Blog!','Blog','2018-01-02 16:05:45','2018-01-02 16:07:26','Enjoy ur self here!\n\n<!-- more -->\n\n```js\nconsole.log(\'Hello World!\')\n```',1);


DROP TABLE IF EXISTS `lss_rd_list`;

CREATE TABLE `lss_rd_list` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `author` varchar(255) NOT NULL DEFAULT '',
  `score` float NOT NULL,
  `url` varchar(255) NOT NULL DEFAULT '',
  `content` varchar(255) NOT NULL DEFAULT '',
  `yun_url` varchar(255) NOT NULL DEFAULT '',
  `yun_pass` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO `lss_rd_list` (`id`, `name`, `author`, `score`, `url`, `content`, `yun_url`, `yun_pass`)
VALUES
	(1,'哈利·波特','J.K.罗琳',5, 'http://baidu.com', 'hdsfkd但是分开但是开发', 'url', '123');


DROP TABLE IF EXISTS `lss_user`;

CREATE TABLE `lss_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user` varchar(255) NOT NULL DEFAULT '',
  `password` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO `lss_user` (`id`, `user`, `password`)
VALUES
	(1,'admin','e5d2a815230449badccf00bc67436696');

DROP TABLE IF EXISTS `lss_chat`;

CREATE TABLE `lss_chat` (
  `chid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '碎言id',
  `date` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发表时间',
  `content` text NOT NULL COMMENT '内容',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `is_delete` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`chid`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


