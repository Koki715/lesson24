-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- ホスト: localhost:8889
-- 生成日時: 2025 年 8 月 06 日 12:06
-- サーバのバージョン： 8.0.40
-- PHP のバージョン: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- データベース: `laravel_samuraimart`
--

-- --------------------------------------------------------

--
-- テーブルの構造 `admin_menu`
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
-- テーブルのデータのダンプ `admin_menu`
--

INSERT INTO `admin_menu` (`id`, `parent_id`, `order`, `title`, `icon`, `uri`, `permission`, `created_at`, `updated_at`) VALUES
(1, 0, 1, 'Dashboard', 'fa-bar-chart', '/', NULL, NULL, NULL),
(2, 0, 2, 'Admin', 'fa-tasks', '', NULL, NULL, NULL),
(3, 2, 3, 'Users', 'fa-users', 'auth/users', NULL, NULL, NULL),
(4, 2, 4, 'Roles', 'fa-user', 'auth/roles', NULL, NULL, NULL),
(5, 2, 5, 'Permission', 'fa-ban', 'auth/permissions', NULL, NULL, NULL),
(6, 2, 6, 'Menu', 'fa-bars', 'auth/menu', NULL, NULL, NULL),
(7, 2, 7, 'Operation log', 'fa-history', 'auth/logs', NULL, NULL, NULL),
(8, 0, 0, 'カテゴリー', 'fa-bars', 'categories', NULL, '2025-08-04 13:06:26', '2025-08-04 13:06:26'),
(9, 0, 0, '商品', 'fa-bars', 'products', NULL, '2025-08-04 13:23:44', '2025-08-04 13:23:44'),
(10, 0, 0, '親カテゴリー', 'fa-bars', 'major-categories', NULL, '2025-08-04 23:06:48', '2025-08-04 23:06:48'),
(11, 0, 0, 'ユーザー', 'fa-bars', 'users', NULL, '2025-08-05 15:23:47', '2025-08-05 15:23:47'),
(12, 0, 0, '売り上げ', 'fa-bars', 'shopping-carts', NULL, '2025-08-06 05:51:51', '2025-08-06 05:51:51');

-- --------------------------------------------------------

--
-- テーブルの構造 `admin_operation_log`
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
-- テーブルのデータのダンプ `admin_operation_log`
--

