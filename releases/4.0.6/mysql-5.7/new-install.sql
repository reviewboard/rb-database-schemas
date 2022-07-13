-- MySQL dump 10.13  Distrib 8.0.29, for macos12.2 (arm64)
--
-- Host: kuribo    Database: rb4
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
  UNIQUE KEY `accounts_localsiteprofile_user_id_local_site_id_c71acfac_uniq` (`user_id`,`local_site_id`),
  UNIQUE KEY `accounts_localsiteprofile_profile_id_local_site_id_c35a7283_uniq` (`profile_id`,`local_site_id`),
  KEY `accounts_localsitepr_local_site_id_e8e611d3_fk_site_loca` (`local_site_id`),
  CONSTRAINT `accounts_localsitepr_local_site_id_e8e611d3_fk_site_loca` FOREIGN KEY (`local_site_id`) REFERENCES `site_localsite` (`id`),
  CONSTRAINT `accounts_localsitepr_profile_id_6838b6f5_fk_accounts_` FOREIGN KEY (`profile_id`) REFERENCES `accounts_profile` (`id`),
  CONSTRAINT `accounts_localsiteprofile_user_id_4faa8400_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
  CONSTRAINT `accounts_profile_user_id_49a85d32_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
  UNIQUE KEY `accounts_profile_starred_profile_id_group_id_82d5c8c2_uniq` (`profile_id`,`group_id`),
  KEY `accounts_profile_sta_group_id_5cf2c564_fk_reviews_g` (`group_id`),
  CONSTRAINT `accounts_profile_sta_group_id_5cf2c564_fk_reviews_g` FOREIGN KEY (`group_id`) REFERENCES `reviews_group` (`id`),
  CONSTRAINT `accounts_profile_sta_profile_id_f62f8a74_fk_accounts_` FOREIGN KEY (`profile_id`) REFERENCES `accounts_profile` (`id`)
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
  UNIQUE KEY `accounts_profile_starred_profile_id_reviewrequest_9077f978_uniq` (`profile_id`,`reviewrequest_id`),
  KEY `accounts_profile_sta_reviewrequest_id_be0af917_fk_reviews_r` (`reviewrequest_id`),
  CONSTRAINT `accounts_profile_sta_profile_id_cf4bb46e_fk_accounts_` FOREIGN KEY (`profile_id`) REFERENCES `accounts_profile` (`id`),
  CONSTRAINT `accounts_profile_sta_reviewrequest_id_be0af917_fk_reviews_r` FOREIGN KEY (`reviewrequest_id`) REFERENCES `reviews_reviewrequest` (`id`)
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
  `timestamp` datetime(6) NOT NULL,
  `visibility` varchar(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `accounts_reviewrequestvi_user_id_review_request_i_5b8724f0_uniq` (`user_id`,`review_request_id`),
  KEY `accounts_reviewreque_review_request_id_3bd58111_fk_reviews_r` (`review_request_id`),
  KEY `accounts_reviewrequestvisit_user_id_visibility_e9e85630_idx` (`user_id`,`visibility`),
  CONSTRAINT `accounts_reviewreque_review_request_id_3bd58111_fk_reviews_r` FOREIGN KEY (`review_request_id`) REFERENCES `reviews_reviewrequest` (`id`),
  CONSTRAINT `accounts_reviewrequestvisit_user_id_8ed30d49_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
  `received_date` datetime(6) NOT NULL,
  `review_request_id` int(11) NOT NULL,
  `local_site_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `accounts_trophy_review_request_id_8d01e0f8_fk_reviews_r` (`review_request_id`),
  KEY `accounts_trophy_local_site_id_b29042f4_fk_site_localsite_id` (`local_site_id`),
  KEY `accounts_trophy_user_id_ef0f407a_fk_auth_user_id` (`user_id`),
  CONSTRAINT `accounts_trophy_local_site_id_b29042f4_fk_site_localsite_id` FOREIGN KEY (`local_site_id`) REFERENCES `site_localsite` (`id`),
  CONSTRAINT `accounts_trophy_review_request_id_8d01e0f8_fk_reviews_r` FOREIGN KEY (`review_request_id`) REFERENCES `reviews_reviewrequest` (`id`),
  CONSTRAINT `accounts_trophy_user_id_ef0f407a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
  KEY `attachments_fileattachment_user_id_dbe26565_fk_auth_user_id` (`user_id`),
  KEY `attachments_fileatta_local_site_id_be669fcf_fk_site_loca` (`local_site_id`),
  KEY `attachments_fileatta_repository_id_a23f76db_fk_scmtools_` (`repository_id`),
  KEY `attachments_fileatta_added_in_filediff_id_5bbf0a9b_fk_diffviewe` (`added_in_filediff_id`),
  KEY `attachments_fileatta_attachment_history_i_79d851af_fk_attachmen` (`attachment_history_id`),
  KEY `attachments_fileattachment_repo_revision_0b865a62` (`repo_revision`),
  CONSTRAINT `attachments_fileatta_added_in_filediff_id_5bbf0a9b_fk_diffviewe` FOREIGN KEY (`added_in_filediff_id`) REFERENCES `diffviewer_filediff` (`id`),
  CONSTRAINT `attachments_fileatta_attachment_history_i_79d851af_fk_attachmen` FOREIGN KEY (`attachment_history_id`) REFERENCES `attachments_fileattachmenthistory` (`id`),
  CONSTRAINT `attachments_fileatta_local_site_id_be669fcf_fk_site_loca` FOREIGN KEY (`local_site_id`) REFERENCES `site_localsite` (`id`),
  CONSTRAINT `attachments_fileatta_repository_id_a23f76db_fk_scmtools_` FOREIGN KEY (`repository_id`) REFERENCES `scmtools_repository` (`id`),
  CONSTRAINT `attachments_fileattachment_user_id_dbe26565_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
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
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add cors model',1,'add_corsmodel'),(2,'Can change cors model',1,'change_corsmodel'),(3,'Can delete cors model',1,'delete_corsmodel'),(4,'Can add log entry',2,'add_logentry'),(5,'Can change log entry',2,'change_logentry'),(6,'Can delete log entry',2,'delete_logentry'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add permission',4,'add_permission'),(11,'Can change permission',4,'change_permission'),(12,'Can delete permission',4,'delete_permission'),(13,'Can add user',5,'add_user'),(14,'Can change user',5,'change_user'),(15,'Can delete user',5,'delete_user'),(16,'Can add content type',6,'add_contenttype'),(17,'Can change content type',6,'change_contenttype'),(18,'Can delete content type',6,'delete_contenttype'),(19,'Can add site',7,'add_site'),(20,'Can change site',7,'change_site'),(21,'Can delete site',7,'delete_site'),(22,'Can add session',8,'add_session'),(23,'Can change session',8,'change_session'),(24,'Can delete session',8,'delete_session'),(25,'Can add registered extension',9,'add_registeredextension'),(26,'Can change registered extension',9,'change_registeredextension'),(27,'Can delete registered extension',9,'delete_registeredextension'),(28,'Can add Stored consent data',10,'add_storedconsentdata'),(29,'Can change Stored consent data',10,'change_storedconsentdata'),(30,'Can delete Stored consent data',10,'delete_storedconsentdata'),(31,'Can add site configuration',11,'add_siteconfiguration'),(32,'Can change site configuration',11,'change_siteconfiguration'),(33,'Can delete site configuration',11,'delete_siteconfiguration'),(34,'Can add grant',12,'add_grant'),(35,'Can change grant',12,'change_grant'),(36,'Can delete grant',12,'delete_grant'),(37,'Can add application',13,'add_application'),(38,'Can change application',13,'change_application'),(39,'Can delete application',13,'delete_application'),(40,'Can add access token',14,'add_accesstoken'),(41,'Can change access token',14,'change_accesstoken'),(42,'Can delete access token',14,'delete_accesstoken'),(43,'Can add refresh token',15,'add_refreshtoken'),(44,'Can change refresh token',15,'change_refreshtoken'),(45,'Can delete refresh token',15,'delete_refreshtoken'),(46,'Can add Review Request Visit',16,'add_reviewrequestvisit'),(47,'Can change Review Request Visit',16,'change_reviewrequestvisit'),(48,'Can delete Review Request Visit',16,'delete_reviewrequestvisit'),(49,'Can add Profile',17,'add_profile'),(50,'Can change Profile',17,'change_profile'),(51,'Can delete Profile',17,'delete_profile'),(52,'Can add Local Site Profile',18,'add_localsiteprofile'),(53,'Can change Local Site Profile',18,'change_localsiteprofile'),(54,'Can delete Local Site Profile',18,'delete_localsiteprofile'),(55,'Can add Trophy',19,'add_trophy'),(56,'Can change Trophy',19,'change_trophy'),(57,'Can delete Trophy',19,'delete_trophy'),(58,'Can add File Attachment History',20,'add_fileattachmenthistory'),(59,'Can change File Attachment History',20,'change_fileattachmenthistory'),(60,'Can delete File Attachment History',20,'delete_fileattachmenthistory'),(61,'Can add File Attachment',21,'add_fileattachment'),(62,'Can change File Attachment',21,'change_fileattachment'),(63,'Can delete File Attachment',21,'delete_fileattachment'),(64,'Can add Change Description',22,'add_changedescription'),(65,'Can change Change Description',22,'change_changedescription'),(66,'Can delete Change Description',22,'delete_changedescription'),(67,'Can add Diff Set',23,'add_diffset'),(68,'Can change Diff Set',23,'change_diffset'),(69,'Can delete Diff Set',23,'delete_diffset'),(70,'Can add Diff Commit',24,'add_diffcommit'),(71,'Can change Diff Commit',24,'change_diffcommit'),(72,'Can delete Diff Commit',24,'delete_diffcommit'),(73,'Can add Diff Set History',25,'add_diffsethistory'),(74,'Can change Diff Set History',25,'change_diffsethistory'),(75,'Can delete Diff Set History',25,'delete_diffsethistory'),(76,'Can add Legacy File Diff Data',26,'add_legacyfilediffdata'),(77,'Can change Legacy File Diff Data',26,'change_legacyfilediffdata'),(78,'Can delete Legacy File Diff Data',26,'delete_legacyfilediffdata'),(79,'Can add Raw File Diff Data',27,'add_rawfilediffdata'),(80,'Can change Raw File Diff Data',27,'change_rawfilediffdata'),(81,'Can delete Raw File Diff Data',27,'delete_rawfilediffdata'),(82,'Can add File Diff',28,'add_filediff'),(83,'Can change File Diff',28,'change_filediff'),(84,'Can delete File Diff',28,'delete_filediff'),(85,'Can add Hosting Service Account',29,'add_hostingserviceaccount'),(86,'Can change Hosting Service Account',29,'change_hostingserviceaccount'),(87,'Can delete Hosting Service Account',29,'delete_hostingserviceaccount'),(88,'Can add Integration Configuration',30,'add_integrationconfig'),(89,'Can change Integration Configuration',30,'change_integrationconfig'),(90,'Can delete Integration Configuration',30,'delete_integrationconfig'),(91,'Can add Webhook',31,'add_webhooktarget'),(92,'Can change Webhook',31,'change_webhooktarget'),(93,'Can delete Webhook',31,'delete_webhooktarget'),(94,'Can add OAuth Application',32,'add_application'),(95,'Can change OAuth Application',32,'change_application'),(96,'Can delete OAuth Application',32,'delete_application'),(97,'Can add Review Group',33,'add_group'),(98,'Can change Review Group',33,'change_group'),(99,'Can delete Review Group',33,'delete_group'),(100,'Can view invite-only Groups',33,'can_view_invite_only_groups'),(101,'Can add Default Reviewer',34,'add_defaultreviewer'),(102,'Can change Default Reviewer',34,'change_defaultreviewer'),(103,'Can delete Default Reviewer',34,'delete_defaultreviewer'),(104,'Can add Diff Comment',35,'add_comment'),(105,'Can change Diff Comment',35,'change_comment'),(106,'Can delete Diff Comment',35,'delete_comment'),(107,'Can add File Attachment Comment',36,'add_fileattachmentcomment'),(108,'Can change File Attachment Comment',36,'change_fileattachmentcomment'),(109,'Can delete File Attachment Comment',36,'delete_fileattachmentcomment'),(110,'Can add General Comment',37,'add_generalcomment'),(111,'Can change General Comment',37,'change_generalcomment'),(112,'Can delete General Comment',37,'delete_generalcomment'),(113,'Can add Screenshot',38,'add_screenshot'),(114,'Can change Screenshot',38,'change_screenshot'),(115,'Can delete Screenshot',38,'delete_screenshot'),(116,'Can add Review Request',39,'add_reviewrequest'),(117,'Can change Review Request',39,'change_reviewrequest'),(118,'Can delete Review Request',39,'delete_reviewrequest'),(119,'Can change status',39,'can_change_status'),(120,'Can submit as another user',39,'can_submit_as_another_user'),(121,'Can edit review request',39,'can_edit_reviewrequest'),(122,'Can add Screenshot Comment',40,'add_screenshotcomment'),(123,'Can change Screenshot Comment',40,'change_screenshotcomment'),(124,'Can delete Screenshot Comment',40,'delete_screenshotcomment'),(125,'Can add Review',41,'add_review'),(126,'Can change Review',41,'change_review'),(127,'Can delete Review',41,'delete_review'),(128,'Can add Review Request Draft',42,'add_reviewrequestdraft'),(129,'Can change Review Request Draft',42,'change_reviewrequestdraft'),(130,'Can delete Review Request Draft',42,'delete_reviewrequestdraft'),(131,'Can add Status Update',43,'add_statusupdate'),(132,'Can change Status Update',43,'change_statusupdate'),(133,'Can delete Status Update',43,'delete_statusupdate'),(134,'Can add Tool',44,'add_tool'),(135,'Can change Tool',44,'change_tool'),(136,'Can delete Tool',44,'delete_tool'),(137,'Can add Repository',45,'add_repository'),(138,'Can change Repository',45,'change_repository'),(139,'Can delete Repository',45,'delete_repository'),(140,'Can add Local Site',46,'add_localsite'),(141,'Can change Local Site',46,'change_localsite'),(142,'Can delete Local Site',46,'delete_localsite'),(143,'Can add Web API Token',47,'add_webapitoken'),(144,'Can change Web API Token',47,'change_webapitoken'),(145,'Can delete Web API Token',47,'delete_webapitoken'),(146,'Can add version',48,'add_version'),(147,'Can change version',48,'change_version'),(148,'Can delete version',48,'delete_version'),(149,'Can add evolution',49,'add_evolution'),(150,'Can change evolution',49,'change_evolution'),(151,'Can delete evolution',49,'delete_evolution');
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
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
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
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
  `timestamp` datetime(6) NOT NULL,
  `public` tinyint(1) NOT NULL,
  `text` longtext NOT NULL,
  `rich_text` tinyint(1) NOT NULL,
  `fields_changed` longtext,
  PRIMARY KEY (`id`),
  KEY `changedescs_changedescription_user_id_2341d9f9_fk_auth_user_id` (`user_id`),
  CONSTRAINT `changedescs_changedescription_user_id_2341d9f9_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
-- Table structure for table `diffviewer_diffcommit`
--

DROP TABLE IF EXISTS `diffviewer_diffcommit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diffviewer_diffcommit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `filename` varchar(256) NOT NULL,
  `diffset_id` int(11) NOT NULL,
  `author_name` varchar(256) NOT NULL,
  `author_email` varchar(256) NOT NULL,
  `author_date_utc` datetime(6) NOT NULL,
  `author_date_offset` int(11) NOT NULL,
  `committer_name` varchar(256) DEFAULT NULL,
  `committer_email` varchar(256) DEFAULT NULL,
  `committer_date_utc` datetime(6) DEFAULT NULL,
  `committer_date_offset` int(11) DEFAULT NULL,
  `commit_message` longtext NOT NULL,
  `commit_id` varchar(64) NOT NULL,
  `parent_id` varchar(64) NOT NULL,
  `last_modified` datetime(6) NOT NULL,
  `extra_data` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `diffviewer_diffcommit_diffset_id_commit_id_61b21cc8_uniq` (`diffset_id`,`commit_id`),
  CONSTRAINT `diffviewer_diffcommi_diffset_id_8c3c2dbb_fk_diffviewe` FOREIGN KEY (`diffset_id`) REFERENCES `diffviewer_diffset` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diffviewer_diffcommit`
--

LOCK TABLES `diffviewer_diffcommit` WRITE;
/*!40000 ALTER TABLE `diffviewer_diffcommit` DISABLE KEYS */;
/*!40000 ALTER TABLE `diffviewer_diffcommit` ENABLE KEYS */;
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
  `timestamp` datetime(6) NOT NULL,
  `basedir` varchar(256) NOT NULL,
  `history_id` int(11) DEFAULT NULL,
  `repository_id` int(11) NOT NULL,
  `diffcompat` int(11) NOT NULL,
  `base_commit_id` varchar(64) DEFAULT NULL,
  `commit_count` int(11) DEFAULT NULL,
  `extra_data` longtext,
  PRIMARY KEY (`id`),
  KEY `diffviewer_diffset_history_id_539bce58_fk_diffviewe` (`history_id`),
  KEY `diffviewer_diffset_repository_id_bdf3a395_fk_scmtools_` (`repository_id`),
  KEY `diffviewer_diffset_base_commit_id_037195a9` (`base_commit_id`),
  CONSTRAINT `diffviewer_diffset_history_id_539bce58_fk_diffviewe` FOREIGN KEY (`history_id`) REFERENCES `diffviewer_diffsethistory` (`id`),
  CONSTRAINT `diffviewer_diffset_repository_id_bdf3a395_fk_scmtools_` FOREIGN KEY (`repository_id`) REFERENCES `scmtools_repository` (`id`)
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
  `timestamp` datetime(6) NOT NULL,
  `last_diff_updated` datetime(6) DEFAULT NULL,
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
  `commit_id` int(11) DEFAULT NULL,
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
  KEY `diffviewer_filediff_diffset_id_f5b24a5d_fk_diffviewer_diffset_id` (`diffset_id`),
  KEY `diffviewer_filediff_commit_id_8ba58a4a_fk_diffviewe` (`commit_id`),
  KEY `diffviewer_filediff_diff_hash_id_d6cd0509_fk_diffviewe` (`diff_hash_id`),
  KEY `diffviewer_filediff_raw_diff_hash_id_ce904491_fk_diffviewe` (`raw_diff_hash_id`),
  KEY `diffviewer_filediff_parent_diff_hash_id_73defa3d_fk_diffviewe` (`parent_diff_hash_id`),
  KEY `diffviewer_filediff_raw_parent_diff_hash_8bead4b4_fk_diffviewe` (`raw_parent_diff_hash_id`),
  CONSTRAINT `diffviewer_filediff_commit_id_8ba58a4a_fk_diffviewe` FOREIGN KEY (`commit_id`) REFERENCES `diffviewer_diffcommit` (`id`),
  CONSTRAINT `diffviewer_filediff_diff_hash_id_d6cd0509_fk_diffviewe` FOREIGN KEY (`diff_hash_id`) REFERENCES `diffviewer_filediffdata` (`binary_hash`),
  CONSTRAINT `diffviewer_filediff_diffset_id_f5b24a5d_fk_diffviewer_diffset_id` FOREIGN KEY (`diffset_id`) REFERENCES `diffviewer_diffset` (`id`),
  CONSTRAINT `diffviewer_filediff_parent_diff_hash_id_73defa3d_fk_diffviewe` FOREIGN KEY (`parent_diff_hash_id`) REFERENCES `diffviewer_filediffdata` (`binary_hash`),
  CONSTRAINT `diffviewer_filediff_raw_diff_hash_id_ce904491_fk_diffviewe` FOREIGN KEY (`raw_diff_hash_id`) REFERENCES `diffviewer_rawfilediffdata` (`id`),
  CONSTRAINT `diffviewer_filediff_raw_parent_diff_hash_8bead4b4_fk_diffviewe` FOREIGN KEY (`raw_parent_diff_hash_id`) REFERENCES `diffviewer_rawfilediffdata` (`id`)
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
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (18,'accounts','localsiteprofile'),(17,'accounts','profile'),(16,'accounts','reviewrequestvisit'),(19,'accounts','trophy'),(2,'admin','logentry'),(21,'attachments','fileattachment'),(20,'attachments','fileattachmenthistory'),(3,'auth','group'),(4,'auth','permission'),(5,'auth','user'),(22,'changedescs','changedescription'),(6,'contenttypes','contenttype'),(1,'corsheaders','corsmodel'),(24,'diffviewer','diffcommit'),(23,'diffviewer','diffset'),(25,'diffviewer','diffsethistory'),(28,'diffviewer','filediff'),(26,'diffviewer','legacyfilediffdata'),(27,'diffviewer','rawfilediffdata'),(49,'django_evolution','evolution'),(48,'django_evolution','version'),(9,'djblets_extensions','registeredextension'),(10,'djblets_privacy','storedconsentdata'),(11,'djblets_siteconfig','siteconfiguration'),(29,'hostingsvcs','hostingserviceaccount'),(30,'integrations','integrationconfig'),(31,'notifications','webhooktarget'),(32,'oauth','application'),(14,'oauth2_provider','accesstoken'),(13,'oauth2_provider','application'),(12,'oauth2_provider','grant'),(15,'oauth2_provider','refreshtoken'),(35,'reviews','comment'),(34,'reviews','defaultreviewer'),(36,'reviews','fileattachmentcomment'),(37,'reviews','generalcomment'),(33,'reviews','group'),(41,'reviews','review'),(39,'reviews','reviewrequest'),(42,'reviews','reviewrequestdraft'),(38,'reviews','screenshot'),(40,'reviews','screenshotcomment'),(43,'reviews','statusupdate'),(45,'scmtools','repository'),(44,'scmtools','tool'),(8,'sessions','session'),(46,'site','localsite'),(7,'sites','site'),(47,'webapi','webapitoken');
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
  KEY `django_evolution_version_id_e55942c9_fk_django_pr` (`version_id`),
  CONSTRAINT `django_evolution_version_id_e55942c9_fk_django_pr` FOREIGN KEY (`version_id`) REFERENCES `django_project_version` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_evolution`
