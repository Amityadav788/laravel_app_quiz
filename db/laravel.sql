-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 24, 2024 at 10:08 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_menu`
--

CREATE TABLE `admin_menu` (
  `id` int UNSIGNED NOT NULL,
  `parent_id` int NOT NULL DEFAULT '0',
  `order` int NOT NULL DEFAULT '0',
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permission` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_menu`
--

INSERT INTO `admin_menu` (`id`, `parent_id`, `order`, `title`, `icon`, `uri`, `permission`, `created_at`, `updated_at`) VALUES
(1, 0, 1, 'Dashboard', 'icon-chart-bar', '/', NULL, NULL, NULL),
(2, 0, 2, 'Admin', 'icon-server', '', NULL, NULL, NULL),
(3, 2, 3, 'Users', 'icon-users', 'auth/users', NULL, NULL, NULL),
(4, 2, 4, 'Roles', 'icon-user', 'auth/roles', NULL, NULL, NULL),
(5, 2, 5, 'Permission', 'icon-ban', 'auth/permissions', NULL, NULL, NULL),
(6, 2, 6, 'Menu', 'icon-bars', 'auth/menu', NULL, NULL, NULL),
(7, 2, 7, 'Operation log', 'icon-history', 'auth/logs', NULL, NULL, NULL),
(8, 0, 7, 'Helpers', 'icon-cogs', '', NULL, '2024-05-08 02:42:52', '2024-05-08 02:42:52'),
(9, 8, 8, 'Scaffold', 'icon-keyboard', 'helpers/scaffold', NULL, '2024-05-08 02:42:52', '2024-05-08 02:42:52'),
(10, 8, 9, 'Database terminal', 'icon-database', 'helpers/terminal/database', NULL, '2024-05-08 02:42:52', '2024-05-08 02:42:52'),
(11, 8, 10, 'Laravel artisan', 'icon-terminal', 'helpers/terminal/artisan', NULL, '2024-05-08 02:42:52', '2024-05-08 02:42:52'),
(12, 8, 11, 'Routes', 'icon-list-alt', 'helpers/routes', NULL, '2024-05-08 02:42:52', '2024-05-08 02:42:52'),
(13, 0, 11, 'Questions', 'icon-file', 'questions', NULL, '2024-05-08 02:46:10', '2024-05-08 02:46:10'),
(14, 0, 11, 'Users', 'icon-file', 'users', NULL, '2024-05-08 02:50:04', '2024-05-08 02:50:04'),
(15, 0, 11, 'Subjects', 'icon-file', 'subjects', NULL, '2024-05-08 02:51:18', '2024-05-08 02:51:18'),
(19, 0, 11, 'Tests', 'icon-file', 'tests', NULL, '2024-05-08 03:02:11', '2024-05-08 03:02:11');

-- --------------------------------------------------------

--
-- Table structure for table `admin_operation_log`
--

CREATE TABLE `admin_operation_log` (
  `id` int UNSIGNED NOT NULL,
  `user_id` int NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `input` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_operation_log`
--

