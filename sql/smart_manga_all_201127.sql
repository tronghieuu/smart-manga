-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 27, 2020 at 01:18 PM
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
(1, 'tronghieu', 'Nguyen Trong Hieu', 'R', 'tronghieu8531@gmail.com', '0935802290', '0', '', '5363aed8ab3221be5ca78b9780f35394', 'dbf967', '0', '0', '127.0.0.1', '2020-11-26 01:59:11', '2020-11-26 01:59:11', 'admin', '2020-11-26 01:59:11', '', NULL, 'Reader user test'),
(100, 'test12', 'test 12', 'P', 'test12@mail.com', '09321123123', '0', '', 'bf5a14850cd1cc30fa9756fcd472b4f9', '188131', '0', '0', '', NULL, NULL, 'admin', '2020-11-26 11:01:58', '', '2020-11-26 11:22:35', 'test');

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
  `function_name` varchar(50) DEFAULT NULL COMMENT 'Generate function name',
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
(6, 'manga_chapter', 'Manga Chapter', NULL, NULL, 'MangaChapter', 'crud', 'com.smanga.business', 'business', 'chapter', 'Manga Chapter', 'Trong Hieu', '0', '/', '{\"parentMenuId\":\"2000\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"Subscriber Management\",\"treeCode\":\"\"}', 'admin', '2020-11-26 11:55:10', '', '2020-11-26 11:56:17', '');

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
(87, '6', 'update_time', 'Update time', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 16, 'admin', '2020-11-26 11:55:10', NULL, '2020-11-26 11:56:17');

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
  `absolute_path` varchar(100) DEFAULT '' COMMENT 'Absolute path'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Image File';

--
-- Dumping data for table `image_file`
--

