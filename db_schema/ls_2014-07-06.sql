# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.6.13)
# Database: ls
# Generation Time: 2014-07-06 12:18:41 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table ls_city
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ls_city`;

CREATE TABLE `ls_city` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL DEFAULT '',
  `province_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

LOCK TABLES `ls_city` WRITE;
/*!40000 ALTER TABLE `ls_city` DISABLE KEYS */;

INSERT INTO `ls_city` (`id`, `name`, `province_id`)
VALUES
	(1,'苏州',1),
	(2,'南京',1),
	(3,'无锡',1),
	(4,'常州',1),
	(5,'徐州',1),
	(6,'南通',1),
	(7,'扬州',1),
	(8,'盐城',1),
	(9,'淮安',1),
	(10,'连云港',1),
	(11,'泰州',1),
	(12,'宿迁',1),
	(13,'镇江',1),
	(14,'沭阳',1),
	(15,'大丰',1);

/*!40000 ALTER TABLE `ls_city` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ls_city_url
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ls_city_url`;

CREATE TABLE `ls_city_url` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `url` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;



# Dump of table ls_company
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ls_company`;

CREATE TABLE `ls_company` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `contactor` varchar(100) DEFAULT NULL,
  `email` varchar(11) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` varchar(600) DEFAULT NULL,
  `email_src` varchar(200) DEFAULT NULL,
  `phone_src` varchar(200) DEFAULT NULL,
  `is_tracked` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

LOCK TABLES `ls_company` WRITE;
/*!40000 ALTER TABLE `ls_company` DISABLE KEYS */;

INSERT INTO `ls_company` (`id`, `name`, `contactor`, `email`, `phone`, `address`, `email_src`, `phone_src`, `is_tracked`)
VALUES
	(1,'苹果公司','乔布斯',NULL,NULL,'开江二路','20140619171109677.jpg','20140619171109677.jpg',0),
	(2,'急急急','快快快',NULL,NULL,'快快快快快快快快快','20140619171109677.jpg','20140619171109677.jpg',0),
	(3,'????????????','???',NULL,NULL,'??????38?','20140702231738313','20140702231733075',NULL),
	(4,'??????????????????','??',NULL,NULL,'???528??????2?','20140702231749288','20140702231744154',NULL),
	(5,'?????????','???',NULL,NULL,'?????????????????','20140702231759937','20140702231754800',NULL);

/*!40000 ALTER TABLE `ls_company` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ls_company_resource
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ls_company_resource`;

CREATE TABLE `ls_company_resource` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(500) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `grab_count` int(11) DEFAULT NULL,
  `grab_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;



# Dump of table ls_group
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ls_group`;

CREATE TABLE `ls_group` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;



# Dump of table ls_job
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ls_job`;

CREATE TABLE `ls_job` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `interval` int(11) DEFAULT NULL COMMENT 'seconds',
  `grab_url` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;



# Dump of table ls_job_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ls_job_log`;

CREATE TABLE `ls_job_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT 'start by user',
  `job_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;



# Dump of table ls_location
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ls_location`;

CREATE TABLE `ls_location` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;



# Dump of table ls_province
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ls_province`;

CREATE TABLE `ls_province` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

LOCK TABLES `ls_province` WRITE;
/*!40000 ALTER TABLE `ls_province` DISABLE KEYS */;

INSERT INTO `ls_province` (`id`, `name`)
VALUES
	(1,'江苏'),
	(2,'浙江'),
	(3,'安徽'),
	(4,'上海');

/*!40000 ALTER TABLE `ls_province` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ls_track_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ls_track_log`;

CREATE TABLE `ls_track_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `star` int(11) DEFAULT NULL,
  `comments` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;



# Dump of table ls_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ls_user`;

CREATE TABLE `ls_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `username` varchar(200) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

LOCK TABLES `ls_user` WRITE;
/*!40000 ALTER TABLE `ls_user` DISABLE KEYS */;

INSERT INTO `ls_user` (`id`, `name`, `username`, `password`)
VALUES
	(1,'江李明','jiangliming','jiangliming'),
	(2,'???','gaolonglong','123');

/*!40000 ALTER TABLE `ls_user` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ls_user_location
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ls_user_location`;

CREATE TABLE `ls_user_location` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `city_id` int(11) unsigned NOT NULL,
  `location_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKCCBB20F17DC122B5` (`user_id`),
  KEY `city_id` (`city_id`),
  CONSTRAINT `ls_user_location_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `ls_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ls_user_location_ibfk_2` FOREIGN KEY (`city_id`) REFERENCES `ls_city` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

LOCK TABLES `ls_user_location` WRITE;
/*!40000 ALTER TABLE `ls_user_location` DISABLE KEYS */;

INSERT INTO `ls_user_location` (`id`, `user_id`, `city_id`, `location_id`)
VALUES
	(1,1,1,0),
	(2,1,2,0),
	(3,1,3,0),
	(4,1,4,0),
	(5,1,5,0),
	(6,1,6,0),
	(7,1,7,0),
	(8,1,8,0),
	(9,1,9,0);

/*!40000 ALTER TABLE `ls_user_location` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table t_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `t_user`;

CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account` (`account`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
