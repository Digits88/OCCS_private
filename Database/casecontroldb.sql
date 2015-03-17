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
INSERT INTO `additionalclientinfo` VALUES (1,'client occupation','client employer','client address','client city','client state','spouse last name','spouse first name','spouse occupation','spouse address','spouse employer','spouse city','spouse state');
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
INSERT INTO `clientautoinfo` VALUES (1,'insurance company','address','city','state','22','22-333-4444','adjuster','23','2011-02-03','2012-02-04','100',200,300,400,500,600,700,'custom notes');
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
  `noteId` int(11) DEFAULT NULL,
  `note` varchar(300) DEFAULT NULL,
  `createdDate` date DEFAULT NULL,
  `modifiedDate` date DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`fileNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientinjuries`
--

LOCK TABLES `clientinjuries` WRITE;
/*!40000 ALTER TABLE `clientinjuries` DISABLE KEYS */;
INSERT INTO `clientinjuries` VALUES (1,1,'note 1','2012-01-02','2012-02-03','note description');
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
INSERT INTO `clients` VALUES (1,'balram 1','chavan 1','Active'),(2,'jay','dude','Inactive');
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
INSERT INTO `courtinformation` VALUES (1,'case number 1','court 1','address','city','state','zip');
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
INSERT INTO `defendantattorneyinfo` VALUES (1,'firm','attorney','address','city','state','zip','220');
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
INSERT INTO `defendantinformation` VALUES (1,'LAST name','first name','address','city','state','zip','22','22','2010-10-02','2448');
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
INSERT INTO `defendantinsurance` VALUES (1,'name of insured','insurance company','address','city','state','zip','phone','adjuster','233',488);
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
  `accidentDate` varchar(100) DEFAULT NULL,
  `workPhone` varchar(100) DEFAULT NULL,
  `assignedAttorney` varchar(100) DEFAULT NULL,
  `clientCreated` date DEFAULT NULL,
  `drivingLicense` varchar(100) DEFAULT NULL,
  `refferal` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `dateOfBirth` date DEFAULT NULL,
  `SSN` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`fileNo`),
  CONSTRAINT `fileno` FOREIGN KEY (`fileNo`) REFERENCES `clients` (`fileno`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `generalinformation`
--

LOCK TABLES `generalinformation` WRITE;
/*!40000 ALTER TABLE `generalinformation` DISABLE KEYS */;
INSERT INTO `generalinformation` VALUES (1,'india','','additional info','mydefname','mycity ','e1','Injury','mystate','e2','myOtherType','222222','Open','333333','myoriginatingattorney','2014-04-05','44444','myassignedAttorney','2015-04-03','mylicense','myrefferal','balram@gmail.com','1984-03-03','myssn 1');
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
  `city` varchar(100) DEFAULT NULL,
  `cityRejectedDate` date DEFAULT NULL,
  `cityRejectedAfter6Months` date DEFAULT NULL,
  `county` varchar(100) DEFAULT NULL,
  `countyRejectedDate` date DEFAULT NULL,
  `countyRejectedAfter6Months` date DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `stateRejectedDate` date DEFAULT NULL,
  `stateRejectedAfter6Months` date DEFAULT NULL,
  `other` varchar(100) DEFAULT NULL,
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
INSERT INTO `govtclaimdetails` VALUES (1,'2006-06-06','2001-01-01','2002-02-02','2013/2/33','2010-01-01','2010-02-02','2011/3/5','2010-03-03','2010-04-04','2013/5/4','2010-05-05','2010-06-06','2010/5/3','2010-07-07','2010-08-08');
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
INSERT INTO `medicalinsurance` VALUES (1,'named insured','insurance company','address','city','state','zip','222-333-4444','12','33','344','55');
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
  `noteId` int(11) DEFAULT NULL,
  `note` varchar(300) DEFAULT NULL,
  `createdDate` date DEFAULT NULL,
  `modifiedDate` date DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`fileNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `miscinfo`
--

LOCK TABLES `miscinfo` WRITE;
/*!40000 ALTER TABLE `miscinfo` DISABLE KEYS */;
INSERT INTO `miscinfo` VALUES (1,1,'misc note','2010-01-01','2010-02-02','misc description');
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
INSERT INTO `statuteinformation` VALUES (1,'2001-01-01','2002-02-02','2002-03-03','2060-01-01','2020-02-02','2030-03-03','2050-05-05','true');
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
/*!50003 DROP PROCEDURE IF EXISTS `addGeneralInformation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addGeneralInformation`(generalInfo text)
BEGIN
	SET @fileNo = ExtractValue(generalInfo,'/generalInfo/fileNo');
	SET @address = ExtractValue(generalInfo,'/generalInfo/address');
	SET @aptNo = ExtractValue(generalInfo,'/generalInfo/aptNo');
	SET @initialInfo = ExtractValue(generalInfo,'/generalInfo/initialInfo');
	SET @defendantName = ExtractValue(generalInfo,'/generalInfo/defendantName');
	SET @city = ExtractValue(generalInfo,'/generalInfo/city');
	SET @evidence1 = ExtractValue(generalInfo,'/generalInfo/evidence1');
	SET @caseType = ExtractValue(generalInfo,'/generalInfo/caseType');
	SET @state = ExtractValue(generalInfo,'/generalInfo/state');
	SET @evidence2 = ExtractValue(generalInfo,'/generalInfo/evidence2');
	SET @otherType = ExtractValue(generalInfo,'/generalInfo/otherType');
	SET @homePhone = ExtractValue(generalInfo,'/generalInfo/homePhone');
	SET @caseStatus = ExtractValue(generalInfo,'/generalInfo/caseStatus');
	SET @cellPhone = ExtractValue(generalInfo,'/generalInfo/cellPhone');
	SET @originatingAttorney = ExtractValue(generalInfo,'/generalInfo/originatingAttorney');
	SET @accidentDate = ExtractValue(generalInfo,'/generalInfo/accidentDate');
	SET @workPhone = ExtractValue(generalInfo,'/generalInfo/workPhone');
	SET @assignedAttorney = ExtractValue(generalInfo,'/generalInfo/assignedAttorney');
	SET @clientCreated = ExtractValue(generalInfo,'/generalInfo/clientCreated');
	SET @drivingLicense = ExtractValue(generalInfo,'/generalInfo/drivingLicense');
	SET @refferal = ExtractValue(generalInfo,'/generalInfo/refferal');
	SET @email = ExtractValue(generalInfo,'/generalInfo/email');
	SET @dateOfBirth = ExtractValue(generalInfo,'/generalInfo/dateOfBirth');
	SET @SSN = ExtractValue(generalInfo,'/generalInfo/SSN');
	SET @firstName = ExtractValue(generalInfo,'/generalInfo/firstName');
	SET @lastName = ExtractValue(generalInfo,'/generalInfo/lastName');

	SET @CheckExists = 0;
	SELECT count(*) INTO @CheckExists FROM generalinformation  WHERE fileNo = @fileNo;

	IF (@CheckExists > 0) THEN 
        Update generalinformation
		SET address = @address,
			aptNo = @aptNo,
			initialInfo = @initialInfo,
			defendantName = @defendantName,
			city = @city,
			evidence1 = @evidence1,
			caseType = @caseType,
			state = @state,
			evidence2 = @evidence2,
			otherType = @otherType,
			homePhone = @homePhone,
			caseStatus = @caseStatus,
			cellPhone = @cellPhone,
			originatingAttorney = @originatingAttorney,
			accidentDate = substring(@accidentDate,1,locate('T', @accidentDate)-1),
			workPhone = @workPhone,
			assignedAttorney = @assignedAttorney,
			clientCreated = substring(@clientCreated,1,locate('T', @clientCreated)-1),
			drivingLicense = @drivingLicense,
			refferal = @refferal,
			email = @email,
			dateOfBirth = substring(@dateOfBirth,1,locate('T', @dateOfBirth)-1),
			SSN = @SSN			
		WHERE fileNo = @fileNo;

		UPDATE clients
		SET firstName = @firstName,
			lastName = @lastName
		WHERE fileNo = @fileNo;
    ELSE 
        select 'insert command';
    END IF; 
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-03-17  9:40:02
