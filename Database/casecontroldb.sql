CREATE DATABASE  IF NOT EXISTS `casecontroldb` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `casecontroldb`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: localhost    Database: casecontroldb
-- ------------------------------------------------------
-- Server version	5.6.20-log

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
-- Table structure for table `additionalclientinfo`
--

DROP TABLE IF EXISTS `additionalclientinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `additionalclientinfo` (
  `fileNo` int(11) NOT NULL,
  `clientOccupation` varchar(100) DEFAULT NULL,
  `employer` varchar(100) DEFAULT NULL,
  `address` varchar(150) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `spouseLastName` varchar(100) DEFAULT NULL,
  `spouseFirstName` varchar(100) DEFAULT NULL,
  `spouseOccupation` varchar(100) DEFAULT NULL,
  `spouseAddress` varchar(150) DEFAULT NULL,
  `spouseEmployer` varchar(100) DEFAULT NULL,
  `spouseCity` varchar(100) DEFAULT NULL,
  `spouseState` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`fileNo`),
  CONSTRAINT `fileNo_addInfo` FOREIGN KEY (`fileNo`) REFERENCES `clients` (`fileno`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `additionalclientinfo`
--

LOCK TABLES `additionalclientinfo` WRITE;
/*!40000 ALTER TABLE `additionalclientinfo` DISABLE KEYS */;
INSERT INTO `additionalclientinfo` VALUES (1,'client occupation11','client employer1','client address1','client city1','client state1','spouse last name1','spouse first name1','spouse occupation1','spouse address1','spouse employer1','spouse city1','spouse state1'),(2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `additionalclientinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientautoinfo`
--

DROP TABLE IF EXISTS `clientautoinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientautoinfo` (
  `fileNo` int(11) NOT NULL,
  `insuranceCompany` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `zip` varchar(100) DEFAULT NULL,
  `phoneNumber` varchar(100) DEFAULT NULL,
  `adjuster` varchar(100) DEFAULT NULL,
  `policyNumber` varchar(100) DEFAULT NULL,
  `effectiveStartDate` date DEFAULT NULL,
  `effectiveEndDate` date DEFAULT NULL,
  `medPayAvailable` varchar(100) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `liabilityMinCoverage` double DEFAULT NULL,
  `liabilityMaxCoverage` double DEFAULT NULL,
  `UMIMin` double DEFAULT NULL,
  `UMIMax` double DEFAULT NULL,
  `reimbursable` double DEFAULT NULL,
  `notes` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`fileNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientautoinfo`
--

LOCK TABLES `clientautoinfo` WRITE;
/*!40000 ALTER TABLE `clientautoinfo` DISABLE KEYS */;
INSERT INTO `clientautoinfo` VALUES (1,'insurance company','address','city','state','22','22-333-4444','adjuster','23','2015-08-17','2012-02-21','100',200,300,400,500,600,700,'custom notes'),(2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,0,NULL),(3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,0,NULL);
/*!40000 ALTER TABLE `clientautoinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientinjuries`
--

DROP TABLE IF EXISTS `clientinjuries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientinjuries` (
  `fileNo` int(11) NOT NULL,
  `noteId` int(11) NOT NULL AUTO_INCREMENT,
  `note` varchar(300) DEFAULT NULL,
  `createdDate` date DEFAULT NULL,
  `modifiedDate` date DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`noteId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientinjuries`
--

LOCK TABLES `clientinjuries` WRITE;
/*!40000 ALTER TABLE `clientinjuries` DISABLE KEYS */;
INSERT INTO `clientinjuries` VALUES (1,1,'note 11','2011-12-31','2012-02-01','Jay is Gay'),(1,2,'note2','0000-00-00','0000-00-00','sdff'),(1,3,'note3','0000-00-00','0000-00-00','test');
/*!40000 ALTER TABLE `clientinjuries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clients` (
  `fileNo` int(11) NOT NULL,
  `firstName` varchar(45) NOT NULL,
  `lastName` varchar(45) NOT NULL,
  `status` varchar(45) NOT NULL,
  PRIMARY KEY (`fileNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (1,'balram','chavan','Active'),(2,'balram2','chavan2','Active'),(3,'balram3','chavan3','Active');
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courtinformation`
--

DROP TABLE IF EXISTS `courtinformation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courtinformation` (
  `fileNo` int(11) NOT NULL,
  `caseNumber` varchar(100) DEFAULT NULL,
  `court` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `zip` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`fileNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courtinformation`
--

LOCK TABLES `courtinformation` WRITE;
/*!40000 ALTER TABLE `courtinformation` DISABLE KEYS */;
INSERT INTO `courtinformation` VALUES (1,'case number 1','court 1','address','city','state','zip'),(2,NULL,'\n	',NULL,NULL,NULL,NULL),(3,NULL,'\n	',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `courtinformation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `defendantattorneyinfo`
--