INSERT INTO `admin_operation_log` (`id`, `user_id`, `path`, `method`, `ip`, `input`, `created_at`, `updated_at`) VALUES
(1, 1, 'admin', 'GET', '::1', '[]', '2025-08-04 13:04:18', '2025-08-04 13:04:18'),
(2, 1, 'admin', 'GET', '::1', '[]', '2025-08-04 13:05:55', '2025-08-04 13:05:55'),
(3, 1, 'admin/auth/menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2025-08-04 13:06:04', '2025-08-04 13:06:04'),
(4, 1, 'admin/auth/menu', 'POST', '::1', '{\"parent_id\":\"0\",\"title\":\"\\u30ab\\u30c6\\u30b4\\u30ea\\u30fc\",\"icon\":\"fa-bars\",\"uri\":\"categories\",\"roles\":[null],\"permission\":null,\"_token\":\"LTCGrleK7qiyYkuQyQNsLT07EqCqWtTQuPcEq7yk\"}', '2025-08-04 13:06:25', '2025-08-04 13:06:25'),
(5, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2025-08-04 13:06:26', '2025-08-04 13:06:26'),
(6, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2025-08-04 13:06:42', '2025-08-04 13:06:42'),
(7, 1, 'admin/categories', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2025-08-04 13:06:45', '2025-08-04 13:06:45'),
(8, 1, 'admin/categories', 'GET', '::1', '[]', '2025-08-04 13:08:04', '2025-08-04 13:08:04'),
(9, 1, 'admin/categories', 'GET', '::1', '[]', '2025-08-04 13:10:30', '2025-08-04 13:10:30'),
(10, 1, 'admin/categories', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2025-08-04 13:23:18', '2025-08-04 13:23:18'),
(11, 1, 'admin/auth/menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2025-08-04 13:23:24', '2025-08-04 13:23:24'),
(12, 1, 'admin/auth/menu', 'POST', '::1', '{\"parent_id\":\"0\",\"title\":\"\\u5546\\u54c1\",\"icon\":\"fa-bars\",\"uri\":\"products\",\"roles\":[null],\"permission\":null,\"_token\":\"LTCGrleK7qiyYkuQyQNsLT07EqCqWtTQuPcEq7yk\"}', '2025-08-04 13:23:44', '2025-08-04 13:23:44'),
(13, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2025-08-04 13:23:44', '2025-08-04 13:23:44'),
(14, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2025-08-04 13:23:50', '2025-08-04 13:23:50'),
(15, 1, 'admin/products', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2025-08-04 13:23:52', '2025-08-04 13:23:52'),
(16, 1, 'admin/products/1/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2025-08-04 13:24:18', '2025-08-04 13:24:18'),
(17, 1, 'admin/products', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2025-08-04 13:24:32', '2025-08-04 13:24:32'),
(18, 1, 'admin/products', 'GET', '::1', '[]', '2025-08-04 13:28:53', '2025-08-04 13:28:53'),
(19, 1, 'admin/products', 'GET', '::1', '{\"_sort\":{\"column\":\"price\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\"}', '2025-08-04 13:28:55', '2025-08-04 13:28:55'),
(20, 1, 'admin/products', 'GET', '::1', '{\"_sort\":{\"column\":\"id\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\"}', '2025-08-04 13:28:57', '2025-08-04 13:28:57'),
(21, 1, 'admin/products', 'GET', '::1', '{\"_sort\":{\"column\":\"id\",\"type\":\"asc\"},\"_pjax\":\"#pjax-container\"}', '2025-08-04 13:28:59', '2025-08-04 13:28:59'),
(22, 1, 'admin/products', 'GET', '::1', '{\"_sort\":{\"column\":\"id\",\"type\":\"asc\"},\"_pjax\":\"#pjax-container\",\"id\":null,\"name\":null,\"description\":null,\"price\":{\"start\":null,\"end\":null},\"category_id\":[\"1\"]}', '2025-08-04 13:29:10', '2025-08-04 13:29:10'),
(23, 1, 'admin', 'GET', '::1', '[]', '2025-08-04 23:05:59', '2025-08-04 23:05:59'),
(24, 1, 'admin/auth/menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2025-08-04 23:06:24', '2025-08-04 23:06:24'),
(25, 1, 'admin/auth/menu', 'POST', '::1', '{\"parent_id\":\"0\",\"title\":\"\\u89aa\\u30ab\\u30c6\\u30b4\\u30ea\\u30fc\",\"icon\":\"fa-bars\",\"uri\":\"major-categories\",\"roles\":[null],\"permission\":null,\"_token\":\"Ch11zz2nxT7I8m1avmgoJpOch8TpWA0KsrY3JU6T\"}', '2025-08-04 23:06:48', '2025-08-04 23:06:48'),
(26, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2025-08-04 23:06:49', '2025-08-04 23:06:49'),
(27, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2025-08-04 23:06:57', '2025-08-04 23:06:57'),
(28, 1, 'admin/major-categories', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2025-08-04 23:06:59', '2025-08-04 23:06:59'),
(29, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2025-08-04 23:06:59', '2025-08-04 23:06:59'),
(30, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2025-08-04 23:09:12', '2025-08-04 23:09:12'),
(31, 1, 'admin/major-categories', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2025-08-04 23:09:15', '2025-08-04 23:09:15'),
(32, 1, 'admin/major-categories', 'GET', '::1', '[]', '2025-08-04 23:15:55', '2025-08-04 23:15:55'),
(33, 1, 'admin/categories', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2025-08-04 23:15:56', '2025-08-04 23:15:56'),
(34, 1, 'admin/categories/1', 'PUT', '::1', '{\"name\":\"major_category_id\",\"value\":\"1\",\"pk\":\"1\",\"_token\":\"Ch11zz2nxT7I8m1avmgoJpOch8TpWA0KsrY3JU6T\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2025-08-04 23:16:23', '2025-08-04 23:16:23'),
(35, 1, 'admin/categories/2', 'PUT', '::1', '{\"name\":\"major_category_id\",\"value\":\"1\",\"pk\":\"2\",\"_token\":\"Ch11zz2nxT7I8m1avmgoJpOch8TpWA0KsrY3JU6T\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2025-08-04 23:16:25', '2025-08-04 23:16:25'),
(36, 1, 'admin/categories/3', 'PUT', '::1', '{\"name\":\"major_category_id\",\"value\":\"1\",\"pk\":\"3\",\"_token\":\"Ch11zz2nxT7I8m1avmgoJpOch8TpWA0KsrY3JU6T\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2025-08-04 23:16:28', '2025-08-04 23:16:28'),
(37, 1, 'admin/categories/4', 'PUT', '::1', '{\"name\":\"major_category_id\",\"value\":\"1\",\"pk\":\"4\",\"_token\":\"Ch11zz2nxT7I8m1avmgoJpOch8TpWA0KsrY3JU6T\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2025-08-04 23:16:31', '2025-08-04 23:16:31'),
(38, 1, 'admin/categories/5', 'PUT', '::1', '{\"name\":\"major_category_id\",\"value\":\"1\",\"pk\":\"5\",\"_token\":\"Ch11zz2nxT7I8m1avmgoJpOch8TpWA0KsrY3JU6T\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2025-08-04 23:16:34', '2025-08-04 23:16:34'),
(39, 1, 'admin/categories/6', 'PUT', '::1', '{\"name\":\"major_category_id\",\"value\":\"1\",\"pk\":\"6\",\"_token\":\"Ch11zz2nxT7I8m1avmgoJpOch8TpWA0KsrY3JU6T\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2025-08-04 23:16:36', '2025-08-04 23:16:36'),
(40, 1, 'admin/categories/7', 'PUT', '::1', '{\"name\":\"major_category_id\",\"value\":\"1\",\"pk\":\"7\",\"_token\":\"Ch11zz2nxT7I8m1avmgoJpOch8TpWA0KsrY3JU6T\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2025-08-04 23:16:40', '2025-08-04 23:16:40'),
(41, 1, 'admin/categories/8', 'PUT', '::1', '{\"name\":\"major_category_id\",\"value\":\"1\",\"pk\":\"8\",\"_token\":\"Ch11zz2nxT7I8m1avmgoJpOch8TpWA0KsrY3JU6T\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2025-08-04 23:16:42', '2025-08-04 23:16:42'),
(42, 1, 'admin/categories/9', 'PUT', '::1', '{\"name\":\"major_category_id\",\"value\":\"1\",\"pk\":\"9\",\"_token\":\"Ch11zz2nxT7I8m1avmgoJpOch8TpWA0KsrY3JU6T\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2025-08-04 23:16:45', '2025-08-04 23:16:45'),
(43, 1, 'admin/categories/10', 'PUT', '::1', '{\"name\":\"major_category_id\",\"value\":\"1\",\"pk\":\"10\",\"_token\":\"Ch11zz2nxT7I8m1avmgoJpOch8TpWA0KsrY3JU6T\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2025-08-04 23:16:48', '2025-08-04 23:16:48'),
(44, 1, 'admin/categories/11', 'PUT', '::1', '{\"name\":\"major_category_id\",\"value\":\"1\",\"pk\":\"11\",\"_token\":\"Ch11zz2nxT7I8m1avmgoJpOch8TpWA0KsrY3JU6T\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2025-08-04 23:16:50', '2025-08-04 23:16:50'),
(45, 1, 'admin/categories/12', 'PUT', '::1', '{\"name\":\"major_category_id\",\"value\":\"1\",\"pk\":\"12\",\"_token\":\"Ch11zz2nxT7I8m1avmgoJpOch8TpWA0KsrY3JU6T\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2025-08-04 23:16:53', '2025-08-04 23:16:53'),
(46, 1, 'admin/categories/13', 'PUT', '::1', '{\"name\":\"major_category_id\",\"value\":\"2\",\"pk\":\"13\",\"_token\":\"Ch11zz2nxT7I8m1avmgoJpOch8TpWA0KsrY3JU6T\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2025-08-04 23:17:00', '2025-08-04 23:17:00'),
(47, 1, 'admin/categories/14', 'PUT', '::1', '{\"name\":\"major_category_id\",\"value\":\"2\",\"pk\":\"14\",\"_token\":\"Ch11zz2nxT7I8m1avmgoJpOch8TpWA0KsrY3JU6T\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2025-08-04 23:17:02', '2025-08-04 23:17:02'),
(48, 1, 'admin/categories/15', 'PUT', '::1', '{\"name\":\"major_category_id\",\"value\":\"2\",\"pk\":\"15\",\"_token\":\"Ch11zz2nxT7I8m1avmgoJpOch8TpWA0KsrY3JU6T\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2025-08-04 23:17:04', '2025-08-04 23:17:04'),
(49, 1, 'admin/categories/16', 'PUT', '::1', '{\"name\":\"major_category_id\",\"value\":\"3\",\"pk\":\"16\",\"_token\":\"Ch11zz2nxT7I8m1avmgoJpOch8TpWA0KsrY3JU6T\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2025-08-04 23:17:06', '2025-08-04 23:17:06'),
(50, 1, 'admin/categories/17', 'PUT', '::1', '{\"name\":\"major_category_id\",\"value\":\"3\",\"pk\":\"17\",\"_token\":\"Ch11zz2nxT7I8m1avmgoJpOch8TpWA0KsrY3JU6T\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2025-08-04 23:17:09', '2025-08-04 23:17:09'),
(51, 1, 'admin/categories/18', 'PUT', '::1', '{\"name\":\"major_category_id\",\"value\":\"3\",\"pk\":\"18\",\"_token\":\"Ch11zz2nxT7I8m1avmgoJpOch8TpWA0KsrY3JU6T\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2025-08-04 23:17:11', '2025-08-04 23:17:11'),
(52, 1, 'admin', 'GET', '::1', '[]', '2025-08-05 15:23:28', '2025-08-05 15:23:28'),
(53, 1, 'admin/auth/menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2025-08-05 15:23:33', '2025-08-05 15:23:33'),
(54, 1, 'admin/auth/menu', 'POST', '::1', '{\"parent_id\":\"0\",\"title\":\"\\u30e6\\u30fc\\u30b6\\u30fc\",\"icon\":\"fa-bars\",\"uri\":\"users\",\"roles\":[null],\"permission\":null,\"_token\":\"Tt7DiooHXWKbPOdIOm17uj7z6A15hrLS8WgDxq75\"}', '2025-08-05 15:23:47', '2025-08-05 15:23:47'),
(55, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2025-08-05 15:23:47', '2025-08-05 15:23:47'),
(56, 1, 'admin/users', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2025-08-05 15:24:00', '2025-08-05 15:24:00'),
(57, 1, 'admin/users', 'GET', '::1', '[]', '2025-08-05 15:37:08', '2025-08-05 15:37:08'),
(58, 1, 'admin/users', 'GET', '::1', '{\"_sort\":{\"column\":\"deleted_at\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\"}', '2025-08-05 15:37:15', '2025-08-05 15:37:15'),
(59, 1, 'admin/users', 'GET', '::1', '{\"_sort\":{\"column\":\"deleted_at\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\",\"_scope_\":\"trashed\"}', '2025-08-05 15:37:20', '2025-08-05 15:37:20'),
(60, 1, 'admin/users/10/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2025-08-05 15:37:30', '2025-08-05 15:37:30'),
(61, 1, 'admin/users/10', 'DELETE', '::1', '{\"_method\":\"delete\",\"_token\":\"C6muEVsXi07UAbHlj3OOaHtbcqUVyGy4hP5wtCL5\"}', '2025-08-05 15:37:41', '2025-08-05 15:37:41'),
(62, 1, 'admin/users', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2025-08-05 15:37:41', '2025-08-05 15:37:41'),
(63, 1, 'admin/users', 'GET', '::1', '{\"_pjax\":\"#pjax-container\",\"_scope_\":\"trashed\"}', '2025-08-05 15:37:55', '2025-08-05 15:37:55'),
(64, 1, 'admin/users', 'GET', '::1', '{\"_scope_\":\"trashed\"}', '2025-08-06 02:01:04', '2025-08-06 02:01:04'),
(65, 1, 'admin/users', 'GET', '::1', '{\"_scope_\":\"trashed\"}', '2025-08-06 02:01:05', '2025-08-06 02:01:05'),
(66, 1, 'admin/products', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2025-08-06 02:01:17', '2025-08-06 02:01:17'),
(67, 1, 'admin/products', 'GET', '::1', '{\"_pjax\":\"#pjax-container\",\"page\":\"2\"}', '2025-08-06 02:01:24', '2025-08-06 02:01:24'),
(68, 1, 'admin/products', 'GET', '::1', '{\"_pjax\":\"#pjax-container\",\"page\":\"1\"}', '2025-08-06 02:01:26', '2025-08-06 02:01:26'),
(69, 1, 'admin/products/1/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2025-08-06 02:01:31', '2025-08-06 02:01:31'),
(70, 1, 'admin/products/1', 'PUT', '::1', '{\"name\":\"Laravel\\u5165\\u9580\",\"description\":\"Laravel\\u5165\\u9580\\u306e\\u672c\\u3067\\u3059\\u3002\",\"shipping_date\":null,\"price\":\"2000\",\"category_id\":\"5\",\"reccomend_flag\":\"on\",\"_token\":\"BwbSx62psbC8SOUBANnt5EePBz5v2GjLQZ7BX9cn\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/laravel-samuraimart\\/public\\/admin\\/products?&page=1\"}', '2025-08-06 02:01:37', '2025-08-06 02:01:37'),
(71, 1, 'admin/products/1/edit', 'GET', '::1', '[]', '2025-08-06 02:01:37', '2025-08-06 02:01:37'),
(72, 1, 'admin/products', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2025-08-06 02:04:48', '2025-08-06 02:04:48'),
(73, 1, 'admin/products/1/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2025-08-06 02:04:56', '2025-08-06 02:04:56'),
(74, 1, 'admin/products/1', 'PUT', '::1', '{\"name\":\"Laravel\\u5165\\u9580\",\"description\":\"Laravel\\u5165\\u9580\\u306e\\u672c\\u3067\\u3059\\u3002\",\"shipping_date\":null,\"price\":\"2000\",\"category_id\":\"5\",\"recommend_flag\":\"on\",\"_token\":\"BwbSx62psbC8SOUBANnt5EePBz5v2GjLQZ7BX9cn\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/laravel-samuraimart\\/public\\/admin\\/products\"}', '2025-08-06 02:05:00', '2025-08-06 02:05:00'),
(75, 1, 'admin/products', 'GET', '::1', '[]', '2025-08-06 02:05:01', '2025-08-06 02:05:01'),
(76, 1, 'admin/products', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2025-08-06 02:42:57', '2025-08-06 02:42:57'),
(77, 1, 'admin/products', 'GET', '::1', '[]', '2025-08-06 02:42:57', '2025-08-06 02:42:57'),
(78, 1, 'admin/products', 'GET', '::1', '[]', '2025-08-06 02:42:58', '2025-08-06 02:42:58'),
(79, 1, 'admin/products', 'GET', '::1', '[]', '2025-08-06 02:42:58', '2025-08-06 02:42:58'),
(80, 1, 'admin/products', 'GET', '::1', '[]', '2025-08-06 02:42:59', '2025-08-06 02:42:59'),
(81, 1, 'admin/products', 'GET', '::1', '[]', '2025-08-06 02:42:59', '2025-08-06 02:42:59'),
(82, 1, 'admin/products', 'GET', '::1', '[]', '2025-08-06 02:42:59', '2025-08-06 02:42:59'),
(83, 1, 'admin/products', 'GET', '::1', '[]', '2025-08-06 02:43:00', '2025-08-06 02:43:00'),
(84, 1, 'admin/products', 'GET', '::1', '[]', '2025-08-06 02:43:00', '2025-08-06 02:43:00'),
(85, 1, 'admin/products', 'GET', '::1', '[]', '2025-08-06 02:43:00', '2025-08-06 02:43:00'),
(86, 1, 'admin/products', 'GET', '::1', '[]', '2025-08-06 02:43:01', '2025-08-06 02:43:01'),
(87, 1, 'admin/products', 'GET', '::1', '[]', '2025-08-06 02:43:01', '2025-08-06 02:43:01'),
(88, 1, 'admin/products', 'GET', '::1', '[]', '2025-08-06 02:43:02', '2025-08-06 02:43:02'),
(89, 1, 'admin/products', 'GET', '::1', '[]', '2025-08-06 02:43:02', '2025-08-06 02:43:02'),
(90, 1, 'admin/products', 'GET', '::1', '[]', '2025-08-06 02:43:02', '2025-08-06 02:43:02'),
(91, 1, 'admin/products', 'GET', '::1', '[]', '2025-08-06 02:43:03', '2025-08-06 02:43:03'),
(92, 1, 'admin/products', 'GET', '::1', '[]', '2025-08-06 02:43:03', '2025-08-06 02:43:03'),
(93, 1, 'admin/products', 'GET', '::1', '[]', '2025-08-06 02:43:03', '2025-08-06 02:43:03'),
(94, 1, 'admin/products', 'GET', '::1', '[]', '2025-08-06 02:43:04', '2025-08-06 02:43:04'),
(95, 1, 'admin/products', 'GET', '::1', '[]', '2025-08-06 02:43:04', '2025-08-06 02:43:04'),
(96, 1, 'admin/products', 'GET', '::1', '[]', '2025-08-06 02:43:04', '2025-08-06 02:43:04'),
(97, 1, 'admin/products', 'GET', '::1', '[]', '2025-08-06 02:43:05', '2025-08-06 02:43:05'),
(98, 1, 'admin/products', 'GET', '::1', '[]', '2025-08-06 02:43:27', '2025-08-06 02:43:27'),
(99, 1, 'admin/products/1/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2025-08-06 02:43:32', '2025-08-06 02:43:32'),
(100, 1, 'admin/products/1', 'PUT', '::1', '{\"name\":\"Laravel\\u5165\\u9580\",\"description\":\"Laravel\\u5165\\u9580\\u306e\\u672c\\u3067\\u3059\\u3002\",\"shipping_date\":null,\"price\":\"2000\",\"category_id\":\"5\",\"recommend_flag\":\"on\",\"carriage_flag\":\"on\",\"_token\":\"BwbSx62psbC8SOUBANnt5EePBz5v2GjLQZ7BX9cn\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/laravel-samuraimart\\/public\\/admin\\/products\"}', '2025-08-06 02:43:37', '2025-08-06 02:43:37'),
(101, 1, 'admin/products', 'GET', '::1', '[]', '2025-08-06 02:43:37', '2025-08-06 02:43:37'),
(102, 1, 'admin/products', 'GET', '::1', '[]', '2025-08-06 02:58:10', '2025-08-06 02:58:10'),
(103, 1, 'admin/users', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2025-08-06 03:23:33', '2025-08-06 03:23:33'),
(104, 1, 'admin/users/12/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2025-08-06 03:23:41', '2025-08-06 03:23:41'),
(105, 1, 'admin/categories', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2025-08-06 03:23:51', '2025-08-06 03:23:51'),
(106, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2025-08-06 05:51:13', '2025-08-06 05:51:13'),
(107, 1, 'admin/auth/menu', 'POST', '::1', '{\"parent_id\":\"0\",\"title\":\"\\u58f2\\u308a\\u4e0a\\u3052\",\"icon\":\"fa-bars\",\"uri\":\"shopping-carts\",\"roles\":[null],\"permission\":null,\"_token\":\"cFbQP2Fhtyh8g0VBt6QY1zd8m0rFmybd8kYdlI7f\"}', '2025-08-06 05:51:51', '2025-08-06 05:51:51'),
(108, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2025-08-06 05:51:51', '2025-08-06 05:51:51'),
(109, 1, 'admin/shopping-carts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2025-08-06 05:52:05', '2025-08-06 05:52:05'),
(110, 1, 'admin/shopping-carts', 'GET', '::1', '[]', '2025-08-06 06:11:11', '2025-08-06 06:11:11'),
(111, 1, 'admin/auth/menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2025-08-06 06:11:14', '2025-08-06 06:11:14'),
(112, 1, 'admin/products', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2025-08-06 06:11:20', '2025-08-06 06:11:20'),
(113, 1, 'admin/products/import', 'POST', '::1', '[]', '2025-08-06 06:11:39', '2025-08-06 06:11:39'),
(114, 1, 'admin/products/import', 'POST', '::1', '{\"file\":\"undefined\"}', '2025-08-06 06:13:29', '2025-08-06 06:13:29'),
(115, 1, 'admin/products/import', 'POST', '::1', '{\"file\":\"undefined\"}', '2025-08-06 06:13:29', '2025-08-06 06:13:29'),
(116, 1, 'admin/products/import', 'POST', '::1', '{\"file\":\"undefined\"}', '2025-08-06 06:13:29', '2025-08-06 06:13:29'),
(117, 1, 'admin/products/import', 'POST', '::1', '[]', '2025-08-06 06:16:12', '2025-08-06 06:16:12'),
(118, 1, 'admin/products/import', 'POST', '::1', '[]', '2025-08-06 06:16:12', '2025-08-06 06:16:12'),
(119, 1, 'admin/products/import', 'POST', '::1', '[]', '2025-08-06 06:16:12', '2025-08-06 06:16:12'),
(120, 1, 'admin/products/import', 'POST', '::1', '[]', '2025-08-06 06:16:12', '2025-08-06 06:16:12'),
(121, 1, 'admin/products', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2025-08-06 06:16:13', '2025-08-06 06:16:13'),
(122, 1, 'admin/products', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2025-08-06 06:16:13', '2025-08-06 06:16:13'),
(123, 1, 'admin/products', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2025-08-06 06:16:13', '2025-08-06 06:16:13'),
(124, 1, 'admin/products', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2025-08-06 06:16:13', '2025-08-06 06:16:13'),
(125, 1, 'admin/products', 'GET', '::1', '[]', '2025-08-06 06:16:26', '2025-08-06 06:16:26'),
(126, 1, 'admin/products', 'GET', '::1', '{\"page\":\"2\",\"_pjax\":\"#pjax-container\"}', '2025-08-06 06:16:42', '2025-08-06 06:16:42'),
(127, 1, 'admin/major-categories', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2025-08-06 08:05:01', '2025-08-06 08:05:01'),
(128, 1, 'admin/categories', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2025-08-06 08:05:06', '2025-08-06 08:05:06'),
(129, 1, 'admin', 'GET', '::1', '[]', '2025-08-06 11:56:32', '2025-08-06 11:56:32');

-- --------------------------------------------------------

--
-- テーブルの構造 `admin_permissions`
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
-- テーブルのデータのダンプ `admin_permissions`
--

INSERT INTO `admin_permissions` (`id`, `name`, `slug`, `http_method`, `http_path`, `created_at`, `updated_at`) VALUES
(1, 'All permission', '*', '', '*', NULL, NULL),
(2, 'Dashboard', 'dashboard', 'GET', '/', NULL, NULL),
(3, 'Login', 'auth.login', '', '/auth/login\r\n/auth/logout', NULL, NULL),
(4, 'User setting', 'auth.setting', 'GET,PUT', '/auth/setting', NULL, NULL),
(5, 'Auth management', 'auth.management', '', '/auth/roles\r\n/auth/permissions\r\n/auth/menu\r\n/auth/logs', NULL, NULL);

-- --------------------------------------------------------

--
-- テーブルの構造 `admin_roles`
--

CREATE TABLE `admin_roles` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `admin_roles`
--

INSERT INTO `admin_roles` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', 'administrator', '2025-08-04 13:02:41', '2025-08-04 13:02:41');

-- --------------------------------------------------------

--
-- テーブルの構造 `admin_role_menu`
--

CREATE TABLE `admin_role_menu` (
  `role_id` int NOT NULL,
  `menu_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `admin_role_menu`
--

INSERT INTO `admin_role_menu` (`role_id`, `menu_id`, `created_at`, `updated_at`) VALUES
(1, 2, NULL, NULL);

-- --------------------------------------------------------

--
-- テーブルの構造 `admin_role_permissions`
--

CREATE TABLE `admin_role_permissions` (
  `role_id` int NOT NULL,
  `permission_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `admin_role_permissions`
--

INSERT INTO `admin_role_permissions` (`role_id`, `permission_id`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- テーブルの構造 `admin_role_users`
--

CREATE TABLE `admin_role_users` (
  `role_id` int NOT NULL,
  `user_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `admin_role_users`
--

INSERT INTO `admin_role_users` (`role_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- テーブルの構造 `admin_users`
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
-- テーブルのデータのダンプ `admin_users`
--

INSERT INTO `admin_users` (`id`, `username`, `password`, `name`, `avatar`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', '$2y$10$Ux.IrMZM3vyjUB5ef5ImSuHFUn4Am7vcVM7Gex.L2zTNbq0ESMkeq', 'Administrator', NULL, 'PlxWjvd9u3JWaYzdT3cbsNMDmnflCMAErYXKDVRWZfJ33Vu9OvyyCbhWof81', '2025-08-04 13:02:41', '2025-08-04 13:02:41');

-- --------------------------------------------------------

--
-- テーブルの構造 `admin_user_permissions`
--

CREATE TABLE `admin_user_permissions` (
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- テーブルの構造 `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `major_category_id` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `created_at`, `updated_at`, `major_category_id`) VALUES
(1, 'ビジネス', 'ビジネス', '2025-06-30 13:01:01', '2025-08-04 23:16:23', 1),
(2, '文学・評論', '文学・評論', '2025-06-30 13:01:01', '2025-08-04 23:16:25', 1),
(3, '人文・思想', '人文・思想', '2025-06-30 13:01:01', '2025-08-04 23:16:28', 1),
(4, 'スポーツ', 'スポーツ', '2025-06-30 13:01:01', '2025-08-04 23:16:31', 1),
(5, 'コンピュータ・IT', 'コンピュータ・IT', '2025-06-30 13:01:01', '2025-08-04 23:16:34', 1),
(6, '資格・検定・就職', '資格・検定・就職', '2025-06-30 13:01:01', '2025-08-04 23:16:36', 1),
(7, '絵本・児童書', '絵本・児童書', '2025-06-30 13:01:01', '2025-08-04 23:16:40', 1),
(8, '写真集', '写真集', '2025-06-30 13:01:01', '2025-08-04 23:16:42', 1),
(9, 'ゲーム攻略本', 'ゲーム攻略本', '2025-06-30 13:01:01', '2025-08-04 23:16:45', 1),
(10, '雑誌', '雑誌', '2025-06-30 13:01:01', '2025-08-04 23:16:48', 1),
(11, 'アート・デザイン', 'アート・デザイン', '2025-06-30 13:01:01', '2025-08-04 23:16:51', 1),
(12, 'ノンフィクション', 'ノンフィクション', '2025-06-30 13:01:01', '2025-08-04 23:16:53', 1),
(13, 'ノートPC', 'ノートPC', '2025-06-30 13:01:01', '2025-08-04 23:17:00', 2),
(14, 'デスクトップPC', 'デスクトップPC', '2025-06-30 13:01:01', '2025-08-04 23:17:02', 2),
(15, 'タブレット', 'タブレット', '2025-06-30 13:01:01', '2025-08-04 23:17:04', 2),
(16, '19~20インチ', '19~20インチ', '2025-06-30 13:01:01', '2025-08-04 23:17:06', 3),
(17, 'デスクトップPC', 'デスクトップPC', '2025-06-30 13:01:01', '2025-08-04 23:17:09', 3),
(18, 'タブレット', 'タブレット', '2025-06-30 13:01:01', '2025-08-04 23:17:11', 3);

-- --------------------------------------------------------

--
-- テーブルの構造 `failed_jobs`
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
-- テーブルの構造 `major_categories`
--

CREATE TABLE `major_categories` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `major_categories`
--

INSERT INTO `major_categories` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, '本', '本', '2025-08-04 23:01:33', '2025-08-04 23:01:33'),
(2, 'コンピューター', 'コンピューター', '2025-08-04 23:01:33', '2025-08-04 23:01:33'),
(3, 'ディスプレイ', 'ディスプレイ', '2025-08-04 23:01:33', '2025-08-04 23:01:33');

-- --------------------------------------------------------

--
-- テーブルの構造 `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2025_06_30_213103_create_categories_table', 1),
(6, '2025_06_30_220222_create_products_table', 2),
(7, '2025_07_23_223628_create_product_images_table', 3),
(8, '2025_07_23_225700_add_shipping_date_to_products_table', 4),
(9, '2025_07_29_000936_create_reviews_table', 5),
(10, '2025_07_29_170638_add_title_to_reviews_table', 6),
(11, '2025_07_29_171626_create_product_user_table', 7),
(12, '2025_07_29_191107_add_columns_to_users', 8),
(13, '2018_12_23_120000_create_shoppingcart_table', 9),
(14, '2025_08_02_131537_add_buy_flag_to_shoppingcart', 10),
(15, '2025_08_02_143212_add_number_to_shoppingcart_table', 11),
(16, '2025_08_02_145545_add_number_column_to_shoppingcart_table', 12),
(17, '2025_08_03_204732_add_score_to_reviews', 13),
(18, '2016_01_04_173148_create_admin_tables', 14),
(19, '2025_08_04_221115_add_image_to_products', 15),
(20, '2025_08_05_075008_create_major_categories_table', 16),
(21, '2025_08_05_075708_add_major_category_to_categories', 17),
(22, '2025_08_05_080932_drop_column_categories_table', 18),
(23, '2025_08_06_000710_add_soft_delete_to_users', 19),
(24, '2025_08_06_105615_add_recommend_flag_to_products', 20),
(25, '2025_08_06_113658_add_carriage_flag_to_products', 21),
(26, '2025_08_06_125616_add_columns_to_shoppingcart', 22);

-- --------------------------------------------------------

--
-- テーブルの構造 `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- テーブルの構造 `personal_access_tokens`
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
-- テーブルの構造 `products`
--

CREATE TABLE `products` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '出荷日目安',
  `price` int UNSIGNED NOT NULL,
  `category_id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `recommend_flag` tinyint(1) NOT NULL DEFAULT '0',
  `carriage_flag` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `shipping_date`, `price`, `category_id`, `created_at`, `updated_at`, `image`, `recommend_flag`, `carriage_flag`) VALUES
(1, 'Laravel入門', 'Laravel入門の本です。', NULL, 2000, 5, '2025-06-30 13:37:09', '2025-08-06 02:43:37', '', 1, 1),
(2, '山口 浩', 'ぎ込こんでしまいました。それは、茶いろの少しぼろぼろの外套がいとうを着きて青年の腕うでにすがって不。', NULL, 110792, 1, '2025-07-23 13:26:01', '2025-07-23 13:26:01', '', 0, 0),
(3, '江古田 加奈', 'た。そしてほんとうにしずかでつめたい。僕ぼくもう行っちまうぞ。僕ぼくなんか鯨くじらだって見たことな。', NULL, 144184, 1, '2025-07-23 13:26:01', '2025-07-23 13:26:01', '', 0, 0),
(4, '鈴木 明美', '信号標しんごうひょうもついていて信号標しんごうひょうのあたりです、船が氷山ひょうざんの流ながれたあ。', NULL, 153628, 1, '2025-07-23 13:26:01', '2025-07-23 13:26:01', '', 0, 0),
(5, '田辺 亮介', 'んてんきがばたりばたりとまわり、きれで頭をしばったりラムプシェードをかけたりした人たちが、何か歌う。', NULL, 194863, 1, '2025-07-23 13:26:01', '2025-07-23 13:26:01', '', 0, 0),
(6, '浜田 和也', 'にまじってなんとも言いようない深ふかいつつましいためいきの音ばかりきこえました。「あ、孔雀くじゃく。', NULL, 78800, 1, '2025-07-23 13:26:01', '2025-07-23 13:26:01', '', 0, 0),
(7, '青山 明美', 'りんこうを出す、いちめん銀ぎんや貝殻かいがらでこさえたような二つのお宮みやってなんだい」「あたし前。', NULL, 158431, 1, '2025-07-23 13:26:01', '2025-07-23 13:26:01', '', 0, 0),
(8, '若松 晃', '白い巾きれでつつんだ荷物にもつを、二つに分けて肩かたに掛かけた、赤髯あかひげのせなかのかがんだ人で。', NULL, 22899, 1, '2025-07-23 13:26:01', '2025-07-23 13:26:01', '', 0, 0),
(9, '若松 くみ子', 'ながら訊ききました。そこから一羽わの鶴つるがふらふらと落おちて来て、また走り出したインデアンが白い。', NULL, 112037, 1, '2025-07-23 13:26:01', '2025-07-23 13:26:01', '', 0, 0),
(10, '高橋 裕美子', 'すか」「鷺さぎです」ジョバンニはその人の卓子テーブルの足もとから一つの小さな星に見えるのでした。（。', NULL, 105533, 1, '2025-07-23 13:26:01', '2025-07-23 13:26:01', '', 0, 0),
(11, '高橋 学', 'の桜さくらの木のところに来ていました。「蠍さそりの火は音なくあかるく燃もえたのです。息いきも切れず。', NULL, 26863, 1, '2025-07-23 13:26:01', '2025-07-23 13:26:01', '', 0, 0),
(12, '渚 智也', 'バンニはどうしてぼくがなんにもしないのにあんなことを言いうの」「うん、けれども親切そうな、大人おと。', NULL, 142611, 1, '2025-07-23 13:26:01', '2025-07-23 13:26:01', '', 0, 0),
(13, '鈴木 直子', 'かたちは天気輪てんきりんの柱はしらの下に来て、どかどかするからだを、つめたいそらの遠くから、すきと。', NULL, 138330, 1, '2025-07-23 13:26:01', '2025-07-23 13:26:01', '', 0, 0),
(14, '小泉 稔', 'りのついた着物きものを着きて、白い巾きれをかぶって寝やすんでいたのです。ジョバンニはそっちを見まし。', NULL, 116698, 1, '2025-07-23 13:26:01', '2025-07-23 13:26:01', '', 0, 0),
(15, '井上 英樹', 'んな水夫すいふたちが漕こいで、すばやく弓ゆみを空にひきました。よほどの人数で合唱がっしょうしている。', NULL, 195207, 1, '2025-07-23 13:26:01', '2025-07-23 13:26:01', '', 0, 0),
(16, '山口 裕太', '服くろふくの丈高たけたかい青年も誰だれもみんなやさしい夢ゆめを見ているのでした。そして両手りょうて。', NULL, 57023, 1, '2025-07-23 13:26:01', '2025-07-23 13:26:01', '', 0, 0),
(17, '笹田 京助', 'あるねえ、たくさんのたくさんの豆電燈まめでんとうが、うつくしい砂子すなごと白いすすきの波なみばかり。', NULL, 54837, 1, '2025-07-23 13:26:01', '2025-07-23 13:26:01', '', 0, 0),
(18, '杉山 結衣', 'まっていて、鷺さぎの三日月みかづきがたの白いつぶった眼めにさわりました。誰だれが投なげたかライフヴ。', NULL, 37457, 1, '2025-07-23 13:26:01', '2025-07-23 13:26:01', '', 0, 0),
(19, '近藤 春香', 'んにも見えず、ただ黒いびろうどばかりひかっていましたが、それも二、三度ど明るくなってそれに電柱でん。', NULL, 111398, 1, '2025-07-23 13:26:01', '2025-07-23 13:26:01', '', 0, 0),
(20, '加納 花子', 'いろな可愛かわいらしい女の子が、黒い外套がいとうを着きて青年の腕うでにすがって不思議ふしぎなものを。', NULL, 130178, 1, '2025-07-23 13:26:01', '2025-07-23 13:26:01', '', 0, 0),
(21, '中津川 直子', 'につれて、みんなはてんでに口笛くちぶえを吹ふいたり、「ケンタウル祭さいの夜ジョバンニはそっちを見あ。', NULL, 93679, 1, '2025-07-23 13:26:01', '2025-07-23 13:26:01', '', 0, 0),
(22, 'name1', 'description1', NULL, 1000, 1, '2025-08-06 06:16:12', '2025-08-06 06:16:12', 'img/dummy.png', 1, 0),
(23, 'name1', 'description1', NULL, 1000, 1, '2025-08-06 06:16:12', '2025-08-06 06:16:12', 'img/dummy.png', 1, 0),
(24, 'name1', 'description1', NULL, 1000, 1, '2025-08-06 06:16:12', '2025-08-06 06:16:12', 'img/dummy.png', 1, 0),
(25, 'name2', 'description2', NULL, 2000, 2, '2025-08-06 06:16:12', '2025-08-06 06:16:12', 'img/dummy.png', 0, 1),
(26, 'name2', 'description2', NULL, 2000, 2, '2025-08-06 06:16:12', '2025-08-06 06:16:12', 'img/dummy.png', 0, 1),
(27, 'name2', 'description2', NULL, 2000, 2, '2025-08-06 06:16:12', '2025-08-06 06:16:12', 'img/dummy.png', 0, 1),
(28, 'name1', 'description1', NULL, 1000, 1, '2025-08-06 06:16:12', '2025-08-06 06:16:12', 'img/dummy.png', 1, 0),
(29, 'name2', 'description2', NULL, 2000, 2, '2025-08-06 06:16:12', '2025-08-06 06:16:12', 'img/dummy.png', 0, 1);

-- --------------------------------------------------------

--
-- テーブルの構造 `product_images`
--

CREATE TABLE `product_images` (
  `id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `image_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort_order` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- テーブルの構造 `product_user`
--

CREATE TABLE `product_user` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- テーブルの構造 `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint UNSIGNED NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int NOT NULL,
  `user_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `score` int UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `reviews`
--

INSERT INTO `reviews` (`id`, `content`, `product_id`, `user_id`, `created_at`, `updated_at`, `title`, `score`) VALUES
(1, '最高です', 4, 10, '2025-07-29 08:15:12', '2025-07-29 08:15:12', 'こんにちは', 0),
(2, '1', 1, 10, '2025-08-03 11:56:39', '2025-08-03 11:56:39', '1', 3);

-- --------------------------------------------------------

--
-- テーブルの構造 `shoppingcart`
--

CREATE TABLE `shoppingcart` (
  `identifier` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `instance` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `buy_flag` tinyint(1) NOT NULL DEFAULT '0',
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `price_total` int UNSIGNED NOT NULL DEFAULT '0',
  `qty` int UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `shoppingcart`
--

INSERT INTO `shoppingcart` (`identifier`, `instance`, `content`, `number`, `created_at`, `updated_at`, `buy_flag`, `code`, `price_total`, `qty`) VALUES
('1', '10', 'O:29:\"Illuminate\\Support\\Collection\":2:{s:8:\"\0*\0items\";a:1:{s:32:\"027c91341fd5cf4d2579b49c4b6a90da\";O:32:\"Gloudemans\\Shoppingcart\\CartItem\":11:{s:5:\"rowId\";s:32:\"027c91341fd5cf4d2579b49c4b6a90da\";s:2:\"id\";s:1:\"1\";s:3:\"qty\";s:1:\"1\";s:4:\"name\";s:13:\"Laravel入門\";s:5:\"price\";d:2000;s:6:\"weight\";d:0;s:7:\"options\";O:39:\"Gloudemans\\Shoppingcart\\CartItemOptions\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:7:\"taxRate\";i:21;s:49:\"\0Gloudemans\\Shoppingcart\\CartItem\0associatedModel\";N;s:46:\"\0Gloudemans\\Shoppingcart\\CartItem\0discountRate\";i:0;s:8:\"instance\";s:2:\"10\";}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}', '6', '2025-08-02 05:23:32', '2025-08-02 05:23:32', 1, '', 0, 0),
('2', '10', 'O:29:\"Illuminate\\Support\\Collection\":2:{s:8:\"\0*\0items\";a:1:{s:32:\"027c91341fd5cf4d2579b49c4b6a90da\";O:32:\"Gloudemans\\Shoppingcart\\CartItem\":11:{s:5:\"rowId\";s:32:\"027c91341fd5cf4d2579b49c4b6a90da\";s:2:\"id\";s:1:\"1\";s:3:\"qty\";s:1:\"1\";s:4:\"name\";s:13:\"Laravel入門\";s:5:\"price\";d:2000;s:6:\"weight\";d:0;s:7:\"options\";O:39:\"Gloudemans\\Shoppingcart\\CartItemOptions\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:7:\"taxRate\";i:21;s:49:\"\0Gloudemans\\Shoppingcart\\CartItem\0associatedModel\";N;s:46:\"\0Gloudemans\\Shoppingcart\\CartItem\0discountRate\";i:0;s:8:\"instance\";s:2:\"10\";}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}', '6', '2025-08-02 05:29:37', '2025-08-02 05:29:37', 1, '', 0, 0),
('3', '10', 'O:29:\"Illuminate\\Support\\Collection\":2:{s:8:\"\0*\0items\";a:1:{s:32:\"027c91341fd5cf4d2579b49c4b6a90da\";O:32:\"Gloudemans\\Shoppingcart\\CartItem\":11:{s:5:\"rowId\";s:32:\"027c91341fd5cf4d2579b49c4b6a90da\";s:2:\"id\";s:1:\"1\";s:3:\"qty\";s:1:\"1\";s:4:\"name\";s:13:\"Laravel入門\";s:5:\"price\";d:2000;s:6:\"weight\";d:0;s:7:\"options\";O:39:\"Gloudemans\\Shoppingcart\\CartItemOptions\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:7:\"taxRate\";i:21;s:49:\"\0Gloudemans\\Shoppingcart\\CartItem\0associatedModel\";N;s:46:\"\0Gloudemans\\Shoppingcart\\CartItem\0discountRate\";i:0;s:8:\"instance\";s:2:\"10\";}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}', '6', '2025-08-02 05:36:39', '2025-08-02 05:36:39', 1, '', 0, 0),
('4', '10', 'O:29:\"Illuminate\\Support\\Collection\":2:{s:8:\"\0*\0items\";a:1:{s:32:\"027c91341fd5cf4d2579b49c4b6a90da\";O:32:\"Gloudemans\\Shoppingcart\\CartItem\":11:{s:5:\"rowId\";s:32:\"027c91341fd5cf4d2579b49c4b6a90da\";s:2:\"id\";s:1:\"1\";s:3:\"qty\";s:1:\"1\";s:4:\"name\";s:13:\"Laravel入門\";s:5:\"price\";d:2000;s:6:\"weight\";d:0;s:7:\"options\";O:39:\"Gloudemans\\Shoppingcart\\CartItemOptions\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:7:\"taxRate\";i:21;s:49:\"\0Gloudemans\\Shoppingcart\\CartItem\0associatedModel\";N;s:46:\"\0Gloudemans\\Shoppingcart\\CartItem\0discountRate\";i:0;s:8:\"instance\";s:2:\"10\";}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}', '6', '2025-08-02 05:42:28', '2025-08-02 05:42:28', 1, '', 0, 0),
('5', '10', 'O:29:\"Illuminate\\Support\\Collection\":2:{s:8:\"\0*\0items\";a:1:{s:32:\"027c91341fd5cf4d2579b49c4b6a90da\";O:32:\"Gloudemans\\Shoppingcart\\CartItem\":11:{s:5:\"rowId\";s:32:\"027c91341fd5cf4d2579b49c4b6a90da\";s:2:\"id\";s:1:\"1\";s:3:\"qty\";s:1:\"1\";s:4:\"name\";s:13:\"Laravel入門\";s:5:\"price\";d:2000;s:6:\"weight\";d:0;s:7:\"options\";O:39:\"Gloudemans\\Shoppingcart\\CartItemOptions\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:7:\"taxRate\";i:21;s:49:\"\0Gloudemans\\Shoppingcart\\CartItem\0associatedModel\";N;s:46:\"\0Gloudemans\\Shoppingcart\\CartItem\0discountRate\";i:0;s:8:\"instance\";s:2:\"10\";}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}', '6', '2025-08-02 05:51:56', '2025-08-02 05:51:56', 1, '', 0, 0),
('6', '10', 'O:29:\"Illuminate\\Support\\Collection\":2:{s:8:\"\0*\0items\";a:1:{s:32:\"027c91341fd5cf4d2579b49c4b6a90da\";O:32:\"Gloudemans\\Shoppingcart\\CartItem\":11:{s:5:\"rowId\";s:32:\"027c91341fd5cf4d2579b49c4b6a90da\";s:2:\"id\";s:1:\"1\";s:3:\"qty\";s:1:\"1\";s:4:\"name\";s:13:\"Laravel入門\";s:5:\"price\";d:2000;s:6:\"weight\";d:0;s:7:\"options\";O:39:\"Gloudemans\\Shoppingcart\\CartItemOptions\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:7:\"taxRate\";i:21;s:49:\"\0Gloudemans\\Shoppingcart\\CartItem\0associatedModel\";N;s:46:\"\0Gloudemans\\Shoppingcart\\CartItem\0discountRate\";i:0;s:8:\"instance\";s:2:\"10\";}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}', '6', '2025-08-02 05:57:01', '2025-08-02 05:57:01', 1, '', 0, 0),
('7', '10', 'O:29:\"Illuminate\\Support\\Collection\":2:{s:8:\"\0*\0items\";a:2:{s:32:\"027c91341fd5cf4d2579b49c4b6a90da\";O:32:\"Gloudemans\\Shoppingcart\\CartItem\":11:{s:5:\"rowId\";s:32:\"027c91341fd5cf4d2579b49c4b6a90da\";s:2:\"id\";s:1:\"1\";s:3:\"qty\";s:1:\"1\";s:4:\"name\";s:13:\"Laravel入門\";s:5:\"price\";d:2000;s:6:\"weight\";d:0;s:7:\"options\";O:39:\"Gloudemans\\Shoppingcart\\CartItemOptions\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:7:\"taxRate\";i:21;s:49:\"\0Gloudemans\\Shoppingcart\\CartItem\0associatedModel\";N;s:46:\"\0Gloudemans\\Shoppingcart\\CartItem\0discountRate\";i:0;s:8:\"instance\";s:2:\"10\";}s:32:\"370d08585360f5c568b18d1f2e4ca1df\";O:32:\"Gloudemans\\Shoppingcart\\CartItem\":11:{s:5:\"rowId\";s:32:\"370d08585360f5c568b18d1f2e4ca1df\";s:2:\"id\";s:1:\"2\";s:3:\"qty\";s:1:\"1\";s:4:\"name\";s:10:\"山口 浩\";s:5:\"price\";d:110792;s:6:\"weight\";d:0;s:7:\"options\";O:39:\"Gloudemans\\Shoppingcart\\CartItemOptions\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:7:\"taxRate\";i:21;s:49:\"\0Gloudemans\\Shoppingcart\\CartItem\0associatedModel\";N;s:46:\"\0Gloudemans\\Shoppingcart\\CartItem\0discountRate\";i:0;s:8:\"instance\";s:2:\"10\";}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}', '7', '2025-08-03 12:04:37', '2025-08-03 12:04:37', 1, '', 0, 0),
('8', '12', 'O:29:\"Illuminate\\Support\\Collection\":2:{s:8:\"\0*\0items\";a:1:{s:32:\"473bb1c884ca6123635e12589d2fd27e\";O:32:\"Gloudemans\\Shoppingcart\\CartItem\":11:{s:5:\"rowId\";s:32:\"473bb1c884ca6123635e12589d2fd27e\";s:2:\"id\";s:1:\"1\";s:3:\"qty\";i:2;s:4:\"name\";s:13:\"Laravel入門\";s:5:\"price\";d:2000;s:6:\"weight\";d:0;s:7:\"options\";O:39:\"Gloudemans\\Shoppingcart\\CartItemOptions\":2:{s:8:\"\0*\0items\";a:2:{s:5:\"image\";N;s:8:\"carriage\";s:1:\"1\";}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:7:\"taxRate\";i:21;s:49:\"\0Gloudemans\\Shoppingcart\\CartItem\0associatedModel\";N;s:46:\"\0Gloudemans\\Shoppingcart\\CartItem\0discountRate\";i:0;s:8:\"instance\";s:2:\"12\";}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}', '1', '2025-08-06 08:19:28', '2025-08-06 08:19:28', 1, '0ys2df143g', 4800, 2),
('9', '12', 'O:29:\"Illuminate\\Support\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}', '2', '2025-08-06 10:13:54', '2025-08-06 10:13:54', 1, 'fucvre0py7', 0, 0);

-- --------------------------------------------------------

--
-- テーブルの構造 `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `postal_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `postal_code`, `address`, `phone`, `deleted_at`) VALUES
(1, '侍　太郎', 'taro.samurai@example.com', NULL, '$2y$10$EOw40dRepzuHYE.PpsfJT.5JYk8aPY8jNJj2wMge.HKXbLrT9oXqm', NULL, '2025-07-05 13:16:35', '2025-07-05 13:16:35', '', '', '', NULL),
(12, '佐藤　光輝', 'foreverbrightness715@gmail.com', '2025-08-06 03:05:28', '$2y$10$v2hIGCG7sBPel6S/V8zwPuvgnzkifZKiO1bnqR2VqahagjD0xLZvW', 'CCQ5xFzidWEoNii8sw0aUBzkUI7PodoRr2rHwtn4E8hEqFBK5aSDw6AA3rUQ', '2025-08-06 03:04:14', '2025-08-06 03:05:28', '367-0061', '埼玉県本庄市小島5-1-18', '090-2907-7680', NULL);

--
-- ダンプしたテーブルのインデックス
--

--
-- テーブルのインデックス `admin_menu`
--
ALTER TABLE `admin_menu`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `admin_operation_log`
--
ALTER TABLE `admin_operation_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_operation_log_user_id_index` (`user_id`);

--
-- テーブルのインデックス `admin_permissions`
--
ALTER TABLE `admin_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_permissions_name_unique` (`name`),
  ADD UNIQUE KEY `admin_permissions_slug_unique` (`slug`);

--
-- テーブルのインデックス `admin_roles`
--
ALTER TABLE `admin_roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_roles_name_unique` (`name`),
  ADD UNIQUE KEY `admin_roles_slug_unique` (`slug`);

--
-- テーブルのインデックス `admin_role_menu`
--
ALTER TABLE `admin_role_menu`
  ADD KEY `admin_role_menu_role_id_menu_id_index` (`role_id`,`menu_id`);

--
-- テーブルのインデックス `admin_role_permissions`
--
ALTER TABLE `admin_role_permissions`
  ADD KEY `admin_role_permissions_role_id_permission_id_index` (`role_id`,`permission_id`);

--
-- テーブルのインデックス `admin_role_users`
--
ALTER TABLE `admin_role_users`
  ADD KEY `admin_role_users_role_id_user_id_index` (`role_id`,`user_id`);

--
-- テーブルのインデックス `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_users_username_unique` (`username`);

--
-- テーブルのインデックス `admin_user_permissions`
--
ALTER TABLE `admin_user_permissions`
  ADD KEY `admin_user_permissions_user_id_permission_id_index` (`user_id`,`permission_id`);

--
-- テーブルのインデックス `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- テーブルのインデックス `major_categories`
--
ALTER TABLE `major_categories`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`email`);

--
-- テーブルのインデックス `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- テーブルのインデックス `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_images_product_id_foreign` (`product_id`);

--
-- テーブルのインデックス `product_user`
--
ALTER TABLE `product_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_user_user_id_foreign` (`user_id`),
  ADD KEY `product_user_product_id_foreign` (`product_id`);

--
-- テーブルのインデックス `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `shoppingcart`
--
ALTER TABLE `shoppingcart`
  ADD PRIMARY KEY (`identifier`,`instance`);

--
-- テーブルのインデックス `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- ダンプしたテーブルの AUTO_INCREMENT
--

--
-- テーブルの AUTO_INCREMENT `admin_menu`
--
ALTER TABLE `admin_menu`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- テーブルの AUTO_INCREMENT `admin_operation_log`
--
ALTER TABLE `admin_operation_log`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=130;

--
-- テーブルの AUTO_INCREMENT `admin_permissions`
--
ALTER TABLE `admin_permissions`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- テーブルの AUTO_INCREMENT `admin_roles`
--
ALTER TABLE `admin_roles`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- テーブルの AUTO_INCREMENT `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- テーブルの AUTO_INCREMENT `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- テーブルの AUTO_INCREMENT `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- テーブルの AUTO_INCREMENT `major_categories`
--
ALTER TABLE `major_categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- テーブルの AUTO_INCREMENT `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- テーブルの AUTO_INCREMENT `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- テーブルの AUTO_INCREMENT `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- テーブルの AUTO_INCREMENT `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- テーブルの AUTO_INCREMENT `product_user`
--
ALTER TABLE `product_user`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- テーブルの AUTO_INCREMENT `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- テーブルの AUTO_INCREMENT `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- ダンプしたテーブルの制約
--

--
-- テーブルの制約 `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `product_images_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- テーブルの制約 `product_user`
--
ALTER TABLE `product_user`
  ADD CONSTRAINT `product_user_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
