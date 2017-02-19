CREATE DATABASE  IF NOT EXISTS `school` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `school`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: localhost    Database: school
-- ------------------------------------------------------
-- Server version	5.6.19

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book` (
  `bookid` int(11) NOT NULL AUTO_INCREMENT,
  `isbn` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `publicationyear` varchar(10) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `publication` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`bookid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookinbookset`
--

DROP TABLE IF EXISTS `bookinbookset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bookinbookset` (
  `bookinbooksetid` int(11) NOT NULL AUTO_INCREMENT,
  `booksetid` int(11) DEFAULT NULL,
  `bookid` int(11) DEFAULT NULL,
  PRIMARY KEY (`bookinbooksetid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookinbookset`
--

LOCK TABLES `bookinbookset` WRITE;
/*!40000 ALTER TABLE `bookinbookset` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookinbookset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookset`
--

DROP TABLE IF EXISTS `bookset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bookset` (
  `booksetid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `standardid` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `availquantity` int(11) DEFAULT NULL,
  PRIMARY KEY (`booksetid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookset`
--

LOCK TABLES `bookset` WRITE;
/*!40000 ALTER TABLE `bookset` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `charge`
--

DROP TABLE IF EXISTS `charge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `charge` (
  `chargeid` int(11) NOT NULL AUTO_INCREMENT,
  `chargedate` varchar(20) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `studentid` int(11) DEFAULT NULL,
  `sequenceno` int(11) DEFAULT NULL,
  PRIMARY KEY (`chargeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `charge`
--

LOCK TABLES `charge` WRITE;
/*!40000 ALTER TABLE `charge` DISABLE KEYS */;
/*!40000 ALTER TABLE `charge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `city` (
  `cityid` int(11) NOT NULL AUTO_INCREMENT,
  `cityname` varchar(100) DEFAULT NULL,
  `stateid` int(11) NOT NULL,
  PRIMARY KEY (`cityid`),
  KEY `FK_stateid_idx` (`stateid`),
  CONSTRAINT `FK_stateid` FOREIGN KEY (`stateid`) REFERENCES `state` (`stateid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES (1,'Visakhapatnam',1),(2,'Vizianagaram',1);
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feestudent`
--

DROP TABLE IF EXISTS `feestudent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feestudent` (
  `feestudentid` int(11) NOT NULL AUTO_INCREMENT,
  `feetypeid` int(11) DEFAULT NULL,
  `studentid` int(11) DEFAULT NULL,
  `paidfrom` varchar(50) DEFAULT NULL,
  `paidto` varchar(50) DEFAULT NULL,
  `standardid` int(11) DEFAULT NULL,
  `amountpaid` int(11) DEFAULT NULL,
  PRIMARY KEY (`feestudentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feestudent`
--

LOCK TABLES `feestudent` WRITE;
/*!40000 ALTER TABLE `feestudent` DISABLE KEYS */;
/*!40000 ALTER TABLE `feestudent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feestype`
--

DROP TABLE IF EXISTS `feestype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feestype` (
  `feestypeid` int(11) NOT NULL AUTO_INCREMENT,
  `typename` varchar(255) DEFAULT NULL,
  `duration` varchar(45) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `standardid` int(11) DEFAULT NULL,
  PRIMARY KEY (`feestypeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feestype`
--

LOCK TABLES `feestype` WRITE;
/*!40000 ALTER TABLE `feestype` DISABLE KEYS */;
/*!40000 ALTER TABLE `feestype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice`
--

DROP TABLE IF EXISTS `invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoice` (
  `invoiceid` int(11) NOT NULL AUTO_INCREMENT,
  `invoicedate` varchar(20) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `studentid` int(11) DEFAULT NULL,
  `sequenceno` int(11) DEFAULT NULL,
  PRIMARY KEY (`invoiceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice`
--

LOCK TABLES `invoice` WRITE;
/*!40000 ALTER TABLE `invoice` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login` (
  `username` varchar(255) NOT NULL,
  `userpassword` varchar(255) NOT NULL,
  `reseturl` varchar(255) DEFAULT NULL,
  `usertype` int(11) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES ('admin','21232f297a57a5a743894a0e4a801fc3',NULL,1);
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organization`
--

DROP TABLE IF EXISTS `organization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organization` (
  `organizationid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `contactnumber` varchar(20) DEFAULT NULL,
  `organizationtypeid` int(11) DEFAULT NULL,
  PRIMARY KEY (`organizationid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organization`
--

LOCK TABLES `organization` WRITE;
/*!40000 ALTER TABLE `organization` DISABLE KEYS */;
/*!40000 ALTER TABLE `organization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organizationcontact`
--

DROP TABLE IF EXISTS `organizationcontact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organizationcontact` (
  `organizationcontactid` int(11) NOT NULL AUTO_INCREMENT,
  `organizationid` int(11) DEFAULT NULL,
  `personid` int(11) DEFAULT NULL,
  PRIMARY KEY (`organizationcontactid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organizationcontact`
--

LOCK TABLES `organizationcontact` WRITE;
/*!40000 ALTER TABLE `organizationcontact` DISABLE KEYS */;
/*!40000 ALTER TABLE `organizationcontact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organizationtype`
--

DROP TABLE IF EXISTS `organizationtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organizationtype` (
  `organizationtypeid` int(11) NOT NULL AUTO_INCREMENT,
  `typename` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`organizationtypeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organizationtype`
--

LOCK TABLES `organizationtype` WRITE;
/*!40000 ALTER TABLE `organizationtype` DISABLE KEYS */;
/*!40000 ALTER TABLE `organizationtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment` (
  `paymentid` int(11) NOT NULL AUTO_INCREMENT,
  `paymentdate` varchar(20) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `studentid` int(11) DEFAULT NULL,
  `sequenceno` int(11) DEFAULT NULL,
  PRIMARY KEY (`paymentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person` (
  `personid` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) NOT NULL,
  `middlename` varchar(45) DEFAULT NULL,
  `lastname` varchar(255) NOT NULL,
  `aadharnumber` varchar(45) DEFAULT NULL,
  `dob` varchar(45) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `mobileno` varchar(20) DEFAULT NULL,
  `gender` varchar(10) NOT NULL,
  `homeno` varchar(20) DEFAULT NULL,
  `address1` varchar(255) DEFAULT NULL,
  `address2` varchar(255) DEFAULT NULL,
  `pincode` varchar(10) DEFAULT NULL,
  `cityid` int(11) NOT NULL,
  `stateid` int(11) NOT NULL,
  `photo` longblob,
  PRIMARY KEY (`personid`),
  UNIQUE KEY `personid_UNIQUE` (`personid`),
  KEY `FK_cityid_idx` (`cityid`),
  KEY `FK_stateid_idx` (`stateid`),
  CONSTRAINT `FK_cityid` FOREIGN KEY (`cityid`) REFERENCES `city` (`cityid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--



--
-- Table structure for table `standard`
--

DROP TABLE IF EXISTS `standard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `standard` (
  `standardid` int(11) NOT NULL AUTO_INCREMENT,
  `standardname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`standardid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `standard`
--

LOCK TABLES `standard` WRITE;
/*!40000 ALTER TABLE `standard` DISABLE KEYS */;
INSERT INTO `standard` VALUES (1,'NURSARY'),(2,'LKG'),(3,'UKG'),(4,'I'),(5,'II'),(6,'III'),(7,'IV'),(8,'V'),(9,'VI'),(10,'VII'),(11,'VIII'),(12,'IX'),(13,'X');
/*!40000 ALTER TABLE `standard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `state`
--

DROP TABLE IF EXISTS `state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `state` (
  `stateid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  PRIMARY KEY (`stateid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `state`
--

LOCK TABLES `state` WRITE;
/*!40000 ALTER TABLE `state` DISABLE KEYS */;
INSERT INTO `state` VALUES (1,'Andhra Pradesh');
/*!40000 ALTER TABLE `state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statement`
--

DROP TABLE IF EXISTS `statement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `statement` (
  `statementid` int(11) NOT NULL AUTO_INCREMENT,
  `startdate` varchar(20) DEFAULT NULL,
  `enddate` varchar(20) DEFAULT NULL,
  `statementname` varchar(255) DEFAULT NULL,
  `msg` varchar(255) DEFAULT NULL,
  `studentid` int(11) DEFAULT NULL,
  PRIMARY KEY (`statementid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statement`
--

LOCK TABLES `statement` WRITE;
/*!40000 ALTER TABLE `statement` DISABLE KEYS */;
/*!40000 ALTER TABLE `statement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `studentid` int(11) NOT NULL AUTO_INCREMENT,
  `fatherid` int(11) DEFAULT NULL,
  `personid` int(11) DEFAULT NULL,
  `shift` varchar(100) DEFAULT NULL,
  `board` varchar(100) DEFAULT NULL,
  `enrollmentdate` varchar(20) DEFAULT NULL,
  `leavingdate` varchar(20) DEFAULT NULL,
  `standardid` int(11) DEFAULT NULL,
  `bloodgroup` varchar(10) DEFAULT NULL,
  `religion` varchar(50) DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `rollno` int(11) DEFAULT NULL,
  `batch` varchar(100) DEFAULT NULL,
  `familyincome` int(11) DEFAULT NULL,
  `motherid` int(11) DEFAULT NULL,
  `purchasebook` int(11) DEFAULT NULL,
  `outstandingfees` int(11) DEFAULT NULL,
  PRIMARY KEY (`studentid`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

--
-- Table structure for table `task`
--

DROP TABLE IF EXISTS `task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task` (
  `taskid` int(11) NOT NULL AUTO_INCREMENT,
  `taskname` varchar(255) DEFAULT NULL,
  `taskDescription` varchar(500) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `datecreated` varchar(20) DEFAULT NULL,
  `fordate` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`taskid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task`
--

LOCK TABLES `task` WRITE;
/*!40000 ALTER TABLE `task` DISABLE KEYS */;
/*!40000 ALTER TABLE `task` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-02-18 18:06:59
