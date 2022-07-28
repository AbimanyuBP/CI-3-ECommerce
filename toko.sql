-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 30 Des 2021 pada 11.09
-- Versi server: 10.4.21-MariaDB
-- Versi PHP: 7.3.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `toko`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `active_pages`
--

CREATE TABLE `active_pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `enabled` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `active_pages`
--

INSERT INTO `active_pages` (`id`, `name`, `enabled`) VALUES
(1, 'blog', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `bank_accounts`
--

CREATE TABLE `bank_accounts` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `iban` varchar(255) NOT NULL,
  `bank` varchar(255) NOT NULL,
  `bic` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `blog_posts`
--

CREATE TABLE `blog_posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `image` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `time` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `blog_translations`
--

CREATE TABLE `blog_translations` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `abbr` varchar(5) NOT NULL,
  `for_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `brands`
--

CREATE TABLE `brands` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `brands`
--

INSERT INTO `brands` (`id`, `name`) VALUES
(1, 'Dunkin'),
(2, 'J.co'),
(3, 'Krispy Kreme');

-- --------------------------------------------------------

--
-- Struktur dari tabel `confirm_links`
--

CREATE TABLE `confirm_links` (
  `id` int(11) NOT NULL,
  `link` char(32) NOT NULL,
  `for_order` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `confirm_links`
--

INSERT INTO `confirm_links` (`id`, `link`, `for_order`) VALUES
(1, '722be59b1a422ab5df3cda36d4ec5179', 1234),
(2, '182adfd32a1d1afb5073dbc7cf7d3a8d', 1235);

-- --------------------------------------------------------

--
-- Struktur dari tabel `cookie_law`
--

CREATE TABLE `cookie_law` (
  `id` int(10) UNSIGNED NOT NULL,
  `link` varchar(255) NOT NULL,
  `theme` varchar(20) NOT NULL,
  `visibility` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `cookie_law`
--

INSERT INTO `cookie_law` (`id`, `link`, `theme`, `visibility`) VALUES
(1, '', '', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `cookie_law_translations`
--

CREATE TABLE `cookie_law_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `message` varchar(255) NOT NULL,
  `button_text` varchar(50) NOT NULL,
  `learn_more` varchar(50) NOT NULL,
  `abbr` varchar(5) NOT NULL,
  `for_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `cookie_law_translations`
--

INSERT INTO `cookie_law_translations` (`id`, `message`, `button_text`, `learn_more`, `abbr`, `for_id`) VALUES
(1, '', '', '', 'bg', 1),
(2, '', '', '', 'en', 1),
(3, '', '', '', 'gr', 1),
(4, '', '', '', 'id', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `discount_codes`
--

CREATE TABLE `discount_codes` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` varchar(10) NOT NULL,
  `code` varchar(10) NOT NULL,
  `amount` varchar(20) NOT NULL,
  `valid_from_date` int(10) UNSIGNED NOT NULL,
  `valid_to_date` int(10) UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1-enabled, 0-disabled'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `history`
--

