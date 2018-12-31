# Host: 127.0.0.1  (Version 5.7.19-log)
# Date: 2018-12-26 16:50:50
# Generator: MySQL-Front 6.0  (Build 2.20)


#
# Structure for table "hotelinfo"
#

DROP TABLE IF EXISTS `hotelinfo`;
CREATE TABLE `hotelinfo` (
  `ownername` varchar(32) NOT NULL DEFAULT '' COMMENT '房东姓名',
  `ownerphone` varchar(32) NOT NULL DEFAULT '' COMMENT '房东电话',
  `hotelid` int(11) NOT NULL AUTO_INCREMENT COMMENT '房屋编号，主键，自增',
  `hotelimage` varchar(32) DEFAULT NULL COMMENT '图片信息',
  `hotelprovince` varchar(32) NOT NULL DEFAULT '' COMMENT '省',
  `hotelcity` varchar(32) NOT NULL DEFAULT '' COMMENT '市',
  `favornum` int(11) NOT NULL DEFAULT '0' COMMENT '收藏数目',
  `hotelprice` int NOT NULL DEFAULT '0' COMMENT '价格',
  `hoteladdress` varchar(32) NOT NULL DEFAULT '' COMMENT '详细地址',
  PRIMARY KEY (`hotelId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "hotelinfo"
#


#
# Structure for table "myfavor"
#

DROP TABLE IF EXISTS `myfavor`;
CREATE TABLE `myfavor` (
  `useraccount` varchar(20) NOT NULL,
  `hotelid` varchar(20) NOT NULL,
  PRIMARY KEY (`useraccount`,`hotelid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "myfavor"
#


#
# Structure for table "userinfo"
#

DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE `userinfo` (
  `useraccount` varchar(20) NOT NULL COMMENT '用户的账号名称，主键',
  `userpass` varchar(32) NOT NULL COMMENT '用户密码',
  `role` tinyint(1) NOT NULL DEFAULT '1' COMMENT '用户权限：0表示管理员 1 表示用户',
  `name` varchar(10) NOT NULL DEFAULT '' COMMENT '用户名',
  `sex` varchar(5) NOT NULL DEFAULT '',
  `age` tinyint(2) DEFAULT '0',
  `phone` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`useraccount`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "userinfo"
#


#
# Structure for table "comment"
#

DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `commentid` int(11) NOT NULL AUTO_INCREMENT COMMENT '评论编号',
  `comment` varchar(40) NOT NULL DEFAULT '' COMMENT '评论的具体内容',
  `useraccount` varchar(20) NOT NULL DEFAULT '',
  `hotelid` int(11) NOT NULL,
  PRIMARY KEY (`commentid`),
  KEY `useraccount` (`useraccount`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`useraccount`) REFERENCES `userinfo` (`useraccount`),
  CONSTRAINT `comment_hofk_1` FOREIGN KEY (`hotelid`) REFERENCES `hotelinfo` (`hotelid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "comment"
#

