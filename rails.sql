-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 06, 2016 at 12:14 AM
-- Server version: 5.5.47-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `rails`
--

-- --------------------------------------------------------

--
-- Table structure for table `active_admin_comments`
--

CREATE TABLE IF NOT EXISTS `active_admin_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `namespace` varchar(255) DEFAULT NULL,
  `body` text,
  `resource_id` varchar(255) NOT NULL,
  `resource_type` varchar(255) NOT NULL,
  `author_id` int(11) DEFAULT NULL,
  `author_type` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_active_admin_comments_on_namespace` (`namespace`),
  KEY `index_active_admin_comments_on_author_type_and_author_id` (`author_type`,`author_id`),
  KEY `index_active_admin_comments_on_resource_type_and_resource_id` (`resource_type`,`resource_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE IF NOT EXISTS `admins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) NOT NULL DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) DEFAULT NULL,
  `last_sign_in_ip` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_admins_on_email` (`email`),
  UNIQUE KEY `index_admins_on_reset_password_token` (`reset_password_token`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `email`, `encrypted_password`, `reset_password_token`, `reset_password_sent_at`, `remember_created_at`, `sign_in_count`, `current_sign_in_at`, `last_sign_in_at`, `current_sign_in_ip`, `last_sign_in_ip`, `created_at`, `updated_at`) VALUES
(1, 'admin@example.com', '$2a$10$ziImtFnHzoeLMc3w0673.eHz7TdzKn5LhIW7vIvkIZ6Vm4QZ5r0em', NULL, NULL, NULL, 4, '2016-05-05 20:43:22', '2016-05-05 11:24:28', '127.0.0.1', '127.0.0.1', '2016-05-04 14:08:15', '2016-05-05 20:43:22');

-- --------------------------------------------------------

--
-- Table structure for table `ckeditor_assets`
--

CREATE TABLE IF NOT EXISTS `ckeditor_assets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data_file_name` varchar(255) NOT NULL,
  `data_content_type` varchar(255) DEFAULT NULL,
  `data_file_size` int(11) DEFAULT NULL,
  `assetable_id` int(11) DEFAULT NULL,
  `assetable_type` varchar(30) DEFAULT NULL,
  `type` varchar(30) DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_ckeditor_assetable_type` (`assetable_type`,`type`,`assetable_id`),
  KEY `idx_ckeditor_assetable` (`assetable_type`,`assetable_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ckeditor_assets`
--

INSERT INTO `ckeditor_assets` (`id`, `data_file_name`, `data_content_type`, `data_file_size`, `assetable_id`, `assetable_type`, `type`, `width`, `height`, `created_at`, `updated_at`) VALUES
(1, 'template.png', 'image/png', 6067, 2, 'User', 'Ckeditor::Picture', 137, 226, '2016-05-04 18:46:55', '2016-05-04 18:46:55');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE IF NOT EXISTS `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cont` text,
  `user_id` int(11) DEFAULT NULL,
  `lecture_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_comments_on_user_id` (`user_id`),
  KEY `index_comments_on_lecture_id` (`lecture_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `cont`, `user_id`, `lecture_id`, `created_at`, `updated_at`) VALUES
(4, 'comment 1 for this course', 7, 5, '2016-05-05 16:41:01', '2016-05-05 16:41:01');

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE IF NOT EXISTS `courses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `desc` text,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_courses_on_user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `title`, `image`, `desc`, `user_id`, `created_at`, `updated_at`) VALUES
(5, 'PHP', '15f66e7f3417fafe40ec352105a68a6580267dc3_main_hero_image.png', '<p style="font-style: italic;">Course about PHP programming language</p>\r\n', 7, '2016-05-05 09:39:56', '2016-05-05 17:28:46'),
(7, 'Ruby', 'ruby.png', '<p>Course about Ruby programming language&nbsp;and Ruby on Rails framework</p>\r\n', 7, '2016-05-05 11:33:04', '2016-05-05 17:18:18'),
(8, 'Python', 'python_wallpaper_by_cazembe-d4wditn.jpg', '<p>Course about python programmin language</p>\r\n', 7, '2016-05-05 11:33:21', '2016-05-05 17:20:04');

-- --------------------------------------------------------

--
-- Table structure for table `lectures`
--

CREATE TABLE IF NOT EXISTS `lectures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `content` text,
  `attachment` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_lectures_on_user_id` (`user_id`),
  KEY `index_lectures_on_course_id` (`course_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `lectures`
--

INSERT INTO `lectures` (`id`, `title`, `content`, `attachment`, `user_id`, `course_id`, `created_at`, `updated_at`) VALUES
(5, 'Lec1', '<p><span style="font-size:18px;">This is lecture 1 on Ruby course .</span></p>\r\n', 'Apache.pdf', 7, 7, '2016-05-05 13:47:21', '2016-05-05 20:39:41'),
(6, 'Lec2', '<p><span style="font-size:20px;">This is lecture 2 on Ruby course .</span></p>\r\n', 'C.V._Merna.pdf', 7, 7, '2016-05-05 16:34:48', '2016-05-05 20:42:27');

-- --------------------------------------------------------

--
-- Table structure for table `schema_migrations`
--

CREATE TABLE IF NOT EXISTS `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `schema_migrations`
--

INSERT INTO `schema_migrations` (`version`) VALUES
('20160503145622'),
('20160503150451'),
('20160503150617'),
('20160503150646'),
('20160503150736'),
('20160503170951'),
('20160503183056'),
('20160503192558'),
('20160504093942'),
('20160504140453'),
('20160504140455'),
('20160504204204'),
('20160505182429');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) NOT NULL DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) DEFAULT NULL,
  `last_sign_in_ip` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `gender` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `bdate` date DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_email` (`email`),
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `encrypted_password`, `reset_password_token`, `reset_password_sent_at`, `remember_created_at`, `sign_in_count`, `current_sign_in_at`, `last_sign_in_at`, `current_sign_in_ip`, `last_sign_in_ip`, `created_at`, `updated_at`, `gender`, `name`, `bdate`, `image`, `role`) VALUES
(3, 'caro@yahoo.com', '$2a$10$4ifbsTHwlQ.Jj3vcN28yDee6UPmFWqwjq/zb1lqHHPjxlHW9z2oh6', NULL, NULL, NULL, 12, '2016-05-05 20:24:58', '2016-05-05 20:23:04', '127.0.0.1', '127.0.0.1', '2016-05-03 16:36:34', '2016-05-05 20:24:58', 1, 'caro', '2016-05-18', 's1.png', 'user'),
(4, 'koki@yahoo.com', '$2a$10$yxPgFZq4wEPvu8dTlz6muOMwGZiV.3R1Xeo/JrlFLd6qqVkzRcKDG', NULL, NULL, NULL, 2, '2016-05-05 20:25:58', '2016-05-03 16:39:40', '127.0.0.1', '127.0.0.1', '2016-05-03 16:39:40', '2016-05-05 20:25:58', 1, 'koki', '2016-05-18', 'Simple-l.jpg', 'user'),
(5, 'aya@yahoo.com', '$2a$10$F0S.PgXvX6GzqgJfF5XhtuPKpdip4GKs0FM5uA6HnIcWMUAj3otva', NULL, NULL, NULL, 1, '2016-05-05 20:27:12', '2016-05-05 20:27:12', '127.0.0.1', '127.0.0.1', '2016-05-04 14:47:41', '2016-05-05 20:27:12', 1, 'aya', '2011-04-09', 'dkSK3Dv.jpg', 'user'),
(7, 'merna@yahoo.com', '$2a$10$Cl/KSMT/JJF2Cnye15u4v.goMwDDineuVEv9bNwzGMSXndFlZe74O', NULL, NULL, NULL, 26, '2016-05-05 20:37:27', '2016-05-05 20:29:00', '127.0.0.1', '127.0.0.1', '2016-05-05 09:47:22', '2016-05-05 20:37:27', 1, 'merna', NULL, '235.jpeg', 'instructor'),
(11, 'ahmed@yahoo.com', '$2a$10$bNA3pJgv/OCya93kCMuIHeyBm9s09U2Qx0QpdGNOinvCU0VQ9eS6.', NULL, NULL, NULL, 8, '2016-05-05 20:46:03', '2016-05-05 20:34:51', '127.0.0.1', '127.0.0.1', '2016-05-05 18:54:17', '2016-05-05 20:46:03', 0, 'ahmed', '2016-05-24', '23.jpg', 'instructor'),
(12, 'hasam@yahoo.com', '$2a$10$m7Vo3XdNZO1RXy4UMDksLemzjgQym8oefrjJYn8.zT9Jmt6wOBpqq', NULL, NULL, NULL, 2, '2016-05-05 20:37:09', '2016-05-05 18:57:13', '127.0.0.1', '127.0.0.1', '2016-05-05 18:57:13', '2016-05-05 20:37:09', 0, 'hasam', '2016-05-16', '12.jpg', 'user');

-- --------------------------------------------------------

--
-- Table structure for table `votes`
--

CREATE TABLE IF NOT EXISTS `votes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `votable_id` int(11) DEFAULT NULL,
  `votable_type` varchar(255) DEFAULT NULL,
  `voter_id` int(11) DEFAULT NULL,
  `voter_type` varchar(255) DEFAULT NULL,
  `vote_flag` tinyint(1) DEFAULT NULL,
  `vote_scope` varchar(255) DEFAULT NULL,
  `vote_weight` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_votes_on_voter_id_and_voter_type_and_vote_scope` (`voter_id`,`voter_type`,`vote_scope`),
  KEY `index_votes_on_votable_id_and_votable_type_and_vote_scope` (`votable_id`,`votable_type`,`vote_scope`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `votes`
--

INSERT INTO `votes` (`id`, `votable_id`, `votable_type`, `voter_id`, `voter_type`, `vote_flag`, `vote_scope`, `vote_weight`, `created_at`, `updated_at`) VALUES
(4, 5, 'Lecture', 7, 'User', 0, NULL, 1, '2016-05-05 15:30:42', '2016-05-05 20:17:32'),
(5, 5, 'Lecture', 3, 'User', 1, NULL, 1, '2016-05-05 20:25:09', '2016-05-05 20:25:09'),
(6, 5, 'Lecture', 5, 'User', 1, NULL, 1, '2016-05-05 20:27:25', '2016-05-05 20:27:25');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `fk_rails_da9eb9513e` FOREIGN KEY (`lecture_id`) REFERENCES `lectures` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_rails_03de2dc08c` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `fk_rails_b3c61f05ef` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `lectures`
--
ALTER TABLE `lectures`
  ADD CONSTRAINT `fk_rails_bbbf25c9a6` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_rails_5a439a4e07` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
