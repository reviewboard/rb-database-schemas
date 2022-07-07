-- MySQL dump 10.13  Distrib 8.0.29, for macos12.2 (arm64)
--
-- Host: kuribo    Database: rb3
-- ------------------------------------------------------
-- Server version	5.7.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `accounts_localsiteprofile`
--

DROP TABLE IF EXISTS `accounts_localsiteprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_localsiteprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `profile_id` int(11) NOT NULL,
  `local_site_id` int(11) DEFAULT NULL,
  `permissions` longtext,
  `direct_incoming_request_count` int(11) DEFAULT NULL,
  `total_incoming_request_count` int(11) DEFAULT NULL,
  `pending_outgoing_request_count` int(11) DEFAULT NULL,
  `total_outgoing_request_count` int(11) DEFAULT NULL,
  `starred_public_request_count` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`local_site_id`),
  UNIQUE KEY `profile_id` (`profile_id`,`local_site_id`),
  KEY `accounts_localsiteprofile_6340c63c` (`user_id`),
  KEY `accounts_localsiteprofile_5948a8a3` (`profile_id`),
  KEY `accounts_localsiteprofile_c467b315` (`local_site_id`),
  CONSTRAINT `local_site_id_refs_id_02a402db` FOREIGN KEY (`local_site_id`) REFERENCES `site_localsite` (`id`),
  CONSTRAINT `profile_id_refs_id_e7b49a70` FOREIGN KEY (`profile_id`) REFERENCES `accounts_profile` (`id`),
  CONSTRAINT `user_id_refs_id_4d31e778` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_localsiteprofile`
--