--

LOCK TABLES `django_evolution` WRITE;
/*!40000 ALTER TABLE `django_evolution` DISABLE KEYS */;
INSERT INTO `django_evolution` VALUES (1,1,'admin','admin_move_to_migrations'),(2,1,'auth','auth_delete_message'),(3,1,'auth','auth_unique_together_baseline'),(4,1,'auth','auth_move_to_migrations'),(5,1,'contenttypes','contenttypes_unique_together_baseline'),(6,1,'contenttypes','contenttypes_move_to_migrations'),(7,1,'sites','sites_move_to_migrations'),(8,1,'sessions','session_expire_date_db_index'),(9,1,'sessions','sessions_move_to_migrations'),(10,1,'djblets_extensions','update_app_label'),(11,1,'djblets_privacy','audit_indentifier'),(12,1,'djblets_privacy','update_app_label'),(13,1,'djblets_siteconfig','update_app_label'),(14,1,'oauth2_provider','move_to_migrations'),(15,1,'accounts','is_private'),(16,1,'accounts','timezone'),(17,1,'accounts','open_an_issue'),(18,1,'accounts','extra_data'),(19,1,'accounts','timezone_length_30'),(20,1,'accounts','localsiteprofile_permissions'),(21,1,'accounts','unique_together_baseline'),(22,1,'accounts','profile_show_closed'),(23,1,'accounts','profile_should_send_email'),(24,1,'accounts','profile_should_send_own_updates'),(25,1,'accounts','profile_default_use_rich_text'),(26,1,'accounts','reviewrequestvisit_visibility'),(27,1,'accounts','profile_settings'),(28,1,'attachments','file_attachment_orig_filename'),(29,1,'attachments','file_attachment_file_max_length_512'),(30,1,'attachments','file_attachment_repo_info'),(31,1,'attachments','file_attachment_repo_path_no_index'),(32,1,'attachments','file_attachment_repo_revision_max_length_64'),(33,1,'attachments','file_attachment_revision'),(34,1,'attachments','file_attachment_ownership'),(35,1,'attachments','file_attachment_uuid'),(36,1,'changedescs','fields_changed_longtext'),(37,1,'changedescs','rich_text'),(38,1,'changedescs','changedesc_user'),(39,1,'diffviewer','add_parent_diffs'),(40,1,'diffviewer','filediff_filenames_1024_chars'),(41,1,'diffviewer','diffset_basedir'),(42,1,'diffviewer','filediff_status'),(43,1,'diffviewer','add_diff_hash'),(44,1,'diffviewer','diffsethistory_diff_updated'),(45,1,'diffviewer','filediffdata_line_counts'),(46,1,'diffviewer','diffset_base_commit_id'),(47,1,'diffviewer','filediffdata_extra_data'),(48,1,'diffviewer','all_extra_data'),(49,1,'diffviewer','raw_diff_file_data'),(50,1,'diffviewer','diffcommit_relations'),(51,1,'diffviewer','delete_file_count_fields'),(52,1,'hostingsvcs','account_hosting_url'),(53,1,'hostingsvcs','account_hosting_url_max_length_255'),(54,1,'hostingsvcs','account_unique_together_baseline'),(55,1,'notifications','webhooktarget_extra_state'),(56,1,'notifications','webhooktarget_extra_data_null'),(57,1,'notifications','manytomanyfield_rm_null'),(58,1,'oauth','disabled_for_security'),(59,1,'reviews','change_descriptions'),(60,1,'reviews','last_review_timestamp'),(61,1,'reviews','shipit_count'),(62,1,'reviews','default_reviewer_repositories'),(63,1,'reviews','null_repository'),(64,1,'reviews','localsite'),(65,1,'reviews','group_incoming_request_count'),(66,1,'reviews','group_invite_only'),(67,1,'reviews','group_visible'),(68,1,'reviews','default_reviewer_local_site'),(69,1,'reviews','add_issues_to_comments'),(70,1,'reviews','file_attachments'),(71,1,'reviews','file_attachment_comment_extra_data'),(72,1,'reviews','review_request_last_review_activity_timestamp'),(73,1,'reviews','review_request_depends_on'),(74,1,'reviews','commit_id'),(75,1,'reviews','file_attachment_comment_diff_id'),(76,1,'reviews','rich_text'),(77,1,'reviews','base_comment_extra_data'),(78,1,'reviews','unique_together_baseline'),(79,1,'reviews','extra_data'),(80,1,'reviews','review_request_issue_counts'),(81,1,'reviews','group_mailing_list_charfield'),(82,1,'reviews','review_request_draft_commit_id'),(83,1,'reviews','group_email_list_only'),(84,1,'reviews','review_request_file_attachment_histories'),(85,1,'reviews','review_request_summary_index'),(86,1,'reviews','review_request_summary_index_manual'),(87,1,'reviews','split_rich_text'),(88,1,'reviews','is_default_group'),(89,1,'reviews','general_comments'),(90,1,'reviews','add_owner_to_draft'),(91,1,'reviews','status_update_timeout'),(92,1,'reviews','comment_issue_verification'),(93,1,'reviews','review_request_screenshot_attachment_counters'),(94,1,'reviews','manytomanyfield_rm_null'),(95,1,'scmtools','bugzilla_url_charfield'),(96,1,'scmtools','repository_raw_file_url'),(97,1,'scmtools','repository_visible'),(98,1,'scmtools','repository_path_length_255'),(99,1,'scmtools','localsite'),(100,1,'scmtools','repository_access_control'),(101,1,'scmtools','group_site'),(102,1,'scmtools','repository_hosting_accounts'),(103,1,'scmtools','repository_extra_data_null'),(104,1,'scmtools','unique_together_baseline'),(105,1,'scmtools','repository_archive'),(106,1,'scmtools','repository_hooks_uuid'),(107,1,'scmtools','repository_raw_password'),(108,1,'scmtools','repository_name_length_255'),(109,1,'site','localsite_public'),(110,1,'site','localsite_extra_data'),(111,1,'webapi','webapitoken_jsonfield_null');
/*!40000 ALTER TABLE `django_evolution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'admin','0001_initial','2022-05-16 00:32:21.471893'),(2,'auth','0001_initial','2022-05-16 00:32:21.471927'),(3,'contenttypes','0001_initial','2022-05-16 00:32:21.471933'),(4,'oauth2_provider','0001_initial','2022-05-16 00:32:21.471938'),(5,'sessions','0001_initial','2022-05-16 00:32:21.471943'),(6,'sites','0001_initial','2022-05-16 00:32:21.471948'),(7,'contenttypes','0001_initial','2022-05-16 00:32:21.953435'),(8,'auth','0001_initial','2022-05-16 00:32:23.638488'),(9,'admin','0001_initial','2022-05-16 00:32:24.048464'),(10,'sites','0001_initial','2022-05-16 00:32:24.107242'),(11,'sessions','0001_initial','2022-05-16 00:32:24.349925'),(12,'oauth2_provider','0001_initial','2022-05-16 00:32:27.485030'),(13,'oauth2_provider','0002_08_updates','2022-05-16 00:32:28.129554'),(14,'admin','0002_logentry_remove_auto_add','2022-05-16 00:32:44.621307'),(15,'contenttypes','0002_remove_content_type_name','2022-05-16 00:32:44.869199'),(16,'auth','0002_alter_permission_name_max_length','2022-05-16 00:32:44.893726'),(17,'auth','0003_alter_user_email_max_length','2022-05-16 00:32:44.927566'),(18,'auth','0004_alter_user_username_opts','2022-05-16 00:32:44.957064'),(19,'auth','0005_alter_user_last_login_null','2022-05-16 00:32:45.107200'),(20,'auth','0006_require_contenttypes_0002','2022-05-16 00:32:45.118268'),(21,'auth','0007_alter_validators_add_error_messages','2022-05-16 00:32:45.140929'),(22,'auth','0008_alter_user_username_max_length','2022-05-16 00:32:45.168221'),(23,'sites','0002_alter_domain_unique','2022-05-16 00:32:45.211748');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
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
  `when` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_project_version`
--

LOCK TABLES `django_project_version` WRITE;
/*!40000 ALTER TABLE `django_project_version` DISABLE KEYS */;
INSERT INTO `django_project_version` VALUES (1,'json!{\"__version__\": 2, \"apps\": {\"django_evolution\": {\"legacy_app_label\": \"django_evolution\", \"upgrade_method\": \"evolutions\", \"models\": {\"Version\": {\"fields\": {\"id\": {\"type\": \"django.db.models.AutoField\", \"attrs\": {\"primary_key\": true}}, \"signature\": {\"type\": \"django_evolution.models.SignatureField\"}, \"when\": {\"type\": \"django.db.models.DateTimeField\"}}, \"meta\": {\"pk_column\": \"id\", \"db_table\": \"django_project_version\", \"indexes\": [], \"db_tablespace\": \"\", \"unique_together\": [], \"__unique_together_applied\": true, \"index_together\": [], \"constraints\": []}}, \"Evolution\": {\"fields\": {\"id\": {\"type\": \"django.db.models.AutoField\", \"attrs\": {\"primary_key\": true}}, \"version\": {\"type\": \"django.db.models.ForeignKey\", \"related_model\": \"django_evolution.Version\"}, \"app_label\": {\"type\": \"django.db.models.CharField\", \"attrs\": {\"max_length\": 200}}, \"label\": {\"type\": \"django.db.models.CharField\", \"attrs\": {\"max_length\": 100}}}, \"meta\": {\"pk_column\": \"id\", \"db_table\": \"django_evolution\", \"indexes\": [], \"db_tablespace\": \"\", \"unique_together\": [], \"__unique_together_applied\": true, \"index_together\": [], \"constraints\": []}}}}, \"corsheaders\": {\"legacy_app_label\": \"corsheaders\", \"models\": {\"CorsModel\": {\"fields\": {\"id\": {\"type\": \"django.db.models.AutoField\", \"attrs\": {\"primary_key\": true}}, \"cors\": {\"type\": \"django.db.models.CharField\", \"attrs\": {\"max_length\": 255}}}, \"meta\": {\"pk_column\": \"id\", \"db_table\": \"corsheaders_corsmodel\", \"indexes\": [], \"db_tablespace\": \"\", \"unique_together\": [], \"__unique_together_applied\": true, \"index_together\": [], \"constraints\": []}}}}, \"admin\": {\"legacy_app_label\": \"admin\", \"upgrade_method\": \"migrations\", \"applied_migrations\": [\"0001_initial\", \"0002_logentry_remove_auto_add\"], \"models\": {\"LogEntry\": {\"fields\": {\"id\": {\"type\": \"django.db.models.AutoField\", \"attrs\": {\"primary_key\": true}}, \"action_time\": {\"type\": \"django.db.models.DateTimeField\"}, \"user\": {\"type\": \"django.db.models.ForeignKey\", \"related_model\": \"auth.User\"}, \"content_type\": {\"type\": \"django.db.models.ForeignKey\", \"attrs\": {\"null\": true}, \"related_model\": \"contenttypes.ContentType\"}, \"object_id\": {\"type\": \"django.db.models.TextField\", \"attrs\": {\"null\": true}}, \"object_repr\": {\"type\": \"django.db.models.CharField\", \"attrs\": {\"max_length\": 200}}, \"action_flag\": {\"type\": \"django.db.models.PositiveSmallIntegerField\"}, \"change_message\": {\"type\": \"django.db.models.TextField\"}}, \"meta\": {\"pk_column\": \"id\", \"db_table\": \"django_admin_log\", \"indexes\": [], \"db_tablespace\": \"\", \"unique_together\": [], \"__unique_together_applied\": true, \"index_together\": [], \"constraints\": []}}}}, \"auth\": {\"legacy_app_label\": \"auth\", \"upgrade_method\": \"migrations\", \"applied_migrations\": [\"0001_initial\", \"0002_alter_permission_name_max_length\", \"0003_alter_user_email_max_length\", \"0004_alter_user_username_opts\", \"0005_alter_user_last_login_null\", \"0006_require_contenttypes_0002\", \"0007_alter_validators_add_error_messages\", \"0008_alter_user_username_max_length\"], \"models\": {\"Permission\": {\"fields\": {\"id\": {\"type\": \"django.db.models.AutoField\", \"attrs\": {\"primary_key\": true}}, \"name\": {\"type\": \"django.db.models.CharField\", \"attrs\": {\"max_length\": 255}}, \"content_type\": {\"type\": \"django.db.models.ForeignKey\", \"related_model\": \"contenttypes.ContentType\"}, \"codename\": {\"type\": \"django.db.models.CharField\", \"attrs\": {\"max_length\": 100}}}, \"meta\": {\"pk_column\": \"id\", \"db_table\": \"auth_permission\", \"indexes\": [], \"db_tablespace\": \"\", \"unique_together\": [[\"content_type\", \"codename\"]], \"__unique_together_applied\": true, \"index_together\": [], \"constraints\": []}}, \"Group\": {\"fields\": {\"id\": {\"type\": \"django.db.models.AutoField\", \"attrs\": {\"primary_key\": true}}, \"name\": {\"type\": \"django.db.models.CharField\", \"attrs\": {\"max_length\": 80, \"unique\": true}}, \"permissions\": {\"type\": \"django.db.models.ManyToManyField\", \"related_model\": \"auth.Permission\"}}, \"meta\": {\"pk_column\": \"id\", \"db_table\": \"auth_group\", \"indexes\": [], \"db_tablespace\": \"\", \"unique_together\": [], \"__unique_together_applied\": true, \"index_together\": [], \"constraints\": []}}, \"User\": {\"fields\": {\"id\": {\"type\": \"django.db.models.AutoField\", \"attrs\": {\"primary_key\": true}}, \"password\": {\"type\": \"django.db.models.CharField\", \"attrs\": {\"max_length\": 128}}, \"last_login\": {\"type\": \"django.db.models.DateTimeField\", \"attrs\": {\"null\": true}}, \"is_superuser\": {\"type\": \"django.db.models.BooleanField\"}, \"username\": {\"type\": \"django.db.models.CharField\", \"attrs\": {\"max_length\": 150, \"unique\": true}}, \"first_name\": {\"type\": \"django.db.models.CharField\", \"attrs\": {\"max_length\": 30}}, \"last_name\": {\"type\": \"django.db.models.CharField\", \"attrs\": {\"max_length\": 30}}, \"email\": {\"type\": \"django.db.models.EmailField\", \"attrs\": {\"max_length\": 254}}, \"is_staff\": {\"type\": \"django.db.models.BooleanField\"}, \"is_active\": {\"type\": \"django.db.models.BooleanField\"}, \"date_joined\": {\"type\": \"django.db.models.DateTimeField\"}, \"groups\": {\"type\": \"django.db.models.ManyToManyField\", \"related_model\": \"auth.Group\"}, \"user_permissions\": {\"type\": \"django.db.models.ManyToManyField\", \"related_model\": \"auth.Permission\"}}, \"meta\": {\"pk_column\": \"id\", \"db_table\": \"auth_user\", \"indexes\": [], \"db_tablespace\": \"\", \"unique_together\": [], \"__unique_together_applied\": true, \"index_together\": [], \"constraints\": []}}}}, \"contenttypes\": {\"legacy_app_label\": \"contenttypes\", \"upgrade_method\": \"migrations\", \"applied_migrations\": [\"0001_initial\", \"0002_remove_content_type_name\"], \"models\": {\"ContentType\": {\"fields\": {\"id\": {\"type\": \"django.db.models.AutoField\", \"attrs\": {\"primary_key\": true}}, \"app_label\": {\"type\": \"django.db.models.CharField\", \"attrs\": {\"max_length\": 100}}, \"model\": {\"type\": \"django.db.models.CharField\", \"attrs\": {\"max_length\": 100}}}, \"meta\": {\"pk_column\": \"id\", \"db_table\": \"django_content_type\", \"indexes\": [], \"db_tablespace\": \"\", \"unique_together\": [[\"app_label\", \"model\"]], \"__unique_together_applied\": true, \"index_together\": [], \"constraints\": []}}}}, \"sites\": {\"legacy_app_label\": \"sites\", \"upgrade_method\": \"migrations\", \"applied_migrations\": [\"0001_initial\", \"0002_alter_domain_unique\"], \"models\": {\"Site\": {\"fields\": {\"id\": {\"type\": \"django.db.models.AutoField\", \"attrs\": {\"primary_key\": true}}, \"domain\": {\"type\": \"django.db.models.CharField\", \"attrs\": {\"max_length\": 100, \"unique\": true}}, \"name\": {\"type\": \"django.db.models.CharField\", \"attrs\": {\"max_length\": 50}}}, \"meta\": {\"pk_column\": \"id\", \"db_table\": \"django_site\", \"indexes\": [], \"db_tablespace\": \"\", \"unique_together\": [], \"__unique_together_applied\": true, \"index_together\": [], \"constraints\": []}}}}, \"sessions\": {\"legacy_app_label\": \"sessions\", \"upgrade_method\": \"migrations\", \"applied_migrations\": [\"0001_initial\"], \"models\": {\"Session\": {\"fields\": {\"session_key\": {\"type\": \"django.db.models.CharField\", \"attrs\": {\"max_length\": 40, \"primary_key\": true}}, \"session_data\": {\"type\": \"django.db.models.TextField\"}, \"expire_date\": {\"type\": \"django.db.models.DateTimeField\", \"attrs\": {\"db_index\": true}}}, \"meta\": {\"pk_column\": \"session_key\", \"db_table\": \"django_session\", \"indexes\": [], \"db_tablespace\": \"\", \"unique_together\": [], \"__unique_together_applied\": true, \"index_together\": [], \"constraints\": []}}}}, \"oauth2_provider\": {\"legacy_app_label\": \"oauth2_provider\", \"upgrade_method\": \"migrations\", \"applied_migrations\": [\"0001_initial\", \"0002_08_updates\"], \"models\": {\"Application\": {\"fields\": {\"id\": {\"type\": \"django.db.models.AutoField\", \"attrs\": {\"primary_key\": true}}, \"client_id\": {\"type\": \"django.db.models.CharField\", \"attrs\": {\"max_length\": 100, \"unique\": true, \"db_index\": true}}, \"user\": {\"type\": \"django.db.models.ForeignKey\", \"related_model\": \"auth.User\"}, \"redirect_uris\": {\"type\": \"django.db.models.TextField\"}, \"client_type\": {\"type\": \"django.db.models.CharField\", \"attrs\": {\"max_length\": 32}}, \"authorization_grant_type\": {\"type\": \"django.db.models.CharField\", \"attrs\": {\"max_length\": 32}}, \"client_secret\": {\"type\": \"django.db.models.CharField\", \"attrs\": {\"max_length\": 255, \"db_index\": true}}, \"name\": {\"type\": \"django.db.models.CharField\", \"attrs\": {\"max_length\": 255}}, \"skip_authorization\": {\"type\": \"django.db.models.BooleanField\"}}, \"meta\": {\"pk_column\": \"id\", \"db_table\": \"oauth2_provider_application\", \"indexes\": [], \"db_tablespace\": \"\", \"unique_together\": [], \"__unique_together_applied\": true, \"index_together\": [], \"constraints\": []}}, \"Grant\": {\"fields\": {\"id\": {\"type\": \"django.db.models.AutoField\", \"attrs\": {\"primary_key\": true}}, \"user\": {\"type\": \"django.db.models.ForeignKey\", \"related_model\": \"auth.User\"}, \"code\": {\"type\": \"django.db.models.CharField\", \"attrs\": {\"max_length\": 255, \"db_index\": true}}, \"application\": {\"type\": \"django.db.models.ForeignKey\", \"related_model\": \"oauth.Application\"}, \"expires\": {\"type\": \"django.db.models.DateTimeField\"}, \"redirect_uri\": {\"type\": \"django.db.models.CharField\", \"attrs\": {\"max_length\": 255}}, \"scope\": {\"type\": \"django.db.models.TextField\"}}, \"meta\": {\"pk_column\": \"id\", \"db_table\": \"oauth2_provider_grant\", \"indexes\": [], \"db_tablespace\": \"\", \"unique_together\": [], \"__unique_together_applied\": true, \"index_together\": [], \"constraints\": []}}, \"AccessToken\": {\"fields\": {\"id\": {\"type\": \"django.db.models.AutoField\", \"attrs\": {\"primary_key\": true}}, \"user\": {\"type\": \"django.db.models.ForeignKey\", \"attrs\": {\"null\": true}, \"related_model\": \"auth.User\"}, \"token\": {\"type\": \"django.db.models.CharField\", \"attrs\": {\"max_length\": 255, \"db_index\": true}}, \"application\": {\"type\": \"django.db.models.ForeignKey\", \"related_model\": \"oauth.Application\"}, \"expires\": {\"type\": \"django.db.models.DateTimeField\"}, \"scope\": {\"type\": \"django.db.models.TextField\"}}, \"meta\": {\"pk_column\": \"id\", \"db_table\": \"oauth2_provider_accesstoken\", \"indexes\": [], \"db_tablespace\": \"\", \"unique_together\": [], \"__unique_together_applied\": true, \"index_together\": [], \"constraints\": []}}, \"RefreshToken\": {\"fields\": {\"id\": {\"type\": \"django.db.models.AutoField\", \"attrs\": {\"primary_key\": true}}, \"user\": {\"type\": \"django.db.models.ForeignKey\", \"related_model\": \"auth.User\"}, \"token\": {\"type\": \"django.db.models.CharField\", \"attrs\": {\"max_length\": 255, \"db_index\": true}}, \"application\": {\"type\": \"django.db.models.ForeignKey\", \"related_model\": \"oauth.Application\"}, \"access_token\": {\"type\": \"django.db.models.OneToOneField\", \"attrs\": {\"unique\": true}, \"related_model\": \"oauth2_provider.AccessToken\"}}, \"meta\": {\"pk_column\": \"id\", \"db_table\": \"oauth2_provider_refreshtoken\", \"indexes\": [], \"db_tablespace\": \"\", \"unique_together\": [], \"__unique_together_applied\": true, \"index_together\": [], \"constraints\": []}}}}, \"accounts\": {\"legacy_app_label\": \"accounts\", \"upgrade_method\": \"evolutions\", \"models\": {\"ReviewRequestVisit\": {\"fields\": {\"id\": {\"type\": \"django.db.models.AutoField\", \"attrs\": {\"primary_key\": true}}, \"user\": {\"type\": \"django.db.models.ForeignKey\", \"related_model\": \"auth.User\"}, \"review_request\": {\"type\": \"django.db.models.ForeignKey\", \"related_model\": \"reviews.ReviewRequest\"}, \"timestamp\": {\"type\": \"django.db.models.DateTimeField\"}, \"visibility\": {\"type\": \"django.db.models.CharField\", \"attrs\": {\"max_length\": 1}}}, \"meta\": {\"pk_column\": \"id\", \"db_table\": \"accounts_reviewrequestvisit\", \"indexes\": [], \"db_tablespace\": \"\", \"unique_together\": [[\"user\", \"review_request\"]], \"__unique_together_applied\": true, \"index_together\": [[\"user\", \"visibility\"]], \"constraints\": []}}, \"Profile\": {\"fields\": {\"id\": {\"type\": \"django.db.models.AutoField\", \"attrs\": {\"primary_key\": true}}, \"user\": {\"type\": \"django.db.models.ForeignKey\", \"attrs\": {\"unique\": true}, \"related_model\": \"auth.User\"}, \"first_time_setup_done\": {\"type\": \"django.db.models.BooleanField\"}, \"should_send_email\": {\"type\": \"django.db.models.BooleanField\"}, \"should_send_own_updates\": {\"type\": \"django.db.models.BooleanField\"}, \"collapsed_diffs\": {\"type\": \"django.db.models.BooleanField\"}, \"wordwrapped_diffs\": {\"type\": \"django.db.models.BooleanField\"}, \"syntax_highlighting\": {\"type\": \"django.db.models.BooleanField\"}, \"is_private\": {\"type\": \"django.db.models.BooleanField\"}, \"open_an_issue\": {\"type\": \"django.db.models.BooleanField\"}, \"default_use_rich_text\": {\"type\": \"django.db.models.NullBooleanField\", \"attrs\": {\"null\": true}}, \"show_closed\": {\"type\": \"django.db.models.BooleanField\"}, \"sort_review_request_columns\": {\"type\": \"django.db.models.CharField\", \"attrs\": {\"max_length\": 256}}, \"sort_dashboard_columns\": {\"type\": \"django.db.models.CharField\", \"attrs\": {\"max_length\": 256}}, \"sort_submitter_columns\": {\"type\": \"django.db.models.CharField\", \"attrs\": {\"max_length\": 256}}, \"sort_group_columns\": {\"type\": \"django.db.models.CharField\", \"attrs\": {\"max_length\": 256}}, \"review_request_columns\": {\"type\": \"django.db.models.CharField\", \"attrs\": {\"max_length\": 256}}, \"dashboard_columns\": {\"type\": \"django.db.models.CharField\", \"attrs\": {\"max_length\": 256}}, \"submitter_columns\": {\"type\": \"django.db.models.CharField\", \"attrs\": {\"max_length\": 256}}, \"group_columns\": {\"type\": \"django.db.models.CharField\", \"attrs\": {\"max_length\": 256}}, \"timezone\": {\"type\": \"django.db.models.CharField\", \"attrs\": {\"max_length\": 30}}, \"settings\": {\"type\": \"djblets.db.fields.json_field.JSONField\", \"attrs\": {\"null\": true}}, \"extra_data\": {\"type\": \"djblets.db.fields.json_field.JSONField\", \"attrs\": {\"null\": true}}, \"starred_review_requests\": {\"type\": \"django.db.models.ManyToManyField\", \"related_model\": \"reviews.ReviewRequest\"}, \"starred_groups\": {\"type\": \"django.db.models.ManyToManyField\", \"related_model\": \"reviews.Group\"}}, \"meta\": {\"pk_column\": \"id\", \"db_table\": \"accounts_profile\", \"indexes\": [], \"db_tablespace\": \"\", \"unique_together\": [], \"__unique_together_applied\": true, \"index_together\": [], \"constraints\": []}}, \"LocalSiteProfile\": {\"fields\": {\"id\": {\"type\": \"django.db.models.AutoField\", \"attrs\": {\"primary_key\": true}}, \"user\": {\"type\": \"django.db.models.ForeignKey\", \"related_model\": \"auth.User\"}, \"profile\": {\"type\": \"django.db.models.ForeignKey\", \"related_model\": \"accounts.Profile\"}, \"local_site\": {\"type\": \"django.db.models.ForeignKey\", \"attrs\": {\"null\": true}, \"related_model\": \"site.LocalSite\"}, \"permissions\": {\"type\": \"djblets.db.fields.json_field.JSONField\", \"attrs\": {\"null\": true}}, \"direct_incoming_request_count\": {\"type\": \"djblets.db.fields.counter_field.CounterField\", \"attrs\": {\"null\": true}}, \"total_incoming_request_count\": {\"type\": \"djblets.db.fields.counter_field.CounterField\", \"attrs\": {\"null\": true}}, \"pending_outgoing_request_count\": {\"type\": \"djblets.db.fields.counter_field.CounterField\", \"attrs\": {\"null\": true}}, \"total_outgoing_request_count\": {\"type\": \"djblets.db.fields.counter_field.CounterField\", \"attrs\": {\"null\": true}}, \"starred_public_request_count\": {\"type\": \"djblets.db.fields.counter_field.CounterField\", \"attrs\": {\"null\": true}}}, \"meta\": {\"pk_column\": \"id\", \"db_table\": \"accounts_localsiteprofile\", \"indexes\": [], \"db_tablespace\": \"\", \"unique_together\": [[\"user\", \"local_site\"], [\"profile\", \"local_site\"]], \"__unique_together_applied\": true, \"index_together\": [], \"constraints\": []}}, \"Trophy\": {\"fields\": {\"id\": {\"type\": \"django.db.models.AutoField\", \"attrs\": {\"primary_key\": true}}, \"category\": {\"type\": \"django.db.models.CharField\", \"attrs\": {\"max_length\": 100}}, \"received_date\": {\"type\": \"django.db.models.DateTimeField\"}, \"review_request\": {\"type\": \"django.db.models.ForeignKey\", \"related_model\": \"reviews.ReviewRequest\"}, \"local_site\": {\"type\": \"django.db.models.ForeignKey\", \"attrs\": {\"null\": true}, \"related_model\": \"site.LocalSite\"}, \"user\": {\"type\": \"django.db.models.ForeignKey\", \"related_model\": \"auth.User\"}}, \"meta\": {\"pk_column\": \"id\", \"db_table\": \"accounts_trophy\", \"indexes\": [], \"db_tablespace\": \"\", \"unique_together\": [], \"__unique_together_applied\": true, \"index_together\": [], \"constraints\": []}}}}, \"attachments\": {\"legacy_app_label\": \"attachments\", \"upgrade_method\": \"evolutions\", \"models\": {\"FileAttachmentHistory\": {\"fields\": {\"id\": {\"type\": \"django.db.models.AutoField\", \"attrs\": {\"primary_key\": true}}, \"display_position\": {\"type\": \"django.db.models.IntegerField\"}, \"latest_revision\": {\"type\": \"djblets.db.fields.relation_counter_field.RelationCounterField\", \"attrs\": {\"null\": true}}}, \"meta\": {\"pk_column\": \"id\", \"db_table\": \"attachments_fileattachmenthistory\", \"indexes\": [], \"db_tablespace\": \"\", \"unique_together\": [], \"__unique_together_applied\": true, \"index_together\": [], \"constraints\": []}}, \"FileAttachment\": {\"fields\": {\"id\": {\"type\": \"django.db.models.AutoField\", \"attrs\": {\"primary_key\": true}}, \"caption\": {\"type\": \"django.db.models.CharField\", \"attrs\": {\"max_length\": 256}}, \"draft_caption\": {\"type\": \"django.db.models.CharField\", \"attrs\": {\"max_length\": 256}}, \"orig_filename\": {\"type\": \"django.db.models.CharField\", \"attrs\": {\"max_length\": 256, \"null\": true}}, \"user\": {\"type\": \"django.db.models.ForeignKey\", \"attrs\": {\"null\": true}, \"related_model\": \"auth.User\"}, \"local_site\": {\"type\": \"django.db.models.ForeignKey\", \"attrs\": {\"null\": true}, \"related_model\": \"site.LocalSite\"}, \"uuid\": {\"type\": \"django.db.models.CharField\", \"attrs\": {\"max_length\": 255}}, \"file\": {\"type\": \"django.db.models.FileField\", \"attrs\": {\"max_length\": 512, \"null\": true}}, \"mimetype\": {\"type\": \"django.db.models.CharField\", \"attrs\": {\"max_length\": 256}}, \"repo_path\": {\"type\": \"django.db.models.CharField\", \"attrs\": {\"max_length\": 1024, \"null\": true}}, \"repo_revision\": {\"type\": \"django.db.models.CharField\", \"attrs\": {\"max_length\": 64, \"null\": true, \"db_index\": true}}, \"repository\": {\"type\": \"django.db.models.ForeignKey\", \"attrs\": {\"null\": true}, \"related_model\": \"scmtools.Repository\"}, \"added_in_filediff\": {\"type\": \"django.db.models.ForeignKey\", \"attrs\": {\"null\": true}, \"related_model\": \"diffviewer.FileDiff\"}, \"attachment_history\": {\"type\": \"django.db.models.ForeignKey\", \"attrs\": {\"null\": true}, \"related_model\": \"attachments.FileAttachmentHistory\"}, \"attachment_revision\": {\"type\": \"django.db.models.IntegerField\"}}, \"meta\": {\"pk_column\": \"id\", \"db_table\": \"attachments_fileattachment\", \"indexes\": [], \"db_tablespace\": \"\", \"unique_together\": [], \"__unique_together_applied\": true, \"index_together\": [], \"constraints\": []}}}}, \"changedescs\": {\"legacy_app_label\": \"changedescs\", \"upgrade_method\": \"evolutions\", \"models\": {\"ChangeDescription\": {\"fields\": {\"id\": {\"type\": \"django.db.models.AutoField\", \"attrs\": {\"primary_key\": true}}, \"user\": {\"type\": \"django.db.models.ForeignKey\", \"attrs\": {\"null\": true}, \"related_model\": \"auth.User\"}, \"timestamp\": {\"type\": \"django.db.models.DateTimeField\"}, \"public\": {\"type\": \"django.db.models.BooleanField\"}, \"text\": {\"type\": \"django.db.models.TextField\"}, \"rich_text\": {\"type\": \"django.db.models.BooleanField\"}, \"fields_changed\": {\"type\": \"djblets.db.fields.json_field.JSONField\"}}, \"meta\": {\"pk_column\": \"id\", \"db_table\": \"changedescs_changedescription\", \"indexes\": [], \"db_tablespace\": \"\", \"unique_together\": [], \"__unique_together_applied\": true, \"index_together\": [], \"constraints\": []}}}}, \"diffviewer\": {\"legacy_app_label\": \"diffviewer\", \"upgrade_method\": \"evolutions\", \"models\": {\"DiffSet\": {\"fields\": {\"id\": {\"type\": \"django.db.models.AutoField\", \"attrs\": {\"primary_key\": true}}, \"name\": {\"type\": \"django.db.models.CharField\", \"attrs\": {\"max_length\": 256}}, \"revision\": {\"type\": \"django.db.models.IntegerField\"}, \"timestamp\": {\"type\": \"django.db.models.DateTimeField\"}, \"basedir\": {\"type\": \"django.db.models.CharField\", \"attrs\": {\"max_length\": 256}}, \"history\": {\"type\": \"django.db.models.ForeignKey\", \"attrs\": {\"null\": true}, \"related_model\": \"diffviewer.DiffSetHistory\"}, \"repository\": {\"type\": \"django.db.models.ForeignKey\", \"related_model\": \"scmtools.Repository\"}, \"diffcompat\": {\"type\": \"django.db.models.IntegerField\"}, \"base_commit_id\": {\"type\": \"django.db.models.CharField\", \"attrs\": {\"max_length\": 64, \"null\": true, \"db_index\": true}}, \"commit_count\": {\"type\": \"djblets.db.fields.relation_counter_field.RelationCounterField\", \"attrs\": {\"null\": true}}, \"extra_data\": {\"type\": \"djblets.db.fields.json_field.JSONField\", \"attrs\": {\"null\": true}}}, \"meta\": {\"pk_column\": \"id\", \"db_table\": \"diffviewer_diffset\", \"indexes\": [], \"db_tablespace\": \"\", \"unique_together\": [], \"__unique_together_applied\": true, \"index_together\": [], \"constraints\": []}}, \"DiffCommit\": {\"fields\": {\"id\": {\"type\": \"django.db.models.AutoField\", \"attrs\": {\"primary_key\": true}}, \"filename\": {\"type\": \"django.db.models.CharField\", \"attrs\": {\"max_length\": 256}}, \"diffset\": {\"type\": \"django.db.models.ForeignKey\", \"related_model\": \"diffviewer.DiffSet\"}, \"author_name\": {\"type\": \"django.db.models.CharField\", \"attrs\": {\"max_length\": 256}}, \"author_email\": {\"type\": \"django.db.models.CharField\", \"attrs\": {\"max_length\": 256}}, \"author_date_utc\": {\"type\": \"django.db.models.DateTimeField\"}, \"author_date_offset\": {\"type\": \"django.db.models.IntegerField\"}, \"committer_name\": {\"type\": \"django.db.models.CharField\", \"attrs\": {\"max_length\": 256, \"null\": true}}, \"committer_email\": {\"type\": \"django.db.models.CharField\", \"attrs\": {\"max_length\": 256, \"null\": true}}, \"committer_date_utc\": {\"type\": \"django.db.models.DateTimeField\", \"attrs\": {\"null\": true}}, \"committer_date_offset\": {\"type\": \"django.db.models.IntegerField\", \"attrs\": {\"null\": true}}, \"commit_message\": {\"type\": \"django.db.models.TextField\"}, \"commit_id\": {\"type\": \"django.db.models.CharField\", \"attrs\": {\"max_length\": 64}}, \"parent_id\": {\"type\": \"django.db.models.CharField\", \"attrs\": {\"max_length\": 64}}, \"last_modified\": {\"type\": \"django.db.models.DateTimeField\"}, \"extra_data\": {\"type\": \"djblets.db.fields.json_field.JSONField\", \"attrs\": {\"null\": true}}}, \"meta\": {\"pk_column\": \"id\", \"db_table\": \"diffviewer_diffcommit\", \"indexes\": [], \"db_tablespace\": \"\", \"unique_together\": [[\"diffset\", \"commit_id\"]], \"__unique_together_applied\": true, \"index_together\": [], \"constraints\": []}}, \"DiffSetHistory\": {\"fields\": {\"id\": {\"type\": \"django.db.models.AutoField\", \"attrs\": {\"primary_key\": true}}, \"name\": {\"type\": \"django.db.models.CharField\", \"attrs\": {\"max_length\": 256}}, \"timestamp\": {\"type\": \"django.db.models.DateTimeField\"}, \"last_diff_updated\": {\"type\": \"django.db.models.DateTimeField\", \"attrs\": {\"null\": true}}, \"extra_data\": {\"type\": \"djblets.db.fields.json_field.JSONField\", \"attrs\": {\"null\": true}}}, \"meta\": {\"pk_column\": \"id\", \"db_table\": \"diffviewer_diffsethistory\", \"indexes\": [], \"db_tablespace\": \"\", \"unique_together\": [], \"__unique_together_applied\": true, \"index_together\": [], \"constraints\": []}}, \"LegacyFileDiffData\": {\"fields\": {\"binary_hash\": {\"type\": \"django.db.models.CharField\", \"attrs\": {\"max_length\": 40, \"primary_key\": true}}, \"binary\": {\"type\": \"djblets.db.fields.base64_field.Base64Field\"}, \"extra_data\": {\"type\": \"djblets.db.fields.json_field.JSONField\", \"attrs\": {\"null\": true}}}, \"meta\": {\"pk_column\": \"binary_hash\", \"db_table\": \"diffviewer_filediffdata\", \"indexes\": [], \"db_tablespace\": \"\", \"unique_together\": [], \"__unique_together_applied\": true, \"index_together\": [], \"constraints\": []}}, \"RawFileDiffData\": {\"fields\": {\"id\": {\"type\": \"django.db.models.AutoField\", \"attrs\": {\"primary_key\": true}}, \"binary_hash\": {\"type\": \"django.db.models.CharField\", \"attrs\": {\"max_length\": 40, \"unique\": true}}, \"binary\": {\"type\": \"django.db.models.BinaryField\"}, \"compression\": {\"type\": \"django.db.models.CharField\", \"attrs\": {\"max_length\": 1, \"null\": true}}, \"extra_data\": {\"type\": \"djblets.db.fields.json_field.JSONField\", \"attrs\": {\"null\": true}}}, \"meta\": {\"pk_column\": \"id\", \"db_table\": \"diffviewer_rawfilediffdata\", \"indexes\": [], \"db_tablespace\": \"\", \"unique_together\": [], \"__unique_together_applied\": true, \"index_together\": [], \"constraints\": []}}, \"FileDiff\": {\"fields\": {\"id\": {\"type\": \"django.db.models.AutoField\", \"attrs\": {\"primary_key\": true}}, \"diffset\": {\"type\": \"django.db.models.ForeignKey\", \"related_model\": \"diffviewer.DiffSet\"}, \"commit\": {\"type\": \"django.db.models.ForeignKey\", \"attrs\": {\"null\": true}, \"related_model\": \"diffviewer.DiffCommit\"}, \"source_file\": {\"type\": \"django.db.models.CharField\", \"attrs\": {\"max_length\": 1024}}, \"dest_file\": {\"type\": \"django.db.models.CharField\", \"attrs\": {\"max_length\": 1024}}, \"source_revision\": {\"type\": \"django.db.models.CharField\", \"attrs\": {\"max_length\": 512}}, \"dest_detail\": {\"type\": \"django.db.models.CharField\", \"attrs\": {\"max_length\": 512}}, \"binary\": {\"type\": \"django.db.models.BooleanField\"}, \"status\": {\"type\": \"django.db.models.CharField\", \"attrs\": {\"max_length\": 1}}, \"diff64\": {\"type\": \"djblets.db.fields.base64_field.Base64Field\", \"attrs\": {\"db_column\": \"diff_base64\"}}, \"legacy_diff_hash\": {\"type\": \"django.db.models.ForeignKey\", \"attrs\": {\"null\": true, \"db_column\": \"diff_hash_id\"}, \"related_model\": \"diffviewer.LegacyFileDiffData\"}, \"diff_hash\": {\"type\": \"django.db.models.ForeignKey\", \"attrs\": {\"null\": true, \"db_column\": \"raw_diff_hash_id\"}, \"related_model\": \"diffviewer.RawFileDiffData\"}, \"parent_diff64\": {\"type\": \"djblets.db.fields.base64_field.Base64Field\", \"attrs\": {\"db_column\": \"parent_diff_base64\"}}, \"legacy_parent_diff_hash\": {\"type\": \"django.db.models.ForeignKey\", \"attrs\": {\"null\": true, \"db_column\": \"parent_diff_hash_id\"}, \"related_model\": \"diffviewer.LegacyFileDiffData\"}, \"parent_diff_hash\": {\"type\": \"django.db.models.ForeignKey\", \"attrs\": {\"null\": true, \"db_column\": \"raw_parent_diff_hash_id\"}, \"related_model\": \"diffviewer.RawFileDiffData\"}, \"extra_data\": {\"type\": \"djblets.db.fields.json_field.JSONField\", \"attrs\": {\"null\": true}}}, \"meta\": {\"pk_column\": \"id\", \"db_table\": \"diffviewer_filediff\", \"indexes\": [], \"db_tablespace\": \"\", \"unique_together\": [], \"__unique_together_applied\": true, \"index_together\": [], \"constraints\": []}}}}, \"hostingsvcs\": {\"legacy_app_label\": \"hostingsvcs\", \"upgrade_method\": \"evolutions\", \"models\": {\"HostingServiceAccount\": {\"fields\": {\"id\": {\"type\": \"django.db.models.AutoField\", \"attrs\": {\"primary_key\": true}}, \"service_name\": {\"type\": \"django.db.models.CharField\", \"attrs\": {\"max_length\": 128}}, \"hosting_url\": {\"type\": \"django.db.models.CharField\", \"attrs\": {\"max_length\": 255, \"null\": true}}, \"username\": {\"type\": \"django.db.models.CharField\", \"attrs\": {\"max_length\": 128}}, \"data\": {\"type\": \"djblets.db.fields.json_field.JSONField\"}, \"visible\": {\"type\": \"django.db.models.BooleanField\"}, \"local_site\": {\"type\": \"django.db.models.ForeignKey\", \"attrs\": {\"null\": true}, \"related_model\": \"site.LocalSite\"}}, \"meta\": {\"pk_column\": \"id\", \"db_table\": \"hostingsvcs_hostingserviceaccount\", \"indexes\": [], \"db_tablespace\": \"\", \"unique_together\": [], \"__unique_together_applied\": true, \"index_together\": [], \"constraints\": []}}}}, \"integrations\": {\"legacy_app_label\": \"integrations\", \"models\": {\"IntegrationConfig\": {\"fields\": {\"id\": {\"type\": \"django.db.models.AutoField\", \"attrs\": {\"primary_key\": true}}, \"integration_id\": {\"type\": \"django.db.models.CharField\", \"attrs\": {\"max_length\": 255, \"db_index\": true}}, \"time_added\": {\"type\": \"django.db.models.DateTimeField\"}, \"last_updated\": {\"type\": \"django.db.models.DateTimeField\"}, \"name\": {\"type\": \"django.db.models.CharField\", \"attrs\": {\"max_length\": 255, \"null\": true}}, \"enabled\": {\"type\": \"django.db.models.BooleanField\", \"attrs\": {\"db_index\": true}}, \"settings\": {\"type\": \"djblets.db.fields.json_field.JSONField\"}, \"extra_data\": {\"type\": \"djblets.db.fields.json_field.JSONField\"}, \"local_site\": {\"type\": \"django.db.models.ForeignKey\", \"attrs\": {\"null\": true}, \"related_model\": \"site.LocalSite\"}}, \"meta\": {\"pk_column\": \"id\", \"db_table\": \"integrations_integrationconfig\", \"indexes\": [], \"db_tablespace\": \"\", \"unique_together\": [], \"__unique_together_applied\": true, \"index_together\": [], \"constraints\": []}}}}, \"notifications\": {\"legacy_app_label\": \"notifications\", \"upgrade_method\": \"evolutions\", \"models\": {\"WebHookTarget\": {\"fields\": {\"id\": {\"type\": \"django.db.models.AutoField\", \"attrs\": {\"primary_key\": true}}, \"enabled\": {\"type\": \"django.db.models.BooleanField\"}, \"events\": {\"type\": \"multiselectfield.db.fields.MultiSelectField\", \"attrs\": {\"max_length\": 105}}, \"url\": {\"type\": \"django.db.models.URLField\", \"attrs\": {\"max_length\": 200}}, \"encoding\": {\"type\": \"django.db.models.CharField\", \"attrs\": {\"max_length\": 40}}, \"use_custom_content\": {\"type\": \"django.db.models.BooleanField\"}, \"custom_content\": {\"type\": \"django.db.models.TextField\", \"attrs\": {\"null\": true}}, \"secret\": {\"type\": \"django.db.models.CharField\", \"attrs\": {\"max_length\": 128}}, \"apply_to\": {\"type\": \"django.db.models.CharField\", \"attrs\": {\"max_length\": 1}}, \"local_site\": {\"type\": \"django.db.models.ForeignKey\", \"attrs\": {\"null\": true}, \"related_model\": \"site.LocalSite\"}, \"extra_data\": {\"type\": \"djblets.db.fields.json_field.JSONField\", \"attrs\": {\"null\": true}}, \"repositories\": {\"type\": \"django.db.models.ManyToManyField\", \"related_model\": \"scmtools.Repository\"}}, \"meta\": {\"pk_column\": \"id\", \"db_table\": \"notifications_webhooktarget\", \"indexes\": [], \"db_tablespace\": \"\", \"unique_together\": [], \"__unique_together_applied\": true, \"index_together\": [], \"constraints\": []}}}}, \"oauth\": {\"legacy_app_label\": \"oauth\", \"upgrade_method\": \"evolutions\", \"models\": {\"Application\": {\"fields\": {\"id\": {\"type\": \"django.db.models.AutoField\", \"attrs\": {\"primary_key\": true}}, \"client_id\": {\"type\": \"django.db.models.CharField\", \"attrs\": {\"max_length\": 100, \"unique\": true, \"db_index\": true}}, \"user\": {\"type\": \"django.db.models.ForeignKey\", \"related_model\": \"auth.User\"}, \"redirect_uris\": {\"type\": \"django.db.models.TextField\"}, \"client_type\": {\"type\": \"django.db.models.CharField\", \"attrs\": {\"max_length\": 32}}, \"authorization_grant_type\": {\"type\": \"django.db.models.CharField\", \"attrs\": {\"max_length\": 32}}, \"client_secret\": {\"type\": \"django.db.models.CharField\", \"attrs\": {\"max_length\": 255, \"db_index\": true}}, \"name\": {\"type\": \"django.db.models.CharField\", \"attrs\": {\"max_length\": 255}}, \"skip_authorization\": {\"type\": \"django.db.models.BooleanField\"}, \"enabled\": {\"type\": \"django.db.models.BooleanField\"}, \"original_user\": {\"type\": \"django.db.models.ForeignKey\", \"attrs\": {\"null\": true}, \"related_model\": \"auth.User\"}, \"local_site\": {\"type\": \"django.db.models.ForeignKey\", \"attrs\": {\"null\": true}, \"related_model\": \"site.LocalSite\"}, \"extra_data\": {\"type\": \"djblets.db.fields.json_field.JSONField\", \"attrs\": {\"null\": true}}}, \"meta\": {\"pk_column\": \"id\", \"db_table\": \"reviewboard_oauth_application\", \"indexes\": [], \"db_tablespace\": \"\", \"unique_together\": [], \"__unique_together_applied\": true, \"index_together\": [], \"constraints\": []}}}}, \"reviews\": {\"legacy_app_label\": \"reviews\", \"upgrade_method\": \"evolutions\", \"models\": {\"Group\": {\"fields\": {\"id\": {\"type\": \"django.db.models.AutoField\", \"attrs\": {\"primary_key\": true}}, \"name\": {\"type\": \"django.db.models.SlugField\", \"attrs\": {\"max_length\": 64, \"db_index\": true}}, \"display_name\": {\"type\": \"django.db.models.CharField\", \"attrs\": {\"max_length\": 64}}, \"mailing_list\": {\"type\": \"django.db.models.CharField\", \"attrs\": {\"max_length\": 254}}, \"email_list_only\": {\"type\": \"django.db.models.BooleanField\"}, \"local_site\": {\"type\": \"django.db.models.ForeignKey\", \"attrs\": {\"null\": true}, \"related_model\": \"site.LocalSite\"}, \"is_default_group\": {\"type\": \"django.db.models.BooleanField\"}, \"incoming_request_count\": {\"type\": \"djblets.db.fields.counter_field.CounterField\", \"attrs\": {\"null\": true}}, \"invite_only\": {\"type\": \"django.db.models.BooleanField\"}, \"visible\": {\"type\": \"django.db.models.BooleanField\"}, \"extra_data\": {\"type\": \"djblets.db.fields.json_field.JSONField\", \"attrs\": {\"null\": true}}, \"users\": {\"type\": \"django.db.models.ManyToManyField\", \"related_model\": \"auth.User\"}}, \"meta\": {\"pk_column\": \"id\", \"db_table\": \"reviews_group\", \"indexes\": [], \"db_tablespace\": \"\", \"unique_together\": [[\"name\", \"local_site\"]], \"__unique_together_applied\": true, \"index_together\": [], \"constraints\": []}}, \"DefaultReviewer\": {\"fields\": {\"id\": {\"type\": \"django.db.models.AutoField\", \"attrs\": {\"primary_key\": true}}, \"name\": {\"type\": \"django.db.models.CharField\", \"attrs\": {\"max_length\": 64}}, \"file_regex\": {\"type\": \"django.db.models.CharField\", \"attrs\": {\"max_length\": 256}}, \"local_site\": {\"type\": \"django.db.models.ForeignKey\", \"attrs\": {\"null\": true}, \"related_model\": \"site.LocalSite\"}, \"repository\": {\"type\": \"django.db.models.ManyToManyField\", \"related_model\": \"scmtools.Repository\"}, \"groups\": {\"type\": \"django.db.models.ManyToManyField\", \"related_model\": \"reviews.Group\"}, \"people\": {\"type\": \"django.db.models.ManyToManyField\", \"related_model\": \"auth.User\"}}, \"meta\": {\"pk_column\": \"id\", \"db_table\": \"reviews_defaultreviewer\", \"indexes\": [], \"db_tablespace\": \"\", \"unique_together\": [], \"__unique_together_applied\": true, \"index_together\": [], \"constraints\": []}}, \"Comment\": {\"fields\": {\"id\": {\"type\": \"django.db.models.AutoField\", \"attrs\": {\"primary_key\": true}}, \"issue_opened\": {\"type\": \"django.db.models.BooleanField\"}, \"issue_status\": {\"type\": \"django.db.models.CharField\", \"attrs\": {\"max_length\": 1, \"null\": true, \"db_index\": true}}, \"reply_to\": {\"type\": \"django.db.models.ForeignKey\", \"attrs\": {\"null\": true}, \"related_model\": \"reviews.Comment\"}, \"timestamp\": {\"type\": \"django.db.models.DateTimeField\"}, \"text\": {\"type\": \"django.db.models.TextField\"}, \"rich_text\": {\"type\": \"django.db.models.BooleanField\"}, \"extra_data\": {\"type\": \"djblets.db.fields.json_field.JSONField\", \"attrs\": {\"null\": true}}, \"filediff\": {\"type\": \"django.db.models.ForeignKey\", \"related_model\": \"diffviewer.FileDiff\"}, \"interfilediff\": {\"type\": \"django.db.models.ForeignKey\", \"attrs\": {\"null\": true}, \"related_model\": \"diffviewer.FileDiff\"}, \"first_line\": {\"type\": \"django.db.models.PositiveIntegerField\", \"attrs\": {\"null\": true}}, \"num_lines\": {\"type\": \"django.db.models.PositiveIntegerField\", \"attrs\": {\"null\": true}}}, \"meta\": {\"pk_column\": \"id\", \"db_table\": \"reviews_comment\", \"indexes\": [], \"db_tablespace\": \"\", \"unique_together\": [], \"__unique_together_applied\": true, \"index_together\": [], \"constraints\": []}}, \"FileAttachmentComment\": {\"fields\": {\"id\": {\"type\": \"django.db.models.AutoField\", \"attrs\": {\"primary_key\": true}}, \"issue_opened\": {\"type\": \"django.db.models.BooleanField\"}, \"issue_status\": {\"type\": \"django.db.models.CharField\", \"attrs\": {\"max_length\": 1, \"null\": true, \"db_index\": true}}, \"reply_to\": {\"type\": \"django.db.models.ForeignKey\", \"attrs\": {\"null\": true}, \"related_model\": \"reviews.FileAttachmentComment\"}, \"timestamp\": {\"type\": \"django.db.models.DateTimeField\"}, \"text\": {\"type\": \"django.db.models.TextField\"}, \"rich_text\": {\"type\": \"django.db.models.BooleanField\"}, \"extra_data\": {\"type\": \"djblets.db.fields.json_field.JSONField\", \"attrs\": {\"null\": true}}, \"file_attachment\": {\"type\": \"django.db.models.ForeignKey\", \"related_model\": \"attachments.FileAttachment\"}, \"diff_against_file_attachment\": {\"type\": \"django.db.models.ForeignKey\", \"attrs\": {\"null\": true}, \"related_model\": \"attachments.FileAttachment\"}}, \"meta\": {\"pk_column\": \"id\", \"db_table\": \"reviews_fileattachmentcomment\", \"indexes\": [], \"db_tablespace\": \"\", \"unique_together\": [], \"__unique_together_applied\": true, \"index_together\": [], \"constraints\": []}}, \"GeneralComment\": {\"fields\": {\"id\": {\"type\": \"django.db.models.AutoField\", \"attrs\": {\"primary_key\": true}}, \"issue_opened\": {\"type\": \"django.db.models.BooleanField\"}, \"issue_status\": {\"type\": \"django.db.models.CharField\", \"attrs\": {\"max_length\": 1, \"null\": true, \"db_index\": true}}, \"reply_to\": {\"type\": \"django.db.models.ForeignKey\", \"attrs\": {\"null\": true}, \"related_model\": \"reviews.GeneralComment\"}, \"timestamp\": {\"type\": \"django.db.models.DateTimeField\"}, \"text\": {\"type\": \"django.db.models.TextField\"}, \"rich_text\": {\"type\": \"django.db.models.BooleanField\"}, \"extra_data\": {\"type\": \"djblets.db.fields.json_field.JSONField\", \"attrs\": {\"null\": true}}}, \"meta\": {\"pk_column\": \"id\", \"db_table\": \"reviews_generalcomment\", \"indexes\": [], \"db_tablespace\": \"\", \"unique_together\": [], \"__unique_together_applied\": true, \"index_together\": [], \"constraints\": []}}, \"Screenshot\": {\"fields\": {\"id\": {\"type\": \"django.db.models.AutoField\", \"attrs\": {\"primary_key\": true}}, \"caption\": {\"type\": \"django.db.models.CharField\", \"attrs\": {\"max_length\": 256}}, \"draft_caption\": {\"type\": \"django.db.models.CharField\", \"attrs\": {\"max_length\": 256}}, \"image\": {\"type\": \"django.db.models.ImageField\", \"attrs\": {\"max_length\": 100}}}, \"meta\": {\"pk_column\": \"id\", \"db_table\": \"reviews_screenshot\", \"indexes\": [], \"db_tablespace\": \"\", \"unique_together\": [], \"__unique_together_applied\": true, \"index_together\": [], \"constraints\": []}}, \"ReviewRequest\": {\"fields\": {\"id\": {\"type\": \"django.db.models.AutoField\", \"attrs\": {\"primary_key\": true}}, \"description\": {\"type\": \"django.db.models.TextField\"}, \"description_rich_text\": {\"type\": \"django.db.models.BooleanField\"}, \"testing_done\": {\"type\": \"django.db.models.TextField\"}, \"testing_done_rich_text\": {\"type\": \"django.db.models.BooleanField\"}, \"bugs_closed\": {\"type\": \"django.db.models.CharField\", \"attrs\": {\"max_length\": 300}}, \"branch\": {\"type\": \"django.db.models.CharField\", \"attrs\": {\"max_length\": 300}}, \"commit_id\": {\"type\": \"django.db.models.CharField\", \"attrs\": {\"max_length\": 64, \"null\": true, \"db_index\": true}}, \"extra_data\": {\"type\": \"djblets.db.fields.json_field.JSONField\", \"attrs\": {\"null\": true}}, \"rich_text\": {\"type\": \"django.db.models.BooleanField\"}, \"summary\": {\"type\": \"django.db.models.CharField\", \"attrs\": {\"max_length\": 300}}, \"submitter\": {\"type\": \"django.db.models.ForeignKey\", \"related_model\": \"auth.User\"}, \"time_added\": {\"type\": \"django.db.models.DateTimeField\"}, \"last_updated\": {\"type\": \"djblets.db.fields.modification_timestamp_field.ModificationTimestampField\"}, \"status\": {\"type\": \"django.db.models.CharField\", \"attrs\": {\"max_length\": 1, \"db_index\": true}}, \"public\": {\"type\": \"django.db.models.BooleanField\"}, \"changenum\": {\"type\": \"django.db.models.PositiveIntegerField\", \"attrs\": {\"null\": true, \"db_index\": true}}, \"repository\": {\"type\": \"django.db.models.ForeignKey\", \"attrs\": {\"null\": true}, \"related_model\": \"scmtools.Repository\"}, \"email_message_id\": {\"type\": \"django.db.models.CharField\", \"attrs\": {\"max_length\": 255, \"null\": true}}, \"time_emailed\": {\"type\": \"django.db.models.DateTimeField\", \"attrs\": {\"null\": true}}, \"diffset_history\": {\"type\": \"django.db.models.ForeignKey\", \"related_model\": \"diffviewer.DiffSetHistory\"}, \"last_review_activity_timestamp\": {\"type\": \"django.db.models.DateTimeField\", \"attrs\": {\"null\": true, \"db_column\": \"last_review_timestamp\"}}, \"shipit_count\": {\"type\": \"djblets.db.fields.counter_field.CounterField\", \"attrs\": {\"null\": true}}, \"issue_open_count\": {\"type\": \"djblets.db.fields.counter_field.CounterField\", \"attrs\": {\"null\": true}}, \"issue_resolved_count\": {\"type\": \"djblets.db.fields.counter_field.CounterField\", \"attrs\": {\"null\": true}}, \"issue_dropped_count\": {\"type\": \"djblets.db.fields.counter_field.CounterField\", \"attrs\": {\"null\": true}}, \"issue_verifying_count\": {\"type\": \"djblets.db.fields.counter_field.CounterField\", \"attrs\": {\"null\": true}}, \"screenshots_count\": {\"type\": \"djblets.db.fields.relation_counter_field.RelationCounterField\", \"attrs\": {\"null\": true}}, \"inactive_screenshots_count\": {\"type\": \"djblets.db.fields.relation_counter_field.RelationCounterField\", \"attrs\": {\"null\": true}}, \"file_attachments_count\": {\"type\": \"djblets.db.fields.relation_counter_field.RelationCounterField\", \"attrs\": {\"null\": true}}, \"inactive_file_attachments_count\": {\"type\": \"djblets.db.fields.relation_counter_field.RelationCounterField\", \"attrs\": {\"null\": true}}, \"local_site\": {\"type\": \"django.db.models.ForeignKey\", \"attrs\": {\"null\": true}, \"related_model\": \"site.LocalSite\"}, \"local_id\": {\"type\": \"django.db.models.IntegerField\", \"attrs\": {\"null\": true}}, \"target_groups\": {\"type\": \"django.db.models.ManyToManyField\", \"related_model\": \"reviews.Group\"}, \"target_people\": {\"type\": \"django.db.models.ManyToManyField\", \"related_model\": \"auth.User\"}, \"screenshots\": {\"type\": \"django.db.models.ManyToManyField\", \"related_model\": \"reviews.Screenshot\"}, \"inactive_screenshots\": {\"type\": \"django.db.models.ManyToManyField\", \"related_model\": \"reviews.Screenshot\"}, \"file_attachments\": {\"type\": \"django.db.models.ManyToManyField\", \"related_model\": \"attachments.FileAttachment\"}, \"inactive_file_attachments\": {\"type\": \"django.db.models.ManyToManyField\", \"related_model\": \"attachments.FileAttachment\"}, \"file_attachment_histories\": {\"type\": \"django.db.models.ManyToManyField\", \"related_model\": \"attachments.FileAttachmentHistory\"}, \"changedescs\": {\"type\": \"django.db.models.ManyToManyField\", \"related_model\": \"changedescs.ChangeDescription\"}, \"depends_on\": {\"type\": \"django.db.models.ManyToManyField\", \"related_model\": \"reviews.ReviewRequest\"}}, \"meta\": {\"pk_column\": \"id\", \"db_table\": \"reviews_reviewrequest\", \"indexes\": [], \"db_tablespace\": \"\", \"unique_together\": [[\"commit_id\", \"repository\"], [\"changenum\", \"repository\"], [\"local_site\", \"local_id\"]], \"__unique_together_applied\": true, \"index_together\": [], \"constraints\": []}}, \"ScreenshotComment\": {\"fields\": {\"id\": {\"type\": \"django.db.models.AutoField\", \"attrs\": {\"primary_key\": true}}, \"issue_opened\": {\"type\": \"django.db.models.BooleanField\"}, \"issue_status\": {\"type\": \"django.db.models.CharField\", \"attrs\": {\"max_length\": 1, \"null\": true, \"db_index\": true}}, \"reply_to\": {\"type\": \"django.db.models.ForeignKey\", \"attrs\": {\"null\": true}, \"related_model\": \"reviews.ScreenshotComment\"}, \"timestamp\": {\"type\": \"django.db.models.DateTimeField\"}, \"text\": {\"type\": \"django.db.models.TextField\"}, \"rich_text\": {\"type\": \"django.db.models.BooleanField\"}, \"extra_data\": {\"type\": \"djblets.db.fields.json_field.JSONField\", \"attrs\": {\"null\": true}}, \"screenshot\": {\"type\": \"django.db.models.ForeignKey\", \"related_model\": \"reviews.Screenshot\"}, \"x\": {\"type\": \"django.db.models.PositiveSmallIntegerField\", \"attrs\": {\"null\": true}}, \"y\": {\"type\": \"django.db.models.PositiveSmallIntegerField\"}, \"w\": {\"type\": \"django.db.models.PositiveSmallIntegerField\"}, \"h\": {\"type\": \"django.db.models.PositiveSmallIntegerField\"}}, \"meta\": {\"pk_column\": \"id\", \"db_table\": \"reviews_screenshotcomment\", \"indexes\": [], \"db_tablespace\": \"\", \"unique_together\": [], \"__unique_together_applied\": true, \"index_together\": [], \"constraints\": []}}, \"Review\": {\"fields\": {\"id\": {\"type\": \"django.db.models.AutoField\", \"attrs\": {\"primary_key\": true}}, \"review_request\": {\"type\": \"django.db.models.ForeignKey\", \"related_model\": \"reviews.ReviewRequest\"}, \"user\": {\"type\": \"django.db.models.ForeignKey\", \"related_model\": \"auth.User\"}, \"timestamp\": {\"type\": \"django.db.models.DateTimeField\"}, \"public\": {\"type\": \"django.db.models.BooleanField\"}, \"ship_it\": {\"type\": \"django.db.models.BooleanField\"}, \"base_reply_to\": {\"type\": \"django.db.models.ForeignKey\", \"attrs\": {\"null\": true}, \"related_model\": \"reviews.Review\"}, \"email_message_id\": {\"type\": \"django.db.models.CharField\", \"attrs\": {\"max_length\": 255, \"null\": true}}, \"time_emailed\": {\"type\": \"django.db.models.DateTimeField\", \"attrs\": {\"null\": true}}, \"body_top\": {\"type\": \"django.db.models.TextField\"}, \"body_top_rich_text\": {\"type\": \"django.db.models.BooleanField\"}, \"body_bottom\": {\"type\": \"django.db.models.TextField\"}, \"body_bottom_rich_text\": {\"type\": \"django.db.models.BooleanField\"}, \"body_top_reply_to\": {\"type\": \"django.db.models.ForeignKey\", \"attrs\": {\"null\": true}, \"related_model\": \"reviews.Review\"}, \"body_bottom_reply_to\": {\"type\": \"django.db.models.ForeignKey\", \"attrs\": {\"null\": true}, \"related_model\": \"reviews.Review\"}, \"extra_data\": {\"type\": \"djblets.db.fields.json_field.JSONField\", \"attrs\": {\"null\": true}}, \"rich_text\": {\"type\": \"django.db.models.BooleanField\"}, \"reviewed_diffset\": {\"type\": \"django.db.models.ForeignKey\", \"attrs\": {\"null\": true}, \"related_model\": \"diffviewer.DiffSet\"}, \"comments\": {\"type\": \"django.db.models.ManyToManyField\", \"related_model\": \"reviews.Comment\"}, \"screenshot_comments\": {\"type\": \"django.db.models.ManyToManyField\", \"related_model\": \"reviews.ScreenshotComment\"}, \"file_attachment_comments\": {\"type\": \"django.db.models.ManyToManyField\", \"related_model\": \"reviews.FileAttachmentComment\"}, \"general_comments\": {\"type\": \"django.db.models.ManyToManyField\", \"related_model\": \"reviews.GeneralComment\"}}, \"meta\": {\"pk_column\": \"id\", \"db_table\": \"reviews_review\", \"indexes\": [], \"db_tablespace\": \"\", \"unique_together\": [], \"__unique_together_applied\": true, \"index_together\": [], \"constraints\": []}}, \"ReviewRequestDraft\": {\"fields\": {\"id\": {\"type\": \"django.db.models.AutoField\", \"attrs\": {\"primary_key\": true}}, \"description\": {\"type\": \"django.db.models.TextField\"}, \"description_rich_text\": {\"type\": \"django.db.models.BooleanField\"}, \"testing_done\": {\"type\": \"django.db.models.TextField\"}, \"testing_done_rich_text\": {\"type\": \"django.db.models.BooleanField\"}, \"bugs_closed\": {\"type\": \"django.db.models.CharField\", \"attrs\": {\"max_length\": 300}}, \"branch\": {\"type\": \"django.db.models.CharField\", \"attrs\": {\"max_length\": 300}}, \"commit_id\": {\"type\": \"django.db.models.CharField\", \"attrs\": {\"max_length\": 64, \"null\": true, \"db_index\": true}}, \"extra_data\": {\"type\": \"djblets.db.fields.json_field.JSONField\", \"attrs\": {\"null\": true}}, \"rich_text\": {\"type\": \"django.db.models.BooleanField\"}, \"summary\": {\"type\": \"django.db.models.CharField\", \"attrs\": {\"max_length\": 300}}, \"owner\": {\"type\": \"django.db.models.ForeignKey\", \"attrs\": {\"null\": true}, \"related_model\": \"auth.User\"}, \"review_request\": {\"type\": \"django.db.models.ForeignKey\", \"attrs\": {\"unique\": true}, \"related_model\": \"reviews.ReviewRequest\"}, \"last_updated\": {\"type\": \"djblets.db.fields.modification_timestamp_field.ModificationTimestampField\"}, \"diffset\": {\"type\": \"django.db.models.ForeignKey\", \"attrs\": {\"null\": true}, \"related_model\": \"diffviewer.DiffSet\"}, \"changedesc\": {\"type\": \"django.db.models.ForeignKey\", \"attrs\": {\"null\": true}, \"related_model\": \"changedescs.ChangeDescription\"}, \"screenshots_count\": {\"type\": \"djblets.db.fields.relation_counter_field.RelationCounterField\", \"attrs\": {\"null\": true}}, \"inactive_screenshots_count\": {\"type\": \"djblets.db.fields.relation_counter_field.RelationCounterField\", \"attrs\": {\"null\": true}}, \"file_attachments_count\": {\"type\": \"djblets.db.fields.relation_counter_field.RelationCounterField\", \"attrs\": {\"null\": true}}, \"inactive_file_attachments_count\": {\"type\": \"djblets.db.fields.relation_counter_field.RelationCounterField\", \"attrs\": {\"null\": true}}, \"target_groups\": {\"type\": \"django.db.models.ManyToManyField\", \"related_model\": \"reviews.Group\"}, \"target_people\": {\"type\": \"django.db.models.ManyToManyField\", \"related_model\": \"auth.User\"}, \"screenshots\": {\"type\": \"django.db.models.ManyToManyField\", \"related_model\": \"reviews.Screenshot\"}, \"inactive_screenshots\": {\"type\": \"django.db.models.ManyToManyField\", \"related_model\": \"reviews.Screenshot\"}, \"file_attachments\": {\"type\": \"django.db.models.ManyToManyField\", \"related_model\": \"attachments.FileAttachment\"}, \"inactive_file_attachments\": {\"type\": \"django.db.models.ManyToManyField\", \"related_model\": \"attachments.FileAttachment\"}, \"depends_on\": {\"type\": \"django.db.models.ManyToManyField\", \"related_model\": \"reviews.ReviewRequest\"}}, \"meta\": {\"pk_column\": \"id\", \"db_table\": \"reviews_reviewrequestdraft\", \"indexes\": [], \"db_tablespace\": \"\", \"unique_together\": [], \"__unique_together_applied\": true, \"index_together\": [], \"constraints\": []}}, \"StatusUpdate\": {\"fields\": {\"id\": {\"type\": \"django.db.models.AutoField\", \"attrs\": {\"primary_key\": true}}, \"service_id\": {\"type\": \"django.db.models.CharField\", \"attrs\": {\"max_length\": 255}}, \"user\": {\"type\": \"django.db.models.ForeignKey\", \"attrs\": {\"null\": true}, \"related_model\": \"auth.User\"}, \"timestamp\": {\"type\": \"django.db.models.DateTimeField\"}, \"summary\": {\"type\": \"django.db.models.CharField\", \"attrs\": {\"max_length\": 255}}, \"description\": {\"type\": \"django.db.models.CharField\", \"attrs\": {\"max_length\": 255}}, \"url\": {\"type\": \"django.db.models.URLField\", \"attrs\": {\"max_length\": 255}}, \"url_text\": {\"type\": \"django.db.models.CharField\", \"attrs\": {\"max_length\": 64}}, \"state\": {\"type\": \"django.db.models.CharField\", \"attrs\": {\"max_length\": 1}}, \"review_request\": {\"type\": \"django.db.models.ForeignKey\", \"related_model\": \"reviews.ReviewRequest\"}, \"change_description\": {\"type\": \"django.db.models.ForeignKey\", \"attrs\": {\"null\": true}, \"related_model\": \"changedescs.ChangeDescription\"}, \"review\": {\"type\": \"django.db.models.OneToOneField\", \"attrs\": {\"unique\": true, \"null\": true}, \"related_model\": \"reviews.Review\"}, \"extra_data\": {\"type\": \"djblets.db.fields.json_field.JSONField\", \"attrs\": {\"null\": true}}, \"timeout\": {\"type\": \"django.db.models.IntegerField\", \"attrs\": {\"null\": true}}}, \"meta\": {\"pk_column\": \"id\", \"db_table\": \"reviews_statusupdate\", \"indexes\": [], \"db_tablespace\": \"\", \"unique_together\": [], \"__unique_together_applied\": true, \"index_together\": [], \"constraints\": []}}}}, \"scmtools\": {\"legacy_app_label\": \"scmtools\", \"upgrade_method\": \"evolutions\", \"models\": {\"Tool\": {\"fields\": {\"id\": {\"type\": \"django.db.models.AutoField\", \"attrs\": {\"primary_key\": true}}, \"name\": {\"type\": \"django.db.models.CharField\", \"attrs\": {\"max_length\": 32, \"unique\": true}}, \"class_name\": {\"type\": \"django.db.models.CharField\", \"attrs\": {\"max_length\": 128, \"unique\": true}}}, \"meta\": {\"pk_column\": \"id\", \"db_table\": \"scmtools_tool\", \"indexes\": [], \"db_tablespace\": \"\", \"unique_together\": [], \"__unique_together_applied\": true, \"index_together\": [], \"constraints\": []}}, \"Repository\": {\"fields\": {\"id\": {\"type\": \"django.db.models.AutoField\", \"attrs\": {\"primary_key\": true}}, \"name\": {\"type\": \"django.db.models.CharField\", \"attrs\": {\"max_length\": 255}}, \"path\": {\"type\": \"django.db.models.CharField\", \"attrs\": {\"max_length\": 255}}, \"mirror_path\": {\"type\": \"django.db.models.CharField\", \"attrs\": {\"max_length\": 255}}, \"raw_file_url\": {\"type\": \"django.db.models.CharField\", \"attrs\": {\"max_length\": 255}}, \"username\": {\"type\": \"django.db.models.CharField\", \"attrs\": {\"max_length\": 32}}, \"encrypted_password\": {\"type\": \"django.db.models.CharField\", \"attrs\": {\"max_length\": 128, \"db_column\": \"password\"}}, \"extra_data\": {\"type\": \"djblets.db.fields.json_field.JSONField\", \"attrs\": {\"null\": true}}, \"tool\": {\"type\": \"django.db.models.ForeignKey\", \"related_model\": \"scmtools.Tool\"}, \"hosting_account\": {\"type\": \"django.db.models.ForeignKey\", \"attrs\": {\"null\": true}, \"related_model\": \"hostingsvcs.HostingServiceAccount\"}, \"bug_tracker\": {\"type\": \"django.db.models.CharField\", \"attrs\": {\"max_length\": 256}}, \"encoding\": {\"type\": \"django.db.models.CharField\", \"attrs\": {\"max_length\": 32}}, \"visible\": {\"type\": \"django.db.models.BooleanField\"}, \"archived\": {\"type\": \"django.db.models.BooleanField\"}, \"archived_timestamp\": {\"type\": \"django.db.models.DateTimeField\", \"attrs\": {\"null\": true}}, \"local_site\": {\"type\": \"django.db.models.ForeignKey\", \"attrs\": {\"null\": true}, \"related_model\": \"site.LocalSite\"}, \"public\": {\"type\": \"django.db.models.BooleanField\"}, \"hooks_uuid\": {\"type\": \"django.db.models.CharField\", \"attrs\": {\"max_length\": 32, \"null\": true}}, \"users\": {\"type\": \"django.db.models.ManyToManyField\", \"related_model\": \"auth.User\"}, \"review_groups\": {\"type\": \"django.db.models.ManyToManyField\", \"related_model\": \"reviews.Group\"}}, \"meta\": {\"pk_column\": \"id\", \"db_table\": \"scmtools_repository\", \"indexes\": [], \"db_tablespace\": \"\", \"unique_together\": [[\"name\", \"local_site\"], [\"archived_timestamp\", \"path\", \"local_site\"], [\"hooks_uuid\", \"local_site\"]], \"__unique_together_applied\": true, \"index_together\": [], \"constraints\": []}}}}, \"site\": {\"legacy_app_label\": \"site\", \"upgrade_method\": \"evolutions\", \"models\": {\"LocalSite\": {\"fields\": {\"id\": {\"type\": \"django.db.models.AutoField\", \"attrs\": {\"primary_key\": true}}, \"name\": {\"type\": \"django.db.models.SlugField\", \"attrs\": {\"max_length\": 32, \"unique\": true, \"db_index\": true}}, \"public\": {\"type\": \"django.db.models.BooleanField\"}, \"extra_data\": {\"type\": \"djblets.db.fields.json_field.JSONField\", \"attrs\": {\"null\": true}}, \"users\": {\"type\": \"django.db.models.ManyToManyField\", \"related_model\": \"auth.User\"}, \"admins\": {\"type\": \"django.db.models.ManyToManyField\", \"related_model\": \"auth.User\"}}, \"meta\": {\"pk_column\": \"id\", \"db_table\": \"site_localsite\", \"indexes\": [], \"db_tablespace\": \"\", \"unique_together\": [], \"__unique_together_applied\": true, \"index_together\": [], \"constraints\": []}}}}, \"webapi\": {\"legacy_app_label\": \"webapi\", \"upgrade_method\": \"evolutions\", \"models\": {\"WebAPIToken\": {\"fields\": {\"id\": {\"type\": \"django.db.models.AutoField\", \"attrs\": {\"primary_key\": true}}, \"user\": {\"type\": \"django.db.models.ForeignKey\", \"related_model\": \"auth.User\"}, \"token\": {\"type\": \"django.db.models.CharField\", \"attrs\": {\"max_length\": 40, \"unique\": true}}, \"time_added\": {\"type\": \"django.db.models.DateTimeField\"}, \"last_updated\": {\"type\": \"django.db.models.DateTimeField\"}, \"note\": {\"type\": \"django.db.models.TextField\"}, \"policy\": {\"type\": \"djblets.db.fields.json_field.JSONField\", \"attrs\": {\"null\": true}}, \"extra_data\": {\"type\": \"djblets.db.fields.json_field.JSONField\", \"attrs\": {\"null\": true}}, \"local_site\": {\"type\": \"django.db.models.ForeignKey\", \"attrs\": {\"null\": true}, \"related_model\": \"site.LocalSite\"}}, \"meta\": {\"pk_column\": \"id\", \"db_table\": \"webapi_webapitoken\", \"indexes\": [], \"db_tablespace\": \"\", \"unique_together\": [], \"__unique_together_applied\": true, \"index_together\": [], \"constraints\": []}}}}}}','2022-05-16 00:32:20.039628');
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
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_site_domain_a2e37b91_uniq` (`domain`)
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
  `time_added` datetime(6) NOT NULL,
  `last_updated` datetime(6) NOT NULL,
  `consent_grants` longtext NOT NULL,
  `audit_trail` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `djblets_privacy_storedconsentdata_audit_identifier_eeb12ed0` (`audit_identifier`),
  CONSTRAINT `djblets_privacy_stor_user_id_e703bd23_fk_auth_user` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
  KEY `hostingsvcs_hostings_local_site_id_6688df40_fk_site_loca` (`local_site_id`),
  CONSTRAINT `hostingsvcs_hostings_local_site_id_6688df40_fk_site_loca` FOREIGN KEY (`local_site_id`) REFERENCES `site_localsite` (`id`)
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
  `time_added` datetime(6) NOT NULL,
  `last_updated` datetime(6) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  `settings` longtext NOT NULL,
  `extra_data` longtext NOT NULL,
  `local_site_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `integrations_integra_local_site_id_d6913121_fk_site_loca` (`local_site_id`),
  KEY `integrations_integrationconfig_integration_id_c90e0bae` (`integration_id`),
  KEY `integrations_integrationconfig_enabled_b7f7e2fc` (`enabled`),
  CONSTRAINT `integrations_integra_local_site_id_d6913121_fk_site_loca` FOREIGN KEY (`local_site_id`) REFERENCES `site_localsite` (`id`)
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
  KEY `notifications_webhoo_local_site_id_1ec00cea_fk_site_loca` (`local_site_id`),
  CONSTRAINT `notifications_webhoo_local_site_id_1ec00cea_fk_site_loca` FOREIGN KEY (`local_site_id`) REFERENCES `site_localsite` (`id`)
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
  UNIQUE KEY `notifications_webhooktar_webhooktarget_id_reposit_e4f9af06_uniq` (`webhooktarget_id`,`repository_id`),
  KEY `notifications_webhoo_repository_id_703af70a_fk_scmtools_` (`repository_id`),
  CONSTRAINT `notifications_webhoo_repository_id_703af70a_fk_scmtools_` FOREIGN KEY (`repository_id`) REFERENCES `scmtools_repository` (`id`),
  CONSTRAINT `notifications_webhoo_webhooktarget_id_1f60c953_fk_notificat` FOREIGN KEY (`webhooktarget_id`) REFERENCES `notifications_webhooktarget` (`id`)
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
  `token` varchar(255) NOT NULL,
  `expires` datetime(6) NOT NULL,
  `scope` longtext NOT NULL,
  `application_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth2_provider_acce_application_id_b22886e1_fk_reviewboa` (`application_id`),
  KEY `oauth2_provider_accesstoken_token_8af090f8` (`token`),
  KEY `oauth2_provider_accesstoken_user_id_6e4c9a65_fk_auth_user_id` (`user_id`),
  CONSTRAINT `oauth2_provider_acce_application_id_b22886e1_fk_reviewboa` FOREIGN KEY (`application_id`) REFERENCES `reviewboard_oauth_application` (`id`),
  CONSTRAINT `oauth2_provider_accesstoken_user_id_6e4c9a65_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
  `redirect_uris` longtext NOT NULL,
  `client_type` varchar(32) NOT NULL,
  `authorization_grant_type` varchar(32) NOT NULL,
  `client_secret` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `skip_authorization` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `client_id` (`client_id`),
  KEY `oauth2_provider_application_client_secret_53133678` (`client_secret`),
  KEY `oauth2_provider_application_user_id_79829054_fk_auth_user_id` (`user_id`),
  CONSTRAINT `oauth2_provider_application_user_id_79829054_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
  `code` varchar(255) NOT NULL,
  `expires` datetime(6) NOT NULL,
  `redirect_uri` varchar(255) NOT NULL,
  `scope` longtext NOT NULL,
  `application_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth2_provider_gran_application_id_81923564_fk_reviewboa` (`application_id`),
  KEY `oauth2_provider_grant_user_id_e8f62af8_fk_auth_user_id` (`user_id`),
  KEY `oauth2_provider_grant_code_49ab4ddf` (`code`),
  CONSTRAINT `oauth2_provider_gran_application_id_81923564_fk_reviewboa` FOREIGN KEY (`application_id`) REFERENCES `reviewboard_oauth_application` (`id`),
  CONSTRAINT `oauth2_provider_grant_user_id_e8f62af8_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
  `token` varchar(255) NOT NULL,
  `access_token_id` int(11) NOT NULL,
  `application_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `access_token_id` (`access_token_id`),
  KEY `oauth2_provider_refr_application_id_2d1c311b_fk_reviewboa` (`application_id`),
  KEY `oauth2_provider_refreshtoken_user_id_da837fce_fk_auth_user_id` (`user_id`),
  KEY `oauth2_provider_refreshtoken_token_d090daa4` (`token`),
  CONSTRAINT `oauth2_provider_refr_access_token_id_775e84e8_fk_oauth2_pr` FOREIGN KEY (`access_token_id`) REFERENCES `oauth2_provider_accesstoken` (`id`),
  CONSTRAINT `oauth2_provider_refr_application_id_2d1c311b_fk_reviewboa` FOREIGN KEY (`application_id`) REFERENCES `reviewboard_oauth_application` (`id`),
  CONSTRAINT `oauth2_provider_refreshtoken_user_id_da837fce_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
  KEY `reviewboard_oauth_application_user_id_5306421b_fk_auth_user_id` (`user_id`),
  KEY `reviewboard_oauth_ap_original_user_id_7df83187_fk_auth_user` (`original_user_id`),
  KEY `reviewboard_oauth_ap_local_site_id_412bed6e_fk_site_loca` (`local_site_id`),
  KEY `reviewboard_oauth_application_client_secret_4de4461a` (`client_secret`),
  CONSTRAINT `reviewboard_oauth_ap_local_site_id_412bed6e_fk_site_loca` FOREIGN KEY (`local_site_id`) REFERENCES `site_localsite` (`id`),
  CONSTRAINT `reviewboard_oauth_ap_original_user_id_7df83187_fk_auth_user` FOREIGN KEY (`original_user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `reviewboard_oauth_application_user_id_5306421b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
  `timestamp` datetime(6) NOT NULL,
  `text` longtext NOT NULL,
  `rich_text` tinyint(1) NOT NULL,
  `extra_data` longtext,
  `filediff_id` int(11) NOT NULL,
  `interfilediff_id` int(11) DEFAULT NULL,
  `first_line` int(10) unsigned DEFAULT NULL,
  `num_lines` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reviews_comment_reply_to_id_a7b3749b_fk_reviews_comment_id` (`reply_to_id`),
  KEY `reviews_comment_filediff_id_95cdd174_fk_diffviewer_filediff_id` (`filediff_id`),
  KEY `reviews_comment_interfilediff_id_fb77b53c_fk_diffviewe` (`interfilediff_id`),
  KEY `reviews_comment_issue_status_af21c71b` (`issue_status`),
  CONSTRAINT `reviews_comment_filediff_id_95cdd174_fk_diffviewer_filediff_id` FOREIGN KEY (`filediff_id`) REFERENCES `diffviewer_filediff` (`id`),
  CONSTRAINT `reviews_comment_interfilediff_id_fb77b53c_fk_diffviewe` FOREIGN KEY (`interfilediff_id`) REFERENCES `diffviewer_filediff` (`id`),
  CONSTRAINT `reviews_comment_reply_to_id_a7b3749b_fk_reviews_comment_id` FOREIGN KEY (`reply_to_id`) REFERENCES `reviews_comment` (`id`)
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
  KEY `reviews_defaultrevie_local_site_id_bcfc837d_fk_site_loca` (`local_site_id`),
  CONSTRAINT `reviews_defaultrevie_local_site_id_bcfc837d_fk_site_loca` FOREIGN KEY (`local_site_id`) REFERENCES `site_localsite` (`id`)
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
  UNIQUE KEY `reviews_defaultreviewer__defaultreviewer_id_group_f85e51ee_uniq` (`defaultreviewer_id`,`group_id`),
  KEY `reviews_defaultrevie_group_id_8f130dec_fk_reviews_g` (`group_id`),
  CONSTRAINT `reviews_defaultrevie_defaultreviewer_id_e89ca162_fk_reviews_d` FOREIGN KEY (`defaultreviewer_id`) REFERENCES `reviews_defaultreviewer` (`id`),
  CONSTRAINT `reviews_defaultrevie_group_id_8f130dec_fk_reviews_g` FOREIGN KEY (`group_id`) REFERENCES `reviews_group` (`id`)
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
  UNIQUE KEY `reviews_defaultreviewer__defaultreviewer_id_user__f22a3474_uniq` (`defaultreviewer_id`,`user_id`),
  KEY `reviews_defaultreviewer_people_user_id_0871feb0_fk_auth_user_id` (`user_id`),
  CONSTRAINT `reviews_defaultrevie_defaultreviewer_id_3b5a7031_fk_reviews_d` FOREIGN KEY (`defaultreviewer_id`) REFERENCES `reviews_defaultreviewer` (`id`),
  CONSTRAINT `reviews_defaultreviewer_people_user_id_0871feb0_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
  UNIQUE KEY `reviews_defaultreviewer__defaultreviewer_id_repos_532b4c10_uniq` (`defaultreviewer_id`,`repository_id`),
  KEY `reviews_defaultrevie_repository_id_7f3f56b6_fk_scmtools_` (`repository_id`),
  CONSTRAINT `reviews_defaultrevie_defaultreviewer_id_6876ab14_fk_reviews_d` FOREIGN KEY (`defaultreviewer_id`) REFERENCES `reviews_defaultreviewer` (`id`),
  CONSTRAINT `reviews_defaultrevie_repository_id_7f3f56b6_fk_scmtools_` FOREIGN KEY (`repository_id`) REFERENCES `scmtools_repository` (`id`)
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
  `timestamp` datetime(6) NOT NULL,
  `text` longtext NOT NULL,
  `rich_text` tinyint(1) NOT NULL,
  `extra_data` longtext,
  `file_attachment_id` int(11) NOT NULL,
  `diff_against_file_attachment_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reviews_fileattachme_reply_to_id_17c9efca_fk_reviews_f` (`reply_to_id`),
  KEY `reviews_fileattachme_file_attachment_id_8db79ee7_fk_attachmen` (`file_attachment_id`),
  KEY `reviews_fileattachme_diff_against_file_at_8a13f559_fk_attachmen` (`diff_against_file_attachment_id`),
  KEY `reviews_fileattachmentcomment_issue_status_775b5a50` (`issue_status`),
  CONSTRAINT `reviews_fileattachme_diff_against_file_at_8a13f559_fk_attachmen` FOREIGN KEY (`diff_against_file_attachment_id`) REFERENCES `attachments_fileattachment` (`id`),
  CONSTRAINT `reviews_fileattachme_file_attachment_id_8db79ee7_fk_attachmen` FOREIGN KEY (`file_attachment_id`) REFERENCES `attachments_fileattachment` (`id`),
  CONSTRAINT `reviews_fileattachme_reply_to_id_17c9efca_fk_reviews_f` FOREIGN KEY (`reply_to_id`) REFERENCES `reviews_fileattachmentcomment` (`id`)
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
  `timestamp` datetime(6) NOT NULL,
  `text` longtext NOT NULL,
  `rich_text` tinyint(1) NOT NULL,
  `extra_data` longtext,
  PRIMARY KEY (`id`),
  KEY `reviews_generalcomme_reply_to_id_d0a69bbf_fk_reviews_g` (`reply_to_id`),
  KEY `reviews_generalcomment_issue_status_4b49c612` (`issue_status`),
  CONSTRAINT `reviews_generalcomme_reply_to_id_d0a69bbf_fk_reviews_g` FOREIGN KEY (`reply_to_id`) REFERENCES `reviews_generalcomment` (`id`)
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
  UNIQUE KEY `reviews_group_name_local_site_id_cd520124_uniq` (`name`,`local_site_id`),
  KEY `reviews_group_local_site_id_b7e35237_fk_site_localsite_id` (`local_site_id`),
  KEY `reviews_group_name_c92d67b9` (`name`),
  CONSTRAINT `reviews_group_local_site_id_b7e35237_fk_site_localsite_id` FOREIGN KEY (`local_site_id`) REFERENCES `site_localsite` (`id`)
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
  UNIQUE KEY `reviews_group_users_group_id_user_id_1710047c_uniq` (`group_id`,`user_id`),
  KEY `reviews_group_users_user_id_5403120e_fk_auth_user_id` (`user_id`),
  CONSTRAINT `reviews_group_users_group_id_3bb40386_fk_reviews_group_id` FOREIGN KEY (`group_id`) REFERENCES `reviews_group` (`id`),
  CONSTRAINT `reviews_group_users_user_id_5403120e_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
  `timestamp` datetime(6) NOT NULL,
  `public` tinyint(1) NOT NULL,
  `ship_it` tinyint(1) NOT NULL,
  `base_reply_to_id` int(11) DEFAULT NULL,
  `email_message_id` varchar(255) DEFAULT NULL,
  `time_emailed` datetime(6) DEFAULT NULL,
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
  KEY `reviews_review_review_request_id_be762bb2_fk_reviews_r` (`review_request_id`),
  KEY `reviews_review_user_id_875caff2_fk_auth_user_id` (`user_id`),
  KEY `reviews_review_base_reply_to_id_a208ad8a_fk_reviews_review_id` (`base_reply_to_id`),
  KEY `reviews_review_body_top_reply_to_id_4f3807c0_fk_reviews_r` (`body_top_reply_to_id`),
  KEY `reviews_review_body_bottom_reply_to_a0c60294_fk_reviews_r` (`body_bottom_reply_to_id`),
  KEY `reviews_review_reviewed_diffset_id_4b8bdf06_fk_diffviewe` (`reviewed_diffset_id`),
  CONSTRAINT `reviews_review_base_reply_to_id_a208ad8a_fk_reviews_review_id` FOREIGN KEY (`base_reply_to_id`) REFERENCES `reviews_review` (`id`),
  CONSTRAINT `reviews_review_body_bottom_reply_to_a0c60294_fk_reviews_r` FOREIGN KEY (`body_bottom_reply_to_id`) REFERENCES `reviews_review` (`id`),
  CONSTRAINT `reviews_review_body_top_reply_to_id_4f3807c0_fk_reviews_r` FOREIGN KEY (`body_top_reply_to_id`) REFERENCES `reviews_review` (`id`),
  CONSTRAINT `reviews_review_review_request_id_be762bb2_fk_reviews_r` FOREIGN KEY (`review_request_id`) REFERENCES `reviews_reviewrequest` (`id`),
  CONSTRAINT `reviews_review_reviewed_diffset_id_4b8bdf06_fk_diffviewe` FOREIGN KEY (`reviewed_diffset_id`) REFERENCES `diffviewer_diffset` (`id`),
  CONSTRAINT `reviews_review_user_id_875caff2_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
  UNIQUE KEY `reviews_review_comments_review_id_comment_id_2b6b67b0_uniq` (`review_id`,`comment_id`),
  KEY `reviews_review_comme_comment_id_a1f2afdb_fk_reviews_c` (`comment_id`),
  CONSTRAINT `reviews_review_comme_comment_id_a1f2afdb_fk_reviews_c` FOREIGN KEY (`comment_id`) REFERENCES `reviews_comment` (`id`),
  CONSTRAINT `reviews_review_comments_review_id_0a600993_fk_reviews_review_id` FOREIGN KEY (`review_id`) REFERENCES `reviews_review` (`id`)
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
  UNIQUE KEY `reviews_review_file_atta_review_id_fileattachment_e50f6c80_uniq` (`review_id`,`fileattachmentcomment_id`),
  KEY `reviews_review_file__fileattachmentcommen_1dae596b_fk_reviews_f` (`fileattachmentcomment_id`),
  CONSTRAINT `reviews_review_file__fileattachmentcommen_1dae596b_fk_reviews_f` FOREIGN KEY (`fileattachmentcomment_id`) REFERENCES `reviews_fileattachmentcomment` (`id`),
  CONSTRAINT `reviews_review_file__review_id_f33dcceb_fk_reviews_r` FOREIGN KEY (`review_id`) REFERENCES `reviews_review` (`id`)
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
  UNIQUE KEY `reviews_review_general_c_review_id_generalcomment_92ad2601_uniq` (`review_id`,`generalcomment_id`),
  KEY `reviews_review_gener_generalcomment_id_08380dc1_fk_reviews_g` (`generalcomment_id`),
  CONSTRAINT `reviews_review_gener_generalcomment_id_08380dc1_fk_reviews_g` FOREIGN KEY (`generalcomment_id`) REFERENCES `reviews_generalcomment` (`id`),
  CONSTRAINT `reviews_review_gener_review_id_b2db3c78_fk_reviews_r` FOREIGN KEY (`review_id`) REFERENCES `reviews_review` (`id`)
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
  UNIQUE KEY `reviews_review_screensho_review_id_screenshotcomm_d40817af_uniq` (`review_id`,`screenshotcomment_id`),
  KEY `reviews_review_scree_screenshotcomment_id_c90580b3_fk_reviews_s` (`screenshotcomment_id`),
  CONSTRAINT `reviews_review_scree_review_id_1210ef03_fk_reviews_r` FOREIGN KEY (`review_id`) REFERENCES `reviews_review` (`id`),
  CONSTRAINT `reviews_review_scree_screenshotcomment_id_c90580b3_fk_reviews_s` FOREIGN KEY (`screenshotcomment_id`) REFERENCES `reviews_screenshotcomment` (`id`)
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
  `time_added` datetime(6) NOT NULL,
  `last_updated` datetime(6) NOT NULL,
  `status` varchar(1) NOT NULL,
  `public` tinyint(1) NOT NULL,
  `changenum` int(10) unsigned DEFAULT NULL,
  `repository_id` int(11) DEFAULT NULL,
  `email_message_id` varchar(255) DEFAULT NULL,
  `time_emailed` datetime(6) DEFAULT NULL,
  `diffset_history_id` int(11) NOT NULL,
  `last_review_timestamp` datetime(6) DEFAULT NULL,
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
  UNIQUE KEY `reviews_reviewrequest_commit_id_repository_id_8d48574b_uniq` (`commit_id`,`repository_id`),
  UNIQUE KEY `reviews_reviewrequest_changenum_repository_id_4aa9bc58_uniq` (`changenum`,`repository_id`),
  UNIQUE KEY `reviews_reviewrequest_local_site_id_local_id_8ee6145b_uniq` (`local_site_id`,`local_id`),
  KEY `reviews_reviewrequest_submitter_id_0a5fadde_fk_auth_user_id` (`submitter_id`),
  KEY `reviews_reviewreques_repository_id_a411142d_fk_scmtools_` (`repository_id`),
  KEY `reviews_reviewreques_diffset_history_id_803728bf_fk_diffviewe` (`diffset_history_id`),
  KEY `reviews_reviewrequest_commit_id_e7104524` (`commit_id`),
  KEY `reviews_reviewrequest_status_63d3e3fd` (`status`),
  KEY `reviews_reviewrequest_changenum_a119b782` (`changenum`),
  KEY `reviews_reviewrequest_summary` (`summary`(255)),
  CONSTRAINT `reviews_reviewreques_diffset_history_id_803728bf_fk_diffviewe` FOREIGN KEY (`diffset_history_id`) REFERENCES `diffviewer_diffsethistory` (`id`),
  CONSTRAINT `reviews_reviewreques_local_site_id_7eadf98c_fk_site_loca` FOREIGN KEY (`local_site_id`) REFERENCES `site_localsite` (`id`),
  CONSTRAINT `reviews_reviewreques_repository_id_a411142d_fk_scmtools_` FOREIGN KEY (`repository_id`) REFERENCES `scmtools_repository` (`id`),
  CONSTRAINT `reviews_reviewrequest_submitter_id_0a5fadde_fk_auth_user_id` FOREIGN KEY (`submitter_id`) REFERENCES `auth_user` (`id`)
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
  UNIQUE KEY `reviews_reviewrequest_ch_reviewrequest_id_changed_a0489fdf_uniq` (`reviewrequest_id`,`changedescription_id`),
  KEY `reviews_reviewreques_changedescription_id_c25c1fe7_fk_changedes` (`changedescription_id`),
  CONSTRAINT `reviews_reviewreques_changedescription_id_c25c1fe7_fk_changedes` FOREIGN KEY (`changedescription_id`) REFERENCES `changedescs_changedescription` (`id`),
  CONSTRAINT `reviews_reviewreques_reviewrequest_id_65def65a_fk_reviews_r` FOREIGN KEY (`reviewrequest_id`) REFERENCES `reviews_reviewrequest` (`id`)
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
  UNIQUE KEY `reviews_reviewrequest_de_from_reviewrequest_id_to_94e62655_uniq` (`from_reviewrequest_id`,`to_reviewrequest_id`),
  KEY `reviews_reviewreques_to_reviewrequest_id_ab47bf47_fk_reviews_r` (`to_reviewrequest_id`),
  CONSTRAINT `reviews_reviewreques_from_reviewrequest_i_2d1eab85_fk_reviews_r` FOREIGN KEY (`from_reviewrequest_id`) REFERENCES `reviews_reviewrequest` (`id`),
  CONSTRAINT `reviews_reviewreques_to_reviewrequest_id_ab47bf47_fk_reviews_r` FOREIGN KEY (`to_reviewrequest_id`) REFERENCES `reviews_reviewrequest` (`id`)
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
  UNIQUE KEY `reviews_reviewrequest_fi_reviewrequest_id_fileatt_bffdaf41_uniq` (`reviewrequest_id`,`fileattachmenthistory_id`),
  KEY `reviews_reviewreques_fileattachmenthistor_78c33186_fk_attachmen` (`fileattachmenthistory_id`),
  CONSTRAINT `reviews_reviewreques_fileattachmenthistor_78c33186_fk_attachmen` FOREIGN KEY (`fileattachmenthistory_id`) REFERENCES `attachments_fileattachmenthistory` (`id`),
  CONSTRAINT `reviews_reviewreques_reviewrequest_id_84509ea0_fk_reviews_r` FOREIGN KEY (`reviewrequest_id`) REFERENCES `reviews_reviewrequest` (`id`)
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
  UNIQUE KEY `reviews_reviewrequest_fi_reviewrequest_id_fileatt_ccfa96ca_uniq` (`reviewrequest_id`,`fileattachment_id`),
  KEY `reviews_reviewreques_fileattachment_id_e78e0b5e_fk_attachmen` (`fileattachment_id`),
  CONSTRAINT `reviews_reviewreques_fileattachment_id_e78e0b5e_fk_attachmen` FOREIGN KEY (`fileattachment_id`) REFERENCES `attachments_fileattachment` (`id`),
  CONSTRAINT `reviews_reviewreques_reviewrequest_id_3bf5d0d8_fk_reviews_r` FOREIGN KEY (`reviewrequest_id`) REFERENCES `reviews_reviewrequest` (`id`)
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
  UNIQUE KEY `reviews_reviewrequest_in_reviewrequest_id_fileatt_02402ce1_uniq` (`reviewrequest_id`,`fileattachment_id`),
  KEY `reviews_reviewreques_fileattachment_id_c63ab996_fk_attachmen` (`fileattachment_id`),
  CONSTRAINT `reviews_reviewreques_fileattachment_id_c63ab996_fk_attachmen` FOREIGN KEY (`fileattachment_id`) REFERENCES `attachments_fileattachment` (`id`),
  CONSTRAINT `reviews_reviewreques_reviewrequest_id_649d41ec_fk_reviews_r` FOREIGN KEY (`reviewrequest_id`) REFERENCES `reviews_reviewrequest` (`id`)
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
  UNIQUE KEY `reviews_reviewrequest_in_reviewrequest_id_screens_8be75eda_uniq` (`reviewrequest_id`,`screenshot_id`),
  KEY `reviews_reviewreques_screenshot_id_26fa56c2_fk_reviews_s` (`screenshot_id`),
  CONSTRAINT `reviews_reviewreques_reviewrequest_id_192a5b09_fk_reviews_r` FOREIGN KEY (`reviewrequest_id`) REFERENCES `reviews_reviewrequest` (`id`),
  CONSTRAINT `reviews_reviewreques_screenshot_id_26fa56c2_fk_reviews_s` FOREIGN KEY (`screenshot_id`) REFERENCES `reviews_screenshot` (`id`)
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
  UNIQUE KEY `reviews_reviewrequest_sc_reviewrequest_id_screens_07732dbc_uniq` (`reviewrequest_id`,`screenshot_id`),
  KEY `reviews_reviewreques_screenshot_id_a3499d76_fk_reviews_s` (`screenshot_id`),
  CONSTRAINT `reviews_reviewreques_reviewrequest_id_67148a80_fk_reviews_r` FOREIGN KEY (`reviewrequest_id`) REFERENCES `reviews_reviewrequest` (`id`),
  CONSTRAINT `reviews_reviewreques_screenshot_id_a3499d76_fk_reviews_s` FOREIGN KEY (`screenshot_id`) REFERENCES `reviews_screenshot` (`id`)
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
  UNIQUE KEY `reviews_reviewrequest_ta_reviewrequest_id_group_i_1a8ec82c_uniq` (`reviewrequest_id`,`group_id`),
  KEY `reviews_reviewreques_group_id_c197c2b6_fk_reviews_g` (`group_id`),
  CONSTRAINT `reviews_reviewreques_group_id_c197c2b6_fk_reviews_g` FOREIGN KEY (`group_id`) REFERENCES `reviews_group` (`id`),
  CONSTRAINT `reviews_reviewreques_reviewrequest_id_9f397bce_fk_reviews_r` FOREIGN KEY (`reviewrequest_id`) REFERENCES `reviews_reviewrequest` (`id`)
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
  UNIQUE KEY `reviews_reviewrequest_ta_reviewrequest_id_user_id_d7cb96bf_uniq` (`reviewrequest_id`,`user_id`),
  KEY `reviews_reviewreques_user_id_1120a3d1_fk_auth_user` (`user_id`),
  CONSTRAINT `reviews_reviewreques_reviewrequest_id_5b9a960c_fk_reviews_r` FOREIGN KEY (`reviewrequest_id`) REFERENCES `reviews_reviewrequest` (`id`),
  CONSTRAINT `reviews_reviewreques_user_id_1120a3d1_fk_auth_user` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
  `last_updated` datetime(6) NOT NULL,
  `diffset_id` int(11) DEFAULT NULL,
  `changedesc_id` int(11) DEFAULT NULL,
  `screenshots_count` int(11) DEFAULT NULL,
  `inactive_screenshots_count` int(11) DEFAULT NULL,
  `file_attachments_count` int(11) DEFAULT NULL,
  `inactive_file_attachments_count` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `review_request_id` (`review_request_id`),
  KEY `reviews_reviewrequestdraft_owner_id_86066878_fk_auth_user_id` (`owner_id`),
  KEY `reviews_reviewreques_diffset_id_ba3c2e37_fk_diffviewe` (`diffset_id`),
  KEY `reviews_reviewreques_changedesc_id_70a4d612_fk_changedes` (`changedesc_id`),
  KEY `reviews_reviewrequestdraft_commit_id_a36610d9` (`commit_id`),
  CONSTRAINT `reviews_reviewreques_changedesc_id_70a4d612_fk_changedes` FOREIGN KEY (`changedesc_id`) REFERENCES `changedescs_changedescription` (`id`),
  CONSTRAINT `reviews_reviewreques_diffset_id_ba3c2e37_fk_diffviewe` FOREIGN KEY (`diffset_id`) REFERENCES `diffviewer_diffset` (`id`),
  CONSTRAINT `reviews_reviewreques_review_request_id_d23e0b0b_fk_reviews_r` FOREIGN KEY (`review_request_id`) REFERENCES `reviews_reviewrequest` (`id`),
  CONSTRAINT `reviews_reviewrequestdraft_owner_id_86066878_fk_auth_user_id` FOREIGN KEY (`owner_id`) REFERENCES `auth_user` (`id`)
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
  UNIQUE KEY `reviews_reviewrequestdra_reviewrequestdraft_id_re_8fc5961d_uniq` (`reviewrequestdraft_id`,`reviewrequest_id`),
  KEY `reviews_reviewreques_reviewrequest_id_834a2c3f_fk_reviews_r` (`reviewrequest_id`),
  CONSTRAINT `reviews_reviewreques_reviewrequest_id_834a2c3f_fk_reviews_r` FOREIGN KEY (`reviewrequest_id`) REFERENCES `reviews_reviewrequest` (`id`),
  CONSTRAINT `reviews_reviewreques_reviewrequestdraft_i_550d105a_fk_reviews_r` FOREIGN KEY (`reviewrequestdraft_id`) REFERENCES `reviews_reviewrequestdraft` (`id`)
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
  UNIQUE KEY `reviews_reviewrequestdra_reviewrequestdraft_id_fi_d78bc93a_uniq` (`reviewrequestdraft_id`,`fileattachment_id`),
  KEY `reviews_reviewreques_fileattachment_id_70274302_fk_attachmen` (`fileattachment_id`),
  CONSTRAINT `reviews_reviewreques_fileattachment_id_70274302_fk_attachmen` FOREIGN KEY (`fileattachment_id`) REFERENCES `attachments_fileattachment` (`id`),
  CONSTRAINT `reviews_reviewreques_reviewrequestdraft_i_6ca73ce6_fk_reviews_r` FOREIGN KEY (`reviewrequestdraft_id`) REFERENCES `reviews_reviewrequestdraft` (`id`)
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
  UNIQUE KEY `reviews_reviewrequestdra_reviewrequestdraft_id_fi_0392ef46_uniq` (`reviewrequestdraft_id`,`fileattachment_id`),
  KEY `reviews_reviewreques_fileattachment_id_fa327aa0_fk_attachmen` (`fileattachment_id`),
  CONSTRAINT `reviews_reviewreques_fileattachment_id_fa327aa0_fk_attachmen` FOREIGN KEY (`fileattachment_id`) REFERENCES `attachments_fileattachment` (`id`),
  CONSTRAINT `reviews_reviewreques_reviewrequestdraft_i_29694abc_fk_reviews_r` FOREIGN KEY (`reviewrequestdraft_id`) REFERENCES `reviews_reviewrequestdraft` (`id`)
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
  UNIQUE KEY `reviews_reviewrequestdra_reviewrequestdraft_id_sc_322d1203_uniq` (`reviewrequestdraft_id`,`screenshot_id`),
  KEY `reviews_reviewreques_screenshot_id_ed06dfad_fk_reviews_s` (`screenshot_id`),
  CONSTRAINT `reviews_reviewreques_reviewrequestdraft_i_a8339e18_fk_reviews_r` FOREIGN KEY (`reviewrequestdraft_id`) REFERENCES `reviews_reviewrequestdraft` (`id`),
  CONSTRAINT `reviews_reviewreques_screenshot_id_ed06dfad_fk_reviews_s` FOREIGN KEY (`screenshot_id`) REFERENCES `reviews_screenshot` (`id`)
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
  UNIQUE KEY `reviews_reviewrequestdra_reviewrequestdraft_id_sc_71233108_uniq` (`reviewrequestdraft_id`,`screenshot_id`),
  KEY `reviews_reviewreques_screenshot_id_68b0d9e3_fk_reviews_s` (`screenshot_id`),
  CONSTRAINT `reviews_reviewreques_reviewrequestdraft_i_bd7c450d_fk_reviews_r` FOREIGN KEY (`reviewrequestdraft_id`) REFERENCES `reviews_reviewrequestdraft` (`id`),
  CONSTRAINT `reviews_reviewreques_screenshot_id_68b0d9e3_fk_reviews_s` FOREIGN KEY (`screenshot_id`) REFERENCES `reviews_screenshot` (`id`)
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
  UNIQUE KEY `reviews_reviewrequestdra_reviewrequestdraft_id_gr_780014ae_uniq` (`reviewrequestdraft_id`,`group_id`),
  KEY `reviews_reviewreques_group_id_f394ff20_fk_reviews_g` (`group_id`),
  CONSTRAINT `reviews_reviewreques_group_id_f394ff20_fk_reviews_g` FOREIGN KEY (`group_id`) REFERENCES `reviews_group` (`id`),
  CONSTRAINT `reviews_reviewreques_reviewrequestdraft_i_efd7dd03_fk_reviews_r` FOREIGN KEY (`reviewrequestdraft_id`) REFERENCES `reviews_reviewrequestdraft` (`id`)
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
  UNIQUE KEY `reviews_reviewrequestdra_reviewrequestdraft_id_us_2d4e7918_uniq` (`reviewrequestdraft_id`,`user_id`),
  KEY `reviews_reviewreques_user_id_83de070a_fk_auth_user` (`user_id`),
  CONSTRAINT `reviews_reviewreques_reviewrequestdraft_i_cf9235c2_fk_reviews_r` FOREIGN KEY (`reviewrequestdraft_id`) REFERENCES `reviews_reviewrequestdraft` (`id`),
  CONSTRAINT `reviews_reviewreques_user_id_83de070a_fk_auth_user` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
  `timestamp` datetime(6) NOT NULL,
  `text` longtext NOT NULL,
  `rich_text` tinyint(1) NOT NULL,
  `extra_data` longtext,
  `screenshot_id` int(11) NOT NULL,
  `x` smallint(5) unsigned DEFAULT NULL,
  `y` smallint(5) unsigned NOT NULL,
  `w` smallint(5) unsigned NOT NULL,
  `h` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `reviews_screenshotco_reply_to_id_20d83c7c_fk_reviews_s` (`reply_to_id`),
  KEY `reviews_screenshotco_screenshot_id_0a8f6ad7_fk_reviews_s` (`screenshot_id`),
  KEY `reviews_screenshotcomment_issue_status_818e13d1` (`issue_status`),
  CONSTRAINT `reviews_screenshotco_reply_to_id_20d83c7c_fk_reviews_s` FOREIGN KEY (`reply_to_id`) REFERENCES `reviews_screenshotcomment` (`id`),
  CONSTRAINT `reviews_screenshotco_screenshot_id_0a8f6ad7_fk_reviews_s` FOREIGN KEY (`screenshot_id`) REFERENCES `reviews_screenshot` (`id`)
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
  `timestamp` datetime(6) NOT NULL,
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
  KEY `reviews_statusupdate_user_id_1f850855_fk_auth_user_id` (`user_id`),
  KEY `reviews_statusupdate_review_request_id_09b3d2bf_fk_reviews_r` (`review_request_id`),
  KEY `reviews_statusupdate_change_description_i_260b3553_fk_changedes` (`change_description_id`),
  CONSTRAINT `reviews_statusupdate_change_description_i_260b3553_fk_changedes` FOREIGN KEY (`change_description_id`) REFERENCES `changedescs_changedescription` (`id`),
  CONSTRAINT `reviews_statusupdate_review_id_cd66ca68_fk_reviews_review_id` FOREIGN KEY (`review_id`) REFERENCES `reviews_review` (`id`),
  CONSTRAINT `reviews_statusupdate_review_request_id_09b3d2bf_fk_reviews_r` FOREIGN KEY (`review_request_id`) REFERENCES `reviews_reviewrequest` (`id`),
  CONSTRAINT `reviews_statusupdate_user_id_1f850855_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
  `archived_timestamp` datetime(6) DEFAULT NULL,
  `local_site_id` int(11) DEFAULT NULL,
  `public` tinyint(1) NOT NULL,
  `hooks_uuid` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `scmtools_repository_name_local_site_id_17cf0ace_uniq` (`name`,`local_site_id`),
  UNIQUE KEY `scmtools_repository_archived_timestamp_path__cac61803_uniq` (`archived_timestamp`,`path`,`local_site_id`),
  UNIQUE KEY `scmtools_repository_hooks_uuid_local_site_id_05a64b12_uniq` (`hooks_uuid`,`local_site_id`),
  KEY `scmtools_repository_tool_id_d3b242d1_fk_scmtools_tool_id` (`tool_id`),
  KEY `scmtools_repository_hosting_account_id_fe34c221_fk_hostingsv` (`hosting_account_id`),
  KEY `scmtools_repository_local_site_id_989f4f3a_fk_site_localsite_id` (`local_site_id`),
  CONSTRAINT `scmtools_repository_hosting_account_id_fe34c221_fk_hostingsv` FOREIGN KEY (`hosting_account_id`) REFERENCES `hostingsvcs_hostingserviceaccount` (`id`),
  CONSTRAINT `scmtools_repository_local_site_id_989f4f3a_fk_site_localsite_id` FOREIGN KEY (`local_site_id`) REFERENCES `site_localsite` (`id`),
  CONSTRAINT `scmtools_repository_tool_id_d3b242d1_fk_scmtools_tool_id` FOREIGN KEY (`tool_id`) REFERENCES `scmtools_tool` (`id`)
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
  UNIQUE KEY `scmtools_repository_revi_repository_id_group_id_1e0382de_uniq` (`repository_id`,`group_id`),
  KEY `scmtools_repository__group_id_23e39d23_fk_reviews_g` (`group_id`),
  CONSTRAINT `scmtools_repository__group_id_23e39d23_fk_reviews_g` FOREIGN KEY (`group_id`) REFERENCES `reviews_group` (`id`),
  CONSTRAINT `scmtools_repository__repository_id_23a2ea36_fk_scmtools_` FOREIGN KEY (`repository_id`) REFERENCES `scmtools_repository` (`id`)
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
  UNIQUE KEY `scmtools_repository_users_repository_id_user_id_c239bac4_uniq` (`repository_id`,`user_id`),
  KEY `scmtools_repository_users_user_id_fd0f89b9_fk_auth_user_id` (`user_id`),
  CONSTRAINT `scmtools_repository__repository_id_d8c11b09_fk_scmtools_` FOREIGN KEY (`repository_id`) REFERENCES `scmtools_repository` (`id`),
  CONSTRAINT `scmtools_repository_users_user_id_fd0f89b9_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scmtools_tool`
