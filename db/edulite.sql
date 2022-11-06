-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 06 Nov 2022 pada 02.16
-- Versi server: 10.1.38-MariaDB
-- Versi PHP: 7.3.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `edulite`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `absensi`
--

CREATE TABLE `absensi` (
  `id_absensi` int(11) NOT NULL,
  `idsiswa_fk` int(11) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `idmatapelajaran_fk` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL COMMENT '0=>tidak masuk, 1 => masuk, 2 => ijin/sakit/ll',
  `keterangan` text CHARACTER SET latin1,
  `idjam_fk` int(11) DEFAULT NULL,
  `idguru_fk` int(11) DEFAULT NULL,
  `idkelas_fk` int(11) DEFAULT NULL,
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Struktur dari tabel `additional_setting`
--

CREATE TABLE `additional_setting` (
  `id_additional_setting` int(11) NOT NULL,
  `key_add` text CHARACTER SET latin1,
  `value_add` text CHARACTER SET latin1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

--
-- Dumping data untuk tabel `additional_setting`
--

INSERT INTO `additional_setting` (`id_additional_setting`, `key_add`, `value_add`) VALUES
(1, 'city_id', '255'),
(2, 'province_id', '11'),
(3, 'province', 'Jawa Timur'),
(4, 'city', 'Kabupaten Malang'),
(5, 'type', 'Kabupaten'),
(6, 'postal_code', '65162'),
(9, 'jenis_pengiriman', '[{\"text\":\"POS Indonesia\",\"val\":\"pos\"},{\"text\":\"JNE\",\"val\":\"jne\"},{\"text\":\"Tiki\",\"val\":\"tiki\"}]'),
(10, 'jenis_pembayaran', '[{\"text\":\"Bank BCA\",\"no_rek\":\"12321312312312\",\"atas_nama\":\"Rendy Yani Susanto\"},{\"text\":\"Bank BRI\",\"no_rek\":\"43432\",\"atas_nama\":\"Cicik Winarsih\"},{\"text\":\"Bank BNI\",\"no_rek\":\"56566\",\"atas_nama\":\"Rendy Yani Susanto\"}]');

-- --------------------------------------------------------

--
-- Struktur dari tabel `akun`
--

CREATE TABLE `akun` (
  `id_akun` int(11) NOT NULL,
  `no_ref` text CHARACTER SET latin1,
  `nama` text CHARACTER SET latin1,
  `idindukakun_fk` int(11) DEFAULT NULL,
  `saldo_normal` text CHARACTER SET latin1,
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `is_edit` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

--
-- Dumping data untuk tabel `akun`
--

INSERT INTO `akun` (`id_akun`, `no_ref`, `nama`, `idindukakun_fk`, `saldo_normal`, `create_at`, `is_edit`) VALUES
(1, '1101', 'Kas', 1, 'D', '2020-12-11 09:39:34', 0),
(2, '1102', 'BANK', 1, 'D', '2020-12-11 09:39:44', 0),
(3, '1103', 'Deposito', 1, 'D', '2020-12-11 09:39:55', 0),
(4, '1104', 'Piutang', 1, 'D', '2020-12-11 09:40:04', 0),
(5, '1105', 'Perlengkapan', 1, 'D', '2020-12-11 09:40:12', 0),
(6, '1201', 'Aktiva Tetap', 2, 'D', '2020-12-11 09:40:39', 0),
(7, '1202', 'Penyusutan', 2, 'D', '2020-12-11 09:40:47', 0),
(8, '1203', 'Investasi', 2, 'D', '2020-12-11 09:40:58', 0),
(9, '2101', 'Hutang Usaha', 3, 'K', '2020-12-11 09:41:10', 0),
(10, '2102', 'Hutang Pajak', 3, 'K', '2020-12-11 09:41:22', 0),
(11, '2103', 'Kewajiban Lancar Lain', 3, 'K', '2020-12-11 09:41:35', 0),
(12, '2201', 'Hutang Pihak ke 3', 4, 'K', '2020-12-11 09:41:49', 0),
(13, '2202', 'Hutang Program Lain', 4, 'K', '2020-12-11 09:42:01', 0),
(14, '2203', 'Kewajiban Jangka Panjang Lain', 4, 'K', '2020-12-11 09:42:16', 0),
(15, '3101', 'Modal Usaha', 5, 'K', '2020-12-11 09:42:26', 0),
(16, '3102', 'Prive', 5, 'D', '2020-12-11 09:42:35', 0),
(17, '4101', 'Donasi', 6, 'D', '2020-12-11 09:42:47', 0),
(18, '4102', 'Sumbangan', 6, 'D', '2020-12-11 09:42:55', 0),
(19, '4201', 'Penghasilan Layanan', 7, 'K', '2020-12-11 09:43:12', 0),
(20, '4202', 'Pendapatan', 7, 'K', '2020-12-11 09:43:35', 0),
(21, '4301', 'Pendapatan Lain', 8, 'K', '2020-12-11 09:44:06', 0),
(22, '5101', 'Beban Gaji', 9, 'D', '2020-12-11 09:44:15', 0),
(23, '5102', 'Biaya Perjalanan', 9, 'D', '2020-12-11 09:44:27', 0),
(24, '5103', 'Biaya Kantor', 9, 'D', '2020-12-11 09:44:42', 0),
(25, '5104', 'Biaya Sewa', 9, 'D', '2020-12-11 09:44:52', 0),
(26, '5105', 'Biaya Pemeliharaan', 9, 'D', '2020-12-11 09:45:02', 0),
(27, '5106', 'Biaya Rapat', 9, 'D', '2020-12-11 09:45:14', 0),
(28, '5107', 'Biaya Lain', 9, 'D', '2020-12-11 09:45:20', 0),
(32, '1107', 'Dana Koperasi', 1, 'D', '2022-01-20 05:09:40', 1),
(33, '4103', 'Diskon SPP', 6, 'D', '2022-01-20 08:46:37', 1),
(34, '1109', 'Kas Jurusan ', 1, 'D', '2022-01-23 08:38:53', 1),
(35, '4104', 'Diskon Lain', 6, 'D', '2022-07-23 01:31:56', 1),
(36, '1108', 'Kas APHP', 1, 'D', '2022-07-27 00:46:02', 1),
(37, '1109', 'Kas Multimedia', 1, 'D', '2022-08-03 13:44:35', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `alumni`
--

CREATE TABLE `alumni` (
  `id_alumni` int(11) NOT NULL,
  `nama` text CHARACTER SET latin1,
  `tahun_lulus` text CHARACTER SET latin1,
  `alamat` text CHARACTER SET latin1,
  `no_hp` text CHARACTER SET latin1,
  `kuliah` text CHARACTER SET latin1,
  `menikah` text CHARACTER SET latin1,
  `bekerja` text CHARACTER SET latin1,
  `pesantren` text CHARACTER SET latin1,
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `lng` text CHARACTER SET latin1,
  `lat` text CHARACTER SET latin1,
  `nis` text CHARACTER SET latin1,
  `tahun_masuk` text,
  `jurusan` text,
  `agama` text CHARACTER SET latin1,
  `nisn` text CHARACTER SET latin1,
  `no_ijazah_sekolah_asal` text CHARACTER SET latin1,
  `no_skhun_sekolah_asal` text CHARACTER SET latin1,
  `no_un_sekolah_asal` text CHARACTER SET latin1,
  `no_kk` text CHARACTER SET latin1,
  `npsn_sekolah_asal` text CHARACTER SET latin1,
  `nama_sekolah_asal` text CHARACTER SET latin1,
  `tempat_lahir` text CHARACTER SET latin1,
  `tanggal_lahir` date DEFAULT NULL,
  `berkebutuhan_khusus` text CHARACTER SET latin1,
  `dusun` text CHARACTER SET latin1,
  `rt` text CHARACTER SET latin1,
  `rw` text CHARACTER SET latin1,
  `kelurahan` text CHARACTER SET latin1,
  `foto` text CHARACTER SET hp8,
  `idprovince_fk` int(11) DEFAULT NULL,
  `idcities_fk` int(11) DEFAULT NULL,
  `nama_ayah` text CHARACTER SET latin1,
  `tempat_lahir_ayah` text CHARACTER SET latin1,
  `tanggal_lahir_ayah` date DEFAULT NULL,
  `pendidikan_ayah` text CHARACTER SET latin1,
  `pekerjaan_ayah` text CHARACTER SET latin1,
  `penghasilan_ayah` text CHARACTER SET latin1,
  `nama_ibu` text CHARACTER SET latin1,
  `tempat_lahir_ibu` text CHARACTER SET latin1,
  `tanggal_lahir_ibu` date DEFAULT NULL,
  `pendidikan_ibu` text CHARACTER SET latin1,
  `pekerjaan_ibu` text CHARACTER SET latin1,
  `penghasilan_ibu` text CHARACTER SET latin1,
  `tinggi_badan` int(11) DEFAULT NULL,
  `berat_badan` int(11) DEFAULT NULL,
  `jarak_ke_sekolah` int(255) DEFAULT NULL,
  `waktu_ke_sekolah` int(255) DEFAULT NULL,
  `jumlah_saudara` int(255) DEFAULT NULL,
  `jenis_kelamin` text CHARACTER SET latin1,
  `is_siswa_id` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `alumni`
--

INSERT INTO `alumni` (`id_alumni`, `nama`, `tahun_lulus`, `alamat`, `no_hp`, `kuliah`, `menikah`, `bekerja`, `pesantren`, `create_at`, `lng`, `lat`, `nis`, `tahun_masuk`, `jurusan`, `agama`, `nisn`, `no_ijazah_sekolah_asal`, `no_skhun_sekolah_asal`, `no_un_sekolah_asal`, `no_kk`, `npsn_sekolah_asal`, `nama_sekolah_asal`, `tempat_lahir`, `tanggal_lahir`, `berkebutuhan_khusus`, `dusun`, `rt`, `rw`, `kelurahan`, `foto`, `idprovince_fk`, `idcities_fk`, `nama_ayah`, `tempat_lahir_ayah`, `tanggal_lahir_ayah`, `pendidikan_ayah`, `pekerjaan_ayah`, `penghasilan_ayah`, `nama_ibu`, `tempat_lahir_ibu`, `tanggal_lahir_ibu`, `pendidikan_ibu`, `pekerjaan_ibu`, `penghasilan_ibu`, `tinggi_badan`, `berat_badan`, `jarak_ke_sekolah`, `waktu_ke_sekolah`, `jumlah_saudara`, `jenis_kelamin`, `is_siswa_id`) VALUES
(4, 'ALBET DIMAS NURFENDI PRATAMA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-19 10:46:57', NULL, NULL, '', NULL, 'Agribisnis Pengolahan Hasil Pertanian', NULL, '0036078764', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 594),
(6, 'ARIEF WAHYUDI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-22 02:43:40', NULL, NULL, '', NULL, 'Agribisnis Pengolahan Hasil Pertanian', NULL, '0028843265', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 595),
(7, 'ETIK MULYANI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-22 02:43:40', NULL, NULL, '', NULL, 'Agribisnis Pengolahan Hasil Pertanian', NULL, '0024950260', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 596),
(8, 'FARA AGUN YUNANTO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-22 02:43:40', NULL, NULL, '', NULL, 'Agribisnis Pengolahan Hasil Pertanian', NULL, '0028095705', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 597),
(9, 'LINDA AIDA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-22 02:43:40', NULL, NULL, '', NULL, 'Agribisnis Pengolahan Hasil Pertanian', NULL, '0036417497', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 598),
(10, 'SAHID', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-22 02:43:40', NULL, NULL, '', NULL, 'Agribisnis Pengolahan Hasil Pertanian', NULL, '0034071069', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 599),
(11, 'SITI KOMAIROH', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-22 02:43:40', NULL, NULL, '', NULL, 'Agribisnis Pengolahan Hasil Pertanian', NULL, '0042154375', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 600),
(12, 'YOSEPTY NURUL FERRISA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-22 02:43:40', NULL, NULL, '', NULL, 'Agribisnis Pengolahan Hasil Pertanian', NULL, '0042138354', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 601),
(13, 'AHMAD ARHAM ARDIYA PUTRA', '2022', NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-22 09:29:21', NULL, NULL, '', NULL, 'Teknik dan Bisnis Sepeda Motor', NULL, '3025057810', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 646),
(14, 'AHMAD ZAINURI MAKRUF', '2022', NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-22 11:14:33', NULL, NULL, '', NULL, 'Teknik dan Bisnis Sepeda Motor', NULL, '0036416117', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 647);

-- --------------------------------------------------------

--
-- Struktur dari tabel `anak_pegawai`
--

CREATE TABLE `anak_pegawai` (
  `id_anak_pegawai` int(11) NOT NULL,
  `idguru_fk` int(11) DEFAULT NULL,
  `nama` text CHARACTER SET latin1,
  `tempat_lahir` text CHARACTER SET latin1,
  `tanggal_lahir` date DEFAULT NULL,
  `nama_ibu` text CHARACTER SET latin1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Struktur dari tabel `ans_bank_soal`
--

CREATE TABLE `ans_bank_soal` (
  `id_ans_bank_soal` int(11) NOT NULL,
  `idbanksoal_fk` int(11) DEFAULT NULL,
  `ans` text CHARACTER SET latin1,
  `point` decimal(20,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Struktur dari tabel `bank_soal`
--

CREATE TABLE `bank_soal` (
  `id_bank_soal` int(11) NOT NULL,
  `soal` text CHARACTER SET latin1,
  `time_soal` int(11) DEFAULT NULL,
  `code_soal` text CHARACTER SET latin1,
  `idmatapelajaran_fk` int(11) DEFAULT NULL,
  `idguru_fk` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Struktur dari tabel `blog_article`
--

CREATE TABLE `blog_article` (
  `id_blog_article` int(11) NOT NULL,
  `title` text CHARACTER SET latin1,
  `description` text CHARACTER SET latin1,
  `img` text CHARACTER SET latin1,
  `tanggal` date DEFAULT NULL,
  `tagline` text CHARACTER SET latin1,
  `iduser_fk` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Struktur dari tabel `blog_course`
--

CREATE TABLE `blog_course` (
  `id_blog_course` int(11) NOT NULL,
  `course_name` text CHARACTER SET latin1,
  `description` text CHARACTER SET latin1,
  `button` text CHARACTER SET latin1,
  `year` text CHARACTER SET latin1,
  `headmaster` text CHARACTER SET latin1,
  `seats` text CHARACTER SET latin1,
  `img` text CHARACTER SET latin1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Struktur dari tabel `blog_setting`
--

CREATE TABLE `blog_setting` (
  `id_blog_setting` int(11) NOT NULL,
  `position` text CHARACTER SET latin1,
  `name` text CHARACTER SET latin1,
  `value` text CHARACTER SET latin1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Struktur dari tabel `blog_slider`
--

CREATE TABLE `blog_slider` (
  `id_blog_slider` int(11) NOT NULL,
  `img` text CHARACTER SET latin1,
  `title` text CHARACTER SET latin1,
  `desc` text CHARACTER SET latin1,
  `button` text CHARACTER SET latin1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Struktur dari tabel `blog_teacher`
--

CREATE TABLE `blog_teacher` (
  `id_blog_teacher` int(11) NOT NULL,
  `nama` text CHARACTER SET latin1,
  `img` text CHARACTER SET latin1,
  `jabatan` text CHARACTER SET latin1,
  `deskripsi` text CHARACTER SET latin1,
  `idguru_fk` int(11) DEFAULT NULL,
  `slide` text CHARACTER SET latin1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Struktur dari tabel `buku_pemanggilan_siswa`
--

CREATE TABLE `buku_pemanggilan_siswa` (
  `id_buku_pemanggilan_siswa` int(11) NOT NULL,
  `idsiswa_fk` int(11) DEFAULT NULL,
  `masalah` text CHARACTER SET latin1,
  `pemecahan` text CHARACTER SET latin1,
  `tindak_lanjut` text CHARACTER SET latin1,
  `keterangan` text CHARACTER SET latin1,
  `create_at` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `kode_pemanggilan` text CHARACTER SET latin1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

--
-- Dumping data untuk tabel `buku_pemanggilan_siswa`
--

INSERT INTO `buku_pemanggilan_siswa` (`id_buku_pemanggilan_siswa`, `idsiswa_fk`, `masalah`, `pemecahan`, `tindak_lanjut`, `keterangan`, `create_at`, `tanggal`, `kode_pemanggilan`) VALUES
(1, 592, 'coba', 'coba', 'coba', 'coba', NULL, '2022-07-21', 'BK-389648491165');

-- --------------------------------------------------------

--
-- Struktur dari tabel `buku_tamu`
--

CREATE TABLE `buku_tamu` (
  `id_buku_tamu` int(11) NOT NULL,
  `nama` text CHARACTER SET latin1,
  `alamat` text CHARACTER SET latin1,
  `keperluan` text CHARACTER SET latin1,
  `tanggal` date DEFAULT NULL,
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `jabatan` text CHARACTER SET latin1,
  `saran` text CHARACTER SET latin1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

--
-- Dumping data untuk tabel `buku_tamu`
--

INSERT INTO `buku_tamu` (`id_buku_tamu`, `nama`, `alamat`, `keperluan`, `tanggal`, `create_at`, `jabatan`, `saran`) VALUES
(2, 'Rendy1', 'Malang1', 'Sales aplikasi1', '2022-10-22', '2022-10-22 13:26:55', '-1', '-1');

-- --------------------------------------------------------

--
-- Struktur dari tabel `catatan_siswa`
--

CREATE TABLE `catatan_siswa` (
  `id_catatan_siswa` int(11) NOT NULL,
  `idsiswa_fk` int(11) DEFAULT NULL,
  `idkelas_fk` int(11) DEFAULT NULL,
  `idguru_fk` int(11) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `uraian` text CHARACTER SET latin1,
  `teruskan_ke` text CHARACTER SET latin1,
  `idtahunajaran_fk` int(11) DEFAULT NULL,
  `idmapel_fk` int(11) DEFAULT NULL,
  `is_tindakan` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Struktur dari tabel `cities`
--

CREATE TABLE `cities` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `province_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dumping data untuk tabel `cities`
--

INSERT INTO `cities` (`id`, `name`, `province_id`, `created_at`, `updated_at`) VALUES
(1, 'Kab. Simeulue', 1, '2019-10-22 00:49:46', '2019-10-25 13:50:05'),
(2, 'Kab. Aceh Singkil', 1, '2019-10-22 00:49:46', '2019-10-22 00:49:46'),
(3, 'Kab. Aceh Selatan', 1, '2019-10-22 00:49:46', '2019-10-22 00:49:46'),
(4, 'Kab. Aceh Tenggara', 1, '2019-10-22 00:49:46', '2019-10-22 00:49:46'),
(5, 'Kab. Aceh Timur', 1, '2019-10-22 00:49:46', '2019-10-22 00:49:46'),
(6, 'Kab. Aceh Tengah', 1, '2019-10-22 00:49:46', '2019-10-22 00:49:46'),
(7, 'Kab. Aceh Barat', 1, '2019-10-22 00:49:46', '2019-10-22 00:49:46'),
(8, 'Kab. Aceh Besar', 1, '2019-10-22 00:49:46', '2019-10-22 00:49:46'),
(9, 'Kab. Pidie', 1, '2019-10-22 00:49:46', '2019-10-22 00:49:46'),
(10, 'Kab. Bireuen', 1, '2019-10-22 00:49:46', '2019-10-22 00:49:46'),
(11, 'Kab. Aceh Utara', 1, '2019-10-22 00:49:46', '2019-10-22 00:49:46'),
(12, 'Kab. Aceh Barat Daya', 1, '2019-10-22 00:49:46', '2019-10-22 00:49:46'),
(13, 'Kab. Gayo Lues', 1, '2019-10-22 00:49:46', '2019-10-22 00:49:46'),
(14, 'Kab. Aceh Tamiang', 1, '2019-10-22 00:49:46', '2019-10-22 00:49:46'),
(15, 'Kab. Nagan Raya', 1, '2019-10-22 00:49:46', '2019-10-22 00:49:46'),
(16, 'Kab. Aceh Jaya', 1, '2019-10-22 00:49:46', '2019-10-22 00:49:46'),
(17, 'Kab. Bener Meriah', 1, '2019-10-22 00:49:46', '2019-10-22 00:49:46'),
(18, 'Kab. Pidie Jaya', 1, '2019-10-22 00:49:46', '2019-10-22 00:49:46'),
(19, 'Kota Banda Aceh', 1, '2019-10-22 00:49:46', '2019-10-22 00:49:46'),
(20, 'Kota Sabang', 1, '2019-10-22 00:49:46', '2019-10-22 00:49:46'),
(21, 'Kota Langsa', 1, '2019-10-22 00:49:46', '2019-10-22 00:49:46'),
(22, 'Kota Lhokseumawe', 1, '2019-10-22 00:49:46', '2019-10-22 00:49:46'),
(23, 'Kota Subulussalam', 1, '2019-10-22 00:49:46', '2019-10-22 00:49:46'),
(24, 'Kab. Nias', 2, '2019-10-22 00:49:46', '2019-10-22 00:49:46'),
(25, 'Kab. Mandailing Natal', 2, '2019-10-22 00:49:47', '2019-10-22 00:49:47'),
(26, 'Kab. Tapanuli Selatan', 2, '2019-10-22 00:49:47', '2019-10-22 00:49:47'),
(27, 'Kab. Tapanuli Tengah', 2, '2019-10-22 00:49:47', '2019-10-22 00:49:47'),
(28, 'Kab. Tapanuli Utara', 2, '2019-10-22 00:49:47', '2019-10-22 00:49:47'),
(29, 'Kab. Toba Samosir', 2, '2019-10-22 00:49:47', '2019-10-22 00:49:47'),
(30, 'Kab. Labuhan Batu', 2, '2019-10-22 00:49:47', '2019-10-22 00:49:47'),
(31, 'Kab. Asahan', 2, '2019-10-22 00:49:47', '2019-10-22 00:49:47'),
(32, 'Kab. Simalungun', 2, '2019-10-22 00:49:47', '2019-10-22 00:49:47'),
(33, 'Kab. Dairi', 2, '2019-10-22 00:49:47', '2019-10-22 00:49:47'),
(34, 'Kab. Karo', 2, '2019-10-22 00:49:47', '2019-10-22 00:49:47'),
(35, 'Kab. Deli Serdang', 2, '2019-10-22 00:49:47', '2019-10-22 00:49:47'),
(36, 'Kab. Langkat', 2, '2019-10-22 00:49:47', '2019-10-22 00:49:47'),
(37, 'Kab. Nias Selatan', 2, '2019-10-22 00:49:47', '2019-10-22 00:49:47'),
(38, 'Kab. Humbang Hasundutan', 2, '2019-10-22 00:49:47', '2019-10-22 00:49:47'),
(39, 'Kab. Pakpak Bharat', 2, '2019-10-22 00:49:47', '2019-10-22 00:49:47'),
(40, 'Kab. Samosir', 2, '2019-10-22 00:49:47', '2019-10-22 00:49:47'),
(41, 'Kab. Serdang Bedagai', 2, '2019-10-22 00:49:47', '2019-10-22 00:49:47'),
(42, 'Kab. Batu Bara', 2, '2019-10-22 00:49:47', '2019-10-22 00:49:47'),
(43, 'Kab. Padang Lawas Utara', 2, '2019-10-22 00:49:47', '2019-10-22 00:49:47'),
(44, 'Kab. Padang Lawas', 2, '2019-10-22 00:49:47', '2019-10-22 00:49:47'),
(45, 'Kab. Labuhan Batu Selatan', 2, '2019-10-22 00:49:47', '2019-10-22 00:49:47'),
(46, 'Kab. Labuhan Batu Utara', 2, '2019-10-22 00:49:47', '2019-10-22 00:49:47'),
(47, 'Kab. Nias Utara', 2, '2019-10-22 00:49:47', '2019-10-22 00:49:47'),
(48, 'Kab. Nias Barat', 2, '2019-10-22 00:49:47', '2019-10-22 00:49:47'),
(49, 'Kota Sibolga', 2, '2019-10-22 00:49:47', '2019-10-22 00:49:47'),
(50, 'Kota Tanjung Balai', 2, '2019-10-22 00:49:47', '2019-10-22 00:49:47'),
(51, 'Kota Pematang Siantar', 2, '2019-10-22 00:49:47', '2019-10-22 00:49:47'),
(52, 'Kota Tebing Tinggi', 2, '2019-10-22 00:49:47', '2019-10-22 00:49:47'),
(53, 'Kota Medan', 2, '2019-10-22 00:49:47', '2019-10-22 00:49:47'),
(54, 'Kota Binjai', 2, '2019-10-22 00:49:47', '2019-10-22 00:49:47'),
(55, 'Kota Padangsidimpuan', 2, '2019-10-22 00:49:47', '2019-10-22 00:49:47'),
(56, 'Kota Gunungsitoli', 2, '2019-10-22 00:49:47', '2019-10-22 00:49:47'),
(57, 'Kab. Kepulauan Mentawai', 3, '2019-10-22 00:49:47', '2019-10-22 00:49:47'),
(58, 'Kab. Pesisir Selatan', 3, '2019-10-22 00:49:47', '2019-10-22 00:49:47'),
(59, 'Kab. Solok', 3, '2019-10-22 00:49:47', '2019-10-22 00:49:47'),
(60, 'Kab. Sijunjung', 3, '2019-10-22 00:49:47', '2019-10-22 00:49:47'),
(61, 'Kab. Tanah Datar', 3, '2019-10-22 00:49:47', '2019-10-22 00:49:47'),
(62, 'Kab. Padang Pariaman', 3, '2019-10-22 00:49:48', '2019-10-22 00:49:48'),
(63, 'Kab. Agam', 3, '2019-10-22 00:49:48', '2019-10-22 00:49:48'),
(64, 'Kab. Lima Puluh Kota', 3, '2019-10-22 00:49:48', '2019-10-22 00:49:48'),
(65, 'Kab. Pasaman', 3, '2019-10-22 00:49:48', '2019-10-22 00:49:48'),
(66, 'Kab. Solok Selatan', 3, '2019-10-22 00:49:48', '2019-10-22 00:49:48'),
(67, 'Kab. Dharmasraya', 3, '2019-10-22 00:49:48', '2019-10-22 00:49:48'),
(68, 'Kab. Pasaman Barat', 3, '2019-10-22 00:49:48', '2019-10-22 00:49:48'),
(69, 'Kota Padang', 3, '2019-10-22 00:49:48', '2019-10-22 00:49:48'),
(70, 'Kota Solok', 3, '2019-10-22 00:49:48', '2019-10-22 00:49:48'),
(71, 'Kota Sawah Lunto', 3, '2019-10-22 00:49:48', '2019-10-22 00:49:48'),
(72, 'Kota Padang Panjang', 3, '2019-10-22 00:49:48', '2019-10-22 00:49:48'),
(73, 'Kota Bukittinggi', 3, '2019-10-22 00:49:48', '2019-10-22 00:49:48'),
(74, 'Kota Payakumbuh', 3, '2019-10-22 00:49:48', '2019-10-22 00:49:48'),
(75, 'Kota Pariaman', 3, '2019-10-22 00:49:48', '2019-10-22 00:49:48'),
(76, 'Kab. Kuantan Singingi', 4, '2019-10-22 00:49:48', '2019-10-22 00:49:48'),
(77, 'Kab. Indragiri Hulu', 4, '2019-10-22 00:49:48', '2019-10-22 00:49:48'),
(78, 'Kab. Indragiri Hilir', 4, '2019-10-22 00:49:48', '2019-10-22 00:49:48'),
(79, 'Kab. Pelalawan', 4, '2019-10-22 00:49:48', '2019-10-22 00:49:48'),
(80, 'Kab. S I A K', 4, '2019-10-22 00:49:48', '2019-10-22 00:49:48'),
(81, 'Kab. Kampar', 4, '2019-10-22 00:49:48', '2019-10-22 00:49:48'),
(82, 'Kab. Rokan Hulu', 4, '2019-10-22 00:49:48', '2019-10-22 00:49:48'),
(83, 'Kab. Bengkalis', 4, '2019-10-22 00:49:48', '2019-10-22 00:49:48'),
(84, 'Kab. Rokan Hilir', 4, '2019-10-22 00:49:48', '2019-10-22 00:49:48'),
(85, 'Kab. Kepulauan Meranti', 4, '2019-10-22 00:49:48', '2019-10-22 00:49:48'),
(86, 'Kota Pekanbaru', 4, '2019-10-22 00:49:48', '2019-10-22 00:49:48'),
(87, 'Kota D U M A I', 4, '2019-10-22 00:49:48', '2019-10-22 00:49:48'),
(88, 'Kab. Kerinci', 5, '2019-10-22 00:49:48', '2019-10-22 00:49:48'),
(89, 'Kab. Merangin', 5, '2019-10-22 00:49:48', '2019-10-22 00:49:48'),
(90, 'Kab. Sarolangun', 5, '2019-10-22 00:49:48', '2019-10-22 00:49:48'),
(91, 'Kab. Batang Hari', 5, '2019-10-22 00:49:48', '2019-10-22 00:49:48'),
(92, 'Kab. Muaro Jambi', 5, '2019-10-22 00:49:48', '2019-10-22 00:49:48'),
(93, 'Kab. Tanjung Jabung Timur', 5, '2019-10-22 00:49:48', '2019-10-22 00:49:48'),
(94, 'Kab. Tanjung Jabung Barat', 5, '2019-10-22 00:49:48', '2019-10-22 00:49:48'),
(95, 'Kab. Tebo', 5, '2019-10-22 00:49:48', '2019-10-22 00:49:48'),
(96, 'Kab. Bungo', 5, '2019-10-22 00:49:49', '2019-10-22 00:49:49'),
(97, 'Kota Jambi', 5, '2019-10-22 00:49:49', '2019-10-22 00:49:49'),
(98, 'Kota Sungai Penuh', 5, '2019-10-22 00:49:49', '2019-10-22 00:49:49'),
(99, 'Kab. Ogan Komering Ulu', 6, '2019-10-22 00:49:49', '2019-10-22 00:49:49'),
(100, 'Kab. Ogan Komering Ilir', 6, '2019-10-22 00:49:49', '2019-10-22 00:49:49'),
(101, 'Kab. Muara Enim', 6, '2019-10-22 00:49:49', '2019-10-22 00:49:49'),
(102, 'Kab. Lahat', 6, '2019-10-22 00:49:49', '2019-10-22 00:49:49'),
(103, 'Kab. Musi Rawas', 6, '2019-10-22 00:49:49', '2019-10-22 00:49:49'),
(104, 'Kab. Musi Banyuasin', 6, '2019-10-22 00:49:49', '2019-10-22 00:49:49'),
(105, 'Kab. Banyu Asin', 6, '2019-10-22 00:49:49', '2019-10-22 00:49:49'),
(106, 'Kab. Ogan Komering Ulu Selatan', 6, '2019-10-22 00:49:49', '2019-10-22 00:49:49'),
(107, 'Kab. Ogan Komering Ulu Timur', 6, '2019-10-22 00:49:49', '2019-10-22 00:49:49'),
(108, 'Kab. Ogan Ilir', 6, '2019-10-22 00:49:49', '2019-10-22 00:49:49'),
(109, 'Kab. Empat Lawang', 6, '2019-10-22 00:49:49', '2019-10-22 00:49:49'),
(110, 'Kota Palembang', 6, '2019-10-22 00:49:49', '2019-10-22 00:49:49'),
(111, 'Kota Prabumulih', 6, '2019-10-22 00:49:49', '2019-10-22 00:49:49'),
(112, 'Kota Pagar Alam', 6, '2019-10-22 00:49:49', '2019-10-22 00:49:49'),
(113, 'Kota Lubuklinggau', 6, '2019-10-22 00:49:49', '2019-10-22 00:49:49'),
(114, 'Kab. Bengkulu Selatan', 7, '2019-10-22 00:49:49', '2019-10-22 00:49:49'),
(115, 'Kab. Rejang Lebong', 7, '2019-10-22 00:49:49', '2019-10-22 00:49:49'),
(116, 'Kab. Bengkulu Utara', 7, '2019-10-22 00:49:49', '2019-10-22 00:49:49'),
(117, 'Kab. Kaur', 7, '2019-10-22 00:49:49', '2019-10-22 00:49:49'),
(118, 'Kab. Seluma', 7, '2019-10-22 00:49:49', '2019-10-22 00:49:49'),
(119, 'Kab. Mukomuko', 7, '2019-10-22 00:49:49', '2019-10-22 00:49:49'),
(120, 'Kab. Lebong', 7, '2019-10-22 00:49:49', '2019-10-22 00:49:49'),
(121, 'Kab. Kepahiang', 7, '2019-10-22 00:49:49', '2019-10-22 00:49:49'),
(122, 'Kab. Bengkulu Tengah', 7, '2019-10-22 00:49:49', '2019-10-22 00:49:49'),
(123, 'Kota Bengkulu', 7, '2019-10-22 00:49:49', '2019-10-22 00:49:49'),
(124, 'Kab. Lampung Barat', 8, '2019-10-22 00:49:49', '2019-10-22 00:49:49'),
(125, 'Kab. Tanggamus', 8, '2019-10-22 00:49:49', '2019-10-22 00:49:49'),
(126, 'Kab. Lampung Selatan', 8, '2019-10-22 00:49:49', '2019-10-22 00:49:49'),
(127, 'Kab. Lampung Timur', 8, '2019-10-22 00:49:49', '2019-10-22 00:49:49'),
(128, 'Kab. Lampung Tengah', 8, '2019-10-22 00:49:49', '2019-10-22 00:49:49'),
(129, 'Kab. Lampung Utara', 8, '2019-10-22 00:49:50', '2019-10-22 00:49:50'),
(130, 'Kab. Way Kanan', 8, '2019-10-22 00:49:50', '2019-10-22 00:49:50'),
(131, 'Kab. Tulangbawang', 8, '2019-10-22 00:49:50', '2019-10-22 00:49:50'),
(132, 'Kab. Pesawaran', 8, '2019-10-22 00:49:50', '2019-10-22 00:49:50'),
(133, 'Kab. Pringsewu', 8, '2019-10-22 00:49:50', '2019-10-22 00:49:50'),
(134, 'Kab. Mesuji', 8, '2019-10-22 00:49:50', '2019-10-22 00:49:50'),
(135, 'Kab. Tulang Bawang Barat', 8, '2019-10-22 00:49:50', '2019-10-22 00:49:50'),
(136, 'Kab. Pesisir Barat', 8, '2019-10-22 00:49:50', '2019-10-22 00:49:50'),
(137, 'Kota Bandar Lampung', 8, '2019-10-22 00:49:50', '2019-10-22 00:49:50'),
(138, 'Kota Metro', 8, '2019-10-22 00:49:50', '2019-10-22 00:49:50'),
(139, 'Kab. Bangka', 9, '2019-10-22 00:49:50', '2019-10-22 00:49:50'),
(140, 'Kab. Belitung', 9, '2019-10-22 00:49:50', '2019-10-22 00:49:50'),
(141, 'Kab. Bangka Barat', 9, '2019-10-22 00:49:50', '2019-10-22 00:49:50'),
(142, 'Kab. Bangka Tengah', 9, '2019-10-22 00:49:50', '2019-10-22 00:49:50'),
(143, 'Kab. Bangka Selatan', 9, '2019-10-22 00:49:50', '2019-10-22 00:49:50'),
(144, 'Kab. Belitung Timur', 9, '2019-10-22 00:49:50', '2019-10-22 00:49:50'),
(145, 'Kota Pangkal Pinang', 9, '2019-10-22 00:49:50', '2019-10-22 00:49:50'),
(146, 'Kab. Karimun', 10, '2019-10-22 00:49:50', '2019-10-22 00:49:50'),
(147, 'Kab. Bintan', 10, '2019-10-22 00:49:50', '2019-10-22 00:49:50'),
(148, 'Kab. Natuna', 10, '2019-10-22 00:49:50', '2019-10-22 00:49:50'),
(149, 'Kab. Lingga', 10, '2019-10-22 00:49:50', '2019-10-22 00:49:50'),
(150, 'Kab. Kepulauan Anambas', 10, '2019-10-22 00:49:50', '2019-10-22 00:49:50'),
(151, 'Kota B A T A M', 10, '2019-10-22 00:49:50', '2019-10-22 00:49:50'),
(152, 'Kota Tanjung Pinang', 10, '2019-10-22 00:49:50', '2019-10-22 00:49:50'),
(153, 'Kab. Kepulauan Seribu', 11, '2019-10-22 00:49:50', '2019-10-22 00:49:50'),
(154, 'Kota Jakarta Selatan', 11, '2019-10-22 00:49:50', '2019-10-22 00:49:50'),
(155, 'Kota Jakarta Timur', 11, '2019-10-22 00:49:50', '2019-10-22 00:49:50'),
(156, 'Kota Jakarta Pusat', 11, '2019-10-22 00:49:50', '2019-10-22 00:49:50'),
(157, 'Kota Jakarta Barat', 11, '2019-10-22 00:49:50', '2019-10-22 00:49:50'),
(158, 'Kota Jakarta Utara', 11, '2019-10-22 00:49:50', '2019-10-22 00:49:50'),
(159, 'Kab. Bogor', 12, '2019-10-22 00:49:51', '2019-10-22 00:49:51'),
(160, 'Kab. Sukabumi', 12, '2019-10-22 00:49:51', '2019-10-22 00:49:51'),
(161, 'Kab. Cianjur', 12, '2019-10-22 00:49:51', '2019-10-22 00:49:51'),
(162, 'Kab. Bandung', 12, '2019-10-22 00:49:51', '2019-10-22 00:49:51'),
(163, 'Kab. Garut', 12, '2019-10-22 00:49:51', '2019-10-22 00:49:51'),
(164, 'Kab. Tasikmalaya', 12, '2019-10-22 00:49:51', '2019-10-22 00:49:51'),
(165, 'Kab. Ciamis', 12, '2019-10-22 00:49:51', '2019-10-22 00:49:51'),
(166, 'Kab. Kuningan', 12, '2019-10-22 00:49:51', '2019-10-22 00:49:51'),
(167, 'Kab. Cirebon', 12, '2019-10-22 00:49:51', '2019-10-22 00:49:51'),
(168, 'Kab. Majalengka', 12, '2019-10-22 00:49:51', '2019-10-22 00:49:51'),
(169, 'Kab. Sumedang', 12, '2019-10-22 00:49:51', '2019-10-22 00:49:51'),
(170, 'Kab. Indramayu', 12, '2019-10-22 00:49:51', '2019-10-22 00:49:51'),
(171, 'Kab. Subang', 12, '2019-10-22 00:49:51', '2019-10-22 00:49:51'),
(172, 'Kab. Purwakarta', 12, '2019-10-22 00:49:51', '2019-10-22 00:49:51'),
(173, 'Kab. Karawang', 12, '2019-10-22 00:49:51', '2019-10-22 00:49:51'),
(174, 'Kab. Bekasi', 12, '2019-10-22 00:49:51', '2019-10-22 00:49:51'),
(175, 'Kab. Bandung Barat', 12, '2019-10-22 00:49:51', '2019-10-22 00:49:51'),
(176, 'Kab. Pangandaran', 12, '2019-10-22 00:49:51', '2019-10-22 00:49:51'),
(177, 'Kota Bogor', 12, '2019-10-22 00:49:51', '2019-10-22 00:49:51'),
(178, 'Kota Sukabumi', 12, '2019-10-22 00:49:51', '2019-10-22 00:49:51'),
(179, 'Kota Bandung', 12, '2019-10-22 00:49:51', '2019-10-22 00:49:51'),
(180, 'Kota Cirebon', 12, '2019-10-22 00:49:51', '2019-10-22 00:49:51'),
(181, 'Kota Bekasi', 12, '2019-10-22 00:49:51', '2019-10-22 00:49:51'),
(182, 'Kota Depok', 12, '2019-10-22 00:49:51', '2019-10-22 00:49:51'),
(183, 'Kota Cimahi', 12, '2019-10-22 00:49:51', '2019-10-22 00:49:51'),
(184, 'Kota Tasikmalaya', 12, '2019-10-22 00:49:51', '2019-10-22 00:49:51'),
(185, 'Kota Banjar', 12, '2019-10-22 00:49:51', '2019-10-22 00:49:51'),
(186, 'Kab. Cilacap', 13, '2019-10-22 00:49:51', '2019-10-22 00:49:51'),
(187, 'Kab. Banyumas', 13, '2019-10-22 00:49:51', '2019-10-22 00:49:51'),
(188, 'Kab. Purbalingga', 13, '2019-10-22 00:49:51', '2019-10-22 00:49:51'),
(189, 'Kab. Banjarnegara', 13, '2019-10-22 00:49:51', '2019-10-22 00:49:51'),
(190, 'Kab. Kebumen', 13, '2019-10-22 00:49:51', '2019-10-22 00:49:51'),
(191, 'Kab. Purworejo', 13, '2019-10-22 00:49:51', '2019-10-22 00:49:51'),
(192, 'Kab. Wonosobo', 13, '2019-10-22 00:49:51', '2019-10-22 00:49:51'),
(193, 'Kab. Magelang', 13, '2019-10-22 00:49:52', '2019-10-22 00:49:52'),
(194, 'Kab. Boyolali', 13, '2019-10-22 00:49:52', '2019-10-22 00:49:52'),
(195, 'Kab. Klaten', 13, '2019-10-22 00:49:52', '2019-10-22 00:49:52'),
(196, 'Kab. Sukoharjo', 13, '2019-10-22 00:49:52', '2019-10-22 00:49:52'),
(197, 'Kab. Wonogiri', 13, '2019-10-22 00:49:52', '2019-10-22 00:49:52'),
(198, 'Kab. Karanganyar', 13, '2019-10-22 00:49:52', '2019-10-22 00:49:52'),
(199, 'Kab. Sragen', 13, '2019-10-22 00:49:52', '2019-10-22 00:49:52'),
(200, 'Kab. Grobogan', 13, '2019-10-22 00:49:52', '2019-10-22 00:49:52'),
(201, 'Kab. Blora', 13, '2019-10-22 00:49:52', '2019-10-22 00:49:52'),
(202, 'Kab. Rembang', 13, '2019-10-22 00:49:52', '2019-10-22 00:49:52'),
(203, 'Kab. Pati', 13, '2019-10-22 00:49:52', '2019-10-22 00:49:52'),
(204, 'Kab. Kudus', 13, '2019-10-22 00:49:52', '2019-10-22 00:49:52'),
(205, 'Kab. Jepara', 13, '2019-10-22 00:49:52', '2019-10-22 00:49:52'),
(206, 'Kab. Demak', 13, '2019-10-22 00:49:52', '2019-10-22 00:49:52'),
(207, 'Kab. Semarang', 13, '2019-10-22 00:49:52', '2019-10-22 00:49:52'),
(208, 'Kab. Temanggung', 13, '2019-10-22 00:49:52', '2019-10-22 00:49:52'),
(209, 'Kab. Kendal', 13, '2019-10-22 00:49:52', '2019-10-22 00:49:52'),
(210, 'Kab. Batang', 13, '2019-10-22 00:49:52', '2019-10-22 00:49:52'),
(211, 'Kab. Pekalongan', 13, '2019-10-22 00:49:52', '2019-10-22 00:49:52'),
(212, 'Kab. Pemalang', 13, '2019-10-22 00:49:52', '2019-10-22 00:49:52'),
(213, 'Kab. Tegal', 13, '2019-10-22 00:49:52', '2019-10-22 00:49:52'),
(214, 'Kab. Brebes', 13, '2019-10-22 00:49:52', '2019-10-22 00:49:52'),
(215, 'Kota Magelang', 13, '2019-10-22 00:49:52', '2019-10-22 00:49:52'),
(216, 'Kota Surakarta', 13, '2019-10-22 00:49:52', '2019-10-22 00:49:52'),
(217, 'Kota Salatiga', 13, '2019-10-22 00:49:52', '2019-10-22 00:49:52'),
(218, 'Kota Semarang', 13, '2019-10-22 00:49:52', '2019-10-22 00:49:52'),
(219, 'Kota Pekalongan', 13, '2019-10-22 00:49:52', '2019-10-22 00:49:52'),
(220, 'Kota Tegal', 13, '2019-10-22 00:49:52', '2019-10-22 00:49:52'),
(221, 'Kab. Kulon Progo', 14, '2019-10-22 00:49:52', '2019-10-22 00:49:52'),
(222, 'Kab. Bantul', 14, '2019-10-22 00:49:52', '2019-10-22 00:49:52'),
(223, 'Kab. Gunung Kidul', 14, '2019-10-22 00:49:52', '2019-10-22 00:49:52'),
(224, 'Kab. Sleman', 14, '2019-10-22 00:49:52', '2019-10-22 00:49:52'),
(225, 'Kota Yogyakarta', 14, '2019-10-22 00:49:52', '2019-10-22 00:49:52'),
(226, 'Kab. Pacitan', 15, '2019-10-22 00:49:52', '2019-10-22 00:49:52'),
(227, 'Kab. Ponorogo', 15, '2019-10-22 00:49:52', '2019-10-22 00:49:52'),
(228, 'Kab. Trenggalek', 15, '2019-10-22 00:49:52', '2019-10-22 00:49:52'),
(229, 'Kab. Tulungagung', 15, '2019-10-22 00:49:53', '2019-10-22 00:49:53'),
(230, 'Kab. Blitar', 15, '2019-10-22 00:49:53', '2019-10-22 00:49:53'),
(231, 'Kab. Kediri', 15, '2019-10-22 00:49:53', '2019-10-22 00:49:53'),
(232, 'Kab. Malang', 15, '2019-10-22 00:49:53', '2019-10-22 00:49:53'),
(233, 'Kab. Lumajang', 15, '2019-10-22 00:49:53', '2019-10-22 00:49:53'),
(234, 'Kab. Jember', 15, '2019-10-22 00:49:53', '2019-10-22 00:49:53'),
(235, 'Kab. Banyuwangi', 15, '2019-10-22 00:49:53', '2019-10-22 00:49:53'),
(236, 'Kab. Bondowoso', 15, '2019-10-22 00:49:53', '2019-10-22 00:49:53'),
(237, 'Kab. Situbondo', 15, '2019-10-22 00:49:53', '2019-10-22 00:49:53'),
(238, 'Kab. Probolinggo', 15, '2019-10-22 00:49:53', '2019-10-22 00:49:53'),
(239, 'Kab. Pasuruan', 15, '2019-10-22 00:49:53', '2019-10-22 00:49:53'),
(240, 'Kab. Sidoarjo', 15, '2019-10-22 00:49:53', '2019-10-22 00:49:53'),
(241, 'Kab. Mojokerto', 15, '2019-10-22 00:49:53', '2019-10-22 00:49:53'),
(242, 'Kab. Jombang', 15, '2019-10-22 00:49:53', '2019-10-22 00:49:53'),
(243, 'Kab. Nganjuk', 15, '2019-10-22 00:49:53', '2019-10-22 00:49:53'),
(244, 'Kab. Madiun', 15, '2019-10-22 00:49:53', '2019-10-22 00:49:53'),
(245, 'Kab. Magetan', 15, '2019-10-22 00:49:53', '2019-10-22 00:49:53'),
(246, 'Kab. Ngawi', 15, '2019-10-22 00:49:53', '2019-10-22 00:49:53'),
(247, 'Kab. Bojonegoro', 15, '2019-10-22 00:49:53', '2019-10-22 00:49:53'),
(248, 'Kab. Tuban', 15, '2019-10-22 00:49:53', '2019-10-22 00:49:53'),
(249, 'Kab. Lamongan', 15, '2019-10-22 00:49:53', '2019-10-22 00:49:53'),
(250, 'Kab. Gresik', 15, '2019-10-22 00:49:53', '2019-10-22 00:49:53'),
(251, 'Kab. Bangkalan', 15, '2019-10-22 00:49:53', '2019-10-22 00:49:53'),
(252, 'Kab. Sampang', 15, '2019-10-22 00:49:53', '2019-10-22 00:49:53'),
(253, 'Kab. Pamekasan', 15, '2019-10-22 00:49:53', '2019-10-22 00:49:53'),
(254, 'Kab. Sumenep', 15, '2019-10-22 00:49:53', '2019-10-22 00:49:53'),
(255, 'Kota Kediri', 15, '2019-10-22 00:49:53', '2019-10-22 00:49:53'),
(256, 'Kota Blitar', 15, '2019-10-22 00:49:53', '2019-10-22 00:49:53'),
(257, 'Kota Malang', 15, '2019-10-22 00:49:53', '2019-10-22 00:49:53'),
(258, 'Kota Probolinggo', 15, '2019-10-22 00:49:53', '2019-10-22 00:49:53'),
(259, 'Kota Pasuruan', 15, '2019-10-22 00:49:53', '2019-10-22 00:49:53'),
(260, 'Kota Mojokerto', 15, '2019-10-22 00:49:54', '2019-10-22 00:49:54'),
(261, 'Kota Madiun', 15, '2019-10-22 00:49:54', '2019-10-22 00:49:54'),
(262, 'Kota Surabaya', 15, '2019-10-22 00:49:54', '2019-10-22 00:49:54'),
(263, 'Kota Batu', 15, '2019-10-22 00:49:54', '2019-10-22 00:49:54'),
(264, 'Kab. Pandeglang', 16, '2019-10-22 00:49:54', '2019-10-22 00:49:54'),
(265, 'Kab. Lebak', 16, '2019-10-22 00:49:54', '2019-10-22 00:49:54'),
(266, 'Kab. Tangerang', 16, '2019-10-22 00:49:54', '2019-10-22 00:49:54'),
(267, 'Kab. Serang', 16, '2019-10-22 00:49:54', '2019-10-22 00:49:54'),
(268, 'Kota Tangerang', 16, '2019-10-22 00:49:54', '2019-10-22 00:49:54'),
(269, 'Kota Cilegon', 16, '2019-10-22 00:49:54', '2019-10-22 00:49:54'),
(270, 'Kota Serang', 16, '2019-10-22 00:49:54', '2019-10-22 00:49:54'),
(271, 'Kota Tangerang Selatan', 16, '2019-10-22 00:49:54', '2019-10-22 00:49:54'),
(272, 'Kab. Jembrana', 17, '2019-10-22 00:49:54', '2019-10-22 00:49:54'),
(273, 'Kab. Tabanan', 17, '2019-10-22 00:49:54', '2019-10-22 00:49:54'),
(274, 'Kab. Badung', 17, '2019-10-22 00:49:54', '2019-10-22 00:49:54'),
(275, 'Kab. Gianyar', 17, '2019-10-22 00:49:54', '2019-10-22 00:49:54'),
(276, 'Kab. Klungkung', 17, '2019-10-22 00:49:54', '2019-10-22 00:49:54'),
(277, 'Kab. Bangli', 17, '2019-10-22 00:49:54', '2019-10-22 00:49:54'),
(278, 'Kab. Karang Asem', 17, '2019-10-22 00:49:54', '2019-10-22 00:49:54'),
(279, 'Kab. Buleleng', 17, '2019-10-22 00:49:54', '2019-10-22 00:49:54'),
(280, 'Kota Denpasar', 17, '2019-10-22 00:49:54', '2019-10-22 00:49:54'),
(281, 'Kab. Lombok Barat', 18, '2019-10-22 00:49:54', '2019-10-22 00:49:54'),
(282, 'Kab. Lombok Tengah', 18, '2019-10-22 00:49:54', '2019-10-22 00:49:54'),
(283, 'Kab. Lombok Timur', 18, '2019-10-22 00:49:54', '2019-10-22 00:49:54'),
(284, 'Kab. Sumbawa', 18, '2019-10-22 00:49:54', '2019-10-22 00:49:54'),
(285, 'Kab. Dompu', 18, '2019-10-22 00:49:54', '2019-10-22 00:49:54'),
(286, 'Kab. Bima', 18, '2019-10-22 00:49:54', '2019-10-22 00:49:54'),
(287, 'Kab. Sumbawa Barat', 18, '2019-10-22 00:49:54', '2019-10-22 00:49:54'),
(288, 'Kab. Lombok Utara', 18, '2019-10-22 00:49:54', '2019-10-22 00:49:54'),
(289, 'Kota Mataram', 18, '2019-10-22 00:49:54', '2019-10-22 00:49:54'),
(290, 'Kota Bima', 18, '2019-10-22 00:49:54', '2019-10-22 00:49:54'),
(291, 'Kab. Sumba Barat', 19, '2019-10-22 00:49:55', '2019-10-22 00:49:55'),
(292, 'Kab. Sumba Timur', 19, '2019-10-22 00:49:55', '2019-10-22 00:49:55'),
(293, 'Kab. Kupang', 19, '2019-10-22 00:49:55', '2019-10-22 00:49:55'),
(294, 'Kab. Timor Tengah Selatan', 19, '2019-10-22 00:49:55', '2019-10-22 00:49:55'),
(295, 'Kab. Timor Tengah Utara', 19, '2019-10-22 00:49:55', '2019-10-22 00:49:55'),
(296, 'Kab. Belu', 19, '2019-10-22 00:49:55', '2019-10-22 00:49:55'),
(297, 'Kab. Alor', 19, '2019-10-22 00:49:55', '2019-10-22 00:49:55'),
(298, 'Kab. Lembata', 19, '2019-10-22 00:49:55', '2019-10-22 00:49:55'),
(299, 'Kab. Flores Timur', 19, '2019-10-22 00:49:55', '2019-10-22 00:49:55'),
(300, 'Kab. Sikka', 19, '2019-10-22 00:49:55', '2019-10-22 00:49:55'),
(301, 'Kab. Ende', 19, '2019-10-22 00:49:55', '2019-10-22 00:49:55'),
(302, 'Kab. Ngada', 19, '2019-10-22 00:49:55', '2019-10-22 00:49:55'),
(303, 'Kab. Manggarai', 19, '2019-10-22 00:49:55', '2019-10-22 00:49:55'),
(304, 'Kab. Rote Ndao', 19, '2019-10-22 00:49:55', '2019-10-22 00:49:55'),
(305, 'Kab. Manggarai Barat', 19, '2019-10-22 00:49:55', '2019-10-22 00:49:55'),
(306, 'Kab. Sumba Tengah', 19, '2019-10-22 00:49:55', '2019-10-22 00:49:55'),
(307, 'Kab. Sumba Barat Daya', 19, '2019-10-22 00:49:55', '2019-10-22 00:49:55'),
(308, 'Kab. Nagekeo', 19, '2019-10-22 00:49:55', '2019-10-22 00:49:55'),
(309, 'Kab. Manggarai Timur', 19, '2019-10-22 00:49:55', '2019-10-22 00:49:55'),
(310, 'Kab. Sabu Raijua', 19, '2019-10-22 00:49:55', '2019-10-22 00:49:55'),
(311, 'Kota Kupang', 19, '2019-10-22 00:49:55', '2019-10-22 00:49:55'),
(312, 'Kab. Sambas', 20, '2019-10-22 00:49:55', '2019-10-22 00:49:55'),
(313, 'Kab. Bengkayang', 20, '2019-10-22 00:49:55', '2019-10-22 00:49:55'),
(314, 'Kab. Landak', 20, '2019-10-22 00:49:55', '2019-10-22 00:49:55'),
(315, 'Kab. Pontianak', 20, '2019-10-22 00:49:55', '2019-10-22 00:49:55'),
(316, 'Kab. Sanggau', 20, '2019-10-22 00:49:55', '2019-10-22 00:49:55'),
(317, 'Kab. Ketapang', 20, '2019-10-22 00:49:55', '2019-10-22 00:49:55'),
(318, 'Kab. Sintang', 20, '2019-10-22 00:49:55', '2019-10-22 00:49:55'),
(319, 'Kab. Kapuas Hulu', 20, '2019-10-22 00:49:55', '2019-10-22 00:49:55'),
(320, 'Kab. Sekadau', 20, '2019-10-22 00:49:55', '2019-10-22 00:49:55'),
(321, 'Kab. Melawi', 20, '2019-10-22 00:49:55', '2019-10-22 00:49:55'),
(322, 'Kab. Kayong Utara', 20, '2019-10-22 00:49:55', '2019-10-22 00:49:55'),
(323, 'Kab. Kubu Raya', 20, '2019-10-22 00:49:55', '2019-10-22 00:49:55'),
(324, 'Kota Pontianak', 20, '2019-10-22 00:49:55', '2019-10-22 00:49:55'),
(325, 'Kota Singkawang', 20, '2019-10-22 00:49:56', '2019-10-22 00:49:56'),
(326, 'Kab. Kotawaringin Barat', 21, '2019-10-22 00:49:56', '2019-10-22 00:49:56'),
(327, 'Kab. Kotawaringin Timur', 21, '2019-10-22 00:49:56', '2019-10-22 00:49:56'),
(328, 'Kab. Kapuas', 21, '2019-10-22 00:49:56', '2019-10-22 00:49:56'),
(329, 'Kab. Barito Selatan', 21, '2019-10-22 00:49:56', '2019-10-22 00:49:56'),
(330, 'Kab. Barito Utara', 21, '2019-10-22 00:49:56', '2019-10-22 00:49:56'),
(331, 'Kab. Sukamara', 21, '2019-10-22 00:49:56', '2019-10-22 00:49:56'),
(332, 'Kab. Lamandau', 21, '2019-10-22 00:49:56', '2019-10-22 00:49:56'),
(333, 'Kab. Seruyan', 21, '2019-10-22 00:49:56', '2019-10-22 00:49:56'),
(334, 'Kab. Katingan', 21, '2019-10-22 00:49:56', '2019-10-22 00:49:56'),
(335, 'Kab. Pulang Pisau', 21, '2019-10-22 00:49:56', '2019-10-22 00:49:56'),
(336, 'Kab. Gunung Mas', 21, '2019-10-22 00:49:56', '2019-10-22 00:49:56'),
(337, 'Kab. Barito Timur', 21, '2019-10-22 00:49:56', '2019-10-22 00:49:56'),
(338, 'Kab. Murung Raya', 21, '2019-10-22 00:49:56', '2019-10-22 00:49:56'),
(339, 'Kota Palangka Raya', 21, '2019-10-22 00:49:56', '2019-10-22 00:49:56'),
(340, 'Kab. Tanah Laut', 22, '2019-10-22 00:49:56', '2019-10-22 00:49:56'),
(341, 'Kab. Kota Baru', 22, '2019-10-22 00:49:56', '2019-10-22 00:49:56'),
(342, 'Kab. Banjar', 22, '2019-10-22 00:49:56', '2019-10-22 00:49:56'),
(343, 'Kab. Barito Kuala', 22, '2019-10-22 00:49:56', '2019-10-22 00:49:56'),
(344, 'Kab. Tapin', 22, '2019-10-22 00:49:56', '2019-10-22 00:49:56'),
(345, 'Kab. Hulu Sungai Selatan', 22, '2019-10-22 00:49:56', '2019-10-22 00:49:56'),
(346, 'Kab. Hulu Sungai Tengah', 22, '2019-10-22 00:49:56', '2019-10-22 00:49:56'),
(347, 'Kab. Hulu Sungai Utara', 22, '2019-10-22 00:49:56', '2019-10-22 00:49:56'),
(348, 'Kab. Tabalong', 22, '2019-10-22 00:49:56', '2019-10-22 00:49:56'),
(349, 'Kab. Tanah Bumbu', 22, '2019-10-22 00:49:56', '2019-10-22 00:49:56'),
(350, 'Kab. Balangan', 22, '2019-10-22 00:49:56', '2019-10-22 00:49:56'),
(351, 'Kota Banjarmasin', 22, '2019-10-22 00:49:56', '2019-10-22 00:49:56'),
(352, 'Kota Banjar Baru', 22, '2019-10-22 00:49:56', '2019-10-22 00:49:56'),
(353, 'Kab. Paser', 23, '2019-10-22 00:49:57', '2019-10-22 00:49:57'),
(354, 'Kab. Kutai Barat', 23, '2019-10-22 00:49:57', '2019-10-22 00:49:57'),
(355, 'Kab. Kutai Kartanegara', 23, '2019-10-22 00:49:57', '2019-10-22 00:49:57'),
(356, 'Kab. Kutai Timur', 23, '2019-10-22 00:49:57', '2019-10-22 00:49:57'),
(357, 'Kab. Berau', 23, '2019-10-22 00:49:57', '2019-10-22 00:49:57'),
(358, 'Kab. Penajam Paser Utara', 23, '2019-10-22 00:49:57', '2019-10-22 00:49:57'),
(359, 'Kota Balikpapan', 23, '2019-10-22 00:49:57', '2019-10-22 00:49:57'),
(360, 'Kota Samarinda', 23, '2019-10-22 00:49:57', '2019-10-22 00:49:57'),
(361, 'Kota Bontang', 23, '2019-10-22 00:49:57', '2019-10-22 00:49:57'),
(362, 'Kab. Malinau', 24, '2019-10-22 00:49:57', '2019-10-22 00:49:57'),
(363, 'Kab. Bulungan', 24, '2019-10-22 00:49:57', '2019-10-22 00:49:57'),
(364, 'Kab. Tana Tidung', 24, '2019-10-22 00:49:57', '2019-10-22 00:49:57'),
(365, 'Kab. Nunukan', 24, '2019-10-22 00:49:57', '2019-10-22 00:49:57'),
(366, 'Kota Tarakan', 24, '2019-10-22 00:49:57', '2019-10-22 00:49:57'),
(367, 'Kab. Bolaang Mongondow', 25, '2019-10-22 00:49:57', '2019-10-22 00:49:57'),
(368, 'Kab. Minahasa', 25, '2019-10-22 00:49:57', '2019-10-22 00:49:57'),
(369, 'Kab. Kepulauan Sangihe', 25, '2019-10-22 00:49:57', '2019-10-22 00:49:57'),
(370, 'Kab. Kepulauan Talaud', 25, '2019-10-22 00:49:57', '2019-10-22 00:49:57'),
(371, 'Kab. Minahasa Selatan', 25, '2019-10-22 00:49:57', '2019-10-22 00:49:57'),
(372, 'Kab. Minahasa Utara', 25, '2019-10-22 00:49:57', '2019-10-22 00:49:57'),
(373, 'Kab. Bolaang Mongondow Utara', 25, '2019-10-22 00:49:57', '2019-10-22 00:49:57'),
(374, 'Kab. Siau Tagulandang Biaro', 25, '2019-10-22 00:49:57', '2019-10-22 00:49:57'),
(375, 'Kab. Minahasa Tenggara', 25, '2019-10-22 00:49:57', '2019-10-22 00:49:57'),
(376, 'Kab. Bolaang Mongondow Selatan', 25, '2019-10-22 00:49:57', '2019-10-22 00:49:57'),
(377, 'Kab. Bolaang Mongondow Timur', 25, '2019-10-22 00:49:57', '2019-10-22 00:49:57'),
(378, 'Kota Manado', 25, '2019-10-22 00:49:57', '2019-10-22 00:49:57'),
(379, 'Kota Bitung', 25, '2019-10-22 00:49:57', '2019-10-22 00:49:57'),
(380, 'Kota Tomohon', 25, '2019-10-22 00:49:57', '2019-10-22 00:49:57'),
(381, 'Kota Kotamobagu', 25, '2019-10-22 00:49:57', '2019-10-22 00:49:57'),
(382, 'Kab. Banggai Kepulauan', 26, '2019-10-22 00:49:58', '2019-10-22 00:49:58'),
(383, 'Kab. Banggai', 26, '2019-10-22 00:49:58', '2019-10-22 00:49:58'),
(384, 'Kab. Morowali', 26, '2019-10-22 00:49:58', '2019-10-22 00:49:58'),
(385, 'Kab. Poso', 26, '2019-10-22 00:49:58', '2019-10-22 00:49:58'),
(386, 'Kab. Donggala', 26, '2019-10-22 00:49:58', '2019-10-22 00:49:58'),
(387, 'Kab. Toli-toli', 26, '2019-10-22 00:49:58', '2019-10-22 00:49:58'),
(388, 'Kab. Buol', 26, '2019-10-22 00:49:58', '2019-10-22 00:49:58'),
(389, 'Kab. Parigi Moutong', 26, '2019-10-22 00:49:58', '2019-10-22 00:49:58'),
(390, 'Kab. Tojo Una-una', 26, '2019-10-22 00:49:58', '2019-10-22 00:49:58'),
(391, 'Kab. Sigi', 26, '2019-10-22 00:49:58', '2019-10-22 00:49:58'),
(392, 'Kota Palu', 26, '2019-10-22 00:49:58', '2019-10-22 00:49:58'),
(393, 'Kab. Kepulauan Selayar', 27, '2019-10-22 00:49:58', '2019-10-22 00:49:58'),
(394, 'Kab. Bulukumba', 27, '2019-10-22 00:49:58', '2019-10-22 00:49:58'),
(395, 'Kab. Bantaeng', 27, '2019-10-22 00:49:58', '2019-10-22 00:49:58'),
(396, 'Kab. Jeneponto', 27, '2019-10-22 00:49:58', '2019-10-22 00:49:58'),
(397, 'Kab. Takalar', 27, '2019-10-22 00:49:58', '2019-10-22 00:49:58'),
(398, 'Kab. Gowa', 27, '2019-10-22 00:49:58', '2019-10-22 00:49:58'),
(399, 'Kab. Sinjai', 27, '2019-10-22 00:49:58', '2019-10-22 00:49:58'),
(400, 'Kab. Maros', 27, '2019-10-22 00:49:58', '2019-10-22 00:49:58'),
(401, 'Kab. Pangkajene Dan Kepulauan', 27, '2019-10-22 00:49:58', '2019-10-22 00:49:58'),
(402, 'Kab. Barru', 27, '2019-10-22 00:49:58', '2019-10-22 00:49:58'),
(403, 'Kab. Bone', 27, '2019-10-22 00:49:58', '2019-10-22 00:49:58'),
(404, 'Kab. Soppeng', 27, '2019-10-22 00:49:58', '2019-10-22 00:49:58'),
(405, 'Kab. Wajo', 27, '2019-10-22 00:49:58', '2019-10-22 00:49:58'),
(406, 'Kab. Sidenreng Rappang', 27, '2019-10-22 00:49:58', '2019-10-22 00:49:58'),
(407, 'Kab. Pinrang', 27, '2019-10-22 00:49:58', '2019-10-22 00:49:58'),
(408, 'Kab. Enrekang', 27, '2019-10-22 00:49:58', '2019-10-22 00:49:58'),
(409, 'Kab. Luwu', 27, '2019-10-22 00:49:59', '2019-10-22 00:49:59'),
(410, 'Kab. Tana Toraja', 27, '2019-10-22 00:49:59', '2019-10-22 00:49:59'),
(411, 'Kab. Luwu Utara', 27, '2019-10-22 00:49:59', '2019-10-22 00:49:59'),
(412, 'Kab. Luwu Timur', 27, '2019-10-22 00:49:59', '2019-10-22 00:49:59'),
(413, 'Kab. Toraja Utara', 27, '2019-10-22 00:49:59', '2019-10-22 00:49:59'),
(414, 'Kota Makassar', 27, '2019-10-22 00:49:59', '2019-10-22 00:49:59'),
(415, 'Kota Parepare', 27, '2019-10-22 00:49:59', '2019-10-22 00:49:59'),
(416, 'Kota Palopo', 27, '2019-10-22 00:49:59', '2019-10-22 00:49:59'),
(417, 'Kab. Buton', 28, '2019-10-22 00:49:59', '2019-10-22 00:49:59'),
(418, 'Kab. Muna', 28, '2019-10-22 00:49:59', '2019-10-22 00:49:59'),
(419, 'Kab. Konawe', 28, '2019-10-22 00:49:59', '2019-10-22 00:49:59'),
(420, 'Kab. Kolaka', 28, '2019-10-22 00:49:59', '2019-10-22 00:49:59'),
(421, 'Kab. Konawe Selatan', 28, '2019-10-22 00:49:59', '2019-10-22 00:49:59'),
(422, 'Kab. Bombana', 28, '2019-10-22 00:49:59', '2019-10-22 00:49:59'),
(423, 'Kab. Wakatobi', 28, '2019-10-22 00:49:59', '2019-10-22 00:49:59'),
(424, 'Kab. Kolaka Utara', 28, '2019-10-22 00:49:59', '2019-10-22 00:49:59'),
(425, 'Kab. Buton Utara', 28, '2019-10-22 00:49:59', '2019-10-22 00:49:59'),
(426, 'Kab. Konawe Utara', 28, '2019-10-22 00:49:59', '2019-10-22 00:49:59'),
(427, 'Kota Kendari', 28, '2019-10-22 00:49:59', '2019-10-22 00:49:59'),
(428, 'Kota Baubau', 28, '2019-10-22 00:49:59', '2019-10-22 00:49:59'),
(429, 'Kab. Boalemo', 29, '2019-10-22 00:49:59', '2019-10-22 00:49:59'),
(430, 'Kab. Gorontalo', 29, '2019-10-22 00:49:59', '2019-10-22 00:49:59'),
(431, 'Kab. Pohuwato', 29, '2019-10-22 00:49:59', '2019-10-22 00:49:59'),
(432, 'Kab. Bone Bolango', 29, '2019-10-22 00:49:59', '2019-10-22 00:49:59'),
(433, 'Kab. Gorontalo Utara', 29, '2019-10-22 00:49:59', '2019-10-22 00:49:59'),
(434, 'Kota Gorontalo', 29, '2019-10-22 00:49:59', '2019-10-22 00:49:59'),
(435, 'Kab. Majene', 30, '2019-10-22 00:50:00', '2019-10-22 00:50:00'),
(436, 'Kab. Polewali Mandar', 30, '2019-10-22 00:50:00', '2019-10-22 00:50:00'),
(437, 'Kab. Mamasa', 30, '2019-10-22 00:50:00', '2019-10-22 00:50:00'),
(438, 'Kab. Mamuju', 30, '2019-10-22 00:50:00', '2019-10-22 00:50:00'),
(439, 'Kab. Mamuju Utara', 30, '2019-10-22 00:50:00', '2019-10-22 00:50:00'),
(440, 'Kab. Maluku Tenggara Barat', 31, '2019-10-22 00:50:00', '2019-10-22 00:50:00'),
(441, 'Kab. Maluku Tenggara', 31, '2019-10-22 00:50:00', '2019-10-22 00:50:00'),
(442, 'Kab. Maluku Tengah', 31, '2019-10-22 00:50:00', '2019-10-22 00:50:00'),
(443, 'Kab. Buru', 31, '2019-10-22 00:50:00', '2019-10-22 00:50:00'),
(444, 'Kab. Kepulauan Aru', 31, '2019-10-22 00:50:00', '2019-10-22 00:50:00'),
(445, 'Kab. Seram Bagian Barat', 31, '2019-10-22 00:50:00', '2019-10-22 00:50:00'),
(446, 'Kab. Seram Bagian Timur', 31, '2019-10-22 00:50:00', '2019-10-22 00:50:00'),
(447, 'Kab. Maluku Barat Daya', 31, '2019-10-22 00:50:00', '2019-10-22 00:50:00'),
(448, 'Kab. Buru Selatan', 31, '2019-10-22 00:50:00', '2019-10-22 00:50:00'),
(449, 'Kota Ambon', 31, '2019-10-22 00:50:00', '2019-10-22 00:50:00'),
(450, 'Kota Tual', 31, '2019-10-22 00:50:00', '2019-10-22 00:50:00'),
(451, 'Kab. Halmahera Barat', 32, '2019-10-22 00:50:00', '2019-10-22 00:50:00'),
(452, 'Kab. Halmahera Tengah', 32, '2019-10-22 00:50:00', '2019-10-22 00:50:00'),
(453, 'Kab. Kepulauan Sula', 32, '2019-10-22 00:50:00', '2019-10-22 00:50:00'),
(454, 'Kab. Halmahera Selatan', 32, '2019-10-22 00:50:00', '2019-10-22 00:50:00'),
(455, 'Kab. Halmahera Utara', 32, '2019-10-22 00:50:00', '2019-10-22 00:50:00'),
(456, 'Kab. Halmahera Timur', 32, '2019-10-22 00:50:00', '2019-10-22 00:50:00'),
(457, 'Kab. Pulau Morotai', 32, '2019-10-22 00:50:00', '2019-10-22 00:50:00'),
(458, 'Kota Ternate', 32, '2019-10-22 00:50:00', '2019-10-22 00:50:00'),
(459, 'Kota Tidore Kepulauan', 32, '2019-10-22 00:50:00', '2019-10-22 00:50:00'),
(460, 'Kab. Fakfak', 33, '2019-10-22 00:50:00', '2019-10-22 00:50:00'),
(461, 'Kab. Kaimana', 33, '2019-10-22 00:50:00', '2019-10-22 00:50:00'),
(462, 'Kab. Teluk Wondama', 33, '2019-10-22 00:50:00', '2019-10-22 00:50:00'),
(463, 'Kab. Teluk Bintuni', 33, '2019-10-22 00:50:00', '2019-10-22 00:50:00'),
(464, 'Kab. Manokwari', 33, '2019-10-22 00:50:00', '2019-10-22 00:50:00'),
(465, 'Kab. Sorong Selatan', 33, '2019-10-22 00:50:00', '2019-10-22 00:50:00'),
(466, 'Kab. Sorong', 33, '2019-10-22 00:50:00', '2019-10-22 00:50:00'),
(467, 'Kab. Raja Ampat', 33, '2019-10-22 00:50:00', '2019-10-22 00:50:00'),
(468, 'Kab. Tambrauw', 33, '2019-10-22 00:50:01', '2019-10-22 00:50:01'),
(469, 'Kab. Maybrat', 33, '2019-10-22 00:50:01', '2019-10-22 00:50:01'),
(470, 'Kota Sorong', 33, '2019-10-22 00:50:01', '2019-10-22 00:50:01'),
(471, 'Kab. Merauke', 34, '2019-10-22 00:50:01', '2019-10-22 00:50:01'),
(472, 'Kab. Jayawijaya', 34, '2019-10-22 00:50:01', '2019-10-22 00:50:01'),
(473, 'Kab. Jayapura', 34, '2019-10-22 00:50:01', '2019-10-22 00:50:01'),
(474, 'Kab. Nabire', 34, '2019-10-22 00:50:01', '2019-10-22 00:50:01'),
(475, 'Kab. Kepulauan Yapen', 34, '2019-10-22 00:50:01', '2019-10-22 00:50:01'),
(476, 'Kab. Biak Numfor', 34, '2019-10-22 00:50:01', '2019-10-22 00:50:01'),
(477, 'Kab. Paniai', 34, '2019-10-22 00:50:01', '2019-10-22 00:50:01'),
(478, 'Kab. Puncak Jaya', 34, '2019-10-22 00:50:01', '2019-10-22 00:50:01'),
(479, 'Kab. Mimika', 34, '2019-10-22 00:50:01', '2019-10-22 00:50:01'),
(480, 'Kab. Boven Digoel', 34, '2019-10-22 00:50:01', '2019-10-22 00:50:01'),
(481, 'Kab. Mappi', 34, '2019-10-22 00:50:01', '2019-10-22 00:50:01'),
(482, 'Kab. Asmat', 34, '2019-10-22 00:50:01', '2019-10-22 00:50:01'),
(483, 'Kab. Yahukimo', 34, '2019-10-22 00:50:01', '2019-10-22 00:50:01'),
(484, 'Kab. Pegunungan Bintang', 34, '2019-10-22 00:50:01', '2019-10-22 00:50:01'),
(485, 'Kab. Tolikara', 34, '2019-10-22 00:50:01', '2019-10-22 00:50:01'),
(486, 'Kab. Sarmi', 34, '2019-10-22 00:50:01', '2019-10-22 00:50:01'),
(487, 'Kab. Keerom', 34, '2019-10-22 00:50:01', '2019-10-22 00:50:01'),
(488, 'Kab. Waropen', 34, '2019-10-22 00:50:01', '2019-10-22 00:50:01'),
(489, 'Kab. Supiori', 34, '2019-10-22 00:50:01', '2019-10-22 00:50:01'),
(490, 'Kab. Mamberamo Raya', 34, '2019-10-22 00:50:01', '2019-10-22 00:50:01'),
(491, 'Kab. Nduga', 34, '2019-10-22 00:50:01', '2019-10-22 00:50:01'),
(492, 'Kab. Lanny Jaya', 34, '2019-10-22 00:50:01', '2019-10-22 00:50:01'),
(493, 'Kab. Mamberamo Tengah', 34, '2019-10-22 00:50:01', '2019-10-22 00:50:01'),
(494, 'Kab. Yalimo', 34, '2019-10-22 00:50:01', '2019-10-22 00:50:01'),
(495, 'Kab. Puncak', 34, '2019-10-22 00:50:01', '2019-10-22 00:50:01'),
(496, 'Kab. Dogiyai', 34, '2019-10-22 00:50:01', '2019-10-22 00:50:01'),
(497, 'Kab. Intan Jaya', 34, '2019-10-22 00:50:01', '2019-10-22 00:50:01'),
(498, 'Kab. Deiyai', 34, '2019-10-22 00:50:01', '2019-10-22 00:50:01'),
(499, 'Kota Jayapura', 34, '2019-10-22 00:50:01', '2019-10-22 00:50:01');

-- --------------------------------------------------------

--
-- Struktur dari tabel `coa`
--

CREATE TABLE `coa` (
  `id_coa` int(11) NOT NULL,
  `name` text CHARACTER SET latin1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

--
-- Dumping data untuk tabel `coa`
--

INSERT INTO `coa` (`id_coa`, `name`) VALUES
(1, 'Aktiva'),
(2, 'Kewajiban'),
(3, 'Aktiva Bersih'),
(4, 'Penerimaan'),
(5, 'Biaya');

-- --------------------------------------------------------

--
-- Struktur dari tabel `component_jadwal`
--

CREATE TABLE `component_jadwal` (
  `id_component_jadwal` int(11) NOT NULL,
  `tanggal` date DEFAULT NULL,
  `idjam_fk` int(11) DEFAULT NULL,
  `idguru_fk` int(11) DEFAULT NULL,
  `idpelajaran_fk` int(11) DEFAULT NULL,
  `idkelas_fk` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Struktur dari tabel `component_penilaian_kinerja_guru`
--

CREATE TABLE `component_penilaian_kinerja_guru` (
  `id_component_penilaian_kinerja_guru` int(11) NOT NULL,
  `idpenilaiankinerjaguru_fk` int(11) DEFAULT NULL,
  `idsubkompetensipkg_fk` int(11) DEFAULT NULL,
  `nilai` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Struktur dari tabel `department`
--

CREATE TABLE `department` (
  `id_department` int(11) NOT NULL,
  `department` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `department`
--

INSERT INTO `department` (`id_department`, `department`) VALUES
(1, 'SMK'),
(2, 'SMP');

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_pemasukan_lain`
--

CREATE TABLE `detail_pemasukan_lain` (
  `id_detail_pemasukan_lain` int(11) NOT NULL,
  `idpemasukanlain_fk` int(11) DEFAULT NULL,
  `keterangan` text,
  `jumlah` double(20,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_pengeluaran_lain`
--

CREATE TABLE `detail_pengeluaran_lain` (
  `id_detail_pengeluaran_lain` int(11) NOT NULL,
  `idpengeluaranlain_fk` int(11) DEFAULT NULL,
  `keterangan` text,
  `jumlah` double(20,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_transaksi_tanggungan_alumni`
--

CREATE TABLE `detail_transaksi_tanggungan_alumni` (
  `id_detail_transaksi_tanggungan_alumni` int(1) NOT NULL,
  `idtanggunganalumni_fk` int(11) DEFAULT NULL,
  `jumlah` decimal(10,0) DEFAULT NULL,
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `idtransaksitanggunganalumni_fk` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `detail_transaksi_tanggungan_alumni`
--

INSERT INTO `detail_transaksi_tanggungan_alumni` (`id_detail_transaksi_tanggungan_alumni`, `idtanggunganalumni_fk`, `jumlah`, `create_at`, `idtransaksitanggunganalumni_fk`) VALUES
(1, 3, '15000', '2022-08-23 05:14:33', 1),
(2, 6, '20000', '2022-08-23 05:14:33', 1),
(3, 3, '15000', '2022-08-23 05:18:33', 2),
(4, 6, '150000', '2022-08-23 05:18:33', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_transaksi_tanggungan_siswa`
--

CREATE TABLE `detail_transaksi_tanggungan_siswa` (
  `id_detail_transaksi_tanggungan_siswa` int(1) NOT NULL,
  `idjenispenerimaan_fk` int(11) DEFAULT NULL,
  `jumlah` decimal(10,0) DEFAULT NULL,
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `idtransaksitanggungansiswa_fk` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `dokumen_pegawai`
--

CREATE TABLE `dokumen_pegawai` (
  `id_dokumen_pegawai` int(11) NOT NULL,
  `idguru_fk` int(11) DEFAULT NULL,
  `nama` text CHARACTER SET latin1,
  `file` text CHARACTER SET latin1,
  `keterangan` text CHARACTER SET latin1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Struktur dari tabel `dudi`
--

CREATE TABLE `dudi` (
  `id_dudi` int(11) NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `no_hp` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `dudi`
--

INSERT INTO `dudi` (`id_dudi`, `nama`, `alamat`, `no_hp`) VALUES
(2, 'PT. Integritas Papua Mandiri', 'Papua', '085894635005'),
(3, 'PT. Sakti Kinarya', 'Jakarta', '0858946350051'),
(4, 'PT. Myber Center', 'Malang', '085894635005');

-- --------------------------------------------------------

--
-- Struktur dari tabel `erapor`
--

CREATE TABLE `erapor` (
  `id_erapor` int(11) NOT NULL,
  `tanggal_mulai` date DEFAULT NULL,
  `tanggal_selesai` date DEFAULT NULL,
  `kode` text CHARACTER SET latin1,
  `is_active` int(255) DEFAULT '0',
  `keterangan` text CHARACTER SET latin1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

--
-- Dumping data untuk tabel `erapor`
--

INSERT INTO `erapor` (`id_erapor`, `tanggal_mulai`, `tanggal_selesai`, `kode`, `is_active`, `keterangan`) VALUES
(1, '2021-07-09', '2021-07-16', 'ABS123', 1, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `event`
--

CREATE TABLE `event` (
  `id_event` int(11) NOT NULL,
  `event` text CHARACTER SET latin1,
  `tanggal` date DEFAULT NULL,
  `notulensi` text CHARACTER SET latin1,
  `file` text CHARACTER SET latin1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

--
-- Dumping data untuk tabel `event`
--

INSERT INTO `event` (`id_event`, `event`, `tanggal`, `notulensi`, `file`) VALUES
(1, 'Rapat Koordinasi', '2021-09-04', '', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `file_oas`
--

CREATE TABLE `file_oas` (
  `id_file_oas` int(11) NOT NULL,
  `file_oas` text CHARACTER SET latin1,
  `idsiswa_fk` int(11) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Struktur dari tabel `file_rapor_online`
--

CREATE TABLE `file_rapor_online` (
  `id_file_rapor_online` int(11) NOT NULL,
  `file_rapor_online` text CHARACTER SET latin1,
  `idsiswa_fk` int(11) DEFAULT NULL,
  `idtahunajaran_fk` int(11) DEFAULT NULL,
  `trans_code` text CHARACTER SET latin1,
  `status` int(11) DEFAULT '1',
  `is_active` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Struktur dari tabel `groups`
--

CREATE TABLE `groups` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data untuk tabel `groups`
--

INSERT INTO `groups` (`id`, `name`, `description`) VALUES
(1, 'admin', 'Administrator'),
(2, 'siswa', 'Siswa'),
(3, 'guru', 'Guru'),
(4, 'BK', 'BK'),
(5, 'kepsek', 'kepsek'),
(6, 'kurikulum', 'kurikulum'),
(7, 'tu', 'Tata Usaha'),
(8, 'kesiswaan', 'Kesiswaan'),
(9, 'kaprog', 'Kaprog'),
(10, 'koperasi', 'Koperasi'),
(11, 'ortu', 'ortu'),
(12, 'bendahara', 'Bendahara'),
(13, 'humas', 'Hubungan Masyarakat');

-- --------------------------------------------------------

--
-- Struktur dari tabel `guru`
--

CREATE TABLE `guru` (
  `id_guru` int(11) NOT NULL,
  `nama` text CHARACTER SET latin1,
  `nip` text CHARACTER SET latin1,
  `alamat` text CHARACTER SET latin1,
  `foto` text CHARACTER SET latin1,
  `pendidikan_terakhir` text CHARACTER SET latin1,
  `instansi` text CHARACTER SET latin1,
  `fb` text CHARACTER SET latin1,
  `ig` text CHARACTER SET latin1,
  `twitter` text CHARACTER SET latin1,
  `youtube` text CHARACTER SET latin1,
  `jabatan` text CHARACTER SET latin1,
  `email` text CHARACTER SET latin1,
  `no_hp` text CHARACTER SET latin1,
  `jenis_kelamin` text CHARACTER SET latin1,
  `tempat_lahir` text CHARACTER SET latin1,
  `agama` text CHARACTER SET latin1,
  `kewarganegaraan` text CHARACTER SET latin1,
  `status_pernikahan` text CHARACTER SET latin1,
  `status_rumah` text CHARACTER SET latin1,
  `jarak_ke_kantor` int(255) DEFAULT NULL,
  `bb` int(255) DEFAULT NULL,
  `tb` int(255) DEFAULT NULL,
  `gd` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `penyakit` text CHARACTER SET latin1,
  `kelainan` text CHARACTER SET latin1,
  `no_karpeg` text CHARACTER SET latin1,
  `mulai_bertugas` date DEFAULT NULL,
  `berasal_dari` text CHARACTER SET latin1,
  `tanggal_meninggalkan` text CHARACTER SET latin1,
  `alasan_meninggalkan` text CHARACTER SET latin1,
  `kode_pegawai` text CHARACTER SET latin1,
  `istri` text CHARACTER SET latin1,
  `status_kepegawaian` text CHARACTER SET latin1,
  `no_taspen` text CHARACTER SET latin1,
  `tanggal_lahir` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

--
-- Dumping data untuk tabel `guru`
--

INSERT INTO `guru` (`id_guru`, `nama`, `nip`, `alamat`, `foto`, `pendidikan_terakhir`, `instansi`, `fb`, `ig`, `twitter`, `youtube`, `jabatan`, `email`, `no_hp`, `jenis_kelamin`, `tempat_lahir`, `agama`, `kewarganegaraan`, `status_pernikahan`, `status_rumah`, `jarak_ke_kantor`, `bb`, `tb`, `gd`, `penyakit`, `kelainan`, `no_karpeg`, `mulai_bertugas`, `berasal_dari`, `tanggal_meninggalkan`, `alasan_meninggalkan`, `kode_pegawai`, `istri`, `status_kepegawaian`, `no_taspen`, `tanggal_lahir`) VALUES
(1, 'ALISSANDRI GARNASIS WIBERTH J, S.Pd', '123', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '082140815104', 'Laki-laki', '', 'Islam', 'WNI', 'Kawin', 'Rumah Pribadi', 0, 0, 0, 'A', '', '', '', '0000-00-00', '', '', '', 'G774572', '', 'PNS', '', '0000-00-00'),
(2, 'DIDIK EKO SURYANTO, S.Kom', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '081359283283', 'Laki-laki', '', 'Islam', 'WNI', 'Kawin', 'Rumah Pribadi', 0, 0, 0, 'A', '', '', '', '0000-00-00', '', '', '', 'G138370', '', 'PNS', '', '0000-00-00'),
(3, 'DINA EKASARI, S.Pd', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '085735874679', 'Perempuan', '', 'Islam', 'WNA', 'Kawin', 'Rumah Pribadi', 0, 0, 0, 'A', '', '', '', '0000-00-00', '', '', '', 'G478142', '', 'Non PNS', '', '0000-00-00'),
(4, 'FERDINA DIAN SULISTIANINGRUM, S.Pd', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', 'Perempuan', '', 'Islam', 'WNI', 'Kawin', 'Rumah Pribadi', 0, 0, 0, 'A', '', '', '', '0000-00-00', '', '', '', 'G647928', '', 'PNS', '', '0000-00-00'),
(5, 'FUAD EKO DARMINTO, S.T', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 'GELORA YUDHA SWARA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, 'HANIF MUKLISIN, S.Pd', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, 'IMAM QOMARUDDIN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, 'LINDA KHUSNUL QOTIMAH, S.Pd', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 'MUSTOFA KAMAL, S.Pd', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(11, 'MISNO, S.Pd.I', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(12, 'NGARIFIN, S.T', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(13, 'RINDIANA TRIA AGUS TINAWATI, S.P', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(14, 'RUDI HARTONO, ST', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(15, 'SITI UBADAH, S.Pd', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(16, 'TOFAN TRIA SAMODRA, S.Pd ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(17, 'TRIDON YANG ASTAMI, A.Md', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(18, 'YENI INDRI MAMIRI, S.Pd', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(20, 'YULI SUSANTI, S.Pd', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(21, 'FITRIYANI DUWI FATHUR ROHMAH, S.Pd.I', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(22, 'LAKUN BUDIONO, S.Pd.I', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(23, 'DIDIK YULYANTORO, S.Pd', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(24, 'DIAN NURUL AFIFAH, S.Pd', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(25, 'ENTRI HANDAYANI, A.P', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', 'Laki-laki', '', 'Islam', 'WNA', 'Kawin', 'Rumah Pribadi', 0, 0, 0, 'A', '', '', '', '0000-00-00', '', '', '', 'A2', '', 'Non PNS', '', '0000-00-00'),
(26, 'IMAM MUHTAROM', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', 'Laki-laki', '', 'Islam', 'WNA', 'Kawin', 'Rumah Pribadi', 0, 0, 0, 'A', '', '', '', '0000-00-00', '', '', '', 'A1', '', 'Non PNS', '', '0000-00-00'),
(27, 'Rendy Yani Susanto, S.Pd', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', 'Laki-laki', 'Malang', 'Islam', 'WNI', 'Kawin', 'Rumah Pribadi', 0, 0, 0, 'A', '', '', '', '0000-00-00', '', '', '', 'G518346', '', 'PNS', '', '0000-00-00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `guru_mapel`
--

CREATE TABLE `guru_mapel` (
  `id_guru_mapel` int(11) NOT NULL,
  `idguru_fk` int(11) DEFAULT NULL,
  `idmapel_fk` int(11) DEFAULT NULL,
  `idtahunajaran_fk` int(11) DEFAULT NULL,
  `idkelas_fk` int(11) DEFAULT NULL,
  `jKode` varchar(255) CHARACTER SET latin1 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

--
-- Dumping data untuk tabel `guru_mapel`
--

INSERT INTO `guru_mapel` (`id_guru_mapel`, `idguru_fk`, `idmapel_fk`, `idtahunajaran_fk`, `idkelas_fk`, `jKode`) VALUES
(2, 26, 1, 4, 39, NULL),
(3, 25, 2, 4, 39, NULL),
(4, 15, 1, 4, 41, NULL),
(5, 16, 2, 4, 41, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `hari`
--

CREATE TABLE `hari` (
  `id_hari` int(11) NOT NULL,
  `hari` text CHARACTER SET latin1,
  `code` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

--
-- Dumping data untuk tabel `hari`
--

INSERT INTO `hari` (`id_hari`, `hari`, `code`) VALUES
(1, 'Senin', 1),
(2, 'Selasa', 2),
(3, 'Rabu', 3),
(4, 'Kamis', 4),
(5, 'Jumat', 5),
(6, 'Sabtu', 6);

-- --------------------------------------------------------

--
-- Struktur dari tabel `hobi_pegawai`
--

CREATE TABLE `hobi_pegawai` (
  `id_hobi_pegawai` int(11) NOT NULL,
  `idguru_fk` int(11) DEFAULT NULL,
  `jenis` text CHARACTER SET latin1,
  `aktif` text CHARACTER SET latin1,
  `kapan` text CHARACTER SET latin1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Struktur dari tabel `induk_akun`
--

CREATE TABLE `induk_akun` (
  `id_induk_akun` int(11) NOT NULL,
  `no_akun` int(11) DEFAULT NULL,
  `nama` text CHARACTER SET latin1,
  `idcoa_fk` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

--
-- Dumping data untuk tabel `induk_akun`
--

INSERT INTO `induk_akun` (`id_induk_akun`, `no_akun`, `nama`, `idcoa_fk`) VALUES
(1, 11, 'Aktiva Lancar', 1),
(2, 12, 'Aktiva Tidak lancar', 1),
(3, 21, 'Kewajiban Lancar', 2),
(4, 22, 'Kewajiban Jangka Panjang', 2),
(5, 31, 'Modal Usaha', 3),
(6, 41, 'Perolehan', 4),
(7, 42, 'Pendapatan', 4),
(8, 43, 'Pendapatan Lain', 4),
(9, 51, 'Biaya Administrasi', 5),
(10, 52, 'Biaya Lain', 5);

-- --------------------------------------------------------

--
-- Struktur dari tabel `input_nilai_keterampilan`
--

CREATE TABLE `input_nilai_keterampilan` (
  `id_input_nilai_keterampilan` int(11) NOT NULL,
  `idmatapelajaran_fk` int(11) DEFAULT NULL,
  `idtahunajaran_fk` int(11) DEFAULT NULL,
  `trans_code` text CHARACTER SET latin1,
  `idguru_fk` int(11) DEFAULT NULL,
  `idkelas_fk` int(11) DEFAULT NULL,
  `idjenisketerampilan_fk` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Struktur dari tabel `input_nilai_pas`
--

CREATE TABLE `input_nilai_pas` (
  `id_input_nilai_pas` int(11) NOT NULL,
  `idmatapelajaran_fk` int(11) DEFAULT NULL,
  `idtahunajaran_fk` int(11) DEFAULT NULL,
  `trans_code` text CHARACTER SET latin1,
  `idguru_fk` int(11) DEFAULT NULL,
  `idkelas_fk` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Struktur dari tabel `input_nilai_pengetahuan`
--

CREATE TABLE `input_nilai_pengetahuan` (
  `id_input_nilai_pengetahuan` int(11) NOT NULL,
  `idmatapelajaran_fk` int(11) DEFAULT NULL,
  `idtahunajaran_fk` int(11) DEFAULT NULL,
  `trans_code` text CHARACTER SET latin1,
  `idguru_fk` int(11) DEFAULT NULL,
  `idkelas_fk` int(11) DEFAULT NULL,
  `idjenispengetahuan_fk` int(11) DEFAULT NULL,
  `kode` text CHARACTER SET latin1,
  `keterangan` text CHARACTER SET latin1,
  `idkd_fk` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Struktur dari tabel `input_nilai_pts`
--

CREATE TABLE `input_nilai_pts` (
  `id_input_nilai_pts` int(11) NOT NULL,
  `idmatapelajaran_fk` int(11) DEFAULT NULL,
  `idtahunajaran_fk` int(11) DEFAULT NULL,
  `trans_code` text CHARACTER SET latin1,
  `idguru_fk` int(11) DEFAULT NULL,
  `idkelas_fk` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Struktur dari tabel `iuran_wajib_siswa`
--

CREATE TABLE `iuran_wajib_siswa` (
  `id_iuran_wajib_siswa` int(11) NOT NULL,
  `nama` text CHARACTER SET latin1,
  `harga` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Struktur dari tabel `jadwal`
--

CREATE TABLE `jadwal` (
  `id_jadwal` int(11) NOT NULL,
  `tanggal` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

--
-- Dumping data untuk tabel `jadwal`
--

INSERT INTO `jadwal` (`id_jadwal`, `tanggal`) VALUES
(1, '2020-08-18');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jadwal_guru`
--

CREATE TABLE `jadwal_guru` (
  `id_jadwal_guru` int(11) NOT NULL,
  `idguru_fk` int(11) DEFAULT NULL,
  `idhari_fk` int(11) DEFAULT NULL,
  `jam_mulai` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `jam_selesai` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `idtahunajaran_fk` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

--
-- Dumping data untuk tabel `jadwal_guru`
--

INSERT INTO `jadwal_guru` (`id_jadwal_guru`, `idguru_fk`, `idhari_fk`, `jam_mulai`, `jam_selesai`, `create_at`, `idtahunajaran_fk`) VALUES
(1, 2, 1, '07.00', '15.00', '2022-08-01 11:24:31', 4),
(2, 3, 1, '07.00', '15.00', '2022-08-01 11:28:56', 4),
(3, 4, 1, '07.00', '15.00', '2022-08-01 11:29:19', 4),
(4, 5, 1, '07.00', '15.00', '2022-08-01 11:31:50', 4),
(5, 8, 1, '07:00', '16:33', '2022-08-01 11:33:26', 4),
(6, 14, 2, '07:39', '15:39', '2022-08-02 00:39:20', 4),
(7, 14, 4, '07:03', '16:03', '2022-08-03 13:03:45', 4);

-- --------------------------------------------------------

--
-- Struktur dari tabel `jadwal_pelajaran`
--

CREATE TABLE `jadwal_pelajaran` (
  `id_jadwal_pelajaran` int(11) NOT NULL,
  `idgurumapel_fk` int(11) DEFAULT NULL,
  `idhari_fk` int(11) DEFAULT NULL,
  `idjampelajaran_fk` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

--
-- Dumping data untuk tabel `jadwal_pelajaran`
--

INSERT INTO `jadwal_pelajaran` (`id_jadwal_pelajaran`, `idgurumapel_fk`, `idhari_fk`, `idjampelajaran_fk`) VALUES
(3, 4, 1, 1),
(4, 4, 1, 2),
(5, 5, 2, 1),
(6, 5, 2, 2),
(7, 5, 3, 1),
(8, 5, 3, 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `jam`
--

CREATE TABLE `jam` (
  `id_jam` int(11) NOT NULL,
  `nama` text CHARACTER SET latin1,
  `jam_mulai` text CHARACTER SET latin1,
  `jam_selesai` text CHARACTER SET latin1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

--
-- Dumping data untuk tabel `jam`
--

INSERT INTO `jam` (`id_jam`, `nama`, `jam_mulai`, `jam_selesai`) VALUES
(1, '1', '08.30', '10.00'),
(2, '2', '10.30', '12.00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jam_pelajaran`
--

CREATE TABLE `jam_pelajaran` (
  `id_jam_pelajaran` int(11) NOT NULL,
  `nama` text CHARACTER SET latin1,
  `jam_mulai` text CHARACTER SET latin1,
  `jam_selesai` text CHARACTER SET latin1,
  `idtahunajaran_fk` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

--
-- Dumping data untuk tabel `jam_pelajaran`
--

INSERT INTO `jam_pelajaran` (`id_jam_pelajaran`, `nama`, `jam_mulai`, `jam_selesai`, `idtahunajaran_fk`) VALUES
(1, '1', '07.00', '08.15', 4),
(2, '2', '08.30', '09.00', 4);

-- --------------------------------------------------------

--
-- Struktur dari tabel `jenis_kerjasama`
--

CREATE TABLE `jenis_kerjasama` (
  `id_jenis_kerjasama` int(11) NOT NULL,
  `jenis_kerjasama` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `jenis_kerjasama`
--

INSERT INTO `jenis_kerjasama` (`id_jenis_kerjasama`, `jenis_kerjasama`) VALUES
(2, 'Praktek Kerja Industri'),
(3, 'Lowongan Kerja'),
(4, 'Penyetaraan Kurikulum');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jenis_keterampilan`
--

CREATE TABLE `jenis_keterampilan` (
  `id_jenis_keterampilan` int(11) NOT NULL,
  `jenis_keterampilan` text CHARACTER SET latin1,
  `kode` text CHARACTER SET latin1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Struktur dari tabel `jenis_mata_pelajaran`
--

CREATE TABLE `jenis_mata_pelajaran` (
  `id_jenis_mata_pelajaran` int(11) NOT NULL,
  `jenis_mata_pelajaran` text CHARACTER SET latin1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Struktur dari tabel `jenis_pelanggaran`
--

CREATE TABLE `jenis_pelanggaran` (
  `id_jenis_pelanggaran` int(11) NOT NULL,
  `jenis_pelanggaran` text CHARACTER SET latin1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

--
-- Dumping data untuk tabel `jenis_pelanggaran`
--

INSERT INTO `jenis_pelanggaran` (`id_jenis_pelanggaran`, `jenis_pelanggaran`) VALUES
(1, 'CATATAN KERAPIAN'),
(2, 'CATATAN KEDISIPLINAN'),
(3, 'CATATAN LAIN'),
(4, 'CATATAN ADMINISTRASI'),
(6, 'CATATAN KETERLAMBATAN');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jenis_penerimaan`
--

CREATE TABLE `jenis_penerimaan` (
  `id_jenis_penerimaan` int(11) NOT NULL,
  `nama` text,
  `kas` text,
  `pendapatan` text,
  `piutang` text,
  `diskon` text,
  `is_edit` int(255) DEFAULT NULL,
  `bulanan` int(11) DEFAULT NULL,
  `template_nota` text,
  `idtahunajaran_fk` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data untuk tabel `jenis_penerimaan`
--

INSERT INTO `jenis_penerimaan` (`id_jenis_penerimaan`, `nama`, `kas`, `pendapatan`, `piutang`, `diskon`, `is_edit`, `bulanan`, `template_nota`, `idtahunajaran_fk`) VALUES
(1, 'SPP', '1', '20', '4', '33', NULL, NULL, 'INV/SPP/{date}/{rand}', 4),
(2, 'DSP', '1', '19', '4', '35', NULL, NULL, 'INV/DSP/{date}/{rand}', 4),
(3, 'Seragam', '1', '20', '4', '35', NULL, NULL, 'INV/SRG/{date}/{rand}', 4),
(4, 'Study Tour', '1', '21', '4', '35', NULL, NULL, 'INV/STD/{date}/{rand}', 1),
(5, 'Prakerin', '1', '19', '4', '35', NULL, NULL, 'SMKPEMDA/PRAKERIN/{date}/{rand}', 4),
(6, 'Dana Sosial', '1', '20', '4', '35', NULL, NULL, 'INV/DNS/{date}/{rand}', 4),
(7, 'Tanggungan Alumni', '1', '19', '4', '35', NULL, NULL, 'INV/BYRALUMNI/{date}/{rand}', 4);

-- --------------------------------------------------------

--
-- Struktur dari tabel `jenis_pengetahuan`
--

CREATE TABLE `jenis_pengetahuan` (
  `id_jenis_pengetahuan` int(11) NOT NULL,
  `jenis_pengetahuan` text CHARACTER SET latin1,
  `kode` text CHARACTER SET latin1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Struktur dari tabel `jenis_penilaian`
--

CREATE TABLE `jenis_penilaian` (
  `id_jenis_penilaian` int(11) NOT NULL,
  `jenis_penilaian` text CHARACTER SET latin1,
  `kode` varchar(255) CHARACTER SET latin1 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Struktur dari tabel `jurnal_guru`
--

CREATE TABLE `jurnal_guru` (
  `id_jurnal_guru` int(11) NOT NULL,
  `idguru_fk` int(11) DEFAULT NULL,
  `idkelas_fk` int(11) DEFAULT NULL,
  `idmapel_fk` int(11) DEFAULT NULL,
  `idtahunajaran_fk` int(11) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `uraian` text CHARACTER SET latin1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Struktur dari tabel `jurnal_umum`
--

CREATE TABLE `jurnal_umum` (
  `id_jurnal_umum` int(11) NOT NULL,
  `ref` text,
  `idakun_fk` int(11) DEFAULT NULL,
  `debit` double DEFAULT NULL,
  `kredit` double DEFAULT NULL,
  `keterangan` text,
  `table` text,
  `idtable_fk` int(11) DEFAULT NULL,
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

--
-- Dumping data untuk tabel `jurnal_umum`
--

INSERT INTO `jurnal_umum` (`id_jurnal_umum`, `ref`, `idakun_fk`, `debit`, `kredit`, `keterangan`, `table`, `idtable_fk`, `create_at`) VALUES
(9, '9443842', 4, 2500000, 0, 'Pendataan pembayaran tanggungan SPP siswa a/n ARIEF WAHYUDI', 'tanggungan', 5, '2022-07-24 00:43:04'),
(10, '9443842', 20, 0, 2500000, 'Pendataan pembayaran tanggungan SPP siswa a/n ARIEF WAHYUDI', 'tanggungan', 5, '2022-07-24 00:43:04'),
(11, '4876872', 4, 3000000, 0, 'Pendataan pembayaran tanggungan DSP siswa a/n ARIEF WAHYUDI', 'tanggungan', 6, '2022-07-24 00:43:04'),
(12, '4876872', 19, 0, 3000000, 'Pendataan pembayaran tanggungan DSP siswa a/n ARIEF WAHYUDI', 'tanggungan', 6, '2022-07-24 00:43:04'),
(13, '9209199', 4, 250000, 0, 'Pendataan pembayaran tanggungan Seragam siswa a/n ARIEF WAHYUDI', 'tanggungan', 7, '2022-07-24 00:43:04'),
(14, '9209199', 20, 0, 250000, 'Pendataan pembayaran tanggungan Seragam siswa a/n ARIEF WAHYUDI', 'tanggungan', 7, '2022-07-24 00:43:04'),
(15, '8307323', 4, 200000, 0, 'Pendataan pembayaran tanggungan Study Tour siswa a/n ARIEF WAHYUDI', 'tanggungan', 8, '2022-07-24 00:43:04'),
(16, '8307323', 21, 0, 200000, 'Pendataan pembayaran tanggungan Study Tour siswa a/n ARIEF WAHYUDI', 'tanggungan', 8, '2022-07-24 00:43:04'),
(17, '7369701', 1, 100000, 0, 'Pembayaran tanggungan SPP siswa a/n Santi Dwi Samsiyah', 'penerimaan', 1, '2022-07-24 07:53:20'),
(18, '7369701', 4, 0, 100000, 'Pembayaran tanggungan SPP siswa a/n Santi Dwi Samsiyah', 'penerimaan', 1, '2022-07-24 07:53:20'),
(19, '4552097', 1, 50000, 0, 'Pembayaran tanggungan Study Tour siswa a/n Santi Dwi Samsiyah', 'penerimaan', 2, '2022-07-25 07:22:09'),
(20, '4552097', 4, 0, 50000, 'Pembayaran tanggungan Study Tour siswa a/n Santi Dwi Samsiyah', 'penerimaan', 2, '2022-07-25 07:22:09'),
(21, '8535353', 4, 3000000, 0, 'Pendataan pembayaran tanggungan SPP siswa a/n ALBET DIMAS NURFENDI PRATAMA', 'tanggungan', 9, '2022-07-27 00:53:08'),
(22, '8535353', 20, 0, 3000000, 'Pendataan pembayaran tanggungan SPP siswa a/n ALBET DIMAS NURFENDI PRATAMA', 'tanggungan', 9, '2022-07-27 00:53:08'),
(23, '3280627', 4, 5000000, 0, 'Pendataan pembayaran tanggungan DSP siswa a/n ALBET DIMAS NURFENDI PRATAMA', 'tanggungan', 10, '2022-07-27 00:53:08'),
(24, '3280627', 19, 0, 5000000, 'Pendataan pembayaran tanggungan DSP siswa a/n ALBET DIMAS NURFENDI PRATAMA', 'tanggungan', 10, '2022-07-27 00:53:08'),
(25, '1106670', 4, 200000, 0, 'Pendataan pembayaran tanggungan Seragam siswa a/n ALBET DIMAS NURFENDI PRATAMA', 'tanggungan', 11, '2022-07-27 00:53:08'),
(26, '1106670', 20, 0, 200000, 'Pendataan pembayaran tanggungan Seragam siswa a/n ALBET DIMAS NURFENDI PRATAMA', 'tanggungan', 11, '2022-07-27 00:53:08'),
(27, '2426419', 4, 200000, 0, 'Pendataan pembayaran tanggungan Study Tour siswa a/n ALBET DIMAS NURFENDI PRATAMA', 'tanggungan', 12, '2022-07-27 00:53:08'),
(28, '2426419', 21, 0, 200000, 'Pendataan pembayaran tanggungan Study Tour siswa a/n ALBET DIMAS NURFENDI PRATAMA', 'tanggungan', 12, '2022-07-27 00:53:08'),
(29, '6074511', 4, 150000, 0, 'Pendataan pembayaran tanggungan Prakerin siswa a/n ALBET DIMAS NURFENDI PRATAMA', 'tanggungan', 13, '2022-07-27 00:53:08'),
(30, '6074511', 19, 0, 150000, 'Pendataan pembayaran tanggungan Prakerin siswa a/n ALBET DIMAS NURFENDI PRATAMA', 'tanggungan', 13, '2022-07-27 00:53:08'),
(31, '6182932', 1, 150000, 0, 'Pembayaran tanggungan Prakerin siswa a/n ALBET DIMAS NURFENDI PRATAMA', 'penerimaan', 3, '2022-07-27 00:54:00'),
(32, '6182932', 4, 0, 150000, 'Pembayaran tanggungan Prakerin siswa a/n ALBET DIMAS NURFENDI PRATAMA', 'penerimaan', 3, '2022-07-27 00:54:00'),
(33, '1824773', 4, 100000, 0, 'Pendataan pembayaran tanggungan SPP siswa a/n ADE NOVIYANTI', 'tanggungan', 14, '2022-07-29 01:25:27'),
(34, '1824773', 20, 0, 100000, 'Pendataan pembayaran tanggungan SPP siswa a/n ADE NOVIYANTI', 'tanggungan', 14, '2022-07-29 01:25:27'),
(35, '6833688', 4, 110000, 0, 'Pendataan pembayaran tanggungan DSP siswa a/n ADE NOVIYANTI', 'tanggungan', 15, '2022-07-29 01:25:27'),
(36, '6833688', 19, 0, 110000, 'Pendataan pembayaran tanggungan DSP siswa a/n ADE NOVIYANTI', 'tanggungan', 15, '2022-07-29 01:25:27'),
(37, '1827327', 4, 120000, 0, 'Pendataan pembayaran tanggungan Seragam siswa a/n ADE NOVIYANTI', 'tanggungan', 16, '2022-07-29 01:25:27'),
(38, '1827327', 20, 0, 120000, 'Pendataan pembayaran tanggungan Seragam siswa a/n ADE NOVIYANTI', 'tanggungan', 16, '2022-07-29 01:25:27'),
(39, '893921', 4, 130000, 0, 'Pendataan pembayaran tanggungan Study Tour siswa a/n ADE NOVIYANTI', 'tanggungan', 17, '2022-07-29 01:25:27'),
(40, '893921', 21, 0, 130000, 'Pendataan pembayaran tanggungan Study Tour siswa a/n ADE NOVIYANTI', 'tanggungan', 17, '2022-07-29 01:25:27'),
(41, '2964187', 4, 140000, 0, 'Pendataan pembayaran tanggungan Prakerin siswa a/n ADE NOVIYANTI', 'tanggungan', 18, '2022-07-29 01:25:27'),
(42, '2964187', 19, 0, 140000, 'Pendataan pembayaran tanggungan Prakerin siswa a/n ADE NOVIYANTI', 'tanggungan', 18, '2022-07-29 01:25:27'),
(43, '1320097', 4, 100000, 0, 'Pendataan pembayaran tanggungan SPP siswa a/n AHMAD SYAFARONI', 'tanggungan', 19, '2022-07-29 01:25:27'),
(44, '1320097', 20, 0, 100000, 'Pendataan pembayaran tanggungan SPP siswa a/n AHMAD SYAFARONI', 'tanggungan', 19, '2022-07-29 01:25:27'),
(45, '7412584', 4, 110000, 0, 'Pendataan pembayaran tanggungan DSP siswa a/n AHMAD SYAFARONI', 'tanggungan', 20, '2022-07-29 01:25:27'),
(46, '7412584', 19, 0, 110000, 'Pendataan pembayaran tanggungan DSP siswa a/n AHMAD SYAFARONI', 'tanggungan', 20, '2022-07-29 01:25:27'),
(47, '9241324', 4, 120000, 0, 'Pendataan pembayaran tanggungan Seragam siswa a/n AHMAD SYAFARONI', 'tanggungan', 21, '2022-07-29 01:25:27'),
(48, '9241324', 20, 0, 120000, 'Pendataan pembayaran tanggungan Seragam siswa a/n AHMAD SYAFARONI', 'tanggungan', 21, '2022-07-29 01:25:27'),
(49, '3563845', 4, 130000, 0, 'Pendataan pembayaran tanggungan Study Tour siswa a/n AHMAD SYAFARONI', 'tanggungan', 22, '2022-07-29 01:25:27'),
(50, '3563845', 21, 0, 130000, 'Pendataan pembayaran tanggungan Study Tour siswa a/n AHMAD SYAFARONI', 'tanggungan', 22, '2022-07-29 01:25:27'),
(51, '5703438', 4, 140000, 0, 'Pendataan pembayaran tanggungan Prakerin siswa a/n AHMAD SYAFARONI', 'tanggungan', 23, '2022-07-29 01:25:27'),
(52, '5703438', 19, 0, 140000, 'Pendataan pembayaran tanggungan Prakerin siswa a/n AHMAD SYAFARONI', 'tanggungan', 23, '2022-07-29 01:25:27'),
(53, '8514235', 4, 100000, 0, 'Pendataan pembayaran tanggungan SPP siswa a/n GALING DWI MUSTOMO', 'tanggungan', 24, '2022-07-29 01:25:27'),
(54, '8514235', 20, 0, 100000, 'Pendataan pembayaran tanggungan SPP siswa a/n GALING DWI MUSTOMO', 'tanggungan', 24, '2022-07-29 01:25:27'),
(55, '3413035', 4, 110000, 0, 'Pendataan pembayaran tanggungan DSP siswa a/n GALING DWI MUSTOMO', 'tanggungan', 25, '2022-07-29 01:25:27'),
(56, '3413035', 19, 0, 110000, 'Pendataan pembayaran tanggungan DSP siswa a/n GALING DWI MUSTOMO', 'tanggungan', 25, '2022-07-29 01:25:27'),
(57, '4296492', 4, 120000, 0, 'Pendataan pembayaran tanggungan Seragam siswa a/n GALING DWI MUSTOMO', 'tanggungan', 26, '2022-07-29 01:25:27'),
(58, '4296492', 20, 0, 120000, 'Pendataan pembayaran tanggungan Seragam siswa a/n GALING DWI MUSTOMO', 'tanggungan', 26, '2022-07-29 01:25:27'),
(59, '2876487', 4, 130000, 0, 'Pendataan pembayaran tanggungan Study Tour siswa a/n GALING DWI MUSTOMO', 'tanggungan', 27, '2022-07-29 01:25:27'),
(60, '2876487', 21, 0, 130000, 'Pendataan pembayaran tanggungan Study Tour siswa a/n GALING DWI MUSTOMO', 'tanggungan', 27, '2022-07-29 01:25:27'),
(61, '3025674', 4, 140000, 0, 'Pendataan pembayaran tanggungan Prakerin siswa a/n GALING DWI MUSTOMO', 'tanggungan', 28, '2022-07-29 01:25:27'),
(62, '3025674', 19, 0, 140000, 'Pendataan pembayaran tanggungan Prakerin siswa a/n GALING DWI MUSTOMO', 'tanggungan', 28, '2022-07-29 01:25:27'),
(63, '6767635', 4, 100000, 0, 'Pendataan pembayaran tanggungan SPP siswa a/n MUHAKIM AJI PAMBUDI', 'tanggungan', 29, '2022-07-29 01:25:27'),
(64, '6767635', 20, 0, 100000, 'Pendataan pembayaran tanggungan SPP siswa a/n MUHAKIM AJI PAMBUDI', 'tanggungan', 29, '2022-07-29 01:25:27'),
(65, '9752926', 4, 110000, 0, 'Pendataan pembayaran tanggungan DSP siswa a/n MUHAKIM AJI PAMBUDI', 'tanggungan', 30, '2022-07-29 01:25:27'),
(66, '9752926', 19, 0, 110000, 'Pendataan pembayaran tanggungan DSP siswa a/n MUHAKIM AJI PAMBUDI', 'tanggungan', 30, '2022-07-29 01:25:27'),
(67, '3866329', 4, 120000, 0, 'Pendataan pembayaran tanggungan Seragam siswa a/n MUHAKIM AJI PAMBUDI', 'tanggungan', 31, '2022-07-29 01:25:27'),
(68, '3866329', 20, 0, 120000, 'Pendataan pembayaran tanggungan Seragam siswa a/n MUHAKIM AJI PAMBUDI', 'tanggungan', 31, '2022-07-29 01:25:27'),
(69, '1331069', 4, 130000, 0, 'Pendataan pembayaran tanggungan Study Tour siswa a/n MUHAKIM AJI PAMBUDI', 'tanggungan', 32, '2022-07-29 01:25:27'),
(70, '1331069', 21, 0, 130000, 'Pendataan pembayaran tanggungan Study Tour siswa a/n MUHAKIM AJI PAMBUDI', 'tanggungan', 32, '2022-07-29 01:25:27'),
(71, '8870252', 4, 140000, 0, 'Pendataan pembayaran tanggungan Prakerin siswa a/n MUHAKIM AJI PAMBUDI', 'tanggungan', 33, '2022-07-29 01:25:27'),
(72, '8870252', 19, 0, 140000, 'Pendataan pembayaran tanggungan Prakerin siswa a/n MUHAKIM AJI PAMBUDI', 'tanggungan', 33, '2022-07-29 01:25:27'),
(73, '3229339', 4, 100000, 0, 'Pendataan pembayaran tanggungan SPP siswa a/n OKTAVIA RAMADHANI NURJANAH', 'tanggungan', 34, '2022-07-29 01:25:27'),
(74, '3229339', 20, 0, 100000, 'Pendataan pembayaran tanggungan SPP siswa a/n OKTAVIA RAMADHANI NURJANAH', 'tanggungan', 34, '2022-07-29 01:25:27'),
(75, '58513', 4, 110000, 0, 'Pendataan pembayaran tanggungan DSP siswa a/n OKTAVIA RAMADHANI NURJANAH', 'tanggungan', 35, '2022-07-29 01:25:27'),
(76, '58513', 19, 0, 110000, 'Pendataan pembayaran tanggungan DSP siswa a/n OKTAVIA RAMADHANI NURJANAH', 'tanggungan', 35, '2022-07-29 01:25:27'),
(77, '9974442', 4, 120000, 0, 'Pendataan pembayaran tanggungan Seragam siswa a/n OKTAVIA RAMADHANI NURJANAH', 'tanggungan', 36, '2022-07-29 01:25:27'),
(78, '9974442', 20, 0, 120000, 'Pendataan pembayaran tanggungan Seragam siswa a/n OKTAVIA RAMADHANI NURJANAH', 'tanggungan', 36, '2022-07-29 01:25:27'),
(79, '6396942', 4, 130000, 0, 'Pendataan pembayaran tanggungan Study Tour siswa a/n OKTAVIA RAMADHANI NURJANAH', 'tanggungan', 37, '2022-07-29 01:25:27'),
(80, '6396942', 21, 0, 130000, 'Pendataan pembayaran tanggungan Study Tour siswa a/n OKTAVIA RAMADHANI NURJANAH', 'tanggungan', 37, '2022-07-29 01:25:27'),
(81, '3377039', 4, 140000, 0, 'Pendataan pembayaran tanggungan Prakerin siswa a/n OKTAVIA RAMADHANI NURJANAH', 'tanggungan', 38, '2022-07-29 01:25:27'),
(82, '3377039', 19, 0, 140000, 'Pendataan pembayaran tanggungan Prakerin siswa a/n OKTAVIA RAMADHANI NURJANAH', 'tanggungan', 38, '2022-07-29 01:25:27'),
(83, '659112', 4, 100000, 0, 'Pendataan pembayaran tanggungan SPP siswa a/n RANJANA SEPTIAN RAHMAN', 'tanggungan', 39, '2022-07-29 01:25:27'),
(84, '659112', 20, 0, 100000, 'Pendataan pembayaran tanggungan SPP siswa a/n RANJANA SEPTIAN RAHMAN', 'tanggungan', 39, '2022-07-29 01:25:27'),
(85, '7493958', 4, 110000, 0, 'Pendataan pembayaran tanggungan DSP siswa a/n RANJANA SEPTIAN RAHMAN', 'tanggungan', 40, '2022-07-29 01:25:27'),
(86, '7493958', 19, 0, 110000, 'Pendataan pembayaran tanggungan DSP siswa a/n RANJANA SEPTIAN RAHMAN', 'tanggungan', 40, '2022-07-29 01:25:27'),
(87, '7776669', 4, 120000, 0, 'Pendataan pembayaran tanggungan Seragam siswa a/n RANJANA SEPTIAN RAHMAN', 'tanggungan', 41, '2022-07-29 01:25:27'),
(88, '7776669', 20, 0, 120000, 'Pendataan pembayaran tanggungan Seragam siswa a/n RANJANA SEPTIAN RAHMAN', 'tanggungan', 41, '2022-07-29 01:25:27'),
(89, '367965', 4, 130000, 0, 'Pendataan pembayaran tanggungan Study Tour siswa a/n RANJANA SEPTIAN RAHMAN', 'tanggungan', 42, '2022-07-29 01:25:27'),
(90, '367965', 21, 0, 130000, 'Pendataan pembayaran tanggungan Study Tour siswa a/n RANJANA SEPTIAN RAHMAN', 'tanggungan', 42, '2022-07-29 01:25:27'),
(91, '6197509', 4, 140000, 0, 'Pendataan pembayaran tanggungan Prakerin siswa a/n RANJANA SEPTIAN RAHMAN', 'tanggungan', 43, '2022-07-29 01:25:27'),
(92, '6197509', 19, 0, 140000, 'Pendataan pembayaran tanggungan Prakerin siswa a/n RANJANA SEPTIAN RAHMAN', 'tanggungan', 43, '2022-07-29 01:25:27'),
(93, '2525338', 4, 100000, 0, 'Pendataan pembayaran tanggungan SPP siswa a/n GALING DWI MUSTOMO', 'tanggungan', 44, '2022-07-29 01:25:27'),
(94, '2525338', 20, 0, 100000, 'Pendataan pembayaran tanggungan SPP siswa a/n GALING DWI MUSTOMO', 'tanggungan', 44, '2022-07-29 01:25:27'),
(95, '6726668', 4, 110000, 0, 'Pendataan pembayaran tanggungan DSP siswa a/n GALING DWI MUSTOMO', 'tanggungan', 45, '2022-07-29 01:25:27'),
(96, '6726668', 19, 0, 110000, 'Pendataan pembayaran tanggungan DSP siswa a/n GALING DWI MUSTOMO', 'tanggungan', 45, '2022-07-29 01:25:27'),
(97, '9982929', 4, 120000, 0, 'Pendataan pembayaran tanggungan Seragam siswa a/n GALING DWI MUSTOMO', 'tanggungan', 46, '2022-07-29 01:25:27'),
(98, '9982929', 20, 0, 120000, 'Pendataan pembayaran tanggungan Seragam siswa a/n GALING DWI MUSTOMO', 'tanggungan', 46, '2022-07-29 01:25:27'),
(99, '2189024', 4, 130000, 0, 'Pendataan pembayaran tanggungan Study Tour siswa a/n GALING DWI MUSTOMO', 'tanggungan', 47, '2022-07-29 01:25:27'),
(100, '2189024', 21, 0, 130000, 'Pendataan pembayaran tanggungan Study Tour siswa a/n GALING DWI MUSTOMO', 'tanggungan', 47, '2022-07-29 01:25:27'),
(101, '2402584', 4, 140000, 0, 'Pendataan pembayaran tanggungan Prakerin siswa a/n GALING DWI MUSTOMO', 'tanggungan', 48, '2022-07-29 01:25:27'),
(102, '2402584', 19, 0, 140000, 'Pendataan pembayaran tanggungan Prakerin siswa a/n GALING DWI MUSTOMO', 'tanggungan', 48, '2022-07-29 01:25:27'),
(115, '9850452', 4, 2600000, 0, 'Pendataan pembayaran tanggungan SPP siswa a/n Santi Dwi Samsiyah', 'tanggungan', 55, '2022-08-03 13:48:05'),
(116, '9850452', 20, 0, 2600000, 'Pendataan pembayaran tanggungan SPP siswa a/n Santi Dwi Samsiyah', 'tanggungan', 55, '2022-08-03 13:48:05'),
(117, '5256214', 4, 3000000, 0, 'Pendataan pembayaran tanggungan DSP siswa a/n Santi Dwi Samsiyah', 'tanggungan', 56, '2022-08-03 13:48:05'),
(118, '5256214', 19, 0, 3000000, 'Pendataan pembayaran tanggungan DSP siswa a/n Santi Dwi Samsiyah', 'tanggungan', 56, '2022-08-03 13:48:05'),
(119, '6772452', 4, 250000, 0, 'Pendataan pembayaran tanggungan Seragam siswa a/n Santi Dwi Samsiyah', 'tanggungan', 57, '2022-08-03 13:48:05'),
(120, '6772452', 20, 0, 250000, 'Pendataan pembayaran tanggungan Seragam siswa a/n Santi Dwi Samsiyah', 'tanggungan', 57, '2022-08-03 13:48:05'),
(121, '7109265', 4, 50000, 0, 'Pendataan pembayaran tanggungan Study Tour siswa a/n Santi Dwi Samsiyah', 'tanggungan', 58, '2022-08-03 13:48:05'),
(122, '7109265', 21, 0, 50000, 'Pendataan pembayaran tanggungan Study Tour siswa a/n Santi Dwi Samsiyah', 'tanggungan', 58, '2022-08-03 13:48:05'),
(123, '1570385', 4, 400000, 0, 'Pendataan pembayaran tanggungan Prakerin siswa a/n Santi Dwi Samsiyah', 'tanggungan', 59, '2022-08-03 13:48:05'),
(124, '1570385', 19, 0, 400000, 'Pendataan pembayaran tanggungan Prakerin siswa a/n Santi Dwi Samsiyah', 'tanggungan', 59, '2022-08-03 13:48:05'),
(125, '3398241', 4, 50000, 0, 'Pendataan pembayaran tanggungan Dana Sosial siswa a/n Santi Dwi Samsiyah', 'tanggungan', 60, '2022-08-03 13:48:05'),
(126, '3398241', 20, 0, 50000, 'Pendataan pembayaran tanggungan Dana Sosial siswa a/n Santi Dwi Samsiyah', 'tanggungan', 60, '2022-08-03 13:48:05'),
(127, '8047281', 1, 50000, 0, 'Pembayaran tanggungan Dana Sosial siswa a/n Santi Dwi Samsiyah', 'penerimaan', 4, '2022-08-03 13:50:26'),
(128, '8047281', 4, 0, 50000, 'Pembayaran tanggungan Dana Sosial siswa a/n Santi Dwi Samsiyah', 'penerimaan', 4, '2022-08-03 13:50:26'),
(129, '8612385', 4, 2000000, 0, 'Pendataan pembayaran tanggungan SPP siswa a/n Sinta Dwi Samsiyah', 'tanggungan', 61, '2022-08-07 08:04:47'),
(130, '8612385', 20, 0, 2000000, 'Pendataan pembayaran tanggungan SPP siswa a/n Sinta Dwi Samsiyah', 'tanggungan', 61, '2022-08-07 08:04:47'),
(131, '1100583', 4, 2500000, 0, 'Pendataan pembayaran tanggungan DSP siswa a/n Sinta Dwi Samsiyah', 'tanggungan', 62, '2022-08-07 08:04:47'),
(132, '1100583', 19, 0, 2500000, 'Pendataan pembayaran tanggungan DSP siswa a/n Sinta Dwi Samsiyah', 'tanggungan', 62, '2022-08-07 08:04:47'),
(133, '370683', 4, 150000, 0, 'Pendataan pembayaran tanggungan Seragam siswa a/n Sinta Dwi Samsiyah', 'tanggungan', 63, '2022-08-07 08:04:47'),
(134, '370683', 20, 0, 150000, 'Pendataan pembayaran tanggungan Seragam siswa a/n Sinta Dwi Samsiyah', 'tanggungan', 63, '2022-08-07 08:04:47'),
(135, '8326294', 4, 100000, 0, 'Pendataan pembayaran tanggungan Study Tour siswa a/n Sinta Dwi Samsiyah', 'tanggungan', 64, '2022-08-07 08:04:47'),
(136, '8326294', 21, 0, 100000, 'Pendataan pembayaran tanggungan Study Tour siswa a/n Sinta Dwi Samsiyah', 'tanggungan', 64, '2022-08-07 08:04:47'),
(137, '1314227', 4, 150000, 0, 'Pendataan pembayaran tanggungan Prakerin siswa a/n Sinta Dwi Samsiyah', 'tanggungan', 65, '2022-08-07 08:04:47'),
(138, '1314227', 19, 0, 150000, 'Pendataan pembayaran tanggungan Prakerin siswa a/n Sinta Dwi Samsiyah', 'tanggungan', 65, '2022-08-07 08:04:47'),
(141, '8793136', 4, 510000, 0, 'Pendataan pembayaran tanggungan Prakerin siswa a/n ARIEF WAHYUDI', 'tanggungan', 67, '2022-08-07 08:45:55'),
(142, '8793136', 19, 0, 510000, 'Pendataan pembayaran tanggungan Prakerin siswa a/n ARIEF WAHYUDI', 'tanggungan', 67, '2022-08-07 08:45:55'),
(143, '2532655', 4, 150000, 0, 'Pendataan pembayaran tanggungan Dana Sosial siswa a/n ARIEF WAHYUDI', 'tanggungan', 68, '2022-08-07 08:45:55'),
(144, '2532655', 20, 0, 150000, 'Pendataan pembayaran tanggungan Dana Sosial siswa a/n ARIEF WAHYUDI', 'tanggungan', 68, '2022-08-07 08:45:55'),
(145, '707137', 4, 200000, 0, 'Pendataan pembayaran tanggungan SPP siswa a/n AHMAD ZAINURI MAKRUF', 'tanggungan', 69, '2022-08-22 11:10:35'),
(146, '707137', 20, 0, 200000, 'Pendataan pembayaran tanggungan SPP siswa a/n AHMAD ZAINURI MAKRUF', 'tanggungan', 69, '2022-08-22 11:10:35'),
(147, '2190177', 4, 2500000, 0, 'Pendataan pembayaran tanggungan DSP siswa a/n AHMAD ZAINURI MAKRUF', 'tanggungan', 70, '2022-08-22 11:10:35'),
(148, '2190177', 19, 0, 2500000, 'Pendataan pembayaran tanggungan DSP siswa a/n AHMAD ZAINURI MAKRUF', 'tanggungan', 70, '2022-08-22 11:10:35'),
(149, '9605013', 4, 150000, 0, 'Pendataan pembayaran tanggungan Seragam siswa a/n AHMAD ZAINURI MAKRUF', 'tanggungan', 71, '2022-08-22 11:10:35'),
(150, '9605013', 20, 0, 150000, 'Pendataan pembayaran tanggungan Seragam siswa a/n AHMAD ZAINURI MAKRUF', 'tanggungan', 71, '2022-08-22 11:10:35'),
(151, '6831937', 4, 50000, 0, 'Pendataan pembayaran tanggungan Study Tour siswa a/n AHMAD ZAINURI MAKRUF', 'tanggungan', 72, '2022-08-22 11:10:35'),
(152, '6831937', 21, 0, 50000, 'Pendataan pembayaran tanggungan Study Tour siswa a/n AHMAD ZAINURI MAKRUF', 'tanggungan', 72, '2022-08-22 11:10:35'),
(153, '2369797', 4, 100000, 0, 'Pendataan pembayaran tanggungan Prakerin siswa a/n AHMAD ZAINURI MAKRUF', 'tanggungan', 73, '2022-08-22 11:10:35'),
(154, '2369797', 19, 0, 100000, 'Pendataan pembayaran tanggungan Prakerin siswa a/n AHMAD ZAINURI MAKRUF', 'tanggungan', 73, '2022-08-22 11:10:35'),
(155, '710931', 4, 15000, 0, 'Pendataan pembayaran tanggungan Dana Sosial siswa a/n AHMAD ZAINURI MAKRUF', 'tanggungan', 74, '2022-08-22 11:10:35'),
(156, '710931', 20, 0, 15000, 'Pendataan pembayaran tanggungan Dana Sosial siswa a/n AHMAD ZAINURI MAKRUF', 'tanggungan', 74, '2022-08-22 11:10:35'),
(157, '9103239', 4, 200000, 0, 'Pendataan pembayaran tanggungan SPP siswa a/n ALDY PANDUWINATA', 'tanggungan', 75, '2022-08-22 11:10:35'),
(158, '9103239', 20, 0, 200000, 'Pendataan pembayaran tanggungan SPP siswa a/n ALDY PANDUWINATA', 'tanggungan', 75, '2022-08-22 11:10:35'),
(159, '3702585', 4, 2500000, 0, 'Pendataan pembayaran tanggungan DSP siswa a/n ALDY PANDUWINATA', 'tanggungan', 76, '2022-08-22 11:10:35'),
(160, '3702585', 19, 0, 2500000, 'Pendataan pembayaran tanggungan DSP siswa a/n ALDY PANDUWINATA', 'tanggungan', 76, '2022-08-22 11:10:35'),
(161, '544187', 4, 150000, 0, 'Pendataan pembayaran tanggungan Seragam siswa a/n ALDY PANDUWINATA', 'tanggungan', 77, '2022-08-22 11:10:35'),
(162, '544187', 20, 0, 150000, 'Pendataan pembayaran tanggungan Seragam siswa a/n ALDY PANDUWINATA', 'tanggungan', 77, '2022-08-22 11:10:35'),
(163, '5593648', 4, 50000, 0, 'Pendataan pembayaran tanggungan Study Tour siswa a/n ALDY PANDUWINATA', 'tanggungan', 78, '2022-08-22 11:10:35'),
(164, '5593648', 21, 0, 50000, 'Pendataan pembayaran tanggungan Study Tour siswa a/n ALDY PANDUWINATA', 'tanggungan', 78, '2022-08-22 11:10:35'),
(165, '7612858', 4, 100000, 0, 'Pendataan pembayaran tanggungan Prakerin siswa a/n ALDY PANDUWINATA', 'tanggungan', 79, '2022-08-22 11:10:35'),
(166, '7612858', 19, 0, 100000, 'Pendataan pembayaran tanggungan Prakerin siswa a/n ALDY PANDUWINATA', 'tanggungan', 79, '2022-08-22 11:10:35'),
(167, '8074628', 4, 15000, 0, 'Pendataan pembayaran tanggungan Dana Sosial siswa a/n ALDY PANDUWINATA', 'tanggungan', 80, '2022-08-22 11:10:35'),
(168, '8074628', 20, 0, 15000, 'Pendataan pembayaran tanggungan Dana Sosial siswa a/n ALDY PANDUWINATA', 'tanggungan', 80, '2022-08-22 11:10:35'),
(169, '9902135', 4, 200000, 0, 'Pendataan pembayaran tanggungan SPP siswa a/n ALIF BUKHORI', 'tanggungan', 81, '2022-08-22 11:10:35'),
(170, '9902135', 20, 0, 200000, 'Pendataan pembayaran tanggungan SPP siswa a/n ALIF BUKHORI', 'tanggungan', 81, '2022-08-22 11:10:35'),
(171, '9948535', 4, 2500000, 0, 'Pendataan pembayaran tanggungan DSP siswa a/n ALIF BUKHORI', 'tanggungan', 82, '2022-08-22 11:10:35'),
(172, '9948535', 19, 0, 2500000, 'Pendataan pembayaran tanggungan DSP siswa a/n ALIF BUKHORI', 'tanggungan', 82, '2022-08-22 11:10:35'),
(173, '8011270', 4, 150000, 0, 'Pendataan pembayaran tanggungan Seragam siswa a/n ALIF BUKHORI', 'tanggungan', 83, '2022-08-22 11:10:35'),
(174, '8011270', 20, 0, 150000, 'Pendataan pembayaran tanggungan Seragam siswa a/n ALIF BUKHORI', 'tanggungan', 83, '2022-08-22 11:10:35'),
(175, '9075738', 4, 50000, 0, 'Pendataan pembayaran tanggungan Study Tour siswa a/n ALIF BUKHORI', 'tanggungan', 84, '2022-08-22 11:10:35'),
(176, '9075738', 21, 0, 50000, 'Pendataan pembayaran tanggungan Study Tour siswa a/n ALIF BUKHORI', 'tanggungan', 84, '2022-08-22 11:10:35'),
(177, '2406536', 4, 100000, 0, 'Pendataan pembayaran tanggungan Prakerin siswa a/n ALIF BUKHORI', 'tanggungan', 85, '2022-08-22 11:10:35'),
(178, '2406536', 19, 0, 100000, 'Pendataan pembayaran tanggungan Prakerin siswa a/n ALIF BUKHORI', 'tanggungan', 85, '2022-08-22 11:10:35'),
(179, '8570485', 4, 15000, 0, 'Pendataan pembayaran tanggungan Dana Sosial siswa a/n ALIF BUKHORI', 'tanggungan', 86, '2022-08-22 11:10:35'),
(180, '8570485', 20, 0, 15000, 'Pendataan pembayaran tanggungan Dana Sosial siswa a/n ALIF BUKHORI', 'tanggungan', 86, '2022-08-22 11:10:35'),
(181, '8952740', 4, 200000, 0, 'Pendataan pembayaran tanggungan SPP siswa a/n ARI MUSTOFA', 'tanggungan', 87, '2022-08-22 11:10:35'),
(182, '8952740', 20, 0, 200000, 'Pendataan pembayaran tanggungan SPP siswa a/n ARI MUSTOFA', 'tanggungan', 87, '2022-08-22 11:10:35'),
(183, '3383598', 4, 2500000, 0, 'Pendataan pembayaran tanggungan DSP siswa a/n ARI MUSTOFA', 'tanggungan', 88, '2022-08-22 11:10:35'),
(184, '3383598', 19, 0, 2500000, 'Pendataan pembayaran tanggungan DSP siswa a/n ARI MUSTOFA', 'tanggungan', 88, '2022-08-22 11:10:35'),
(185, '8394881', 4, 150000, 0, 'Pendataan pembayaran tanggungan Seragam siswa a/n ARI MUSTOFA', 'tanggungan', 89, '2022-08-22 11:10:35'),
(186, '8394881', 20, 0, 150000, 'Pendataan pembayaran tanggungan Seragam siswa a/n ARI MUSTOFA', 'tanggungan', 89, '2022-08-22 11:10:35'),
(187, '5601771', 4, 50000, 0, 'Pendataan pembayaran tanggungan Study Tour siswa a/n ARI MUSTOFA', 'tanggungan', 90, '2022-08-22 11:10:35'),
(188, '5601771', 21, 0, 50000, 'Pendataan pembayaran tanggungan Study Tour siswa a/n ARI MUSTOFA', 'tanggungan', 90, '2022-08-22 11:10:35'),
(189, '1550544', 4, 100000, 0, 'Pendataan pembayaran tanggungan Prakerin siswa a/n ARI MUSTOFA', 'tanggungan', 91, '2022-08-22 11:10:35'),
(190, '1550544', 19, 0, 100000, 'Pendataan pembayaran tanggungan Prakerin siswa a/n ARI MUSTOFA', 'tanggungan', 91, '2022-08-22 11:10:35'),
(191, '2912759', 4, 15000, 0, 'Pendataan pembayaran tanggungan Dana Sosial siswa a/n ARI MUSTOFA', 'tanggungan', 92, '2022-08-22 11:10:35'),
(192, '2912759', 20, 0, 15000, 'Pendataan pembayaran tanggungan Dana Sosial siswa a/n ARI MUSTOFA', 'tanggungan', 92, '2022-08-22 11:10:35'),
(193, '4813641', 4, 200000, 0, 'Pendataan pembayaran tanggungan SPP siswa a/n DIDIK HARDIANTO', 'tanggungan', 93, '2022-08-22 11:10:35'),
(194, '4813641', 20, 0, 200000, 'Pendataan pembayaran tanggungan SPP siswa a/n DIDIK HARDIANTO', 'tanggungan', 93, '2022-08-22 11:10:35'),
(195, '8221360', 4, 2500000, 0, 'Pendataan pembayaran tanggungan DSP siswa a/n DIDIK HARDIANTO', 'tanggungan', 94, '2022-08-22 11:10:35'),
(196, '8221360', 19, 0, 2500000, 'Pendataan pembayaran tanggungan DSP siswa a/n DIDIK HARDIANTO', 'tanggungan', 94, '2022-08-22 11:10:35'),
(197, '1736215', 4, 150000, 0, 'Pendataan pembayaran tanggungan Seragam siswa a/n DIDIK HARDIANTO', 'tanggungan', 95, '2022-08-22 11:10:35'),
(198, '1736215', 20, 0, 150000, 'Pendataan pembayaran tanggungan Seragam siswa a/n DIDIK HARDIANTO', 'tanggungan', 95, '2022-08-22 11:10:35'),
(199, '6863934', 4, 50000, 0, 'Pendataan pembayaran tanggungan Study Tour siswa a/n DIDIK HARDIANTO', 'tanggungan', 96, '2022-08-22 11:10:35'),
(200, '6863934', 21, 0, 50000, 'Pendataan pembayaran tanggungan Study Tour siswa a/n DIDIK HARDIANTO', 'tanggungan', 96, '2022-08-22 11:10:35'),
(201, '3397468', 4, 100000, 0, 'Pendataan pembayaran tanggungan Prakerin siswa a/n DIDIK HARDIANTO', 'tanggungan', 97, '2022-08-22 11:10:35'),
(202, '3397468', 19, 0, 100000, 'Pendataan pembayaran tanggungan Prakerin siswa a/n DIDIK HARDIANTO', 'tanggungan', 97, '2022-08-22 11:10:35'),
(203, '1873294', 4, 15000, 0, 'Pendataan pembayaran tanggungan Dana Sosial siswa a/n DIDIK HARDIANTO', 'tanggungan', 98, '2022-08-22 11:10:35'),
(204, '1873294', 20, 0, 15000, 'Pendataan pembayaran tanggungan Dana Sosial siswa a/n DIDIK HARDIANTO', 'tanggungan', 98, '2022-08-22 11:10:35'),
(205, '7689767', 4, 200000, 0, 'Pendataan pembayaran tanggungan SPP siswa a/n FRENDI EKO CAHYONO', 'tanggungan', 99, '2022-08-22 11:10:35'),
(206, '7689767', 20, 0, 200000, 'Pendataan pembayaran tanggungan SPP siswa a/n FRENDI EKO CAHYONO', 'tanggungan', 99, '2022-08-22 11:10:35'),
(207, '9742368', 4, 2500000, 0, 'Pendataan pembayaran tanggungan DSP siswa a/n FRENDI EKO CAHYONO', 'tanggungan', 100, '2022-08-22 11:10:35'),
(208, '9742368', 19, 0, 2500000, 'Pendataan pembayaran tanggungan DSP siswa a/n FRENDI EKO CAHYONO', 'tanggungan', 100, '2022-08-22 11:10:35'),
(209, '4902627', 4, 150000, 0, 'Pendataan pembayaran tanggungan Seragam siswa a/n FRENDI EKO CAHYONO', 'tanggungan', 101, '2022-08-22 11:10:35'),
(210, '4902627', 20, 0, 150000, 'Pendataan pembayaran tanggungan Seragam siswa a/n FRENDI EKO CAHYONO', 'tanggungan', 101, '2022-08-22 11:10:35'),
(211, '9847196', 4, 50000, 0, 'Pendataan pembayaran tanggungan Study Tour siswa a/n FRENDI EKO CAHYONO', 'tanggungan', 102, '2022-08-22 11:10:35'),
(212, '9847196', 21, 0, 50000, 'Pendataan pembayaran tanggungan Study Tour siswa a/n FRENDI EKO CAHYONO', 'tanggungan', 102, '2022-08-22 11:10:35'),
(213, '5275643', 4, 100000, 0, 'Pendataan pembayaran tanggungan Prakerin siswa a/n FRENDI EKO CAHYONO', 'tanggungan', 103, '2022-08-22 11:10:35'),
(214, '5275643', 19, 0, 100000, 'Pendataan pembayaran tanggungan Prakerin siswa a/n FRENDI EKO CAHYONO', 'tanggungan', 103, '2022-08-22 11:10:35'),
(215, '780895', 4, 15000, 0, 'Pendataan pembayaran tanggungan Dana Sosial siswa a/n FRENDI EKO CAHYONO', 'tanggungan', 104, '2022-08-22 11:10:35'),
(216, '780895', 20, 0, 15000, 'Pendataan pembayaran tanggungan Dana Sosial siswa a/n FRENDI EKO CAHYONO', 'tanggungan', 104, '2022-08-22 11:10:35'),
(217, '4941362', 4, 200000, 0, 'Pendataan pembayaran tanggungan SPP siswa a/n HELMI BAYU SAPUTRO', 'tanggungan', 105, '2022-08-22 11:10:35'),
(218, '4941362', 20, 0, 200000, 'Pendataan pembayaran tanggungan SPP siswa a/n HELMI BAYU SAPUTRO', 'tanggungan', 105, '2022-08-22 11:10:35'),
(219, '8873772', 4, 2500000, 0, 'Pendataan pembayaran tanggungan DSP siswa a/n HELMI BAYU SAPUTRO', 'tanggungan', 106, '2022-08-22 11:10:35'),
(220, '8873772', 19, 0, 2500000, 'Pendataan pembayaran tanggungan DSP siswa a/n HELMI BAYU SAPUTRO', 'tanggungan', 106, '2022-08-22 11:10:35'),
(221, '5564028', 4, 150000, 0, 'Pendataan pembayaran tanggungan Seragam siswa a/n HELMI BAYU SAPUTRO', 'tanggungan', 107, '2022-08-22 11:10:35'),
(222, '5564028', 20, 0, 150000, 'Pendataan pembayaran tanggungan Seragam siswa a/n HELMI BAYU SAPUTRO', 'tanggungan', 107, '2022-08-22 11:10:35'),
(223, '2035935', 4, 50000, 0, 'Pendataan pembayaran tanggungan Study Tour siswa a/n HELMI BAYU SAPUTRO', 'tanggungan', 108, '2022-08-22 11:10:35'),
(224, '2035935', 21, 0, 50000, 'Pendataan pembayaran tanggungan Study Tour siswa a/n HELMI BAYU SAPUTRO', 'tanggungan', 108, '2022-08-22 11:10:35'),
(225, '7015527', 4, 100000, 0, 'Pendataan pembayaran tanggungan Prakerin siswa a/n HELMI BAYU SAPUTRO', 'tanggungan', 109, '2022-08-22 11:10:35'),
(226, '7015527', 19, 0, 100000, 'Pendataan pembayaran tanggungan Prakerin siswa a/n HELMI BAYU SAPUTRO', 'tanggungan', 109, '2022-08-22 11:10:35'),
(227, '2248496', 4, 15000, 0, 'Pendataan pembayaran tanggungan Dana Sosial siswa a/n HELMI BAYU SAPUTRO', 'tanggungan', 110, '2022-08-22 11:10:35'),
(228, '2248496', 20, 0, 15000, 'Pendataan pembayaran tanggungan Dana Sosial siswa a/n HELMI BAYU SAPUTRO', 'tanggungan', 110, '2022-08-22 11:10:35'),
(229, '6765566', 4, 200000, 0, 'Pendataan pembayaran tanggungan SPP siswa a/n KARTIKO BAYU PRASETYO', 'tanggungan', 111, '2022-08-22 11:10:35'),
(230, '6765566', 20, 0, 200000, 'Pendataan pembayaran tanggungan SPP siswa a/n KARTIKO BAYU PRASETYO', 'tanggungan', 111, '2022-08-22 11:10:35'),
(231, '3427704', 4, 2500000, 0, 'Pendataan pembayaran tanggungan DSP siswa a/n KARTIKO BAYU PRASETYO', 'tanggungan', 112, '2022-08-22 11:10:35'),
(232, '3427704', 19, 0, 2500000, 'Pendataan pembayaran tanggungan DSP siswa a/n KARTIKO BAYU PRASETYO', 'tanggungan', 112, '2022-08-22 11:10:35'),
(233, '3560522', 4, 150000, 0, 'Pendataan pembayaran tanggungan Seragam siswa a/n KARTIKO BAYU PRASETYO', 'tanggungan', 113, '2022-08-22 11:10:35'),
(234, '3560522', 20, 0, 150000, 'Pendataan pembayaran tanggungan Seragam siswa a/n KARTIKO BAYU PRASETYO', 'tanggungan', 113, '2022-08-22 11:10:35'),
(235, '5586238', 4, 50000, 0, 'Pendataan pembayaran tanggungan Study Tour siswa a/n KARTIKO BAYU PRASETYO', 'tanggungan', 114, '2022-08-22 11:10:35'),
(236, '5586238', 21, 0, 50000, 'Pendataan pembayaran tanggungan Study Tour siswa a/n KARTIKO BAYU PRASETYO', 'tanggungan', 114, '2022-08-22 11:10:35'),
(237, '7800293', 4, 100000, 0, 'Pendataan pembayaran tanggungan Prakerin siswa a/n KARTIKO BAYU PRASETYO', 'tanggungan', 115, '2022-08-22 11:10:35'),
(238, '7800293', 19, 0, 100000, 'Pendataan pembayaran tanggungan Prakerin siswa a/n KARTIKO BAYU PRASETYO', 'tanggungan', 115, '2022-08-22 11:10:35'),
(239, '4715107', 4, 15000, 0, 'Pendataan pembayaran tanggungan Dana Sosial siswa a/n KARTIKO BAYU PRASETYO', 'tanggungan', 116, '2022-08-22 11:10:35'),
(240, '4715107', 20, 0, 15000, 'Pendataan pembayaran tanggungan Dana Sosial siswa a/n KARTIKO BAYU PRASETYO', 'tanggungan', 116, '2022-08-22 11:10:35'),
(241, '9679091', 4, 200000, 0, 'Pendataan pembayaran tanggungan SPP siswa a/n KERISNA ARDIANTO', 'tanggungan', 117, '2022-08-22 11:10:35'),
(242, '9679091', 20, 0, 200000, 'Pendataan pembayaran tanggungan SPP siswa a/n KERISNA ARDIANTO', 'tanggungan', 117, '2022-08-22 11:10:35'),
(243, '2868685', 4, 2500000, 0, 'Pendataan pembayaran tanggungan DSP siswa a/n KERISNA ARDIANTO', 'tanggungan', 118, '2022-08-22 11:10:35'),
(244, '2868685', 19, 0, 2500000, 'Pendataan pembayaran tanggungan DSP siswa a/n KERISNA ARDIANTO', 'tanggungan', 118, '2022-08-22 11:10:35'),
(245, '4035207', 4, 150000, 0, 'Pendataan pembayaran tanggungan Seragam siswa a/n KERISNA ARDIANTO', 'tanggungan', 119, '2022-08-22 11:10:35'),
(246, '4035207', 20, 0, 150000, 'Pendataan pembayaran tanggungan Seragam siswa a/n KERISNA ARDIANTO', 'tanggungan', 119, '2022-08-22 11:10:35'),
(247, '2182519', 4, 50000, 0, 'Pendataan pembayaran tanggungan Study Tour siswa a/n KERISNA ARDIANTO', 'tanggungan', 120, '2022-08-22 11:10:35'),
(248, '2182519', 21, 0, 50000, 'Pendataan pembayaran tanggungan Study Tour siswa a/n KERISNA ARDIANTO', 'tanggungan', 120, '2022-08-22 11:10:35'),
(249, '473430', 4, 100000, 0, 'Pendataan pembayaran tanggungan Prakerin siswa a/n KERISNA ARDIANTO', 'tanggungan', 121, '2022-08-22 11:10:35'),
(250, '473430', 19, 0, 100000, 'Pendataan pembayaran tanggungan Prakerin siswa a/n KERISNA ARDIANTO', 'tanggungan', 121, '2022-08-22 11:10:35'),
(251, '100019', 4, 15000, 0, 'Pendataan pembayaran tanggungan Dana Sosial siswa a/n KERISNA ARDIANTO', 'tanggungan', 122, '2022-08-22 11:10:35'),
(252, '100019', 20, 0, 15000, 'Pendataan pembayaran tanggungan Dana Sosial siswa a/n KERISNA ARDIANTO', 'tanggungan', 122, '2022-08-22 11:10:35'),
(253, '642787', 4, 200000, 0, 'Pendataan pembayaran tanggungan SPP siswa a/n KOIRUL UBAIDILAH FATHUROKHIM', 'tanggungan', 123, '2022-08-22 11:10:35'),
(254, '642787', 20, 0, 200000, 'Pendataan pembayaran tanggungan SPP siswa a/n KOIRUL UBAIDILAH FATHUROKHIM', 'tanggungan', 123, '2022-08-22 11:10:35'),
(255, '1141283', 4, 2500000, 0, 'Pendataan pembayaran tanggungan DSP siswa a/n KOIRUL UBAIDILAH FATHUROKHIM', 'tanggungan', 124, '2022-08-22 11:10:35'),
(256, '1141283', 19, 0, 2500000, 'Pendataan pembayaran tanggungan DSP siswa a/n KOIRUL UBAIDILAH FATHUROKHIM', 'tanggungan', 124, '2022-08-22 11:10:35'),
(257, '5890649', 4, 150000, 0, 'Pendataan pembayaran tanggungan Seragam siswa a/n KOIRUL UBAIDILAH FATHUROKHIM', 'tanggungan', 125, '2022-08-22 11:10:35'),
(258, '5890649', 20, 0, 150000, 'Pendataan pembayaran tanggungan Seragam siswa a/n KOIRUL UBAIDILAH FATHUROKHIM', 'tanggungan', 125, '2022-08-22 11:10:35'),
(259, '3741747', 4, 50000, 0, 'Pendataan pembayaran tanggungan Study Tour siswa a/n KOIRUL UBAIDILAH FATHUROKHIM', 'tanggungan', 126, '2022-08-22 11:10:35'),
(260, '3741747', 21, 0, 50000, 'Pendataan pembayaran tanggungan Study Tour siswa a/n KOIRUL UBAIDILAH FATHUROKHIM', 'tanggungan', 126, '2022-08-22 11:10:35'),
(261, '5863291', 4, 100000, 0, 'Pendataan pembayaran tanggungan Prakerin siswa a/n KOIRUL UBAIDILAH FATHUROKHIM', 'tanggungan', 127, '2022-08-22 11:10:35'),
(262, '5863291', 19, 0, 100000, 'Pendataan pembayaran tanggungan Prakerin siswa a/n KOIRUL UBAIDILAH FATHUROKHIM', 'tanggungan', 127, '2022-08-22 11:10:35'),
(263, '6067978', 4, 15000, 0, 'Pendataan pembayaran tanggungan Dana Sosial siswa a/n KOIRUL UBAIDILAH FATHUROKHIM', 'tanggungan', 128, '2022-08-22 11:10:35'),
(264, '6067978', 20, 0, 15000, 'Pendataan pembayaran tanggungan Dana Sosial siswa a/n KOIRUL UBAIDILAH FATHUROKHIM', 'tanggungan', 128, '2022-08-22 11:10:35'),
(265, '7474095', 4, 200000, 0, 'Pendataan pembayaran tanggungan SPP siswa a/n KRISNA EKA SAPUTRA', 'tanggungan', 129, '2022-08-22 11:10:35'),
(266, '7474095', 20, 0, 200000, 'Pendataan pembayaran tanggungan SPP siswa a/n KRISNA EKA SAPUTRA', 'tanggungan', 129, '2022-08-22 11:10:35'),
(267, '93296', 4, 2500000, 0, 'Pendataan pembayaran tanggungan DSP siswa a/n KRISNA EKA SAPUTRA', 'tanggungan', 130, '2022-08-22 11:10:35'),
(268, '93296', 19, 0, 2500000, 'Pendataan pembayaran tanggungan DSP siswa a/n KRISNA EKA SAPUTRA', 'tanggungan', 130, '2022-08-22 11:10:35'),
(269, '9834272', 4, 150000, 0, 'Pendataan pembayaran tanggungan Seragam siswa a/n KRISNA EKA SAPUTRA', 'tanggungan', 131, '2022-08-22 11:10:35'),
(270, '9834272', 20, 0, 150000, 'Pendataan pembayaran tanggungan Seragam siswa a/n KRISNA EKA SAPUTRA', 'tanggungan', 131, '2022-08-22 11:10:35'),
(271, '9472925', 4, 50000, 0, 'Pendataan pembayaran tanggungan Study Tour siswa a/n KRISNA EKA SAPUTRA', 'tanggungan', 132, '2022-08-22 11:10:35'),
(272, '9472925', 21, 0, 50000, 'Pendataan pembayaran tanggungan Study Tour siswa a/n KRISNA EKA SAPUTRA', 'tanggungan', 132, '2022-08-22 11:10:35'),
(273, '3929027', 4, 100000, 0, 'Pendataan pembayaran tanggungan Prakerin siswa a/n KRISNA EKA SAPUTRA', 'tanggungan', 133, '2022-08-22 11:10:35'),
(274, '3929027', 19, 0, 100000, 'Pendataan pembayaran tanggungan Prakerin siswa a/n KRISNA EKA SAPUTRA', 'tanggungan', 133, '2022-08-22 11:10:35'),
(275, '2551737', 4, 15000, 0, 'Pendataan pembayaran tanggungan Dana Sosial siswa a/n KRISNA EKA SAPUTRA', 'tanggungan', 134, '2022-08-22 11:10:35'),
(276, '2551737', 20, 0, 15000, 'Pendataan pembayaran tanggungan Dana Sosial siswa a/n KRISNA EKA SAPUTRA', 'tanggungan', 134, '2022-08-22 11:10:35'),
(277, '4202408', 4, 200000, 0, 'Pendataan pembayaran tanggungan SPP siswa a/n LUKY WAHYU SAPUTRA', 'tanggungan', 135, '2022-08-22 11:10:35'),
(278, '4202408', 20, 0, 200000, 'Pendataan pembayaran tanggungan SPP siswa a/n LUKY WAHYU SAPUTRA', 'tanggungan', 135, '2022-08-22 11:10:35'),
(279, '129538', 4, 2500000, 0, 'Pendataan pembayaran tanggungan DSP siswa a/n LUKY WAHYU SAPUTRA', 'tanggungan', 136, '2022-08-22 11:10:35'),
(280, '129538', 19, 0, 2500000, 'Pendataan pembayaran tanggungan DSP siswa a/n LUKY WAHYU SAPUTRA', 'tanggungan', 136, '2022-08-22 11:10:35'),
(281, '4874171', 4, 150000, 0, 'Pendataan pembayaran tanggungan Seragam siswa a/n LUKY WAHYU SAPUTRA', 'tanggungan', 137, '2022-08-22 11:10:35'),
(282, '4874171', 20, 0, 150000, 'Pendataan pembayaran tanggungan Seragam siswa a/n LUKY WAHYU SAPUTRA', 'tanggungan', 137, '2022-08-22 11:10:35'),
(283, '1983672', 4, 50000, 0, 'Pendataan pembayaran tanggungan Study Tour siswa a/n LUKY WAHYU SAPUTRA', 'tanggungan', 138, '2022-08-22 11:10:35'),
(284, '1983672', 21, 0, 50000, 'Pendataan pembayaran tanggungan Study Tour siswa a/n LUKY WAHYU SAPUTRA', 'tanggungan', 138, '2022-08-22 11:10:35'),
(285, '6043682', 4, 100000, 0, 'Pendataan pembayaran tanggungan Prakerin siswa a/n LUKY WAHYU SAPUTRA', 'tanggungan', 139, '2022-08-22 11:10:35'),
(286, '6043682', 19, 0, 100000, 'Pendataan pembayaran tanggungan Prakerin siswa a/n LUKY WAHYU SAPUTRA', 'tanggungan', 139, '2022-08-22 11:10:35'),
(287, '2592326', 4, 15000, 0, 'Pendataan pembayaran tanggungan Dana Sosial siswa a/n LUKY WAHYU SAPUTRA', 'tanggungan', 140, '2022-08-22 11:10:35'),
(288, '2592326', 20, 0, 15000, 'Pendataan pembayaran tanggungan Dana Sosial siswa a/n LUKY WAHYU SAPUTRA', 'tanggungan', 140, '2022-08-22 11:10:35'),
(289, '572454', 4, 200000, 0, 'Pendataan pembayaran tanggungan SPP siswa a/n MOH ZEIN ARDIANSYAH', 'tanggungan', 141, '2022-08-22 11:10:35'),
(290, '572454', 20, 0, 200000, 'Pendataan pembayaran tanggungan SPP siswa a/n MOH ZEIN ARDIANSYAH', 'tanggungan', 141, '2022-08-22 11:10:35'),
(291, '6868074', 4, 2500000, 0, 'Pendataan pembayaran tanggungan DSP siswa a/n MOH ZEIN ARDIANSYAH', 'tanggungan', 142, '2022-08-22 11:10:35'),
(292, '6868074', 19, 0, 2500000, 'Pendataan pembayaran tanggungan DSP siswa a/n MOH ZEIN ARDIANSYAH', 'tanggungan', 142, '2022-08-22 11:10:35'),
(293, '4823784', 4, 150000, 0, 'Pendataan pembayaran tanggungan Seragam siswa a/n MOH ZEIN ARDIANSYAH', 'tanggungan', 143, '2022-08-22 11:10:35'),
(294, '4823784', 20, 0, 150000, 'Pendataan pembayaran tanggungan Seragam siswa a/n MOH ZEIN ARDIANSYAH', 'tanggungan', 143, '2022-08-22 11:10:35'),
(295, '7718490', 4, 50000, 0, 'Pendataan pembayaran tanggungan Study Tour siswa a/n MOH ZEIN ARDIANSYAH', 'tanggungan', 144, '2022-08-22 11:10:35'),
(296, '7718490', 21, 0, 50000, 'Pendataan pembayaran tanggungan Study Tour siswa a/n MOH ZEIN ARDIANSYAH', 'tanggungan', 144, '2022-08-22 11:10:35'),
(297, '9169893', 4, 100000, 0, 'Pendataan pembayaran tanggungan Prakerin siswa a/n MOH ZEIN ARDIANSYAH', 'tanggungan', 145, '2022-08-22 11:10:35'),
(298, '9169893', 19, 0, 100000, 'Pendataan pembayaran tanggungan Prakerin siswa a/n MOH ZEIN ARDIANSYAH', 'tanggungan', 145, '2022-08-22 11:10:35'),
(299, '8703550', 4, 15000, 0, 'Pendataan pembayaran tanggungan Dana Sosial siswa a/n MOH ZEIN ARDIANSYAH', 'tanggungan', 146, '2022-08-22 11:10:35'),
(300, '8703550', 20, 0, 15000, 'Pendataan pembayaran tanggungan Dana Sosial siswa a/n MOH ZEIN ARDIANSYAH', 'tanggungan', 146, '2022-08-22 11:10:35'),
(301, '9411672', 4, 200000, 0, 'Pendataan pembayaran tanggungan SPP siswa a/n MOH. ARIS SETIAWAN', 'tanggungan', 147, '2022-08-22 11:10:35'),
(302, '9411672', 20, 0, 200000, 'Pendataan pembayaran tanggungan SPP siswa a/n MOH. ARIS SETIAWAN', 'tanggungan', 147, '2022-08-22 11:10:35'),
(303, '462010', 4, 2500000, 0, 'Pendataan pembayaran tanggungan DSP siswa a/n MOH. ARIS SETIAWAN', 'tanggungan', 148, '2022-08-22 11:10:35'),
(304, '462010', 19, 0, 2500000, 'Pendataan pembayaran tanggungan DSP siswa a/n MOH. ARIS SETIAWAN', 'tanggungan', 148, '2022-08-22 11:10:35'),
(305, '5392516', 4, 150000, 0, 'Pendataan pembayaran tanggungan Seragam siswa a/n MOH. ARIS SETIAWAN', 'tanggungan', 149, '2022-08-22 11:10:35'),
(306, '5392516', 20, 0, 150000, 'Pendataan pembayaran tanggungan Seragam siswa a/n MOH. ARIS SETIAWAN', 'tanggungan', 149, '2022-08-22 11:10:35'),
(307, '7236023', 4, 50000, 0, 'Pendataan pembayaran tanggungan Study Tour siswa a/n MOH. ARIS SETIAWAN', 'tanggungan', 150, '2022-08-22 11:10:35'),
(308, '7236023', 21, 0, 50000, 'Pendataan pembayaran tanggungan Study Tour siswa a/n MOH. ARIS SETIAWAN', 'tanggungan', 150, '2022-08-22 11:10:35'),
(309, '7496238', 4, 100000, 0, 'Pendataan pembayaran tanggungan Prakerin siswa a/n MOH. ARIS SETIAWAN', 'tanggungan', 151, '2022-08-22 11:10:35'),
(310, '7496238', 19, 0, 100000, 'Pendataan pembayaran tanggungan Prakerin siswa a/n MOH. ARIS SETIAWAN', 'tanggungan', 151, '2022-08-22 11:10:35'),
(311, '4728631', 4, 15000, 0, 'Pendataan pembayaran tanggungan Dana Sosial siswa a/n MOH. ARIS SETIAWAN', 'tanggungan', 152, '2022-08-22 11:10:35'),
(312, '4728631', 20, 0, 15000, 'Pendataan pembayaran tanggungan Dana Sosial siswa a/n MOH. ARIS SETIAWAN', 'tanggungan', 152, '2022-08-22 11:10:35'),
(313, '3104066', 4, 200000, 0, 'Pendataan pembayaran tanggungan SPP siswa a/n MUHAMMAD BANA ALI MA\'RUF FAUZI', 'tanggungan', 153, '2022-08-22 11:10:35'),
(314, '3104066', 20, 0, 200000, 'Pendataan pembayaran tanggungan SPP siswa a/n MUHAMMAD BANA ALI MA\'RUF FAUZI', 'tanggungan', 153, '2022-08-22 11:10:35'),
(315, '132446', 4, 2500000, 0, 'Pendataan pembayaran tanggungan DSP siswa a/n MUHAMMAD BANA ALI MA\'RUF FAUZI', 'tanggungan', 154, '2022-08-22 11:10:35'),
(316, '132446', 19, 0, 2500000, 'Pendataan pembayaran tanggungan DSP siswa a/n MUHAMMAD BANA ALI MA\'RUF FAUZI', 'tanggungan', 154, '2022-08-22 11:10:35'),
(317, '7803562', 4, 150000, 0, 'Pendataan pembayaran tanggungan Seragam siswa a/n MUHAMMAD BANA ALI MA\'RUF FAUZI', 'tanggungan', 155, '2022-08-22 11:10:35'),
(318, '7803562', 20, 0, 150000, 'Pendataan pembayaran tanggungan Seragam siswa a/n MUHAMMAD BANA ALI MA\'RUF FAUZI', 'tanggungan', 155, '2022-08-22 11:10:35'),
(319, '3255973', 4, 50000, 0, 'Pendataan pembayaran tanggungan Study Tour siswa a/n MUHAMMAD BANA ALI MA\'RUF FAUZI', 'tanggungan', 156, '2022-08-22 11:10:35'),
(320, '3255973', 21, 0, 50000, 'Pendataan pembayaran tanggungan Study Tour siswa a/n MUHAMMAD BANA ALI MA\'RUF FAUZI', 'tanggungan', 156, '2022-08-22 11:10:35'),
(321, '3019202', 4, 100000, 0, 'Pendataan pembayaran tanggungan Prakerin siswa a/n MUHAMMAD BANA ALI MA\'RUF FAUZI', 'tanggungan', 157, '2022-08-22 11:10:35'),
(322, '3019202', 19, 0, 100000, 'Pendataan pembayaran tanggungan Prakerin siswa a/n MUHAMMAD BANA ALI MA\'RUF FAUZI', 'tanggungan', 157, '2022-08-22 11:10:35'),
(323, '7209009', 4, 15000, 0, 'Pendataan pembayaran tanggungan Dana Sosial siswa a/n MUHAMMAD BANA ALI MA\'RUF FAUZI', 'tanggungan', 158, '2022-08-22 11:10:35'),
(324, '7209009', 20, 0, 15000, 'Pendataan pembayaran tanggungan Dana Sosial siswa a/n MUHAMMAD BANA ALI MA\'RUF FAUZI', 'tanggungan', 158, '2022-08-22 11:10:35'),
(325, '7489519', 4, 200000, 0, 'Pendataan pembayaran tanggungan SPP siswa a/n NUR KHOIRUL ANAM', 'tanggungan', 159, '2022-08-22 11:10:35'),
(326, '7489519', 20, 0, 200000, 'Pendataan pembayaran tanggungan SPP siswa a/n NUR KHOIRUL ANAM', 'tanggungan', 159, '2022-08-22 11:10:35'),
(327, '9705947', 4, 2500000, 0, 'Pendataan pembayaran tanggungan DSP siswa a/n NUR KHOIRUL ANAM', 'tanggungan', 160, '2022-08-22 11:10:35'),
(328, '9705947', 19, 0, 2500000, 'Pendataan pembayaran tanggungan DSP siswa a/n NUR KHOIRUL ANAM', 'tanggungan', 160, '2022-08-22 11:10:35'),
(329, '3321197', 4, 150000, 0, 'Pendataan pembayaran tanggungan Seragam siswa a/n NUR KHOIRUL ANAM', 'tanggungan', 161, '2022-08-22 11:10:35'),
(330, '3321197', 20, 0, 150000, 'Pendataan pembayaran tanggungan Seragam siswa a/n NUR KHOIRUL ANAM', 'tanggungan', 161, '2022-08-22 11:10:35'),
(331, '6435892', 4, 50000, 0, 'Pendataan pembayaran tanggungan Study Tour siswa a/n NUR KHOIRUL ANAM', 'tanggungan', 162, '2022-08-22 11:10:35'),
(332, '6435892', 21, 0, 50000, 'Pendataan pembayaran tanggungan Study Tour siswa a/n NUR KHOIRUL ANAM', 'tanggungan', 162, '2022-08-22 11:10:35'),
(333, '7091568', 4, 100000, 0, 'Pendataan pembayaran tanggungan Prakerin siswa a/n NUR KHOIRUL ANAM', 'tanggungan', 163, '2022-08-22 11:10:35'),
(334, '7091568', 19, 0, 100000, 'Pendataan pembayaran tanggungan Prakerin siswa a/n NUR KHOIRUL ANAM', 'tanggungan', 163, '2022-08-22 11:10:35'),
(335, '7420358', 4, 15000, 0, 'Pendataan pembayaran tanggungan Dana Sosial siswa a/n NUR KHOIRUL ANAM', 'tanggungan', 164, '2022-08-22 11:10:35'),
(336, '7420358', 20, 0, 15000, 'Pendataan pembayaran tanggungan Dana Sosial siswa a/n NUR KHOIRUL ANAM', 'tanggungan', 164, '2022-08-22 11:10:35'),
(337, '3808613', 4, 200000, 0, 'Pendataan pembayaran tanggungan SPP siswa a/n RENDI ANDIKA DWI SAPUTRA', 'tanggungan', 165, '2022-08-22 11:10:35'),
(338, '3808613', 20, 0, 200000, 'Pendataan pembayaran tanggungan SPP siswa a/n RENDI ANDIKA DWI SAPUTRA', 'tanggungan', 165, '2022-08-22 11:10:35'),
(339, '6876200', 4, 2500000, 0, 'Pendataan pembayaran tanggungan DSP siswa a/n RENDI ANDIKA DWI SAPUTRA', 'tanggungan', 166, '2022-08-22 11:10:35'),
(340, '6876200', 19, 0, 2500000, 'Pendataan pembayaran tanggungan DSP siswa a/n RENDI ANDIKA DWI SAPUTRA', 'tanggungan', 166, '2022-08-22 11:10:35'),
(341, '7676596', 4, 150000, 0, 'Pendataan pembayaran tanggungan Seragam siswa a/n RENDI ANDIKA DWI SAPUTRA', 'tanggungan', 167, '2022-08-22 11:10:35'),
(342, '7676596', 20, 0, 150000, 'Pendataan pembayaran tanggungan Seragam siswa a/n RENDI ANDIKA DWI SAPUTRA', 'tanggungan', 167, '2022-08-22 11:10:35'),
(343, '1275318', 4, 50000, 0, 'Pendataan pembayaran tanggungan Study Tour siswa a/n RENDI ANDIKA DWI SAPUTRA', 'tanggungan', 168, '2022-08-22 11:10:35'),
(344, '1275318', 21, 0, 50000, 'Pendataan pembayaran tanggungan Study Tour siswa a/n RENDI ANDIKA DWI SAPUTRA', 'tanggungan', 168, '2022-08-22 11:10:35'),
(345, '7872869', 4, 100000, 0, 'Pendataan pembayaran tanggungan Prakerin siswa a/n RENDI ANDIKA DWI SAPUTRA', 'tanggungan', 169, '2022-08-22 11:10:35'),
(346, '7872869', 19, 0, 100000, 'Pendataan pembayaran tanggungan Prakerin siswa a/n RENDI ANDIKA DWI SAPUTRA', 'tanggungan', 169, '2022-08-22 11:10:35'),
(347, '9453496', 4, 15000, 0, 'Pendataan pembayaran tanggungan Dana Sosial siswa a/n RENDI ANDIKA DWI SAPUTRA', 'tanggungan', 170, '2022-08-22 11:10:35'),
(348, '9453496', 20, 0, 15000, 'Pendataan pembayaran tanggungan Dana Sosial siswa a/n RENDI ANDIKA DWI SAPUTRA', 'tanggungan', 170, '2022-08-22 11:10:35'),
(349, '4740087', 4, 200000, 0, 'Pendataan pembayaran tanggungan SPP siswa a/n RICO DIDIK MAHENDRA', 'tanggungan', 171, '2022-08-22 11:10:35'),
(350, '4740087', 20, 0, 200000, 'Pendataan pembayaran tanggungan SPP siswa a/n RICO DIDIK MAHENDRA', 'tanggungan', 171, '2022-08-22 11:10:35'),
(351, '4494945', 4, 2500000, 0, 'Pendataan pembayaran tanggungan DSP siswa a/n RICO DIDIK MAHENDRA', 'tanggungan', 172, '2022-08-22 11:10:35'),
(352, '4494945', 19, 0, 2500000, 'Pendataan pembayaran tanggungan DSP siswa a/n RICO DIDIK MAHENDRA', 'tanggungan', 172, '2022-08-22 11:10:35'),
(353, '1848056', 4, 150000, 0, 'Pendataan pembayaran tanggungan Seragam siswa a/n RICO DIDIK MAHENDRA', 'tanggungan', 173, '2022-08-22 11:10:35'),
(354, '1848056', 20, 0, 150000, 'Pendataan pembayaran tanggungan Seragam siswa a/n RICO DIDIK MAHENDRA', 'tanggungan', 173, '2022-08-22 11:10:35'),
(355, '4588720', 4, 50000, 0, 'Pendataan pembayaran tanggungan Study Tour siswa a/n RICO DIDIK MAHENDRA', 'tanggungan', 174, '2022-08-22 11:10:35'),
(356, '4588720', 21, 0, 50000, 'Pendataan pembayaran tanggungan Study Tour siswa a/n RICO DIDIK MAHENDRA', 'tanggungan', 174, '2022-08-22 11:10:35'),
(357, '8078403', 4, 100000, 0, 'Pendataan pembayaran tanggungan Prakerin siswa a/n RICO DIDIK MAHENDRA', 'tanggungan', 175, '2022-08-22 11:10:35'),
(358, '8078403', 19, 0, 100000, 'Pendataan pembayaran tanggungan Prakerin siswa a/n RICO DIDIK MAHENDRA', 'tanggungan', 175, '2022-08-22 11:10:35'),
(359, '5648915', 4, 15000, 0, 'Pendataan pembayaran tanggungan Dana Sosial siswa a/n RICO DIDIK MAHENDRA', 'tanggungan', 176, '2022-08-22 11:10:35'),
(360, '5648915', 20, 0, 15000, 'Pendataan pembayaran tanggungan Dana Sosial siswa a/n RICO DIDIK MAHENDRA', 'tanggungan', 176, '2022-08-22 11:10:35'),
(361, '1448466', 4, 200000, 0, 'Pendataan pembayaran tanggungan SPP siswa a/n RIO ARDIANTO', 'tanggungan', 177, '2022-08-22 11:10:35'),
(362, '1448466', 20, 0, 200000, 'Pendataan pembayaran tanggungan SPP siswa a/n RIO ARDIANTO', 'tanggungan', 177, '2022-08-22 11:10:35'),
(363, '9884169', 4, 2500000, 0, 'Pendataan pembayaran tanggungan DSP siswa a/n RIO ARDIANTO', 'tanggungan', 178, '2022-08-22 11:10:35'),
(364, '9884169', 19, 0, 2500000, 'Pendataan pembayaran tanggungan DSP siswa a/n RIO ARDIANTO', 'tanggungan', 178, '2022-08-22 11:10:35'),
(365, '7078177', 4, 150000, 0, 'Pendataan pembayaran tanggungan Seragam siswa a/n RIO ARDIANTO', 'tanggungan', 179, '2022-08-22 11:10:35'),
(366, '7078177', 20, 0, 150000, 'Pendataan pembayaran tanggungan Seragam siswa a/n RIO ARDIANTO', 'tanggungan', 179, '2022-08-22 11:10:35'),
(367, '7131837', 4, 50000, 0, 'Pendataan pembayaran tanggungan Study Tour siswa a/n RIO ARDIANTO', 'tanggungan', 180, '2022-08-22 11:10:35'),
(368, '7131837', 21, 0, 50000, 'Pendataan pembayaran tanggungan Study Tour siswa a/n RIO ARDIANTO', 'tanggungan', 180, '2022-08-22 11:10:35'),
(369, '1109388', 4, 100000, 0, 'Pendataan pembayaran tanggungan Prakerin siswa a/n RIO ARDIANTO', 'tanggungan', 181, '2022-08-22 11:10:35');
INSERT INTO `jurnal_umum` (`id_jurnal_umum`, `ref`, `idakun_fk`, `debit`, `kredit`, `keterangan`, `table`, `idtable_fk`, `create_at`) VALUES
(370, '1109388', 19, 0, 100000, 'Pendataan pembayaran tanggungan Prakerin siswa a/n RIO ARDIANTO', 'tanggungan', 181, '2022-08-22 11:10:35'),
(371, '5963771', 4, 15000, 0, 'Pendataan pembayaran tanggungan Dana Sosial siswa a/n RIO ARDIANTO', 'tanggungan', 182, '2022-08-22 11:10:35'),
(372, '5963771', 20, 0, 15000, 'Pendataan pembayaran tanggungan Dana Sosial siswa a/n RIO ARDIANTO', 'tanggungan', 182, '2022-08-22 11:10:35'),
(373, '276727', 4, 200000, 0, 'Pendataan pembayaran tanggungan SPP siswa a/n ROKY SEPTIAN WIRANTO', 'tanggungan', 183, '2022-08-22 11:10:35'),
(374, '276727', 20, 0, 200000, 'Pendataan pembayaran tanggungan SPP siswa a/n ROKY SEPTIAN WIRANTO', 'tanggungan', 183, '2022-08-22 11:10:35'),
(375, '7644480', 4, 2500000, 0, 'Pendataan pembayaran tanggungan DSP siswa a/n ROKY SEPTIAN WIRANTO', 'tanggungan', 184, '2022-08-22 11:10:35'),
(376, '7644480', 19, 0, 2500000, 'Pendataan pembayaran tanggungan DSP siswa a/n ROKY SEPTIAN WIRANTO', 'tanggungan', 184, '2022-08-22 11:10:35'),
(377, '9026797', 4, 150000, 0, 'Pendataan pembayaran tanggungan Seragam siswa a/n ROKY SEPTIAN WIRANTO', 'tanggungan', 185, '2022-08-22 11:10:35'),
(378, '9026797', 20, 0, 150000, 'Pendataan pembayaran tanggungan Seragam siswa a/n ROKY SEPTIAN WIRANTO', 'tanggungan', 185, '2022-08-22 11:10:35'),
(379, '8657891', 4, 50000, 0, 'Pendataan pembayaran tanggungan Study Tour siswa a/n ROKY SEPTIAN WIRANTO', 'tanggungan', 186, '2022-08-22 11:10:35'),
(380, '8657891', 21, 0, 50000, 'Pendataan pembayaran tanggungan Study Tour siswa a/n ROKY SEPTIAN WIRANTO', 'tanggungan', 186, '2022-08-22 11:10:35'),
(381, '1202434', 4, 100000, 0, 'Pendataan pembayaran tanggungan Prakerin siswa a/n ROKY SEPTIAN WIRANTO', 'tanggungan', 187, '2022-08-22 11:10:35'),
(382, '1202434', 19, 0, 100000, 'Pendataan pembayaran tanggungan Prakerin siswa a/n ROKY SEPTIAN WIRANTO', 'tanggungan', 187, '2022-08-22 11:10:35'),
(383, '729119', 4, 15000, 0, 'Pendataan pembayaran tanggungan Dana Sosial siswa a/n ROKY SEPTIAN WIRANTO', 'tanggungan', 188, '2022-08-22 11:10:35'),
(384, '729119', 20, 0, 15000, 'Pendataan pembayaran tanggungan Dana Sosial siswa a/n ROKY SEPTIAN WIRANTO', 'tanggungan', 188, '2022-08-22 11:10:35'),
(385, '1444243', 4, 200000, 0, 'Pendataan pembayaran tanggungan SPP siswa a/n RUDI KRISBIYANTO', 'tanggungan', 189, '2022-08-22 11:10:35'),
(386, '1444243', 20, 0, 200000, 'Pendataan pembayaran tanggungan SPP siswa a/n RUDI KRISBIYANTO', 'tanggungan', 189, '2022-08-22 11:10:35'),
(387, '9198266', 4, 2500000, 0, 'Pendataan pembayaran tanggungan DSP siswa a/n RUDI KRISBIYANTO', 'tanggungan', 190, '2022-08-22 11:10:35'),
(388, '9198266', 19, 0, 2500000, 'Pendataan pembayaran tanggungan DSP siswa a/n RUDI KRISBIYANTO', 'tanggungan', 190, '2022-08-22 11:10:35'),
(389, '7495351', 4, 150000, 0, 'Pendataan pembayaran tanggungan Seragam siswa a/n RUDI KRISBIYANTO', 'tanggungan', 191, '2022-08-22 11:10:35'),
(390, '7495351', 20, 0, 150000, 'Pendataan pembayaran tanggungan Seragam siswa a/n RUDI KRISBIYANTO', 'tanggungan', 191, '2022-08-22 11:10:35'),
(391, '6145903', 4, 50000, 0, 'Pendataan pembayaran tanggungan Study Tour siswa a/n RUDI KRISBIYANTO', 'tanggungan', 192, '2022-08-22 11:10:35'),
(392, '6145903', 21, 0, 50000, 'Pendataan pembayaran tanggungan Study Tour siswa a/n RUDI KRISBIYANTO', 'tanggungan', 192, '2022-08-22 11:10:35'),
(393, '4130399', 4, 100000, 0, 'Pendataan pembayaran tanggungan Prakerin siswa a/n RUDI KRISBIYANTO', 'tanggungan', 193, '2022-08-22 11:10:35'),
(394, '4130399', 19, 0, 100000, 'Pendataan pembayaran tanggungan Prakerin siswa a/n RUDI KRISBIYANTO', 'tanggungan', 193, '2022-08-22 11:10:35'),
(395, '6848737', 4, 15000, 0, 'Pendataan pembayaran tanggungan Dana Sosial siswa a/n RUDI KRISBIYANTO', 'tanggungan', 194, '2022-08-22 11:10:35'),
(396, '6848737', 20, 0, 15000, 'Pendataan pembayaran tanggungan Dana Sosial siswa a/n RUDI KRISBIYANTO', 'tanggungan', 194, '2022-08-22 11:10:35'),
(397, '4175423', 4, 200000, 0, 'Pendataan pembayaran tanggungan SPP siswa a/n RUDY FAJAR NUGROHO', 'tanggungan', 195, '2022-08-22 11:10:35'),
(398, '4175423', 20, 0, 200000, 'Pendataan pembayaran tanggungan SPP siswa a/n RUDY FAJAR NUGROHO', 'tanggungan', 195, '2022-08-22 11:10:35'),
(399, '7860047', 4, 2500000, 0, 'Pendataan pembayaran tanggungan DSP siswa a/n RUDY FAJAR NUGROHO', 'tanggungan', 196, '2022-08-22 11:10:35'),
(400, '7860047', 19, 0, 2500000, 'Pendataan pembayaran tanggungan DSP siswa a/n RUDY FAJAR NUGROHO', 'tanggungan', 196, '2022-08-22 11:10:35'),
(401, '4302433', 4, 150000, 0, 'Pendataan pembayaran tanggungan Seragam siswa a/n RUDY FAJAR NUGROHO', 'tanggungan', 197, '2022-08-22 11:10:35'),
(402, '4302433', 20, 0, 150000, 'Pendataan pembayaran tanggungan Seragam siswa a/n RUDY FAJAR NUGROHO', 'tanggungan', 197, '2022-08-22 11:10:35'),
(403, '7487723', 4, 50000, 0, 'Pendataan pembayaran tanggungan Study Tour siswa a/n RUDY FAJAR NUGROHO', 'tanggungan', 198, '2022-08-22 11:10:35'),
(404, '7487723', 21, 0, 50000, 'Pendataan pembayaran tanggungan Study Tour siswa a/n RUDY FAJAR NUGROHO', 'tanggungan', 198, '2022-08-22 11:10:35'),
(405, '7880699', 4, 100000, 0, 'Pendataan pembayaran tanggungan Prakerin siswa a/n RUDY FAJAR NUGROHO', 'tanggungan', 199, '2022-08-22 11:10:35'),
(406, '7880699', 19, 0, 100000, 'Pendataan pembayaran tanggungan Prakerin siswa a/n RUDY FAJAR NUGROHO', 'tanggungan', 199, '2022-08-22 11:10:35'),
(407, '2955317', 4, 15000, 0, 'Pendataan pembayaran tanggungan Dana Sosial siswa a/n RUDY FAJAR NUGROHO', 'tanggungan', 200, '2022-08-22 11:10:35'),
(408, '2955317', 20, 0, 15000, 'Pendataan pembayaran tanggungan Dana Sosial siswa a/n RUDY FAJAR NUGROHO', 'tanggungan', 200, '2022-08-22 11:10:35'),
(409, '4919989', 4, 200000, 0, 'Pendataan pembayaran tanggungan SPP siswa a/n SONY SETIAWAN', 'tanggungan', 201, '2022-08-22 11:10:35'),
(410, '4919989', 20, 0, 200000, 'Pendataan pembayaran tanggungan SPP siswa a/n SONY SETIAWAN', 'tanggungan', 201, '2022-08-22 11:10:35'),
(411, '3580666', 4, 2500000, 0, 'Pendataan pembayaran tanggungan DSP siswa a/n SONY SETIAWAN', 'tanggungan', 202, '2022-08-22 11:10:35'),
(412, '3580666', 19, 0, 2500000, 'Pendataan pembayaran tanggungan DSP siswa a/n SONY SETIAWAN', 'tanggungan', 202, '2022-08-22 11:10:35'),
(413, '7809057', 4, 150000, 0, 'Pendataan pembayaran tanggungan Seragam siswa a/n SONY SETIAWAN', 'tanggungan', 203, '2022-08-22 11:10:35'),
(414, '7809057', 20, 0, 150000, 'Pendataan pembayaran tanggungan Seragam siswa a/n SONY SETIAWAN', 'tanggungan', 203, '2022-08-22 11:10:35'),
(415, '9662269', 4, 50000, 0, 'Pendataan pembayaran tanggungan Study Tour siswa a/n SONY SETIAWAN', 'tanggungan', 204, '2022-08-22 11:10:35'),
(416, '9662269', 21, 0, 50000, 'Pendataan pembayaran tanggungan Study Tour siswa a/n SONY SETIAWAN', 'tanggungan', 204, '2022-08-22 11:10:35'),
(417, '7630552', 4, 100000, 0, 'Pendataan pembayaran tanggungan Prakerin siswa a/n SONY SETIAWAN', 'tanggungan', 205, '2022-08-22 11:10:35'),
(418, '7630552', 19, 0, 100000, 'Pendataan pembayaran tanggungan Prakerin siswa a/n SONY SETIAWAN', 'tanggungan', 205, '2022-08-22 11:10:35'),
(419, '4813542', 4, 15000, 0, 'Pendataan pembayaran tanggungan Dana Sosial siswa a/n SONY SETIAWAN', 'tanggungan', 206, '2022-08-22 11:10:35'),
(420, '4813542', 20, 0, 15000, 'Pendataan pembayaran tanggungan Dana Sosial siswa a/n SONY SETIAWAN', 'tanggungan', 206, '2022-08-22 11:10:35'),
(421, '1184488', 1, 200000, 0, 'Pembayaran tanggungan SPP siswa a/n AHMAD ZAINURI MAKRUF', 'penerimaan', 5, '2022-08-22 11:13:47'),
(422, '1184488', 4, 0, 200000, 'Pembayaran tanggungan SPP siswa a/n AHMAD ZAINURI MAKRUF', 'penerimaan', 5, '2022-08-22 11:13:47'),
(423, '2328888', 1, 50000, 0, 'Pembayaran tanggungan Seragam siswa a/n AHMAD ZAINURI MAKRUF', 'penerimaan', 6, '2022-08-22 11:13:47'),
(424, '2328888', 4, 0, 50000, 'Pembayaran tanggungan Seragam siswa a/n AHMAD ZAINURI MAKRUF', 'penerimaan', 6, '2022-08-22 11:13:47'),
(427, '1613278', 4, 50000, 0, 'Pendataan Tanggungan Alumni a/n AHMAD ZAINURI MAKRUF', 'tanggungan_alumni', 3, '2022-08-23 01:47:24'),
(428, '1613278', 20, 0, 50000, 'Pendataan Tanggungan Alumni a/n AHMAD ZAINURI MAKRUF', 'tanggungan_alumni', 3, '2022-08-23 01:47:24'),
(429, '4096145', 4, 500000, 0, 'Pendataan Tanggungan Alumni a/n YOSEPTY NURUL FERRISA', 'tanggungan_alumni', 4, '2022-08-23 01:49:55'),
(430, '4096145', 19, 0, 500000, 'Pendataan Tanggungan Alumni a/n YOSEPTY NURUL FERRISA', 'tanggungan_alumni', 4, '2022-08-23 01:49:55'),
(433, '4774025', 4, 150000, 0, 'Pendataan Tanggungan Alumni a/n AHMAD ZAINURI MAKRUF', 'tanggungan_alumni', 6, '2022-08-23 02:02:13'),
(434, '4774025', 20, 0, 150000, 'Pendataan Tanggungan Alumni a/n AHMAD ZAINURI MAKRUF', 'tanggungan_alumni', 6, '2022-08-23 02:02:13'),
(439, '3503528', 1, 15000, 0, 'Pembayaran tanggungan alumni Kekurangan Uang Gedung alumni a/n AHMAD ZAINURI MAKRUF', 'penerimaan_alumni', 3, '2022-08-23 05:18:33'),
(440, '3503528', 4, 0, 15000, 'Pembayaran tanggungan alumni Kekurangan Uang Gedung alumni a/n AHMAD ZAINURI MAKRUF', 'penerimaan_alumni', 3, '2022-08-23 05:18:33'),
(441, '9766857', 1, 150000, 0, 'Pembayaran tanggungan alumni Bayar ujian susulan alumni a/n AHMAD ZAINURI MAKRUF', 'penerimaan_alumni', 4, '2022-08-23 05:18:33'),
(442, '9766857', 4, 0, 150000, 'Pembayaran tanggungan alumni Bayar ujian susulan alumni a/n AHMAD ZAINURI MAKRUF', 'penerimaan_alumni', 4, '2022-08-23 05:18:33'),
(455, '8899573', 21, 150000, 0, 'Pendataan Tanggungan Alumni a/n YOSEPTY NURUL FERRISA', 'tanggungan_alumni', 13, '2022-08-23 13:31:06'),
(456, '8899573', 4, 0, 150000, 'Pendataan Tanggungan Alumni a/n YOSEPTY NURUL FERRISA', 'tanggungan_alumni', 13, '2022-08-23 13:31:06');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jurusan`
--

CREATE TABLE `jurusan` (
  `id_jurusan` int(11) NOT NULL,
  `jurusan` text CHARACTER SET latin1,
  `singkatan` text CHARACTER SET latin1,
  `iddepartment_fk` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

--
-- Dumping data untuk tabel `jurusan`
--

INSERT INTO `jurusan` (`id_jurusan`, `jurusan`, `singkatan`, `iddepartment_fk`) VALUES
(6, 'Agribisnis Pengolahan Hasil Pertanian', 'APHP', 1),
(7, 'Teknik dan Bisnis Sepeda Motor', 'TBSM', 1),
(9, 'Multimedia', 'MM', 1),
(10, 'Agribisnis Ternak Rumininsia', 'ATR', 1),
(13, 'Atlas', 'A', 2),
(14, 'Beta', 'B', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `kaprog`
--

CREATE TABLE `kaprog` (
  `id_kaprog` int(11) NOT NULL,
  `idguru_fk` int(11) DEFAULT NULL,
  `idjurusan_fk` int(11) DEFAULT NULL,
  `idtahunajaran_fk` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kd`
--

CREATE TABLE `kd` (
  `id_kd` int(11) NOT NULL,
  `idkelas_fk` int(11) DEFAULT NULL,
  `idjenispenilaian_fk` int(11) DEFAULT NULL,
  `idmatapelajaran_fk` int(11) DEFAULT NULL,
  `kode` text CHARACTER SET latin1,
  `ringkasan` text CHARACTER SET latin1,
  `idmateri_fk` int(11) DEFAULT NULL,
  `idguru_fk` int(11) DEFAULT NULL,
  `idtahunajaran_fk` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kelas`
--

CREATE TABLE `kelas` (
  `id_kelas` int(11) NOT NULL,
  `kelas` text CHARACTER SET latin1,
  `idtingkat_fk` int(11) DEFAULT NULL,
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `idjurusan_fk` int(11) DEFAULT NULL,
  `idtahunajaran_fk` int(11) DEFAULT NULL,
  `iddepartment_fk` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

--
-- Dumping data untuk tabel `kelas`
--

INSERT INTO `kelas` (`id_kelas`, `kelas`, `idtingkat_fk`, `create_at`, `idjurusan_fk`, `idtahunajaran_fk`, `iddepartment_fk`) VALUES
(39, 'X APHP', 1, '2022-07-17 03:45:09', 6, 4, 1),
(40, 'XI APHP', 2, '2022-07-17 03:45:21', 6, 4, 1),
(41, 'XII APHP', 3, '2022-07-17 03:45:34', 6, 4, 1),
(42, 'X TBSM', 1, '2022-07-17 03:46:06', 7, 4, 1),
(43, 'XI TBSM', 2, '2022-07-17 03:46:18', 7, 4, 1),
(44, 'XII TBSM', 3, '2022-07-17 03:46:57', 7, 4, 1),
(45, 'X MM', 1, '2022-07-17 03:47:19', 9, 4, 1),
(46, 'XI MM', 2, '2022-07-17 03:47:32', 9, 4, 1),
(47, 'XII MM', 3, '2022-07-17 03:47:42', 9, 4, 1),
(48, 'X ATR', 1, '2022-07-17 03:47:52', 10, 4, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `kelas_erapor`
--

CREATE TABLE `kelas_erapor` (
  `id_kelas_erapor` int(11) NOT NULL,
  `idkelas_fk` int(11) DEFAULT NULL,
  `iderapor_fk` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kelas_oas`
--

CREATE TABLE `kelas_oas` (
  `id_kelas_oas` int(11) NOT NULL,
  `idkelas_fk` int(11) DEFAULT NULL,
  `idoas_fk` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kerjasama_dudi`
--

CREATE TABLE `kerjasama_dudi` (
  `id_kerjasama_dudi` int(11) NOT NULL,
  `idjeniskerjasama_fk` int(11) DEFAULT NULL,
  `iddudi_fk` int(11) DEFAULT NULL,
  `keterangan` text,
  `berkas` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `kerjasama_dudi`
--

INSERT INTO `kerjasama_dudi` (`id_kerjasama_dudi`, `idjeniskerjasama_fk`, `iddudi_fk`, `keterangan`, `berkas`) VALUES
(3, 2, 2, 'sdsd', 'aba67d99a8705ec44be39e673749b1d6.jpg'),
(4, 3, 4, 'asd', '2e86cc3ac1fa1cfafe7f8803b7a6ce3e.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kompetensi_pkg`
--

CREATE TABLE `kompetensi_pkg` (
  `id_kompetensi_pkg` int(11) NOT NULL,
  `kompetensi` text CHARACTER SET latin1,
  `idtahunajaran_fk` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Struktur dari tabel `koperasi_member`
--

CREATE TABLE `koperasi_member` (
  `id_koperasi_member` int(11) NOT NULL,
  `table` text,
  `idtable_fk` int(11) DEFAULT NULL,
  `jumlah_simpanan_wajib` double DEFAULT NULL,
  `jumlah_simpanan_pokok` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kursus_pegawai`
--

CREATE TABLE `kursus_pegawai` (
  `id_kursus_pegawai` int(11) NOT NULL,
  `jenis` text CHARACTER SET latin1,
  `tahun` int(255) DEFAULT NULL,
  `bulan` int(255) DEFAULT NULL,
  `hari` int(255) DEFAULT NULL,
  `tingkat` text CHARACTER SET latin1,
  `keterangan` text CHARACTER SET latin1,
  `idguru_fk` varchar(255) CHARACTER SET latin1 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Struktur dari tabel `learning`
--

CREATE TABLE `learning` (
  `id_learning` int(11) NOT NULL,
  `idmatapelajaran_fk` int(11) DEFAULT NULL,
  `idkd_fk` int(11) DEFAULT '999',
  `materi` text CHARACTER SET latin1,
  `open_access` int(255) DEFAULT NULL COMMENT '0 = Private Access\r\n1 = Open Access(student only)\r\n2 = All Access(public can read)',
  `password` text CHARACTER SET latin1,
  `iduser_fk` int(11) UNSIGNED DEFAULT NULL,
  `judul` text CHARACTER SET latin1,
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `idtingkat_fk` int(11) DEFAULT NULL,
  `cover` text CHARACTER SET latin1,
  `learn_code` text CHARACTER SET latin1,
  `task_code` text CHARACTER SET latin1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Struktur dari tabel `learning_course`
--

CREATE TABLE `learning_course` (
  `id_learning_course` int(11) NOT NULL,
  `course_code` text CHARACTER SET latin1,
  `course` text CHARACTER SET latin1,
  `desc` text CHARACTER SET latin1,
  `banner` text CHARACTER SET latin1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Struktur dari tabel `learning_lessons`
--

CREATE TABLE `learning_lessons` (
  `id_learning_lessons` int(11) NOT NULL,
  `idlearningsyllabus_fk` int(11) DEFAULT NULL,
  `lessons_code` text CHARACTER SET latin1,
  `lessons` text CHARACTER SET latin1,
  `desc` text CHARACTER SET latin1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Struktur dari tabel `learning_materials`
--

CREATE TABLE `learning_materials` (
  `id_learning_materials` int(11) NOT NULL,
  `idlearninglessons_fk` int(11) DEFAULT NULL,
  `materials_code` text CHARACTER SET latin1,
  `materials` text CHARACTER SET latin1,
  `banner` text CHARACTER SET latin1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Struktur dari tabel `learning_set_materials`
--

CREATE TABLE `learning_set_materials` (
  `id_learning_set_materials` int(11) NOT NULL,
  `materials` longtext CHARACTER SET latin1,
  `covers` text CHARACTER SET latin1,
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `iduser_fk` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Struktur dari tabel `learning_set_quiz`
--

CREATE TABLE `learning_set_quiz` (
  `id_learning_set_quiz` int(11) NOT NULL,
  `quiz_name` text CHARACTER SET latin1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Struktur dari tabel `learning_set_task`
--

CREATE TABLE `learning_set_task` (
  `id_learning_set_task` int(11) NOT NULL,
  `task_code` text CHARACTER SET latin1,
  `task` text CHARACTER SET latin1,
  `title` text CHARACTER SET latin1,
  `type_task` text CHARACTER SET latin1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Struktur dari tabel `learning_syllabus`
--

CREATE TABLE `learning_syllabus` (
  `id_learning_syllabus` int(11) NOT NULL,
  `idlearningcourse_fk` int(11) DEFAULT NULL,
  `syllabus_code` text CHARACTER SET latin1,
  `syllabus` text CHARACTER SET latin1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Struktur dari tabel `login_attempts`
--

CREATE TABLE `login_attempts` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Struktur dari tabel `log_kelas_siswa`
--

CREATE TABLE `log_kelas_siswa` (
  `id_log_kelas_siswa` int(11) NOT NULL,
  `idsiswa_fk` int(11) DEFAULT NULL,
  `idkelasbefore_fk` int(11) DEFAULT NULL,
  `idkelasafter_fk` int(11) DEFAULT NULL,
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `keterangan` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data untuk tabel `log_kelas_siswa`
--

INSERT INTO `log_kelas_siswa` (`id_log_kelas_siswa`, `idsiswa_fk`, `idkelasbefore_fk`, `idkelasafter_fk`, `create_at`, `keterangan`, `status`) VALUES
(2, 592, 40, 41, '2022-08-01 11:04:10', 0, 'NAIK KELAS'),
(3, 592, 41, 40, '2022-08-01 11:04:29', 0, 'NAIK KELAS');

-- --------------------------------------------------------

--
-- Struktur dari tabel `lowongan`
--

CREATE TABLE `lowongan` (
  `id_lowongan` int(11) NOT NULL COMMENT ' ',
  `iddudi_fk` int(11) DEFAULT NULL,
  `keterangan` text,
  `rentang_gaji` text,
  `berkas` text,
  `judul` text,
  `deadline` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `lowongan`
--

INSERT INTO `lowongan` (`id_lowongan`, `iddudi_fk`, `keterangan`, `rentang_gaji`, `berkas`, `judul`, `deadline`) VALUES
(1, 3, '11', '300001', '4ae691c91cfc23322c197408cb87a37a.jpg', 'Lowongan Programmer 1', '2022-10-26'),
(2, 4, 'asd', '1500000', '96fc9c22ba255804448b18bcfb759850.jpg', 'Lowongan Admin', '2022-10-24');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mapel_ajar_pegawai`
--

CREATE TABLE `mapel_ajar_pegawai` (
  `id_mapel_ajar_pegawai` int(11) NOT NULL,
  `idguru_fk` int(11) DEFAULT NULL,
  `mapel` text CHARACTER SET latin1,
  `sekolah` text CHARACTER SET latin1,
  `kelas` text CHARACTER SET latin1,
  `tahun` text CHARACTER SET latin1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Struktur dari tabel `mata_pelajaran`
--

CREATE TABLE `mata_pelajaran` (
  `id_mata_pelajaran` int(11) NOT NULL,
  `mata_pelajaran` text CHARACTER SET latin1,
  `kode` text CHARACTER SET latin1,
  `idjenismatapelajaran_fk` int(11) DEFAULT NULL,
  `jKode` varchar(255) CHARACTER SET latin1 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

--
-- Dumping data untuk tabel `mata_pelajaran`
--

INSERT INTO `mata_pelajaran` (`id_mata_pelajaran`, `mata_pelajaran`, `kode`, `idjenismatapelajaran_fk`, `jKode`) VALUES
(1, 'Matematika', 'MTK', NULL, NULL),
(2, 'Bahasa Indonesia', 'BIND', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `materi`
--

CREATE TABLE `materi` (
  `id_materi` int(11) NOT NULL,
  `materi` text CHARACTER SET latin1,
  `file_materi` text CHARACTER SET latin1,
  `file_rpp` text CHARACTER SET latin1,
  `idkelas_fk` int(11) DEFAULT NULL,
  `idguru_fk` int(11) DEFAULT NULL,
  `idtahunajaran_fk` int(11) DEFAULT NULL,
  `idmatapelajaran_fk` int(11) DEFAULT NULL,
  `trans_code` text CHARACTER SET latin1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Struktur dari tabel `media`
--

CREATE TABLE `media` (
  `id_media` int(11) NOT NULL,
  `img` text CHARACTER SET latin1,
  `tag` text CHARACTER SET latin1,
  `title` text CHARACTER SET latin1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Struktur dari tabel `media_files`
--

CREATE TABLE `media_files` (
  `id_media_files` int(11) NOT NULL,
  `file_name` text CHARACTER SET latin1,
  `extension` text CHARACTER SET latin1,
  `url` text CHARACTER SET latin1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Struktur dari tabel `modul`
--

CREATE TABLE `modul` (
  `id_modul` int(11) NOT NULL,
  `modul` text,
  `url` text,
  `icon` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `modul`
--

INSERT INTO `modul` (`id_modul`, `modul`, `url`, `icon`) VALUES
(2, 'Administrasi', '-', 'icon-magazine'),
(3, 'Keuangan', '-', 'icon-coin-dollar'),
(4, 'Bimbingan Konseling', '-', 'icon-notebook'),
(5, 'Data Alumni', '-', 'icon-notebook'),
(6, 'Penilaian Kinerja Guru', '-', 'icon-paste4'),
(7, 'Presensi Guru', '-', 'icon-paste4'),
(8, 'Data Pegawai', '-', 'icon-paste4'),
(9, 'Data Pelajaran', '-', 'icon-book'),
(10, 'Jadwal Pelajaran', '-', 'icon-book'),
(11, 'Pengaturan Lain', '-', 'icon-book');

-- --------------------------------------------------------

--
-- Struktur dari tabel `nilai_keterampilan`
--

CREATE TABLE `nilai_keterampilan` (
  `id_nilai_keterampilan` int(11) NOT NULL,
  `idsiswa_fk` int(11) DEFAULT NULL,
  `nilai` int(255) DEFAULT NULL,
  `trans_code` text CHARACTER SET latin1,
  `idinputnilaiketerampilan_fk` int(11) DEFAULT NULL,
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `idkd_fk` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Struktur dari tabel `nilai_pas`
--

CREATE TABLE `nilai_pas` (
  `id_nilai_pas` int(11) NOT NULL,
  `idsiswa_fk` int(11) DEFAULT NULL,
  `nilai` int(255) DEFAULT NULL,
  `trans_code` text CHARACTER SET latin1,
  `idinputnilaipas_fk` int(11) DEFAULT NULL,
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Struktur dari tabel `nilai_pengetahuan`
--

CREATE TABLE `nilai_pengetahuan` (
  `id_nilai_pengetahuan` int(11) NOT NULL,
  `idsiswa_fk` int(11) DEFAULT NULL,
  `nilai` int(255) DEFAULT NULL,
  `trans_code` text CHARACTER SET latin1,
  `idinputnilaipengetahuan_fk` int(11) DEFAULT NULL,
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `idkd_fk` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Struktur dari tabel `nilai_pkg`
--

CREATE TABLE `nilai_pkg` (
  `id_nilai_pkg` int(11) NOT NULL,
  `periode` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `idtahunajaran_fk` int(11) DEFAULT NULL,
  `idguru_fk` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Struktur dari tabel `nilai_pts`
--

CREATE TABLE `nilai_pts` (
  `id_nilai_pts` int(11) NOT NULL,
  `idsiswa_fk` int(11) DEFAULT NULL,
  `nilai` int(255) DEFAULT NULL,
  `trans_code` text CHARACTER SET latin1,
  `idinputnilaipts_fk` int(11) DEFAULT NULL,
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Struktur dari tabel `notulensi_rapat`
--

CREATE TABLE `notulensi_rapat` (
  `id_notulensi_rapat` int(11) NOT NULL,
  `acara` text CHARACTER SET latin1,
  `tanggal` date DEFAULT NULL,
  `pemimpin_rapat` text CHARACTER SET latin1,
  `isi` text CHARACTER SET latin1,
  `kesimpulan` text CHARACTER SET latin1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Struktur dari tabel `oas`
--

CREATE TABLE `oas` (
  `id_oas` int(11) NOT NULL,
  `tanggal_mulai` date DEFAULT NULL,
  `tanggal_selesai` date DEFAULT NULL,
  `keterangan` text CHARACTER SET latin1,
  `is_active` int(11) DEFAULT NULL,
  `kode` text CHARACTER SET latin1,
  `idmapel_fk` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Struktur dari tabel `oas_kelas`
--

CREATE TABLE `oas_kelas` (
  `id_oas_kelas` int(11) NOT NULL,
  `idkelas_fk` int(11) DEFAULT NULL,
  `idoas_fk` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Struktur dari tabel `oas_soal`
--

CREATE TABLE `oas_soal` (
  `id_oas_soal` int(11) NOT NULL,
  `idbanksoal_fk` int(11) DEFAULT NULL,
  `idoas_fk` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Struktur dari tabel `organisasi_pegawai`
--

CREATE TABLE `organisasi_pegawai` (
  `id_organisasi_pegawai` int(11) NOT NULL,
  `organisasi` text CHARACTER SET latin1,
  `jabatan` text CHARACTER SET latin1,
  `tahun` text CHARACTER SET latin1,
  `idguru_fk` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelanggaran_siswa`
--

CREATE TABLE `pelanggaran_siswa` (
  `id_pelanggaran_siswa` int(11) NOT NULL,
  `tanggal` date DEFAULT NULL,
  `uraian_pelanggaran` text CHARACTER SET latin1,
  `idpoinpelanggaran_fk` int(11) DEFAULT NULL,
  `idsiswa_fk` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

--
-- Dumping data untuk tabel `pelanggaran_siswa`
--

INSERT INTO `pelanggaran_siswa` (`id_pelanggaran_siswa`, `tanggal`, `uraian_pelanggaran`, `idpoinpelanggaran_fk`, `idsiswa_fk`) VALUES
(1, '2022-07-21', 'tes12', 1, 592);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pemasukan_lain`
--

CREATE TABLE `pemasukan_lain` (
  `id_pemasukan_lain` int(11) NOT NULL,
  `trans_code` text,
  `keterangan` text,
  `tanggal` text,
  `total` double(20,2) DEFAULT NULL,
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `akun_beban` int(11) DEFAULT NULL,
  `akun_kas` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Trigger `pemasukan_lain`
--
DELIMITER $$
CREATE TRIGGER `jurnal_pemasukan` AFTER INSERT ON `pemasukan_lain` FOR EACH ROW BEGIN
-- 	Debit
	INSERT into jurnal_umum(ref, idakun_fk, debit, kredit, keterangan, jurnal_umum.table, idtable_fk) VALUES (new.trans_code, new.akun_kas, new.total, 0, new.keterangan, "pemasukan_lain", new.id_pemasukan_lain);
-- 	Kredit
	INSERT into jurnal_umum(ref, idakun_fk, debit, kredit, keterangan, jurnal_umum.table, idtable_fk) VALUES (new.trans_code, new.akun_beban, 0, new.total, new.keterangan, "pemasukan_lain", new.id_pemasukan_lain);

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembayaran_spp`
--

CREATE TABLE `pembayaran_spp` (
  `id_pembayaran_spp` int(11) NOT NULL,
  `idsiswa_fk` int(11) DEFAULT NULL,
  `bulan` int(255) DEFAULT NULL,
  `tahun` int(255) DEFAULT NULL,
  `jumlah_bayar` double(20,0) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `order_id` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pendaftaran`
--

CREATE TABLE `pendaftaran` (
  `id_pendaftaran` int(11) NOT NULL,
  `nama_lengkap` text CHARACTER SET latin1,
  `nisn` text CHARACTER SET latin1,
  `jenis_kelamin` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `nik` text CHARACTER SET latin1,
  `kk` text CHARACTER SET latin1,
  `tempat_lahir` text CHARACTER SET latin1,
  `tanggal_lahir` date DEFAULT NULL,
  `akta` text CHARACTER SET latin1,
  `agama` text CHARACTER SET latin1,
  `kewarganegaraan` text CHARACTER SET latin1,
  `disabilitas` text CHARACTER SET latin1,
  `jenis_disabilitas` text CHARACTER SET latin1,
  `alamat` text CHARACTER SET latin1,
  `rt` text CHARACTER SET latin1,
  `rw` text CHARACTER SET latin1,
  `dusun` text CHARACTER SET latin1,
  `kelurahan` text CHARACTER SET latin1,
  `kecamatan` text CHARACTER SET latin1,
  `kode_pos` text CHARACTER SET latin1,
  `lintang` text CHARACTER SET latin1,
  `bujur` text CHARACTER SET latin1,
  `tempat_tinggal` text CHARACTER SET latin1,
  `moda_transportasi` text CHARACTER SET latin1,
  `anak_ke` int(255) DEFAULT NULL,
  `punya_kip` text CHARACTER SET latin1,
  `tetap_kip` text CHARACTER SET latin1,
  `menolak_pip` text CHARACTER SET latin1,
  `nama_ayah` text CHARACTER SET latin1,
  `nik_ayah` text CHARACTER SET latin1,
  `tahun_lahir_ayah` text CHARACTER SET latin1,
  `pendidikan_ayah` text CHARACTER SET latin1,
  `pekerjaan_ayah` text CHARACTER SET latin1,
  `penghasilan_ayah` double(20,0) DEFAULT NULL,
  `berkebutuhan_khusus_ayah` text CHARACTER SET latin1,
  `nama_ibu` text CHARACTER SET latin1,
  `nik_ibu` text CHARACTER SET latin1,
  `tahun_lahir_ibu` text CHARACTER SET latin1,
  `pendidikan_ibu` text CHARACTER SET latin1,
  `pekerjaan_ibu` text CHARACTER SET latin1,
  `penghasilan_ibu` double(20,0) DEFAULT NULL,
  `berkebutuhan_khusus_ibu` text CHARACTER SET latin1,
  `nama_wali` text CHARACTER SET latin1,
  `nik_wali` text CHARACTER SET latin1,
  `tahun_lahir_wali` text CHARACTER SET latin1,
  `pendidikan_wali` text CHARACTER SET latin1,
  `pekerjaan_wali` text CHARACTER SET latin1,
  `penghasilan_wali` double(20,0) DEFAULT NULL,
  `berkebutuhan_khusus_wali` text CHARACTER SET latin1,
  `nomor_telp_rumah` text CHARACTER SET latin1,
  `no_hp` text CHARACTER SET latin1,
  `email` text CHARACTER SET latin1,
  `tinggi_badan` int(255) DEFAULT NULL,
  `berat_badan` int(255) DEFAULT NULL,
  `lingkar_kepala` int(255) DEFAULT NULL,
  `jarak_ke_sekolah` text CHARACTER SET latin1,
  `angka_jarak` int(255) DEFAULT NULL,
  `waktu_tempuh` int(255) DEFAULT NULL,
  `jenis_kesejahteraan` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `no_kartu` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `nama_kartu` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `kompetensi_keahlian` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `jenis_pendaftaran` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `nis` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `tanggal_masuk_sekolah` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `sekolah_asal` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `no_peserta_un` text CHARACTER SET latin1,
  `no_seri_ijazah` text CHARACTER SET latin1,
  `no_skhu` text CHARACTER SET latin1,
  `usulan_layak_pip` text CHARACTER SET latin1,
  `punya_pkh` text CHARACTER SET latin1,
  `alasan_layak_pip` text CHARACTER SET latin1,
  `no_hp_ayah` text CHARACTER SET latin1,
  `no_hp_ibu` text CHARACTER SET latin1,
  `jenis_sekolah` text CHARACTER SET latin1,
  `kecamatan_sekolah` text CHARACTER SET latin1,
  `kabupaten_sekolah` text CHARACTER SET latin1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pendidikan_pegawai`
--

CREATE TABLE `pendidikan_pegawai` (
  `id_pendidikan_pegawai` int(11) NOT NULL,
  `idguru_fk` int(11) DEFAULT NULL,
  `jenis` text CHARACTER SET latin1,
  `berijazah` text CHARACTER SET latin1,
  `tahun` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Struktur dari tabel `penerimaan`
--

CREATE TABLE `penerimaan` (
  `id_penerimaan` int(11) NOT NULL,
  `idsiswa_fk` int(11) DEFAULT NULL,
  `idjenispenerimaan_fk` int(11) DEFAULT NULL,
  `metode_pembayaran` text,
  `tanggal` text,
  `catatan` text,
  `jumlah` double DEFAULT NULL,
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `invoice` text,
  `diskon` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data untuk tabel `penerimaan`
--

INSERT INTO `penerimaan` (`id_penerimaan`, `idsiswa_fk`, `idjenispenerimaan_fk`, `metode_pembayaran`, `tanggal`, `catatan`, `jumlah`, `create_at`, `invoice`, `diskon`) VALUES
(1, 592, 1, 'Tunai', '2022-07-24', '', 100000, '2022-07-24 07:53:20', 'INV/SPP/24072022/31127', 0),
(2, 592, 4, 'Tunai', '2022-07-25', '', 50000, '2022-07-25 07:22:09', 'INV/STD/25072022/3667195', 0),
(3, 594, 5, 'Tunai', '2022-07-27', '', 150000, '2022-07-27 00:54:00', 'SMKPEMDA/PRAKERIN/27072022/477592', 0),
(4, 592, 6, 'Tunai', '2022-08-03', '', 50000, '2022-08-03 13:50:26', 'INV/DNS/03082022/2088326', 0),
(5, 647, 1, 'TUNAI', '2022-08-22', 'pembayaran tanggungan', 200000, '2022-08-22 11:13:47', 'P5231289', 0),
(6, 647, 3, 'TUNAI', '2022-08-22', 'pembayaran tanggungan', 50000, '2022-08-22 11:13:47', 'P5231289', 0);

--
-- Trigger `penerimaan`
--
DELIMITER $$
CREATE TRIGGER `delete_jurnal_umum_from_penerimaan` AFTER DELETE ON `penerimaan` FOR EACH ROW BEGIN
		delete from jurnal_umum where jurnal_umum.table = "penerimaan" and idtable_fk=old.id_penerimaan;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `penerimaan_alumni`
--

CREATE TABLE `penerimaan_alumni` (
  `id_penerimaan_alumni` int(11) NOT NULL,
  `idalumni_fk` int(11) DEFAULT NULL,
  `idtanggunganalumni_fk` int(11) DEFAULT NULL,
  `metode_pembayaran` text,
  `tanggal` text,
  `catatan` text,
  `jumlah` double DEFAULT NULL,
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `invoice` text,
  `diskon` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `penerimaan_alumni`
--

INSERT INTO `penerimaan_alumni` (`id_penerimaan_alumni`, `idalumni_fk`, `idtanggunganalumni_fk`, `metode_pembayaran`, `tanggal`, `catatan`, `jumlah`, `create_at`, `invoice`, `diskon`) VALUES
(3, 14, 3, 'TUNAI', '2022-08-23', 'dasj', 15000, '2022-08-23 05:18:33', 'P1741155', 0),
(4, 14, 6, 'TUNAI', '2022-08-23', 'dasj', 150000, '2022-08-23 05:18:33', 'P1741155', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengeluaran_lain`
--

CREATE TABLE `pengeluaran_lain` (
  `id_pengeluaran_lain` int(11) NOT NULL,
  `trans_code` text,
  `keterangan` text,
  `tanggal` date DEFAULT NULL,
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `jenis` text,
  `total` double DEFAULT NULL,
  `jenis_kas` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Trigger `pengeluaran_lain`
--
DELIMITER $$
CREATE TRIGGER `jurnal` AFTER INSERT ON `pengeluaran_lain` FOR EACH ROW BEGIN
-- 	Debit
	INSERT into jurnal_umum(ref, idakun_fk, debit, kredit, keterangan, jurnal_umum.table, idtable_fk) VALUES (new.trans_code, new.jenis, new.total, 0, new.keterangan, "pengeluaran_lain", new.id_pengeluaran_lain);
-- 	Kredit
	INSERT into jurnal_umum(ref, idakun_fk, debit, kredit, keterangan, jurnal_umum.table, idtable_fk) VALUES (new.trans_code, new.jenis_kas, 0, new.total, new.keterangan, "pengeluaran_lain", new.id_pengeluaran_lain);

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengumuman`
--

CREATE TABLE `pengumuman` (
  `id_pengumuman` int(11) NOT NULL,
  `pengumuman` text,
  `tgl_mulai` date DEFAULT NULL,
  `tgl_selesai` date DEFAULT NULL,
  `display_view` int(1) DEFAULT NULL,
  `dashboard_view` int(1) DEFAULT NULL,
  `mobile_view` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `penilaian_kinerja_guru`
--

CREATE TABLE `penilaian_kinerja_guru` (
  `id_penilaian_kinerja_guru` int(11) NOT NULL,
  `idguru_fk` int(11) DEFAULT NULL,
  `bulan` int(11) DEFAULT NULL,
  `tahun` int(255) DEFAULT NULL,
  `idtahunajaran_fk` int(11) DEFAULT NULL,
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `trans_code` text CHARACTER SET latin1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Struktur dari tabel `persentase_guru`
--

CREATE TABLE `persentase_guru` (
  `id_persentase_guru` int(11) NOT NULL,
  `idguru_fk` int(11) DEFAULT NULL,
  `persentase` int(11) DEFAULT NULL,
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `idtahunajaran_fk` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pindah_kelas`
--

CREATE TABLE `pindah_kelas` (
  `id_pindah_kelas` int(11) NOT NULL,
  `idkelas_before` int(11) DEFAULT NULL,
  `idkelas_after` int(11) DEFAULT NULL,
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `idsiswa_fk` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pindah_kelas`
--

INSERT INTO `pindah_kelas` (`id_pindah_kelas`, `idkelas_before`, `idkelas_after`, `create_at`, `idsiswa_fk`) VALUES
(1, 40, 39, '2022-07-27 13:22:17', 593),
(2, 39, 40, '2022-07-27 13:22:33', 593);

-- --------------------------------------------------------

--
-- Struktur dari tabel `poin_pelanggaran`
--

CREATE TABLE `poin_pelanggaran` (
  `id_poin_pelanggaran` int(11) NOT NULL,
  `idjenispelanggaran_fk` int(11) DEFAULT NULL,
  `nama_pelanggaran` text CHARACTER SET latin1,
  `poin` int(20) DEFAULT NULL,
  `kode_pelanggaran` text CHARACTER SET latin1,
  `kategori_pelanggaran` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

--
-- Dumping data untuk tabel `poin_pelanggaran`
--

INSERT INTO `poin_pelanggaran` (`id_poin_pelanggaran`, `idjenispelanggaran_fk`, `nama_pelanggaran`, `poin`, `kode_pelanggaran`, `kategori_pelanggaran`) VALUES
(1, 1, 'Tidak mengikuti upacara hari besar nasional', 5, 'A2', 'RINGAN'),
(2, 2, 'Tidak mengikuti upacara peringatan hari besar keagamaan sesuai ketentuan', 5, 'A1', 'RINGAN'),
(6, 2, 'Tidak mengikuti upacara Bendera', 5, 'A3', 'RINGAN'),
(7, 2, 'Tidak mengikuti pengajian dan pesantren Ramadhan', 5, 'A4', 'RINGAN'),
(8, 2, 'Tidak mengikuti kegiatan jam tambahan', 5, 'A5', 'RINGAN'),
(9, 2, 'Tidak mengikuti kegiatan ekstrakurikuler', 5, 'A6', 'RINGAN'),
(10, 1, 'Tidak mengenakan seragam sekolah', 5, 'A6', 'RINGAN'),
(11, 2, 'Tidak melaksanakan tugas piket kebersihan', 5, 'A7', 'RINGAN'),
(12, 2, 'Tidak masuk sekolah dengan membuat surat keterangan palsu', 10, 'B1', 'SEDANG'),
(13, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `ppdb`
--

CREATE TABLE `ppdb` (
  `id_ppdb` int(11) NOT NULL,
  `nama` text CHARACTER SET latin1,
  `nisn` text CHARACTER SET latin1,
  `tanggal_lahir` date DEFAULT NULL,
  `alamat` text CHARACTER SET latin1,
  `email` longtext CHARACTER SET latin1,
  `no_hp` text CHARACTER SET latin1,
  `tempat_lahir` text CHARACTER SET latin1,
  `kode_pos` text CHARACTER SET latin1,
  `tinggi_badan` text CHARACTER SET latin1,
  `berat_badan` text CHARACTER SET latin1,
  `nama_ayah` text CHARACTER SET latin1,
  `tahun_lahir_ayah` text CHARACTER SET latin1,
  `no_hp_ayah` text CHARACTER SET latin1,
  `nama_ibu` text CHARACTER SET latin1,
  `nik_ibu` text CHARACTER SET latin1,
  `no_hp_ibu` text CHARACTER SET latin1,
  `tahun_lahir_ibu` text CHARACTER SET latin1,
  `jenis_kelamin` text CHARACTER SET latin1,
  `pendidikan_terakhir_ayah` text CHARACTER SET latin1,
  `pekerjaan_ayah` text CHARACTER SET latin1,
  `penghasilan_ayah` text CHARACTER SET latin1,
  `penghasilan_ibu` text CHARACTER SET latin1,
  `pekerjaan_ibu` text CHARACTER SET latin1,
  `pendidikan_terakhir_ibu` text CHARACTER SET latin1,
  `nik_siswa` text CHARACTER SET latin1,
  `kode_pendaftaran` text CHARACTER SET latin1,
  `nik_ayah` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `status` int(255) DEFAULT '0',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Struktur dari tabel `predikat_nilai`
--

CREATE TABLE `predikat_nilai` (
  `id_predikat_nilai` int(11) NOT NULL,
  `nilai_awal` int(255) DEFAULT NULL,
  `nilai_akhir` int(255) DEFAULT NULL,
  `predikat` text CHARACTER SET latin1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Struktur dari tabel `predikat_pkg`
--

CREATE TABLE `predikat_pkg` (
  `id_predikat_pkg` int(11) NOT NULL,
  `min` int(255) DEFAULT NULL,
  `max` int(255) DEFAULT NULL,
  `predikat` text CHARACTER SET latin1,
  `warna` text CHARACTER SET latin1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Struktur dari tabel `presensi_event`
--

CREATE TABLE `presensi_event` (
  `id_presensi_event` int(11) NOT NULL,
  `idevent_fk` int(11) DEFAULT NULL,
  `idguru_fk` int(11) DEFAULT NULL,
  `is_hadir` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Struktur dari tabel `presensi_guru`
--

CREATE TABLE `presensi_guru` (
  `id_presensi_guru` int(11) NOT NULL,
  `idguru_fk` int(11) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `jam_masuk` time DEFAULT NULL,
  `jam_keluar` time DEFAULT NULL,
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `idtahunajaran_fk` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

--
-- Dumping data untuk tabel `presensi_guru`
--

INSERT INTO `presensi_guru` (`id_presensi_guru`, `idguru_fk`, `tanggal`, `jam_masuk`, `jam_keluar`, `create_at`, `idtahunajaran_fk`) VALUES
(1, 1, '2022-10-31', '00:00:00', '20:29:00', '2022-10-31 13:29:56', 4),
(2, 2, '2022-10-31', '00:00:00', '20:29:00', '2022-10-31 13:30:04', 4);

-- --------------------------------------------------------

--
-- Struktur dari tabel `presensi_harian`
--

CREATE TABLE `presensi_harian` (
  `id_presensi_harian` int(11) NOT NULL,
  `idmatapelajaran_fk` int(11) DEFAULT NULL,
  `idsiswa_fk` int(11) DEFAULT NULL,
  `presensi` text CHARACTER SET latin1,
  `keterangan` text CHARACTER SET latin1,
  `tanggal` date DEFAULT NULL,
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `idtahunajaran_fk` int(11) DEFAULT NULL,
  `idkelas_fk` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Struktur dari tabel `presensi_rapor`
--

CREATE TABLE `presensi_rapor` (
  `id_presensi_rapor` int(11) NOT NULL,
  `idtahunajaran_fk` int(11) DEFAULT NULL,
  `idsiswa_fk` int(11) DEFAULT NULL,
  `idkelas_fk` int(11) DEFAULT NULL,
  `ijin` int(255) DEFAULT NULL,
  `alpha` int(255) DEFAULT NULL,
  `sakit` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Struktur dari tabel `prestasi_siswa`
--

CREATE TABLE `prestasi_siswa` (
  `id_prestasi_siswa` int(11) NOT NULL,
  `idsiswa_fk` int(11) DEFAULT NULL,
  `prestasi` text,
  `lomba` text,
  `tahun` int(255) DEFAULT NULL,
  `jenis_perlombaan` text,
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

--
-- Dumping data untuk tabel `prestasi_siswa`
--

INSERT INTO `prestasi_siswa` (`id_prestasi_siswa`, `idsiswa_fk`, `prestasi`, `lomba`, `tahun`, `jenis_perlombaan`, `create_at`) VALUES
(1, 592, 'Juara2', 'SAkSSI2', 2021, 'Kelompok', '2022-10-22 13:20:56');

-- --------------------------------------------------------

--
-- Struktur dari tabel `profil_website`
--

CREATE TABLE `profil_website` (
  `nama_website` text CHARACTER SET latin1,
  `alamat` text CHARACTER SET latin1,
  `no_hp` text CHARACTER SET latin1,
  `logo` text CHARACTER SET latin1,
  `icon` text CHARACTER SET latin1,
  `singkatan` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `tagline` text CHARACTER SET latin1,
  `about_us` text CHARACTER SET latin1,
  `email` text CHARACTER SET latin1,
  `pemilik` text CHARACTER SET latin1,
  `facebook` text CHARACTER SET latin1,
  `twitter` text CHARACTER SET latin1,
  `youtube` text CHARACTER SET latin1,
  `instagram` text CHARACTER SET latin1,
  `img_about_us` text CHARACTER SET latin1,
  `wa_text` text CHARACTER SET latin1,
  `background` text CHARACTER SET latin1,
  `credit_by` text CHARACTER SET latin1,
  `breadcrumb_elements` text CHARACTER SET latin1,
  `nama` text CHARACTER SET latin1,
  `kota` text CHARACTER SET latin1,
  `negara` text CHARACTER SET latin1,
  `lng` text CHARACTER SET latin1,
  `lat` text CHARACTER SET latin1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

--
-- Dumping data untuk tabel `profil_website`
--

INSERT INTO `profil_website` (`nama_website`, `alamat`, `no_hp`, `logo`, `icon`, `singkatan`, `tagline`, `about_us`, `email`, `pemilik`, `facebook`, `twitter`, `youtube`, `instagram`, `img_about_us`, `wa_text`, `background`, `credit_by`, `breadcrumb_elements`, `nama`, `kota`, `negara`, `lng`, `lat`) VALUES
('VOHISA', 'Jl. Istana Mekar Wangi Utama No 1P-Q', '085894632505', 'logo-w.png', 'bulb.png', 'undefined', 'Shop with the nature, Please shop with me', '<p>The Balance Small Business makes launching and managing your own business easy. It is home to experts who provide clear, practical advice on entrepreneurship and management. Whether you&rsquo;re just starting up or you want to take your company to the next level, our 20-year-strong library of more than 7,000 pieces of content will answer your questions and turn your business dreams into reality.</p>\n\n<p><a href=\"https://www.thebalancesmb.com/\">The Balance</a>&nbsp;is part of The Balance family of sites, including&nbsp;<a href=\"https://www.thebalance.com/\" rel=\"noopener\" target=\"_blank\">The Balance</a>&nbsp;and&nbsp;<a href=\"https://www.thebalancecareers.com/\" rel=\"noopener\" target=\"_blank\">The Balance Careers</a>, covering personal finance, career, and small business topics. With more than 24 million monthly visitors, The Balance is among the top-10 largest finance properties as measured by comScore, a leading Internet measurement company. Our more than 50 expert writers have extensive qualifications and expertise in their topics, including MBAs, PhDs, CFPs, other advanced degrees and professional certifications.</p>\n\n<p>The Balance family of sites have been honored by multiple awards in the last year, including&nbsp;<a href=\"https://www.tellyawards.com/winners/2017/short-form-social/general-education-discovery\" rel=\"noopener nofollow\" target=\"_blank\">The Telly Awards</a>,&nbsp;<a href=\"https://www.communicatorawards.com/\" rel=\"noopener nofollow\" target=\"_blank\">The Communicator Awards</a>, and&nbsp;<a href=\"https://www.editorandpublisher.com/news/editor-publisher-announces-the-2017-eppy-award-finalists/\" rel=\"noopener nofollow\" target=\"_blank\">Eppy Awards</a>.</p>\n', 'hallo@smkitasy-syadzili.sch.id', 'Abdur Rochim', 'undefined', 'undefined', 'undefined', 'undefined', 'ea4d58dd1254aff316312b7ecbb5c410.jpg', 'Halo Admin, Saya ingin bertanya/membeli/.....', 'd797c14a0070235734508b7d9f409395.jpg', '&copy; 2019. <a href=\"#\">Core Master</a> by<a href=\"https://myber.co.id\" target=\"_blank\">Myber</a>', 'Core Master', 'SMK IT Asy-Syadzili', 'Malang', 'Indonesia', '112.66307147573268', '-7.840640250568774');

-- --------------------------------------------------------

--
-- Struktur dari tabel `provinces`
--

CREATE TABLE `provinces` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dumping data untuk tabel `provinces`
--

INSERT INTO `provinces` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Aceh', '2019-10-22 00:49:46', '2019-10-25 14:02:52'),
(2, 'Sumatera Utara', '2019-10-22 00:49:46', '2019-10-22 00:49:46'),
(3, 'Sumatera Barat', '2019-10-22 00:49:47', '2019-10-22 00:49:47'),
(4, 'Riau', '2019-10-22 00:49:48', '2019-10-22 00:49:48'),
(5, 'Jambi', '2019-10-22 00:49:48', '2019-10-22 00:49:48'),
(6, 'Sumatera Selatan', '2019-10-22 00:49:49', '2019-10-22 00:49:49'),
(7, 'Bengkulu', '2019-10-22 00:49:49', '2019-10-22 00:49:49'),
(8, 'Lampung', '2019-10-22 00:49:49', '2019-10-22 00:49:49'),
(9, 'Kepulauan Bangka Belitung', '2019-10-22 00:49:50', '2019-10-22 00:49:50'),
(10, 'Kepulauan Riau', '2019-10-22 00:49:50', '2019-10-22 00:49:50'),
(11, 'Dki Jakarta', '2019-10-22 00:49:50', '2019-10-22 00:49:50'),
(12, 'Jawa Barat', '2019-10-22 00:49:51', '2019-10-22 00:49:51'),
(13, 'Jawa Tengah', '2019-10-22 00:49:51', '2019-10-22 00:49:51'),
(14, 'Di Yogyakarta', '2019-10-22 00:49:52', '2019-10-22 00:49:52'),
(15, 'Jawa Timur', '2019-10-22 00:49:52', '2019-10-22 00:49:52'),
(16, 'Banten', '2019-10-22 00:49:54', '2019-10-22 00:49:54'),
(17, 'Bali', '2019-10-22 00:49:54', '2019-10-22 00:49:54'),
(18, 'Nusa Tenggara Barat', '2019-10-22 00:49:54', '2019-10-22 00:49:54'),
(19, 'Nusa Tenggara Timur', '2019-10-22 00:49:54', '2019-10-22 00:49:54'),
(20, 'Kalimantan Barat', '2019-10-22 00:49:55', '2019-10-22 00:49:55'),
(21, 'Kalimantan Tengah', '2019-10-22 00:49:56', '2019-10-22 00:49:56'),
(22, 'Kalimantan Selatan', '2019-10-22 00:49:56', '2019-10-22 00:49:56'),
(23, 'Kalimantan Timur', '2019-10-22 00:49:57', '2019-10-22 00:49:57'),
(24, 'Kalimantan Utara', '2019-10-22 00:49:57', '2019-10-22 00:49:57'),
(25, 'Sulawesi Utara', '2019-10-22 00:49:57', '2019-10-22 00:49:57'),
(26, 'Sulawesi Tengah', '2019-10-22 00:49:58', '2019-10-22 00:49:58'),
(27, 'Sulawesi Selatan', '2019-10-22 00:49:58', '2019-10-22 00:49:58'),
(28, 'Sulawesi Tenggara', '2019-10-22 00:49:59', '2019-10-22 00:49:59'),
(29, 'Gorontalo', '2019-10-22 00:49:59', '2019-10-22 00:49:59'),
(30, 'Sulawesi Barat', '2019-10-22 00:49:59', '2019-10-22 00:49:59'),
(31, 'Maluku', '2019-10-22 00:50:00', '2019-10-22 00:50:00'),
(32, 'Maluku Utara', '2019-10-22 00:50:00', '2019-10-22 00:50:00'),
(33, 'Papua Barat', '2019-10-22 00:50:00', '2019-10-22 00:50:00'),
(34, 'Papua', '2019-10-22 00:50:01', '2019-10-22 00:50:01');

-- --------------------------------------------------------

--
-- Struktur dari tabel `question_cas`
--

CREATE TABLE `question_cas` (
  `id_question_cas` int(11) NOT NULL,
  `type` text CHARACTER SET latin1,
  `idbanksoal_fk` int(11) DEFAULT NULL,
  `idquiz_fk` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Struktur dari tabel `quiz`
--

CREATE TABLE `quiz` (
  `id_quiz` int(11) NOT NULL,
  `quiz_name` text CHARACTER SET latin1,
  `quiz_type` int(11) DEFAULT NULL COMMENT '0 = Multiple choixe\r\n1 = single choice\r\n2 = Survey',
  `password` text CHARACTER SET latin1,
  `idmatapelajaran_fk` int(11) DEFAULT NULL,
  `iduser_fk` int(11) DEFAULT NULL,
  `open_access` int(255) DEFAULT NULL COMMENT '0 = Private Access\r\n1 = Open Access(student only)\r\n2 = All Access(public can read)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Struktur dari tabel `riwayat_kerja_pns_pegawai`
--

CREATE TABLE `riwayat_kerja_pns_pegawai` (
  `id_riwayat_kerja_pns_pegawai` int(11) NOT NULL,
  `idguru_fk` int(11) DEFAULT NULL,
  `pangkat` text CHARACTER SET latin1,
  `jabatan` text CHARACTER SET latin1,
  `gaji` text CHARACTER SET latin1,
  `terhitung_mulai` text CHARACTER SET latin1,
  `keterangan` text CHARACTER SET latin1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Struktur dari tabel `riwayat_kerja_swasta_pegawai`
--

CREATE TABLE `riwayat_kerja_swasta_pegawai` (
  `id_riwayat_kerja_swasta_pegawai` int(11) NOT NULL,
  `idguru_fk` int(11) DEFAULT NULL,
  `jenis` text CHARACTER SET latin1,
  `tahun` text CHARACTER SET latin1,
  `keterangan` text CHARACTER SET latin1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Struktur dari tabel `rpp`
--

CREATE TABLE `rpp` (
  `id_rpp` int(11) NOT NULL,
  `idguru_fk` int(11) DEFAULT NULL,
  `idtahunajaran_fk` int(11) DEFAULT NULL,
  `idkelas_fk` int(11) DEFAULT NULL,
  `idmateri_fk` int(11) DEFAULT NULL,
  `alokasi_waktu` text CHARACTER SET latin1,
  `file` text CHARACTER SET latin1,
  `idmatapelajaran_fk` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Struktur dari tabel `ruangan`
--

CREATE TABLE `ruangan` (
  `id_ruangan` int(11) NOT NULL,
  `ruangan` text CHARACTER SET latin1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Struktur dari tabel `semester`
--

CREATE TABLE `semester` (
  `id_semester` int(11) NOT NULL,
  `semester` text CHARACTER SET latin1,
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

--
-- Dumping data untuk tabel `semester`
--

INSERT INTO `semester` (`id_semester`, `semester`, `create_at`) VALUES
(1, 'Genap', '2020-06-07 03:07:53'),
(2, 'Ganjil', '2020-06-07 03:08:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `setting_akun`
--

CREATE TABLE `setting_akun` (
  `id_setting_akun` int(11) NOT NULL,
  `kode` text CHARACTER SET latin1,
  `nama` text CHARACTER SET latin1,
  `debit` text CHARACTER SET latin1,
  `kredit` text CHARACTER SET latin1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Struktur dari tabel `setting_table`
--

CREATE TABLE `setting_table` (
  `id_setting_table` int(11) NOT NULL,
  `table` text CHARACTER SET latin1,
  `name` text CHARACTER SET latin1,
  `value` text CHARACTER SET latin1,
  `keterangan` text CHARACTER SET latin1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

--
-- Dumping data untuk tabel `setting_table`
--

INSERT INTO `setting_table` (`id_setting_table`, `table`, `name`, `value`, `keterangan`) VALUES
(1, 'buku_tamu', 'template_excel', 'include/template/excel/format_cetak_buku_tamu', 'Template Buku Tamu'),
(2, 'prestasi_siswa', 'template_excel', 'include/template/excel/format_cetak_prestasi_siswa', 'Template Prestasi Siswa');

-- --------------------------------------------------------

--
-- Struktur dari tabel `setting_website`
--

CREATE TABLE `setting_website` (
  `SPP` double(20,0) DEFAULT NULL,
  `DSP` double(20,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

--
-- Dumping data untuk tabel `setting_website`
--

INSERT INTO `setting_website` (`SPP`, `DSP`) VALUES
(0, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `silabus`
--

CREATE TABLE `silabus` (
  `id_silabus` int(11) NOT NULL,
  `idguru_fk` int(11) DEFAULT NULL,
  `idtahunajaran_fk` int(11) DEFAULT NULL,
  `idtingkat_fk` int(11) DEFAULT NULL,
  `idjurusan_fk` int(11) DEFAULT NULL,
  `idmatapelajaran_fk` int(11) DEFAULT NULL,
  `file` text CHARACTER SET latin1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Struktur dari tabel `siswa`
--

CREATE TABLE `siswa` (
  `id_siswa` int(11) NOT NULL,
  `nis` text CHARACTER SET latin1,
  `nama` text CHARACTER SET latin1,
  `idkelas_fk` int(11) DEFAULT NULL,
  `idjurusan_fk` int(11) DEFAULT NULL,
  `agama` text CHARACTER SET latin1,
  `nisn` text CHARACTER SET latin1,
  `no_ijazah_sekolah_asal` text CHARACTER SET latin1,
  `no_skhun_sekolah_asal` text CHARACTER SET latin1,
  `no_un_sekolah_asal` text CHARACTER SET latin1,
  `no_kk` text CHARACTER SET latin1,
  `npsn_sekolah_asal` text CHARACTER SET latin1,
  `nama_sekolah_asal` text CHARACTER SET latin1,
  `tempat_lahir` text CHARACTER SET latin1,
  `tanggal_lahir` date DEFAULT NULL,
  `berkebutuhan_khusus` text CHARACTER SET latin1,
  `alamat` text CHARACTER SET latin1,
  `dusun` text CHARACTER SET latin1,
  `rt` text CHARACTER SET latin1,
  `rw` text CHARACTER SET latin1,
  `kelurahan` text CHARACTER SET latin1,
  `foto` text CHARACTER SET hp8,
  `idprovince_fk` int(11) DEFAULT NULL,
  `idcities_fk` int(11) DEFAULT NULL,
  `nama_ayah` text CHARACTER SET latin1,
  `tempat_lahir_ayah` text CHARACTER SET latin1,
  `tanggal_lahir_ayah` date DEFAULT NULL,
  `pendidikan_ayah` text CHARACTER SET latin1,
  `pekerjaan_ayah` text CHARACTER SET latin1,
  `penghasilan_ayah` text CHARACTER SET latin1,
  `nama_ibu` text CHARACTER SET latin1,
  `tempat_lahir_ibu` text CHARACTER SET latin1,
  `tanggal_lahir_ibu` date DEFAULT NULL,
  `pendidikan_ibu` text CHARACTER SET latin1,
  `pekerjaan_ibu` text CHARACTER SET latin1,
  `penghasilan_ibu` text CHARACTER SET latin1,
  `tinggi_badan` int(11) DEFAULT NULL,
  `berat_badan` int(11) DEFAULT NULL,
  `jarak_ke_sekolah` int(255) DEFAULT NULL,
  `waktu_ke_sekolah` int(255) DEFAULT NULL,
  `jumlah_saudara` int(255) DEFAULT NULL,
  `jenis_kelamin` text CHARACTER SET latin1,
  `saldo` double DEFAULT NULL,
  `is_alumni` int(255) DEFAULT '0',
  `iddepartment_fk` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

--
-- Dumping data untuk tabel `siswa`
--

INSERT INTO `siswa` (`id_siswa`, `nis`, `nama`, `idkelas_fk`, `idjurusan_fk`, `agama`, `nisn`, `no_ijazah_sekolah_asal`, `no_skhun_sekolah_asal`, `no_un_sekolah_asal`, `no_kk`, `npsn_sekolah_asal`, `nama_sekolah_asal`, `tempat_lahir`, `tanggal_lahir`, `berkebutuhan_khusus`, `alamat`, `dusun`, `rt`, `rw`, `kelurahan`, `foto`, `idprovince_fk`, `idcities_fk`, `nama_ayah`, `tempat_lahir_ayah`, `tanggal_lahir_ayah`, `pendidikan_ayah`, `pekerjaan_ayah`, `penghasilan_ayah`, `nama_ibu`, `tempat_lahir_ibu`, `tanggal_lahir_ibu`, `pendidikan_ibu`, `pekerjaan_ibu`, `penghasilan_ibu`, `tinggi_badan`, `berat_badan`, `jarak_ke_sekolah`, `waktu_ke_sekolah`, `jumlah_saudara`, `jenis_kelamin`, `saldo`, `is_alumni`, `iddepartment_fk`) VALUES
(592, '', 'Santi Dwi Samsiyah', 40, 6, NULL, '0036577658', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'P', NULL, NULL, 1),
(593, '', 'Sinta Dwi Samsiyah', 40, 6, NULL, '0036577659', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'P', NULL, NULL, 1),
(594, '', 'ALBET DIMAS NURFENDI PRATAMA', 0, 0, NULL, '0036078764', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1),
(595, '', 'ARIEF WAHYUDI', 0, 0, NULL, '0028843265', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1),
(596, '', 'ETIK MULYANI', 0, 0, NULL, '0024950260', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1),
(597, '', 'FARA AGUN YUNANTO', 0, 0, NULL, '0028095705', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1),
(598, '', 'LINDA AIDA', 0, 0, NULL, '0036417497', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1),
(599, '', 'SAHID', 0, 0, NULL, '0034071069', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1),
(600, '', 'SITI KOMAIROH', 0, 0, NULL, '0042154375', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1),
(601, '', 'YOSEPTY NURUL FERRISA', 0, 0, NULL, '0042138354', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1),
(612, '', 'A\'AN SANCOKO', 42, 7, NULL, '0066968534', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(613, '', 'AHMAD YUSQI DWI KURNIAWAN', 42, 7, NULL, '0054217432', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(614, '', 'ANESHA RAFAEL BENAYA', 42, 7, NULL, '0052973416', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(615, '', 'ARGO RIO PUTRA KATERNANDO', 42, 7, NULL, '0045692779', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(616, '', 'ARIL ARDIANSYAH', 42, 7, NULL, '3051940401', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(617, '', 'BAHAR WIJAYA', 42, 7, NULL, '0055101946', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(618, '', 'BRAYEND DIAN DINATHA', 42, 7, NULL, '0054540454', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(619, '', 'CELVIN WIDIANTO', 42, 7, NULL, '0055181315', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(620, '', 'DIMAS MOCHAMMAD FADILLAH', 42, 7, NULL, '0063521754', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(621, '', 'DIO TRATANA', 42, 7, NULL, '0068183586', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(622, '', 'DWIJAYA KUSUMA HADI', 42, 7, NULL, '0055041321', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(623, '', 'ERIA TRI ADHARI', 42, 7, NULL, '3061879088', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(624, '', 'GIAN AUFA SULTAN ALI', 42, 7, NULL, '0057536561', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(625, '', 'IRVAN ALDI SETIAWAN', 42, 7, NULL, '0063263525', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(626, '', 'MUHAMMAD ADITYA OKTAFIAN RAMADANSYAH', 42, 7, NULL, '0067924106', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(627, '', 'MUHAMMAD ADYBU SHOLEH', 42, 7, NULL, '0068038937', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(628, '', 'MUHAMMAD HUPRON JAINUL NGALIM', 42, 7, NULL, '0063808903', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(629, '', 'RAMDANI FIRMANSYAH', 42, 7, NULL, '0036417934', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(630, '', 'RIZKI DWI SAPUTRA', 42, 7, NULL, '0052457943', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(631, '', 'TEGAR ALIF SANTOSO', 42, 7, NULL, '0055506756', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(632, '', 'WAHYU KARLIN PRADANA', 42, 7, NULL, '0062523997', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(633, '', 'YOGA BAGUS PRATAMA', 42, 7, NULL, '0054094806', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(634, '', 'YOGA TRIYO SUBANGKIT', 42, 7, NULL, '0059619725', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(635, '', 'ADHI PRASETYA', 43, 7, NULL, '0045514903', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(636, '', 'AFVET DERI MARSELLINO', 43, 7, NULL, '0052036510', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(637, '', 'HABIB MUHAMMAD TOHIR', 43, 7, NULL, '0036417493', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(638, '', 'M. ZAIM ARROSYD', 43, 7, NULL, '0045607750', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(639, '', 'MUHAMMAD ABDUL ROIS', 43, 7, NULL, '0036357337', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(640, '', 'PERIYA ADITYA', 43, 7, NULL, '0052062381', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(641, '', 'RICCO ARGA SAPUTRA', 43, 7, NULL, '0054813846', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(642, '', 'RIDHA SETIAWAN', 43, 7, NULL, '0041243854', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(643, '', 'ROI SAPUJO', 43, 7, NULL, '0046687940', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(644, '', 'SAHRUL AJI SAPUTRA', 43, 7, NULL, '0053551497', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(645, '', 'TEGUH GUNAWAN', 43, 7, NULL, '0048385231', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(646, '', 'AHMAD ARHAM ARDIYA PUTRA', 0, 0, NULL, '3025057810', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1),
(647, '', 'AHMAD ZAINURI MAKRUF', 0, 0, NULL, '0036416117', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1),
(648, '', 'ALDY PANDUWINATA', 44, 7, NULL, '0036510509', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(649, '', 'ALIF BUKHORI', 44, 7, NULL, '0036510650', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(650, '', 'ARI MUSTOFA', 44, 7, NULL, '0031812533', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(651, '', 'DIDIK HARDIANTO', 44, 7, NULL, '0024939917', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(652, '', 'FRENDI EKO CAHYONO', 44, 7, NULL, '0036931241', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(653, '', 'HELMI BAYU SAPUTRO', 44, 7, NULL, '0016195706', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(654, '', 'KARTIKO BAYU PRASETYO', 44, 7, NULL, '0028816987', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(655, '', 'KERISNA ARDIANTO', 44, 7, NULL, '0036391797', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(656, '', 'KOIRUL UBAIDILAH FATHUROKHIM', 44, 7, NULL, '0036578709', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(657, '', 'KRISNA EKA SAPUTRA', 44, 7, NULL, '0022991634', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(658, '', 'LUKY WAHYU SAPUTRA', 44, 7, NULL, '0036416203', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(659, '', 'MOH ZEIN ARDIANSYAH', 44, 7, NULL, '0042946662', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(660, '', 'MOH. ARIS SETIAWAN', 44, 7, NULL, '0021503467', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(661, '', 'MUHAMMAD BANA ALI MA\'RUF FAUZI', 44, 7, NULL, '0003403086', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(662, '', 'NUR KHOIRUL ANAM', 44, 7, NULL, '0033519270', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(663, '', 'RENDI ANDIKA DWI SAPUTRA', 44, 7, NULL, '0036510043', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(664, '', 'RICO DIDIK MAHENDRA', 44, 7, NULL, '0036078186', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(665, '', 'RIO ARDIANTO', 44, 7, NULL, '0036416199', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(666, '', 'ROKY SEPTIAN WIRANTO', 44, 7, NULL, '0016553260', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(667, '', 'RUDI KRISBIYANTO', 44, 7, NULL, '0036079877', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(668, '', 'RUDY FAJAR NUGROHO', 44, 7, NULL, '0036510016', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(669, '', 'SONY SETIAWAN', 44, 7, NULL, '0036578710', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(670, '', 'ADE NOVIYANTI', 45, 9, NULL, '0043300533', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(671, '', 'AHMAD SYAFARONI', 45, 9, NULL, '0048694496', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(672, '', 'GALING DWI MUSTOMO', 45, 9, NULL, '0052133958', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(673, '', 'MUHAKIM AJI PAMBUDI', 45, 9, NULL, '0055437693', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(674, '', 'OKTAVIA RAMADHANI NURJANAH', 45, 9, NULL, '0056760890', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(675, '', 'RANJANA SEPTIAN RAHMAN', 45, 9, NULL, '0043828673', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(676, '', 'GALING DWI MUSTOMO', 45, 9, NULL, '0052133958', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(677, '', 'AHMAD ILHAM MAHMUDI', 46, 9, NULL, '0044735094', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(678, '', 'ATIM NUR SALIM', 46, 9, NULL, '0054733834', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(679, '', 'DEFANDA FICAN ABI MAULANA', 46, 9, NULL, '0045787196', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(680, '', 'FATDILLAH RENATA', 46, 9, NULL, '0036090146', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(681, '', 'HAWA KHARISMA ZAHARA', 46, 9, NULL, '0041745870', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(682, '', 'IRFAN FAUZI', 46, 9, NULL, '0045691993', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(683, '', 'JAIS MUKTI WICAKSONO', 46, 9, NULL, '3045666600', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(684, '', 'LESTARI', 46, 9, NULL, '0045015401', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(685, '', 'MUH AZIS MA\'RUF', 46, 9, NULL, '0033519834', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(686, '', 'NURDIN ISKANDAR', 46, 9, NULL, '0049871561', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(687, '', 'AFITRISYA ANDIKA RIMBA YUDA PRATAMA', 47, 9, NULL, '0024950140', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(688, '', 'AISYATUL LORA AQRIANI', 47, 9, NULL, '0035560234', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(689, '', 'ANDRE GUNAWAN', 47, 9, NULL, '0036510504', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(690, '', 'BUDI HARTONO', 47, 9, NULL, '0015497084', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(691, '', 'CINTANIYA AYUNDA DEVANIO', 47, 9, NULL, '3047064247', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(692, '', 'DIMAS HARDIANSYAH', 47, 9, NULL, '0037304683', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(693, '', 'DONI KUSUMA', 47, 9, NULL, '0036510513', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(694, '', 'MEI NUR AINI', 47, 9, NULL, '0042151572', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(695, '', 'NOFIAN WIDI NUGROHO', 47, 9, NULL, '0036510659', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(696, '', 'NURUL AMANDA LESTARI', 47, 9, NULL, '0042351207', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(697, '', 'STYVEN DWI PUTRA WARDOYO', 47, 9, NULL, '0036078818', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(698, '', 'WAHYU ROHHANA', 47, 9, NULL, '0036034851', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(699, '', 'WIDIA DESMA FITRIANA', 47, 9, NULL, '0010200604', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(700, '', 'YANUAR ARI EVENDY', 47, 9, NULL, '0028955639', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(701, '', 'YUDHA ANGGA PRAMUDITYA', 47, 9, NULL, '0036417824', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(702, '', 'ABDUL AZIZ ANDI ATMAJA', 48, 10, NULL, '0053721785', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(703, '', 'ABDUL FAQIH', 48, 10, NULL, '0051774423', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(704, '', 'ADEL MUNA AL MASYKUR', 48, 10, NULL, '0066124715', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(705, '', 'AGUNG CAHYA ILHAM ANUGRAH HERLAMBANG BUANAJATI', 48, 10, NULL, '0038539350', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(706, '', 'AGUNG PRAYOGO', 48, 10, NULL, '0062198051', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(707, '', 'ALIF KRISTIANTORO', 48, 10, NULL, '3048876049', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(708, '', 'ANANDA YOGI KIAN SAPUTRA', 48, 10, NULL, '0067571639', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(709, '', 'ANGGA PRADANA ROMADHON', 48, 10, NULL, '0052185038', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(710, '', 'BAYU CAHYO SAPUTRA', 48, 10, NULL, '0015893629', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(711, '', 'BAYU SETIAWAN', 48, 10, NULL, '0046989104', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(712, '', 'CANTIKA INDRAWATI', 48, 10, NULL, '0028873783', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(713, '', 'DAFIK NUR CAHYONO', 48, 10, NULL, '0042397751', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(714, '', 'DENDI NURCAHYONO', 48, 10, NULL, '0002787919', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(715, '', 'DENDIK SETIYAWAN', 48, 10, NULL, '0036274317', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(716, '', 'DIFKA AYU TRI WAHYUNI', 48, 10, NULL, '0031156926', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(717, '', 'DREINALDO REFIN SUGANDA', 48, 10, NULL, '0036274314', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(718, '', 'DUWI AGUNG PURNOMO', 48, 10, NULL, '0045477845', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(719, '', 'HADI WIDADA', 48, 10, NULL, '0024932698', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(720, '', 'HARDIANTO', 48, 10, NULL, '0036275261', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(721, '', 'HARIS DIDIN SAPUTRO', 48, 10, NULL, '0048946165', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(722, '', 'HENGKI GIO DIMAS SAPUTRA', 48, 10, NULL, '0051147118', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(723, '', 'I\'IN KOSIYAH', 48, 10, NULL, '0024932720', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(724, '', 'IMRON ZAINUL HUDA', 48, 10, NULL, '0042397747', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(725, '', 'IRFAN RISQIANTO', 48, 10, NULL, '3023262049', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(726, '', 'JAINAL ARIFIN', 48, 10, NULL, '0022072592', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(727, '', 'KHOIRUL IKHWANI', 48, 10, NULL, '0015893647', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(728, '', 'KLARISA AYU PUTRI KINANTI', 48, 10, NULL, '0059534769', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(729, '', 'MAHFUD AL MUZAYIN', 48, 10, NULL, '0045219913', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(730, '', 'MARWANDI HARDIANTO', 48, 10, NULL, '0066547379', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(731, '', 'MUHAMMAD  MIFTAH IRFA\'I', 48, 10, NULL, '3016734074', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(732, '', 'NIKA ERLINA WATI', 48, 10, NULL, '0045477847', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(733, '', 'NIKO DWI ANDIKA', 48, 10, NULL, '0064983142', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(734, '', 'REGI AHMAD DANI', 48, 10, NULL, '0054308602', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(735, '', 'RIMBA EKA SAPUTRA', 48, 10, NULL, '0036274325', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(736, '', 'RISKY ANDRE PURWANTO', 48, 10, NULL, '3055012454', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(737, '', 'RYAN MIFTAHUL ANNAS', 48, 10, NULL, '0055727345', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(738, '', 'SAMSUL HUDA', 48, 10, NULL, '0042397623', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(739, '', 'TRI WAHYU PRASETYO', 48, 10, NULL, '0001507039', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(740, '', 'TRIONO IMAM SAIPUDIN', 48, 10, NULL, '0031156916', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(741, '', 'WAHID RIDHO ANSORI', 48, 10, NULL, '0041113060', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(742, '', 'WAHYU SUSTIONO', 48, 10, NULL, '0068579169', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(743, '', 'WAHYU TAUFIK ICHWAN', 48, 10, NULL, '0045219929', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(744, '', 'WINDI WULANDARI', 48, 10, NULL, '0062799154', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `siswa_beasiswa`
--

CREATE TABLE `siswa_beasiswa` (
  `id_siswa_beasiswa` int(11) NOT NULL,
  `idsiswa_fk` int(11) DEFAULT NULL,
  `jenis` text CHARACTER SET latin1,
  `penyelenggara` text CHARACTER SET latin1,
  `tahun_mulai` text CHARACTER SET latin1,
  `tahun_selesai` text CHARACTER SET latin1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Struktur dari tabel `siswa_dokumen`
--

CREATE TABLE `siswa_dokumen` (
  `id_siswa_dokumen` int(11) NOT NULL,
  `idsiswa_fk` int(11) DEFAULT NULL,
  `keterangan` text CHARACTER SET latin1,
  `foto` text CHARACTER SET latin1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Struktur dari tabel `siswa_mapel`
--

CREATE TABLE `siswa_mapel` (
  `id_siswa_mapel` int(11) NOT NULL,
  `idsiswa_fk` int(11) DEFAULT NULL,
  `idmatapelajaran_fk` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Struktur dari tabel `siswa_prestasi`
--

CREATE TABLE `siswa_prestasi` (
  `id_siswa_prestasi` int(11) NOT NULL,
  `idsiswa_fk` int(11) DEFAULT NULL,
  `jenis` text CHARACTER SET latin1,
  `tingkat` text CHARACTER SET latin1,
  `nama` text CHARACTER SET latin1,
  `tahun` text CHARACTER SET latin1,
  `penyelenggara` text CHARACTER SET latin1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Struktur dari tabel `sosialisasi`
--

CREATE TABLE `sosialisasi` (
  `id_sosialisasi` int(11) NOT NULL,
  `tanggal` date DEFAULT NULL,
  `judul` text,
  `keterangan` text,
  `berkas` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `sosialisasi`
--

INSERT INTO `sosialisasi` (`id_sosialisasi`, `tanggal`, `judul`, `keterangan`, `berkas`) VALUES
(3, '2022-10-23', 'Sosialisasi guru merdeka', 'uji coba sosialisasi guru merdeka yang diadakan di sekolah', '2cf6d1d285fda26618f15829a709bdba.jpg'),
(4, '2022-10-23', 'Sosialisasi Praktek Kerja Industri', 'kegiatan dilaksanakan di sekolah', 'b368005d51ca9118ea7942f83f404e4c.jpg'),
(5, '2022-10-24', 'Sosialisasi gerakan berkoperasi', 'adsad', '57aff1c469ed6b78a4cdfe63453eaeee.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `student_account`
--

CREATE TABLE `student_account` (
  `id_student_account` int(11) NOT NULL,
  `idsiswa_fk` int(11) DEFAULT NULL,
  `username` text,
  `pass` text,
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data untuk tabel `student_account`
--

INSERT INTO `student_account` (`id_student_account`, `idsiswa_fk`, `username`, `pass`, `create_at`, `update_at`) VALUES
(1, 285, 'ferdy', '55f3fc2fdb2fea1f635521b79abfe204', '2022-05-31 00:20:14', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `subkompetensi_pkg`
--

CREATE TABLE `subkompetensi_pkg` (
  `id_subkompetensi_pkg` int(11) NOT NULL,
  `idkompetensipkg_fk` int(11) DEFAULT NULL,
  `subkompetensi` text CHARACTER SET latin1,
  `kode` text CHARACTER SET latin1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Struktur dari tabel `submodul`
--

CREATE TABLE `submodul` (
  `id_submodul` int(11) NOT NULL,
  `idmodul_fk` int(11) DEFAULT NULL,
  `submodul` text,
  `url` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `submodul`
--

INSERT INTO `submodul` (`id_submodul`, `idmodul_fk`, `submodul`, `url`) VALUES
(1, 2, 'Prestasi Siswa', 'Prestasi_siswa/get_data'),
(2, 2, 'Buku Tamu', 'Buku_tamu/get_data'),
(3, 2, 'Surat Masuk', 'Surat_masuk/get_data'),
(4, 2, 'Surat Keluar', 'Surat_keluar/get_data'),
(5, 2, 'Buku Induk Kepegawaian', 'Kepegawaian//get_data'),
(6, 3, 'Chart Of Account', 'coa/get_data'),
(7, 3, 'Jenis Tanggungan', 'Jenis_penerimaan/get_data');

-- --------------------------------------------------------

--
-- Struktur dari tabel `suplier`
--

CREATE TABLE `suplier` (
  `id_suplier` int(11) NOT NULL,
  `suplier` text,
  `no_hp` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Struktur dari tabel `surat_keluar`
--

CREATE TABLE `surat_keluar` (
  `id_surat_keluar` int(11) NOT NULL,
  `tujuan` text CHARACTER SET latin1,
  `perihal` text CHARACTER SET latin1,
  `no_surat` text CHARACTER SET latin1,
  `kode_arsip` text CHARACTER SET latin1,
  `file_arsip` text CHARACTER SET latin1,
  `tanggal_surat` date DEFAULT NULL,
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

--
-- Dumping data untuk tabel `surat_keluar`
--

INSERT INTO `surat_keluar` (`id_surat_keluar`, `tujuan`, `perihal`, `no_surat`, `kode_arsip`, `file_arsip`, `tanggal_surat`, `create_at`) VALUES
(1, 'a', 'a', '1231', '85650', '20641942bfea3d85aceabc3d3ca75e40.jpg', '2022-07-22', '2022-07-22 10:01:07'),
(2, 'PPSQ Asy-Syadzili', 'Beli martabak', '1238213', '7912921', 'b1a0b10193bb263d0b09bd16209d73cf.jpg', '2022-10-16', '2022-10-22 13:35:04');

-- --------------------------------------------------------

--
-- Struktur dari tabel `surat_masuk`
--

CREATE TABLE `surat_masuk` (
  `id_surat_masuk` int(11) NOT NULL,
  `pengirim` text CHARACTER SET latin1,
  `perihal` text CHARACTER SET latin1,
  `tanggal_surat` text CHARACTER SET latin1,
  `kode_arsip` text CHARACTER SET latin1,
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `no_surat` longtext CHARACTER SET latin1,
  `file_arsip` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

--
-- Dumping data untuk tabel `surat_masuk`
--

INSERT INTO `surat_masuk` (`id_surat_masuk`, `pengirim`, `perihal`, `tanggal_surat`, `kode_arsip`, `create_at`, `no_surat`, `file_arsip`) VALUES
(3, 'andhi', 'asd', '2022-08-03', '632509', '2022-08-03 13:42:08', '123', '8e1f84189f5cc32677ca349ba367d6a7.png'),
(4, 'rahmat1', 'asdasd1', '2022-10-23', '2107791', '2022-10-22 13:32:56', '123/1234', '01c8f2013eabf9e87391d65442912ac5.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tahun_ajaran`
--

CREATE TABLE `tahun_ajaran` (
  `id_tahun_ajaran` int(11) NOT NULL,
  `tahun_ajaran` text CHARACTER SET latin1,
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `is_active` int(11) DEFAULT NULL,
  `semester` text CHARACTER SET latin1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

--
-- Dumping data untuk tabel `tahun_ajaran`
--

INSERT INTO `tahun_ajaran` (`id_tahun_ajaran`, `tahun_ajaran`, `create_at`, `is_active`, `semester`) VALUES
(1, '2020/2021', '2020-06-07 03:07:41', 0, 'Ganjil'),
(2, '2018/2019', '2020-08-03 04:06:13', 0, 'Genap'),
(3, '2021/2022', '2021-07-31 05:26:40', 0, 'Ganjil'),
(4, '2022/2023', '2022-07-17 03:40:16', 1, 'Ganjil');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tahun_buku`
--

CREATE TABLE `tahun_buku` (
  `id_tahun_buku` int(11) NOT NULL,
  `tahun_buku` text,
  `tanggal_mulai` text,
  `awalan_kwitansi` text,
  `is_active` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tanggungan_alumni`
--

CREATE TABLE `tanggungan_alumni` (
  `id_tanggungan_alumni` int(11) NOT NULL,
  `idalumni_fk` int(11) DEFAULT NULL,
  `keterangan` text,
  `jumlah` decimal(20,0) DEFAULT NULL,
  `idjenispenerimaan_fk` int(11) DEFAULT NULL,
  `trans_code` text,
  `kas` int(11) DEFAULT NULL,
  `pendapatan` int(11) DEFAULT NULL,
  `piutang` int(11) DEFAULT NULL,
  `diskon` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tanggungan_alumni`
--

INSERT INTO `tanggungan_alumni` (`id_tanggungan_alumni`, `idalumni_fk`, `keterangan`, `jumlah`, `idjenispenerimaan_fk`, `trans_code`, `kas`, `pendapatan`, `piutang`, `diskon`) VALUES
(3, 14, 'Kekurangan Uang Gedung', '50000', 1, '9488737048', 1, 19, 4, 35),
(4, 12, 'Tanggungan 1', '500000', 7, '3155613159', 1, 19, 4, 35),
(6, 14, 'Bayar ujian susulan', '150000', 1, '7190941690', 1, 19, 4, 35),
(13, 12, 'Tanggungan 2', '150000', NULL, '1691423722', 1, 21, 4, 33);

--
-- Trigger `tanggungan_alumni`
--
DELIMITER $$
CREATE TRIGGER `delete_jurnal_tanggungan_alumni` AFTER DELETE ON `tanggungan_alumni` FOR EACH ROW BEGIN
-- 	Debit
	delete from jurnal_umum where jurnal_umum.table = "tanggungan_alumni" and idtable_fk=old.id_tanggungan_alumni;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_jurnal_tanggungan_alumni` AFTER UPDATE ON `tanggungan_alumni` FOR EACH ROW BEGIN
-- 	Debit
	update jurnal_umum set debit = new.jumlah, idakun_fk = new.pendapatan where jurnal_umum.table = "tanggungan_alumni" and idtable_fk=old.id_tanggungan_alumni and kredit=0;
-- 	Kredit
	update jurnal_umum set kredit = new.jumlah, idakun_fk = new.piutang where jurnal_umum.table = "tanggungan_alumni" and idtable_fk=old.id_tanggungan_alumni and debit=0;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tanggungan_siswa`
--

CREATE TABLE `tanggungan_siswa` (
  `id_tanggungan_siswa` int(11) NOT NULL,
  `idsiswa_fk` int(11) DEFAULT NULL,
  `idjenispenerimaan_fk` int(11) DEFAULT NULL,
  `jumlah` double(255,0) DEFAULT NULL,
  `invoice` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data untuk tabel `tanggungan_siswa`
--

INSERT INTO `tanggungan_siswa` (`id_tanggungan_siswa`, `idsiswa_fk`, `idjenispenerimaan_fk`, `jumlah`, `invoice`) VALUES
(5, 595, 1, 2500000, '8086197'),
(6, 595, 2, 3000000, '2041622'),
(7, 595, 3, 250000, '8126800'),
(8, 595, 4, 200000, '691777'),
(9, 594, 1, 3000000, '4822677'),
(10, 594, 2, 5000000, '6983296'),
(11, 594, 3, 200000, '2141688'),
(12, 594, 4, 200000, '9163190'),
(13, 594, 5, 150000, '4215950'),
(14, 670, 1, 100000, '9201722'),
(15, 670, 2, 110000, '3922965'),
(16, 670, 3, 120000, '6520304'),
(17, 670, 4, 130000, '1412712'),
(18, 670, 5, 140000, '555949'),
(19, 671, 1, 100000, '3308568'),
(20, 671, 2, 110000, '3763810'),
(21, 671, 3, 120000, '6385423'),
(22, 671, 4, 130000, '8613372'),
(23, 671, 5, 140000, '4789721'),
(24, 672, 1, 100000, '7996833'),
(25, 672, 2, 110000, '3653897'),
(26, 672, 3, 120000, '3023358'),
(27, 672, 4, 130000, '5585699'),
(28, 672, 5, 140000, '2047940'),
(29, 673, 1, 100000, '1955578'),
(30, 673, 2, 110000, '7712370'),
(31, 673, 3, 120000, '9248825'),
(32, 673, 4, 130000, '2634831'),
(33, 673, 5, 140000, '2278308'),
(34, 674, 1, 100000, '3377440'),
(35, 674, 2, 110000, '5196230'),
(36, 674, 3, 120000, '7261596'),
(37, 674, 4, 130000, '7883059'),
(38, 674, 5, 140000, '4737071'),
(39, 675, 1, 100000, '6077230'),
(40, 675, 2, 110000, '5817166'),
(41, 675, 3, 120000, '3912563'),
(42, 675, 4, 130000, '8054522'),
(43, 675, 5, 140000, '7427516'),
(44, 676, 1, 100000, '7283395'),
(45, 676, 2, 110000, '2353407'),
(46, 676, 3, 120000, '6724227'),
(47, 676, 4, 130000, '6278426'),
(48, 676, 5, 140000, '4770120'),
(55, 592, 1, 2600000, '6832760'),
(56, 592, 2, 3000000, '2763399'),
(57, 592, 3, 250000, '927703'),
(58, 592, 4, 50000, '4171550'),
(59, 592, 5, 400000, '3615980'),
(60, 592, 6, 50000, '8538646'),
(61, 593, 1, 2000000, '5922398'),
(62, 593, 2, 2500000, '2349226'),
(63, 593, 3, 150000, '1947072'),
(64, 593, 4, 100000, '2314789'),
(65, 593, 5, 150000, '28449'),
(67, 595, 5, 510000, '1911081'),
(68, 595, 6, 150000, '9523182'),
(69, 647, 1, 200000, '3932449'),
(70, 647, 2, 2500000, '2245341'),
(71, 647, 3, 150000, '1240933'),
(72, 647, 4, 50000, '487752'),
(73, 647, 5, 100000, '1022279'),
(74, 647, 6, 15000, '5141823'),
(75, 648, 1, 200000, '5478277'),
(76, 648, 2, 2500000, '4071502'),
(77, 648, 3, 150000, '9229235'),
(78, 648, 4, 50000, '8748313'),
(79, 648, 5, 100000, '9395243'),
(80, 648, 6, 15000, '6623874'),
(81, 649, 1, 200000, '5787715'),
(82, 649, 2, 2500000, '68373'),
(83, 649, 3, 150000, '4751705'),
(84, 649, 4, 50000, '5125339'),
(85, 649, 5, 100000, '1721488'),
(86, 649, 6, 15000, '4614010'),
(87, 650, 1, 200000, '2805891'),
(88, 650, 2, 2500000, '5548341'),
(89, 650, 3, 150000, '5338441'),
(90, 650, 4, 50000, '3571465'),
(91, 650, 5, 100000, '346521'),
(92, 650, 6, 15000, '8462303'),
(93, 651, 1, 200000, '2338988'),
(94, 651, 2, 2500000, '7771812'),
(95, 651, 3, 150000, '2995605'),
(96, 651, 4, 50000, '1649021'),
(97, 651, 5, 100000, '2175739'),
(98, 651, 6, 15000, '5694639'),
(99, 652, 1, 200000, '7943481'),
(100, 652, 2, 2500000, '2152994'),
(101, 652, 3, 150000, '4675727'),
(102, 652, 4, 50000, '4507371'),
(103, 652, 5, 100000, '3332956'),
(104, 652, 6, 15000, '4303958'),
(105, 653, 1, 200000, '2809475'),
(106, 653, 2, 2500000, '6198329'),
(107, 653, 3, 150000, '1164360'),
(108, 653, 4, 50000, '3714417'),
(109, 653, 5, 100000, '2521822'),
(110, 653, 6, 15000, '8081386'),
(111, 654, 1, 200000, '2192891'),
(112, 654, 2, 2500000, '5977822'),
(113, 654, 3, 150000, '9620674'),
(114, 654, 4, 50000, '1856550'),
(115, 654, 5, 100000, '3914207'),
(116, 654, 6, 15000, '1772564'),
(117, 655, 1, 200000, '7888633'),
(118, 655, 2, 2500000, '3823825'),
(119, 655, 3, 150000, '2482788'),
(120, 655, 4, 50000, '2445297'),
(121, 655, 5, 100000, '3529103'),
(122, 655, 6, 15000, '6943258'),
(123, 656, 1, 200000, '1728431'),
(124, 656, 2, 2500000, '2924688'),
(125, 656, 3, 150000, '1057320'),
(126, 656, 4, 50000, '9514261'),
(127, 656, 5, 100000, '2258428'),
(128, 656, 6, 15000, '2466972'),
(129, 657, 1, 200000, '4291844'),
(130, 657, 2, 2500000, '3334958'),
(131, 657, 3, 150000, '2071261'),
(132, 657, 4, 50000, '4523121'),
(133, 657, 5, 100000, '1957796'),
(134, 657, 6, 15000, '8606943'),
(135, 658, 1, 200000, '2368995'),
(136, 658, 2, 2500000, '5496913'),
(137, 658, 3, 150000, '6382678'),
(138, 658, 4, 50000, '6193068'),
(139, 658, 5, 100000, '7552050'),
(140, 658, 6, 15000, '6180274'),
(141, 659, 1, 200000, '2834577'),
(142, 659, 2, 2500000, '540555'),
(143, 659, 3, 150000, '4472743'),
(144, 659, 4, 50000, '6455912'),
(145, 659, 5, 100000, '7960974'),
(146, 659, 6, 15000, '2734975'),
(147, 660, 1, 200000, '3702186'),
(148, 660, 2, 2500000, '8066792'),
(149, 660, 3, 150000, '5135804'),
(150, 660, 4, 50000, '874949'),
(151, 660, 5, 100000, '9739463'),
(152, 660, 6, 15000, '6665358'),
(153, 661, 1, 200000, '7001684'),
(154, 661, 2, 2500000, '7251887'),
(155, 661, 3, 150000, '9678349'),
(156, 661, 4, 50000, '4102762'),
(157, 661, 5, 100000, '1297533'),
(158, 661, 6, 15000, '2095219'),
(159, 662, 1, 200000, '2517035'),
(160, 662, 2, 2500000, '1260529'),
(161, 662, 3, 150000, '2840544'),
(162, 662, 4, 50000, '184344'),
(163, 662, 5, 100000, '6703629'),
(164, 662, 6, 15000, '9113137'),
(165, 663, 1, 200000, '8750179'),
(166, 663, 2, 2500000, '2398929'),
(167, 663, 3, 150000, '7736381'),
(168, 663, 4, 50000, '8340668'),
(169, 663, 5, 100000, '8045709'),
(170, 663, 6, 15000, '9993939'),
(171, 664, 1, 200000, '6495092'),
(172, 664, 2, 2500000, '5097462'),
(173, 664, 3, 150000, '5151728'),
(174, 664, 4, 50000, '1436735'),
(175, 664, 5, 100000, '7832973'),
(176, 664, 6, 15000, '1129319'),
(177, 665, 1, 200000, '6380744'),
(178, 665, 2, 2500000, '5646354'),
(179, 665, 3, 150000, '5475174'),
(180, 665, 4, 50000, '8239758'),
(181, 665, 5, 100000, '5636597'),
(182, 665, 6, 15000, '3135103'),
(183, 666, 1, 200000, '3515769'),
(184, 666, 2, 2500000, '1097983'),
(185, 666, 3, 150000, '6011648'),
(186, 666, 4, 50000, '7714742'),
(187, 666, 5, 100000, '5579342'),
(188, 666, 6, 15000, '1734614'),
(189, 667, 1, 200000, '9998796'),
(190, 667, 2, 2500000, '7088296'),
(191, 667, 3, 150000, '6358800'),
(192, 667, 4, 50000, '5104809'),
(193, 667, 5, 100000, '1065920'),
(194, 667, 6, 15000, '9437545'),
(195, 668, 1, 200000, '4321982'),
(196, 668, 2, 2500000, '8599202'),
(197, 668, 3, 150000, '8838929'),
(198, 668, 4, 50000, '9620757'),
(199, 668, 5, 100000, '2792997'),
(200, 668, 6, 15000, '5658450'),
(201, 669, 1, 200000, '5319584'),
(202, 669, 2, 2500000, '7375677'),
(203, 669, 3, 150000, '9119088'),
(204, 669, 4, 50000, '830682'),
(205, 669, 5, 100000, '7401915'),
(206, 669, 6, 15000, '8682906');

--
-- Trigger `tanggungan_siswa`
--
DELIMITER $$
CREATE TRIGGER `delete_jurnal` AFTER DELETE ON `tanggungan_siswa` FOR EACH ROW BEGIN
-- 	Debit
	delete from jurnal_umum where jurnal_umum.table = "tanggungan" and idtable_fk=old.id_tanggungan_siswa;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_jurnal` AFTER UPDATE ON `tanggungan_siswa` FOR EACH ROW BEGIN
-- 	Debit
	update jurnal_umum set debit = new.jumlah where jurnal_umum.table = "tanggungan" and idtable_fk=old.id_tanggungan_siswa and kredit=0;
-- 	Kredit
	update jurnal_umum set kredit = new.jumlah where jurnal_umum.table = "tanggungan" and idtable_fk=old.id_tanggungan_siswa and debit=0;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `task`
--

CREATE TABLE `task` (
  `id_task` int(11) NOT NULL,
  `task_code` text CHARACTER SET latin1,
  `task` text CHARACTER SET latin1,
  `idguru_fk` int(11) DEFAULT NULL,
  `idmapel_fk` int(11) DEFAULT NULL,
  `title` text CHARACTER SET latin1,
  `type` text CHARACTER SET latin1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Struktur dari tabel `task_answer`
--

CREATE TABLE `task_answer` (
  `id_task_answer` int(11) NOT NULL,
  `idsiswa_fk` int(11) DEFAULT NULL,
  `ans` text CHARACTER SET latin1,
  `idtask_fk` int(11) DEFAULT NULL,
  `type` text CHARACTER SET latin1,
  `nilai` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tindakan_catatan_siswa`
--

CREATE TABLE `tindakan_catatan_siswa` (
  `id_tindakan_catatan_siswa` int(11) NOT NULL,
  `idcatatansiswa_fk` int(11) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `tindakan` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tingkat`
--

CREATE TABLE `tingkat` (
  `id_tingkat` int(11) NOT NULL,
  `tingkat` text CHARACTER SET latin1,
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `iddepartment_fk` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

--
-- Dumping data untuk tabel `tingkat`
--

INSERT INTO `tingkat` (`id_tingkat`, `tingkat`, `create_at`, `iddepartment_fk`) VALUES
(1, 'X', '2020-06-07 02:54:48', 1),
(2, 'XI', '2020-06-07 02:54:48', 1),
(3, 'XII', '2020-06-07 02:55:06', 1),
(5, 'VII', '2022-11-04 13:45:32', 2),
(6, 'VIII', '2022-11-04 13:45:42', 2),
(7, 'IX', '2022-11-04 13:45:49', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi_saldo`
--

CREATE TABLE `transaksi_saldo` (
  `id_transaksi` int(11) NOT NULL,
  `jenis_transaksi` text,
  `idsiswa_fk` int(11) DEFAULT NULL,
  `jumlah` double DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `status` int(11) DEFAULT '0',
  `order_id` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

--
-- Dumping data untuk tabel `transaksi_saldo`
--

INSERT INTO `transaksi_saldo` (`id_transaksi`, `jenis_transaksi`, `idsiswa_fk`, `jumlah`, `tanggal`, `status`, `order_id`) VALUES
(21, 'SALDO SISWA', 296, 6000, '2021-12-09', 0, '490682'),
(22, 'SALDO SISWA', 296, 40000, '2021-12-09', 0, '430459'),
(23, 'SALDO SISWA', 296, 50000, '2021-12-09', 0, '579035'),
(24, 'SALDO SISWA', 296, NULL, '2021-12-09', 0, '160012'),
(25, 'SALDO SISWA', 296, NULL, '2021-12-09', 0, '212825'),
(26, 'SALDO SISWA', 296, 50000, '2021-12-11', 0, '645687');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi_tanggungan_alumni`
--

CREATE TABLE `transaksi_tanggungan_alumni` (
  `id_transaksi_tanggungan_alumni` int(11) NOT NULL,
  `idalumni_fk` int(11) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `invoice` text,
  `catatan` text,
  `jumlah` decimal(20,0) DEFAULT NULL,
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `transaksi_tanggungan_alumni`
--

INSERT INTO `transaksi_tanggungan_alumni` (`id_transaksi_tanggungan_alumni`, `idalumni_fk`, `tanggal`, `invoice`, `catatan`, `jumlah`, `create_at`) VALUES
(2, 14, '2022-08-23', 'P1741155', 'dasj', '165000', '2022-08-23 05:18:33');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi_tanggungan_siswa`
--

CREATE TABLE `transaksi_tanggungan_siswa` (
  `id_transaksi_tanggungan_siswa` int(11) NOT NULL,
  `idsiswa_fk` int(11) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `invoice` text,
  `catatan` text,
  `jumlah` decimal(20,0) DEFAULT NULL,
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `transaksi_tanggungan_siswa`
--

INSERT INTO `transaksi_tanggungan_siswa` (`id_transaksi_tanggungan_siswa`, `idsiswa_fk`, `tanggal`, `invoice`, `catatan`, `jumlah`, `create_at`) VALUES
(1, 647, '2022-08-22', 'P5231289', 'pembayaran tanggungan', '250000', '2022-08-22 11:13:47');

--
-- Trigger `transaksi_tanggungan_siswa`
--
DELIMITER $$
CREATE TRIGGER `delete_trig` AFTER DELETE ON `transaksi_tanggungan_siswa` FOR EACH ROW BEGIN
	delete from penerimaan where penerimaan.idsiswa_fk = old.idsiswa_fk and penerimaan.invoice=old.invoice;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `email` varchar(254) DEFAULT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int(11) UNSIGNED DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int(11) UNSIGNED NOT NULL,
  `last_login` int(11) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `foto` text,
  `anggota_id` int(11) DEFAULT NULL,
  `table` text,
  `is_walas` int(11) DEFAULT NULL,
  `is_absen` int(11) DEFAULT NULL,
  `c` int(255) DEFAULT '1',
  `r` int(255) DEFAULT '1',
  `u` int(255) DEFAULT '1',
  `d` int(255) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`, `foto`, `anggota_id`, `table`, `is_walas`, `is_absen`, `c`, `r`, `u`, `d`) VALUES
(1, '127.0.0.1', 'admin', '$2y$08$mxSDKMRKsKM3IwN6NPoB6.3pQqymDu4ZtGAMIzpw.ppcie3MJM9ty', '', 'hello@admin.com', '', NULL, NULL, NULL, 1268889823, 1667697032, 1, 'admin', 'Yani', 'ADMIN', '085894632505', '3c8f6f36f650d5ce07803470b4f4d4ff.jpg', NULL, NULL, NULL, NULL, 1, 1, 1, 1),
(3, '127.0.0.1', 'rendy', '$2y$08$OElO/1onJ/wrgc5vc7OfyuYmt6dyEUZVW4oEOzkDJtNoVUXs89.RO', '', 'hello@admin.com', '', NULL, NULL, NULL, 1268889823, 1662084800, 1, 'Rendy', 'Yani', 'ADMIN', '085894632505', '3c8f6f36f650d5ce07803470b4f4d4ff.jpg', 2, 'guru', 1, NULL, 1, 1, 1, 1),
(4, '::1', 'is_225661', '$2y$08$9/o/Xc/XlDYWWaWORf7R1OQcZj2.Ng/NB1LecegoOb7NAhGRZibyK', NULL, 'is_225661@gmail.com', NULL, NULL, NULL, NULL, 1658406770, 1658406781, 1, 'ALISSANDRI GARNASIS WIBERTH J, S.Pd', NULL, NULL, NULL, NULL, 1, 'guru', NULL, NULL, 1, 1, 1, 1),
(5, '::1', 'is_26892', '$2y$08$6WjIreK2G33N4GUeFSOOmeqseWWRa1WXa/ZYAIm56FBckjIJYR7fy', NULL, 'is_26892@gmail.com', NULL, NULL, NULL, NULL, 1658884212, 1660265790, 1, 'ALISSANDRI GARNASIS WIBERTH J, S.Pd', NULL, NULL, NULL, NULL, 1, 'guru', NULL, NULL, 1, 1, 1, 1),
(7, '::1', 'is_479370', '$2y$08$TdJcSMrE39sxdl4NQSezG.QfXgdHqdQlqMkKIoXVYxkdbkCeXhgiO', NULL, 'is_479370@gmail.com', NULL, NULL, NULL, NULL, 1665405123, 1665405139, 1, 'RUDI HARTONO, ST', NULL, NULL, NULL, NULL, 14, 'guru', NULL, NULL, 1, 1, 1, 1),
(8, '::1', 'is_156450', '$2y$08$vfAHUHPmjENouSlg3d7IYOyh4EeWjZas5vVBkHBs8IuzaZMondQ8C', NULL, 'is_156450@gmail.com', NULL, NULL, NULL, NULL, 1666444807, 1666509238, 1, 'ALISSANDRI GARNASIS WIBERTH J, S.Pd', NULL, NULL, NULL, NULL, 1, 'guru', NULL, NULL, 0, 1, 0, 1),
(9, '::1', 'rudi', '$2y$08$v2XRLCkQdgUDuE8/ERcVy.Pc8cv4WaHdLrSey/KdmNNgROxUJlOTC', NULL, 'rudi@gmail.com', NULL, NULL, NULL, NULL, 1666513253, 1666526191, 1, 'RUDI HARTONO, ST', NULL, NULL, NULL, NULL, 14, 'guru', NULL, NULL, 1, 1, 1, 0),
(10, '::1', 'humas', '$2y$08$mhXgHc/hifdF5ykXHlowSeUMVJOpAoDO4gLpya5yVyP7FQRiMi/Sq', NULL, 'humas@gmail.com', NULL, NULL, NULL, NULL, 1666611084, 1667215220, 1, 'Rendy Yani Susanto, S.Pd', NULL, NULL, NULL, NULL, 27, 'guru', NULL, NULL, 1, 1, 1, 1),
(11, '::1', 'kesiswaan', '$2y$08$5xngOkF/29/WYA6KwNLkpOpQUq7NPvlWBWVku3l0GeFhGnFg3bFWm', NULL, 'kesiswaan@gmail.com', NULL, NULL, NULL, NULL, 1667176194, 1667215339, 1, 'Rendy Yani Susanto, S.Pd', NULL, NULL, NULL, NULL, 27, 'guru', NULL, NULL, 1, 1, 1, 1),
(12, '::1', 'tu', '$2y$08$flkpO9QNnZ1vIirXkjAUA.8YKmBgZcGL5og8Ktm7gODP7889bYCu.', NULL, 'tu@gmail.com', NULL, NULL, NULL, NULL, 1667214007, 1667214023, 1, 'Rendy Yani Susanto, S.Pd', NULL, NULL, NULL, NULL, 27, 'guru', NULL, NULL, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `users_groups`
--

CREATE TABLE `users_groups` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `group_id` mediumint(8) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data untuk tabel `users_groups`
--

INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES
(1, 1, 1),
(3, 3, 3),
(4, 4, 4),
(5, 5, 3),
(7, 7, 12),
(8, 8, 7),
(9, 9, 7),
(10, 10, 13),
(11, 11, 8),
(12, 12, 7);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_modul`
--

CREATE TABLE `user_modul` (
  `id_user_modul` int(11) NOT NULL,
  `iduser_fk` int(11) DEFAULT NULL,
  `idmodul_fk` int(11) DEFAULT NULL,
  `c` int(255) DEFAULT '0',
  `r` int(255) DEFAULT '0',
  `u` int(255) DEFAULT '0',
  `d` int(255) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user_modul`
--

INSERT INTO `user_modul` (`id_user_modul`, `iduser_fk`, `idmodul_fk`, `c`, `r`, `u`, `d`) VALUES
(2, 8, 3, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `v_bank_soal_quiz`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `v_bank_soal_quiz` (
`id_bank_soal` int(11)
,`soal` text
,`time_soal` int(11)
,`code_soal` text
,`idmatapelajaran_fk` int(11)
,`idguru_fk` int(11)
,`id_question_cas` int(11)
,`type` text
,`idbanksoal_fk` int(11)
,`idquiz_fk` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `v_buku_pemanggilan_siswa`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `v_buku_pemanggilan_siswa` (
`id_buku_pemanggilan_siswa` int(11)
,`idsiswa_fk` int(11)
,`masalah` text
,`pemecahan` text
,`tindak_lanjut` text
,`keterangan` text
,`tanggal` date
,`kode_pemanggilan` text
,`id_siswa` int(11)
,`nis` text
,`nama` text
,`idkelas_fk` int(11)
,`idjurusan_fk` int(11)
,`agama` text
,`nisn` text
,`no_ijazah_sekolah_asal` text
,`no_skhun_sekolah_asal` text
,`no_un_sekolah_asal` text
,`no_kk` text
,`npsn_sekolah_asal` text
,`nama_sekolah_asal` text
,`tempat_lahir` text
,`tanggal_lahir` date
,`berkebutuhan_khusus` text
,`alamat` text
,`dusun` text
,`rt` text
,`rw` text
,`kelurahan` text
,`foto` text
,`idprovince_fk` int(11)
,`idcities_fk` int(11)
,`nama_ayah` text
,`tempat_lahir_ayah` text
,`tanggal_lahir_ayah` date
,`pendidikan_ayah` text
,`pekerjaan_ayah` text
,`penghasilan_ayah` text
,`nama_ibu` text
,`tempat_lahir_ibu` text
,`tanggal_lahir_ibu` date
,`pendidikan_ibu` text
,`pekerjaan_ibu` text
,`penghasilan_ibu` text
,`tinggi_badan` int(11)
,`berat_badan` int(11)
,`jarak_ke_sekolah` int(255)
,`waktu_ke_sekolah` int(255)
,`jumlah_saudara` int(255)
,`jenis_kelamin` text
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `v_catatan_siswa`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `v_catatan_siswa` (
`id_catatan_siswa` int(11)
,`idsiswa_fk` int(11)
,`idkelas_fk` int(11)
,`idguru_fk` int(11)
,`tanggal` date
,`uraian` text
,`teruskan_ke` text
,`idtahunajaran_fk` int(11)
,`idmapel_fk` int(11)
,`id_siswa` int(11)
,`nis` text
,`nama` text
,`idjurusan_fk` int(11)
,`agama` text
,`nisn` text
,`no_ijazah_sekolah_asal` text
,`no_skhun_sekolah_asal` text
,`no_un_sekolah_asal` text
,`no_kk` text
,`npsn_sekolah_asal` text
,`nama_sekolah_asal` text
,`tempat_lahir` text
,`tanggal_lahir` date
,`berkebutuhan_khusus` text
,`alamat` text
,`dusun` text
,`rt` text
,`rw` text
,`kelurahan` text
,`foto` text
,`idprovince_fk` int(11)
,`idcities_fk` int(11)
,`nama_ayah` text
,`tempat_lahir_ayah` text
,`tanggal_lahir_ayah` date
,`pendidikan_ayah` text
,`pekerjaan_ayah` text
,`penghasilan_ayah` text
,`nama_ibu` text
,`tempat_lahir_ibu` text
,`tanggal_lahir_ibu` date
,`pendidikan_ibu` text
,`pekerjaan_ibu` text
,`penghasilan_ibu` text
,`tinggi_badan` int(11)
,`berat_badan` int(11)
,`jarak_ke_sekolah` int(255)
,`waktu_ke_sekolah` int(255)
,`jumlah_saudara` int(255)
,`jenis_kelamin` text
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `v_catatan_siswa_harian`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `v_catatan_siswa_harian` (
`id_catatan_siswa` int(11)
,`idsiswa_fk` int(11)
,`idkelas_fk` int(11)
,`idguru_fk` int(11)
,`tanggal` date
,`uraian` text
,`teruskan_ke` text
,`idtahunajaran_fk` int(11)
,`idmapel_fk` int(11)
,`is_tindakan` int(11)
,`id_siswa` int(11)
,`nis` text
,`nama` text
,`agama` text
,`nisn` text
,`no_ijazah_sekolah_asal` text
,`no_skhun_sekolah_asal` text
,`no_un_sekolah_asal` text
,`no_kk` text
,`npsn_sekolah_asal` text
,`nama_sekolah_asal` text
,`tempat_lahir` text
,`tanggal_lahir` date
,`berkebutuhan_khusus` text
,`alamat` text
,`dusun` text
,`rt` text
,`rw` text
,`kelurahan` text
,`foto` text
,`idprovince_fk` int(11)
,`idcities_fk` int(11)
,`nama_ayah` text
,`tempat_lahir_ayah` text
,`tanggal_lahir_ayah` date
,`pendidikan_ayah` text
,`pekerjaan_ayah` text
,`penghasilan_ayah` text
,`nama_ibu` text
,`tempat_lahir_ibu` text
,`tanggal_lahir_ibu` date
,`pendidikan_ibu` text
,`pekerjaan_ibu` text
,`penghasilan_ibu` text
,`tinggi_badan` int(11)
,`berat_badan` int(11)
,`jarak_ke_sekolah` int(255)
,`waktu_ke_sekolah` int(255)
,`jumlah_saudara` int(255)
,`jenis_kelamin` text
,`id_kelas` int(11)
,`kelas` text
,`idtingkat_fk` int(11)
,`create_at` timestamp
,`idjurusan_fk` int(11)
,`id_guru` int(11)
,`nama_guru` text
,`nip` text
,`alamat_guru` text
,`idjenismatapelajaran_fk` int(11)
,`id_mata_pelajaran` int(11)
,`mata_pelajaran` text
,`kode` text
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `v_catatan_siswa_new`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `v_catatan_siswa_new` (
`id_catatan_siswa` int(11)
,`idsiswa_fk` int(11)
,`idkelas_fk` int(11)
,`idguru_fk` int(11)
,`tanggal` date
,`uraian` text
,`teruskan_ke` text
,`idtahunajaran_fk` int(11)
,`idmapel_fk` int(11)
,`id_siswa` int(11)
,`nis` text
,`nama` text
,`idjurusan_fk` int(11)
,`agama` text
,`nisn` text
,`nama_kelas` text
,`nama_guru` text
,`mapel` text
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `v_guru_mapel`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `v_guru_mapel` (
`id_guru` int(11)
,`nama` text
,`nip` text
,`alamat` text
,`agama` text
,`foto` text
,`pendidikan_terakhir` text
,`instansi` text
,`fb` text
,`ig` text
,`twitter` text
,`youtube` text
,`jabatan` text
,`email` text
,`no_hp` text
,`id_guru_mapel` int(11)
,`idguru_fk` int(11)
,`idmapel_fk` int(11)
,`idkelas_fk` int(11)
,`id_mata_pelajaran` int(11)
,`mata_pelajaran` text
,`kode` text
,`id_kelas` int(11)
,`kelas` text
,`idtingkat_fk` int(11)
,`create_at` timestamp
,`idjurusan_fk` int(11)
,`idtahunajaran_fk` int(11)
,`id_tahun_ajaran` int(11)
,`tahun_ajaran` text
,`is_active` int(11)
,`semester` text
,`idjenismatapelajaran_fk` int(11)
,`kode_pegawai` text
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `v_jadwal_pelajaran`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `v_jadwal_pelajaran` (
`id_jadwal_pelajaran` int(11)
,`idgurumapel_fk` int(11)
,`idhari_fk` int(11)
,`idjampelajaran_fk` int(11)
,`id_guru_mapel` int(11)
,`idguru_fk` int(11)
,`idmapel_fk` int(11)
,`idkelas_fk` int(11)
,`nama_guru` text
,`nip` text
,`kode_pegawai` text
,`kode_pelajaran` text
,`mata_pelajaran` text
,`id_hari` int(11)
,`hari` text
,`code` int(255)
,`id_jam_pelajaran` int(11)
,`nama` text
,`jam_mulai` text
,`jam_selesai` text
,`id_kelas` int(11)
,`kelas` text
,`idtingkat_fk` int(11)
,`create_at` timestamp
,`idjurusan_fk` int(11)
,`idtahunajaran_fk` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `v_jenis_penerimaan`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `v_jenis_penerimaan` (
`id_jenis_penerimaan` int(11)
,`nama` text
,`kas` text
,`pendapatan` text
,`piutang` text
,`diskon` text
,`is_edit` int(255)
,`bulanan` int(11)
,`template_nota` text
,`norefkas` text
,`norefpendapatan` text
,`norefpiutang` text
,`norefdiskon` text
,`snkas` text
,`snpendapatan` text
,`snpiutang` text
,`sndiskon` text
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `v_learning`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `v_learning` (
`id_learning` int(11)
,`idmatapelajaran_fk` int(11)
,`idkd_fk` int(11)
,`materi` text
,`open_access` int(255)
,`password` text
,`iduser_fk` int(11) unsigned
,`judul` text
,`create_at` timestamp
,`idtingkat_fk` int(11)
,`id_mata_pelajaran` int(11)
,`mata_pelajaran` text
,`kode` text
,`idjenismatapelajaran_fk` int(11)
,`jKode` varchar(255)
,`cover` text
,`task_code` text
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `v_materi`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `v_materi` (
`materi` text
,`id_materi` int(11)
,`file_materi` text
,`file_rpp` text
,`idkelas_fk` int(11)
,`idguru_fk` int(11)
,`idtahunajaran_fk` int(11)
,`idmatapelajaran_fk` int(11)
,`trans_code` text
,`nama_guru` text
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `v_nilai_keterampilan`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `v_nilai_keterampilan` (
`id_input_nilai_keterampilan` int(11)
,`idmatapelajaran_fk` int(11)
,`idtahunajaran_fk` int(11)
,`trans_code` text
,`idguru_fk` int(11)
,`idkelas_fk` int(11)
,`idjenisketerampilan_fk` int(11)
,`id_nilai_keterampilan` int(11)
,`idsiswa_fk` int(11)
,`nilai` int(255)
,`idinputnilaiketerampilan_fk` int(11)
,`create_at` timestamp
,`idkd_fk` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `v_nilai_pas`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `v_nilai_pas` (
`id_input_nilai_pas` int(11)
,`idmatapelajaran_fk` int(11)
,`idtahunajaran_fk` int(11)
,`trans_code` text
,`idguru_fk` int(11)
,`idkelas_fk` int(11)
,`id_nilai_pas` int(11)
,`idsiswa_fk` int(11)
,`nilai` int(255)
,`idinputnilaipas_fk` int(11)
,`create_at` timestamp
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `v_nilai_pengetahuan`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `v_nilai_pengetahuan` (
`id_nilai_pengetahuan` int(11)
,`idsiswa_fk` int(11)
,`nilai` int(255)
,`idinputnilaipengetahuan_fk` int(11)
,`create_at` timestamp
,`idkd_fk` int(11)
,`id_input_nilai_pengetahuan` int(11)
,`idmatapelajaran_fk` int(11)
,`idtahunajaran_fk` int(11)
,`trans_code` text
,`idguru_fk` int(11)
,`idkelas_fk` int(11)
,`idjenispengetahuan_fk` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `v_nilai_pts`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `v_nilai_pts` (
`id_input_nilai_pts` int(11)
,`idmatapelajaran_fk` int(11)
,`idtahunajaran_fk` int(11)
,`trans_code` text
,`idguru_fk` int(11)
,`idkelas_fk` int(11)
,`id_nilai_pts` int(11)
,`idsiswa_fk` int(11)
,`nilai` int(255)
,`idinputnilaipts_fk` int(11)
,`create_at` timestamp
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `v_oas_soal`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `v_oas_soal` (
`id_oas_soal` int(11)
,`idbanksoal_fk` int(11)
,`idoas_fk` int(11)
,`id_bank_soal` int(11)
,`soal` text
,`time_soal` int(11)
,`code_soal` text
,`idmatapelajaran_fk` int(11)
,`idguru_fk` int(11)
,`id_oas` int(11)
,`tanggal_mulai` date
,`tanggal_selesai` date
,`keterangan` text
,`is_active` int(11)
,`kode` text
,`idmapel_fk` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `v_pelanggaran_siswa`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `v_pelanggaran_siswa` (
`id_pelanggaran_siswa` int(11)
,`tanggal` date
,`uraian_pelanggaran` text
,`idpoinpelanggaran_fk` int(11)
,`idsiswa_fk` int(11)
,`id_poin_pelanggaran` int(11)
,`idjenispelanggaran_fk` int(11)
,`nama_pelanggaran` text
,`poin` int(20)
,`kode_pelanggaran` text
,`id_jenis_pelanggaran` int(11)
,`jenis_pelanggaran` text
,`nama_siswa` text
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `v_penerimaan`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `v_penerimaan` (
`id_penerimaan` int(11)
,`idsiswa_fk` int(11)
,`idjenispenerimaan_fk` int(11)
,`metode_pembayaran` text
,`tanggal` text
,`catatan` text
,`jumlah` double
,`create_at` timestamp
,`invoice` text
,`diskon_penerimaan` double
,`id_jenis_penerimaan` int(11)
,`nama` text
,`kas` text
,`pendapatan` text
,`piutang` text
,`is_edit` int(255)
,`bulanan` int(11)
,`template_nota` text
,`diskon` text
,`id_siswa` int(11)
,`nis` text
,`nama_siswa` text
,`idkelas_fk` int(11)
,`idjurusan_fk` int(11)
,`agama` text
,`nisn` text
,`no_ijazah_sekolah_asal` text
,`no_skhun_sekolah_asal` text
,`no_un_sekolah_asal` text
,`no_kk` text
,`npsn_sekolah_asal` text
,`nama_sekolah_asal` text
,`tempat_lahir` text
,`tanggal_lahir` date
,`berkebutuhan_khusus` text
,`alamat` text
,`dusun` text
,`rt` text
,`rw` text
,`kelurahan` text
,`foto` text
,`idprovince_fk` int(11)
,`idcities_fk` int(11)
,`nama_ayah` text
,`tempat_lahir_ayah` text
,`tanggal_lahir_ayah` date
,`pendidikan_ayah` text
,`pekerjaan_ayah` text
,`penghasilan_ayah` text
,`nama_ibu` text
,`tempat_lahir_ibu` text
,`tanggal_lahir_ibu` date
,`pendidikan_ibu` text
,`pekerjaan_ibu` text
,`penghasilan_ibu` text
,`tinggi_badan` int(11)
,`berat_badan` int(11)
,`jarak_ke_sekolah` int(255)
,`waktu_ke_sekolah` int(255)
,`jumlah_saudara` int(255)
,`jenis_kelamin` text
,`saldo` double
,`kelas` text
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `v_pkg`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `v_pkg` (
`idpenilaiankinerjaguru_fk` int(11)
,`id_penilaian_kinerja_guru` int(11)
,`idguru_fk` int(11)
,`bulan` int(11)
,`tahun` int(255)
,`idtahunajaran_fk` int(11)
,`create_at` timestamp
,`trans_code` text
,`id_component_penilaian_kinerja_guru` int(11)
,`idsubkompetensipkg_fk` int(11)
,`nilai` int(255)
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `v_poin_pelanggaran`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `v_poin_pelanggaran` (
`id_poin_pelanggaran` int(11)
,`idjenispelanggaran_fk` int(11)
,`nama_pelanggaran` text
,`poin` int(20)
,`id_jenis_pelanggaran` int(11)
,`jenis_pelanggaran` text
,`kategori_pelanggaran` text
,`kode_pelanggaran` text
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `v_poin_pelanggaran_siswa`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `v_poin_pelanggaran_siswa` (
`id_siswa` int(11)
,`nisn` text
,`nis` text
,`nama` text
,`poin` decimal(41,0)
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `v_presensi_event`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `v_presensi_event` (
`id_event` int(11)
,`event` text
,`tanggal` date
,`notulensi` text
,`id_presensi_event` int(11)
,`idevent_fk` int(11)
,`idguru_fk` int(11)
,`is_hadir` int(11)
,`nama_guru` text
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `v_presensi_harian_set`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `v_presensi_harian_set` (
`id_presensi_harian` int(11)
,`idmatapelajaran_fk` int(11)
,`idsiswa_fk` int(11)
,`presensi` text
,`keterangan` text
,`tanggal` date
,`create_at` timestamp
,`idtahunajaran_fk` int(11)
,`idkelas_fk` int(11)
,`id_jurusan` bigint(11)
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `v_prestasi_siswa`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `v_prestasi_siswa` (
`id_prestasi_siswa` int(11)
,`idsiswa_fk` int(11)
,`prestasi` text
,`lomba` text
,`tahun` int(255)
,`jenis_perlombaan` text
,`nama_siswa` text
,`nis_siswa` text
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `v_siswa_jurusan`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `v_siswa_jurusan` (
`id_siswa` int(11)
,`nis` text
,`nama` text
,`idkelas_fk` int(11)
,`idjurusan_fk` int(11)
,`agama` text
,`nisn` text
,`no_ijazah_sekolah_asal` text
,`no_skhun_sekolah_asal` text
,`no_un_sekolah_asal` text
,`no_kk` text
,`npsn_sekolah_asal` text
,`nama_sekolah_asal` text
,`tempat_lahir` text
,`tanggal_lahir` date
,`berkebutuhan_khusus` text
,`alamat` text
,`dusun` text
,`rt` text
,`rw` text
,`kelurahan` text
,`foto` text
,`idprovince_fk` int(11)
,`idcities_fk` int(11)
,`nama_ayah` text
,`tempat_lahir_ayah` text
,`tanggal_lahir_ayah` date
,`pendidikan_ayah` text
,`pekerjaan_ayah` text
,`penghasilan_ayah` text
,`nama_ibu` text
,`tempat_lahir_ibu` text
,`tanggal_lahir_ibu` date
,`pendidikan_ibu` text
,`pekerjaan_ibu` text
,`penghasilan_ibu` text
,`tinggi_badan` int(11)
,`berat_badan` int(11)
,`jarak_ke_sekolah` int(255)
,`waktu_ke_sekolah` int(255)
,`jumlah_saudara` int(255)
,`jenis_kelamin` text
,`id_kelas` int(11)
,`kelas` text
,`idtingkat_fk` int(11)
,`create_at` timestamp
,`idtahunajaran_fk` int(11)
,`id_jurusan` int(11)
,`jurusan` text
,`singkatan` text
,`nama_tingkat` text
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `v_tanggungan_siswa`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `v_tanggungan_siswa` (
`id_tanggungan_siswa` int(11)
,`idsiswa_fk` int(11)
,`idjenispenerimaan_fk` int(11)
,`jumlah` double(255,0)
,`id_jenis_penerimaan` int(11)
,`nama` text
,`kas` text
,`pendapatan` text
,`piutang` text
,`diskon` text
,`is_edit` int(255)
,`bulanan` int(11)
,`template_nota` text
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `v_task`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `v_task` (
`id_task_answer` int(11)
,`idsiswa_fk` int(11)
,`ans` text
,`idtask_fk` int(11)
,`type` text
,`id_task` int(11)
,`task_code` text
,`task` text
,`idguru_fk` int(11)
,`idmapel_fk` int(11)
,`title` text
,`id_siswa` int(11)
,`nis` text
,`nama` text
,`idkelas_fk` int(11)
,`idjurusan_fk` int(11)
,`agama` text
,`nisn` text
,`no_ijazah_sekolah_asal` text
,`no_skhun_sekolah_asal` text
,`no_un_sekolah_asal` text
,`no_kk` text
,`npsn_sekolah_asal` text
,`nama_sekolah_asal` text
,`tempat_lahir` text
,`tanggal_lahir` date
,`berkebutuhan_khusus` text
,`alamat` text
,`dusun` text
,`rt` text
,`rw` text
,`kelurahan` text
,`foto` text
,`idprovince_fk` int(11)
,`idcities_fk` int(11)
,`nama_ayah` text
,`tempat_lahir_ayah` text
,`tanggal_lahir_ayah` date
,`pendidikan_ayah` text
,`pekerjaan_ayah` text
,`penghasilan_ayah` text
,`nama_ibu` text
,`tempat_lahir_ibu` text
,`tanggal_lahir_ibu` date
,`pendidikan_ibu` text
,`pekerjaan_ibu` text
,`penghasilan_ibu` text
,`tinggi_badan` int(11)
,`berat_badan` int(11)
,`jarak_ke_sekolah` int(255)
,`waktu_ke_sekolah` int(255)
,`jumlah_saudara` int(255)
,`jenis_kelamin` text
,`nilai` int(255)
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `v_walas`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `v_walas` (
`id_wali_kelas` int(11)
,`idguru_fk` int(11)
,`idtahunajaran_fk` int(11)
,`idkelas_fk` int(11)
,`id_kelas` int(11)
,`kelas` text
,`idtingkat_fk` int(11)
,`idjurusan_fk` int(11)
,`id_tingkat` int(11)
,`tingkat` text
,`id_jurusan` int(11)
,`jurusan` text
,`singkatan` text
);

-- --------------------------------------------------------

--
-- Struktur dari tabel `wali_kelas`
--

CREATE TABLE `wali_kelas` (
  `id_wali_kelas` int(11) NOT NULL,
  `idguru_fk` int(11) DEFAULT NULL,
  `idtahunajaran_fk` int(11) DEFAULT NULL,
  `idkelas_fk` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

--
-- Dumping data untuk tabel `wali_kelas`
--

INSERT INTO `wali_kelas` (`id_wali_kelas`, `idguru_fk`, `idtahunajaran_fk`, `idkelas_fk`) VALUES
(1, 1, 4, 39);

-- --------------------------------------------------------

--
-- Struktur untuk view `v_bank_soal_quiz`
--
DROP TABLE IF EXISTS `v_bank_soal_quiz`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_bank_soal_quiz`  AS  select `bank_soal`.`id_bank_soal` AS `id_bank_soal`,`bank_soal`.`soal` AS `soal`,`bank_soal`.`time_soal` AS `time_soal`,`bank_soal`.`code_soal` AS `code_soal`,`bank_soal`.`idmatapelajaran_fk` AS `idmatapelajaran_fk`,`bank_soal`.`idguru_fk` AS `idguru_fk`,`question_cas`.`id_question_cas` AS `id_question_cas`,`question_cas`.`type` AS `type`,`question_cas`.`idbanksoal_fk` AS `idbanksoal_fk`,`question_cas`.`idquiz_fk` AS `idquiz_fk` from (`bank_soal` join `question_cas` on((`question_cas`.`idbanksoal_fk` = `bank_soal`.`id_bank_soal`))) ;

-- --------------------------------------------------------

--
-- Struktur untuk view `v_buku_pemanggilan_siswa`
--
DROP TABLE IF EXISTS `v_buku_pemanggilan_siswa`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_buku_pemanggilan_siswa`  AS  select `buku_pemanggilan_siswa`.`id_buku_pemanggilan_siswa` AS `id_buku_pemanggilan_siswa`,`buku_pemanggilan_siswa`.`idsiswa_fk` AS `idsiswa_fk`,`buku_pemanggilan_siswa`.`masalah` AS `masalah`,`buku_pemanggilan_siswa`.`pemecahan` AS `pemecahan`,`buku_pemanggilan_siswa`.`tindak_lanjut` AS `tindak_lanjut`,`buku_pemanggilan_siswa`.`keterangan` AS `keterangan`,`buku_pemanggilan_siswa`.`tanggal` AS `tanggal`,`buku_pemanggilan_siswa`.`kode_pemanggilan` AS `kode_pemanggilan`,`siswa`.`id_siswa` AS `id_siswa`,`siswa`.`nis` AS `nis`,`siswa`.`nama` AS `nama`,`siswa`.`idkelas_fk` AS `idkelas_fk`,`siswa`.`idjurusan_fk` AS `idjurusan_fk`,`siswa`.`agama` AS `agama`,`siswa`.`nisn` AS `nisn`,`siswa`.`no_ijazah_sekolah_asal` AS `no_ijazah_sekolah_asal`,`siswa`.`no_skhun_sekolah_asal` AS `no_skhun_sekolah_asal`,`siswa`.`no_un_sekolah_asal` AS `no_un_sekolah_asal`,`siswa`.`no_kk` AS `no_kk`,`siswa`.`npsn_sekolah_asal` AS `npsn_sekolah_asal`,`siswa`.`nama_sekolah_asal` AS `nama_sekolah_asal`,`siswa`.`tempat_lahir` AS `tempat_lahir`,`siswa`.`tanggal_lahir` AS `tanggal_lahir`,`siswa`.`berkebutuhan_khusus` AS `berkebutuhan_khusus`,`siswa`.`alamat` AS `alamat`,`siswa`.`dusun` AS `dusun`,`siswa`.`rt` AS `rt`,`siswa`.`rw` AS `rw`,`siswa`.`kelurahan` AS `kelurahan`,`siswa`.`foto` AS `foto`,`siswa`.`idprovince_fk` AS `idprovince_fk`,`siswa`.`idcities_fk` AS `idcities_fk`,`siswa`.`nama_ayah` AS `nama_ayah`,`siswa`.`tempat_lahir_ayah` AS `tempat_lahir_ayah`,`siswa`.`tanggal_lahir_ayah` AS `tanggal_lahir_ayah`,`siswa`.`pendidikan_ayah` AS `pendidikan_ayah`,`siswa`.`pekerjaan_ayah` AS `pekerjaan_ayah`,`siswa`.`penghasilan_ayah` AS `penghasilan_ayah`,`siswa`.`nama_ibu` AS `nama_ibu`,`siswa`.`tempat_lahir_ibu` AS `tempat_lahir_ibu`,`siswa`.`tanggal_lahir_ibu` AS `tanggal_lahir_ibu`,`siswa`.`pendidikan_ibu` AS `pendidikan_ibu`,`siswa`.`pekerjaan_ibu` AS `pekerjaan_ibu`,`siswa`.`penghasilan_ibu` AS `penghasilan_ibu`,`siswa`.`tinggi_badan` AS `tinggi_badan`,`siswa`.`berat_badan` AS `berat_badan`,`siswa`.`jarak_ke_sekolah` AS `jarak_ke_sekolah`,`siswa`.`waktu_ke_sekolah` AS `waktu_ke_sekolah`,`siswa`.`jumlah_saudara` AS `jumlah_saudara`,`siswa`.`jenis_kelamin` AS `jenis_kelamin` from (`buku_pemanggilan_siswa` join `siswa` on((`siswa`.`id_siswa` = `buku_pemanggilan_siswa`.`idsiswa_fk`))) ;

-- --------------------------------------------------------

--
-- Struktur untuk view `v_catatan_siswa`
--
DROP TABLE IF EXISTS `v_catatan_siswa`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_catatan_siswa`  AS  select `catatan_siswa`.`id_catatan_siswa` AS `id_catatan_siswa`,`catatan_siswa`.`idsiswa_fk` AS `idsiswa_fk`,`catatan_siswa`.`idkelas_fk` AS `idkelas_fk`,`catatan_siswa`.`idguru_fk` AS `idguru_fk`,`catatan_siswa`.`tanggal` AS `tanggal`,`catatan_siswa`.`uraian` AS `uraian`,`catatan_siswa`.`teruskan_ke` AS `teruskan_ke`,`catatan_siswa`.`idtahunajaran_fk` AS `idtahunajaran_fk`,`catatan_siswa`.`idmapel_fk` AS `idmapel_fk`,`siswa`.`id_siswa` AS `id_siswa`,`siswa`.`nis` AS `nis`,`siswa`.`nama` AS `nama`,`siswa`.`idjurusan_fk` AS `idjurusan_fk`,`siswa`.`agama` AS `agama`,`siswa`.`nisn` AS `nisn`,`siswa`.`no_ijazah_sekolah_asal` AS `no_ijazah_sekolah_asal`,`siswa`.`no_skhun_sekolah_asal` AS `no_skhun_sekolah_asal`,`siswa`.`no_un_sekolah_asal` AS `no_un_sekolah_asal`,`siswa`.`no_kk` AS `no_kk`,`siswa`.`npsn_sekolah_asal` AS `npsn_sekolah_asal`,`siswa`.`nama_sekolah_asal` AS `nama_sekolah_asal`,`siswa`.`tempat_lahir` AS `tempat_lahir`,`siswa`.`tanggal_lahir` AS `tanggal_lahir`,`siswa`.`berkebutuhan_khusus` AS `berkebutuhan_khusus`,`siswa`.`alamat` AS `alamat`,`siswa`.`dusun` AS `dusun`,`siswa`.`rt` AS `rt`,`siswa`.`rw` AS `rw`,`siswa`.`kelurahan` AS `kelurahan`,`siswa`.`foto` AS `foto`,`siswa`.`idprovince_fk` AS `idprovince_fk`,`siswa`.`idcities_fk` AS `idcities_fk`,`siswa`.`nama_ayah` AS `nama_ayah`,`siswa`.`tempat_lahir_ayah` AS `tempat_lahir_ayah`,`siswa`.`tanggal_lahir_ayah` AS `tanggal_lahir_ayah`,`siswa`.`pendidikan_ayah` AS `pendidikan_ayah`,`siswa`.`pekerjaan_ayah` AS `pekerjaan_ayah`,`siswa`.`penghasilan_ayah` AS `penghasilan_ayah`,`siswa`.`nama_ibu` AS `nama_ibu`,`siswa`.`tempat_lahir_ibu` AS `tempat_lahir_ibu`,`siswa`.`tanggal_lahir_ibu` AS `tanggal_lahir_ibu`,`siswa`.`pendidikan_ibu` AS `pendidikan_ibu`,`siswa`.`pekerjaan_ibu` AS `pekerjaan_ibu`,`siswa`.`penghasilan_ibu` AS `penghasilan_ibu`,`siswa`.`tinggi_badan` AS `tinggi_badan`,`siswa`.`berat_badan` AS `berat_badan`,`siswa`.`jarak_ke_sekolah` AS `jarak_ke_sekolah`,`siswa`.`waktu_ke_sekolah` AS `waktu_ke_sekolah`,`siswa`.`jumlah_saudara` AS `jumlah_saudara`,`siswa`.`jenis_kelamin` AS `jenis_kelamin` from (`catatan_siswa` join `siswa` on((`catatan_siswa`.`idsiswa_fk` = `siswa`.`id_siswa`))) ;

-- --------------------------------------------------------

--
-- Struktur untuk view `v_catatan_siswa_harian`
--
DROP TABLE IF EXISTS `v_catatan_siswa_harian`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_catatan_siswa_harian`  AS  select `catatan_siswa`.`id_catatan_siswa` AS `id_catatan_siswa`,`catatan_siswa`.`idsiswa_fk` AS `idsiswa_fk`,`catatan_siswa`.`idkelas_fk` AS `idkelas_fk`,`catatan_siswa`.`idguru_fk` AS `idguru_fk`,`catatan_siswa`.`tanggal` AS `tanggal`,`catatan_siswa`.`uraian` AS `uraian`,`catatan_siswa`.`teruskan_ke` AS `teruskan_ke`,`catatan_siswa`.`idtahunajaran_fk` AS `idtahunajaran_fk`,`catatan_siswa`.`idmapel_fk` AS `idmapel_fk`,`catatan_siswa`.`is_tindakan` AS `is_tindakan`,`siswa`.`id_siswa` AS `id_siswa`,`siswa`.`nis` AS `nis`,`siswa`.`nama` AS `nama`,`siswa`.`agama` AS `agama`,`siswa`.`nisn` AS `nisn`,`siswa`.`no_ijazah_sekolah_asal` AS `no_ijazah_sekolah_asal`,`siswa`.`no_skhun_sekolah_asal` AS `no_skhun_sekolah_asal`,`siswa`.`no_un_sekolah_asal` AS `no_un_sekolah_asal`,`siswa`.`no_kk` AS `no_kk`,`siswa`.`npsn_sekolah_asal` AS `npsn_sekolah_asal`,`siswa`.`nama_sekolah_asal` AS `nama_sekolah_asal`,`siswa`.`tempat_lahir` AS `tempat_lahir`,`siswa`.`tanggal_lahir` AS `tanggal_lahir`,`siswa`.`berkebutuhan_khusus` AS `berkebutuhan_khusus`,`siswa`.`alamat` AS `alamat`,`siswa`.`dusun` AS `dusun`,`siswa`.`rt` AS `rt`,`siswa`.`rw` AS `rw`,`siswa`.`kelurahan` AS `kelurahan`,`siswa`.`foto` AS `foto`,`siswa`.`idprovince_fk` AS `idprovince_fk`,`siswa`.`idcities_fk` AS `idcities_fk`,`siswa`.`nama_ayah` AS `nama_ayah`,`siswa`.`tempat_lahir_ayah` AS `tempat_lahir_ayah`,`siswa`.`tanggal_lahir_ayah` AS `tanggal_lahir_ayah`,`siswa`.`pendidikan_ayah` AS `pendidikan_ayah`,`siswa`.`pekerjaan_ayah` AS `pekerjaan_ayah`,`siswa`.`penghasilan_ayah` AS `penghasilan_ayah`,`siswa`.`nama_ibu` AS `nama_ibu`,`siswa`.`tempat_lahir_ibu` AS `tempat_lahir_ibu`,`siswa`.`tanggal_lahir_ibu` AS `tanggal_lahir_ibu`,`siswa`.`pendidikan_ibu` AS `pendidikan_ibu`,`siswa`.`pekerjaan_ibu` AS `pekerjaan_ibu`,`siswa`.`penghasilan_ibu` AS `penghasilan_ibu`,`siswa`.`tinggi_badan` AS `tinggi_badan`,`siswa`.`berat_badan` AS `berat_badan`,`siswa`.`jarak_ke_sekolah` AS `jarak_ke_sekolah`,`siswa`.`waktu_ke_sekolah` AS `waktu_ke_sekolah`,`siswa`.`jumlah_saudara` AS `jumlah_saudara`,`siswa`.`jenis_kelamin` AS `jenis_kelamin`,`kelas`.`id_kelas` AS `id_kelas`,`kelas`.`kelas` AS `kelas`,`kelas`.`idtingkat_fk` AS `idtingkat_fk`,`kelas`.`create_at` AS `create_at`,`kelas`.`idjurusan_fk` AS `idjurusan_fk`,`guru`.`id_guru` AS `id_guru`,`guru`.`nama` AS `nama_guru`,`guru`.`nip` AS `nip`,`guru`.`alamat` AS `alamat_guru`,`mata_pelajaran`.`idjenismatapelajaran_fk` AS `idjenismatapelajaran_fk`,`mata_pelajaran`.`id_mata_pelajaran` AS `id_mata_pelajaran`,`mata_pelajaran`.`mata_pelajaran` AS `mata_pelajaran`,`mata_pelajaran`.`kode` AS `kode` from ((((`catatan_siswa` left join `siswa` on((`catatan_siswa`.`idsiswa_fk` = `siswa`.`id_siswa`))) left join `kelas` on((`catatan_siswa`.`idkelas_fk` = `kelas`.`kelas`))) left join `guru` on((`catatan_siswa`.`idguru_fk` = `guru`.`id_guru`))) left join `mata_pelajaran` on((`catatan_siswa`.`idmapel_fk` = `mata_pelajaran`.`id_mata_pelajaran`))) ;

-- --------------------------------------------------------

--
-- Struktur untuk view `v_catatan_siswa_new`
--
DROP TABLE IF EXISTS `v_catatan_siswa_new`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_catatan_siswa_new`  AS  select `catatan_siswa`.`id_catatan_siswa` AS `id_catatan_siswa`,`catatan_siswa`.`idsiswa_fk` AS `idsiswa_fk`,`catatan_siswa`.`idkelas_fk` AS `idkelas_fk`,`catatan_siswa`.`idguru_fk` AS `idguru_fk`,`catatan_siswa`.`tanggal` AS `tanggal`,`catatan_siswa`.`uraian` AS `uraian`,`catatan_siswa`.`teruskan_ke` AS `teruskan_ke`,`catatan_siswa`.`idtahunajaran_fk` AS `idtahunajaran_fk`,`catatan_siswa`.`idmapel_fk` AS `idmapel_fk`,`siswa`.`id_siswa` AS `id_siswa`,`siswa`.`nis` AS `nis`,`siswa`.`nama` AS `nama`,`siswa`.`idjurusan_fk` AS `idjurusan_fk`,`siswa`.`agama` AS `agama`,`siswa`.`nisn` AS `nisn`,(select `kelas`.`kelas` from `kelas` where (`kelas`.`id_kelas` = `catatan_siswa`.`idkelas_fk`)) AS `nama_kelas`,(select `guru`.`nama` from `guru` where (`guru`.`id_guru` = `catatan_siswa`.`idguru_fk`)) AS `nama_guru`,(select `mata_pelajaran`.`mata_pelajaran` from `mata_pelajaran` where (`mata_pelajaran`.`id_mata_pelajaran` = `catatan_siswa`.`idmapel_fk`)) AS `mapel` from (`catatan_siswa` join `siswa` on((`catatan_siswa`.`idsiswa_fk` = `siswa`.`id_siswa`))) ;

-- --------------------------------------------------------

--
-- Struktur untuk view `v_guru_mapel`
--
DROP TABLE IF EXISTS `v_guru_mapel`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_guru_mapel`  AS  select `guru`.`id_guru` AS `id_guru`,`guru`.`nama` AS `nama`,`guru`.`nip` AS `nip`,`guru`.`alamat` AS `alamat`,`guru`.`agama` AS `agama`,`guru`.`foto` AS `foto`,`guru`.`pendidikan_terakhir` AS `pendidikan_terakhir`,`guru`.`instansi` AS `instansi`,`guru`.`fb` AS `fb`,`guru`.`ig` AS `ig`,`guru`.`twitter` AS `twitter`,`guru`.`youtube` AS `youtube`,`guru`.`jabatan` AS `jabatan`,`guru`.`email` AS `email`,`guru`.`no_hp` AS `no_hp`,`guru_mapel`.`id_guru_mapel` AS `id_guru_mapel`,`guru_mapel`.`idguru_fk` AS `idguru_fk`,`guru_mapel`.`idmapel_fk` AS `idmapel_fk`,`guru_mapel`.`idkelas_fk` AS `idkelas_fk`,`mata_pelajaran`.`id_mata_pelajaran` AS `id_mata_pelajaran`,`mata_pelajaran`.`mata_pelajaran` AS `mata_pelajaran`,`mata_pelajaran`.`kode` AS `kode`,`kelas`.`id_kelas` AS `id_kelas`,`kelas`.`kelas` AS `kelas`,`kelas`.`idtingkat_fk` AS `idtingkat_fk`,`kelas`.`create_at` AS `create_at`,`kelas`.`idjurusan_fk` AS `idjurusan_fk`,`kelas`.`idtahunajaran_fk` AS `idtahunajaran_fk`,`tahun_ajaran`.`id_tahun_ajaran` AS `id_tahun_ajaran`,`tahun_ajaran`.`tahun_ajaran` AS `tahun_ajaran`,`tahun_ajaran`.`is_active` AS `is_active`,`tahun_ajaran`.`semester` AS `semester`,`mata_pelajaran`.`idjenismatapelajaran_fk` AS `idjenismatapelajaran_fk`,`guru`.`kode_pegawai` AS `kode_pegawai` from ((((`guru` join `guru_mapel` on((`guru_mapel`.`idguru_fk` = `guru`.`id_guru`))) join `mata_pelajaran` on((`guru_mapel`.`idmapel_fk` = `mata_pelajaran`.`id_mata_pelajaran`))) join `kelas` on((`kelas`.`id_kelas` = `guru_mapel`.`idkelas_fk`))) join `tahun_ajaran` on((`tahun_ajaran`.`id_tahun_ajaran` = `guru_mapel`.`idtahunajaran_fk`))) ;

-- --------------------------------------------------------

--
-- Struktur untuk view `v_jadwal_pelajaran`
--
DROP TABLE IF EXISTS `v_jadwal_pelajaran`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_jadwal_pelajaran`  AS  select `jadwal_pelajaran`.`id_jadwal_pelajaran` AS `id_jadwal_pelajaran`,`jadwal_pelajaran`.`idgurumapel_fk` AS `idgurumapel_fk`,`jadwal_pelajaran`.`idhari_fk` AS `idhari_fk`,`jadwal_pelajaran`.`idjampelajaran_fk` AS `idjampelajaran_fk`,`guru_mapel`.`id_guru_mapel` AS `id_guru_mapel`,`guru_mapel`.`idguru_fk` AS `idguru_fk`,`guru_mapel`.`idmapel_fk` AS `idmapel_fk`,`guru_mapel`.`idkelas_fk` AS `idkelas_fk`,(select `guru`.`nama` from `guru` where (`guru`.`id_guru` = `guru_mapel`.`idguru_fk`)) AS `nama_guru`,(select `guru`.`nip` from `guru` where (`guru`.`id_guru` = `guru_mapel`.`idguru_fk`)) AS `nip`,(select `guru`.`kode_pegawai` from `guru` where (`guru`.`id_guru` = `guru_mapel`.`idguru_fk`)) AS `kode_pegawai`,(select `mata_pelajaran`.`kode` from `mata_pelajaran` where (`guru_mapel`.`idmapel_fk` = `mata_pelajaran`.`id_mata_pelajaran`)) AS `kode_pelajaran`,(select `mata_pelajaran`.`mata_pelajaran` from `mata_pelajaran` where (`guru_mapel`.`idmapel_fk` = `mata_pelajaran`.`id_mata_pelajaran`)) AS `mata_pelajaran`,`hari`.`id_hari` AS `id_hari`,`hari`.`hari` AS `hari`,`hari`.`code` AS `code`,`jam_pelajaran`.`id_jam_pelajaran` AS `id_jam_pelajaran`,`jam_pelajaran`.`nama` AS `nama`,`jam_pelajaran`.`jam_mulai` AS `jam_mulai`,`jam_pelajaran`.`jam_selesai` AS `jam_selesai`,`kelas`.`id_kelas` AS `id_kelas`,`kelas`.`kelas` AS `kelas`,`kelas`.`idtingkat_fk` AS `idtingkat_fk`,`kelas`.`create_at` AS `create_at`,`kelas`.`idjurusan_fk` AS `idjurusan_fk`,`kelas`.`idtahunajaran_fk` AS `idtahunajaran_fk` from ((((`jadwal_pelajaran` join `guru_mapel` on((`jadwal_pelajaran`.`idgurumapel_fk` = `guru_mapel`.`id_guru_mapel`))) join `hari` on((`hari`.`id_hari` = `jadwal_pelajaran`.`idhari_fk`))) join `jam_pelajaran` on((`jam_pelajaran`.`id_jam_pelajaran` = `jadwal_pelajaran`.`idjampelajaran_fk`))) join `kelas` on((`guru_mapel`.`idkelas_fk` = `kelas`.`id_kelas`))) ;

-- --------------------------------------------------------

--
-- Struktur untuk view `v_jenis_penerimaan`
--
DROP TABLE IF EXISTS `v_jenis_penerimaan`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_jenis_penerimaan`  AS  select `jenis_penerimaan`.`id_jenis_penerimaan` AS `id_jenis_penerimaan`,`jenis_penerimaan`.`nama` AS `nama`,`jenis_penerimaan`.`kas` AS `kas`,`jenis_penerimaan`.`pendapatan` AS `pendapatan`,`jenis_penerimaan`.`piutang` AS `piutang`,`jenis_penerimaan`.`diskon` AS `diskon`,`jenis_penerimaan`.`is_edit` AS `is_edit`,`jenis_penerimaan`.`bulanan` AS `bulanan`,`jenis_penerimaan`.`template_nota` AS `template_nota`,(select `akun`.`no_ref` from `akun` where (`jenis_penerimaan`.`kas` = `akun`.`id_akun`)) AS `norefkas`,(select `akun`.`no_ref` from `akun` where (`jenis_penerimaan`.`pendapatan` = `akun`.`id_akun`)) AS `norefpendapatan`,(select `akun`.`no_ref` from `akun` where (`jenis_penerimaan`.`piutang` = `akun`.`id_akun`)) AS `norefpiutang`,(select `akun`.`no_ref` from `akun` where (`jenis_penerimaan`.`diskon` = `akun`.`id_akun`)) AS `norefdiskon`,(select `akun`.`saldo_normal` from `akun` where (`jenis_penerimaan`.`kas` = `akun`.`id_akun`)) AS `snkas`,(select `akun`.`saldo_normal` from `akun` where (`jenis_penerimaan`.`pendapatan` = `akun`.`id_akun`)) AS `snpendapatan`,(select `akun`.`saldo_normal` from `akun` where (`jenis_penerimaan`.`piutang` = `akun`.`id_akun`)) AS `snpiutang`,(select `akun`.`saldo_normal` from `akun` where (`jenis_penerimaan`.`diskon` = `akun`.`id_akun`)) AS `sndiskon` from `jenis_penerimaan` ;

-- --------------------------------------------------------

--
-- Struktur untuk view `v_learning`
--
DROP TABLE IF EXISTS `v_learning`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_learning`  AS  select `learning`.`id_learning` AS `id_learning`,`learning`.`idmatapelajaran_fk` AS `idmatapelajaran_fk`,`learning`.`idkd_fk` AS `idkd_fk`,`learning`.`materi` AS `materi`,`learning`.`open_access` AS `open_access`,`learning`.`password` AS `password`,`learning`.`iduser_fk` AS `iduser_fk`,`learning`.`judul` AS `judul`,`learning`.`create_at` AS `create_at`,`learning`.`idtingkat_fk` AS `idtingkat_fk`,`mata_pelajaran`.`id_mata_pelajaran` AS `id_mata_pelajaran`,`mata_pelajaran`.`mata_pelajaran` AS `mata_pelajaran`,`mata_pelajaran`.`kode` AS `kode`,`mata_pelajaran`.`idjenismatapelajaran_fk` AS `idjenismatapelajaran_fk`,`mata_pelajaran`.`jKode` AS `jKode`,`learning`.`cover` AS `cover`,`learning`.`task_code` AS `task_code` from (`learning` join `mata_pelajaran` on((`learning`.`idmatapelajaran_fk` = `mata_pelajaran`.`id_mata_pelajaran`))) ;

-- --------------------------------------------------------

--
-- Struktur untuk view `v_materi`
--
DROP TABLE IF EXISTS `v_materi`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_materi`  AS  select distinct `materi`.`materi` AS `materi`,`materi`.`id_materi` AS `id_materi`,`materi`.`file_materi` AS `file_materi`,`materi`.`file_rpp` AS `file_rpp`,`materi`.`idkelas_fk` AS `idkelas_fk`,`materi`.`idguru_fk` AS `idguru_fk`,`materi`.`idtahunajaran_fk` AS `idtahunajaran_fk`,`materi`.`idmatapelajaran_fk` AS `idmatapelajaran_fk`,`materi`.`trans_code` AS `trans_code`,(select `guru`.`nama` from `guru` where (`guru`.`id_guru` = `materi`.`idguru_fk`)) AS `nama_guru` from `materi` ;

-- --------------------------------------------------------

--
-- Struktur untuk view `v_nilai_keterampilan`
--
DROP TABLE IF EXISTS `v_nilai_keterampilan`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_nilai_keterampilan`  AS  select `input_nilai_keterampilan`.`id_input_nilai_keterampilan` AS `id_input_nilai_keterampilan`,`input_nilai_keterampilan`.`idmatapelajaran_fk` AS `idmatapelajaran_fk`,`input_nilai_keterampilan`.`idtahunajaran_fk` AS `idtahunajaran_fk`,`input_nilai_keterampilan`.`trans_code` AS `trans_code`,`input_nilai_keterampilan`.`idguru_fk` AS `idguru_fk`,`input_nilai_keterampilan`.`idkelas_fk` AS `idkelas_fk`,`input_nilai_keterampilan`.`idjenisketerampilan_fk` AS `idjenisketerampilan_fk`,`nilai_keterampilan`.`id_nilai_keterampilan` AS `id_nilai_keterampilan`,`nilai_keterampilan`.`idsiswa_fk` AS `idsiswa_fk`,`nilai_keterampilan`.`nilai` AS `nilai`,`nilai_keterampilan`.`idinputnilaiketerampilan_fk` AS `idinputnilaiketerampilan_fk`,`nilai_keterampilan`.`create_at` AS `create_at`,`nilai_keterampilan`.`idkd_fk` AS `idkd_fk` from (`input_nilai_keterampilan` join `nilai_keterampilan` on((`input_nilai_keterampilan`.`id_input_nilai_keterampilan` = `nilai_keterampilan`.`idinputnilaiketerampilan_fk`))) ;

-- --------------------------------------------------------

--
-- Struktur untuk view `v_nilai_pas`
--
DROP TABLE IF EXISTS `v_nilai_pas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_nilai_pas`  AS  select `input_nilai_pas`.`id_input_nilai_pas` AS `id_input_nilai_pas`,`input_nilai_pas`.`idmatapelajaran_fk` AS `idmatapelajaran_fk`,`input_nilai_pas`.`idtahunajaran_fk` AS `idtahunajaran_fk`,`input_nilai_pas`.`trans_code` AS `trans_code`,`input_nilai_pas`.`idguru_fk` AS `idguru_fk`,`input_nilai_pas`.`idkelas_fk` AS `idkelas_fk`,`nilai_pas`.`id_nilai_pas` AS `id_nilai_pas`,`nilai_pas`.`idsiswa_fk` AS `idsiswa_fk`,`nilai_pas`.`nilai` AS `nilai`,`nilai_pas`.`idinputnilaipas_fk` AS `idinputnilaipas_fk`,`nilai_pas`.`create_at` AS `create_at` from (`input_nilai_pas` join `nilai_pas` on((`input_nilai_pas`.`id_input_nilai_pas` = `nilai_pas`.`idinputnilaipas_fk`))) ;

-- --------------------------------------------------------

--
-- Struktur untuk view `v_nilai_pengetahuan`
--
DROP TABLE IF EXISTS `v_nilai_pengetahuan`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_nilai_pengetahuan`  AS  select `nilai_pengetahuan`.`id_nilai_pengetahuan` AS `id_nilai_pengetahuan`,`nilai_pengetahuan`.`idsiswa_fk` AS `idsiswa_fk`,`nilai_pengetahuan`.`nilai` AS `nilai`,`nilai_pengetahuan`.`idinputnilaipengetahuan_fk` AS `idinputnilaipengetahuan_fk`,`nilai_pengetahuan`.`create_at` AS `create_at`,`nilai_pengetahuan`.`idkd_fk` AS `idkd_fk`,`input_nilai_pengetahuan`.`id_input_nilai_pengetahuan` AS `id_input_nilai_pengetahuan`,`input_nilai_pengetahuan`.`idmatapelajaran_fk` AS `idmatapelajaran_fk`,`input_nilai_pengetahuan`.`idtahunajaran_fk` AS `idtahunajaran_fk`,`input_nilai_pengetahuan`.`trans_code` AS `trans_code`,`input_nilai_pengetahuan`.`idguru_fk` AS `idguru_fk`,`input_nilai_pengetahuan`.`idkelas_fk` AS `idkelas_fk`,`input_nilai_pengetahuan`.`idjenispengetahuan_fk` AS `idjenispengetahuan_fk` from (`nilai_pengetahuan` join `input_nilai_pengetahuan` on((`input_nilai_pengetahuan`.`id_input_nilai_pengetahuan` = `nilai_pengetahuan`.`idinputnilaipengetahuan_fk`))) ;

-- --------------------------------------------------------

--
-- Struktur untuk view `v_nilai_pts`
--
DROP TABLE IF EXISTS `v_nilai_pts`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_nilai_pts`  AS  select `input_nilai_pts`.`id_input_nilai_pts` AS `id_input_nilai_pts`,`input_nilai_pts`.`idmatapelajaran_fk` AS `idmatapelajaran_fk`,`input_nilai_pts`.`idtahunajaran_fk` AS `idtahunajaran_fk`,`input_nilai_pts`.`trans_code` AS `trans_code`,`input_nilai_pts`.`idguru_fk` AS `idguru_fk`,`input_nilai_pts`.`idkelas_fk` AS `idkelas_fk`,`nilai_pts`.`id_nilai_pts` AS `id_nilai_pts`,`nilai_pts`.`idsiswa_fk` AS `idsiswa_fk`,`nilai_pts`.`nilai` AS `nilai`,`nilai_pts`.`idinputnilaipts_fk` AS `idinputnilaipts_fk`,`nilai_pts`.`create_at` AS `create_at` from (`input_nilai_pts` join `nilai_pts` on((`input_nilai_pts`.`id_input_nilai_pts` = `nilai_pts`.`idinputnilaipts_fk`))) ;

-- --------------------------------------------------------

--
-- Struktur untuk view `v_oas_soal`
--
DROP TABLE IF EXISTS `v_oas_soal`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_oas_soal`  AS  select `oas_soal`.`id_oas_soal` AS `id_oas_soal`,`oas_soal`.`idbanksoal_fk` AS `idbanksoal_fk`,`oas_soal`.`idoas_fk` AS `idoas_fk`,`bank_soal`.`id_bank_soal` AS `id_bank_soal`,`bank_soal`.`soal` AS `soal`,`bank_soal`.`time_soal` AS `time_soal`,`bank_soal`.`code_soal` AS `code_soal`,`bank_soal`.`idmatapelajaran_fk` AS `idmatapelajaran_fk`,`bank_soal`.`idguru_fk` AS `idguru_fk`,`oas`.`id_oas` AS `id_oas`,`oas`.`tanggal_mulai` AS `tanggal_mulai`,`oas`.`tanggal_selesai` AS `tanggal_selesai`,`oas`.`keterangan` AS `keterangan`,`oas`.`is_active` AS `is_active`,`oas`.`kode` AS `kode`,`oas`.`idmapel_fk` AS `idmapel_fk` from ((`oas_soal` join `bank_soal` on((`oas_soal`.`idbanksoal_fk` = `bank_soal`.`id_bank_soal`))) join `oas` on((`oas_soal`.`idoas_fk` = `oas`.`id_oas`))) ;

-- --------------------------------------------------------

--
-- Struktur untuk view `v_pelanggaran_siswa`
--
DROP TABLE IF EXISTS `v_pelanggaran_siswa`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_pelanggaran_siswa`  AS  select `pelanggaran_siswa`.`id_pelanggaran_siswa` AS `id_pelanggaran_siswa`,`pelanggaran_siswa`.`tanggal` AS `tanggal`,`pelanggaran_siswa`.`uraian_pelanggaran` AS `uraian_pelanggaran`,`pelanggaran_siswa`.`idpoinpelanggaran_fk` AS `idpoinpelanggaran_fk`,`pelanggaran_siswa`.`idsiswa_fk` AS `idsiswa_fk`,`poin_pelanggaran`.`id_poin_pelanggaran` AS `id_poin_pelanggaran`,`poin_pelanggaran`.`idjenispelanggaran_fk` AS `idjenispelanggaran_fk`,`poin_pelanggaran`.`nama_pelanggaran` AS `nama_pelanggaran`,`poin_pelanggaran`.`poin` AS `poin`,`poin_pelanggaran`.`kode_pelanggaran` AS `kode_pelanggaran`,`jenis_pelanggaran`.`id_jenis_pelanggaran` AS `id_jenis_pelanggaran`,`jenis_pelanggaran`.`jenis_pelanggaran` AS `jenis_pelanggaran`,(select `siswa`.`nama` from `siswa` where (`siswa`.`id_siswa` = `pelanggaran_siswa`.`idsiswa_fk`)) AS `nama_siswa` from ((`pelanggaran_siswa` left join `poin_pelanggaran` on((`poin_pelanggaran`.`id_poin_pelanggaran` = `pelanggaran_siswa`.`idpoinpelanggaran_fk`))) left join `jenis_pelanggaran` on((`jenis_pelanggaran`.`id_jenis_pelanggaran` = `poin_pelanggaran`.`idjenispelanggaran_fk`))) ;

-- --------------------------------------------------------

--
-- Struktur untuk view `v_penerimaan`
--
DROP TABLE IF EXISTS `v_penerimaan`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_penerimaan`  AS  select `penerimaan`.`id_penerimaan` AS `id_penerimaan`,`penerimaan`.`idsiswa_fk` AS `idsiswa_fk`,`penerimaan`.`idjenispenerimaan_fk` AS `idjenispenerimaan_fk`,`penerimaan`.`metode_pembayaran` AS `metode_pembayaran`,`penerimaan`.`tanggal` AS `tanggal`,`penerimaan`.`catatan` AS `catatan`,`penerimaan`.`jumlah` AS `jumlah`,`penerimaan`.`create_at` AS `create_at`,`penerimaan`.`invoice` AS `invoice`,`penerimaan`.`diskon` AS `diskon_penerimaan`,`jenis_penerimaan`.`id_jenis_penerimaan` AS `id_jenis_penerimaan`,`jenis_penerimaan`.`nama` AS `nama`,`jenis_penerimaan`.`kas` AS `kas`,`jenis_penerimaan`.`pendapatan` AS `pendapatan`,`jenis_penerimaan`.`piutang` AS `piutang`,`jenis_penerimaan`.`is_edit` AS `is_edit`,`jenis_penerimaan`.`bulanan` AS `bulanan`,`jenis_penerimaan`.`template_nota` AS `template_nota`,`jenis_penerimaan`.`diskon` AS `diskon`,`siswa`.`id_siswa` AS `id_siswa`,`siswa`.`nis` AS `nis`,`siswa`.`nama` AS `nama_siswa`,`siswa`.`idkelas_fk` AS `idkelas_fk`,`siswa`.`idjurusan_fk` AS `idjurusan_fk`,`siswa`.`agama` AS `agama`,`siswa`.`nisn` AS `nisn`,`siswa`.`no_ijazah_sekolah_asal` AS `no_ijazah_sekolah_asal`,`siswa`.`no_skhun_sekolah_asal` AS `no_skhun_sekolah_asal`,`siswa`.`no_un_sekolah_asal` AS `no_un_sekolah_asal`,`siswa`.`no_kk` AS `no_kk`,`siswa`.`npsn_sekolah_asal` AS `npsn_sekolah_asal`,`siswa`.`nama_sekolah_asal` AS `nama_sekolah_asal`,`siswa`.`tempat_lahir` AS `tempat_lahir`,`siswa`.`tanggal_lahir` AS `tanggal_lahir`,`siswa`.`berkebutuhan_khusus` AS `berkebutuhan_khusus`,`siswa`.`alamat` AS `alamat`,`siswa`.`dusun` AS `dusun`,`siswa`.`rt` AS `rt`,`siswa`.`rw` AS `rw`,`siswa`.`kelurahan` AS `kelurahan`,`siswa`.`foto` AS `foto`,`siswa`.`idprovince_fk` AS `idprovince_fk`,`siswa`.`idcities_fk` AS `idcities_fk`,`siswa`.`nama_ayah` AS `nama_ayah`,`siswa`.`tempat_lahir_ayah` AS `tempat_lahir_ayah`,`siswa`.`tanggal_lahir_ayah` AS `tanggal_lahir_ayah`,`siswa`.`pendidikan_ayah` AS `pendidikan_ayah`,`siswa`.`pekerjaan_ayah` AS `pekerjaan_ayah`,`siswa`.`penghasilan_ayah` AS `penghasilan_ayah`,`siswa`.`nama_ibu` AS `nama_ibu`,`siswa`.`tempat_lahir_ibu` AS `tempat_lahir_ibu`,`siswa`.`tanggal_lahir_ibu` AS `tanggal_lahir_ibu`,`siswa`.`pendidikan_ibu` AS `pendidikan_ibu`,`siswa`.`pekerjaan_ibu` AS `pekerjaan_ibu`,`siswa`.`penghasilan_ibu` AS `penghasilan_ibu`,`siswa`.`tinggi_badan` AS `tinggi_badan`,`siswa`.`berat_badan` AS `berat_badan`,`siswa`.`jarak_ke_sekolah` AS `jarak_ke_sekolah`,`siswa`.`waktu_ke_sekolah` AS `waktu_ke_sekolah`,`siswa`.`jumlah_saudara` AS `jumlah_saudara`,`siswa`.`jenis_kelamin` AS `jenis_kelamin`,`siswa`.`saldo` AS `saldo`,(select `kelas`.`kelas` from `kelas` where (`siswa`.`idkelas_fk` = `kelas`.`id_kelas`)) AS `kelas` from ((`penerimaan` join `jenis_penerimaan` on((`penerimaan`.`idjenispenerimaan_fk` = `jenis_penerimaan`.`id_jenis_penerimaan`))) join `siswa` on((`penerimaan`.`idsiswa_fk` = `siswa`.`id_siswa`))) ;

-- --------------------------------------------------------

--
-- Struktur untuk view `v_pkg`
--
DROP TABLE IF EXISTS `v_pkg`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_pkg`  AS  select `component_penilaian_kinerja_guru`.`idpenilaiankinerjaguru_fk` AS `idpenilaiankinerjaguru_fk`,`penilaian_kinerja_guru`.`id_penilaian_kinerja_guru` AS `id_penilaian_kinerja_guru`,`penilaian_kinerja_guru`.`idguru_fk` AS `idguru_fk`,`penilaian_kinerja_guru`.`bulan` AS `bulan`,`penilaian_kinerja_guru`.`tahun` AS `tahun`,`penilaian_kinerja_guru`.`idtahunajaran_fk` AS `idtahunajaran_fk`,`penilaian_kinerja_guru`.`create_at` AS `create_at`,`penilaian_kinerja_guru`.`trans_code` AS `trans_code`,`component_penilaian_kinerja_guru`.`id_component_penilaian_kinerja_guru` AS `id_component_penilaian_kinerja_guru`,`component_penilaian_kinerja_guru`.`idsubkompetensipkg_fk` AS `idsubkompetensipkg_fk`,`component_penilaian_kinerja_guru`.`nilai` AS `nilai` from (`penilaian_kinerja_guru` join `component_penilaian_kinerja_guru` on((`penilaian_kinerja_guru`.`id_penilaian_kinerja_guru` = `component_penilaian_kinerja_guru`.`idpenilaiankinerjaguru_fk`))) ;

-- --------------------------------------------------------

--
-- Struktur untuk view `v_poin_pelanggaran`
--
DROP TABLE IF EXISTS `v_poin_pelanggaran`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_poin_pelanggaran`  AS  select `poin_pelanggaran`.`id_poin_pelanggaran` AS `id_poin_pelanggaran`,`poin_pelanggaran`.`idjenispelanggaran_fk` AS `idjenispelanggaran_fk`,`poin_pelanggaran`.`nama_pelanggaran` AS `nama_pelanggaran`,`poin_pelanggaran`.`poin` AS `poin`,`jenis_pelanggaran`.`id_jenis_pelanggaran` AS `id_jenis_pelanggaran`,`jenis_pelanggaran`.`jenis_pelanggaran` AS `jenis_pelanggaran`,`poin_pelanggaran`.`kategori_pelanggaran` AS `kategori_pelanggaran`,`poin_pelanggaran`.`kode_pelanggaran` AS `kode_pelanggaran` from (`poin_pelanggaran` join `jenis_pelanggaran` on((`jenis_pelanggaran`.`id_jenis_pelanggaran` = `poin_pelanggaran`.`idjenispelanggaran_fk`))) ;

-- --------------------------------------------------------

--
-- Struktur untuk view `v_poin_pelanggaran_siswa`
--
DROP TABLE IF EXISTS `v_poin_pelanggaran_siswa`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_poin_pelanggaran_siswa`  AS  select `siswa`.`id_siswa` AS `id_siswa`,`siswa`.`nisn` AS `nisn`,`siswa`.`nis` AS `nis`,`siswa`.`nama` AS `nama`,(select sum(`v_pelanggaran_siswa`.`poin`) from `v_pelanggaran_siswa` where (`v_pelanggaran_siswa`.`idsiswa_fk` = `siswa`.`id_siswa`)) AS `poin` from `siswa` where ((select sum(`v_pelanggaran_siswa`.`poin`) from `v_pelanggaran_siswa` where (`v_pelanggaran_siswa`.`idsiswa_fk` = `siswa`.`id_siswa`)) > 0) ;

-- --------------------------------------------------------

--
-- Struktur untuk view `v_presensi_event`
--
DROP TABLE IF EXISTS `v_presensi_event`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_presensi_event`  AS  select `event`.`id_event` AS `id_event`,`event`.`event` AS `event`,`event`.`tanggal` AS `tanggal`,`event`.`notulensi` AS `notulensi`,`presensi_event`.`id_presensi_event` AS `id_presensi_event`,`presensi_event`.`idevent_fk` AS `idevent_fk`,`presensi_event`.`idguru_fk` AS `idguru_fk`,`presensi_event`.`is_hadir` AS `is_hadir`,(select `guru`.`nama` from `guru` where (`guru`.`id_guru` = `presensi_event`.`idguru_fk`)) AS `nama_guru` from (`event` join `presensi_event` on((`presensi_event`.`idevent_fk` = `event`.`id_event`))) ;

-- --------------------------------------------------------

--
-- Struktur untuk view `v_presensi_harian_set`
--
DROP TABLE IF EXISTS `v_presensi_harian_set`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_presensi_harian_set`  AS  select `presensi_harian`.`id_presensi_harian` AS `id_presensi_harian`,`presensi_harian`.`idmatapelajaran_fk` AS `idmatapelajaran_fk`,`presensi_harian`.`idsiswa_fk` AS `idsiswa_fk`,`presensi_harian`.`presensi` AS `presensi`,`presensi_harian`.`keterangan` AS `keterangan`,`presensi_harian`.`tanggal` AS `tanggal`,`presensi_harian`.`create_at` AS `create_at`,`presensi_harian`.`idtahunajaran_fk` AS `idtahunajaran_fk`,`presensi_harian`.`idkelas_fk` AS `idkelas_fk`,(select `kelas`.`idjurusan_fk` from `kelas` where (`kelas`.`id_kelas` = `presensi_harian`.`idkelas_fk`)) AS `id_jurusan` from `presensi_harian` ;

-- --------------------------------------------------------

--
-- Struktur untuk view `v_prestasi_siswa`
--
DROP TABLE IF EXISTS `v_prestasi_siswa`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_prestasi_siswa`  AS  select `prestasi_siswa`.`id_prestasi_siswa` AS `id_prestasi_siswa`,`prestasi_siswa`.`idsiswa_fk` AS `idsiswa_fk`,`prestasi_siswa`.`prestasi` AS `prestasi`,`prestasi_siswa`.`lomba` AS `lomba`,`prestasi_siswa`.`tahun` AS `tahun`,`prestasi_siswa`.`jenis_perlombaan` AS `jenis_perlombaan`,(select `siswa`.`nama` from `siswa` where (`siswa`.`id_siswa` = `prestasi_siswa`.`idsiswa_fk`)) AS `nama_siswa`,(select `siswa`.`nis` from `siswa` where (`siswa`.`id_siswa` = `prestasi_siswa`.`idsiswa_fk`)) AS `nis_siswa` from `prestasi_siswa` ;

-- --------------------------------------------------------

--
-- Struktur untuk view `v_siswa_jurusan`
--
DROP TABLE IF EXISTS `v_siswa_jurusan`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_siswa_jurusan`  AS  select `siswa`.`id_siswa` AS `id_siswa`,`siswa`.`nis` AS `nis`,`siswa`.`nama` AS `nama`,`siswa`.`idkelas_fk` AS `idkelas_fk`,`siswa`.`idjurusan_fk` AS `idjurusan_fk`,`siswa`.`agama` AS `agama`,`siswa`.`nisn` AS `nisn`,`siswa`.`no_ijazah_sekolah_asal` AS `no_ijazah_sekolah_asal`,`siswa`.`no_skhun_sekolah_asal` AS `no_skhun_sekolah_asal`,`siswa`.`no_un_sekolah_asal` AS `no_un_sekolah_asal`,`siswa`.`no_kk` AS `no_kk`,`siswa`.`npsn_sekolah_asal` AS `npsn_sekolah_asal`,`siswa`.`nama_sekolah_asal` AS `nama_sekolah_asal`,`siswa`.`tempat_lahir` AS `tempat_lahir`,`siswa`.`tanggal_lahir` AS `tanggal_lahir`,`siswa`.`berkebutuhan_khusus` AS `berkebutuhan_khusus`,`siswa`.`alamat` AS `alamat`,`siswa`.`dusun` AS `dusun`,`siswa`.`rt` AS `rt`,`siswa`.`rw` AS `rw`,`siswa`.`kelurahan` AS `kelurahan`,`siswa`.`foto` AS `foto`,`siswa`.`idprovince_fk` AS `idprovince_fk`,`siswa`.`idcities_fk` AS `idcities_fk`,`siswa`.`nama_ayah` AS `nama_ayah`,`siswa`.`tempat_lahir_ayah` AS `tempat_lahir_ayah`,`siswa`.`tanggal_lahir_ayah` AS `tanggal_lahir_ayah`,`siswa`.`pendidikan_ayah` AS `pendidikan_ayah`,`siswa`.`pekerjaan_ayah` AS `pekerjaan_ayah`,`siswa`.`penghasilan_ayah` AS `penghasilan_ayah`,`siswa`.`nama_ibu` AS `nama_ibu`,`siswa`.`tempat_lahir_ibu` AS `tempat_lahir_ibu`,`siswa`.`tanggal_lahir_ibu` AS `tanggal_lahir_ibu`,`siswa`.`pendidikan_ibu` AS `pendidikan_ibu`,`siswa`.`pekerjaan_ibu` AS `pekerjaan_ibu`,`siswa`.`penghasilan_ibu` AS `penghasilan_ibu`,`siswa`.`tinggi_badan` AS `tinggi_badan`,`siswa`.`berat_badan` AS `berat_badan`,`siswa`.`jarak_ke_sekolah` AS `jarak_ke_sekolah`,`siswa`.`waktu_ke_sekolah` AS `waktu_ke_sekolah`,`siswa`.`jumlah_saudara` AS `jumlah_saudara`,`siswa`.`jenis_kelamin` AS `jenis_kelamin`,`kelas`.`id_kelas` AS `id_kelas`,`kelas`.`kelas` AS `kelas`,`kelas`.`idtingkat_fk` AS `idtingkat_fk`,`kelas`.`create_at` AS `create_at`,`kelas`.`idtahunajaran_fk` AS `idtahunajaran_fk`,`jurusan`.`id_jurusan` AS `id_jurusan`,`jurusan`.`jurusan` AS `jurusan`,`jurusan`.`singkatan` AS `singkatan`,(select `tingkat`.`tingkat` from `tingkat` where (`tingkat`.`id_tingkat` = `kelas`.`idtingkat_fk`)) AS `nama_tingkat` from ((`siswa` join `kelas` on((`kelas`.`id_kelas` = `siswa`.`idkelas_fk`))) join `jurusan` on((`jurusan`.`id_jurusan` = `siswa`.`idjurusan_fk`))) ;

-- --------------------------------------------------------

--
-- Struktur untuk view `v_tanggungan_siswa`
--
DROP TABLE IF EXISTS `v_tanggungan_siswa`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_tanggungan_siswa`  AS  select `tanggungan_siswa`.`id_tanggungan_siswa` AS `id_tanggungan_siswa`,`tanggungan_siswa`.`idsiswa_fk` AS `idsiswa_fk`,`tanggungan_siswa`.`idjenispenerimaan_fk` AS `idjenispenerimaan_fk`,`tanggungan_siswa`.`jumlah` AS `jumlah`,`jenis_penerimaan`.`id_jenis_penerimaan` AS `id_jenis_penerimaan`,`jenis_penerimaan`.`nama` AS `nama`,`jenis_penerimaan`.`kas` AS `kas`,`jenis_penerimaan`.`pendapatan` AS `pendapatan`,`jenis_penerimaan`.`piutang` AS `piutang`,`jenis_penerimaan`.`diskon` AS `diskon`,`jenis_penerimaan`.`is_edit` AS `is_edit`,`jenis_penerimaan`.`bulanan` AS `bulanan`,`jenis_penerimaan`.`template_nota` AS `template_nota` from (`tanggungan_siswa` join `jenis_penerimaan` on((`tanggungan_siswa`.`idjenispenerimaan_fk` = `jenis_penerimaan`.`id_jenis_penerimaan`))) ;

-- --------------------------------------------------------

--
-- Struktur untuk view `v_task`
--
DROP TABLE IF EXISTS `v_task`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_task`  AS  select `task_answer`.`id_task_answer` AS `id_task_answer`,`task_answer`.`idsiswa_fk` AS `idsiswa_fk`,`task_answer`.`ans` AS `ans`,`task_answer`.`idtask_fk` AS `idtask_fk`,`task_answer`.`type` AS `type`,`task`.`id_task` AS `id_task`,`task`.`task_code` AS `task_code`,`task`.`task` AS `task`,`task`.`idguru_fk` AS `idguru_fk`,`task`.`idmapel_fk` AS `idmapel_fk`,`task`.`title` AS `title`,`siswa`.`id_siswa` AS `id_siswa`,`siswa`.`nis` AS `nis`,`siswa`.`nama` AS `nama`,`siswa`.`idkelas_fk` AS `idkelas_fk`,`siswa`.`idjurusan_fk` AS `idjurusan_fk`,`siswa`.`agama` AS `agama`,`siswa`.`nisn` AS `nisn`,`siswa`.`no_ijazah_sekolah_asal` AS `no_ijazah_sekolah_asal`,`siswa`.`no_skhun_sekolah_asal` AS `no_skhun_sekolah_asal`,`siswa`.`no_un_sekolah_asal` AS `no_un_sekolah_asal`,`siswa`.`no_kk` AS `no_kk`,`siswa`.`npsn_sekolah_asal` AS `npsn_sekolah_asal`,`siswa`.`nama_sekolah_asal` AS `nama_sekolah_asal`,`siswa`.`tempat_lahir` AS `tempat_lahir`,`siswa`.`tanggal_lahir` AS `tanggal_lahir`,`siswa`.`berkebutuhan_khusus` AS `berkebutuhan_khusus`,`siswa`.`alamat` AS `alamat`,`siswa`.`dusun` AS `dusun`,`siswa`.`rt` AS `rt`,`siswa`.`rw` AS `rw`,`siswa`.`kelurahan` AS `kelurahan`,`siswa`.`foto` AS `foto`,`siswa`.`idprovince_fk` AS `idprovince_fk`,`siswa`.`idcities_fk` AS `idcities_fk`,`siswa`.`nama_ayah` AS `nama_ayah`,`siswa`.`tempat_lahir_ayah` AS `tempat_lahir_ayah`,`siswa`.`tanggal_lahir_ayah` AS `tanggal_lahir_ayah`,`siswa`.`pendidikan_ayah` AS `pendidikan_ayah`,`siswa`.`pekerjaan_ayah` AS `pekerjaan_ayah`,`siswa`.`penghasilan_ayah` AS `penghasilan_ayah`,`siswa`.`nama_ibu` AS `nama_ibu`,`siswa`.`tempat_lahir_ibu` AS `tempat_lahir_ibu`,`siswa`.`tanggal_lahir_ibu` AS `tanggal_lahir_ibu`,`siswa`.`pendidikan_ibu` AS `pendidikan_ibu`,`siswa`.`pekerjaan_ibu` AS `pekerjaan_ibu`,`siswa`.`penghasilan_ibu` AS `penghasilan_ibu`,`siswa`.`tinggi_badan` AS `tinggi_badan`,`siswa`.`berat_badan` AS `berat_badan`,`siswa`.`jarak_ke_sekolah` AS `jarak_ke_sekolah`,`siswa`.`waktu_ke_sekolah` AS `waktu_ke_sekolah`,`siswa`.`jumlah_saudara` AS `jumlah_saudara`,`siswa`.`jenis_kelamin` AS `jenis_kelamin`,`task_answer`.`nilai` AS `nilai` from ((`task_answer` join `task` on((`task_answer`.`idtask_fk` = `task`.`id_task`))) join `siswa` on((`task_answer`.`idsiswa_fk` = `siswa`.`id_siswa`))) ;

-- --------------------------------------------------------

--
-- Struktur untuk view `v_walas`
--
DROP TABLE IF EXISTS `v_walas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_walas`  AS  select `wali_kelas`.`id_wali_kelas` AS `id_wali_kelas`,`wali_kelas`.`idguru_fk` AS `idguru_fk`,`wali_kelas`.`idtahunajaran_fk` AS `idtahunajaran_fk`,`wali_kelas`.`idkelas_fk` AS `idkelas_fk`,`kelas`.`id_kelas` AS `id_kelas`,`kelas`.`kelas` AS `kelas`,`kelas`.`idtingkat_fk` AS `idtingkat_fk`,`kelas`.`idjurusan_fk` AS `idjurusan_fk`,`tingkat`.`id_tingkat` AS `id_tingkat`,`tingkat`.`tingkat` AS `tingkat`,`jurusan`.`id_jurusan` AS `id_jurusan`,`jurusan`.`jurusan` AS `jurusan`,`jurusan`.`singkatan` AS `singkatan` from (((`wali_kelas` left join `kelas` on((`wali_kelas`.`idkelas_fk` = `kelas`.`id_kelas`))) left join `tingkat` on((`kelas`.`idtingkat_fk` = `tingkat`.`id_tingkat`))) left join `jurusan` on((`kelas`.`idjurusan_fk` = `jurusan`.`id_jurusan`))) ;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `absensi`
--
ALTER TABLE `absensi`
  ADD PRIMARY KEY (`id_absensi`) USING BTREE;

--
-- Indeks untuk tabel `additional_setting`
--
ALTER TABLE `additional_setting`
  ADD PRIMARY KEY (`id_additional_setting`) USING BTREE;

--
-- Indeks untuk tabel `akun`
--
ALTER TABLE `akun`
  ADD PRIMARY KEY (`id_akun`) USING BTREE;

--
-- Indeks untuk tabel `alumni`
--
ALTER TABLE `alumni`
  ADD PRIMARY KEY (`id_alumni`) USING BTREE;

--
-- Indeks untuk tabel `anak_pegawai`
--
ALTER TABLE `anak_pegawai`
  ADD PRIMARY KEY (`id_anak_pegawai`) USING BTREE;

--
-- Indeks untuk tabel `ans_bank_soal`
--
ALTER TABLE `ans_bank_soal`
  ADD PRIMARY KEY (`id_ans_bank_soal`) USING BTREE;

--
-- Indeks untuk tabel `bank_soal`
--
ALTER TABLE `bank_soal`
  ADD PRIMARY KEY (`id_bank_soal`) USING BTREE,
  ADD KEY `idmatapelajaran_fk` (`idmatapelajaran_fk`) USING BTREE,
  ADD KEY `idguru_fk` (`idguru_fk`) USING BTREE;

--
-- Indeks untuk tabel `blog_article`
--
ALTER TABLE `blog_article`
  ADD PRIMARY KEY (`id_blog_article`) USING BTREE;

--
-- Indeks untuk tabel `blog_course`
--
ALTER TABLE `blog_course`
  ADD PRIMARY KEY (`id_blog_course`) USING BTREE;

--
-- Indeks untuk tabel `blog_setting`
--
ALTER TABLE `blog_setting`
  ADD PRIMARY KEY (`id_blog_setting`) USING BTREE;

--
-- Indeks untuk tabel `blog_slider`
--
ALTER TABLE `blog_slider`
  ADD PRIMARY KEY (`id_blog_slider`) USING BTREE;

--
-- Indeks untuk tabel `blog_teacher`
--
ALTER TABLE `blog_teacher`
  ADD PRIMARY KEY (`id_blog_teacher`) USING BTREE;

--
-- Indeks untuk tabel `buku_pemanggilan_siswa`
--
ALTER TABLE `buku_pemanggilan_siswa`
  ADD PRIMARY KEY (`id_buku_pemanggilan_siswa`) USING BTREE;

--
-- Indeks untuk tabel `buku_tamu`
--
ALTER TABLE `buku_tamu`
  ADD PRIMARY KEY (`id_buku_tamu`) USING BTREE;

--
-- Indeks untuk tabel `catatan_siswa`
--
ALTER TABLE `catatan_siswa`
  ADD PRIMARY KEY (`id_catatan_siswa`) USING BTREE;

--
-- Indeks untuk tabel `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indeks untuk tabel `coa`
--
ALTER TABLE `coa`
  ADD PRIMARY KEY (`id_coa`) USING BTREE;

--
-- Indeks untuk tabel `component_jadwal`
--
ALTER TABLE `component_jadwal`
  ADD PRIMARY KEY (`id_component_jadwal`) USING BTREE;

--
-- Indeks untuk tabel `component_penilaian_kinerja_guru`
--
ALTER TABLE `component_penilaian_kinerja_guru`
  ADD PRIMARY KEY (`id_component_penilaian_kinerja_guru`) USING BTREE;

--
-- Indeks untuk tabel `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`id_department`);

--
-- Indeks untuk tabel `detail_pemasukan_lain`
--
ALTER TABLE `detail_pemasukan_lain`
  ADD PRIMARY KEY (`id_detail_pemasukan_lain`) USING BTREE;

--
-- Indeks untuk tabel `detail_pengeluaran_lain`
--
ALTER TABLE `detail_pengeluaran_lain`
  ADD PRIMARY KEY (`id_detail_pengeluaran_lain`) USING BTREE;

--
-- Indeks untuk tabel `detail_transaksi_tanggungan_alumni`
--
ALTER TABLE `detail_transaksi_tanggungan_alumni`
  ADD PRIMARY KEY (`id_detail_transaksi_tanggungan_alumni`);

--
-- Indeks untuk tabel `detail_transaksi_tanggungan_siswa`
--
ALTER TABLE `detail_transaksi_tanggungan_siswa`
  ADD PRIMARY KEY (`id_detail_transaksi_tanggungan_siswa`) USING BTREE,
  ADD KEY `idtransaksitanggungansiswa_fk` (`idtransaksitanggungansiswa_fk`);

--
-- Indeks untuk tabel `dokumen_pegawai`
--
ALTER TABLE `dokumen_pegawai`
  ADD PRIMARY KEY (`id_dokumen_pegawai`) USING BTREE;

--
-- Indeks untuk tabel `dudi`
--
ALTER TABLE `dudi`
  ADD PRIMARY KEY (`id_dudi`);

--
-- Indeks untuk tabel `erapor`
--
ALTER TABLE `erapor`
  ADD PRIMARY KEY (`id_erapor`) USING BTREE;

--
-- Indeks untuk tabel `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`id_event`) USING BTREE;

--
-- Indeks untuk tabel `file_oas`
--
ALTER TABLE `file_oas`
  ADD PRIMARY KEY (`id_file_oas`) USING BTREE;

--
-- Indeks untuk tabel `file_rapor_online`
--
ALTER TABLE `file_rapor_online`
  ADD PRIMARY KEY (`id_file_rapor_online`) USING BTREE;

--
-- Indeks untuk tabel `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indeks untuk tabel `guru`
--
ALTER TABLE `guru`
  ADD PRIMARY KEY (`id_guru`) USING BTREE;

--
-- Indeks untuk tabel `guru_mapel`
--
ALTER TABLE `guru_mapel`
  ADD PRIMARY KEY (`id_guru_mapel`) USING BTREE,
  ADD KEY `idguru_fk` (`idguru_fk`) USING BTREE,
  ADD KEY `idmapel_fk` (`idmapel_fk`) USING BTREE;

--
-- Indeks untuk tabel `hari`
--
ALTER TABLE `hari`
  ADD PRIMARY KEY (`id_hari`) USING BTREE;

--
-- Indeks untuk tabel `hobi_pegawai`
--
ALTER TABLE `hobi_pegawai`
  ADD PRIMARY KEY (`id_hobi_pegawai`) USING BTREE;

--
-- Indeks untuk tabel `induk_akun`
--
ALTER TABLE `induk_akun`
  ADD PRIMARY KEY (`id_induk_akun`) USING BTREE;

--
-- Indeks untuk tabel `input_nilai_keterampilan`
--
ALTER TABLE `input_nilai_keterampilan`
  ADD PRIMARY KEY (`id_input_nilai_keterampilan`) USING BTREE;

--
-- Indeks untuk tabel `input_nilai_pas`
--
ALTER TABLE `input_nilai_pas`
  ADD PRIMARY KEY (`id_input_nilai_pas`) USING BTREE;

--
-- Indeks untuk tabel `input_nilai_pengetahuan`
--
ALTER TABLE `input_nilai_pengetahuan`
  ADD PRIMARY KEY (`id_input_nilai_pengetahuan`) USING BTREE;

--
-- Indeks untuk tabel `input_nilai_pts`
--
ALTER TABLE `input_nilai_pts`
  ADD PRIMARY KEY (`id_input_nilai_pts`) USING BTREE;

--
-- Indeks untuk tabel `iuran_wajib_siswa`
--
ALTER TABLE `iuran_wajib_siswa`
  ADD PRIMARY KEY (`id_iuran_wajib_siswa`) USING BTREE;

--
-- Indeks untuk tabel `jadwal`
--
ALTER TABLE `jadwal`
  ADD PRIMARY KEY (`id_jadwal`) USING BTREE;

--
-- Indeks untuk tabel `jadwal_guru`
--
ALTER TABLE `jadwal_guru`
  ADD PRIMARY KEY (`id_jadwal_guru`) USING BTREE;

--
-- Indeks untuk tabel `jadwal_pelajaran`
--
ALTER TABLE `jadwal_pelajaran`
  ADD PRIMARY KEY (`id_jadwal_pelajaran`) USING BTREE;

--
-- Indeks untuk tabel `jam`
--
ALTER TABLE `jam`
  ADD PRIMARY KEY (`id_jam`) USING BTREE;

--
-- Indeks untuk tabel `jam_pelajaran`
--
ALTER TABLE `jam_pelajaran`
  ADD PRIMARY KEY (`id_jam_pelajaran`) USING BTREE;

--
-- Indeks untuk tabel `jenis_kerjasama`
--
ALTER TABLE `jenis_kerjasama`
  ADD PRIMARY KEY (`id_jenis_kerjasama`);

--
-- Indeks untuk tabel `jenis_keterampilan`
--
ALTER TABLE `jenis_keterampilan`
  ADD PRIMARY KEY (`id_jenis_keterampilan`) USING BTREE;

--
-- Indeks untuk tabel `jenis_mata_pelajaran`
--
ALTER TABLE `jenis_mata_pelajaran`
  ADD PRIMARY KEY (`id_jenis_mata_pelajaran`) USING BTREE;

--
-- Indeks untuk tabel `jenis_pelanggaran`
--
ALTER TABLE `jenis_pelanggaran`
  ADD PRIMARY KEY (`id_jenis_pelanggaran`) USING BTREE;

--
-- Indeks untuk tabel `jenis_penerimaan`
--
ALTER TABLE `jenis_penerimaan`
  ADD PRIMARY KEY (`id_jenis_penerimaan`) USING BTREE;

--
-- Indeks untuk tabel `jenis_pengetahuan`
--
ALTER TABLE `jenis_pengetahuan`
  ADD PRIMARY KEY (`id_jenis_pengetahuan`) USING BTREE;

--
-- Indeks untuk tabel `jenis_penilaian`
--
ALTER TABLE `jenis_penilaian`
  ADD PRIMARY KEY (`id_jenis_penilaian`) USING BTREE;

--
-- Indeks untuk tabel `jurnal_guru`
--
ALTER TABLE `jurnal_guru`
  ADD PRIMARY KEY (`id_jurnal_guru`) USING BTREE;

--
-- Indeks untuk tabel `jurnal_umum`
--
ALTER TABLE `jurnal_umum`
  ADD PRIMARY KEY (`id_jurnal_umum`) USING BTREE;

--
-- Indeks untuk tabel `jurusan`
--
ALTER TABLE `jurusan`
  ADD PRIMARY KEY (`id_jurusan`) USING BTREE;

--
-- Indeks untuk tabel `kaprog`
--
ALTER TABLE `kaprog`
  ADD PRIMARY KEY (`id_kaprog`) USING BTREE;

--
-- Indeks untuk tabel `kd`
--
ALTER TABLE `kd`
  ADD PRIMARY KEY (`id_kd`) USING BTREE,
  ADD KEY `idtingkat_fk` (`idkelas_fk`) USING BTREE,
  ADD KEY `idjenispenilaian_fk` (`idjenispenilaian_fk`) USING BTREE,
  ADD KEY `idsemester_fk` (`idmatapelajaran_fk`) USING BTREE;

--
-- Indeks untuk tabel `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`id_kelas`) USING BTREE,
  ADD KEY `idtingkat_fk` (`idtingkat_fk`) USING BTREE;

--
-- Indeks untuk tabel `kelas_erapor`
--
ALTER TABLE `kelas_erapor`
  ADD PRIMARY KEY (`id_kelas_erapor`) USING BTREE;

--
-- Indeks untuk tabel `kelas_oas`
--
ALTER TABLE `kelas_oas`
  ADD PRIMARY KEY (`id_kelas_oas`) USING BTREE;

--
-- Indeks untuk tabel `kerjasama_dudi`
--
ALTER TABLE `kerjasama_dudi`
  ADD PRIMARY KEY (`id_kerjasama_dudi`);

--
-- Indeks untuk tabel `kompetensi_pkg`
--
ALTER TABLE `kompetensi_pkg`
  ADD PRIMARY KEY (`id_kompetensi_pkg`) USING BTREE;

--
-- Indeks untuk tabel `koperasi_member`
--
ALTER TABLE `koperasi_member`
  ADD PRIMARY KEY (`id_koperasi_member`) USING BTREE;

--
-- Indeks untuk tabel `kursus_pegawai`
--
ALTER TABLE `kursus_pegawai`
  ADD PRIMARY KEY (`id_kursus_pegawai`) USING BTREE;

--
-- Indeks untuk tabel `learning`
--
ALTER TABLE `learning`
  ADD PRIMARY KEY (`id_learning`) USING BTREE,
  ADD KEY `learning_ibfk_1` (`idmatapelajaran_fk`) USING BTREE,
  ADD KEY `idkd_fk` (`idkd_fk`) USING BTREE,
  ADD KEY `iduser_fk` (`iduser_fk`) USING BTREE,
  ADD KEY `idtingkat_fk` (`idtingkat_fk`) USING BTREE;

--
-- Indeks untuk tabel `learning_course`
--
ALTER TABLE `learning_course`
  ADD PRIMARY KEY (`id_learning_course`) USING BTREE;

--
-- Indeks untuk tabel `learning_lessons`
--
ALTER TABLE `learning_lessons`
  ADD PRIMARY KEY (`id_learning_lessons`) USING BTREE;

--
-- Indeks untuk tabel `learning_materials`
--
ALTER TABLE `learning_materials`
  ADD PRIMARY KEY (`id_learning_materials`) USING BTREE;

--
-- Indeks untuk tabel `learning_set_materials`
--
ALTER TABLE `learning_set_materials`
  ADD PRIMARY KEY (`id_learning_set_materials`) USING BTREE;

--
-- Indeks untuk tabel `learning_set_quiz`
--
ALTER TABLE `learning_set_quiz`
  ADD PRIMARY KEY (`id_learning_set_quiz`) USING BTREE;

--
-- Indeks untuk tabel `learning_set_task`
--
ALTER TABLE `learning_set_task`
  ADD PRIMARY KEY (`id_learning_set_task`) USING BTREE;

--
-- Indeks untuk tabel `learning_syllabus`
--
ALTER TABLE `learning_syllabus`
  ADD PRIMARY KEY (`id_learning_syllabus`) USING BTREE;

--
-- Indeks untuk tabel `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indeks untuk tabel `log_kelas_siswa`
--
ALTER TABLE `log_kelas_siswa`
  ADD PRIMARY KEY (`id_log_kelas_siswa`) USING BTREE;

--
-- Indeks untuk tabel `lowongan`
--
ALTER TABLE `lowongan`
  ADD PRIMARY KEY (`id_lowongan`);

--
-- Indeks untuk tabel `mapel_ajar_pegawai`
--
ALTER TABLE `mapel_ajar_pegawai`
  ADD PRIMARY KEY (`id_mapel_ajar_pegawai`) USING BTREE;

--
-- Indeks untuk tabel `mata_pelajaran`
--
ALTER TABLE `mata_pelajaran`
  ADD PRIMARY KEY (`id_mata_pelajaran`) USING BTREE;

--
-- Indeks untuk tabel `materi`
--
ALTER TABLE `materi`
  ADD PRIMARY KEY (`id_materi`) USING BTREE;

--
-- Indeks untuk tabel `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id_media`) USING BTREE;

--
-- Indeks untuk tabel `media_files`
--
ALTER TABLE `media_files`
  ADD PRIMARY KEY (`id_media_files`) USING BTREE;

--
-- Indeks untuk tabel `modul`
--
ALTER TABLE `modul`
  ADD PRIMARY KEY (`id_modul`);

--
-- Indeks untuk tabel `nilai_keterampilan`
--
ALTER TABLE `nilai_keterampilan`
  ADD PRIMARY KEY (`id_nilai_keterampilan`) USING BTREE;

--
-- Indeks untuk tabel `nilai_pas`
--
ALTER TABLE `nilai_pas`
  ADD PRIMARY KEY (`id_nilai_pas`) USING BTREE;

--
-- Indeks untuk tabel `nilai_pengetahuan`
--
ALTER TABLE `nilai_pengetahuan`
  ADD PRIMARY KEY (`id_nilai_pengetahuan`) USING BTREE;

--
-- Indeks untuk tabel `nilai_pkg`
--
ALTER TABLE `nilai_pkg`
  ADD PRIMARY KEY (`id_nilai_pkg`) USING BTREE;

--
-- Indeks untuk tabel `nilai_pts`
--
ALTER TABLE `nilai_pts`
  ADD PRIMARY KEY (`id_nilai_pts`) USING BTREE;

--
-- Indeks untuk tabel `notulensi_rapat`
--
ALTER TABLE `notulensi_rapat`
  ADD PRIMARY KEY (`id_notulensi_rapat`) USING BTREE;

--
-- Indeks untuk tabel `oas`
--
ALTER TABLE `oas`
  ADD PRIMARY KEY (`id_oas`) USING BTREE;

--
-- Indeks untuk tabel `oas_kelas`
--
ALTER TABLE `oas_kelas`
  ADD PRIMARY KEY (`id_oas_kelas`) USING BTREE;

--
-- Indeks untuk tabel `oas_soal`
--
ALTER TABLE `oas_soal`
  ADD PRIMARY KEY (`id_oas_soal`) USING BTREE;

--
-- Indeks untuk tabel `organisasi_pegawai`
--
ALTER TABLE `organisasi_pegawai`
  ADD PRIMARY KEY (`id_organisasi_pegawai`) USING BTREE;

--
-- Indeks untuk tabel `pelanggaran_siswa`
--
ALTER TABLE `pelanggaran_siswa`
  ADD PRIMARY KEY (`id_pelanggaran_siswa`) USING BTREE;

--
-- Indeks untuk tabel `pemasukan_lain`
--
ALTER TABLE `pemasukan_lain`
  ADD PRIMARY KEY (`id_pemasukan_lain`) USING BTREE;

--
-- Indeks untuk tabel `pembayaran_spp`
--
ALTER TABLE `pembayaran_spp`
  ADD PRIMARY KEY (`id_pembayaran_spp`) USING BTREE;

--
-- Indeks untuk tabel `pendaftaran`
--
ALTER TABLE `pendaftaran`
  ADD PRIMARY KEY (`id_pendaftaran`) USING BTREE;

--
-- Indeks untuk tabel `pendidikan_pegawai`
--
ALTER TABLE `pendidikan_pegawai`
  ADD PRIMARY KEY (`id_pendidikan_pegawai`) USING BTREE;

--
-- Indeks untuk tabel `penerimaan`
--
ALTER TABLE `penerimaan`
  ADD PRIMARY KEY (`id_penerimaan`) USING BTREE;

--
-- Indeks untuk tabel `penerimaan_alumni`
--
ALTER TABLE `penerimaan_alumni`
  ADD PRIMARY KEY (`id_penerimaan_alumni`);

--
-- Indeks untuk tabel `pengeluaran_lain`
--
ALTER TABLE `pengeluaran_lain`
  ADD PRIMARY KEY (`id_pengeluaran_lain`) USING BTREE;

--
-- Indeks untuk tabel `pengumuman`
--
ALTER TABLE `pengumuman`
  ADD PRIMARY KEY (`id_pengumuman`);

--
-- Indeks untuk tabel `penilaian_kinerja_guru`
--
ALTER TABLE `penilaian_kinerja_guru`
  ADD PRIMARY KEY (`id_penilaian_kinerja_guru`) USING BTREE;

--
-- Indeks untuk tabel `persentase_guru`
--
ALTER TABLE `persentase_guru`
  ADD PRIMARY KEY (`id_persentase_guru`) USING BTREE;

--
-- Indeks untuk tabel `pindah_kelas`
--
ALTER TABLE `pindah_kelas`
  ADD PRIMARY KEY (`id_pindah_kelas`);

--
-- Indeks untuk tabel `poin_pelanggaran`
--
ALTER TABLE `poin_pelanggaran`
  ADD PRIMARY KEY (`id_poin_pelanggaran`) USING BTREE;

--
-- Indeks untuk tabel `ppdb`
--
ALTER TABLE `ppdb`
  ADD PRIMARY KEY (`id_ppdb`) USING BTREE;

--
-- Indeks untuk tabel `predikat_nilai`
--
ALTER TABLE `predikat_nilai`
  ADD PRIMARY KEY (`id_predikat_nilai`) USING BTREE;

--
-- Indeks untuk tabel `predikat_pkg`
--
ALTER TABLE `predikat_pkg`
  ADD PRIMARY KEY (`id_predikat_pkg`) USING BTREE;

--
-- Indeks untuk tabel `presensi_event`
--
ALTER TABLE `presensi_event`
  ADD PRIMARY KEY (`id_presensi_event`) USING BTREE;

--
-- Indeks untuk tabel `presensi_guru`
--
ALTER TABLE `presensi_guru`
  ADD PRIMARY KEY (`id_presensi_guru`) USING BTREE;

--
-- Indeks untuk tabel `presensi_harian`
--
ALTER TABLE `presensi_harian`
  ADD PRIMARY KEY (`id_presensi_harian`) USING BTREE;

--
-- Indeks untuk tabel `presensi_rapor`
--
ALTER TABLE `presensi_rapor`
  ADD PRIMARY KEY (`id_presensi_rapor`) USING BTREE;

--
-- Indeks untuk tabel `prestasi_siswa`
--
ALTER TABLE `prestasi_siswa`
  ADD PRIMARY KEY (`id_prestasi_siswa`) USING BTREE;

--
-- Indeks untuk tabel `provinces`
--
ALTER TABLE `provinces`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indeks untuk tabel `question_cas`
--
ALTER TABLE `question_cas`
  ADD PRIMARY KEY (`id_question_cas`) USING BTREE,
  ADD KEY `idbanksoal_fk` (`idbanksoal_fk`) USING BTREE,
  ADD KEY `idassesmentcas_fk` (`idquiz_fk`) USING BTREE;

--
-- Indeks untuk tabel `quiz`
--
ALTER TABLE `quiz`
  ADD PRIMARY KEY (`id_quiz`) USING BTREE,
  ADD KEY `idmatapelajaran_fk` (`idmatapelajaran_fk`) USING BTREE;

--
-- Indeks untuk tabel `riwayat_kerja_pns_pegawai`
--
ALTER TABLE `riwayat_kerja_pns_pegawai`
  ADD PRIMARY KEY (`id_riwayat_kerja_pns_pegawai`) USING BTREE;

--
-- Indeks untuk tabel `riwayat_kerja_swasta_pegawai`
--
ALTER TABLE `riwayat_kerja_swasta_pegawai`
  ADD PRIMARY KEY (`id_riwayat_kerja_swasta_pegawai`) USING BTREE;

--
-- Indeks untuk tabel `rpp`
--
ALTER TABLE `rpp`
  ADD PRIMARY KEY (`id_rpp`) USING BTREE;

--
-- Indeks untuk tabel `ruangan`
--
ALTER TABLE `ruangan`
  ADD PRIMARY KEY (`id_ruangan`) USING BTREE;

--
-- Indeks untuk tabel `semester`
--
ALTER TABLE `semester`
  ADD PRIMARY KEY (`id_semester`) USING BTREE;

--
-- Indeks untuk tabel `setting_akun`
--
ALTER TABLE `setting_akun`
  ADD PRIMARY KEY (`id_setting_akun`) USING BTREE;

--
-- Indeks untuk tabel `setting_table`
--
ALTER TABLE `setting_table`
  ADD PRIMARY KEY (`id_setting_table`) USING BTREE;

--
-- Indeks untuk tabel `silabus`
--
ALTER TABLE `silabus`
  ADD PRIMARY KEY (`id_silabus`) USING BTREE;

--
-- Indeks untuk tabel `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`id_siswa`) USING BTREE;

--
-- Indeks untuk tabel `siswa_beasiswa`
--
ALTER TABLE `siswa_beasiswa`
  ADD PRIMARY KEY (`id_siswa_beasiswa`) USING BTREE;

--
-- Indeks untuk tabel `siswa_dokumen`
--
ALTER TABLE `siswa_dokumen`
  ADD PRIMARY KEY (`id_siswa_dokumen`) USING BTREE;

--
-- Indeks untuk tabel `siswa_mapel`
--
ALTER TABLE `siswa_mapel`
  ADD PRIMARY KEY (`id_siswa_mapel`) USING BTREE,
  ADD KEY `idsiswa_fk` (`idsiswa_fk`) USING BTREE,
  ADD KEY `idmatapelajaran_fk` (`idmatapelajaran_fk`) USING BTREE;

--
-- Indeks untuk tabel `siswa_prestasi`
--
ALTER TABLE `siswa_prestasi`
  ADD PRIMARY KEY (`id_siswa_prestasi`) USING BTREE;

--
-- Indeks untuk tabel `sosialisasi`
--
ALTER TABLE `sosialisasi`
  ADD PRIMARY KEY (`id_sosialisasi`);

--
-- Indeks untuk tabel `student_account`
--
ALTER TABLE `student_account`
  ADD PRIMARY KEY (`id_student_account`) USING BTREE;

--
-- Indeks untuk tabel `subkompetensi_pkg`
--
ALTER TABLE `subkompetensi_pkg`
  ADD PRIMARY KEY (`id_subkompetensi_pkg`) USING BTREE;

--
-- Indeks untuk tabel `submodul`
--
ALTER TABLE `submodul`
  ADD PRIMARY KEY (`id_submodul`);

--
-- Indeks untuk tabel `suplier`
--
ALTER TABLE `suplier`
  ADD PRIMARY KEY (`id_suplier`) USING BTREE;

--
-- Indeks untuk tabel `surat_keluar`
--
ALTER TABLE `surat_keluar`
  ADD PRIMARY KEY (`id_surat_keluar`) USING BTREE;

--
-- Indeks untuk tabel `surat_masuk`
--
ALTER TABLE `surat_masuk`
  ADD PRIMARY KEY (`id_surat_masuk`) USING BTREE;

--
-- Indeks untuk tabel `tahun_ajaran`
--
ALTER TABLE `tahun_ajaran`
  ADD PRIMARY KEY (`id_tahun_ajaran`) USING BTREE;

--
-- Indeks untuk tabel `tahun_buku`
--
ALTER TABLE `tahun_buku`
  ADD PRIMARY KEY (`id_tahun_buku`) USING BTREE;

--
-- Indeks untuk tabel `tanggungan_alumni`
--
ALTER TABLE `tanggungan_alumni`
  ADD PRIMARY KEY (`id_tanggungan_alumni`);

--
-- Indeks untuk tabel `tanggungan_siswa`
--
ALTER TABLE `tanggungan_siswa`
  ADD PRIMARY KEY (`id_tanggungan_siswa`) USING BTREE;

--
-- Indeks untuk tabel `task`
--
ALTER TABLE `task`
  ADD PRIMARY KEY (`id_task`) USING BTREE;

--
-- Indeks untuk tabel `task_answer`
--
ALTER TABLE `task_answer`
  ADD PRIMARY KEY (`id_task_answer`) USING BTREE;

--
-- Indeks untuk tabel `tindakan_catatan_siswa`
--
ALTER TABLE `tindakan_catatan_siswa`
  ADD PRIMARY KEY (`id_tindakan_catatan_siswa`) USING BTREE;

--
-- Indeks untuk tabel `tingkat`
--
ALTER TABLE `tingkat`
  ADD PRIMARY KEY (`id_tingkat`) USING BTREE;

--
-- Indeks untuk tabel `transaksi_saldo`
--
ALTER TABLE `transaksi_saldo`
  ADD PRIMARY KEY (`id_transaksi`) USING BTREE;

--
-- Indeks untuk tabel `transaksi_tanggungan_alumni`
--
ALTER TABLE `transaksi_tanggungan_alumni`
  ADD PRIMARY KEY (`id_transaksi_tanggungan_alumni`);

--
-- Indeks untuk tabel `transaksi_tanggungan_siswa`
--
ALTER TABLE `transaksi_tanggungan_siswa`
  ADD PRIMARY KEY (`id_transaksi_tanggungan_siswa`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indeks untuk tabel `users_groups`
--
ALTER TABLE `users_groups`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `uc_users_groups` (`user_id`,`group_id`) USING BTREE,
  ADD KEY `fk_users_groups_users1_idx` (`user_id`) USING BTREE,
  ADD KEY `fk_users_groups_groups1_idx` (`group_id`) USING BTREE;

--
-- Indeks untuk tabel `user_modul`
--
ALTER TABLE `user_modul`
  ADD PRIMARY KEY (`id_user_modul`);

--
-- Indeks untuk tabel `wali_kelas`
--
ALTER TABLE `wali_kelas`
  ADD PRIMARY KEY (`id_wali_kelas`) USING BTREE;

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `absensi`
--
ALTER TABLE `absensi`
  MODIFY `id_absensi` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `additional_setting`
--
ALTER TABLE `additional_setting`
  MODIFY `id_additional_setting` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `akun`
--
ALTER TABLE `akun`
  MODIFY `id_akun` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT untuk tabel `alumni`
--
ALTER TABLE `alumni`
  MODIFY `id_alumni` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `anak_pegawai`
--
ALTER TABLE `anak_pegawai`
  MODIFY `id_anak_pegawai` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `ans_bank_soal`
--
ALTER TABLE `ans_bank_soal`
  MODIFY `id_ans_bank_soal` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `bank_soal`
--
ALTER TABLE `bank_soal`
  MODIFY `id_bank_soal` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `blog_article`
--
ALTER TABLE `blog_article`
  MODIFY `id_blog_article` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `blog_course`
--
ALTER TABLE `blog_course`
  MODIFY `id_blog_course` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `blog_setting`
--
ALTER TABLE `blog_setting`
  MODIFY `id_blog_setting` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `blog_slider`
--
ALTER TABLE `blog_slider`
  MODIFY `id_blog_slider` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `blog_teacher`
--
ALTER TABLE `blog_teacher`
  MODIFY `id_blog_teacher` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `buku_pemanggilan_siswa`
--
ALTER TABLE `buku_pemanggilan_siswa`
  MODIFY `id_buku_pemanggilan_siswa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `buku_tamu`
--
ALTER TABLE `buku_tamu`
  MODIFY `id_buku_tamu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `catatan_siswa`
--
ALTER TABLE `catatan_siswa`
  MODIFY `id_catatan_siswa` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `cities`
--
ALTER TABLE `cities`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=500;

--
-- AUTO_INCREMENT untuk tabel `coa`
--
ALTER TABLE `coa`
  MODIFY `id_coa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `component_jadwal`
--
ALTER TABLE `component_jadwal`
  MODIFY `id_component_jadwal` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `component_penilaian_kinerja_guru`
--
ALTER TABLE `component_penilaian_kinerja_guru`
  MODIFY `id_component_penilaian_kinerja_guru` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `department`
--
ALTER TABLE `department`
  MODIFY `id_department` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `detail_pemasukan_lain`
--
ALTER TABLE `detail_pemasukan_lain`
  MODIFY `id_detail_pemasukan_lain` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `detail_pengeluaran_lain`
--
ALTER TABLE `detail_pengeluaran_lain`
  MODIFY `id_detail_pengeluaran_lain` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `detail_transaksi_tanggungan_alumni`
--
ALTER TABLE `detail_transaksi_tanggungan_alumni`
  MODIFY `id_detail_transaksi_tanggungan_alumni` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `detail_transaksi_tanggungan_siswa`
--
ALTER TABLE `detail_transaksi_tanggungan_siswa`
  MODIFY `id_detail_transaksi_tanggungan_siswa` int(1) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `dokumen_pegawai`
--
ALTER TABLE `dokumen_pegawai`
  MODIFY `id_dokumen_pegawai` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `dudi`
--
ALTER TABLE `dudi`
  MODIFY `id_dudi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `erapor`
--
ALTER TABLE `erapor`
  MODIFY `id_erapor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `event`
--
ALTER TABLE `event`
  MODIFY `id_event` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `file_oas`
--
ALTER TABLE `file_oas`
  MODIFY `id_file_oas` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `file_rapor_online`
--
ALTER TABLE `file_rapor_online`
  MODIFY `id_file_rapor_online` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `groups`
--
ALTER TABLE `groups`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `guru`
--
ALTER TABLE `guru`
  MODIFY `id_guru` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT untuk tabel `guru_mapel`
--
ALTER TABLE `guru_mapel`
  MODIFY `id_guru_mapel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `hari`
--
ALTER TABLE `hari`
  MODIFY `id_hari` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `hobi_pegawai`
--
ALTER TABLE `hobi_pegawai`
  MODIFY `id_hobi_pegawai` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `induk_akun`
--
ALTER TABLE `induk_akun`
  MODIFY `id_induk_akun` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `input_nilai_keterampilan`
--
ALTER TABLE `input_nilai_keterampilan`
  MODIFY `id_input_nilai_keterampilan` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `input_nilai_pas`
--
ALTER TABLE `input_nilai_pas`
  MODIFY `id_input_nilai_pas` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `input_nilai_pengetahuan`
--
ALTER TABLE `input_nilai_pengetahuan`
  MODIFY `id_input_nilai_pengetahuan` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `input_nilai_pts`
--
ALTER TABLE `input_nilai_pts`
  MODIFY `id_input_nilai_pts` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `iuran_wajib_siswa`
--
ALTER TABLE `iuran_wajib_siswa`
  MODIFY `id_iuran_wajib_siswa` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `jadwal`
--
ALTER TABLE `jadwal`
  MODIFY `id_jadwal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `jadwal_guru`
--
ALTER TABLE `jadwal_guru`
  MODIFY `id_jadwal_guru` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `jadwal_pelajaran`
--
ALTER TABLE `jadwal_pelajaran`
  MODIFY `id_jadwal_pelajaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `jam`
--
ALTER TABLE `jam`
  MODIFY `id_jam` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `jam_pelajaran`
--
ALTER TABLE `jam_pelajaran`
  MODIFY `id_jam_pelajaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `jenis_kerjasama`
--
ALTER TABLE `jenis_kerjasama`
  MODIFY `id_jenis_kerjasama` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `jenis_keterampilan`
--
ALTER TABLE `jenis_keterampilan`
  MODIFY `id_jenis_keterampilan` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `jenis_mata_pelajaran`
--
ALTER TABLE `jenis_mata_pelajaran`
  MODIFY `id_jenis_mata_pelajaran` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `jenis_pelanggaran`
--
ALTER TABLE `jenis_pelanggaran`
  MODIFY `id_jenis_pelanggaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `jenis_penerimaan`
--
ALTER TABLE `jenis_penerimaan`
  MODIFY `id_jenis_penerimaan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `jenis_pengetahuan`
--
ALTER TABLE `jenis_pengetahuan`
  MODIFY `id_jenis_pengetahuan` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `jenis_penilaian`
--
ALTER TABLE `jenis_penilaian`
  MODIFY `id_jenis_penilaian` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `jurnal_guru`
--
ALTER TABLE `jurnal_guru`
  MODIFY `id_jurnal_guru` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `jurnal_umum`
--
ALTER TABLE `jurnal_umum`
  MODIFY `id_jurnal_umum` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=457;

--
-- AUTO_INCREMENT untuk tabel `jurusan`
--
ALTER TABLE `jurusan`
  MODIFY `id_jurusan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `kaprog`
--
ALTER TABLE `kaprog`
  MODIFY `id_kaprog` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `kd`
--
ALTER TABLE `kd`
  MODIFY `id_kd` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `kelas`
--
ALTER TABLE `kelas`
  MODIFY `id_kelas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT untuk tabel `kelas_erapor`
--
ALTER TABLE `kelas_erapor`
  MODIFY `id_kelas_erapor` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `kelas_oas`
--
ALTER TABLE `kelas_oas`
  MODIFY `id_kelas_oas` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `kerjasama_dudi`
--
ALTER TABLE `kerjasama_dudi`
  MODIFY `id_kerjasama_dudi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `kompetensi_pkg`
--
ALTER TABLE `kompetensi_pkg`
  MODIFY `id_kompetensi_pkg` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `koperasi_member`
--
ALTER TABLE `koperasi_member`
  MODIFY `id_koperasi_member` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `kursus_pegawai`
--
ALTER TABLE `kursus_pegawai`
  MODIFY `id_kursus_pegawai` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `learning`
--
ALTER TABLE `learning`
  MODIFY `id_learning` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `learning_course`
--
ALTER TABLE `learning_course`
  MODIFY `id_learning_course` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `learning_lessons`
--
ALTER TABLE `learning_lessons`
  MODIFY `id_learning_lessons` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `learning_materials`
--
ALTER TABLE `learning_materials`
  MODIFY `id_learning_materials` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `learning_set_materials`
--
ALTER TABLE `learning_set_materials`
  MODIFY `id_learning_set_materials` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `learning_set_quiz`
--
ALTER TABLE `learning_set_quiz`
  MODIFY `id_learning_set_quiz` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `learning_set_task`
--
ALTER TABLE `learning_set_task`
  MODIFY `id_learning_set_task` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `learning_syllabus`
--
ALTER TABLE `learning_syllabus`
  MODIFY `id_learning_syllabus` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `log_kelas_siswa`
--
ALTER TABLE `log_kelas_siswa`
  MODIFY `id_log_kelas_siswa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `lowongan`
--
ALTER TABLE `lowongan`
  MODIFY `id_lowongan` int(11) NOT NULL AUTO_INCREMENT COMMENT ' ', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `mapel_ajar_pegawai`
--
ALTER TABLE `mapel_ajar_pegawai`
  MODIFY `id_mapel_ajar_pegawai` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `mata_pelajaran`
--
ALTER TABLE `mata_pelajaran`
  MODIFY `id_mata_pelajaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `materi`
--
ALTER TABLE `materi`
  MODIFY `id_materi` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `media`
--
ALTER TABLE `media`
  MODIFY `id_media` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `media_files`
--
ALTER TABLE `media_files`
  MODIFY `id_media_files` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `modul`
--
ALTER TABLE `modul`
  MODIFY `id_modul` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `nilai_keterampilan`
--
ALTER TABLE `nilai_keterampilan`
  MODIFY `id_nilai_keterampilan` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `nilai_pas`
--
ALTER TABLE `nilai_pas`
  MODIFY `id_nilai_pas` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `nilai_pengetahuan`
--
ALTER TABLE `nilai_pengetahuan`
  MODIFY `id_nilai_pengetahuan` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `nilai_pkg`
--
ALTER TABLE `nilai_pkg`
  MODIFY `id_nilai_pkg` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `nilai_pts`
--
ALTER TABLE `nilai_pts`
  MODIFY `id_nilai_pts` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `notulensi_rapat`
--
ALTER TABLE `notulensi_rapat`
  MODIFY `id_notulensi_rapat` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `oas`
--
ALTER TABLE `oas`
  MODIFY `id_oas` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `oas_kelas`
--
ALTER TABLE `oas_kelas`
  MODIFY `id_oas_kelas` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `oas_soal`
--
ALTER TABLE `oas_soal`
  MODIFY `id_oas_soal` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `organisasi_pegawai`
--
ALTER TABLE `organisasi_pegawai`
  MODIFY `id_organisasi_pegawai` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pelanggaran_siswa`
--
ALTER TABLE `pelanggaran_siswa`
  MODIFY `id_pelanggaran_siswa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `pemasukan_lain`
--
ALTER TABLE `pemasukan_lain`
  MODIFY `id_pemasukan_lain` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pembayaran_spp`
--
ALTER TABLE `pembayaran_spp`
  MODIFY `id_pembayaran_spp` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pendaftaran`
--
ALTER TABLE `pendaftaran`
  MODIFY `id_pendaftaran` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pendidikan_pegawai`
--
ALTER TABLE `pendidikan_pegawai`
  MODIFY `id_pendidikan_pegawai` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `penerimaan`
--
ALTER TABLE `penerimaan`
  MODIFY `id_penerimaan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `penerimaan_alumni`
--
ALTER TABLE `penerimaan_alumni`
  MODIFY `id_penerimaan_alumni` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `pengeluaran_lain`
--
ALTER TABLE `pengeluaran_lain`
  MODIFY `id_pengeluaran_lain` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pengumuman`
--
ALTER TABLE `pengumuman`
  MODIFY `id_pengumuman` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `penilaian_kinerja_guru`
--
ALTER TABLE `penilaian_kinerja_guru`
  MODIFY `id_penilaian_kinerja_guru` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `persentase_guru`
--
ALTER TABLE `persentase_guru`
  MODIFY `id_persentase_guru` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pindah_kelas`
--
ALTER TABLE `pindah_kelas`
  MODIFY `id_pindah_kelas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `poin_pelanggaran`
--
ALTER TABLE `poin_pelanggaran`
  MODIFY `id_poin_pelanggaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `ppdb`
--
ALTER TABLE `ppdb`
  MODIFY `id_ppdb` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `predikat_nilai`
--
ALTER TABLE `predikat_nilai`
  MODIFY `id_predikat_nilai` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `predikat_pkg`
--
ALTER TABLE `predikat_pkg`
  MODIFY `id_predikat_pkg` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `presensi_event`
--
ALTER TABLE `presensi_event`
  MODIFY `id_presensi_event` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `presensi_guru`
--
ALTER TABLE `presensi_guru`
  MODIFY `id_presensi_guru` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `presensi_harian`
--
ALTER TABLE `presensi_harian`
  MODIFY `id_presensi_harian` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `presensi_rapor`
--
ALTER TABLE `presensi_rapor`
  MODIFY `id_presensi_rapor` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `prestasi_siswa`
--
ALTER TABLE `prestasi_siswa`
  MODIFY `id_prestasi_siswa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `provinces`
--
ALTER TABLE `provinces`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT untuk tabel `question_cas`
--
ALTER TABLE `question_cas`
  MODIFY `id_question_cas` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `quiz`
--
ALTER TABLE `quiz`
  MODIFY `id_quiz` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `riwayat_kerja_pns_pegawai`
--
ALTER TABLE `riwayat_kerja_pns_pegawai`
  MODIFY `id_riwayat_kerja_pns_pegawai` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `riwayat_kerja_swasta_pegawai`
--
ALTER TABLE `riwayat_kerja_swasta_pegawai`
  MODIFY `id_riwayat_kerja_swasta_pegawai` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `rpp`
--
ALTER TABLE `rpp`
  MODIFY `id_rpp` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `ruangan`
--
ALTER TABLE `ruangan`
  MODIFY `id_ruangan` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `semester`
--
ALTER TABLE `semester`
  MODIFY `id_semester` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `setting_akun`
--
ALTER TABLE `setting_akun`
  MODIFY `id_setting_akun` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `setting_table`
--
ALTER TABLE `setting_table`
  MODIFY `id_setting_table` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `silabus`
--
ALTER TABLE `silabus`
  MODIFY `id_silabus` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `siswa`
--
ALTER TABLE `siswa`
  MODIFY `id_siswa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=745;

--
-- AUTO_INCREMENT untuk tabel `siswa_beasiswa`
--
ALTER TABLE `siswa_beasiswa`
  MODIFY `id_siswa_beasiswa` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `siswa_dokumen`
--
ALTER TABLE `siswa_dokumen`
  MODIFY `id_siswa_dokumen` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `siswa_mapel`
--
ALTER TABLE `siswa_mapel`
  MODIFY `id_siswa_mapel` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `siswa_prestasi`
--
ALTER TABLE `siswa_prestasi`
  MODIFY `id_siswa_prestasi` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `sosialisasi`
--
ALTER TABLE `sosialisasi`
  MODIFY `id_sosialisasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `student_account`
--
ALTER TABLE `student_account`
  MODIFY `id_student_account` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `subkompetensi_pkg`
--
ALTER TABLE `subkompetensi_pkg`
  MODIFY `id_subkompetensi_pkg` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `submodul`
--
ALTER TABLE `submodul`
  MODIFY `id_submodul` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `suplier`
--
ALTER TABLE `suplier`
  MODIFY `id_suplier` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `surat_keluar`
--
ALTER TABLE `surat_keluar`
  MODIFY `id_surat_keluar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `surat_masuk`
--
ALTER TABLE `surat_masuk`
  MODIFY `id_surat_masuk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `tahun_ajaran`
--
ALTER TABLE `tahun_ajaran`
  MODIFY `id_tahun_ajaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `tahun_buku`
--
ALTER TABLE `tahun_buku`
  MODIFY `id_tahun_buku` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tanggungan_alumni`
--
ALTER TABLE `tanggungan_alumni`
  MODIFY `id_tanggungan_alumni` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `tanggungan_siswa`
--
ALTER TABLE `tanggungan_siswa`
  MODIFY `id_tanggungan_siswa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=207;

--
-- AUTO_INCREMENT untuk tabel `task`
--
ALTER TABLE `task`
  MODIFY `id_task` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `task_answer`
--
ALTER TABLE `task_answer`
  MODIFY `id_task_answer` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tindakan_catatan_siswa`
--
ALTER TABLE `tindakan_catatan_siswa`
  MODIFY `id_tindakan_catatan_siswa` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tingkat`
--
ALTER TABLE `tingkat`
  MODIFY `id_tingkat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `transaksi_saldo`
--
ALTER TABLE `transaksi_saldo`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT untuk tabel `transaksi_tanggungan_alumni`
--
ALTER TABLE `transaksi_tanggungan_alumni`
  MODIFY `id_transaksi_tanggungan_alumni` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `transaksi_tanggungan_siswa`
--
ALTER TABLE `transaksi_tanggungan_siswa`
  MODIFY `id_transaksi_tanggungan_siswa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `users_groups`
--
ALTER TABLE `users_groups`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `user_modul`
--
ALTER TABLE `user_modul`
  MODIFY `id_user_modul` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `wali_kelas`
--
ALTER TABLE `wali_kelas`
  MODIFY `id_wali_kelas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `bank_soal`
--
ALTER TABLE `bank_soal`
  ADD CONSTRAINT `bank_soal_ibfk_1` FOREIGN KEY (`idmatapelajaran_fk`) REFERENCES `mata_pelajaran` (`id_mata_pelajaran`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bank_soal_ibfk_2` FOREIGN KEY (`idguru_fk`) REFERENCES `guru` (`id_guru`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `detail_transaksi_tanggungan_siswa`
--
ALTER TABLE `detail_transaksi_tanggungan_siswa`
  ADD CONSTRAINT `detail_transaksi_tanggungan_siswa_ibfk_1` FOREIGN KEY (`idtransaksitanggungansiswa_fk`) REFERENCES `transaksi_tanggungan_siswa` (`id_transaksi_tanggungan_siswa`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `guru_mapel`
--
ALTER TABLE `guru_mapel`
  ADD CONSTRAINT `guru_mapel_ibfk_1` FOREIGN KEY (`idguru_fk`) REFERENCES `guru` (`id_guru`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `guru_mapel_ibfk_2` FOREIGN KEY (`idmapel_fk`) REFERENCES `mata_pelajaran` (`id_mata_pelajaran`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `kelas`
--
ALTER TABLE `kelas`
  ADD CONSTRAINT `kelas_ibfk_1` FOREIGN KEY (`idtingkat_fk`) REFERENCES `tingkat` (`id_tingkat`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `learning`
--
ALTER TABLE `learning`
  ADD CONSTRAINT `learning_ibfk_1` FOREIGN KEY (`idmatapelajaran_fk`) REFERENCES `mata_pelajaran` (`id_mata_pelajaran`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `learning_ibfk_2` FOREIGN KEY (`iduser_fk`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `learning_ibfk_3` FOREIGN KEY (`idtingkat_fk`) REFERENCES `tingkat` (`id_tingkat`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `question_cas`
--
ALTER TABLE `question_cas`
  ADD CONSTRAINT `question_cas_ibfk_1` FOREIGN KEY (`idbanksoal_fk`) REFERENCES `bank_soal` (`id_bank_soal`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `question_cas_ibfk_2` FOREIGN KEY (`idquiz_fk`) REFERENCES `quiz` (`id_quiz`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `quiz`
--
ALTER TABLE `quiz`
  ADD CONSTRAINT `quiz_ibfk_1` FOREIGN KEY (`idmatapelajaran_fk`) REFERENCES `mata_pelajaran` (`id_mata_pelajaran`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `siswa_mapel`
--
ALTER TABLE `siswa_mapel`
  ADD CONSTRAINT `siswa_mapel_ibfk_1` FOREIGN KEY (`idsiswa_fk`) REFERENCES `siswa` (`id_siswa`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `siswa_mapel_ibfk_2` FOREIGN KEY (`idmatapelajaran_fk`) REFERENCES `mata_pelajaran` (`id_mata_pelajaran`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `users_groups`
--
ALTER TABLE `users_groups`
  ADD CONSTRAINT `users_groups_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `users_groups_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