CREATE TABLE `history` (
  `id` int(10) UNSIGNED NOT NULL,
  `activity` varchar(255) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `time` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `keys`
--

CREATE TABLE `keys` (
  `id` int(11) NOT NULL,
  `key` varchar(40) NOT NULL,
  `level` int(2) NOT NULL,
  `ignore_limits` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `languages`
--

CREATE TABLE `languages` (
  `id` int(10) UNSIGNED NOT NULL,
  `abbr` varchar(5) NOT NULL,
  `name` varchar(30) NOT NULL,
  `currency` varchar(10) NOT NULL,
  `currencyKey` varchar(5) NOT NULL,
  `flag` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `languages`
--

INSERT INTO `languages` (`id`, `abbr`, `name`, `currency`, `currencyKey`, `flag`) VALUES
(1, 'bg', 'bulgarian', 'лв', 'BGN', 'bg.jpg'),
(2, 'en', 'english', '$', 'USD', 'en.jpg'),
(3, 'gr', 'greece', 'EUR', 'EUR', 'gr.png'),
(4, 'id', 'indonesian', 'RP', 'IDR', 'id.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `orders`
--

CREATE TABLE `orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(11) NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'point to public_users ID',
  `products` text NOT NULL,
  `date` int(10) UNSIGNED NOT NULL,
  `referrer` varchar(255) NOT NULL,
  `clean_referrer` varchar(255) NOT NULL,
  `payment_type` varchar(255) NOT NULL,
  `paypal_status` varchar(10) DEFAULT NULL,
  `processed` tinyint(1) NOT NULL DEFAULT 0,
  `viewed` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'viewed status is change when change processed status',
  `confirmed` tinyint(1) NOT NULL DEFAULT 0,
  `discount_code` varchar(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `orders`
--

INSERT INTO `orders` (`id`, `order_id`, `user_id`, `products`, `date`, `referrer`, `clean_referrer`, `payment_type`, `paypal_status`, `processed`, `viewed`, `confirmed`, `discount_code`) VALUES
(1, 1234, 0, 'a:2:{i:0;a:2:{s:12:\"product_info\";a:17:{s:11:\"vendor_name\";s:7:\"Arrakas\";s:9:\"vendor_id\";s:1:\"1\";s:2:\"id\";s:1:\"1\";s:6:\"folder\";s:10:\"1640743973\";s:5:\"image\";s:16:\"download_(1).jpg\";s:4:\"time\";s:10:\"1640744019\";s:11:\"time_update\";s:1:\"0\";s:10:\"visibility\";s:1:\"1\";s:14:\"shop_categorie\";s:1:\"1\";s:8:\"quantity\";s:3:\"200\";s:11:\"procurement\";s:1:\"0\";s:9:\"in_slider\";s:1:\"0\";s:3:\"url\";s:2:\"_1\";s:16:\"virtual_products\";N;s:8:\"brand_id\";N;s:8:\"position\";s:1:\"1\";s:5:\"price\";s:0:\"\";}s:16:\"product_quantity\";s:1:\"1\";}i:1;a:2:{s:12:\"product_info\";a:17:{s:11:\"vendor_name\";s:7:\"Arrakas\";s:9:\"vendor_id\";s:1:\"1\";s:2:\"id\";s:1:\"2\";s:6:\"folder\";s:10:\"1640744028\";s:5:\"image\";s:42:\"Chocolate-Cake-Donuts-tall-63a-480x360.jpg\";s:4:\"time\";s:10:\"1640744080\";s:11:\"time_update\";s:1:\"0\";s:10:\"visibility\";s:1:\"1\";s:14:\"shop_categorie\";s:1:\"1\";s:8:\"quantity\";s:3:\"200\";s:11:\"procurement\";s:1:\"0\";s:9:\"in_slider\";s:1:\"0\";s:3:\"url\";s:2:\"_2\";s:16:\"virtual_products\";N;s:8:\"brand_id\";N;s:8:\"position\";s:1:\"0\";s:5:\"price\";s:0:\"\";}s:16:\"product_quantity\";s:1:\"1\";}}', 1640744170, 'Direct', 'Direct', 'cashOnDelivery', NULL, 1, 1, 0, ''),
(2, 1235, 2, 'a:2:{i:0;a:2:{s:12:\"product_info\";a:17:{s:11:\"vendor_name\";s:7:\"Arrakas\";s:9:\"vendor_id\";s:1:\"1\";s:2:\"id\";s:1:\"1\";s:6:\"folder\";s:10:\"1640743973\";s:5:\"image\";s:16:\"download_(1).jpg\";s:4:\"time\";s:10:\"1640744019\";s:11:\"time_update\";s:10:\"1640744501\";s:10:\"visibility\";s:1:\"1\";s:14:\"shop_categorie\";s:1:\"1\";s:8:\"quantity\";s:3:\"199\";s:11:\"procurement\";s:1:\"1\";s:9:\"in_slider\";s:1:\"0\";s:3:\"url\";s:2:\"_1\";s:16:\"virtual_products\";N;s:8:\"brand_id\";N;s:8:\"position\";s:1:\"1\";s:5:\"price\";s:5:\"10000\";}s:16:\"product_quantity\";s:1:\"3\";}i:1;a:2:{s:12:\"product_info\";a:17:{s:11:\"vendor_name\";s:7:\"Arrakas\";s:9:\"vendor_id\";s:1:\"1\";s:2:\"id\";s:1:\"2\";s:6:\"folder\";s:10:\"1640744028\";s:5:\"image\";s:42:\"Chocolate-Cake-Donuts-tall-63a-480x360.jpg\";s:4:\"time\";s:10:\"1640744080\";s:11:\"time_update\";s:10:\"1640744472\";s:10:\"visibility\";s:1:\"1\";s:14:\"shop_categorie\";s:1:\"1\";s:8:\"quantity\";s:3:\"199\";s:11:\"procurement\";s:1:\"1\";s:9:\"in_slider\";s:1:\"0\";s:3:\"url\";s:2:\"_2\";s:16:\"virtual_products\";N;s:8:\"brand_id\";N;s:8:\"position\";s:1:\"0\";s:5:\"price\";s:5:\"15000\";}s:16:\"product_quantity\";s:1:\"1\";}}', 1640795051, 'Direct', 'Direct', 'cashOnDelivery', NULL, 1, 1, 0, '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `orders_clients`
--

CREATE TABLE `orders_clients` (
  `id` int(11) NOT NULL,
  `first_name` varchar(500) NOT NULL,
  `last_name` varchar(500) NOT NULL,
  `email` varchar(500) NOT NULL,
  `phone` varchar(500) NOT NULL,
  `address` text NOT NULL,
  `city` varchar(500) NOT NULL,
  `post_code` varchar(500) NOT NULL,
  `notes` text NOT NULL,
  `for_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `orders_clients`
--

INSERT INTO `orders_clients` (`id`, `first_name`, `last_name`, `email`, `phone`, `address`, `city`, `post_code`, `notes`, `for_id`) VALUES
(1, 'd2f86246940d5c078b0c7631d377fa9b0a33a6496f4f9764302fdcd1cbeaeedfb4bbfcd451898911a886181ca9b3be13bfd702a8608ae40d2b9fedf1edc930f5l9VGG3qEjpQaB5vTQm8C2mWMDXgzy+bge9+a8dti3hQ=', '6e686195326edfb94ff681f4462177e02a1566efa0069a84d97773ae912de214ea7352ea539c0bf2faf1f026f525fb82e7c645a3d55ab747a9332973b157b5e64HUlel1sPZu+zoOQDF1z4DXmydQpLsFwGmn4NXoCUz0=', '84edf9eac29e1b5ac7d0210aa8a9da3bdab50b0548f0c33988f0a18d3d82228b6a089e02d7b823b843a0f6eeaec1165239da468dfde3f73be346c5f31799c2f8o+GyIRJOVxxkdiw8znhRwLva0H9+tWSZInaI031fr5z74LuXTfKeCcukNgIOMFaG', 'c7be99fe9f89d6aa860ba68a069eca826ba46b1b80707d5eef01d67feb353ddefb41f9720dac989e287f4bab6186914e7731c03cba845dd2071cee5252062b37GFcWDCeO5fJFQhdePgE0n2Ah5THdXF1CEzIeFu5wseA=', '0c0451f646343c2d4518599bca9147d7cb5c87e243ca00e4ec71a4b19ff70c40090ee4267744013a0409aa01644587f72330e24a6b16bd37d4cd8666c9ad6ae4bESwItlsl40b4fWS/Nxqcjtwz2GBhZ7Xd5PC3CvecgLei+9efiw7ZFnGpjEDvG+U', '44e6882585df4723cefc9b596bcb84f796e0674c177a25964648fb4696ceef9903d49da92b6da1cb44ed218768efc75f0910fbf9801a7fc418f2cd6acefa93fcMd2hkg6UOYhE6OvLhx15X1ULBNkgGU5Kn/BjsFJIuhE=', '9e2ed1eb6efd23e75851836f0a1e37e7ee3942cc3a6694d4adc4ec2006a9f05ff42b988ca54089fc9c843ca5c60fba83673c193c8fe302d5e32d8bd3db39c60fb5qNSpxu7Np++925BP5XplHcqYgYeHOZFSGv/gq5vAs=', 'e595bb82142e882a01af385728e25990aebaf38f316d0ff24e9b0ad6660909d5b9af9249a8fef9582d435935305efac2a78397f9255b920dcb8fd242c8f0b9812hqc5XUgY3vHFY3AzOw+BQ8MYBkPXv0q5ozWfpmUvhk=', 1),
(2, 'daf9fd3a6f701ef42b463ba51b37fd6d31fe3428e3dfd909b7226a0c682e52a59fb7377c74bc2c2e32788cd88a6f59cdbc8e29417e96e4a6dae6e59694120067ACkwdSsFXmT9kijOfAyiHKNEpiKazQFf7nADOwXngPo=', '0f2ea5875912320c8e8c17e901f0ae3c75723610c45ef1f842f316cfe5cd0427a3f351301374729f6061ecb8572c54707d2fa9f95ba62964453558f53d6cd1ca8hzmwpcfTT/6tG2AF6sP9+Jtj986n/f5e+gmZOOe1ZU=', '70583014f1d69f5a96b8ac47ef7bef7763487438ce8f2fbc364d71815a54bb7e895c35b0547c3c05f3785dc2742a1a6a98c97fa152dc338244169c066b591e95arzOvK+ogKkFbQGUNtvDbesx7qBevMeYaWg5M9U5O/w=', '460a2576ad9dec7437eae601d74cca6838d3261002cde0f4a730069b91db7af4b9354f82645fe8db58459f7e86e07f05c9f7170c748c7354679b93f3b3bf8423PBGPDNmrLuvvDQ7U+GUrimCzEmbBLHIkZTVXSzmRZbQ=', '8aaf6d068ae20e1dffc3eaaa7dc55c0f5031490e43afe8d6f9c747b8753d1a06ddf359efd69a559c64b51bffcc5db0188811abb7f44387075c8ea006ac9801791iy3kDBrvglJZmeIRF3vmFVZqaduniP6afsGVbMP69QnmB7P2liWiWTzp9L2JZgD', 'd2ef4fd8da47e47e9eb52d405a965cef548a640e11f186286117d4edbb4d30f22f9dd9441d235cab4e7d743fbf431d049cd606096e37183aacdd4e72544b3d34ZVmKNnkaRQCD4VpjRlXWhdVSIJeFeLG4y2NC4PjKWRQ=', 'f6b0c99a502754fe1b6f3573856767e8a3a533129c979d3f2c9ffc26390f228dea3bdb371b7b10d4c66aba3f51fa9263f21a99730a0eafb00846f6afc5488af7q/HRtESlyat0/ncSKFBUO6DLt+IHG0Ga276TKjkGOi4=', '90976193e3601ed87a92ca14efbbffeab0bec0bc22ffaf967e8819b5bf69949befbb245d0c0db75f734dbc77944d1f32e105e5251445be75e40abfe52eb5242cVdlAtjHxu1MaauTOg6BFj9bO9HbkIWUBTgTflAwrxv4=', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `folder` int(10) UNSIGNED DEFAULT NULL COMMENT 'folder with images',
  `image` varchar(255) NOT NULL,
  `time` int(10) UNSIGNED NOT NULL COMMENT 'time created',
  `time_update` int(10) UNSIGNED NOT NULL COMMENT 'time updated',
  `visibility` tinyint(1) NOT NULL DEFAULT 1,
  `shop_categorie` int(11) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 0,
  `procurement` int(10) UNSIGNED NOT NULL,
  `in_slider` tinyint(1) NOT NULL DEFAULT 0,
  `url` varchar(255) NOT NULL,
  `virtual_products` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `brand_id` int(5) DEFAULT NULL,
  `position` int(10) UNSIGNED NOT NULL,
  `vendor_id` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `products`
--

INSERT INTO `products` (`id`, `folder`, `image`, `time`, `time_update`, `visibility`, `shop_categorie`, `quantity`, `procurement`, `in_slider`, `url`, `virtual_products`, `brand_id`, `position`, `vendor_id`) VALUES
(1, 1640743973, 'download_(1).jpg', 1640744019, 1640744501, 1, 1, 196, 4, 0, '_1', NULL, NULL, 1, 1),
(2, 1640744028, 'Chocolate-Cake-Donuts-tall-63a-480x360.jpg', 1640744080, 1640744472, 1, 1, 198, 2, 0, '_2', NULL, NULL, 0, 1),
(3, NULL, '2020_06_23T12_09_11_mrs_ImageRecipes_142890lrg.jpg', 1640820176, 1640820189, 1, 2, 20, 0, 0, 'Moccacino_3', NULL, 2, 3, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `products_translations`
--

CREATE TABLE `products_translations` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `basic_description` text NOT NULL,
  `price` varchar(20) NOT NULL,
  `old_price` varchar(20) NOT NULL,
  `abbr` varchar(5) NOT NULL,
  `for_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `products_translations`
--

INSERT INTO `products_translations` (`id`, `title`, `description`, `basic_description`, `price`, `old_price`, `abbr`, `for_id`) VALUES
(1, '', '', '', '', '', 'bg', 1),
(2, 'Donat Coklat', '', '', '', '', 'en', 1),
(3, '', '', '', '', '', 'gr', 1),
(4, 'Donat Coklat', '<p>Donat Coklat uenak</p>\r\n', '', '10000', '', 'id', 1),
(5, '', '', '', '', '', 'bg', 2),
(6, 'Donat Coklat Vanila Frosting', '', '', '', '', 'en', 2),
(7, '', '', '', '', '', 'gr', 2),
(8, 'Donat Coklat Vanila Frosting', '<p>Donat coklat dengan frosting vanila</p>\r\n', '', '15000', '', 'id', 2),
(9, '', '', '', '', '', 'bg', 3),
(10, '', '', '', '', '', 'en', 3),
(11, '', '', '', '', '', 'gr', 3),
(12, 'Moccacino', '<p>Minuman Moccacino dingin yang dibuat oleh barista kami</p>\r\n', '', '14000', '', 'id', 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `seo_pages`
--

CREATE TABLE `seo_pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `seo_pages`
--

INSERT INTO `seo_pages` (`id`, `name`) VALUES
(1, 'home'),
(2, 'checkout'),
(3, 'contacts'),
(4, 'blog');

-- --------------------------------------------------------

--
-- Struktur dari tabel `seo_pages_translations`
--

CREATE TABLE `seo_pages_translations` (
  `id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `description` varchar(200) NOT NULL,
  `abbr` varchar(5) NOT NULL,
  `page_type` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `shop_categories`
--

CREATE TABLE `shop_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `sub_for` int(11) NOT NULL,
  `position` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `shop_categories`
--

INSERT INTO `shop_categories` (`id`, `sub_for`, `position`) VALUES
(1, 0, 0),
(2, 0, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `shop_categories_translations`
--

CREATE TABLE `shop_categories_translations` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `abbr` varchar(5) NOT NULL,
  `for_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `shop_categories_translations`
--

INSERT INTO `shop_categories_translations` (`id`, `name`, `abbr`, `for_id`) VALUES
(1, '', 'bg', 1),
(2, 'Food', 'en', 1),
(3, '', 'gr', 1),
(4, 'Makanan', 'id', 1),
(5, '', 'bg', 2),
(6, 'Drink', 'en', 2),
(7, '', 'gr', 2),
(8, 'Minuman', 'id', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `subscribed`
--

CREATE TABLE `subscribed` (
  `id` int(10) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `browser` varchar(255) NOT NULL,
  `ip` varchar(255) NOT NULL,
  `time` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `textual_pages_tanslations`
--

CREATE TABLE `textual_pages_tanslations` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `abbr` varchar(5) NOT NULL,
  `for_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(32) NOT NULL,
  `email` varchar(100) NOT NULL,
  `notify` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'notifications by email',
  `last_login` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `email`, `notify`, `last_login`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'your@email.com', 0, 1640817241);

-- --------------------------------------------------------

--
-- Struktur dari tabel `users_public`
--

CREATE TABLE `users_public` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `password` varchar(40) NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `users_public`
--

INSERT INTO `users_public` (`id`, `name`, `email`, `phone`, `password`, `created`) VALUES
(1, 'Jake Lebowski', 'burneyemaily@gmail.com', '02764582334', '81dc9bdb52d04dc20036dbd8313ed055', '2021-12-29 15:13:52'),
(2, 'Dodi', 'test@gmail.com', '02764582334', '81dc9bdb52d04dc20036dbd8313ed055', '2021-12-29 16:22:09');

-- --------------------------------------------------------

--
-- Struktur dari tabel `value_store`
--

CREATE TABLE `value_store` (
  `id` int(10) UNSIGNED NOT NULL,
  `thekey` varchar(50) NOT NULL,
  `value` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `value_store`
--

INSERT INTO `value_store` (`id`, `thekey`, `value`) VALUES
(1, 'sitelogo', 'gambar-logo-catering-4.jpg'),
(2, 'navitext', ''),
(3, 'footercopyright', 'Powered by Sun © All right reserved. '),
(4, 'contactspage', 'Hello dear client'),
(5, 'footerContactAddr', ''),
(6, 'footerContactEmail', 'support@shop.dev'),
(7, 'footerContactPhone', ''),
(8, 'googleMaps', '42.671840, 83.279163'),
(9, 'footerAboutUs', ''),
(10, 'footerSocialFacebook', ''),
(11, 'footerSocialTwitter', ''),
(12, 'footerSocialGooglePlus', ''),
(13, 'footerSocialPinterest', ''),
(14, 'footerSocialYoutube', ''),
(16, 'contactsEmailTo', 'contacts@shop.dev'),
(17, 'shippingOrder', '1'),
(18, 'addJs', ''),
(19, 'publicQuantity', '1'),
(20, 'paypal_email', ''),
(21, 'paypal_sandbox', '0'),
(22, 'publicDateAdded', '0'),
(23, 'googleApi', ''),
(24, 'template', 'redlabel'),
(25, 'cashondelivery_visibility', '1'),
(26, 'showBrands', '1'),
(27, 'showInSlider', '0'),
(28, 'codeDiscounts', '1'),
(29, 'virtualProducts', '0'),
(30, 'multiVendor', '1'),
(31, 'outOfStock', '1'),
(32, 'hideBuyButtonsOfOutOfStock', '1'),
(33, 'moreInfoBtn', ''),
(34, 'refreshAfterAddToCart', '1');

-- --------------------------------------------------------

--
-- Struktur dari tabel `vendors`
--

CREATE TABLE `vendors` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `url` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `vendors`
--

INSERT INTO `vendors` (`id`, `name`, `url`, `email`, `password`, `updated_at`, `created_at`) VALUES
(1, 'Arrakas', 'Momentum', 'admin@gmail.com', '$2y$10$bjbLbYLfdg5RtComfzZnSe6uh9I/7Y1c.yMD.pUORn8Q8NmMThSli', '2021-12-29 00:42:15', '2021-12-29 00:42:15'),
(2, NULL, '', 'user1@gmail.com', '$2y$10$618MIPjq.Dqsv64SJYKAU.pMM3dhSFjhfzhREnKDGtGcEqo1YQae2', '2021-12-29 10:17:51', '2021-12-29 10:17:51');

-- --------------------------------------------------------

--
-- Struktur dari tabel `vendors_orders`
--

CREATE TABLE `vendors_orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(11) NOT NULL,
  `products` text NOT NULL,
  `date` int(10) UNSIGNED NOT NULL,
  `referrer` varchar(255) NOT NULL,
  `clean_referrer` varchar(255) NOT NULL,
  `payment_type` varchar(255) NOT NULL,
  `paypal_status` varchar(10) DEFAULT NULL,
  `processed` tinyint(1) NOT NULL DEFAULT 0,
  `viewed` tinyint(1) NOT NULL DEFAULT 0,
  `confirmed` tinyint(1) NOT NULL DEFAULT 0,
  `discount_code` varchar(20) NOT NULL,
  `vendor_id` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `vendors_orders`
--

INSERT INTO `vendors_orders` (`id`, `order_id`, `products`, `date`, `referrer`, `clean_referrer`, `payment_type`, `paypal_status`, `processed`, `viewed`, `confirmed`, `discount_code`, `vendor_id`) VALUES
(1, 1234, 'a:1:{i:1;s:1:\"1\";}', 1640744170, 'Direct', 'Direct', 'cashOnDelivery', NULL, 0, 0, 0, '', 1),
(2, 1235, 'a:1:{i:2;s:1:\"1\";}', 1640744171, 'Direct', 'Direct', 'cashOnDelivery', NULL, 0, 0, 0, '', 1),
(3, 1236, 'a:1:{i:1;s:1:\"3\";}', 1640795051, 'Direct', 'Direct', 'cashOnDelivery', NULL, 0, 0, 0, '', 1),
(4, 1237, 'a:1:{i:2;s:1:\"1\";}', 1640795051, 'Direct', 'Direct', 'cashOnDelivery', NULL, 0, 0, 0, '', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `vendors_orders_clients`
--

CREATE TABLE `vendors_orders_clients` (
  `id` int(11) NOT NULL,
  `first_name` varchar(500) NOT NULL,
  `last_name` varchar(500) NOT NULL,
  `email` varchar(500) NOT NULL,
  `phone` varchar(500) NOT NULL,
  `address` text NOT NULL,
  `city` varchar(500) NOT NULL,
  `post_code` varchar(500) NOT NULL,
  `notes` text NOT NULL,
  `for_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `vendors_orders_clients`
--

INSERT INTO `vendors_orders_clients` (`id`, `first_name`, `last_name`, `email`, `phone`, `address`, `city`, `post_code`, `notes`, `for_id`) VALUES
(1, 'ffbab17abe0be1f8fdaa72ef7715930c3901627a6eb4230ed97d287224cabdfc2161bde822a853d372e2f1f67d1d1fb5c1726b65835b15821d35799fa13cd653JF7JbbbSoi0U+tHLL9KlaxRgHMCrEnfj8qvF1Qz6lXg=', 'cb7d859453f7d0c0071863c5db070e1a6537d43a0737077ffedc550ede806734223c092d4d7a595383668f89f07da267fc08d076925c4a90fee608963e44204aZXN2C2kLfX2A3IKQOmSn5c5AAwgFX4RC8Y7Ki0qvn40=', 'a7d6a566b454ff1f1b9baffc8f6177057feba65d5e3af328f1349a308c1543ce52b8ddf4e3e9c407836ca5e7ab377611a6af2ae907b67fb356131d8abbdff45fPFyAZ0mZa0CWhB/Sn//CjICYLjG6sC5CwDrbjeQplnIYUoxCWLz6QVLtMti22/ms', '15985fafa7aa1ceecdc203779f0ebd080a98f02130e29f5aad4c39083bab792c30c6bc0eafa72273928fbf03c054c5a4d696f862ab927cdce8b945af39614c81mx/iO+AtYfEkMz8oAhGKkGZy/iLkpSVDQpJAb+/JQDU=', '0f2dfa56eb768241da1e0f72ac9e2af1a6e57c8da60f384b9ddf54222c589ad6a5ce6152f86a9347323baf3203e795b1cf1fe35b855a093a16662d324607e8eexq9sd76j5NE3O/y8wOSV0uEICJwozazliJMBNyEngmmu95t7UeyW8qmeycV0A+Jk', '730e30ea97d9d8ff41fb04a0dfb8a5c0987332cabc4cad48f8c7fce0b3b29941167d480a5d814c302af440be923c2f20821aa6baae6542b19d80d57fc707367ehSPmJH6y0ImC+PphZU2CzKICOZaGMXnqoEWlm6lrzYc=', '6998a546ca427a1ab88a0da95ad2c9cc3935a0f9f967c580f5f3c3d847885230cbaf51673273747b1baeb98e44caafee0de2f6344418a043810a25694328988cwqWiez1S4GjmzNUpcDHyU3l1EAV72R4ANYfCYtVXr4o=', '61b5e513f0df2100bad742e53ff4e65d1c1091c0fbbda1c893d0b1e18a1a0eb5b2c097afe7bcbbece57b6bc9cdc8cc8e3ba350b874420f8a94c951b2bae6280fUdj/OV9KsSTyadgQkOUOeBmnUB1Zen6+MYl/PQ5RlmM=', 1),
(2, '4bcead43454ace74537436848c2200a8f73001ca49bc2e7891e04d88d242e535f09e5ad4345ad30d10f4df575a14ad1bfcb77748bde35a6d8704695ce7556ed4v2hE8X1bGZwtycPAoc8jENGKCSEu/soTw9YIxiSwy4I=', '1f35eaae988a21e0a749e1486689aaf69ea907ede2cdce2b83bbe93d0fd1039bfdfb0443fbfc542f71b3ce628379ef225608a27e2984e233d4e013b83b6be370+esg1fBPbzaK2+IBeRMj+x2VQigb6/QCqOMoEd7hYiE=', '712f16eacf3eaf1249f9f6e7a80d3d7c49688988fd58e319939282852ee25cf6a324e54c4bd73ad47189f580741e96cf7fe39a071fc275a24c53396f91d30b5flcdNfsqMwWZegaUhKkihphOmotOjQ2IkOkaWg2h30e09Dr0k3Inn3cXPexj/lUPT', '0caf7ae0be3e1800fccb4c9a610f24679397540a593a054aa4d2635c67e88e6056bc92371cf1650090d5f39c6e86a8475f8903b8a5b0caec991bffc6621107b7+bX81IVxutVOp3j7I7gTrZbzC5hMe90i1MjG+kTaPNM=', '324ac7d44f19ca7e9ce8e1326f24f3266f7c5c7b598f6bbd382c31b748ea7f782870a818eb1b6194589152d27eff15e0f748cf2da81143e711b7f801ad56a920eA3GHrgE12phLlfjG6xv8HtyLDLkD1sEgiBP/rtEOZcz262tAKLZ5k5VBjSW5zUQ', '240e7cf7fbe52353480cec104930cdf47beee3fd9c0ccd4c6f39574b5d92f4c3d7a45f751c0b8eb7167f1a45377f2f805b7b297ce6a2b839c3541aad71d93441GERPjkAMzOHOpLWMTMjAHLtBuBGWnC0cNWWW6ve18So=', 'd1c18f2242e949377dd0bc0483743f8b60d3b9067b8a075a9c355b6dfe83c60e2c77f42e4a138cbab0920cdf45b2fcdddc41f15ebcca09cc5a0019bea38c16e2O3Z6YOBYJsj0ji5tNC/s6EFUgy9VqtGWiTHcCuoyXz4=', '3faa087b5c6cef919f1bebdbda3352d07817a6616c86e4b63b099c6df5509a7c216ed23a414b5e58a8d96400a7cb40ecd2e64d9dc3b414f8a0b87b921cdb2384MA25HezVyQcaL+kDrbjL15sBI3UHFuncgWUxTxC+D80=', 2),
(3, '753d5e03dda5c163774510de81b7cfa002e9e32cd207f52b42c38a3c4e215f8c7b2f3e0f48419c51e28e0e3e9435d85ac9d4d2006ece256ff11400966aa8ce9a5HBONWs/TGb4SfLm0atuEFKqgYMM88qJ1s99G8r1mhU=', '94279ca1d354b42e568d71af1bdda03c8cf5ebc9c83340a14718bb81c5e2da12bc24ff552c563678ed5b5b521d7f555395b5dfcce6f0052034c457b537831cfbqPi/maH8edj316J1x/khYfzUqzy1DkimEBn9JuUQKBY=', '8c11f2c44aa5377f2e0d92564f25a2eb5a1ab77b66fe9d0acb35531ec9f70c21bf0863ac539f45854afbb967747d37d9ae8cca94a3b369303b1aa38832e0094aloQoRoeHs4SlpH55Kt0VmUKII+BSTwCyPTrgC9TGvQQ=', '2b3ae9710cbf553964312d7f0beed1eb316664b8effd6bfcb1d74a75c3257d323563553ed5e6ee7533d8f86db419f2782cd60918b8dda6ca4b95172bb1729c32AmEDgOxQV1eGvShXLf3U5YRCOxl++4/ie6UIlHCcFe8=', 'ab5ee9e91cc07cb6780d419a8f2d73af77aae2b691883dee790d2eba47713507d77d47a7fd768a9de9fab70a63f7373e05d937701bf07dd8535d915b7e23a68cs0QqfKLj5WvTP9dcK+9yRs2VTyZFQAJL7z0UOtX2RkDHTAmMi08lBChAxMCjNVXK', '966b05f262bd93c8580c6688042ec87909c0b82a26954d90ca115be508baa57e2e3ac20585c6ce702d495096a454c227636d66e84b7d373408c2bb047b3b6cc0ekgfb2emeCKIDiJDlSuq8Eddix7mVQ7uMK7mXmcxabY=', '3cdc371e36f68ea497bcd31381bf26bd729fa80923789278c12922cca423269faf1a86cbf61fc649479fe5514f4b379be8f3ab176a00f5f40630c0a3112082a4kLXAkTzcsQwvLPQk3ETUD1BdcmMbc8N6oHVKNcSguW8=', 'e483c700ee37e360d4506c47facfe132c5dbdf42dfdc9bf5121402639b8dd1c082880d63541a1db593de39122e48968cf061af849878688280bb33ec68022f48hDLHhDW+EsCR+olql6eQGMBo46exU2dS07nts5t0ooQ=', 3),
(4, 'cfe6a08925b158d2a8fe7af1c7caa2b3919622f1e9bfbd3568e22cb2f2c0f819e5bee89fca32affda87e81601a3ab3dfb2f4e8cffe9b68f50e0ae8316876857aSFMwo7RBQzCAUVErYoTtPUcwSsiXtsv2lcv20ikoh+M=', '99f99b401a4444c27cc59e1d3f1aace23910e5a2264642a69234b3a3ba95b54d37d765eedfd8d350b027ee7443493671ff42a72f518be01f7a4bfa635a5ed22elwyXXLW/HB5yQRsiOD5MqeM3Zbzt/yBDhZo6OyUTLrM=', 'a84638a1530961fb3e14e02798dd50844bae0927fa46f255a7179f6b62d3729af33ec0f73e7eed6e5fd5fa3f3eea71c359d362b5c17c40a50347e50924122db2N6n3fGMaZ3whgQ9qBD/twGO2ytAjeWyUHYIbSTFpADo=', 'cda73f217a2802282e4203e869f2683102ff5088a3104c0a0e3ffba3476d785fd830a787a094d4b362b224d9de78d5556f9b7fa9ec34e1502b7f64da0126cd1c6fwfqAtDs/C9GH2vfN8Tq7jWJQ23V3HLCJ9tUVZXnts=', '8898c9c1fae24f3287e4d31fb7a4cd95f5b27db96274407c89f388973c81f80cc178b074c23f514cce63893d00cc7efd7b3da4cadd3ccbdba280cf5b2383a2f7AgpEJEWvYKUqwg5PNQ1NwN3loRrRLJ7bFu0Y/htXEHYdgL3TgfOgrghJkDzGEo/P', '867b24808ea2fb3554c6ecca4bfa7d513ec3932705b5e89846c006ed7dbd93e3c7f75ee4c1ebab63614b93dc6fae6ae91ff97a074398ee869483a840f51bde44GtqRm7z43oejAks16dz32TZleiCWoD6FH+MyKpxNv/c=', 'f251e603c3c4a45700d39e14bcfc0bb98f5c31d996b11ed582232435c647c150cf73f4762563bf5a166ae5e68c713832173487fa9b1e37597459e66137123d16jQXbpSeXKJAm5EUtRDrJlfXc2ECcysPhf/PGyco9eGg=', 'c7a0e8ed0f9bc0dff311f1d34497b2d64424ea3dc0cd1cd3c085b9e8ef07828b58a456c65d23d0a3f72055794e5faa961d09f12d09b35f380fae6b16330c4570aBXd+FHpONhfdVoJiWd6QDbfht+6yC6HhHCwuZwVgx8=', 4);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `active_pages`
--
ALTER TABLE `active_pages`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `bank_accounts`
--
ALTER TABLE `bank_accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `blog_posts`
--
ALTER TABLE `blog_posts`
  ADD UNIQUE KEY `id` (`id`);

--
-- Indeks untuk tabel `blog_translations`
--
ALTER TABLE `blog_translations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `confirm_links`
--
ALTER TABLE `confirm_links`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `cookie_law`
--
ALTER TABLE `cookie_law`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `cookie_law_translations`
--
ALTER TABLE `cookie_law_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQUE` (`abbr`,`for_id`) USING BTREE;

--
-- Indeks untuk tabel `discount_codes`
--
ALTER TABLE `discount_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `history`
--
ALTER TABLE `history`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `keys`
--
ALTER TABLE `keys`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `orders_clients`
--
ALTER TABLE `orders_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `products_translations`
--
ALTER TABLE `products_translations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `seo_pages`
--
ALTER TABLE `seo_pages`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `seo_pages_translations`
--
ALTER TABLE `seo_pages_translations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `shop_categories`
--
ALTER TABLE `shop_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `shop_categories_translations`
--
ALTER TABLE `shop_categories_translations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `subscribed`
--
ALTER TABLE `subscribed`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `textual_pages_tanslations`
--
ALTER TABLE `textual_pages_tanslations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users_public`
--
ALTER TABLE `users_public`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `value_store`
--
ALTER TABLE `value_store`
  ADD PRIMARY KEY (`id`),
  ADD KEY `key` (`thekey`);

--
-- Indeks untuk tabel `vendors`
--
ALTER TABLE `vendors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique` (`email`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indeks untuk tabel `vendors_orders`
--
ALTER TABLE `vendors_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `vendors_orders_clients`
--
ALTER TABLE `vendors_orders_clients`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `active_pages`
--
ALTER TABLE `active_pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `bank_accounts`
--
ALTER TABLE `bank_accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `blog_posts`
--
ALTER TABLE `blog_posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `blog_translations`
--
ALTER TABLE `blog_translations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `confirm_links`
--
ALTER TABLE `confirm_links`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `cookie_law`
--
ALTER TABLE `cookie_law`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `cookie_law_translations`
--
ALTER TABLE `cookie_law_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `discount_codes`
--
ALTER TABLE `discount_codes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `history`
--
ALTER TABLE `history`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `keys`
--
ALTER TABLE `keys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `orders_clients`
--
ALTER TABLE `orders_clients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `products_translations`
--
ALTER TABLE `products_translations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `seo_pages`
--
ALTER TABLE `seo_pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `seo_pages_translations`
--
ALTER TABLE `seo_pages_translations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `shop_categories`
--
ALTER TABLE `shop_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `shop_categories_translations`
--
ALTER TABLE `shop_categories_translations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `subscribed`
--
ALTER TABLE `subscribed`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `textual_pages_tanslations`
--
ALTER TABLE `textual_pages_tanslations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `users_public`
--
ALTER TABLE `users_public`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `value_store`
--
ALTER TABLE `value_store`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT untuk tabel `vendors`
--
ALTER TABLE `vendors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `vendors_orders`
--
ALTER TABLE `vendors_orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `vendors_orders_clients`
--
ALTER TABLE `vendors_orders_clients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
