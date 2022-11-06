/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 100138
 Source Host           : localhost:3306
 Source Schema         : edulite

 Target Server Type    : MySQL
 Target Server Version : 100138
 File Encoding         : 65001

 Date: 06/11/2022 08:17:25
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for absensi
-- ----------------------------
DROP TABLE IF EXISTS `absensi`;
CREATE TABLE `absensi`  (
  `id_absensi` int(11) NOT NULL AUTO_INCREMENT,
  `idsiswa_fk` int(11) NULL DEFAULT NULL,
  `tanggal` date NULL DEFAULT NULL,
  `idmatapelajaran_fk` int(11) NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL COMMENT '0=>tidak masuk, 1 => masuk, 2 => ijin/sakit/ll',
  `keterangan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `idjam_fk` int(11) NULL DEFAULT NULL,
  `idguru_fk` int(11) NULL DEFAULT NULL,
  `idkelas_fk` int(11) NULL DEFAULT NULL,
  `create_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_absensi`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for additional_setting
-- ----------------------------
DROP TABLE IF EXISTS `additional_setting`;
CREATE TABLE `additional_setting`  (
  `id_additional_setting` int(11) NOT NULL AUTO_INCREMENT,
  `key_add` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `value_add` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`id_additional_setting`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of additional_setting
-- ----------------------------
INSERT INTO `additional_setting` VALUES (1, 'city_id', '255');
INSERT INTO `additional_setting` VALUES (2, 'province_id', '11');
INSERT INTO `additional_setting` VALUES (3, 'province', 'Jawa Timur');
INSERT INTO `additional_setting` VALUES (4, 'city', 'Kabupaten Malang');
INSERT INTO `additional_setting` VALUES (5, 'type', 'Kabupaten');
INSERT INTO `additional_setting` VALUES (6, 'postal_code', '65162');
INSERT INTO `additional_setting` VALUES (9, 'jenis_pengiriman', '[{\"text\":\"POS Indonesia\",\"val\":\"pos\"},{\"text\":\"JNE\",\"val\":\"jne\"},{\"text\":\"Tiki\",\"val\":\"tiki\"}]');
INSERT INTO `additional_setting` VALUES (10, 'jenis_pembayaran', '[{\"text\":\"Bank BCA\",\"no_rek\":\"12321312312312\",\"atas_nama\":\"Rendy Yani Susanto\"},{\"text\":\"Bank BRI\",\"no_rek\":\"43432\",\"atas_nama\":\"Cicik Winarsih\"},{\"text\":\"Bank BNI\",\"no_rek\":\"56566\",\"atas_nama\":\"Rendy Yani Susanto\"}]');

-- ----------------------------
-- Table structure for akun
-- ----------------------------
DROP TABLE IF EXISTS `akun`;
CREATE TABLE `akun`  (
  `id_akun` int(11) NOT NULL AUTO_INCREMENT,
  `no_ref` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `nama` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `idindukakun_fk` int(11) NULL DEFAULT NULL,
  `saldo_normal` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `create_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `is_edit` int(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id_akun`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of akun
-- ----------------------------
INSERT INTO `akun` VALUES (1, '1101', 'Kas', 1, 'D', '2020-12-11 16:39:34', 0);
INSERT INTO `akun` VALUES (2, '1102', 'BANK', 1, 'D', '2020-12-11 16:39:44', 0);
INSERT INTO `akun` VALUES (3, '1103', 'Deposito', 1, 'D', '2020-12-11 16:39:55', 0);
INSERT INTO `akun` VALUES (4, '1104', 'Piutang', 1, 'D', '2020-12-11 16:40:04', 0);
INSERT INTO `akun` VALUES (5, '1105', 'Perlengkapan', 1, 'D', '2020-12-11 16:40:12', 0);
INSERT INTO `akun` VALUES (6, '1201', 'Aktiva Tetap', 2, 'D', '2020-12-11 16:40:39', 0);
INSERT INTO `akun` VALUES (7, '1202', 'Penyusutan', 2, 'D', '2020-12-11 16:40:47', 0);
INSERT INTO `akun` VALUES (8, '1203', 'Investasi', 2, 'D', '2020-12-11 16:40:58', 0);
INSERT INTO `akun` VALUES (9, '2101', 'Hutang Usaha', 3, 'K', '2020-12-11 16:41:10', 0);
INSERT INTO `akun` VALUES (10, '2102', 'Hutang Pajak', 3, 'K', '2020-12-11 16:41:22', 0);
INSERT INTO `akun` VALUES (11, '2103', 'Kewajiban Lancar Lain', 3, 'K', '2020-12-11 16:41:35', 0);
INSERT INTO `akun` VALUES (12, '2201', 'Hutang Pihak ke 3', 4, 'K', '2020-12-11 16:41:49', 0);
INSERT INTO `akun` VALUES (13, '2202', 'Hutang Program Lain', 4, 'K', '2020-12-11 16:42:01', 0);
INSERT INTO `akun` VALUES (14, '2203', 'Kewajiban Jangka Panjang Lain', 4, 'K', '2020-12-11 16:42:16', 0);
INSERT INTO `akun` VALUES (15, '3101', 'Modal Usaha', 5, 'K', '2020-12-11 16:42:26', 0);
INSERT INTO `akun` VALUES (16, '3102', 'Prive', 5, 'D', '2020-12-11 16:42:35', 0);
INSERT INTO `akun` VALUES (17, '4101', 'Donasi', 6, 'D', '2020-12-11 16:42:47', 0);
INSERT INTO `akun` VALUES (18, '4102', 'Sumbangan', 6, 'D', '2020-12-11 16:42:55', 0);
INSERT INTO `akun` VALUES (19, '4201', 'Penghasilan Layanan', 7, 'K', '2020-12-11 16:43:12', 0);
INSERT INTO `akun` VALUES (20, '4202', 'Pendapatan', 7, 'K', '2020-12-11 16:43:35', 0);
INSERT INTO `akun` VALUES (21, '4301', 'Pendapatan Lain', 8, 'K', '2020-12-11 16:44:06', 0);
INSERT INTO `akun` VALUES (22, '5101', 'Beban Gaji', 9, 'D', '2020-12-11 16:44:15', 0);
INSERT INTO `akun` VALUES (23, '5102', 'Biaya Perjalanan', 9, 'D', '2020-12-11 16:44:27', 0);
INSERT INTO `akun` VALUES (24, '5103', 'Biaya Kantor', 9, 'D', '2020-12-11 16:44:42', 0);
INSERT INTO `akun` VALUES (25, '5104', 'Biaya Sewa', 9, 'D', '2020-12-11 16:44:52', 0);
INSERT INTO `akun` VALUES (26, '5105', 'Biaya Pemeliharaan', 9, 'D', '2020-12-11 16:45:02', 0);
INSERT INTO `akun` VALUES (27, '5106', 'Biaya Rapat', 9, 'D', '2020-12-11 16:45:14', 0);
INSERT INTO `akun` VALUES (28, '5107', 'Biaya Lain', 9, 'D', '2020-12-11 16:45:20', 0);
INSERT INTO `akun` VALUES (32, '1107', 'Dana Koperasi', 1, 'D', '2022-01-20 12:09:40', 1);
INSERT INTO `akun` VALUES (33, '4103', 'Diskon SPP', 6, 'D', '2022-01-20 15:46:37', 1);
INSERT INTO `akun` VALUES (34, '1109', 'Kas Jurusan ', 1, 'D', '2022-01-23 15:38:53', 1);
INSERT INTO `akun` VALUES (35, '4104', 'Diskon Lain', 6, 'D', '2022-07-23 08:31:56', 1);
INSERT INTO `akun` VALUES (36, '1108', 'Kas APHP', 1, 'D', '2022-07-27 07:46:02', 1);
INSERT INTO `akun` VALUES (37, '1109', 'Kas Multimedia', 1, 'D', '2022-08-03 20:44:35', 1);

-- ----------------------------
-- Table structure for alumni
-- ----------------------------
DROP TABLE IF EXISTS `alumni`;
CREATE TABLE `alumni`  (
  `id_alumni` int(11) NOT NULL AUTO_INCREMENT,
  `nama` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `tahun_lulus` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `alamat` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `no_hp` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `kuliah` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `menikah` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `bekerja` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `pesantren` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `create_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `lng` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `lat` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `nis` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `tahun_masuk` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `jurusan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `agama` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `nisn` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `no_ijazah_sekolah_asal` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `no_skhun_sekolah_asal` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `no_un_sekolah_asal` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `no_kk` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `npsn_sekolah_asal` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `nama_sekolah_asal` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `tempat_lahir` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `tanggal_lahir` date NULL DEFAULT NULL,
  `berkebutuhan_khusus` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `dusun` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `rt` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `rw` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `kelurahan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `foto` text CHARACTER SET hp8 COLLATE hp8_english_ci NULL,
  `idprovince_fk` int(11) NULL DEFAULT NULL,
  `idcities_fk` int(11) NULL DEFAULT NULL,
  `nama_ayah` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `tempat_lahir_ayah` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `tanggal_lahir_ayah` date NULL DEFAULT NULL,
  `pendidikan_ayah` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `pekerjaan_ayah` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `penghasilan_ayah` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `nama_ibu` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `tempat_lahir_ibu` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `tanggal_lahir_ibu` date NULL DEFAULT NULL,
  `pendidikan_ibu` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `pekerjaan_ibu` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `penghasilan_ibu` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `tinggi_badan` int(11) NULL DEFAULT NULL,
  `berat_badan` int(11) NULL DEFAULT NULL,
  `jarak_ke_sekolah` int(255) NULL DEFAULT NULL,
  `waktu_ke_sekolah` int(255) NULL DEFAULT NULL,
  `jumlah_saudara` int(255) NULL DEFAULT NULL,
  `jenis_kelamin` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `is_siswa_id` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id_alumni`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of alumni
-- ----------------------------
INSERT INTO `alumni` VALUES (4, 'ALBET DIMAS NURFENDI PRATAMA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-19 17:46:57', NULL, NULL, '', NULL, 'Agribisnis Pengolahan Hasil Pertanian', NULL, '0036078764', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 594);
INSERT INTO `alumni` VALUES (6, 'ARIEF WAHYUDI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-22 09:43:40', NULL, NULL, '', NULL, 'Agribisnis Pengolahan Hasil Pertanian', NULL, '0028843265', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 595);
INSERT INTO `alumni` VALUES (7, 'ETIK MULYANI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-22 09:43:40', NULL, NULL, '', NULL, 'Agribisnis Pengolahan Hasil Pertanian', NULL, '0024950260', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 596);
INSERT INTO `alumni` VALUES (8, 'FARA AGUN YUNANTO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-22 09:43:40', NULL, NULL, '', NULL, 'Agribisnis Pengolahan Hasil Pertanian', NULL, '0028095705', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 597);
INSERT INTO `alumni` VALUES (9, 'LINDA AIDA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-22 09:43:40', NULL, NULL, '', NULL, 'Agribisnis Pengolahan Hasil Pertanian', NULL, '0036417497', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 598);
INSERT INTO `alumni` VALUES (10, 'SAHID', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-22 09:43:40', NULL, NULL, '', NULL, 'Agribisnis Pengolahan Hasil Pertanian', NULL, '0034071069', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 599);
INSERT INTO `alumni` VALUES (11, 'SITI KOMAIROH', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-22 09:43:40', NULL, NULL, '', NULL, 'Agribisnis Pengolahan Hasil Pertanian', NULL, '0042154375', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 600);
INSERT INTO `alumni` VALUES (12, 'YOSEPTY NURUL FERRISA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-22 09:43:40', NULL, NULL, '', NULL, 'Agribisnis Pengolahan Hasil Pertanian', NULL, '0042138354', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 601);
INSERT INTO `alumni` VALUES (13, 'AHMAD ARHAM ARDIYA PUTRA', '2022', NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-22 16:29:21', NULL, NULL, '', NULL, 'Teknik dan Bisnis Sepeda Motor', NULL, '3025057810', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 646);
INSERT INTO `alumni` VALUES (14, 'AHMAD ZAINURI MAKRUF', '2022', NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-22 18:14:33', NULL, NULL, '', NULL, 'Teknik dan Bisnis Sepeda Motor', NULL, '0036416117', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 647);

-- ----------------------------
-- Table structure for anak_pegawai
-- ----------------------------
DROP TABLE IF EXISTS `anak_pegawai`;
CREATE TABLE `anak_pegawai`  (
  `id_anak_pegawai` int(11) NOT NULL AUTO_INCREMENT,
  `idguru_fk` int(11) NULL DEFAULT NULL,
  `nama` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `tempat_lahir` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `tanggal_lahir` date NULL DEFAULT NULL,
  `nama_ibu` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`id_anak_pegawai`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ans_bank_soal
-- ----------------------------
DROP TABLE IF EXISTS `ans_bank_soal`;
CREATE TABLE `ans_bank_soal`  (
  `id_ans_bank_soal` int(11) NOT NULL AUTO_INCREMENT,
  `idbanksoal_fk` int(11) NULL DEFAULT NULL,
  `ans` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `point` decimal(20, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`id_ans_bank_soal`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for bank_soal
-- ----------------------------
DROP TABLE IF EXISTS `bank_soal`;
CREATE TABLE `bank_soal`  (
  `id_bank_soal` int(11) NOT NULL AUTO_INCREMENT,
  `soal` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `time_soal` int(11) NULL DEFAULT NULL,
  `code_soal` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `idmatapelajaran_fk` int(11) NULL DEFAULT NULL,
  `idguru_fk` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_bank_soal`) USING BTREE,
  INDEX `idmatapelajaran_fk`(`idmatapelajaran_fk`) USING BTREE,
  INDEX `idguru_fk`(`idguru_fk`) USING BTREE,
  CONSTRAINT `bank_soal_ibfk_1` FOREIGN KEY (`idmatapelajaran_fk`) REFERENCES `mata_pelajaran` (`id_mata_pelajaran`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bank_soal_ibfk_2` FOREIGN KEY (`idguru_fk`) REFERENCES `guru` (`id_guru`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for blog_article
-- ----------------------------
DROP TABLE IF EXISTS `blog_article`;
CREATE TABLE `blog_article`  (
  `id_blog_article` int(11) NOT NULL AUTO_INCREMENT,
  `title` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `description` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `img` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `tanggal` date NULL DEFAULT NULL,
  `tagline` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `iduser_fk` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_blog_article`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for blog_course
-- ----------------------------
DROP TABLE IF EXISTS `blog_course`;
CREATE TABLE `blog_course`  (
  `id_blog_course` int(11) NOT NULL AUTO_INCREMENT,
  `course_name` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `description` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `button` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `year` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `headmaster` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `seats` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `img` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`id_blog_course`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for blog_setting
-- ----------------------------
DROP TABLE IF EXISTS `blog_setting`;
CREATE TABLE `blog_setting`  (
  `id_blog_setting` int(11) NOT NULL AUTO_INCREMENT,
  `position` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `name` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `value` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`id_blog_setting`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for blog_slider
-- ----------------------------
DROP TABLE IF EXISTS `blog_slider`;
CREATE TABLE `blog_slider`  (
  `id_blog_slider` int(11) NOT NULL AUTO_INCREMENT,
  `img` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `title` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `desc` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `button` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`id_blog_slider`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for blog_teacher
-- ----------------------------
DROP TABLE IF EXISTS `blog_teacher`;
CREATE TABLE `blog_teacher`  (
  `id_blog_teacher` int(11) NOT NULL AUTO_INCREMENT,
  `nama` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `img` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `jabatan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `deskripsi` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `idguru_fk` int(11) NULL DEFAULT NULL,
  `slide` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`id_blog_teacher`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for buku_pemanggilan_siswa
-- ----------------------------
DROP TABLE IF EXISTS `buku_pemanggilan_siswa`;
CREATE TABLE `buku_pemanggilan_siswa`  (
  `id_buku_pemanggilan_siswa` int(11) NOT NULL AUTO_INCREMENT,
  `idsiswa_fk` int(11) NULL DEFAULT NULL,
  `masalah` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `pemecahan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `tindak_lanjut` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `keterangan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `create_at` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tanggal` date NULL DEFAULT NULL,
  `kode_pemanggilan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`id_buku_pemanggilan_siswa`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of buku_pemanggilan_siswa
-- ----------------------------
INSERT INTO `buku_pemanggilan_siswa` VALUES (1, 592, 'coba', 'coba', 'coba', 'coba', NULL, '2022-07-21', 'BK-389648491165');

-- ----------------------------
-- Table structure for buku_tamu
-- ----------------------------
DROP TABLE IF EXISTS `buku_tamu`;
CREATE TABLE `buku_tamu`  (
  `id_buku_tamu` int(11) NOT NULL AUTO_INCREMENT,
  `nama` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `alamat` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `keperluan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `tanggal` date NULL DEFAULT NULL,
  `create_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `jabatan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `saran` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`id_buku_tamu`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of buku_tamu
-- ----------------------------
INSERT INTO `buku_tamu` VALUES (2, 'Rendy1', 'Malang1', 'Sales aplikasi1', '2022-10-22', '2022-10-22 20:26:55', '-1', '-1');

-- ----------------------------
-- Table structure for catatan_siswa
-- ----------------------------
DROP TABLE IF EXISTS `catatan_siswa`;
CREATE TABLE `catatan_siswa`  (
  `id_catatan_siswa` int(11) NOT NULL AUTO_INCREMENT,
  `idsiswa_fk` int(11) NULL DEFAULT NULL,
  `idkelas_fk` int(11) NULL DEFAULT NULL,
  `idguru_fk` int(11) NULL DEFAULT NULL,
  `tanggal` date NULL DEFAULT NULL,
  `uraian` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `teruskan_ke` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `idtahunajaran_fk` int(11) NULL DEFAULT NULL,
  `idmapel_fk` int(11) NULL DEFAULT NULL,
  `is_tindakan` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_catatan_siswa`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for cities
-- ----------------------------
DROP TABLE IF EXISTS `cities`;
CREATE TABLE `cities`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `province_id` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 500 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of cities
-- ----------------------------
INSERT INTO `cities` VALUES (1, 'Kab. Simeulue', 1, '2019-10-22 07:49:46', '2019-10-25 20:50:05');
INSERT INTO `cities` VALUES (2, 'Kab. Aceh Singkil', 1, '2019-10-22 07:49:46', '2019-10-22 07:49:46');
INSERT INTO `cities` VALUES (3, 'Kab. Aceh Selatan', 1, '2019-10-22 07:49:46', '2019-10-22 07:49:46');
INSERT INTO `cities` VALUES (4, 'Kab. Aceh Tenggara', 1, '2019-10-22 07:49:46', '2019-10-22 07:49:46');
INSERT INTO `cities` VALUES (5, 'Kab. Aceh Timur', 1, '2019-10-22 07:49:46', '2019-10-22 07:49:46');
INSERT INTO `cities` VALUES (6, 'Kab. Aceh Tengah', 1, '2019-10-22 07:49:46', '2019-10-22 07:49:46');
INSERT INTO `cities` VALUES (7, 'Kab. Aceh Barat', 1, '2019-10-22 07:49:46', '2019-10-22 07:49:46');
INSERT INTO `cities` VALUES (8, 'Kab. Aceh Besar', 1, '2019-10-22 07:49:46', '2019-10-22 07:49:46');
INSERT INTO `cities` VALUES (9, 'Kab. Pidie', 1, '2019-10-22 07:49:46', '2019-10-22 07:49:46');
INSERT INTO `cities` VALUES (10, 'Kab. Bireuen', 1, '2019-10-22 07:49:46', '2019-10-22 07:49:46');
INSERT INTO `cities` VALUES (11, 'Kab. Aceh Utara', 1, '2019-10-22 07:49:46', '2019-10-22 07:49:46');
INSERT INTO `cities` VALUES (12, 'Kab. Aceh Barat Daya', 1, '2019-10-22 07:49:46', '2019-10-22 07:49:46');
INSERT INTO `cities` VALUES (13, 'Kab. Gayo Lues', 1, '2019-10-22 07:49:46', '2019-10-22 07:49:46');
INSERT INTO `cities` VALUES (14, 'Kab. Aceh Tamiang', 1, '2019-10-22 07:49:46', '2019-10-22 07:49:46');
INSERT INTO `cities` VALUES (15, 'Kab. Nagan Raya', 1, '2019-10-22 07:49:46', '2019-10-22 07:49:46');
INSERT INTO `cities` VALUES (16, 'Kab. Aceh Jaya', 1, '2019-10-22 07:49:46', '2019-10-22 07:49:46');
INSERT INTO `cities` VALUES (17, 'Kab. Bener Meriah', 1, '2019-10-22 07:49:46', '2019-10-22 07:49:46');
INSERT INTO `cities` VALUES (18, 'Kab. Pidie Jaya', 1, '2019-10-22 07:49:46', '2019-10-22 07:49:46');
INSERT INTO `cities` VALUES (19, 'Kota Banda Aceh', 1, '2019-10-22 07:49:46', '2019-10-22 07:49:46');
INSERT INTO `cities` VALUES (20, 'Kota Sabang', 1, '2019-10-22 07:49:46', '2019-10-22 07:49:46');
INSERT INTO `cities` VALUES (21, 'Kota Langsa', 1, '2019-10-22 07:49:46', '2019-10-22 07:49:46');
INSERT INTO `cities` VALUES (22, 'Kota Lhokseumawe', 1, '2019-10-22 07:49:46', '2019-10-22 07:49:46');
INSERT INTO `cities` VALUES (23, 'Kota Subulussalam', 1, '2019-10-22 07:49:46', '2019-10-22 07:49:46');
INSERT INTO `cities` VALUES (24, 'Kab. Nias', 2, '2019-10-22 07:49:46', '2019-10-22 07:49:46');
INSERT INTO `cities` VALUES (25, 'Kab. Mandailing Natal', 2, '2019-10-22 07:49:47', '2019-10-22 07:49:47');
INSERT INTO `cities` VALUES (26, 'Kab. Tapanuli Selatan', 2, '2019-10-22 07:49:47', '2019-10-22 07:49:47');
INSERT INTO `cities` VALUES (27, 'Kab. Tapanuli Tengah', 2, '2019-10-22 07:49:47', '2019-10-22 07:49:47');
INSERT INTO `cities` VALUES (28, 'Kab. Tapanuli Utara', 2, '2019-10-22 07:49:47', '2019-10-22 07:49:47');
INSERT INTO `cities` VALUES (29, 'Kab. Toba Samosir', 2, '2019-10-22 07:49:47', '2019-10-22 07:49:47');
INSERT INTO `cities` VALUES (30, 'Kab. Labuhan Batu', 2, '2019-10-22 07:49:47', '2019-10-22 07:49:47');
INSERT INTO `cities` VALUES (31, 'Kab. Asahan', 2, '2019-10-22 07:49:47', '2019-10-22 07:49:47');
INSERT INTO `cities` VALUES (32, 'Kab. Simalungun', 2, '2019-10-22 07:49:47', '2019-10-22 07:49:47');
INSERT INTO `cities` VALUES (33, 'Kab. Dairi', 2, '2019-10-22 07:49:47', '2019-10-22 07:49:47');
INSERT INTO `cities` VALUES (34, 'Kab. Karo', 2, '2019-10-22 07:49:47', '2019-10-22 07:49:47');
INSERT INTO `cities` VALUES (35, 'Kab. Deli Serdang', 2, '2019-10-22 07:49:47', '2019-10-22 07:49:47');
INSERT INTO `cities` VALUES (36, 'Kab. Langkat', 2, '2019-10-22 07:49:47', '2019-10-22 07:49:47');
INSERT INTO `cities` VALUES (37, 'Kab. Nias Selatan', 2, '2019-10-22 07:49:47', '2019-10-22 07:49:47');
INSERT INTO `cities` VALUES (38, 'Kab. Humbang Hasundutan', 2, '2019-10-22 07:49:47', '2019-10-22 07:49:47');
INSERT INTO `cities` VALUES (39, 'Kab. Pakpak Bharat', 2, '2019-10-22 07:49:47', '2019-10-22 07:49:47');
INSERT INTO `cities` VALUES (40, 'Kab. Samosir', 2, '2019-10-22 07:49:47', '2019-10-22 07:49:47');
INSERT INTO `cities` VALUES (41, 'Kab. Serdang Bedagai', 2, '2019-10-22 07:49:47', '2019-10-22 07:49:47');
INSERT INTO `cities` VALUES (42, 'Kab. Batu Bara', 2, '2019-10-22 07:49:47', '2019-10-22 07:49:47');
INSERT INTO `cities` VALUES (43, 'Kab. Padang Lawas Utara', 2, '2019-10-22 07:49:47', '2019-10-22 07:49:47');
INSERT INTO `cities` VALUES (44, 'Kab. Padang Lawas', 2, '2019-10-22 07:49:47', '2019-10-22 07:49:47');
INSERT INTO `cities` VALUES (45, 'Kab. Labuhan Batu Selatan', 2, '2019-10-22 07:49:47', '2019-10-22 07:49:47');
INSERT INTO `cities` VALUES (46, 'Kab. Labuhan Batu Utara', 2, '2019-10-22 07:49:47', '2019-10-22 07:49:47');
INSERT INTO `cities` VALUES (47, 'Kab. Nias Utara', 2, '2019-10-22 07:49:47', '2019-10-22 07:49:47');
INSERT INTO `cities` VALUES (48, 'Kab. Nias Barat', 2, '2019-10-22 07:49:47', '2019-10-22 07:49:47');
INSERT INTO `cities` VALUES (49, 'Kota Sibolga', 2, '2019-10-22 07:49:47', '2019-10-22 07:49:47');
INSERT INTO `cities` VALUES (50, 'Kota Tanjung Balai', 2, '2019-10-22 07:49:47', '2019-10-22 07:49:47');
INSERT INTO `cities` VALUES (51, 'Kota Pematang Siantar', 2, '2019-10-22 07:49:47', '2019-10-22 07:49:47');
INSERT INTO `cities` VALUES (52, 'Kota Tebing Tinggi', 2, '2019-10-22 07:49:47', '2019-10-22 07:49:47');
INSERT INTO `cities` VALUES (53, 'Kota Medan', 2, '2019-10-22 07:49:47', '2019-10-22 07:49:47');
INSERT INTO `cities` VALUES (54, 'Kota Binjai', 2, '2019-10-22 07:49:47', '2019-10-22 07:49:47');
INSERT INTO `cities` VALUES (55, 'Kota Padangsidimpuan', 2, '2019-10-22 07:49:47', '2019-10-22 07:49:47');
INSERT INTO `cities` VALUES (56, 'Kota Gunungsitoli', 2, '2019-10-22 07:49:47', '2019-10-22 07:49:47');
INSERT INTO `cities` VALUES (57, 'Kab. Kepulauan Mentawai', 3, '2019-10-22 07:49:47', '2019-10-22 07:49:47');
INSERT INTO `cities` VALUES (58, 'Kab. Pesisir Selatan', 3, '2019-10-22 07:49:47', '2019-10-22 07:49:47');
INSERT INTO `cities` VALUES (59, 'Kab. Solok', 3, '2019-10-22 07:49:47', '2019-10-22 07:49:47');
INSERT INTO `cities` VALUES (60, 'Kab. Sijunjung', 3, '2019-10-22 07:49:47', '2019-10-22 07:49:47');
INSERT INTO `cities` VALUES (61, 'Kab. Tanah Datar', 3, '2019-10-22 07:49:47', '2019-10-22 07:49:47');
INSERT INTO `cities` VALUES (62, 'Kab. Padang Pariaman', 3, '2019-10-22 07:49:48', '2019-10-22 07:49:48');
INSERT INTO `cities` VALUES (63, 'Kab. Agam', 3, '2019-10-22 07:49:48', '2019-10-22 07:49:48');
INSERT INTO `cities` VALUES (64, 'Kab. Lima Puluh Kota', 3, '2019-10-22 07:49:48', '2019-10-22 07:49:48');
INSERT INTO `cities` VALUES (65, 'Kab. Pasaman', 3, '2019-10-22 07:49:48', '2019-10-22 07:49:48');
INSERT INTO `cities` VALUES (66, 'Kab. Solok Selatan', 3, '2019-10-22 07:49:48', '2019-10-22 07:49:48');
INSERT INTO `cities` VALUES (67, 'Kab. Dharmasraya', 3, '2019-10-22 07:49:48', '2019-10-22 07:49:48');
INSERT INTO `cities` VALUES (68, 'Kab. Pasaman Barat', 3, '2019-10-22 07:49:48', '2019-10-22 07:49:48');
INSERT INTO `cities` VALUES (69, 'Kota Padang', 3, '2019-10-22 07:49:48', '2019-10-22 07:49:48');
INSERT INTO `cities` VALUES (70, 'Kota Solok', 3, '2019-10-22 07:49:48', '2019-10-22 07:49:48');
INSERT INTO `cities` VALUES (71, 'Kota Sawah Lunto', 3, '2019-10-22 07:49:48', '2019-10-22 07:49:48');
INSERT INTO `cities` VALUES (72, 'Kota Padang Panjang', 3, '2019-10-22 07:49:48', '2019-10-22 07:49:48');
INSERT INTO `cities` VALUES (73, 'Kota Bukittinggi', 3, '2019-10-22 07:49:48', '2019-10-22 07:49:48');
INSERT INTO `cities` VALUES (74, 'Kota Payakumbuh', 3, '2019-10-22 07:49:48', '2019-10-22 07:49:48');
INSERT INTO `cities` VALUES (75, 'Kota Pariaman', 3, '2019-10-22 07:49:48', '2019-10-22 07:49:48');
INSERT INTO `cities` VALUES (76, 'Kab. Kuantan Singingi', 4, '2019-10-22 07:49:48', '2019-10-22 07:49:48');
INSERT INTO `cities` VALUES (77, 'Kab. Indragiri Hulu', 4, '2019-10-22 07:49:48', '2019-10-22 07:49:48');
INSERT INTO `cities` VALUES (78, 'Kab. Indragiri Hilir', 4, '2019-10-22 07:49:48', '2019-10-22 07:49:48');
INSERT INTO `cities` VALUES (79, 'Kab. Pelalawan', 4, '2019-10-22 07:49:48', '2019-10-22 07:49:48');
INSERT INTO `cities` VALUES (80, 'Kab. S I A K', 4, '2019-10-22 07:49:48', '2019-10-22 07:49:48');
INSERT INTO `cities` VALUES (81, 'Kab. Kampar', 4, '2019-10-22 07:49:48', '2019-10-22 07:49:48');
INSERT INTO `cities` VALUES (82, 'Kab. Rokan Hulu', 4, '2019-10-22 07:49:48', '2019-10-22 07:49:48');
INSERT INTO `cities` VALUES (83, 'Kab. Bengkalis', 4, '2019-10-22 07:49:48', '2019-10-22 07:49:48');
INSERT INTO `cities` VALUES (84, 'Kab. Rokan Hilir', 4, '2019-10-22 07:49:48', '2019-10-22 07:49:48');
INSERT INTO `cities` VALUES (85, 'Kab. Kepulauan Meranti', 4, '2019-10-22 07:49:48', '2019-10-22 07:49:48');
INSERT INTO `cities` VALUES (86, 'Kota Pekanbaru', 4, '2019-10-22 07:49:48', '2019-10-22 07:49:48');
INSERT INTO `cities` VALUES (87, 'Kota D U M A I', 4, '2019-10-22 07:49:48', '2019-10-22 07:49:48');
INSERT INTO `cities` VALUES (88, 'Kab. Kerinci', 5, '2019-10-22 07:49:48', '2019-10-22 07:49:48');
INSERT INTO `cities` VALUES (89, 'Kab. Merangin', 5, '2019-10-22 07:49:48', '2019-10-22 07:49:48');
INSERT INTO `cities` VALUES (90, 'Kab. Sarolangun', 5, '2019-10-22 07:49:48', '2019-10-22 07:49:48');
INSERT INTO `cities` VALUES (91, 'Kab. Batang Hari', 5, '2019-10-22 07:49:48', '2019-10-22 07:49:48');
INSERT INTO `cities` VALUES (92, 'Kab. Muaro Jambi', 5, '2019-10-22 07:49:48', '2019-10-22 07:49:48');
INSERT INTO `cities` VALUES (93, 'Kab. Tanjung Jabung Timur', 5, '2019-10-22 07:49:48', '2019-10-22 07:49:48');
INSERT INTO `cities` VALUES (94, 'Kab. Tanjung Jabung Barat', 5, '2019-10-22 07:49:48', '2019-10-22 07:49:48');
INSERT INTO `cities` VALUES (95, 'Kab. Tebo', 5, '2019-10-22 07:49:48', '2019-10-22 07:49:48');
INSERT INTO `cities` VALUES (96, 'Kab. Bungo', 5, '2019-10-22 07:49:49', '2019-10-22 07:49:49');
INSERT INTO `cities` VALUES (97, 'Kota Jambi', 5, '2019-10-22 07:49:49', '2019-10-22 07:49:49');
INSERT INTO `cities` VALUES (98, 'Kota Sungai Penuh', 5, '2019-10-22 07:49:49', '2019-10-22 07:49:49');
INSERT INTO `cities` VALUES (99, 'Kab. Ogan Komering Ulu', 6, '2019-10-22 07:49:49', '2019-10-22 07:49:49');
INSERT INTO `cities` VALUES (100, 'Kab. Ogan Komering Ilir', 6, '2019-10-22 07:49:49', '2019-10-22 07:49:49');
INSERT INTO `cities` VALUES (101, 'Kab. Muara Enim', 6, '2019-10-22 07:49:49', '2019-10-22 07:49:49');
INSERT INTO `cities` VALUES (102, 'Kab. Lahat', 6, '2019-10-22 07:49:49', '2019-10-22 07:49:49');
INSERT INTO `cities` VALUES (103, 'Kab. Musi Rawas', 6, '2019-10-22 07:49:49', '2019-10-22 07:49:49');
INSERT INTO `cities` VALUES (104, 'Kab. Musi Banyuasin', 6, '2019-10-22 07:49:49', '2019-10-22 07:49:49');
INSERT INTO `cities` VALUES (105, 'Kab. Banyu Asin', 6, '2019-10-22 07:49:49', '2019-10-22 07:49:49');
INSERT INTO `cities` VALUES (106, 'Kab. Ogan Komering Ulu Selatan', 6, '2019-10-22 07:49:49', '2019-10-22 07:49:49');
INSERT INTO `cities` VALUES (107, 'Kab. Ogan Komering Ulu Timur', 6, '2019-10-22 07:49:49', '2019-10-22 07:49:49');
INSERT INTO `cities` VALUES (108, 'Kab. Ogan Ilir', 6, '2019-10-22 07:49:49', '2019-10-22 07:49:49');
INSERT INTO `cities` VALUES (109, 'Kab. Empat Lawang', 6, '2019-10-22 07:49:49', '2019-10-22 07:49:49');
INSERT INTO `cities` VALUES (110, 'Kota Palembang', 6, '2019-10-22 07:49:49', '2019-10-22 07:49:49');
INSERT INTO `cities` VALUES (111, 'Kota Prabumulih', 6, '2019-10-22 07:49:49', '2019-10-22 07:49:49');
INSERT INTO `cities` VALUES (112, 'Kota Pagar Alam', 6, '2019-10-22 07:49:49', '2019-10-22 07:49:49');
INSERT INTO `cities` VALUES (113, 'Kota Lubuklinggau', 6, '2019-10-22 07:49:49', '2019-10-22 07:49:49');
INSERT INTO `cities` VALUES (114, 'Kab. Bengkulu Selatan', 7, '2019-10-22 07:49:49', '2019-10-22 07:49:49');
INSERT INTO `cities` VALUES (115, 'Kab. Rejang Lebong', 7, '2019-10-22 07:49:49', '2019-10-22 07:49:49');
INSERT INTO `cities` VALUES (116, 'Kab. Bengkulu Utara', 7, '2019-10-22 07:49:49', '2019-10-22 07:49:49');
INSERT INTO `cities` VALUES (117, 'Kab. Kaur', 7, '2019-10-22 07:49:49', '2019-10-22 07:49:49');
INSERT INTO `cities` VALUES (118, 'Kab. Seluma', 7, '2019-10-22 07:49:49', '2019-10-22 07:49:49');
INSERT INTO `cities` VALUES (119, 'Kab. Mukomuko', 7, '2019-10-22 07:49:49', '2019-10-22 07:49:49');
INSERT INTO `cities` VALUES (120, 'Kab. Lebong', 7, '2019-10-22 07:49:49', '2019-10-22 07:49:49');
INSERT INTO `cities` VALUES (121, 'Kab. Kepahiang', 7, '2019-10-22 07:49:49', '2019-10-22 07:49:49');
INSERT INTO `cities` VALUES (122, 'Kab. Bengkulu Tengah', 7, '2019-10-22 07:49:49', '2019-10-22 07:49:49');
INSERT INTO `cities` VALUES (123, 'Kota Bengkulu', 7, '2019-10-22 07:49:49', '2019-10-22 07:49:49');
INSERT INTO `cities` VALUES (124, 'Kab. Lampung Barat', 8, '2019-10-22 07:49:49', '2019-10-22 07:49:49');
INSERT INTO `cities` VALUES (125, 'Kab. Tanggamus', 8, '2019-10-22 07:49:49', '2019-10-22 07:49:49');
INSERT INTO `cities` VALUES (126, 'Kab. Lampung Selatan', 8, '2019-10-22 07:49:49', '2019-10-22 07:49:49');
INSERT INTO `cities` VALUES (127, 'Kab. Lampung Timur', 8, '2019-10-22 07:49:49', '2019-10-22 07:49:49');
INSERT INTO `cities` VALUES (128, 'Kab. Lampung Tengah', 8, '2019-10-22 07:49:49', '2019-10-22 07:49:49');
INSERT INTO `cities` VALUES (129, 'Kab. Lampung Utara', 8, '2019-10-22 07:49:50', '2019-10-22 07:49:50');
INSERT INTO `cities` VALUES (130, 'Kab. Way Kanan', 8, '2019-10-22 07:49:50', '2019-10-22 07:49:50');
INSERT INTO `cities` VALUES (131, 'Kab. Tulangbawang', 8, '2019-10-22 07:49:50', '2019-10-22 07:49:50');
INSERT INTO `cities` VALUES (132, 'Kab. Pesawaran', 8, '2019-10-22 07:49:50', '2019-10-22 07:49:50');
INSERT INTO `cities` VALUES (133, 'Kab. Pringsewu', 8, '2019-10-22 07:49:50', '2019-10-22 07:49:50');
INSERT INTO `cities` VALUES (134, 'Kab. Mesuji', 8, '2019-10-22 07:49:50', '2019-10-22 07:49:50');
INSERT INTO `cities` VALUES (135, 'Kab. Tulang Bawang Barat', 8, '2019-10-22 07:49:50', '2019-10-22 07:49:50');
INSERT INTO `cities` VALUES (136, 'Kab. Pesisir Barat', 8, '2019-10-22 07:49:50', '2019-10-22 07:49:50');
INSERT INTO `cities` VALUES (137, 'Kota Bandar Lampung', 8, '2019-10-22 07:49:50', '2019-10-22 07:49:50');
INSERT INTO `cities` VALUES (138, 'Kota Metro', 8, '2019-10-22 07:49:50', '2019-10-22 07:49:50');
INSERT INTO `cities` VALUES (139, 'Kab. Bangka', 9, '2019-10-22 07:49:50', '2019-10-22 07:49:50');
INSERT INTO `cities` VALUES (140, 'Kab. Belitung', 9, '2019-10-22 07:49:50', '2019-10-22 07:49:50');
INSERT INTO `cities` VALUES (141, 'Kab. Bangka Barat', 9, '2019-10-22 07:49:50', '2019-10-22 07:49:50');
INSERT INTO `cities` VALUES (142, 'Kab. Bangka Tengah', 9, '2019-10-22 07:49:50', '2019-10-22 07:49:50');
INSERT INTO `cities` VALUES (143, 'Kab. Bangka Selatan', 9, '2019-10-22 07:49:50', '2019-10-22 07:49:50');
INSERT INTO `cities` VALUES (144, 'Kab. Belitung Timur', 9, '2019-10-22 07:49:50', '2019-10-22 07:49:50');
INSERT INTO `cities` VALUES (145, 'Kota Pangkal Pinang', 9, '2019-10-22 07:49:50', '2019-10-22 07:49:50');
INSERT INTO `cities` VALUES (146, 'Kab. Karimun', 10, '2019-10-22 07:49:50', '2019-10-22 07:49:50');
INSERT INTO `cities` VALUES (147, 'Kab. Bintan', 10, '2019-10-22 07:49:50', '2019-10-22 07:49:50');
INSERT INTO `cities` VALUES (148, 'Kab. Natuna', 10, '2019-10-22 07:49:50', '2019-10-22 07:49:50');
INSERT INTO `cities` VALUES (149, 'Kab. Lingga', 10, '2019-10-22 07:49:50', '2019-10-22 07:49:50');
INSERT INTO `cities` VALUES (150, 'Kab. Kepulauan Anambas', 10, '2019-10-22 07:49:50', '2019-10-22 07:49:50');
INSERT INTO `cities` VALUES (151, 'Kota B A T A M', 10, '2019-10-22 07:49:50', '2019-10-22 07:49:50');
INSERT INTO `cities` VALUES (152, 'Kota Tanjung Pinang', 10, '2019-10-22 07:49:50', '2019-10-22 07:49:50');
INSERT INTO `cities` VALUES (153, 'Kab. Kepulauan Seribu', 11, '2019-10-22 07:49:50', '2019-10-22 07:49:50');
INSERT INTO `cities` VALUES (154, 'Kota Jakarta Selatan', 11, '2019-10-22 07:49:50', '2019-10-22 07:49:50');
INSERT INTO `cities` VALUES (155, 'Kota Jakarta Timur', 11, '2019-10-22 07:49:50', '2019-10-22 07:49:50');
INSERT INTO `cities` VALUES (156, 'Kota Jakarta Pusat', 11, '2019-10-22 07:49:50', '2019-10-22 07:49:50');
INSERT INTO `cities` VALUES (157, 'Kota Jakarta Barat', 11, '2019-10-22 07:49:50', '2019-10-22 07:49:50');
INSERT INTO `cities` VALUES (158, 'Kota Jakarta Utara', 11, '2019-10-22 07:49:50', '2019-10-22 07:49:50');
INSERT INTO `cities` VALUES (159, 'Kab. Bogor', 12, '2019-10-22 07:49:51', '2019-10-22 07:49:51');
INSERT INTO `cities` VALUES (160, 'Kab. Sukabumi', 12, '2019-10-22 07:49:51', '2019-10-22 07:49:51');
INSERT INTO `cities` VALUES (161, 'Kab. Cianjur', 12, '2019-10-22 07:49:51', '2019-10-22 07:49:51');
INSERT INTO `cities` VALUES (162, 'Kab. Bandung', 12, '2019-10-22 07:49:51', '2019-10-22 07:49:51');
INSERT INTO `cities` VALUES (163, 'Kab. Garut', 12, '2019-10-22 07:49:51', '2019-10-22 07:49:51');
INSERT INTO `cities` VALUES (164, 'Kab. Tasikmalaya', 12, '2019-10-22 07:49:51', '2019-10-22 07:49:51');
INSERT INTO `cities` VALUES (165, 'Kab. Ciamis', 12, '2019-10-22 07:49:51', '2019-10-22 07:49:51');
INSERT INTO `cities` VALUES (166, 'Kab. Kuningan', 12, '2019-10-22 07:49:51', '2019-10-22 07:49:51');
INSERT INTO `cities` VALUES (167, 'Kab. Cirebon', 12, '2019-10-22 07:49:51', '2019-10-22 07:49:51');
INSERT INTO `cities` VALUES (168, 'Kab. Majalengka', 12, '2019-10-22 07:49:51', '2019-10-22 07:49:51');
INSERT INTO `cities` VALUES (169, 'Kab. Sumedang', 12, '2019-10-22 07:49:51', '2019-10-22 07:49:51');
INSERT INTO `cities` VALUES (170, 'Kab. Indramayu', 12, '2019-10-22 07:49:51', '2019-10-22 07:49:51');
INSERT INTO `cities` VALUES (171, 'Kab. Subang', 12, '2019-10-22 07:49:51', '2019-10-22 07:49:51');
INSERT INTO `cities` VALUES (172, 'Kab. Purwakarta', 12, '2019-10-22 07:49:51', '2019-10-22 07:49:51');
INSERT INTO `cities` VALUES (173, 'Kab. Karawang', 12, '2019-10-22 07:49:51', '2019-10-22 07:49:51');
INSERT INTO `cities` VALUES (174, 'Kab. Bekasi', 12, '2019-10-22 07:49:51', '2019-10-22 07:49:51');
INSERT INTO `cities` VALUES (175, 'Kab. Bandung Barat', 12, '2019-10-22 07:49:51', '2019-10-22 07:49:51');
INSERT INTO `cities` VALUES (176, 'Kab. Pangandaran', 12, '2019-10-22 07:49:51', '2019-10-22 07:49:51');
INSERT INTO `cities` VALUES (177, 'Kota Bogor', 12, '2019-10-22 07:49:51', '2019-10-22 07:49:51');
INSERT INTO `cities` VALUES (178, 'Kota Sukabumi', 12, '2019-10-22 07:49:51', '2019-10-22 07:49:51');
INSERT INTO `cities` VALUES (179, 'Kota Bandung', 12, '2019-10-22 07:49:51', '2019-10-22 07:49:51');
INSERT INTO `cities` VALUES (180, 'Kota Cirebon', 12, '2019-10-22 07:49:51', '2019-10-22 07:49:51');
INSERT INTO `cities` VALUES (181, 'Kota Bekasi', 12, '2019-10-22 07:49:51', '2019-10-22 07:49:51');
INSERT INTO `cities` VALUES (182, 'Kota Depok', 12, '2019-10-22 07:49:51', '2019-10-22 07:49:51');
INSERT INTO `cities` VALUES (183, 'Kota Cimahi', 12, '2019-10-22 07:49:51', '2019-10-22 07:49:51');
INSERT INTO `cities` VALUES (184, 'Kota Tasikmalaya', 12, '2019-10-22 07:49:51', '2019-10-22 07:49:51');
INSERT INTO `cities` VALUES (185, 'Kota Banjar', 12, '2019-10-22 07:49:51', '2019-10-22 07:49:51');
INSERT INTO `cities` VALUES (186, 'Kab. Cilacap', 13, '2019-10-22 07:49:51', '2019-10-22 07:49:51');
INSERT INTO `cities` VALUES (187, 'Kab. Banyumas', 13, '2019-10-22 07:49:51', '2019-10-22 07:49:51');
INSERT INTO `cities` VALUES (188, 'Kab. Purbalingga', 13, '2019-10-22 07:49:51', '2019-10-22 07:49:51');
INSERT INTO `cities` VALUES (189, 'Kab. Banjarnegara', 13, '2019-10-22 07:49:51', '2019-10-22 07:49:51');
INSERT INTO `cities` VALUES (190, 'Kab. Kebumen', 13, '2019-10-22 07:49:51', '2019-10-22 07:49:51');
INSERT INTO `cities` VALUES (191, 'Kab. Purworejo', 13, '2019-10-22 07:49:51', '2019-10-22 07:49:51');
INSERT INTO `cities` VALUES (192, 'Kab. Wonosobo', 13, '2019-10-22 07:49:51', '2019-10-22 07:49:51');
INSERT INTO `cities` VALUES (193, 'Kab. Magelang', 13, '2019-10-22 07:49:52', '2019-10-22 07:49:52');
INSERT INTO `cities` VALUES (194, 'Kab. Boyolali', 13, '2019-10-22 07:49:52', '2019-10-22 07:49:52');
INSERT INTO `cities` VALUES (195, 'Kab. Klaten', 13, '2019-10-22 07:49:52', '2019-10-22 07:49:52');
INSERT INTO `cities` VALUES (196, 'Kab. Sukoharjo', 13, '2019-10-22 07:49:52', '2019-10-22 07:49:52');
INSERT INTO `cities` VALUES (197, 'Kab. Wonogiri', 13, '2019-10-22 07:49:52', '2019-10-22 07:49:52');
INSERT INTO `cities` VALUES (198, 'Kab. Karanganyar', 13, '2019-10-22 07:49:52', '2019-10-22 07:49:52');
INSERT INTO `cities` VALUES (199, 'Kab. Sragen', 13, '2019-10-22 07:49:52', '2019-10-22 07:49:52');
INSERT INTO `cities` VALUES (200, 'Kab. Grobogan', 13, '2019-10-22 07:49:52', '2019-10-22 07:49:52');
INSERT INTO `cities` VALUES (201, 'Kab. Blora', 13, '2019-10-22 07:49:52', '2019-10-22 07:49:52');
INSERT INTO `cities` VALUES (202, 'Kab. Rembang', 13, '2019-10-22 07:49:52', '2019-10-22 07:49:52');
INSERT INTO `cities` VALUES (203, 'Kab. Pati', 13, '2019-10-22 07:49:52', '2019-10-22 07:49:52');
INSERT INTO `cities` VALUES (204, 'Kab. Kudus', 13, '2019-10-22 07:49:52', '2019-10-22 07:49:52');
INSERT INTO `cities` VALUES (205, 'Kab. Jepara', 13, '2019-10-22 07:49:52', '2019-10-22 07:49:52');
INSERT INTO `cities` VALUES (206, 'Kab. Demak', 13, '2019-10-22 07:49:52', '2019-10-22 07:49:52');
INSERT INTO `cities` VALUES (207, 'Kab. Semarang', 13, '2019-10-22 07:49:52', '2019-10-22 07:49:52');
INSERT INTO `cities` VALUES (208, 'Kab. Temanggung', 13, '2019-10-22 07:49:52', '2019-10-22 07:49:52');
INSERT INTO `cities` VALUES (209, 'Kab. Kendal', 13, '2019-10-22 07:49:52', '2019-10-22 07:49:52');
INSERT INTO `cities` VALUES (210, 'Kab. Batang', 13, '2019-10-22 07:49:52', '2019-10-22 07:49:52');
INSERT INTO `cities` VALUES (211, 'Kab. Pekalongan', 13, '2019-10-22 07:49:52', '2019-10-22 07:49:52');
INSERT INTO `cities` VALUES (212, 'Kab. Pemalang', 13, '2019-10-22 07:49:52', '2019-10-22 07:49:52');
INSERT INTO `cities` VALUES (213, 'Kab. Tegal', 13, '2019-10-22 07:49:52', '2019-10-22 07:49:52');
INSERT INTO `cities` VALUES (214, 'Kab. Brebes', 13, '2019-10-22 07:49:52', '2019-10-22 07:49:52');
INSERT INTO `cities` VALUES (215, 'Kota Magelang', 13, '2019-10-22 07:49:52', '2019-10-22 07:49:52');
INSERT INTO `cities` VALUES (216, 'Kota Surakarta', 13, '2019-10-22 07:49:52', '2019-10-22 07:49:52');
INSERT INTO `cities` VALUES (217, 'Kota Salatiga', 13, '2019-10-22 07:49:52', '2019-10-22 07:49:52');
INSERT INTO `cities` VALUES (218, 'Kota Semarang', 13, '2019-10-22 07:49:52', '2019-10-22 07:49:52');
INSERT INTO `cities` VALUES (219, 'Kota Pekalongan', 13, '2019-10-22 07:49:52', '2019-10-22 07:49:52');
INSERT INTO `cities` VALUES (220, 'Kota Tegal', 13, '2019-10-22 07:49:52', '2019-10-22 07:49:52');
INSERT INTO `cities` VALUES (221, 'Kab. Kulon Progo', 14, '2019-10-22 07:49:52', '2019-10-22 07:49:52');
INSERT INTO `cities` VALUES (222, 'Kab. Bantul', 14, '2019-10-22 07:49:52', '2019-10-22 07:49:52');
INSERT INTO `cities` VALUES (223, 'Kab. Gunung Kidul', 14, '2019-10-22 07:49:52', '2019-10-22 07:49:52');
INSERT INTO `cities` VALUES (224, 'Kab. Sleman', 14, '2019-10-22 07:49:52', '2019-10-22 07:49:52');
INSERT INTO `cities` VALUES (225, 'Kota Yogyakarta', 14, '2019-10-22 07:49:52', '2019-10-22 07:49:52');
INSERT INTO `cities` VALUES (226, 'Kab. Pacitan', 15, '2019-10-22 07:49:52', '2019-10-22 07:49:52');
INSERT INTO `cities` VALUES (227, 'Kab. Ponorogo', 15, '2019-10-22 07:49:52', '2019-10-22 07:49:52');
INSERT INTO `cities` VALUES (228, 'Kab. Trenggalek', 15, '2019-10-22 07:49:52', '2019-10-22 07:49:52');
INSERT INTO `cities` VALUES (229, 'Kab. Tulungagung', 15, '2019-10-22 07:49:53', '2019-10-22 07:49:53');
INSERT INTO `cities` VALUES (230, 'Kab. Blitar', 15, '2019-10-22 07:49:53', '2019-10-22 07:49:53');
INSERT INTO `cities` VALUES (231, 'Kab. Kediri', 15, '2019-10-22 07:49:53', '2019-10-22 07:49:53');
INSERT INTO `cities` VALUES (232, 'Kab. Malang', 15, '2019-10-22 07:49:53', '2019-10-22 07:49:53');
INSERT INTO `cities` VALUES (233, 'Kab. Lumajang', 15, '2019-10-22 07:49:53', '2019-10-22 07:49:53');
INSERT INTO `cities` VALUES (234, 'Kab. Jember', 15, '2019-10-22 07:49:53', '2019-10-22 07:49:53');
INSERT INTO `cities` VALUES (235, 'Kab. Banyuwangi', 15, '2019-10-22 07:49:53', '2019-10-22 07:49:53');
INSERT INTO `cities` VALUES (236, 'Kab. Bondowoso', 15, '2019-10-22 07:49:53', '2019-10-22 07:49:53');
INSERT INTO `cities` VALUES (237, 'Kab. Situbondo', 15, '2019-10-22 07:49:53', '2019-10-22 07:49:53');
INSERT INTO `cities` VALUES (238, 'Kab. Probolinggo', 15, '2019-10-22 07:49:53', '2019-10-22 07:49:53');
INSERT INTO `cities` VALUES (239, 'Kab. Pasuruan', 15, '2019-10-22 07:49:53', '2019-10-22 07:49:53');
INSERT INTO `cities` VALUES (240, 'Kab. Sidoarjo', 15, '2019-10-22 07:49:53', '2019-10-22 07:49:53');
INSERT INTO `cities` VALUES (241, 'Kab. Mojokerto', 15, '2019-10-22 07:49:53', '2019-10-22 07:49:53');
INSERT INTO `cities` VALUES (242, 'Kab. Jombang', 15, '2019-10-22 07:49:53', '2019-10-22 07:49:53');
INSERT INTO `cities` VALUES (243, 'Kab. Nganjuk', 15, '2019-10-22 07:49:53', '2019-10-22 07:49:53');
INSERT INTO `cities` VALUES (244, 'Kab. Madiun', 15, '2019-10-22 07:49:53', '2019-10-22 07:49:53');
INSERT INTO `cities` VALUES (245, 'Kab. Magetan', 15, '2019-10-22 07:49:53', '2019-10-22 07:49:53');
INSERT INTO `cities` VALUES (246, 'Kab. Ngawi', 15, '2019-10-22 07:49:53', '2019-10-22 07:49:53');
INSERT INTO `cities` VALUES (247, 'Kab. Bojonegoro', 15, '2019-10-22 07:49:53', '2019-10-22 07:49:53');
INSERT INTO `cities` VALUES (248, 'Kab. Tuban', 15, '2019-10-22 07:49:53', '2019-10-22 07:49:53');
INSERT INTO `cities` VALUES (249, 'Kab. Lamongan', 15, '2019-10-22 07:49:53', '2019-10-22 07:49:53');
INSERT INTO `cities` VALUES (250, 'Kab. Gresik', 15, '2019-10-22 07:49:53', '2019-10-22 07:49:53');
INSERT INTO `cities` VALUES (251, 'Kab. Bangkalan', 15, '2019-10-22 07:49:53', '2019-10-22 07:49:53');
INSERT INTO `cities` VALUES (252, 'Kab. Sampang', 15, '2019-10-22 07:49:53', '2019-10-22 07:49:53');
INSERT INTO `cities` VALUES (253, 'Kab. Pamekasan', 15, '2019-10-22 07:49:53', '2019-10-22 07:49:53');
INSERT INTO `cities` VALUES (254, 'Kab. Sumenep', 15, '2019-10-22 07:49:53', '2019-10-22 07:49:53');
INSERT INTO `cities` VALUES (255, 'Kota Kediri', 15, '2019-10-22 07:49:53', '2019-10-22 07:49:53');
INSERT INTO `cities` VALUES (256, 'Kota Blitar', 15, '2019-10-22 07:49:53', '2019-10-22 07:49:53');
INSERT INTO `cities` VALUES (257, 'Kota Malang', 15, '2019-10-22 07:49:53', '2019-10-22 07:49:53');
INSERT INTO `cities` VALUES (258, 'Kota Probolinggo', 15, '2019-10-22 07:49:53', '2019-10-22 07:49:53');
INSERT INTO `cities` VALUES (259, 'Kota Pasuruan', 15, '2019-10-22 07:49:53', '2019-10-22 07:49:53');
INSERT INTO `cities` VALUES (260, 'Kota Mojokerto', 15, '2019-10-22 07:49:54', '2019-10-22 07:49:54');
INSERT INTO `cities` VALUES (261, 'Kota Madiun', 15, '2019-10-22 07:49:54', '2019-10-22 07:49:54');
INSERT INTO `cities` VALUES (262, 'Kota Surabaya', 15, '2019-10-22 07:49:54', '2019-10-22 07:49:54');
INSERT INTO `cities` VALUES (263, 'Kota Batu', 15, '2019-10-22 07:49:54', '2019-10-22 07:49:54');
INSERT INTO `cities` VALUES (264, 'Kab. Pandeglang', 16, '2019-10-22 07:49:54', '2019-10-22 07:49:54');
INSERT INTO `cities` VALUES (265, 'Kab. Lebak', 16, '2019-10-22 07:49:54', '2019-10-22 07:49:54');
INSERT INTO `cities` VALUES (266, 'Kab. Tangerang', 16, '2019-10-22 07:49:54', '2019-10-22 07:49:54');
INSERT INTO `cities` VALUES (267, 'Kab. Serang', 16, '2019-10-22 07:49:54', '2019-10-22 07:49:54');
INSERT INTO `cities` VALUES (268, 'Kota Tangerang', 16, '2019-10-22 07:49:54', '2019-10-22 07:49:54');
INSERT INTO `cities` VALUES (269, 'Kota Cilegon', 16, '2019-10-22 07:49:54', '2019-10-22 07:49:54');
INSERT INTO `cities` VALUES (270, 'Kota Serang', 16, '2019-10-22 07:49:54', '2019-10-22 07:49:54');
INSERT INTO `cities` VALUES (271, 'Kota Tangerang Selatan', 16, '2019-10-22 07:49:54', '2019-10-22 07:49:54');
INSERT INTO `cities` VALUES (272, 'Kab. Jembrana', 17, '2019-10-22 07:49:54', '2019-10-22 07:49:54');
INSERT INTO `cities` VALUES (273, 'Kab. Tabanan', 17, '2019-10-22 07:49:54', '2019-10-22 07:49:54');
INSERT INTO `cities` VALUES (274, 'Kab. Badung', 17, '2019-10-22 07:49:54', '2019-10-22 07:49:54');
INSERT INTO `cities` VALUES (275, 'Kab. Gianyar', 17, '2019-10-22 07:49:54', '2019-10-22 07:49:54');
INSERT INTO `cities` VALUES (276, 'Kab. Klungkung', 17, '2019-10-22 07:49:54', '2019-10-22 07:49:54');
INSERT INTO `cities` VALUES (277, 'Kab. Bangli', 17, '2019-10-22 07:49:54', '2019-10-22 07:49:54');
INSERT INTO `cities` VALUES (278, 'Kab. Karang Asem', 17, '2019-10-22 07:49:54', '2019-10-22 07:49:54');
INSERT INTO `cities` VALUES (279, 'Kab. Buleleng', 17, '2019-10-22 07:49:54', '2019-10-22 07:49:54');
INSERT INTO `cities` VALUES (280, 'Kota Denpasar', 17, '2019-10-22 07:49:54', '2019-10-22 07:49:54');
INSERT INTO `cities` VALUES (281, 'Kab. Lombok Barat', 18, '2019-10-22 07:49:54', '2019-10-22 07:49:54');
INSERT INTO `cities` VALUES (282, 'Kab. Lombok Tengah', 18, '2019-10-22 07:49:54', '2019-10-22 07:49:54');
INSERT INTO `cities` VALUES (283, 'Kab. Lombok Timur', 18, '2019-10-22 07:49:54', '2019-10-22 07:49:54');
INSERT INTO `cities` VALUES (284, 'Kab. Sumbawa', 18, '2019-10-22 07:49:54', '2019-10-22 07:49:54');
INSERT INTO `cities` VALUES (285, 'Kab. Dompu', 18, '2019-10-22 07:49:54', '2019-10-22 07:49:54');
INSERT INTO `cities` VALUES (286, 'Kab. Bima', 18, '2019-10-22 07:49:54', '2019-10-22 07:49:54');
INSERT INTO `cities` VALUES (287, 'Kab. Sumbawa Barat', 18, '2019-10-22 07:49:54', '2019-10-22 07:49:54');
INSERT INTO `cities` VALUES (288, 'Kab. Lombok Utara', 18, '2019-10-22 07:49:54', '2019-10-22 07:49:54');
INSERT INTO `cities` VALUES (289, 'Kota Mataram', 18, '2019-10-22 07:49:54', '2019-10-22 07:49:54');
INSERT INTO `cities` VALUES (290, 'Kota Bima', 18, '2019-10-22 07:49:54', '2019-10-22 07:49:54');
INSERT INTO `cities` VALUES (291, 'Kab. Sumba Barat', 19, '2019-10-22 07:49:55', '2019-10-22 07:49:55');
INSERT INTO `cities` VALUES (292, 'Kab. Sumba Timur', 19, '2019-10-22 07:49:55', '2019-10-22 07:49:55');
INSERT INTO `cities` VALUES (293, 'Kab. Kupang', 19, '2019-10-22 07:49:55', '2019-10-22 07:49:55');
INSERT INTO `cities` VALUES (294, 'Kab. Timor Tengah Selatan', 19, '2019-10-22 07:49:55', '2019-10-22 07:49:55');
INSERT INTO `cities` VALUES (295, 'Kab. Timor Tengah Utara', 19, '2019-10-22 07:49:55', '2019-10-22 07:49:55');
INSERT INTO `cities` VALUES (296, 'Kab. Belu', 19, '2019-10-22 07:49:55', '2019-10-22 07:49:55');
INSERT INTO `cities` VALUES (297, 'Kab. Alor', 19, '2019-10-22 07:49:55', '2019-10-22 07:49:55');
INSERT INTO `cities` VALUES (298, 'Kab. Lembata', 19, '2019-10-22 07:49:55', '2019-10-22 07:49:55');
INSERT INTO `cities` VALUES (299, 'Kab. Flores Timur', 19, '2019-10-22 07:49:55', '2019-10-22 07:49:55');
INSERT INTO `cities` VALUES (300, 'Kab. Sikka', 19, '2019-10-22 07:49:55', '2019-10-22 07:49:55');
INSERT INTO `cities` VALUES (301, 'Kab. Ende', 19, '2019-10-22 07:49:55', '2019-10-22 07:49:55');
INSERT INTO `cities` VALUES (302, 'Kab. Ngada', 19, '2019-10-22 07:49:55', '2019-10-22 07:49:55');
INSERT INTO `cities` VALUES (303, 'Kab. Manggarai', 19, '2019-10-22 07:49:55', '2019-10-22 07:49:55');
INSERT INTO `cities` VALUES (304, 'Kab. Rote Ndao', 19, '2019-10-22 07:49:55', '2019-10-22 07:49:55');
INSERT INTO `cities` VALUES (305, 'Kab. Manggarai Barat', 19, '2019-10-22 07:49:55', '2019-10-22 07:49:55');
INSERT INTO `cities` VALUES (306, 'Kab. Sumba Tengah', 19, '2019-10-22 07:49:55', '2019-10-22 07:49:55');
INSERT INTO `cities` VALUES (307, 'Kab. Sumba Barat Daya', 19, '2019-10-22 07:49:55', '2019-10-22 07:49:55');
INSERT INTO `cities` VALUES (308, 'Kab. Nagekeo', 19, '2019-10-22 07:49:55', '2019-10-22 07:49:55');
INSERT INTO `cities` VALUES (309, 'Kab. Manggarai Timur', 19, '2019-10-22 07:49:55', '2019-10-22 07:49:55');
INSERT INTO `cities` VALUES (310, 'Kab. Sabu Raijua', 19, '2019-10-22 07:49:55', '2019-10-22 07:49:55');
INSERT INTO `cities` VALUES (311, 'Kota Kupang', 19, '2019-10-22 07:49:55', '2019-10-22 07:49:55');
INSERT INTO `cities` VALUES (312, 'Kab. Sambas', 20, '2019-10-22 07:49:55', '2019-10-22 07:49:55');
INSERT INTO `cities` VALUES (313, 'Kab. Bengkayang', 20, '2019-10-22 07:49:55', '2019-10-22 07:49:55');
INSERT INTO `cities` VALUES (314, 'Kab. Landak', 20, '2019-10-22 07:49:55', '2019-10-22 07:49:55');
INSERT INTO `cities` VALUES (315, 'Kab. Pontianak', 20, '2019-10-22 07:49:55', '2019-10-22 07:49:55');
INSERT INTO `cities` VALUES (316, 'Kab. Sanggau', 20, '2019-10-22 07:49:55', '2019-10-22 07:49:55');
INSERT INTO `cities` VALUES (317, 'Kab. Ketapang', 20, '2019-10-22 07:49:55', '2019-10-22 07:49:55');
INSERT INTO `cities` VALUES (318, 'Kab. Sintang', 20, '2019-10-22 07:49:55', '2019-10-22 07:49:55');
INSERT INTO `cities` VALUES (319, 'Kab. Kapuas Hulu', 20, '2019-10-22 07:49:55', '2019-10-22 07:49:55');
INSERT INTO `cities` VALUES (320, 'Kab. Sekadau', 20, '2019-10-22 07:49:55', '2019-10-22 07:49:55');
INSERT INTO `cities` VALUES (321, 'Kab. Melawi', 20, '2019-10-22 07:49:55', '2019-10-22 07:49:55');
INSERT INTO `cities` VALUES (322, 'Kab. Kayong Utara', 20, '2019-10-22 07:49:55', '2019-10-22 07:49:55');
INSERT INTO `cities` VALUES (323, 'Kab. Kubu Raya', 20, '2019-10-22 07:49:55', '2019-10-22 07:49:55');
INSERT INTO `cities` VALUES (324, 'Kota Pontianak', 20, '2019-10-22 07:49:55', '2019-10-22 07:49:55');
INSERT INTO `cities` VALUES (325, 'Kota Singkawang', 20, '2019-10-22 07:49:56', '2019-10-22 07:49:56');
INSERT INTO `cities` VALUES (326, 'Kab. Kotawaringin Barat', 21, '2019-10-22 07:49:56', '2019-10-22 07:49:56');
INSERT INTO `cities` VALUES (327, 'Kab. Kotawaringin Timur', 21, '2019-10-22 07:49:56', '2019-10-22 07:49:56');
INSERT INTO `cities` VALUES (328, 'Kab. Kapuas', 21, '2019-10-22 07:49:56', '2019-10-22 07:49:56');
INSERT INTO `cities` VALUES (329, 'Kab. Barito Selatan', 21, '2019-10-22 07:49:56', '2019-10-22 07:49:56');
INSERT INTO `cities` VALUES (330, 'Kab. Barito Utara', 21, '2019-10-22 07:49:56', '2019-10-22 07:49:56');
INSERT INTO `cities` VALUES (331, 'Kab. Sukamara', 21, '2019-10-22 07:49:56', '2019-10-22 07:49:56');
INSERT INTO `cities` VALUES (332, 'Kab. Lamandau', 21, '2019-10-22 07:49:56', '2019-10-22 07:49:56');
INSERT INTO `cities` VALUES (333, 'Kab. Seruyan', 21, '2019-10-22 07:49:56', '2019-10-22 07:49:56');
INSERT INTO `cities` VALUES (334, 'Kab. Katingan', 21, '2019-10-22 07:49:56', '2019-10-22 07:49:56');
INSERT INTO `cities` VALUES (335, 'Kab. Pulang Pisau', 21, '2019-10-22 07:49:56', '2019-10-22 07:49:56');
INSERT INTO `cities` VALUES (336, 'Kab. Gunung Mas', 21, '2019-10-22 07:49:56', '2019-10-22 07:49:56');
INSERT INTO `cities` VALUES (337, 'Kab. Barito Timur', 21, '2019-10-22 07:49:56', '2019-10-22 07:49:56');
INSERT INTO `cities` VALUES (338, 'Kab. Murung Raya', 21, '2019-10-22 07:49:56', '2019-10-22 07:49:56');
INSERT INTO `cities` VALUES (339, 'Kota Palangka Raya', 21, '2019-10-22 07:49:56', '2019-10-22 07:49:56');
INSERT INTO `cities` VALUES (340, 'Kab. Tanah Laut', 22, '2019-10-22 07:49:56', '2019-10-22 07:49:56');
INSERT INTO `cities` VALUES (341, 'Kab. Kota Baru', 22, '2019-10-22 07:49:56', '2019-10-22 07:49:56');
INSERT INTO `cities` VALUES (342, 'Kab. Banjar', 22, '2019-10-22 07:49:56', '2019-10-22 07:49:56');
INSERT INTO `cities` VALUES (343, 'Kab. Barito Kuala', 22, '2019-10-22 07:49:56', '2019-10-22 07:49:56');
INSERT INTO `cities` VALUES (344, 'Kab. Tapin', 22, '2019-10-22 07:49:56', '2019-10-22 07:49:56');
INSERT INTO `cities` VALUES (345, 'Kab. Hulu Sungai Selatan', 22, '2019-10-22 07:49:56', '2019-10-22 07:49:56');
INSERT INTO `cities` VALUES (346, 'Kab. Hulu Sungai Tengah', 22, '2019-10-22 07:49:56', '2019-10-22 07:49:56');
INSERT INTO `cities` VALUES (347, 'Kab. Hulu Sungai Utara', 22, '2019-10-22 07:49:56', '2019-10-22 07:49:56');
INSERT INTO `cities` VALUES (348, 'Kab. Tabalong', 22, '2019-10-22 07:49:56', '2019-10-22 07:49:56');
INSERT INTO `cities` VALUES (349, 'Kab. Tanah Bumbu', 22, '2019-10-22 07:49:56', '2019-10-22 07:49:56');
INSERT INTO `cities` VALUES (350, 'Kab. Balangan', 22, '2019-10-22 07:49:56', '2019-10-22 07:49:56');
INSERT INTO `cities` VALUES (351, 'Kota Banjarmasin', 22, '2019-10-22 07:49:56', '2019-10-22 07:49:56');
INSERT INTO `cities` VALUES (352, 'Kota Banjar Baru', 22, '2019-10-22 07:49:56', '2019-10-22 07:49:56');
INSERT INTO `cities` VALUES (353, 'Kab. Paser', 23, '2019-10-22 07:49:57', '2019-10-22 07:49:57');
INSERT INTO `cities` VALUES (354, 'Kab. Kutai Barat', 23, '2019-10-22 07:49:57', '2019-10-22 07:49:57');
INSERT INTO `cities` VALUES (355, 'Kab. Kutai Kartanegara', 23, '2019-10-22 07:49:57', '2019-10-22 07:49:57');
INSERT INTO `cities` VALUES (356, 'Kab. Kutai Timur', 23, '2019-10-22 07:49:57', '2019-10-22 07:49:57');
INSERT INTO `cities` VALUES (357, 'Kab. Berau', 23, '2019-10-22 07:49:57', '2019-10-22 07:49:57');
INSERT INTO `cities` VALUES (358, 'Kab. Penajam Paser Utara', 23, '2019-10-22 07:49:57', '2019-10-22 07:49:57');
INSERT INTO `cities` VALUES (359, 'Kota Balikpapan', 23, '2019-10-22 07:49:57', '2019-10-22 07:49:57');
INSERT INTO `cities` VALUES (360, 'Kota Samarinda', 23, '2019-10-22 07:49:57', '2019-10-22 07:49:57');
INSERT INTO `cities` VALUES (361, 'Kota Bontang', 23, '2019-10-22 07:49:57', '2019-10-22 07:49:57');
INSERT INTO `cities` VALUES (362, 'Kab. Malinau', 24, '2019-10-22 07:49:57', '2019-10-22 07:49:57');
INSERT INTO `cities` VALUES (363, 'Kab. Bulungan', 24, '2019-10-22 07:49:57', '2019-10-22 07:49:57');
INSERT INTO `cities` VALUES (364, 'Kab. Tana Tidung', 24, '2019-10-22 07:49:57', '2019-10-22 07:49:57');
INSERT INTO `cities` VALUES (365, 'Kab. Nunukan', 24, '2019-10-22 07:49:57', '2019-10-22 07:49:57');
INSERT INTO `cities` VALUES (366, 'Kota Tarakan', 24, '2019-10-22 07:49:57', '2019-10-22 07:49:57');
INSERT INTO `cities` VALUES (367, 'Kab. Bolaang Mongondow', 25, '2019-10-22 07:49:57', '2019-10-22 07:49:57');
INSERT INTO `cities` VALUES (368, 'Kab. Minahasa', 25, '2019-10-22 07:49:57', '2019-10-22 07:49:57');
INSERT INTO `cities` VALUES (369, 'Kab. Kepulauan Sangihe', 25, '2019-10-22 07:49:57', '2019-10-22 07:49:57');
INSERT INTO `cities` VALUES (370, 'Kab. Kepulauan Talaud', 25, '2019-10-22 07:49:57', '2019-10-22 07:49:57');
INSERT INTO `cities` VALUES (371, 'Kab. Minahasa Selatan', 25, '2019-10-22 07:49:57', '2019-10-22 07:49:57');
INSERT INTO `cities` VALUES (372, 'Kab. Minahasa Utara', 25, '2019-10-22 07:49:57', '2019-10-22 07:49:57');
INSERT INTO `cities` VALUES (373, 'Kab. Bolaang Mongondow Utara', 25, '2019-10-22 07:49:57', '2019-10-22 07:49:57');
INSERT INTO `cities` VALUES (374, 'Kab. Siau Tagulandang Biaro', 25, '2019-10-22 07:49:57', '2019-10-22 07:49:57');
INSERT INTO `cities` VALUES (375, 'Kab. Minahasa Tenggara', 25, '2019-10-22 07:49:57', '2019-10-22 07:49:57');
INSERT INTO `cities` VALUES (376, 'Kab. Bolaang Mongondow Selatan', 25, '2019-10-22 07:49:57', '2019-10-22 07:49:57');
INSERT INTO `cities` VALUES (377, 'Kab. Bolaang Mongondow Timur', 25, '2019-10-22 07:49:57', '2019-10-22 07:49:57');
INSERT INTO `cities` VALUES (378, 'Kota Manado', 25, '2019-10-22 07:49:57', '2019-10-22 07:49:57');
INSERT INTO `cities` VALUES (379, 'Kota Bitung', 25, '2019-10-22 07:49:57', '2019-10-22 07:49:57');
INSERT INTO `cities` VALUES (380, 'Kota Tomohon', 25, '2019-10-22 07:49:57', '2019-10-22 07:49:57');
INSERT INTO `cities` VALUES (381, 'Kota Kotamobagu', 25, '2019-10-22 07:49:57', '2019-10-22 07:49:57');
INSERT INTO `cities` VALUES (382, 'Kab. Banggai Kepulauan', 26, '2019-10-22 07:49:58', '2019-10-22 07:49:58');
INSERT INTO `cities` VALUES (383, 'Kab. Banggai', 26, '2019-10-22 07:49:58', '2019-10-22 07:49:58');
INSERT INTO `cities` VALUES (384, 'Kab. Morowali', 26, '2019-10-22 07:49:58', '2019-10-22 07:49:58');
INSERT INTO `cities` VALUES (385, 'Kab. Poso', 26, '2019-10-22 07:49:58', '2019-10-22 07:49:58');
INSERT INTO `cities` VALUES (386, 'Kab. Donggala', 26, '2019-10-22 07:49:58', '2019-10-22 07:49:58');
INSERT INTO `cities` VALUES (387, 'Kab. Toli-toli', 26, '2019-10-22 07:49:58', '2019-10-22 07:49:58');
INSERT INTO `cities` VALUES (388, 'Kab. Buol', 26, '2019-10-22 07:49:58', '2019-10-22 07:49:58');
INSERT INTO `cities` VALUES (389, 'Kab. Parigi Moutong', 26, '2019-10-22 07:49:58', '2019-10-22 07:49:58');
INSERT INTO `cities` VALUES (390, 'Kab. Tojo Una-una', 26, '2019-10-22 07:49:58', '2019-10-22 07:49:58');
INSERT INTO `cities` VALUES (391, 'Kab. Sigi', 26, '2019-10-22 07:49:58', '2019-10-22 07:49:58');
INSERT INTO `cities` VALUES (392, 'Kota Palu', 26, '2019-10-22 07:49:58', '2019-10-22 07:49:58');
INSERT INTO `cities` VALUES (393, 'Kab. Kepulauan Selayar', 27, '2019-10-22 07:49:58', '2019-10-22 07:49:58');
INSERT INTO `cities` VALUES (394, 'Kab. Bulukumba', 27, '2019-10-22 07:49:58', '2019-10-22 07:49:58');
INSERT INTO `cities` VALUES (395, 'Kab. Bantaeng', 27, '2019-10-22 07:49:58', '2019-10-22 07:49:58');
INSERT INTO `cities` VALUES (396, 'Kab. Jeneponto', 27, '2019-10-22 07:49:58', '2019-10-22 07:49:58');
INSERT INTO `cities` VALUES (397, 'Kab. Takalar', 27, '2019-10-22 07:49:58', '2019-10-22 07:49:58');
INSERT INTO `cities` VALUES (398, 'Kab. Gowa', 27, '2019-10-22 07:49:58', '2019-10-22 07:49:58');
INSERT INTO `cities` VALUES (399, 'Kab. Sinjai', 27, '2019-10-22 07:49:58', '2019-10-22 07:49:58');
INSERT INTO `cities` VALUES (400, 'Kab. Maros', 27, '2019-10-22 07:49:58', '2019-10-22 07:49:58');
INSERT INTO `cities` VALUES (401, 'Kab. Pangkajene Dan Kepulauan', 27, '2019-10-22 07:49:58', '2019-10-22 07:49:58');
INSERT INTO `cities` VALUES (402, 'Kab. Barru', 27, '2019-10-22 07:49:58', '2019-10-22 07:49:58');
INSERT INTO `cities` VALUES (403, 'Kab. Bone', 27, '2019-10-22 07:49:58', '2019-10-22 07:49:58');
INSERT INTO `cities` VALUES (404, 'Kab. Soppeng', 27, '2019-10-22 07:49:58', '2019-10-22 07:49:58');
INSERT INTO `cities` VALUES (405, 'Kab. Wajo', 27, '2019-10-22 07:49:58', '2019-10-22 07:49:58');
INSERT INTO `cities` VALUES (406, 'Kab. Sidenreng Rappang', 27, '2019-10-22 07:49:58', '2019-10-22 07:49:58');
INSERT INTO `cities` VALUES (407, 'Kab. Pinrang', 27, '2019-10-22 07:49:58', '2019-10-22 07:49:58');
INSERT INTO `cities` VALUES (408, 'Kab. Enrekang', 27, '2019-10-22 07:49:58', '2019-10-22 07:49:58');
INSERT INTO `cities` VALUES (409, 'Kab. Luwu', 27, '2019-10-22 07:49:59', '2019-10-22 07:49:59');
INSERT INTO `cities` VALUES (410, 'Kab. Tana Toraja', 27, '2019-10-22 07:49:59', '2019-10-22 07:49:59');
INSERT INTO `cities` VALUES (411, 'Kab. Luwu Utara', 27, '2019-10-22 07:49:59', '2019-10-22 07:49:59');
INSERT INTO `cities` VALUES (412, 'Kab. Luwu Timur', 27, '2019-10-22 07:49:59', '2019-10-22 07:49:59');
INSERT INTO `cities` VALUES (413, 'Kab. Toraja Utara', 27, '2019-10-22 07:49:59', '2019-10-22 07:49:59');
INSERT INTO `cities` VALUES (414, 'Kota Makassar', 27, '2019-10-22 07:49:59', '2019-10-22 07:49:59');
INSERT INTO `cities` VALUES (415, 'Kota Parepare', 27, '2019-10-22 07:49:59', '2019-10-22 07:49:59');
INSERT INTO `cities` VALUES (416, 'Kota Palopo', 27, '2019-10-22 07:49:59', '2019-10-22 07:49:59');
INSERT INTO `cities` VALUES (417, 'Kab. Buton', 28, '2019-10-22 07:49:59', '2019-10-22 07:49:59');
INSERT INTO `cities` VALUES (418, 'Kab. Muna', 28, '2019-10-22 07:49:59', '2019-10-22 07:49:59');
INSERT INTO `cities` VALUES (419, 'Kab. Konawe', 28, '2019-10-22 07:49:59', '2019-10-22 07:49:59');
INSERT INTO `cities` VALUES (420, 'Kab. Kolaka', 28, '2019-10-22 07:49:59', '2019-10-22 07:49:59');
INSERT INTO `cities` VALUES (421, 'Kab. Konawe Selatan', 28, '2019-10-22 07:49:59', '2019-10-22 07:49:59');
INSERT INTO `cities` VALUES (422, 'Kab. Bombana', 28, '2019-10-22 07:49:59', '2019-10-22 07:49:59');
INSERT INTO `cities` VALUES (423, 'Kab. Wakatobi', 28, '2019-10-22 07:49:59', '2019-10-22 07:49:59');
INSERT INTO `cities` VALUES (424, 'Kab. Kolaka Utara', 28, '2019-10-22 07:49:59', '2019-10-22 07:49:59');
INSERT INTO `cities` VALUES (425, 'Kab. Buton Utara', 28, '2019-10-22 07:49:59', '2019-10-22 07:49:59');
INSERT INTO `cities` VALUES (426, 'Kab. Konawe Utara', 28, '2019-10-22 07:49:59', '2019-10-22 07:49:59');
INSERT INTO `cities` VALUES (427, 'Kota Kendari', 28, '2019-10-22 07:49:59', '2019-10-22 07:49:59');
INSERT INTO `cities` VALUES (428, 'Kota Baubau', 28, '2019-10-22 07:49:59', '2019-10-22 07:49:59');
INSERT INTO `cities` VALUES (429, 'Kab. Boalemo', 29, '2019-10-22 07:49:59', '2019-10-22 07:49:59');
INSERT INTO `cities` VALUES (430, 'Kab. Gorontalo', 29, '2019-10-22 07:49:59', '2019-10-22 07:49:59');
INSERT INTO `cities` VALUES (431, 'Kab. Pohuwato', 29, '2019-10-22 07:49:59', '2019-10-22 07:49:59');
INSERT INTO `cities` VALUES (432, 'Kab. Bone Bolango', 29, '2019-10-22 07:49:59', '2019-10-22 07:49:59');
INSERT INTO `cities` VALUES (433, 'Kab. Gorontalo Utara', 29, '2019-10-22 07:49:59', '2019-10-22 07:49:59');
INSERT INTO `cities` VALUES (434, 'Kota Gorontalo', 29, '2019-10-22 07:49:59', '2019-10-22 07:49:59');
INSERT INTO `cities` VALUES (435, 'Kab. Majene', 30, '2019-10-22 07:50:00', '2019-10-22 07:50:00');
INSERT INTO `cities` VALUES (436, 'Kab. Polewali Mandar', 30, '2019-10-22 07:50:00', '2019-10-22 07:50:00');
INSERT INTO `cities` VALUES (437, 'Kab. Mamasa', 30, '2019-10-22 07:50:00', '2019-10-22 07:50:00');
INSERT INTO `cities` VALUES (438, 'Kab. Mamuju', 30, '2019-10-22 07:50:00', '2019-10-22 07:50:00');
INSERT INTO `cities` VALUES (439, 'Kab. Mamuju Utara', 30, '2019-10-22 07:50:00', '2019-10-22 07:50:00');
INSERT INTO `cities` VALUES (440, 'Kab. Maluku Tenggara Barat', 31, '2019-10-22 07:50:00', '2019-10-22 07:50:00');
INSERT INTO `cities` VALUES (441, 'Kab. Maluku Tenggara', 31, '2019-10-22 07:50:00', '2019-10-22 07:50:00');
INSERT INTO `cities` VALUES (442, 'Kab. Maluku Tengah', 31, '2019-10-22 07:50:00', '2019-10-22 07:50:00');
INSERT INTO `cities` VALUES (443, 'Kab. Buru', 31, '2019-10-22 07:50:00', '2019-10-22 07:50:00');
INSERT INTO `cities` VALUES (444, 'Kab. Kepulauan Aru', 31, '2019-10-22 07:50:00', '2019-10-22 07:50:00');
INSERT INTO `cities` VALUES (445, 'Kab. Seram Bagian Barat', 31, '2019-10-22 07:50:00', '2019-10-22 07:50:00');
INSERT INTO `cities` VALUES (446, 'Kab. Seram Bagian Timur', 31, '2019-10-22 07:50:00', '2019-10-22 07:50:00');
INSERT INTO `cities` VALUES (447, 'Kab. Maluku Barat Daya', 31, '2019-10-22 07:50:00', '2019-10-22 07:50:00');
INSERT INTO `cities` VALUES (448, 'Kab. Buru Selatan', 31, '2019-10-22 07:50:00', '2019-10-22 07:50:00');
INSERT INTO `cities` VALUES (449, 'Kota Ambon', 31, '2019-10-22 07:50:00', '2019-10-22 07:50:00');
INSERT INTO `cities` VALUES (450, 'Kota Tual', 31, '2019-10-22 07:50:00', '2019-10-22 07:50:00');
INSERT INTO `cities` VALUES (451, 'Kab. Halmahera Barat', 32, '2019-10-22 07:50:00', '2019-10-22 07:50:00');
INSERT INTO `cities` VALUES (452, 'Kab. Halmahera Tengah', 32, '2019-10-22 07:50:00', '2019-10-22 07:50:00');
INSERT INTO `cities` VALUES (453, 'Kab. Kepulauan Sula', 32, '2019-10-22 07:50:00', '2019-10-22 07:50:00');
INSERT INTO `cities` VALUES (454, 'Kab. Halmahera Selatan', 32, '2019-10-22 07:50:00', '2019-10-22 07:50:00');
INSERT INTO `cities` VALUES (455, 'Kab. Halmahera Utara', 32, '2019-10-22 07:50:00', '2019-10-22 07:50:00');
INSERT INTO `cities` VALUES (456, 'Kab. Halmahera Timur', 32, '2019-10-22 07:50:00', '2019-10-22 07:50:00');
INSERT INTO `cities` VALUES (457, 'Kab. Pulau Morotai', 32, '2019-10-22 07:50:00', '2019-10-22 07:50:00');
INSERT INTO `cities` VALUES (458, 'Kota Ternate', 32, '2019-10-22 07:50:00', '2019-10-22 07:50:00');
INSERT INTO `cities` VALUES (459, 'Kota Tidore Kepulauan', 32, '2019-10-22 07:50:00', '2019-10-22 07:50:00');
INSERT INTO `cities` VALUES (460, 'Kab. Fakfak', 33, '2019-10-22 07:50:00', '2019-10-22 07:50:00');
INSERT INTO `cities` VALUES (461, 'Kab. Kaimana', 33, '2019-10-22 07:50:00', '2019-10-22 07:50:00');
INSERT INTO `cities` VALUES (462, 'Kab. Teluk Wondama', 33, '2019-10-22 07:50:00', '2019-10-22 07:50:00');
INSERT INTO `cities` VALUES (463, 'Kab. Teluk Bintuni', 33, '2019-10-22 07:50:00', '2019-10-22 07:50:00');
INSERT INTO `cities` VALUES (464, 'Kab. Manokwari', 33, '2019-10-22 07:50:00', '2019-10-22 07:50:00');
INSERT INTO `cities` VALUES (465, 'Kab. Sorong Selatan', 33, '2019-10-22 07:50:00', '2019-10-22 07:50:00');
INSERT INTO `cities` VALUES (466, 'Kab. Sorong', 33, '2019-10-22 07:50:00', '2019-10-22 07:50:00');
INSERT INTO `cities` VALUES (467, 'Kab. Raja Ampat', 33, '2019-10-22 07:50:00', '2019-10-22 07:50:00');
INSERT INTO `cities` VALUES (468, 'Kab. Tambrauw', 33, '2019-10-22 07:50:01', '2019-10-22 07:50:01');
INSERT INTO `cities` VALUES (469, 'Kab. Maybrat', 33, '2019-10-22 07:50:01', '2019-10-22 07:50:01');
INSERT INTO `cities` VALUES (470, 'Kota Sorong', 33, '2019-10-22 07:50:01', '2019-10-22 07:50:01');
INSERT INTO `cities` VALUES (471, 'Kab. Merauke', 34, '2019-10-22 07:50:01', '2019-10-22 07:50:01');
INSERT INTO `cities` VALUES (472, 'Kab. Jayawijaya', 34, '2019-10-22 07:50:01', '2019-10-22 07:50:01');
INSERT INTO `cities` VALUES (473, 'Kab. Jayapura', 34, '2019-10-22 07:50:01', '2019-10-22 07:50:01');
INSERT INTO `cities` VALUES (474, 'Kab. Nabire', 34, '2019-10-22 07:50:01', '2019-10-22 07:50:01');
INSERT INTO `cities` VALUES (475, 'Kab. Kepulauan Yapen', 34, '2019-10-22 07:50:01', '2019-10-22 07:50:01');
INSERT INTO `cities` VALUES (476, 'Kab. Biak Numfor', 34, '2019-10-22 07:50:01', '2019-10-22 07:50:01');
INSERT INTO `cities` VALUES (477, 'Kab. Paniai', 34, '2019-10-22 07:50:01', '2019-10-22 07:50:01');
INSERT INTO `cities` VALUES (478, 'Kab. Puncak Jaya', 34, '2019-10-22 07:50:01', '2019-10-22 07:50:01');
INSERT INTO `cities` VALUES (479, 'Kab. Mimika', 34, '2019-10-22 07:50:01', '2019-10-22 07:50:01');
INSERT INTO `cities` VALUES (480, 'Kab. Boven Digoel', 34, '2019-10-22 07:50:01', '2019-10-22 07:50:01');
INSERT INTO `cities` VALUES (481, 'Kab. Mappi', 34, '2019-10-22 07:50:01', '2019-10-22 07:50:01');
INSERT INTO `cities` VALUES (482, 'Kab. Asmat', 34, '2019-10-22 07:50:01', '2019-10-22 07:50:01');
INSERT INTO `cities` VALUES (483, 'Kab. Yahukimo', 34, '2019-10-22 07:50:01', '2019-10-22 07:50:01');
INSERT INTO `cities` VALUES (484, 'Kab. Pegunungan Bintang', 34, '2019-10-22 07:50:01', '2019-10-22 07:50:01');
INSERT INTO `cities` VALUES (485, 'Kab. Tolikara', 34, '2019-10-22 07:50:01', '2019-10-22 07:50:01');
INSERT INTO `cities` VALUES (486, 'Kab. Sarmi', 34, '2019-10-22 07:50:01', '2019-10-22 07:50:01');
INSERT INTO `cities` VALUES (487, 'Kab. Keerom', 34, '2019-10-22 07:50:01', '2019-10-22 07:50:01');
INSERT INTO `cities` VALUES (488, 'Kab. Waropen', 34, '2019-10-22 07:50:01', '2019-10-22 07:50:01');
INSERT INTO `cities` VALUES (489, 'Kab. Supiori', 34, '2019-10-22 07:50:01', '2019-10-22 07:50:01');
INSERT INTO `cities` VALUES (490, 'Kab. Mamberamo Raya', 34, '2019-10-22 07:50:01', '2019-10-22 07:50:01');
INSERT INTO `cities` VALUES (491, 'Kab. Nduga', 34, '2019-10-22 07:50:01', '2019-10-22 07:50:01');
INSERT INTO `cities` VALUES (492, 'Kab. Lanny Jaya', 34, '2019-10-22 07:50:01', '2019-10-22 07:50:01');
INSERT INTO `cities` VALUES (493, 'Kab. Mamberamo Tengah', 34, '2019-10-22 07:50:01', '2019-10-22 07:50:01');
INSERT INTO `cities` VALUES (494, 'Kab. Yalimo', 34, '2019-10-22 07:50:01', '2019-10-22 07:50:01');
INSERT INTO `cities` VALUES (495, 'Kab. Puncak', 34, '2019-10-22 07:50:01', '2019-10-22 07:50:01');
INSERT INTO `cities` VALUES (496, 'Kab. Dogiyai', 34, '2019-10-22 07:50:01', '2019-10-22 07:50:01');
INSERT INTO `cities` VALUES (497, 'Kab. Intan Jaya', 34, '2019-10-22 07:50:01', '2019-10-22 07:50:01');
INSERT INTO `cities` VALUES (498, 'Kab. Deiyai', 34, '2019-10-22 07:50:01', '2019-10-22 07:50:01');
INSERT INTO `cities` VALUES (499, 'Kota Jayapura', 34, '2019-10-22 07:50:01', '2019-10-22 07:50:01');

-- ----------------------------
-- Table structure for coa
-- ----------------------------
DROP TABLE IF EXISTS `coa`;
CREATE TABLE `coa`  (
  `id_coa` int(11) NOT NULL AUTO_INCREMENT,
  `name` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`id_coa`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of coa
-- ----------------------------
INSERT INTO `coa` VALUES (1, 'Aktiva');
INSERT INTO `coa` VALUES (2, 'Kewajiban');
INSERT INTO `coa` VALUES (3, 'Aktiva Bersih');
INSERT INTO `coa` VALUES (4, 'Penerimaan');
INSERT INTO `coa` VALUES (5, 'Biaya');

-- ----------------------------
-- Table structure for component_jadwal
-- ----------------------------
DROP TABLE IF EXISTS `component_jadwal`;
CREATE TABLE `component_jadwal`  (
  `id_component_jadwal` int(11) NOT NULL AUTO_INCREMENT,
  `tanggal` date NULL DEFAULT NULL,
  `idjam_fk` int(11) NULL DEFAULT NULL,
  `idguru_fk` int(11) NULL DEFAULT NULL,
  `idpelajaran_fk` int(11) NULL DEFAULT NULL,
  `idkelas_fk` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_component_jadwal`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for component_penilaian_kinerja_guru
-- ----------------------------
DROP TABLE IF EXISTS `component_penilaian_kinerja_guru`;
CREATE TABLE `component_penilaian_kinerja_guru`  (
  `id_component_penilaian_kinerja_guru` int(11) NOT NULL AUTO_INCREMENT,
  `idpenilaiankinerjaguru_fk` int(11) NULL DEFAULT NULL,
  `idsubkompetensipkg_fk` int(11) NULL DEFAULT NULL,
  `nilai` int(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id_component_penilaian_kinerja_guru`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department`  (
  `id_department` int(11) NOT NULL AUTO_INCREMENT,
  `department` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`id_department`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES (1, 'SMK');
INSERT INTO `department` VALUES (2, 'SMP');

-- ----------------------------
-- Table structure for detail_pemasukan_lain
-- ----------------------------
DROP TABLE IF EXISTS `detail_pemasukan_lain`;
CREATE TABLE `detail_pemasukan_lain`  (
  `id_detail_pemasukan_lain` int(11) NOT NULL AUTO_INCREMENT,
  `idpemasukanlain_fk` int(11) NULL DEFAULT NULL,
  `keterangan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `jumlah` double(20, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`id_detail_pemasukan_lain`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for detail_pengeluaran_lain
-- ----------------------------
DROP TABLE IF EXISTS `detail_pengeluaran_lain`;
CREATE TABLE `detail_pengeluaran_lain`  (
  `id_detail_pengeluaran_lain` int(11) NOT NULL AUTO_INCREMENT,
  `idpengeluaranlain_fk` int(11) NULL DEFAULT NULL,
  `keterangan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `jumlah` double(20, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`id_detail_pengeluaran_lain`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for detail_transaksi_tanggungan_alumni
-- ----------------------------
DROP TABLE IF EXISTS `detail_transaksi_tanggungan_alumni`;
CREATE TABLE `detail_transaksi_tanggungan_alumni`  (
  `id_detail_transaksi_tanggungan_alumni` int(1) NOT NULL AUTO_INCREMENT,
  `idtanggunganalumni_fk` int(11) NULL DEFAULT NULL,
  `jumlah` decimal(10, 0) NULL DEFAULT NULL,
  `create_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `idtransaksitanggunganalumni_fk` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_detail_transaksi_tanggungan_alumni`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of detail_transaksi_tanggungan_alumni
-- ----------------------------
INSERT INTO `detail_transaksi_tanggungan_alumni` VALUES (1, 3, 15000, '2022-08-23 12:14:33', 1);
INSERT INTO `detail_transaksi_tanggungan_alumni` VALUES (2, 6, 20000, '2022-08-23 12:14:33', 1);
INSERT INTO `detail_transaksi_tanggungan_alumni` VALUES (3, 3, 15000, '2022-08-23 12:18:33', 2);
INSERT INTO `detail_transaksi_tanggungan_alumni` VALUES (4, 6, 150000, '2022-08-23 12:18:33', 2);

-- ----------------------------
-- Table structure for detail_transaksi_tanggungan_siswa
-- ----------------------------
DROP TABLE IF EXISTS `detail_transaksi_tanggungan_siswa`;
CREATE TABLE `detail_transaksi_tanggungan_siswa`  (
  `id_detail_transaksi_tanggungan_siswa` int(1) NOT NULL AUTO_INCREMENT,
  `idjenispenerimaan_fk` int(11) NULL DEFAULT NULL,
  `jumlah` decimal(10, 0) NULL DEFAULT NULL,
  `create_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `idtransaksitanggungansiswa_fk` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_detail_transaksi_tanggungan_siswa`) USING BTREE,
  INDEX `idtransaksitanggungansiswa_fk`(`idtransaksitanggungansiswa_fk`) USING BTREE,
  CONSTRAINT `detail_transaksi_tanggungan_siswa_ibfk_1` FOREIGN KEY (`idtransaksitanggungansiswa_fk`) REFERENCES `transaksi_tanggungan_siswa` (`id_transaksi_tanggungan_siswa`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for dokumen_pegawai
-- ----------------------------
DROP TABLE IF EXISTS `dokumen_pegawai`;
CREATE TABLE `dokumen_pegawai`  (
  `id_dokumen_pegawai` int(11) NOT NULL AUTO_INCREMENT,
  `idguru_fk` int(11) NULL DEFAULT NULL,
  `nama` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `file` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `keterangan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`id_dokumen_pegawai`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for dudi
-- ----------------------------
DROP TABLE IF EXISTS `dudi`;
CREATE TABLE `dudi`  (
  `id_dudi` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `alamat` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `no_hp` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_dudi`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of dudi
-- ----------------------------
INSERT INTO `dudi` VALUES (2, 'PT. Integritas Papua Mandiri', 'Papua', '085894635005');
INSERT INTO `dudi` VALUES (3, 'PT. Sakti Kinarya', 'Jakarta', '0858946350051');
INSERT INTO `dudi` VALUES (4, 'PT. Myber Center', 'Malang', '085894635005');

-- ----------------------------
-- Table structure for erapor
-- ----------------------------
DROP TABLE IF EXISTS `erapor`;
CREATE TABLE `erapor`  (
  `id_erapor` int(11) NOT NULL AUTO_INCREMENT,
  `tanggal_mulai` date NULL DEFAULT NULL,
  `tanggal_selesai` date NULL DEFAULT NULL,
  `kode` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `is_active` int(255) NULL DEFAULT 0,
  `keterangan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`id_erapor`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of erapor
-- ----------------------------
INSERT INTO `erapor` VALUES (1, '2021-07-09', '2021-07-16', 'ABS123', 1, NULL);

-- ----------------------------
-- Table structure for event
-- ----------------------------
DROP TABLE IF EXISTS `event`;
CREATE TABLE `event`  (
  `id_event` int(11) NOT NULL AUTO_INCREMENT,
  `event` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `tanggal` date NULL DEFAULT NULL,
  `notulensi` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `file` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`id_event`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of event
-- ----------------------------
INSERT INTO `event` VALUES (1, 'Rapat Koordinasi', '2021-09-04', '', NULL);

-- ----------------------------
-- Table structure for file_oas
-- ----------------------------
DROP TABLE IF EXISTS `file_oas`;
CREATE TABLE `file_oas`  (
  `id_file_oas` int(11) NOT NULL AUTO_INCREMENT,
  `file_oas` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `idsiswa_fk` int(11) NULL DEFAULT NULL,
  `status` int(1) NULL DEFAULT NULL,
  `is_active` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_file_oas`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for file_rapor_online
-- ----------------------------
DROP TABLE IF EXISTS `file_rapor_online`;
CREATE TABLE `file_rapor_online`  (
  `id_file_rapor_online` int(11) NOT NULL AUTO_INCREMENT,
  `file_rapor_online` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `idsiswa_fk` int(11) NULL DEFAULT NULL,
  `idtahunajaran_fk` int(11) NULL DEFAULT NULL,
  `trans_code` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `status` int(11) NULL DEFAULT 1,
  `is_active` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id_file_rapor_online`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for groups
-- ----------------------------
DROP TABLE IF EXISTS `groups`;
CREATE TABLE `groups`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of groups
-- ----------------------------
INSERT INTO `groups` VALUES (1, 'admin', 'Administrator');
INSERT INTO `groups` VALUES (2, 'siswa', 'Siswa');
INSERT INTO `groups` VALUES (3, 'guru', 'Guru');
INSERT INTO `groups` VALUES (4, 'BK', 'BK');
INSERT INTO `groups` VALUES (5, 'kepsek', 'kepsek');
INSERT INTO `groups` VALUES (6, 'kurikulum', 'kurikulum');
INSERT INTO `groups` VALUES (7, 'tu', 'Tata Usaha');
INSERT INTO `groups` VALUES (8, 'kesiswaan', 'Kesiswaan');
INSERT INTO `groups` VALUES (9, 'kaprog', 'Kaprog');
INSERT INTO `groups` VALUES (10, 'koperasi', 'Koperasi');
INSERT INTO `groups` VALUES (11, 'ortu', 'ortu');
INSERT INTO `groups` VALUES (12, 'bendahara', 'Bendahara');
INSERT INTO `groups` VALUES (13, 'humas', 'Hubungan Masyarakat');

-- ----------------------------
-- Table structure for guru
-- ----------------------------
DROP TABLE IF EXISTS `guru`;
CREATE TABLE `guru`  (
  `id_guru` int(11) NOT NULL AUTO_INCREMENT,
  `nama` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `nip` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `alamat` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `foto` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `pendidikan_terakhir` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `instansi` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `fb` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `ig` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `twitter` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `youtube` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `jabatan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `email` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `no_hp` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `jenis_kelamin` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `tempat_lahir` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `agama` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `kewarganegaraan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `status_pernikahan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `status_rumah` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `jarak_ke_kantor` int(255) NULL DEFAULT NULL,
  `bb` int(255) NULL DEFAULT NULL,
  `tb` int(255) NULL DEFAULT NULL,
  `gd` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `penyakit` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `kelainan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `no_karpeg` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `mulai_bertugas` date NULL DEFAULT NULL,
  `berasal_dari` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `tanggal_meninggalkan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `alasan_meninggalkan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `kode_pegawai` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `istri` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `status_kepegawaian` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `no_taspen` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `tanggal_lahir` date NULL DEFAULT NULL,
  PRIMARY KEY (`id_guru`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of guru
-- ----------------------------
INSERT INTO `guru` VALUES (1, 'ALISSANDRI GARNASIS WIBERTH J, S.Pd', '123', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '082140815104', 'Laki-laki', '', 'Islam', 'WNI', 'Kawin', 'Rumah Pribadi', 0, 0, 0, 'A', '', '', '', '0000-00-00', '', '', '', 'G774572', '', 'PNS', '', '0000-00-00');
INSERT INTO `guru` VALUES (2, 'DIDIK EKO SURYANTO, S.Kom', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '081359283283', 'Laki-laki', '', 'Islam', 'WNI', 'Kawin', 'Rumah Pribadi', 0, 0, 0, 'A', '', '', '', '0000-00-00', '', '', '', 'G138370', '', 'PNS', '', '0000-00-00');
INSERT INTO `guru` VALUES (3, 'DINA EKASARI, S.Pd', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '085735874679', 'Perempuan', '', 'Islam', 'WNA', 'Kawin', 'Rumah Pribadi', 0, 0, 0, 'A', '', '', '', '0000-00-00', '', '', '', 'G478142', '', 'Non PNS', '', '0000-00-00');
INSERT INTO `guru` VALUES (4, 'FERDINA DIAN SULISTIANINGRUM, S.Pd', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', 'Perempuan', '', 'Islam', 'WNI', 'Kawin', 'Rumah Pribadi', 0, 0, 0, 'A', '', '', '', '0000-00-00', '', '', '', 'G647928', '', 'PNS', '', '0000-00-00');
INSERT INTO `guru` VALUES (5, 'FUAD EKO DARMINTO, S.T', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `guru` VALUES (6, 'GELORA YUDHA SWARA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `guru` VALUES (7, 'HANIF MUKLISIN, S.Pd', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `guru` VALUES (8, 'IMAM QOMARUDDIN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `guru` VALUES (9, 'LINDA KHUSNUL QOTIMAH, S.Pd', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `guru` VALUES (10, 'MUSTOFA KAMAL, S.Pd', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `guru` VALUES (11, 'MISNO, S.Pd.I', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `guru` VALUES (12, 'NGARIFIN, S.T', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `guru` VALUES (13, 'RINDIANA TRIA AGUS TINAWATI, S.P', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `guru` VALUES (14, 'RUDI HARTONO, ST', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `guru` VALUES (15, 'SITI UBADAH, S.Pd', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `guru` VALUES (16, 'TOFAN TRIA SAMODRA, S.Pd ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `guru` VALUES (17, 'TRIDON YANG ASTAMI, A.Md', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `guru` VALUES (18, 'YENI INDRI MAMIRI, S.Pd', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `guru` VALUES (20, 'YULI SUSANTI, S.Pd', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `guru` VALUES (21, 'FITRIYANI DUWI FATHUR ROHMAH, S.Pd.I', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `guru` VALUES (22, 'LAKUN BUDIONO, S.Pd.I', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `guru` VALUES (23, 'DIDIK YULYANTORO, S.Pd', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `guru` VALUES (24, 'DIAN NURUL AFIFAH, S.Pd', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `guru` VALUES (25, 'ENTRI HANDAYANI, A.P', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', 'Laki-laki', '', 'Islam', 'WNA', 'Kawin', 'Rumah Pribadi', 0, 0, 0, 'A', '', '', '', '0000-00-00', '', '', '', 'A2', '', 'Non PNS', '', '0000-00-00');
INSERT INTO `guru` VALUES (26, 'IMAM MUHTAROM', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', 'Laki-laki', '', 'Islam', 'WNA', 'Kawin', 'Rumah Pribadi', 0, 0, 0, 'A', '', '', '', '0000-00-00', '', '', '', 'A1', '', 'Non PNS', '', '0000-00-00');
INSERT INTO `guru` VALUES (27, 'Rendy Yani Susanto, S.Pd', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', 'Laki-laki', 'Malang', 'Islam', 'WNI', 'Kawin', 'Rumah Pribadi', 0, 0, 0, 'A', '', '', '', '0000-00-00', '', '', '', 'G518346', '', 'PNS', '', '0000-00-00');

-- ----------------------------
-- Table structure for guru_mapel
-- ----------------------------
DROP TABLE IF EXISTS `guru_mapel`;
CREATE TABLE `guru_mapel`  (
  `id_guru_mapel` int(11) NOT NULL AUTO_INCREMENT,
  `idguru_fk` int(11) NULL DEFAULT NULL,
  `idmapel_fk` int(11) NULL DEFAULT NULL,
  `idtahunajaran_fk` int(11) NULL DEFAULT NULL,
  `idkelas_fk` int(11) NULL DEFAULT NULL,
  `jKode` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_guru_mapel`) USING BTREE,
  INDEX `idguru_fk`(`idguru_fk`) USING BTREE,
  INDEX `idmapel_fk`(`idmapel_fk`) USING BTREE,
  CONSTRAINT `guru_mapel_ibfk_1` FOREIGN KEY (`idguru_fk`) REFERENCES `guru` (`id_guru`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `guru_mapel_ibfk_2` FOREIGN KEY (`idmapel_fk`) REFERENCES `mata_pelajaran` (`id_mata_pelajaran`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of guru_mapel
-- ----------------------------
INSERT INTO `guru_mapel` VALUES (2, 26, 1, 4, 39, NULL);
INSERT INTO `guru_mapel` VALUES (3, 25, 2, 4, 39, NULL);
INSERT INTO `guru_mapel` VALUES (4, 15, 1, 4, 41, NULL);
INSERT INTO `guru_mapel` VALUES (5, 16, 2, 4, 41, NULL);

-- ----------------------------
-- Table structure for hari
-- ----------------------------
DROP TABLE IF EXISTS `hari`;
CREATE TABLE `hari`  (
  `id_hari` int(11) NOT NULL AUTO_INCREMENT,
  `hari` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `code` int(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id_hari`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of hari
-- ----------------------------
INSERT INTO `hari` VALUES (1, 'Senin', 1);
INSERT INTO `hari` VALUES (2, 'Selasa', 2);
INSERT INTO `hari` VALUES (3, 'Rabu', 3);
INSERT INTO `hari` VALUES (4, 'Kamis', 4);
INSERT INTO `hari` VALUES (5, 'Jumat', 5);
INSERT INTO `hari` VALUES (6, 'Sabtu', 6);

-- ----------------------------
-- Table structure for hobi_pegawai
-- ----------------------------
DROP TABLE IF EXISTS `hobi_pegawai`;
CREATE TABLE `hobi_pegawai`  (
  `id_hobi_pegawai` int(11) NOT NULL AUTO_INCREMENT,
  `idguru_fk` int(11) NULL DEFAULT NULL,
  `jenis` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `aktif` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `kapan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`id_hobi_pegawai`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for induk_akun
-- ----------------------------
DROP TABLE IF EXISTS `induk_akun`;
CREATE TABLE `induk_akun`  (
  `id_induk_akun` int(11) NOT NULL AUTO_INCREMENT,
  `no_akun` int(11) NULL DEFAULT NULL,
  `nama` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `idcoa_fk` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_induk_akun`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of induk_akun
-- ----------------------------
INSERT INTO `induk_akun` VALUES (1, 11, 'Aktiva Lancar', 1);
INSERT INTO `induk_akun` VALUES (2, 12, 'Aktiva Tidak lancar', 1);
INSERT INTO `induk_akun` VALUES (3, 21, 'Kewajiban Lancar', 2);
INSERT INTO `induk_akun` VALUES (4, 22, 'Kewajiban Jangka Panjang', 2);
INSERT INTO `induk_akun` VALUES (5, 31, 'Modal Usaha', 3);
INSERT INTO `induk_akun` VALUES (6, 41, 'Perolehan', 4);
INSERT INTO `induk_akun` VALUES (7, 42, 'Pendapatan', 4);
INSERT INTO `induk_akun` VALUES (8, 43, 'Pendapatan Lain', 4);
INSERT INTO `induk_akun` VALUES (9, 51, 'Biaya Administrasi', 5);
INSERT INTO `induk_akun` VALUES (10, 52, 'Biaya Lain', 5);

-- ----------------------------
-- Table structure for input_nilai_keterampilan
-- ----------------------------
DROP TABLE IF EXISTS `input_nilai_keterampilan`;
CREATE TABLE `input_nilai_keterampilan`  (
  `id_input_nilai_keterampilan` int(11) NOT NULL AUTO_INCREMENT,
  `idmatapelajaran_fk` int(11) NULL DEFAULT NULL,
  `idtahunajaran_fk` int(11) NULL DEFAULT NULL,
  `trans_code` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `idguru_fk` int(11) NULL DEFAULT NULL,
  `idkelas_fk` int(11) NULL DEFAULT NULL,
  `idjenisketerampilan_fk` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_input_nilai_keterampilan`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for input_nilai_pas
-- ----------------------------
DROP TABLE IF EXISTS `input_nilai_pas`;
CREATE TABLE `input_nilai_pas`  (
  `id_input_nilai_pas` int(11) NOT NULL AUTO_INCREMENT,
  `idmatapelajaran_fk` int(11) NULL DEFAULT NULL,
  `idtahunajaran_fk` int(11) NULL DEFAULT NULL,
  `trans_code` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `idguru_fk` int(11) NULL DEFAULT NULL,
  `idkelas_fk` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_input_nilai_pas`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for input_nilai_pengetahuan
-- ----------------------------
DROP TABLE IF EXISTS `input_nilai_pengetahuan`;
CREATE TABLE `input_nilai_pengetahuan`  (
  `id_input_nilai_pengetahuan` int(11) NOT NULL AUTO_INCREMENT,
  `idmatapelajaran_fk` int(11) NULL DEFAULT NULL,
  `idtahunajaran_fk` int(11) NULL DEFAULT NULL,
  `trans_code` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `idguru_fk` int(11) NULL DEFAULT NULL,
  `idkelas_fk` int(11) NULL DEFAULT NULL,
  `idjenispengetahuan_fk` int(11) NULL DEFAULT NULL,
  `kode` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `keterangan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `idkd_fk` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_input_nilai_pengetahuan`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for input_nilai_pts
-- ----------------------------
DROP TABLE IF EXISTS `input_nilai_pts`;
CREATE TABLE `input_nilai_pts`  (
  `id_input_nilai_pts` int(11) NOT NULL AUTO_INCREMENT,
  `idmatapelajaran_fk` int(11) NULL DEFAULT NULL,
  `idtahunajaran_fk` int(11) NULL DEFAULT NULL,
  `trans_code` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `idguru_fk` int(11) NULL DEFAULT NULL,
  `idkelas_fk` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_input_nilai_pts`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for iuran_wajib_siswa
-- ----------------------------
DROP TABLE IF EXISTS `iuran_wajib_siswa`;
CREATE TABLE `iuran_wajib_siswa`  (
  `id_iuran_wajib_siswa` int(11) NOT NULL AUTO_INCREMENT,
  `nama` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `harga` double NULL DEFAULT NULL,
  PRIMARY KEY (`id_iuran_wajib_siswa`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for jadwal
-- ----------------------------
DROP TABLE IF EXISTS `jadwal`;
CREATE TABLE `jadwal`  (
  `id_jadwal` int(11) NOT NULL AUTO_INCREMENT,
  `tanggal` date NULL DEFAULT NULL,
  PRIMARY KEY (`id_jadwal`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jadwal
-- ----------------------------
INSERT INTO `jadwal` VALUES (1, '2020-08-18');

-- ----------------------------
-- Table structure for jadwal_guru
-- ----------------------------
DROP TABLE IF EXISTS `jadwal_guru`;
CREATE TABLE `jadwal_guru`  (
  `id_jadwal_guru` int(11) NOT NULL AUTO_INCREMENT,
  `idguru_fk` int(11) NULL DEFAULT NULL,
  `idhari_fk` int(11) NULL DEFAULT NULL,
  `jam_mulai` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `jam_selesai` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `create_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `idtahunajaran_fk` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_jadwal_guru`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jadwal_guru
-- ----------------------------
INSERT INTO `jadwal_guru` VALUES (1, 2, 1, '07.00', '15.00', '2022-08-01 18:24:31', 4);
INSERT INTO `jadwal_guru` VALUES (2, 3, 1, '07.00', '15.00', '2022-08-01 18:28:56', 4);
INSERT INTO `jadwal_guru` VALUES (3, 4, 1, '07.00', '15.00', '2022-08-01 18:29:19', 4);
INSERT INTO `jadwal_guru` VALUES (4, 5, 1, '07.00', '15.00', '2022-08-01 18:31:50', 4);
INSERT INTO `jadwal_guru` VALUES (5, 8, 1, '07:00', '16:33', '2022-08-01 18:33:26', 4);
INSERT INTO `jadwal_guru` VALUES (6, 14, 2, '07:39', '15:39', '2022-08-02 07:39:20', 4);
INSERT INTO `jadwal_guru` VALUES (7, 14, 4, '07:03', '16:03', '2022-08-03 20:03:45', 4);

-- ----------------------------
-- Table structure for jadwal_pelajaran
-- ----------------------------
DROP TABLE IF EXISTS `jadwal_pelajaran`;
CREATE TABLE `jadwal_pelajaran`  (
  `id_jadwal_pelajaran` int(11) NOT NULL AUTO_INCREMENT,
  `idgurumapel_fk` int(11) NULL DEFAULT NULL,
  `idhari_fk` int(11) NULL DEFAULT NULL,
  `idjampelajaran_fk` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_jadwal_pelajaran`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jadwal_pelajaran
-- ----------------------------
INSERT INTO `jadwal_pelajaran` VALUES (3, 4, 1, 1);
INSERT INTO `jadwal_pelajaran` VALUES (4, 4, 1, 2);
INSERT INTO `jadwal_pelajaran` VALUES (5, 5, 2, 1);
INSERT INTO `jadwal_pelajaran` VALUES (6, 5, 2, 2);
INSERT INTO `jadwal_pelajaran` VALUES (7, 5, 3, 1);
INSERT INTO `jadwal_pelajaran` VALUES (8, 5, 3, 2);

-- ----------------------------
-- Table structure for jam
-- ----------------------------
DROP TABLE IF EXISTS `jam`;
CREATE TABLE `jam`  (
  `id_jam` int(11) NOT NULL AUTO_INCREMENT,
  `nama` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `jam_mulai` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `jam_selesai` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`id_jam`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jam
-- ----------------------------
INSERT INTO `jam` VALUES (1, '1', '08.30', '10.00');
INSERT INTO `jam` VALUES (2, '2', '10.30', '12.00');

-- ----------------------------
-- Table structure for jam_pelajaran
-- ----------------------------
DROP TABLE IF EXISTS `jam_pelajaran`;
CREATE TABLE `jam_pelajaran`  (
  `id_jam_pelajaran` int(11) NOT NULL AUTO_INCREMENT,
  `nama` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `jam_mulai` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `jam_selesai` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `idtahunajaran_fk` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_jam_pelajaran`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jam_pelajaran
-- ----------------------------
INSERT INTO `jam_pelajaran` VALUES (1, '1', '07.00', '08.15', 4);
INSERT INTO `jam_pelajaran` VALUES (2, '2', '08.30', '09.00', 4);

-- ----------------------------
-- Table structure for jenis_kerjasama
-- ----------------------------
DROP TABLE IF EXISTS `jenis_kerjasama`;
CREATE TABLE `jenis_kerjasama`  (
  `id_jenis_kerjasama` int(11) NOT NULL AUTO_INCREMENT,
  `jenis_kerjasama` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`id_jenis_kerjasama`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jenis_kerjasama
-- ----------------------------
INSERT INTO `jenis_kerjasama` VALUES (2, 'Praktek Kerja Industri');
INSERT INTO `jenis_kerjasama` VALUES (3, 'Lowongan Kerja');
INSERT INTO `jenis_kerjasama` VALUES (4, 'Penyetaraan Kurikulum');

-- ----------------------------
-- Table structure for jenis_keterampilan
-- ----------------------------
DROP TABLE IF EXISTS `jenis_keterampilan`;
CREATE TABLE `jenis_keterampilan`  (
  `id_jenis_keterampilan` int(11) NOT NULL AUTO_INCREMENT,
  `jenis_keterampilan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `kode` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`id_jenis_keterampilan`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for jenis_mata_pelajaran
-- ----------------------------
DROP TABLE IF EXISTS `jenis_mata_pelajaran`;
CREATE TABLE `jenis_mata_pelajaran`  (
  `id_jenis_mata_pelajaran` int(11) NOT NULL AUTO_INCREMENT,
  `jenis_mata_pelajaran` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`id_jenis_mata_pelajaran`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for jenis_pelanggaran
-- ----------------------------
DROP TABLE IF EXISTS `jenis_pelanggaran`;
CREATE TABLE `jenis_pelanggaran`  (
  `id_jenis_pelanggaran` int(11) NOT NULL AUTO_INCREMENT,
  `jenis_pelanggaran` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`id_jenis_pelanggaran`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jenis_pelanggaran
-- ----------------------------
INSERT INTO `jenis_pelanggaran` VALUES (1, 'CATATAN KERAPIAN');
INSERT INTO `jenis_pelanggaran` VALUES (2, 'CATATAN KEDISIPLINAN');
INSERT INTO `jenis_pelanggaran` VALUES (3, 'CATATAN LAIN');
INSERT INTO `jenis_pelanggaran` VALUES (4, 'CATATAN ADMINISTRASI');
INSERT INTO `jenis_pelanggaran` VALUES (6, 'CATATAN KETERLAMBATAN');

-- ----------------------------
-- Table structure for jenis_penerimaan
-- ----------------------------
DROP TABLE IF EXISTS `jenis_penerimaan`;
CREATE TABLE `jenis_penerimaan`  (
  `id_jenis_penerimaan` int(11) NOT NULL AUTO_INCREMENT,
  `nama` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `kas` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `pendapatan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `piutang` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `diskon` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `is_edit` int(255) NULL DEFAULT NULL,
  `bulanan` int(11) NULL DEFAULT NULL,
  `template_nota` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `idtahunajaran_fk` int(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id_jenis_penerimaan`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jenis_penerimaan
-- ----------------------------
INSERT INTO `jenis_penerimaan` VALUES (1, 'SPP', '1', '20', '4', '33', NULL, NULL, 'INV/SPP/{date}/{rand}', 4);
INSERT INTO `jenis_penerimaan` VALUES (2, 'DSP', '1', '19', '4', '35', NULL, NULL, 'INV/DSP/{date}/{rand}', 4);
INSERT INTO `jenis_penerimaan` VALUES (3, 'Seragam', '1', '20', '4', '35', NULL, NULL, 'INV/SRG/{date}/{rand}', 4);
INSERT INTO `jenis_penerimaan` VALUES (4, 'Study Tour', '1', '21', '4', '35', NULL, NULL, 'INV/STD/{date}/{rand}', 1);
INSERT INTO `jenis_penerimaan` VALUES (5, 'Prakerin', '1', '19', '4', '35', NULL, NULL, 'SMKPEMDA/PRAKERIN/{date}/{rand}', 4);
INSERT INTO `jenis_penerimaan` VALUES (6, 'Dana Sosial', '1', '20', '4', '35', NULL, NULL, 'INV/DNS/{date}/{rand}', 4);
INSERT INTO `jenis_penerimaan` VALUES (7, 'Tanggungan Alumni', '1', '19', '4', '35', NULL, NULL, 'INV/BYRALUMNI/{date}/{rand}', 4);

-- ----------------------------
-- Table structure for jenis_pengetahuan
-- ----------------------------
DROP TABLE IF EXISTS `jenis_pengetahuan`;
CREATE TABLE `jenis_pengetahuan`  (
  `id_jenis_pengetahuan` int(11) NOT NULL AUTO_INCREMENT,
  `jenis_pengetahuan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `kode` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`id_jenis_pengetahuan`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for jenis_penilaian
-- ----------------------------
DROP TABLE IF EXISTS `jenis_penilaian`;
CREATE TABLE `jenis_penilaian`  (
  `id_jenis_penilaian` int(11) NOT NULL AUTO_INCREMENT,
  `jenis_penilaian` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `kode` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_jenis_penilaian`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for jurnal_guru
-- ----------------------------
DROP TABLE IF EXISTS `jurnal_guru`;
CREATE TABLE `jurnal_guru`  (
  `id_jurnal_guru` int(11) NOT NULL AUTO_INCREMENT,
  `idguru_fk` int(11) NULL DEFAULT NULL,
  `idkelas_fk` int(11) NULL DEFAULT NULL,
  `idmapel_fk` int(11) NULL DEFAULT NULL,
  `idtahunajaran_fk` int(11) NULL DEFAULT NULL,
  `tanggal` date NULL DEFAULT NULL,
  `uraian` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`id_jurnal_guru`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for jurnal_umum
-- ----------------------------
DROP TABLE IF EXISTS `jurnal_umum`;
CREATE TABLE `jurnal_umum`  (
  `id_jurnal_umum` int(11) NOT NULL AUTO_INCREMENT,
  `ref` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `idakun_fk` int(11) NULL DEFAULT NULL,
  `debit` double NULL DEFAULT NULL,
  `kredit` double NULL DEFAULT NULL,
  `keterangan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `table` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `idtable_fk` int(11) NULL DEFAULT NULL,
  `create_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_jurnal_umum`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 457 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jurnal_umum
-- ----------------------------
INSERT INTO `jurnal_umum` VALUES (9, '9443842', 4, 2500000, 0, 'Pendataan pembayaran tanggungan SPP siswa a/n ARIEF WAHYUDI', 'tanggungan', 5, '2022-07-24 07:43:04');
INSERT INTO `jurnal_umum` VALUES (10, '9443842', 20, 0, 2500000, 'Pendataan pembayaran tanggungan SPP siswa a/n ARIEF WAHYUDI', 'tanggungan', 5, '2022-07-24 07:43:04');
INSERT INTO `jurnal_umum` VALUES (11, '4876872', 4, 3000000, 0, 'Pendataan pembayaran tanggungan DSP siswa a/n ARIEF WAHYUDI', 'tanggungan', 6, '2022-07-24 07:43:04');
INSERT INTO `jurnal_umum` VALUES (12, '4876872', 19, 0, 3000000, 'Pendataan pembayaran tanggungan DSP siswa a/n ARIEF WAHYUDI', 'tanggungan', 6, '2022-07-24 07:43:04');
INSERT INTO `jurnal_umum` VALUES (13, '9209199', 4, 250000, 0, 'Pendataan pembayaran tanggungan Seragam siswa a/n ARIEF WAHYUDI', 'tanggungan', 7, '2022-07-24 07:43:04');
INSERT INTO `jurnal_umum` VALUES (14, '9209199', 20, 0, 250000, 'Pendataan pembayaran tanggungan Seragam siswa a/n ARIEF WAHYUDI', 'tanggungan', 7, '2022-07-24 07:43:04');
INSERT INTO `jurnal_umum` VALUES (15, '8307323', 4, 200000, 0, 'Pendataan pembayaran tanggungan Study Tour siswa a/n ARIEF WAHYUDI', 'tanggungan', 8, '2022-07-24 07:43:04');
INSERT INTO `jurnal_umum` VALUES (16, '8307323', 21, 0, 200000, 'Pendataan pembayaran tanggungan Study Tour siswa a/n ARIEF WAHYUDI', 'tanggungan', 8, '2022-07-24 07:43:04');
INSERT INTO `jurnal_umum` VALUES (17, '7369701', 1, 100000, 0, 'Pembayaran tanggungan SPP siswa a/n Santi Dwi Samsiyah', 'penerimaan', 1, '2022-07-24 14:53:20');
INSERT INTO `jurnal_umum` VALUES (18, '7369701', 4, 0, 100000, 'Pembayaran tanggungan SPP siswa a/n Santi Dwi Samsiyah', 'penerimaan', 1, '2022-07-24 14:53:20');
INSERT INTO `jurnal_umum` VALUES (19, '4552097', 1, 50000, 0, 'Pembayaran tanggungan Study Tour siswa a/n Santi Dwi Samsiyah', 'penerimaan', 2, '2022-07-25 14:22:09');
INSERT INTO `jurnal_umum` VALUES (20, '4552097', 4, 0, 50000, 'Pembayaran tanggungan Study Tour siswa a/n Santi Dwi Samsiyah', 'penerimaan', 2, '2022-07-25 14:22:09');
INSERT INTO `jurnal_umum` VALUES (21, '8535353', 4, 3000000, 0, 'Pendataan pembayaran tanggungan SPP siswa a/n ALBET DIMAS NURFENDI PRATAMA', 'tanggungan', 9, '2022-07-27 07:53:08');
INSERT INTO `jurnal_umum` VALUES (22, '8535353', 20, 0, 3000000, 'Pendataan pembayaran tanggungan SPP siswa a/n ALBET DIMAS NURFENDI PRATAMA', 'tanggungan', 9, '2022-07-27 07:53:08');
INSERT INTO `jurnal_umum` VALUES (23, '3280627', 4, 5000000, 0, 'Pendataan pembayaran tanggungan DSP siswa a/n ALBET DIMAS NURFENDI PRATAMA', 'tanggungan', 10, '2022-07-27 07:53:08');
INSERT INTO `jurnal_umum` VALUES (24, '3280627', 19, 0, 5000000, 'Pendataan pembayaran tanggungan DSP siswa a/n ALBET DIMAS NURFENDI PRATAMA', 'tanggungan', 10, '2022-07-27 07:53:08');
INSERT INTO `jurnal_umum` VALUES (25, '1106670', 4, 200000, 0, 'Pendataan pembayaran tanggungan Seragam siswa a/n ALBET DIMAS NURFENDI PRATAMA', 'tanggungan', 11, '2022-07-27 07:53:08');
INSERT INTO `jurnal_umum` VALUES (26, '1106670', 20, 0, 200000, 'Pendataan pembayaran tanggungan Seragam siswa a/n ALBET DIMAS NURFENDI PRATAMA', 'tanggungan', 11, '2022-07-27 07:53:08');
INSERT INTO `jurnal_umum` VALUES (27, '2426419', 4, 200000, 0, 'Pendataan pembayaran tanggungan Study Tour siswa a/n ALBET DIMAS NURFENDI PRATAMA', 'tanggungan', 12, '2022-07-27 07:53:08');
INSERT INTO `jurnal_umum` VALUES (28, '2426419', 21, 0, 200000, 'Pendataan pembayaran tanggungan Study Tour siswa a/n ALBET DIMAS NURFENDI PRATAMA', 'tanggungan', 12, '2022-07-27 07:53:08');
INSERT INTO `jurnal_umum` VALUES (29, '6074511', 4, 150000, 0, 'Pendataan pembayaran tanggungan Prakerin siswa a/n ALBET DIMAS NURFENDI PRATAMA', 'tanggungan', 13, '2022-07-27 07:53:08');
INSERT INTO `jurnal_umum` VALUES (30, '6074511', 19, 0, 150000, 'Pendataan pembayaran tanggungan Prakerin siswa a/n ALBET DIMAS NURFENDI PRATAMA', 'tanggungan', 13, '2022-07-27 07:53:08');
INSERT INTO `jurnal_umum` VALUES (31, '6182932', 1, 150000, 0, 'Pembayaran tanggungan Prakerin siswa a/n ALBET DIMAS NURFENDI PRATAMA', 'penerimaan', 3, '2022-07-27 07:54:00');
INSERT INTO `jurnal_umum` VALUES (32, '6182932', 4, 0, 150000, 'Pembayaran tanggungan Prakerin siswa a/n ALBET DIMAS NURFENDI PRATAMA', 'penerimaan', 3, '2022-07-27 07:54:00');
INSERT INTO `jurnal_umum` VALUES (33, '1824773', 4, 100000, 0, 'Pendataan pembayaran tanggungan SPP siswa a/n ADE NOVIYANTI', 'tanggungan', 14, '2022-07-29 08:25:27');
INSERT INTO `jurnal_umum` VALUES (34, '1824773', 20, 0, 100000, 'Pendataan pembayaran tanggungan SPP siswa a/n ADE NOVIYANTI', 'tanggungan', 14, '2022-07-29 08:25:27');
INSERT INTO `jurnal_umum` VALUES (35, '6833688', 4, 110000, 0, 'Pendataan pembayaran tanggungan DSP siswa a/n ADE NOVIYANTI', 'tanggungan', 15, '2022-07-29 08:25:27');
INSERT INTO `jurnal_umum` VALUES (36, '6833688', 19, 0, 110000, 'Pendataan pembayaran tanggungan DSP siswa a/n ADE NOVIYANTI', 'tanggungan', 15, '2022-07-29 08:25:27');
INSERT INTO `jurnal_umum` VALUES (37, '1827327', 4, 120000, 0, 'Pendataan pembayaran tanggungan Seragam siswa a/n ADE NOVIYANTI', 'tanggungan', 16, '2022-07-29 08:25:27');
INSERT INTO `jurnal_umum` VALUES (38, '1827327', 20, 0, 120000, 'Pendataan pembayaran tanggungan Seragam siswa a/n ADE NOVIYANTI', 'tanggungan', 16, '2022-07-29 08:25:27');
INSERT INTO `jurnal_umum` VALUES (39, '893921', 4, 130000, 0, 'Pendataan pembayaran tanggungan Study Tour siswa a/n ADE NOVIYANTI', 'tanggungan', 17, '2022-07-29 08:25:27');
INSERT INTO `jurnal_umum` VALUES (40, '893921', 21, 0, 130000, 'Pendataan pembayaran tanggungan Study Tour siswa a/n ADE NOVIYANTI', 'tanggungan', 17, '2022-07-29 08:25:27');
INSERT INTO `jurnal_umum` VALUES (41, '2964187', 4, 140000, 0, 'Pendataan pembayaran tanggungan Prakerin siswa a/n ADE NOVIYANTI', 'tanggungan', 18, '2022-07-29 08:25:27');
INSERT INTO `jurnal_umum` VALUES (42, '2964187', 19, 0, 140000, 'Pendataan pembayaran tanggungan Prakerin siswa a/n ADE NOVIYANTI', 'tanggungan', 18, '2022-07-29 08:25:27');
INSERT INTO `jurnal_umum` VALUES (43, '1320097', 4, 100000, 0, 'Pendataan pembayaran tanggungan SPP siswa a/n AHMAD SYAFARONI', 'tanggungan', 19, '2022-07-29 08:25:27');
INSERT INTO `jurnal_umum` VALUES (44, '1320097', 20, 0, 100000, 'Pendataan pembayaran tanggungan SPP siswa a/n AHMAD SYAFARONI', 'tanggungan', 19, '2022-07-29 08:25:27');
INSERT INTO `jurnal_umum` VALUES (45, '7412584', 4, 110000, 0, 'Pendataan pembayaran tanggungan DSP siswa a/n AHMAD SYAFARONI', 'tanggungan', 20, '2022-07-29 08:25:27');
INSERT INTO `jurnal_umum` VALUES (46, '7412584', 19, 0, 110000, 'Pendataan pembayaran tanggungan DSP siswa a/n AHMAD SYAFARONI', 'tanggungan', 20, '2022-07-29 08:25:27');
INSERT INTO `jurnal_umum` VALUES (47, '9241324', 4, 120000, 0, 'Pendataan pembayaran tanggungan Seragam siswa a/n AHMAD SYAFARONI', 'tanggungan', 21, '2022-07-29 08:25:27');
INSERT INTO `jurnal_umum` VALUES (48, '9241324', 20, 0, 120000, 'Pendataan pembayaran tanggungan Seragam siswa a/n AHMAD SYAFARONI', 'tanggungan', 21, '2022-07-29 08:25:27');
INSERT INTO `jurnal_umum` VALUES (49, '3563845', 4, 130000, 0, 'Pendataan pembayaran tanggungan Study Tour siswa a/n AHMAD SYAFARONI', 'tanggungan', 22, '2022-07-29 08:25:27');
INSERT INTO `jurnal_umum` VALUES (50, '3563845', 21, 0, 130000, 'Pendataan pembayaran tanggungan Study Tour siswa a/n AHMAD SYAFARONI', 'tanggungan', 22, '2022-07-29 08:25:27');
INSERT INTO `jurnal_umum` VALUES (51, '5703438', 4, 140000, 0, 'Pendataan pembayaran tanggungan Prakerin siswa a/n AHMAD SYAFARONI', 'tanggungan', 23, '2022-07-29 08:25:27');
INSERT INTO `jurnal_umum` VALUES (52, '5703438', 19, 0, 140000, 'Pendataan pembayaran tanggungan Prakerin siswa a/n AHMAD SYAFARONI', 'tanggungan', 23, '2022-07-29 08:25:27');
INSERT INTO `jurnal_umum` VALUES (53, '8514235', 4, 100000, 0, 'Pendataan pembayaran tanggungan SPP siswa a/n GALING DWI MUSTOMO', 'tanggungan', 24, '2022-07-29 08:25:27');
INSERT INTO `jurnal_umum` VALUES (54, '8514235', 20, 0, 100000, 'Pendataan pembayaran tanggungan SPP siswa a/n GALING DWI MUSTOMO', 'tanggungan', 24, '2022-07-29 08:25:27');
INSERT INTO `jurnal_umum` VALUES (55, '3413035', 4, 110000, 0, 'Pendataan pembayaran tanggungan DSP siswa a/n GALING DWI MUSTOMO', 'tanggungan', 25, '2022-07-29 08:25:27');
INSERT INTO `jurnal_umum` VALUES (56, '3413035', 19, 0, 110000, 'Pendataan pembayaran tanggungan DSP siswa a/n GALING DWI MUSTOMO', 'tanggungan', 25, '2022-07-29 08:25:27');
INSERT INTO `jurnal_umum` VALUES (57, '4296492', 4, 120000, 0, 'Pendataan pembayaran tanggungan Seragam siswa a/n GALING DWI MUSTOMO', 'tanggungan', 26, '2022-07-29 08:25:27');
INSERT INTO `jurnal_umum` VALUES (58, '4296492', 20, 0, 120000, 'Pendataan pembayaran tanggungan Seragam siswa a/n GALING DWI MUSTOMO', 'tanggungan', 26, '2022-07-29 08:25:27');
INSERT INTO `jurnal_umum` VALUES (59, '2876487', 4, 130000, 0, 'Pendataan pembayaran tanggungan Study Tour siswa a/n GALING DWI MUSTOMO', 'tanggungan', 27, '2022-07-29 08:25:27');
INSERT INTO `jurnal_umum` VALUES (60, '2876487', 21, 0, 130000, 'Pendataan pembayaran tanggungan Study Tour siswa a/n GALING DWI MUSTOMO', 'tanggungan', 27, '2022-07-29 08:25:27');
INSERT INTO `jurnal_umum` VALUES (61, '3025674', 4, 140000, 0, 'Pendataan pembayaran tanggungan Prakerin siswa a/n GALING DWI MUSTOMO', 'tanggungan', 28, '2022-07-29 08:25:27');
INSERT INTO `jurnal_umum` VALUES (62, '3025674', 19, 0, 140000, 'Pendataan pembayaran tanggungan Prakerin siswa a/n GALING DWI MUSTOMO', 'tanggungan', 28, '2022-07-29 08:25:27');
INSERT INTO `jurnal_umum` VALUES (63, '6767635', 4, 100000, 0, 'Pendataan pembayaran tanggungan SPP siswa a/n MUHAKIM AJI PAMBUDI', 'tanggungan', 29, '2022-07-29 08:25:27');
INSERT INTO `jurnal_umum` VALUES (64, '6767635', 20, 0, 100000, 'Pendataan pembayaran tanggungan SPP siswa a/n MUHAKIM AJI PAMBUDI', 'tanggungan', 29, '2022-07-29 08:25:27');
INSERT INTO `jurnal_umum` VALUES (65, '9752926', 4, 110000, 0, 'Pendataan pembayaran tanggungan DSP siswa a/n MUHAKIM AJI PAMBUDI', 'tanggungan', 30, '2022-07-29 08:25:27');
INSERT INTO `jurnal_umum` VALUES (66, '9752926', 19, 0, 110000, 'Pendataan pembayaran tanggungan DSP siswa a/n MUHAKIM AJI PAMBUDI', 'tanggungan', 30, '2022-07-29 08:25:27');
INSERT INTO `jurnal_umum` VALUES (67, '3866329', 4, 120000, 0, 'Pendataan pembayaran tanggungan Seragam siswa a/n MUHAKIM AJI PAMBUDI', 'tanggungan', 31, '2022-07-29 08:25:27');
INSERT INTO `jurnal_umum` VALUES (68, '3866329', 20, 0, 120000, 'Pendataan pembayaran tanggungan Seragam siswa a/n MUHAKIM AJI PAMBUDI', 'tanggungan', 31, '2022-07-29 08:25:27');
INSERT INTO `jurnal_umum` VALUES (69, '1331069', 4, 130000, 0, 'Pendataan pembayaran tanggungan Study Tour siswa a/n MUHAKIM AJI PAMBUDI', 'tanggungan', 32, '2022-07-29 08:25:27');
INSERT INTO `jurnal_umum` VALUES (70, '1331069', 21, 0, 130000, 'Pendataan pembayaran tanggungan Study Tour siswa a/n MUHAKIM AJI PAMBUDI', 'tanggungan', 32, '2022-07-29 08:25:27');
INSERT INTO `jurnal_umum` VALUES (71, '8870252', 4, 140000, 0, 'Pendataan pembayaran tanggungan Prakerin siswa a/n MUHAKIM AJI PAMBUDI', 'tanggungan', 33, '2022-07-29 08:25:27');
INSERT INTO `jurnal_umum` VALUES (72, '8870252', 19, 0, 140000, 'Pendataan pembayaran tanggungan Prakerin siswa a/n MUHAKIM AJI PAMBUDI', 'tanggungan', 33, '2022-07-29 08:25:27');
INSERT INTO `jurnal_umum` VALUES (73, '3229339', 4, 100000, 0, 'Pendataan pembayaran tanggungan SPP siswa a/n OKTAVIA RAMADHANI NURJANAH', 'tanggungan', 34, '2022-07-29 08:25:27');
INSERT INTO `jurnal_umum` VALUES (74, '3229339', 20, 0, 100000, 'Pendataan pembayaran tanggungan SPP siswa a/n OKTAVIA RAMADHANI NURJANAH', 'tanggungan', 34, '2022-07-29 08:25:27');
INSERT INTO `jurnal_umum` VALUES (75, '58513', 4, 110000, 0, 'Pendataan pembayaran tanggungan DSP siswa a/n OKTAVIA RAMADHANI NURJANAH', 'tanggungan', 35, '2022-07-29 08:25:27');
INSERT INTO `jurnal_umum` VALUES (76, '58513', 19, 0, 110000, 'Pendataan pembayaran tanggungan DSP siswa a/n OKTAVIA RAMADHANI NURJANAH', 'tanggungan', 35, '2022-07-29 08:25:27');
INSERT INTO `jurnal_umum` VALUES (77, '9974442', 4, 120000, 0, 'Pendataan pembayaran tanggungan Seragam siswa a/n OKTAVIA RAMADHANI NURJANAH', 'tanggungan', 36, '2022-07-29 08:25:27');
INSERT INTO `jurnal_umum` VALUES (78, '9974442', 20, 0, 120000, 'Pendataan pembayaran tanggungan Seragam siswa a/n OKTAVIA RAMADHANI NURJANAH', 'tanggungan', 36, '2022-07-29 08:25:27');
INSERT INTO `jurnal_umum` VALUES (79, '6396942', 4, 130000, 0, 'Pendataan pembayaran tanggungan Study Tour siswa a/n OKTAVIA RAMADHANI NURJANAH', 'tanggungan', 37, '2022-07-29 08:25:27');
INSERT INTO `jurnal_umum` VALUES (80, '6396942', 21, 0, 130000, 'Pendataan pembayaran tanggungan Study Tour siswa a/n OKTAVIA RAMADHANI NURJANAH', 'tanggungan', 37, '2022-07-29 08:25:27');
INSERT INTO `jurnal_umum` VALUES (81, '3377039', 4, 140000, 0, 'Pendataan pembayaran tanggungan Prakerin siswa a/n OKTAVIA RAMADHANI NURJANAH', 'tanggungan', 38, '2022-07-29 08:25:27');
INSERT INTO `jurnal_umum` VALUES (82, '3377039', 19, 0, 140000, 'Pendataan pembayaran tanggungan Prakerin siswa a/n OKTAVIA RAMADHANI NURJANAH', 'tanggungan', 38, '2022-07-29 08:25:27');
INSERT INTO `jurnal_umum` VALUES (83, '659112', 4, 100000, 0, 'Pendataan pembayaran tanggungan SPP siswa a/n RANJANA SEPTIAN RAHMAN', 'tanggungan', 39, '2022-07-29 08:25:27');
INSERT INTO `jurnal_umum` VALUES (84, '659112', 20, 0, 100000, 'Pendataan pembayaran tanggungan SPP siswa a/n RANJANA SEPTIAN RAHMAN', 'tanggungan', 39, '2022-07-29 08:25:27');
INSERT INTO `jurnal_umum` VALUES (85, '7493958', 4, 110000, 0, 'Pendataan pembayaran tanggungan DSP siswa a/n RANJANA SEPTIAN RAHMAN', 'tanggungan', 40, '2022-07-29 08:25:27');
INSERT INTO `jurnal_umum` VALUES (86, '7493958', 19, 0, 110000, 'Pendataan pembayaran tanggungan DSP siswa a/n RANJANA SEPTIAN RAHMAN', 'tanggungan', 40, '2022-07-29 08:25:27');
INSERT INTO `jurnal_umum` VALUES (87, '7776669', 4, 120000, 0, 'Pendataan pembayaran tanggungan Seragam siswa a/n RANJANA SEPTIAN RAHMAN', 'tanggungan', 41, '2022-07-29 08:25:27');
INSERT INTO `jurnal_umum` VALUES (88, '7776669', 20, 0, 120000, 'Pendataan pembayaran tanggungan Seragam siswa a/n RANJANA SEPTIAN RAHMAN', 'tanggungan', 41, '2022-07-29 08:25:27');
INSERT INTO `jurnal_umum` VALUES (89, '367965', 4, 130000, 0, 'Pendataan pembayaran tanggungan Study Tour siswa a/n RANJANA SEPTIAN RAHMAN', 'tanggungan', 42, '2022-07-29 08:25:27');
INSERT INTO `jurnal_umum` VALUES (90, '367965', 21, 0, 130000, 'Pendataan pembayaran tanggungan Study Tour siswa a/n RANJANA SEPTIAN RAHMAN', 'tanggungan', 42, '2022-07-29 08:25:27');
INSERT INTO `jurnal_umum` VALUES (91, '6197509', 4, 140000, 0, 'Pendataan pembayaran tanggungan Prakerin siswa a/n RANJANA SEPTIAN RAHMAN', 'tanggungan', 43, '2022-07-29 08:25:27');
INSERT INTO `jurnal_umum` VALUES (92, '6197509', 19, 0, 140000, 'Pendataan pembayaran tanggungan Prakerin siswa a/n RANJANA SEPTIAN RAHMAN', 'tanggungan', 43, '2022-07-29 08:25:27');
INSERT INTO `jurnal_umum` VALUES (93, '2525338', 4, 100000, 0, 'Pendataan pembayaran tanggungan SPP siswa a/n GALING DWI MUSTOMO', 'tanggungan', 44, '2022-07-29 08:25:27');
INSERT INTO `jurnal_umum` VALUES (94, '2525338', 20, 0, 100000, 'Pendataan pembayaran tanggungan SPP siswa a/n GALING DWI MUSTOMO', 'tanggungan', 44, '2022-07-29 08:25:27');
INSERT INTO `jurnal_umum` VALUES (95, '6726668', 4, 110000, 0, 'Pendataan pembayaran tanggungan DSP siswa a/n GALING DWI MUSTOMO', 'tanggungan', 45, '2022-07-29 08:25:27');
INSERT INTO `jurnal_umum` VALUES (96, '6726668', 19, 0, 110000, 'Pendataan pembayaran tanggungan DSP siswa a/n GALING DWI MUSTOMO', 'tanggungan', 45, '2022-07-29 08:25:27');
INSERT INTO `jurnal_umum` VALUES (97, '9982929', 4, 120000, 0, 'Pendataan pembayaran tanggungan Seragam siswa a/n GALING DWI MUSTOMO', 'tanggungan', 46, '2022-07-29 08:25:27');
INSERT INTO `jurnal_umum` VALUES (98, '9982929', 20, 0, 120000, 'Pendataan pembayaran tanggungan Seragam siswa a/n GALING DWI MUSTOMO', 'tanggungan', 46, '2022-07-29 08:25:27');
INSERT INTO `jurnal_umum` VALUES (99, '2189024', 4, 130000, 0, 'Pendataan pembayaran tanggungan Study Tour siswa a/n GALING DWI MUSTOMO', 'tanggungan', 47, '2022-07-29 08:25:27');
INSERT INTO `jurnal_umum` VALUES (100, '2189024', 21, 0, 130000, 'Pendataan pembayaran tanggungan Study Tour siswa a/n GALING DWI MUSTOMO', 'tanggungan', 47, '2022-07-29 08:25:27');
INSERT INTO `jurnal_umum` VALUES (101, '2402584', 4, 140000, 0, 'Pendataan pembayaran tanggungan Prakerin siswa a/n GALING DWI MUSTOMO', 'tanggungan', 48, '2022-07-29 08:25:27');
INSERT INTO `jurnal_umum` VALUES (102, '2402584', 19, 0, 140000, 'Pendataan pembayaran tanggungan Prakerin siswa a/n GALING DWI MUSTOMO', 'tanggungan', 48, '2022-07-29 08:25:27');
INSERT INTO `jurnal_umum` VALUES (115, '9850452', 4, 2600000, 0, 'Pendataan pembayaran tanggungan SPP siswa a/n Santi Dwi Samsiyah', 'tanggungan', 55, '2022-08-03 20:48:05');
INSERT INTO `jurnal_umum` VALUES (116, '9850452', 20, 0, 2600000, 'Pendataan pembayaran tanggungan SPP siswa a/n Santi Dwi Samsiyah', 'tanggungan', 55, '2022-08-03 20:48:05');
INSERT INTO `jurnal_umum` VALUES (117, '5256214', 4, 3000000, 0, 'Pendataan pembayaran tanggungan DSP siswa a/n Santi Dwi Samsiyah', 'tanggungan', 56, '2022-08-03 20:48:05');
INSERT INTO `jurnal_umum` VALUES (118, '5256214', 19, 0, 3000000, 'Pendataan pembayaran tanggungan DSP siswa a/n Santi Dwi Samsiyah', 'tanggungan', 56, '2022-08-03 20:48:05');
INSERT INTO `jurnal_umum` VALUES (119, '6772452', 4, 250000, 0, 'Pendataan pembayaran tanggungan Seragam siswa a/n Santi Dwi Samsiyah', 'tanggungan', 57, '2022-08-03 20:48:05');
INSERT INTO `jurnal_umum` VALUES (120, '6772452', 20, 0, 250000, 'Pendataan pembayaran tanggungan Seragam siswa a/n Santi Dwi Samsiyah', 'tanggungan', 57, '2022-08-03 20:48:05');
INSERT INTO `jurnal_umum` VALUES (121, '7109265', 4, 50000, 0, 'Pendataan pembayaran tanggungan Study Tour siswa a/n Santi Dwi Samsiyah', 'tanggungan', 58, '2022-08-03 20:48:05');
INSERT INTO `jurnal_umum` VALUES (122, '7109265', 21, 0, 50000, 'Pendataan pembayaran tanggungan Study Tour siswa a/n Santi Dwi Samsiyah', 'tanggungan', 58, '2022-08-03 20:48:05');
INSERT INTO `jurnal_umum` VALUES (123, '1570385', 4, 400000, 0, 'Pendataan pembayaran tanggungan Prakerin siswa a/n Santi Dwi Samsiyah', 'tanggungan', 59, '2022-08-03 20:48:05');
INSERT INTO `jurnal_umum` VALUES (124, '1570385', 19, 0, 400000, 'Pendataan pembayaran tanggungan Prakerin siswa a/n Santi Dwi Samsiyah', 'tanggungan', 59, '2022-08-03 20:48:05');
INSERT INTO `jurnal_umum` VALUES (125, '3398241', 4, 50000, 0, 'Pendataan pembayaran tanggungan Dana Sosial siswa a/n Santi Dwi Samsiyah', 'tanggungan', 60, '2022-08-03 20:48:05');
INSERT INTO `jurnal_umum` VALUES (126, '3398241', 20, 0, 50000, 'Pendataan pembayaran tanggungan Dana Sosial siswa a/n Santi Dwi Samsiyah', 'tanggungan', 60, '2022-08-03 20:48:05');
INSERT INTO `jurnal_umum` VALUES (127, '8047281', 1, 50000, 0, 'Pembayaran tanggungan Dana Sosial siswa a/n Santi Dwi Samsiyah', 'penerimaan', 4, '2022-08-03 20:50:26');
INSERT INTO `jurnal_umum` VALUES (128, '8047281', 4, 0, 50000, 'Pembayaran tanggungan Dana Sosial siswa a/n Santi Dwi Samsiyah', 'penerimaan', 4, '2022-08-03 20:50:26');
INSERT INTO `jurnal_umum` VALUES (129, '8612385', 4, 2000000, 0, 'Pendataan pembayaran tanggungan SPP siswa a/n Sinta Dwi Samsiyah', 'tanggungan', 61, '2022-08-07 15:04:47');
INSERT INTO `jurnal_umum` VALUES (130, '8612385', 20, 0, 2000000, 'Pendataan pembayaran tanggungan SPP siswa a/n Sinta Dwi Samsiyah', 'tanggungan', 61, '2022-08-07 15:04:47');
INSERT INTO `jurnal_umum` VALUES (131, '1100583', 4, 2500000, 0, 'Pendataan pembayaran tanggungan DSP siswa a/n Sinta Dwi Samsiyah', 'tanggungan', 62, '2022-08-07 15:04:47');
INSERT INTO `jurnal_umum` VALUES (132, '1100583', 19, 0, 2500000, 'Pendataan pembayaran tanggungan DSP siswa a/n Sinta Dwi Samsiyah', 'tanggungan', 62, '2022-08-07 15:04:47');
INSERT INTO `jurnal_umum` VALUES (133, '370683', 4, 150000, 0, 'Pendataan pembayaran tanggungan Seragam siswa a/n Sinta Dwi Samsiyah', 'tanggungan', 63, '2022-08-07 15:04:47');
INSERT INTO `jurnal_umum` VALUES (134, '370683', 20, 0, 150000, 'Pendataan pembayaran tanggungan Seragam siswa a/n Sinta Dwi Samsiyah', 'tanggungan', 63, '2022-08-07 15:04:47');
INSERT INTO `jurnal_umum` VALUES (135, '8326294', 4, 100000, 0, 'Pendataan pembayaran tanggungan Study Tour siswa a/n Sinta Dwi Samsiyah', 'tanggungan', 64, '2022-08-07 15:04:47');
INSERT INTO `jurnal_umum` VALUES (136, '8326294', 21, 0, 100000, 'Pendataan pembayaran tanggungan Study Tour siswa a/n Sinta Dwi Samsiyah', 'tanggungan', 64, '2022-08-07 15:04:47');
INSERT INTO `jurnal_umum` VALUES (137, '1314227', 4, 150000, 0, 'Pendataan pembayaran tanggungan Prakerin siswa a/n Sinta Dwi Samsiyah', 'tanggungan', 65, '2022-08-07 15:04:47');
INSERT INTO `jurnal_umum` VALUES (138, '1314227', 19, 0, 150000, 'Pendataan pembayaran tanggungan Prakerin siswa a/n Sinta Dwi Samsiyah', 'tanggungan', 65, '2022-08-07 15:04:47');
INSERT INTO `jurnal_umum` VALUES (141, '8793136', 4, 510000, 0, 'Pendataan pembayaran tanggungan Prakerin siswa a/n ARIEF WAHYUDI', 'tanggungan', 67, '2022-08-07 15:45:55');
INSERT INTO `jurnal_umum` VALUES (142, '8793136', 19, 0, 510000, 'Pendataan pembayaran tanggungan Prakerin siswa a/n ARIEF WAHYUDI', 'tanggungan', 67, '2022-08-07 15:45:55');
INSERT INTO `jurnal_umum` VALUES (143, '2532655', 4, 150000, 0, 'Pendataan pembayaran tanggungan Dana Sosial siswa a/n ARIEF WAHYUDI', 'tanggungan', 68, '2022-08-07 15:45:55');
INSERT INTO `jurnal_umum` VALUES (144, '2532655', 20, 0, 150000, 'Pendataan pembayaran tanggungan Dana Sosial siswa a/n ARIEF WAHYUDI', 'tanggungan', 68, '2022-08-07 15:45:55');
INSERT INTO `jurnal_umum` VALUES (145, '707137', 4, 200000, 0, 'Pendataan pembayaran tanggungan SPP siswa a/n AHMAD ZAINURI MAKRUF', 'tanggungan', 69, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (146, '707137', 20, 0, 200000, 'Pendataan pembayaran tanggungan SPP siswa a/n AHMAD ZAINURI MAKRUF', 'tanggungan', 69, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (147, '2190177', 4, 2500000, 0, 'Pendataan pembayaran tanggungan DSP siswa a/n AHMAD ZAINURI MAKRUF', 'tanggungan', 70, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (148, '2190177', 19, 0, 2500000, 'Pendataan pembayaran tanggungan DSP siswa a/n AHMAD ZAINURI MAKRUF', 'tanggungan', 70, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (149, '9605013', 4, 150000, 0, 'Pendataan pembayaran tanggungan Seragam siswa a/n AHMAD ZAINURI MAKRUF', 'tanggungan', 71, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (150, '9605013', 20, 0, 150000, 'Pendataan pembayaran tanggungan Seragam siswa a/n AHMAD ZAINURI MAKRUF', 'tanggungan', 71, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (151, '6831937', 4, 50000, 0, 'Pendataan pembayaran tanggungan Study Tour siswa a/n AHMAD ZAINURI MAKRUF', 'tanggungan', 72, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (152, '6831937', 21, 0, 50000, 'Pendataan pembayaran tanggungan Study Tour siswa a/n AHMAD ZAINURI MAKRUF', 'tanggungan', 72, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (153, '2369797', 4, 100000, 0, 'Pendataan pembayaran tanggungan Prakerin siswa a/n AHMAD ZAINURI MAKRUF', 'tanggungan', 73, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (154, '2369797', 19, 0, 100000, 'Pendataan pembayaran tanggungan Prakerin siswa a/n AHMAD ZAINURI MAKRUF', 'tanggungan', 73, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (155, '710931', 4, 15000, 0, 'Pendataan pembayaran tanggungan Dana Sosial siswa a/n AHMAD ZAINURI MAKRUF', 'tanggungan', 74, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (156, '710931', 20, 0, 15000, 'Pendataan pembayaran tanggungan Dana Sosial siswa a/n AHMAD ZAINURI MAKRUF', 'tanggungan', 74, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (157, '9103239', 4, 200000, 0, 'Pendataan pembayaran tanggungan SPP siswa a/n ALDY PANDUWINATA', 'tanggungan', 75, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (158, '9103239', 20, 0, 200000, 'Pendataan pembayaran tanggungan SPP siswa a/n ALDY PANDUWINATA', 'tanggungan', 75, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (159, '3702585', 4, 2500000, 0, 'Pendataan pembayaran tanggungan DSP siswa a/n ALDY PANDUWINATA', 'tanggungan', 76, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (160, '3702585', 19, 0, 2500000, 'Pendataan pembayaran tanggungan DSP siswa a/n ALDY PANDUWINATA', 'tanggungan', 76, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (161, '544187', 4, 150000, 0, 'Pendataan pembayaran tanggungan Seragam siswa a/n ALDY PANDUWINATA', 'tanggungan', 77, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (162, '544187', 20, 0, 150000, 'Pendataan pembayaran tanggungan Seragam siswa a/n ALDY PANDUWINATA', 'tanggungan', 77, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (163, '5593648', 4, 50000, 0, 'Pendataan pembayaran tanggungan Study Tour siswa a/n ALDY PANDUWINATA', 'tanggungan', 78, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (164, '5593648', 21, 0, 50000, 'Pendataan pembayaran tanggungan Study Tour siswa a/n ALDY PANDUWINATA', 'tanggungan', 78, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (165, '7612858', 4, 100000, 0, 'Pendataan pembayaran tanggungan Prakerin siswa a/n ALDY PANDUWINATA', 'tanggungan', 79, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (166, '7612858', 19, 0, 100000, 'Pendataan pembayaran tanggungan Prakerin siswa a/n ALDY PANDUWINATA', 'tanggungan', 79, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (167, '8074628', 4, 15000, 0, 'Pendataan pembayaran tanggungan Dana Sosial siswa a/n ALDY PANDUWINATA', 'tanggungan', 80, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (168, '8074628', 20, 0, 15000, 'Pendataan pembayaran tanggungan Dana Sosial siswa a/n ALDY PANDUWINATA', 'tanggungan', 80, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (169, '9902135', 4, 200000, 0, 'Pendataan pembayaran tanggungan SPP siswa a/n ALIF BUKHORI', 'tanggungan', 81, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (170, '9902135', 20, 0, 200000, 'Pendataan pembayaran tanggungan SPP siswa a/n ALIF BUKHORI', 'tanggungan', 81, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (171, '9948535', 4, 2500000, 0, 'Pendataan pembayaran tanggungan DSP siswa a/n ALIF BUKHORI', 'tanggungan', 82, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (172, '9948535', 19, 0, 2500000, 'Pendataan pembayaran tanggungan DSP siswa a/n ALIF BUKHORI', 'tanggungan', 82, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (173, '8011270', 4, 150000, 0, 'Pendataan pembayaran tanggungan Seragam siswa a/n ALIF BUKHORI', 'tanggungan', 83, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (174, '8011270', 20, 0, 150000, 'Pendataan pembayaran tanggungan Seragam siswa a/n ALIF BUKHORI', 'tanggungan', 83, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (175, '9075738', 4, 50000, 0, 'Pendataan pembayaran tanggungan Study Tour siswa a/n ALIF BUKHORI', 'tanggungan', 84, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (176, '9075738', 21, 0, 50000, 'Pendataan pembayaran tanggungan Study Tour siswa a/n ALIF BUKHORI', 'tanggungan', 84, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (177, '2406536', 4, 100000, 0, 'Pendataan pembayaran tanggungan Prakerin siswa a/n ALIF BUKHORI', 'tanggungan', 85, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (178, '2406536', 19, 0, 100000, 'Pendataan pembayaran tanggungan Prakerin siswa a/n ALIF BUKHORI', 'tanggungan', 85, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (179, '8570485', 4, 15000, 0, 'Pendataan pembayaran tanggungan Dana Sosial siswa a/n ALIF BUKHORI', 'tanggungan', 86, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (180, '8570485', 20, 0, 15000, 'Pendataan pembayaran tanggungan Dana Sosial siswa a/n ALIF BUKHORI', 'tanggungan', 86, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (181, '8952740', 4, 200000, 0, 'Pendataan pembayaran tanggungan SPP siswa a/n ARI MUSTOFA', 'tanggungan', 87, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (182, '8952740', 20, 0, 200000, 'Pendataan pembayaran tanggungan SPP siswa a/n ARI MUSTOFA', 'tanggungan', 87, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (183, '3383598', 4, 2500000, 0, 'Pendataan pembayaran tanggungan DSP siswa a/n ARI MUSTOFA', 'tanggungan', 88, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (184, '3383598', 19, 0, 2500000, 'Pendataan pembayaran tanggungan DSP siswa a/n ARI MUSTOFA', 'tanggungan', 88, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (185, '8394881', 4, 150000, 0, 'Pendataan pembayaran tanggungan Seragam siswa a/n ARI MUSTOFA', 'tanggungan', 89, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (186, '8394881', 20, 0, 150000, 'Pendataan pembayaran tanggungan Seragam siswa a/n ARI MUSTOFA', 'tanggungan', 89, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (187, '5601771', 4, 50000, 0, 'Pendataan pembayaran tanggungan Study Tour siswa a/n ARI MUSTOFA', 'tanggungan', 90, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (188, '5601771', 21, 0, 50000, 'Pendataan pembayaran tanggungan Study Tour siswa a/n ARI MUSTOFA', 'tanggungan', 90, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (189, '1550544', 4, 100000, 0, 'Pendataan pembayaran tanggungan Prakerin siswa a/n ARI MUSTOFA', 'tanggungan', 91, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (190, '1550544', 19, 0, 100000, 'Pendataan pembayaran tanggungan Prakerin siswa a/n ARI MUSTOFA', 'tanggungan', 91, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (191, '2912759', 4, 15000, 0, 'Pendataan pembayaran tanggungan Dana Sosial siswa a/n ARI MUSTOFA', 'tanggungan', 92, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (192, '2912759', 20, 0, 15000, 'Pendataan pembayaran tanggungan Dana Sosial siswa a/n ARI MUSTOFA', 'tanggungan', 92, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (193, '4813641', 4, 200000, 0, 'Pendataan pembayaran tanggungan SPP siswa a/n DIDIK HARDIANTO', 'tanggungan', 93, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (194, '4813641', 20, 0, 200000, 'Pendataan pembayaran tanggungan SPP siswa a/n DIDIK HARDIANTO', 'tanggungan', 93, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (195, '8221360', 4, 2500000, 0, 'Pendataan pembayaran tanggungan DSP siswa a/n DIDIK HARDIANTO', 'tanggungan', 94, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (196, '8221360', 19, 0, 2500000, 'Pendataan pembayaran tanggungan DSP siswa a/n DIDIK HARDIANTO', 'tanggungan', 94, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (197, '1736215', 4, 150000, 0, 'Pendataan pembayaran tanggungan Seragam siswa a/n DIDIK HARDIANTO', 'tanggungan', 95, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (198, '1736215', 20, 0, 150000, 'Pendataan pembayaran tanggungan Seragam siswa a/n DIDIK HARDIANTO', 'tanggungan', 95, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (199, '6863934', 4, 50000, 0, 'Pendataan pembayaran tanggungan Study Tour siswa a/n DIDIK HARDIANTO', 'tanggungan', 96, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (200, '6863934', 21, 0, 50000, 'Pendataan pembayaran tanggungan Study Tour siswa a/n DIDIK HARDIANTO', 'tanggungan', 96, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (201, '3397468', 4, 100000, 0, 'Pendataan pembayaran tanggungan Prakerin siswa a/n DIDIK HARDIANTO', 'tanggungan', 97, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (202, '3397468', 19, 0, 100000, 'Pendataan pembayaran tanggungan Prakerin siswa a/n DIDIK HARDIANTO', 'tanggungan', 97, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (203, '1873294', 4, 15000, 0, 'Pendataan pembayaran tanggungan Dana Sosial siswa a/n DIDIK HARDIANTO', 'tanggungan', 98, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (204, '1873294', 20, 0, 15000, 'Pendataan pembayaran tanggungan Dana Sosial siswa a/n DIDIK HARDIANTO', 'tanggungan', 98, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (205, '7689767', 4, 200000, 0, 'Pendataan pembayaran tanggungan SPP siswa a/n FRENDI EKO CAHYONO', 'tanggungan', 99, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (206, '7689767', 20, 0, 200000, 'Pendataan pembayaran tanggungan SPP siswa a/n FRENDI EKO CAHYONO', 'tanggungan', 99, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (207, '9742368', 4, 2500000, 0, 'Pendataan pembayaran tanggungan DSP siswa a/n FRENDI EKO CAHYONO', 'tanggungan', 100, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (208, '9742368', 19, 0, 2500000, 'Pendataan pembayaran tanggungan DSP siswa a/n FRENDI EKO CAHYONO', 'tanggungan', 100, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (209, '4902627', 4, 150000, 0, 'Pendataan pembayaran tanggungan Seragam siswa a/n FRENDI EKO CAHYONO', 'tanggungan', 101, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (210, '4902627', 20, 0, 150000, 'Pendataan pembayaran tanggungan Seragam siswa a/n FRENDI EKO CAHYONO', 'tanggungan', 101, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (211, '9847196', 4, 50000, 0, 'Pendataan pembayaran tanggungan Study Tour siswa a/n FRENDI EKO CAHYONO', 'tanggungan', 102, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (212, '9847196', 21, 0, 50000, 'Pendataan pembayaran tanggungan Study Tour siswa a/n FRENDI EKO CAHYONO', 'tanggungan', 102, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (213, '5275643', 4, 100000, 0, 'Pendataan pembayaran tanggungan Prakerin siswa a/n FRENDI EKO CAHYONO', 'tanggungan', 103, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (214, '5275643', 19, 0, 100000, 'Pendataan pembayaran tanggungan Prakerin siswa a/n FRENDI EKO CAHYONO', 'tanggungan', 103, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (215, '780895', 4, 15000, 0, 'Pendataan pembayaran tanggungan Dana Sosial siswa a/n FRENDI EKO CAHYONO', 'tanggungan', 104, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (216, '780895', 20, 0, 15000, 'Pendataan pembayaran tanggungan Dana Sosial siswa a/n FRENDI EKO CAHYONO', 'tanggungan', 104, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (217, '4941362', 4, 200000, 0, 'Pendataan pembayaran tanggungan SPP siswa a/n HELMI BAYU SAPUTRO', 'tanggungan', 105, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (218, '4941362', 20, 0, 200000, 'Pendataan pembayaran tanggungan SPP siswa a/n HELMI BAYU SAPUTRO', 'tanggungan', 105, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (219, '8873772', 4, 2500000, 0, 'Pendataan pembayaran tanggungan DSP siswa a/n HELMI BAYU SAPUTRO', 'tanggungan', 106, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (220, '8873772', 19, 0, 2500000, 'Pendataan pembayaran tanggungan DSP siswa a/n HELMI BAYU SAPUTRO', 'tanggungan', 106, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (221, '5564028', 4, 150000, 0, 'Pendataan pembayaran tanggungan Seragam siswa a/n HELMI BAYU SAPUTRO', 'tanggungan', 107, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (222, '5564028', 20, 0, 150000, 'Pendataan pembayaran tanggungan Seragam siswa a/n HELMI BAYU SAPUTRO', 'tanggungan', 107, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (223, '2035935', 4, 50000, 0, 'Pendataan pembayaran tanggungan Study Tour siswa a/n HELMI BAYU SAPUTRO', 'tanggungan', 108, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (224, '2035935', 21, 0, 50000, 'Pendataan pembayaran tanggungan Study Tour siswa a/n HELMI BAYU SAPUTRO', 'tanggungan', 108, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (225, '7015527', 4, 100000, 0, 'Pendataan pembayaran tanggungan Prakerin siswa a/n HELMI BAYU SAPUTRO', 'tanggungan', 109, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (226, '7015527', 19, 0, 100000, 'Pendataan pembayaran tanggungan Prakerin siswa a/n HELMI BAYU SAPUTRO', 'tanggungan', 109, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (227, '2248496', 4, 15000, 0, 'Pendataan pembayaran tanggungan Dana Sosial siswa a/n HELMI BAYU SAPUTRO', 'tanggungan', 110, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (228, '2248496', 20, 0, 15000, 'Pendataan pembayaran tanggungan Dana Sosial siswa a/n HELMI BAYU SAPUTRO', 'tanggungan', 110, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (229, '6765566', 4, 200000, 0, 'Pendataan pembayaran tanggungan SPP siswa a/n KARTIKO BAYU PRASETYO', 'tanggungan', 111, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (230, '6765566', 20, 0, 200000, 'Pendataan pembayaran tanggungan SPP siswa a/n KARTIKO BAYU PRASETYO', 'tanggungan', 111, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (231, '3427704', 4, 2500000, 0, 'Pendataan pembayaran tanggungan DSP siswa a/n KARTIKO BAYU PRASETYO', 'tanggungan', 112, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (232, '3427704', 19, 0, 2500000, 'Pendataan pembayaran tanggungan DSP siswa a/n KARTIKO BAYU PRASETYO', 'tanggungan', 112, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (233, '3560522', 4, 150000, 0, 'Pendataan pembayaran tanggungan Seragam siswa a/n KARTIKO BAYU PRASETYO', 'tanggungan', 113, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (234, '3560522', 20, 0, 150000, 'Pendataan pembayaran tanggungan Seragam siswa a/n KARTIKO BAYU PRASETYO', 'tanggungan', 113, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (235, '5586238', 4, 50000, 0, 'Pendataan pembayaran tanggungan Study Tour siswa a/n KARTIKO BAYU PRASETYO', 'tanggungan', 114, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (236, '5586238', 21, 0, 50000, 'Pendataan pembayaran tanggungan Study Tour siswa a/n KARTIKO BAYU PRASETYO', 'tanggungan', 114, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (237, '7800293', 4, 100000, 0, 'Pendataan pembayaran tanggungan Prakerin siswa a/n KARTIKO BAYU PRASETYO', 'tanggungan', 115, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (238, '7800293', 19, 0, 100000, 'Pendataan pembayaran tanggungan Prakerin siswa a/n KARTIKO BAYU PRASETYO', 'tanggungan', 115, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (239, '4715107', 4, 15000, 0, 'Pendataan pembayaran tanggungan Dana Sosial siswa a/n KARTIKO BAYU PRASETYO', 'tanggungan', 116, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (240, '4715107', 20, 0, 15000, 'Pendataan pembayaran tanggungan Dana Sosial siswa a/n KARTIKO BAYU PRASETYO', 'tanggungan', 116, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (241, '9679091', 4, 200000, 0, 'Pendataan pembayaran tanggungan SPP siswa a/n KERISNA ARDIANTO', 'tanggungan', 117, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (242, '9679091', 20, 0, 200000, 'Pendataan pembayaran tanggungan SPP siswa a/n KERISNA ARDIANTO', 'tanggungan', 117, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (243, '2868685', 4, 2500000, 0, 'Pendataan pembayaran tanggungan DSP siswa a/n KERISNA ARDIANTO', 'tanggungan', 118, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (244, '2868685', 19, 0, 2500000, 'Pendataan pembayaran tanggungan DSP siswa a/n KERISNA ARDIANTO', 'tanggungan', 118, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (245, '4035207', 4, 150000, 0, 'Pendataan pembayaran tanggungan Seragam siswa a/n KERISNA ARDIANTO', 'tanggungan', 119, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (246, '4035207', 20, 0, 150000, 'Pendataan pembayaran tanggungan Seragam siswa a/n KERISNA ARDIANTO', 'tanggungan', 119, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (247, '2182519', 4, 50000, 0, 'Pendataan pembayaran tanggungan Study Tour siswa a/n KERISNA ARDIANTO', 'tanggungan', 120, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (248, '2182519', 21, 0, 50000, 'Pendataan pembayaran tanggungan Study Tour siswa a/n KERISNA ARDIANTO', 'tanggungan', 120, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (249, '473430', 4, 100000, 0, 'Pendataan pembayaran tanggungan Prakerin siswa a/n KERISNA ARDIANTO', 'tanggungan', 121, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (250, '473430', 19, 0, 100000, 'Pendataan pembayaran tanggungan Prakerin siswa a/n KERISNA ARDIANTO', 'tanggungan', 121, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (251, '100019', 4, 15000, 0, 'Pendataan pembayaran tanggungan Dana Sosial siswa a/n KERISNA ARDIANTO', 'tanggungan', 122, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (252, '100019', 20, 0, 15000, 'Pendataan pembayaran tanggungan Dana Sosial siswa a/n KERISNA ARDIANTO', 'tanggungan', 122, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (253, '642787', 4, 200000, 0, 'Pendataan pembayaran tanggungan SPP siswa a/n KOIRUL UBAIDILAH FATHUROKHIM', 'tanggungan', 123, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (254, '642787', 20, 0, 200000, 'Pendataan pembayaran tanggungan SPP siswa a/n KOIRUL UBAIDILAH FATHUROKHIM', 'tanggungan', 123, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (255, '1141283', 4, 2500000, 0, 'Pendataan pembayaran tanggungan DSP siswa a/n KOIRUL UBAIDILAH FATHUROKHIM', 'tanggungan', 124, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (256, '1141283', 19, 0, 2500000, 'Pendataan pembayaran tanggungan DSP siswa a/n KOIRUL UBAIDILAH FATHUROKHIM', 'tanggungan', 124, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (257, '5890649', 4, 150000, 0, 'Pendataan pembayaran tanggungan Seragam siswa a/n KOIRUL UBAIDILAH FATHUROKHIM', 'tanggungan', 125, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (258, '5890649', 20, 0, 150000, 'Pendataan pembayaran tanggungan Seragam siswa a/n KOIRUL UBAIDILAH FATHUROKHIM', 'tanggungan', 125, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (259, '3741747', 4, 50000, 0, 'Pendataan pembayaran tanggungan Study Tour siswa a/n KOIRUL UBAIDILAH FATHUROKHIM', 'tanggungan', 126, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (260, '3741747', 21, 0, 50000, 'Pendataan pembayaran tanggungan Study Tour siswa a/n KOIRUL UBAIDILAH FATHUROKHIM', 'tanggungan', 126, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (261, '5863291', 4, 100000, 0, 'Pendataan pembayaran tanggungan Prakerin siswa a/n KOIRUL UBAIDILAH FATHUROKHIM', 'tanggungan', 127, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (262, '5863291', 19, 0, 100000, 'Pendataan pembayaran tanggungan Prakerin siswa a/n KOIRUL UBAIDILAH FATHUROKHIM', 'tanggungan', 127, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (263, '6067978', 4, 15000, 0, 'Pendataan pembayaran tanggungan Dana Sosial siswa a/n KOIRUL UBAIDILAH FATHUROKHIM', 'tanggungan', 128, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (264, '6067978', 20, 0, 15000, 'Pendataan pembayaran tanggungan Dana Sosial siswa a/n KOIRUL UBAIDILAH FATHUROKHIM', 'tanggungan', 128, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (265, '7474095', 4, 200000, 0, 'Pendataan pembayaran tanggungan SPP siswa a/n KRISNA EKA SAPUTRA', 'tanggungan', 129, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (266, '7474095', 20, 0, 200000, 'Pendataan pembayaran tanggungan SPP siswa a/n KRISNA EKA SAPUTRA', 'tanggungan', 129, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (267, '93296', 4, 2500000, 0, 'Pendataan pembayaran tanggungan DSP siswa a/n KRISNA EKA SAPUTRA', 'tanggungan', 130, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (268, '93296', 19, 0, 2500000, 'Pendataan pembayaran tanggungan DSP siswa a/n KRISNA EKA SAPUTRA', 'tanggungan', 130, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (269, '9834272', 4, 150000, 0, 'Pendataan pembayaran tanggungan Seragam siswa a/n KRISNA EKA SAPUTRA', 'tanggungan', 131, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (270, '9834272', 20, 0, 150000, 'Pendataan pembayaran tanggungan Seragam siswa a/n KRISNA EKA SAPUTRA', 'tanggungan', 131, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (271, '9472925', 4, 50000, 0, 'Pendataan pembayaran tanggungan Study Tour siswa a/n KRISNA EKA SAPUTRA', 'tanggungan', 132, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (272, '9472925', 21, 0, 50000, 'Pendataan pembayaran tanggungan Study Tour siswa a/n KRISNA EKA SAPUTRA', 'tanggungan', 132, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (273, '3929027', 4, 100000, 0, 'Pendataan pembayaran tanggungan Prakerin siswa a/n KRISNA EKA SAPUTRA', 'tanggungan', 133, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (274, '3929027', 19, 0, 100000, 'Pendataan pembayaran tanggungan Prakerin siswa a/n KRISNA EKA SAPUTRA', 'tanggungan', 133, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (275, '2551737', 4, 15000, 0, 'Pendataan pembayaran tanggungan Dana Sosial siswa a/n KRISNA EKA SAPUTRA', 'tanggungan', 134, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (276, '2551737', 20, 0, 15000, 'Pendataan pembayaran tanggungan Dana Sosial siswa a/n KRISNA EKA SAPUTRA', 'tanggungan', 134, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (277, '4202408', 4, 200000, 0, 'Pendataan pembayaran tanggungan SPP siswa a/n LUKY WAHYU SAPUTRA', 'tanggungan', 135, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (278, '4202408', 20, 0, 200000, 'Pendataan pembayaran tanggungan SPP siswa a/n LUKY WAHYU SAPUTRA', 'tanggungan', 135, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (279, '129538', 4, 2500000, 0, 'Pendataan pembayaran tanggungan DSP siswa a/n LUKY WAHYU SAPUTRA', 'tanggungan', 136, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (280, '129538', 19, 0, 2500000, 'Pendataan pembayaran tanggungan DSP siswa a/n LUKY WAHYU SAPUTRA', 'tanggungan', 136, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (281, '4874171', 4, 150000, 0, 'Pendataan pembayaran tanggungan Seragam siswa a/n LUKY WAHYU SAPUTRA', 'tanggungan', 137, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (282, '4874171', 20, 0, 150000, 'Pendataan pembayaran tanggungan Seragam siswa a/n LUKY WAHYU SAPUTRA', 'tanggungan', 137, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (283, '1983672', 4, 50000, 0, 'Pendataan pembayaran tanggungan Study Tour siswa a/n LUKY WAHYU SAPUTRA', 'tanggungan', 138, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (284, '1983672', 21, 0, 50000, 'Pendataan pembayaran tanggungan Study Tour siswa a/n LUKY WAHYU SAPUTRA', 'tanggungan', 138, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (285, '6043682', 4, 100000, 0, 'Pendataan pembayaran tanggungan Prakerin siswa a/n LUKY WAHYU SAPUTRA', 'tanggungan', 139, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (286, '6043682', 19, 0, 100000, 'Pendataan pembayaran tanggungan Prakerin siswa a/n LUKY WAHYU SAPUTRA', 'tanggungan', 139, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (287, '2592326', 4, 15000, 0, 'Pendataan pembayaran tanggungan Dana Sosial siswa a/n LUKY WAHYU SAPUTRA', 'tanggungan', 140, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (288, '2592326', 20, 0, 15000, 'Pendataan pembayaran tanggungan Dana Sosial siswa a/n LUKY WAHYU SAPUTRA', 'tanggungan', 140, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (289, '572454', 4, 200000, 0, 'Pendataan pembayaran tanggungan SPP siswa a/n MOH ZEIN ARDIANSYAH', 'tanggungan', 141, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (290, '572454', 20, 0, 200000, 'Pendataan pembayaran tanggungan SPP siswa a/n MOH ZEIN ARDIANSYAH', 'tanggungan', 141, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (291, '6868074', 4, 2500000, 0, 'Pendataan pembayaran tanggungan DSP siswa a/n MOH ZEIN ARDIANSYAH', 'tanggungan', 142, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (292, '6868074', 19, 0, 2500000, 'Pendataan pembayaran tanggungan DSP siswa a/n MOH ZEIN ARDIANSYAH', 'tanggungan', 142, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (293, '4823784', 4, 150000, 0, 'Pendataan pembayaran tanggungan Seragam siswa a/n MOH ZEIN ARDIANSYAH', 'tanggungan', 143, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (294, '4823784', 20, 0, 150000, 'Pendataan pembayaran tanggungan Seragam siswa a/n MOH ZEIN ARDIANSYAH', 'tanggungan', 143, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (295, '7718490', 4, 50000, 0, 'Pendataan pembayaran tanggungan Study Tour siswa a/n MOH ZEIN ARDIANSYAH', 'tanggungan', 144, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (296, '7718490', 21, 0, 50000, 'Pendataan pembayaran tanggungan Study Tour siswa a/n MOH ZEIN ARDIANSYAH', 'tanggungan', 144, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (297, '9169893', 4, 100000, 0, 'Pendataan pembayaran tanggungan Prakerin siswa a/n MOH ZEIN ARDIANSYAH', 'tanggungan', 145, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (298, '9169893', 19, 0, 100000, 'Pendataan pembayaran tanggungan Prakerin siswa a/n MOH ZEIN ARDIANSYAH', 'tanggungan', 145, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (299, '8703550', 4, 15000, 0, 'Pendataan pembayaran tanggungan Dana Sosial siswa a/n MOH ZEIN ARDIANSYAH', 'tanggungan', 146, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (300, '8703550', 20, 0, 15000, 'Pendataan pembayaran tanggungan Dana Sosial siswa a/n MOH ZEIN ARDIANSYAH', 'tanggungan', 146, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (301, '9411672', 4, 200000, 0, 'Pendataan pembayaran tanggungan SPP siswa a/n MOH. ARIS SETIAWAN', 'tanggungan', 147, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (302, '9411672', 20, 0, 200000, 'Pendataan pembayaran tanggungan SPP siswa a/n MOH. ARIS SETIAWAN', 'tanggungan', 147, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (303, '462010', 4, 2500000, 0, 'Pendataan pembayaran tanggungan DSP siswa a/n MOH. ARIS SETIAWAN', 'tanggungan', 148, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (304, '462010', 19, 0, 2500000, 'Pendataan pembayaran tanggungan DSP siswa a/n MOH. ARIS SETIAWAN', 'tanggungan', 148, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (305, '5392516', 4, 150000, 0, 'Pendataan pembayaran tanggungan Seragam siswa a/n MOH. ARIS SETIAWAN', 'tanggungan', 149, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (306, '5392516', 20, 0, 150000, 'Pendataan pembayaran tanggungan Seragam siswa a/n MOH. ARIS SETIAWAN', 'tanggungan', 149, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (307, '7236023', 4, 50000, 0, 'Pendataan pembayaran tanggungan Study Tour siswa a/n MOH. ARIS SETIAWAN', 'tanggungan', 150, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (308, '7236023', 21, 0, 50000, 'Pendataan pembayaran tanggungan Study Tour siswa a/n MOH. ARIS SETIAWAN', 'tanggungan', 150, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (309, '7496238', 4, 100000, 0, 'Pendataan pembayaran tanggungan Prakerin siswa a/n MOH. ARIS SETIAWAN', 'tanggungan', 151, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (310, '7496238', 19, 0, 100000, 'Pendataan pembayaran tanggungan Prakerin siswa a/n MOH. ARIS SETIAWAN', 'tanggungan', 151, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (311, '4728631', 4, 15000, 0, 'Pendataan pembayaran tanggungan Dana Sosial siswa a/n MOH. ARIS SETIAWAN', 'tanggungan', 152, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (312, '4728631', 20, 0, 15000, 'Pendataan pembayaran tanggungan Dana Sosial siswa a/n MOH. ARIS SETIAWAN', 'tanggungan', 152, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (313, '3104066', 4, 200000, 0, 'Pendataan pembayaran tanggungan SPP siswa a/n MUHAMMAD BANA ALI MA\'RUF FAUZI', 'tanggungan', 153, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (314, '3104066', 20, 0, 200000, 'Pendataan pembayaran tanggungan SPP siswa a/n MUHAMMAD BANA ALI MA\'RUF FAUZI', 'tanggungan', 153, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (315, '132446', 4, 2500000, 0, 'Pendataan pembayaran tanggungan DSP siswa a/n MUHAMMAD BANA ALI MA\'RUF FAUZI', 'tanggungan', 154, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (316, '132446', 19, 0, 2500000, 'Pendataan pembayaran tanggungan DSP siswa a/n MUHAMMAD BANA ALI MA\'RUF FAUZI', 'tanggungan', 154, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (317, '7803562', 4, 150000, 0, 'Pendataan pembayaran tanggungan Seragam siswa a/n MUHAMMAD BANA ALI MA\'RUF FAUZI', 'tanggungan', 155, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (318, '7803562', 20, 0, 150000, 'Pendataan pembayaran tanggungan Seragam siswa a/n MUHAMMAD BANA ALI MA\'RUF FAUZI', 'tanggungan', 155, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (319, '3255973', 4, 50000, 0, 'Pendataan pembayaran tanggungan Study Tour siswa a/n MUHAMMAD BANA ALI MA\'RUF FAUZI', 'tanggungan', 156, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (320, '3255973', 21, 0, 50000, 'Pendataan pembayaran tanggungan Study Tour siswa a/n MUHAMMAD BANA ALI MA\'RUF FAUZI', 'tanggungan', 156, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (321, '3019202', 4, 100000, 0, 'Pendataan pembayaran tanggungan Prakerin siswa a/n MUHAMMAD BANA ALI MA\'RUF FAUZI', 'tanggungan', 157, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (322, '3019202', 19, 0, 100000, 'Pendataan pembayaran tanggungan Prakerin siswa a/n MUHAMMAD BANA ALI MA\'RUF FAUZI', 'tanggungan', 157, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (323, '7209009', 4, 15000, 0, 'Pendataan pembayaran tanggungan Dana Sosial siswa a/n MUHAMMAD BANA ALI MA\'RUF FAUZI', 'tanggungan', 158, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (324, '7209009', 20, 0, 15000, 'Pendataan pembayaran tanggungan Dana Sosial siswa a/n MUHAMMAD BANA ALI MA\'RUF FAUZI', 'tanggungan', 158, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (325, '7489519', 4, 200000, 0, 'Pendataan pembayaran tanggungan SPP siswa a/n NUR KHOIRUL ANAM', 'tanggungan', 159, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (326, '7489519', 20, 0, 200000, 'Pendataan pembayaran tanggungan SPP siswa a/n NUR KHOIRUL ANAM', 'tanggungan', 159, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (327, '9705947', 4, 2500000, 0, 'Pendataan pembayaran tanggungan DSP siswa a/n NUR KHOIRUL ANAM', 'tanggungan', 160, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (328, '9705947', 19, 0, 2500000, 'Pendataan pembayaran tanggungan DSP siswa a/n NUR KHOIRUL ANAM', 'tanggungan', 160, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (329, '3321197', 4, 150000, 0, 'Pendataan pembayaran tanggungan Seragam siswa a/n NUR KHOIRUL ANAM', 'tanggungan', 161, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (330, '3321197', 20, 0, 150000, 'Pendataan pembayaran tanggungan Seragam siswa a/n NUR KHOIRUL ANAM', 'tanggungan', 161, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (331, '6435892', 4, 50000, 0, 'Pendataan pembayaran tanggungan Study Tour siswa a/n NUR KHOIRUL ANAM', 'tanggungan', 162, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (332, '6435892', 21, 0, 50000, 'Pendataan pembayaran tanggungan Study Tour siswa a/n NUR KHOIRUL ANAM', 'tanggungan', 162, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (333, '7091568', 4, 100000, 0, 'Pendataan pembayaran tanggungan Prakerin siswa a/n NUR KHOIRUL ANAM', 'tanggungan', 163, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (334, '7091568', 19, 0, 100000, 'Pendataan pembayaran tanggungan Prakerin siswa a/n NUR KHOIRUL ANAM', 'tanggungan', 163, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (335, '7420358', 4, 15000, 0, 'Pendataan pembayaran tanggungan Dana Sosial siswa a/n NUR KHOIRUL ANAM', 'tanggungan', 164, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (336, '7420358', 20, 0, 15000, 'Pendataan pembayaran tanggungan Dana Sosial siswa a/n NUR KHOIRUL ANAM', 'tanggungan', 164, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (337, '3808613', 4, 200000, 0, 'Pendataan pembayaran tanggungan SPP siswa a/n RENDI ANDIKA DWI SAPUTRA', 'tanggungan', 165, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (338, '3808613', 20, 0, 200000, 'Pendataan pembayaran tanggungan SPP siswa a/n RENDI ANDIKA DWI SAPUTRA', 'tanggungan', 165, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (339, '6876200', 4, 2500000, 0, 'Pendataan pembayaran tanggungan DSP siswa a/n RENDI ANDIKA DWI SAPUTRA', 'tanggungan', 166, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (340, '6876200', 19, 0, 2500000, 'Pendataan pembayaran tanggungan DSP siswa a/n RENDI ANDIKA DWI SAPUTRA', 'tanggungan', 166, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (341, '7676596', 4, 150000, 0, 'Pendataan pembayaran tanggungan Seragam siswa a/n RENDI ANDIKA DWI SAPUTRA', 'tanggungan', 167, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (342, '7676596', 20, 0, 150000, 'Pendataan pembayaran tanggungan Seragam siswa a/n RENDI ANDIKA DWI SAPUTRA', 'tanggungan', 167, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (343, '1275318', 4, 50000, 0, 'Pendataan pembayaran tanggungan Study Tour siswa a/n RENDI ANDIKA DWI SAPUTRA', 'tanggungan', 168, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (344, '1275318', 21, 0, 50000, 'Pendataan pembayaran tanggungan Study Tour siswa a/n RENDI ANDIKA DWI SAPUTRA', 'tanggungan', 168, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (345, '7872869', 4, 100000, 0, 'Pendataan pembayaran tanggungan Prakerin siswa a/n RENDI ANDIKA DWI SAPUTRA', 'tanggungan', 169, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (346, '7872869', 19, 0, 100000, 'Pendataan pembayaran tanggungan Prakerin siswa a/n RENDI ANDIKA DWI SAPUTRA', 'tanggungan', 169, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (347, '9453496', 4, 15000, 0, 'Pendataan pembayaran tanggungan Dana Sosial siswa a/n RENDI ANDIKA DWI SAPUTRA', 'tanggungan', 170, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (348, '9453496', 20, 0, 15000, 'Pendataan pembayaran tanggungan Dana Sosial siswa a/n RENDI ANDIKA DWI SAPUTRA', 'tanggungan', 170, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (349, '4740087', 4, 200000, 0, 'Pendataan pembayaran tanggungan SPP siswa a/n RICO DIDIK MAHENDRA', 'tanggungan', 171, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (350, '4740087', 20, 0, 200000, 'Pendataan pembayaran tanggungan SPP siswa a/n RICO DIDIK MAHENDRA', 'tanggungan', 171, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (351, '4494945', 4, 2500000, 0, 'Pendataan pembayaran tanggungan DSP siswa a/n RICO DIDIK MAHENDRA', 'tanggungan', 172, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (352, '4494945', 19, 0, 2500000, 'Pendataan pembayaran tanggungan DSP siswa a/n RICO DIDIK MAHENDRA', 'tanggungan', 172, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (353, '1848056', 4, 150000, 0, 'Pendataan pembayaran tanggungan Seragam siswa a/n RICO DIDIK MAHENDRA', 'tanggungan', 173, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (354, '1848056', 20, 0, 150000, 'Pendataan pembayaran tanggungan Seragam siswa a/n RICO DIDIK MAHENDRA', 'tanggungan', 173, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (355, '4588720', 4, 50000, 0, 'Pendataan pembayaran tanggungan Study Tour siswa a/n RICO DIDIK MAHENDRA', 'tanggungan', 174, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (356, '4588720', 21, 0, 50000, 'Pendataan pembayaran tanggungan Study Tour siswa a/n RICO DIDIK MAHENDRA', 'tanggungan', 174, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (357, '8078403', 4, 100000, 0, 'Pendataan pembayaran tanggungan Prakerin siswa a/n RICO DIDIK MAHENDRA', 'tanggungan', 175, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (358, '8078403', 19, 0, 100000, 'Pendataan pembayaran tanggungan Prakerin siswa a/n RICO DIDIK MAHENDRA', 'tanggungan', 175, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (359, '5648915', 4, 15000, 0, 'Pendataan pembayaran tanggungan Dana Sosial siswa a/n RICO DIDIK MAHENDRA', 'tanggungan', 176, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (360, '5648915', 20, 0, 15000, 'Pendataan pembayaran tanggungan Dana Sosial siswa a/n RICO DIDIK MAHENDRA', 'tanggungan', 176, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (361, '1448466', 4, 200000, 0, 'Pendataan pembayaran tanggungan SPP siswa a/n RIO ARDIANTO', 'tanggungan', 177, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (362, '1448466', 20, 0, 200000, 'Pendataan pembayaran tanggungan SPP siswa a/n RIO ARDIANTO', 'tanggungan', 177, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (363, '9884169', 4, 2500000, 0, 'Pendataan pembayaran tanggungan DSP siswa a/n RIO ARDIANTO', 'tanggungan', 178, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (364, '9884169', 19, 0, 2500000, 'Pendataan pembayaran tanggungan DSP siswa a/n RIO ARDIANTO', 'tanggungan', 178, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (365, '7078177', 4, 150000, 0, 'Pendataan pembayaran tanggungan Seragam siswa a/n RIO ARDIANTO', 'tanggungan', 179, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (366, '7078177', 20, 0, 150000, 'Pendataan pembayaran tanggungan Seragam siswa a/n RIO ARDIANTO', 'tanggungan', 179, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (367, '7131837', 4, 50000, 0, 'Pendataan pembayaran tanggungan Study Tour siswa a/n RIO ARDIANTO', 'tanggungan', 180, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (368, '7131837', 21, 0, 50000, 'Pendataan pembayaran tanggungan Study Tour siswa a/n RIO ARDIANTO', 'tanggungan', 180, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (369, '1109388', 4, 100000, 0, 'Pendataan pembayaran tanggungan Prakerin siswa a/n RIO ARDIANTO', 'tanggungan', 181, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (370, '1109388', 19, 0, 100000, 'Pendataan pembayaran tanggungan Prakerin siswa a/n RIO ARDIANTO', 'tanggungan', 181, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (371, '5963771', 4, 15000, 0, 'Pendataan pembayaran tanggungan Dana Sosial siswa a/n RIO ARDIANTO', 'tanggungan', 182, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (372, '5963771', 20, 0, 15000, 'Pendataan pembayaran tanggungan Dana Sosial siswa a/n RIO ARDIANTO', 'tanggungan', 182, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (373, '276727', 4, 200000, 0, 'Pendataan pembayaran tanggungan SPP siswa a/n ROKY SEPTIAN WIRANTO', 'tanggungan', 183, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (374, '276727', 20, 0, 200000, 'Pendataan pembayaran tanggungan SPP siswa a/n ROKY SEPTIAN WIRANTO', 'tanggungan', 183, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (375, '7644480', 4, 2500000, 0, 'Pendataan pembayaran tanggungan DSP siswa a/n ROKY SEPTIAN WIRANTO', 'tanggungan', 184, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (376, '7644480', 19, 0, 2500000, 'Pendataan pembayaran tanggungan DSP siswa a/n ROKY SEPTIAN WIRANTO', 'tanggungan', 184, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (377, '9026797', 4, 150000, 0, 'Pendataan pembayaran tanggungan Seragam siswa a/n ROKY SEPTIAN WIRANTO', 'tanggungan', 185, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (378, '9026797', 20, 0, 150000, 'Pendataan pembayaran tanggungan Seragam siswa a/n ROKY SEPTIAN WIRANTO', 'tanggungan', 185, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (379, '8657891', 4, 50000, 0, 'Pendataan pembayaran tanggungan Study Tour siswa a/n ROKY SEPTIAN WIRANTO', 'tanggungan', 186, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (380, '8657891', 21, 0, 50000, 'Pendataan pembayaran tanggungan Study Tour siswa a/n ROKY SEPTIAN WIRANTO', 'tanggungan', 186, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (381, '1202434', 4, 100000, 0, 'Pendataan pembayaran tanggungan Prakerin siswa a/n ROKY SEPTIAN WIRANTO', 'tanggungan', 187, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (382, '1202434', 19, 0, 100000, 'Pendataan pembayaran tanggungan Prakerin siswa a/n ROKY SEPTIAN WIRANTO', 'tanggungan', 187, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (383, '729119', 4, 15000, 0, 'Pendataan pembayaran tanggungan Dana Sosial siswa a/n ROKY SEPTIAN WIRANTO', 'tanggungan', 188, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (384, '729119', 20, 0, 15000, 'Pendataan pembayaran tanggungan Dana Sosial siswa a/n ROKY SEPTIAN WIRANTO', 'tanggungan', 188, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (385, '1444243', 4, 200000, 0, 'Pendataan pembayaran tanggungan SPP siswa a/n RUDI KRISBIYANTO', 'tanggungan', 189, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (386, '1444243', 20, 0, 200000, 'Pendataan pembayaran tanggungan SPP siswa a/n RUDI KRISBIYANTO', 'tanggungan', 189, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (387, '9198266', 4, 2500000, 0, 'Pendataan pembayaran tanggungan DSP siswa a/n RUDI KRISBIYANTO', 'tanggungan', 190, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (388, '9198266', 19, 0, 2500000, 'Pendataan pembayaran tanggungan DSP siswa a/n RUDI KRISBIYANTO', 'tanggungan', 190, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (389, '7495351', 4, 150000, 0, 'Pendataan pembayaran tanggungan Seragam siswa a/n RUDI KRISBIYANTO', 'tanggungan', 191, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (390, '7495351', 20, 0, 150000, 'Pendataan pembayaran tanggungan Seragam siswa a/n RUDI KRISBIYANTO', 'tanggungan', 191, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (391, '6145903', 4, 50000, 0, 'Pendataan pembayaran tanggungan Study Tour siswa a/n RUDI KRISBIYANTO', 'tanggungan', 192, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (392, '6145903', 21, 0, 50000, 'Pendataan pembayaran tanggungan Study Tour siswa a/n RUDI KRISBIYANTO', 'tanggungan', 192, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (393, '4130399', 4, 100000, 0, 'Pendataan pembayaran tanggungan Prakerin siswa a/n RUDI KRISBIYANTO', 'tanggungan', 193, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (394, '4130399', 19, 0, 100000, 'Pendataan pembayaran tanggungan Prakerin siswa a/n RUDI KRISBIYANTO', 'tanggungan', 193, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (395, '6848737', 4, 15000, 0, 'Pendataan pembayaran tanggungan Dana Sosial siswa a/n RUDI KRISBIYANTO', 'tanggungan', 194, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (396, '6848737', 20, 0, 15000, 'Pendataan pembayaran tanggungan Dana Sosial siswa a/n RUDI KRISBIYANTO', 'tanggungan', 194, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (397, '4175423', 4, 200000, 0, 'Pendataan pembayaran tanggungan SPP siswa a/n RUDY FAJAR NUGROHO', 'tanggungan', 195, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (398, '4175423', 20, 0, 200000, 'Pendataan pembayaran tanggungan SPP siswa a/n RUDY FAJAR NUGROHO', 'tanggungan', 195, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (399, '7860047', 4, 2500000, 0, 'Pendataan pembayaran tanggungan DSP siswa a/n RUDY FAJAR NUGROHO', 'tanggungan', 196, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (400, '7860047', 19, 0, 2500000, 'Pendataan pembayaran tanggungan DSP siswa a/n RUDY FAJAR NUGROHO', 'tanggungan', 196, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (401, '4302433', 4, 150000, 0, 'Pendataan pembayaran tanggungan Seragam siswa a/n RUDY FAJAR NUGROHO', 'tanggungan', 197, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (402, '4302433', 20, 0, 150000, 'Pendataan pembayaran tanggungan Seragam siswa a/n RUDY FAJAR NUGROHO', 'tanggungan', 197, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (403, '7487723', 4, 50000, 0, 'Pendataan pembayaran tanggungan Study Tour siswa a/n RUDY FAJAR NUGROHO', 'tanggungan', 198, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (404, '7487723', 21, 0, 50000, 'Pendataan pembayaran tanggungan Study Tour siswa a/n RUDY FAJAR NUGROHO', 'tanggungan', 198, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (405, '7880699', 4, 100000, 0, 'Pendataan pembayaran tanggungan Prakerin siswa a/n RUDY FAJAR NUGROHO', 'tanggungan', 199, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (406, '7880699', 19, 0, 100000, 'Pendataan pembayaran tanggungan Prakerin siswa a/n RUDY FAJAR NUGROHO', 'tanggungan', 199, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (407, '2955317', 4, 15000, 0, 'Pendataan pembayaran tanggungan Dana Sosial siswa a/n RUDY FAJAR NUGROHO', 'tanggungan', 200, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (408, '2955317', 20, 0, 15000, 'Pendataan pembayaran tanggungan Dana Sosial siswa a/n RUDY FAJAR NUGROHO', 'tanggungan', 200, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (409, '4919989', 4, 200000, 0, 'Pendataan pembayaran tanggungan SPP siswa a/n SONY SETIAWAN', 'tanggungan', 201, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (410, '4919989', 20, 0, 200000, 'Pendataan pembayaran tanggungan SPP siswa a/n SONY SETIAWAN', 'tanggungan', 201, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (411, '3580666', 4, 2500000, 0, 'Pendataan pembayaran tanggungan DSP siswa a/n SONY SETIAWAN', 'tanggungan', 202, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (412, '3580666', 19, 0, 2500000, 'Pendataan pembayaran tanggungan DSP siswa a/n SONY SETIAWAN', 'tanggungan', 202, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (413, '7809057', 4, 150000, 0, 'Pendataan pembayaran tanggungan Seragam siswa a/n SONY SETIAWAN', 'tanggungan', 203, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (414, '7809057', 20, 0, 150000, 'Pendataan pembayaran tanggungan Seragam siswa a/n SONY SETIAWAN', 'tanggungan', 203, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (415, '9662269', 4, 50000, 0, 'Pendataan pembayaran tanggungan Study Tour siswa a/n SONY SETIAWAN', 'tanggungan', 204, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (416, '9662269', 21, 0, 50000, 'Pendataan pembayaran tanggungan Study Tour siswa a/n SONY SETIAWAN', 'tanggungan', 204, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (417, '7630552', 4, 100000, 0, 'Pendataan pembayaran tanggungan Prakerin siswa a/n SONY SETIAWAN', 'tanggungan', 205, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (418, '7630552', 19, 0, 100000, 'Pendataan pembayaran tanggungan Prakerin siswa a/n SONY SETIAWAN', 'tanggungan', 205, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (419, '4813542', 4, 15000, 0, 'Pendataan pembayaran tanggungan Dana Sosial siswa a/n SONY SETIAWAN', 'tanggungan', 206, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (420, '4813542', 20, 0, 15000, 'Pendataan pembayaran tanggungan Dana Sosial siswa a/n SONY SETIAWAN', 'tanggungan', 206, '2022-08-22 18:10:35');
INSERT INTO `jurnal_umum` VALUES (421, '1184488', 1, 200000, 0, 'Pembayaran tanggungan SPP siswa a/n AHMAD ZAINURI MAKRUF', 'penerimaan', 5, '2022-08-22 18:13:47');
INSERT INTO `jurnal_umum` VALUES (422, '1184488', 4, 0, 200000, 'Pembayaran tanggungan SPP siswa a/n AHMAD ZAINURI MAKRUF', 'penerimaan', 5, '2022-08-22 18:13:47');
INSERT INTO `jurnal_umum` VALUES (423, '2328888', 1, 50000, 0, 'Pembayaran tanggungan Seragam siswa a/n AHMAD ZAINURI MAKRUF', 'penerimaan', 6, '2022-08-22 18:13:47');
INSERT INTO `jurnal_umum` VALUES (424, '2328888', 4, 0, 50000, 'Pembayaran tanggungan Seragam siswa a/n AHMAD ZAINURI MAKRUF', 'penerimaan', 6, '2022-08-22 18:13:47');
INSERT INTO `jurnal_umum` VALUES (427, '1613278', 4, 50000, 0, 'Pendataan Tanggungan Alumni a/n AHMAD ZAINURI MAKRUF', 'tanggungan_alumni', 3, '2022-08-23 08:47:24');
INSERT INTO `jurnal_umum` VALUES (428, '1613278', 20, 0, 50000, 'Pendataan Tanggungan Alumni a/n AHMAD ZAINURI MAKRUF', 'tanggungan_alumni', 3, '2022-08-23 08:47:24');
INSERT INTO `jurnal_umum` VALUES (429, '4096145', 4, 500000, 0, 'Pendataan Tanggungan Alumni a/n YOSEPTY NURUL FERRISA', 'tanggungan_alumni', 4, '2022-08-23 08:49:55');
INSERT INTO `jurnal_umum` VALUES (430, '4096145', 19, 0, 500000, 'Pendataan Tanggungan Alumni a/n YOSEPTY NURUL FERRISA', 'tanggungan_alumni', 4, '2022-08-23 08:49:55');
INSERT INTO `jurnal_umum` VALUES (433, '4774025', 4, 150000, 0, 'Pendataan Tanggungan Alumni a/n AHMAD ZAINURI MAKRUF', 'tanggungan_alumni', 6, '2022-08-23 09:02:13');
INSERT INTO `jurnal_umum` VALUES (434, '4774025', 20, 0, 150000, 'Pendataan Tanggungan Alumni a/n AHMAD ZAINURI MAKRUF', 'tanggungan_alumni', 6, '2022-08-23 09:02:13');
INSERT INTO `jurnal_umum` VALUES (439, '3503528', 1, 15000, 0, 'Pembayaran tanggungan alumni Kekurangan Uang Gedung alumni a/n AHMAD ZAINURI MAKRUF', 'penerimaan_alumni', 3, '2022-08-23 12:18:33');
INSERT INTO `jurnal_umum` VALUES (440, '3503528', 4, 0, 15000, 'Pembayaran tanggungan alumni Kekurangan Uang Gedung alumni a/n AHMAD ZAINURI MAKRUF', 'penerimaan_alumni', 3, '2022-08-23 12:18:33');
INSERT INTO `jurnal_umum` VALUES (441, '9766857', 1, 150000, 0, 'Pembayaran tanggungan alumni Bayar ujian susulan alumni a/n AHMAD ZAINURI MAKRUF', 'penerimaan_alumni', 4, '2022-08-23 12:18:33');
INSERT INTO `jurnal_umum` VALUES (442, '9766857', 4, 0, 150000, 'Pembayaran tanggungan alumni Bayar ujian susulan alumni a/n AHMAD ZAINURI MAKRUF', 'penerimaan_alumni', 4, '2022-08-23 12:18:33');
INSERT INTO `jurnal_umum` VALUES (455, '8899573', 21, 150000, 0, 'Pendataan Tanggungan Alumni a/n YOSEPTY NURUL FERRISA', 'tanggungan_alumni', 13, '2022-08-23 20:31:06');
INSERT INTO `jurnal_umum` VALUES (456, '8899573', 4, 0, 150000, 'Pendataan Tanggungan Alumni a/n YOSEPTY NURUL FERRISA', 'tanggungan_alumni', 13, '2022-08-23 20:31:06');

-- ----------------------------
-- Table structure for jurusan
-- ----------------------------
DROP TABLE IF EXISTS `jurusan`;
CREATE TABLE `jurusan`  (
  `id_jurusan` int(11) NOT NULL AUTO_INCREMENT,
  `jurusan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `singkatan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `iddepartment_fk` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_jurusan`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jurusan
-- ----------------------------
INSERT INTO `jurusan` VALUES (6, 'Agribisnis Pengolahan Hasil Pertanian', 'APHP', 1);
INSERT INTO `jurusan` VALUES (7, 'Teknik dan Bisnis Sepeda Motor', 'TBSM', 1);
INSERT INTO `jurusan` VALUES (9, 'Multimedia', 'MM', 1);
INSERT INTO `jurusan` VALUES (10, 'Agribisnis Ternak Rumininsia', 'ATR', 1);
INSERT INTO `jurusan` VALUES (13, 'Atlas', 'A', 2);
INSERT INTO `jurusan` VALUES (14, 'Beta', 'B', 2);

-- ----------------------------
-- Table structure for kaprog
-- ----------------------------
DROP TABLE IF EXISTS `kaprog`;
CREATE TABLE `kaprog`  (
  `id_kaprog` int(11) NOT NULL AUTO_INCREMENT,
  `idguru_fk` int(11) NULL DEFAULT NULL,
  `idjurusan_fk` int(11) NULL DEFAULT NULL,
  `idtahunajaran_fk` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_kaprog`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for kd
-- ----------------------------
DROP TABLE IF EXISTS `kd`;
CREATE TABLE `kd`  (
  `id_kd` int(11) NOT NULL AUTO_INCREMENT,
  `idkelas_fk` int(11) NULL DEFAULT NULL,
  `idjenispenilaian_fk` int(11) NULL DEFAULT NULL,
  `idmatapelajaran_fk` int(11) NULL DEFAULT NULL,
  `kode` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `ringkasan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `idmateri_fk` int(11) NULL DEFAULT NULL,
  `idguru_fk` int(11) NULL DEFAULT NULL,
  `idtahunajaran_fk` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_kd`) USING BTREE,
  INDEX `idtingkat_fk`(`idkelas_fk`) USING BTREE,
  INDEX `idjenispenilaian_fk`(`idjenispenilaian_fk`) USING BTREE,
  INDEX `idsemester_fk`(`idmatapelajaran_fk`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for kelas
-- ----------------------------
DROP TABLE IF EXISTS `kelas`;
CREATE TABLE `kelas`  (
  `id_kelas` int(11) NOT NULL AUTO_INCREMENT,
  `kelas` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `idtingkat_fk` int(11) NULL DEFAULT NULL,
  `create_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `idjurusan_fk` int(11) NULL DEFAULT NULL,
  `idtahunajaran_fk` int(11) NULL DEFAULT NULL,
  `iddepartment_fk` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_kelas`) USING BTREE,
  INDEX `idtingkat_fk`(`idtingkat_fk`) USING BTREE,
  CONSTRAINT `kelas_ibfk_1` FOREIGN KEY (`idtingkat_fk`) REFERENCES `tingkat` (`id_tingkat`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 49 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of kelas
-- ----------------------------
INSERT INTO `kelas` VALUES (39, 'X APHP', 1, '2022-07-17 10:45:09', 6, 4, 1);
INSERT INTO `kelas` VALUES (40, 'XI APHP', 2, '2022-07-17 10:45:21', 6, 4, 1);
INSERT INTO `kelas` VALUES (41, 'XII APHP', 3, '2022-07-17 10:45:34', 6, 4, 1);
INSERT INTO `kelas` VALUES (42, 'X TBSM', 1, '2022-07-17 10:46:06', 7, 4, 1);
INSERT INTO `kelas` VALUES (43, 'XI TBSM', 2, '2022-07-17 10:46:18', 7, 4, 1);
INSERT INTO `kelas` VALUES (44, 'XII TBSM', 3, '2022-07-17 10:46:57', 7, 4, 1);
INSERT INTO `kelas` VALUES (45, 'X MM', 1, '2022-07-17 10:47:19', 9, 4, 1);
INSERT INTO `kelas` VALUES (46, 'XI MM', 2, '2022-07-17 10:47:32', 9, 4, 1);
INSERT INTO `kelas` VALUES (47, 'XII MM', 3, '2022-07-17 10:47:42', 9, 4, 1);
INSERT INTO `kelas` VALUES (48, 'X ATR', 1, '2022-07-17 10:47:52', 10, 4, 1);

-- ----------------------------
-- Table structure for kelas_erapor
-- ----------------------------
DROP TABLE IF EXISTS `kelas_erapor`;
CREATE TABLE `kelas_erapor`  (
  `id_kelas_erapor` int(11) NOT NULL AUTO_INCREMENT,
  `idkelas_fk` int(11) NULL DEFAULT NULL,
  `iderapor_fk` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_kelas_erapor`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for kelas_oas
-- ----------------------------
DROP TABLE IF EXISTS `kelas_oas`;
CREATE TABLE `kelas_oas`  (
  `id_kelas_oas` int(11) NOT NULL AUTO_INCREMENT,
  `idkelas_fk` int(11) NULL DEFAULT NULL,
  `idoas_fk` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_kelas_oas`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for kerjasama_dudi
-- ----------------------------
DROP TABLE IF EXISTS `kerjasama_dudi`;
CREATE TABLE `kerjasama_dudi`  (
  `id_kerjasama_dudi` int(11) NOT NULL AUTO_INCREMENT,
  `idjeniskerjasama_fk` int(11) NULL DEFAULT NULL,
  `iddudi_fk` int(11) NULL DEFAULT NULL,
  `keterangan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `berkas` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`id_kerjasama_dudi`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of kerjasama_dudi
-- ----------------------------
INSERT INTO `kerjasama_dudi` VALUES (3, 2, 2, 'sdsd', 'aba67d99a8705ec44be39e673749b1d6.jpg');
INSERT INTO `kerjasama_dudi` VALUES (4, 3, 4, 'asd', '2e86cc3ac1fa1cfafe7f8803b7a6ce3e.jpg');

-- ----------------------------
-- Table structure for kompetensi_pkg
-- ----------------------------
DROP TABLE IF EXISTS `kompetensi_pkg`;
CREATE TABLE `kompetensi_pkg`  (
  `id_kompetensi_pkg` int(11) NOT NULL AUTO_INCREMENT,
  `kompetensi` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `idtahunajaran_fk` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_kompetensi_pkg`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for koperasi_member
-- ----------------------------
DROP TABLE IF EXISTS `koperasi_member`;
CREATE TABLE `koperasi_member`  (
  `id_koperasi_member` int(11) NOT NULL AUTO_INCREMENT,
  `table` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `idtable_fk` int(11) NULL DEFAULT NULL,
  `jumlah_simpanan_wajib` double NULL DEFAULT NULL,
  `jumlah_simpanan_pokok` double NULL DEFAULT NULL,
  PRIMARY KEY (`id_koperasi_member`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for kursus_pegawai
-- ----------------------------
DROP TABLE IF EXISTS `kursus_pegawai`;
CREATE TABLE `kursus_pegawai`  (
  `id_kursus_pegawai` int(11) NOT NULL AUTO_INCREMENT,
  `jenis` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `tahun` int(255) NULL DEFAULT NULL,
  `bulan` int(255) NULL DEFAULT NULL,
  `hari` int(255) NULL DEFAULT NULL,
  `tingkat` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `keterangan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `idguru_fk` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_kursus_pegawai`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for learning
-- ----------------------------
DROP TABLE IF EXISTS `learning`;
CREATE TABLE `learning`  (
  `id_learning` int(11) NOT NULL AUTO_INCREMENT,
  `idmatapelajaran_fk` int(11) NULL DEFAULT NULL,
  `idkd_fk` int(11) NULL DEFAULT 999,
  `materi` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `open_access` int(255) NULL DEFAULT NULL COMMENT '0 = Private Access\r\n1 = Open Access(student only)\r\n2 = All Access(public can read)',
  `password` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `iduser_fk` int(11) UNSIGNED NULL DEFAULT NULL,
  `judul` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `create_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `idtingkat_fk` int(11) NULL DEFAULT NULL,
  `cover` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `learn_code` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `task_code` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`id_learning`) USING BTREE,
  INDEX `learning_ibfk_1`(`idmatapelajaran_fk`) USING BTREE,
  INDEX `idkd_fk`(`idkd_fk`) USING BTREE,
  INDEX `iduser_fk`(`iduser_fk`) USING BTREE,
  INDEX `idtingkat_fk`(`idtingkat_fk`) USING BTREE,
  CONSTRAINT `learning_ibfk_1` FOREIGN KEY (`idmatapelajaran_fk`) REFERENCES `mata_pelajaran` (`id_mata_pelajaran`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `learning_ibfk_2` FOREIGN KEY (`iduser_fk`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `learning_ibfk_3` FOREIGN KEY (`idtingkat_fk`) REFERENCES `tingkat` (`id_tingkat`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for learning_course
-- ----------------------------
DROP TABLE IF EXISTS `learning_course`;
CREATE TABLE `learning_course`  (
  `id_learning_course` int(11) NOT NULL AUTO_INCREMENT,
  `course_code` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `course` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `desc` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `banner` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`id_learning_course`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for learning_lessons
-- ----------------------------
DROP TABLE IF EXISTS `learning_lessons`;
CREATE TABLE `learning_lessons`  (
  `id_learning_lessons` int(11) NOT NULL AUTO_INCREMENT,
  `idlearningsyllabus_fk` int(11) NULL DEFAULT NULL,
  `lessons_code` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `lessons` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `desc` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`id_learning_lessons`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for learning_materials
-- ----------------------------
DROP TABLE IF EXISTS `learning_materials`;
CREATE TABLE `learning_materials`  (
  `id_learning_materials` int(11) NOT NULL AUTO_INCREMENT,
  `idlearninglessons_fk` int(11) NULL DEFAULT NULL,
  `materials_code` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `materials` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `banner` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`id_learning_materials`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for learning_set_materials
-- ----------------------------
DROP TABLE IF EXISTS `learning_set_materials`;
CREATE TABLE `learning_set_materials`  (
  `id_learning_set_materials` int(11) NOT NULL AUTO_INCREMENT,
  `materials` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `covers` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `create_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `iduser_fk` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_learning_set_materials`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for learning_set_quiz
-- ----------------------------
DROP TABLE IF EXISTS `learning_set_quiz`;
CREATE TABLE `learning_set_quiz`  (
  `id_learning_set_quiz` int(11) NOT NULL AUTO_INCREMENT,
  `quiz_name` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`id_learning_set_quiz`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for learning_set_task
-- ----------------------------
DROP TABLE IF EXISTS `learning_set_task`;
CREATE TABLE `learning_set_task`  (
  `id_learning_set_task` int(11) NOT NULL AUTO_INCREMENT,
  `task_code` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `task` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `title` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `type_task` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`id_learning_set_task`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for learning_syllabus
-- ----------------------------
DROP TABLE IF EXISTS `learning_syllabus`;
CREATE TABLE `learning_syllabus`  (
  `id_learning_syllabus` int(11) NOT NULL AUTO_INCREMENT,
  `idlearningcourse_fk` int(11) NULL DEFAULT NULL,
  `syllabus_code` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `syllabus` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`id_learning_syllabus`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for log_kelas_siswa
-- ----------------------------
DROP TABLE IF EXISTS `log_kelas_siswa`;
CREATE TABLE `log_kelas_siswa`  (
  `id_log_kelas_siswa` int(11) NOT NULL AUTO_INCREMENT,
  `idsiswa_fk` int(11) NULL DEFAULT NULL,
  `idkelasbefore_fk` int(11) NULL DEFAULT NULL,
  `idkelasafter_fk` int(11) NULL DEFAULT NULL,
  `create_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `keterangan` int(11) NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_log_kelas_siswa`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of log_kelas_siswa
-- ----------------------------
INSERT INTO `log_kelas_siswa` VALUES (2, 592, 40, 41, '2022-08-01 18:04:10', 0, 'NAIK KELAS');
INSERT INTO `log_kelas_siswa` VALUES (3, 592, 41, 40, '2022-08-01 18:04:29', 0, 'NAIK KELAS');

-- ----------------------------
-- Table structure for login_attempts
-- ----------------------------
DROP TABLE IF EXISTS `login_attempts`;
CREATE TABLE `login_attempts`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `login` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `time` int(11) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for lowongan
-- ----------------------------
DROP TABLE IF EXISTS `lowongan`;
CREATE TABLE `lowongan`  (
  `id_lowongan` int(11) NOT NULL AUTO_INCREMENT COMMENT ' ',
  `iddudi_fk` int(11) NULL DEFAULT NULL,
  `keterangan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `rentang_gaji` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `berkas` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `judul` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `deadline` date NULL DEFAULT NULL,
  PRIMARY KEY (`id_lowongan`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of lowongan
-- ----------------------------
INSERT INTO `lowongan` VALUES (1, 3, '11', '300001', '4ae691c91cfc23322c197408cb87a37a.jpg', 'Lowongan Programmer 1', '2022-10-26');
INSERT INTO `lowongan` VALUES (2, 4, 'asd', '1500000', '96fc9c22ba255804448b18bcfb759850.jpg', 'Lowongan Admin', '2022-10-24');

-- ----------------------------
-- Table structure for mapel_ajar_pegawai
-- ----------------------------
DROP TABLE IF EXISTS `mapel_ajar_pegawai`;
CREATE TABLE `mapel_ajar_pegawai`  (
  `id_mapel_ajar_pegawai` int(11) NOT NULL AUTO_INCREMENT,
  `idguru_fk` int(11) NULL DEFAULT NULL,
  `mapel` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `sekolah` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `kelas` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `tahun` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`id_mapel_ajar_pegawai`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for mata_pelajaran
-- ----------------------------
DROP TABLE IF EXISTS `mata_pelajaran`;
CREATE TABLE `mata_pelajaran`  (
  `id_mata_pelajaran` int(11) NOT NULL AUTO_INCREMENT,
  `mata_pelajaran` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `kode` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `idjenismatapelajaran_fk` int(11) NULL DEFAULT NULL,
  `jKode` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_mata_pelajaran`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of mata_pelajaran
-- ----------------------------
INSERT INTO `mata_pelajaran` VALUES (1, 'Matematika', 'MTK', NULL, NULL);
INSERT INTO `mata_pelajaran` VALUES (2, 'Bahasa Indonesia', 'BIND', NULL, NULL);

-- ----------------------------
-- Table structure for materi
-- ----------------------------
DROP TABLE IF EXISTS `materi`;
CREATE TABLE `materi`  (
  `id_materi` int(11) NOT NULL AUTO_INCREMENT,
  `materi` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `file_materi` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `file_rpp` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `idkelas_fk` int(11) NULL DEFAULT NULL,
  `idguru_fk` int(11) NULL DEFAULT NULL,
  `idtahunajaran_fk` int(11) NULL DEFAULT NULL,
  `idmatapelajaran_fk` int(11) NULL DEFAULT NULL,
  `trans_code` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`id_materi`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for media
-- ----------------------------
DROP TABLE IF EXISTS `media`;
CREATE TABLE `media`  (
  `id_media` int(11) NOT NULL AUTO_INCREMENT,
  `img` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `tag` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `title` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`id_media`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for media_files
-- ----------------------------
DROP TABLE IF EXISTS `media_files`;
CREATE TABLE `media_files`  (
  `id_media_files` int(11) NOT NULL AUTO_INCREMENT,
  `file_name` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `extension` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `url` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`id_media_files`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for modul
-- ----------------------------
DROP TABLE IF EXISTS `modul`;
CREATE TABLE `modul`  (
  `id_modul` int(11) NOT NULL AUTO_INCREMENT,
  `modul` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `url` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `icon` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`id_modul`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of modul
-- ----------------------------
INSERT INTO `modul` VALUES (2, 'Administrasi', '-', 'icon-magazine');
INSERT INTO `modul` VALUES (3, 'Keuangan', '-', 'icon-coin-dollar');
INSERT INTO `modul` VALUES (4, 'Bimbingan Konseling', '-', 'icon-notebook');
INSERT INTO `modul` VALUES (5, 'Data Alumni', '-', 'icon-notebook');
INSERT INTO `modul` VALUES (6, 'Penilaian Kinerja Guru', '-', 'icon-paste4');
INSERT INTO `modul` VALUES (7, 'Presensi Guru', '-', 'icon-paste4');
INSERT INTO `modul` VALUES (8, 'Data Pegawai', '-', 'icon-paste4');
INSERT INTO `modul` VALUES (9, 'Data Pelajaran', '-', 'icon-book');
INSERT INTO `modul` VALUES (10, 'Jadwal Pelajaran', '-', 'icon-book');
INSERT INTO `modul` VALUES (11, 'Pengaturan Lain', '-', 'icon-book');

-- ----------------------------
-- Table structure for nilai_keterampilan
-- ----------------------------
DROP TABLE IF EXISTS `nilai_keterampilan`;
CREATE TABLE `nilai_keterampilan`  (
  `id_nilai_keterampilan` int(11) NOT NULL AUTO_INCREMENT,
  `idsiswa_fk` int(11) NULL DEFAULT NULL,
  `nilai` int(255) NULL DEFAULT NULL,
  `trans_code` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `idinputnilaiketerampilan_fk` int(11) NULL DEFAULT NULL,
  `create_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `idkd_fk` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_nilai_keterampilan`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for nilai_pas
-- ----------------------------
DROP TABLE IF EXISTS `nilai_pas`;
CREATE TABLE `nilai_pas`  (
  `id_nilai_pas` int(11) NOT NULL AUTO_INCREMENT,
  `idsiswa_fk` int(11) NULL DEFAULT NULL,
  `nilai` int(255) NULL DEFAULT NULL,
  `trans_code` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `idinputnilaipas_fk` int(11) NULL DEFAULT NULL,
  `create_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_nilai_pas`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for nilai_pengetahuan
-- ----------------------------
DROP TABLE IF EXISTS `nilai_pengetahuan`;
CREATE TABLE `nilai_pengetahuan`  (
  `id_nilai_pengetahuan` int(11) NOT NULL AUTO_INCREMENT,
  `idsiswa_fk` int(11) NULL DEFAULT NULL,
  `nilai` int(255) NULL DEFAULT NULL,
  `trans_code` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `idinputnilaipengetahuan_fk` int(11) NULL DEFAULT NULL,
  `create_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `idkd_fk` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_nilai_pengetahuan`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for nilai_pkg
-- ----------------------------
DROP TABLE IF EXISTS `nilai_pkg`;
CREATE TABLE `nilai_pkg`  (
  `id_nilai_pkg` int(11) NOT NULL AUTO_INCREMENT,
  `periode` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `idtahunajaran_fk` int(11) NULL DEFAULT NULL,
  `idguru_fk` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_nilai_pkg`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for nilai_pts
-- ----------------------------
DROP TABLE IF EXISTS `nilai_pts`;
CREATE TABLE `nilai_pts`  (
  `id_nilai_pts` int(11) NOT NULL AUTO_INCREMENT,
  `idsiswa_fk` int(11) NULL DEFAULT NULL,
  `nilai` int(255) NULL DEFAULT NULL,
  `trans_code` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `idinputnilaipts_fk` int(11) NULL DEFAULT NULL,
  `create_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_nilai_pts`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for notulensi_rapat
-- ----------------------------
DROP TABLE IF EXISTS `notulensi_rapat`;
CREATE TABLE `notulensi_rapat`  (
  `id_notulensi_rapat` int(11) NOT NULL AUTO_INCREMENT,
  `acara` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `tanggal` date NULL DEFAULT NULL,
  `pemimpin_rapat` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `isi` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `kesimpulan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`id_notulensi_rapat`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for oas
-- ----------------------------
DROP TABLE IF EXISTS `oas`;
CREATE TABLE `oas`  (
  `id_oas` int(11) NOT NULL AUTO_INCREMENT,
  `tanggal_mulai` date NULL DEFAULT NULL,
  `tanggal_selesai` date NULL DEFAULT NULL,
  `keterangan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `is_active` int(11) NULL DEFAULT NULL,
  `kode` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `idmapel_fk` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_oas`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for oas_kelas
-- ----------------------------
DROP TABLE IF EXISTS `oas_kelas`;
CREATE TABLE `oas_kelas`  (
  `id_oas_kelas` int(11) NOT NULL AUTO_INCREMENT,
  `idkelas_fk` int(11) NULL DEFAULT NULL,
  `idoas_fk` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_oas_kelas`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for oas_soal
-- ----------------------------
DROP TABLE IF EXISTS `oas_soal`;
CREATE TABLE `oas_soal`  (
  `id_oas_soal` int(11) NOT NULL AUTO_INCREMENT,
  `idbanksoal_fk` int(11) NULL DEFAULT NULL,
  `idoas_fk` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_oas_soal`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for organisasi_pegawai
-- ----------------------------
DROP TABLE IF EXISTS `organisasi_pegawai`;
CREATE TABLE `organisasi_pegawai`  (
  `id_organisasi_pegawai` int(11) NOT NULL AUTO_INCREMENT,
  `organisasi` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `jabatan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `tahun` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `idguru_fk` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_organisasi_pegawai`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pelanggaran_siswa
-- ----------------------------
DROP TABLE IF EXISTS `pelanggaran_siswa`;
CREATE TABLE `pelanggaran_siswa`  (
  `id_pelanggaran_siswa` int(11) NOT NULL AUTO_INCREMENT,
  `tanggal` date NULL DEFAULT NULL,
  `uraian_pelanggaran` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `idpoinpelanggaran_fk` int(11) NULL DEFAULT NULL,
  `idsiswa_fk` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_pelanggaran_siswa`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pelanggaran_siswa
-- ----------------------------
INSERT INTO `pelanggaran_siswa` VALUES (1, '2022-07-21', 'tes12', 1, 592);

-- ----------------------------
-- Table structure for pemasukan_lain
-- ----------------------------
DROP TABLE IF EXISTS `pemasukan_lain`;
CREATE TABLE `pemasukan_lain`  (
  `id_pemasukan_lain` int(11) NOT NULL AUTO_INCREMENT,
  `trans_code` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `keterangan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `tanggal` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `total` double(20, 2) NULL DEFAULT NULL,
  `create_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `akun_beban` int(11) NULL DEFAULT NULL,
  `akun_kas` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_pemasukan_lain`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pembayaran_spp
-- ----------------------------
DROP TABLE IF EXISTS `pembayaran_spp`;
CREATE TABLE `pembayaran_spp`  (
  `id_pembayaran_spp` int(11) NOT NULL AUTO_INCREMENT,
  `idsiswa_fk` int(11) NULL DEFAULT NULL,
  `bulan` int(255) NULL DEFAULT NULL,
  `tahun` int(255) NULL DEFAULT NULL,
  `jumlah_bayar` double(20, 0) NULL DEFAULT NULL,
  `tanggal` date NULL DEFAULT NULL,
  `create_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `order_id` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  PRIMARY KEY (`id_pembayaran_spp`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pendaftaran
-- ----------------------------
DROP TABLE IF EXISTS `pendaftaran`;
CREATE TABLE `pendaftaran`  (
  `id_pendaftaran` int(11) NOT NULL AUTO_INCREMENT,
  `nama_lengkap` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `nisn` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `jenis_kelamin` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nik` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `kk` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `tempat_lahir` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `tanggal_lahir` date NULL DEFAULT NULL,
  `akta` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `agama` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `kewarganegaraan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `disabilitas` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `jenis_disabilitas` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `alamat` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `rt` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `rw` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `dusun` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `kelurahan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `kecamatan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `kode_pos` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `lintang` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `bujur` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `tempat_tinggal` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `moda_transportasi` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `anak_ke` int(255) NULL DEFAULT NULL,
  `punya_kip` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `tetap_kip` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `menolak_pip` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `nama_ayah` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `nik_ayah` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `tahun_lahir_ayah` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `pendidikan_ayah` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `pekerjaan_ayah` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `penghasilan_ayah` double(20, 0) NULL DEFAULT NULL,
  `berkebutuhan_khusus_ayah` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `nama_ibu` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `nik_ibu` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `tahun_lahir_ibu` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `pendidikan_ibu` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `pekerjaan_ibu` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `penghasilan_ibu` double(20, 0) NULL DEFAULT NULL,
  `berkebutuhan_khusus_ibu` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `nama_wali` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `nik_wali` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `tahun_lahir_wali` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `pendidikan_wali` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `pekerjaan_wali` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `penghasilan_wali` double(20, 0) NULL DEFAULT NULL,
  `berkebutuhan_khusus_wali` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `nomor_telp_rumah` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `no_hp` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `email` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `tinggi_badan` int(255) NULL DEFAULT NULL,
  `berat_badan` int(255) NULL DEFAULT NULL,
  `lingkar_kepala` int(255) NULL DEFAULT NULL,
  `jarak_ke_sekolah` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `angka_jarak` int(255) NULL DEFAULT NULL,
  `waktu_tempuh` int(255) NULL DEFAULT NULL,
  `jenis_kesejahteraan` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `no_kartu` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nama_kartu` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kompetensi_keahlian` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `jenis_pendaftaran` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nis` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tanggal_masuk_sekolah` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `sekolah_asal` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `no_peserta_un` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `no_seri_ijazah` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `no_skhu` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `usulan_layak_pip` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `punya_pkh` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `alasan_layak_pip` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `no_hp_ayah` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `no_hp_ibu` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `jenis_sekolah` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `kecamatan_sekolah` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `kabupaten_sekolah` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`id_pendaftaran`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pendidikan_pegawai
-- ----------------------------
DROP TABLE IF EXISTS `pendidikan_pegawai`;
CREATE TABLE `pendidikan_pegawai`  (
  `id_pendidikan_pegawai` int(11) NOT NULL AUTO_INCREMENT,
  `idguru_fk` int(11) NULL DEFAULT NULL,
  `jenis` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `berijazah` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `tahun` int(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id_pendidikan_pegawai`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for penerimaan
-- ----------------------------
DROP TABLE IF EXISTS `penerimaan`;
CREATE TABLE `penerimaan`  (
  `id_penerimaan` int(11) NOT NULL AUTO_INCREMENT,
  `idsiswa_fk` int(11) NULL DEFAULT NULL,
  `idjenispenerimaan_fk` int(11) NULL DEFAULT NULL,
  `metode_pembayaran` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `tanggal` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `catatan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `jumlah` double NULL DEFAULT NULL,
  `create_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `invoice` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `diskon` double NULL DEFAULT NULL,
  PRIMARY KEY (`id_penerimaan`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of penerimaan
-- ----------------------------
INSERT INTO `penerimaan` VALUES (1, 592, 1, 'Tunai', '2022-07-24', '', 100000, '2022-07-24 14:53:20', 'INV/SPP/24072022/31127', 0);
INSERT INTO `penerimaan` VALUES (2, 592, 4, 'Tunai', '2022-07-25', '', 50000, '2022-07-25 14:22:09', 'INV/STD/25072022/3667195', 0);
INSERT INTO `penerimaan` VALUES (3, 594, 5, 'Tunai', '2022-07-27', '', 150000, '2022-07-27 07:54:00', 'SMKPEMDA/PRAKERIN/27072022/477592', 0);
INSERT INTO `penerimaan` VALUES (4, 592, 6, 'Tunai', '2022-08-03', '', 50000, '2022-08-03 20:50:26', 'INV/DNS/03082022/2088326', 0);
INSERT INTO `penerimaan` VALUES (5, 647, 1, 'TUNAI', '2022-08-22', 'pembayaran tanggungan', 200000, '2022-08-22 18:13:47', 'P5231289', 0);
INSERT INTO `penerimaan` VALUES (6, 647, 3, 'TUNAI', '2022-08-22', 'pembayaran tanggungan', 50000, '2022-08-22 18:13:47', 'P5231289', 0);

-- ----------------------------
-- Table structure for penerimaan_alumni
-- ----------------------------
DROP TABLE IF EXISTS `penerimaan_alumni`;
CREATE TABLE `penerimaan_alumni`  (
  `id_penerimaan_alumni` int(11) NOT NULL AUTO_INCREMENT,
  `idalumni_fk` int(11) NULL DEFAULT NULL,
  `idtanggunganalumni_fk` int(11) NULL DEFAULT NULL,
  `metode_pembayaran` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `tanggal` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `catatan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `jumlah` double NULL DEFAULT NULL,
  `create_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `invoice` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `diskon` double NULL DEFAULT NULL,
  PRIMARY KEY (`id_penerimaan_alumni`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of penerimaan_alumni
-- ----------------------------
INSERT INTO `penerimaan_alumni` VALUES (3, 14, 3, 'TUNAI', '2022-08-23', 'dasj', 15000, '2022-08-23 12:18:33', 'P1741155', 0);
INSERT INTO `penerimaan_alumni` VALUES (4, 14, 6, 'TUNAI', '2022-08-23', 'dasj', 150000, '2022-08-23 12:18:33', 'P1741155', 0);

-- ----------------------------
-- Table structure for pengeluaran_lain
-- ----------------------------
DROP TABLE IF EXISTS `pengeluaran_lain`;
CREATE TABLE `pengeluaran_lain`  (
  `id_pengeluaran_lain` int(11) NOT NULL AUTO_INCREMENT,
  `trans_code` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `keterangan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `tanggal` date NULL DEFAULT NULL,
  `create_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `jenis` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `total` double NULL DEFAULT NULL,
  `jenis_kas` int(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id_pengeluaran_lain`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pengumuman
-- ----------------------------
DROP TABLE IF EXISTS `pengumuman`;
CREATE TABLE `pengumuman`  (
  `id_pengumuman` int(11) NOT NULL AUTO_INCREMENT,
  `pengumuman` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `tgl_mulai` date NULL DEFAULT NULL,
  `tgl_selesai` date NULL DEFAULT NULL,
  `display_view` int(1) NULL DEFAULT NULL,
  `dashboard_view` int(1) NULL DEFAULT NULL,
  `mobile_view` int(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id_pengumuman`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for penilaian_kinerja_guru
-- ----------------------------
DROP TABLE IF EXISTS `penilaian_kinerja_guru`;
CREATE TABLE `penilaian_kinerja_guru`  (
  `id_penilaian_kinerja_guru` int(11) NOT NULL AUTO_INCREMENT,
  `idguru_fk` int(11) NULL DEFAULT NULL,
  `bulan` int(11) NULL DEFAULT NULL,
  `tahun` int(255) NULL DEFAULT NULL,
  `idtahunajaran_fk` int(11) NULL DEFAULT NULL,
  `create_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `trans_code` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`id_penilaian_kinerja_guru`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for persentase_guru
-- ----------------------------
DROP TABLE IF EXISTS `persentase_guru`;
CREATE TABLE `persentase_guru`  (
  `id_persentase_guru` int(11) NOT NULL AUTO_INCREMENT,
  `idguru_fk` int(11) NULL DEFAULT NULL,
  `persentase` int(11) NULL DEFAULT NULL,
  `create_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `idtahunajaran_fk` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_persentase_guru`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pindah_kelas
-- ----------------------------
DROP TABLE IF EXISTS `pindah_kelas`;
CREATE TABLE `pindah_kelas`  (
  `id_pindah_kelas` int(11) NOT NULL AUTO_INCREMENT,
  `idkelas_before` int(11) NULL DEFAULT NULL,
  `idkelas_after` int(11) NULL DEFAULT NULL,
  `create_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `idsiswa_fk` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_pindah_kelas`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pindah_kelas
-- ----------------------------
INSERT INTO `pindah_kelas` VALUES (1, 40, 39, '2022-07-27 20:22:17', 593);
INSERT INTO `pindah_kelas` VALUES (2, 39, 40, '2022-07-27 20:22:33', 593);

-- ----------------------------
-- Table structure for poin_pelanggaran
-- ----------------------------
DROP TABLE IF EXISTS `poin_pelanggaran`;
CREATE TABLE `poin_pelanggaran`  (
  `id_poin_pelanggaran` int(11) NOT NULL AUTO_INCREMENT,
  `idjenispelanggaran_fk` int(11) NULL DEFAULT NULL,
  `nama_pelanggaran` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `poin` int(20) NULL DEFAULT NULL,
  `kode_pelanggaran` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `kategori_pelanggaran` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  PRIMARY KEY (`id_poin_pelanggaran`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of poin_pelanggaran
-- ----------------------------
INSERT INTO `poin_pelanggaran` VALUES (1, 1, 'Tidak mengikuti upacara hari besar nasional', 5, 'A2', 'RINGAN');
INSERT INTO `poin_pelanggaran` VALUES (2, 2, 'Tidak mengikuti upacara peringatan hari besar keagamaan sesuai ketentuan', 5, 'A1', 'RINGAN');
INSERT INTO `poin_pelanggaran` VALUES (6, 2, 'Tidak mengikuti upacara Bendera', 5, 'A3', 'RINGAN');
INSERT INTO `poin_pelanggaran` VALUES (7, 2, 'Tidak mengikuti pengajian dan pesantren Ramadhan', 5, 'A4', 'RINGAN');
INSERT INTO `poin_pelanggaran` VALUES (8, 2, 'Tidak mengikuti kegiatan jam tambahan', 5, 'A5', 'RINGAN');
INSERT INTO `poin_pelanggaran` VALUES (9, 2, 'Tidak mengikuti kegiatan ekstrakurikuler', 5, 'A6', 'RINGAN');
INSERT INTO `poin_pelanggaran` VALUES (10, 1, 'Tidak mengenakan seragam sekolah', 5, 'A6', 'RINGAN');
INSERT INTO `poin_pelanggaran` VALUES (11, 2, 'Tidak melaksanakan tugas piket kebersihan', 5, 'A7', 'RINGAN');
INSERT INTO `poin_pelanggaran` VALUES (12, 2, 'Tidak masuk sekolah dengan membuat surat keterangan palsu', 10, 'B1', 'SEDANG');
INSERT INTO `poin_pelanggaran` VALUES (13, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for ppdb
-- ----------------------------
DROP TABLE IF EXISTS `ppdb`;
CREATE TABLE `ppdb`  (
  `id_ppdb` int(11) NOT NULL AUTO_INCREMENT,
  `nama` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `nisn` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `tanggal_lahir` date NULL DEFAULT NULL,
  `alamat` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `email` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `no_hp` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `tempat_lahir` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `kode_pos` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `tinggi_badan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `berat_badan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `nama_ayah` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `tahun_lahir_ayah` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `no_hp_ayah` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `nama_ibu` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `nik_ibu` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `no_hp_ibu` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `tahun_lahir_ibu` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `jenis_kelamin` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `pendidikan_terakhir_ayah` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `pekerjaan_ayah` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `penghasilan_ayah` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `penghasilan_ibu` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `pekerjaan_ibu` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `pendidikan_terakhir_ibu` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `nik_siswa` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `kode_pendaftaran` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `nik_ayah` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `status` int(255) NULL DEFAULT 0,
  `create_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_ppdb`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for predikat_nilai
-- ----------------------------
DROP TABLE IF EXISTS `predikat_nilai`;
CREATE TABLE `predikat_nilai`  (
  `id_predikat_nilai` int(11) NOT NULL AUTO_INCREMENT,
  `nilai_awal` int(255) NULL DEFAULT NULL,
  `nilai_akhir` int(255) NULL DEFAULT NULL,
  `predikat` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`id_predikat_nilai`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for predikat_pkg
-- ----------------------------
DROP TABLE IF EXISTS `predikat_pkg`;
CREATE TABLE `predikat_pkg`  (
  `id_predikat_pkg` int(11) NOT NULL AUTO_INCREMENT,
  `min` int(255) NULL DEFAULT NULL,
  `max` int(255) NULL DEFAULT NULL,
  `predikat` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `warna` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`id_predikat_pkg`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for presensi_event
-- ----------------------------
DROP TABLE IF EXISTS `presensi_event`;
CREATE TABLE `presensi_event`  (
  `id_presensi_event` int(11) NOT NULL AUTO_INCREMENT,
  `idevent_fk` int(11) NULL DEFAULT NULL,
  `idguru_fk` int(11) NULL DEFAULT NULL,
  `is_hadir` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_presensi_event`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for presensi_guru
-- ----------------------------
DROP TABLE IF EXISTS `presensi_guru`;
CREATE TABLE `presensi_guru`  (
  `id_presensi_guru` int(11) NOT NULL AUTO_INCREMENT,
  `idguru_fk` int(11) NULL DEFAULT NULL,
  `tanggal` date NULL DEFAULT NULL,
  `jam_masuk` time(0) NULL DEFAULT NULL,
  `jam_keluar` time(0) NULL DEFAULT NULL,
  `create_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `idtahunajaran_fk` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_presensi_guru`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of presensi_guru
-- ----------------------------
INSERT INTO `presensi_guru` VALUES (1, 1, '2022-10-31', '00:00:00', '20:29:00', '2022-10-31 20:29:56', 4);
INSERT INTO `presensi_guru` VALUES (2, 2, '2022-10-31', '00:00:00', '20:29:00', '2022-10-31 20:30:04', 4);

-- ----------------------------
-- Table structure for presensi_harian
-- ----------------------------
DROP TABLE IF EXISTS `presensi_harian`;
CREATE TABLE `presensi_harian`  (
  `id_presensi_harian` int(11) NOT NULL AUTO_INCREMENT,
  `idmatapelajaran_fk` int(11) NULL DEFAULT NULL,
  `idsiswa_fk` int(11) NULL DEFAULT NULL,
  `presensi` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `keterangan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `tanggal` date NULL DEFAULT NULL,
  `create_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `idtahunajaran_fk` int(11) NULL DEFAULT NULL,
  `idkelas_fk` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_presensi_harian`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for presensi_rapor
-- ----------------------------
DROP TABLE IF EXISTS `presensi_rapor`;
CREATE TABLE `presensi_rapor`  (
  `id_presensi_rapor` int(11) NOT NULL AUTO_INCREMENT,
  `idtahunajaran_fk` int(11) NULL DEFAULT NULL,
  `idsiswa_fk` int(11) NULL DEFAULT NULL,
  `idkelas_fk` int(11) NULL DEFAULT NULL,
  `ijin` int(255) NULL DEFAULT NULL,
  `alpha` int(255) NULL DEFAULT NULL,
  `sakit` int(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id_presensi_rapor`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for prestasi_siswa
-- ----------------------------
DROP TABLE IF EXISTS `prestasi_siswa`;
CREATE TABLE `prestasi_siswa`  (
  `id_prestasi_siswa` int(11) NOT NULL AUTO_INCREMENT,
  `idsiswa_fk` int(11) NULL DEFAULT NULL,
  `prestasi` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `lomba` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `tahun` int(255) NULL DEFAULT NULL,
  `jenis_perlombaan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `create_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_prestasi_siswa`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of prestasi_siswa
-- ----------------------------
INSERT INTO `prestasi_siswa` VALUES (1, 592, 'Juara2', 'SAkSSI2', 2021, 'Kelompok', '2022-10-22 20:20:56');

-- ----------------------------
-- Table structure for profil_website
-- ----------------------------
DROP TABLE IF EXISTS `profil_website`;
CREATE TABLE `profil_website`  (
  `nama_website` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `alamat` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `no_hp` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `logo` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `icon` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `singkatan` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tagline` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `about_us` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `email` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `pemilik` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `facebook` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `twitter` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `youtube` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `instagram` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `img_about_us` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `wa_text` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `background` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `credit_by` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `breadcrumb_elements` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `nama` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `kota` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `negara` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `lng` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `lat` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of profil_website
-- ----------------------------
INSERT INTO `profil_website` VALUES ('VOHISA', 'Jl. Istana Mekar Wangi Utama No 1P-Q', '085894632505', 'logo-w.png', 'bulb.png', 'undefined', 'Shop with the nature, Please shop with me', '<p>The Balance Small Business makes launching and managing your own business easy. It is home to experts who provide clear, practical advice on entrepreneurship and management. Whether you&rsquo;re just starting up or you want to take your company to the next level, our 20-year-strong library of more than 7,000 pieces of content will answer your questions and turn your business dreams into reality.</p>\n\n<p><a href=\"https://www.thebalancesmb.com/\">The Balance</a>&nbsp;is part of The Balance family of sites, including&nbsp;<a href=\"https://www.thebalance.com/\" rel=\"noopener\" target=\"_blank\">The Balance</a>&nbsp;and&nbsp;<a href=\"https://www.thebalancecareers.com/\" rel=\"noopener\" target=\"_blank\">The Balance Careers</a>, covering personal finance, career, and small business topics. With more than 24 million monthly visitors, The Balance is among the top-10 largest finance properties as measured by comScore, a leading Internet measurement company. Our more than 50 expert writers have extensive qualifications and expertise in their topics, including MBAs, PhDs, CFPs, other advanced degrees and professional certifications.</p>\n\n<p>The Balance family of sites have been honored by multiple awards in the last year, including&nbsp;<a href=\"https://www.tellyawards.com/winners/2017/short-form-social/general-education-discovery\" rel=\"noopener nofollow\" target=\"_blank\">The Telly Awards</a>,&nbsp;<a href=\"https://www.communicatorawards.com/\" rel=\"noopener nofollow\" target=\"_blank\">The Communicator Awards</a>, and&nbsp;<a href=\"https://www.editorandpublisher.com/news/editor-publisher-announces-the-2017-eppy-award-finalists/\" rel=\"noopener nofollow\" target=\"_blank\">Eppy Awards</a>.</p>\n', 'hallo@smkitasy-syadzili.sch.id', 'Abdur Rochim', 'undefined', 'undefined', 'undefined', 'undefined', 'ea4d58dd1254aff316312b7ecbb5c410.jpg', 'Halo Admin, Saya ingin bertanya/membeli/.....', 'd797c14a0070235734508b7d9f409395.jpg', '&copy; 2019. <a href=\"#\">Core Master</a> by<a href=\"https://myber.co.id\" target=\"_blank\">Myber</a>', 'Core Master', 'SMK IT Asy-Syadzili', 'Malang', 'Indonesia', '112.66307147573268', '-7.840640250568774');

-- ----------------------------
-- Table structure for provinces
-- ----------------------------
DROP TABLE IF EXISTS `provinces`;
CREATE TABLE `provinces`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of provinces
-- ----------------------------
INSERT INTO `provinces` VALUES (1, 'Aceh', '2019-10-22 07:49:46', '2019-10-25 21:02:52');
INSERT INTO `provinces` VALUES (2, 'Sumatera Utara', '2019-10-22 07:49:46', '2019-10-22 07:49:46');
INSERT INTO `provinces` VALUES (3, 'Sumatera Barat', '2019-10-22 07:49:47', '2019-10-22 07:49:47');
INSERT INTO `provinces` VALUES (4, 'Riau', '2019-10-22 07:49:48', '2019-10-22 07:49:48');
INSERT INTO `provinces` VALUES (5, 'Jambi', '2019-10-22 07:49:48', '2019-10-22 07:49:48');
INSERT INTO `provinces` VALUES (6, 'Sumatera Selatan', '2019-10-22 07:49:49', '2019-10-22 07:49:49');
INSERT INTO `provinces` VALUES (7, 'Bengkulu', '2019-10-22 07:49:49', '2019-10-22 07:49:49');
INSERT INTO `provinces` VALUES (8, 'Lampung', '2019-10-22 07:49:49', '2019-10-22 07:49:49');
INSERT INTO `provinces` VALUES (9, 'Kepulauan Bangka Belitung', '2019-10-22 07:49:50', '2019-10-22 07:49:50');
INSERT INTO `provinces` VALUES (10, 'Kepulauan Riau', '2019-10-22 07:49:50', '2019-10-22 07:49:50');
INSERT INTO `provinces` VALUES (11, 'Dki Jakarta', '2019-10-22 07:49:50', '2019-10-22 07:49:50');
INSERT INTO `provinces` VALUES (12, 'Jawa Barat', '2019-10-22 07:49:51', '2019-10-22 07:49:51');
INSERT INTO `provinces` VALUES (13, 'Jawa Tengah', '2019-10-22 07:49:51', '2019-10-22 07:49:51');
INSERT INTO `provinces` VALUES (14, 'Di Yogyakarta', '2019-10-22 07:49:52', '2019-10-22 07:49:52');
INSERT INTO `provinces` VALUES (15, 'Jawa Timur', '2019-10-22 07:49:52', '2019-10-22 07:49:52');
INSERT INTO `provinces` VALUES (16, 'Banten', '2019-10-22 07:49:54', '2019-10-22 07:49:54');
INSERT INTO `provinces` VALUES (17, 'Bali', '2019-10-22 07:49:54', '2019-10-22 07:49:54');
INSERT INTO `provinces` VALUES (18, 'Nusa Tenggara Barat', '2019-10-22 07:49:54', '2019-10-22 07:49:54');
INSERT INTO `provinces` VALUES (19, 'Nusa Tenggara Timur', '2019-10-22 07:49:54', '2019-10-22 07:49:54');
INSERT INTO `provinces` VALUES (20, 'Kalimantan Barat', '2019-10-22 07:49:55', '2019-10-22 07:49:55');
INSERT INTO `provinces` VALUES (21, 'Kalimantan Tengah', '2019-10-22 07:49:56', '2019-10-22 07:49:56');
INSERT INTO `provinces` VALUES (22, 'Kalimantan Selatan', '2019-10-22 07:49:56', '2019-10-22 07:49:56');
INSERT INTO `provinces` VALUES (23, 'Kalimantan Timur', '2019-10-22 07:49:57', '2019-10-22 07:49:57');
INSERT INTO `provinces` VALUES (24, 'Kalimantan Utara', '2019-10-22 07:49:57', '2019-10-22 07:49:57');
INSERT INTO `provinces` VALUES (25, 'Sulawesi Utara', '2019-10-22 07:49:57', '2019-10-22 07:49:57');
INSERT INTO `provinces` VALUES (26, 'Sulawesi Tengah', '2019-10-22 07:49:58', '2019-10-22 07:49:58');
INSERT INTO `provinces` VALUES (27, 'Sulawesi Selatan', '2019-10-22 07:49:58', '2019-10-22 07:49:58');
INSERT INTO `provinces` VALUES (28, 'Sulawesi Tenggara', '2019-10-22 07:49:59', '2019-10-22 07:49:59');
INSERT INTO `provinces` VALUES (29, 'Gorontalo', '2019-10-22 07:49:59', '2019-10-22 07:49:59');
INSERT INTO `provinces` VALUES (30, 'Sulawesi Barat', '2019-10-22 07:49:59', '2019-10-22 07:49:59');
INSERT INTO `provinces` VALUES (31, 'Maluku', '2019-10-22 07:50:00', '2019-10-22 07:50:00');
INSERT INTO `provinces` VALUES (32, 'Maluku Utara', '2019-10-22 07:50:00', '2019-10-22 07:50:00');
INSERT INTO `provinces` VALUES (33, 'Papua Barat', '2019-10-22 07:50:00', '2019-10-22 07:50:00');
INSERT INTO `provinces` VALUES (34, 'Papua', '2019-10-22 07:50:01', '2019-10-22 07:50:01');

-- ----------------------------
-- Table structure for question_cas
-- ----------------------------
DROP TABLE IF EXISTS `question_cas`;
CREATE TABLE `question_cas`  (
  `id_question_cas` int(11) NOT NULL AUTO_INCREMENT,
  `type` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `idbanksoal_fk` int(11) NULL DEFAULT NULL,
  `idquiz_fk` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_question_cas`) USING BTREE,
  INDEX `idbanksoal_fk`(`idbanksoal_fk`) USING BTREE,
  INDEX `idassesmentcas_fk`(`idquiz_fk`) USING BTREE,
  CONSTRAINT `question_cas_ibfk_1` FOREIGN KEY (`idbanksoal_fk`) REFERENCES `bank_soal` (`id_bank_soal`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `question_cas_ibfk_2` FOREIGN KEY (`idquiz_fk`) REFERENCES `quiz` (`id_quiz`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for quiz
-- ----------------------------
DROP TABLE IF EXISTS `quiz`;
CREATE TABLE `quiz`  (
  `id_quiz` int(11) NOT NULL AUTO_INCREMENT,
  `quiz_name` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `quiz_type` int(11) NULL DEFAULT NULL COMMENT '0 = Multiple choixe\r\n1 = single choice\r\n2 = Survey',
  `password` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `idmatapelajaran_fk` int(11) NULL DEFAULT NULL,
  `iduser_fk` int(11) NULL DEFAULT NULL,
  `open_access` int(255) NULL DEFAULT NULL COMMENT '0 = Private Access\r\n1 = Open Access(student only)\r\n2 = All Access(public can read)',
  PRIMARY KEY (`id_quiz`) USING BTREE,
  INDEX `idmatapelajaran_fk`(`idmatapelajaran_fk`) USING BTREE,
  CONSTRAINT `quiz_ibfk_1` FOREIGN KEY (`idmatapelajaran_fk`) REFERENCES `mata_pelajaran` (`id_mata_pelajaran`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for riwayat_kerja_pns_pegawai
-- ----------------------------
DROP TABLE IF EXISTS `riwayat_kerja_pns_pegawai`;
CREATE TABLE `riwayat_kerja_pns_pegawai`  (
  `id_riwayat_kerja_pns_pegawai` int(11) NOT NULL AUTO_INCREMENT,
  `idguru_fk` int(11) NULL DEFAULT NULL,
  `pangkat` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `jabatan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `gaji` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `terhitung_mulai` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `keterangan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`id_riwayat_kerja_pns_pegawai`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for riwayat_kerja_swasta_pegawai
-- ----------------------------
DROP TABLE IF EXISTS `riwayat_kerja_swasta_pegawai`;
CREATE TABLE `riwayat_kerja_swasta_pegawai`  (
  `id_riwayat_kerja_swasta_pegawai` int(11) NOT NULL AUTO_INCREMENT,
  `idguru_fk` int(11) NULL DEFAULT NULL,
  `jenis` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `tahun` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `keterangan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`id_riwayat_kerja_swasta_pegawai`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for rpp
-- ----------------------------
DROP TABLE IF EXISTS `rpp`;
CREATE TABLE `rpp`  (
  `id_rpp` int(11) NOT NULL AUTO_INCREMENT,
  `idguru_fk` int(11) NULL DEFAULT NULL,
  `idtahunajaran_fk` int(11) NULL DEFAULT NULL,
  `idkelas_fk` int(11) NULL DEFAULT NULL,
  `idmateri_fk` int(11) NULL DEFAULT NULL,
  `alokasi_waktu` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `file` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `idmatapelajaran_fk` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_rpp`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ruangan
-- ----------------------------
DROP TABLE IF EXISTS `ruangan`;
CREATE TABLE `ruangan`  (
  `id_ruangan` int(11) NOT NULL AUTO_INCREMENT,
  `ruangan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`id_ruangan`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for semester
-- ----------------------------
DROP TABLE IF EXISTS `semester`;
CREATE TABLE `semester`  (
  `id_semester` int(11) NOT NULL AUTO_INCREMENT,
  `semester` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `create_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_semester`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of semester
-- ----------------------------
INSERT INTO `semester` VALUES (1, 'Genap', '2020-06-07 10:07:53');
INSERT INTO `semester` VALUES (2, 'Ganjil', '2020-06-07 10:08:00');

-- ----------------------------
-- Table structure for setting_akun
-- ----------------------------
DROP TABLE IF EXISTS `setting_akun`;
CREATE TABLE `setting_akun`  (
  `id_setting_akun` int(11) NOT NULL AUTO_INCREMENT,
  `kode` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `nama` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `debit` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `kredit` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`id_setting_akun`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for setting_table
-- ----------------------------
DROP TABLE IF EXISTS `setting_table`;
CREATE TABLE `setting_table`  (
  `id_setting_table` int(11) NOT NULL AUTO_INCREMENT,
  `table` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `name` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `value` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `keterangan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`id_setting_table`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of setting_table
-- ----------------------------
INSERT INTO `setting_table` VALUES (1, 'buku_tamu', 'template_excel', 'include/template/excel/format_cetak_buku_tamu', 'Template Buku Tamu');
INSERT INTO `setting_table` VALUES (2, 'prestasi_siswa', 'template_excel', 'include/template/excel/format_cetak_prestasi_siswa', 'Template Prestasi Siswa');

-- ----------------------------
-- Table structure for setting_website
-- ----------------------------
DROP TABLE IF EXISTS `setting_website`;
CREATE TABLE `setting_website`  (
  `SPP` double(20, 0) NULL DEFAULT NULL,
  `DSP` double(20, 0) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of setting_website
-- ----------------------------
INSERT INTO `setting_website` VALUES (0, NULL);

-- ----------------------------
-- Table structure for silabus
-- ----------------------------
DROP TABLE IF EXISTS `silabus`;
CREATE TABLE `silabus`  (
  `id_silabus` int(11) NOT NULL AUTO_INCREMENT,
  `idguru_fk` int(11) NULL DEFAULT NULL,
  `idtahunajaran_fk` int(11) NULL DEFAULT NULL,
  `idtingkat_fk` int(11) NULL DEFAULT NULL,
  `idjurusan_fk` int(11) NULL DEFAULT NULL,
  `idmatapelajaran_fk` int(11) NULL DEFAULT NULL,
  `file` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`id_silabus`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for siswa
-- ----------------------------
DROP TABLE IF EXISTS `siswa`;
CREATE TABLE `siswa`  (
  `id_siswa` int(11) NOT NULL AUTO_INCREMENT,
  `nis` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `nama` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `idkelas_fk` int(11) NULL DEFAULT NULL,
  `idjurusan_fk` int(11) NULL DEFAULT NULL,
  `agama` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `nisn` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `no_ijazah_sekolah_asal` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `no_skhun_sekolah_asal` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `no_un_sekolah_asal` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `no_kk` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `npsn_sekolah_asal` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `nama_sekolah_asal` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `tempat_lahir` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `tanggal_lahir` date NULL DEFAULT NULL,
  `berkebutuhan_khusus` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `alamat` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `dusun` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `rt` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `rw` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `kelurahan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `foto` text CHARACTER SET hp8 COLLATE hp8_english_ci NULL,
  `idprovince_fk` int(11) NULL DEFAULT NULL,
  `idcities_fk` int(11) NULL DEFAULT NULL,
  `nama_ayah` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `tempat_lahir_ayah` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `tanggal_lahir_ayah` date NULL DEFAULT NULL,
  `pendidikan_ayah` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `pekerjaan_ayah` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `penghasilan_ayah` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `nama_ibu` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `tempat_lahir_ibu` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `tanggal_lahir_ibu` date NULL DEFAULT NULL,
  `pendidikan_ibu` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `pekerjaan_ibu` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `penghasilan_ibu` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `tinggi_badan` int(11) NULL DEFAULT NULL,
  `berat_badan` int(11) NULL DEFAULT NULL,
  `jarak_ke_sekolah` int(255) NULL DEFAULT NULL,
  `waktu_ke_sekolah` int(255) NULL DEFAULT NULL,
  `jumlah_saudara` int(255) NULL DEFAULT NULL,
  `jenis_kelamin` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `saldo` double NULL DEFAULT NULL,
  `is_alumni` int(255) NULL DEFAULT 0,
  `iddepartment_fk` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_siswa`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 745 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of siswa
-- ----------------------------
INSERT INTO `siswa` VALUES (592, '', 'Santi Dwi Samsiyah', 40, 6, NULL, '0036577658', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'P', NULL, NULL, 1);
INSERT INTO `siswa` VALUES (593, '', 'Sinta Dwi Samsiyah', 40, 6, NULL, '0036577659', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'P', NULL, NULL, 1);
INSERT INTO `siswa` VALUES (594, '', 'ALBET DIMAS NURFENDI PRATAMA', 0, 0, NULL, '0036078764', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1);
INSERT INTO `siswa` VALUES (595, '', 'ARIEF WAHYUDI', 0, 0, NULL, '0028843265', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1);
INSERT INTO `siswa` VALUES (596, '', 'ETIK MULYANI', 0, 0, NULL, '0024950260', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1);
INSERT INTO `siswa` VALUES (597, '', 'FARA AGUN YUNANTO', 0, 0, NULL, '0028095705', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1);
INSERT INTO `siswa` VALUES (598, '', 'LINDA AIDA', 0, 0, NULL, '0036417497', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1);
INSERT INTO `siswa` VALUES (599, '', 'SAHID', 0, 0, NULL, '0034071069', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1);
INSERT INTO `siswa` VALUES (600, '', 'SITI KOMAIROH', 0, 0, NULL, '0042154375', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1);
INSERT INTO `siswa` VALUES (601, '', 'YOSEPTY NURUL FERRISA', 0, 0, NULL, '0042138354', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1);
INSERT INTO `siswa` VALUES (612, '', 'A\'AN SANCOKO', 42, 7, NULL, '0066968534', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `siswa` VALUES (613, '', 'AHMAD YUSQI DWI KURNIAWAN', 42, 7, NULL, '0054217432', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `siswa` VALUES (614, '', 'ANESHA RAFAEL BENAYA', 42, 7, NULL, '0052973416', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `siswa` VALUES (615, '', 'ARGO RIO PUTRA KATERNANDO', 42, 7, NULL, '0045692779', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `siswa` VALUES (616, '', 'ARIL ARDIANSYAH', 42, 7, NULL, '3051940401', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `siswa` VALUES (617, '', 'BAHAR WIJAYA', 42, 7, NULL, '0055101946', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `siswa` VALUES (618, '', 'BRAYEND DIAN DINATHA', 42, 7, NULL, '0054540454', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `siswa` VALUES (619, '', 'CELVIN WIDIANTO', 42, 7, NULL, '0055181315', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `siswa` VALUES (620, '', 'DIMAS MOCHAMMAD FADILLAH', 42, 7, NULL, '0063521754', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `siswa` VALUES (621, '', 'DIO TRATANA', 42, 7, NULL, '0068183586', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `siswa` VALUES (622, '', 'DWIJAYA KUSUMA HADI', 42, 7, NULL, '0055041321', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `siswa` VALUES (623, '', 'ERIA TRI ADHARI', 42, 7, NULL, '3061879088', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `siswa` VALUES (624, '', 'GIAN AUFA SULTAN ALI', 42, 7, NULL, '0057536561', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `siswa` VALUES (625, '', 'IRVAN ALDI SETIAWAN', 42, 7, NULL, '0063263525', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `siswa` VALUES (626, '', 'MUHAMMAD ADITYA OKTAFIAN RAMADANSYAH', 42, 7, NULL, '0067924106', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `siswa` VALUES (627, '', 'MUHAMMAD ADYBU SHOLEH', 42, 7, NULL, '0068038937', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `siswa` VALUES (628, '', 'MUHAMMAD HUPRON JAINUL NGALIM', 42, 7, NULL, '0063808903', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `siswa` VALUES (629, '', 'RAMDANI FIRMANSYAH', 42, 7, NULL, '0036417934', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `siswa` VALUES (630, '', 'RIZKI DWI SAPUTRA', 42, 7, NULL, '0052457943', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `siswa` VALUES (631, '', 'TEGAR ALIF SANTOSO', 42, 7, NULL, '0055506756', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `siswa` VALUES (632, '', 'WAHYU KARLIN PRADANA', 42, 7, NULL, '0062523997', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `siswa` VALUES (633, '', 'YOGA BAGUS PRATAMA', 42, 7, NULL, '0054094806', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `siswa` VALUES (634, '', 'YOGA TRIYO SUBANGKIT', 42, 7, NULL, '0059619725', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `siswa` VALUES (635, '', 'ADHI PRASETYA', 43, 7, NULL, '0045514903', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `siswa` VALUES (636, '', 'AFVET DERI MARSELLINO', 43, 7, NULL, '0052036510', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `siswa` VALUES (637, '', 'HABIB MUHAMMAD TOHIR', 43, 7, NULL, '0036417493', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `siswa` VALUES (638, '', 'M. ZAIM ARROSYD', 43, 7, NULL, '0045607750', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `siswa` VALUES (639, '', 'MUHAMMAD ABDUL ROIS', 43, 7, NULL, '0036357337', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `siswa` VALUES (640, '', 'PERIYA ADITYA', 43, 7, NULL, '0052062381', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `siswa` VALUES (641, '', 'RICCO ARGA SAPUTRA', 43, 7, NULL, '0054813846', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `siswa` VALUES (642, '', 'RIDHA SETIAWAN', 43, 7, NULL, '0041243854', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `siswa` VALUES (643, '', 'ROI SAPUJO', 43, 7, NULL, '0046687940', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `siswa` VALUES (644, '', 'SAHRUL AJI SAPUTRA', 43, 7, NULL, '0053551497', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `siswa` VALUES (645, '', 'TEGUH GUNAWAN', 43, 7, NULL, '0048385231', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `siswa` VALUES (646, '', 'AHMAD ARHAM ARDIYA PUTRA', 0, 0, NULL, '3025057810', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1);
INSERT INTO `siswa` VALUES (647, '', 'AHMAD ZAINURI MAKRUF', 0, 0, NULL, '0036416117', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1);
INSERT INTO `siswa` VALUES (648, '', 'ALDY PANDUWINATA', 44, 7, NULL, '0036510509', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `siswa` VALUES (649, '', 'ALIF BUKHORI', 44, 7, NULL, '0036510650', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `siswa` VALUES (650, '', 'ARI MUSTOFA', 44, 7, NULL, '0031812533', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `siswa` VALUES (651, '', 'DIDIK HARDIANTO', 44, 7, NULL, '0024939917', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `siswa` VALUES (652, '', 'FRENDI EKO CAHYONO', 44, 7, NULL, '0036931241', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `siswa` VALUES (653, '', 'HELMI BAYU SAPUTRO', 44, 7, NULL, '0016195706', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `siswa` VALUES (654, '', 'KARTIKO BAYU PRASETYO', 44, 7, NULL, '0028816987', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `siswa` VALUES (655, '', 'KERISNA ARDIANTO', 44, 7, NULL, '0036391797', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `siswa` VALUES (656, '', 'KOIRUL UBAIDILAH FATHUROKHIM', 44, 7, NULL, '0036578709', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `siswa` VALUES (657, '', 'KRISNA EKA SAPUTRA', 44, 7, NULL, '0022991634', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `siswa` VALUES (658, '', 'LUKY WAHYU SAPUTRA', 44, 7, NULL, '0036416203', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `siswa` VALUES (659, '', 'MOH ZEIN ARDIANSYAH', 44, 7, NULL, '0042946662', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `siswa` VALUES (660, '', 'MOH. ARIS SETIAWAN', 44, 7, NULL, '0021503467', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `siswa` VALUES (661, '', 'MUHAMMAD BANA ALI MA\'RUF FAUZI', 44, 7, NULL, '0003403086', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `siswa` VALUES (662, '', 'NUR KHOIRUL ANAM', 44, 7, NULL, '0033519270', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `siswa` VALUES (663, '', 'RENDI ANDIKA DWI SAPUTRA', 44, 7, NULL, '0036510043', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `siswa` VALUES (664, '', 'RICO DIDIK MAHENDRA', 44, 7, NULL, '0036078186', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `siswa` VALUES (665, '', 'RIO ARDIANTO', 44, 7, NULL, '0036416199', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `siswa` VALUES (666, '', 'ROKY SEPTIAN WIRANTO', 44, 7, NULL, '0016553260', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `siswa` VALUES (667, '', 'RUDI KRISBIYANTO', 44, 7, NULL, '0036079877', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `siswa` VALUES (668, '', 'RUDY FAJAR NUGROHO', 44, 7, NULL, '0036510016', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `siswa` VALUES (669, '', 'SONY SETIAWAN', 44, 7, NULL, '0036578710', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `siswa` VALUES (670, '', 'ADE NOVIYANTI', 45, 9, NULL, '0043300533', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `siswa` VALUES (671, '', 'AHMAD SYAFARONI', 45, 9, NULL, '0048694496', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `siswa` VALUES (672, '', 'GALING DWI MUSTOMO', 45, 9, NULL, '0052133958', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `siswa` VALUES (673, '', 'MUHAKIM AJI PAMBUDI', 45, 9, NULL, '0055437693', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `siswa` VALUES (674, '', 'OKTAVIA RAMADHANI NURJANAH', 45, 9, NULL, '0056760890', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `siswa` VALUES (675, '', 'RANJANA SEPTIAN RAHMAN', 45, 9, NULL, '0043828673', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `siswa` VALUES (676, '', 'GALING DWI MUSTOMO', 45, 9, NULL, '0052133958', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `siswa` VALUES (677, '', 'AHMAD ILHAM MAHMUDI', 46, 9, NULL, '0044735094', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `siswa` VALUES (678, '', 'ATIM NUR SALIM', 46, 9, NULL, '0054733834', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `siswa` VALUES (679, '', 'DEFANDA FICAN ABI MAULANA', 46, 9, NULL, '0045787196', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `siswa` VALUES (680, '', 'FATDILLAH RENATA', 46, 9, NULL, '0036090146', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `siswa` VALUES (681, '', 'HAWA KHARISMA ZAHARA', 46, 9, NULL, '0041745870', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `siswa` VALUES (682, '', 'IRFAN FAUZI', 46, 9, NULL, '0045691993', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `siswa` VALUES (683, '', 'JAIS MUKTI WICAKSONO', 46, 9, NULL, '3045666600', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `siswa` VALUES (684, '', 'LESTARI', 46, 9, NULL, '0045015401', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `siswa` VALUES (685, '', 'MUH AZIS MA\'RUF', 46, 9, NULL, '0033519834', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `siswa` VALUES (686, '', 'NURDIN ISKANDAR', 46, 9, NULL, '0049871561', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `siswa` VALUES (687, '', 'AFITRISYA ANDIKA RIMBA YUDA PRATAMA', 47, 9, NULL, '0024950140', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `siswa` VALUES (688, '', 'AISYATUL LORA AQRIANI', 47, 9, NULL, '0035560234', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `siswa` VALUES (689, '', 'ANDRE GUNAWAN', 47, 9, NULL, '0036510504', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `siswa` VALUES (690, '', 'BUDI HARTONO', 47, 9, NULL, '0015497084', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `siswa` VALUES (691, '', 'CINTANIYA AYUNDA DEVANIO', 47, 9, NULL, '3047064247', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `siswa` VALUES (692, '', 'DIMAS HARDIANSYAH', 47, 9, NULL, '0037304683', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `siswa` VALUES (693, '', 'DONI KUSUMA', 47, 9, NULL, '0036510513', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `siswa` VALUES (694, '', 'MEI NUR AINI', 47, 9, NULL, '0042151572', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `siswa` VALUES (695, '', 'NOFIAN WIDI NUGROHO', 47, 9, NULL, '0036510659', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `siswa` VALUES (696, '', 'NURUL AMANDA LESTARI', 47, 9, NULL, '0042351207', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `siswa` VALUES (697, '', 'STYVEN DWI PUTRA WARDOYO', 47, 9, NULL, '0036078818', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `siswa` VALUES (698, '', 'WAHYU ROHHANA', 47, 9, NULL, '0036034851', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `siswa` VALUES (699, '', 'WIDIA DESMA FITRIANA', 47, 9, NULL, '0010200604', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `siswa` VALUES (700, '', 'YANUAR ARI EVENDY', 47, 9, NULL, '0028955639', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `siswa` VALUES (701, '', 'YUDHA ANGGA PRAMUDITYA', 47, 9, NULL, '0036417824', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `siswa` VALUES (702, '', 'ABDUL AZIZ ANDI ATMAJA', 48, 10, NULL, '0053721785', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `siswa` VALUES (703, '', 'ABDUL FAQIH', 48, 10, NULL, '0051774423', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `siswa` VALUES (704, '', 'ADEL MUNA AL MASYKUR', 48, 10, NULL, '0066124715', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `siswa` VALUES (705, '', 'AGUNG CAHYA ILHAM ANUGRAH HERLAMBANG BUANAJATI', 48, 10, NULL, '0038539350', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `siswa` VALUES (706, '', 'AGUNG PRAYOGO', 48, 10, NULL, '0062198051', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `siswa` VALUES (707, '', 'ALIF KRISTIANTORO', 48, 10, NULL, '3048876049', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `siswa` VALUES (708, '', 'ANANDA YOGI KIAN SAPUTRA', 48, 10, NULL, '0067571639', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `siswa` VALUES (709, '', 'ANGGA PRADANA ROMADHON', 48, 10, NULL, '0052185038', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `siswa` VALUES (710, '', 'BAYU CAHYO SAPUTRA', 48, 10, NULL, '0015893629', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `siswa` VALUES (711, '', 'BAYU SETIAWAN', 48, 10, NULL, '0046989104', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `siswa` VALUES (712, '', 'CANTIKA INDRAWATI', 48, 10, NULL, '0028873783', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `siswa` VALUES (713, '', 'DAFIK NUR CAHYONO', 48, 10, NULL, '0042397751', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `siswa` VALUES (714, '', 'DENDI NURCAHYONO', 48, 10, NULL, '0002787919', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `siswa` VALUES (715, '', 'DENDIK SETIYAWAN', 48, 10, NULL, '0036274317', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `siswa` VALUES (716, '', 'DIFKA AYU TRI WAHYUNI', 48, 10, NULL, '0031156926', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `siswa` VALUES (717, '', 'DREINALDO REFIN SUGANDA', 48, 10, NULL, '0036274314', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `siswa` VALUES (718, '', 'DUWI AGUNG PURNOMO', 48, 10, NULL, '0045477845', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `siswa` VALUES (719, '', 'HADI WIDADA', 48, 10, NULL, '0024932698', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `siswa` VALUES (720, '', 'HARDIANTO', 48, 10, NULL, '0036275261', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `siswa` VALUES (721, '', 'HARIS DIDIN SAPUTRO', 48, 10, NULL, '0048946165', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `siswa` VALUES (722, '', 'HENGKI GIO DIMAS SAPUTRA', 48, 10, NULL, '0051147118', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `siswa` VALUES (723, '', 'I\'IN KOSIYAH', 48, 10, NULL, '0024932720', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `siswa` VALUES (724, '', 'IMRON ZAINUL HUDA', 48, 10, NULL, '0042397747', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `siswa` VALUES (725, '', 'IRFAN RISQIANTO', 48, 10, NULL, '3023262049', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `siswa` VALUES (726, '', 'JAINAL ARIFIN', 48, 10, NULL, '0022072592', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `siswa` VALUES (727, '', 'KHOIRUL IKHWANI', 48, 10, NULL, '0015893647', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `siswa` VALUES (728, '', 'KLARISA AYU PUTRI KINANTI', 48, 10, NULL, '0059534769', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `siswa` VALUES (729, '', 'MAHFUD AL MUZAYIN', 48, 10, NULL, '0045219913', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `siswa` VALUES (730, '', 'MARWANDI HARDIANTO', 48, 10, NULL, '0066547379', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `siswa` VALUES (731, '', 'MUHAMMAD  MIFTAH IRFA\'I', 48, 10, NULL, '3016734074', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `siswa` VALUES (732, '', 'NIKA ERLINA WATI', 48, 10, NULL, '0045477847', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `siswa` VALUES (733, '', 'NIKO DWI ANDIKA', 48, 10, NULL, '0064983142', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `siswa` VALUES (734, '', 'REGI AHMAD DANI', 48, 10, NULL, '0054308602', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `siswa` VALUES (735, '', 'RIMBA EKA SAPUTRA', 48, 10, NULL, '0036274325', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `siswa` VALUES (736, '', 'RISKY ANDRE PURWANTO', 48, 10, NULL, '3055012454', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `siswa` VALUES (737, '', 'RYAN MIFTAHUL ANNAS', 48, 10, NULL, '0055727345', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `siswa` VALUES (738, '', 'SAMSUL HUDA', 48, 10, NULL, '0042397623', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `siswa` VALUES (739, '', 'TRI WAHYU PRASETYO', 48, 10, NULL, '0001507039', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `siswa` VALUES (740, '', 'TRIONO IMAM SAIPUDIN', 48, 10, NULL, '0031156916', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `siswa` VALUES (741, '', 'WAHID RIDHO ANSORI', 48, 10, NULL, '0041113060', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `siswa` VALUES (742, '', 'WAHYU SUSTIONO', 48, 10, NULL, '0068579169', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `siswa` VALUES (743, '', 'WAHYU TAUFIK ICHWAN', 48, 10, NULL, '0045219929', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `siswa` VALUES (744, '', 'WINDI WULANDARI', 48, 10, NULL, '0062799154', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);

-- ----------------------------
-- Table structure for siswa_beasiswa
-- ----------------------------
DROP TABLE IF EXISTS `siswa_beasiswa`;
CREATE TABLE `siswa_beasiswa`  (
  `id_siswa_beasiswa` int(11) NOT NULL AUTO_INCREMENT,
  `idsiswa_fk` int(11) NULL DEFAULT NULL,
  `jenis` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `penyelenggara` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `tahun_mulai` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `tahun_selesai` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`id_siswa_beasiswa`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for siswa_dokumen
-- ----------------------------
DROP TABLE IF EXISTS `siswa_dokumen`;
CREATE TABLE `siswa_dokumen`  (
  `id_siswa_dokumen` int(11) NOT NULL AUTO_INCREMENT,
  `idsiswa_fk` int(11) NULL DEFAULT NULL,
  `keterangan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `foto` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`id_siswa_dokumen`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for siswa_mapel
-- ----------------------------
DROP TABLE IF EXISTS `siswa_mapel`;
CREATE TABLE `siswa_mapel`  (
  `id_siswa_mapel` int(11) NOT NULL AUTO_INCREMENT,
  `idsiswa_fk` int(11) NULL DEFAULT NULL,
  `idmatapelajaran_fk` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_siswa_mapel`) USING BTREE,
  INDEX `idsiswa_fk`(`idsiswa_fk`) USING BTREE,
  INDEX `idmatapelajaran_fk`(`idmatapelajaran_fk`) USING BTREE,
  CONSTRAINT `siswa_mapel_ibfk_1` FOREIGN KEY (`idsiswa_fk`) REFERENCES `siswa` (`id_siswa`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `siswa_mapel_ibfk_2` FOREIGN KEY (`idmatapelajaran_fk`) REFERENCES `mata_pelajaran` (`id_mata_pelajaran`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for siswa_prestasi
-- ----------------------------
DROP TABLE IF EXISTS `siswa_prestasi`;
CREATE TABLE `siswa_prestasi`  (
  `id_siswa_prestasi` int(11) NOT NULL AUTO_INCREMENT,
  `idsiswa_fk` int(11) NULL DEFAULT NULL,
  `jenis` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `tingkat` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `nama` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `tahun` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `penyelenggara` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`id_siswa_prestasi`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sosialisasi
-- ----------------------------
DROP TABLE IF EXISTS `sosialisasi`;
CREATE TABLE `sosialisasi`  (
  `id_sosialisasi` int(11) NOT NULL AUTO_INCREMENT,
  `tanggal` date NULL DEFAULT NULL,
  `judul` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `keterangan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `berkas` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`id_sosialisasi`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sosialisasi
-- ----------------------------
INSERT INTO `sosialisasi` VALUES (3, '2022-10-23', 'Sosialisasi guru merdeka', 'uji coba sosialisasi guru merdeka yang diadakan di sekolah', '2cf6d1d285fda26618f15829a709bdba.jpg');
INSERT INTO `sosialisasi` VALUES (4, '2022-10-23', 'Sosialisasi Praktek Kerja Industri', 'kegiatan dilaksanakan di sekolah', 'b368005d51ca9118ea7942f83f404e4c.jpg');
INSERT INTO `sosialisasi` VALUES (5, '2022-10-24', 'Sosialisasi gerakan berkoperasi', 'adsad', '57aff1c469ed6b78a4cdfe63453eaeee.jpg');

-- ----------------------------
-- Table structure for student_account
-- ----------------------------
DROP TABLE IF EXISTS `student_account`;
CREATE TABLE `student_account`  (
  `id_student_account` int(11) NOT NULL AUTO_INCREMENT,
  `idsiswa_fk` int(11) NULL DEFAULT NULL,
  `username` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `pass` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `create_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `update_at` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id_student_account`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of student_account
-- ----------------------------
INSERT INTO `student_account` VALUES (1, 285, 'ferdy', '55f3fc2fdb2fea1f635521b79abfe204', '2022-05-31 07:20:14', NULL);

-- ----------------------------
-- Table structure for subkompetensi_pkg
-- ----------------------------
DROP TABLE IF EXISTS `subkompetensi_pkg`;
CREATE TABLE `subkompetensi_pkg`  (
  `id_subkompetensi_pkg` int(11) NOT NULL AUTO_INCREMENT,
  `idkompetensipkg_fk` int(11) NULL DEFAULT NULL,
  `subkompetensi` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `kode` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`id_subkompetensi_pkg`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for submodul
-- ----------------------------
DROP TABLE IF EXISTS `submodul`;
CREATE TABLE `submodul`  (
  `id_submodul` int(11) NOT NULL AUTO_INCREMENT,
  `idmodul_fk` int(11) NULL DEFAULT NULL,
  `submodul` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `url` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`id_submodul`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of submodul
-- ----------------------------
INSERT INTO `submodul` VALUES (1, 2, 'Prestasi Siswa', 'Prestasi_siswa/get_data');
INSERT INTO `submodul` VALUES (2, 2, 'Buku Tamu', 'Buku_tamu/get_data');
INSERT INTO `submodul` VALUES (3, 2, 'Surat Masuk', 'Surat_masuk/get_data');
INSERT INTO `submodul` VALUES (4, 2, 'Surat Keluar', 'Surat_keluar/get_data');
INSERT INTO `submodul` VALUES (5, 2, 'Buku Induk Kepegawaian', 'Kepegawaian//get_data');
INSERT INTO `submodul` VALUES (6, 3, 'Chart Of Account', 'coa/get_data');
INSERT INTO `submodul` VALUES (7, 3, 'Jenis Tanggungan', 'Jenis_penerimaan/get_data');

-- ----------------------------
-- Table structure for suplier
-- ----------------------------
DROP TABLE IF EXISTS `suplier`;
CREATE TABLE `suplier`  (
  `id_suplier` int(11) NOT NULL AUTO_INCREMENT,
  `suplier` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `no_hp` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  PRIMARY KEY (`id_suplier`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for surat_keluar
-- ----------------------------
DROP TABLE IF EXISTS `surat_keluar`;
CREATE TABLE `surat_keluar`  (
  `id_surat_keluar` int(11) NOT NULL AUTO_INCREMENT,
  `tujuan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `perihal` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `no_surat` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `kode_arsip` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `file_arsip` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `tanggal_surat` date NULL DEFAULT NULL,
  `create_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_surat_keluar`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of surat_keluar
-- ----------------------------
INSERT INTO `surat_keluar` VALUES (1, 'a', 'a', '1231', '85650', '20641942bfea3d85aceabc3d3ca75e40.jpg', '2022-07-22', '2022-07-22 17:01:07');
INSERT INTO `surat_keluar` VALUES (2, 'PPSQ Asy-Syadzili', 'Beli martabak', '1238213', '7912921', 'b1a0b10193bb263d0b09bd16209d73cf.jpg', '2022-10-16', '2022-10-22 20:35:04');

-- ----------------------------
-- Table structure for surat_masuk
-- ----------------------------
DROP TABLE IF EXISTS `surat_masuk`;
CREATE TABLE `surat_masuk`  (
  `id_surat_masuk` int(11) NOT NULL AUTO_INCREMENT,
  `pengirim` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `perihal` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `tanggal_surat` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `kode_arsip` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `create_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `no_surat` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `file_arsip` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  PRIMARY KEY (`id_surat_masuk`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of surat_masuk
-- ----------------------------
INSERT INTO `surat_masuk` VALUES (3, 'andhi', 'asd', '2022-08-03', '632509', '2022-08-03 20:42:08', '123', '8e1f84189f5cc32677ca349ba367d6a7.png');
INSERT INTO `surat_masuk` VALUES (4, 'rahmat1', 'asdasd1', '2022-10-23', '2107791', '2022-10-22 20:32:56', '123/1234', '01c8f2013eabf9e87391d65442912ac5.jpg');

-- ----------------------------
-- Table structure for tahun_ajaran
-- ----------------------------
DROP TABLE IF EXISTS `tahun_ajaran`;
CREATE TABLE `tahun_ajaran`  (
  `id_tahun_ajaran` int(11) NOT NULL AUTO_INCREMENT,
  `tahun_ajaran` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `create_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `is_active` int(11) NULL DEFAULT NULL,
  `semester` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`id_tahun_ajaran`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tahun_ajaran
-- ----------------------------
INSERT INTO `tahun_ajaran` VALUES (1, '2020/2021', '2020-06-07 10:07:41', 0, 'Ganjil');
INSERT INTO `tahun_ajaran` VALUES (2, '2018/2019', '2020-08-03 11:06:13', 0, 'Genap');
INSERT INTO `tahun_ajaran` VALUES (3, '2021/2022', '2021-07-31 12:26:40', 0, 'Ganjil');
INSERT INTO `tahun_ajaran` VALUES (4, '2022/2023', '2022-07-17 10:40:16', 1, 'Ganjil');

-- ----------------------------
-- Table structure for tahun_buku
-- ----------------------------
DROP TABLE IF EXISTS `tahun_buku`;
CREATE TABLE `tahun_buku`  (
  `id_tahun_buku` int(11) NOT NULL AUTO_INCREMENT,
  `tahun_buku` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `tanggal_mulai` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `awalan_kwitansi` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `is_active` int(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id_tahun_buku`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tanggungan_alumni
-- ----------------------------
DROP TABLE IF EXISTS `tanggungan_alumni`;
CREATE TABLE `tanggungan_alumni`  (
  `id_tanggungan_alumni` int(11) NOT NULL AUTO_INCREMENT,
  `idalumni_fk` int(11) NULL DEFAULT NULL,
  `keterangan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `jumlah` decimal(20, 0) NULL DEFAULT NULL,
  `idjenispenerimaan_fk` int(11) NULL DEFAULT NULL,
  `trans_code` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `kas` int(11) NULL DEFAULT NULL,
  `pendapatan` int(11) NULL DEFAULT NULL,
  `piutang` int(11) NULL DEFAULT NULL,
  `diskon` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_tanggungan_alumni`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tanggungan_alumni
-- ----------------------------
INSERT INTO `tanggungan_alumni` VALUES (3, 14, 'Kekurangan Uang Gedung', 50000, 1, '9488737048', 1, 19, 4, 35);
INSERT INTO `tanggungan_alumni` VALUES (4, 12, 'Tanggungan 1', 500000, 7, '3155613159', 1, 19, 4, 35);
INSERT INTO `tanggungan_alumni` VALUES (6, 14, 'Bayar ujian susulan', 150000, 1, '7190941690', 1, 19, 4, 35);
INSERT INTO `tanggungan_alumni` VALUES (13, 12, 'Tanggungan 2', 150000, NULL, '1691423722', 1, 21, 4, 33);

-- ----------------------------
-- Table structure for tanggungan_siswa
-- ----------------------------
DROP TABLE IF EXISTS `tanggungan_siswa`;
CREATE TABLE `tanggungan_siswa`  (
  `id_tanggungan_siswa` int(11) NOT NULL AUTO_INCREMENT,
  `idsiswa_fk` int(11) NULL DEFAULT NULL,
  `idjenispenerimaan_fk` int(11) NULL DEFAULT NULL,
  `jumlah` double(255, 0) NULL DEFAULT NULL,
  `invoice` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`id_tanggungan_siswa`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 207 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tanggungan_siswa
-- ----------------------------
INSERT INTO `tanggungan_siswa` VALUES (5, 595, 1, 2500000, '8086197');
INSERT INTO `tanggungan_siswa` VALUES (6, 595, 2, 3000000, '2041622');
INSERT INTO `tanggungan_siswa` VALUES (7, 595, 3, 250000, '8126800');
INSERT INTO `tanggungan_siswa` VALUES (8, 595, 4, 200000, '691777');
INSERT INTO `tanggungan_siswa` VALUES (9, 594, 1, 3000000, '4822677');
INSERT INTO `tanggungan_siswa` VALUES (10, 594, 2, 5000000, '6983296');
INSERT INTO `tanggungan_siswa` VALUES (11, 594, 3, 200000, '2141688');
INSERT INTO `tanggungan_siswa` VALUES (12, 594, 4, 200000, '9163190');
INSERT INTO `tanggungan_siswa` VALUES (13, 594, 5, 150000, '4215950');
INSERT INTO `tanggungan_siswa` VALUES (14, 670, 1, 100000, '9201722');
INSERT INTO `tanggungan_siswa` VALUES (15, 670, 2, 110000, '3922965');
INSERT INTO `tanggungan_siswa` VALUES (16, 670, 3, 120000, '6520304');
INSERT INTO `tanggungan_siswa` VALUES (17, 670, 4, 130000, '1412712');
INSERT INTO `tanggungan_siswa` VALUES (18, 670, 5, 140000, '555949');
INSERT INTO `tanggungan_siswa` VALUES (19, 671, 1, 100000, '3308568');
INSERT INTO `tanggungan_siswa` VALUES (20, 671, 2, 110000, '3763810');
INSERT INTO `tanggungan_siswa` VALUES (21, 671, 3, 120000, '6385423');
INSERT INTO `tanggungan_siswa` VALUES (22, 671, 4, 130000, '8613372');
INSERT INTO `tanggungan_siswa` VALUES (23, 671, 5, 140000, '4789721');
INSERT INTO `tanggungan_siswa` VALUES (24, 672, 1, 100000, '7996833');
INSERT INTO `tanggungan_siswa` VALUES (25, 672, 2, 110000, '3653897');
INSERT INTO `tanggungan_siswa` VALUES (26, 672, 3, 120000, '3023358');
INSERT INTO `tanggungan_siswa` VALUES (27, 672, 4, 130000, '5585699');
INSERT INTO `tanggungan_siswa` VALUES (28, 672, 5, 140000, '2047940');
INSERT INTO `tanggungan_siswa` VALUES (29, 673, 1, 100000, '1955578');
INSERT INTO `tanggungan_siswa` VALUES (30, 673, 2, 110000, '7712370');
INSERT INTO `tanggungan_siswa` VALUES (31, 673, 3, 120000, '9248825');
INSERT INTO `tanggungan_siswa` VALUES (32, 673, 4, 130000, '2634831');
INSERT INTO `tanggungan_siswa` VALUES (33, 673, 5, 140000, '2278308');
INSERT INTO `tanggungan_siswa` VALUES (34, 674, 1, 100000, '3377440');
INSERT INTO `tanggungan_siswa` VALUES (35, 674, 2, 110000, '5196230');
INSERT INTO `tanggungan_siswa` VALUES (36, 674, 3, 120000, '7261596');
INSERT INTO `tanggungan_siswa` VALUES (37, 674, 4, 130000, '7883059');
INSERT INTO `tanggungan_siswa` VALUES (38, 674, 5, 140000, '4737071');
INSERT INTO `tanggungan_siswa` VALUES (39, 675, 1, 100000, '6077230');
INSERT INTO `tanggungan_siswa` VALUES (40, 675, 2, 110000, '5817166');
INSERT INTO `tanggungan_siswa` VALUES (41, 675, 3, 120000, '3912563');
INSERT INTO `tanggungan_siswa` VALUES (42, 675, 4, 130000, '8054522');
INSERT INTO `tanggungan_siswa` VALUES (43, 675, 5, 140000, '7427516');
INSERT INTO `tanggungan_siswa` VALUES (44, 676, 1, 100000, '7283395');
INSERT INTO `tanggungan_siswa` VALUES (45, 676, 2, 110000, '2353407');
INSERT INTO `tanggungan_siswa` VALUES (46, 676, 3, 120000, '6724227');
INSERT INTO `tanggungan_siswa` VALUES (47, 676, 4, 130000, '6278426');
INSERT INTO `tanggungan_siswa` VALUES (48, 676, 5, 140000, '4770120');
INSERT INTO `tanggungan_siswa` VALUES (55, 592, 1, 2600000, '6832760');
INSERT INTO `tanggungan_siswa` VALUES (56, 592, 2, 3000000, '2763399');
INSERT INTO `tanggungan_siswa` VALUES (57, 592, 3, 250000, '927703');
INSERT INTO `tanggungan_siswa` VALUES (58, 592, 4, 50000, '4171550');
INSERT INTO `tanggungan_siswa` VALUES (59, 592, 5, 400000, '3615980');
INSERT INTO `tanggungan_siswa` VALUES (60, 592, 6, 50000, '8538646');
INSERT INTO `tanggungan_siswa` VALUES (61, 593, 1, 2000000, '5922398');
INSERT INTO `tanggungan_siswa` VALUES (62, 593, 2, 2500000, '2349226');
INSERT INTO `tanggungan_siswa` VALUES (63, 593, 3, 150000, '1947072');
INSERT INTO `tanggungan_siswa` VALUES (64, 593, 4, 100000, '2314789');
INSERT INTO `tanggungan_siswa` VALUES (65, 593, 5, 150000, '28449');
INSERT INTO `tanggungan_siswa` VALUES (67, 595, 5, 510000, '1911081');
INSERT INTO `tanggungan_siswa` VALUES (68, 595, 6, 150000, '9523182');
INSERT INTO `tanggungan_siswa` VALUES (69, 647, 1, 200000, '3932449');
INSERT INTO `tanggungan_siswa` VALUES (70, 647, 2, 2500000, '2245341');
INSERT INTO `tanggungan_siswa` VALUES (71, 647, 3, 150000, '1240933');
INSERT INTO `tanggungan_siswa` VALUES (72, 647, 4, 50000, '487752');
INSERT INTO `tanggungan_siswa` VALUES (73, 647, 5, 100000, '1022279');
INSERT INTO `tanggungan_siswa` VALUES (74, 647, 6, 15000, '5141823');
INSERT INTO `tanggungan_siswa` VALUES (75, 648, 1, 200000, '5478277');
INSERT INTO `tanggungan_siswa` VALUES (76, 648, 2, 2500000, '4071502');
INSERT INTO `tanggungan_siswa` VALUES (77, 648, 3, 150000, '9229235');
INSERT INTO `tanggungan_siswa` VALUES (78, 648, 4, 50000, '8748313');
INSERT INTO `tanggungan_siswa` VALUES (79, 648, 5, 100000, '9395243');
INSERT INTO `tanggungan_siswa` VALUES (80, 648, 6, 15000, '6623874');
INSERT INTO `tanggungan_siswa` VALUES (81, 649, 1, 200000, '5787715');
INSERT INTO `tanggungan_siswa` VALUES (82, 649, 2, 2500000, '68373');
INSERT INTO `tanggungan_siswa` VALUES (83, 649, 3, 150000, '4751705');
INSERT INTO `tanggungan_siswa` VALUES (84, 649, 4, 50000, '5125339');
INSERT INTO `tanggungan_siswa` VALUES (85, 649, 5, 100000, '1721488');
INSERT INTO `tanggungan_siswa` VALUES (86, 649, 6, 15000, '4614010');
INSERT INTO `tanggungan_siswa` VALUES (87, 650, 1, 200000, '2805891');
INSERT INTO `tanggungan_siswa` VALUES (88, 650, 2, 2500000, '5548341');
INSERT INTO `tanggungan_siswa` VALUES (89, 650, 3, 150000, '5338441');
INSERT INTO `tanggungan_siswa` VALUES (90, 650, 4, 50000, '3571465');
INSERT INTO `tanggungan_siswa` VALUES (91, 650, 5, 100000, '346521');
INSERT INTO `tanggungan_siswa` VALUES (92, 650, 6, 15000, '8462303');
INSERT INTO `tanggungan_siswa` VALUES (93, 651, 1, 200000, '2338988');
INSERT INTO `tanggungan_siswa` VALUES (94, 651, 2, 2500000, '7771812');
INSERT INTO `tanggungan_siswa` VALUES (95, 651, 3, 150000, '2995605');
INSERT INTO `tanggungan_siswa` VALUES (96, 651, 4, 50000, '1649021');
INSERT INTO `tanggungan_siswa` VALUES (97, 651, 5, 100000, '2175739');
INSERT INTO `tanggungan_siswa` VALUES (98, 651, 6, 15000, '5694639');
INSERT INTO `tanggungan_siswa` VALUES (99, 652, 1, 200000, '7943481');
INSERT INTO `tanggungan_siswa` VALUES (100, 652, 2, 2500000, '2152994');
INSERT INTO `tanggungan_siswa` VALUES (101, 652, 3, 150000, '4675727');
INSERT INTO `tanggungan_siswa` VALUES (102, 652, 4, 50000, '4507371');
INSERT INTO `tanggungan_siswa` VALUES (103, 652, 5, 100000, '3332956');
INSERT INTO `tanggungan_siswa` VALUES (104, 652, 6, 15000, '4303958');
INSERT INTO `tanggungan_siswa` VALUES (105, 653, 1, 200000, '2809475');
INSERT INTO `tanggungan_siswa` VALUES (106, 653, 2, 2500000, '6198329');
INSERT INTO `tanggungan_siswa` VALUES (107, 653, 3, 150000, '1164360');
INSERT INTO `tanggungan_siswa` VALUES (108, 653, 4, 50000, '3714417');
INSERT INTO `tanggungan_siswa` VALUES (109, 653, 5, 100000, '2521822');
INSERT INTO `tanggungan_siswa` VALUES (110, 653, 6, 15000, '8081386');
INSERT INTO `tanggungan_siswa` VALUES (111, 654, 1, 200000, '2192891');
INSERT INTO `tanggungan_siswa` VALUES (112, 654, 2, 2500000, '5977822');
INSERT INTO `tanggungan_siswa` VALUES (113, 654, 3, 150000, '9620674');
INSERT INTO `tanggungan_siswa` VALUES (114, 654, 4, 50000, '1856550');
INSERT INTO `tanggungan_siswa` VALUES (115, 654, 5, 100000, '3914207');
INSERT INTO `tanggungan_siswa` VALUES (116, 654, 6, 15000, '1772564');
INSERT INTO `tanggungan_siswa` VALUES (117, 655, 1, 200000, '7888633');
INSERT INTO `tanggungan_siswa` VALUES (118, 655, 2, 2500000, '3823825');
INSERT INTO `tanggungan_siswa` VALUES (119, 655, 3, 150000, '2482788');
INSERT INTO `tanggungan_siswa` VALUES (120, 655, 4, 50000, '2445297');
INSERT INTO `tanggungan_siswa` VALUES (121, 655, 5, 100000, '3529103');
INSERT INTO `tanggungan_siswa` VALUES (122, 655, 6, 15000, '6943258');
INSERT INTO `tanggungan_siswa` VALUES (123, 656, 1, 200000, '1728431');
INSERT INTO `tanggungan_siswa` VALUES (124, 656, 2, 2500000, '2924688');
INSERT INTO `tanggungan_siswa` VALUES (125, 656, 3, 150000, '1057320');
INSERT INTO `tanggungan_siswa` VALUES (126, 656, 4, 50000, '9514261');
INSERT INTO `tanggungan_siswa` VALUES (127, 656, 5, 100000, '2258428');
INSERT INTO `tanggungan_siswa` VALUES (128, 656, 6, 15000, '2466972');
INSERT INTO `tanggungan_siswa` VALUES (129, 657, 1, 200000, '4291844');
INSERT INTO `tanggungan_siswa` VALUES (130, 657, 2, 2500000, '3334958');
INSERT INTO `tanggungan_siswa` VALUES (131, 657, 3, 150000, '2071261');
INSERT INTO `tanggungan_siswa` VALUES (132, 657, 4, 50000, '4523121');
INSERT INTO `tanggungan_siswa` VALUES (133, 657, 5, 100000, '1957796');
INSERT INTO `tanggungan_siswa` VALUES (134, 657, 6, 15000, '8606943');
INSERT INTO `tanggungan_siswa` VALUES (135, 658, 1, 200000, '2368995');
INSERT INTO `tanggungan_siswa` VALUES (136, 658, 2, 2500000, '5496913');
INSERT INTO `tanggungan_siswa` VALUES (137, 658, 3, 150000, '6382678');
INSERT INTO `tanggungan_siswa` VALUES (138, 658, 4, 50000, '6193068');
INSERT INTO `tanggungan_siswa` VALUES (139, 658, 5, 100000, '7552050');
INSERT INTO `tanggungan_siswa` VALUES (140, 658, 6, 15000, '6180274');
INSERT INTO `tanggungan_siswa` VALUES (141, 659, 1, 200000, '2834577');
INSERT INTO `tanggungan_siswa` VALUES (142, 659, 2, 2500000, '540555');
INSERT INTO `tanggungan_siswa` VALUES (143, 659, 3, 150000, '4472743');
INSERT INTO `tanggungan_siswa` VALUES (144, 659, 4, 50000, '6455912');
INSERT INTO `tanggungan_siswa` VALUES (145, 659, 5, 100000, '7960974');
INSERT INTO `tanggungan_siswa` VALUES (146, 659, 6, 15000, '2734975');
INSERT INTO `tanggungan_siswa` VALUES (147, 660, 1, 200000, '3702186');
INSERT INTO `tanggungan_siswa` VALUES (148, 660, 2, 2500000, '8066792');
INSERT INTO `tanggungan_siswa` VALUES (149, 660, 3, 150000, '5135804');
INSERT INTO `tanggungan_siswa` VALUES (150, 660, 4, 50000, '874949');
INSERT INTO `tanggungan_siswa` VALUES (151, 660, 5, 100000, '9739463');
INSERT INTO `tanggungan_siswa` VALUES (152, 660, 6, 15000, '6665358');
INSERT INTO `tanggungan_siswa` VALUES (153, 661, 1, 200000, '7001684');
INSERT INTO `tanggungan_siswa` VALUES (154, 661, 2, 2500000, '7251887');
INSERT INTO `tanggungan_siswa` VALUES (155, 661, 3, 150000, '9678349');
INSERT INTO `tanggungan_siswa` VALUES (156, 661, 4, 50000, '4102762');
INSERT INTO `tanggungan_siswa` VALUES (157, 661, 5, 100000, '1297533');
INSERT INTO `tanggungan_siswa` VALUES (158, 661, 6, 15000, '2095219');
INSERT INTO `tanggungan_siswa` VALUES (159, 662, 1, 200000, '2517035');
INSERT INTO `tanggungan_siswa` VALUES (160, 662, 2, 2500000, '1260529');
INSERT INTO `tanggungan_siswa` VALUES (161, 662, 3, 150000, '2840544');
INSERT INTO `tanggungan_siswa` VALUES (162, 662, 4, 50000, '184344');
INSERT INTO `tanggungan_siswa` VALUES (163, 662, 5, 100000, '6703629');
INSERT INTO `tanggungan_siswa` VALUES (164, 662, 6, 15000, '9113137');
INSERT INTO `tanggungan_siswa` VALUES (165, 663, 1, 200000, '8750179');
INSERT INTO `tanggungan_siswa` VALUES (166, 663, 2, 2500000, '2398929');
INSERT INTO `tanggungan_siswa` VALUES (167, 663, 3, 150000, '7736381');
INSERT INTO `tanggungan_siswa` VALUES (168, 663, 4, 50000, '8340668');
INSERT INTO `tanggungan_siswa` VALUES (169, 663, 5, 100000, '8045709');
INSERT INTO `tanggungan_siswa` VALUES (170, 663, 6, 15000, '9993939');
INSERT INTO `tanggungan_siswa` VALUES (171, 664, 1, 200000, '6495092');
INSERT INTO `tanggungan_siswa` VALUES (172, 664, 2, 2500000, '5097462');
INSERT INTO `tanggungan_siswa` VALUES (173, 664, 3, 150000, '5151728');
INSERT INTO `tanggungan_siswa` VALUES (174, 664, 4, 50000, '1436735');
INSERT INTO `tanggungan_siswa` VALUES (175, 664, 5, 100000, '7832973');
INSERT INTO `tanggungan_siswa` VALUES (176, 664, 6, 15000, '1129319');
INSERT INTO `tanggungan_siswa` VALUES (177, 665, 1, 200000, '6380744');
INSERT INTO `tanggungan_siswa` VALUES (178, 665, 2, 2500000, '5646354');
INSERT INTO `tanggungan_siswa` VALUES (179, 665, 3, 150000, '5475174');
INSERT INTO `tanggungan_siswa` VALUES (180, 665, 4, 50000, '8239758');
INSERT INTO `tanggungan_siswa` VALUES (181, 665, 5, 100000, '5636597');
INSERT INTO `tanggungan_siswa` VALUES (182, 665, 6, 15000, '3135103');
INSERT INTO `tanggungan_siswa` VALUES (183, 666, 1, 200000, '3515769');
INSERT INTO `tanggungan_siswa` VALUES (184, 666, 2, 2500000, '1097983');
INSERT INTO `tanggungan_siswa` VALUES (185, 666, 3, 150000, '6011648');
INSERT INTO `tanggungan_siswa` VALUES (186, 666, 4, 50000, '7714742');
INSERT INTO `tanggungan_siswa` VALUES (187, 666, 5, 100000, '5579342');
INSERT INTO `tanggungan_siswa` VALUES (188, 666, 6, 15000, '1734614');
INSERT INTO `tanggungan_siswa` VALUES (189, 667, 1, 200000, '9998796');
INSERT INTO `tanggungan_siswa` VALUES (190, 667, 2, 2500000, '7088296');
INSERT INTO `tanggungan_siswa` VALUES (191, 667, 3, 150000, '6358800');
INSERT INTO `tanggungan_siswa` VALUES (192, 667, 4, 50000, '5104809');
INSERT INTO `tanggungan_siswa` VALUES (193, 667, 5, 100000, '1065920');
INSERT INTO `tanggungan_siswa` VALUES (194, 667, 6, 15000, '9437545');
INSERT INTO `tanggungan_siswa` VALUES (195, 668, 1, 200000, '4321982');
INSERT INTO `tanggungan_siswa` VALUES (196, 668, 2, 2500000, '8599202');
INSERT INTO `tanggungan_siswa` VALUES (197, 668, 3, 150000, '8838929');
INSERT INTO `tanggungan_siswa` VALUES (198, 668, 4, 50000, '9620757');
INSERT INTO `tanggungan_siswa` VALUES (199, 668, 5, 100000, '2792997');
INSERT INTO `tanggungan_siswa` VALUES (200, 668, 6, 15000, '5658450');
INSERT INTO `tanggungan_siswa` VALUES (201, 669, 1, 200000, '5319584');
INSERT INTO `tanggungan_siswa` VALUES (202, 669, 2, 2500000, '7375677');
INSERT INTO `tanggungan_siswa` VALUES (203, 669, 3, 150000, '9119088');
INSERT INTO `tanggungan_siswa` VALUES (204, 669, 4, 50000, '830682');
INSERT INTO `tanggungan_siswa` VALUES (205, 669, 5, 100000, '7401915');
INSERT INTO `tanggungan_siswa` VALUES (206, 669, 6, 15000, '8682906');

-- ----------------------------
-- Table structure for task
-- ----------------------------
DROP TABLE IF EXISTS `task`;
CREATE TABLE `task`  (
  `id_task` int(11) NOT NULL AUTO_INCREMENT,
  `task_code` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `task` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `idguru_fk` int(11) NULL DEFAULT NULL,
  `idmapel_fk` int(11) NULL DEFAULT NULL,
  `title` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `type` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`id_task`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for task_answer
-- ----------------------------
DROP TABLE IF EXISTS `task_answer`;
CREATE TABLE `task_answer`  (
  `id_task_answer` int(11) NOT NULL AUTO_INCREMENT,
  `idsiswa_fk` int(11) NULL DEFAULT NULL,
  `ans` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `idtask_fk` int(11) NULL DEFAULT NULL,
  `type` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `nilai` int(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id_task_answer`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tindakan_catatan_siswa
-- ----------------------------
DROP TABLE IF EXISTS `tindakan_catatan_siswa`;
CREATE TABLE `tindakan_catatan_siswa`  (
  `id_tindakan_catatan_siswa` int(11) NOT NULL AUTO_INCREMENT,
  `idcatatansiswa_fk` int(11) NULL DEFAULT NULL,
  `tanggal` date NULL DEFAULT NULL,
  `tindakan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  PRIMARY KEY (`id_tindakan_catatan_siswa`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tingkat
-- ----------------------------
DROP TABLE IF EXISTS `tingkat`;
CREATE TABLE `tingkat`  (
  `id_tingkat` int(11) NOT NULL AUTO_INCREMENT,
  `tingkat` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `create_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `iddepartment_fk` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_tingkat`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tingkat
-- ----------------------------
INSERT INTO `tingkat` VALUES (1, 'X', '2020-06-07 09:54:48', 1);
INSERT INTO `tingkat` VALUES (2, 'XI', '2020-06-07 09:54:48', 1);
INSERT INTO `tingkat` VALUES (3, 'XII', '2020-06-07 09:55:06', 1);
INSERT INTO `tingkat` VALUES (5, 'VII', '2022-11-04 20:45:32', 2);
INSERT INTO `tingkat` VALUES (6, 'VIII', '2022-11-04 20:45:42', 2);
INSERT INTO `tingkat` VALUES (7, 'IX', '2022-11-04 20:45:49', 2);

-- ----------------------------
-- Table structure for transaksi_saldo
-- ----------------------------
DROP TABLE IF EXISTS `transaksi_saldo`;
CREATE TABLE `transaksi_saldo`  (
  `id_transaksi` int(11) NOT NULL AUTO_INCREMENT,
  `jenis_transaksi` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `idsiswa_fk` int(11) NULL DEFAULT NULL,
  `jumlah` double NULL DEFAULT NULL,
  `tanggal` date NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT 0,
  `order_id` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  PRIMARY KEY (`id_transaksi`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of transaksi_saldo
-- ----------------------------
INSERT INTO `transaksi_saldo` VALUES (21, 'SALDO SISWA', 296, 6000, '2021-12-09', 0, '490682');
INSERT INTO `transaksi_saldo` VALUES (22, 'SALDO SISWA', 296, 40000, '2021-12-09', 0, '430459');
INSERT INTO `transaksi_saldo` VALUES (23, 'SALDO SISWA', 296, 50000, '2021-12-09', 0, '579035');
INSERT INTO `transaksi_saldo` VALUES (24, 'SALDO SISWA', 296, NULL, '2021-12-09', 0, '160012');
INSERT INTO `transaksi_saldo` VALUES (25, 'SALDO SISWA', 296, NULL, '2021-12-09', 0, '212825');
INSERT INTO `transaksi_saldo` VALUES (26, 'SALDO SISWA', 296, 50000, '2021-12-11', 0, '645687');

-- ----------------------------
-- Table structure for transaksi_tanggungan_alumni
-- ----------------------------
DROP TABLE IF EXISTS `transaksi_tanggungan_alumni`;
CREATE TABLE `transaksi_tanggungan_alumni`  (
  `id_transaksi_tanggungan_alumni` int(11) NOT NULL AUTO_INCREMENT,
  `idalumni_fk` int(11) NULL DEFAULT NULL,
  `tanggal` date NULL DEFAULT NULL,
  `invoice` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `catatan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `jumlah` decimal(20, 0) NULL DEFAULT NULL,
  `create_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_transaksi_tanggungan_alumni`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of transaksi_tanggungan_alumni
-- ----------------------------
INSERT INTO `transaksi_tanggungan_alumni` VALUES (2, 14, '2022-08-23', 'P1741155', 'dasj', 165000, '2022-08-23 12:18:33');

-- ----------------------------
-- Table structure for transaksi_tanggungan_siswa
-- ----------------------------
DROP TABLE IF EXISTS `transaksi_tanggungan_siswa`;
CREATE TABLE `transaksi_tanggungan_siswa`  (
  `id_transaksi_tanggungan_siswa` int(11) NOT NULL AUTO_INCREMENT,
  `idsiswa_fk` int(11) NULL DEFAULT NULL,
  `tanggal` date NULL DEFAULT NULL,
  `invoice` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `catatan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `jumlah` decimal(20, 0) NULL DEFAULT NULL,
  `create_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_transaksi_tanggungan_siswa`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of transaksi_tanggungan_siswa
-- ----------------------------
INSERT INTO `transaksi_tanggungan_siswa` VALUES (1, 647, '2022-08-22', 'P5231289', 'pembayaran tanggungan', 250000, '2022-08-22 18:13:47');

-- ----------------------------
-- Table structure for user_modul
-- ----------------------------
DROP TABLE IF EXISTS `user_modul`;
CREATE TABLE `user_modul`  (
  `id_user_modul` int(11) NOT NULL AUTO_INCREMENT,
  `iduser_fk` int(11) NULL DEFAULT NULL,
  `idmodul_fk` int(11) NULL DEFAULT NULL,
  `c` int(255) NULL DEFAULT 0,
  `r` int(255) NULL DEFAULT 0,
  `u` int(255) NULL DEFAULT 0,
  `d` int(255) NULL DEFAULT 0,
  PRIMARY KEY (`id_user_modul`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user_modul
-- ----------------------------
INSERT INTO `user_modul` VALUES (2, 8, 3, 0, 0, 0, 0);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `username` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `salt` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `activation_code` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `forgotten_password_code` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `forgotten_password_time` int(11) UNSIGNED NULL DEFAULT NULL,
  `remember_code` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_on` int(11) UNSIGNED NOT NULL,
  `last_login` int(11) UNSIGNED NULL DEFAULT NULL,
  `active` tinyint(1) UNSIGNED NULL DEFAULT NULL,
  `first_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `last_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `company` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `foto` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `anggota_id` int(11) NULL DEFAULT NULL,
  `table` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `is_walas` int(11) NULL DEFAULT NULL,
  `is_absen` int(11) NULL DEFAULT NULL,
  `c` int(255) NULL DEFAULT 1,
  `r` int(255) NULL DEFAULT 1,
  `u` int(255) NULL DEFAULT 1,
  `d` int(255) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, '127.0.0.1', 'admin', '$2y$08$mxSDKMRKsKM3IwN6NPoB6.3pQqymDu4ZtGAMIzpw.ppcie3MJM9ty', '', 'hello@admin.com', '', NULL, NULL, NULL, 1268889823, 1667697032, 1, 'admin', 'Yani', 'ADMIN', '085894632505', '3c8f6f36f650d5ce07803470b4f4d4ff.jpg', NULL, NULL, NULL, NULL, 1, 1, 1, 1);
INSERT INTO `users` VALUES (3, '127.0.0.1', 'rendy', '$2y$08$OElO/1onJ/wrgc5vc7OfyuYmt6dyEUZVW4oEOzkDJtNoVUXs89.RO', '', 'hello@admin.com', '', NULL, NULL, NULL, 1268889823, 1662084800, 1, 'Rendy', 'Yani', 'ADMIN', '085894632505', '3c8f6f36f650d5ce07803470b4f4d4ff.jpg', 2, 'guru', 1, NULL, 1, 1, 1, 1);
INSERT INTO `users` VALUES (4, '::1', 'is_225661', '$2y$08$9/o/Xc/XlDYWWaWORf7R1OQcZj2.Ng/NB1LecegoOb7NAhGRZibyK', NULL, 'is_225661@gmail.com', NULL, NULL, NULL, NULL, 1658406770, 1658406781, 1, 'ALISSANDRI GARNASIS WIBERTH J, S.Pd', NULL, NULL, NULL, NULL, 1, 'guru', NULL, NULL, 1, 1, 1, 1);
INSERT INTO `users` VALUES (5, '::1', 'is_26892', '$2y$08$6WjIreK2G33N4GUeFSOOmeqseWWRa1WXa/ZYAIm56FBckjIJYR7fy', NULL, 'is_26892@gmail.com', NULL, NULL, NULL, NULL, 1658884212, 1660265790, 1, 'ALISSANDRI GARNASIS WIBERTH J, S.Pd', NULL, NULL, NULL, NULL, 1, 'guru', NULL, NULL, 1, 1, 1, 1);
INSERT INTO `users` VALUES (7, '::1', 'is_479370', '$2y$08$TdJcSMrE39sxdl4NQSezG.QfXgdHqdQlqMkKIoXVYxkdbkCeXhgiO', NULL, 'is_479370@gmail.com', NULL, NULL, NULL, NULL, 1665405123, 1665405139, 1, 'RUDI HARTONO, ST', NULL, NULL, NULL, NULL, 14, 'guru', NULL, NULL, 1, 1, 1, 1);
INSERT INTO `users` VALUES (8, '::1', 'is_156450', '$2y$08$vfAHUHPmjENouSlg3d7IYOyh4EeWjZas5vVBkHBs8IuzaZMondQ8C', NULL, 'is_156450@gmail.com', NULL, NULL, NULL, NULL, 1666444807, 1666509238, 1, 'ALISSANDRI GARNASIS WIBERTH J, S.Pd', NULL, NULL, NULL, NULL, 1, 'guru', NULL, NULL, 0, 1, 0, 1);
INSERT INTO `users` VALUES (9, '::1', 'rudi', '$2y$08$v2XRLCkQdgUDuE8/ERcVy.Pc8cv4WaHdLrSey/KdmNNgROxUJlOTC', NULL, 'rudi@gmail.com', NULL, NULL, NULL, NULL, 1666513253, 1666526191, 1, 'RUDI HARTONO, ST', NULL, NULL, NULL, NULL, 14, 'guru', NULL, NULL, 1, 1, 1, 0);
INSERT INTO `users` VALUES (10, '::1', 'humas', '$2y$08$mhXgHc/hifdF5ykXHlowSeUMVJOpAoDO4gLpya5yVyP7FQRiMi/Sq', NULL, 'humas@gmail.com', NULL, NULL, NULL, NULL, 1666611084, 1667215220, 1, 'Rendy Yani Susanto, S.Pd', NULL, NULL, NULL, NULL, 27, 'guru', NULL, NULL, 1, 1, 1, 1);
INSERT INTO `users` VALUES (11, '::1', 'kesiswaan', '$2y$08$5xngOkF/29/WYA6KwNLkpOpQUq7NPvlWBWVku3l0GeFhGnFg3bFWm', NULL, 'kesiswaan@gmail.com', NULL, NULL, NULL, NULL, 1667176194, 1667215339, 1, 'Rendy Yani Susanto, S.Pd', NULL, NULL, NULL, NULL, 27, 'guru', NULL, NULL, 1, 1, 1, 1);
INSERT INTO `users` VALUES (12, '::1', 'tu', '$2y$08$flkpO9QNnZ1vIirXkjAUA.8YKmBgZcGL5og8Ktm7gODP7889bYCu.', NULL, 'tu@gmail.com', NULL, NULL, NULL, NULL, 1667214007, 1667214023, 1, 'Rendy Yani Susanto, S.Pd', NULL, NULL, NULL, NULL, 27, 'guru', NULL, NULL, 1, 1, 1, 1);

-- ----------------------------
-- Table structure for users_groups
-- ----------------------------
DROP TABLE IF EXISTS `users_groups`;
CREATE TABLE `users_groups`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) UNSIGNED NOT NULL,
  `group_id` mediumint(8) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uc_users_groups`(`user_id`, `group_id`) USING BTREE,
  INDEX `fk_users_groups_users1_idx`(`user_id`) USING BTREE,
  INDEX `fk_users_groups_groups1_idx`(`group_id`) USING BTREE,
  CONSTRAINT `users_groups_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `users_groups_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of users_groups
-- ----------------------------
INSERT INTO `users_groups` VALUES (1, 1, 1);
INSERT INTO `users_groups` VALUES (3, 3, 3);
INSERT INTO `users_groups` VALUES (4, 4, 4);
INSERT INTO `users_groups` VALUES (5, 5, 3);
INSERT INTO `users_groups` VALUES (7, 7, 12);
INSERT INTO `users_groups` VALUES (8, 8, 7);
INSERT INTO `users_groups` VALUES (9, 9, 7);
INSERT INTO `users_groups` VALUES (10, 10, 13);
INSERT INTO `users_groups` VALUES (11, 11, 8);
INSERT INTO `users_groups` VALUES (12, 12, 7);

-- ----------------------------
-- Table structure for wali_kelas
-- ----------------------------
DROP TABLE IF EXISTS `wali_kelas`;
CREATE TABLE `wali_kelas`  (
  `id_wali_kelas` int(11) NOT NULL AUTO_INCREMENT,
  `idguru_fk` int(11) NULL DEFAULT NULL,
  `idtahunajaran_fk` int(11) NULL DEFAULT NULL,
  `idkelas_fk` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_wali_kelas`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of wali_kelas
-- ----------------------------
INSERT INTO `wali_kelas` VALUES (1, 1, 4, 39);

-- ----------------------------
-- View structure for v_bank_soal_quiz
-- ----------------------------
DROP VIEW IF EXISTS `v_bank_soal_quiz`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_bank_soal_quiz` AS select `bank_soal`.`id_bank_soal` AS `id_bank_soal`,`bank_soal`.`soal` AS `soal`,`bank_soal`.`time_soal` AS `time_soal`,`bank_soal`.`code_soal` AS `code_soal`,`bank_soal`.`idmatapelajaran_fk` AS `idmatapelajaran_fk`,`bank_soal`.`idguru_fk` AS `idguru_fk`,`question_cas`.`id_question_cas` AS `id_question_cas`,`question_cas`.`type` AS `type`,`question_cas`.`idbanksoal_fk` AS `idbanksoal_fk`,`question_cas`.`idquiz_fk` AS `idquiz_fk` from (`bank_soal` join `question_cas` on(`question_cas`.`idbanksoal_fk` = `bank_soal`.`id_bank_soal`)) ;

-- ----------------------------
-- View structure for v_buku_pemanggilan_siswa
-- ----------------------------
DROP VIEW IF EXISTS `v_buku_pemanggilan_siswa`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_buku_pemanggilan_siswa` AS select `buku_pemanggilan_siswa`.`id_buku_pemanggilan_siswa` AS `id_buku_pemanggilan_siswa`,`buku_pemanggilan_siswa`.`idsiswa_fk` AS `idsiswa_fk`,`buku_pemanggilan_siswa`.`masalah` AS `masalah`,`buku_pemanggilan_siswa`.`pemecahan` AS `pemecahan`,`buku_pemanggilan_siswa`.`tindak_lanjut` AS `tindak_lanjut`,`buku_pemanggilan_siswa`.`keterangan` AS `keterangan`,`buku_pemanggilan_siswa`.`tanggal` AS `tanggal`,`buku_pemanggilan_siswa`.`kode_pemanggilan` AS `kode_pemanggilan`,`siswa`.`id_siswa` AS `id_siswa`,`siswa`.`nis` AS `nis`,`siswa`.`nama` AS `nama`,`siswa`.`idkelas_fk` AS `idkelas_fk`,`siswa`.`idjurusan_fk` AS `idjurusan_fk`,`siswa`.`agama` AS `agama`,`siswa`.`nisn` AS `nisn`,`siswa`.`no_ijazah_sekolah_asal` AS `no_ijazah_sekolah_asal`,`siswa`.`no_skhun_sekolah_asal` AS `no_skhun_sekolah_asal`,`siswa`.`no_un_sekolah_asal` AS `no_un_sekolah_asal`,`siswa`.`no_kk` AS `no_kk`,`siswa`.`npsn_sekolah_asal` AS `npsn_sekolah_asal`,`siswa`.`nama_sekolah_asal` AS `nama_sekolah_asal`,`siswa`.`tempat_lahir` AS `tempat_lahir`,`siswa`.`tanggal_lahir` AS `tanggal_lahir`,`siswa`.`berkebutuhan_khusus` AS `berkebutuhan_khusus`,`siswa`.`alamat` AS `alamat`,`siswa`.`dusun` AS `dusun`,`siswa`.`rt` AS `rt`,`siswa`.`rw` AS `rw`,`siswa`.`kelurahan` AS `kelurahan`,`siswa`.`foto` AS `foto`,`siswa`.`idprovince_fk` AS `idprovince_fk`,`siswa`.`idcities_fk` AS `idcities_fk`,`siswa`.`nama_ayah` AS `nama_ayah`,`siswa`.`tempat_lahir_ayah` AS `tempat_lahir_ayah`,`siswa`.`tanggal_lahir_ayah` AS `tanggal_lahir_ayah`,`siswa`.`pendidikan_ayah` AS `pendidikan_ayah`,`siswa`.`pekerjaan_ayah` AS `pekerjaan_ayah`,`siswa`.`penghasilan_ayah` AS `penghasilan_ayah`,`siswa`.`nama_ibu` AS `nama_ibu`,`siswa`.`tempat_lahir_ibu` AS `tempat_lahir_ibu`,`siswa`.`tanggal_lahir_ibu` AS `tanggal_lahir_ibu`,`siswa`.`pendidikan_ibu` AS `pendidikan_ibu`,`siswa`.`pekerjaan_ibu` AS `pekerjaan_ibu`,`siswa`.`penghasilan_ibu` AS `penghasilan_ibu`,`siswa`.`tinggi_badan` AS `tinggi_badan`,`siswa`.`berat_badan` AS `berat_badan`,`siswa`.`jarak_ke_sekolah` AS `jarak_ke_sekolah`,`siswa`.`waktu_ke_sekolah` AS `waktu_ke_sekolah`,`siswa`.`jumlah_saudara` AS `jumlah_saudara`,`siswa`.`jenis_kelamin` AS `jenis_kelamin` from (`buku_pemanggilan_siswa` join `siswa` on(`siswa`.`id_siswa` = `buku_pemanggilan_siswa`.`idsiswa_fk`)) ;

-- ----------------------------
-- View structure for v_catatan_siswa
-- ----------------------------
DROP VIEW IF EXISTS `v_catatan_siswa`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_catatan_siswa` AS select `catatan_siswa`.`id_catatan_siswa` AS `id_catatan_siswa`,`catatan_siswa`.`idsiswa_fk` AS `idsiswa_fk`,`catatan_siswa`.`idkelas_fk` AS `idkelas_fk`,`catatan_siswa`.`idguru_fk` AS `idguru_fk`,`catatan_siswa`.`tanggal` AS `tanggal`,`catatan_siswa`.`uraian` AS `uraian`,`catatan_siswa`.`teruskan_ke` AS `teruskan_ke`,`catatan_siswa`.`idtahunajaran_fk` AS `idtahunajaran_fk`,`catatan_siswa`.`idmapel_fk` AS `idmapel_fk`,`siswa`.`id_siswa` AS `id_siswa`,`siswa`.`nis` AS `nis`,`siswa`.`nama` AS `nama`,`siswa`.`idjurusan_fk` AS `idjurusan_fk`,`siswa`.`agama` AS `agama`,`siswa`.`nisn` AS `nisn`,`siswa`.`no_ijazah_sekolah_asal` AS `no_ijazah_sekolah_asal`,`siswa`.`no_skhun_sekolah_asal` AS `no_skhun_sekolah_asal`,`siswa`.`no_un_sekolah_asal` AS `no_un_sekolah_asal`,`siswa`.`no_kk` AS `no_kk`,`siswa`.`npsn_sekolah_asal` AS `npsn_sekolah_asal`,`siswa`.`nama_sekolah_asal` AS `nama_sekolah_asal`,`siswa`.`tempat_lahir` AS `tempat_lahir`,`siswa`.`tanggal_lahir` AS `tanggal_lahir`,`siswa`.`berkebutuhan_khusus` AS `berkebutuhan_khusus`,`siswa`.`alamat` AS `alamat`,`siswa`.`dusun` AS `dusun`,`siswa`.`rt` AS `rt`,`siswa`.`rw` AS `rw`,`siswa`.`kelurahan` AS `kelurahan`,`siswa`.`foto` AS `foto`,`siswa`.`idprovince_fk` AS `idprovince_fk`,`siswa`.`idcities_fk` AS `idcities_fk`,`siswa`.`nama_ayah` AS `nama_ayah`,`siswa`.`tempat_lahir_ayah` AS `tempat_lahir_ayah`,`siswa`.`tanggal_lahir_ayah` AS `tanggal_lahir_ayah`,`siswa`.`pendidikan_ayah` AS `pendidikan_ayah`,`siswa`.`pekerjaan_ayah` AS `pekerjaan_ayah`,`siswa`.`penghasilan_ayah` AS `penghasilan_ayah`,`siswa`.`nama_ibu` AS `nama_ibu`,`siswa`.`tempat_lahir_ibu` AS `tempat_lahir_ibu`,`siswa`.`tanggal_lahir_ibu` AS `tanggal_lahir_ibu`,`siswa`.`pendidikan_ibu` AS `pendidikan_ibu`,`siswa`.`pekerjaan_ibu` AS `pekerjaan_ibu`,`siswa`.`penghasilan_ibu` AS `penghasilan_ibu`,`siswa`.`tinggi_badan` AS `tinggi_badan`,`siswa`.`berat_badan` AS `berat_badan`,`siswa`.`jarak_ke_sekolah` AS `jarak_ke_sekolah`,`siswa`.`waktu_ke_sekolah` AS `waktu_ke_sekolah`,`siswa`.`jumlah_saudara` AS `jumlah_saudara`,`siswa`.`jenis_kelamin` AS `jenis_kelamin` from (`catatan_siswa` join `siswa` on(`catatan_siswa`.`idsiswa_fk` = `siswa`.`id_siswa`)) ;

-- ----------------------------
-- View structure for v_catatan_siswa_harian
-- ----------------------------
DROP VIEW IF EXISTS `v_catatan_siswa_harian`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_catatan_siswa_harian` AS select `catatan_siswa`.`id_catatan_siswa` AS `id_catatan_siswa`,`catatan_siswa`.`idsiswa_fk` AS `idsiswa_fk`,`catatan_siswa`.`idkelas_fk` AS `idkelas_fk`,`catatan_siswa`.`idguru_fk` AS `idguru_fk`,`catatan_siswa`.`tanggal` AS `tanggal`,`catatan_siswa`.`uraian` AS `uraian`,`catatan_siswa`.`teruskan_ke` AS `teruskan_ke`,`catatan_siswa`.`idtahunajaran_fk` AS `idtahunajaran_fk`,`catatan_siswa`.`idmapel_fk` AS `idmapel_fk`,`catatan_siswa`.`is_tindakan` AS `is_tindakan`,`siswa`.`id_siswa` AS `id_siswa`,`siswa`.`nis` AS `nis`,`siswa`.`nama` AS `nama`,`siswa`.`agama` AS `agama`,`siswa`.`nisn` AS `nisn`,`siswa`.`no_ijazah_sekolah_asal` AS `no_ijazah_sekolah_asal`,`siswa`.`no_skhun_sekolah_asal` AS `no_skhun_sekolah_asal`,`siswa`.`no_un_sekolah_asal` AS `no_un_sekolah_asal`,`siswa`.`no_kk` AS `no_kk`,`siswa`.`npsn_sekolah_asal` AS `npsn_sekolah_asal`,`siswa`.`nama_sekolah_asal` AS `nama_sekolah_asal`,`siswa`.`tempat_lahir` AS `tempat_lahir`,`siswa`.`tanggal_lahir` AS `tanggal_lahir`,`siswa`.`berkebutuhan_khusus` AS `berkebutuhan_khusus`,`siswa`.`alamat` AS `alamat`,`siswa`.`dusun` AS `dusun`,`siswa`.`rt` AS `rt`,`siswa`.`rw` AS `rw`,`siswa`.`kelurahan` AS `kelurahan`,`siswa`.`foto` AS `foto`,`siswa`.`idprovince_fk` AS `idprovince_fk`,`siswa`.`idcities_fk` AS `idcities_fk`,`siswa`.`nama_ayah` AS `nama_ayah`,`siswa`.`tempat_lahir_ayah` AS `tempat_lahir_ayah`,`siswa`.`tanggal_lahir_ayah` AS `tanggal_lahir_ayah`,`siswa`.`pendidikan_ayah` AS `pendidikan_ayah`,`siswa`.`pekerjaan_ayah` AS `pekerjaan_ayah`,`siswa`.`penghasilan_ayah` AS `penghasilan_ayah`,`siswa`.`nama_ibu` AS `nama_ibu`,`siswa`.`tempat_lahir_ibu` AS `tempat_lahir_ibu`,`siswa`.`tanggal_lahir_ibu` AS `tanggal_lahir_ibu`,`siswa`.`pendidikan_ibu` AS `pendidikan_ibu`,`siswa`.`pekerjaan_ibu` AS `pekerjaan_ibu`,`siswa`.`penghasilan_ibu` AS `penghasilan_ibu`,`siswa`.`tinggi_badan` AS `tinggi_badan`,`siswa`.`berat_badan` AS `berat_badan`,`siswa`.`jarak_ke_sekolah` AS `jarak_ke_sekolah`,`siswa`.`waktu_ke_sekolah` AS `waktu_ke_sekolah`,`siswa`.`jumlah_saudara` AS `jumlah_saudara`,`siswa`.`jenis_kelamin` AS `jenis_kelamin`,`kelas`.`id_kelas` AS `id_kelas`,`kelas`.`kelas` AS `kelas`,`kelas`.`idtingkat_fk` AS `idtingkat_fk`,`kelas`.`create_at` AS `create_at`,`kelas`.`idjurusan_fk` AS `idjurusan_fk`,`guru`.`id_guru` AS `id_guru`,`guru`.`nama` AS `nama_guru`,`guru`.`nip` AS `nip`,`guru`.`alamat` AS `alamat_guru`,`mata_pelajaran`.`idjenismatapelajaran_fk` AS `idjenismatapelajaran_fk`,`mata_pelajaran`.`id_mata_pelajaran` AS `id_mata_pelajaran`,`mata_pelajaran`.`mata_pelajaran` AS `mata_pelajaran`,`mata_pelajaran`.`kode` AS `kode` from ((((`catatan_siswa` left join `siswa` on(`catatan_siswa`.`idsiswa_fk` = `siswa`.`id_siswa`)) left join `kelas` on(`catatan_siswa`.`idkelas_fk` = `kelas`.`kelas`)) left join `guru` on(`catatan_siswa`.`idguru_fk` = `guru`.`id_guru`)) left join `mata_pelajaran` on(`catatan_siswa`.`idmapel_fk` = `mata_pelajaran`.`id_mata_pelajaran`)) ;

-- ----------------------------
-- View structure for v_catatan_siswa_new
-- ----------------------------
DROP VIEW IF EXISTS `v_catatan_siswa_new`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_catatan_siswa_new` AS select `catatan_siswa`.`id_catatan_siswa` AS `id_catatan_siswa`,`catatan_siswa`.`idsiswa_fk` AS `idsiswa_fk`,`catatan_siswa`.`idkelas_fk` AS `idkelas_fk`,`catatan_siswa`.`idguru_fk` AS `idguru_fk`,`catatan_siswa`.`tanggal` AS `tanggal`,`catatan_siswa`.`uraian` AS `uraian`,`catatan_siswa`.`teruskan_ke` AS `teruskan_ke`,`catatan_siswa`.`idtahunajaran_fk` AS `idtahunajaran_fk`,`catatan_siswa`.`idmapel_fk` AS `idmapel_fk`,`siswa`.`id_siswa` AS `id_siswa`,`siswa`.`nis` AS `nis`,`siswa`.`nama` AS `nama`,`siswa`.`idjurusan_fk` AS `idjurusan_fk`,`siswa`.`agama` AS `agama`,`siswa`.`nisn` AS `nisn`,(select `kelas`.`kelas` from `kelas` where `kelas`.`id_kelas` = `catatan_siswa`.`idkelas_fk`) AS `nama_kelas`,(select `guru`.`nama` from `guru` where `guru`.`id_guru` = `catatan_siswa`.`idguru_fk`) AS `nama_guru`,(select `mata_pelajaran`.`mata_pelajaran` from `mata_pelajaran` where `mata_pelajaran`.`id_mata_pelajaran` = `catatan_siswa`.`idmapel_fk`) AS `mapel` from (`catatan_siswa` join `siswa` on(`catatan_siswa`.`idsiswa_fk` = `siswa`.`id_siswa`)) ;

-- ----------------------------
-- View structure for v_guru_mapel
-- ----------------------------
DROP VIEW IF EXISTS `v_guru_mapel`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_guru_mapel` AS select `guru`.`id_guru` AS `id_guru`,`guru`.`nama` AS `nama`,`guru`.`nip` AS `nip`,`guru`.`alamat` AS `alamat`,`guru`.`agama` AS `agama`,`guru`.`foto` AS `foto`,`guru`.`pendidikan_terakhir` AS `pendidikan_terakhir`,`guru`.`instansi` AS `instansi`,`guru`.`fb` AS `fb`,`guru`.`ig` AS `ig`,`guru`.`twitter` AS `twitter`,`guru`.`youtube` AS `youtube`,`guru`.`jabatan` AS `jabatan`,`guru`.`email` AS `email`,`guru`.`no_hp` AS `no_hp`,`guru_mapel`.`id_guru_mapel` AS `id_guru_mapel`,`guru_mapel`.`idguru_fk` AS `idguru_fk`,`guru_mapel`.`idmapel_fk` AS `idmapel_fk`,`guru_mapel`.`idkelas_fk` AS `idkelas_fk`,`mata_pelajaran`.`id_mata_pelajaran` AS `id_mata_pelajaran`,`mata_pelajaran`.`mata_pelajaran` AS `mata_pelajaran`,`mata_pelajaran`.`kode` AS `kode`,`kelas`.`id_kelas` AS `id_kelas`,`kelas`.`kelas` AS `kelas`,`kelas`.`idtingkat_fk` AS `idtingkat_fk`,`kelas`.`create_at` AS `create_at`,`kelas`.`idjurusan_fk` AS `idjurusan_fk`,`kelas`.`idtahunajaran_fk` AS `idtahunajaran_fk`,`tahun_ajaran`.`id_tahun_ajaran` AS `id_tahun_ajaran`,`tahun_ajaran`.`tahun_ajaran` AS `tahun_ajaran`,`tahun_ajaran`.`is_active` AS `is_active`,`tahun_ajaran`.`semester` AS `semester`,`mata_pelajaran`.`idjenismatapelajaran_fk` AS `idjenismatapelajaran_fk`,`guru`.`kode_pegawai` AS `kode_pegawai` from ((((`guru` join `guru_mapel` on(`guru_mapel`.`idguru_fk` = `guru`.`id_guru`)) join `mata_pelajaran` on(`guru_mapel`.`idmapel_fk` = `mata_pelajaran`.`id_mata_pelajaran`)) join `kelas` on(`kelas`.`id_kelas` = `guru_mapel`.`idkelas_fk`)) join `tahun_ajaran` on(`tahun_ajaran`.`id_tahun_ajaran` = `guru_mapel`.`idtahunajaran_fk`)) ;

-- ----------------------------
-- View structure for v_jadwal_pelajaran
-- ----------------------------
DROP VIEW IF EXISTS `v_jadwal_pelajaran`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_jadwal_pelajaran` AS select `jadwal_pelajaran`.`id_jadwal_pelajaran` AS `id_jadwal_pelajaran`,`jadwal_pelajaran`.`idgurumapel_fk` AS `idgurumapel_fk`,`jadwal_pelajaran`.`idhari_fk` AS `idhari_fk`,`jadwal_pelajaran`.`idjampelajaran_fk` AS `idjampelajaran_fk`,`guru_mapel`.`id_guru_mapel` AS `id_guru_mapel`,`guru_mapel`.`idguru_fk` AS `idguru_fk`,`guru_mapel`.`idmapel_fk` AS `idmapel_fk`,`guru_mapel`.`idkelas_fk` AS `idkelas_fk`,(select `guru`.`nama` from `guru` where `guru`.`id_guru` = `guru_mapel`.`idguru_fk`) AS `nama_guru`,(select `guru`.`nip` from `guru` where `guru`.`id_guru` = `guru_mapel`.`idguru_fk`) AS `nip`,(select `guru`.`kode_pegawai` from `guru` where `guru`.`id_guru` = `guru_mapel`.`idguru_fk`) AS `kode_pegawai`,(select `mata_pelajaran`.`kode` from `mata_pelajaran` where `guru_mapel`.`idmapel_fk` = `mata_pelajaran`.`id_mata_pelajaran`) AS `kode_pelajaran`,(select `mata_pelajaran`.`mata_pelajaran` from `mata_pelajaran` where `guru_mapel`.`idmapel_fk` = `mata_pelajaran`.`id_mata_pelajaran`) AS `mata_pelajaran`,`hari`.`id_hari` AS `id_hari`,`hari`.`hari` AS `hari`,`hari`.`code` AS `code`,`jam_pelajaran`.`id_jam_pelajaran` AS `id_jam_pelajaran`,`jam_pelajaran`.`nama` AS `nama`,`jam_pelajaran`.`jam_mulai` AS `jam_mulai`,`jam_pelajaran`.`jam_selesai` AS `jam_selesai`,`kelas`.`id_kelas` AS `id_kelas`,`kelas`.`kelas` AS `kelas`,`kelas`.`idtingkat_fk` AS `idtingkat_fk`,`kelas`.`create_at` AS `create_at`,`kelas`.`idjurusan_fk` AS `idjurusan_fk`,`kelas`.`idtahunajaran_fk` AS `idtahunajaran_fk` from ((((`jadwal_pelajaran` join `guru_mapel` on(`jadwal_pelajaran`.`idgurumapel_fk` = `guru_mapel`.`id_guru_mapel`)) join `hari` on(`hari`.`id_hari` = `jadwal_pelajaran`.`idhari_fk`)) join `jam_pelajaran` on(`jam_pelajaran`.`id_jam_pelajaran` = `jadwal_pelajaran`.`idjampelajaran_fk`)) join `kelas` on(`guru_mapel`.`idkelas_fk` = `kelas`.`id_kelas`)) ;

-- ----------------------------
-- View structure for v_jenis_penerimaan
-- ----------------------------
DROP VIEW IF EXISTS `v_jenis_penerimaan`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_jenis_penerimaan` AS select `jenis_penerimaan`.`id_jenis_penerimaan` AS `id_jenis_penerimaan`,`jenis_penerimaan`.`nama` AS `nama`,`jenis_penerimaan`.`kas` AS `kas`,`jenis_penerimaan`.`pendapatan` AS `pendapatan`,`jenis_penerimaan`.`piutang` AS `piutang`,`jenis_penerimaan`.`diskon` AS `diskon`,`jenis_penerimaan`.`is_edit` AS `is_edit`,`jenis_penerimaan`.`bulanan` AS `bulanan`,`jenis_penerimaan`.`template_nota` AS `template_nota`,(select `akun`.`no_ref` from `akun` where `jenis_penerimaan`.`kas` = `akun`.`id_akun`) AS `norefkas`,(select `akun`.`no_ref` from `akun` where `jenis_penerimaan`.`pendapatan` = `akun`.`id_akun`) AS `norefpendapatan`,(select `akun`.`no_ref` from `akun` where `jenis_penerimaan`.`piutang` = `akun`.`id_akun`) AS `norefpiutang`,(select `akun`.`no_ref` from `akun` where `jenis_penerimaan`.`diskon` = `akun`.`id_akun`) AS `norefdiskon`,(select `akun`.`saldo_normal` from `akun` where `jenis_penerimaan`.`kas` = `akun`.`id_akun`) AS `snkas`,(select `akun`.`saldo_normal` from `akun` where `jenis_penerimaan`.`pendapatan` = `akun`.`id_akun`) AS `snpendapatan`,(select `akun`.`saldo_normal` from `akun` where `jenis_penerimaan`.`piutang` = `akun`.`id_akun`) AS `snpiutang`,(select `akun`.`saldo_normal` from `akun` where `jenis_penerimaan`.`diskon` = `akun`.`id_akun`) AS `sndiskon` from `jenis_penerimaan` ;

-- ----------------------------
-- View structure for v_learning
-- ----------------------------
DROP VIEW IF EXISTS `v_learning`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_learning` AS select `learning`.`id_learning` AS `id_learning`,`learning`.`idmatapelajaran_fk` AS `idmatapelajaran_fk`,`learning`.`idkd_fk` AS `idkd_fk`,`learning`.`materi` AS `materi`,`learning`.`open_access` AS `open_access`,`learning`.`password` AS `password`,`learning`.`iduser_fk` AS `iduser_fk`,`learning`.`judul` AS `judul`,`learning`.`create_at` AS `create_at`,`learning`.`idtingkat_fk` AS `idtingkat_fk`,`mata_pelajaran`.`id_mata_pelajaran` AS `id_mata_pelajaran`,`mata_pelajaran`.`mata_pelajaran` AS `mata_pelajaran`,`mata_pelajaran`.`kode` AS `kode`,`mata_pelajaran`.`idjenismatapelajaran_fk` AS `idjenismatapelajaran_fk`,`mata_pelajaran`.`jKode` AS `jKode`,`learning`.`cover` AS `cover`,`learning`.`task_code` AS `task_code` from (`learning` join `mata_pelajaran` on(`learning`.`idmatapelajaran_fk` = `mata_pelajaran`.`id_mata_pelajaran`)) ;

-- ----------------------------
-- View structure for v_materi
-- ----------------------------
DROP VIEW IF EXISTS `v_materi`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_materi` AS select distinct `materi`.`materi` AS `materi`,`materi`.`id_materi` AS `id_materi`,`materi`.`file_materi` AS `file_materi`,`materi`.`file_rpp` AS `file_rpp`,`materi`.`idkelas_fk` AS `idkelas_fk`,`materi`.`idguru_fk` AS `idguru_fk`,`materi`.`idtahunajaran_fk` AS `idtahunajaran_fk`,`materi`.`idmatapelajaran_fk` AS `idmatapelajaran_fk`,`materi`.`trans_code` AS `trans_code`,(select `guru`.`nama` from `guru` where `guru`.`id_guru` = `materi`.`idguru_fk`) AS `nama_guru` from `materi` ;

-- ----------------------------
-- View structure for v_nilai_keterampilan
-- ----------------------------
DROP VIEW IF EXISTS `v_nilai_keterampilan`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_nilai_keterampilan` AS select `input_nilai_keterampilan`.`id_input_nilai_keterampilan` AS `id_input_nilai_keterampilan`,`input_nilai_keterampilan`.`idmatapelajaran_fk` AS `idmatapelajaran_fk`,`input_nilai_keterampilan`.`idtahunajaran_fk` AS `idtahunajaran_fk`,`input_nilai_keterampilan`.`trans_code` AS `trans_code`,`input_nilai_keterampilan`.`idguru_fk` AS `idguru_fk`,`input_nilai_keterampilan`.`idkelas_fk` AS `idkelas_fk`,`input_nilai_keterampilan`.`idjenisketerampilan_fk` AS `idjenisketerampilan_fk`,`nilai_keterampilan`.`id_nilai_keterampilan` AS `id_nilai_keterampilan`,`nilai_keterampilan`.`idsiswa_fk` AS `idsiswa_fk`,`nilai_keterampilan`.`nilai` AS `nilai`,`nilai_keterampilan`.`idinputnilaiketerampilan_fk` AS `idinputnilaiketerampilan_fk`,`nilai_keterampilan`.`create_at` AS `create_at`,`nilai_keterampilan`.`idkd_fk` AS `idkd_fk` from (`input_nilai_keterampilan` join `nilai_keterampilan` on(`input_nilai_keterampilan`.`id_input_nilai_keterampilan` = `nilai_keterampilan`.`idinputnilaiketerampilan_fk`)) ;

-- ----------------------------
-- View structure for v_nilai_pas
-- ----------------------------
DROP VIEW IF EXISTS `v_nilai_pas`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_nilai_pas` AS select `input_nilai_pas`.`id_input_nilai_pas` AS `id_input_nilai_pas`,`input_nilai_pas`.`idmatapelajaran_fk` AS `idmatapelajaran_fk`,`input_nilai_pas`.`idtahunajaran_fk` AS `idtahunajaran_fk`,`input_nilai_pas`.`trans_code` AS `trans_code`,`input_nilai_pas`.`idguru_fk` AS `idguru_fk`,`input_nilai_pas`.`idkelas_fk` AS `idkelas_fk`,`nilai_pas`.`id_nilai_pas` AS `id_nilai_pas`,`nilai_pas`.`idsiswa_fk` AS `idsiswa_fk`,`nilai_pas`.`nilai` AS `nilai`,`nilai_pas`.`idinputnilaipas_fk` AS `idinputnilaipas_fk`,`nilai_pas`.`create_at` AS `create_at` from (`input_nilai_pas` join `nilai_pas` on(`input_nilai_pas`.`id_input_nilai_pas` = `nilai_pas`.`idinputnilaipas_fk`)) ;

-- ----------------------------
-- View structure for v_nilai_pengetahuan
-- ----------------------------
DROP VIEW IF EXISTS `v_nilai_pengetahuan`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_nilai_pengetahuan` AS select `nilai_pengetahuan`.`id_nilai_pengetahuan` AS `id_nilai_pengetahuan`,`nilai_pengetahuan`.`idsiswa_fk` AS `idsiswa_fk`,`nilai_pengetahuan`.`nilai` AS `nilai`,`nilai_pengetahuan`.`idinputnilaipengetahuan_fk` AS `idinputnilaipengetahuan_fk`,`nilai_pengetahuan`.`create_at` AS `create_at`,`nilai_pengetahuan`.`idkd_fk` AS `idkd_fk`,`input_nilai_pengetahuan`.`id_input_nilai_pengetahuan` AS `id_input_nilai_pengetahuan`,`input_nilai_pengetahuan`.`idmatapelajaran_fk` AS `idmatapelajaran_fk`,`input_nilai_pengetahuan`.`idtahunajaran_fk` AS `idtahunajaran_fk`,`input_nilai_pengetahuan`.`trans_code` AS `trans_code`,`input_nilai_pengetahuan`.`idguru_fk` AS `idguru_fk`,`input_nilai_pengetahuan`.`idkelas_fk` AS `idkelas_fk`,`input_nilai_pengetahuan`.`idjenispengetahuan_fk` AS `idjenispengetahuan_fk` from (`nilai_pengetahuan` join `input_nilai_pengetahuan` on(`input_nilai_pengetahuan`.`id_input_nilai_pengetahuan` = `nilai_pengetahuan`.`idinputnilaipengetahuan_fk`)) ;

-- ----------------------------
-- View structure for v_nilai_pts
-- ----------------------------
DROP VIEW IF EXISTS `v_nilai_pts`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_nilai_pts` AS select `input_nilai_pts`.`id_input_nilai_pts` AS `id_input_nilai_pts`,`input_nilai_pts`.`idmatapelajaran_fk` AS `idmatapelajaran_fk`,`input_nilai_pts`.`idtahunajaran_fk` AS `idtahunajaran_fk`,`input_nilai_pts`.`trans_code` AS `trans_code`,`input_nilai_pts`.`idguru_fk` AS `idguru_fk`,`input_nilai_pts`.`idkelas_fk` AS `idkelas_fk`,`nilai_pts`.`id_nilai_pts` AS `id_nilai_pts`,`nilai_pts`.`idsiswa_fk` AS `idsiswa_fk`,`nilai_pts`.`nilai` AS `nilai`,`nilai_pts`.`idinputnilaipts_fk` AS `idinputnilaipts_fk`,`nilai_pts`.`create_at` AS `create_at` from (`input_nilai_pts` join `nilai_pts` on(`input_nilai_pts`.`id_input_nilai_pts` = `nilai_pts`.`idinputnilaipts_fk`)) ;

-- ----------------------------
-- View structure for v_oas_soal
-- ----------------------------
DROP VIEW IF EXISTS `v_oas_soal`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_oas_soal` AS select `oas_soal`.`id_oas_soal` AS `id_oas_soal`,`oas_soal`.`idbanksoal_fk` AS `idbanksoal_fk`,`oas_soal`.`idoas_fk` AS `idoas_fk`,`bank_soal`.`id_bank_soal` AS `id_bank_soal`,`bank_soal`.`soal` AS `soal`,`bank_soal`.`time_soal` AS `time_soal`,`bank_soal`.`code_soal` AS `code_soal`,`bank_soal`.`idmatapelajaran_fk` AS `idmatapelajaran_fk`,`bank_soal`.`idguru_fk` AS `idguru_fk`,`oas`.`id_oas` AS `id_oas`,`oas`.`tanggal_mulai` AS `tanggal_mulai`,`oas`.`tanggal_selesai` AS `tanggal_selesai`,`oas`.`keterangan` AS `keterangan`,`oas`.`is_active` AS `is_active`,`oas`.`kode` AS `kode`,`oas`.`idmapel_fk` AS `idmapel_fk` from ((`oas_soal` join `bank_soal` on(`oas_soal`.`idbanksoal_fk` = `bank_soal`.`id_bank_soal`)) join `oas` on(`oas_soal`.`idoas_fk` = `oas`.`id_oas`)) ;

-- ----------------------------
-- View structure for v_pelanggaran_siswa
-- ----------------------------
DROP VIEW IF EXISTS `v_pelanggaran_siswa`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_pelanggaran_siswa` AS select `pelanggaran_siswa`.`id_pelanggaran_siswa` AS `id_pelanggaran_siswa`,`pelanggaran_siswa`.`tanggal` AS `tanggal`,`pelanggaran_siswa`.`uraian_pelanggaran` AS `uraian_pelanggaran`,`pelanggaran_siswa`.`idpoinpelanggaran_fk` AS `idpoinpelanggaran_fk`,`pelanggaran_siswa`.`idsiswa_fk` AS `idsiswa_fk`,`poin_pelanggaran`.`id_poin_pelanggaran` AS `id_poin_pelanggaran`,`poin_pelanggaran`.`idjenispelanggaran_fk` AS `idjenispelanggaran_fk`,`poin_pelanggaran`.`nama_pelanggaran` AS `nama_pelanggaran`,`poin_pelanggaran`.`poin` AS `poin`,`poin_pelanggaran`.`kode_pelanggaran` AS `kode_pelanggaran`,`jenis_pelanggaran`.`id_jenis_pelanggaran` AS `id_jenis_pelanggaran`,`jenis_pelanggaran`.`jenis_pelanggaran` AS `jenis_pelanggaran`,(select `siswa`.`nama` from `siswa` where `siswa`.`id_siswa` = `pelanggaran_siswa`.`idsiswa_fk`) AS `nama_siswa` from ((`pelanggaran_siswa` left join `poin_pelanggaran` on(`poin_pelanggaran`.`id_poin_pelanggaran` = `pelanggaran_siswa`.`idpoinpelanggaran_fk`)) left join `jenis_pelanggaran` on(`jenis_pelanggaran`.`id_jenis_pelanggaran` = `poin_pelanggaran`.`idjenispelanggaran_fk`)) ;

-- ----------------------------
-- View structure for v_penerimaan
-- ----------------------------
DROP VIEW IF EXISTS `v_penerimaan`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_penerimaan` AS select `penerimaan`.`id_penerimaan` AS `id_penerimaan`,`penerimaan`.`idsiswa_fk` AS `idsiswa_fk`,`penerimaan`.`idjenispenerimaan_fk` AS `idjenispenerimaan_fk`,`penerimaan`.`metode_pembayaran` AS `metode_pembayaran`,`penerimaan`.`tanggal` AS `tanggal`,`penerimaan`.`catatan` AS `catatan`,`penerimaan`.`jumlah` AS `jumlah`,`penerimaan`.`create_at` AS `create_at`,`penerimaan`.`invoice` AS `invoice`,`penerimaan`.`diskon` AS `diskon_penerimaan`,`jenis_penerimaan`.`id_jenis_penerimaan` AS `id_jenis_penerimaan`,`jenis_penerimaan`.`nama` AS `nama`,`jenis_penerimaan`.`kas` AS `kas`,`jenis_penerimaan`.`pendapatan` AS `pendapatan`,`jenis_penerimaan`.`piutang` AS `piutang`,`jenis_penerimaan`.`is_edit` AS `is_edit`,`jenis_penerimaan`.`bulanan` AS `bulanan`,`jenis_penerimaan`.`template_nota` AS `template_nota`,`jenis_penerimaan`.`diskon` AS `diskon`,`siswa`.`id_siswa` AS `id_siswa`,`siswa`.`nis` AS `nis`,`siswa`.`nama` AS `nama_siswa`,`siswa`.`idkelas_fk` AS `idkelas_fk`,`siswa`.`idjurusan_fk` AS `idjurusan_fk`,`siswa`.`agama` AS `agama`,`siswa`.`nisn` AS `nisn`,`siswa`.`no_ijazah_sekolah_asal` AS `no_ijazah_sekolah_asal`,`siswa`.`no_skhun_sekolah_asal` AS `no_skhun_sekolah_asal`,`siswa`.`no_un_sekolah_asal` AS `no_un_sekolah_asal`,`siswa`.`no_kk` AS `no_kk`,`siswa`.`npsn_sekolah_asal` AS `npsn_sekolah_asal`,`siswa`.`nama_sekolah_asal` AS `nama_sekolah_asal`,`siswa`.`tempat_lahir` AS `tempat_lahir`,`siswa`.`tanggal_lahir` AS `tanggal_lahir`,`siswa`.`berkebutuhan_khusus` AS `berkebutuhan_khusus`,`siswa`.`alamat` AS `alamat`,`siswa`.`dusun` AS `dusun`,`siswa`.`rt` AS `rt`,`siswa`.`rw` AS `rw`,`siswa`.`kelurahan` AS `kelurahan`,`siswa`.`foto` AS `foto`,`siswa`.`idprovince_fk` AS `idprovince_fk`,`siswa`.`idcities_fk` AS `idcities_fk`,`siswa`.`nama_ayah` AS `nama_ayah`,`siswa`.`tempat_lahir_ayah` AS `tempat_lahir_ayah`,`siswa`.`tanggal_lahir_ayah` AS `tanggal_lahir_ayah`,`siswa`.`pendidikan_ayah` AS `pendidikan_ayah`,`siswa`.`pekerjaan_ayah` AS `pekerjaan_ayah`,`siswa`.`penghasilan_ayah` AS `penghasilan_ayah`,`siswa`.`nama_ibu` AS `nama_ibu`,`siswa`.`tempat_lahir_ibu` AS `tempat_lahir_ibu`,`siswa`.`tanggal_lahir_ibu` AS `tanggal_lahir_ibu`,`siswa`.`pendidikan_ibu` AS `pendidikan_ibu`,`siswa`.`pekerjaan_ibu` AS `pekerjaan_ibu`,`siswa`.`penghasilan_ibu` AS `penghasilan_ibu`,`siswa`.`tinggi_badan` AS `tinggi_badan`,`siswa`.`berat_badan` AS `berat_badan`,`siswa`.`jarak_ke_sekolah` AS `jarak_ke_sekolah`,`siswa`.`waktu_ke_sekolah` AS `waktu_ke_sekolah`,`siswa`.`jumlah_saudara` AS `jumlah_saudara`,`siswa`.`jenis_kelamin` AS `jenis_kelamin`,`siswa`.`saldo` AS `saldo`,(select `kelas`.`kelas` from `kelas` where `siswa`.`idkelas_fk` = `kelas`.`id_kelas`) AS `kelas` from ((`penerimaan` join `jenis_penerimaan` on(`penerimaan`.`idjenispenerimaan_fk` = `jenis_penerimaan`.`id_jenis_penerimaan`)) join `siswa` on(`penerimaan`.`idsiswa_fk` = `siswa`.`id_siswa`)) ;

-- ----------------------------
-- View structure for v_pkg
-- ----------------------------
DROP VIEW IF EXISTS `v_pkg`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_pkg` AS select `component_penilaian_kinerja_guru`.`idpenilaiankinerjaguru_fk` AS `idpenilaiankinerjaguru_fk`,`penilaian_kinerja_guru`.`id_penilaian_kinerja_guru` AS `id_penilaian_kinerja_guru`,`penilaian_kinerja_guru`.`idguru_fk` AS `idguru_fk`,`penilaian_kinerja_guru`.`bulan` AS `bulan`,`penilaian_kinerja_guru`.`tahun` AS `tahun`,`penilaian_kinerja_guru`.`idtahunajaran_fk` AS `idtahunajaran_fk`,`penilaian_kinerja_guru`.`create_at` AS `create_at`,`penilaian_kinerja_guru`.`trans_code` AS `trans_code`,`component_penilaian_kinerja_guru`.`id_component_penilaian_kinerja_guru` AS `id_component_penilaian_kinerja_guru`,`component_penilaian_kinerja_guru`.`idsubkompetensipkg_fk` AS `idsubkompetensipkg_fk`,`component_penilaian_kinerja_guru`.`nilai` AS `nilai` from (`penilaian_kinerja_guru` join `component_penilaian_kinerja_guru` on(`penilaian_kinerja_guru`.`id_penilaian_kinerja_guru` = `component_penilaian_kinerja_guru`.`idpenilaiankinerjaguru_fk`)) ;

-- ----------------------------
-- View structure for v_poin_pelanggaran
-- ----------------------------
DROP VIEW IF EXISTS `v_poin_pelanggaran`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_poin_pelanggaran` AS SELECT
poin_pelanggaran.id_poin_pelanggaran AS id_poin_pelanggaran,
poin_pelanggaran.idjenispelanggaran_fk AS idjenispelanggaran_fk,
poin_pelanggaran.nama_pelanggaran AS nama_pelanggaran,
poin_pelanggaran.poin AS poin,
jenis_pelanggaran.id_jenis_pelanggaran AS id_jenis_pelanggaran,
jenis_pelanggaran.jenis_pelanggaran AS jenis_pelanggaran,
poin_pelanggaran.kategori_pelanggaran,
poin_pelanggaran.kode_pelanggaran
FROM
(poin_pelanggaran
JOIN jenis_pelanggaran ON (jenis_pelanggaran.id_jenis_pelanggaran = poin_pelanggaran.idjenispelanggaran_fk)) ;

-- ----------------------------
-- View structure for v_poin_pelanggaran_siswa
-- ----------------------------
DROP VIEW IF EXISTS `v_poin_pelanggaran_siswa`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_poin_pelanggaran_siswa` AS select `siswa`.`id_siswa` AS `id_siswa`,`siswa`.`nisn` AS `nisn`,`siswa`.`nis` AS `nis`,`siswa`.`nama` AS `nama`,(select sum(`v_pelanggaran_siswa`.`poin`) from `v_pelanggaran_siswa` where `v_pelanggaran_siswa`.`idsiswa_fk` = `siswa`.`id_siswa`) AS `poin` from `siswa` where (select sum(`v_pelanggaran_siswa`.`poin`) from `v_pelanggaran_siswa` where `v_pelanggaran_siswa`.`idsiswa_fk` = `siswa`.`id_siswa`) > 0 ;

-- ----------------------------
-- View structure for v_presensi_event
-- ----------------------------
DROP VIEW IF EXISTS `v_presensi_event`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_presensi_event` AS select `event`.`id_event` AS `id_event`,`event`.`event` AS `event`,`event`.`tanggal` AS `tanggal`,`event`.`notulensi` AS `notulensi`,`presensi_event`.`id_presensi_event` AS `id_presensi_event`,`presensi_event`.`idevent_fk` AS `idevent_fk`,`presensi_event`.`idguru_fk` AS `idguru_fk`,`presensi_event`.`is_hadir` AS `is_hadir`,(select `guru`.`nama` from `guru` where `guru`.`id_guru` = `presensi_event`.`idguru_fk`) AS `nama_guru` from (`event` join `presensi_event` on(`presensi_event`.`idevent_fk` = `event`.`id_event`)) ;

-- ----------------------------
-- View structure for v_presensi_harian_set
-- ----------------------------
DROP VIEW IF EXISTS `v_presensi_harian_set`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_presensi_harian_set` AS select `presensi_harian`.`id_presensi_harian` AS `id_presensi_harian`,`presensi_harian`.`idmatapelajaran_fk` AS `idmatapelajaran_fk`,`presensi_harian`.`idsiswa_fk` AS `idsiswa_fk`,`presensi_harian`.`presensi` AS `presensi`,`presensi_harian`.`keterangan` AS `keterangan`,`presensi_harian`.`tanggal` AS `tanggal`,`presensi_harian`.`create_at` AS `create_at`,`presensi_harian`.`idtahunajaran_fk` AS `idtahunajaran_fk`,`presensi_harian`.`idkelas_fk` AS `idkelas_fk`,(select `kelas`.`idjurusan_fk` from `kelas` where `kelas`.`id_kelas` = `presensi_harian`.`idkelas_fk`) AS `id_jurusan` from `presensi_harian` ;

-- ----------------------------
-- View structure for v_prestasi_siswa
-- ----------------------------
DROP VIEW IF EXISTS `v_prestasi_siswa`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_prestasi_siswa` AS select `prestasi_siswa`.`id_prestasi_siswa` AS `id_prestasi_siswa`,`prestasi_siswa`.`idsiswa_fk` AS `idsiswa_fk`,`prestasi_siswa`.`prestasi` AS `prestasi`,`prestasi_siswa`.`lomba` AS `lomba`,`prestasi_siswa`.`tahun` AS `tahun`,`prestasi_siswa`.`jenis_perlombaan` AS `jenis_perlombaan`,(select `siswa`.`nama` from `siswa` where `siswa`.`id_siswa` = `prestasi_siswa`.`idsiswa_fk`) AS `nama_siswa`,(select `siswa`.`nis` from `siswa` where `siswa`.`id_siswa` = `prestasi_siswa`.`idsiswa_fk`) AS `nis_siswa` from `prestasi_siswa` ;

-- ----------------------------
-- View structure for v_siswa_jurusan
-- ----------------------------
DROP VIEW IF EXISTS `v_siswa_jurusan`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_siswa_jurusan` AS select `siswa`.`id_siswa` AS `id_siswa`,`siswa`.`nis` AS `nis`,`siswa`.`nama` AS `nama`,`siswa`.`idkelas_fk` AS `idkelas_fk`,`siswa`.`idjurusan_fk` AS `idjurusan_fk`,`siswa`.`agama` AS `agama`,`siswa`.`nisn` AS `nisn`,`siswa`.`no_ijazah_sekolah_asal` AS `no_ijazah_sekolah_asal`,`siswa`.`no_skhun_sekolah_asal` AS `no_skhun_sekolah_asal`,`siswa`.`no_un_sekolah_asal` AS `no_un_sekolah_asal`,`siswa`.`no_kk` AS `no_kk`,`siswa`.`npsn_sekolah_asal` AS `npsn_sekolah_asal`,`siswa`.`nama_sekolah_asal` AS `nama_sekolah_asal`,`siswa`.`tempat_lahir` AS `tempat_lahir`,`siswa`.`tanggal_lahir` AS `tanggal_lahir`,`siswa`.`berkebutuhan_khusus` AS `berkebutuhan_khusus`,`siswa`.`alamat` AS `alamat`,`siswa`.`dusun` AS `dusun`,`siswa`.`rt` AS `rt`,`siswa`.`rw` AS `rw`,`siswa`.`kelurahan` AS `kelurahan`,`siswa`.`foto` AS `foto`,`siswa`.`idprovince_fk` AS `idprovince_fk`,`siswa`.`idcities_fk` AS `idcities_fk`,`siswa`.`nama_ayah` AS `nama_ayah`,`siswa`.`tempat_lahir_ayah` AS `tempat_lahir_ayah`,`siswa`.`tanggal_lahir_ayah` AS `tanggal_lahir_ayah`,`siswa`.`pendidikan_ayah` AS `pendidikan_ayah`,`siswa`.`pekerjaan_ayah` AS `pekerjaan_ayah`,`siswa`.`penghasilan_ayah` AS `penghasilan_ayah`,`siswa`.`nama_ibu` AS `nama_ibu`,`siswa`.`tempat_lahir_ibu` AS `tempat_lahir_ibu`,`siswa`.`tanggal_lahir_ibu` AS `tanggal_lahir_ibu`,`siswa`.`pendidikan_ibu` AS `pendidikan_ibu`,`siswa`.`pekerjaan_ibu` AS `pekerjaan_ibu`,`siswa`.`penghasilan_ibu` AS `penghasilan_ibu`,`siswa`.`tinggi_badan` AS `tinggi_badan`,`siswa`.`berat_badan` AS `berat_badan`,`siswa`.`jarak_ke_sekolah` AS `jarak_ke_sekolah`,`siswa`.`waktu_ke_sekolah` AS `waktu_ke_sekolah`,`siswa`.`jumlah_saudara` AS `jumlah_saudara`,`siswa`.`jenis_kelamin` AS `jenis_kelamin`,`kelas`.`id_kelas` AS `id_kelas`,`kelas`.`kelas` AS `kelas`,`kelas`.`idtingkat_fk` AS `idtingkat_fk`,`kelas`.`create_at` AS `create_at`,`kelas`.`idtahunajaran_fk` AS `idtahunajaran_fk`,`jurusan`.`id_jurusan` AS `id_jurusan`,`jurusan`.`jurusan` AS `jurusan`,`jurusan`.`singkatan` AS `singkatan`,(select `tingkat`.`tingkat` from `tingkat` where `tingkat`.`id_tingkat` = `kelas`.`idtingkat_fk`) AS `nama_tingkat` from ((`siswa` join `kelas` on(`kelas`.`id_kelas` = `siswa`.`idkelas_fk`)) join `jurusan` on(`jurusan`.`id_jurusan` = `siswa`.`idjurusan_fk`)) ;

-- ----------------------------
-- View structure for v_tanggungan_siswa
-- ----------------------------
DROP VIEW IF EXISTS `v_tanggungan_siswa`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_tanggungan_siswa` AS select `tanggungan_siswa`.`id_tanggungan_siswa` AS `id_tanggungan_siswa`,`tanggungan_siswa`.`idsiswa_fk` AS `idsiswa_fk`,`tanggungan_siswa`.`idjenispenerimaan_fk` AS `idjenispenerimaan_fk`,`tanggungan_siswa`.`jumlah` AS `jumlah`,`jenis_penerimaan`.`id_jenis_penerimaan` AS `id_jenis_penerimaan`,`jenis_penerimaan`.`nama` AS `nama`,`jenis_penerimaan`.`kas` AS `kas`,`jenis_penerimaan`.`pendapatan` AS `pendapatan`,`jenis_penerimaan`.`piutang` AS `piutang`,`jenis_penerimaan`.`diskon` AS `diskon`,`jenis_penerimaan`.`is_edit` AS `is_edit`,`jenis_penerimaan`.`bulanan` AS `bulanan`,`jenis_penerimaan`.`template_nota` AS `template_nota` from (`tanggungan_siswa` join `jenis_penerimaan` on(`tanggungan_siswa`.`idjenispenerimaan_fk` = `jenis_penerimaan`.`id_jenis_penerimaan`)) ;

-- ----------------------------
-- View structure for v_task
-- ----------------------------
DROP VIEW IF EXISTS `v_task`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_task` AS select `task_answer`.`id_task_answer` AS `id_task_answer`,`task_answer`.`idsiswa_fk` AS `idsiswa_fk`,`task_answer`.`ans` AS `ans`,`task_answer`.`idtask_fk` AS `idtask_fk`,`task_answer`.`type` AS `type`,`task`.`id_task` AS `id_task`,`task`.`task_code` AS `task_code`,`task`.`task` AS `task`,`task`.`idguru_fk` AS `idguru_fk`,`task`.`idmapel_fk` AS `idmapel_fk`,`task`.`title` AS `title`,`siswa`.`id_siswa` AS `id_siswa`,`siswa`.`nis` AS `nis`,`siswa`.`nama` AS `nama`,`siswa`.`idkelas_fk` AS `idkelas_fk`,`siswa`.`idjurusan_fk` AS `idjurusan_fk`,`siswa`.`agama` AS `agama`,`siswa`.`nisn` AS `nisn`,`siswa`.`no_ijazah_sekolah_asal` AS `no_ijazah_sekolah_asal`,`siswa`.`no_skhun_sekolah_asal` AS `no_skhun_sekolah_asal`,`siswa`.`no_un_sekolah_asal` AS `no_un_sekolah_asal`,`siswa`.`no_kk` AS `no_kk`,`siswa`.`npsn_sekolah_asal` AS `npsn_sekolah_asal`,`siswa`.`nama_sekolah_asal` AS `nama_sekolah_asal`,`siswa`.`tempat_lahir` AS `tempat_lahir`,`siswa`.`tanggal_lahir` AS `tanggal_lahir`,`siswa`.`berkebutuhan_khusus` AS `berkebutuhan_khusus`,`siswa`.`alamat` AS `alamat`,`siswa`.`dusun` AS `dusun`,`siswa`.`rt` AS `rt`,`siswa`.`rw` AS `rw`,`siswa`.`kelurahan` AS `kelurahan`,`siswa`.`foto` AS `foto`,`siswa`.`idprovince_fk` AS `idprovince_fk`,`siswa`.`idcities_fk` AS `idcities_fk`,`siswa`.`nama_ayah` AS `nama_ayah`,`siswa`.`tempat_lahir_ayah` AS `tempat_lahir_ayah`,`siswa`.`tanggal_lahir_ayah` AS `tanggal_lahir_ayah`,`siswa`.`pendidikan_ayah` AS `pendidikan_ayah`,`siswa`.`pekerjaan_ayah` AS `pekerjaan_ayah`,`siswa`.`penghasilan_ayah` AS `penghasilan_ayah`,`siswa`.`nama_ibu` AS `nama_ibu`,`siswa`.`tempat_lahir_ibu` AS `tempat_lahir_ibu`,`siswa`.`tanggal_lahir_ibu` AS `tanggal_lahir_ibu`,`siswa`.`pendidikan_ibu` AS `pendidikan_ibu`,`siswa`.`pekerjaan_ibu` AS `pekerjaan_ibu`,`siswa`.`penghasilan_ibu` AS `penghasilan_ibu`,`siswa`.`tinggi_badan` AS `tinggi_badan`,`siswa`.`berat_badan` AS `berat_badan`,`siswa`.`jarak_ke_sekolah` AS `jarak_ke_sekolah`,`siswa`.`waktu_ke_sekolah` AS `waktu_ke_sekolah`,`siswa`.`jumlah_saudara` AS `jumlah_saudara`,`siswa`.`jenis_kelamin` AS `jenis_kelamin`,`task_answer`.`nilai` AS `nilai` from ((`task_answer` join `task` on(`task_answer`.`idtask_fk` = `task`.`id_task`)) join `siswa` on(`task_answer`.`idsiswa_fk` = `siswa`.`id_siswa`)) ;

-- ----------------------------
-- View structure for v_walas
-- ----------------------------
DROP VIEW IF EXISTS `v_walas`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_walas` AS select `wali_kelas`.`id_wali_kelas` AS `id_wali_kelas`,`wali_kelas`.`idguru_fk` AS `idguru_fk`,`wali_kelas`.`idtahunajaran_fk` AS `idtahunajaran_fk`,`wali_kelas`.`idkelas_fk` AS `idkelas_fk`,`kelas`.`id_kelas` AS `id_kelas`,`kelas`.`kelas` AS `kelas`,`kelas`.`idtingkat_fk` AS `idtingkat_fk`,`kelas`.`idjurusan_fk` AS `idjurusan_fk`,`tingkat`.`id_tingkat` AS `id_tingkat`,`tingkat`.`tingkat` AS `tingkat`,`jurusan`.`id_jurusan` AS `id_jurusan`,`jurusan`.`jurusan` AS `jurusan`,`jurusan`.`singkatan` AS `singkatan` from (((`wali_kelas` left join `kelas` on(`wali_kelas`.`idkelas_fk` = `kelas`.`id_kelas`)) left join `tingkat` on(`kelas`.`idtingkat_fk` = `tingkat`.`id_tingkat`)) left join `jurusan` on(`kelas`.`idjurusan_fk` = `jurusan`.`id_jurusan`)) ;

-- ----------------------------
-- Triggers structure for table pemasukan_lain
-- ----------------------------
DROP TRIGGER IF EXISTS `jurnal_pemasukan`;
delimiter ;;
CREATE TRIGGER `jurnal_pemasukan` AFTER INSERT ON `pemasukan_lain` FOR EACH ROW BEGIN
-- 	Debit
	INSERT into jurnal_umum(ref, idakun_fk, debit, kredit, keterangan, jurnal_umum.table, idtable_fk) VALUES (new.trans_code, new.akun_kas, new.total, 0, new.keterangan, "pemasukan_lain", new.id_pemasukan_lain);
-- 	Kredit
	INSERT into jurnal_umum(ref, idakun_fk, debit, kredit, keterangan, jurnal_umum.table, idtable_fk) VALUES (new.trans_code, new.akun_beban, 0, new.total, new.keterangan, "pemasukan_lain", new.id_pemasukan_lain);

END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table penerimaan
-- ----------------------------
DROP TRIGGER IF EXISTS `delete_jurnal_umum_from_penerimaan`;
delimiter ;;
CREATE TRIGGER `delete_jurnal_umum_from_penerimaan` AFTER DELETE ON `penerimaan` FOR EACH ROW BEGIN
		delete from jurnal_umum where jurnal_umum.table = "penerimaan" and idtable_fk=old.id_penerimaan;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table pengeluaran_lain
-- ----------------------------
DROP TRIGGER IF EXISTS `jurnal`;
delimiter ;;
CREATE TRIGGER `jurnal` AFTER INSERT ON `pengeluaran_lain` FOR EACH ROW BEGIN
-- 	Debit
	INSERT into jurnal_umum(ref, idakun_fk, debit, kredit, keterangan, jurnal_umum.table, idtable_fk) VALUES (new.trans_code, new.jenis, new.total, 0, new.keterangan, "pengeluaran_lain", new.id_pengeluaran_lain);
-- 	Kredit
	INSERT into jurnal_umum(ref, idakun_fk, debit, kredit, keterangan, jurnal_umum.table, idtable_fk) VALUES (new.trans_code, new.jenis_kas, 0, new.total, new.keterangan, "pengeluaran_lain", new.id_pengeluaran_lain);

END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table tanggungan_alumni
-- ----------------------------
DROP TRIGGER IF EXISTS `update_jurnal_tanggungan_alumni`;
delimiter ;;
CREATE TRIGGER `update_jurnal_tanggungan_alumni` AFTER UPDATE ON `tanggungan_alumni` FOR EACH ROW BEGIN
-- 	Debit
	update jurnal_umum set debit = new.jumlah, idakun_fk = new.pendapatan where jurnal_umum.table = "tanggungan_alumni" and idtable_fk=old.id_tanggungan_alumni and kredit=0;
-- 	Kredit
	update jurnal_umum set kredit = new.jumlah, idakun_fk = new.piutang where jurnal_umum.table = "tanggungan_alumni" and idtable_fk=old.id_tanggungan_alumni and debit=0;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table tanggungan_alumni
-- ----------------------------
DROP TRIGGER IF EXISTS `delete_jurnal_tanggungan_alumni`;
delimiter ;;
CREATE TRIGGER `delete_jurnal_tanggungan_alumni` AFTER DELETE ON `tanggungan_alumni` FOR EACH ROW BEGIN
-- 	Debit
	delete from jurnal_umum where jurnal_umum.table = "tanggungan_alumni" and idtable_fk=old.id_tanggungan_alumni;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table tanggungan_siswa
-- ----------------------------
DROP TRIGGER IF EXISTS `update_jurnal`;
delimiter ;;
CREATE TRIGGER `update_jurnal` AFTER UPDATE ON `tanggungan_siswa` FOR EACH ROW BEGIN
-- 	Debit
	update jurnal_umum set debit = new.jumlah where jurnal_umum.table = "tanggungan" and idtable_fk=old.id_tanggungan_siswa and kredit=0;
-- 	Kredit
	update jurnal_umum set kredit = new.jumlah where jurnal_umum.table = "tanggungan" and idtable_fk=old.id_tanggungan_siswa and debit=0;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table tanggungan_siswa
-- ----------------------------
DROP TRIGGER IF EXISTS `delete_jurnal`;
delimiter ;;
CREATE TRIGGER `delete_jurnal` AFTER DELETE ON `tanggungan_siswa` FOR EACH ROW BEGIN
-- 	Debit
	delete from jurnal_umum where jurnal_umum.table = "tanggungan" and idtable_fk=old.id_tanggungan_siswa;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table transaksi_tanggungan_siswa
-- ----------------------------
DROP TRIGGER IF EXISTS `delete_trig`;
delimiter ;;
CREATE TRIGGER `delete_trig` AFTER DELETE ON `transaksi_tanggungan_siswa` FOR EACH ROW BEGIN
	delete from penerimaan where penerimaan.idsiswa_fk = old.idsiswa_fk and penerimaan.invoice=old.invoice;
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
