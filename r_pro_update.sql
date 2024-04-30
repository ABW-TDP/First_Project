-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 30, 2024 at 05:48 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `r_pro_update`
--

-- --------------------------------------------------------

--
-- Table structure for table `asystem_checks`
--

CREATE TABLE `asystem_checks` (
  `asystem_id` bigint(20) UNSIGNED NOT NULL,
  `description` varchar(50) NOT NULL,
  `text_to_check` varchar(150) NOT NULL,
  `location_id` int(11) NOT NULL,
  `is_updated` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `city_id` bigint(20) UNSIGNED NOT NULL,
  `city_name` varchar(50) NOT NULL,
  `is_discontinued` tinyint(1) NOT NULL,
  `is_updated` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `company_infos`
--

CREATE TABLE `company_infos` (
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `company_name_1` varchar(150) NOT NULL,
  `company_name_2` varchar(150) DEFAULT NULL,
  `address_1` varchar(150) DEFAULT NULL,
  `address_2` varchar(150) DEFAULT NULL,
  `phone_number_1` varchar(50) DEFAULT NULL,
  `phone_number_2` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `website` varchar(50) DEFAULT NULL,
  `company_logo` varchar(255) DEFAULT NULL,
  `location_id` int(11) NOT NULL,
  `is_updated` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `coupon_id` bigint(20) UNSIGNED NOT NULL,
  `coupon_code` varchar(50) NOT NULL,
  `coupon_name` varchar(50) NOT NULL,
  `discount_type` varchar(50) NOT NULL,
  `amount_discount` decimal(8,2) NOT NULL,
  `percent_discount` decimal(8,2) NOT NULL,
  `min_order_amount` decimal(8,2) DEFAULT NULL,
  `expire_date` datetime DEFAULT NULL,
  `is_used` tinyint(1) NOT NULL,
  `is_discontinued` tinyint(1) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `location_id` int(11) NOT NULL,
  `is_updated` tinyint(1) NOT NULL,
  `modified_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `currency_id` bigint(20) UNSIGNED NOT NULL,
  `currency_code` varchar(20) NOT NULL,
  `currency_name_1` varchar(20) NOT NULL,
  `currency_name_2` varchar(20) DEFAULT NULL,
  `exchange_rate` decimal(8,2) NOT NULL,
  `is_base_currency` tinyint(1) DEFAULT NULL,
  `is_discontinued` tinyint(1) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `sort_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  `is_updated` tinyint(1) NOT NULL,
  `modified_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `currency_exchange_histories`
--

CREATE TABLE `currency_exchange_histories` (
  `currency_exchange_history_id` bigint(20) UNSIGNED NOT NULL,
  `history_date` datetime NOT NULL,
  `currency_id` int(11) NOT NULL,
  `exchange_rate` decimal(8,2) NOT NULL,
  `location_id` int(11) NOT NULL,
  `is_updated` tinyint(1) NOT NULL,
  `modified_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `customer_name` varchar(50) NOT NULL,
  `other_name` varchar(50) DEFAULT NULL,
  `customer_code` varchar(50) DEFAULT NULL,
  `customer_type_id` int(11) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `date_of_birth` datetime DEFAULT NULL,
  `phone_number` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `city_id` int(11) NOT NULL,
  `township_id` int(11) NOT NULL,
  `address` varchar(250) DEFAULT NULL,
  `remark` varchar(250) DEFAULT NULL,
  `location_id` int(11) NOT NULL,
  `is_discontinued` tinyint(1) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT NULL,
  `is_updated` tinyint(1) DEFAULT NULL,
  `modified_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer_ledgers`
--

CREATE TABLE `customer_ledgers` (
  `customer_ledger_id` bigint(20) UNSIGNED NOT NULL,
  `receive_date` datetime NOT NULL,
  `sale_id` int(11) DEFAULT NULL,
  `table_id` int(11) DEFAULT NULL,
  `outstanding_batch_number` int(11) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `exchange_rate` decimal(8,2) NOT NULL,
  `table_total_amount` decimal(8,2) NOT NULL,
  `total_amount` decimal(8,2) NOT NULL,
  `transport_charges` decimal(8,2) NOT NULL,
  `service_charges` decimal(8,2) NOT NULL,
  `tax` decimal(8,2) NOT NULL,
  `total_discount` decimal(8,2) NOT NULL,
  `member_card_discount` decimal(8,2) NOT NULL,
  `coupon_discount` decimal(8,2) NOT NULL,
  `receive_amount_from_prepaid_card` decimal(8,2) NOT NULL,
  `recieve_amount` decimal(8,2) NOT NULL,
  `transaction_type` varchar(20) NOT NULL,
  `remark` varchar(250) DEFAULT NULL,
  `location_id` int(11) NOT NULL,
  `is_updated` tinyint(1) NOT NULL,
  `is_deleted` varchar(255) DEFAULT NULL,
  `modified_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer_types`
--

CREATE TABLE `customer_types` (
  `customer_type_id` bigint(20) UNSIGNED NOT NULL,
  `customer_type_name` varchar(50) NOT NULL,
  `other_name` varchar(150) DEFAULT NULL,
  `customer_type_code` varchar(50) NOT NULL,
  `is_discontinued` tinyint(1) NOT NULL,
  `is_updated` tinyint(1) NOT NULL,
  `modified_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deliveries`
--

CREATE TABLE `deliveries` (
  `delivery_id` bigint(20) UNSIGNED NOT NULL,
  `company_name` varchar(50) NOT NULL,
  `phone_number` varchar(50) NOT NULL,
  `city_id` int(11) NOT NULL,
  `township_id` int(11) NOT NULL,
  `address` varchar(100) NOT NULL,
  `remark` varchar(200) DEFAULT NULL,
  `is_discontinued` tinyint(1) DEFAULT NULL,
  `modified_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `employee_id` bigint(20) UNSIGNED NOT NULL,
  `employee_name` varchar(50) NOT NULL,
  `other_name` varchar(50) DEFAULT NULL,
  `employee_code` varchar(50) NOT NULL,
  `employee_position_id` int(11) NOT NULL,
  `is_terminate` tinyint(1) NOT NULL,
  `location_id` int(11) NOT NULL,
  `is_updated` tinyint(1) NOT NULL,
  `modified_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee_positions`
--

CREATE TABLE `employee_positions` (
  `employee_position_id` bigint(20) UNSIGNED NOT NULL,
  `position_name` varchar(50) NOT NULL,
  `other_name` varchar(50) DEFAULT NULL,
  `is_discontinued` tinyint(1) NOT NULL,
  `location_id` int(11) NOT NULL,
  `is_updated` tinyint(1) NOT NULL,
  `modified_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `floors`
--

CREATE TABLE `floors` (
  `floor_id` bigint(20) UNSIGNED NOT NULL,
  `floor_name` varchar(100) NOT NULL,
  `other_name` varchar(100) DEFAULT NULL,
  `floor_code` varchar(20) NOT NULL,
  `is_discontinued` tinyint(1) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT NULL,
  `location_id` int(11) NOT NULL,
  `is_updated` tinyint(1) NOT NULL,
  `modified_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `form_menus`
--

CREATE TABLE `form_menus` (
  `form_menu_id` bigint(20) UNSIGNED NOT NULL,
  `form_id` int(11) NOT NULL,
  `form_description` varchar(100) DEFAULT NULL,
  `form_name` varchar(100) NOT NULL,
  `parent_form_id` int(11) NOT NULL,
  `group_name` varchar(100) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_updated` tinyint(1) NOT NULL,
  `modified_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `item_discounts`
--

CREATE TABLE `item_discounts` (
  `item_discount_id` bigint(20) UNSIGNED NOT NULL,
  `item_id` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `other_description` varchar(255) DEFAULT NULL,
  `item_price` varchar(255) NOT NULL,
  `buy_quantity` varchar(255) NOT NULL,
  `discount_type` varchar(255) NOT NULL,
  `amount_discount` decimal(8,2) NOT NULL,
  `percent_discount` decimal(8,2) NOT NULL,
  `promotion_price` decimal(8,2) NOT NULL,
  `monday` tinyint(1) DEFAULT NULL,
  `tuesday` tinyint(1) DEFAULT NULL,
  `wednesday` tinyint(1) DEFAULT NULL,
  `thursday` tinyint(1) DEFAULT NULL,
  `friday` tinyint(1) DEFAULT NULL,
  `saturday` tinyint(1) DEFAULT NULL,
  `sunday` tinyint(1) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `start_happy_hour` time DEFAULT NULL,
  `end_happy_hour` time DEFAULT NULL,
  `location_id` int(11) NOT NULL,
  `is_updated` tinyint(1) DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `modified_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `item_recipes`
--

CREATE TABLE `item_recipes` (
  `item_recipe_id` bigint(20) UNSIGNED NOT NULL,
  `item_id` int(11) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `recipe_item_id` int(11) NOT NULL,
  `recipe_item_unit_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  `is_updated` tinyint(1) NOT NULL,
  `is_deleted` tinyint(1) DEFAULT NULL,
  `modified_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `item_selling_prices`
--

CREATE TABLE `item_selling_prices` (
  `item_selling_price_id` bigint(20) UNSIGNED NOT NULL,
  `item_id` int(11) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `unit_cost` decimal(8,2) NOT NULL,
  `retail_quantity` int(11) NOT NULL,
  `retail_percent` decimal(8,2) NOT NULL,
  `retail_price_1` decimal(8,2) NOT NULL,
  `retail_price_2` decimal(8,2) NOT NULL,
  `retail_price_3` decimal(8,2) NOT NULL,
  `retail_price_4` decimal(8,2) NOT NULL,
  `retail_price_5` decimal(8,2) NOT NULL,
  `whole_sale_quantity` int(11) NOT NULL,
  `whole_sale_percent` decimal(8,2) NOT NULL,
  `whole_sale_price_1` decimal(8,2) NOT NULL,
  `whole_sale_price_2` decimal(8,2) NOT NULL,
  `whole_sale_price_3` decimal(8,2) NOT NULL,
  `whole_sale_price_4` decimal(8,2) NOT NULL,
  `whole_sale_price_5` decimal(8,2) NOT NULL,
  `location_id` int(11) NOT NULL,
  `is_updated` tinyint(1) NOT NULL,
  `modified_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `item_types`
--

CREATE TABLE `item_types` (
  `item_type_id` bigint(20) UNSIGNED NOT NULL,
  `item_type_name` varchar(100) NOT NULL,
  `other_name` varchar(100) DEFAULT NULL,
  `is_discontinued` tinyint(1) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT NULL,
  `location_id` int(11) NOT NULL,
  `is_updated` tinyint(1) NOT NULL,
  `modified_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `item_types`
--

INSERT INTO `item_types` (`item_type_id`, `item_type_name`, `other_name`, `is_discontinued`, `is_deleted`, `location_id`, `is_updated`, `modified_by`, `created_at`, `updated_at`) VALUES
(1, 'Menu Item', 'Menu Item', 0, 0, 1, 0, 1, '2024-03-26 09:32:12', '2024-03-26 09:32:12'),
(2, 'Stock Item', 'Stock Item', 0, 0, 1, 0, 1, '2024-03-26 09:32:12', '2024-03-26 09:32:12'),
(3, 'Menu & Stock', 'Menu & Stock', 0, 0, 1, 0, 1, '2024-03-26 09:32:12', '2024-03-26 09:32:12');

-- --------------------------------------------------------

--
-- Table structure for table `item_uoms`
--

CREATE TABLE `item_uoms` (
  `item_uom_id` bigint(20) UNSIGNED NOT NULL,
  `item_id` int(11) NOT NULL,
  `from_unit_id` int(11) NOT NULL,
  `to_unit_id` int(11) NOT NULL,
  `quantity` decimal(8,2) NOT NULL,
  `points` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  `is_updated` tinyint(1) NOT NULL,
  `modified_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `location_id` bigint(20) UNSIGNED NOT NULL,
  `location_code` varchar(50) NOT NULL,
  `location_name` varchar(100) NOT NULL,
  `location_address` varchar(200) NOT NULL,
  `is_current_location` tinyint(1) NOT NULL,
  `is_discontinued` tinyint(1) NOT NULL,
  `is_updated` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `main_categories`
--

CREATE TABLE `main_categories` (
  `main_category_id` bigint(20) UNSIGNED NOT NULL,
  `main_category_name` varchar(100) NOT NULL,
  `store_location_id` int(11) NOT NULL,
  `is_discontinued` tinyint(1) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `modified_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `main_categories`
--

INSERT INTO `main_categories` (`main_category_id`, `main_category_name`, `store_location_id`, `is_discontinued`, `is_deleted`, `modified_by`, `created_at`, `updated_at`) VALUES
(1, 'Bar', 1, 0, 0, 1, '2024-03-26 09:32:12', '2024-03-26 09:32:12'),
(2, 'Kitchen', 1, 0, 0, 1, '2024-03-26 09:32:12', '2024-03-26 09:32:12'),
(3, 'Refrigerator', 1, 0, 0, 1, '2024-03-26 09:32:12', '2024-03-26 09:32:12'),
(4, 'Service', 1, 0, 0, 1, '2024-03-26 09:32:12', '2024-03-26 09:32:12');

-- --------------------------------------------------------

--
-- Table structure for table `member_cards`
--

CREATE TABLE `member_cards` (
  `member_card_id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` int(11) NOT NULL,
  `member_card_type_id` int(11) NOT NULL,
  `member_card_code` varchar(50) NOT NULL,
  `create_date` datetime NOT NULL,
  `expire_date` datetime DEFAULT NULL,
  `has_expire` tinyint(1) DEFAULT NULL,
  `remark` varchar(200) DEFAULT NULL,
  `is_expired` tinyint(1) DEFAULT NULL,
  `is_discontinued` tinyint(1) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `location_id` int(11) NOT NULL,
  `is_updated` tinyint(1) NOT NULL,
  `modified_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `member_card_types`
--

CREATE TABLE `member_card_types` (
  `member_card_type_id` bigint(20) UNSIGNED NOT NULL,
  `member_card_type_name` varchar(100) NOT NULL,
  `other_name` varchar(100) DEFAULT NULL,
  `discount_type` varchar(255) NOT NULL,
  `amount_discount` decimal(8,2) NOT NULL,
  `percent_discount` decimal(8,2) NOT NULL,
  `remark` varchar(200) DEFAULT NULL,
  `location_id` int(11) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `is_updated` tinyint(1) NOT NULL,
  `is_discontinued` tinyint(1) NOT NULL,
  `modified_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menu_categories`
--

CREATE TABLE `menu_categories` (
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `menu_category_name` varchar(100) NOT NULL,
  `main_category_id` int(11) NOT NULL,
  `menu_category_image` varchar(250) DEFAULT NULL,
  `store_location_id` int(11) NOT NULL,
  `is_discontinued` tinyint(1) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `modified_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_categories`
--

INSERT INTO `menu_categories` (`category_id`, `menu_category_name`, `main_category_id`, `menu_category_image`, `store_location_id`, `is_discontinued`, `is_deleted`, `modified_by`, `created_at`, `updated_at`) VALUES
(1, 'Beer', 1, '660296c1a15f6_beer.jpg', 1, 0, 0, 1, '2024-03-26 09:34:57', '2024-03-26 09:34:57'),
(2, 'Whiskey', 1, '660296cd94c1d_whiskey.png', 1, 0, 0, 1, '2024-03-26 09:35:09', '2024-03-26 09:35:09'),
(3, 'Wine', 1, '660296e148fcc_wine.jpg', 1, 0, 0, 1, '2024-03-26 09:35:29', '2024-03-26 09:35:29'),
(4, 'Beef', 2, '660296efbcab2_beef.jpg', 1, 0, 0, 1, '2024-03-26 09:35:43', '2024-03-26 09:35:43'),
(5, 'Chicken', 2, '660296fd75bca_chicken.jpeg', 1, 0, 0, 1, '2024-03-26 09:35:57', '2024-03-26 09:35:57'),
(6, 'Energy Drink', 3, '6602970dd2260_energydrink.jpg', 1, 0, 0, 1, '2024-03-26 09:36:13', '2024-03-26 09:36:13'),
(7, 'Soft Drink', 3, '660297195732b_softdrink.jpg', 1, 0, 0, 1, '2024-03-26 09:36:25', '2024-03-26 09:36:25');

-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

CREATE TABLE `menu_items` (
  `item_id` bigint(20) UNSIGNED NOT NULL,
  `main_category_id` int(11) NOT NULL,
  `sub_category_id` int(11) NOT NULL,
  `item_type_id` int(11) NOT NULL,
  `item_code` varchar(100) NOT NULL,
  `bar_code` varchar(100) NOT NULL,
  `item_name` varchar(100) NOT NULL,
  `other_name` varchar(100) DEFAULT NULL,
  `unit_id` int(11) NOT NULL,
  `item_price` varchar(100) DEFAULT NULL,
  `item_image` varchar(250) DEFAULT NULL,
  `location_id` int(11) NOT NULL,
  `is_discontinued` tinyint(1) NOT NULL,
  `is_deleted` tinyint(1) DEFAULT NULL,
  `modified_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_items`
--

INSERT INTO `menu_items` (`item_id`, `main_category_id`, `sub_category_id`, `item_type_id`, `item_code`, `bar_code`, `item_name`, `other_name`, `unit_id`, `item_price`, `item_image`, `location_id`, `is_discontinued`, `is_deleted`, `modified_by`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 3, 'I001', 'B001', 'Burbrit', NULL, 1, '2000', '6602977d6c8fd_burbrit.jpg', 1, 0, 0, 1, '2024-03-26 09:38:05', '2024-03-26 09:38:05'),
(2, 1, 1, 3, 'I002', 'B002', 'Carlsberg', NULL, 1, '3000', '660297961e8da_carlsberg.png', 1, 0, 0, 1, '2024-03-26 09:38:30', '2024-03-26 09:38:30'),
(3, 1, 1, 3, 'I003', 'B003', 'Heineken', NULL, 1, '3500', '660297af9c0b7_heineken.jpg', 1, 0, 0, 1, '2024-03-26 09:38:55', '2024-03-26 09:38:55'),
(4, 1, 1, 3, 'I004', 'B004', 'Tiger', NULL, 1, '3500', '660297cb0fcc1_tuborg.jpg', 1, 0, 0, 1, '2024-03-26 09:39:23', '2024-03-26 09:39:23'),
(5, 2, 4, 1, 'I005', 'B005', 'Beef Slide', NULL, 3, '2000', '660297e47f8a6_beefSlide.jpg', 1, 0, 0, 1, '2024-03-26 09:39:48', '2024-03-26 09:40:06'),
(6, 2, 4, 3, 'I006', 'B006', 'Beef Tongue', NULL, 3, '3500', '66029810ba476_beeftongue.jpg', 1, 0, 0, 1, '2024-03-26 09:40:32', '2024-03-26 09:40:32'),
(7, 3, 6, 3, 'I007', 'B007', '100 Plus', NULL, 1, '3500', '66029845b2ba7_100Plus.jpg', 1, 0, 0, 1, '2024-03-26 09:41:25', '2024-03-26 09:41:25');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2023_12_18_072638_create_sessions_table', 1),
(7, '2023_12_18_074014_create_asystem_checks_table', 1),
(8, '2023_12_18_074037_create_cities_table', 1),
(9, '2023_12_18_074053_create_company_infos_table', 1),
(10, '2023_12_18_074106_create_coupons_table', 1),
(11, '2023_12_18_074114_create_currencies_table', 1),
(12, '2023_12_18_074129_create_currency_exchange_histories_table', 1),
(13, '2023_12_18_074145_create_customers_table', 1),
(14, '2023_12_18_074202_create_customer_ledgers_table', 1),
(15, '2023_12_18_074213_create_customer_types_table', 1),
(16, '2023_12_18_074222_create_employees_table', 1),
(17, '2023_12_18_074235_create_employee_positions_table', 1),
(18, '2023_12_18_074244_create_floors_table', 1),
(19, '2023_12_18_074253_create_form_menus_table', 1),
(20, '2023_12_18_074303_create_item_discounts_table', 1),
(21, '2023_12_18_074314_create_item_recipes_table', 1),
(22, '2023_12_18_074328_create_item_selling_prices_table', 1),
(23, '2023_12_18_074339_create_item_types_table', 1),
(24, '2023_12_18_074353_create_item_uoms_table', 1),
(25, '2023_12_18_074401_create_locations_table', 1),
(26, '2023_12_18_074413_create_member_cards_table', 1),
(27, '2023_12_18_074420_create_member_card_types_table', 1),
(28, '2023_12_18_074434_create_menu_categories_table', 1),
(29, '2023_12_18_074444_create_menu_items_table', 1),
(30, '2023_12_18_074454_create_modifiers_table', 1),
(31, '2023_12_18_074503_create_modifier_groups_table', 1),
(32, '2023_12_18_074527_create_order_sales_types_table', 1),
(33, '2023_12_18_074540_create_payment_types_table', 1),
(34, '2023_12_18_074551_create_purchases_table', 1),
(35, '2023_12_18_074556_create_purchase_details_table', 1),
(36, '2023_12_18_074604_create_purchase_returns_table', 1),
(37, '2023_12_18_074615_create_purchase_return_details_table', 1),
(38, '2023_12_18_074630_create_reprint_vouchers_table', 1),
(39, '2023_12_18_074639_create_reservations_table', 1),
(40, '2023_12_18_074646_create_sales_table', 1),
(41, '2023_12_18_074655_create_sales_details_table', 1),
(42, '2023_12_18_074701_create_slips_table', 1),
(43, '2023_12_18_074723_create_stores_table', 1),
(44, '2023_12_18_074728_create_stock_issues_table', 1),
(45, '2023_12_18_074736_create_stock_issue_details_table', 1),
(46, '2023_12_18_074754_create_stock_issue_types_table', 1),
(47, '2023_12_18_074809_create_stock_receives_table', 1),
(48, '2023_12_18_074816_create_stock_receive_details_table', 1),
(49, '2023_12_18_074824_create_suppliers_table', 1),
(50, '2023_12_18_074834_create_supplier_ledgers_table', 1),
(51, '2023_12_18_074842_create_tables_table', 1),
(52, '2023_12_18_074848_create_table_prices_table', 1),
(53, '2023_12_18_074853_create_table_types_table', 1),
(54, '2023_12_18_074906_create_townships_table', 1),
(55, '2023_12_18_074911_create_units_table', 1),
(56, '2023_12_18_074947_create_user_roles_table', 1),
(57, '2023_12_18_074952_create_user_role_permissions_table', 1),
(58, '2024_01_29_100827_create_main_categories_table', 1),
(59, '2024_02_07_143323_create_deliveries_table', 1),
(60, '2024_03_06_155703_create_orders_table', 1),
(61, '2024_03_13_101032_create_order_details_table', 1),
(62, '2024_03_26_144339_create_purchase_payment_logs_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `modifiers`
--

CREATE TABLE `modifiers` (
  `modifier_id` bigint(20) UNSIGNED NOT NULL,
  `modifier_code` varchar(50) NOT NULL,
  `modifier_name` varchar(100) NOT NULL,
  `modifier_group_id` int(11) DEFAULT NULL,
  `unit_cost` decimal(8,2) NOT NULL,
  `unit_price` decimal(8,2) NOT NULL,
  `points` int(11) NOT NULL,
  `is_price_to_main_item` tinyint(1) DEFAULT NULL,
  `remark` varchar(200) NOT NULL,
  `is_show_in_print` tinyint(1) DEFAULT NULL,
  `sort_id` int(11) NOT NULL,
  `is_discontinued` tinyint(1) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT NULL,
  `location_id` int(11) NOT NULL,
  `is_updated` tinyint(1) NOT NULL,
  `modified_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `modifier_groups`
--

CREATE TABLE `modifier_groups` (
  `modifier_group_id` bigint(20) UNSIGNED NOT NULL,
  `modifier_group_code` varchar(50) NOT NULL,
  `modifier_group_name` varchar(50) NOT NULL,
  `location_id` int(11) NOT NULL,
  `sort_id` int(11) NOT NULL,
  `is_discontinued` tinyint(1) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `modified_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `table_id` int(11) NOT NULL,
  `table_order_number` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `order_detail_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `remark` varchar(100) DEFAULT NULL,
  `is_ordered` tinyint(1) NOT NULL,
  `is_foc` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_sales_types`
--

CREATE TABLE `order_sales_types` (
  `order_sales_type_id` bigint(20) UNSIGNED NOT NULL,
  `order_sales_type_code` varchar(50) NOT NULL,
  `order_sales_type_name_1` varchar(50) NOT NULL,
  `order_sales_type_name_2` varchar(50) DEFAULT NULL,
  `sort_id` int(11) NOT NULL,
  `is_discontinued` tinyint(1) DEFAULT NULL,
  `location_id` int(11) NOT NULL,
  `is_updated` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_types`
--

CREATE TABLE `payment_types` (
  `payment_type_id` bigint(20) UNSIGNED NOT NULL,
  `payment_type_name` varchar(50) NOT NULL,
  `sort_id` int(11) NOT NULL,
  `is_discontinued` tinyint(1) NOT NULL,
  `is_updated` tinyint(1) NOT NULL,
  `modified_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

CREATE TABLE `purchases` (
  `purchase_id` bigint(20) UNSIGNED NOT NULL,
  `purchase_voucher_number` varchar(50) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `purchase_date` datetime NOT NULL,
  `due_date` datetime NOT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `total_amount` decimal(8,2) NOT NULL,
  `total_item_discount` decimal(8,2) NOT NULL,
  `is_delete` tinyint(1) DEFAULT NULL,
  `delete_reason` varchar(150) DEFAULT NULL,
  `is_updated` tinyint(1) DEFAULT NULL,
  `modified_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchases`
--

INSERT INTO `purchases` (`purchase_id`, `purchase_voucher_number`, `supplier_id`, `purchase_date`, `due_date`, `remark`, `total_amount`, `total_item_discount`, `is_delete`, `delete_reason`, `is_updated`, `modified_by`, `created_at`, `updated_at`) VALUES
(29, 'P-24-1', 1, '2024-04-05 00:00:00', '2024-04-05 00:00:00', NULL, 117500.00, 10000.00, NULL, NULL, 1, 1, '2024-04-05 04:10:26', '2024-04-24 10:36:16'),
(30, 'P-24-2', 1, '2024-04-26 00:00:00', '2024-04-26 00:00:00', NULL, 32500.00, 1000.00, NULL, NULL, 1, 1, '2024-04-26 05:00:00', '2024-04-29 03:53:39');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_details`
--

CREATE TABLE `purchase_details` (
  `purchase_detail_id` bigint(20) UNSIGNED NOT NULL,
  `purchase_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `batch_number` int(11) NOT NULL,
  `quantity` decimal(8,2) NOT NULL,
  `unit_cost` decimal(8,2) NOT NULL,
  `inventory_cost` decimal(8,2) NOT NULL,
  `discount_amount` decimal(8,2) NOT NULL,
  `expire_date` datetime DEFAULT NULL,
  `is_foc` tinyint(1) DEFAULT NULL,
  `is_updated` tinyint(1) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchase_details`
--

INSERT INTO `purchase_details` (`purchase_detail_id`, `purchase_id`, `item_id`, `unit_id`, `batch_number`, `quantity`, `unit_cost`, `inventory_cost`, `discount_amount`, `expire_date`, `is_foc`, `is_updated`, `is_deleted`, `created_at`, `updated_at`) VALUES
(244, 29, 1, 1, 0, 10.00, 10000.00, 10000.00, 10000.00, '2024-04-30 00:00:00', 0, 1, NULL, '2024-04-24 10:36:16', '2024-04-24 10:36:16'),
(245, 29, 1, 1, 0, 1.00, 0.00, 0.00, 0.00, '2024-04-05 00:00:00', 1, 1, NULL, '2024-04-24 10:36:16', '2024-04-24 10:36:16'),
(246, 29, 4, 1, 0, 5.00, 3500.00, 3500.00, 0.00, '2024-04-30 00:00:00', 0, 1, NULL, '2024-04-24 10:36:16', '2024-04-24 10:36:16'),
(249, 30, 2, 1, 0, 5.00, 3000.00, 3000.00, 1000.00, '2024-04-26 00:00:00', 0, 1, NULL, '2024-04-29 03:53:39', '2024-04-29 03:53:39'),
(250, 30, 3, 1, 0, 5.00, 3500.00, 3500.00, 0.00, '2024-04-26 00:00:00', 0, 1, NULL, '2024-04-29 03:53:39', '2024-04-29 03:53:39');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_payment_logs`
--

CREATE TABLE `purchase_payment_logs` (
  `purchase_payment_log_id` bigint(20) UNSIGNED NOT NULL,
  `purchase_id` int(11) NOT NULL,
  `paid_date` datetime NOT NULL,
  `voucher_discount` varchar(255) NOT NULL,
  `total_amount` varchar(255) NOT NULL,
  `tax` varchar(255) NOT NULL,
  `transport_charges` varchar(255) NOT NULL,
  `other_charges` varchar(255) NOT NULL,
  `paid_amount` varchar(255) NOT NULL,
  `net_amount` varchar(255) NOT NULL,
  `balance` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchase_payment_logs`
--

INSERT INTO `purchase_payment_logs` (`purchase_payment_log_id`, `purchase_id`, `paid_date`, `voucher_discount`, `total_amount`, `tax`, `transport_charges`, `other_charges`, `paid_amount`, `net_amount`, `balance`, `created_at`, `updated_at`) VALUES
(1, 29, '2024-04-23 00:00:00', '0', '117500', '0', '0', '0', '10000', '107500', '97500', '2024-04-23 09:10:25', '2024-04-24 10:06:14'),
(3, 29, '2024-04-29 00:00:00', '0', '97500', '0', '1000', '0', '20000', '98500', '78500', '2024-04-29 04:00:23', '2024-04-29 10:34:53'),
(5, 30, '2024-04-29 00:00:00', '0', '31500', '0', '0', '0', '1500', '31500', '30000', '2024-04-29 10:54:08', '2024-04-29 10:54:08'),
(6, 30, '2024-04-29 00:00:00', '0', '30000', '0', '0', '0', '5000', '30000', '25000', '2024-04-29 10:54:46', '2024-04-29 10:55:13');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_returns`
--

CREATE TABLE `purchase_returns` (
  `purchase_return_id` bigint(20) UNSIGNED NOT NULL,
  `purchase_return_date` datetime NOT NULL,
  `purchase_return_voucher_number` varchar(50) NOT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `supplier_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `exchange_rate` decimal(8,2) NOT NULL,
  `total_amount` decimal(8,2) NOT NULL,
  `transport_charges` decimal(8,2) NOT NULL,
  `total_discount` decimal(8,2) NOT NULL,
  `remark` varchar(250) DEFAULT NULL,
  `is_cancel` tinyint(1) DEFAULT NULL,
  `cancel_by` int(11) DEFAULT NULL,
  `cancel_date` datetime DEFAULT NULL,
  `cancel_reason` varchar(150) DEFAULT NULL,
  `location_id` int(11) NOT NULL,
  `is_updated` tinyint(1) NOT NULL,
  `modified_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_return_details`
--

CREATE TABLE `purchase_return_details` (
  `purcahse_return_detail_id` bigint(20) UNSIGNED NOT NULL,
  `purcahse_return_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `batch_number` int(11) DEFAULT NULL,
  `quantity` decimal(8,2) NOT NULL,
  `unit_cost` decimal(8,2) NOT NULL,
  `discount_amount` decimal(8,2) NOT NULL,
  `expire_date` datetime DEFAULT NULL,
  `is_foc` tinyint(1) DEFAULT NULL,
  `remark` varchar(150) DEFAULT NULL,
  `location_id` int(11) NOT NULL,
  `is_updated` tinyint(1) NOT NULL,
  `is_deleted` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reprint_vouchers`
--

CREATE TABLE `reprint_vouchers` (
  `reprint_voucher_id` bigint(20) UNSIGNED NOT NULL,
  `sales_id` int(11) NOT NULL,
  `printed_by` varchar(255) NOT NULL,
  `printed_date` datetime NOT NULL,
  `location_id` int(11) NOT NULL,
  `is_updated` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reservations`
--

CREATE TABLE `reservations` (
  `reservation_id` bigint(20) UNSIGNED NOT NULL,
  `reservation_date` datetime NOT NULL,
  `from_time` datetime NOT NULL,
  `to_time` datetime NOT NULL,
  `table_id` int(11) NOT NULL,
  `number_of_person` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `location_id` int(11) NOT NULL,
  `is_updated` tinyint(1) NOT NULL,
  `is_deleted` tinyint(1) DEFAULT NULL,
  `modified_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `sales_id` bigint(20) UNSIGNED NOT NULL,
  `sales_type_id` int(11) NOT NULL,
  `order_date` datetime DEFAULT NULL,
  `order_number` varchar(50) DEFAULT NULL,
  `is_order_complete` tinyint(1) NOT NULL,
  `sales_date` datetime NOT NULL,
  `check_in_time` datetime DEFAULT NULL,
  `check_out_time` datetime DEFAULT NULL,
  `section_time` decimal(8,2) NOT NULL,
  `sales_voucher_number` varchar(50) NOT NULL,
  `store_id` int(11) NOT NULL,
  `table_id` int(11) DEFAULT NULL,
  `customer_count` int(11) DEFAULT NULL,
  `currency_id` int(11) NOT NULL,
  `exchange_rate` decimal(8,2) NOT NULL,
  `member_card_id` int(11) DEFAULT NULL,
  `coupon_id` int(11) DEFAULT NULL,
  `coupon_discount_time` decimal(8,2) NOT NULL,
  `member_discount_time` decimal(8,2) NOT NULL,
  `foc_time` decimal(8,2) NOT NULL,
  `table_unit_price` decimal(8,2) NOT NULL,
  `table_unit_amount` decimal(8,2) NOT NULL,
  `total_amount` decimal(8,2) NOT NULL,
  `transport_charges` decimal(8,2) NOT NULL,
  `service_charges` decimal(8,2) NOT NULL,
  `tax` decimal(8,2) NOT NULL,
  `item_discount` decimal(8,2) NOT NULL,
  `total_discount` decimal(8,2) NOT NULL,
  `foc_time_amount` decimal(8,2) NOT NULL,
  `member_card_discount` decimal(8,2) NOT NULL,
  `coupon_discount` decimal(8,2) NOT NULL,
  `paid_amount_from_prepaid_card` decimal(8,2) NOT NULL,
  `paid_amount_from_benefit` decimal(8,2) NOT NULL,
  `paid_amount` decimal(8,2) NOT NULL,
  `is_foc` tinyint(1) NOT NULL,
  `remark` varchar(250) DEFAULT NULL,
  `is_cancel` tinyint(1) DEFAULT NULL,
  `cancel_by` int(11) DEFAULT NULL,
  `cancel_date` datetime DEFAULT NULL,
  `cancel_reason` varchar(250) DEFAULT NULL,
  `location_id` int(11) NOT NULL,
  `is_updated` tinyint(1) NOT NULL,
  `modified_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sales_details`
--

CREATE TABLE `sales_details` (
  `sales_dsetail_id` bigint(20) UNSIGNED NOT NULL,
  `sales_id` int(11) NOT NULL,
  `order_time` datetime NOT NULL,
  `cook_finish_time` datetime NOT NULL,
  `item_id` int(11) NOT NULL,
  `modifier_id` int(11) DEFAULT NULL,
  `unit_id` int(11) NOT NULL,
  `quantity` decimal(8,2) NOT NULL,
  `unit_price` decimal(8,2) NOT NULL,
  `discount` decimal(8,2) NOT NULL,
  `item_remark` varchar(255) DEFAULT NULL,
  `is_foc` tinyint(1) DEFAULT NULL,
  `is_ordered` tinyint(1) DEFAULT NULL,
  `is_cooked` tinyint(1) DEFAULT NULL,
  `location_id` int(11) NOT NULL,
  `is_updated` tinyint(1) NOT NULL,
  `is_deleted` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('EqQKliKEQ9rGPRtyFAou0Ic43SyaBQfpYUbom1J4', 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiOFdLRzhKeFgyQVhPZHhVM2VQWGZYOW5WT1hzN0RmMUdiV3psSFVTNSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTg6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MC9SX1BST192NF9sYXRlc3QvcHVibGljL2Rhc2hib2FyZFBhZ2UiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO3M6MjE6InBhc3N3b3JkX2hhc2hfc2FuY3R1bSI7czo2MDoiJDJ5JDEyJExCOHpNRHBHV0xiQi5TMWU5bDNLcnVuOHJ6Ujc3TXh1bUN4RnhMLnZJWHFCZlhKY0U0TEgyIjt9', 1714448080),
('PNU8IUgAu49YnSJFUnyqUqN0ZyOZdRdEIQuy324G', 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiNmptc1JaOXFYWXdZOUtUSllZOHdYZW5SeHFXbUJxVGNtTkRNY2NhaCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Njc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MC9SX1BST192NF9sYXRlc3QvcHVibGljL2FkbWluL3B1cmNhaHNlTGlzdFBhZ2UiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO3M6MjE6InBhc3N3b3JkX2hhc2hfc2FuY3R1bSI7czo2MDoiJDJ5JDEyJExCOHpNRHBHV0xiQi5TMWU5bDNLcnVuOHJ6Ujc3TXh1bUN4RnhMLnZJWHFCZlhKY0U0TEgyIjt9', 1714388161);

-- --------------------------------------------------------

--
-- Table structure for table `slips`
--

CREATE TABLE `slips` (
  `slip_id` bigint(20) UNSIGNED NOT NULL,
  `printer_name` varchar(50) NOT NULL,
  `slip_number` int(11) NOT NULL,
  `slip_date` datetime NOT NULL,
  `is_updated` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stock_issues`
--

CREATE TABLE `stock_issues` (
  `stock_issue_id` bigint(20) UNSIGNED NOT NULL,
  `issue_date` datetime NOT NULL,
  `issue_voucher_number` varchar(255) NOT NULL,
  `store_id` int(11) NOT NULL,
  `total_amount` decimal(8,2) NOT NULL,
  `remark` varchar(255) NOT NULL,
  `issue_type_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `is_cancel` tinyint(1) DEFAULT NULL,
  `cancel_by` int(11) DEFAULT NULL,
  `cancel_date` datetime DEFAULT NULL,
  `cancel_reason` varchar(255) DEFAULT NULL,
  `location_id` int(11) NOT NULL,
  `is_updated` tinyint(1) NOT NULL,
  `modified_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stock_issue_details`
--

CREATE TABLE `stock_issue_details` (
  `stock_issue_detail_id` bigint(20) UNSIGNED NOT NULL,
  `stock_issue_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `batch_number` int(11) NOT NULL,
  `quantity` decimal(8,2) NOT NULL,
  `unit_cost` decimal(8,2) NOT NULL,
  `item_remark` varchar(255) DEFAULT NULL,
  `expire_date` datetime DEFAULT NULL,
  `location_id` int(11) NOT NULL,
  `is_updated` tinyint(1) NOT NULL,
  `is_deleted` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stock_issue_types`
--

CREATE TABLE `stock_issue_types` (
  `issue_type_id` bigint(20) UNSIGNED NOT NULL,
  `issue_type_code` varchar(255) NOT NULL,
  `issue_type_name_1` varchar(255) NOT NULL,
  `issue_type_name_2` varchar(255) DEFAULT NULL,
  `sort_id` int(11) NOT NULL,
  `is_discontinued` tinyint(1) DEFAULT NULL,
  `location_id` int(11) NOT NULL,
  `is_updated` tinyint(1) NOT NULL,
  `modified_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stock_receives`
--

CREATE TABLE `stock_receives` (
  `stock_receive_id` bigint(20) UNSIGNED NOT NULL,
  `receive_voucher_number` varchar(50) NOT NULL,
  `receive_date` datetime NOT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `is_delete` tinyint(1) DEFAULT NULL,
  `delete_reason` varchar(150) DEFAULT NULL,
  `is_updated` tinyint(1) DEFAULT NULL,
  `modified_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stock_receive_details`
--

CREATE TABLE `stock_receive_details` (
  `stock_receive_detail_id` bigint(20) UNSIGNED NOT NULL,
  `stock_receive_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `quantity` decimal(8,2) NOT NULL,
  `unit_cost` decimal(8,2) NOT NULL,
  `amount` decimal(8,2) NOT NULL,
  `expire_date` datetime DEFAULT NULL,
  `batch_number` int(11) NOT NULL,
  `is_updated` tinyint(1) NOT NULL,
  `is_deleted` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stores`
--

CREATE TABLE `stores` (
  `store_id` bigint(20) UNSIGNED NOT NULL,
  `store_code` varchar(50) NOT NULL,
  `store_name_1` varchar(100) NOT NULL,
  `store_name_2` varchar(100) DEFAULT NULL,
  `sort_id` int(11) NOT NULL,
  `is_discontinued` tinyint(1) DEFAULT NULL,
  `location_id` int(11) NOT NULL,
  `is_updated` tinyint(1) NOT NULL,
  `modified_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `supplier_id` bigint(20) UNSIGNED NOT NULL,
  `supplier_name` varchar(100) NOT NULL,
  `other_name` varchar(100) DEFAULT NULL,
  `supplier_code` varchar(50) NOT NULL,
  `phone_number` varchar(50) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `city_id` int(11) NOT NULL,
  `township_id` int(11) NOT NULL,
  `address` varchar(200) NOT NULL,
  `remark` varchar(250) DEFAULT NULL,
  `is_discontinued` tinyint(1) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `is_updated` tinyint(1) NOT NULL,
  `location_id` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`supplier_id`, `supplier_name`, `other_name`, `supplier_code`, `phone_number`, `email`, `city_id`, `township_id`, `address`, `remark`, `is_discontinued`, `is_deleted`, `is_updated`, `location_id`, `modified_by`, `created_at`, `updated_at`) VALUES
(1, 'KK', NULL, 'kk', '-', NULL, 1, 1, '-', NULL, 0, 0, 0, 1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `supplier_ledgers`
--

CREATE TABLE `supplier_ledgers` (
  `supplier_ledger_id` bigint(20) UNSIGNED NOT NULL,
  `payment_date` datetime NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `purchase_return_id` int(11) DEFAULT NULL,
  `outstanding_batch_number` int(11) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `exchange_rate` decimal(8,2) NOT NULL,
  `total_amount` decimal(8,2) NOT NULL,
  `transport_charges` decimal(8,2) NOT NULL,
  `tax` decimal(8,2) NOT NULL,
  `other_charges` decimal(8,2) NOT NULL,
  `total_discount` decimal(8,2) NOT NULL,
  `paid_amount` decimal(8,2) NOT NULL,
  `return_amount` decimal(8,2) NOT NULL,
  `transaction_type` varchar(50) NOT NULL,
  `remark` varchar(250) DEFAULT NULL,
  `location_id` int(11) NOT NULL,
  `is_updated` tinyint(1) NOT NULL,
  `is_deleted` tinyint(1) DEFAULT NULL,
  `modified_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tables`
--

CREATE TABLE `tables` (
  `table_id` bigint(20) UNSIGNED NOT NULL,
  `table_name` varchar(255) NOT NULL,
  `other_name` varchar(255) DEFAULT NULL,
  `floor_id` int(11) NOT NULL,
  `is_open` tinyint(1) DEFAULT NULL,
  `is_discontinued` tinyint(1) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT NULL,
  `is_updated` tinyint(1) NOT NULL,
  `location_id` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `table_prices`
--

CREATE TABLE `table_prices` (
  `table_price_id` bigint(20) UNSIGNED NOT NULL,
  `table_id` int(11) NOT NULL,
  `quantity` decimal(8,2) NOT NULL,
  `unit_price` decimal(8,2) NOT NULL,
  `location_id` int(11) NOT NULL,
  `is_updated` tinyint(1) NOT NULL,
  `modified_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `table_types`
--

CREATE TABLE `table_types` (
  `table_type_id` bigint(20) UNSIGNED NOT NULL,
  `table_type_code` varchar(50) NOT NULL,
  `table_type_name_1` varchar(100) NOT NULL,
  `table_type_name_2` varchar(100) DEFAULT NULL,
  `shape` varchar(50) DEFAULT NULL,
  `table_type_image` varchar(100) DEFAULT NULL,
  `is_room` tinyint(1) DEFAULT NULL,
  `sort_id` int(11) NOT NULL,
  `is_discontinued` tinyint(1) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT NULL,
  `is_updated` tinyint(1) NOT NULL,
  `location_id` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `townships`
--

CREATE TABLE `townships` (
  `township_id` bigint(20) UNSIGNED NOT NULL,
  `township_name` varchar(255) NOT NULL,
  `city_id` int(11) NOT NULL,
  `is_discontinued` tinyint(1) DEFAULT NULL,
  `is_updated` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `unit_id` bigint(20) UNSIGNED NOT NULL,
  `unit_name` varchar(50) NOT NULL,
  `other_name` varchar(150) NOT NULL,
  `is_discontinued` tinyint(1) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT NULL,
  `is_updated` tinyint(1) NOT NULL,
  `location_id` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`unit_id`, `unit_name`, `other_name`, `is_discontinued`, `is_deleted`, `is_updated`, `location_id`, `modified_by`, `created_at`, `updated_at`) VALUES
(1, 'Bottle', 'Bottle', 0, 0, 0, 1, 1, '2024-03-26 09:36:39', '2024-03-26 09:36:39'),
(2, 'Cup', 'Cup', 0, 0, 0, 1, 1, '2024-03-26 09:36:45', '2024-03-26 09:36:45'),
(3, 'Piece', 'Piece', 0, 0, 0, 1, 1, '2024-03-26 09:36:51', '2024-03-26 09:36:51'),
(4, 'Can', 'Can', 0, 0, 0, 1, 1, '2024-03-26 09:37:17', '2024-03-26 09:37:17');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `user_role_id` int(11) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `login_status` tinyint(1) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `is_discontinued` tinyint(1) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `two_factor_secret` text DEFAULT NULL,
  `two_factor_recovery_codes` text DEFAULT NULL,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `current_team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `profile_photo_path` varchar(2048) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `user_role_id`, `employee_id`, `login_status`, `location_id`, `is_discontinued`, `modified_by`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `remember_token`, `current_team_id`, `profile_photo_path`, `created_at`, `updated_at`) VALUES
(1, 'System Administrator', 'sysadmin', 1, 1, 1, 1, 0, 1, NULL, '$2y$12$LB8zMDpGWLbB.S1e9l3Krun8rzR77MxumCxFxL.vIXqBfXJcE4LH2', NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-26 09:32:12', '2024-03-26 09:32:12');

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `user_role_id` bigint(20) UNSIGNED NOT NULL,
  `user_role_name` varchar(50) NOT NULL,
  `other_name` varchar(50) DEFAULT NULL,
  `location_id` int(11) NOT NULL,
  `is_discontinued` tinyint(1) NOT NULL,
  `modified_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_roles`
--

INSERT INTO `user_roles` (`user_role_id`, `user_role_name`, `other_name`, `location_id`, `is_discontinued`, `modified_by`, `created_at`, `updated_at`) VALUES
(1, 'System_Administrator', 'sysadmin', 1, 0, 1, '2024-03-26 09:32:12', '2024-03-26 09:32:12');

-- --------------------------------------------------------

--
-- Table structure for table `user_role_permissions`
--

CREATE TABLE `user_role_permissions` (
  `user_role_permisssion_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` int(11) NOT NULL,
  `form_id` int(11) NOT NULL,
  `is_updated` tinyint(1) NOT NULL,
  `is_deleted` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `asystem_checks`
--
ALTER TABLE `asystem_checks`
  ADD PRIMARY KEY (`asystem_id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`city_id`);

--
-- Indexes for table `company_infos`
--
ALTER TABLE `company_infos`
  ADD PRIMARY KEY (`company_id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`coupon_id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`currency_id`);

--
-- Indexes for table `currency_exchange_histories`
--
ALTER TABLE `currency_exchange_histories`
  ADD PRIMARY KEY (`currency_exchange_history_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `customer_ledgers`
--
ALTER TABLE `customer_ledgers`
  ADD PRIMARY KEY (`customer_ledger_id`);

--
-- Indexes for table `customer_types`
--
ALTER TABLE `customer_types`
  ADD PRIMARY KEY (`customer_type_id`);

--
-- Indexes for table `deliveries`
--
ALTER TABLE `deliveries`
  ADD PRIMARY KEY (`delivery_id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`employee_id`);

--
-- Indexes for table `employee_positions`
--
ALTER TABLE `employee_positions`
  ADD PRIMARY KEY (`employee_position_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `floors`
--
ALTER TABLE `floors`
  ADD PRIMARY KEY (`floor_id`);

--
-- Indexes for table `form_menus`
--
ALTER TABLE `form_menus`
  ADD PRIMARY KEY (`form_menu_id`);

--
-- Indexes for table `item_discounts`
--
ALTER TABLE `item_discounts`
  ADD PRIMARY KEY (`item_discount_id`);

--
-- Indexes for table `item_recipes`
--
ALTER TABLE `item_recipes`
  ADD PRIMARY KEY (`item_recipe_id`);

--
-- Indexes for table `item_selling_prices`
--
ALTER TABLE `item_selling_prices`
  ADD PRIMARY KEY (`item_selling_price_id`);

--
-- Indexes for table `item_types`
--
ALTER TABLE `item_types`
  ADD PRIMARY KEY (`item_type_id`);

--
-- Indexes for table `item_uoms`
--
ALTER TABLE `item_uoms`
  ADD PRIMARY KEY (`item_uom_id`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`location_id`);

--
-- Indexes for table `main_categories`
--
ALTER TABLE `main_categories`
  ADD PRIMARY KEY (`main_category_id`);

--
-- Indexes for table `member_cards`
--
ALTER TABLE `member_cards`
  ADD PRIMARY KEY (`member_card_id`);

--
-- Indexes for table `member_card_types`
--
ALTER TABLE `member_card_types`
  ADD PRIMARY KEY (`member_card_type_id`);

--
-- Indexes for table `menu_categories`
--
ALTER TABLE `menu_categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`item_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `modifiers`
--
ALTER TABLE `modifiers`
  ADD PRIMARY KEY (`modifier_id`);

--
-- Indexes for table `modifier_groups`
--
ALTER TABLE `modifier_groups`
  ADD PRIMARY KEY (`modifier_group_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`order_detail_id`);

--
-- Indexes for table `order_sales_types`
--
ALTER TABLE `order_sales_types`
  ADD PRIMARY KEY (`order_sales_type_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `payment_types`
--
ALTER TABLE `payment_types`
  ADD PRIMARY KEY (`payment_type_id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`purchase_id`);

--
-- Indexes for table `purchase_details`
--
ALTER TABLE `purchase_details`
  ADD PRIMARY KEY (`purchase_detail_id`);

--
-- Indexes for table `purchase_payment_logs`
--
ALTER TABLE `purchase_payment_logs`
  ADD PRIMARY KEY (`purchase_payment_log_id`);

--
-- Indexes for table `purchase_returns`
--
ALTER TABLE `purchase_returns`
  ADD PRIMARY KEY (`purchase_return_id`);

--
-- Indexes for table `purchase_return_details`
--
ALTER TABLE `purchase_return_details`
  ADD PRIMARY KEY (`purcahse_return_detail_id`);

--
-- Indexes for table `reprint_vouchers`
--
ALTER TABLE `reprint_vouchers`
  ADD PRIMARY KEY (`reprint_voucher_id`);

--
-- Indexes for table `reservations`
--
ALTER TABLE `reservations`
  ADD PRIMARY KEY (`reservation_id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`sales_id`);

--
-- Indexes for table `sales_details`
--
ALTER TABLE `sales_details`
  ADD PRIMARY KEY (`sales_dsetail_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `slips`
--
ALTER TABLE `slips`
  ADD PRIMARY KEY (`slip_id`);

--
-- Indexes for table `stock_issues`
--
ALTER TABLE `stock_issues`
  ADD PRIMARY KEY (`stock_issue_id`);

--
-- Indexes for table `stock_issue_details`
--
ALTER TABLE `stock_issue_details`
  ADD PRIMARY KEY (`stock_issue_detail_id`);

--
-- Indexes for table `stock_issue_types`
--
ALTER TABLE `stock_issue_types`
  ADD PRIMARY KEY (`issue_type_id`);

--
-- Indexes for table `stock_receives`
--
ALTER TABLE `stock_receives`
  ADD PRIMARY KEY (`stock_receive_id`);

--
-- Indexes for table `stock_receive_details`
--
ALTER TABLE `stock_receive_details`
  ADD PRIMARY KEY (`stock_receive_detail_id`);

--
-- Indexes for table `stores`
--
ALTER TABLE `stores`
  ADD PRIMARY KEY (`store_id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`supplier_id`);

--
-- Indexes for table `supplier_ledgers`
--
ALTER TABLE `supplier_ledgers`
  ADD PRIMARY KEY (`supplier_ledger_id`);

--
-- Indexes for table `tables`
--
ALTER TABLE `tables`
  ADD PRIMARY KEY (`table_id`);

--
-- Indexes for table `table_prices`
--
ALTER TABLE `table_prices`
  ADD PRIMARY KEY (`table_price_id`);

--
-- Indexes for table `table_types`
--
ALTER TABLE `table_types`
  ADD PRIMARY KEY (`table_type_id`);

--
-- Indexes for table `townships`
--
ALTER TABLE `townships`
  ADD PRIMARY KEY (`township_id`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`unit_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_role_id`);

--
-- Indexes for table `user_role_permissions`
--
ALTER TABLE `user_role_permissions`
  ADD PRIMARY KEY (`user_role_permisssion_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `asystem_checks`
--
ALTER TABLE `asystem_checks`
  MODIFY `asystem_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `city_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `company_infos`
--
ALTER TABLE `company_infos`
  MODIFY `company_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `coupon_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `currency_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `currency_exchange_histories`
--
ALTER TABLE `currency_exchange_histories`
  MODIFY `currency_exchange_history_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer_ledgers`
--
ALTER TABLE `customer_ledgers`
  MODIFY `customer_ledger_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer_types`
--
ALTER TABLE `customer_types`
  MODIFY `customer_type_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deliveries`
--
ALTER TABLE `deliveries`
  MODIFY `delivery_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `employee_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee_positions`
--
ALTER TABLE `employee_positions`
  MODIFY `employee_position_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `floors`
--
ALTER TABLE `floors`
  MODIFY `floor_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `form_menus`
--
ALTER TABLE `form_menus`
  MODIFY `form_menu_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `item_discounts`
--
ALTER TABLE `item_discounts`
  MODIFY `item_discount_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `item_recipes`
--
ALTER TABLE `item_recipes`
  MODIFY `item_recipe_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `item_selling_prices`
--
ALTER TABLE `item_selling_prices`
  MODIFY `item_selling_price_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `item_types`
--
ALTER TABLE `item_types`
  MODIFY `item_type_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `item_uoms`
--
ALTER TABLE `item_uoms`
  MODIFY `item_uom_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `location_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `main_categories`
--
ALTER TABLE `main_categories`
  MODIFY `main_category_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `member_cards`
--
ALTER TABLE `member_cards`
  MODIFY `member_card_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `member_card_types`
--
ALTER TABLE `member_card_types`
  MODIFY `member_card_type_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menu_categories`
--
ALTER TABLE `menu_categories`
  MODIFY `category_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `item_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `modifiers`
--
ALTER TABLE `modifiers`
  MODIFY `modifier_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `modifier_groups`
--
ALTER TABLE `modifier_groups`
  MODIFY `modifier_group_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `order_detail_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_sales_types`
--
ALTER TABLE `order_sales_types`
  MODIFY `order_sales_type_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_types`
--
ALTER TABLE `payment_types`
  MODIFY `payment_type_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchases`
--
ALTER TABLE `purchases`
  MODIFY `purchase_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `purchase_details`
--
ALTER TABLE `purchase_details`
  MODIFY `purchase_detail_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=251;

--
-- AUTO_INCREMENT for table `purchase_payment_logs`
--
ALTER TABLE `purchase_payment_logs`
  MODIFY `purchase_payment_log_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `purchase_returns`
--
ALTER TABLE `purchase_returns`
  MODIFY `purchase_return_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchase_return_details`
--
ALTER TABLE `purchase_return_details`
  MODIFY `purcahse_return_detail_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reprint_vouchers`
--
ALTER TABLE `reprint_vouchers`
  MODIFY `reprint_voucher_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reservations`
--
ALTER TABLE `reservations`
  MODIFY `reservation_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `sales_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sales_details`
--
ALTER TABLE `sales_details`
  MODIFY `sales_dsetail_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `slips`
--
ALTER TABLE `slips`
  MODIFY `slip_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stock_issues`
--
ALTER TABLE `stock_issues`
  MODIFY `stock_issue_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stock_issue_details`
--
ALTER TABLE `stock_issue_details`
  MODIFY `stock_issue_detail_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stock_issue_types`
--
ALTER TABLE `stock_issue_types`
  MODIFY `issue_type_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stock_receives`
--
ALTER TABLE `stock_receives`
  MODIFY `stock_receive_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stock_receive_details`
--
ALTER TABLE `stock_receive_details`
  MODIFY `stock_receive_detail_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stores`
--
ALTER TABLE `stores`
  MODIFY `store_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `supplier_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `supplier_ledgers`
--
ALTER TABLE `supplier_ledgers`
  MODIFY `supplier_ledger_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tables`
--
ALTER TABLE `tables`
  MODIFY `table_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `table_prices`
--
ALTER TABLE `table_prices`
  MODIFY `table_price_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `table_types`
--
ALTER TABLE `table_types`
  MODIFY `table_type_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `townships`
--
ALTER TABLE `townships`
  MODIFY `township_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `unit_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_roles`
--
ALTER TABLE `user_roles`
  MODIFY `user_role_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_role_permissions`
--
ALTER TABLE `user_role_permissions`
  MODIFY `user_role_permisssion_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
