--1、创建数据库
CREATE DATABASE `KnowledgeWarehouse` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

--2、创建表
CREATE TABLE `Category` (
  `id` smallint(6) unsigned NOT NULL auto_increment,
  `parent_id` smallint(6) unsigned  default 0 comment '父类ID',
  `category_name` varchar(128) NOT NULL comment '分类名称',
`order_id` smallint(6) unsigned  default 0 comment '排序id',
`create_time` datetime default NULL COMMENT'创建时间',
`update_time` datetime default NULL  COMMENT'更新时间',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table `article`(
`id` int unsigned not null auto_increment,
`category_id` smallint(6) unsigned not null comment '父类id',
`title` varchar(256) not null comment '文章标题',
`url` varchar(256) comment '文章url',
`source` varchar(256) comment '文章来源',
`author` varchar(25) comment '文章作者',
`content` text comment '文章内容',
`hits` int default 0 comment '阅读次数',
`add_man` varchar(25) comment '添加人',
`create_time` datetime default NULL COMMENT'创建时间',
`update_time` datetime default NULL  COMMENT'更新时间',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



create table `users`(
`id` int unsigned not null auto_increment,
 `user_name` varchar(32) not null comment '用户名',
`true_name` varchar(32) comment '真实姓名',
`password` varchar(256) comment '密码',
`email` varchar(128) comment '邮箱',
`create_time` datetime default NULL COMMENT'创建时间',
`update_time` datetime default NULL  COMMENT'更新时间',
  PRIMARY KEY  (`id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `menu` (
  `ID` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `MenuName` varchar(15) NOT NULL,
  `BkParentID` smallint(5) unsigned NOT NULL,
  `GnParentID` smallint(5) unsigned NOT NULL,
  `LinkUrl` varchar(80) DEFAULT NULL,
  `OrderID` smallint(5) unsigned NOT NULL DEFAULT '0',
  `IsShow` tinyint(1) NOT NULL DEFAULT '1',
  `Module` varchar(20) Default null,
  `Controller` varchar(20) DEFAULT NULL,
  `Action` varchar(20) DEFAULT NULL,
  `Param` varchar(20) default null,
  `AddTime` datetime DEFAULT NULL,
  `AddMan` varchar(15) DEFAULT 'Admin',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

CREATE TABLE `menu_action` (
  `ID` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `ActionName` varchar(15) DEFAULT NULL,
  `ParentID` smallint(5) unsigned DEFAULT NULL,
  `Controller` varchar(20) DEFAULT NULL,
  `Action` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

CREATE TABLE `menu_group` (
  `ID` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `GroupName` varchar(15) NOT NULL,
  `ParentID` smallint(5) unsigned DEFAULT NULL,
  `OrderID` smallint(5) unsigned NOT NULL DEFAULT '0',
  `IsShow` tinyint(1) NOT NULL DEFAULT '1',
  `AddTime` datetime DEFAULT NULL,
  `AddMan` varchar(15) DEFAULT 'Admin',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8;

