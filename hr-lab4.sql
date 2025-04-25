-- MySQL dump 10.13  Distrib 8.0.15, for macos10.14 (x86_64)
--
-- Host: 192.168.152.137    Database: hr
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

DROP DATABASE IF EXISTS `hr`;
CREATE DATABASE  IF NOT EXISTS `hr`;
USE `hr`;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `countries` (
  `country_id` char(2) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `country_name` varchar(40) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `region_id` decimal(22,0) DEFAULT NULL,
  PRIMARY KEY (`country_id`),
  KEY `countr_reg_fk` (`region_id`),
  CONSTRAINT `countr_reg_fk` FOREIGN KEY (`region_id`) REFERENCES `regions` (`region_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES ('AR','Argentina',2),('AU','Australia',3),('BE','Belgium',1),('BR','Brazil',2),('CA','Canada',2),('CH','Switzerland',1),('CN','China',3),('DE','Germany',1),('DK','Denmark',1),('EG','Egypt',4),('FR','France',1),('HK','HongKong',3),('IL','Israel',4),('IN','India',3),('IT','Italy',1),('JP','Japan',3),('KW','Kuwait',4),('MX','Mexico',2),('NG','Nigeria',4),('NL','Netherlands',1),('SG','Singapore',3),('UK','United Kingdom',1),('US','United States of America',2),('ZM','Zambia',4),('ZW','Zimbabwe',4);
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `departments` (
  `department_id` int(4) NOT NULL,
  `department_name` varchar(30) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `manager_id` int(6) DEFAULT NULL,
  `location_id` int(4) DEFAULT NULL,
  PRIMARY KEY (`department_id`),
  KEY `dept_location_ix` (`location_id`),
  KEY `dept_mgr_fk` (`manager_id`),
  CONSTRAINT `dept_loc_fk` FOREIGN KEY (`location_id`) REFERENCES `locations` (`location_id`),
  CONSTRAINT `dept_mgr_fk` FOREIGN KEY (`manager_id`) REFERENCES `employees` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (10,'Administration',200,1700),(20,'Marketing',201,1800),(30,'Purchasing',114,1700),(40,'Human Resources',203,2400),(50,'Shipping',121,1500),(60,'IT',103,1400),(70,'Public Relations',204,2700),(80,'Sales',145,2500),(90,'Executive',100,1700),(100,'Finance',108,1700),(110,'Accounting',205,1700),(120,'Treasury',NULL,1700),(130,'Corporate Tax',NULL,1700),(140,'Control And Credit',NULL,1700),(150,'Shareholder Services',NULL,1700),(160,'Benefits',NULL,1700),(170,'Manufacturing',NULL,1700),(180,'Construction',NULL,1700),(190,'Contracting',NULL,1700),(200,'Operations',NULL,1700),(210,'IT Support',NULL,1700),(220,'NOC',NULL,1700),(230,'IT Helpdesk',NULL,1700),(240,'Government Sales',NULL,1700),(250,'Retail Sales',NULL,1700),(260,'Recruiting',NULL,1700),(270,'Payroll',NULL,1700);
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `employees` (
  `employee_id` int(6) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(20) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `last_name` varchar(25) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `email` varchar(25) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `password` varchar(65) DEFAULT '$2a$10$nFKnvQ4h.jKhMyEN6LnEBOUTONuXCdJvzIKzYz.PVLpReP5G9NE96',
  `phone_number` varchar(20) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `hire_date` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `job_id` varchar(10) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `salary` decimal(8,2) DEFAULT NULL,
  `commission_pct` decimal(2,2) DEFAULT NULL,
  `manager_id` int(6) DEFAULT NULL,
  `department_id` int(4) DEFAULT NULL,
  `enabled` int(11) DEFAULT '0',
  PRIMARY KEY (`employee_id`),
  UNIQUE KEY `emp_email_uk` (`email`),
  KEY `emp_department_ix` (`department_id`),
  KEY `emp_job_ix` (`job_id`),
  KEY `emp_manager_ix` (`manager_id`),
  KEY `emp_name_ix` (`last_name`,`first_name`),
  KEY `emp_job_fk` (`job_id`),
  CONSTRAINT `emp_dept_fk` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`),
  CONSTRAINT `emp_job_fk` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`job_id`),
  CONSTRAINT `emp_manager_fk` FOREIGN KEY (`manager_id`) REFERENCES `employees` (`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=207 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (100,'Steven','King','sking@company.com','$2a$10$nFKnvQ4h.jKhMyEN6LnEBOUTONuXCdJvzIKzYz.PVLpReP5G9NE96','515.123.4560','1987-06-17 00:00:00','AD_PRES',24000.00,NULL,NULL,90,1),(101,'Neena','Kochhar','nkochhar@company.com','$2a$10$nFKnvQ4h.jKhMyEN6LnEBOUTONuXCdJvzIKzYz.PVLpReP5G9NE96','515.123.4568','1989-09-21 00:00:00','AD_VP',17000.00,NULL,100,90,1),(102,'Lex','De Haan','ldehaan@company.com','$2a$10$nFKnvQ4h.jKhMyEN6LnEBOUTONuXCdJvzIKzYz.PVLpReP5G9NE96','515.123.4569','1993-01-13 00:00:00','AD_VP',17000.00,NULL,100,90,1),(103,'Alexander','Hunold','ahunold@company.com','$2a$10$nFKnvQ4h.jKhMyEN6LnEBOUTONuXCdJvzIKzYz.PVLpReP5G9NE96','590.423.4567','1990-01-03 00:00:00','IT_PROG',9000.00,NULL,102,60,1),(104,'Bruce','Ernst','bernst@company.com','$2a$10$nFKnvQ4h.jKhMyEN6LnEBOUTONuXCdJvzIKzYz.PVLpReP5G9NE96','590.423.4568','1991-05-21 00:00:00','IT_PROG',6000.00,NULL,103,60,1),(105,'David','Austin','daustin@company.com','$2a$10$nFKnvQ4h.jKhMyEN6LnEBOUTONuXCdJvzIKzYz.PVLpReP5G9NE96','590.423.4569','1997-06-25 00:00:00','IT_PROG',4800.00,NULL,103,60,1),(106,'Valli','Pataballa','vpatabal@company.com','$2a$10$nFKnvQ4h.jKhMyEN6LnEBOUTONuXCdJvzIKzYz.PVLpReP5G9NE96','590.423.4560','1998-02-05 00:00:00','IT_PROG',4800.00,NULL,103,60,1),(107,'Diana','Lorentz','dlorentz@company.com','$2a$10$nFKnvQ4h.jKhMyEN6LnEBOUTONuXCdJvzIKzYz.PVLpReP5G9NE96','590.423.5567','1999-02-07 00:00:00','IT_PROG',4200.00,NULL,103,60,1),(108,'Nancy','Greenberg','ngreenbe@company.com','$2a$10$nFKnvQ4h.jKhMyEN6LnEBOUTONuXCdJvzIKzYz.PVLpReP5G9NE96','515.124.4569','1994-08-17 00:00:00','FI_MGR',12000.00,NULL,101,100,1),(109,'Daniel','Faviet','dfaviet@company.com','$2a$10$nFKnvQ4h.jKhMyEN6LnEBOUTONuXCdJvzIKzYz.PVLpReP5G9NE96','515.124.4169','1994-08-16 00:00:00','FI_ACCOUNT',9000.00,NULL,108,100,1),(110,'John','Chen','jchen@company.com','$2a$10$nFKnvQ4h.jKhMyEN6LnEBOUTONuXCdJvzIKzYz.PVLpReP5G9NE96','515.124.4269','1997-09-28 00:00:00','FI_ACCOUNT',8200.00,NULL,108,100,1),(111,'Ismael','Sciarra','isciarra@company.com','$2a$10$nFKnvQ4h.jKhMyEN6LnEBOUTONuXCdJvzIKzYz.PVLpReP5G9NE96','515.124.4369','1997-09-30 00:00:00','FI_ACCOUNT',7700.00,NULL,108,100,1),(112,'Jose Manuel','Urman','jmurman@company.com','$2a$10$nFKnvQ4h.jKhMyEN6LnEBOUTONuXCdJvzIKzYz.PVLpReP5G9NE96','515.124.4469','1998-03-07 00:00:00','FI_ACCOUNT',7800.00,NULL,108,100,1),(113,'Luis','Popp','lpopp@company.com','$2a$10$nFKnvQ4h.jKhMyEN6LnEBOUTONuXCdJvzIKzYz.PVLpReP5G9NE96','515.124.4567','1999-12-07 00:00:00','FI_ACCOUNT',6900.00,NULL,108,100,1),(114,'Den','Raphaely','drapheal@company.com','$2a$10$nFKnvQ4h.jKhMyEN6LnEBOUTONuXCdJvzIKzYz.PVLpReP5G9NE96','515.127.4561','1994-12-07 00:00:00','PU_MAN',11000.00,NULL,100,30,1),(115,'Alexander','Khoo','akhoo@company.com','$2a$10$nFKnvQ4h.jKhMyEN6LnEBOUTONuXCdJvzIKzYz.PVLpReP5G9NE96','515.127.4562','1995-05-18 00:00:00','PU_CLERK',3100.00,NULL,114,30,1),(116,'Shelli','Baida','sbaida@company.com','$2a$10$nFKnvQ4h.jKhMyEN6LnEBOUTONuXCdJvzIKzYz.PVLpReP5G9NE96','515.127.4563','1997-12-24 00:00:00','PU_CLERK',2900.00,NULL,114,30,1),(117,'Sigal','Tobias','stobias@company.com','$2a$10$nFKnvQ4h.jKhMyEN6LnEBOUTONuXCdJvzIKzYz.PVLpReP5G9NE96','515.127.4564','1997-07-24 00:00:00','PU_CLERK',2800.00,NULL,114,30,1),(118,'Guy','Himuro','ghimuro@company.com','$2a$10$nFKnvQ4h.jKhMyEN6LnEBOUTONuXCdJvzIKzYz.PVLpReP5G9NE96','515.127.4565','1998-11-15 00:00:00','PU_CLERK',2600.00,NULL,114,30,1),(119,'Karen','Colmenares','kcolmena@company.com','$2a$10$nFKnvQ4h.jKhMyEN6LnEBOUTONuXCdJvzIKzYz.PVLpReP5G9NE96','515.127.4566','1999-08-10 00:00:00','PU_CLERK',2500.00,NULL,114,30,1),(120,'Matthew','Weiss','mweiss@company.com','$2a$10$nFKnvQ4h.jKhMyEN6LnEBOUTONuXCdJvzIKzYz.PVLpReP5G9NE96','650.123.1234','1996-07-18 00:00:00','ST_MAN',8000.00,NULL,100,50,1),(121,'Adam','Fripp','afripp@company.com','$2a$10$nFKnvQ4h.jKhMyEN6LnEBOUTONuXCdJvzIKzYz.PVLpReP5G9NE96','650.123.2234','1997-04-10 00:00:00','ST_MAN',8200.00,NULL,100,50,1),(122,'Payam','Kaufling','pkauflin@company.com','$2a$10$nFKnvQ4h.jKhMyEN6LnEBOUTONuXCdJvzIKzYz.PVLpReP5G9NE96','650.123.3234','1995-05-01 00:00:00','ST_MAN',7900.00,NULL,100,50,1),(123,'Shanta','Vollman','svollman@company.com','$2a$10$nFKnvQ4h.jKhMyEN6LnEBOUTONuXCdJvzIKzYz.PVLpReP5G9NE96','650.123.4234','1997-10-10 00:00:00','ST_MAN',6500.00,NULL,100,50,1),(124,'Kevin','Mourgos','kmourgos@company.com','$2a$10$nFKnvQ4h.jKhMyEN6LnEBOUTONuXCdJvzIKzYz.PVLpReP5G9NE96','650.123.5234','1999-11-16 00:00:00','ST_MAN',5800.00,NULL,100,50,1),(125,'Julia','Nayer','jnayer@company.com','$2a$10$nFKnvQ4h.jKhMyEN6LnEBOUTONuXCdJvzIKzYz.PVLpReP5G9NE96','650.124.1214','1997-07-16 00:00:00','ST_CLERK',3200.00,NULL,120,50,1),(126,'Irene','Mikkilineni','imikkili@company.com','$2a$10$nFKnvQ4h.jKhMyEN6LnEBOUTONuXCdJvzIKzYz.PVLpReP5G9NE96','650.124.1224','1998-09-28 00:00:00','ST_CLERK',2700.00,NULL,120,50,1),(127,'James','Landry','jlandry@company.com','$2a$10$nFKnvQ4h.jKhMyEN6LnEBOUTONuXCdJvzIKzYz.PVLpReP5G9NE96','650.124.1334','1999-01-14 00:00:00','ST_CLERK',2400.00,NULL,120,50,1),(128,'Steven','Markle','smarkle@company.com','$2a$10$nFKnvQ4h.jKhMyEN6LnEBOUTONuXCdJvzIKzYz.PVLpReP5G9NE96','650.124.1434','2000-03-08 00:00:00','ST_CLERK',2200.00,NULL,120,50,1),(129,'Laura','Bissot','lbissot@company.com','$2a$10$nFKnvQ4h.jKhMyEN6LnEBOUTONuXCdJvzIKzYz.PVLpReP5G9NE96','650.124.5234','1997-08-20 00:00:00','ST_CLERK',3300.00,NULL,121,50,1),(130,'Mozhe','Atkinson','matkinso@company.com','$2a$10$nFKnvQ4h.jKhMyEN6LnEBOUTONuXCdJvzIKzYz.PVLpReP5G9NE96','650.124.6234','1997-10-30 00:00:00','ST_CLERK',2800.00,NULL,121,50,1),(131,'James','Marlow','jamrlow@company.com','$2a$10$nFKnvQ4h.jKhMyEN6LnEBOUTONuXCdJvzIKzYz.PVLpReP5G9NE96','650.124.7234','1997-02-16 00:00:00','ST_CLERK',2500.00,NULL,121,50,1),(132,'TJ','Olson','tjolson@company.com','$2a$10$nFKnvQ4h.jKhMyEN6LnEBOUTONuXCdJvzIKzYz.PVLpReP5G9NE96','650.124.8234','1999-04-10 00:00:00','ST_CLERK',2100.00,NULL,121,50,1),(133,'Jason','Mallin','jmallin@company.com','$2a$10$nFKnvQ4h.jKhMyEN6LnEBOUTONuXCdJvzIKzYz.PVLpReP5G9NE96','650.127.1934','1996-06-14 00:00:00','ST_CLERK',3300.00,NULL,122,50,1),(134,'Michael','Rogers','mrogers@company.com','$2a$10$nFKnvQ4h.jKhMyEN6LnEBOUTONuXCdJvzIKzYz.PVLpReP5G9NE96','650.127.1834','1998-08-26 00:00:00','ST_CLERK',2900.00,NULL,122,50,1),(135,'Ki','Gee','kgee@company.com','$2a$10$nFKnvQ4h.jKhMyEN6LnEBOUTONuXCdJvzIKzYz.PVLpReP5G9NE96','650.127.1734','1999-12-12 00:00:00','ST_CLERK',2400.00,NULL,122,50,1),(136,'Hazel','Philtanker','hphiltan@company.com','$2a$10$nFKnvQ4h.jKhMyEN6LnEBOUTONuXCdJvzIKzYz.PVLpReP5G9NE96','650.127.1634','2000-02-06 00:00:00','ST_CLERK',2200.00,NULL,122,50,1),(137,'Renske','Ladwig','rladwig@company.com','$2a$10$nFKnvQ4h.jKhMyEN6LnEBOUTONuXCdJvzIKzYz.PVLpReP5G9NE96','650.121.1234','1995-07-14 00:00:00','ST_CLERK',3600.00,NULL,123,50,1),(138,'Stephen','Stiles','sstiles@company.com','$2a$10$nFKnvQ4h.jKhMyEN6LnEBOUTONuXCdJvzIKzYz.PVLpReP5G9NE96','650.121.2034','1997-10-26 00:00:00','ST_CLERK',3200.00,NULL,123,50,1),(139,'John','Seo','jseo@company.com','$2a$10$nFKnvQ4h.jKhMyEN6LnEBOUTONuXCdJvzIKzYz.PVLpReP5G9NE96','650.121.2019','1998-02-12 00:00:00','ST_CLERK',2700.00,NULL,123,50,1),(140,'Joshua','Patel','jpatel@company.com','$2a$10$nFKnvQ4h.jKhMyEN6LnEBOUTONuXCdJvzIKzYz.PVLpReP5G9NE96','650.121.1834','1998-04-06 00:00:00','ST_CLERK',2500.00,NULL,123,50,1),(141,'Trenna','Rajs','trajs@company.com','$2a$10$nFKnvQ4h.jKhMyEN6LnEBOUTONuXCdJvzIKzYz.PVLpReP5G9NE96','650.121.8009','1995-10-17 00:00:00','ST_CLERK',3500.00,NULL,124,50,1),(142,'Curtis','Davies','cdavies@company.com','$2a$10$nFKnvQ4h.jKhMyEN6LnEBOUTONuXCdJvzIKzYz.PVLpReP5G9NE96','650.121.2994','1997-01-29 00:00:00','ST_CLERK',3100.00,NULL,124,50,1),(143,'Randall','Matos','rmatos@company.com','$2a$10$nFKnvQ4h.jKhMyEN6LnEBOUTONuXCdJvzIKzYz.PVLpReP5G9NE96','650.121.2874','1998-03-15 00:00:00','ST_CLERK',2600.00,NULL,124,50,1),(144,'Peter','Vargas','pvargas@company.com','$2a$10$nFKnvQ4h.jKhMyEN6LnEBOUTONuXCdJvzIKzYz.PVLpReP5G9NE96','650.121.2004','1998-07-09 00:00:00','ST_CLERK',2500.00,NULL,124,50,1),(145,'John','Russell','jrussel@company.com','$2a$10$nFKnvQ4h.jKhMyEN6LnEBOUTONuXCdJvzIKzYz.PVLpReP5G9NE96','011.44.1344.429268','1996-10-01 00:00:00','SA_MAN',14000.00,0.40,100,80,1),(146,'Karen','Partners','kpartner@company.com','$2a$10$nFKnvQ4h.jKhMyEN6LnEBOUTONuXCdJvzIKzYz.PVLpReP5G9NE96','011.44.1344.467268','1997-01-05 00:00:00','SA_MAN',13500.00,0.30,100,80,1),(147,'Alberto','Errazuriz','aerrazur@company.com','$2a$10$nFKnvQ4h.jKhMyEN6LnEBOUTONuXCdJvzIKzYz.PVLpReP5G9NE96','011.44.1344.429278','1997-03-10 00:00:00','SA_MAN',12000.00,0.30,100,80,1),(148,'Gerald','Cambrault','gcambrau@company.com','$2a$10$nFKnvQ4h.jKhMyEN6LnEBOUTONuXCdJvzIKzYz.PVLpReP5G9NE96','011.44.1344.619268','1999-10-15 00:00:00','SA_MAN',11000.00,0.30,100,80,1),(149,'Eleni','Zlotkey','ezlotkey@company.com','$2a$10$nFKnvQ4h.jKhMyEN6LnEBOUTONuXCdJvzIKzYz.PVLpReP5G9NE96','011.44.1344.429018','2000-01-29 00:00:00','SA_MAN',10500.00,0.20,100,80,1),(150,'Peter','Tucker','ptucker@company.com','$2a$10$nFKnvQ4h.jKhMyEN6LnEBOUTONuXCdJvzIKzYz.PVLpReP5G9NE96','011.44.1344.129268','1997-01-30 00:00:00','SA_REP',10000.00,0.30,145,80,1),(151,'David','Bernstein','dbernste@company.com','$2a$10$nFKnvQ4h.jKhMyEN6LnEBOUTONuXCdJvzIKzYz.PVLpReP5G9NE96','011.44.1344.345268','1997-03-24 00:00:00','SA_REP',9500.00,0.25,145,80,1),(152,'Peter','Hall','phall@company.com','$2a$10$nFKnvQ4h.jKhMyEN6LnEBOUTONuXCdJvzIKzYz.PVLpReP5G9NE96','011.44.1344.478968','1997-08-20 00:00:00','SA_REP',9000.00,0.25,145,80,1),(153,'Christopher','Olsen','colsen@company.com','$2a$10$nFKnvQ4h.jKhMyEN6LnEBOUTONuXCdJvzIKzYz.PVLpReP5G9NE96','011.44.1344.498718','1998-03-30 00:00:00','SA_REP',8000.00,0.20,145,80,1),(154,'Nanette','Cambrault','ncambrau@company.com','$2a$10$nFKnvQ4h.jKhMyEN6LnEBOUTONuXCdJvzIKzYz.PVLpReP5G9NE96','011.44.1344.987668','1998-12-09 00:00:00','SA_REP',7500.00,0.20,145,80,1),(155,'Oliver','Tuvault','otuvault@company.com','$2a$10$nFKnvQ4h.jKhMyEN6LnEBOUTONuXCdJvzIKzYz.PVLpReP5G9NE96','011.44.1344.486508','1999-11-23 00:00:00','SA_REP',7000.00,0.15,145,80,1),(156,'Janette','King','jking@company.com','$2a$10$nFKnvQ4h.jKhMyEN6LnEBOUTONuXCdJvzIKzYz.PVLpReP5G9NE96','011.44.1345.429268','1996-01-30 00:00:00','SA_REP',10000.00,0.35,146,80,1),(157,'Patrick','Sully','psully@company.com','$2a$10$nFKnvQ4h.jKhMyEN6LnEBOUTONuXCdJvzIKzYz.PVLpReP5G9NE96','011.44.1345.929268','1996-03-04 00:00:00','SA_REP',9500.00,0.35,146,80,1),(158,'Allan','McEwen','amcewen@company.com','$2a$10$nFKnvQ4h.jKhMyEN6LnEBOUTONuXCdJvzIKzYz.PVLpReP5G9NE96','011.44.1345.829268','1996-08-01 00:00:00','SA_REP',9000.00,0.35,146,80,1),(159,'Lindsey','Smith','lsmith@company.com','$2a$10$nFKnvQ4h.jKhMyEN6LnEBOUTONuXCdJvzIKzYz.PVLpReP5G9NE96','011.44.1345.729268','1997-03-10 00:00:00','SA_REP',8000.00,0.30,146,80,1),(160,'Louise','Doran','ldoran@company.com','$2a$10$nFKnvQ4h.jKhMyEN6LnEBOUTONuXCdJvzIKzYz.PVLpReP5G9NE96','011.44.1345.629268','1997-12-15 00:00:00','SA_REP',7500.00,0.30,146,80,1),(161,'Sarath','Sewall','ssewall@company.com','$2a$10$nFKnvQ4h.jKhMyEN6LnEBOUTONuXCdJvzIKzYz.PVLpReP5G9NE96','011.44.1345.529268','1998-11-03 00:00:00','SA_REP',7000.00,0.25,146,80,1),(162,'Clara','Vishney','cvishney@company.com','$2a$10$nFKnvQ4h.jKhMyEN6LnEBOUTONuXCdJvzIKzYz.PVLpReP5G9NE96','011.44.1346.129268','1997-11-11 00:00:00','SA_REP',10500.00,0.25,147,80,1),(163,'Danielle','Greene','dgreene@company.com','$2a$10$nFKnvQ4h.jKhMyEN6LnEBOUTONuXCdJvzIKzYz.PVLpReP5G9NE96','011.44.1346.229268','1999-03-19 00:00:00','SA_REP',9500.00,0.15,147,80,1),(164,'Mattea','Marvins','mmarvins@company.com','$2a$10$nFKnvQ4h.jKhMyEN6LnEBOUTONuXCdJvzIKzYz.PVLpReP5G9NE96','011.44.1346.329268','2000-01-24 00:00:00','SA_REP',7200.00,0.10,147,80,1),(165,'David','Lee','dlee@company.com','$2a$10$nFKnvQ4h.jKhMyEN6LnEBOUTONuXCdJvzIKzYz.PVLpReP5G9NE96','011.44.1346.529268','2000-02-23 00:00:00','SA_REP',6800.00,0.10,147,80,1),(166,'Sundar','Ande','sande@company.com','$2a$10$nFKnvQ4h.jKhMyEN6LnEBOUTONuXCdJvzIKzYz.PVLpReP5G9NE96','011.44.1346.629268','2000-03-24 00:00:00','SA_REP',6400.00,0.10,147,80,1),(167,'Amit','Banda','abanda@company.com','$2a$10$nFKnvQ4h.jKhMyEN6LnEBOUTONuXCdJvzIKzYz.PVLpReP5G9NE96','011.44.1346.729268','2000-04-21 00:00:00','SA_REP',6200.00,0.10,147,80,1),(168,'Lisa','Ozer','lozer@company.com','$2a$10$nFKnvQ4h.jKhMyEN6LnEBOUTONuXCdJvzIKzYz.PVLpReP5G9NE96','011.44.1343.929268','1997-03-11 00:00:00','SA_REP',11500.00,0.25,148,80,1),(169,'Harrison','Bloom','hbloom@company.com','$2a$10$nFKnvQ4h.jKhMyEN6LnEBOUTONuXCdJvzIKzYz.PVLpReP5G9NE96','011.44.1343.829268','1998-03-23 00:00:00','SA_REP',10000.00,0.20,148,80,1),(170,'Tayler','Fox','tfox@company.com','$2a$10$nFKnvQ4h.jKhMyEN6LnEBOUTONuXCdJvzIKzYz.PVLpReP5G9NE96','011.44.1343.729268','1998-01-24 00:00:00','SA_REP',9600.00,0.20,148,80,1),(171,'William','Smith','wsmith@company.com','$2a$10$nFKnvQ4h.jKhMyEN6LnEBOUTONuXCdJvzIKzYz.PVLpReP5G9NE96','011.44.1343.629268','1999-02-23 00:00:00','SA_REP',7400.00,0.15,148,80,1),(172,'Elizabeth','Bates','ebates@company.com','$2a$10$nFKnvQ4h.jKhMyEN6LnEBOUTONuXCdJvzIKzYz.PVLpReP5G9NE96','011.44.1343.529268','1999-03-24 00:00:00','SA_REP',7300.00,0.15,148,80,1),(173,'Sundita','Kumar','skumar@company.com','$2a$10$nFKnvQ4h.jKhMyEN6LnEBOUTONuXCdJvzIKzYz.PVLpReP5G9NE96','011.44.1343.329268','2000-04-21 00:00:00','SA_REP',6100.00,0.10,148,80,1),(174,'Ellen','Abel','eabel@company.com','$2a$10$nFKnvQ4h.jKhMyEN6LnEBOUTONuXCdJvzIKzYz.PVLpReP5G9NE96','011.44.1644.429267','1996-05-11 00:00:00','SA_REP',11000.00,0.30,149,80,1),(175,'Alyssa','Hutton','ahutton@company.com','$2a$10$nFKnvQ4h.jKhMyEN6LnEBOUTONuXCdJvzIKzYz.PVLpReP5G9NE96','011.44.1644.429266','1997-03-19 00:00:00','SA_REP',8800.00,0.25,149,80,1),(176,'Jonathon','Taylor','jtaylor@company.com','$2a$10$nFKnvQ4h.jKhMyEN6LnEBOUTONuXCdJvzIKzYz.PVLpReP5G9NE96','011.44.1644.429265','1998-03-24 00:00:00','SA_REP',8600.00,0.20,149,80,1),(177,'Jack','Livingston','jlivings@company.com','$2a$10$nFKnvQ4h.jKhMyEN6LnEBOUTONuXCdJvzIKzYz.PVLpReP5G9NE96','011.44.1644.429264','1998-04-23 00:00:00','SA_REP',8400.00,0.20,149,80,1),(178,'Kimberely','Grant','kgrant@company.com','$2a$10$nFKnvQ4h.jKhMyEN6LnEBOUTONuXCdJvzIKzYz.PVLpReP5G9NE96','011.44.1644.429263','1999-05-24 00:00:00','SA_REP',7000.00,0.15,149,80,1),(179,'Charles','Johnson','cjohnson@company.com','$2a$10$nFKnvQ4h.jKhMyEN6LnEBOUTONuXCdJvzIKzYz.PVLpReP5G9NE96','011.44.1644.429262','2000-01-04 00:00:00','SA_REP',6200.00,0.10,149,80,1),(180,'Winston','Taylor','wtaylor@company.com','$2a$10$nFKnvQ4h.jKhMyEN6LnEBOUTONuXCdJvzIKzYz.PVLpReP5G9NE96','650.507.9876','1998-01-24 00:00:00','SH_CLERK',3200.00,NULL,120,50,1),(181,'Jean','Fleaur','jfleaur@company.com','$2a$10$nFKnvQ4h.jKhMyEN6LnEBOUTONuXCdJvzIKzYz.PVLpReP5G9NE96','650.507.9877','1998-02-23 00:00:00','SH_CLERK',3100.00,NULL,120,50,1),(182,'Martha','Sullivan','msulliva@company.com','$2a$10$nFKnvQ4h.jKhMyEN6LnEBOUTONuXCdJvzIKzYz.PVLpReP5G9NE96','650.507.9878','1999-06-21 00:00:00','SH_CLERK',2500.00,NULL,120,50,1),(183,'Girard','Geoni','ggeoni@company.com','$2a$10$nFKnvQ4h.jKhMyEN6LnEBOUTONuXCdJvzIKzYz.PVLpReP5G9NE96','650.507.9879','2000-02-03 00:00:00','SH_CLERK',2800.00,NULL,120,50,1),(184,'Nandita','Sarchand','nsarchan@company.com','$2a$10$nFKnvQ4h.jKhMyEN6LnEBOUTONuXCdJvzIKzYz.PVLpReP5G9NE96','650.509.1876','1996-01-27 00:00:00','SH_CLERK',4200.00,NULL,121,50,1),(185,'Alexis','Bull','abull@company.com','$2a$10$nFKnvQ4h.jKhMyEN6LnEBOUTONuXCdJvzIKzYz.PVLpReP5G9NE96','650.509.2876','1997-02-20 00:00:00','SH_CLERK',4100.00,NULL,121,50,1),(186,'Julia','Dellinger','jdelling@company.com','$2a$10$nFKnvQ4h.jKhMyEN6LnEBOUTONuXCdJvzIKzYz.PVLpReP5G9NE96','650.509.3876','1998-06-24 00:00:00','SH_CLERK',3400.00,NULL,121,50,1),(187,'Anthony','Cabrio','acabrio@company.com','$2a$10$nFKnvQ4h.jKhMyEN6LnEBOUTONuXCdJvzIKzYz.PVLpReP5G9NE96','650.509.4876','1999-02-07 00:00:00','SH_CLERK',3000.00,NULL,121,50,1),(188,'Kelly','Chung','kchung@company.com','$2a$10$nFKnvQ4h.jKhMyEN6LnEBOUTONuXCdJvzIKzYz.PVLpReP5G9NE96','650.505.1876','1997-06-14 00:00:00','SH_CLERK',3800.00,NULL,122,50,1),(189,'Jennifer','Dilly','jdilly@company.com','$2a$10$nFKnvQ4h.jKhMyEN6LnEBOUTONuXCdJvzIKzYz.PVLpReP5G9NE96','650.505.2876','1997-08-13 00:00:00','SH_CLERK',3600.00,NULL,122,50,1),(190,'Timothy','Gates','tgates@company.com','$2a$10$nFKnvQ4h.jKhMyEN6LnEBOUTONuXCdJvzIKzYz.PVLpReP5G9NE96','650.505.3876','1998-07-11 00:00:00','SH_CLERK',2900.00,NULL,122,50,1),(191,'Randall','Perkins','rperkins@company.com','$2a$10$nFKnvQ4h.jKhMyEN6LnEBOUTONuXCdJvzIKzYz.PVLpReP5G9NE96','650.505.4876','1999-12-19 00:00:00','SH_CLERK',2500.00,NULL,122,50,1),(192,'Sarah','Bell','sbell@company.com','$2a$10$nFKnvQ4h.jKhMyEN6LnEBOUTONuXCdJvzIKzYz.PVLpReP5G9NE96','650.501.1876','1996-02-04 00:00:00','SH_CLERK',4000.00,NULL,123,50,1),(193,'Britney','Everett','beverett@company.com','$2a$10$nFKnvQ4h.jKhMyEN6LnEBOUTONuXCdJvzIKzYz.PVLpReP5G9NE96','650.501.2876','1997-03-03 00:00:00','SH_CLERK',3900.00,NULL,123,50,1),(194,'Samuel','McCain','smccain@company.com','$2a$10$nFKnvQ4h.jKhMyEN6LnEBOUTONuXCdJvzIKzYz.PVLpReP5G9NE96','650.501.3876','1998-07-01 00:00:00','SH_CLERK',3200.00,NULL,123,50,1),(195,'Vance','Jones','vjones@company.com','$2a$10$nFKnvQ4h.jKhMyEN6LnEBOUTONuXCdJvzIKzYz.PVLpReP5G9NE96','650.501.4876','1999-03-17 00:00:00','SH_CLERK',2800.00,NULL,123,50,1),(196,'Alana','Walsh','awalsh@company.com','$2a$10$nFKnvQ4h.jKhMyEN6LnEBOUTONuXCdJvzIKzYz.PVLpReP5G9NE96','650.507.9811','1998-04-24 00:00:00','SH_CLERK',3100.00,NULL,124,50,1),(197,'Kevin','Feeney','kfeeney@company.com','$2a$10$nFKnvQ4h.jKhMyEN6LnEBOUTONuXCdJvzIKzYz.PVLpReP5G9NE96','650.507.9822','1998-05-23 00:00:00','SH_CLERK',3000.00,NULL,124,50,1),(198,'Donald','OConnell','doconnel@company.com','$2a$10$nFKnvQ4h.jKhMyEN6LnEBOUTONuXCdJvzIKzYz.PVLpReP5G9NE96','650.507.9833','1999-06-21 00:00:00','SH_CLERK',2600.00,NULL,124,50,1),(199,'Douglas','Grant','dgrant@company.com','$2a$10$nFKnvQ4h.jKhMyEN6LnEBOUTONuXCdJvzIKzYz.PVLpReP5G9NE96','650.507.9844','2000-01-13 00:00:00','SH_CLERK',2600.00,NULL,124,50,1),(200,'Jennifer','Whalen','jwhalen@company.com','$2a$10$nFKnvQ4h.jKhMyEN6LnEBOUTONuXCdJvzIKzYz.PVLpReP5G9NE96','515.123.4444','1987-09-17 00:00:00','AD_ASST',4400.00,NULL,101,10,1),(201,'Michael','Hartstein','mhartste@company.com','$2a$10$nFKnvQ4h.jKhMyEN6LnEBOUTONuXCdJvzIKzYz.PVLpReP5G9NE96','515.123.5555','1996-02-17 00:00:00','MK_MAN',13000.00,NULL,100,20,1),(202,'Pat','Fay','pfay@company.com','$2a$10$nFKnvQ4h.jKhMyEN6LnEBOUTONuXCdJvzIKzYz.PVLpReP5G9NE96','603.123.6666','1997-08-17 00:00:00','MK_REP',6000.00,NULL,201,20,1),(203,'Susan','Mavris','smavris@company.com','$2a$10$nFKnvQ4h.jKhMyEN6LnEBOUTONuXCdJvzIKzYz.PVLpReP5G9NE96','515.123.7777','1994-06-07 00:00:00','HR_REP',6500.00,NULL,101,40,1),(204,'Hermann','Baer','hbaer@company.com','$2a$10$nFKnvQ4h.jKhMyEN6LnEBOUTONuXCdJvzIKzYz.PVLpReP5G9NE96','515.123.8888','1994-06-07 00:00:00','PR_REP',10000.00,NULL,101,70,1),(205,'Shelley','Higgins','shiggins@company.com','$2a$10$nFKnvQ4h.jKhMyEN6LnEBOUTONuXCdJvzIKzYz.PVLpReP5G9NE96','515.123.8080','1994-06-07 00:00:00','AC_MGR',12000.00,NULL,101,110,1),(206,'William','Gietz','wgietz@company.com','$2a$10$nFKnvQ4h.jKhMyEN6LnEBOUTONuXCdJvzIKzYz.PVLpReP5G9NE96','515.123.8181','1994-06-07 00:00:00','AC_ACCOUNT',8300.00,NULL,205,110,1);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_history`
--

DROP TABLE IF EXISTS `job_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `job_history` (
  `job_history_id` int(6) NOT NULL,
  `employee_id` int(6) NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `job_id` varchar(10) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `department_id` int(4) DEFAULT NULL,
  PRIMARY KEY (`job_history_id`,`employee_id`,`start_date`),
  KEY `jhist_department_ix` (`department_id`),
  KEY `jhist_employee_ix` (`employee_id`),
  KEY `jhist_job_ix` (`job_id`),
  KEY `jhist_job_fk` (`job_id`),
  CONSTRAINT `jhist_dept_fk` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`),
  CONSTRAINT `jhist_emp_fk` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`),
  CONSTRAINT `jhist_job_fk` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_history`
