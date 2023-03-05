-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: myprojectbundledb
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project` (
  `projectId` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `developerId` varchar(20) NOT NULL,
  `projectName` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `projectNameEn` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT 'project',
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `category` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '프로젝트',
  `condition` char(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '완성',
  `releasedate` date DEFAULT NULL,
  `github` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `projectIndex` int NOT NULL,
  PRIMARY KEY (`projectId`),
  KEY `developerId` (`developerId`),
  CONSTRAINT `developerId` FOREIGN KEY (`developerId`) REFERENCES `member` (`memberId`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES ('checkP1','check','테스트','test','','web','complete','2022-12-02','https://github.com/...',1),('checkP10','check','테스트','test','','web','complete','2022-12-08','https://github.com/...',10),('checkP11','check','테스트','test','','web','complete','2022-12-01','https://github.com/...',11),('checkP12','check','프로젝트','project','프로젝트이다','web','fix','2022-12-03','https://github.com/...',12),('checkP13','check','프로젝트','project','프로젝트 입니다','web','fix','2022-12-03','https://github.com/...',13),('checkP14','check','시연영상','project1','테스트 중입니다~!','web','continue','2022-12-02','https://github.com/...',14),('checkP15','check','치즈','cheese','테스트용입니다','custom','complete','2022-11-01','https://github.com/...',15),('checkP2','check','테스트','test','','web','complete','2022-12-27','https://github.com/...',2),('checkP3','check','테스트','test','','web','complete','2022-12-20','https://github.com/...',3),('checkP4','check','테스트','test','','web','complete','2022-12-07','https://github.com/...',4),('checkP5','check','테스트','test','','web','complete','2022-12-01','https://github.com/...',5),('checkP6','check','테스트','test','','web','complete','2022-12-01','https://github.com/...',6),('checkP7','check','테스트','test','','web','complete','2022-11-30','https://github.com/...',7),('checkP8','check','테스트','test','','web','complete','2022-11-28','https://github.com/...',8),('checkP9','check','테스트','test','','web','complete','2022-12-06','https://github.com/...',9),('helloP1','hello','2D플랫포머게임','2DplatformerGame','2D 플랫포머 게임을 만들어보았습니다','game','complete','2022-11-30','https://github.com/...',1),('helloP2','hello','프로젝트1','project1','프로젝트1','custom','complete','2022-12-01','https://github.com/...',2),('helloP3','hello','프로젝트2','project2','프로젝트2 입니다','custom','complete','2022-12-01','https://github.com/...',3),('helloP4','hello','프로젝트3','project3','프로젝트3!!','custom','fix','2022-12-01','https://github.com/...',4),('test123P1','test123','프로젝트','project','프로젝트입니다','web','complete','2022-12-02','https://github.com/...',1);
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-05  2:18:51
