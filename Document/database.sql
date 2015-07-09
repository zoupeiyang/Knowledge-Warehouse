
CREATE DATABASE `KnowledgeWarehouse` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;


CREATE TABLE `Category` (
  `id` smallint(6) unsigned NOT NULL auto_increment,
  `parent_id` smallint(6) unsigned  default 0 comment '����ID',
  `category_name` varchar(128) NOT NULL comment '��������',
`order_id` smallint(6) unsigned  default 0 comment '����id',
`create_time` datetime default NULL COMMENT'����ʱ��',
`update_time` datetime default NULL  COMMENT'����ʱ��',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table `article`(
`id` int unsigned not null auto_increment,
`category_id` smallint(6) unsigned not null comment '����id',
`title` varchar(256) not null comment '���±���',
`url` varchar(256) comment '����url',
`source` varchar(256) comment '������Դ',
`author` varchar(25) comment '��������',
`content` text comment '��������',
`hits` int default 0 comment '�Ķ�����',
`add_man` varchar(25) comment '�����',
`create_time` datetime default NULL COMMENT'����ʱ��',
`update_time` datetime default NULL  COMMENT'����ʱ��',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



create table `users`(
`id` int unsigned not null auto_increment,
 `user_name` varchar(32) not null comment '�û���',
`true_name` varchar(32) comment '��ʵ����',
`password` varchar(256) comment '����',
`email` varchar(128) comment '����',
`create_time` datetime default NULL COMMENT'����ʱ��',
`update_time` datetime default NULL  COMMENT'����ʱ��',
  PRIMARY KEY  (`id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table `menu`(
`id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
`menu_type` tinyint(1) not null comment '�˵�����,1��ʾһ���˵�,2��ʾ�����˵�,3��ʾ�����˵�',
`parent_id` smallint(5) not null comment '�˵�����id,һ���˵��ĸ���idΪ0',
`menu_name` varchar(25) not null comment '�˵�����',
`module_name` varchar(30) comment 'ģ������',
`controller_name` varchar(30) comment '����������',
`action_name` varchar(30) comment '��������',
`param` varchar(100) comment '����',
`link_url` varchar(200) comment '�Զ���URL',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP comment '����ʱ��',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP comment '����ʱ��',
`order_id`smallint(5) unsigned NOT NULL DEFAULT '0'comment '����ţ�Խ��Խ��ǰ',
`is_show` tinyint(1) NOT NULL DEFAULT ��0�� comment '�Ƿ���ʾ,0��ʾ��ʾ,1��ʾ����ʾ',
primary key (`id`)

)
ENGINE=MyISAM  DEFAULT CHARSET=utf8;



CREATE TABLE `menu_action` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `action_name` varchar(15) DEFAULT NULL,
  `menu_id` smallint(5) unsigned DEFAULT NULL comment '�����Ĳ˵�id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;



