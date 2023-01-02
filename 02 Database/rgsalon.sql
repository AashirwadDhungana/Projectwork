-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 25, 2021 at 08:07 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 7.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rgsalon`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `stylist_id` bigint(20) UNSIGNED DEFAULT NULL,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`id`, `user_id`, `stylist_id`, `date`, `time`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, '2021-04-22', '09:10:00', 1, '2021-04-22 20:40:17', '2021-04-22 20:51:04', NULL),
(2, 220, 1, '2021-04-29', '13:18:00', 1, '2021-04-25 01:49:20', '2021-04-25 01:52:25', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `areas`
--

CREATE TABLE `areas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `areas`
--

INSERT INTO `areas` (`id`, `name`, `city_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Pani Tanki', 2, '2020-06-25 07:31:48', '2020-06-25 07:33:27', NULL),
(2, 'midbaneshwor', 1, '2020-06-25 07:31:48', '2020-06-25 07:33:17', NULL),
(3, 'campus', 5, '2020-06-25 07:33:28', '2020-06-25 07:33:44', NULL),
(4, '71584 Raheem Divide Apt. 747', 23, '2021-01-18 21:41:26', '2021-01-18 21:41:26', NULL),
(5, '7029 Jon Well', 39, '2021-01-18 21:41:26', '2021-01-18 21:41:26', NULL),
(6, '354 Pasquale Track Apt. 092', 36, '2021-01-18 21:41:27', '2021-01-18 21:41:27', NULL),
(7, '18461 Miller Corner Suite 017', 9, '2021-01-18 21:41:27', '2021-01-18 21:41:27', NULL),
(8, '7041 Moen Junctions Suite 018', 20, '2021-01-18 21:41:27', '2021-01-18 21:41:27', NULL),
(9, '633 Rath Courts', 36, '2021-01-18 21:41:27', '2021-01-18 21:41:27', NULL),
(10, '6425 Leon Ford', 10, '2021-01-18 21:41:27', '2021-01-18 21:41:27', NULL),
(11, '8258 Kuphal Ville Suite 715', 36, '2021-01-18 21:41:27', '2021-01-18 21:41:27', NULL),
(12, '4869 Gabe Causeway Apt. 272', 33, '2021-01-18 21:41:27', '2021-01-18 21:41:27', NULL),
(13, '154 Wiza Glens', 25, '2021-01-18 21:41:28', '2021-01-18 21:41:28', NULL),
(14, '306 Emma Green', 39, '2021-01-18 21:41:28', '2021-01-18 21:41:28', NULL),
(15, '839 Tyrell Port Suite 230', 22, '2021-01-18 21:41:28', '2021-01-18 21:41:28', NULL),
(16, '665 Jaiden Port Apt. 910', 14, '2021-01-18 21:41:28', '2021-01-18 21:41:28', NULL),
(17, '753 Derick Branch Apt. 744', 16, '2021-01-18 21:41:28', '2021-01-18 21:41:28', NULL),
(18, '779 Tina Orchard', 10, '2021-01-18 21:41:28', '2021-01-18 21:41:28', NULL),
(19, '4237 Hamill Shores', 9, '2021-01-18 21:41:28', '2021-01-18 21:41:28', NULL),
(20, '4322 Stracke Manor Apt. 557', 37, '2021-01-18 21:41:29', '2021-01-18 21:41:29', NULL),
(21, '645 Waylon Station', 14, '2021-01-18 21:41:29', '2021-01-18 21:41:29', NULL),
(22, '852 Christy Alley', 1, '2021-01-18 21:41:29', '2021-01-18 21:41:29', NULL),
(23, '983 Nelle Island Apt. 181', 12, '2021-01-18 21:41:29', '2021-01-18 21:41:29', NULL),
(24, '65756 Domingo Ford', 36, '2021-01-18 21:41:29', '2021-01-18 21:41:29', NULL),
(25, '5499 Anais Grove Suite 022', 29, '2021-01-18 21:41:29', '2021-01-18 21:41:29', NULL),
(26, '91396 Walter Locks Apt. 823', 20, '2021-01-18 21:41:29', '2021-01-18 21:41:29', NULL),
(27, '97488 Crist Mountain', 38, '2021-01-18 21:41:30', '2021-01-18 21:41:30', NULL),
(28, '112 Thad View Apt. 523', 8, '2021-01-18 21:41:30', '2021-01-18 21:41:30', NULL),
(29, '6912 Koepp Cape', 37, '2021-01-18 21:41:30', '2021-01-18 21:41:30', NULL),
(30, '556 Schmidt Fords Apt. 350', 39, '2021-01-18 21:41:30', '2021-01-18 21:41:30', NULL),
(31, '105 Roberts Keys Apt. 959', 21, '2021-01-18 21:41:30', '2021-01-18 21:41:30', NULL),
(32, '137 Schoen Via', 36, '2021-01-18 21:41:30', '2021-01-18 21:41:30', NULL),
(33, '279 Harris Way Apt. 402', 36, '2021-01-18 21:41:30', '2021-01-18 21:41:30', NULL),
(34, '23168 Turner Turnpike', 16, '2021-01-18 21:41:30', '2021-01-18 21:41:30', NULL),
(35, '57950 Rosalyn Burgs Suite 607', 32, '2021-01-18 21:41:31', '2021-01-18 21:41:31', NULL),
(36, '7737 Shanelle Grove Apt. 120', 10, '2021-01-18 21:41:31', '2021-01-18 21:41:31', NULL),
(37, '838 Erdman Mall', 16, '2021-01-18 21:41:31', '2021-01-18 21:41:31', NULL),
(38, '21190 Kenton Station', 33, '2021-01-18 21:41:31', '2021-01-18 21:41:31', NULL),
(39, '638 Danial Ridges Apt. 392', 9, '2021-01-18 21:41:31', '2021-01-18 21:41:31', NULL),
(40, '66117 Lucio Lakes', 22, '2021-01-18 21:41:31', '2021-01-18 21:41:31', NULL),
(41, '53162 Lowe Center', 14, '2021-01-18 21:41:31', '2021-01-18 21:41:31', NULL),
(42, '818 Hillard Hills', 7, '2021-01-18 21:41:31', '2021-01-18 21:41:31', NULL),
(43, '4395 Stanton Dam', 18, '2021-01-18 21:41:31', '2021-01-18 21:41:31', NULL),
(44, '84884 Eliseo Meadows Apt. 897', 16, '2021-01-18 21:41:32', '2021-01-18 21:41:32', NULL),
(45, '725 Funk Gateway', 21, '2021-01-18 21:41:32', '2021-01-18 21:41:32', NULL),
(46, '56038 Schmeler Trail', 16, '2021-01-18 21:41:32', '2021-01-18 21:41:32', NULL),
(47, '779 Gladys Mews', 32, '2021-01-18 21:41:32', '2021-01-18 21:41:32', NULL),
(48, '9437 Lang Divide', 10, '2021-01-18 21:41:32', '2021-01-18 21:41:32', NULL),
(49, '895 Gage Lake', 1, '2021-01-18 21:41:32', '2021-01-18 21:41:32', NULL),
(50, '60249 Gay Stravenue', 37, '2021-01-18 21:41:32', '2021-01-18 21:41:32', NULL),
(51, '7894 Amya Walks', 7, '2021-01-18 21:41:32', '2021-01-18 21:41:32', NULL),
(52, '7214 Hershel Creek Suite 004', 39, '2021-01-18 21:41:32', '2021-01-18 21:41:32', NULL),
(53, '21818 Lesch Divide', 34, '2021-01-18 21:41:33', '2021-01-18 21:41:33', NULL),
(54, '4071 Wolff Expressway Apt. 997', 35, '2021-01-18 21:41:33', '2021-01-18 21:41:33', NULL),
(55, '9389 Vladimir Branch', 2, '2021-01-18 21:41:33', '2021-01-18 21:41:33', NULL),
(56, '32597 Karine Green Apt. 164', 27, '2021-01-18 21:41:33', '2021-01-18 21:41:33', NULL),
(57, '736 Isai Mills', 21, '2021-01-18 21:41:33', '2021-01-18 21:41:33', NULL),
(58, '14828 Romaguera Stream', 36, '2021-01-18 21:41:33', '2021-01-18 21:41:33', NULL),
(59, '67412 Amparo Rapid Suite 280', 7, '2021-01-18 21:41:33', '2021-01-18 21:41:33', NULL),
(60, '8158 Daugherty Circles', 21, '2021-01-18 21:41:33', '2021-01-18 21:41:33', NULL),
(61, '549 Cassin Terrace Suite 270', 31, '2021-01-18 21:41:34', '2021-01-18 21:41:34', NULL),
(62, '875 Muller Village', 28, '2021-01-18 21:41:34', '2021-01-18 21:41:34', NULL),
(63, '486 Stark Knolls', 19, '2021-01-18 21:41:34', '2021-01-18 21:41:34', NULL),
(64, '503 Roslyn Port', 33, '2021-01-18 21:44:37', '2021-01-18 21:44:37', NULL),
(65, '90366 Larson Canyon Apt. 363', 47, '2021-01-18 21:44:37', '2021-01-18 21:44:37', NULL),
(66, '81284 Gennaro Ville', 65, '2021-01-18 21:44:37', '2021-01-18 21:44:37', NULL),
(67, '8278 Waters Square Apt. 528', 49, '2021-01-18 21:44:37', '2021-01-18 21:44:37', NULL),
(68, '646 Jonatan Centers', 57, '2021-01-18 21:44:38', '2021-01-18 21:44:38', NULL),
(69, '594 Wendy Loaf', 7, '2021-01-18 21:44:38', '2021-01-18 21:44:38', NULL),
(70, '643 Kuphal Vista Suite 534', 40, '2021-01-18 21:44:38', '2021-01-18 21:44:38', NULL),
(71, '9020 Joanie Road', 62, '2021-01-18 21:44:38', '2021-01-18 21:44:38', NULL),
(72, '9915 Beaulah Course', 5, '2021-01-18 21:44:38', '2021-01-18 21:44:38', NULL),
(73, '366 Roberta Mountain', 57, '2021-01-18 21:44:38', '2021-01-18 21:44:38', NULL),
(74, '32063 Celine Isle Suite 663', 42, '2021-01-18 21:44:39', '2021-01-18 21:44:39', NULL),
(75, '828 Corwin Fort', 37, '2021-01-18 21:44:39', '2021-01-18 21:44:39', NULL),
(76, '760 Kuphal Views Apt. 841', 2, '2021-01-18 21:44:39', '2021-01-18 21:44:39', NULL),
(77, '7347 Jermey Extension Apt. 640', 22, '2021-01-18 21:44:39', '2021-01-18 21:44:39', NULL),
(78, '498 Morar Avenue Apt. 092', 37, '2021-01-18 21:44:39', '2021-01-18 21:44:39', NULL),
(79, '48728 Cierra Lodge', 54, '2021-01-18 21:44:39', '2021-01-18 21:44:39', NULL),
(80, '3545 Becker Junction Suite 611', 26, '2021-01-18 21:44:39', '2021-01-18 21:44:39', NULL),
(81, '187 Lenny Centers Suite 830', 12, '2021-01-18 21:44:39', '2021-01-18 21:44:39', NULL),
(82, '1924 Brown Mews', 32, '2021-01-18 21:44:39', '2021-01-18 21:44:39', NULL),
(83, '8234 Tyshawn Drive', 67, '2021-01-18 21:44:40', '2021-01-18 21:44:40', NULL),
(84, '19378 Freda Isle', 63, '2021-01-18 21:44:40', '2021-01-18 21:44:40', NULL),
(85, '41382 Bosco Overpass Apt. 755', 16, '2021-01-18 21:44:40', '2021-01-18 21:44:40', NULL),
(86, '4817 Halie Neck Apt. 260', 47, '2021-01-18 21:44:40', '2021-01-18 21:44:40', NULL),
(87, '231 Baumbach Fork Apt. 720', 47, '2021-01-18 21:44:40', '2021-01-18 21:44:40', NULL),
(88, '830 Beatty Brook', 48, '2021-01-18 21:44:41', '2021-01-18 21:44:41', NULL),
(89, '5746 Jaden Divide', 45, '2021-01-18 21:44:41', '2021-01-18 21:44:41', NULL),
(90, '62071 Smith Haven Suite 254', 33, '2021-01-18 21:44:41', '2021-01-18 21:44:41', NULL),
(91, '63978 Kavon Village', 42, '2021-01-18 21:44:41', '2021-01-18 21:44:41', NULL),
(92, '686 Angeline Stravenue Apt. 718', 67, '2021-01-18 21:44:41', '2021-01-18 21:44:41', NULL),
(93, '421 Kay Orchard Apt. 848', 64, '2021-01-18 21:44:41', '2021-01-18 21:44:41', NULL),
(94, '96138 Hessel Manors Suite 683', 35, '2021-01-18 21:44:41', '2021-01-18 21:44:41', NULL),
(95, '6588 Thalia Loop Apt. 967', 42, '2021-01-18 21:44:41', '2021-01-18 21:44:41', NULL),
(96, '5564 Ashlee Streets Suite 090', 61, '2021-01-18 21:44:41', '2021-01-18 21:44:41', NULL),
(97, '18060 Littel Junctions', 38, '2021-01-18 21:44:41', '2021-01-18 21:44:41', NULL),
(98, '50972 Sallie Walks', 52, '2021-01-18 21:44:42', '2021-01-18 21:44:42', NULL),
(99, '76070 Chester Summit', 16, '2021-01-18 21:44:42', '2021-01-18 21:44:42', NULL),
(100, '533 Marion Cove Suite 221', 71, '2021-01-18 21:44:42', '2021-01-18 21:44:42', NULL),
(101, '7224 Ledner Expressway', 73, '2021-01-18 21:44:42', '2021-01-18 21:44:42', NULL),
(102, '85284 Bashirian Fort Suite 789', 46, '2021-01-18 21:44:42', '2021-01-18 21:44:42', NULL),
(103, '1028 Ciara Plaza Apt. 422', 28, '2021-01-18 21:44:42', '2021-01-18 21:44:42', NULL),
(104, '184 Eichmann Underpass', 23, '2021-01-18 21:44:42', '2021-01-18 21:44:42', NULL),
(105, '6981 Marina Glens', 60, '2021-01-18 21:44:43', '2021-01-18 21:44:43', NULL),
(106, '40771 Windler Mountains Suite 934', 68, '2021-01-18 21:44:43', '2021-01-18 21:44:43', NULL),
(107, '37667 Eveline Forges Apt. 162', 53, '2021-01-18 21:44:43', '2021-01-18 21:44:43', NULL),
(108, '50817 Hahn Streets', 31, '2021-01-18 21:44:43', '2021-01-18 21:44:43', NULL),
(109, '275 Treutel Spurs Suite 708', 59, '2021-01-18 21:44:43', '2021-01-18 21:44:43', NULL),
(110, '7760 Haley Springs', 35, '2021-01-18 21:44:43', '2021-01-18 21:44:43', NULL),
(111, '1287 Herzog Flats', 63, '2021-01-18 21:44:43', '2021-01-18 21:44:43', NULL),
(112, '9476 Kaylee Centers Suite 313', 16, '2021-01-18 21:44:44', '2021-01-18 21:44:44', NULL),
(113, '83504 Jaskolski Village Suite 389', 6, '2021-01-18 21:44:44', '2021-01-18 21:44:44', NULL),
(114, '4303 Moises Street', 39, '2021-01-18 21:44:44', '2021-01-18 21:44:44', NULL),
(115, '751 Borer Ways', 17, '2021-01-18 21:44:44', '2021-01-18 21:44:44', NULL),
(116, '8877 Crystel Meadows', 25, '2021-01-18 21:44:44', '2021-01-18 21:44:44', NULL),
(117, '445 Kelley Hills Apt. 671', 52, '2021-01-18 21:44:44', '2021-01-18 21:44:44', NULL),
(118, '4132 Annamarie Route', 38, '2021-01-18 21:44:44', '2021-01-18 21:44:44', NULL),
(119, '132 Esta Lock', 53, '2021-01-18 21:44:45', '2021-01-18 21:44:45', NULL),
(120, '23587 Randall Groves Apt. 387', 7, '2021-01-18 21:44:45', '2021-01-18 21:44:45', NULL),
(121, '5830 Rogahn Track Apt. 347', 42, '2021-01-18 21:44:45', '2021-01-18 21:44:45', NULL),
(122, '8776 Anna Union', 55, '2021-01-18 21:44:45', '2021-01-18 21:44:45', NULL),
(123, '7745 Gerhold Spring', 67, '2021-01-18 21:44:45', '2021-01-18 21:44:45', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `attributes`
--

CREATE TABLE `attributes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `feature` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attributes`
--

INSERT INTO `attributes` (`id`, `feature`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'fruity scent', '2021-04-24 07:08:55', '2021-04-24 07:08:55', NULL),
(2, 'Intoxicating rose', '2021-04-24 07:09:37', '2021-04-24 07:09:37', NULL),
(3, 'Tantalizing scent', '2021-04-24 07:10:14', '2021-04-24 07:10:14', NULL),
(4, 'Non-greasy', '2021-04-24 07:16:55', '2021-04-24 07:16:55', NULL),
(5, 'Dryness-canceling marula', '2021-04-24 07:17:54', '2021-04-24 07:17:54', NULL),
(6, 'Molding cream', '2021-04-24 07:23:13', '2021-04-24 07:23:13', NULL),
(7, 'Flexible resins', '2021-04-24 07:24:21', '2021-04-24 07:24:21', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `attribute_product`
--

CREATE TABLE `attribute_product` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `attribute_id` bigint(20) UNSIGNED NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attribute_product`
--

INSERT INTO `attribute_product` (`id`, `product_id`, `attribute_id`, `value`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 6, 'Splendid', '2021-04-24 10:05:22', '2021-04-24 10:05:22', NULL),
(2, 2, 6, 'Splendid', '2021-04-24 10:10:12', '2021-04-24 10:10:12', NULL),
(3, 3, 7, 'Rocking', '2021-04-24 10:18:27', '2021-04-24 10:18:27', NULL),
(4, 4, 3, 'Scent', '2021-04-24 10:27:30', '2021-04-24 10:27:30', NULL),
(5, 5, 2, 'Scent', '2021-04-24 10:31:43', '2021-04-24 10:31:43', NULL),
(6, 6, 1, 'Scent', '2021-04-24 10:35:55', '2021-04-24 10:35:55', NULL),
(7, 7, 1, 'Scent', '2021-04-24 10:41:36', '2021-04-24 10:41:36', NULL),
(8, 8, 1, 'Scent', '2021-04-24 10:48:01', '2021-04-24 10:48:01', NULL),
(9, 9, 4, 'Lotions', '2021-04-24 10:51:55', '2021-04-24 10:51:55', NULL),
(10, 9, 5, 'No dryness', '2021-04-24 10:51:55', '2021-04-24 10:51:55', NULL),
(11, 10, 4, 'Not itching', '2021-04-24 10:54:10', '2021-04-24 10:54:10', NULL),
(12, 11, 1, 'For men', '2021-04-25 01:09:58', '2021-04-25 01:09:58', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `attribute_sub_category`
--

CREATE TABLE `attribute_sub_category` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `attribute_id` bigint(20) UNSIGNED NOT NULL,
  `sub_category_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attribute_sub_category`
--

INSERT INTO `attribute_sub_category` (`id`, `attribute_id`, `sub_category_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, NULL, NULL, NULL),
(2, 2, 2, NULL, NULL, NULL),
(3, 3, 3, NULL, NULL, NULL),
(4, 4, 4, NULL, NULL, NULL),
(5, 4, 5, NULL, NULL, NULL),
(6, 5, 5, NULL, NULL, NULL),
(7, 6, 6, NULL, NULL, NULL),
(8, 7, 7, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `total_amt` double NOT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `product_id`, `user_id`, `quantity`, `total_amt`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 9, 220, 1, 800, NULL, '2021-04-25 01:43:58', '2021-04-25 01:43:58', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Perfume', 'perfume', '2021-04-24 07:13:01', '2021-04-24 07:13:01', NULL),
(2, 'Lotions', 'lotions', '2021-04-24 07:19:39', '2021-04-24 07:19:39', NULL),
(6, 'Hair Cream', 'hair-cream', '2021-04-25 01:39:52', '2021-04-25 01:39:52', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `category_subcategory`
--

CREATE TABLE `category_subcategory` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `sub_category_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category_subcategory`
--

INSERT INTO `category_subcategory` (`id`, `category_id`, `sub_category_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, NULL, NULL, NULL),
(2, 1, 2, NULL, NULL, NULL),
(3, 1, 3, NULL, NULL, NULL),
(4, 2, 4, NULL, NULL, NULL),
(5, 2, 5, NULL, NULL, NULL),
(8, 6, 6, NULL, NULL, NULL),
(9, 6, 7, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `region_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`, `region_id`) VALUES
(1, 'Baneshwor', '2020-06-25 06:50:48', '2020-06-25 07:30:28', NULL, 1),
(2, 'Thapathali', '2020-06-25 06:50:48', '2020-06-25 07:07:18', NULL, 1),
(5, 'koteshwor', '2020-06-25 06:55:01', '2020-06-25 07:07:33', NULL, 1),
(6, 'Urban Tunnel', '2021-01-18 21:37:48', '2021-01-18 21:37:48', NULL, 7),
(7, 'Bartell Passage', '2021-01-18 21:37:48', '2021-01-18 21:37:48', NULL, 8),
(8, 'Cathryn Meadows', '2021-01-18 21:37:48', '2021-01-18 21:37:48', NULL, 1),
(9, 'Collier Mountains', '2021-01-18 21:37:48', '2021-01-18 21:37:48', NULL, 9),
(10, 'Hollie Estates', '2021-01-18 21:37:48', '2021-01-18 21:37:48', NULL, 10),
(11, 'Cremin Square', '2021-01-18 21:37:48', '2021-01-18 21:37:48', NULL, 6),
(12, 'Gilda Ville', '2021-01-18 21:37:48', '2021-01-18 21:37:48', NULL, 14),
(13, 'Forest Ports', '2021-01-18 21:37:49', '2021-01-18 21:37:49', NULL, 9),
(14, 'Buck Trafficway', '2021-01-18 21:37:49', '2021-01-18 21:37:49', NULL, 23),
(15, 'Mac Vista', '2021-01-18 21:37:49', '2021-01-18 21:37:49', NULL, 4),
(16, 'Reid Stream', '2021-01-18 21:37:49', '2021-01-18 21:37:49', NULL, 5),
(17, 'Lehner Falls', '2021-01-18 21:37:49', '2021-01-18 21:37:49', NULL, 27),
(18, 'Rollin Viaduct', '2021-01-18 21:37:49', '2021-01-18 21:37:49', NULL, 15),
(19, 'Champlin Stravenue', '2021-01-18 21:37:49', '2021-01-18 21:37:49', NULL, 10),
(20, 'Pacocha Brook', '2021-01-18 21:37:50', '2021-01-18 21:37:50', NULL, 14),
(21, 'Ibrahim Lodge', '2021-01-18 21:37:50', '2021-01-18 21:37:50', NULL, 8),
(22, 'Hermann Terrace', '2021-01-18 21:37:50', '2021-01-18 21:37:50', NULL, 12),
(23, 'Moses Park', '2021-01-18 21:37:50', '2021-01-18 21:37:50', NULL, 28),
(24, 'Little Walks', '2021-01-18 21:37:50', '2021-01-18 21:37:50', NULL, 8),
(25, 'Wehner Mews', '2021-01-18 21:37:50', '2021-01-18 21:37:50', NULL, 28),
(26, 'Ludie Flat', '2021-01-18 21:37:50', '2021-01-18 21:37:50', NULL, 24),
(27, 'Gerhold Lock', '2021-01-18 21:37:51', '2021-01-18 21:37:51', NULL, 29),
(28, 'Oren Rue', '2021-01-18 21:37:51', '2021-01-18 21:37:51', NULL, 9),
(29, 'Dooley Cliff', '2021-01-18 21:37:51', '2021-01-18 21:37:51', NULL, 13),
(30, 'Terry Freeway', '2021-01-18 21:37:51', '2021-01-18 21:37:51', NULL, 14),
(31, 'Carole Cape', '2021-01-18 21:37:51', '2021-01-18 21:37:51', NULL, 5),
(32, 'Brennon Light', '2021-01-18 21:37:51', '2021-01-18 21:37:51', NULL, 17),
(33, 'Aufderhar Points', '2021-01-18 21:37:51', '2021-01-18 21:37:51', NULL, 19),
(34, 'Goldner Plaza', '2021-01-18 21:37:51', '2021-01-18 21:37:51', NULL, 20),
(35, 'Nolan Village', '2021-01-18 21:37:51', '2021-01-18 21:37:51', NULL, 32),
(36, 'Juliet Walk', '2021-01-18 21:37:52', '2021-01-18 21:37:52', NULL, 18),
(37, 'Peggie Ville', '2021-01-18 21:37:52', '2021-01-18 21:37:52', NULL, 6),
(38, 'Willms Grove', '2021-01-18 21:37:52', '2021-01-18 21:37:52', NULL, 20),
(39, 'Ashleigh Groves', '2021-01-18 21:37:52', '2021-01-18 21:37:52', NULL, 33),
(40, 'Cameron Plain', '2021-01-18 21:37:52', '2021-01-18 21:37:52', NULL, 15),
(41, 'Gislason Lakes', '2021-01-18 21:44:02', '2021-01-18 21:44:02', NULL, 20),
(42, 'Hermiston Trail', '2021-01-18 21:44:02', '2021-01-18 21:44:02', NULL, 4),
(43, 'Lemke Canyon', '2021-01-18 21:44:02', '2021-01-18 21:44:02', NULL, 22),
(44, 'Douglas Grove', '2021-01-18 21:44:02', '2021-01-18 21:44:02', NULL, 21),
(45, 'Kautzer Harbors', '2021-01-18 21:44:02', '2021-01-18 21:44:02', NULL, 4),
(46, 'Sauer Manor', '2021-01-18 21:44:03', '2021-01-18 21:44:03', NULL, 11),
(47, 'Jaskolski Ramp', '2021-01-18 21:44:03', '2021-01-18 21:44:03', NULL, 10),
(48, 'Beer Keys', '2021-01-18 21:44:03', '2021-01-18 21:44:03', NULL, 19),
(49, 'Briana Locks', '2021-01-18 21:44:03', '2021-01-18 21:44:03', NULL, 13),
(50, 'Wuckert Stravenue', '2021-01-18 21:44:03', '2021-01-18 21:44:03', NULL, 6),
(51, 'Zander Village', '2021-01-18 21:44:04', '2021-01-18 21:44:04', NULL, 26),
(52, 'Elliot Squares', '2021-01-18 21:44:04', '2021-01-18 21:44:04', NULL, 32),
(53, 'Franecki Plaza', '2021-01-18 21:44:04', '2021-01-18 21:44:04', NULL, 22),
(54, 'Powlowski Ramp', '2021-01-18 21:44:04', '2021-01-18 21:44:04', NULL, 32),
(55, 'Yvonne Stravenue', '2021-01-18 21:44:05', '2021-01-18 21:44:05', NULL, 26),
(56, 'Considine Estates', '2021-01-18 21:44:05', '2021-01-18 21:44:05', NULL, 14),
(57, 'Celia Junctions', '2021-01-18 21:44:05', '2021-01-18 21:44:05', NULL, 7),
(58, 'Geraldine Locks', '2021-01-18 21:44:05', '2021-01-18 21:44:05', NULL, 15),
(59, 'Garrick Pines', '2021-01-18 21:44:05', '2021-01-18 21:44:05', NULL, 22),
(60, 'Tremblay Villages', '2021-01-18 21:44:05', '2021-01-18 21:44:05', NULL, 22),
(61, 'Ericka Forges', '2021-01-18 21:44:05', '2021-01-18 21:44:05', NULL, 20),
(62, 'Price Pass', '2021-01-18 21:44:05', '2021-01-18 21:44:05', NULL, 9),
(63, 'Mitchell Fields', '2021-01-18 21:44:06', '2021-01-18 21:44:06', NULL, 18),
(64, 'May Common', '2021-01-18 21:44:06', '2021-01-18 21:44:06', NULL, 2),
(65, 'Moshe Shore', '2021-01-18 21:44:06', '2021-01-18 21:44:06', NULL, 20),
(66, 'Connelly Glen', '2021-01-18 21:44:06', '2021-01-18 21:44:06', NULL, 27),
(67, 'Jerde Green', '2021-01-18 21:44:06', '2021-01-18 21:44:06', NULL, 15),
(68, 'Georgianna Garden', '2021-01-18 21:44:06', '2021-01-18 21:44:06', NULL, 31),
(69, 'Clara Crescent', '2021-01-18 21:44:06', '2021-01-18 21:44:06', NULL, 26),
(70, 'Lexus Vista', '2021-01-18 21:44:06', '2021-01-18 21:44:06', NULL, 21),
(71, 'Arnulfo Glens', '2021-01-18 21:44:07', '2021-01-18 21:44:07', NULL, 17),
(72, 'Jones Square', '2021-01-18 21:44:07', '2021-01-18 21:44:07', NULL, 21),
(73, 'McDermott Walks', '2021-01-18 21:44:07', '2021-01-18 21:44:07', NULL, 19),
(74, 'Madalyn Throughway', '2021-01-18 21:44:07', '2021-01-18 21:44:07', NULL, 21),
(75, 'Helmer Streets', '2021-01-18 21:44:07', '2021-01-18 21:44:07', NULL, 33);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_02_26_063329_create_categories_table', 1),
(5, '2020_02_26_063544_create_sub_categories_table', 1),
(6, '2020_02_26_070404_create_products_table', 1),
(7, '2020_02_26_071310_create_category_subcategory_table', 1),
(8, '2020_02_26_134255_create_product_images_table', 1),
(9, '2020_03_06_063639_add_providers_provider_id_on_users_table', 1),
(10, '2020_03_09_171022_create_permission_tables', 1),
(11, '2020_03_21_102011_create_product_sub_category_table', 1),
(12, '2020_03_22_060601_create_attributes_table', 1),
(13, '2020_03_22_065928_create_attribute_sub_category_table', 1),
(14, '2020_03_22_123637_create_attribute_product_table', 1),
(15, '2020_04_26_074143_create_carts_table', 1),
(17, '2020_04_26_105559_create_cities_table', 2),
(18, '2020_04_26_111010_add_address_city_image_phone_on_users_table', 3),
(19, '2020_04_26_175901_create_reviews_table', 4),
(20, '2020_05_02_121809_create_product_user_table', 5),
(21, '2020_05_02_122431_add_user_id_on_products_table', 6),
(24, '2020_05_03_115834_create_notifications_table', 7),
(25, '2020_05_10_143439_add_views_on_reviews_table', 8),
(26, '2020_05_10_145020_add_views_on_reviews_table', 9),
(28, '2020_05_11_115039_alter_status_on_products_table', 10),
(29, '2020_06_07_080314_create_orders_table', 11),
(30, '2020_06_07_082144_create_order_details_table', 12),
(31, '2020_06_07_083023_create_payments_table', 13),
(33, '2020_06_08_072754_create_shippings_table', 14),
(34, '2020_06_10_164019_add_shipping_id_on_order_tables', 15),
(35, '2020_06_17_123643_add_status_on_order_details_table', 16),
(36, '2020_06_18_140554_alter_field_order_number_from_integer_to_string', 17),
(37, '2020_06_18_165250_rename_status_to_phone_status_on_orders_table', 18),
(38, '2020_06_22_104813_add_quantity_on_products_table', 19),
(39, '2020_06_25_111634_create_regions_table', 20),
(40, '2020_06_25_112115_add_region_id_on_cities_table', 21),
(41, '2020_06_25_112519_create_areas_table', 22),
(42, '2020_06_25_145011_add_region_id_area_id_on_users_table', 23),
(43, '2020_06_25_164913_add_region_id_area_id_on_shippings_table', 24),
(44, '2020_07_16_094324_change_field_type_of_value_on_attribute_product', 25),
(45, '2021_01_16_132039_change_used_for_nullable_on_products_table', 26),
(46, '2021_01_17_152742_add_sold_qty_on_products_table', 27),
(47, '2021_04_22_182616_create_stylists_table', 28),
(48, '2021_04_22_183111_create_appointments_table', 29);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\User', 1),
(1, 'App\\User', 220),
(2, 'App\\User', 2),
(2, 'App\\User', 3),
(2, 'App\\User', 4),
(2, 'App\\User', 5),
(2, 'App\\User', 6),
(2, 'App\\User', 7),
(2, 'App\\User', 8),
(2, 'App\\User', 9),
(2, 'App\\User', 10),
(2, 'App\\User', 11),
(2, 'App\\User', 12),
(2, 'App\\User', 13),
(2, 'App\\User', 14),
(2, 'App\\User', 15),
(2, 'App\\User', 16),
(2, 'App\\User', 17),
(2, 'App\\User', 18),
(2, 'App\\User', 19),
(2, 'App\\User', 20),
(2, 'App\\User', 21),
(2, 'App\\User', 22),
(2, 'App\\User', 23),
(2, 'App\\User', 24),
(2, 'App\\User', 25),
(2, 'App\\User', 26),
(2, 'App\\User', 27),
(2, 'App\\User', 28),
(2, 'App\\User', 29),
(2, 'App\\User', 30),
(2, 'App\\User', 31),
(2, 'App\\User', 32),
(2, 'App\\User', 33),
(2, 'App\\User', 34),
(2, 'App\\User', 35),
(2, 'App\\User', 36),
(2, 'App\\User', 37),
(2, 'App\\User', 38),
(2, 'App\\User', 39),
(2, 'App\\User', 40),
(2, 'App\\User', 41),
(2, 'App\\User', 42),
(2, 'App\\User', 43),
(2, 'App\\User', 44),
(2, 'App\\User', 45),
(2, 'App\\User', 46),
(2, 'App\\User', 47),
(2, 'App\\User', 48),
(2, 'App\\User', 49),
(2, 'App\\User', 50),
(2, 'App\\User', 51),
(2, 'App\\User', 52),
(2, 'App\\User', 53),
(2, 'App\\User', 54),
(2, 'App\\User', 55),
(2, 'App\\User', 56),
(2, 'App\\User', 57),
(2, 'App\\User', 58),
(2, 'App\\User', 59),
(2, 'App\\User', 60),
(2, 'App\\User', 61),
(2, 'App\\User', 62),
(2, 'App\\User', 63),
(2, 'App\\User', 64),
(2, 'App\\User', 65),
(2, 'App\\User', 66),
(2, 'App\\User', 67),
(2, 'App\\User', 68),
(2, 'App\\User', 69),
(2, 'App\\User', 70),
(2, 'App\\User', 71),
(2, 'App\\User', 72),
(2, 'App\\User', 73),
(2, 'App\\User', 74),
(2, 'App\\User', 75),
(2, 'App\\User', 76),
(2, 'App\\User', 77),
(2, 'App\\User', 78),
(2, 'App\\User', 79),
(2, 'App\\User', 80),
(2, 'App\\User', 81),
(2, 'App\\User', 82),
(2, 'App\\User', 83),
(2, 'App\\User', 84),
(2, 'App\\User', 85),
(2, 'App\\User', 86),
(2, 'App\\User', 87),
(2, 'App\\User', 88),
(2, 'App\\User', 89),
(2, 'App\\User', 90),
(2, 'App\\User', 91),
(2, 'App\\User', 92),
(2, 'App\\User', 93),
(2, 'App\\User', 94),
(2, 'App\\User', 95),
(2, 'App\\User', 96),
(2, 'App\\User', 97),
(2, 'App\\User', 98),
(2, 'App\\User', 99),
(2, 'App\\User', 100),
(2, 'App\\User', 101),
(2, 'App\\User', 102),
(2, 'App\\User', 103),
(2, 'App\\User', 104),
(2, 'App\\User', 105),
(2, 'App\\User', 106),
(2, 'App\\User', 107),
(2, 'App\\User', 108),
(2, 'App\\User', 109),
(2, 'App\\User', 110),
(2, 'App\\User', 111),
(2, 'App\\User', 112),
(2, 'App\\User', 113),
(2, 'App\\User', 114),
(2, 'App\\User', 115),
(2, 'App\\User', 116),
(2, 'App\\User', 117),
(2, 'App\\User', 118),
(2, 'App\\User', 119),
(2, 'App\\User', 120),
(2, 'App\\User', 121),
(2, 'App\\User', 122),
(2, 'App\\User', 123),
(2, 'App\\User', 124),
(2, 'App\\User', 125),
(2, 'App\\User', 126),
(2, 'App\\User', 127),
(2, 'App\\User', 128),
(2, 'App\\User', 129),
(2, 'App\\User', 130),
(2, 'App\\User', 131),
(2, 'App\\User', 132),
(2, 'App\\User', 133),
(2, 'App\\User', 134),
(2, 'App\\User', 135),
(2, 'App\\User', 136),
(2, 'App\\User', 137),
(2, 'App\\User', 138),
(2, 'App\\User', 139),
(2, 'App\\User', 140),
(2, 'App\\User', 141),
(2, 'App\\User', 142),
(2, 'App\\User', 143),
(2, 'App\\User', 144),
(2, 'App\\User', 145),
(2, 'App\\User', 146),
(2, 'App\\User', 147),
(2, 'App\\User', 149),
(2, 'App\\User', 151),
(2, 'App\\User', 152),
(2, 'App\\User', 153),
(2, 'App\\User', 154),
(2, 'App\\User', 155),
(2, 'App\\User', 156),
(2, 'App\\User', 157),
(2, 'App\\User', 158),
(2, 'App\\User', 159),
(2, 'App\\User', 160),
(2, 'App\\User', 161),
(2, 'App\\User', 162),
(2, 'App\\User', 163),
(2, 'App\\User', 164),
(2, 'App\\User', 165),
(2, 'App\\User', 166),
(2, 'App\\User', 167),
(2, 'App\\User', 168),
(2, 'App\\User', 169),
(2, 'App\\User', 170),
(2, 'App\\User', 171),
(2, 'App\\User', 172),
(2, 'App\\User', 173),
(2, 'App\\User', 174),
(2, 'App\\User', 175),
(2, 'App\\User', 176),
(2, 'App\\User', 177),
(2, 'App\\User', 178),
(2, 'App\\User', 179),
(2, 'App\\User', 180),
(2, 'App\\User', 181),
(2, 'App\\User', 182),
(2, 'App\\User', 183),
(2, 'App\\User', 184),
(2, 'App\\User', 185),
(2, 'App\\User', 186),
(2, 'App\\User', 187),
(2, 'App\\User', 188),
(2, 'App\\User', 189),
(2, 'App\\User', 190),
(2, 'App\\User', 191),
(2, 'App\\User', 192),
(2, 'App\\User', 193),
(2, 'App\\User', 194),
(2, 'App\\User', 195),
(2, 'App\\User', 196),
(2, 'App\\User', 197),
(2, 'App\\User', 198),
(2, 'App\\User', 199),
(2, 'App\\User', 200),
(2, 'App\\User', 201),
(2, 'App\\User', 202),
(2, 'App\\User', 203),
(2, 'App\\User', 204),
(2, 'App\\User', 205),
(2, 'App\\User', 206),
(2, 'App\\User', 207),
(2, 'App\\User', 208),
(2, 'App\\User', 209),
(2, 'App\\User', 210),
(2, 'App\\User', 211),
(2, 'App\\User', 212),
(2, 'App\\User', 213),
(2, 'App\\User', 214),
(2, 'App\\User', 215),
(2, 'App\\User', 216),
(2, 'App\\User', 217),
(2, 'App\\User', 218),
(2, 'App\\User', 221),
(2, 'App\\User', 222),
(2, 'App\\User', 223);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('1','2','3') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `title`, `message`, `url`, `status`, `user_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(40, NULL, 'New order for Voluptas nesciunt.', 'http://localhost:8000/orders', '1', 25, '2021-04-09 10:05:28', '2021-04-09 10:05:28', NULL),
(41, NULL, 'New order for Voluptas nesciunt.', 'http://localhost:8000/orders', '1', 25, '2021-04-09 10:06:36', '2021-04-09 10:06:36', NULL),
(42, NULL, 'New order for Lenovo', 'http://localhost:8000/orders', '3', 1, '2021-04-09 10:07:43', '2021-04-09 10:08:06', NULL),
(43, NULL, 'Your order of Lenovo has been approved by seller. Now you can pay through E-sewa', 'http://localhost:8000/orders', '2', 8, '2021-04-09 10:08:01', '2021-04-09 10:08:25', NULL),
(44, NULL, 'Your product \"Tea Tree Shaping Cream\" is approved.', 'http://127.0.0.1:8000/myproducts', '3', 220, '2021-04-24 10:07:19', '2021-04-24 10:07:53', NULL),
(45, NULL, 'Your product \"Tea Tree Shaping Cream\" is not approved.', 'http://127.0.0.1:8000/drafts', '3', 220, '2021-04-24 10:12:39', '2021-04-24 10:12:55', NULL),
(46, NULL, 'Your product \"Smooth Viking Forming Cream\" is approved.', 'http://127.0.0.1:8000/myproducts', '3', 220, '2021-04-24 10:19:21', '2021-04-24 10:22:16', NULL),
(47, NULL, 'Your product \"Viva La Juicy Perfume\" is approved.', 'http://127.0.0.1:8000/myproducts', '3', 8, '2021-04-24 10:29:07', '2021-04-24 10:33:11', NULL),
(48, NULL, 'Your product \"Eternity Perfume\" is approved.', 'http://127.0.0.1:8000/myproducts', '3', 8, '2021-04-24 10:32:01', '2021-04-24 10:33:11', NULL),
(49, NULL, 'Your product \"Bright Crystal Perfume\" is approved.', 'http://127.0.0.1:8000/myproducts', '1', 8, '2021-04-24 10:38:00', '2021-04-24 10:38:00', NULL),
(50, NULL, 'Your product \"Divain\" is approved.', 'http://127.0.0.1:8000/myproducts', '1', 8, '2021-04-24 10:48:24', '2021-04-24 10:48:24', NULL),
(51, NULL, 'Your product \"Bright Crystal Versace\" is approved.', 'http://127.0.0.1:8000/myproducts', '1', 8, '2021-04-24 10:48:45', '2021-04-24 10:48:45', NULL),
(52, NULL, 'Your product \"Aveeno Daily Moisturizing Lotion\" is approved.', 'http://127.0.0.1:8000/myproducts', '1', 8, '2021-04-24 10:52:10', '2021-04-24 10:52:10', NULL),
(53, NULL, 'Your product \"Nécessaire The Body Lotion\" is approved.', 'http://127.0.0.1:8000/myproducts', '3', 220, '2021-04-24 10:54:33', '2021-04-24 11:33:40', NULL),
(54, NULL, 'Your product \"Denver\" is approved.', 'http://127.0.0.1:8000/myproducts', '3', 3, '2021-04-25 01:16:32', '2021-04-25 01:19:12', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `order_number` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_date` date NOT NULL,
  `total` double DEFAULT NULL,
  `phone_status` smallint(6) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `shipping_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `order_number`, `order_date`, `total`, `phone_status`, `created_at`, `updated_at`, `deleted_at`, `shipping_id`) VALUES
(29, 1, 'i6C20C5z', '2021-04-09', 1, 0, '2021-04-09 10:05:27', '2021-04-09 10:05:27', NULL, NULL),
(30, 8, 'vqkxJwdz', '2021-04-09', 1, 1, '2021-04-09 10:06:35', '2021-04-09 10:06:35', NULL, NULL),
(31, 8, 'wMZeaQok', '2021-04-09', 1, 1, '2021-04-09 10:07:42', '2021-04-09 10:07:42', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `quantity` smallint(6) NOT NULL,
  `total` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `status` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `amount` double NOT NULL,
  `payment_method` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `transaction_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Manage admin panel', 'web', '2020-04-26 06:06:56', '2020-04-26 06:06:56'),
(2, 'user-dashboard', 'web', '2020-04-26 07:10:23', '2020-04-26 07:10:23');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `featured_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `brand` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expiry_time` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `condition` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `used_for` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery` tinyint(1) NOT NULL,
  `delivery_area` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_charge` double DEFAULT NULL,
  `warranty_period` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `views` int(11) DEFAULT NULL,
  `likes` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `sold_qty` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `title`, `slug`, `product_code`, `description`, `featured_image`, `brand`, `expiry_time`, `price`, `condition`, `used_for`, `delivery`, `delivery_area`, `delivery_charge`, `warranty_period`, `views`, `likes`, `created_at`, `updated_at`, `deleted_at`, `user_id`, `status`, `quantity`, `sold_qty`) VALUES
(1, 'Tea Tree Shaping Cream', 'tea-tree-shaping-cream', 'tea-tree-shaping-cream81271', 'Tea Tree Shaping Cream contains a lightweight formula that provides a strong, movable hold unlike any other product on the market. For the ability to keep your hair styled all day but the flexibility to shape it as you apply, you’ll want to try this highly-rated, incredible smelling cream.As a very popular shaping cream for men, it doesn’t take much for this flake-free formula to get your hair ready for a day of success.', 'products/jrsRUlbMUDVad4e76Vkp0Epc6p21n8gvJDKxHfDC.jpg', NULL, '11', 16, 'New(not used)', '5 month', 0, '2', 200, '5 month', NULL, NULL, '2021-04-24 10:05:22', '2021-04-24 10:07:19', NULL, 220, 3, 1, NULL),
(2, 'Tea Tree Shaping Cream', 'tea-tree-shaping-cream', 'tea-tree-shaping-cream56632', 'Tea Tree Shaping Cream contains a lightweight formula that provides a strong, movable hold unlike any other product on the market. For the ability to keep your hair styled all day but the flexibility to shape it as you apply, you’ll want to try this highly-rated, incredible smelling cream.As a very popular shaping cream for men, it doesn’t take much for this flake-free formula to get your hair ready for a day of success.', 'products/VnsR4BwglQ5STnWRAfJP0rguWcIrSsWMs9YzsJkf.jpg', NULL, '9', 350, 'Used Few times', '3 month', 0, '0', 200, '5 month', NULL, NULL, '2021-04-24 10:10:12', '2021-04-24 10:12:39', NULL, 220, 5, 1, NULL),
(3, 'Smooth Viking Forming Cream', 'smooth-viking-forming-cream', 'smooth-viking-forming-cream81251', 'Smooth Viking’s Forming Cream provides ample hold with a matte finish to keep your style looking clean and neat all day. If you’re an active guy who plays sports or works out, this molding cream will keep your hair in place even when you sweat.', 'products/NynlVuTF837JUgX669blGxwzEoPvoEvN7bIUz5XJ.jpg', NULL, '11', 700, 'New(not used)', NULL, 0, '1', 200, '9 month', NULL, NULL, '2021-04-24 10:18:27', '2021-04-24 10:19:21', NULL, 220, 3, 1, NULL),
(4, 'Viva La Juicy Perfume', 'viva-la-juicy-perfume', 'viva-la-juicy-perfume25199', 'Viva La Juicy by Juicy Couture Perfume. Viva La Juicy has base notes of amber, sandalwood, pralines, vanilla, and caramel. The top notes of Viva La Juicy by Juicy Couture consist of a sweet combination of juicy mandarin, honeysuckle, jasmine, gardenia, and wild berries.', 'products/l7bP9oH8bIcZSIBnL2b4PEFLHYEOVEzKZG0gGtcw.jpg', NULL, '12', 1000, 'New(not used)', NULL, 0, '1', 200, '7 month', NULL, NULL, '2021-04-24 10:27:30', '2021-04-24 10:29:07', NULL, 8, 3, 1, NULL),
(5, 'Eternity Perfume', 'eternity-perfume', 'eternity-perfume36622', 'Eternity by Calvin Klein Perfume. Rediscover passion with a feminine fragrance that captures the essence of timeless romance. A classic Calvin Klein composition, Eternity for women is a 1988 release. In this popular creation, vibrant green notes and the fresh citrus property of mandarin orange are layered with intoxicating rose and freesia.', 'products/D3xa13peSrBlvdHWtkquQpDLfdn5x6yFRf8J0Nw4.jpg', NULL, '12', 3000, 'New(not used)', NULL, 0, '0', 200, '5 month', NULL, NULL, '2021-04-24 10:31:43', '2021-04-24 10:32:01', NULL, 8, 3, 1, NULL),
(6, 'Bright Crystal Perfume', 'bright-crystal-perfume', 'bright-crystal-perfume55015', 'Bright Crystal by Versace Perfume. Rejuvenate and refresh your spirit with a spritz of Bright Crystal, a Versace Scent for free-spirited and adventurous women. This crisp, fruity scent was released in 2006 and is designed for everyday wear. Apply it before a long day at the office or a fun night with friends to feel vibrant and lively throughout the day. Bright Crystal starts with the fruity sent of pomegranate and follows up with medium notes of yuzu, peony and freshly picked magnolias.', 'products/zWTgEzYlZUL81iXruFz4lKdIZ907TXrptpSUSnkn.jpg', NULL, '12', 5000, 'New(not used)', NULL, 0, '2', 400, '10 month', NULL, NULL, '2021-04-24 10:35:55', '2021-04-24 10:38:38', NULL, 8, 4, 0, NULL),
(7, 'Bright Crystal Versace', 'bright-crystal-versace', 'bright-crystal-versace66865', 'Bright Crystal by Versace Perfume. Rejuvenate and refresh your spirit with a spritz of Bright Crystal, a Versace Scent for free-spirited and adventurous women. This crisp, fruity scent was released in 2006 and is designed for everyday wear. Apply it before a long day at the office or a fun night with friends to feel vibrant and lively throughout the day. Bright Crystal starts with the fruity sent of pomegranate and follows up with medium notes of yuzu, peony and freshly picked magnolias.', 'products/tdli95bEoTNd2qo7OQ32fxsQWaQF2E9BNwkOYyxv.jpg', NULL, '12', 4000, 'New(not used)', NULL, 1, NULL, NULL, '5 month', NULL, NULL, '2021-04-24 10:41:36', '2021-04-24 10:48:45', NULL, 8, 3, 1, NULL),
(8, 'Divain', 'divain', 'divain82791', 'An indisputably sensual fragrance for the romantic woman who is sensitive, but at the same time very passionate. She is completely daring and doesn’t doubt when faced with difficult situations.', 'products/Rqv6cJzKYC9k4zJlPCpK2khItoibaR7Yg6Vv5kL7.jpg', NULL, '9', 5000, 'New(not used)', NULL, 0, '1', 400, '7 month', NULL, NULL, '2021-04-24 10:48:01', '2021-04-24 10:48:24', NULL, 8, 3, 1, NULL),
(9, 'Aveeno Daily Moisturizing Lotion', 'aveeno-daily-moisturizing-lotion', 'aveeno-daily-moisturizing-lotion2497', 'There\'s a good reason Aveeno\'s Daily Moisturizing Lotion has won an Allure Reader\'s Choice Award for a straight decade: It\'s affordable, fragrance-free, non-irritating, non-greasy, and it works, thanks to skin-soothing ingredients like oatmeal and glycerin.', 'products/oAKWmUd7HugjZZvFKdHz8AB4A6UMsG50yeGcyUL5.jpg', NULL, '4', 800, 'New(not used)', NULL, 0, '0', 500, '6 month', NULL, NULL, '2021-04-24 10:51:55', '2021-04-24 10:52:10', NULL, 8, 3, 2, NULL),
(10, 'Nécessaire The Body Lotion', 'necessaire-the-body-lotion', 'necessaire-the-body-lotion43958', 'Formulated at a gentle pH of 4.75 to 5.75 (which is around skin\'s natural pH), Nécessaire\'s The Body Lotion is a very solid choice if you\'re looking for a non-irritating, fragrance-free moisturizer. It\'s loaded up with dryness-canceling marula, cacay, and meadowfoam oils for an immediate softening effect, while niacinamide, vitamin C, and vitamin E strengthen skin and repair texture for the long run.', 'products/l3XgGZZndRY5n6UvPiF8Nj4AJHxwY7mfQk2npjvQ.jpg', NULL, '10', 4000, 'Used Few times', '3 day', 1, NULL, NULL, '4 month', NULL, NULL, '2021-04-24 10:54:10', '2021-04-24 10:54:33', NULL, 220, 3, -1, NULL),
(11, 'Denver', 'denver', 'denver21208', 'Denver For Men – Denver, the scent of success. A radically fresh woody fragrance that elicits freshness in the daytime.', 'products/JmOdVKrdkp6yJKTxnr6MggEcwY4LIkfqpJtMzUTp.jpg', NULL, '12', 250, 'New(not used)', NULL, 1, NULL, NULL, '2 year', NULL, NULL, '2021-04-25 01:09:58', '2021-04-25 01:16:32', NULL, 3, 3, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_sub_category`
--

CREATE TABLE `product_sub_category` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sub_category_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_sub_category`
--

INSERT INTO `product_sub_category` (`id`, `sub_category_id`, `product_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 6, 1, NULL, NULL, NULL),
(2, 6, 2, NULL, NULL, NULL),
(3, 7, 3, NULL, NULL, NULL),
(4, 3, 4, NULL, NULL, NULL),
(5, 2, 5, NULL, NULL, NULL),
(6, 1, 6, NULL, NULL, NULL),
(7, 1, 7, NULL, NULL, NULL),
(8, 1, 8, NULL, NULL, NULL),
(9, 5, 9, NULL, NULL, NULL),
(10, 4, 10, NULL, NULL, NULL),
(11, 1, 11, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `regions`
--

CREATE TABLE `regions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `regions`
--

INSERT INTO `regions` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Kathmandu', '2020-06-25 06:50:48', '2020-06-25 06:50:48', NULL),
(2, 'Bhaktapur', '2020-06-25 06:51:29', '2020-06-25 07:09:09', NULL),
(4, 'East Wava', '2021-01-18 21:31:36', '2021-01-18 21:31:36', NULL),
(5, 'South Edwardside', '2021-01-18 21:31:37', '2021-01-18 21:31:37', NULL),
(6, 'South Genesis', '2021-01-18 21:31:37', '2021-01-18 21:31:37', NULL),
(7, 'Lake Gilbertstad', '2021-01-18 21:31:37', '2021-01-18 21:31:37', NULL),
(8, 'North Aimee', '2021-01-18 21:31:37', '2021-01-18 21:31:37', NULL),
(9, 'East Concepcionport', '2021-01-18 21:31:38', '2021-01-18 21:31:38', NULL),
(10, 'East Christiana', '2021-01-18 21:31:38', '2021-01-18 21:31:38', NULL),
(11, 'Marvintown', '2021-01-18 21:31:38', '2021-01-18 21:31:38', NULL),
(12, 'Isabellefort', '2021-01-18 21:31:38', '2021-01-18 21:31:38', NULL),
(13, 'South Alexandrine', '2021-01-18 21:31:38', '2021-01-18 21:31:38', NULL),
(14, 'West Gracieburgh', '2021-01-18 21:33:12', '2021-01-18 21:33:12', NULL),
(15, 'Gabeport', '2021-01-18 21:33:12', '2021-01-18 21:33:12', NULL),
(16, 'Felixfurt', '2021-01-18 21:33:13', '2021-01-18 21:33:13', NULL),
(17, 'Cyrilport', '2021-01-18 21:33:13', '2021-01-18 21:33:13', NULL),
(18, 'South Connor', '2021-01-18 21:33:13', '2021-01-18 21:33:13', NULL),
(19, 'South Vitoland', '2021-01-18 21:33:13', '2021-01-18 21:33:13', NULL),
(20, 'East Orlostad', '2021-01-18 21:33:14', '2021-01-18 21:33:14', NULL),
(21, 'Annabellstad', '2021-01-18 21:33:14', '2021-01-18 21:33:14', NULL),
(22, 'Hegmanntown', '2021-01-18 21:33:14', '2021-01-18 21:33:14', NULL),
(23, 'South Eulahborough', '2021-01-18 21:33:14', '2021-01-18 21:33:14', NULL),
(24, 'Port Sigmund', '2021-01-18 21:33:14', '2021-01-18 21:33:14', NULL),
(25, 'South Alysaberg', '2021-01-18 21:33:15', '2021-01-18 21:33:15', NULL),
(26, 'Beatriceport', '2021-01-18 21:33:15', '2021-01-18 21:33:15', NULL),
(27, 'Jonesland', '2021-01-18 21:33:15', '2021-01-18 21:33:15', NULL),
(28, 'Lake Maximillian', '2021-01-18 21:33:15', '2021-01-18 21:33:15', NULL),
(29, 'Lake Howard', '2021-01-18 21:33:15', '2021-01-18 21:33:15', NULL),
(30, 'South Linneaview', '2021-01-18 21:33:15', '2021-01-18 21:33:15', NULL),
(31, 'Alysonburgh', '2021-01-18 21:33:15', '2021-01-18 21:33:15', NULL),
(32, 'Hortenseview', '2021-01-18 21:33:15', '2021-01-18 21:33:15', NULL),
(33, 'Port Stonefurt', '2021-01-18 21:33:16', '2021-01-18 21:33:16', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `rating` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `views` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `product_id`, `user_id`, `description`, `date`, `rating`, `created_at`, `updated_at`, `deleted_at`, `views`) VALUES
(1, 1, 220, NULL, NULL, NULL, '2021-04-24 10:14:54', '2021-04-24 10:14:54', NULL, 1),
(2, 3, 8, NULL, NULL, NULL, '2021-04-24 10:32:44', '2021-04-24 10:32:44', NULL, 1),
(3, 4, 8, NULL, NULL, NULL, '2021-04-24 10:37:02', '2021-04-24 10:37:02', NULL, 1),
(4, 6, 8, NULL, NULL, NULL, '2021-04-24 10:38:30', '2021-04-24 10:38:30', NULL, 1),
(5, 5, 8, NULL, NULL, NULL, '2021-04-24 10:38:54', '2021-04-24 10:38:54', NULL, 1),
(6, 9, 220, NULL, NULL, NULL, '2021-04-24 12:04:24', '2021-04-24 12:04:24', NULL, 1),
(7, 10, 220, NULL, NULL, NULL, '2021-04-25 01:43:37', '2021-04-25 01:43:37', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'web', '2020-04-26 06:07:12', '2020-04-26 06:07:12'),
(2, 'Customer', 'web', '2020-04-26 06:07:22', '2020-04-26 06:07:22');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `shippings`
--

CREATE TABLE `shippings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `address1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `region_id` bigint(20) UNSIGNED DEFAULT NULL,
  `area_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stylists`
--

CREATE TABLE `stylists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `specialist` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stylists`
--

INSERT INTO `stylists` (`id`, `name`, `specialist`, `image`, `start_time`, `end_time`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Rihan Giyen', 'Hair washer', 'stylists/uhamKn54ziVGUxKeEgyYELpKDAEZumPgNBBIgtdz.jpg', '09:10:00', '11:10:00', '2021-04-22 20:25:23', '2021-04-24 07:41:05', NULL),
(2, 'Disan Josap', 'Hair Dryer', 'stylists/ARAxplPN9ORFSmp3Y5xw4V74Pn6HiaQtAxlsN0bF.jpg', '00:12:00', '14:12:00', '2021-04-24 07:42:49', '2021-04-24 07:42:49', NULL),
(3, 'Aahan Dihan', 'Hair Cutting', 'stylists/R2T9hu0EtXMkEFwasCsHLYUJSGM4iuM1dEWGwz37.jpg', '03:14:00', '05:14:00', '2021-04-24 07:44:47', '2021-04-24 07:44:47', NULL),
(4, 'Rumba sina', 'Hair roller', 'stylists/BfSg1v40BRm8pARYoJtDfDNhFVu0wJD1MC2eu16V.jpg', '06:15:00', '07:15:00', '2021-04-24 07:46:07', '2021-04-24 07:46:07', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

CREATE TABLE `sub_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sub_categories`
--

INSERT INTO `sub_categories` (`id`, `name`, `slug`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Bright Crystal Versace', 'bright-crystal-versace', '2021-04-24 07:11:27', '2021-04-24 07:11:27', NULL),
(2, 'Eternity Calvin Klein', 'eternity-calvin-klein', '2021-04-24 07:12:03', '2021-04-24 07:12:03', NULL),
(3, 'Viva La Juicy Perfume', 'viva-la-juicy-perfume', '2021-04-24 07:12:32', '2021-04-24 07:12:32', NULL),
(4, 'Nécessaire Body Lotion', 'necessaire-body-lotion', '2021-04-24 07:18:52', '2021-04-24 07:18:52', NULL),
(5, 'Aveeno Moisturizing Lotion', 'aveeno-moisturizing-lotion', '2021-04-24 07:19:21', '2021-04-24 07:19:21', NULL),
(6, 'Tea Tree Shaping Cream', 'tea-tree-shaping-cream', '2021-04-24 07:36:15', '2021-04-24 07:36:15', NULL),
(7, 'Viking Forming Cream', 'viking-forming-cream', '2021-04-24 07:36:35', '2021-04-24 07:36:35', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city_id` bigint(20) UNSIGNED DEFAULT NULL,
  `address1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `region_id` bigint(20) UNSIGNED DEFAULT NULL,
  `area_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `provider`, `provider_id`, `city_id`, `address1`, `address2`, `phone`, `image`, `region_id`, `area_id`) VALUES
(1, 'Aneesha', 'aneesha@gmail.com', '2020-05-31 18:15:00', '$2y$10$zqg4LkCzjLkllghrU72KH.AWSXHrllVn2g7agcItGfQhGytAEKQ9m', NULL, '2020-05-12 09:50:17', '2020-06-25 11:01:51', NULL, NULL, 5, NULL, NULL, '9860133503', NULL, 1, 3),
(2, 'Aruhi', 'aruhi@gmail.com', '2021-01-08 03:15:37', '$2y$10$q8WFRbvTlIoBZ8T/dxw7Uuv3FwxMkBcB8ZJZpH4IoRIGpvqJwea7e', NULL, '2020-05-12 09:51:02', '2020-05-12 09:51:02', NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, 3),
(3, 'Arusi', 'arusi@gmail.com', '2021-04-25 01:04:17', '$2y$10$FyAsHWaj5hx.4gtWIBJJ3.GH9KFkBVs4UfdSD1c07fpPCzb7INEfW', NULL, '2020-05-12 09:52:21', '2021-04-25 01:04:17', NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, 2),
(4, 'Arbi', 'arbi@gmail.com', '2020-06-24 03:56:10', '$2y$10$UMQ9sOrpTJrK5fwBy21queSrz6C8UR7T.OUMcJzYWqVpAOuTIBv9q', NULL, '2020-05-12 09:53:38', '2020-06-24 03:56:10', NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, 1),
(5, 'Ahira', 'ahira@gmail.com', NULL, '$2y$10$v1jr6FYEOKXQMsTJjFwGGe9PmfJl6cwBcsyZ93hPBHpH7tgtMpXNS', NULL, '2020-05-12 09:54:16', '2020-05-12 09:54:16', NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, 1),
(6, 'Sani', 'sani@gmail.com', NULL, '$2y$10$hL7WvYsprNt8L1YeaaqStOhH6aYnq/irOn.AaWUf8TJ6/eySBwDne', NULL, '2020-05-12 09:56:19', '2020-05-12 09:56:19', NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, 2),
(7, 'Punte', 'punte@gmail.com', NULL, '$2y$10$JLnIPDlg0zf6tipqjt5RG.RXVs1.yYQLWflS/Rs2btPSOaGi.deZm', NULL, '2020-05-12 09:56:49', '2020-05-12 09:56:49', NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, 1),
(8, 'Renuka', 'renuka@gmail.com', '2021-04-24 10:25:28', '$2y$10$QN2c.G6zUJPjyJaIBTmpM.ZivFLdtzEHacY.MRFb17O1.MV58rJOa', NULL, '2020-05-12 10:01:20', '2021-04-24 10:25:28', NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, 2),
(9, 'Santosh', 'santosh@gmail.com', '2020-07-02 10:22:24', '$2y$10$6gQXpLSzSbzDXaGzy09Cs.qnmu3bNHm9i0SyLkv03jPM9/o1R71Z2', NULL, '2020-05-12 10:52:57', '2020-05-12 10:52:57', NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, 1),
(10, 'lalit', 'lalit@gmail.com', '2020-07-17 04:14:27', '$2y$10$tRIaYuLOqof1db7rBClbmuiVxx8NBhB9WvTDIJ5hYw77LCvOc4jVm', NULL, '2020-05-12 10:54:17', '2020-07-17 04:14:27', NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, 2),
(11, 'Arjun', 'arjun@gmail.com', '2021-01-02 03:15:49', '$2y$10$wlgkkaWmU9KBSCV5.orDNe57ZVCzMCaUpQUK4iwS5AvVF1lfQsJVK', NULL, '2020-05-12 10:55:57', '2020-05-12 10:55:57', NULL, NULL, 1, NULL, NULL, '+977 9841646834', NULL, 1, 3),
(12, 'Goma', 'goma@gmail.com', NULL, '$2y$10$7LrnV9sOhy5hG.IA6MAvAeWwWruZqYhojxvTLc9c5KaPsWPfeI2HS', NULL, '2020-05-12 10:56:18', '2020-05-12 10:56:18', NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, 1),
(13, 'aashvi', 'aashvi123@gmail.com', NULL, '$2y$10$bGNE8ALy4r8pTMUpVfpqfe/uJNr97OJof.q3Jd52GgS.Iz.uoHnbq', NULL, '2020-06-25 10:44:01', '2020-06-25 10:44:01', NULL, NULL, 2, NULL, NULL, '9860133', NULL, 1, 1),
(14, 'Mrs. Laurence Marquardt', 'breitenberg.brenden@example.com', '2021-01-18 22:18:01', '$2y$10$aM1OAdFz1wMlAFqrGq1LzeUKC3j2XZT90RZwyRsuctXvJu2SJlbJy', NULL, '2021-01-18 22:18:01', '2021-01-18 22:34:18', NULL, NULL, 33, NULL, NULL, '8746670195', NULL, 19, 38),
(15, 'Maiya Yundt', 'lydia.collier@example.org', '2021-01-18 22:18:26', '$2y$10$P72ugqku77l9iLai0qB6SefDlyjCgJsfS.AoqKyJswDUe9mGjDO96', NULL, '2021-01-18 22:18:26', '2021-01-18 22:34:18', NULL, NULL, 10, NULL, NULL, '9141991917', NULL, 10, 36),
(16, 'Linwood Schinner', 'hane.ellen@example.org', '2021-01-18 22:18:43', '$2y$10$1brZQ3LzgCeKFXpSyq4pluH4UbTFq/5rT494bj9rgwoTcTKelH8cW', NULL, '2021-01-18 22:18:43', '2021-01-18 22:34:19', NULL, NULL, 17, NULL, NULL, '4860120476', NULL, 27, 115),
(17, 'Prof. Pearline Emard MD', 'veffertz@example.net', '2021-01-18 22:20:36', '$2y$10$ttJ8rjVmVA6TmnP9jw7BtOo5NQfmDXH0bQi4YCFYFJpOHeGycVI4e', NULL, '2021-01-18 22:20:36', '2021-01-18 22:34:19', NULL, NULL, 2, NULL, NULL, '4598838345', NULL, 1, 55),
(18, 'Anjuma khadka', 'anjuma@gmail.com', NULL, '$2y$10$CXaChEA6nyPw7nbtD.TwveLqcOnTZtUDwayr7JtTIVIlLBdCk./Hy', NULL, '2021-01-18 22:23:12', '2021-01-18 22:23:12', NULL, NULL, 18, NULL, NULL, '9860133503', NULL, 15, 43),
(19, 'Teresa Osinski', 'sophie.dooley@example.net', '2021-01-18 22:23:33', '$2y$10$4k.Umd5iJEKrsvi0o/kyku7j9NAhUnZTF3nGSyopvsyn7P5iWwXrO', NULL, '2021-01-18 22:23:33', '2021-01-18 22:34:19', NULL, NULL, 1, NULL, NULL, '6664419794', NULL, 1, 2),
(20, 'Summer Berge', 'upadberg@example.com', '2021-01-18 22:24:05', '$2y$10$C6ohtlYJLuChU0QzsqAv3exLPMfxuAyi0k0Oj0s48WRq5uzo.uaqq', NULL, '2021-01-18 22:24:20', '2021-01-18 22:34:19', NULL, NULL, 42, NULL, NULL, '9095366376', NULL, 4, 95),
(21, 'Julie Schroeder', 'kelly88@example.net', '2021-01-18 22:24:05', '$2y$10$UUym2XQDvkkVSNfdmTZQTeykWxObs00bp6mi.HqsKko7zRk4PXzpy', NULL, '2021-01-18 22:24:20', '2021-01-18 22:34:19', NULL, NULL, 68, NULL, NULL, '6117891282', NULL, 31, 106),
(22, 'Mr. Patrick Sawayn Jr.', 'otreutel@example.org', '2021-01-18 22:24:05', '$2y$10$XE1txFimdRJAGPtTBHVHkOpBH5HdSPb0Q7pX3yLXK9waAONrPikMi', NULL, '2021-01-18 22:24:21', '2021-01-18 22:34:19', NULL, NULL, 36, NULL, NULL, '4869964785', NULL, 18, 6),
(23, 'Jacky Durgan', 'destiny.schaefer@example.com', '2021-01-18 22:24:05', '$2y$10$cQFKbCyfb7dMbY5xxyP46OR7BghKrgMmYSnB40lWD.IbTMJ/1K2SK', NULL, '2021-01-18 22:24:21', '2021-01-18 22:34:19', NULL, NULL, 37, NULL, NULL, '2256928405', NULL, 6, 29),
(24, 'Maia Jast', 'bauch.paolo@example.org', '2021-01-18 22:24:05', '$2y$10$9AzQayMzk5NgUgrjC.aUL.wiuWBc7VMmSUNE/nz7vmfKW59.qvztK', NULL, '2021-01-18 22:24:21', '2021-01-18 22:34:20', NULL, NULL, 8, NULL, NULL, '4164465685', NULL, 1, 28),
(25, 'June Baumbach IV', 'sabbott@example.net', '2021-01-18 22:24:05', '$2y$10$phY//yHdoPrfI3biMR/v6OVps99IOjMkLFH5aHpA2qOoqB1kGBCKG', NULL, '2021-01-18 22:24:21', '2021-01-18 22:34:20', NULL, NULL, 21, NULL, NULL, '2998634653', NULL, 8, 45),
(26, 'Dr. Chad Hettinger Jr.', 'hcummerata@example.net', '2021-01-18 22:24:06', '$2y$10$D9kAWdK/Uefna1cDDmggve7Su5sP0U0lW2CPh4djFW8VYenPKEorG', NULL, '2021-01-18 22:24:21', '2021-01-18 22:34:20', NULL, NULL, 42, NULL, NULL, '4309108898', NULL, 4, 95),
(27, 'Daisha Schuster', 'cstokes@example.net', '2021-01-18 22:24:06', '$2y$10$WdrWfulrBp6GlEA4dTEcCeK0ys0d56PtXdoFUuaUgDiVfbr0rt3gK', NULL, '2021-01-18 22:24:21', '2021-01-18 22:34:20', NULL, NULL, 26, NULL, NULL, '4593352807', NULL, 24, 80),
(28, 'Mrs. Blanche Sanford DDS', 'boehm.deangelo@example.net', '2021-01-18 22:24:06', '$2y$10$t/2f2Dfhuc9N4vHG8vPRIOVhzgyQ1kYzyKrN4fppLHive7LNyB6NC', NULL, '2021-01-18 22:24:22', '2021-01-18 22:34:20', NULL, NULL, 16, NULL, NULL, '8832942264', NULL, 5, 112),
(29, 'Dr. Norma Hansen PhD', 'oleffler@example.com', '2021-01-18 22:24:06', '$2y$10$juWPtWD9N6fqUVawmMNcquB7MHq3dGn0TcIfUTD1EikNMEabQP.Sy', NULL, '2021-01-18 22:24:22', '2021-01-18 22:34:20', NULL, NULL, 42, NULL, NULL, '9127260433', NULL, 4, 91),
(30, 'Lyla Kuvalis', 'logan.hoppe@example.net', '2021-01-18 22:24:06', '$2y$10$4h35sZt/tC47AUwlvShNqOzx6OBtzUhKWn6MyaAH70zruXorMenYO', NULL, '2021-01-18 22:24:22', '2021-01-18 22:34:20', NULL, NULL, 64, NULL, NULL, '4758695935', NULL, 2, 93),
(31, 'Dr. Phoebe Goodwin', 'rhills@example.net', '2021-01-18 22:24:06', '$2y$10$p/mR1OraulqpXVXsOhc2peXR5bztbf03j06HQn.PSLlC7zkSGUYrm', NULL, '2021-01-18 22:24:22', '2021-01-18 22:34:21', NULL, NULL, 37, NULL, NULL, '7718433438', NULL, 6, 29),
(32, 'Veda Thompson', 'rwisozk@example.org', '2021-01-18 22:24:06', '$2y$10$bm9.Jp5c2wLLsrXQDWCSCOMgoWVRhgCGfcS3hHGQ5ymEhsQscapGS', NULL, '2021-01-18 22:24:23', '2021-01-18 22:34:21', NULL, NULL, 39, NULL, NULL, '4749752299', NULL, 33, 114),
(33, 'Dr. Johann Bradtke I', 'trace32@example.org', '2021-01-18 22:24:06', '$2y$10$Na2PqRfTSgzq7Zw3DK1mwOvxtdcQA2C.z4v3aIvCmTGmg2zKo0k0a', NULL, '2021-01-18 22:24:23', '2021-01-18 22:34:21', NULL, NULL, 36, NULL, NULL, '9232143051', NULL, 18, 58),
(34, 'Verlie Wehner', 'erunte@example.org', '2021-01-18 22:24:06', '$2y$10$Bfn/UCV2WGAngXnrpsepnOaRz4/dDcbv1/iIhmY4ek74NF60J.fhK', NULL, '2021-01-18 22:24:23', '2021-01-18 22:34:21', NULL, NULL, 14, NULL, NULL, '2644484062', NULL, 23, 41),
(35, 'Mr. Garret Pfannerstill DDS', 'randy.jakubowski@example.org', '2021-01-18 22:24:06', '$2y$10$ZaG4gKv1JpAQr4iHtGXRWuOeKGGdGT3r.4ZF6cT5EwrSuxxxkVFga', NULL, '2021-01-18 22:24:23', '2021-01-18 22:34:21', NULL, NULL, 38, NULL, NULL, '7746989600', NULL, 20, 118),
(36, 'Miss Carolanne Nitzsche', 'sschaefer@example.com', '2021-01-18 22:24:06', '$2y$10$Y55Kl7ie9XAed7bV9RTNq.k5sQK46GvWXyj1UWOQizPTesk/6AEZy', NULL, '2021-01-18 22:24:23', '2021-01-18 22:34:21', NULL, NULL, 25, NULL, NULL, '3650085408', NULL, 28, 116),
(37, 'Lindsay McLaughlin', 'fernando.moen@example.org', '2021-01-18 22:24:06', '$2y$10$2JEckDmSkIpwDj/HuLyCjejs7q.B8dlJHnYJozMtlG2ILk6D2FddS', NULL, '2021-01-18 22:24:23', '2021-01-18 22:34:22', NULL, NULL, 5, NULL, NULL, '6991787695', NULL, 1, 72),
(38, 'Marcos Jacobson PhD', 'okon.ike@example.org', '2021-01-18 22:24:06', '$2y$10$RfwgaY0HNByQeuPOcMt6WuuxfnBr2fH49ISx/ihAWBjnCsHjdgBH.', NULL, '2021-01-18 22:24:23', '2021-01-18 22:34:22', NULL, NULL, 60, NULL, NULL, '2886691632', NULL, 22, 105),
(39, 'Kamren Kuhlman', 'georgette67@example.net', '2021-01-18 22:24:07', '$2y$10$Xk6HwpRWwLjFpN2AO8osEe4hkASAoHEU3F6xaO/UkrtLLnavukKQS', NULL, '2021-01-18 22:24:24', '2021-01-18 22:34:22', NULL, NULL, 21, NULL, NULL, '8759023417', NULL, 8, 60),
(40, 'Geovanny Legros', 'hintz.krystal@example.com', '2021-01-18 22:24:07', '$2y$10$qcbdWRac9R5Ikicb97wfleRNfWESC5GATxBGlFOtycoummLOLXDG.', NULL, '2021-01-18 22:24:24', '2021-01-18 22:34:22', NULL, NULL, 1, NULL, NULL, '2617853157', NULL, 1, 2),
(41, 'Mr. Avery Baumbach', 'jakubowski.ellie@example.com', '2021-01-18 22:24:07', '$2y$10$k69cJsBytbsQ26yDc6nuP.ZM1QtBFKIfRaG9KDCJ0G47yINI8Pooa', NULL, '2021-01-18 22:24:24', '2021-01-18 22:34:22', NULL, NULL, 67, NULL, NULL, '2054232016', NULL, 15, 83),
(42, 'Alverta Wilderman IV', 'hill.laurel@example.org', '2021-01-18 22:24:07', '$2y$10$zT.bIA.HHwgpBV9tfgXgTeJdk1D3hid.h2PTYvr69BOHIUQQ7xuVW', NULL, '2021-01-18 22:24:24', '2021-01-18 22:34:23', NULL, NULL, 2, NULL, NULL, '9300477803', NULL, 1, 76),
(43, 'Zaria Casper Sr.', 'pmcglynn@example.org', '2021-01-18 22:24:07', '$2y$10$snwG52CG6hcY4iRbnUezyuhxLJbNG1cXP768EW.xoIhdiaALd0B0S', NULL, '2021-01-18 22:24:24', '2021-01-18 22:34:23', NULL, NULL, 10, NULL, NULL, '3587607325', NULL, 10, 36),
(44, 'Eileen Pollich', 'juwan.hane@example.org', '2021-01-18 22:24:07', '$2y$10$OH8eetb5W8RAcG83kLVkIeeZk/LHGuNWMXjrxSjRuH5Ep3D4zUUDm', NULL, '2021-01-18 22:24:24', '2021-01-18 22:34:23', NULL, NULL, 57, NULL, NULL, '8339719524', NULL, 7, 68),
(45, 'Ms. Stacey Stroman DVM', 'waters.rupert@example.com', '2021-01-18 22:24:07', '$2y$10$FIgnubmGmIKOjPF0P7vWf.fIBO7UGRcZ1O/t40VYMW5M6fkiTqeMS', NULL, '2021-01-18 22:24:24', '2021-01-18 22:34:23', NULL, NULL, 10, NULL, NULL, '3068454481', NULL, 10, 36),
(46, 'Ms. Mittie Blick PhD', 'luigi.hartmann@example.org', '2021-01-18 22:24:07', '$2y$10$4dGktRDPbX90npPDjcNEc.mrDL02QCL4QqEBM/GGati9abRWGnreW', NULL, '2021-01-18 22:24:24', '2021-01-18 22:34:23', NULL, NULL, 22, NULL, NULL, '6881012841', NULL, 12, 40),
(47, 'Derek Torp', 'trisha13@example.org', '2021-01-18 22:24:07', '$2y$10$h3yE1h9tLDCh3dDL31ZPveEh5dip.IeZGeIGXOvktnBXXcO5qvF/O', NULL, '2021-01-18 22:24:25', '2021-01-18 22:34:23', NULL, NULL, 28, NULL, NULL, '6535921718', NULL, 9, 62),
(48, 'Elfrieda Welch', 'adelia10@example.org', '2021-01-18 22:24:07', '$2y$10$26R797ERa.gGZR2eU6xbJu2XCojC/CsMB1F6nspgn82WuBnG0p7U2', NULL, '2021-01-18 22:24:25', '2021-01-18 22:34:23', NULL, NULL, 34, NULL, NULL, '6833902811', NULL, 20, 53),
(49, 'Georgianna Hudson', 'alba.kreiger@example.net', '2021-01-18 22:24:07', '$2y$10$7tjWfaQeb0encg56tapuLOfZUg17lqyRudBBvrjuU/ERJvImkP9gm', NULL, '2021-01-18 22:24:25', '2021-01-18 22:34:24', NULL, NULL, 37, NULL, NULL, '9413457987', NULL, 6, 50),
(50, 'Nolan McLaughlin', 'wanda19@example.net', '2021-01-18 22:24:07', '$2y$10$5xhUQZkykg9J/yA0Q6zsi.V4SE1vEkf.owSA7E1jlufnS2TJEWvI6', NULL, '2021-01-18 22:24:25', '2021-01-18 22:34:24', NULL, NULL, 48, NULL, NULL, '9019205634', NULL, 19, 88),
(51, 'Nedra Murphy IV', 'rowan38@example.org', '2021-01-18 22:24:07', '$2y$10$TQfb8tgMKvDTifPjitGnueglMOnlZyvQkzPIYrjz.TaUSQULU8ICa', NULL, '2021-01-18 22:24:25', '2021-01-18 22:34:24', NULL, NULL, 65, NULL, NULL, '3833207113', NULL, 20, 66),
(52, 'Maeve Hoeger', 'ruecker.tyson@example.net', '2021-01-18 22:24:08', '$2y$10$T87NiGl4.DeD8/CxfOWcGuvEGTQ5y189uLRodlSCMiAk1mN1DAZBi', NULL, '2021-01-18 22:24:25', '2021-01-18 22:34:24', NULL, NULL, 32, NULL, NULL, '3285101922', NULL, 17, 35),
(53, 'Willy Deckow', 'nelda.hayes@example.org', '2021-01-18 22:24:08', '$2y$10$UAMmh1.GBQ5t6sXDKosy0u7v8/RKIxZOT1FjmhN/O0VEY81W40dze', NULL, '2021-01-18 22:24:25', '2021-01-18 22:34:24', NULL, NULL, 36, NULL, NULL, '5693617167', NULL, 18, 6),
(54, 'Jayda Ebert', 'lpouros@example.org', '2021-01-18 22:24:08', '$2y$10$0BePTUxYW6h2XMHdg81xyu5233dxE0ieK8aBhjj.byVMikbjEzooi', NULL, '2021-01-18 22:24:26', '2021-01-18 22:34:24', NULL, NULL, 1, NULL, NULL, '4096924632', NULL, 1, 2),
(55, 'Darlene Roberts', 'ahegmann@example.net', '2021-01-18 22:24:08', '$2y$10$PRk6KeP9qzOQDhuSujGzLeMF/iUoULlFVu39GJoOaoquAPV77MhbS', NULL, '2021-01-18 22:24:26', '2021-01-18 22:34:24', NULL, NULL, 63, NULL, NULL, '1197256405', NULL, 18, 84),
(56, 'Silas Reinger', 'aditya53@example.com', '2021-01-18 22:24:08', '$2y$10$/8DAyjlVIzGcQ8sTo.5uou4wJcyQ4u/.UK6932Sbn5MBz1mryUrJK', NULL, '2021-01-18 22:24:26', '2021-01-18 22:34:25', NULL, NULL, 65, NULL, NULL, '9168937125', NULL, 20, 66),
(57, 'Lurline Halvorson', 'lauriane.becker@example.org', '2021-01-18 22:24:08', '$2y$10$84z0xlCYqZCi96DI3IcPMuCEcFyKJH/Ysx/81wZodKbfzFui8wv7u', NULL, '2021-01-18 22:24:26', '2021-01-18 22:34:25', NULL, NULL, 19, NULL, NULL, '1869299003', NULL, 10, 63),
(58, 'Dr. Albert Bartell IV', 'blick.darian@example.com', '2021-01-18 22:24:08', '$2y$10$bjWewW70Q2CO93b.eGL20uOlaaYy4PFjL2Rxgm7sgCiQhvepMP/Yy', NULL, '2021-01-18 22:24:26', '2021-01-18 22:34:25', NULL, NULL, 21, NULL, NULL, '6472867836', NULL, 8, 57),
(59, 'Amari Schimmel', 'gboehm@example.net', '2021-01-18 22:24:08', '$2y$10$QLI3pCNqiPLYISA5wDGHrex2fUBOI2fH.1u2yP5zALmQ.mHhEN/Hi', NULL, '2021-01-18 22:24:26', '2021-01-18 22:34:25', NULL, NULL, 39, NULL, NULL, '4466209907', NULL, 33, 5),
(60, 'Selena Bogan', 'pdare@example.com', '2021-01-18 22:24:08', '$2y$10$W90oUcTlj3f2ScNQTbANmuCdLV1H2Qj1CY55rY2EZFWqCnHnDaeMy', NULL, '2021-01-18 22:24:26', '2021-01-18 22:34:25', NULL, NULL, 31, NULL, NULL, '4553860137', NULL, 5, 108),
(61, 'Ashtyn Krajcik', 'erdman.lorine@example.org', '2021-01-18 22:24:08', '$2y$10$H1Tr.I/PCGpzwr4VCV.UfOkxK88wdIkavnws9FNut3E4L8v6AG1lu', NULL, '2021-01-18 22:24:26', '2021-01-18 22:34:25', NULL, NULL, 47, NULL, NULL, '3701313415', NULL, 10, 65),
(62, 'Prof. Brenda Schroeder', 'lilyan24@example.org', '2021-01-18 22:24:08', '$2y$10$R7aTpgeNznySXA84eWk56.TuRDcFmcAGesxAASwE8B5TyL4dwvh4.', NULL, '2021-01-18 22:24:26', '2021-01-18 22:34:26', NULL, NULL, 32, NULL, NULL, '3971365776', NULL, 17, 47),
(63, 'Carol Thiel', 'brooks35@example.com', '2021-01-18 22:24:08', '$2y$10$ygaKbxbG1pi9nJ1qt6XXdOUfWNcOg9qkD0BpaD4DiWJb1pSg5jvHO', NULL, '2021-01-18 22:24:27', '2021-01-18 22:34:26', NULL, NULL, 47, NULL, NULL, '3378271413', NULL, 10, 86),
(64, 'Rahsaan Boyle II', 'dusty.dicki@example.org', '2021-01-18 22:24:08', '$2y$10$Mgu7NjZRGolKR43n1Jlue.Sfe3n3z.95c4ndgX7aqwBPyo90gQ4Pi', NULL, '2021-01-18 22:24:27', '2021-01-18 22:34:26', NULL, NULL, 35, NULL, NULL, '1422031882', NULL, 32, 94),
(65, 'Eloise Johnson', 'pjast@example.org', '2021-01-18 22:24:09', '$2y$10$0ajWbupb0mWePfGGzRGZvODSEBkYrTSemXgglYrNSNZt9FpX2xoza', NULL, '2021-01-18 22:24:27', '2021-01-18 22:34:26', NULL, NULL, 67, NULL, NULL, '6552705291', NULL, 15, 83),
(66, 'Myles Spencer', 'owatsica@example.com', '2021-01-18 22:24:09', '$2y$10$nas5U./tEXtADF.PY7By5.Lh4WPqTxCEorXeXSkK31jgNx7UDDuVG', NULL, '2021-01-18 22:24:27', '2021-01-18 22:34:26', NULL, NULL, 39, NULL, NULL, '4225421097', NULL, 33, 52),
(67, 'Colton Eichmann', 'von.novella@example.org', '2021-01-18 22:24:09', '$2y$10$vaghEUpK86ruyDOKEi9Zaedz5wX5DpOeIHrNUNRHkvIc114yCaA2m', NULL, '2021-01-18 22:24:27', '2021-01-18 22:34:26', NULL, NULL, 5, NULL, NULL, '5285134324', NULL, 1, 3),
(68, 'Jayda Christiansen', 'shanny46@example.com', '2021-01-18 22:24:09', '$2y$10$LKiIRWGiKrAOl3Z5yrQqH.uatYeebifU.3lW83uNNEClB6/s2v6LO', NULL, '2021-01-18 22:24:27', '2021-01-18 22:34:27', NULL, NULL, 29, NULL, NULL, '3296487748', NULL, 13, 25),
(69, 'Prof. Cathryn Schamberger Sr.', 'dolly77@example.com', '2021-01-18 22:24:09', '$2y$10$q/cgGxj85/0O8CUpxXe8qOMpiU8Ohyn0nk1sPO0bE0DSFLyFIxPpy', NULL, '2021-01-18 22:24:27', '2021-01-18 22:34:27', NULL, NULL, 10, NULL, NULL, '3544788398', NULL, 10, 48),
(70, 'Kaci Runolfsson', 'ekuhic@example.net', '2021-01-18 22:24:09', '$2y$10$/HLCQebwUdO.D3oy9U4l9us3e6JEISIB7cnODa7bSHj10nlisWY2S', NULL, '2021-01-18 22:24:28', '2021-01-18 22:34:27', NULL, NULL, 38, NULL, NULL, '9202709489', NULL, 20, 118),
(71, 'Enrico Hauck', 'ryder95@example.org', '2021-01-18 22:24:09', '$2y$10$nuEoDWFnaHIcJOt/MpoU5eKyjdRrKZNiRF9RINahZkA.ZGSeuKnx.', NULL, '2021-01-18 22:24:28', '2021-01-18 22:34:27', NULL, NULL, 21, NULL, NULL, '1245436576', NULL, 8, 60),
(72, 'Destiny Bosco', 'ansley23@example.com', '2021-01-18 22:24:09', '$2y$10$/JJ.RtHN16ghvvMHj3TpnuA6DLRga9QfYdiMN0cB9QQRUv5W/.Ave', NULL, '2021-01-18 22:24:28', '2021-01-18 22:34:27', NULL, NULL, 38, NULL, NULL, '2193606535', NULL, 20, 27),
(73, 'Mrs. Esperanza Parker', 'opal.lockman@example.org', '2021-01-18 22:24:09', '$2y$10$IsyDRNV0q5FHle5mJS3GfOD2efF6GZwc2n6d8W/KfAzj0si3RFvmO', NULL, '2021-01-18 22:24:28', '2021-01-18 22:34:27', NULL, NULL, 2, NULL, NULL, '3223062266', NULL, 1, 1),
(74, 'Theodora Prohaska', 'okuneva.anissa@example.org', '2021-01-18 22:24:09', '$2y$10$vwLb8ABr.40KeUCDPyogJ.sCfBBEQonIA5Yg.GBZjG0xkXTth2aGu', NULL, '2021-01-18 22:24:28', '2021-01-18 22:34:27', NULL, NULL, 47, NULL, NULL, '3336858571', NULL, 10, 65),
(75, 'Mrs. Ella Abshire IV', 'tom44@example.com', '2021-01-18 22:24:09', '$2y$10$Cppt4rb9/f/6AEn7rFsw2.dR7DiZfONhHs/tSZqGbLTpwRYXEH1l6', NULL, '2021-01-18 22:24:28', '2021-01-18 22:34:28', NULL, NULL, 1, NULL, NULL, '6997828768', NULL, 1, 2),
(76, 'Francis Nolan', 'jstark@example.com', '2021-01-18 22:24:09', '$2y$10$LqKu.9DG9b9.VTGreRwOjuL1sSa2g9Y9KazXtR2b0S/d8OJFghegO', NULL, '2021-01-18 22:24:28', '2021-01-18 22:34:28', NULL, NULL, 37, NULL, NULL, '1556309470', NULL, 6, 50),
(77, 'Prof. Olin Towne', 'verdie.adams@example.com', '2021-01-18 22:24:09', '$2y$10$HawdZq0D5Uik3/YbJ/a/sO/PHOHj0KEbQP.zBNDdP9mPoC8GJKsj6', NULL, '2021-01-18 22:24:28', '2021-01-18 22:34:28', NULL, NULL, 6, NULL, NULL, '4133510323', NULL, 7, 113),
(78, 'Prof. Annie Ullrich Jr.', 'enid.heidenreich@example.net', '2021-01-18 22:24:09', '$2y$10$G.qmBVPtfGvbxpvcebF/n.hLvhUKBQHe5Ztdn0OlsO6rMZuBLWGOK', NULL, '2021-01-18 22:24:28', '2021-01-18 22:34:28', NULL, NULL, 35, NULL, NULL, '5023586173', NULL, 32, 94),
(79, 'Sim Sporer IV', 'zion.berge@example.net', '2021-01-18 22:24:10', '$2y$10$6tJZ11EQeVQb8ycpPIV38uzgUNctq6PnGGUEpwDhXCK8yuwCo9zaK', NULL, '2021-01-18 22:24:28', '2021-01-18 22:34:28', NULL, NULL, 7, NULL, NULL, '3399652774', NULL, 8, 59),
(80, 'Prof. Anthony Ritchie V', 'beulah68@example.org', '2021-01-18 22:24:10', '$2y$10$0n909nj2XQHtOr95CfafTe61vxpJRn.DS5Tt66Izi7ytecE3QX4z6', NULL, '2021-01-18 22:24:29', '2021-01-18 22:34:28', NULL, NULL, 57, NULL, NULL, '9690688571', NULL, 7, 68),
(81, 'Eleanore Kuhic', 'maxwell.sauer@example.org', '2021-01-18 22:24:10', '$2y$10$dO78cneK6HpZZz8NbNE5/e5lyIcwkGlaKV.WuQ9UJmIB0AH4TJf6u', NULL, '2021-01-18 22:24:29', '2021-01-18 22:34:28', NULL, NULL, 33, NULL, NULL, '5139553566', NULL, 19, 64),
(82, 'Cooper Wintheiser', 'torp.anahi@example.com', '2021-01-18 22:24:10', '$2y$10$issooWOw7/RarXRFeeNUtOsMRHfODE4Y.6BXHWN3NJN0tzJ7mvQYC', NULL, '2021-01-18 22:24:29', '2021-01-18 22:34:29', NULL, NULL, 10, NULL, NULL, '8782491109', NULL, 10, 18),
(83, 'Pedro Dach', 'okey.ritchie@example.net', '2021-01-18 22:24:10', '$2y$10$xFG8lDPxWuk4kB7ySp89V.Z8cQyfs7m3oZm8kwClqcocVESlDuLDS', NULL, '2021-01-18 22:24:29', '2021-01-18 22:34:29', NULL, NULL, 71, NULL, NULL, '4558580394', NULL, 17, 100),
(84, 'Gunner Jacobson', 'sophia.stark@example.org', '2021-01-18 22:24:10', '$2y$10$iwEcZqA9OQK14iUOODK1wewXy/X/a2zbrsKQGo2Bbbb.R7FtOqYku', NULL, '2021-01-18 22:24:29', '2021-01-18 22:34:29', NULL, NULL, 23, NULL, NULL, '5089299119', NULL, 28, 104),
(85, 'Meta Watsica V', 'kerluke.domenic@example.net', '2021-01-18 22:24:10', '$2y$10$fps4qsEIsq02ndl7ZcV2fO.QBXo3NSSE4jEqzmAsNXQBlnpjLKgYi', NULL, '2021-01-18 22:24:30', '2021-01-18 22:34:29', NULL, NULL, 42, NULL, NULL, '5421740837', NULL, 4, 95),
(86, 'Dr. Vance Strosin', 'caden.stark@example.org', '2021-01-18 22:24:10', '$2y$10$jkuYuE/vXIi7OCY3fyTt.OxlAtPJqrgFFQP6OcHeI/SIKb6FaYRTe', NULL, '2021-01-18 22:24:30', '2021-01-18 22:34:29', NULL, NULL, 60, NULL, NULL, '6900844833', NULL, 22, 105),
(87, 'Mina Harber', 'bernadine12@example.org', '2021-01-18 22:24:10', '$2y$10$L/VoXtnc21Okp9hDaq3JG.3LZVwwi1QP4ULGKNeQ.FnjGoB7POu2a', NULL, '2021-01-18 22:24:30', '2021-01-18 22:34:29', NULL, NULL, 5, NULL, NULL, '1740991269', NULL, 1, 3),
(88, 'Bart Jakubowski', 'zwalsh@example.com', '2021-01-18 22:24:10', '$2y$10$xMZD2bQjsOTnybuZOJjY0.mGsyo.TqUW54Ll5z87PHJNYSwPJkVBa', NULL, '2021-01-18 22:24:30', '2021-01-18 22:34:29', NULL, NULL, 67, NULL, NULL, '4572762722', NULL, 15, 123),
(89, 'Miss Bert Herman II', 'whermann@example.net', '2021-01-18 22:24:10', '$2y$10$Yu2YfmzIKZQ9ZOMV/67FBepa5PWa.C.U747O5KyaIQyFsc/ERdiEO', NULL, '2021-01-18 22:24:30', '2021-01-18 22:34:30', NULL, NULL, 9, NULL, NULL, '7407013896', NULL, 9, 39),
(90, 'Jamel Weimann', 'isom00@example.org', '2021-01-18 22:24:10', '$2y$10$KrwsIqtq2j2gNp3X4SV4E.L512Qr/nqs1hAFkR6f6DmVfPd377Qjm', NULL, '2021-01-18 22:24:30', '2021-01-18 22:34:30', NULL, NULL, 31, NULL, NULL, '4547919891', NULL, 5, 108),
(91, 'Prof. Jewel Torphy PhD', 'marielle.goodwin@example.net', '2021-01-18 22:24:10', '$2y$10$SC.zjhInK.WUc6Lp99ykcORWJM3tKH0syrA.aTkrD0BROYaqkYoBS', NULL, '2021-01-18 22:24:31', '2021-01-18 22:34:30', NULL, NULL, 16, NULL, NULL, '9738084523', NULL, 5, 85),
(92, 'Pat Gusikowski', 'johnathon22@example.org', '2021-01-18 22:24:11', '$2y$10$rnMQ0AZ18aFdaksZOGxnIeS2IoBdrZAf1ke6XUFvZJX/xRY7HDXZq', NULL, '2021-01-18 22:24:31', '2021-01-18 22:34:30', NULL, NULL, 20, NULL, NULL, '1965256525', NULL, 14, 8),
(93, 'Marguerite Runolfsson', 'sbayer@example.com', '2021-01-18 22:24:11', '$2y$10$Nx4l./t/ewZHDu8MKcT4xuethylhseNUUqAVONStgqrJK6NQI5VLy', NULL, '2021-01-18 22:24:31', '2021-01-18 22:34:30', NULL, NULL, 64, NULL, NULL, '4209095552', NULL, 2, 93),
(94, 'Aletha Lockman MD', 'tgerlach@example.com', '2021-01-18 22:24:11', '$2y$10$YraH3jlg2ms6Y4lJNaq9quuzGV5Qs.e0iO.7pkBH4TSUw.Na2ORqC', NULL, '2021-01-18 22:24:31', '2021-01-18 22:34:30', NULL, NULL, 10, NULL, NULL, '4063462111', NULL, 10, 36),
(95, 'Elise Wisoky', 'botsford.keira@example.net', '2021-01-18 22:24:11', '$2y$10$hJo6VXQOpHzR8ObR7ZmgC.mA86wUxzkkFMB8aznH0zHCA9iRNyhaS', NULL, '2021-01-18 22:24:31', '2021-01-18 22:34:30', NULL, NULL, 28, NULL, NULL, '4800974602', NULL, 9, 103),
(96, 'Prof. Santino Kemmer', 'swift.consuelo@example.com', '2021-01-18 22:24:11', '$2y$10$OugU4L8oLRD41YrEg4Ax4.hOGuQFxaFNpTPhbScTfFL.S8AFBpjiy', NULL, '2021-01-18 22:24:31', '2021-01-18 22:34:31', NULL, NULL, 67, NULL, NULL, '7575155547', NULL, 15, 92),
(97, 'Dr. Graham Mohr V', 'egaylord@example.net', '2021-01-18 22:24:11', '$2y$10$QTFTsuG4UpNG.vRMKM4sB.Vvaij2HT5veKFiZR6//GjwnpMlKdpJm', NULL, '2021-01-18 22:24:31', '2021-01-18 22:34:31', NULL, NULL, 38, NULL, NULL, '3908936378', NULL, 20, 118),
(98, 'Ethan Sauer', 'pkeeling@example.net', '2021-01-18 22:24:11', '$2y$10$FbbHH4LYUZontO1z7cP3Xuob1hTYU6dwNoBYYR0vFcQVwORc5TrOS', NULL, '2021-01-18 22:24:31', '2021-01-18 22:34:31', NULL, NULL, 22, NULL, NULL, '9429981476', NULL, 12, 40),
(99, 'Merritt Krajcik', 'sigmund48@example.net', '2021-01-18 22:24:11', '$2y$10$JpPa.wUczhQR6sN7zUOGROfLmyI89zFpOzuY/eT05dIjHfsvSqCCe', NULL, '2021-01-18 22:24:32', '2021-01-18 22:34:31', NULL, NULL, 32, NULL, NULL, '3636802048', NULL, 17, 35),
(100, 'Fritz McDermott', 'ysipes@example.com', '2021-01-18 22:24:11', '$2y$10$xPenZNfPQGJGcSzuUCXp2.UCCIBDyd6Dv6/okB5x9WZ2jvJsMQSGm', NULL, '2021-01-18 22:24:32', '2021-01-18 22:34:31', NULL, NULL, 36, NULL, NULL, '2533257415', NULL, 18, 33),
(101, 'Prof. Bert Brown', 'kyra.mayer@example.net', '2021-01-18 22:24:11', '$2y$10$jnDpC5LFFzMGienCx0.NO.v1jW.8w3eTpWHKLVnYkurL.bu/S9BKC', NULL, '2021-01-18 22:24:32', '2021-01-18 22:34:31', NULL, NULL, 52, NULL, NULL, '8671563997', NULL, 32, 117),
(102, 'Providenci Rogahn', 'kstiedemann@example.net', '2021-01-18 22:24:11', '$2y$10$iV4mNShFy979NcGqAoKWvukvfsbowoQw9LRoEBDu1evGzSuTIDHvK', NULL, '2021-01-18 22:24:32', '2021-01-18 22:34:31', NULL, NULL, 37, NULL, NULL, '2747281400', NULL, 6, 75),
(103, 'Lucy Mayert', 'sienna52@example.net', '2021-01-18 22:24:11', '$2y$10$sF3I3CezfnnCyb1LfNsQoeL2P34rsNgdpNQKvoX2JsFLGLDmhOab.', NULL, '2021-01-18 22:24:32', '2021-01-18 22:34:32', NULL, NULL, 32, NULL, NULL, '6363429670', NULL, 17, 35),
(104, 'Cathryn Schuppe I', 'domingo.runolfsson@example.net', '2021-01-18 22:24:11', '$2y$10$VHupBJhWHuN11su1MDA1Su49fdlGOPvgAxYUPX8c.g6pR1M43PWs6', NULL, '2021-01-18 22:24:32', '2021-01-18 22:34:32', NULL, NULL, 5, NULL, NULL, '2737381569', NULL, 1, 3),
(105, 'Kole Spinka', 'sporer.coralie@example.net', '2021-01-18 22:24:12', '$2y$10$98aThhCMprBZweRVoPlFFO55MYAFDKOLRPQhwYg3MZYKw1a5bAA82', NULL, '2021-01-18 22:24:32', '2021-01-18 22:34:32', NULL, NULL, 35, NULL, NULL, '5316403110', NULL, 32, 94),
(106, 'Caden Effertz', 'jerald.gaylord@example.com', '2021-01-18 22:24:12', '$2y$10$IGytU80Y3DwXH8u068zCLelaHI0wdtR1zJ28ckO7bXS96owSamNf2', NULL, '2021-01-18 22:24:32', '2021-01-18 22:34:32', NULL, NULL, 12, NULL, NULL, '7368717967', NULL, 14, 23),
(107, 'Ms. Coralie Powlowski Jr.', 'kuhn.alaina@example.net', '2021-01-18 22:24:12', '$2y$10$2Yp06snQUkU0.npgIB6QResCNJTZGHSD8iQT8THp.H47R59vFkRNi', NULL, '2021-01-18 22:24:33', '2021-01-18 22:34:32', NULL, NULL, 39, NULL, NULL, '9583316122', NULL, 33, 30),
(108, 'Lambert Runte', 'sallie.treutel@example.org', '2021-01-18 22:24:12', '$2y$10$JNMkPEuhFKwSTD.oO.CJ8Ok0TkWS9cDTxKCalCtdW7CnFLZ7C.3Ky', NULL, '2021-01-18 22:24:33', '2021-01-18 22:34:32', NULL, NULL, 39, NULL, NULL, '7139467619', NULL, 33, 5),
(109, 'Jamie Casper', 'jaeden81@example.net', '2021-01-18 22:24:12', '$2y$10$L1v.0bh27Ww7OVKaz8NTKO2qeq00Bt/0V2H9e3YWZGr56kNuuw.TK', NULL, '2021-01-18 22:24:33', '2021-01-18 22:34:32', NULL, NULL, 59, NULL, NULL, '3874158670', NULL, 22, 109),
(110, 'Mr. Conor Greenholt', 'gspencer@example.net', '2021-01-18 22:24:12', '$2y$10$.n6L3kRr7geqqFCoJr89muMHbDiIPfayyPyPhqUqQUdE2l7nH4ayi', NULL, '2021-01-18 22:24:33', '2021-01-18 22:34:33', NULL, NULL, 33, NULL, NULL, '7212156630', NULL, 19, 90),
(111, 'Leopold Fisher', 'sydnie.boyer@example.com', '2021-01-18 22:24:12', '$2y$10$MmITjszbB/ZRqe/oB3LJkOVg0ZqcNBaa06ulsvvORjrLJR5clc9Nm', NULL, '2021-01-18 22:24:33', '2021-01-18 22:34:33', NULL, NULL, 35, NULL, NULL, '1784237263', NULL, 32, 110),
(112, 'Dr. Ellsworth Gutmann', 'grath@example.net', '2021-01-18 22:24:12', '$2y$10$M9aQzw.SX/YSWMOBV4jy/O2QgF1TGHpvE5bwx0kI.pHxQEIQwtga6', NULL, '2021-01-18 22:24:34', '2021-01-18 22:34:33', NULL, NULL, 39, NULL, NULL, '5915503438', NULL, 33, 52),
(113, 'Marcelino Thompson', 'umosciski@example.org', '2021-01-18 22:24:12', '$2y$10$vQYAVoU1x3eu4TfEXFfPaeAc.ZD8WIBafxMJRsNwfe7zbOFHxkXX2', NULL, '2021-01-18 22:24:34', '2021-01-18 22:34:33', NULL, NULL, 60, NULL, NULL, '4147276333', NULL, 22, 105),
(114, 'Dr. Victoria Aufderhar', 'heidenreich.octavia@example.org', '2021-01-18 22:24:12', '$2y$10$TEZKoFEbDS8k1EeTAWHM1..A9xusB2k1msar.iS7zwpvgeMPEvMC2', NULL, '2021-01-18 22:24:34', '2021-01-18 22:34:33', NULL, NULL, 71, NULL, NULL, '4457134721', NULL, 17, 100),
(115, 'Garett Deckow', 'jacinto98@example.net', '2021-01-18 22:24:12', '$2y$10$D0H9e0pz1rt3eUclVWfUVeTWHQ9ciOry7GfYwBR5Z.tarIYKUXlpy', NULL, '2021-01-18 22:24:34', '2021-01-18 22:34:34', NULL, NULL, 36, NULL, NULL, '4803142301', NULL, 18, 24),
(116, 'Giovanny Gutmann', 'schiller.houston@example.net', '2021-01-18 22:24:12', '$2y$10$Qt6wvciETkAeZ/Y3gsQZ1.McPPpA8lpi8TbUbzMTL3Gqa93BUdU4S', NULL, '2021-01-18 22:24:34', '2021-01-18 22:34:34', NULL, NULL, 37, NULL, NULL, '6222006354', NULL, 6, 29),
(117, 'Dr. Ted Rogahn Sr.', 'gbayer@example.com', '2021-01-18 22:24:13', '$2y$10$eBEvjPH8zYt1l30gnP20a.VZyVWETacrkVhDe2uTsKSQ.IfFcKHdy', NULL, '2021-01-18 22:24:34', '2021-01-18 22:34:34', NULL, NULL, 20, NULL, NULL, '3532528261', NULL, 14, 8),
(118, 'Dejah Baumbach', 'anya.shanahan@example.com', '2021-01-18 22:24:13', '$2y$10$YEfsLJrENgkQ4VpgxXM17.yUv3izch7qxmBzqifWu8xp5Dp0OTMdu', NULL, '2021-01-18 22:24:34', '2021-01-18 22:34:34', NULL, NULL, 1, NULL, NULL, '6051968689', NULL, 1, 2),
(119, 'Prof. Marquise Lakin', 'ellen61@example.com', '2021-01-18 22:24:13', '$2y$10$KPTOUTVaSjSdySCinykWBeDst5pYjBDWPOlaIrgD/sbeSU.ad4Mom', NULL, '2021-01-18 22:24:34', '2021-01-18 22:34:34', NULL, NULL, 38, NULL, NULL, '6429117296', NULL, 20, 27),
(120, 'Prof. Marge Prohaska IV', 'pankunding@example.net', '2021-01-18 22:24:13', '$2y$10$4dqggI2WSZCddfaUZ.fvOOrwHKSUMcEmOcUz1C3zk8rkVzN2/CMpC', NULL, '2021-01-18 22:24:34', '2021-01-18 22:34:34', NULL, NULL, 47, NULL, NULL, '9650768970', NULL, 10, 65),
(121, 'Ryley Kunde', 'king.dina@example.com', '2021-01-18 22:24:13', '$2y$10$Hz4yX0O5kR2xk3BC8WmBlu7sJDszGycoMhm715CPfhNYjgoO528k2', NULL, '2021-01-18 22:24:35', '2021-01-18 22:34:34', NULL, NULL, 9, NULL, NULL, '9812756395', NULL, 9, 7),
(122, 'Madge Raynor PhD', 'trudie.fay@example.net', '2021-01-18 22:24:13', '$2y$10$.Gat951Dvtblm8CUEhue6udir9eetzlYJw9gkJM6REkBLbQUNEHxO', NULL, '2021-01-18 22:24:35', '2021-01-18 22:34:35', NULL, NULL, 47, NULL, NULL, '7200754318', NULL, 10, 86),
(123, 'Dell Satterfield', 'nienow.edyth@example.com', '2021-01-18 22:24:13', '$2y$10$6eeWCvUafbbStvxLByH8C./2gM1IBAqaw9wD2NdlU7ezlW5/q.a82', NULL, '2021-01-18 22:24:35', '2021-01-18 22:34:35', NULL, NULL, 38, NULL, NULL, '4531151877', NULL, 20, 118),
(124, 'Hiram Bashirian', 'awaelchi@example.net', '2021-01-18 22:24:13', '$2y$10$TnHE/FvW0PMnkz1FNikepuSjWj03YZDxBgLNhWjaxLcoIi9p7kbgi', NULL, '2021-01-18 22:24:35', '2021-01-18 22:34:35', NULL, NULL, 5, NULL, NULL, '1296075084', NULL, 1, 3),
(125, 'Bella Walter Sr.', 'clarkin@example.org', '2021-01-18 22:24:13', '$2y$10$Xt2MHaP.5DTCieAUX0/v2.1h22r2dORmJEJlejU79zNk6GvJu64n6', NULL, '2021-01-18 22:24:35', '2021-01-18 22:34:35', NULL, NULL, 7, NULL, NULL, '2100567659', NULL, 8, 59),
(126, 'Lizeth Farrell', 'robel.franco@example.net', '2021-01-18 22:24:13', '$2y$10$ZBecNBc8zBgOo6wClyuCnufrrRG5OUL9nEIIN2rJCPWOQVce/of.e', NULL, '2021-01-18 22:24:35', '2021-01-18 22:34:35', NULL, NULL, 23, NULL, NULL, '8945050601', NULL, 28, 104),
(127, 'Dr. Lauretta Muller', 'ashtyn41@example.com', '2021-01-18 22:24:13', '$2y$10$tOfJsJMVZdRiXhSS.eFcpO2gtAWY0zHpSIQvpLj2BufYNOeuJQkBO', NULL, '2021-01-18 22:24:36', '2021-01-18 22:34:36', NULL, NULL, 16, NULL, NULL, '7362365792', NULL, 5, 99),
(128, 'Pauline Gutmann', 'hnitzsche@example.org', '2021-01-18 22:24:13', '$2y$10$JoLXgNe0lpiKGDlH6C8MReFqkuE4Pr.XRpbLWLjqij4ABcRwHNluC', NULL, '2021-01-18 22:24:36', '2021-01-18 22:34:36', NULL, NULL, 6, NULL, NULL, '7528848431', NULL, 7, 113),
(129, 'Angela Kuhn', 'boyer.rodrigo@example.org', '2021-01-18 22:24:13', '$2y$10$.NjLuROTJhxUIjcyOWjOfeoOUa76FGsvtR090GSHFxUiOP2LVW4Y2', NULL, '2021-01-18 22:24:36', '2021-01-18 22:34:36', NULL, NULL, 14, NULL, NULL, '9288067507', NULL, 23, 16),
(130, 'Candice Davis', 'brandyn60@example.org', '2021-01-18 22:24:14', '$2y$10$nIl2.2na1Hl6iFSiVB25l.2Wpc6G/35YSDTk8sha30rrHosDGCIYy', NULL, '2021-01-18 22:24:36', '2021-01-18 22:34:36', NULL, NULL, 63, NULL, NULL, '6748373228', NULL, 18, 84),
(131, 'Carley Zemlak DVM', 'iswaniawski@example.com', '2021-01-18 22:24:14', '$2y$10$fUTCj2R99sSpYXPRnohIQehEpXwrT8NOVrvuQkn4m2AFt8TwhV6q.', NULL, '2021-01-18 22:24:36', '2021-01-18 22:34:36', NULL, NULL, 33, NULL, NULL, '9503085858', NULL, 19, 90),
(132, 'Miss Madelynn Stokes', 'krista63@example.net', '2021-01-18 22:24:14', '$2y$10$z.vLxPJk7ArMM.JjB5wJqO7vdWR7gOeiutdt098o/3pLrhJf8xH1.', NULL, '2021-01-18 22:24:36', '2021-01-18 22:34:36', NULL, NULL, 21, NULL, NULL, '2676513721', NULL, 8, 31),
(133, 'Brett Schneider IV', 'kemmer.buddy@example.org', '2021-01-18 22:24:14', '$2y$10$4V9NFJ0jR7o0kQNehSQO7.d5o1yRBv/MAzs1z41.iZcZRSL8PC/Qi', NULL, '2021-01-18 22:24:36', '2021-01-18 22:34:37', NULL, NULL, 39, NULL, NULL, '9104389742', NULL, 33, 14),
(134, 'Makenzie Daniel', 'juwan68@example.org', '2021-01-18 22:24:14', '$2y$10$EAMW5N1aPvYu5YUoxvWZN.jGCRjq/We85zhGre2jD0j/catMGOvma', NULL, '2021-01-18 22:24:37', '2021-01-18 22:34:37', NULL, NULL, 23, NULL, NULL, '6253201941', NULL, 28, 4),
(135, 'Craig Goldner DDS', 'yfritsch@example.com', '2021-01-18 22:24:14', '$2y$10$CY.nxuhLxaLW/GRqnnMjR.bueXiTcd3qNx1W.MW4ZGrI/drBAZ58.', NULL, '2021-01-18 22:24:37', '2021-01-18 22:34:37', NULL, NULL, 20, NULL, NULL, '3058913434', NULL, 14, 8),
(136, 'Raoul Greenholt', 'leopoldo.jakubowski@example.org', '2021-01-18 22:24:14', '$2y$10$GUKWX.W1iDl85RACtFwFF.lw5mGr/LqHzwE44JQMinWvS9pprT9De', NULL, '2021-01-18 22:24:37', '2021-01-18 22:34:37', NULL, NULL, 48, NULL, NULL, '5190637097', NULL, 19, 88),
(137, 'Buford Treutel', 'karianne48@example.net', '2021-01-18 22:24:14', '$2y$10$vBT2lvMQgU8jM83WKHmZBOebC.onfGrSE8BSddIaC7b4rrI/T6FQq', NULL, '2021-01-18 22:24:37', '2021-01-18 22:34:37', NULL, NULL, 7, NULL, NULL, '5652964695', NULL, 8, 42),
(138, 'Leanne Brown IV', 'bahringer.jessie@example.org', '2021-01-18 22:24:14', '$2y$10$0a3yJwSWeyuaLg9F9JU/D.N98y8zg3rCeBoWovY391uZGZ89Q7Hna', NULL, '2021-01-18 22:24:37', '2021-01-18 22:34:37', NULL, NULL, 1, NULL, NULL, '6568587629', NULL, 1, 49),
(139, 'Laron Pouros', 'gislason.katharina@example.org', '2021-01-18 22:24:14', '$2y$10$3P1SDKuQRnVl0TKeGGY0ie3u47sqO0d3dHkgoyhr.nB26/WrPlTKS', NULL, '2021-01-18 22:24:37', '2021-01-18 22:34:38', NULL, NULL, 67, NULL, NULL, '1281999809', NULL, 15, 83),
(140, 'Uriah Bartell V', 'shanel70@example.org', '2021-01-18 22:24:14', '$2y$10$n4TA0sU3mkoyX1dmUV17l.dPokCAAduZMkPWfKB8gU4aBO1RNh4SS', NULL, '2021-01-18 22:24:37', '2021-01-18 22:34:38', NULL, NULL, 7, NULL, NULL, '5189557602', NULL, 8, 120),
(141, 'Kenyatta Rempel', 'karlie.mcdermott@example.com', '2021-01-18 22:24:14', '$2y$10$Aipg7mOoPRpyaBqMR6Es0OVC5d4Bqvr9sKTHqnMnyXl4Zsh1DjVmK', NULL, '2021-01-18 22:24:38', '2021-01-18 22:34:38', NULL, NULL, 48, NULL, NULL, '8901713672', NULL, 19, 88),
(142, 'Dr. Jarred Jerde Sr.', 'qgaylord@example.net', '2021-01-18 22:24:14', '$2y$10$JvWAer9h.0XkqFD1HQLlC.b2AAn4X.BS4ZDJKlE23OT3/H4IQQXdi', NULL, '2021-01-18 22:24:38', '2021-01-18 22:34:38', NULL, NULL, 33, NULL, NULL, '8462822222', NULL, 19, 90),
(143, 'Bernita Willms', 'bethany.torp@example.net', '2021-01-18 22:24:14', '$2y$10$x/z5oUHhi11qxAbvBX/29et/qE.2B8IkMTkAUXNJeF59pmRIKEPji', NULL, '2021-01-18 22:24:38', '2021-01-18 22:34:38', NULL, NULL, 5, NULL, NULL, '6957049475', NULL, 1, 72),
(144, 'Rosemary Larson', 'ymosciski@example.org', '2021-01-18 22:24:15', '$2y$10$SAxFCqIsWmoWDpD2/1zkfufkKZBCwOwIqKLOS40Jmr3.uVxqvQyL6', NULL, '2021-01-18 22:24:38', '2021-01-18 22:34:38', NULL, NULL, 1, NULL, NULL, '7006937057', NULL, 1, 22),
(145, 'Lolita Schmitt', 'eliza08@example.com', '2021-01-18 22:24:15', '$2y$10$vGge6c.qvVVxpm4aRCu8HOJonnCdmvVBCIs5lqM8RNn3RGAVVUlm6', NULL, '2021-01-18 22:24:38', '2021-01-18 22:34:39', NULL, NULL, 1, NULL, NULL, '9282568306', NULL, 1, 2),
(146, 'Randy Gutkowski', 'lynn.schulist@example.com', '2021-01-18 22:24:15', '$2y$10$YRQwMnVE/5sV44hlptL8AO.g5EhWWmcrab8xm3Lb7S1tyTo3anSDG', NULL, '2021-01-18 22:24:38', '2021-01-18 22:34:39', NULL, NULL, 19, NULL, NULL, '4978564025', NULL, 10, 63),
(147, 'Elaina Turcotte', 'becker.nick@example.net', '2021-01-18 22:24:15', '$2y$10$P.iLwf4R3z19BVlUsDXURO8FK7mJD/0lAYQI.s1Q1TxwzssF5rJx.', NULL, '2021-01-18 22:24:38', '2021-01-18 22:34:39', NULL, NULL, 65, NULL, NULL, '7690769445', NULL, 20, 66),
(149, 'Kamille Boyle', 'carlotta.hayes@example.com', '2021-01-18 22:24:15', '$2y$10$9zIlrxzi6YgM3XCoeD.Ipuu.v9VXQFFL0sEvSgFwnFnjoha7wjyta', NULL, '2021-01-18 22:24:38', '2021-01-18 22:34:40', NULL, NULL, 18, NULL, NULL, '1557184073', NULL, 15, 43),
(220, 'Rudim Giri', 'dibkasu@gmail.com', '2021-04-24 05:58:13', '$2y$10$6mhJRmO67Uisk8q6sCX0d.Qz/7zywgjYtzA5lRDy2tgB7oWIjIYba', NULL, '2021-04-22 21:04:05', '2021-04-25 01:59:02', NULL, NULL, 64, NULL, NULL, '9846897457', 'users/OkB8tDKgmIxaR1zS9Sq1gN4ZRB2HXKTeF5H51KjH.jpg', 2, 93),
(221, 'kanchan', 'kharelkanchan21@gmail.com', NULL, '$2y$10$mlXJishaFn1Dg/5qLOAF0eZ/vAu1hcZAiIKWY0n8rYBsa/HXnFoEu', NULL, '2021-04-22 21:05:53', '2021-04-22 21:05:53', NULL, NULL, 34, NULL, NULL, '98234627728', NULL, 20, 53),
(222, 'kanchan', 'kanchankhl24@gmail.com', NULL, '$2y$10$un7GpUvUNYtR2KgwrUOXG.z4/Op2IPeEydxhEYWivs6w6Khhbc5xe', NULL, '2021-04-22 21:14:17', '2021-04-22 21:14:17', NULL, NULL, 32, NULL, NULL, '9823462772', NULL, 17, 35),
(223, 'Kanchan Kharel', 'kanchan@gmail.com', '2021-04-25 01:26:20', '$2y$10$747eWtCWOGsZlG.sBXgQVuo4gpNm9m1QSPww0K/vB6.59VCxh4Xmm', NULL, '2021-04-25 01:24:28', '2021-04-25 01:26:20', NULL, NULL, 2, NULL, NULL, '9812345644', NULL, 1, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `appointments_user_id_index` (`user_id`),
  ADD KEY `appointments_stylist_id_index` (`stylist_id`);

--
-- Indexes for table `areas`
--
ALTER TABLE `areas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `areas_city_id_index` (`city_id`);

--
-- Indexes for table `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attribute_product`
--
ALTER TABLE `attribute_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attribute_product_product_id_index` (`product_id`),
  ADD KEY `attribute_product_attribute_id_index` (`attribute_id`);

--
-- Indexes for table `attribute_sub_category`
--
ALTER TABLE `attribute_sub_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attribute_sub_category_attribute_id_index` (`attribute_id`),
  ADD KEY `attribute_sub_category_sub_category_id_index` (`sub_category_id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_product_id_index` (`product_id`),
  ADD KEY `carts_user_id_index` (`user_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`);

--
-- Indexes for table `category_subcategory`
--
ALTER TABLE `category_subcategory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_subcategory_category_id_index` (`category_id`),
  ADD KEY `category_subcategory_sub_category_id_index` (`sub_category_id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cities_region_id_index` (`region_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_user_id_index` (`user_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orders_order_number_unique` (`order_number`),
  ADD KEY `orders_user_id_index` (`user_id`),
  ADD KEY `orders_shipping_id_index` (`shipping_id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_details_order_id_index` (`order_id`),
  ADD KEY `order_details_product_id_index` (`product_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payments_order_id_index` (`order_id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_product_code_unique` (`product_code`),
  ADD KEY `products_user_id_index` (`user_id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_images_product_id_index` (`product_id`);

--
-- Indexes for table `product_sub_category`
--
ALTER TABLE `product_sub_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_sub_category_sub_category_id_index` (`sub_category_id`),
  ADD KEY `product_sub_category_product_id_index` (`product_id`);

--
-- Indexes for table `regions`
--
ALTER TABLE `regions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reviews_product_id_index` (`product_id`),
  ADD KEY `reviews_user_id_index` (`user_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `shippings`
--
ALTER TABLE `shippings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shippings_city_id_index` (`city_id`),
  ADD KEY `shippings_user_id_index` (`user_id`),
  ADD KEY `shippings_region_id_index` (`region_id`),
  ADD KEY `shippings_area_id_index` (`area_id`);

--
-- Indexes for table `stylists`
--
ALTER TABLE `stylists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sub_categories_slug_unique` (`slug`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_city_id_index` (`city_id`),
  ADD KEY `users_region_id_index` (`region_id`),
  ADD KEY `users_area_id_index` (`area_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `areas`
--
ALTER TABLE `areas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=124;

--
-- AUTO_INCREMENT for table `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `attribute_product`
--
ALTER TABLE `attribute_product`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `attribute_sub_category`
--
ALTER TABLE `attribute_sub_category`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `category_subcategory`
--
ALTER TABLE `category_subcategory`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_sub_category`
--
ALTER TABLE `product_sub_category`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `regions`
--
ALTER TABLE `regions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `shippings`
--
ALTER TABLE `shippings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stylists`
--
ALTER TABLE `stylists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=224;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointments`
--
ALTER TABLE `appointments`
  ADD CONSTRAINT `appointments_stylist_id_foreign` FOREIGN KEY (`stylist_id`) REFERENCES `stylists` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `appointments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `areas`
--
ALTER TABLE `areas`
  ADD CONSTRAINT `areas_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `attribute_product`
--
ALTER TABLE `attribute_product`
  ADD CONSTRAINT `attribute_product_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `attribute_product_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `attribute_sub_category`
--
ALTER TABLE `attribute_sub_category`
  ADD CONSTRAINT `attribute_sub_category_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `attribute_sub_category_sub_category_id_foreign` FOREIGN KEY (`sub_category_id`) REFERENCES `sub_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `category_subcategory`
--
ALTER TABLE `category_subcategory`
  ADD CONSTRAINT `category_subcategory_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `category_subcategory_sub_category_id_foreign` FOREIGN KEY (`sub_category_id`) REFERENCES `sub_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cities`
--
ALTER TABLE `cities`
  ADD CONSTRAINT `cities_region_id_foreign` FOREIGN KEY (`region_id`) REFERENCES `regions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_shipping_id_foreign` FOREIGN KEY (`shipping_id`) REFERENCES `shippings` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `order_details` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
