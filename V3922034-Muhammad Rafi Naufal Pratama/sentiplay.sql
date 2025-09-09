-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 13 Agu 2025 pada 08.21
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sentiplay`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `analyzed_data`
--

CREATE TABLE `analyzed_data` (
  `id_analyzed` int(11) NOT NULL,
  `id_clean` int(11) NOT NULL,
  `result_filename` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `analyzed_data`
--

INSERT INTO `analyzed_data` (`id_analyzed`, `id_clean`, `result_filename`, `created_at`, `start_date`, `end_date`) VALUES
(44, 42, 'result_com.bcadigital.blu-20250806130338.csv', '2025-08-06 13:52:58', '2021-07-02', '2025-08-05'),
(45, 43, 'result_id.co.bankbkemobile.digitalbank-20250806141848.csv', '2025-08-06 18:20:00', '2021-06-05', '2025-08-05'),
(46, 44, 'result_com.dwidasa.bjtm.mb.android-20250807110308.csv', '2025-08-07 11:16:51', '2016-09-03', '2025-08-06');

-- --------------------------------------------------------

--
-- Struktur dari tabel `clean_files`
--

CREATE TABLE `clean_files` (
  `id_clean` int(11) NOT NULL,
  `id_scraped` int(11) NOT NULL,
  `cleaned_filename` varchar(255) NOT NULL,
  `cleaned_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `clean_files`
--

INSERT INTO `clean_files` (`id_clean`, `id_scraped`, `cleaned_filename`, `cleaned_at`) VALUES
(42, 71, 'clean_com.bcadigital.blu-20250806130338.csv', '2025-08-06 13:03:43'),
(43, 72, 'clean_id.co.bankbkemobile.digitalbank-20250806141848.csv', '2025-08-06 14:19:12'),
(44, 73, 'clean_com.dwidasa.bjtm.mb.android-20250807110308.csv', '2025-08-07 11:03:10');

-- --------------------------------------------------------

--
-- Struktur dari tabel `scraped_files`
--

CREATE TABLE `scraped_files` (
  `id_scraped` int(11) NOT NULL,
  `nama_apps` varchar(255) NOT NULL,
  `app_id` varchar(255) NOT NULL,
  `scraped_filename` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `kategori` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `scraped_files`
--

INSERT INTO `scraped_files` (`id_scraped`, `nama_apps`, `app_id`, `scraped_filename`, `created_at`, `kategori`) VALUES
(71, 'blu by BCA Digital', 'com.bcadigital.blu', 'com.bcadigital.blu-20250806130338.csv', '2025-08-06 13:03:39', 'Keuangan'),
(72, 'SeaBank', 'id.co.bankbkemobile.digitalbank', 'id.co.bankbkemobile.digitalbank-20250806141848.csv', '2025-08-06 14:18:52', 'Keuangan'),
(73, 'JConnect Mobile', 'com.dwidasa.bjtm.mb.android', 'com.dwidasa.bjtm.mb.android-20250807110308.csv', '2025-08-07 11:03:08', 'Keuangan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','user') NOT NULL DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id_user`, `username`, `password`, `role`) VALUES
(1, 'admin', '$2b$12$0LOLxUNSLO65n5hsR.Nun.Q4m4Kv0T3PXYu06S8YKDAIsGYQBKeVC', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `analyzed_data`
--
ALTER TABLE `analyzed_data`
  ADD PRIMARY KEY (`id_analyzed`),
  ADD KEY `id_clean` (`id_clean`);

--
-- Indeks untuk tabel `clean_files`
--
ALTER TABLE `clean_files`
  ADD PRIMARY KEY (`id_clean`),
  ADD KEY `id_scraped` (`id_scraped`);

--
-- Indeks untuk tabel `scraped_files`
--
ALTER TABLE `scraped_files`
  ADD PRIMARY KEY (`id_scraped`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `analyzed_data`
--
ALTER TABLE `analyzed_data`
  MODIFY `id_analyzed` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT untuk tabel `clean_files`
--
ALTER TABLE `clean_files`
  MODIFY `id_clean` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT untuk tabel `scraped_files`
--
ALTER TABLE `scraped_files`
  MODIFY `id_scraped` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `analyzed_data`
--
ALTER TABLE `analyzed_data`
  ADD CONSTRAINT `analyzed_data_ibfk_1` FOREIGN KEY (`id_clean`) REFERENCES `clean_files` (`id_clean`);

--
-- Ketidakleluasaan untuk tabel `clean_files`
--
ALTER TABLE `clean_files`
  ADD CONSTRAINT `clean_files_ibfk_1` FOREIGN KEY (`id_scraped`) REFERENCES `scraped_files` (`id_scraped`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