--

LOCK TABLES `scmtools_tool` WRITE;
/*!40000 ALTER TABLE `scmtools_tool` DISABLE KEYS */;
INSERT INTO `scmtools_tool` VALUES (1,'Subversion','reviewboard.scmtools.svn.SVNTool'),(2,'Git','reviewboard.scmtools.git.GitTool'),(3,'Bazaar','reviewboard.scmtools.bzr.BZRTool'),(4,'CVS','reviewboard.scmtools.cvs.CVSTool'),(5,'Perforce','reviewboard.scmtools.perforce.PerforceTool'),(6,'Plastic SCM','reviewboard.scmtools.plastic.PlasticTool'),(7,'ClearCase','reviewboard.scmtools.clearcase.ClearCaseTool'),(8,'Mercurial','reviewboard.scmtools.hg.HgTool'),(9,'Cliosoft SOS','rbpowerpack.scmtools.cliosoft_sos.scmtool.CliosoftSOSTool'),(10,'VersionVault / ClearCase','rbpowerpack.scmtools.versionvault.VersionVaultTool'),(11,'Team Foundation Server','rbpowerpack.scmtools.tfs.TFSTool'),(12,'Team Foundation Server (git)','rbpowerpack.scmtools.tfs_git.TFSGitTool');
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
  UNIQUE KEY `site_localsite_admins_localsite_id_user_id_4644c48c_uniq` (`localsite_id`,`user_id`),
  KEY `site_localsite_admins_user_id_a78f941a_fk_auth_user_id` (`user_id`),
  CONSTRAINT `site_localsite_admins_localsite_id_f1ecf08a_fk_site_localsite_id` FOREIGN KEY (`localsite_id`) REFERENCES `site_localsite` (`id`),
  CONSTRAINT `site_localsite_admins_user_id_a78f941a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
  UNIQUE KEY `site_localsite_users_localsite_id_user_id_2b5aa5f9_uniq` (`localsite_id`,`user_id`),
  KEY `site_localsite_users_user_id_d0c1231a_fk_auth_user_id` (`user_id`),
  CONSTRAINT `site_localsite_users_localsite_id_9f338deb_fk_site_localsite_id` FOREIGN KEY (`localsite_id`) REFERENCES `site_localsite` (`id`),
  CONSTRAINT `site_localsite_users_user_id_d0c1231a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
  KEY `siteconfig_siteconfiguration_site_id_a352de24_fk_django_site_id` (`site_id`),
  CONSTRAINT `siteconfig_siteconfiguration_site_id_a352de24_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `siteconfig_siteconfiguration`
--

LOCK TABLES `siteconfig_siteconfiguration` WRITE;
/*!40000 ALTER TABLE `siteconfig_siteconfiguration` DISABLE KEYS */;
INSERT INTO `siteconfig_siteconfiguration` VALUES (1,1,'4.0.6','{\"auth_ad_domain_controller\": null, \"auth_ad_domain_name\": null, \"auth_ad_find_dc_from_dns\": null, \"auth_ad_group_name\": null, \"auth_ad_ou_name\": null, \"auth_ad_recursion_depth\": null, \"auth_ad_search_root\": null, \"auth_ad_use_tls\": null, \"auth_backend\": \"builtin\", \"auth_digest_file_location\": null, \"auth_digest_realm\": null, \"auth_ldap_anon_bind_passwd\": \"\", \"auth_ldap_anon_bind_uid\": \"\", \"auth_ldap_base_dn\": null, \"auth_ldap_email_attribute\": null, \"auth_ldap_email_domain\": \"\", \"auth_ldap_full_name_attribute\": null, \"auth_ldap_given_name_attribute\": null, \"auth_ldap_surname_attribute\": null, \"auth_ldap_tls\": false, \"auth_ldap_uid\": \"uid\", \"auth_ldap_uid_mask\": \"\", \"auth_ldap_uri\": \"\", \"auth_nis_email_domain\": \"\", \"auth_require_sitewide_login\": false, \"auth_x509_autocreate_users\": false, \"auth_x509_custom_username_field\": null, \"auth_x509_username_field\": \"SSL_CLIENT_S_DN_CN\", \"auth_x509_username_regex\": \"\", \"aws_access_key_id\": \"\", \"aws_calling_format\": 2, \"aws_default_acl\": \"public-read\", \"aws_headers\": {}, \"aws_querystring_active\": false, \"aws_querystring_auth\": false, \"aws_querystring_expire\": 60, \"aws_s3_bucket_name\": \"\", \"aws_s3_secure_urls\": false, \"aws_secret_access_key\": \"\", \"cache_backend\": {\"default\": {\"BACKEND\": \"djblets.cache.forwarding_backend.ForwardingCacheBackend\", \"LOCATION\": \"forwarded_backend\"}, \"forwarded_backend\": {\"BACKEND\": \"django.core.cache.backends.locmem.LocMemCache\", \"LOCATION\": \"reviewboard\"}, \"staticfiles\": {\"BACKEND\": \"django.core.cache.backends.locmem.LocMemCache\", \"LOCATION\": \"staticfiles-filehashes\"}}, \"cache_expiration_time\": 2592000, \"couchdb_default_server\": \"\", \"couchdb_storage_options\": {}, \"diffviewer_context_num_lines\": 5, \"diffviewer_include_space_patterns\": [], \"diffviewer_paginate_by\": 20, \"diffviewer_paginate_orphans\": 10, \"diffviewer_syntax_highlighting\": true, \"locale_date_format\": \"N j, Y\", \"locale_datetime_format\": \"N j, Y, P\", \"locale_default_charset\": \"utf-8\", \"locale_language_code\": \"en-us\", \"locale_month_day_format\": \"F j\", \"locale_time_format\": \"P\", \"locale_timezone\": \"UTC\", \"locale_year_month_format\": \"F Y\", \"logging_allow_profiling\": false, \"logging_directory\": null, \"logging_enabled\": true, \"logging_level\": \"DEBUG\", \"mail_default_from\": \"webmaster@localhost\", \"mail_host\": \"localhost\", \"mail_host_password\": \"\", \"mail_host_user\": \"\", \"mail_port\": 25, \"mail_send_review_mail\": false, \"mail_server_address\": \"root@localhost\", \"mail_use_tls\": false, \"recaptcha_private_key\": null, \"recaptcha_public_key\": null, \"search_enable\": false, \"search_index_file\": null, \"site_admin_email\": \"admin@example.com\", \"site_admin_name\": \"Example Admin\", \"site_domain_method\": \"http\", \"site_media_root\": \"/tmp/sitedir/htdocs/media/\", \"site_media_url\": \"/media/\", \"site_prepend_www\": false, \"site_static_root\": \"/tmp/sitedir/htdocs/static/\", \"site_static_url\": \"/static/\", \"site_upload_max_memory_size\": 2621440, \"site_upload_temp_dir\": null, \"swift_auth_url\": \"\", \"swift_auth_version\": \"1\", \"swift_container_name\": \"\", \"swift_key\": \"\", \"swift_username\": \"\"}');
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
  `time_added` datetime(6) NOT NULL,
  `last_updated` datetime(6) NOT NULL,
  `note` longtext NOT NULL,
  `policy` longtext,
  `extra_data` longtext,
  `local_site_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token` (`token`),
  KEY `webapi_webapitoken_user_id_3651ab64_fk_auth_user_id` (`user_id`),
  KEY `webapi_webapitoken_local_site_id_72c83924_fk_site_localsite_id` (`local_site_id`),
  CONSTRAINT `webapi_webapitoken_local_site_id_72c83924_fk_site_localsite_id` FOREIGN KEY (`local_site_id`) REFERENCES `site_localsite` (`id`),
  CONSTRAINT `webapi_webapitoken_user_id_3651ab64_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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

-- Dump completed on 2022-05-15 17:33:17
