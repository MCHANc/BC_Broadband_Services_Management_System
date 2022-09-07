/*
SQLyog Ultimate v12.4.3 (64 bit)
MySQL - 5.7.25-log : Database - manager
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`manager` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `manager`;

/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `adminId` int(10) NOT NULL AUTO_INCREMENT,
  `adminName` varchar(10) NOT NULL,
  `adminPwd` varchar(12) NOT NULL,
  `level` int(10) NOT NULL DEFAULT '1',
  PRIMARY KEY (`adminId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `admin` */

insert  into `admin`(`adminId`,`adminName`,`adminPwd`,`level`) values 
(2,'chan','123',1);

/*Table structure for table `bill` */

DROP TABLE IF EXISTS `bill`;

CREATE TABLE `bill` (
  `biiId` int(20) NOT NULL AUTO_INCREMENT,
  `paymentDate` varchar(255) NOT NULL,
  `price` double(11,2) NOT NULL,
  PRIMARY KEY (`biiId`,`paymentDate`,`price`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `bill` */

insert  into `bill`(`biiId`,`paymentDate`,`price`) values 
(1,'2022-06-12',600.00),
(2,'2022-06-12',50.00),
(3,'2022-06-12',600.00),
(4,'2022-06-12',600.00),
(5,'2022-06-12',50.00);

/*Table structure for table `customer` */

DROP TABLE IF EXISTS `customer`;

CREATE TABLE `customer` (
  `customerId` varchar(20) NOT NULL,
  `customerName` varchar(20) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `dorm` varchar(20) NOT NULL,
  `type` varchar(20) NOT NULL,
  PRIMARY KEY (`customerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `customer` */

insert  into `customer`(`customerId`,`customerName`,`phone`,`dorm`,`type`) values 
('123','小陈','123456','939','包年'),
('456','小明','456789','938','包月'),
('789','张三','789','111','包月');

/*Table structure for table `myorder` */

DROP TABLE IF EXISTS `myorder`;

CREATE TABLE `myorder` (
  `orderId` varchar(255) NOT NULL,
  `paymentDate` varchar(255) NOT NULL,
  `expireDate` varchar(255) NOT NULL,
  `price` double(11,2) NOT NULL,
  `director` varchar(255) NOT NULL,
  `customerId` varchar(255) NOT NULL,
  PRIMARY KEY (`orderId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `myorder` */

insert  into `myorder`(`orderId`,`paymentDate`,`expireDate`,`price`,`director`,`customerId`) values 
('0612044340','2022-06-12','2024-06-12',1200.00,'chan','123'),
('0612045903','2022-06-12','2022-07-12',50.00,'chan','456'),
('0612065812','2022-06-12','2022-07-12',50.00,'chan','789');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `userId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userName` varchar(10) NOT NULL,
  `userPwd` varchar(12) NOT NULL,
  `ban` varchar(10) NOT NULL DEFAULT '开启',
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`userId`,`userName`,`userPwd`,`ban`) values 
(9,'123','123','开启'),
(10,'1','123','开启');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
