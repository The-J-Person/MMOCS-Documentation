-- MySQL dump 10.13  Distrib 5.6.23, for Win64 (x86_64)
--
-- Host: localhost    Database: test
-- ------------------------------------------------------
-- Server version	5.6.24-log

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
-- Table structure for table `activemonsters`
--

DROP TABLE IF EXISTS `activemonsters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activemonsters` (
  `PKID` int(11) NOT NULL AUTO_INCREMENT,
  `TypeID` int(11) NOT NULL,
  `MaxHP` int(11) NOT NULL,
  `X` int(11) NOT NULL,
  `Y` int(11) NOT NULL,
  `CurrentHP` int(11) NOT NULL,
  `Hunger` int(11) NOT NULL,
  PRIMARY KEY (`PKID`),
  KEY `MonsterType_Source` (`TypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `charequipment`
--

DROP TABLE IF EXISTS `charequipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `charequipment` (
  `UserID` int(11) NOT NULL,
  `EID` int(11) NOT NULL,
  PRIMARY KEY (`UserID`,`EID`),
  KEY `Equipment_source` (`EID`),
  CONSTRAINT `Equipment_source` FOREIGN KEY (`EID`) REFERENCES `equipment` (`EID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `charinv`
--

DROP TABLE IF EXISTS `charinv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `charinv` (
  `UserID` int(11) NOT NULL,
  `RID` int(11) NOT NULL,
  `Amount` int(11) NOT NULL,
  PRIMARY KEY (`UserID`,`RID`),
  KEY `Equipment_sourceInv` (`RID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `equipment`
--

DROP TABLE IF EXISTS `equipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `equipment` (
  `EID` int(11) NOT NULL,
  `Name` varchar(200) NOT NULL,
  `EqIMG` varchar(200) NOT NULL,
  PRIMARY KEY (`EID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `playerlocation`
--

DROP TABLE IF EXISTS `playerlocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `playerlocation` (
  `UserID` int(11) NOT NULL,
  `X` int(11) NOT NULL,
  `Y` int(11) NOT NULL,
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tileobject`
--

DROP TABLE IF EXISTS `tileobject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tileobject` (
  `X` int(11) NOT NULL,
  `Y` int(11) NOT NULL,
  `OID` int(11) NOT NULL,
  PRIMARY KEY (`X`,`Y`),
  KEY `Monster_Source` (`OID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tilesurface`
--

DROP TABLE IF EXISTS `tilesurface`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tilesurface` (
  `X` int(11) NOT NULL,
  `Y` int(11) NOT NULL,
  `SID` int(11) NOT NULL,
  PRIMARY KEY (`X`,`Y`),
  KEY `Surface_Source` (`SID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `UserID` int(11) NOT NULL AUTO_INCREMENT,
  `Username` varchar(20) NOT NULL,
  `Password` varchar(200) NOT NULL,
  `Salt` varchar(200) NOT NULL,
  `eMail` varchar(200) DEFAULT NULL,
  `Role` int(11) NOT NULL,
  `SignDate` date DEFAULT NULL,
  `Active` bit(1) NOT NULL,
  `UserIMG` varchar(200) NOT NULL,
  `Level` int(11) NOT NULL,
  `CurrentXP` int(11) NOT NULL,
  `ActivationCode` varchar(200) NOT NULL,
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'test'
--
/*!50003 DROP PROCEDURE IF EXISTS `Add_Equipment_To_Player` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Add_Equipment_To_Player`(
		IN UID INTEGER, IN Eq INTEGER, OUT Result INTEGER)
BEGIN
	IF(SELECT COUNT(*) FROM user WHERE UserID = UID) = 0
    THEN
		SET Result = 0;
	ELSEIF(SELECT COUNT(*) FROM equipment WHERE EID = Eq) = 0
    THEN
		SET Result = 0;
	ELSE 
		IF(SELECT COUNT(*) FROM charequipment WHERE UserID = UID AND EID = Eq) = 1
        THEN
			SET Result = 1;
		ELSE
			SET Result = 2;
			INSERT INTO charequipment (UserID ,EID ) VALUES(UID ,Eq);
		END IF;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Add_Monster` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Add_Monster`(
		IN MType INTEGER, IN MMaxHP INTEGER,IN MX INTEGER, IN MY INTEGER, IN MCurrentHP INTEGER, IN MHunger INTEGER, OUT Result INTEGER)
BEGIN
	
	
    
    IF (SELECT
    (SELECT COUNT(*) FROM activemonsters WHERE MX = X AND MY = Y)+
	(SELECT COUNT(*) FROM playerlocation WHERE MX = X AND MY = Y)+
    (SELECT COUNT(*) FROM tileobject WHERE MX = X AND MY = Y)
    AS Total) > 0
    THEN
		SET Result = -1;
    ELSE
		INSERT INTO activemonsters (TypeID ,MaxHP ,X ,Y ,CurrentHP ,Hunger) VALUES(MType ,MMaxHP ,MX ,MY ,MCurrentHP ,MHunger);
        SET Result = ( SELECT PKID FROM activemonsters WHERE X = MX AND Y = MY );
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Add_User` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Add_User`(
		IN UserName2 VARCHAR(20), IN Password2 VARCHAR(200),IN Salt2 VARCHAR(200), IN eMail2 VARCHAR(200), IN UserIMG2 VARCHAR(200), IN ActivationCode2 VARCHAR(200), OUT Result INTEGER)
BEGIN
	IF (SELECT COUNT(*) FROM user WHERE UserName LIKE UserName2) = 1
    THEN
		SET Result = 0;
    ELSE
		SET Result = 1;
		INSERT INTO User (Username, Password, Salt, eMail, Role, Active, UserIMG, Level, CurrentXP, ActivationCode) VALUES(UserName2 ,Password2 ,Salt2 ,eMail2, 0,0 ,UserIMG2, 0, 0 ,ActivationCode2);
        
        SET @ID := (SELECT UserID FROM user WHERE Username LIKE UserName2);
        
        INSERT INTO playerlocation VALUES (@ID , 0 ,0);
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Change_Activity` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Change_Activity`(
		IN Username2 VARCHAR(20), IN ActivationCode2 VARCHAR(200), OUT Result INTEGER)
BEGIN
	IF (SELECT COUNT(*) FROM user WHERE Username LIKE Username2) = 0
    THEN
		SET Result = 0;
    ELSEIF (SELECT COUNT(*) FROM user WHERE Username LIKE Username2 AND ActivationCode LIKE ActivationCode2) = 0
    THEN
		SET Result = 1;
	ELSE
		SET Result = 2;
		UPDATE user SET Active = 1 WHERE Username LIKE Username2;
	END IF;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Get_coord_By_ID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Get_coord_By_ID`(
		IN Xc INTEGER, IN Yc INTEGER, OUT Result INTEGER)
BEGIN
	IF(SELECT COUNT(*) FROM playerlocation WHERE X = Xc AND Y = Yc) = 0
    THEN
		SET Result = -1;
	ELSE
		SELECT UserID INTO Result FROM playerlocation WHERE X = Xc AND Y = Yc ;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Get_Inventory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Get_Inventory`(
		IN User INTEGER, OUT Result INTEGER)
BEGIN
	IF(SELECT COUNT(*) FROM user WHERE UserID = User) = 0
    THEN
		SET Result = 0;
	ELSE
		SET Result = 1;
		SELECT RID,Amount FROM charinv
		WHERE UserID = User;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Get_Map` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Get_Map`()
BEGIN
    SELECT tilesurface.X, tilesurface.Y, tilesurface.SID, tileobject.OID
    FROM tilesurface , tileobject
    WHERE tilesurface.X = tileobject.X
    AND tilesurface.Y = tileobject.Y
    
    UNION
    
    SELECT tilesurface.X, tilesurface.Y, tilesurface.SID, -1
    FROM tilesurface
    WHERE (tilesurface.X,tilesurface.Y) NOT IN ( SELECT X,Y
												FROM tileobject
												);
   
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Get_Monsters` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Get_Monsters`()
BEGIN
	SELECT * FROM activemonsters;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Get_Monster_By_Coordinate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Get_Monster_By_Coordinate`(
		OUT MID INTEGER, OUT MType INTEGER, OUT MMaxHP INTEGER,IN MX INTEGER, IN MY INTEGER, OUT MCurrentHP INTEGER, OUT MHunger INTEGER, OUT Result INTEGER)
BEGIN
	IF(SELECT COUNT(*) FROM activemonsters WHERE X = MX AND Y = MY) = 0
    THEN
		SET Result = 0;
	ELSE
		SET Result = 1;
        SELECT PKID, TypeID ,MaxHP ,CurrentHP ,Hunger INTO MID, MType,MMaxHP,MCurrentHP,MHunger FROM activemonsters WHERE X = MX AND Y = MY;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Get_Monster_By_ID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Get_Monster_By_ID`(
		IN MID INTEGER, OUT MType INTEGER, OUT MMaxHP INTEGER,OUT MX INTEGER, OUT MY INTEGER, OUT MCurrentHP INTEGER, OUT MHunger INTEGER, OUT Result INTEGER)
BEGIN
	IF(SELECT COUNT(*) FROM activemonsters WHERE PKID = MID) = 0
    THEN
		SET Result = 0;
	ELSE
		SET Result = 1;
        SELECT TypeID ,MaxHP, X, Y ,CurrentHP ,Hunger INTO MType,MMaxHP,MX,MY,MCurrentHP,MHunger FROM activemonsters WHERE PKID = MID;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Get_Player_By_ID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Get_Player_By_ID`(
		IN User INTEGER, OUT Result INTEGER)
BEGIN
	IF(SELECT COUNT(*) FROM user WHERE UserID = User) = 0
    THEN
		SET Result = 0;
	ELSEIF(SELECT COUNT(*) FROM user WHERE UserID = User AND Role = 0) = 1
    THEN
		SET Result = 1;
	ELSE
		SET Result = 2;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Get_Player_Coordinate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Get_Player_Coordinate`(
		IN ID INTEGER, OUT cx INTEGER, OUT cy INTEGER, OUT Result INTEGER)
BEGIN
	IF(SELECT COUNT(*) FROM playerlocation WHERE UserID = ID) = 0
    THEN
		SET Result = 0;
	ELSE
		SET Result = 1;
		SELECT X,Y INTO cx,cy FROM playerlocation WHERE UserID = ID;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Get_Salt` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Get_Salt`(
		IN User VARCHAR(20), OUT Result VARCHAR(200))
BEGIN
	IF(SELECT COUNT(*) FROM user WHERE Username = User) = 0
    THEN
		SET Result = '';
	ELSE
		SET Result = ( SELECT Salt FROM user WHERE Username = User) ;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Get_Tile` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Get_Tile`(
		IN Xc INTEGER, IN Yc INTEGER, OUT surface INTEGER, OUT object INTEGER)
BEGIN
	
    SELECT SID INTO surface FROM tilesurface WHERE X = Xc AND Y = Yc;
    
    IF( SELECT COUNT(*) FROM tileobject WHERE X = Xc AND Y = Yc) > 0
    THEN
		SELECT OID INTO object FROM tileobject WHERE X = Xc AND Y = Yc;
	ELSEIF( SELECT COUNT(*) FROM playerlocation WHERE X = Xc AND Y = Yc) > 0
    THEN
		SET object = 0;
	ELSEIF(SELECT COUNT(*) FROM activemonsters WHERE X = Xc AND Y = Yc) > 0
    THEN
		SET object = 1;
    ELSE
		SET object = -1;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Is_Monster_Dead` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Is_Monster_Dead`(
		IN ID INTEGER, OUT Result INTEGER)
BEGIN
	DECLARE HP INT DEFAULT 0;
	IF(SELECT COUNT(*) FROM activemonsters WHERE ID = PKID) = 0
    THEN
		SET Result = 0;
	ELSE
		SELECT CurrentHP INTO HP FROM activemonsters WHERE ID = PKID;
        IF(HP<1)
        THEN
			SET Result = 1;
		ELSE
			SET Result = 2;
		END IF;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Login` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Login`(
		IN UserName2 VARCHAR(20), IN Password2 VARCHAR(200), OUT Result INTEGER)
BEGIN
	IF(SELECT COUNT(*) FROM user WHERE Username LIKE UserName2) = 0
    THEN
		SET Result = 0;
	ELSEIF(SELECT COUNT(*) FROM user WHERE Username LIKE UserName2 AND Password LIKE Password2) = 0
    THEN
		SET Result = -1;
	ELSEIF(SELECT COUNT(*) FROM user WHERE Username LIKE UserName2 AND Password LIKE Password2 AND Active = 0) = 1
    THEN
		SET Result = -2;
	ELSE
		SET Result = (SELECT UserID FROM user WHERE Username LIKE UserName2 AND Password LIKE Password2);
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Move_Monster` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Move_Monster`(
		IN MID INTEGER, IN Xc INTEGER, IN Yc INTEGER, OUT Result INTEGER)
BEGIN
	IF(SELECT COUNT(*) FROM activemonsters WHERE PKID = MID) = 0
    THEN
		SET Result = 0;
	ELSE
		SET Result = 1;
        UPDATE activemonsters SET X = Xc, Y = Yc WHERE PKID = MID;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Remove_Equipment_From_Player` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Remove_Equipment_From_Player`(
		IN UID INTEGER, IN Eq INTEGER, OUT Result INTEGER)
BEGIN
	IF(SELECT COUNT(*) FROM user WHERE UserID = UID) = 0
    THEN
		SET Result = 0;
	ELSEIF(SELECT COUNT(*) FROM equipment WHERE EID = Eq) = 0
    THEN
		SET Result = 0;
	ELSE 
		IF(SELECT COUNT(*) FROM charequipment WHERE UserID = UID AND EID = Eq) = 0
        THEN
			SET Result = 2;
		ELSE
			SET Result = 1;
			DELETE FROM charequipment WHERE UserID = UID AND EID = Eq;
		END IF;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Remove_Monster` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Remove_Monster`(
		IN ID INTEGER, OUT Result INTEGER)
BEGIN
	IF(SELECT COUNT(*) FROM activemonsters WHERE ID = PKID) = 0
    THEN
		SET Result = 0;
	ELSE
		DELETE FROM activemonsters WHERE ID = PKID;
        SET Result = 1;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Set_Tile` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Set_Tile`(
		IN Xc INTEGER, IN Yc INTEGER,IN FloorID INTEGER, IN ObjectID INTEGER)
BEGIN

	UPDATE tilesurface SET X = Xc , Y = Yc , SID = FloorID WHERE X = Xc AND Y = Yc;
    
    IF ( ObjectID = -1 OR ObjectID = 1 OR ObjectID = 2 )
    THEN
		DELETE FROM tileobject WHERE X = Xc AND Y = Yc;
	ELSE
		UPDATE tileobject SET X = Xc , Y = Yc , OID = ObjectID WHERE X = Xc AND Y = Yc;
	END IF;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Update_Monster_HP` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Update_Monster_HP`(
		IN ID INTEGER , IN DMG INTEGER, OUT Result INTEGER)
BEGIN

	IF(SELECT COUNT(*) FROM activemonsters WHERE ID = PKID) = 0
    THEN
		SET Result = 0;
	ELSE
		UPDATE activemonsters SET CurrentHP = CurrentHP - DMG WHERE ID = PKID;
        SET Result = 1;
	END IF;
		
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Update_Player_Location` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Update_Player_Location`(
		IN PlayerID INTEGER, IN Xc INTEGER,IN Yc INTEGER, OUT Result INTEGER)
BEGIN
	IF (SELECT COUNT(*) FROM user WHERE UserID LIKE PlayerID) = 0
    THEN
		SET Result = 0;
    ELSE
		SET Result = 1;
		UPDATE playerlocation SET X = Xc, Y = Yc WHERE UserID = PlayerID;      
	END IF;
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

-- Dump completed on 2015-06-01 17:59:19
