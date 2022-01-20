/*
 Navicat Premium Data Transfer

 Source Server         : xampp
 Source Server Type    : MySQL
 Source Server Version : 100138
 Source Host           : localhost:3306
 Source Schema         : edulite

 Target Server Type    : MySQL
 Target Server Version : 100138
 File Encoding         : 65001

 Date: 06/08/2021 15:44:38
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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for additional_setting
-- ----------------------------
DROP TABLE IF EXISTS `additional_setting`;
CREATE TABLE `additional_setting`  (
  `id_additional_setting` int(11) NOT NULL AUTO_INCREMENT,
  `key_add` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `value_add` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`id_additional_setting`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

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
  PRIMARY KEY (`id_akun`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of akun
-- ----------------------------
INSERT INTO `akun` VALUES (1, '1101', 'Kas', 1, 'D', '2020-12-11 16:39:34');
INSERT INTO `akun` VALUES (2, '1102', 'BANK', 1, 'D', '2020-12-11 16:39:44');
INSERT INTO `akun` VALUES (3, '1103', 'Deposito', 1, 'D', '2020-12-11 16:39:55');
INSERT INTO `akun` VALUES (4, '1104', 'Piutang', 1, 'D', '2020-12-11 16:40:04');
INSERT INTO `akun` VALUES (5, '1105', 'Perlengkapan', 1, 'D', '2020-12-11 16:40:12');
INSERT INTO `akun` VALUES (6, '1201', 'Aktiva Tetap', 2, 'D', '2020-12-11 16:40:39');
INSERT INTO `akun` VALUES (7, '1202', 'Penyusutan', 2, 'D', '2020-12-11 16:40:47');
INSERT INTO `akun` VALUES (8, '1203', 'Investasi', 2, 'D', '2020-12-11 16:40:58');
INSERT INTO `akun` VALUES (9, '2101', 'Hutang Usaha', 3, 'K', '2020-12-11 16:41:10');
INSERT INTO `akun` VALUES (10, '2102', 'Hutang Pajak', 3, 'K', '2020-12-11 16:41:22');
INSERT INTO `akun` VALUES (11, '2103', 'Kewajiban Lancar Lain', 3, 'K', '2020-12-11 16:41:35');
INSERT INTO `akun` VALUES (12, '2201', 'Hutang Pihak ke 3', 4, 'K', '2020-12-11 16:41:49');
INSERT INTO `akun` VALUES (13, '2202', 'Hutang Program Lain', 4, 'K', '2020-12-11 16:42:01');
INSERT INTO `akun` VALUES (14, '2203', 'Kewajiban Jangka Panjang Lain', 4, 'K', '2020-12-11 16:42:16');
INSERT INTO `akun` VALUES (15, '3101', 'Modal Usaha', 5, 'K', '2020-12-11 16:42:26');
INSERT INTO `akun` VALUES (16, '3102', 'Prive', 5, 'D', '2020-12-11 16:42:35');
INSERT INTO `akun` VALUES (17, '4101', 'Donasi', 6, 'D', '2020-12-11 16:42:47');
INSERT INTO `akun` VALUES (18, '4102', 'Sumbangan', 6, 'D', '2020-12-11 16:42:55');
INSERT INTO `akun` VALUES (19, '4201', 'Penghasilan Layanan', 7, 'K', '2020-12-11 16:43:12');
INSERT INTO `akun` VALUES (20, '4202', 'Pendapatan', 7, 'K', '2020-12-11 16:43:35');
INSERT INTO `akun` VALUES (21, '4301', 'Pendapatan Lain', 8, 'K', '2020-12-11 16:44:06');
INSERT INTO `akun` VALUES (22, '5101', 'Beban Gaji', 9, 'D', '2020-12-11 16:44:15');
INSERT INTO `akun` VALUES (23, '5102', 'Biaya Perjalanan', 9, 'D', '2020-12-11 16:44:27');
INSERT INTO `akun` VALUES (24, '5103', 'Biaya Kantor', 9, 'D', '2020-12-11 16:44:42');
INSERT INTO `akun` VALUES (25, '5104', 'Biaya Sewa', 9, 'D', '2020-12-11 16:44:52');
INSERT INTO `akun` VALUES (26, '5105', 'Biaya Pemeliharaan', 9, 'D', '2020-12-11 16:45:02');
INSERT INTO `akun` VALUES (27, '5106', 'Biaya Rapat', 9, 'D', '2020-12-11 16:45:14');
INSERT INTO `akun` VALUES (28, '5107', 'Biaya Lain', 9, 'D', '2020-12-11 16:45:20');

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
  PRIMARY KEY (`id_alumni`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of alumni
-- ----------------------------
INSERT INTO `alumni` VALUES (1, 'AHMAT BUSTHONUL FAIZIN  ', '2021', '-', '-', '-', '-', '-', '-', '2021-08-05 13:00:20', '112.68899050859909', '-7.988527037389827');

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

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
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

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
) ENGINE = InnoDB AUTO_INCREMENT = 146 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of component_penilaian_kinerja_guru
-- ----------------------------
INSERT INTO `component_penilaian_kinerja_guru` VALUES (4, 2, 1, 1);
INSERT INTO `component_penilaian_kinerja_guru` VALUES (5, 2, 2, 2);
INSERT INTO `component_penilaian_kinerja_guru` VALUES (6, 2, 3, 1);
INSERT INTO `component_penilaian_kinerja_guru` VALUES (7, 2, 4, 1);
INSERT INTO `component_penilaian_kinerja_guru` VALUES (8, 2, 5, 2);
INSERT INTO `component_penilaian_kinerja_guru` VALUES (9, 2, 6, 3);
INSERT INTO `component_penilaian_kinerja_guru` VALUES (10, 2, 7, 4);
INSERT INTO `component_penilaian_kinerja_guru` VALUES (11, 2, 8, 4);
INSERT INTO `component_penilaian_kinerja_guru` VALUES (12, 2, 9, 2);
INSERT INTO `component_penilaian_kinerja_guru` VALUES (13, 2, 10, 3);
INSERT INTO `component_penilaian_kinerja_guru` VALUES (14, 2, 11, 1);
INSERT INTO `component_penilaian_kinerja_guru` VALUES (15, 2, 12, 1);
INSERT INTO `component_penilaian_kinerja_guru` VALUES (16, 2, 13, 2);
INSERT INTO `component_penilaian_kinerja_guru` VALUES (17, 2, 14, 1);
INSERT INTO `component_penilaian_kinerja_guru` VALUES (18, 3, 1, 2);
INSERT INTO `component_penilaian_kinerja_guru` VALUES (19, 3, 2, 1);
INSERT INTO `component_penilaian_kinerja_guru` VALUES (20, 3, 3, 3);
INSERT INTO `component_penilaian_kinerja_guru` VALUES (21, 3, 4, 4);
INSERT INTO `component_penilaian_kinerja_guru` VALUES (22, 3, 5, 4);
INSERT INTO `component_penilaian_kinerja_guru` VALUES (23, 3, 6, 2);
INSERT INTO `component_penilaian_kinerja_guru` VALUES (24, 3, 7, 4);
INSERT INTO `component_penilaian_kinerja_guru` VALUES (25, 3, 8, 3);
INSERT INTO `component_penilaian_kinerja_guru` VALUES (26, 3, 9, 1);
INSERT INTO `component_penilaian_kinerja_guru` VALUES (27, 3, 10, 2);
INSERT INTO `component_penilaian_kinerja_guru` VALUES (28, 3, 11, 2);
INSERT INTO `component_penilaian_kinerja_guru` VALUES (29, 3, 12, 3);
INSERT INTO `component_penilaian_kinerja_guru` VALUES (30, 3, 13, 4);
INSERT INTO `component_penilaian_kinerja_guru` VALUES (31, 3, 14, 4);
INSERT INTO `component_penilaian_kinerja_guru` VALUES (32, 4, 1, 0);
INSERT INTO `component_penilaian_kinerja_guru` VALUES (33, 4, 2, 0);
INSERT INTO `component_penilaian_kinerja_guru` VALUES (34, 4, 3, 0);
INSERT INTO `component_penilaian_kinerja_guru` VALUES (35, 4, 4, 0);
INSERT INTO `component_penilaian_kinerja_guru` VALUES (36, 4, 5, 0);
INSERT INTO `component_penilaian_kinerja_guru` VALUES (37, 4, 6, 0);
INSERT INTO `component_penilaian_kinerja_guru` VALUES (38, 4, 7, 0);
INSERT INTO `component_penilaian_kinerja_guru` VALUES (39, 4, 8, 0);
INSERT INTO `component_penilaian_kinerja_guru` VALUES (40, 4, 9, 0);
INSERT INTO `component_penilaian_kinerja_guru` VALUES (41, 4, 10, 0);
INSERT INTO `component_penilaian_kinerja_guru` VALUES (42, 4, 11, 0);
INSERT INTO `component_penilaian_kinerja_guru` VALUES (43, 4, 12, 0);
INSERT INTO `component_penilaian_kinerja_guru` VALUES (44, 4, 13, 0);
INSERT INTO `component_penilaian_kinerja_guru` VALUES (45, 4, 14, 0);
INSERT INTO `component_penilaian_kinerja_guru` VALUES (46, 5, 1, 4);
INSERT INTO `component_penilaian_kinerja_guru` VALUES (47, 5, 2, 4);
INSERT INTO `component_penilaian_kinerja_guru` VALUES (48, 5, 3, 4);
INSERT INTO `component_penilaian_kinerja_guru` VALUES (49, 5, 4, 4);
INSERT INTO `component_penilaian_kinerja_guru` VALUES (50, 5, 5, 4);
INSERT INTO `component_penilaian_kinerja_guru` VALUES (51, 5, 6, 4);
INSERT INTO `component_penilaian_kinerja_guru` VALUES (52, 5, 7, 4);
INSERT INTO `component_penilaian_kinerja_guru` VALUES (53, 5, 8, 4);
INSERT INTO `component_penilaian_kinerja_guru` VALUES (54, 5, 9, 4);
INSERT INTO `component_penilaian_kinerja_guru` VALUES (55, 5, 10, 4);
INSERT INTO `component_penilaian_kinerja_guru` VALUES (56, 5, 11, 4);
INSERT INTO `component_penilaian_kinerja_guru` VALUES (57, 5, 12, 4);
INSERT INTO `component_penilaian_kinerja_guru` VALUES (58, 5, 13, 4);
INSERT INTO `component_penilaian_kinerja_guru` VALUES (59, 5, 14, 4);
INSERT INTO `component_penilaian_kinerja_guru` VALUES (60, 6, 1, 3);
INSERT INTO `component_penilaian_kinerja_guru` VALUES (61, 6, 2, 3);
INSERT INTO `component_penilaian_kinerja_guru` VALUES (62, 6, 3, 3);
INSERT INTO `component_penilaian_kinerja_guru` VALUES (63, 6, 4, 3);
INSERT INTO `component_penilaian_kinerja_guru` VALUES (64, 6, 5, 3);
INSERT INTO `component_penilaian_kinerja_guru` VALUES (65, 6, 6, 3);
INSERT INTO `component_penilaian_kinerja_guru` VALUES (66, 6, 7, 3);
INSERT INTO `component_penilaian_kinerja_guru` VALUES (67, 6, 8, 4);
INSERT INTO `component_penilaian_kinerja_guru` VALUES (68, 6, 9, 4);
INSERT INTO `component_penilaian_kinerja_guru` VALUES (69, 6, 10, 4);
INSERT INTO `component_penilaian_kinerja_guru` VALUES (70, 6, 11, 4);
INSERT INTO `component_penilaian_kinerja_guru` VALUES (71, 6, 12, 3);
INSERT INTO `component_penilaian_kinerja_guru` VALUES (72, 6, 13, 4);
INSERT INTO `component_penilaian_kinerja_guru` VALUES (73, 6, 14, 3);
INSERT INTO `component_penilaian_kinerja_guru` VALUES (88, 8, 1, 3);
INSERT INTO `component_penilaian_kinerja_guru` VALUES (89, 8, 2, 4);
INSERT INTO `component_penilaian_kinerja_guru` VALUES (90, 8, 3, 4);
INSERT INTO `component_penilaian_kinerja_guru` VALUES (91, 8, 4, 4);
INSERT INTO `component_penilaian_kinerja_guru` VALUES (92, 8, 5, 3);
INSERT INTO `component_penilaian_kinerja_guru` VALUES (93, 8, 6, 4);
INSERT INTO `component_penilaian_kinerja_guru` VALUES (94, 8, 7, 4);
INSERT INTO `component_penilaian_kinerja_guru` VALUES (95, 8, 8, 4);
INSERT INTO `component_penilaian_kinerja_guru` VALUES (96, 8, 9, 3);
INSERT INTO `component_penilaian_kinerja_guru` VALUES (97, 8, 10, 3);
INSERT INTO `component_penilaian_kinerja_guru` VALUES (98, 8, 11, 4);
INSERT INTO `component_penilaian_kinerja_guru` VALUES (99, 8, 12, 4);
INSERT INTO `component_penilaian_kinerja_guru` VALUES (100, 8, 13, 4);
INSERT INTO `component_penilaian_kinerja_guru` VALUES (101, 8, 14, 3);
INSERT INTO `component_penilaian_kinerja_guru` VALUES (102, 9, 1, 3);
INSERT INTO `component_penilaian_kinerja_guru` VALUES (103, 9, 2, 4);
INSERT INTO `component_penilaian_kinerja_guru` VALUES (104, 9, 3, 4);
INSERT INTO `component_penilaian_kinerja_guru` VALUES (105, 9, 4, 3);
INSERT INTO `component_penilaian_kinerja_guru` VALUES (106, 9, 5, 4);
INSERT INTO `component_penilaian_kinerja_guru` VALUES (107, 9, 6, 4);
INSERT INTO `component_penilaian_kinerja_guru` VALUES (108, 9, 7, 3);
INSERT INTO `component_penilaian_kinerja_guru` VALUES (109, 9, 8, 3);
INSERT INTO `component_penilaian_kinerja_guru` VALUES (110, 9, 9, 4);
INSERT INTO `component_penilaian_kinerja_guru` VALUES (111, 9, 10, 3);
INSERT INTO `component_penilaian_kinerja_guru` VALUES (112, 9, 11, 4);
INSERT INTO `component_penilaian_kinerja_guru` VALUES (113, 9, 12, 4);
INSERT INTO `component_penilaian_kinerja_guru` VALUES (114, 9, 13, 4);
INSERT INTO `component_penilaian_kinerja_guru` VALUES (115, 9, 14, 3);
INSERT INTO `component_penilaian_kinerja_guru` VALUES (116, 10, 1, 4);
INSERT INTO `component_penilaian_kinerja_guru` VALUES (117, 10, 2, 4);
INSERT INTO `component_penilaian_kinerja_guru` VALUES (118, 10, 3, 4);
INSERT INTO `component_penilaian_kinerja_guru` VALUES (119, 10, 4, 4);
INSERT INTO `component_penilaian_kinerja_guru` VALUES (120, 10, 5, 4);
INSERT INTO `component_penilaian_kinerja_guru` VALUES (121, 10, 6, 4);
INSERT INTO `component_penilaian_kinerja_guru` VALUES (122, 10, 7, 4);
INSERT INTO `component_penilaian_kinerja_guru` VALUES (123, 10, 8, 4);
INSERT INTO `component_penilaian_kinerja_guru` VALUES (124, 10, 9, 4);
INSERT INTO `component_penilaian_kinerja_guru` VALUES (125, 10, 10, 4);
INSERT INTO `component_penilaian_kinerja_guru` VALUES (126, 10, 11, 4);
INSERT INTO `component_penilaian_kinerja_guru` VALUES (127, 10, 12, 4);
INSERT INTO `component_penilaian_kinerja_guru` VALUES (128, 10, 13, 4);
INSERT INTO `component_penilaian_kinerja_guru` VALUES (129, 10, 14, 4);
INSERT INTO `component_penilaian_kinerja_guru` VALUES (130, 11, 1, 1);
INSERT INTO `component_penilaian_kinerja_guru` VALUES (131, 11, 2, 3);
INSERT INTO `component_penilaian_kinerja_guru` VALUES (132, 11, 3, 4);
INSERT INTO `component_penilaian_kinerja_guru` VALUES (133, 11, 4, 4);
INSERT INTO `component_penilaian_kinerja_guru` VALUES (134, 11, 5, 3);
INSERT INTO `component_penilaian_kinerja_guru` VALUES (135, 11, 6, 1);
INSERT INTO `component_penilaian_kinerja_guru` VALUES (136, 11, 7, 4);
INSERT INTO `component_penilaian_kinerja_guru` VALUES (137, 11, 8, 2);
INSERT INTO `component_penilaian_kinerja_guru` VALUES (138, 11, 9, 4);
INSERT INTO `component_penilaian_kinerja_guru` VALUES (139, 11, 10, 2);
INSERT INTO `component_penilaian_kinerja_guru` VALUES (140, 11, 11, 3);
INSERT INTO `component_penilaian_kinerja_guru` VALUES (141, 11, 12, 4);
INSERT INTO `component_penilaian_kinerja_guru` VALUES (142, 11, 13, 2);
INSERT INTO `component_penilaian_kinerja_guru` VALUES (143, 11, 14, 4);
INSERT INTO `component_penilaian_kinerja_guru` VALUES (144, 11, 15, 2);
INSERT INTO `component_penilaian_kinerja_guru` VALUES (145, 11, 16, 4);

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of erapor
-- ----------------------------
INSERT INTO `erapor` VALUES (1, '2021-07-09', '2021-07-16', 'ABS123', 1, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 67 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of file_oas
-- ----------------------------
INSERT INTO `file_oas` VALUES (2, '48376309fa70987e9232b2dea0e00462.pdf', 254, 1, 0);
INSERT INTO `file_oas` VALUES (3, 'c3762953304fdace1e208b36f3d22e17.pdf', 225, 1, 0);
INSERT INTO `file_oas` VALUES (4, '9c2d8f0505c4d143b505e24bf8315ef1.pdf', 242, 1, 0);
INSERT INTO `file_oas` VALUES (5, '96a948faf1078ee87db18272fad3138b.pdf', 250, 0, 0);
INSERT INTO `file_oas` VALUES (6, 'b7c941a14d827a605c338025b2e0c946.pdf', 232, 1, 0);
INSERT INTO `file_oas` VALUES (7, '9aedac81514d16236fb11f546621108b.pdf', 230, 1, 0);
INSERT INTO `file_oas` VALUES (8, '801233201e91dc0b9887d8a288560f1d.pdf', 224, 1, 0);
INSERT INTO `file_oas` VALUES (9, '2b62a56f62ae061d288619dc0048b16c.pdf', 218, 1, 0);
INSERT INTO `file_oas` VALUES (10, 'd044eca454a442d5fee095afd9ca39ba.pdf', 221, 1, 0);
INSERT INTO `file_oas` VALUES (11, '1da6907ae52f3af1e7a8bec7fa670a17.pdf', 240, 1, 0);
INSERT INTO `file_oas` VALUES (12, '2abcda9dfe878e40d45388bbba357d90.pdf', 229, 1, 0);
INSERT INTO `file_oas` VALUES (13, 'bbd65c39b6316c6fb6d06dbe33fb1fea.pdf', 211, 1, 0);
INSERT INTO `file_oas` VALUES (14, '00d5a600c59e53683ea664ac5ee0a90e.pdf', 233, 1, 0);
INSERT INTO `file_oas` VALUES (15, 'd9f2aabc4b5a84732026e18f54970678.pdf', 222, 1, 0);
INSERT INTO `file_oas` VALUES (16, 'f4bb3db65c1d9fc5a4c0bcc5e84b6c0f.pdf', 243, 1, 0);
INSERT INTO `file_oas` VALUES (17, '1e9f92b8c2c2121df31831d734502c87.pdf', 212, 1, 0);
INSERT INTO `file_oas` VALUES (18, 'f7c7bd96347ce98f1fc128759ccd50f1.pdf', 231, 1, 0);
INSERT INTO `file_oas` VALUES (19, '05772efb116aaa66d5f6037c228682fa.pdf', 248, 1, 0);
INSERT INTO `file_oas` VALUES (20, 'bc63d172c9c0edf0d31055b7b538ca48.pdf', 228, 1, 0);
INSERT INTO `file_oas` VALUES (21, 'd9ee56efaf020d5bf121d32ea6548c9d.pdf', 223, 1, 0);
INSERT INTO `file_oas` VALUES (22, '432609777ca3daa898302a95d2843760.pdf', 238, 1, 0);
INSERT INTO `file_oas` VALUES (23, '04b05e92bdd2e9f6de157d7f96b32c8a.pdf', 216, 1, 0);
INSERT INTO `file_oas` VALUES (24, 'd356db7a728142c63b50163c474756db.pdf', 220, 1, 0);
INSERT INTO `file_oas` VALUES (25, '6666754ac92a51324bf3a6952d546b1c.pdf', 244, 1, 0);
INSERT INTO `file_oas` VALUES (26, '47b5e7d87d846348a74239dda6727d8a.pdf', 246, 1, 0);
INSERT INTO `file_oas` VALUES (27, 'f0b15fd6a15ba97ba79e26c5d16f819b.pdf', 249, 1, 0);
INSERT INTO `file_oas` VALUES (28, 'bb37f3868f46e62186202083314b6c7b.pdf', 237, 1, 1);
INSERT INTO `file_oas` VALUES (29, '705d2ff6167b2651f13809f75bc0fd08.pdf', 215, 1, 0);
INSERT INTO `file_oas` VALUES (30, 'fe569ca2e9f4bdba6c3522a0af175d8c.pdf', 234, 1, 0);
INSERT INTO `file_oas` VALUES (31, '5d280e2efd1ede90fe9c73c4cd03d140.pdf', 239, 1, 0);
INSERT INTO `file_oas` VALUES (32, '4ceceffcdf6377d4955cfd9d1028e581.pdf', 214, 1, 0);
INSERT INTO `file_oas` VALUES (33, '1e0fbeea2c6f43d5b12f2477ff3fd982.pdf', 236, 1, 0);
INSERT INTO `file_oas` VALUES (34, '9f9bee7f33f8f71c62520beef1b8fcce.pdf', 217, 1, 0);
INSERT INTO `file_oas` VALUES (35, 'a9fb46c9877a8db7aa7c46576506bc69.pdf', 247, 1, 0);
INSERT INTO `file_oas` VALUES (36, '1a68f1564488613ff7efe3b208f2012e.pdf', 251, 1, 0);
INSERT INTO `file_oas` VALUES (37, '64bdf0af947d7a3f6c286bd65d763e97.pdf', 226, 1, 0);
INSERT INTO `file_oas` VALUES (38, '60ffca2945a0cd96286e340aa5f58205.pdf', 253, 1, 0);
INSERT INTO `file_oas` VALUES (39, 'c093cc0faa38d62ef2c5ac099f8b9105.pdf', 227, 1, 0);
INSERT INTO `file_oas` VALUES (40, '886bfb7632ba438623d1a9f0af54b3aa.pdf', 241, 1, 1);
INSERT INTO `file_oas` VALUES (41, '174e45a01ef7085391dc15ea6c9a999e.pdf', 213, 1, 1);
INSERT INTO `file_oas` VALUES (42, '409cf96dbc3f6bba0e468c9939424a02.pdf', 252, 1, 1);
INSERT INTO `file_oas` VALUES (43, 'b66741d8e6b6b409922f25575d985c1e.pdf', 219, 1, 1);
INSERT INTO `file_oas` VALUES (45, 'ebe3ec29beb9c6ca277ee45c349a0b78.pdf', 245, 1, 0);
INSERT INTO `file_oas` VALUES (46, '2304b0dc5a926f03f32a3e8841ceee22.pdf', 235, 0, 0);
INSERT INTO `file_oas` VALUES (47, 'f22d75eb634b6a3b9e55552a399717c1.pdf', 262, 1, 0);
INSERT INTO `file_oas` VALUES (48, 'a395d278a293f9a4a89b54c6d312c03c.pdf', 268, 1, 0);
INSERT INTO `file_oas` VALUES (49, '7d837c5b1ad638ac5f05de013e272a75.pdf', 269, 1, 0);
INSERT INTO `file_oas` VALUES (50, '8201af862d496e1860bdf76e5dd1c0a5.pdf', 265, 1, 0);
INSERT INTO `file_oas` VALUES (51, '08fffcf6a09640cacf6c56295ab9c46f.pdf', 267, 1, 0);
INSERT INTO `file_oas` VALUES (52, '4b60c131d928afcd38a685fec7244883.pdf', 259, 1, 0);
INSERT INTO `file_oas` VALUES (53, '81488e029cea93338954c463b1217d07.pdf', 260, 1, 0);
INSERT INTO `file_oas` VALUES (54, 'f4f46aa4742565c67161a55a43fee069.pdf', 266, 1, 0);
INSERT INTO `file_oas` VALUES (55, '34686ddcd904c344dcb0bf8a5f7b4804.pdf', 258, 1, 0);
INSERT INTO `file_oas` VALUES (56, 'cfbefb44c525a100ddb0bfb586a43eb6.pdf', 257, 1, 0);
INSERT INTO `file_oas` VALUES (57, '77bb43940608e6dc3c1bc7500df09d3a.pdf', 261, 1, 0);
INSERT INTO `file_oas` VALUES (58, '92ab4f71ed76a72ca7a30deb735981a2.pdf', 263, 1, 0);
INSERT INTO `file_oas` VALUES (59, '1d957fb39dcde762131f1aed65b4b4dc.pdf', 264, 1, 1);
INSERT INTO `file_oas` VALUES (60, '8db76ab88e5c9d05b20e98d31690b230.pdf', 256, 1, 1);
INSERT INTO `file_oas` VALUES (61, 'baf1ab0eb277d4588acba10d700ab94d.pdf', 255, 1, 0);
INSERT INTO `file_oas` VALUES (62, '446b9cb08fdc919f8c7bb612f0b3798b.pdf', 270, 1, 0);
INSERT INTO `file_oas` VALUES (63, '33e9cfe21eb97bae2ddfbb393a944d57.pdf', 271, 0, 0);
INSERT INTO `file_oas` VALUES (64, '36a4c2eaea385843d0bed7d98df5cfa4.pdf', 272, 1, 0);
INSERT INTO `file_oas` VALUES (65, '1e6aae2d98580e710b55621e42671996.pdf', 273, 1, 0);
INSERT INTO `file_oas` VALUES (66, 'e75973edd6480b9db5e69d57ebefc0f2.pdf', 274, 1, 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for groups
-- ----------------------------
DROP TABLE IF EXISTS `groups`;
CREATE TABLE `groups`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

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
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of guru
-- ----------------------------
INSERT INTO `guru` VALUES (2, 'Rendy Yani Susanto, S.Pd', '17', 'Malang', '51740b7253b0915e7878b8690ff38b3c.jpg', 'S1', 'Universitas Brawijaya', 'Rendy', 'rendy', 'rendy', 'rendy', 'Guru dan Programmer', 'rendy@smkitasy-syadzili.sch.id', '6285894632505', 'Laki-laki', 'Malang', 'Islam', 'WNI', 'Kawin', 'Rumah Kos', 0, 0, 0, 'O', '', '', '', '0000-00-00', '', '', '', 'K001', 'Cicik Winarsih', 'Non PNS', '', '1993-10-03');
INSERT INTO `guru` VALUES (6, 'Abdur Rochim, S.Pd.', '1', 'Singosari', '148554d23346ab57fd47490df87182f0.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Abdurrochim@gmail.com', '', 'Laki-laki', 'Malang', 'Islam', 'WNA', 'Kawin', 'Rumah Kos', 0, 0, 0, 'O', '', '', '', '0000-00-00', '', '', '', 'K002', '', 'Non PNS', '', '0000-00-00');
INSERT INTO `guru` VALUES (7, 'Avi Hendratmoko, S.Kom.\r\n', '9', 'Dsn Prapatan RT 038 RW 005 Tulusbesar Kec. Tumpang Kab. Malang Jawa Timur', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'K003', NULL, NULL, NULL, NULL);
INSERT INTO `guru` VALUES (8, 'M. Maimun Muzakka\r\n', '14', 'malang', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'K004', NULL, NULL, NULL, NULL);
INSERT INTO `guru` VALUES (9, 'Cindy Permata Putri, S.Pd', '15', 'Bugis, Saptorenggo', 'bucin.jpg', 'S1', 'IKIP Budi Utomo', '-', 'https://www.instagram.com/cindyputrii95/', 'Cindy', '-', 'Guru Bahasa Indonesia', 'Cindy@smkitasy-syadzili.sch.id', '6285895839663', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'K005', NULL, NULL, NULL, NULL);
INSERT INTO `guru` VALUES (10, 'Roikhatul Uzza, S.Psi', '8', 'Sumberpasir', 'd43b026404c6b899e49445366e8c1b06.jpg', 'S1', 'Universitas Islam', 'https://www.facebook.com/izzaclalu.dia', 'https://www.instagram.com/izza.sr/', NULL, NULL, 'Bimbingan Konseling', 'izza@smkitasy-syadzili.sch.id', '6283175798727', 'Laki-laki', '', 'Islam', 'WNA', 'Kawin', 'Rumah Pribadi', 0, 0, 0, 'A', '', '', '', '0000-00-00', '', '', '', 'K006', '', 'Non PNS', '', '0000-00-00');
INSERT INTO `guru` VALUES (11, 'Refita Fardiani', '16', 'Malang', 'burev.jpg', NULL, NULL, NULL, 'https://www.instagram.com/refhii_01/', NULL, NULL, 'Tata Usaha', 'refita@smkitasy-syadzili.sch.id', '6285645230304', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'K007', NULL, NULL, NULL, NULL);
INSERT INTO `guru` VALUES (12, 'Nur Cholis, S.Pdi', '11', 'Malang', 'bunur.jpg', 'S1', NULL, NULL, NULL, NULL, NULL, 'Guru Pendidikan Agama Islam', 'nur@smkitasy-syadzili.sch.id', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'K008', NULL, NULL, NULL, NULL);
INSERT INTO `guru` VALUES (13, 'Pohet Bintoto, S.Pd., M.Si.\r\n', '2', NULL, '8.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'K009', NULL, NULL, NULL, NULL);
INSERT INTO `guru` VALUES (14, 'Mohammad Nazibullah, M.Pd.\r\n', '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'K010', NULL, NULL, NULL, NULL);
INSERT INTO `guru` VALUES (15, 'Syamsul Arifin, S.Pd.\r\n', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'K011', NULL, NULL, NULL, NULL);
INSERT INTO `guru` VALUES (16, 'M. Mirza Ayatulloh, S.Psi.\r\n', '5', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'K012', NULL, NULL, NULL, NULL);
INSERT INTO `guru` VALUES (17, 'Sutan Taufik, S.Hum\r\n', '6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'K013', NULL, NULL, NULL, NULL);
INSERT INTO `guru` VALUES (18, 'Fatat Alvin D. N. S.\r\n', '7', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'K014', NULL, NULL, NULL, NULL);
INSERT INTO `guru` VALUES (19, 'Nailatur Rizqiyah S.P.', '10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'K015', NULL, NULL, NULL, NULL);
INSERT INTO `guru` VALUES (20, 'Saifudin Mansur, S.TP\r\n', '12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'K016', NULL, NULL, NULL, NULL);
INSERT INTO `guru` VALUES (21, 'Faridatuz Zakiyah, S.TP\r\n', '13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'K017', NULL, NULL, NULL, NULL);
INSERT INTO `guru` VALUES (22, 'Ega Kurniawan', '18', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', 'Laki-laki', '', 'Islam', 'WNA', 'Kawin', 'Rumah Pribadi', 0, 0, 0, 'A', '', '', '', '0000-00-00', '', '', '', 'K018', '', 'Non PNS', '', '0000-00-00');
INSERT INTO `guru` VALUES (23, 'A. Faldiansyah Havis B', '19', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', 'Laki-laki', '', 'Islam', 'WNA', 'Kawin', 'Rumah Pribadi', 0, 0, 0, 'A', '', '', '', '0000-00-00', '', '', '', 'K019', '', 'Non PNS', '', '0000-00-00');
INSERT INTO `guru` VALUES (24, 'Muhammad Ali Saifudin, S.Pd.', '18', '', 'd52da1e8b624f76abcce806a0a1b4470.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', 'Laki-laki', 'Malang', 'Islam', 'WNI', 'Kawin', 'Rumah Kos', 0, 0, 0, 'O', '', '', '', '0000-00-00', '', '', '', 'K020', '', 'Non PNS', '', '0000-00-00');
INSERT INTO `guru` VALUES (25, 'M. Faiz Zidni Mubarok, S.Pt\r\n', '19', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'K021', NULL, NULL, NULL, NULL);
INSERT INTO `guru` VALUES (26, 'Andiani Kristanti, S.Pd', '20', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', 'Perempuan', '', 'Islam', 'WNI', 'Kawin', 'Rumah Pribadi', 0, 0, 0, 'A', '', '', '', '0000-00-00', '', '', '', 'K022', '', 'Non PNS', '', '0000-00-00');
INSERT INTO `guru` VALUES (27, 'Nur Azizah\r\n', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'K023', NULL, NULL, NULL, NULL);
INSERT INTO `guru` VALUES (28, 'Nadya Anastasya Paramita, S.Or', '21', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', 'Perempuan', '', 'Islam', 'WNI', 'Kawin', 'Rumah Pribadi', 0, 0, 0, 'A', '', '', '', '0000-00-00', '', '', '', 'G68099', '', 'PNS', '', '0000-00-00');
INSERT INTO `guru` VALUES (29, 'Zein Iqbal Zarkasi, S.Pd.', '23', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', 'Laki-laki', '', 'Islam', 'WNI', 'Kawin', 'Rumah Pribadi', 0, 0, 0, 'A', '', '', '', '0000-00-00', '', '', '', 'G5961', '', 'PNS', '', '0000-00-00');
INSERT INTO `guru` VALUES (30, 'Na\'ilah Fauziyah, S.Pd.', '22', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', 'Perempuan', '', 'Islam', 'WNI', 'Kawin', 'Rumah Pribadi', 0, 0, 0, 'A', '', '', '', '0000-00-00', '', '', '', 'G772835', '', 'PNS', '', '0000-00-00');
INSERT INTO `guru` VALUES (31, 'Joko Dwi Pitono, S.Pd.', '24', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', 'Laki-laki', '', 'Islam', 'WNI', 'Kawin', 'Rumah Pribadi', 0, 0, 0, 'A', '', '', '', '0000-00-00', '', '', '', 'G97171', '', 'PNS', '', '0000-00-00');

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
) ENGINE = InnoDB AUTO_INCREMENT = 373 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of guru_mapel
-- ----------------------------
INSERT INTO `guru_mapel` VALUES (207, 13, 34, 3, 34, NULL);
INSERT INTO `guru_mapel` VALUES (208, 13, 36, 3, 32, NULL);
INSERT INTO `guru_mapel` VALUES (209, 13, 36, 3, 33, NULL);
INSERT INTO `guru_mapel` VALUES (210, 13, 32, 3, 25, NULL);
INSERT INTO `guru_mapel` VALUES (211, 13, 32, 3, 26, NULL);
INSERT INTO `guru_mapel` VALUES (212, 13, 32, 3, 37, NULL);
INSERT INTO `guru_mapel` VALUES (213, 13, 32, 3, 38, NULL);
INSERT INTO `guru_mapel` VALUES (214, 13, 32, 3, 27, NULL);
INSERT INTO `guru_mapel` VALUES (215, 13, 32, 3, 28, NULL);
INSERT INTO `guru_mapel` VALUES (216, 13, 32, 3, 29, NULL);
INSERT INTO `guru_mapel` VALUES (217, 13, 32, 3, 30, NULL);
INSERT INTO `guru_mapel` VALUES (218, 13, 32, 3, 31, NULL);
INSERT INTO `guru_mapel` VALUES (219, 13, 32, 3, 35, NULL);
INSERT INTO `guru_mapel` VALUES (220, 13, 32, 3, 36, NULL);
INSERT INTO `guru_mapel` VALUES (221, 13, 32, 3, 32, NULL);
INSERT INTO `guru_mapel` VALUES (222, 13, 32, 3, 33, NULL);
INSERT INTO `guru_mapel` VALUES (223, 13, 32, 3, 34, NULL);
INSERT INTO `guru_mapel` VALUES (224, 14, 40, 3, 25, NULL);
INSERT INTO `guru_mapel` VALUES (225, 14, 40, 3, 26, NULL);
INSERT INTO `guru_mapel` VALUES (226, 14, 40, 3, 28, NULL);
INSERT INTO `guru_mapel` VALUES (227, 14, 40, 3, 29, NULL);
INSERT INTO `guru_mapel` VALUES (228, 14, 40, 3, 30, NULL);
INSERT INTO `guru_mapel` VALUES (229, 14, 40, 3, 31, NULL);
INSERT INTO `guru_mapel` VALUES (230, 14, 43, 3, 28, NULL);
INSERT INTO `guru_mapel` VALUES (231, 14, 43, 3, 29, NULL);
INSERT INTO `guru_mapel` VALUES (232, 14, 43, 3, 30, NULL);
INSERT INTO `guru_mapel` VALUES (233, 14, 43, 3, 31, NULL);
INSERT INTO `guru_mapel` VALUES (234, 14, 43, 3, 35, NULL);
INSERT INTO `guru_mapel` VALUES (236, 14, 43, 3, 32, NULL);
INSERT INTO `guru_mapel` VALUES (237, 14, 43, 3, 33, NULL);
INSERT INTO `guru_mapel` VALUES (238, 14, 43, 3, 34, NULL);
INSERT INTO `guru_mapel` VALUES (239, 14, 43, 3, 36, NULL);
INSERT INTO `guru_mapel` VALUES (240, 15, 44, 3, 25, NULL);
INSERT INTO `guru_mapel` VALUES (241, 15, 44, 3, 26, NULL);
INSERT INTO `guru_mapel` VALUES (242, 15, 44, 3, 28, NULL);
INSERT INTO `guru_mapel` VALUES (243, 15, 44, 3, 29, NULL);
INSERT INTO `guru_mapel` VALUES (244, 15, 44, 3, 30, NULL);
INSERT INTO `guru_mapel` VALUES (245, 15, 44, 3, 31, NULL);
INSERT INTO `guru_mapel` VALUES (246, 16, 36, 3, 29, NULL);
INSERT INTO `guru_mapel` VALUES (247, 16, 36, 3, 30, NULL);
INSERT INTO `guru_mapel` VALUES (248, 16, 36, 3, 31, NULL);
INSERT INTO `guru_mapel` VALUES (249, 16, 48, 3, 25, NULL);
INSERT INTO `guru_mapel` VALUES (250, 16, 48, 3, 26, NULL);
INSERT INTO `guru_mapel` VALUES (251, 16, 48, 3, 27, NULL);
INSERT INTO `guru_mapel` VALUES (252, 16, 48, 3, 37, NULL);
INSERT INTO `guru_mapel` VALUES (253, 16, 48, 3, 38, NULL);
INSERT INTO `guru_mapel` VALUES (254, 17, 32, 3, 25, NULL);
INSERT INTO `guru_mapel` VALUES (255, 17, 32, 3, 26, NULL);
INSERT INTO `guru_mapel` VALUES (256, 17, 32, 3, 27, NULL);
INSERT INTO `guru_mapel` VALUES (257, 17, 32, 3, 28, NULL);
INSERT INTO `guru_mapel` VALUES (258, 17, 32, 3, 29, NULL);
INSERT INTO `guru_mapel` VALUES (259, 17, 32, 3, 30, NULL);
INSERT INTO `guru_mapel` VALUES (260, 17, 32, 3, 31, NULL);
INSERT INTO `guru_mapel` VALUES (261, 17, 32, 3, 32, NULL);
INSERT INTO `guru_mapel` VALUES (262, 17, 32, 3, 33, NULL);
INSERT INTO `guru_mapel` VALUES (263, 17, 32, 3, 34, NULL);
INSERT INTO `guru_mapel` VALUES (264, 17, 32, 3, 35, NULL);
INSERT INTO `guru_mapel` VALUES (265, 17, 32, 3, 36, NULL);
INSERT INTO `guru_mapel` VALUES (266, 17, 32, 3, 37, NULL);
INSERT INTO `guru_mapel` VALUES (267, 17, 32, 3, 38, NULL);
INSERT INTO `guru_mapel` VALUES (268, 7, 58, 3, 25, NULL);
INSERT INTO `guru_mapel` VALUES (269, 7, 58, 3, 37, NULL);
INSERT INTO `guru_mapel` VALUES (270, 7, 60, 3, 28, NULL);
INSERT INTO `guru_mapel` VALUES (271, 7, 60, 3, 29, NULL);
INSERT INTO `guru_mapel` VALUES (272, 7, 60, 3, 30, NULL);
INSERT INTO `guru_mapel` VALUES (273, 7, 60, 3, 32, NULL);
INSERT INTO `guru_mapel` VALUES (274, 7, 63, 3, 26, NULL);
INSERT INTO `guru_mapel` VALUES (275, 7, 63, 3, 38, NULL);
INSERT INTO `guru_mapel` VALUES (276, 19, 65, 3, 27, NULL);
INSERT INTO `guru_mapel` VALUES (277, 19, 66, 3, 31, NULL);
INSERT INTO `guru_mapel` VALUES (278, 19, 66, 3, 36, NULL);
INSERT INTO `guru_mapel` VALUES (279, 19, 66, 3, 34, NULL);
INSERT INTO `guru_mapel` VALUES (280, 19, 69, 3, 34, NULL);
INSERT INTO `guru_mapel` VALUES (281, 9, 86, 3, 37, NULL);
INSERT INTO `guru_mapel` VALUES (283, 9, 86, 3, 38, NULL);
INSERT INTO `guru_mapel` VALUES (284, 9, 86, 3, 27, NULL);
INSERT INTO `guru_mapel` VALUES (285, 19, 72, 3, 36, NULL);
INSERT INTO `guru_mapel` VALUES (286, 9, 86, 3, 35, NULL);
INSERT INTO `guru_mapel` VALUES (287, 9, 86, 3, 36, NULL);
INSERT INTO `guru_mapel` VALUES (288, 9, 86, 3, 32, NULL);
INSERT INTO `guru_mapel` VALUES (289, 9, 86, 3, 33, NULL);
INSERT INTO `guru_mapel` VALUES (290, 9, 86, 3, 34, NULL);
INSERT INTO `guru_mapel` VALUES (291, 2, 89, 3, 25, NULL);
INSERT INTO `guru_mapel` VALUES (292, 2, 89, 3, 37, NULL);
INSERT INTO `guru_mapel` VALUES (293, 2, 60, 3, 33, NULL);
INSERT INTO `guru_mapel` VALUES (294, 2, 94, 3, 28, NULL);
INSERT INTO `guru_mapel` VALUES (295, 2, 94, 3, 29, NULL);
INSERT INTO `guru_mapel` VALUES (296, 2, 94, 3, 30, NULL);
INSERT INTO `guru_mapel` VALUES (297, 2, 94, 3, 32, NULL);
INSERT INTO `guru_mapel` VALUES (298, 2, 94, 3, 33, NULL);
INSERT INTO `guru_mapel` VALUES (299, 24, 34, 3, 25, NULL);
INSERT INTO `guru_mapel` VALUES (300, 24, 34, 3, 26, NULL);
INSERT INTO `guru_mapel` VALUES (301, 24, 34, 3, 27, NULL);
INSERT INTO `guru_mapel` VALUES (302, 24, 34, 3, 28, NULL);
INSERT INTO `guru_mapel` VALUES (303, 24, 34, 3, 29, NULL);
INSERT INTO `guru_mapel` VALUES (304, 24, 34, 3, 30, NULL);
INSERT INTO `guru_mapel` VALUES (305, 24, 34, 3, 31, NULL);
INSERT INTO `guru_mapel` VALUES (306, 24, 34, 3, 32, NULL);
INSERT INTO `guru_mapel` VALUES (307, 24, 34, 3, 33, NULL);
INSERT INTO `guru_mapel` VALUES (308, 19, 74, 3, 31, NULL);
INSERT INTO `guru_mapel` VALUES (309, 19, 74, 3, 36, NULL);
INSERT INTO `guru_mapel` VALUES (310, 24, 34, 3, 35, NULL);
INSERT INTO `guru_mapel` VALUES (311, 24, 34, 3, 36, NULL);
INSERT INTO `guru_mapel` VALUES (312, 24, 34, 3, 37, NULL);
INSERT INTO `guru_mapel` VALUES (313, 24, 34, 3, 38, NULL);
INSERT INTO `guru_mapel` VALUES (314, 19, 72, 3, 31, NULL);
INSERT INTO `guru_mapel` VALUES (315, 12, 60, 3, 31, NULL);
INSERT INTO `guru_mapel` VALUES (316, 20, 72, 3, 34, NULL);
INSERT INTO `guru_mapel` VALUES (317, 21, 74, 3, 34, NULL);
INSERT INTO `guru_mapel` VALUES (318, 25, 36, 3, 28, NULL);
INSERT INTO `guru_mapel` VALUES (319, 25, 60, 3, 36, NULL);
INSERT INTO `guru_mapel` VALUES (323, 8, 83, 3, 25, NULL);
INSERT INTO `guru_mapel` VALUES (324, 25, 69, 3, 31, NULL);
INSERT INTO `guru_mapel` VALUES (325, 8, 83, 3, 37, NULL);
INSERT INTO `guru_mapel` VALUES (327, 8, 84, 3, 28, NULL);
INSERT INTO `guru_mapel` VALUES (328, 25, 69, 3, 36, NULL);
INSERT INTO `guru_mapel` VALUES (329, 8, 84, 3, 29, NULL);
INSERT INTO `guru_mapel` VALUES (330, 8, 84, 3, 30, NULL);
INSERT INTO `guru_mapel` VALUES (331, 26, 44, 3, 37, NULL);
INSERT INTO `guru_mapel` VALUES (332, 26, 44, 3, 38, NULL);
INSERT INTO `guru_mapel` VALUES (333, 8, 84, 3, 32, NULL);
INSERT INTO `guru_mapel` VALUES (334, 26, 44, 3, 27, NULL);
INSERT INTO `guru_mapel` VALUES (335, 8, 84, 3, 33, NULL);
INSERT INTO `guru_mapel` VALUES (336, 26, 44, 3, 35, NULL);
INSERT INTO `guru_mapel` VALUES (337, 26, 44, 3, 36, NULL);
INSERT INTO `guru_mapel` VALUES (338, 30, 108, 3, 25, NULL);
INSERT INTO `guru_mapel` VALUES (339, 30, 108, 3, 37, NULL);
INSERT INTO `guru_mapel` VALUES (340, 26, 44, 3, 32, NULL);
INSERT INTO `guru_mapel` VALUES (341, 26, 44, 3, 33, NULL);
INSERT INTO `guru_mapel` VALUES (343, 26, 44, 3, 34, NULL);
INSERT INTO `guru_mapel` VALUES (344, 30, 36, 3, 35, NULL);
INSERT INTO `guru_mapel` VALUES (345, 28, 40, 3, 37, NULL);
INSERT INTO `guru_mapel` VALUES (346, 30, 36, 3, 36, NULL);
INSERT INTO `guru_mapel` VALUES (347, 28, 40, 3, 38, NULL);
INSERT INTO `guru_mapel` VALUES (348, 30, 36, 3, 34, NULL);
INSERT INTO `guru_mapel` VALUES (349, 28, 40, 3, 27, NULL);
INSERT INTO `guru_mapel` VALUES (350, 30, 112, 3, 27, NULL);
INSERT INTO `guru_mapel` VALUES (351, 28, 40, 3, 35, NULL);
INSERT INTO `guru_mapel` VALUES (352, 28, 40, 3, 36, NULL);
INSERT INTO `guru_mapel` VALUES (353, 29, 86, 3, 25, NULL);
INSERT INTO `guru_mapel` VALUES (354, 29, 86, 3, 26, NULL);
INSERT INTO `guru_mapel` VALUES (355, 29, 86, 3, 28, NULL);
INSERT INTO `guru_mapel` VALUES (356, 29, 86, 3, 29, NULL);
INSERT INTO `guru_mapel` VALUES (357, 29, 86, 3, 30, NULL);
INSERT INTO `guru_mapel` VALUES (358, 29, 63, 3, 26, NULL);
INSERT INTO `guru_mapel` VALUES (359, 29, 63, 3, 38, NULL);
INSERT INTO `guru_mapel` VALUES (360, 29, 86, 3, 31, NULL);
INSERT INTO `guru_mapel` VALUES (361, 29, 86, 3, 37, NULL);
INSERT INTO `guru_mapel` VALUES (362, 29, 86, 3, 38, NULL);
INSERT INTO `guru_mapel` VALUES (363, 29, 86, 3, 27, NULL);
INSERT INTO `guru_mapel` VALUES (364, 29, 86, 3, 34, NULL);
INSERT INTO `guru_mapel` VALUES (365, 29, 86, 3, 32, NULL);
INSERT INTO `guru_mapel` VALUES (366, 29, 86, 3, 33, NULL);
INSERT INTO `guru_mapel` VALUES (367, 29, 86, 3, 36, NULL);
INSERT INTO `guru_mapel` VALUES (368, 29, 86, 3, 35, NULL);
INSERT INTO `guru_mapel` VALUES (369, 31, 84, 3, 35, NULL);
INSERT INTO `guru_mapel` VALUES (370, 31, 94, 3, 35, NULL);
INSERT INTO `guru_mapel` VALUES (371, 31, 60, 3, 35, NULL);
INSERT INTO `guru_mapel` VALUES (372, 31, 60, 3, 34, NULL);

-- ----------------------------
-- Table structure for hari
-- ----------------------------
DROP TABLE IF EXISTS `hari`;
CREATE TABLE `hari`  (
  `id_hari` int(11) NOT NULL AUTO_INCREMENT,
  `hari` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `code` int(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id_hari`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

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
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for iuran_wajib_siswa
-- ----------------------------
DROP TABLE IF EXISTS `iuran_wajib_siswa`;
CREATE TABLE `iuran_wajib_siswa`  (
  `id_iuran_wajib_siswa` int(11) NOT NULL AUTO_INCREMENT,
  `nama` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `harga` double NULL DEFAULT NULL,
  PRIMARY KEY (`id_iuran_wajib_siswa`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of iuran_wajib_siswa
-- ----------------------------
INSERT INTO `iuran_wajib_siswa` VALUES (1, 'SPP Bulanan', 500000);
INSERT INTO `iuran_wajib_siswa` VALUES (2, 'Uang Gedung', 2000000);
INSERT INTO `iuran_wajib_siswa` VALUES (3, 'Seragam', 500000);
INSERT INTO `iuran_wajib_siswa` VALUES (4, 'Buku/LKS', 120000);
INSERT INTO `iuran_wajib_siswa` VALUES (5, 'PAS', 100000);
INSERT INTO `iuran_wajib_siswa` VALUES (6, 'PTS', 100000);

-- ----------------------------
-- Table structure for jadwal
-- ----------------------------
DROP TABLE IF EXISTS `jadwal`;
CREATE TABLE `jadwal`  (
  `id_jadwal` int(11) NOT NULL AUTO_INCREMENT,
  `tanggal` date NULL DEFAULT NULL,
  PRIMARY KEY (`id_jadwal`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

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
) ENGINE = InnoDB AUTO_INCREMENT = 438 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jadwal_pelajaran
-- ----------------------------
INSERT INTO `jadwal_pelajaran` VALUES (32, 323, 1, 7);
INSERT INTO `jadwal_pelajaran` VALUES (33, 323, 1, 8);
INSERT INTO `jadwal_pelajaran` VALUES (34, 338, 1, 5);
INSERT INTO `jadwal_pelajaran` VALUES (35, 338, 1, 6);
INSERT INTO `jadwal_pelajaran` VALUES (36, 353, 1, 9);
INSERT INTO `jadwal_pelajaran` VALUES (37, 353, 1, 10);
INSERT INTO `jadwal_pelajaran` VALUES (38, 224, 2, 5);
INSERT INTO `jadwal_pelajaran` VALUES (39, 224, 2, 6);
INSERT INTO `jadwal_pelajaran` VALUES (40, 240, 2, 7);
INSERT INTO `jadwal_pelajaran` VALUES (41, 240, 2, 8);
INSERT INTO `jadwal_pelajaran` VALUES (42, 254, 2, 9);
INSERT INTO `jadwal_pelajaran` VALUES (43, 254, 2, 10);
INSERT INTO `jadwal_pelajaran` VALUES (44, 249, 3, 5);
INSERT INTO `jadwal_pelajaran` VALUES (45, 249, 3, 6);
INSERT INTO `jadwal_pelajaran` VALUES (46, 323, 3, 7);
INSERT INTO `jadwal_pelajaran` VALUES (47, 323, 3, 8);
INSERT INTO `jadwal_pelajaran` VALUES (48, 353, 3, 9);
INSERT INTO `jadwal_pelajaran` VALUES (49, 353, 3, 10);
INSERT INTO `jadwal_pelajaran` VALUES (50, 268, 4, 5);
INSERT INTO `jadwal_pelajaran` VALUES (51, 268, 4, 6);
INSERT INTO `jadwal_pelajaran` VALUES (52, 268, 4, 7);
INSERT INTO `jadwal_pelajaran` VALUES (53, 291, 4, 8);
INSERT INTO `jadwal_pelajaran` VALUES (54, 291, 4, 9);
INSERT INTO `jadwal_pelajaran` VALUES (55, 291, 4, 10);
INSERT INTO `jadwal_pelajaran` VALUES (56, 299, 5, 5);
INSERT INTO `jadwal_pelajaran` VALUES (57, 299, 5, 6);
INSERT INTO `jadwal_pelajaran` VALUES (58, 249, 5, 7);
INSERT INTO `jadwal_pelajaran` VALUES (59, 249, 5, 8);
INSERT INTO `jadwal_pelajaran` VALUES (60, 304, 1, 5);
INSERT INTO `jadwal_pelajaran` VALUES (61, 304, 1, 6);
INSERT INTO `jadwal_pelajaran` VALUES (62, 232, 1, 7);
INSERT INTO `jadwal_pelajaran` VALUES (63, 232, 1, 8);
INSERT INTO `jadwal_pelajaran` VALUES (64, 296, 1, 9);
INSERT INTO `jadwal_pelajaran` VALUES (65, 296, 1, 10);
INSERT INTO `jadwal_pelajaran` VALUES (66, 358, 1, 5);
INSERT INTO `jadwal_pelajaran` VALUES (67, 358, 1, 6);
INSERT INTO `jadwal_pelajaran` VALUES (68, 354, 1, 7);
INSERT INTO `jadwal_pelajaran` VALUES (69, 354, 1, 8);
INSERT INTO `jadwal_pelajaran` VALUES (70, 300, 1, 9);
INSERT INTO `jadwal_pelajaran` VALUES (71, 300, 1, 10);
INSERT INTO `jadwal_pelajaran` VALUES (72, 357, 2, 5);
INSERT INTO `jadwal_pelajaran` VALUES (73, 357, 2, 6);
INSERT INTO `jadwal_pelajaran` VALUES (74, 250, 2, 5);
INSERT INTO `jadwal_pelajaran` VALUES (75, 250, 2, 6);
INSERT INTO `jadwal_pelajaran` VALUES (76, 358, 2, 7);
INSERT INTO `jadwal_pelajaran` VALUES (77, 358, 2, 8);
INSERT INTO `jadwal_pelajaran` VALUES (78, 241, 2, 9);
INSERT INTO `jadwal_pelajaran` VALUES (79, 241, 2, 10);
INSERT INTO `jadwal_pelajaran` VALUES (80, 228, 2, 7);
INSERT INTO `jadwal_pelajaran` VALUES (81, 228, 2, 8);
INSERT INTO `jadwal_pelajaran` VALUES (82, 247, 2, 9);
INSERT INTO `jadwal_pelajaran` VALUES (83, 247, 2, 10);
INSERT INTO `jadwal_pelajaran` VALUES (84, 330, 3, 5);
INSERT INTO `jadwal_pelajaran` VALUES (85, 330, 3, 6);
INSERT INTO `jadwal_pelajaran` VALUES (86, 244, 3, 7);
INSERT INTO `jadwal_pelajaran` VALUES (87, 244, 3, 8);
INSERT INTO `jadwal_pelajaran` VALUES (88, 272, 3, 9);
INSERT INTO `jadwal_pelajaran` VALUES (89, 272, 3, 10);
INSERT INTO `jadwal_pelajaran` VALUES (90, 330, 4, 5);
INSERT INTO `jadwal_pelajaran` VALUES (91, 330, 4, 6);
INSERT INTO `jadwal_pelajaran` VALUES (92, 247, 4, 7);
INSERT INTO `jadwal_pelajaran` VALUES (93, 247, 4, 8);
INSERT INTO `jadwal_pelajaran` VALUES (94, 259, 4, 9);
INSERT INTO `jadwal_pelajaran` VALUES (95, 259, 4, 10);
INSERT INTO `jadwal_pelajaran` VALUES (96, 272, 5, 5);
INSERT INTO `jadwal_pelajaran` VALUES (97, 272, 5, 6);
INSERT INTO `jadwal_pelajaran` VALUES (98, 358, 3, 5);
INSERT INTO `jadwal_pelajaran` VALUES (99, 358, 3, 6);
INSERT INTO `jadwal_pelajaran` VALUES (100, 274, 3, 7);
INSERT INTO `jadwal_pelajaran` VALUES (101, 274, 3, 8);
INSERT INTO `jadwal_pelajaran` VALUES (102, 296, 5, 7);
INSERT INTO `jadwal_pelajaran` VALUES (103, 296, 5, 8);
INSERT INTO `jadwal_pelajaran` VALUES (104, 250, 3, 9);
INSERT INTO `jadwal_pelajaran` VALUES (105, 250, 3, 10);
INSERT INTO `jadwal_pelajaran` VALUES (106, 255, 4, 5);
INSERT INTO `jadwal_pelajaran` VALUES (107, 255, 4, 6);
INSERT INTO `jadwal_pelajaran` VALUES (108, 225, 4, 7);
INSERT INTO `jadwal_pelajaran` VALUES (109, 225, 4, 8);
INSERT INTO `jadwal_pelajaran` VALUES (110, 274, 4, 9);
INSERT INTO `jadwal_pelajaran` VALUES (111, 274, 4, 10);
INSERT INTO `jadwal_pelajaran` VALUES (112, 305, 1, 5);
INSERT INTO `jadwal_pelajaran` VALUES (113, 305, 1, 6);
INSERT INTO `jadwal_pelajaran` VALUES (114, 354, 5, 5);
INSERT INTO `jadwal_pelajaran` VALUES (115, 354, 5, 6);
INSERT INTO `jadwal_pelajaran` VALUES (116, 358, 5, 7);
INSERT INTO `jadwal_pelajaran` VALUES (117, 358, 5, 8);
INSERT INTO `jadwal_pelajaran` VALUES (118, 233, 1, 7);
INSERT INTO `jadwal_pelajaran` VALUES (119, 233, 1, 8);
INSERT INTO `jadwal_pelajaran` VALUES (120, 315, 1, 9);
INSERT INTO `jadwal_pelajaran` VALUES (121, 315, 1, 10);
INSERT INTO `jadwal_pelajaran` VALUES (122, 327, 1, 5);
INSERT INTO `jadwal_pelajaran` VALUES (123, 327, 1, 6);
INSERT INTO `jadwal_pelajaran` VALUES (124, 294, 1, 7);
INSERT INTO `jadwal_pelajaran` VALUES (125, 294, 1, 8);
INSERT INTO `jadwal_pelajaran` VALUES (126, 270, 1, 9);
INSERT INTO `jadwal_pelajaran` VALUES (127, 270, 1, 10);
INSERT INTO `jadwal_pelajaran` VALUES (128, 360, 2, 5);
INSERT INTO `jadwal_pelajaran` VALUES (129, 360, 2, 6);
INSERT INTO `jadwal_pelajaran` VALUES (130, 229, 2, 7);
INSERT INTO `jadwal_pelajaran` VALUES (131, 229, 2, 8);
INSERT INTO `jadwal_pelajaran` VALUES (132, 257, 2, 5);
INSERT INTO `jadwal_pelajaran` VALUES (133, 257, 2, 6);
INSERT INTO `jadwal_pelajaran` VALUES (134, 248, 2, 9);
INSERT INTO `jadwal_pelajaran` VALUES (135, 248, 2, 10);
INSERT INTO `jadwal_pelajaran` VALUES (136, 270, 2, 7);
INSERT INTO `jadwal_pelajaran` VALUES (137, 270, 2, 8);
INSERT INTO `jadwal_pelajaran` VALUES (138, 294, 2, 9);
INSERT INTO `jadwal_pelajaran` VALUES (139, 294, 2, 10);
INSERT INTO `jadwal_pelajaran` VALUES (140, 314, 3, 5);
INSERT INTO `jadwal_pelajaran` VALUES (141, 314, 3, 6);
INSERT INTO `jadwal_pelajaran` VALUES (142, 242, 3, 5);
INSERT INTO `jadwal_pelajaran` VALUES (143, 242, 3, 6);
INSERT INTO `jadwal_pelajaran` VALUES (144, 245, 3, 7);
INSERT INTO `jadwal_pelajaran` VALUES (145, 245, 3, 8);
INSERT INTO `jadwal_pelajaran` VALUES (146, 226, 3, 7);
INSERT INTO `jadwal_pelajaran` VALUES (147, 226, 3, 8);
INSERT INTO `jadwal_pelajaran` VALUES (148, 302, 3, 9);
INSERT INTO `jadwal_pelajaran` VALUES (149, 302, 3, 10);
INSERT INTO `jadwal_pelajaran` VALUES (150, 315, 3, 9);
INSERT INTO `jadwal_pelajaran` VALUES (151, 315, 3, 10);
INSERT INTO `jadwal_pelajaran` VALUES (152, 324, 4, 5);
INSERT INTO `jadwal_pelajaran` VALUES (153, 324, 4, 6);
INSERT INTO `jadwal_pelajaran` VALUES (154, 248, 4, 7);
INSERT INTO `jadwal_pelajaran` VALUES (155, 248, 4, 8);
INSERT INTO `jadwal_pelajaran` VALUES (156, 260, 4, 9);
INSERT INTO `jadwal_pelajaran` VALUES (157, 260, 4, 10);
INSERT INTO `jadwal_pelajaran` VALUES (158, 308, 5, 5);
INSERT INTO `jadwal_pelajaran` VALUES (159, 308, 5, 6);
INSERT INTO `jadwal_pelajaran` VALUES (160, 277, 5, 7);
INSERT INTO `jadwal_pelajaran` VALUES (161, 277, 5, 8);
INSERT INTO `jadwal_pelajaran` VALUES (162, 261, 1, 5);
INSERT INTO `jadwal_pelajaran` VALUES (163, 261, 1, 6);
INSERT INTO `jadwal_pelajaran` VALUES (164, 273, 1, 7);
INSERT INTO `jadwal_pelajaran` VALUES (165, 273, 1, 8);
INSERT INTO `jadwal_pelajaran` VALUES (166, 208, 1, 9);
INSERT INTO `jadwal_pelajaran` VALUES (167, 208, 1, 10);
INSERT INTO `jadwal_pelajaran` VALUES (168, 333, 2, 5);
INSERT INTO `jadwal_pelajaran` VALUES (169, 333, 2, 6);
INSERT INTO `jadwal_pelajaran` VALUES (170, 306, 2, 7);
INSERT INTO `jadwal_pelajaran` VALUES (171, 306, 2, 8);
INSERT INTO `jadwal_pelajaran` VALUES (172, 236, 3, 5);
INSERT INTO `jadwal_pelajaran` VALUES (173, 236, 3, 6);
INSERT INTO `jadwal_pelajaran` VALUES (174, 306, 3, 7);
INSERT INTO `jadwal_pelajaran` VALUES (175, 306, 3, 8);
INSERT INTO `jadwal_pelajaran` VALUES (176, 297, 3, 9);
INSERT INTO `jadwal_pelajaran` VALUES (177, 297, 3, 10);
INSERT INTO `jadwal_pelajaran` VALUES (178, 297, 4, 5);
INSERT INTO `jadwal_pelajaran` VALUES (179, 297, 4, 6);
INSERT INTO `jadwal_pelajaran` VALUES (180, 333, 4, 7);
INSERT INTO `jadwal_pelajaran` VALUES (181, 333, 4, 8);
INSERT INTO `jadwal_pelajaran` VALUES (182, 340, 4, 9);
INSERT INTO `jadwal_pelajaran` VALUES (183, 340, 4, 10);
INSERT INTO `jadwal_pelajaran` VALUES (184, 208, 5, 5);
INSERT INTO `jadwal_pelajaran` VALUES (185, 208, 5, 6);
INSERT INTO `jadwal_pelajaran` VALUES (186, 340, 5, 7);
INSERT INTO `jadwal_pelajaran` VALUES (187, 340, 5, 8);
INSERT INTO `jadwal_pelajaran` VALUES (188, 209, 1, 5);
INSERT INTO `jadwal_pelajaran` VALUES (189, 209, 1, 6);
INSERT INTO `jadwal_pelajaran` VALUES (190, 262, 1, 7);
INSERT INTO `jadwal_pelajaran` VALUES (191, 262, 1, 8);
INSERT INTO `jadwal_pelajaran` VALUES (192, 335, 1, 9);
INSERT INTO `jadwal_pelajaran` VALUES (193, 335, 1, 10);
INSERT INTO `jadwal_pelajaran` VALUES (194, 307, 2, 5);
INSERT INTO `jadwal_pelajaran` VALUES (195, 307, 2, 6);
INSERT INTO `jadwal_pelajaran` VALUES (196, 298, 2, 7);
INSERT INTO `jadwal_pelajaran` VALUES (197, 298, 2, 8);
INSERT INTO `jadwal_pelajaran` VALUES (198, 209, 2, 9);
INSERT INTO `jadwal_pelajaran` VALUES (199, 209, 2, 10);
INSERT INTO `jadwal_pelajaran` VALUES (200, 341, 3, 5);
INSERT INTO `jadwal_pelajaran` VALUES (201, 341, 3, 6);
INSERT INTO `jadwal_pelajaran` VALUES (202, 293, 3, 7);
INSERT INTO `jadwal_pelajaran` VALUES (203, 293, 3, 8);
INSERT INTO `jadwal_pelajaran` VALUES (204, 237, 3, 9);
INSERT INTO `jadwal_pelajaran` VALUES (205, 237, 3, 10);
INSERT INTO `jadwal_pelajaran` VALUES (206, 341, 4, 5);
INSERT INTO `jadwal_pelajaran` VALUES (207, 341, 4, 6);
INSERT INTO `jadwal_pelajaran` VALUES (208, 335, 4, 9);
INSERT INTO `jadwal_pelajaran` VALUES (209, 335, 4, 10);
INSERT INTO `jadwal_pelajaran` VALUES (210, 298, 5, 5);
INSERT INTO `jadwal_pelajaran` VALUES (211, 298, 5, 6);
INSERT INTO `jadwal_pelajaran` VALUES (212, 307, 5, 7);
INSERT INTO `jadwal_pelajaran` VALUES (213, 307, 5, 8);
INSERT INTO `jadwal_pelajaran` VALUES (214, 292, 1, 11);
INSERT INTO `jadwal_pelajaran` VALUES (215, 292, 1, 12);
INSERT INTO `jadwal_pelajaran` VALUES (216, 339, 1, 13);
INSERT INTO `jadwal_pelajaran` VALUES (217, 339, 1, 14);
INSERT INTO `jadwal_pelajaran` VALUES (218, 331, 2, 11);
INSERT INTO `jadwal_pelajaran` VALUES (219, 331, 2, 12);
INSERT INTO `jadwal_pelajaran` VALUES (220, 325, 2, 15);
INSERT INTO `jadwal_pelajaran` VALUES (221, 325, 2, 16);
INSERT INTO `jadwal_pelajaran` VALUES (222, 312, 3, 11);
INSERT INTO `jadwal_pelajaran` VALUES (223, 312, 3, 12);
INSERT INTO `jadwal_pelajaran` VALUES (224, 252, 3, 13);
INSERT INTO `jadwal_pelajaran` VALUES (225, 252, 3, 14);
INSERT INTO `jadwal_pelajaran` VALUES (226, 269, 3, 15);
INSERT INTO `jadwal_pelajaran` VALUES (227, 269, 3, 16);
INSERT INTO `jadwal_pelajaran` VALUES (228, 292, 4, 11);
INSERT INTO `jadwal_pelajaran` VALUES (229, 292, 4, 12);
INSERT INTO `jadwal_pelajaran` VALUES (230, 325, 4, 13);
INSERT INTO `jadwal_pelajaran` VALUES (231, 325, 4, 14);
INSERT INTO `jadwal_pelajaran` VALUES (232, 266, 4, 15);
INSERT INTO `jadwal_pelajaran` VALUES (233, 266, 4, 16);
INSERT INTO `jadwal_pelajaran` VALUES (234, 252, 5, 11);
INSERT INTO `jadwal_pelajaran` VALUES (235, 252, 5, 12);
INSERT INTO `jadwal_pelajaran` VALUES (236, 345, 5, 13);
INSERT INTO `jadwal_pelajaran` VALUES (237, 345, 5, 14);
INSERT INTO `jadwal_pelajaran` VALUES (238, 269, 5, 15);
INSERT INTO `jadwal_pelajaran` VALUES (239, 269, 5, 16);
INSERT INTO `jadwal_pelajaran` VALUES (240, 359, 1, 11);
INSERT INTO `jadwal_pelajaran` VALUES (241, 359, 1, 12);
INSERT INTO `jadwal_pelajaran` VALUES (242, 275, 1, 13);
INSERT INTO `jadwal_pelajaran` VALUES (243, 275, 1, 14);
INSERT INTO `jadwal_pelajaran` VALUES (244, 332, 2, 11);
INSERT INTO `jadwal_pelajaran` VALUES (245, 332, 2, 12);
INSERT INTO `jadwal_pelajaran` VALUES (246, 359, 2, 15);
INSERT INTO `jadwal_pelajaran` VALUES (247, 359, 2, 16);
INSERT INTO `jadwal_pelajaran` VALUES (248, 313, 3, 11);
INSERT INTO `jadwal_pelajaran` VALUES (249, 313, 3, 12);
INSERT INTO `jadwal_pelajaran` VALUES (250, 253, 3, 13);
INSERT INTO `jadwal_pelajaran` VALUES (251, 253, 3, 14);
INSERT INTO `jadwal_pelajaran` VALUES (252, 359, 3, 15);
INSERT INTO `jadwal_pelajaran` VALUES (253, 359, 3, 16);
INSERT INTO `jadwal_pelajaran` VALUES (254, 275, 4, 11);
INSERT INTO `jadwal_pelajaran` VALUES (255, 275, 4, 12);
INSERT INTO `jadwal_pelajaran` VALUES (256, 359, 4, 13);
INSERT INTO `jadwal_pelajaran` VALUES (257, 359, 4, 14);
INSERT INTO `jadwal_pelajaran` VALUES (258, 267, 4, 15);
INSERT INTO `jadwal_pelajaran` VALUES (259, 267, 4, 16);
INSERT INTO `jadwal_pelajaran` VALUES (260, 253, 5, 11);
INSERT INTO `jadwal_pelajaran` VALUES (261, 253, 5, 12);
INSERT INTO `jadwal_pelajaran` VALUES (262, 347, 5, 13);
INSERT INTO `jadwal_pelajaran` VALUES (263, 347, 5, 14);
INSERT INTO `jadwal_pelajaran` VALUES (264, 359, 5, 15);
INSERT INTO `jadwal_pelajaran` VALUES (265, 359, 5, 16);
INSERT INTO `jadwal_pelajaran` VALUES (266, 350, 1, 11);
INSERT INTO `jadwal_pelajaran` VALUES (267, 350, 1, 12);
INSERT INTO `jadwal_pelajaran` VALUES (268, 334, 2, 11);
INSERT INTO `jadwal_pelajaran` VALUES (269, 334, 2, 12);
INSERT INTO `jadwal_pelajaran` VALUES (270, 276, 2, 15);
INSERT INTO `jadwal_pelajaran` VALUES (271, 276, 2, 16);
INSERT INTO `jadwal_pelajaran` VALUES (274, 251, 3, 13);
INSERT INTO `jadwal_pelajaran` VALUES (275, 251, 3, 14);
INSERT INTO `jadwal_pelajaran` VALUES (276, 276, 3, 15);
INSERT INTO `jadwal_pelajaran` VALUES (277, 276, 3, 16);
INSERT INTO `jadwal_pelajaran` VALUES (278, 276, 4, 11);
INSERT INTO `jadwal_pelajaran` VALUES (279, 276, 4, 12);
INSERT INTO `jadwal_pelajaran` VALUES (280, 276, 4, 13);
INSERT INTO `jadwal_pelajaran` VALUES (281, 276, 4, 14);
INSERT INTO `jadwal_pelajaran` VALUES (282, 256, 4, 15);
INSERT INTO `jadwal_pelajaran` VALUES (283, 256, 4, 16);
INSERT INTO `jadwal_pelajaran` VALUES (286, 251, 5, 11);
INSERT INTO `jadwal_pelajaran` VALUES (287, 251, 5, 12);
INSERT INTO `jadwal_pelajaran` VALUES (288, 349, 5, 13);
INSERT INTO `jadwal_pelajaran` VALUES (289, 349, 5, 14);
INSERT INTO `jadwal_pelajaran` VALUES (290, 276, 5, 15);
INSERT INTO `jadwal_pelajaran` VALUES (291, 276, 5, 16);
INSERT INTO `jadwal_pelajaran` VALUES (294, 310, 1, 11);
INSERT INTO `jadwal_pelajaran` VALUES (295, 310, 1, 12);
INSERT INTO `jadwal_pelajaran` VALUES (296, 234, 1, 15);
INSERT INTO `jadwal_pelajaran` VALUES (297, 234, 1, 16);
INSERT INTO `jadwal_pelajaran` VALUES (298, 344, 2, 13);
INSERT INTO `jadwal_pelajaran` VALUES (299, 344, 2, 14);
INSERT INTO `jadwal_pelajaran` VALUES (300, 264, 2, 15);
INSERT INTO `jadwal_pelajaran` VALUES (301, 264, 2, 16);
INSERT INTO `jadwal_pelajaran` VALUES (302, 351, 3, 15);
INSERT INTO `jadwal_pelajaran` VALUES (303, 351, 3, 16);
INSERT INTO `jadwal_pelajaran` VALUES (304, 336, 5, 13);
INSERT INTO `jadwal_pelajaran` VALUES (305, 336, 5, 14);
INSERT INTO `jadwal_pelajaran` VALUES (306, 344, 5, 15);
INSERT INTO `jadwal_pelajaran` VALUES (307, 344, 5, 16);
INSERT INTO `jadwal_pelajaran` VALUES (308, 239, 1, 11);
INSERT INTO `jadwal_pelajaran` VALUES (309, 239, 1, 12);
INSERT INTO `jadwal_pelajaran` VALUES (310, 265, 1, 15);
INSERT INTO `jadwal_pelajaran` VALUES (311, 265, 1, 16);
INSERT INTO `jadwal_pelajaran` VALUES (312, 278, 2, 11);
INSERT INTO `jadwal_pelajaran` VALUES (313, 278, 2, 12);
INSERT INTO `jadwal_pelajaran` VALUES (314, 285, 2, 13);
INSERT INTO `jadwal_pelajaran` VALUES (315, 285, 2, 14);
INSERT INTO `jadwal_pelajaran` VALUES (316, 346, 2, 15);
INSERT INTO `jadwal_pelajaran` VALUES (317, 346, 2, 16);
INSERT INTO `jadwal_pelajaran` VALUES (318, 337, 3, 11);
INSERT INTO `jadwal_pelajaran` VALUES (319, 337, 3, 12);
INSERT INTO `jadwal_pelajaran` VALUES (320, 278, 3, 13);
INSERT INTO `jadwal_pelajaran` VALUES (321, 278, 3, 14);
INSERT INTO `jadwal_pelajaran` VALUES (322, 311, 3, 15);
INSERT INTO `jadwal_pelajaran` VALUES (323, 311, 3, 16);
INSERT INTO `jadwal_pelajaran` VALUES (324, 346, 4, 11);
INSERT INTO `jadwal_pelajaran` VALUES (325, 346, 4, 12);
INSERT INTO `jadwal_pelajaran` VALUES (326, 319, 4, 13);
INSERT INTO `jadwal_pelajaran` VALUES (327, 319, 4, 14);
INSERT INTO `jadwal_pelajaran` VALUES (328, 328, 4, 15);
INSERT INTO `jadwal_pelajaran` VALUES (329, 328, 4, 16);
INSERT INTO `jadwal_pelajaran` VALUES (330, 319, 5, 11);
INSERT INTO `jadwal_pelajaran` VALUES (331, 319, 5, 12);
INSERT INTO `jadwal_pelajaran` VALUES (332, 309, 5, 13);
INSERT INTO `jadwal_pelajaran` VALUES (333, 309, 5, 14);
INSERT INTO `jadwal_pelajaran` VALUES (334, 352, 5, 15);
INSERT INTO `jadwal_pelajaran` VALUES (335, 352, 5, 16);
INSERT INTO `jadwal_pelajaran` VALUES (336, 207, 1, 11);
INSERT INTO `jadwal_pelajaran` VALUES (337, 207, 1, 12);
INSERT INTO `jadwal_pelajaran` VALUES (338, 238, 1, 13);
INSERT INTO `jadwal_pelajaran` VALUES (339, 238, 1, 14);
INSERT INTO `jadwal_pelajaran` VALUES (340, 348, 1, 15);
INSERT INTO `jadwal_pelajaran` VALUES (341, 348, 1, 16);
INSERT INTO `jadwal_pelajaran` VALUES (342, 263, 2, 11);
INSERT INTO `jadwal_pelajaran` VALUES (343, 263, 2, 12);
INSERT INTO `jadwal_pelajaran` VALUES (344, 343, 2, 13);
INSERT INTO `jadwal_pelajaran` VALUES (345, 343, 2, 14);
INSERT INTO `jadwal_pelajaran` VALUES (346, 279, 3, 11);
INSERT INTO `jadwal_pelajaran` VALUES (347, 279, 3, 12);
INSERT INTO `jadwal_pelajaran` VALUES (348, 343, 3, 13);
INSERT INTO `jadwal_pelajaran` VALUES (349, 343, 3, 14);
INSERT INTO `jadwal_pelajaran` VALUES (350, 316, 3, 15);
INSERT INTO `jadwal_pelajaran` VALUES (351, 316, 3, 16);
INSERT INTO `jadwal_pelajaran` VALUES (352, 207, 4, 11);
INSERT INTO `jadwal_pelajaran` VALUES (353, 207, 4, 12);
INSERT INTO `jadwal_pelajaran` VALUES (354, 348, 4, 13);
INSERT INTO `jadwal_pelajaran` VALUES (355, 348, 4, 14);
INSERT INTO `jadwal_pelajaran` VALUES (356, 280, 4, 15);
INSERT INTO `jadwal_pelajaran` VALUES (357, 280, 4, 16);
INSERT INTO `jadwal_pelajaran` VALUES (358, 279, 5, 11);
INSERT INTO `jadwal_pelajaran` VALUES (359, 279, 5, 12);
INSERT INTO `jadwal_pelajaran` VALUES (360, 317, 5, 15);
INSERT INTO `jadwal_pelajaran` VALUES (361, 317, 5, 16);
INSERT INTO `jadwal_pelajaran` VALUES (362, 361, 1, 15);
INSERT INTO `jadwal_pelajaran` VALUES (363, 361, 1, 16);
INSERT INTO `jadwal_pelajaran` VALUES (364, 361, 2, 13);
INSERT INTO `jadwal_pelajaran` VALUES (365, 361, 2, 14);
INSERT INTO `jadwal_pelajaran` VALUES (366, 362, 1, 15);
INSERT INTO `jadwal_pelajaran` VALUES (367, 362, 1, 16);
INSERT INTO `jadwal_pelajaran` VALUES (368, 362, 2, 13);
INSERT INTO `jadwal_pelajaran` VALUES (369, 362, 2, 14);
INSERT INTO `jadwal_pelajaran` VALUES (370, 355, 4, 5);
INSERT INTO `jadwal_pelajaran` VALUES (371, 355, 4, 6);
INSERT INTO `jadwal_pelajaran` VALUES (372, 318, 4, 7);
INSERT INTO `jadwal_pelajaran` VALUES (373, 318, 4, 8);
INSERT INTO `jadwal_pelajaran` VALUES (374, 230, 4, 9);
INSERT INTO `jadwal_pelajaran` VALUES (375, 230, 4, 10);
INSERT INTO `jadwal_pelajaran` VALUES (376, 364, 5, 13);
INSERT INTO `jadwal_pelajaran` VALUES (377, 364, 5, 14);
INSERT INTO `jadwal_pelajaran` VALUES (378, 318, 5, 5);
INSERT INTO `jadwal_pelajaran` VALUES (379, 318, 5, 6);
INSERT INTO `jadwal_pelajaran` VALUES (380, 227, 1, 5);
INSERT INTO `jadwal_pelajaran` VALUES (381, 227, 1, 6);
INSERT INTO `jadwal_pelajaran` VALUES (382, 327, 5, 7);
INSERT INTO `jadwal_pelajaran` VALUES (383, 327, 5, 8);
INSERT INTO `jadwal_pelajaran` VALUES (384, 303, 1, 7);
INSERT INTO `jadwal_pelajaran` VALUES (385, 303, 1, 8);
INSERT INTO `jadwal_pelajaran` VALUES (386, 231, 1, 9);
INSERT INTO `jadwal_pelajaran` VALUES (387, 231, 1, 10);
INSERT INTO `jadwal_pelajaran` VALUES (388, 295, 2, 5);
INSERT INTO `jadwal_pelajaran` VALUES (389, 295, 2, 6);
INSERT INTO `jadwal_pelajaran` VALUES (390, 329, 2, 7);
INSERT INTO `jadwal_pelajaran` VALUES (391, 329, 2, 8);
INSERT INTO `jadwal_pelajaran` VALUES (392, 271, 2, 9);
INSERT INTO `jadwal_pelajaran` VALUES (393, 271, 2, 10);
INSERT INTO `jadwal_pelajaran` VALUES (394, 295, 3, 5);
INSERT INTO `jadwal_pelajaran` VALUES (395, 295, 3, 6);
INSERT INTO `jadwal_pelajaran` VALUES (396, 246, 3, 7);
INSERT INTO `jadwal_pelajaran` VALUES (397, 246, 3, 8);
INSERT INTO `jadwal_pelajaran` VALUES (398, 243, 3, 9);
INSERT INTO `jadwal_pelajaran` VALUES (399, 243, 3, 10);
INSERT INTO `jadwal_pelajaran` VALUES (400, 246, 4, 5);
INSERT INTO `jadwal_pelajaran` VALUES (401, 246, 4, 6);
INSERT INTO `jadwal_pelajaran` VALUES (402, 258, 4, 7);
INSERT INTO `jadwal_pelajaran` VALUES (403, 258, 4, 8);
INSERT INTO `jadwal_pelajaran` VALUES (404, 356, 4, 9);
INSERT INTO `jadwal_pelajaran` VALUES (405, 356, 4, 10);
INSERT INTO `jadwal_pelajaran` VALUES (406, 329, 5, 5);
INSERT INTO `jadwal_pelajaran` VALUES (407, 329, 5, 6);
INSERT INTO `jadwal_pelajaran` VALUES (408, 271, 5, 7);
INSERT INTO `jadwal_pelajaran` VALUES (409, 271, 5, 8);
INSERT INTO `jadwal_pelajaran` VALUES (410, 301, 3, 11);
INSERT INTO `jadwal_pelajaran` VALUES (411, 301, 3, 12);
INSERT INTO `jadwal_pelajaran` VALUES (412, 365, 2, 9);
INSERT INTO `jadwal_pelajaran` VALUES (413, 365, 2, 10);
INSERT INTO `jadwal_pelajaran` VALUES (414, 366, 4, 7);
INSERT INTO `jadwal_pelajaran` VALUES (415, 366, 4, 8);
INSERT INTO `jadwal_pelajaran` VALUES (416, 363, 1, 15);
INSERT INTO `jadwal_pelajaran` VALUES (417, 363, 1, 16);
INSERT INTO `jadwal_pelajaran` VALUES (418, 363, 2, 13);
INSERT INTO `jadwal_pelajaran` VALUES (419, 363, 2, 14);
INSERT INTO `jadwal_pelajaran` VALUES (420, 367, 1, 13);
INSERT INTO `jadwal_pelajaran` VALUES (421, 367, 1, 14);
INSERT INTO `jadwal_pelajaran` VALUES (422, 368, 3, 13);
INSERT INTO `jadwal_pelajaran` VALUES (423, 368, 3, 14);
INSERT INTO `jadwal_pelajaran` VALUES (424, 310, 3, 11);
INSERT INTO `jadwal_pelajaran` VALUES (425, 310, 3, 12);
INSERT INTO `jadwal_pelajaran` VALUES (426, 369, 1, 13);
INSERT INTO `jadwal_pelajaran` VALUES (427, 369, 1, 14);
INSERT INTO `jadwal_pelajaran` VALUES (428, 369, 2, 11);
INSERT INTO `jadwal_pelajaran` VALUES (429, 369, 2, 12);
INSERT INTO `jadwal_pelajaran` VALUES (430, 371, 4, 11);
INSERT INTO `jadwal_pelajaran` VALUES (431, 371, 4, 12);
INSERT INTO `jadwal_pelajaran` VALUES (432, 369, 4, 13);
INSERT INTO `jadwal_pelajaran` VALUES (433, 369, 4, 14);
INSERT INTO `jadwal_pelajaran` VALUES (434, 370, 4, 15);
INSERT INTO `jadwal_pelajaran` VALUES (435, 370, 4, 16);
INSERT INTO `jadwal_pelajaran` VALUES (436, 371, 5, 11);
INSERT INTO `jadwal_pelajaran` VALUES (437, 371, 5, 12);

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
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

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
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jam_pelajaran
-- ----------------------------
INSERT INTO `jam_pelajaran` VALUES (5, '1', '08.30', '09.00', 3);
INSERT INTO `jam_pelajaran` VALUES (6, '2', '09.00', '09.30', 3);
INSERT INTO `jam_pelajaran` VALUES (7, '3', '09.30', '10.00', 3);
INSERT INTO `jam_pelajaran` VALUES (8, '4', '10.00', '10.30', 3);
INSERT INTO `jam_pelajaran` VALUES (9, '5', '10.30', '11.00', 3);
INSERT INTO `jam_pelajaran` VALUES (10, '6', '11.00', '11.30', 3);
INSERT INTO `jam_pelajaran` VALUES (11, '7', '13.00', '13.30', 3);
INSERT INTO `jam_pelajaran` VALUES (12, '8', '13.30', '14.00', 3);
INSERT INTO `jam_pelajaran` VALUES (13, '9', '14.00', '14.30', 3);
INSERT INTO `jam_pelajaran` VALUES (14, '10', '14.30', '15.00', 3);
INSERT INTO `jam_pelajaran` VALUES (15, '11', '15.00', '15.30', 3);
INSERT INTO `jam_pelajaran` VALUES (16, '12', '15.30', '16.00', 3);

-- ----------------------------
-- Table structure for jenis_keterampilan
-- ----------------------------
DROP TABLE IF EXISTS `jenis_keterampilan`;
CREATE TABLE `jenis_keterampilan`  (
  `id_jenis_keterampilan` int(11) NOT NULL AUTO_INCREMENT,
  `jenis_keterampilan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `kode` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`id_jenis_keterampilan`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jenis_keterampilan
-- ----------------------------
INSERT INTO `jenis_keterampilan` VALUES (1, 'Praktek', 'NPrak');
INSERT INTO `jenis_keterampilan` VALUES (5, 'Proyek', 'Npro');
INSERT INTO `jenis_keterampilan` VALUES (6, 'Produk', 'Nprod');

-- ----------------------------
-- Table structure for jenis_mata_pelajaran
-- ----------------------------
DROP TABLE IF EXISTS `jenis_mata_pelajaran`;
CREATE TABLE `jenis_mata_pelajaran`  (
  `id_jenis_mata_pelajaran` int(11) NOT NULL AUTO_INCREMENT,
  `jenis_mata_pelajaran` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`id_jenis_mata_pelajaran`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jenis_mata_pelajaran
-- ----------------------------
INSERT INTO `jenis_mata_pelajaran` VALUES (1, 'A. Muatan Nasional');
INSERT INTO `jenis_mata_pelajaran` VALUES (2, 'B. Muatan Kewilayahan');
INSERT INTO `jenis_mata_pelajaran` VALUES (3, 'C. Muatan Peminatan Kejuruan');
INSERT INTO `jenis_mata_pelajaran` VALUES (4, 'C1. Dasar Bidang Keahlian');
INSERT INTO `jenis_mata_pelajaran` VALUES (5, 'C2. Dasar Program Keahlian');
INSERT INTO `jenis_mata_pelajaran` VALUES (6, 'D. Muatan Lokal');

-- ----------------------------
-- Table structure for jenis_pelanggaran
-- ----------------------------
DROP TABLE IF EXISTS `jenis_pelanggaran`;
CREATE TABLE `jenis_pelanggaran`  (
  `id_jenis_pelanggaran` int(11) NOT NULL AUTO_INCREMENT,
  `jenis_pelanggaran` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`id_jenis_pelanggaran`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jenis_pelanggaran
-- ----------------------------
INSERT INTO `jenis_pelanggaran` VALUES (1, 'CATATAN KERAPIAN');
INSERT INTO `jenis_pelanggaran` VALUES (2, 'CATATAN KEDISIPLINAN');

-- ----------------------------
-- Table structure for jenis_pengetahuan
-- ----------------------------
DROP TABLE IF EXISTS `jenis_pengetahuan`;
CREATE TABLE `jenis_pengetahuan`  (
  `id_jenis_pengetahuan` int(11) NOT NULL AUTO_INCREMENT,
  `jenis_pengetahuan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `kode` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`id_jenis_pengetahuan`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jenis_pengetahuan
-- ----------------------------
INSERT INTO `jenis_pengetahuan` VALUES (1, 'Nilai Tugas', 'NT');
INSERT INTO `jenis_pengetahuan` VALUES (2, 'Nilai Ulangan', 'NU');

-- ----------------------------
-- Table structure for jenis_penilaian
-- ----------------------------
DROP TABLE IF EXISTS `jenis_penilaian`;
CREATE TABLE `jenis_penilaian`  (
  `id_jenis_penilaian` int(11) NOT NULL AUTO_INCREMENT,
  `jenis_penilaian` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `kode` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_jenis_penilaian`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jenis_penilaian
-- ----------------------------
INSERT INTO `jenis_penilaian` VALUES (1, 'Spiritual', 'KD 1');
INSERT INTO `jenis_penilaian` VALUES (2, 'Sikap', 'KD 2');
INSERT INTO `jenis_penilaian` VALUES (3, 'Pengetahuan', 'KD 3');
INSERT INTO `jenis_penilaian` VALUES (4, 'Keterampilan', 'KD 4');

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for jurusan
-- ----------------------------
DROP TABLE IF EXISTS `jurusan`;
CREATE TABLE `jurusan`  (
  `id_jurusan` int(11) NOT NULL AUTO_INCREMENT,
  `jurusan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `singkatan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`id_jurusan`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jurusan
-- ----------------------------
INSERT INTO `jurusan` VALUES (1, 'Teknik Komputer dan Jaringan', 'TKJ');
INSERT INTO `jurusan` VALUES (2, 'Rekayasa Perangkat Lunak', 'RPL');
INSERT INTO `jurusan` VALUES (3, 'Multimedia', 'MM');
INSERT INTO `jurusan` VALUES (4, 'Agribisnis Pengolahan Hasil Pertanian', 'APHP');
INSERT INTO `jurusan` VALUES (5, 'Desain Komunikasi Visual', 'DKV');

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

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
  PRIMARY KEY (`id_kelas`) USING BTREE,
  INDEX `idtingkat_fk`(`idtingkat_fk`) USING BTREE,
  CONSTRAINT `kelas_ibfk_1` FOREIGN KEY (`idtingkat_fk`) REFERENCES `tingkat` (`id_tingkat`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of kelas
-- ----------------------------
INSERT INTO `kelas` VALUES (25, 'X TKJ 1', 1, '2021-07-31 12:55:19', 1, 3);
INSERT INTO `kelas` VALUES (26, 'X DKV 1', 1, '2021-07-31 12:55:34', 5, 3);
INSERT INTO `kelas` VALUES (27, 'X APHP 1', 1, '2021-07-31 12:55:53', 4, 3);
INSERT INTO `kelas` VALUES (28, 'XI TKJ 1', 2, '2021-07-31 12:56:09', 1, 3);
INSERT INTO `kelas` VALUES (29, 'XI TKJ 2', 2, '2021-07-31 12:56:21', 1, 3);
INSERT INTO `kelas` VALUES (30, 'XI TKJ 3', 2, '2021-07-31 12:56:34', 1, 3);
INSERT INTO `kelas` VALUES (31, 'XI APHP 1', 2, '2021-07-31 12:56:49', 4, 3);
INSERT INTO `kelas` VALUES (32, 'XII TKJ 1', 3, '2021-07-31 12:57:06', 1, 3);
INSERT INTO `kelas` VALUES (33, 'XII TKJ 2', 3, '2021-07-31 12:57:18', 1, 3);
INSERT INTO `kelas` VALUES (34, 'XII APHP 1', 3, '2021-07-31 12:57:32', 4, 3);
INSERT INTO `kelas` VALUES (35, 'XI TKJ PI', 2, '2021-07-31 13:05:07', 1, 3);
INSERT INTO `kelas` VALUES (36, 'XI APHP PI', 2, '2021-07-31 13:05:26', 4, 3);
INSERT INTO `kelas` VALUES (37, 'X TKJ 2', 1, '2021-07-31 14:12:43', 1, 3);
INSERT INTO `kelas` VALUES (38, 'X DKV 2', 1, '2021-07-31 14:12:57', 5, 3);

-- ----------------------------
-- Table structure for kelas_erapor
-- ----------------------------
DROP TABLE IF EXISTS `kelas_erapor`;
CREATE TABLE `kelas_erapor`  (
  `id_kelas_erapor` int(11) NOT NULL AUTO_INCREMENT,
  `idkelas_fk` int(11) NULL DEFAULT NULL,
  `iderapor_fk` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_kelas_erapor`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for kelas_oas
-- ----------------------------
DROP TABLE IF EXISTS `kelas_oas`;
CREATE TABLE `kelas_oas`  (
  `id_kelas_oas` int(11) NOT NULL AUTO_INCREMENT,
  `idkelas_fk` int(11) NULL DEFAULT NULL,
  `idoas_fk` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_kelas_oas`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of kelas_oas
-- ----------------------------
INSERT INTO `kelas_oas` VALUES (1, 21, 1);
INSERT INTO `kelas_oas` VALUES (2, 22, 1);
INSERT INTO `kelas_oas` VALUES (3, 23, 1);
INSERT INTO `kelas_oas` VALUES (4, 24, 1);

-- ----------------------------
-- Table structure for kompetensi_pkg
-- ----------------------------
DROP TABLE IF EXISTS `kompetensi_pkg`;
CREATE TABLE `kompetensi_pkg`  (
  `id_kompetensi_pkg` int(11) NOT NULL AUTO_INCREMENT,
  `kompetensi` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `idtahunajaran_fk` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_kompetensi_pkg`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of kompetensi_pkg
-- ----------------------------
INSERT INTO `kompetensi_pkg` VALUES (1, 'Pedagogik', 1);
INSERT INTO `kompetensi_pkg` VALUES (3, 'Kepribadian', 1);
INSERT INTO `kompetensi_pkg` VALUES (4, 'Sosial', 1);
INSERT INTO `kompetensi_pkg` VALUES (5, 'Profesional', 1);
INSERT INTO `kompetensi_pkg` VALUES (6, 'Pendidikan', 1);

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

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
  PRIMARY KEY (`id_learning`) USING BTREE,
  INDEX `learning_ibfk_1`(`idmatapelajaran_fk`) USING BTREE,
  INDEX `idkd_fk`(`idkd_fk`) USING BTREE,
  INDEX `iduser_fk`(`iduser_fk`) USING BTREE,
  INDEX `idtingkat_fk`(`idtingkat_fk`) USING BTREE,
  CONSTRAINT `learning_ibfk_1` FOREIGN KEY (`idmatapelajaran_fk`) REFERENCES `mata_pelajaran` (`id_mata_pelajaran`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `learning_ibfk_2` FOREIGN KEY (`iduser_fk`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `learning_ibfk_3` FOREIGN KEY (`idtingkat_fk`) REFERENCES `tingkat` (`id_tingkat`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

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
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of mapel_ajar_pegawai
-- ----------------------------
INSERT INTO `mapel_ajar_pegawai` VALUES (1, 24, '42', '2', '2', NULL);
INSERT INTO `mapel_ajar_pegawai` VALUES (2, 24, '201', 'G4', '4', NULL);
INSERT INTO `mapel_ajar_pegawai` VALUES (3, 25, 'asd', 'smk', '5', '2001');
INSERT INTO `mapel_ajar_pegawai` VALUES (4, 25, 're', 'sd', '6', '2002');
INSERT INTO `mapel_ajar_pegawai` VALUES (5, 26, 'asd', 'smk', '5', '2001');
INSERT INTO `mapel_ajar_pegawai` VALUES (6, 26, 're', 'sd', '6', '2002');
INSERT INTO `mapel_ajar_pegawai` VALUES (7, 27, 'asd', 'smk', '5', '2001');
INSERT INTO `mapel_ajar_pegawai` VALUES (8, 27, 're', 'sd', '6', '2002');

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
) ENGINE = InnoDB AUTO_INCREMENT = 113 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of mata_pelajaran
-- ----------------------------
INSERT INTO `mata_pelajaran` VALUES (32, 'Mapel Terpadu', 'MT', NULL, NULL);
INSERT INTO `mata_pelajaran` VALUES (34, 'Matematika', 'MTK', NULL, NULL);
INSERT INTO `mata_pelajaran` VALUES (36, 'Aplikasi Komputer', 'APK', NULL, NULL);
INSERT INTO `mata_pelajaran` VALUES (40, 'PJOK', 'PJOK', NULL, NULL);
INSERT INTO `mata_pelajaran` VALUES (43, 'Bahasa Daerah', 'BD', NULL, NULL);
INSERT INTO `mata_pelajaran` VALUES (44, 'Bahasa Inggris', 'BING', NULL, NULL);
INSERT INTO `mata_pelajaran` VALUES (48, 'Simdig', 'Simdig', NULL, NULL);
INSERT INTO `mata_pelajaran` VALUES (58, 'DPK3 TKJ (DDG)', 'DDG', NULL, NULL);
INSERT INTO `mata_pelajaran` VALUES (60, 'PKWU', 'PKWU', NULL, NULL);
INSERT INTO `mata_pelajaran` VALUES (63, 'DBK DKV', 'DBKDKV', NULL, NULL);
INSERT INTO `mata_pelajaran` VALUES (65, 'DPK APHP', 'DPKAPHP', NULL, NULL);
INSERT INTO `mata_pelajaran` VALUES (66, 'PPHN', 'PPHN', NULL, NULL);
INSERT INTO `mata_pelajaran` VALUES (69, 'PPHH', 'PPHH', NULL, NULL);
INSERT INTO `mata_pelajaran` VALUES (72, 'PPKPH', 'PPKPH', NULL, NULL);
INSERT INTO `mata_pelajaran` VALUES (74, 'KPPP', 'KPPP', NULL, NULL);
INSERT INTO `mata_pelajaran` VALUES (83, 'DPK1 TKJ', 'DPK 1 TKJ', NULL, NULL);
INSERT INTO `mata_pelajaran` VALUES (84, 'KK1 TKJ', 'KK 1 TKJ', NULL, NULL);
INSERT INTO `mata_pelajaran` VALUES (86, 'Bahasa Indonesia', 'BIND', NULL, NULL);
INSERT INTO `mata_pelajaran` VALUES (89, 'DPK2 TKJ (DasProg)', 'Progdas', NULL, NULL);
INSERT INTO `mata_pelajaran` VALUES (94, 'KK2 TKJ', 'KK 2 TKJ', NULL, NULL);
INSERT INTO `mata_pelajaran` VALUES (108, 'FISKIM (Fisika, Kimia)', 'FISKIM', NULL, NULL);
INSERT INTO `mata_pelajaran` VALUES (112, 'BIOLOGI', 'BIO', NULL, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

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
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of media
-- ----------------------------
INSERT INTO `media` VALUES (1, '1.png', NULL, '1');
INSERT INTO `media` VALUES (2, '3.png', NULL, '3');
INSERT INTO `media` VALUES (3, '4.png', NULL, '4');
INSERT INTO `media` VALUES (4, '5.png', NULL, '5');
INSERT INTO `media` VALUES (5, '91b83a0188e13986037d70730a65daa8.jpg', NULL, '91b83a0188e13986037d70730a65daa8.jpg');
INSERT INTO `media` VALUES (6, '3ec268335bc319d64a8965dba7d92dd6.jpg', NULL, '3ec268335bc319d64a8965dba7d92dd6.jpg');

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

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
  PRIMARY KEY (`id_oas`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of oas
-- ----------------------------
INSERT INTO `oas` VALUES (1, '2021-06-03', '2021-06-14', 'asdkasdlkaskj', 1, 'ASD123');

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pelanggaran_siswa
-- ----------------------------
INSERT INTO `pelanggaran_siswa` VALUES (1, '2021-08-04', 'membawa dan memberi rokok saat disekolah ', 26, 318);

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
  PRIMARY KEY (`id_pembayaran_spp`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

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
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of persentase_guru
-- ----------------------------
INSERT INTO `persentase_guru` VALUES (1, 2, 80, '2021-04-27 14:21:02', 1);
INSERT INTO `persentase_guru` VALUES (2, 6, 90, '2021-04-29 11:07:24', 1);
INSERT INTO `persentase_guru` VALUES (3, 7, 90, '2021-04-29 11:07:24', 1);
INSERT INTO `persentase_guru` VALUES (4, 8, 80, '2021-04-29 11:07:24', 1);
INSERT INTO `persentase_guru` VALUES (5, 9, 80, '2021-04-29 11:07:25', 1);
INSERT INTO `persentase_guru` VALUES (6, 10, 80, '2021-04-29 11:07:25', 1);
INSERT INTO `persentase_guru` VALUES (7, 11, 80, '2021-04-29 11:07:25', 1);
INSERT INTO `persentase_guru` VALUES (8, 12, 80, '2021-04-29 11:07:25', 1);
INSERT INTO `persentase_guru` VALUES (9, 13, 90, '2021-04-29 11:07:25', 1);
INSERT INTO `persentase_guru` VALUES (10, 14, 90, '2021-04-29 11:07:25', 1);
INSERT INTO `persentase_guru` VALUES (11, 15, 80, '2021-04-29 11:07:25', 1);
INSERT INTO `persentase_guru` VALUES (12, 16, 90, '2021-04-29 11:07:25', 1);
INSERT INTO `persentase_guru` VALUES (13, 17, 90, '2021-04-29 11:07:25', 1);
INSERT INTO `persentase_guru` VALUES (14, 18, 80, '2021-04-29 11:07:25', 1);
INSERT INTO `persentase_guru` VALUES (15, 19, 80, '2021-04-29 11:07:26', 1);
INSERT INTO `persentase_guru` VALUES (16, 20, 80, '2021-04-29 11:07:26', 1);
INSERT INTO `persentase_guru` VALUES (17, 21, 80, '2021-04-29 11:07:26', 1);
INSERT INTO `persentase_guru` VALUES (18, 22, 80, '2021-04-29 11:07:26', 1);
INSERT INTO `persentase_guru` VALUES (19, 23, 0, '2021-04-29 11:07:26', 1);
INSERT INTO `persentase_guru` VALUES (20, 24, 80, '2021-04-29 11:07:26', 1);
INSERT INTO `persentase_guru` VALUES (21, 25, 80, '2021-04-29 11:07:26', 1);
INSERT INTO `persentase_guru` VALUES (22, 26, 0, '2021-04-29 11:07:26', 1);
INSERT INTO `persentase_guru` VALUES (23, 27, 80, '2021-04-29 11:07:26', 1);

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
  PRIMARY KEY (`id_poin_pelanggaran`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 43 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of poin_pelanggaran
-- ----------------------------
INSERT INTO `poin_pelanggaran` VALUES (1, 2, 'Datang terlambat di sekolah / masuk kelas', 10, 'A1');
INSERT INTO `poin_pelanggaran` VALUES (2, 2, 'keluar kelas tanpa izin ', 10, 'A2');
INSERT INTO `poin_pelanggaran` VALUES (3, 2, 'Tidak mengikuti kegiatan ekstrakulikuler', 10, 'A3');
INSERT INTO `poin_pelanggaran` VALUES (4, 2, 'berada di kantin pada waktu pergantian jam KBM', 10, 'A4');
INSERT INTO `poin_pelanggaran` VALUES (5, 2, 'makan di dalam kelas saat KBM', 10, 'A5');
INSERT INTO `poin_pelanggaran` VALUES (6, 2, 'membeli makanan saat KBM', 10, 'A6');
INSERT INTO `poin_pelanggaran` VALUES (7, 2, 'ngobrol/ribut di dalam kelas ketika KBM berlangsung', 10, 'A7');
INSERT INTO `poin_pelanggaran` VALUES (8, 1, 'Berpakaian seragam dengan atribut tidak lengkap dan tidak rapi', 10, 'A8');
INSERT INTO `poin_pelanggaran` VALUES (9, 2, 'Tidak membawa peralatan belajar dengan lengkap ', 10, 'A9');
INSERT INTO `poin_pelanggaran` VALUES (10, 2, 'Berhias/berdandan berlebihan bagi siswa putri', 10, 'A10');
INSERT INTO `poin_pelanggaran` VALUES (11, 2, 'Memakai perhiasan berlebihan bagi siswa putri ', 10, 'A11');
INSERT INTO `poin_pelanggaran` VALUES (12, 2, 'Membuang sampah tidak pada tempatnya ', 10, 'A12');
INSERT INTO `poin_pelanggaran` VALUES (13, 2, 'piket kelas tidak melaksanakan tugasnya', 10, 'A13');
INSERT INTO `poin_pelanggaran` VALUES (14, 2, 'tidak masuk sekolah tanpa keterangan', 20, 'B1');
INSERT INTO `poin_pelanggaran` VALUES (15, 2, 'membuat izin/ surat palsu ', 20, 'B2');
INSERT INTO `poin_pelanggaran` VALUES (16, 2, 'Keluar/meninggalkan sekolah tanpa izin ', 20, 'B3');
INSERT INTO `poin_pelanggaran` VALUES (17, 2, 'Tidak mengikuti Upacara ', 20, 'B4');
INSERT INTO `poin_pelanggaran` VALUES (18, 2, 'kehadiran tanpa keterangan ', 20, 'B5');
INSERT INTO `poin_pelanggaran` VALUES (19, 2, 'melindungi teman yang salah', 20, 'B6');
INSERT INTO `poin_pelanggaran` VALUES (20, 2, 'Memakai gelang atau kalung bagi siswa putra', 20, 'B7');
INSERT INTO `poin_pelanggaran` VALUES (21, 2, 'Menggunakan Handpone (HP) pada jam KBM', 20, 'B8');
INSERT INTO `poin_pelanggaran` VALUES (22, 1, 'Rambut gondrong/tidak rapi bagi siswa putra ', 20, 'A9');
INSERT INTO `poin_pelanggaran` VALUES (23, 2, 'Berbicara kotor atau kasar', 20, 'A12');
INSERT INTO `poin_pelanggaran` VALUES (24, 2, 'mencoret-coret sarana atau prasarana sekolah', 20, 'A13');
INSERT INTO `poin_pelanggaran` VALUES (25, 2, 'Merusak sarana dan prasarana sekolah', 35, 'C2.1.1');
INSERT INTO `poin_pelanggaran` VALUES (26, 2, 'Membawa dan Merokok di lingkungan sekolah atau sedang mengenakan pakaian sekolah', 35, 'C2.2');
INSERT INTO `poin_pelanggaran` VALUES (27, 2, 'Melakukan pemerasan kepada siswa lain', 35, 'C2.3 ');
INSERT INTO `poin_pelanggaran` VALUES (28, 2, 'Membawa buku / media porno', 35, 'C2.4');
INSERT INTO `poin_pelanggaran` VALUES (29, 2, 'Bersikap tidak sopan / menentang guru', 35, 'C2.5');
INSERT INTO `poin_pelanggaran` VALUES (30, 2, 'membawa/ menyebarkan selebaran yang menimbulkan keresahan ', 35, 'C2.6 ');
INSERT INTO `poin_pelanggaran` VALUES (31, 2, 'Berkelahi / main hakim sendiri', 35, 'C2.8 ');
INSERT INTO `poin_pelanggaran` VALUES (32, 2, 'Menganiaya / memukul siswa lain ', 35, 'C2.8 ');
INSERT INTO `poin_pelanggaran` VALUES (33, 2, 'membawa senjata tajam tanpa sepengetahuan pihak sekolah', 35, 'C2.9');
INSERT INTO `poin_pelanggaran` VALUES (34, 2, 'memalsukan tanda tangan guru/wali kelas/guru piket/kepala sekolah', 50, 'D1');
INSERT INTO `poin_pelanggaran` VALUES (35, 2, 'Mengambil /mencuri milik orang lain', 50, 'D2');
INSERT INTO `poin_pelanggaran` VALUES (36, 2, 'Berurusan dengan yang berwajib karena melakukan kejahatan', 50, 'D3');
INSERT INTO `poin_pelanggaran` VALUES (37, 2, 'mengikuti organisasi terlarang', 50, 'D4');
INSERT INTO `poin_pelanggaran` VALUES (38, 2, 'melakukan pemukulan terhadap guru', 50, 'D5');
INSERT INTO `poin_pelanggaran` VALUES (39, 2, 'membawa/mengkonsumsi minuman keras atau obat terlarang (Narkoba)', 50, 'D7');
INSERT INTO `poin_pelanggaran` VALUES (40, 2, 'merubah/ memalsukan raport', 50, 'D7');
INSERT INTO `poin_pelanggaran` VALUES (41, 2, 'melakukan prilaku asusila, prilaku tidak semenana atau hubungan diluar nikah', 50, 'D8');
INSERT INTO `poin_pelanggaran` VALUES (42, 2, 'Menikah / kawin dalam masa pendidikan sekolah ', 50, 'D9');

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

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
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of predikat_nilai
-- ----------------------------
INSERT INTO `predikat_nilai` VALUES (1, 90, 100, 'A');
INSERT INTO `predikat_nilai` VALUES (2, 85, 89, 'A-');
INSERT INTO `predikat_nilai` VALUES (3, 80, 84, 'B+');
INSERT INTO `predikat_nilai` VALUES (4, 75, 79, 'B');
INSERT INTO `predikat_nilai` VALUES (5, 60, 74, 'C');
INSERT INTO `predikat_nilai` VALUES (6, 0, 59, 'D');

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
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of predikat_pkg
-- ----------------------------
INSERT INTO `predikat_pkg` VALUES (1, 0, 55, 'Sangat Kurang', 'danger');
INSERT INTO `predikat_pkg` VALUES (2, 56, 69, 'Kurang', 'warning');
INSERT INTO `predikat_pkg` VALUES (3, 70, 79, 'Cukup', 'info');
INSERT INTO `predikat_pkg` VALUES (4, 80, 90, 'Baik', 'primary');
INSERT INTO `predikat_pkg` VALUES (5, 91, 100, 'Sangat Baik', 'success');

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

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
) ENGINE = InnoDB AUTO_INCREMENT = 699 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of presensi_harian
-- ----------------------------
INSERT INTO `presensi_harian` VALUES (1, 94, 378, 'M', '', '2021-08-04', '2021-08-04 11:27:41', 3, 32);
INSERT INTO `presensi_harian` VALUES (2, 94, 379, 'M', '', '2021-08-04', '2021-08-04 11:27:41', 3, 32);
INSERT INTO `presensi_harian` VALUES (3, 94, 380, 'M', '', '2021-08-04', '2021-08-04 11:27:41', 3, 32);
INSERT INTO `presensi_harian` VALUES (4, 94, 381, 'M', '', '2021-08-04', '2021-08-04 11:27:41', 3, 32);
INSERT INTO `presensi_harian` VALUES (5, 94, 382, 'M', '', '2021-08-04', '2021-08-04 11:27:41', 3, 32);
INSERT INTO `presensi_harian` VALUES (6, 94, 383, 'M', '', '2021-08-04', '2021-08-04 11:27:41', 3, 32);
INSERT INTO `presensi_harian` VALUES (7, 94, 384, 'M', '', '2021-08-04', '2021-08-04 11:27:41', 3, 32);
INSERT INTO `presensi_harian` VALUES (8, 94, 385, 'M', '', '2021-08-04', '2021-08-04 11:27:41', 3, 32);
INSERT INTO `presensi_harian` VALUES (9, 94, 386, 'M', '', '2021-08-04', '2021-08-04 11:27:41', 3, 32);
INSERT INTO `presensi_harian` VALUES (10, 94, 387, 'M', '', '2021-08-04', '2021-08-04 11:27:41', 3, 32);
INSERT INTO `presensi_harian` VALUES (11, 94, 388, 'M', '', '2021-08-04', '2021-08-04 11:27:41', 3, 32);
INSERT INTO `presensi_harian` VALUES (12, 94, 389, 'M', '', '2021-08-04', '2021-08-04 11:27:41', 3, 32);
INSERT INTO `presensi_harian` VALUES (13, 94, 390, 'M', '', '2021-08-04', '2021-08-04 11:27:42', 3, 32);
INSERT INTO `presensi_harian` VALUES (14, 94, 391, 'M', '', '2021-08-04', '2021-08-04 11:27:42', 3, 32);
INSERT INTO `presensi_harian` VALUES (15, 94, 392, 'M', '', '2021-08-04', '2021-08-04 11:27:42', 3, 32);
INSERT INTO `presensi_harian` VALUES (16, 94, 393, 'M', '', '2021-08-04', '2021-08-04 11:27:42', 3, 32);
INSERT INTO `presensi_harian` VALUES (17, 94, 394, 'M', '', '2021-08-04', '2021-08-04 11:27:42', 3, 32);
INSERT INTO `presensi_harian` VALUES (18, 94, 395, 'M', '', '2021-08-04', '2021-08-04 11:27:42', 3, 32);
INSERT INTO `presensi_harian` VALUES (19, 94, 396, 'M', '', '2021-08-04', '2021-08-04 11:27:42', 3, 32);
INSERT INTO `presensi_harian` VALUES (20, 94, 397, 'M', '', '2021-08-04', '2021-08-04 11:27:42', 3, 32);
INSERT INTO `presensi_harian` VALUES (21, 94, 398, 'M', '', '2021-08-04', '2021-08-04 11:27:42', 3, 32);
INSERT INTO `presensi_harian` VALUES (22, 94, 399, 'M', '', '2021-08-04', '2021-08-04 11:27:42', 3, 32);
INSERT INTO `presensi_harian` VALUES (23, 94, 400, 'M', '', '2021-08-04', '2021-08-04 11:27:42', 3, 32);
INSERT INTO `presensi_harian` VALUES (24, 94, 378, 'M', '', '2021-08-05', '2021-08-05 10:13:15', 3, 32);
INSERT INTO `presensi_harian` VALUES (25, 94, 379, 'M', '', '2021-08-05', '2021-08-05 10:13:15', 3, 32);
INSERT INTO `presensi_harian` VALUES (26, 94, 380, 'M', '', '2021-08-05', '2021-08-05 10:13:15', 3, 32);
INSERT INTO `presensi_harian` VALUES (27, 94, 381, 'M', '', '2021-08-05', '2021-08-05 10:13:15', 3, 32);
INSERT INTO `presensi_harian` VALUES (28, 94, 382, 'M', '', '2021-08-05', '2021-08-05 10:13:15', 3, 32);
INSERT INTO `presensi_harian` VALUES (29, 94, 383, 'M', '', '2021-08-05', '2021-08-05 10:13:15', 3, 32);
INSERT INTO `presensi_harian` VALUES (30, 94, 384, 'M', '', '2021-08-05', '2021-08-05 10:13:15', 3, 32);
INSERT INTO `presensi_harian` VALUES (31, 94, 385, 'S', '', '2021-08-05', '2021-08-05 10:13:15', 3, 32);
INSERT INTO `presensi_harian` VALUES (32, 94, 386, 'M', '', '2021-08-05', '2021-08-05 10:13:15', 3, 32);
INSERT INTO `presensi_harian` VALUES (33, 94, 387, 'M', '', '2021-08-05', '2021-08-05 10:13:15', 3, 32);
INSERT INTO `presensi_harian` VALUES (34, 94, 388, 'M', '', '2021-08-05', '2021-08-05 10:13:15', 3, 32);
INSERT INTO `presensi_harian` VALUES (35, 94, 389, 'M', '', '2021-08-05', '2021-08-05 10:13:15', 3, 32);
INSERT INTO `presensi_harian` VALUES (36, 94, 390, 'M', '', '2021-08-05', '2021-08-05 10:13:16', 3, 32);
INSERT INTO `presensi_harian` VALUES (37, 94, 391, 'M', '', '2021-08-05', '2021-08-05 10:13:16', 3, 32);
INSERT INTO `presensi_harian` VALUES (38, 94, 392, 'M', '', '2021-08-05', '2021-08-05 10:13:16', 3, 32);
INSERT INTO `presensi_harian` VALUES (39, 94, 393, 'M', '', '2021-08-05', '2021-08-05 10:13:16', 3, 32);
INSERT INTO `presensi_harian` VALUES (40, 94, 394, 'M', '', '2021-08-05', '2021-08-05 10:13:16', 3, 32);
INSERT INTO `presensi_harian` VALUES (41, 94, 395, 'M', '', '2021-08-05', '2021-08-05 10:13:16', 3, 32);
INSERT INTO `presensi_harian` VALUES (42, 94, 396, 'M', '', '2021-08-05', '2021-08-05 10:13:16', 3, 32);
INSERT INTO `presensi_harian` VALUES (43, 94, 397, 'M', '', '2021-08-05', '2021-08-05 10:13:16', 3, 32);
INSERT INTO `presensi_harian` VALUES (44, 94, 398, 'M', '', '2021-08-05', '2021-08-05 10:13:16', 3, 32);
INSERT INTO `presensi_harian` VALUES (45, 94, 399, 'M', '', '2021-08-05', '2021-08-05 10:13:16', 3, 32);
INSERT INTO `presensi_harian` VALUES (46, 94, 400, 'M', '', '2021-08-05', '2021-08-05 10:13:16', 3, 32);
INSERT INTO `presensi_harian` VALUES (47, 89, 433, 'M', '', '2021-08-05', '2021-08-05 11:17:59', 3, 25);
INSERT INTO `presensi_harian` VALUES (48, 89, 435, 'M', '', '2021-08-05', '2021-08-05 11:17:59', 3, 25);
INSERT INTO `presensi_harian` VALUES (49, 89, 437, 'M', '', '2021-08-05', '2021-08-05 11:17:59', 3, 25);
INSERT INTO `presensi_harian` VALUES (50, 89, 439, 'M', '', '2021-08-05', '2021-08-05 11:17:59', 3, 25);
INSERT INTO `presensi_harian` VALUES (51, 89, 441, 'M', '', '2021-08-05', '2021-08-05 11:17:59', 3, 25);
INSERT INTO `presensi_harian` VALUES (52, 89, 443, 'M', '', '2021-08-05', '2021-08-05 11:17:59', 3, 25);
INSERT INTO `presensi_harian` VALUES (53, 89, 445, 'M', '', '2021-08-05', '2021-08-05 11:17:59', 3, 25);
INSERT INTO `presensi_harian` VALUES (54, 89, 447, 'M', '', '2021-08-05', '2021-08-05 11:17:59', 3, 25);
INSERT INTO `presensi_harian` VALUES (55, 89, 449, 'M', '', '2021-08-05', '2021-08-05 11:17:59', 3, 25);
INSERT INTO `presensi_harian` VALUES (56, 89, 451, 'M', '', '2021-08-05', '2021-08-05 11:17:59', 3, 25);
INSERT INTO `presensi_harian` VALUES (57, 89, 453, 'M', '', '2021-08-05', '2021-08-05 11:17:59', 3, 25);
INSERT INTO `presensi_harian` VALUES (58, 89, 455, 'M', '', '2021-08-05', '2021-08-05 11:17:59', 3, 25);
INSERT INTO `presensi_harian` VALUES (59, 89, 457, 'M', '', '2021-08-05', '2021-08-05 11:17:59', 3, 25);
INSERT INTO `presensi_harian` VALUES (60, 89, 459, 'M', '', '2021-08-05', '2021-08-05 11:17:59', 3, 25);
INSERT INTO `presensi_harian` VALUES (61, 89, 461, 'M', '', '2021-08-05', '2021-08-05 11:17:59', 3, 25);
INSERT INTO `presensi_harian` VALUES (62, 89, 463, 'M', '', '2021-08-05', '2021-08-05 11:17:59', 3, 25);
INSERT INTO `presensi_harian` VALUES (63, 89, 465, 'M', '', '2021-08-05', '2021-08-05 11:17:59', 3, 25);
INSERT INTO `presensi_harian` VALUES (64, 89, 467, 'M', '', '2021-08-05', '2021-08-05 11:18:00', 3, 25);
INSERT INTO `presensi_harian` VALUES (65, 89, 469, 'M', '', '2021-08-05', '2021-08-05 11:18:00', 3, 25);
INSERT INTO `presensi_harian` VALUES (66, 89, 471, 'M', '', '2021-08-05', '2021-08-05 11:18:00', 3, 25);
INSERT INTO `presensi_harian` VALUES (67, 89, 472, 'M', '', '2021-08-05', '2021-08-05 11:18:00', 3, 25);
INSERT INTO `presensi_harian` VALUES (68, 89, 475, 'M', '', '2021-08-05', '2021-08-05 11:18:00', 3, 25);
INSERT INTO `presensi_harian` VALUES (69, 89, 478, 'M', '', '2021-08-05', '2021-08-05 11:18:00', 3, 25);
INSERT INTO `presensi_harian` VALUES (70, 89, 480, 'M', '', '2021-08-05', '2021-08-05 11:18:00', 3, 25);
INSERT INTO `presensi_harian` VALUES (71, 89, 482, 'M', '', '2021-08-05', '2021-08-05 11:18:00', 3, 25);
INSERT INTO `presensi_harian` VALUES (72, 89, 484, 'M', '', '2021-08-05', '2021-08-05 11:18:00', 3, 25);
INSERT INTO `presensi_harian` VALUES (73, 89, 486, 'M', '', '2021-08-05', '2021-08-05 11:18:00', 3, 25);
INSERT INTO `presensi_harian` VALUES (74, 89, 488, 'M', '', '2021-08-05', '2021-08-05 11:18:00', 3, 25);
INSERT INTO `presensi_harian` VALUES (75, 89, 490, 'M', '', '2021-08-05', '2021-08-05 11:18:00', 3, 25);
INSERT INTO `presensi_harian` VALUES (76, 89, 491, 'M', '', '2021-08-05', '2021-08-05 11:18:00', 3, 25);
INSERT INTO `presensi_harian` VALUES (77, 58, 433, 'S', '', '2021-08-05', '2021-08-05 11:23:34', 3, 25);
INSERT INTO `presensi_harian` VALUES (78, 58, 435, 'A', '', '2021-08-05', '2021-08-05 11:23:34', 3, 25);
INSERT INTO `presensi_harian` VALUES (79, 58, 437, 'M', '', '2021-08-05', '2021-08-05 11:23:34', 3, 25);
INSERT INTO `presensi_harian` VALUES (80, 58, 439, 'M', '', '2021-08-05', '2021-08-05 11:23:34', 3, 25);
INSERT INTO `presensi_harian` VALUES (81, 58, 441, 'M', '', '2021-08-05', '2021-08-05 11:23:34', 3, 25);
INSERT INTO `presensi_harian` VALUES (82, 58, 443, 'M', '', '2021-08-05', '2021-08-05 11:23:34', 3, 25);
INSERT INTO `presensi_harian` VALUES (83, 58, 445, 'M', '', '2021-08-05', '2021-08-05 11:23:34', 3, 25);
INSERT INTO `presensi_harian` VALUES (84, 58, 447, 'M', '', '2021-08-05', '2021-08-05 11:23:34', 3, 25);
INSERT INTO `presensi_harian` VALUES (85, 58, 449, 'M', '', '2021-08-05', '2021-08-05 11:23:34', 3, 25);
INSERT INTO `presensi_harian` VALUES (86, 58, 451, 'M', '', '2021-08-05', '2021-08-05 11:23:34', 3, 25);
INSERT INTO `presensi_harian` VALUES (87, 58, 453, 'M', '', '2021-08-05', '2021-08-05 11:23:34', 3, 25);
INSERT INTO `presensi_harian` VALUES (88, 58, 455, 'M', '', '2021-08-05', '2021-08-05 11:23:34', 3, 25);
INSERT INTO `presensi_harian` VALUES (89, 58, 457, 'M', '', '2021-08-05', '2021-08-05 11:23:35', 3, 25);
INSERT INTO `presensi_harian` VALUES (90, 58, 459, 'M', '', '2021-08-05', '2021-08-05 11:23:35', 3, 25);
INSERT INTO `presensi_harian` VALUES (91, 58, 461, 'M', '', '2021-08-05', '2021-08-05 11:23:35', 3, 25);
INSERT INTO `presensi_harian` VALUES (92, 58, 463, 'M', '', '2021-08-05', '2021-08-05 11:23:35', 3, 25);
INSERT INTO `presensi_harian` VALUES (93, 58, 465, 'M', '', '2021-08-05', '2021-08-05 11:23:35', 3, 25);
INSERT INTO `presensi_harian` VALUES (94, 58, 467, 'M', '', '2021-08-05', '2021-08-05 11:23:35', 3, 25);
INSERT INTO `presensi_harian` VALUES (95, 58, 469, 'M', '', '2021-08-05', '2021-08-05 11:23:35', 3, 25);
INSERT INTO `presensi_harian` VALUES (96, 58, 471, 'M', '', '2021-08-05', '2021-08-05 11:23:35', 3, 25);
INSERT INTO `presensi_harian` VALUES (97, 58, 472, 'M', '', '2021-08-05', '2021-08-05 11:23:35', 3, 25);
INSERT INTO `presensi_harian` VALUES (98, 58, 475, 'M', '', '2021-08-05', '2021-08-05 11:23:35', 3, 25);
INSERT INTO `presensi_harian` VALUES (99, 58, 478, 'M', '', '2021-08-05', '2021-08-05 11:23:35', 3, 25);
INSERT INTO `presensi_harian` VALUES (100, 58, 480, 'M', '', '2021-08-05', '2021-08-05 11:23:35', 3, 25);
INSERT INTO `presensi_harian` VALUES (101, 58, 482, 'M', '', '2021-08-05', '2021-08-05 11:23:35', 3, 25);
INSERT INTO `presensi_harian` VALUES (102, 58, 484, 'M', '', '2021-08-05', '2021-08-05 11:23:35', 3, 25);
INSERT INTO `presensi_harian` VALUES (103, 58, 486, 'M', '', '2021-08-05', '2021-08-05 11:23:35', 3, 25);
INSERT INTO `presensi_harian` VALUES (104, 58, 488, 'M', '', '2021-08-05', '2021-08-05 11:23:35', 3, 25);
INSERT INTO `presensi_harian` VALUES (105, 58, 490, 'M', '', '2021-08-05', '2021-08-05 11:23:35', 3, 25);
INSERT INTO `presensi_harian` VALUES (106, 58, 491, 'M', '', '2021-08-05', '2021-08-05 11:23:35', 3, 25);
INSERT INTO `presensi_harian` VALUES (107, 84, 314, 'M', '', '2021-08-05', '2021-08-05 11:27:27', 3, 30);
INSERT INTO `presensi_harian` VALUES (108, 84, 315, 'A', '', '2021-08-05', '2021-08-05 11:27:27', 3, 30);
INSERT INTO `presensi_harian` VALUES (109, 84, 316, 'M', '', '2021-08-05', '2021-08-05 11:27:27', 3, 30);
INSERT INTO `presensi_harian` VALUES (110, 84, 317, 'M', '', '2021-08-05', '2021-08-05 11:27:27', 3, 30);
INSERT INTO `presensi_harian` VALUES (111, 84, 318, 'A', '', '2021-08-05', '2021-08-05 11:27:27', 3, 30);
INSERT INTO `presensi_harian` VALUES (112, 84, 319, 'A', '', '2021-08-05', '2021-08-05 11:27:28', 3, 30);
INSERT INTO `presensi_harian` VALUES (113, 84, 320, 'M', '', '2021-08-05', '2021-08-05 11:27:28', 3, 30);
INSERT INTO `presensi_harian` VALUES (114, 84, 321, 'M', '', '2021-08-05', '2021-08-05 11:27:28', 3, 30);
INSERT INTO `presensi_harian` VALUES (115, 84, 322, 'M', '', '2021-08-05', '2021-08-05 11:27:28', 3, 30);
INSERT INTO `presensi_harian` VALUES (116, 84, 323, 'M', '', '2021-08-05', '2021-08-05 11:27:28', 3, 30);
INSERT INTO `presensi_harian` VALUES (117, 84, 324, 'M', '', '2021-08-05', '2021-08-05 11:27:28', 3, 30);
INSERT INTO `presensi_harian` VALUES (118, 84, 325, 'M', '', '2021-08-05', '2021-08-05 11:27:28', 3, 30);
INSERT INTO `presensi_harian` VALUES (119, 84, 326, 'M', '', '2021-08-05', '2021-08-05 11:27:28', 3, 30);
INSERT INTO `presensi_harian` VALUES (120, 84, 327, 'M', '', '2021-08-05', '2021-08-05 11:27:28', 3, 30);
INSERT INTO `presensi_harian` VALUES (121, 84, 328, 'M', '', '2021-08-05', '2021-08-05 11:27:28', 3, 30);
INSERT INTO `presensi_harian` VALUES (122, 84, 329, 'A', '', '2021-08-05', '2021-08-05 11:27:28', 3, 30);
INSERT INTO `presensi_harian` VALUES (123, 84, 330, 'A', '', '2021-08-05', '2021-08-05 11:27:28', 3, 30);
INSERT INTO `presensi_harian` VALUES (124, 84, 331, 'A', '', '2021-08-05', '2021-08-05 11:27:28', 3, 30);
INSERT INTO `presensi_harian` VALUES (125, 84, 332, 'A', '', '2021-08-05', '2021-08-05 11:27:28', 3, 30);
INSERT INTO `presensi_harian` VALUES (126, 84, 333, 'A', '', '2021-08-05', '2021-08-05 11:27:28', 3, 30);
INSERT INTO `presensi_harian` VALUES (127, 84, 334, 'A', '', '2021-08-05', '2021-08-05 11:27:28', 3, 30);
INSERT INTO `presensi_harian` VALUES (128, 36, 314, 'M', '', '2021-08-05', '2021-08-05 11:30:05', 3, 30);
INSERT INTO `presensi_harian` VALUES (129, 36, 315, 'A', '', '2021-08-05', '2021-08-05 11:30:05', 3, 30);
INSERT INTO `presensi_harian` VALUES (130, 36, 316, 'M', '', '2021-08-05', '2021-08-05 11:30:05', 3, 30);
INSERT INTO `presensi_harian` VALUES (131, 36, 317, 'A', '', '2021-08-05', '2021-08-05 11:30:05', 3, 30);
INSERT INTO `presensi_harian` VALUES (132, 36, 318, 'A', '', '2021-08-05', '2021-08-05 11:30:06', 3, 30);
INSERT INTO `presensi_harian` VALUES (133, 36, 319, 'M', '', '2021-08-05', '2021-08-05 11:30:06', 3, 30);
INSERT INTO `presensi_harian` VALUES (134, 36, 320, 'M', '', '2021-08-05', '2021-08-05 11:30:06', 3, 30);
INSERT INTO `presensi_harian` VALUES (135, 36, 321, 'M', '', '2021-08-05', '2021-08-05 11:30:06', 3, 30);
INSERT INTO `presensi_harian` VALUES (136, 36, 322, 'M', '', '2021-08-05', '2021-08-05 11:30:06', 3, 30);
INSERT INTO `presensi_harian` VALUES (137, 36, 323, 'M', '', '2021-08-05', '2021-08-05 11:30:06', 3, 30);
INSERT INTO `presensi_harian` VALUES (138, 36, 324, 'M', '', '2021-08-05', '2021-08-05 11:30:06', 3, 30);
INSERT INTO `presensi_harian` VALUES (139, 36, 325, 'M', '', '2021-08-05', '2021-08-05 11:30:06', 3, 30);
INSERT INTO `presensi_harian` VALUES (140, 36, 326, 'M', '', '2021-08-05', '2021-08-05 11:30:06', 3, 30);
INSERT INTO `presensi_harian` VALUES (141, 36, 327, 'M', '', '2021-08-05', '2021-08-05 11:30:06', 3, 30);
INSERT INTO `presensi_harian` VALUES (142, 36, 328, 'M', '', '2021-08-05', '2021-08-05 11:30:06', 3, 30);
INSERT INTO `presensi_harian` VALUES (143, 36, 329, 'A', '', '2021-08-05', '2021-08-05 11:30:06', 3, 30);
INSERT INTO `presensi_harian` VALUES (144, 36, 330, 'A', '', '2021-08-05', '2021-08-05 11:30:06', 3, 30);
INSERT INTO `presensi_harian` VALUES (145, 36, 331, 'M', '', '2021-08-05', '2021-08-05 11:30:06', 3, 30);
INSERT INTO `presensi_harian` VALUES (146, 36, 332, 'A', '', '2021-08-05', '2021-08-05 11:30:07', 3, 30);
INSERT INTO `presensi_harian` VALUES (147, 36, 333, 'A', '', '2021-08-05', '2021-08-05 11:30:07', 3, 30);
INSERT INTO `presensi_harian` VALUES (148, 36, 334, 'A', '', '2021-08-05', '2021-08-05 11:30:07', 3, 30);
INSERT INTO `presensi_harian` VALUES (149, 84, 378, 'M', '', '2021-08-05', '2021-08-05 11:33:12', 3, 32);
INSERT INTO `presensi_harian` VALUES (150, 84, 379, 'M', '', '2021-08-05', '2021-08-05 11:33:12', 3, 32);
INSERT INTO `presensi_harian` VALUES (151, 84, 380, 'M', '', '2021-08-05', '2021-08-05 11:33:12', 3, 32);
INSERT INTO `presensi_harian` VALUES (152, 84, 381, 'M', '', '2021-08-05', '2021-08-05 11:33:12', 3, 32);
INSERT INTO `presensi_harian` VALUES (153, 84, 382, 'M', '', '2021-08-05', '2021-08-05 11:33:12', 3, 32);
INSERT INTO `presensi_harian` VALUES (154, 84, 383, 'M', '', '2021-08-05', '2021-08-05 11:33:13', 3, 32);
INSERT INTO `presensi_harian` VALUES (155, 84, 384, 'M', '', '2021-08-05', '2021-08-05 11:33:13', 3, 32);
INSERT INTO `presensi_harian` VALUES (156, 84, 385, 'S', '', '2021-08-05', '2021-08-05 11:33:13', 3, 32);
INSERT INTO `presensi_harian` VALUES (157, 84, 386, 'M', '', '2021-08-05', '2021-08-05 11:33:13', 3, 32);
INSERT INTO `presensi_harian` VALUES (158, 84, 387, 'M', '', '2021-08-05', '2021-08-05 11:33:13', 3, 32);
INSERT INTO `presensi_harian` VALUES (159, 84, 388, 'M', '', '2021-08-05', '2021-08-05 11:33:13', 3, 32);
INSERT INTO `presensi_harian` VALUES (160, 84, 389, 'M', '', '2021-08-05', '2021-08-05 11:33:13', 3, 32);
INSERT INTO `presensi_harian` VALUES (161, 84, 390, 'M', '', '2021-08-05', '2021-08-05 11:33:13', 3, 32);
INSERT INTO `presensi_harian` VALUES (162, 84, 391, 'M', '', '2021-08-05', '2021-08-05 11:33:13', 3, 32);
INSERT INTO `presensi_harian` VALUES (163, 84, 392, 'M', '', '2021-08-05', '2021-08-05 11:33:13', 3, 32);
INSERT INTO `presensi_harian` VALUES (164, 84, 393, 'M', '', '2021-08-05', '2021-08-05 11:33:13', 3, 32);
INSERT INTO `presensi_harian` VALUES (165, 84, 394, 'M', '', '2021-08-05', '2021-08-05 11:33:13', 3, 32);
INSERT INTO `presensi_harian` VALUES (166, 84, 395, 'M', '', '2021-08-05', '2021-08-05 11:33:13', 3, 32);
INSERT INTO `presensi_harian` VALUES (167, 84, 396, 'M', '', '2021-08-05', '2021-08-05 11:33:13', 3, 32);
INSERT INTO `presensi_harian` VALUES (168, 84, 397, 'M', '', '2021-08-05', '2021-08-05 11:33:13', 3, 32);
INSERT INTO `presensi_harian` VALUES (169, 84, 398, 'M', '', '2021-08-05', '2021-08-05 11:33:13', 3, 32);
INSERT INTO `presensi_harian` VALUES (170, 84, 399, 'M', '', '2021-08-05', '2021-08-05 11:33:13', 3, 32);
INSERT INTO `presensi_harian` VALUES (171, 84, 400, 'M', '', '2021-08-05', '2021-08-05 11:33:13', 3, 32);
INSERT INTO `presensi_harian` VALUES (172, 44, 378, 'M', '', '2021-08-05', '2021-08-05 11:33:27', 3, 32);
INSERT INTO `presensi_harian` VALUES (173, 44, 379, 'M', '', '2021-08-05', '2021-08-05 11:33:27', 3, 32);
INSERT INTO `presensi_harian` VALUES (174, 44, 380, 'M', '', '2021-08-05', '2021-08-05 11:33:27', 3, 32);
INSERT INTO `presensi_harian` VALUES (175, 44, 381, 'M', '', '2021-08-05', '2021-08-05 11:33:27', 3, 32);
INSERT INTO `presensi_harian` VALUES (176, 44, 382, 'M', '', '2021-08-05', '2021-08-05 11:33:27', 3, 32);
INSERT INTO `presensi_harian` VALUES (177, 44, 383, 'M', '', '2021-08-05', '2021-08-05 11:33:27', 3, 32);
INSERT INTO `presensi_harian` VALUES (178, 44, 384, 'M', '', '2021-08-05', '2021-08-05 11:33:27', 3, 32);
INSERT INTO `presensi_harian` VALUES (179, 44, 385, 'S', '', '2021-08-05', '2021-08-05 11:33:27', 3, 32);
INSERT INTO `presensi_harian` VALUES (180, 44, 386, 'M', '', '2021-08-05', '2021-08-05 11:33:28', 3, 32);
INSERT INTO `presensi_harian` VALUES (181, 44, 387, 'M', '', '2021-08-05', '2021-08-05 11:33:28', 3, 32);
INSERT INTO `presensi_harian` VALUES (182, 44, 388, 'M', '', '2021-08-05', '2021-08-05 11:33:28', 3, 32);
INSERT INTO `presensi_harian` VALUES (183, 44, 389, 'M', '', '2021-08-05', '2021-08-05 11:33:28', 3, 32);
INSERT INTO `presensi_harian` VALUES (184, 44, 390, 'M', '', '2021-08-05', '2021-08-05 11:33:28', 3, 32);
INSERT INTO `presensi_harian` VALUES (185, 44, 391, 'M', '', '2021-08-05', '2021-08-05 11:33:28', 3, 32);
INSERT INTO `presensi_harian` VALUES (186, 44, 392, 'M', '', '2021-08-05', '2021-08-05 11:33:28', 3, 32);
INSERT INTO `presensi_harian` VALUES (187, 44, 393, 'M', '', '2021-08-05', '2021-08-05 11:33:28', 3, 32);
INSERT INTO `presensi_harian` VALUES (188, 44, 394, 'M', '', '2021-08-05', '2021-08-05 11:33:28', 3, 32);
INSERT INTO `presensi_harian` VALUES (189, 44, 395, 'M', '', '2021-08-05', '2021-08-05 11:33:28', 3, 32);
INSERT INTO `presensi_harian` VALUES (190, 44, 396, 'M', '', '2021-08-05', '2021-08-05 11:33:28', 3, 32);
INSERT INTO `presensi_harian` VALUES (191, 44, 397, 'M', '', '2021-08-05', '2021-08-05 11:33:28', 3, 32);
INSERT INTO `presensi_harian` VALUES (192, 44, 398, 'M', '', '2021-08-05', '2021-08-05 11:33:28', 3, 32);
INSERT INTO `presensi_harian` VALUES (193, 44, 399, 'M', '', '2021-08-05', '2021-08-05 11:33:28', 3, 32);
INSERT INTO `presensi_harian` VALUES (194, 44, 400, 'M', '', '2021-08-05', '2021-08-05 11:33:28', 3, 32);
INSERT INTO `presensi_harian` VALUES (195, 36, 293, 'M', '', '2021-08-05', '2021-08-05 11:36:55', 3, 29);
INSERT INTO `presensi_harian` VALUES (196, 36, 294, 'M', '', '2021-08-05', '2021-08-05 11:36:55', 3, 29);
INSERT INTO `presensi_harian` VALUES (197, 36, 295, 'M', '', '2021-08-05', '2021-08-05 11:36:55', 3, 29);
INSERT INTO `presensi_harian` VALUES (198, 36, 296, 'M', '', '2021-08-05', '2021-08-05 11:36:55', 3, 29);
INSERT INTO `presensi_harian` VALUES (199, 36, 297, 'A', '', '2021-08-05', '2021-08-05 11:36:55', 3, 29);
INSERT INTO `presensi_harian` VALUES (200, 36, 298, 'A', '', '2021-08-05', '2021-08-05 11:36:55', 3, 29);
INSERT INTO `presensi_harian` VALUES (201, 36, 299, 'M', '', '2021-08-05', '2021-08-05 11:36:55', 3, 29);
INSERT INTO `presensi_harian` VALUES (202, 36, 300, 'M', '', '2021-08-05', '2021-08-05 11:36:55', 3, 29);
INSERT INTO `presensi_harian` VALUES (203, 36, 301, 'I', '', '2021-08-05', '2021-08-05 11:36:55', 3, 29);
INSERT INTO `presensi_harian` VALUES (204, 36, 302, 'M', '', '2021-08-05', '2021-08-05 11:36:55', 3, 29);
INSERT INTO `presensi_harian` VALUES (205, 36, 303, 'M', '', '2021-08-05', '2021-08-05 11:36:55', 3, 29);
INSERT INTO `presensi_harian` VALUES (206, 36, 304, 'M', '', '2021-08-05', '2021-08-05 11:36:55', 3, 29);
INSERT INTO `presensi_harian` VALUES (207, 36, 305, 'M', '', '2021-08-05', '2021-08-05 11:36:55', 3, 29);
INSERT INTO `presensi_harian` VALUES (208, 36, 306, 'M', '', '2021-08-05', '2021-08-05 11:36:55', 3, 29);
INSERT INTO `presensi_harian` VALUES (209, 36, 307, 'M', '', '2021-08-05', '2021-08-05 11:36:55', 3, 29);
INSERT INTO `presensi_harian` VALUES (210, 36, 308, 'M', '', '2021-08-05', '2021-08-05 11:36:56', 3, 29);
INSERT INTO `presensi_harian` VALUES (211, 36, 309, 'I', '', '2021-08-05', '2021-08-05 11:36:56', 3, 29);
INSERT INTO `presensi_harian` VALUES (212, 36, 310, 'M', '', '2021-08-05', '2021-08-05 11:36:56', 3, 29);
INSERT INTO `presensi_harian` VALUES (213, 36, 311, 'M', '', '2021-08-05', '2021-08-05 11:36:56', 3, 29);
INSERT INTO `presensi_harian` VALUES (214, 36, 312, 'M', '', '2021-08-05', '2021-08-05 11:36:56', 3, 29);
INSERT INTO `presensi_harian` VALUES (215, 36, 313, 'M', '', '2021-08-05', '2021-08-05 11:36:56', 3, 29);
INSERT INTO `presensi_harian` VALUES (216, 32, 293, 'M', '', '2021-08-05', '2021-08-05 11:37:43', 3, 29);
INSERT INTO `presensi_harian` VALUES (217, 32, 294, 'M', '', '2021-08-05', '2021-08-05 11:37:43', 3, 29);
INSERT INTO `presensi_harian` VALUES (218, 32, 295, 'M', '', '2021-08-05', '2021-08-05 11:37:43', 3, 29);
INSERT INTO `presensi_harian` VALUES (219, 32, 296, 'M', '', '2021-08-05', '2021-08-05 11:37:43', 3, 29);
INSERT INTO `presensi_harian` VALUES (220, 32, 297, 'A', '', '2021-08-05', '2021-08-05 11:37:43', 3, 29);
INSERT INTO `presensi_harian` VALUES (221, 32, 298, 'A', '', '2021-08-05', '2021-08-05 11:37:43', 3, 29);
INSERT INTO `presensi_harian` VALUES (222, 32, 299, 'M', '', '2021-08-05', '2021-08-05 11:37:43', 3, 29);
INSERT INTO `presensi_harian` VALUES (223, 32, 300, 'M', '', '2021-08-05', '2021-08-05 11:37:43', 3, 29);
INSERT INTO `presensi_harian` VALUES (224, 32, 301, 'I', '', '2021-08-05', '2021-08-05 11:37:43', 3, 29);
INSERT INTO `presensi_harian` VALUES (225, 32, 302, 'M', '', '2021-08-05', '2021-08-05 11:37:43', 3, 29);
INSERT INTO `presensi_harian` VALUES (226, 32, 303, 'M', '', '2021-08-05', '2021-08-05 11:37:43', 3, 29);
INSERT INTO `presensi_harian` VALUES (227, 32, 304, 'M', '', '2021-08-05', '2021-08-05 11:37:43', 3, 29);
INSERT INTO `presensi_harian` VALUES (228, 32, 305, 'M', '', '2021-08-05', '2021-08-05 11:37:43', 3, 29);
INSERT INTO `presensi_harian` VALUES (229, 32, 306, 'M', '', '2021-08-05', '2021-08-05 11:37:44', 3, 29);
INSERT INTO `presensi_harian` VALUES (230, 32, 307, 'M', '', '2021-08-05', '2021-08-05 11:37:44', 3, 29);
INSERT INTO `presensi_harian` VALUES (231, 32, 308, 'M', '', '2021-08-05', '2021-08-05 11:37:44', 3, 29);
INSERT INTO `presensi_harian` VALUES (232, 32, 309, 'I', '', '2021-08-05', '2021-08-05 11:37:44', 3, 29);
INSERT INTO `presensi_harian` VALUES (233, 32, 310, 'M', '', '2021-08-05', '2021-08-05 11:37:44', 3, 29);
INSERT INTO `presensi_harian` VALUES (234, 32, 311, 'M', '', '2021-08-05', '2021-08-05 11:37:44', 3, 29);
INSERT INTO `presensi_harian` VALUES (235, 32, 312, 'M', '', '2021-08-05', '2021-08-05 11:37:44', 3, 29);
INSERT INTO `presensi_harian` VALUES (236, 32, 313, 'M', '', '2021-08-05', '2021-08-05 11:37:44', 3, 29);
INSERT INTO `presensi_harian` VALUES (237, 86, 293, 'M', '', '2021-08-05', '2021-08-05 11:38:05', 3, 29);
INSERT INTO `presensi_harian` VALUES (238, 86, 294, 'M', '', '2021-08-05', '2021-08-05 11:38:06', 3, 29);
INSERT INTO `presensi_harian` VALUES (239, 86, 295, 'M', '', '2021-08-05', '2021-08-05 11:38:06', 3, 29);
INSERT INTO `presensi_harian` VALUES (240, 86, 296, 'M', '', '2021-08-05', '2021-08-05 11:38:06', 3, 29);
INSERT INTO `presensi_harian` VALUES (241, 86, 297, 'A', '', '2021-08-05', '2021-08-05 11:38:06', 3, 29);
INSERT INTO `presensi_harian` VALUES (242, 86, 298, 'A', '', '2021-08-05', '2021-08-05 11:38:06', 3, 29);
INSERT INTO `presensi_harian` VALUES (243, 86, 299, 'M', '', '2021-08-05', '2021-08-05 11:38:06', 3, 29);
INSERT INTO `presensi_harian` VALUES (244, 86, 300, 'M', '', '2021-08-05', '2021-08-05 11:38:06', 3, 29);
INSERT INTO `presensi_harian` VALUES (245, 86, 301, 'I', '', '2021-08-05', '2021-08-05 11:38:06', 3, 29);
INSERT INTO `presensi_harian` VALUES (246, 86, 302, 'M', '', '2021-08-05', '2021-08-05 11:38:06', 3, 29);
INSERT INTO `presensi_harian` VALUES (247, 86, 303, 'M', '', '2021-08-05', '2021-08-05 11:38:06', 3, 29);
INSERT INTO `presensi_harian` VALUES (248, 86, 304, 'M', '', '2021-08-05', '2021-08-05 11:38:06', 3, 29);
INSERT INTO `presensi_harian` VALUES (249, 86, 305, 'M', '', '2021-08-05', '2021-08-05 11:38:06', 3, 29);
INSERT INTO `presensi_harian` VALUES (250, 86, 306, 'M', '', '2021-08-05', '2021-08-05 11:38:06', 3, 29);
INSERT INTO `presensi_harian` VALUES (251, 86, 307, 'M', '', '2021-08-05', '2021-08-05 11:38:06', 3, 29);
INSERT INTO `presensi_harian` VALUES (252, 86, 308, 'M', '', '2021-08-05', '2021-08-05 11:38:07', 3, 29);
INSERT INTO `presensi_harian` VALUES (253, 86, 309, 'I', '', '2021-08-05', '2021-08-05 11:38:07', 3, 29);
INSERT INTO `presensi_harian` VALUES (254, 86, 310, 'M', '', '2021-08-05', '2021-08-05 11:38:07', 3, 29);
INSERT INTO `presensi_harian` VALUES (255, 86, 311, 'M', '', '2021-08-05', '2021-08-05 11:38:07', 3, 29);
INSERT INTO `presensi_harian` VALUES (256, 86, 312, 'M', '', '2021-08-05', '2021-08-05 11:38:07', 3, 29);
INSERT INTO `presensi_harian` VALUES (257, 86, 313, 'M', '', '2021-08-05', '2021-08-05 11:38:07', 3, 29);
INSERT INTO `presensi_harian` VALUES (258, 36, 275, 'M', '', '2021-08-05', '2021-08-05 11:42:04', 3, 28);
INSERT INTO `presensi_harian` VALUES (259, 36, 276, 'M', '', '2021-08-05', '2021-08-05 11:42:04', 3, 28);
INSERT INTO `presensi_harian` VALUES (260, 36, 277, 'M', '', '2021-08-05', '2021-08-05 11:42:04', 3, 28);
INSERT INTO `presensi_harian` VALUES (261, 36, 278, 'M', '', '2021-08-05', '2021-08-05 11:42:04', 3, 28);
INSERT INTO `presensi_harian` VALUES (262, 36, 279, 'M', '', '2021-08-05', '2021-08-05 11:42:04', 3, 28);
INSERT INTO `presensi_harian` VALUES (263, 36, 280, 'M', '', '2021-08-05', '2021-08-05 11:42:04', 3, 28);
INSERT INTO `presensi_harian` VALUES (264, 36, 281, 'M', '', '2021-08-05', '2021-08-05 11:42:04', 3, 28);
INSERT INTO `presensi_harian` VALUES (265, 36, 282, 'M', '', '2021-08-05', '2021-08-05 11:42:04', 3, 28);
INSERT INTO `presensi_harian` VALUES (266, 36, 283, 'M', '', '2021-08-05', '2021-08-05 11:42:05', 3, 28);
INSERT INTO `presensi_harian` VALUES (267, 36, 284, 'M', '', '2021-08-05', '2021-08-05 11:42:05', 3, 28);
INSERT INTO `presensi_harian` VALUES (268, 36, 285, 'M', '', '2021-08-05', '2021-08-05 11:42:05', 3, 28);
INSERT INTO `presensi_harian` VALUES (269, 36, 286, 'M', '', '2021-08-05', '2021-08-05 11:42:05', 3, 28);
INSERT INTO `presensi_harian` VALUES (270, 36, 287, 'M', '', '2021-08-05', '2021-08-05 11:42:05', 3, 28);
INSERT INTO `presensi_harian` VALUES (271, 36, 288, 'M', '', '2021-08-05', '2021-08-05 11:42:05', 3, 28);
INSERT INTO `presensi_harian` VALUES (272, 36, 289, 'M', '', '2021-08-05', '2021-08-05 11:42:05', 3, 28);
INSERT INTO `presensi_harian` VALUES (273, 36, 290, 'A', '', '2021-08-05', '2021-08-05 11:42:05', 3, 28);
INSERT INTO `presensi_harian` VALUES (274, 36, 291, 'M', '', '2021-08-05', '2021-08-05 11:42:05', 3, 28);
INSERT INTO `presensi_harian` VALUES (275, 36, 292, 'M', '', '2021-08-05', '2021-08-05 11:42:05', 3, 28);
INSERT INTO `presensi_harian` VALUES (276, 86, 275, 'M', '', '2021-08-05', '2021-08-05 11:42:38', 3, 28);
INSERT INTO `presensi_harian` VALUES (277, 86, 276, 'M', '', '2021-08-05', '2021-08-05 11:42:39', 3, 28);
INSERT INTO `presensi_harian` VALUES (278, 86, 277, 'M', '', '2021-08-05', '2021-08-05 11:42:39', 3, 28);
INSERT INTO `presensi_harian` VALUES (279, 86, 278, 'M', '', '2021-08-05', '2021-08-05 11:42:39', 3, 28);
INSERT INTO `presensi_harian` VALUES (280, 86, 279, 'M', '', '2021-08-05', '2021-08-05 11:42:39', 3, 28);
INSERT INTO `presensi_harian` VALUES (281, 86, 280, 'M', '', '2021-08-05', '2021-08-05 11:42:39', 3, 28);
INSERT INTO `presensi_harian` VALUES (282, 86, 281, 'M', '', '2021-08-05', '2021-08-05 11:42:39', 3, 28);
INSERT INTO `presensi_harian` VALUES (283, 86, 282, 'M', '', '2021-08-05', '2021-08-05 11:42:39', 3, 28);
INSERT INTO `presensi_harian` VALUES (284, 86, 283, 'M', '', '2021-08-05', '2021-08-05 11:42:39', 3, 28);
INSERT INTO `presensi_harian` VALUES (285, 86, 284, 'M', '', '2021-08-05', '2021-08-05 11:42:39', 3, 28);
INSERT INTO `presensi_harian` VALUES (286, 86, 285, 'M', '', '2021-08-05', '2021-08-05 11:42:39', 3, 28);
INSERT INTO `presensi_harian` VALUES (287, 86, 286, 'M', '', '2021-08-05', '2021-08-05 11:42:39', 3, 28);
INSERT INTO `presensi_harian` VALUES (288, 86, 287, 'M', '', '2021-08-05', '2021-08-05 11:42:39', 3, 28);
INSERT INTO `presensi_harian` VALUES (289, 86, 288, 'M', '', '2021-08-05', '2021-08-05 11:42:39', 3, 28);
INSERT INTO `presensi_harian` VALUES (290, 86, 289, 'M', '', '2021-08-05', '2021-08-05 11:42:39', 3, 28);
INSERT INTO `presensi_harian` VALUES (291, 86, 290, 'A', '', '2021-08-05', '2021-08-05 11:42:39', 3, 28);
INSERT INTO `presensi_harian` VALUES (292, 86, 291, 'M', '', '2021-08-05', '2021-08-05 11:42:39', 3, 28);
INSERT INTO `presensi_harian` VALUES (293, 86, 292, 'M', '', '2021-08-05', '2021-08-05 11:42:39', 3, 28);
INSERT INTO `presensi_harian` VALUES (294, 43, 275, 'M', '', '2021-08-05', '2021-08-05 11:42:57', 3, 28);
INSERT INTO `presensi_harian` VALUES (295, 43, 276, 'M', '', '2021-08-05', '2021-08-05 11:42:57', 3, 28);
INSERT INTO `presensi_harian` VALUES (296, 43, 277, 'M', '', '2021-08-05', '2021-08-05 11:42:57', 3, 28);
INSERT INTO `presensi_harian` VALUES (297, 43, 278, 'M', '', '2021-08-05', '2021-08-05 11:42:58', 3, 28);
INSERT INTO `presensi_harian` VALUES (298, 43, 279, 'M', '', '2021-08-05', '2021-08-05 11:42:58', 3, 28);
INSERT INTO `presensi_harian` VALUES (299, 43, 280, 'M', '', '2021-08-05', '2021-08-05 11:42:58', 3, 28);
INSERT INTO `presensi_harian` VALUES (300, 43, 281, 'M', '', '2021-08-05', '2021-08-05 11:42:58', 3, 28);
INSERT INTO `presensi_harian` VALUES (301, 43, 282, 'M', '', '2021-08-05', '2021-08-05 11:42:58', 3, 28);
INSERT INTO `presensi_harian` VALUES (302, 43, 283, 'M', '', '2021-08-05', '2021-08-05 11:42:58', 3, 28);
INSERT INTO `presensi_harian` VALUES (303, 43, 284, 'M', '', '2021-08-05', '2021-08-05 11:42:58', 3, 28);
INSERT INTO `presensi_harian` VALUES (304, 43, 285, 'M', '', '2021-08-05', '2021-08-05 11:42:58', 3, 28);
INSERT INTO `presensi_harian` VALUES (305, 43, 286, 'M', '', '2021-08-05', '2021-08-05 11:42:58', 3, 28);
INSERT INTO `presensi_harian` VALUES (306, 43, 287, 'M', '', '2021-08-05', '2021-08-05 11:42:58', 3, 28);
INSERT INTO `presensi_harian` VALUES (307, 43, 288, 'M', '', '2021-08-05', '2021-08-05 11:42:58', 3, 28);
INSERT INTO `presensi_harian` VALUES (308, 43, 289, 'M', '', '2021-08-05', '2021-08-05 11:42:58', 3, 28);
INSERT INTO `presensi_harian` VALUES (309, 43, 290, 'A', '', '2021-08-05', '2021-08-05 11:42:59', 3, 28);
INSERT INTO `presensi_harian` VALUES (310, 43, 291, 'M', '', '2021-08-05', '2021-08-05 11:42:59', 3, 28);
INSERT INTO `presensi_harian` VALUES (311, 43, 292, 'M', '', '2021-08-05', '2021-08-05 11:42:59', 3, 28);
INSERT INTO `presensi_harian` VALUES (312, 44, 402, 'M', '', '2021-08-05', '2021-08-05 11:48:14', 3, 33);
INSERT INTO `presensi_harian` VALUES (313, 44, 403, 'M', '', '2021-08-05', '2021-08-05 11:48:14', 3, 33);
INSERT INTO `presensi_harian` VALUES (314, 44, 404, 'S', '', '2021-08-05', '2021-08-05 11:48:14', 3, 33);
INSERT INTO `presensi_harian` VALUES (315, 44, 405, 'M', '', '2021-08-05', '2021-08-05 11:48:14', 3, 33);
INSERT INTO `presensi_harian` VALUES (316, 44, 406, 'M', '', '2021-08-05', '2021-08-05 11:48:15', 3, 33);
INSERT INTO `presensi_harian` VALUES (317, 44, 407, 'M', '', '2021-08-05', '2021-08-05 11:48:15', 3, 33);
INSERT INTO `presensi_harian` VALUES (318, 44, 408, 'M', '', '2021-08-05', '2021-08-05 11:48:15', 3, 33);
INSERT INTO `presensi_harian` VALUES (319, 44, 409, 'M', '', '2021-08-05', '2021-08-05 11:48:15', 3, 33);
INSERT INTO `presensi_harian` VALUES (320, 44, 410, 'M', '', '2021-08-05', '2021-08-05 11:48:15', 3, 33);
INSERT INTO `presensi_harian` VALUES (321, 44, 411, 'M', '', '2021-08-05', '2021-08-05 11:48:15', 3, 33);
INSERT INTO `presensi_harian` VALUES (322, 44, 412, 'M', '', '2021-08-05', '2021-08-05 11:48:15', 3, 33);
INSERT INTO `presensi_harian` VALUES (323, 44, 413, 'A', '', '2021-08-05', '2021-08-05 11:48:15', 3, 33);
INSERT INTO `presensi_harian` VALUES (324, 44, 414, 'M', '', '2021-08-05', '2021-08-05 11:48:15', 3, 33);
INSERT INTO `presensi_harian` VALUES (325, 44, 415, 'M', '', '2021-08-05', '2021-08-05 11:48:15', 3, 33);
INSERT INTO `presensi_harian` VALUES (326, 44, 416, 'A', '', '2021-08-05', '2021-08-05 11:48:15', 3, 33);
INSERT INTO `presensi_harian` VALUES (327, 44, 417, 'M', '', '2021-08-05', '2021-08-05 11:48:15', 3, 33);
INSERT INTO `presensi_harian` VALUES (328, 44, 418, 'M', '', '2021-08-05', '2021-08-05 11:48:15', 3, 33);
INSERT INTO `presensi_harian` VALUES (329, 44, 419, 'M', '', '2021-08-05', '2021-08-05 11:48:15', 3, 33);
INSERT INTO `presensi_harian` VALUES (330, 44, 420, 'M', '', '2021-08-05', '2021-08-05 11:48:15', 3, 33);
INSERT INTO `presensi_harian` VALUES (331, 44, 421, 'M', '', '2021-08-05', '2021-08-05 11:48:15', 3, 33);
INSERT INTO `presensi_harian` VALUES (332, 44, 422, 'M', '', '2021-08-05', '2021-08-05 11:48:15', 3, 33);
INSERT INTO `presensi_harian` VALUES (333, 44, 423, 'M', '', '2021-08-05', '2021-08-05 11:48:16', 3, 33);
INSERT INTO `presensi_harian` VALUES (334, 44, 424, 'M', '', '2021-08-05', '2021-08-05 11:48:16', 3, 33);
INSERT INTO `presensi_harian` VALUES (335, 84, 402, 'M', '', '2021-08-05', '2021-08-05 11:48:41', 3, 33);
INSERT INTO `presensi_harian` VALUES (336, 84, 403, 'M', '', '2021-08-05', '2021-08-05 11:48:41', 3, 33);
INSERT INTO `presensi_harian` VALUES (337, 84, 404, 'S', '', '2021-08-05', '2021-08-05 11:48:41', 3, 33);
INSERT INTO `presensi_harian` VALUES (338, 84, 405, 'M', '', '2021-08-05', '2021-08-05 11:48:41', 3, 33);
INSERT INTO `presensi_harian` VALUES (339, 84, 406, 'M', '', '2021-08-05', '2021-08-05 11:48:41', 3, 33);
INSERT INTO `presensi_harian` VALUES (340, 84, 407, 'M', '', '2021-08-05', '2021-08-05 11:48:42', 3, 33);
INSERT INTO `presensi_harian` VALUES (341, 84, 408, 'M', '', '2021-08-05', '2021-08-05 11:48:42', 3, 33);
INSERT INTO `presensi_harian` VALUES (342, 84, 409, 'M', '', '2021-08-05', '2021-08-05 11:48:42', 3, 33);
INSERT INTO `presensi_harian` VALUES (343, 84, 410, 'M', '', '2021-08-05', '2021-08-05 11:48:42', 3, 33);
INSERT INTO `presensi_harian` VALUES (344, 84, 411, 'M', '', '2021-08-05', '2021-08-05 11:48:42', 3, 33);
INSERT INTO `presensi_harian` VALUES (345, 84, 412, 'M', '', '2021-08-05', '2021-08-05 11:48:42', 3, 33);
INSERT INTO `presensi_harian` VALUES (346, 84, 413, 'A', '', '2021-08-05', '2021-08-05 11:48:42', 3, 33);
INSERT INTO `presensi_harian` VALUES (347, 84, 414, 'M', '', '2021-08-05', '2021-08-05 11:48:42', 3, 33);
INSERT INTO `presensi_harian` VALUES (348, 84, 415, 'M', '', '2021-08-05', '2021-08-05 11:48:42', 3, 33);
INSERT INTO `presensi_harian` VALUES (349, 84, 416, 'A', '', '2021-08-05', '2021-08-05 11:48:42', 3, 33);
INSERT INTO `presensi_harian` VALUES (350, 84, 417, 'M', '', '2021-08-05', '2021-08-05 11:48:42', 3, 33);
INSERT INTO `presensi_harian` VALUES (351, 84, 418, 'M', '', '2021-08-05', '2021-08-05 11:48:42', 3, 33);
INSERT INTO `presensi_harian` VALUES (352, 84, 419, 'M', '', '2021-08-05', '2021-08-05 11:48:42', 3, 33);
INSERT INTO `presensi_harian` VALUES (353, 84, 420, 'M', '', '2021-08-05', '2021-08-05 11:48:42', 3, 33);
INSERT INTO `presensi_harian` VALUES (354, 84, 421, 'M', '', '2021-08-05', '2021-08-05 11:48:42', 3, 33);
INSERT INTO `presensi_harian` VALUES (355, 84, 422, 'M', '', '2021-08-05', '2021-08-05 11:48:43', 3, 33);
INSERT INTO `presensi_harian` VALUES (356, 84, 423, 'M', '', '2021-08-05', '2021-08-05 11:48:43', 3, 33);
INSERT INTO `presensi_harian` VALUES (357, 84, 424, 'M', '', '2021-08-05', '2021-08-05 11:48:43', 3, 33);
INSERT INTO `presensi_harian` VALUES (358, 86, 402, 'M', '', '2021-08-05', '2021-08-05 11:49:07', 3, 33);
INSERT INTO `presensi_harian` VALUES (359, 86, 403, 'M', '', '2021-08-05', '2021-08-05 11:49:07', 3, 33);
INSERT INTO `presensi_harian` VALUES (360, 86, 404, 'S', '', '2021-08-05', '2021-08-05 11:49:07', 3, 33);
INSERT INTO `presensi_harian` VALUES (361, 86, 405, 'M', '', '2021-08-05', '2021-08-05 11:49:07', 3, 33);
INSERT INTO `presensi_harian` VALUES (362, 86, 406, 'M', '', '2021-08-05', '2021-08-05 11:49:07', 3, 33);
INSERT INTO `presensi_harian` VALUES (363, 86, 407, 'M', '', '2021-08-05', '2021-08-05 11:49:07', 3, 33);
INSERT INTO `presensi_harian` VALUES (364, 86, 408, 'M', '', '2021-08-05', '2021-08-05 11:49:07', 3, 33);
INSERT INTO `presensi_harian` VALUES (365, 86, 409, 'M', '', '2021-08-05', '2021-08-05 11:49:07', 3, 33);
INSERT INTO `presensi_harian` VALUES (366, 86, 410, 'M', '', '2021-08-05', '2021-08-05 11:49:07', 3, 33);
INSERT INTO `presensi_harian` VALUES (367, 86, 411, 'M', '', '2021-08-05', '2021-08-05 11:49:07', 3, 33);
INSERT INTO `presensi_harian` VALUES (368, 86, 412, 'M', '', '2021-08-05', '2021-08-05 11:49:08', 3, 33);
INSERT INTO `presensi_harian` VALUES (369, 86, 413, 'A', '', '2021-08-05', '2021-08-05 11:49:08', 3, 33);
INSERT INTO `presensi_harian` VALUES (370, 86, 414, 'M', '', '2021-08-05', '2021-08-05 11:49:08', 3, 33);
INSERT INTO `presensi_harian` VALUES (371, 86, 415, 'M', '', '2021-08-05', '2021-08-05 11:49:08', 3, 33);
INSERT INTO `presensi_harian` VALUES (372, 86, 416, 'A', '', '2021-08-05', '2021-08-05 11:49:08', 3, 33);
INSERT INTO `presensi_harian` VALUES (373, 86, 417, 'M', '', '2021-08-05', '2021-08-05 11:49:08', 3, 33);
INSERT INTO `presensi_harian` VALUES (374, 86, 418, 'M', '', '2021-08-05', '2021-08-05 11:49:08', 3, 33);
INSERT INTO `presensi_harian` VALUES (375, 86, 419, 'M', '', '2021-08-05', '2021-08-05 11:49:08', 3, 33);
INSERT INTO `presensi_harian` VALUES (376, 86, 420, 'M', '', '2021-08-05', '2021-08-05 11:49:08', 3, 33);
INSERT INTO `presensi_harian` VALUES (377, 86, 421, 'M', '', '2021-08-05', '2021-08-05 11:49:08', 3, 33);
INSERT INTO `presensi_harian` VALUES (378, 86, 422, 'M', '', '2021-08-05', '2021-08-05 11:49:08', 3, 33);
INSERT INTO `presensi_harian` VALUES (379, 86, 423, 'M', '', '2021-08-05', '2021-08-05 11:49:08', 3, 33);
INSERT INTO `presensi_harian` VALUES (380, 86, 424, 'M', '', '2021-08-05', '2021-08-05 11:49:08', 3, 33);
INSERT INTO `presensi_harian` VALUES (381, 32, 314, 'M', '', '2021-08-05', '2021-08-05 11:53:06', 3, 30);
INSERT INTO `presensi_harian` VALUES (382, 32, 315, 'A', '', '2021-08-05', '2021-08-05 11:53:07', 3, 30);
INSERT INTO `presensi_harian` VALUES (383, 32, 316, 'M', '', '2021-08-05', '2021-08-05 11:53:07', 3, 30);
INSERT INTO `presensi_harian` VALUES (384, 32, 317, 'A', '', '2021-08-05', '2021-08-05 11:53:07', 3, 30);
INSERT INTO `presensi_harian` VALUES (385, 32, 318, 'M', '', '2021-08-05', '2021-08-05 11:53:07', 3, 30);
INSERT INTO `presensi_harian` VALUES (386, 32, 319, 'M', '', '2021-08-05', '2021-08-05 11:53:07', 3, 30);
INSERT INTO `presensi_harian` VALUES (387, 32, 320, 'M', '', '2021-08-05', '2021-08-05 11:53:07', 3, 30);
INSERT INTO `presensi_harian` VALUES (388, 32, 321, 'M', '', '2021-08-05', '2021-08-05 11:53:07', 3, 30);
INSERT INTO `presensi_harian` VALUES (389, 32, 322, 'M', '', '2021-08-05', '2021-08-05 11:53:07', 3, 30);
INSERT INTO `presensi_harian` VALUES (390, 32, 323, 'M', '', '2021-08-05', '2021-08-05 11:53:07', 3, 30);
INSERT INTO `presensi_harian` VALUES (391, 32, 324, 'M', '', '2021-08-05', '2021-08-05 11:53:07', 3, 30);
INSERT INTO `presensi_harian` VALUES (392, 32, 325, 'M', '', '2021-08-05', '2021-08-05 11:53:07', 3, 30);
INSERT INTO `presensi_harian` VALUES (393, 32, 326, 'M', '', '2021-08-05', '2021-08-05 11:53:07', 3, 30);
INSERT INTO `presensi_harian` VALUES (394, 32, 327, 'M', '', '2021-08-05', '2021-08-05 11:53:07', 3, 30);
INSERT INTO `presensi_harian` VALUES (395, 32, 328, 'M', '', '2021-08-05', '2021-08-05 11:53:07', 3, 30);
INSERT INTO `presensi_harian` VALUES (396, 32, 329, 'A', '', '2021-08-05', '2021-08-05 11:53:08', 3, 30);
INSERT INTO `presensi_harian` VALUES (397, 32, 330, 'A', '', '2021-08-05', '2021-08-05 11:53:08', 3, 30);
INSERT INTO `presensi_harian` VALUES (398, 32, 331, 'M', '', '2021-08-05', '2021-08-05 11:53:08', 3, 30);
INSERT INTO `presensi_harian` VALUES (399, 32, 332, 'A', '', '2021-08-05', '2021-08-05 11:53:08', 3, 30);
INSERT INTO `presensi_harian` VALUES (400, 32, 333, 'A', '', '2021-08-05', '2021-08-05 11:53:08', 3, 30);
INSERT INTO `presensi_harian` VALUES (401, 32, 334, 'A', '', '2021-08-05', '2021-08-05 11:53:08', 3, 30);
INSERT INTO `presensi_harian` VALUES (402, 32, 497, 'M', '', '2021-08-05', '2021-08-05 11:54:08', 3, 26);
INSERT INTO `presensi_harian` VALUES (403, 32, 498, 'M', '', '2021-08-05', '2021-08-05 11:54:08', 3, 26);
INSERT INTO `presensi_harian` VALUES (404, 32, 499, 'M', '', '2021-08-05', '2021-08-05 11:54:08', 3, 26);
INSERT INTO `presensi_harian` VALUES (405, 32, 500, 'M', '', '2021-08-05', '2021-08-05 11:54:08', 3, 26);
INSERT INTO `presensi_harian` VALUES (406, 32, 501, 'M', '', '2021-08-05', '2021-08-05 11:54:08', 3, 26);
INSERT INTO `presensi_harian` VALUES (407, 32, 502, 'M', '', '2021-08-05', '2021-08-05 11:54:08', 3, 26);
INSERT INTO `presensi_harian` VALUES (408, 32, 503, 'M', '', '2021-08-05', '2021-08-05 11:54:08', 3, 26);
INSERT INTO `presensi_harian` VALUES (409, 32, 504, 'M', '', '2021-08-05', '2021-08-05 11:54:08', 3, 26);
INSERT INTO `presensi_harian` VALUES (410, 32, 505, 'M', '', '2021-08-05', '2021-08-05 11:54:08', 3, 26);
INSERT INTO `presensi_harian` VALUES (411, 32, 506, 'M', '', '2021-08-05', '2021-08-05 11:54:08', 3, 26);
INSERT INTO `presensi_harian` VALUES (412, 32, 507, 'M', '', '2021-08-05', '2021-08-05 11:54:08', 3, 26);
INSERT INTO `presensi_harian` VALUES (413, 32, 508, 'M', '', '2021-08-05', '2021-08-05 11:54:08', 3, 26);
INSERT INTO `presensi_harian` VALUES (414, 32, 509, 'M', '', '2021-08-05', '2021-08-05 11:54:08', 3, 26);
INSERT INTO `presensi_harian` VALUES (415, 32, 510, 'M', '', '2021-08-05', '2021-08-05 11:54:08', 3, 26);
INSERT INTO `presensi_harian` VALUES (416, 32, 511, 'M', '', '2021-08-05', '2021-08-05 11:54:08', 3, 26);
INSERT INTO `presensi_harian` VALUES (417, 40, 497, 'M', '', '2021-08-05', '2021-08-05 11:54:32', 3, 26);
INSERT INTO `presensi_harian` VALUES (418, 40, 498, 'M', '', '2021-08-05', '2021-08-05 11:54:32', 3, 26);
INSERT INTO `presensi_harian` VALUES (419, 40, 499, 'M', '', '2021-08-05', '2021-08-05 11:54:32', 3, 26);
INSERT INTO `presensi_harian` VALUES (420, 40, 500, 'M', '', '2021-08-05', '2021-08-05 11:54:33', 3, 26);
INSERT INTO `presensi_harian` VALUES (421, 40, 501, 'M', '', '2021-08-05', '2021-08-05 11:54:33', 3, 26);
INSERT INTO `presensi_harian` VALUES (422, 40, 502, 'M', '', '2021-08-05', '2021-08-05 11:54:33', 3, 26);
INSERT INTO `presensi_harian` VALUES (423, 40, 503, 'M', '', '2021-08-05', '2021-08-05 11:54:33', 3, 26);
INSERT INTO `presensi_harian` VALUES (424, 40, 504, 'M', '', '2021-08-05', '2021-08-05 11:54:33', 3, 26);
INSERT INTO `presensi_harian` VALUES (425, 40, 505, 'M', '', '2021-08-05', '2021-08-05 11:54:33', 3, 26);
INSERT INTO `presensi_harian` VALUES (426, 40, 506, 'M', '', '2021-08-05', '2021-08-05 11:54:33', 3, 26);
INSERT INTO `presensi_harian` VALUES (427, 40, 507, 'M', '', '2021-08-05', '2021-08-05 11:54:33', 3, 26);
INSERT INTO `presensi_harian` VALUES (428, 40, 508, 'M', '', '2021-08-05', '2021-08-05 11:54:33', 3, 26);
INSERT INTO `presensi_harian` VALUES (429, 40, 509, 'M', '', '2021-08-05', '2021-08-05 11:54:33', 3, 26);
INSERT INTO `presensi_harian` VALUES (430, 40, 510, 'M', '', '2021-08-05', '2021-08-05 11:54:33', 3, 26);
INSERT INTO `presensi_harian` VALUES (431, 40, 511, 'M', '', '2021-08-05', '2021-08-05 11:54:33', 3, 26);
INSERT INTO `presensi_harian` VALUES (432, 63, 497, 'M', '', '2021-08-05', '2021-08-05 11:54:41', 3, 26);
INSERT INTO `presensi_harian` VALUES (433, 63, 498, 'M', '', '2021-08-05', '2021-08-05 11:54:41', 3, 26);
INSERT INTO `presensi_harian` VALUES (434, 63, 499, 'M', '', '2021-08-05', '2021-08-05 11:54:41', 3, 26);
INSERT INTO `presensi_harian` VALUES (435, 63, 500, 'M', '', '2021-08-05', '2021-08-05 11:54:41', 3, 26);
INSERT INTO `presensi_harian` VALUES (436, 63, 501, 'M', '', '2021-08-05', '2021-08-05 11:54:41', 3, 26);
INSERT INTO `presensi_harian` VALUES (437, 63, 502, 'M', '', '2021-08-05', '2021-08-05 11:54:41', 3, 26);
INSERT INTO `presensi_harian` VALUES (438, 63, 503, 'M', '', '2021-08-05', '2021-08-05 11:54:41', 3, 26);
INSERT INTO `presensi_harian` VALUES (439, 63, 504, 'M', '', '2021-08-05', '2021-08-05 11:54:41', 3, 26);
INSERT INTO `presensi_harian` VALUES (440, 63, 505, 'M', '', '2021-08-05', '2021-08-05 11:54:41', 3, 26);
INSERT INTO `presensi_harian` VALUES (441, 63, 506, 'M', '', '2021-08-05', '2021-08-05 11:54:42', 3, 26);
INSERT INTO `presensi_harian` VALUES (442, 63, 507, 'M', '', '2021-08-05', '2021-08-05 11:54:42', 3, 26);
INSERT INTO `presensi_harian` VALUES (443, 63, 508, 'M', '', '2021-08-05', '2021-08-05 11:54:42', 3, 26);
INSERT INTO `presensi_harian` VALUES (444, 63, 509, 'M', '', '2021-08-05', '2021-08-05 11:54:42', 3, 26);
INSERT INTO `presensi_harian` VALUES (445, 63, 510, 'M', '', '2021-08-05', '2021-08-05 11:54:42', 3, 26);
INSERT INTO `presensi_harian` VALUES (446, 63, 511, 'M', '', '2021-08-05', '2021-08-05 11:54:42', 3, 26);
INSERT INTO `presensi_harian` VALUES (447, 69, 335, 'M', '', '2021-08-05', '2021-08-05 11:55:03', 3, 31);
INSERT INTO `presensi_harian` VALUES (448, 69, 336, 'A', '', '2021-08-05', '2021-08-05 11:55:03', 3, 31);
INSERT INTO `presensi_harian` VALUES (449, 69, 337, 'M', '', '2021-08-05', '2021-08-05 11:55:03', 3, 31);
INSERT INTO `presensi_harian` VALUES (450, 69, 338, 'M', '', '2021-08-05', '2021-08-05 11:55:03', 3, 31);
INSERT INTO `presensi_harian` VALUES (451, 69, 339, 'M', '', '2021-08-05', '2021-08-05 11:55:03', 3, 31);
INSERT INTO `presensi_harian` VALUES (452, 69, 340, 'M', '', '2021-08-05', '2021-08-05 11:55:03', 3, 31);
INSERT INTO `presensi_harian` VALUES (453, 69, 341, 'M', '', '2021-08-05', '2021-08-05 11:55:03', 3, 31);
INSERT INTO `presensi_harian` VALUES (454, 36, 335, 'M', '', '2021-08-05', '2021-08-05 11:55:13', 3, 31);
INSERT INTO `presensi_harian` VALUES (455, 36, 336, 'A', '', '2021-08-05', '2021-08-05 11:55:13', 3, 31);
INSERT INTO `presensi_harian` VALUES (456, 36, 337, 'M', '', '2021-08-05', '2021-08-05 11:55:13', 3, 31);
INSERT INTO `presensi_harian` VALUES (457, 36, 338, 'M', '', '2021-08-05', '2021-08-05 11:55:13', 3, 31);
INSERT INTO `presensi_harian` VALUES (458, 36, 339, 'M', '', '2021-08-05', '2021-08-05 11:55:13', 3, 31);
INSERT INTO `presensi_harian` VALUES (459, 36, 340, 'M', '', '2021-08-05', '2021-08-05 11:55:13', 3, 31);
INSERT INTO `presensi_harian` VALUES (460, 36, 341, 'M', '', '2021-08-05', '2021-08-05 11:55:13', 3, 31);
INSERT INTO `presensi_harian` VALUES (461, 32, 335, 'M', '', '2021-08-05', '2021-08-05 11:55:24', 3, 31);
INSERT INTO `presensi_harian` VALUES (462, 32, 336, 'A', '', '2021-08-05', '2021-08-05 11:55:25', 3, 31);
INSERT INTO `presensi_harian` VALUES (463, 32, 337, 'M', '', '2021-08-05', '2021-08-05 11:55:25', 3, 31);
INSERT INTO `presensi_harian` VALUES (464, 32, 338, 'M', '', '2021-08-05', '2021-08-05 11:55:25', 3, 31);
INSERT INTO `presensi_harian` VALUES (465, 32, 339, 'M', '', '2021-08-05', '2021-08-05 11:55:25', 3, 31);
INSERT INTO `presensi_harian` VALUES (466, 32, 340, 'M', '', '2021-08-05', '2021-08-05 11:55:25', 3, 31);
INSERT INTO `presensi_harian` VALUES (467, 32, 341, 'M', '', '2021-08-05', '2021-08-05 11:55:25', 3, 31);
INSERT INTO `presensi_harian` VALUES (468, 89, 492, 'M', '', '2021-08-05', '2021-08-05 13:11:39', 3, 37);
INSERT INTO `presensi_harian` VALUES (469, 89, 493, 'M', '', '2021-08-05', '2021-08-05 13:11:39', 3, 37);
INSERT INTO `presensi_harian` VALUES (470, 89, 494, 'M', '', '2021-08-05', '2021-08-05 13:11:39', 3, 37);
INSERT INTO `presensi_harian` VALUES (471, 89, 495, 'M', '', '2021-08-05', '2021-08-05 13:11:39', 3, 37);
INSERT INTO `presensi_harian` VALUES (472, 89, 496, 'M', '', '2021-08-05', '2021-08-05 13:11:39', 3, 37);
INSERT INTO `presensi_harian` VALUES (473, 83, 492, 'M', '', '2021-08-05', '2021-08-05 14:23:29', 3, 37);
INSERT INTO `presensi_harian` VALUES (474, 83, 493, 'M', '', '2021-08-05', '2021-08-05 14:23:29', 3, 37);
INSERT INTO `presensi_harian` VALUES (475, 83, 494, 'M', '', '2021-08-05', '2021-08-05 14:23:29', 3, 37);
INSERT INTO `presensi_harian` VALUES (476, 83, 495, 'M', '', '2021-08-05', '2021-08-05 14:23:29', 3, 37);
INSERT INTO `presensi_harian` VALUES (477, 83, 496, 'M', '', '2021-08-05', '2021-08-05 14:23:30', 3, 37);
INSERT INTO `presensi_harian` VALUES (478, 32, 492, 'M', '', '2021-08-05', '2021-08-05 14:23:46', 3, 37);
INSERT INTO `presensi_harian` VALUES (479, 32, 493, 'M', '', '2021-08-05', '2021-08-05 14:23:46', 3, 37);
INSERT INTO `presensi_harian` VALUES (480, 32, 494, 'M', '', '2021-08-05', '2021-08-05 14:23:46', 3, 37);
INSERT INTO `presensi_harian` VALUES (481, 32, 495, 'M', '', '2021-08-05', '2021-08-05 14:23:46', 3, 37);
INSERT INTO `presensi_harian` VALUES (482, 32, 496, 'M', '', '2021-08-05', '2021-08-05 14:23:46', 3, 37);
INSERT INTO `presensi_harian` VALUES (483, 60, 342, 'M', '', '2021-08-05', '2021-08-05 15:44:30', 3, 35);
INSERT INTO `presensi_harian` VALUES (484, 60, 343, 'M', '', '2021-08-05', '2021-08-05 15:44:30', 3, 35);
INSERT INTO `presensi_harian` VALUES (485, 60, 344, 'M', '', '2021-08-05', '2021-08-05 15:44:30', 3, 35);
INSERT INTO `presensi_harian` VALUES (486, 60, 345, 'S', '', '2021-08-05', '2021-08-05 15:44:30', 3, 35);
INSERT INTO `presensi_harian` VALUES (487, 60, 346, 'M', '', '2021-08-05', '2021-08-05 15:44:30', 3, 35);
INSERT INTO `presensi_harian` VALUES (488, 60, 347, 'M', '', '2021-08-05', '2021-08-05 15:44:30', 3, 35);
INSERT INTO `presensi_harian` VALUES (489, 60, 348, 'M', '', '2021-08-05', '2021-08-05 15:44:30', 3, 35);
INSERT INTO `presensi_harian` VALUES (490, 60, 349, 'M', '', '2021-08-05', '2021-08-05 15:44:30', 3, 35);
INSERT INTO `presensi_harian` VALUES (491, 60, 350, 'M', '', '2021-08-05', '2021-08-05 15:44:30', 3, 35);
INSERT INTO `presensi_harian` VALUES (492, 60, 351, 'S', '', '2021-08-05', '2021-08-05 15:44:30', 3, 35);
INSERT INTO `presensi_harian` VALUES (493, 60, 352, 'M', '', '2021-08-05', '2021-08-05 15:44:30', 3, 35);
INSERT INTO `presensi_harian` VALUES (494, 60, 353, 'I', '', '2021-08-05', '2021-08-05 15:44:30', 3, 35);
INSERT INTO `presensi_harian` VALUES (495, 60, 354, 'M', '', '2021-08-05', '2021-08-05 15:44:31', 3, 35);
INSERT INTO `presensi_harian` VALUES (496, 60, 355, 'M', '', '2021-08-05', '2021-08-05 15:44:31', 3, 35);
INSERT INTO `presensi_harian` VALUES (497, 60, 356, 'M', '', '2021-08-05', '2021-08-05 15:44:31', 3, 35);
INSERT INTO `presensi_harian` VALUES (498, 60, 357, 'M', '', '2021-08-05', '2021-08-05 15:44:31', 3, 35);
INSERT INTO `presensi_harian` VALUES (499, 60, 358, 'M', '', '2021-08-05', '2021-08-05 15:44:31', 3, 35);
INSERT INTO `presensi_harian` VALUES (500, 60, 359, 'M', '', '2021-08-05', '2021-08-05 15:44:31', 3, 35);
INSERT INTO `presensi_harian` VALUES (501, 60, 360, 'M', '', '2021-08-05', '2021-08-05 15:44:31', 3, 35);
INSERT INTO `presensi_harian` VALUES (502, 60, 361, 'M', '', '2021-08-05', '2021-08-05 15:44:31', 3, 35);
INSERT INTO `presensi_harian` VALUES (503, 60, 362, 'M', '', '2021-08-05', '2021-08-05 15:44:31', 3, 35);
INSERT INTO `presensi_harian` VALUES (504, 84, 342, 'M', '', '2021-08-05', '2021-08-05 15:45:03', 3, 35);
INSERT INTO `presensi_harian` VALUES (505, 84, 343, 'M', '', '2021-08-05', '2021-08-05 15:45:03', 3, 35);
INSERT INTO `presensi_harian` VALUES (506, 84, 344, 'M', '', '2021-08-05', '2021-08-05 15:45:03', 3, 35);
INSERT INTO `presensi_harian` VALUES (507, 84, 345, 'S', '', '2021-08-05', '2021-08-05 15:45:03', 3, 35);
INSERT INTO `presensi_harian` VALUES (508, 84, 346, 'M', '', '2021-08-05', '2021-08-05 15:45:03', 3, 35);
INSERT INTO `presensi_harian` VALUES (509, 84, 347, 'M', '', '2021-08-05', '2021-08-05 15:45:03', 3, 35);
INSERT INTO `presensi_harian` VALUES (510, 84, 348, 'M', '', '2021-08-05', '2021-08-05 15:45:03', 3, 35);
INSERT INTO `presensi_harian` VALUES (511, 84, 349, 'M', '', '2021-08-05', '2021-08-05 15:45:03', 3, 35);
INSERT INTO `presensi_harian` VALUES (512, 84, 350, 'M', '', '2021-08-05', '2021-08-05 15:45:03', 3, 35);
INSERT INTO `presensi_harian` VALUES (513, 84, 351, 'S', '', '2021-08-05', '2021-08-05 15:45:03', 3, 35);
INSERT INTO `presensi_harian` VALUES (514, 84, 352, 'M', '', '2021-08-05', '2021-08-05 15:45:03', 3, 35);
INSERT INTO `presensi_harian` VALUES (515, 84, 353, 'I', '', '2021-08-05', '2021-08-05 15:45:03', 3, 35);
INSERT INTO `presensi_harian` VALUES (516, 84, 354, 'M', '', '2021-08-05', '2021-08-05 15:45:03', 3, 35);
INSERT INTO `presensi_harian` VALUES (517, 84, 355, 'M', '', '2021-08-05', '2021-08-05 15:45:04', 3, 35);
INSERT INTO `presensi_harian` VALUES (518, 84, 356, 'M', '', '2021-08-05', '2021-08-05 15:45:04', 3, 35);
INSERT INTO `presensi_harian` VALUES (519, 84, 357, 'M', '', '2021-08-05', '2021-08-05 15:45:04', 3, 35);
INSERT INTO `presensi_harian` VALUES (520, 84, 358, 'M', '', '2021-08-05', '2021-08-05 15:45:04', 3, 35);
INSERT INTO `presensi_harian` VALUES (521, 84, 359, 'M', '', '2021-08-05', '2021-08-05 15:45:04', 3, 35);
INSERT INTO `presensi_harian` VALUES (522, 84, 360, 'M', '', '2021-08-05', '2021-08-05 15:45:04', 3, 35);
INSERT INTO `presensi_harian` VALUES (523, 84, 361, 'M', '', '2021-08-05', '2021-08-05 15:45:04', 3, 35);
INSERT INTO `presensi_harian` VALUES (524, 84, 362, 'M', '', '2021-08-05', '2021-08-05 15:45:04', 3, 35);
INSERT INTO `presensi_harian` VALUES (525, 94, 342, 'M', '', '2021-08-05', '2021-08-05 15:45:42', 3, 35);
INSERT INTO `presensi_harian` VALUES (526, 94, 343, 'M', '', '2021-08-05', '2021-08-05 15:45:42', 3, 35);
INSERT INTO `presensi_harian` VALUES (527, 94, 344, 'M', '', '2021-08-05', '2021-08-05 15:45:42', 3, 35);
INSERT INTO `presensi_harian` VALUES (528, 94, 345, 'S', '', '2021-08-05', '2021-08-05 15:45:42', 3, 35);
INSERT INTO `presensi_harian` VALUES (529, 94, 346, 'M', '', '2021-08-05', '2021-08-05 15:45:42', 3, 35);
INSERT INTO `presensi_harian` VALUES (530, 94, 347, 'M', '', '2021-08-05', '2021-08-05 15:45:42', 3, 35);
INSERT INTO `presensi_harian` VALUES (531, 94, 348, 'M', '', '2021-08-05', '2021-08-05 15:45:42', 3, 35);
INSERT INTO `presensi_harian` VALUES (532, 94, 349, 'M', '', '2021-08-05', '2021-08-05 15:45:42', 3, 35);
INSERT INTO `presensi_harian` VALUES (533, 94, 350, 'M', '', '2021-08-05', '2021-08-05 15:45:42', 3, 35);
INSERT INTO `presensi_harian` VALUES (534, 94, 351, 'S', '', '2021-08-05', '2021-08-05 15:45:42', 3, 35);
INSERT INTO `presensi_harian` VALUES (535, 94, 352, 'M', '', '2021-08-05', '2021-08-05 15:45:42', 3, 35);
INSERT INTO `presensi_harian` VALUES (536, 94, 353, 'I', '', '2021-08-05', '2021-08-05 15:45:42', 3, 35);
INSERT INTO `presensi_harian` VALUES (537, 94, 354, 'M', '', '2021-08-05', '2021-08-05 15:45:42', 3, 35);
INSERT INTO `presensi_harian` VALUES (538, 94, 355, 'M', '', '2021-08-05', '2021-08-05 15:45:43', 3, 35);
INSERT INTO `presensi_harian` VALUES (539, 94, 356, 'M', '', '2021-08-05', '2021-08-05 15:45:43', 3, 35);
INSERT INTO `presensi_harian` VALUES (540, 94, 357, 'M', '', '2021-08-05', '2021-08-05 15:45:43', 3, 35);
INSERT INTO `presensi_harian` VALUES (541, 94, 358, 'M', '', '2021-08-05', '2021-08-05 15:45:43', 3, 35);
INSERT INTO `presensi_harian` VALUES (542, 94, 359, 'M', '', '2021-08-05', '2021-08-05 15:45:43', 3, 35);
INSERT INTO `presensi_harian` VALUES (543, 94, 360, 'M', '', '2021-08-05', '2021-08-05 15:45:43', 3, 35);
INSERT INTO `presensi_harian` VALUES (544, 94, 361, 'M', '', '2021-08-05', '2021-08-05 15:45:43', 3, 35);
INSERT INTO `presensi_harian` VALUES (545, 94, 362, 'M', '', '2021-08-05', '2021-08-05 15:45:43', 3, 35);
INSERT INTO `presensi_harian` VALUES (546, 34, 426, 'M', '', '2021-08-05', '2021-08-05 16:01:47', 3, 34);
INSERT INTO `presensi_harian` VALUES (547, 34, 427, 'M', '', '2021-08-05', '2021-08-05 16:01:47', 3, 34);
INSERT INTO `presensi_harian` VALUES (548, 34, 428, 'M', '', '2021-08-05', '2021-08-05 16:01:47', 3, 34);
INSERT INTO `presensi_harian` VALUES (549, 34, 429, 'M', '', '2021-08-05', '2021-08-05 16:01:47', 3, 34);
INSERT INTO `presensi_harian` VALUES (550, 34, 430, 'M', '', '2021-08-05', '2021-08-05 16:01:47', 3, 34);
INSERT INTO `presensi_harian` VALUES (551, 34, 431, 'M', '', '2021-08-05', '2021-08-05 16:01:47', 3, 34);
INSERT INTO `presensi_harian` VALUES (552, 34, 533, 'M', '', '2021-08-05', '2021-08-05 16:01:47', 3, 34);
INSERT INTO `presensi_harian` VALUES (553, 34, 534, 'M', '', '2021-08-05', '2021-08-05 16:01:47', 3, 34);
INSERT INTO `presensi_harian` VALUES (554, 34, 535, 'M', '', '2021-08-05', '2021-08-05 16:01:47', 3, 34);
INSERT INTO `presensi_harian` VALUES (555, 34, 536, 'I', '', '2021-08-05', '2021-08-05 16:01:47', 3, 34);
INSERT INTO `presensi_harian` VALUES (556, 34, 537, 'M', '', '2021-08-05', '2021-08-05 16:01:47', 3, 34);
INSERT INTO `presensi_harian` VALUES (557, 34, 538, 'M', '', '2021-08-05', '2021-08-05 16:01:47', 3, 34);
INSERT INTO `presensi_harian` VALUES (558, 34, 539, 'M', '', '2021-08-05', '2021-08-05 16:01:47', 3, 34);
INSERT INTO `presensi_harian` VALUES (559, 34, 540, 'M', '', '2021-08-05', '2021-08-05 16:01:47', 3, 34);
INSERT INTO `presensi_harian` VALUES (560, 34, 541, 'M', '', '2021-08-05', '2021-08-05 16:01:47', 3, 34);
INSERT INTO `presensi_harian` VALUES (561, 34, 542, 'M', '', '2021-08-05', '2021-08-05 16:01:48', 3, 34);
INSERT INTO `presensi_harian` VALUES (562, 34, 543, 'M', '', '2021-08-05', '2021-08-05 16:01:48', 3, 34);
INSERT INTO `presensi_harian` VALUES (563, 34, 544, 'M', '', '2021-08-05', '2021-08-05 16:01:48', 3, 34);
INSERT INTO `presensi_harian` VALUES (564, 34, 545, 'M', '', '2021-08-05', '2021-08-05 16:01:48', 3, 34);
INSERT INTO `presensi_harian` VALUES (565, 34, 546, 'M', '', '2021-08-05', '2021-08-05 16:01:48', 3, 34);
INSERT INTO `presensi_harian` VALUES (566, 34, 547, 'M', '', '2021-08-05', '2021-08-05 16:01:48', 3, 34);
INSERT INTO `presensi_harian` VALUES (567, 34, 548, 'M', '', '2021-08-05', '2021-08-05 16:01:48', 3, 34);
INSERT INTO `presensi_harian` VALUES (568, 36, 426, 'M', '', '2021-08-05', '2021-08-05 16:02:44', 3, 34);
INSERT INTO `presensi_harian` VALUES (569, 36, 427, 'M', '', '2021-08-05', '2021-08-05 16:02:44', 3, 34);
INSERT INTO `presensi_harian` VALUES (570, 36, 428, 'M', '', '2021-08-05', '2021-08-05 16:02:44', 3, 34);
INSERT INTO `presensi_harian` VALUES (571, 36, 429, 'M', '', '2021-08-05', '2021-08-05 16:02:44', 3, 34);
INSERT INTO `presensi_harian` VALUES (572, 36, 430, 'M', '', '2021-08-05', '2021-08-05 16:02:44', 3, 34);
INSERT INTO `presensi_harian` VALUES (573, 36, 431, 'M', '', '2021-08-05', '2021-08-05 16:02:44', 3, 34);
INSERT INTO `presensi_harian` VALUES (574, 36, 533, 'M', '', '2021-08-05', '2021-08-05 16:02:44', 3, 34);
INSERT INTO `presensi_harian` VALUES (575, 36, 534, 'M', '', '2021-08-05', '2021-08-05 16:02:44', 3, 34);
INSERT INTO `presensi_harian` VALUES (576, 36, 535, 'M', '', '2021-08-05', '2021-08-05 16:02:44', 3, 34);
INSERT INTO `presensi_harian` VALUES (577, 36, 536, 'I', '', '2021-08-05', '2021-08-05 16:02:44', 3, 34);
INSERT INTO `presensi_harian` VALUES (578, 36, 537, 'M', '', '2021-08-05', '2021-08-05 16:02:45', 3, 34);
INSERT INTO `presensi_harian` VALUES (579, 36, 538, 'M', '', '2021-08-05', '2021-08-05 16:02:45', 3, 34);
INSERT INTO `presensi_harian` VALUES (580, 36, 539, 'M', '', '2021-08-05', '2021-08-05 16:02:45', 3, 34);
INSERT INTO `presensi_harian` VALUES (581, 36, 540, 'M', '', '2021-08-05', '2021-08-05 16:02:45', 3, 34);
INSERT INTO `presensi_harian` VALUES (582, 36, 541, 'M', '', '2021-08-05', '2021-08-05 16:02:45', 3, 34);
INSERT INTO `presensi_harian` VALUES (583, 36, 542, 'M', '', '2021-08-05', '2021-08-05 16:02:45', 3, 34);
INSERT INTO `presensi_harian` VALUES (584, 36, 543, 'M', '', '2021-08-05', '2021-08-05 16:02:45', 3, 34);
INSERT INTO `presensi_harian` VALUES (585, 36, 544, 'M', '', '2021-08-05', '2021-08-05 16:02:45', 3, 34);
INSERT INTO `presensi_harian` VALUES (586, 36, 545, 'M', '', '2021-08-05', '2021-08-05 16:02:45', 3, 34);
INSERT INTO `presensi_harian` VALUES (587, 36, 546, 'M', '', '2021-08-05', '2021-08-05 16:02:45', 3, 34);
INSERT INTO `presensi_harian` VALUES (588, 36, 547, 'M', '', '2021-08-05', '2021-08-05 16:02:45', 3, 34);
INSERT INTO `presensi_harian` VALUES (589, 36, 548, 'M', '', '2021-08-05', '2021-08-05 16:02:45', 3, 34);
INSERT INTO `presensi_harian` VALUES (590, 69, 426, 'M', '', '2021-08-05', '2021-08-05 16:03:16', 3, 34);
INSERT INTO `presensi_harian` VALUES (591, 69, 427, 'M', '', '2021-08-05', '2021-08-05 16:03:16', 3, 34);
INSERT INTO `presensi_harian` VALUES (592, 69, 428, 'M', '', '2021-08-05', '2021-08-05 16:03:16', 3, 34);
INSERT INTO `presensi_harian` VALUES (593, 69, 429, 'M', '', '2021-08-05', '2021-08-05 16:03:16', 3, 34);
INSERT INTO `presensi_harian` VALUES (594, 69, 430, 'M', '', '2021-08-05', '2021-08-05 16:03:16', 3, 34);
INSERT INTO `presensi_harian` VALUES (595, 69, 431, 'M', '', '2021-08-05', '2021-08-05 16:03:16', 3, 34);
INSERT INTO `presensi_harian` VALUES (596, 69, 533, 'M', '', '2021-08-05', '2021-08-05 16:03:17', 3, 34);
INSERT INTO `presensi_harian` VALUES (597, 69, 534, 'M', '', '2021-08-05', '2021-08-05 16:03:17', 3, 34);
INSERT INTO `presensi_harian` VALUES (598, 69, 535, 'M', '', '2021-08-05', '2021-08-05 16:03:17', 3, 34);
INSERT INTO `presensi_harian` VALUES (599, 69, 536, 'I', '', '2021-08-05', '2021-08-05 16:03:17', 3, 34);
INSERT INTO `presensi_harian` VALUES (600, 69, 537, 'M', '', '2021-08-05', '2021-08-05 16:03:17', 3, 34);
INSERT INTO `presensi_harian` VALUES (601, 69, 538, 'M', '', '2021-08-05', '2021-08-05 16:03:17', 3, 34);
INSERT INTO `presensi_harian` VALUES (602, 69, 539, 'M', '', '2021-08-05', '2021-08-05 16:03:17', 3, 34);
INSERT INTO `presensi_harian` VALUES (603, 69, 540, 'M', '', '2021-08-05', '2021-08-05 16:03:17', 3, 34);
INSERT INTO `presensi_harian` VALUES (604, 69, 541, 'M', '', '2021-08-05', '2021-08-05 16:03:17', 3, 34);
INSERT INTO `presensi_harian` VALUES (605, 69, 542, 'M', '', '2021-08-05', '2021-08-05 16:03:17', 3, 34);
INSERT INTO `presensi_harian` VALUES (606, 69, 543, 'M', '', '2021-08-05', '2021-08-05 16:03:17', 3, 34);
INSERT INTO `presensi_harian` VALUES (607, 69, 544, 'M', '', '2021-08-05', '2021-08-05 16:03:17', 3, 34);
INSERT INTO `presensi_harian` VALUES (608, 69, 545, 'M', '', '2021-08-05', '2021-08-05 16:03:17', 3, 34);
INSERT INTO `presensi_harian` VALUES (609, 69, 546, 'M', '', '2021-08-05', '2021-08-05 16:03:17', 3, 34);
INSERT INTO `presensi_harian` VALUES (610, 69, 547, 'M', '', '2021-08-05', '2021-08-05 16:03:17', 3, 34);
INSERT INTO `presensi_harian` VALUES (611, 69, 548, 'M', '', '2021-08-05', '2021-08-05 16:03:17', 3, 34);
INSERT INTO `presensi_harian` VALUES (612, 36, 363, 'A', '', '2021-08-05', '2021-08-05 16:08:54', 3, 36);
INSERT INTO `presensi_harian` VALUES (613, 36, 364, 'A', '', '2021-08-05', '2021-08-05 16:08:54', 3, 36);
INSERT INTO `presensi_harian` VALUES (614, 36, 365, 'M', '', '2021-08-05', '2021-08-05 16:08:54', 3, 36);
INSERT INTO `presensi_harian` VALUES (615, 36, 366, 'M', '', '2021-08-05', '2021-08-05 16:08:54', 3, 36);
INSERT INTO `presensi_harian` VALUES (616, 36, 367, 'M', '', '2021-08-05', '2021-08-05 16:08:54', 3, 36);
INSERT INTO `presensi_harian` VALUES (617, 36, 368, 'A', '', '2021-08-05', '2021-08-05 16:08:54', 3, 36);
INSERT INTO `presensi_harian` VALUES (618, 36, 369, 'A', '', '2021-08-05', '2021-08-05 16:08:54', 3, 36);
INSERT INTO `presensi_harian` VALUES (619, 36, 370, 'A', '', '2021-08-05', '2021-08-05 16:08:54', 3, 36);
INSERT INTO `presensi_harian` VALUES (620, 36, 371, 'A', '', '2021-08-05', '2021-08-05 16:08:55', 3, 36);
INSERT INTO `presensi_harian` VALUES (621, 36, 372, 'M', '', '2021-08-05', '2021-08-05 16:08:55', 3, 36);
INSERT INTO `presensi_harian` VALUES (622, 36, 373, 'A', '', '2021-08-05', '2021-08-05 16:08:55', 3, 36);
INSERT INTO `presensi_harian` VALUES (623, 36, 374, 'A', '', '2021-08-05', '2021-08-05 16:08:55', 3, 36);
INSERT INTO `presensi_harian` VALUES (624, 36, 375, 'M', '', '2021-08-05', '2021-08-05 16:08:55', 3, 36);
INSERT INTO `presensi_harian` VALUES (625, 36, 376, 'M', '', '2021-08-05', '2021-08-05 16:08:55', 3, 36);
INSERT INTO `presensi_harian` VALUES (626, 36, 377, 'M', '', '2021-08-05', '2021-08-05 16:08:55', 3, 36);
INSERT INTO `presensi_harian` VALUES (627, 60, 363, 'A', '', '2021-08-05', '2021-08-05 16:09:29', 3, 36);
INSERT INTO `presensi_harian` VALUES (628, 60, 364, 'A', '', '2021-08-05', '2021-08-05 16:09:29', 3, 36);
INSERT INTO `presensi_harian` VALUES (629, 60, 365, 'M', '', '2021-08-05', '2021-08-05 16:09:29', 3, 36);
INSERT INTO `presensi_harian` VALUES (630, 60, 366, 'M', '', '2021-08-05', '2021-08-05 16:09:29', 3, 36);
INSERT INTO `presensi_harian` VALUES (631, 60, 367, 'M', '', '2021-08-05', '2021-08-05 16:09:29', 3, 36);
INSERT INTO `presensi_harian` VALUES (632, 60, 368, 'A', '', '2021-08-05', '2021-08-05 16:09:29', 3, 36);
INSERT INTO `presensi_harian` VALUES (633, 60, 369, 'A', '', '2021-08-05', '2021-08-05 16:09:29', 3, 36);
INSERT INTO `presensi_harian` VALUES (634, 60, 370, 'A', '', '2021-08-05', '2021-08-05 16:09:29', 3, 36);
INSERT INTO `presensi_harian` VALUES (635, 60, 371, 'A', '', '2021-08-05', '2021-08-05 16:09:29', 3, 36);
INSERT INTO `presensi_harian` VALUES (636, 60, 372, 'M', '', '2021-08-05', '2021-08-05 16:09:29', 3, 36);
INSERT INTO `presensi_harian` VALUES (637, 60, 373, 'A', '', '2021-08-05', '2021-08-05 16:09:29', 3, 36);
INSERT INTO `presensi_harian` VALUES (638, 60, 374, 'A', '', '2021-08-05', '2021-08-05 16:09:30', 3, 36);
INSERT INTO `presensi_harian` VALUES (639, 60, 375, 'M', '', '2021-08-05', '2021-08-05 16:09:30', 3, 36);
INSERT INTO `presensi_harian` VALUES (640, 60, 376, 'M', '', '2021-08-05', '2021-08-05 16:09:30', 3, 36);
INSERT INTO `presensi_harian` VALUES (641, 60, 377, 'M', '', '2021-08-05', '2021-08-05 16:09:30', 3, 36);
INSERT INTO `presensi_harian` VALUES (642, 69, 363, 'A', '', '2021-08-05', '2021-08-05 16:10:11', 3, 36);
INSERT INTO `presensi_harian` VALUES (643, 69, 364, 'A', '', '2021-08-05', '2021-08-05 16:10:11', 3, 36);
INSERT INTO `presensi_harian` VALUES (644, 69, 365, 'M', '', '2021-08-05', '2021-08-05 16:10:11', 3, 36);
INSERT INTO `presensi_harian` VALUES (645, 69, 366, 'M', '', '2021-08-05', '2021-08-05 16:10:11', 3, 36);
INSERT INTO `presensi_harian` VALUES (646, 69, 367, 'M', '', '2021-08-05', '2021-08-05 16:10:11', 3, 36);
INSERT INTO `presensi_harian` VALUES (647, 69, 368, 'A', '', '2021-08-05', '2021-08-05 16:10:11', 3, 36);
INSERT INTO `presensi_harian` VALUES (648, 69, 369, 'A', '', '2021-08-05', '2021-08-05 16:10:11', 3, 36);
INSERT INTO `presensi_harian` VALUES (649, 69, 370, 'A', '', '2021-08-05', '2021-08-05 16:10:11', 3, 36);
INSERT INTO `presensi_harian` VALUES (650, 69, 371, 'A', '', '2021-08-05', '2021-08-05 16:10:11', 3, 36);
INSERT INTO `presensi_harian` VALUES (651, 69, 372, 'M', '', '2021-08-05', '2021-08-05 16:10:11', 3, 36);
INSERT INTO `presensi_harian` VALUES (652, 69, 373, 'A', '', '2021-08-05', '2021-08-05 16:10:11', 3, 36);
INSERT INTO `presensi_harian` VALUES (653, 69, 374, 'A', '', '2021-08-05', '2021-08-05 16:10:12', 3, 36);
INSERT INTO `presensi_harian` VALUES (654, 69, 375, 'M', '', '2021-08-05', '2021-08-05 16:10:12', 3, 36);
INSERT INTO `presensi_harian` VALUES (655, 69, 376, 'M', '', '2021-08-05', '2021-08-05 16:10:12', 3, 36);
INSERT INTO `presensi_harian` VALUES (656, 69, 377, 'M', '', '2021-08-05', '2021-08-05 16:10:12', 3, 36);
INSERT INTO `presensi_harian` VALUES (657, 65, 520, 'A', '', '2021-08-05', '2021-08-05 16:15:15', 3, 27);
INSERT INTO `presensi_harian` VALUES (658, 65, 521, 'M', '', '2021-08-05', '2021-08-05 16:15:15', 3, 27);
INSERT INTO `presensi_harian` VALUES (659, 65, 522, 'M', '', '2021-08-05', '2021-08-05 16:15:15', 3, 27);
INSERT INTO `presensi_harian` VALUES (660, 65, 523, 'I', '', '2021-08-05', '2021-08-05 16:15:15', 3, 27);
INSERT INTO `presensi_harian` VALUES (661, 65, 524, 'M', '', '2021-08-05', '2021-08-05 16:15:15', 3, 27);
INSERT INTO `presensi_harian` VALUES (662, 65, 525, 'M', '', '2021-08-05', '2021-08-05 16:15:15', 3, 27);
INSERT INTO `presensi_harian` VALUES (663, 65, 526, 'I', '', '2021-08-05', '2021-08-05 16:15:15', 3, 27);
INSERT INTO `presensi_harian` VALUES (664, 65, 527, 'M', '', '2021-08-05', '2021-08-05 16:15:15', 3, 27);
INSERT INTO `presensi_harian` VALUES (665, 65, 528, 'M', '', '2021-08-05', '2021-08-05 16:15:15', 3, 27);
INSERT INTO `presensi_harian` VALUES (666, 65, 529, 'M', '', '2021-08-05', '2021-08-05 16:15:15', 3, 27);
INSERT INTO `presensi_harian` VALUES (667, 65, 530, 'M', '', '2021-08-05', '2021-08-05 16:15:15', 3, 27);
INSERT INTO `presensi_harian` VALUES (668, 65, 531, 'M', '', '2021-08-05', '2021-08-05 16:15:16', 3, 27);
INSERT INTO `presensi_harian` VALUES (669, 65, 532, 'M', '', '2021-08-05', '2021-08-05 16:15:16', 3, 27);
INSERT INTO `presensi_harian` VALUES (670, 32, 520, 'A', '', '2021-08-05', '2021-08-05 16:16:02', 3, 27);
INSERT INTO `presensi_harian` VALUES (671, 32, 521, 'M', '', '2021-08-05', '2021-08-05 16:16:02', 3, 27);
INSERT INTO `presensi_harian` VALUES (672, 32, 522, 'M', '', '2021-08-05', '2021-08-05 16:16:02', 3, 27);
INSERT INTO `presensi_harian` VALUES (673, 32, 523, 'I', '', '2021-08-05', '2021-08-05 16:16:02', 3, 27);
INSERT INTO `presensi_harian` VALUES (674, 32, 524, 'M', '', '2021-08-05', '2021-08-05 16:16:02', 3, 27);
INSERT INTO `presensi_harian` VALUES (675, 32, 525, 'M', '', '2021-08-05', '2021-08-05 16:16:02', 3, 27);
INSERT INTO `presensi_harian` VALUES (676, 32, 526, 'I', '', '2021-08-05', '2021-08-05 16:16:02', 3, 27);
INSERT INTO `presensi_harian` VALUES (677, 32, 527, 'M', '', '2021-08-05', '2021-08-05 16:16:02', 3, 27);
INSERT INTO `presensi_harian` VALUES (678, 32, 528, 'M', '', '2021-08-05', '2021-08-05 16:16:02', 3, 27);
INSERT INTO `presensi_harian` VALUES (679, 32, 529, 'M', '', '2021-08-05', '2021-08-05 16:16:02', 3, 27);
INSERT INTO `presensi_harian` VALUES (680, 32, 530, 'M', '', '2021-08-05', '2021-08-05 16:16:02', 3, 27);
INSERT INTO `presensi_harian` VALUES (681, 32, 531, 'M', '', '2021-08-05', '2021-08-05 16:16:03', 3, 27);
INSERT INTO `presensi_harian` VALUES (682, 32, 532, 'M', '', '2021-08-05', '2021-08-05 16:16:03', 3, 27);
INSERT INTO `presensi_harian` VALUES (683, 63, 512, 'M', '', '2021-08-05', '2021-08-05 16:16:12', 3, 38);
INSERT INTO `presensi_harian` VALUES (684, 63, 513, 'M', '', '2021-08-05', '2021-08-05 16:16:12', 3, 38);
INSERT INTO `presensi_harian` VALUES (685, 63, 514, 'M', '', '2021-08-05', '2021-08-05 16:16:12', 3, 38);
INSERT INTO `presensi_harian` VALUES (686, 63, 515, 'M', '', '2021-08-05', '2021-08-05 16:16:12', 3, 38);
INSERT INTO `presensi_harian` VALUES (687, 63, 516, 'M', '', '2021-08-05', '2021-08-05 16:16:12', 3, 38);
INSERT INTO `presensi_harian` VALUES (688, 63, 517, 'M', '', '2021-08-05', '2021-08-05 16:16:12', 3, 38);
INSERT INTO `presensi_harian` VALUES (689, 63, 518, 'M', '', '2021-08-05', '2021-08-05 16:16:12', 3, 38);
INSERT INTO `presensi_harian` VALUES (690, 63, 519, 'M', '', '2021-08-05', '2021-08-05 16:16:12', 3, 38);
INSERT INTO `presensi_harian` VALUES (691, 32, 512, 'M', '', '2021-08-05', '2021-08-05 16:16:23', 3, 38);
INSERT INTO `presensi_harian` VALUES (692, 32, 513, 'M', '', '2021-08-05', '2021-08-05 16:16:23', 3, 38);
INSERT INTO `presensi_harian` VALUES (693, 32, 514, 'M', '', '2021-08-05', '2021-08-05 16:16:23', 3, 38);
INSERT INTO `presensi_harian` VALUES (694, 32, 515, 'M', '', '2021-08-05', '2021-08-05 16:16:23', 3, 38);
INSERT INTO `presensi_harian` VALUES (695, 32, 516, 'M', '', '2021-08-05', '2021-08-05 16:16:23', 3, 38);
INSERT INTO `presensi_harian` VALUES (696, 32, 517, 'M', '', '2021-08-05', '2021-08-05 16:16:23', 3, 38);
INSERT INTO `presensi_harian` VALUES (697, 32, 518, 'M', '', '2021-08-05', '2021-08-05 16:16:23', 3, 38);
INSERT INTO `presensi_harian` VALUES (698, 32, 519, 'M', '', '2021-08-05', '2021-08-05 16:16:24', 3, 38);

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

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
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of profil_website
-- ----------------------------
INSERT INTO `profil_website` VALUES ('VOHISA', 'Jl. Istana Mekar Wangi Utama No 1P-Q', '085894632505', 'logo-w.png', 'bulb.png', 'undefined', 'Shop with the nature, Please shop with me', '<p>The Balance Small Business makes launching and managing your own business easy. It is home to experts who provide clear, practical advice on entrepreneurship and management. Whether you&rsquo;re just starting up or you want to take your company to the next level, our 20-year-strong library of more than 7,000 pieces of content will answer your questions and turn your business dreams into reality.</p>\n\n<p><a href=\"https://www.thebalancesmb.com/\">The Balance</a>&nbsp;is part of The Balance family of sites, including&nbsp;<a href=\"https://www.thebalance.com/\" rel=\"noopener\" target=\"_blank\">The Balance</a>&nbsp;and&nbsp;<a href=\"https://www.thebalancecareers.com/\" rel=\"noopener\" target=\"_blank\">The Balance Careers</a>, covering personal finance, career, and small business topics. With more than 24 million monthly visitors, The Balance is among the top-10 largest finance properties as measured by comScore, a leading Internet measurement company. Our more than 50 expert writers have extensive qualifications and expertise in their topics, including MBAs, PhDs, CFPs, other advanced degrees and professional certifications.</p>\n\n<p>The Balance family of sites have been honored by multiple awards in the last year, including&nbsp;<a href=\"https://www.tellyawards.com/winners/2017/short-form-social/general-education-discovery\" rel=\"noopener nofollow\" target=\"_blank\">The Telly Awards</a>,&nbsp;<a href=\"https://www.communicatorawards.com/\" rel=\"noopener nofollow\" target=\"_blank\">The Communicator Awards</a>, and&nbsp;<a href=\"https://www.editorandpublisher.com/news/editor-publisher-announces-the-2017-eppy-award-finalists/\" rel=\"noopener nofollow\" target=\"_blank\">Eppy Awards</a>.</p>\n', 'hallo@smkitasy-syadzili.sch.id', 'Daniel Elvanda Yohanes', 'undefined', 'undefined', 'undefined', 'undefined', 'a00ae551dd485419a57db462a6ae30b9.jpg', 'Halo Admin, Saya ingin bertanya/membeli/.....', 'd797c14a0070235734508b7d9f409395.jpg', '&copy; 2019. <a href=\"#\">Core Master</a> by<a href=\"https://myber.co.id\" target=\"_blank\">Myber</a>', 'Core Master', 'Klinik Sekarpuro', 'Malang', 'Indonesia', '112.73825732378461', '-7.970847116561175');

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ruangan
-- ----------------------------
DROP TABLE IF EXISTS `ruangan`;
CREATE TABLE `ruangan`  (
  `id_ruangan` int(11) NOT NULL AUTO_INCREMENT,
  `ruangan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`id_ruangan`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ruangan
-- ----------------------------
INSERT INTO `ruangan` VALUES (1, 'Kepsek');
INSERT INTO `ruangan` VALUES (2, 'Ruang Osis');

-- ----------------------------
-- Table structure for semester
-- ----------------------------
DROP TABLE IF EXISTS `semester`;
CREATE TABLE `semester`  (
  `id_semester` int(11) NOT NULL AUTO_INCREMENT,
  `semester` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `create_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_semester`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

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
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of setting_table
-- ----------------------------
INSERT INTO `setting_table` VALUES (1, 'pengadaan_obat', 'invoice', 'INV/PGn/{year}/{rand}/{date_of_month}', 'Kode Invoice Pengadaan Obat');
INSERT INTO `setting_table` VALUES (2, 'rekam_medis', 'invoice', 'INV/RM/{year}/{month}/{rand}', 'Kode Invoice Rekam Medis');
INSERT INTO `setting_table` VALUES (3, 'penggunaan_lain', 'invoice', 'INV/PGL/{rand}/{month}/KLINIK', 'Kode Invoice Penggunaan Lain');
INSERT INTO `setting_table` VALUES (4, 'rujukan_keluar', 'invoice', 'INV/RK/{year}{month}/{rand}', 'Kode Invoice Rujukan Keluar');
INSERT INTO `setting_table` VALUES (5, 'rujukan_masuk', 'invoice', 'INV/RMas/{year}{month}/{rand}', 'Kode Invoice Rujukan Masuk');
INSERT INTO `setting_table` VALUES (6, 'pengeluaran', 'invoice', 'INV/penge/{date}/{rand}', 'Kode Invoice Pengeluaran');
INSERT INTO `setting_table` VALUES (7, 'pemasukan', 'invoice', 'INV/pema/{date}/{rand}', 'Kode Invoice Pemasukan');
INSERT INTO `setting_table` VALUES (8, 'pemeliharaan_alat', 'invoice', 'INV/PA/{rand}', 'Kode Invoice Pemeliharaan Alat');
INSERT INTO `setting_table` VALUES (9, 'perjalanan_dinas', 'invoice', 'INV/PD/{rand}', 'Kode Invoice Perjalanan Dinas');
INSERT INTO `setting_table` VALUES (10, 'pembayaran_sewa', 'invoice', 'INV/PS/{rand}', 'Kode Invoice Pembayaran Sewa');
INSERT INTO `setting_table` VALUES (11, 'pasien', 'idcard', 'KS-{rand}-{month}-klinik', 'Kode Kartu Pasien');
INSERT INTO `setting_table` VALUES (12, 'kartu', 'idcard', 'KS-{rand}-KK-{date}-knew', 'Kode Kartu Per Keluarga');
INSERT INTO `setting_table` VALUES (13, 'surat_kesehatan', 'surat_ijin_sakit', 'include/media/template_surat_istirahat.docx', 'Surat Kesehatan');
INSERT INTO `setting_table` VALUES (14, 'surat_kesehatan', 'invoice', 'INV/SurKes/{date}/{rand}', 'Kode Invoice Surat Kesehatan');
INSERT INTO `setting_table` VALUES (15, 'surat_kesehatan', 'surat_kesehatan', 'include/media/template_surat_kesehatan.docx', 'Surat Kesehatan');
INSERT INTO `setting_table` VALUES (16, 'rujukan_masuk', 'surat_rujukan_masuk', 'include/media/template_surat_rujukan_masuk.docx', 'Surat Rujukan Masuk');
INSERT INTO `setting_table` VALUES (17, 'rujukan_keluar', 'surat_rujukan_keluar', 'include/media/template_surat_rujukan_keluar.docx', 'Surat Rujukan Keluar');
INSERT INTO `setting_table` VALUES (18, 'rekam_medis', 'additional', 'printer_medkit', 'Print Thermal Name');
INSERT INTO `setting_table` VALUES (19, 'rekam_medis', 'template_struk', '-------------------------\r\n|                       |\r\n|  Klinik Sekarpuro     |\r\n|                       |\r\n-------------------------', 'Header Template Struk Rekam Medis');

-- ----------------------------
-- Table structure for setting_website
-- ----------------------------
DROP TABLE IF EXISTS `setting_website`;
CREATE TABLE `setting_website`  (
  `SPP` double(20, 0) NULL DEFAULT NULL,
  `DSP` double(20, 0) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of setting_website
-- ----------------------------
INSERT INTO `setting_website` VALUES (0, NULL);

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
  PRIMARY KEY (`id_siswa`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 549 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of siswa
-- ----------------------------
INSERT INTO `siswa` VALUES (275, NULL, 'AHMAD WILDAN MAULANA', 28, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (276, NULL, 'AKBAR HASIM', 28, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (277, NULL, 'ALTOFFANDI DHIFAN FAJRIN', 28, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (278, NULL, 'DIMAS DWITYA KUSUMA', 28, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (279, NULL, 'DWI ILHAM TABAH SAMUDRA', 28, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (280, NULL, 'FACHRIS FIRMAN RAMADHANI', 28, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (281, NULL, 'IMAM GHOZALI', 28, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (282, NULL, 'JEFRY SAPUTRO', 28, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (283, NULL, 'M FARID MUKHOROFI AKBAR', 28, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (284, NULL, 'M NAUFAL ADDAUFI', 28, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (285, NULL, 'M. FERDY MAULIDAN', 28, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (286, NULL, 'MOCHAMMAD RIZA WIDYA CHESTA ABADI', 28, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (287, NULL, 'MUHAMMAD FATIH ZAMZAMI', 28, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (288, NULL, 'MUHAMMAD KUMOLOJATI AL-GHOZALI', 28, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (289, NULL, 'MUHAMMAD NUKMAN ZAINUDDIN', 28, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (290, NULL, 'NAUFAL AZFA MAULIDIAN', 28, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (291, NULL, 'RIZKI AGUNG WIBOWO', 28, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (292, NULL, 'SYAHRUL MUBAROQ', 28, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (293, NULL, 'ADAM RAHMATULLOH', 29, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (294, NULL, 'AHMAD ABBAS FAIDILLAH', 29, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (295, NULL, 'AHMAD FARHAN BINTARO ALAMSYAH', 29, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (296, NULL, 'ALI ASHAR', 29, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (297, NULL, 'DURRY ABIYYU NAWWAF', 29, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (298, NULL, 'HANIF ASKAR DZIKIER', 29, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (299, NULL, 'I\'TADUL MUROQIY', 29, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (300, NULL, 'KHANAYA EL FARRADZ HARAHAP', 29, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (301, NULL, 'M HANIF ZAMZAM', 29, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (302, NULL, 'M IRFAUR RIZKI', 29, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (303, NULL, 'M. SEPTIAN RIZKY WIJAYA', 29, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (304, NULL, 'MOCHAMAD ULUL ALBAB', 29, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (305, NULL, 'MUCHAMMAD ILYAS GHOFUR', 29, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (306, NULL, 'MUHAMMAD HAMZAH ALBATAMY', 29, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (307, NULL, 'MUHAMMAD HUSNI MUBAROK', 29, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (308, NULL, 'MUHAMMAD MUHIBBIL ILMI', 29, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (309, NULL, 'MUHAMMAD MUJAHID ARIDHO', 29, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (310, NULL, 'MUHAMMAD SYAIFUR RIDHO', 29, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (311, NULL, 'RIZKY AJI BAYU SAMPURNA', 29, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (312, NULL, 'SATRIA YUDHA PAMUNGKAS', 29, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (313, NULL, 'SYAHRUL FADLI AL MUBAROK', 29, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (314, NULL, 'ACHMAD AUDI RIZKY', 30, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (315, NULL, 'ACHMAD BALYAN  SYAUQILLAH', 30, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (316, NULL, 'ACHMAD FADHEL IRSYAD ZAKARIA', 30, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (317, NULL, 'ACHMAD ZACKY', 30, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (318, NULL, 'ADEL AIDE CANBERRA MUHAMMAD', 30, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (319, NULL, 'AMAR DJATI DIMAS NUGRAHA', 30, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (320, NULL, 'BARIZUL HAQ AHMAD', 30, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (321, NULL, 'CHAIS JUNASOR', 30, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (322, NULL, 'CHOIRU MAZKURI RAHMAN', 30, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (323, NULL, 'DHIMAS FIRMANSYAH', 30, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (324, NULL, 'ILHAM FAHMIANSYAH', 30, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (325, NULL, 'MISBAHUL RAFLI ALFANDI', 30, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (326, NULL, 'MOCH. THORIQ ADIL LAIDE KAMMARUZZAMAN KHOLIK', 30, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (327, NULL, 'MOHAMMAD DZULKIFLI AFRIZAL AHMAD', 30, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (328, NULL, 'MUHAMMAD VIKKY NURSYAHRONI', 30, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (329, NULL, 'MUNAWIRUL FUADI', 30, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (330, NULL, 'REVANZA PUTRA RAMADHANI', 30, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (331, NULL, 'TEGAR ILYASA', 30, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (332, NULL, 'M. IRFAN ASROFI', 30, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (333, NULL, 'TEKAD INDRA PAMUNGKAS', 30, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (334, NULL, 'SULBI RAHMAT', 30, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (335, NULL, 'ADEL WIBISONO', 31, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (336, NULL, 'AHMAD NURUDIN ISLAMI', 31, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (337, NULL, 'AQIB IRVAN PURNOMO', 31, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (338, NULL, 'MUHAMMAD AMRY YUSRON', 31, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (339, NULL, 'MUKHAMAD FATKHUROHMAN', 31, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (340, NULL, 'NANDA FRIMA SETIAWAN', 31, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (341, NULL, 'RAFIANO ZHAKIRI', 31, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (342, NULL, 'AMELIA DIAN LESTARI', 35, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (343, NULL, 'AYU DUWI AGUSTINA', 35, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (344, NULL, 'FADILA AULIA SARI', 35, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (345, NULL, 'FATIMAH AZZAHRA', 35, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (346, NULL, 'MAGHFIROH BARIDATUL AFWIYA', 35, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (347, NULL, 'SYAYLA HANIF FAIZUNA', 35, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (348, NULL, 'TSALISATUL MAULIDAH', 35, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (349, NULL, 'VIDIA SARI', 35, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (350, NULL, 'DEWI NAYLUL MUFIDAH', 35, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (351, NULL, 'JENNY CITRA HANDAYANI', 35, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (352, NULL, 'KHIKMATUL MAKHLUFI ANANTA', 35, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (353, NULL, 'NABILA FAUZI', 35, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (354, NULL, 'RAHAF FITRIA', 35, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (355, NULL, 'SINDI AULIA WARDANI', 35, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (356, NULL, 'GIUR RAUDHAH', 35, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (357, NULL, 'NAJWA FATIMAH ASMAWI', 35, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (358, NULL, 'NINIK KURNIAWATI', 35, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (359, NULL, 'PUTRI AULIA RAMADHANTI', 35, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (360, NULL, 'SAFIRATUL AZHAR', 35, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (361, NULL, 'SYARIFAH KHODIJAH', 35, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (362, NULL, 'UMI HABIBAH', 35, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (363, NULL, 'ADITAMI FITRIA', 36, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (364, NULL, 'ANASTASYA STEFANIE QURROTA A\'YUN', 36, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (365, NULL, 'AZIZATUL MAHMUDA', 36, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (366, NULL, 'FAMELIA NAILUN NAJWA', 36, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (367, NULL, 'FIORENTINA RAMADHANI', 36, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (368, NULL, 'INDANA ZULFA', 36, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (369, NULL, 'MAYANG AWRELIYA SAKHA SOMALLA', 36, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (370, NULL, 'NABILAH ZAHRAH ISFANTI', 36, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (371, NULL, 'NAILLA KUSUMA YULIANT PUTRI', 36, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (372, NULL, 'RANI LESTARI', 36, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (373, NULL, 'SANIA NURFARIKHA', 36, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (374, NULL, 'SAVIRA PUTRI NURHALISA', 36, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (375, NULL, 'SIRLI TAHTA DHILALI', 36, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (376, NULL, 'USWATUN KHASANAH', 36, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (377, NULL, 'ZILDJIAN DZUN NUR\'AIN AZ-ZAHRA', 36, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (378, NULL, 'ABDUL AZIZ', 32, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (379, NULL, 'ACHMAD ARISY FIRMANSYAH', 32, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (380, NULL, 'ACHMAD BAHRUL ULUM MARZUQI', 32, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (381, NULL, 'ACHMAD MA\'RIFATUL FIQHI', 32, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (382, NULL, 'ACHMAD YUSRON', 32, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (383, NULL, 'AHMAD ARIFIN ILHAM ', 32, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (384, NULL, 'AHMAD FARIHUR ROMDLONI', 32, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (385, NULL, 'DANDI SETYOKO', 32, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (386, NULL, 'EMRIZAL HAMED BASSELA', 32, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (387, NULL, 'HAMMAM ALWY', 32, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (388, NULL, 'M. MUHAIMIN ', 32, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (389, NULL, 'MIFTAH HUSURUR ALHISYI', 32, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (390, NULL, 'MOCH. IRFAN SATRIO', 32, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (391, NULL, 'MOCH. MAULANA RAMADHAN', 32, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (392, NULL, 'MOCHAMMAD AFIEH RAZALI', 32, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (393, NULL, 'MOCHAMMAD IMAM FATONI', 32, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (394, NULL, 'MUHAMMAD KHOIRUL ANTARIKSA', 32, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (395, NULL, 'MUHAMMAD RIF\'AN ZULKIFLI', 32, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (396, NULL, 'MUHAMMAD SHOBIRIN ', 32, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (397, NULL, 'MUHAMMAD SYAIFUDDIN ZUHRI', 32, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (398, NULL, 'NANDA NURUS SHOLIHIN ', 32, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (399, NULL, 'RENDI FERDIANTO', 32, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (400, NULL, 'FERDIAN WAHYU NUGROHO', 32, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (402, NULL, 'ABDUL MU\'ID', 33, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (403, NULL, 'ACHMAD NU\'MAN MAQBUL', 33, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (404, NULL, 'AHMAD NIZAR', 33, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (405, NULL, 'ALVIO TREINADI', 33, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (406, NULL, 'BAYU SATRIYO PAMUNGKAS', 33, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (407, NULL, 'FEBYAN AZIMMY IQBAL MAULIDHANI', 33, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (408, NULL, 'FIRDAUS REYHAN PRAMUDYA ANANTA', 33, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (409, NULL, 'HENDRI ', 33, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (410, NULL, 'IZUL HABIBULLOH', 33, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (411, NULL, 'MUHAMAD IZZUDDIN FAHMI ABIDIN', 33, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (412, NULL, 'MUHAMAD PUTRA MAULIDANI', 33, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (413, NULL, 'MUHAMMAD BAHARUDIN MA\'RUF', 33, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (414, NULL, 'MUHAMMAD BINTANG RABBANI', 33, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (415, NULL, 'MUHAMMAD BIRRUL WALIDAIN', 33, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (416, NULL, 'MUHAMMAD LUKMAN HAKIM', 33, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (417, NULL, 'MUHAMMAD MINANUR ROHMAN', 33, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (418, NULL, 'MUHAMMAD NAUFAL SYAFIQ AKHSANI', 33, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (419, NULL, 'MUHAMMAD RAFLI', 33, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (420, NULL, 'MUHAMMAD UBAIDILLAH', 33, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (421, NULL, 'OSCAR GONZALES PIRY', 33, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (422, NULL, 'ROCHIT SANTOSO', 33, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (423, NULL, 'SATRIA YUDHA PURNAMA ', 33, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (424, NULL, 'SUGENG SLAMET RIDHO\'I', 33, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (426, NULL, 'DINI NAFISA', 34, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (427, NULL, 'IRBAH RIZQIYAH IMAMATUL MAULA', 34, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (428, NULL, 'NESA HAMIVA EL- GAZWA', 34, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (429, NULL, 'NOVA ZULFA SAFANAH', 34, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (430, NULL, 'SAFINAH ANNAJAH', 34, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (431, NULL, 'TUHFATUL MARDIYYAH', 34, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (432, NULL, 'ACHMAD THORIQ AL-AYYUBI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (433, NULL, 'ACHMAD THORIQ AL-AYYUBI', 25, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (434, NULL, 'ALIEF RISKI SETIAWAN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (435, NULL, 'ALIEF RISKI SETIAWAN', 25, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (436, NULL, 'BAGUS SANDIARTA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (437, NULL, 'BAGUS SANDIARTA', 25, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (438, NULL, 'CAHYA INDRA LUKMANA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (439, NULL, 'CAHYA INDRA LUKMANA', 25, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (440, NULL, 'DANIEL DECO NAJHAN ZALFA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (441, NULL, 'DANIEL DECO NAJHAN ZALFA', 25, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (442, NULL, 'DHONI AHMAD MUHAJJIR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (443, NULL, 'DHONI AHMAD MUHAJJIR', 25, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (444, NULL, 'DZIKRU ROZAQ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (445, NULL, 'DZIKRU ROZAQ', 25, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (446, NULL, 'ERLANGGA CAHYA PUTRA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (447, NULL, 'ERLANGGA CAHYA PUTRA', 25, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (448, NULL, 'FARIHIN IKSAN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (449, NULL, 'FARIHIN IKSAN', 25, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (450, NULL, 'M. DAWAM ROYHANUL MUKAROM', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (451, NULL, 'M. DAWAM ROYHANUL MUKAROM', 25, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (452, NULL, 'M. FIKRY AL MUZAKKY', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (453, NULL, 'M. FIKRY AL MUZAKKY', 25, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (454, NULL, 'MOCHAMAD ROYKHAN KEN IZZUDIN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (455, NULL, 'MOCHAMAD ROYKHAN KEN IZZUDIN', 25, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (456, NULL, 'MOCHAMMAD FAQIHUDDIN HUDA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (457, NULL, 'MOCHAMMAD FAQIHUDDIN HUDA', 25, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (458, NULL, 'MOCHAMMAD GIAN HARJA YODHA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (459, NULL, 'MOCHAMMAD GIAN HARJA YODHA', 25, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (460, NULL, 'MOH ALFAN ARIZKI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (461, NULL, 'MOH ALFAN ARIZKI', 25, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (462, NULL, 'MOH. RIZIQ FIRDAUS FADLI ROBBY', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (463, NULL, 'MOH. RIZIQ FIRDAUS FADLI ROBBY', 25, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (464, NULL, 'MOH. SAFI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (465, NULL, 'MOH. SAFI', 25, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (466, NULL, 'MOKHAMAD ZULFIKAR PUTRA IMRON', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (467, NULL, 'MOKHAMAD ZULFIKAR PUTRA IMRON', 25, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (468, NULL, 'MUHAMMAD AFIRIL ARDAN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (469, NULL, 'MUHAMMAD AFIRIL ARDAN', 25, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (470, NULL, 'MUHAMMAD FIRDAUS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (471, NULL, 'MUHAMMAD IN\'AM FALAHUDDIN', 25, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (472, NULL, 'MUHAMMAD FIRDAUS', 25, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (473, NULL, 'MUHAMMAD IN\'AM FALAHUDDIN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (474, NULL, 'MUKHAMAD AMIR AKHSANUL KHOLIQIN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (475, NULL, 'MUKHAMAD AMIR AKHSANUL KHOLIQIN', 25, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (476, NULL, 'NAIL MAJID SANTOSO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (477, NULL, 'NAWWAL IRFAN MUHAMMAD', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (478, NULL, 'NAIL MAJID SANTOSO', 25, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (479, NULL, 'NOZA JIMMY PRASETYO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (480, NULL, 'NAWWAL IRFAN MUHAMMAD', 25, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (481, NULL, 'RAIHAN ALFARIZI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (482, NULL, 'NOZA JIMMY PRASETYO', 25, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (483, NULL, 'ROISUL AHYER', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (484, NULL, 'RAIHAN ALFARIZI', 25, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (485, NULL, 'SYAHRUL NUR FADHILAH', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (486, NULL, 'ROISUL AHYER', 25, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (487, NULL, 'TERRY ACHMAD VAREL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (488, NULL, 'SYAHRUL NUR FADHILAH', 25, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (489, NULL, 'TITO MAULANA IBRAHIM', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (490, NULL, 'TERRY ACHMAD VAREL', 25, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (491, NULL, 'TITO MAULANA IBRAHIM', 25, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (492, NULL, 'AGUSTI REVI NUHHA', 37, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (493, NULL, 'AUHA MAY ZIADAH', 37, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (494, NULL, 'DYAH RINI KUSUMAWATI', 37, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (495, NULL, 'KHUSNUL KHOTIMAH PUTRI WIJAYA', 37, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (496, NULL, 'MUTIARA JASMINE JAY RAMADHANI', 37, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (497, NULL, 'A. TAHAR MUZEKY', 26, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (498, NULL, 'ACHMAD WAHYU AL-BAIHAQI', 26, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (499, NULL, 'DHONNY EMRE ROY', 26, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (500, NULL, 'FIDI GAUTAMA VALENTINO ANTOLIN', 26, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (501, NULL, 'FIRZHA IBRAHIM WIDYA NUGROHO', 26, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (502, NULL, 'FITRA AL INSANI', 26, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (503, NULL, 'HABIB MAS\'UD DJAZULI', 26, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (504, NULL, 'HASBI AFRIZAL FAHMI', 26, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (505, NULL, 'MOCH. AZKA AFIFI', 26, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (506, NULL, 'MOH. GHULAM ALFATIH', 26, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (507, NULL, 'MUHAMMAD ROIZU DZUL FIKRI', 26, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (508, NULL, 'MUHAMMAD YASYFI FUADANA', 26, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (509, NULL, 'ROSYID AL AMIR', 26, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (510, NULL, 'WILDAN SALASA', 26, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (511, NULL, 'YAKI\' FATAHILLAH YULSTIAWAN', 26, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (512, NULL, 'ADHELIA PUTRI ISLAMIAH', 38, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (513, NULL, 'AMANDA RAHMAWATI', 38, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (514, NULL, 'CHOIROTUL ULA', 38, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (515, NULL, 'HABIBAH SHOFI FUTUHIL AULIA', 38, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (516, NULL, 'LAILA SHINE TAZKIYATUNNAFS', 38, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (517, NULL, 'NISRINA WASHFA NABILA', 38, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (518, NULL, 'NUR FADILATUS ZAHRO', 38, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (519, NULL, 'SHOFI SAVIRA', 38, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (520, NULL, 'DIKI PUTRA ARDIANSYAH', 27, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (521, NULL, 'AINUN JAMILA', 27, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (522, NULL, 'ANGGITA ROHMAN OCTAFIYA', 27, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (523, NULL, 'AULIA NABILATUZ ZAHRO AL-MAWADAH', 27, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (524, NULL, 'CITRA CHINTIYA SARI', 27, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (525, NULL, 'EKA FARIHATUL AFIANN', 27, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (526, NULL, 'NADIA RAHMA PUTRI', 27, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (527, NULL, 'NAILAL FAROHAH ABIDIN', 27, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (528, NULL, 'NAZLATUS MASDHA', 27, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (529, NULL, 'RENATA SYAKILLA R. S.', 27, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (530, NULL, 'UMI FARIDA ZULFA', 27, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (531, NULL, 'YASINTA HASNA ANWAR', 27, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (532, NULL, 'ZAKYAH NAYLAL IZZAH', 27, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (533, NULL, 'AFIFATUS SA\'DIAH', 34, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (534, NULL, 'AINUR ROHMAH', 34, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (535, NULL, 'AMILATUSSHOLIHAH', 34, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (536, NULL, 'ARIS FADHILAH', 34, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (537, NULL, 'DINI SEFIYAH', 34, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (538, NULL, 'INTAN SODIMIRANDA', 34, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (539, NULL, 'JUNDA ALIFIA RAHMAWATI', 34, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (540, NULL, 'KHOIRUNNISA AMALIA', 34, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (541, NULL, 'MAULIDATUN NABILA', 34, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (542, NULL, 'NASYWA NUR FILDZAH', 34, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (543, NULL, 'SAFINATUL ISLAMIYAH', 34, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (544, NULL, 'SAFITRI', 34, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (545, NULL, 'SHOFY MUFIDATUL UMMAH', 34, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (546, NULL, 'VIA NI\'MATUL IZZA', 34, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (547, NULL, 'ZUHAUL FIKRIYAH', 34, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (548, NULL, 'ZUHRUFUL HIKMATUZ ZAHRO', 34, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

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
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of subkompetensi_pkg
-- ----------------------------
INSERT INTO `subkompetensi_pkg` VALUES (1, 1, 'Menguasai  karakteristik  peserta  didik', 'K1');
INSERT INTO `subkompetensi_pkg` VALUES (2, 1, 'Menguasai  teori  belajar  dan  prinsip?prinsip  pembelajaran  yang  mendidik', 'K2');
INSERT INTO `subkompetensi_pkg` VALUES (3, 1, 'Pengembangan  kurikulum', 'K3');
INSERT INTO `subkompetensi_pkg` VALUES (4, 1, 'Kegiatan  pembelajaran  yang  mendidik', 'K4');
INSERT INTO `subkompetensi_pkg` VALUES (5, 1, 'Pengembangan  potensi  peserta  didik', 'K5');
INSERT INTO `subkompetensi_pkg` VALUES (6, 1, 'Komunikasi  dengan  peserta  didik', 'K6');
INSERT INTO `subkompetensi_pkg` VALUES (7, 1, 'Penilaian  dan  evaluasi', 'K7');
INSERT INTO `subkompetensi_pkg` VALUES (8, 3, 'Bertindak  sesuai  dengan  norma  agama,  hukum,  sosial  dan  kebudayaan nasional', 'K8');
INSERT INTO `subkompetensi_pkg` VALUES (9, 3, 'Menunjukkan  pribadi  yang  dewasa  dan  teladan', 'K9');
INSERT INTO `subkompetensi_pkg` VALUES (10, 3, 'Etos  kerja,  tanggung  jawab  yang  tinggi,  rasa  bangga  menjadi  guru', 'K10');
INSERT INTO `subkompetensi_pkg` VALUES (11, 4, 'Bersikap  inklusif,  bertindak  obyektif,  serta  tidak  diskriminatif', 'K11');
INSERT INTO `subkompetensi_pkg` VALUES (12, 4, 'Komunikasi  dengan  sesama  guru,  tenaga  kependidikan,  orang  tua,  peserta didik,  dan  masyarakat', 'K12');
INSERT INTO `subkompetensi_pkg` VALUES (13, 5, 'Penguasaan  materi,  struktur,  konsep  dan  pola  pikir  keilmuan  yg mendukung  mata  pelajaran  yg  diampu', 'K13');
INSERT INTO `subkompetensi_pkg` VALUES (14, 5, 'Mengembangkan  keprofesionalan  melalui  tindakan  yang  reflektif ', 'K14');
INSERT INTO `subkompetensi_pkg` VALUES (15, 6, 'coba', NULL);
INSERT INTO `subkompetensi_pkg` VALUES (16, 6, 'coba1', NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of surat_keluar
-- ----------------------------
INSERT INTO `surat_keluar` VALUES (1, 'Malang', 'asd', '110/233/smkit/2019', '314941', '9654d34051c8dc57bd2e575bdaf8191f.pdf', '2020-12-08', '2020-12-08 14:05:22');
INSERT INTO `surat_keluar` VALUES (2, 'aas', 'asdasd', '110/233/smkit/2019', '453826', '4152f765ee322c88d9422c8948b7b319.docx', '2020-12-08', '2020-12-08 14:06:27');

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
  PRIMARY KEY (`id_surat_masuk`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of surat_masuk
-- ----------------------------
INSERT INTO `surat_masuk` VALUES (1, 'PPSQ1', 'Rapat Gan', '2020-12-01', '782958', '2020-12-05 18:11:52', NULL);
INSERT INTO `surat_masuk` VALUES (2, 'PPSQ2', 'Rapat Gan', '2020-12-01', '782958', '2020-12-05 18:11:52', NULL);
INSERT INTO `surat_masuk` VALUES (3, 'PPSQ3', 'Rapat Gan', '2020-12-01', '782958', '2020-12-05 18:11:52', NULL);
INSERT INTO `surat_masuk` VALUES (4, 'PPSQ4', 'Rapat Gan', '2020-12-01', '782958', '2020-12-05 18:11:52', NULL);
INSERT INTO `surat_masuk` VALUES (5, 'PPSQ5', 'Rapat Gan', '2020-12-02', '782958', '2020-12-05 18:11:52', NULL);
INSERT INTO `surat_masuk` VALUES (6, 'PPSQ6', 'Rapat Gan', '2020-12-02', '782958', '2020-12-05 18:11:52', NULL);
INSERT INTO `surat_masuk` VALUES (7, 'PPSQ7', 'Rapat Gan', '2020-12-02', '782958', '2020-12-05 18:11:52', NULL);
INSERT INTO `surat_masuk` VALUES (8, 'PPSQ8', 'Rapat Gan', '2020-12-02', '782958', '2020-12-05 18:11:52', NULL);
INSERT INTO `surat_masuk` VALUES (9, 'PPSQ9', 'Rapat Gan', '2020-12-03', '782958', '2020-12-05 18:11:52', NULL);
INSERT INTO `surat_masuk` VALUES (10, 'PPSQ10', 'Rapat Gan', '2020-12-04', '782958', '2020-12-05 18:11:52', NULL);
INSERT INTO `surat_masuk` VALUES (11, 'PPSQ11', 'Rapat Gan', '2020-12-04', '782958', '2020-12-05 18:11:52', NULL);
INSERT INTO `surat_masuk` VALUES (12, 'PPSQ12', 'Rapat Gan', '2020-12-04', '782958', '2020-12-05 18:11:52', NULL);
INSERT INTO `surat_masuk` VALUES (13, 'PPSQ13', 'Rapat Gan', '2020-12-04', '782958', '2020-12-05 18:11:52', NULL);
INSERT INTO `surat_masuk` VALUES (14, 'PPSQ14', 'Rapat Gan', '2020-12-04', '782958', '2020-12-05 18:11:52', NULL);
INSERT INTO `surat_masuk` VALUES (15, 'PPSQ15', 'Rapat Gan', '2020-12-05', '782958', '2020-12-05 18:11:52', NULL);
INSERT INTO `surat_masuk` VALUES (16, 'PPSQ16', 'Rapat Gan', '2020-12-05', '782958', '2020-12-05 18:11:52', NULL);
INSERT INTO `surat_masuk` VALUES (17, 'PPSQ17', 'Rapat Gan', '2020-12-05', '782958', '2020-12-05 18:11:52', NULL);
INSERT INTO `surat_masuk` VALUES (18, 'PPSQ18', 'Rapat Gan', '2020-12-05', '782958', '2020-12-05 18:11:52', NULL);
INSERT INTO `surat_masuk` VALUES (19, 'PPSQ19', 'Rapat Gan', '2020-12-05', '782958', '2020-12-05 18:11:52', NULL);
INSERT INTO `surat_masuk` VALUES (20, 'PPSQ20', 'Rapat Gan 1', '2020-12-05', '782958', '2020-12-05 18:11:52', NULL);
INSERT INTO `surat_masuk` VALUES (22, 'PPSQ2233', 'Rapat Masbro', '2020-12-01', '7829589', '2020-12-05 18:11:52', '110/233/smkit/2019');
INSERT INTO `surat_masuk` VALUES (23, 'Myber Center', 'Kerjasama teknologi ', '2020-12-07', '695617', '2020-12-07 20:25:52', '110/233/smkit/2019');

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
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tahun_ajaran
-- ----------------------------
INSERT INTO `tahun_ajaran` VALUES (1, '2020/2021', '2020-06-07 10:07:41', 0, 'Ganjil');
INSERT INTO `tahun_ajaran` VALUES (2, '2018/2019', '2020-08-03 11:06:13', 0, 'Genap');
INSERT INTO `tahun_ajaran` VALUES (3, '2021/2022', '2021-07-31 12:26:40', 1, 'Ganjil');

-- ----------------------------
-- Table structure for tingkat
-- ----------------------------
DROP TABLE IF EXISTS `tingkat`;
CREATE TABLE `tingkat`  (
  `id_tingkat` int(11) NOT NULL AUTO_INCREMENT,
  `tingkat` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `create_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_tingkat`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tingkat
-- ----------------------------
INSERT INTO `tingkat` VALUES (1, 'X', '2020-06-07 09:54:48');
INSERT INTO `tingkat` VALUES (2, 'XI', '2020-06-07 09:54:48');
INSERT INTO `tingkat` VALUES (3, 'XII', '2020-06-07 09:55:06');

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
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, '127.0.0.1', 'admin', '$2y$08$mxSDKMRKsKM3IwN6NPoB6.3pQqymDu4ZtGAMIzpw.ppcie3MJM9ty', '', 'hello@admin.com', '', NULL, NULL, NULL, 1268889823, 1628152874, 1, 'admin', 'Yani', 'ADMIN', '085894632505', '3c8f6f36f650d5ce07803470b4f4d4ff.jpg', NULL, NULL, NULL);
INSERT INTO `users` VALUES (3, '127.0.0.1', 'rendy', '$2y$08$OElO/1onJ/wrgc5vc7OfyuYmt6dyEUZVW4oEOzkDJtNoVUXs89.RO', '', 'hello@admin.com', '', NULL, NULL, NULL, 1268889823, 1628143887, 1, 'Rendy', 'Yani', 'ADMIN', '085894632505', '3c8f6f36f650d5ce07803470b4f4d4ff.jpg', 2, 'guru', 1);
INSERT INTO `users` VALUES (4, '::1', 'is_376326', '$2y$08$btIyb0KsgC.oQwjrEAo.kOtGP2v.HAIe6I7fXaGSi1D8ftrhDAKSK', NULL, 'is_376326@gmail.com', NULL, NULL, NULL, NULL, 1609057333, 1622508531, 1, 'Abdur Rochim, S.Pd.', NULL, NULL, NULL, NULL, 6, 'guru', NULL);
INSERT INTO `users` VALUES (5, '::1', 'is_559029', '$2y$08$O0X.fpQqfSjoyvdnwkwMGuizSSh2UGVW65nYjY60F3QT4c0cEAU36', NULL, 'is_559029@gmail.com', NULL, NULL, NULL, NULL, 1609057451, 1627881837, 1, 'Avi Hendratmoko, S.Kom.', NULL, NULL, NULL, NULL, 7, 'guru', NULL);
INSERT INTO `users` VALUES (6, '::1', 'is_692692', '$2y$08$IRAxfjkQv0dssEQI3d6CAeKGJyhxtcvM6jq66D2g681Oe4Z5sFB1S', NULL, 'is_692692@gmail.com', NULL, NULL, NULL, NULL, 1609057777, 1609057789, 1, 'M. Maimun Muzakka', NULL, NULL, NULL, NULL, 8, 'guru', 1);
INSERT INTO `users` VALUES (7, '::1', 'is_591727', '$2y$08$HRS9vvh3bShD9YQ6TJaaru7ypOsaB4yo8Eigjr0ueEK0A07h/H0Xa', NULL, 'is_591727@gmail.com', NULL, NULL, NULL, NULL, 1609057880, 1609057922, 1, 'Cindy Permata Putri, S.Pd', NULL, NULL, NULL, NULL, 9, 'guru', 1);
INSERT INTO `users` VALUES (8, '::1', 'is_988975', '$2y$08$wyknxv1J15BzDCWXjEF/hOj8wSYniCCfz/v9CmD6WCAiVTGX2OD.u', NULL, 'is_988975@gmail.com', NULL, NULL, NULL, NULL, 1609058009, 1627707443, 1, 'Roikhatul Uzza, S.Psi', NULL, NULL, NULL, NULL, 10, 'guru', 1);
INSERT INTO `users` VALUES (9, '::1', 'is_513197', '$2y$08$U6OjOMqa4yvru.SqWTqxpur8XEV1fYjGb4N7HV2X2W.bJ3iNBKevG', NULL, 'is_513197@gmail.com', NULL, NULL, NULL, NULL, 1609058110, 1621504214, 1, 'Nur Cholis, S.Pdi', NULL, NULL, NULL, NULL, 12, 'guru', NULL);
INSERT INTO `users` VALUES (10, '::1', 'is_477147', '$2y$08$a7i0YglvIrBrmFSHLfkGcOLq2bXdyYw6mKQPv0fd5XAdlsGq0xcAm', NULL, 'is_477147@gmail.com', NULL, NULL, NULL, NULL, 1609058143, 1609161762, 1, 'Pohet Bintoto, S.Pd., M.Si.', NULL, NULL, NULL, NULL, 13, 'guru', NULL);
INSERT INTO `users` VALUES (11, '::1', 'is_281057', '$2y$08$/sh4Fl5e6ERosaRuoY1TbeND.a2ZnIlWcecy164L.HeqgwnPN3CXe', NULL, 'is_281057@gmail.com', NULL, NULL, NULL, NULL, 1609058204, 1609058223, 1, 'Mohammad Nazibullah, M.Pd.', NULL, NULL, NULL, NULL, 14, 'guru', 1);
INSERT INTO `users` VALUES (12, '::1', 'is_950864', '$2y$08$.zH8VbjS1kSw.AaeZmn3fepcNXga0u1V4crBNyLotssKcA3pheME2', NULL, 'is_950864@gmail.com', NULL, NULL, NULL, NULL, 1609058269, 1609058286, 1, 'Syamsul Arifin, S.Pd.', NULL, NULL, NULL, NULL, 15, 'guru', NULL);
INSERT INTO `users` VALUES (13, '::1', 'is_64964', '$2y$08$PqXqWLPoMZQxAlRCI3M4sOnRk22Hl1cr3vhTTJhrXNGpH/bQLYXFq', NULL, 'is_64964@gmail.com', NULL, NULL, NULL, NULL, 1609058314, 1609058345, 1, 'M. Mirza Ayatulloh, S.Psi.', NULL, NULL, NULL, NULL, 16, 'guru', 1);
INSERT INTO `users` VALUES (14, '::1', 'is_56015', '$2y$08$16KcxEJG.1uz/KgEm29SNOJ.JaujRK4gp3qKQlsKK044ZP6jcFBii', NULL, 'is_56015@gmail.com', NULL, NULL, NULL, NULL, 1609058398, 1627707000, 1, 'Sutan Taufik, S.Hum', NULL, NULL, NULL, NULL, 17, 'guru', NULL);
INSERT INTO `users` VALUES (15, '::1', 'is_427471', '$2y$08$G46TnI8BorORyqzMbNB.Hu/VABmSGTtT8U6uwe2dmNXcoqmhugzam', NULL, 'is_427471@gmail.com', NULL, NULL, NULL, NULL, 1609058453, 1609058465, 1, 'Fatat Alvin D. N. S.', NULL, NULL, NULL, NULL, 18, 'guru', NULL);
INSERT INTO `users` VALUES (16, '::1', 'is_497512', '$2y$08$RKIXmDz2O2TLJCi.DN3vpuLBEGRXxsu7ALt6S438WHFAJIYJDmAHq', NULL, 'is_497512@gmail.com', NULL, NULL, NULL, NULL, 1609058509, 1627363539, 1, 'Nailatur Rizqiyah S.P.', NULL, NULL, NULL, NULL, 19, 'guru', 1);
INSERT INTO `users` VALUES (17, '::1', 'is_563268', '$2y$08$/PsZXKIavCasI8.GHz48lugp/SKEJH0oOJaDTek4R17azsPG7HS36', NULL, 'is_563268@gmail.com', NULL, NULL, NULL, NULL, 1609058569, 1609058580, 1, 'Saifudin Mansur, S.TP', NULL, NULL, NULL, NULL, 20, 'guru', NULL);
INSERT INTO `users` VALUES (18, '::1', 'is_372371', '$2y$08$/XfJfdVqXX0mE2KYNf6GfOPSPbhkd12YM9UjPIi1G1397y72JqPVq', NULL, 'is_372371@gmail.com', NULL, NULL, NULL, NULL, 1609058613, 1609058633, 1, 'Faridatuz Zakiyah, S.TP', NULL, NULL, NULL, NULL, 21, 'guru', NULL);
INSERT INTO `users` VALUES (21, '::1', 'is_641841', '$2y$08$VaKYWH0thKssaW0N70np/et8ev9WGT52gnpH7QKkh93mdVg3Af91q', NULL, 'is_641841@gmail.com', NULL, NULL, NULL, NULL, 1609058827, 1609923386, 1, 'Muhammad Ali Saifudin, S.Pd.', NULL, NULL, NULL, '5.png', 24, 'guru', 1);
INSERT INTO `users` VALUES (22, '::1', 'is_454070', '$2y$08$5L1Y0/zyAbZls1E2oA83huR6S9SRORbmqY9IEFQhHZVZ7tQqjZin2', NULL, 'is_454070@gmail.com', NULL, NULL, NULL, NULL, 1609058904, 1628135150, 1, 'M. Faiz Zidni Mubarok, S.Pt', NULL, NULL, NULL, NULL, 25, 'guru', 1);
INSERT INTO `users` VALUES (24, '::1', 'izza', '$2y$08$nHh9egHLyygkRFc8Xl.uB.w2JEarInC3ePV3jVN276bPw/IOgP4QG', NULL, 'is_61570@gmail.com', NULL, NULL, NULL, NULL, 1624851517, 1628141889, 1, 'Roikhatul Uzza, S.Psi', NULL, NULL, NULL, NULL, 10, 'guru', NULL);
INSERT INTO `users` VALUES (25, '::1', 'is_246926', '$2y$08$wM5W8aGU71EIVzTVS5z1dOesg0I7IhJvlL0t7Bu2UJ3DG3qmKdSZi', NULL, 'is_246926@gmail.com', NULL, NULL, NULL, NULL, 1624884922, 1625555216, 1, 'Mohammad Nazibullah, M.Pd.', NULL, NULL, NULL, NULL, 14, 'guru', NULL);
INSERT INTO `users` VALUES (26, '::1', 'is_392276', '$2y$08$D245ZxeAISJSajYA6he8EOipxKJ2JVADYzDu2/VlvjQkAvKOTvjJi', NULL, 'is_392276@gmail.com', NULL, NULL, NULL, NULL, 1624886187, 1624886200, 1, 'Nur Azizah', NULL, NULL, NULL, NULL, 27, 'guru', NULL);
INSERT INTO `users` VALUES (27, '::1', 'is_757889', '$2y$08$latMTTUrul.0YwJ.zeBnxONH8QQTtYdCNsqmfEf/QwKqkTZba0qpe', NULL, 'is_757889@gmail.com', NULL, NULL, NULL, NULL, 1627878671, 1627878683, 1, 'Andiani Kristanti, S.Pd', NULL, NULL, NULL, NULL, 26, 'guru', NULL);
INSERT INTO `users` VALUES (28, '192.168.1.31', 'is_300779', '$2y$08$blURRIDzZ3MeP3EJDhPim.JwMwNrZ/D2//JjXE2lyZYUgQ9gbPsdS', NULL, 'is_300779@gmail.com', NULL, NULL, NULL, NULL, 1627878862, 1627878886, 1, 'Na\'ilah Fauziyah, S.Pd.', NULL, NULL, NULL, NULL, 30, 'guru', NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of users_groups
-- ----------------------------
INSERT INTO `users_groups` VALUES (1, 1, 1);
INSERT INTO `users_groups` VALUES (3, 3, 3);
INSERT INTO `users_groups` VALUES (4, 4, 5);
INSERT INTO `users_groups` VALUES (5, 5, 3);
INSERT INTO `users_groups` VALUES (6, 6, 3);
INSERT INTO `users_groups` VALUES (7, 7, 3);
INSERT INTO `users_groups` VALUES (8, 8, 3);
INSERT INTO `users_groups` VALUES (9, 9, 3);
INSERT INTO `users_groups` VALUES (10, 10, 3);
INSERT INTO `users_groups` VALUES (11, 11, 3);
INSERT INTO `users_groups` VALUES (12, 12, 3);
INSERT INTO `users_groups` VALUES (13, 13, 3);
INSERT INTO `users_groups` VALUES (14, 14, 3);
INSERT INTO `users_groups` VALUES (15, 15, 3);
INSERT INTO `users_groups` VALUES (16, 16, 3);
INSERT INTO `users_groups` VALUES (17, 17, 3);
INSERT INTO `users_groups` VALUES (18, 18, 3);
INSERT INTO `users_groups` VALUES (21, 21, 3);
INSERT INTO `users_groups` VALUES (22, 22, 3);
INSERT INTO `users_groups` VALUES (24, 24, 4);
INSERT INTO `users_groups` VALUES (25, 25, 8);
INSERT INTO `users_groups` VALUES (26, 26, 7);
INSERT INTO `users_groups` VALUES (27, 27, 3);
INSERT INTO `users_groups` VALUES (28, 28, 3);

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
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of wali_kelas
-- ----------------------------
INSERT INTO `wali_kelas` VALUES (15, 2, 3, 30);
INSERT INTO `wali_kelas` VALUES (16, 2, 3, 35);

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
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_catatan_siswa` AS SELECT
catatan_siswa.id_catatan_siswa,
catatan_siswa.idsiswa_fk,
catatan_siswa.idkelas_fk,
catatan_siswa.idguru_fk,
catatan_siswa.tanggal,
catatan_siswa.uraian,
catatan_siswa.teruskan_ke,
catatan_siswa.idtahunajaran_fk,
catatan_siswa.idmapel_fk,
siswa.id_siswa,
siswa.nis,
siswa.nama,
siswa.idjurusan_fk,
siswa.agama,
siswa.nisn,
siswa.no_ijazah_sekolah_asal,
siswa.no_skhun_sekolah_asal,
siswa.no_un_sekolah_asal,
siswa.no_kk,
siswa.npsn_sekolah_asal,
siswa.nama_sekolah_asal,
siswa.tempat_lahir,
siswa.tanggal_lahir,
siswa.berkebutuhan_khusus,
siswa.alamat,
siswa.dusun,
siswa.rt,
siswa.rw,
siswa.kelurahan,
siswa.foto,
siswa.idprovince_fk,
siswa.idcities_fk,
siswa.nama_ayah,
siswa.tempat_lahir_ayah,
siswa.tanggal_lahir_ayah,
siswa.pendidikan_ayah,
siswa.pekerjaan_ayah,
siswa.penghasilan_ayah,
siswa.nama_ibu,
siswa.tempat_lahir_ibu,
siswa.tanggal_lahir_ibu,
siswa.pendidikan_ibu,
siswa.pekerjaan_ibu,
siswa.penghasilan_ibu,
siswa.tinggi_badan,
siswa.berat_badan,
siswa.jarak_ke_sekolah,
siswa.waktu_ke_sekolah,
siswa.jumlah_saudara,
siswa.jenis_kelamin
FROM
catatan_siswa
INNER JOIN siswa ON catatan_siswa.idsiswa_fk = siswa.id_siswa ;

-- ----------------------------
-- View structure for v_catatan_siswa_harian
-- ----------------------------
DROP VIEW IF EXISTS `v_catatan_siswa_harian`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_catatan_siswa_harian` AS SELECT
catatan_siswa.id_catatan_siswa,
catatan_siswa.idsiswa_fk,
catatan_siswa.idkelas_fk,
catatan_siswa.idguru_fk,
catatan_siswa.tanggal,
catatan_siswa.uraian,
catatan_siswa.teruskan_ke,
catatan_siswa.idtahunajaran_fk,
catatan_siswa.idmapel_fk,
catatan_siswa.is_tindakan,
siswa.id_siswa,
siswa.nis,
siswa.nama,
siswa.agama,
siswa.nisn,
siswa.no_ijazah_sekolah_asal,
siswa.no_skhun_sekolah_asal,
siswa.no_un_sekolah_asal,
siswa.no_kk,
siswa.npsn_sekolah_asal,
siswa.nama_sekolah_asal,
siswa.tempat_lahir,
siswa.tanggal_lahir,
siswa.berkebutuhan_khusus,
siswa.alamat,
siswa.dusun,
siswa.rt,
siswa.rw,
siswa.kelurahan,
siswa.foto,
siswa.idprovince_fk,
siswa.idcities_fk,
siswa.nama_ayah,
siswa.tempat_lahir_ayah,
siswa.tanggal_lahir_ayah,
siswa.pendidikan_ayah,
siswa.pekerjaan_ayah,
siswa.penghasilan_ayah,
siswa.nama_ibu,
siswa.tempat_lahir_ibu,
siswa.tanggal_lahir_ibu,
siswa.pendidikan_ibu,
siswa.pekerjaan_ibu,
siswa.penghasilan_ibu,
siswa.tinggi_badan,
siswa.berat_badan,
siswa.jarak_ke_sekolah,
siswa.waktu_ke_sekolah,
siswa.jumlah_saudara,
siswa.jenis_kelamin,
kelas.id_kelas,
kelas.kelas,
kelas.idtingkat_fk,
kelas.create_at,
kelas.idjurusan_fk,
guru.id_guru,
guru.nama as nama_guru,
guru.nip,
guru.alamat as alamat_guru,
mata_pelajaran.idjenismatapelajaran_fk,
mata_pelajaran.id_mata_pelajaran,
mata_pelajaran.mata_pelajaran,
mata_pelajaran.kode
FROM
catatan_siswa
LEFT JOIN siswa ON catatan_siswa.idsiswa_fk = siswa.id_siswa
LEFT JOIN kelas ON catatan_siswa.idkelas_fk = kelas.kelas
LEFT JOIN guru ON catatan_siswa.idguru_fk = guru.id_guru
LEFT JOIN mata_pelajaran ON catatan_siswa.idmapel_fk = mata_pelajaran.id_mata_pelajaran ;

-- ----------------------------
-- View structure for v_guru_mapel
-- ----------------------------
DROP VIEW IF EXISTS `v_guru_mapel`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_guru_mapel` AS select `guru`.`id_guru` AS `id_guru`,`guru`.`nama` AS `nama`,`guru`.`nip` AS `nip`,`guru`.`alamat` AS `alamat`,`guru`.`agama` AS `agama`,`guru`.`foto` AS `foto`,`guru`.`pendidikan_terakhir` AS `pendidikan_terakhir`,`guru`.`instansi` AS `instansi`,`guru`.`fb` AS `fb`,`guru`.`ig` AS `ig`,`guru`.`twitter` AS `twitter`,`guru`.`youtube` AS `youtube`,`guru`.`jabatan` AS `jabatan`,`guru`.`email` AS `email`,`guru`.`no_hp` AS `no_hp`,`guru_mapel`.`id_guru_mapel` AS `id_guru_mapel`,`guru_mapel`.`idguru_fk` AS `idguru_fk`,`guru_mapel`.`idmapel_fk` AS `idmapel_fk`,`guru_mapel`.`idkelas_fk` AS `idkelas_fk`,`mata_pelajaran`.`id_mata_pelajaran` AS `id_mata_pelajaran`,`mata_pelajaran`.`mata_pelajaran` AS `mata_pelajaran`,`mata_pelajaran`.`kode` AS `kode`,`kelas`.`id_kelas` AS `id_kelas`,`kelas`.`kelas` AS `kelas`,`kelas`.`idtingkat_fk` AS `idtingkat_fk`,`kelas`.`create_at` AS `create_at`,`kelas`.`idjurusan_fk` AS `idjurusan_fk`,`kelas`.`idtahunajaran_fk` AS `idtahunajaran_fk`,`tahun_ajaran`.`id_tahun_ajaran` AS `id_tahun_ajaran`,`tahun_ajaran`.`tahun_ajaran` AS `tahun_ajaran`,`tahun_ajaran`.`is_active` AS `is_active`,`tahun_ajaran`.`semester` AS `semester`,`mata_pelajaran`.`idjenismatapelajaran_fk` AS `idjenismatapelajaran_fk` from ((((`guru` join `guru_mapel` on(`guru_mapel`.`idguru_fk` = `guru`.`id_guru`)) join `mata_pelajaran` on(`guru_mapel`.`idmapel_fk` = `mata_pelajaran`.`id_mata_pelajaran`)) join `kelas` on(`kelas`.`id_kelas` = `guru_mapel`.`idkelas_fk`)) join `tahun_ajaran` on(`tahun_ajaran`.`id_tahun_ajaran` = `guru_mapel`.`idtahunajaran_fk`)) ;

-- ----------------------------
-- View structure for v_jadwal_pelajaran
-- ----------------------------
DROP VIEW IF EXISTS `v_jadwal_pelajaran`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_jadwal_pelajaran` AS SELECT
jadwal_pelajaran.id_jadwal_pelajaran,
jadwal_pelajaran.idgurumapel_fk,
jadwal_pelajaran.idhari_fk,
jadwal_pelajaran.idjampelajaran_fk,
guru_mapel.id_guru_mapel,
guru_mapel.idguru_fk,
guru_mapel.idmapel_fk,
guru_mapel.idkelas_fk,
(select nama from guru where id_guru = idguru_fk) AS nama_guru,
(select nip from guru where id_guru = idguru_fk) AS nip,
(select kode from mata_pelajaran where idmapel_fk = id_mata_pelajaran) AS kode_pelajaran,
(select mata_pelajaran from mata_pelajaran where idmapel_fk = id_mata_pelajaran) AS mata_pelajaran,
hari.id_hari,
hari.hari,
hari.`code`,
jam_pelajaran.id_jam_pelajaran,
jam_pelajaran.nama,
jam_pelajaran.jam_mulai,
jam_pelajaran.jam_selesai,
kelas.id_kelas,
kelas.kelas,
kelas.idtingkat_fk,
kelas.create_at,
kelas.idjurusan_fk,
kelas.idtahunajaran_fk
FROM
jadwal_pelajaran
INNER JOIN guru_mapel ON jadwal_pelajaran.idgurumapel_fk = guru_mapel.id_guru_mapel
INNER JOIN hari ON hari.id_hari = jadwal_pelajaran.idhari_fk
INNER JOIN jam_pelajaran ON jam_pelajaran.id_jam_pelajaran = jadwal_pelajaran.idjampelajaran_fk
INNER JOIN kelas ON guru_mapel.idkelas_fk = kelas.id_kelas ;

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
-- View structure for v_pelanggaran_siswa
-- ----------------------------
DROP VIEW IF EXISTS `v_pelanggaran_siswa`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_pelanggaran_siswa` AS select `pelanggaran_siswa`.`id_pelanggaran_siswa` AS `id_pelanggaran_siswa`,`pelanggaran_siswa`.`tanggal` AS `tanggal`,`pelanggaran_siswa`.`uraian_pelanggaran` AS `uraian_pelanggaran`,`pelanggaran_siswa`.`idpoinpelanggaran_fk` AS `idpoinpelanggaran_fk`,`pelanggaran_siswa`.`idsiswa_fk` AS `idsiswa_fk`,`poin_pelanggaran`.`id_poin_pelanggaran` AS `id_poin_pelanggaran`,`poin_pelanggaran`.`idjenispelanggaran_fk` AS `idjenispelanggaran_fk`,`poin_pelanggaran`.`nama_pelanggaran` AS `nama_pelanggaran`,`poin_pelanggaran`.`poin` AS `poin`,`poin_pelanggaran`.`kode_pelanggaran` AS `kode_pelanggaran`,`jenis_pelanggaran`.`id_jenis_pelanggaran` AS `id_jenis_pelanggaran`,`jenis_pelanggaran`.`jenis_pelanggaran` AS `jenis_pelanggaran` from ((`pelanggaran_siswa` left join `poin_pelanggaran` on(`poin_pelanggaran`.`id_poin_pelanggaran` = `pelanggaran_siswa`.`idpoinpelanggaran_fk`)) left join `jenis_pelanggaran` on(`jenis_pelanggaran`.`id_jenis_pelanggaran` = `poin_pelanggaran`.`idjenispelanggaran_fk`)) ;

-- ----------------------------
-- View structure for v_pkg
-- ----------------------------
DROP VIEW IF EXISTS `v_pkg`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_pkg` AS select `component_penilaian_kinerja_guru`.`idpenilaiankinerjaguru_fk` AS `idpenilaiankinerjaguru_fk`,`penilaian_kinerja_guru`.`id_penilaian_kinerja_guru` AS `id_penilaian_kinerja_guru`,`penilaian_kinerja_guru`.`idguru_fk` AS `idguru_fk`,`penilaian_kinerja_guru`.`bulan` AS `bulan`,`penilaian_kinerja_guru`.`tahun` AS `tahun`,`penilaian_kinerja_guru`.`idtahunajaran_fk` AS `idtahunajaran_fk`,`penilaian_kinerja_guru`.`create_at` AS `create_at`,`penilaian_kinerja_guru`.`trans_code` AS `trans_code`,`component_penilaian_kinerja_guru`.`id_component_penilaian_kinerja_guru` AS `id_component_penilaian_kinerja_guru`,`component_penilaian_kinerja_guru`.`idsubkompetensipkg_fk` AS `idsubkompetensipkg_fk`,`component_penilaian_kinerja_guru`.`nilai` AS `nilai` from (`penilaian_kinerja_guru` join `component_penilaian_kinerja_guru` on(`penilaian_kinerja_guru`.`id_penilaian_kinerja_guru` = `component_penilaian_kinerja_guru`.`idpenilaiankinerjaguru_fk`)) ;

-- ----------------------------
-- View structure for v_poin_pelanggaran
-- ----------------------------
DROP VIEW IF EXISTS `v_poin_pelanggaran`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_poin_pelanggaran` AS select `poin_pelanggaran`.`id_poin_pelanggaran` AS `id_poin_pelanggaran`,`poin_pelanggaran`.`idjenispelanggaran_fk` AS `idjenispelanggaran_fk`,`poin_pelanggaran`.`nama_pelanggaran` AS `nama_pelanggaran`,`poin_pelanggaran`.`poin` AS `poin`,`poin_pelanggaran`.`kode_pelanggaran` AS `kode_pelanggaran`,`jenis_pelanggaran`.`id_jenis_pelanggaran` AS `id_jenis_pelanggaran`,`jenis_pelanggaran`.`jenis_pelanggaran` AS `jenis_pelanggaran` from (`poin_pelanggaran` join `jenis_pelanggaran` on(`jenis_pelanggaran`.`id_jenis_pelanggaran` = `poin_pelanggaran`.`idjenispelanggaran_fk`)) ;

-- ----------------------------
-- View structure for v_poin_pelanggaran_siswa
-- ----------------------------
DROP VIEW IF EXISTS `v_poin_pelanggaran_siswa`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_poin_pelanggaran_siswa` AS select id_siswa, nisn, nis, nama, (select sum(poin) from v_pelanggaran_siswa where idsiswa_fk = id_siswa) as poin from siswa where (select sum(poin) from v_pelanggaran_siswa where idsiswa_fk = id_siswa) > 0 ;

-- ----------------------------
-- View structure for v_siswa_jurusan
-- ----------------------------
DROP VIEW IF EXISTS `v_siswa_jurusan`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_siswa_jurusan` AS select `siswa`.`id_siswa` AS `id_siswa`,`siswa`.`nis` AS `nis`,`siswa`.`nama` AS `nama`,`siswa`.`idkelas_fk` AS `idkelas_fk`,`siswa`.`idjurusan_fk` AS `idjurusan_fk`,`siswa`.`agama` AS `agama`,`siswa`.`nisn` AS `nisn`,`siswa`.`no_ijazah_sekolah_asal` AS `no_ijazah_sekolah_asal`,`siswa`.`no_skhun_sekolah_asal` AS `no_skhun_sekolah_asal`,`siswa`.`no_un_sekolah_asal` AS `no_un_sekolah_asal`,`siswa`.`no_kk` AS `no_kk`,`siswa`.`npsn_sekolah_asal` AS `npsn_sekolah_asal`,`siswa`.`nama_sekolah_asal` AS `nama_sekolah_asal`,`siswa`.`tempat_lahir` AS `tempat_lahir`,`siswa`.`tanggal_lahir` AS `tanggal_lahir`,`siswa`.`berkebutuhan_khusus` AS `berkebutuhan_khusus`,`siswa`.`alamat` AS `alamat`,`siswa`.`dusun` AS `dusun`,`siswa`.`rt` AS `rt`,`siswa`.`rw` AS `rw`,`siswa`.`kelurahan` AS `kelurahan`,`siswa`.`foto` AS `foto`,`siswa`.`idprovince_fk` AS `idprovince_fk`,`siswa`.`idcities_fk` AS `idcities_fk`,`siswa`.`nama_ayah` AS `nama_ayah`,`siswa`.`tempat_lahir_ayah` AS `tempat_lahir_ayah`,`siswa`.`tanggal_lahir_ayah` AS `tanggal_lahir_ayah`,`siswa`.`pendidikan_ayah` AS `pendidikan_ayah`,`siswa`.`pekerjaan_ayah` AS `pekerjaan_ayah`,`siswa`.`penghasilan_ayah` AS `penghasilan_ayah`,`siswa`.`nama_ibu` AS `nama_ibu`,`siswa`.`tempat_lahir_ibu` AS `tempat_lahir_ibu`,`siswa`.`tanggal_lahir_ibu` AS `tanggal_lahir_ibu`,`siswa`.`pendidikan_ibu` AS `pendidikan_ibu`,`siswa`.`pekerjaan_ibu` AS `pekerjaan_ibu`,`siswa`.`penghasilan_ibu` AS `penghasilan_ibu`,`siswa`.`tinggi_badan` AS `tinggi_badan`,`siswa`.`berat_badan` AS `berat_badan`,`siswa`.`jarak_ke_sekolah` AS `jarak_ke_sekolah`,`siswa`.`waktu_ke_sekolah` AS `waktu_ke_sekolah`,`siswa`.`jumlah_saudara` AS `jumlah_saudara`,`siswa`.`jenis_kelamin` AS `jenis_kelamin`,`kelas`.`id_kelas` AS `id_kelas`,`kelas`.`kelas` AS `kelas`,`kelas`.`idtingkat_fk` AS `idtingkat_fk`,`kelas`.`create_at` AS `create_at`,`kelas`.`idtahunajaran_fk` AS `idtahunajaran_fk`,`jurusan`.`id_jurusan` AS `id_jurusan`,`jurusan`.`jurusan` AS `jurusan`,`jurusan`.`singkatan` AS `singkatan` from ((`siswa` join `kelas` on(`kelas`.`id_kelas` = `siswa`.`idkelas_fk`)) join `jurusan` on(`jurusan`.`id_jurusan` = `siswa`.`idjurusan_fk`)) ;

-- ----------------------------
-- View structure for v_walas
-- ----------------------------
DROP VIEW IF EXISTS `v_walas`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_walas` AS select `wali_kelas`.`id_wali_kelas` AS `id_wali_kelas`,`wali_kelas`.`idguru_fk` AS `idguru_fk`,`wali_kelas`.`idtahunajaran_fk` AS `idtahunajaran_fk`,`wali_kelas`.`idkelas_fk` AS `idkelas_fk`,`kelas`.`id_kelas` AS `id_kelas`,`kelas`.`kelas` AS `kelas`,`kelas`.`idtingkat_fk` AS `idtingkat_fk`,`kelas`.`idjurusan_fk` AS `idjurusan_fk`,`tingkat`.`id_tingkat` AS `id_tingkat`,`tingkat`.`tingkat` AS `tingkat`,`jurusan`.`id_jurusan` AS `id_jurusan`,`jurusan`.`jurusan` AS `jurusan`,`jurusan`.`singkatan` AS `singkatan` from (((`wali_kelas` left join `kelas` on(`wali_kelas`.`idkelas_fk` = `kelas`.`id_kelas`)) left join `tingkat` on(`kelas`.`idtingkat_fk` = `tingkat`.`id_tingkat`)) left join `jurusan` on(`kelas`.`idjurusan_fk` = `jurusan`.`id_jurusan`)) ;

SET FOREIGN_KEY_CHECKS = 1;
