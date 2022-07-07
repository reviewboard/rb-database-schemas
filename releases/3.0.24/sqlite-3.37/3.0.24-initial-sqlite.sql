PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "corsheaders_corsmodel" (
    "id" integer NOT NULL PRIMARY KEY,
    "cors" varchar(255) NOT NULL
);
CREATE TABLE IF NOT EXISTS "django_admin_log" (
    "id" integer NOT NULL PRIMARY KEY,
    "action_time" datetime NOT NULL,
    "user_id" integer NOT NULL,
    "content_type_id" integer,
    "object_id" text,
    "object_repr" varchar(200) NOT NULL,
    "action_flag" smallint unsigned NOT NULL,
    "change_message" text NOT NULL
);
CREATE TABLE IF NOT EXISTS "auth_permission" (
    "id" integer NOT NULL PRIMARY KEY,
    "name" varchar(50) NOT NULL,
    "content_type_id" integer NOT NULL,
    "codename" varchar(100) NOT NULL,
    UNIQUE ("content_type_id", "codename")
);
INSERT INTO auth_permission VALUES(1,'Can add cors model',1,'add_corsmodel');
INSERT INTO auth_permission VALUES(2,'Can change cors model',1,'change_corsmodel');
INSERT INTO auth_permission VALUES(3,'Can delete cors model',1,'delete_corsmodel');
INSERT INTO auth_permission VALUES(4,'Can add log entry',2,'add_logentry');
INSERT INTO auth_permission VALUES(5,'Can change log entry',2,'change_logentry');
INSERT INTO auth_permission VALUES(6,'Can delete log entry',2,'delete_logentry');
INSERT INTO auth_permission VALUES(7,'Can add permission',3,'add_permission');
INSERT INTO auth_permission VALUES(8,'Can change permission',3,'change_permission');
INSERT INTO auth_permission VALUES(9,'Can delete permission',3,'delete_permission');
INSERT INTO auth_permission VALUES(10,'Can add group',4,'add_group');
INSERT INTO auth_permission VALUES(11,'Can change group',4,'change_group');
INSERT INTO auth_permission VALUES(12,'Can delete group',4,'delete_group');
INSERT INTO auth_permission VALUES(13,'Can add user',5,'add_user');
INSERT INTO auth_permission VALUES(14,'Can change user',5,'change_user');
INSERT INTO auth_permission VALUES(15,'Can delete user',5,'delete_user');
INSERT INTO auth_permission VALUES(16,'Can add content type',6,'add_contenttype');
INSERT INTO auth_permission VALUES(17,'Can change content type',6,'change_contenttype');
INSERT INTO auth_permission VALUES(18,'Can delete content type',6,'delete_contenttype');
INSERT INTO auth_permission VALUES(19,'Can add site',7,'add_site');
INSERT INTO auth_permission VALUES(20,'Can change site',7,'change_site');
INSERT INTO auth_permission VALUES(21,'Can delete site',7,'delete_site');
INSERT INTO auth_permission VALUES(22,'Can add session',8,'add_session');
INSERT INTO auth_permission VALUES(23,'Can change session',8,'change_session');
INSERT INTO auth_permission VALUES(24,'Can delete session',8,'delete_session');
INSERT INTO auth_permission VALUES(25,'Can add registered extension',9,'add_registeredextension');
INSERT INTO auth_permission VALUES(26,'Can change registered extension',9,'change_registeredextension');
INSERT INTO auth_permission VALUES(27,'Can delete registered extension',9,'delete_registeredextension');
INSERT INTO auth_permission VALUES(28,'Can add Integration Configuration',10,'add_integrationconfig');
INSERT INTO auth_permission VALUES(29,'Can change Integration Configuration',10,'change_integrationconfig');
INSERT INTO auth_permission VALUES(30,'Can delete Integration Configuration',10,'delete_integrationconfig');
INSERT INTO auth_permission VALUES(31,'Can add Stored consent data',11,'add_storedconsentdata');
INSERT INTO auth_permission VALUES(32,'Can change Stored consent data',11,'change_storedconsentdata');
INSERT INTO auth_permission VALUES(33,'Can delete Stored consent data',11,'delete_storedconsentdata');
INSERT INTO auth_permission VALUES(34,'Can add site configuration',12,'add_siteconfiguration');
INSERT INTO auth_permission VALUES(35,'Can change site configuration',12,'change_siteconfiguration');
INSERT INTO auth_permission VALUES(36,'Can delete site configuration',12,'delete_siteconfiguration');
INSERT INTO auth_permission VALUES(37,'Can add application',13,'add_application');
INSERT INTO auth_permission VALUES(38,'Can change application',13,'change_application');
INSERT INTO auth_permission VALUES(39,'Can delete application',13,'delete_application');
INSERT INTO auth_permission VALUES(40,'Can add grant',14,'add_grant');
INSERT INTO auth_permission VALUES(41,'Can change grant',14,'change_grant');
INSERT INTO auth_permission VALUES(42,'Can delete grant',14,'delete_grant');
INSERT INTO auth_permission VALUES(43,'Can add access token',15,'add_accesstoken');
INSERT INTO auth_permission VALUES(44,'Can change access token',15,'change_accesstoken');
INSERT INTO auth_permission VALUES(45,'Can delete access token',15,'delete_accesstoken');
INSERT INTO auth_permission VALUES(46,'Can add refresh token',16,'add_refreshtoken');
INSERT INTO auth_permission VALUES(47,'Can change refresh token',16,'change_refreshtoken');
INSERT INTO auth_permission VALUES(48,'Can delete refresh token',16,'delete_refreshtoken');
INSERT INTO auth_permission VALUES(49,'Can add Review Request Visit',17,'add_reviewrequestvisit');
INSERT INTO auth_permission VALUES(50,'Can change Review Request Visit',17,'change_reviewrequestvisit');
INSERT INTO auth_permission VALUES(51,'Can delete Review Request Visit',17,'delete_reviewrequestvisit');
INSERT INTO auth_permission VALUES(52,'Can add Profile',18,'add_profile');
INSERT INTO auth_permission VALUES(53,'Can change Profile',18,'change_profile');
INSERT INTO auth_permission VALUES(54,'Can delete Profile',18,'delete_profile');
INSERT INTO auth_permission VALUES(55,'Can add Local Site Profile',19,'add_localsiteprofile');
INSERT INTO auth_permission VALUES(56,'Can change Local Site Profile',19,'change_localsiteprofile');
INSERT INTO auth_permission VALUES(57,'Can delete Local Site Profile',19,'delete_localsiteprofile');
INSERT INTO auth_permission VALUES(58,'Can add Trophy',20,'add_trophy');
INSERT INTO auth_permission VALUES(59,'Can change Trophy',20,'change_trophy');
INSERT INTO auth_permission VALUES(60,'Can delete Trophy',20,'delete_trophy');
INSERT INTO auth_permission VALUES(61,'Can add File Attachment History',21,'add_fileattachmenthistory');
INSERT INTO auth_permission VALUES(62,'Can change File Attachment History',21,'change_fileattachmenthistory');
INSERT INTO auth_permission VALUES(63,'Can delete File Attachment History',21,'delete_fileattachmenthistory');
INSERT INTO auth_permission VALUES(64,'Can add File Attachment',22,'add_fileattachment');
INSERT INTO auth_permission VALUES(65,'Can change File Attachment',22,'change_fileattachment');
INSERT INTO auth_permission VALUES(66,'Can delete File Attachment',22,'delete_fileattachment');
INSERT INTO auth_permission VALUES(67,'Can add Change Description',23,'add_changedescription');
INSERT INTO auth_permission VALUES(68,'Can change Change Description',23,'change_changedescription');
INSERT INTO auth_permission VALUES(69,'Can delete Change Description',23,'delete_changedescription');
INSERT INTO auth_permission VALUES(70,'Can add Legacy File Diff Data',24,'add_legacyfilediffdata');
INSERT INTO auth_permission VALUES(71,'Can change Legacy File Diff Data',24,'change_legacyfilediffdata');
INSERT INTO auth_permission VALUES(72,'Can delete Legacy File Diff Data',24,'delete_legacyfilediffdata');
INSERT INTO auth_permission VALUES(73,'Can add Raw File Diff Data',25,'add_rawfilediffdata');
INSERT INTO auth_permission VALUES(74,'Can change Raw File Diff Data',25,'change_rawfilediffdata');
INSERT INTO auth_permission VALUES(75,'Can delete Raw File Diff Data',25,'delete_rawfilediffdata');
INSERT INTO auth_permission VALUES(76,'Can add File Diff',26,'add_filediff');
INSERT INTO auth_permission VALUES(77,'Can change File Diff',26,'change_filediff');
INSERT INTO auth_permission VALUES(78,'Can delete File Diff',26,'delete_filediff');
INSERT INTO auth_permission VALUES(79,'Can add Diff Set',27,'add_diffset');
INSERT INTO auth_permission VALUES(80,'Can change Diff Set',27,'change_diffset');
INSERT INTO auth_permission VALUES(81,'Can delete Diff Set',27,'delete_diffset');
INSERT INTO auth_permission VALUES(82,'Can add Diff Set History',28,'add_diffsethistory');
INSERT INTO auth_permission VALUES(83,'Can change Diff Set History',28,'change_diffsethistory');
INSERT INTO auth_permission VALUES(84,'Can delete Diff Set History',28,'delete_diffsethistory');
INSERT INTO auth_permission VALUES(85,'Can add Hosting Service Account',29,'add_hostingserviceaccount');
INSERT INTO auth_permission VALUES(86,'Can change Hosting Service Account',29,'change_hostingserviceaccount');
INSERT INTO auth_permission VALUES(87,'Can delete Hosting Service Account',29,'delete_hostingserviceaccount');
INSERT INTO auth_permission VALUES(88,'Can add Webhook',30,'add_webhooktarget');
INSERT INTO auth_permission VALUES(89,'Can change Webhook',30,'change_webhooktarget');
INSERT INTO auth_permission VALUES(90,'Can delete Webhook',30,'delete_webhooktarget');
INSERT INTO auth_permission VALUES(91,'Can add OAuth Application',31,'add_application');
INSERT INTO auth_permission VALUES(92,'Can change OAuth Application',31,'change_application');
INSERT INTO auth_permission VALUES(93,'Can delete OAuth Application',31,'delete_application');
INSERT INTO auth_permission VALUES(94,'Can add Review Group',32,'add_group');
INSERT INTO auth_permission VALUES(95,'Can change Review Group',32,'change_group');
INSERT INTO auth_permission VALUES(96,'Can delete Review Group',32,'delete_group');
INSERT INTO auth_permission VALUES(97,'Can view invite-only Groups',32,'can_view_invite_only_groups');
INSERT INTO auth_permission VALUES(98,'Can add Default Reviewer',33,'add_defaultreviewer');
INSERT INTO auth_permission VALUES(99,'Can change Default Reviewer',33,'change_defaultreviewer');
INSERT INTO auth_permission VALUES(100,'Can delete Default Reviewer',33,'delete_defaultreviewer');
INSERT INTO auth_permission VALUES(101,'Can add Diff Comment',34,'add_comment');
INSERT INTO auth_permission VALUES(102,'Can change Diff Comment',34,'change_comment');
INSERT INTO auth_permission VALUES(103,'Can delete Diff Comment',34,'delete_comment');
INSERT INTO auth_permission VALUES(104,'Can add File Attachment Comment',35,'add_fileattachmentcomment');
INSERT INTO auth_permission VALUES(105,'Can change File Attachment Comment',35,'change_fileattachmentcomment');
INSERT INTO auth_permission VALUES(106,'Can delete File Attachment Comment',35,'delete_fileattachmentcomment');
INSERT INTO auth_permission VALUES(107,'Can add General Comment',36,'add_generalcomment');
INSERT INTO auth_permission VALUES(108,'Can change General Comment',36,'change_generalcomment');
INSERT INTO auth_permission VALUES(109,'Can delete General Comment',36,'delete_generalcomment');
INSERT INTO auth_permission VALUES(110,'Can add Screenshot',37,'add_screenshot');
INSERT INTO auth_permission VALUES(111,'Can change Screenshot',37,'change_screenshot');
INSERT INTO auth_permission VALUES(112,'Can delete Screenshot',37,'delete_screenshot');
INSERT INTO auth_permission VALUES(113,'Can add Review Request',38,'add_reviewrequest');
INSERT INTO auth_permission VALUES(114,'Can change Review Request',38,'change_reviewrequest');
INSERT INTO auth_permission VALUES(115,'Can delete Review Request',38,'delete_reviewrequest');
INSERT INTO auth_permission VALUES(116,'Can change status',38,'can_change_status');
INSERT INTO auth_permission VALUES(117,'Can submit as another user',38,'can_submit_as_another_user');
INSERT INTO auth_permission VALUES(118,'Can edit review request',38,'can_edit_reviewrequest');
INSERT INTO auth_permission VALUES(119,'Can add Screenshot Comment',39,'add_screenshotcomment');
INSERT INTO auth_permission VALUES(120,'Can change Screenshot Comment',39,'change_screenshotcomment');
INSERT INTO auth_permission VALUES(121,'Can delete Screenshot Comment',39,'delete_screenshotcomment');
INSERT INTO auth_permission VALUES(122,'Can add Review',40,'add_review');
INSERT INTO auth_permission VALUES(123,'Can change Review',40,'change_review');
INSERT INTO auth_permission VALUES(124,'Can delete Review',40,'delete_review');
INSERT INTO auth_permission VALUES(125,'Can add Review Request Draft',41,'add_reviewrequestdraft');
INSERT INTO auth_permission VALUES(126,'Can change Review Request Draft',41,'change_reviewrequestdraft');
INSERT INTO auth_permission VALUES(127,'Can delete Review Request Draft',41,'delete_reviewrequestdraft');
INSERT INTO auth_permission VALUES(128,'Can add Status Update',42,'add_statusupdate');
INSERT INTO auth_permission VALUES(129,'Can change Status Update',42,'change_statusupdate');
INSERT INTO auth_permission VALUES(130,'Can delete Status Update',42,'delete_statusupdate');
INSERT INTO auth_permission VALUES(131,'Can add Tool',43,'add_tool');
INSERT INTO auth_permission VALUES(132,'Can change Tool',43,'change_tool');
INSERT INTO auth_permission VALUES(133,'Can delete Tool',43,'delete_tool');
INSERT INTO auth_permission VALUES(134,'Can add Repository',44,'add_repository');
INSERT INTO auth_permission VALUES(135,'Can change Repository',44,'change_repository');
INSERT INTO auth_permission VALUES(136,'Can delete Repository',44,'delete_repository');
INSERT INTO auth_permission VALUES(137,'Can add Local Site',45,'add_localsite');
INSERT INTO auth_permission VALUES(138,'Can change Local Site',45,'change_localsite');
INSERT INTO auth_permission VALUES(139,'Can delete Local Site',45,'delete_localsite');
INSERT INTO auth_permission VALUES(140,'Can add Web API Token',46,'add_webapitoken');
INSERT INTO auth_permission VALUES(141,'Can change Web API Token',46,'change_webapitoken');
INSERT INTO auth_permission VALUES(142,'Can delete Web API Token',46,'delete_webapitoken');
INSERT INTO auth_permission VALUES(143,'Can add version',47,'add_version');
INSERT INTO auth_permission VALUES(144,'Can change version',47,'change_version');
INSERT INTO auth_permission VALUES(145,'Can delete version',47,'delete_version');
INSERT INTO auth_permission VALUES(146,'Can add evolution',48,'add_evolution');
INSERT INTO auth_permission VALUES(147,'Can change evolution',48,'change_evolution');
INSERT INTO auth_permission VALUES(148,'Can delete evolution',48,'delete_evolution');
CREATE TABLE IF NOT EXISTS "auth_group_permissions" (
    "id" integer NOT NULL PRIMARY KEY,
    "group_id" integer NOT NULL,
    "permission_id" integer NOT NULL REFERENCES "auth_permission" ("id"),
    UNIQUE ("group_id", "permission_id")
);
CREATE TABLE IF NOT EXISTS "auth_group" (
    "id" integer NOT NULL PRIMARY KEY,
    "name" varchar(80) NOT NULL UNIQUE
);
CREATE TABLE IF NOT EXISTS "auth_user_groups" (
    "id" integer NOT NULL PRIMARY KEY,
    "user_id" integer NOT NULL,
    "group_id" integer NOT NULL REFERENCES "auth_group" ("id"),
    UNIQUE ("user_id", "group_id")
);
CREATE TABLE IF NOT EXISTS "auth_user_user_permissions" (
    "id" integer NOT NULL PRIMARY KEY,
    "user_id" integer NOT NULL,
    "permission_id" integer NOT NULL REFERENCES "auth_permission" ("id"),
    UNIQUE ("user_id", "permission_id")
);
CREATE TABLE IF NOT EXISTS "auth_user" (
    "id" integer NOT NULL PRIMARY KEY,
    "password" varchar(128) NOT NULL,
    "last_login" datetime NOT NULL,
    "is_superuser" bool NOT NULL,
    "username" varchar(30) NOT NULL UNIQUE,
    "first_name" varchar(30) NOT NULL,
    "last_name" varchar(30) NOT NULL,
    "email" varchar(75) NOT NULL,
    "is_staff" bool NOT NULL,
    "is_active" bool NOT NULL,
    "date_joined" datetime NOT NULL
);
CREATE TABLE IF NOT EXISTS "django_content_type" (
    "id" integer NOT NULL PRIMARY KEY,
    "name" varchar(100) NOT NULL,
    "app_label" varchar(100) NOT NULL,
    "model" varchar(100) NOT NULL,
    UNIQUE ("app_label", "model")
);
INSERT INTO django_content_type VALUES(1,'cors model','corsheaders','corsmodel');
INSERT INTO django_content_type VALUES(2,'log entry','admin','logentry');
INSERT INTO django_content_type VALUES(3,'permission','auth','permission');
INSERT INTO django_content_type VALUES(4,'group','auth','group');
INSERT INTO django_content_type VALUES(5,'user','auth','user');
INSERT INTO django_content_type VALUES(6,'content type','contenttypes','contenttype');
INSERT INTO django_content_type VALUES(7,'site','sites','site');
INSERT INTO django_content_type VALUES(8,'session','sessions','session');
INSERT INTO django_content_type VALUES(9,'registered extension','extensions','registeredextension');
INSERT INTO django_content_type VALUES(10,'Integration Configuration','integrations','integrationconfig');
INSERT INTO django_content_type VALUES(11,'Stored consent data','privacy','storedconsentdata');
INSERT INTO django_content_type VALUES(12,'site configuration','siteconfig','siteconfiguration');
INSERT INTO django_content_type VALUES(13,'application','oauth2_provider','application');
INSERT INTO django_content_type VALUES(14,'grant','oauth2_provider','grant');
INSERT INTO django_content_type VALUES(15,'access token','oauth2_provider','accesstoken');
INSERT INTO django_content_type VALUES(16,'refresh token','oauth2_provider','refreshtoken');
INSERT INTO django_content_type VALUES(17,'Review Request Visit','accounts','reviewrequestvisit');
INSERT INTO django_content_type VALUES(18,'Profile','accounts','profile');
INSERT INTO django_content_type VALUES(19,'Local Site Profile','accounts','localsiteprofile');
INSERT INTO django_content_type VALUES(20,'Trophy','accounts','trophy');
INSERT INTO django_content_type VALUES(21,'File Attachment History','attachments','fileattachmenthistory');
INSERT INTO django_content_type VALUES(22,'File Attachment','attachments','fileattachment');
INSERT INTO django_content_type VALUES(23,'Change Description','changedescs','changedescription');
INSERT INTO django_content_type VALUES(24,'Legacy File Diff Data','diffviewer','legacyfilediffdata');
INSERT INTO django_content_type VALUES(25,'Raw File Diff Data','diffviewer','rawfilediffdata');
INSERT INTO django_content_type VALUES(26,'File Diff','diffviewer','filediff');
INSERT INTO django_content_type VALUES(27,'Diff Set','diffviewer','diffset');
INSERT INTO django_content_type VALUES(28,'Diff Set History','diffviewer','diffsethistory');
INSERT INTO django_content_type VALUES(29,'Hosting Service Account','hostingsvcs','hostingserviceaccount');
INSERT INTO django_content_type VALUES(30,'Webhook','notifications','webhooktarget');
INSERT INTO django_content_type VALUES(31,'OAuth Application','oauth','application');
INSERT INTO django_content_type VALUES(32,'Review Group','reviews','group');
INSERT INTO django_content_type VALUES(33,'Default Reviewer','reviews','defaultreviewer');
INSERT INTO django_content_type VALUES(34,'Diff Comment','reviews','comment');
INSERT INTO django_content_type VALUES(35,'File Attachment Comment','reviews','fileattachmentcomment');
INSERT INTO django_content_type VALUES(36,'General Comment','reviews','generalcomment');
INSERT INTO django_content_type VALUES(37,'Screenshot','reviews','screenshot');
INSERT INTO django_content_type VALUES(38,'Review Request','reviews','reviewrequest');
INSERT INTO django_content_type VALUES(39,'Screenshot Comment','reviews','screenshotcomment');
INSERT INTO django_content_type VALUES(40,'Review','reviews','review');
INSERT INTO django_content_type VALUES(41,'Review Request Draft','reviews','reviewrequestdraft');
INSERT INTO django_content_type VALUES(42,'Status Update','reviews','statusupdate');
INSERT INTO django_content_type VALUES(43,'Tool','scmtools','tool');
INSERT INTO django_content_type VALUES(44,'Repository','scmtools','repository');
INSERT INTO django_content_type VALUES(45,'Local Site','site','localsite');
INSERT INTO django_content_type VALUES(46,'Web API Token','webapi','webapitoken');
INSERT INTO django_content_type VALUES(47,'version','django_evolution','version');
INSERT INTO django_content_type VALUES(48,'evolution','django_evolution','evolution');
CREATE TABLE IF NOT EXISTS "django_site" (
    "id" integer NOT NULL PRIMARY KEY,
    "domain" varchar(100) NOT NULL,
    "name" varchar(50) NOT NULL
);
INSERT INTO django_site VALUES(1,'example.com','example.com');
CREATE TABLE IF NOT EXISTS "django_session" (
    "session_key" varchar(40) NOT NULL PRIMARY KEY,
    "session_data" text NOT NULL,
    "expire_date" datetime NOT NULL
);
CREATE TABLE IF NOT EXISTS "extensions_registeredextension" (
    "id" integer NOT NULL PRIMARY KEY,
    "class_name" varchar(128) NOT NULL UNIQUE,
    "name" varchar(32) NOT NULL,
    "enabled" bool NOT NULL,
    "installed" bool NOT NULL,
    "settings" text NOT NULL
);
CREATE TABLE IF NOT EXISTS "integrations_integrationconfig" (
    "id" integer NOT NULL PRIMARY KEY,
    "integration_id" varchar(255) NOT NULL,
    "time_added" datetime NOT NULL,
    "last_updated" datetime NOT NULL,
    "name" varchar(255),
    "enabled" bool NOT NULL,
    "settings" text NOT NULL,
    "extra_data" text NOT NULL,
    "local_site_id" integer
);
CREATE TABLE IF NOT EXISTS "djblets_privacy_storedconsentdata" (
    "id" integer NOT NULL PRIMARY KEY,
    "user_id" integer UNIQUE REFERENCES "auth_user" ("id"),
    "audit_identifier" varchar(255),
    "time_added" datetime NOT NULL,
    "last_updated" datetime NOT NULL,
    "consent_grants" text NOT NULL,
    "audit_trail" text NOT NULL
);
CREATE TABLE IF NOT EXISTS "siteconfig_siteconfiguration" (
    "id" integer NOT NULL PRIMARY KEY,
    "site_id" integer NOT NULL REFERENCES "django_site" ("id"),
    "version" varchar(20) NOT NULL,
    "settings" text NOT NULL
);
INSERT INTO siteconfig_siteconfiguration VALUES(1,1,'3.0.25 alpha 0 (dev)','{"auth_ad_domain_controller": null, "auth_ad_domain_name": null, "auth_ad_find_dc_from_dns": null, "auth_ad_group_name": null, "auth_ad_ou_name": null, "auth_ad_recursion_depth": null, "auth_ad_search_root": null, "auth_ad_use_tls": null, "auth_backend": "builtin", "auth_digest_file_location": null, "auth_digest_realm": null, "auth_ldap_anon_bind_passwd": "", "auth_ldap_anon_bind_uid": "", "auth_ldap_base_dn": null, "auth_ldap_email_attribute": null, "auth_ldap_email_domain": "", "auth_ldap_full_name_attribute": null, "auth_ldap_given_name_attribute": null, "auth_ldap_surname_attribute": null, "auth_ldap_tls": false, "auth_ldap_uid": "uid", "auth_ldap_uid_mask": "", "auth_ldap_uri": "", "auth_nis_email_domain": "", "auth_require_sitewide_login": false, "auth_x509_autocreate_users": false, "auth_x509_custom_username_field": null, "auth_x509_username_field": "SSL_CLIENT_S_DN_CN", "auth_x509_username_regex": "", "aws_access_key_id": "", "aws_calling_format": 2, "aws_default_acl": "public-read", "aws_headers": {}, "aws_querystring_active": false, "aws_querystring_auth": false, "aws_querystring_expire": 60, "aws_s3_bucket_name": "", "aws_s3_secure_urls": false, "aws_secret_access_key": "", "cache_backend": {"default": {"BACKEND": "djblets.cache.forwarding_backend.ForwardingCacheBackend", "LOCATION": "forwarded_backend"}, "forwarded_backend": {"BACKEND": "django.core.cache.backends.locmem.LocMemCache", "LOCATION": "reviewboard"}, "staticfiles": {"BACKEND": "django.core.cache.backends.locmem.LocMemCache", "LOCATION": "staticfiles-filehashes"}}, "cache_expiration_time": 2592000, "couchdb_default_server": "", "couchdb_storage_options": {}, "diffviewer_context_num_lines": 5, "diffviewer_include_space_patterns": [], "diffviewer_paginate_by": 20, "diffviewer_paginate_orphans": 10, "diffviewer_syntax_highlighting": true, "locale_date_format": "N j, Y", "locale_datetime_format": "N j, Y, P", "locale_default_charset": "utf-8", "locale_language_code": "en-us", "locale_month_day_format": "F j", "locale_time_format": "P", "locale_timezone": "UTC", "locale_year_month_format": "F Y", "logging_allow_profiling": false, "logging_directory": null, "logging_enabled": true, "logging_level": "DEBUG", "mail_default_from": "webmaster@localhost", "mail_host": "localhost", "mail_host_password": "", "mail_host_user": "", "mail_port": 25, "mail_send_review_mail": false, "mail_server_address": "root@localhost", "mail_use_tls": false, "recaptcha_private_key": null, "recaptcha_public_key": null, "search_enable": false, "search_index_file": null, "site_admin_email": "admin@example.com", "site_admin_name": "Example Admin", "site_domain_method": "http", "site_media_root": "/site/htdocs/media/", "site_media_url": "/media/", "site_prepend_www": false, "site_static_root": "/site/htdocs/static/", "site_static_url": "/static/", "site_upload_max_memory_size": 2621440, "site_upload_temp_dir": null, "swift_auth_url": "", "swift_auth_version": "1", "swift_container_name": "", "swift_key": "", "swift_username": ""}');
CREATE TABLE IF NOT EXISTS "oauth2_provider_application" (
    "id" integer NOT NULL PRIMARY KEY,
    "client_id" varchar(100) NOT NULL UNIQUE,
    "user_id" integer NOT NULL REFERENCES "auth_user" ("id"),
    "redirect_uris" text NOT NULL,
    "client_type" varchar(32) NOT NULL,
    "authorization_grant_type" varchar(32) NOT NULL,
    "client_secret" varchar(255) NOT NULL,
    "name" varchar(255) NOT NULL,
    "skip_authorization" bool NOT NULL
);
CREATE TABLE IF NOT EXISTS "oauth2_provider_grant" (
    "id" integer NOT NULL PRIMARY KEY,
    "user_id" integer NOT NULL REFERENCES "auth_user" ("id"),
    "code" varchar(255) NOT NULL,
    "application_id" integer NOT NULL,
    "expires" datetime NOT NULL,
    "redirect_uri" varchar(255) NOT NULL,
    "scope" text NOT NULL
);
CREATE TABLE IF NOT EXISTS "oauth2_provider_accesstoken" (
    "id" integer NOT NULL PRIMARY KEY,
    "user_id" integer REFERENCES "auth_user" ("id"),
    "token" varchar(255) NOT NULL,
    "application_id" integer NOT NULL,
    "expires" datetime NOT NULL,
    "scope" text NOT NULL
);
CREATE TABLE IF NOT EXISTS "oauth2_provider_refreshtoken" (
    "id" integer NOT NULL PRIMARY KEY,
    "user_id" integer NOT NULL REFERENCES "auth_user" ("id"),
    "token" varchar(255) NOT NULL,
    "application_id" integer NOT NULL,
    "access_token_id" integer NOT NULL UNIQUE REFERENCES "oauth2_provider_accesstoken" ("id")
);
CREATE TABLE IF NOT EXISTS "accounts_reviewrequestvisit" (
    "id" integer NOT NULL PRIMARY KEY,
    "user_id" integer NOT NULL REFERENCES "auth_user" ("id"),
    "review_request_id" integer NOT NULL,
    "timestamp" datetime NOT NULL,
    "visibility" varchar(1) NOT NULL,
    UNIQUE ("user_id", "review_request_id")
);
CREATE TABLE IF NOT EXISTS "accounts_profile_starred_review_requests" (
    "id" integer NOT NULL PRIMARY KEY,
    "profile_id" integer NOT NULL,
    "reviewrequest_id" integer NOT NULL,
    UNIQUE ("profile_id", "reviewrequest_id")
);
CREATE TABLE IF NOT EXISTS "accounts_profile_starred_groups" (
    "id" integer NOT NULL PRIMARY KEY,
    "profile_id" integer NOT NULL,
    "group_id" integer NOT NULL,
    UNIQUE ("profile_id", "group_id")
);
CREATE TABLE IF NOT EXISTS "accounts_profile" (
    "id" integer NOT NULL PRIMARY KEY,
    "user_id" integer NOT NULL UNIQUE REFERENCES "auth_user" ("id"),
    "first_time_setup_done" bool NOT NULL,
    "should_send_email" bool NOT NULL,
    "should_send_own_updates" bool NOT NULL,
    "collapsed_diffs" bool NOT NULL,
    "wordwrapped_diffs" bool NOT NULL,
    "syntax_highlighting" bool NOT NULL,
    "is_private" bool NOT NULL,
    "open_an_issue" bool NOT NULL,
    "default_use_rich_text" bool,
    "show_closed" bool NOT NULL,
    "sort_review_request_columns" varchar(256) NOT NULL,
    "sort_dashboard_columns" varchar(256) NOT NULL,
    "sort_submitter_columns" varchar(256) NOT NULL,
    "sort_group_columns" varchar(256) NOT NULL,
    "review_request_columns" varchar(256) NOT NULL,
    "dashboard_columns" varchar(256) NOT NULL,
    "submitter_columns" varchar(256) NOT NULL,
    "group_columns" varchar(256) NOT NULL,
    "timezone" varchar(30) NOT NULL,
    "settings" text,
    "extra_data" text
);
CREATE TABLE IF NOT EXISTS "accounts_localsiteprofile" (
    "id" integer NOT NULL PRIMARY KEY,
    "user_id" integer NOT NULL REFERENCES "auth_user" ("id"),
    "profile_id" integer NOT NULL REFERENCES "accounts_profile" ("id"),
    "local_site_id" integer,
    "permissions" text,
    "direct_incoming_request_count" integer,
    "total_incoming_request_count" integer,
    "pending_outgoing_request_count" integer,
    "total_outgoing_request_count" integer,
    "starred_public_request_count" integer,
    UNIQUE ("user_id", "local_site_id"),
    UNIQUE ("profile_id", "local_site_id")
);
CREATE TABLE IF NOT EXISTS "accounts_trophy" (
    "id" integer NOT NULL PRIMARY KEY,
    "category" varchar(100) NOT NULL,
    "received_date" datetime NOT NULL,
    "review_request_id" integer NOT NULL,
    "local_site_id" integer,
    "user_id" integer NOT NULL REFERENCES "auth_user" ("id")
);
CREATE TABLE IF NOT EXISTS "attachments_fileattachmenthistory" (
    "id" integer NOT NULL PRIMARY KEY,
    "display_position" integer NOT NULL,
    "latest_revision" integer
);
CREATE TABLE IF NOT EXISTS "attachments_fileattachment" (
    "id" integer NOT NULL PRIMARY KEY,
    "caption" varchar(256) NOT NULL,
    "draft_caption" varchar(256) NOT NULL,
    "orig_filename" varchar(256),
    "user_id" integer REFERENCES "auth_user" ("id"),
    "local_site_id" integer,
    "uuid" varchar(255) NOT NULL,
    "file" varchar(512),
    "mimetype" varchar(256) NOT NULL,
    "repo_path" varchar(1024),
    "repo_revision" varchar(64),
    "repository_id" integer,
    "added_in_filediff_id" integer,
    "attachment_history_id" integer REFERENCES "attachments_fileattachmenthistory" ("id"),
    "attachment_revision" integer NOT NULL
);
CREATE TABLE IF NOT EXISTS "changedescs_changedescription" (
    "id" integer NOT NULL PRIMARY KEY,
    "user_id" integer REFERENCES "auth_user" ("id"),
    "timestamp" datetime NOT NULL,
    "public" bool NOT NULL,
    "text" text NOT NULL,
    "rich_text" bool NOT NULL,
    "fields_changed" text NOT NULL
);
CREATE TABLE IF NOT EXISTS "diffviewer_filediffdata" (
    "binary_hash" varchar(40) NOT NULL PRIMARY KEY,
    "binary" text NOT NULL,
    "extra_data" text
);
CREATE TABLE IF NOT EXISTS "diffviewer_rawfilediffdata" (
    "id" integer NOT NULL PRIMARY KEY,
    "binary_hash" varchar(40) NOT NULL UNIQUE,
    "binary" BLOB NOT NULL,
    "compression" varchar(1),
    "extra_data" text
);
CREATE TABLE IF NOT EXISTS "diffviewer_filediff" (
    "id" integer NOT NULL PRIMARY KEY,
    "diffset_id" integer NOT NULL,
    "source_file" varchar(1024) NOT NULL,
    "dest_file" varchar(1024) NOT NULL,
    "source_revision" varchar(512) NOT NULL,
    "dest_detail" varchar(512) NOT NULL,
    "binary" bool NOT NULL,
    "status" varchar(1) NOT NULL,
    "diff_base64" text NOT NULL,
    "diff_hash_id" varchar(40) REFERENCES "diffviewer_filediffdata" ("binary_hash"),
    "raw_diff_hash_id" integer REFERENCES "diffviewer_rawfilediffdata" ("id"),
    "parent_diff_base64" text NOT NULL,
    "parent_diff_hash_id" varchar(40) REFERENCES "diffviewer_filediffdata" ("binary_hash"),
    "raw_parent_diff_hash_id" integer REFERENCES "diffviewer_rawfilediffdata" ("id"),
    "extra_data" text
);
CREATE TABLE IF NOT EXISTS "diffviewer_diffset" (
    "id" integer NOT NULL PRIMARY KEY,
    "name" varchar(256) NOT NULL,
    "revision" integer NOT NULL,
    "timestamp" datetime NOT NULL,
    "basedir" varchar(256) NOT NULL,
    "history_id" integer,
    "repository_id" integer NOT NULL,
    "diffcompat" integer NOT NULL,
    "base_commit_id" varchar(64),
    "extra_data" text
);
CREATE TABLE IF NOT EXISTS "diffviewer_diffsethistory" (
    "id" integer NOT NULL PRIMARY KEY,
    "name" varchar(256) NOT NULL,
    "timestamp" datetime NOT NULL,
    "last_diff_updated" datetime,
    "extra_data" text
);
CREATE TABLE IF NOT EXISTS "hostingsvcs_hostingserviceaccount" (
    "id" integer NOT NULL PRIMARY KEY,
    "service_name" varchar(128) NOT NULL,
    "hosting_url" varchar(255),
    "username" varchar(128) NOT NULL,
    "data" text NOT NULL,
    "visible" bool NOT NULL,
    "local_site_id" integer
);
CREATE TABLE IF NOT EXISTS "notifications_webhooktarget_repositories" (
    "id" integer NOT NULL PRIMARY KEY,
    "webhooktarget_id" integer NOT NULL,
    "repository_id" integer NOT NULL,
    UNIQUE ("webhooktarget_id", "repository_id")
);
CREATE TABLE IF NOT EXISTS "notifications_webhooktarget" (
    "id" integer NOT NULL PRIMARY KEY,
    "enabled" bool NOT NULL,
    "events" varchar(105) NOT NULL,
    "url" varchar(200) NOT NULL,
    "encoding" varchar(40) NOT NULL,
    "use_custom_content" bool NOT NULL,
    "custom_content" text,
    "secret" varchar(128) NOT NULL,
    "apply_to" varchar(1) NOT NULL,
    "local_site_id" integer,
    "extra_data" text
);
CREATE TABLE IF NOT EXISTS "reviewboard_oauth_application" (
    "id" integer NOT NULL PRIMARY KEY,
    "client_id" varchar(100) NOT NULL UNIQUE,
    "user_id" integer NOT NULL REFERENCES "auth_user" ("id"),
    "redirect_uris" text NOT NULL,
    "client_type" varchar(32) NOT NULL,
    "authorization_grant_type" varchar(32) NOT NULL,
    "client_secret" varchar(255) NOT NULL,
    "name" varchar(255) NOT NULL,
    "skip_authorization" bool NOT NULL,
    "enabled" bool NOT NULL,
    "original_user_id" integer REFERENCES "auth_user" ("id"),
    "local_site_id" integer,
    "extra_data" text
);
CREATE TABLE IF NOT EXISTS "reviews_group_users" (
    "id" integer NOT NULL PRIMARY KEY,
    "group_id" integer NOT NULL,
    "user_id" integer NOT NULL REFERENCES "auth_user" ("id"),
    UNIQUE ("group_id", "user_id")
);
CREATE TABLE IF NOT EXISTS "reviews_group" (
    "id" integer NOT NULL PRIMARY KEY,
    "name" varchar(64) NOT NULL,
    "display_name" varchar(64) NOT NULL,
    "mailing_list" varchar(254) NOT NULL,
    "email_list_only" bool NOT NULL,
    "local_site_id" integer,
    "is_default_group" bool NOT NULL,
    "incoming_request_count" integer,
    "invite_only" bool NOT NULL,
    "visible" bool NOT NULL,
    "extra_data" text,
    UNIQUE ("name", "local_site_id")
);
CREATE TABLE IF NOT EXISTS "reviews_defaultreviewer_repository" (
    "id" integer NOT NULL PRIMARY KEY,
    "defaultreviewer_id" integer NOT NULL,
    "repository_id" integer NOT NULL,
    UNIQUE ("defaultreviewer_id", "repository_id")
);
CREATE TABLE IF NOT EXISTS "reviews_defaultreviewer_people" (
    "id" integer NOT NULL PRIMARY KEY,
    "defaultreviewer_id" integer NOT NULL,
    "user_id" integer NOT NULL REFERENCES "auth_user" ("id"),
    UNIQUE ("defaultreviewer_id", "user_id")
);
CREATE TABLE IF NOT EXISTS "reviews_defaultreviewer_groups" (
    "id" integer NOT NULL PRIMARY KEY,
    "defaultreviewer_id" integer NOT NULL,
    "group_id" integer NOT NULL REFERENCES "reviews_group" ("id"),
    UNIQUE ("defaultreviewer_id", "group_id")
);
CREATE TABLE IF NOT EXISTS "reviews_defaultreviewer" (
    "id" integer NOT NULL PRIMARY KEY,
    "name" varchar(64) NOT NULL,
    "file_regex" varchar(256) NOT NULL,
    "local_site_id" integer
);
CREATE TABLE IF NOT EXISTS "reviews_comment" (
    "id" integer NOT NULL PRIMARY KEY,
    "issue_opened" bool NOT NULL,
    "issue_status" varchar(1),
    "reply_to_id" integer REFERENCES "reviews_comment" ("id"),
    "timestamp" datetime NOT NULL,
    "text" text NOT NULL,
    "rich_text" bool NOT NULL,
    "extra_data" text,
    "filediff_id" integer NOT NULL REFERENCES "diffviewer_filediff" ("id"),
    "interfilediff_id" integer REFERENCES "diffviewer_filediff" ("id"),
    "first_line" integer unsigned,
    "num_lines" integer unsigned
);
CREATE TABLE IF NOT EXISTS "reviews_fileattachmentcomment" (
    "id" integer NOT NULL PRIMARY KEY,
    "issue_opened" bool NOT NULL,
    "issue_status" varchar(1),
    "reply_to_id" integer REFERENCES "reviews_fileattachmentcomment" ("id"),
    "timestamp" datetime NOT NULL,
    "text" text NOT NULL,
    "rich_text" bool NOT NULL,
    "extra_data" text,
    "file_attachment_id" integer NOT NULL REFERENCES "attachments_fileattachment" ("id"),
    "diff_against_file_attachment_id" integer REFERENCES "attachments_fileattachment" ("id")
);
CREATE TABLE IF NOT EXISTS "reviews_generalcomment" (
    "id" integer NOT NULL PRIMARY KEY,
    "issue_opened" bool NOT NULL,
    "issue_status" varchar(1),
    "reply_to_id" integer REFERENCES "reviews_generalcomment" ("id"),
    "timestamp" datetime NOT NULL,
    "text" text NOT NULL,
    "rich_text" bool NOT NULL,
    "extra_data" text
);
CREATE TABLE IF NOT EXISTS "reviews_screenshot" (
    "id" integer NOT NULL PRIMARY KEY,
    "caption" varchar(256) NOT NULL,
    "draft_caption" varchar(256) NOT NULL,
    "image" varchar(100) NOT NULL
);
CREATE TABLE IF NOT EXISTS "reviews_reviewrequest_changedescs" (
    "id" integer NOT NULL PRIMARY KEY,
    "reviewrequest_id" integer NOT NULL,
    "changedescription_id" integer NOT NULL REFERENCES "changedescs_changedescription" ("id"),
    UNIQUE ("reviewrequest_id", "changedescription_id")
);
CREATE TABLE IF NOT EXISTS "reviews_reviewrequest_target_people" (
    "id" integer NOT NULL PRIMARY KEY,
    "reviewrequest_id" integer NOT NULL,
    "user_id" integer NOT NULL REFERENCES "auth_user" ("id"),
    UNIQUE ("reviewrequest_id", "user_id")
);
CREATE TABLE IF NOT EXISTS "reviews_reviewrequest_inactive_screenshots" (
    "id" integer NOT NULL PRIMARY KEY,
    "reviewrequest_id" integer NOT NULL,
    "screenshot_id" integer NOT NULL REFERENCES "reviews_screenshot" ("id"),
    UNIQUE ("reviewrequest_id", "screenshot_id")
);
CREATE TABLE IF NOT EXISTS "reviews_reviewrequest_screenshots" (
    "id" integer NOT NULL PRIMARY KEY,
    "reviewrequest_id" integer NOT NULL,
    "screenshot_id" integer NOT NULL REFERENCES "reviews_screenshot" ("id"),
    UNIQUE ("reviewrequest_id", "screenshot_id")
);
CREATE TABLE IF NOT EXISTS "reviews_reviewrequest_depends_on" (
    "id" integer NOT NULL PRIMARY KEY,
    "from_reviewrequest_id" integer NOT NULL,
    "to_reviewrequest_id" integer NOT NULL,
    UNIQUE ("from_reviewrequest_id", "to_reviewrequest_id")
);
CREATE TABLE IF NOT EXISTS "reviews_reviewrequest_inactive_file_attachments" (
    "id" integer NOT NULL PRIMARY KEY,
    "reviewrequest_id" integer NOT NULL,
    "fileattachment_id" integer NOT NULL REFERENCES "attachments_fileattachment" ("id"),
    UNIQUE ("reviewrequest_id", "fileattachment_id")
);
CREATE TABLE IF NOT EXISTS "reviews_reviewrequest_file_attachment_histories" (
    "id" integer NOT NULL PRIMARY KEY,
    "reviewrequest_id" integer NOT NULL,
    "fileattachmenthistory_id" integer NOT NULL REFERENCES "attachments_fileattachmenthistory" ("id"),
    UNIQUE ("reviewrequest_id", "fileattachmenthistory_id")
);
CREATE TABLE IF NOT EXISTS "reviews_reviewrequest_target_groups" (
    "id" integer NOT NULL PRIMARY KEY,
    "reviewrequest_id" integer NOT NULL,
    "group_id" integer NOT NULL REFERENCES "reviews_group" ("id"),
    UNIQUE ("reviewrequest_id", "group_id")
);
CREATE TABLE IF NOT EXISTS "reviews_reviewrequest_file_attachments" (
    "id" integer NOT NULL PRIMARY KEY,
    "reviewrequest_id" integer NOT NULL,
    "fileattachment_id" integer NOT NULL REFERENCES "attachments_fileattachment" ("id"),
    UNIQUE ("reviewrequest_id", "fileattachment_id")
);
CREATE TABLE IF NOT EXISTS "reviews_reviewrequest" (
    "id" integer NOT NULL PRIMARY KEY,
    "description" text NOT NULL,
    "description_rich_text" bool NOT NULL,
    "testing_done" text NOT NULL,
    "testing_done_rich_text" bool NOT NULL,
    "bugs_closed" varchar(300) NOT NULL,
    "branch" varchar(300) NOT NULL,
    "commit_id" varchar(64),
    "extra_data" text,
    "rich_text" bool NOT NULL,
    "summary" varchar(300) NOT NULL,
    "submitter_id" integer NOT NULL REFERENCES "auth_user" ("id"),
    "time_added" datetime NOT NULL,
    "last_updated" datetime NOT NULL,
    "status" varchar(1) NOT NULL,
    "public" bool NOT NULL,
    "changenum" integer unsigned,
    "repository_id" integer,
    "email_message_id" varchar(255),
    "time_emailed" datetime,
    "diffset_history_id" integer NOT NULL REFERENCES "diffviewer_diffsethistory" ("id"),
    "last_review_timestamp" datetime,
    "shipit_count" integer,
    "issue_open_count" integer,
    "issue_resolved_count" integer,
    "issue_dropped_count" integer,
    "issue_verifying_count" integer,
    "screenshots_count" integer,
    "inactive_screenshots_count" integer,
    "file_attachments_count" integer,
    "inactive_file_attachments_count" integer,
    "local_site_id" integer,
    "local_id" integer,
    UNIQUE ("commit_id", "repository_id"),
    UNIQUE ("changenum", "repository_id"),
    UNIQUE ("local_site_id", "local_id")
);
CREATE TABLE IF NOT EXISTS "reviews_screenshotcomment" (
    "id" integer NOT NULL PRIMARY KEY,
    "issue_opened" bool NOT NULL,
    "issue_status" varchar(1),
    "reply_to_id" integer REFERENCES "reviews_screenshotcomment" ("id"),
    "timestamp" datetime NOT NULL,
    "text" text NOT NULL,
    "rich_text" bool NOT NULL,
    "extra_data" text,
    "screenshot_id" integer NOT NULL REFERENCES "reviews_screenshot" ("id"),
    "x" smallint unsigned,
    "y" smallint unsigned NOT NULL,
    "w" smallint unsigned NOT NULL,
    "h" smallint unsigned NOT NULL
);
CREATE TABLE IF NOT EXISTS "reviews_review_comments" (
    "id" integer NOT NULL PRIMARY KEY,
    "review_id" integer NOT NULL,
    "comment_id" integer NOT NULL REFERENCES "reviews_comment" ("id"),
    UNIQUE ("review_id", "comment_id")
);
CREATE TABLE IF NOT EXISTS "reviews_review_file_attachment_comments" (
    "id" integer NOT NULL PRIMARY KEY,
    "review_id" integer NOT NULL,
    "fileattachmentcomment_id" integer NOT NULL REFERENCES "reviews_fileattachmentcomment" ("id"),
    UNIQUE ("review_id", "fileattachmentcomment_id")
);
CREATE TABLE IF NOT EXISTS "reviews_review_general_comments" (
    "id" integer NOT NULL PRIMARY KEY,
    "review_id" integer NOT NULL,
    "generalcomment_id" integer NOT NULL REFERENCES "reviews_generalcomment" ("id"),
    UNIQUE ("review_id", "generalcomment_id")
);
CREATE TABLE IF NOT EXISTS "reviews_review_screenshot_comments" (
    "id" integer NOT NULL PRIMARY KEY,
    "review_id" integer NOT NULL,
    "screenshotcomment_id" integer NOT NULL REFERENCES "reviews_screenshotcomment" ("id"),
    UNIQUE ("review_id", "screenshotcomment_id")
);
CREATE TABLE IF NOT EXISTS "reviews_review" (
    "id" integer NOT NULL PRIMARY KEY,
    "review_request_id" integer NOT NULL REFERENCES "reviews_reviewrequest" ("id"),
    "user_id" integer NOT NULL REFERENCES "auth_user" ("id"),
    "timestamp" datetime NOT NULL,
    "public" bool NOT NULL,
    "ship_it" bool NOT NULL,
    "base_reply_to_id" integer REFERENCES "reviews_review" ("id"),
    "email_message_id" varchar(255),
    "time_emailed" datetime,
    "body_top" text NOT NULL,
    "body_top_rich_text" bool NOT NULL,
    "body_bottom" text NOT NULL,
    "body_bottom_rich_text" bool NOT NULL,
    "body_top_reply_to_id" integer REFERENCES "reviews_review" ("id"),
    "body_bottom_reply_to_id" integer REFERENCES "reviews_review" ("id"),
    "extra_data" text,
    "rich_text" bool NOT NULL,
    "reviewed_diffset_id" integer REFERENCES "diffviewer_diffset" ("id")
);
CREATE TABLE IF NOT EXISTS "reviews_reviewrequestdraft_target_people" (
    "id" integer NOT NULL PRIMARY KEY,
    "reviewrequestdraft_id" integer NOT NULL,
    "user_id" integer NOT NULL REFERENCES "auth_user" ("id"),
    UNIQUE ("reviewrequestdraft_id", "user_id")
);
CREATE TABLE IF NOT EXISTS "reviews_reviewrequestdraft_depends_on" (
    "id" integer NOT NULL PRIMARY KEY,
    "reviewrequestdraft_id" integer NOT NULL,
    "reviewrequest_id" integer NOT NULL REFERENCES "reviews_reviewrequest" ("id"),
    UNIQUE ("reviewrequestdraft_id", "reviewrequest_id")
);
CREATE TABLE IF NOT EXISTS "reviews_reviewrequestdraft_file_attachments" (
    "id" integer NOT NULL PRIMARY KEY,
    "reviewrequestdraft_id" integer NOT NULL,
    "fileattachment_id" integer NOT NULL REFERENCES "attachments_fileattachment" ("id"),
    UNIQUE ("reviewrequestdraft_id", "fileattachment_id")
);
CREATE TABLE IF NOT EXISTS "reviews_reviewrequestdraft_screenshots" (
    "id" integer NOT NULL PRIMARY KEY,
    "reviewrequestdraft_id" integer NOT NULL,
    "screenshot_id" integer NOT NULL REFERENCES "reviews_screenshot" ("id"),
    UNIQUE ("reviewrequestdraft_id", "screenshot_id")
);
CREATE TABLE IF NOT EXISTS "reviews_reviewrequestdraft_inactive_screenshots" (
    "id" integer NOT NULL PRIMARY KEY,
    "reviewrequestdraft_id" integer NOT NULL,
    "screenshot_id" integer NOT NULL REFERENCES "reviews_screenshot" ("id"),
    UNIQUE ("reviewrequestdraft_id", "screenshot_id")
);
CREATE TABLE IF NOT EXISTS "reviews_reviewrequestdraft_inactive_file_attachments" (
    "id" integer NOT NULL PRIMARY KEY,
    "reviewrequestdraft_id" integer NOT NULL,
    "fileattachment_id" integer NOT NULL REFERENCES "attachments_fileattachment" ("id"),
    UNIQUE ("reviewrequestdraft_id", "fileattachment_id")
);
CREATE TABLE IF NOT EXISTS "reviews_reviewrequestdraft_target_groups" (
    "id" integer NOT NULL PRIMARY KEY,
    "reviewrequestdraft_id" integer NOT NULL,
    "group_id" integer NOT NULL REFERENCES "reviews_group" ("id"),
    UNIQUE ("reviewrequestdraft_id", "group_id")
);
CREATE TABLE IF NOT EXISTS "reviews_reviewrequestdraft" (
    "id" integer NOT NULL PRIMARY KEY,
    "description" text NOT NULL,
    "description_rich_text" bool NOT NULL,
    "testing_done" text NOT NULL,
    "testing_done_rich_text" bool NOT NULL,
    "bugs_closed" varchar(300) NOT NULL,
    "branch" varchar(300) NOT NULL,
    "commit_id" varchar(64),
    "extra_data" text,
    "rich_text" bool NOT NULL,
    "summary" varchar(300) NOT NULL,
    "owner_id" integer REFERENCES "auth_user" ("id"),
    "review_request_id" integer NOT NULL UNIQUE REFERENCES "reviews_reviewrequest" ("id"),
    "last_updated" datetime NOT NULL,
    "diffset_id" integer REFERENCES "diffviewer_diffset" ("id"),
    "changedesc_id" integer REFERENCES "changedescs_changedescription" ("id"),
    "screenshots_count" integer,
    "inactive_screenshots_count" integer,
    "file_attachments_count" integer,
    "inactive_file_attachments_count" integer
);
CREATE TABLE IF NOT EXISTS "reviews_statusupdate" (
    "id" integer NOT NULL PRIMARY KEY,
    "service_id" varchar(255) NOT NULL,
    "user_id" integer REFERENCES "auth_user" ("id"),
    "timestamp" datetime NOT NULL,
    "summary" varchar(255) NOT NULL,
    "description" varchar(255) NOT NULL,
    "url" varchar(255) NOT NULL,
    "url_text" varchar(64) NOT NULL,
    "state" varchar(1) NOT NULL,
    "review_request_id" integer NOT NULL REFERENCES "reviews_reviewrequest" ("id"),
    "change_description_id" integer REFERENCES "changedescs_changedescription" ("id"),
    "review_id" integer UNIQUE REFERENCES "reviews_review" ("id"),
    "extra_data" text,
    "timeout" integer
);
CREATE TABLE IF NOT EXISTS "scmtools_tool" (
    "id" integer NOT NULL PRIMARY KEY,
    "name" varchar(32) NOT NULL UNIQUE,
    "class_name" varchar(128) NOT NULL UNIQUE
);
INSERT INTO scmtools_tool VALUES(1,'Subversion','reviewboard.scmtools.svn.SVNTool');
INSERT INTO scmtools_tool VALUES(2,'Git','reviewboard.scmtools.git.GitTool');
INSERT INTO scmtools_tool VALUES(3,'Bazaar','reviewboard.scmtools.bzr.BZRTool');
INSERT INTO scmtools_tool VALUES(4,'CVS','reviewboard.scmtools.cvs.CVSTool');
INSERT INTO scmtools_tool VALUES(5,'Perforce','reviewboard.scmtools.perforce.PerforceTool');
INSERT INTO scmtools_tool VALUES(6,'Plastic SCM','reviewboard.scmtools.plastic.PlasticTool');
INSERT INTO scmtools_tool VALUES(7,'ClearCase','reviewboard.scmtools.clearcase.ClearCaseTool');
INSERT INTO scmtools_tool VALUES(8,'Mercurial','reviewboard.scmtools.hg.HgTool');
INSERT INTO scmtools_tool VALUES(9,'Team Foundation Server','rbpowerpack.scmtools.tfs.TFSTool');
INSERT INTO scmtools_tool VALUES(10,'Team Foundation Server (git)','rbpowerpack.scmtools.tfs_git.TFSGitTool');
CREATE TABLE IF NOT EXISTS "scmtools_repository_review_groups" (
    "id" integer NOT NULL PRIMARY KEY,
    "repository_id" integer NOT NULL,
    "group_id" integer NOT NULL REFERENCES "reviews_group" ("id"),
    UNIQUE ("repository_id", "group_id")
);
CREATE TABLE IF NOT EXISTS "scmtools_repository_users" (
    "id" integer NOT NULL PRIMARY KEY,
    "repository_id" integer NOT NULL,
    "user_id" integer NOT NULL REFERENCES "auth_user" ("id"),
    UNIQUE ("repository_id", "user_id")
);
CREATE TABLE IF NOT EXISTS "scmtools_repository" (
    "id" integer NOT NULL PRIMARY KEY,
    "name" varchar(255) NOT NULL,
    "path" varchar(255) NOT NULL,
    "mirror_path" varchar(255) NOT NULL,
    "raw_file_url" varchar(255) NOT NULL,
    "username" varchar(32) NOT NULL,
    "password" varchar(128) NOT NULL,
    "extra_data" text,
    "tool_id" integer NOT NULL REFERENCES "scmtools_tool" ("id"),
    "hosting_account_id" integer REFERENCES "hostingsvcs_hostingserviceaccount" ("id"),
    "bug_tracker" varchar(256) NOT NULL,
    "encoding" varchar(32) NOT NULL,
    "visible" bool NOT NULL,
    "archived" bool NOT NULL,
    "archived_timestamp" datetime,
    "local_site_id" integer,
    "public" bool NOT NULL,
    "hooks_uuid" varchar(32),
    UNIQUE ("name", "local_site_id"),
    UNIQUE ("archived_timestamp", "path", "local_site_id"),
    UNIQUE ("hooks_uuid", "local_site_id")
);
CREATE TABLE IF NOT EXISTS "site_localsite_users" (
    "id" integer NOT NULL PRIMARY KEY,
    "localsite_id" integer NOT NULL,
    "user_id" integer NOT NULL REFERENCES "auth_user" ("id"),
    UNIQUE ("localsite_id", "user_id")
);
CREATE TABLE IF NOT EXISTS "site_localsite_admins" (
    "id" integer NOT NULL PRIMARY KEY,
    "localsite_id" integer NOT NULL,
    "user_id" integer NOT NULL REFERENCES "auth_user" ("id"),
    UNIQUE ("localsite_id", "user_id")
);
CREATE TABLE IF NOT EXISTS "site_localsite" (
    "id" integer NOT NULL PRIMARY KEY,
    "name" varchar(32) NOT NULL UNIQUE,
    "public" bool NOT NULL,
    "extra_data" text
);
CREATE TABLE IF NOT EXISTS "webapi_webapitoken" (
    "id" integer NOT NULL PRIMARY KEY,
    "user_id" integer NOT NULL REFERENCES "auth_user" ("id"),
    "token" varchar(40) NOT NULL UNIQUE,
    "time_added" datetime NOT NULL,
    "last_updated" datetime NOT NULL,
    "note" text NOT NULL,
    "policy" text,
    "extra_data" text,
    "local_site_id" integer REFERENCES "site_localsite" ("id")
);
CREATE TABLE IF NOT EXISTS "django_project_version" (
    "id" integer NOT NULL PRIMARY KEY,
    "signature" text NOT NULL,
    "when" datetime NOT NULL
);
INSERT INTO django_project_version VALUES(1,replace('(dp1\nS''changedescs''\np2\nccopy_reg\n_reconstructor\np3\n(cdjango.utils.datastructures\nSortedDict\np4\nc__builtin__\ndict\np5\n(dp6\nS''ChangeDescription''\np7\n(dp8\nS''fields''\np9\n(dp10\nS''timestamp''\np11\n(dp12\nS''field_type''\np13\ncdjango.db.models.fields\nDateTimeField\np14\nssS''rich_text''\np15\n(dp16\ng13\ncdjango.db.models.fields\nBooleanField\np17\nssS''fields_changed''\np18\n(dp19\ng13\ncdjblets.db.fields.json_field\nJSONField\np20\nssS''user''\np21\n(dp22\ng13\ncdjango.db.models.fields.related\nForeignKey\np23\nsS''null''\np24\nI01\nsS''related_model''\np25\nS''auth.User''\np26\nssS''text''\np27\n(dp28\ng13\ncdjango.db.models.fields\nTextField\np29\nssS''id''\np30\n(dp31\ng13\ncdjango.db.models.fields\nAutoField\np32\nsS''primary_key''\np33\nI01\nssS''public''\np34\n(dp35\ng13\ng17\nsssS''meta''\np36\n(dp37\nS''unique_together''\np38\n(lp39\nsS''pk_column''\np40\nS''id''\np41\nsS''index_together''\np42\n(lp43\nsS''db_table''\np44\nVchangedescs_changedescription\np45\nsS''db_tablespace''\np46\nS''''\nsS''__unique_together_applied''\np47\nI01\nssstRp48\n(dp49\nS''keyOrder''\np50\n(lp51\ng7\nasbsS''attachments''\np52\ng3\n(g4\ng5\n(dp53\nS''FileAttachmentHistory''\np54\n(dp55\ng9\n(dp56\nS''display_position''\np57\n(dp58\ng13\ncdjango.db.models.fields\nIntegerField\np59\nssS''latest_revision''\np60\n(dp61\ng13\ncdjblets.db.fields.relation_counter_field\nRelationCounterField\np62\nsg24\nI01\nssS''id''\np63\n(dp64\ng13\ng32\nsg33\nI01\nsssg36\n(dp65\ng38\n(lp66\nsg40\nS''id''\np67\nsg42\n(lp68\nsg44\nVattachments_fileattachmenthistory\np69\nsg46\nS''''\nsg47\nI01\nsssS''FileAttachment''\np70\n(dp71\ng9\n(dp72\nS''orig_filename''\np73\n(dp74\nS''max_length''\np75\nI256\nsg13\ncdjango.db.models.fields\nCharField\np76\nsg24\nI01\nssS''mimetype''\np77\n(dp78\ng13\ng76\nsg75\nI256\nssS''added_in_filediff''\np79\n(dp80\ng13\ng23\nsg24\nI01\nsg25\nS''diffviewer.FileDiff''\np81\nssS''attachment_revision''\np82\n(dp83\ng13\ng59\nssS''uuid''\np84\n(dp85\ng13\ng76\nsg75\nI255\nssS''repository''\np86\n(dp87\ng13\ng23\nsg24\nI01\nsg25\nS''scmtools.Repository''\np88\nssS''local_site''\np89\n(dp90\ng13\ng23\nsg24\nI01\nsg25\nS''site.LocalSite''\np91\nssS''repo_revision''\np92\n(dp93\ng75\nI64\nsg13\ng76\nsg24\nI01\nsS''db_index''\np94\nI01\nssS''draft_caption''\np95\n(dp96\ng13\ng76\nsg75\nI256\nssS''caption''\np97\n(dp98\ng13\ng76\nsg75\nI256\nssg21\n(dp99\ng13\ng23\nsg24\nI01\nsg25\nS''auth.User''\np100\nssS''file''\np101\n(dp102\ng75\nI512\nsg13\ncdjango.db.models.fields.files\nFileField\np103\nsg24\nI01\nssS''attachment_history''\np104\n(dp105\ng13\ng23\nsg24\nI01\nsg25\nS''attachments.FileAttachmentHistory''\np106\nssS''id''\np107\n(dp108\ng13\ng32\nsg33\nI01\nssS''repo_path''\np109\n(dp110\ng75\nI1024\nsg13\ng76\nsg24\nI01\nsssg36\n(dp111\ng38\n(lp112\nsg40\nS''id''\np113\nsg42\n(lp114\nsg44\nVattachments_fileattachment\np115\nsg46\nS''''\nsg47\nI01\nssstRp116\n(dp117\ng50\n(lp118\ng54\nag70\nasbsS''hostingsvcs''\np119\ng3\n(g4\ng5\n(dp120\nS''HostingServiceAccount''\np121\n(dp122\ng9\n(dp123\nS''username''\np124\n(dp125\ng13\ng76\nsg75\nI128\nssg89\n(dp126\ng13\ng23\nsg24\nI01\nsg25\nS''site.LocalSite''\np127\nssS''service_name''\np128\n(dp129\ng13\ng76\nsg75\nI128\nssS''visible''\np130\n(dp131\ng13\ng17\nssS''hosting_url''\np132\n(dp133\ng75\nI255\nsg13\ng76\nsg24\nI01\nssS''data''\np134\n(dp135\ng13\ng20\nssS''id''\np136\n(dp137\ng13\ng32\nsg33\nI01\nsssg36\n(dp138\ng38\n(lp139\nsg40\nS''id''\np140\nsg42\n(lp141\nsg44\nVhostingsvcs_hostingserviceaccount\np142\nsg46\nS''''\nsg47\nI01\nssstRp143\n(dp144\ng50\n(lp145\ng121\nasbsS''integrations''\np146\ng3\n(g4\ng5\n(dp147\nS''IntegrationConfig''\np148\n(dp149\ng9\n(dp150\nS''integration_id''\np151\n(dp152\ng13\ng76\nsg75\nI255\nsg94\nI01\nssS''last_updated''\np153\n(dp154\ng13\ng14\nssS''name''\np155\n(dp156\ng75\nI255\nsg13\ng76\nsg24\nI01\nssS''settings''\np157\n(dp158\ng13\ng20\nssg89\n(dp159\ng13\ng23\nsg24\nI01\nsg25\nS''site.LocalSite''\np160\nssS''enabled''\np161\n(dp162\ng13\ng17\nsg94\nI01\nssS''time_added''\np163\n(dp164\ng13\ng14\nssS''extra_data''\np165\n(dp166\ng13\ng20\nssS''id''\np167\n(dp168\ng13\ng32\nsg33\nI01\nsssg36\n(dp169\ng38\n(lp170\nsg40\nS''id''\np171\nsg42\n(lp172\nsg44\nVintegrations_integrationconfig\np173\nsg46\nS''''\nsg47\nI01\nssstRp174\n(dp175\ng50\n(lp176\ng148\nasbsS''accounts''\np177\ng3\n(g4\ng5\n(dp178\nS''Profile''\np179\n(dp180\ng9\n(dp181\nS''review_request_columns''\np182\n(dp183\ng13\ng76\nsg75\nI256\nssS''dashboard_columns''\np184\n(dp185\ng13\ng76\nsg75\nI256\nssS''starred_review_requests''\np186\n(dp187\ng13\ncdjango.db.models.fields.related\nManyToManyField\np188\nsg25\nS''reviews.ReviewRequest''\np189\nssS''default_use_rich_text''\np190\n(dp191\ng13\ncdjango.db.models.fields\nNullBooleanField\np192\nsg24\nI01\nssS''should_send_email''\np193\n(dp194\ng13\ng17\nssS''timezone''\np195\n(dp196\ng13\ng76\nsg75\nI30\nssS''open_an_issue''\np197\n(dp198\ng13\ng17\nssS''id''\np199\n(dp200\ng13\ng32\nsg33\nI01\nssS''sort_group_columns''\np201\n(dp202\ng13\ng76\nsg75\nI256\nssS''starred_groups''\np203\n(dp204\ng13\ng188\nsg25\nS''reviews.Group''\np205\nssS''submitter_columns''\np206\n(dp207\ng13\ng76\nsg75\nI256\nssS''collapsed_diffs''\np208\n(dp209\ng13\ng17\nssS''first_time_setup_done''\np210\n(dp211\ng13\ng17\nssS''wordwrapped_diffs''\np212\n(dp213\ng13\ng17\nssg165\n(dp214\ng13\ng20\nsg24\nI01\nssS''sort_review_request_columns''\np215\n(dp216\ng13\ng76\nsg75\nI256\nssS''show_closed''\np217\n(dp218\ng13\ng17\nssS''sort_dashboard_columns''\np219\n(dp220\ng13\ng76\nsg75\nI256\nssg21\n(dp221\ng13\ng23\nsS''unique''\np222\nI01\nsg25\nS''auth.User''\np223\nssS''should_send_own_updates''\np224\n(dp225\ng13\ng17\nssS''is_private''\np226\n(dp227\ng13\ng17\nssS''syntax_highlighting''\np228\n(dp229\ng13\ng17\nssg157\n(dp230\ng13\ng20\nsg24\nI01\nssS''sort_submitter_columns''\np231\n(dp232\ng13\ng76\nsg75\nI256\nssS''group_columns''\np233\n(dp234\ng13\ng76\nsg75\nI256\nsssg36\n(dp235\ng38\n(lp236\nsg40\nS''id''\np237\nsg42\n(lp238\nsg44\nVaccounts_profile\np239\nsg46\nS''''\nsg47\nI01\nsssS''Trophy''\np240\n(dp241\ng9\n(dp242\nS''category''\np243\n(dp244\ng13\ng76\nsg75\nI100\nssg89\n(dp245\ng13\ng23\nsg24\nI01\nsg25\nS''site.LocalSite''\np246\nssg21\n(dp247\ng13\ng23\nsg25\nS''auth.User''\np248\nssS''review_request''\np249\n(dp250\ng13\ng23\nsg25\nS''reviews.ReviewRequest''\np251\nssS''id''\np252\n(dp253\ng13\ng32\nsg33\nI01\nssS''received_date''\np254\n(dp255\ng13\ng14\nsssg36\n(dp256\ng38\n(lp257\nsg40\nS''id''\np258\nsg42\n(lp259\nsg44\nVaccounts_trophy\np260\nsg46\nS''''\nsg47\nI01\nsssS''ReviewRequestVisit''\np261\n(dp262\ng9\n(dp263\ng11\n(dp264\ng13\ng14\nssg249\n(dp265\ng13\ng23\nsg25\nS''reviews.ReviewRequest''\np266\nssS''id''\np267\n(dp268\ng13\ng32\nsg33\nI01\nssS''visibility''\np269\n(dp270\ng13\ng76\nsg75\nI1\nssg21\n(dp271\ng13\ng23\nsg25\nS''auth.User''\np272\nsssg36\n(dp273\ng38\n((Vuser\nVreview_request\nttp274\nsg40\nS''id''\np275\nsg42\n(lp276\n(Vuser\nVvisibility\ntp277\nasg44\nVaccounts_reviewrequestvisit\np278\nsg46\nS''''\nsg47\nI01\nsssS''LocalSiteProfile''\np279\n(dp280\ng9\n(dp281\nS''profile''\np282\n(dp283\ng13\ng23\nsg25\nS''accounts.Profile''\np284\nssS''direct_incoming_request_count''\np285\n(dp286\ng13\ncdjblets.db.fields.counter_field\nCounterField\np287\nsg24\nI01\nssg89\n(dp288\ng13\ng23\nsg24\nI01\nsg25\nS''site.LocalSite''\np289\nssS''starred_public_request_count''\np290\n(dp291\ng13\ng287\nsg24\nI01\nssS''total_outgoing_request_count''\np292\n(dp293\ng13\ng287\nsg24\nI01\nssS''pending_outgoing_request_count''\np294\n(dp295\ng13\ng287\nsg24\nI01\nssg21\n(dp296\ng13\ng23\nsg25\nS''auth.User''\np297\nssS''total_incoming_request_count''\np298\n(dp299\ng13\ng287\nsg24\nI01\nssS''id''\np300\n(dp301\ng13\ng32\nsg33\nI01\nssS''permissions''\np302\n(dp303\ng13\ng20\nsg24\nI01\nsssg36\n(dp304\ng38\n((Vuser\nVlocal_site\nt(Vprofile\nVlocal_site\nttp305\nsg40\nS''id''\np306\nsg42\n(lp307\nsg44\nVaccounts_localsiteprofile\np308\nsg46\nS''''\nsg47\nI01\nssstRp309\n(dp310\ng50\n(lp311\ng261\nag179\nag279\nag240\nasbsS''diffviewer''\np312\ng3\n(g4\ng5\n(dp313\nS''LegacyFileDiffData''\np314\n(dp315\ng9\n(dp316\nS''binary''\np317\n(dp318\ng13\ncdjblets.db.fields.base64_field\nBase64Field\np319\nssg165\n(dp320\ng13\ng20\nsg24\nI01\nssS''binary_hash''\np321\n(dp322\ng13\ng76\nsg75\nI40\nsg33\nI01\nsssg36\n(dp323\ng38\n(lp324\nsg40\ng321\nsg42\n(lp325\nsg44\nVdiffviewer_filediffdata\np326\nsg46\nS''''\nsg47\nI01\nsssS''DiffSet''\np327\n(dp328\ng9\n(dp329\nS''base_commit_id''\np330\n(dp331\ng75\nI64\nsg13\ng76\nsg24\nI01\nsg94\nI01\nssg155\n(dp332\ng13\ng76\nsg75\nI256\nssg86\n(dp333\ng13\ng23\nsg25\nS''scmtools.Repository''\np334\nssg11\n(dp335\ng13\ng14\nssS''basedir''\np336\n(dp337\ng13\ng76\nsg75\nI256\nssS''diffcompat''\np338\n(dp339\ng13\ng59\nssg165\n(dp340\ng13\ng20\nsg24\nI01\nssS''history''\np341\n(dp342\ng13\ng23\nsg24\nI01\nsg25\nS''diffviewer.DiffSetHistory''\np343\nssS''id''\np344\n(dp345\ng13\ng32\nsg33\nI01\nssS''revision''\np346\n(dp347\ng13\ng59\nsssg36\n(dp348\ng38\n(lp349\nsg40\nS''id''\np350\nsg42\n(lp351\nsg44\nVdiffviewer_diffset\np352\nsg46\nS''''\nsg47\nI01\nsssS''RawFileDiffData''\np353\n(dp354\ng9\n(dp355\ng317\n(dp356\ng13\ncdjango.db.models.fields\nBinaryField\np357\nssS''compression''\np358\n(dp359\ng75\nI1\nsg13\ng76\nsg24\nI01\nssS''id''\np360\n(dp361\ng13\ng32\nsg33\nI01\nssg165\n(dp362\ng13\ng20\nsg24\nI01\nssg321\n(dp363\ng75\nI40\nsg13\ng76\nsg222\nI01\nsssg36\n(dp364\ng38\n(lp365\nsg40\nS''id''\np366\nsg42\n(lp367\nsg44\nVdiffviewer_rawfilediffdata\np368\nsg46\nS''''\nsg47\nI01\nsssS''DiffSetHistory''\np369\n(dp370\ng9\n(dp371\ng11\n(dp372\ng13\ng14\nssS''last_diff_updated''\np373\n(dp374\ng13\ng14\nsg24\nI01\nssS''id''\np375\n(dp376\ng13\ng32\nsg33\nI01\nssg165\n(dp377\ng13\ng20\nsg24\nI01\nssg155\n(dp378\ng13\ng76\nsg75\nI256\nsssg36\n(dp379\ng38\n(lp380\nsg40\nS''id''\np381\nsg42\n(lp382\nsg44\nVdiffviewer_diffsethistory\np383\nsg46\nS''''\nsg47\nI01\nsssS''FileDiff''\np384\n(dp385\ng9\n(dp386\nS''status''\np387\n(dp388\ng13\ng76\nsg75\nI1\nssg317\n(dp389\ng13\ng17\nssS''diff_hash''\np390\n(dp391\ng13\ng23\nsg24\nI01\nsg25\nS''diffviewer.RawFileDiffData''\np392\nsS''db_column''\np393\nVraw_diff_hash_id\np394\nssS''diffset''\np395\n(dp396\ng13\ng23\nsg25\nS''diffviewer.DiffSet''\np397\nssS''dest_detail''\np398\n(dp399\ng13\ng76\nsg75\nI512\nssS''parent_diff_hash''\np400\n(dp401\ng13\ng23\nsg24\nI01\nsg25\nS''diffviewer.RawFileDiffData''\np402\nsg393\nVraw_parent_diff_hash_id\np403\nssS''diff64''\np404\n(dp405\ng13\ng319\nsg393\nVdiff_base64\np406\nssS''source_revision''\np407\n(dp408\ng13\ng76\nsg75\nI512\nssS''source_file''\np409\n(dp410\ng13\ng76\nsg75\nI1024\nssS''dest_file''\np411\n(dp412\ng13\ng76\nsg75\nI1024\nssS''parent_diff64''\np413\n(dp414\ng13\ng319\nsg393\nVparent_diff_base64\np415\nssS''legacy_diff_hash''\np416\n(dp417\ng13\ng23\nsg24\nI01\nsg25\nS''diffviewer.LegacyFileDiffData''\np418\nsg393\nVdiff_hash_id\np419\nssS''legacy_parent_diff_hash''\np420\n(dp421\ng13\ng23\nsg24\nI01\nsg25\nS''diffviewer.LegacyFileDiffData''\np422\nsg393\nVparent_diff_hash_id\np423\nssg165\n(dp424\ng13\ng20\nsg24\nI01\nssS''id''\np425\n(dp426\ng13\ng32\nsg33\nI01\nsssg36\n(dp427\ng38\n(lp428\nsg40\nS''id''\np429\nsg42\n(lp430\nsg44\nVdiffviewer_filediff\np431\nsg46\nS''''\nsg47\nI01\nssstRp432\n(dp433\ng50\n(lp434\ng314\nag353\nag384\nag327\nag369\nasbsS''corsheaders''\np435\ng3\n(g4\ng5\n(dp436\nS''CorsModel''\np437\n(dp438\ng9\n(dp439\nS''id''\np440\n(dp441\ng13\ng32\nsg33\nI01\nssS''cors''\np442\n(dp443\ng13\ng76\nsg75\nI255\nsssg36\n(dp444\ng38\n(lp445\nsg40\nS''id''\np446\nsg42\n(lp447\nsg44\nVcorsheaders_corsmodel\np448\nsg46\nS''''\nsg47\nI01\nssstRp449\n(dp450\ng50\n(lp451\ng437\nasbsS''privacy''\np452\ng3\n(g4\ng5\n(dp453\nS''StoredConsentData''\np454\n(dp455\ng9\n(dp456\ng153\n(dp457\ng13\ng14\nssS''consent_grants''\np458\n(dp459\ng13\ng20\nssS''audit_trail''\np460\n(dp461\ng13\ng20\nssS''audit_identifier''\np462\n(dp463\ng75\nI255\nsg13\ng76\nsg24\nI01\nsg94\nI01\nssg21\n(dp464\ng13\ncdjango.db.models.fields.related\nOneToOneField\np465\nsg222\nI01\nsg24\nI01\nsg25\nS''auth.User''\np466\nssg163\n(dp467\ng13\ng14\nssS''id''\np468\n(dp469\ng13\ng32\nsg33\nI01\nsssg36\n(dp470\ng38\n(lp471\nsg40\nS''id''\np472\nsg42\n(lp473\nsg44\nVdjblets_privacy_storedconsentdata\np474\nsg46\nS''''\nsg47\nI01\nssstRp475\n(dp476\ng50\n(lp477\ng454\nasbsS''sites''\np478\ng3\n(g4\ng5\n(dp479\nS''Site''\np480\n(dp481\ng9\n(dp482\nS''domain''\np483\n(dp484\ng13\ng76\nsg75\nI100\nssS''id''\np485\n(dp486\ng13\ng32\nsg33\nI01\nssg155\n(dp487\ng13\ng76\nsg75\nI50\nsssg36\n(dp488\ng38\n(lp489\nsg40\nS''id''\np490\nsg42\n(lp491\nsg44\nVdjango_site\np492\nsg46\nS''''\nsg47\nI01\nssstRp493\n(dp494\ng50\n(lp495\ng480\nasbsS''scmtools''\np496\ng3\n(g4\ng5\n(dp497\nS''Tool''\np498\n(dp499\ng9\n(dp500\nS''class_name''\np501\n(dp502\ng75\nI128\nsg13\ng76\nsg222\nI01\nssS''id''\np503\n(dp504\ng13\ng32\nsg33\nI01\nssg155\n(dp505\ng75\nI32\nsg13\ng76\nsg222\nI01\nsssg36\n(dp506\ng38\n(lp507\nsg40\nS''id''\np508\nsg42\n(lp509\nsg44\nVscmtools_tool\np510\nsg46\nS''''\nsg47\nI01\nsssS''Repository''\np511\n(dp512\ng9\n(dp513\ng124\n(dp514\ng13\ng76\nsg75\nI32\nssS''encrypted_password''\np515\n(dp516\ng13\ng76\nsg75\nI128\nsg393\nVpassword\np517\nssg89\n(dp518\ng13\ng23\nsg24\nI01\nsg25\nS''site.LocalSite''\np519\nssg155\n(dp520\ng13\ng76\nsg75\nI255\nssS''review_groups''\np521\n(dp522\ng13\ng188\nsg25\nS''reviews.Group''\np523\nssS''encoding''\np524\n(dp525\ng13\ng76\nsg75\nI32\nssS''archived_timestamp''\np526\n(dp527\ng13\ng14\nsg24\nI01\nssS''mirror_path''\np528\n(dp529\ng13\ng76\nsg75\nI255\nssS''archived''\np530\n(dp531\ng13\ng17\nssS''tool''\np532\n(dp533\ng13\ng23\nsg25\nS''scmtools.Tool''\np534\nssS''hosting_account''\np535\n(dp536\ng13\ng23\nsg24\nI01\nsg25\nS''hostingsvcs.HostingServiceAccount''\np537\nssg34\n(dp538\ng13\ng17\nssg130\n(dp539\ng13\ng17\nssS''hooks_uuid''\np540\n(dp541\ng75\nI32\nsg13\ng76\nsg24\nI01\nssS''raw_file_url''\np542\n(dp543\ng13\ng76\nsg75\nI255\nssS''bug_tracker''\np544\n(dp545\ng13\ng76\nsg75\nI256\nssS''path''\np546\n(dp547\ng13\ng76\nsg75\nI255\nssg165\n(dp548\ng13\ng20\nsg24\nI01\nssS''id''\np549\n(dp550\ng13\ng32\nsg33\nI01\nssS''users''\np551\n(dp552\ng13\ng188\nsg25\nS''auth.User''\np553\nsssg36\n(dp554\ng38\n((Vname\nVlocal_site\nt(Varchived_timestamp\nVpath\nVlocal_site\nt(Vhooks_uuid\nVlocal_site\nttp555\nsg40\nS''id''\np556\nsg42\n(lp557\nsg44\nVscmtools_repository\np558\nsg46\nS''''\nsg47\nI01\nssstRp559\n(dp560\ng50\n(lp561\ng498\nag511\nasbsS''contenttypes''\np562\ng3\n(g4\ng5\n(dp563\nS''ContentType''\np564\n(dp565\ng9\n(dp566\nS''model''\np567\n(dp568\ng13\ng76\nsg75\nI100\nssS''app_label''\np569\n(dp570\ng13\ng76\nsg75\nI100\nssS''id''\np571\n(dp572\ng13\ng32\nsg33\nI01\nssg155\n(dp573\ng13\ng76\nsg75\nI100\nsssg36\n(dp574\ng38\n((g569\ng567\nttp575\nsg40\nS''id''\np576\nsg42\n(lp577\nsg44\nS''django_content_type''\np578\nsg46\nS''''\nsg47\nI01\nssstRp579\n(dp580\ng50\n(lp581\ng564\nasbsS''haystack''\np582\ng3\n(g4\ng5\n(dtRp583\n(dp584\ng50\n(lp585\nsbsS''__version__''\np586\nI1\nsS''webapi''\np587\ng3\n(g4\ng5\n(dp588\nS''WebAPIToken''\np589\n(dp590\ng9\n(dp591\ng153\n(dp592\ng13\ng14\nssg89\n(dp593\ng13\ng23\nsg24\nI01\nsg25\nS''site.LocalSite''\np594\nssS''note''\np595\n(dp596\ng13\ng29\nssS''token''\np597\n(dp598\ng75\nI40\nsg13\ng76\nsg222\nI01\nssg21\n(dp599\ng13\ng23\nsg25\nS''auth.User''\np600\nssS''policy''\np601\n(dp602\ng13\ng20\nsg24\nI01\nssg163\n(dp603\ng13\ng14\nssg165\n(dp604\ng13\ng20\nsg24\nI01\nssS''id''\np605\n(dp606\ng13\ng32\nsg33\nI01\nsssg36\n(dp607\ng38\n(lp608\nsg40\nS''id''\np609\nsg42\n(lp610\nsg44\nVwebapi_webapitoken\np611\nsg46\nS''''\nsg47\nI01\nssstRp612\n(dp613\ng50\n(lp614\ng589\nasbsS''sessions''\np615\ng3\n(g4\ng5\n(dp616\nS''Session''\np617\n(dp618\ng9\n(dp619\nS''session_key''\np620\n(dp621\ng13\ng76\nsg75\nI40\nsg33\nI01\nssS''expire_date''\np622\n(dp623\ng13\ng14\nsg94\nI01\nssS''session_data''\np624\n(dp625\ng13\ng29\nsssg36\n(dp626\ng38\n(lp627\nsg40\ng620\nsg42\n(lp628\nsg44\nS''django_session''\np629\nsg46\nS''''\nsg47\nI01\nssstRp630\n(dp631\ng50\n(lp632\ng617\nasbsS''staticfiles''\np633\ng3\n(g4\ng5\n(dtRp634\n(dp635\ng50\n(lp636\nsbsS''auth''\np637\ng3\n(g4\ng5\n(dp638\nS''Group''\np639\n(dp640\ng9\n(dp641\ng302\n(dp642\ng13\ng188\nsg25\nS''auth.Permission''\np643\nssS''id''\np644\n(dp645\ng13\ng32\nsg33\nI01\nssg155\n(dp646\ng75\nI80\nsg13\ng76\nsg222\nI01\nsssg36\n(dp647\ng38\n(lp648\nsg40\nS''id''\np649\nsg42\n(lp650\nsg44\nVauth_group\np651\nsg46\nS''''\nsg47\nI01\nsssS''User''\np652\n(dp653\ng9\n(dp654\ng124\n(dp655\ng75\nI30\nsg13\ng76\nsg222\nI01\nssS''first_name''\np656\n(dp657\ng13\ng76\nsg75\nI30\nssS''last_name''\np658\n(dp659\ng13\ng76\nsg75\nI30\nssS''is_active''\np660\n(dp661\ng13\ng17\nssS''email''\np662\n(dp663\ng13\ncdjango.db.models.fields\nEmailField\np664\nsg75\nI75\nssS''is_superuser''\np665\n(dp666\ng13\ng17\nssS''is_staff''\np667\n(dp668\ng13\ng17\nssS''last_login''\np669\n(dp670\ng13\ng14\nssS''groups''\np671\n(dp672\ng13\ng188\nsg25\nS''auth.Group''\np673\nssS''user_permissions''\np674\n(dp675\ng13\ng188\nsg25\nS''auth.Permission''\np676\nssS''password''\np677\n(dp678\ng13\ng76\nsg75\nI128\nssS''id''\np679\n(dp680\ng13\ng32\nsg33\nI01\nssS''date_joined''\np681\n(dp682\ng13\ng14\nsssg36\n(dp683\ng38\n(lp684\nsg40\nS''id''\np685\nsg42\n(lp686\nsg44\nVauth_user\np687\nsg46\nS''''\nsg47\nI01\nsssS''Permission''\np688\n(dp689\ng9\n(dp690\nS''codename''\np691\n(dp692\ng13\ng76\nsg75\nI100\nssS''id''\np693\n(dp694\ng13\ng32\nsg33\nI01\nssS''content_type''\np695\n(dp696\ng13\ng23\nsg25\nS''contenttypes.ContentType''\np697\nssg155\n(dp698\ng13\ng76\nsg75\nI50\nsssg36\n(dp699\ng38\n((Vcontent_type\nVcodename\nttp700\nsg40\nS''id''\np701\nsg42\n(lp702\nsg44\nVauth_permission\np703\nsg46\nS''''\nsg47\nI01\nssstRp704\n(dp705\ng50\n(lp706\ng688\nag639\nag652\nasbsS''site''\np707\ng3\n(g4\ng5\n(dp708\nS''LocalSite''\np709\n(dp710\ng9\n(dp711\ng551\n(dp712\ng13\ng188\nsg25\nS''auth.User''\np713\nssS''id''\np714\n(dp715\ng13\ng32\nsg33\nI01\nssS''admins''\np716\n(dp717\ng13\ng188\nsg25\nS''auth.User''\np718\nssg165\n(dp719\ng13\ng20\nsg24\nI01\nssg34\n(dp720\ng13\ng17\nssg155\n(dp721\ng75\nI32\nsg13\ncdjango.db.models.fields\nSlugField\np722\nsg222\nI01\nsg94\nI01\nsssg36\n(dp723\ng38\n(lp724\nsg40\nS''id''\np725\nsg42\n(lp726\nsg44\nVsite_localsite\np727\nsg46\nS''''\nsg47\nI01\nssstRp728\n(dp729\ng50\n(lp730\ng709\nasbsS''notifications''\np731\ng3\n(g4\ng5\n(dp732\nS''WebHookTarget''\np733\n(dp734\ng9\n(dp735\ng89\n(dp736\ng13\ng23\nsg24\nI01\nsg25\nS''site.LocalSite''\np737\nssg524\n(dp738\ng13\ng76\nsg75\nI40\nssS''url''\np739\n(dp740\ng13\ncdjango.db.models.fields\nURLField\np741\nsg75\nI200\nssS''repositories''\np742\n(dp743\ng13\ng188\nsg24\nI01\nsg25\nS''scmtools.Repository''\np744\nssS''custom_content''\np745\n(dp746\ng13\ng29\nsg24\nI01\nssg161\n(dp747\ng13\ng17\nssS''events''\np748\n(dp749\ng13\ncmultiselectfield.db.fields\nMultiSelectField\np750\nsg75\nI105\nssS''secret''\np751\n(dp752\ng13\ng76\nsg75\nI128\nssS''use_custom_content''\np753\n(dp754\ng13\ng17\nssS''apply_to''\np755\n(dp756\ng13\ng76\nsg75\nI1\nssg165\n(dp757\ng13\ng20\nsg24\nI01\nssS''id''\np758\n(dp759\ng13\ng32\nsg33\nI01\nsssg36\n(dp760\ng38\n(lp761\nsg40\nS''id''\np762\nsg42\n(lp763\nsg44\nVnotifications_webhooktarget\np764\nsg46\nS''''\nsg47\nI01\nssstRp765\n(dp766\ng50\n(lp767\ng733\nasbsS''oauth''\np768\ng3\n(g4\ng5\n(dp769\nS''Application''\np770\n(dp771\ng9\n(dp772\nS''redirect_uris''\np773\n(dp774\ng13\ng29\nssg155\n(dp775\ng13\ng76\nsg75\nI255\nssg89\n(dp776\ng13\ng23\nsg24\nI01\nsg25\nS''site.LocalSite''\np777\nssg161\n(dp778\ng13\ng17\nssS''client_type''\np779\n(dp780\ng13\ng76\nsg75\nI32\nssg21\n(dp781\ng13\ng23\nsg25\nS''auth.User''\np782\nssS''client_id''\np783\n(dp784\ng75\nI100\nsg13\ng76\nsg222\nI01\nsg94\nI01\nssS''skip_authorization''\np785\n(dp786\ng13\ng17\nssS''client_secret''\np787\n(dp788\ng13\ng76\nsg75\nI255\nsg94\nI01\nssg165\n(dp789\ng13\ng20\nsg24\nI01\nssS''original_user''\np790\n(dp791\ng13\ng23\nsg24\nI01\nsg25\nS''auth.User''\np792\nssS''id''\np793\n(dp794\ng13\ng32\nsg33\nI01\nssS''authorization_grant_type''\np795\n(dp796\ng13\ng76\nsg75\nI32\nsssg36\n(dp797\ng38\n(lp798\nsg40\nS''id''\np799\nsg42\n(lp800\nsg44\nVreviewboard_oauth_application\np801\nsg46\nS''''\nsg47\nI01\nssstRp802\n(dp803\ng50\n(lp804\ng770\nasbsS''oauth2_provider''\np805\ng3\n(g4\ng5\n(dp806\ng770\n(dp807\ng9\n(dp808\ng773\n(dp809\ng13\ng29\nssg155\n(dp810\ng13\ng76\nsg75\nI255\nssg779\n(dp811\ng13\ng76\nsg75\nI32\nssg21\n(dp812\ng13\ng23\nsg25\nS''auth.User''\np813\nssg783\n(dp814\ng75\nI100\nsg13\ng76\nsg222\nI01\nsg94\nI01\nssg785\n(dp815\ng13\ng17\nssg787\n(dp816\ng13\ng76\nsg75\nI255\nsg94\nI01\nssS''id''\np817\n(dp818\ng13\ng32\nsg33\nI01\nssg795\n(dp819\ng13\ng76\nsg75\nI32\nsssg36\n(dp820\ng38\n(lp821\nsg40\nS''id''\np822\nsg42\n(lp823\nsg44\nVoauth2_provider_application\np824\nsg46\nS''''\nsg47\nI01\nsssS''RefreshToken''\np825\n(dp826\ng9\n(dp827\nS''access_token''\np828\n(dp829\ng13\ng465\nsg222\nI01\nsg25\nS''oauth2_provider.AccessToken''\np830\nssS''application''\np831\n(dp832\ng13\ng23\nsg25\nS''oauth.Application''\np833\nssg597\n(dp834\ng13\ng76\nsg75\nI255\nsg94\nI01\nssS''id''\np835\n(dp836\ng13\ng32\nsg33\nI01\nssg21\n(dp837\ng13\ng23\nsg25\nS''auth.User''\np838\nsssg36\n(dp839\ng38\n(lp840\nsg40\nS''id''\np841\nsg42\n(lp842\nsg44\nVoauth2_provider_refreshtoken\np843\nsg46\nS''''\nsg47\nI01\nsssS''AccessToken''\np844\n(dp845\ng9\n(dp846\nS''expires''\np847\n(dp848\ng13\ng14\nssg831\n(dp849\ng13\ng23\nsg25\nS''oauth.Application''\np850\nssg597\n(dp851\ng13\ng76\nsg75\nI255\nsg94\nI01\nssg21\n(dp852\ng13\ng23\nsg24\nI01\nsg25\nS''auth.User''\np853\nssS''scope''\np854\n(dp855\ng13\ng29\nssS''id''\np856\n(dp857\ng13\ng32\nsg33\nI01\nsssg36\n(dp858\ng38\n(lp859\nsg40\nS''id''\np860\nsg42\n(lp861\nsg44\nVoauth2_provider_accesstoken\np862\nsg46\nS''''\nsg47\nI01\nsssS''Grant''\np863\n(dp864\ng9\n(dp865\nS''code''\np866\n(dp867\ng13\ng76\nsg75\nI255\nsg94\nI01\nssg847\n(dp868\ng13\ng14\nssg831\n(dp869\ng13\ng23\nsg25\nS''oauth.Application''\np870\nssS''redirect_uri''\np871\n(dp872\ng13\ng76\nsg75\nI255\nssg21\n(dp873\ng13\ng23\nsg25\nS''auth.User''\np874\nssg854\n(dp875\ng13\ng29\nssS''id''\np876\n(dp877\ng13\ng32\nsg33\nI01\nsssg36\n(dp878\ng38\n(lp879\nsg40\nS''id''\np880\nsg42\n(lp881\nsg44\nVoauth2_provider_grant\np882\nsg46\nS''''\nsg47\nI01\nssstRp883\n(dp884\ng50\n(lp885\ng770\nag863\nag844\nag825\nasbsS''admin''\np886\ng3\n(g4\ng5\n(dp887\nS''LogEntry''\np888\n(dp889\ng9\n(dp890\nS''action_flag''\np891\n(dp892\ng13\ncdjango.db.models.fields\nPositiveSmallIntegerField\np893\nssS''action_time''\np894\n(dp895\ng13\ng14\nssS''object_repr''\np896\n(dp897\ng13\ng76\nsg75\nI200\nssS''object_id''\np898\n(dp899\ng13\ng29\nsg24\nI01\nssS''change_message''\np900\n(dp901\ng13\ng29\nssg21\n(dp902\ng13\ng23\nsg25\nS''auth.User''\np903\nssg695\n(dp904\ng13\ng23\nsg24\nI01\nsg25\nS''contenttypes.ContentType''\np905\nssS''id''\np906\n(dp907\ng13\ng32\nsg33\nI01\nsssg36\n(dp908\ng38\n(lp909\nsg40\nS''id''\np910\nsg42\n(lp911\nsg44\nVdjango_admin_log\np912\nsg46\nS''''\nsg47\nI01\nssstRp913\n(dp914\ng50\n(lp915\ng888\nasbsS''siteconfig''\np916\ng3\n(g4\ng5\n(dp917\nS''SiteConfiguration''\np918\n(dp919\ng9\n(dp920\nS''version''\np921\n(dp922\ng13\ng76\nsg75\nI20\nssS''id''\np923\n(dp924\ng13\ng32\nsg33\nI01\nssg157\n(dp925\ng13\ng20\nssS''site''\np926\n(dp927\ng13\ng23\nsg25\nS''sites.Site''\np928\nsssg36\n(dp929\ng38\n(lp930\nsg40\nS''id''\np931\nsg42\n(lp932\nsg44\nVsiteconfig_siteconfiguration\np933\nsg46\nS''''\nsg47\nI01\nssstRp934\n(dp935\ng50\n(lp936\ng918\nasbsS''reviews''\np937\ng3\n(g4\ng5\n(dp938\nS''Comment''\np939\n(dp940\ng9\n(dp941\nS''issue_opened''\np942\n(dp943\ng13\ng17\nssS''interfilediff''\np944\n(dp945\ng13\ng23\nsg24\nI01\nsg25\nS''diffviewer.FileDiff''\np946\nssS''num_lines''\np947\n(dp948\ng13\ncdjango.db.models.fields\nPositiveIntegerField\np949\nsg24\nI01\nssg11\n(dp950\ng13\ng14\nssg15\n(dp951\ng13\ng17\nssg27\n(dp952\ng13\ng29\nssS''reply_to''\np953\n(dp954\ng13\ng23\nsg24\nI01\nsg25\nS''reviews.Comment''\np955\nssS''first_line''\np956\n(dp957\ng13\ng949\nsg24\nI01\nssg165\n(dp958\ng13\ng20\nsg24\nI01\nssS''id''\np959\n(dp960\ng13\ng32\nsg33\nI01\nssS''issue_status''\np961\n(dp962\ng75\nI1\nsg13\ng76\nsg24\nI01\nsg94\nI01\nssS''filediff''\np963\n(dp964\ng13\ng23\nsg25\nS''diffviewer.FileDiff''\np965\nsssg36\n(dp966\ng38\n(lp967\nsg40\nS''id''\np968\nsg42\n(lp969\nsg44\nVreviews_comment\np970\nsg46\nS''''\nsg47\nI01\nsssg639\n(dp971\ng9\n(dp972\ng165\n(dp973\ng13\ng20\nsg24\nI01\nssS''display_name''\np974\n(dp975\ng13\ng76\nsg75\nI64\nssg155\n(dp976\ng13\ng722\nsg75\nI64\nsg94\nI01\nssg89\n(dp977\ng13\ng23\nsg24\nI01\nsg25\nS''site.LocalSite''\np978\nssS''incoming_request_count''\np979\n(dp980\ng13\ng287\nsg24\nI01\nssS''is_default_group''\np981\n(dp982\ng13\ng17\nssg130\n(dp983\ng13\ng17\nssS''invite_only''\np984\n(dp985\ng13\ng17\nssS''email_list_only''\np986\n(dp987\ng13\ng17\nssS''id''\np988\n(dp989\ng13\ng32\nsg33\nI01\nssS''mailing_list''\np990\n(dp991\ng13\ng76\nsg75\nI254\nssg551\n(dp992\ng13\ng188\nsg25\nS''auth.User''\np993\nsssg36\n(dp994\ng38\n((Vname\nVlocal_site\nttp995\nsg40\nS''id''\np996\nsg42\n(lp997\nsg44\nVreviews_group\np998\nsg46\nS''''\nsg47\nI01\nsssS''Screenshot''\np999\n(dp1000\ng9\n(dp1001\ng97\n(dp1002\ng13\ng76\nsg75\nI256\nssS''image''\np1003\n(dp1004\ng13\ncdjango.db.models.fields.files\nImageField\np1005\nsg75\nI100\nssS''id''\np1006\n(dp1007\ng13\ng32\nsg33\nI01\nssg95\n(dp1008\ng13\ng76\nsg75\nI256\nsssg36\n(dp1009\ng38\n(lp1010\nsg40\nS''id''\np1011\nsg42\n(lp1012\nsg44\nVreviews_screenshot\np1013\nsg46\nS''''\nsg47\nI01\nsssS''FileAttachmentComment''\np1014\n(dp1015\ng9\n(dp1016\ng942\n(dp1017\ng13\ng17\nssg11\n(dp1018\ng13\ng14\nssS''diff_against_file_attachment''\np1019\n(dp1020\ng13\ng23\nsg24\nI01\nsg25\nS''attachments.FileAttachment''\np1021\nssg15\n(dp1022\ng13\ng17\nssS''file_attachment''\np1023\n(dp1024\ng13\ng23\nsg25\nS''attachments.FileAttachment''\np1025\nssg27\n(dp1026\ng13\ng29\nssg953\n(dp1027\ng13\ng23\nsg24\nI01\nsg25\nS''reviews.FileAttachmentComment''\np1028\nssg165\n(dp1029\ng13\ng20\nsg24\nI01\nssS''id''\np1030\n(dp1031\ng13\ng32\nsg33\nI01\nssg961\n(dp1032\ng75\nI1\nsg13\ng76\nsg24\nI01\nsg94\nI01\nsssg36\n(dp1033\ng38\n(lp1034\nsg40\nS''id''\np1035\nsg42\n(lp1036\nsg44\nVreviews_fileattachmentcomment\np1037\nsg46\nS''''\nsg47\nI01\nsssS''Review''\np1038\n(dp1039\ng9\n(dp1040\nS''ship_it''\np1041\n(dp1042\ng13\ng17\nssS''base_reply_to''\np1043\n(dp1044\ng13\ng23\nsg24\nI01\nsg25\nS''reviews.Review''\np1045\nssS''email_message_id''\np1046\n(dp1047\ng75\nI255\nsg13\ng76\nsg24\nI01\nssS''id''\np1048\n(dp1049\ng13\ng32\nsg33\nI01\nssS''body_top_rich_text''\np1050\n(dp1051\ng13\ng17\nssS''comments''\np1052\n(dp1053\ng13\ng188\nsg25\nS''reviews.Comment''\np1054\nssS''reviewed_diffset''\np1055\n(dp1056\ng13\ng23\nsg24\nI01\nsg25\nS''diffviewer.DiffSet''\np1057\nssg165\n(dp1058\ng13\ng20\nsg24\nI01\nssg249\n(dp1059\ng13\ng23\nsg25\nS''reviews.ReviewRequest''\np1060\nssg15\n(dp1061\ng13\ng17\nssS''file_attachment_comments''\np1062\n(dp1063\ng13\ng188\nsg25\nS''reviews.FileAttachmentComment''\np1064\nssg11\n(dp1065\ng13\ng14\nssS''general_comments''\np1066\n(dp1067\ng13\ng188\nsg25\nS''reviews.GeneralComment''\np1068\nssS''screenshot_comments''\np1069\n(dp1070\ng13\ng188\nsg25\nS''reviews.ScreenshotComment''\np1071\nssg21\n(dp1072\ng13\ng23\nsg25\nS''auth.User''\np1073\nssS''time_emailed''\np1074\n(dp1075\ng13\ng14\nsg24\nI01\nssS''body_bottom_reply_to''\np1076\n(dp1077\ng13\ng23\nsg24\nI01\nsg25\nS''reviews.Review''\np1078\nssS''body_top''\np1079\n(dp1080\ng13\ng29\nssS''body_bottom_rich_text''\np1081\n(dp1082\ng13\ng17\nssg34\n(dp1083\ng13\ng17\nssS''body_bottom''\np1084\n(dp1085\ng13\ng29\nssS''body_top_reply_to''\np1086\n(dp1087\ng13\ng23\nsg24\nI01\nsg25\nS''reviews.Review''\np1088\nsssg36\n(dp1089\ng38\n(lp1090\nsg40\nS''id''\np1091\nsg42\n(lp1092\nsg44\nVreviews_review\np1093\nsg46\nS''''\nsg47\nI01\nsssS''ReviewRequestDraft''\np1094\n(dp1095\ng9\n(dp1096\ng153\n(dp1097\ng13\ncdjblets.db.fields.modification_timestamp_field\nModificationTimestampField\np1098\nssS''target_people''\np1099\n(dp1100\ng13\ng188\nsg25\nS''auth.User''\np1101\nssS''inactive_screenshots''\np1102\n(dp1103\ng13\ng188\nsg25\nS''reviews.Screenshot''\np1104\nssS''file_attachments''\np1105\n(dp1106\ng13\ng188\nsg25\nS''attachments.FileAttachment''\np1107\nssS''owner''\np1108\n(dp1109\ng13\ng23\nsg24\nI01\nsg25\nS''auth.User''\np1110\nssS''changedesc''\np1111\n(dp1112\ng13\ng23\nsg24\nI01\nsg25\nS''changedescs.ChangeDescription''\np1113\nssS''screenshots''\np1114\n(dp1115\ng13\ng188\nsg25\nS''reviews.Screenshot''\np1116\nssS''id''\np1117\n(dp1118\ng13\ng32\nsg33\nI01\nssS''inactive_file_attachments_count''\np1119\n(dp1120\ng13\ng62\nsg24\nI01\nssS''bugs_closed''\np1121\n(dp1122\ng13\ng76\nsg75\nI300\nssS''testing_done''\np1123\n(dp1124\ng13\ng29\nssS''description_rich_text''\np1125\n(dp1126\ng13\ng17\nssS''depends_on''\np1127\n(dp1128\ng13\ng188\nsg24\nI01\nsg25\nS''reviews.ReviewRequest''\np1129\nssg165\n(dp1130\ng13\ng20\nsg24\nI01\nssg249\n(dp1131\ng13\ng23\nsg222\nI01\nsg25\nS''reviews.ReviewRequest''\np1132\nssg15\n(dp1133\ng13\ng17\nssS''commit_id''\np1134\n(dp1135\ng75\nI64\nsg13\ng76\nsg24\nI01\nsg94\nI01\nssS''file_attachments_count''\np1136\n(dp1137\ng13\ng62\nsg24\nI01\nssS''description''\np1138\n(dp1139\ng13\ng29\nssS''inactive_screenshots_count''\np1140\n(dp1141\ng13\ng62\nsg24\nI01\nssS''inactive_file_attachments''\np1142\n(dp1143\ng13\ng188\nsg25\nS''attachments.FileAttachment''\np1144\nssS''branch''\np1145\n(dp1146\ng13\ng76\nsg75\nI300\nssS''testing_done_rich_text''\np1147\n(dp1148\ng13\ng17\nssg395\n(dp1149\ng13\ng23\nsg24\nI01\nsg25\nS''diffviewer.DiffSet''\np1150\nssS''target_groups''\np1151\n(dp1152\ng13\ng188\nsg25\nS''reviews.Group''\np1153\nssS''summary''\np1154\n(dp1155\ng13\ng76\nsg75\nI300\nssS''screenshots_count''\np1156\n(dp1157\ng13\ng62\nsg24\nI01\nsssg36\n(dp1158\ng38\n(lp1159\nsg40\nS''id''\np1160\nsg42\n(lp1161\nsg44\nVreviews_reviewrequestdraft\np1162\nsg46\nS''''\nsg47\nI01\nsssS''GeneralComment''\np1163\n(dp1164\ng9\n(dp1165\ng942\n(dp1166\ng13\ng17\nssg11\n(dp1167\ng13\ng14\nssg15\n(dp1168\ng13\ng17\nssg27\n(dp1169\ng13\ng29\nssg953\n(dp1170\ng13\ng23\nsg24\nI01\nsg25\nS''reviews.GeneralComment''\np1171\nssg165\n(dp1172\ng13\ng20\nsg24\nI01\nssS''id''\np1173\n(dp1174\ng13\ng32\nsg33\nI01\nssg961\n(dp1175\ng75\nI1\nsg13\ng76\nsg24\nI01\nsg94\nI01\nsssg36\n(dp1176\ng38\n(lp1177\nsg40\nS''id''\np1178\nsg42\n(lp1179\nsg44\nVreviews_generalcomment\np1180\nsg46\nS''''\nsg47\nI01\nsssS''ReviewRequest''\np1181\n(dp1182\ng9\n(dp1183\nS''issue_verifying_count''\np1184\n(dp1185\ng13\ng287\nsg24\nI01\nssg387\n(dp1186\ng13\ng76\nsg75\nI1\nsg94\nI01\nssg153\n(dp1187\ng13\ng1098\nssg1099\n(dp1188\ng13\ng188\nsg25\nS''auth.User''\np1189\nssS''changedescs''\np1190\n(dp1191\ng13\ng188\nsg25\nS''changedescs.ChangeDescription''\np1192\nssg1102\n(dp1193\ng13\ng188\nsg25\nS''reviews.Screenshot''\np1194\nssg1046\n(dp1195\ng75\nI255\nsg13\ng76\nsg24\nI01\nssS''last_review_activity_timestamp''\np1196\n(dp1197\ng13\ng14\nsg24\nI01\nsg393\nVlast_review_timestamp\np1198\nssS''diffset_history''\np1199\n(dp1200\ng13\ng23\nsg25\nS''diffviewer.DiffSetHistory''\np1201\nssg1114\n(dp1202\ng13\ng188\nsg25\nS''reviews.Screenshot''\np1203\nssS''id''\np1204\n(dp1205\ng13\ng32\nsg33\nI01\nssS''issue_dropped_count''\np1206\n(dp1207\ng13\ng287\nsg24\nI01\nssg1119\n(dp1208\ng13\ng62\nsg24\nI01\nssg1121\n(dp1209\ng13\ng76\nsg75\nI300\nssg1123\n(dp1210\ng13\ng29\nssg1125\n(dp1211\ng13\ng17\nssg1127\n(dp1212\ng13\ng188\nsg24\nI01\nsg25\nS''reviews.ReviewRequest''\np1213\nssg163\n(dp1214\ng13\ng14\nssg165\n(dp1215\ng13\ng20\nsg24\nI01\nssg34\n(dp1216\ng13\ng17\nssg1134\n(dp1217\ng75\nI64\nsg13\ng76\nsg24\nI01\nsg94\nI01\nssS''shipit_count''\np1218\n(dp1219\ng13\ng287\nsg24\nI01\nssg1136\n(dp1220\ng13\ng62\nsg24\nI01\nssg1138\n(dp1221\ng13\ng29\nssg86\n(dp1222\ng13\ng23\nsg24\nI01\nsg25\nS''scmtools.Repository''\np1223\nssg1140\n(dp1224\ng13\ng62\nsg24\nI01\nssS''issue_resolved_count''\np1225\n(dp1226\ng13\ng287\nsg24\nI01\nssS''issue_open_count''\np1227\n(dp1228\ng13\ng287\nsg24\nI01\nssg1142\n(dp1229\ng13\ng188\nsg25\nS''attachments.FileAttachment''\np1230\nssg1145\n(dp1231\ng13\ng76\nsg75\nI300\nssS''file_attachment_histories''\np1232\n(dp1233\ng13\ng188\nsg25\nS''attachments.FileAttachmentHistory''\np1234\nssg1147\n(dp1235\ng13\ng17\nssg89\n(dp1236\ng13\ng23\nsg24\nI01\nsg25\nS''site.LocalSite''\np1237\nssg1151\n(dp1238\ng13\ng188\nsg25\nS''reviews.Group''\np1239\nssg1154\n(dp1240\ng13\ng76\nsg75\nI300\nssS''changenum''\np1241\n(dp1242\ng13\ng949\nsg24\nI01\nsg94\nI01\nssS''local_id''\np1243\n(dp1244\ng13\ng59\nsg24\nI01\nssS''submitter''\np1245\n(dp1246\ng13\ng23\nsg25\nS''auth.User''\np1247\nssg1074\n(dp1248\ng13\ng14\nsg24\nI01\nssg15\n(dp1249\ng13\ng17\nssg1156\n(dp1250\ng13\ng62\nsg24\nI01\nssg1105\n(dp1251\ng13\ng188\nsg25\nS''attachments.FileAttachment''\np1252\nsssg36\n(dp1253\ng38\n((Vcommit_id\nVrepository\nt(Vchangenum\nVrepository\nt(Vlocal_site\nVlocal_id\nttp1254\nsg40\nS''id''\np1255\nsg42\n(lp1256\nsg44\nVreviews_reviewrequest\np1257\nsg46\nS''''\nsg47\nI01\nsssS''StatusUpdate''\np1258\n(dp1259\ng9\n(dp1260\nS''change_description''\np1261\n(dp1262\ng13\ng23\nsg24\nI01\nsg25\nS''changedescs.ChangeDescription''\np1263\nssS''url_text''\np1264\n(dp1265\ng13\ng76\nsg75\nI64\nssg1138\n(dp1266\ng13\ng76\nsg75\nI255\nssg739\n(dp1267\ng13\ng741\nsg75\nI255\nssg11\n(dp1268\ng13\ng14\nssS''review''\np1269\n(dp1270\ng13\ng465\nsg222\nI01\nsg24\nI01\nsg25\nS''reviews.Review''\np1271\nssg1154\n(dp1272\ng13\ng76\nsg75\nI255\nssS''state''\np1273\n(dp1274\ng13\ng76\nsg75\nI1\nssg21\n(dp1275\ng13\ng23\nsg24\nI01\nsg25\nS''auth.User''\np1276\nssS''timeout''\np1277\n(dp1278\ng13\ng59\nsg24\nI01\nssS''service_id''\np1279\n(dp1280\ng13\ng76\nsg75\nI255\nssg165\n(dp1281\ng13\ng20\nsg24\nI01\nssg249\n(dp1282\ng13\ng23\nsg25\nS''reviews.ReviewRequest''\np1283\nssS''id''\np1284\n(dp1285\ng13\ng32\nsg33\nI01\nsssg36\n(dp1286\ng38\n(lp1287\nsg40\nS''id''\np1288\nsg42\n(lp1289\nsg44\nVreviews_statusupdate\np1290\nsg46\nS''''\nsg47\nI01\nsssS''DefaultReviewer''\np1291\n(dp1292\ng9\n(dp1293\nS''file_regex''\np1294\n(dp1295\ng13\ng76\nsg75\nI256\nssg155\n(dp1296\ng13\ng76\nsg75\nI64\nssg86\n(dp1297\ng13\ng188\nsg25\nS''scmtools.Repository''\np1298\nssg89\n(dp1299\ng13\ng23\nsg24\nI01\nsg25\nS''site.LocalSite''\np1300\nssS''people''\np1301\n(dp1302\ng13\ng188\nsg25\nS''auth.User''\np1303\nssg671\n(dp1304\ng13\ng188\nsg25\nS''reviews.Group''\np1305\nssS''id''\np1306\n(dp1307\ng13\ng32\nsg33\nI01\nsssg36\n(dp1308\ng38\n(lp1309\nsg40\nS''id''\np1310\nsg42\n(lp1311\nsg44\nVreviews_defaultreviewer\np1312\nsg46\nS''''\nsg47\nI01\nsssS''ScreenshotComment''\np1313\n(dp1314\ng9\n(dp1315\ng942\n(dp1316\ng13\ng17\nssS''screenshot''\np1317\n(dp1318\ng13\ng23\nsg25\nS''reviews.Screenshot''\np1319\nssg11\n(dp1320\ng13\ng14\nssg15\n(dp1321\ng13\ng17\nssS''y''\n(dp1322\ng13\ng893\nssS''h''\n(dp1323\ng13\ng893\nssS''w''\n(dp1324\ng13\ng893\nssg27\n(dp1325\ng13\ng29\nssg953\n(dp1326\ng13\ng23\nsg24\nI01\nsg25\nS''reviews.ScreenshotComment''\np1327\nssS''x''\n(dp1328\ng13\ng893\nsg24\nI01\nssg165\n(dp1329\ng13\ng20\nsg24\nI01\nssS''id''\np1330\n(dp1331\ng13\ng32\nsg33\nI01\nssg961\n(dp1332\ng75\nI1\nsg13\ng76\nsg24\nI01\nsg94\nI01\nsssg36\n(dp1333\ng38\n(lp1334\nsg40\nS''id''\np1335\nsg42\n(lp1336\nsg44\nVreviews_screenshotcomment\np1337\nsg46\nS''''\nsg47\nI01\nssstRp1338\n(dp1339\ng50\n(lp1340\ng639\nag1291\nag939\nag1014\nag1163\nag999\nag1181\nag1313\nag1038\nag1094\nag1258\nasbsS''extensions''\np1341\ng3\n(g4\ng5\n(dp1342\nS''RegisteredExtension''\np1343\n(dp1344\ng9\n(dp1345\ng155\n(dp1346\ng13\ng76\nsg75\nI32\nssg157\n(dp1347\ng13\ng20\nssg501\n(dp1348\ng75\nI128\nsg13\ng76\nsg222\nI01\nssg161\n(dp1349\ng13\ng17\nssS''installed''\np1350\n(dp1351\ng13\ng17\nssS''id''\np1352\n(dp1353\ng13\ng32\nsg33\nI01\nsssg36\n(dp1354\ng38\n(lp1355\nsg40\nS''id''\np1356\nsg42\n(lp1357\nsg44\nVextensions_registeredextension\np1358\nsg46\nS''''\nsg47\nI01\nssstRp1359\n(dp1360\ng50\n(lp1361\ng1343\nasbsS''django_evolution''\np1362\ng3\n(g4\ng5\n(dp1363\nS''Evolution''\np1364\n(dp1365\ng9\n(dp1366\nS''label''\np1367\n(dp1368\ng13\ng76\nsg75\nI100\nssg921\n(dp1369\ng13\ng23\nsg25\nS''django_evolution.Version''\np1370\nssS''id''\np1371\n(dp1372\ng13\ng32\nsg33\nI01\nssg569\n(dp1373\ng13\ng76\nsg75\nI200\nsssg36\n(dp1374\ng38\n(lp1375\nsg40\nS''id''\np1376\nsg42\n(lp1377\nsg44\nS''django_evolution''\np1378\nsg46\nS''''\nsg47\nI01\nsssS''Version''\np1379\n(dp1380\ng9\n(dp1381\nS''when''\np1382\n(dp1383\ng13\ng14\nssS''id''\np1384\n(dp1385\ng13\ng32\nsg33\nI01\nssS''signature''\np1386\n(dp1387\ng13\ng29\nsssg36\n(dp1388\ng38\n(lp1389\nsg40\nS''id''\np1390\nsg42\n(lp1391\nsg44\nS''django_project_version''\np1392\nsg46\nS''''\nsg47\nI01\nssstRp1393\n(dp1394\ng50\n(lp1395\ng1379\nag1364\nasbs.','\n',char(10)),'2022-05-16 00:51:43.438145');
CREATE TABLE IF NOT EXISTS "django_evolution" (
    "id" integer NOT NULL PRIMARY KEY,
    "version_id" integer NOT NULL REFERENCES "django_project_version" ("id"),
    "app_label" varchar(200) NOT NULL,
    "label" varchar(100) NOT NULL
);
INSERT INTO django_evolution VALUES(1,1,'auth','auth_delete_message');
INSERT INTO django_evolution VALUES(2,1,'auth','auth_unique_together_baseline');
INSERT INTO django_evolution VALUES(3,1,'contenttypes','contenttypes_unique_together_baseline');
INSERT INTO django_evolution VALUES(4,1,'sessions','session_expire_date_db_index');
INSERT INTO django_evolution VALUES(5,1,'extensions','update_app_label');
INSERT INTO django_evolution VALUES(6,1,'privacy','audit_indentifier');
INSERT INTO django_evolution VALUES(7,1,'siteconfig','update_app_label');
INSERT INTO django_evolution VALUES(8,1,'accounts','is_private');
INSERT INTO django_evolution VALUES(9,1,'accounts','timezone');
INSERT INTO django_evolution VALUES(10,1,'accounts','open_an_issue');
INSERT INTO django_evolution VALUES(11,1,'accounts','extra_data');
INSERT INTO django_evolution VALUES(12,1,'accounts','timezone_length_30');
INSERT INTO django_evolution VALUES(13,1,'accounts','localsiteprofile_permissions');
INSERT INTO django_evolution VALUES(14,1,'accounts','unique_together_baseline');
INSERT INTO django_evolution VALUES(15,1,'accounts','profile_show_closed');
INSERT INTO django_evolution VALUES(16,1,'accounts','profile_should_send_email');
INSERT INTO django_evolution VALUES(17,1,'accounts','profile_should_send_own_updates');
INSERT INTO django_evolution VALUES(18,1,'accounts','profile_default_use_rich_text');
INSERT INTO django_evolution VALUES(19,1,'accounts','reviewrequestvisit_visibility');
INSERT INTO django_evolution VALUES(20,1,'accounts','profile_settings');
INSERT INTO django_evolution VALUES(21,1,'attachments','file_attachment_orig_filename');
INSERT INTO django_evolution VALUES(22,1,'attachments','file_attachment_file_max_length_512');
INSERT INTO django_evolution VALUES(23,1,'attachments','file_attachment_repo_info');
INSERT INTO django_evolution VALUES(24,1,'attachments','file_attachment_repo_path_no_index');
INSERT INTO django_evolution VALUES(25,1,'attachments','file_attachment_repo_revision_max_length_64');
INSERT INTO django_evolution VALUES(26,1,'attachments','file_attachment_revision');
INSERT INTO django_evolution VALUES(27,1,'attachments','file_attachment_ownership');
INSERT INTO django_evolution VALUES(28,1,'attachments','file_attachment_uuid');
INSERT INTO django_evolution VALUES(29,1,'changedescs','rich_text');
INSERT INTO django_evolution VALUES(30,1,'changedescs','changedesc_user');
INSERT INTO django_evolution VALUES(31,1,'diffviewer','add_parent_diffs');
INSERT INTO django_evolution VALUES(32,1,'diffviewer','filediff_filenames_1024_chars');
INSERT INTO django_evolution VALUES(33,1,'diffviewer','diffset_basedir');
INSERT INTO django_evolution VALUES(34,1,'diffviewer','filediff_status');
INSERT INTO django_evolution VALUES(35,1,'diffviewer','add_diff_hash');
INSERT INTO django_evolution VALUES(36,1,'diffviewer','diffsethistory_diff_updated');
INSERT INTO django_evolution VALUES(37,1,'diffviewer','filediffdata_line_counts');
INSERT INTO django_evolution VALUES(38,1,'diffviewer','diffset_base_commit_id');
INSERT INTO django_evolution VALUES(39,1,'diffviewer','filediffdata_extra_data');
INSERT INTO django_evolution VALUES(40,1,'diffviewer','all_extra_data');
INSERT INTO django_evolution VALUES(41,1,'diffviewer','raw_diff_file_data');
INSERT INTO django_evolution VALUES(42,1,'hostingsvcs','account_hosting_url');
INSERT INTO django_evolution VALUES(43,1,'hostingsvcs','account_hosting_url_max_length_255');
INSERT INTO django_evolution VALUES(44,1,'hostingsvcs','account_unique_together_baseline');
INSERT INTO django_evolution VALUES(45,1,'notifications','webhooktarget_extra_state');
INSERT INTO django_evolution VALUES(46,1,'notifications','webhooktarget_extra_data_null');
INSERT INTO django_evolution VALUES(47,1,'oauth','disabled_for_security');
INSERT INTO django_evolution VALUES(48,1,'reviews','change_descriptions');
INSERT INTO django_evolution VALUES(49,1,'reviews','last_review_timestamp');
INSERT INTO django_evolution VALUES(50,1,'reviews','shipit_count');
INSERT INTO django_evolution VALUES(51,1,'reviews','default_reviewer_repositories');
INSERT INTO django_evolution VALUES(52,1,'reviews','null_repository');
INSERT INTO django_evolution VALUES(53,1,'reviews','localsite');
INSERT INTO django_evolution VALUES(54,1,'reviews','group_incoming_request_count');
INSERT INTO django_evolution VALUES(55,1,'reviews','group_invite_only');
INSERT INTO django_evolution VALUES(56,1,'reviews','group_visible');
INSERT INTO django_evolution VALUES(57,1,'reviews','default_reviewer_local_site');
INSERT INTO django_evolution VALUES(58,1,'reviews','add_issues_to_comments');
INSERT INTO django_evolution VALUES(59,1,'reviews','file_attachments');
INSERT INTO django_evolution VALUES(60,1,'reviews','file_attachment_comment_extra_data');
INSERT INTO django_evolution VALUES(61,1,'reviews','review_request_last_review_activity_timestamp');
INSERT INTO django_evolution VALUES(62,1,'reviews','review_request_depends_on');
INSERT INTO django_evolution VALUES(63,1,'reviews','commit_id');
INSERT INTO django_evolution VALUES(64,1,'reviews','file_attachment_comment_diff_id');
INSERT INTO django_evolution VALUES(65,1,'reviews','rich_text');
INSERT INTO django_evolution VALUES(66,1,'reviews','base_comment_extra_data');
INSERT INTO django_evolution VALUES(67,1,'reviews','unique_together_baseline');
INSERT INTO django_evolution VALUES(68,1,'reviews','extra_data');
INSERT INTO django_evolution VALUES(69,1,'reviews','review_request_issue_counts');
INSERT INTO django_evolution VALUES(70,1,'reviews','group_mailing_list_charfield');
INSERT INTO django_evolution VALUES(71,1,'reviews','review_request_draft_commit_id');
INSERT INTO django_evolution VALUES(72,1,'reviews','group_email_list_only');
INSERT INTO django_evolution VALUES(73,1,'reviews','review_request_file_attachment_histories');
INSERT INTO django_evolution VALUES(74,1,'reviews','review_request_summary_index');
INSERT INTO django_evolution VALUES(75,1,'reviews','review_request_summary_index_manual');
INSERT INTO django_evolution VALUES(76,1,'reviews','split_rich_text');
INSERT INTO django_evolution VALUES(77,1,'reviews','is_default_group');
INSERT INTO django_evolution VALUES(78,1,'reviews','general_comments');
INSERT INTO django_evolution VALUES(79,1,'reviews','add_owner_to_draft');
INSERT INTO django_evolution VALUES(80,1,'reviews','status_update_timeout');
INSERT INTO django_evolution VALUES(81,1,'reviews','comment_issue_verification');
INSERT INTO django_evolution VALUES(82,1,'reviews','review_request_screenshot_attachment_counters');
INSERT INTO django_evolution VALUES(83,1,'scmtools','bugzilla_url_charfield');
INSERT INTO django_evolution VALUES(84,1,'scmtools','repository_raw_file_url');
INSERT INTO django_evolution VALUES(85,1,'scmtools','repository_visible');
INSERT INTO django_evolution VALUES(86,1,'scmtools','repository_path_length_255');
INSERT INTO django_evolution VALUES(87,1,'scmtools','localsite');
INSERT INTO django_evolution VALUES(88,1,'scmtools','repository_access_control');
INSERT INTO django_evolution VALUES(89,1,'scmtools','group_site');
INSERT INTO django_evolution VALUES(90,1,'scmtools','repository_hosting_accounts');
INSERT INTO django_evolution VALUES(91,1,'scmtools','repository_extra_data_null');
INSERT INTO django_evolution VALUES(92,1,'scmtools','unique_together_baseline');
INSERT INTO django_evolution VALUES(93,1,'scmtools','repository_archive');
INSERT INTO django_evolution VALUES(94,1,'scmtools','repository_hooks_uuid');
INSERT INTO django_evolution VALUES(95,1,'scmtools','repository_raw_password');
INSERT INTO django_evolution VALUES(96,1,'scmtools','repository_name_length_255');
INSERT INTO django_evolution VALUES(97,1,'site','localsite_public');
INSERT INTO django_evolution VALUES(98,1,'site','localsite_extra_data');
INSERT INTO django_evolution VALUES(99,1,'webapi','webapitoken_jsonfield_null');
CREATE INDEX reviews_reviewrequest_summary ON reviews_reviewrequest (summary);
CREATE INDEX "django_admin_log_6340c63c" ON "django_admin_log" ("user_id");
CREATE INDEX "django_admin_log_37ef4eb4" ON "django_admin_log" ("content_type_id");
CREATE INDEX "auth_permission_37ef4eb4" ON "auth_permission" ("content_type_id");
CREATE INDEX "auth_group_permissions_5f412f9a" ON "auth_group_permissions" ("group_id");
CREATE INDEX "auth_group_permissions_83d7f98b" ON "auth_group_permissions" ("permission_id");
CREATE INDEX "auth_user_groups_6340c63c" ON "auth_user_groups" ("user_id");
CREATE INDEX "auth_user_groups_5f412f9a" ON "auth_user_groups" ("group_id");
CREATE INDEX "auth_user_user_permissions_6340c63c" ON "auth_user_user_permissions" ("user_id");
CREATE INDEX "auth_user_user_permissions_83d7f98b" ON "auth_user_user_permissions" ("permission_id");
CREATE INDEX "django_session_b7b81f0c" ON "django_session" ("expire_date");
CREATE INDEX "integrations_integrationconfig_814d1441" ON "integrations_integrationconfig" ("integration_id");
CREATE INDEX "integrations_integrationconfig_361e170c" ON "integrations_integrationconfig" ("enabled");
CREATE INDEX "integrations_integrationconfig_c467b315" ON "integrations_integrationconfig" ("local_site_id");
CREATE INDEX "djblets_privacy_storedconsentdata_3620e37c" ON "djblets_privacy_storedconsentdata" ("audit_identifier");
CREATE INDEX "siteconfig_siteconfiguration_99732b5c" ON "siteconfig_siteconfiguration" ("site_id");
CREATE INDEX "oauth2_provider_application_6340c63c" ON "oauth2_provider_application" ("user_id");
CREATE INDEX "oauth2_provider_application_1986ffac" ON "oauth2_provider_application" ("client_secret");
CREATE INDEX "oauth2_provider_grant_6340c63c" ON "oauth2_provider_grant" ("user_id");
CREATE INDEX "oauth2_provider_grant_09bb5fb3" ON "oauth2_provider_grant" ("code");
CREATE INDEX "oauth2_provider_grant_bf127e2f" ON "oauth2_provider_grant" ("application_id");
CREATE INDEX "oauth2_provider_accesstoken_6340c63c" ON "oauth2_provider_accesstoken" ("user_id");
CREATE INDEX "oauth2_provider_accesstoken_e0a0c5a7" ON "oauth2_provider_accesstoken" ("token");
CREATE INDEX "oauth2_provider_accesstoken_bf127e2f" ON "oauth2_provider_accesstoken" ("application_id");
CREATE INDEX "oauth2_provider_refreshtoken_6340c63c" ON "oauth2_provider_refreshtoken" ("user_id");
CREATE INDEX "oauth2_provider_refreshtoken_e0a0c5a7" ON "oauth2_provider_refreshtoken" ("token");
CREATE INDEX "oauth2_provider_refreshtoken_bf127e2f" ON "oauth2_provider_refreshtoken" ("application_id");
CREATE INDEX "accounts_reviewrequestvisit_6340c63c" ON "accounts_reviewrequestvisit" ("user_id");
CREATE INDEX "accounts_reviewrequestvisit_17900555" ON "accounts_reviewrequestvisit" ("review_request_id");
CREATE INDEX "accounts_reviewrequestvisit_23858d92" ON "accounts_reviewrequestvisit" ("user_id", "visibility");
CREATE INDEX "accounts_profile_starred_review_requests_5948a8a3" ON "accounts_profile_starred_review_requests" ("profile_id");
CREATE INDEX "accounts_profile_starred_review_requests_feaccf73" ON "accounts_profile_starred_review_requests" ("reviewrequest_id");
CREATE INDEX "accounts_profile_starred_groups_5948a8a3" ON "accounts_profile_starred_groups" ("profile_id");
CREATE INDEX "accounts_profile_starred_groups_5f412f9a" ON "accounts_profile_starred_groups" ("group_id");
CREATE INDEX "accounts_localsiteprofile_6340c63c" ON "accounts_localsiteprofile" ("user_id");
CREATE INDEX "accounts_localsiteprofile_5948a8a3" ON "accounts_localsiteprofile" ("profile_id");
CREATE INDEX "accounts_localsiteprofile_c467b315" ON "accounts_localsiteprofile" ("local_site_id");
CREATE INDEX "accounts_trophy_17900555" ON "accounts_trophy" ("review_request_id");
CREATE INDEX "accounts_trophy_c467b315" ON "accounts_trophy" ("local_site_id");
CREATE INDEX "accounts_trophy_6340c63c" ON "accounts_trophy" ("user_id");
CREATE INDEX "attachments_fileattachment_6340c63c" ON "attachments_fileattachment" ("user_id");
CREATE INDEX "attachments_fileattachment_c467b315" ON "attachments_fileattachment" ("local_site_id");
CREATE INDEX "attachments_fileattachment_3e277a4b" ON "attachments_fileattachment" ("repo_revision");
CREATE INDEX "attachments_fileattachment_a322ed1e" ON "attachments_fileattachment" ("repository_id");
CREATE INDEX "attachments_fileattachment_4b31b03f" ON "attachments_fileattachment" ("added_in_filediff_id");
CREATE INDEX "attachments_fileattachment_3a1832b9" ON "attachments_fileattachment" ("attachment_history_id");
CREATE INDEX "changedescs_changedescription_6340c63c" ON "changedescs_changedescription" ("user_id");
CREATE INDEX "diffviewer_filediff_4657d859" ON "diffviewer_filediff" ("diffset_id");
CREATE INDEX "diffviewer_filediff_b2714c41" ON "diffviewer_filediff" ("diff_hash_id");
CREATE INDEX "diffviewer_filediff_7881d360" ON "diffviewer_filediff" ("raw_diff_hash_id");
CREATE INDEX "diffviewer_filediff_f02ae4d8" ON "diffviewer_filediff" ("parent_diff_hash_id");
CREATE INDEX "diffviewer_filediff_1fb2a779" ON "diffviewer_filediff" ("raw_parent_diff_hash_id");
CREATE INDEX "diffviewer_diffset_11f62a9b" ON "diffviewer_diffset" ("history_id");
CREATE INDEX "diffviewer_diffset_a322ed1e" ON "diffviewer_diffset" ("repository_id");
CREATE INDEX "diffviewer_diffset_37e4c1ec" ON "diffviewer_diffset" ("base_commit_id");
CREATE INDEX "hostingsvcs_hostingserviceaccount_c467b315" ON "hostingsvcs_hostingserviceaccount" ("local_site_id");
CREATE INDEX "notifications_webhooktarget_repositories_69be96ee" ON "notifications_webhooktarget_repositories" ("webhooktarget_id");
CREATE INDEX "notifications_webhooktarget_repositories_a322ed1e" ON "notifications_webhooktarget_repositories" ("repository_id");
CREATE INDEX "notifications_webhooktarget_c467b315" ON "notifications_webhooktarget" ("local_site_id");
CREATE INDEX "reviewboard_oauth_application_6340c63c" ON "reviewboard_oauth_application" ("user_id");
CREATE INDEX "reviewboard_oauth_application_1986ffac" ON "reviewboard_oauth_application" ("client_secret");
CREATE INDEX "reviewboard_oauth_application_24741952" ON "reviewboard_oauth_application" ("original_user_id");
CREATE INDEX "reviewboard_oauth_application_c467b315" ON "reviewboard_oauth_application" ("local_site_id");
CREATE INDEX "reviews_group_users_5f412f9a" ON "reviews_group_users" ("group_id");
CREATE INDEX "reviews_group_users_6340c63c" ON "reviews_group_users" ("user_id");
CREATE INDEX "reviews_group_4da47e07" ON "reviews_group" ("name");
CREATE INDEX "reviews_group_c467b315" ON "reviews_group" ("local_site_id");
CREATE INDEX "reviews_defaultreviewer_repository_f5a668e1" ON "reviews_defaultreviewer_repository" ("defaultreviewer_id");
CREATE INDEX "reviews_defaultreviewer_repository_a322ed1e" ON "reviews_defaultreviewer_repository" ("repository_id");
CREATE INDEX "reviews_defaultreviewer_people_f5a668e1" ON "reviews_defaultreviewer_people" ("defaultreviewer_id");
CREATE INDEX "reviews_defaultreviewer_people_6340c63c" ON "reviews_defaultreviewer_people" ("user_id");
CREATE INDEX "reviews_defaultreviewer_groups_f5a668e1" ON "reviews_defaultreviewer_groups" ("defaultreviewer_id");
CREATE INDEX "reviews_defaultreviewer_groups_5f412f9a" ON "reviews_defaultreviewer_groups" ("group_id");
CREATE INDEX "reviews_defaultreviewer_c467b315" ON "reviews_defaultreviewer" ("local_site_id");
CREATE INDEX "reviews_comment_3b281963" ON "reviews_comment" ("issue_status");
CREATE INDEX "reviews_comment_3fde75e6" ON "reviews_comment" ("reply_to_id");
CREATE INDEX "reviews_comment_9abbbbd3" ON "reviews_comment" ("filediff_id");
CREATE INDEX "reviews_comment_3a17b898" ON "reviews_comment" ("interfilediff_id");
CREATE INDEX "reviews_fileattachmentcomment_3b281963" ON "reviews_fileattachmentcomment" ("issue_status");
CREATE INDEX "reviews_fileattachmentcomment_3fde75e6" ON "reviews_fileattachmentcomment" ("reply_to_id");
CREATE INDEX "reviews_fileattachmentcomment_a9d9ad46" ON "reviews_fileattachmentcomment" ("file_attachment_id");
CREATE INDEX "reviews_fileattachmentcomment_57fb824c" ON "reviews_fileattachmentcomment" ("diff_against_file_attachment_id");
CREATE INDEX "reviews_generalcomment_3b281963" ON "reviews_generalcomment" ("issue_status");
CREATE INDEX "reviews_generalcomment_3fde75e6" ON "reviews_generalcomment" ("reply_to_id");
CREATE INDEX "reviews_reviewrequest_changedescs_feaccf73" ON "reviews_reviewrequest_changedescs" ("reviewrequest_id");
CREATE INDEX "reviews_reviewrequest_changedescs_22b87d1a" ON "reviews_reviewrequest_changedescs" ("changedescription_id");
CREATE INDEX "reviews_reviewrequest_target_people_feaccf73" ON "reviews_reviewrequest_target_people" ("reviewrequest_id");
CREATE INDEX "reviews_reviewrequest_target_people_6340c63c" ON "reviews_reviewrequest_target_people" ("user_id");
CREATE INDEX "reviews_reviewrequest_inactive_screenshots_feaccf73" ON "reviews_reviewrequest_inactive_screenshots" ("reviewrequest_id");
CREATE INDEX "reviews_reviewrequest_inactive_screenshots_962c25c0" ON "reviews_reviewrequest_inactive_screenshots" ("screenshot_id");
CREATE INDEX "reviews_reviewrequest_screenshots_feaccf73" ON "reviews_reviewrequest_screenshots" ("reviewrequest_id");
CREATE INDEX "reviews_reviewrequest_screenshots_962c25c0" ON "reviews_reviewrequest_screenshots" ("screenshot_id");
CREATE INDEX "reviews_reviewrequest_depends_on_a7ff7fb6" ON "reviews_reviewrequest_depends_on" ("from_reviewrequest_id");
CREATE INDEX "reviews_reviewrequest_depends_on_04eb98af" ON "reviews_reviewrequest_depends_on" ("to_reviewrequest_id");
CREATE INDEX "reviews_reviewrequest_inactive_file_attachments_feaccf73" ON "reviews_reviewrequest_inactive_file_attachments" ("reviewrequest_id");
CREATE INDEX "reviews_reviewrequest_inactive_file_attachments_3d148c8d" ON "reviews_reviewrequest_inactive_file_attachments" ("fileattachment_id");
CREATE INDEX "reviews_reviewrequest_file_attachment_histories_feaccf73" ON "reviews_reviewrequest_file_attachment_histories" ("reviewrequest_id");
CREATE INDEX "reviews_reviewrequest_file_attachment_histories_e6c6e43b" ON "reviews_reviewrequest_file_attachment_histories" ("fileattachmenthistory_id");
CREATE INDEX "reviews_reviewrequest_target_groups_feaccf73" ON "reviews_reviewrequest_target_groups" ("reviewrequest_id");
CREATE INDEX "reviews_reviewrequest_target_groups_5f412f9a" ON "reviews_reviewrequest_target_groups" ("group_id");
CREATE INDEX "reviews_reviewrequest_file_attachments_feaccf73" ON "reviews_reviewrequest_file_attachments" ("reviewrequest_id");
CREATE INDEX "reviews_reviewrequest_file_attachments_3d148c8d" ON "reviews_reviewrequest_file_attachments" ("fileattachment_id");
CREATE INDEX "reviews_reviewrequest_e5ba0309" ON "reviews_reviewrequest" ("commit_id");
CREATE INDEX "reviews_reviewrequest_5f7282ee" ON "reviews_reviewrequest" ("submitter_id");
CREATE INDEX "reviews_reviewrequest_48fb58bb" ON "reviews_reviewrequest" ("status");
CREATE INDEX "reviews_reviewrequest_5e9ac186" ON "reviews_reviewrequest" ("changenum");
CREATE INDEX "reviews_reviewrequest_a322ed1e" ON "reviews_reviewrequest" ("repository_id");
CREATE INDEX "reviews_reviewrequest_c252e15f" ON "reviews_reviewrequest" ("diffset_history_id");
CREATE INDEX "reviews_reviewrequest_c467b315" ON "reviews_reviewrequest" ("local_site_id");
CREATE INDEX "reviews_screenshotcomment_3b281963" ON "reviews_screenshotcomment" ("issue_status");
CREATE INDEX "reviews_screenshotcomment_3fde75e6" ON "reviews_screenshotcomment" ("reply_to_id");
CREATE INDEX "reviews_screenshotcomment_962c25c0" ON "reviews_screenshotcomment" ("screenshot_id");
CREATE INDEX "reviews_review_comments_a0363c29" ON "reviews_review_comments" ("review_id");
CREATE INDEX "reviews_review_comments_3925f323" ON "reviews_review_comments" ("comment_id");
CREATE INDEX "reviews_review_file_attachment_comments_a0363c29" ON "reviews_review_file_attachment_comments" ("review_id");
CREATE INDEX "reviews_review_file_attachment_comments_5a259272" ON "reviews_review_file_attachment_comments" ("fileattachmentcomment_id");
CREATE INDEX "reviews_review_general_comments_a0363c29" ON "reviews_review_general_comments" ("review_id");
CREATE INDEX "reviews_review_general_comments_3c4b56aa" ON "reviews_review_general_comments" ("generalcomment_id");
CREATE INDEX "reviews_review_screenshot_comments_a0363c29" ON "reviews_review_screenshot_comments" ("review_id");
CREATE INDEX "reviews_review_screenshot_comments_6cba352d" ON "reviews_review_screenshot_comments" ("screenshotcomment_id");
CREATE INDEX "reviews_review_17900555" ON "reviews_review" ("review_request_id");
CREATE INDEX "reviews_review_6340c63c" ON "reviews_review" ("user_id");
CREATE INDEX "reviews_review_a05fe33f" ON "reviews_review" ("base_reply_to_id");
CREATE INDEX "reviews_review_ab465625" ON "reviews_review" ("body_top_reply_to_id");
CREATE INDEX "reviews_review_f15f898e" ON "reviews_review" ("body_bottom_reply_to_id");
CREATE INDEX "reviews_review_daa286e9" ON "reviews_review" ("reviewed_diffset_id");
CREATE INDEX "reviews_reviewrequestdraft_target_people_12716454" ON "reviews_reviewrequestdraft_target_people" ("reviewrequestdraft_id");
CREATE INDEX "reviews_reviewrequestdraft_target_people_6340c63c" ON "reviews_reviewrequestdraft_target_people" ("user_id");
CREATE INDEX "reviews_reviewrequestdraft_depends_on_12716454" ON "reviews_reviewrequestdraft_depends_on" ("reviewrequestdraft_id");
CREATE INDEX "reviews_reviewrequestdraft_depends_on_feaccf73" ON "reviews_reviewrequestdraft_depends_on" ("reviewrequest_id");
CREATE INDEX "reviews_reviewrequestdraft_file_attachments_12716454" ON "reviews_reviewrequestdraft_file_attachments" ("reviewrequestdraft_id");
CREATE INDEX "reviews_reviewrequestdraft_file_attachments_3d148c8d" ON "reviews_reviewrequestdraft_file_attachments" ("fileattachment_id");
CREATE INDEX "reviews_reviewrequestdraft_screenshots_12716454" ON "reviews_reviewrequestdraft_screenshots" ("reviewrequestdraft_id");
CREATE INDEX "reviews_reviewrequestdraft_screenshots_962c25c0" ON "reviews_reviewrequestdraft_screenshots" ("screenshot_id");
CREATE INDEX "reviews_reviewrequestdraft_inactive_screenshots_12716454" ON "reviews_reviewrequestdraft_inactive_screenshots" ("reviewrequestdraft_id");
CREATE INDEX "reviews_reviewrequestdraft_inactive_screenshots_962c25c0" ON "reviews_reviewrequestdraft_inactive_screenshots" ("screenshot_id");
CREATE INDEX "reviews_reviewrequestdraft_inactive_file_attachments_12716454" ON "reviews_reviewrequestdraft_inactive_file_attachments" ("reviewrequestdraft_id");
CREATE INDEX "reviews_reviewrequestdraft_inactive_file_attachments_3d148c8d" ON "reviews_reviewrequestdraft_inactive_file_attachments" ("fileattachment_id");
CREATE INDEX "reviews_reviewrequestdraft_target_groups_12716454" ON "reviews_reviewrequestdraft_target_groups" ("reviewrequestdraft_id");
CREATE INDEX "reviews_reviewrequestdraft_target_groups_5f412f9a" ON "reviews_reviewrequestdraft_target_groups" ("group_id");
CREATE INDEX "reviews_reviewrequestdraft_e5ba0309" ON "reviews_reviewrequestdraft" ("commit_id");
CREATE INDEX "reviews_reviewrequestdraft_cb902d83" ON "reviews_reviewrequestdraft" ("owner_id");
CREATE INDEX "reviews_reviewrequestdraft_4657d859" ON "reviews_reviewrequestdraft" ("diffset_id");
CREATE INDEX "reviews_reviewrequestdraft_5409e477" ON "reviews_reviewrequestdraft" ("changedesc_id");
CREATE INDEX "reviews_statusupdate_6340c63c" ON "reviews_statusupdate" ("user_id");
CREATE INDEX "reviews_statusupdate_17900555" ON "reviews_statusupdate" ("review_request_id");
CREATE INDEX "reviews_statusupdate_66d6b108" ON "reviews_statusupdate" ("change_description_id");
CREATE INDEX "scmtools_repository_review_groups_a322ed1e" ON "scmtools_repository_review_groups" ("repository_id");
CREATE INDEX "scmtools_repository_review_groups_5f412f9a" ON "scmtools_repository_review_groups" ("group_id");
CREATE INDEX "scmtools_repository_users_a322ed1e" ON "scmtools_repository_users" ("repository_id");
CREATE INDEX "scmtools_repository_users_6340c63c" ON "scmtools_repository_users" ("user_id");
CREATE INDEX "scmtools_repository_4262c4f4" ON "scmtools_repository" ("tool_id");
CREATE INDEX "scmtools_repository_0cb43fa7" ON "scmtools_repository" ("hosting_account_id");
CREATE INDEX "scmtools_repository_c467b315" ON "scmtools_repository" ("local_site_id");
CREATE INDEX "site_localsite_users_9fda9bcd" ON "site_localsite_users" ("localsite_id");
CREATE INDEX "site_localsite_users_6340c63c" ON "site_localsite_users" ("user_id");
CREATE INDEX "site_localsite_admins_9fda9bcd" ON "site_localsite_admins" ("localsite_id");
CREATE INDEX "site_localsite_admins_6340c63c" ON "site_localsite_admins" ("user_id");
CREATE INDEX "webapi_webapitoken_6340c63c" ON "webapi_webapitoken" ("user_id");
CREATE INDEX "webapi_webapitoken_c467b315" ON "webapi_webapitoken" ("local_site_id");
CREATE INDEX "django_evolution_f516c2b3" ON "django_evolution" ("version_id");
COMMIT;