INSERT INTO `admin_operation_log` (`id`, `user_id`, `path`, `method`, `ip`, `input`, `created_at`, `updated_at`) VALUES
(1, 1, 'admin', 'GET', '127.0.0.1', '[]', '2024-05-08 02:44:48', '2024-05-08 02:44:48'),
(2, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2024-05-08 02:44:54', '2024-05-08 02:44:54'),
(3, 1, 'admin', 'GET', '127.0.0.1', '[]', '2024-05-08 02:44:59', '2024-05-08 02:44:59'),
(4, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2024-05-08 02:45:02', '2024-05-08 02:45:02'),
(5, 1, 'admin/helpers/scaffold', 'POST', '127.0.0.1', '{\"table_name\":\"questions\",\"model_name\":\"App\\\\Models\\\\Question\",\"controller_name\":\"App\\\\Admin\\\\Controllers\\\\QuestionController\",\"create\":[\"controller\",\"menu_item\"],\"fields\":[{\"name\":null,\"type\":\"string\",\"nullable\":\"on\",\"key\":null,\"default\":null,\"comment\":null}],\"timestamps\":\"on\",\"primary_key\":\"id\",\"_token\":\"kbkPkfZtWBF3kk8MhGqXAUD0KSfk1weH9JUmfXrC\"}', '2024-05-08 02:46:10', '2024-05-08 02:46:10'),
(6, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2024-05-08 02:46:10', '2024-05-08 02:46:10'),
(7, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2024-05-08 02:47:24', '2024-05-08 02:47:24'),
(8, 1, 'admin/questions', 'GET', '127.0.0.1', '[]', '2024-05-08 02:47:28', '2024-05-08 02:47:28'),
(9, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2024-05-08 02:48:08', '2024-05-08 02:48:08'),
(10, 1, 'admin/helpers/scaffold', 'POST', '127.0.0.1', '{\"table_name\":\"users\",\"model_name\":\"App\\\\Models\\\\User\",\"controller_name\":\"App\\\\Admin\\\\Controllers\\\\UserController\",\"create\":[\"controller\"],\"fields\":[{\"name\":null,\"type\":\"string\",\"nullable\":\"on\",\"key\":null,\"default\":null,\"comment\":null}],\"timestamps\":\"on\",\"primary_key\":\"id\",\"_token\":\"kbkPkfZtWBF3kk8MhGqXAUD0KSfk1weH9JUmfXrC\"}', '2024-05-08 02:48:46', '2024-05-08 02:48:46'),
(11, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2024-05-08 02:48:46', '2024-05-08 02:48:46'),
(12, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2024-05-08 02:49:02', '2024-05-08 02:49:02'),
(13, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2024-05-08 02:49:04', '2024-05-08 02:49:04'),
(14, 1, 'admin/questions', 'GET', '127.0.0.1', '[]', '2024-05-08 02:49:35', '2024-05-08 02:49:35'),
(15, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2024-05-08 02:49:38', '2024-05-08 02:49:38'),
(16, 1, 'admin/helpers/scaffold', 'POST', '127.0.0.1', '{\"table_name\":\"users\",\"model_name\":\"App\\\\Models\\\\User\",\"controller_name\":\"App\\\\Admin\\\\Controllers\\\\\",\"create\":[\"menu_item\"],\"fields\":[{\"name\":null,\"type\":\"string\",\"nullable\":\"on\",\"key\":null,\"default\":null,\"comment\":null}],\"timestamps\":\"on\",\"primary_key\":\"id\",\"_token\":\"kbkPkfZtWBF3kk8MhGqXAUD0KSfk1weH9JUmfXrC\"}', '2024-05-08 02:50:04', '2024-05-08 02:50:04'),
(17, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2024-05-08 02:50:04', '2024-05-08 02:50:04'),
(18, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2024-05-08 02:50:09', '2024-05-08 02:50:09'),
(19, 1, 'admin/users', 'GET', '127.0.0.1', '[]', '2024-05-08 02:50:11', '2024-05-08 02:50:11'),
(20, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2024-05-08 02:50:34', '2024-05-08 02:50:34'),
(21, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '[]', '2024-05-08 02:50:36', '2024-05-08 02:50:36'),
(22, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2024-05-08 02:50:38', '2024-05-08 02:50:38'),
(23, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2024-05-08 02:50:39', '2024-05-08 02:50:39'),
(24, 1, 'admin/helpers/routes', 'GET', '127.0.0.1', '[]', '2024-05-08 02:50:46', '2024-05-08 02:50:46'),
(25, 1, 'admin/helpers/terminal/artisan', 'GET', '127.0.0.1', '[]', '2024-05-08 02:50:48', '2024-05-08 02:50:48'),
(26, 1, 'admin/helpers/terminal/database', 'GET', '127.0.0.1', '[]', '2024-05-08 02:50:49', '2024-05-08 02:50:49'),
(27, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2024-05-08 02:50:51', '2024-05-08 02:50:51'),
(28, 1, 'admin/helpers/scaffold', 'POST', '127.0.0.1', '{\"table_name\":\"subjects\",\"model_name\":\"App\\\\Models\\\\Subject\",\"controller_name\":\"App\\\\Admin\\\\Controllers\\\\\",\"create\":[\"controller\",\"menu_item\"],\"fields\":[{\"name\":null,\"type\":\"string\",\"nullable\":\"on\",\"key\":null,\"default\":null,\"comment\":null}],\"timestamps\":\"on\",\"primary_key\":\"id\",\"_token\":\"kbkPkfZtWBF3kk8MhGqXAUD0KSfk1weH9JUmfXrC\"}', '2024-05-08 02:51:17', '2024-05-08 02:51:17'),
(29, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2024-05-08 02:51:18', '2024-05-08 02:51:18'),
(30, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2024-05-08 02:51:24', '2024-05-08 02:51:24'),
(31, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2024-05-08 02:51:41', '2024-05-08 02:51:41'),
(32, 1, 'admin/helpers/scaffold', 'POST', '127.0.0.1', '{\"table_name\":\"subjects\",\"model_name\":\"App\\\\Models\\\\Subject\",\"controller_name\":\"App\\\\Admin\\\\Controllers\\\\\",\"create\":[\"controller\",\"menu_item\"],\"fields\":[{\"name\":null,\"type\":\"string\",\"nullable\":\"on\",\"key\":null,\"default\":null,\"comment\":null}],\"timestamps\":\"on\",\"primary_key\":\"id\",\"_token\":\"kbkPkfZtWBF3kk8MhGqXAUD0KSfk1weH9JUmfXrC\"}', '2024-05-08 02:52:39', '2024-05-08 02:52:39'),
(33, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2024-05-08 02:52:39', '2024-05-08 02:52:39'),
(34, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2024-05-08 02:52:52', '2024-05-08 02:52:52'),
(35, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2024-05-08 02:53:42', '2024-05-08 02:53:42'),
(36, 1, 'admin/helpers/scaffold', 'POST', '127.0.0.1', '{\"table_name\":\"subjects\",\"model_name\":\"App\\\\Models\\\\\",\"controller_name\":\"App\\\\Admin\\\\Controllers\\\\\",\"create\":[\"menu_item\"],\"fields\":[{\"name\":null,\"type\":\"string\",\"nullable\":\"on\",\"key\":null,\"default\":null,\"comment\":null}],\"timestamps\":\"on\",\"primary_key\":\"id\",\"_token\":\"kbkPkfZtWBF3kk8MhGqXAUD0KSfk1weH9JUmfXrC\"}', '2024-05-08 02:54:27', '2024-05-08 02:54:27'),
(37, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2024-05-08 02:54:27', '2024-05-08 02:54:27'),
(38, 1, 'admin/subjects', 'GET', '127.0.0.1', '[]', '2024-05-08 02:54:56', '2024-05-08 02:54:56'),
(39, 1, 'admin/subjects', 'GET', '127.0.0.1', '[]', '2024-05-08 02:54:59', '2024-05-08 02:54:59'),
(40, 1, 'admin/subjects', 'GET', '127.0.0.1', '[]', '2024-05-08 02:55:09', '2024-05-08 02:55:09'),
(41, 1, 'admin', 'GET', '127.0.0.1', '[]', '2024-05-08 02:55:30', '2024-05-08 02:55:30'),
(42, 1, 'admin/helpers/terminal/database', 'GET', '127.0.0.1', '[]', '2024-05-08 02:55:42', '2024-05-08 02:55:42'),
(43, 1, 'admin/helpers/terminal/artisan', 'GET', '127.0.0.1', '[]', '2024-05-08 02:55:45', '2024-05-08 02:55:45'),
(44, 1, 'admin/helpers/routes', 'GET', '127.0.0.1', '[]', '2024-05-08 02:55:48', '2024-05-08 02:55:48'),
(45, 1, 'admin/auth/setting', 'GET', '127.0.0.1', '[]', '2024-05-08 02:56:07', '2024-05-08 02:56:07'),
(46, 1, 'admin/subjects', 'GET', '127.0.0.1', '[]', '2024-05-08 02:56:26', '2024-05-08 02:56:26'),
(47, 1, 'admin/subjects', 'GET', '127.0.0.1', '[]', '2024-05-08 02:56:28', '2024-05-08 02:56:28'),
(48, 1, 'admin/subjects/create', 'GET', '127.0.0.1', '[]', '2024-05-08 02:56:40', '2024-05-08 02:56:40'),
(49, 1, 'admin/subjects', 'GET', '127.0.0.1', '[]', '2024-05-08 02:56:41', '2024-05-08 02:56:41'),
(50, 1, 'admin/subjects', 'GET', '127.0.0.1', '{\"id\":\"4\"}', '2024-05-08 02:56:49', '2024-05-08 02:56:49'),
(51, 1, 'admin/subjects', 'GET', '127.0.0.1', '{\"id\":\"3\"}', '2024-05-08 02:56:54', '2024-05-08 02:56:54'),
(52, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '[]', '2024-05-08 02:57:18', '2024-05-08 02:57:18'),
(53, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2024-05-08 02:57:22', '2024-05-08 02:57:22'),
(54, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2024-05-08 02:57:25', '2024-05-08 02:57:25'),
(55, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2024-05-08 02:57:27', '2024-05-08 02:57:27'),
(56, 1, 'admin/auth/menu/16', 'DELETE', '127.0.0.1', '{\"_method\":\"delete\",\"_token\":\"kbkPkfZtWBF3kk8MhGqXAUD0KSfk1weH9JUmfXrC\"}', '2024-05-08 02:57:34', '2024-05-08 02:57:34'),
(57, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2024-05-08 02:57:34', '2024-05-08 02:57:34'),
(58, 1, 'admin/auth/menu/17', 'DELETE', '127.0.0.1', '{\"_method\":\"delete\",\"_token\":\"kbkPkfZtWBF3kk8MhGqXAUD0KSfk1weH9JUmfXrC\"}', '2024-05-08 02:57:39', '2024-05-08 02:57:39'),
(59, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2024-05-08 02:57:39', '2024-05-08 02:57:39'),
(60, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2024-05-08 02:57:43', '2024-05-08 02:57:43'),
(61, 1, 'admin/subjects', 'GET', '127.0.0.1', '[]', '2024-05-08 02:57:45', '2024-05-08 02:57:45'),
(62, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2024-05-08 02:57:52', '2024-05-08 02:57:52'),
(63, 1, 'admin/helpers/scaffold', 'POST', '127.0.0.1', '{\"table_name\":\"tests\",\"model_name\":\"App\\\\Models\\\\Test\",\"controller_name\":\"App\\\\Admin\\\\Controllers\\\\\",\"create\":[\"menu_item\"],\"fields\":[{\"name\":null,\"type\":\"string\",\"nullable\":\"on\",\"key\":null,\"default\":null,\"comment\":null}],\"timestamps\":\"on\",\"primary_key\":\"id\",\"_token\":\"kbkPkfZtWBF3kk8MhGqXAUD0KSfk1weH9JUmfXrC\"}', '2024-05-08 02:58:10', '2024-05-08 02:58:10'),
(64, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2024-05-08 02:58:10', '2024-05-08 02:58:10'),
(65, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2024-05-08 02:58:42', '2024-05-08 02:58:42'),
(66, 1, 'admin/tests', 'GET', '127.0.0.1', '[]', '2024-05-08 02:58:44', '2024-05-08 02:58:44'),
(67, 1, 'admin/tests', 'GET', '127.0.0.1', '[]', '2024-05-08 02:58:45', '2024-05-08 02:58:45'),
(68, 1, 'admin/tests', 'GET', '127.0.0.1', '[]', '2024-05-08 02:58:46', '2024-05-08 02:58:46'),
(69, 1, 'admin/tests', 'GET', '127.0.0.1', '[]', '2024-05-08 02:58:49', '2024-05-08 02:58:49'),
(70, 1, 'admin/tests', 'GET', '127.0.0.1', '[]', '2024-05-08 02:58:51', '2024-05-08 02:58:51'),
(71, 1, 'admin/tests', 'GET', '127.0.0.1', '[]', '2024-05-08 02:58:51', '2024-05-08 02:58:51'),
(72, 1, 'admin/tests', 'GET', '127.0.0.1', '[]', '2024-05-08 02:58:52', '2024-05-08 02:58:52'),
(73, 1, 'admin/tests', 'GET', '127.0.0.1', '[]', '2024-05-08 02:58:52', '2024-05-08 02:58:52'),
(74, 1, 'admin/tests', 'GET', '127.0.0.1', '[]', '2024-05-08 02:58:53', '2024-05-08 02:58:53'),
(75, 1, 'admin/tests', 'GET', '127.0.0.1', '[]', '2024-05-08 02:58:53', '2024-05-08 02:58:53'),
(76, 1, 'admin/tests', 'GET', '127.0.0.1', '[]', '2024-05-08 02:58:54', '2024-05-08 02:58:54'),
(77, 1, 'admin/tests', 'GET', '127.0.0.1', '[]', '2024-05-08 02:58:54', '2024-05-08 02:58:54'),
(78, 1, 'admin/tests', 'GET', '127.0.0.1', '[]', '2024-05-08 02:58:55', '2024-05-08 02:58:55'),
(79, 1, 'admin/tests', 'GET', '127.0.0.1', '[]', '2024-05-08 02:58:56', '2024-05-08 02:58:56'),
(80, 1, 'admin/tests', 'GET', '127.0.0.1', '[]', '2024-05-08 02:58:56', '2024-05-08 02:58:56'),
(81, 1, 'admin/tests', 'GET', '127.0.0.1', '[]', '2024-05-08 02:58:57', '2024-05-08 02:58:57'),
(82, 1, 'admin/tests', 'GET', '127.0.0.1', '[]', '2024-05-08 02:58:57', '2024-05-08 02:58:57'),
(83, 1, 'admin/tests', 'GET', '127.0.0.1', '[]', '2024-05-08 02:58:58', '2024-05-08 02:58:58'),
(84, 1, 'admin/tests', 'GET', '127.0.0.1', '[]', '2024-05-08 02:58:58', '2024-05-08 02:58:58'),
(85, 1, 'admin/tests', 'GET', '127.0.0.1', '[]', '2024-05-08 02:58:59', '2024-05-08 02:58:59'),
(86, 1, 'admin/tests', 'GET', '127.0.0.1', '[]', '2024-05-08 02:58:59', '2024-05-08 02:58:59'),
(87, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2024-05-08 02:59:08', '2024-05-08 02:59:08'),
(88, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2024-05-08 02:59:11', '2024-05-08 02:59:11'),
(89, 1, 'admin/subjects', 'GET', '127.0.0.1', '[]', '2024-05-08 02:59:18', '2024-05-08 02:59:18'),
(90, 1, 'admin/tests', 'GET', '127.0.0.1', '[]', '2024-05-08 02:59:21', '2024-05-08 02:59:21'),
(91, 1, 'admin/tests', 'GET', '127.0.0.1', '[]', '2024-05-08 02:59:21', '2024-05-08 02:59:21'),
(92, 1, 'admin/tests', 'GET', '127.0.0.1', '[]', '2024-05-08 02:59:22', '2024-05-08 02:59:22'),
(93, 1, 'admin/tests', 'GET', '127.0.0.1', '[]', '2024-05-08 02:59:23', '2024-05-08 02:59:23'),
(94, 1, 'admin/tests', 'GET', '127.0.0.1', '[]', '2024-05-08 02:59:23', '2024-05-08 02:59:23'),
(95, 1, 'admin/tests', 'GET', '127.0.0.1', '[]', '2024-05-08 02:59:24', '2024-05-08 02:59:24'),
(96, 1, 'admin/tests', 'GET', '127.0.0.1', '[]', '2024-05-08 02:59:24', '2024-05-08 02:59:24'),
(97, 1, 'admin/tests', 'GET', '127.0.0.1', '[]', '2024-05-08 02:59:25', '2024-05-08 02:59:25'),
(98, 1, 'admin/tests', 'GET', '127.0.0.1', '[]', '2024-05-08 02:59:25', '2024-05-08 02:59:25'),
(99, 1, 'admin/tests', 'GET', '127.0.0.1', '[]', '2024-05-08 02:59:26', '2024-05-08 02:59:26'),
(100, 1, 'admin/tests', 'GET', '127.0.0.1', '[]', '2024-05-08 02:59:26', '2024-05-08 02:59:26'),
(101, 1, 'admin/tests', 'GET', '127.0.0.1', '[]', '2024-05-08 02:59:27', '2024-05-08 02:59:27'),
(102, 1, 'admin/tests', 'GET', '127.0.0.1', '[]', '2024-05-08 02:59:27', '2024-05-08 02:59:27'),
(103, 1, 'admin/tests', 'GET', '127.0.0.1', '[]', '2024-05-08 02:59:28', '2024-05-08 02:59:28'),
(104, 1, 'admin/tests', 'GET', '127.0.0.1', '[]', '2024-05-08 02:59:29', '2024-05-08 02:59:29'),
(105, 1, 'admin/tests', 'GET', '127.0.0.1', '[]', '2024-05-08 02:59:29', '2024-05-08 02:59:29'),
(106, 1, 'admin/tests', 'GET', '127.0.0.1', '[]', '2024-05-08 02:59:30', '2024-05-08 02:59:30'),
(107, 1, 'admin/tests', 'GET', '127.0.0.1', '[]', '2024-05-08 02:59:30', '2024-05-08 02:59:30'),
(108, 1, 'admin/tests', 'GET', '127.0.0.1', '[]', '2024-05-08 02:59:31', '2024-05-08 02:59:31'),
(109, 1, 'admin/tests', 'GET', '127.0.0.1', '[]', '2024-05-08 02:59:31', '2024-05-08 02:59:31'),
(110, 1, 'admin/tests', 'GET', '127.0.0.1', '[]', '2024-05-08 02:59:32', '2024-05-08 02:59:32'),
(111, 1, 'admin/subjects', 'GET', '127.0.0.1', '[]', '2024-05-08 02:59:50', '2024-05-08 02:59:50'),
(112, 1, 'admin/tests', 'GET', '127.0.0.1', '[]', '2024-05-08 02:59:58', '2024-05-08 02:59:58'),
(113, 1, 'admin/tests', 'GET', '127.0.0.1', '[]', '2024-05-08 02:59:58', '2024-05-08 02:59:58'),
(114, 1, 'admin/tests', 'GET', '127.0.0.1', '[]', '2024-05-08 02:59:59', '2024-05-08 02:59:59'),
(115, 1, 'admin/tests', 'GET', '127.0.0.1', '[]', '2024-05-08 02:59:59', '2024-05-08 02:59:59'),
(116, 1, 'admin/tests', 'GET', '127.0.0.1', '[]', '2024-05-08 03:00:00', '2024-05-08 03:00:00'),
(117, 1, 'admin/tests', 'GET', '127.0.0.1', '[]', '2024-05-08 03:00:00', '2024-05-08 03:00:00'),
(118, 1, 'admin/tests', 'GET', '127.0.0.1', '[]', '2024-05-08 03:00:00', '2024-05-08 03:00:00'),
(119, 1, 'admin/tests', 'GET', '127.0.0.1', '[]', '2024-05-08 03:00:01', '2024-05-08 03:00:01'),
(120, 1, 'admin/tests', 'GET', '127.0.0.1', '[]', '2024-05-08 03:00:01', '2024-05-08 03:00:01'),
(121, 1, 'admin/tests', 'GET', '127.0.0.1', '[]', '2024-05-08 03:00:02', '2024-05-08 03:00:02'),
(122, 1, 'admin/tests', 'GET', '127.0.0.1', '[]', '2024-05-08 03:00:44', '2024-05-08 03:00:44'),
(123, 1, 'admin/tests', 'GET', '127.0.0.1', '[]', '2024-05-08 03:00:45', '2024-05-08 03:00:45'),
(124, 1, 'admin/tests', 'GET', '127.0.0.1', '[]', '2024-05-08 03:00:45', '2024-05-08 03:00:45'),
(125, 1, 'admin/tests', 'GET', '127.0.0.1', '[]', '2024-05-08 03:00:46', '2024-05-08 03:00:46'),
(126, 1, 'admin/tests', 'GET', '127.0.0.1', '[]', '2024-05-08 03:00:46', '2024-05-08 03:00:46'),
(127, 1, 'admin/tests', 'GET', '127.0.0.1', '[]', '2024-05-08 03:00:46', '2024-05-08 03:00:46'),
(128, 1, 'admin/tests', 'GET', '127.0.0.1', '[]', '2024-05-08 03:00:47', '2024-05-08 03:00:47'),
(129, 1, 'admin/tests', 'GET', '127.0.0.1', '[]', '2024-05-08 03:00:48', '2024-05-08 03:00:48'),
(130, 1, 'admin/tests', 'GET', '127.0.0.1', '[]', '2024-05-08 03:00:48', '2024-05-08 03:00:48'),
(131, 1, 'admin/tests', 'GET', '127.0.0.1', '[]', '2024-05-08 03:00:48', '2024-05-08 03:00:48'),
(132, 1, 'admin/tests', 'GET', '127.0.0.1', '[]', '2024-05-08 03:00:49', '2024-05-08 03:00:49'),
(133, 1, 'admin/tests', 'GET', '127.0.0.1', '[]', '2024-05-08 03:00:49', '2024-05-08 03:00:49'),
(134, 1, 'admin/tests', 'GET', '127.0.0.1', '[]', '2024-05-08 03:01:00', '2024-05-08 03:01:00'),
(135, 1, 'admin/tests', 'GET', '127.0.0.1', '[]', '2024-05-08 03:01:19', '2024-05-08 03:01:19'),
(136, 1, 'admin', 'GET', '127.0.0.1', '[]', '2024-05-08 03:01:29', '2024-05-08 03:01:29'),
(137, 1, 'admin/tests', 'GET', '127.0.0.1', '[]', '2024-05-08 03:01:31', '2024-05-08 03:01:31'),
(138, 1, 'admin/tests', 'GET', '127.0.0.1', '[]', '2024-05-08 03:01:32', '2024-05-08 03:01:32'),
(139, 1, 'admin/tests', 'GET', '127.0.0.1', '[]', '2024-05-08 03:01:32', '2024-05-08 03:01:32'),
(140, 1, 'admin/tests', 'GET', '127.0.0.1', '[]', '2024-05-08 03:01:32', '2024-05-08 03:01:32'),
(141, 1, 'admin/tests', 'GET', '127.0.0.1', '[]', '2024-05-08 03:01:33', '2024-05-08 03:01:33'),
(142, 1, 'admin/tests', 'GET', '127.0.0.1', '[]', '2024-05-08 03:01:33', '2024-05-08 03:01:33'),
(143, 1, 'admin/tests', 'GET', '127.0.0.1', '[]', '2024-05-08 03:01:33', '2024-05-08 03:01:33'),
(144, 1, 'admin/tests', 'GET', '127.0.0.1', '[]', '2024-05-08 03:01:34', '2024-05-08 03:01:34'),
(145, 1, 'admin/tests', 'GET', '127.0.0.1', '[]', '2024-05-08 03:01:34', '2024-05-08 03:01:34'),
(146, 1, 'admin/tests', 'GET', '127.0.0.1', '[]', '2024-05-08 03:01:35', '2024-05-08 03:01:35'),
(147, 1, 'admin/tests', 'GET', '127.0.0.1', '[]', '2024-05-08 03:01:35', '2024-05-08 03:01:35'),
(148, 1, 'admin/tests', 'GET', '127.0.0.1', '[]', '2024-05-08 03:01:35', '2024-05-08 03:01:35'),
(149, 1, 'admin/tests', 'GET', '127.0.0.1', '[]', '2024-05-08 03:01:36', '2024-05-08 03:01:36'),
(150, 1, 'admin/tests', 'GET', '127.0.0.1', '[]', '2024-05-08 03:01:36', '2024-05-08 03:01:36'),
(151, 1, 'admin/tests', 'GET', '127.0.0.1', '[]', '2024-05-08 03:01:37', '2024-05-08 03:01:37'),
(152, 1, 'admin/tests', 'GET', '127.0.0.1', '[]', '2024-05-08 03:01:37', '2024-05-08 03:01:37'),
(153, 1, 'admin/tests', 'GET', '127.0.0.1', '[]', '2024-05-08 03:01:37', '2024-05-08 03:01:37'),
(154, 1, 'admin/tests', 'GET', '127.0.0.1', '[]', '2024-05-08 03:01:38', '2024-05-08 03:01:38'),
(155, 1, 'admin/tests', 'GET', '127.0.0.1', '[]', '2024-05-08 03:01:38', '2024-05-08 03:01:38'),
(156, 1, 'admin/tests', 'GET', '127.0.0.1', '[]', '2024-05-08 03:01:39', '2024-05-08 03:01:39'),
(157, 1, 'admin/tests', 'GET', '127.0.0.1', '[]', '2024-05-08 03:01:39', '2024-05-08 03:01:39'),
(158, 1, 'admin/subjects', 'GET', '127.0.0.1', '[]', '2024-05-08 03:01:43', '2024-05-08 03:01:43'),
(159, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2024-05-08 03:01:52', '2024-05-08 03:01:52'),
(160, 1, 'admin/helpers/scaffold', 'POST', '127.0.0.1', '{\"table_name\":\"tests\",\"model_name\":\"App\\\\Models\\\\Test\",\"controller_name\":\"App\\\\Admin\\\\Controllers\\\\\",\"create\":[\"controller\",\"menu_item\"],\"fields\":[{\"name\":null,\"type\":\"string\",\"nullable\":\"on\",\"key\":null,\"default\":null,\"comment\":null}],\"timestamps\":\"on\",\"primary_key\":\"id\",\"_token\":\"kbkPkfZtWBF3kk8MhGqXAUD0KSfk1weH9JUmfXrC\"}', '2024-05-08 03:02:11', '2024-05-08 03:02:11'),
(161, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2024-05-08 03:02:11', '2024-05-08 03:02:11'),
(162, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2024-05-08 03:02:28', '2024-05-08 03:02:28'),
(163, 1, 'admin/tests', 'GET', '127.0.0.1', '[]', '2024-05-08 03:02:30', '2024-05-08 03:02:30'),
(164, 1, 'admin/tests', 'GET', '127.0.0.1', '[]', '2024-05-08 03:02:32', '2024-05-08 03:02:32'),
(165, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2024-05-08 03:02:36', '2024-05-08 03:02:36'),
(166, 1, 'admin/auth/menu/18', 'DELETE', '127.0.0.1', '{\"_method\":\"delete\",\"_token\":\"kbkPkfZtWBF3kk8MhGqXAUD0KSfk1weH9JUmfXrC\"}', '2024-05-08 03:02:41', '2024-05-08 03:02:41'),
(167, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2024-05-08 03:02:41', '2024-05-08 03:02:41'),
(168, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2024-05-08 03:02:45', '2024-05-08 03:02:45'),
(169, 1, 'admin/tests', 'GET', '127.0.0.1', '[]', '2024-05-08 03:02:47', '2024-05-08 03:02:47'),
(170, 1, 'admin/subjects', 'GET', '127.0.0.1', '[]', '2024-05-08 03:03:20', '2024-05-08 03:03:20'),
(171, 1, 'admin/subjects', 'GET', '127.0.0.1', '[]', '2024-05-08 03:04:50', '2024-05-08 03:04:50'),
(172, 1, 'admin/tests', 'GET', '127.0.0.1', '[]', '2024-05-08 03:05:01', '2024-05-08 03:05:01'),
(173, 1, 'admin/subjects', 'GET', '127.0.0.1', '[]', '2024-05-08 03:05:09', '2024-05-08 03:05:09'),
(174, 1, 'admin/tests', 'GET', '127.0.0.1', '[]', '2024-05-08 03:05:12', '2024-05-08 03:05:12'),
(175, 1, 'admin/subjects', 'GET', '127.0.0.1', '[]', '2024-05-08 03:06:02', '2024-05-08 03:06:02'),
(176, 1, 'admin/subjects', 'GET', '127.0.0.1', '[]', '2024-05-08 03:12:14', '2024-05-08 03:12:14'),
(177, 1, 'admin/subjects', 'GET', '127.0.0.1', '[]', '2024-05-08 03:12:18', '2024-05-08 03:12:18'),
(178, 1, 'admin/subjects', 'GET', '127.0.0.1', '[]', '2024-05-08 03:12:18', '2024-05-08 03:12:18'),
(179, 1, 'admin/subjects', 'GET', '127.0.0.1', '[]', '2024-05-08 03:12:20', '2024-05-08 03:12:20'),
(180, 1, 'admin/subjects', 'GET', '127.0.0.1', '[]', '2024-05-08 03:12:28', '2024-05-08 03:12:28'),
(181, 1, 'admin/subjects', 'GET', '127.0.0.1', '[]', '2024-05-08 03:15:22', '2024-05-08 03:15:22'),
(182, 1, 'admin/subjects', 'GET', '127.0.0.1', '[]', '2024-05-08 03:15:52', '2024-05-08 03:15:52'),
(183, 1, 'admin/subjects', 'GET', '127.0.0.1', '[]', '2024-05-08 03:16:23', '2024-05-08 03:16:23'),
(184, 1, 'admin/subjects', 'GET', '127.0.0.1', '[]', '2024-05-08 03:17:54', '2024-05-08 03:17:54'),
(185, 1, 'admin/subjects', 'GET', '127.0.0.1', '[]', '2024-05-08 03:19:41', '2024-05-08 03:19:41'),
(186, 1, 'admin/subjects', 'GET', '127.0.0.1', '[]', '2024-05-08 03:20:07', '2024-05-08 03:20:07'),
(187, 1, 'admin/users', 'GET', '127.0.0.1', '[]', '2024-05-08 03:20:40', '2024-05-08 03:20:40'),
(188, 1, 'admin/subjects', 'GET', '127.0.0.1', '[]', '2024-05-08 03:20:43', '2024-05-08 03:20:43'),
(189, 1, 'admin/users', 'GET', '127.0.0.1', '[]', '2024-05-08 03:20:45', '2024-05-08 03:20:45'),
(190, 1, 'admin/users', 'GET', '127.0.0.1', '[]', '2024-05-08 03:20:51', '2024-05-08 03:20:51'),
(191, 1, 'admin/users', 'GET', '127.0.0.1', '[]', '2024-05-08 03:21:40', '2024-05-08 03:21:40'),
(192, 1, 'admin/questions', 'GET', '127.0.0.1', '[]', '2024-05-08 03:26:53', '2024-05-08 03:26:53'),
(193, 1, 'admin/users', 'GET', '127.0.0.1', '[]', '2024-05-08 03:27:19', '2024-05-08 03:27:19'),
(194, 1, 'admin/subjects', 'GET', '127.0.0.1', '[]', '2024-05-08 03:27:20', '2024-05-08 03:27:20'),
(195, 1, 'admin/subjects/create', 'GET', '127.0.0.1', '[]', '2024-05-08 03:28:33', '2024-05-08 03:28:33'),
(196, 1, 'admin/subjects/create', 'GET', '127.0.0.1', '[]', '2024-05-08 03:28:37', '2024-05-08 03:28:37'),
(197, 1, 'admin/subjects/create', 'GET', '127.0.0.1', '[]', '2024-05-08 03:28:39', '2024-05-08 03:28:39'),
(198, 1, 'admin/subjects', 'GET', '127.0.0.1', '[]', '2024-05-08 03:28:41', '2024-05-08 03:28:41'),
(199, 1, 'admin/subjects', 'GET', '127.0.0.1', '[]', '2024-05-08 03:28:55', '2024-05-08 03:28:55'),
(200, 1, 'admin/users', 'GET', '127.0.0.1', '[]', '2024-05-08 03:29:32', '2024-05-08 03:29:32'),
(201, 1, 'admin/users', 'GET', '127.0.0.1', '{\"page\":\"2\"}', '2024-05-08 03:29:38', '2024-05-08 03:29:38'),
(202, 1, 'admin/questions', 'GET', '127.0.0.1', '[]', '2024-05-08 03:29:43', '2024-05-08 03:29:43'),
(203, 1, 'admin/tests', 'GET', '127.0.0.1', '[]', '2024-05-08 03:29:49', '2024-05-08 03:29:49'),
(204, 1, 'admin/tests', 'GET', '127.0.0.1', '[]', '2024-05-08 03:33:59', '2024-05-08 03:33:59'),
(205, 1, 'admin/tests', 'GET', '127.0.0.1', '{\"page\":\"2\"}', '2024-05-08 03:34:22', '2024-05-08 03:34:22'),
(206, 1, 'admin/tests', 'GET', '127.0.0.1', '{\"page\":\"1\"}', '2024-05-08 03:34:31', '2024-05-08 03:34:31'),
(207, 1, 'admin/tests', 'GET', '127.0.0.1', '[]', '2024-05-08 03:34:35', '2024-05-08 03:34:35'),
(208, 1, 'admin/questions', 'GET', '127.0.0.1', '[]', '2024-05-08 03:34:39', '2024-05-08 03:34:39'),
(209, 1, 'admin/tests', 'GET', '127.0.0.1', '[]', '2024-05-08 03:34:47', '2024-05-08 03:34:47'),
(210, 1, 'admin/tests', 'GET', '127.0.0.1', '[]', '2024-05-08 03:34:49', '2024-05-08 03:34:49'),
(211, 1, 'admin/tests', 'GET', '127.0.0.1', '[]', '2024-05-08 03:34:49', '2024-05-08 03:34:49'),
(212, 1, 'admin/tests', 'GET', '127.0.0.1', '[]', '2024-05-08 03:37:19', '2024-05-08 03:37:19'),
(213, 1, 'admin/tests', 'GET', '127.0.0.1', '[]', '2024-05-08 03:37:28', '2024-05-08 03:37:28'),
(214, 1, 'admin/tests', 'GET', '127.0.0.1', '[]', '2024-05-08 03:37:45', '2024-05-08 03:37:45'),
(215, 1, 'admin/tests', 'GET', '127.0.0.1', '[]', '2024-05-08 03:37:47', '2024-05-08 03:37:47'),
(216, 1, 'admin/tests', 'GET', '127.0.0.1', '[]', '2024-05-08 03:37:48', '2024-05-08 03:37:48'),
(217, 1, 'admin/tests', 'GET', '127.0.0.1', '[]', '2024-05-08 03:38:07', '2024-05-08 03:38:07'),
(218, 1, 'admin/questions', 'GET', '127.0.0.1', '[]', '2024-05-08 03:38:35', '2024-05-08 03:38:35'),
(219, 1, 'admin/questions', 'GET', '127.0.0.1', '[]', '2024-05-08 03:39:24', '2024-05-08 03:39:24'),
(220, 1, 'admin/questions', 'GET', '127.0.0.1', '[]', '2024-05-08 03:39:47', '2024-05-08 03:39:47'),
(221, 1, 'admin/tests', 'GET', '127.0.0.1', '[]', '2024-05-08 03:39:55', '2024-05-08 03:39:55'),
(222, 1, 'admin/subjects', 'GET', '127.0.0.1', '[]', '2024-05-08 03:39:58', '2024-05-08 03:39:58'),
(223, 1, 'admin/questions', 'GET', '127.0.0.1', '[]', '2024-05-08 03:40:02', '2024-05-08 03:40:02'),
(224, 1, 'admin/users', 'GET', '127.0.0.1', '[]', '2024-05-08 03:40:09', '2024-05-08 03:40:09'),
(225, 1, 'admin/questions', 'GET', '127.0.0.1', '[]', '2024-05-08 03:40:33', '2024-05-08 03:40:33'),
(226, 1, 'admin/tests', 'GET', '127.0.0.1', '[]', '2024-05-08 03:40:36', '2024-05-08 03:40:36'),
(227, 1, 'admin/subjects', 'GET', '127.0.0.1', '[]', '2024-05-08 03:40:38', '2024-05-08 03:40:38'),
(228, 1, 'admin/tests', 'GET', '127.0.0.1', '[]', '2024-05-08 03:40:42', '2024-05-08 03:40:42'),
(229, 1, 'admin/subjects', 'GET', '127.0.0.1', '[]', '2024-05-08 03:41:16', '2024-05-08 03:41:16'),
(230, 1, 'admin/subjects/create', 'GET', '127.0.0.1', '[]', '2024-05-08 03:41:18', '2024-05-08 03:41:18'),
(231, 1, 'admin/tests', 'GET', '127.0.0.1', '[]', '2024-05-08 03:41:40', '2024-05-08 03:41:40'),
(232, 1, 'admin/tests/create', 'GET', '127.0.0.1', '[]', '2024-05-08 03:41:43', '2024-05-08 03:41:43'),
(233, 1, 'admin/tests', 'GET', '127.0.0.1', '[]', '2024-05-08 03:42:00', '2024-05-08 03:42:00');

-- --------------------------------------------------------

--
-- Table structure for table `admin_permissions`
--

CREATE TABLE `admin_permissions` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `http_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `http_path` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_permissions`
--

INSERT INTO `admin_permissions` (`id`, `name`, `slug`, `http_method`, `http_path`, `created_at`, `updated_at`) VALUES
(1, 'All permission', '*', '', '*', NULL, NULL),
(2, 'Dashboard', 'dashboard', 'GET', '/', NULL, NULL),
(3, 'Login', 'auth.login', '', '/auth/login\r\n/auth/logout', NULL, NULL),
(4, 'User setting', 'auth.setting', 'GET,PUT', '/auth/setting', NULL, NULL),
(5, 'Auth management', 'auth.management', '', '/auth/roles\r\n/auth/permissions\r\n/auth/menu\r\n/auth/logs', NULL, NULL),
(6, 'Admin helpers', 'ext.helpers', '', '/helpers/*', '2024-05-08 02:42:52', '2024-05-08 02:42:52');

-- --------------------------------------------------------

--
-- Table structure for table `admin_roles`
--

CREATE TABLE `admin_roles` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_roles`
--

INSERT INTO `admin_roles` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', 'administrator', '2024-05-08 02:41:29', '2024-05-08 02:41:29');

-- --------------------------------------------------------

--
-- Table structure for table `admin_role_menu`
--

CREATE TABLE `admin_role_menu` (
  `role_id` int NOT NULL,
  `menu_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_role_menu`
--

INSERT INTO `admin_role_menu` (`role_id`, `menu_id`, `created_at`, `updated_at`) VALUES
(1, 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_role_permissions`
--

CREATE TABLE `admin_role_permissions` (
  `role_id` int NOT NULL,
  `permission_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_role_permissions`
--

INSERT INTO `admin_role_permissions` (`role_id`, `permission_id`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_role_users`
--

CREATE TABLE `admin_role_users` (
  `role_id` int NOT NULL,
  `user_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_role_users`
--

INSERT INTO `admin_role_users` (`role_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_users`
--

CREATE TABLE `admin_users` (
  `id` int UNSIGNED NOT NULL,
  `username` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_users`
--

INSERT INTO `admin_users` (`id`, `username`, `password`, `name`, `avatar`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', '$2y$12$XF9Oqbf43ji7M1eIbVtzyOQzHpwCFI4uuBM2gqzqAdXZMgz/fXDCi', 'Administrator', NULL, NULL, '2024-05-08 02:41:29', '2024-05-08 02:41:29');

-- --------------------------------------------------------

--
-- Table structure for table `admin_user_permissions`
--

CREATE TABLE `admin_user_permissions` (
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2014_10_12_100000_create_password_resets_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2024_04_15_090627_alter_users_table', 2),
(7, '2024_04_16_153552_create_subjects_table', 3),
(8, '2024_04_17_075856_create__questions_table', 4),
(9, '2024_04_17_080458_alter__questions_table', 5),
(10, '2024_04_17_090953_alter_question_table', 6),
(11, '2024_04_18_090924_alter_questions_table', 7),
(12, '2024_04_19_022829_create_tests_table', 8),
(13, '2024_04_19_051150_create_test_question_table', 9),
(14, '2024_04_19_071622_alter_tests_table', 10),
(15, '2024_04_20_165116_alter_tests_table', 11),
(16, '2024_04_20_165858_alter_tests_table', 12),
(17, '2024_04_20_172143_alter_tests_table', 13),
(18, '2024_04_22_090250_alter_test_question_table', 14),
(19, '2024_04_23_171449_alter_users_table', 15),
(20, '2016_01_04_173148_create_admin_tables', 16),
(21, '2024_05_07_075331_create_subscribers_table', 17),
(22, '2024_05_08_083014_create_contacts_table', 17),
(23, '2024_05_09_100056_alter_contacts_table', 17),
(24, '2024_05_09_165823_alter_subscribers_table', 17),
(25, '2024_05_14_083235_alter_users_table', 18),
(26, '2024_05_14_085639_alter_users_table', 19),
(27, '2024_05_14_092106_alter_users_table', 20),
(28, '2024_05_15_080045_create_payments_table', 21);

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
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int UNSIGNED NOT NULL,
  `r_payment_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `json_response` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `r_payment_id`, `method`, `currency`, `user_email`, `amount`, `json_response`, `created_at`, `updated_at`) VALUES
(1, 'pay_OAjLW9f7JY6dOa', 'paylater', 'INR', 'abc@gmail.com', '100', '{\"\\u0000*\\u0000attributes\":{\"id\":\"pay_OAjLW9f7JY6dOa\",\"entity\":\"payment\",\"amount\":10000,\"currency\":\"INR\",\"status\":\"captured\",\"order_id\":null,\"invoice_id\":null,\"international\":false,\"method\":\"paylater\",\"amount_refunded\":0,\"refund_status\":null,\"captured\":true,\"description\":\"Razorpay payment\",\"card_id\":null,\"bank\":null,\"wallet\":\"amazonpay\",\"vpa\":null,\"email\":\"abc@gmail.com\",\"contact\":\"+917888381864\",\"notes\":{},\"fee\":236,\"tax\":36,\"error_code\":null,\"error_description\":null,\"error_source\":null,\"error_step\":null,\"error_reason\":null,\"acquirer_data\":{},\"created_at\":1715767573,\"reward\":null}}', '2024-05-15 04:36:24', '2024-05-15 04:36:24'),
(2, 'pay_OAjROaAhGQrHQT', 'paylater', 'INR', 'abc@gmail.com', '100', '{\"\\u0000*\\u0000attributes\":{\"id\":\"pay_OAjROaAhGQrHQT\",\"entity\":\"payment\",\"amount\":10000,\"currency\":\"INR\",\"status\":\"captured\",\"order_id\":null,\"invoice_id\":null,\"international\":false,\"method\":\"paylater\",\"amount_refunded\":0,\"refund_status\":null,\"captured\":true,\"description\":\"Razorpay payment\",\"card_id\":null,\"bank\":null,\"wallet\":\"amazonpay\",\"vpa\":null,\"email\":\"abc@gmail.com\",\"contact\":\"+917888381864\",\"notes\":{},\"fee\":236,\"tax\":36,\"error_code\":null,\"error_description\":null,\"error_source\":null,\"error_step\":null,\"error_reason\":null,\"acquirer_data\":{},\"created_at\":1715767907,\"reward\":null}}', '2024-05-15 04:41:57', '2024-05-15 04:41:57'),
(3, 'pay_OAjV51hQLR2OBg', 'paylater', 'INR', 'abc@gmail.com', '100', '{\"\\u0000*\\u0000attributes\":{\"id\":\"pay_OAjV51hQLR2OBg\",\"entity\":\"payment\",\"amount\":10000,\"currency\":\"INR\",\"status\":\"captured\",\"order_id\":null,\"invoice_id\":null,\"international\":false,\"method\":\"paylater\",\"amount_refunded\":0,\"refund_status\":null,\"captured\":true,\"description\":\"Razorpay payment\",\"card_id\":null,\"bank\":null,\"wallet\":\"amazonpay\",\"vpa\":null,\"email\":\"abc@gmail.com\",\"contact\":\"+917888381864\",\"notes\":{},\"fee\":236,\"tax\":36,\"error_code\":null,\"error_description\":null,\"error_source\":null,\"error_step\":null,\"error_reason\":null,\"acquirer_data\":{},\"created_at\":1715768116,\"reward\":null}}', '2024-05-15 04:45:22', '2024-05-15 04:45:22'),
(4, 'pay_OAjWqY2EuHqLPT', 'paylater', 'INR', 'abc@gmail.com', '100', '{\"\\u0000*\\u0000attributes\":{\"id\":\"pay_OAjWqY2EuHqLPT\",\"entity\":\"payment\",\"amount\":10000,\"currency\":\"INR\",\"status\":\"captured\",\"order_id\":null,\"invoice_id\":null,\"international\":false,\"method\":\"paylater\",\"amount_refunded\":0,\"refund_status\":null,\"captured\":true,\"description\":\"Razorpay payment\",\"card_id\":null,\"bank\":null,\"wallet\":\"amazonpay\",\"vpa\":null,\"email\":\"abc@gmail.com\",\"contact\":\"+917888381864\",\"notes\":{},\"fee\":236,\"tax\":36,\"error_code\":null,\"error_description\":null,\"error_source\":null,\"error_step\":null,\"error_reason\":null,\"acquirer_data\":{},\"created_at\":1715768216,\"reward\":null}}', '2024-05-15 04:47:06', '2024-05-15 04:47:06'),
(5, 'pay_ObxiGuTNz723p7', 'paylater', 'INR', 'abc@gmail.com', '100', '{\"\\u0000*\\u0000attributes\":{\"id\":\"pay_ObxiGuTNz723p7\",\"entity\":\"payment\",\"amount\":10000,\"currency\":\"INR\",\"status\":\"captured\",\"order_id\":null,\"invoice_id\":null,\"international\":false,\"method\":\"paylater\",\"amount_refunded\":0,\"refund_status\":null,\"captured\":true,\"description\":\"Razorpay payment\",\"card_id\":null,\"bank\":null,\"wallet\":\"amazonpay\",\"vpa\":null,\"email\":\"abc@gmail.com\",\"contact\":\"+917888381864\",\"notes\":{},\"fee\":236,\"tax\":36,\"error_code\":null,\"error_description\":null,\"error_source\":null,\"error_step\":null,\"error_reason\":null,\"acquirer_data\":{},\"created_at\":1721713351,\"reward\":null}}', '2024-07-23 00:12:40', '2024-07-23 00:12:40');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` bigint UNSIGNED NOT NULL,
  `question` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `option1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `option2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `option3` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `option4` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `right_answer` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `question`, `option1`, `option2`, `option3`, `option4`, `right_answer`, `subject_id`, `created_at`, `updated_at`) VALUES
(5, '62 - 20', '56', '98', '23', '42', '42', '9', '2024-04-18 03:07:02', '2024-04-24 09:11:08'),
(6, '45 - 32', '65', '15', '13', '14', '13', '9', '2024-04-18 03:22:27', '2024-04-18 23:35:52'),
(7, 'cause of water pollution', 'wastage of water', 'fuel burns', 'dumping garbages into river', 'none of them', 'dumping garbages into river', '10', '2024-04-19 02:19:22', '2024-04-19 02:19:22'),
(8, 'In which state Taj Mahal is situated ?', 'Delhi', 'Haryana', 'Madhya Pradesh', 'Uttar Pradesh', 'Uttar Pradesh', '11', '2024-04-19 09:03:14', '2024-04-19 09:03:14'),
(9, 'Aurangjeb died in', '1708', '1709', '1710', '1707', '1707', '11', '2024-04-20 03:43:48', '2024-04-20 03:44:15'),
(10, 'forest are major source of ?', 'oxygen', 'carbon dioxide', 'woods', 'none of them', 'oxygen', '10', '2024-04-22 02:25:18', '2024-04-22 02:25:18'),
(11, 'forest day is celebrated on ?', '21 mar', '21 apr', '21 oct', '21 dec', '21 mar', '10', '2024-04-22 02:26:41', '2024-04-22 02:26:41'),
(12, 'Ram mandir is situated in ?', 'ayodhya', 'mathura', 'merut', 'sri lanka', 'ayodhya', '3', '2024-04-24 08:50:54', '2024-04-24 08:50:54'),
(13, 'nilgiri mountains are found in which state ?', 'madhya pradesh', 'gujrat', 'maharastra', 'tamilnadu', 'tamilnadu', '3', '2024-04-26 23:35:24', '2024-04-26 23:35:24'),
(15, '22nd state of india ?', 'sikkim', 'jharkhand', 'up', 'mp', 'sikkim', '3', '2024-05-01 05:20:13', '2024-05-01 05:20:13'),
(16, 'right to equality is in', 'art 12', 'art 15', 'art 17', 'art 18', 'art 15', '3', '2024-05-01 05:21:00', '2024-05-01 05:21:00'),
(17, 'number of fundamental duties ?', '11', '12', '13', '14', '11', '3', '2024-05-01 05:22:12', '2024-05-01 05:22:12');

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`id`, `title`, `image`, `created_at`, `updated_at`) VALUES
(3, 'gs', '1713967967.jpg', '2024-04-16 10:35:16', '2024-04-24 08:42:47'),
(7, 'AI', '1713329572.jpg', '2024-04-16 23:22:52', '2024-04-16 23:22:52'),
(8, 'birds', '1713339795.jpg', '2024-04-16 23:46:23', '2024-04-17 02:13:15'),
(9, 'math', '1713429335.jpg', '2024-04-18 03:05:35', '2024-04-18 03:05:35'),
(10, 'environment', '1713459400.jpg', '2024-04-18 03:05:57', '2024-04-18 11:26:41'),
(11, 'gk', '1713491028.jpg', '2024-04-18 20:13:48', '2024-04-18 20:13:48'),
(12, 'english', '1713967724.jpg', '2024-04-24 08:38:44', '2024-04-24 08:38:44'),
(13, 'science', '1713968933.jpg', '2024-04-24 08:58:53', '2024-04-24 08:58:53'),
(14, 'magic', '1714466844.jpg', '2024-04-30 03:17:24', '2024-04-30 03:26:30'),
(15, ',mdfnm', '1714468630.jpg', '2024-04-30 03:47:10', '2024-04-30 03:47:10');

-- --------------------------------------------------------

--
-- Table structure for table `subscribers`
--

CREATE TABLE `subscribers` (
  `id` bigint UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tests`
--

CREATE TABLE `tests` (
  `id` bigint UNSIGNED NOT NULL,
  `test_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `test_date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `question_id` blob,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tests`
--

INSERT INTO `tests` (`id`, `test_name`, `test_date`, `subject_id`, `question_id`, `created_at`, `updated_at`) VALUES
(49, 'cds', '2024-05-11', '11', 0x39, '2024-04-21 01:30:57', '2024-04-21 01:30:57'),
(50, 'ssc gd', '2024-05-13', '8', 0x39, '2024-04-21 01:31:49', '2024-04-30 02:25:44'),
(51, 'ssc gd', '2024-05-11', '9', 0x39, '2024-04-21 02:05:26', '2024-04-21 02:05:26'),
(52, 'mpp', '2024-06-26', '11', 0x39, '2024-04-21 02:38:08', '2024-04-21 02:38:08'),
(53, 'ukpcs', '2024-04-04', '10', 0x39, '2024-04-22 02:17:15', '2024-04-22 02:17:15'),
(54, 'bpsc', '2024-04-04', '10', 0x39, '2024-04-22 02:22:41', '2024-04-22 02:22:41'),
(55, 'bpsc', '2024-04-30', '10', 0x3131, '2024-04-22 02:27:20', '2024-04-22 02:27:20'),
(56, 'bpsc', '2024-04-30', '10', 0x3131, '2024-04-22 02:34:12', '2024-04-22 02:34:12'),
(57, 'gkps', '2024-04-30', '10', 0x3131, '2024-04-22 02:35:38', '2024-04-22 02:35:38'),
(58, 'gkps', '2024-04-30', '10', 0x3131, '2024-04-22 02:38:15', '2024-04-30 01:15:00'),
(59, 'gkps', '2024-04-30', '12', 0x3131, '2024-04-22 02:39:13', '2024-04-30 01:15:27'),
(60, 'ssc', '2024-05-04', '9', 0x3131, '2024-04-22 03:45:09', '2024-04-22 03:45:09'),
(61, 'cds', '2024-05-11', '11', 0x3131, '2024-04-22 04:16:30', '2024-04-22 04:16:30'),
(62, 'bsf', '2024-05-03', '10', 0x3131, '2024-04-22 09:40:45', '2024-04-22 09:40:45'),
(63, 'tgt', '2024-05-09', '3', 0x3132, '2024-04-26 23:30:36', '2024-04-26 23:30:36'),
(64, 'ias', '2024-05-11', '3', 0x5b223132222c223133222c223135222c223137225d, '2024-04-26 23:42:05', '2024-05-01 05:58:55'),
(65, 'gkps', '2024-04-30', '10', 0x3131, '2024-04-30 01:03:46', '2024-04-30 01:03:46'),
(66, 'ukps', '2024-05-11', '8', 0x3131, '2024-04-30 01:06:52', '2024-04-30 01:12:15'),
(67, 'upsc', '2024-05-11', '13', 0x3133, '2024-04-30 02:48:16', '2024-04-30 02:48:16'),
(68, 'upsc', '2024-08-02', '13', 0x3133, '2024-04-30 02:49:23', '2024-04-30 02:49:23'),
(69, 'upsc', '2024-08-02', '13', 0x3133, '2024-04-30 02:53:36', '2024-04-30 02:53:36'),
(70, 'upsc', '2024-08-02', '13', 0x3133, '2024-04-30 02:53:43', '2024-04-30 02:53:43'),
(71, 'ssc', '2024-05-04', '9', 0x3133, '2024-04-30 02:57:03', '2024-04-30 02:57:03'),
(72, 'ssc', '2024-05-04', '9', 0x3133, '2024-04-30 03:09:41', '2024-04-30 03:09:41'),
(73, 'ssc', '2024-05-04', '9', 0x3133, '2024-04-30 03:12:03', '2024-04-30 03:12:03'),
(74, 'upsc', '2024-04-26', '8', 0x3133, '2024-04-30 03:13:24', '2024-04-30 03:13:24'),
(75, 'cds', '2024-05-11', '9', 0x3133, '2024-04-30 03:13:35', '2024-04-30 03:13:35'),
(76, 'ssc', '2024-04-20', '12', 0x3133, '2024-04-30 03:14:13', '2024-04-30 03:14:13'),
(77, 'upsc', '2024-05-04', '8', 0x3133, '2024-04-30 03:34:11', '2024-04-30 03:34:11'),
(78, 'jkpc', '2024-05-11', '8', 0x3133, '2024-04-30 03:35:27', '2024-04-30 03:35:27'),
(79, 'ssc', '2024-04-05', '9', 0x3133, '2024-04-30 03:36:37', '2024-04-30 03:36:37'),
(80, 'ssc', '2024-04-05', '9', 0x3133, '2024-04-30 03:36:47', '2024-04-30 03:36:47'),
(81, 'ssc', '2024-04-05', '9', 0x3133, '2024-04-30 03:36:50', '2024-04-30 03:36:50'),
(82, 'ssc', '2024-04-05', '9', 0x3133, '2024-04-30 03:38:49', '2024-04-30 03:38:49'),
(83, 'ssc', '2024-04-05', '9', 0x3133, '2024-04-30 03:39:07', '2024-04-30 03:39:07'),
(84, 'ssc', '2024-04-05', '7', 0x3133, '2024-04-30 03:39:22', '2024-04-30 03:39:22'),
(85, 'ssc', '2024-04-05', '8', 0x3133, '2024-04-30 03:39:31', '2024-04-30 03:39:31'),
(86, 'ssc', '2024-04-05', '10', 0x3133, '2024-04-30 03:39:37', '2024-04-30 03:39:37'),
(87, 'pppp', '2024-04-06', '9', 0x3133, '2024-04-30 05:16:30', '2024-04-30 05:16:30'),
(88, 'upp', '2024-05-31', '14', 0x3133, '2024-05-01 04:22:45', '2024-05-01 04:22:45');

-- --------------------------------------------------------

--
-- Table structure for table `test_questions`
--

CREATE TABLE `test_questions` (
  `id` bigint UNSIGNED NOT NULL,
  `question_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `test_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `test_questions`
--

INSERT INTO `test_questions` (`id`, `question_id`, `test_id`, `created_at`, `updated_at`) VALUES
(1, '11', '59', '2024-04-22 03:34:49', '2024-04-22 03:34:49'),
(2, '11', '59', '2024-04-22 03:35:48', '2024-04-22 03:35:48'),
(3, '11', '59', '2024-04-22 03:36:30', '2024-04-22 03:36:30'),
(4, '11', '59', '2024-04-22 03:42:25', '2024-04-22 03:42:25'),
(5, '6', '60', '2024-04-22 03:47:26', '2024-04-22 03:47:26'),
(6, '6', '60', '2024-04-22 03:47:31', '2024-04-22 03:47:31'),
(7, '6', '60', '2024-04-22 03:56:20', '2024-04-22 03:56:20'),
(8, '5', '60', '2024-04-22 04:08:04', '2024-04-22 04:08:04'),
(9, '6', '60', '2024-04-22 04:09:28', '2024-04-22 04:09:28'),
(10, '5', '60', '2024-04-22 04:15:38', '2024-04-22 04:15:38'),
(11, '6', '60', '2024-04-22 04:15:38', '2024-04-22 04:15:38'),
(12, '8', '61', '2024-04-22 04:16:34', '2024-04-22 04:16:34'),
(13, '9', '61', '2024-04-22 04:16:34', '2024-04-22 04:16:34'),
(14, '10', '62', '2024-04-22 09:41:15', '2024-04-22 09:41:15'),
(15, '11', '62', '2024-04-22 09:41:15', '2024-04-22 09:41:15'),
(16, '7', '62', '2024-04-22 09:45:01', '2024-04-22 09:45:01'),
(19, '10', '86', '2024-04-30 03:40:19', '2024-04-30 03:40:19'),
(20, '11', '86', '2024-04-30 03:40:20', '2024-04-30 03:40:20'),
(21, '5', '87', '2024-04-30 05:16:39', '2024-04-30 05:16:39'),
(22, '6', '87', '2024-04-30 05:16:39', '2024-04-30 05:16:39'),
(29, '12', '64', '2024-05-01 05:58:55', '2024-05-01 05:58:55'),
(30, '13', '64', '2024-05-01 05:58:55', '2024-05-01 05:58:55'),
(31, '15', '64', '2024-05-01 05:58:55', '2024-05-01 05:58:55'),
(32, '17', '64', '2024-05-01 05:58:55', '2024-05-01 05:58:55');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_payable` int DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `subject_id`, `image`, `remember_token`, `created_at`, `updated_at`, `is_payable`) VALUES
(1, 'amit', 'amityadav10409@gmail.com', NULL, '$2y$12$dxoftRHuafYP91cjENFSqe18zyzIOkKyOh.37HR0U505SB7D7pGgG', NULL, NULL, NULL, '2024-04-15 02:39:19', '2024-04-15 02:39:19', NULL),
(2, 'ankit', 'ankityadavdc@gmail.com', NULL, '$2y$12$vEMXPfuLkiwTk2gzzY0r6uhWsJpwnrmzhiC6Ql777hvZq8cMBqIii', NULL, NULL, NULL, '2024-04-15 03:27:30', '2024-04-15 03:27:30', NULL),
(3, 'inderjeet', 'inte@gmail.com', NULL, '$2y$12$yvd5Y0QQZdE33tnWQNN1euD1.DbIFLbR2Hq9szR4T62k5ZGo/l4FW', NULL, NULL, NULL, '2024-04-15 03:33:44', '2024-04-15 03:33:44', NULL),
(4, 'pankaj sharma', 'ps@gmail.com', NULL, '$2y$12$mjqgVb9LdPHp3ycUIfeLduhvyvTl5p90cU9yKvAdvyoj6NvMD1L26', NULL, NULL, NULL, '2024-04-15 03:44:11', '2024-04-15 03:44:11', NULL),
(5, 'jk', 'jk@gmail.com', NULL, '$2y$12$L7vaEV9gX2VyN/h3O7fFyO6dUfHrw8hzVNkji.XQt.gX//9yHNXAO', NULL, NULL, NULL, '2024-04-15 04:08:14', '2024-04-15 04:08:14', NULL),
(6, 'vikas', 'vk@gmail.com', NULL, '$2y$12$dcOZttYii5A6i8p6J/p1Qu/7wX4A11slv0XVErs8G1ajJ0UPPifeG', NULL, NULL, NULL, '2024-04-15 04:09:33', '2024-04-15 04:09:33', NULL),
(7, 'love', 'love@gmail.com', NULL, '$2y$12$302sGd9Ca.KtUy0W54GeDuYY8Sb3tAJBhad/ou78V0fjGUJwb19sG', NULL, NULL, NULL, '2024-04-15 04:11:40', '2024-04-15 04:11:40', NULL),
(8, 'hbf', 'hklak@gmail.com', NULL, '$2y$12$DgVHRhfk2RU/X6wXaaLM9.vCQPnpGS7zk/m.2wkvqH9wlVIDZa91S', NULL, NULL, NULL, '2024-04-15 04:25:57', '2024-04-15 04:25:57', NULL),
(9, 'kjfn', 'kk@gmail.com', NULL, '$2y$12$JSrQNZGOpFqxYjRdCKJky.rpeeu4DHvdQHfK0ddNLueOAEyM1s2Ru', NULL, NULL, NULL, '2024-04-15 04:29:34', '2024-04-15 04:29:34', NULL),
(10, 'yuvraj', 'uk@gmail.com', NULL, '$2y$12$gWs7iwxnovgrWvtX8a2/zu9ltnEA9dWbLshE1MxpfL/n8Y4PoqFAS', NULL, NULL, NULL, '2024-04-15 05:18:47', '2024-04-15 05:18:47', NULL),
(11, 'virat', 'va@gmail.com', NULL, '$2y$12$JrggnYu/qtCndCm5moBUpeuzQr.IbYqB9jSoTyUsO1JOo1pSQE8h6', NULL, NULL, NULL, '2024-04-15 05:22:21', '2024-04-15 05:22:21', NULL),
(12, 'rohit', 'hitman@gmail.com', NULL, '$2y$12$bXwnoFnumdx45tpkm.fGCOiE0Cvx5puHnNVA6m76Ldcbm2l4pepFe', NULL, NULL, NULL, '2024-04-15 05:31:44', '2024-04-15 05:31:44', NULL),
(13, 'surya', 'sky@gmail.com', NULL, '$2y$12$sY0gP3wGUxJGmDzS2OI3M..ns2p0nuSdI4j6kxvkkHZ4rqCwCwVC2', NULL, NULL, NULL, '2024-04-15 05:35:27', '2024-04-15 05:35:27', NULL),
(14, 'hardik', 'hk@gmail.com', NULL, '$2y$12$/fqeB.q7QuSSyX6dTTnLUew3XC4r4hAlbMp6T5gqV2VT/LnjxrDFm', NULL, NULL, NULL, '2024-04-15 05:37:36', '2024-04-15 05:37:36', NULL),
(15, 'harman', 'hm@gmail.com', NULL, '$2y$12$oeZYZmXe15pUc074th/VKekXnh8MC1LN6fv7iAlrO4cJACIVcRFdC', NULL, '1713179488.png', NULL, '2024-04-15 05:41:28', '2024-04-15 05:41:28', NULL),
(17, 'aman singh', 'as@gmail.com', NULL, '$2y$12$eWn9cjc4f3xzK4RrsnInFO9MFk1eZfZ67qlJpa8/R6HxOqZopijWO', NULL, '1713490833.jpg', NULL, '2024-04-18 20:10:34', '2024-04-18 20:10:34', NULL),
(18, 'udyogpati', 'upp@gmail.com', NULL, '$2y$12$eYlpcAPgQ0biRrUg/2ajYOgsY2ie1zGOiioMI0VcLJgDe8wf/wY8m', NULL, '1713613872.jpg', NULL, '2024-04-20 06:21:13', '2024-04-20 06:21:13', NULL),
(19, 'amit', 'vy@gmail.com', NULL, '$2y$12$d4n0xS7TNgftM26rgzHHm.OoPcKVMc375NyjxQaHKT.rTs6qCfwty', NULL, '1713864582.jpg', NULL, '2024-04-23 03:59:43', '2024-04-23 03:59:43', NULL),
(20, 'yuyu', 'yu@gmail.com', NULL, '$2y$12$rsL74g5blnfzwD4xJszE2eTIQSBHIhr/l9bDEE9SFrLnlX3jtFU3K', '9', '1713945909.jpg', NULL, '2024-04-24 02:35:10', '2024-04-24 02:35:10', NULL),
(21, 'virat', 'vivo@gmail.com', NULL, '$2y$12$4JEZ/qOQBXDpfmycs3rQzubYEKX/.sKehEQ31lBHuNhnYz9U5REw.', '11', '1713946106.jpg', 'm4GDeA9jOL2ej8ee6ilTebSggQObBHJEppiqmOrfjMBPi3AarSWz0IcRRD7k', '2024-04-24 02:38:26', '2024-04-24 02:38:26', NULL),
(22, 'ajay', 'ajay@gmail.com', NULL, '$2y$12$0Ri7K3gFamT3mxpokz0wFuirZWk3d1dLKttJWdI0nheE6KIS.vzwK', '9', '1713957768.jpg', 'PoZvMkRunWmckqrBHzLc2fq9NIeTVOy3DgVFZHKqn5VpzVyR1Tbpy1pJUPAR', '2024-04-24 05:52:48', '2024-04-24 05:52:48', NULL),
(23, 'deedar', 'dk@gmail.com', NULL, '$2y$12$DnUf7dfYcY90AfvJodpa5ucMaYp1MjfV8wBLRps3JN3eybntodye.', '11', '1715678854.jpg', NULL, '2024-05-14 03:57:34', '2024-05-14 03:57:34', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_menu`
--
ALTER TABLE `admin_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_operation_log`
--
ALTER TABLE `admin_operation_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_operation_log_user_id_index` (`user_id`);

--
-- Indexes for table `admin_permissions`
--
ALTER TABLE `admin_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_permissions_name_unique` (`name`),
  ADD UNIQUE KEY `admin_permissions_slug_unique` (`slug`);

--
-- Indexes for table `admin_roles`
--
ALTER TABLE `admin_roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_roles_name_unique` (`name`),
  ADD UNIQUE KEY `admin_roles_slug_unique` (`slug`);

--
-- Indexes for table `admin_role_menu`
--
ALTER TABLE `admin_role_menu`
  ADD KEY `admin_role_menu_role_id_menu_id_index` (`role_id`,`menu_id`);

--
-- Indexes for table `admin_role_permissions`
--
ALTER TABLE `admin_role_permissions`
  ADD KEY `admin_role_permissions_role_id_permission_id_index` (`role_id`,`permission_id`);

--
-- Indexes for table `admin_role_users`
--
ALTER TABLE `admin_role_users`
  ADD KEY `admin_role_users_role_id_user_id_index` (`role_id`,`user_id`);

--
-- Indexes for table `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_users_username_unique` (`username`);

--
-- Indexes for table `admin_user_permissions`
--
ALTER TABLE `admin_user_permissions`
  ADD KEY `admin_user_permissions_user_id_permission_id_index` (`user_id`,`permission_id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscribers`
--
ALTER TABLE `subscribers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tests`
--
ALTER TABLE `tests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `test_questions`
--
ALTER TABLE `test_questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_menu`
--
ALTER TABLE `admin_menu`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `admin_operation_log`
--
ALTER TABLE `admin_operation_log`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=234;

--
-- AUTO_INCREMENT for table `admin_permissions`
--
ALTER TABLE `admin_permissions`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `admin_roles`
--
ALTER TABLE `admin_roles`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `subscribers`
--
ALTER TABLE `subscribers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tests`
--
ALTER TABLE `tests`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT for table `test_questions`
--
ALTER TABLE `test_questions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
