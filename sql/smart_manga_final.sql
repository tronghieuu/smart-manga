-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 22, 2020 at 12:30 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `smart_manga`
--

-- --------------------------------------------------------

--
-- Table structure for table `artist`
--

CREATE TABLE `artist` (
  `id` bigint(20) NOT NULL COMMENT 'Serial ID',
  `artist_name` varchar(100) NOT NULL COMMENT 'Artist name',
  `artist_info` text DEFAULT '' COMMENT 'Artist information',
  `favorite_counter` bigint(10) DEFAULT 0 COMMENT 'Number of reader like this artist',
  `remark` varchar(500) DEFAULT '' COMMENT 'Remark',
  `del_flag` varchar(1) DEFAULT '0' COMMENT 'Delete flag (0 means existence 1 means deletion)',
  `create_by` varchar(64) DEFAULT '' COMMENT 'Creator',
  `create_time` datetime DEFAULT NULL COMMENT 'Creation time',
  `update_by` varchar(64) DEFAULT '' COMMENT 'Updater',
  `update_time` datetime DEFAULT NULL COMMENT 'Update time'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='artist';

--
-- Dumping data for table `artist`
--

INSERT INTO `artist` (`id`, `artist_name`, `artist_info`, `favorite_counter`, `remark`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES
(2, 'MURATA Yuusuke', '<p><br></p>', 0, '', '0', 'admin', '2020-12-03 21:33:46', '', NULL),
(3, 'SATOU Mahiro', '<p><br></p>', 0, '', '0', 'admin', '2020-12-03 22:00:50', '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `author`
--

CREATE TABLE `author` (
  `id` bigint(20) NOT NULL COMMENT 'Serial ID',
  `author_name` varchar(100) NOT NULL COMMENT 'Author name',
  `author_info` text DEFAULT '' COMMENT 'Author information',
  `favorite_counter` bigint(10) DEFAULT 0 COMMENT 'Number of reader like this author',
  `remark` varchar(500) DEFAULT '' COMMENT 'Remark',
  `del_flag` varchar(1) DEFAULT '0' COMMENT 'Delete flag (0 means existence 1 means deletion)',
  `create_by` varchar(64) DEFAULT '' COMMENT 'Creator',
  `create_time` datetime DEFAULT NULL COMMENT 'Creation time',
  `update_by` varchar(64) DEFAULT '' COMMENT 'Updater',
  `update_time` datetime DEFAULT NULL COMMENT 'Update time'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Author';

--
-- Dumping data for table `author`
--

INSERT INTO `author` (`id`, `author_name`, `author_info`, `favorite_counter`, `remark`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES
(2, 'SORACHI Hideaki', '<p><br></p>', 0, '', '0', 'admin', '2020-12-03 20:19:00', '', '2020-12-03 19:20:21'),
(3, 'ONE', '<p><br></p>', 0, '', '0', 'admin', '2020-12-03 22:33:38', '', NULL),
(4, 'Jin (じん)', '<p><br></p>', 0, '', '0', 'admin', '2020-12-03 23:00:42', '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `business_user`
--

CREATE TABLE `business_user` (
  `user_id` bigint(20) NOT NULL COMMENT 'User ID',
  `login_name` varchar(30) NOT NULL COMMENT 'Login account',
  `user_name` varchar(30) DEFAULT '' COMMENT 'User name',
  `user_type` varchar(1) DEFAULT 'R' COMMENT 'User type (R reader P publisher)',
  `email` varchar(50) DEFAULT '' COMMENT 'User mailbox',
  `phonenumber` varchar(11) DEFAULT '' COMMENT 'Mobile phone number',
  `sex` char(1) DEFAULT '0' COMMENT 'User gender (0 male 1 female 2 unknown)',
  `avatar` varchar(100) DEFAULT '' COMMENT 'Avatar path',
  `password` varchar(50) DEFAULT '' COMMENT 'Password',
  `salt` varchar(20) DEFAULT '' COMMENT 'Salt encryption',
  `status` char(1) DEFAULT '0' COMMENT 'Account status (0 normal 1 disabled)',
  `del_flag` char(1) DEFAULT '0' COMMENT 'Delete flag (0 means existence 2 means deletion)',
  `login_ip` varchar(50) DEFAULT '' COMMENT 'Last login IP',
  `login_date` datetime DEFAULT NULL COMMENT 'Last login time',
  `pwd_update_date` datetime DEFAULT NULL COMMENT 'Last password update time',
  `create_by` varchar(64) DEFAULT '' COMMENT 'Creator',
  `create_time` datetime DEFAULT NULL COMMENT 'Creation time',
  `update_by` varchar(64) DEFAULT '' COMMENT 'Updater',
  `update_time` datetime DEFAULT NULL COMMENT 'Update time',
  `remark` varchar(500) DEFAULT NULL COMMENT 'Remarks'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Business User Information Form';

--
-- Dumping data for table `business_user`
--

INSERT INTO `business_user` (`user_id`, `login_name`, `user_name`, `user_type`, `email`, `phonenumber`, `sex`, `avatar`, `password`, `salt`, `status`, `del_flag`, `login_ip`, `login_date`, `pwd_update_date`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
(1, 'tronghieu', 'Nguyen Trong Hieu', 'R', 'tronghieu8531@gmail.com', '0935802290', '0', '', '5363aed8ab3221be5ca78b9780f35394', 'dbf967', '0', '0', '127.0.0.1', '2020-12-21 22:59:47', '2020-11-26 01:59:11', 'admin', '2020-11-26 01:59:11', '', '2020-12-21 21:59:47', 'Reader user test'),
(2, 'usertest1', 'User test 1', 'R', 'usertest1@mail.com', '0935882290', '0', '', 'b5d902cc8e2e34e2ed4744873eb4d567', '29218d', '0', '0', '127.0.0.1', '2020-12-22 06:27:59', NULL, 'admin', '2020-12-20 21:06:32', '', '2020-12-22 05:27:59', ''),
(3, 'usertest2', 'User test 2', 'R', 'usertest2@mail.com', '0935892290', '0', '', 'e51233b42ebcb0f692d3c28d114d9a30', '56ca62', '0', '0', '127.0.0.1', '2020-12-22 06:29:11', NULL, 'admin', '2020-12-20 21:07:23', '', '2020-12-22 05:29:11', ''),
(4, 'usertest3', 'User test 3', 'R', 'usertest3@mail.com', '', '0', '', 'd7566dce5bd83663a7cbf29c176eafba', '3f8005', '0', '0', '127.0.0.1', '2020-12-22 06:30:01', NULL, 'admin', '2020-12-22 05:19:24', '', '2020-12-22 05:30:01', ''),
(5, 'usertest4', 'User test 4', 'R', 'usertest4@mail.com', '', '0', '', 'a08ceea7f92b339bc798fbbcf7b8925f', '2eba4d', '0', '0', '127.0.0.1', '2020-12-22 06:32:28', NULL, 'admin', '2020-12-22 05:19:45', '', '2020-12-22 05:32:28', ''),
(6, 'usertest5', 'User test 5', 'R', 'usertest5@mail.com', '', '0', '', '5f1f820f6ee55d7a2e1049693cee8047', '107a94', '0', '0', '127.0.0.1', '2020-12-22 06:33:08', NULL, 'admin', '2020-12-22 05:20:14', '', '2020-12-22 05:33:08', '');

-- --------------------------------------------------------

--
-- Table structure for table `gen_table`
--

CREATE TABLE `gen_table` (
  `table_id` bigint(20) NOT NULL COMMENT 'Numbering',
  `table_name` varchar(200) DEFAULT '' COMMENT 'Table name',
  `table_comment` varchar(500) DEFAULT '' COMMENT 'Table description',
  `sub_table_name` varchar(64) DEFAULT NULL COMMENT 'Table name of the associated child table',
  `sub_table_fk_name` varchar(64) DEFAULT NULL COMMENT 'The name of the foreign key associated with the child table',
  `class_name` varchar(100) DEFAULT '' COMMENT 'Entity class name',
  `tpl_category` varchar(200) DEFAULT 'crud' COMMENT 'Template used (crud single table operation tree tree table operation sub main and sub table operation)',
  `package_name` varchar(100) DEFAULT NULL COMMENT 'Generate package path',
  `module_name` varchar(30) DEFAULT NULL COMMENT 'Generate module name',
  `business_name` varchar(30) DEFAULT NULL COMMENT 'Generate business name',
  `function_name` varchar(100) DEFAULT NULL COMMENT 'Generate function name',
  `function_author` varchar(50) DEFAULT NULL COMMENT 'Generate function author',
  `gen_type` char(1) DEFAULT '0' COMMENT 'Code generation method (0zip compressed package 1 custom path)',
  `gen_path` varchar(200) DEFAULT '/' COMMENT 'Build path (do not fill in the default project path)',
  `options` varchar(1000) DEFAULT NULL COMMENT 'Other build options',
  `create_by` varchar(64) DEFAULT '' COMMENT 'Creator',
  `create_time` datetime DEFAULT NULL COMMENT 'Creation time',
  `update_by` varchar(64) DEFAULT '' COMMENT 'Updater',
  `update_time` datetime DEFAULT NULL COMMENT 'Update time',
  `remark` varchar(500) DEFAULT NULL COMMENT 'Remarks'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Code generation business table';

--
-- Dumping data for table `gen_table`
--

INSERT INTO `gen_table` (`table_id`, `table_name`, `table_comment`, `sub_table_name`, `sub_table_fk_name`, `class_name`, `tpl_category`, `package_name`, `module_name`, `business_name`, `function_name`, `function_author`, `gen_type`, `gen_path`, `options`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
(1, 'business_user', 'Business User Information Form', NULL, NULL, 'BusinessUser', 'crud', 'com.smanga.business', 'business', 'user', 'Business User Information Form', 'Trong Hieu', '0', '/', '{\"parentMenuId\":\"1\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"System Management\",\"treeCode\":\"\"}', 'admin', '2020-11-26 02:33:27', '', '2020-11-26 02:34:41', ''),
(2, 'author', 'Author', NULL, NULL, 'Author', 'crud', 'com.smanga.business', 'business', 'author', 'Author', 'Trong Hieu', '0', '/', '{\"parentMenuId\":\"2000\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"Subscriber Management\",\"treeCode\":\"\"}', 'admin', '2020-11-26 11:55:09', '', '2020-11-26 11:58:35', ''),
(3, 'image_file', 'Image File', NULL, NULL, 'ImageFile', 'crud', 'com.smanga.business', 'business', 'file', 'Image File', 'Trong Hieu', '0', '/', '{\"parentMenuId\":\"2000\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"Subscriber Management\",\"treeCode\":\"\"}', 'admin', '2020-11-26 11:55:09', '', '2020-11-26 11:59:00', ''),
(4, 'manga', 'Manga', NULL, NULL, 'Manga', 'crud', 'com.smanga.business', 'business', 'manga', 'Manga', 'Trong Hieu', '0', '/', '{\"parentMenuId\":\"2000\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"Subscriber Management\",\"treeCode\":\"\"}', 'admin', '2020-11-26 11:55:09', '', '2020-11-26 11:59:34', ''),
(5, 'manga_category', 'Manga Category', NULL, NULL, 'MangaCategory', 'crud', 'com.smanga.business', 'business', 'category', 'Manga Category', 'Trong Hieu', '0', '/', '{\"parentMenuId\":\"2000\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"Subscriber Management\",\"treeCode\":\"\"}', 'admin', '2020-11-26 11:55:09', '', '2020-11-26 11:59:52', ''),
(6, 'manga_chapter', 'Manga Chapter', NULL, NULL, 'MangaChapter', 'crud', 'com.smanga.business', 'business', 'chapter', 'Manga Chapter', 'Trong Hieu', '0', '/', '{\"parentMenuId\":\"2000\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"Subscriber Management\",\"treeCode\":\"\"}', 'admin', '2020-11-26 11:55:10', '', '2020-11-26 11:56:17', ''),
(7, 'artist', 'artist', NULL, NULL, 'Artist', 'crud', 'com.smanga.business', 'business', 'artist', 'artist', 'Trong Hieu', '0', '/', '{\"parentMenuId\":\"1\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"System Management\",\"treeCode\":\"\"}', 'admin', '2020-11-29 09:53:18', '', '2020-11-29 09:53:55', ''),
(13, 'recommend_manga', 'List manga rating predict by system', NULL, NULL, 'RecommendManga', 'crud', 'com.smanga.business', 'business', 'manga', 'List manga rating predict by system', 'Trong Hieu', '0', '/', '{\"parentMenuId\":\"1\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"System Management\",\"treeCode\":\"\"}', 'admin', '2020-12-20 19:19:55', '', '2020-12-20 19:20:33', ''),
(14, 'user_manga', 'Information of manga rate by user', NULL, NULL, 'UserManga', 'crud', 'com.smanga.business', 'business', 'manga', 'Information of manga rate by user', 'Trong Hieu', '0', '/', '{\"parentMenuId\":\"1\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"System Management\",\"treeCode\":\"\"}', 'admin', '2020-12-20 19:19:55', '', '2020-12-20 19:20:48', ''),
(15, 'view_counter', 'List of ip prevent count view multiple time in period of time', NULL, NULL, 'ViewCounter', 'crud', 'com.smanga.business', 'business', 'counter', 'List of ip prevent count view multiple time', 'Trong Hieu', '0', '/', '{\"parentMenuId\":\"1\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"System Management\",\"treeCode\":\"\"}', 'admin', '2020-12-20 19:19:55', '', '2020-12-20 19:21:11', '');

-- --------------------------------------------------------

--
-- Table structure for table `gen_table_column`
--

CREATE TABLE `gen_table_column` (
  `column_id` bigint(20) NOT NULL COMMENT 'Numbering',
  `table_id` varchar(64) DEFAULT NULL COMMENT 'Attribution table number',
  `column_name` varchar(200) DEFAULT NULL COMMENT 'Column name',
  `column_comment` varchar(500) DEFAULT NULL COMMENT 'Column description',
  `column_type` varchar(100) DEFAULT NULL COMMENT 'Column type',
  `java_type` varchar(500) DEFAULT NULL COMMENT 'JAVA type',
  `java_field` varchar(200) DEFAULT NULL COMMENT 'JAVA field name',
  `is_pk` char(1) DEFAULT NULL COMMENT 'Whether the primary key (1 is)',
  `is_increment` char(1) DEFAULT NULL COMMENT 'Whether to increase (1 is)',
  `is_required` char(1) DEFAULT NULL COMMENT 'Is it required (1 yes)',
  `is_insert` char(1) DEFAULT NULL COMMENT 'Is it an insert field (1 yes)',
  `is_edit` char(1) DEFAULT NULL COMMENT 'Whether to edit the field (1 yes)',
  `is_list` char(1) DEFAULT NULL COMMENT 'Whether the list field (1 is)',
  `is_query` char(1) DEFAULT NULL COMMENT 'Whether to query the field (1 is)',
  `query_type` varchar(200) DEFAULT 'EQ' COMMENT 'Query method (equal to, not equal to, greater than, less than, range)',
  `html_type` varchar(200) DEFAULT NULL COMMENT 'Display type (text box, text field, drop-down box, check box, radio button, date control)',
  `dict_type` varchar(200) DEFAULT '' COMMENT 'Dictionary type',
  `sort` int(11) DEFAULT NULL COMMENT 'Sort',
  `create_by` varchar(64) DEFAULT '' COMMENT 'Creator',
  `create_time` datetime DEFAULT NULL COMMENT 'Creation time',
  `update_by` varchar(64) DEFAULT '' COMMENT 'Updater',
  `update_time` datetime DEFAULT NULL COMMENT 'Update time'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Code generation business table fields';

--
-- Dumping data for table `gen_table_column`
--

INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`, `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`, `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES
(1, '1', 'user_id', 'User ID', 'bigint(20)', 'Long', 'userId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2020-11-26 02:33:27', NULL, '2020-11-26 02:34:41'),
(2, '1', 'login_name', 'Login account', 'varchar(30)', 'String', 'loginName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2020-11-26 02:33:27', NULL, '2020-11-26 02:34:41'),
(3, '1', 'user_name', 'User name', 'varchar(30)', 'String', 'userName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2020-11-26 02:33:27', NULL, '2020-11-26 02:34:41'),
(4, '1', 'user_type', 'User type (R reader P publisher)', 'varchar(1)', 'String', 'userType', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', '', 4, 'admin', '2020-11-26 02:33:27', NULL, '2020-11-26 02:34:41'),
(5, '1', 'email', 'User mailbox', 'varchar(50)', 'String', 'email', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2020-11-26 02:33:27', NULL, '2020-11-26 02:34:41'),
(6, '1', 'phonenumber', 'Mobile phone number', 'varchar(11)', 'String', 'phonenumber', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2020-11-26 02:33:27', NULL, '2020-11-26 02:34:41'),
(7, '1', 'sex', 'User gender (0 male 1 female 2 unknown)', 'char(1)', 'String', 'sex', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', '', 7, 'admin', '2020-11-26 02:33:27', NULL, '2020-11-26 02:34:41'),
(8, '1', 'avatar', 'Avatar path', 'varchar(100)', 'String', 'avatar', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2020-11-26 02:33:27', NULL, '2020-11-26 02:34:41'),
(9, '1', 'password', 'Password', 'varchar(50)', 'String', 'password', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2020-11-26 02:33:27', NULL, '2020-11-26 02:34:41'),
(10, '1', 'salt', 'Salt encryption', 'varchar(20)', 'String', 'salt', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2020-11-26 02:33:27', NULL, '2020-11-26 02:34:41'),
(11, '1', 'status', 'Account status (0 normal 1 disabled)', 'char(1)', 'String', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', '', 11, 'admin', '2020-11-26 02:33:27', NULL, '2020-11-26 02:34:41'),
(12, '1', 'del_flag', 'Delete flag (0 means existence 2 means deletion)', 'char(1)', 'String', 'delFlag', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 12, 'admin', '2020-11-26 02:33:27', NULL, '2020-11-26 02:34:41'),
(13, '1', 'login_ip', 'Last login IP', 'varchar(50)', 'String', 'loginIp', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 13, 'admin', '2020-11-26 02:33:27', NULL, '2020-11-26 02:34:41'),
(14, '1', 'login_date', 'Last login time', 'datetime', 'Date', 'loginDate', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 14, 'admin', '2020-11-26 02:33:27', NULL, '2020-11-26 02:34:41'),
(15, '1', 'pwd_update_date', 'Last password update time', 'datetime', 'Date', 'pwdUpdateDate', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 15, 'admin', '2020-11-26 02:33:27', NULL, '2020-11-26 02:34:41'),
(16, '1', 'create_by', 'Creator', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 16, 'admin', '2020-11-26 02:33:27', NULL, '2020-11-26 02:34:41'),
(17, '1', 'create_time', 'Creation time', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 17, 'admin', '2020-11-26 02:33:27', NULL, '2020-11-26 02:34:41'),
(18, '1', 'update_by', 'Updater', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 18, 'admin', '2020-11-26 02:33:27', NULL, '2020-11-26 02:34:41'),
(19, '1', 'update_time', 'Update time', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 19, 'admin', '2020-11-26 02:33:27', NULL, '2020-11-26 02:34:41'),
(20, '1', 'remark', 'Remarks', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'textarea', '', 20, 'admin', '2020-11-26 02:33:27', NULL, '2020-11-26 02:34:41'),
(21, '2', 'id', 'Serial ID', 'bigint(20)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2020-11-26 11:55:09', NULL, '2020-11-26 11:58:35'),
(22, '2', 'author_name', 'Author name', 'varchar(100)', 'String', 'authorName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2020-11-26 11:55:09', NULL, '2020-11-26 11:58:35'),
(23, '2', 'author_info', 'Author information', 'text', 'String', 'authorInfo', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2020-11-26 11:55:09', NULL, '2020-11-26 11:58:35'),
(24, '2', 'favorite_counter', 'Number of reader like this author', 'bigint(10)', 'Integer', 'favoriteCounter', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2020-11-26 11:55:09', NULL, '2020-11-26 11:58:35'),
(25, '2', 'remark', 'Remark', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'textarea', '', 5, 'admin', '2020-11-26 11:55:09', NULL, '2020-11-26 11:58:35'),
(26, '2', 'del_flag', 'Delete flag (0 means existence 1 means deletion)', 'varchar(1)', 'String', 'delFlag', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 6, 'admin', '2020-11-26 11:55:09', NULL, '2020-11-26 11:58:35'),
(27, '2', 'create_by', 'Creator', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 7, 'admin', '2020-11-26 11:55:09', NULL, '2020-11-26 11:58:35'),
(28, '2', 'create_time', 'Creation time', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 8, 'admin', '2020-11-26 11:55:09', NULL, '2020-11-26 11:58:35'),
(29, '2', 'update_by', 'Updater', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 9, 'admin', '2020-11-26 11:55:09', NULL, '2020-11-26 11:58:35'),
(30, '2', 'update_time', 'Update time', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 10, 'admin', '2020-11-26 11:55:09', NULL, '2020-11-26 11:58:35'),
(31, '3', 'id', 'Serial ID', 'bigint(20)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2020-11-26 11:55:09', NULL, '2020-11-26 11:59:00'),
(32, '3', 'image_name', 'Image file name', 'varchar(100)', 'String', 'imageName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2020-11-26 11:55:09', NULL, '2020-11-26 11:59:00'),
(33, '3', 'image_path', 'Image file path', 'varchar(200)', 'String', 'imagePath', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2020-11-26 11:55:09', NULL, '2020-11-26 11:59:00'),
(34, '3', 'used_status', 'Used status (1 used 0 not use)', 'char(1)', 'String', 'usedStatus', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', '', 4, 'admin', '2020-11-26 11:55:09', NULL, '2020-11-26 11:59:00'),
(35, '3', 'del_flag', 'Delete flag (0 means existence 1 means deletion)', 'varchar(1)', 'String', 'delFlag', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 5, 'admin', '2020-11-26 11:55:09', NULL, '2020-11-26 11:59:00'),
(36, '3', 'create_by', 'Creator', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 6, 'admin', '2020-11-26 11:55:09', NULL, '2020-11-26 11:59:00'),
(37, '3', 'create_time', 'Creation time', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 7, 'admin', '2020-11-26 11:55:09', NULL, '2020-11-26 11:59:00'),
(38, '3', 'update_by', 'Updater', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 8, 'admin', '2020-11-26 11:55:09', NULL, '2020-11-26 11:59:00'),
(39, '3', 'update_time', 'Update time', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 9, 'admin', '2020-11-26 11:55:09', NULL, '2020-11-26 11:59:00'),
(40, '4', 'id', 'Serial ID', 'bigint(20)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2020-11-26 11:55:09', NULL, '2020-11-26 11:59:34'),
(41, '4', 'manga_name', 'Manga name', 'varchar(100)', 'String', 'mangaName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2020-11-26 11:55:09', NULL, '2020-11-26 11:59:34'),
(42, '4', 'categories', 'Categories (each category seperated by comma)', 'varchar(200)', 'String', 'categories', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2020-11-26 11:55:09', NULL, '2020-11-26 11:59:34'),
(43, '4', 'category_ids', 'Category ids (String with multiple category id seperated by comma', 'varchar(200)', 'String', 'categoryIds', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2020-11-26 11:55:09', NULL, '2020-11-26 11:59:34'),
(44, '4', 'author', 'Author name of manga', 'varchar(100)', 'String', 'author', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2020-11-26 11:55:09', NULL, '2020-11-26 11:59:34'),
(45, '4', 'author_id', 'Id of author', 'bigint(20)', 'Long', 'authorId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2020-11-26 11:55:09', NULL, '2020-11-26 11:59:34'),
(46, '4', 'favorite_counter', 'Number of reader like this manga', 'bigint(10)', 'Integer', 'favoriteCounter', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2020-11-26 11:55:09', NULL, '2020-11-26 11:59:34'),
(47, '4', 'remark', 'Remark', 'text', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 8, 'admin', '2020-11-26 11:55:09', NULL, '2020-11-26 11:59:34'),
(48, '4', 'cover_image', 'Manga cover image path', 'varchar(100)', 'String', 'coverImage', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2020-11-26 11:55:09', NULL, '2020-11-26 11:59:34'),
(49, '4', 'cover_image_id', 'Id of cover image', 'bigint(20)', 'Long', 'coverImageId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2020-11-26 11:55:09', NULL, '2020-11-26 11:59:34'),
(50, '4', 'slide_image', 'Manga slide image path', 'varchar(100)', 'String', 'slideImage', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2020-11-26 11:55:09', NULL, '2020-11-26 11:59:34'),
(51, '4', 'slide_image_id', 'Id of slide image', 'bigint(20)', 'Long', 'slideImageId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 12, 'admin', '2020-11-26 11:55:09', NULL, '2020-11-26 11:59:34'),
(52, '4', 'recommended_age', 'Age recommend', 'varchar(30)', 'String', 'recommendedAge', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 13, 'admin', '2020-11-26 11:55:09', NULL, '2020-11-26 11:59:34'),
(53, '4', 'status', 'Category status (1 enabled 0 disabled)', 'char(1)', 'String', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', '', 14, 'admin', '2020-11-26 11:55:09', NULL, '2020-11-26 11:59:34'),
(54, '4', 'del_flag', 'Delete flag (0 means existence 1 means deletion)', 'varchar(1)', 'String', 'delFlag', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 15, 'admin', '2020-11-26 11:55:09', NULL, '2020-11-26 11:59:34'),
(55, '4', 'create_by', 'Creator', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 16, 'admin', '2020-11-26 11:55:09', NULL, '2020-11-26 11:59:34'),
(56, '4', 'create_time', 'Creation time', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 17, 'admin', '2020-11-26 11:55:09', NULL, '2020-11-26 11:59:34'),
(57, '4', 'update_by', 'Updater', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 18, 'admin', '2020-11-26 11:55:09', NULL, '2020-11-26 11:59:34'),
(58, '4', 'update_time', 'Update time', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 19, 'admin', '2020-11-26 11:55:09', NULL, '2020-11-26 11:59:34'),
(59, '5', 'id', 'Serial ID', 'bigint(20)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2020-11-26 11:55:10', NULL, '2020-11-26 11:59:52'),
(60, '5', 'category_name', 'Category name', 'varchar(30)', 'String', 'categoryName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2020-11-26 11:55:10', NULL, '2020-11-26 11:59:52'),
(61, '5', 'favorite_counter', 'Number of reader like this category', 'bigint(10)', 'Integer', 'favoriteCounter', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2020-11-26 11:55:10', NULL, '2020-11-26 11:59:52'),
(62, '5', 'status', 'Category status (1 enabled 0 disabled)', 'char(1)', 'String', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', '', 4, 'admin', '2020-11-26 11:55:10', NULL, '2020-11-26 11:59:52'),
(63, '5', 'del_flag', 'Delete flag (0 means existence 1 means deletion)', 'varchar(1)', 'String', 'delFlag', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 5, 'admin', '2020-11-26 11:55:10', NULL, '2020-11-26 11:59:52'),
(64, '5', 'create_by', 'Creator', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 6, 'admin', '2020-11-26 11:55:10', NULL, '2020-11-26 11:59:52'),
(65, '5', 'create_time', 'Creation time', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 7, 'admin', '2020-11-26 11:55:10', NULL, '2020-11-26 11:59:52'),
(66, '5', 'update_by', 'Updater', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 8, 'admin', '2020-11-26 11:55:10', NULL, '2020-11-26 11:59:52'),
(67, '5', 'update_time', 'Update time', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 9, 'admin', '2020-11-26 11:55:10', NULL, '2020-11-26 11:59:52'),
(68, '5', 'remark', 'Remark', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'textarea', '', 10, 'admin', '2020-11-26 11:55:10', NULL, '2020-11-26 11:59:52'),
(69, '5', 'cover_image', 'Category cover image path', 'varchar(100)', 'String', 'coverImage', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2020-11-26 11:55:10', NULL, '2020-11-26 11:59:52'),
(70, '5', 'cover_image_id', 'Id of cover image', 'bigint(20)', 'Long', 'coverImageId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 12, 'admin', '2020-11-26 11:55:10', NULL, '2020-11-26 11:59:52'),
(71, '5', 'recommended_age', 'Age recommend', 'varchar(30)', 'String', 'recommendedAge', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 13, 'admin', '2020-11-26 11:55:10', NULL, '2020-11-26 11:59:52'),
(72, '6', 'id', 'Serial ID', 'bigint(20)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2020-11-26 11:55:10', NULL, '2020-11-26 11:56:17'),
(73, '6', 'chapter_name', 'Manga name', 'varchar(100)', 'String', 'chapterName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2020-11-26 11:55:10', NULL, '2020-11-26 11:56:17'),
(74, '6', 'chapter_index', 'Index of chapter in manga', 'varchar(200)', 'String', 'chapterIndex', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2020-11-26 11:55:10', NULL, '2020-11-26 11:56:17'),
(75, '6', 'chapter_lang', 'Language of chapter', 'varchar(10)', 'String', 'chapterLang', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2020-11-26 11:55:10', NULL, '2020-11-26 11:56:17'),
(76, '6', 'chapter_images', 'Image paths with multipe image seperated by comma', 'varchar(500)', 'String', 'chapterImages', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 5, 'admin', '2020-11-26 11:55:10', NULL, '2020-11-26 11:56:17'),
(77, '6', 'chapter_image_ids', 'Image ids with multipe image seperated by comma', 'bigint(20)', 'Long', 'chapterImageIds', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2020-11-26 11:55:10', NULL, '2020-11-26 11:56:17'),
(78, '6', 'manga_id', 'Author name of manga', 'bigint(20)', 'Long', 'mangaId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2020-11-26 11:55:10', NULL, '2020-11-26 11:56:17'),
(79, '6', 'view_counter', 'Number of reader read this chapter', 'bigint(10)', 'Integer', 'viewCounter', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2020-11-26 11:55:10', NULL, '2020-11-26 11:56:17'),
(80, '6', 'favorite_counter', 'Number of reader like this chapter', 'bigint(10)', 'Integer', 'favoriteCounter', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2020-11-26 11:55:10', NULL, '2020-11-26 11:56:17'),
(81, '6', 'remark', 'Remark', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'textarea', '', 10, 'admin', '2020-11-26 11:55:10', NULL, '2020-11-26 11:56:17'),
(82, '6', 'status', 'Chapter status (1 enabled 0 disabled)', 'char(1)', 'String', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', '', 11, 'admin', '2020-11-26 11:55:10', NULL, '2020-11-26 11:56:17'),
(83, '6', 'del_flag', 'Delete flag (0 means existence 1 means deletion)', 'varchar(1)', 'String', 'delFlag', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 12, 'admin', '2020-11-26 11:55:10', NULL, '2020-11-26 11:56:17'),
(84, '6', 'create_by', 'Creator', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 13, 'admin', '2020-11-26 11:55:10', NULL, '2020-11-26 11:56:17'),
(85, '6', 'create_time', 'Creation time', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 14, 'admin', '2020-11-26 11:55:10', NULL, '2020-11-26 11:56:17'),
(86, '6', 'update_by', 'Updater', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 15, 'admin', '2020-11-26 11:55:10', NULL, '2020-11-26 11:56:17'),
(87, '6', 'update_time', 'Update time', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 16, 'admin', '2020-11-26 11:55:10', NULL, '2020-11-26 11:56:17'),
(88, '7', 'id', 'Serial ID', 'bigint(20)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2020-11-29 09:53:18', NULL, '2020-11-29 09:53:55'),
(89, '7', 'artist_name', 'Artist name', 'varchar(100)', 'String', 'artistName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2020-11-29 09:53:18', NULL, '2020-11-29 09:53:55'),
(90, '7', 'artist_info', 'Artist information', 'text', 'String', 'artistInfo', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2020-11-29 09:53:18', NULL, '2020-11-29 09:53:55'),
(91, '7', 'artist_counter', 'Number of reader like this artist', 'bigint(10)', 'Integer', 'artistCounter', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2020-11-29 09:53:18', NULL, '2020-11-29 09:53:55'),
(92, '7', 'remark', 'Remark', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'textarea', '', 5, 'admin', '2020-11-29 09:53:18', NULL, '2020-11-29 09:53:55'),
(93, '7', 'del_flag', 'Delete flag (0 means existence 1 means deletion)', 'varchar(1)', 'String', 'delFlag', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 6, 'admin', '2020-11-29 09:53:18', NULL, '2020-11-29 09:53:55'),
(94, '7', 'create_by', 'Creator', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 7, 'admin', '2020-11-29 09:53:18', NULL, '2020-11-29 09:53:55'),
(95, '7', 'create_time', 'Creation time', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 8, 'admin', '2020-11-29 09:53:18', NULL, '2020-11-29 09:53:55'),
(96, '7', 'update_by', 'Updater', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 9, 'admin', '2020-11-29 09:53:18', NULL, '2020-11-29 09:53:55'),
(97, '7', 'update_time', 'Update time', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 10, 'admin', '2020-11-29 09:53:18', NULL, '2020-11-29 09:53:55'),
(136, '13', 'id', 'Serial index', 'bigint(20)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2020-12-20 19:19:55', NULL, '2020-12-20 19:20:33'),
(137, '13', 'user_id', 'User id', 'bigint(20)', 'Long', 'userId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2020-12-20 19:19:55', NULL, '2020-12-20 19:20:33'),
(138, '13', 'manga_id', 'Manga id', 'bigint(20)', 'Long', 'mangaId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2020-12-20 19:19:55', NULL, '2020-12-20 19:20:33'),
(139, '13', 'is_recommend', '0: is not recommend, 1: is recommend', 'tinyint(1)', 'Integer', 'isRecommend', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2020-12-20 19:19:55', NULL, '2020-12-20 19:20:33'),
(140, '13', 'create_by', 'Creator', 'varchar(50)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 5, 'admin', '2020-12-20 19:19:55', NULL, '2020-12-20 19:20:33'),
(141, '13', 'create_time', 'Create time', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 6, 'admin', '2020-12-20 19:19:55', NULL, '2020-12-20 19:20:33'),
(142, '13', 'update_by', 'Updator', 'varchar(50)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 7, 'admin', '2020-12-20 19:19:55', NULL, '2020-12-20 19:20:33'),
(143, '13', 'update_time', 'Update time', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 8, 'admin', '2020-12-20 19:19:55', NULL, '2020-12-20 19:20:33'),
(144, '14', 'id', 'Serial index', 'bigint(20)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2020-12-20 19:19:55', NULL, '2020-12-20 19:20:48'),
(145, '14', 'user_id', 'User id', 'bigint(20)', 'Long', 'userId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2020-12-20 19:19:55', NULL, '2020-12-20 19:20:48'),
(146, '14', 'manga_id', 'Manga id', 'bigint(20)', 'Long', 'mangaId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2020-12-20 19:19:55', NULL, '2020-12-20 19:20:48'),
(147, '14', 'bookmark', 'Manga is bookmark (0: not bookmark, 1: bookmarked)', 'tinyint(1)', 'Integer', 'bookmark', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2020-12-20 19:19:55', NULL, '2020-12-20 19:20:48'),
(148, '14', 'rating', '', 'float', 'Long', 'rating', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2020-12-20 19:19:55', NULL, '2020-12-20 19:20:48'),
(149, '14', 'create_by', 'Creator', 'varchar(50)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 6, 'admin', '2020-12-20 19:19:55', NULL, '2020-12-20 19:20:48'),
(150, '14', 'create_time', 'Create time', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 7, 'admin', '2020-12-20 19:19:55', NULL, '2020-12-20 19:20:48'),
(151, '14', 'update_by', 'Updator', 'varchar(50)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 8, 'admin', '2020-12-20 19:19:55', NULL, '2020-12-20 19:20:48'),
(152, '14', 'update_time', 'Update time', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 9, 'admin', '2020-12-20 19:19:55', NULL, '2020-12-20 19:20:48'),
(153, '15', 'id', 'Serial index', 'bigint(20)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2020-12-20 19:19:55', NULL, '2020-12-20 19:21:11'),
(154, '15', 'ip', 'Ip user', 'varchar(50)', 'String', 'ip', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2020-12-20 19:19:55', NULL, '2020-12-20 19:21:11'),
(155, '15', 'expired_time', 'Expired time, user view can be counter after this time', 'datetime', 'Date', 'expiredTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 3, 'admin', '2020-12-20 19:19:55', NULL, '2020-12-20 19:21:11'),
(156, '15', 'create_time', 'Create time', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 4, 'admin', '2020-12-20 19:19:55', NULL, '2020-12-20 19:21:11');

-- --------------------------------------------------------

--
-- Table structure for table `image_file`
--

CREATE TABLE `image_file` (
  `id` bigint(20) NOT NULL COMMENT 'Serial ID',
  `image_name` varchar(100) NOT NULL COMMENT 'Image file name',
  `image_path` varchar(200) DEFAULT '' COMMENT 'Image file path',
  `used_status` char(1) DEFAULT '0' COMMENT 'Used status (1 used 0 not use)',
  `del_flag` varchar(1) DEFAULT '0' COMMENT 'Delete flag (0 means existence 1 means deletion)',
  `create_by` varchar(64) DEFAULT '' COMMENT 'Creator',
  `create_time` datetime DEFAULT NULL COMMENT 'Creation time',
  `update_by` varchar(64) DEFAULT '' COMMENT 'Updater',
  `update_time` datetime DEFAULT NULL COMMENT 'Update time',
  `absolute_path` varchar(200) DEFAULT '' COMMENT 'Absolute path'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Image File';

--
-- Dumping data for table `image_file`
--

INSERT INTO `image_file` (`id`, `image_name`, `image_path`, `used_status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `absolute_path`) VALUES
(291, 'file20201203192223.png', '/profile/upload/manga/cover/2020-12-03/file20201203192223.png', '1', '0', 'admin', '2020-12-03 19:22:23', 'admin', '2020-12-03 19:22:26', 'D:/smanga/uploadPath/upload/manga/cover/2020-12-03/file20201203192223.png'),
(292, 'file20201203192404._Gintama_v01_000.jpg', '/profile/upload/chapter/2/2020-12-03/file20201203192404._Gintama_v01_000.jpg', '1', '0', 'admin', '2020-12-03 19:24:04', '', NULL, 'D:/smanga/uploadPath/upload/chapter/2/2020-12-03/file20201203192404._Gintama_v01_000.jpg'),
(293, 'file20201203192404._Gintama_v01_ch01_p01.png', '/profile/upload/chapter/2/2020-12-03/file20201203192404._Gintama_v01_ch01_p01.png', '1', '0', 'admin', '2020-12-03 19:24:04', '', NULL, 'D:/smanga/uploadPath/upload/chapter/2/2020-12-03/file20201203192404._Gintama_v01_ch01_p01.png'),
(294, 'file20201203192404._Gintama_v01_ch01_p02.png', '/profile/upload/chapter/2/2020-12-03/file20201203192404._Gintama_v01_ch01_p02.png', '1', '0', 'admin', '2020-12-03 19:24:04', '', NULL, 'D:/smanga/uploadPath/upload/chapter/2/2020-12-03/file20201203192404._Gintama_v01_ch01_p02.png'),
(295, 'file20201203192404._Gintama_v01_ch01_p03.jpg', '/profile/upload/chapter/2/2020-12-03/file20201203192404._Gintama_v01_ch01_p03.jpg', '1', '0', 'admin', '2020-12-03 19:24:04', '', NULL, 'D:/smanga/uploadPath/upload/chapter/2/2020-12-03/file20201203192404._Gintama_v01_ch01_p03.jpg'),
(296, 'file20201203192405._Gintama_v01_ch01_p04-05.jpg', '/profile/upload/chapter/2/2020-12-03/file20201203192405._Gintama_v01_ch01_p04-05.jpg', '1', '0', 'admin', '2020-12-03 19:24:05', '', NULL, 'D:/smanga/uploadPath/upload/chapter/2/2020-12-03/file20201203192405._Gintama_v01_ch01_p04-05.jpg'),
(297, 'file20201203192405._Gintama_v01_ch01_p06.jpg', '/profile/upload/chapter/2/2020-12-03/file20201203192405._Gintama_v01_ch01_p06.jpg', '1', '0', 'admin', '2020-12-03 19:24:05', '', NULL, 'D:/smanga/uploadPath/upload/chapter/2/2020-12-03/file20201203192405._Gintama_v01_ch01_p06.jpg'),
(298, 'file20201203192405._Gintama_v01_ch01_p07.png', '/profile/upload/chapter/2/2020-12-03/file20201203192405._Gintama_v01_ch01_p07.png', '1', '0', 'admin', '2020-12-03 19:24:05', '', NULL, 'D:/smanga/uploadPath/upload/chapter/2/2020-12-03/file20201203192405._Gintama_v01_ch01_p07.png'),
(299, 'file20201203192405._Gintama_v01_ch01_p08.png', '/profile/upload/chapter/2/2020-12-03/file20201203192405._Gintama_v01_ch01_p08.png', '1', '0', 'admin', '2020-12-03 19:24:05', '', NULL, 'D:/smanga/uploadPath/upload/chapter/2/2020-12-03/file20201203192405._Gintama_v01_ch01_p08.png'),
(300, 'file20201203192406._Gintama_v01_ch01_p09.png', '/profile/upload/chapter/2/2020-12-03/file20201203192406._Gintama_v01_ch01_p09.png', '1', '0', 'admin', '2020-12-03 19:24:06', '', NULL, 'D:/smanga/uploadPath/upload/chapter/2/2020-12-03/file20201203192406._Gintama_v01_ch01_p09.png'),
(301, 'file20201203192406._Gintama_v01_ch01_p10.png', '/profile/upload/chapter/2/2020-12-03/file20201203192406._Gintama_v01_ch01_p10.png', '1', '0', 'admin', '2020-12-03 19:24:06', '', NULL, 'D:/smanga/uploadPath/upload/chapter/2/2020-12-03/file20201203192406._Gintama_v01_ch01_p10.png'),
(302, 'file20201203192406._Gintama_v01_ch01_p11.png', '/profile/upload/chapter/2/2020-12-03/file20201203192406._Gintama_v01_ch01_p11.png', '1', '0', 'admin', '2020-12-03 19:24:06', '', NULL, 'D:/smanga/uploadPath/upload/chapter/2/2020-12-03/file20201203192406._Gintama_v01_ch01_p11.png'),
(303, 'file20201203192406._Gintama_v01_ch01_p12.png', '/profile/upload/chapter/2/2020-12-03/file20201203192406._Gintama_v01_ch01_p12.png', '1', '0', 'admin', '2020-12-03 19:24:06', '', NULL, 'D:/smanga/uploadPath/upload/chapter/2/2020-12-03/file20201203192406._Gintama_v01_ch01_p12.png'),
(304, 'file20201203192406._Gintama_v01_ch01_p13.png', '/profile/upload/chapter/2/2020-12-03/file20201203192406._Gintama_v01_ch01_p13.png', '1', '0', 'admin', '2020-12-03 19:24:06', '', NULL, 'D:/smanga/uploadPath/upload/chapter/2/2020-12-03/file20201203192406._Gintama_v01_ch01_p13.png'),
(305, 'file20201203192407._Gintama_v01_ch01_p14.png', '/profile/upload/chapter/2/2020-12-03/file20201203192407._Gintama_v01_ch01_p14.png', '1', '0', 'admin', '2020-12-03 19:24:07', '', NULL, 'D:/smanga/uploadPath/upload/chapter/2/2020-12-03/file20201203192407._Gintama_v01_ch01_p14.png'),
(306, 'file20201203192407._Gintama_v01_ch01_p15.png', '/profile/upload/chapter/2/2020-12-03/file20201203192407._Gintama_v01_ch01_p15.png', '1', '0', 'admin', '2020-12-03 19:24:07', '', NULL, 'D:/smanga/uploadPath/upload/chapter/2/2020-12-03/file20201203192407._Gintama_v01_ch01_p15.png'),
(307, 'file20201203192407._Gintama_v01_ch01_p16.png', '/profile/upload/chapter/2/2020-12-03/file20201203192407._Gintama_v01_ch01_p16.png', '1', '0', 'admin', '2020-12-03 19:24:07', '', NULL, 'D:/smanga/uploadPath/upload/chapter/2/2020-12-03/file20201203192407._Gintama_v01_ch01_p16.png'),
(308, 'file20201203192407._Gintama_v01_ch01_p17.png', '/profile/upload/chapter/2/2020-12-03/file20201203192407._Gintama_v01_ch01_p17.png', '1', '0', 'admin', '2020-12-03 19:24:07', '', NULL, 'D:/smanga/uploadPath/upload/chapter/2/2020-12-03/file20201203192407._Gintama_v01_ch01_p17.png'),
(309, 'file20201203192408._Gintama_v01_ch01_p18.png', '/profile/upload/chapter/2/2020-12-03/file20201203192408._Gintama_v01_ch01_p18.png', '1', '0', 'admin', '2020-12-03 19:24:08', '', NULL, 'D:/smanga/uploadPath/upload/chapter/2/2020-12-03/file20201203192408._Gintama_v01_ch01_p18.png'),
(310, 'file20201203192408._Gintama_v01_ch01_p19.png', '/profile/upload/chapter/2/2020-12-03/file20201203192408._Gintama_v01_ch01_p19.png', '1', '0', 'admin', '2020-12-03 19:24:08', '', NULL, 'D:/smanga/uploadPath/upload/chapter/2/2020-12-03/file20201203192408._Gintama_v01_ch01_p19.png'),
(311, 'file20201203192408._Gintama_v01_ch01_p20.png', '/profile/upload/chapter/2/2020-12-03/file20201203192408._Gintama_v01_ch01_p20.png', '1', '0', 'admin', '2020-12-03 19:24:08', '', NULL, 'D:/smanga/uploadPath/upload/chapter/2/2020-12-03/file20201203192408._Gintama_v01_ch01_p20.png'),
(312, 'file20201203192408._Gintama_v01_ch01_p21.png', '/profile/upload/chapter/2/2020-12-03/file20201203192408._Gintama_v01_ch01_p21.png', '1', '0', 'admin', '2020-12-03 19:24:08', '', NULL, 'D:/smanga/uploadPath/upload/chapter/2/2020-12-03/file20201203192408._Gintama_v01_ch01_p21.png'),
(313, 'file20201203192409._Gintama_v01_ch01_p22.png', '/profile/upload/chapter/2/2020-12-03/file20201203192409._Gintama_v01_ch01_p22.png', '1', '0', 'admin', '2020-12-03 19:24:09', '', NULL, 'D:/smanga/uploadPath/upload/chapter/2/2020-12-03/file20201203192409._Gintama_v01_ch01_p22.png'),
(314, 'file20201203192409._Gintama_v01_ch01_p23.png', '/profile/upload/chapter/2/2020-12-03/file20201203192409._Gintama_v01_ch01_p23.png', '1', '0', 'admin', '2020-12-03 19:24:09', '', NULL, 'D:/smanga/uploadPath/upload/chapter/2/2020-12-03/file20201203192409._Gintama_v01_ch01_p23.png'),
(315, 'file20201203192409._Gintama_v01_ch01_p24.png', '/profile/upload/chapter/2/2020-12-03/file20201203192409._Gintama_v01_ch01_p24.png', '1', '0', 'admin', '2020-12-03 19:24:09', '', NULL, 'D:/smanga/uploadPath/upload/chapter/2/2020-12-03/file20201203192409._Gintama_v01_ch01_p24.png'),
(316, 'file20201203192409._Gintama_v01_ch01_p25.png', '/profile/upload/chapter/2/2020-12-03/file20201203192409._Gintama_v01_ch01_p25.png', '1', '0', 'admin', '2020-12-03 19:24:09', '', NULL, 'D:/smanga/uploadPath/upload/chapter/2/2020-12-03/file20201203192409._Gintama_v01_ch01_p25.png'),
(317, 'file20201203192410._Gintama_v01_ch01_p26.png', '/profile/upload/chapter/2/2020-12-03/file20201203192410._Gintama_v01_ch01_p26.png', '1', '0', 'admin', '2020-12-03 19:24:10', '', NULL, 'D:/smanga/uploadPath/upload/chapter/2/2020-12-03/file20201203192410._Gintama_v01_ch01_p26.png'),
(318, 'file20201203192410._Gintama_v01_ch01_p27.png', '/profile/upload/chapter/2/2020-12-03/file20201203192410._Gintama_v01_ch01_p27.png', '1', '0', 'admin', '2020-12-03 19:24:10', '', NULL, 'D:/smanga/uploadPath/upload/chapter/2/2020-12-03/file20201203192410._Gintama_v01_ch01_p27.png'),
(319, 'file20201203192410._Gintama_v01_ch01_p28.png', '/profile/upload/chapter/2/2020-12-03/file20201203192410._Gintama_v01_ch01_p28.png', '1', '0', 'admin', '2020-12-03 19:24:10', '', NULL, 'D:/smanga/uploadPath/upload/chapter/2/2020-12-03/file20201203192410._Gintama_v01_ch01_p28.png'),
(320, 'file20201203192411._Gintama_v01_ch01_p29.png', '/profile/upload/chapter/2/2020-12-03/file20201203192411._Gintama_v01_ch01_p29.png', '1', '0', 'admin', '2020-12-03 19:24:11', '', NULL, 'D:/smanga/uploadPath/upload/chapter/2/2020-12-03/file20201203192411._Gintama_v01_ch01_p29.png'),
(321, 'file20201203192411._Gintama_v01_ch01_p30.png', '/profile/upload/chapter/2/2020-12-03/file20201203192411._Gintama_v01_ch01_p30.png', '1', '0', 'admin', '2020-12-03 19:24:11', '', NULL, 'D:/smanga/uploadPath/upload/chapter/2/2020-12-03/file20201203192411._Gintama_v01_ch01_p30.png'),
(322, 'file20201203192411._Gintama_v01_ch01_p31.png', '/profile/upload/chapter/2/2020-12-03/file20201203192411._Gintama_v01_ch01_p31.png', '1', '0', 'admin', '2020-12-03 19:24:11', '', NULL, 'D:/smanga/uploadPath/upload/chapter/2/2020-12-03/file20201203192411._Gintama_v01_ch01_p31.png'),
(323, 'file20201203192411._Gintama_v01_ch01_p32.png', '/profile/upload/chapter/2/2020-12-03/file20201203192411._Gintama_v01_ch01_p32.png', '1', '0', 'admin', '2020-12-03 19:24:11', '', NULL, 'D:/smanga/uploadPath/upload/chapter/2/2020-12-03/file20201203192411._Gintama_v01_ch01_p32.png'),
(324, 'file20201203192412._Gintama_v01_ch01_p33.png', '/profile/upload/chapter/2/2020-12-03/file20201203192412._Gintama_v01_ch01_p33.png', '1', '0', 'admin', '2020-12-03 19:24:12', '', NULL, 'D:/smanga/uploadPath/upload/chapter/2/2020-12-03/file20201203192412._Gintama_v01_ch01_p33.png'),
(325, 'file20201203192412._Gintama_v01_ch01_p34.png', '/profile/upload/chapter/2/2020-12-03/file20201203192412._Gintama_v01_ch01_p34.png', '1', '0', 'admin', '2020-12-03 19:24:12', '', NULL, 'D:/smanga/uploadPath/upload/chapter/2/2020-12-03/file20201203192412._Gintama_v01_ch01_p34.png'),
(326, 'file20201203192412._Gintama_v01_ch01_p35.png', '/profile/upload/chapter/2/2020-12-03/file20201203192412._Gintama_v01_ch01_p35.png', '1', '0', 'admin', '2020-12-03 19:24:12', '', NULL, 'D:/smanga/uploadPath/upload/chapter/2/2020-12-03/file20201203192412._Gintama_v01_ch01_p35.png'),
(327, 'file20201203192412._Gintama_v01_ch01_p36.png', '/profile/upload/chapter/2/2020-12-03/file20201203192412._Gintama_v01_ch01_p36.png', '1', '0', 'admin', '2020-12-03 19:24:12', '', NULL, 'D:/smanga/uploadPath/upload/chapter/2/2020-12-03/file20201203192412._Gintama_v01_ch01_p36.png'),
(328, 'file20201203192413._Gintama_v01_ch01_p37.png', '/profile/upload/chapter/2/2020-12-03/file20201203192413._Gintama_v01_ch01_p37.png', '1', '0', 'admin', '2020-12-03 19:24:13', '', NULL, 'D:/smanga/uploadPath/upload/chapter/2/2020-12-03/file20201203192413._Gintama_v01_ch01_p37.png'),
(329, 'file20201203192413._Gintama_v01_ch01_p38.png', '/profile/upload/chapter/2/2020-12-03/file20201203192413._Gintama_v01_ch01_p38.png', '1', '0', 'admin', '2020-12-03 19:24:13', '', NULL, 'D:/smanga/uploadPath/upload/chapter/2/2020-12-03/file20201203192413._Gintama_v01_ch01_p38.png'),
(330, 'file20201203192413._Gintama_v01_ch01_p39.png', '/profile/upload/chapter/2/2020-12-03/file20201203192413._Gintama_v01_ch01_p39.png', '1', '0', 'admin', '2020-12-03 19:24:13', '', NULL, 'D:/smanga/uploadPath/upload/chapter/2/2020-12-03/file20201203192413._Gintama_v01_ch01_p39.png'),
(331, 'file20201203192413._Gintama_v01_ch01_p40.png', '/profile/upload/chapter/2/2020-12-03/file20201203192413._Gintama_v01_ch01_p40.png', '1', '0', 'admin', '2020-12-03 19:24:13', '', NULL, 'D:/smanga/uploadPath/upload/chapter/2/2020-12-03/file20201203192413._Gintama_v01_ch01_p40.png'),
(332, 'file20201203192413._Gintama_v01_ch01_p41.png', '/profile/upload/chapter/2/2020-12-03/file20201203192413._Gintama_v01_ch01_p41.png', '1', '0', 'admin', '2020-12-03 19:24:13', '', NULL, 'D:/smanga/uploadPath/upload/chapter/2/2020-12-03/file20201203192413._Gintama_v01_ch01_p41.png'),
(333, 'file20201203192414._Gintama_v01_ch01_p42.png', '/profile/upload/chapter/2/2020-12-03/file20201203192414._Gintama_v01_ch01_p42.png', '1', '0', 'admin', '2020-12-03 19:24:14', '', NULL, 'D:/smanga/uploadPath/upload/chapter/2/2020-12-03/file20201203192414._Gintama_v01_ch01_p42.png'),
(334, 'file20201203192414._Gintama_v01_ch01_p43.png', '/profile/upload/chapter/2/2020-12-03/file20201203192414._Gintama_v01_ch01_p43.png', '1', '0', 'admin', '2020-12-03 19:24:14', '', NULL, 'D:/smanga/uploadPath/upload/chapter/2/2020-12-03/file20201203192414._Gintama_v01_ch01_p43.png'),
(335, 'file20201203192414._Gintama_v01_ch01_p44.png', '/profile/upload/chapter/2/2020-12-03/file20201203192414._Gintama_v01_ch01_p44.png', '1', '0', 'admin', '2020-12-03 19:24:14', '', NULL, 'D:/smanga/uploadPath/upload/chapter/2/2020-12-03/file20201203192414._Gintama_v01_ch01_p44.png'),
(336, 'file20201203192414._Gintama_v01_ch01_p45.png', '/profile/upload/chapter/2/2020-12-03/file20201203192414._Gintama_v01_ch01_p45.png', '1', '0', 'admin', '2020-12-03 19:24:14', '', NULL, 'D:/smanga/uploadPath/upload/chapter/2/2020-12-03/file20201203192414._Gintama_v01_ch01_p45.png'),
(337, 'file20201203192415._Gintama_v01_ch01_p46.png', '/profile/upload/chapter/2/2020-12-03/file20201203192415._Gintama_v01_ch01_p46.png', '1', '0', 'admin', '2020-12-03 19:24:15', '', NULL, 'D:/smanga/uploadPath/upload/chapter/2/2020-12-03/file20201203192415._Gintama_v01_ch01_p46.png'),
(338, 'file20201203192415._Gintama_v01_ch01_p47.png', '/profile/upload/chapter/2/2020-12-03/file20201203192415._Gintama_v01_ch01_p47.png', '1', '0', 'admin', '2020-12-03 19:24:15', '', NULL, 'D:/smanga/uploadPath/upload/chapter/2/2020-12-03/file20201203192415._Gintama_v01_ch01_p47.png'),
(339, 'file20201203192415._Gintama_v01_ch01_p48.png', '/profile/upload/chapter/2/2020-12-03/file20201203192415._Gintama_v01_ch01_p48.png', '1', '0', 'admin', '2020-12-03 19:24:15', '', NULL, 'D:/smanga/uploadPath/upload/chapter/2/2020-12-03/file20201203192415._Gintama_v01_ch01_p48.png'),
(340, 'file20201203192415._Gintama_v01_ch01_p49.png', '/profile/upload/chapter/2/2020-12-03/file20201203192415._Gintama_v01_ch01_p49.png', '1', '0', 'admin', '2020-12-03 19:24:15', '', NULL, 'D:/smanga/uploadPath/upload/chapter/2/2020-12-03/file20201203192415._Gintama_v01_ch01_p49.png'),
(341, 'file20201203192416._Gintama_v01_ch01_p50.png', '/profile/upload/chapter/2/2020-12-03/file20201203192416._Gintama_v01_ch01_p50.png', '1', '0', 'admin', '2020-12-03 19:24:16', '', NULL, 'D:/smanga/uploadPath/upload/chapter/2/2020-12-03/file20201203192416._Gintama_v01_ch01_p50.png'),
(342, 'file20201203192416._Gintama_v01_ch01_p51.png', '/profile/upload/chapter/2/2020-12-03/file20201203192416._Gintama_v01_ch01_p51.png', '1', '0', 'admin', '2020-12-03 19:24:16', '', NULL, 'D:/smanga/uploadPath/upload/chapter/2/2020-12-03/file20201203192416._Gintama_v01_ch01_p51.png'),
(343, 'file20201203192416._Gintama_v01_ch01_p52.png', '/profile/upload/chapter/2/2020-12-03/file20201203192416._Gintama_v01_ch01_p52.png', '1', '0', 'admin', '2020-12-03 19:24:16', '', NULL, 'D:/smanga/uploadPath/upload/chapter/2/2020-12-03/file20201203192416._Gintama_v01_ch01_p52.png'),
(344, 'file20201203192416._Gintama_v01_ch01_p53.png', '/profile/upload/chapter/2/2020-12-03/file20201203192416._Gintama_v01_ch01_p53.png', '1', '0', 'admin', '2020-12-03 19:24:16', '', NULL, 'D:/smanga/uploadPath/upload/chapter/2/2020-12-03/file20201203192416._Gintama_v01_ch01_p53.png'),
(345, 'file20201203192417._Gintama_v01_ch01_p54.png', '/profile/upload/chapter/2/2020-12-03/file20201203192417._Gintama_v01_ch01_p54.png', '1', '0', 'admin', '2020-12-03 19:24:17', '', NULL, 'D:/smanga/uploadPath/upload/chapter/2/2020-12-03/file20201203192417._Gintama_v01_ch01_p54.png'),
(346, 'file20201203192417._Gintama_v01_ch01_p55.png', '/profile/upload/chapter/2/2020-12-03/file20201203192417._Gintama_v01_ch01_p55.png', '1', '0', 'admin', '2020-12-03 19:24:17', '', NULL, 'D:/smanga/uploadPath/upload/chapter/2/2020-12-03/file20201203192417._Gintama_v01_ch01_p55.png'),
(347, 'file20201203192417._Gintama_v01_ch01_p56.png', '/profile/upload/chapter/2/2020-12-03/file20201203192417._Gintama_v01_ch01_p56.png', '1', '0', 'admin', '2020-12-03 19:24:17', '', NULL, 'D:/smanga/uploadPath/upload/chapter/2/2020-12-03/file20201203192417._Gintama_v01_ch01_p56.png'),
(348, 'file20201203192417._Gintama_v01_ch01_p57.png', '/profile/upload/chapter/2/2020-12-03/file20201203192417._Gintama_v01_ch01_p57.png', '1', '0', 'admin', '2020-12-03 19:24:17', '', NULL, 'D:/smanga/uploadPath/upload/chapter/2/2020-12-03/file20201203192417._Gintama_v01_ch01_p57.png'),
(349, 'file20201203192418._Gintama_v01_ch01_p58.png', '/profile/upload/chapter/2/2020-12-03/file20201203192418._Gintama_v01_ch01_p58.png', '1', '0', 'admin', '2020-12-03 19:24:18', '', NULL, 'D:/smanga/uploadPath/upload/chapter/2/2020-12-03/file20201203192418._Gintama_v01_ch01_p58.png'),
(350, 'file20201203213045._Gintama_v01_ch02_p01.png', '/profile/upload/chapter/3/2020-12-03/file20201203213045._Gintama_v01_ch02_p01.png', '1', '0', 'admin', '2020-12-03 21:30:45', '', NULL, 'D:/smanga/uploadPath/upload/chapter/3/2020-12-03/file20201203213045._Gintama_v01_ch02_p01.png'),
(351, 'file20201203213045._Gintama_v01_ch02_p02.png', '/profile/upload/chapter/3/2020-12-03/file20201203213045._Gintama_v01_ch02_p02.png', '1', '0', 'admin', '2020-12-03 21:30:45', '', NULL, 'D:/smanga/uploadPath/upload/chapter/3/2020-12-03/file20201203213045._Gintama_v01_ch02_p02.png'),
(352, 'file20201203213046._Gintama_v01_ch02_p03.png', '/profile/upload/chapter/3/2020-12-03/file20201203213046._Gintama_v01_ch02_p03.png', '1', '0', 'admin', '2020-12-03 21:30:46', '', NULL, 'D:/smanga/uploadPath/upload/chapter/3/2020-12-03/file20201203213046._Gintama_v01_ch02_p03.png'),
(353, 'file20201203213046._Gintama_v01_ch02_p04.png', '/profile/upload/chapter/3/2020-12-03/file20201203213046._Gintama_v01_ch02_p04.png', '1', '0', 'admin', '2020-12-03 21:30:46', '', NULL, 'D:/smanga/uploadPath/upload/chapter/3/2020-12-03/file20201203213046._Gintama_v01_ch02_p04.png'),
(354, 'file20201203213046._Gintama_v01_ch02_p05.png', '/profile/upload/chapter/3/2020-12-03/file20201203213046._Gintama_v01_ch02_p05.png', '1', '0', 'admin', '2020-12-03 21:30:46', '', NULL, 'D:/smanga/uploadPath/upload/chapter/3/2020-12-03/file20201203213046._Gintama_v01_ch02_p05.png'),
(355, 'file20201203213046._Gintama_v01_ch02_p06.png', '/profile/upload/chapter/3/2020-12-03/file20201203213046._Gintama_v01_ch02_p06.png', '1', '0', 'admin', '2020-12-03 21:30:46', '', NULL, 'D:/smanga/uploadPath/upload/chapter/3/2020-12-03/file20201203213046._Gintama_v01_ch02_p06.png'),
(356, 'file20201203213046._Gintama_v01_ch02_p07.png', '/profile/upload/chapter/3/2020-12-03/file20201203213046._Gintama_v01_ch02_p07.png', '1', '0', 'admin', '2020-12-03 21:30:46', '', NULL, 'D:/smanga/uploadPath/upload/chapter/3/2020-12-03/file20201203213046._Gintama_v01_ch02_p07.png'),
(357, 'file20201203213047._Gintama_v01_ch02_p08.png', '/profile/upload/chapter/3/2020-12-03/file20201203213047._Gintama_v01_ch02_p08.png', '1', '0', 'admin', '2020-12-03 21:30:47', '', NULL, 'D:/smanga/uploadPath/upload/chapter/3/2020-12-03/file20201203213047._Gintama_v01_ch02_p08.png'),
(358, 'file20201203213047._Gintama_v01_ch02_p09.png', '/profile/upload/chapter/3/2020-12-03/file20201203213047._Gintama_v01_ch02_p09.png', '1', '0', 'admin', '2020-12-03 21:30:47', '', NULL, 'D:/smanga/uploadPath/upload/chapter/3/2020-12-03/file20201203213047._Gintama_v01_ch02_p09.png'),
(359, 'file20201203213047._Gintama_v01_ch02_p10.png', '/profile/upload/chapter/3/2020-12-03/file20201203213047._Gintama_v01_ch02_p10.png', '1', '0', 'admin', '2020-12-03 21:30:47', '', NULL, 'D:/smanga/uploadPath/upload/chapter/3/2020-12-03/file20201203213047._Gintama_v01_ch02_p10.png'),
(360, 'file20201203213047._Gintama_v01_ch02_p11.png', '/profile/upload/chapter/3/2020-12-03/file20201203213047._Gintama_v01_ch02_p11.png', '1', '0', 'admin', '2020-12-03 21:30:47', '', NULL, 'D:/smanga/uploadPath/upload/chapter/3/2020-12-03/file20201203213047._Gintama_v01_ch02_p11.png'),
(361, 'file20201203213047._Gintama_v01_ch02_p12.png', '/profile/upload/chapter/3/2020-12-03/file20201203213047._Gintama_v01_ch02_p12.png', '1', '0', 'admin', '2020-12-03 21:30:47', '', NULL, 'D:/smanga/uploadPath/upload/chapter/3/2020-12-03/file20201203213047._Gintama_v01_ch02_p12.png'),
(362, 'file20201203213048._Gintama_v01_ch02_p13.png', '/profile/upload/chapter/3/2020-12-03/file20201203213048._Gintama_v01_ch02_p13.png', '1', '0', 'admin', '2020-12-03 21:30:48', '', NULL, 'D:/smanga/uploadPath/upload/chapter/3/2020-12-03/file20201203213048._Gintama_v01_ch02_p13.png'),
(363, 'file20201203213048._Gintama_v01_ch02_p14.png', '/profile/upload/chapter/3/2020-12-03/file20201203213048._Gintama_v01_ch02_p14.png', '1', '0', 'admin', '2020-12-03 21:30:48', '', NULL, 'D:/smanga/uploadPath/upload/chapter/3/2020-12-03/file20201203213048._Gintama_v01_ch02_p14.png'),
(364, 'file20201203213048._Gintama_v01_ch02_p15.png', '/profile/upload/chapter/3/2020-12-03/file20201203213048._Gintama_v01_ch02_p15.png', '1', '0', 'admin', '2020-12-03 21:30:48', '', NULL, 'D:/smanga/uploadPath/upload/chapter/3/2020-12-03/file20201203213048._Gintama_v01_ch02_p15.png'),
(365, 'file20201203213048._Gintama_v01_ch02_p16.png', '/profile/upload/chapter/3/2020-12-03/file20201203213048._Gintama_v01_ch02_p16.png', '1', '0', 'admin', '2020-12-03 21:30:48', '', NULL, 'D:/smanga/uploadPath/upload/chapter/3/2020-12-03/file20201203213048._Gintama_v01_ch02_p16.png'),
(366, 'file20201203213049._Gintama_v01_ch02_p17.png', '/profile/upload/chapter/3/2020-12-03/file20201203213049._Gintama_v01_ch02_p17.png', '1', '0', 'admin', '2020-12-03 21:30:49', '', NULL, 'D:/smanga/uploadPath/upload/chapter/3/2020-12-03/file20201203213049._Gintama_v01_ch02_p17.png'),
(367, 'file20201203213049._Gintama_v01_ch02_p18.png', '/profile/upload/chapter/3/2020-12-03/file20201203213049._Gintama_v01_ch02_p18.png', '1', '0', 'admin', '2020-12-03 21:30:49', '', NULL, 'D:/smanga/uploadPath/upload/chapter/3/2020-12-03/file20201203213049._Gintama_v01_ch02_p18.png'),
(368, 'file20201203213049._Gintama_v01_ch02_p19.png', '/profile/upload/chapter/3/2020-12-03/file20201203213049._Gintama_v01_ch02_p19.png', '1', '0', 'admin', '2020-12-03 21:30:49', '', NULL, 'D:/smanga/uploadPath/upload/chapter/3/2020-12-03/file20201203213049._Gintama_v01_ch02_p19.png'),
(369, 'file20201203213049._Gintama_v01_ch02_p20.png', '/profile/upload/chapter/3/2020-12-03/file20201203213049._Gintama_v01_ch02_p20.png', '1', '0', 'admin', '2020-12-03 21:30:49', '', NULL, 'D:/smanga/uploadPath/upload/chapter/3/2020-12-03/file20201203213049._Gintama_v01_ch02_p20.png'),
(370, 'file20201203213049._Gintama_v01_ch02_p21.png', '/profile/upload/chapter/3/2020-12-03/file20201203213049._Gintama_v01_ch02_p21.png', '1', '0', 'admin', '2020-12-03 21:30:49', '', NULL, 'D:/smanga/uploadPath/upload/chapter/3/2020-12-03/file20201203213049._Gintama_v01_ch02_p21.png'),
(371, 'file20201203213050._Gintama_v01_ch02_p22.png', '/profile/upload/chapter/3/2020-12-03/file20201203213050._Gintama_v01_ch02_p22.png', '1', '0', 'admin', '2020-12-03 21:30:50', '', NULL, 'D:/smanga/uploadPath/upload/chapter/3/2020-12-03/file20201203213050._Gintama_v01_ch02_p22.png'),
(372, 'file20201203213050._Gintama_v01_ch02_p23.png', '/profile/upload/chapter/3/2020-12-03/file20201203213050._Gintama_v01_ch02_p23.png', '1', '0', 'admin', '2020-12-03 21:30:50', '', NULL, 'D:/smanga/uploadPath/upload/chapter/3/2020-12-03/file20201203213050._Gintama_v01_ch02_p23.png'),
(373, 'file20201203213050._Gintama_v01_ch02_p24.png', '/profile/upload/chapter/3/2020-12-03/file20201203213050._Gintama_v01_ch02_p24.png', '1', '0', 'admin', '2020-12-03 21:30:50', '', NULL, 'D:/smanga/uploadPath/upload/chapter/3/2020-12-03/file20201203213050._Gintama_v01_ch02_p24.png'),
(374, 'file20201203213050._Gintama_v01_ch02_p25.png', '/profile/upload/chapter/3/2020-12-03/file20201203213050._Gintama_v01_ch02_p25.png', '1', '0', 'admin', '2020-12-03 21:30:50', '', NULL, 'D:/smanga/uploadPath/upload/chapter/3/2020-12-03/file20201203213050._Gintama_v01_ch02_p25.png'),
(375, 'file20201203213050._Gintama_v01_ch02_p26.png', '/profile/upload/chapter/3/2020-12-03/file20201203213050._Gintama_v01_ch02_p26.png', '1', '0', 'admin', '2020-12-03 21:30:50', '', NULL, 'D:/smanga/uploadPath/upload/chapter/3/2020-12-03/file20201203213050._Gintama_v01_ch02_p26.png'),
(376, 'file20201203213110._Gintama_v01_ch03_p01.jpg', '/profile/upload/chapter/4/2020-12-03/file20201203213110._Gintama_v01_ch03_p01.jpg', '1', '0', 'admin', '2020-12-03 21:31:10', '', NULL, 'D:/smanga/uploadPath/upload/chapter/4/2020-12-03/file20201203213110._Gintama_v01_ch03_p01.jpg'),
(377, 'file20201203213111._Gintama_v01_ch03_p02.png', '/profile/upload/chapter/4/2020-12-03/file20201203213111._Gintama_v01_ch03_p02.png', '1', '0', 'admin', '2020-12-03 21:31:11', '', NULL, 'D:/smanga/uploadPath/upload/chapter/4/2020-12-03/file20201203213111._Gintama_v01_ch03_p02.png'),
(378, 'file20201203213111._Gintama_v01_ch03_p03.png', '/profile/upload/chapter/4/2020-12-03/file20201203213111._Gintama_v01_ch03_p03.png', '1', '0', 'admin', '2020-12-03 21:31:11', '', NULL, 'D:/smanga/uploadPath/upload/chapter/4/2020-12-03/file20201203213111._Gintama_v01_ch03_p03.png'),
(379, 'file20201203213111._Gintama_v01_ch03_p04.png', '/profile/upload/chapter/4/2020-12-03/file20201203213111._Gintama_v01_ch03_p04.png', '1', '0', 'admin', '2020-12-03 21:31:11', '', NULL, 'D:/smanga/uploadPath/upload/chapter/4/2020-12-03/file20201203213111._Gintama_v01_ch03_p04.png'),
(380, 'file20201203213111._Gintama_v01_ch03_p05.png', '/profile/upload/chapter/4/2020-12-03/file20201203213111._Gintama_v01_ch03_p05.png', '1', '0', 'admin', '2020-12-03 21:31:11', '', NULL, 'D:/smanga/uploadPath/upload/chapter/4/2020-12-03/file20201203213111._Gintama_v01_ch03_p05.png'),
(381, 'file20201203213111._Gintama_v01_ch03_p06.png', '/profile/upload/chapter/4/2020-12-03/file20201203213111._Gintama_v01_ch03_p06.png', '1', '0', 'admin', '2020-12-03 21:31:11', '', NULL, 'D:/smanga/uploadPath/upload/chapter/4/2020-12-03/file20201203213111._Gintama_v01_ch03_p06.png'),
(382, 'file20201203213112._Gintama_v01_ch03_p07.png', '/profile/upload/chapter/4/2020-12-03/file20201203213112._Gintama_v01_ch03_p07.png', '1', '0', 'admin', '2020-12-03 21:31:12', '', NULL, 'D:/smanga/uploadPath/upload/chapter/4/2020-12-03/file20201203213112._Gintama_v01_ch03_p07.png'),
(383, 'file20201203213112._Gintama_v01_ch03_p08.png', '/profile/upload/chapter/4/2020-12-03/file20201203213112._Gintama_v01_ch03_p08.png', '1', '0', 'admin', '2020-12-03 21:31:12', '', NULL, 'D:/smanga/uploadPath/upload/chapter/4/2020-12-03/file20201203213112._Gintama_v01_ch03_p08.png'),
(384, 'file20201203213112._Gintama_v01_ch03_p09.png', '/profile/upload/chapter/4/2020-12-03/file20201203213112._Gintama_v01_ch03_p09.png', '1', '0', 'admin', '2020-12-03 21:31:12', '', NULL, 'D:/smanga/uploadPath/upload/chapter/4/2020-12-03/file20201203213112._Gintama_v01_ch03_p09.png'),
(385, 'file20201203213112._Gintama_v01_ch03_p10.png', '/profile/upload/chapter/4/2020-12-03/file20201203213112._Gintama_v01_ch03_p10.png', '1', '0', 'admin', '2020-12-03 21:31:12', '', NULL, 'D:/smanga/uploadPath/upload/chapter/4/2020-12-03/file20201203213112._Gintama_v01_ch03_p10.png'),
(386, 'file20201203213112._Gintama_v01_ch03_p11.png', '/profile/upload/chapter/4/2020-12-03/file20201203213112._Gintama_v01_ch03_p11.png', '1', '0', 'admin', '2020-12-03 21:31:12', '', NULL, 'D:/smanga/uploadPath/upload/chapter/4/2020-12-03/file20201203213112._Gintama_v01_ch03_p11.png'),
(387, 'file20201203213113._Gintama_v01_ch03_p12.png', '/profile/upload/chapter/4/2020-12-03/file20201203213113._Gintama_v01_ch03_p12.png', '1', '0', 'admin', '2020-12-03 21:31:13', '', NULL, 'D:/smanga/uploadPath/upload/chapter/4/2020-12-03/file20201203213113._Gintama_v01_ch03_p12.png'),
(388, 'file20201203213113._Gintama_v01_ch03_p13.png', '/profile/upload/chapter/4/2020-12-03/file20201203213113._Gintama_v01_ch03_p13.png', '1', '0', 'admin', '2020-12-03 21:31:13', '', NULL, 'D:/smanga/uploadPath/upload/chapter/4/2020-12-03/file20201203213113._Gintama_v01_ch03_p13.png'),
(389, 'file20201203213113._Gintama_v01_ch03_p14.png', '/profile/upload/chapter/4/2020-12-03/file20201203213113._Gintama_v01_ch03_p14.png', '1', '0', 'admin', '2020-12-03 21:31:13', '', NULL, 'D:/smanga/uploadPath/upload/chapter/4/2020-12-03/file20201203213113._Gintama_v01_ch03_p14.png'),
(390, 'file20201203213113._Gintama_v01_ch03_p15.png', '/profile/upload/chapter/4/2020-12-03/file20201203213113._Gintama_v01_ch03_p15.png', '1', '0', 'admin', '2020-12-03 21:31:13', '', NULL, 'D:/smanga/uploadPath/upload/chapter/4/2020-12-03/file20201203213113._Gintama_v01_ch03_p15.png'),
(391, 'file20201203213114._Gintama_v01_ch03_p16.png', '/profile/upload/chapter/4/2020-12-03/file20201203213114._Gintama_v01_ch03_p16.png', '1', '0', 'admin', '2020-12-03 21:31:14', '', NULL, 'D:/smanga/uploadPath/upload/chapter/4/2020-12-03/file20201203213114._Gintama_v01_ch03_p16.png'),
(392, 'file20201203213114._Gintama_v01_ch03_p17.png', '/profile/upload/chapter/4/2020-12-03/file20201203213114._Gintama_v01_ch03_p17.png', '1', '0', 'admin', '2020-12-03 21:31:14', '', NULL, 'D:/smanga/uploadPath/upload/chapter/4/2020-12-03/file20201203213114._Gintama_v01_ch03_p17.png'),
(393, 'file20201203213114._Gintama_v01_ch03_p18.png', '/profile/upload/chapter/4/2020-12-03/file20201203213114._Gintama_v01_ch03_p18.png', '1', '0', 'admin', '2020-12-03 21:31:14', '', NULL, 'D:/smanga/uploadPath/upload/chapter/4/2020-12-03/file20201203213114._Gintama_v01_ch03_p18.png'),
(394, 'file20201203213114._Gintama_v01_ch03_p19.png', '/profile/upload/chapter/4/2020-12-03/file20201203213114._Gintama_v01_ch03_p19.png', '1', '0', 'admin', '2020-12-03 21:31:14', '', NULL, 'D:/smanga/uploadPath/upload/chapter/4/2020-12-03/file20201203213114._Gintama_v01_ch03_p19.png'),
(395, 'file20201203213114._Gintama_v01_ch03_p20.png', '/profile/upload/chapter/4/2020-12-03/file20201203213114._Gintama_v01_ch03_p20.png', '1', '0', 'admin', '2020-12-03 21:31:14', '', NULL, 'D:/smanga/uploadPath/upload/chapter/4/2020-12-03/file20201203213114._Gintama_v01_ch03_p20.png'),
(396, 'file20201203213115._Gintama_v01_ch03_p21.png', '/profile/upload/chapter/4/2020-12-03/file20201203213115._Gintama_v01_ch03_p21.png', '1', '0', 'admin', '2020-12-03 21:31:15', '', NULL, 'D:/smanga/uploadPath/upload/chapter/4/2020-12-03/file20201203213115._Gintama_v01_ch03_p21.png'),
(397, 'file20201203213115._Gintama_v01_ch03_p22.png', '/profile/upload/chapter/4/2020-12-03/file20201203213115._Gintama_v01_ch03_p22.png', '1', '0', 'admin', '2020-12-03 21:31:15', '', NULL, 'D:/smanga/uploadPath/upload/chapter/4/2020-12-03/file20201203213115._Gintama_v01_ch03_p22.png'),
(398, 'file20201203213115._Gintama_v01_ch03_p23.png', '/profile/upload/chapter/4/2020-12-03/file20201203213115._Gintama_v01_ch03_p23.png', '1', '0', 'admin', '2020-12-03 21:31:15', '', NULL, 'D:/smanga/uploadPath/upload/chapter/4/2020-12-03/file20201203213115._Gintama_v01_ch03_p23.png'),
(399, 'file20201203213115._Gintama_v01_ch03_p24.png', '/profile/upload/chapter/4/2020-12-03/file20201203213115._Gintama_v01_ch03_p24.png', '1', '0', 'admin', '2020-12-03 21:31:15', '', NULL, 'D:/smanga/uploadPath/upload/chapter/4/2020-12-03/file20201203213115._Gintama_v01_ch03_p24.png'),
(400, 'file20201203213115._Gintama_v01_ch03_p25.png', '/profile/upload/chapter/4/2020-12-03/file20201203213115._Gintama_v01_ch03_p25.png', '1', '0', 'admin', '2020-12-03 21:31:15', '', NULL, 'D:/smanga/uploadPath/upload/chapter/4/2020-12-03/file20201203213115._Gintama_v01_ch03_p25.png'),
(401, 'file20201203213132._Gintama_v01_ch04_p01.png', '/profile/upload/chapter/5/2020-12-03/file20201203213132._Gintama_v01_ch04_p01.png', '1', '0', 'admin', '2020-12-03 21:31:32', '', NULL, 'D:/smanga/uploadPath/upload/chapter/5/2020-12-03/file20201203213132._Gintama_v01_ch04_p01.png'),
(402, 'file20201203213132._Gintama_v01_ch04_p02.png', '/profile/upload/chapter/5/2020-12-03/file20201203213132._Gintama_v01_ch04_p02.png', '1', '0', 'admin', '2020-12-03 21:31:32', '', NULL, 'D:/smanga/uploadPath/upload/chapter/5/2020-12-03/file20201203213132._Gintama_v01_ch04_p02.png'),
(403, 'file20201203213133._Gintama_v01_ch04_p03.png', '/profile/upload/chapter/5/2020-12-03/file20201203213133._Gintama_v01_ch04_p03.png', '1', '0', 'admin', '2020-12-03 21:31:33', '', NULL, 'D:/smanga/uploadPath/upload/chapter/5/2020-12-03/file20201203213133._Gintama_v01_ch04_p03.png'),
(404, 'file20201203213133._Gintama_v01_ch04_p04.png', '/profile/upload/chapter/5/2020-12-03/file20201203213133._Gintama_v01_ch04_p04.png', '1', '0', 'admin', '2020-12-03 21:31:33', '', NULL, 'D:/smanga/uploadPath/upload/chapter/5/2020-12-03/file20201203213133._Gintama_v01_ch04_p04.png'),
(405, 'file20201203213133._Gintama_v01_ch04_p05.png', '/profile/upload/chapter/5/2020-12-03/file20201203213133._Gintama_v01_ch04_p05.png', '1', '0', 'admin', '2020-12-03 21:31:33', '', NULL, 'D:/smanga/uploadPath/upload/chapter/5/2020-12-03/file20201203213133._Gintama_v01_ch04_p05.png'),
(406, 'file20201203213133._Gintama_v01_ch04_p06.png', '/profile/upload/chapter/5/2020-12-03/file20201203213133._Gintama_v01_ch04_p06.png', '1', '0', 'admin', '2020-12-03 21:31:33', '', NULL, 'D:/smanga/uploadPath/upload/chapter/5/2020-12-03/file20201203213133._Gintama_v01_ch04_p06.png'),
(407, 'file20201203213133._Gintama_v01_ch04_p07.png', '/profile/upload/chapter/5/2020-12-03/file20201203213133._Gintama_v01_ch04_p07.png', '1', '0', 'admin', '2020-12-03 21:31:33', '', NULL, 'D:/smanga/uploadPath/upload/chapter/5/2020-12-03/file20201203213133._Gintama_v01_ch04_p07.png'),
(408, 'file20201203213134._Gintama_v01_ch04_p08.png', '/profile/upload/chapter/5/2020-12-03/file20201203213134._Gintama_v01_ch04_p08.png', '1', '0', 'admin', '2020-12-03 21:31:34', '', NULL, 'D:/smanga/uploadPath/upload/chapter/5/2020-12-03/file20201203213134._Gintama_v01_ch04_p08.png'),
(409, 'file20201203213134._Gintama_v01_ch04_p09.png', '/profile/upload/chapter/5/2020-12-03/file20201203213134._Gintama_v01_ch04_p09.png', '1', '0', 'admin', '2020-12-03 21:31:34', '', NULL, 'D:/smanga/uploadPath/upload/chapter/5/2020-12-03/file20201203213134._Gintama_v01_ch04_p09.png'),
(410, 'file20201203213134._Gintama_v01_ch04_p10.png', '/profile/upload/chapter/5/2020-12-03/file20201203213134._Gintama_v01_ch04_p10.png', '1', '0', 'admin', '2020-12-03 21:31:34', '', NULL, 'D:/smanga/uploadPath/upload/chapter/5/2020-12-03/file20201203213134._Gintama_v01_ch04_p10.png'),
(411, 'file20201203213134._Gintama_v01_ch04_p11.png', '/profile/upload/chapter/5/2020-12-03/file20201203213134._Gintama_v01_ch04_p11.png', '1', '0', 'admin', '2020-12-03 21:31:34', '', NULL, 'D:/smanga/uploadPath/upload/chapter/5/2020-12-03/file20201203213134._Gintama_v01_ch04_p11.png'),
(412, 'file20201203213134._Gintama_v01_ch04_p12.png', '/profile/upload/chapter/5/2020-12-03/file20201203213134._Gintama_v01_ch04_p12.png', '1', '0', 'admin', '2020-12-03 21:31:34', '', NULL, 'D:/smanga/uploadPath/upload/chapter/5/2020-12-03/file20201203213134._Gintama_v01_ch04_p12.png'),
(413, 'file20201203213135._Gintama_v01_ch04_p13.png', '/profile/upload/chapter/5/2020-12-03/file20201203213135._Gintama_v01_ch04_p13.png', '1', '0', 'admin', '2020-12-03 21:31:35', '', NULL, 'D:/smanga/uploadPath/upload/chapter/5/2020-12-03/file20201203213135._Gintama_v01_ch04_p13.png'),
(414, 'file20201203213135._Gintama_v01_ch04_p14.png', '/profile/upload/chapter/5/2020-12-03/file20201203213135._Gintama_v01_ch04_p14.png', '1', '0', 'admin', '2020-12-03 21:31:35', '', NULL, 'D:/smanga/uploadPath/upload/chapter/5/2020-12-03/file20201203213135._Gintama_v01_ch04_p14.png'),
(415, 'file20201203213135._Gintama_v01_ch04_p15.png', '/profile/upload/chapter/5/2020-12-03/file20201203213135._Gintama_v01_ch04_p15.png', '1', '0', 'admin', '2020-12-03 21:31:35', '', NULL, 'D:/smanga/uploadPath/upload/chapter/5/2020-12-03/file20201203213135._Gintama_v01_ch04_p15.png'),
(416, 'file20201203213136._Gintama_v01_ch04_p16.png', '/profile/upload/chapter/5/2020-12-03/file20201203213136._Gintama_v01_ch04_p16.png', '1', '0', 'admin', '2020-12-03 21:31:36', '', NULL, 'D:/smanga/uploadPath/upload/chapter/5/2020-12-03/file20201203213136._Gintama_v01_ch04_p16.png'),
(417, 'file20201203213136._Gintama_v01_ch04_p17.png', '/profile/upload/chapter/5/2020-12-03/file20201203213136._Gintama_v01_ch04_p17.png', '1', '0', 'admin', '2020-12-03 21:31:36', '', NULL, 'D:/smanga/uploadPath/upload/chapter/5/2020-12-03/file20201203213136._Gintama_v01_ch04_p17.png'),
(418, 'file20201203213136._Gintama_v01_ch04_p18.png', '/profile/upload/chapter/5/2020-12-03/file20201203213136._Gintama_v01_ch04_p18.png', '1', '0', 'admin', '2020-12-03 21:31:36', '', NULL, 'D:/smanga/uploadPath/upload/chapter/5/2020-12-03/file20201203213136._Gintama_v01_ch04_p18.png'),
(419, 'file20201203213136._Gintama_v01_ch04_p19.png', '/profile/upload/chapter/5/2020-12-03/file20201203213136._Gintama_v01_ch04_p19.png', '1', '0', 'admin', '2020-12-03 21:31:36', '', NULL, 'D:/smanga/uploadPath/upload/chapter/5/2020-12-03/file20201203213136._Gintama_v01_ch04_p19.png'),
(420, 'file20201203213137._Gintama_v01_ch04_p20.png', '/profile/upload/chapter/5/2020-12-03/file20201203213137._Gintama_v01_ch04_p20.png', '1', '0', 'admin', '2020-12-03 21:31:37', '', NULL, 'D:/smanga/uploadPath/upload/chapter/5/2020-12-03/file20201203213137._Gintama_v01_ch04_p20.png'),
(421, 'file20201203213153._Gintama_v01_ch05_p01.png', '/profile/upload/chapter/6/2020-12-03/file20201203213153._Gintama_v01_ch05_p01.png', '1', '0', 'admin', '2020-12-03 21:31:53', '', NULL, 'D:/smanga/uploadPath/upload/chapter/6/2020-12-03/file20201203213153._Gintama_v01_ch05_p01.png'),
(422, 'file20201203213153._Gintama_v01_ch05_p02.png', '/profile/upload/chapter/6/2020-12-03/file20201203213153._Gintama_v01_ch05_p02.png', '1', '0', 'admin', '2020-12-03 21:31:53', '', NULL, 'D:/smanga/uploadPath/upload/chapter/6/2020-12-03/file20201203213153._Gintama_v01_ch05_p02.png'),
(423, 'file20201203213153._Gintama_v01_ch05_p03.png', '/profile/upload/chapter/6/2020-12-03/file20201203213153._Gintama_v01_ch05_p03.png', '1', '0', 'admin', '2020-12-03 21:31:53', '', NULL, 'D:/smanga/uploadPath/upload/chapter/6/2020-12-03/file20201203213153._Gintama_v01_ch05_p03.png'),
(424, 'file20201203213153._Gintama_v01_ch05_p04.png', '/profile/upload/chapter/6/2020-12-03/file20201203213153._Gintama_v01_ch05_p04.png', '1', '0', 'admin', '2020-12-03 21:31:53', '', NULL, 'D:/smanga/uploadPath/upload/chapter/6/2020-12-03/file20201203213153._Gintama_v01_ch05_p04.png'),
(425, 'file20201203213153._Gintama_v01_ch05_p05.png', '/profile/upload/chapter/6/2020-12-03/file20201203213153._Gintama_v01_ch05_p05.png', '1', '0', 'admin', '2020-12-03 21:31:53', '', NULL, 'D:/smanga/uploadPath/upload/chapter/6/2020-12-03/file20201203213153._Gintama_v01_ch05_p05.png'),
(426, 'file20201203213154._Gintama_v01_ch05_p06.png', '/profile/upload/chapter/6/2020-12-03/file20201203213154._Gintama_v01_ch05_p06.png', '1', '0', 'admin', '2020-12-03 21:31:54', '', NULL, 'D:/smanga/uploadPath/upload/chapter/6/2020-12-03/file20201203213154._Gintama_v01_ch05_p06.png'),
(427, 'file20201203213154._Gintama_v01_ch05_p07.png', '/profile/upload/chapter/6/2020-12-03/file20201203213154._Gintama_v01_ch05_p07.png', '1', '0', 'admin', '2020-12-03 21:31:54', '', NULL, 'D:/smanga/uploadPath/upload/chapter/6/2020-12-03/file20201203213154._Gintama_v01_ch05_p07.png'),
(428, 'file20201203213154._Gintama_v01_ch05_p08.png', '/profile/upload/chapter/6/2020-12-03/file20201203213154._Gintama_v01_ch05_p08.png', '1', '0', 'admin', '2020-12-03 21:31:54', '', NULL, 'D:/smanga/uploadPath/upload/chapter/6/2020-12-03/file20201203213154._Gintama_v01_ch05_p08.png'),
(429, 'file20201203213154._Gintama_v01_ch05_p09.png', '/profile/upload/chapter/6/2020-12-03/file20201203213154._Gintama_v01_ch05_p09.png', '1', '0', 'admin', '2020-12-03 21:31:54', '', NULL, 'D:/smanga/uploadPath/upload/chapter/6/2020-12-03/file20201203213154._Gintama_v01_ch05_p09.png'),
(430, 'file20201203213155._Gintama_v01_ch05_p10.png', '/profile/upload/chapter/6/2020-12-03/file20201203213155._Gintama_v01_ch05_p10.png', '1', '0', 'admin', '2020-12-03 21:31:55', '', NULL, 'D:/smanga/uploadPath/upload/chapter/6/2020-12-03/file20201203213155._Gintama_v01_ch05_p10.png'),
(431, 'file20201203213155._Gintama_v01_ch05_p11.png', '/profile/upload/chapter/6/2020-12-03/file20201203213155._Gintama_v01_ch05_p11.png', '1', '0', 'admin', '2020-12-03 21:31:55', '', NULL, 'D:/smanga/uploadPath/upload/chapter/6/2020-12-03/file20201203213155._Gintama_v01_ch05_p11.png'),
(432, 'file20201203213155._Gintama_v01_ch05_p12.png', '/profile/upload/chapter/6/2020-12-03/file20201203213155._Gintama_v01_ch05_p12.png', '1', '0', 'admin', '2020-12-03 21:31:55', '', NULL, 'D:/smanga/uploadPath/upload/chapter/6/2020-12-03/file20201203213155._Gintama_v01_ch05_p12.png'),
(433, 'file20201203213155._Gintama_v01_ch05_p13.png', '/profile/upload/chapter/6/2020-12-03/file20201203213155._Gintama_v01_ch05_p13.png', '1', '0', 'admin', '2020-12-03 21:31:55', '', NULL, 'D:/smanga/uploadPath/upload/chapter/6/2020-12-03/file20201203213155._Gintama_v01_ch05_p13.png'),
(434, 'file20201203213155._Gintama_v01_ch05_p14.png', '/profile/upload/chapter/6/2020-12-03/file20201203213155._Gintama_v01_ch05_p14.png', '1', '0', 'admin', '2020-12-03 21:31:55', '', NULL, 'D:/smanga/uploadPath/upload/chapter/6/2020-12-03/file20201203213155._Gintama_v01_ch05_p14.png'),
(435, 'file20201203213156._Gintama_v01_ch05_p15.png', '/profile/upload/chapter/6/2020-12-03/file20201203213156._Gintama_v01_ch05_p15.png', '1', '0', 'admin', '2020-12-03 21:31:56', '', NULL, 'D:/smanga/uploadPath/upload/chapter/6/2020-12-03/file20201203213156._Gintama_v01_ch05_p15.png'),
(436, 'file20201203213156._Gintama_v01_ch05_p16.png', '/profile/upload/chapter/6/2020-12-03/file20201203213156._Gintama_v01_ch05_p16.png', '1', '0', 'admin', '2020-12-03 21:31:56', '', NULL, 'D:/smanga/uploadPath/upload/chapter/6/2020-12-03/file20201203213156._Gintama_v01_ch05_p16.png'),
(437, 'file20201203213156._Gintama_v01_ch05_p17.png', '/profile/upload/chapter/6/2020-12-03/file20201203213156._Gintama_v01_ch05_p17.png', '1', '0', 'admin', '2020-12-03 21:31:56', '', NULL, 'D:/smanga/uploadPath/upload/chapter/6/2020-12-03/file20201203213156._Gintama_v01_ch05_p17.png'),
(438, 'file20201203213156._Gintama_v01_ch05_p18.png', '/profile/upload/chapter/6/2020-12-03/file20201203213156._Gintama_v01_ch05_p18.png', '1', '0', 'admin', '2020-12-03 21:31:56', '', NULL, 'D:/smanga/uploadPath/upload/chapter/6/2020-12-03/file20201203213156._Gintama_v01_ch05_p18.png'),
(439, 'file20201203213156._Gintama_v01_ch05_p19.png', '/profile/upload/chapter/6/2020-12-03/file20201203213156._Gintama_v01_ch05_p19.png', '1', '0', 'admin', '2020-12-03 21:31:56', '', NULL, 'D:/smanga/uploadPath/upload/chapter/6/2020-12-03/file20201203213156._Gintama_v01_ch05_p19.png'),
(440, 'file20201203213157._Gintama_v01_ch05_p20.png', '/profile/upload/chapter/6/2020-12-03/file20201203213157._Gintama_v01_ch05_p20.png', '1', '0', 'admin', '2020-12-03 21:31:57', '', NULL, 'D:/smanga/uploadPath/upload/chapter/6/2020-12-03/file20201203213157._Gintama_v01_ch05_p20.png'),
(441, 'file20201203213215._Gintama_v01_ch06_p01.png', '/profile/upload/chapter/7/2020-12-03/file20201203213215._Gintama_v01_ch06_p01.png', '1', '0', 'admin', '2020-12-03 21:32:15', '', NULL, 'D:/smanga/uploadPath/upload/chapter/7/2020-12-03/file20201203213215._Gintama_v01_ch06_p01.png'),
(442, 'file20201203213215._Gintama_v01_ch06_p02.png', '/profile/upload/chapter/7/2020-12-03/file20201203213215._Gintama_v01_ch06_p02.png', '1', '0', 'admin', '2020-12-03 21:32:15', '', NULL, 'D:/smanga/uploadPath/upload/chapter/7/2020-12-03/file20201203213215._Gintama_v01_ch06_p02.png'),
(443, 'file20201203213216._Gintama_v01_ch06_p03.png', '/profile/upload/chapter/7/2020-12-03/file20201203213216._Gintama_v01_ch06_p03.png', '1', '0', 'admin', '2020-12-03 21:32:16', '', NULL, 'D:/smanga/uploadPath/upload/chapter/7/2020-12-03/file20201203213216._Gintama_v01_ch06_p03.png'),
(444, 'file20201203213216._Gintama_v01_ch06_p04.png', '/profile/upload/chapter/7/2020-12-03/file20201203213216._Gintama_v01_ch06_p04.png', '1', '0', 'admin', '2020-12-03 21:32:16', '', NULL, 'D:/smanga/uploadPath/upload/chapter/7/2020-12-03/file20201203213216._Gintama_v01_ch06_p04.png'),
(445, 'file20201203213216._Gintama_v01_ch06_p05.png', '/profile/upload/chapter/7/2020-12-03/file20201203213216._Gintama_v01_ch06_p05.png', '1', '0', 'admin', '2020-12-03 21:32:16', '', NULL, 'D:/smanga/uploadPath/upload/chapter/7/2020-12-03/file20201203213216._Gintama_v01_ch06_p05.png'),
(446, 'file20201203213216._Gintama_v01_ch06_p06.png', '/profile/upload/chapter/7/2020-12-03/file20201203213216._Gintama_v01_ch06_p06.png', '1', '0', 'admin', '2020-12-03 21:32:16', '', NULL, 'D:/smanga/uploadPath/upload/chapter/7/2020-12-03/file20201203213216._Gintama_v01_ch06_p06.png'),
(447, 'file20201203213217._Gintama_v01_ch06_p07.png', '/profile/upload/chapter/7/2020-12-03/file20201203213217._Gintama_v01_ch06_p07.png', '1', '0', 'admin', '2020-12-03 21:32:17', '', NULL, 'D:/smanga/uploadPath/upload/chapter/7/2020-12-03/file20201203213217._Gintama_v01_ch06_p07.png'),
(448, 'file20201203213217._Gintama_v01_ch06_p08.png', '/profile/upload/chapter/7/2020-12-03/file20201203213217._Gintama_v01_ch06_p08.png', '1', '0', 'admin', '2020-12-03 21:32:17', '', NULL, 'D:/smanga/uploadPath/upload/chapter/7/2020-12-03/file20201203213217._Gintama_v01_ch06_p08.png'),
(449, 'file20201203213217._Gintama_v01_ch06_p09.png', '/profile/upload/chapter/7/2020-12-03/file20201203213217._Gintama_v01_ch06_p09.png', '1', '0', 'admin', '2020-12-03 21:32:17', '', NULL, 'D:/smanga/uploadPath/upload/chapter/7/2020-12-03/file20201203213217._Gintama_v01_ch06_p09.png'),
(450, 'file20201203213218._Gintama_v01_ch06_p10.png', '/profile/upload/chapter/7/2020-12-03/file20201203213218._Gintama_v01_ch06_p10.png', '1', '0', 'admin', '2020-12-03 21:32:18', '', NULL, 'D:/smanga/uploadPath/upload/chapter/7/2020-12-03/file20201203213218._Gintama_v01_ch06_p10.png'),
(451, 'file20201203213218._Gintama_v01_ch06_p11.png', '/profile/upload/chapter/7/2020-12-03/file20201203213218._Gintama_v01_ch06_p11.png', '1', '0', 'admin', '2020-12-03 21:32:18', '', NULL, 'D:/smanga/uploadPath/upload/chapter/7/2020-12-03/file20201203213218._Gintama_v01_ch06_p11.png'),
(452, 'file20201203213218._Gintama_v01_ch06_p12.png', '/profile/upload/chapter/7/2020-12-03/file20201203213218._Gintama_v01_ch06_p12.png', '1', '0', 'admin', '2020-12-03 21:32:18', '', NULL, 'D:/smanga/uploadPath/upload/chapter/7/2020-12-03/file20201203213218._Gintama_v01_ch06_p12.png'),
(453, 'file20201203213218._Gintama_v01_ch06_p13.png', '/profile/upload/chapter/7/2020-12-03/file20201203213218._Gintama_v01_ch06_p13.png', '1', '0', 'admin', '2020-12-03 21:32:18', '', NULL, 'D:/smanga/uploadPath/upload/chapter/7/2020-12-03/file20201203213218._Gintama_v01_ch06_p13.png'),
(454, 'file20201203213218._Gintama_v01_ch06_p14.png', '/profile/upload/chapter/7/2020-12-03/file20201203213218._Gintama_v01_ch06_p14.png', '1', '0', 'admin', '2020-12-03 21:32:18', '', NULL, 'D:/smanga/uploadPath/upload/chapter/7/2020-12-03/file20201203213218._Gintama_v01_ch06_p14.png'),
(455, 'file20201203213219._Gintama_v01_ch06_p15.png', '/profile/upload/chapter/7/2020-12-03/file20201203213219._Gintama_v01_ch06_p15.png', '1', '0', 'admin', '2020-12-03 21:32:19', '', NULL, 'D:/smanga/uploadPath/upload/chapter/7/2020-12-03/file20201203213219._Gintama_v01_ch06_p15.png'),
(456, 'file20201203213219._Gintama_v01_ch06_p16.png', '/profile/upload/chapter/7/2020-12-03/file20201203213219._Gintama_v01_ch06_p16.png', '1', '0', 'admin', '2020-12-03 21:32:19', '', NULL, 'D:/smanga/uploadPath/upload/chapter/7/2020-12-03/file20201203213219._Gintama_v01_ch06_p16.png'),
(457, 'file20201203213219._Gintama_v01_ch06_p17.png', '/profile/upload/chapter/7/2020-12-03/file20201203213219._Gintama_v01_ch06_p17.png', '1', '0', 'admin', '2020-12-03 21:32:19', '', NULL, 'D:/smanga/uploadPath/upload/chapter/7/2020-12-03/file20201203213219._Gintama_v01_ch06_p17.png'),
(458, 'file20201203213219._Gintama_v01_ch06_p18.png', '/profile/upload/chapter/7/2020-12-03/file20201203213219._Gintama_v01_ch06_p18.png', '1', '0', 'admin', '2020-12-03 21:32:19', '', NULL, 'D:/smanga/uploadPath/upload/chapter/7/2020-12-03/file20201203213219._Gintama_v01_ch06_p18.png'),
(459, 'file20201203213220._Gintama_v01_ch06_p19.png', '/profile/upload/chapter/7/2020-12-03/file20201203213220._Gintama_v01_ch06_p19.png', '1', '0', 'admin', '2020-12-03 21:32:20', '', NULL, 'D:/smanga/uploadPath/upload/chapter/7/2020-12-03/file20201203213220._Gintama_v01_ch06_p19.png'),
(460, 'file20201203213522.jpg', '/profile/upload/manga/cover/2020-12-03/file20201203213522.jpg', '1', '0', 'admin', '2020-12-03 21:35:22', 'admin', '2020-12-03 21:35:23', 'D:/smanga/uploadPath/upload/manga/cover/2020-12-03/file20201203213522.jpg'),
(513, 'file20201203215752.OnePunchManc001mixp000000x1c001Boon.jpg', '/profile/upload/chapter/8/2020-12-03/file20201203215752.OnePunchManc001mixp000000x1c001Boon.jpg', '1', '0', 'admin', '2020-12-03 21:57:52', '', NULL, 'D:/smanga/uploadPath/upload/chapter/8/2020-12-03/file20201203215752.OnePunchManc001mixp000000x1c001Boon.jpg'),
(514, 'file20201203215752.OnePunchManc001mixp000x2000x3c001Boon.jpg', '/profile/upload/chapter/8/2020-12-03/file20201203215752.OnePunchManc001mixp000x2000x3c001Boon.jpg', '1', '0', 'admin', '2020-12-03 21:57:52', '', NULL, 'D:/smanga/uploadPath/upload/chapter/8/2020-12-03/file20201203215752.OnePunchManc001mixp000x2000x3c001Boon.jpg'),
(515, 'file20201203215753.OnePunchManc001mixp000x4000x5c001Boon.jpg', '/profile/upload/chapter/8/2020-12-03/file20201203215753.OnePunchManc001mixp000x4000x5c001Boon.jpg', '1', '0', 'admin', '2020-12-03 21:57:53', '', NULL, 'D:/smanga/uploadPath/upload/chapter/8/2020-12-03/file20201203215753.OnePunchManc001mixp000x4000x5c001Boon.jpg');
INSERT INTO `image_file` (`id`, `image_name`, `image_path`, `used_status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `absolute_path`) VALUES
(516, 'file20201203215753.OnePunchManc001mixp000x6c001Boon.jpg', '/profile/upload/chapter/8/2020-12-03/file20201203215753.OnePunchManc001mixp000x6c001Boon.jpg', '1', '0', 'admin', '2020-12-03 21:57:53', '', NULL, 'D:/smanga/uploadPath/upload/chapter/8/2020-12-03/file20201203215753.OnePunchManc001mixp000x6c001Boon.jpg'),
(517, 'file20201203215753.OnePunchManc001mixp001c001Boon.jpg', '/profile/upload/chapter/8/2020-12-03/file20201203215753.OnePunchManc001mixp001c001Boon.jpg', '1', '0', 'admin', '2020-12-03 21:57:53', '', NULL, 'D:/smanga/uploadPath/upload/chapter/8/2020-12-03/file20201203215753.OnePunchManc001mixp001c001Boon.jpg'),
(518, 'file20201203215753.OnePunchManc001mixp002c001Boon.jpg', '/profile/upload/chapter/8/2020-12-03/file20201203215753.OnePunchManc001mixp002c001Boon.jpg', '1', '0', 'admin', '2020-12-03 21:57:53', '', NULL, 'D:/smanga/uploadPath/upload/chapter/8/2020-12-03/file20201203215753.OnePunchManc001mixp002c001Boon.jpg'),
(519, 'file20201203215754.OnePunchManc001mixp003c001Boon.jpg', '/profile/upload/chapter/8/2020-12-03/file20201203215754.OnePunchManc001mixp003c001Boon.jpg', '1', '0', 'admin', '2020-12-03 21:57:54', '', NULL, 'D:/smanga/uploadPath/upload/chapter/8/2020-12-03/file20201203215754.OnePunchManc001mixp003c001Boon.jpg'),
(520, 'file20201203215754.OnePunchManc001mixp004c001Boon.jpg', '/profile/upload/chapter/8/2020-12-03/file20201203215754.OnePunchManc001mixp004c001Boon.jpg', '1', '0', 'admin', '2020-12-03 21:57:54', '', NULL, 'D:/smanga/uploadPath/upload/chapter/8/2020-12-03/file20201203215754.OnePunchManc001mixp004c001Boon.jpg'),
(521, 'file20201203215754.OnePunchManc001mixp005c001Boon.jpg', '/profile/upload/chapter/8/2020-12-03/file20201203215754.OnePunchManc001mixp005c001Boon.jpg', '1', '0', 'admin', '2020-12-03 21:57:54', '', NULL, 'D:/smanga/uploadPath/upload/chapter/8/2020-12-03/file20201203215754.OnePunchManc001mixp005c001Boon.jpg'),
(522, 'file20201203215754.OnePunchManc001mixp006007c001Boon.jpg', '/profile/upload/chapter/8/2020-12-03/file20201203215754.OnePunchManc001mixp006007c001Boon.jpg', '1', '0', 'admin', '2020-12-03 21:57:54', '', NULL, 'D:/smanga/uploadPath/upload/chapter/8/2020-12-03/file20201203215754.OnePunchManc001mixp006007c001Boon.jpg'),
(523, 'file20201203215754.OnePunchManc001mixp008c001Boon.jpg', '/profile/upload/chapter/8/2020-12-03/file20201203215754.OnePunchManc001mixp008c001Boon.jpg', '1', '0', 'admin', '2020-12-03 21:57:54', '', NULL, 'D:/smanga/uploadPath/upload/chapter/8/2020-12-03/file20201203215754.OnePunchManc001mixp008c001Boon.jpg'),
(524, 'file20201203215755.OnePunchManc001mixp009c001Boon.jpg', '/profile/upload/chapter/8/2020-12-03/file20201203215755.OnePunchManc001mixp009c001Boon.jpg', '1', '0', 'admin', '2020-12-03 21:57:55', '', NULL, 'D:/smanga/uploadPath/upload/chapter/8/2020-12-03/file20201203215755.OnePunchManc001mixp009c001Boon.jpg'),
(525, 'file20201203215755.OnePunchManc001mixp010c001Boon.jpg', '/profile/upload/chapter/8/2020-12-03/file20201203215755.OnePunchManc001mixp010c001Boon.jpg', '1', '0', 'admin', '2020-12-03 21:57:55', '', NULL, 'D:/smanga/uploadPath/upload/chapter/8/2020-12-03/file20201203215755.OnePunchManc001mixp010c001Boon.jpg'),
(526, 'file20201203215755.OnePunchManc001mixp011c001Boon.jpg', '/profile/upload/chapter/8/2020-12-03/file20201203215755.OnePunchManc001mixp011c001Boon.jpg', '1', '0', 'admin', '2020-12-03 21:57:55', '', NULL, 'D:/smanga/uploadPath/upload/chapter/8/2020-12-03/file20201203215755.OnePunchManc001mixp011c001Boon.jpg'),
(527, 'file20201203215755.OnePunchManc001mixp012c001Boon.jpg', '/profile/upload/chapter/8/2020-12-03/file20201203215755.OnePunchManc001mixp012c001Boon.jpg', '1', '0', 'admin', '2020-12-03 21:57:55', '', NULL, 'D:/smanga/uploadPath/upload/chapter/8/2020-12-03/file20201203215755.OnePunchManc001mixp012c001Boon.jpg'),
(528, 'file20201203215756.OnePunchManc001mixp013c001Boon.jpg', '/profile/upload/chapter/8/2020-12-03/file20201203215756.OnePunchManc001mixp013c001Boon.jpg', '1', '0', 'admin', '2020-12-03 21:57:56', '', NULL, 'D:/smanga/uploadPath/upload/chapter/8/2020-12-03/file20201203215756.OnePunchManc001mixp013c001Boon.jpg'),
(529, 'file20201203215756.OnePunchManc001mixp014c001Boon.jpg', '/profile/upload/chapter/8/2020-12-03/file20201203215756.OnePunchManc001mixp014c001Boon.jpg', '1', '0', 'admin', '2020-12-03 21:57:56', '', NULL, 'D:/smanga/uploadPath/upload/chapter/8/2020-12-03/file20201203215756.OnePunchManc001mixp014c001Boon.jpg'),
(530, 'file20201203215756.OnePunchManc001mixp015c001Boon.jpg', '/profile/upload/chapter/8/2020-12-03/file20201203215756.OnePunchManc001mixp015c001Boon.jpg', '1', '0', 'admin', '2020-12-03 21:57:56', '', NULL, 'D:/smanga/uploadPath/upload/chapter/8/2020-12-03/file20201203215756.OnePunchManc001mixp015c001Boon.jpg'),
(531, 'file20201203215757.OnePunchManc001mixp016c001Boon.jpg', '/profile/upload/chapter/8/2020-12-03/file20201203215757.OnePunchManc001mixp016c001Boon.jpg', '1', '0', 'admin', '2020-12-03 21:57:57', '', NULL, 'D:/smanga/uploadPath/upload/chapter/8/2020-12-03/file20201203215757.OnePunchManc001mixp016c001Boon.jpg'),
(532, 'file20201203215757.OnePunchManc001mixp017c001Boon.jpg', '/profile/upload/chapter/8/2020-12-03/file20201203215757.OnePunchManc001mixp017c001Boon.jpg', '1', '0', 'admin', '2020-12-03 21:57:57', '', NULL, 'D:/smanga/uploadPath/upload/chapter/8/2020-12-03/file20201203215757.OnePunchManc001mixp017c001Boon.jpg'),
(533, 'file20201203215757.OnePunchManc001mixp018019c001Boon.jpg', '/profile/upload/chapter/8/2020-12-03/file20201203215757.OnePunchManc001mixp018019c001Boon.jpg', '1', '0', 'admin', '2020-12-03 21:57:57', '', NULL, 'D:/smanga/uploadPath/upload/chapter/8/2020-12-03/file20201203215757.OnePunchManc001mixp018019c001Boon.jpg'),
(534, 'file20201203215757.OnePunchManc001mixp020c001Boon.jpg', '/profile/upload/chapter/8/2020-12-03/file20201203215757.OnePunchManc001mixp020c001Boon.jpg', '1', '0', 'admin', '2020-12-03 21:57:57', '', NULL, 'D:/smanga/uploadPath/upload/chapter/8/2020-12-03/file20201203215757.OnePunchManc001mixp020c001Boon.jpg'),
(535, 'file20201203215758.OnePunchManc001mixp021c001Boon.jpg', '/profile/upload/chapter/8/2020-12-03/file20201203215758.OnePunchManc001mixp021c001Boon.jpg', '1', '0', 'admin', '2020-12-03 21:57:58', '', NULL, 'D:/smanga/uploadPath/upload/chapter/8/2020-12-03/file20201203215758.OnePunchManc001mixp021c001Boon.jpg'),
(536, 'file20201203215758.OnePunchManc001mixp022023c001Boon.jpg', '/profile/upload/chapter/8/2020-12-03/file20201203215758.OnePunchManc001mixp022023c001Boon.jpg', '1', '0', 'admin', '2020-12-03 21:57:58', '', NULL, 'D:/smanga/uploadPath/upload/chapter/8/2020-12-03/file20201203215758.OnePunchManc001mixp022023c001Boon.jpg'),
(537, 'file20201203215758.OnePunchManc001mixp024025c001Boon.jpg', '/profile/upload/chapter/8/2020-12-03/file20201203215758.OnePunchManc001mixp024025c001Boon.jpg', '1', '0', 'admin', '2020-12-03 21:57:58', '', NULL, 'D:/smanga/uploadPath/upload/chapter/8/2020-12-03/file20201203215758.OnePunchManc001mixp024025c001Boon.jpg'),
(538, 'file20201203215758.OnePunchManc001mixp026c001Boon.jpg', '/profile/upload/chapter/8/2020-12-03/file20201203215758.OnePunchManc001mixp026c001Boon.jpg', '1', '0', 'admin', '2020-12-03 21:57:58', '', NULL, 'D:/smanga/uploadPath/upload/chapter/8/2020-12-03/file20201203215758.OnePunchManc001mixp026c001Boon.jpg'),
(539, 'file20201203215901.OnePunchManc002webp027c002Boon.jpg', '/profile/upload/chapter/9/2020-12-03/file20201203215901.OnePunchManc002webp027c002Boon.jpg', '1', '0', 'admin', '2020-12-03 21:59:01', '', NULL, 'D:/smanga/uploadPath/upload/chapter/9/2020-12-03/file20201203215901.OnePunchManc002webp027c002Boon.jpg'),
(540, 'file20201203215901.OnePunchManc002webp028c002Boon.jpg', '/profile/upload/chapter/9/2020-12-03/file20201203215901.OnePunchManc002webp028c002Boon.jpg', '1', '0', 'admin', '2020-12-03 21:59:01', '', NULL, 'D:/smanga/uploadPath/upload/chapter/9/2020-12-03/file20201203215901.OnePunchManc002webp028c002Boon.jpg'),
(541, 'file20201203215902.OnePunchManc002webp029c002Boon.jpg', '/profile/upload/chapter/9/2020-12-03/file20201203215902.OnePunchManc002webp029c002Boon.jpg', '1', '0', 'admin', '2020-12-03 21:59:02', '', NULL, 'D:/smanga/uploadPath/upload/chapter/9/2020-12-03/file20201203215902.OnePunchManc002webp029c002Boon.jpg'),
(542, 'file20201203215902.OnePunchManc002webp030c002Boon.jpg', '/profile/upload/chapter/9/2020-12-03/file20201203215902.OnePunchManc002webp030c002Boon.jpg', '1', '0', 'admin', '2020-12-03 21:59:02', '', NULL, 'D:/smanga/uploadPath/upload/chapter/9/2020-12-03/file20201203215902.OnePunchManc002webp030c002Boon.jpg'),
(543, 'file20201203215902.OnePunchManc002webp031c002Boon.jpg', '/profile/upload/chapter/9/2020-12-03/file20201203215902.OnePunchManc002webp031c002Boon.jpg', '1', '0', 'admin', '2020-12-03 21:59:02', '', NULL, 'D:/smanga/uploadPath/upload/chapter/9/2020-12-03/file20201203215902.OnePunchManc002webp031c002Boon.jpg'),
(544, 'file20201203215902.OnePunchManc002webp032c002Boon.jpg', '/profile/upload/chapter/9/2020-12-03/file20201203215902.OnePunchManc002webp032c002Boon.jpg', '1', '0', 'admin', '2020-12-03 21:59:02', '', NULL, 'D:/smanga/uploadPath/upload/chapter/9/2020-12-03/file20201203215902.OnePunchManc002webp032c002Boon.jpg'),
(545, 'file20201203215902.OnePunchManc002webp033c002Boon.jpg', '/profile/upload/chapter/9/2020-12-03/file20201203215902.OnePunchManc002webp033c002Boon.jpg', '1', '0', 'admin', '2020-12-03 21:59:02', '', NULL, 'D:/smanga/uploadPath/upload/chapter/9/2020-12-03/file20201203215902.OnePunchManc002webp033c002Boon.jpg'),
(546, 'file20201203215903.OnePunchManc002webp034c002Boon.jpg', '/profile/upload/chapter/9/2020-12-03/file20201203215903.OnePunchManc002webp034c002Boon.jpg', '1', '0', 'admin', '2020-12-03 21:59:03', '', NULL, 'D:/smanga/uploadPath/upload/chapter/9/2020-12-03/file20201203215903.OnePunchManc002webp034c002Boon.jpg'),
(547, 'file20201203215903.OnePunchManc002webp035c002Boon.jpg', '/profile/upload/chapter/9/2020-12-03/file20201203215903.OnePunchManc002webp035c002Boon.jpg', '1', '0', 'admin', '2020-12-03 21:59:03', '', NULL, 'D:/smanga/uploadPath/upload/chapter/9/2020-12-03/file20201203215903.OnePunchManc002webp035c002Boon.jpg'),
(548, 'file20201203215903.OnePunchManc002webp036c002Boon.jpg', '/profile/upload/chapter/9/2020-12-03/file20201203215903.OnePunchManc002webp036c002Boon.jpg', '1', '0', 'admin', '2020-12-03 21:59:03', '', NULL, 'D:/smanga/uploadPath/upload/chapter/9/2020-12-03/file20201203215903.OnePunchManc002webp036c002Boon.jpg'),
(549, 'file20201203215903.OnePunchManc002webp037c002Boon.jpg', '/profile/upload/chapter/9/2020-12-03/file20201203215903.OnePunchManc002webp037c002Boon.jpg', '1', '0', 'admin', '2020-12-03 21:59:03', '', NULL, 'D:/smanga/uploadPath/upload/chapter/9/2020-12-03/file20201203215903.OnePunchManc002webp037c002Boon.jpg'),
(550, 'file20201203215903.OnePunchManc002webp038c002Boon.jpg', '/profile/upload/chapter/9/2020-12-03/file20201203215903.OnePunchManc002webp038c002Boon.jpg', '1', '0', 'admin', '2020-12-03 21:59:03', '', NULL, 'D:/smanga/uploadPath/upload/chapter/9/2020-12-03/file20201203215903.OnePunchManc002webp038c002Boon.jpg'),
(551, 'file20201203215904.OnePunchManc002webp039c002Boon.jpg', '/profile/upload/chapter/9/2020-12-03/file20201203215904.OnePunchManc002webp039c002Boon.jpg', '1', '0', 'admin', '2020-12-03 21:59:04', '', NULL, 'D:/smanga/uploadPath/upload/chapter/9/2020-12-03/file20201203215904.OnePunchManc002webp039c002Boon.jpg'),
(552, 'file20201203215904.OnePunchManc002webp040c002Boon.jpg', '/profile/upload/chapter/9/2020-12-03/file20201203215904.OnePunchManc002webp040c002Boon.jpg', '1', '0', 'admin', '2020-12-03 21:59:04', '', NULL, 'D:/smanga/uploadPath/upload/chapter/9/2020-12-03/file20201203215904.OnePunchManc002webp040c002Boon.jpg'),
(553, 'file20201203215904.OnePunchManc002webp041c002Boon.jpg', '/profile/upload/chapter/9/2020-12-03/file20201203215904.OnePunchManc002webp041c002Boon.jpg', '1', '0', 'admin', '2020-12-03 21:59:04', '', NULL, 'D:/smanga/uploadPath/upload/chapter/9/2020-12-03/file20201203215904.OnePunchManc002webp041c002Boon.jpg'),
(554, 'file20201203215904.OnePunchManc002webp042c002Boon.jpg', '/profile/upload/chapter/9/2020-12-03/file20201203215904.OnePunchManc002webp042c002Boon.jpg', '1', '0', 'admin', '2020-12-03 21:59:04', '', NULL, 'D:/smanga/uploadPath/upload/chapter/9/2020-12-03/file20201203215904.OnePunchManc002webp042c002Boon.jpg'),
(555, 'file20201203215922.OnePunchManc003webp043c003Boon.jpg', '/profile/upload/chapter/10/2020-12-03/file20201203215922.OnePunchManc003webp043c003Boon.jpg', '1', '0', 'admin', '2020-12-03 21:59:22', '', NULL, 'D:/smanga/uploadPath/upload/chapter/10/2020-12-03/file20201203215922.OnePunchManc003webp043c003Boon.jpg'),
(556, 'file20201203215922.OnePunchManc003webp044c003Boon.jpg', '/profile/upload/chapter/10/2020-12-03/file20201203215922.OnePunchManc003webp044c003Boon.jpg', '1', '0', 'admin', '2020-12-03 21:59:22', '', NULL, 'D:/smanga/uploadPath/upload/chapter/10/2020-12-03/file20201203215922.OnePunchManc003webp044c003Boon.jpg'),
(557, 'file20201203215922.OnePunchManc003webp045c003Boon.jpg', '/profile/upload/chapter/10/2020-12-03/file20201203215922.OnePunchManc003webp045c003Boon.jpg', '1', '0', 'admin', '2020-12-03 21:59:22', '', NULL, 'D:/smanga/uploadPath/upload/chapter/10/2020-12-03/file20201203215922.OnePunchManc003webp045c003Boon.jpg'),
(558, 'file20201203215923.OnePunchManc003webp046c003Boon.jpg', '/profile/upload/chapter/10/2020-12-03/file20201203215923.OnePunchManc003webp046c003Boon.jpg', '1', '0', 'admin', '2020-12-03 21:59:23', '', NULL, 'D:/smanga/uploadPath/upload/chapter/10/2020-12-03/file20201203215923.OnePunchManc003webp046c003Boon.jpg'),
(559, 'file20201203215923.OnePunchManc003webp047c003Boon.jpg', '/profile/upload/chapter/10/2020-12-03/file20201203215923.OnePunchManc003webp047c003Boon.jpg', '1', '0', 'admin', '2020-12-03 21:59:23', '', NULL, 'D:/smanga/uploadPath/upload/chapter/10/2020-12-03/file20201203215923.OnePunchManc003webp047c003Boon.jpg'),
(560, 'file20201203215923.OnePunchManc003webp048c003Boon.jpg', '/profile/upload/chapter/10/2020-12-03/file20201203215923.OnePunchManc003webp048c003Boon.jpg', '1', '0', 'admin', '2020-12-03 21:59:23', '', NULL, 'D:/smanga/uploadPath/upload/chapter/10/2020-12-03/file20201203215923.OnePunchManc003webp048c003Boon.jpg'),
(561, 'file20201203215923.OnePunchManc003webp049c003Boon.jpg', '/profile/upload/chapter/10/2020-12-03/file20201203215923.OnePunchManc003webp049c003Boon.jpg', '1', '0', 'admin', '2020-12-03 21:59:23', '', NULL, 'D:/smanga/uploadPath/upload/chapter/10/2020-12-03/file20201203215923.OnePunchManc003webp049c003Boon.jpg'),
(562, 'file20201203215924.OnePunchManc003webp050c003Boon.jpg', '/profile/upload/chapter/10/2020-12-03/file20201203215924.OnePunchManc003webp050c003Boon.jpg', '1', '0', 'admin', '2020-12-03 21:59:24', '', NULL, 'D:/smanga/uploadPath/upload/chapter/10/2020-12-03/file20201203215924.OnePunchManc003webp050c003Boon.jpg'),
(563, 'file20201203215924.OnePunchManc003webp051c003Boon.jpg', '/profile/upload/chapter/10/2020-12-03/file20201203215924.OnePunchManc003webp051c003Boon.jpg', '1', '0', 'admin', '2020-12-03 21:59:24', '', NULL, 'D:/smanga/uploadPath/upload/chapter/10/2020-12-03/file20201203215924.OnePunchManc003webp051c003Boon.jpg'),
(564, 'file20201203215924.OnePunchManc003webp052c003Boon.jpg', '/profile/upload/chapter/10/2020-12-03/file20201203215924.OnePunchManc003webp052c003Boon.jpg', '1', '0', 'admin', '2020-12-03 21:59:24', '', NULL, 'D:/smanga/uploadPath/upload/chapter/10/2020-12-03/file20201203215924.OnePunchManc003webp052c003Boon.jpg'),
(565, 'file20201203215924.OnePunchManc003webp053c003Boon.jpg', '/profile/upload/chapter/10/2020-12-03/file20201203215924.OnePunchManc003webp053c003Boon.jpg', '1', '0', 'admin', '2020-12-03 21:59:24', '', NULL, 'D:/smanga/uploadPath/upload/chapter/10/2020-12-03/file20201203215924.OnePunchManc003webp053c003Boon.jpg'),
(566, 'file20201203215925.OnePunchManc003webp054c003Boon.jpg', '/profile/upload/chapter/10/2020-12-03/file20201203215925.OnePunchManc003webp054c003Boon.jpg', '1', '0', 'admin', '2020-12-03 21:59:25', '', NULL, 'D:/smanga/uploadPath/upload/chapter/10/2020-12-03/file20201203215925.OnePunchManc003webp054c003Boon.jpg'),
(567, 'file20201203215925.OnePunchManc003webp055c003Boon.jpg', '/profile/upload/chapter/10/2020-12-03/file20201203215925.OnePunchManc003webp055c003Boon.jpg', '1', '0', 'admin', '2020-12-03 21:59:25', '', NULL, 'D:/smanga/uploadPath/upload/chapter/10/2020-12-03/file20201203215925.OnePunchManc003webp055c003Boon.jpg'),
(568, 'file20201203215925.OnePunchManc003webp056c003Boon.jpg', '/profile/upload/chapter/10/2020-12-03/file20201203215925.OnePunchManc003webp056c003Boon.jpg', '1', '0', 'admin', '2020-12-03 21:59:25', '', NULL, 'D:/smanga/uploadPath/upload/chapter/10/2020-12-03/file20201203215925.OnePunchManc003webp056c003Boon.jpg'),
(569, 'file20201203215925.OnePunchManc003webp057c003Boon.jpg', '/profile/upload/chapter/10/2020-12-03/file20201203215925.OnePunchManc003webp057c003Boon.jpg', '1', '0', 'admin', '2020-12-03 21:59:25', '', NULL, 'D:/smanga/uploadPath/upload/chapter/10/2020-12-03/file20201203215925.OnePunchManc003webp057c003Boon.jpg'),
(570, 'file20201203215926.OnePunchManc003webp058c003Boon.jpg', '/profile/upload/chapter/10/2020-12-03/file20201203215926.OnePunchManc003webp058c003Boon.jpg', '1', '0', 'admin', '2020-12-03 21:59:26', '', NULL, 'D:/smanga/uploadPath/upload/chapter/10/2020-12-03/file20201203215926.OnePunchManc003webp058c003Boon.jpg'),
(571, 'file20201203215926.OnePunchManc003webp059c003Boon.jpg', '/profile/upload/chapter/10/2020-12-03/file20201203215926.OnePunchManc003webp059c003Boon.jpg', '1', '0', 'admin', '2020-12-03 21:59:26', '', NULL, 'D:/smanga/uploadPath/upload/chapter/10/2020-12-03/file20201203215926.OnePunchManc003webp059c003Boon.jpg'),
(572, 'file20201203215926.OnePunchManc003webp060061c003Boon.jpg', '/profile/upload/chapter/10/2020-12-03/file20201203215926.OnePunchManc003webp060061c003Boon.jpg', '1', '0', 'admin', '2020-12-03 21:59:26', '', NULL, 'D:/smanga/uploadPath/upload/chapter/10/2020-12-03/file20201203215926.OnePunchManc003webp060061c003Boon.jpg'),
(573, 'file20201203215926.OnePunchManc003webp062063c003Boon.jpg', '/profile/upload/chapter/10/2020-12-03/file20201203215926.OnePunchManc003webp062063c003Boon.jpg', '1', '0', 'admin', '2020-12-03 21:59:26', '', NULL, 'D:/smanga/uploadPath/upload/chapter/10/2020-12-03/file20201203215926.OnePunchManc003webp062063c003Boon.jpg'),
(574, 'file20201203215926.OnePunchManc003webp064c003Boon.jpg', '/profile/upload/chapter/10/2020-12-03/file20201203215926.OnePunchManc003webp064c003Boon.jpg', '1', '0', 'admin', '2020-12-03 21:59:26', '', NULL, 'D:/smanga/uploadPath/upload/chapter/10/2020-12-03/file20201203215926.OnePunchManc003webp064c003Boon.jpg'),
(575, 'file20201203220255.jpg', '/profile/upload/manga/cover/2020-12-03/file20201203220255.jpg', '1', '0', 'admin', '2020-12-03 22:02:55', 'admin', '2020-12-03 22:02:56', 'D:/smanga/uploadPath/upload/manga/cover/2020-12-03/file20201203220255.jpg'),
(576, 'file20201203220503.0001.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220503.0001.jpg', '1', '0', 'admin', '2020-12-03 22:05:03', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220503.0001.jpg'),
(577, 'file20201203220503.0002.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220503.0002.jpg', '1', '0', 'admin', '2020-12-03 22:05:03', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220503.0002.jpg'),
(578, 'file20201203220504.0003.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220504.0003.jpg', '1', '0', 'admin', '2020-12-03 22:05:04', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220504.0003.jpg'),
(579, 'file20201203220504.0004.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220504.0004.jpg', '1', '0', 'admin', '2020-12-03 22:05:04', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220504.0004.jpg'),
(580, 'file20201203220504.0005.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220504.0005.jpg', '1', '0', 'admin', '2020-12-03 22:05:04', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220504.0005.jpg'),
(581, 'file20201203220504.0006.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220504.0006.jpg', '1', '0', 'admin', '2020-12-03 22:05:04', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220504.0006.jpg'),
(582, 'file20201203220505.CCF.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220505.CCF.jpg', '1', '0', 'admin', '2020-12-03 22:05:05', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220505.CCF.jpg'),
(583, 'file20201203220505.CCF0001.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220505.CCF0001.jpg', '1', '0', 'admin', '2020-12-03 22:05:05', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220505.CCF0001.jpg'),
(584, 'file20201203220505.CCF0002.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220505.CCF0002.jpg', '1', '0', 'admin', '2020-12-03 22:05:05', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220505.CCF0002.jpg'),
(585, 'file20201203220505.CCF0003.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220505.CCF0003.jpg', '1', '0', 'admin', '2020-12-03 22:05:05', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220505.CCF0003.jpg'),
(586, 'file20201203220506.CCF0004.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220506.CCF0004.jpg', '1', '0', 'admin', '2020-12-03 22:05:06', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220506.CCF0004.jpg'),
(587, 'file20201203220506.CCF0005.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220506.CCF0005.jpg', '1', '0', 'admin', '2020-12-03 22:05:06', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220506.CCF0005.jpg'),
(588, 'file20201203220506.CCF0006.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220506.CCF0006.jpg', '1', '0', 'admin', '2020-12-03 22:05:06', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220506.CCF0006.jpg'),
(589, 'file20201203220507.CCF0007.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220507.CCF0007.jpg', '1', '0', 'admin', '2020-12-03 22:05:07', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220507.CCF0007.jpg'),
(590, 'file20201203220507.CCF0008.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220507.CCF0008.jpg', '1', '0', 'admin', '2020-12-03 22:05:07', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220507.CCF0008.jpg'),
(591, 'file20201203220507.CCF0009.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220507.CCF0009.jpg', '1', '0', 'admin', '2020-12-03 22:05:07', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220507.CCF0009.jpg'),
(592, 'file20201203220507.CCF0010.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220507.CCF0010.jpg', '1', '0', 'admin', '2020-12-03 22:05:07', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220507.CCF0010.jpg'),
(593, 'file20201203220507.CCF0011.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220507.CCF0011.jpg', '1', '0', 'admin', '2020-12-03 22:05:07', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220507.CCF0011.jpg'),
(594, 'file20201203220508.CCF0012.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220508.CCF0012.jpg', '1', '0', 'admin', '2020-12-03 22:05:08', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220508.CCF0012.jpg'),
(595, 'file20201203220508.CCF0013.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220508.CCF0013.jpg', '1', '0', 'admin', '2020-12-03 22:05:08', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220508.CCF0013.jpg'),
(596, 'file20201203220508.CCF0014.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220508.CCF0014.jpg', '1', '0', 'admin', '2020-12-03 22:05:08', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220508.CCF0014.jpg'),
(597, 'file20201203220508.CCF0015.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220508.CCF0015.jpg', '1', '0', 'admin', '2020-12-03 22:05:08', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220508.CCF0015.jpg'),
(598, 'file20201203220509.CCF0016.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220509.CCF0016.jpg', '1', '0', 'admin', '2020-12-03 22:05:09', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220509.CCF0016.jpg'),
(599, 'file20201203220509.CCF0017.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220509.CCF0017.jpg', '1', '0', 'admin', '2020-12-03 22:05:09', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220509.CCF0017.jpg'),
(600, 'file20201203220509.CCF0018.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220509.CCF0018.jpg', '1', '0', 'admin', '2020-12-03 22:05:09', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220509.CCF0018.jpg'),
(601, 'file20201203220509.CCF0019.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220509.CCF0019.jpg', '1', '0', 'admin', '2020-12-03 22:05:09', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220509.CCF0019.jpg'),
(602, 'file20201203220509.CCF0020.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220509.CCF0020.jpg', '1', '0', 'admin', '2020-12-03 22:05:09', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220509.CCF0020.jpg'),
(603, 'file20201203220510.CCF0021.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220510.CCF0021.jpg', '1', '0', 'admin', '2020-12-03 22:05:10', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220510.CCF0021.jpg'),
(604, 'file20201203220510.CCF0022.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220510.CCF0022.jpg', '1', '0', 'admin', '2020-12-03 22:05:10', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220510.CCF0022.jpg'),
(605, 'file20201203220510.CCF0023.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220510.CCF0023.jpg', '1', '0', 'admin', '2020-12-03 22:05:10', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220510.CCF0023.jpg'),
(606, 'file20201203220510.CCF0024.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220510.CCF0024.jpg', '1', '0', 'admin', '2020-12-03 22:05:10', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220510.CCF0024.jpg'),
(607, 'file20201203220511.CCF0025.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220511.CCF0025.jpg', '1', '0', 'admin', '2020-12-03 22:05:11', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220511.CCF0025.jpg'),
(608, 'file20201203220511.CCF0026.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220511.CCF0026.jpg', '1', '0', 'admin', '2020-12-03 22:05:11', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220511.CCF0026.jpg'),
(609, 'file20201203220511.CCF0027.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220511.CCF0027.jpg', '1', '0', 'admin', '2020-12-03 22:05:11', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220511.CCF0027.jpg'),
(610, 'file20201203220511.CCF0028.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220511.CCF0028.jpg', '1', '0', 'admin', '2020-12-03 22:05:11', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220511.CCF0028.jpg'),
(611, 'file20201203220512.CCF0029.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220512.CCF0029.jpg', '1', '0', 'admin', '2020-12-03 22:05:12', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220512.CCF0029.jpg'),
(612, 'file20201203220512.CCF0030.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220512.CCF0030.jpg', '1', '0', 'admin', '2020-12-03 22:05:12', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220512.CCF0030.jpg'),
(613, 'file20201203220512.CCF0031.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220512.CCF0031.jpg', '1', '0', 'admin', '2020-12-03 22:05:12', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220512.CCF0031.jpg'),
(614, 'file20201203220512.CCF0032.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220512.CCF0032.jpg', '1', '0', 'admin', '2020-12-03 22:05:12', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220512.CCF0032.jpg'),
(615, 'file20201203220512.CCF0033.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220512.CCF0033.jpg', '1', '0', 'admin', '2020-12-03 22:05:12', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220512.CCF0033.jpg'),
(616, 'file20201203220513.CCF0034.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220513.CCF0034.jpg', '1', '0', 'admin', '2020-12-03 22:05:13', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220513.CCF0034.jpg'),
(617, 'file20201203220513.CCF0035.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220513.CCF0035.jpg', '1', '0', 'admin', '2020-12-03 22:05:13', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220513.CCF0035.jpg'),
(618, 'file20201203220513.CCF0036.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220513.CCF0036.jpg', '1', '0', 'admin', '2020-12-03 22:05:13', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220513.CCF0036.jpg'),
(619, 'file20201203220513.CCF0037.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220513.CCF0037.jpg', '1', '0', 'admin', '2020-12-03 22:05:13', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220513.CCF0037.jpg'),
(620, 'file20201203220514.CCF0038.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220514.CCF0038.jpg', '1', '0', 'admin', '2020-12-03 22:05:14', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220514.CCF0038.jpg'),
(621, 'file20201203220514.CCF0039.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220514.CCF0039.jpg', '1', '0', 'admin', '2020-12-03 22:05:14', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220514.CCF0039.jpg'),
(622, 'file20201203220514.CCF0040.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220514.CCF0040.jpg', '1', '0', 'admin', '2020-12-03 22:05:14', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220514.CCF0040.jpg'),
(623, 'file20201203220514.CCF0041.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220514.CCF0041.jpg', '1', '0', 'admin', '2020-12-03 22:05:14', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220514.CCF0041.jpg'),
(624, 'file20201203220515.CCF0042.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220515.CCF0042.jpg', '1', '0', 'admin', '2020-12-03 22:05:15', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220515.CCF0042.jpg'),
(625, 'file20201203220515.CCF0043.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220515.CCF0043.jpg', '1', '0', 'admin', '2020-12-03 22:05:15', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220515.CCF0043.jpg'),
(626, 'file20201203220515.CCF0044.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220515.CCF0044.jpg', '1', '0', 'admin', '2020-12-03 22:05:15', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220515.CCF0044.jpg'),
(627, 'file20201203220515.CCF0045.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220515.CCF0045.jpg', '1', '0', 'admin', '2020-12-03 22:05:15', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220515.CCF0045.jpg'),
(628, 'file20201203220516.CCF0046.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220516.CCF0046.jpg', '1', '0', 'admin', '2020-12-03 22:05:16', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220516.CCF0046.jpg'),
(629, 'file20201203220516.CCF0047.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220516.CCF0047.jpg', '1', '0', 'admin', '2020-12-03 22:05:16', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220516.CCF0047.jpg'),
(630, 'file20201203220516.CCF0048.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220516.CCF0048.jpg', '1', '0', 'admin', '2020-12-03 22:05:16', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220516.CCF0048.jpg'),
(631, 'file20201203220516.CCF0049.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220516.CCF0049.jpg', '1', '0', 'admin', '2020-12-03 22:05:16', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220516.CCF0049.jpg'),
(632, 'file20201203220516.CCF0050.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220516.CCF0050.jpg', '1', '0', 'admin', '2020-12-03 22:05:16', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220516.CCF0050.jpg'),
(633, 'file20201203220517.CCF0051.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220517.CCF0051.jpg', '1', '0', 'admin', '2020-12-03 22:05:17', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220517.CCF0051.jpg'),
(634, 'file20201203220517.CCF0052.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220517.CCF0052.jpg', '1', '0', 'admin', '2020-12-03 22:05:17', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220517.CCF0052.jpg'),
(635, 'file20201203220517.CCF0053.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220517.CCF0053.jpg', '1', '0', 'admin', '2020-12-03 22:05:17', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220517.CCF0053.jpg'),
(636, 'file20201203220517.CCF0054.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220517.CCF0054.jpg', '1', '0', 'admin', '2020-12-03 22:05:17', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220517.CCF0054.jpg'),
(637, 'file20201203220517.CCF0055.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220517.CCF0055.jpg', '1', '0', 'admin', '2020-12-03 22:05:17', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220517.CCF0055.jpg'),
(638, 'file20201203220518.CCF0056.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220518.CCF0056.jpg', '1', '0', 'admin', '2020-12-03 22:05:18', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220518.CCF0056.jpg'),
(639, 'file20201203220518.CCF0057.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220518.CCF0057.jpg', '1', '0', 'admin', '2020-12-03 22:05:18', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220518.CCF0057.jpg'),
(640, 'file20201203220518.CCF0058.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220518.CCF0058.jpg', '1', '0', 'admin', '2020-12-03 22:05:18', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220518.CCF0058.jpg'),
(641, 'file20201203220518.CCF0059.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220518.CCF0059.jpg', '1', '0', 'admin', '2020-12-03 22:05:18', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220518.CCF0059.jpg'),
(642, 'file20201203220519.CCF0060.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220519.CCF0060.jpg', '1', '0', 'admin', '2020-12-03 22:05:19', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220519.CCF0060.jpg'),
(643, 'file20201203220519.CCF0061.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220519.CCF0061.jpg', '1', '0', 'admin', '2020-12-03 22:05:19', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220519.CCF0061.jpg'),
(644, 'file20201203220519.CCF0062.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220519.CCF0062.jpg', '1', '0', 'admin', '2020-12-03 22:05:19', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220519.CCF0062.jpg'),
(645, 'file20201203220519.CCF0063.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220519.CCF0063.jpg', '1', '0', 'admin', '2020-12-03 22:05:19', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220519.CCF0063.jpg'),
(646, 'file20201203220519.CCF0064.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220519.CCF0064.jpg', '1', '0', 'admin', '2020-12-03 22:05:19', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220519.CCF0064.jpg'),
(647, 'file20201203220520.CCF0065.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220520.CCF0065.jpg', '1', '0', 'admin', '2020-12-03 22:05:20', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220520.CCF0065.jpg'),
(648, 'file20201203220520.CCF0066.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220520.CCF0066.jpg', '1', '0', 'admin', '2020-12-03 22:05:20', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220520.CCF0066.jpg'),
(649, 'file20201203220520.CCF0067.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220520.CCF0067.jpg', '1', '0', 'admin', '2020-12-03 22:05:20', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220520.CCF0067.jpg'),
(650, 'file20201203220520.CCF0068.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220520.CCF0068.jpg', '1', '0', 'admin', '2020-12-03 22:05:20', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220520.CCF0068.jpg'),
(651, 'file20201203220521.CCF0069.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220521.CCF0069.jpg', '1', '0', 'admin', '2020-12-03 22:05:21', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220521.CCF0069.jpg'),
(652, 'file20201203220521.CCF0070.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220521.CCF0070.jpg', '1', '0', 'admin', '2020-12-03 22:05:21', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220521.CCF0070.jpg'),
(653, 'file20201203220521.CCF0071.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220521.CCF0071.jpg', '1', '0', 'admin', '2020-12-03 22:05:21', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220521.CCF0071.jpg'),
(654, 'file20201203220521.CCF0072.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220521.CCF0072.jpg', '1', '0', 'admin', '2020-12-03 22:05:21', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220521.CCF0072.jpg'),
(655, 'file20201203220522.CCF0073.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220522.CCF0073.jpg', '1', '0', 'admin', '2020-12-03 22:05:22', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220522.CCF0073.jpg'),
(656, 'file20201203220522.CCF0074.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220522.CCF0074.jpg', '1', '0', 'admin', '2020-12-03 22:05:22', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220522.CCF0074.jpg'),
(657, 'file20201203220522.CCF0075.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220522.CCF0075.jpg', '1', '0', 'admin', '2020-12-03 22:05:22', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220522.CCF0075.jpg'),
(658, 'file20201203220522.CCF0076.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220522.CCF0076.jpg', '1', '0', 'admin', '2020-12-03 22:05:22', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220522.CCF0076.jpg'),
(659, 'file20201203220522.CCF0077.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220522.CCF0077.jpg', '1', '0', 'admin', '2020-12-03 22:05:22', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220522.CCF0077.jpg'),
(660, 'file20201203220523.CCF0078.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220523.CCF0078.jpg', '1', '0', 'admin', '2020-12-03 22:05:23', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220523.CCF0078.jpg'),
(661, 'file20201203220523.CCF0079.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220523.CCF0079.jpg', '1', '0', 'admin', '2020-12-03 22:05:23', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220523.CCF0079.jpg'),
(662, 'file20201203220523.CCF0080.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220523.CCF0080.jpg', '1', '0', 'admin', '2020-12-03 22:05:23', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220523.CCF0080.jpg'),
(663, 'file20201203220523.CCF0081.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220523.CCF0081.jpg', '1', '0', 'admin', '2020-12-03 22:05:23', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220523.CCF0081.jpg'),
(664, 'file20201203220524.CCF0082.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220524.CCF0082.jpg', '1', '0', 'admin', '2020-12-03 22:05:24', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220524.CCF0082.jpg'),
(665, 'file20201203220524.CCF0083.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220524.CCF0083.jpg', '1', '0', 'admin', '2020-12-03 22:05:24', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220524.CCF0083.jpg'),
(666, 'file20201203220524.CCF0084.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220524.CCF0084.jpg', '1', '0', 'admin', '2020-12-03 22:05:24', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220524.CCF0084.jpg'),
(667, 'file20201203220524.CCF0085.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220524.CCF0085.jpg', '1', '0', 'admin', '2020-12-03 22:05:24', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220524.CCF0085.jpg'),
(668, 'file20201203220525.CCF0086.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220525.CCF0086.jpg', '1', '0', 'admin', '2020-12-03 22:05:25', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220525.CCF0086.jpg'),
(669, 'file20201203220525.CCF0087.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220525.CCF0087.jpg', '1', '0', 'admin', '2020-12-03 22:05:25', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220525.CCF0087.jpg'),
(670, 'file20201203220525.CCF0088.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220525.CCF0088.jpg', '1', '0', 'admin', '2020-12-03 22:05:25', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220525.CCF0088.jpg'),
(671, 'file20201203220525.CCF0089.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220525.CCF0089.jpg', '1', '0', 'admin', '2020-12-03 22:05:25', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220525.CCF0089.jpg'),
(672, 'file20201203220525.CCF0090.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220525.CCF0090.jpg', '1', '0', 'admin', '2020-12-03 22:05:25', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220525.CCF0090.jpg'),
(673, 'file20201203220526.CCF0091.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220526.CCF0091.jpg', '1', '0', 'admin', '2020-12-03 22:05:26', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220526.CCF0091.jpg'),
(674, 'file20201203220526.CCF0092.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220526.CCF0092.jpg', '1', '0', 'admin', '2020-12-03 22:05:26', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220526.CCF0092.jpg'),
(675, 'file20201203220526.CCF0093.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220526.CCF0093.jpg', '1', '0', 'admin', '2020-12-03 22:05:26', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220526.CCF0093.jpg'),
(676, 'file20201203220526.CCF0094.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220526.CCF0094.jpg', '1', '0', 'admin', '2020-12-03 22:05:26', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220526.CCF0094.jpg'),
(677, 'file20201203220527.CCF0095.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220527.CCF0095.jpg', '1', '0', 'admin', '2020-12-03 22:05:27', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220527.CCF0095.jpg'),
(678, 'file20201203220527.CCF0096.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220527.CCF0096.jpg', '1', '0', 'admin', '2020-12-03 22:05:27', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220527.CCF0096.jpg'),
(679, 'file20201203220527.CCF0097.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220527.CCF0097.jpg', '1', '0', 'admin', '2020-12-03 22:05:27', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220527.CCF0097.jpg'),
(680, 'file20201203220527.CCF0098.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220527.CCF0098.jpg', '1', '0', 'admin', '2020-12-03 22:05:27', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220527.CCF0098.jpg'),
(681, 'file20201203220528.CCF0099.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220528.CCF0099.jpg', '1', '0', 'admin', '2020-12-03 22:05:28', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220528.CCF0099.jpg'),
(682, 'file20201203220528.CCF0100.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220528.CCF0100.jpg', '1', '0', 'admin', '2020-12-03 22:05:28', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220528.CCF0100.jpg'),
(683, 'file20201203220528.CCF0101.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220528.CCF0101.jpg', '1', '0', 'admin', '2020-12-03 22:05:28', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220528.CCF0101.jpg'),
(684, 'file20201203220528.CCF0102.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220528.CCF0102.jpg', '1', '0', 'admin', '2020-12-03 22:05:28', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220528.CCF0102.jpg'),
(685, 'file20201203220529.CCF0103.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220529.CCF0103.jpg', '1', '0', 'admin', '2020-12-03 22:05:29', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220529.CCF0103.jpg'),
(686, 'file20201203220529.CCF0104.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220529.CCF0104.jpg', '1', '0', 'admin', '2020-12-03 22:05:29', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220529.CCF0104.jpg'),
(687, 'file20201203220529.CCF0105.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220529.CCF0105.jpg', '1', '0', 'admin', '2020-12-03 22:05:29', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220529.CCF0105.jpg'),
(688, 'file20201203220529.CCF0106.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220529.CCF0106.jpg', '1', '0', 'admin', '2020-12-03 22:05:29', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220529.CCF0106.jpg'),
(689, 'file20201203220530.CCF0107.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220530.CCF0107.jpg', '1', '0', 'admin', '2020-12-03 22:05:30', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220530.CCF0107.jpg'),
(690, 'file20201203220530.CCF0108.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220530.CCF0108.jpg', '1', '0', 'admin', '2020-12-03 22:05:30', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220530.CCF0108.jpg'),
(691, 'file20201203220530.CCF0109.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220530.CCF0109.jpg', '1', '0', 'admin', '2020-12-03 22:05:30', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220530.CCF0109.jpg'),
(692, 'file20201203220530.CCF0110.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220530.CCF0110.jpg', '1', '0', 'admin', '2020-12-03 22:05:30', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220530.CCF0110.jpg'),
(693, 'file20201203220531.CCF0111.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220531.CCF0111.jpg', '1', '0', 'admin', '2020-12-03 22:05:31', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220531.CCF0111.jpg'),
(694, 'file20201203220531.CCF0112.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220531.CCF0112.jpg', '1', '0', 'admin', '2020-12-03 22:05:31', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220531.CCF0112.jpg'),
(695, 'file20201203220531.CCF0113.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220531.CCF0113.jpg', '1', '0', 'admin', '2020-12-03 22:05:31', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220531.CCF0113.jpg'),
(696, 'file20201203220531.CCF0114.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220531.CCF0114.jpg', '1', '0', 'admin', '2020-12-03 22:05:31', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220531.CCF0114.jpg'),
(697, 'file20201203220532.CCF0115.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220532.CCF0115.jpg', '1', '0', 'admin', '2020-12-03 22:05:32', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220532.CCF0115.jpg'),
(698, 'file20201203220532.CCF0116.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220532.CCF0116.jpg', '1', '0', 'admin', '2020-12-03 22:05:32', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220532.CCF0116.jpg'),
(699, 'file20201203220532.CCF0117.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220532.CCF0117.jpg', '1', '0', 'admin', '2020-12-03 22:05:32', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220532.CCF0117.jpg'),
(700, 'file20201203220532.CCF0118.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220532.CCF0118.jpg', '1', '0', 'admin', '2020-12-03 22:05:32', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220532.CCF0118.jpg');
INSERT INTO `image_file` (`id`, `image_name`, `image_path`, `used_status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `absolute_path`) VALUES
(701, 'file20201203220533.CCF0119.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220533.CCF0119.jpg', '1', '0', 'admin', '2020-12-03 22:05:33', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220533.CCF0119.jpg'),
(702, 'file20201203220533.CCF0120.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220533.CCF0120.jpg', '1', '0', 'admin', '2020-12-03 22:05:33', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220533.CCF0120.jpg'),
(703, 'file20201203220533.CCF0121.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220533.CCF0121.jpg', '1', '0', 'admin', '2020-12-03 22:05:33', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220533.CCF0121.jpg'),
(704, 'file20201203220533.CCF0122.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220533.CCF0122.jpg', '1', '0', 'admin', '2020-12-03 22:05:33', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220533.CCF0122.jpg'),
(705, 'file20201203220534.CCF0123.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220534.CCF0123.jpg', '1', '0', 'admin', '2020-12-03 22:05:34', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220534.CCF0123.jpg'),
(706, 'file20201203220534.CCF0124.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220534.CCF0124.jpg', '1', '0', 'admin', '2020-12-03 22:05:34', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220534.CCF0124.jpg'),
(707, 'file20201203220534.CCF0125.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220534.CCF0125.jpg', '1', '0', 'admin', '2020-12-03 22:05:34', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220534.CCF0125.jpg'),
(708, 'file20201203220534.CCF0126.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220534.CCF0126.jpg', '1', '0', 'admin', '2020-12-03 22:05:34', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220534.CCF0126.jpg'),
(709, 'file20201203220534.CCF0127.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220534.CCF0127.jpg', '1', '0', 'admin', '2020-12-03 22:05:34', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220534.CCF0127.jpg'),
(710, 'file20201203220535.CCF0128.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220535.CCF0128.jpg', '1', '0', 'admin', '2020-12-03 22:05:35', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220535.CCF0128.jpg'),
(711, 'file20201203220535.CCF0129.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220535.CCF0129.jpg', '1', '0', 'admin', '2020-12-03 22:05:35', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220535.CCF0129.jpg'),
(712, 'file20201203220535.CCF0130.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220535.CCF0130.jpg', '1', '0', 'admin', '2020-12-03 22:05:35', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220535.CCF0130.jpg'),
(713, 'file20201203220535.CCF0131.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220535.CCF0131.jpg', '1', '0', 'admin', '2020-12-03 22:05:35', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220535.CCF0131.jpg'),
(714, 'file20201203220536.CCF0132.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220536.CCF0132.jpg', '1', '0', 'admin', '2020-12-03 22:05:36', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220536.CCF0132.jpg'),
(715, 'file20201203220536.CCF0133.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220536.CCF0133.jpg', '1', '0', 'admin', '2020-12-03 22:05:36', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220536.CCF0133.jpg'),
(716, 'file20201203220536.CCF0134.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220536.CCF0134.jpg', '1', '0', 'admin', '2020-12-03 22:05:36', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220536.CCF0134.jpg'),
(717, 'file20201203220536.CCF0135.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220536.CCF0135.jpg', '1', '0', 'admin', '2020-12-03 22:05:36', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220536.CCF0135.jpg'),
(718, 'file20201203220536.CCF0136.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220536.CCF0136.jpg', '1', '0', 'admin', '2020-12-03 22:05:36', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220536.CCF0136.jpg'),
(719, 'file20201203220537.CCF0137.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220537.CCF0137.jpg', '1', '0', 'admin', '2020-12-03 22:05:37', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220537.CCF0137.jpg'),
(720, 'file20201203220537.CCF0138.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220537.CCF0138.jpg', '1', '0', 'admin', '2020-12-03 22:05:37', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220537.CCF0138.jpg'),
(721, 'file20201203220537.CCF0139.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220537.CCF0139.jpg', '1', '0', 'admin', '2020-12-03 22:05:37', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220537.CCF0139.jpg'),
(722, 'file20201203220537.CCF0140.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220537.CCF0140.jpg', '1', '0', 'admin', '2020-12-03 22:05:37', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220537.CCF0140.jpg'),
(723, 'file20201203220538.CCF0141.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220538.CCF0141.jpg', '1', '0', 'admin', '2020-12-03 22:05:38', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220538.CCF0141.jpg'),
(724, 'file20201203220538.CCF0142.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220538.CCF0142.jpg', '1', '0', 'admin', '2020-12-03 22:05:38', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220538.CCF0142.jpg'),
(725, 'file20201203220538.CCF0143.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220538.CCF0143.jpg', '1', '0', 'admin', '2020-12-03 22:05:38', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220538.CCF0143.jpg'),
(726, 'file20201203220538.CCF0144.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220538.CCF0144.jpg', '1', '0', 'admin', '2020-12-03 22:05:38', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220538.CCF0144.jpg'),
(727, 'file20201203220538.CCF0145.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220538.CCF0145.jpg', '1', '0', 'admin', '2020-12-03 22:05:38', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220538.CCF0145.jpg'),
(728, 'file20201203220539.CCF0146.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220539.CCF0146.jpg', '1', '0', 'admin', '2020-12-03 22:05:39', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220539.CCF0146.jpg'),
(729, 'file20201203220539.CCF0147.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220539.CCF0147.jpg', '1', '0', 'admin', '2020-12-03 22:05:39', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220539.CCF0147.jpg'),
(730, 'file20201203220539.CCF0148.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220539.CCF0148.jpg', '1', '0', 'admin', '2020-12-03 22:05:39', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220539.CCF0148.jpg'),
(731, 'file20201203220539.CCF0149.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220539.CCF0149.jpg', '1', '0', 'admin', '2020-12-03 22:05:39', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220539.CCF0149.jpg'),
(732, 'file20201203220539.CCF0150.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220539.CCF0150.jpg', '1', '0', 'admin', '2020-12-03 22:05:39', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220539.CCF0150.jpg'),
(733, 'file20201203220540.CCF0151.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220540.CCF0151.jpg', '1', '0', 'admin', '2020-12-03 22:05:40', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220540.CCF0151.jpg'),
(734, 'file20201203220540.CCF0152.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220540.CCF0152.jpg', '1', '0', 'admin', '2020-12-03 22:05:40', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220540.CCF0152.jpg'),
(735, 'file20201203220540.CCF0153.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220540.CCF0153.jpg', '1', '0', 'admin', '2020-12-03 22:05:40', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220540.CCF0153.jpg'),
(736, 'file20201203220540.CCF0154.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220540.CCF0154.jpg', '1', '0', 'admin', '2020-12-03 22:05:40', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220540.CCF0154.jpg'),
(737, 'file20201203220541.CCF0155.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220541.CCF0155.jpg', '1', '0', 'admin', '2020-12-03 22:05:41', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220541.CCF0155.jpg'),
(738, 'file20201203220541.CCF0156.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220541.CCF0156.jpg', '1', '0', 'admin', '2020-12-03 22:05:41', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220541.CCF0156.jpg'),
(739, 'file20201203220541.CCF0157.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220541.CCF0157.jpg', '1', '0', 'admin', '2020-12-03 22:05:41', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220541.CCF0157.jpg'),
(740, 'file20201203220541.CCF0158.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220541.CCF0158.jpg', '1', '0', 'admin', '2020-12-03 22:05:41', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220541.CCF0158.jpg'),
(741, 'file20201203220541.CCF0159.jpg', '/profile/upload/chapter/13/2020-12-03/file20201203220541.CCF0159.jpg', '1', '0', 'admin', '2020-12-03 22:05:41', '', NULL, 'D:/smanga/uploadPath/upload/chapter/13/2020-12-03/file20201203220541.CCF0159.jpg'),
(743, 'file20201222050143.jpg', '/profile/upload/manga/cover/2020-12-22/file20201222050143.jpg', '1', '0', 'admin', '2020-12-22 05:01:43', 'admin', '2020-12-22 05:01:47', 'D:/smanga/uploadPath/upload/manga/cover/2020-12-22/file20201222050143.jpg'),
(744, 'file20201222050826.jpg', '/profile/upload/manga/cover/2020-12-22/file20201222050826.jpg', '1', '0', 'admin', '2020-12-22 05:08:26', 'admin', '2020-12-22 05:08:27', 'D:/smanga/uploadPath/upload/manga/cover/2020-12-22/file20201222050826.jpg'),
(745, 'file20201222050957.jpg', '/profile/upload/manga/cover/2020-12-22/file20201222050957.jpg', '1', '0', 'admin', '2020-12-22 05:09:57', 'admin', '2020-12-22 05:10:02', 'D:/smanga/uploadPath/upload/manga/cover/2020-12-22/file20201222050957.jpg'),
(746, 'file20201222051055.jpg', '/profile/upload/manga/cover/2020-12-22/file20201222051055.jpg', '1', '0', 'admin', '2020-12-22 05:10:55', 'admin', '2020-12-22 05:10:56', 'D:/smanga/uploadPath/upload/manga/cover/2020-12-22/file20201222051055.jpg'),
(747, 'file20201222051332.00.png', '/profile/upload/chapter/15/2020-12-22/file20201222051332.00.png', '1', '0', 'admin', '2020-12-22 05:13:32', '', NULL, 'D:/smanga/uploadPath/upload/chapter/15/2020-12-22/file20201222051332.00.png'),
(748, 'file20201222051333.10.png', '/profile/upload/chapter/15/2020-12-22/file20201222051333.10.png', '1', '0', 'admin', '2020-12-22 05:13:33', '', NULL, 'D:/smanga/uploadPath/upload/chapter/15/2020-12-22/file20201222051333.10.png'),
(749, 'file20201222051333.20.png', '/profile/upload/chapter/15/2020-12-22/file20201222051333.20.png', '1', '0', 'admin', '2020-12-22 05:13:33', '', NULL, 'D:/smanga/uploadPath/upload/chapter/15/2020-12-22/file20201222051333.20.png'),
(750, 'file20201222051333.21.png', '/profile/upload/chapter/15/2020-12-22/file20201222051333.21.png', '1', '0', 'admin', '2020-12-22 05:13:33', '', NULL, 'D:/smanga/uploadPath/upload/chapter/15/2020-12-22/file20201222051333.21.png'),
(751, 'file20201222051333.30.png', '/profile/upload/chapter/15/2020-12-22/file20201222051333.30.png', '1', '0', 'admin', '2020-12-22 05:13:33', '', NULL, 'D:/smanga/uploadPath/upload/chapter/15/2020-12-22/file20201222051333.30.png'),
(752, 'file20201222051334.40.png', '/profile/upload/chapter/15/2020-12-22/file20201222051334.40.png', '1', '0', 'admin', '2020-12-22 05:13:34', '', NULL, 'D:/smanga/uploadPath/upload/chapter/15/2020-12-22/file20201222051334.40.png'),
(753, 'file20201222051334.50.png', '/profile/upload/chapter/15/2020-12-22/file20201222051334.50.png', '1', '0', 'admin', '2020-12-22 05:13:34', '', NULL, 'D:/smanga/uploadPath/upload/chapter/15/2020-12-22/file20201222051334.50.png'),
(754, 'file20201222051334.51.png', '/profile/upload/chapter/15/2020-12-22/file20201222051334.51.png', '1', '0', 'admin', '2020-12-22 05:13:34', '', NULL, 'D:/smanga/uploadPath/upload/chapter/15/2020-12-22/file20201222051334.51.png'),
(755, 'file20201222051334.60.png', '/profile/upload/chapter/15/2020-12-22/file20201222051334.60.png', '1', '0', 'admin', '2020-12-22 05:13:34', '', NULL, 'D:/smanga/uploadPath/upload/chapter/15/2020-12-22/file20201222051334.60.png'),
(756, 'file20201222051334.61.png', '/profile/upload/chapter/15/2020-12-22/file20201222051334.61.png', '1', '0', 'admin', '2020-12-22 05:13:34', '', NULL, 'D:/smanga/uploadPath/upload/chapter/15/2020-12-22/file20201222051334.61.png'),
(757, 'file20201222051335.70.png', '/profile/upload/chapter/15/2020-12-22/file20201222051335.70.png', '1', '0', 'admin', '2020-12-22 05:13:35', '', NULL, 'D:/smanga/uploadPath/upload/chapter/15/2020-12-22/file20201222051335.70.png'),
(758, 'file20201222051335.80.png', '/profile/upload/chapter/15/2020-12-22/file20201222051335.80.png', '1', '0', 'admin', '2020-12-22 05:13:35', '', NULL, 'D:/smanga/uploadPath/upload/chapter/15/2020-12-22/file20201222051335.80.png'),
(759, 'file20201222051335.90.png', '/profile/upload/chapter/15/2020-12-22/file20201222051335.90.png', '1', '0', 'admin', '2020-12-22 05:13:35', '', NULL, 'D:/smanga/uploadPath/upload/chapter/15/2020-12-22/file20201222051335.90.png'),
(760, 'file20201222051335.100.png', '/profile/upload/chapter/15/2020-12-22/file20201222051335.100.png', '1', '0', 'admin', '2020-12-22 05:13:35', '', NULL, 'D:/smanga/uploadPath/upload/chapter/15/2020-12-22/file20201222051335.100.png'),
(761, 'file20201222051335.110.png', '/profile/upload/chapter/15/2020-12-22/file20201222051335.110.png', '1', '0', 'admin', '2020-12-22 05:13:35', '', NULL, 'D:/smanga/uploadPath/upload/chapter/15/2020-12-22/file20201222051335.110.png'),
(762, 'file20201222051336.111.png', '/profile/upload/chapter/15/2020-12-22/file20201222051336.111.png', '1', '0', 'admin', '2020-12-22 05:13:36', '', NULL, 'D:/smanga/uploadPath/upload/chapter/15/2020-12-22/file20201222051336.111.png'),
(763, 'file20201222051336.120.png', '/profile/upload/chapter/15/2020-12-22/file20201222051336.120.png', '1', '0', 'admin', '2020-12-22 05:13:36', '', NULL, 'D:/smanga/uploadPath/upload/chapter/15/2020-12-22/file20201222051336.120.png'),
(764, 'file20201222051336.130.png', '/profile/upload/chapter/15/2020-12-22/file20201222051336.130.png', '1', '0', 'admin', '2020-12-22 05:13:36', '', NULL, 'D:/smanga/uploadPath/upload/chapter/15/2020-12-22/file20201222051336.130.png'),
(765, 'file20201222051336.140.png', '/profile/upload/chapter/15/2020-12-22/file20201222051336.140.png', '1', '0', 'admin', '2020-12-22 05:13:36', '', NULL, 'D:/smanga/uploadPath/upload/chapter/15/2020-12-22/file20201222051336.140.png'),
(766, 'file20201222051337.150.png', '/profile/upload/chapter/15/2020-12-22/file20201222051337.150.png', '1', '0', 'admin', '2020-12-22 05:13:37', '', NULL, 'D:/smanga/uploadPath/upload/chapter/15/2020-12-22/file20201222051337.150.png'),
(767, 'file20201222051337.160.png', '/profile/upload/chapter/15/2020-12-22/file20201222051337.160.png', '1', '0', 'admin', '2020-12-22 05:13:37', '', NULL, 'D:/smanga/uploadPath/upload/chapter/15/2020-12-22/file20201222051337.160.png'),
(768, 'file20201222051337.170.png', '/profile/upload/chapter/15/2020-12-22/file20201222051337.170.png', '1', '0', 'admin', '2020-12-22 05:13:37', '', NULL, 'D:/smanga/uploadPath/upload/chapter/15/2020-12-22/file20201222051337.170.png'),
(769, 'file20201222051337.180.png', '/profile/upload/chapter/15/2020-12-22/file20201222051337.180.png', '1', '0', 'admin', '2020-12-22 05:13:37', '', NULL, 'D:/smanga/uploadPath/upload/chapter/15/2020-12-22/file20201222051337.180.png'),
(770, 'file20201222051337.181.png', '/profile/upload/chapter/15/2020-12-22/file20201222051337.181.png', '1', '0', 'admin', '2020-12-22 05:13:37', '', NULL, 'D:/smanga/uploadPath/upload/chapter/15/2020-12-22/file20201222051337.181.png'),
(771, 'file20201222051338.190.png', '/profile/upload/chapter/15/2020-12-22/file20201222051338.190.png', '1', '0', 'admin', '2020-12-22 05:13:38', '', NULL, 'D:/smanga/uploadPath/upload/chapter/15/2020-12-22/file20201222051338.190.png'),
(772, 'file20201222051338.200.png', '/profile/upload/chapter/15/2020-12-22/file20201222051338.200.png', '1', '0', 'admin', '2020-12-22 05:13:38', '', NULL, 'D:/smanga/uploadPath/upload/chapter/15/2020-12-22/file20201222051338.200.png'),
(773, 'file20201222051447.000.jpg', '/profile/upload/chapter/16/2020-12-22/file20201222051447.000.jpg', '1', '0', 'admin', '2020-12-22 05:14:47', '', NULL, 'D:/smanga/uploadPath/upload/chapter/16/2020-12-22/file20201222051447.000.jpg'),
(774, 'file20201222051447.001.jpg', '/profile/upload/chapter/16/2020-12-22/file20201222051447.001.jpg', '1', '0', 'admin', '2020-12-22 05:14:47', '', NULL, 'D:/smanga/uploadPath/upload/chapter/16/2020-12-22/file20201222051447.001.jpg'),
(775, 'file20201222051448.002.jpg', '/profile/upload/chapter/16/2020-12-22/file20201222051448.002.jpg', '1', '0', 'admin', '2020-12-22 05:14:48', '', NULL, 'D:/smanga/uploadPath/upload/chapter/16/2020-12-22/file20201222051448.002.jpg'),
(776, 'file20201222051448.003.jpg', '/profile/upload/chapter/16/2020-12-22/file20201222051448.003.jpg', '1', '0', 'admin', '2020-12-22 05:14:48', '', NULL, 'D:/smanga/uploadPath/upload/chapter/16/2020-12-22/file20201222051448.003.jpg'),
(777, 'file20201222051448.004.jpg', '/profile/upload/chapter/16/2020-12-22/file20201222051448.004.jpg', '1', '0', 'admin', '2020-12-22 05:14:48', '', NULL, 'D:/smanga/uploadPath/upload/chapter/16/2020-12-22/file20201222051448.004.jpg'),
(778, 'file20201222051448.005.jpg', '/profile/upload/chapter/16/2020-12-22/file20201222051448.005.jpg', '1', '0', 'admin', '2020-12-22 05:14:48', '', NULL, 'D:/smanga/uploadPath/upload/chapter/16/2020-12-22/file20201222051448.005.jpg'),
(779, 'file20201222051448.006.jpg', '/profile/upload/chapter/16/2020-12-22/file20201222051448.006.jpg', '1', '0', 'admin', '2020-12-22 05:14:48', '', NULL, 'D:/smanga/uploadPath/upload/chapter/16/2020-12-22/file20201222051448.006.jpg'),
(780, 'file20201222051449.007.jpg', '/profile/upload/chapter/16/2020-12-22/file20201222051449.007.jpg', '1', '0', 'admin', '2020-12-22 05:14:49', '', NULL, 'D:/smanga/uploadPath/upload/chapter/16/2020-12-22/file20201222051449.007.jpg'),
(781, 'file20201222051449.008009.jpg', '/profile/upload/chapter/16/2020-12-22/file20201222051449.008009.jpg', '1', '0', 'admin', '2020-12-22 05:14:49', '', NULL, 'D:/smanga/uploadPath/upload/chapter/16/2020-12-22/file20201222051449.008009.jpg'),
(782, 'file20201222051449.010.jpg', '/profile/upload/chapter/16/2020-12-22/file20201222051449.010.jpg', '1', '0', 'admin', '2020-12-22 05:14:49', '', NULL, 'D:/smanga/uploadPath/upload/chapter/16/2020-12-22/file20201222051449.010.jpg'),
(783, 'file20201222051449.011.jpg', '/profile/upload/chapter/16/2020-12-22/file20201222051449.011.jpg', '1', '0', 'admin', '2020-12-22 05:14:49', '', NULL, 'D:/smanga/uploadPath/upload/chapter/16/2020-12-22/file20201222051449.011.jpg'),
(784, 'file20201222051450.012.jpg', '/profile/upload/chapter/16/2020-12-22/file20201222051450.012.jpg', '1', '0', 'admin', '2020-12-22 05:14:50', '', NULL, 'D:/smanga/uploadPath/upload/chapter/16/2020-12-22/file20201222051450.012.jpg'),
(785, 'file20201222051450.013.jpg', '/profile/upload/chapter/16/2020-12-22/file20201222051450.013.jpg', '1', '0', 'admin', '2020-12-22 05:14:50', '', NULL, 'D:/smanga/uploadPath/upload/chapter/16/2020-12-22/file20201222051450.013.jpg'),
(786, 'file20201222051450.014.jpg', '/profile/upload/chapter/16/2020-12-22/file20201222051450.014.jpg', '1', '0', 'admin', '2020-12-22 05:14:50', '', NULL, 'D:/smanga/uploadPath/upload/chapter/16/2020-12-22/file20201222051450.014.jpg'),
(787, 'file20201222051450.015.jpg', '/profile/upload/chapter/16/2020-12-22/file20201222051450.015.jpg', '1', '0', 'admin', '2020-12-22 05:14:50', '', NULL, 'D:/smanga/uploadPath/upload/chapter/16/2020-12-22/file20201222051450.015.jpg'),
(788, 'file20201222051451.016.jpg', '/profile/upload/chapter/16/2020-12-22/file20201222051451.016.jpg', '1', '0', 'admin', '2020-12-22 05:14:51', '', NULL, 'D:/smanga/uploadPath/upload/chapter/16/2020-12-22/file20201222051451.016.jpg'),
(789, 'file20201222051451.017.jpg', '/profile/upload/chapter/16/2020-12-22/file20201222051451.017.jpg', '1', '0', 'admin', '2020-12-22 05:14:51', '', NULL, 'D:/smanga/uploadPath/upload/chapter/16/2020-12-22/file20201222051451.017.jpg'),
(790, 'file20201222051451.018.jpg', '/profile/upload/chapter/16/2020-12-22/file20201222051451.018.jpg', '1', '0', 'admin', '2020-12-22 05:14:51', '', NULL, 'D:/smanga/uploadPath/upload/chapter/16/2020-12-22/file20201222051451.018.jpg'),
(791, 'file20201222051451.019.jpg', '/profile/upload/chapter/16/2020-12-22/file20201222051451.019.jpg', '1', '0', 'admin', '2020-12-22 05:14:51', '', NULL, 'D:/smanga/uploadPath/upload/chapter/16/2020-12-22/file20201222051451.019.jpg'),
(792, 'file20201222051451.020.jpg', '/profile/upload/chapter/16/2020-12-22/file20201222051451.020.jpg', '1', '0', 'admin', '2020-12-22 05:14:51', '', NULL, 'D:/smanga/uploadPath/upload/chapter/16/2020-12-22/file20201222051451.020.jpg'),
(793, 'file20201222051452.021.jpg', '/profile/upload/chapter/16/2020-12-22/file20201222051452.021.jpg', '1', '0', 'admin', '2020-12-22 05:14:52', '', NULL, 'D:/smanga/uploadPath/upload/chapter/16/2020-12-22/file20201222051452.021.jpg'),
(794, 'file20201222051452.022.jpg', '/profile/upload/chapter/16/2020-12-22/file20201222051452.022.jpg', '1', '0', 'admin', '2020-12-22 05:14:52', '', NULL, 'D:/smanga/uploadPath/upload/chapter/16/2020-12-22/file20201222051452.022.jpg'),
(795, 'file20201222051452.023.jpg', '/profile/upload/chapter/16/2020-12-22/file20201222051452.023.jpg', '1', '0', 'admin', '2020-12-22 05:14:52', '', NULL, 'D:/smanga/uploadPath/upload/chapter/16/2020-12-22/file20201222051452.023.jpg'),
(796, 'file20201222051452.024.jpg', '/profile/upload/chapter/16/2020-12-22/file20201222051452.024.jpg', '1', '0', 'admin', '2020-12-22 05:14:52', '', NULL, 'D:/smanga/uploadPath/upload/chapter/16/2020-12-22/file20201222051452.024.jpg'),
(797, 'file20201222051452.025.jpg', '/profile/upload/chapter/16/2020-12-22/file20201222051452.025.jpg', '1', '0', 'admin', '2020-12-22 05:14:52', '', NULL, 'D:/smanga/uploadPath/upload/chapter/16/2020-12-22/file20201222051452.025.jpg'),
(798, 'file20201222051453.026.jpg', '/profile/upload/chapter/16/2020-12-22/file20201222051453.026.jpg', '1', '0', 'admin', '2020-12-22 05:14:53', '', NULL, 'D:/smanga/uploadPath/upload/chapter/16/2020-12-22/file20201222051453.026.jpg'),
(799, 'file20201222051545.0001.jpg', '/profile/upload/chapter/17/2020-12-22/file20201222051545.0001.jpg', '1', '0', 'admin', '2020-12-22 05:15:45', '', NULL, 'D:/smanga/uploadPath/upload/chapter/17/2020-12-22/file20201222051545.0001.jpg'),
(800, 'file20201222051546.0002.jpg', '/profile/upload/chapter/17/2020-12-22/file20201222051546.0002.jpg', '1', '0', 'admin', '2020-12-22 05:15:46', '', NULL, 'D:/smanga/uploadPath/upload/chapter/17/2020-12-22/file20201222051546.0002.jpg'),
(801, 'file20201222051546.0003.jpg', '/profile/upload/chapter/17/2020-12-22/file20201222051546.0003.jpg', '1', '0', 'admin', '2020-12-22 05:15:46', '', NULL, 'D:/smanga/uploadPath/upload/chapter/17/2020-12-22/file20201222051546.0003.jpg'),
(802, 'file20201222051546.0004.jpg', '/profile/upload/chapter/17/2020-12-22/file20201222051546.0004.jpg', '1', '0', 'admin', '2020-12-22 05:15:46', '', NULL, 'D:/smanga/uploadPath/upload/chapter/17/2020-12-22/file20201222051546.0004.jpg'),
(803, 'file20201222051546.0005.jpg', '/profile/upload/chapter/17/2020-12-22/file20201222051546.0005.jpg', '1', '0', 'admin', '2020-12-22 05:15:46', '', NULL, 'D:/smanga/uploadPath/upload/chapter/17/2020-12-22/file20201222051546.0005.jpg'),
(804, 'file20201222051546.0011.jpg', '/profile/upload/chapter/17/2020-12-22/file20201222051546.0011.jpg', '1', '0', 'admin', '2020-12-22 05:15:46', '', NULL, 'D:/smanga/uploadPath/upload/chapter/17/2020-12-22/file20201222051546.0011.jpg'),
(805, 'file20201222051547.0012.jpg', '/profile/upload/chapter/17/2020-12-22/file20201222051547.0012.jpg', '1', '0', 'admin', '2020-12-22 05:15:47', '', NULL, 'D:/smanga/uploadPath/upload/chapter/17/2020-12-22/file20201222051547.0012.jpg'),
(806, 'file20201222051547.002003.jpg', '/profile/upload/chapter/17/2020-12-22/file20201222051547.002003.jpg', '1', '0', 'admin', '2020-12-22 05:15:47', '', NULL, 'D:/smanga/uploadPath/upload/chapter/17/2020-12-22/file20201222051547.002003.jpg'),
(807, 'file20201222051547.004.jpg', '/profile/upload/chapter/17/2020-12-22/file20201222051547.004.jpg', '1', '0', 'admin', '2020-12-22 05:15:47', '', NULL, 'D:/smanga/uploadPath/upload/chapter/17/2020-12-22/file20201222051547.004.jpg'),
(808, 'file20201222051547.005.jpg', '/profile/upload/chapter/17/2020-12-22/file20201222051547.005.jpg', '1', '0', 'admin', '2020-12-22 05:15:47', '', NULL, 'D:/smanga/uploadPath/upload/chapter/17/2020-12-22/file20201222051547.005.jpg'),
(809, 'file20201222051547.006.jpg', '/profile/upload/chapter/17/2020-12-22/file20201222051547.006.jpg', '1', '0', 'admin', '2020-12-22 05:15:48', '', NULL, 'D:/smanga/uploadPath/upload/chapter/17/2020-12-22/file20201222051547.006.jpg'),
(810, 'file20201222051548.007.jpg', '/profile/upload/chapter/17/2020-12-22/file20201222051548.007.jpg', '1', '0', 'admin', '2020-12-22 05:15:48', '', NULL, 'D:/smanga/uploadPath/upload/chapter/17/2020-12-22/file20201222051548.007.jpg'),
(811, 'file20201222051548.008009.jpg', '/profile/upload/chapter/17/2020-12-22/file20201222051548.008009.jpg', '1', '0', 'admin', '2020-12-22 05:15:48', '', NULL, 'D:/smanga/uploadPath/upload/chapter/17/2020-12-22/file20201222051548.008009.jpg'),
(812, 'file20201222051548.010.jpg', '/profile/upload/chapter/17/2020-12-22/file20201222051548.010.jpg', '1', '0', 'admin', '2020-12-22 05:15:48', '', NULL, 'D:/smanga/uploadPath/upload/chapter/17/2020-12-22/file20201222051548.010.jpg'),
(813, 'file20201222051548.011.jpg', '/profile/upload/chapter/17/2020-12-22/file20201222051548.011.jpg', '1', '0', 'admin', '2020-12-22 05:15:48', '', NULL, 'D:/smanga/uploadPath/upload/chapter/17/2020-12-22/file20201222051548.011.jpg'),
(814, 'file20201222051549.012.jpg', '/profile/upload/chapter/17/2020-12-22/file20201222051549.012.jpg', '1', '0', 'admin', '2020-12-22 05:15:49', '', NULL, 'D:/smanga/uploadPath/upload/chapter/17/2020-12-22/file20201222051549.012.jpg'),
(815, 'file20201222051549.013.jpg', '/profile/upload/chapter/17/2020-12-22/file20201222051549.013.jpg', '1', '0', 'admin', '2020-12-22 05:15:49', '', NULL, 'D:/smanga/uploadPath/upload/chapter/17/2020-12-22/file20201222051549.013.jpg'),
(816, 'file20201222051549.014015.jpg', '/profile/upload/chapter/17/2020-12-22/file20201222051549.014015.jpg', '1', '0', 'admin', '2020-12-22 05:15:49', '', NULL, 'D:/smanga/uploadPath/upload/chapter/17/2020-12-22/file20201222051549.014015.jpg'),
(817, 'file20201222051549.016.jpg', '/profile/upload/chapter/17/2020-12-22/file20201222051549.016.jpg', '1', '0', 'admin', '2020-12-22 05:15:49', '', NULL, 'D:/smanga/uploadPath/upload/chapter/17/2020-12-22/file20201222051549.016.jpg'),
(818, 'file20201222051549.017.jpg', '/profile/upload/chapter/17/2020-12-22/file20201222051549.017.jpg', '1', '0', 'admin', '2020-12-22 05:15:49', '', NULL, 'D:/smanga/uploadPath/upload/chapter/17/2020-12-22/file20201222051549.017.jpg'),
(819, 'file20201222051550.018.jpg', '/profile/upload/chapter/17/2020-12-22/file20201222051550.018.jpg', '1', '0', 'admin', '2020-12-22 05:15:50', '', NULL, 'D:/smanga/uploadPath/upload/chapter/17/2020-12-22/file20201222051550.018.jpg'),
(820, 'file20201222051550.019.jpg', '/profile/upload/chapter/17/2020-12-22/file20201222051550.019.jpg', '1', '0', 'admin', '2020-12-22 05:15:50', '', NULL, 'D:/smanga/uploadPath/upload/chapter/17/2020-12-22/file20201222051550.019.jpg'),
(821, 'file20201222051550.020.jpg', '/profile/upload/chapter/17/2020-12-22/file20201222051550.020.jpg', '1', '0', 'admin', '2020-12-22 05:15:50', '', NULL, 'D:/smanga/uploadPath/upload/chapter/17/2020-12-22/file20201222051550.020.jpg'),
(822, 'file20201222051550.021.jpg', '/profile/upload/chapter/17/2020-12-22/file20201222051550.021.jpg', '1', '0', 'admin', '2020-12-22 05:15:50', '', NULL, 'D:/smanga/uploadPath/upload/chapter/17/2020-12-22/file20201222051550.021.jpg'),
(823, 'file20201222051550.022.jpg', '/profile/upload/chapter/17/2020-12-22/file20201222051550.022.jpg', '1', '0', 'admin', '2020-12-22 05:15:51', '', NULL, 'D:/smanga/uploadPath/upload/chapter/17/2020-12-22/file20201222051550.022.jpg'),
(824, 'file20201222051551.023.jpg', '/profile/upload/chapter/17/2020-12-22/file20201222051551.023.jpg', '1', '0', 'admin', '2020-12-22 05:15:51', '', NULL, 'D:/smanga/uploadPath/upload/chapter/17/2020-12-22/file20201222051551.023.jpg'),
(825, 'file20201222051551.024.jpg', '/profile/upload/chapter/17/2020-12-22/file20201222051551.024.jpg', '1', '0', 'admin', '2020-12-22 05:15:51', '', NULL, 'D:/smanga/uploadPath/upload/chapter/17/2020-12-22/file20201222051551.024.jpg'),
(826, 'file20201222051643.0001.jpg', '/profile/upload/chapter/18/2020-12-22/file20201222051643.0001.jpg', '1', '0', 'admin', '2020-12-22 05:16:43', '', NULL, 'D:/smanga/uploadPath/upload/chapter/18/2020-12-22/file20201222051643.0001.jpg'),
(827, 'file20201222051643.0002.jpg', '/profile/upload/chapter/18/2020-12-22/file20201222051643.0002.jpg', '1', '0', 'admin', '2020-12-22 05:16:43', '', NULL, 'D:/smanga/uploadPath/upload/chapter/18/2020-12-22/file20201222051643.0002.jpg'),
(828, 'file20201222051643.0011.jpg', '/profile/upload/chapter/18/2020-12-22/file20201222051643.0011.jpg', '1', '0', 'admin', '2020-12-22 05:16:43', '', NULL, 'D:/smanga/uploadPath/upload/chapter/18/2020-12-22/file20201222051643.0011.jpg'),
(829, 'file20201222051643.0012.jpg', '/profile/upload/chapter/18/2020-12-22/file20201222051643.0012.jpg', '1', '0', 'admin', '2020-12-22 05:16:43', '', NULL, 'D:/smanga/uploadPath/upload/chapter/18/2020-12-22/file20201222051643.0012.jpg'),
(830, 'file20201222051644.0013.jpg', '/profile/upload/chapter/18/2020-12-22/file20201222051644.0013.jpg', '1', '0', 'admin', '2020-12-22 05:16:44', '', NULL, 'D:/smanga/uploadPath/upload/chapter/18/2020-12-22/file20201222051644.0013.jpg'),
(831, 'file20201222051644.0014.jpg', '/profile/upload/chapter/18/2020-12-22/file20201222051644.0014.jpg', '1', '0', 'admin', '2020-12-22 05:16:44', '', NULL, 'D:/smanga/uploadPath/upload/chapter/18/2020-12-22/file20201222051644.0014.jpg'),
(832, 'file20201222051644.002.jpg', '/profile/upload/chapter/18/2020-12-22/file20201222051644.002.jpg', '1', '0', 'admin', '2020-12-22 05:16:44', '', NULL, 'D:/smanga/uploadPath/upload/chapter/18/2020-12-22/file20201222051644.002.jpg'),
(833, 'file20201222051644.003.jpg', '/profile/upload/chapter/18/2020-12-22/file20201222051644.003.jpg', '1', '0', 'admin', '2020-12-22 05:16:44', '', NULL, 'D:/smanga/uploadPath/upload/chapter/18/2020-12-22/file20201222051644.003.jpg'),
(834, 'file20201222051645.004.jpg', '/profile/upload/chapter/18/2020-12-22/file20201222051645.004.jpg', '1', '0', 'admin', '2020-12-22 05:16:45', '', NULL, 'D:/smanga/uploadPath/upload/chapter/18/2020-12-22/file20201222051645.004.jpg'),
(835, 'file20201222051645.005.jpg', '/profile/upload/chapter/18/2020-12-22/file20201222051645.005.jpg', '1', '0', 'admin', '2020-12-22 05:16:45', '', NULL, 'D:/smanga/uploadPath/upload/chapter/18/2020-12-22/file20201222051645.005.jpg'),
(836, 'file20201222051645.006.jpg', '/profile/upload/chapter/18/2020-12-22/file20201222051645.006.jpg', '1', '0', 'admin', '2020-12-22 05:16:45', '', NULL, 'D:/smanga/uploadPath/upload/chapter/18/2020-12-22/file20201222051645.006.jpg'),
(837, 'file20201222051645.007.jpg', '/profile/upload/chapter/18/2020-12-22/file20201222051645.007.jpg', '1', '0', 'admin', '2020-12-22 05:16:45', '', NULL, 'D:/smanga/uploadPath/upload/chapter/18/2020-12-22/file20201222051645.007.jpg'),
(838, 'file20201222051645.008009.jpg', '/profile/upload/chapter/18/2020-12-22/file20201222051645.008009.jpg', '1', '0', 'admin', '2020-12-22 05:16:45', '', NULL, 'D:/smanga/uploadPath/upload/chapter/18/2020-12-22/file20201222051645.008009.jpg'),
(839, 'file20201222051646.010.jpg', '/profile/upload/chapter/18/2020-12-22/file20201222051646.010.jpg', '1', '0', 'admin', '2020-12-22 05:16:46', '', NULL, 'D:/smanga/uploadPath/upload/chapter/18/2020-12-22/file20201222051646.010.jpg'),
(840, 'file20201222051646.011.jpg', '/profile/upload/chapter/18/2020-12-22/file20201222051646.011.jpg', '1', '0', 'admin', '2020-12-22 05:16:46', '', NULL, 'D:/smanga/uploadPath/upload/chapter/18/2020-12-22/file20201222051646.011.jpg'),
(841, 'file20201222051646.012.jpg', '/profile/upload/chapter/18/2020-12-22/file20201222051646.012.jpg', '1', '0', 'admin', '2020-12-22 05:16:46', '', NULL, 'D:/smanga/uploadPath/upload/chapter/18/2020-12-22/file20201222051646.012.jpg'),
(842, 'file20201222051647.013.jpg', '/profile/upload/chapter/18/2020-12-22/file20201222051647.013.jpg', '1', '0', 'admin', '2020-12-22 05:16:47', '', NULL, 'D:/smanga/uploadPath/upload/chapter/18/2020-12-22/file20201222051647.013.jpg'),
(843, 'file20201222051647.014.jpg', '/profile/upload/chapter/18/2020-12-22/file20201222051647.014.jpg', '1', '0', 'admin', '2020-12-22 05:16:47', '', NULL, 'D:/smanga/uploadPath/upload/chapter/18/2020-12-22/file20201222051647.014.jpg'),
(844, 'file20201222051647.015.jpg', '/profile/upload/chapter/18/2020-12-22/file20201222051647.015.jpg', '1', '0', 'admin', '2020-12-22 05:16:47', '', NULL, 'D:/smanga/uploadPath/upload/chapter/18/2020-12-22/file20201222051647.015.jpg'),
(845, 'file20201222051647.016.jpg', '/profile/upload/chapter/18/2020-12-22/file20201222051647.016.jpg', '1', '0', 'admin', '2020-12-22 05:16:47', '', NULL, 'D:/smanga/uploadPath/upload/chapter/18/2020-12-22/file20201222051647.016.jpg'),
(846, 'file20201222051647.017.jpg', '/profile/upload/chapter/18/2020-12-22/file20201222051647.017.jpg', '1', '0', 'admin', '2020-12-22 05:16:47', '', NULL, 'D:/smanga/uploadPath/upload/chapter/18/2020-12-22/file20201222051647.017.jpg'),
(847, 'file20201222051648.018.jpg', '/profile/upload/chapter/18/2020-12-22/file20201222051648.018.jpg', '1', '0', 'admin', '2020-12-22 05:16:48', '', NULL, 'D:/smanga/uploadPath/upload/chapter/18/2020-12-22/file20201222051648.018.jpg'),
(848, 'file20201222051648.019.jpg', '/profile/upload/chapter/18/2020-12-22/file20201222051648.019.jpg', '1', '0', 'admin', '2020-12-22 05:16:48', '', NULL, 'D:/smanga/uploadPath/upload/chapter/18/2020-12-22/file20201222051648.019.jpg'),
(849, 'file20201222051648.020.jpg', '/profile/upload/chapter/18/2020-12-22/file20201222051648.020.jpg', '1', '0', 'admin', '2020-12-22 05:16:48', '', NULL, 'D:/smanga/uploadPath/upload/chapter/18/2020-12-22/file20201222051648.020.jpg'),
(850, 'file20201222051648.021.jpg', '/profile/upload/chapter/18/2020-12-22/file20201222051648.021.jpg', '1', '0', 'admin', '2020-12-22 05:16:48', '', NULL, 'D:/smanga/uploadPath/upload/chapter/18/2020-12-22/file20201222051648.021.jpg'),
(851, 'file20201222051649.022.jpg', '/profile/upload/chapter/18/2020-12-22/file20201222051649.022.jpg', '1', '0', 'admin', '2020-12-22 05:16:49', '', NULL, 'D:/smanga/uploadPath/upload/chapter/18/2020-12-22/file20201222051649.022.jpg'),
(852, 'file20201222051649.023.jpg', '/profile/upload/chapter/18/2020-12-22/file20201222051649.023.jpg', '1', '0', 'admin', '2020-12-22 05:16:49', '', NULL, 'D:/smanga/uploadPath/upload/chapter/18/2020-12-22/file20201222051649.023.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `manga`
--

CREATE TABLE `manga` (
  `id` bigint(20) NOT NULL COMMENT 'Serial ID',
  `manga_name` varchar(100) NOT NULL COMMENT 'Manga name',
  `categories` varchar(200) NOT NULL COMMENT 'Categories (each category seperated by comma)',
  `category_ids` varchar(200) NOT NULL COMMENT 'Category ids (String with multiple category id seperated by comma',
  `author` varchar(100) DEFAULT '' COMMENT 'Author name of manga',
  `author_id` bigint(20) DEFAULT NULL COMMENT 'Id of author',
  `favorite_counter` bigint(10) DEFAULT 0 COMMENT 'Number of reader like this manga',
  `remark` text DEFAULT '' COMMENT 'Remark',
  `cover_image` varchar(100) DEFAULT '' COMMENT 'Manga cover image path',
  `cover_image_id` bigint(20) DEFAULT NULL COMMENT 'Id of cover image',
  `slide_image` varchar(100) DEFAULT '' COMMENT 'Manga slide image path',
  `slide_image_id` bigint(20) DEFAULT NULL COMMENT 'Id of slide image',
  `recommended_age` varchar(30) DEFAULT '' COMMENT 'Age recommend',
  `status` char(1) DEFAULT '1' COMMENT 'Category status (1 enabled 0 disabled)',
  `del_flag` varchar(1) DEFAULT '0' COMMENT 'Delete flag (0 means existence 1 means deletion)',
  `create_by` varchar(64) DEFAULT '' COMMENT 'Creator',
  `create_time` datetime DEFAULT NULL COMMENT 'Creation time',
  `update_by` varchar(64) DEFAULT '' COMMENT 'Updater',
  `update_time` datetime DEFAULT NULL COMMENT 'Update time',
  `artist` varchar(100) DEFAULT '' COMMENT 'Artist',
  `artist_id` bigint(20) DEFAULT NULL COMMENT 'Id of artist',
  `release_time` datetime DEFAULT NULL COMMENT 'Release time',
  `view_counter` bigint(10) DEFAULT 0 COMMENT 'View counter',
  `status_complete` tinyint(1) DEFAULT 0 COMMENT 'Status complete (0: ongoing, 1: complete)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Manga';

--
-- Dumping data for table `manga`
--

INSERT INTO `manga` (`id`, `manga_name`, `categories`, `category_ids`, `author`, `author_id`, `favorite_counter`, `remark`, `cover_image`, `cover_image_id`, `slide_image`, `slide_image_id`, `recommended_age`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `artist`, `artist_id`, `release_time`, `view_counter`, `status_complete`) VALUES
(4, 'Gintama', 'Comedy,Action,Adventure,Drama,Shounen,Sci-fi', '10,11,12,13,15,14', 'SORACHI Hideaki', 2, 0, '<p><br></p>', '/profile/upload/manga/cover/2020-12-03/file20201203192223.png', 291, '', NULL, '', '1', '0', 'admin', '2020-12-03 19:22:26', '', '2020-12-21 22:02:45', '', NULL, '2020-12-21 14:41:43', 3, 0),
(5, 'One Punch-Man', 'Action,Adventure,Comedy,Drama,Sci-fi,Seinen,Supernatural', '11,12,10,13,14,16,17', 'ONE', 3, 0, '<p><br></p>', '/profile/upload/manga/cover/2020-12-03/file20201203213522.jpg', 460, '', NULL, '', '1', '0', 'admin', '2020-12-03 21:35:23', '', '2020-12-21 21:45:04', 'MURATA Yuusuke', NULL, '2020-12-21 14:41:46', 7, 0),
(6, 'Kagerou Days', 'Comedy,Drama,Mystery,Romance,Shounen,Supernatural', '10,13,18,19,15,17', 'Jin (じん)', 4, 0, '<p><br></p>', '/profile/upload/manga/cover/2020-12-03/file20201203220255.jpg', 575, '', NULL, '', '1', '0', 'admin', '2020-12-03 22:02:56', '', '2020-12-21 21:35:20', 'SATOU Mahiro', NULL, '2020-12-21 14:41:48', 1, 0),
(9, 'Youjo Senki', 'Action,Sci-fi,Drama', '11,14,13', 'SORACHI Hideaki', 2, 0, '<p><br></p>', '/profile/upload/manga/cover/2020-12-22/file20201222050143.jpg', 743, '', NULL, '', '1', '0', 'admin', '2020-12-22 05:01:47', '', '2020-12-22 05:08:30', '', NULL, '2020-12-22 06:08:30', 0, 0),
(10, 'Ushinawareta Toki o Motomete', 'Adventure,Shounen,Seinen,Drama,Supernatural', '12,15,16,13,17', 'Jin (じん)', 4, 0, '<p><br></p>', '/profile/upload/manga/cover/2020-12-22/file20201222050826.jpg', 744, '', NULL, '', '1', '0', 'admin', '2020-12-22 05:08:27', '', '2020-12-22 05:08:34', 'MURATA Yuusuke', NULL, '2020-12-22 06:08:34', 0, 0),
(11, 'Dragonball', 'Adventure,Shounen,Sci-fi,Drama,Supernatural,Romance', '12,15,14,13,17,19', 'Jin (じん)', 4, 0, '<p><br></p>', '/profile/upload/manga/cover/2020-12-22/file20201222050957.jpg', 745, '', NULL, '', '1', '0', 'admin', '2020-12-22 05:10:02', '', '2020-12-22 05:17:30', '', NULL, '2020-12-22 06:17:30', 0, 0),
(12, 'Lupin III', 'Adventure,Sci-fi,Seinen,Drama,Supernatural', '12,14,16,13,17', 'ONE', 3, 0, '<p><br></p>', '/profile/upload/manga/cover/2020-12-22/file20201222051055.jpg', 746, '', NULL, '', '1', '0', 'admin', '2020-12-22 05:10:56', '', '2020-12-22 05:10:58', 'SATOU Mahiro', NULL, '2020-12-22 06:10:58', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `manga_category`
--

CREATE TABLE `manga_category` (
  `id` bigint(20) NOT NULL COMMENT 'Serial ID',
  `category_name` varchar(30) NOT NULL COMMENT 'Category name',
  `favorite_counter` bigint(10) DEFAULT 0 COMMENT 'Number of reader like this category',
  `status` char(1) DEFAULT '1' COMMENT 'Category status (1 enabled 0 disabled)',
  `del_flag` varchar(1) DEFAULT '0' COMMENT 'Delete flag (0 means existence 1 means deletion)',
  `create_by` varchar(64) DEFAULT '' COMMENT 'Creator',
  `create_time` datetime DEFAULT NULL COMMENT 'Creation time',
  `update_by` varchar(64) DEFAULT '' COMMENT 'Updater',
  `update_time` datetime DEFAULT NULL COMMENT 'Update time',
  `remark` varchar(500) DEFAULT NULL COMMENT 'Remark',
  `cover_image` varchar(100) DEFAULT '' COMMENT 'Category cover image path',
  `cover_image_id` bigint(20) DEFAULT NULL COMMENT 'Id of cover image',
  `recommended_age` varchar(30) DEFAULT '' COMMENT 'Age recommend'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Manga Category';

--
-- Dumping data for table `manga_category`
--

INSERT INTO `manga_category` (`id`, `category_name`, `favorite_counter`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `cover_image`, `cover_image_id`, `recommended_age`) VALUES
(10, 'Comedy', 0, '1', '0', 'admin', '2020-12-03 19:18:45', '', '2020-12-06 14:14:45', '', '', NULL, ''),
(11, 'Action', 0, '1', '0', 'admin', '2020-12-03 19:21:13', '', NULL, '', '', NULL, ''),
(12, 'Adventure', 0, '1', '0', 'admin', '2020-12-03 19:21:20', '', NULL, '', '', NULL, ''),
(13, 'Drama', 0, '1', '0', 'admin', '2020-12-03 19:21:28', '', NULL, '', '', NULL, ''),
(14, 'Sci-fi', 0, '1', '0', 'admin', '2020-12-03 19:21:35', '', NULL, '', '', NULL, ''),
(15, 'Shounen', 0, '1', '0', 'admin', '2020-12-03 19:21:41', '', NULL, '', '', NULL, ''),
(16, 'Seinen', 0, '1', '0', 'admin', '2020-12-03 21:34:11', '', NULL, '', '', NULL, ''),
(17, 'Supernatural', 0, '1', '0', 'admin', '2020-12-03 21:34:18', '', NULL, '', '', NULL, ''),
(18, 'Mystery', 0, '1', '0', 'admin', '2020-12-03 22:01:02', '', NULL, '', '', NULL, ''),
(19, 'Romance', 0, '1', '0', 'admin', '2020-12-03 22:01:10', '', NULL, '', '', NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `manga_chapter`
--

CREATE TABLE `manga_chapter` (
  `id` bigint(20) NOT NULL COMMENT 'Serial ID',
  `chapter_name` varchar(100) DEFAULT '' COMMENT 'Manga name',
  `chapter_index` varchar(200) NOT NULL COMMENT 'Index of chapter in manga',
  `chapter_lang` varchar(5) DEFAULT NULL COMMENT 'Language of chapter',
  `chapter_images` text DEFAULT NULL COMMENT 'Image paths with multipe image seperated by comma',
  `chapter_image_ids` varchar(500) DEFAULT NULL COMMENT 'Image ids with multipe image seperated by comma',
  `manga_id` bigint(20) NOT NULL COMMENT 'Author name of manga',
  `view_counter` bigint(10) DEFAULT 0 COMMENT 'Number of reader read this chapter',
  `favorite_counter` bigint(10) DEFAULT 0 COMMENT 'Number of reader like this chapter',
  `remark` varchar(500) DEFAULT '' COMMENT 'Remark',
  `status` char(1) DEFAULT '1' COMMENT 'Chapter status (1 enabled 0 disabled)',
  `del_flag` varchar(1) DEFAULT '0' COMMENT 'Delete flag (0 means existence 1 means deletion)',
  `create_by` varchar(64) DEFAULT '' COMMENT 'Creator',
  `create_time` datetime DEFAULT NULL COMMENT 'Creation time',
  `update_by` varchar(64) DEFAULT '' COMMENT 'Updater',
  `update_time` datetime DEFAULT NULL COMMENT 'Update time',
  `release_time` datetime DEFAULT NULL COMMENT 'Release time'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Manga Chapter';

--
-- Dumping data for table `manga_chapter`
--

INSERT INTO `manga_chapter` (`id`, `chapter_name`, `chapter_index`, `chapter_lang`, `chapter_images`, `chapter_image_ids`, `manga_id`, `view_counter`, `favorite_counter`, `remark`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `release_time`) VALUES
(2, '', '1', 'en', '/profile/upload/chapter/2/2020-12-03/file20201203192404._Gintama_v01_000.jpg,/profile/upload/chapter/2/2020-12-03/file20201203192404._Gintama_v01_ch01_p01.png,/profile/upload/chapter/2/2020-12-03/file20201203192404._Gintama_v01_ch01_p02.png,/profile/upload/chapter/2/2020-12-03/file20201203192404._Gintama_v01_ch01_p03.jpg,/profile/upload/chapter/2/2020-12-03/file20201203192405._Gintama_v01_ch01_p04-05.jpg,/profile/upload/chapter/2/2020-12-03/file20201203192405._Gintama_v01_ch01_p06.jpg,/profile/upload/chapter/2/2020-12-03/file20201203192405._Gintama_v01_ch01_p07.png,/profile/upload/chapter/2/2020-12-03/file20201203192405._Gintama_v01_ch01_p08.png,/profile/upload/chapter/2/2020-12-03/file20201203192406._Gintama_v01_ch01_p09.png,/profile/upload/chapter/2/2020-12-03/file20201203192406._Gintama_v01_ch01_p10.png,/profile/upload/chapter/2/2020-12-03/file20201203192406._Gintama_v01_ch01_p11.png,/profile/upload/chapter/2/2020-12-03/file20201203192406._Gintama_v01_ch01_p12.png,/profile/upload/chapter/2/2020-12-03/file20201203192406._Gintama_v01_ch01_p13.png,/profile/upload/chapter/2/2020-12-03/file20201203192407._Gintama_v01_ch01_p14.png,/profile/upload/chapter/2/2020-12-03/file20201203192407._Gintama_v01_ch01_p15.png,/profile/upload/chapter/2/2020-12-03/file20201203192407._Gintama_v01_ch01_p16.png,/profile/upload/chapter/2/2020-12-03/file20201203192407._Gintama_v01_ch01_p17.png,/profile/upload/chapter/2/2020-12-03/file20201203192408._Gintama_v01_ch01_p18.png,/profile/upload/chapter/2/2020-12-03/file20201203192408._Gintama_v01_ch01_p19.png,/profile/upload/chapter/2/2020-12-03/file20201203192408._Gintama_v01_ch01_p20.png,/profile/upload/chapter/2/2020-12-03/file20201203192408._Gintama_v01_ch01_p21.png,/profile/upload/chapter/2/2020-12-03/file20201203192409._Gintama_v01_ch01_p22.png,/profile/upload/chapter/2/2020-12-03/file20201203192409._Gintama_v01_ch01_p23.png,/profile/upload/chapter/2/2020-12-03/file20201203192409._Gintama_v01_ch01_p24.png,/profile/upload/chapter/2/2020-12-03/file20201203192409._Gintama_v01_ch01_p25.png,/profile/upload/chapter/2/2020-12-03/file20201203192410._Gintama_v01_ch01_p26.png,/profile/upload/chapter/2/2020-12-03/file20201203192410._Gintama_v01_ch01_p27.png,/profile/upload/chapter/2/2020-12-03/file20201203192410._Gintama_v01_ch01_p28.png,/profile/upload/chapter/2/2020-12-03/file20201203192411._Gintama_v01_ch01_p29.png,/profile/upload/chapter/2/2020-12-03/file20201203192411._Gintama_v01_ch01_p30.png,/profile/upload/chapter/2/2020-12-03/file20201203192411._Gintama_v01_ch01_p31.png,/profile/upload/chapter/2/2020-12-03/file20201203192411._Gintama_v01_ch01_p32.png,/profile/upload/chapter/2/2020-12-03/file20201203192412._Gintama_v01_ch01_p33.png,/profile/upload/chapter/2/2020-12-03/file20201203192412._Gintama_v01_ch01_p34.png,/profile/upload/chapter/2/2020-12-03/file20201203192412._Gintama_v01_ch01_p35.png,/profile/upload/chapter/2/2020-12-03/file20201203192412._Gintama_v01_ch01_p36.png,/profile/upload/chapter/2/2020-12-03/file20201203192413._Gintama_v01_ch01_p37.png,/profile/upload/chapter/2/2020-12-03/file20201203192413._Gintama_v01_ch01_p38.png,/profile/upload/chapter/2/2020-12-03/file20201203192413._Gintama_v01_ch01_p39.png,/profile/upload/chapter/2/2020-12-03/file20201203192413._Gintama_v01_ch01_p40.png,/profile/upload/chapter/2/2020-12-03/file20201203192413._Gintama_v01_ch01_p41.png,/profile/upload/chapter/2/2020-12-03/file20201203192414._Gintama_v01_ch01_p42.png,/profile/upload/chapter/2/2020-12-03/file20201203192414._Gintama_v01_ch01_p43.png,/profile/upload/chapter/2/2020-12-03/file20201203192414._Gintama_v01_ch01_p44.png,/profile/upload/chapter/2/2020-12-03/file20201203192414._Gintama_v01_ch01_p45.png,/profile/upload/chapter/2/2020-12-03/file20201203192415._Gintama_v01_ch01_p46.png,/profile/upload/chapter/2/2020-12-03/file20201203192415._Gintama_v01_ch01_p47.png,/profile/upload/chapter/2/2020-12-03/file20201203192415._Gintama_v01_ch01_p48.png,/profile/upload/chapter/2/2020-12-03/file20201203192415._Gintama_v01_ch01_p49.png,/profile/upload/chapter/2/2020-12-03/file20201203192416._Gintama_v01_ch01_p50.png,/profile/upload/chapter/2/2020-12-03/file20201203192416._Gintama_v01_ch01_p51.png,/profile/upload/chapter/2/2020-12-03/file20201203192416._Gintama_v01_ch01_p52.png,/profile/upload/chapter/2/2020-12-03/file20201203192416._Gintama_v01_ch01_p53.png,/profile/upload/chapter/2/2020-12-03/file20201203192417._Gintama_v01_ch01_p54.png,/profile/upload/chapter/2/2020-12-03/file20201203192417._Gintama_v01_ch01_p55.png,/profile/upload/chapter/2/2020-12-03/file20201203192417._Gintama_v01_ch01_p56.png,/profile/upload/chapter/2/2020-12-03/file20201203192417._Gintama_v01_ch01_p57.png,/profile/upload/chapter/2/2020-12-03/file20201203192418._Gintama_v01_ch01_p58.png', '292,293,294,295,296,297,298,299,300,301,302,303,304,305,306,307,308,309,310,311,312,313,314,315,316,317,318,319,320,321,322,323,324,325,326,327,328,329,330,331,332,333,334,335,336,337,338,339,340,341,342,343,344,345,346,347,348,349', 4, 1, 0, '', '1', '0', 'admin', '2020-12-03 19:22:50', '', '2020-12-21 22:02:24', '2020-12-21 14:42:00'),
(3, '', '2', 'en', '/profile/upload/chapter/3/2020-12-03/file20201203213045._Gintama_v01_ch02_p01.png,/profile/upload/chapter/3/2020-12-03/file20201203213045._Gintama_v01_ch02_p02.png,/profile/upload/chapter/3/2020-12-03/file20201203213046._Gintama_v01_ch02_p03.png,/profile/upload/chapter/3/2020-12-03/file20201203213046._Gintama_v01_ch02_p04.png,/profile/upload/chapter/3/2020-12-03/file20201203213046._Gintama_v01_ch02_p05.png,/profile/upload/chapter/3/2020-12-03/file20201203213046._Gintama_v01_ch02_p06.png,/profile/upload/chapter/3/2020-12-03/file20201203213046._Gintama_v01_ch02_p07.png,/profile/upload/chapter/3/2020-12-03/file20201203213047._Gintama_v01_ch02_p08.png,/profile/upload/chapter/3/2020-12-03/file20201203213047._Gintama_v01_ch02_p09.png,/profile/upload/chapter/3/2020-12-03/file20201203213047._Gintama_v01_ch02_p10.png,/profile/upload/chapter/3/2020-12-03/file20201203213047._Gintama_v01_ch02_p11.png,/profile/upload/chapter/3/2020-12-03/file20201203213047._Gintama_v01_ch02_p12.png,/profile/upload/chapter/3/2020-12-03/file20201203213048._Gintama_v01_ch02_p13.png,/profile/upload/chapter/3/2020-12-03/file20201203213048._Gintama_v01_ch02_p14.png,/profile/upload/chapter/3/2020-12-03/file20201203213048._Gintama_v01_ch02_p15.png,/profile/upload/chapter/3/2020-12-03/file20201203213048._Gintama_v01_ch02_p16.png,/profile/upload/chapter/3/2020-12-03/file20201203213049._Gintama_v01_ch02_p17.png,/profile/upload/chapter/3/2020-12-03/file20201203213049._Gintama_v01_ch02_p18.png,/profile/upload/chapter/3/2020-12-03/file20201203213049._Gintama_v01_ch02_p19.png,/profile/upload/chapter/3/2020-12-03/file20201203213049._Gintama_v01_ch02_p20.png,/profile/upload/chapter/3/2020-12-03/file20201203213049._Gintama_v01_ch02_p21.png,/profile/upload/chapter/3/2020-12-03/file20201203213050._Gintama_v01_ch02_p22.png,/profile/upload/chapter/3/2020-12-03/file20201203213050._Gintama_v01_ch02_p23.png,/profile/upload/chapter/3/2020-12-03/file20201203213050._Gintama_v01_ch02_p24.png,/profile/upload/chapter/3/2020-12-03/file20201203213050._Gintama_v01_ch02_p25.png,/profile/upload/chapter/3/2020-12-03/file20201203213050._Gintama_v01_ch02_p26.png', '350,351,352,353,354,355,356,357,358,359,360,361,362,363,364,365,366,367,368,369,370,371,372,373,374,375', 4, 1, 0, '', '1', '0', 'admin', '2020-12-03 21:30:16', '', '2020-12-21 22:02:33', '2020-12-21 14:42:02'),
(4, '', '3', 'en', '/profile/upload/chapter/4/2020-12-03/file20201203213110._Gintama_v01_ch03_p01.jpg,/profile/upload/chapter/4/2020-12-03/file20201203213111._Gintama_v01_ch03_p02.png,/profile/upload/chapter/4/2020-12-03/file20201203213111._Gintama_v01_ch03_p03.png,/profile/upload/chapter/4/2020-12-03/file20201203213111._Gintama_v01_ch03_p04.png,/profile/upload/chapter/4/2020-12-03/file20201203213111._Gintama_v01_ch03_p05.png,/profile/upload/chapter/4/2020-12-03/file20201203213111._Gintama_v01_ch03_p06.png,/profile/upload/chapter/4/2020-12-03/file20201203213112._Gintama_v01_ch03_p07.png,/profile/upload/chapter/4/2020-12-03/file20201203213112._Gintama_v01_ch03_p08.png,/profile/upload/chapter/4/2020-12-03/file20201203213112._Gintama_v01_ch03_p09.png,/profile/upload/chapter/4/2020-12-03/file20201203213112._Gintama_v01_ch03_p10.png,/profile/upload/chapter/4/2020-12-03/file20201203213112._Gintama_v01_ch03_p11.png,/profile/upload/chapter/4/2020-12-03/file20201203213113._Gintama_v01_ch03_p12.png,/profile/upload/chapter/4/2020-12-03/file20201203213113._Gintama_v01_ch03_p13.png,/profile/upload/chapter/4/2020-12-03/file20201203213113._Gintama_v01_ch03_p14.png,/profile/upload/chapter/4/2020-12-03/file20201203213113._Gintama_v01_ch03_p15.png,/profile/upload/chapter/4/2020-12-03/file20201203213114._Gintama_v01_ch03_p16.png,/profile/upload/chapter/4/2020-12-03/file20201203213114._Gintama_v01_ch03_p17.png,/profile/upload/chapter/4/2020-12-03/file20201203213114._Gintama_v01_ch03_p18.png,/profile/upload/chapter/4/2020-12-03/file20201203213114._Gintama_v01_ch03_p19.png,/profile/upload/chapter/4/2020-12-03/file20201203213114._Gintama_v01_ch03_p20.png,/profile/upload/chapter/4/2020-12-03/file20201203213115._Gintama_v01_ch03_p21.png,/profile/upload/chapter/4/2020-12-03/file20201203213115._Gintama_v01_ch03_p22.png,/profile/upload/chapter/4/2020-12-03/file20201203213115._Gintama_v01_ch03_p23.png,/profile/upload/chapter/4/2020-12-03/file20201203213115._Gintama_v01_ch03_p24.png,/profile/upload/chapter/4/2020-12-03/file20201203213115._Gintama_v01_ch03_p25.png', '376,377,378,379,380,381,382,383,384,385,386,387,388,389,390,391,392,393,394,395,396,397,398,399,400', 4, 1, 0, '', '1', '0', 'admin', '2020-12-03 21:30:19', '', '2020-12-21 22:02:45', '2020-12-21 14:42:05'),
(5, '', '4', 'en', '/profile/upload/chapter/5/2020-12-03/file20201203213132._Gintama_v01_ch04_p01.png,/profile/upload/chapter/5/2020-12-03/file20201203213132._Gintama_v01_ch04_p02.png,/profile/upload/chapter/5/2020-12-03/file20201203213133._Gintama_v01_ch04_p03.png,/profile/upload/chapter/5/2020-12-03/file20201203213133._Gintama_v01_ch04_p04.png,/profile/upload/chapter/5/2020-12-03/file20201203213133._Gintama_v01_ch04_p05.png,/profile/upload/chapter/5/2020-12-03/file20201203213133._Gintama_v01_ch04_p06.png,/profile/upload/chapter/5/2020-12-03/file20201203213133._Gintama_v01_ch04_p07.png,/profile/upload/chapter/5/2020-12-03/file20201203213134._Gintama_v01_ch04_p08.png,/profile/upload/chapter/5/2020-12-03/file20201203213134._Gintama_v01_ch04_p09.png,/profile/upload/chapter/5/2020-12-03/file20201203213134._Gintama_v01_ch04_p10.png,/profile/upload/chapter/5/2020-12-03/file20201203213134._Gintama_v01_ch04_p11.png,/profile/upload/chapter/5/2020-12-03/file20201203213134._Gintama_v01_ch04_p12.png,/profile/upload/chapter/5/2020-12-03/file20201203213135._Gintama_v01_ch04_p13.png,/profile/upload/chapter/5/2020-12-03/file20201203213135._Gintama_v01_ch04_p14.png,/profile/upload/chapter/5/2020-12-03/file20201203213135._Gintama_v01_ch04_p15.png,/profile/upload/chapter/5/2020-12-03/file20201203213136._Gintama_v01_ch04_p16.png,/profile/upload/chapter/5/2020-12-03/file20201203213136._Gintama_v01_ch04_p17.png,/profile/upload/chapter/5/2020-12-03/file20201203213136._Gintama_v01_ch04_p18.png,/profile/upload/chapter/5/2020-12-03/file20201203213136._Gintama_v01_ch04_p19.png,/profile/upload/chapter/5/2020-12-03/file20201203213137._Gintama_v01_ch04_p20.png', '401,402,403,404,405,406,407,408,409,410,411,412,413,414,415,416,417,418,419,420', 4, 0, 0, '', '1', '0', 'admin', '2020-12-03 21:30:22', '', '2020-12-21 13:42:07', '2020-12-21 14:42:07'),
(6, '', '5', 'en', '/profile/upload/chapter/6/2020-12-03/file20201203213153._Gintama_v01_ch05_p01.png,/profile/upload/chapter/6/2020-12-03/file20201203213153._Gintama_v01_ch05_p02.png,/profile/upload/chapter/6/2020-12-03/file20201203213153._Gintama_v01_ch05_p03.png,/profile/upload/chapter/6/2020-12-03/file20201203213153._Gintama_v01_ch05_p04.png,/profile/upload/chapter/6/2020-12-03/file20201203213153._Gintama_v01_ch05_p05.png,/profile/upload/chapter/6/2020-12-03/file20201203213154._Gintama_v01_ch05_p06.png,/profile/upload/chapter/6/2020-12-03/file20201203213154._Gintama_v01_ch05_p07.png,/profile/upload/chapter/6/2020-12-03/file20201203213154._Gintama_v01_ch05_p08.png,/profile/upload/chapter/6/2020-12-03/file20201203213154._Gintama_v01_ch05_p09.png,/profile/upload/chapter/6/2020-12-03/file20201203213155._Gintama_v01_ch05_p10.png,/profile/upload/chapter/6/2020-12-03/file20201203213155._Gintama_v01_ch05_p11.png,/profile/upload/chapter/6/2020-12-03/file20201203213155._Gintama_v01_ch05_p12.png,/profile/upload/chapter/6/2020-12-03/file20201203213155._Gintama_v01_ch05_p13.png,/profile/upload/chapter/6/2020-12-03/file20201203213155._Gintama_v01_ch05_p14.png,/profile/upload/chapter/6/2020-12-03/file20201203213156._Gintama_v01_ch05_p15.png,/profile/upload/chapter/6/2020-12-03/file20201203213156._Gintama_v01_ch05_p16.png,/profile/upload/chapter/6/2020-12-03/file20201203213156._Gintama_v01_ch05_p17.png,/profile/upload/chapter/6/2020-12-03/file20201203213156._Gintama_v01_ch05_p18.png,/profile/upload/chapter/6/2020-12-03/file20201203213156._Gintama_v01_ch05_p19.png,/profile/upload/chapter/6/2020-12-03/file20201203213157._Gintama_v01_ch05_p20.png', '421,422,423,424,425,426,427,428,429,430,431,432,433,434,435,436,437,438,439,440', 4, 0, 0, '', '1', '0', 'admin', '2020-12-03 21:30:25', '', '2020-12-21 13:42:10', '2020-12-21 14:42:10'),
(7, '', '6', 'en', '/profile/upload/chapter/7/2020-12-03/file20201203213215._Gintama_v01_ch06_p01.png,/profile/upload/chapter/7/2020-12-03/file20201203213215._Gintama_v01_ch06_p02.png,/profile/upload/chapter/7/2020-12-03/file20201203213216._Gintama_v01_ch06_p03.png,/profile/upload/chapter/7/2020-12-03/file20201203213216._Gintama_v01_ch06_p04.png,/profile/upload/chapter/7/2020-12-03/file20201203213216._Gintama_v01_ch06_p05.png,/profile/upload/chapter/7/2020-12-03/file20201203213216._Gintama_v01_ch06_p06.png,/profile/upload/chapter/7/2020-12-03/file20201203213217._Gintama_v01_ch06_p07.png,/profile/upload/chapter/7/2020-12-03/file20201203213217._Gintama_v01_ch06_p08.png,/profile/upload/chapter/7/2020-12-03/file20201203213217._Gintama_v01_ch06_p09.png,/profile/upload/chapter/7/2020-12-03/file20201203213218._Gintama_v01_ch06_p10.png,/profile/upload/chapter/7/2020-12-03/file20201203213218._Gintama_v01_ch06_p11.png,/profile/upload/chapter/7/2020-12-03/file20201203213218._Gintama_v01_ch06_p12.png,/profile/upload/chapter/7/2020-12-03/file20201203213218._Gintama_v01_ch06_p13.png,/profile/upload/chapter/7/2020-12-03/file20201203213218._Gintama_v01_ch06_p14.png,/profile/upload/chapter/7/2020-12-03/file20201203213219._Gintama_v01_ch06_p15.png,/profile/upload/chapter/7/2020-12-03/file20201203213219._Gintama_v01_ch06_p16.png,/profile/upload/chapter/7/2020-12-03/file20201203213219._Gintama_v01_ch06_p17.png,/profile/upload/chapter/7/2020-12-03/file20201203213219._Gintama_v01_ch06_p18.png,/profile/upload/chapter/7/2020-12-03/file20201203213220._Gintama_v01_ch06_p19.png', '441,442,443,444,445,446,447,448,449,450,451,452,453,454,455,456,457,458,459', 4, 0, 0, '', '1', '0', 'admin', '2020-12-03 21:30:27', '', '2020-12-21 13:42:12', '2020-12-21 14:42:12'),
(8, '', '1', 'en', '/profile/upload/chapter/8/2020-12-03/file20201203215752.OnePunchManc001mixp000000x1c001Boon.jpg,/profile/upload/chapter/8/2020-12-03/file20201203215752.OnePunchManc001mixp000x2000x3c001Boon.jpg,/profile/upload/chapter/8/2020-12-03/file20201203215753.OnePunchManc001mixp000x4000x5c001Boon.jpg,/profile/upload/chapter/8/2020-12-03/file20201203215753.OnePunchManc001mixp000x6c001Boon.jpg,/profile/upload/chapter/8/2020-12-03/file20201203215753.OnePunchManc001mixp001c001Boon.jpg,/profile/upload/chapter/8/2020-12-03/file20201203215753.OnePunchManc001mixp002c001Boon.jpg,/profile/upload/chapter/8/2020-12-03/file20201203215754.OnePunchManc001mixp003c001Boon.jpg,/profile/upload/chapter/8/2020-12-03/file20201203215754.OnePunchManc001mixp004c001Boon.jpg,/profile/upload/chapter/8/2020-12-03/file20201203215754.OnePunchManc001mixp005c001Boon.jpg,/profile/upload/chapter/8/2020-12-03/file20201203215754.OnePunchManc001mixp006007c001Boon.jpg,/profile/upload/chapter/8/2020-12-03/file20201203215754.OnePunchManc001mixp008c001Boon.jpg,/profile/upload/chapter/8/2020-12-03/file20201203215755.OnePunchManc001mixp009c001Boon.jpg,/profile/upload/chapter/8/2020-12-03/file20201203215755.OnePunchManc001mixp010c001Boon.jpg,/profile/upload/chapter/8/2020-12-03/file20201203215755.OnePunchManc001mixp011c001Boon.jpg,/profile/upload/chapter/8/2020-12-03/file20201203215755.OnePunchManc001mixp012c001Boon.jpg,/profile/upload/chapter/8/2020-12-03/file20201203215756.OnePunchManc001mixp013c001Boon.jpg,/profile/upload/chapter/8/2020-12-03/file20201203215756.OnePunchManc001mixp014c001Boon.jpg,/profile/upload/chapter/8/2020-12-03/file20201203215756.OnePunchManc001mixp015c001Boon.jpg,/profile/upload/chapter/8/2020-12-03/file20201203215757.OnePunchManc001mixp016c001Boon.jpg,/profile/upload/chapter/8/2020-12-03/file20201203215757.OnePunchManc001mixp017c001Boon.jpg,/profile/upload/chapter/8/2020-12-03/file20201203215757.OnePunchManc001mixp018019c001Boon.jpg,/profile/upload/chapter/8/2020-12-03/file20201203215757.OnePunchManc001mixp020c001Boon.jpg,/profile/upload/chapter/8/2020-12-03/file20201203215758.OnePunchManc001mixp021c001Boon.jpg,/profile/upload/chapter/8/2020-12-03/file20201203215758.OnePunchManc001mixp022023c001Boon.jpg,/profile/upload/chapter/8/2020-12-03/file20201203215758.OnePunchManc001mixp024025c001Boon.jpg,/profile/upload/chapter/8/2020-12-03/file20201203215758.OnePunchManc001mixp026c001Boon.jpg', '513,514,515,516,517,518,519,520,521,522,523,524,525,526,527,528,529,530,531,532,533,534,535,536,537,538', 5, 3, 0, '', '1', '0', 'admin', '2020-12-03 21:35:32', '', '2020-12-21 21:03:28', '2020-12-21 14:42:18'),
(9, '', '2', 'en', '/profile/upload/chapter/9/2020-12-03/file20201203215901.OnePunchManc002webp027c002Boon.jpg,/profile/upload/chapter/9/2020-12-03/file20201203215901.OnePunchManc002webp028c002Boon.jpg,/profile/upload/chapter/9/2020-12-03/file20201203215902.OnePunchManc002webp029c002Boon.jpg,/profile/upload/chapter/9/2020-12-03/file20201203215902.OnePunchManc002webp030c002Boon.jpg,/profile/upload/chapter/9/2020-12-03/file20201203215902.OnePunchManc002webp031c002Boon.jpg,/profile/upload/chapter/9/2020-12-03/file20201203215902.OnePunchManc002webp032c002Boon.jpg,/profile/upload/chapter/9/2020-12-03/file20201203215902.OnePunchManc002webp033c002Boon.jpg,/profile/upload/chapter/9/2020-12-03/file20201203215903.OnePunchManc002webp034c002Boon.jpg,/profile/upload/chapter/9/2020-12-03/file20201203215903.OnePunchManc002webp035c002Boon.jpg,/profile/upload/chapter/9/2020-12-03/file20201203215903.OnePunchManc002webp036c002Boon.jpg,/profile/upload/chapter/9/2020-12-03/file20201203215903.OnePunchManc002webp037c002Boon.jpg,/profile/upload/chapter/9/2020-12-03/file20201203215903.OnePunchManc002webp038c002Boon.jpg,/profile/upload/chapter/9/2020-12-03/file20201203215904.OnePunchManc002webp039c002Boon.jpg,/profile/upload/chapter/9/2020-12-03/file20201203215904.OnePunchManc002webp040c002Boon.jpg,/profile/upload/chapter/9/2020-12-03/file20201203215904.OnePunchManc002webp041c002Boon.jpg,/profile/upload/chapter/9/2020-12-03/file20201203215904.OnePunchManc002webp042c002Boon.jpg', '539,540,541,542,543,544,545,546,547,548,549,550,551,552,553,554', 5, 2, 0, '', '1', '0', 'admin', '2020-12-03 21:35:35', '', '2020-12-21 20:43:32', '2020-12-21 14:42:21'),
(10, '', '3', 'en', '/profile/upload/chapter/10/2020-12-03/file20201203215922.OnePunchManc003webp043c003Boon.jpg,/profile/upload/chapter/10/2020-12-03/file20201203215922.OnePunchManc003webp044c003Boon.jpg,/profile/upload/chapter/10/2020-12-03/file20201203215922.OnePunchManc003webp045c003Boon.jpg,/profile/upload/chapter/10/2020-12-03/file20201203215923.OnePunchManc003webp046c003Boon.jpg,/profile/upload/chapter/10/2020-12-03/file20201203215923.OnePunchManc003webp047c003Boon.jpg,/profile/upload/chapter/10/2020-12-03/file20201203215923.OnePunchManc003webp048c003Boon.jpg,/profile/upload/chapter/10/2020-12-03/file20201203215923.OnePunchManc003webp049c003Boon.jpg,/profile/upload/chapter/10/2020-12-03/file20201203215924.OnePunchManc003webp050c003Boon.jpg,/profile/upload/chapter/10/2020-12-03/file20201203215924.OnePunchManc003webp051c003Boon.jpg,/profile/upload/chapter/10/2020-12-03/file20201203215924.OnePunchManc003webp052c003Boon.jpg,/profile/upload/chapter/10/2020-12-03/file20201203215924.OnePunchManc003webp053c003Boon.jpg,/profile/upload/chapter/10/2020-12-03/file20201203215925.OnePunchManc003webp054c003Boon.jpg,/profile/upload/chapter/10/2020-12-03/file20201203215925.OnePunchManc003webp055c003Boon.jpg,/profile/upload/chapter/10/2020-12-03/file20201203215925.OnePunchManc003webp056c003Boon.jpg,/profile/upload/chapter/10/2020-12-03/file20201203215925.OnePunchManc003webp057c003Boon.jpg,/profile/upload/chapter/10/2020-12-03/file20201203215926.OnePunchManc003webp058c003Boon.jpg,/profile/upload/chapter/10/2020-12-03/file20201203215926.OnePunchManc003webp059c003Boon.jpg,/profile/upload/chapter/10/2020-12-03/file20201203215926.OnePunchManc003webp060061c003Boon.jpg,/profile/upload/chapter/10/2020-12-03/file20201203215926.OnePunchManc003webp062063c003Boon.jpg,/profile/upload/chapter/10/2020-12-03/file20201203215926.OnePunchManc003webp064c003Boon.jpg', '555,556,557,558,559,560,561,562,563,564,565,566,567,568,569,570,571,572,573,574', 5, 2, 0, '', '1', '0', 'admin', '2020-12-03 21:35:38', '', '2020-12-21 21:45:04', '2020-12-21 14:42:23'),
(13, '', '1', 'jp', '/profile/upload/chapter/13/2020-12-03/file20201203220503.0001.jpg,/profile/upload/chapter/13/2020-12-03/file20201203220503.0002.jpg,/profile/upload/chapter/13/2020-12-03/file20201203220504.0003.jpg,/profile/upload/chapter/13/2020-12-03/file20201203220504.0004.jpg,/profile/upload/chapter/13/2020-12-03/file20201203220504.0005.jpg,/profile/upload/chapter/13/2020-12-03/file20201203220504.0006.jpg,/profile/upload/chapter/13/2020-12-03/file20201203220505.CCF.jpg,/profile/upload/chapter/13/2020-12-03/file20201203220505.CCF0001.jpg,/profile/upload/chapter/13/2020-12-03/file20201203220505.CCF0002.jpg,/profile/upload/chapter/13/2020-12-03/file20201203220505.CCF0003.jpg,/profile/upload/chapter/13/2020-12-03/file20201203220506.CCF0004.jpg,/profile/upload/chapter/13/2020-12-03/file20201203220506.CCF0005.jpg,/profile/upload/chapter/13/2020-12-03/file20201203220506.CCF0006.jpg,/profile/upload/chapter/13/2020-12-03/file20201203220507.CCF0007.jpg,/profile/upload/chapter/13/2020-12-03/file20201203220507.CCF0008.jpg,/profile/upload/chapter/13/2020-12-03/file20201203220507.CCF0009.jpg,/profile/upload/chapter/13/2020-12-03/file20201203220507.CCF0010.jpg,/profile/upload/chapter/13/2020-12-03/file20201203220507.CCF0011.jpg,/profile/upload/chapter/13/2020-12-03/file20201203220508.CCF0012.jpg,/profile/upload/chapter/13/2020-12-03/file20201203220508.CCF0013.jpg,/profile/upload/chapter/13/2020-12-03/file20201203220508.CCF0014.jpg,/profile/upload/chapter/13/2020-12-03/file20201203220508.CCF0015.jpg,/profile/upload/chapter/13/2020-12-03/file20201203220509.CCF0016.jpg,/profile/upload/chapter/13/2020-12-03/file20201203220509.CCF0017.jpg,/profile/upload/chapter/13/2020-12-03/file20201203220509.CCF0018.jpg,/profile/upload/chapter/13/2020-12-03/file20201203220509.CCF0019.jpg,/profile/upload/chapter/13/2020-12-03/file20201203220509.CCF0020.jpg,/profile/upload/chapter/13/2020-12-03/file20201203220510.CCF0021.jpg,/profile/upload/chapter/13/2020-12-03/file20201203220510.CCF0022.jpg,/profile/upload/chapter/13/2020-12-03/file20201203220510.CCF0023.jpg,/profile/upload/chapter/13/2020-12-03/file20201203220510.CCF0024.jpg,/profile/upload/chapter/13/2020-12-03/file20201203220511.CCF0025.jpg,/profile/upload/chapter/13/2020-12-03/file20201203220511.CCF0026.jpg,/profile/upload/chapter/13/2020-12-03/file20201203220511.CCF0027.jpg,/profile/upload/chapter/13/2020-12-03/file20201203220511.CCF0028.jpg,/profile/upload/chapter/13/2020-12-03/file20201203220512.CCF0029.jpg,/profile/upload/chapter/13/2020-12-03/file20201203220512.CCF0030.jpg,/profile/upload/chapter/13/2020-12-03/file20201203220512.CCF0031.jpg,/profile/upload/chapter/13/2020-12-03/file20201203220512.CCF0032.jpg,/profile/upload/chapter/13/2020-12-03/file20201203220512.CCF0033.jpg,/profile/upload/chapter/13/2020-12-03/file20201203220513.CCF0034.jpg,/profile/upload/chapter/13/2020-12-03/file20201203220513.CCF0035.jpg,/profile/upload/chapter/13/2020-12-03/file20201203220513.CCF0036.jpg,/profile/upload/chapter/13/2020-12-03/file20201203220513.CCF0037.jpg,/profile/upload/chapter/13/2020-12-03/file20201203220514.CCF0038.jpg,/profile/upload/chapter/13/2020-12-03/file20201203220514.CCF0039.jpg,/profile/upload/chapter/13/2020-12-03/file20201203220514.CCF0040.jpg,/profile/upload/chapter/13/2020-12-03/file20201203220514.CCF0041.jpg,/profile/upload/chapter/13/2020-12-03/file20201203220515.CCF0042.jpg,/profile/upload/chapter/13/2020-12-03/file20201203220515.CCF0043.jpg,/profile/upload/chapter/13/2020-12-03/file20201203220515.CCF0044.jpg,/profile/upload/chapter/13/2020-12-03/file20201203220515.CCF0045.jpg,/profile/upload/chapter/13/2020-12-03/file20201203220516.CCF0046.jpg,/profile/upload/chapter/13/2020-12-03/file20201203220516.CCF0047.jpg,/profile/upload/chapter/13/2020-12-03/file20201203220516.CCF0048.jpg,/profile/upload/chapter/13/2020-12-03/file20201203220516.CCF0049.jpg,/profile/upload/chapter/13/2020-12-03/file20201203220516.CCF0050.jpg,/profile/upload/chapter/13/2020-12-03/file20201203220517.CCF0051.jpg,/profile/upload/chapter/13/2020-12-03/file20201203220517.CCF0052.jpg,/profile/upload/chapter/13/2020-12-03/file20201203220517.CCF0053.jpg,/profile/upload/chapter/13/2020-12-03/file20201203220517.CCF0054.jpg,/profile/upload/chapter/13/2020-12-03/file20201203220517.CCF0055.jpg,/profile/upload/chapter/13/2020-12-03/file20201203220518.CCF0056.jpg,/profile/upload/chapter/13/2020-12-03/file20201203220518.CCF0057.jpg,/profile/upload/chapter/13/2020-12-03/file20201203220518.CCF0058.jpg,/profile/upload/chapter/13/2020-12-03/file20201203220518.CCF0059.jpg,/profile/upload/chapter/13/2020-12-03/file20201203220519.CCF0060.jpg,/profile/upload/chapter/13/2020-12-03/file20201203220519.CCF0061.jpg,/profile/upload/chapter/13/2020-12-03/file20201203220519.CCF0062.jpg,/profile/upload/chapter/13/2020-12-03/file20201203220519.CCF0063.jpg,/profile/upload/chapter/13/2020-12-03/file20201203220519.CCF0064.jpg,/profile/upload/chapter/13/2020-12-03/file20201203220520.CCF0065.jpg,/profile/upload/chapter/13/2020-12-03/file20201203220520.CCF0066.jpg,/profile/upload/chapter/13/2020-12-03/file20201203220520.CCF0067.jpg,/profile/upload/chapter/13/2020-12-03/file20201203220520.CCF0068.jpg,/profile/upload/chapter/13/2020-12-03/file20201203220521.CCF0069.jpg,/profile/upload/chapter/13/2020-12-03/file20201203220521.CCF0070.jpg,/profile/upload/chapter/13/2020-12-03/file20201203220521.CCF0071.jpg,/profile/upload/chapter/13/2020-12-03/file20201203220521.CCF0072.jpg,/profile/upload/chapter/13/2020-12-03/file20201203220522.CCF0073.jpg,/profile/upload/chapter/13/2020-12-03/file20201203220522.CCF0074.jpg,/profile/upload/chapter/13/2020-12-03/file20201203220522.CCF0075.jpg,/profile/upload/chapter/13/2020-12-03/file20201203220522.CCF0076.jpg,/profile/upload/chapter/13/2020-12-03/file20201203220522.CCF0077.jpg,/profile/upload/chapter/13/2020-12-03/file20201203220523.CCF0078.jpg,/profile/upload/chapter/13/2020-12-03/file20201203220523.CCF0079.jpg,/profile/upload/chapter/13/2020-12-03/file20201203220523.CCF0080.jpg,/profile/upload/chapter/13/2020-12-03/file20201203220523.CCF0081.jpg,/profile/upload/chapter/13/2020-12-03/file20201203220524.CCF0082.jpg,/profile/upload/chapter/13/2020-12-03/file20201203220524.CCF0083.jpg,/profile/upload/chapter/13/2020-12-03/file20201203220524.CCF0084.jpg,/profile/upload/chapter/13/2020-12-03/file20201203220524.CCF0085.jpg,/profile/upload/chapter/13/2020-12-03/file20201203220525.CCF0086.jpg,/profile/upload/chapter/13/2020-12-03/file20201203220525.CCF0087.jpg,/profile/upload/chapter/13/2020-12-03/file20201203220525.CCF0088.jpg,/profile/upload/chapter/13/2020-12-03/file20201203220525.CCF0089.jpg,/profile/upload/chapter/13/2020-12-03/file20201203220525.CCF0090.jpg,/profile/upload/chapter/13/2020-12-03/file20201203220526.CCF0091.jpg,/profile/upload/chapter/13/2020-12-03/file20201203220526.CCF0092.jpg,/profile/upload/chapter/13/2020-12-03/file20201203220526.CCF0093.jpg,/profile/upload/chapter/13/2020-12-03/file20201203220526.CCF0094.jpg,/profile/upload/chapter/13/2020-12-03/file20201203220527.CCF0095.jpg,/profile/upload/chapter/13/2020-12-03/file20201203220527.CCF0096.jpg,/profile/upload/chapter/13/2020-12-03/file20201203220527.CCF0097.jpg,/profile/upload/chapter/13/2020-12-03/file20201203220527.CCF0098.jpg,/profile/upload/chapter/13/2020-12-03/file20201203220528.CCF0099.jpg,/profile/upload/chapter/13/2020-12-03/file20201203220528.CCF0100.jpg,/profile/upload/chapter/13/2020-12-03/file20201203220528.CCF0101.jpg,/profile/upload/chapter/13/2020-12-03/file20201203220528.CCF0102.jpg,/profile/upload/chapter/13/2020-12-03/file20201203220529.CCF0103.jpg,/profile/upload/chapter/13/2020-12-03/file20201203220529.CCF0104.jpg,/profile/upload/chapter/13/2020-12-03/file20201203220529.CCF0105.jpg,/profile/upload/chapter/13/2020-12-03/file20201203220529.CCF0106.jpg,/profile/upload/chapter/13/2020-12-03/file20201203220530.CCF0107.jpg,/profile/upload/chapter/13/2020-12-03/file20201203220530.CCF0108.jpg,/profile/upload/chapter/13/2020-12-03/file20201203220530.CCF0109.jpg,/profile/upload/chapter/13/2020-12-03/file20201203220530.CCF0110.jpg,/profile/upload/chapter/13/2020-12-03/file20201203220531.CCF0111.jpg,/profile/upload/chapter/13/2020-12-03/file20201203220531.CCF0112.jpg,/profile/upload/chapter/13/2020-12-03/file20201203220531.CCF0113.jpg,/profile/upload/chapter/13/2020-12-03/file20201203220531.CCF0114.jpg,/profile/upload/chapter/13/2020-12-03/file20201203220532.CCF0115.jpg,/profile/upload/chapter/13/2020-12-03/file20201203220532.CCF0116.jpg,/profile/upload/chapter/13/2020-12-03/file20201203220532.CCF0117.jpg,/profile/upload/chapter/13/2020-12-03/file20201203220532.CCF0118.jpg', '576,577,578,579,580,581,582,583,584,585,586,587,588,589,590,591,592,593,594,595,596,597,598,599,600,601,602,603,604,605,606,607,608,609,610,611,612,613,614,615,616,617,618,619,620,621,622,623,624,625,626,627,628,629,630,631,632,633,634,635,636,637,638,639,640,641,642,643,644,645,646,647,648,649,650,651,652,653,654,655,656,657,658,659,660,661,662,663,664,665,666,667,668,669,670,671,672,673,674,675,676,677,678,679,680,681,682,683,684,685,686,687,688,689,690,691,692,693,694,695,696,697,698,699,700', 6, 1, 0, '', '1', '0', 'admin', '2020-12-03 22:03:05', '', '2020-12-21 21:35:20', '2020-12-21 14:42:37'),
(15, '', '1', 'en', '/profile/upload/chapter/15/2020-12-22/file20201222051332.00.png,/profile/upload/chapter/15/2020-12-22/file20201222051333.10.png,/profile/upload/chapter/15/2020-12-22/file20201222051333.20.png,/profile/upload/chapter/15/2020-12-22/file20201222051333.21.png,/profile/upload/chapter/15/2020-12-22/file20201222051333.30.png,/profile/upload/chapter/15/2020-12-22/file20201222051334.40.png,/profile/upload/chapter/15/2020-12-22/file20201222051334.50.png,/profile/upload/chapter/15/2020-12-22/file20201222051334.51.png,/profile/upload/chapter/15/2020-12-22/file20201222051334.60.png,/profile/upload/chapter/15/2020-12-22/file20201222051334.61.png,/profile/upload/chapter/15/2020-12-22/file20201222051335.70.png,/profile/upload/chapter/15/2020-12-22/file20201222051335.80.png,/profile/upload/chapter/15/2020-12-22/file20201222051335.90.png,/profile/upload/chapter/15/2020-12-22/file20201222051335.100.png,/profile/upload/chapter/15/2020-12-22/file20201222051335.110.png,/profile/upload/chapter/15/2020-12-22/file20201222051336.111.png,/profile/upload/chapter/15/2020-12-22/file20201222051336.120.png,/profile/upload/chapter/15/2020-12-22/file20201222051336.130.png,/profile/upload/chapter/15/2020-12-22/file20201222051336.140.png,/profile/upload/chapter/15/2020-12-22/file20201222051337.150.png,/profile/upload/chapter/15/2020-12-22/file20201222051337.160.png,/profile/upload/chapter/15/2020-12-22/file20201222051337.170.png,/profile/upload/chapter/15/2020-12-22/file20201222051337.180.png,/profile/upload/chapter/15/2020-12-22/file20201222051337.181.png,/profile/upload/chapter/15/2020-12-22/file20201222051338.190.png,/profile/upload/chapter/15/2020-12-22/file20201222051338.200.png', '747,748,749,750,751,752,753,754,755,756,757,758,759,760,761,762,763,764,765,766,767,768,769,770,771,772', 9, 0, 0, '', '1', '0', 'admin', '2020-12-22 05:12:08', '', '2020-12-22 05:17:11', '2020-12-22 06:17:11'),
(16, '', '1', 'en', '/profile/upload/chapter/16/2020-12-22/file20201222051447.000.jpg,/profile/upload/chapter/16/2020-12-22/file20201222051447.001.jpg,/profile/upload/chapter/16/2020-12-22/file20201222051448.002.jpg,/profile/upload/chapter/16/2020-12-22/file20201222051448.003.jpg,/profile/upload/chapter/16/2020-12-22/file20201222051448.004.jpg,/profile/upload/chapter/16/2020-12-22/file20201222051448.005.jpg,/profile/upload/chapter/16/2020-12-22/file20201222051448.006.jpg,/profile/upload/chapter/16/2020-12-22/file20201222051449.007.jpg,/profile/upload/chapter/16/2020-12-22/file20201222051449.008009.jpg,/profile/upload/chapter/16/2020-12-22/file20201222051449.010.jpg,/profile/upload/chapter/16/2020-12-22/file20201222051449.011.jpg,/profile/upload/chapter/16/2020-12-22/file20201222051450.012.jpg,/profile/upload/chapter/16/2020-12-22/file20201222051450.013.jpg,/profile/upload/chapter/16/2020-12-22/file20201222051450.014.jpg,/profile/upload/chapter/16/2020-12-22/file20201222051450.015.jpg,/profile/upload/chapter/16/2020-12-22/file20201222051451.016.jpg,/profile/upload/chapter/16/2020-12-22/file20201222051451.017.jpg,/profile/upload/chapter/16/2020-12-22/file20201222051451.018.jpg,/profile/upload/chapter/16/2020-12-22/file20201222051451.019.jpg,/profile/upload/chapter/16/2020-12-22/file20201222051451.020.jpg,/profile/upload/chapter/16/2020-12-22/file20201222051452.021.jpg,/profile/upload/chapter/16/2020-12-22/file20201222051452.022.jpg,/profile/upload/chapter/16/2020-12-22/file20201222051452.023.jpg,/profile/upload/chapter/16/2020-12-22/file20201222051452.024.jpg,/profile/upload/chapter/16/2020-12-22/file20201222051452.025.jpg,/profile/upload/chapter/16/2020-12-22/file20201222051453.026.jpg', '773,774,775,776,777,778,779,780,781,782,783,784,785,786,787,788,789,790,791,792,793,794,795,796,797,798', 10, 0, 0, '', '1', '0', 'admin', '2020-12-22 05:13:52', '', '2020-12-22 05:17:25', '2020-12-22 06:17:25'),
(17, '', '1', 'en', '/profile/upload/chapter/17/2020-12-22/file20201222051545.0001.jpg,/profile/upload/chapter/17/2020-12-22/file20201222051546.0002.jpg,/profile/upload/chapter/17/2020-12-22/file20201222051546.0003.jpg,/profile/upload/chapter/17/2020-12-22/file20201222051546.0004.jpg,/profile/upload/chapter/17/2020-12-22/file20201222051546.0005.jpg,/profile/upload/chapter/17/2020-12-22/file20201222051546.0011.jpg,/profile/upload/chapter/17/2020-12-22/file20201222051547.0012.jpg,/profile/upload/chapter/17/2020-12-22/file20201222051547.002003.jpg,/profile/upload/chapter/17/2020-12-22/file20201222051547.004.jpg,/profile/upload/chapter/17/2020-12-22/file20201222051547.005.jpg,/profile/upload/chapter/17/2020-12-22/file20201222051547.006.jpg,/profile/upload/chapter/17/2020-12-22/file20201222051548.007.jpg,/profile/upload/chapter/17/2020-12-22/file20201222051548.008009.jpg,/profile/upload/chapter/17/2020-12-22/file20201222051548.010.jpg,/profile/upload/chapter/17/2020-12-22/file20201222051548.011.jpg,/profile/upload/chapter/17/2020-12-22/file20201222051549.012.jpg,/profile/upload/chapter/17/2020-12-22/file20201222051549.013.jpg,/profile/upload/chapter/17/2020-12-22/file20201222051549.014015.jpg,/profile/upload/chapter/17/2020-12-22/file20201222051549.016.jpg,/profile/upload/chapter/17/2020-12-22/file20201222051549.017.jpg,/profile/upload/chapter/17/2020-12-22/file20201222051550.018.jpg,/profile/upload/chapter/17/2020-12-22/file20201222051550.019.jpg,/profile/upload/chapter/17/2020-12-22/file20201222051550.020.jpg,/profile/upload/chapter/17/2020-12-22/file20201222051550.021.jpg,/profile/upload/chapter/17/2020-12-22/file20201222051550.022.jpg,/profile/upload/chapter/17/2020-12-22/file20201222051551.023.jpg,/profile/upload/chapter/17/2020-12-22/file20201222051551.024.jpg', '799,800,801,802,803,804,805,806,807,808,809,810,811,812,813,814,815,816,817,818,819,820,821,822,823,824,825', 11, 0, 0, '', '1', '0', 'admin', '2020-12-22 05:15:13', '', '2020-12-22 05:18:12', '2020-12-22 06:18:12'),
(18, '', '1', 'en', '/profile/upload/chapter/18/2020-12-22/file20201222051643.0001.jpg,/profile/upload/chapter/18/2020-12-22/file20201222051643.0002.jpg,/profile/upload/chapter/18/2020-12-22/file20201222051643.0011.jpg,/profile/upload/chapter/18/2020-12-22/file20201222051643.0012.jpg,/profile/upload/chapter/18/2020-12-22/file20201222051644.0013.jpg,/profile/upload/chapter/18/2020-12-22/file20201222051644.0014.jpg,/profile/upload/chapter/18/2020-12-22/file20201222051644.002.jpg,/profile/upload/chapter/18/2020-12-22/file20201222051644.003.jpg,/profile/upload/chapter/18/2020-12-22/file20201222051645.004.jpg,/profile/upload/chapter/18/2020-12-22/file20201222051645.005.jpg,/profile/upload/chapter/18/2020-12-22/file20201222051645.006.jpg,/profile/upload/chapter/18/2020-12-22/file20201222051645.007.jpg,/profile/upload/chapter/18/2020-12-22/file20201222051645.008009.jpg,/profile/upload/chapter/18/2020-12-22/file20201222051646.010.jpg,/profile/upload/chapter/18/2020-12-22/file20201222051646.011.jpg,/profile/upload/chapter/18/2020-12-22/file20201222051646.012.jpg,/profile/upload/chapter/18/2020-12-22/file20201222051647.013.jpg,/profile/upload/chapter/18/2020-12-22/file20201222051647.014.jpg,/profile/upload/chapter/18/2020-12-22/file20201222051647.015.jpg,/profile/upload/chapter/18/2020-12-22/file20201222051647.016.jpg,/profile/upload/chapter/18/2020-12-22/file20201222051647.017.jpg,/profile/upload/chapter/18/2020-12-22/file20201222051648.018.jpg,/profile/upload/chapter/18/2020-12-22/file20201222051648.019.jpg,/profile/upload/chapter/18/2020-12-22/file20201222051648.020.jpg,/profile/upload/chapter/18/2020-12-22/file20201222051648.021.jpg,/profile/upload/chapter/18/2020-12-22/file20201222051649.022.jpg,/profile/upload/chapter/18/2020-12-22/file20201222051649.023.jpg', '826,827,828,829,830,831,832,833,834,835,836,837,838,839,840,841,842,843,844,845,846,847,848,849,850,851,852', 12, 0, 0, '', '1', '0', 'admin', '2020-12-22 05:16:09', '', '2020-12-22 05:17:36', '2020-12-22 06:17:36');

-- --------------------------------------------------------

--
-- Table structure for table `qrtz_blob_triggers`
--

CREATE TABLE `qrtz_blob_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `blob_data` blob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `qrtz_calendars`
--

CREATE TABLE `qrtz_calendars` (
  `sched_name` varchar(120) NOT NULL,
  `calendar_name` varchar(200) NOT NULL,
  `calendar` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `qrtz_cron_triggers`
--

CREATE TABLE `qrtz_cron_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `cron_expression` varchar(200) NOT NULL,
  `time_zone_id` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `qrtz_cron_triggers`
--

INSERT INTO `qrtz_cron_triggers` (`sched_name`, `trigger_name`, `trigger_group`, `cron_expression`, `time_zone_id`) VALUES
('SmangaScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', '0/10 * * * * ?', 'Asia/Bangkok'),
('SmangaScheduler', 'TASK_CLASS_NAME100', 'DEFAULT', '0/10 * * * * ?', 'Asia/Bangkok'),
('SmangaScheduler', 'TASK_CLASS_NAME101', 'DEFAULT', '0/10 * * * * ?', 'Asia/Bangkok'),
('SmangaScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', '0/15 * * * * ?', 'Asia/Bangkok'),
('SmangaScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', '0/20 * * * * ?', 'Asia/Bangkok');

-- --------------------------------------------------------

--
-- Table structure for table `qrtz_fired_triggers`
--

CREATE TABLE `qrtz_fired_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `entry_id` varchar(95) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `instance_name` varchar(200) NOT NULL,
  `fired_time` bigint(13) NOT NULL,
  `sched_time` bigint(13) NOT NULL,
  `priority` int(11) NOT NULL,
  `state` varchar(16) NOT NULL,
  `job_name` varchar(200) DEFAULT NULL,
  `job_group` varchar(200) DEFAULT NULL,
  `is_nonconcurrent` varchar(1) DEFAULT NULL,
  `requests_recovery` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `qrtz_job_details`
--

CREATE TABLE `qrtz_job_details` (
  `sched_name` varchar(120) NOT NULL,
  `job_name` varchar(200) NOT NULL,
  `job_group` varchar(200) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `job_class_name` varchar(250) NOT NULL,
  `is_durable` varchar(1) NOT NULL,
  `is_nonconcurrent` varchar(1) NOT NULL,
  `is_update_data` varchar(1) NOT NULL,
  `requests_recovery` varchar(1) NOT NULL,
  `job_data` blob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `qrtz_job_details`
--

INSERT INTO `qrtz_job_details` (`sched_name`, `job_name`, `job_group`, `description`, `job_class_name`, `is_durable`, `is_nonconcurrent`, `is_update_data`, `requests_recovery`, `job_data`) VALUES
('SmangaScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 'com.smanga.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xaced0005737200156f72672e71756172747a2e4a6f62446174614d61709fb083e8bfa9b0cb020000787200266f72672e71756172747a2e7574696c732e537472696e674b65794469727479466c61674d61708208e8c3fbc55d280200015a0013616c6c6f77735472616e7369656e74446174617872001d6f72672e71756172747a2e7574696c732e4469727479466c61674d617013e62ead28760ace0200025a000564697274794c00036d617074000f4c6a6176612f7574696c2f4d61703b787001737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f4000000000000c7708000000100000000174000f5441534b5f50524f504552544945537372001f636f6d2e736d616e67612e71756172747a2e646f6d61696e2e5379734a6f6200000000000000010200084c000a636f6e63757272656e747400124c6a6176612f6c616e672f537472696e673b4c000e63726f6e45787072657373696f6e71007e00094c000c696e766f6b6554617267657471007e00094c00086a6f6247726f757071007e00094c00056a6f6249647400104c6a6176612f6c616e672f4c6f6e673b4c00076a6f624e616d6571007e00094c000d6d697366697265506f6c69637971007e00094c000673746174757371007e000978720028636f6d2e736d616e67612e636f6d6d6f6e2e636f72652e646f6d61696e2e42617365456e7469747900000000000000010200074c0008637265617465427971007e00094c000a63726561746554696d657400104c6a6176612f7574696c2f446174653b4c0006706172616d7371007e00034c000672656d61726b71007e00094c000b73656172636856616c756571007e00094c0008757064617465427971007e00094c000a75706461746554696d6571007e000c787074000561646d696e7372000e6a6176612e7574696c2e44617465686a81014b5974190300007870770800000176000c70c078707400007070707400013174000e302f3130202a202a202a202a203f740019736d616e67615461736b2e736d616e67614e6f506172616d7374000744454641554c547372000e6a6176612e6c616e672e4c6f6e673b8be490cc8f23df0200014a000576616c7565787200106a6176612e6c616e672e4e756d62657286ac951d0b94e08b0200007870000000000000000174001e53797374656d2064656661756c7420286e6f20706172616d65746572732974000133740001317800),
('SmangaScheduler', 'TASK_CLASS_NAME100', 'DEFAULT', NULL, 'com.smanga.quartz.util.QuartzJobExecution', '0', '0', '0', '0', 0xaced0005737200156f72672e71756172747a2e4a6f62446174614d61709fb083e8bfa9b0cb020000787200266f72672e71756172747a2e7574696c732e537472696e674b65794469727479466c61674d61708208e8c3fbc55d280200015a0013616c6c6f77735472616e7369656e74446174617872001d6f72672e71756172747a2e7574696c732e4469727479466c61674d617013e62ead28760ace0200025a000564697274794c00036d617074000f4c6a6176612f7574696c2f4d61703b787001737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f4000000000000c7708000000100000000174000f5441534b5f50524f504552544945537372001f636f6d2e736d616e67612e71756172747a2e646f6d61696e2e5379734a6f6200000000000000010200084c000a636f6e63757272656e747400124c6a6176612f6c616e672f537472696e673b4c000e63726f6e45787072657373696f6e71007e00094c000c696e766f6b6554617267657471007e00094c00086a6f6247726f757071007e00094c00056a6f6249647400104c6a6176612f6c616e672f4c6f6e673b4c00076a6f624e616d6571007e00094c000d6d697366697265506f6c69637971007e00094c000673746174757371007e000978720028636f6d2e736d616e67612e636f6d6d6f6e2e636f72652e646f6d61696e2e42617365456e7469747900000000000000010200074c0008637265617465427971007e00094c000a63726561746554696d657400104c6a6176612f7574696c2f446174653b4c0006706172616d7371007e00034c000672656d61726b71007e00094c000b73656172636856616c756571007e00094c0008757064617465427971007e00094c000a75706461746554696d6571007e000c787074000561646d696e7372000e6a6176612e7574696c2e44617465686a81014b5974190300007870770800000176803b4a5078707400007070707400013074000e302f3130202a202a202a202a203f74002c7265636f6d6d656e646174696f6e5461736b2e70726564696374526174696e674d616e6761466f725573657274000744454641554c547372000e6a6176612e6c616e672e4c6f6e673b8be490cc8f23df0200014a000576616c7565787200106a6176612e6c616e672e4e756d62657286ac951d0b94e08b020000787000000000000000647400175072656469637420726174696e6720666f72207573657274000132740001317800),
('SmangaScheduler', 'TASK_CLASS_NAME101', 'DEFAULT', NULL, 'com.smanga.quartz.util.QuartzJobExecution', '0', '0', '0', '0', 0xaced0005737200156f72672e71756172747a2e4a6f62446174614d61709fb083e8bfa9b0cb020000787200266f72672e71756172747a2e7574696c732e537472696e674b65794469727479466c61674d61708208e8c3fbc55d280200015a0013616c6c6f77735472616e7369656e74446174617872001d6f72672e71756172747a2e7574696c732e4469727479466c61674d617013e62ead28760ace0200025a000564697274794c00036d617074000f4c6a6176612f7574696c2f4d61703b787001737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f4000000000000c7708000000100000000174000f5441534b5f50524f504552544945537372001f636f6d2e736d616e67612e71756172747a2e646f6d61696e2e5379734a6f6200000000000000010200084c000a636f6e63757272656e747400124c6a6176612f6c616e672f537472696e673b4c000e63726f6e45787072657373696f6e71007e00094c000c696e766f6b6554617267657471007e00094c00086a6f6247726f757071007e00094c00056a6f6249647400104c6a6176612f6c616e672f4c6f6e673b4c00076a6f624e616d6571007e00094c000d6d697366697265506f6c69637971007e00094c000673746174757371007e000978720028636f6d2e736d616e67612e636f6d6d6f6e2e636f72652e646f6d61696e2e42617365456e7469747900000000000000010200074c0008637265617465427971007e00094c000a63726561746554696d657400104c6a6176612f7574696c2f446174653b4c0006706172616d7371007e00034c000672656d61726b71007e00094c000b73656172636856616c756571007e00094c0008757064617465427971007e00094c000a75706461746554696d6571007e000c787074000561646d696e7372000e6a6176612e7574696c2e44617465686a81014b59741903000078707708000001768287f58878707400007070707400013074000e302f3130202a202a202a202a203f740018736c6f70654f6e655461736b2e736c6f70654f6e6528332974000744454641554c547372000e6a6176612e6c616e672e4c6f6e673b8be490cc8f23df0200014a000576616c7565787200106a6176612e6c616e672e4e756d62657286ac951d0b94e08b0200007870000000000000006574000e536c6f7065206f6e65207461736b74000132740001317800),
('SmangaScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 'com.smanga.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xaced0005737200156f72672e71756172747a2e4a6f62446174614d61709fb083e8bfa9b0cb020000787200266f72672e71756172747a2e7574696c732e537472696e674b65794469727479466c61674d61708208e8c3fbc55d280200015a0013616c6c6f77735472616e7369656e74446174617872001d6f72672e71756172747a2e7574696c732e4469727479466c61674d617013e62ead28760ace0200025a000564697274794c00036d617074000f4c6a6176612f7574696c2f4d61703b787001737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f4000000000000c7708000000100000000174000f5441534b5f50524f504552544945537372001f636f6d2e736d616e67612e71756172747a2e646f6d61696e2e5379734a6f6200000000000000010200084c000a636f6e63757272656e747400124c6a6176612f6c616e672f537472696e673b4c000e63726f6e45787072657373696f6e71007e00094c000c696e766f6b6554617267657471007e00094c00086a6f6247726f757071007e00094c00056a6f6249647400104c6a6176612f6c616e672f4c6f6e673b4c00076a6f624e616d6571007e00094c000d6d697366697265506f6c69637971007e00094c000673746174757371007e000978720028636f6d2e736d616e67612e636f6d6d6f6e2e636f72652e646f6d61696e2e42617365456e7469747900000000000000010200074c0008637265617465427971007e00094c000a63726561746554696d657400104c6a6176612f7574696c2f446174653b4c0006706172616d7371007e00034c000672656d61726b71007e00094c000b73656172636856616c756571007e00094c0008757064617465427971007e00094c000a75706461746554696d6571007e000c787074000561646d696e7372000e6a6176612e7574696c2e44617465686a81014b5974190300007870770800000176000c70c078707400007070707400013174000e302f3135202a202a202a202a203f740021736d616e67615461736b2e736d616e6761506172616d732827736d616e6761272974000744454641554c547372000e6a6176612e6c616e672e4c6f6e673b8be490cc8f23df0200014a000576616c7565787200106a6176612e6c616e672e4e756d62657286ac951d0b94e08b0200007870000000000000000274002053797374656d2064656661756c7420287769746820706172616d65746572732974000133740001317800),
('SmangaScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 'com.smanga.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xaced0005737200156f72672e71756172747a2e4a6f62446174614d61709fb083e8bfa9b0cb020000787200266f72672e71756172747a2e7574696c732e537472696e674b65794469727479466c61674d61708208e8c3fbc55d280200015a0013616c6c6f77735472616e7369656e74446174617872001d6f72672e71756172747a2e7574696c732e4469727479466c61674d617013e62ead28760ace0200025a000564697274794c00036d617074000f4c6a6176612f7574696c2f4d61703b787001737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f4000000000000c7708000000100000000174000f5441534b5f50524f504552544945537372001f636f6d2e736d616e67612e71756172747a2e646f6d61696e2e5379734a6f6200000000000000010200084c000a636f6e63757272656e747400124c6a6176612f6c616e672f537472696e673b4c000e63726f6e45787072657373696f6e71007e00094c000c696e766f6b6554617267657471007e00094c00086a6f6247726f757071007e00094c00056a6f6249647400104c6a6176612f6c616e672f4c6f6e673b4c00076a6f624e616d6571007e00094c000d6d697366697265506f6c69637971007e00094c000673746174757371007e000978720028636f6d2e736d616e67612e636f6d6d6f6e2e636f72652e646f6d61696e2e42617365456e7469747900000000000000010200074c0008637265617465427971007e00094c000a63726561746554696d657400104c6a6176612f7574696c2f446174653b4c0006706172616d7371007e00034c000672656d61726b71007e00094c000b73656172636856616c756571007e00094c0008757064617465427971007e00094c000a75706461746554696d6571007e000c787074000561646d696e7372000e6a6176612e7574696c2e44617465686a81014b5974190300007870770800000176000c70c078707400007070707400013174000e302f3230202a202a202a202a203f740044736d616e67615461736b2e736d616e67614d756c7469706c65506172616d732827736d616e6761272c20747275652c20323030304c2c203331362e3530442c203130302974000744454641554c547372000e6a6176612e6c616e672e4c6f6e673b8be490cc8f23df0200014a000576616c7565787200106a6176612e6c616e672e4e756d62657286ac951d0b94e08b0200007870000000000000000374002453797374656d2064656661756c7420286d756c7469706c6520706172616d65746572732974000133740001317800);

-- --------------------------------------------------------

--
-- Table structure for table `qrtz_locks`
--

CREATE TABLE `qrtz_locks` (
  `sched_name` varchar(120) NOT NULL,
  `lock_name` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `qrtz_locks`
--

INSERT INTO `qrtz_locks` (`sched_name`, `lock_name`) VALUES
('SmangaScheduler', 'STATE_ACCESS'),
('SmangaScheduler', 'TRIGGER_ACCESS');

-- --------------------------------------------------------

--
-- Table structure for table `qrtz_paused_trigger_grps`
--

CREATE TABLE `qrtz_paused_trigger_grps` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_group` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `qrtz_scheduler_state`
--

CREATE TABLE `qrtz_scheduler_state` (
  `sched_name` varchar(120) NOT NULL,
  `instance_name` varchar(200) NOT NULL,
  `last_checkin_time` bigint(13) NOT NULL,
  `checkin_interval` bigint(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `qrtz_scheduler_state`
--

INSERT INTO `qrtz_scheduler_state` (`sched_name`, `instance_name`, `last_checkin_time`, `checkin_interval`) VALUES
('SmangaScheduler', 'DESKTOP-FKPETVD1608593407955', 1608593426905, 15000);

-- --------------------------------------------------------

--
-- Table structure for table `qrtz_simple_triggers`
--

CREATE TABLE `qrtz_simple_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `repeat_count` bigint(7) NOT NULL,
  `repeat_interval` bigint(12) NOT NULL,
  `times_triggered` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `qrtz_simprop_triggers`
--

CREATE TABLE `qrtz_simprop_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `str_prop_1` varchar(512) DEFAULT NULL,
  `str_prop_2` varchar(512) DEFAULT NULL,
  `str_prop_3` varchar(512) DEFAULT NULL,
  `int_prop_1` int(11) DEFAULT NULL,
  `int_prop_2` int(11) DEFAULT NULL,
  `long_prop_1` bigint(20) DEFAULT NULL,
  `long_prop_2` bigint(20) DEFAULT NULL,
  `dec_prop_1` decimal(13,4) DEFAULT NULL,
  `dec_prop_2` decimal(13,4) DEFAULT NULL,
  `bool_prop_1` varchar(1) DEFAULT NULL,
  `bool_prop_2` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `qrtz_triggers`
--

CREATE TABLE `qrtz_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `job_name` varchar(200) NOT NULL,
  `job_group` varchar(200) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `next_fire_time` bigint(13) DEFAULT NULL,
  `prev_fire_time` bigint(13) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `trigger_state` varchar(16) NOT NULL,
  `trigger_type` varchar(8) NOT NULL,
  `start_time` bigint(13) NOT NULL,
  `end_time` bigint(13) DEFAULT NULL,
  `calendar_name` varchar(200) DEFAULT NULL,
  `misfire_instr` smallint(2) DEFAULT NULL,
  `job_data` blob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `qrtz_triggers`
--

INSERT INTO `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`, `job_name`, `job_group`, `description`, `next_fire_time`, `prev_fire_time`, `priority`, `trigger_state`, `trigger_type`, `start_time`, `end_time`, `calendar_name`, `misfire_instr`, `job_data`) VALUES
('SmangaScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 1608593410000, -1, 5, 'PAUSED', 'CRON', 1608593408000, 0, NULL, 2, ''),
('SmangaScheduler', 'TASK_CLASS_NAME100', 'DEFAULT', 'TASK_CLASS_NAME100', 'DEFAULT', NULL, 1608593410000, -1, 5, 'PAUSED', 'CRON', 1608593408000, 0, NULL, 1, ''),
('SmangaScheduler', 'TASK_CLASS_NAME101', 'DEFAULT', 'TASK_CLASS_NAME101', 'DEFAULT', NULL, 1608593410000, -1, 5, 'PAUSED', 'CRON', 1608593409000, 0, NULL, 1, ''),
('SmangaScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 1608593415000, -1, 5, 'PAUSED', 'CRON', 1608593408000, 0, NULL, 2, ''),
('SmangaScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 1608593420000, -1, 5, 'PAUSED', 'CRON', 1608593408000, 0, NULL, 2, '');

-- --------------------------------------------------------

--
-- Table structure for table `recommend_manga`
--

CREATE TABLE `recommend_manga` (
  `id` bigint(20) NOT NULL COMMENT 'Serial index',
  `user_id` bigint(20) NOT NULL COMMENT 'User id',
  `manga_id` bigint(20) NOT NULL COMMENT 'Manga id',
  `is_recommend` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: is not recommend, 1: is recommend',
  `create_by` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT 'Creator',
  `create_time` datetime DEFAULT NULL COMMENT 'Create time',
  `update_by` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT 'Updator',
  `update_time` datetime DEFAULT NULL COMMENT 'Update time',
  `rating` float DEFAULT NULL COMMENT 'Rating predict'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='List manga rating predict by system';

--
-- Dumping data for table `recommend_manga`
--

INSERT INTO `recommend_manga` (`id`, `user_id`, `manga_id`, `is_recommend`, `create_by`, `create_time`, `update_by`, `update_time`, `rating`) VALUES
(1, 6, 4, 1, NULL, '2020-12-22 05:44:22', NULL, NULL, 4.42857),
(2, 6, 9, 1, NULL, '2020-12-22 05:44:22', NULL, NULL, 1),
(3, 2, 12, 1, NULL, '2020-12-22 05:44:22', NULL, NULL, 2.28571),
(4, 2, 6, 1, NULL, '2020-12-22 05:44:22', NULL, NULL, 2.85714),
(5, 2, 10, 1, NULL, '2020-12-22 05:44:23', NULL, NULL, 2.66667),
(6, 3, 11, 1, NULL, '2020-12-22 05:44:23', NULL, NULL, 1.53846),
(7, 3, 4, 1, NULL, '2020-12-22 05:44:23', NULL, NULL, 4.61905),
(8, 3, 5, 1, NULL, '2020-12-22 05:44:23', NULL, NULL, 3.76923),
(9, 4, 12, 1, NULL, '2020-12-22 05:44:23', NULL, NULL, 2.75862),
(10, 4, 6, 1, NULL, '2020-12-22 05:44:23', NULL, NULL, 3.03448),
(11, 5, 11, 1, NULL, '2020-12-22 05:44:23', NULL, NULL, 1.42857),
(12, 5, 5, 1, NULL, '2020-12-22 05:44:23', NULL, NULL, 3.57143),
(13, 5, 9, 1, NULL, '2020-12-22 05:44:23', NULL, NULL, 1.20513),
(14, 5, 10, 1, NULL, '2020-12-22 05:44:23', NULL, NULL, 3.16667);

-- --------------------------------------------------------

--
-- Table structure for table `sys_config`
--

CREATE TABLE `sys_config` (
  `config_id` int(5) NOT NULL COMMENT 'Parameter primary key',
  `config_name` varchar(100) DEFAULT '' COMMENT 'Parameter name',
  `config_key` varchar(100) DEFAULT '' COMMENT 'Parameter key name',
  `config_value` varchar(3000) DEFAULT NULL COMMENT 'Parameter key value',
  `config_type` char(1) DEFAULT 'N' COMMENT 'Built-in system (Y Yes N No)',
  `create_by` varchar(64) DEFAULT '' COMMENT 'Creator',
  `create_time` datetime DEFAULT NULL COMMENT 'Creation time',
  `update_by` varchar(64) DEFAULT '' COMMENT 'Updater',
  `update_time` datetime DEFAULT NULL COMMENT 'Update time',
  `remark` varchar(500) DEFAULT NULL COMMENT 'Remarks'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Parameter configuration table';

--
-- Dumping data for table `sys_config`
--

INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
(1, 'Main frame page-default skin style name', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2020-11-25 23:36:23', '', NULL, 'Blue skin-blue、Green skin-green、Purple skin-purple、Red skin-red、Yellow skin-yellow'),
(2, 'User Management-Account Initial Password', 'sys.user.initPassword', '123456', 'Y', 'admin', '2020-11-25 23:36:23', '', NULL, 'Initialization password 123456'),
(3, 'Main frame page-sidebar theme', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2020-11-25 23:36:23', '', NULL, 'Dark theme theme-dark，Light theme theme-light, dark blue theme theme-blue'),
(4, 'Account self-service-whether to enable the user registration function', 'sys.account.registerUser', 'false', 'Y', 'admin', '2020-11-25 23:36:23', '', NULL, 'Whether to enable the registered user function (true to enable, false to disable)'),
(5, 'User Management-Password Character Range', 'sys.account.chrtype', '0', 'Y', 'admin', '2020-11-25 23:36:23', '', NULL, 'The default range of arbitrary characters, 0 arbitrary (password can enter any character), 1 number (password can only be 0-9 numbers), 2 English letters (password can only be az and AZ letters), 3 letters and numbers (password must contain Letters, numbers), 4 alphanumerics and special characters (currently supported special characters include: ~!@#$%^&*()-=_+)'),
(6, 'User Management-Initial Password Change Policy', 'sys.account.initPasswordModify', '0', 'Y', 'admin', '2020-11-25 23:36:23', '', NULL, '0: The initial password modification policy is closed without any prompt, 1: Remind the user, if the initial password is not modified, the password modification dialog box will be reminded when logging in'),
(7, 'User management-account password update cycle', 'sys.account.passwordValidateDays', '0', 'Y', 'admin', '2020-11-25 23:36:23', '', NULL, 'Password update cycle (fill in the number, the initial value of the data is 0 is not limited, if the modification must be a positive integer greater than 0 and less than 365), if it exceeds this cycle to log in to the system, the password modification dialog box will be reminded when logging in'),
(8, 'Main frame page-menu navigation display style', 'sys.index.menuStyle', 'default', 'Y', 'admin', '2020-11-25 23:36:23', '', NULL, 'Menu navigation display style (default is the left navigation menu, topnav is the top navigation menu)'),
(9, 'Main frame page-whether to open the footer', 'sys.index.ignoreFooter', 'true', 'Y', 'admin', '2020-11-25 23:36:23', '', NULL, 'Whether to enable the bottom footer display (true display, false hide)'),
(100, 'Google Service Account', 'google.service.account', '{   \"type\": \"service_account\",   \"project_id\": \"smangaspringcloudvision\",   \"private_key_id\": \"6e45eaf956a92997dcb84a0a01c33f1464bfbefa\",   \"private_key\": \"-----BEGIN PRIVATE KEY-----\\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQDU5PQIzoyu+uF5\\n0gQVKRVSXita8cGoAl2PfNQleqBE/zQs5ImscqHvxKi66m1uuFa0FSiGh5sSrZzR\\nDJjYUPOys73w16x5BCIT54wJR0cR+vmgqGOmO8bxBnUGZWlNlgBZ0zluFnZQ6iJz\\nn2KhVWznIF1IHd3RCVehWRbCOtLKLCVz/vzbauZGPYclAMrHXMPniamUz4/kgAnS\\n8/EZdX920BcrbIzD+blpQhF1e6otsFF63BbkVM6Oa4auDPU3q19Oy42qCby0Zjl4\\nG6Tc0vPNFn6sHX3IOKgcmeu0sDI6CSPvDNxARvY0s92g1Rtq2Va6T4eQN1HmgeUi\\nVDgV8CoRAgMBAAECggEADBI/VBCCIZnQFxw1Zw3BS75TLwDuPhyEOZKWZNmjJMZj\\nqvf6ZnDJhdLczlxkgBars+JPPfGKdXCqp5/TOtC8QLG4X2ObP/FgDUjfw9bqzLYy\\nWU2y+MYC7b+z+vzdD60lr/IuG3PimYvtEClFamhxmFlZcLFg1m11LozioXi8YwIr\\nS5qO92Yrbn9xxzFXrCITLuWPnra0VLY/TixOTYtgtsStlk1JIJ1x8DzbrRMcCNMA\\nr8/1bPFyXjSfs4YpatrZIhtnsqX8VtQlIcGz33a9KXiMIr5N4mR2BTIVozQo77lb\\nx6vRdH9M0oEjum3QCXRfGlpWcgVMI5PiYlXMvxxqkQKBgQD1YJ+ybKxMA9k9ZXrW\\n++pYsxgsWsAiF+c1eClyAOIT78ucR5uEXkhQEz7kI4TfRVDZQq3NUJ4kKSxDeoJt\\nYg+Tj3p2ONZmQxrXqjPh7fGIh7TLwqcYHxDwXUmxeUi7swuTm3JHy2YUABmYBPVT\\n9tThnQXT3sMZi/HeukOmkkcXPwKBgQDeHFaSOGFEPK6r8XYMN+Y0Bl9ncC+8YB9N\\n2ZPm20jcowd8nRLuo4SYEO2wWyQvN81Q5TD1MSOPsIu8/a12Z10+UQ26tfnQdjil\\ndlscaVO8RdCkFI7hEOGyHzPstaGY+x7w+p+88WHB1w0HXGNUUUSgMMD3dR95DSCP\\nwraFmi06rwKBgQDOuxRw78wN0yRA7PGclOtwxZr1K5Q6ZScfzlgku4e9wkcqKM5m\\nrESCamSPMzmsHisqkFn75BMIZkPrqhie7YIwES7c0bAYwiqoTradf6oCHEt/bET5\\nNps/12jSBFv5/7QeLVYQFNawvRDTGkJS9l+OoYuaYFDBgj1KKGX8vbr1YwKBgFhE\\n0M7JYzZYG16v1ici6/SO98lG12G4nZg1uMaNLRaqH6aRUd3O1DoOuDdW8TlmpszY\\nWK2IusY29kHEWvRsPa0vTxJ9kWscIIT5VVokLafr4u/iT6n4KIm+Rsdyo2cFnZVN\\nNMBE+YGscjwTplHy/h/fYEC3pitYYTFgw2KzE/h3AoGBANNf4eCeSjR7xmLLwOA3\\nyDUdqbcNHH5JnBHDaMtwqKeH92r3m/k198/vqSTVa6a5uckbvw4uMmRbd9c67ZLM\\nUVw7RhdBTBtZoH7jXwLp+OKtvNzzehJyrXIYdr2qF4tvU4+YY5YqdIJUX0NQJ6SC\\nJW+sxzBOuftn2fwFuhKt2k/x\\n-----END PRIVATE KEY-----\\n\",   \"client_email\": \"smangawebapplication@smangaspringcloudvision.iam.gserviceaccount.com\",   \"client_id\": \"104448715830187964443\",   \"auth_uri\": \"https://accounts.google.com/o/oauth2/auth\",   \"token_uri\": \"https://oauth2.googleapis.com/token\",   \"auth_provider_x509_cert_url\": \"https://www.googleapis.com/oauth2/v1/certs\",   \"client_x509_cert_url\": \"https://www.googleapis.com/robot/v1/metadata/x509/smangawebapplication%40smangaspringcloudvision.iam.gserviceaccount.com\" }', 'Y', 'admin', '2020-12-03 01:37:44', '', NULL, NULL),
(101, 'Photo editor sdk license', 'photo.editor.license', '{\"api_token\":\"Ie0ritI-Ichtan7hXjz5uw\",\"app_identifiers\":[\"localhost\"],\"available_actions\":[],\"domains\":[\"https://api.photoeditorsdk.com\"],\"enterprise_license\":false,\"expires_at\":1609804800,\"features\":[\"camera\",\"library\",\"export\",\"customassets\",\"whitelabel\",\"focus\",\"textdesign\",\"transform\",\"brush\",\"text\",\"frame\",\"overlay\",\"sticker\",\"adjustment\",\"filter\"],\"issued_at\":1607272596,\"minimum_sdk_version\":\"1.0\",\"owner\":\"Hieu Nguyen\",\"platform\":\"HTML5\",\"products\":[\"pesdk\"],\"version\":\"2.4\",\"signature\":\"NMwyRWJYDL+WTMHeGeLmVT/JQE5+B+IYfc0+lV9Hs73BwPuWrOtcuXncHQONBTwF8vhUS0buNYt5lffARdRLDOJ+dbcVLAje7HZAOCw1GpwoJKTuNmdK5vd4Eg2Olrel2XW0zcJ87uHZIFvvas0vWjq6k9yaiFD8xv44IoiqGOgz1+UmO4VcaEkl2fNgtGsaBwpNBQhOE9xQpIrfr2CSVl51mk/mrJaQFwnO8noLGZg3Lxiizurk45NtTJB8edUoTo6PN5CoVR/daArdhPFDuA7KB4QyvVKuucpRmWIGQEPOmEHOUCBGuXOvgful+Dd80r7ci/XW2nFOCFrlEtRL7Yz7GnS30bEDWLGktJHv0Sc0QP1mNt6y+1Je37McIErSCQoocJDPvNqbvjKcBdLuLl8aRmyIyuTOKX2UWYkLOfjYpo5gtG9gyNi/vC4ZXh1ubg+txuCIqYBhpdWS5vyViUZVceuugg6mqd0aTMKeMDbbRvDr8JEQISy596va9NE10X5MDhKxz8ZSvjbTx3ind1PA3Nu9eWba1oagOcZeEsNzwfxaETj6L50/BSo4YzzUu92jvI8DyO/kkLIVmRc7Hn1yzy8lPi0zqigOI1kq+PcFCWhsN7nSRegUFSEM17m19npNXAFRiVjKOsx19h9WFKeX7Dr0UAoFHucYDg0XMe0=\"}', 'Y', 'admin', '2020-12-07 01:03:01', '', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sys_dept`
--

CREATE TABLE `sys_dept` (
  `dept_id` bigint(20) NOT NULL COMMENT 'Department id',
  `parent_id` bigint(20) DEFAULT 0 COMMENT 'Parent department id',
  `ancestors` varchar(50) DEFAULT '' COMMENT 'Ancestor list',
  `dept_name` varchar(30) DEFAULT '' COMMENT 'Department name',
  `order_num` int(4) DEFAULT 0 COMMENT 'Display order',
  `leader` varchar(20) DEFAULT NULL COMMENT 'Principal',
  `phone` varchar(11) DEFAULT NULL COMMENT 'Contact number',
  `email` varchar(50) DEFAULT NULL COMMENT 'Mailbox',
  `status` char(1) DEFAULT '0' COMMENT 'Department status (0 normal 1 disabled)',
  `del_flag` char(1) DEFAULT '0' COMMENT 'Delete flag (0 means existence 2 means deletion)',
  `create_by` varchar(64) DEFAULT '' COMMENT 'Creator',
  `create_time` datetime DEFAULT NULL COMMENT 'Creation time',
  `update_by` varchar(64) DEFAULT '' COMMENT 'Updater',
  `update_time` datetime DEFAULT NULL COMMENT 'Update time'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Department table';

--
-- Dumping data for table `sys_dept`
--

INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES
(100, 0, '0', 'Smanga Technology', 0, 'Smanga', '15888888888', 'smanga@mail.com', '0', '0', 'admin', '2020-11-25 23:36:12', '', NULL),
(101, 100, '0,100', 'Shenzhen Headquarter', 1, 'Smanga', '15888888888', 'smanga@mail.com', '0', '2', 'admin', '2020-11-25 23:36:12', '', NULL),
(102, 100, '0,100', 'Changsha Branch', 2, 'Smanga', '15888888888', 'smanga@mail.com', '0', '2', 'admin', '2020-11-25 23:36:12', '', NULL),
(103, 101, '0,100,101', 'R & D department', 1, 'Smanga', '15888888888', 'smanga@mail.com', '0', '2', 'admin', '2020-11-25 23:36:12', '', NULL),
(104, 101, '0,100,101', 'Marketing department', 2, 'Smanga', '15888888888', 'smanga@mail.com', '0', '2', 'admin', '2020-11-25 23:36:13', '', NULL),
(105, 101, '0,100,101', 'Testing department', 3, 'Smanga', '15888888888', 'smanga@mail.com', '0', '2', 'admin', '2020-11-25 23:36:13', '', NULL),
(106, 101, '0,100,101', 'Financial department', 4, 'Smanga', '15888888888', 'smanga@mail.com', '0', '2', 'admin', '2020-11-25 23:36:13', '', NULL),
(107, 101, '0,100,101', 'Operation and maintenance depa', 5, 'Smanga', '15888888888', 'smanga@mail.com', '0', '2', 'admin', '2020-11-25 23:36:13', '', NULL),
(108, 102, '0,100,102', 'Marketing department', 1, 'Smanga', '15888888888', 'smanga@mail.com', '0', '2', 'admin', '2020-11-25 23:36:13', '', NULL),
(109, 102, '0,100,102', 'Financial department', 2, 'Smanga', '15888888888', 'smanga@mail.com', '0', '2', 'admin', '2020-11-25 23:36:13', '', NULL),
(200, 100, '0,100', 'IT', 1, NULL, NULL, NULL, '0', '0', 'admin', '2020-11-26 00:33:15', '', NULL),
(201, 100, '0,100', 'Manga', 2, NULL, NULL, NULL, '0', '0', 'admin', '2020-11-26 00:56:38', '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sys_dict_data`
--

CREATE TABLE `sys_dict_data` (
  `dict_code` bigint(20) NOT NULL COMMENT 'Dictionary encoding',
  `dict_sort` int(4) DEFAULT 0 COMMENT 'Dictionary sort',
  `dict_label` varchar(100) DEFAULT '' COMMENT 'Dictionary tag',
  `dict_value` varchar(100) DEFAULT '' COMMENT 'Dictionary key',
  `dict_type` varchar(100) DEFAULT '' COMMENT 'Dictionary type',
  `css_class` varchar(100) DEFAULT NULL COMMENT 'Style attributes (other style extensions)',
  `list_class` varchar(100) DEFAULT NULL COMMENT 'Table echo style',
  `is_default` char(1) DEFAULT 'N' COMMENT 'Whether the default (Y is N no)',
  `status` char(1) DEFAULT '0' COMMENT 'Status (0 normal 1 disabled)',
  `create_by` varchar(64) DEFAULT '' COMMENT 'Creator',
  `create_time` datetime DEFAULT NULL COMMENT 'Creation time',
  `update_by` varchar(64) DEFAULT '' COMMENT 'Updater',
  `update_time` datetime DEFAULT NULL COMMENT 'Update time',
  `remark` varchar(500) DEFAULT NULL COMMENT 'Remarks'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Dictionary data table';

--
-- Dumping data for table `sys_dict_data`
--

INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
(1, 1, 'Male', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2020-11-25 23:36:22', '', NULL, 'Sex: Male'),
(2, 2, 'Female', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2020-11-25 23:36:22', '', NULL, 'Gender: Female'),
(3, 3, 'Unknown', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2020-11-25 23:36:22', '', NULL, 'Unknown gender'),
(4, 1, 'Display', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2020-11-25 23:36:22', '', NULL, 'Show menu'),
(5, 2, 'Hide', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2020-11-25 23:36:22', '', NULL, 'Hide menu'),
(6, 1, 'Normal', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2020-11-25 23:36:22', '', NULL, 'Normal status'),
(7, 2, 'Deactivate', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2020-11-25 23:36:22', '', NULL, 'Disabled state'),
(8, 1, 'Normal', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2020-11-25 23:36:22', '', NULL, 'Normal status'),
(9, 2, 'Time out', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2020-11-25 23:36:22', '', NULL, 'Disabled state'),
(10, 1, 'Default', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2020-11-25 23:36:22', '', NULL, 'Default group'),
(11, 2, 'System', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2020-11-25 23:36:22', '', NULL, 'System grouping'),
(12, 1, 'Yes', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2020-11-25 23:36:22', '', NULL, 'The system default is'),
(13, 2, 'No', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2020-11-25 23:36:22', '', NULL, 'System default no'),
(14, 1, 'Notice', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2020-11-25 23:36:22', '', NULL, 'Notice'),
(15, 2, 'Announcement', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2020-11-25 23:36:22', '', NULL, 'Announcement'),
(16, 1, 'Normal', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2020-11-25 23:36:22', '', NULL, 'Normal status'),
(17, 2, 'Shut down', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2020-11-25 23:36:22', '', NULL, 'Disabled'),
(18, 99, 'Other', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2020-11-25 23:36:22', '', NULL, 'Other operations'),
(19, 1, 'Add', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2020-11-25 23:36:22', '', NULL, 'New operation'),
(20, 2, 'Modify', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2020-11-25 23:36:23', '', NULL, 'Modify operation'),
(21, 3, 'Delete', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2020-11-25 23:36:23', '', NULL, 'Delete operation'),
(22, 4, 'Authorization', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2020-11-25 23:36:23', '', NULL, 'Authorized operation'),
(23, 5, 'Export', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2020-11-25 23:36:23', '', NULL, 'Export operation'),
(24, 6, 'Import', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2020-11-25 23:36:23', '', NULL, 'Import operation'),
(25, 7, 'Retreat', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2020-11-25 23:36:23', '', NULL, 'Force back operation'),
(26, 8, 'Generate code', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2020-11-25 23:36:23', '', NULL, 'Generate operation'),
(27, 9, 'Clear data', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2020-11-25 23:36:23', '', NULL, 'Empty operation'),
(28, 1, 'Success', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2020-11-25 23:36:23', '', NULL, 'Normal status'),
(29, 2, 'Failure', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2020-11-25 23:36:23', '', NULL, 'Disabled state'),
(100, 1, 'English', 'en', 'sys_manga_lang', NULL, NULL, 'Y', '0', 'admin', '2020-11-27 13:48:11', '', NULL, NULL),
(101, 2, 'Japanese', 'jp', 'sys_manga_lang', NULL, NULL, 'Y', '0', 'admin', '2020-11-27 13:48:31', '', NULL, NULL),
(102, 3, 'Vietnamese', 'vi', 'sys_manga_lang', NULL, NULL, 'Y', '0', 'admin', '2020-11-27 13:49:55', '', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sys_dict_type`
--

CREATE TABLE `sys_dict_type` (
  `dict_id` bigint(20) NOT NULL COMMENT 'Dictionary primary key',
  `dict_name` varchar(100) DEFAULT '' COMMENT 'Dictionary name',
  `dict_type` varchar(100) DEFAULT '' COMMENT 'Dictionary type',
  `status` char(1) DEFAULT '0' COMMENT 'Status (0 normal 1 disabled)',
  `create_by` varchar(64) DEFAULT '' COMMENT 'Creator',
  `create_time` datetime DEFAULT NULL COMMENT 'Creation time',
  `update_by` varchar(64) DEFAULT '' COMMENT 'Updater',
  `update_time` datetime DEFAULT NULL COMMENT 'Update time',
  `remark` varchar(500) DEFAULT NULL COMMENT 'Remarks'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Dictionary type table';

--
-- Dumping data for table `sys_dict_type`
--

INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
(1, 'User gender', 'sys_user_sex', '0', 'admin', '2020-11-25 23:36:21', '', NULL, 'User gender list'),
(2, 'Menu status', 'sys_show_hide', '0', 'admin', '2020-11-25 23:36:21', '', NULL, 'Menu status list'),
(3, 'System switch', 'sys_normal_disable', '0', 'admin', '2020-11-25 23:36:21', '', NULL, 'System switch list'),
(4, 'Task status', 'sys_job_status', '0', 'admin', '2020-11-25 23:36:21', '', NULL, 'Task status list'),
(5, 'Task grouping', 'sys_job_group', '0', 'admin', '2020-11-25 23:36:21', '', NULL, 'Task grouping list'),
(6, 'Whether the system', 'sys_yes_no', '0', 'admin', '2020-11-25 23:36:22', '', NULL, 'Is the system listed'),
(7, 'Notification type', 'sys_notice_type', '0', 'admin', '2020-11-25 23:36:22', '', NULL, 'List of notification types'),
(8, 'Notification status', 'sys_notice_status', '0', 'admin', '2020-11-25 23:36:22', '', NULL, 'Notification status list'),
(9, 'Operation type', 'sys_oper_type', '0', 'admin', '2020-11-25 23:36:22', '', NULL, 'List of operation types'),
(10, 'System status', 'sys_common_status', '0', 'admin', '2020-11-25 23:36:22', '', NULL, 'Login status list'),
(100, 'Language', 'sys_manga_lang', '0', 'admin', '2020-11-27 13:46:42', '', NULL, 'Manga language');

-- --------------------------------------------------------

--
-- Table structure for table `sys_job`
--

CREATE TABLE `sys_job` (
  `job_id` bigint(20) NOT NULL COMMENT 'Task ID',
  `job_name` varchar(64) NOT NULL DEFAULT '' COMMENT 'Mission name',
  `job_group` varchar(64) NOT NULL DEFAULT 'DEFAULT' COMMENT 'Task group name',
  `invoke_target` varchar(500) NOT NULL COMMENT 'Call target string',
  `cron_expression` varchar(255) DEFAULT '' COMMENT 'Cron execution expression',
  `misfire_policy` varchar(20) DEFAULT '3' COMMENT 'Plan execution error strategy (1 execute immediately 2 execute once 3 give up execution)',
  `concurrent` char(1) DEFAULT '1' COMMENT 'Whether to execute concurrently (0 allowed 1 prohibited)',
  `status` char(1) DEFAULT '0' COMMENT 'Status (0 normal, 1 pause)',
  `create_by` varchar(64) DEFAULT '' COMMENT 'Creator',
  `create_time` datetime DEFAULT NULL COMMENT 'Creation time',
  `update_by` varchar(64) DEFAULT '' COMMENT 'Updater',
  `update_time` datetime DEFAULT NULL COMMENT 'Update time',
  `remark` varchar(500) DEFAULT '' COMMENT 'Remarks information'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Timed task schedule';

--
-- Dumping data for table `sys_job`
--

INSERT INTO `sys_job` (`job_id`, `job_name`, `job_group`, `invoke_target`, `cron_expression`, `misfire_policy`, `concurrent`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
(1, 'System default (no parameters)', 'DEFAULT', 'smangaTask.smangaNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2020-11-25 23:36:24', '', NULL, ''),
(2, 'System default (with parameters)', 'DEFAULT', 'smangaTask.smangaParams(\'smanga\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2020-11-25 23:36:24', '', NULL, ''),
(3, 'System default (multiple parameters)', 'DEFAULT', 'smangaTask.smangaMultipleParams(\'smanga\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2020-11-25 23:36:24', '', NULL, ''),
(100, 'Predict rating for user', 'DEFAULT', 'recommendationTask.predictRatingMangaForUser', '0/10 * * * * ?', '2', '0', '1', 'admin', '2020-12-20 20:58:58', 'admin', '2020-12-20 21:19:54', ''),
(101, 'Slope one task', 'DEFAULT', 'slopeOneTask.slopeOne(3)', '0/10 * * * * ?', '2', '0', '1', 'admin', '2020-12-21 07:41:57', '', NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `sys_job_log`
--

CREATE TABLE `sys_job_log` (
  `job_log_id` bigint(20) NOT NULL COMMENT 'Task log ID',
  `job_name` varchar(64) NOT NULL COMMENT 'Mission name',
  `job_group` varchar(64) NOT NULL COMMENT 'Task group name',
  `invoke_target` varchar(500) NOT NULL COMMENT 'Call target string',
  `job_message` varchar(500) DEFAULT NULL COMMENT 'Log information',
  `status` char(1) DEFAULT '0' COMMENT 'Execution status (0 normal and 1 failed)',
  `exception_info` varchar(2000) DEFAULT '' COMMENT 'Exception information',
  `create_time` datetime DEFAULT NULL COMMENT 'Creation time'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Scheduled task scheduling log table';

--
-- Dumping data for table `sys_job_log`
--

INSERT INTO `sys_job_log` (`job_log_id`, `job_name`, `job_group`, `invoke_target`, `job_message`, `status`, `exception_info`, `create_time`) VALUES
(1, 'Predict rating for user', 'DEFAULT', 'smangaTask.predictRatingMangaForUser', 'Predict rating for user Total time: 1 millisecond', '1', 'java.lang.NoSuchMethodException: com.smanga.quartz.task.smangaTask.predictRatingMangaForUser()\r\n	at java.lang.Class.getDeclaredMethod(Class.java:2130)\r\n	at com.smanga.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:52)\r\n	at com.smanga.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:31)\r\n	at com.smanga.quartz.util.QuartzJobExecution.doExecute(QuartzJobExecution.java:18)\r\n	at com.smanga.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:41)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\n', '2020-12-20 20:59:15'),
(2, 'Predict rating for user', 'DEFAULT', 'smangaTask.predictRatingMangaForUser', 'Predict rating for user Total time: 0 millisecond', '0', '', '2020-12-20 21:00:12'),
(3, 'Predict rating for user', 'DEFAULT', 'smangaTask.predictRatingMangaForUser', 'Predict rating for user Total time: 0 millisecond', '0', '', '2020-12-20 21:00:23'),
(4, 'Predict rating for user', 'DEFAULT', 'recommendationTask.predictRatingMangaForUser', 'Predict rating for user Total time: 2 millisecond', '0', '', '2020-12-20 21:20:04'),
(5, 'Predict rating for user', 'DEFAULT', 'recommendationTask.predictRatingMangaForUser', 'Predict rating for user Total time: 92070 millisecond', '0', '', '2020-12-20 23:44:52'),
(6, 'Predict rating for user', 'DEFAULT', 'recommendationTask.predictRatingMangaForUser', 'Predict rating for user Total time: 137918 millisecond', '0', '', '2020-12-20 23:59:52'),
(7, 'Predict rating for user', 'DEFAULT', 'recommendationTask.predictRatingMangaForUser', 'Predict rating for user Total time: 52196 millisecond', '0', '', '2020-12-21 00:01:03'),
(8, 'Predict rating for user', 'DEFAULT', 'recommendationTask.predictRatingMangaForUser', 'Predict rating for user Total time: 7 millisecond', '0', '', '2020-12-21 00:01:52'),
(9, 'Predict rating for user', 'DEFAULT', 'recommendationTask.predictRatingMangaForUser', 'Predict rating for user Total time: 5 millisecond', '0', '', '2020-12-21 00:06:52'),
(10, 'Predict rating for user', 'DEFAULT', 'recommendationTask.predictRatingMangaForUser', 'Predict rating for user Total time: 5 millisecond', '0', '', '2020-12-21 00:07:57'),
(11, 'Predict rating for user', 'DEFAULT', 'recommendationTask.predictRatingMangaForUser', 'Predict rating for user Total time: 5 millisecond', '0', '', '2020-12-21 00:09:40'),
(12, 'Predict rating for user', 'DEFAULT', 'recommendationTask.predictRatingMangaForUser', 'Predict rating for user Total time: 33530 millisecond', '0', '', '2020-12-21 00:11:29'),
(13, 'Predict rating for user', 'DEFAULT', 'recommendationTask.predictRatingMangaForUser', 'Predict rating for user Total time: 24331 millisecond', '0', '', '2020-12-21 00:13:46'),
(14, 'Slope one task', 'DEFAULT', 'slopeOneTask.slopeOne(3)', 'Slope one task Total time: 1 millisecond', '1', 'java.lang.NoSuchMethodException: com.smanga.web.slope.one.SlopeOne.slopeOne(java.lang.Integer)\r\n	at java.lang.Class.getDeclaredMethod(Class.java:2130)\r\n	at com.smanga.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:49)\r\n	at com.smanga.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:31)\r\n	at com.smanga.quartz.util.QuartzJobExecution.doExecute(QuartzJobExecution.java:18)\r\n	at com.smanga.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:41)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\n', '2020-12-21 07:42:04'),
(15, 'Slope one task', 'DEFAULT', 'slopeOneTask.slopeOne(3)', 'Slope one task Total time: 1 millisecond', '1', 'java.lang.NoSuchMethodException: com.smanga.web.slope.one.SlopeOne.slopeOne(java.lang.Integer)\r\n	at java.lang.Class.getDeclaredMethod(Class.java:2130)\r\n	at com.smanga.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:49)\r\n	at com.smanga.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:31)\r\n	at com.smanga.quartz.util.QuartzJobExecution.doExecute(QuartzJobExecution.java:18)\r\n	at com.smanga.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:41)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\n', '2020-12-21 07:43:43'),
(16, 'Slope one task', 'DEFAULT', 'slopeOneTask.slopeOne(3)', 'Slope one task Total time: 4 millisecond', '0', '', '2020-12-21 07:44:31'),
(17, 'Slope one task', 'DEFAULT', 'slopeOneTask.slopeOne(3)', 'Slope one task Total time: 3 millisecond', '0', '', '2020-12-21 07:46:23'),
(18, 'Slope one task', 'DEFAULT', 'slopeOneTask.slopeOne(3)', 'Slope one task Total time: 3 millisecond', '0', '', '2020-12-21 07:54:29'),
(19, 'Predict rating for user', 'DEFAULT', 'recommendationTask.predictRatingMangaForUser', 'Predict rating for user Total time: 7 millisecond', '0', '', '2020-12-21 09:06:15'),
(20, 'Predict rating for user', 'DEFAULT', 'recommendationTask.predictRatingMangaForUser', 'Predict rating for user Total time: 990062 millisecond', '0', '', '2020-12-21 09:24:03'),
(21, 'Predict rating for user', 'DEFAULT', 'recommendationTask.predictRatingMangaForUser', 'Predict rating for user Total time: 11416 millisecond', '0', '', '2020-12-21 09:26:23'),
(22, 'Predict rating for user', 'DEFAULT', 'recommendationTask.predictRatingMangaForUser', 'Predict rating for user Total time: 24306 millisecond', '0', '', '2020-12-21 09:34:45'),
(23, 'Predict rating for user', 'DEFAULT', 'recommendationTask.predictRatingMangaForUser', 'Predict rating for user Total time: 2 millisecond', '0', '', '2020-12-21 09:36:35'),
(24, 'Predict rating for user', 'DEFAULT', 'recommendationTask.predictRatingMangaForUser', 'Predict rating for user Total time: 439901 millisecond', '0', '', '2020-12-21 09:45:29'),
(25, 'Predict rating for user', 'DEFAULT', 'recommendationTask.predictRatingMangaForUser', 'Predict rating for user Total time: 6 millisecond', '0', '', '2020-12-21 09:54:14'),
(26, 'Predict rating for user', 'DEFAULT', 'recommendationTask.predictRatingMangaForUser', 'Predict rating for user Total time: 3 millisecond', '0', '', '2020-12-21 09:54:34'),
(27, 'Predict rating for user', 'DEFAULT', 'recommendationTask.predictRatingMangaForUser', 'Predict rating for user Total time: 224325 millisecond', '0', '', '2020-12-21 10:00:19'),
(28, 'Predict rating for user', 'DEFAULT', 'recommendationTask.predictRatingMangaForUser', 'Predict rating for user Total time: 147861 millisecond', '0', '', '2020-12-21 10:02:35'),
(29, 'Predict rating for user', 'DEFAULT', 'recommendationTask.predictRatingMangaForUser', 'Predict rating for user Total time: 5 millisecond', '0', '', '2020-12-21 10:07:31'),
(30, 'Predict rating for user', 'DEFAULT', 'recommendationTask.predictRatingMangaForUser', 'Predict rating for user Total time: 13435 millisecond', '0', '', '2020-12-21 10:07:59'),
(31, 'Predict rating for user', 'DEFAULT', 'recommendationTask.predictRatingMangaForUser', 'Predict rating for user Total time: 28494 millisecond', '0', '', '2020-12-21 10:18:58'),
(32, 'Predict rating for user', 'DEFAULT', 'recommendationTask.predictRatingMangaForUser', 'Predict rating for user Total time: 340 millisecond', '0', '', '2020-12-21 19:42:15'),
(33, 'Predict rating for user', 'DEFAULT', 'recommendationTask.predictRatingMangaForUser', 'Predict rating for user Total time: 1033 millisecond', '0', '', '2020-12-22 05:34:56'),
(34, 'Predict rating for user', 'DEFAULT', 'recommendationTask.predictRatingMangaForUser', 'Predict rating for user Total time: 1024 millisecond', '0', '', '2020-12-22 05:44:23');

-- --------------------------------------------------------

--
-- Table structure for table `sys_logininfor`
--

CREATE TABLE `sys_logininfor` (
  `info_id` bigint(20) NOT NULL COMMENT 'Access ID',
  `login_name` varchar(50) DEFAULT '' COMMENT 'Login account',
  `ipaddr` varchar(50) DEFAULT '' COMMENT 'Login IP address',
  `login_location` varchar(255) DEFAULT '' COMMENT 'Login location',
  `browser` varchar(50) DEFAULT '' COMMENT 'Browser type',
  `os` varchar(50) DEFAULT '' COMMENT 'Operating system',
  `status` char(1) DEFAULT '0' COMMENT 'Login status (0 success 1 failure)',
  `msg` varchar(255) DEFAULT '' COMMENT 'Prompt message',
  `login_time` datetime DEFAULT NULL COMMENT 'Interview time'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='System access record';

--
-- Dumping data for table `sys_logininfor`
--

INSERT INTO `sys_logininfor` (`info_id`, `login_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES
(100, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-11-25 23:37:51'),
(101, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Logout successfully', '2020-11-25 23:41:24'),
(102, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-11-25 23:41:31'),
(103, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Logout successfully', '2020-11-25 23:42:14'),
(104, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-11-25 23:47:14'),
(105, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-11-26 00:16:57'),
(106, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-11-26 00:43:20'),
(107, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-11-26 00:46:49'),
(108, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-11-26 00:49:27'),
(109, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-11-26 00:52:32'),
(110, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-11-26 00:54:15'),
(111, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-11-26 01:03:29'),
(112, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-11-26 01:06:29'),
(113, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Logout successfully', '2020-11-26 01:35:08'),
(114, 'tronghieu', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-11-26 01:35:12'),
(115, 'tronghieu', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Logout successfully', '2020-11-26 01:35:26'),
(116, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-11-26 01:35:29'),
(117, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-11-26 02:33:12'),
(118, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-11-26 04:00:58'),
(119, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-11-26 08:45:40'),
(120, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-11-26 09:53:40'),
(121, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-11-26 10:00:40'),
(122, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-11-26 10:14:21'),
(123, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-11-26 10:21:09'),
(124, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-11-26 10:22:29'),
(125, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-11-26 11:54:45'),
(126, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-11-26 12:41:28'),
(127, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-11-26 13:08:28'),
(128, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-11-26 13:45:01'),
(129, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-11-26 14:53:50'),
(130, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-11-26 15:14:07'),
(131, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-11-26 15:16:53'),
(132, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-11-26 15:49:26'),
(133, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-11-26 18:47:49'),
(134, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Logout successfully', '2020-11-26 19:00:09'),
(135, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-11-26 19:00:12'),
(136, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-11-26 19:04:11'),
(137, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-11-27 08:24:30'),
(138, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-11-27 08:27:34'),
(139, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-11-27 08:32:31'),
(140, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-11-27 08:38:47'),
(141, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-11-27 08:50:16'),
(142, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-11-27 09:01:44'),
(143, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-11-27 09:19:19'),
(144, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-11-27 09:57:45'),
(145, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-11-27 10:22:28'),
(146, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-11-27 11:59:08'),
(147, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-11-27 12:54:55'),
(148, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-11-27 13:42:13'),
(149, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-11-27 17:00:10'),
(150, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-11-27 18:44:31'),
(151, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-11-29 09:53:09'),
(152, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-11-29 10:01:04'),
(153, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-11-29 10:02:21'),
(154, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-11-29 10:17:46'),
(155, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-11-29 10:42:28'),
(156, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-11-29 12:27:49'),
(157, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-11-29 16:03:59'),
(158, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-11-29 17:41:22'),
(159, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-11-29 17:49:09'),
(160, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-01 14:01:02'),
(161, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-02 08:29:39'),
(162, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-02 09:49:02'),
(163, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-02 10:52:15'),
(164, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '1', 'Password entered incorrectly 1 times', '2020-12-02 11:37:54'),
(165, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-02 11:37:58'),
(166, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-02 12:59:45'),
(167, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-02 14:27:20'),
(168, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-02 14:42:39'),
(169, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '1', 'Password entered incorrectly 1 times', '2020-12-02 14:59:06'),
(170, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-02 15:00:04'),
(171, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-02 16:15:58'),
(172, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-02 16:59:18'),
(173, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-02 17:07:06'),
(174, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-02 19:07:15'),
(175, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-02 19:15:50'),
(176, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-02 19:27:11'),
(177, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-02 19:28:12'),
(178, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-02 20:33:25'),
(179, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-02 20:38:12'),
(180, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-02 20:40:32'),
(181, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-02 20:44:18'),
(182, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-02 20:50:02'),
(183, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-02 20:55:03'),
(184, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-02 20:55:45'),
(185, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-02 20:59:30'),
(186, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-02 21:29:44'),
(187, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-02 21:38:56'),
(188, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-02 21:57:03'),
(189, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-02 22:03:24'),
(190, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-02 22:15:48'),
(191, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-02 22:35:40'),
(192, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-02 23:11:52'),
(193, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-03 00:32:04'),
(194, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-03 00:47:00'),
(195, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-03 01:34:24'),
(196, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-03 01:37:10'),
(197, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-03 09:11:24'),
(198, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-03 19:17:06'),
(199, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-03 19:29:21'),
(200, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-03 19:30:47'),
(201, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-03 19:35:02'),
(202, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-03 21:29:33'),
(203, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-03 21:38:46'),
(204, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-03 21:43:02'),
(205, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-03 21:51:34'),
(206, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-03 21:57:33'),
(207, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-03 22:10:18'),
(208, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-06 10:29:39'),
(209, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-06 10:32:59'),
(210, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-06 10:35:41'),
(211, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-06 10:48:10'),
(212, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-06 10:48:39'),
(213, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-06 10:51:27'),
(214, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-06 11:15:47'),
(215, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-06 11:53:24'),
(216, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-06 11:54:15'),
(217, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-06 12:01:03'),
(218, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-06 12:02:58'),
(219, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-06 13:00:15'),
(220, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-06 13:05:17'),
(221, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-06 14:14:18'),
(222, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-06 17:01:38'),
(223, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-06 20:22:25'),
(224, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-06 21:44:11'),
(225, 'tronghieu', '127.0.0.1', 'Intranet IP', 'Chrome Mobile', 'Android 6.x', '0', 'Successful login', '2020-12-06 21:47:40'),
(226, 'tronghieu', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-06 21:49:59'),
(227, 'tronghieu', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-06 21:50:35'),
(228, 'tronghieu', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-06 21:53:36'),
(229, 'tronghieu', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-06 22:05:53'),
(230, 'tronghieu', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-06 22:27:51'),
(231, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-07 00:13:47'),
(232, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-07 00:28:44'),
(233, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-07 01:07:03'),
(234, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-07 01:33:55'),
(235, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-07 01:44:30'),
(236, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-07 01:46:06'),
(237, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-07 01:51:19'),
(238, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-07 02:08:18'),
(239, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-07 02:15:56'),
(240, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-07 02:20:11'),
(241, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-07 02:31:26'),
(242, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-07 02:49:50'),
(243, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-07 03:04:02'),
(244, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-07 03:07:58'),
(245, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-07 03:13:54'),
(246, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-07 03:15:51'),
(247, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-07 03:25:23'),
(248, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-07 03:27:17'),
(249, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-07 03:41:50'),
(250, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-07 03:46:14'),
(251, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-07 03:48:32'),
(252, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-07 11:55:53'),
(253, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-07 16:12:35'),
(254, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-07 19:46:42'),
(255, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-10 04:20:29'),
(256, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Logout successfully', '2020-12-10 04:27:54'),
(257, 'publisher', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-10 04:27:59'),
(258, 'publisher', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Logout successfully', '2020-12-10 04:31:47'),
(259, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-10 11:47:39'),
(260, 'publisher', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-10 19:07:18'),
(261, 'publisher', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-10 19:07:41'),
(262, 'publisher', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Logout successfully', '2020-12-10 19:09:22'),
(263, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-10 19:09:25'),
(264, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Logout successfully', '2020-12-10 19:10:28'),
(265, 'publisher', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-10 19:10:41'),
(266, 'publisher', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Logout successfully', '2020-12-10 19:13:12'),
(267, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-10 19:13:15'),
(268, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-11 07:41:32'),
(269, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-17 11:43:45'),
(270, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-20 19:10:33'),
(271, 'tronghieu', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-20 19:53:29'),
(272, 'tronghieu', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-20 19:58:10'),
(273, 'tronghieu', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-20 20:48:30'),
(274, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-20 20:57:54'),
(275, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-20 21:00:01'),
(276, 'tronghieu', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-20 21:19:35'),
(277, 'tronghieu', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Logout successfully', '2020-12-20 21:19:38'),
(278, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-20 21:19:41'),
(279, 'tronghieu', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-20 23:09:54'),
(280, 'usertest1', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '1', 'User does not exist/wrong password', '2020-12-20 23:10:30'),
(281, 'usertest1', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '1', 'User does not exist/wrong password', '2020-12-20 23:10:33'),
(282, 'testuser1', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '1', 'User does not exist/wrong password', '2020-12-20 23:10:39'),
(283, 'usertest1', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '1', 'User does not exist/wrong password', '2020-12-20 23:10:55'),
(284, 'tronghieu', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-20 23:10:59'),
(285, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-20 23:11:40'),
(286, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-20 23:14:33'),
(287, 'usertest1', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-20 23:34:10'),
(288, 'usertest1', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-20 23:35:17'),
(289, 'usertest2', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-20 23:37:02'),
(290, 'tronghieu', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-20 23:37:24'),
(291, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-20 23:37:55'),
(292, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-20 23:38:54'),
(293, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-20 23:42:44'),
(294, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-21 00:01:45'),
(295, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-21 00:06:44'),
(296, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-21 00:09:33'),
(297, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-21 00:13:17'),
(298, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-21 07:41:16'),
(299, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-21 07:43:18'),
(300, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-21 07:44:27'),
(301, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-21 07:46:17'),
(302, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-21 07:54:22'),
(303, 'tronghieu', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-21 08:24:36'),
(304, 'tronghieu', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-21 09:01:29'),
(305, 'tronghieu', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Logout successfully', '2020-12-21 09:01:35'),
(306, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '1', 'User does not exist/wrong password', '2020-12-21 09:02:28'),
(307, 'tronghieu', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-21 09:02:32'),
(308, 'tronghieu', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Logout successfully', '2020-12-21 09:02:37'),
(309, 'tronghieu', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-21 09:02:42'),
(310, 'tronghieu', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Logout successfully', '2020-12-21 09:04:37'),
(311, 'usertest1', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-21 09:04:43'),
(312, 'usertest1', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Logout successfully', '2020-12-21 09:04:58'),
(313, 'usertest2', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-21 09:05:07'),
(314, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-21 09:06:07'),
(315, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-21 09:07:27'),
(316, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-21 09:34:14'),
(317, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-21 09:54:07'),
(318, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-21 10:07:23'),
(319, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-21 10:18:23'),
(320, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-21 13:41:11'),
(321, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '1', 'User does not exist/wrong password', '2020-12-21 17:37:07'),
(322, 'tronghieu', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-21 17:37:11'),
(323, 'tronghieu', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-21 18:51:58'),
(324, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-21 19:42:08'),
(325, 'tronghieu', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-21 20:06:03'),
(326, 'tronghieu', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-21 20:11:48'),
(327, 'tronghieu', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-21 21:35:14'),
(328, 'tronghieu', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-21 21:59:47'),
(329, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-22 04:51:57'),
(330, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-22 05:11:39'),
(331, 'usertest1', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-22 05:27:59'),
(332, 'usertest1', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Logout successfully', '2020-12-22 05:29:04'),
(333, 'usertest2', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-22 05:29:11'),
(334, 'usertest2', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Logout successfully', '2020-12-22 05:29:55'),
(335, 'usertest3', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-22 05:30:01'),
(336, 'usertest3', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Logout successfully', '2020-12-22 05:32:22'),
(337, 'usertest4', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-22 05:32:28'),
(338, 'usertest4', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Logout successfully', '2020-12-22 05:33:00'),
(339, 'usertest5', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-22 05:33:08'),
(340, 'usertest5', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Logout successfully', '2020-12-22 05:33:53'),
(341, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-12-22 05:34:05');

-- --------------------------------------------------------

--
-- Table structure for table `sys_menu`
--

CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL COMMENT 'Menu ID',
  `menu_name` varchar(50) NOT NULL COMMENT 'Menu name',
  `parent_id` bigint(20) DEFAULT 0 COMMENT 'Parent menu ID',
  `order_num` int(4) DEFAULT 0 COMMENT 'Display order',
  `url` varchar(200) DEFAULT '#' COMMENT 'Request address',
  `target` varchar(20) DEFAULT '' COMMENT 'Open method (menuItem tab menuBlank new window)',
  `menu_type` char(1) DEFAULT '' COMMENT 'Menu type (M directory C menu F button)',
  `visible` char(1) DEFAULT '0' COMMENT 'Menu status (0 display 1 hide)',
  `perms` varchar(100) DEFAULT NULL COMMENT 'Authority ID',
  `icon` varchar(100) DEFAULT '#' COMMENT 'Menu icon',
  `create_by` varchar(64) DEFAULT '' COMMENT 'Creator',
  `create_time` datetime DEFAULT NULL COMMENT 'Creation time',
  `update_by` varchar(64) DEFAULT '' COMMENT 'Updater',
  `update_time` datetime DEFAULT NULL COMMENT 'Update time',
  `remark` varchar(500) DEFAULT '' COMMENT 'Remarks'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Menu permission table';

--
-- Dumping data for table `sys_menu`
--

INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
(1, 'System Management', 0, 1, '#', '', 'M', '0', '', 'fa fa-gear', 'admin', '2020-11-25 23:36:14', '', NULL, 'System Management Directory'),
(2, 'System monitoring', 0, 2, '#', '', 'M', '0', '', 'fa fa-video-camera', 'admin', '2020-11-25 23:36:14', '', NULL, 'System Monitoring Directory'),
(3, 'System Tools', 0, 3, '#', 'menuItem', 'M', '1', '', 'fa fa-bars', 'admin', '2020-11-25 23:36:14', 'admin', '2020-12-22 05:34:21', 'System tool catalog'),
(100, 'User Management', 1, 1, '/system/user', '', 'C', '0', 'system:user:view', 'fa fa-user-o', 'admin', '2020-11-25 23:36:14', '', NULL, 'User management menu'),
(101, 'Role management', 1, 2, '/system/role', '', 'C', '0', 'system:role:view', 'fa fa-user-secret', 'admin', '2020-11-25 23:36:14', '', NULL, 'Role management menu'),
(102, 'Menu management', 1, 3, '/system/menu', '', 'C', '0', 'system:menu:view', 'fa fa-th-list', 'admin', '2020-11-25 23:36:14', '', NULL, 'Menu management menu'),
(103, 'Department management', 1, 4, '/system/dept', 'menuItem', 'C', '1', 'system:dept:view', 'fa fa-outdent', 'admin', '2020-11-25 23:36:14', 'admin', '2020-12-10 04:23:27', 'Department Management Menu'),
(104, 'Job management', 1, 5, '/system/post', 'menuItem', 'C', '1', 'system:post:view', 'fa fa-address-card-o', 'admin', '2020-11-25 23:36:14', 'admin', '2020-12-10 04:23:38', 'Post management menu'),
(105, 'Dictionary management', 1, 6, '/system/dict', '', 'C', '0', 'system:dict:view', 'fa fa-bookmark-o', 'admin', '2020-11-25 23:36:14', '', NULL, 'Dictionary management menu'),
(106, 'Parameter settings', 1, 7, '/system/config', '', 'C', '0', 'system:config:view', 'fa fa-sun-o', 'admin', '2020-11-25 23:36:14', '', NULL, 'Parameter setting menu'),
(107, 'Announcement', 1, 8, '/system/notice', 'menuItem', 'C', '1', 'system:notice:view', 'fa fa-bullhorn', 'admin', '2020-11-25 23:36:14', 'admin', '2020-12-10 04:23:58', 'Notification announcement menu'),
(108, 'Log management', 1, 9, '#', 'menuItem', 'M', '1', '', 'fa fa-pencil-square-o', 'admin', '2020-11-25 23:36:14', 'admin', '2020-12-10 04:24:04', 'Log management menu'),
(109, 'Online user', 2, 1, '/monitor/online', '', 'C', '0', 'monitor:online:view', 'fa fa-user-circle', 'admin', '2020-11-25 23:36:14', '', NULL, 'Online user menu'),
(110, 'Timed task', 2, 2, '/monitor/job', '', 'C', '0', 'monitor:job:view', 'fa fa-tasks', 'admin', '2020-11-25 23:36:14', '', NULL, 'Timed task menu'),
(111, 'Data monitoring', 2, 3, '/monitor/data', 'menuItem', 'C', '1', 'monitor:data:view', 'fa fa-bug', 'admin', '2020-11-25 23:36:14', 'admin', '2020-12-10 04:25:03', 'Data monitoring menu'),
(112, 'Service monitoring', 2, 4, '/monitor/server', '', 'C', '0', 'monitor:server:view', 'fa fa-server', 'admin', '2020-11-25 23:36:14', '', NULL, 'Service monitoring menu'),
(113, 'Cache monitoring', 2, 5, '/monitor/cache', '', 'C', '0', 'monitor:cache:view', 'fa fa-cube', 'admin', '2020-11-25 23:36:14', '', NULL, 'Cache monitoring menu'),
(114, 'Form construction', 3, 1, '/tool/build', 'menuItem', 'C', '1', 'tool:build:view', 'fa fa-wpforms', 'admin', '2020-11-25 23:36:15', 'admin', '2020-11-26 01:10:28', 'Form build menu'),
(115, 'Code generation', 3, 2, '/tool/gen', '', 'C', '0', 'tool:gen:view', 'fa fa-code', 'admin', '2020-11-25 23:36:15', '', NULL, 'Code generation menu'),
(116, 'System interface', 3, 3, '/tool/swagger', 'menuItem', 'C', '1', 'tool:swagger:view', 'fa fa-gg', 'admin', '2020-11-25 23:36:15', 'admin', '2020-11-26 01:10:36', 'System interface menu'),
(500, 'Operation log', 108, 1, '/monitor/operlog', '', 'C', '0', 'monitor:operlog:view', 'fa fa-address-book', 'admin', '2020-11-25 23:36:15', '', NULL, 'Operation log menu'),
(501, 'Login log', 108, 2, '/monitor/logininfor', '', 'C', '0', 'monitor:logininfor:view', 'fa fa-file-image-o', 'admin', '2020-11-25 23:36:15', '', NULL, 'Login log menu'),
(1000, 'User query', 100, 1, '#', '', 'F', '0', 'system:user:list', '#', 'admin', '2020-11-25 23:36:15', '', NULL, ''),
(1001, 'User added', 100, 2, '#', '', 'F', '0', 'system:user:add', '#', 'admin', '2020-11-25 23:36:15', '', NULL, ''),
(1002, 'User modification', 100, 3, '#', '', 'F', '0', 'system:user:edit', '#', 'admin', '2020-11-25 23:36:15', '', NULL, ''),
(1003, 'User delete', 100, 4, '#', '', 'F', '0', 'system:user:remove', '#', 'admin', '2020-11-25 23:36:15', '', NULL, ''),
(1004, 'User export', 100, 5, '#', '', 'F', '0', 'system:user:export', '#', 'admin', '2020-11-25 23:36:15', '', NULL, ''),
(1005, 'User import', 100, 6, '#', '', 'F', '0', 'system:user:import', '#', 'admin', '2020-11-25 23:36:15', '', NULL, ''),
(1006, 'Reset Password', 100, 7, '#', '', 'F', '0', 'system:user:resetPwd', '#', 'admin', '2020-11-25 23:36:15', '', NULL, ''),
(1007, 'Role query', 101, 1, '#', '', 'F', '0', 'system:role:list', '#', 'admin', '2020-11-25 23:36:15', '', NULL, ''),
(1008, 'New role', 101, 2, '#', '', 'F', '0', 'system:role:add', '#', 'admin', '2020-11-25 23:36:15', '', NULL, ''),
(1009, 'Role modification', 101, 3, '#', '', 'F', '0', 'system:role:edit', '#', 'admin', '2020-11-25 23:36:15', '', NULL, ''),
(1010, 'Role deletion', 101, 4, '#', '', 'F', '0', 'system:role:remove', '#', 'admin', '2020-11-25 23:36:15', '', NULL, ''),
(1011, 'Role export', 101, 5, '#', '', 'F', '0', 'system:role:export', '#', 'admin', '2020-11-25 23:36:15', '', NULL, ''),
(1012, 'Menu query', 102, 1, '#', '', 'F', '0', 'system:menu:list', '#', 'admin', '2020-11-25 23:36:15', '', NULL, ''),
(1013, 'New menu', 102, 2, '#', '', 'F', '0', 'system:menu:add', '#', 'admin', '2020-11-25 23:36:15', '', NULL, ''),
(1014, 'Menu modification', 102, 3, '#', '', 'F', '0', 'system:menu:edit', '#', 'admin', '2020-11-25 23:36:15', '', NULL, ''),
(1015, 'Menu delete', 102, 4, '#', '', 'F', '0', 'system:menu:remove', '#', 'admin', '2020-11-25 23:36:15', '', NULL, ''),
(1016, 'Department query', 103, 1, '#', '', 'F', '0', 'system:dept:list', '#', 'admin', '2020-11-25 23:36:15', '', NULL, ''),
(1017, 'New department', 103, 2, '#', '', 'F', '0', 'system:dept:add', '#', 'admin', '2020-11-25 23:36:16', '', NULL, ''),
(1018, 'Department modification', 103, 3, '#', '', 'F', '0', 'system:dept:edit', '#', 'admin', '2020-11-25 23:36:16', '', NULL, ''),
(1019, 'Department delete', 103, 4, '#', '', 'F', '0', 'system:dept:remove', '#', 'admin', '2020-11-25 23:36:16', '', NULL, ''),
(1020, 'Job inquiry', 104, 1, '#', '', 'F', '0', 'system:post:list', '#', 'admin', '2020-11-25 23:36:16', '', NULL, ''),
(1021, 'New job', 104, 2, '#', '', 'F', '0', 'system:post:add', '#', 'admin', '2020-11-25 23:36:16', '', NULL, ''),
(1022, 'Post modification', 104, 3, '#', '', 'F', '0', 'system:post:edit', '#', 'admin', '2020-11-25 23:36:16', '', NULL, ''),
(1023, 'Post deletion', 104, 4, '#', '', 'F', '0', 'system:post:remove', '#', 'admin', '2020-11-25 23:36:16', '', NULL, ''),
(1024, 'Post export', 104, 5, '#', '', 'F', '0', 'system:post:export', '#', 'admin', '2020-11-25 23:36:16', '', NULL, ''),
(1025, 'Dictionary lookup', 105, 1, '#', '', 'F', '0', 'system:dict:list', '#', 'admin', '2020-11-25 23:36:16', '', NULL, ''),
(1026, 'New dictionary', 105, 2, '#', '', 'F', '0', 'system:dict:add', '#', 'admin', '2020-11-25 23:36:16', '', NULL, ''),
(1027, 'Dictionary modification', 105, 3, '#', '', 'F', '0', 'system:dict:edit', '#', 'admin', '2020-11-25 23:36:16', '', NULL, ''),
(1028, 'Dictionary delete', 105, 4, '#', '', 'F', '0', 'system:dict:remove', '#', 'admin', '2020-11-25 23:36:16', '', NULL, ''),
(1029, 'Dictionary export', 105, 5, '#', '', 'F', '0', 'system:dict:export', '#', 'admin', '2020-11-25 23:36:16', '', NULL, ''),
(1030, 'Parameter query', 106, 1, '#', '', 'F', '0', 'system:config:list', '#', 'admin', '2020-11-25 23:36:16', '', NULL, ''),
(1031, 'Add parameter', 106, 2, '#', '', 'F', '0', 'system:config:add', '#', 'admin', '2020-11-25 23:36:16', '', NULL, ''),
(1032, 'Parameter modification', 106, 3, '#', '', 'F', '0', 'system:config:edit', '#', 'admin', '2020-11-25 23:36:16', '', NULL, ''),
(1033, 'Parameter deletion', 106, 4, '#', '', 'F', '0', 'system:config:remove', '#', 'admin', '2020-11-25 23:36:16', '', NULL, ''),
(1034, 'Parameter export', 106, 5, '#', '', 'F', '0', 'system:config:export', '#', 'admin', '2020-11-25 23:36:16', '', NULL, ''),
(1035, 'Announcement query', 107, 1, '#', '', 'F', '0', 'system:notice:list', '#', 'admin', '2020-11-25 23:36:16', '', NULL, ''),
(1036, 'New announcement', 107, 2, '#', '', 'F', '0', 'system:notice:add', '#', 'admin', '2020-11-25 23:36:16', '', NULL, ''),
(1037, 'Announcement modification', 107, 3, '#', '', 'F', '0', 'system:notice:edit', '#', 'admin', '2020-11-25 23:36:16', '', NULL, ''),
(1038, 'Announcement delete', 107, 4, '#', '', 'F', '0', 'system:notice:remove', '#', 'admin', '2020-11-25 23:36:16', '', NULL, ''),
(1039, 'Operation query', 500, 1, '#', '', 'F', '0', 'monitor:operlog:list', '#', 'admin', '2020-11-25 23:36:16', '', NULL, ''),
(1040, 'Operation delete', 500, 2, '#', '', 'F', '0', 'monitor:operlog:remove', '#', 'admin', '2020-11-25 23:36:16', '', NULL, ''),
(1041, 'Details', 500, 3, '#', '', 'F', '0', 'monitor:operlog:detail', '#', 'admin', '2020-11-25 23:36:16', '', NULL, ''),
(1042, 'Log export', 500, 4, '#', '', 'F', '0', 'monitor:operlog:export', '#', 'admin', '2020-11-25 23:36:16', '', NULL, ''),
(1043, 'Login query', 501, 1, '#', '', 'F', '0', 'monitor:logininfor:list', '#', 'admin', '2020-11-25 23:36:16', '', NULL, ''),
(1044, 'Login delete', 501, 2, '#', '', 'F', '0', 'monitor:logininfor:remove', '#', 'admin', '2020-11-25 23:36:16', '', NULL, ''),
(1045, 'Log export', 501, 3, '#', '', 'F', '0', 'monitor:logininfor:export', '#', 'admin', '2020-11-25 23:36:16', '', NULL, ''),
(1046, 'Account unlock', 501, 4, '#', '', 'F', '0', 'monitor:logininfor:unlock', '#', 'admin', '2020-11-25 23:36:16', '', NULL, ''),
(1047, 'Online search', 109, 1, '#', '', 'F', '0', 'monitor:online:list', '#', 'admin', '2020-11-25 23:36:17', '', NULL, ''),
(1048, 'Batch withdrawal', 109, 2, '#', '', 'F', '0', 'monitor:online:batchForceLogout', '#', 'admin', '2020-11-25 23:36:17', '', NULL, ''),
(1049, 'Single forced withdrawal', 109, 3, '#', '', 'F', '0', 'monitor:online:forceLogout', '#', 'admin', '2020-11-25 23:36:17', '', NULL, ''),
(1050, 'Task query', 110, 1, '#', '', 'F', '0', 'monitor:job:list', '#', 'admin', '2020-11-25 23:36:17', '', NULL, ''),
(1051, 'New task', 110, 2, '#', '', 'F', '0', 'monitor:job:add', '#', 'admin', '2020-11-25 23:36:17', '', NULL, ''),
(1052, 'Task modification', 110, 3, '#', '', 'F', '0', 'monitor:job:edit', '#', 'admin', '2020-11-25 23:36:17', '', NULL, ''),
(1053, 'Task delete', 110, 4, '#', '', 'F', '0', 'monitor:job:remove', '#', 'admin', '2020-11-25 23:36:17', '', NULL, ''),
(1054, 'State modification', 110, 5, '#', '', 'F', '0', 'monitor:job:changeStatus', '#', 'admin', '2020-11-25 23:36:17', '', NULL, ''),
(1055, 'Task details', 110, 6, '#', '', 'F', '0', 'monitor:job:detail', '#', 'admin', '2020-11-25 23:36:17', '', NULL, ''),
(1056, 'Task export', 110, 7, '#', '', 'F', '0', 'monitor:job:export', '#', 'admin', '2020-11-25 23:36:17', '', NULL, ''),
(1057, 'Generate query', 115, 1, '#', '', 'F', '0', 'tool:gen:list', '#', 'admin', '2020-11-25 23:36:17', '', NULL, ''),
(1058, 'Generate modification', 115, 2, '#', '', 'F', '0', 'tool:gen:edit', '#', 'admin', '2020-11-25 23:36:17', '', NULL, ''),
(1059, 'Generate delete', 115, 3, '#', '', 'F', '0', 'tool:gen:remove', '#', 'admin', '2020-11-25 23:36:17', '', NULL, ''),
(1060, 'Preview code', 115, 4, '#', '', 'F', '0', 'tool:gen:preview', '#', 'admin', '2020-11-25 23:36:17', '', NULL, ''),
(1061, 'Generate code', 115, 5, '#', '', 'F', '0', 'tool:gen:code', '#', 'admin', '2020-11-25 23:36:17', '', NULL, ''),
(2000, 'Subscriber Management', 0, 4, '#', 'menuItem', 'M', '0', NULL, 'fa fa-group', 'admin', '2020-11-26 04:03:09', '', NULL, ''),
(2001, 'Reader', 2000, 1, '/business/user', 'menuItem', 'C', '0', '', 'fa fa-user-circle', 'admin', '2020-11-26 04:04:47', 'admin', '2020-11-26 04:06:14', ''),
(2002, 'Manga Management', 0, 5, '#', 'menuItem', 'M', '0', NULL, 'fa fa-square', 'admin', '2020-11-26 12:42:42', '', NULL, ''),
(2003, 'Category', 2002, 6, '/business/category', 'menuItem', 'C', '0', NULL, 'fa fa-object-ungroup', 'admin', '2020-11-26 12:44:43', '', NULL, ''),
(2004, 'Author', 2002, 2, '/business/author', 'menuItem', 'C', '0', NULL, 'fa fa-user-secret', 'admin', '2020-11-26 12:45:54', '', NULL, ''),
(2005, 'Manga', 2002, 3, '/business/manga', 'menuItem', 'C', '0', NULL, 'fa fa-barcode', 'admin', '2020-11-26 12:47:26', '', NULL, ''),
(2006, 'Artist', 2002, 1, '/business/artist', 'menuItem', 'C', '0', NULL, 'fa fa-photo', 'admin', '2020-11-29 15:33:28', '', NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `sys_notice`
--

CREATE TABLE `sys_notice` (
  `notice_id` int(4) NOT NULL COMMENT 'Announcement ID',
  `notice_title` varchar(50) NOT NULL COMMENT 'Announcement title',
  `notice_type` char(1) NOT NULL COMMENT 'Announcement type (1 notification 2 announcement)',
  `notice_content` varchar(2000) DEFAULT NULL COMMENT 'Announcement content',
  `status` char(1) DEFAULT '0' COMMENT 'Announcement status (0 normal 1 closed)',
  `create_by` varchar(64) DEFAULT '' COMMENT 'Creator',
  `create_time` datetime DEFAULT NULL COMMENT 'Creation time',
  `update_by` varchar(64) DEFAULT '' COMMENT 'Updater',
  `update_time` datetime DEFAULT NULL COMMENT 'Update time',
  `remark` varchar(255) DEFAULT NULL COMMENT 'Remarks'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Notification form';

--
-- Dumping data for table `sys_notice`
--

INSERT INTO `sys_notice` (`notice_id`, `notice_title`, `notice_type`, `notice_content`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
(1, 'Reminder: 2020-11-24 if the new version is release', '2', 'New version content', '0', 'admin', '2020-11-25 23:36:24', '', NULL, 'Administrator'),
(2, 'Maintenance notice: 2020-11-24 if the system is ma', '1', 'Maintenance content', '0', 'admin', '2020-11-25 23:36:25', '', NULL, 'Administrator');

-- --------------------------------------------------------

--
-- Table structure for table `sys_oper_log`
--

CREATE TABLE `sys_oper_log` (
  `oper_id` bigint(20) NOT NULL COMMENT 'Log primary key',
  `title` varchar(50) DEFAULT '' COMMENT 'Module title',
  `business_type` int(2) DEFAULT 0 COMMENT 'Business type (0 other 1 added 2 modified 3 deleted)',
  `method` varchar(100) DEFAULT '' COMMENT 'Method name',
  `request_method` varchar(10) DEFAULT '' COMMENT 'Request method',
  `operator_type` int(1) DEFAULT 0 COMMENT 'Operation category (0 other 1 background user 2 mobile terminal user)',
  `oper_name` varchar(50) DEFAULT '' COMMENT 'Operator',
  `dept_name` varchar(50) DEFAULT '' COMMENT 'Department name',
  `oper_url` varchar(255) DEFAULT '' COMMENT 'Request URL',
  `oper_ip` varchar(50) DEFAULT '' COMMENT 'Host address',
  `oper_location` varchar(255) DEFAULT '' COMMENT 'Operating location',
  `oper_param` varchar(2000) DEFAULT '' COMMENT 'Request parameter',
  `json_result` varchar(2000) DEFAULT '' COMMENT 'Return parameter',
  `status` int(1) DEFAULT 0 COMMENT 'Operation status (0 normal and 1 abnormal)',
  `error_msg` varchar(2000) DEFAULT '' COMMENT 'Wrong information',
  `oper_time` datetime DEFAULT NULL COMMENT 'Operating time'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Operation log record';

--
-- Dumping data for table `sys_oper_log`
--

INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`) VALUES
(100, 'Menu Management', 3, 'com.smanga.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', 'R & D department', '/system/menu/remove/4', '127.0.0.1', 'Intranet IP', NULL, '{\r\n  \"msg\" : \"The menu has been assigned and is not allowed to be deleted\",\r\n  \"code\" : 301\r\n}', 0, NULL, '2020-11-26 00:17:21'),
(101, 'Role Management', 2, 'com.smanga.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', 'R & D department', '/system/role/edit', '127.0.0.1', 'Intranet IP', '{\"roleId\":[\"2\"],\"roleName\":[\"Normal role\"],\"roleKey\":[\"common\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"Normal role\"],\"menuIds\":[\"1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,1042,501,1043,1044,1045,1046,2,109,1047,1048,1049,110,1050,1051,1052,1053,1054,1055,1056,111,112,113,3,114,115,1057,1058,1059,1060,1061,116\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-26 00:31:43'),
(102, 'Menu Management', 3, 'com.smanga.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', 'R & D department', '/system/menu/remove/4', '127.0.0.1', 'Intranet IP', NULL, '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-26 00:32:02'),
(103, 'Department Management', 1, 'com.smanga.web.controller.system.SysDeptController.addSave()', 'POST', 1, 'admin', 'R & D department', '/system/dept/add', '127.0.0.1', 'Intranet IP', '{\"parentId\":[\"100\"],\"deptName\":[\"IT\"],\"orderNum\":[\"1\"],\"leader\":[\"\"],\"phone\":[\"\"],\"email\":[\"\"],\"status\":[\"0\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-26 00:33:15'),
(104, 'User Management', 2, 'com.smanga.web.controller.system.SysUserController.editSave()', 'POST', 1, 'admin', 'R & D department', '/system/user/edit', '127.0.0.1', 'Intranet IP', '{\"userId\":[\"1\"],\"deptId\":[\"200\"],\"userName\":[\"Smanga\"],\"dept.deptName\":[\"IT\"],\"phonenumber\":[\"15888888888\"],\"email\":[\"smanga@163.com\"],\"loginName\":[\"admin\"],\"sex\":[\"1\"],\"role\":[\"1\"],\"remark\":[\"Administrator\"],\"status\":[\"0\"],\"roleIds\":[\"1\"],\"postIds\":[\"\"]}', 'null', 1, 'Operating super administrator users is not allowed', '2020-11-26 00:33:37'),
(105, 'User Management', 2, 'com.smanga.web.controller.system.SysUserController.editSave()', 'POST', 1, 'admin', 'R & D department', '/system/user/edit', '127.0.0.1', 'Intranet IP', '{\"userId\":[\"1\"],\"deptId\":[\"103\"],\"userName\":[\"Smanga\"],\"dept.deptName\":[\"R & D department\"],\"phonenumber\":[\"15888888888\"],\"email\":[\"smanga@163.com\"],\"loginName\":[\"admin\"],\"sex\":[\"1\"],\"role\":[\"1\"],\"remark\":[\"Administrator\"],\"status\":[\"0\"],\"roleIds\":[\"1\"],\"postIds\":[\"\"]}', 'null', 1, 'Operating super administrator users is not allowed', '2020-11-26 00:36:36'),
(106, 'User Management', 2, 'com.smanga.web.controller.system.SysUserController.editSave()', 'POST', 1, 'admin', 'R & D department', '/system/user/edit', '127.0.0.1', 'Intranet IP', '{\"userId\":[\"1\"],\"deptId\":[\"103\"],\"userName\":[\"Smanga\"],\"dept.deptName\":[\"R & D department\"],\"phonenumber\":[\"15888888888\"],\"email\":[\"smanga@163.com\"],\"loginName\":[\"admin\"],\"sex\":[\"1\"],\"role\":[\"1\"],\"remark\":[\"Administrator\"],\"status\":[\"0\"],\"roleIds\":[\"1\"],\"postIds\":[\"\"]}', 'null', 1, 'Operating super administrator users is not allowed', '2020-11-26 00:36:44'),
(107, 'User Management', 2, 'com.smanga.web.controller.system.SysUserController.editSave()', 'POST', 1, 'admin', 'R & D department', '/system/user/edit', '127.0.0.1', 'Intranet IP', '{\"userId\":[\"1\"],\"deptId\":[\"103\"],\"userName\":[\"Smanga\"],\"dept.deptName\":[\"R & D department\"],\"phonenumber\":[\"15888888888\"],\"email\":[\"smanga@163.com\"],\"loginName\":[\"admin\"],\"sex\":[\"1\"],\"role\":[\"1\"],\"remark\":[\"Administrator\"],\"status\":[\"0\"],\"roleIds\":[\"1\"],\"postIds\":[\"\"]}', 'null', 1, 'Operating super administrator users is not allowed', '2020-11-26 00:45:42'),
(108, 'User Management', 2, 'com.smanga.web.controller.system.SysUserController.editSave()', 'POST', 1, 'admin', 'R & D department', '/system/user/edit', '127.0.0.1', 'Intranet IP', '{\"userId\":[\"1\"],\"deptId\":[\"103\"],\"userName\":[\"Smanga\"],\"dept.deptName\":[\"R & D department\"],\"phonenumber\":[\"15888888888\"],\"email\":[\"smanga@163.com\"],\"loginName\":[\"admin\"],\"sex\":[\"1\"],\"role\":[\"1\"],\"remark\":[\"Administrator\"],\"status\":[\"0\"],\"roleIds\":[\"1\"],\"postIds\":[\"\"]}', 'null', 1, 'Operating super administrator users is not allowed', '2020-11-26 00:46:57'),
(109, 'User Management', 2, 'com.smanga.web.controller.system.SysUserController.editSave()', 'POST', 1, 'admin', 'R & D department', '/system/user/edit', '127.0.0.1', 'Intranet IP', '{\"userId\":[\"1\"],\"deptId\":[\"103\"],\"userName\":[\"Smanga\"],\"dept.deptName\":[\"R & D department\"],\"phonenumber\":[\"15888888888\"],\"email\":[\"smanga@163.com\"],\"loginName\":[\"admin\"],\"sex\":[\"1\"],\"role\":[\"1\"],\"remark\":[\"Administrator\"],\"status\":[\"0\"],\"roleIds\":[\"1\"],\"postIds\":[\"\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-26 00:49:35'),
(110, 'User Management', 2, 'com.smanga.web.controller.system.SysUserController.editSave()', 'POST', 1, 'admin', 'R & D department', '/system/user/edit', '127.0.0.1', 'Intranet IP', '{\"userId\":[\"1\"],\"deptId\":[\"200\"],\"userName\":[\"Smanga\"],\"dept.deptName\":[\"IT\"],\"phonenumber\":[\"15888888888\"],\"email\":[\"smanga@163.com\"],\"loginName\":[\"admin\"],\"sex\":[\"1\"],\"role\":[\"1\"],\"remark\":[\"Administrator\"],\"status\":[\"0\"],\"roleIds\":[\"1\"],\"postIds\":[\"\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-26 00:49:45'),
(111, 'Department Management', 3, 'com.smanga.web.controller.system.SysDeptController.remove()', 'GET', 1, 'admin', 'R & D department', '/system/dept/remove/101', '127.0.0.1', 'Intranet IP', NULL, '{\r\n  \"msg\" : \"There are subordinate departments and they are not allowed to be deleted\",\r\n  \"code\" : 301\r\n}', 0, NULL, '2020-11-26 00:49:59'),
(112, 'Department Management', 3, 'com.smanga.web.controller.system.SysDeptController.remove()', 'GET', 1, 'admin', 'R & D department', '/system/dept/remove/107', '127.0.0.1', 'Intranet IP', NULL, '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-26 00:50:05'),
(113, 'Department Management', 3, 'com.smanga.web.controller.system.SysDeptController.remove()', 'GET', 1, 'admin', 'R & D department', '/system/dept/remove/106', '127.0.0.1', 'Intranet IP', NULL, '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-26 00:50:07'),
(114, 'Department Management', 3, 'com.smanga.web.controller.system.SysDeptController.remove()', 'GET', 1, 'admin', 'R & D department', '/system/dept/remove/105', '127.0.0.1', 'Intranet IP', NULL, '{\r\n  \"msg\" : \"There are users in the department and they are not allowed to be deleted\",\r\n  \"code\" : 301\r\n}', 0, NULL, '2020-11-26 00:50:11'),
(115, 'User Management', 2, 'com.smanga.web.controller.system.SysUserController.editSave()', 'POST', 1, 'admin', 'R & D department', '/system/user/edit', '127.0.0.1', 'Intranet IP', '{\"userId\":[\"2\"],\"deptId\":[\"200\"],\"userName\":[\"Smanga\"],\"dept.deptName\":[\"IT\"],\"phonenumber\":[\"15666666666\"],\"email\":[\"smanga@mail.com\"],\"loginName\":[\"ry\"],\"sex\":[\"1\"],\"role\":[\"2\"],\"remark\":[\"Tester\"],\"status\":[\"0\"],\"roleIds\":[\"2\"],\"postIds\":[\"\"]}', 'null', 1, 'Operating super administrator users is not allowed', '2020-11-26 00:50:27'),
(116, 'User Management', 2, 'com.smanga.web.controller.system.SysUserController.editSave()', 'POST', 1, 'admin', 'R & D department', '/system/user/edit', '127.0.0.1', 'Intranet IP', '{\"userId\":[\"2\"],\"deptId\":[\"200\"],\"userName\":[\"Smanga\"],\"dept.deptName\":[\"IT\"],\"phonenumber\":[\"15666666666\"],\"email\":[\"smanga@mail.com\"],\"loginName\":[\"ry\"],\"sex\":[\"1\"],\"role\":[\"2\"],\"remark\":[\"Tester\"],\"status\":[\"0\"],\"roleIds\":[\"2\"],\"postIds\":[\"\"]}', 'null', 1, 'Operating super administrator users is not allowed', '2020-11-26 00:51:05'),
(117, 'User Management', 3, 'com.smanga.web.controller.system.SysUserController.remove()', 'POST', 1, 'admin', 'IT', '/system/user/remove', '127.0.0.1', 'Intranet IP', '{\"ids\":[\"2\"]}', '{\r\n  \"msg\" : \"Operating super administrator users is not allowed\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2020-11-26 00:52:44'),
(118, 'User Management', 3, 'com.smanga.web.controller.system.SysUserController.remove()', 'POST', 1, 'admin', 'IT', '/system/user/remove', '127.0.0.1', 'Intranet IP', '{\"ids\":[\"2\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-26 00:54:23'),
(119, 'Department Management', 3, 'com.smanga.web.controller.system.SysDeptController.remove()', 'GET', 1, 'admin', 'IT', '/system/dept/remove/103', '127.0.0.1', 'Intranet IP', NULL, '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-26 00:54:34'),
(120, 'Department Management', 3, 'com.smanga.web.controller.system.SysDeptController.remove()', 'GET', 1, 'admin', 'IT', '/system/dept/remove/104', '127.0.0.1', 'Intranet IP', NULL, '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-26 00:54:36'),
(121, 'Department Management', 3, 'com.smanga.web.controller.system.SysDeptController.remove()', 'GET', 1, 'admin', 'IT', '/system/dept/remove/105', '127.0.0.1', 'Intranet IP', NULL, '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-26 00:54:39'),
(122, 'Department Management', 3, 'com.smanga.web.controller.system.SysDeptController.remove()', 'GET', 1, 'admin', 'IT', '/system/dept/remove/101', '127.0.0.1', 'Intranet IP', NULL, '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-26 00:54:41'),
(123, 'Department Management', 3, 'com.smanga.web.controller.system.SysDeptController.remove()', 'GET', 1, 'admin', 'IT', '/system/dept/remove/108', '127.0.0.1', 'Intranet IP', NULL, '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-26 00:54:44'),
(124, 'Department Management', 3, 'com.smanga.web.controller.system.SysDeptController.remove()', 'GET', 1, 'admin', 'IT', '/system/dept/remove/109', '127.0.0.1', 'Intranet IP', NULL, '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-26 00:54:45'),
(125, 'Department Management', 3, 'com.smanga.web.controller.system.SysDeptController.remove()', 'GET', 1, 'admin', 'IT', '/system/dept/remove/102', '127.0.0.1', 'Intranet IP', NULL, '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-26 00:54:47'),
(126, 'Department Management', 1, 'com.smanga.web.controller.system.SysDeptController.addSave()', 'POST', 1, 'admin', 'IT', '/system/dept/add', '127.0.0.1', 'Intranet IP', '{\"parentId\":[\"100\"],\"deptName\":[\"Manga\"],\"orderNum\":[\"2\"],\"leader\":[\"\"],\"phone\":[\"\"],\"email\":[\"\"],\"status\":[\"0\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-26 00:56:38'),
(127, 'Role Management', 3, 'com.smanga.web.controller.system.SysRoleController.remove()', 'POST', 1, 'admin', 'IT', '/system/role/remove', '127.0.0.1', 'Intranet IP', '{\"ids\":[\"2\"]}', '{\r\n  \"msg\" : \"Normal role has been allocated and cannot be deleted\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2020-11-26 00:57:10'),
(128, 'Role Management', 3, 'com.smanga.web.controller.system.SysRoleController.remove()', 'POST', 1, 'admin', 'IT', '/system/role/remove', '127.0.0.1', 'Intranet IP', '{\"ids\":[\"2\"]}', '{\r\n  \"msg\" : \"Normal role has been allocated and cannot be deleted\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2020-11-26 00:57:36'),
(129, 'Role Management', 3, 'com.smanga.web.controller.system.SysRoleController.remove()', 'POST', 1, 'admin', 'IT', '/system/role/remove', '127.0.0.1', 'Intranet IP', '{\"ids\":[\"2\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-26 01:03:41'),
(130, 'Job Management', 3, 'com.smanga.web.controller.system.SysPostController.remove()', 'POST', 1, 'admin', 'IT', '/system/post/remove', '127.0.0.1', 'Intranet IP', '{\"ids\":[\"2\"]}', '{\r\n  \"msg\" : \"Project manager has been allocated and cannot be deleted\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2020-11-26 01:04:10'),
(131, 'Job Management', 3, 'com.smanga.web.controller.system.SysPostController.remove()', 'POST', 1, 'admin', 'IT', '/system/post/remove', '127.0.0.1', 'Intranet IP', '{\"ids\":[\"2\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-26 01:06:41'),
(132, 'Job Management', 3, 'com.smanga.web.controller.system.SysPostController.remove()', 'POST', 1, 'admin', 'IT', '/system/post/remove', '127.0.0.1', 'Intranet IP', '{\"ids\":[\"3\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-26 01:06:43'),
(133, 'Job Management', 3, 'com.smanga.web.controller.system.SysPostController.remove()', 'POST', 1, 'admin', 'IT', '/system/post/remove', '127.0.0.1', 'Intranet IP', '{\"ids\":[\"4\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-26 01:06:46'),
(134, 'Menu Management', 2, 'com.smanga.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', 'IT', '/system/menu/edit', '127.0.0.1', 'Intranet IP', '{\"menuId\":[\"114\"],\"parentId\":[\"3\"],\"menuType\":[\"C\"],\"menuName\":[\"Form construction\"],\"url\":[\"/tool/build\"],\"target\":[\"menuItem\"],\"perms\":[\"tool:build:view\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-wpforms\"],\"visible\":[\"1\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-26 01:10:28'),
(135, 'Menu Management', 2, 'com.smanga.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', 'IT', '/system/menu/edit', '127.0.0.1', 'Intranet IP', '{\"menuId\":[\"116\"],\"parentId\":[\"3\"],\"menuType\":[\"C\"],\"menuName\":[\"System interface\"],\"url\":[\"/tool/swagger\"],\"target\":[\"menuItem\"],\"perms\":[\"tool:swagger:view\"],\"orderNum\":[\"3\"],\"icon\":[\"fa fa-gg\"],\"visible\":[\"1\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-26 01:10:36'),
(136, 'User Management', 1, 'com.smanga.web.controller.system.SysUserController.addSave()', 'POST', 1, 'admin', 'IT', '/system/user/add', '127.0.0.1', 'Intranet IP', '{\"deptId\":[\"201\"],\"userName\":[\"Trong Hieu Nguyen\"],\"deptName\":[\"Manga\"],\"phonenumber\":[\"0935802290\"],\"email\":[\"tronghieu8531@gmail.com\"],\"loginName\":[\"tronghieu\"],\"sex\":[\"0\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"\"],\"postIds\":[\"\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-26 01:35:01'),
(137, 'Code generation', 6, 'com.smanga.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', 'IT', '/tool/gen/importTable', '127.0.0.1', 'Intranet IP', '{\"tables\":[\"business_user\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-26 02:33:27'),
(138, 'Code generation', 2, 'com.smanga.generator.controller.GenController.editSave()', 'POST', 1, 'admin', 'IT', '/tool/gen/edit', '127.0.0.1', 'Intranet IP', '{\"tableId\":[\"1\"],\"tableName\":[\"business_user\"],\"tableComment\":[\"Business User Information Form\"],\"className\":[\"BusinessUser\"],\"functionAuthor\":[\"Trong Hieu\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"1\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"User ID\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"userId\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"2\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"Login account\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"loginName\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"LIKE\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"3\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"User name\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"userName\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"LIKE\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"4\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"User type (R reader P publisher)\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"userType\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"select\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"5\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"User mailbox\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"email\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"6\"],\"columns[5].sort\":[\"6\"],\"columns', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-26 02:34:41'),
(139, 'Code generation', 8, 'com.smanga.generator.controller.GenController.download()', 'GET', 1, 'admin', 'IT', '/tool/gen/download/business_user', '127.0.0.1', 'Intranet IP', NULL, 'null', 0, NULL, '2020-11-26 02:34:46'),
(140, 'Menu Management', 1, 'com.smanga.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', 'IT', '/system/menu/add', '127.0.0.1', 'Intranet IP', '{\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"Subscriber Management\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"4\"],\"icon\":[\"fa fa-group\"],\"visible\":[\"0\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-26 04:03:09'),
(141, 'Menu Management', 1, 'com.smanga.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', 'IT', '/system/menu/add', '127.0.0.1', 'Intranet IP', '{\"parentId\":[\"2000\"],\"menuType\":[\"C\"],\"menuName\":[\"Reader\"],\"url\":[\"/business/user\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-user-o\"],\"visible\":[\"0\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-26 04:04:47'),
(142, 'Menu Management', 2, 'com.smanga.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', 'IT', '/system/menu/edit', '127.0.0.1', 'Intranet IP', '{\"menuId\":[\"2001\"],\"parentId\":[\"2000\"],\"menuType\":[\"C\"],\"menuName\":[\"Reader\"],\"url\":[\"/business/user\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-user\"],\"visible\":[\"0\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-26 04:05:24'),
(143, 'Menu Management', 2, 'com.smanga.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', 'IT', '/system/menu/edit', '127.0.0.1', 'Intranet IP', '{\"menuId\":[\"2001\"],\"parentId\":[\"2000\"],\"menuType\":[\"C\"],\"menuName\":[\"Reader\"],\"url\":[\"/business/user\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-user-circle\"],\"visible\":[\"0\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-26 04:06:14'),
(144, 'Personal Information', 2, 'com.smanga.web.controller.system.SysProfileController.update()', 'POST', 1, 'admin', 'IT', '/system/user/profile/update', '127.0.0.1', 'Intranet IP', '{\"id\":[\"\"],\"userName\":[\"admin\"],\"phonenumber\":[\"0935801313\"],\"email\":[\"smanga@163.com\"],\"sex\":[\"0\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-26 04:20:48'),
(145, 'Business User Information Form', 1, 'com.smanga.web.controller.business.BusinessUserController.addSave()', 'POST', 1, 'admin', 'IT', '/business/user/add', '127.0.0.1', 'Intranet IP', '{\"loginName\":[\"test12\"],\"userName\":[\"test 12\"],\"userType\":[\"R\"],\"email\":[\"test12@mail.com\"],\"phonenumber\":[\"09321123123\"],\"sex\":[\"0\"],\"status\":[\"0\"],\"remark\":[\"test\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-26 10:01:58'),
(146, 'Business User Information Form', 2, 'com.smanga.web.controller.business.BusinessUserController.editSave()', 'POST', 1, 'admin', 'IT', '/business/user/edit', '127.0.0.1', 'Intranet IP', '{\"userId\":[\"100\"],\"loginName\":[\"test12\"],\"userName\":[\"test 12\"],\"userType\":[\"R\"],\"email\":[\"test12@mail.com\"],\"phonenumber\":[\"09321123123\"],\"sex\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"test\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-26 10:17:04'),
(147, 'Business User Information Form', 2, 'com.smanga.web.controller.business.BusinessUserController.editSave()', 'POST', 1, 'admin', 'IT', '/business/user/edit', '127.0.0.1', 'Intranet IP', '{\"userId\":[\"100\"],\"loginName\":[\"test12\"],\"userName\":[\"test 12\"],\"userType\":[\"R\"],\"email\":[\"test12@mail.com\"],\"phonenumber\":[\"09321123123\"],\"sex\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"test\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-26 10:18:17'),
(148, 'Business User Information Form', 2, 'com.smanga.web.controller.business.BusinessUserController.editSave()', 'POST', 1, 'admin', 'IT', '/business/user/edit', '127.0.0.1', 'Intranet IP', '{\"userId\":[\"100\"],\"loginName\":[\"test12\"],\"userName\":[\"test 12\"],\"userType\":[\"P\"],\"email\":[\"test12@mail.com\"],\"phonenumber\":[\"09321123123\"],\"sex\":[\"2\"],\"status\":[\"1\"],\"remark\":[\"test\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-26 10:20:05'),
(149, 'Business User Information Form', 2, 'com.smanga.web.controller.business.BusinessUserController.editSave()', 'POST', 1, 'admin', 'IT', '/business/user/edit', '127.0.0.1', 'Intranet IP', '{\"userId\":[\"100\"],\"loginName\":[\"test12\"],\"userName\":[\"test 12\"],\"userType\":[\"R\"],\"email\":[\"test12@mail.com\"],\"phonenumber\":[\"09321123123\"],\"sex\":[\"0\"],\"status\":[\"0\"],\"remark\":[\"test\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-26 10:20:13'),
(150, 'Business User Information Form', 2, 'com.smanga.web.controller.business.BusinessUserController.editSave()', 'POST', 1, 'admin', 'IT', '/business/user/edit', '127.0.0.1', 'Intranet IP', '{\"userId\":[\"100\"],\"loginName\":[\"test12\"],\"userName\":[\"test 12\"],\"userType\":[\"P\"],\"email\":[\"test12@mail.com\"],\"phonenumber\":[\"09321123123\"],\"sex\":[\"0\"],\"status\":[\"0\"],\"remark\":[\"test\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-26 10:21:17'),
(151, 'Business User Information Form', 2, 'com.smanga.web.controller.business.BusinessUserController.editSave()', 'POST', 1, 'admin', 'IT', '/business/user/edit', '127.0.0.1', 'Intranet IP', '{\"userId\":[\"100\"],\"loginName\":[\"test12\"],\"userName\":[\"test 12\"],\"userType\":[\"P\"],\"email\":[\"test12@mail.com\"],\"phonenumber\":[\"09321123123\"],\"sex\":[\"0\"],\"status\":[\"0\"],\"remark\":[\"test\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-26 10:22:35'),
(152, 'Code generation', 6, 'com.smanga.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', 'IT', '/tool/gen/importTable', '127.0.0.1', 'Intranet IP', '{\"tables\":[\"manga_chapter,manga,image_file,author,manga_category\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-26 11:55:10'),
(153, 'Code generation', 2, 'com.smanga.generator.controller.GenController.editSave()', 'POST', 1, 'admin', 'IT', '/tool/gen/edit', '127.0.0.1', 'Intranet IP', '{\"tableId\":[\"6\"],\"tableName\":[\"manga_chapter\"],\"tableComment\":[\"Manga Chapter\"],\"className\":[\"MangaChapter\"],\"functionAuthor\":[\"Trong Hieu\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"72\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"Serial ID\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"73\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"Manga name\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"chapterName\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"LIKE\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"74\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"Index of chapter in manga\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"chapterIndex\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"75\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"Language of chapter\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"chapterLang\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"76\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"Image paths with multipe image seperated by comma\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"chapterImages\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"textarea\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-26 11:56:17'),
(154, 'Code generation', 2, 'com.smanga.generator.controller.GenController.editSave()', 'POST', 1, 'admin', 'IT', '/tool/gen/edit', '127.0.0.1', 'Intranet IP', '{\"tableId\":[\"2\"],\"tableName\":[\"author\"],\"tableComment\":[\"Author\"],\"className\":[\"Author\"],\"functionAuthor\":[\"Trong Hieu\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"21\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"Serial ID\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"22\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"Author name\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"authorName\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"LIKE\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"23\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"Author information\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"authorInfo\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"24\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"Number of reader like this author\"],\"columns[3].javaType\":[\"Integer\"],\"columns[3].javaField\":[\"favoriteCounter\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"25\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"Remark\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"remark\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"textarea\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"26\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"Delete flag (0 means exis', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-26 11:58:35'),
(155, 'Code generation', 2, 'com.smanga.generator.controller.GenController.editSave()', 'POST', 1, 'admin', 'IT', '/tool/gen/edit', '127.0.0.1', 'Intranet IP', '{\"tableId\":[\"3\"],\"tableName\":[\"image_file\"],\"tableComment\":[\"Image File\"],\"className\":[\"ImageFile\"],\"functionAuthor\":[\"Trong Hieu\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"31\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"Serial ID\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"32\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"Image file name\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"imageName\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"LIKE\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"33\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"Image file path\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"imagePath\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"34\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"Used status (1 used 0 not use)\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"usedStatus\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"radio\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"35\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"Delete flag (0 means existence 1 means deletion)\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"delFlag\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"36\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"Creator\"],\"columns[5].javaType\":[\"St', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-26 11:59:01'),
(156, 'Code generation', 2, 'com.smanga.generator.controller.GenController.editSave()', 'POST', 1, 'admin', 'IT', '/tool/gen/edit', '127.0.0.1', 'Intranet IP', '{\"tableId\":[\"4\"],\"tableName\":[\"manga\"],\"tableComment\":[\"Manga\"],\"className\":[\"Manga\"],\"functionAuthor\":[\"Trong Hieu\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"40\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"Serial ID\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"41\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"Manga name\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"mangaName\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"LIKE\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"42\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"Categories (each category seperated by comma)\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"categories\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"43\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"Category ids (String with multiple category id seperated by comma\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"categoryIds\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"44\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"Author name of manga\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"author\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlTyp', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-26 11:59:34'),
(157, 'Code generation', 2, 'com.smanga.generator.controller.GenController.editSave()', 'POST', 1, 'admin', 'IT', '/tool/gen/edit', '127.0.0.1', 'Intranet IP', '{\"tableId\":[\"5\"],\"tableName\":[\"manga_category\"],\"tableComment\":[\"Manga Category\"],\"className\":[\"MangaCategory\"],\"functionAuthor\":[\"Trong Hieu\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"59\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"Serial ID\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"60\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"Category name\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"categoryName\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"LIKE\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"61\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"Number of reader like this category\"],\"columns[2].javaType\":[\"Integer\"],\"columns[2].javaField\":[\"favoriteCounter\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"62\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"Category status (1 enabled 0 disabled)\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"status\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"radio\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"63\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"Delete flag (0 means existence 1 means deletion)\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"delFlag\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"64\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnCom', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-26 11:59:52'),
(158, 'Code generation', 8, 'com.smanga.generator.controller.GenController.download()', 'GET', 1, 'admin', 'IT', '/tool/gen/download/manga_chapter', '127.0.0.1', 'Intranet IP', NULL, 'null', 0, NULL, '2020-11-26 12:00:46'),
(159, 'Code generation', 8, 'com.smanga.generator.controller.GenController.download()', 'GET', 1, 'admin', 'IT', '/tool/gen/download/manga_chapter', '127.0.0.1', 'Intranet IP', NULL, 'null', 0, NULL, '2020-11-26 12:01:22'),
(160, 'Code generation', 8, 'com.smanga.generator.controller.GenController.download()', 'GET', 1, 'admin', 'IT', '/tool/gen/download/author', '127.0.0.1', 'Intranet IP', NULL, 'null', 0, NULL, '2020-11-26 12:01:34'),
(161, 'Code generation', 8, 'com.smanga.generator.controller.GenController.download()', 'GET', 1, 'admin', 'IT', '/tool/gen/download/image_file', '127.0.0.1', 'Intranet IP', NULL, 'null', 0, NULL, '2020-11-26 12:01:42'),
(162, 'Code generation', 8, 'com.smanga.generator.controller.GenController.download()', 'GET', 1, 'admin', 'IT', '/tool/gen/download/manga', '127.0.0.1', 'Intranet IP', NULL, 'null', 0, NULL, '2020-11-26 12:01:49'),
(163, 'Code generation', 8, 'com.smanga.generator.controller.GenController.download()', 'GET', 1, 'admin', 'IT', '/tool/gen/download/manga_category', '127.0.0.1', 'Intranet IP', NULL, 'null', 0, NULL, '2020-11-26 12:01:55'),
(164, 'Code generation', 8, 'com.smanga.generator.controller.GenController.download()', 'GET', 1, 'admin', 'IT', '/tool/gen/download/manga_chapter', '127.0.0.1', 'Intranet IP', NULL, 'null', 0, NULL, '2020-11-26 12:27:31'),
(165, 'Menu Management', 1, 'com.smanga.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', 'IT', '/system/menu/add', '127.0.0.1', 'Intranet IP', '{\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"Manga Management\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"5\"],\"icon\":[\"fa fa-square\"],\"visible\":[\"0\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-26 12:42:42'),
(166, 'Menu Management', 1, 'com.smanga.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', 'IT', '/system/menu/add', '127.0.0.1', 'Intranet IP', '{\"parentId\":[\"2002\"],\"menuType\":[\"C\"],\"menuName\":[\"Category\"],\"url\":[\"/business/category\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"6\"],\"icon\":[\"fa fa-object-ungroup\"],\"visible\":[\"0\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-26 12:44:43'),
(167, 'Menu Management', 1, 'com.smanga.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', 'IT', '/system/menu/add', '127.0.0.1', 'Intranet IP', '{\"parentId\":[\"2002\"],\"menuType\":[\"C\"],\"menuName\":[\"Author\"],\"url\":[\"/business/author\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"2\"],\"icon\":[\"fa fa-user-secret\"],\"visible\":[\"0\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-26 12:45:54'),
(168, 'Menu Management', 1, 'com.smanga.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', 'IT', '/system/menu/add', '127.0.0.1', 'Intranet IP', '{\"parentId\":[\"2002\"],\"menuType\":[\"C\"],\"menuName\":[\"Manga\"],\"url\":[\"/business/manga\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"3\"],\"icon\":[\"fa fa-barcode\"],\"visible\":[\"0\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-26 12:47:26'),
(169, 'Manga Category', 1, 'com.smanga.web.controller.business.BusinessMangaCategoryController.addSave()', 'POST', 1, 'admin', 'IT', '/business/category/add', '127.0.0.1', 'Intranet IP', '{\"coverImage\":[\"\"],\"coverImageId\":[\"\"],\"categoryName\":[\"asdas\"],\"status\":[\"1\"],\"recommendedAge\":[\"\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-26 15:57:29'),
(170, 'Manga Category', 3, 'com.smanga.web.controller.business.BusinessMangaCategoryController.remove()', 'POST', 1, 'admin', 'IT', '/business/category/remove', '127.0.0.1', 'Intranet IP', '{\"ids\":[\"2\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-26 15:57:39'),
(171, 'Manga Category', 1, 'com.smanga.web.controller.business.BusinessMangaCategoryController.addSave()', 'POST', 1, 'admin', 'IT', '/business/category/add', '127.0.0.1', 'Intranet IP', '{\"coverImage\":[\"\"],\"coverImageId\":[\"15\"],\"categoryName\":[\"Yaoi\"],\"status\":[\"1\"],\"recommendedAge\":[\"18+\"],\"remark\":[\"test\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-27 09:02:16'),
(172, 'Manga Category', 3, 'com.smanga.web.controller.business.BusinessMangaCategoryController.remove()', 'POST', 1, 'admin', 'IT', '/business/category/remove', '127.0.0.1', 'Intranet IP', '{\"ids\":[\"3\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-27 09:36:40'),
(173, 'Manga Category', 1, 'com.smanga.web.controller.business.BusinessMangaCategoryController.addSave()', 'POST', 1, 'admin', 'IT', '/business/category/add', '127.0.0.1', 'Intranet IP', '{\"coverImage\":[\"/profile/upload/category/cover/2020-11-27/file20201127095752.jpg\"],\"coverImageId\":[\"18\"],\"categoryName\":[\"Yaoi\"],\"status\":[\"1\"],\"recommendedAge\":[\"18+\"],\"remark\":[\"test\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-27 09:58:07'),
(174, 'Manga Category', 3, 'com.smanga.web.controller.business.BusinessMangaCategoryController.remove()', 'POST', 1, 'admin', 'IT', '/business/category/remove', '127.0.0.1', 'Intranet IP', '{\"ids\":[\"4\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-27 10:22:34'),
(175, 'Manga Category', 1, 'com.smanga.web.controller.business.BusinessMangaCategoryController.addSave()', 'POST', 1, 'admin', 'IT', '/business/category/add', '127.0.0.1', 'Intranet IP', '{\"coverImage\":[\"/profile/upload/category/cover/2020-11-27/file20201127105911.jpg\"],\"coverImageId\":[\"44\"],\"categoryName\":[\"Yaoi\"],\"status\":[\"1\"],\"recommendedAge\":[\"18+\"],\"remark\":[\"test\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-27 10:59:19'),
(176, 'Manga Category', 3, 'com.smanga.web.controller.business.BusinessMangaCategoryController.remove()', 'POST', 1, 'admin', 'IT', '/business/category/remove', '127.0.0.1', 'Intranet IP', '{\"ids\":[\"5\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-27 11:16:05'),
(177, 'Manga Category', 2, 'com.smanga.web.controller.business.BusinessMangaCategoryController.editSave()', 'POST', 1, 'admin', 'IT', '/business/category/edit', '127.0.0.1', 'Intranet IP', '{\"id\":[\"1\"],\"coverImage\":[\"\"],\"coverImageId\":[\"45\"],\"categoryName\":[\"Shonen\"],\"status\":[\"1\"],\"recommendedAge\":[\"roughly 12-18\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-27 11:16:56'),
(178, 'Manga Category', 3, 'com.smanga.web.controller.business.BusinessMangaCategoryController.remove()', 'POST', 1, 'admin', 'IT', '/business/category/remove', '127.0.0.1', 'Intranet IP', '{\"ids\":[\"1\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-27 11:19:08'),
(179, 'Manga Category', 1, 'com.smanga.web.controller.business.BusinessMangaCategoryController.addSave()', 'POST', 1, 'admin', 'IT', '/business/category/add', '127.0.0.1', 'Intranet IP', '{\"coverImage\":[\"/profile/upload/category/cover/2020-11-27/file20201127111918.jpg\"],\"coverImageId\":[\"46\"],\"categoryName\":[\"Shonen\"],\"status\":[\"1\"],\"recommendedAge\":[\"18+\"],\"remark\":[\"test\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-27 11:19:25'),
(180, 'Manga Category', 2, 'com.smanga.web.controller.business.BusinessMangaCategoryController.editSave()', 'POST', 1, 'admin', 'IT', '/business/category/edit', '127.0.0.1', 'Intranet IP', '{\"id\":[\"\"],\"coverImage\":[\"/profile/upload/category/cover/2020-11-27/file20201127111918.jpg\"],\"coverImageId\":[\"46\"],\"categoryName\":[\"Shonen\"],\"status\":[\"0\"],\"recommendedAge\":[\"18+\"],\"remark\":[\"test\"]}', 'null', 1, 'Cannot invoke \"com.smanga.business.domain.MangaCategory.getCoverImageId()\" because \"mangaCategoryRef\" is null', '2020-11-27 11:28:22'),
(181, 'Manga Category', 2, 'com.smanga.web.controller.business.BusinessMangaCategoryController.editSave()', 'POST', 1, 'admin', 'IT', '/business/category/edit', '127.0.0.1', 'Intranet IP', '{\"id\":[\"\"],\"coverImage\":[\"/profile/upload/category/cover/2020-11-27/file20201127111918.jpg\"],\"coverImageId\":[\"46\"],\"categoryName\":[\"Shonen\"],\"status\":[\"1\"],\"recommendedAge\":[\"18+\"],\"remark\":[\"test\"]}', 'null', 1, 'Cannot invoke \"com.smanga.business.domain.MangaCategory.getCoverImageId()\" because \"mangaCategoryRef\" is null', '2020-11-27 11:30:29'),
(182, 'Manga Category', 2, 'com.smanga.web.controller.business.BusinessMangaCategoryController.editSave()', 'POST', 1, 'admin', 'IT', '/business/category/edit', '127.0.0.1', 'Intranet IP', '{\"id\":[\"\"],\"coverImage\":[\"/profile/upload/category/cover/2020-11-27/file20201127111918.jpg\"],\"coverImageId\":[\"46\"],\"categoryName\":[\"Shonen\"],\"status\":[\"1\"],\"recommendedAge\":[\"18+\"],\"remark\":[\"test\"]}', 'null', 1, 'Cannot invoke \"com.smanga.business.domain.MangaCategory.getCoverImageId()\" because \"mangaCategoryRef\" is null', '2020-11-27 11:30:30'),
(183, 'Manga Category', 2, 'com.smanga.web.controller.business.BusinessMangaCategoryController.editSave()', 'POST', 1, 'admin', 'IT', '/business/category/edit', '127.0.0.1', 'Intranet IP', '{\"id\":[\"\"],\"coverImage\":[\"/profile/upload/category/cover/2020-11-27/file20201127111918.jpg\"],\"coverImageId\":[\"46\"],\"categoryName\":[\"Shonen\"],\"status\":[\"1\"],\"recommendedAge\":[\"18+\"],\"remark\":[\"test\"]}', 'null', 1, 'Cannot invoke \"com.smanga.business.domain.MangaCategory.getCoverImageId()\" because \"mangaCategoryRef\" is null', '2020-11-27 11:30:32'),
(184, 'Manga Category', 2, 'com.smanga.web.controller.business.BusinessMangaCategoryController.editSave()', 'POST', 1, 'admin', 'IT', '/business/category/edit', '127.0.0.1', 'Intranet IP', '{\"id\":[\"\"],\"coverImage\":[\"/profile/upload/category/cover/2020-11-27/file20201127111918.jpg\"],\"coverImageId\":[\"46\"],\"categoryName\":[\"Shonen\"],\"status\":[\"1\"],\"recommendedAge\":[\"18+\"],\"remark\":[\"test\"]}', 'null', 1, 'Cannot invoke \"com.smanga.business.domain.MangaCategory.getCoverImageId()\" because \"mangaCategoryRef\" is null', '2020-11-27 11:31:56'),
(185, 'Manga Category', 2, 'com.smanga.web.controller.business.BusinessMangaCategoryController.editSave()', 'POST', 1, 'admin', 'IT', '/business/category/edit', '127.0.0.1', 'Intranet IP', '{\"id\":[\"6\"],\"coverImage\":[\"/profile/upload/category/cover/2020-11-27/file20201127111918.jpg\"],\"coverImageId\":[\"46\"],\"categoryName\":[\"Shonen\"],\"status\":[\"1\"],\"recommendedAge\":[\"18+\"],\"remark\":[\"test\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-27 11:40:13'),
(186, 'Manga Category', 2, 'com.smanga.web.controller.business.BusinessMangaCategoryController.editSave()', 'POST', 1, 'admin', 'IT', '/business/category/edit', '127.0.0.1', 'Intranet IP', '{\"id\":[\"6\"],\"coverImage\":[\"/profile/upload/category/cover/2020-11-27/file20201127111918.jpg\"],\"coverImageId\":[\"46\"],\"categoryName\":[\"Shonen\"],\"status\":[\"0\"],\"recommendedAge\":[\"18+\"],\"remark\":[\"test\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-27 11:40:16');
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`) VALUES
(187, 'Manga Category', 2, 'com.smanga.web.controller.business.BusinessMangaCategoryController.editSave()', 'POST', 1, 'admin', 'IT', '/business/category/edit', '127.0.0.1', 'Intranet IP', '{\"id\":[\"6\"],\"coverImage\":[\"/profile/upload/category/cover/2020-11-27/file20201127111918.jpg\"],\"coverImageId\":[\"46\"],\"categoryName\":[\"Shonen\"],\"status\":[\"1\"],\"recommendedAge\":[\"18+\"],\"remark\":[\"test\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-27 11:41:27'),
(188, 'Manga Category', 2, 'com.smanga.web.controller.business.BusinessMangaCategoryController.editSave()', 'POST', 1, 'admin', 'IT', '/business/category/edit', '127.0.0.1', 'Intranet IP', '{\"id\":[\"6\"],\"coverImage\":[\"/profile/upload/category/cover/2020-11-27/file20201127111918.jpg\"],\"coverImageId\":[\"46\"],\"categoryName\":[\"Shonen\"],\"status\":[\"0\"],\"recommendedAge\":[\"18+\"],\"remark\":[\"test\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-27 11:41:31'),
(189, 'Manga Category', 2, 'com.smanga.web.controller.business.BusinessMangaCategoryController.editSave()', 'POST', 1, 'admin', 'IT', '/business/category/edit', '127.0.0.1', 'Intranet IP', '{\"id\":[\"6\"],\"coverImage\":[\"/profile/upload/category/cover/2020-11-27/file20201127111918.jpg\"],\"coverImageId\":[\"46\"],\"categoryName\":[\"Shonen\"],\"status\":[\"1\"],\"recommendedAge\":[\"18+\"],\"remark\":[\"test\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-27 11:45:17'),
(190, 'Manga Category', 2, 'com.smanga.web.controller.business.BusinessMangaCategoryController.editSave()', 'POST', 1, 'admin', 'IT', '/business/category/edit', '127.0.0.1', 'Intranet IP', '{\"id\":[\"6\"],\"coverImage\":[\"\"],\"coverImageId\":[\"47\"],\"categoryName\":[\"Shonen\"],\"status\":[\"1\"],\"recommendedAge\":[\"18+\"],\"remark\":[\"test\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-27 11:59:51'),
(191, 'Manga Category', 3, 'com.smanga.web.controller.business.BusinessMangaCategoryController.remove()', 'POST', 1, 'admin', 'IT', '/business/category/remove', '127.0.0.1', 'Intranet IP', '{\"ids\":[\"6\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-27 12:55:08'),
(192, 'Manga Category', 1, 'com.smanga.web.controller.business.BusinessMangaCategoryController.addSave()', 'POST', 1, 'admin', 'IT', '/business/category/add', '127.0.0.1', 'Intranet IP', '{\"coverImage\":[\"\"],\"coverImageId\":[\"\"],\"categoryName\":[\"Shonen\"],\"status\":[\"0\"],\"recommendedAge\":[\"18+\"],\"remark\":[\"test\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-27 12:55:21'),
(193, 'Manga Category', 2, 'com.smanga.web.controller.business.BusinessMangaCategoryController.editSave()', 'POST', 1, 'admin', 'IT', '/business/category/edit', '127.0.0.1', 'Intranet IP', '{\"id\":[\"7\"],\"coverImage\":[\"\"],\"coverImageId\":[\"\"],\"categoryName\":[\"Shonen\"],\"status\":[\"0\"],\"recommendedAge\":[\"18+\"],\"remark\":[\"test\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-27 12:55:28'),
(194, 'Manga Category', 2, 'com.smanga.web.controller.business.BusinessMangaCategoryController.editSave()', 'POST', 1, 'admin', 'IT', '/business/category/edit', '127.0.0.1', 'Intranet IP', '{\"id\":[\"7\"],\"coverImage\":[\"/profile/upload/category/cover/2020-11-27/file20201127125542.jpg\"],\"coverImageId\":[\"48\"],\"categoryName\":[\"Shonen\"],\"status\":[\"0\"],\"recommendedAge\":[\"18+\"],\"remark\":[\"test\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-27 12:55:43'),
(195, 'Manga Category', 2, 'com.smanga.web.controller.business.BusinessMangaCategoryController.editSave()', 'POST', 1, 'admin', 'IT', '/business/category/edit', '127.0.0.1', 'Intranet IP', '{\"id\":[\"7\"],\"coverImage\":[\"\"],\"coverImageId\":[\"\"],\"categoryName\":[\"Shonen\"],\"status\":[\"0\"],\"recommendedAge\":[\"18+\"],\"remark\":[\"test\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-27 12:56:03'),
(196, 'Manga Category', 2, 'com.smanga.web.controller.business.BusinessMangaCategoryController.editSave()', 'POST', 1, 'admin', 'IT', '/business/category/edit', '127.0.0.1', 'Intranet IP', '{\"id\":[\"7\"],\"coverImage\":[\"/profile/upload/category/cover/2020-11-27/file20201127125610.jpg\"],\"coverImageId\":[\"49\"],\"categoryName\":[\"Shonen\"],\"status\":[\"0\"],\"recommendedAge\":[\"18+\"],\"remark\":[\"test\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-27 12:56:11'),
(197, 'Manga Category', 2, 'com.smanga.web.controller.business.BusinessMangaCategoryController.editSave()', 'POST', 1, 'admin', 'IT', '/business/category/edit', '127.0.0.1', 'Intranet IP', '{\"id\":[\"7\"],\"coverImage\":[\"\"],\"coverImageId\":[\"\"],\"categoryName\":[\"Shonen\"],\"status\":[\"0\"],\"recommendedAge\":[\"18+\"],\"remark\":[\"test\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-27 12:56:39'),
(198, 'Manga Category', 2, 'com.smanga.web.controller.business.BusinessMangaCategoryController.editSave()', 'POST', 1, 'admin', 'IT', '/business/category/edit', '127.0.0.1', 'Intranet IP', '{\"id\":[\"7\"],\"coverImage\":[\"/profile/upload/category/cover/2020-11-27/file20201127125722.jpg\"],\"coverImageId\":[\"50\"],\"categoryName\":[\"Shonen\"],\"status\":[\"0\"],\"recommendedAge\":[\"18+\"],\"remark\":[\"test\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-27 12:57:23'),
(199, 'Manga Category', 2, 'com.smanga.web.controller.business.BusinessMangaCategoryController.editSave()', 'POST', 1, 'admin', 'IT', '/business/category/edit', '127.0.0.1', 'Intranet IP', '{\"id\":[\"7\"],\"coverImage\":[\"\"],\"coverImageId\":[\"\"],\"categoryName\":[\"Shonen\"],\"status\":[\"0\"],\"recommendedAge\":[\"18+\"],\"remark\":[\"test\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-27 12:57:39'),
(200, 'Manga Category', 2, 'com.smanga.web.controller.business.BusinessMangaCategoryController.editSave()', 'POST', 1, 'admin', 'IT', '/business/category/edit', '127.0.0.1', 'Intranet IP', '{\"id\":[\"7\"],\"coverImage\":[\"/profile/upload/category/cover/2020-11-27/file20201127125817.jpg\"],\"coverImageId\":[\"51\"],\"categoryName\":[\"Shonen\"],\"status\":[\"1\"],\"recommendedAge\":[\"18+\"],\"remark\":[\"test\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-27 12:58:18'),
(201, 'Manga Category', 2, 'com.smanga.web.controller.business.BusinessMangaCategoryController.editSave()', 'POST', 1, 'admin', 'IT', '/business/category/edit', '127.0.0.1', 'Intranet IP', '{\"id\":[\"7\"],\"coverImage\":[\"\"],\"coverImageId\":[\"\"],\"categoryName\":[\"Shonen\"],\"status\":[\"1\"],\"recommendedAge\":[\"18+\"],\"remark\":[\"test\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-27 12:59:09'),
(202, 'Manga Category', 2, 'com.smanga.web.controller.business.BusinessMangaCategoryController.editSave()', 'POST', 1, 'admin', 'IT', '/business/category/edit', '127.0.0.1', 'Intranet IP', '{\"id\":[\"7\"],\"coverImage\":[\"/profile/upload/category/cover/2020-11-27/file20201127125914.jpg\"],\"coverImageId\":[\"52\"],\"categoryName\":[\"Shonen\"],\"status\":[\"1\"],\"recommendedAge\":[\"18+\"],\"remark\":[\"test\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-27 12:59:14'),
(203, 'Manga Category', 2, 'com.smanga.web.controller.business.BusinessMangaCategoryController.editSave()', 'POST', 1, 'admin', 'IT', '/business/category/edit', '127.0.0.1', 'Intranet IP', '{\"id\":[\"7\"],\"coverImage\":[\"/profile/upload/category/cover/2020-11-27/file20201127130122.jpg\"],\"coverImageId\":[\"53\"],\"categoryName\":[\"Shonen\"],\"status\":[\"1\"],\"recommendedAge\":[\"18+\"],\"remark\":[\"test\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-27 13:01:23'),
(204, 'Manga Category', 2, 'com.smanga.web.controller.business.BusinessMangaCategoryController.editSave()', 'POST', 1, 'admin', 'IT', '/business/category/edit', '127.0.0.1', 'Intranet IP', '{\"id\":[\"7\"],\"coverImage\":[\"/profile/upload/category/cover/2020-11-27/file20201127130204.jpg\"],\"coverImageId\":[\"54\"],\"categoryName\":[\"Shonen\"],\"status\":[\"1\"],\"recommendedAge\":[\"18+\"],\"remark\":[\"test\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-27 13:02:06'),
(205, 'Manga Category', 2, 'com.smanga.web.controller.business.BusinessMangaCategoryController.editSave()', 'POST', 1, 'admin', 'IT', '/business/category/edit', '127.0.0.1', 'Intranet IP', '{\"id\":[\"7\"],\"coverImage\":[\"/profile/upload/category/cover/2020-11-27/file20201127130204.jpg\"],\"coverImageId\":[\"54\"],\"categoryName\":[\"Shonen\"],\"status\":[\"1\"],\"recommendedAge\":[\"18+\"],\"remark\":[\"test\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-27 13:02:10'),
(206, 'Manga Category', 2, 'com.smanga.web.controller.business.BusinessMangaCategoryController.editSave()', 'POST', 1, 'admin', 'IT', '/business/category/edit', '127.0.0.1', 'Intranet IP', '{\"id\":[\"7\"],\"coverImage\":[\"/profile/upload/category/cover/2020-11-27/file20201127130526.jpg\"],\"coverImageId\":[\"55\"],\"categoryName\":[\"Shonen\"],\"status\":[\"1\"],\"recommendedAge\":[\"18+\"],\"remark\":[\"test\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-27 13:05:27'),
(207, 'Manga Category', 2, 'com.smanga.web.controller.business.BusinessMangaCategoryController.editSave()', 'POST', 1, 'admin', 'IT', '/business/category/edit', '127.0.0.1', 'Intranet IP', '{\"id\":[\"7\"],\"coverImage\":[\"/profile/upload/category/cover/2020-11-27/file20201127130723.jpg\"],\"coverImageId\":[\"56\"],\"categoryName\":[\"Shonen\"],\"status\":[\"1\"],\"recommendedAge\":[\"18+\"],\"remark\":[\"test\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-27 13:07:24'),
(208, 'Manga Category', 2, 'com.smanga.web.controller.business.BusinessMangaCategoryController.editSave()', 'POST', 1, 'admin', 'IT', '/business/category/edit', '127.0.0.1', 'Intranet IP', '{\"id\":[\"7\"],\"coverImage\":[\"/profile/upload/category/cover/2020-11-27/file20201127130730.jpg\"],\"coverImageId\":[\"57\"],\"categoryName\":[\"Shonen\"],\"status\":[\"1\"],\"recommendedAge\":[\"18+\"],\"remark\":[\"test\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-27 13:07:31'),
(209, 'Manga Category', 2, 'com.smanga.web.controller.business.BusinessMangaCategoryController.editSave()', 'POST', 1, 'admin', 'IT', '/business/category/edit', '127.0.0.1', 'Intranet IP', '{\"id\":[\"7\"],\"coverImage\":[\"\"],\"coverImageId\":[\"\"],\"categoryName\":[\"Shonen\"],\"status\":[\"1\"],\"recommendedAge\":[\"18+\"],\"remark\":[\"test\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-27 13:07:37'),
(210, 'Manga Category', 2, 'com.smanga.web.controller.business.BusinessMangaCategoryController.editSave()', 'POST', 1, 'admin', 'IT', '/business/category/edit', '127.0.0.1', 'Intranet IP', '{\"id\":[\"7\"],\"coverImage\":[\"/profile/upload/category/cover/2020-11-27/file20201127130805.jpg\"],\"coverImageId\":[\"58\"],\"categoryName\":[\"Shonen\"],\"status\":[\"1\"],\"recommendedAge\":[\"18+\"],\"remark\":[\"test\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-27 13:08:06'),
(211, 'Dictionary Type', 1, 'com.smanga.web.controller.system.SysDictTypeController.addSave()', 'POST', 1, 'admin', 'IT', '/system/dict/add', '127.0.0.1', 'Intranet IP', '{\"dictName\":[\"Language\"],\"dictType\":[\"sys_manga_lang\"],\"status\":[\"0\"],\"remark\":[\"Manga language\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-27 13:46:42'),
(212, 'Dictionary Data', 1, 'com.smanga.web.controller.system.SysDictDataController.addSave()', 'POST', 1, 'admin', 'IT', '/system/dict/data/add', '127.0.0.1', 'Intranet IP', '{\"dictLabel\":[\"English\"],\"dictValue\":[\"en\"],\"dictType\":[\"sys_manga_lang\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-27 13:48:11'),
(213, 'Dictionary Data', 1, 'com.smanga.web.controller.system.SysDictDataController.addSave()', 'POST', 1, 'admin', 'IT', '/system/dict/data/add', '127.0.0.1', 'Intranet IP', '{\"dictLabel\":[\"Japanese\"],\"dictValue\":[\"jp\"],\"dictType\":[\"sys_manga_lang\"],\"cssClass\":[\"\"],\"dictSort\":[\"2\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-27 13:48:31'),
(214, 'Dictionary Data', 1, 'com.smanga.web.controller.system.SysDictDataController.addSave()', 'POST', 1, 'admin', 'IT', '/system/dict/data/add', '127.0.0.1', 'Intranet IP', '{\"dictLabel\":[\"Vietnamese\"],\"dictValue\":[\"vi\"],\"dictType\":[\"sys_manga_lang\"],\"cssClass\":[\"\"],\"dictSort\":[\"3\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-27 13:49:55'),
(215, 'Manga Category', 1, 'com.smanga.web.controller.business.BusinessMangaCategoryController.addSave()', 'POST', 1, 'admin', 'IT', '/business/category/add', '127.0.0.1', 'Intranet IP', '{\"categoryName\":[\"Comedy\"],\"status\":[\"1\"],\"coverImage\":[\"/profile/upload/category/cover/2020-11-27/file20201127191125.jpg\"],\"coverImageId\":[\"59\"],\"recommendedAge\":[\"18+\"],\"remark\":[\"test\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-27 19:11:30'),
(216, 'Manga Category', 1, 'com.smanga.web.controller.business.BusinessMangaCategoryController.addSave()', 'POST', 1, 'admin', 'IT', '/business/category/add', '127.0.0.1', 'Intranet IP', '{\"categoryName\":[\"Slice of life\"],\"status\":[\"1\"],\"coverImage\":[\"\"],\"coverImageId\":[\"\"],\"recommendedAge\":[\"18+\"],\"remark\":[\"test\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-27 19:11:45'),
(217, 'Manga Category', 2, 'com.smanga.web.controller.business.BusinessMangaCategoryController.editSave()', 'POST', 1, 'admin', 'IT', '/business/category/edit', '127.0.0.1', 'Intranet IP', '{\"id\":[\"9\"],\"categoryName\":[\"Slice of life\"],\"status\":[\"1\"],\"coverImage\":[\"/profile/upload/category/cover/2020-11-27/file20201127191150.jpg\"],\"coverImageId\":[\"60\"],\"recommendedAge\":[\"18+\"],\"remark\":[\"test\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-27 19:11:51'),
(218, 'Manga', 1, 'com.smanga.web.controller.business.BusinessMangaController.addSave()', 'POST', 1, 'admin', 'IT', '/business/manga/add', '127.0.0.1', 'Intranet IP', '{\"mangaName\":[\"To love ru\"],\"categories\":[\"Comedy,Slice of life\"],\"categoryIds\":[\"8,9\"],\"author\":[\"\"],\"authorId\":[\"\"],\"remark\":[\"<p><br></p>\"],\"coverImage\":[\"\"],\"coverImageId\":[\"\"],\"slideImage\":[\"\"],\"slideImageId\":[\"\"],\"recommendedAge\":[\"\"],\"status\":[\"1\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-27 19:12:20'),
(219, 'Code generation', 6, 'com.smanga.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', 'IT', '/tool/gen/importTable', '127.0.0.1', 'Intranet IP', '{\"tables\":[\"artist\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-29 09:53:18'),
(220, 'Code generation', 2, 'com.smanga.generator.controller.GenController.editSave()', 'POST', 1, 'admin', 'IT', '/tool/gen/edit', '127.0.0.1', 'Intranet IP', '{\"tableId\":[\"7\"],\"tableName\":[\"artist\"],\"tableComment\":[\"artist\"],\"className\":[\"Artist\"],\"functionAuthor\":[\"Trong Hieu\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"88\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"Serial ID\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"89\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"Artist name\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"artistName\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"LIKE\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"90\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"Artist information\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"artistInfo\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"91\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"Number of reader like this artist\"],\"columns[3].javaType\":[\"Integer\"],\"columns[3].javaField\":[\"artistCounter\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"92\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"Remark\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"remark\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"textarea\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"93\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"Delete flag (0 means existe', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-29 09:53:55'),
(221, 'Code generation', 8, 'com.smanga.generator.controller.GenController.download()', 'GET', 1, 'admin', 'IT', '/tool/gen/download/artist', '127.0.0.1', 'Intranet IP', NULL, 'null', 0, NULL, '2020-11-29 09:53:59'),
(222, 'Manga', 1, 'com.smanga.web.controller.business.BusinessMangaController.addSave()', 'POST', 1, 'admin', 'IT', '/business/manga/add', '127.0.0.1', 'Intranet IP', '{\"mangaName\":[\"test\"],\"categories\":[\"Shonen\"],\"categoryIds\":[\"7\"],\"author\":[\"\"],\"authorId\":[\"\"],\"artist\":[\"\"],\"artistId\":[\"\"],\"remark\":[\"<p><b>abc</b></p>\"],\"coverImage\":[\"\"],\"coverImageId\":[\"\"],\"slideImage\":[\"\"],\"slideImageId\":[\"\"],\"recommendedAge\":[\"12\"],\"status\":[\"1\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-29 10:20:36'),
(223, 'Manga', 1, 'com.smanga.web.controller.business.BusinessMangaController.addSave()', 'POST', 1, 'admin', 'IT', '/business/manga/add', '127.0.0.1', 'Intranet IP', '{\"mangaName\":[\"abc\"],\"categories\":[\"Shonen\"],\"categoryIds\":[\"7\"],\"author\":[\"\"],\"authorId\":[\"\"],\"artist\":[\"\"],\"artistId\":[\"\"],\"remark\":[\"<p><br></p>\"],\"coverImage\":[\"/profile/upload/manga/cover/2020-11-29/file20201129104912.jpg\"],\"coverImageId\":[\"66\"],\"slideImage\":[\"/profile/upload/manga/slide/2020-11-29/file20201129104911.jpg\"],\"slideImageId\":[\"65\"],\"recommendedAge\":[\"12\"],\"status\":[\"1\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-29 10:49:15'),
(224, 'Manga', 2, 'com.smanga.web.controller.business.BusinessMangaController.editSave()', 'POST', 1, 'admin', 'IT', '/business/manga/edit', '127.0.0.1', 'Intranet IP', '{\"id\":[\"2\"],\"mangaName\":[\"test\"],\"categories\":[\"Shonen,Comedy\"],\"categoryIds\":[\"7,8\"],\"author\":[\"\"],\"authorId\":[\"\"],\"artist\":[\"\"],\"artistId\":[\"\"],\"remark\":[\"<p><b>abc</b></p>\"],\"coverImage\":[\"\"],\"coverImageId\":[\"\"],\"slideImage\":[\"\"],\"slideImageId\":[\"\"],\"recommendedAge\":[\"12\"],\"status\":[\"1\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-29 15:27:03'),
(225, 'Manga', 2, 'com.smanga.web.controller.business.BusinessMangaController.editSave()', 'POST', 1, 'admin', 'IT', '/business/manga/edit', '127.0.0.1', 'Intranet IP', '{\"id\":[\"2\"],\"mangaName\":[\"test\"],\"categories\":[\"Shonen\"],\"categoryIds\":[\"7\"],\"author\":[\"\"],\"authorId\":[\"\"],\"artist\":[\"\"],\"artistId\":[\"\"],\"remark\":[\"<p><b>abc</b></p>\"],\"coverImage\":[\"\"],\"coverImageId\":[\"\"],\"slideImage\":[\"\"],\"slideImageId\":[\"\"],\"recommendedAge\":[\"12\"],\"status\":[\"1\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-29 15:27:08'),
(226, 'Manga', 2, 'com.smanga.web.controller.business.BusinessMangaController.editSave()', 'POST', 1, 'admin', 'IT', '/business/manga/edit', '127.0.0.1', 'Intranet IP', '{\"id\":[\"1\"],\"mangaName\":[\"To love ru\"],\"categories\":[\"Comedy,Slice of life,Shonen\"],\"categoryIds\":[\"8,9,7\"],\"author\":[\"\"],\"authorId\":[\"\"],\"artist\":[\"\"],\"artistId\":[\"\"],\"remark\":[\"<p><br></p>\"],\"coverImage\":[\"\"],\"coverImageId\":[\"\"],\"slideImage\":[\"\"],\"slideImageId\":[\"\"],\"recommendedAge\":[\"\"],\"status\":[\"1\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-29 15:30:24'),
(227, 'Manga', 2, 'com.smanga.web.controller.business.BusinessMangaController.editSave()', 'POST', 1, 'admin', 'IT', '/business/manga/edit', '127.0.0.1', 'Intranet IP', '{\"id\":[\"1\"],\"mangaName\":[\"To love ru\"],\"categories\":[\"Comedy,Slice of life,Shonen\"],\"categoryIds\":[\"8,9,7\"],\"author\":[\"\"],\"authorId\":[\"\"],\"artist\":[\"\"],\"artistId\":[\"\"],\"remark\":[\"<p><b>abc</b></p>\"],\"coverImage\":[\"\"],\"coverImageId\":[\"\"],\"slideImage\":[\"\"],\"slideImageId\":[\"\"],\"recommendedAge\":[\"\"],\"status\":[\"1\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-29 15:30:31'),
(228, 'Manga', 2, 'com.smanga.web.controller.business.BusinessMangaController.editSave()', 'POST', 1, 'admin', 'IT', '/business/manga/edit', '127.0.0.1', 'Intranet IP', '{\"id\":[\"1\"],\"mangaName\":[\"To love ru\"],\"categories\":[\"Comedy,Slice of life,Shonen\"],\"categoryIds\":[\"8,9,7\"],\"author\":[\"\"],\"authorId\":[\"\"],\"artist\":[\"\"],\"artistId\":[\"\"],\"remark\":[\"<p><b>abc</b></p>\"],\"coverImage\":[\"/profile/upload/manga/cover/2020-11-29/file20201129153037.jpg\"],\"coverImageId\":[\"67\"],\"slideImage\":[\"/profile/upload/manga/slide/2020-11-29/file20201129153052.png\"],\"slideImageId\":[\"69\"],\"recommendedAge\":[\"123\"],\"status\":[\"1\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-29 15:30:53'),
(229, 'Manga', 2, 'com.smanga.web.controller.business.BusinessMangaController.editSave()', 'POST', 1, 'admin', 'IT', '/business/manga/edit', '127.0.0.1', 'Intranet IP', '{\"id\":[\"1\"],\"mangaName\":[\"To love ru\"],\"categories\":[\"Comedy,Slice of life,Shonen\"],\"categoryIds\":[\"8,9,7\"],\"author\":[\"\"],\"authorId\":[\"\"],\"artist\":[\"\"],\"artistId\":[\"\"],\"remark\":[\"<p><b>abc</b></p>\"],\"coverImage\":[\"/profile/upload/manga/cover/2020-11-29/file20201129153037.jpg\"],\"coverImageId\":[\"67\"],\"slideImage\":[\"/profile/upload/manga/slide/2020-11-29/file20201129153052.png\"],\"slideImageId\":[\"69\"],\"recommendedAge\":[\"123\"],\"status\":[\"0\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-29 15:31:03'),
(230, 'Manga', 2, 'com.smanga.web.controller.business.BusinessMangaController.editSave()', 'POST', 1, 'admin', 'IT', '/business/manga/edit', '127.0.0.1', 'Intranet IP', '{\"id\":[\"1\"],\"mangaName\":[\"To love ru\"],\"categories\":[\"Comedy,Slice of life,Shonen\"],\"categoryIds\":[\"8,9,7\"],\"author\":[\"\"],\"authorId\":[\"\"],\"artist\":[\"\"],\"artistId\":[\"\"],\"remark\":[\"<p><b>abc</b></p>\"],\"coverImage\":[\"/profile/upload/manga/cover/2020-11-29/file20201129153037.jpg\"],\"coverImageId\":[\"67\"],\"slideImage\":[\"/profile/upload/manga/slide/2020-11-29/file20201129153118.png\"],\"slideImageId\":[\"70\"],\"recommendedAge\":[\"123\"],\"status\":[\"0\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-29 15:31:19'),
(231, 'Menu Management', 1, 'com.smanga.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', 'IT', '/system/menu/add', '127.0.0.1', 'Intranet IP', '{\"parentId\":[\"2002\"],\"menuType\":[\"C\"],\"menuName\":[\"Artist\"],\"url\":[\"/business/artist\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-photo\"],\"visible\":[\"0\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-29 15:33:28'),
(232, 'Author', 1, 'com.smanga.web.controller.business.BusinessAuthorController.addSave()', 'POST', 1, 'admin', 'IT', '/business/author/add', '127.0.0.1', 'Intranet IP', '{\"authorName\":[\"Ero manga sensei\"],\"authorInfo\":[\"<p>123123 sdf<b>&nbsp;sdfsdfsd&nbsp;<u>&nbsp;sdfsdfsd</u></b></p><table class=\\\"table table-bordered\\\"><tbody><tr><td>sdfsdf</td><td>dfds</td></tr><tr><td>sdf</td><td>sdf</td></tr><tr><td>dsf</td><td>dsf</td></tr></tbody></table><p><b><u><br></u></b></p>\"],\"remark\":[\"123\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-29 15:48:05'),
(233, 'Author', 2, 'com.smanga.web.controller.business.BusinessAuthorController.editSave()', 'POST', 1, 'admin', 'IT', '/business/author/edit', '127.0.0.1', 'Intranet IP', '{\"id\":[\"1\"],\"authorName\":[\"Ero manga sensei\"],\"authorInfo\":[\"<p>123123 sdf<b>&nbsp;sdfsdfsd&nbsp;<u>&nbsp;sdfsdfsd</u></b></p><p><b><u><br></u></b></p>\"],\"remark\":[\"123\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-29 15:52:04'),
(234, 'artist', 1, 'com.smanga.web.controller.business.BusinessArtistController.addSave()', 'POST', 1, 'admin', 'IT', '/business/artist/add', '127.0.0.1', 'Intranet IP', '{\"artistName\":[\"absd\"],\"artistInfo\":[\"<p>sdf</p>\"],\"remark\":[\"sdf\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-29 16:04:08'),
(235, 'artist', 2, 'com.smanga.web.controller.business.BusinessArtistController.editSave()', 'POST', 1, 'admin', 'IT', '/business/artist/edit', '127.0.0.1', 'Intranet IP', '{\"id\":[\"1\"],\"artistName\":[\"absd\"],\"artistInfo\":[\"<p>sdfdf</p>\"],\"remark\":[\"sdfdf\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-29 16:04:12'),
(236, 'artist', 2, 'com.smanga.web.controller.business.BusinessArtistController.editSave()', 'POST', 1, 'admin', 'IT', '/business/artist/edit', '127.0.0.1', 'Intranet IP', '{\"id\":[\"1\"],\"artistName\":[\"absdasd\"],\"artistInfo\":[\"<p>sdfdf</p>\"],\"remark\":[\"sdfdf\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-29 16:04:14'),
(237, 'artist', 2, 'com.smanga.web.controller.business.BusinessArtistController.editSave()', 'POST', 1, 'admin', 'IT', '/business/artist/edit', '127.0.0.1', 'Intranet IP', '{\"id\":[\"1\"],\"artistName\":[\"absdasd\"],\"artistInfo\":[\"<p>sdfdf</p>\"],\"remark\":[\"sdfdf\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-29 16:04:16'),
(238, 'Manga', 2, 'com.smanga.web.controller.business.BusinessMangaController.editSave()', 'POST', 1, 'admin', 'IT', '/business/manga/edit', '127.0.0.1', 'Intranet IP', '{\"id\":[\"1\"],\"mangaName\":[\"To love ru\"],\"categories\":[\"Comedy,Slice of life,Shonen\"],\"categoryIds\":[\"8,9,7\"],\"author\":[\"Ero manga sensei\"],\"authorId\":[\"1\"],\"artist\":[\"absdasd\"],\"artistId\":[\"1\"],\"remark\":[\"<p><b>abc</b></p>\"],\"coverImage\":[\"/profile/upload/manga/cover/2020-11-29/file20201129153037.jpg\"],\"coverImageId\":[\"67\"],\"slideImage\":[\"/profile/upload/manga/slide/2020-11-29/file20201129153118.png\"],\"slideImageId\":[\"70\"],\"recommendedAge\":[\"123\"],\"status\":[\"0\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-29 16:04:27'),
(239, 'Manga', 2, 'com.smanga.web.controller.business.BusinessMangaController.editSave()', 'POST', 1, 'admin', 'IT', '/business/manga/edit', '127.0.0.1', 'Intranet IP', '{\"id\":[\"3\"],\"mangaName\":[\"abc\"],\"categories\":[\"Shonen\"],\"categoryIds\":[\"7\"],\"author\":[\"Ero manga sensei\"],\"authorId\":[\"1\"],\"artist\":[\"absdasd\"],\"artistId\":[\"1\"],\"remark\":[\"<p><br></p>\"],\"coverImage\":[\"/profile/upload/manga/cover/2020-11-29/file20201129104912.jpg\"],\"coverImageId\":[\"66\"],\"slideImage\":[\"/profile/upload/manga/slide/2020-11-29/file20201129104911.jpg\"],\"slideImageId\":[\"65\"],\"recommendedAge\":[\"12\"],\"status\":[\"1\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-29 16:04:32'),
(240, 'Manga', 2, 'com.smanga.web.controller.business.BusinessMangaController.editSave()', 'POST', 1, 'admin', 'IT', '/business/manga/edit', '127.0.0.1', 'Intranet IP', '{\"id\":[\"2\"],\"mangaName\":[\"test\"],\"categories\":[\"Shonen\"],\"categoryIds\":[\"7\"],\"author\":[\"Ero manga sensei\"],\"authorId\":[\"1\"],\"artist\":[\"absdasd\"],\"artistId\":[\"1\"],\"remark\":[\"<p><b>abc</b></p>\"],\"coverImage\":[\"\"],\"coverImageId\":[\"\"],\"slideImage\":[\"\"],\"slideImageId\":[\"\"],\"recommendedAge\":[\"12\"],\"status\":[\"1\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-29 16:04:40'),
(241, 'Manga Chapter', 1, 'com.smanga.web.controller.business.BusinessMangaChapterController.addSave()', 'POST', 1, 'admin', 'IT', '/business/chapter/add', '127.0.0.1', 'Intranet IP', '{\"mangaId\":[\"2\"],\"chapterName\":[\"chapter test\"],\"chapterIndex\":[\"1\"],\"chapterLang\":[\"en\"],\"remark\":[\"test\"],\"status\":[\"0\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-29 17:47:09'),
(242, 'Manga Chapter', 2, 'com.smanga.web.controller.business.BusinessMangaChapterController.editSave()', 'POST', 1, 'admin', 'IT', '/business/chapter/edit', '127.0.0.1', 'Intranet IP', '{\"id\":[\"1\"],\"chapterName\":[\"chapter test\"],\"chapterIndex\":[\"1\"],\"chapterLang\":[\"jp\"],\"remark\":[\"test\"],\"status\":[\"1\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-29 17:56:06'),
(243, 'Manga Chapter', 2, 'com.smanga.web.controller.business.BusinessMangaChapterController.editSave()', 'POST', 1, 'admin', 'IT', '/business/chapter/edit', '127.0.0.1', 'Intranet IP', '{\"id\":[\"1\"],\"chapterName\":[\"chapter test\"],\"chapterIndex\":[\"1\"],\"chapterLang\":[\"vi\"],\"remark\":[\"test\"],\"status\":[\"1\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-29 17:56:13'),
(244, 'Manga Chapter', 2, 'com.smanga.web.controller.business.BusinessMangaChapterController.editSave()', 'POST', 1, 'admin', 'IT', '/business/chapter/edit', '127.0.0.1', 'Intranet IP', '{\"id\":[\"1\"],\"chapterName\":[\"chapter test\"],\"chapterIndex\":[\"1\"],\"chapterLang\":[\"en\"],\"remark\":[\"test\"],\"status\":[\"1\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-29 17:56:17'),
(245, 'Parameter Management', 1, 'com.smanga.web.controller.system.SysConfigController.addSave()', 'POST', 1, 'admin', 'IT', '/system/config/add', '127.0.0.1', 'Intranet IP', '{\"configName\":[\"Google Service Account\"],\"configKey\":[\"google.service.account\"],\"configValue\":[\"{   \\\"type\\\": \\\"service_account\\\",   \\\"project_id\\\": \\\"smangaspringcloudvision\\\",   \\\"private_key_id\\\": \\\"6e45eaf956a92997dcb84a0a01c33f1464bfbefa\\\",   \\\"private_key\\\": \\\"-----BEGIN PRIVATE KEY-----\\\\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQDU5PQIzoyu+uF5\\\\n0gQVKRVSXita8cGoAl2PfNQleqBE/zQs5ImscqHvxKi66m1uuFa0FSiGh5sSrZzR\\\\nDJjYUPOys73w16x5BCIT54wJR0cR+vmgqGOmO8bxBnUGZWlNlgBZ0zluFnZQ6iJz\\\\nn2KhVWznIF1IHd3RCVehWRbCOtLKLCVz/vzbauZGPYclAMrHXMPniamUz4/kgAnS\\\\n8/EZdX920BcrbIzD+blpQhF1e6otsFF63BbkVM6Oa4auDPU3q19Oy42qCby0Zjl4\\\\nG6Tc0vPNFn6sHX3IOKgcmeu0sDI6CSPvDNxARvY0s92g1Rtq2Va6T4eQN1HmgeUi\\\\nVDgV8CoRAgMBAAECggEADBI/VBCCIZnQFxw1Zw3BS75TLwDuPhyEOZKWZNmjJMZj\\\\nqvf6ZnDJhdLczlxkgBars+JPPfGKdXCqp5/TOtC8QLG4X2ObP/FgDUjfw9bqzLYy\\\\nWU2y+MYC7b+z+vzdD60lr/IuG3PimYvtEClFamhxmFlZcLFg1m11LozioXi8YwIr\\\\nS5qO92Yrbn9xxzFXrCITLuWPnra0VLY/TixOTYtgtsStlk1JIJ1x8DzbrRMcCNMA\\\\nr8/1bPFyXjSfs4YpatrZIhtnsqX8VtQlIcGz33a9KXiMIr5N4mR2BTIVozQo77lb\\\\nx6vRdH9M0oEjum3QCXRfGlpWcgVMI5PiYlXMvxxqkQKBgQD1YJ+ybKxMA9k9ZXrW\\\\n++pYsxgsWsAiF+c1eClyAOIT78ucR5uEXkhQEz7kI4TfRVDZQq3NUJ4kKSxDeoJt\\\\nYg+Tj3p2ONZmQxrXqjPh7fGIh7TLwqcYHxDwXUmxeUi7swuTm3JHy2YUABmYBPVT\\\\n9tThnQXT3sMZi/HeukOmkkcXPwKBgQDeHFaSOGFEPK6r8XYMN+Y0Bl9ncC+8YB9N\\\\n2ZPm20jcowd8nRLuo4SYEO2wWyQvN81Q5TD1MSOPsIu8/a12Z10+UQ26tfnQdjil\\\\ndlscaVO8RdCkFI7hEOGyHzPstaGY+x7w+p+88WHB1w0HXGNUUUSgMMD3dR95DSCP\\\\nwraFmi06rwKBgQDOuxRw78wN0yRA7PGclOtwxZr1K5Q6ZScfzlgku4e9wkcqKM5m\\\\nrESCamSPMzmsHisqkFn75BMIZkPrqhie7YIwES7c0bAYwiqoTradf6oCHEt/bET5\\\\nNps/12jSBFv5/7QeLVYQFNawvRDTGkJS9l+OoYuaYFDBgj1KKGX8vbr1YwKBgFhE\\\\n0M7JYzZYG16v1ici6/SO98lG12G4nZg1uMaNLRaqH6aRUd3O1DoOuDdW8TlmpszY\\\\nWK2IusY29kHEWvRsPa0vTxJ9kWscIIT5VVokLafr4u/iT6n4KIm+Rsdyo2cFnZVN\\\\nNMBE+YGscjwTplHy/h/fYEC3pitYYTFgw2KzE/h3AoGBANNf4eCeSjR7xmLLwOA3\\\\nyDUdqbcNHH5JnBHDaMtwqKeH92r3m/k198/vqSTVa6a5uckbvw4uMmRbd9c67ZLM\\\\nUVw7RhdBTBtZoH7jXwLp+OKtvNzzehJyrXIYdr2qF4tvU4+YY5YqdIJUX0NQJ6SC\\\\nJW+sxzBOuftn2fwFuhKt2k/x\\\\n-', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-03 01:37:45'),
(246, 'artist', 3, 'com.smanga.web.controller.business.BusinessArtistController.remove()', 'POST', 1, 'admin', 'IT', '/business/artist/remove', '127.0.0.1', 'Intranet IP', '{\"ids\":[\"1\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-03 09:11:30'),
(247, 'Author', 3, 'com.smanga.web.controller.business.BusinessAuthorController.remove()', 'POST', 1, 'admin', 'IT', '/business/author/remove', '127.0.0.1', 'Intranet IP', '{\"ids\":[\"1\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-03 09:11:34'),
(248, 'Manga Category', 3, 'com.smanga.web.controller.business.BusinessMangaCategoryController.remove()', 'POST', 1, 'admin', 'IT', '/business/category/remove', '127.0.0.1', 'Intranet IP', '{\"ids\":[\"7\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-03 09:12:49'),
(249, 'Manga Category', 3, 'com.smanga.web.controller.business.BusinessMangaCategoryController.remove()', 'POST', 1, 'admin', 'IT', '/business/category/remove', '127.0.0.1', 'Intranet IP', '{\"ids\":[\"8\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-03 09:12:50'),
(250, 'Manga Category', 3, 'com.smanga.web.controller.business.BusinessMangaCategoryController.remove()', 'POST', 1, 'admin', 'IT', '/business/category/remove', '127.0.0.1', 'Intranet IP', '{\"ids\":[\"9\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-03 09:12:52'),
(251, 'Manga', 3, 'com.smanga.web.controller.business.BusinessMangaController.remove()', 'POST', 1, 'admin', 'IT', '/business/manga/remove', '127.0.0.1', 'Intranet IP', '{\"ids\":[\"1\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-03 09:12:55'),
(252, 'Manga', 3, 'com.smanga.web.controller.business.BusinessMangaController.remove()', 'POST', 1, 'admin', 'IT', '/business/manga/remove', '127.0.0.1', 'Intranet IP', '{\"ids\":[\"2\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-03 09:12:56'),
(253, 'Manga', 3, 'com.smanga.web.controller.business.BusinessMangaController.remove()', 'POST', 1, 'admin', 'IT', '/business/manga/remove', '127.0.0.1', 'Intranet IP', '{\"ids\":[\"3\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-03 09:12:58'),
(254, 'Manga Category', 1, 'com.smanga.web.controller.business.BusinessMangaCategoryController.addSave()', 'POST', 1, 'admin', 'IT', '/business/category/add', '127.0.0.1', 'Intranet IP', '{\"categoryName\":[\"Comedy\"],\"status\":[\"1\"],\"coverImage\":[\"\"],\"coverImageId\":[\"\"],\"recommendedAge\":[\"\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-03 19:18:45'),
(255, 'Author', 1, 'com.smanga.web.controller.business.BusinessAuthorController.addSave()', 'POST', 1, 'admin', 'IT', '/business/author/add', '127.0.0.1', 'Intranet IP', '{\"authorName\":[\"SORACHI Hideaki\"],\"authorInfo\":[\"<p><br></p>\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-03 19:19:00'),
(256, 'Author', 2, 'com.smanga.web.controller.business.BusinessAuthorController.editSave()', 'POST', 1, 'admin', 'IT', '/business/author/edit', '127.0.0.1', 'Intranet IP', '{\"id\":[\"2\"],\"authorName\":[\"SORACHI Hideaki\"],\"authorInfo\":[\"<p><br></p>\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-03 19:20:22'),
(257, 'Manga Category', 1, 'com.smanga.web.controller.business.BusinessMangaCategoryController.addSave()', 'POST', 1, 'admin', 'IT', '/business/category/add', '127.0.0.1', 'Intranet IP', '{\"categoryName\":[\"Action\"],\"status\":[\"1\"],\"coverImage\":[\"\"],\"coverImageId\":[\"\"],\"recommendedAge\":[\"\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-03 19:21:13'),
(258, 'Manga Category', 1, 'com.smanga.web.controller.business.BusinessMangaCategoryController.addSave()', 'POST', 1, 'admin', 'IT', '/business/category/add', '127.0.0.1', 'Intranet IP', '{\"categoryName\":[\"Adventure\"],\"status\":[\"1\"],\"coverImage\":[\"\"],\"coverImageId\":[\"\"],\"recommendedAge\":[\"\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-03 19:21:20'),
(259, 'Manga Category', 1, 'com.smanga.web.controller.business.BusinessMangaCategoryController.addSave()', 'POST', 1, 'admin', 'IT', '/business/category/add', '127.0.0.1', 'Intranet IP', '{\"categoryName\":[\"Drama\"],\"status\":[\"1\"],\"coverImage\":[\"\"],\"coverImageId\":[\"\"],\"recommendedAge\":[\"\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-03 19:21:28'),
(260, 'Manga Category', 1, 'com.smanga.web.controller.business.BusinessMangaCategoryController.addSave()', 'POST', 1, 'admin', 'IT', '/business/category/add', '127.0.0.1', 'Intranet IP', '{\"categoryName\":[\"Sci-fi\"],\"status\":[\"1\"],\"coverImage\":[\"\"],\"coverImageId\":[\"\"],\"recommendedAge\":[\"\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-03 19:21:35'),
(261, 'Manga Category', 1, 'com.smanga.web.controller.business.BusinessMangaCategoryController.addSave()', 'POST', 1, 'admin', 'IT', '/business/category/add', '127.0.0.1', 'Intranet IP', '{\"categoryName\":[\"Shounen\"],\"status\":[\"1\"],\"coverImage\":[\"\"],\"coverImageId\":[\"\"],\"recommendedAge\":[\"\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-03 19:21:41'),
(262, 'Manga', 1, 'com.smanga.web.controller.business.BusinessMangaController.addSave()', 'POST', 1, 'admin', 'IT', '/business/manga/add', '127.0.0.1', 'Intranet IP', '{\"mangaName\":[\"Gintama\"],\"categories\":[\"Comedy,Action,Adventure,Drama,Shounen,Sci-fi\"],\"categoryIds\":[\"10,11,12,13,15,14\"],\"author\":[\"SORACHI Hideaki\"],\"authorId\":[\"2\"],\"artist\":[\"\"],\"artistId\":[\"\"],\"remark\":[\"<p><br></p>\"],\"coverImage\":[\"/profile/upload/manga/cover/2020-12-03/file20201203192223.png\"],\"coverImageId\":[\"291\"],\"slideImage\":[\"\"],\"slideImageId\":[\"\"],\"recommendedAge\":[\"\"],\"status\":[\"1\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-03 19:22:26'),
(263, 'Manga Chapter', 1, 'com.smanga.web.controller.business.BusinessMangaChapterController.addSave()', 'POST', 1, 'admin', 'IT', '/business/chapter/add', '127.0.0.1', 'Intranet IP', '{\"mangaId\":[\"4\"],\"chapterName\":[\"\"],\"chapterIndex\":[\"1\"],\"chapterLang\":[\"en\"],\"remark\":[\"\"],\"status\":[\"1\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-03 19:22:50'),
(264, 'Manga Chapter', 1, 'com.smanga.web.controller.business.BusinessMangaChapterController.addSave()', 'POST', 1, 'admin', 'IT', '/business/chapter/add', '127.0.0.1', 'Intranet IP', '{\"mangaId\":[\"4\"],\"chapterName\":[\"\"],\"chapterIndex\":[\"2\"],\"chapterLang\":[\"en\"],\"remark\":[\"\"],\"status\":[\"1\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-03 21:30:16'),
(265, 'Manga Chapter', 1, 'com.smanga.web.controller.business.BusinessMangaChapterController.addSave()', 'POST', 1, 'admin', 'IT', '/business/chapter/add', '127.0.0.1', 'Intranet IP', '{\"mangaId\":[\"4\"],\"chapterName\":[\"\"],\"chapterIndex\":[\"3\"],\"chapterLang\":[\"en\"],\"remark\":[\"\"],\"status\":[\"1\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-03 21:30:20'),
(266, 'Manga Chapter', 1, 'com.smanga.web.controller.business.BusinessMangaChapterController.addSave()', 'POST', 1, 'admin', 'IT', '/business/chapter/add', '127.0.0.1', 'Intranet IP', '{\"mangaId\":[\"4\"],\"chapterName\":[\"\"],\"chapterIndex\":[\"4\"],\"chapterLang\":[\"en\"],\"remark\":[\"\"],\"status\":[\"1\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-03 21:30:22'),
(267, 'Manga Chapter', 1, 'com.smanga.web.controller.business.BusinessMangaChapterController.addSave()', 'POST', 1, 'admin', 'IT', '/business/chapter/add', '127.0.0.1', 'Intranet IP', '{\"mangaId\":[\"4\"],\"chapterName\":[\"\"],\"chapterIndex\":[\"5\"],\"chapterLang\":[\"en\"],\"remark\":[\"\"],\"status\":[\"1\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-03 21:30:25'),
(268, 'Manga Chapter', 1, 'com.smanga.web.controller.business.BusinessMangaChapterController.addSave()', 'POST', 1, 'admin', 'IT', '/business/chapter/add', '127.0.0.1', 'Intranet IP', '{\"mangaId\":[\"4\"],\"chapterName\":[\"\"],\"chapterIndex\":[\"6\"],\"chapterLang\":[\"en\"],\"remark\":[\"\"],\"status\":[\"1\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-03 21:30:27'),
(269, 'Author', 1, 'com.smanga.web.controller.business.BusinessAuthorController.addSave()', 'POST', 1, 'admin', 'IT', '/business/author/add', '127.0.0.1', 'Intranet IP', '{\"authorName\":[\"ONE\"],\"authorInfo\":[\"<p><br></p>\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-03 21:33:38'),
(270, 'artist', 1, 'com.smanga.web.controller.business.BusinessArtistController.addSave()', 'POST', 1, 'admin', 'IT', '/business/artist/add', '127.0.0.1', 'Intranet IP', '{\"artistName\":[\"MURATA Yuusuke\"],\"artistInfo\":[\"<p><br></p>\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-03 21:33:46'),
(271, 'Manga Category', 1, 'com.smanga.web.controller.business.BusinessMangaCategoryController.addSave()', 'POST', 1, 'admin', 'IT', '/business/category/add', '127.0.0.1', 'Intranet IP', '{\"categoryName\":[\"Seinen\"],\"status\":[\"1\"],\"coverImage\":[\"\"],\"coverImageId\":[\"\"],\"recommendedAge\":[\"\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-03 21:34:11'),
(272, 'Manga Category', 1, 'com.smanga.web.controller.business.BusinessMangaCategoryController.addSave()', 'POST', 1, 'admin', 'IT', '/business/category/add', '127.0.0.1', 'Intranet IP', '{\"categoryName\":[\"Supernatural\"],\"status\":[\"1\"],\"coverImage\":[\"\"],\"coverImageId\":[\"\"],\"recommendedAge\":[\"\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-03 21:34:18'),
(273, 'Manga', 1, 'com.smanga.web.controller.business.BusinessMangaController.addSave()', 'POST', 1, 'admin', 'IT', '/business/manga/add', '127.0.0.1', 'Intranet IP', '{\"mangaName\":[\"One Punch-Man\"],\"categories\":[\"Action,Adventure,Comedy,Drama,Sci-fi,Seinen,Supernatural\"],\"categoryIds\":[\"11,12,10,13,14,16,17\"],\"author\":[\"ONE\"],\"authorId\":[\"3\"],\"artist\":[\"MURATA Yuusuke\"],\"artistId\":[\"\"],\"remark\":[\"<p><br></p>\"],\"coverImage\":[\"/profile/upload/manga/cover/2020-12-03/file20201203213522.jpg\"],\"coverImageId\":[\"460\"],\"slideImage\":[\"\"],\"slideImageId\":[\"\"],\"recommendedAge\":[\"\"],\"status\":[\"1\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-03 21:35:23'),
(274, 'Manga Chapter', 1, 'com.smanga.web.controller.business.BusinessMangaChapterController.addSave()', 'POST', 1, 'admin', 'IT', '/business/chapter/add', '127.0.0.1', 'Intranet IP', '{\"mangaId\":[\"5\"],\"chapterName\":[\"\"],\"chapterIndex\":[\"1\"],\"chapterLang\":[\"en\"],\"remark\":[\"\"],\"status\":[\"1\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-03 21:35:32'),
(275, 'Manga Chapter', 1, 'com.smanga.web.controller.business.BusinessMangaChapterController.addSave()', 'POST', 1, 'admin', 'IT', '/business/chapter/add', '127.0.0.1', 'Intranet IP', '{\"mangaId\":[\"5\"],\"chapterName\":[\"\"],\"chapterIndex\":[\"2\"],\"chapterLang\":[\"en\"],\"remark\":[\"\"],\"status\":[\"1\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-03 21:35:35'),
(276, 'Manga Chapter', 1, 'com.smanga.web.controller.business.BusinessMangaChapterController.addSave()', 'POST', 1, 'admin', 'IT', '/business/chapter/add', '127.0.0.1', 'Intranet IP', '{\"mangaId\":[\"5\"],\"chapterName\":[\"\"],\"chapterIndex\":[\"3\"],\"chapterLang\":[\"en\"],\"remark\":[\"\"],\"status\":[\"1\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-03 21:35:38'),
(277, 'Manga Chapter', 1, 'com.smanga.web.controller.business.BusinessMangaChapterController.addSave()', 'POST', 1, 'admin', 'IT', '/business/chapter/add', '127.0.0.1', 'Intranet IP', '{\"mangaId\":[\"5\"],\"chapterName\":[\"\"],\"chapterIndex\":[\"4\"],\"chapterLang\":[\"en\"],\"remark\":[\"\"],\"status\":[\"1\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-03 21:35:41'),
(278, 'Manga Chapter', 1, 'com.smanga.web.controller.business.BusinessMangaChapterController.addSave()', 'POST', 1, 'admin', 'IT', '/business/chapter/add', '127.0.0.1', 'Intranet IP', '{\"mangaId\":[\"5\"],\"chapterName\":[\"\"],\"chapterIndex\":[\"5\"],\"chapterLang\":[\"en\"],\"remark\":[\"\"],\"status\":[\"1\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-03 21:35:43'),
(279, 'Author', 1, 'com.smanga.web.controller.business.BusinessAuthorController.addSave()', 'POST', 1, 'admin', 'IT', '/business/author/add', '127.0.0.1', 'Intranet IP', '{\"authorName\":[\"Jin (じん)\"],\"authorInfo\":[\"<p><br></p>\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-03 22:00:42'),
(280, 'artist', 1, 'com.smanga.web.controller.business.BusinessArtistController.addSave()', 'POST', 1, 'admin', 'IT', '/business/artist/add', '127.0.0.1', 'Intranet IP', '{\"artistName\":[\"SATOU Mahiro\"],\"artistInfo\":[\"<p><br></p>\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-03 22:00:50'),
(281, 'Manga Category', 1, 'com.smanga.web.controller.business.BusinessMangaCategoryController.addSave()', 'POST', 1, 'admin', 'IT', '/business/category/add', '127.0.0.1', 'Intranet IP', '{\"categoryName\":[\"Mystery\"],\"status\":[\"1\"],\"coverImage\":[\"\"],\"coverImageId\":[\"\"],\"recommendedAge\":[\"\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-03 22:01:02');
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`) VALUES
(282, 'Manga Category', 1, 'com.smanga.web.controller.business.BusinessMangaCategoryController.addSave()', 'POST', 1, 'admin', 'IT', '/business/category/add', '127.0.0.1', 'Intranet IP', '{\"categoryName\":[\"Romance\"],\"status\":[\"1\"],\"coverImage\":[\"\"],\"coverImageId\":[\"\"],\"recommendedAge\":[\"\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-03 22:01:10'),
(283, 'Manga', 1, 'com.smanga.web.controller.business.BusinessMangaController.addSave()', 'POST', 1, 'admin', 'IT', '/business/manga/add', '127.0.0.1', 'Intranet IP', '{\"mangaName\":[\"Kagerou Days\"],\"categories\":[\"Comedy,Drama,Mystery,Romance,Shounen,Supernatural\"],\"categoryIds\":[\"10,13,18,19,15,17\"],\"author\":[\"Jin (じん)\"],\"authorId\":[\"4\"],\"artist\":[\"SATOU Mahiro\"],\"artistId\":[\"\"],\"remark\":[\"<p><br></p>\"],\"coverImage\":[\"/profile/upload/manga/cover/2020-12-03/file20201203220255.jpg\"],\"coverImageId\":[\"575\"],\"slideImage\":[\"\"],\"slideImageId\":[\"\"],\"recommendedAge\":[\"\"],\"status\":[\"1\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-03 22:02:56'),
(284, 'Manga Chapter', 1, 'com.smanga.web.controller.business.BusinessMangaChapterController.addSave()', 'POST', 1, 'admin', 'IT', '/business/chapter/add', '127.0.0.1', 'Intranet IP', '{\"mangaId\":[\"6\"],\"chapterName\":[\"\"],\"chapterIndex\":[\"1\"],\"chapterLang\":[\"jp\"],\"remark\":[\"\"],\"status\":[\"1\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-03 22:03:05'),
(285, 'Manga Chapter', 1, 'com.smanga.web.controller.business.BusinessMangaChapterController.addSave()', 'POST', 1, 'admin', 'IT', '/business/chapter/add', '127.0.0.1', 'Intranet IP', '{\"mangaId\":[\"6\"],\"chapterName\":[\"\"],\"chapterIndex\":[\"2\"],\"chapterLang\":[\"jp\"],\"remark\":[\"\"],\"status\":[\"1\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-06 12:09:34'),
(286, 'Manga Category', 2, 'com.smanga.web.controller.business.BusinessMangaCategoryController.editSave()', 'POST', 1, 'admin', 'IT', '/business/category/edit', '127.0.0.1', 'Intranet IP', '{\"id\":[\"10\"],\"categoryName\":[\"Comedy\"],\"status\":[\"0\"],\"coverImage\":[\"\"],\"coverImageId\":[\"\"],\"recommendedAge\":[\"\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-06 14:14:33'),
(287, 'Manga Category', 2, 'com.smanga.web.controller.business.BusinessMangaCategoryController.editSave()', 'POST', 1, 'admin', 'IT', '/business/category/edit', '127.0.0.1', 'Intranet IP', '{\"id\":[\"10\"],\"categoryName\":[\"Comedy\"],\"status\":[\"1\"],\"coverImage\":[\"\"],\"coverImageId\":[\"\"],\"recommendedAge\":[\"\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-06 14:14:45'),
(288, 'Parameter Management', 1, 'com.smanga.web.controller.system.SysConfigController.addSave()', 'POST', 1, 'admin', 'IT', '/system/config/add', '127.0.0.1', 'Intranet IP', '{\"configName\":[\"Photo editor sdk license\"],\"configKey\":[\"photo.editor.license\"],\"configValue\":[\"{\\\"api_token\\\":\\\"Ie0ritI-Ichtan7hXjz5uw\\\",\\\"app_identifiers\\\":[\\\"localhost\\\"],\\\"available_actions\\\":[],\\\"domains\\\":[\\\"https://api.photoeditorsdk.com\\\"],\\\"enterprise_license\\\":false,\\\"expires_at\\\":1609804800,\\\"features\\\":[\\\"camera\\\",\\\"library\\\",\\\"export\\\",\\\"customassets\\\",\\\"whitelabel\\\",\\\"focus\\\",\\\"textdesign\\\",\\\"transform\\\",\\\"brush\\\",\\\"text\\\",\\\"frame\\\",\\\"overlay\\\",\\\"sticker\\\",\\\"adjustment\\\",\\\"filter\\\"],\\\"issued_at\\\":1607272596,\\\"minimum_sdk_version\\\":\\\"1.0\\\",\\\"owner\\\":\\\"Hieu Nguyen\\\",\\\"platform\\\":\\\"HTML5\\\",\\\"products\\\":[\\\"pesdk\\\"],\\\"version\\\":\\\"2.4\\\",\\\"signature\\\":\\\"NMwyRWJYDL+WTMHeGeLmVT/JQE5+B+IYfc0+lV9Hs73BwPuWrOtcuXncHQONBTwF8vhUS0buNYt5lffARdRLDOJ+dbcVLAje7HZAOCw1GpwoJKTuNmdK5vd4Eg2Olrel2XW0zcJ87uHZIFvvas0vWjq6k9yaiFD8xv44IoiqGOgz1+UmO4VcaEkl2fNgtGsaBwpNBQhOE9xQpIrfr2CSVl51mk/mrJaQFwnO8noLGZg3Lxiizurk45NtTJB8edUoTo6PN5CoVR/daArdhPFDuA7KB4QyvVKuucpRmWIGQEPOmEHOUCBGuXOvgful+Dd80r7ci/XW2nFOCFrlEtRL7Yz7GnS30bEDWLGktJHv0Sc0QP1mNt6y+1Je37McIErSCQoocJDPvNqbvjKcBdLuLl8aRmyIyuTOKX2UWYkLOfjYpo5gtG9gyNi/vC4ZXh1ubg+txuCIqYBhpdWS5vyViUZVceuugg6mqd0aTMKeMDbbRvDr8JEQISy596va9NE10X5MDhKxz8ZSvjbTx3ind1PA3Nu9eWba1oagOcZeEsNzwfxaETj6L50/BSo4YzzUu92jvI8DyO/kkLIVmRc7Hn1yzy8lPi0zqigOI1kq+PcFCWhsN7nSRegUFSEM17m19npNXAFRiVjKOsx19h9WFKeX7Dr0UAoFHucYDg0XMe0=\\\"}\"],\"configType\":[\"Y\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-07 01:03:01'),
(289, 'Menu Management', 2, 'com.smanga.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', 'IT', '/system/menu/edit', '127.0.0.1', 'Intranet IP', '{\"menuId\":[\"103\"],\"parentId\":[\"1\"],\"menuType\":[\"C\"],\"menuName\":[\"Department management\"],\"url\":[\"/system/dept\"],\"target\":[\"menuItem\"],\"perms\":[\"system:dept:view\"],\"orderNum\":[\"4\"],\"icon\":[\"fa fa-outdent\"],\"visible\":[\"1\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-10 04:23:27'),
(290, 'Menu Management', 2, 'com.smanga.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', 'IT', '/system/menu/edit', '127.0.0.1', 'Intranet IP', '{\"menuId\":[\"104\"],\"parentId\":[\"1\"],\"menuType\":[\"C\"],\"menuName\":[\"Job management\"],\"url\":[\"/system/post\"],\"target\":[\"menuItem\"],\"perms\":[\"system:post:view\"],\"orderNum\":[\"5\"],\"icon\":[\"fa fa-address-card-o\"],\"visible\":[\"1\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-10 04:23:38'),
(291, 'Menu Management', 2, 'com.smanga.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', 'IT', '/system/menu/edit', '127.0.0.1', 'Intranet IP', '{\"menuId\":[\"107\"],\"parentId\":[\"1\"],\"menuType\":[\"C\"],\"menuName\":[\"Announcement\"],\"url\":[\"/system/notice\"],\"target\":[\"menuItem\"],\"perms\":[\"system:notice:view\"],\"orderNum\":[\"8\"],\"icon\":[\"fa fa-bullhorn\"],\"visible\":[\"1\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-10 04:23:58'),
(292, 'Menu Management', 2, 'com.smanga.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', 'IT', '/system/menu/edit', '127.0.0.1', 'Intranet IP', '{\"menuId\":[\"108\"],\"parentId\":[\"1\"],\"menuType\":[\"M\"],\"menuName\":[\"Log management\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"9\"],\"icon\":[\"fa fa-pencil-square-o\"],\"visible\":[\"1\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-10 04:24:04'),
(293, 'Menu Management', 2, 'com.smanga.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', 'IT', '/system/menu/edit', '127.0.0.1', 'Intranet IP', '{\"menuId\":[\"111\"],\"parentId\":[\"2\"],\"menuType\":[\"C\"],\"menuName\":[\"Data monitoring\"],\"url\":[\"/monitor/data\"],\"target\":[\"menuItem\"],\"perms\":[\"monitor:data:view\"],\"orderNum\":[\"3\"],\"icon\":[\"fa fa-bug\"],\"visible\":[\"1\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-10 04:25:03'),
(294, 'Role Management', 1, 'com.smanga.web.controller.system.SysRoleController.addSave()', 'POST', 1, 'admin', 'IT', '/system/role/add', '127.0.0.1', 'Intranet IP', '{\"roleName\":[\"Publiser\"],\"roleKey\":[\"publisher\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-10 04:26:26'),
(295, 'Role Management', 2, 'com.smanga.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', 'IT', '/system/role/edit', '127.0.0.1', 'Intranet IP', '{\"roleId\":[\"100\"],\"roleName\":[\"Publiser\"],\"roleKey\":[\"publisher\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"2002,2006,2004,2005,2003\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-10 04:26:54'),
(296, 'User Management', 1, 'com.smanga.web.controller.system.SysUserController.addSave()', 'POST', 1, 'admin', 'IT', '/system/user/add', '127.0.0.1', 'Intranet IP', '{\"deptId\":[\"201\"],\"userName\":[\"publisher\"],\"deptName\":[\"Manga\"],\"phonenumber\":[\"0935802291\"],\"email\":[\"tronghieu85311@gmail.com\"],\"loginName\":[\"publisher\"],\"sex\":[\"0\"],\"role\":[\"100\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"100\"],\"postIds\":[\"\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-10 04:27:51'),
(297, 'Menu Management', 2, 'com.smanga.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', 'IT', '/system/menu/edit', '127.0.0.1', 'Intranet IP', '{\"menuId\":[\"3\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"System Tools\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"3\"],\"icon\":[\"fa fa-bars\"],\"visible\":[\"1\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-11 07:42:16'),
(298, 'Menu Management', 2, 'com.smanga.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', 'IT', '/system/menu/edit', '127.0.0.1', 'Intranet IP', '{\"menuId\":[\"3\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"System Tools\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"3\"],\"icon\":[\"fa fa-bars\"],\"visible\":[\"0\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-20 19:14:28'),
(299, 'Code generation', 6, 'com.smanga.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', 'IT', '/tool/gen/importTable', '127.0.0.1', 'Intranet IP', '{\"tables\":[\"view_counter,recommend_manga,user_manga\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-20 19:15:30'),
(300, 'Code generation', 3, 'com.smanga.generator.controller.GenController.remove()', 'POST', 1, 'admin', 'IT', '/tool/gen/remove', '127.0.0.1', 'Intranet IP', '{\"ids\":[\"10\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-20 19:17:23'),
(301, 'Code generation', 3, 'com.smanga.generator.controller.GenController.remove()', 'POST', 1, 'admin', 'IT', '/tool/gen/remove', '127.0.0.1', 'Intranet IP', '{\"ids\":[\"9\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-20 19:17:26'),
(302, 'Code generation', 3, 'com.smanga.generator.controller.GenController.remove()', 'POST', 1, 'admin', 'IT', '/tool/gen/remove', '127.0.0.1', 'Intranet IP', '{\"ids\":[\"8\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-20 19:17:29'),
(303, 'Code generation', 6, 'com.smanga.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', 'IT', '/tool/gen/importTable', '127.0.0.1', 'Intranet IP', '{\"tables\":[\"user_manga,recommend_manga,view_counter\"]}', 'null', 1, 'Import failed: \r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'function_name\' at row 1\r\n### The error may exist in file [D:\\Projects\\Smart Manga Java\\smanga-generator\\target\\classes\\mapper\\generator\\GenTableMapper.xml]\r\n### The error may involve com.smanga.generator.mapper.GenTableMapper.insertGenTable-Inline\r\n### The error occurred while setting parameters\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'function_name\' at row 1\n; Data truncation: Data too long for column \'function_name\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'function_name\' at row 1', '2020-12-20 19:19:21'),
(304, 'Code generation', 6, 'com.smanga.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', 'IT', '/tool/gen/importTable', '127.0.0.1', 'Intranet IP', '{\"tables\":[\"user_manga,recommend_manga,view_counter\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-20 19:19:55'),
(305, 'Code generation', 2, 'com.smanga.generator.controller.GenController.editSave()', 'POST', 1, 'admin', 'IT', '/tool/gen/edit', '127.0.0.1', 'Intranet IP', '{\"tableId\":[\"13\"],\"tableName\":[\"recommend_manga\"],\"tableComment\":[\"List manga rating predict by system\"],\"className\":[\"RecommendManga\"],\"functionAuthor\":[\"Trong Hieu\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"136\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"Serial index\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"137\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"User id\"],\"columns[1].javaType\":[\"Long\"],\"columns[1].javaField\":[\"userId\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"138\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"Manga id\"],\"columns[2].javaType\":[\"Long\"],\"columns[2].javaField\":[\"mangaId\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"139\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"0: is not recommend, 1: is recommend\"],\"columns[3].javaType\":[\"Integer\"],\"columns[3].javaField\":[\"isRecommend\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"140\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"Creator\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"createBy\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"141\"],\"columns[5].sort\":[\"6\"],\"columns[5].column', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-20 19:20:33'),
(306, 'Code generation', 2, 'com.smanga.generator.controller.GenController.editSave()', 'POST', 1, 'admin', 'IT', '/tool/gen/edit', '127.0.0.1', 'Intranet IP', '{\"tableId\":[\"14\"],\"tableName\":[\"user_manga\"],\"tableComment\":[\"Information of manga rate by user\"],\"className\":[\"UserManga\"],\"functionAuthor\":[\"Trong Hieu\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"144\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"Serial index\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"145\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"User id\"],\"columns[1].javaType\":[\"Long\"],\"columns[1].javaField\":[\"userId\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"146\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"Manga id\"],\"columns[2].javaType\":[\"Long\"],\"columns[2].javaField\":[\"mangaId\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"147\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"Manga is bookmark (0: not bookmark, 1: bookmarked)\"],\"columns[3].javaType\":[\"Integer\"],\"columns[3].javaField\":[\"bookmark\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"148\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"\"],\"columns[4].javaType\":[\"Long\"],\"columns[4].javaField\":[\"rating\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"colu', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-20 19:20:48'),
(307, 'Code generation', 2, 'com.smanga.generator.controller.GenController.editSave()', 'POST', 1, 'admin', 'IT', '/tool/gen/edit', '127.0.0.1', 'Intranet IP', '{\"tableId\":[\"15\"],\"tableName\":[\"view_counter\"],\"tableComment\":[\"List of ip prevent count view multiple time in period of time\"],\"className\":[\"ViewCounter\"],\"functionAuthor\":[\"Trong Hieu\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"153\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"Serial index\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"154\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"Ip user\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"ip\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"155\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"Expired time, user view can be counter after this time\"],\"columns[2].javaType\":[\"Date\"],\"columns[2].javaField\":[\"expiredTime\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"datetime\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"156\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"Create time\"],\"columns[3].javaType\":[\"Date\"],\"columns[3].javaField\":[\"createTime\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"datetime\"],\"columns[3].dictType\":[\"\"],\"tplCategory\":[\"crud\"],\"packageName\":[\"com.smanga.business\"],\"moduleName\":[\"business\"],\"businessName\":[\"counter\"],\"functionName\":[\"List of ip prevent count view multiple time\"],\"params[parentMenuId]\":[\"1\"],\"params[parentMenuName]\":[\"System Management\"],\"genType\":[\"0\"],\"genPath\":[\"/\"],\"subTableName\":[\"\"],\"params[treeCode]\":[\"\"],\"params[treeParentCode]\":[\"\"],\"params[treeName]\":[\"\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-20 19:21:11'),
(308, 'Code generation', 8, 'com.smanga.generator.controller.GenController.download()', 'GET', 1, 'admin', 'IT', '/tool/gen/download/recommend_manga', '127.0.0.1', 'Intranet IP', NULL, 'null', 0, NULL, '2020-12-20 19:21:19'),
(309, 'Code generation', 8, 'com.smanga.generator.controller.GenController.download()', 'GET', 1, 'admin', 'IT', '/tool/gen/download/user_manga', '127.0.0.1', 'Intranet IP', NULL, 'null', 0, NULL, '2020-12-20 19:21:36'),
(310, 'Code generation', 8, 'com.smanga.generator.controller.GenController.download()', 'GET', 1, 'admin', 'IT', '/tool/gen/download/view_counter', '127.0.0.1', 'Intranet IP', NULL, 'null', 0, NULL, '2020-12-20 19:21:48'),
(311, 'Timed task', 1, 'com.smanga.quartz.controller.SysJobController.addSave()', 'POST', 1, 'admin', 'IT', '/monitor/job/add', '127.0.0.1', 'Intranet IP', '{\"createBy\":[\"admin\"],\"jobName\":[\"Predict rating for user\"],\"jobGroup\":[\"DEFAULT\"],\"invokeTarget\":[\"smangaTask.predictRatingMangaForUser\"],\"cronExpression\":[\"0/10 * * * * ?\"],\"misfirePolicy\":[\"2\"],\"concurrent\":[\"0\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-20 20:58:58'),
(312, 'Timed task', 2, 'com.smanga.quartz.controller.SysJobController.run()', 'POST', 1, 'admin', 'IT', '/monitor/job/run', '127.0.0.1', 'Intranet IP', '{\"jobId\":[\"100\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-20 20:59:15'),
(313, 'Timed task', 2, 'com.smanga.quartz.controller.SysJobController.run()', 'POST', 1, 'admin', 'IT', '/monitor/job/run', '127.0.0.1', 'Intranet IP', '{\"jobId\":[\"100\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-20 21:00:12'),
(314, 'Timed task', 2, 'com.smanga.quartz.controller.SysJobController.run()', 'POST', 1, 'admin', 'IT', '/monitor/job/run', '127.0.0.1', 'Intranet IP', '{\"jobId\":[\"100\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-20 21:00:23'),
(315, 'Business User Information Form', 1, 'com.smanga.web.controller.business.BusinessUserController.addSave()', 'POST', 1, 'admin', 'IT', '/business/user/add', '127.0.0.1', 'Intranet IP', '{\"loginName\":[\"usertest1\"],\"userName\":[\"User test 1\"],\"userType\":[\"R\"],\"email\":[\"usertest1@mail.com\"],\"phonenumber\":[\"\"],\"sex\":[\"0\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-20 21:06:32'),
(316, 'Business User Information Form', 1, 'com.smanga.web.controller.business.BusinessUserController.addSave()', 'POST', 1, 'admin', 'IT', '/business/user/add', '127.0.0.1', 'Intranet IP', '{\"loginName\":[\"usertest2\"],\"userName\":[\"User test 2\"],\"userType\":[\"R\"],\"email\":[\"usertest2@mail.com\"],\"phonenumber\":[\"\"],\"sex\":[\"0\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-20 21:07:23'),
(317, 'Business User Information Form', 2, 'com.smanga.web.controller.business.BusinessUserController.editSave()', 'POST', 1, 'admin', 'IT', '/business/user/edit', '127.0.0.1', 'Intranet IP', '{\"userId\":[\"2\"],\"loginName\":[\"usertest1\"],\"userName\":[\"User test 1\"],\"userType\":[\"R\"],\"email\":[\"usertest1@mail.com\"],\"phonenumber\":[\"0935882290\"],\"sex\":[\"0\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-20 21:08:10'),
(318, 'Business User Information Form', 2, 'com.smanga.web.controller.business.BusinessUserController.editSave()', 'POST', 1, 'admin', 'IT', '/business/user/edit', '127.0.0.1', 'Intranet IP', '{\"userId\":[\"3\"],\"loginName\":[\"usertest2\"],\"userName\":[\"User test 2\"],\"userType\":[\"R\"],\"email\":[\"usertest2@mail.com\"],\"phonenumber\":[\"0935892290\"],\"sex\":[\"0\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-20 21:10:44'),
(319, 'Timed task', 2, 'com.smanga.quartz.controller.SysJobController.editSave()', 'POST', 1, 'admin', 'IT', '/monitor/job/edit', '127.0.0.1', 'Intranet IP', '{\"jobId\":[\"100\"],\"updateBy\":[\"admin\"],\"jobName\":[\"Predict rating for user\"],\"jobGroup\":[\"DEFAULT\"],\"invokeTarget\":[\"recommendationTask.predictRatingMangaForUser\"],\"cronExpression\":[\"0/10 * * * * ?\"],\"misfirePolicy\":[\"2\"],\"concurrent\":[\"0\"],\"status\":[\"1\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-20 21:19:54'),
(320, 'Timed task', 2, 'com.smanga.quartz.controller.SysJobController.run()', 'POST', 1, 'admin', 'IT', '/monitor/job/run', '127.0.0.1', 'Intranet IP', '{\"jobId\":[\"100\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-20 21:20:04'),
(321, 'Timed task', 2, 'com.smanga.quartz.controller.SysJobController.run()', 'POST', 1, 'admin', 'IT', '/monitor/job/run', '127.0.0.1', 'Intranet IP', '{\"jobId\":[\"100\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-20 23:39:07'),
(322, 'Timed task', 2, 'com.smanga.quartz.controller.SysJobController.run()', 'POST', 1, 'admin', 'IT', '/monitor/job/run', '127.0.0.1', 'Intranet IP', '{\"jobId\":[\"100\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-20 23:43:20'),
(323, 'Timed task', 2, 'com.smanga.quartz.controller.SysJobController.run()', 'POST', 1, 'admin', 'IT', '/monitor/job/run', '127.0.0.1', 'Intranet IP', '{\"jobId\":[\"100\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-20 23:57:34'),
(324, 'Timed task', 2, 'com.smanga.quartz.controller.SysJobController.run()', 'POST', 1, 'admin', 'IT', '/monitor/job/run', '127.0.0.1', 'Intranet IP', '{\"jobId\":[\"100\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-21 00:00:11'),
(325, 'Timed task', 2, 'com.smanga.quartz.controller.SysJobController.run()', 'POST', 1, 'admin', 'IT', '/monitor/job/run', '127.0.0.1', 'Intranet IP', '{\"jobId\":[\"100\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-21 00:01:52'),
(326, 'Timed task', 2, 'com.smanga.quartz.controller.SysJobController.run()', 'POST', 1, 'admin', 'IT', '/monitor/job/run', '127.0.0.1', 'Intranet IP', '{\"jobId\":[\"100\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-21 00:06:52'),
(327, 'Timed task', 2, 'com.smanga.quartz.controller.SysJobController.run()', 'POST', 1, 'admin', 'IT', '/monitor/job/run', '127.0.0.1', 'Intranet IP', '{\"jobId\":[\"100\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-21 00:07:57'),
(328, 'Timed task', 2, 'com.smanga.quartz.controller.SysJobController.run()', 'POST', 1, 'admin', 'IT', '/monitor/job/run', '127.0.0.1', 'Intranet IP', '{\"jobId\":[\"100\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-21 00:09:40'),
(329, 'Timed task', 2, 'com.smanga.quartz.controller.SysJobController.run()', 'POST', 1, 'admin', 'IT', '/monitor/job/run', '127.0.0.1', 'Intranet IP', '{\"jobId\":[\"100\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-21 00:10:55'),
(330, 'Timed task', 2, 'com.smanga.quartz.controller.SysJobController.run()', 'POST', 1, 'admin', 'IT', '/monitor/job/run', '127.0.0.1', 'Intranet IP', '{\"jobId\":[\"100\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-21 00:13:22'),
(331, 'Timed task', 1, 'com.smanga.quartz.controller.SysJobController.addSave()', 'POST', 1, 'admin', 'IT', '/monitor/job/add', '127.0.0.1', 'Intranet IP', '{\"createBy\":[\"admin\"],\"jobName\":[\"Slope one task\"],\"jobGroup\":[\"DEFAULT\"],\"invokeTarget\":[\"slopeOneTask.slopeOne(3)\"],\"cronExpression\":[\"0/10 * * * * ?\"],\"misfirePolicy\":[\"2\"],\"concurrent\":[\"0\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-21 07:41:57'),
(332, 'Timed task', 2, 'com.smanga.quartz.controller.SysJobController.run()', 'POST', 1, 'admin', 'IT', '/monitor/job/run', '127.0.0.1', 'Intranet IP', '{\"jobId\":[\"101\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-21 07:42:04'),
(333, 'Timed task', 2, 'com.smanga.quartz.controller.SysJobController.run()', 'POST', 1, 'admin', 'IT', '/monitor/job/run', '127.0.0.1', 'Intranet IP', '{\"jobId\":[\"101\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-21 07:43:43'),
(334, 'Timed task', 2, 'com.smanga.quartz.controller.SysJobController.run()', 'POST', 1, 'admin', 'IT', '/monitor/job/run', '127.0.0.1', 'Intranet IP', '{\"jobId\":[\"101\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-21 07:44:31'),
(335, 'Timed task', 2, 'com.smanga.quartz.controller.SysJobController.run()', 'POST', 1, 'admin', 'IT', '/monitor/job/run', '127.0.0.1', 'Intranet IP', '{\"jobId\":[\"101\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-21 07:46:22'),
(336, 'Timed task', 2, 'com.smanga.quartz.controller.SysJobController.run()', 'POST', 1, 'admin', 'IT', '/monitor/job/run', '127.0.0.1', 'Intranet IP', '{\"jobId\":[\"101\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-21 07:54:29'),
(337, 'Timed task', 2, 'com.smanga.quartz.controller.SysJobController.run()', 'POST', 1, 'admin', 'IT', '/monitor/job/run', '127.0.0.1', 'Intranet IP', '{\"jobId\":[\"100\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-21 09:06:15'),
(338, 'Timed task', 2, 'com.smanga.quartz.controller.SysJobController.run()', 'POST', 1, 'admin', 'IT', '/monitor/job/run', '127.0.0.1', 'Intranet IP', '{\"jobId\":[\"100\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-21 09:07:33'),
(339, 'Timed task', 2, 'com.smanga.quartz.controller.SysJobController.run()', 'POST', 1, 'admin', 'IT', '/monitor/job/run', '127.0.0.1', 'Intranet IP', '{\"jobId\":[\"100\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-21 09:26:11'),
(340, 'Timed task', 2, 'com.smanga.quartz.controller.SysJobController.run()', 'POST', 1, 'admin', 'IT', '/monitor/job/run', '127.0.0.1', 'Intranet IP', '{\"jobId\":[\"100\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-21 09:27:15'),
(341, 'Timed task', 2, 'com.smanga.quartz.controller.SysJobController.run()', 'POST', 1, 'admin', 'IT', '/monitor/job/run', '127.0.0.1', 'Intranet IP', '{\"jobId\":[\"100\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-21 09:34:20'),
(342, 'Timed task', 2, 'com.smanga.quartz.controller.SysJobController.run()', 'POST', 1, 'admin', 'IT', '/monitor/job/run', '127.0.0.1', 'Intranet IP', '{\"jobId\":[\"100\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-21 09:36:34'),
(343, 'Timed task', 2, 'com.smanga.quartz.controller.SysJobController.run()', 'POST', 1, 'admin', 'IT', '/monitor/job/run', '127.0.0.1', 'Intranet IP', '{\"jobId\":[\"100\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-21 09:38:09'),
(344, 'Timed task', 2, 'com.smanga.quartz.controller.SysJobController.run()', 'POST', 1, 'admin', 'IT', '/monitor/job/run', '127.0.0.1', 'Intranet IP', '{\"jobId\":[\"101\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-21 09:45:59'),
(345, 'Timed task', 2, 'com.smanga.quartz.controller.SysJobController.run()', 'POST', 1, 'admin', 'IT', '/monitor/job/run', '127.0.0.1', 'Intranet IP', '{\"jobId\":[\"100\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-21 09:54:14'),
(346, 'Timed task', 2, 'com.smanga.quartz.controller.SysJobController.run()', 'POST', 1, 'admin', 'IT', '/monitor/job/run', '127.0.0.1', 'Intranet IP', '{\"jobId\":[\"100\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-21 09:54:33'),
(347, 'Timed task', 2, 'com.smanga.quartz.controller.SysJobController.run()', 'POST', 1, 'admin', 'IT', '/monitor/job/run', '127.0.0.1', 'Intranet IP', '{\"jobId\":[\"100\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-21 09:56:35'),
(348, 'Timed task', 2, 'com.smanga.quartz.controller.SysJobController.run()', 'POST', 1, 'admin', 'IT', '/monitor/job/run', '127.0.0.1', 'Intranet IP', '{\"jobId\":[\"100\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-21 10:00:07'),
(349, 'Timed task', 2, 'com.smanga.quartz.controller.SysJobController.run()', 'POST', 1, 'admin', 'IT', '/monitor/job/run', '127.0.0.1', 'Intranet IP', '{\"jobId\":[\"100\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-21 10:07:31'),
(350, 'Timed task', 2, 'com.smanga.quartz.controller.SysJobController.run()', 'POST', 1, 'admin', 'IT', '/monitor/job/run', '127.0.0.1', 'Intranet IP', '{\"jobId\":[\"100\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-21 10:07:46'),
(351, 'Timed task', 2, 'com.smanga.quartz.controller.SysJobController.run()', 'POST', 1, 'admin', 'IT', '/monitor/job/run', '127.0.0.1', 'Intranet IP', '{\"jobId\":[\"100\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-21 10:10:50'),
(352, 'Timed task', 2, 'com.smanga.quartz.controller.SysJobController.run()', 'POST', 1, 'admin', 'IT', '/monitor/job/run', '127.0.0.1', 'Intranet IP', '{\"jobId\":[\"100\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-21 10:18:29'),
(353, 'Timed task', 2, 'com.smanga.quartz.controller.SysJobController.run()', 'POST', 1, 'admin', 'IT', '/monitor/job/run', '127.0.0.1', 'Intranet IP', '{\"jobId\":[\"100\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-21 19:42:15'),
(354, 'Manga', 1, 'com.smanga.web.controller.business.BusinessMangaController.addSave()', 'POST', 1, 'admin', 'IT', '/business/manga/add', '127.0.0.1', 'Intranet IP', '{\"mangaName\":[\"Youjo Senki\"],\"categories\":[\"Action,Sci-fi,Drama\"],\"categoryIds\":[\"11,14,13\"],\"author\":[\"SORACHI Hideaki\"],\"authorId\":[\"2\"],\"artist\":[\"\"],\"artistId\":[\"\"],\"remark\":[\"<p><br></p>\"],\"coverImage\":[\"/profile/upload/manga/cover/2020-12-22/file20201222050143.jpg\"],\"coverImageId\":[\"743\"],\"slideImage\":[\"\"],\"slideImageId\":[\"\"],\"recommendedAge\":[\"\"],\"status\":[\"1\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-22 05:01:47'),
(355, 'Manga', 1, 'com.smanga.web.controller.business.BusinessMangaController.addSave()', 'POST', 1, 'admin', 'IT', '/business/manga/add', '127.0.0.1', 'Intranet IP', '{\"mangaName\":[\"Ushinawareta Toki o Motomete\"],\"categories\":[\"Adventure,Shounen,Seinen,Drama,Supernatural\"],\"categoryIds\":[\"12,15,16,13,17\"],\"author\":[\"Jin (じん)\"],\"authorId\":[\"4\"],\"artist\":[\"MURATA Yuusuke\"],\"artistId\":[\"\"],\"remark\":[\"<p><br></p>\"],\"coverImage\":[\"/profile/upload/manga/cover/2020-12-22/file20201222050826.jpg\"],\"coverImageId\":[\"744\"],\"slideImage\":[\"\"],\"slideImageId\":[\"\"],\"recommendedAge\":[\"\"],\"status\":[\"1\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-22 05:08:27'),
(356, 'Manga', 1, 'com.smanga.web.controller.business.BusinessMangaController.addSave()', 'POST', 1, 'admin', 'IT', '/business/manga/add', '127.0.0.1', 'Intranet IP', '{\"mangaName\":[\"Dragonball\"],\"categories\":[\"Adventure,Shounen,Sci-fi,Drama,Supernatural,Romance\"],\"categoryIds\":[\"12,15,14,13,17,19\"],\"author\":[\"Jin (じん)\"],\"authorId\":[\"4\"],\"artist\":[\"\"],\"artistId\":[\"\"],\"remark\":[\"<p><br></p>\"],\"coverImage\":[\"/profile/upload/manga/cover/2020-12-22/file20201222050957.jpg\"],\"coverImageId\":[\"745\"],\"slideImage\":[\"\"],\"slideImageId\":[\"\"],\"recommendedAge\":[\"\"],\"status\":[\"1\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-22 05:10:02'),
(357, 'Manga', 1, 'com.smanga.web.controller.business.BusinessMangaController.addSave()', 'POST', 1, 'admin', 'IT', '/business/manga/add', '127.0.0.1', 'Intranet IP', '{\"mangaName\":[\"Lupin III\"],\"categories\":[\"Adventure,Sci-fi,Seinen,Drama,Supernatural\"],\"categoryIds\":[\"12,14,16,13,17\"],\"author\":[\"ONE\"],\"authorId\":[\"3\"],\"artist\":[\"SATOU Mahiro\"],\"artistId\":[\"\"],\"remark\":[\"<p><br></p>\"],\"coverImage\":[\"/profile/upload/manga/cover/2020-12-22/file20201222051055.jpg\"],\"coverImageId\":[\"746\"],\"slideImage\":[\"\"],\"slideImageId\":[\"\"],\"recommendedAge\":[\"\"],\"status\":[\"1\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-22 05:10:56'),
(358, 'Manga Chapter', 1, 'com.smanga.web.controller.business.BusinessMangaChapterController.addSave()', 'POST', 1, 'admin', 'IT', '/business/chapter/add', '127.0.0.1', 'Intranet IP', '{\"mangaId\":[\"9\"],\"chapterName\":[\"\"],\"chapterIndex\":[\"1\"],\"chapterLang\":[\"en\"],\"remark\":[\"\"],\"status\":[\"1\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-22 05:12:08'),
(359, 'Manga Chapter', 1, 'com.smanga.web.controller.business.BusinessMangaChapterController.addSave()', 'POST', 1, 'admin', 'IT', '/business/chapter/add', '127.0.0.1', 'Intranet IP', '{\"mangaId\":[\"10\"],\"chapterName\":[\"\"],\"chapterIndex\":[\"1\"],\"chapterLang\":[\"en\"],\"remark\":[\"\"],\"status\":[\"1\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-22 05:13:52'),
(360, 'Manga Chapter', 1, 'com.smanga.web.controller.business.BusinessMangaChapterController.addSave()', 'POST', 1, 'admin', 'IT', '/business/chapter/add', '127.0.0.1', 'Intranet IP', '{\"mangaId\":[\"11\"],\"chapterName\":[\"\"],\"chapterIndex\":[\"1\"],\"chapterLang\":[\"en\"],\"remark\":[\"\"],\"status\":[\"1\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-22 05:15:13'),
(361, 'Manga Chapter', 1, 'com.smanga.web.controller.business.BusinessMangaChapterController.addSave()', 'POST', 1, 'admin', 'IT', '/business/chapter/add', '127.0.0.1', 'Intranet IP', '{\"mangaId\":[\"12\"],\"chapterName\":[\"\"],\"chapterIndex\":[\"1\"],\"chapterLang\":[\"en\"],\"remark\":[\"\"],\"status\":[\"1\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-22 05:16:09'),
(362, 'Business User Information Form', 1, 'com.smanga.web.controller.business.BusinessUserController.addSave()', 'POST', 1, 'admin', 'IT', '/business/user/add', '127.0.0.1', 'Intranet IP', '{\"loginName\":[\"usertest3\"],\"userName\":[\"User test 3\"],\"userType\":[\"R\"],\"email\":[\"usertest3@mail.com\"],\"phonenumber\":[\"\"],\"sex\":[\"0\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-22 05:19:24'),
(363, 'Business User Information Form', 1, 'com.smanga.web.controller.business.BusinessUserController.addSave()', 'POST', 1, 'admin', 'IT', '/business/user/add', '127.0.0.1', 'Intranet IP', '{\"loginName\":[\"usertest4\"],\"userName\":[\"User test 4\"],\"userType\":[\"R\"],\"email\":[\"usertest4@mail.com\"],\"phonenumber\":[\"\"],\"sex\":[\"0\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-22 05:19:45'),
(364, 'Business User Information Form', 1, 'com.smanga.web.controller.business.BusinessUserController.addSave()', 'POST', 1, 'admin', 'IT', '/business/user/add', '127.0.0.1', 'Intranet IP', '{\"loginName\":[\"usertest5\"],\"userName\":[\"User test 5\"],\"userType\":[\"R\"],\"email\":[\"usertest5@mail.com\"],\"phonenumber\":[\"\"],\"sex\":[\"0\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-22 05:20:14'),
(365, 'Menu Management', 2, 'com.smanga.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', 'IT', '/system/menu/edit', '127.0.0.1', 'Intranet IP', '{\"menuId\":[\"3\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"System Tools\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"3\"],\"icon\":[\"fa fa-bars\"],\"visible\":[\"1\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-22 05:34:21'),
(366, 'Timed task', 2, 'com.smanga.quartz.controller.SysJobController.run()', 'POST', 1, 'admin', 'IT', '/monitor/job/run', '127.0.0.1', 'Intranet IP', '{\"jobId\":[\"100\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-22 05:34:54'),
(367, 'Timed task', 2, 'com.smanga.quartz.controller.SysJobController.run()', 'POST', 1, 'admin', 'IT', '/monitor/job/run', '127.0.0.1', 'Intranet IP', '{\"jobId\":[\"100\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-12-22 05:44:22');

-- --------------------------------------------------------

--
-- Table structure for table `sys_post`
--

CREATE TABLE `sys_post` (
  `post_id` bigint(20) NOT NULL COMMENT 'Post ID',
  `post_code` varchar(64) NOT NULL COMMENT 'Post code',
  `post_name` varchar(50) NOT NULL COMMENT 'Position Name',
  `post_sort` int(4) NOT NULL COMMENT 'Display order',
  `status` char(1) NOT NULL COMMENT 'Status (0 normal 1 disabled)',
  `create_by` varchar(64) DEFAULT '' COMMENT 'Creator',
  `create_time` datetime DEFAULT NULL COMMENT 'Creation time',
  `update_by` varchar(64) DEFAULT '' COMMENT 'Updater',
  `update_time` datetime DEFAULT NULL COMMENT 'Update time',
  `remark` varchar(500) DEFAULT NULL COMMENT 'Remarks'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Job Information Form';

--
-- Dumping data for table `sys_post`
--

INSERT INTO `sys_post` (`post_id`, `post_code`, `post_name`, `post_sort`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
(1, 'ceo', 'Chairman', 1, '0', 'admin', '2020-11-25 23:36:13', '', NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `sys_role`
--

CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL COMMENT 'Role ID',
  `role_name` varchar(30) NOT NULL COMMENT 'Role Name',
  `role_key` varchar(100) NOT NULL COMMENT 'Role permission string',
  `role_sort` int(4) NOT NULL COMMENT 'Display order',
  `data_scope` char(1) DEFAULT '1' COMMENT 'Data range (1: All data permissions 2: Customized data permissions 3: Data permissions for this department 4: Data permissions for this department and below)',
  `status` char(1) NOT NULL COMMENT 'Role status (0 normal 1 disabled)',
  `del_flag` char(1) DEFAULT '0' COMMENT 'Delete flag (0 means existence 2 means deletion)',
  `create_by` varchar(64) DEFAULT '' COMMENT 'Creator',
  `create_time` datetime DEFAULT NULL COMMENT 'Creation time',
  `update_by` varchar(64) DEFAULT '' COMMENT 'Updater',
  `update_time` datetime DEFAULT NULL COMMENT 'Update time',
  `remark` varchar(500) DEFAULT NULL COMMENT 'Remarks'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Role information table';

--
-- Dumping data for table `sys_role`
--

INSERT INTO `sys_role` (`role_id`, `role_name`, `role_key`, `role_sort`, `data_scope`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
(1, 'Super administrator', 'admin', 1, '1', '0', '0', 'admin', '2020-11-25 23:36:14', '', NULL, 'Super administrator'),
(2, 'Normal role', 'common', 2, '2', '0', '2', 'admin', '2020-11-25 23:36:14', 'admin', '2020-11-26 00:31:43', 'Normal role'),
(100, 'Publiser', 'publisher', 2, '1', '0', '0', 'admin', '2020-12-10 04:26:26', 'admin', '2020-12-10 04:26:54', '');

-- --------------------------------------------------------

--
-- Table structure for table `sys_role_dept`
--

CREATE TABLE `sys_role_dept` (
  `role_id` bigint(20) NOT NULL COMMENT 'Role ID',
  `dept_id` bigint(20) NOT NULL COMMENT 'Department ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Role and Department Association Table';

--
-- Dumping data for table `sys_role_dept`
--

INSERT INTO `sys_role_dept` (`role_id`, `dept_id`) VALUES
(2, 100),
(2, 101),
(2, 105);

-- --------------------------------------------------------

--
-- Table structure for table `sys_role_menu`
--

CREATE TABLE `sys_role_menu` (
  `role_id` bigint(20) NOT NULL COMMENT 'Role ID',
  `menu_id` bigint(20) NOT NULL COMMENT 'Menu ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Role and menu association table';

--
-- Dumping data for table `sys_role_menu`
--

INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES
(2, 1),
(2, 2),
(2, 3),
(2, 100),
(2, 101),
(2, 102),
(2, 103),
(2, 104),
(2, 105),
(2, 106),
(2, 107),
(2, 108),
(2, 109),
(2, 110),
(2, 111),
(2, 112),
(2, 113),
(2, 114),
(2, 115),
(2, 116),
(2, 500),
(2, 501),
(2, 1000),
(2, 1001),
(2, 1002),
(2, 1003),
(2, 1004),
(2, 1005),
(2, 1006),
(2, 1007),
(2, 1008),
(2, 1009),
(2, 1010),
(2, 1011),
(2, 1012),
(2, 1013),
(2, 1014),
(2, 1015),
(2, 1016),
(2, 1017),
(2, 1018),
(2, 1019),
(2, 1020),
(2, 1021),
(2, 1022),
(2, 1023),
(2, 1024),
(2, 1025),
(2, 1026),
(2, 1027),
(2, 1028),
(2, 1029),
(2, 1030),
(2, 1031),
(2, 1032),
(2, 1033),
(2, 1034),
(2, 1035),
(2, 1036),
(2, 1037),
(2, 1038),
(2, 1039),
(2, 1040),
(2, 1041),
(2, 1042),
(2, 1043),
(2, 1044),
(2, 1045),
(2, 1046),
(2, 1047),
(2, 1048),
(2, 1049),
(2, 1050),
(2, 1051),
(2, 1052),
(2, 1053),
(2, 1054),
(2, 1055),
(2, 1056),
(2, 1057),
(2, 1058),
(2, 1059),
(2, 1060),
(2, 1061),
(100, 2002),
(100, 2003),
(100, 2004),
(100, 2005),
(100, 2006);

-- --------------------------------------------------------

--
-- Table structure for table `sys_user`
--

CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL COMMENT 'User ID',
  `dept_id` bigint(20) DEFAULT NULL COMMENT 'Department ID',
  `login_name` varchar(30) NOT NULL COMMENT 'Login account',
  `user_name` varchar(30) DEFAULT '' COMMENT 'User name',
  `user_type` varchar(2) DEFAULT '00' COMMENT 'User type (00 system user 01 registered user)',
  `email` varchar(50) DEFAULT '' COMMENT 'User mailbox',
  `phonenumber` varchar(11) DEFAULT '' COMMENT 'Mobile phone number',
  `sex` char(1) DEFAULT '0' COMMENT 'User gender (0 male 1 female 2 unknown)',
  `avatar` varchar(100) DEFAULT '' COMMENT 'Avatar path',
  `password` varchar(50) DEFAULT '' COMMENT 'Password',
  `salt` varchar(20) DEFAULT '' COMMENT 'Salt encryption',
  `status` char(1) DEFAULT '0' COMMENT 'Account status (0 normal 1 disabled)',
  `del_flag` char(1) DEFAULT '0' COMMENT 'Delete flag (0 means existence 2 means deletion)',
  `login_ip` varchar(50) DEFAULT '' COMMENT 'Last login IP',
  `login_date` datetime DEFAULT NULL COMMENT 'Last login time',
  `pwd_update_date` datetime DEFAULT NULL COMMENT 'Last password update time',
  `create_by` varchar(64) DEFAULT '' COMMENT 'Creator',
  `create_time` datetime DEFAULT NULL COMMENT 'Creation time',
  `update_by` varchar(64) DEFAULT '' COMMENT 'Updater',
  `update_time` datetime DEFAULT NULL COMMENT 'Update time',
  `remark` varchar(500) DEFAULT NULL COMMENT 'Remarks'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='User Information Form';

--
-- Dumping data for table `sys_user`
--

INSERT INTO `sys_user` (`user_id`, `dept_id`, `login_name`, `user_name`, `user_type`, `email`, `phonenumber`, `sex`, `avatar`, `password`, `salt`, `status`, `del_flag`, `login_ip`, `login_date`, `pwd_update_date`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
(1, 200, 'admin', 'admin', '00', 'smanga@163.com', '0935801313', '0', '', '29c67a30398638269fe600f73a054934', '111111', '0', '0', '127.0.0.1', '2020-12-22 06:34:05', '2020-11-25 23:36:13', 'admin', '2020-11-25 23:36:13', 'admin', '2020-12-22 05:34:05', 'Administrator'),
(2, 105, 'ry', 'Smanga', '00', 'smanga@mail.com', '15666666666', '1', '', '8e6d98b90472783cc73c17047ddccf36', '222222', '0', '2', '127.0.0.1', '2020-11-25 23:36:13', '2020-11-25 23:36:13', 'admin', '2020-11-25 23:36:13', '', NULL, 'Tester'),
(100, 201, 'tronghieu', 'Trong Hieu Nguyen', '00', 'tronghieu8531@gmail.com', '0935802290', '0', '', '5363aed8ab3221be5ca78b9780f35394', 'dbf967', '0', '0', '127.0.0.1', '2020-12-21 00:10:59', NULL, 'admin', '2020-11-26 01:35:01', '', '2020-12-20 23:10:59', NULL),
(101, 201, 'publisher', 'publisher', '00', 'tronghieu85311@gmail.com', '0935802291', '0', '', '312d9cf5abf8d9ad999f9c08b7e207ba', 'fde7e2', '0', '0', '127.0.0.1', '2020-12-10 20:10:41', NULL, 'admin', '2020-12-10 04:27:51', '', '2020-12-10 19:10:41', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sys_user_online`
--

CREATE TABLE `sys_user_online` (
  `sessionId` varchar(50) NOT NULL DEFAULT '' COMMENT 'User session id',
  `login_name` varchar(50) DEFAULT '' COMMENT 'Login account',
  `dept_name` varchar(50) DEFAULT '' COMMENT 'Department name',
  `ipaddr` varchar(50) DEFAULT '' COMMENT 'Login IP address',
  `login_location` varchar(255) DEFAULT '' COMMENT 'Login location',
  `browser` varchar(50) DEFAULT '' COMMENT 'Browser type',
  `os` varchar(50) DEFAULT '' COMMENT 'Operating system',
  `status` varchar(10) DEFAULT '' COMMENT 'Online status on_line online off_line offline',
  `start_timestamp` datetime DEFAULT NULL COMMENT 'Session creation time',
  `last_access_time` datetime DEFAULT NULL COMMENT 'Ssession last access time',
  `expire_time` int(5) DEFAULT 0 COMMENT 'Timeout period, in minutes'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Online status on_line online off_line offline';

--
-- Dumping data for table `sys_user_online`
--

INSERT INTO `sys_user_online` (`sessionId`, `login_name`, `dept_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `start_timestamp`, `last_access_time`, `expire_time`) VALUES
('8e4386f5-e9d2-4c4c-bb65-7af92cd33f63', 'admin', 'IT', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', 'on_line', '2020-12-22 06:34:01', '2020-12-22 06:44:22', 14400000);

-- --------------------------------------------------------

--
-- Table structure for table `sys_user_post`
--

CREATE TABLE `sys_user_post` (
  `user_id` bigint(20) NOT NULL COMMENT 'User ID',
  `post_id` bigint(20) NOT NULL COMMENT 'Post ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='User and post association table';

--
-- Dumping data for table `sys_user_post`
--

INSERT INTO `sys_user_post` (`user_id`, `post_id`) VALUES
(2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `sys_user_role`
--

CREATE TABLE `sys_user_role` (
  `user_id` bigint(20) NOT NULL COMMENT 'User ID',
  `role_id` bigint(20) NOT NULL COMMENT 'Role ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='User and role association table';

--
-- Dumping data for table `sys_user_role`
--

INSERT INTO `sys_user_role` (`user_id`, `role_id`) VALUES
(1, 1),
(2, 2),
(101, 100);

-- --------------------------------------------------------

--
-- Table structure for table `user_manga`
--

CREATE TABLE `user_manga` (
  `id` bigint(20) NOT NULL COMMENT 'Serial index',
  `user_id` bigint(20) NOT NULL COMMENT 'User id',
  `manga_id` bigint(20) NOT NULL COMMENT 'Manga id',
  `bookmark` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Manga is bookmark (0: not bookmark, 1: bookmarked)',
  `rating` float DEFAULT NULL,
  `create_by` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT 'Creator',
  `create_time` datetime DEFAULT NULL COMMENT 'Create time',
  `update_by` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT 'Updator',
  `update_time` datetime DEFAULT NULL COMMENT 'Update time',
  `user_name` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT 'User name',
  `manga_name` varchar(500) CHARACTER SET utf8 DEFAULT NULL COMMENT 'Manga name'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Information of manga rate by user';

--
-- Dumping data for table `user_manga`
--

INSERT INTO `user_manga` (`id`, `user_id`, `manga_id`, `bookmark`, `rating`, `create_by`, `create_time`, `update_by`, `update_time`, `user_name`, `manga_name`) VALUES
(14, 2, 4, 0, 5, 'User test 1', '2020-12-22 05:28:08', NULL, '2020-12-22 05:28:11', 'User test 1', 'Gintama'),
(15, 2, 5, 0, 2, 'User test 1', '2020-12-22 05:28:18', NULL, '2020-12-22 05:28:21', 'User test 1', 'One Punch-Man'),
(16, 2, 9, 0, 1, 'User test 1', '2020-12-22 05:28:27', NULL, '2020-12-22 05:28:31', 'User test 1', 'Youjo Senki'),
(17, 2, 10, 0, NULL, 'User test 1', '2020-12-22 05:28:43', NULL, NULL, NULL, NULL),
(18, 2, 11, 0, 2, 'User test 1', '2020-12-22 05:28:52', NULL, '2020-12-22 05:28:56', 'User test 1', 'Dragonball'),
(19, 3, 6, 0, 2, 'User test 2', '2020-12-22 05:29:18', NULL, '2020-12-22 05:29:22', 'User test 2', 'Kagerou Days'),
(20, 3, 9, 0, 2, 'User test 2', '2020-12-22 05:29:29', NULL, '2020-12-22 05:29:33', 'User test 2', 'Youjo Senki'),
(21, 3, 10, 0, 5, 'User test 2', '2020-12-22 05:29:40', NULL, '2020-12-22 05:29:41', 'User test 2', 'Ushinawareta Toki o Motomete'),
(22, 3, 12, 0, 4, 'User test 2', '2020-12-22 05:29:49', NULL, '2020-12-22 05:29:52', 'User test 2', 'Lupin III'),
(26, 4, 4, 0, 4, 'User test 3', '2020-12-22 05:31:31', NULL, '2020-12-22 05:31:33', 'User test 3', 'Gintama'),
(27, 4, 5, 0, 3, 'User test 3', '2020-12-22 05:31:37', NULL, '2020-12-22 05:31:39', 'User test 3', 'One Punch-Man'),
(28, 4, 9, 0, 1, 'User test 3', '2020-12-22 05:31:49', NULL, '2020-12-22 05:31:52', 'User test 3', 'Youjo Senki'),
(29, 4, 10, 0, 4, 'User test 3', '2020-12-22 05:32:03', NULL, '2020-12-22 05:32:07', 'User test 3', 'Ushinawareta Toki o Motomete'),
(30, 4, 11, 0, 1, 'User test 3', '2020-12-22 05:32:14', NULL, '2020-12-22 05:32:16', 'User test 3', 'Dragonball'),
(31, 5, 4, 0, 4, 'User test 4', '2020-12-22 05:32:35', NULL, '2020-12-22 05:32:36', 'User test 4', 'Gintama'),
(32, 5, 6, 0, 1, 'User test 4', '2020-12-22 05:32:43', NULL, '2020-12-22 05:32:45', 'User test 4', 'Kagerou Days'),
(33, 5, 12, 0, 5, 'User test 4', '2020-12-22 05:32:52', NULL, '2020-12-22 05:32:54', 'User test 4', 'Lupin III'),
(34, 6, 5, 0, 2, 'User test 5', '2020-12-22 05:33:12', NULL, '2020-12-22 05:33:15', 'User test 5', 'One Punch-Man'),
(35, 6, 6, 0, 2, 'User test 5', '2020-12-22 05:33:19', NULL, '2020-12-22 05:33:21', 'User test 5', 'Kagerou Days'),
(36, 6, 10, 0, 5, 'User test 5', '2020-12-22 05:33:28', NULL, '2020-12-22 05:33:30', 'User test 5', 'Ushinawareta Toki o Motomete'),
(37, 6, 11, 0, 1, 'User test 5', '2020-12-22 05:33:36', NULL, '2020-12-22 05:33:38', 'User test 5', 'Dragonball'),
(38, 6, 12, 0, 4, 'User test 5', '2020-12-22 05:33:44', NULL, '2020-12-22 05:33:46', 'User test 5', 'Lupin III');

-- --------------------------------------------------------

--
-- Table structure for table `view_counter`
--

CREATE TABLE `view_counter` (
  `id` bigint(20) NOT NULL COMMENT 'Serial index',
  `ip` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT 'Ip user',
  `expired_time` datetime DEFAULT NULL COMMENT 'Expired time, user view can be counter after this time',
  `create_time` datetime DEFAULT NULL COMMENT 'Create time',
  `chapter_id` bigint(20) DEFAULT NULL COMMENT 'Chapter id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='List of ip prevent count view multiple time in period of time';

--
-- Dumping data for table `view_counter`
--

INSERT INTO `view_counter` (`id`, `ip`, `expired_time`, `create_time`, `chapter_id`) VALUES
(5, '127.0.0.1', '2020-12-22 21:43:32', '2020-12-21 20:43:32', 9),
(6, '127.0.0.1', '2020-12-22 22:03:28', '2020-12-21 21:03:28', 8),
(7, '127.0.0.1', '2020-12-22 22:35:20', '2020-12-21 21:35:20', 13),
(8, '127.0.0.1', '2020-12-22 22:45:04', '2020-12-21 21:45:04', 10),
(9, '127.0.0.1', '2020-12-22 23:02:24', '2020-12-21 22:02:24', 2),
(10, '127.0.0.1', '2020-12-22 23:02:33', '2020-12-21 22:02:33', 3),
(11, '127.0.0.1', '2020-12-22 23:02:45', '2020-12-21 22:02:45', 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `artist`
--
ALTER TABLE `artist`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `business_user`
--
ALTER TABLE `business_user`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `gen_table`
--
ALTER TABLE `gen_table`
  ADD PRIMARY KEY (`table_id`);

--
-- Indexes for table `gen_table_column`
--
ALTER TABLE `gen_table_column`
  ADD PRIMARY KEY (`column_id`);

--
-- Indexes for table `image_file`
--
ALTER TABLE `image_file`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `manga`
--
ALTER TABLE `manga`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `manga_category`
--
ALTER TABLE `manga_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `manga_chapter`
--
ALTER TABLE `manga_chapter`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `qrtz_blob_triggers`
--
ALTER TABLE `qrtz_blob_triggers`
  ADD PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`);

--
-- Indexes for table `qrtz_calendars`
--
ALTER TABLE `qrtz_calendars`
  ADD PRIMARY KEY (`sched_name`,`calendar_name`);

--
-- Indexes for table `qrtz_cron_triggers`
--
ALTER TABLE `qrtz_cron_triggers`
  ADD PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`);

--
-- Indexes for table `qrtz_fired_triggers`
--
ALTER TABLE `qrtz_fired_triggers`
  ADD PRIMARY KEY (`sched_name`,`entry_id`);

--
-- Indexes for table `qrtz_job_details`
--
ALTER TABLE `qrtz_job_details`
  ADD PRIMARY KEY (`sched_name`,`job_name`,`job_group`);

--
-- Indexes for table `qrtz_locks`
--
ALTER TABLE `qrtz_locks`
  ADD PRIMARY KEY (`sched_name`,`lock_name`);

--
-- Indexes for table `qrtz_paused_trigger_grps`
--
ALTER TABLE `qrtz_paused_trigger_grps`
  ADD PRIMARY KEY (`sched_name`,`trigger_group`);

--
-- Indexes for table `qrtz_scheduler_state`
--
ALTER TABLE `qrtz_scheduler_state`
  ADD PRIMARY KEY (`sched_name`,`instance_name`);

--
-- Indexes for table `qrtz_simple_triggers`
--
ALTER TABLE `qrtz_simple_triggers`
  ADD PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`);

--
-- Indexes for table `qrtz_simprop_triggers`
--
ALTER TABLE `qrtz_simprop_triggers`
  ADD PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`);

--
-- Indexes for table `qrtz_triggers`
--
ALTER TABLE `qrtz_triggers`
  ADD PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  ADD KEY `sched_name` (`sched_name`,`job_name`,`job_group`);

--
-- Indexes for table `recommend_manga`
--
ALTER TABLE `recommend_manga`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sys_config`
--
ALTER TABLE `sys_config`
  ADD PRIMARY KEY (`config_id`);

--
-- Indexes for table `sys_dept`
--
ALTER TABLE `sys_dept`
  ADD PRIMARY KEY (`dept_id`);

--
-- Indexes for table `sys_dict_data`
--
ALTER TABLE `sys_dict_data`
  ADD PRIMARY KEY (`dict_code`);

--
-- Indexes for table `sys_dict_type`
--
ALTER TABLE `sys_dict_type`
  ADD PRIMARY KEY (`dict_id`),
  ADD UNIQUE KEY `dict_type` (`dict_type`);

--
-- Indexes for table `sys_job`
--
ALTER TABLE `sys_job`
  ADD PRIMARY KEY (`job_id`,`job_name`,`job_group`);

--
-- Indexes for table `sys_job_log`
--
ALTER TABLE `sys_job_log`
  ADD PRIMARY KEY (`job_log_id`);

--
-- Indexes for table `sys_logininfor`
--
ALTER TABLE `sys_logininfor`
  ADD PRIMARY KEY (`info_id`);

--
-- Indexes for table `sys_menu`
--
ALTER TABLE `sys_menu`
  ADD PRIMARY KEY (`menu_id`);

--
-- Indexes for table `sys_notice`
--
ALTER TABLE `sys_notice`
  ADD PRIMARY KEY (`notice_id`);

--
-- Indexes for table `sys_oper_log`
--
ALTER TABLE `sys_oper_log`
  ADD PRIMARY KEY (`oper_id`);

--
-- Indexes for table `sys_post`
--
ALTER TABLE `sys_post`
  ADD PRIMARY KEY (`post_id`);

--
-- Indexes for table `sys_role`
--
ALTER TABLE `sys_role`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `sys_role_dept`
--
ALTER TABLE `sys_role_dept`
  ADD PRIMARY KEY (`role_id`,`dept_id`);

--
-- Indexes for table `sys_role_menu`
--
ALTER TABLE `sys_role_menu`
  ADD PRIMARY KEY (`role_id`,`menu_id`);

--
-- Indexes for table `sys_user`
--
ALTER TABLE `sys_user`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `sys_user_online`
--
ALTER TABLE `sys_user_online`
  ADD PRIMARY KEY (`sessionId`);

--
-- Indexes for table `sys_user_post`
--
ALTER TABLE `sys_user_post`
  ADD PRIMARY KEY (`user_id`,`post_id`);

--
-- Indexes for table `sys_user_role`
--
ALTER TABLE `sys_user_role`
  ADD PRIMARY KEY (`user_id`,`role_id`);

--
-- Indexes for table `user_manga`
--
ALTER TABLE `user_manga`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `view_counter`
--
ALTER TABLE `view_counter`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `artist`
--
ALTER TABLE `artist`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Serial ID', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `author`
--
ALTER TABLE `author`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Serial ID', AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `business_user`
--
ALTER TABLE `business_user`
  MODIFY `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'User ID', AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `gen_table`
--
ALTER TABLE `gen_table`
  MODIFY `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Numbering', AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `gen_table_column`
--
ALTER TABLE `gen_table_column`
  MODIFY `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Numbering', AUTO_INCREMENT=157;

--
-- AUTO_INCREMENT for table `image_file`
--
ALTER TABLE `image_file`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Serial ID', AUTO_INCREMENT=853;

--
-- AUTO_INCREMENT for table `manga`
--
ALTER TABLE `manga`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Serial ID', AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `manga_category`
--
ALTER TABLE `manga_category`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Serial ID', AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `manga_chapter`
--
ALTER TABLE `manga_chapter`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Serial ID', AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `recommend_manga`
--
ALTER TABLE `recommend_manga`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Serial index', AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `sys_config`
--
ALTER TABLE `sys_config`
  MODIFY `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT 'Parameter primary key', AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT for table `sys_dept`
--
ALTER TABLE `sys_dept`
  MODIFY `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Department id', AUTO_INCREMENT=202;

--
-- AUTO_INCREMENT for table `sys_dict_data`
--
ALTER TABLE `sys_dict_data`
  MODIFY `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Dictionary encoding', AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT for table `sys_dict_type`
--
ALTER TABLE `sys_dict_type`
  MODIFY `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Dictionary primary key', AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `sys_job`
--
ALTER TABLE `sys_job`
  MODIFY `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Task ID', AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT for table `sys_job_log`
--
ALTER TABLE `sys_job_log`
  MODIFY `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Task log ID', AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `sys_logininfor`
--
ALTER TABLE `sys_logininfor`
  MODIFY `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Access ID', AUTO_INCREMENT=342;

--
-- AUTO_INCREMENT for table `sys_menu`
--
ALTER TABLE `sys_menu`
  MODIFY `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Menu ID', AUTO_INCREMENT=2007;

--
-- AUTO_INCREMENT for table `sys_notice`
--
ALTER TABLE `sys_notice`
  MODIFY `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT 'Announcement ID', AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `sys_oper_log`
--
ALTER TABLE `sys_oper_log`
  MODIFY `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Log primary key', AUTO_INCREMENT=368;

--
-- AUTO_INCREMENT for table `sys_post`
--
ALTER TABLE `sys_post`
  MODIFY `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Post ID', AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sys_role`
--
ALTER TABLE `sys_role`
  MODIFY `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Role ID', AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `sys_user`
--
ALTER TABLE `sys_user`
  MODIFY `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'User ID', AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT for table `user_manga`
--
ALTER TABLE `user_manga`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Serial index', AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `view_counter`
--
ALTER TABLE `view_counter`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Serial index', AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `qrtz_blob_triggers`
--
ALTER TABLE `qrtz_blob_triggers`
  ADD CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`,`trigger_name`,`trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`);

--
-- Constraints for table `qrtz_cron_triggers`
--
ALTER TABLE `qrtz_cron_triggers`
  ADD CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`,`trigger_name`,`trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`);

--
-- Constraints for table `qrtz_simple_triggers`
--
ALTER TABLE `qrtz_simple_triggers`
  ADD CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`,`trigger_name`,`trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`);

--
-- Constraints for table `qrtz_simprop_triggers`
--
ALTER TABLE `qrtz_simprop_triggers`
  ADD CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`,`trigger_name`,`trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`);

--
-- Constraints for table `qrtz_triggers`
--
ALTER TABLE `qrtz_triggers`
  ADD CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`,`job_name`,`job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