DROP TABLE IF EXISTS `defendantattorneyinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `defendantattorneyinfo` (
  `fileNo` int(11) NOT NULL,
  `firm` varchar(100) DEFAULT NULL,
  `attorney` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `zip` varchar(100) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`fileNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `defendantattorneyinfo`
--

LOCK TABLES `defendantattorneyinfo` WRITE;
/*!40000 ALTER TABLE `defendantattorneyinfo` DISABLE KEYS */;
INSERT INTO `defendantattorneyinfo` VALUES (1,'firm','attorney','address','city','state','zip','220'),(2,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `defendantattorneyinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `defendantinformation`
--

DROP TABLE IF EXISTS `defendantinformation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `defendantinformation` (
  `fileNo` int(11) NOT NULL,
  `lastName` varchar(100) DEFAULT NULL,
  `firstName` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `zip` varchar(100) DEFAULT NULL,
  `homePhone` varchar(100) DEFAULT NULL,
  `businessPhone` varchar(100) DEFAULT NULL,
  `dateOfBirth` date DEFAULT NULL,
  `drivingLicense` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`fileNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `defendantinformation`
--

LOCK TABLES `defendantinformation` WRITE;
/*!40000 ALTER TABLE `defendantinformation` DISABLE KEYS */;
INSERT INTO `defendantinformation` VALUES (1,'LAST name','first name','address','city','state','zip','22','22','2010-10-02','2448'),(2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `defendantinformation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `defendantinsurance`
--

DROP TABLE IF EXISTS `defendantinsurance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `defendantinsurance` (
  `fileNo` int(11) NOT NULL,
  `nameOfInsured` varchar(100) DEFAULT NULL,
  `insuranceCompany` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `zip` varchar(100) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `adjuster` varchar(100) DEFAULT NULL,
  `claimNumber` varchar(100) DEFAULT NULL,
  `policyLimits` int(11) DEFAULT NULL,
  PRIMARY KEY (`fileNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `defendantinsurance`
--

LOCK TABLES `defendantinsurance` WRITE;
/*!40000 ALTER TABLE `defendantinsurance` DISABLE KEYS */;
INSERT INTO `defendantinsurance` VALUES (1,'name of insured1','insurance company','address2','city','state','zip','phone3','adjuster','233',488),(2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `defendantinsurance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `generalinformation`
--

DROP TABLE IF EXISTS `generalinformation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `generalinformation` (
  `fileNo` int(11) NOT NULL,
  `address` varchar(100) DEFAULT NULL,
  `aptNo` varchar(100) DEFAULT NULL,
  `initialInfo` varchar(100) DEFAULT NULL,
  `defendantName` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `evidence1` varchar(100) DEFAULT NULL,
  `caseType` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `evidence2` varchar(100) DEFAULT NULL,
  `otherType` varchar(100) DEFAULT NULL,
  `homePhone` varchar(100) DEFAULT NULL,
  `caseStatus` varchar(100) DEFAULT NULL,
  `cellPhone` varchar(100) DEFAULT NULL,
  `originatingAttorney` varchar(100) DEFAULT NULL,
  `accidentDate` date DEFAULT NULL,
  `workPhone` varchar(100) DEFAULT NULL,
  `assignedAttorney` varchar(100) DEFAULT NULL,
  `clientCreated` date DEFAULT NULL,
  `drivingLicense` varchar(100) DEFAULT NULL,
  `refferal` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `dateOfBirth` date DEFAULT NULL,
  `SSN` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`fileNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `generalinformation`
--

LOCK TABLES `generalinformation` WRITE;
/*!40000 ALTER TABLE `generalinformation` DISABLE KEYS */;
INSERT INTO `generalinformation` VALUES (1,'Pimple gurav','aprt no 3','additional info','mydefname','mycity ','dfdf','Injury','mystate','e2','myOtherType','222222','Open','333333','myoriginatingattorney','2015-08-25','44444','myassignedAttorney','2015-03-22','mylicense f','myrefferal','balram@gmail.com','2015-08-17','myssn 1'),(2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'a2',NULL,NULL,NULL,NULL,NULL,NULL),(3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'attorney3',NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `generalinformation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `govtclaimdetails`
--

DROP TABLE IF EXISTS `govtclaimdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `govtclaimdetails` (
  `fileNo` int(11) NOT NULL,
  `_6monthsStatue` date DEFAULT NULL,
  `sl1yr` date DEFAULT NULL,
  `_2yrs` date DEFAULT NULL,
  `city` date DEFAULT NULL,
  `cityRejectedDate` date DEFAULT NULL,
  `cityRejectedAfter6Months` date DEFAULT NULL,
  `county` date DEFAULT NULL,
  `countyRejectedDate` date DEFAULT NULL,
  `countyRejectedAfter6Months` date DEFAULT NULL,
  `state` date DEFAULT NULL,
  `stateRejectedDate` date DEFAULT NULL,
  `stateRejectedAfter6Months` date DEFAULT NULL,
  `other` date DEFAULT NULL,
  `otherRejectedDate` date DEFAULT NULL,
  `otherRejectedAfter6Months` date DEFAULT NULL,
  PRIMARY KEY (`fileNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `govtclaimdetails`
--

LOCK TABLES `govtclaimdetails` WRITE;
/*!40000 ALTER TABLE `govtclaimdetails` DISABLE KEYS */;
INSERT INTO `govtclaimdetails` VALUES (1,'2015-08-13','2015-08-18','2015-08-23','2015-08-14','2015-08-19','2015-08-24','2015-08-15','2015-08-20','2015-08-25','2015-08-16','2015-08-21','2015-08-26','2015-08-01','2015-08-02','2015-08-17'),(2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `govtclaimdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicalinsurance`
--

DROP TABLE IF EXISTS `medicalinsurance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medicalinsurance` (
  `fileNo` int(11) NOT NULL,
  `namedInsured` varchar(100) DEFAULT NULL,
  `insuranceCompany` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `zip` varchar(100) DEFAULT NULL,
  `phoneNumer` varchar(100) DEFAULT NULL,
  `policyNumber` varchar(100) DEFAULT NULL,
  `mediCalNumber` varchar(100) DEFAULT NULL,
  `mediCareNumber` varchar(100) DEFAULT NULL,
  `claimNumber` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`fileNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicalinsurance`
--

LOCK TABLES `medicalinsurance` WRITE;
/*!40000 ALTER TABLE `medicalinsurance` DISABLE KEYS */;
INSERT INTO `medicalinsurance` VALUES (1,'1','2','3','4','5','6','7','8','9','10','11'),(2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `medicalinsurance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `miscinfo`
--

DROP TABLE IF EXISTS `miscinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `miscinfo` (
  `fileNo` int(11) NOT NULL,
  `noteId` int(11) NOT NULL AUTO_INCREMENT,
  `note` varchar(300) DEFAULT NULL,
  `createdDate` date DEFAULT NULL,
  `modifiedDate` date DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`noteId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `miscinfo`
--

LOCK TABLES `miscinfo` WRITE;
/*!40000 ALTER TABLE `miscinfo` DISABLE KEYS */;
INSERT INTO `miscinfo` VALUES (1,1,'note 12','2011-12-30','2012-01-31','note description1'),(1,3,'note 3','0000-00-00','0000-00-00','desc 3');
/*!40000 ALTER TABLE `miscinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statuteinformation`
--

DROP TABLE IF EXISTS `statuteinformation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `statuteinformation` (
  `fileNo` int(11) NOT NULL,
  `_1yrFromAccident` date DEFAULT NULL,
  `_2yrFromAccident` date DEFAULT NULL,
  `complaintFiledDate` date DEFAULT NULL,
  `_60daysFromFiledDate` date DEFAULT NULL,
  `_2yrsDate` date DEFAULT NULL,
  `_3yrsDate` date DEFAULT NULL,
  `_5yrsDate` date DEFAULT NULL,
  `isGovtClaim` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`fileNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statuteinformation`
--

LOCK TABLES `statuteinformation` WRITE;
/*!40000 ALTER TABLE `statuteinformation` DISABLE KEYS */;
INSERT INTO `statuteinformation` VALUES (1,NULL,'1969-12-29','2015-08-14','1969-12-29','1969-12-29','1969-12-29','1969-12-29','1970-01-01'),(2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'false'),(3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `statuteinformation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`id`,`username`,`password`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','admin'),(14,'balram','chavan');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'casecontroldb'
--
/*!50003 DROP PROCEDURE IF EXISTS `closeClient` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `closeClient`(_fileNo int)
BEGIN
	UPDATE clients
	SET  status = 'Closed'
	WHERE fileNo = _fileNo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `createEmptyGeneralSection` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `createEmptyGeneralSection`()
BEGIN
	set @newFileNo = 0;
	select  @newFileNo:=max(fileNo)  from clients;
	SET @newFileNo = @newFileNo + 1;

	INSERT INTO `casecontroldb`.`clients`
			(`fileNo`,
			`firstName`,
			`lastName`,
			`status`)
	VALUES
	(@newFileNo, '','','Active');

	INSERT INTO generalinformation(fileNo) values(@newFileNo);

	call  getClientGeneralInformation(@newFileNo);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `createNewClient` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `createNewClient`(fileNo int, firstName varchar(100),lastName varchar(100))
BEGIN
	INSERT INTO `casecontroldb`.`clients`
			(`fileNo`,
			`firstName`,
			`lastName`,
			`status`)
			VALUES
			(fileNo,
			firstName,
			lastName,
			'Active');

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `deleteAdditionalInfo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteAdditionalInfo`(_fileNo int)
BEGIN
	DELETE FROM additionalclientinfo
	WHERE fileNo = _fileNo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `deleteClient` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteClient`(_fileNo int)
BEGIN
delete from casecontroldb.additionalclientinfo
where fileNo =_fileNo;

delete from casecontroldb.clientautoinfo
where fileNo =_fileNo;

delete from casecontroldb.clientinjuries
where fileNo =_fileNo;

delete from casecontroldb.courtinformation
where fileNo =_fileNo;

delete from casecontroldb.defendantattorneyinfo
where fileNo =_fileNo;

delete from casecontroldb.defendantinformation
where fileNo =_fileNo;

delete from casecontroldb.defendantinsurance
where fileNo =_fileNo;

delete from casecontroldb.generalinformation
where fileNo =_fileNo;

delete from casecontroldb.govtclaimdetails
where fileNo =_fileNo;

delete from casecontroldb.medicalinsurance
where fileNo =_fileNo;

delete from casecontroldb.miscinfo
where fileNo =_fileNo;

delete from casecontroldb.statuteinformation
where fileNo =_fileNo;

delete from casecontroldb.clients
where fileNo =_fileNo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `deleteClientAutoInfo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteClientAutoInfo`(_fileNo int)
BEGIN
	DELETE FROM clientautoinfo
	WHERE fileNo = _fileNo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `deleteClientInjury` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteClientInjury`(_fileNo int, _noteId int)
BEGIN
	DELETE FROM clientinjuries
	WHERE fileNo = _fileNo AND noteId  = _noteId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `deleteClientMedicalInsuranceInfo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteClientMedicalInsuranceInfo`(_fileNo int)
BEGIN
	DELETE FROM medicalinsurance
	WHERE fileNo = _fileNo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `deleteCourtInfo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteCourtInfo`(_fileNo int)
BEGIN
	DELETE FROM courtinformation
	WHERE fileNo = _fileNo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `deleteDefendantInfo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteDefendantInfo`(_fileNo int)
BEGIN
	DELETE FROM defendantinformation
	WHERE fileNo = _fileNo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `deleteDefendantInsuranceInfo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteDefendantInsuranceInfo`(_fileNo int)
BEGIN
	DELETE FROM defendantinsurance
	WHERE fileNo = _fileNo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `deleteGeneralInfo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteGeneralInfo`(_fileNo int)
BEGIN
	DELETE FROM generalinformation
	WHERE fileNo = _fileNo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `deleteGovtClaimInfo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteGovtClaimInfo`(_fileNo int)
BEGIN
	DELETE FROM govtclaimdetails
	WHERE fileNo = _fileNo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `deleteMiscInfo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteMiscInfo`(_fileNo int, _noteId int)
BEGIN
	DELETE FROM miscinfo
	WHERE fileNo = _fileNo AND noteId  = _noteId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `deleteStatuteInfo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteStatuteInfo`(_fileNo int)
BEGIN
	DELETE FROM statuteinformation
	WHERE fileNo = _fileNo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getAdditionalClientInfo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getAdditionalClientInfo`(_fileno int)
BEGIN
	SELECT a.`fileNo`,
		`clientOccupation`,
		`employer`,
		`address`,
		`city`,
		`state`,
		`spouseLastName`,
		`spouseFirstName`,
		`spouseOccupation`,
		`spouseAddress`,
		`spouseEmployer`,
		`spouseCity`,
		`spouseState`
	FROM `casecontroldb`.`additionalclientinfo` as a
inner join `casecontroldb`.`clients` c
on a.fileNo = c.fileNo
where c.fileNo = _fileNo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getClientautoinfo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getClientautoinfo`(_fileNo int)
BEGIN
	SELECT * FROM casecontroldb.clientautoinfo 
	WHERE fileNo = _fileNo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getClientGeneralInformation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getClientGeneralInformation`(_fileno int)
BEGIN
SELECT g.`fileNo`,
    g.`address`,
    g.`aptNo`,
    g.`initialInfo`,
    g.`defendantName`,
    g.`city`,
    g.`evidence1`,
    g.`caseType`,
    g.`state`,
    g.`evidence2`,
    g.`otherType`,
    g.`homePhone`,
    g.`caseStatus`,
    g.`cellPhone`,
    g.`originatingAttorney`,
    date(g.accidentDate) accidentDate,
    g.`workPhone`,
    g.`assignedAttorney`,
    date(g.clientCreated) clientCreated,
    g.`drivingLicense`,
    g.`refferal`,
    g.`email`,
    date(g.dateOfBirth) dateOfBirth,
    g.`SSN`,
	c.firstName,
	c.lastName
FROM `casecontroldb`.generalinformation as g
inner join clients as c
on g.fileNo = c.fileNo
 where g.fileno = _fileno;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getClientInjuries` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getClientInjuries`(_fileNo int)
BEGIN
	SELECT * FROM casecontroldb.clientinjuries
	WHERE fileNo = _fileNo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getCourtInformation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getCourtInformation`(_fileNo int)
BEGIN
	SELECT * FROM casecontroldb.courtinformation
	WHERE fileNo = _fileNo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getDefendantAttorneyInfo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getDefendantAttorneyInfo`(_fileNo int)
BEGIN
	SELECT * FROM defendantattorneyinfo
	WHERE fileNo = _fileNo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getDefendantInformation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getDefendantInformation`(_fileNo int)
BEGIN
	SELECT * FROM defendantinformation
	WHERE fileNo = _fileNo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getDefendantInsurance` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getDefendantInsurance`(_fileNo int)
BEGIN
	SELECT * FROM casecontroldb.defendantinsurance
	WHERE fileNo = _fileNo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getGovtClaimDetails` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getGovtClaimDetails`(_fileNo int)
BEGIN
	SELECT * FROM casecontroldb.govtclaimdetails
	WHERE fileNo = _fileNo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getMedicalInsurance` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getMedicalInsurance`(_fileNo int)
BEGIN
	SELECT * FROM medicalinsurance
	WHERE fileNo = _fileNo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getMicInfo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getMicInfo`(_fileNo int)
BEGIN
	SELECT * FROM casecontroldb.miscinfo
	WHERE fileNo = _fileNo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getNewFileNo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getNewFileNo`()
BEGIN
	SELECT max(fileNo) + 1 as 'NewFileNo' FROM `casecontroldb`.`clients`;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getStatuteInformation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getStatuteInformation`(_fileNo int)
BEGIN
	SELECT * FROM casecontroldb.statuteinformation
	WHERE fileNo = _fileNo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `reactivateClient` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `reactivateClient`(_fileNo int)
BEGIN
	UPDATE clients
	SET  status = 'Active'
	WHERE fileNo = _fileNo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `resetClients` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `resetClients`()
BEGIN
delete from casecontroldb.additionalclientinfo
where fileNo <> 1;

delete from casecontroldb.clientautoinfo
where fileNo <> 1;

delete from casecontroldb.clientinjuries
where fileNo <> 1;

delete from casecontroldb.courtinformation
where fileNo <> 1;

delete from casecontroldb.defendantattorneyinfo
where fileNo <> 1;

delete from casecontroldb.defendantinformation
where fileNo <> 1;

delete from casecontroldb.defendantinsurance
where fileNo <> 1;

delete from casecontroldb.generalinformation
where fileNo <> 1;

delete from casecontroldb.govtclaimdetails
where fileNo <> 1;

delete from casecontroldb.medicalinsurance
where fileNo <> 1;

delete from casecontroldb.miscinfo
where fileNo <> 1;

delete from casecontroldb.statuteinformation
where fileNo <> 1;

delete from casecontroldb.clients
where fileNo <> 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-08-17 11:05:40
