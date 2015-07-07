-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 07, 2015 at 06:43 PM
-- Server version: 5.5.40-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `MOR_development`
--

-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

CREATE TABLE IF NOT EXISTS `articles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `author` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `date` date DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `articles`
--

INSERT INTO `articles` (`id`, `name`, `author`, `description`, `date`, `created_at`, `updated_at`) VALUES
(2, 'not be cry', 'Andrew', 'romantic book ', '2011-11-23', '2015-07-07 14:26:36', '2015-07-07 14:26:36');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE IF NOT EXISTS `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `updated_at` datetime NOT NULL,
  `commenter` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8_unicode_ci,
  `article_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_comments_on_user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `user_id`, `updated_at`, `commenter`, `body`, `article_id`) VALUES
(4, 86, '2015-07-07 14:27:44', NULL, 'nice one', 2);

-- --------------------------------------------------------

--
-- Table structure for table `schema_migrations`
--

CREATE TABLE IF NOT EXISTS `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `schema_migrations`
--

INSERT INTO `schema_migrations` (`version`) VALUES
('20150505212113'),
('20150505232508'),
('20150506182623'),
('20150506183543'),
('20150506200718'),
('20150506222257'),
('20150506222445'),
('20150506224019'),
('20150506224029'),
('20150508005345'),
('20150508140246'),
('20150509103645'),
('20150509184734'),
('20150509190052'),
('20150510152102'),
('20150510152555'),
('20150510152846'),
('20150510155526'),
('20150510155914'),
('20150510165412'),
('20150510165947'),
('20150510170032'),
('20150510171543'),
('20150510171621'),
('20150510172014'),
('20150511155002'),
('20150511155100'),
('20150511155212'),
('20150511155303'),
('20150511155403'),
('20150704232842'),
('20150705011506'),
('20150705011737'),
('20150705011943'),
('20150705012014'),
('20150705012050'),
('20150705012125'),
('20150705012337'),
('20150705012508'),
('20150705013213'),
('20150705013233'),
('20150707122637'),
('20150707135702'),
('20150707140222'),
('20150707140337'),
('20150707140412'),
('20150707140448'),
('20150707140530');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LogoutDate` datetime DEFAULT NULL,
  `IsAdmin` tinyint(1) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `avatar_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar_file_size` int(11) DEFAULT NULL,
  `avatar_updated_at` datetime DEFAULT NULL,
  `Latitude` float DEFAULT NULL,
  `Longitude` float DEFAULT NULL,
  `Location` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `oauth_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `oauth_expires_at` datetime DEFAULT NULL,
  `fbname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=87 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `Name`, `Email`, `Password`, `LogoutDate`, `IsAdmin`, `created_at`, `updated_at`, `avatar_file_name`, `avatar_content_type`, `avatar_file_size`, `avatar_updated_at`, `Latitude`, `Longitude`, `Location`, `provider`, `uid`, `oauth_token`, `oauth_expires_at`, `fbname`) VALUES
(85, 'Rana', 'rana.rizk.ahmed.mahmoud@gmail.com', '12345678', NULL, 1, '2015-07-07 14:22:10', '2015-07-07 14:22:10', 'usera.jpeg', 'image/jpeg', 5011, '2015-07-07 14:22:10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(86, 'Ahmed', 'ahmedrizk@gmail.com', '12345678', NULL, 0, '2015-07-07 14:25:34', '2015-07-07 14:25:34', 'user.jpeg', 'image/jpeg', 5390, '2015-07-07 14:25:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `fk_rails_03de2dc08c` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
