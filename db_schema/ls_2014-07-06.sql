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

# Dump of table ls_user_location
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ls_user_location`;

CREATE TABLE `ls_user_location` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,ls_city
  `user_id` int(11) unsigned NOT NULL,
  `city_id` int(11) unsigned NOT NULL,
  `location_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKCCBB20F17DC122B5` (`user_id`),
  KEY `city_id` (`city_id`),
  CONSTRAINT `ls_user_location_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `ls_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ls_user_location_ibfk_2` FOREIGN KEY (`city_id`) REFERENCES `ls_city` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=gbk;



DROP TABLE IF EXISTS `ls_problem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ls_problem` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

DROP TABLE IF EXISTS `ls_company_problem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ls_company_problem` (
  `id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `problem_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK6A2D4E258B150249` (`problem_id`),
  CONSTRAINT `FK6A2D4E258B150249` FOREIGN KEY (`problem_id`) REFERENCES `ls_problem` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