--

LOCK TABLES `job_history` WRITE;
/*!40000 ALTER TABLE `job_history` DISABLE KEYS */;
INSERT INTO `job_history` VALUES (1,101,'1989-09-21 00:00:00','1993-10-27 00:00:00','AC_ACCOUNT',110),(2,101,'1993-10-28 00:00:00','1997-03-15 00:00:00','AC_MGR',110),(3,102,'1993-01-13 00:00:00','1998-07-24 00:00:00','IT_PROG',60),(4,114,'1998-03-24 00:00:00','1999-12-31 00:00:00','ST_CLERK',50),(5,122,'1999-01-01 00:00:00','1999-12-31 00:00:00','ST_CLERK',50),(6,176,'1998-03-24 00:00:00','1998-12-31 00:00:00','SA_REP',80),(7,176,'1999-01-01 00:00:00','1999-12-31 00:00:00','SA_MAN',80),(8,200,'1987-09-17 00:00:00','1993-06-17 00:00:00','AD_ASST',90),(9,200,'1994-07-01 00:00:00','1998-12-31 00:00:00','AC_ACCOUNT',90),(10,201,'1996-02-17 00:00:00','1999-12-19 00:00:00','MK_REP',20);
/*!40000 ALTER TABLE `job_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `jobs` (
  `job_id` varchar(10) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `job_title` varchar(35) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `min_salary` int(6) DEFAULT NULL,
  `max_salary` int(6) DEFAULT NULL,
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
INSERT INTO `jobs` VALUES ('AC_ACCOUNT','Public Accountant',4200,9000),('AC_MGR','Accounting Manager',8200,16000),('AD_ASST','Administration Assistant',3000,6000),('AD_PRES','President',20000,40000),('AD_VP','Administration Vice President',15000,30000),('FI_ACCOUNT','Accountant',4200,9000),('FI_MGR','Finance Manager',8200,16000),('HR_REP','Human Resources Representative',4000,9000),('IT_PROG','Programmer',4000,10000),('MK_MAN','Marketing Manager',9000,15000),('MK_REP','Marketing Representative',4000,9000),('PR_REP','Public Relations Representative',4500,10500),('PU_CLERK','Purchasing Clerk',2500,5500),('PU_MAN','Purchasing Manager',8000,15000),('SA_MAN','Sales Manager',10000,20000),('SA_REP','Sales Representative',6000,12000),('SH_CLERK','Shipping Clerk',2500,5500),('ST_CLERK','Stock Clerk',2000,5000),('ST_MAN','Stock Manager',5500,8500),('WS_ADMIN','Web System Administrator',5000,10000);
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `locations` (
  `location_id` int(4) NOT NULL,
  `street_address` varchar(40) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `postal_code` varchar(12) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `city` varchar(30) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `state_province` varchar(25) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `country_id` char(2) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  PRIMARY KEY (`location_id`),
  KEY `loc_city_ix` (`city`),
  KEY `loc_country_ix` (`country_id`),
  KEY `loc_state_province_ix` (`state_province`),
  KEY `loc_c_id_fk` (`country_id`),
  CONSTRAINT `loc_c_id_fk` FOREIGN KEY (`country_id`) REFERENCES `countries` (`country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` VALUES (1000,'1297 Via Cola di Rie','00989','Roma',NULL,'IT'),(1100,'93091 Calle della Testa','10934','Venice',NULL,'IT'),(1200,'2017 Shinjuku-ku','1689','Tokyo','Tokyo Prefecture','JP'),(1300,'9450 Kamiya-cho','6823','Hiroshima',NULL,'JP'),(1400,'2014 Jabberwocky Rd','26192','Southlake','Texas','US'),(1500,'2011 Interiors Blvd','99236','South San Francisco','California','US'),(1600,'2007 Zagora St','50090','South Brunswick','New Jersey','US'),(1700,'2004 Charade Rd','98199','Seattle','Washington','US'),(1800,'147 Spadina Ave','M5V 2L7','Toronto','Ontario','CA'),(1900,'6092 Boxwood St','YSW 9T2','Whitehorse','Yukon','CA'),(2000,'40-5-12 Laogianggen','190518','Beijing',NULL,'CN'),(2100,'1298 Vileparle (E)','490231','Bombay','Maharashtra','IN'),(2200,'12-98 Victoria Street','2901','Sydney','New South Wales','AU'),(2300,'198 Clementi North','540198','Singapore',NULL,'SG'),(2400,'8204 Arthur St',NULL,'London',NULL,'UK'),(2500,'Magdalen Centre, The Oxford Science Park','OX9 9ZB','Oxford','Oxford','UK'),(2600,'9702 Chester Road','09629850293','Stretford','Manchester','UK'),(2700,'Schwanthalerstr. 7031','80925','Munich','Bavaria','DE'),(2800,'Rua Frei Caneca 1360 ','01307-002','Sao Paulo','Sao Paulo','BR'),(2900,'20 Rue des Corps-Saints','1730','Geneva','Geneve','CH'),(3000,'Murtenstrasse 921','3095','Bern','BE','CH'),(3100,'Pieter Breughelstraat 837','3029SK','Utrecht','Utrecht','NL'),(3200,'Mariano Escobedo 9991','11932','Mexico City','Distrito Federal,','MX');
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `regions`
--

DROP TABLE IF EXISTS `regions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `regions` (
  `region_id` decimal(22,0) NOT NULL,
  `region_name` varchar(25) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  PRIMARY KEY (`region_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regions`
--

LOCK TABLES `regions` WRITE;
/*!40000 ALTER TABLE `regions` DISABLE KEYS */;
INSERT INTO `regions` VALUES (1,'Europe'),(2,'Americas'),(3,'Asia'),(4,'Middle East and Africa');
/*!40000 ALTER TABLE `regions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-14 18:18:24
