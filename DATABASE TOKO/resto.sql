-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 03 Mar 2023 pada 04.05
-- Versi server: 10.4.24-MariaDB
-- Versi PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `resto`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
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
-- Struktur dari tabel `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` int(10) UNSIGNED NOT NULL,
  `nama_kategori` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `nama_kategori`, `created_at`, `updated_at`) VALUES
(1, 'cemilan', '2023-01-01 22:22:30', '2023-01-01 22:22:47'),
(2, 'minuman', '2023-01-01 22:23:00', '2023-01-01 22:23:00'),
(3, 'makanan', '2023-01-06 02:26:20', '2023-01-06 02:26:20'),
(4, 'sembako', '2023-01-06 02:26:29', '2023-01-06 02:26:29');

-- --------------------------------------------------------

--
-- Struktur dari tabel `member`
--

CREATE TABLE `member` (
  `id_member` int(10) UNSIGNED NOT NULL,
  `kode_member` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telepon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `member`
--

INSERT INTO `member` (`id_member`, `kode_member`, `nama`, `alamat`, `telepon`, `created_at`, `updated_at`) VALUES
(1, '00001', 'nur winarni', 'Banjarsari', '085677453427', '2023-01-01 22:42:19', '2023-01-06 02:36:25'),
(2, '00002', 'bima wikarya', 'Banyuagung', '085766349275', '2023-01-06 02:36:04', '2023-01-06 02:36:43');

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(5, '2014_10_12_000000_create_users_table', 1),
(6, '2014_10_12_100000_create_password_resets_table', 1),
(7, '2019_08_19_000000_create_failed_jobs_table', 1),
(8, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(9, '2023_01_01_100638_tambah_kolom_baru_to_users_table', 1),
(10, '2023_01_01_101336_buat_kategori_table', 2),
(11, '2023_01_01_102027_buat_produk_table', 2),
(12, '2023_01_01_102741_buat_supplier_table', 3),
(13, '2023_01_01_103002_buat_pembelian_table', 3),
(14, '2023_01_01_103023_buat_pembelian_detail_table', 3),
(15, '2023_01_01_103111_buat_penjualan_table', 3),
(16, '2023_01_01_103135_buat_penjualan_detail_table', 3),
(17, '2023_01_01_103232_buat_setting_table', 3),
(18, '2023_01_01_104515_buat_pengeluaran_table', 3),
(19, '2023_01_01_104931_create_member_table', 4),
(20, '2014_10_12_200000_add_two_factor_columns_to_users_table', 5),
(21, '2023_01_01_110009_create_sessions_table', 5),
(22, '2022_12_26_061204_tambah_kode_produk_to_produk_table', 6),
(23, '2022_12_30_025950_tambah_diskon_to_setting_table', 7),
(24, '2022_12_30_132810_edit_id_member_to_penjualan_table', 7),
(25, '2023_01_02_053000_tambah_foreign_key_to_produk_table', 8);

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembelian`
--

CREATE TABLE `pembelian` (
  `id_pembelian` int(10) UNSIGNED NOT NULL,
  `id_supplier` int(11) NOT NULL,
  `total_item` int(11) NOT NULL,
  `total_harga` int(11) NOT NULL,
  `diskon` tinyint(4) NOT NULL DEFAULT 0,
  `bayar` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `pembelian`
--

INSERT INTO `pembelian` (`id_pembelian`, `id_supplier`, `total_item`, `total_harga`, `diskon`, `bayar`, `created_at`, `updated_at`) VALUES
(1, 1, 200, 180000, 5, 171000, '2023-01-01 22:43:20', '2023-01-01 22:50:24'),
(2, 1, 0, 0, 0, 0, '2023-01-03 09:07:17', '2023-01-03 09:07:17'),
(3, 1, 0, 0, 0, 0, '2023-01-04 07:35:34', '2023-01-04 07:35:34'),
(4, 1, 1, 900, 0, 900, '2023-01-04 07:35:35', '2023-01-04 07:36:06'),
(5, 3, 100, 6700000, 10, 6030000, '2023-01-06 02:54:42', '2023-01-06 02:55:21'),
(6, 3, 50, 100000, 0, 100000, '2023-01-06 03:01:52', '2023-01-06 03:02:15'),
(7, 3, 0, 0, 0, 0, '2023-01-08 09:58:13', '2023-01-08 09:58:13'),
(8, 3, 0, 0, 0, 0, '2023-02-02 02:43:04', '2023-02-02 02:43:04'),
(9, 3, 0, 0, 0, 0, '2023-02-07 02:45:55', '2023-02-07 02:45:55');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembelian_detail`
--

CREATE TABLE `pembelian_detail` (
  `id_pembelian_detail` int(10) UNSIGNED NOT NULL,
  `id_pembelian` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `harga_beli` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `subtotal` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `pembelian_detail`
--

INSERT INTO `pembelian_detail` (`id_pembelian_detail`, `id_pembelian`, `id_produk`, `harga_beli`, `jumlah`, `subtotal`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 900, 2000, 1800000, '2023-01-01 22:50:01', '2023-01-02 08:02:18'),
(2, 4, 1, 900, 1, 900, '2023-01-04 07:35:58', '2023-01-04 07:35:58'),
(3, 5, 5, 67000, 100, 6700000, '2023-01-06 02:54:49', '2023-01-06 02:55:04'),
(4, 6, 2, 2000, 50, 100000, '2023-01-06 03:02:01', '2023-01-06 03:02:09');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengeluaran`
--

CREATE TABLE `pengeluaran` (
  `id_pengeluaran` int(10) UNSIGNED NOT NULL,
  `deskripsi` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `nominal` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `pengeluaran`
--

INSERT INTO `pengeluaran` (`id_pengeluaran`, `deskripsi`, `nominal`, `created_at`, `updated_at`) VALUES
(1, 'Jajan', 1000000, '2023-01-02 13:52:30', '2023-01-02 13:52:30'),
(2, 'mbas jajan', 100000, '2023-01-04 07:34:51', '2023-01-04 07:34:51'),
(3, 'listrik', 100000, '2023-01-06 06:36:33', '2023-01-06 06:36:33');

-- --------------------------------------------------------

--
-- Struktur dari tabel `penjualan`
--

CREATE TABLE `penjualan` (
  `id_penjualan` int(10) UNSIGNED NOT NULL,
  `id_member` int(11) DEFAULT NULL,
  `total_item` int(11) NOT NULL,
  `total_harga` int(11) NOT NULL,
  `diskon` tinyint(4) NOT NULL DEFAULT 0,
  `bayar` int(11) NOT NULL DEFAULT 0,
  `diterima` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `penjualan`
--

INSERT INTO `penjualan` (`id_penjualan`, `id_member`, `total_item`, `total_harga`, `diskon`, `bayar`, `diterima`, `created_at`, `updated_at`) VALUES
(9, 1, 20, 38000, 5, 36100, 0, '2023-01-02 09:43:24', '2023-01-02 09:44:40'),
(10, 1, 20, 40000, 5, 38000, 40000, '2023-01-02 12:32:32', '2023-01-02 12:59:42'),
(11, 1, 1000, 2000000, 5, 1900000, 2000000, '2023-01-02 13:53:06', '2023-01-02 13:53:50'),
(13, 1, 12, 24000, 5, 22800, 25000, '2023-01-03 01:50:51', '2023-01-03 01:51:19'),
(15, NULL, 35, 70000, 0, 70000, 70000, '2023-01-03 03:50:01', '2023-01-03 03:50:34'),
(16, NULL, 0, 0, 0, 0, 0, '2023-01-03 08:01:57', '2023-01-03 08:01:57'),
(17, 1, 1000, 1900000, 5, 1805000, 2000000, '2023-01-03 08:02:17', '2023-01-03 08:10:28'),
(18, NULL, 105, 210000, 0, 210000, 210000, '2023-01-03 08:11:05', '2023-01-03 08:11:25'),
(19, NULL, 0, 0, 0, 0, 0, '2023-01-03 09:09:20', '2023-01-03 09:09:20'),
(21, 1, 17, 34000, 5, 32300, 35000, '2023-01-03 09:11:39', '2023-01-03 09:12:09'),
(22, 1, 19, 38000, 5, 36100, 40000, '2023-01-03 09:12:42', '2023-01-03 09:13:15'),
(23, NULL, 19, 38000, 0, 38000, 10000000, '2023-01-04 07:36:27', '2023-01-04 07:37:24'),
(24, NULL, 0, 0, 0, 0, 0, '2023-01-04 07:37:28', '2023-01-04 07:37:28'),
(25, NULL, 0, 0, 0, 0, 0, '2023-01-05 02:13:48', '2023-01-05 02:13:48'),
(26, NULL, 0, 0, 0, 0, 0, '2023-01-05 06:17:02', '2023-01-05 06:17:02'),
(27, NULL, 20, 40000, 0, 40000, 0, '2023-01-05 06:17:32', '2023-01-05 06:19:29'),
(28, NULL, 0, 0, 0, 0, 0, '2023-01-05 06:19:57', '2023-01-05 06:19:57'),
(29, 2, 10, 25000, 5, 23750, 25000, '2023-01-06 03:49:02', '2023-01-06 03:51:22'),
(30, NULL, 15, 30000, 0, 30000, 30000, '2023-01-06 03:54:50', '2023-01-06 03:55:15'),
(31, NULL, 0, 0, 0, 0, 0, '2023-01-06 03:55:28', '2023-01-06 03:55:28'),
(32, 1, 41, 195000, 5, 185250, 186000, '2023-01-07 11:41:11', '2023-01-07 11:43:35'),
(33, NULL, 0, 0, 0, 0, 0, '2023-01-08 09:58:54', '2023-01-08 09:58:54'),
(34, 1, 100, 200000, 5, 190000, 190000, '2023-01-08 09:59:49', '2023-01-08 10:00:42'),
(35, 1, 10, 25000, 5, 23750, 24000, '2023-01-08 13:07:53', '2023-01-08 13:08:23'),
(36, 2, 19, 38000, 5, 38000, 40000, '2023-01-08 13:23:50', '2023-01-08 13:25:37'),
(37, 2, 1, 70000, 5, 66500, 70000, '2023-01-08 13:30:07', '2023-01-08 13:30:35'),
(38, 2, 1, 70000, 5, 66500, 70000, '2023-01-08 13:31:32', '2023-01-08 13:32:14'),
(39, NULL, 0, 0, 0, 0, 0, '2023-01-08 13:33:01', '2023-01-08 13:33:01'),
(40, 2, 61, 242500, 5, 230375, 231000, '2023-01-09 04:21:55', '2023-01-09 04:31:52'),
(41, 1, 15, 37500, 5, 37500, 38000, '2023-01-09 04:32:29', '2023-01-09 04:32:58'),
(42, 1, 10, 25000, 5, 23750, 24000, '2023-01-09 07:04:54', '2023-01-09 07:07:14'),
(43, 1, 1, 2500, 5, 2375, 2500, '2023-01-09 07:07:37', '2023-01-09 07:32:08'),
(44, 1, 1, 70000, 5, 66500, 70000, '2023-01-09 07:32:37', '2023-01-09 07:33:00'),
(45, NULL, 0, 0, 0, 0, 0, '2023-01-09 07:33:53', '2023-01-09 07:33:53'),
(46, NULL, 0, 0, 0, 0, 0, '2023-01-09 07:34:50', '2023-01-09 07:34:50'),
(47, 2, 1, 70000, 5, 66500, 100000, '2023-01-09 07:37:00', '2023-01-09 07:48:11'),
(48, 1, 1, 70000, 5, 66500, 70000, '2023-01-09 08:02:25', '2023-01-09 08:06:09'),
(49, 1, 1, 2500, 5, 2375, 3000, '2023-01-09 08:07:38', '2023-01-09 08:07:57'),
(50, 1, 23, 162500, 5, 154375, 0, '2023-02-02 02:40:04', '2023-02-02 02:40:50'),
(51, NULL, 0, 0, 0, 0, 0, '2023-02-02 02:41:50', '2023-02-02 02:41:50'),
(52, NULL, 0, 0, 0, 0, 0, '2023-02-07 02:46:39', '2023-02-07 02:46:39'),
(53, NULL, 0, 0, 0, 0, 0, '2023-02-11 02:44:35', '2023-02-11 02:44:35');

-- --------------------------------------------------------

--
-- Struktur dari tabel `penjualan_detail`
--

CREATE TABLE `penjualan_detail` (
  `id_penjualan_detail` int(10) UNSIGNED NOT NULL,
  `id_penjualan` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `harga_jual` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `diskon` tinyint(4) NOT NULL DEFAULT 0,
  `subtotal` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `penjualan_detail`
--

INSERT INTO `penjualan_detail` (`id_penjualan_detail`, `id_penjualan`, `id_produk`, `harga_jual`, `jumlah`, `diskon`, `subtotal`, `created_at`, `updated_at`) VALUES
(8, 9, 1, 2000, 20, 5, 38000, '2023-01-02 09:43:30', '2023-01-02 09:44:23'),
(9, 10, 1, 2000, 20, 5, 40000, '2023-01-02 12:32:42', '2023-01-02 12:59:42'),
(10, 11, 1, 2000, 1000, 5, 2000000, '2023-01-02 13:53:11', '2023-01-02 13:53:50'),
(11, 13, 1, 2000, 12, 5, 24000, '2023-01-03 01:50:58', '2023-01-03 01:51:19'),
(13, 15, 1, 2000, 35, 0, 70000, '2023-01-03 03:50:08', '2023-01-03 03:50:17'),
(14, 17, 1, 2000, 1000, 5, 2000000, '2023-01-03 08:02:24', '2023-01-03 08:02:47'),
(15, 18, 1, 2000, 105, 0, 210000, '2023-01-03 08:11:10', '2023-01-03 08:11:13'),
(16, 21, 1, 2000, 17, 5, 34000, '2023-01-03 09:11:46', '2023-01-03 09:12:09'),
(17, 22, 1, 2000, 19, 5, 38000, '2023-01-03 09:12:48', '2023-01-03 09:13:15'),
(18, 23, 1, 2000, 19, 0, 38000, '2023-01-04 07:36:53', '2023-01-04 07:37:01'),
(19, 25, 1, 2000, 1, 0, 2000, '2023-01-05 02:14:06', '2023-01-05 02:14:06'),
(20, 27, 1, 2000, 20, 0, 40000, '2023-01-05 06:17:50', '2023-01-05 06:18:29'),
(21, 29, 2, 2500, 10, 5, 25000, '2023-01-06 03:49:08', '2023-01-06 03:51:22'),
(22, 30, 3, 2000, 15, 0, 30000, '2023-01-06 03:55:00', '2023-01-06 03:55:04'),
(23, 32, 5, 70000, 1, 5, 70000, '2023-01-07 11:42:24', '2023-01-07 11:43:35'),
(24, 32, 3, 2000, 25, 5, 50000, '2023-01-07 11:42:29', '2023-01-07 11:43:35'),
(25, 32, 4, 5000, 15, 5, 75000, '2023-01-07 11:42:35', '2023-01-07 11:43:35'),
(26, 34, 3, 2000, 100, 5, 200000, '2023-01-08 09:59:55', '2023-01-08 10:00:42'),
(27, 35, 2, 2500, 10, 5, 25000, '2023-01-08 13:08:02', '2023-01-08 13:08:23'),
(28, 36, 3, 2000, 19, 5, 38000, '2023-01-08 13:23:56', '2023-01-08 13:25:37'),
(29, 37, 5, 70000, 1, 5, 70000, '2023-01-08 13:30:13', '2023-01-08 13:30:35'),
(30, 38, 5, 70000, 1, 5, 70000, '2023-01-08 13:31:38', '2023-01-08 13:32:14'),
(31, 39, 5, 70000, 1, 0, 70000, '2023-01-08 13:33:06', '2023-01-08 13:33:06'),
(32, 40, 5, 70000, 1, 5, 70000, '2023-01-09 04:22:04', '2023-01-09 04:31:52'),
(33, 40, 2, 2500, 15, 5, 37500, '2023-01-09 04:22:08', '2023-01-09 04:31:52'),
(34, 40, 3, 2000, 30, 5, 60000, '2023-01-09 04:22:13', '2023-01-09 04:31:52'),
(35, 40, 4, 5000, 15, 5, 75000, '2023-01-09 04:22:18', '2023-01-09 04:31:52'),
(36, 41, 2, 2500, 15, 5, 37500, '2023-01-09 04:32:34', '2023-01-09 04:32:58'),
(37, 42, 2, 2500, 10, 5, 25000, '2023-01-09 07:06:31', '2023-01-09 07:07:14'),
(38, 43, 2, 2500, 1, 5, 2500, '2023-01-09 07:07:46', '2023-01-09 07:32:08'),
(39, 44, 5, 70000, 1, 5, 70000, '2023-01-09 07:32:42', '2023-01-09 07:33:00'),
(44, 46, 5, 70000, 1, 0, 70000, '2023-01-09 07:36:45', '2023-01-09 07:36:45'),
(46, 47, 5, 70000, 1, 5, 70000, '2023-01-09 07:37:42', '2023-01-09 07:48:11'),
(48, 48, 5, 70000, 1, 5, 70000, '2023-01-09 08:03:42', '2023-01-09 08:06:09'),
(50, 49, 2, 2500, 1, 5, 2500, '2023-01-09 08:07:43', '2023-01-09 08:07:57'),
(51, 50, 5, 70000, 1, 5, 70000, '2023-02-02 02:40:13', '2023-02-02 02:40:50'),
(52, 50, 4, 5000, 15, 5, 75000, '2023-02-02 02:40:18', '2023-02-02 02:40:50'),
(53, 50, 2, 2500, 7, 5, 17500, '2023-02-02 02:40:23', '2023-02-02 02:40:50'),
(54, 52, 5, 70000, 1, 0, 70000, '2023-02-07 02:46:44', '2023-02-07 02:46:44'),
(55, 53, 5, 70000, 1, 0, 70000, '2023-02-11 02:44:44', '2023-02-11 02:44:44');

-- --------------------------------------------------------

--
-- Struktur dari tabel `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk`
--

CREATE TABLE `produk` (
  `id_produk` int(10) UNSIGNED NOT NULL,
  `id_kategori` int(10) UNSIGNED NOT NULL,
  `kode_produk` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_produk` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `merk` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `harga_beli` int(11) NOT NULL,
  `diskon` tinyint(4) NOT NULL DEFAULT 0,
  `harga_jual` int(11) NOT NULL,
  `stok` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `produk`
--

INSERT INTO `produk` (`id_produk`, `id_kategori`, `kode_produk`, `nama_produk`, `merk`, `harga_beli`, `diskon`, `harga_jual`, `stok`, `created_at`, `updated_at`) VALUES
(2, 3, 'P000001', 'Mie Goreng', 'Sedap', 2000, 0, 2500, 981, '2023-01-06 02:29:17', '2023-02-02 02:40:50'),
(3, 1, 'P000003', 'Sari Gandum Coklat', 'Roma', 1900, 0, 2000, 811, '2023-01-06 02:30:11', '2023-01-09 04:31:52'),
(4, 2, 'P000004', 'Susu UHT Ultamilk 270 ml', 'UltraJaya', 4750, 0, 5000, 1955, '2023-01-06 02:32:51', '2023-02-02 02:40:50'),
(5, 4, 'P000005', 'Beras 5 kg', 'Sania', 67000, 0, 70000, 192, '2023-01-06 02:35:22', '2023-02-02 02:40:50');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('5Rf4FcwlNAJainZ2dXLubom6wMIZhLy7outUlCQl', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiVFRJMEc1NEp5VjYzNUMzZ1JWN3JYZTZIRjFzbXo1WmdaMEdyZEU3UCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly9sb2NhbGhvc3QvdG9rb2t1L3B1YmxpYy9wcm9kdWsiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjEyOiJpZF9wZW5qdWFsYW4iO2k6NTM7fQ==', 1676083497),
('6wuaNd1kEC1gXOBwpq4b75TfyVKpgf3X59Er9r9t', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMzFMWVpPMGtrQzVFZXpiR1htUUt3S0xqaE9oRG1xazV2d0xRNTJvSCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjQ6Imh0dHA6Ly9sb2NhbGhvc3QvdG9rb2t1L3B1YmxpYy9sYXBvcmFuL3BkZi8yMDIzLTAyLTAxLzIwMjMtMDItMDMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1675393828),
('76KwJTm1Qg9C1qmHeaEeVTlgZmg28MDXyIfDLmZd', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiNHNyN0lodVFIZ2hSUVFtWmJoQUZnbmNQTUg0enVBWnZHNm9XZ2ZYMyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDA6Imh0dHA6Ly9sb2NhbGhvc3QvdG9rb2t1L3B1YmxpYy90cmFuc2Frc2kiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjEyOiJpZF9wZW1iZWxpYW4iO2k6OTtzOjExOiJpZF9zdXBwbGllciI7czoxOiIzIjtzOjEyOiJpZF9wZW5qdWFsYW4iO2k6NTI7fQ==', 1675740624),
('h9d6JcqeaKhkjROnshOvE5SJVfZBFImAXspBDJSu', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicE92UGJDR1BINExLbzR3dDlmV2p5OGZEZ3dHNnlGVzdJWWp3WDVudSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjQ6Imh0dHA6Ly9sb2NhbGhvc3QvdG9rb2t1L3B1YmxpYy9sYXBvcmFuL3BkZi8yMDIzLTAyLTAxLzIwMjMtMDItMDMiO319', 1675411661),
('zeefsNPWsT3lkjUPQf5wGSfxTuFnz7HkZHwvodpe', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoib1d0blk4VEpYTVRWU3RGOGVSSThoTVowSUZ5VEZpY1VDdGl1aU5tTSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDc6Imh0dHA6Ly9sb2NhbGhvc3QvdG9rb2t1L3B1YmxpYy9wZW1iZWxpYW5fZGV0YWlsIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMjoiaWRfcGVuanVhbGFuIjtpOjUxO3M6MTI6ImlkX3BlbWJlbGlhbiI7aTo4O3M6MTE6ImlkX3N1cHBsaWVyIjtzOjE6IjMiO30=', 1675305786);

-- --------------------------------------------------------

--
-- Struktur dari tabel `setting`
--

CREATE TABLE `setting` (
  `id_setting` int(10) UNSIGNED NOT NULL,
  `nama_perusahaan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telepon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipe_nota` tinyint(4) NOT NULL,
  `diskon` smallint(6) NOT NULL DEFAULT 0,
  `path_logo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `setting`
--

INSERT INTO `setting` (`id_setting`, `nama_perusahaan`, `alamat`, `telepon`, `tipe_nota`, `diskon`, `path_logo`, `created_at`, `updated_at`) VALUES
(1, 'Toko Kuning', 'Jl. Indah sejahtera Ds. Jimbaran', '085711859746', 1, 5, '/img/toko.jpg', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `supplier`
--

CREATE TABLE `supplier` (
  `id_supplier` int(10) UNSIGNED NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telepon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `supplier`
--

INSERT INTO `supplier` (`id_supplier`, `nama`, `alamat`, `telepon`, `created_at`, `updated_at`) VALUES
(2, 'mita sulastri', 'Kwagean', '085766853419', '2023-01-06 02:38:19', '2023-01-06 02:38:19'),
(3, 'bambang winarno', 'bumbungan', '085644789213', '2023-01-06 02:53:44', '2023-01-06 02:53:44');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `foto` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `level` tinyint(4) NOT NULL DEFAULT 0,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`),
  ADD UNIQUE KEY `kategori_nama_kategori_unique` (`nama_kategori`);

--
-- Indeks untuk tabel `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`id_member`),
  ADD UNIQUE KEY `member_kode_member_unique` (`kode_member`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indeks untuk tabel `pembelian`
--
ALTER TABLE `pembelian`
  ADD PRIMARY KEY (`id_pembelian`);

--
-- Indeks untuk tabel `pembelian_detail`
--
ALTER TABLE `pembelian_detail`
  ADD PRIMARY KEY (`id_pembelian_detail`);

--
-- Indeks untuk tabel `pengeluaran`
--
ALTER TABLE `pengeluaran`
  ADD PRIMARY KEY (`id_pengeluaran`);

--
-- Indeks untuk tabel `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`id_penjualan`);

--
-- Indeks untuk tabel `penjualan_detail`
--
ALTER TABLE `penjualan_detail`
  ADD PRIMARY KEY (`id_penjualan_detail`);

--
-- Indeks untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indeks untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id_produk`),
  ADD UNIQUE KEY `produk_nama_produk_unique` (`nama_produk`),
  ADD UNIQUE KEY `produk_kode_produk_unique` (`kode_produk`),
  ADD KEY `produk_id_kategori_foreign` (`id_kategori`);

--
-- Indeks untuk tabel `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indeks untuk tabel `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`id_setting`);

--
-- Indeks untuk tabel `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id_supplier`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `member`
--
ALTER TABLE `member`
  MODIFY `id_member` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT untuk tabel `pembelian`
--
ALTER TABLE `pembelian`
  MODIFY `id_pembelian` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `pembelian_detail`
--
ALTER TABLE `pembelian_detail`
  MODIFY `id_pembelian_detail` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `pengeluaran`
--
ALTER TABLE `pengeluaran`
  MODIFY `id_pengeluaran` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `penjualan`
--
ALTER TABLE `penjualan`
  MODIFY `id_penjualan` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT untuk tabel `penjualan_detail`
--
ALTER TABLE `penjualan_detail`
  MODIFY `id_penjualan_detail` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `produk`
--
ALTER TABLE `produk`
  MODIFY `id_produk` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `setting`
--
ALTER TABLE `setting`
  MODIFY `id_setting` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id_supplier` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD CONSTRAINT `produk_id_kategori_foreign` FOREIGN KEY (`id_kategori`) REFERENCES `kategori` (`id_kategori`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