LOCK TABLES `accounts_localsiteprofile` WRITE;
/*!40000 ALTER TABLE `accounts_localsiteprofile` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_localsiteprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_profile`
--

DROP TABLE IF EXISTS `accounts_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `first_time_setup_done` tinyint(1) NOT NULL,
  `should_send_email` tinyint(1) NOT NULL,
  `should_send_own_updates` tinyint(1) NOT NULL,
  `collapsed_diffs` tinyint(1) NOT NULL,
  `wordwrapped_diffs` tinyint(1) NOT NULL,
  `syntax_highlighting` tinyint(1) NOT NULL,
  `is_private` tinyint(1) NOT NULL,
  `open_an_issue` tinyint(1) NOT NULL,
  `default_use_rich_text` tinyint(1) DEFAULT NULL,
  `show_closed` tinyint(1) NOT NULL,
  `sort_review_request_columns` varchar(256) NOT NULL,
  `sort_dashboard_columns` varchar(256) NOT NULL,
  `sort_submitter_columns` varchar(256) NOT NULL,
  `sort_group_columns` varchar(256) NOT NULL,
  `review_request_columns` varchar(256) NOT NULL,
  `dashboard_columns` varchar(256) NOT NULL,
  `submitter_columns` varchar(256) NOT NULL,
  `group_columns` varchar(256) NOT NULL,
  `timezone` varchar(30) NOT NULL,
  `settings` longtext,
  `extra_data` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `user_id_refs_id_76babe75` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_profile`
--

LOCK TABLES `accounts_profile` WRITE;
/*!40000 ALTER TABLE `accounts_profile` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_profile_starred_groups`
--

DROP TABLE IF EXISTS `accounts_profile_starred_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_profile_starred_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profile_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `profile_id` (`profile_id`,`group_id`),
  KEY `accounts_profile_starred_groups_5948a8a3` (`profile_id`),
  KEY `accounts_profile_starred_groups_5f412f9a` (`group_id`),
  CONSTRAINT `group_id_refs_id_b2b4d49b` FOREIGN KEY (`group_id`) REFERENCES `reviews_group` (`id`),
  CONSTRAINT `profile_id_refs_id_57362a69` FOREIGN KEY (`profile_id`) REFERENCES `accounts_profile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_profile_starred_groups`
--

LOCK TABLES `accounts_profile_starred_groups` WRITE;
/*!40000 ALTER TABLE `accounts_profile_starred_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_profile_starred_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_profile_starred_review_requests`
--

DROP TABLE IF EXISTS `accounts_profile_starred_review_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_profile_starred_review_requests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profile_id` int(11) NOT NULL,
  `reviewrequest_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `profile_id` (`profile_id`,`reviewrequest_id`),
  KEY `accounts_profile_starred_review_requests_5948a8a3` (`profile_id`),
  KEY `accounts_profile_starred_review_requests_feaccf73` (`reviewrequest_id`),
  CONSTRAINT `profile_id_refs_id_1728f51d` FOREIGN KEY (`profile_id`) REFERENCES `accounts_profile` (`id`),
  CONSTRAINT `reviewrequest_id_refs_id_342ff1ac` FOREIGN KEY (`reviewrequest_id`) REFERENCES `reviews_reviewrequest` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_profile_starred_review_requests`
--

LOCK TABLES `accounts_profile_starred_review_requests` WRITE;
/*!40000 ALTER TABLE `accounts_profile_starred_review_requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_profile_starred_review_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_reviewrequestvisit`
--

DROP TABLE IF EXISTS `accounts_reviewrequestvisit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_reviewrequestvisit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `review_request_id` int(11) NOT NULL,
  `timestamp` datetime NOT NULL,
  `visibility` varchar(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`review_request_id`),
  KEY `accounts_reviewrequestvisit_6340c63c` (`user_id`),
  KEY `accounts_reviewrequestvisit_17900555` (`review_request_id`),
  KEY `accounts_reviewrequestvisit_23858d92` (`user_id`,`visibility`),
  CONSTRAINT `review_request_id_refs_id_0943e99f` FOREIGN KEY (`review_request_id`) REFERENCES `reviews_reviewrequest` (`id`),
  CONSTRAINT `user_id_refs_id_94e9899f` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_reviewrequestvisit`
--

LOCK TABLES `accounts_reviewrequestvisit` WRITE;
/*!40000 ALTER TABLE `accounts_reviewrequestvisit` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_reviewrequestvisit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_trophy`
--

DROP TABLE IF EXISTS `accounts_trophy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_trophy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(100) NOT NULL,
  `received_date` datetime NOT NULL,
  `review_request_id` int(11) NOT NULL,
  `local_site_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `accounts_trophy_17900555` (`review_request_id`),
  KEY `accounts_trophy_c467b315` (`local_site_id`),
  KEY `accounts_trophy_6340c63c` (`user_id`),
  CONSTRAINT `local_site_id_refs_id_babe9a5d` FOREIGN KEY (`local_site_id`) REFERENCES `site_localsite` (`id`),
  CONSTRAINT `review_request_id_refs_id_7fc332cd` FOREIGN KEY (`review_request_id`) REFERENCES `reviews_reviewrequest` (`id`),
  CONSTRAINT `user_id_refs_id_835b8c07` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_trophy`
--

LOCK TABLES `accounts_trophy` WRITE;
/*!40000 ALTER TABLE `accounts_trophy` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_trophy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attachments_fileattachment`
--

DROP TABLE IF EXISTS `attachments_fileattachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attachments_fileattachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `caption` varchar(256) NOT NULL,
  `draft_caption` varchar(256) NOT NULL,
  `orig_filename` varchar(256) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `local_site_id` int(11) DEFAULT NULL,
  `uuid` varchar(255) NOT NULL,
  `file` varchar(512) DEFAULT NULL,
  `mimetype` varchar(256) NOT NULL,
  `repo_path` varchar(1024) DEFAULT NULL,
  `repo_revision` varchar(64) DEFAULT NULL,
  `repository_id` int(11) DEFAULT NULL,
  `added_in_filediff_id` int(11) DEFAULT NULL,
  `attachment_history_id` int(11) DEFAULT NULL,
  `attachment_revision` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `attachments_fileattachment_6340c63c` (`user_id`),
  KEY `attachments_fileattachment_c467b315` (`local_site_id`),
  KEY `attachments_fileattachment_3e277a4b` (`repo_revision`),
  KEY `attachments_fileattachment_a322ed1e` (`repository_id`),
  KEY `attachments_fileattachment_4b31b03f` (`added_in_filediff_id`),
  KEY `attachments_fileattachment_3a1832b9` (`attachment_history_id`),
  CONSTRAINT `added_in_filediff_id_refs_id_4b23a765` FOREIGN KEY (`added_in_filediff_id`) REFERENCES `diffviewer_filediff` (`id`),
  CONSTRAINT `attachment_history_id_refs_id_0cafee3b` FOREIGN KEY (`attachment_history_id`) REFERENCES `attachments_fileattachmenthistory` (`id`),
  CONSTRAINT `local_site_id_refs_id_24157a94` FOREIGN KEY (`local_site_id`) REFERENCES `site_localsite` (`id`),
  CONSTRAINT `repository_id_refs_id_3a88871a` FOREIGN KEY (`repository_id`) REFERENCES `scmtools_repository` (`id`),
  CONSTRAINT `user_id_refs_id_fe867de9` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attachments_fileattachment`
--

LOCK TABLES `attachments_fileattachment` WRITE;
/*!40000 ALTER TABLE `attachments_fileattachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `attachments_fileattachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attachments_fileattachmenthistory`
--

DROP TABLE IF EXISTS `attachments_fileattachmenthistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attachments_fileattachmenthistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `display_position` int(11) NOT NULL,
  `latest_revision` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attachments_fileattachmenthistory`
--

LOCK TABLES `attachments_fileattachmenthistory` WRITE;
/*!40000 ALTER TABLE `attachments_fileattachmenthistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `attachments_fileattachmenthistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_5f412f9a` (`group_id`),
  KEY `auth_group_permissions_83d7f98b` (`permission_id`),
  CONSTRAINT `group_id_refs_id_f4b32aac` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `permission_id_refs_id_6ba0f519` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_37ef4eb4` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_d043b34a` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add cors model',1,'add_corsmodel'),(2,'Can change cors model',1,'change_corsmodel'),(3,'Can delete cors model',1,'delete_corsmodel'),(4,'Can add log entry',2,'add_logentry'),(5,'Can change log entry',2,'change_logentry'),(6,'Can delete log entry',2,'delete_logentry'),(7,'Can add permission',3,'add_permission'),(8,'Can change permission',3,'change_permission'),(9,'Can delete permission',3,'delete_permission'),(10,'Can add group',4,'add_group'),(11,'Can change group',4,'change_group'),(12,'Can delete group',4,'delete_group'),(13,'Can add user',5,'add_user'),(14,'Can change user',5,'change_user'),(15,'Can delete user',5,'delete_user'),(16,'Can add content type',6,'add_contenttype'),(17,'Can change content type',6,'change_contenttype'),(18,'Can delete content type',6,'delete_contenttype'),(19,'Can add site',7,'add_site'),(20,'Can change site',7,'change_site'),(21,'Can delete site',7,'delete_site'),(22,'Can add session',8,'add_session'),(23,'Can change session',8,'change_session'),(24,'Can delete session',8,'delete_session'),(25,'Can add registered extension',9,'add_registeredextension'),(26,'Can change registered extension',9,'change_registeredextension'),(27,'Can delete registered extension',9,'delete_registeredextension'),(28,'Can add Integration Configuration',10,'add_integrationconfig'),(29,'Can change Integration Configuration',10,'change_integrationconfig'),(30,'Can delete Integration Configuration',10,'delete_integrationconfig'),(31,'Can add Stored consent data',11,'add_storedconsentdata'),(32,'Can change Stored consent data',11,'change_storedconsentdata'),(33,'Can delete Stored consent data',11,'delete_storedconsentdata'),(34,'Can add site configuration',12,'add_siteconfiguration'),(35,'Can change site configuration',12,'change_siteconfiguration'),(36,'Can delete site configuration',12,'delete_siteconfiguration'),(37,'Can add application',13,'add_application'),(38,'Can change application',13,'change_application'),(39,'Can delete application',13,'delete_application'),(40,'Can add grant',14,'add_grant'),(41,'Can change grant',14,'change_grant'),(42,'Can delete grant',14,'delete_grant'),(43,'Can add access token',15,'add_accesstoken'),(44,'Can change access token',15,'change_accesstoken'),(45,'Can delete access token',15,'delete_accesstoken'),(46,'Can add refresh token',16,'add_refreshtoken'),(47,'Can change refresh token',16,'change_refreshtoken'),(48,'Can delete refresh token',16,'delete_refreshtoken'),(49,'Can add Review Request Visit',17,'add_reviewrequestvisit'),(50,'Can change Review Request Visit',17,'change_reviewrequestvisit'),(51,'Can delete Review Request Visit',17,'delete_reviewrequestvisit'),(52,'Can add Profile',18,'add_profile'),(53,'Can change Profile',18,'change_profile'),(54,'Can delete Profile',18,'delete_profile'),(55,'Can add Local Site Profile',19,'add_localsiteprofile'),(56,'Can change Local Site Profile',19,'change_localsiteprofile'),(57,'Can delete Local Site Profile',19,'delete_localsiteprofile'),(58,'Can add Trophy',20,'add_trophy'),(59,'Can change Trophy',20,'change_trophy'),(60,'Can delete Trophy',20,'delete_trophy'),(61,'Can add File Attachment History',21,'add_fileattachmenthistory'),(62,'Can change File Attachment History',21,'change_fileattachmenthistory'),(63,'Can delete File Attachment History',21,'delete_fileattachmenthistory'),(64,'Can add File Attachment',22,'add_fileattachment'),(65,'Can change File Attachment',22,'change_fileattachment'),(66,'Can delete File Attachment',22,'delete_fileattachment'),(67,'Can add Change Description',23,'add_changedescription'),(68,'Can change Change Description',23,'change_changedescription'),(69,'Can delete Change Description',23,'delete_changedescription'),(70,'Can add Legacy File Diff Data',24,'add_legacyfilediffdata'),(71,'Can change Legacy File Diff Data',24,'change_legacyfilediffdata'),(72,'Can delete Legacy File Diff Data',24,'delete_legacyfilediffdata'),(73,'Can add Raw File Diff Data',25,'add_rawfilediffdata'),(74,'Can change Raw File Diff Data',25,'change_rawfilediffdata'),(75,'Can delete Raw File Diff Data',25,'delete_rawfilediffdata'),(76,'Can add File Diff',26,'add_filediff'),(77,'Can change File Diff',26,'change_filediff'),(78,'Can delete File Diff',26,'delete_filediff'),(79,'Can add Diff Set',27,'add_diffset'),(80,'Can change Diff Set',27,'change_diffset'),(81,'Can delete Diff Set',27,'delete_diffset'),(82,'Can add Diff Set History',28,'add_diffsethistory'),(83,'Can change Diff Set History',28,'change_diffsethistory'),(84,'Can delete Diff Set History',28,'delete_diffsethistory'),(85,'Can add Hosting Service Account',29,'add_hostingserviceaccount'),(86,'Can change Hosting Service Account',29,'change_hostingserviceaccount'),(87,'Can delete Hosting Service Account',29,'delete_hostingserviceaccount'),(88,'Can add Webhook',30,'add_webhooktarget'),(89,'Can change Webhook',30,'change_webhooktarget'),(90,'Can delete Webhook',30,'delete_webhooktarget'),(91,'Can add OAuth Application',31,'add_application'),(92,'Can change OAuth Application',31,'change_application'),(93,'Can delete OAuth Application',31,'delete_application'),(94,'Can add Review Group',32,'add_group'),(95,'Can change Review Group',32,'change_group'),(96,'Can delete Review Group',32,'delete_group'),(97,'Can view invite-only Groups',32,'can_view_invite_only_groups'),(98,'Can add Default Reviewer',33,'add_defaultreviewer'),(99,'Can change Default Reviewer',33,'change_defaultreviewer'),(100,'Can delete Default Reviewer',33,'delete_defaultreviewer'),(101,'Can add Diff Comment',34,'add_comment'),(102,'Can change Diff Comment',34,'change_comment'),(103,'Can delete Diff Comment',34,'delete_comment'),(104,'Can add File Attachment Comment',35,'add_fileattachmentcomment'),(105,'Can change File Attachment Comment',35,'change_fileattachmentcomment'),(106,'Can delete File Attachment Comment',35,'delete_fileattachmentcomment'),(107,'Can add General Comment',36,'add_generalcomment'),(108,'Can change General Comment',36,'change_generalcomment'),(109,'Can delete General Comment',36,'delete_generalcomment'),(110,'Can add Screenshot',37,'add_screenshot'),(111,'Can change Screenshot',37,'change_screenshot'),(112,'Can delete Screenshot',37,'delete_screenshot'),(113,'Can add Review Request',38,'add_reviewrequest'),(114,'Can change Review Request',38,'change_reviewrequest'),(115,'Can delete Review Request',38,'delete_reviewrequest'),(116,'Can change status',38,'can_change_status'),(117,'Can submit as another user',38,'can_submit_as_another_user'),(118,'Can edit review request',38,'can_edit_reviewrequest'),(119,'Can add Screenshot Comment',39,'add_screenshotcomment'),(120,'Can change Screenshot Comment',39,'change_screenshotcomment'),(121,'Can delete Screenshot Comment',39,'delete_screenshotcomment'),(122,'Can add Review',40,'add_review'),(123,'Can change Review',40,'change_review'),(124,'Can delete Review',40,'delete_review'),(125,'Can add Review Request Draft',41,'add_reviewrequestdraft'),(126,'Can change Review Request Draft',41,'change_reviewrequestdraft'),(127,'Can delete Review Request Draft',41,'delete_reviewrequestdraft'),(128,'Can add Status Update',42,'add_statusupdate'),(129,'Can change Status Update',42,'change_statusupdate'),(130,'Can delete Status Update',42,'delete_statusupdate'),(131,'Can add Tool',43,'add_tool'),(132,'Can change Tool',43,'change_tool'),(133,'Can delete Tool',43,'delete_tool'),(134,'Can add Repository',44,'add_repository'),(135,'Can change Repository',44,'change_repository'),(136,'Can delete Repository',44,'delete_repository'),(137,'Can add Local Site',45,'add_localsite'),(138,'Can change Local Site',45,'change_localsite'),(139,'Can delete Local Site',45,'delete_localsite'),(140,'Can add Web API Token',46,'add_webapitoken'),(141,'Can change Web API Token',46,'change_webapitoken'),(142,'Can delete Web API Token',46,'delete_webapitoken'),(143,'Can add version',47,'add_version'),(144,'Can change version',47,'change_version'),(145,'Can delete version',47,'delete_version'),(146,'Can add evolution',48,'add_evolution'),(147,'Can change evolution',48,'change_evolution'),(148,'Can delete evolution',48,'delete_evolution');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_6340c63c` (`user_id`),
  KEY `auth_user_groups_5f412f9a` (`group_id`),
  CONSTRAINT `group_id_refs_id_274b862c` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `user_id_refs_id_40c41112` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_6340c63c` (`user_id`),
  KEY `auth_user_user_permissions_83d7f98b` (`permission_id`),
  CONSTRAINT `permission_id_refs_id_35d9ac25` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `user_id_refs_id_4dc23c39` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `changedescs_changedescription`
--

DROP TABLE IF EXISTS `changedescs_changedescription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `changedescs_changedescription` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `timestamp` datetime NOT NULL,
  `public` tinyint(1) NOT NULL,
  `text` longtext NOT NULL,
  `rich_text` tinyint(1) NOT NULL,
  `fields_changed` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `changedescs_changedescription_6340c63c` (`user_id`),
  CONSTRAINT `user_id_refs_id_0305ed81` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `changedescs_changedescription`
--

LOCK TABLES `changedescs_changedescription` WRITE;
/*!40000 ALTER TABLE `changedescs_changedescription` DISABLE KEYS */;
/*!40000 ALTER TABLE `changedescs_changedescription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `corsheaders_corsmodel`
--

DROP TABLE IF EXISTS `corsheaders_corsmodel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `corsheaders_corsmodel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cors` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `corsheaders_corsmodel`
--

LOCK TABLES `corsheaders_corsmodel` WRITE;
/*!40000 ALTER TABLE `corsheaders_corsmodel` DISABLE KEYS */;
/*!40000 ALTER TABLE `corsheaders_corsmodel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diffviewer_diffset`
--

DROP TABLE IF EXISTS `diffviewer_diffset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diffviewer_diffset` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  `revision` int(11) NOT NULL,
  `timestamp` datetime NOT NULL,
  `basedir` varchar(256) NOT NULL,
  `history_id` int(11) DEFAULT NULL,
  `repository_id` int(11) NOT NULL,
  `diffcompat` int(11) NOT NULL,
  `base_commit_id` varchar(64) DEFAULT NULL,
  `extra_data` longtext,
  PRIMARY KEY (`id`),
  KEY `diffviewer_diffset_11f62a9b` (`history_id`),
  KEY `diffviewer_diffset_a322ed1e` (`repository_id`),
  KEY `diffviewer_diffset_37e4c1ec` (`base_commit_id`),
  CONSTRAINT `history_id_refs_id_153db9d3` FOREIGN KEY (`history_id`) REFERENCES `diffviewer_diffsethistory` (`id`),
  CONSTRAINT `repository_id_refs_id_76fa8bca` FOREIGN KEY (`repository_id`) REFERENCES `scmtools_repository` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diffviewer_diffset`
--

LOCK TABLES `diffviewer_diffset` WRITE;
/*!40000 ALTER TABLE `diffviewer_diffset` DISABLE KEYS */;
/*!40000 ALTER TABLE `diffviewer_diffset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diffviewer_diffsethistory`
--

DROP TABLE IF EXISTS `diffviewer_diffsethistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diffviewer_diffsethistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  `timestamp` datetime NOT NULL,
  `last_diff_updated` datetime DEFAULT NULL,
  `extra_data` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diffviewer_diffsethistory`
--

LOCK TABLES `diffviewer_diffsethistory` WRITE;
/*!40000 ALTER TABLE `diffviewer_diffsethistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `diffviewer_diffsethistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diffviewer_filediff`
--

DROP TABLE IF EXISTS `diffviewer_filediff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diffviewer_filediff` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `diffset_id` int(11) NOT NULL,
  `source_file` varchar(1024) NOT NULL,
  `dest_file` varchar(1024) NOT NULL,
  `source_revision` varchar(512) NOT NULL,
  `dest_detail` varchar(512) NOT NULL,
  `binary` tinyint(1) NOT NULL,
  `status` varchar(1) NOT NULL,
  `diff_base64` longtext NOT NULL,
  `diff_hash_id` varchar(40) DEFAULT NULL,
  `raw_diff_hash_id` int(11) DEFAULT NULL,
  `parent_diff_base64` longtext NOT NULL,
  `parent_diff_hash_id` varchar(40) DEFAULT NULL,
  `raw_parent_diff_hash_id` int(11) DEFAULT NULL,
  `extra_data` longtext,
  PRIMARY KEY (`id`),
  KEY `diffviewer_filediff_4657d859` (`diffset_id`),
  KEY `diffviewer_filediff_b2714c41` (`diff_hash_id`),
  KEY `diffviewer_filediff_7881d360` (`raw_diff_hash_id`),
  KEY `diffviewer_filediff_f02ae4d8` (`parent_diff_hash_id`),
  KEY `diffviewer_filediff_1fb2a779` (`raw_parent_diff_hash_id`),
  CONSTRAINT `diff_hash_id_refs_binary_hash_c358dfbd` FOREIGN KEY (`diff_hash_id`) REFERENCES `diffviewer_filediffdata` (`binary_hash`),
  CONSTRAINT `diffset_id_refs_id_c4a01a9e` FOREIGN KEY (`diffset_id`) REFERENCES `diffviewer_diffset` (`id`),
  CONSTRAINT `parent_diff_hash_id_refs_binary_hash_c358dfbd` FOREIGN KEY (`parent_diff_hash_id`) REFERENCES `diffviewer_filediffdata` (`binary_hash`),
  CONSTRAINT `raw_diff_hash_id_refs_id_546721b3` FOREIGN KEY (`raw_diff_hash_id`) REFERENCES `diffviewer_rawfilediffdata` (`id`),
  CONSTRAINT `raw_parent_diff_hash_id_refs_id_546721b3` FOREIGN KEY (`raw_parent_diff_hash_id`) REFERENCES `diffviewer_rawfilediffdata` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diffviewer_filediff`
--

LOCK TABLES `diffviewer_filediff` WRITE;
/*!40000 ALTER TABLE `diffviewer_filediff` DISABLE KEYS */;
/*!40000 ALTER TABLE `diffviewer_filediff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diffviewer_filediffdata`
--

DROP TABLE IF EXISTS `diffviewer_filediffdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diffviewer_filediffdata` (
  `binary_hash` varchar(40) NOT NULL,
  `binary` longtext NOT NULL,
  `extra_data` longtext,
  PRIMARY KEY (`binary_hash`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diffviewer_filediffdata`
--

LOCK TABLES `diffviewer_filediffdata` WRITE;
/*!40000 ALTER TABLE `diffviewer_filediffdata` DISABLE KEYS */;
/*!40000 ALTER TABLE `diffviewer_filediffdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diffviewer_rawfilediffdata`
--

DROP TABLE IF EXISTS `diffviewer_rawfilediffdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diffviewer_rawfilediffdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `binary_hash` varchar(40) NOT NULL,
  `binary` longblob NOT NULL,
  `compression` varchar(1) DEFAULT NULL,
  `extra_data` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `binary_hash` (`binary_hash`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diffviewer_rawfilediffdata`
--

LOCK TABLES `diffviewer_rawfilediffdata` WRITE;
/*!40000 ALTER TABLE `diffviewer_rawfilediffdata` DISABLE KEYS */;
/*!40000 ALTER TABLE `diffviewer_rawfilediffdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_6340c63c` (`user_id`),
  KEY `django_admin_log_37ef4eb4` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_93d2d1f8` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `user_id_refs_id_c0d12874` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'cors model','corsheaders','corsmodel'),(2,'log entry','admin','logentry'),(3,'permission','auth','permission'),(4,'group','auth','group'),(5,'user','auth','user'),(6,'content type','contenttypes','contenttype'),(7,'site','sites','site'),(8,'session','sessions','session'),(9,'registered extension','extensions','registeredextension'),(10,'Integration Configuration','integrations','integrationconfig'),(11,'Stored consent data','privacy','storedconsentdata'),(12,'site configuration','siteconfig','siteconfiguration'),(13,'application','oauth2_provider','application'),(14,'grant','oauth2_provider','grant'),(15,'access token','oauth2_provider','accesstoken'),(16,'refresh token','oauth2_provider','refreshtoken'),(17,'Review Request Visit','accounts','reviewrequestvisit'),(18,'Profile','accounts','profile'),(19,'Local Site Profile','accounts','localsiteprofile'),(20,'Trophy','accounts','trophy'),(21,'File Attachment History','attachments','fileattachmenthistory'),(22,'File Attachment','attachments','fileattachment'),(23,'Change Description','changedescs','changedescription'),(24,'Legacy File Diff Data','diffviewer','legacyfilediffdata'),(25,'Raw File Diff Data','diffviewer','rawfilediffdata'),(26,'File Diff','diffviewer','filediff'),(27,'Diff Set','diffviewer','diffset'),(28,'Diff Set History','diffviewer','diffsethistory'),(29,'Hosting Service Account','hostingsvcs','hostingserviceaccount'),(30,'Webhook','notifications','webhooktarget'),(31,'OAuth Application','oauth','application'),(32,'Review Group','reviews','group'),(33,'Default Reviewer','reviews','defaultreviewer'),(34,'Diff Comment','reviews','comment'),(35,'File Attachment Comment','reviews','fileattachmentcomment'),(36,'General Comment','reviews','generalcomment'),(37,'Screenshot','reviews','screenshot'),(38,'Review Request','reviews','reviewrequest'),(39,'Screenshot Comment','reviews','screenshotcomment'),(40,'Review','reviews','review'),(41,'Review Request Draft','reviews','reviewrequestdraft'),(42,'Status Update','reviews','statusupdate'),(43,'Tool','scmtools','tool'),(44,'Repository','scmtools','repository'),(45,'Local Site','site','localsite'),(46,'Web API Token','webapi','webapitoken'),(47,'version','django_evolution','version'),(48,'evolution','django_evolution','evolution');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_evolution`
--

DROP TABLE IF EXISTS `django_evolution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_evolution` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version_id` int(11) NOT NULL,
  `app_label` varchar(200) NOT NULL,
  `label` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_evolution_f516c2b3` (`version_id`),
  CONSTRAINT `version_id_refs_id_946f97c5` FOREIGN KEY (`version_id`) REFERENCES `django_project_version` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_evolution`
--

LOCK TABLES `django_evolution` WRITE;
/*!40000 ALTER TABLE `django_evolution` DISABLE KEYS */;
INSERT INTO `django_evolution` VALUES (1,1,'auth','auth_delete_message'),(2,1,'auth','auth_unique_together_baseline'),(3,1,'contenttypes','contenttypes_unique_together_baseline'),(4,1,'sessions','session_expire_date_db_index'),(5,1,'extensions','update_app_label'),(6,1,'privacy','audit_indentifier'),(7,1,'siteconfig','update_app_label'),(8,1,'accounts','is_private'),(9,1,'accounts','timezone'),(10,1,'accounts','open_an_issue'),(11,1,'accounts','extra_data'),(12,1,'accounts','timezone_length_30'),(13,1,'accounts','localsiteprofile_permissions'),(14,1,'accounts','unique_together_baseline'),(15,1,'accounts','profile_show_closed'),(16,1,'accounts','profile_should_send_email'),(17,1,'accounts','profile_should_send_own_updates'),(18,1,'accounts','profile_default_use_rich_text'),(19,1,'accounts','reviewrequestvisit_visibility'),(20,1,'accounts','profile_settings'),(21,1,'attachments','file_attachment_orig_filename'),(22,1,'attachments','file_attachment_file_max_length_512'),(23,1,'attachments','file_attachment_repo_info'),(24,1,'attachments','file_attachment_repo_path_no_index'),(25,1,'attachments','file_attachment_repo_revision_max_length_64'),(26,1,'attachments','file_attachment_revision'),(27,1,'attachments','file_attachment_ownership'),(28,1,'attachments','file_attachment_uuid'),(29,1,'changedescs','fields_changed_longtext'),(30,1,'changedescs','rich_text'),(31,1,'changedescs','changedesc_user'),(32,1,'diffviewer','add_parent_diffs'),(33,1,'diffviewer','filediff_filenames_1024_chars'),(34,1,'diffviewer','diffset_basedir'),(35,1,'diffviewer','filediff_status'),(36,1,'diffviewer','add_diff_hash'),(37,1,'diffviewer','diffsethistory_diff_updated'),(38,1,'diffviewer','filediffdata_line_counts'),(39,1,'diffviewer','diffset_base_commit_id'),(40,1,'diffviewer','filediffdata_extra_data'),(41,1,'diffviewer','all_extra_data'),(42,1,'diffviewer','raw_diff_file_data'),(43,1,'hostingsvcs','account_hosting_url'),(44,1,'hostingsvcs','account_hosting_url_max_length_255'),(45,1,'hostingsvcs','account_unique_together_baseline'),(46,1,'notifications','webhooktarget_extra_state'),(47,1,'notifications','webhooktarget_extra_data_null'),(48,1,'oauth','disabled_for_security'),(49,1,'reviews','change_descriptions'),(50,1,'reviews','last_review_timestamp'),(51,1,'reviews','shipit_count'),(52,1,'reviews','default_reviewer_repositories'),(53,1,'reviews','null_repository'),(54,1,'reviews','localsite'),(55,1,'reviews','group_incoming_request_count'),(56,1,'reviews','group_invite_only'),(57,1,'reviews','group_visible'),(58,1,'reviews','default_reviewer_local_site'),(59,1,'reviews','add_issues_to_comments'),(60,1,'reviews','file_attachments'),(61,1,'reviews','file_attachment_comment_extra_data'),(62,1,'reviews','review_request_last_review_activity_timestamp'),(63,1,'reviews','review_request_depends_on'),(64,1,'reviews','commit_id'),(65,1,'reviews','file_attachment_comment_diff_id'),(66,1,'reviews','rich_text'),(67,1,'reviews','base_comment_extra_data'),(68,1,'reviews','unique_together_baseline'),(69,1,'reviews','extra_data'),(70,1,'reviews','review_request_issue_counts'),(71,1,'reviews','group_mailing_list_charfield'),(72,1,'reviews','review_request_draft_commit_id'),(73,1,'reviews','group_email_list_only'),(74,1,'reviews','review_request_file_attachment_histories'),(75,1,'reviews','review_request_summary_index'),(76,1,'reviews','review_request_summary_index_manual'),(77,1,'reviews','split_rich_text'),(78,1,'reviews','is_default_group'),(79,1,'reviews','general_comments'),(80,1,'reviews','add_owner_to_draft'),(81,1,'reviews','status_update_timeout'),(82,1,'reviews','comment_issue_verification'),(83,1,'reviews','review_request_screenshot_attachment_counters'),(84,1,'scmtools','bugzilla_url_charfield'),(85,1,'scmtools','repository_raw_file_url'),(86,1,'scmtools','repository_visible'),(87,1,'scmtools','repository_path_length_255'),(88,1,'scmtools','localsite'),(89,1,'scmtools','repository_access_control'),(90,1,'scmtools','group_site'),(91,1,'scmtools','repository_hosting_accounts'),(92,1,'scmtools','repository_extra_data_null'),(93,1,'scmtools','unique_together_baseline'),(94,1,'scmtools','repository_archive'),(95,1,'scmtools','repository_hooks_uuid'),(96,1,'scmtools','repository_raw_password'),(97,1,'scmtools','repository_name_length_255'),(98,1,'site','localsite_public'),(99,1,'site','localsite_extra_data'),(100,1,'webapi','webapitoken_jsonfield_null');
/*!40000 ALTER TABLE `django_evolution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_project_version`
--

DROP TABLE IF EXISTS `django_project_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_project_version` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `signature` longtext NOT NULL,
  `when` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_project_version`
--

LOCK TABLES `django_project_version` WRITE;
/*!40000 ALTER TABLE `django_project_version` DISABLE KEYS */;
INSERT INTO `django_project_version` VALUES (1,'(dp1\nS\'changedescs\'\np2\nccopy_reg\n_reconstructor\np3\n(cdjango.utils.datastructures\nSortedDict\np4\nc__builtin__\ndict\np5\n(dp6\nS\'ChangeDescription\'\np7\n(dp8\nS\'fields\'\np9\n(dp10\nS\'timestamp\'\np11\n(dp12\nS\'field_type\'\np13\ncdjango.db.models.fields\nDateTimeField\np14\nssS\'rich_text\'\np15\n(dp16\ng13\ncdjango.db.models.fields\nBooleanField\np17\nssS\'fields_changed\'\np18\n(dp19\ng13\ncdjblets.db.fields.json_field\nJSONField\np20\nssS\'user\'\np21\n(dp22\ng13\ncdjango.db.models.fields.related\nForeignKey\np23\nsS\'null\'\np24\nI01\nsS\'related_model\'\np25\nS\'auth.User\'\np26\nssS\'text\'\np27\n(dp28\ng13\ncdjango.db.models.fields\nTextField\np29\nssS\'id\'\np30\n(dp31\ng13\ncdjango.db.models.fields\nAutoField\np32\nsS\'primary_key\'\np33\nI01\nssS\'public\'\np34\n(dp35\ng13\ng17\nsssS\'meta\'\np36\n(dp37\nS\'unique_together\'\np38\n(lp39\nsS\'pk_column\'\np40\nS\'id\'\np41\nsS\'index_together\'\np42\n(lp43\nsS\'db_table\'\np44\nVchangedescs_changedescription\np45\nsS\'db_tablespace\'\np46\nS\'\'\nsS\'__unique_together_applied\'\np47\nI01\nssstRp48\n(dp49\nS\'keyOrder\'\np50\n(lp51\ng7\nasbsS\'attachments\'\np52\ng3\n(g4\ng5\n(dp53\nS\'FileAttachmentHistory\'\np54\n(dp55\ng9\n(dp56\nS\'display_position\'\np57\n(dp58\ng13\ncdjango.db.models.fields\nIntegerField\np59\nssS\'latest_revision\'\np60\n(dp61\ng13\ncdjblets.db.fields.relation_counter_field\nRelationCounterField\np62\nsg24\nI01\nssS\'id\'\np63\n(dp64\ng13\ng32\nsg33\nI01\nsssg36\n(dp65\ng38\n(lp66\nsg40\nS\'id\'\np67\nsg42\n(lp68\nsg44\nVattachments_fileattachmenthistory\np69\nsg46\nS\'\'\nsg47\nI01\nsssS\'FileAttachment\'\np70\n(dp71\ng9\n(dp72\nS\'orig_filename\'\np73\n(dp74\nS\'max_length\'\np75\nI256\nsg13\ncdjango.db.models.fields\nCharField\np76\nsg24\nI01\nssS\'mimetype\'\np77\n(dp78\ng13\ng76\nsg75\nI256\nssS\'added_in_filediff\'\np79\n(dp80\ng13\ng23\nsg24\nI01\nsg25\nS\'diffviewer.FileDiff\'\np81\nssS\'attachment_revision\'\np82\n(dp83\ng13\ng59\nssS\'uuid\'\np84\n(dp85\ng13\ng76\nsg75\nI255\nssS\'repository\'\np86\n(dp87\ng13\ng23\nsg24\nI01\nsg25\nS\'scmtools.Repository\'\np88\nssS\'local_site\'\np89\n(dp90\ng13\ng23\nsg24\nI01\nsg25\nS\'site.LocalSite\'\np91\nssS\'repo_revision\'\np92\n(dp93\ng75\nI64\nsg13\ng76\nsg24\nI01\nsS\'db_index\'\np94\nI01\nssS\'draft_caption\'\np95\n(dp96\ng13\ng76\nsg75\nI256\nssS\'caption\'\np97\n(dp98\ng13\ng76\nsg75\nI256\nssg21\n(dp99\ng13\ng23\nsg24\nI01\nsg25\nS\'auth.User\'\np100\nssS\'file\'\np101\n(dp102\ng75\nI512\nsg13\ncdjango.db.models.fields.files\nFileField\np103\nsg24\nI01\nssS\'attachment_history\'\np104\n(dp105\ng13\ng23\nsg24\nI01\nsg25\nS\'attachments.FileAttachmentHistory\'\np106\nssS\'id\'\np107\n(dp108\ng13\ng32\nsg33\nI01\nssS\'repo_path\'\np109\n(dp110\ng75\nI1024\nsg13\ng76\nsg24\nI01\nsssg36\n(dp111\ng38\n(lp112\nsg40\nS\'id\'\np113\nsg42\n(lp114\nsg44\nVattachments_fileattachment\np115\nsg46\nS\'\'\nsg47\nI01\nssstRp116\n(dp117\ng50\n(lp118\ng54\nag70\nasbsS\'hostingsvcs\'\np119\ng3\n(g4\ng5\n(dp120\nS\'HostingServiceAccount\'\np121\n(dp122\ng9\n(dp123\nS\'username\'\np124\n(dp125\ng13\ng76\nsg75\nI128\nssg89\n(dp126\ng13\ng23\nsg24\nI01\nsg25\nS\'site.LocalSite\'\np127\nssS\'service_name\'\np128\n(dp129\ng13\ng76\nsg75\nI128\nssS\'visible\'\np130\n(dp131\ng13\ng17\nssS\'hosting_url\'\np132\n(dp133\ng75\nI255\nsg13\ng76\nsg24\nI01\nssS\'data\'\np134\n(dp135\ng13\ng20\nssS\'id\'\np136\n(dp137\ng13\ng32\nsg33\nI01\nsssg36\n(dp138\ng38\n(lp139\nsg40\nS\'id\'\np140\nsg42\n(lp141\nsg44\nVhostingsvcs_hostingserviceaccount\np142\nsg46\nS\'\'\nsg47\nI01\nssstRp143\n(dp144\ng50\n(lp145\ng121\nasbsS\'integrations\'\np146\ng3\n(g4\ng5\n(dp147\nS\'IntegrationConfig\'\np148\n(dp149\ng9\n(dp150\nS\'integration_id\'\np151\n(dp152\ng13\ng76\nsg75\nI255\nsg94\nI01\nssS\'last_updated\'\np153\n(dp154\ng13\ng14\nssS\'name\'\np155\n(dp156\ng75\nI255\nsg13\ng76\nsg24\nI01\nssS\'settings\'\np157\n(dp158\ng13\ng20\nssg89\n(dp159\ng13\ng23\nsg24\nI01\nsg25\nS\'site.LocalSite\'\np160\nssS\'enabled\'\np161\n(dp162\ng13\ng17\nsg94\nI01\nssS\'time_added\'\np163\n(dp164\ng13\ng14\nssS\'extra_data\'\np165\n(dp166\ng13\ng20\nssS\'id\'\np167\n(dp168\ng13\ng32\nsg33\nI01\nsssg36\n(dp169\ng38\n(lp170\nsg40\nS\'id\'\np171\nsg42\n(lp172\nsg44\nVintegrations_integrationconfig\np173\nsg46\nS\'\'\nsg47\nI01\nssstRp174\n(dp175\ng50\n(lp176\ng148\nasbsS\'accounts\'\np177\ng3\n(g4\ng5\n(dp178\nS\'Profile\'\np179\n(dp180\ng9\n(dp181\nS\'review_request_columns\'\np182\n(dp183\ng13\ng76\nsg75\nI256\nssS\'dashboard_columns\'\np184\n(dp185\ng13\ng76\nsg75\nI256\nssS\'starred_review_requests\'\np186\n(dp187\ng13\ncdjango.db.models.fields.related\nManyToManyField\np188\nsg25\nS\'reviews.ReviewRequest\'\np189\nssS\'default_use_rich_text\'\np190\n(dp191\ng13\ncdjango.db.models.fields\nNullBooleanField\np192\nsg24\nI01\nssS\'should_send_email\'\np193\n(dp194\ng13\ng17\nssS\'timezone\'\np195\n(dp196\ng13\ng76\nsg75\nI30\nssS\'open_an_issue\'\np197\n(dp198\ng13\ng17\nssS\'id\'\np199\n(dp200\ng13\ng32\nsg33\nI01\nssS\'sort_group_columns\'\np201\n(dp202\ng13\ng76\nsg75\nI256\nssS\'starred_groups\'\np203\n(dp204\ng13\ng188\nsg25\nS\'reviews.Group\'\np205\nssS\'submitter_columns\'\np206\n(dp207\ng13\ng76\nsg75\nI256\nssS\'collapsed_diffs\'\np208\n(dp209\ng13\ng17\nssS\'first_time_setup_done\'\np210\n(dp211\ng13\ng17\nssS\'wordwrapped_diffs\'\np212\n(dp213\ng13\ng17\nssg165\n(dp214\ng13\ng20\nsg24\nI01\nssS\'sort_review_request_columns\'\np215\n(dp216\ng13\ng76\nsg75\nI256\nssS\'show_closed\'\np217\n(dp218\ng13\ng17\nssS\'sort_dashboard_columns\'\np219\n(dp220\ng13\ng76\nsg75\nI256\nssg21\n(dp221\ng13\ng23\nsS\'unique\'\np222\nI01\nsg25\nS\'auth.User\'\np223\nssS\'should_send_own_updates\'\np224\n(dp225\ng13\ng17\nssS\'is_private\'\np226\n(dp227\ng13\ng17\nssS\'syntax_highlighting\'\np228\n(dp229\ng13\ng17\nssg157\n(dp230\ng13\ng20\nsg24\nI01\nssS\'sort_submitter_columns\'\np231\n(dp232\ng13\ng76\nsg75\nI256\nssS\'group_columns\'\np233\n(dp234\ng13\ng76\nsg75\nI256\nsssg36\n(dp235\ng38\n(lp236\nsg40\nS\'id\'\np237\nsg42\n(lp238\nsg44\nVaccounts_profile\np239\nsg46\nS\'\'\nsg47\nI01\nsssS\'Trophy\'\np240\n(dp241\ng9\n(dp242\nS\'category\'\np243\n(dp244\ng13\ng76\nsg75\nI100\nssg89\n(dp245\ng13\ng23\nsg24\nI01\nsg25\nS\'site.LocalSite\'\np246\nssg21\n(dp247\ng13\ng23\nsg25\nS\'auth.User\'\np248\nssS\'review_request\'\np249\n(dp250\ng13\ng23\nsg25\nS\'reviews.ReviewRequest\'\np251\nssS\'id\'\np252\n(dp253\ng13\ng32\nsg33\nI01\nssS\'received_date\'\np254\n(dp255\ng13\ng14\nsssg36\n(dp256\ng38\n(lp257\nsg40\nS\'id\'\np258\nsg42\n(lp259\nsg44\nVaccounts_trophy\np260\nsg46\nS\'\'\nsg47\nI01\nsssS\'ReviewRequestVisit\'\np261\n(dp262\ng9\n(dp263\ng11\n(dp264\ng13\ng14\nssg249\n(dp265\ng13\ng23\nsg25\nS\'reviews.ReviewRequest\'\np266\nssS\'id\'\np267\n(dp268\ng13\ng32\nsg33\nI01\nssS\'visibility\'\np269\n(dp270\ng13\ng76\nsg75\nI1\nssg21\n(dp271\ng13\ng23\nsg25\nS\'auth.User\'\np272\nsssg36\n(dp273\ng38\n((Vuser\nVreview_request\nttp274\nsg40\nS\'id\'\np275\nsg42\n(lp276\n(Vuser\nVvisibility\ntp277\nasg44\nVaccounts_reviewrequestvisit\np278\nsg46\nS\'\'\nsg47\nI01\nsssS\'LocalSiteProfile\'\np279\n(dp280\ng9\n(dp281\nS\'profile\'\np282\n(dp283\ng13\ng23\nsg25\nS\'accounts.Profile\'\np284\nssS\'direct_incoming_request_count\'\np285\n(dp286\ng13\ncdjblets.db.fields.counter_field\nCounterField\np287\nsg24\nI01\nssg89\n(dp288\ng13\ng23\nsg24\nI01\nsg25\nS\'site.LocalSite\'\np289\nssS\'starred_public_request_count\'\np290\n(dp291\ng13\ng287\nsg24\nI01\nssS\'total_outgoing_request_count\'\np292\n(dp293\ng13\ng287\nsg24\nI01\nssS\'pending_outgoing_request_count\'\np294\n(dp295\ng13\ng287\nsg24\nI01\nssg21\n(dp296\ng13\ng23\nsg25\nS\'auth.User\'\np297\nssS\'total_incoming_request_count\'\np298\n(dp299\ng13\ng287\nsg24\nI01\nssS\'id\'\np300\n(dp301\ng13\ng32\nsg33\nI01\nssS\'permissions\'\np302\n(dp303\ng13\ng20\nsg24\nI01\nsssg36\n(dp304\ng38\n((Vuser\nVlocal_site\nt(Vprofile\nVlocal_site\nttp305\nsg40\nS\'id\'\np306\nsg42\n(lp307\nsg44\nVaccounts_localsiteprofile\np308\nsg46\nS\'\'\nsg47\nI01\nssstRp309\n(dp310\ng50\n(lp311\ng261\nag179\nag279\nag240\nasbsS\'diffviewer\'\np312\ng3\n(g4\ng5\n(dp313\nS\'LegacyFileDiffData\'\np314\n(dp315\ng9\n(dp316\nS\'binary\'\np317\n(dp318\ng13\ncdjblets.db.fields.base64_field\nBase64Field\np319\nssg165\n(dp320\ng13\ng20\nsg24\nI01\nssS\'binary_hash\'\np321\n(dp322\ng13\ng76\nsg75\nI40\nsg33\nI01\nsssg36\n(dp323\ng38\n(lp324\nsg40\ng321\nsg42\n(lp325\nsg44\nVdiffviewer_filediffdata\np326\nsg46\nS\'\'\nsg47\nI01\nsssS\'DiffSet\'\np327\n(dp328\ng9\n(dp329\nS\'base_commit_id\'\np330\n(dp331\ng75\nI64\nsg13\ng76\nsg24\nI01\nsg94\nI01\nssg155\n(dp332\ng13\ng76\nsg75\nI256\nssg86\n(dp333\ng13\ng23\nsg25\nS\'scmtools.Repository\'\np334\nssg11\n(dp335\ng13\ng14\nssS\'basedir\'\np336\n(dp337\ng13\ng76\nsg75\nI256\nssS\'diffcompat\'\np338\n(dp339\ng13\ng59\nssg165\n(dp340\ng13\ng20\nsg24\nI01\nssS\'history\'\np341\n(dp342\ng13\ng23\nsg24\nI01\nsg25\nS\'diffviewer.DiffSetHistory\'\np343\nssS\'id\'\np344\n(dp345\ng13\ng32\nsg33\nI01\nssS\'revision\'\np346\n(dp347\ng13\ng59\nsssg36\n(dp348\ng38\n(lp349\nsg40\nS\'id\'\np350\nsg42\n(lp351\nsg44\nVdiffviewer_diffset\np352\nsg46\nS\'\'\nsg47\nI01\nsssS\'RawFileDiffData\'\np353\n(dp354\ng9\n(dp355\ng317\n(dp356\ng13\ncdjango.db.models.fields\nBinaryField\np357\nssS\'compression\'\np358\n(dp359\ng75\nI1\nsg13\ng76\nsg24\nI01\nssS\'id\'\np360\n(dp361\ng13\ng32\nsg33\nI01\nssg165\n(dp362\ng13\ng20\nsg24\nI01\nssg321\n(dp363\ng75\nI40\nsg13\ng76\nsg222\nI01\nsssg36\n(dp364\ng38\n(lp365\nsg40\nS\'id\'\np366\nsg42\n(lp367\nsg44\nVdiffviewer_rawfilediffdata\np368\nsg46\nS\'\'\nsg47\nI01\nsssS\'DiffSetHistory\'\np369\n(dp370\ng9\n(dp371\ng11\n(dp372\ng13\ng14\nssS\'last_diff_updated\'\np373\n(dp374\ng13\ng14\nsg24\nI01\nssS\'id\'\np375\n(dp376\ng13\ng32\nsg33\nI01\nssg165\n(dp377\ng13\ng20\nsg24\nI01\nssg155\n(dp378\ng13\ng76\nsg75\nI256\nsssg36\n(dp379\ng38\n(lp380\nsg40\nS\'id\'\np381\nsg42\n(lp382\nsg44\nVdiffviewer_diffsethistory\np383\nsg46\nS\'\'\nsg47\nI01\nsssS\'FileDiff\'\np384\n(dp385\ng9\n(dp386\nS\'status\'\np387\n(dp388\ng13\ng76\nsg75\nI1\nssg317\n(dp389\ng13\ng17\nssS\'diff_hash\'\np390\n(dp391\ng13\ng23\nsg24\nI01\nsg25\nS\'diffviewer.RawFileDiffData\'\np392\nsS\'db_column\'\np393\nVraw_diff_hash_id\np394\nssS\'diffset\'\np395\n(dp396\ng13\ng23\nsg25\nS\'diffviewer.DiffSet\'\np397\nssS\'dest_detail\'\np398\n(dp399\ng13\ng76\nsg75\nI512\nssS\'parent_diff_hash\'\np400\n(dp401\ng13\ng23\nsg24\nI01\nsg25\nS\'diffviewer.RawFileDiffData\'\np402\nsg393\nVraw_parent_diff_hash_id\np403\nssS\'diff64\'\np404\n(dp405\ng13\ng319\nsg393\nVdiff_base64\np406\nssS\'source_revision\'\np407\n(dp408\ng13\ng76\nsg75\nI512\nssS\'source_file\'\np409\n(dp410\ng13\ng76\nsg75\nI1024\nssS\'dest_file\'\np411\n(dp412\ng13\ng76\nsg75\nI1024\nssS\'parent_diff64\'\np413\n(dp414\ng13\ng319\nsg393\nVparent_diff_base64\np415\nssS\'legacy_diff_hash\'\np416\n(dp417\ng13\ng23\nsg24\nI01\nsg25\nS\'diffviewer.LegacyFileDiffData\'\np418\nsg393\nVdiff_hash_id\np419\nssS\'legacy_parent_diff_hash\'\np420\n(dp421\ng13\ng23\nsg24\nI01\nsg25\nS\'diffviewer.LegacyFileDiffData\'\np422\nsg393\nVparent_diff_hash_id\np423\nssg165\n(dp424\ng13\ng20\nsg24\nI01\nssS\'id\'\np425\n(dp426\ng13\ng32\nsg33\nI01\nsssg36\n(dp427\ng38\n(lp428\nsg40\nS\'id\'\np429\nsg42\n(lp430\nsg44\nVdiffviewer_filediff\np431\nsg46\nS\'\'\nsg47\nI01\nssstRp432\n(dp433\ng50\n(lp434\ng314\nag353\nag384\nag327\nag369\nasbsS\'corsheaders\'\np435\ng3\n(g4\ng5\n(dp436\nS\'CorsModel\'\np437\n(dp438\ng9\n(dp439\nS\'id\'\np440\n(dp441\ng13\ng32\nsg33\nI01\nssS\'cors\'\np442\n(dp443\ng13\ng76\nsg75\nI255\nsssg36\n(dp444\ng38\n(lp445\nsg40\nS\'id\'\np446\nsg42\n(lp447\nsg44\nVcorsheaders_corsmodel\np448\nsg46\nS\'\'\nsg47\nI01\nssstRp449\n(dp450\ng50\n(lp451\ng437\nasbsS\'privacy\'\np452\ng3\n(g4\ng5\n(dp453\nS\'StoredConsentData\'\np454\n(dp455\ng9\n(dp456\ng153\n(dp457\ng13\ng14\nssS\'consent_grants\'\np458\n(dp459\ng13\ng20\nssS\'audit_trail\'\np460\n(dp461\ng13\ng20\nssS\'audit_identifier\'\np462\n(dp463\ng75\nI255\nsg13\ng76\nsg24\nI01\nsg94\nI01\nssg21\n(dp464\ng13\ncdjango.db.models.fields.related\nOneToOneField\np465\nsg222\nI01\nsg24\nI01\nsg25\nS\'auth.User\'\np466\nssg163\n(dp467\ng13\ng14\nssS\'id\'\np468\n(dp469\ng13\ng32\nsg33\nI01\nsssg36\n(dp470\ng38\n(lp471\nsg40\nS\'id\'\np472\nsg42\n(lp473\nsg44\nVdjblets_privacy_storedconsentdata\np474\nsg46\nS\'\'\nsg47\nI01\nssstRp475\n(dp476\ng50\n(lp477\ng454\nasbsS\'sites\'\np478\ng3\n(g4\ng5\n(dp479\nS\'Site\'\np480\n(dp481\ng9\n(dp482\nS\'domain\'\np483\n(dp484\ng13\ng76\nsg75\nI100\nssS\'id\'\np485\n(dp486\ng13\ng32\nsg33\nI01\nssg155\n(dp487\ng13\ng76\nsg75\nI50\nsssg36\n(dp488\ng38\n(lp489\nsg40\nS\'id\'\np490\nsg42\n(lp491\nsg44\nVdjango_site\np492\nsg46\nS\'\'\nsg47\nI01\nssstRp493\n(dp494\ng50\n(lp495\ng480\nasbsS\'scmtools\'\np496\ng3\n(g4\ng5\n(dp497\nS\'Tool\'\np498\n(dp499\ng9\n(dp500\nS\'class_name\'\np501\n(dp502\ng75\nI128\nsg13\ng76\nsg222\nI01\nssS\'id\'\np503\n(dp504\ng13\ng32\nsg33\nI01\nssg155\n(dp505\ng75\nI32\nsg13\ng76\nsg222\nI01\nsssg36\n(dp506\ng38\n(lp507\nsg40\nS\'id\'\np508\nsg42\n(lp509\nsg44\nVscmtools_tool\np510\nsg46\nS\'\'\nsg47\nI01\nsssS\'Repository\'\np511\n(dp512\ng9\n(dp513\ng124\n(dp514\ng13\ng76\nsg75\nI32\nssS\'encrypted_password\'\np515\n(dp516\ng13\ng76\nsg75\nI128\nsg393\nVpassword\np517\nssg89\n(dp518\ng13\ng23\nsg24\nI01\nsg25\nS\'site.LocalSite\'\np519\nssg155\n(dp520\ng13\ng76\nsg75\nI255\nssS\'review_groups\'\np521\n(dp522\ng13\ng188\nsg25\nS\'reviews.Group\'\np523\nssS\'encoding\'\np524\n(dp525\ng13\ng76\nsg75\nI32\nssS\'archived_timestamp\'\np526\n(dp527\ng13\ng14\nsg24\nI01\nssS\'mirror_path\'\np528\n(dp529\ng13\ng76\nsg75\nI255\nssS\'archived\'\np530\n(dp531\ng13\ng17\nssS\'tool\'\np532\n(dp533\ng13\ng23\nsg25\nS\'scmtools.Tool\'\np534\nssS\'hosting_account\'\np535\n(dp536\ng13\ng23\nsg24\nI01\nsg25\nS\'hostingsvcs.HostingServiceAccount\'\np537\nssg34\n(dp538\ng13\ng17\nssg130\n(dp539\ng13\ng17\nssS\'hooks_uuid\'\np540\n(dp541\ng75\nI32\nsg13\ng76\nsg24\nI01\nssS\'raw_file_url\'\np542\n(dp543\ng13\ng76\nsg75\nI255\nssS\'bug_tracker\'\np544\n(dp545\ng13\ng76\nsg75\nI256\nssS\'path\'\np546\n(dp547\ng13\ng76\nsg75\nI255\nssg165\n(dp548\ng13\ng20\nsg24\nI01\nssS\'id\'\np549\n(dp550\ng13\ng32\nsg33\nI01\nssS\'users\'\np551\n(dp552\ng13\ng188\nsg25\nS\'auth.User\'\np553\nsssg36\n(dp554\ng38\n((Vname\nVlocal_site\nt(Varchived_timestamp\nVpath\nVlocal_site\nt(Vhooks_uuid\nVlocal_site\nttp555\nsg40\nS\'id\'\np556\nsg42\n(lp557\nsg44\nVscmtools_repository\np558\nsg46\nS\'\'\nsg47\nI01\nssstRp559\n(dp560\ng50\n(lp561\ng498\nag511\nasbsS\'contenttypes\'\np562\ng3\n(g4\ng5\n(dp563\nS\'ContentType\'\np564\n(dp565\ng9\n(dp566\nS\'model\'\np567\n(dp568\ng13\ng76\nsg75\nI100\nssS\'app_label\'\np569\n(dp570\ng13\ng76\nsg75\nI100\nssS\'id\'\np571\n(dp572\ng13\ng32\nsg33\nI01\nssg155\n(dp573\ng13\ng76\nsg75\nI100\nsssg36\n(dp574\ng38\n((g569\ng567\nttp575\nsg40\nS\'id\'\np576\nsg42\n(lp577\nsg44\nS\'django_content_type\'\np578\nsg46\nS\'\'\nsg47\nI01\nssstRp579\n(dp580\ng50\n(lp581\ng564\nasbsS\'haystack\'\np582\ng3\n(g4\ng5\n(dtRp583\n(dp584\ng50\n(lp585\nsbsS\'__version__\'\np586\nI1\nsS\'webapi\'\np587\ng3\n(g4\ng5\n(dp588\nS\'WebAPIToken\'\np589\n(dp590\ng9\n(dp591\ng153\n(dp592\ng13\ng14\nssg89\n(dp593\ng13\ng23\nsg24\nI01\nsg25\nS\'site.LocalSite\'\np594\nssS\'note\'\np595\n(dp596\ng13\ng29\nssS\'token\'\np597\n(dp598\ng75\nI40\nsg13\ng76\nsg222\nI01\nssg21\n(dp599\ng13\ng23\nsg25\nS\'auth.User\'\np600\nssS\'policy\'\np601\n(dp602\ng13\ng20\nsg24\nI01\nssg163\n(dp603\ng13\ng14\nssg165\n(dp604\ng13\ng20\nsg24\nI01\nssS\'id\'\np605\n(dp606\ng13\ng32\nsg33\nI01\nsssg36\n(dp607\ng38\n(lp608\nsg40\nS\'id\'\np609\nsg42\n(lp610\nsg44\nVwebapi_webapitoken\np611\nsg46\nS\'\'\nsg47\nI01\nssstRp612\n(dp613\ng50\n(lp614\ng589\nasbsS\'sessions\'\np615\ng3\n(g4\ng5\n(dp616\nS\'Session\'\np617\n(dp618\ng9\n(dp619\nS\'session_key\'\np620\n(dp621\ng13\ng76\nsg75\nI40\nsg33\nI01\nssS\'expire_date\'\np622\n(dp623\ng13\ng14\nsg94\nI01\nssS\'session_data\'\np624\n(dp625\ng13\ng29\nsssg36\n(dp626\ng38\n(lp627\nsg40\ng620\nsg42\n(lp628\nsg44\nS\'django_session\'\np629\nsg46\nS\'\'\nsg47\nI01\nssstRp630\n(dp631\ng50\n(lp632\ng617\nasbsS\'staticfiles\'\np633\ng3\n(g4\ng5\n(dtRp634\n(dp635\ng50\n(lp636\nsbsS\'auth\'\np637\ng3\n(g4\ng5\n(dp638\nS\'Group\'\np639\n(dp640\ng9\n(dp641\ng302\n(dp642\ng13\ng188\nsg25\nS\'auth.Permission\'\np643\nssS\'id\'\np644\n(dp645\ng13\ng32\nsg33\nI01\nssg155\n(dp646\ng75\nI80\nsg13\ng76\nsg222\nI01\nsssg36\n(dp647\ng38\n(lp648\nsg40\nS\'id\'\np649\nsg42\n(lp650\nsg44\nVauth_group\np651\nsg46\nS\'\'\nsg47\nI01\nsssS\'User\'\np652\n(dp653\ng9\n(dp654\ng124\n(dp655\ng75\nI30\nsg13\ng76\nsg222\nI01\nssS\'first_name\'\np656\n(dp657\ng13\ng76\nsg75\nI30\nssS\'last_name\'\np658\n(dp659\ng13\ng76\nsg75\nI30\nssS\'is_active\'\np660\n(dp661\ng13\ng17\nssS\'email\'\np662\n(dp663\ng13\ncdjango.db.models.fields\nEmailField\np664\nsg75\nI75\nssS\'is_superuser\'\np665\n(dp666\ng13\ng17\nssS\'is_staff\'\np667\n(dp668\ng13\ng17\nssS\'last_login\'\np669\n(dp670\ng13\ng14\nssS\'groups\'\np671\n(dp672\ng13\ng188\nsg25\nS\'auth.Group\'\np673\nssS\'user_permissions\'\np674\n(dp675\ng13\ng188\nsg25\nS\'auth.Permission\'\np676\nssS\'password\'\np677\n(dp678\ng13\ng76\nsg75\nI128\nssS\'id\'\np679\n(dp680\ng13\ng32\nsg33\nI01\nssS\'date_joined\'\np681\n(dp682\ng13\ng14\nsssg36\n(dp683\ng38\n(lp684\nsg40\nS\'id\'\np685\nsg42\n(lp686\nsg44\nVauth_user\np687\nsg46\nS\'\'\nsg47\nI01\nsssS\'Permission\'\np688\n(dp689\ng9\n(dp690\nS\'codename\'\np691\n(dp692\ng13\ng76\nsg75\nI100\nssS\'id\'\np693\n(dp694\ng13\ng32\nsg33\nI01\nssS\'content_type\'\np695\n(dp696\ng13\ng23\nsg25\nS\'contenttypes.ContentType\'\np697\nssg155\n(dp698\ng13\ng76\nsg75\nI50\nsssg36\n(dp699\ng38\n((Vcontent_type\nVcodename\nttp700\nsg40\nS\'id\'\np701\nsg42\n(lp702\nsg44\nVauth_permission\np703\nsg46\nS\'\'\nsg47\nI01\nssstRp704\n(dp705\ng50\n(lp706\ng688\nag639\nag652\nasbsS\'site\'\np707\ng3\n(g4\ng5\n(dp708\nS\'LocalSite\'\np709\n(dp710\ng9\n(dp711\ng551\n(dp712\ng13\ng188\nsg25\nS\'auth.User\'\np713\nssS\'id\'\np714\n(dp715\ng13\ng32\nsg33\nI01\nssS\'admins\'\np716\n(dp717\ng13\ng188\nsg25\nS\'auth.User\'\np718\nssg165\n(dp719\ng13\ng20\nsg24\nI01\nssg34\n(dp720\ng13\ng17\nssg155\n(dp721\ng75\nI32\nsg13\ncdjango.db.models.fields\nSlugField\np722\nsg222\nI01\nsg94\nI01\nsssg36\n(dp723\ng38\n(lp724\nsg40\nS\'id\'\np725\nsg42\n(lp726\nsg44\nVsite_localsite\np727\nsg46\nS\'\'\nsg47\nI01\nssstRp728\n(dp729\ng50\n(lp730\ng709\nasbsS\'notifications\'\np731\ng3\n(g4\ng5\n(dp732\nS\'WebHookTarget\'\np733\n(dp734\ng9\n(dp735\ng89\n(dp736\ng13\ng23\nsg24\nI01\nsg25\nS\'site.LocalSite\'\np737\nssg524\n(dp738\ng13\ng76\nsg75\nI40\nssS\'url\'\np739\n(dp740\ng13\ncdjango.db.models.fields\nURLField\np741\nsg75\nI200\nssS\'repositories\'\np742\n(dp743\ng13\ng188\nsg24\nI01\nsg25\nS\'scmtools.Repository\'\np744\nssS\'custom_content\'\np745\n(dp746\ng13\ng29\nsg24\nI01\nssg161\n(dp747\ng13\ng17\nssS\'events\'\np748\n(dp749\ng13\ncmultiselectfield.db.fields\nMultiSelectField\np750\nsg75\nI105\nssS\'secret\'\np751\n(dp752\ng13\ng76\nsg75\nI128\nssS\'use_custom_content\'\np753\n(dp754\ng13\ng17\nssS\'apply_to\'\np755\n(dp756\ng13\ng76\nsg75\nI1\nssg165\n(dp757\ng13\ng20\nsg24\nI01\nssS\'id\'\np758\n(dp759\ng13\ng32\nsg33\nI01\nsssg36\n(dp760\ng38\n(lp761\nsg40\nS\'id\'\np762\nsg42\n(lp763\nsg44\nVnotifications_webhooktarget\np764\nsg46\nS\'\'\nsg47\nI01\nssstRp765\n(dp766\ng50\n(lp767\ng733\nasbsS\'oauth\'\np768\ng3\n(g4\ng5\n(dp769\nS\'Application\'\np770\n(dp771\ng9\n(dp772\nS\'redirect_uris\'\np773\n(dp774\ng13\ng29\nssg155\n(dp775\ng13\ng76\nsg75\nI255\nssg89\n(dp776\ng13\ng23\nsg24\nI01\nsg25\nS\'site.LocalSite\'\np777\nssg161\n(dp778\ng13\ng17\nssS\'client_type\'\np779\n(dp780\ng13\ng76\nsg75\nI32\nssg21\n(dp781\ng13\ng23\nsg25\nS\'auth.User\'\np782\nssS\'client_id\'\np783\n(dp784\ng75\nI100\nsg13\ng76\nsg222\nI01\nsg94\nI01\nssS\'skip_authorization\'\np785\n(dp786\ng13\ng17\nssS\'client_secret\'\np787\n(dp788\ng13\ng76\nsg75\nI255\nsg94\nI01\nssg165\n(dp789\ng13\ng20\nsg24\nI01\nssS\'original_user\'\np790\n(dp791\ng13\ng23\nsg24\nI01\nsg25\nS\'auth.User\'\np792\nssS\'id\'\np793\n(dp794\ng13\ng32\nsg33\nI01\nssS\'authorization_grant_type\'\np795\n(dp796\ng13\ng76\nsg75\nI32\nsssg36\n(dp797\ng38\n(lp798\nsg40\nS\'id\'\np799\nsg42\n(lp800\nsg44\nVreviewboard_oauth_application\np801\nsg46\nS\'\'\nsg47\nI01\nssstRp802\n(dp803\ng50\n(lp804\ng770\nasbsS\'oauth2_provider\'\np805\ng3\n(g4\ng5\n(dp806\ng770\n(dp807\ng9\n(dp808\ng773\n(dp809\ng13\ng29\nssg155\n(dp810\ng13\ng76\nsg75\nI255\nssg779\n(dp811\ng13\ng76\nsg75\nI32\nssg21\n(dp812\ng13\ng23\nsg25\nS\'auth.User\'\np813\nssg783\n(dp814\ng75\nI100\nsg13\ng76\nsg222\nI01\nsg94\nI01\nssg785\n(dp815\ng13\ng17\nssg787\n(dp816\ng13\ng76\nsg75\nI255\nsg94\nI01\nssS\'id\'\np817\n(dp818\ng13\ng32\nsg33\nI01\nssg795\n(dp819\ng13\ng76\nsg75\nI32\nsssg36\n(dp820\ng38\n(lp821\nsg40\nS\'id\'\np822\nsg42\n(lp823\nsg44\nVoauth2_provider_application\np824\nsg46\nS\'\'\nsg47\nI01\nsssS\'RefreshToken\'\np825\n(dp826\ng9\n(dp827\nS\'access_token\'\np828\n(dp829\ng13\ng465\nsg222\nI01\nsg25\nS\'oauth2_provider.AccessToken\'\np830\nssS\'application\'\np831\n(dp832\ng13\ng23\nsg25\nS\'oauth.Application\'\np833\nssg597\n(dp834\ng13\ng76\nsg75\nI255\nsg94\nI01\nssS\'id\'\np835\n(dp836\ng13\ng32\nsg33\nI01\nssg21\n(dp837\ng13\ng23\nsg25\nS\'auth.User\'\np838\nsssg36\n(dp839\ng38\n(lp840\nsg40\nS\'id\'\np841\nsg42\n(lp842\nsg44\nVoauth2_provider_refreshtoken\np843\nsg46\nS\'\'\nsg47\nI01\nsssS\'AccessToken\'\np844\n(dp845\ng9\n(dp846\nS\'expires\'\np847\n(dp848\ng13\ng14\nssg831\n(dp849\ng13\ng23\nsg25\nS\'oauth.Application\'\np850\nssg597\n(dp851\ng13\ng76\nsg75\nI255\nsg94\nI01\nssg21\n(dp852\ng13\ng23\nsg24\nI01\nsg25\nS\'auth.User\'\np853\nssS\'scope\'\np854\n(dp855\ng13\ng29\nssS\'id\'\np856\n(dp857\ng13\ng32\nsg33\nI01\nsssg36\n(dp858\ng38\n(lp859\nsg40\nS\'id\'\np860\nsg42\n(lp861\nsg44\nVoauth2_provider_accesstoken\np862\nsg46\nS\'\'\nsg47\nI01\nsssS\'Grant\'\np863\n(dp864\ng9\n(dp865\nS\'code\'\np866\n(dp867\ng13\ng76\nsg75\nI255\nsg94\nI01\nssg847\n(dp868\ng13\ng14\nssg831\n(dp869\ng13\ng23\nsg25\nS\'oauth.Application\'\np870\nssS\'redirect_uri\'\np871\n(dp872\ng13\ng76\nsg75\nI255\nssg21\n(dp873\ng13\ng23\nsg25\nS\'auth.User\'\np874\nssg854\n(dp875\ng13\ng29\nssS\'id\'\np876\n(dp877\ng13\ng32\nsg33\nI01\nsssg36\n(dp878\ng38\n(lp879\nsg40\nS\'id\'\np880\nsg42\n(lp881\nsg44\nVoauth2_provider_grant\np882\nsg46\nS\'\'\nsg47\nI01\nssstRp883\n(dp884\ng50\n(lp885\ng770\nag863\nag844\nag825\nasbsS\'admin\'\np886\ng3\n(g4\ng5\n(dp887\nS\'LogEntry\'\np888\n(dp889\ng9\n(dp890\nS\'action_flag\'\np891\n(dp892\ng13\ncdjango.db.models.fields\nPositiveSmallIntegerField\np893\nssS\'action_time\'\np894\n(dp895\ng13\ng14\nssS\'object_repr\'\np896\n(dp897\ng13\ng76\nsg75\nI200\nssS\'object_id\'\np898\n(dp899\ng13\ng29\nsg24\nI01\nssS\'change_message\'\np900\n(dp901\ng13\ng29\nssg21\n(dp902\ng13\ng23\nsg25\nS\'auth.User\'\np903\nssg695\n(dp904\ng13\ng23\nsg24\nI01\nsg25\nS\'contenttypes.ContentType\'\np905\nssS\'id\'\np906\n(dp907\ng13\ng32\nsg33\nI01\nsssg36\n(dp908\ng38\n(lp909\nsg40\nS\'id\'\np910\nsg42\n(lp911\nsg44\nVdjango_admin_log\np912\nsg46\nS\'\'\nsg47\nI01\nssstRp913\n(dp914\ng50\n(lp915\ng888\nasbsS\'siteconfig\'\np916\ng3\n(g4\ng5\n(dp917\nS\'SiteConfiguration\'\np918\n(dp919\ng9\n(dp920\nS\'version\'\np921\n(dp922\ng13\ng76\nsg75\nI20\nssS\'id\'\np923\n(dp924\ng13\ng32\nsg33\nI01\nssg157\n(dp925\ng13\ng20\nssS\'site\'\np926\n(dp927\ng13\ng23\nsg25\nS\'sites.Site\'\np928\nsssg36\n(dp929\ng38\n(lp930\nsg40\nS\'id\'\np931\nsg42\n(lp932\nsg44\nVsiteconfig_siteconfiguration\np933\nsg46\nS\'\'\nsg47\nI01\nssstRp934\n(dp935\ng50\n(lp936\ng918\nasbsS\'reviews\'\np937\ng3\n(g4\ng5\n(dp938\nS\'Comment\'\np939\n(dp940\ng9\n(dp941\nS\'issue_opened\'\np942\n(dp943\ng13\ng17\nssS\'interfilediff\'\np944\n(dp945\ng13\ng23\nsg24\nI01\nsg25\nS\'diffviewer.FileDiff\'\np946\nssS\'num_lines\'\np947\n(dp948\ng13\ncdjango.db.models.fields\nPositiveIntegerField\np949\nsg24\nI01\nssg11\n(dp950\ng13\ng14\nssg15\n(dp951\ng13\ng17\nssg27\n(dp952\ng13\ng29\nssS\'reply_to\'\np953\n(dp954\ng13\ng23\nsg24\nI01\nsg25\nS\'reviews.Comment\'\np955\nssS\'first_line\'\np956\n(dp957\ng13\ng949\nsg24\nI01\nssg165\n(dp958\ng13\ng20\nsg24\nI01\nssS\'id\'\np959\n(dp960\ng13\ng32\nsg33\nI01\nssS\'issue_status\'\np961\n(dp962\ng75\nI1\nsg13\ng76\nsg24\nI01\nsg94\nI01\nssS\'filediff\'\np963\n(dp964\ng13\ng23\nsg25\nS\'diffviewer.FileDiff\'\np965\nsssg36\n(dp966\ng38\n(lp967\nsg40\nS\'id\'\np968\nsg42\n(lp969\nsg44\nVreviews_comment\np970\nsg46\nS\'\'\nsg47\nI01\nsssg639\n(dp971\ng9\n(dp972\ng165\n(dp973\ng13\ng20\nsg24\nI01\nssS\'display_name\'\np974\n(dp975\ng13\ng76\nsg75\nI64\nssg155\n(dp976\ng13\ng722\nsg75\nI64\nsg94\nI01\nssg89\n(dp977\ng13\ng23\nsg24\nI01\nsg25\nS\'site.LocalSite\'\np978\nssS\'incoming_request_count\'\np979\n(dp980\ng13\ng287\nsg24\nI01\nssS\'is_default_group\'\np981\n(dp982\ng13\ng17\nssg130\n(dp983\ng13\ng17\nssS\'invite_only\'\np984\n(dp985\ng13\ng17\nssS\'email_list_only\'\np986\n(dp987\ng13\ng17\nssS\'id\'\np988\n(dp989\ng13\ng32\nsg33\nI01\nssS\'mailing_list\'\np990\n(dp991\ng13\ng76\nsg75\nI254\nssg551\n(dp992\ng13\ng188\nsg25\nS\'auth.User\'\np993\nsssg36\n(dp994\ng38\n((Vname\nVlocal_site\nttp995\nsg40\nS\'id\'\np996\nsg42\n(lp997\nsg44\nVreviews_group\np998\nsg46\nS\'\'\nsg47\nI01\nsssS\'Screenshot\'\np999\n(dp1000\ng9\n(dp1001\ng97\n(dp1002\ng13\ng76\nsg75\nI256\nssS\'image\'\np1003\n(dp1004\ng13\ncdjango.db.models.fields.files\nImageField\np1005\nsg75\nI100\nssS\'id\'\np1006\n(dp1007\ng13\ng32\nsg33\nI01\nssg95\n(dp1008\ng13\ng76\nsg75\nI256\nsssg36\n(dp1009\ng38\n(lp1010\nsg40\nS\'id\'\np1011\nsg42\n(lp1012\nsg44\nVreviews_screenshot\np1013\nsg46\nS\'\'\nsg47\nI01\nsssS\'FileAttachmentComment\'\np1014\n(dp1015\ng9\n(dp1016\ng942\n(dp1017\ng13\ng17\nssg11\n(dp1018\ng13\ng14\nssS\'diff_against_file_attachment\'\np1019\n(dp1020\ng13\ng23\nsg24\nI01\nsg25\nS\'attachments.FileAttachment\'\np1021\nssg15\n(dp1022\ng13\ng17\nssS\'file_attachment\'\np1023\n(dp1024\ng13\ng23\nsg25\nS\'attachments.FileAttachment\'\np1025\nssg27\n(dp1026\ng13\ng29\nssg953\n(dp1027\ng13\ng23\nsg24\nI01\nsg25\nS\'reviews.FileAttachmentComment\'\np1028\nssg165\n(dp1029\ng13\ng20\nsg24\nI01\nssS\'id\'\np1030\n(dp1031\ng13\ng32\nsg33\nI01\nssg961\n(dp1032\ng75\nI1\nsg13\ng76\nsg24\nI01\nsg94\nI01\nsssg36\n(dp1033\ng38\n(lp1034\nsg40\nS\'id\'\np1035\nsg42\n(lp1036\nsg44\nVreviews_fileattachmentcomment\np1037\nsg46\nS\'\'\nsg47\nI01\nsssS\'Review\'\np1038\n(dp1039\ng9\n(dp1040\nS\'ship_it\'\np1041\n(dp1042\ng13\ng17\nssS\'base_reply_to\'\np1043\n(dp1044\ng13\ng23\nsg24\nI01\nsg25\nS\'reviews.Review\'\np1045\nssS\'email_message_id\'\np1046\n(dp1047\ng75\nI255\nsg13\ng76\nsg24\nI01\nssS\'id\'\np1048\n(dp1049\ng13\ng32\nsg33\nI01\nssS\'body_top_rich_text\'\np1050\n(dp1051\ng13\ng17\nssS\'comments\'\np1052\n(dp1053\ng13\ng188\nsg25\nS\'reviews.Comment\'\np1054\nssS\'reviewed_diffset\'\np1055\n(dp1056\ng13\ng23\nsg24\nI01\nsg25\nS\'diffviewer.DiffSet\'\np1057\nssg165\n(dp1058\ng13\ng20\nsg24\nI01\nssg249\n(dp1059\ng13\ng23\nsg25\nS\'reviews.ReviewRequest\'\np1060\nssg15\n(dp1061\ng13\ng17\nssS\'file_attachment_comments\'\np1062\n(dp1063\ng13\ng188\nsg25\nS\'reviews.FileAttachmentComment\'\np1064\nssg11\n(dp1065\ng13\ng14\nssS\'general_comments\'\np1066\n(dp1067\ng13\ng188\nsg25\nS\'reviews.GeneralComment\'\np1068\nssS\'screenshot_comments\'\np1069\n(dp1070\ng13\ng188\nsg25\nS\'reviews.ScreenshotComment\'\np1071\nssg21\n(dp1072\ng13\ng23\nsg25\nS\'auth.User\'\np1073\nssS\'time_emailed\'\np1074\n(dp1075\ng13\ng14\nsg24\nI01\nssS\'body_bottom_reply_to\'\np1076\n(dp1077\ng13\ng23\nsg24\nI01\nsg25\nS\'reviews.Review\'\np1078\nssS\'body_top\'\np1079\n(dp1080\ng13\ng29\nssS\'body_bottom_rich_text\'\np1081\n(dp1082\ng13\ng17\nssg34\n(dp1083\ng13\ng17\nssS\'body_bottom\'\np1084\n(dp1085\ng13\ng29\nssS\'body_top_reply_to\'\np1086\n(dp1087\ng13\ng23\nsg24\nI01\nsg25\nS\'reviews.Review\'\np1088\nsssg36\n(dp1089\ng38\n(lp1090\nsg40\nS\'id\'\np1091\nsg42\n(lp1092\nsg44\nVreviews_review\np1093\nsg46\nS\'\'\nsg47\nI01\nsssS\'ReviewRequestDraft\'\np1094\n(dp1095\ng9\n(dp1096\ng153\n(dp1097\ng13\ncdjblets.db.fields.modification_timestamp_field\nModificationTimestampField\np1098\nssS\'target_people\'\np1099\n(dp1100\ng13\ng188\nsg25\nS\'auth.User\'\np1101\nssS\'inactive_screenshots\'\np1102\n(dp1103\ng13\ng188\nsg25\nS\'reviews.Screenshot\'\np1104\nssS\'file_attachments\'\np1105\n(dp1106\ng13\ng188\nsg25\nS\'attachments.FileAttachment\'\np1107\nssS\'owner\'\np1108\n(dp1109\ng13\ng23\nsg24\nI01\nsg25\nS\'auth.User\'\np1110\nssS\'changedesc\'\np1111\n(dp1112\ng13\ng23\nsg24\nI01\nsg25\nS\'changedescs.ChangeDescription\'\np1113\nssS\'screenshots\'\np1114\n(dp1115\ng13\ng188\nsg25\nS\'reviews.Screenshot\'\np1116\nssS\'id\'\np1117\n(dp1118\ng13\ng32\nsg33\nI01\nssS\'inactive_file_attachments_count\'\np1119\n(dp1120\ng13\ng62\nsg24\nI01\nssS\'bugs_closed\'\np1121\n(dp1122\ng13\ng76\nsg75\nI300\nssS\'testing_done\'\np1123\n(dp1124\ng13\ng29\nssS\'description_rich_text\'\np1125\n(dp1126\ng13\ng17\nssS\'depends_on\'\np1127\n(dp1128\ng13\ng188\nsg24\nI01\nsg25\nS\'reviews.ReviewRequest\'\np1129\nssg165\n(dp1130\ng13\ng20\nsg24\nI01\nssg249\n(dp1131\ng13\ng23\nsg222\nI01\nsg25\nS\'reviews.ReviewRequest\'\np1132\nssg15\n(dp1133\ng13\ng17\nssS\'commit_id\'\np1134\n(dp1135\ng75\nI64\nsg13\ng76\nsg24\nI01\nsg94\nI01\nssS\'file_attachments_count\'\np1136\n(dp1137\ng13\ng62\nsg24\nI01\nssS\'description\'\np1138\n(dp1139\ng13\ng29\nssS\'inactive_screenshots_count\'\np1140\n(dp1141\ng13\ng62\nsg24\nI01\nssS\'inactive_file_attachments\'\np1142\n(dp1143\ng13\ng188\nsg25\nS\'attachments.FileAttachment\'\np1144\nssS\'branch\'\np1145\n(dp1146\ng13\ng76\nsg75\nI300\nssS\'testing_done_rich_text\'\np1147\n(dp1148\ng13\ng17\nssg395\n(dp1149\ng13\ng23\nsg24\nI01\nsg25\nS\'diffviewer.DiffSet\'\np1150\nssS\'target_groups\'\np1151\n(dp1152\ng13\ng188\nsg25\nS\'reviews.Group\'\np1153\nssS\'summary\'\np1154\n(dp1155\ng13\ng76\nsg75\nI300\nssS\'screenshots_count\'\np1156\n(dp1157\ng13\ng62\nsg24\nI01\nsssg36\n(dp1158\ng38\n(lp1159\nsg40\nS\'id\'\np1160\nsg42\n(lp1161\nsg44\nVreviews_reviewrequestdraft\np1162\nsg46\nS\'\'\nsg47\nI01\nsssS\'GeneralComment\'\np1163\n(dp1164\ng9\n(dp1165\ng942\n(dp1166\ng13\ng17\nssg11\n(dp1167\ng13\ng14\nssg15\n(dp1168\ng13\ng17\nssg27\n(dp1169\ng13\ng29\nssg953\n(dp1170\ng13\ng23\nsg24\nI01\nsg25\nS\'reviews.GeneralComment\'\np1171\nssg165\n(dp1172\ng13\ng20\nsg24\nI01\nssS\'id\'\np1173\n(dp1174\ng13\ng32\nsg33\nI01\nssg961\n(dp1175\ng75\nI1\nsg13\ng76\nsg24\nI01\nsg94\nI01\nsssg36\n(dp1176\ng38\n(lp1177\nsg40\nS\'id\'\np1178\nsg42\n(lp1179\nsg44\nVreviews_generalcomment\np1180\nsg46\nS\'\'\nsg47\nI01\nsssS\'ReviewRequest\'\np1181\n(dp1182\ng9\n(dp1183\nS\'issue_verifying_count\'\np1184\n(dp1185\ng13\ng287\nsg24\nI01\nssg387\n(dp1186\ng13\ng76\nsg75\nI1\nsg94\nI01\nssg153\n(dp1187\ng13\ng1098\nssg1099\n(dp1188\ng13\ng188\nsg25\nS\'auth.User\'\np1189\nssS\'changedescs\'\np1190\n(dp1191\ng13\ng188\nsg25\nS\'changedescs.ChangeDescription\'\np1192\nssg1102\n(dp1193\ng13\ng188\nsg25\nS\'reviews.Screenshot\'\np1194\nssg1046\n(dp1195\ng75\nI255\nsg13\ng76\nsg24\nI01\nssS\'last_review_activity_timestamp\'\np1196\n(dp1197\ng13\ng14\nsg24\nI01\nsg393\nVlast_review_timestamp\np1198\nssS\'diffset_history\'\np1199\n(dp1200\ng13\ng23\nsg25\nS\'diffviewer.DiffSetHistory\'\np1201\nssg1114\n(dp1202\ng13\ng188\nsg25\nS\'reviews.Screenshot\'\np1203\nssS\'id\'\np1204\n(dp1205\ng13\ng32\nsg33\nI01\nssS\'issue_dropped_count\'\np1206\n(dp1207\ng13\ng287\nsg24\nI01\nssg1119\n(dp1208\ng13\ng62\nsg24\nI01\nssg1121\n(dp1209\ng13\ng76\nsg75\nI300\nssg1123\n(dp1210\ng13\ng29\nssg1125\n(dp1211\ng13\ng17\nssg1127\n(dp1212\ng13\ng188\nsg24\nI01\nsg25\nS\'reviews.ReviewRequest\'\np1213\nssg163\n(dp1214\ng13\ng14\nssg165\n(dp1215\ng13\ng20\nsg24\nI01\nssg34\n(dp1216\ng13\ng17\nssg1134\n(dp1217\ng75\nI64\nsg13\ng76\nsg24\nI01\nsg94\nI01\nssS\'shipit_count\'\np1218\n(dp1219\ng13\ng287\nsg24\nI01\nssg1136\n(dp1220\ng13\ng62\nsg24\nI01\nssg1138\n(dp1221\ng13\ng29\nssg86\n(dp1222\ng13\ng23\nsg24\nI01\nsg25\nS\'scmtools.Repository\'\np1223\nssg1140\n(dp1224\ng13\ng62\nsg24\nI01\nssS\'issue_resolved_count\'\np1225\n(dp1226\ng13\ng287\nsg24\nI01\nssS\'issue_open_count\'\np1227\n(dp1228\ng13\ng287\nsg24\nI01\nssg1142\n(dp1229\ng13\ng188\nsg25\nS\'attachments.FileAttachment\'\np1230\nssg1145\n(dp1231\ng13\ng76\nsg75\nI300\nssS\'file_attachment_histories\'\np1232\n(dp1233\ng13\ng188\nsg25\nS\'attachments.FileAttachmentHistory\'\np1234\nssg1147\n(dp1235\ng13\ng17\nssg89\n(dp1236\ng13\ng23\nsg24\nI01\nsg25\nS\'site.LocalSite\'\np1237\nssg1151\n(dp1238\ng13\ng188\nsg25\nS\'reviews.Group\'\np1239\nssg1154\n(dp1240\ng13\ng76\nsg75\nI300\nssS\'changenum\'\np1241\n(dp1242\ng13\ng949\nsg24\nI01\nsg94\nI01\nssS\'local_id\'\np1243\n(dp1244\ng13\ng59\nsg24\nI01\nssS\'submitter\'\np1245\n(dp1246\ng13\ng23\nsg25\nS\'auth.User\'\np1247\nssg1074\n(dp1248\ng13\ng14\nsg24\nI01\nssg15\n(dp1249\ng13\ng17\nssg1156\n(dp1250\ng13\ng62\nsg24\nI01\nssg1105\n(dp1251\ng13\ng188\nsg25\nS\'attachments.FileAttachment\'\np1252\nsssg36\n(dp1253\ng38\n((Vcommit_id\nVrepository\nt(Vchangenum\nVrepository\nt(Vlocal_site\nVlocal_id\nttp1254\nsg40\nS\'id\'\np1255\nsg42\n(lp1256\nsg44\nVreviews_reviewrequest\np1257\nsg46\nS\'\'\nsg47\nI01\nsssS\'StatusUpdate\'\np1258\n(dp1259\ng9\n(dp1260\nS\'change_description\'\np1261\n(dp1262\ng13\ng23\nsg24\nI01\nsg25\nS\'changedescs.ChangeDescription\'\np1263\nssS\'url_text\'\np1264\n(dp1265\ng13\ng76\nsg75\nI64\nssg1138\n(dp1266\ng13\ng76\nsg75\nI255\nssg739\n(dp1267\ng13\ng741\nsg75\nI255\nssg11\n(dp1268\ng13\ng14\nssS\'review\'\np1269\n(dp1270\ng13\ng465\nsg222\nI01\nsg24\nI01\nsg25\nS\'reviews.Review\'\np1271\nssg1154\n(dp1272\ng13\ng76\nsg75\nI255\nssS\'state\'\np1273\n(dp1274\ng13\ng76\nsg75\nI1\nssg21\n(dp1275\ng13\ng23\nsg24\nI01\nsg25\nS\'auth.User\'\np1276\nssS\'timeout\'\np1277\n(dp1278\ng13\ng59\nsg24\nI01\nssS\'service_id\'\np1279\n(dp1280\ng13\ng76\nsg75\nI255\nssg165\n(dp1281\ng13\ng20\nsg24\nI01\nssg249\n(dp1282\ng13\ng23\nsg25\nS\'reviews.ReviewRequest\'\np1283\nssS\'id\'\np1284\n(dp1285\ng13\ng32\nsg33\nI01\nsssg36\n(dp1286\ng38\n(lp1287\nsg40\nS\'id\'\np1288\nsg42\n(lp1289\nsg44\nVreviews_statusupdate\np1290\nsg46\nS\'\'\nsg47\nI01\nsssS\'DefaultReviewer\'\np1291\n(dp1292\ng9\n(dp1293\nS\'file_regex\'\np1294\n(dp1295\ng13\ng76\nsg75\nI256\nssg155\n(dp1296\ng13\ng76\nsg75\nI64\nssg86\n(dp1297\ng13\ng188\nsg25\nS\'scmtools.Repository\'\np1298\nssg89\n(dp1299\ng13\ng23\nsg24\nI01\nsg25\nS\'site.LocalSite\'\np1300\nssS\'people\'\np1301\n(dp1302\ng13\ng188\nsg25\nS\'auth.User\'\np1303\nssg671\n(dp1304\ng13\ng188\nsg25\nS\'reviews.Group\'\np1305\nssS\'id\'\np1306\n(dp1307\ng13\ng32\nsg33\nI01\nsssg36\n(dp1308\ng38\n(lp1309\nsg40\nS\'id\'\np1310\nsg42\n(lp1311\nsg44\nVreviews_defaultreviewer\np1312\nsg46\nS\'\'\nsg47\nI01\nsssS\'ScreenshotComment\'\np1313\n(dp1314\ng9\n(dp1315\ng942\n(dp1316\ng13\ng17\nssS\'screenshot\'\np1317\n(dp1318\ng13\ng23\nsg25\nS\'reviews.Screenshot\'\np1319\nssg11\n(dp1320\ng13\ng14\nssg15\n(dp1321\ng13\ng17\nssS\'y\'\n(dp1322\ng13\ng893\nssS\'h\'\n(dp1323\ng13\ng893\nssS\'w\'\n(dp1324\ng13\ng893\nssg27\n(dp1325\ng13\ng29\nssg953\n(dp1326\ng13\ng23\nsg24\nI01\nsg25\nS\'reviews.ScreenshotComment\'\np1327\nssS\'x\'\n(dp1328\ng13\ng893\nsg24\nI01\nssg165\n(dp1329\ng13\ng20\nsg24\nI01\nssS\'id\'\np1330\n(dp1331\ng13\ng32\nsg33\nI01\nssg961\n(dp1332\ng75\nI1\nsg13\ng76\nsg24\nI01\nsg94\nI01\nsssg36\n(dp1333\ng38\n(lp1334\nsg40\nS\'id\'\np1335\nsg42\n(lp1336\nsg44\nVreviews_screenshotcomment\np1337\nsg46\nS\'\'\nsg47\nI01\nssstRp1338\n(dp1339\ng50\n(lp1340\ng639\nag1291\nag939\nag1014\nag1163\nag999\nag1181\nag1313\nag1038\nag1094\nag1258\nasbsS\'extensions\'\np1341\ng3\n(g4\ng5\n(dp1342\nS\'RegisteredExtension\'\np1343\n(dp1344\ng9\n(dp1345\ng155\n(dp1346\ng13\ng76\nsg75\nI32\nssg157\n(dp1347\ng13\ng20\nssg501\n(dp1348\ng75\nI128\nsg13\ng76\nsg222\nI01\nssg161\n(dp1349\ng13\ng17\nssS\'installed\'\np1350\n(dp1351\ng13\ng17\nssS\'id\'\np1352\n(dp1353\ng13\ng32\nsg33\nI01\nsssg36\n(dp1354\ng38\n(lp1355\nsg40\nS\'id\'\np1356\nsg42\n(lp1357\nsg44\nVextensions_registeredextension\np1358\nsg46\nS\'\'\nsg47\nI01\nssstRp1359\n(dp1360\ng50\n(lp1361\ng1343\nasbsS\'django_evolution\'\np1362\ng3\n(g4\ng5\n(dp1363\nS\'Evolution\'\np1364\n(dp1365\ng9\n(dp1366\nS\'label\'\np1367\n(dp1368\ng13\ng76\nsg75\nI100\nssg921\n(dp1369\ng13\ng23\nsg25\nS\'django_evolution.Version\'\np1370\nssS\'id\'\np1371\n(dp1372\ng13\ng32\nsg33\nI01\nssg569\n(dp1373\ng13\ng76\nsg75\nI200\nsssg36\n(dp1374\ng38\n(lp1375\nsg40\nS\'id\'\np1376\nsg42\n(lp1377\nsg44\nS\'django_evolution\'\np1378\nsg46\nS\'\'\nsg47\nI01\nsssS\'Version\'\np1379\n(dp1380\ng9\n(dp1381\nS\'when\'\np1382\n(dp1383\ng13\ng14\nssS\'id\'\np1384\n(dp1385\ng13\ng32\nsg33\nI01\nssS\'signature\'\np1386\n(dp1387\ng13\ng29\nsssg36\n(dp1388\ng38\n(lp1389\nsg40\nS\'id\'\np1390\nsg42\n(lp1391\nsg44\nS\'django_project_version\'\np1392\nsg46\nS\'\'\nsg47\nI01\nssstRp1393\n(dp1394\ng50\n(lp1395\ng1379\nag1364\nasbs.','2022-05-16 00:41:20');
/*!40000 ALTER TABLE `django_project_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_b7b81f0c` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_site`
--

LOCK TABLES `django_site` WRITE;
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
INSERT INTO `django_site` VALUES (1,'example.com','example.com');
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `djblets_privacy_storedconsentdata`
--

DROP TABLE IF EXISTS `djblets_privacy_storedconsentdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `djblets_privacy_storedconsentdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `audit_identifier` varchar(255) DEFAULT NULL,
  `time_added` datetime NOT NULL,
  `last_updated` datetime NOT NULL,
  `consent_grants` longtext NOT NULL,
  `audit_trail` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `djblets_privacy_storedconsentdata_3620e37c` (`audit_identifier`),
  CONSTRAINT `user_id_refs_id_ddebe311` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `djblets_privacy_storedconsentdata`
--

LOCK TABLES `djblets_privacy_storedconsentdata` WRITE;
/*!40000 ALTER TABLE `djblets_privacy_storedconsentdata` DISABLE KEYS */;
/*!40000 ALTER TABLE `djblets_privacy_storedconsentdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extensions_registeredextension`
--

DROP TABLE IF EXISTS `extensions_registeredextension`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extensions_registeredextension` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class_name` varchar(128) NOT NULL,
  `name` varchar(32) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `installed` tinyint(1) NOT NULL,
  `settings` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `class_name` (`class_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extensions_registeredextension`
--

LOCK TABLES `extensions_registeredextension` WRITE;
/*!40000 ALTER TABLE `extensions_registeredextension` DISABLE KEYS */;
/*!40000 ALTER TABLE `extensions_registeredextension` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hostingsvcs_hostingserviceaccount`
--

DROP TABLE IF EXISTS `hostingsvcs_hostingserviceaccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hostingsvcs_hostingserviceaccount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_name` varchar(128) NOT NULL,
  `hosting_url` varchar(255) DEFAULT NULL,
  `username` varchar(128) NOT NULL,
  `data` longtext NOT NULL,
  `visible` tinyint(1) NOT NULL,
  `local_site_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `hostingsvcs_hostingserviceaccount_c467b315` (`local_site_id`),
  CONSTRAINT `local_site_id_refs_id_a9322242` FOREIGN KEY (`local_site_id`) REFERENCES `site_localsite` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hostingsvcs_hostingserviceaccount`
--

LOCK TABLES `hostingsvcs_hostingserviceaccount` WRITE;
/*!40000 ALTER TABLE `hostingsvcs_hostingserviceaccount` DISABLE KEYS */;
/*!40000 ALTER TABLE `hostingsvcs_hostingserviceaccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `integrations_integrationconfig`
--

DROP TABLE IF EXISTS `integrations_integrationconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `integrations_integrationconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `integration_id` varchar(255) NOT NULL,
  `time_added` datetime NOT NULL,
  `last_updated` datetime NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  `settings` longtext NOT NULL,
  `extra_data` longtext NOT NULL,
  `local_site_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `integrations_integrationconfig_814d1441` (`integration_id`),
  KEY `integrations_integrationconfig_361e170c` (`enabled`),
  KEY `integrations_integrationconfig_c467b315` (`local_site_id`),
  CONSTRAINT `local_site_id_refs_id_a6444871` FOREIGN KEY (`local_site_id`) REFERENCES `site_localsite` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `integrations_integrationconfig`
--

LOCK TABLES `integrations_integrationconfig` WRITE;
/*!40000 ALTER TABLE `integrations_integrationconfig` DISABLE KEYS */;
/*!40000 ALTER TABLE `integrations_integrationconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications_webhooktarget`
--

DROP TABLE IF EXISTS `notifications_webhooktarget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications_webhooktarget` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enabled` tinyint(1) NOT NULL,
  `events` varchar(105) NOT NULL,
  `url` varchar(200) NOT NULL,
  `encoding` varchar(40) NOT NULL,
  `use_custom_content` tinyint(1) NOT NULL,
  `custom_content` longtext,
  `secret` varchar(128) NOT NULL,
  `apply_to` varchar(1) NOT NULL,
  `local_site_id` int(11) DEFAULT NULL,
  `extra_data` longtext,
  PRIMARY KEY (`id`),
  KEY `notifications_webhooktarget_c467b315` (`local_site_id`),
  CONSTRAINT `local_site_id_refs_id_fd45c4e8` FOREIGN KEY (`local_site_id`) REFERENCES `site_localsite` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications_webhooktarget`
--

LOCK TABLES `notifications_webhooktarget` WRITE;
/*!40000 ALTER TABLE `notifications_webhooktarget` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifications_webhooktarget` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications_webhooktarget_repositories`
--

DROP TABLE IF EXISTS `notifications_webhooktarget_repositories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications_webhooktarget_repositories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `webhooktarget_id` int(11) NOT NULL,
  `repository_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `webhooktarget_id` (`webhooktarget_id`,`repository_id`),
  KEY `notifications_webhooktarget_repositories_69be96ee` (`webhooktarget_id`),
  KEY `notifications_webhooktarget_repositories_a322ed1e` (`repository_id`),
  CONSTRAINT `repository_id_refs_id_c926fd2a` FOREIGN KEY (`repository_id`) REFERENCES `scmtools_repository` (`id`),
  CONSTRAINT `webhooktarget_id_refs_id_d5ae3ed2` FOREIGN KEY (`webhooktarget_id`) REFERENCES `notifications_webhooktarget` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications_webhooktarget_repositories`
--

LOCK TABLES `notifications_webhooktarget_repositories` WRITE;
/*!40000 ALTER TABLE `notifications_webhooktarget_repositories` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifications_webhooktarget_repositories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_accesstoken`
--

DROP TABLE IF EXISTS `oauth2_provider_accesstoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth2_provider_accesstoken` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `token` varchar(255) NOT NULL,
  `application_id` int(11) NOT NULL,
  `expires` datetime NOT NULL,
  `scope` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth2_provider_accesstoken_6340c63c` (`user_id`),
  KEY `oauth2_provider_accesstoken_e0a0c5a7` (`token`),
  KEY `oauth2_provider_accesstoken_bf127e2f` (`application_id`),
  CONSTRAINT `application_id_refs_id_b5bbd547` FOREIGN KEY (`application_id`) REFERENCES `reviewboard_oauth_application` (`id`),
  CONSTRAINT `user_id_refs_id_11f4dade` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_accesstoken`
--

LOCK TABLES `oauth2_provider_accesstoken` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_accesstoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth2_provider_accesstoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_application`
--

DROP TABLE IF EXISTS `oauth2_provider_application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth2_provider_application` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL,
  `redirect_uris` longtext NOT NULL,
  `client_type` varchar(32) NOT NULL,
  `authorization_grant_type` varchar(32) NOT NULL,
  `client_secret` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `skip_authorization` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `client_id` (`client_id`),
  KEY `oauth2_provider_application_6340c63c` (`user_id`),
  KEY `oauth2_provider_application_1986ffac` (`client_secret`),
  CONSTRAINT `user_id_refs_id_f9cca3bd` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_application`
--

LOCK TABLES `oauth2_provider_application` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_application` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth2_provider_application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_grant`
--

DROP TABLE IF EXISTS `oauth2_provider_grant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth2_provider_grant` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `code` varchar(255) NOT NULL,
  `application_id` int(11) NOT NULL,
  `expires` datetime NOT NULL,
  `redirect_uri` varchar(255) NOT NULL,
  `scope` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth2_provider_grant_6340c63c` (`user_id`),
  KEY `oauth2_provider_grant_09bb5fb3` (`code`),
  KEY `oauth2_provider_grant_bf127e2f` (`application_id`),
  CONSTRAINT `application_id_refs_id_46135b92` FOREIGN KEY (`application_id`) REFERENCES `reviewboard_oauth_application` (`id`),
  CONSTRAINT `user_id_refs_id_27d71a58` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_grant`
--

LOCK TABLES `oauth2_provider_grant` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_grant` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth2_provider_grant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_refreshtoken`
--

DROP TABLE IF EXISTS `oauth2_provider_refreshtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth2_provider_refreshtoken` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `token` varchar(255) NOT NULL,
  `application_id` int(11) NOT NULL,
  `access_token_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `access_token_id` (`access_token_id`),
  KEY `oauth2_provider_refreshtoken_6340c63c` (`user_id`),
  KEY `oauth2_provider_refreshtoken_e0a0c5a7` (`token`),
  KEY `oauth2_provider_refreshtoken_bf127e2f` (`application_id`),
  CONSTRAINT `access_token_id_refs_id_4eca7025` FOREIGN KEY (`access_token_id`) REFERENCES `oauth2_provider_accesstoken` (`id`),
  CONSTRAINT `application_id_refs_id_fe494fdb` FOREIGN KEY (`application_id`) REFERENCES `reviewboard_oauth_application` (`id`),
  CONSTRAINT `user_id_refs_id_76772602` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_refreshtoken`
--

LOCK TABLES `oauth2_provider_refreshtoken` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_refreshtoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth2_provider_refreshtoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviewboard_oauth_application`
--

DROP TABLE IF EXISTS `reviewboard_oauth_application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviewboard_oauth_application` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL,
  `redirect_uris` longtext NOT NULL,
  `client_type` varchar(32) NOT NULL,
  `authorization_grant_type` varchar(32) NOT NULL,
  `client_secret` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `skip_authorization` tinyint(1) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `original_user_id` int(11) DEFAULT NULL,
  `local_site_id` int(11) DEFAULT NULL,
  `extra_data` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `client_id` (`client_id`),
  KEY `reviewboard_oauth_application_6340c63c` (`user_id`),
  KEY `reviewboard_oauth_application_1986ffac` (`client_secret`),
  KEY `reviewboard_oauth_application_24741952` (`original_user_id`),
  KEY `reviewboard_oauth_application_c467b315` (`local_site_id`),
  CONSTRAINT `local_site_id_refs_id_0f6c884f` FOREIGN KEY (`local_site_id`) REFERENCES `site_localsite` (`id`),
  CONSTRAINT `original_user_id_refs_id_c038d3ed` FOREIGN KEY (`original_user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `user_id_refs_id_c038d3ed` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviewboard_oauth_application`
--

LOCK TABLES `reviewboard_oauth_application` WRITE;
/*!40000 ALTER TABLE `reviewboard_oauth_application` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviewboard_oauth_application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews_comment`
--

DROP TABLE IF EXISTS `reviews_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `issue_opened` tinyint(1) NOT NULL,
  `issue_status` varchar(1) DEFAULT NULL,
  `reply_to_id` int(11) DEFAULT NULL,
  `timestamp` datetime NOT NULL,
  `text` longtext NOT NULL,
  `rich_text` tinyint(1) NOT NULL,
  `extra_data` longtext,
  `filediff_id` int(11) NOT NULL,
  `interfilediff_id` int(11) DEFAULT NULL,
  `first_line` int(10) unsigned DEFAULT NULL,
  `num_lines` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reviews_comment_3b281963` (`issue_status`),
  KEY `reviews_comment_3fde75e6` (`reply_to_id`),
  KEY `reviews_comment_9abbbbd3` (`filediff_id`),
  KEY `reviews_comment_3a17b898` (`interfilediff_id`),
  CONSTRAINT `filediff_id_refs_id_828a3cce` FOREIGN KEY (`filediff_id`) REFERENCES `diffviewer_filediff` (`id`),
  CONSTRAINT `interfilediff_id_refs_id_828a3cce` FOREIGN KEY (`interfilediff_id`) REFERENCES `diffviewer_filediff` (`id`),
  CONSTRAINT `reply_to_id_refs_id_fd1965c8` FOREIGN KEY (`reply_to_id`) REFERENCES `reviews_comment` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews_comment`
--

LOCK TABLES `reviews_comment` WRITE;
/*!40000 ALTER TABLE `reviews_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviews_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews_defaultreviewer`
--

DROP TABLE IF EXISTS `reviews_defaultreviewer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews_defaultreviewer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `file_regex` varchar(256) NOT NULL,
  `local_site_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reviews_defaultreviewer_c467b315` (`local_site_id`),
  CONSTRAINT `local_site_id_refs_id_c0a6afc5` FOREIGN KEY (`local_site_id`) REFERENCES `site_localsite` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews_defaultreviewer`
--

LOCK TABLES `reviews_defaultreviewer` WRITE;
/*!40000 ALTER TABLE `reviews_defaultreviewer` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviews_defaultreviewer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews_defaultreviewer_groups`
--

DROP TABLE IF EXISTS `reviews_defaultreviewer_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews_defaultreviewer_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `defaultreviewer_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `defaultreviewer_id` (`defaultreviewer_id`,`group_id`),
  KEY `reviews_defaultreviewer_groups_f5a668e1` (`defaultreviewer_id`),
  KEY `reviews_defaultreviewer_groups_5f412f9a` (`group_id`),
  CONSTRAINT `defaultreviewer_id_refs_id_cfe99890` FOREIGN KEY (`defaultreviewer_id`) REFERENCES `reviews_defaultreviewer` (`id`),
  CONSTRAINT `group_id_refs_id_5ec14322` FOREIGN KEY (`group_id`) REFERENCES `reviews_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews_defaultreviewer_groups`
--

LOCK TABLES `reviews_defaultreviewer_groups` WRITE;
/*!40000 ALTER TABLE `reviews_defaultreviewer_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviews_defaultreviewer_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews_defaultreviewer_people`
--

DROP TABLE IF EXISTS `reviews_defaultreviewer_people`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews_defaultreviewer_people` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `defaultreviewer_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `defaultreviewer_id` (`defaultreviewer_id`,`user_id`),
  KEY `reviews_defaultreviewer_people_f5a668e1` (`defaultreviewer_id`),
  KEY `reviews_defaultreviewer_people_6340c63c` (`user_id`),
  CONSTRAINT `defaultreviewer_id_refs_id_3bff5f07` FOREIGN KEY (`defaultreviewer_id`) REFERENCES `reviews_defaultreviewer` (`id`),
  CONSTRAINT `user_id_refs_id_92a50650` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews_defaultreviewer_people`
--

LOCK TABLES `reviews_defaultreviewer_people` WRITE;
/*!40000 ALTER TABLE `reviews_defaultreviewer_people` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviews_defaultreviewer_people` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews_defaultreviewer_repository`
--

DROP TABLE IF EXISTS `reviews_defaultreviewer_repository`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews_defaultreviewer_repository` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `defaultreviewer_id` int(11) NOT NULL,
  `repository_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `defaultreviewer_id` (`defaultreviewer_id`,`repository_id`),
  KEY `reviews_defaultreviewer_repository_f5a668e1` (`defaultreviewer_id`),
  KEY `reviews_defaultreviewer_repository_a322ed1e` (`repository_id`),
  CONSTRAINT `defaultreviewer_id_refs_id_b8151726` FOREIGN KEY (`defaultreviewer_id`) REFERENCES `reviews_defaultreviewer` (`id`),
  CONSTRAINT `repository_id_refs_id_76c00819` FOREIGN KEY (`repository_id`) REFERENCES `scmtools_repository` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews_defaultreviewer_repository`
--

LOCK TABLES `reviews_defaultreviewer_repository` WRITE;
/*!40000 ALTER TABLE `reviews_defaultreviewer_repository` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviews_defaultreviewer_repository` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews_fileattachmentcomment`
--

DROP TABLE IF EXISTS `reviews_fileattachmentcomment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews_fileattachmentcomment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `issue_opened` tinyint(1) NOT NULL,
  `issue_status` varchar(1) DEFAULT NULL,
  `reply_to_id` int(11) DEFAULT NULL,
  `timestamp` datetime NOT NULL,
  `text` longtext NOT NULL,
  `rich_text` tinyint(1) NOT NULL,
  `extra_data` longtext,
  `file_attachment_id` int(11) NOT NULL,
  `diff_against_file_attachment_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reviews_fileattachmentcomment_3b281963` (`issue_status`),
  KEY `reviews_fileattachmentcomment_3fde75e6` (`reply_to_id`),
  KEY `reviews_fileattachmentcomment_a9d9ad46` (`file_attachment_id`),
  KEY `reviews_fileattachmentcomment_57fb824c` (`diff_against_file_attachment_id`),
  CONSTRAINT `diff_against_file_attachment_id_refs_id_e1503f1b` FOREIGN KEY (`diff_against_file_attachment_id`) REFERENCES `attachments_fileattachment` (`id`),
  CONSTRAINT `file_attachment_id_refs_id_e1503f1b` FOREIGN KEY (`file_attachment_id`) REFERENCES `attachments_fileattachment` (`id`),
  CONSTRAINT `reply_to_id_refs_id_3eba00fd` FOREIGN KEY (`reply_to_id`) REFERENCES `reviews_fileattachmentcomment` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews_fileattachmentcomment`
--

LOCK TABLES `reviews_fileattachmentcomment` WRITE;
/*!40000 ALTER TABLE `reviews_fileattachmentcomment` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviews_fileattachmentcomment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews_generalcomment`
--

DROP TABLE IF EXISTS `reviews_generalcomment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews_generalcomment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `issue_opened` tinyint(1) NOT NULL,
  `issue_status` varchar(1) DEFAULT NULL,
  `reply_to_id` int(11) DEFAULT NULL,
  `timestamp` datetime NOT NULL,
  `text` longtext NOT NULL,
  `rich_text` tinyint(1) NOT NULL,
  `extra_data` longtext,
  PRIMARY KEY (`id`),
  KEY `reviews_generalcomment_3b281963` (`issue_status`),
  KEY `reviews_generalcomment_3fde75e6` (`reply_to_id`),
  CONSTRAINT `reply_to_id_refs_id_c80c2c64` FOREIGN KEY (`reply_to_id`) REFERENCES `reviews_generalcomment` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews_generalcomment`
--

LOCK TABLES `reviews_generalcomment` WRITE;
/*!40000 ALTER TABLE `reviews_generalcomment` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviews_generalcomment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews_group`
--

DROP TABLE IF EXISTS `reviews_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `display_name` varchar(64) NOT NULL,
  `mailing_list` varchar(254) NOT NULL,
  `email_list_only` tinyint(1) NOT NULL,
  `local_site_id` int(11) DEFAULT NULL,
  `is_default_group` tinyint(1) NOT NULL,
  `incoming_request_count` int(11) DEFAULT NULL,
  `invite_only` tinyint(1) NOT NULL,
  `visible` tinyint(1) NOT NULL,
  `extra_data` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`,`local_site_id`),
  KEY `reviews_group_4da47e07` (`name`),
  KEY `reviews_group_c467b315` (`local_site_id`),
  CONSTRAINT `local_site_id_refs_id_a49a9c59` FOREIGN KEY (`local_site_id`) REFERENCES `site_localsite` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews_group`
--

LOCK TABLES `reviews_group` WRITE;
/*!40000 ALTER TABLE `reviews_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviews_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews_group_users`
--

DROP TABLE IF EXISTS `reviews_group_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews_group_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`user_id`),
  KEY `reviews_group_users_5f412f9a` (`group_id`),
  KEY `reviews_group_users_6340c63c` (`user_id`),
  CONSTRAINT `group_id_refs_id_0f32ed01` FOREIGN KEY (`group_id`) REFERENCES `reviews_group` (`id`),
  CONSTRAINT `user_id_refs_id_48ce76d2` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews_group_users`
--

LOCK TABLES `reviews_group_users` WRITE;
/*!40000 ALTER TABLE `reviews_group_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviews_group_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews_review`
--

DROP TABLE IF EXISTS `reviews_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews_review` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `review_request_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `timestamp` datetime NOT NULL,
  `public` tinyint(1) NOT NULL,
  `ship_it` tinyint(1) NOT NULL,
  `base_reply_to_id` int(11) DEFAULT NULL,
  `email_message_id` varchar(255) DEFAULT NULL,
  `time_emailed` datetime DEFAULT NULL,
  `body_top` longtext NOT NULL,
  `body_top_rich_text` tinyint(1) NOT NULL,
  `body_bottom` longtext NOT NULL,
  `body_bottom_rich_text` tinyint(1) NOT NULL,
  `body_top_reply_to_id` int(11) DEFAULT NULL,
  `body_bottom_reply_to_id` int(11) DEFAULT NULL,
  `extra_data` longtext,
  `rich_text` tinyint(1) NOT NULL,
  `reviewed_diffset_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reviews_review_17900555` (`review_request_id`),
  KEY `reviews_review_6340c63c` (`user_id`),
  KEY `reviews_review_a05fe33f` (`base_reply_to_id`),
  KEY `reviews_review_ab465625` (`body_top_reply_to_id`),
  KEY `reviews_review_f15f898e` (`body_bottom_reply_to_id`),
  KEY `reviews_review_daa286e9` (`reviewed_diffset_id`),
  CONSTRAINT `base_reply_to_id_refs_id_ecbf1bcb` FOREIGN KEY (`base_reply_to_id`) REFERENCES `reviews_review` (`id`),
  CONSTRAINT `body_bottom_reply_to_id_refs_id_ecbf1bcb` FOREIGN KEY (`body_bottom_reply_to_id`) REFERENCES `reviews_review` (`id`),
  CONSTRAINT `body_top_reply_to_id_refs_id_ecbf1bcb` FOREIGN KEY (`body_top_reply_to_id`) REFERENCES `reviews_review` (`id`),
  CONSTRAINT `review_request_id_refs_id_c50f4370` FOREIGN KEY (`review_request_id`) REFERENCES `reviews_reviewrequest` (`id`),
  CONSTRAINT `reviewed_diffset_id_refs_id_24c46c80` FOREIGN KEY (`reviewed_diffset_id`) REFERENCES `diffviewer_diffset` (`id`),
  CONSTRAINT `user_id_refs_id_82a34460` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews_review`
--

LOCK TABLES `reviews_review` WRITE;
/*!40000 ALTER TABLE `reviews_review` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviews_review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews_review_comments`
--

DROP TABLE IF EXISTS `reviews_review_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews_review_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `review_id` int(11) NOT NULL,
  `comment_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `review_id` (`review_id`,`comment_id`),
  KEY `reviews_review_comments_a0363c29` (`review_id`),
  KEY `reviews_review_comments_3925f323` (`comment_id`),
  CONSTRAINT `comment_id_refs_id_944088ca` FOREIGN KEY (`comment_id`) REFERENCES `reviews_comment` (`id`),
  CONSTRAINT `review_id_refs_id_20bad945` FOREIGN KEY (`review_id`) REFERENCES `reviews_review` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews_review_comments`
--

LOCK TABLES `reviews_review_comments` WRITE;
/*!40000 ALTER TABLE `reviews_review_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviews_review_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews_review_file_attachment_comments`
--

DROP TABLE IF EXISTS `reviews_review_file_attachment_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews_review_file_attachment_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `review_id` int(11) NOT NULL,
  `fileattachmentcomment_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `review_id` (`review_id`,`fileattachmentcomment_id`),
  KEY `reviews_review_file_attachment_comments_a0363c29` (`review_id`),
  KEY `reviews_review_file_attachment_comments_5a259272` (`fileattachmentcomment_id`),
  CONSTRAINT `fileattachmentcomment_id_refs_id_30af9b48` FOREIGN KEY (`fileattachmentcomment_id`) REFERENCES `reviews_fileattachmentcomment` (`id`),
  CONSTRAINT `review_id_refs_id_e645043f` FOREIGN KEY (`review_id`) REFERENCES `reviews_review` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews_review_file_attachment_comments`
--

LOCK TABLES `reviews_review_file_attachment_comments` WRITE;
/*!40000 ALTER TABLE `reviews_review_file_attachment_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviews_review_file_attachment_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews_review_general_comments`
--

DROP TABLE IF EXISTS `reviews_review_general_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews_review_general_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `review_id` int(11) NOT NULL,
  `generalcomment_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `review_id` (`review_id`,`generalcomment_id`),
  KEY `reviews_review_general_comments_a0363c29` (`review_id`),
  KEY `reviews_review_general_comments_3c4b56aa` (`generalcomment_id`),
  CONSTRAINT `generalcomment_id_refs_id_2b25e9ea` FOREIGN KEY (`generalcomment_id`) REFERENCES `reviews_generalcomment` (`id`),
  CONSTRAINT `review_id_refs_id_54e01f08` FOREIGN KEY (`review_id`) REFERENCES `reviews_review` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews_review_general_comments`
--

LOCK TABLES `reviews_review_general_comments` WRITE;
/*!40000 ALTER TABLE `reviews_review_general_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviews_review_general_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews_review_screenshot_comments`
--

DROP TABLE IF EXISTS `reviews_review_screenshot_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews_review_screenshot_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `review_id` int(11) NOT NULL,
  `screenshotcomment_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `review_id` (`review_id`,`screenshotcomment_id`),
  KEY `reviews_review_screenshot_comments_a0363c29` (`review_id`),
  KEY `reviews_review_screenshot_comments_6cba352d` (`screenshotcomment_id`),
  CONSTRAINT `review_id_refs_id_c422b4cf` FOREIGN KEY (`review_id`) REFERENCES `reviews_review` (`id`),
  CONSTRAINT `screenshotcomment_id_refs_id_4edbb6c5` FOREIGN KEY (`screenshotcomment_id`) REFERENCES `reviews_screenshotcomment` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews_review_screenshot_comments`
--

LOCK TABLES `reviews_review_screenshot_comments` WRITE;
/*!40000 ALTER TABLE `reviews_review_screenshot_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviews_review_screenshot_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews_reviewrequest`
--

DROP TABLE IF EXISTS `reviews_reviewrequest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews_reviewrequest` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` longtext NOT NULL,
  `description_rich_text` tinyint(1) NOT NULL,
  `testing_done` longtext NOT NULL,
  `testing_done_rich_text` tinyint(1) NOT NULL,
  `bugs_closed` varchar(300) NOT NULL,
  `branch` varchar(300) NOT NULL,
  `commit_id` varchar(64) DEFAULT NULL,
  `extra_data` longtext,
  `rich_text` tinyint(1) NOT NULL,
  `summary` varchar(300) NOT NULL,
  `submitter_id` int(11) NOT NULL,
  `time_added` datetime NOT NULL,
  `last_updated` datetime NOT NULL,
  `status` varchar(1) NOT NULL,
  `public` tinyint(1) NOT NULL,
  `changenum` int(10) unsigned DEFAULT NULL,
  `repository_id` int(11) DEFAULT NULL,
  `email_message_id` varchar(255) DEFAULT NULL,
  `time_emailed` datetime DEFAULT NULL,
  `diffset_history_id` int(11) NOT NULL,
  `last_review_timestamp` datetime DEFAULT NULL,
  `shipit_count` int(11) DEFAULT NULL,
  `issue_open_count` int(11) DEFAULT NULL,
  `issue_resolved_count` int(11) DEFAULT NULL,
  `issue_dropped_count` int(11) DEFAULT NULL,
  `issue_verifying_count` int(11) DEFAULT NULL,
  `screenshots_count` int(11) DEFAULT NULL,
  `inactive_screenshots_count` int(11) DEFAULT NULL,
  `file_attachments_count` int(11) DEFAULT NULL,
  `inactive_file_attachments_count` int(11) DEFAULT NULL,
  `local_site_id` int(11) DEFAULT NULL,
  `local_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `commit_id` (`commit_id`,`repository_id`),
  UNIQUE KEY `changenum` (`changenum`,`repository_id`),
  UNIQUE KEY `local_site_id` (`local_site_id`,`local_id`),
  KEY `reviews_reviewrequest_summary` (`summary`(255)),
  KEY `reviews_reviewrequest_e5ba0309` (`commit_id`),
  KEY `reviews_reviewrequest_5f7282ee` (`submitter_id`),
  KEY `reviews_reviewrequest_48fb58bb` (`status`),
  KEY `reviews_reviewrequest_5e9ac186` (`changenum`),
  KEY `reviews_reviewrequest_a322ed1e` (`repository_id`),
  KEY `reviews_reviewrequest_c252e15f` (`diffset_history_id`),
  KEY `reviews_reviewrequest_c467b315` (`local_site_id`),
  CONSTRAINT `diffset_history_id_refs_id_c96b231a` FOREIGN KEY (`diffset_history_id`) REFERENCES `diffviewer_diffsethistory` (`id`),
  CONSTRAINT `local_site_id_refs_id_7b3d9679` FOREIGN KEY (`local_site_id`) REFERENCES `site_localsite` (`id`),
  CONSTRAINT `repository_id_refs_id_8da4cd22` FOREIGN KEY (`repository_id`) REFERENCES `scmtools_repository` (`id`),
  CONSTRAINT `submitter_id_refs_id_eba22ad0` FOREIGN KEY (`submitter_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews_reviewrequest`
--

LOCK TABLES `reviews_reviewrequest` WRITE;
/*!40000 ALTER TABLE `reviews_reviewrequest` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviews_reviewrequest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews_reviewrequest_changedescs`
--

DROP TABLE IF EXISTS `reviews_reviewrequest_changedescs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews_reviewrequest_changedescs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reviewrequest_id` int(11) NOT NULL,
  `changedescription_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `reviewrequest_id` (`reviewrequest_id`,`changedescription_id`),
  KEY `reviews_reviewrequest_changedescs_feaccf73` (`reviewrequest_id`),
  KEY `reviews_reviewrequest_changedescs_22b87d1a` (`changedescription_id`),
  CONSTRAINT `changedescription_id_refs_id_6aac7b13` FOREIGN KEY (`changedescription_id`) REFERENCES `changedescs_changedescription` (`id`),
  CONSTRAINT `reviewrequest_id_refs_id_e3f9a257` FOREIGN KEY (`reviewrequest_id`) REFERENCES `reviews_reviewrequest` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews_reviewrequest_changedescs`
--

LOCK TABLES `reviews_reviewrequest_changedescs` WRITE;
/*!40000 ALTER TABLE `reviews_reviewrequest_changedescs` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviews_reviewrequest_changedescs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews_reviewrequest_depends_on`
--

DROP TABLE IF EXISTS `reviews_reviewrequest_depends_on`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews_reviewrequest_depends_on` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_reviewrequest_id` int(11) NOT NULL,
  `to_reviewrequest_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `from_reviewrequest_id` (`from_reviewrequest_id`,`to_reviewrequest_id`),
  KEY `reviews_reviewrequest_depends_on_a7ff7fb6` (`from_reviewrequest_id`),
  KEY `reviews_reviewrequest_depends_on_04eb98af` (`to_reviewrequest_id`),
  CONSTRAINT `from_reviewrequest_id_refs_id_623cfa96` FOREIGN KEY (`from_reviewrequest_id`) REFERENCES `reviews_reviewrequest` (`id`),
  CONSTRAINT `to_reviewrequest_id_refs_id_623cfa96` FOREIGN KEY (`to_reviewrequest_id`) REFERENCES `reviews_reviewrequest` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews_reviewrequest_depends_on`
--

LOCK TABLES `reviews_reviewrequest_depends_on` WRITE;
/*!40000 ALTER TABLE `reviews_reviewrequest_depends_on` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviews_reviewrequest_depends_on` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews_reviewrequest_file_attachment_histories`
--

DROP TABLE IF EXISTS `reviews_reviewrequest_file_attachment_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews_reviewrequest_file_attachment_histories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reviewrequest_id` int(11) NOT NULL,
  `fileattachmenthistory_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `reviewrequest_id` (`reviewrequest_id`,`fileattachmenthistory_id`),
  KEY `reviews_reviewrequest_file_attachment_histories_feaccf73` (`reviewrequest_id`),
  KEY `reviews_reviewrequest_file_attachment_histories_e6c6e43b` (`fileattachmenthistory_id`),
  CONSTRAINT `fileattachmenthistory_id_refs_id_ff1b4604` FOREIGN KEY (`fileattachmenthistory_id`) REFERENCES `attachments_fileattachmenthistory` (`id`),
  CONSTRAINT `reviewrequest_id_refs_id_fe050f91` FOREIGN KEY (`reviewrequest_id`) REFERENCES `reviews_reviewrequest` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews_reviewrequest_file_attachment_histories`
--

LOCK TABLES `reviews_reviewrequest_file_attachment_histories` WRITE;
/*!40000 ALTER TABLE `reviews_reviewrequest_file_attachment_histories` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviews_reviewrequest_file_attachment_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews_reviewrequest_file_attachments`
--

DROP TABLE IF EXISTS `reviews_reviewrequest_file_attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews_reviewrequest_file_attachments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reviewrequest_id` int(11) NOT NULL,
  `fileattachment_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `reviewrequest_id` (`reviewrequest_id`,`fileattachment_id`),
  KEY `reviews_reviewrequest_file_attachments_feaccf73` (`reviewrequest_id`),
  KEY `reviews_reviewrequest_file_attachments_3d148c8d` (`fileattachment_id`),
  CONSTRAINT `fileattachment_id_refs_id_f1d94ed7` FOREIGN KEY (`fileattachment_id`) REFERENCES `attachments_fileattachment` (`id`),
  CONSTRAINT `reviewrequest_id_refs_id_4d6f12c9` FOREIGN KEY (`reviewrequest_id`) REFERENCES `reviews_reviewrequest` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews_reviewrequest_file_attachments`
--

LOCK TABLES `reviews_reviewrequest_file_attachments` WRITE;
/*!40000 ALTER TABLE `reviews_reviewrequest_file_attachments` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviews_reviewrequest_file_attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews_reviewrequest_inactive_file_attachments`
--

DROP TABLE IF EXISTS `reviews_reviewrequest_inactive_file_attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews_reviewrequest_inactive_file_attachments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reviewrequest_id` int(11) NOT NULL,
  `fileattachment_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `reviewrequest_id` (`reviewrequest_id`,`fileattachment_id`),
  KEY `reviews_reviewrequest_inactive_file_attachments_feaccf73` (`reviewrequest_id`),
  KEY `reviews_reviewrequest_inactive_file_attachments_3d148c8d` (`fileattachment_id`),
  CONSTRAINT `fileattachment_id_refs_id_577d7f58` FOREIGN KEY (`fileattachment_id`) REFERENCES `attachments_fileattachment` (`id`),
  CONSTRAINT `reviewrequest_id_refs_id_eb423b91` FOREIGN KEY (`reviewrequest_id`) REFERENCES `reviews_reviewrequest` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews_reviewrequest_inactive_file_attachments`
--

LOCK TABLES `reviews_reviewrequest_inactive_file_attachments` WRITE;
/*!40000 ALTER TABLE `reviews_reviewrequest_inactive_file_attachments` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviews_reviewrequest_inactive_file_attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews_reviewrequest_inactive_screenshots`
--

DROP TABLE IF EXISTS `reviews_reviewrequest_inactive_screenshots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews_reviewrequest_inactive_screenshots` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reviewrequest_id` int(11) NOT NULL,
  `screenshot_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `reviewrequest_id` (`reviewrequest_id`,`screenshot_id`),
  KEY `reviews_reviewrequest_inactive_screenshots_feaccf73` (`reviewrequest_id`),
  KEY `reviews_reviewrequest_inactive_screenshots_962c25c0` (`screenshot_id`),
  CONSTRAINT `reviewrequest_id_refs_id_0ca731ad` FOREIGN KEY (`reviewrequest_id`) REFERENCES `reviews_reviewrequest` (`id`),
  CONSTRAINT `screenshot_id_refs_id_0055c983` FOREIGN KEY (`screenshot_id`) REFERENCES `reviews_screenshot` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews_reviewrequest_inactive_screenshots`
--

LOCK TABLES `reviews_reviewrequest_inactive_screenshots` WRITE;
/*!40000 ALTER TABLE `reviews_reviewrequest_inactive_screenshots` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviews_reviewrequest_inactive_screenshots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews_reviewrequest_screenshots`
--

DROP TABLE IF EXISTS `reviews_reviewrequest_screenshots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews_reviewrequest_screenshots` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reviewrequest_id` int(11) NOT NULL,
  `screenshot_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `reviewrequest_id` (`reviewrequest_id`,`screenshot_id`),
  KEY `reviews_reviewrequest_screenshots_feaccf73` (`reviewrequest_id`),
  KEY `reviews_reviewrequest_screenshots_962c25c0` (`screenshot_id`),
  CONSTRAINT `reviewrequest_id_refs_id_fcf38833` FOREIGN KEY (`reviewrequest_id`) REFERENCES `reviews_reviewrequest` (`id`),
  CONSTRAINT `screenshot_id_refs_id_7abd3d40` FOREIGN KEY (`screenshot_id`) REFERENCES `reviews_screenshot` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews_reviewrequest_screenshots`
--

LOCK TABLES `reviews_reviewrequest_screenshots` WRITE;
/*!40000 ALTER TABLE `reviews_reviewrequest_screenshots` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviews_reviewrequest_screenshots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews_reviewrequest_target_groups`
--

DROP TABLE IF EXISTS `reviews_reviewrequest_target_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews_reviewrequest_target_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reviewrequest_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `reviewrequest_id` (`reviewrequest_id`,`group_id`),
  KEY `reviews_reviewrequest_target_groups_feaccf73` (`reviewrequest_id`),
  KEY `reviews_reviewrequest_target_groups_5f412f9a` (`group_id`),
  CONSTRAINT `group_id_refs_id_106823c9` FOREIGN KEY (`group_id`) REFERENCES `reviews_group` (`id`),
  CONSTRAINT `reviewrequest_id_refs_id_215d2d18` FOREIGN KEY (`reviewrequest_id`) REFERENCES `reviews_reviewrequest` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews_reviewrequest_target_groups`
--

LOCK TABLES `reviews_reviewrequest_target_groups` WRITE;
/*!40000 ALTER TABLE `reviews_reviewrequest_target_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviews_reviewrequest_target_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews_reviewrequest_target_people`
--

DROP TABLE IF EXISTS `reviews_reviewrequest_target_people`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews_reviewrequest_target_people` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reviewrequest_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `reviewrequest_id` (`reviewrequest_id`,`user_id`),
  KEY `reviews_reviewrequest_target_people_feaccf73` (`reviewrequest_id`),
  KEY `reviews_reviewrequest_target_people_6340c63c` (`user_id`),
  CONSTRAINT `reviewrequest_id_refs_id_6baad397` FOREIGN KEY (`reviewrequest_id`) REFERENCES `reviews_reviewrequest` (`id`),
  CONSTRAINT `user_id_refs_id_e06ea598` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews_reviewrequest_target_people`
--

LOCK TABLES `reviews_reviewrequest_target_people` WRITE;
/*!40000 ALTER TABLE `reviews_reviewrequest_target_people` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviews_reviewrequest_target_people` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews_reviewrequestdraft`
--

DROP TABLE IF EXISTS `reviews_reviewrequestdraft`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews_reviewrequestdraft` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` longtext NOT NULL,
  `description_rich_text` tinyint(1) NOT NULL,
  `testing_done` longtext NOT NULL,
  `testing_done_rich_text` tinyint(1) NOT NULL,
  `bugs_closed` varchar(300) NOT NULL,
  `branch` varchar(300) NOT NULL,
  `commit_id` varchar(64) DEFAULT NULL,
  `extra_data` longtext,
  `rich_text` tinyint(1) NOT NULL,
  `summary` varchar(300) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `review_request_id` int(11) NOT NULL,
  `last_updated` datetime NOT NULL,
  `diffset_id` int(11) DEFAULT NULL,
  `changedesc_id` int(11) DEFAULT NULL,
  `screenshots_count` int(11) DEFAULT NULL,
  `inactive_screenshots_count` int(11) DEFAULT NULL,
  `file_attachments_count` int(11) DEFAULT NULL,
  `inactive_file_attachments_count` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `review_request_id` (`review_request_id`),
  KEY `reviews_reviewrequestdraft_e5ba0309` (`commit_id`),
  KEY `reviews_reviewrequestdraft_cb902d83` (`owner_id`),
  KEY `reviews_reviewrequestdraft_4657d859` (`diffset_id`),
  KEY `reviews_reviewrequestdraft_5409e477` (`changedesc_id`),
  CONSTRAINT `changedesc_id_refs_id_474c9a1b` FOREIGN KEY (`changedesc_id`) REFERENCES `changedescs_changedescription` (`id`),
  CONSTRAINT `diffset_id_refs_id_90d28cba` FOREIGN KEY (`diffset_id`) REFERENCES `diffviewer_diffset` (`id`),
  CONSTRAINT `owner_id_refs_id_9586bdd1` FOREIGN KEY (`owner_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `review_request_id_refs_id_1b41e63e` FOREIGN KEY (`review_request_id`) REFERENCES `reviews_reviewrequest` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews_reviewrequestdraft`
--

LOCK TABLES `reviews_reviewrequestdraft` WRITE;
/*!40000 ALTER TABLE `reviews_reviewrequestdraft` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviews_reviewrequestdraft` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews_reviewrequestdraft_depends_on`
--

DROP TABLE IF EXISTS `reviews_reviewrequestdraft_depends_on`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews_reviewrequestdraft_depends_on` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reviewrequestdraft_id` int(11) NOT NULL,
  `reviewrequest_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `reviewrequestdraft_id` (`reviewrequestdraft_id`,`reviewrequest_id`),
  KEY `reviews_reviewrequestdraft_depends_on_12716454` (`reviewrequestdraft_id`),
  KEY `reviews_reviewrequestdraft_depends_on_feaccf73` (`reviewrequest_id`),
  CONSTRAINT `reviewrequest_id_refs_id_5a1afe0a` FOREIGN KEY (`reviewrequest_id`) REFERENCES `reviews_reviewrequest` (`id`),
  CONSTRAINT `reviewrequestdraft_id_refs_id_c4b4d8e7` FOREIGN KEY (`reviewrequestdraft_id`) REFERENCES `reviews_reviewrequestdraft` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews_reviewrequestdraft_depends_on`
--

LOCK TABLES `reviews_reviewrequestdraft_depends_on` WRITE;
/*!40000 ALTER TABLE `reviews_reviewrequestdraft_depends_on` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviews_reviewrequestdraft_depends_on` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews_reviewrequestdraft_file_attachments`
--

DROP TABLE IF EXISTS `reviews_reviewrequestdraft_file_attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews_reviewrequestdraft_file_attachments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reviewrequestdraft_id` int(11) NOT NULL,
  `fileattachment_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `reviewrequestdraft_id` (`reviewrequestdraft_id`,`fileattachment_id`),
  KEY `reviews_reviewrequestdraft_file_attachments_12716454` (`reviewrequestdraft_id`),
  KEY `reviews_reviewrequestdraft_file_attachments_3d148c8d` (`fileattachment_id`),
  CONSTRAINT `fileattachment_id_refs_id_2465ba7e` FOREIGN KEY (`fileattachment_id`) REFERENCES `attachments_fileattachment` (`id`),
  CONSTRAINT `reviewrequestdraft_id_refs_id_1aecf183` FOREIGN KEY (`reviewrequestdraft_id`) REFERENCES `reviews_reviewrequestdraft` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews_reviewrequestdraft_file_attachments`
--

LOCK TABLES `reviews_reviewrequestdraft_file_attachments` WRITE;
/*!40000 ALTER TABLE `reviews_reviewrequestdraft_file_attachments` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviews_reviewrequestdraft_file_attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews_reviewrequestdraft_inactive_file_attachments`
--

DROP TABLE IF EXISTS `reviews_reviewrequestdraft_inactive_file_attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews_reviewrequestdraft_inactive_file_attachments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reviewrequestdraft_id` int(11) NOT NULL,
  `fileattachment_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `reviewrequestdraft_id` (`reviewrequestdraft_id`,`fileattachment_id`),
  KEY `reviews_reviewrequestdraft_inactive_file_attachments_12716454` (`reviewrequestdraft_id`),
  KEY `reviews_reviewrequestdraft_inactive_file_attachments_3d148c8d` (`fileattachment_id`),
  CONSTRAINT `fileattachment_id_refs_id_d14aea36` FOREIGN KEY (`fileattachment_id`) REFERENCES `attachments_fileattachment` (`id`),
  CONSTRAINT `reviewrequestdraft_id_refs_id_7022aa5d` FOREIGN KEY (`reviewrequestdraft_id`) REFERENCES `reviews_reviewrequestdraft` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews_reviewrequestdraft_inactive_file_attachments`
--

LOCK TABLES `reviews_reviewrequestdraft_inactive_file_attachments` WRITE;
/*!40000 ALTER TABLE `reviews_reviewrequestdraft_inactive_file_attachments` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviews_reviewrequestdraft_inactive_file_attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews_reviewrequestdraft_inactive_screenshots`
--

DROP TABLE IF EXISTS `reviews_reviewrequestdraft_inactive_screenshots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews_reviewrequestdraft_inactive_screenshots` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reviewrequestdraft_id` int(11) NOT NULL,
  `screenshot_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `reviewrequestdraft_id` (`reviewrequestdraft_id`,`screenshot_id`),
  KEY `reviews_reviewrequestdraft_inactive_screenshots_12716454` (`reviewrequestdraft_id`),
  KEY `reviews_reviewrequestdraft_inactive_screenshots_962c25c0` (`screenshot_id`),
  CONSTRAINT `reviewrequestdraft_id_refs_id_f691e10f` FOREIGN KEY (`reviewrequestdraft_id`) REFERENCES `reviews_reviewrequestdraft` (`id`),
  CONSTRAINT `screenshot_id_refs_id_1e6b5da9` FOREIGN KEY (`screenshot_id`) REFERENCES `reviews_screenshot` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews_reviewrequestdraft_inactive_screenshots`
--

LOCK TABLES `reviews_reviewrequestdraft_inactive_screenshots` WRITE;
/*!40000 ALTER TABLE `reviews_reviewrequestdraft_inactive_screenshots` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviews_reviewrequestdraft_inactive_screenshots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews_reviewrequestdraft_screenshots`
--

DROP TABLE IF EXISTS `reviews_reviewrequestdraft_screenshots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews_reviewrequestdraft_screenshots` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reviewrequestdraft_id` int(11) NOT NULL,
  `screenshot_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `reviewrequestdraft_id` (`reviewrequestdraft_id`,`screenshot_id`),
  KEY `reviews_reviewrequestdraft_screenshots_12716454` (`reviewrequestdraft_id`),
  KEY `reviews_reviewrequestdraft_screenshots_962c25c0` (`screenshot_id`),
  CONSTRAINT `reviewrequestdraft_id_refs_id_a853fbb0` FOREIGN KEY (`reviewrequestdraft_id`) REFERENCES `reviews_reviewrequestdraft` (`id`),
  CONSTRAINT `screenshot_id_refs_id_6d72715e` FOREIGN KEY (`screenshot_id`) REFERENCES `reviews_screenshot` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews_reviewrequestdraft_screenshots`
--

LOCK TABLES `reviews_reviewrequestdraft_screenshots` WRITE;
/*!40000 ALTER TABLE `reviews_reviewrequestdraft_screenshots` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviews_reviewrequestdraft_screenshots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews_reviewrequestdraft_target_groups`
--

DROP TABLE IF EXISTS `reviews_reviewrequestdraft_target_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews_reviewrequestdraft_target_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reviewrequestdraft_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `reviewrequestdraft_id` (`reviewrequestdraft_id`,`group_id`),
  KEY `reviews_reviewrequestdraft_target_groups_12716454` (`reviewrequestdraft_id`),
  KEY `reviews_reviewrequestdraft_target_groups_5f412f9a` (`group_id`),
  CONSTRAINT `group_id_refs_id_5771f86c` FOREIGN KEY (`group_id`) REFERENCES `reviews_group` (`id`),
  CONSTRAINT `reviewrequestdraft_id_refs_id_80e2fba0` FOREIGN KEY (`reviewrequestdraft_id`) REFERENCES `reviews_reviewrequestdraft` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews_reviewrequestdraft_target_groups`
--

LOCK TABLES `reviews_reviewrequestdraft_target_groups` WRITE;
/*!40000 ALTER TABLE `reviews_reviewrequestdraft_target_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviews_reviewrequestdraft_target_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews_reviewrequestdraft_target_people`
--

DROP TABLE IF EXISTS `reviews_reviewrequestdraft_target_people`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews_reviewrequestdraft_target_people` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reviewrequestdraft_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `reviewrequestdraft_id` (`reviewrequestdraft_id`,`user_id`),
  KEY `reviews_reviewrequestdraft_target_people_12716454` (`reviewrequestdraft_id`),
  KEY `reviews_reviewrequestdraft_target_people_6340c63c` (`user_id`),
  CONSTRAINT `reviewrequestdraft_id_refs_id_69da0005` FOREIGN KEY (`reviewrequestdraft_id`) REFERENCES `reviews_reviewrequestdraft` (`id`),
  CONSTRAINT `user_id_refs_id_f1a682c0` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews_reviewrequestdraft_target_people`
--

LOCK TABLES `reviews_reviewrequestdraft_target_people` WRITE;
/*!40000 ALTER TABLE `reviews_reviewrequestdraft_target_people` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviews_reviewrequestdraft_target_people` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews_screenshot`
--

DROP TABLE IF EXISTS `reviews_screenshot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews_screenshot` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `caption` varchar(256) NOT NULL,
  `draft_caption` varchar(256) NOT NULL,
  `image` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews_screenshot`
--

LOCK TABLES `reviews_screenshot` WRITE;
/*!40000 ALTER TABLE `reviews_screenshot` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviews_screenshot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews_screenshotcomment`
--

DROP TABLE IF EXISTS `reviews_screenshotcomment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews_screenshotcomment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `issue_opened` tinyint(1) NOT NULL,
  `issue_status` varchar(1) DEFAULT NULL,
  `reply_to_id` int(11) DEFAULT NULL,
  `timestamp` datetime NOT NULL,
  `text` longtext NOT NULL,
  `rich_text` tinyint(1) NOT NULL,
  `extra_data` longtext,
  `screenshot_id` int(11) NOT NULL,
  `x` smallint(5) unsigned DEFAULT NULL,
  `y` smallint(5) unsigned NOT NULL,
  `w` smallint(5) unsigned NOT NULL,
  `h` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `reviews_screenshotcomment_3b281963` (`issue_status`),
  KEY `reviews_screenshotcomment_3fde75e6` (`reply_to_id`),
  KEY `reviews_screenshotcomment_962c25c0` (`screenshot_id`),
  CONSTRAINT `reply_to_id_refs_id_20919a6d` FOREIGN KEY (`reply_to_id`) REFERENCES `reviews_screenshotcomment` (`id`),
  CONSTRAINT `screenshot_id_refs_id_6e0021d3` FOREIGN KEY (`screenshot_id`) REFERENCES `reviews_screenshot` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews_screenshotcomment`
--

LOCK TABLES `reviews_screenshotcomment` WRITE;
/*!40000 ALTER TABLE `reviews_screenshotcomment` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviews_screenshotcomment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews_statusupdate`
--

DROP TABLE IF EXISTS `reviews_statusupdate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews_statusupdate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_id` varchar(255) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `timestamp` datetime NOT NULL,
  `summary` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `url_text` varchar(64) NOT NULL,
  `state` varchar(1) NOT NULL,
  `review_request_id` int(11) NOT NULL,
  `change_description_id` int(11) DEFAULT NULL,
  `review_id` int(11) DEFAULT NULL,
  `extra_data` longtext,
  `timeout` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `review_id` (`review_id`),
  KEY `reviews_statusupdate_6340c63c` (`user_id`),
  KEY `reviews_statusupdate_17900555` (`review_request_id`),
  KEY `reviews_statusupdate_66d6b108` (`change_description_id`),
  CONSTRAINT `change_description_id_refs_id_a42273a6` FOREIGN KEY (`change_description_id`) REFERENCES `changedescs_changedescription` (`id`),
  CONSTRAINT `review_id_refs_id_98e206f9` FOREIGN KEY (`review_id`) REFERENCES `reviews_review` (`id`),
  CONSTRAINT `review_request_id_refs_id_86bd27b7` FOREIGN KEY (`review_request_id`) REFERENCES `reviews_reviewrequest` (`id`),
  CONSTRAINT `user_id_refs_id_075d82a8` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews_statusupdate`
--

LOCK TABLES `reviews_statusupdate` WRITE;
/*!40000 ALTER TABLE `reviews_statusupdate` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviews_statusupdate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scmtools_repository`
--

DROP TABLE IF EXISTS `scmtools_repository`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `scmtools_repository` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  `mirror_path` varchar(255) NOT NULL,
  `raw_file_url` varchar(255) NOT NULL,
  `username` varchar(32) NOT NULL,
  `password` varchar(128) NOT NULL,
  `extra_data` longtext,
  `tool_id` int(11) NOT NULL,
  `hosting_account_id` int(11) DEFAULT NULL,
  `bug_tracker` varchar(256) NOT NULL,
  `encoding` varchar(32) NOT NULL,
  `visible` tinyint(1) NOT NULL,
  `archived` tinyint(1) NOT NULL,
  `archived_timestamp` datetime DEFAULT NULL,
  `local_site_id` int(11) DEFAULT NULL,
  `public` tinyint(1) NOT NULL,
  `hooks_uuid` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`,`local_site_id`),
  UNIQUE KEY `archived_timestamp` (`archived_timestamp`,`path`,`local_site_id`),
  UNIQUE KEY `hooks_uuid` (`hooks_uuid`,`local_site_id`),
  KEY `scmtools_repository_4262c4f4` (`tool_id`),
  KEY `scmtools_repository_0cb43fa7` (`hosting_account_id`),
  KEY `scmtools_repository_c467b315` (`local_site_id`),
  CONSTRAINT `hosting_account_id_refs_id_81a725ca` FOREIGN KEY (`hosting_account_id`) REFERENCES `hostingsvcs_hostingserviceaccount` (`id`),
  CONSTRAINT `local_site_id_refs_id_a0854215` FOREIGN KEY (`local_site_id`) REFERENCES `site_localsite` (`id`),
  CONSTRAINT `tool_id_refs_id_f847d4a5` FOREIGN KEY (`tool_id`) REFERENCES `scmtools_tool` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scmtools_repository`
--

LOCK TABLES `scmtools_repository` WRITE;
/*!40000 ALTER TABLE `scmtools_repository` DISABLE KEYS */;
/*!40000 ALTER TABLE `scmtools_repository` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scmtools_repository_review_groups`
--

DROP TABLE IF EXISTS `scmtools_repository_review_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `scmtools_repository_review_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `repository_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `repository_id` (`repository_id`,`group_id`),
  KEY `scmtools_repository_review_groups_a322ed1e` (`repository_id`),
  KEY `scmtools_repository_review_groups_5f412f9a` (`group_id`),
  CONSTRAINT `group_id_refs_id_b6406c8f` FOREIGN KEY (`group_id`) REFERENCES `reviews_group` (`id`),
  CONSTRAINT `repository_id_refs_id_9eb734d7` FOREIGN KEY (`repository_id`) REFERENCES `scmtools_repository` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scmtools_repository_review_groups`
--

LOCK TABLES `scmtools_repository_review_groups` WRITE;
/*!40000 ALTER TABLE `scmtools_repository_review_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `scmtools_repository_review_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scmtools_repository_users`
--

DROP TABLE IF EXISTS `scmtools_repository_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `scmtools_repository_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `repository_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `repository_id` (`repository_id`,`user_id`),
  KEY `scmtools_repository_users_a322ed1e` (`repository_id`),
  KEY `scmtools_repository_users_6340c63c` (`user_id`),
  CONSTRAINT `repository_id_refs_id_1e758eaa` FOREIGN KEY (`repository_id`) REFERENCES `scmtools_repository` (`id`),
  CONSTRAINT `user_id_refs_id_0d10a9f6` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scmtools_repository_users`
--

LOCK TABLES `scmtools_repository_users` WRITE;
/*!40000 ALTER TABLE `scmtools_repository_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `scmtools_repository_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scmtools_tool`
--

DROP TABLE IF EXISTS `scmtools_tool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `scmtools_tool` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `class_name` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `class_name` (`class_name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scmtools_tool`
--

LOCK TABLES `scmtools_tool` WRITE;
/*!40000 ALTER TABLE `scmtools_tool` DISABLE KEYS */;
INSERT INTO `scmtools_tool` VALUES (1,'Subversion','reviewboard.scmtools.svn.SVNTool'),(2,'Git','reviewboard.scmtools.git.GitTool'),(3,'Bazaar','reviewboard.scmtools.bzr.BZRTool'),(4,'CVS','reviewboard.scmtools.cvs.CVSTool'),(5,'Perforce','reviewboard.scmtools.perforce.PerforceTool'),(6,'Plastic SCM','reviewboard.scmtools.plastic.PlasticTool'),(7,'ClearCase','reviewboard.scmtools.clearcase.ClearCaseTool'),(8,'Mercurial','reviewboard.scmtools.hg.HgTool'),(9,'Team Foundation Server','rbpowerpack.scmtools.tfs.TFSTool'),(10,'Team Foundation Server (git)','rbpowerpack.scmtools.tfs_git.TFSGitTool');
/*!40000 ALTER TABLE `scmtools_tool` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site_localsite`
--

DROP TABLE IF EXISTS `site_localsite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `site_localsite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `public` tinyint(1) NOT NULL,
  `extra_data` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site_localsite`
--

LOCK TABLES `site_localsite` WRITE;
/*!40000 ALTER TABLE `site_localsite` DISABLE KEYS */;
/*!40000 ALTER TABLE `site_localsite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site_localsite_admins`
--

DROP TABLE IF EXISTS `site_localsite_admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `site_localsite_admins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `localsite_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `localsite_id` (`localsite_id`,`user_id`),
  KEY `site_localsite_admins_9fda9bcd` (`localsite_id`),
  KEY `site_localsite_admins_6340c63c` (`user_id`),
  CONSTRAINT `localsite_id_refs_id_0317c9fa` FOREIGN KEY (`localsite_id`) REFERENCES `site_localsite` (`id`),
  CONSTRAINT `user_id_refs_id_378c8eaa` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site_localsite_admins`
--

LOCK TABLES `site_localsite_admins` WRITE;
/*!40000 ALTER TABLE `site_localsite_admins` DISABLE KEYS */;
/*!40000 ALTER TABLE `site_localsite_admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site_localsite_users`
--

DROP TABLE IF EXISTS `site_localsite_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `site_localsite_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `localsite_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `localsite_id` (`localsite_id`,`user_id`),
  KEY `site_localsite_users_9fda9bcd` (`localsite_id`),
  KEY `site_localsite_users_6340c63c` (`user_id`),
  CONSTRAINT `localsite_id_refs_id_d327526e` FOREIGN KEY (`localsite_id`) REFERENCES `site_localsite` (`id`),
  CONSTRAINT `user_id_refs_id_0396f0bc` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site_localsite_users`
--

LOCK TABLES `site_localsite_users` WRITE;
/*!40000 ALTER TABLE `site_localsite_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `site_localsite_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `siteconfig_siteconfiguration`
--

DROP TABLE IF EXISTS `siteconfig_siteconfiguration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `siteconfig_siteconfiguration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL,
  `version` varchar(20) NOT NULL,
  `settings` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `siteconfig_siteconfiguration_99732b5c` (`site_id`),
  CONSTRAINT `site_id_refs_id_f9dfb3db` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `siteconfig_siteconfiguration`
--

LOCK TABLES `siteconfig_siteconfiguration` WRITE;
/*!40000 ALTER TABLE `siteconfig_siteconfiguration` DISABLE KEYS */;
INSERT INTO `siteconfig_siteconfiguration` VALUES (1,1,'3.0.25 alpha 0 (dev)','{\"auth_ad_domain_controller\": null, \"auth_ad_domain_name\": null, \"auth_ad_find_dc_from_dns\": null, \"auth_ad_group_name\": null, \"auth_ad_ou_name\": null, \"auth_ad_recursion_depth\": null, \"auth_ad_search_root\": null, \"auth_ad_use_tls\": null, \"auth_backend\": \"builtin\", \"auth_digest_file_location\": null, \"auth_digest_realm\": null, \"auth_ldap_anon_bind_passwd\": \"\", \"auth_ldap_anon_bind_uid\": \"\", \"auth_ldap_base_dn\": null, \"auth_ldap_email_attribute\": null, \"auth_ldap_email_domain\": \"\", \"auth_ldap_full_name_attribute\": null, \"auth_ldap_given_name_attribute\": null, \"auth_ldap_surname_attribute\": null, \"auth_ldap_tls\": false, \"auth_ldap_uid\": \"uid\", \"auth_ldap_uid_mask\": \"\", \"auth_ldap_uri\": \"\", \"auth_nis_email_domain\": \"\", \"auth_require_sitewide_login\": false, \"auth_x509_autocreate_users\": false, \"auth_x509_custom_username_field\": null, \"auth_x509_username_field\": \"SSL_CLIENT_S_DN_CN\", \"auth_x509_username_regex\": \"\", \"aws_access_key_id\": \"\", \"aws_calling_format\": 2, \"aws_default_acl\": \"public-read\", \"aws_headers\": {}, \"aws_querystring_active\": false, \"aws_querystring_auth\": false, \"aws_querystring_expire\": 60, \"aws_s3_bucket_name\": \"\", \"aws_s3_secure_urls\": false, \"aws_secret_access_key\": \"\", \"cache_backend\": {\"default\": {\"BACKEND\": \"djblets.cache.forwarding_backend.ForwardingCacheBackend\", \"LOCATION\": \"forwarded_backend\"}, \"forwarded_backend\": {\"BACKEND\": \"django.core.cache.backends.locmem.LocMemCache\", \"LOCATION\": \"reviewboard\"}, \"staticfiles\": {\"BACKEND\": \"django.core.cache.backends.locmem.LocMemCache\", \"LOCATION\": \"staticfiles-filehashes\"}}, \"cache_expiration_time\": 2592000, \"couchdb_default_server\": \"\", \"couchdb_storage_options\": {}, \"diffviewer_context_num_lines\": 5, \"diffviewer_include_space_patterns\": [], \"diffviewer_paginate_by\": 20, \"diffviewer_paginate_orphans\": 10, \"diffviewer_syntax_highlighting\": true, \"locale_date_format\": \"N j, Y\", \"locale_datetime_format\": \"N j, Y, P\", \"locale_default_charset\": \"utf-8\", \"locale_language_code\": \"en-us\", \"locale_month_day_format\": \"F j\", \"locale_time_format\": \"P\", \"locale_timezone\": \"UTC\", \"locale_year_month_format\": \"F Y\", \"logging_allow_profiling\": false, \"logging_directory\": null, \"logging_enabled\": true, \"logging_level\": \"DEBUG\", \"mail_default_from\": \"webmaster@localhost\", \"mail_host\": \"localhost\", \"mail_host_password\": \"\", \"mail_host_user\": \"\", \"mail_port\": 25, \"mail_send_review_mail\": false, \"mail_server_address\": \"root@localhost\", \"mail_use_tls\": false, \"recaptcha_private_key\": null, \"recaptcha_public_key\": null, \"search_enable\": false, \"search_index_file\": null, \"site_admin_email\": \"admin@example.com\", \"site_admin_name\": \"Example Admin\", \"site_domain_method\": \"http\", \"site_media_root\": \"/site/htdocs/media/\", \"site_media_url\": \"/media/\", \"site_prepend_www\": false, \"site_static_root\": \"/site/htdocs/static/\", \"site_static_url\": \"/static/\", \"site_upload_max_memory_size\": 2621440, \"site_upload_temp_dir\": null, \"swift_auth_url\": \"\", \"swift_auth_version\": \"1\", \"swift_container_name\": \"\", \"swift_key\": \"\", \"swift_username\": \"\"}');
/*!40000 ALTER TABLE `siteconfig_siteconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webapi_webapitoken`
--

DROP TABLE IF EXISTS `webapi_webapitoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `webapi_webapitoken` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `token` varchar(40) NOT NULL,
  `time_added` datetime NOT NULL,
  `last_updated` datetime NOT NULL,
  `note` longtext NOT NULL,
  `policy` longtext,
  `extra_data` longtext,
  `local_site_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token` (`token`),
  KEY `webapi_webapitoken_6340c63c` (`user_id`),
  KEY `webapi_webapitoken_c467b315` (`local_site_id`),
  CONSTRAINT `local_site_id_refs_id_38cf9f6f` FOREIGN KEY (`local_site_id`) REFERENCES `site_localsite` (`id`),
  CONSTRAINT `user_id_refs_id_ceac17a9` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webapi_webapitoken`
--

LOCK TABLES `webapi_webapitoken` WRITE;
/*!40000 ALTER TABLE `webapi_webapitoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `webapi_webapitoken` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-15 17:45:07
