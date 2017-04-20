# Host: localhost  (Version: 5.5.22)
# Date: 2017-04-07 23:08:07
# Generator: MySQL-Front 5.3  (Build 4.9)

/*!40101 SET NAMES utf8 */;

#
# Source for table "category"
#

DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `cid` char(32) NOT NULL,
  `cname` varchar(100) NOT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

#
# Data for table "category"
#

INSERT INTO `category` VALUES ('1','JavaSE'),('2','JavaEE'),('3','Javascript');

#
# Source for table "book"
#

DROP TABLE IF EXISTS `book`;
CREATE TABLE `book` (
  `bid` char(32) NOT NULL,
  `bname` varchar(100) DEFAULT NULL,
  `price` decimal(5,1) DEFAULT NULL,
  `author` varchar(20) DEFAULT NULL,
  `image` varchar(200) DEFAULT NULL,
  `cid` char(32) DEFAULT NULL,
  `del` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`bid`),
  KEY `cid` (`cid`),
  CONSTRAINT `book_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `category` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

#
# Data for table "book"
#

INSERT INTO `book` VALUES ('1','Java编程思想（第4版）',75.6,'[美] Bruce Eckel','book_img/9317290-1_l.jpg','1',0),('2','Java核心技术卷1',68.5,'Cay S. Horstmann','book_img/20285763-1_l.jpg','1',0),('3','Java就业培训教程',39.9,'asd','book_img/8758723-1_l.jpg','1',0),('4','Head First java',47.5,'（美）塞若','book_img/9265169-1_l.jpg','1',0),('5','JavaWeb开发详解',83.3,'孙鑫','book_img/22788412-1_l.jpg','2',0),('6','Struts2深入详解',63.8,'孙鑫','book_img/20385925-1_l.jpg','2',0),('7','精通Hibernate',30.0,'孙卫琴','book_img/8991366-1_l.jpg','2',0),('8','精通Spring2.x',63.2,'陈华雄','book_img/20029394-1_l.jpg','2',0),('9','Javascript权威指南',93.6,'（美）弗兰纳根','book_img/22722790-1_l.jpg','3',0);

#
# Source for table "orderitem"
#

DROP TABLE IF EXISTS `orderitem`;
CREATE TABLE `orderitem` (
  `iid` char(32) NOT NULL,
  `count` int(11) DEFAULT NULL,
  `subtotal` decimal(10,2) DEFAULT NULL,
  `oid` char(32) DEFAULT NULL,
  `bid` char(32) DEFAULT NULL,
  PRIMARY KEY (`iid`),
  KEY `oid` (`oid`),
  KEY `bid` (`bid`),
  CONSTRAINT `orderitem_ibfk_1` FOREIGN KEY (`oid`) REFERENCES `orders` (`oid`),
  CONSTRAINT `orderitem_ibfk_2` FOREIGN KEY (`bid`) REFERENCES `book` (`bid`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

#
# Data for table "orderitem"
#

INSERT INTO `orderitem` VALUES ('037E7891B89F423BB4DFA62EDCCDCE8C',1,75.60,'39F32461D1F74B42B2919F9C7D052DFB','1'),('08CA806838F44035B8609216E87287D2',2,127.60,'79CC3B67980A4E55B737D7615F0C2157','6'),('33CFC90DD8454F2187C8BDAA4210F57A',1,93.60,'7FF4BC3F052447D3854BC9C8196F57D1','9'),('6B55783F9CC94136991D734DB212200B',2,79.80,'79CC3B67980A4E55B737D7615F0C2157','3'),('70EEB6A52705433F87B709C8E053DD01',2,60.00,'C2BE6459C3ED41F78B8B54967814804B','7'),('96BCD2FF6C6C4B869F0FC50729369DFB',2,137.00,'79CC3B67980A4E55B737D7615F0C2157','2'),('AE8AD060E58042B394FA11977CC27FB9',4,252.80,'C2BE6459C3ED41F78B8B54967814804B','8');

#
# Source for table "tb_user"
#

DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `uid` char(32) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `code` char(64) NOT NULL,
  `state` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

#
# Data for table "tb_user"
#

INSERT INTO `tb_user` VALUES ('88125C58197E4E14BD6675079B1D619D','sss','123','1255039740@qq.com','E0B5712BA6C2486099DE9377D97FE99649CD9095417740A3BB04EACC6B79F6E8',0),('CF1AFB761E8241A7BEB483E06E2A5717','sjw','123','871123091@qq.com','5DF39BAA174C44A8B595191092253EA28256CEFE88724F68A9870734695A4C56',1);

#
# Source for table "orders"
#

DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `oid` char(32) NOT NULL,
  `ordertime` datetime DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `state` smallint(1) DEFAULT NULL,
  `uid` char(32) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`oid`),
  KEY `uid` (`uid`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `tb_user` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

#
# Data for table "orders"
#

INSERT INTO `orders` VALUES ('39F32461D1F74B42B2919F9C7D052DFB','2017-03-24 00:22:49',75.60,2,'CF1AFB761E8241A7BEB483E06E2A5717',NULL),('79CC3B67980A4E55B737D7615F0C2157','2017-03-24 00:23:20',344.40,4,'CF1AFB761E8241A7BEB483E06E2A5717',NULL),('7FF4BC3F052447D3854BC9C8196F57D1','2017-03-24 00:26:27',93.60,4,'CF1AFB761E8241A7BEB483E06E2A5717',NULL),('C2BE6459C3ED41F78B8B54967814804B','2017-03-24 00:23:46',312.80,1,'CF1AFB761E8241A7BEB483E06E2A5717',NULL);
