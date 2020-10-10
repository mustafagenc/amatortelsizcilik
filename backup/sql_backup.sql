-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 09, 2020 at 01:52 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `amatortelsizcilik`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `order`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, NULL, 1, 'Category 1', 'category-1', '2020-10-08 01:04:27', '2020-10-08 01:04:27'),
(2, NULL, 1, 'Category 2', 'category-2', '2020-10-08 01:04:27', '2020-10-08 01:04:27');

-- --------------------------------------------------------

--
-- Table structure for table `data_rows`
--

CREATE TABLE `data_rows` (
  `id` int(10) UNSIGNED NOT NULL,
  `data_type_id` int(10) UNSIGNED NOT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `browse` tinyint(1) NOT NULL DEFAULT 1,
  `read` tinyint(1) NOT NULL DEFAULT 1,
  `edit` tinyint(1) NOT NULL DEFAULT 1,
  `add` tinyint(1) NOT NULL DEFAULT 1,
  `delete` tinyint(1) NOT NULL DEFAULT 1,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `data_rows`
--

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(2, 1, 'name', 'text', 'İsim', 1, 1, 1, 1, 1, 1, NULL, 2),
(3, 1, 'email', 'text', 'E-posta', 1, 1, 1, 1, 1, 1, NULL, 3),
(4, 1, 'password', 'password', 'Parola', 1, 0, 0, 1, 1, 0, NULL, 4),
(5, 1, 'remember_token', 'text', 'Token\'ı Hatırla', 0, 0, 0, 0, 0, 0, NULL, 5),
(6, 1, 'created_at', 'timestamp', 'Oluşturulma Zamanı', 0, 1, 1, 0, 0, 0, NULL, 6),
(7, 1, 'updated_at', 'timestamp', 'Güncelleme Zamanı', 0, 0, 0, 0, 0, 0, NULL, 7),
(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, NULL, 8),
(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Rol', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":0}', 10),
(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'Roles', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', 11),
(11, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, NULL, 12),
(12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(13, 2, 'name', 'text', 'İsim', 1, 1, 1, 1, 1, 1, NULL, 2),
(14, 2, 'created_at', 'timestamp', 'Oluşturulma Zamanı', 0, 0, 0, 0, 0, 0, NULL, 3),
(15, 2, 'updated_at', 'timestamp', 'Güncelleme Zamanı', 0, 0, 0, 0, 0, 0, NULL, 4),
(16, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(17, 3, 'name', 'text', 'İsim', 1, 1, 1, 1, 1, 1, NULL, 2),
(18, 3, 'created_at', 'timestamp', 'Oluşturulma Zamanı', 0, 0, 0, 0, 0, 0, NULL, 3),
(19, 3, 'updated_at', 'timestamp', 'Güncelleme Zamanı', 0, 0, 0, 0, 0, 0, NULL, 4),
(20, 3, 'display_name', 'text', 'Görünen İsim', 1, 1, 1, 1, 1, 1, NULL, 5),
(21, 1, 'role_id', 'text', 'Rol', 1, 1, 1, 1, 1, 1, NULL, 9),
(22, 4, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(23, 4, 'parent_id', 'select_dropdown', 'Üst', 0, 0, 1, 1, 1, 1, '{\"default\":\"\",\"null\":\"\",\"options\":{\"\":\"-- None --\"},\"relationship\":{\"key\":\"id\",\"label\":\"name\"}}', 2),
(24, 4, 'order', 'text', 'Sıra', 1, 1, 1, 1, 1, 1, '{\"default\":1}', 3),
(25, 4, 'name', 'text', 'İsim', 1, 1, 1, 1, 1, 1, NULL, 4),
(26, 4, 'slug', 'text', 'Kısa ad (URL)', 1, 1, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"name\"}}', 5),
(27, 4, 'created_at', 'timestamp', 'Oluşturulma Zamanı', 0, 0, 1, 0, 0, 0, NULL, 6),
(28, 4, 'updated_at', 'timestamp', 'Güncelleme Zamanı', 0, 0, 0, 0, 0, 0, NULL, 7),
(29, 5, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(30, 5, 'author_id', 'text', 'Yazar', 1, 0, 1, 1, 0, 1, NULL, 2),
(31, 5, 'category_id', 'text', 'Kategori', 1, 0, 1, 1, 1, 0, NULL, 3),
(32, 5, 'title', 'text', 'Başlık', 1, 1, 1, 1, 1, 1, NULL, 4),
(33, 5, 'excerpt', 'text_area', 'Özet', 1, 0, 1, 1, 1, 1, NULL, 5),
(34, 5, 'body', 'rich_text_box', 'Gövde', 1, 0, 1, 1, 1, 1, NULL, 6),
(35, 5, 'image', 'image', 'Yazı Görseli', 0, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"1000\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}', 7),
(36, 5, 'slug', 'text', 'Kısa ad (URL)', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:posts,slug\"}}', 8),
(37, 5, 'meta_description', 'text_area', 'Meta Açıklama', 1, 0, 1, 1, 1, 1, NULL, 9),
(38, 5, 'meta_keywords', 'text_area', 'Meta Anahtar Kelime', 1, 0, 1, 1, 1, 1, NULL, 10),
(39, 5, 'status', 'select_dropdown', 'Durum', 1, 1, 1, 1, 1, 1, '{\"default\":\"DRAFT\",\"options\":{\"PUBLISHED\":\"published\",\"DRAFT\":\"draft\",\"PENDING\":\"pending\"}}', 11),
(40, 5, 'created_at', 'timestamp', 'Oluşturulma Zamanı', 0, 1, 1, 0, 0, 0, NULL, 12),
(41, 5, 'updated_at', 'timestamp', 'Güncelleme Zamanı', 0, 0, 0, 0, 0, 0, NULL, 13),
(42, 5, 'seo_title', 'text', 'SEO Başlığı', 0, 1, 1, 1, 1, 1, NULL, 14),
(43, 5, 'featured', 'checkbox', 'Öne Çıkarılmış', 1, 1, 1, 1, 1, 1, NULL, 15),
(44, 6, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(45, 6, 'author_id', 'text', 'Yazar', 1, 0, 0, 0, 0, 0, NULL, 2),
(46, 6, 'title', 'text', 'Başlık', 1, 1, 1, 1, 1, 1, NULL, 3),
(47, 6, 'excerpt', 'text_area', 'Özet', 1, 0, 1, 1, 1, 1, NULL, 4),
(48, 6, 'body', 'rich_text_box', 'Gövde', 1, 0, 1, 1, 1, 1, NULL, 5),
(49, 6, 'slug', 'text', 'Kısa ad (URL)', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\"},\"validation\":{\"rule\":\"unique:pages,slug\"}}', 6),
(50, 6, 'meta_description', 'text', 'Meta Açıklama', 1, 0, 1, 1, 1, 1, NULL, 7),
(51, 6, 'meta_keywords', 'text', 'Meta Anahtar Kelime', 1, 0, 1, 1, 1, 1, NULL, 8),
(52, 6, 'status', 'select_dropdown', 'Durum', 1, 1, 1, 1, 1, 1, '{\"default\":\"INACTIVE\",\"options\":{\"INACTIVE\":\"INACTIVE\",\"ACTIVE\":\"ACTIVE\"}}', 9),
(53, 6, 'created_at', 'timestamp', 'Oluşturulma Zamanı', 1, 1, 1, 0, 0, 0, NULL, 10),
(54, 6, 'updated_at', 'timestamp', 'Güncelleme Zamanı', 1, 0, 0, 0, 0, 0, NULL, 11),
(55, 6, 'image', 'image', 'Sayfa Görseli', 0, 1, 1, 1, 1, 1, NULL, 12),
(60, 10, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(61, 10, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(62, 10, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 3),
(63, 10, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 4),
(64, 11, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(65, 11, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(66, 11, 'point', 'number', 'Point', 1, 1, 1, 1, 1, 1, '{}', 3),
(67, 11, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, '{}', 4),
(68, 11, 'updated_at', 'timestamp', 'Updated At', 0, 1, 1, 0, 0, 0, '{}', 5),
(69, 13, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(70, 13, 'is_active', 'checkbox', 'Is Active', 1, 1, 1, 1, 1, 1, '{\"checked\":true}', 6),
(71, 13, 'question', 'rich_text_box', 'Question', 1, 1, 1, 1, 1, 1, '{}', 7),
(72, 13, 'category_id', 'select_dropdown', 'Category', 1, 0, 0, 1, 1, 0, '{}', 2),
(73, 13, 'class_id', 'select_dropdown', 'Class', 1, 0, 0, 1, 1, 0, '{}', 3),
(74, 13, 'answer_1_true', 'checkbox', 'Answer 1 True', 1, 0, 1, 1, 1, 1, '{}', 8),
(75, 13, 'answer_1', 'rich_text_box', 'Answer 1', 1, 0, 1, 1, 1, 1, '{}', 9),
(76, 13, 'answer_2_true', 'checkbox', 'Answer 2 True', 1, 0, 1, 1, 1, 1, '{}', 10),
(77, 13, 'answer_2', 'rich_text_box', 'Answer 2', 1, 0, 1, 1, 1, 1, '{}', 11),
(78, 13, 'answer_3_true', 'checkbox', 'Answer 3 True', 1, 0, 1, 1, 1, 1, '{}', 12),
(79, 13, 'answer_3', 'rich_text_box', 'Answer 3', 1, 0, 1, 1, 1, 1, '{}', 13),
(80, 13, 'answer_4_true', 'checkbox', 'Answer 4 True', 1, 0, 1, 1, 1, 1, '{}', 14),
(81, 13, 'answer_4', 'rich_text_box', 'Answer 4', 1, 0, 1, 1, 1, 1, '{}', 15),
(82, 13, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 16),
(83, 13, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 17),
(84, 13, 'exam_question_belongsto_exam_category_relationship', 'relationship', 'Category', 0, 1, 1, 1, 1, 0, '{\"model\":\"App\\\\Models\\\\ExamCategory\",\"table\":\"exam_categories\",\"type\":\"belongsTo\",\"column\":\"category_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 4),
(85, 13, 'exam_question_belongsto_exam_class_relationship', 'relationship', 'Class', 0, 1, 1, 1, 1, 0, '{\"model\":\"App\\\\Models\\\\ExamClass\",\"table\":\"exam_classes\",\"type\":\"belongsTo\",\"column\":\"class_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 5);

-- --------------------------------------------------------

--
-- Table structure for table `data_types`
--

CREATE TABLE `data_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT 0,
  `server_side` tinyint(4) NOT NULL DEFAULT 0,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1, 'users', 'users', 'Kullanıcı', 'Kullanıcılar', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', '', 1, 0, NULL, '2020-10-08 01:04:26', '2020-10-08 01:04:26'),
(2, 'menus', 'menus', 'Menü', 'Menüler', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2020-10-08 01:04:26', '2020-10-08 01:04:26'),
(3, 'roles', 'roles', 'Rol', 'Roller', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, 'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController', '', 1, 0, NULL, '2020-10-08 01:04:26', '2020-10-08 01:04:26'),
(4, 'categories', 'categories', 'Kategori', 'Kategoriler', 'voyager-categories', 'TCG\\Voyager\\Models\\Category', NULL, '', '', 1, 0, NULL, '2020-10-08 01:04:27', '2020-10-08 01:04:27'),
(5, 'posts', 'posts', 'Yazı', 'Yazılar', 'voyager-news', 'TCG\\Voyager\\Models\\Post', 'TCG\\Voyager\\Policies\\PostPolicy', '', '', 1, 0, NULL, '2020-10-08 01:04:27', '2020-10-08 01:04:27'),
(6, 'pages', 'pages', 'Sayfa', 'Sayfalar', 'voyager-file-text', 'TCG\\Voyager\\Models\\Page', NULL, '', '', 1, 0, NULL, '2020-10-08 01:04:27', '2020-10-08 01:04:27'),
(10, 'exam_categories', 'exam-categories', 'Exam Category', 'Exam Categories', 'voyager-categories', 'App\\Models\\ExamCategory', NULL, NULL, NULL, 1, 0, '{\"order_column\":\"id\",\"order_display_column\":\"name\",\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-10-08 22:49:20', '2020-10-08 23:07:21'),
(11, 'exam_classes', 'exam-classes', 'Exam Class', 'Exam Classes', '&#xe024;', 'App\\Models\\ExamClass', NULL, NULL, NULL, 1, 0, '{\"order_column\":\"id\",\"order_display_column\":\"name\",\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-10-08 22:53:12', '2020-10-08 22:53:55'),
(13, 'exam_questions', 'exam-questions', 'Exam Question', 'Exam Questions', 'voyager-question', 'App\\Models\\ExamQuestion', NULL, NULL, NULL, 1, 0, '{\"order_column\":\"id\",\"order_display_column\":\"question\",\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-10-08 23:01:55', '2020-10-08 23:49:16');

-- --------------------------------------------------------

--
-- Table structure for table `exam_categories`
--

CREATE TABLE `exam_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exam_categories`
--

INSERT INTO `exam_categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'İşletme Soruları', '2020-10-08 23:10:00', '2020-10-08 23:10:38'),
(2, 'Teknik Sorular', '2020-10-08 23:10:45', '2020-10-08 23:10:45'),
(3, 'Ulusal ve Uluslararası Düzenleme Soruları', '2020-10-08 23:10:54', '2020-10-08 23:10:54'),
(4, 'Fonetik Alfabe', '2020-10-08 23:11:05', '2020-10-08 23:11:05');

-- --------------------------------------------------------

--
-- Table structure for table `exam_classes`
--

CREATE TABLE `exam_classes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `point` smallint(6) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exam_classes`
--

INSERT INTO `exam_classes` (`id`, `name`, `point`, `created_at`, `updated_at`) VALUES
(1, 'A/B', 65, '2020-10-08 23:10:07', '2020-10-08 23:10:07'),
(2, 'C', 65, '2020-10-08 23:10:15', '2020-10-08 23:10:15');

-- --------------------------------------------------------

--
-- Table structure for table `exam_questions`
--

CREATE TABLE `exam_questions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `question` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `answer_1_true` tinyint(1) NOT NULL,
  `answer_1` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer_2_true` tinyint(1) NOT NULL,
  `answer_2` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer_3_true` tinyint(1) NOT NULL,
  `answer_3` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer_4_true` tinyint(1) NOT NULL,
  `answer_4` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exam_questions`
--

INSERT INTO `exam_questions` (`id`, `is_active`, `question`, `category_id`, `class_id`, `answer_1_true`, `answer_1`, `answer_2_true`, `answer_2`, `answer_3_true`, `answer_3`, `answer_4_true`, `answer_4`, `created_at`, `updated_at`) VALUES
(1, 1, '<p>Greenwich‟te tarih 12 Haziran 2006 Salı ve saat 23:30 iken 25 derece doğu boylamında bir yerde tarih ve saat nedir?</p>', 1, 1, 0, '<p>12 Haziran 2006 Salı, saat 21:30&nbsp;</p>', 0, '<p>&nbsp;11 Haziran 2006 Salı, saat 20:30</p>', 1, '<p>13 Haziran 2006 &Ccedil;arĢamba, saat 01:10</p>', 0, '<p>12 Haziran 2006 Salı, saat 01:20</p>', '2020-10-08 23:49:00', '2020-10-08 23:49:31'),
(2, 1, '<p>RST raporunda okunabilirlik karĢı istasyona 5 olarak bildirildiğinde ne anlam ifade eder?</p>', 1, 1, 0, '<p>Kısmen okunuyor.&nbsp;</p>', 0, '<p>Zor okunuyor</p>', 1, '<p>M&uuml;kemmel okunuyor&nbsp;</p>', 0, '<p>Hi&ccedil;biri</p>', '2020-10-08 23:50:14', '2020-10-08 23:50:14');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2020-10-08 01:04:26', '2020-10-08 01:04:26');

-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, 'Yönetim Paneli', '', '_self', 'voyager-boat', NULL, NULL, 1, '2020-10-08 01:04:26', '2020-10-08 01:04:26', 'voyager.dashboard', NULL),
(2, 1, 'Medya', '', '_self', 'voyager-images', NULL, NULL, 5, '2020-10-08 01:04:26', '2020-10-08 23:11:34', 'voyager.media.index', NULL),
(3, 1, 'Kullanıcılar', '', '_self', 'voyager-person', NULL, NULL, 3, '2020-10-08 01:04:26', '2020-10-08 01:04:26', 'voyager.users.index', NULL),
(4, 1, 'Roller', '', '_self', 'voyager-lock', NULL, NULL, 2, '2020-10-08 01:04:26', '2020-10-08 01:04:26', 'voyager.roles.index', NULL),
(5, 1, 'Araçlar', '', '_self', 'voyager-tools', NULL, NULL, 9, '2020-10-08 01:04:26', '2020-10-08 23:11:28', NULL, NULL),
(6, 1, 'Menü Oluşturucu', '', '_self', 'voyager-list', NULL, 5, 1, '2020-10-08 01:04:26', '2020-10-08 23:08:51', 'voyager.menus.index', NULL),
(7, 1, 'Veritabanı', '', '_self', 'voyager-data', NULL, 5, 2, '2020-10-08 01:04:26', '2020-10-08 23:08:51', 'voyager.database.index', NULL),
(8, 1, 'Pusula', '', '_self', 'voyager-compass', NULL, 5, 3, '2020-10-08 01:04:26', '2020-10-08 23:08:51', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 4, '2020-10-08 01:04:26', '2020-10-08 23:08:51', 'voyager.bread.index', NULL),
(10, 1, 'Ayarlar', '', '_self', 'voyager-settings', NULL, NULL, 11, '2020-10-08 01:04:26', '2020-10-08 23:11:28', 'voyager.settings.index', NULL),
(11, 1, 'Kategoriler', '', '_self', 'voyager-categories', NULL, NULL, 7, '2020-10-08 01:04:27', '2020-10-08 23:08:51', 'voyager.categories.index', NULL),
(12, 1, 'Yazılar', '', '_self', 'voyager-news', NULL, NULL, 4, '2020-10-08 01:04:27', '2020-10-08 23:11:34', 'voyager.posts.index', NULL),
(13, 1, 'Sayfalar', '', '_self', 'voyager-file-text', NULL, NULL, 6, '2020-10-08 01:04:27', '2020-10-08 23:08:51', 'voyager.pages.index', NULL),
(14, 1, 'Hooks', '', '_self', 'voyager-hook', NULL, NULL, 10, '2020-10-08 01:04:28', '2020-10-08 23:11:28', 'voyager.hooks', NULL),
(16, 1, 'Exam Categories', '', '_self', 'voyager-categories', '#000000', 19, 2, '2020-10-08 22:49:20', '2020-10-08 23:12:30', 'voyager.exam-categories.index', 'null'),
(17, 1, 'Exam Classes', '', '_self', 'voyager-pie-chart', '#000000', 19, 3, '2020-10-08 22:53:12', '2020-10-08 23:12:58', 'voyager.exam-classes.index', 'null'),
(18, 1, 'Exam Questions', '', '_self', 'voyager-question', '#000000', 19, 1, '2020-10-08 23:01:55', '2020-10-08 23:12:09', 'voyager.exam-questions.index', 'null'),
(19, 1, 'Sınav', '#', '_self', 'voyager-question', '#000000', NULL, 8, '2020-10-08 23:09:21', '2020-10-08 23:11:28', NULL, '');

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
(3, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2020_10_08_001458_create_sessions_table', 1),
(7, '2016_01_01_000000_add_voyager_user_fields', 2),
(8, '2016_01_01_000000_create_data_types_table', 2),
(9, '2016_05_19_173453_create_menu_table', 2),
(10, '2016_10_21_190000_create_roles_table', 2),
(11, '2016_10_21_190000_create_settings_table', 2),
(12, '2016_11_30_135954_create_permission_table', 2),
(13, '2016_11_30_141208_create_permission_role_table', 2),
(14, '2016_12_26_201236_data_types__add__server_side', 2),
(15, '2017_01_13_000000_add_route_to_menu_items_table', 2),
(16, '2017_01_14_005015_create_translations_table', 2),
(17, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 2),
(18, '2017_03_06_000000_add_controller_to_data_types_table', 2),
(19, '2017_04_21_000000_add_order_to_data_rows_table', 2),
(20, '2017_07_05_210000_add_policyname_to_data_types_table', 2),
(21, '2017_08_05_000000_add_group_to_settings_table', 2),
(22, '2017_11_26_013050_add_user_role_relationship', 2),
(23, '2017_11_26_015000_create_user_roles_table', 2),
(24, '2018_03_11_000000_add_user_settings', 2),
(25, '2018_03_14_000000_add_details_to_data_types_table', 2),
(26, '2018_03_16_000000_make_settings_value_nullable', 2),
(27, '2016_01_01_000000_create_pages_table', 3),
(28, '2016_01_01_000000_create_posts_table', 3),
(29, '2016_02_15_204651_create_categories_table', 3),
(30, '2017_04_11_000000_alter_post_nullable_fields_table', 3),
(31, '2020_05_21_100000_create_teams_table', 4),
(32, '2020_05_21_200000_create_team_user_table', 4),
(40, '2020_10_09_013034_create_exam_categories_table', 5),
(41, '2020_10_09_013106_create_exam_classes_table', 5),
(42, '2020_10_09_013126_create_exam_questions_table', 5);

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `author_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `author_id`, `title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `created_at`, `updated_at`) VALUES
(1, 0, 'Hello World', 'Hang the jib grog grog blossom grapple dance the hempen jig gangway pressgang bilge rat to go on account lugger. Nelsons folly gabion line draught scallywag fire ship gaff fluke fathom case shot. Sea Legs bilge rat sloop matey gabion long clothes run a shot across the bow Gold Road cog league.', '<p>Hello World. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', 'pages/page1.jpg', 'hello-world', 'Yar Meta Description', 'Keyword1, Keyword2', 'ACTIVE', '2020-10-08 01:04:27', '2020-10-08 01:04:27');

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
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
(1, 'browse_admin', NULL, '2020-10-08 01:04:26', '2020-10-08 01:04:26'),
(2, 'browse_bread', NULL, '2020-10-08 01:04:26', '2020-10-08 01:04:26'),
(3, 'browse_database', NULL, '2020-10-08 01:04:26', '2020-10-08 01:04:26'),
(4, 'browse_media', NULL, '2020-10-08 01:04:26', '2020-10-08 01:04:26'),
(5, 'browse_compass', NULL, '2020-10-08 01:04:26', '2020-10-08 01:04:26'),
(6, 'browse_menus', 'menus', '2020-10-08 01:04:26', '2020-10-08 01:04:26'),
(7, 'read_menus', 'menus', '2020-10-08 01:04:26', '2020-10-08 01:04:26'),
(8, 'edit_menus', 'menus', '2020-10-08 01:04:26', '2020-10-08 01:04:26'),
(9, 'add_menus', 'menus', '2020-10-08 01:04:26', '2020-10-08 01:04:26'),
(10, 'delete_menus', 'menus', '2020-10-08 01:04:26', '2020-10-08 01:04:26'),
(11, 'browse_roles', 'roles', '2020-10-08 01:04:26', '2020-10-08 01:04:26'),
(12, 'read_roles', 'roles', '2020-10-08 01:04:26', '2020-10-08 01:04:26'),
(13, 'edit_roles', 'roles', '2020-10-08 01:04:26', '2020-10-08 01:04:26'),
(14, 'add_roles', 'roles', '2020-10-08 01:04:26', '2020-10-08 01:04:26'),
(15, 'delete_roles', 'roles', '2020-10-08 01:04:26', '2020-10-08 01:04:26'),
(16, 'browse_users', 'users', '2020-10-08 01:04:26', '2020-10-08 01:04:26'),
(17, 'read_users', 'users', '2020-10-08 01:04:26', '2020-10-08 01:04:26'),
(18, 'edit_users', 'users', '2020-10-08 01:04:26', '2020-10-08 01:04:26'),
(19, 'add_users', 'users', '2020-10-08 01:04:26', '2020-10-08 01:04:26'),
(20, 'delete_users', 'users', '2020-10-08 01:04:26', '2020-10-08 01:04:26'),
(21, 'browse_settings', 'settings', '2020-10-08 01:04:26', '2020-10-08 01:04:26'),
(22, 'read_settings', 'settings', '2020-10-08 01:04:26', '2020-10-08 01:04:26'),
(23, 'edit_settings', 'settings', '2020-10-08 01:04:26', '2020-10-08 01:04:26'),
(24, 'add_settings', 'settings', '2020-10-08 01:04:26', '2020-10-08 01:04:26'),
(25, 'delete_settings', 'settings', '2020-10-08 01:04:26', '2020-10-08 01:04:26'),
(26, 'browse_categories', 'categories', '2020-10-08 01:04:27', '2020-10-08 01:04:27'),
(27, 'read_categories', 'categories', '2020-10-08 01:04:27', '2020-10-08 01:04:27'),
(28, 'edit_categories', 'categories', '2020-10-08 01:04:27', '2020-10-08 01:04:27'),
(29, 'add_categories', 'categories', '2020-10-08 01:04:27', '2020-10-08 01:04:27'),
(30, 'delete_categories', 'categories', '2020-10-08 01:04:27', '2020-10-08 01:04:27'),
(31, 'browse_posts', 'posts', '2020-10-08 01:04:27', '2020-10-08 01:04:27'),
(32, 'read_posts', 'posts', '2020-10-08 01:04:27', '2020-10-08 01:04:27'),
(33, 'edit_posts', 'posts', '2020-10-08 01:04:27', '2020-10-08 01:04:27'),
(34, 'add_posts', 'posts', '2020-10-08 01:04:27', '2020-10-08 01:04:27'),
(35, 'delete_posts', 'posts', '2020-10-08 01:04:27', '2020-10-08 01:04:27'),
(36, 'browse_pages', 'pages', '2020-10-08 01:04:27', '2020-10-08 01:04:27'),
(37, 'read_pages', 'pages', '2020-10-08 01:04:27', '2020-10-08 01:04:27'),
(38, 'edit_pages', 'pages', '2020-10-08 01:04:27', '2020-10-08 01:04:27'),
(39, 'add_pages', 'pages', '2020-10-08 01:04:27', '2020-10-08 01:04:27'),
(40, 'delete_pages', 'pages', '2020-10-08 01:04:27', '2020-10-08 01:04:27'),
(41, 'browse_hooks', NULL, '2020-10-08 01:04:28', '2020-10-08 01:04:28'),
(47, 'browse_exam_categories', 'exam_categories', '2020-10-08 22:49:20', '2020-10-08 22:49:20'),
(48, 'read_exam_categories', 'exam_categories', '2020-10-08 22:49:20', '2020-10-08 22:49:20'),
(49, 'edit_exam_categories', 'exam_categories', '2020-10-08 22:49:20', '2020-10-08 22:49:20'),
(50, 'add_exam_categories', 'exam_categories', '2020-10-08 22:49:20', '2020-10-08 22:49:20'),
(51, 'delete_exam_categories', 'exam_categories', '2020-10-08 22:49:20', '2020-10-08 22:49:20'),
(52, 'browse_exam_classes', 'exam_classes', '2020-10-08 22:53:12', '2020-10-08 22:53:12'),
(53, 'read_exam_classes', 'exam_classes', '2020-10-08 22:53:12', '2020-10-08 22:53:12'),
(54, 'edit_exam_classes', 'exam_classes', '2020-10-08 22:53:12', '2020-10-08 22:53:12'),
(55, 'add_exam_classes', 'exam_classes', '2020-10-08 22:53:12', '2020-10-08 22:53:12'),
(56, 'delete_exam_classes', 'exam_classes', '2020-10-08 22:53:12', '2020-10-08 22:53:12'),
(57, 'browse_exam_questions', 'exam_questions', '2020-10-08 23:01:55', '2020-10-08 23:01:55'),
(58, 'read_exam_questions', 'exam_questions', '2020-10-08 23:01:55', '2020-10-08 23:01:55'),
(59, 'edit_exam_questions', 'exam_questions', '2020-10-08 23:01:55', '2020-10-08 23:01:55'),
(60, 'add_exam_questions', 'exam_questions', '2020-10-08 23:01:55', '2020-10-08 23:01:55'),
(61, 'delete_exam_questions', 'exam_questions', '2020-10-08 23:01:55', '2020-10-08 23:01:55');

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(53, 1),
(54, 1),
(55, 1),
(56, 1),
(57, 1),
(58, 1),
(59, 1),
(60, 1),
(61, 1);

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `author_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('PUBLISHED','DRAFT','PENDING') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `author_id`, `category_id`, `title`, `seo_title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `featured`, `created_at`, `updated_at`) VALUES
(1, 0, NULL, 'Lorem Ipsum Post', NULL, 'This is the excerpt for the Lorem Ipsum Post', '<p>This is the body of the lorem ipsum post</p>', 'posts/post1.jpg', 'lorem-ipsum-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2020-10-08 01:04:27', '2020-10-08 01:04:27'),
(2, 0, NULL, 'My Sample Post', NULL, 'This is the excerpt for the sample Post', '<p>This is the body for the sample post, which includes the body.</p>\r\n                <h2>We can use all kinds of format!</h2>\r\n                <p>And include a bunch of other stuff.</p>', 'posts/post2.jpg', 'my-sample-post', 'Meta Description for sample post', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2020-10-08 01:04:27', '2020-10-08 01:04:27'),
(3, 0, NULL, 'Latest Post', NULL, 'This is the excerpt for the latest post', '<p>This is the body for the latest post</p>', 'posts/post3.jpg', 'latest-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2020-10-08 01:04:27', '2020-10-08 01:04:27'),
(4, 0, NULL, 'Yarr Post', NULL, 'Reef sails nipperkin bring a spring upon her cable coffer jury mast spike marooned Pieces of Eight poop deck pillage. Clipper driver coxswain galleon hempen halter come about pressgang gangplank boatswain swing the lead. Nipperkin yard skysail swab lanyard Blimey bilge water ho quarter Buccaneer.', '<p>Swab deadlights Buccaneer fire ship square-rigged dance the hempen jig weigh anchor cackle fruit grog furl. Crack Jennys tea cup chase guns pressgang hearties spirits hogshead Gold Road six pounders fathom measured fer yer chains. Main sheet provost come about trysail barkadeer crimp scuttle mizzenmast brig plunder.</p>\r\n<p>Mizzen league keelhaul galleon tender cog chase Barbary Coast doubloon crack Jennys tea cup. Blow the man down lugsail fire ship pinnace cackle fruit line warp Admiral of the Black strike colors doubloon. Tackle Jack Ketch come about crimp rum draft scuppers run a shot across the bow haul wind maroon.</p>\r\n<p>Interloper heave down list driver pressgang holystone scuppers tackle scallywag bilged on her anchor. Jack Tar interloper draught grapple mizzenmast hulk knave cable transom hogshead. Gaff pillage to go on account grog aft chase guns piracy yardarm knave clap of thunder.</p>', 'posts/post4.jpg', 'yarr-post', 'this be a meta descript', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2020-10-08 01:04:27', '2020-10-08 01:04:27');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Yönetici', '2020-10-08 01:04:26', '2020-10-08 01:04:26'),
(2, 'user', 'Normal Kullanıcı', '2020-10-08 01:04:26', '2020-10-08 01:04:26');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('2FfM0wNUjlzedh5ffT0G9TAahz2U0OxaNYFT1Vl0', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.75 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiN0ZqTU8zSnpuUHFHdEhrZ3kzcllPTlA5cnZ3MHFHMlp1ck1CV3FlVCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6MzoidXJsIjthOjA6e31zOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEwJGJoMFVTcjBSbWZsbGh1d09SZkV5WC5ldTJuNlg0TFJlOERKemJvdXZocG9uUVhCNWpvd3ltIjtzOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO30=', 1602201043),
('8qpIWZfJlCGlpbEOxFLxEqr5khghASaREF4h6uk8', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.75 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidERFRDE5bWZUNTVyR3loeUQ4azdNTzJQeEhWMExLc0gxWmJKM0tMZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MC9hbWF0b3J0ZWxzaXpjaWxpay9wdWJsaWMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1602195121),
('HJ59qchtgdLy1sRifuRVqnswWvbuGwcLJetkaqPq', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.75 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWFFXUDVrWGJ6V3BIM21nSDE2UnBrV1UxZ0hOenU3enlraGFNakdMMyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MC9hbWF0b3J0ZWxzaXpjaWxpay9wdWJsaWMiO319', 1602201107),
('V3FS0IXMsB1nLWlhVjuHizEwHX6CoJklB6omrfIj', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.75 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiTGdtMlYwUnB1bVprQ2lycnlQQnBmdkJLVUthM2ZwVHR4U09TUVFBSCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hZG1pbiI7fXM6MzoidXJsIjthOjA6e31zOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEwJGJoMFVTcjBSbWZsbGh1d09SZkV5WC5ldTJuNlg0TFJlOERKemJvdXZocG9uUVhCNWpvd3ltIjtzOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO30=', 1602195605);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1, 'site.title', 'Site Başlığı', 'Amatör Telsizcilik', '', 'text', 1, 'Site'),
(2, 'site.description', 'Site Açıklaması', 'Amatör telsizcilik sizinle aynı tür ilgi alanları olan Dünyanın bir başka yerindeki milyonlarca amatörden biri ile bağlantı kurmanızı sağlayacak sosyal bir hobidir.', '', 'text', 2, 'Site'),
(3, 'site.logo', 'Site Logosu', '', '', 'image', 3, 'Site'),
(4, 'site.google_analytics_tracking_id', 'Google Analytics Takip Kimliği (Tracking ID)', 'UA-111481679-16', '', 'text', 4, 'Site'),
(5, 'admin.bg_image', 'Yönetim Paneli Arkaplan Görseli', '', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Yönetim Paneli Başlığı', 'Yönetici Paneli', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Yönetim Paneli Açıklaması', 'Yönetim Paneli', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Yönetim Paneli Yükleniyor İkonu', '', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Yönetim Paneli İkon Görseli', '', '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics İstemci Kimliği (Client ID) (Yönetim Paneli için kullanılacak)', NULL, '', 'text', 1, 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

CREATE TABLE `teams` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_team` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `team_user`
--

CREATE TABLE `team_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `team_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

CREATE TABLE `translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) UNSIGNED NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `translations`
--

INSERT INTO `translations` (`id`, `table_name`, `column_name`, `foreign_key`, `locale`, `value`, `created_at`, `updated_at`) VALUES
(1, 'data_types', 'display_name_singular', 5, 'pt', 'Post', '2020-10-08 01:04:27', '2020-10-08 01:04:27'),
(2, 'data_types', 'display_name_singular', 6, 'pt', 'Página', '2020-10-08 01:04:27', '2020-10-08 01:04:27'),
(3, 'data_types', 'display_name_singular', 1, 'pt', 'Utilizador', '2020-10-08 01:04:27', '2020-10-08 01:04:27'),
(4, 'data_types', 'display_name_singular', 4, 'pt', 'Categoria', '2020-10-08 01:04:27', '2020-10-08 01:04:27'),
(5, 'data_types', 'display_name_singular', 2, 'pt', 'Menu', '2020-10-08 01:04:27', '2020-10-08 01:04:27'),
(6, 'data_types', 'display_name_singular', 3, 'pt', 'Função', '2020-10-08 01:04:27', '2020-10-08 01:04:27'),
(7, 'data_types', 'display_name_plural', 5, 'pt', 'Posts', '2020-10-08 01:04:27', '2020-10-08 01:04:27'),
(8, 'data_types', 'display_name_plural', 6, 'pt', 'Páginas', '2020-10-08 01:04:27', '2020-10-08 01:04:27'),
(9, 'data_types', 'display_name_plural', 1, 'pt', 'Utilizadores', '2020-10-08 01:04:27', '2020-10-08 01:04:27'),
(10, 'data_types', 'display_name_plural', 4, 'pt', 'Categorias', '2020-10-08 01:04:27', '2020-10-08 01:04:27'),
(11, 'data_types', 'display_name_plural', 2, 'pt', 'Menus', '2020-10-08 01:04:27', '2020-10-08 01:04:27'),
(12, 'data_types', 'display_name_plural', 3, 'pt', 'Funções', '2020-10-08 01:04:27', '2020-10-08 01:04:27'),
(13, 'categories', 'slug', 1, 'pt', 'categoria-1', '2020-10-08 01:04:27', '2020-10-08 01:04:27'),
(14, 'categories', 'name', 1, 'pt', 'Categoria 1', '2020-10-08 01:04:27', '2020-10-08 01:04:27'),
(15, 'categories', 'slug', 2, 'pt', 'categoria-2', '2020-10-08 01:04:27', '2020-10-08 01:04:27'),
(16, 'categories', 'name', 2, 'pt', 'Categoria 2', '2020-10-08 01:04:27', '2020-10-08 01:04:27'),
(17, 'pages', 'title', 1, 'pt', 'Olá Mundo', '2020-10-08 01:04:27', '2020-10-08 01:04:27'),
(18, 'pages', 'slug', 1, 'pt', 'ola-mundo', '2020-10-08 01:04:27', '2020-10-08 01:04:27'),
(19, 'pages', 'body', 1, 'pt', '<p>Olá Mundo. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', '2020-10-08 01:04:27', '2020-10-08 01:04:27'),
(20, 'menu_items', 'title', 1, 'pt', 'Painel de Controle', '2020-10-08 01:04:27', '2020-10-08 01:04:27'),
(21, 'menu_items', 'title', 2, 'pt', 'Media', '2020-10-08 01:04:27', '2020-10-08 01:04:27'),
(22, 'menu_items', 'title', 12, 'pt', 'Publicações', '2020-10-08 01:04:27', '2020-10-08 01:04:27'),
(23, 'menu_items', 'title', 3, 'pt', 'Utilizadores', '2020-10-08 01:04:27', '2020-10-08 01:04:27'),
(24, 'menu_items', 'title', 11, 'pt', 'Categorias', '2020-10-08 01:04:27', '2020-10-08 01:04:27'),
(25, 'menu_items', 'title', 13, 'pt', 'Páginas', '2020-10-08 01:04:27', '2020-10-08 01:04:27'),
(26, 'menu_items', 'title', 4, 'pt', 'Funções', '2020-10-08 01:04:27', '2020-10-08 01:04:27'),
(27, 'menu_items', 'title', 5, 'pt', 'Ferramentas', '2020-10-08 01:04:27', '2020-10-08 01:04:27'),
(28, 'menu_items', 'title', 6, 'pt', 'Menus', '2020-10-08 01:04:27', '2020-10-08 01:04:27'),
(29, 'menu_items', 'title', 7, 'pt', 'Base de dados', '2020-10-08 01:04:27', '2020-10-08 01:04:27'),
(30, 'menu_items', 'title', 10, 'pt', 'Configurações', '2020-10-08 01:04:27', '2020-10-08 01:04:27'),
(31, 'data_rows', 'display_name', 64, 'tr', 'Id', '2020-10-08 22:53:55', '2020-10-08 22:53:55'),
(32, 'data_rows', 'display_name', 65, 'tr', 'Name', '2020-10-08 22:53:55', '2020-10-08 22:53:55'),
(33, 'data_rows', 'display_name', 66, 'tr', 'Point', '2020-10-08 22:53:55', '2020-10-08 22:53:55'),
(34, 'data_rows', 'display_name', 67, 'tr', 'Created At', '2020-10-08 22:53:55', '2020-10-08 22:53:55'),
(35, 'data_rows', 'display_name', 68, 'tr', 'Updated At', '2020-10-08 22:53:55', '2020-10-08 22:53:55'),
(36, 'data_types', 'display_name_singular', 11, 'tr', 'Exam Class', '2020-10-08 22:53:55', '2020-10-08 22:53:55'),
(37, 'data_types', 'display_name_plural', 11, 'tr', 'Exam Classes', '2020-10-08 22:53:55', '2020-10-08 22:53:55'),
(38, 'data_rows', 'display_name', 69, 'tr', 'Id', '2020-10-08 23:02:56', '2020-10-08 23:02:56'),
(39, 'data_rows', 'display_name', 70, 'tr', 'Is Active', '2020-10-08 23:02:56', '2020-10-08 23:02:56'),
(40, 'data_rows', 'display_name', 71, 'tr', 'Question', '2020-10-08 23:02:56', '2020-10-08 23:02:56'),
(41, 'data_rows', 'display_name', 72, 'tr', 'Category Id', '2020-10-08 23:02:56', '2020-10-08 23:02:56'),
(42, 'data_rows', 'display_name', 73, 'tr', 'Class Id', '2020-10-08 23:02:56', '2020-10-08 23:02:56'),
(43, 'data_rows', 'display_name', 74, 'tr', 'Answer 1 True', '2020-10-08 23:02:56', '2020-10-08 23:02:56'),
(44, 'data_rows', 'display_name', 75, 'tr', 'Answer 1', '2020-10-08 23:02:56', '2020-10-08 23:02:56'),
(45, 'data_rows', 'display_name', 76, 'tr', 'Answer 2 True', '2020-10-08 23:02:56', '2020-10-08 23:02:56'),
(46, 'data_rows', 'display_name', 77, 'tr', 'Answer 2', '2020-10-08 23:02:56', '2020-10-08 23:02:56'),
(47, 'data_rows', 'display_name', 78, 'tr', 'Answer 3 True', '2020-10-08 23:02:56', '2020-10-08 23:02:56'),
(48, 'data_rows', 'display_name', 79, 'tr', 'Answer 3', '2020-10-08 23:02:56', '2020-10-08 23:02:56'),
(49, 'data_rows', 'display_name', 80, 'tr', 'Answer 4 True', '2020-10-08 23:02:56', '2020-10-08 23:02:56'),
(50, 'data_rows', 'display_name', 81, 'tr', 'Answer 4', '2020-10-08 23:02:56', '2020-10-08 23:02:56'),
(51, 'data_rows', 'display_name', 82, 'tr', 'Created At', '2020-10-08 23:02:56', '2020-10-08 23:02:56'),
(52, 'data_rows', 'display_name', 83, 'tr', 'Updated At', '2020-10-08 23:02:56', '2020-10-08 23:02:56'),
(53, 'data_types', 'display_name_singular', 13, 'tr', 'Exam Question', '2020-10-08 23:02:56', '2020-10-08 23:02:56'),
(54, 'data_types', 'display_name_plural', 13, 'tr', 'Exam Questions', '2020-10-08 23:02:56', '2020-10-08 23:02:56'),
(55, 'data_rows', 'display_name', 60, 'tr', 'Id', '2020-10-08 23:07:21', '2020-10-08 23:07:21'),
(56, 'data_rows', 'display_name', 61, 'tr', 'Name', '2020-10-08 23:07:21', '2020-10-08 23:07:21'),
(57, 'data_rows', 'display_name', 62, 'tr', 'Created At', '2020-10-08 23:07:21', '2020-10-08 23:07:21'),
(58, 'data_rows', 'display_name', 63, 'tr', 'Updated At', '2020-10-08 23:07:21', '2020-10-08 23:07:21'),
(59, 'data_types', 'display_name_singular', 10, 'tr', 'Exam Category', '2020-10-08 23:07:21', '2020-10-08 23:07:21'),
(60, 'data_types', 'display_name_plural', 10, 'tr', 'Exam Categories', '2020-10-08 23:07:21', '2020-10-08 23:07:21'),
(61, 'menu_items', 'title', 18, 'tr', 'Exam Questions', '2020-10-08 23:12:09', '2020-10-08 23:12:09'),
(62, 'menu_items', 'title', 16, 'tr', 'Exam Categories', '2020-10-08 23:12:30', '2020-10-08 23:12:30'),
(63, 'menu_items', 'title', 17, 'tr', 'Exam Classes', '2020-10-08 23:12:58', '2020-10-08 23:12:58'),
(64, 'data_rows', 'display_name', 84, 'tr', 'exam_categories', '2020-10-08 23:37:36', '2020-10-08 23:37:36'),
(65, 'data_rows', 'display_name', 85, 'tr', 'exam_classes', '2020-10-08 23:39:50', '2020-10-08 23:39:50');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `profile_photo_path` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `data_rows`
--
ALTER TABLE `data_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_rows_data_type_id_foreign` (`data_type_id`);

--
-- Indexes for table `data_types`
--
ALTER TABLE `data_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `data_types_name_unique` (`name`),
  ADD UNIQUE KEY `data_types_slug_unique` (`slug`);

--
-- Indexes for table `exam_categories`
--
ALTER TABLE `exam_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exam_classes`
--
ALTER TABLE `exam_classes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exam_questions`
--
ALTER TABLE `exam_questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_name_unique` (`name`);

--
-- Indexes for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_menu_id_foreign` (`menu_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_slug_unique` (`slug`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_key_index` (`key`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_permission_id_index` (`permission_id`),
  ADD KEY `permission_role_role_id_index` (`role_id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Indexes for table `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`id`),
  ADD KEY `teams_user_id_index` (`user_id`);

--
-- Indexes for table `team_user`
--
ALTER TABLE `team_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `team_user_team_id_user_id_unique` (`team_id`,`user_id`);

--
-- Indexes for table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `user_roles_user_id_index` (`user_id`),
  ADD KEY `user_roles_role_id_index` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT for table `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `exam_categories`
--
ALTER TABLE `exam_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `exam_classes`
--
ALTER TABLE `exam_classes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `exam_questions`
--
ALTER TABLE `exam_questions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `teams`
--
ALTER TABLE `teams`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `team_user`
--
ALTER TABLE `team_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Constraints for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
