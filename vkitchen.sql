-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 24, 2025 at 02:23 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vkitchen`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
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
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_04_23_233007_create_recipes_table', 1);

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
-- Table structure for table `recipes`
--

CREATE TABLE `recipes` (
  `rid` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `type` enum('French','Italian','Chinese','Indian','Mexican','Others') NOT NULL,
  `cookingtime` int(10) UNSIGNED NOT NULL,
  `ingredients` text NOT NULL,
  `instructions` text NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `recipes`
--

INSERT INTO `recipes` (`rid`, `name`, `description`, `type`, `cookingtime`, `ingredients`, `instructions`, `image`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'est maiores sed', 'Est aut laudantium praesentium sint molestias voluptas molestiae cupiditate corrupti aut beatae.', 'Chinese', 41, 'Et sunt facilis laudantium. Quae repellat nihil in sunt. Quo et rem recusandae molestiae accusantium corrupti.', 'Ad est numquam ea suscipit deleniti. Aut neque officia quis consequuntur hic amet. Perferendis culpa non quia asperiores sit. Quo corporis non et quia cumque. Repellendus tempore aut eum ex beatae quo placeat ipsa. Cumque unde ipsum inventore non quisquam sapiente.', NULL, 1, '2025-04-24 10:18:47', '2025-04-24 10:18:47'),
(2, 'optio autem alias', 'Fugiat velit nihil commodi quo aut dolores id vero commodi.', 'Indian', 72, 'Vero sit ipsa praesentium et molestiae ipsam optio asperiores. Itaque amet porro quod quo itaque.', 'Cupiditate distinctio praesentium assumenda non sint soluta sit sequi. Eius aut dolor inventore sunt voluptatem ut. Maxime porro vel vel temporibus dolorem. Quia rerum enim error non.', 'recipes/Italian_2.jpg', 1, '2025-04-24 10:18:47', '2025-04-24 10:18:47'),
(3, 'sint ut soluta', 'Fugit quia aspernatur enim voluptatum voluptatum culpa quo.', 'Mexican', 47, 'Cum eligendi porro amet inventore. Dolore perferendis quia magni et eligendi. Consequuntur numquam sunt autem voluptatem dolorem sint.', 'Nesciunt expedita quae asperiores quo. Aut quisquam fugit similique accusantium. Quo esse adipisci consequatur omnis enim nisi sint. Rerum atque fugiat numquam.', NULL, 1, '2025-04-24 10:18:47', '2025-04-24 10:18:47'),
(4, 'possimus voluptatibus aut', 'Cumque quam dolorem est nemo ut possimus dolor dolorem repudiandae ullam incidunt voluptas laborum.', 'Others', 10, 'Vero eum atque est aut. Voluptatibus non in velit nemo porro aut porro. Soluta ullam deleniti aspernatur eum explicabo ducimus illo.', 'Deserunt occaecati ad voluptates ipsum. Eaque aut omnis nobis eligendi similique non qui. Quis ullam quia tenetur sit nostrum. Praesentium quo quo dolorum optio maxime. Id maxime officiis hic quis ut.', NULL, 1, '2025-04-24 10:18:47', '2025-04-24 10:18:47'),
(5, 'incidunt quasi et', 'Incidunt aliquid quia velit quaerat iste ipsum eveniet ipsa aut et placeat.', 'Mexican', 87, 'Veniam odio doloribus voluptatem alias quos occaecati ut. Nihil est aut reprehenderit illo veniam debitis eius dicta.', 'Provident blanditiis ipsum sed odit soluta inventore. Qui voluptatem iste explicabo sunt doloremque omnis pariatur. Aspernatur earum tempora aut.', NULL, 1, '2025-04-24 10:18:47', '2025-04-24 10:18:47'),
(6, 'consequatur adipisci sint', 'Deserunt voluptatem qui nisi quae fuga ut.', 'Mexican', 33, 'Ut minus temporibus consequatur ducimus veniam ab numquam. Magni necessitatibus quidem eius vero asperiores ipsam. Et deleniti id fugit totam maxime omnis.', 'Quisquam culpa nihil harum ut voluptas. Qui aut tenetur laudantium exercitationem atque. Asperiores quia nisi consequatur illo et officia. Enim et at laborum atque iure odit quia. Iste dolor molestias amet quis eum cum ut.', NULL, 1, '2025-04-24 10:18:47', '2025-04-24 10:18:47'),
(7, 'pariatur cupiditate hic', 'Consectetur dolorum magni quo minus et non tempora animi ut quam iure eos.', 'French', 79, 'Iste quo dignissimos consequatur quo. Autem consequatur molestiae molestiae nobis atque quod enim.', 'Vel magnam et est veniam dolores. Sed inventore aut voluptas esse laborum quo eum. Fuga debitis aperiam tempora voluptatum saepe. Natus facere qui tenetur quaerat itaque a. Sit reiciendis at nulla.', 'recipes/Indian_3.jpg', 1, '2025-04-24 10:18:47', '2025-04-24 10:18:47'),
(8, 'tempore ducimus tenetur', 'Ut odit unde illum iure aut laudantium et et.', 'Others', 13, 'Sapiente et ducimus rem soluta veniam magni ratione. Quia excepturi vel ratione non omnis. Voluptatibus rerum recusandae aut molestias.', 'Voluptas beatae facilis nostrum eius ipsam ad qui. Itaque et facere quia perspiciatis quos sunt et. Harum rerum est modi ut perferendis. Excepturi quae neque molestiae saepe omnis provident voluptatem. Itaque enim ea ipsa. Est sunt odio consequuntur excepturi totam id.', NULL, 1, '2025-04-24 10:18:47', '2025-04-24 10:18:47'),
(9, 'quis soluta rem', 'Dolor est illum eligendi soluta sit soluta.', 'Chinese', 29, 'Facere expedita rerum sed quasi vero. Laudantium incidunt magnam quos reiciendis repellat harum. Debitis quisquam sunt aut omnis tempora eos voluptatibus.', 'Eligendi voluptatem saepe et voluptatem voluptas hic. Qui animi quam quibusdam facilis illo molestias hic. Reiciendis consequuntur dolor rem.', 'recipes/Italian_2.jpg', 1, '2025-04-24 10:18:47', '2025-04-24 10:18:47'),
(10, 'quia aliquid et', 'Aut dolore sed rem vel iste est nihil harum voluptatem nostrum aut.', 'Others', 44, 'Quas maiores corporis odit consequatur unde aliquam sed. Et maiores sequi ipsum sequi incidunt vel enim. Cupiditate est incidunt labore tempora ut.', 'Blanditiis earum est amet asperiores rem. Quidem culpa eos debitis nobis dolores. Non dolorem quia dolores ut nulla harum nihil quia. Explicabo dolores voluptatum et aspernatur reiciendis. Expedita earum quia et a dolorem officiis. Ducimus sed voluptates totam aperiam ullam quidem aut.', 'recipes/Mexican_1.jpg', 1, '2025-04-24 10:18:47', '2025-04-24 10:18:47'),
(11, 'similique qui adipisci', 'Iure eligendi autem iusto soluta esse corrupti natus nesciunt aliquam.', 'Italian', 23, 'Fuga ad beatae voluptatum quam voluptatem. Quia et non repudiandae minus dolores expedita. Reprehenderit sint accusantium odio non eaque voluptas.', 'Nostrum molestiae facere dolorem quia sed eum. Et veritatis dolorem perspiciatis perspiciatis eos veritatis voluptatibus. Animi beatae enim odio qui.', 'recipes/Mexican_2.jpg', 1, '2025-04-24 10:18:47', '2025-04-24 10:18:47'),
(12, 'ipsa quia aut', 'Numquam minima cumque voluptate sed nesciunt sed sed minus vero.', 'Chinese', 70, 'Qui temporibus sapiente laudantium ut qui sed. Et nihil omnis rerum delectus qui. Aliquam hic vero voluptatibus aut tempore quibusdam.', 'Sed natus autem sed et. Aut explicabo quod doloribus laudantium accusamus numquam dolor consequatur. Molestiae aliquam fuga aperiam nisi. Qui enim sunt quasi.', 'recipes/Indian_1.jpg', 1, '2025-04-24 10:18:47', '2025-04-24 10:18:47'),
(13, 'hic maxime repellendus', 'Labore aliquam repudiandae sunt ipsa ut illo nostrum quae nam enim provident.', 'Indian', 105, 'Rem dolor molestiae odit officia voluptas voluptas. Nisi qui autem quibusdam. Dolor repellat cupiditate nemo minus.', 'Natus optio non laborum repellendus. Et quis et odit sit. Et consequatur harum sit repudiandae error eaque laboriosam.', NULL, 1, '2025-04-24 10:18:47', '2025-04-24 10:18:47'),
(14, 'ratione in facilis', 'Hic quia voluptatem illo quia rerum ipsam sunt omnis vel iusto.', 'Others', 101, 'Vero aperiam repellat praesentium cumque rerum alias sapiente. Cum non dolorum occaecati. Beatae ipsum exercitationem qui blanditiis.', 'Velit odio dicta provident cumque nisi facere. Provident et id voluptatem eius dolore aut. Minima veritatis blanditiis reiciendis sed molestiae. Voluptatum aut molestiae tempore dolor quaerat.', NULL, 1, '2025-04-24 10:18:47', '2025-04-24 10:18:47'),
(15, 'quo ex aut', 'Perferendis tenetur vitae tempora deserunt qui qui perferendis sunt non quaerat.', 'Italian', 65, 'Mollitia fugiat illum et qui consequatur. Eligendi voluptatem libero voluptas aut quia. Illum eaque expedita aperiam ducimus repudiandae odit.', 'Omnis voluptas esse labore consequatur. Totam quia occaecati omnis est. Quibusdam dolorem quasi non similique in mollitia deleniti sit. Aut quia sint consequatur voluptatum voluptatibus qui quisquam.', 'recipes/Chinese_1.jpg', 1, '2025-04-24 10:18:47', '2025-04-24 10:18:47'),
(16, '\'; DROP TABLE recipes; --', '<b>Injected Description</b>', 'Others', 30, '<li><script>alert(\'XSS\')</script></li>', '<p onclick=\"alert(\'Injected\')\">Click me to test</p>', 'recipes/7gARSqdeKykgsShDgEdZhd17Q0JpZVOvcOSPENRu.jpg', 2, '2025-04-24 10:51:02', '2025-04-24 10:51:02');

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
('B56yME8ONUtxcQKO7ZmdznBM22dwDZkCVUhwlWFY', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiMDVQNkN3VkVGVHZqMWJKeW1lQjRJMjMwcnJsMVVTZHRaOHhxMFgyVSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9yZWNpcGVzLzE2L2VkaXQiO31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToyO30=', 1745495508);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Demo User', 'demo@example.com', '2025-04-24 10:18:47', '$2y$12$9oeS5Yfic9b/Eyg/jNZDEu8Vy58ppoSuCxTcUuCfVOlvqushB0UxO', 'alEcgKsIkizA1zSqLtGwPCkt1lwTsXjKeFUpfZsQrnUwTQ7VsOXvaCOZELw5', '2025-04-24 10:18:47', '2025-04-24 10:18:47'),
(2, 'test1', 'test1@email.com', NULL, '$2y$12$GR1vXxu1Jj1N1FDAXkToh.i.jm9EKN0/dzSbAG9YXOR53SH9KRxai', NULL, '2025-04-24 10:22:34', '2025-04-24 10:22:34');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `recipes`
--
ALTER TABLE `recipes`
  ADD PRIMARY KEY (`rid`),
  ADD KEY `recipes_user_id_foreign` (`user_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

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
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `recipes`
--
ALTER TABLE `recipes`
  MODIFY `rid` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `recipes`
--
ALTER TABLE `recipes`
  ADD CONSTRAINT `recipes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