INSERT INTO `image_file` (`id`, `image_name`, `image_path`, `used_status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `absolute_path`) VALUES
(59, 'file20201127191125.jpg', '/profile/upload/category/cover/2020-11-27/file20201127191125.jpg', '1', '0', 'admin', '2020-11-27 19:11:25', '', '2020-11-27 19:11:30', 'D:/smanga/uploadPath/upload/category/cover/2020-11-27/file20201127191125.jpg'),
(60, 'file20201127191150.jpg', '/profile/upload/category/cover/2020-11-27/file20201127191150.jpg', '1', '0', 'admin', '2020-11-27 19:11:50', '', '2020-11-27 19:11:50', 'D:/smanga/uploadPath/upload/category/cover/2020-11-27/file20201127191150.jpg');

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
  `update_time` datetime DEFAULT NULL COMMENT 'Update time'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Manga';

--
-- Dumping data for table `manga`
--

INSERT INTO `manga` (`id`, `manga_name`, `categories`, `category_ids`, `author`, `author_id`, `favorite_counter`, `remark`, `cover_image`, `cover_image_id`, `slide_image`, `slide_image_id`, `recommended_age`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES
(1, 'To love ru', 'Comedy,Slice of life', '8,9', '', NULL, 0, '<p><br></p>', '', NULL, '', NULL, '', '1', '0', '', '2020-11-27 20:12:20', '', NULL);

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
(7, 'Shonen', 0, '1', '0', '', '2020-11-27 13:55:20', '', '2020-11-27 14:08:09', 'test', '', NULL, '18+'),
(8, 'Comedy', 0, '1', '0', '', '2020-11-27 20:11:30', '', NULL, 'test', '/profile/upload/category/cover/2020-11-27/file20201127191125.jpg', 59, '18+'),
(9, 'Slice of life', 0, '1', '0', '', '2020-11-27 20:11:45', '', '2020-11-27 20:11:50', 'test', '/profile/upload/category/cover/2020-11-27/file20201127191150.jpg', 60, '18+');

-- --------------------------------------------------------

--
-- Table structure for table `manga_chapter`
--

CREATE TABLE `manga_chapter` (
  `id` bigint(20) NOT NULL COMMENT 'Serial ID',
  `chapter_name` varchar(100) DEFAULT '' COMMENT 'Manga name',
  `chapter_index` varchar(200) NOT NULL COMMENT 'Index of chapter in manga',
  `chapter_lang` varchar(10) DEFAULT 'en' COMMENT 'Language of chapter',
  `chapter_images` varchar(500) DEFAULT '' COMMENT 'Image paths with multipe image seperated by comma',
  `chapter_image_ids` bigint(20) DEFAULT NULL COMMENT 'Image ids with multipe image seperated by comma',
  `manga_id` bigint(20) NOT NULL COMMENT 'Author name of manga',
  `view_counter` bigint(10) DEFAULT 0 COMMENT 'Number of reader read this chapter',
  `favorite_counter` bigint(10) DEFAULT 0 COMMENT 'Number of reader like this chapter',
  `remark` varchar(500) DEFAULT '' COMMENT 'Remark',
  `status` char(1) DEFAULT '1' COMMENT 'Chapter status (1 enabled 0 disabled)',
  `del_flag` varchar(1) DEFAULT '0' COMMENT 'Delete flag (0 means existence 1 means deletion)',
  `create_by` varchar(64) DEFAULT '' COMMENT 'Creator',
  `create_time` datetime DEFAULT NULL COMMENT 'Creation time',
  `update_by` varchar(64) DEFAULT '' COMMENT 'Updater',
  `update_time` datetime DEFAULT NULL COMMENT 'Update time'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Manga Chapter';

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
('SmangaScheduler', 'DESKTOP-FKPETVD1606477380430', 1606479528617, 15000);

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
('SmangaScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 1606477380000, -1, 5, 'PAUSED', 'CRON', 1606477380000, 0, NULL, 2, ''),
('SmangaScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 1606477380000, -1, 5, 'PAUSED', 'CRON', 1606477380000, 0, NULL, 2, ''),
('SmangaScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 1606477400000, -1, 5, 'PAUSED', 'CRON', 1606477381000, 0, NULL, 2, '');

-- --------------------------------------------------------

--
-- Table structure for table `sys_config`
--

CREATE TABLE `sys_config` (
  `config_id` int(5) NOT NULL COMMENT 'Parameter primary key',
  `config_name` varchar(100) DEFAULT '' COMMENT 'Parameter name',
  `config_key` varchar(100) DEFAULT '' COMMENT 'Parameter key name',
  `config_value` varchar(500) DEFAULT '' COMMENT 'Parameter key value',
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
(9, 'Main frame page-whether to open the footer', 'sys.index.ignoreFooter', 'true', 'Y', 'admin', '2020-11-25 23:36:23', '', NULL, 'Whether to enable the bottom footer display (true display, false hide)');

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
(3, 'System default (multiple parameters)', 'DEFAULT', 'smangaTask.smangaMultipleParams(\'smanga\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2020-11-25 23:36:24', '', NULL, '');

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
(150, 'admin', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', '0', 'Successful login', '2020-11-27 18:44:31');

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
(3, 'System Tools', 0, 3, '#', '', 'M', '0', '', 'fa fa-bars', 'admin', '2020-11-25 23:36:14', '', NULL, 'System tool catalog'),
(100, 'User Management', 1, 1, '/system/user', '', 'C', '0', 'system:user:view', 'fa fa-user-o', 'admin', '2020-11-25 23:36:14', '', NULL, 'User management menu'),
(101, 'Role management', 1, 2, '/system/role', '', 'C', '0', 'system:role:view', 'fa fa-user-secret', 'admin', '2020-11-25 23:36:14', '', NULL, 'Role management menu'),
(102, 'Menu management', 1, 3, '/system/menu', '', 'C', '0', 'system:menu:view', 'fa fa-th-list', 'admin', '2020-11-25 23:36:14', '', NULL, 'Menu management menu'),
(103, 'Department management', 1, 4, '/system/dept', '', 'C', '0', 'system:dept:view', 'fa fa-outdent', 'admin', '2020-11-25 23:36:14', '', NULL, 'Department Management Menu'),
(104, 'Job management', 1, 5, '/system/post', '', 'C', '0', 'system:post:view', 'fa fa-address-card-o', 'admin', '2020-11-25 23:36:14', '', NULL, 'Post management menu'),
(105, 'Dictionary management', 1, 6, '/system/dict', '', 'C', '0', 'system:dict:view', 'fa fa-bookmark-o', 'admin', '2020-11-25 23:36:14', '', NULL, 'Dictionary management menu'),
(106, 'Parameter settings', 1, 7, '/system/config', '', 'C', '0', 'system:config:view', 'fa fa-sun-o', 'admin', '2020-11-25 23:36:14', '', NULL, 'Parameter setting menu'),
(107, 'Announcement', 1, 8, '/system/notice', '', 'C', '0', 'system:notice:view', 'fa fa-bullhorn', 'admin', '2020-11-25 23:36:14', '', NULL, 'Notification announcement menu'),
(108, 'Log management', 1, 9, '#', '', 'M', '0', '', 'fa fa-pencil-square-o', 'admin', '2020-11-25 23:36:14', '', NULL, 'Log management menu'),
(109, 'Online user', 2, 1, '/monitor/online', '', 'C', '0', 'monitor:online:view', 'fa fa-user-circle', 'admin', '2020-11-25 23:36:14', '', NULL, 'Online user menu'),
(110, 'Timed task', 2, 2, '/monitor/job', '', 'C', '0', 'monitor:job:view', 'fa fa-tasks', 'admin', '2020-11-25 23:36:14', '', NULL, 'Timed task menu'),
(111, 'Data monitoring', 2, 3, '/monitor/data', '', 'C', '0', 'monitor:data:view', 'fa fa-bug', 'admin', '2020-11-25 23:36:14', '', NULL, 'Data monitoring menu'),
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
(2005, 'Manga', 2002, 3, '/business/manga', 'menuItem', 'C', '0', NULL, 'fa fa-barcode', 'admin', '2020-11-26 12:47:26', '', NULL, '');

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
(218, 'Manga', 1, 'com.smanga.web.controller.business.BusinessMangaController.addSave()', 'POST', 1, 'admin', 'IT', '/business/manga/add', '127.0.0.1', 'Intranet IP', '{\"mangaName\":[\"To love ru\"],\"categories\":[\"Comedy,Slice of life\"],\"categoryIds\":[\"8,9\"],\"author\":[\"\"],\"authorId\":[\"\"],\"remark\":[\"<p><br></p>\"],\"coverImage\":[\"\"],\"coverImageId\":[\"\"],\"slideImage\":[\"\"],\"slideImageId\":[\"\"],\"recommendedAge\":[\"\"],\"status\":[\"1\"]}', '{\r\n  \"msg\" : \"The operation was successful\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-11-27 19:12:20');

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
(2, 'Normal role', 'common', 2, '2', '0', '2', 'admin', '2020-11-25 23:36:14', 'admin', '2020-11-26 00:31:43', 'Normal role');

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
(2, 1061);

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
(1, 200, 'admin', 'admin', '00', 'smanga@163.com', '0935801313', '0', '', '29c67a30398638269fe600f73a054934', '111111', '0', '0', '127.0.0.1', '2020-11-27 19:44:31', '2020-11-25 23:36:13', 'admin', '2020-11-25 23:36:13', 'admin', '2020-11-27 18:44:31', 'Administrator'),
(2, 105, 'ry', 'Smanga', '00', 'smanga@mail.com', '15666666666', '1', '', '8e6d98b90472783cc73c17047ddccf36', '222222', '0', '2', '127.0.0.1', '2020-11-25 23:36:13', '2020-11-25 23:36:13', 'admin', '2020-11-25 23:36:13', '', NULL, 'Tester'),
(100, 201, 'tronghieu', 'Trong Hieu Nguyen', '00', 'tronghieu8531@gmail.com', '0935802290', '0', '', '5363aed8ab3221be5ca78b9780f35394', 'dbf967', '0', '0', '127.0.0.1', '2020-11-26 02:35:12', NULL, 'admin', '2020-11-26 01:35:01', '', '2020-11-26 01:35:12', NULL);

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
('a59f1e2c-b5db-4384-8eb0-adecb243490c', 'admin', 'IT', '127.0.0.1', 'Intranet IP', 'Chrome 8', 'Windows 10', 'on_line', '2020-11-27 19:43:16', '2020-11-27 20:15:26', 1800000);

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
(2, 2);

--
-- Indexes for dumped tables
--

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
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `author`
--
ALTER TABLE `author`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Serial ID';

--
-- AUTO_INCREMENT for table `business_user`
--
ALTER TABLE `business_user`
  MODIFY `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'User ID', AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `gen_table`
--
ALTER TABLE `gen_table`
  MODIFY `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Numbering', AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `gen_table_column`
--
ALTER TABLE `gen_table_column`
  MODIFY `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Numbering', AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT for table `image_file`
--
ALTER TABLE `image_file`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Serial ID', AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `manga`
--
ALTER TABLE `manga`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Serial ID', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `manga_category`
--
ALTER TABLE `manga_category`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Serial ID', AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `manga_chapter`
--
ALTER TABLE `manga_chapter`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Serial ID';

--
-- AUTO_INCREMENT for table `sys_config`
--
ALTER TABLE `sys_config`
  MODIFY `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT 'Parameter primary key', AUTO_INCREMENT=100;

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
  MODIFY `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Task ID', AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT for table `sys_job_log`
--
ALTER TABLE `sys_job_log`
  MODIFY `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Task log ID';

--
-- AUTO_INCREMENT for table `sys_logininfor`
--
ALTER TABLE `sys_logininfor`
  MODIFY `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Access ID', AUTO_INCREMENT=151;

--
-- AUTO_INCREMENT for table `sys_menu`
--
ALTER TABLE `sys_menu`
  MODIFY `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Menu ID', AUTO_INCREMENT=2006;

--
-- AUTO_INCREMENT for table `sys_notice`
--
ALTER TABLE `sys_notice`
  MODIFY `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT 'Announcement ID', AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `sys_oper_log`
--
ALTER TABLE `sys_oper_log`
  MODIFY `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Log primary key', AUTO_INCREMENT=219;

--
-- AUTO_INCREMENT for table `sys_post`
--
ALTER TABLE `sys_post`
  MODIFY `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Post ID', AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sys_role`
--
ALTER TABLE `sys_role`
  MODIFY `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Role ID', AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT for table `sys_user`
--
ALTER TABLE `sys_user`
  MODIFY `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'User ID', AUTO_INCREMENT=101;

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
