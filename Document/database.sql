
CREATE DATABASE `KnowledgeWarehouse` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;


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

create table `menu`(
`id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
`menu_type` tinyint(1) not null comment '菜单类型,1表示一级菜单,2表示二级菜单,3表示三级菜单',
`parent_id` smallint(5) not null comment '菜单父类id,一级菜单的父类id为0',
`menu_name` varchar(25) not null comment '菜单名称',
`module_name` varchar(30) comment '模块名称',
`controller_name` varchar(30) comment '控制器名称',
`action_name` varchar(30) comment '操作名称',
`param` varchar(100) comment '参数',
`link_url` varchar(200) comment '自定义URL',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP comment '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP comment '更新时间',
`order_id`smallint(5) unsigned NOT NULL DEFAULT '0'comment '排序号，越大越靠前',
`is_show` tinyint(1) NOT NULL DEFAULT ‘0’ comment '是否显示,0表示显示,1表示不显示',
primary key (`id`)

)
ENGINE=MyISAM  DEFAULT CHARSET=utf8;



CREATE TABLE `menu_action` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `action_name` varchar(15) DEFAULT NULL,
  `menu_id` smallint(5) unsigned DEFAULT NULL comment '归属的菜单id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;



