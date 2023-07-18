/*
 Navicat Premium Data Transfer

 Source Server         : DB
 Source Server Type    : MySQL
 Source Server Version : 100425
 Source Host           : localhost:3306
 Source Schema         : edulite

 Target Server Type    : MySQL
 Target Server Version : 100425
 File Encoding         : 65001

 Date: 18/07/2023 14:37:46
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
  `create_at` timestamp(0) NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_absensi`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for additional_setting
-- ----------------------------
DROP TABLE IF EXISTS `additional_setting`;
CREATE TABLE `additional_setting`  (
  `id_additional_setting` int(11) NOT NULL AUTO_INCREMENT,
  `key_add` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `value_add` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`id_additional_setting`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
  `create_at` timestamp(0) NULL DEFAULT current_timestamp(),
  `is_edit` int(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id_akun`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
  `create_at` timestamp(0) NULL DEFAULT current_timestamp(),
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
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
  `create_at` timestamp(0) NULL DEFAULT current_timestamp(),
  `jabatan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `saran` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`id_buku_tamu`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of catatan_siswa
-- ----------------------------
INSERT INTO `catatan_siswa` VALUES (2, 877, 56, 31, '2023-05-17', '', '', 7, 14, NULL);
INSERT INTO `catatan_siswa` VALUES (3, 770, 50, 46, '2023-05-17', '', '', 7, 10, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
-- Table structure for detail_kontrol_sarana
-- ----------------------------
DROP TABLE IF EXISTS `detail_kontrol_sarana`;
CREATE TABLE `detail_kontrol_sarana`  (
  `id_detail_kontrol_sarana` int(11) NOT NULL AUTO_INCREMENT,
  `idkontrolsarana_fk` int(11) NULL DEFAULT NULL,
  `idsarana_fk` int(255) NULL DEFAULT NULL,
  `jumlah_awal` int(255) NULL DEFAULT NULL,
  `jumlah_akhir` int(255) NULL DEFAULT NULL,
  `idkondisisarana_fk` int(11) NULL DEFAULT NULL,
  `keterangan` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_detail_kontrol_sarana`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 72 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of detail_kontrol_sarana
-- ----------------------------
INSERT INTO `detail_kontrol_sarana` VALUES (5, 3, 11, 1, 1, 1, NULL);
INSERT INTO `detail_kontrol_sarana` VALUES (6, 3, 12, 1, 0, 3, 'Hilang di jam ke 3');
INSERT INTO `detail_kontrol_sarana` VALUES (7, 3, 13, 1, 1, 1, NULL);
INSERT INTO `detail_kontrol_sarana` VALUES (8, 3, 14, 1, 1, 1, NULL);
INSERT INTO `detail_kontrol_sarana` VALUES (9, 3, 15, 1, 1, 1, NULL);
INSERT INTO `detail_kontrol_sarana` VALUES (10, 3, 16, 1, 1, 1, NULL);
INSERT INTO `detail_kontrol_sarana` VALUES (11, 3, 17, 1, 1, 1, NULL);
INSERT INTO `detail_kontrol_sarana` VALUES (12, 3, 18, 1, 1, 1, NULL);
INSERT INTO `detail_kontrol_sarana` VALUES (13, 3, 19, 1, 1, 1, NULL);
INSERT INTO `detail_kontrol_sarana` VALUES (14, 3, 20, 1, 1, 1, NULL);
INSERT INTO `detail_kontrol_sarana` VALUES (15, 3, 21, 1, 1, 1, NULL);
INSERT INTO `detail_kontrol_sarana` VALUES (16, 3, 22, 1, 1, 1, NULL);
INSERT INTO `detail_kontrol_sarana` VALUES (17, 3, 23, 1, 1, 1, NULL);
INSERT INTO `detail_kontrol_sarana` VALUES (18, 3, 26, 1, 1, 1, NULL);
INSERT INTO `detail_kontrol_sarana` VALUES (19, 3, 27, 1, 1, 1, NULL);
INSERT INTO `detail_kontrol_sarana` VALUES (20, 3, 28, 1, 1, 1, NULL);
INSERT INTO `detail_kontrol_sarana` VALUES (21, 3, 29, 1, 1, 1, NULL);
INSERT INTO `detail_kontrol_sarana` VALUES (22, 3, 30, 1, 1, 1, NULL);
INSERT INTO `detail_kontrol_sarana` VALUES (23, 3, 31, 1, 1, 1, NULL);
INSERT INTO `detail_kontrol_sarana` VALUES (24, 3, 32, 1, 1, 3, NULL);
INSERT INTO `detail_kontrol_sarana` VALUES (25, 3, 33, 1, 1, 1, NULL);
INSERT INTO `detail_kontrol_sarana` VALUES (26, 3, 34, 1, 1, 3, NULL);
INSERT INTO `detail_kontrol_sarana` VALUES (27, 3, 35, 1, 1, 1, NULL);
INSERT INTO `detail_kontrol_sarana` VALUES (28, 3, 36, 1, 1, 1, NULL);
INSERT INTO `detail_kontrol_sarana` VALUES (29, 3, 37, 1, 1, 1, NULL);
INSERT INTO `detail_kontrol_sarana` VALUES (30, 3, 38, 1, 1, 1, NULL);
INSERT INTO `detail_kontrol_sarana` VALUES (31, 3, 39, 1, 1, 1, NULL);
INSERT INTO `detail_kontrol_sarana` VALUES (32, 3, 40, 1, 1, 1, NULL);
INSERT INTO `detail_kontrol_sarana` VALUES (33, 3, 41, 1, 1, 1, NULL);
INSERT INTO `detail_kontrol_sarana` VALUES (34, 3, 42, 1, 1, 1, NULL);
INSERT INTO `detail_kontrol_sarana` VALUES (35, 3, 43, 1, 1, 1, NULL);
INSERT INTO `detail_kontrol_sarana` VALUES (36, 3, 44, 1, 1, 1, NULL);
INSERT INTO `detail_kontrol_sarana` VALUES (37, 3, 45, 1, 1, 1, NULL);
INSERT INTO `detail_kontrol_sarana` VALUES (38, 3, 46, 1, 1, 1, NULL);
INSERT INTO `detail_kontrol_sarana` VALUES (39, 3, 47, 1, 1, 1, NULL);
INSERT INTO `detail_kontrol_sarana` VALUES (40, 3, 48, 1, 1, 1, NULL);
INSERT INTO `detail_kontrol_sarana` VALUES (41, 3, 49, 1, 1, 1, NULL);
INSERT INTO `detail_kontrol_sarana` VALUES (42, 3, 50, 1, 1, 1, NULL);
INSERT INTO `detail_kontrol_sarana` VALUES (43, 3, 51, 1, 1, 1, NULL);
INSERT INTO `detail_kontrol_sarana` VALUES (44, 3, 52, 1, 1, 1, NULL);
INSERT INTO `detail_kontrol_sarana` VALUES (45, 3, 53, 1, 1, 1, NULL);
INSERT INTO `detail_kontrol_sarana` VALUES (46, 3, 54, 1, 1, 1, NULL);
INSERT INTO `detail_kontrol_sarana` VALUES (47, 3, 55, 1, 1, 1, NULL);
INSERT INTO `detail_kontrol_sarana` VALUES (48, 3, 56, 1, 1, 1, NULL);
INSERT INTO `detail_kontrol_sarana` VALUES (49, 3, 57, 1, 1, 1, NULL);
INSERT INTO `detail_kontrol_sarana` VALUES (50, 3, 58, 1, 1, 1, NULL);
INSERT INTO `detail_kontrol_sarana` VALUES (51, 3, 59, 1, 1, 1, NULL);
INSERT INTO `detail_kontrol_sarana` VALUES (52, 3, 60, 1, 1, 1, NULL);
INSERT INTO `detail_kontrol_sarana` VALUES (53, 3, 61, 1, 1, 1, NULL);
INSERT INTO `detail_kontrol_sarana` VALUES (54, 3, 62, 1, 1, 1, NULL);
INSERT INTO `detail_kontrol_sarana` VALUES (55, 3, 63, 1, 1, 1, NULL);
INSERT INTO `detail_kontrol_sarana` VALUES (56, 3, 64, 1, 1, 1, NULL);
INSERT INTO `detail_kontrol_sarana` VALUES (57, 3, 65, 1, 1, 1, NULL);
INSERT INTO `detail_kontrol_sarana` VALUES (58, 3, 66, 1, 1, 1, NULL);
INSERT INTO `detail_kontrol_sarana` VALUES (59, 3, 67, 1, 1, 1, NULL);
INSERT INTO `detail_kontrol_sarana` VALUES (60, 3, 68, 1, 1, 1, NULL);
INSERT INTO `detail_kontrol_sarana` VALUES (61, 3, 69, 1, 1, 1, NULL);
INSERT INTO `detail_kontrol_sarana` VALUES (62, 3, 70, 1, 1, 1, NULL);
INSERT INTO `detail_kontrol_sarana` VALUES (63, 3, 71, 1, 1, 1, NULL);
INSERT INTO `detail_kontrol_sarana` VALUES (64, 3, 72, 1, 1, 1, NULL);
INSERT INTO `detail_kontrol_sarana` VALUES (65, 3, 73, 1, 1, 1, NULL);
INSERT INTO `detail_kontrol_sarana` VALUES (66, 3, 74, 1, 1, 1, NULL);
INSERT INTO `detail_kontrol_sarana` VALUES (67, 3, 75, 1, 1, 1, NULL);
INSERT INTO `detail_kontrol_sarana` VALUES (68, 3, 76, 1, 1, 1, NULL);
INSERT INTO `detail_kontrol_sarana` VALUES (69, 3, 77, 1, 1, 1, NULL);
INSERT INTO `detail_kontrol_sarana` VALUES (70, 3, 78, 1, 1, 1, NULL);
INSERT INTO `detail_kontrol_sarana` VALUES (71, 3, 79, 1, 1, 1, NULL);

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
-- Table structure for detail_peminjaman_sarana
-- ----------------------------
DROP TABLE IF EXISTS `detail_peminjaman_sarana`;
CREATE TABLE `detail_peminjaman_sarana`  (
  `id_detail_peminjaman_sarana` int(11) NOT NULL AUTO_INCREMENT,
  `idsarana_fk` int(11) NULL DEFAULT NULL,
  `jumlah` int(255) NULL DEFAULT NULL,
  `keterangan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `idpeminjamansarana_fk` int(11) NULL DEFAULT NULL,
  `idkondisisarana_fk` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_detail_peminjaman_sarana`) USING BTREE,
  INDEX `idpeminjamansarana_fk`(`idpeminjamansarana_fk`) USING BTREE,
  CONSTRAINT `detail_peminjaman_sarana_ibfk_1` FOREIGN KEY (`idpeminjamansarana_fk`) REFERENCES `peminjaman_sarana` (`id_peminjaman_sarana`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of detail_peminjaman_sarana
-- ----------------------------
INSERT INTO `detail_peminjaman_sarana` VALUES (34, 80, 1, 'tas, laptop, cas', 7, 1);

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
-- Table structure for detail_pengembalian_sarana
-- ----------------------------
DROP TABLE IF EXISTS `detail_pengembalian_sarana`;
CREATE TABLE `detail_pengembalian_sarana`  (
  `id_detail_pengembalian_sarana` int(11) NOT NULL AUTO_INCREMENT,
  `idpengembaliansarana_fk` int(11) NULL DEFAULT NULL,
  `idsarana_fk` int(11) NULL DEFAULT NULL,
  `idkondisisarana_fk` int(11) NULL DEFAULT NULL,
  `jumlah` int(11) NULL DEFAULT NULL,
  `keterangan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`id_detail_pengembalian_sarana`) USING BTREE,
  INDEX `idpengembaliansarana_fk`(`idpengembaliansarana_fk`) USING BTREE,
  CONSTRAINT `detail_pengembalian_sarana_ibfk_1` FOREIGN KEY (`idpengembaliansarana_fk`) REFERENCES `pengembalian_sarana` (`id_pengembalian_sarana`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for detail_transaksi_tanggungan_alumni
-- ----------------------------
DROP TABLE IF EXISTS `detail_transaksi_tanggungan_alumni`;
CREATE TABLE `detail_transaksi_tanggungan_alumni`  (
  `id_detail_transaksi_tanggungan_alumni` int(1) NOT NULL AUTO_INCREMENT,
  `idtanggunganalumni_fk` int(11) NULL DEFAULT NULL,
  `jumlah` decimal(10, 0) NULL DEFAULT NULL,
  `create_at` timestamp(0) NULL DEFAULT current_timestamp(),
  `idtransaksitanggunganalumni_fk` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_detail_transaksi_tanggungan_alumni`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for detail_transaksi_tanggungan_siswa
-- ----------------------------
DROP TABLE IF EXISTS `detail_transaksi_tanggungan_siswa`;
CREATE TABLE `detail_transaksi_tanggungan_siswa`  (
  `id_detail_transaksi_tanggungan_siswa` int(1) NOT NULL AUTO_INCREMENT,
  `idjenispenerimaan_fk` int(11) NULL DEFAULT NULL,
  `jumlah` decimal(10, 0) NULL DEFAULT NULL,
  `create_at` timestamp(0) NULL DEFAULT current_timestamp(),
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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 54 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of guru
-- ----------------------------
INSERT INTO `guru` VALUES (28, 'Abdur Rochim, M.Pd', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', 'Laki-laki', '', 'Islam', 'WNI', 'Kawin', 'Rumah Pribadi', 0, 0, 0, 'A', '', '', '', '0000-00-00', '', '', '', 'PGW5996712', '', 'PNS', '', '0000-00-00');
INSERT INTO `guru` VALUES (29, 'Pohet Bintoto, S.Pd., M.Si', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', 'Laki-laki', '', 'Islam', 'WNI', 'Kawin', 'Rumah Pribadi', 0, 0, 0, 'A', '', '', '', '0000-00-00', '', '', '', 'PGW8192257', '', 'PNS', '', '0000-00-00');
INSERT INTO `guru` VALUES (30, 'Zein Iqbal Zarkasi, S.Pd', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', 'Laki-laki', '', 'Islam', 'WNI', 'Kawin', 'Rumah Pribadi', 0, 0, 0, 'A', '', '', '', '0000-00-00', '', '', '', 'PGW894712', '', 'PNS', '', '0000-00-00');
INSERT INTO `guru` VALUES (31, 'Avi Hendratmoko, S.Kom', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', 'Laki-laki', '', 'Islam', 'WNI', 'Kawin', 'Rumah Pribadi', 0, 0, 0, 'A', '', '', '', '0000-00-00', '', '', '', 'PGW9354518', '', 'PNS', '', '0000-00-00');
INSERT INTO `guru` VALUES (32, 'M. Maimun Muzakka, S.Kom', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', 'Laki-laki', '', 'Islam', 'WNI', 'Kawin', 'Rumah Pribadi', 0, 0, 0, 'A', '', '', '', '0000-00-00', '', '', '', 'PGW3016541', '', 'PNS', '', '0000-00-00');
INSERT INTO `guru` VALUES (33, 'Fatat Alvin D. N. S', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', 'Perempuan', '', 'Islam', 'WNI', 'Kawin', 'Rumah Pribadi', 0, 0, 0, 'A', '', '', '', '0000-00-00', '', '', '', 'PGW6882702', '', 'PNS', '', '0000-00-00');
INSERT INTO `guru` VALUES (34, 'Revita Fardiani', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', 'Perempuan', '', 'Islam', 'WNI', 'Kawin', 'Rumah Pribadi', 0, 0, 0, 'A', '', '', '', '0000-00-00', '', '', '', 'PGW5401085', '', 'PNS', '', '0000-00-00');
INSERT INTO `guru` VALUES (35, 'Ulfatul Rosyidah Al Fikriyah, S.P', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', 'Perempuan', '', 'Islam', 'WNI', 'Kawin', 'Rumah Pribadi', 0, 0, 0, 'A', '', '', '', '0000-00-00', '', '', '', 'PGW8689864', '', 'PNS', '', '0000-00-00');
INSERT INTO `guru` VALUES (36, 'Nur Azizah', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', 'Perempuan', '', 'Islam', 'WNI', 'Kawin', 'Rumah Pribadi', 0, 0, 0, 'A', '', '', '', '0000-00-00', '', '', '', 'PGW5280470', '', 'PNS', '', '0000-00-00');
INSERT INTO `guru` VALUES (37, 'A. Faldiansyah Havis', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', 'Laki-laki', '', 'Islam', 'WNI', 'Kawin', 'Rumah Pribadi', 0, 0, 0, 'A', '', '', '', '0000-00-00', '', '', '', 'PGW5429429', '', 'PNS', '', '0000-00-00');
INSERT INTO `guru` VALUES (38, 'Ega Kurniawan', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', 'Laki-laki', '', 'Islam', 'WNI', 'Kawin', 'Rumah Pribadi', 0, 0, 0, 'A', '', '', '', '0000-00-00', '', '', '', 'PGW2366776', '', 'PNS', '', '0000-00-00');
INSERT INTO `guru` VALUES (39, 'Nadya Anastasya Paramita, S.Or', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', 'Perempuan', '', 'Islam', 'WNI', 'Kawin', 'Rumah Pribadi', 0, 0, 0, 'A', '', '', '', '0000-00-00', '', '', '', 'PGW5442651', '', 'PNS', '', '0000-00-00');
INSERT INTO `guru` VALUES (40, 'Rendy Yani Susanto, S.Pd', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', 'Laki-laki', '', 'Islam', 'WNI', 'Kawin', 'Rumah Pribadi', 0, 0, 0, 'A', '', '', '', '0000-00-00', '', '', '', 'PGW9708256', '', 'PNS', '', '0000-00-00');
INSERT INTO `guru` VALUES (41, 'Nailatur Risqiyah, S.P', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', 'Perempuan', '', 'Islam', 'WNI', 'Kawin', 'Rumah Pribadi', 0, 0, 0, 'A', '', '', '', '0000-00-00', '', '', '', 'PGW5697', '', 'PNS', '', '0000-00-00');
INSERT INTO `guru` VALUES (42, 'Sutan Taufiq, S.Hum', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', 'Laki-laki', '', 'Islam', 'WNI', 'Kawin', 'Rumah Pribadi', 0, 0, 0, 'A', '', '', '', '0000-00-00', '', '', '', 'PGW8497439', '', 'PNS', '', '0000-00-00');
INSERT INTO `guru` VALUES (43, 'Roikhatul Uzza, S.Psi', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', 'Perempuan', '', 'Islam', 'WNI', 'Kawin', 'Rumah Pribadi', 0, 0, 0, 'A', '', '', '', '0000-00-00', '', '', '', 'PGW1478040', '', 'PNS', '', '0000-00-00');
INSERT INTO `guru` VALUES (44, 'Andiani Kristanti, S.Pd', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', 'Perempuan', '', 'Islam', 'WNI', 'Kawin', 'Rumah Pribadi', 0, 0, 0, 'A', '', '', '', '0000-00-00', '', '', '', 'PGW1692037', '', 'PNS', '', '0000-00-00');
INSERT INTO `guru` VALUES (45, 'Mohammad Nazibullah, M.Pd', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', 'Laki-laki', '', 'Islam', 'WNI', 'Kawin', 'Rumah Pribadi', 0, 0, 0, 'A', '', '', '', '0000-00-00', '', '', '', 'PGW9317115', '', 'PNS', '', '0000-00-00');
INSERT INTO `guru` VALUES (46, 'Cindy Permata Putri, S.Pd', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', 'Perempuan', '', 'Islam', 'WNI', 'Kawin', 'Rumah Pribadi', 0, 0, 0, 'A', '', '', '', '0000-00-00', '', '', '', 'PGW3566202', '', 'PNS', '', '0000-00-00');
INSERT INTO `guru` VALUES (47, 'Syamsul Arifin, S. Pd', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', 'Laki-laki', '', 'Islam', 'WNI', 'Kawin', 'Rumah Pribadi', 0, 0, 0, 'A', '', '', '', '0000-00-00', '', '', '', 'PGW1367305', '', 'PNS', '', '0000-00-00');
INSERT INTO `guru` VALUES (48, 'Saifudin Mansur, S.TP', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', 'Laki-laki', '', 'Islam', 'WNI', 'Kawin', 'Rumah Pribadi', 0, 0, 0, 'A', '', '', '', '0000-00-00', '', '', '', 'PGW6187354', '', 'PNS', '', '0000-00-00');
INSERT INTO `guru` VALUES (49, 'Faridatuz Zakiyah, S.TP', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', 'Perempuan', '', 'Islam', 'WNI', 'Kawin', 'Rumah Pribadi', 0, 0, 0, 'A', '', '', '', '0000-00-00', '', '', '', 'PGW996246', '', 'PNS', '', '0000-00-00');
INSERT INTO `guru` VALUES (50, 'Na\'ilah Fauziyah, S.Pd.,M.Pd', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', 'Perempuan', '', 'Islam', 'WNI', 'Kawin', 'Rumah Pribadi', 0, 0, 0, 'A', '', '', '', '0000-00-00', '', '', '', 'PGW4860105', '', 'PNS', '', '0000-00-00');
INSERT INTO `guru` VALUES (51, 'Ika Uswatun Hasanah, S.Pd', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', 'Perempuan', '', 'Islam', 'WNI', 'Kawin', 'Rumah Pribadi', 0, 0, 0, 'A', '', '', '', '0000-00-00', '', '', '', 'PGW9258587', '', 'PNS', '', '0000-00-00');
INSERT INTO `guru` VALUES (52, 'Ramadhani Samboga, S.Pd', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', 'Laki-laki', '', 'Islam', 'WNI', 'Kawin', 'Rumah Pribadi', 0, 0, 0, 'A', '', '', '', '0000-00-00', '', '', '', 'PGW771656', '', 'PNS', '', '0000-00-00');
INSERT INTO `guru` VALUES (53, 'Farah Rosyidah Diana, S.T', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', 'Perempuan', '', 'Islam', 'WNI', 'Kawin', 'Rumah Pribadi', 0, 0, 0, 'A', '', '', '', '0000-00-00', '', '', '', 'PGW3399508', '', 'PNS', '', '0000-00-00');

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
) ENGINE = InnoDB AUTO_INCREMENT = 122 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of guru_mapel
-- ----------------------------
INSERT INTO `guru_mapel` VALUES (9, 30, 8, 7, 49, NULL);
INSERT INTO `guru_mapel` VALUES (10, 30, 8, 7, 51, NULL);
INSERT INTO `guru_mapel` VALUES (11, 30, 10, 7, 64, NULL);
INSERT INTO `guru_mapel` VALUES (12, 30, 10, 7, 52, NULL);
INSERT INTO `guru_mapel` VALUES (13, 30, 10, 7, 53, NULL);
INSERT INTO `guru_mapel` VALUES (14, 30, 8, 7, 64, NULL);
INSERT INTO `guru_mapel` VALUES (15, 30, 8, 7, 52, NULL);
INSERT INTO `guru_mapel` VALUES (16, 30, 8, 7, 53, NULL);
INSERT INTO `guru_mapel` VALUES (17, 30, 9, 7, 64, NULL);
INSERT INTO `guru_mapel` VALUES (18, 30, 9, 7, 57, NULL);
INSERT INTO `guru_mapel` VALUES (19, 30, 9, 7, 58, NULL);
INSERT INTO `guru_mapel` VALUES (20, 50, 27, 7, 49, NULL);
INSERT INTO `guru_mapel` VALUES (21, 45, 17, 7, 49, NULL);
INSERT INTO `guru_mapel` VALUES (22, 43, 22, 7, 49, NULL);
INSERT INTO `guru_mapel` VALUES (23, 46, 10, 7, 49, NULL);
INSERT INTO `guru_mapel` VALUES (24, 44, 24, 7, 49, NULL);
INSERT INTO `guru_mapel` VALUES (25, 52, 12, 7, 49, NULL);
INSERT INTO `guru_mapel` VALUES (26, 42, 21, 7, 49, NULL);
INSERT INTO `guru_mapel` VALUES (27, 31, 12, 7, 49, NULL);
INSERT INTO `guru_mapel` VALUES (28, 43, 23, 7, 49, NULL);
INSERT INTO `guru_mapel` VALUES (29, 53, 7, 7, 49, NULL);
INSERT INTO `guru_mapel` VALUES (30, 30, 8, 7, 50, NULL);
INSERT INTO `guru_mapel` VALUES (31, 45, 17, 7, 50, NULL);
INSERT INTO `guru_mapel` VALUES (32, 53, 7, 7, 50, NULL);
INSERT INTO `guru_mapel` VALUES (33, 50, 19, 7, 64, NULL);
INSERT INTO `guru_mapel` VALUES (34, 43, 22, 7, 64, NULL);
INSERT INTO `guru_mapel` VALUES (35, 44, 24, 7, 64, NULL);
INSERT INTO `guru_mapel` VALUES (36, 43, 23, 7, 64, NULL);
INSERT INTO `guru_mapel` VALUES (37, 52, 12, 7, 50, NULL);
INSERT INTO `guru_mapel` VALUES (38, 39, 17, 7, 64, NULL);
INSERT INTO `guru_mapel` VALUES (39, 46, 10, 7, 50, NULL);
INSERT INTO `guru_mapel` VALUES (40, 42, 21, 7, 64, NULL);
INSERT INTO `guru_mapel` VALUES (41, 53, 7, 7, 64, NULL);
INSERT INTO `guru_mapel` VALUES (42, 32, 12, 7, 64, NULL);
INSERT INTO `guru_mapel` VALUES (43, 50, 27, 7, 50, NULL);
INSERT INTO `guru_mapel` VALUES (44, 51, 24, 7, 50, NULL);
INSERT INTO `guru_mapel` VALUES (45, 43, 22, 7, 50, NULL);
INSERT INTO `guru_mapel` VALUES (46, 42, 21, 7, 50, NULL);
INSERT INTO `guru_mapel` VALUES (47, 43, 23, 7, 50, NULL);
INSERT INTO `guru_mapel` VALUES (48, 50, 27, 7, 52, NULL);
INSERT INTO `guru_mapel` VALUES (49, 43, 22, 7, 52, NULL);
INSERT INTO `guru_mapel` VALUES (50, 44, 24, 7, 52, NULL);
INSERT INTO `guru_mapel` VALUES (51, 32, 12, 7, 50, NULL);
INSERT INTO `guru_mapel` VALUES (52, 43, 23, 7, 52, NULL);
INSERT INTO `guru_mapel` VALUES (53, 39, 17, 7, 52, NULL);
INSERT INTO `guru_mapel` VALUES (54, 42, 21, 7, 51, NULL);
INSERT INTO `guru_mapel` VALUES (55, 42, 21, 7, 52, NULL);
INSERT INTO `guru_mapel` VALUES (56, 53, 7, 7, 52, NULL);
INSERT INTO `guru_mapel` VALUES (57, 50, 27, 7, 51, NULL);
INSERT INTO `guru_mapel` VALUES (59, 46, 10, 7, 51, NULL);
INSERT INTO `guru_mapel` VALUES (60, 50, 27, 7, 53, NULL);
INSERT INTO `guru_mapel` VALUES (61, 43, 22, 7, 53, NULL);
INSERT INTO `guru_mapel` VALUES (62, 45, 17, 7, 51, NULL);
INSERT INTO `guru_mapel` VALUES (63, 44, 24, 7, 53, NULL);
INSERT INTO `guru_mapel` VALUES (64, 43, 23, 7, 53, NULL);
INSERT INTO `guru_mapel` VALUES (65, 52, 15, 7, 51, NULL);
INSERT INTO `guru_mapel` VALUES (66, 39, 17, 7, 53, NULL);
INSERT INTO `guru_mapel` VALUES (67, 42, 21, 7, 53, NULL);
INSERT INTO `guru_mapel` VALUES (68, 47, 24, 7, 51, NULL);
INSERT INTO `guru_mapel` VALUES (69, 53, 7, 7, 53, NULL);
INSERT INTO `guru_mapel` VALUES (70, 43, 23, 7, 51, NULL);
INSERT INTO `guru_mapel` VALUES (71, 43, 22, 7, 51, NULL);
INSERT INTO `guru_mapel` VALUES (72, 41, 20, 7, 53, NULL);
INSERT INTO `guru_mapel` VALUES (73, 35, 15, 7, 52, NULL);
INSERT INTO `guru_mapel` VALUES (74, 53, 7, 7, 51, NULL);
INSERT INTO `guru_mapel` VALUES (75, 51, 24, 7, 54, NULL);
INSERT INTO `guru_mapel` VALUES (76, 50, 9, 7, 54, NULL);
INSERT INTO `guru_mapel` VALUES (77, 46, 10, 7, 54, NULL);
INSERT INTO `guru_mapel` VALUES (78, 32, 11, 7, 54, NULL);
INSERT INTO `guru_mapel` VALUES (79, 45, 17, 7, 54, NULL);
INSERT INTO `guru_mapel` VALUES (80, 42, 21, 7, 54, NULL);
INSERT INTO `guru_mapel` VALUES (81, 32, 13, 7, 54, NULL);
INSERT INTO `guru_mapel` VALUES (82, 31, 11, 7, 54, NULL);
INSERT INTO `guru_mapel` VALUES (83, 53, 7, 7, 54, NULL);
INSERT INTO `guru_mapel` VALUES (84, 52, 11, 7, 55, NULL);
INSERT INTO `guru_mapel` VALUES (85, 51, 24, 7, 55, NULL);
INSERT INTO `guru_mapel` VALUES (86, 52, 11, 7, 54, NULL);
INSERT INTO `guru_mapel` VALUES (87, 30, 9, 7, 55, NULL);
INSERT INTO `guru_mapel` VALUES (88, 46, 10, 7, 56, NULL);
INSERT INTO `guru_mapel` VALUES (89, 32, 11, 7, 55, NULL);
INSERT INTO `guru_mapel` VALUES (90, 51, 24, 7, 56, NULL);
INSERT INTO `guru_mapel` VALUES (91, 53, 7, 7, 55, NULL);
INSERT INTO `guru_mapel` VALUES (92, 43, 22, 7, 56, NULL);
INSERT INTO `guru_mapel` VALUES (93, 42, 21, 7, 55, NULL);
INSERT INTO `guru_mapel` VALUES (94, 43, 22, 7, 55, NULL);
INSERT INTO `guru_mapel` VALUES (95, 42, 21, 7, 56, NULL);
INSERT INTO `guru_mapel` VALUES (96, 46, 10, 7, 55, NULL);
INSERT INTO `guru_mapel` VALUES (97, 53, 7, 7, 56, NULL);
INSERT INTO `guru_mapel` VALUES (98, 39, 17, 7, 55, NULL);
INSERT INTO `guru_mapel` VALUES (99, 31, 14, 7, 56, NULL);
INSERT INTO `guru_mapel` VALUES (100, 50, 9, 7, 56, NULL);
INSERT INTO `guru_mapel` VALUES (101, 52, 14, 7, 56, NULL);
INSERT INTO `guru_mapel` VALUES (102, 45, 17, 7, 56, NULL);
INSERT INTO `guru_mapel` VALUES (103, 32, 13, 7, 56, NULL);
INSERT INTO `guru_mapel` VALUES (104, 52, 14, 7, 57, NULL);
INSERT INTO `guru_mapel` VALUES (105, 51, 24, 7, 57, NULL);
INSERT INTO `guru_mapel` VALUES (106, 35, 14, 7, 57, NULL);
INSERT INTO `guru_mapel` VALUES (107, 53, 7, 7, 57, NULL);
INSERT INTO `guru_mapel` VALUES (109, 42, 21, 7, 57, NULL);
INSERT INTO `guru_mapel` VALUES (110, 43, 22, 7, 57, NULL);
INSERT INTO `guru_mapel` VALUES (111, 46, 10, 7, 57, NULL);
INSERT INTO `guru_mapel` VALUES (112, 39, 17, 7, 57, NULL);
INSERT INTO `guru_mapel` VALUES (113, 41, 16, 7, 58, NULL);
INSERT INTO `guru_mapel` VALUES (114, 51, 24, 7, 58, NULL);
INSERT INTO `guru_mapel` VALUES (115, 48, 25, 7, 58, NULL);
INSERT INTO `guru_mapel` VALUES (116, 53, 7, 7, 58, NULL);
INSERT INTO `guru_mapel` VALUES (117, 49, 26, 7, 58, NULL);
INSERT INTO `guru_mapel` VALUES (118, 42, 21, 7, 58, NULL);
INSERT INTO `guru_mapel` VALUES (119, 43, 22, 7, 58, NULL);
INSERT INTO `guru_mapel` VALUES (120, 46, 10, 7, 58, NULL);
INSERT INTO `guru_mapel` VALUES (121, 39, 17, 7, 58, NULL);

-- ----------------------------
-- Table structure for hari
-- ----------------------------
DROP TABLE IF EXISTS `hari`;
CREATE TABLE `hari`  (
  `id_hari` int(11) NOT NULL AUTO_INCREMENT,
  `hari` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `code` int(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id_hari`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for iuran_wajib_siswa
-- ----------------------------
DROP TABLE IF EXISTS `iuran_wajib_siswa`;
CREATE TABLE `iuran_wajib_siswa`  (
  `id_iuran_wajib_siswa` int(11) NOT NULL AUTO_INCREMENT,
  `nama` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `harga` double NULL DEFAULT NULL,
  PRIMARY KEY (`id_iuran_wajib_siswa`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for jadwal
-- ----------------------------
DROP TABLE IF EXISTS `jadwal`;
CREATE TABLE `jadwal`  (
  `id_jadwal` int(11) NOT NULL AUTO_INCREMENT,
  `tanggal` date NULL DEFAULT NULL,
  PRIMARY KEY (`id_jadwal`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
  `create_at` timestamp(0) NULL DEFAULT current_timestamp(),
  `idtahunajaran_fk` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_jadwal_guru`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jadwal_guru
-- ----------------------------
INSERT INTO `jadwal_guru` VALUES (8, 46, 1, '08:30', '15:30', '2023-05-17 10:13:39', 7);
INSERT INTO `jadwal_guru` VALUES (9, 46, 2, '08:30', '15:30', '2023-05-17 10:14:00', 7);
INSERT INTO `jadwal_guru` VALUES (10, 46, 3, '08:30', '15:30', '2023-05-17 10:14:17', 7);
INSERT INTO `jadwal_guru` VALUES (11, 45, 5, '12:38', '12:39', '2023-07-14 12:38:06', 7);
INSERT INTO `jadwal_guru` VALUES (12, 29, 1, '14:22', '14:23', '2023-07-14 14:22:32', 7);
INSERT INTO `jadwal_guru` VALUES (13, 29, 2, '14:22', '14:23', '2023-07-14 14:22:40', 7);
INSERT INTO `jadwal_guru` VALUES (14, 29, 5, '14:22', '14:22', '2023-07-14 14:22:57', 7);
INSERT INTO `jadwal_guru` VALUES (15, 29, 6, '14:23', '14:23', '2023-07-14 14:23:07', 7);
INSERT INTO `jadwal_guru` VALUES (16, 31, 5, '14:23', '14:23', '2023-07-14 14:23:21', 7);
INSERT INTO `jadwal_guru` VALUES (17, 31, 6, '14:23', '14:23', '2023-07-14 14:23:29', 7);

-- ----------------------------
-- Table structure for jadwal_lab
-- ----------------------------
DROP TABLE IF EXISTS `jadwal_lab`;
CREATE TABLE `jadwal_lab`  (
  `id_jadwal_lab` int(11) NOT NULL AUTO_INCREMENT,
  `idkelas_fk` int(11) NULL DEFAULT NULL,
  `idjampelajaranmulai_fk` int(11) NULL DEFAULT NULL,
  `idjampelajaranselesai_fk` int(11) NULL DEFAULT NULL,
  `idmapel_fk` int(11) NULL DEFAULT NULL,
  `keterangan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `status` int(255) NULL DEFAULT NULL,
  `idguru_fk` int(11) NULL DEFAULT NULL,
  `tanggal` date NULL DEFAULT NULL,
  PRIMARY KEY (`id_jadwal_lab`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jadwal_lab
-- ----------------------------
INSERT INTO `jadwal_lab` VALUES (2, 49, 9, 11, 8, 'Belajar matematika', 2, 46, '2023-07-25');

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
) ENGINE = InnoDB AUTO_INCREMENT = 441 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jadwal_pelajaran
-- ----------------------------
INSERT INTO `jadwal_pelajaran` VALUES (15, 20, 1, 9);
INSERT INTO `jadwal_pelajaran` VALUES (16, 20, 1, 10);
INSERT INTO `jadwal_pelajaran` VALUES (17, 21, 1, 11);
INSERT INTO `jadwal_pelajaran` VALUES (18, 21, 1, 12);
INSERT INTO `jadwal_pelajaran` VALUES (19, 21, 1, 13);
INSERT INTO `jadwal_pelajaran` VALUES (20, 21, 1, 14);
INSERT INTO `jadwal_pelajaran` VALUES (31, 22, 2, 9);
INSERT INTO `jadwal_pelajaran` VALUES (32, 22, 2, 10);
INSERT INTO `jadwal_pelajaran` VALUES (33, 9, 2, 11);
INSERT INTO `jadwal_pelajaran` VALUES (34, 9, 2, 12);
INSERT INTO `jadwal_pelajaran` VALUES (35, 23, 2, 13);
INSERT INTO `jadwal_pelajaran` VALUES (36, 23, 2, 14);
INSERT INTO `jadwal_pelajaran` VALUES (37, 24, 3, 9);
INSERT INTO `jadwal_pelajaran` VALUES (38, 24, 3, 10);
INSERT INTO `jadwal_pelajaran` VALUES (39, 24, 3, 11);
INSERT INTO `jadwal_pelajaran` VALUES (40, 24, 3, 12);
INSERT INTO `jadwal_pelajaran` VALUES (41, 25, 3, 13);
INSERT INTO `jadwal_pelajaran` VALUES (42, 25, 3, 14);
INSERT INTO `jadwal_pelajaran` VALUES (43, 26, 4, 9);
INSERT INTO `jadwal_pelajaran` VALUES (44, 26, 4, 10);
INSERT INTO `jadwal_pelajaran` VALUES (45, 20, 4, 11);
INSERT INTO `jadwal_pelajaran` VALUES (46, 20, 4, 12);
INSERT INTO `jadwal_pelajaran` VALUES (47, 23, 4, 13);
INSERT INTO `jadwal_pelajaran` VALUES (48, 23, 4, 14);
INSERT INTO `jadwal_pelajaran` VALUES (49, 27, 5, 9);
INSERT INTO `jadwal_pelajaran` VALUES (50, 27, 5, 10);
INSERT INTO `jadwal_pelajaran` VALUES (51, 27, 5, 11);
INSERT INTO `jadwal_pelajaran` VALUES (52, 27, 5, 12);
INSERT INTO `jadwal_pelajaran` VALUES (53, 28, 6, 9);
INSERT INTO `jadwal_pelajaran` VALUES (54, 28, 6, 10);
INSERT INTO `jadwal_pelajaran` VALUES (55, 29, 6, 11);
INSERT INTO `jadwal_pelajaran` VALUES (56, 29, 6, 12);
INSERT INTO `jadwal_pelajaran` VALUES (57, 29, 6, 13);
INSERT INTO `jadwal_pelajaran` VALUES (58, 29, 6, 14);
INSERT INTO `jadwal_pelajaran` VALUES (59, 30, 1, 9);
INSERT INTO `jadwal_pelajaran` VALUES (60, 30, 1, 10);
INSERT INTO `jadwal_pelajaran` VALUES (61, 31, 1, 11);
INSERT INTO `jadwal_pelajaran` VALUES (62, 31, 1, 12);
INSERT INTO `jadwal_pelajaran` VALUES (63, 31, 1, 13);
INSERT INTO `jadwal_pelajaran` VALUES (64, 31, 1, 14);
INSERT INTO `jadwal_pelajaran` VALUES (65, 32, 2, 9);
INSERT INTO `jadwal_pelajaran` VALUES (66, 32, 2, 10);
INSERT INTO `jadwal_pelajaran` VALUES (67, 32, 2, 11);
INSERT INTO `jadwal_pelajaran` VALUES (68, 32, 2, 12);
INSERT INTO `jadwal_pelajaran` VALUES (69, 37, 2, 13);
INSERT INTO `jadwal_pelajaran` VALUES (70, 37, 2, 14);
INSERT INTO `jadwal_pelajaran` VALUES (71, 39, 3, 9);
INSERT INTO `jadwal_pelajaran` VALUES (72, 39, 3, 10);
INSERT INTO `jadwal_pelajaran` VALUES (77, 43, 3, 11);
INSERT INTO `jadwal_pelajaran` VALUES (78, 43, 3, 12);
INSERT INTO `jadwal_pelajaran` VALUES (79, 44, 3, 13);
INSERT INTO `jadwal_pelajaran` VALUES (80, 44, 3, 14);
INSERT INTO `jadwal_pelajaran` VALUES (81, 39, 4, 9);
INSERT INTO `jadwal_pelajaran` VALUES (82, 39, 4, 10);
INSERT INTO `jadwal_pelajaran` VALUES (83, 44, 4, 11);
INSERT INTO `jadwal_pelajaran` VALUES (84, 44, 4, 12);
INSERT INTO `jadwal_pelajaran` VALUES (85, 45, 4, 13);
INSERT INTO `jadwal_pelajaran` VALUES (86, 45, 4, 14);
INSERT INTO `jadwal_pelajaran` VALUES (87, 46, 5, 9);
INSERT INTO `jadwal_pelajaran` VALUES (88, 46, 5, 10);
INSERT INTO `jadwal_pelajaran` VALUES (89, 43, 5, 11);
INSERT INTO `jadwal_pelajaran` VALUES (90, 43, 5, 12);
INSERT INTO `jadwal_pelajaran` VALUES (91, 47, 6, 9);
INSERT INTO `jadwal_pelajaran` VALUES (92, 47, 6, 10);
INSERT INTO `jadwal_pelajaran` VALUES (93, 32, 6, 11);
INSERT INTO `jadwal_pelajaran` VALUES (94, 32, 6, 12);
INSERT INTO `jadwal_pelajaran` VALUES (95, 32, 6, 13);
INSERT INTO `jadwal_pelajaran` VALUES (96, 32, 6, 14);
INSERT INTO `jadwal_pelajaran` VALUES (97, 54, 1, 9);
INSERT INTO `jadwal_pelajaran` VALUES (98, 54, 1, 10);
INSERT INTO `jadwal_pelajaran` VALUES (99, 10, 1, 11);
INSERT INTO `jadwal_pelajaran` VALUES (100, 10, 1, 12);
INSERT INTO `jadwal_pelajaran` VALUES (101, 57, 1, 13);
INSERT INTO `jadwal_pelajaran` VALUES (102, 57, 1, 14);
INSERT INTO `jadwal_pelajaran` VALUES (103, 10, 2, 9);
INSERT INTO `jadwal_pelajaran` VALUES (104, 10, 2, 10);
INSERT INTO `jadwal_pelajaran` VALUES (105, 62, 2, 11);
INSERT INTO `jadwal_pelajaran` VALUES (106, 62, 2, 12);
INSERT INTO `jadwal_pelajaran` VALUES (107, 62, 2, 13);
INSERT INTO `jadwal_pelajaran` VALUES (108, 62, 2, 14);
INSERT INTO `jadwal_pelajaran` VALUES (109, 65, 3, 9);
INSERT INTO `jadwal_pelajaran` VALUES (110, 65, 3, 10);
INSERT INTO `jadwal_pelajaran` VALUES (111, 68, 3, 11);
INSERT INTO `jadwal_pelajaran` VALUES (112, 68, 3, 12);
INSERT INTO `jadwal_pelajaran` VALUES (113, 68, 3, 13);
INSERT INTO `jadwal_pelajaran` VALUES (114, 68, 3, 14);
INSERT INTO `jadwal_pelajaran` VALUES (115, 70, 4, 9);
INSERT INTO `jadwal_pelajaran` VALUES (116, 70, 4, 10);
INSERT INTO `jadwal_pelajaran` VALUES (117, 70, 4, 11);
INSERT INTO `jadwal_pelajaran` VALUES (118, 70, 4, 12);
INSERT INTO `jadwal_pelajaran` VALUES (119, 57, 4, 13);
INSERT INTO `jadwal_pelajaran` VALUES (120, 57, 4, 14);
INSERT INTO `jadwal_pelajaran` VALUES (121, 74, 5, 9);
INSERT INTO `jadwal_pelajaran` VALUES (122, 74, 5, 10);
INSERT INTO `jadwal_pelajaran` VALUES (123, 74, 5, 11);
INSERT INTO `jadwal_pelajaran` VALUES (124, 74, 5, 12);
INSERT INTO `jadwal_pelajaran` VALUES (125, 65, 6, 9);
INSERT INTO `jadwal_pelajaran` VALUES (126, 65, 6, 10);
INSERT INTO `jadwal_pelajaran` VALUES (127, 65, 6, 11);
INSERT INTO `jadwal_pelajaran` VALUES (128, 65, 6, 12);
INSERT INTO `jadwal_pelajaran` VALUES (129, 59, 6, 13);
INSERT INTO `jadwal_pelajaran` VALUES (130, 59, 6, 14);
INSERT INTO `jadwal_pelajaran` VALUES (201, 75, 1, 9);
INSERT INTO `jadwal_pelajaran` VALUES (202, 75, 1, 10);
INSERT INTO `jadwal_pelajaran` VALUES (203, 76, 1, 11);
INSERT INTO `jadwal_pelajaran` VALUES (204, 76, 1, 12);
INSERT INTO `jadwal_pelajaran` VALUES (205, 77, 1, 13);
INSERT INTO `jadwal_pelajaran` VALUES (206, 77, 1, 14);
INSERT INTO `jadwal_pelajaran` VALUES (207, 78, 2, 9);
INSERT INTO `jadwal_pelajaran` VALUES (208, 78, 2, 10);
INSERT INTO `jadwal_pelajaran` VALUES (209, 78, 2, 11);
INSERT INTO `jadwal_pelajaran` VALUES (210, 78, 2, 12);
INSERT INTO `jadwal_pelajaran` VALUES (211, 75, 2, 13);
INSERT INTO `jadwal_pelajaran` VALUES (212, 75, 2, 14);
INSERT INTO `jadwal_pelajaran` VALUES (213, 79, 3, 9);
INSERT INTO `jadwal_pelajaran` VALUES (214, 79, 3, 10);
INSERT INTO `jadwal_pelajaran` VALUES (215, 79, 3, 11);
INSERT INTO `jadwal_pelajaran` VALUES (216, 79, 3, 12);
INSERT INTO `jadwal_pelajaran` VALUES (217, 80, 3, 13);
INSERT INTO `jadwal_pelajaran` VALUES (218, 80, 3, 14);
INSERT INTO `jadwal_pelajaran` VALUES (219, 75, 4, 9);
INSERT INTO `jadwal_pelajaran` VALUES (220, 75, 4, 10);
INSERT INTO `jadwal_pelajaran` VALUES (221, 81, 4, 11);
INSERT INTO `jadwal_pelajaran` VALUES (222, 81, 4, 12);
INSERT INTO `jadwal_pelajaran` VALUES (223, 82, 4, 13);
INSERT INTO `jadwal_pelajaran` VALUES (224, 82, 4, 14);
INSERT INTO `jadwal_pelajaran` VALUES (225, 75, 5, 9);
INSERT INTO `jadwal_pelajaran` VALUES (226, 75, 5, 10);
INSERT INTO `jadwal_pelajaran` VALUES (227, 77, 5, 11);
INSERT INTO `jadwal_pelajaran` VALUES (228, 77, 5, 12);
INSERT INTO `jadwal_pelajaran` VALUES (229, 83, 6, 9);
INSERT INTO `jadwal_pelajaran` VALUES (230, 83, 6, 10);
INSERT INTO `jadwal_pelajaran` VALUES (231, 82, 6, 11);
INSERT INTO `jadwal_pelajaran` VALUES (232, 82, 6, 12);
INSERT INTO `jadwal_pelajaran` VALUES (235, 86, 6, 13);
INSERT INTO `jadwal_pelajaran` VALUES (236, 86, 6, 14);
INSERT INTO `jadwal_pelajaran` VALUES (237, 48, 1, 15);
INSERT INTO `jadwal_pelajaran` VALUES (238, 48, 1, 16);
INSERT INTO `jadwal_pelajaran` VALUES (239, 48, 1, 17);
INSERT INTO `jadwal_pelajaran` VALUES (240, 48, 1, 18);
INSERT INTO `jadwal_pelajaran` VALUES (241, 12, 1, 19);
INSERT INTO `jadwal_pelajaran` VALUES (242, 12, 1, 20);
INSERT INTO `jadwal_pelajaran` VALUES (243, 12, 2, 15);
INSERT INTO `jadwal_pelajaran` VALUES (244, 12, 2, 16);
INSERT INTO `jadwal_pelajaran` VALUES (245, 49, 2, 17);
INSERT INTO `jadwal_pelajaran` VALUES (246, 49, 2, 18);
INSERT INTO `jadwal_pelajaran` VALUES (247, 15, 2, 19);
INSERT INTO `jadwal_pelajaran` VALUES (248, 15, 2, 20);
INSERT INTO `jadwal_pelajaran` VALUES (249, 50, 3, 15);
INSERT INTO `jadwal_pelajaran` VALUES (250, 50, 3, 16);
INSERT INTO `jadwal_pelajaran` VALUES (251, 50, 3, 17);
INSERT INTO `jadwal_pelajaran` VALUES (252, 50, 3, 18);
INSERT INTO `jadwal_pelajaran` VALUES (253, 52, 3, 19);
INSERT INTO `jadwal_pelajaran` VALUES (254, 52, 3, 20);
INSERT INTO `jadwal_pelajaran` VALUES (255, 53, 4, 15);
INSERT INTO `jadwal_pelajaran` VALUES (256, 53, 4, 16);
INSERT INTO `jadwal_pelajaran` VALUES (257, 53, 4, 17);
INSERT INTO `jadwal_pelajaran` VALUES (258, 53, 4, 18);
INSERT INTO `jadwal_pelajaran` VALUES (259, 55, 4, 19);
INSERT INTO `jadwal_pelajaran` VALUES (260, 55, 4, 20);
INSERT INTO `jadwal_pelajaran` VALUES (261, 56, 5, 15);
INSERT INTO `jadwal_pelajaran` VALUES (262, 56, 5, 16);
INSERT INTO `jadwal_pelajaran` VALUES (263, 56, 5, 17);
INSERT INTO `jadwal_pelajaran` VALUES (264, 56, 5, 18);
INSERT INTO `jadwal_pelajaran` VALUES (265, 73, 6, 15);
INSERT INTO `jadwal_pelajaran` VALUES (266, 73, 6, 16);
INSERT INTO `jadwal_pelajaran` VALUES (267, 73, 6, 17);
INSERT INTO `jadwal_pelajaran` VALUES (268, 73, 6, 18);
INSERT INTO `jadwal_pelajaran` VALUES (269, 73, 6, 19);
INSERT INTO `jadwal_pelajaran` VALUES (270, 73, 6, 20);
INSERT INTO `jadwal_pelajaran` VALUES (271, 60, 1, 15);
INSERT INTO `jadwal_pelajaran` VALUES (272, 60, 1, 16);
INSERT INTO `jadwal_pelajaran` VALUES (273, 60, 1, 17);
INSERT INTO `jadwal_pelajaran` VALUES (274, 60, 1, 18);
INSERT INTO `jadwal_pelajaran` VALUES (275, 13, 1, 19);
INSERT INTO `jadwal_pelajaran` VALUES (276, 13, 1, 20);
INSERT INTO `jadwal_pelajaran` VALUES (277, 13, 2, 15);
INSERT INTO `jadwal_pelajaran` VALUES (278, 13, 2, 16);
INSERT INTO `jadwal_pelajaran` VALUES (279, 61, 2, 17);
INSERT INTO `jadwal_pelajaran` VALUES (280, 61, 2, 18);
INSERT INTO `jadwal_pelajaran` VALUES (281, 16, 2, 19);
INSERT INTO `jadwal_pelajaran` VALUES (282, 16, 2, 20);
INSERT INTO `jadwal_pelajaran` VALUES (283, 63, 3, 15);
INSERT INTO `jadwal_pelajaran` VALUES (284, 63, 3, 16);
INSERT INTO `jadwal_pelajaran` VALUES (285, 63, 3, 17);
INSERT INTO `jadwal_pelajaran` VALUES (286, 63, 3, 18);
INSERT INTO `jadwal_pelajaran` VALUES (287, 64, 3, 19);
INSERT INTO `jadwal_pelajaran` VALUES (288, 64, 3, 20);
INSERT INTO `jadwal_pelajaran` VALUES (289, 66, 4, 15);
INSERT INTO `jadwal_pelajaran` VALUES (290, 66, 4, 16);
INSERT INTO `jadwal_pelajaran` VALUES (291, 66, 4, 17);
INSERT INTO `jadwal_pelajaran` VALUES (292, 66, 4, 18);
INSERT INTO `jadwal_pelajaran` VALUES (293, 67, 4, 19);
INSERT INTO `jadwal_pelajaran` VALUES (294, 67, 4, 20);
INSERT INTO `jadwal_pelajaran` VALUES (295, 69, 5, 15);
INSERT INTO `jadwal_pelajaran` VALUES (296, 69, 5, 16);
INSERT INTO `jadwal_pelajaran` VALUES (297, 69, 5, 17);
INSERT INTO `jadwal_pelajaran` VALUES (298, 69, 5, 18);
INSERT INTO `jadwal_pelajaran` VALUES (299, 72, 6, 15);
INSERT INTO `jadwal_pelajaran` VALUES (300, 72, 6, 16);
INSERT INTO `jadwal_pelajaran` VALUES (301, 72, 6, 17);
INSERT INTO `jadwal_pelajaran` VALUES (302, 72, 6, 18);
INSERT INTO `jadwal_pelajaran` VALUES (303, 72, 6, 19);
INSERT INTO `jadwal_pelajaran` VALUES (304, 72, 6, 20);
INSERT INTO `jadwal_pelajaran` VALUES (305, 84, 1, 15);
INSERT INTO `jadwal_pelajaran` VALUES (306, 84, 1, 16);
INSERT INTO `jadwal_pelajaran` VALUES (307, 84, 1, 17);
INSERT INTO `jadwal_pelajaran` VALUES (308, 84, 1, 18);
INSERT INTO `jadwal_pelajaran` VALUES (309, 84, 1, 19);
INSERT INTO `jadwal_pelajaran` VALUES (310, 84, 1, 20);
INSERT INTO `jadwal_pelajaran` VALUES (311, 85, 2, 15);
INSERT INTO `jadwal_pelajaran` VALUES (312, 85, 2, 16);
INSERT INTO `jadwal_pelajaran` VALUES (313, 87, 2, 17);
INSERT INTO `jadwal_pelajaran` VALUES (314, 87, 2, 18);
INSERT INTO `jadwal_pelajaran` VALUES (315, 89, 2, 19);
INSERT INTO `jadwal_pelajaran` VALUES (316, 89, 2, 20);
INSERT INTO `jadwal_pelajaran` VALUES (317, 91, 3, 15);
INSERT INTO `jadwal_pelajaran` VALUES (318, 91, 3, 16);
INSERT INTO `jadwal_pelajaran` VALUES (319, 87, 3, 17);
INSERT INTO `jadwal_pelajaran` VALUES (320, 87, 3, 18);
INSERT INTO `jadwal_pelajaran` VALUES (321, 89, 3, 19);
INSERT INTO `jadwal_pelajaran` VALUES (322, 89, 3, 20);
INSERT INTO `jadwal_pelajaran` VALUES (323, 85, 4, 15);
INSERT INTO `jadwal_pelajaran` VALUES (324, 85, 4, 16);
INSERT INTO `jadwal_pelajaran` VALUES (325, 93, 4, 17);
INSERT INTO `jadwal_pelajaran` VALUES (326, 93, 4, 18);
INSERT INTO `jadwal_pelajaran` VALUES (327, 94, 4, 19);
INSERT INTO `jadwal_pelajaran` VALUES (328, 94, 4, 20);
INSERT INTO `jadwal_pelajaran` VALUES (329, 85, 5, 15);
INSERT INTO `jadwal_pelajaran` VALUES (330, 85, 5, 16);
INSERT INTO `jadwal_pelajaran` VALUES (331, 96, 5, 17);
INSERT INTO `jadwal_pelajaran` VALUES (332, 96, 5, 18);
INSERT INTO `jadwal_pelajaran` VALUES (333, 98, 6, 15);
INSERT INTO `jadwal_pelajaran` VALUES (334, 98, 6, 16);
INSERT INTO `jadwal_pelajaran` VALUES (335, 98, 6, 17);
INSERT INTO `jadwal_pelajaran` VALUES (336, 98, 6, 18);
INSERT INTO `jadwal_pelajaran` VALUES (337, 98, 6, 19);
INSERT INTO `jadwal_pelajaran` VALUES (338, 98, 6, 20);
INSERT INTO `jadwal_pelajaran` VALUES (339, 88, 1, 9);
INSERT INTO `jadwal_pelajaran` VALUES (340, 88, 1, 10);
INSERT INTO `jadwal_pelajaran` VALUES (341, 90, 1, 11);
INSERT INTO `jadwal_pelajaran` VALUES (342, 90, 1, 12);
INSERT INTO `jadwal_pelajaran` VALUES (343, 92, 1, 13);
INSERT INTO `jadwal_pelajaran` VALUES (344, 92, 1, 14);
INSERT INTO `jadwal_pelajaran` VALUES (345, 95, 2, 9);
INSERT INTO `jadwal_pelajaran` VALUES (346, 95, 2, 10);
INSERT INTO `jadwal_pelajaran` VALUES (347, 88, 2, 11);
INSERT INTO `jadwal_pelajaran` VALUES (348, 88, 2, 12);
INSERT INTO `jadwal_pelajaran` VALUES (349, 97, 2, 13);
INSERT INTO `jadwal_pelajaran` VALUES (350, 97, 2, 14);
INSERT INTO `jadwal_pelajaran` VALUES (351, 99, 3, 9);
INSERT INTO `jadwal_pelajaran` VALUES (352, 99, 3, 10);
INSERT INTO `jadwal_pelajaran` VALUES (353, 99, 3, 11);
INSERT INTO `jadwal_pelajaran` VALUES (354, 99, 3, 12);
INSERT INTO `jadwal_pelajaran` VALUES (355, 100, 3, 13);
INSERT INTO `jadwal_pelajaran` VALUES (356, 100, 3, 14);
INSERT INTO `jadwal_pelajaran` VALUES (357, 101, 4, 9);
INSERT INTO `jadwal_pelajaran` VALUES (358, 101, 4, 10);
INSERT INTO `jadwal_pelajaran` VALUES (359, 102, 4, 11);
INSERT INTO `jadwal_pelajaran` VALUES (360, 102, 4, 12);
INSERT INTO `jadwal_pelajaran` VALUES (361, 102, 4, 13);
INSERT INTO `jadwal_pelajaran` VALUES (362, 102, 4, 14);
INSERT INTO `jadwal_pelajaran` VALUES (363, 101, 5, 9);
INSERT INTO `jadwal_pelajaran` VALUES (364, 101, 5, 10);
INSERT INTO `jadwal_pelajaran` VALUES (365, 101, 5, 11);
INSERT INTO `jadwal_pelajaran` VALUES (366, 101, 5, 12);
INSERT INTO `jadwal_pelajaran` VALUES (367, 90, 6, 9);
INSERT INTO `jadwal_pelajaran` VALUES (368, 90, 6, 10);
INSERT INTO `jadwal_pelajaran` VALUES (369, 90, 6, 11);
INSERT INTO `jadwal_pelajaran` VALUES (370, 90, 6, 12);
INSERT INTO `jadwal_pelajaran` VALUES (371, 103, 6, 13);
INSERT INTO `jadwal_pelajaran` VALUES (372, 103, 6, 14);
INSERT INTO `jadwal_pelajaran` VALUES (373, 104, 1, 15);
INSERT INTO `jadwal_pelajaran` VALUES (374, 104, 1, 16);
INSERT INTO `jadwal_pelajaran` VALUES (375, 104, 1, 17);
INSERT INTO `jadwal_pelajaran` VALUES (376, 104, 1, 18);
INSERT INTO `jadwal_pelajaran` VALUES (377, 104, 1, 19);
INSERT INTO `jadwal_pelajaran` VALUES (378, 104, 1, 20);
INSERT INTO `jadwal_pelajaran` VALUES (379, 105, 2, 15);
INSERT INTO `jadwal_pelajaran` VALUES (380, 105, 2, 16);
INSERT INTO `jadwal_pelajaran` VALUES (381, 18, 2, 17);
INSERT INTO `jadwal_pelajaran` VALUES (382, 18, 2, 18);
INSERT INTO `jadwal_pelajaran` VALUES (383, 106, 2, 19);
INSERT INTO `jadwal_pelajaran` VALUES (384, 106, 2, 20);
INSERT INTO `jadwal_pelajaran` VALUES (385, 107, 3, 15);
INSERT INTO `jadwal_pelajaran` VALUES (386, 107, 3, 16);
INSERT INTO `jadwal_pelajaran` VALUES (387, 18, 3, 17);
INSERT INTO `jadwal_pelajaran` VALUES (388, 18, 3, 18);
INSERT INTO `jadwal_pelajaran` VALUES (389, 106, 3, 19);
INSERT INTO `jadwal_pelajaran` VALUES (390, 106, 3, 20);
INSERT INTO `jadwal_pelajaran` VALUES (391, 105, 4, 15);
INSERT INTO `jadwal_pelajaran` VALUES (392, 105, 4, 16);
INSERT INTO `jadwal_pelajaran` VALUES (393, 109, 4, 17);
INSERT INTO `jadwal_pelajaran` VALUES (394, 109, 4, 18);
INSERT INTO `jadwal_pelajaran` VALUES (395, 110, 4, 19);
INSERT INTO `jadwal_pelajaran` VALUES (396, 110, 4, 20);
INSERT INTO `jadwal_pelajaran` VALUES (397, 105, 5, 15);
INSERT INTO `jadwal_pelajaran` VALUES (398, 105, 5, 16);
INSERT INTO `jadwal_pelajaran` VALUES (399, 111, 5, 17);
INSERT INTO `jadwal_pelajaran` VALUES (400, 111, 5, 18);
INSERT INTO `jadwal_pelajaran` VALUES (401, 112, 6, 15);
INSERT INTO `jadwal_pelajaran` VALUES (402, 112, 6, 16);
INSERT INTO `jadwal_pelajaran` VALUES (403, 112, 6, 17);
INSERT INTO `jadwal_pelajaran` VALUES (404, 112, 6, 18);
INSERT INTO `jadwal_pelajaran` VALUES (405, 112, 6, 19);
INSERT INTO `jadwal_pelajaran` VALUES (406, 112, 6, 20);
INSERT INTO `jadwal_pelajaran` VALUES (407, 113, 1, 15);
INSERT INTO `jadwal_pelajaran` VALUES (408, 113, 1, 16);
INSERT INTO `jadwal_pelajaran` VALUES (409, 113, 1, 17);
INSERT INTO `jadwal_pelajaran` VALUES (410, 113, 1, 18);
INSERT INTO `jadwal_pelajaran` VALUES (411, 113, 1, 19);
INSERT INTO `jadwal_pelajaran` VALUES (412, 113, 1, 20);
INSERT INTO `jadwal_pelajaran` VALUES (413, 114, 2, 15);
INSERT INTO `jadwal_pelajaran` VALUES (414, 114, 2, 16);
INSERT INTO `jadwal_pelajaran` VALUES (415, 19, 2, 17);
INSERT INTO `jadwal_pelajaran` VALUES (416, 19, 2, 18);
INSERT INTO `jadwal_pelajaran` VALUES (417, 115, 2, 19);
INSERT INTO `jadwal_pelajaran` VALUES (418, 115, 2, 20);
INSERT INTO `jadwal_pelajaran` VALUES (419, 116, 3, 15);
INSERT INTO `jadwal_pelajaran` VALUES (420, 116, 3, 16);
INSERT INTO `jadwal_pelajaran` VALUES (421, 19, 3, 17);
INSERT INTO `jadwal_pelajaran` VALUES (422, 19, 3, 18);
INSERT INTO `jadwal_pelajaran` VALUES (423, 117, 3, 19);
INSERT INTO `jadwal_pelajaran` VALUES (424, 117, 3, 20);
INSERT INTO `jadwal_pelajaran` VALUES (425, 114, 4, 15);
INSERT INTO `jadwal_pelajaran` VALUES (426, 114, 4, 16);
INSERT INTO `jadwal_pelajaran` VALUES (427, 118, 4, 17);
INSERT INTO `jadwal_pelajaran` VALUES (428, 118, 4, 18);
INSERT INTO `jadwal_pelajaran` VALUES (429, 119, 4, 19);
INSERT INTO `jadwal_pelajaran` VALUES (430, 119, 4, 20);
INSERT INTO `jadwal_pelajaran` VALUES (431, 114, 5, 15);
INSERT INTO `jadwal_pelajaran` VALUES (432, 114, 5, 16);
INSERT INTO `jadwal_pelajaran` VALUES (433, 120, 5, 17);
INSERT INTO `jadwal_pelajaran` VALUES (434, 120, 5, 18);
INSERT INTO `jadwal_pelajaran` VALUES (435, 121, 6, 15);
INSERT INTO `jadwal_pelajaran` VALUES (436, 121, 6, 16);
INSERT INTO `jadwal_pelajaran` VALUES (437, 121, 6, 17);
INSERT INTO `jadwal_pelajaran` VALUES (438, 121, 6, 18);
INSERT INTO `jadwal_pelajaran` VALUES (439, 121, 6, 19);
INSERT INTO `jadwal_pelajaran` VALUES (440, 121, 6, 20);

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
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jam_pelajaran
-- ----------------------------
INSERT INTO `jam_pelajaran` VALUES (9, '1', '08.30', '09.00', 7);
INSERT INTO `jam_pelajaran` VALUES (10, '2', '09.00', '09.30', 7);
INSERT INTO `jam_pelajaran` VALUES (11, '3', '09.30', '10.00', 7);
INSERT INTO `jam_pelajaran` VALUES (12, '4', '10.00', '10.30', 7);
INSERT INTO `jam_pelajaran` VALUES (13, '5', '10.30', '11.00', 7);
INSERT INTO `jam_pelajaran` VALUES (14, '6', '11.00', '11.30', 7);
INSERT INTO `jam_pelajaran` VALUES (15, '7', '12.30', '13.00', 7);
INSERT INTO `jam_pelajaran` VALUES (16, '8', '13.00', '13.30', 7);
INSERT INTO `jam_pelajaran` VALUES (17, '9', '13.30', '14.00', 7);
INSERT INTO `jam_pelajaran` VALUES (18, '10', '14.00', '14.30', 7);
INSERT INTO `jam_pelajaran` VALUES (19, '11', '14.30', '15.00', 7);
INSERT INTO `jam_pelajaran` VALUES (20, '12', '15.00', '15.30', 7);

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for jenis_mata_pelajaran
-- ----------------------------
DROP TABLE IF EXISTS `jenis_mata_pelajaran`;
CREATE TABLE `jenis_mata_pelajaran`  (
  `id_jenis_mata_pelajaran` int(11) NOT NULL AUTO_INCREMENT,
  `jenis_mata_pelajaran` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`id_jenis_mata_pelajaran`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for jenis_pelanggaran
-- ----------------------------
DROP TABLE IF EXISTS `jenis_pelanggaran`;
CREATE TABLE `jenis_pelanggaran`  (
  `id_jenis_pelanggaran` int(11) NOT NULL AUTO_INCREMENT,
  `jenis_pelanggaran` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`id_jenis_pelanggaran`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
-- Table structure for jenis_pengetahuan
-- ----------------------------
DROP TABLE IF EXISTS `jenis_pengetahuan`;
CREATE TABLE `jenis_pengetahuan`  (
  `id_jenis_pengetahuan` int(11) NOT NULL AUTO_INCREMENT,
  `jenis_pengetahuan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `kode` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`id_jenis_pengetahuan`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for jenis_penilaian
-- ----------------------------
DROP TABLE IF EXISTS `jenis_penilaian`;
CREATE TABLE `jenis_penilaian`  (
  `id_jenis_penilaian` int(11) NOT NULL AUTO_INCREMENT,
  `jenis_penilaian` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `kode` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_jenis_penilaian`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jurnal_guru
-- ----------------------------
INSERT INTO `jurnal_guru` VALUES (2, 31, 56, 14, 7, '2023-05-17', 'Tertib');
INSERT INTO `jurnal_guru` VALUES (3, 46, 50, 10, 7, '2023-05-17', 'Tes tulis bab 1,2,3');

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
  `create_at` timestamp(0) NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_jurnal_umum`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 457 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jurusan
-- ----------------------------
INSERT INTO `jurusan` VALUES (15, 'Teknik Komputer dan Jaringan', 'TKJ', 1);
INSERT INTO `jurusan` VALUES (16, 'Agribisnis Pengolahan Hasil Pertanian', 'APHP', 1);
INSERT INTO `jurusan` VALUES (17, 'Desain Komunikasi Visual', 'DKV', 1);

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for kategori_surat_masuk
-- ----------------------------
DROP TABLE IF EXISTS `kategori_surat_masuk`;
CREATE TABLE `kategori_surat_masuk`  (
  `id_kategori_surat_masuk` int(11) NOT NULL AUTO_INCREMENT,
  `kategori_surat_masuk` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `color` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`id_kategori_surat_masuk`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for kelas
-- ----------------------------
DROP TABLE IF EXISTS `kelas`;
CREATE TABLE `kelas`  (
  `id_kelas` int(11) NOT NULL AUTO_INCREMENT,
  `kelas` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `idtingkat_fk` int(11) NULL DEFAULT NULL,
  `create_at` timestamp(0) NULL DEFAULT current_timestamp(),
  `idjurusan_fk` int(11) NULL DEFAULT NULL,
  `idtahunajaran_fk` int(11) NULL DEFAULT NULL,
  `iddepartment_fk` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_kelas`) USING BTREE,
  INDEX `idtingkat_fk`(`idtingkat_fk`) USING BTREE,
  CONSTRAINT `kelas_ibfk_1` FOREIGN KEY (`idtingkat_fk`) REFERENCES `tingkat` (`id_tingkat`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 67 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of kelas
-- ----------------------------
INSERT INTO `kelas` VALUES (49, 'X TKJ 1', 1, '2023-05-15 10:27:37', 15, 7, 1);
INSERT INTO `kelas` VALUES (50, 'X TKJ 2', 1, '2023-05-15 10:27:49', 15, 7, 1);
INSERT INTO `kelas` VALUES (51, 'X DKV 1', 1, '2023-05-15 10:28:16', 17, 7, 1);
INSERT INTO `kelas` VALUES (52, 'X DKV 2', 1, '2023-05-15 10:28:28', 17, 7, 1);
INSERT INTO `kelas` VALUES (53, 'X APHP', 1, '2023-05-15 10:28:48', 16, 7, 1);
INSERT INTO `kelas` VALUES (54, 'XI TKJ 1', 2, '2023-05-15 10:29:15', 15, 7, 1);
INSERT INTO `kelas` VALUES (55, 'XI TKJ 2', 2, '2023-05-15 10:29:25', 15, 7, 1);
INSERT INTO `kelas` VALUES (56, 'XI DKV 1', 2, '2023-05-15 10:29:48', 17, 7, 1);
INSERT INTO `kelas` VALUES (57, 'XI DKV 2', 2, '2023-05-15 10:29:58', 17, 7, 1);
INSERT INTO `kelas` VALUES (58, 'XI APHP', 2, '2023-05-15 10:30:30', 16, 7, 1);
INSERT INTO `kelas` VALUES (59, 'XII TKJ 1', 3, '2023-05-15 10:30:51', 15, 7, 1);
INSERT INTO `kelas` VALUES (60, 'XII TKJ 2', 3, '2023-05-15 10:31:14', 15, 7, 1);
INSERT INTO `kelas` VALUES (61, 'XII DKV 1', 3, '2023-05-15 10:31:26', 17, 7, 1);
INSERT INTO `kelas` VALUES (62, 'XII APHP 1', 3, '2023-05-15 10:31:45', 16, 7, 1);
INSERT INTO `kelas` VALUES (63, 'XII APHP 2', 3, '2023-05-15 10:31:59', 16, 7, 1);
INSERT INTO `kelas` VALUES (64, 'X TKJ 3', 1, '2023-05-15 10:35:10', 15, 7, 1);
INSERT INTO `kelas` VALUES (65, 'XI TKJ 3', 2, '2023-07-13 13:59:17', 15, 7, 1);
INSERT INTO `kelas` VALUES (66, 'XII DKV 2', 3, '2023-07-13 14:37:04', 17, 7, 1);

-- ----------------------------
-- Table structure for kelas_erapor
-- ----------------------------
DROP TABLE IF EXISTS `kelas_erapor`;
CREATE TABLE `kelas_erapor`  (
  `id_kelas_erapor` int(11) NOT NULL AUTO_INCREMENT,
  `idkelas_fk` int(11) NULL DEFAULT NULL,
  `iderapor_fk` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_kelas_erapor`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for kelas_oas
-- ----------------------------
DROP TABLE IF EXISTS `kelas_oas`;
CREATE TABLE `kelas_oas`  (
  `id_kelas_oas` int(11) NOT NULL AUTO_INCREMENT,
  `idkelas_fk` int(11) NULL DEFAULT NULL,
  `idoas_fk` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_kelas_oas`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for kelompok_prasarana
-- ----------------------------
DROP TABLE IF EXISTS `kelompok_prasarana`;
CREATE TABLE `kelompok_prasarana`  (
  `id_kelompok_prasarana` int(11) NOT NULL AUTO_INCREMENT,
  `kelompok_prasarana` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`id_kelompok_prasarana`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of kelompok_prasarana
-- ----------------------------
INSERT INTO `kelompok_prasarana` VALUES (4, 'Ruang Kelas');
INSERT INTO `kelompok_prasarana` VALUES (5, 'Laboratorium');
INSERT INTO `kelompok_prasarana` VALUES (6, 'Loker/Lemari');

-- ----------------------------
-- Table structure for kelompok_sarana
-- ----------------------------
DROP TABLE IF EXISTS `kelompok_sarana`;
CREATE TABLE `kelompok_sarana`  (
  `id_kelompok_sarana` int(11) NOT NULL AUTO_INCREMENT,
  `kelompok_sarana` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`id_kelompok_sarana`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of kelompok_sarana
-- ----------------------------
INSERT INTO `kelompok_sarana` VALUES (6, 'Perangkat Robotik');
INSERT INTO `kelompok_sarana` VALUES (7, 'Perangkat Komputer');
INSERT INTO `kelompok_sarana` VALUES (8, 'Laptop Siswa');
INSERT INTO `kelompok_sarana` VALUES (9, 'Perangkat Jaringan');

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
-- Table structure for kompetensi_pkg
-- ----------------------------
DROP TABLE IF EXISTS `kompetensi_pkg`;
CREATE TABLE `kompetensi_pkg`  (
  `id_kompetensi_pkg` int(11) NOT NULL AUTO_INCREMENT,
  `kompetensi` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `idtahunajaran_fk` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_kompetensi_pkg`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for kondisi_prasarana
-- ----------------------------
DROP TABLE IF EXISTS `kondisi_prasarana`;
CREATE TABLE `kondisi_prasarana`  (
  `id_kondisi_prasarana` int(11) NOT NULL AUTO_INCREMENT,
  `kondisi_prasarana` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `warna` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`id_kondisi_prasarana`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of kondisi_prasarana
-- ----------------------------
INSERT INTO `kondisi_prasarana` VALUES (1, 'Buruk', '#b30000');
INSERT INTO `kondisi_prasarana` VALUES (2, 'Sedang', '#d18f00');
INSERT INTO `kondisi_prasarana` VALUES (3, 'Baik', '#00ad0c');

-- ----------------------------
-- Table structure for kondisi_sarana
-- ----------------------------
DROP TABLE IF EXISTS `kondisi_sarana`;
CREATE TABLE `kondisi_sarana`  (
  `id_kondisi_sarana` int(11) NOT NULL AUTO_INCREMENT,
  `kondisi_sarana` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `warna` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`id_kondisi_sarana`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of kondisi_sarana
-- ----------------------------
INSERT INTO `kondisi_sarana` VALUES (1, 'BAIK', '#078315');
INSERT INTO `kondisi_sarana` VALUES (2, 'SEDANG', '#ffbb00');
INSERT INTO `kondisi_sarana` VALUES (3, 'BURUK', '#ff0000');
INSERT INTO `kondisi_sarana` VALUES (4, 'Sangat Baik', '#006eff');

-- ----------------------------
-- Table structure for kontrol_sarana
-- ----------------------------
DROP TABLE IF EXISTS `kontrol_sarana`;
CREATE TABLE `kontrol_sarana`  (
  `id_kontrol_sarana` int(11) NOT NULL AUTO_INCREMENT,
  `tanggal` date NULL DEFAULT NULL,
  `idguru_fk` int(11) NULL DEFAULT NULL,
  `no_kontrol_sarana` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `keterangan` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_kontrol_sarana`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of kontrol_sarana
-- ----------------------------
INSERT INTO `kontrol_sarana` VALUES (1, '2022-12-03', 27, 'P-9645', NULL);
INSERT INTO `kontrol_sarana` VALUES (2, '2022-12-11', 3, '3234109/2022/PE', NULL);
INSERT INTO `kontrol_sarana` VALUES (3, '2023-07-04', 40, 'KS/5312910/04072023', NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
  `create_at` timestamp(0) NULL DEFAULT current_timestamp(),
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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for learning_set_materials
-- ----------------------------
DROP TABLE IF EXISTS `learning_set_materials`;
CREATE TABLE `learning_set_materials`  (
  `id_learning_set_materials` int(11) NOT NULL AUTO_INCREMENT,
  `materials` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `covers` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `create_at` timestamp(0) NULL DEFAULT current_timestamp(),
  `iduser_fk` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_learning_set_materials`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for learning_set_quiz
-- ----------------------------
DROP TABLE IF EXISTS `learning_set_quiz`;
CREATE TABLE `learning_set_quiz`  (
  `id_learning_set_quiz` int(11) NOT NULL AUTO_INCREMENT,
  `quiz_name` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`id_learning_set_quiz`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for log_kelas_siswa
-- ----------------------------
DROP TABLE IF EXISTS `log_kelas_siswa`;
CREATE TABLE `log_kelas_siswa`  (
  `id_log_kelas_siswa` int(11) NOT NULL AUTO_INCREMENT,
  `idsiswa_fk` int(11) NULL DEFAULT NULL,
  `idkelasbefore_fk` int(11) NULL DEFAULT NULL,
  `idkelasafter_fk` int(11) NULL DEFAULT NULL,
  `create_at` timestamp(0) NULL DEFAULT current_timestamp(),
  `keterangan` int(11) NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_log_kelas_siswa`) USING BTREE
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
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mata_pelajaran
-- ----------------------------
INSERT INTO `mata_pelajaran` VALUES (7, 'Matematika', 'MTK', NULL, NULL);
INSERT INTO `mata_pelajaran` VALUES (8, 'Informatika', 'Informatika', NULL, NULL);
INSERT INTO `mata_pelajaran` VALUES (9, 'Aplikasi Komputer', 'Aplikom', NULL, NULL);
INSERT INTO `mata_pelajaran` VALUES (10, 'Bahasa Indonesia', 'BIN', NULL, NULL);
INSERT INTO `mata_pelajaran` VALUES (11, 'Kompetensi Keahlian TKJ', 'KK TKJ', NULL, NULL);
INSERT INTO `mata_pelajaran` VALUES (12, 'Dasar-Dasar Program Keahlian TKJ', 'DPK TKJ', NULL, NULL);
INSERT INTO `mata_pelajaran` VALUES (13, 'Produk Kreatif dan Kewirausahaan', 'PKWU', NULL, NULL);
INSERT INTO `mata_pelajaran` VALUES (14, 'Kompetensi Keahlian DKV', 'KK DKV', NULL, NULL);
INSERT INTO `mata_pelajaran` VALUES (15, 'Dasar-Dasar Program Keahlian DKV', 'DPK DKV', NULL, NULL);
INSERT INTO `mata_pelajaran` VALUES (16, 'Kompetensi Keahlian APHP', 'KK APHP', NULL, NULL);
INSERT INTO `mata_pelajaran` VALUES (17, 'Pendidikan Jasmani, Olah Raga, dan Kesehatan', 'PJOK', NULL, NULL);
INSERT INTO `mata_pelajaran` VALUES (18, 'Kelas Inkubasi TKJ', 'INK', NULL, NULL);
INSERT INTO `mata_pelajaran` VALUES (19, 'Projek Penguatan Profil Pelajar Pancasila', 'P5', NULL, NULL);
INSERT INTO `mata_pelajaran` VALUES (20, 'Dasar-Dasar Program Keahlian APHP', 'DPK APHP', NULL, NULL);
INSERT INTO `mata_pelajaran` VALUES (21, 'Mapel Terpadu', 'MT', NULL, NULL);
INSERT INTO `mata_pelajaran` VALUES (22, 'Bahasa Daerah', 'BADER', NULL, NULL);
INSERT INTO `mata_pelajaran` VALUES (23, 'Pendidikan Pancasila dan Kewarganegaraan', 'PPKN', NULL, NULL);
INSERT INTO `mata_pelajaran` VALUES (24, 'Bahasa Inggris', 'BING', NULL, NULL);
INSERT INTO `mata_pelajaran` VALUES (25, 'Keamanan Pangan, Penyimpanan dan Penggudangan', 'KP3', NULL, NULL);
INSERT INTO `mata_pelajaran` VALUES (26, 'Produksi Pengolahan Komoditas Perkebunan dan Herbal ', 'P2KPH', NULL, NULL);
INSERT INTO `mata_pelajaran` VALUES (27, 'Projek Ilmu Pengetahuan Alam dan Sosial', 'Projek IPAS', NULL, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
  `create_at` timestamp(0) NULL DEFAULT current_timestamp(),
  `idkd_fk` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_nilai_keterampilan`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
  `create_at` timestamp(0) NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_nilai_pas`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
  `create_at` timestamp(0) NULL DEFAULT current_timestamp(),
  `idkd_fk` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_nilai_pengetahuan`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
  `create_at` timestamp(0) NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_nilai_pts`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
  `create_at` timestamp(0) NULL DEFAULT current_timestamp(),
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
  `create_at` timestamp(0) NULL DEFAULT current_timestamp(),
  `order_id` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  PRIMARY KEY (`id_pembayaran_spp`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for peminjaman_sarana
-- ----------------------------
DROP TABLE IF EXISTS `peminjaman_sarana`;
CREATE TABLE `peminjaman_sarana`  (
  `id_peminjaman_sarana` int(11) NOT NULL AUTO_INCREMENT,
  `tanggal_mulai` date NULL DEFAULT NULL,
  `tanggal_selesai` date NULL DEFAULT NULL,
  `table_pemohon` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `idtablepemohon_fk` int(11) NULL DEFAULT NULL,
  `no_peminjaman_sarana` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `tujuan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `create_at` timestamp(0) NULL DEFAULT current_timestamp(),
  `status` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id_peminjaman_sarana`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of peminjaman_sarana
-- ----------------------------
INSERT INTO `peminjaman_sarana` VALUES (7, '2023-07-04', '2023-07-04', 'siswa', 803, 'PS/6799661/07', 'pelajaran', '2023-07-04 14:03:40', 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
  `create_at` timestamp(0) NULL DEFAULT current_timestamp(),
  `invoice` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `diskon` double NULL DEFAULT NULL,
  PRIMARY KEY (`id_penerimaan`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

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
  `create_at` timestamp(0) NULL DEFAULT current_timestamp(),
  `invoice` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `diskon` double NULL DEFAULT NULL,
  PRIMARY KEY (`id_penerimaan_alumni`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pengeluaran_lain
-- ----------------------------
DROP TABLE IF EXISTS `pengeluaran_lain`;
CREATE TABLE `pengeluaran_lain`  (
  `id_pengeluaran_lain` int(11) NOT NULL AUTO_INCREMENT,
  `trans_code` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `keterangan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `tanggal` date NULL DEFAULT NULL,
  `create_at` timestamp(0) NULL DEFAULT current_timestamp(),
  `jenis` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `total` double NULL DEFAULT NULL,
  `jenis_kas` int(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id_pengeluaran_lain`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pengembalian_sarana
-- ----------------------------
DROP TABLE IF EXISTS `pengembalian_sarana`;
CREATE TABLE `pengembalian_sarana`  (
  `id_pengembalian_sarana` int(11) NOT NULL AUTO_INCREMENT,
  `idpeminjamansarana_fk` int(11) NULL DEFAULT NULL,
  `tanggal_kembali` date NULL DEFAULT NULL,
  `keterangan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `is_complete` int(11) NULL DEFAULT NULL,
  `no_pengembalian_sarana` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`id_pengembalian_sarana`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

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
  `create_at` timestamp(0) NULL DEFAULT current_timestamp(),
  `trans_code` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`id_penilaian_kinerja_guru`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for persentase_guru
-- ----------------------------
DROP TABLE IF EXISTS `persentase_guru`;
CREATE TABLE `persentase_guru`  (
  `id_persentase_guru` int(11) NOT NULL AUTO_INCREMENT,
  `idguru_fk` int(11) NULL DEFAULT NULL,
  `persentase` int(11) NULL DEFAULT NULL,
  `create_at` timestamp(0) NULL DEFAULT current_timestamp(),
  `idtahunajaran_fk` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_persentase_guru`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pindah_kelas
-- ----------------------------
DROP TABLE IF EXISTS `pindah_kelas`;
CREATE TABLE `pindah_kelas`  (
  `id_pindah_kelas` int(11) NOT NULL AUTO_INCREMENT,
  `idkelas_before` int(11) NULL DEFAULT NULL,
  `idkelas_after` int(11) NULL DEFAULT NULL,
  `create_at` timestamp(0) NULL DEFAULT current_timestamp(),
  `idsiswa_fk` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_pindah_kelas`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

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
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
  `create_at` timestamp(0) NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_ppdb`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prasarana
-- ----------------------------
DROP TABLE IF EXISTS `prasarana`;
CREATE TABLE `prasarana`  (
  `id_prasarana` int(11) NOT NULL AUTO_INCREMENT,
  `prasarana` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `idkondisiprasarana_fk` int(11) NULL DEFAULT NULL,
  `idkelompokprasarana_fk` int(11) NULL DEFAULT NULL,
  `spesifikasi` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `no_inventaris` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `foto` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`id_prasarana`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of prasarana
-- ----------------------------
INSERT INTO `prasarana` VALUES (2, 'Ruang Kelas INKUBASI', 3, 4, '', 'INK', '');
INSERT INTO `prasarana` VALUES (3, 'Laboratorium Komputer', 3, 5, '', 'LAB', '');
INSERT INTO `prasarana` VALUES (4, 'Loker Laptop', 3, 6, '', 'L4', '');

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
  `create_at` timestamp(0) NULL DEFAULT current_timestamp(),
  `idtahunajaran_fk` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_presensi_guru`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of presensi_guru
-- ----------------------------
INSERT INTO `presensi_guru` VALUES (3, 46, '2023-05-17', '10:26:40', '10:27:10', '2023-05-17 10:26:40', 7);
INSERT INTO `presensi_guru` VALUES (4, 45, '2023-07-14', '13:50:57', '13:51:26', '2023-07-14 13:50:57', 7);
INSERT INTO `presensi_guru` VALUES (5, 31, '2023-07-14', '14:34:44', '00:00:00', '2023-07-14 14:34:44', 7);
INSERT INTO `presensi_guru` VALUES (6, 29, '2023-07-17', '12:56:34', '00:00:00', '2023-07-17 12:56:34', 7);

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
  `create_at` timestamp(0) NULL DEFAULT current_timestamp(),
  `idtahunajaran_fk` int(11) NULL DEFAULT NULL,
  `idkelas_fk` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_presensi_harian`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 826 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of presensi_harian
-- ----------------------------
INSERT INTO `presensi_harian` VALUES (70, 22, 745, 'A', '', '2023-05-16', '2023-05-16 10:13:31', 7, 49);
INSERT INTO `presensi_harian` VALUES (71, 22, 746, 'M', '', '2023-05-16', '2023-05-16 10:13:31', 7, 49);
INSERT INTO `presensi_harian` VALUES (72, 22, 747, 'M', '', '2023-05-16', '2023-05-16 10:13:31', 7, 49);
INSERT INTO `presensi_harian` VALUES (73, 22, 748, 'A', '', '2023-05-16', '2023-05-16 10:13:31', 7, 49);
INSERT INTO `presensi_harian` VALUES (74, 22, 749, 'M', '', '2023-05-16', '2023-05-16 10:13:31', 7, 49);
INSERT INTO `presensi_harian` VALUES (75, 22, 750, 'M', '', '2023-05-16', '2023-05-16 10:13:31', 7, 49);
INSERT INTO `presensi_harian` VALUES (76, 22, 751, 'M', '', '2023-05-16', '2023-05-16 10:13:31', 7, 49);
INSERT INTO `presensi_harian` VALUES (77, 22, 752, 'M', '', '2023-05-16', '2023-05-16 10:13:31', 7, 49);
INSERT INTO `presensi_harian` VALUES (78, 22, 753, 'I', '', '2023-05-16', '2023-05-16 10:13:31', 7, 49);
INSERT INTO `presensi_harian` VALUES (79, 22, 754, 'M', '', '2023-05-16', '2023-05-16 10:13:31', 7, 49);
INSERT INTO `presensi_harian` VALUES (80, 22, 755, 'A', '', '2023-05-16', '2023-05-16 10:13:31', 7, 49);
INSERT INTO `presensi_harian` VALUES (81, 22, 756, 'A', '', '2023-05-16', '2023-05-16 10:13:31', 7, 49);
INSERT INTO `presensi_harian` VALUES (82, 22, 757, 'A', '', '2023-05-16', '2023-05-16 10:13:31', 7, 49);
INSERT INTO `presensi_harian` VALUES (83, 22, 758, 'M', '', '2023-05-16', '2023-05-16 10:13:31', 7, 49);
INSERT INTO `presensi_harian` VALUES (84, 22, 759, 'A', '', '2023-05-16', '2023-05-16 10:13:31', 7, 49);
INSERT INTO `presensi_harian` VALUES (85, 22, 760, 'A', '', '2023-05-16', '2023-05-16 10:13:31', 7, 49);
INSERT INTO `presensi_harian` VALUES (86, 22, 761, 'A', '', '2023-05-16', '2023-05-16 10:13:31', 7, 49);
INSERT INTO `presensi_harian` VALUES (87, 22, 762, 'M', '', '2023-05-16', '2023-05-16 10:13:31', 7, 49);
INSERT INTO `presensi_harian` VALUES (88, 22, 763, 'M', '', '2023-05-16', '2023-05-16 10:13:31', 7, 49);
INSERT INTO `presensi_harian` VALUES (89, 22, 764, 'M', '', '2023-05-16', '2023-05-16 10:13:31', 7, 49);
INSERT INTO `presensi_harian` VALUES (90, 22, 765, 'A', '', '2023-05-16', '2023-05-16 10:13:31', 7, 49);
INSERT INTO `presensi_harian` VALUES (91, 22, 766, 'M', '', '2023-05-16', '2023-05-16 10:13:31', 7, 49);
INSERT INTO `presensi_harian` VALUES (92, 22, 767, 'M', '', '2023-05-16', '2023-05-16 10:13:31', 7, 49);
INSERT INTO `presensi_harian` VALUES (93, 22, 768, 'M', '', '2023-05-16', '2023-05-16 10:13:31', 7, 49);
INSERT INTO `presensi_harian` VALUES (94, 22, 769, 'M', '', '2023-05-16', '2023-05-16 10:13:31', 7, 49);
INSERT INTO `presensi_harian` VALUES (95, 10, 877, 'M', '', '2023-05-16', '2023-05-16 10:19:47', 7, 56);
INSERT INTO `presensi_harian` VALUES (96, 10, 878, 'A', '', '2023-05-16', '2023-05-16 10:19:47', 7, 56);
INSERT INTO `presensi_harian` VALUES (97, 10, 879, 'M', '', '2023-05-16', '2023-05-16 10:19:47', 7, 56);
INSERT INTO `presensi_harian` VALUES (98, 10, 880, 'M', '', '2023-05-16', '2023-05-16 10:19:47', 7, 56);
INSERT INTO `presensi_harian` VALUES (99, 10, 881, 'M', '', '2023-05-16', '2023-05-16 10:19:47', 7, 56);
INSERT INTO `presensi_harian` VALUES (100, 10, 882, 'M', '', '2023-05-16', '2023-05-16 10:19:47', 7, 56);
INSERT INTO `presensi_harian` VALUES (101, 10, 883, 'M', '', '2023-05-16', '2023-05-16 10:19:47', 7, 56);
INSERT INTO `presensi_harian` VALUES (102, 10, 884, 'A', '', '2023-05-16', '2023-05-16 10:19:47', 7, 56);
INSERT INTO `presensi_harian` VALUES (103, 10, 885, 'A', '', '2023-05-16', '2023-05-16 10:19:47', 7, 56);
INSERT INTO `presensi_harian` VALUES (104, 10, 886, 'M', '', '2023-05-16', '2023-05-16 10:19:47', 7, 56);
INSERT INTO `presensi_harian` VALUES (105, 10, 887, 'M', '', '2023-05-16', '2023-05-16 10:19:47', 7, 56);
INSERT INTO `presensi_harian` VALUES (106, 11, 788, 'M', '', '2023-05-16', '2023-05-16 10:28:59', 7, 54);
INSERT INTO `presensi_harian` VALUES (107, 11, 789, 'M', '', '2023-05-16', '2023-05-16 10:28:59', 7, 54);
INSERT INTO `presensi_harian` VALUES (108, 11, 790, 'M', '', '2023-05-16', '2023-05-16 10:28:59', 7, 54);
INSERT INTO `presensi_harian` VALUES (109, 11, 791, 'M', '', '2023-05-16', '2023-05-16 10:28:59', 7, 54);
INSERT INTO `presensi_harian` VALUES (110, 11, 792, 'S', '', '2023-05-16', '2023-05-16 10:28:59', 7, 54);
INSERT INTO `presensi_harian` VALUES (111, 11, 793, 'M', '', '2023-05-16', '2023-05-16 10:28:59', 7, 54);
INSERT INTO `presensi_harian` VALUES (112, 11, 794, 'M', '', '2023-05-16', '2023-05-16 10:28:59', 7, 54);
INSERT INTO `presensi_harian` VALUES (113, 11, 795, 'M', '', '2023-05-16', '2023-05-16 10:28:59', 7, 54);
INSERT INTO `presensi_harian` VALUES (114, 11, 796, 'A', '', '2023-05-16', '2023-05-16 10:28:59', 7, 54);
INSERT INTO `presensi_harian` VALUES (115, 11, 797, 'M', '', '2023-05-16', '2023-05-16 10:28:59', 7, 54);
INSERT INTO `presensi_harian` VALUES (116, 11, 798, 'M', '', '2023-05-16', '2023-05-16 10:28:59', 7, 54);
INSERT INTO `presensi_harian` VALUES (117, 11, 799, 'A', '', '2023-05-16', '2023-05-16 10:28:59', 7, 54);
INSERT INTO `presensi_harian` VALUES (118, 11, 800, 'M', '', '2023-05-16', '2023-05-16 10:28:59', 7, 54);
INSERT INTO `presensi_harian` VALUES (119, 11, 801, 'M', '', '2023-05-16', '2023-05-16 10:28:59', 7, 54);
INSERT INTO `presensi_harian` VALUES (120, 11, 802, 'M', '', '2023-05-16', '2023-05-16 10:28:59', 7, 54);
INSERT INTO `presensi_harian` VALUES (121, 11, 803, 'M', '', '2023-05-16', '2023-05-16 10:28:59', 7, 54);
INSERT INTO `presensi_harian` VALUES (122, 11, 804, 'M', '', '2023-05-16', '2023-05-16 10:29:00', 7, 54);
INSERT INTO `presensi_harian` VALUES (123, 11, 805, 'M', '', '2023-05-16', '2023-05-16 10:29:00', 7, 54);
INSERT INTO `presensi_harian` VALUES (124, 11, 806, 'A', '', '2023-05-16', '2023-05-16 10:29:00', 7, 54);
INSERT INTO `presensi_harian` VALUES (125, 11, 807, 'A', '', '2023-05-16', '2023-05-16 10:29:00', 7, 54);
INSERT INTO `presensi_harian` VALUES (126, 11, 808, 'A', '', '2023-05-16', '2023-05-16 10:29:00', 7, 54);
INSERT INTO `presensi_harian` VALUES (127, 24, 788, 'M', '', '2023-05-16', '2023-05-16 10:33:01', 7, 54);
INSERT INTO `presensi_harian` VALUES (128, 24, 789, 'M', '', '2023-05-16', '2023-05-16 10:33:01', 7, 54);
INSERT INTO `presensi_harian` VALUES (129, 24, 790, 'M', '', '2023-05-16', '2023-05-16 10:33:01', 7, 54);
INSERT INTO `presensi_harian` VALUES (130, 24, 791, 'M', '', '2023-05-16', '2023-05-16 10:33:01', 7, 54);
INSERT INTO `presensi_harian` VALUES (131, 24, 792, 'S', '', '2023-05-16', '2023-05-16 10:33:01', 7, 54);
INSERT INTO `presensi_harian` VALUES (132, 24, 793, 'M', '', '2023-05-16', '2023-05-16 10:33:01', 7, 54);
INSERT INTO `presensi_harian` VALUES (133, 24, 794, 'M', '', '2023-05-16', '2023-05-16 10:33:01', 7, 54);
INSERT INTO `presensi_harian` VALUES (134, 24, 795, 'M', '', '2023-05-16', '2023-05-16 10:33:01', 7, 54);
INSERT INTO `presensi_harian` VALUES (135, 24, 796, 'A', '', '2023-05-16', '2023-05-16 10:33:01', 7, 54);
INSERT INTO `presensi_harian` VALUES (136, 24, 797, 'M', '', '2023-05-16', '2023-05-16 10:33:01', 7, 54);
INSERT INTO `presensi_harian` VALUES (137, 24, 798, 'M', '', '2023-05-16', '2023-05-16 10:33:01', 7, 54);
INSERT INTO `presensi_harian` VALUES (138, 24, 799, 'A', '', '2023-05-16', '2023-05-16 10:33:01', 7, 54);
INSERT INTO `presensi_harian` VALUES (139, 24, 800, 'M', '', '2023-05-16', '2023-05-16 10:33:01', 7, 54);
INSERT INTO `presensi_harian` VALUES (140, 24, 801, 'M', '', '2023-05-16', '2023-05-16 10:33:01', 7, 54);
INSERT INTO `presensi_harian` VALUES (141, 24, 802, 'M', '', '2023-05-16', '2023-05-16 10:33:01', 7, 54);
INSERT INTO `presensi_harian` VALUES (142, 24, 803, 'M', '', '2023-05-16', '2023-05-16 10:33:01', 7, 54);
INSERT INTO `presensi_harian` VALUES (143, 24, 804, 'M', '', '2023-05-16', '2023-05-16 10:33:01', 7, 54);
INSERT INTO `presensi_harian` VALUES (144, 24, 805, 'M', '', '2023-05-16', '2023-05-16 10:33:01', 7, 54);
INSERT INTO `presensi_harian` VALUES (145, 24, 806, 'A', '', '2023-05-16', '2023-05-16 10:33:01', 7, 54);
INSERT INTO `presensi_harian` VALUES (146, 24, 807, 'A', '', '2023-05-16', '2023-05-16 10:33:01', 7, 54);
INSERT INTO `presensi_harian` VALUES (147, 24, 808, 'A', '', '2023-05-16', '2023-05-16 10:33:01', 7, 54);
INSERT INTO `presensi_harian` VALUES (148, 8, 745, 'A', '', '2023-05-16', '2023-05-16 10:40:50', 7, 49);
INSERT INTO `presensi_harian` VALUES (149, 8, 746, 'M', '', '2023-05-16', '2023-05-16 10:40:50', 7, 49);
INSERT INTO `presensi_harian` VALUES (150, 8, 747, 'M', '', '2023-05-16', '2023-05-16 10:40:51', 7, 49);
INSERT INTO `presensi_harian` VALUES (151, 8, 748, 'A', '', '2023-05-16', '2023-05-16 10:40:51', 7, 49);
INSERT INTO `presensi_harian` VALUES (152, 8, 749, 'M', '', '2023-05-16', '2023-05-16 10:40:51', 7, 49);
INSERT INTO `presensi_harian` VALUES (153, 8, 750, 'M', '', '2023-05-16', '2023-05-16 10:40:51', 7, 49);
INSERT INTO `presensi_harian` VALUES (154, 8, 751, 'M', '', '2023-05-16', '2023-05-16 10:40:51', 7, 49);
INSERT INTO `presensi_harian` VALUES (155, 8, 752, 'M', '', '2023-05-16', '2023-05-16 10:40:51', 7, 49);
INSERT INTO `presensi_harian` VALUES (156, 8, 753, 'I', '', '2023-05-16', '2023-05-16 10:40:51', 7, 49);
INSERT INTO `presensi_harian` VALUES (157, 8, 754, 'M', '', '2023-05-16', '2023-05-16 10:40:51', 7, 49);
INSERT INTO `presensi_harian` VALUES (158, 8, 755, 'A', '', '2023-05-16', '2023-05-16 10:40:51', 7, 49);
INSERT INTO `presensi_harian` VALUES (159, 8, 756, 'A', '', '2023-05-16', '2023-05-16 10:40:51', 7, 49);
INSERT INTO `presensi_harian` VALUES (160, 8, 757, 'A', '', '2023-05-16', '2023-05-16 10:40:51', 7, 49);
INSERT INTO `presensi_harian` VALUES (161, 8, 758, 'M', '', '2023-05-16', '2023-05-16 10:40:51', 7, 49);
INSERT INTO `presensi_harian` VALUES (162, 8, 759, 'A', '', '2023-05-16', '2023-05-16 10:40:51', 7, 49);
INSERT INTO `presensi_harian` VALUES (163, 8, 760, 'A', '', '2023-05-16', '2023-05-16 10:40:51', 7, 49);
INSERT INTO `presensi_harian` VALUES (164, 8, 761, 'A', '', '2023-05-16', '2023-05-16 10:40:51', 7, 49);
INSERT INTO `presensi_harian` VALUES (165, 8, 762, 'M', '', '2023-05-16', '2023-05-16 10:40:51', 7, 49);
INSERT INTO `presensi_harian` VALUES (166, 8, 763, 'M', '', '2023-05-16', '2023-05-16 10:40:51', 7, 49);
INSERT INTO `presensi_harian` VALUES (167, 8, 764, 'M', '', '2023-05-16', '2023-05-16 10:40:51', 7, 49);
INSERT INTO `presensi_harian` VALUES (168, 8, 765, 'A', '', '2023-05-16', '2023-05-16 10:40:51', 7, 49);
INSERT INTO `presensi_harian` VALUES (169, 8, 766, 'M', '', '2023-05-16', '2023-05-16 10:40:51', 7, 49);
INSERT INTO `presensi_harian` VALUES (170, 8, 767, 'M', '', '2023-05-16', '2023-05-16 10:40:51', 7, 49);
INSERT INTO `presensi_harian` VALUES (171, 8, 768, 'M', '', '2023-05-16', '2023-05-16 10:40:51', 7, 49);
INSERT INTO `presensi_harian` VALUES (172, 8, 769, 'M', '', '2023-05-16', '2023-05-16 10:40:51', 7, 49);
INSERT INTO `presensi_harian` VALUES (173, 10, 745, 'A', '', '2023-05-16', '2023-05-16 10:42:11', 7, 49);
INSERT INTO `presensi_harian` VALUES (174, 10, 746, 'M', '', '2023-05-16', '2023-05-16 10:42:11', 7, 49);
INSERT INTO `presensi_harian` VALUES (175, 10, 747, 'M', '', '2023-05-16', '2023-05-16 10:42:11', 7, 49);
INSERT INTO `presensi_harian` VALUES (176, 10, 748, 'A', '', '2023-05-16', '2023-05-16 10:42:11', 7, 49);
INSERT INTO `presensi_harian` VALUES (177, 10, 749, 'M', '', '2023-05-16', '2023-05-16 10:42:11', 7, 49);
INSERT INTO `presensi_harian` VALUES (178, 10, 750, 'M', '', '2023-05-16', '2023-05-16 10:42:11', 7, 49);
INSERT INTO `presensi_harian` VALUES (179, 10, 751, 'M', '', '2023-05-16', '2023-05-16 10:42:11', 7, 49);
INSERT INTO `presensi_harian` VALUES (180, 10, 752, 'M', '', '2023-05-16', '2023-05-16 10:42:11', 7, 49);
INSERT INTO `presensi_harian` VALUES (181, 10, 753, 'I', '', '2023-05-16', '2023-05-16 10:42:11', 7, 49);
INSERT INTO `presensi_harian` VALUES (182, 10, 754, 'M', '', '2023-05-16', '2023-05-16 10:42:11', 7, 49);
INSERT INTO `presensi_harian` VALUES (183, 10, 755, 'A', '', '2023-05-16', '2023-05-16 10:42:11', 7, 49);
INSERT INTO `presensi_harian` VALUES (184, 10, 756, 'A', '', '2023-05-16', '2023-05-16 10:42:11', 7, 49);
INSERT INTO `presensi_harian` VALUES (185, 10, 757, 'A', '', '2023-05-16', '2023-05-16 10:42:11', 7, 49);
INSERT INTO `presensi_harian` VALUES (186, 10, 758, 'M', '', '2023-05-16', '2023-05-16 10:42:11', 7, 49);
INSERT INTO `presensi_harian` VALUES (187, 10, 759, 'A', '', '2023-05-16', '2023-05-16 10:42:11', 7, 49);
INSERT INTO `presensi_harian` VALUES (188, 10, 760, 'A', '', '2023-05-16', '2023-05-16 10:42:11', 7, 49);
INSERT INTO `presensi_harian` VALUES (189, 10, 761, 'A', '', '2023-05-16', '2023-05-16 10:42:11', 7, 49);
INSERT INTO `presensi_harian` VALUES (190, 10, 762, 'A', '', '2023-05-16', '2023-05-16 10:42:11', 7, 49);
INSERT INTO `presensi_harian` VALUES (191, 10, 763, 'M', '', '2023-05-16', '2023-05-16 10:42:11', 7, 49);
INSERT INTO `presensi_harian` VALUES (192, 10, 764, 'M', '', '2023-05-16', '2023-05-16 10:42:11', 7, 49);
INSERT INTO `presensi_harian` VALUES (193, 10, 765, 'A', '', '2023-05-16', '2023-05-16 10:42:11', 7, 49);
INSERT INTO `presensi_harian` VALUES (194, 10, 766, 'M', '', '2023-05-16', '2023-05-16 10:42:11', 7, 49);
INSERT INTO `presensi_harian` VALUES (195, 10, 767, 'M', '', '2023-05-16', '2023-05-16 10:42:11', 7, 49);
INSERT INTO `presensi_harian` VALUES (196, 10, 768, 'M', '', '2023-05-16', '2023-05-16 10:42:11', 7, 49);
INSERT INTO `presensi_harian` VALUES (197, 10, 769, 'M', '', '2023-05-16', '2023-05-16 10:42:11', 7, 49);
INSERT INTO `presensi_harian` VALUES (198, 21, 877, 'M', '', '2023-05-16', '2023-05-16 10:44:58', 7, 56);
INSERT INTO `presensi_harian` VALUES (199, 21, 878, 'A', '', '2023-05-16', '2023-05-16 10:44:58', 7, 56);
INSERT INTO `presensi_harian` VALUES (200, 21, 879, 'M', '', '2023-05-16', '2023-05-16 10:44:58', 7, 56);
INSERT INTO `presensi_harian` VALUES (201, 21, 880, 'M', '', '2023-05-16', '2023-05-16 10:44:58', 7, 56);
INSERT INTO `presensi_harian` VALUES (202, 21, 881, 'M', '', '2023-05-16', '2023-05-16 10:44:58', 7, 56);
INSERT INTO `presensi_harian` VALUES (203, 21, 882, 'M', '', '2023-05-16', '2023-05-16 10:44:58', 7, 56);
INSERT INTO `presensi_harian` VALUES (204, 21, 883, 'M', '', '2023-05-16', '2023-05-16 10:44:58', 7, 56);
INSERT INTO `presensi_harian` VALUES (205, 21, 884, 'A', '', '2023-05-16', '2023-05-16 10:44:58', 7, 56);
INSERT INTO `presensi_harian` VALUES (206, 21, 885, 'A', '', '2023-05-16', '2023-05-16 10:44:58', 7, 56);
INSERT INTO `presensi_harian` VALUES (207, 21, 886, 'M', '', '2023-05-16', '2023-05-16 10:44:58', 7, 56);
INSERT INTO `presensi_harian` VALUES (208, 21, 887, 'M', '', '2023-05-16', '2023-05-16 10:44:58', 7, 56);
INSERT INTO `presensi_harian` VALUES (209, 7, 877, 'M', '', '2023-05-16', '2023-05-16 10:45:13', 7, 56);
INSERT INTO `presensi_harian` VALUES (210, 7, 878, 'A', '', '2023-05-16', '2023-05-16 10:45:13', 7, 56);
INSERT INTO `presensi_harian` VALUES (211, 7, 879, 'M', '', '2023-05-16', '2023-05-16 10:45:13', 7, 56);
INSERT INTO `presensi_harian` VALUES (212, 7, 880, 'M', '', '2023-05-16', '2023-05-16 10:45:13', 7, 56);
INSERT INTO `presensi_harian` VALUES (213, 7, 881, 'M', '', '2023-05-16', '2023-05-16 10:45:13', 7, 56);
INSERT INTO `presensi_harian` VALUES (214, 7, 882, 'M', '', '2023-05-16', '2023-05-16 10:45:13', 7, 56);
INSERT INTO `presensi_harian` VALUES (215, 7, 883, 'M', '', '2023-05-16', '2023-05-16 10:45:13', 7, 56);
INSERT INTO `presensi_harian` VALUES (216, 7, 884, 'A', '', '2023-05-16', '2023-05-16 10:45:13', 7, 56);
INSERT INTO `presensi_harian` VALUES (217, 7, 885, 'A', '', '2023-05-16', '2023-05-16 10:45:13', 7, 56);
INSERT INTO `presensi_harian` VALUES (218, 7, 886, 'M', '', '2023-05-16', '2023-05-16 10:45:13', 7, 56);
INSERT INTO `presensi_harian` VALUES (219, 7, 887, 'M', '', '2023-05-16', '2023-05-16 10:45:13', 7, 56);
INSERT INTO `presensi_harian` VALUES (220, 12, 770, 'A', '', '2023-05-16', '2023-05-16 11:25:46', 7, 50);
INSERT INTO `presensi_harian` VALUES (221, 12, 771, 'M', '', '2023-05-16', '2023-05-16 11:25:46', 7, 50);
INSERT INTO `presensi_harian` VALUES (222, 12, 772, 'A', '', '2023-05-16', '2023-05-16 11:25:46', 7, 50);
INSERT INTO `presensi_harian` VALUES (223, 12, 773, 'M', '', '2023-05-16', '2023-05-16 11:25:46', 7, 50);
INSERT INTO `presensi_harian` VALUES (224, 12, 774, 'M', '', '2023-05-16', '2023-05-16 11:25:46', 7, 50);
INSERT INTO `presensi_harian` VALUES (225, 12, 775, 'A', '', '2023-05-16', '2023-05-16 11:25:46', 7, 50);
INSERT INTO `presensi_harian` VALUES (226, 12, 776, 'M', '', '2023-05-16', '2023-05-16 11:25:46', 7, 50);
INSERT INTO `presensi_harian` VALUES (227, 12, 777, 'M', '', '2023-05-16', '2023-05-16 11:25:46', 7, 50);
INSERT INTO `presensi_harian` VALUES (228, 12, 778, 'M', '', '2023-05-16', '2023-05-16 11:25:46', 7, 50);
INSERT INTO `presensi_harian` VALUES (229, 12, 779, 'M', '', '2023-05-16', '2023-05-16 11:25:46', 7, 50);
INSERT INTO `presensi_harian` VALUES (230, 12, 780, 'M', '', '2023-05-16', '2023-05-16 11:25:46', 7, 50);
INSERT INTO `presensi_harian` VALUES (231, 12, 781, 'A', '', '2023-05-16', '2023-05-16 11:25:46', 7, 50);
INSERT INTO `presensi_harian` VALUES (232, 12, 782, 'A', '', '2023-05-16', '2023-05-16 11:25:46', 7, 50);
INSERT INTO `presensi_harian` VALUES (233, 12, 783, 'M', '', '2023-05-16', '2023-05-16 11:25:46', 7, 50);
INSERT INTO `presensi_harian` VALUES (234, 12, 784, 'I', '', '2023-05-16', '2023-05-16 11:25:46', 7, 50);
INSERT INTO `presensi_harian` VALUES (235, 12, 785, 'M', '', '2023-05-16', '2023-05-16 11:25:47', 7, 50);
INSERT INTO `presensi_harian` VALUES (236, 12, 786, 'I', '', '2023-05-16', '2023-05-16 11:25:47', 7, 50);
INSERT INTO `presensi_harian` VALUES (237, 12, 787, 'M', '', '2023-05-16', '2023-05-16 11:25:47', 7, 50);
INSERT INTO `presensi_harian` VALUES (238, 7, 770, 'A', '', '2023-05-16', '2023-05-16 11:27:54', 7, 50);
INSERT INTO `presensi_harian` VALUES (239, 7, 771, 'M', '', '2023-05-16', '2023-05-16 11:27:54', 7, 50);
INSERT INTO `presensi_harian` VALUES (240, 7, 772, 'A', '', '2023-05-16', '2023-05-16 11:27:54', 7, 50);
INSERT INTO `presensi_harian` VALUES (241, 7, 773, 'M', '', '2023-05-16', '2023-05-16 11:27:54', 7, 50);
INSERT INTO `presensi_harian` VALUES (242, 7, 774, 'M', '', '2023-05-16', '2023-05-16 11:27:54', 7, 50);
INSERT INTO `presensi_harian` VALUES (243, 7, 775, 'A', '', '2023-05-16', '2023-05-16 11:27:54', 7, 50);
INSERT INTO `presensi_harian` VALUES (244, 7, 776, 'M', '', '2023-05-16', '2023-05-16 11:27:54', 7, 50);
INSERT INTO `presensi_harian` VALUES (245, 7, 777, 'M', '', '2023-05-16', '2023-05-16 11:27:54', 7, 50);
INSERT INTO `presensi_harian` VALUES (246, 7, 778, 'M', '', '2023-05-16', '2023-05-16 11:27:54', 7, 50);
INSERT INTO `presensi_harian` VALUES (247, 7, 779, 'M', '', '2023-05-16', '2023-05-16 11:27:55', 7, 50);
INSERT INTO `presensi_harian` VALUES (248, 7, 780, 'M', '', '2023-05-16', '2023-05-16 11:27:55', 7, 50);
INSERT INTO `presensi_harian` VALUES (249, 7, 781, 'A', '', '2023-05-16', '2023-05-16 11:27:55', 7, 50);
INSERT INTO `presensi_harian` VALUES (250, 7, 782, 'A', '', '2023-05-16', '2023-05-16 11:27:55', 7, 50);
INSERT INTO `presensi_harian` VALUES (251, 7, 783, 'M', '', '2023-05-16', '2023-05-16 11:27:55', 7, 50);
INSERT INTO `presensi_harian` VALUES (252, 7, 784, 'I', '', '2023-05-16', '2023-05-16 11:27:55', 7, 50);
INSERT INTO `presensi_harian` VALUES (253, 7, 785, 'M', '', '2023-05-16', '2023-05-16 11:27:55', 7, 50);
INSERT INTO `presensi_harian` VALUES (254, 7, 786, 'I', '', '2023-05-16', '2023-05-16 11:27:55', 7, 50);
INSERT INTO `presensi_harian` VALUES (255, 7, 787, 'M', '', '2023-05-16', '2023-05-16 11:27:55', 7, 50);
INSERT INTO `presensi_harian` VALUES (256, 24, 745, 'A', '', '2023-05-17', '2023-05-17 09:23:00', 7, 49);
INSERT INTO `presensi_harian` VALUES (257, 24, 746, 'A', '', '2023-05-17', '2023-05-17 09:23:00', 7, 49);
INSERT INTO `presensi_harian` VALUES (258, 24, 747, 'A', '', '2023-05-17', '2023-05-17 09:23:00', 7, 49);
INSERT INTO `presensi_harian` VALUES (259, 24, 748, 'M', '', '2023-05-17', '2023-05-17 09:23:00', 7, 49);
INSERT INTO `presensi_harian` VALUES (260, 24, 749, 'M', '', '2023-05-17', '2023-05-17 09:23:00', 7, 49);
INSERT INTO `presensi_harian` VALUES (261, 24, 750, 'A', '', '2023-05-17', '2023-05-17 09:23:00', 7, 49);
INSERT INTO `presensi_harian` VALUES (262, 24, 751, 'A', '', '2023-05-17', '2023-05-17 09:23:00', 7, 49);
INSERT INTO `presensi_harian` VALUES (263, 24, 752, 'M', '', '2023-05-17', '2023-05-17 09:23:00', 7, 49);
INSERT INTO `presensi_harian` VALUES (264, 24, 753, 'M', '', '2023-05-17', '2023-05-17 09:23:00', 7, 49);
INSERT INTO `presensi_harian` VALUES (265, 24, 754, 'M', '', '2023-05-17', '2023-05-17 09:23:00', 7, 49);
INSERT INTO `presensi_harian` VALUES (266, 24, 755, 'A', '', '2023-05-17', '2023-05-17 09:23:00', 7, 49);
INSERT INTO `presensi_harian` VALUES (267, 24, 756, 'A', '', '2023-05-17', '2023-05-17 09:23:00', 7, 49);
INSERT INTO `presensi_harian` VALUES (268, 24, 757, 'M', '', '2023-05-17', '2023-05-17 09:23:00', 7, 49);
INSERT INTO `presensi_harian` VALUES (269, 24, 758, 'M', '', '2023-05-17', '2023-05-17 09:23:00', 7, 49);
INSERT INTO `presensi_harian` VALUES (270, 24, 759, 'A', '', '2023-05-17', '2023-05-17 09:23:00', 7, 49);
INSERT INTO `presensi_harian` VALUES (271, 24, 760, 'M', '', '2023-05-17', '2023-05-17 09:23:00', 7, 49);
INSERT INTO `presensi_harian` VALUES (272, 24, 761, 'M', '', '2023-05-17', '2023-05-17 09:23:00', 7, 49);
INSERT INTO `presensi_harian` VALUES (273, 24, 762, 'A', '', '2023-05-17', '2023-05-17 09:23:00', 7, 49);
INSERT INTO `presensi_harian` VALUES (274, 24, 763, 'M', '', '2023-05-17', '2023-05-17 09:23:00', 7, 49);
INSERT INTO `presensi_harian` VALUES (275, 24, 764, 'M', '', '2023-05-17', '2023-05-17 09:23:00', 7, 49);
INSERT INTO `presensi_harian` VALUES (276, 24, 765, 'A', '', '2023-05-17', '2023-05-17 09:23:00', 7, 49);
INSERT INTO `presensi_harian` VALUES (277, 24, 766, 'M', '', '2023-05-17', '2023-05-17 09:23:00', 7, 49);
INSERT INTO `presensi_harian` VALUES (278, 24, 767, 'M', '', '2023-05-17', '2023-05-17 09:23:00', 7, 49);
INSERT INTO `presensi_harian` VALUES (279, 24, 768, 'M', '', '2023-05-17', '2023-05-17 09:23:00', 7, 49);
INSERT INTO `presensi_harian` VALUES (280, 24, 769, 'M', '', '2023-05-17', '2023-05-17 09:23:00', 7, 49);
INSERT INTO `presensi_harian` VALUES (281, 14, 877, 'M', '', '2023-05-17', '2023-05-17 09:31:47', 7, 56);
INSERT INTO `presensi_harian` VALUES (282, 14, 878, 'M', '', '2023-05-17', '2023-05-17 09:31:47', 7, 56);
INSERT INTO `presensi_harian` VALUES (283, 14, 879, 'M', '', '2023-05-17', '2023-05-17 09:31:47', 7, 56);
INSERT INTO `presensi_harian` VALUES (284, 14, 880, 'M', '', '2023-05-17', '2023-05-17 09:31:47', 7, 56);
INSERT INTO `presensi_harian` VALUES (285, 14, 881, 'M', '', '2023-05-17', '2023-05-17 09:31:47', 7, 56);
INSERT INTO `presensi_harian` VALUES (286, 14, 882, 'M', '', '2023-05-17', '2023-05-17 09:31:47', 7, 56);
INSERT INTO `presensi_harian` VALUES (287, 14, 883, 'M', '', '2023-05-17', '2023-05-17 09:31:47', 7, 56);
INSERT INTO `presensi_harian` VALUES (288, 14, 884, 'M', '', '2023-05-17', '2023-05-17 09:31:47', 7, 56);
INSERT INTO `presensi_harian` VALUES (289, 14, 885, 'A', '', '2023-05-17', '2023-05-17 09:31:47', 7, 56);
INSERT INTO `presensi_harian` VALUES (290, 14, 886, 'M', '', '2023-05-17', '2023-05-17 09:31:47', 7, 56);
INSERT INTO `presensi_harian` VALUES (291, 14, 887, 'A', '', '2023-05-17', '2023-05-17 09:31:47', 7, 56);
INSERT INTO `presensi_harian` VALUES (292, 10, 770, 'M', '', '2023-05-17', '2023-05-17 10:25:55', 7, 50);
INSERT INTO `presensi_harian` VALUES (293, 10, 771, 'M', '', '2023-05-17', '2023-05-17 10:25:55', 7, 50);
INSERT INTO `presensi_harian` VALUES (294, 10, 772, 'M', '', '2023-05-17', '2023-05-17 10:25:55', 7, 50);
INSERT INTO `presensi_harian` VALUES (295, 10, 773, 'M', '', '2023-05-17', '2023-05-17 10:25:55', 7, 50);
INSERT INTO `presensi_harian` VALUES (296, 10, 774, 'M', '', '2023-05-17', '2023-05-17 10:25:55', 7, 50);
INSERT INTO `presensi_harian` VALUES (297, 10, 775, 'M', '', '2023-05-17', '2023-05-17 10:25:55', 7, 50);
INSERT INTO `presensi_harian` VALUES (298, 10, 776, 'A', '', '2023-05-17', '2023-05-17 10:25:55', 7, 50);
INSERT INTO `presensi_harian` VALUES (299, 10, 777, 'M', '', '2023-05-17', '2023-05-17 10:25:55', 7, 50);
INSERT INTO `presensi_harian` VALUES (300, 10, 778, 'M', '', '2023-05-17', '2023-05-17 10:25:56', 7, 50);
INSERT INTO `presensi_harian` VALUES (301, 10, 779, 'M', '', '2023-05-17', '2023-05-17 10:25:56', 7, 50);
INSERT INTO `presensi_harian` VALUES (302, 10, 780, 'M', '', '2023-05-17', '2023-05-17 10:25:56', 7, 50);
INSERT INTO `presensi_harian` VALUES (303, 10, 781, 'M', '', '2023-05-17', '2023-05-17 10:25:56', 7, 50);
INSERT INTO `presensi_harian` VALUES (304, 10, 782, 'S', '', '2023-05-17', '2023-05-17 10:25:56', 7, 50);
INSERT INTO `presensi_harian` VALUES (305, 10, 783, 'M', '', '2023-05-17', '2023-05-17 10:25:56', 7, 50);
INSERT INTO `presensi_harian` VALUES (306, 10, 784, 'A', '', '2023-05-17', '2023-05-17 10:25:56', 7, 50);
INSERT INTO `presensi_harian` VALUES (307, 10, 785, 'M', '', '2023-05-17', '2023-05-17 10:25:56', 7, 50);
INSERT INTO `presensi_harian` VALUES (308, 10, 786, 'A', '', '2023-05-17', '2023-05-17 10:25:56', 7, 50);
INSERT INTO `presensi_harian` VALUES (309, 10, 787, 'S', '', '2023-05-17', '2023-05-17 10:25:56', 7, 50);
INSERT INTO `presensi_harian` VALUES (310, 12, 745, 'M', '', '2023-05-17', '2023-05-17 10:34:28', 7, 49);
INSERT INTO `presensi_harian` VALUES (311, 12, 746, 'S', '', '2023-05-17', '2023-05-17 10:34:28', 7, 49);
INSERT INTO `presensi_harian` VALUES (312, 12, 747, 'I', '', '2023-05-17', '2023-05-17 10:34:28', 7, 49);
INSERT INTO `presensi_harian` VALUES (313, 12, 748, 'M', '', '2023-05-17', '2023-05-17 10:34:28', 7, 49);
INSERT INTO `presensi_harian` VALUES (314, 12, 749, 'M', '', '2023-05-17', '2023-05-17 10:34:28', 7, 49);
INSERT INTO `presensi_harian` VALUES (315, 12, 750, 'S', '', '2023-05-17', '2023-05-17 10:34:28', 7, 49);
INSERT INTO `presensi_harian` VALUES (316, 12, 751, 'M', '', '2023-05-17', '2023-05-17 10:34:28', 7, 49);
INSERT INTO `presensi_harian` VALUES (317, 12, 752, 'M', '', '2023-05-17', '2023-05-17 10:34:28', 7, 49);
INSERT INTO `presensi_harian` VALUES (318, 12, 753, 'I', '', '2023-05-17', '2023-05-17 10:34:28', 7, 49);
INSERT INTO `presensi_harian` VALUES (319, 12, 754, 'M', '', '2023-05-17', '2023-05-17 10:34:28', 7, 49);
INSERT INTO `presensi_harian` VALUES (320, 12, 755, 'S', '', '2023-05-17', '2023-05-17 10:34:28', 7, 49);
INSERT INTO `presensi_harian` VALUES (321, 12, 756, 'A', '', '2023-05-17', '2023-05-17 10:34:28', 7, 49);
INSERT INTO `presensi_harian` VALUES (322, 12, 757, 'M', '', '2023-05-17', '2023-05-17 10:34:29', 7, 49);
INSERT INTO `presensi_harian` VALUES (323, 12, 758, 'M', '', '2023-05-17', '2023-05-17 10:34:29', 7, 49);
INSERT INTO `presensi_harian` VALUES (324, 12, 759, 'A', '', '2023-05-17', '2023-05-17 10:34:29', 7, 49);
INSERT INTO `presensi_harian` VALUES (325, 12, 760, 'I', '', '2023-05-17', '2023-05-17 10:34:29', 7, 49);
INSERT INTO `presensi_harian` VALUES (326, 12, 761, 'M', '', '2023-05-17', '2023-05-17 10:34:29', 7, 49);
INSERT INTO `presensi_harian` VALUES (327, 12, 762, 'A', '', '2023-05-17', '2023-05-17 10:34:29', 7, 49);
INSERT INTO `presensi_harian` VALUES (328, 12, 763, 'M', '', '2023-05-17', '2023-05-17 10:34:29', 7, 49);
INSERT INTO `presensi_harian` VALUES (329, 12, 764, 'M', '', '2023-05-17', '2023-05-17 10:34:29', 7, 49);
INSERT INTO `presensi_harian` VALUES (330, 12, 765, 'I', '', '2023-05-17', '2023-05-17 10:34:29', 7, 49);
INSERT INTO `presensi_harian` VALUES (331, 12, 766, 'M', '', '2023-05-17', '2023-05-17 10:34:29', 7, 49);
INSERT INTO `presensi_harian` VALUES (332, 12, 767, 'M', '', '2023-05-17', '2023-05-17 10:34:29', 7, 49);
INSERT INTO `presensi_harian` VALUES (333, 12, 768, 'M', '', '2023-05-17', '2023-05-17 10:34:29', 7, 49);
INSERT INTO `presensi_harian` VALUES (334, 12, 769, 'M', '', '2023-05-17', '2023-05-17 10:34:29', 7, 49);
INSERT INTO `presensi_harian` VALUES (335, 27, 745, 'A', '', '2023-06-08', '2023-06-08 10:17:34', 7, 49);
INSERT INTO `presensi_harian` VALUES (336, 27, 746, 'S', '', '2023-06-08', '2023-06-08 10:17:34', 7, 49);
INSERT INTO `presensi_harian` VALUES (337, 27, 747, 'M', '', '2023-06-08', '2023-06-08 10:17:34', 7, 49);
INSERT INTO `presensi_harian` VALUES (338, 27, 748, 'M', '', '2023-06-08', '2023-06-08 10:17:34', 7, 49);
INSERT INTO `presensi_harian` VALUES (339, 27, 749, 'M', '', '2023-06-08', '2023-06-08 10:17:34', 7, 49);
INSERT INTO `presensi_harian` VALUES (340, 27, 750, 'S', '', '2023-06-08', '2023-06-08 10:17:34', 7, 49);
INSERT INTO `presensi_harian` VALUES (341, 27, 751, 'M', '', '2023-06-08', '2023-06-08 10:17:34', 7, 49);
INSERT INTO `presensi_harian` VALUES (342, 27, 752, 'M', '', '2023-06-08', '2023-06-08 10:17:34', 7, 49);
INSERT INTO `presensi_harian` VALUES (343, 27, 753, 'M', '', '2023-06-08', '2023-06-08 10:17:34', 7, 49);
INSERT INTO `presensi_harian` VALUES (344, 27, 754, 'M', '', '2023-06-08', '2023-06-08 10:17:34', 7, 49);
INSERT INTO `presensi_harian` VALUES (345, 27, 755, 'S', '', '2023-06-08', '2023-06-08 10:17:34', 7, 49);
INSERT INTO `presensi_harian` VALUES (346, 27, 756, 'M', '', '2023-06-08', '2023-06-08 10:17:34', 7, 49);
INSERT INTO `presensi_harian` VALUES (347, 27, 757, 'A', '', '2023-06-08', '2023-06-08 10:17:34', 7, 49);
INSERT INTO `presensi_harian` VALUES (348, 27, 758, 'M', '', '2023-06-08', '2023-06-08 10:17:34', 7, 49);
INSERT INTO `presensi_harian` VALUES (349, 27, 759, 'A', '', '2023-06-08', '2023-06-08 10:17:34', 7, 49);
INSERT INTO `presensi_harian` VALUES (350, 27, 760, 'A', '', '2023-06-08', '2023-06-08 10:17:34', 7, 49);
INSERT INTO `presensi_harian` VALUES (351, 27, 761, 'M', '', '2023-06-08', '2023-06-08 10:17:34', 7, 49);
INSERT INTO `presensi_harian` VALUES (352, 27, 762, 'A', '', '2023-06-08', '2023-06-08 10:17:34', 7, 49);
INSERT INTO `presensi_harian` VALUES (353, 27, 763, 'M', '', '2023-06-08', '2023-06-08 10:17:34', 7, 49);
INSERT INTO `presensi_harian` VALUES (354, 27, 764, 'M', '', '2023-06-08', '2023-06-08 10:17:34', 7, 49);
INSERT INTO `presensi_harian` VALUES (355, 27, 765, 'A', '', '2023-06-08', '2023-06-08 10:17:34', 7, 49);
INSERT INTO `presensi_harian` VALUES (356, 27, 766, 'M', '', '2023-06-08', '2023-06-08 10:17:34', 7, 49);
INSERT INTO `presensi_harian` VALUES (357, 27, 767, 'M', '', '2023-06-08', '2023-06-08 10:17:34', 7, 49);
INSERT INTO `presensi_harian` VALUES (358, 27, 768, 'M', '', '2023-06-08', '2023-06-08 10:17:34', 7, 49);
INSERT INTO `presensi_harian` VALUES (359, 27, 769, 'M', '', '2023-06-08', '2023-06-08 10:17:34', 7, 49);
INSERT INTO `presensi_harian` VALUES (360, 21, 745, 'A', '', '2023-06-08', '2023-06-08 10:19:25', 7, 49);
INSERT INTO `presensi_harian` VALUES (361, 21, 746, 'S', '', '2023-06-08', '2023-06-08 10:19:25', 7, 49);
INSERT INTO `presensi_harian` VALUES (362, 21, 747, 'M', '', '2023-06-08', '2023-06-08 10:19:25', 7, 49);
INSERT INTO `presensi_harian` VALUES (363, 21, 748, 'M', '', '2023-06-08', '2023-06-08 10:19:25', 7, 49);
INSERT INTO `presensi_harian` VALUES (364, 21, 749, 'M', '', '2023-06-08', '2023-06-08 10:19:25', 7, 49);
INSERT INTO `presensi_harian` VALUES (365, 21, 750, 'S', '', '2023-06-08', '2023-06-08 10:19:25', 7, 49);
INSERT INTO `presensi_harian` VALUES (366, 21, 751, 'M', '', '2023-06-08', '2023-06-08 10:19:25', 7, 49);
INSERT INTO `presensi_harian` VALUES (367, 21, 752, 'M', '', '2023-06-08', '2023-06-08 10:19:25', 7, 49);
INSERT INTO `presensi_harian` VALUES (368, 21, 753, 'M', '', '2023-06-08', '2023-06-08 10:19:25', 7, 49);
INSERT INTO `presensi_harian` VALUES (369, 21, 754, 'M', '', '2023-06-08', '2023-06-08 10:19:25', 7, 49);
INSERT INTO `presensi_harian` VALUES (370, 21, 755, 'S', '', '2023-06-08', '2023-06-08 10:19:25', 7, 49);
INSERT INTO `presensi_harian` VALUES (371, 21, 756, 'A', '', '2023-06-08', '2023-06-08 10:19:25', 7, 49);
INSERT INTO `presensi_harian` VALUES (372, 21, 757, 'A', '', '2023-06-08', '2023-06-08 10:19:25', 7, 49);
INSERT INTO `presensi_harian` VALUES (373, 21, 758, 'M', '', '2023-06-08', '2023-06-08 10:19:25', 7, 49);
INSERT INTO `presensi_harian` VALUES (374, 21, 759, 'A', '', '2023-06-08', '2023-06-08 10:19:25', 7, 49);
INSERT INTO `presensi_harian` VALUES (375, 21, 760, 'A', '', '2023-06-08', '2023-06-08 10:19:25', 7, 49);
INSERT INTO `presensi_harian` VALUES (376, 21, 761, 'M', '', '2023-06-08', '2023-06-08 10:19:25', 7, 49);
INSERT INTO `presensi_harian` VALUES (377, 21, 762, 'A', '', '2023-06-08', '2023-06-08 10:19:25', 7, 49);
INSERT INTO `presensi_harian` VALUES (378, 21, 763, 'M', '', '2023-06-08', '2023-06-08 10:19:25', 7, 49);
INSERT INTO `presensi_harian` VALUES (379, 21, 764, 'M', '', '2023-06-08', '2023-06-08 10:19:25', 7, 49);
INSERT INTO `presensi_harian` VALUES (380, 21, 765, 'A', '', '2023-06-08', '2023-06-08 10:19:25', 7, 49);
INSERT INTO `presensi_harian` VALUES (381, 21, 766, 'M', '', '2023-06-08', '2023-06-08 10:19:25', 7, 49);
INSERT INTO `presensi_harian` VALUES (382, 21, 767, 'M', '', '2023-06-08', '2023-06-08 10:19:25', 7, 49);
INSERT INTO `presensi_harian` VALUES (383, 21, 768, 'M', '', '2023-06-08', '2023-06-08 10:19:25', 7, 49);
INSERT INTO `presensi_harian` VALUES (384, 21, 769, 'M', '', '2023-06-08', '2023-06-08 10:19:25', 7, 49);
INSERT INTO `presensi_harian` VALUES (385, 27, 838, 'S', '', '2023-06-08', '2023-06-08 10:38:15', 7, 51);
INSERT INTO `presensi_harian` VALUES (386, 27, 839, 'S', '', '2023-06-08', '2023-06-08 10:38:15', 7, 51);
INSERT INTO `presensi_harian` VALUES (387, 27, 840, 'A', '', '2023-06-08', '2023-06-08 10:38:15', 7, 51);
INSERT INTO `presensi_harian` VALUES (388, 27, 841, 'S', '', '2023-06-08', '2023-06-08 10:38:15', 7, 51);
INSERT INTO `presensi_harian` VALUES (389, 27, 842, 'M', '', '2023-06-08', '2023-06-08 10:38:15', 7, 51);
INSERT INTO `presensi_harian` VALUES (390, 27, 843, 'A', '', '2023-06-08', '2023-06-08 10:38:15', 7, 51);
INSERT INTO `presensi_harian` VALUES (391, 27, 844, 'A', '', '2023-06-08', '2023-06-08 10:38:15', 7, 51);
INSERT INTO `presensi_harian` VALUES (392, 27, 845, 'A', '', '2023-06-08', '2023-06-08 10:38:15', 7, 51);
INSERT INTO `presensi_harian` VALUES (393, 27, 846, 'S', '', '2023-06-08', '2023-06-08 10:38:15', 7, 51);
INSERT INTO `presensi_harian` VALUES (394, 27, 847, 'A', '', '2023-06-08', '2023-06-08 10:38:15', 7, 51);
INSERT INTO `presensi_harian` VALUES (395, 27, 848, 'M', '', '2023-06-08', '2023-06-08 10:38:15', 7, 51);
INSERT INTO `presensi_harian` VALUES (396, 27, 849, 'M', '', '2023-06-08', '2023-06-08 10:38:15', 7, 51);
INSERT INTO `presensi_harian` VALUES (397, 27, 850, 'A', '', '2023-06-08', '2023-06-08 10:38:15', 7, 51);
INSERT INTO `presensi_harian` VALUES (398, 27, 851, 'M', '', '2023-06-08', '2023-06-08 10:38:15', 7, 51);
INSERT INTO `presensi_harian` VALUES (399, 27, 852, 'M', '', '2023-06-08', '2023-06-08 10:38:15', 7, 51);
INSERT INTO `presensi_harian` VALUES (400, 27, 853, 'A', '', '2023-06-08', '2023-06-08 10:38:15', 7, 51);
INSERT INTO `presensi_harian` VALUES (401, 27, 854, 'A', '', '2023-06-08', '2023-06-08 10:38:15', 7, 51);
INSERT INTO `presensi_harian` VALUES (402, 27, 855, 'M', '', '2023-06-08', '2023-06-08 10:38:15', 7, 51);
INSERT INTO `presensi_harian` VALUES (403, 27, 856, 'M', '', '2023-06-08', '2023-06-08 10:38:15', 7, 51);
INSERT INTO `presensi_harian` VALUES (404, 27, 857, 'M', '', '2023-06-08', '2023-06-08 10:38:15', 7, 51);
INSERT INTO `presensi_harian` VALUES (405, 27, 858, 'A', '', '2023-06-08', '2023-06-08 10:38:15', 7, 51);
INSERT INTO `presensi_harian` VALUES (406, 27, 859, 'M', '', '2023-06-08', '2023-06-08 10:38:15', 7, 51);
INSERT INTO `presensi_harian` VALUES (407, 27, 860, 'A', '', '2023-06-08', '2023-06-08 10:38:15', 7, 51);
INSERT INTO `presensi_harian` VALUES (408, 27, 861, 'M', '', '2023-06-08', '2023-06-08 10:38:15', 7, 51);
INSERT INTO `presensi_harian` VALUES (409, 27, 862, 'M', '', '2023-06-08', '2023-06-08 10:38:15', 7, 51);
INSERT INTO `presensi_harian` VALUES (410, 23, 838, 'S', '', '2023-06-08', '2023-06-08 10:41:20', 7, 51);
INSERT INTO `presensi_harian` VALUES (411, 23, 839, 'A', '', '2023-06-08', '2023-06-08 10:41:20', 7, 51);
INSERT INTO `presensi_harian` VALUES (412, 23, 840, 'A', '', '2023-06-08', '2023-06-08 10:41:20', 7, 51);
INSERT INTO `presensi_harian` VALUES (413, 23, 841, 'S', '', '2023-06-08', '2023-06-08 10:41:20', 7, 51);
INSERT INTO `presensi_harian` VALUES (414, 23, 842, 'M', '', '2023-06-08', '2023-06-08 10:41:20', 7, 51);
INSERT INTO `presensi_harian` VALUES (415, 23, 843, 'A', '', '2023-06-08', '2023-06-08 10:41:20', 7, 51);
INSERT INTO `presensi_harian` VALUES (416, 23, 844, 'A', '', '2023-06-08', '2023-06-08 10:41:20', 7, 51);
INSERT INTO `presensi_harian` VALUES (417, 23, 845, 'A', '', '2023-06-08', '2023-06-08 10:41:20', 7, 51);
INSERT INTO `presensi_harian` VALUES (418, 23, 846, 'S', '', '2023-06-08', '2023-06-08 10:41:20', 7, 51);
INSERT INTO `presensi_harian` VALUES (419, 23, 847, 'A', '', '2023-06-08', '2023-06-08 10:41:20', 7, 51);
INSERT INTO `presensi_harian` VALUES (420, 23, 848, 'M', '', '2023-06-08', '2023-06-08 10:41:20', 7, 51);
INSERT INTO `presensi_harian` VALUES (421, 23, 849, 'M', '', '2023-06-08', '2023-06-08 10:41:20', 7, 51);
INSERT INTO `presensi_harian` VALUES (422, 23, 850, 'A', '', '2023-06-08', '2023-06-08 10:41:20', 7, 51);
INSERT INTO `presensi_harian` VALUES (423, 23, 851, 'M', '', '2023-06-08', '2023-06-08 10:41:20', 7, 51);
INSERT INTO `presensi_harian` VALUES (424, 23, 852, 'M', '', '2023-06-08', '2023-06-08 10:41:20', 7, 51);
INSERT INTO `presensi_harian` VALUES (425, 23, 853, 'A', '', '2023-06-08', '2023-06-08 10:41:21', 7, 51);
INSERT INTO `presensi_harian` VALUES (426, 23, 854, 'A', '', '2023-06-08', '2023-06-08 10:41:21', 7, 51);
INSERT INTO `presensi_harian` VALUES (427, 23, 855, 'M', '', '2023-06-08', '2023-06-08 10:41:21', 7, 51);
INSERT INTO `presensi_harian` VALUES (428, 23, 856, 'M', '', '2023-06-08', '2023-06-08 10:41:21', 7, 51);
INSERT INTO `presensi_harian` VALUES (429, 23, 857, 'M', '', '2023-06-08', '2023-06-08 10:41:21', 7, 51);
INSERT INTO `presensi_harian` VALUES (430, 23, 858, 'A', '', '2023-06-08', '2023-06-08 10:41:21', 7, 51);
INSERT INTO `presensi_harian` VALUES (431, 23, 859, 'M', '', '2023-06-08', '2023-06-08 10:41:21', 7, 51);
INSERT INTO `presensi_harian` VALUES (432, 23, 860, 'A', '', '2023-06-08', '2023-06-08 10:41:21', 7, 51);
INSERT INTO `presensi_harian` VALUES (433, 23, 861, 'M', '', '2023-06-08', '2023-06-08 10:41:21', 7, 51);
INSERT INTO `presensi_harian` VALUES (434, 23, 862, 'M', '', '2023-06-08', '2023-06-08 10:41:21', 7, 51);
INSERT INTO `presensi_harian` VALUES (435, 12, 745, 'A', '', '2023-06-09', '2023-06-09 09:25:13', 7, 49);
INSERT INTO `presensi_harian` VALUES (436, 12, 746, 'M', '', '2023-06-09', '2023-06-09 09:25:13', 7, 49);
INSERT INTO `presensi_harian` VALUES (437, 12, 747, 'M', '', '2023-06-09', '2023-06-09 09:25:13', 7, 49);
INSERT INTO `presensi_harian` VALUES (438, 12, 748, 'M', '', '2023-06-09', '2023-06-09 09:25:13', 7, 49);
INSERT INTO `presensi_harian` VALUES (439, 12, 749, 'M', '', '2023-06-09', '2023-06-09 09:25:13', 7, 49);
INSERT INTO `presensi_harian` VALUES (440, 12, 750, 'M', '', '2023-06-09', '2023-06-09 09:25:13', 7, 49);
INSERT INTO `presensi_harian` VALUES (441, 12, 751, 'A', '', '2023-06-09', '2023-06-09 09:25:13', 7, 49);
INSERT INTO `presensi_harian` VALUES (442, 12, 752, 'M', '', '2023-06-09', '2023-06-09 09:25:13', 7, 49);
INSERT INTO `presensi_harian` VALUES (443, 12, 753, 'M', '', '2023-06-09', '2023-06-09 09:25:13', 7, 49);
INSERT INTO `presensi_harian` VALUES (444, 12, 754, 'M', '', '2023-06-09', '2023-06-09 09:25:13', 7, 49);
INSERT INTO `presensi_harian` VALUES (445, 12, 755, 'M', '', '2023-06-09', '2023-06-09 09:25:13', 7, 49);
INSERT INTO `presensi_harian` VALUES (446, 12, 756, 'A', '', '2023-06-09', '2023-06-09 09:25:13', 7, 49);
INSERT INTO `presensi_harian` VALUES (447, 12, 757, 'M', '', '2023-06-09', '2023-06-09 09:25:13', 7, 49);
INSERT INTO `presensi_harian` VALUES (448, 12, 758, 'A', '', '2023-06-09', '2023-06-09 09:25:13', 7, 49);
INSERT INTO `presensi_harian` VALUES (449, 12, 759, 'A', '', '2023-06-09', '2023-06-09 09:25:13', 7, 49);
INSERT INTO `presensi_harian` VALUES (450, 12, 760, 'A', '', '2023-06-09', '2023-06-09 09:25:13', 7, 49);
INSERT INTO `presensi_harian` VALUES (451, 12, 761, 'M', '', '2023-06-09', '2023-06-09 09:25:13', 7, 49);
INSERT INTO `presensi_harian` VALUES (452, 12, 762, 'A', '', '2023-06-09', '2023-06-09 09:25:13', 7, 49);
INSERT INTO `presensi_harian` VALUES (453, 12, 763, 'M', '', '2023-06-09', '2023-06-09 09:25:13', 7, 49);
INSERT INTO `presensi_harian` VALUES (454, 12, 764, 'M', '', '2023-06-09', '2023-06-09 09:25:13', 7, 49);
INSERT INTO `presensi_harian` VALUES (455, 12, 765, 'A', '', '2023-06-09', '2023-06-09 09:25:13', 7, 49);
INSERT INTO `presensi_harian` VALUES (456, 12, 766, 'M', '', '2023-06-09', '2023-06-09 09:25:13', 7, 49);
INSERT INTO `presensi_harian` VALUES (457, 12, 767, 'M', '', '2023-06-09', '2023-06-09 09:25:13', 7, 49);
INSERT INTO `presensi_harian` VALUES (458, 12, 768, 'M', '', '2023-06-09', '2023-06-09 09:25:13', 7, 49);
INSERT INTO `presensi_harian` VALUES (459, 12, 769, 'M', '', '2023-06-09', '2023-06-09 09:25:13', 7, 49);
INSERT INTO `presensi_harian` VALUES (460, 7, 838, 'M', '', '2023-06-09', '2023-06-09 09:36:20', 7, 51);
INSERT INTO `presensi_harian` VALUES (461, 7, 839, 'M', '', '2023-06-09', '2023-06-09 09:36:20', 7, 51);
INSERT INTO `presensi_harian` VALUES (462, 7, 840, 'M', '', '2023-06-09', '2023-06-09 09:36:20', 7, 51);
INSERT INTO `presensi_harian` VALUES (463, 7, 841, 'M', '', '2023-06-09', '2023-06-09 09:36:20', 7, 51);
INSERT INTO `presensi_harian` VALUES (464, 7, 842, 'M', '', '2023-06-09', '2023-06-09 09:36:20', 7, 51);
INSERT INTO `presensi_harian` VALUES (465, 7, 843, 'A', '', '2023-06-09', '2023-06-09 09:36:20', 7, 51);
INSERT INTO `presensi_harian` VALUES (466, 7, 844, 'A', '', '2023-06-09', '2023-06-09 09:36:20', 7, 51);
INSERT INTO `presensi_harian` VALUES (467, 7, 845, 'M', '', '2023-06-09', '2023-06-09 09:36:20', 7, 51);
INSERT INTO `presensi_harian` VALUES (468, 7, 846, 'M', '', '2023-06-09', '2023-06-09 09:36:20', 7, 51);
INSERT INTO `presensi_harian` VALUES (469, 7, 847, 'A', '', '2023-06-09', '2023-06-09 09:36:20', 7, 51);
INSERT INTO `presensi_harian` VALUES (470, 7, 848, 'M', '', '2023-06-09', '2023-06-09 09:36:20', 7, 51);
INSERT INTO `presensi_harian` VALUES (471, 7, 849, 'M', '', '2023-06-09', '2023-06-09 09:36:20', 7, 51);
INSERT INTO `presensi_harian` VALUES (472, 7, 850, 'A', '', '2023-06-09', '2023-06-09 09:36:20', 7, 51);
INSERT INTO `presensi_harian` VALUES (473, 7, 851, 'M', '', '2023-06-09', '2023-06-09 09:36:20', 7, 51);
INSERT INTO `presensi_harian` VALUES (474, 7, 852, 'M', '', '2023-06-09', '2023-06-09 09:36:20', 7, 51);
INSERT INTO `presensi_harian` VALUES (475, 7, 853, 'A', '', '2023-06-09', '2023-06-09 09:36:20', 7, 51);
INSERT INTO `presensi_harian` VALUES (476, 7, 854, 'A', '', '2023-06-09', '2023-06-09 09:36:20', 7, 51);
INSERT INTO `presensi_harian` VALUES (477, 7, 855, 'M', '', '2023-06-09', '2023-06-09 09:36:20', 7, 51);
INSERT INTO `presensi_harian` VALUES (478, 7, 856, 'M', '', '2023-06-09', '2023-06-09 09:36:20', 7, 51);
INSERT INTO `presensi_harian` VALUES (479, 7, 857, 'M', '', '2023-06-09', '2023-06-09 09:36:20', 7, 51);
INSERT INTO `presensi_harian` VALUES (480, 7, 858, 'M', '', '2023-06-09', '2023-06-09 09:36:20', 7, 51);
INSERT INTO `presensi_harian` VALUES (481, 7, 859, 'M', '', '2023-06-09', '2023-06-09 09:36:20', 7, 51);
INSERT INTO `presensi_harian` VALUES (482, 7, 860, 'A', '', '2023-06-09', '2023-06-09 09:36:20', 7, 51);
INSERT INTO `presensi_harian` VALUES (483, 7, 861, 'A', '', '2023-06-09', '2023-06-09 09:36:20', 7, 51);
INSERT INTO `presensi_harian` VALUES (484, 7, 862, 'A', '', '2023-06-09', '2023-06-09 09:36:20', 7, 51);
INSERT INTO `presensi_harian` VALUES (485, 24, 788, 'A', '', '2023-06-09', '2023-06-09 09:46:21', 7, 54);
INSERT INTO `presensi_harian` VALUES (486, 24, 789, 'M', '', '2023-06-09', '2023-06-09 09:46:21', 7, 54);
INSERT INTO `presensi_harian` VALUES (487, 24, 790, 'M', '', '2023-06-09', '2023-06-09 09:46:21', 7, 54);
INSERT INTO `presensi_harian` VALUES (488, 24, 791, 'M', '', '2023-06-09', '2023-06-09 09:46:21', 7, 54);
INSERT INTO `presensi_harian` VALUES (489, 24, 792, 'A', '', '2023-06-09', '2023-06-09 09:46:21', 7, 54);
INSERT INTO `presensi_harian` VALUES (490, 24, 793, 'M', '', '2023-06-09', '2023-06-09 09:46:21', 7, 54);
INSERT INTO `presensi_harian` VALUES (491, 24, 794, 'M', '', '2023-06-09', '2023-06-09 09:46:21', 7, 54);
INSERT INTO `presensi_harian` VALUES (492, 24, 795, 'A', '', '2023-06-09', '2023-06-09 09:46:21', 7, 54);
INSERT INTO `presensi_harian` VALUES (493, 24, 796, 'M', '', '2023-06-09', '2023-06-09 09:46:21', 7, 54);
INSERT INTO `presensi_harian` VALUES (494, 24, 797, 'M', '', '2023-06-09', '2023-06-09 09:46:21', 7, 54);
INSERT INTO `presensi_harian` VALUES (495, 24, 798, 'M', '', '2023-06-09', '2023-06-09 09:46:21', 7, 54);
INSERT INTO `presensi_harian` VALUES (496, 24, 799, 'A', '', '2023-06-09', '2023-06-09 09:46:21', 7, 54);
INSERT INTO `presensi_harian` VALUES (497, 24, 800, 'A', '', '2023-06-09', '2023-06-09 09:46:21', 7, 54);
INSERT INTO `presensi_harian` VALUES (498, 24, 801, 'A', '', '2023-06-09', '2023-06-09 09:46:21', 7, 54);
INSERT INTO `presensi_harian` VALUES (499, 24, 802, 'M', '', '2023-06-09', '2023-06-09 09:46:21', 7, 54);
INSERT INTO `presensi_harian` VALUES (500, 24, 803, 'M', '', '2023-06-09', '2023-06-09 09:46:21', 7, 54);
INSERT INTO `presensi_harian` VALUES (501, 24, 804, 'M', '', '2023-06-09', '2023-06-09 09:46:21', 7, 54);
INSERT INTO `presensi_harian` VALUES (502, 24, 805, 'M', '', '2023-06-09', '2023-06-09 09:46:21', 7, 54);
INSERT INTO `presensi_harian` VALUES (503, 24, 806, 'M', '', '2023-06-09', '2023-06-09 09:46:21', 7, 54);
INSERT INTO `presensi_harian` VALUES (504, 24, 807, 'A', '', '2023-06-09', '2023-06-09 09:46:21', 7, 54);
INSERT INTO `presensi_harian` VALUES (505, 24, 808, 'M', '', '2023-06-09', '2023-06-09 09:46:21', 7, 54);
INSERT INTO `presensi_harian` VALUES (506, 10, 788, 'A', '', '2023-06-09', '2023-06-09 09:47:43', 7, 54);
INSERT INTO `presensi_harian` VALUES (507, 10, 789, 'M', '', '2023-06-09', '2023-06-09 09:47:43', 7, 54);
INSERT INTO `presensi_harian` VALUES (508, 10, 790, 'M', '', '2023-06-09', '2023-06-09 09:47:43', 7, 54);
INSERT INTO `presensi_harian` VALUES (509, 10, 791, 'M', '', '2023-06-09', '2023-06-09 09:47:43', 7, 54);
INSERT INTO `presensi_harian` VALUES (510, 10, 792, 'A', '', '2023-06-09', '2023-06-09 09:47:43', 7, 54);
INSERT INTO `presensi_harian` VALUES (511, 10, 793, 'M', '', '2023-06-09', '2023-06-09 09:47:43', 7, 54);
INSERT INTO `presensi_harian` VALUES (512, 10, 794, 'M', '', '2023-06-09', '2023-06-09 09:47:43', 7, 54);
INSERT INTO `presensi_harian` VALUES (513, 10, 795, 'A', '', '2023-06-09', '2023-06-09 09:47:43', 7, 54);
INSERT INTO `presensi_harian` VALUES (514, 10, 796, 'M', '', '2023-06-09', '2023-06-09 09:47:43', 7, 54);
INSERT INTO `presensi_harian` VALUES (515, 10, 797, 'M', '', '2023-06-09', '2023-06-09 09:47:43', 7, 54);
INSERT INTO `presensi_harian` VALUES (516, 10, 798, 'M', '', '2023-06-09', '2023-06-09 09:47:43', 7, 54);
INSERT INTO `presensi_harian` VALUES (517, 10, 799, 'A', '', '2023-06-09', '2023-06-09 09:47:43', 7, 54);
INSERT INTO `presensi_harian` VALUES (518, 10, 800, 'A', '', '2023-06-09', '2023-06-09 09:47:43', 7, 54);
INSERT INTO `presensi_harian` VALUES (519, 10, 801, 'A', '', '2023-06-09', '2023-06-09 09:47:43', 7, 54);
INSERT INTO `presensi_harian` VALUES (520, 10, 802, 'M', '', '2023-06-09', '2023-06-09 09:47:43', 7, 54);
INSERT INTO `presensi_harian` VALUES (521, 10, 803, 'M', '', '2023-06-09', '2023-06-09 09:47:43', 7, 54);
INSERT INTO `presensi_harian` VALUES (522, 10, 804, 'M', '', '2023-06-09', '2023-06-09 09:47:43', 7, 54);
INSERT INTO `presensi_harian` VALUES (523, 10, 805, 'M', '', '2023-06-09', '2023-06-09 09:47:43', 7, 54);
INSERT INTO `presensi_harian` VALUES (524, 10, 806, 'M', '', '2023-06-09', '2023-06-09 09:47:43', 7, 54);
INSERT INTO `presensi_harian` VALUES (525, 10, 807, 'A', '', '2023-06-09', '2023-06-09 09:47:43', 7, 54);
INSERT INTO `presensi_harian` VALUES (526, 10, 808, 'M', '', '2023-06-09', '2023-06-09 09:47:43', 7, 54);
INSERT INTO `presensi_harian` VALUES (527, 24, 788, 'A', '', '2023-06-08', '2023-06-09 09:52:33', 7, 54);
INSERT INTO `presensi_harian` VALUES (528, 24, 789, 'M', '', '2023-06-08', '2023-06-09 09:52:33', 7, 54);
INSERT INTO `presensi_harian` VALUES (529, 24, 790, 'M', '', '2023-06-08', '2023-06-09 09:52:33', 7, 54);
INSERT INTO `presensi_harian` VALUES (530, 24, 791, 'M', '', '2023-06-08', '2023-06-09 09:52:33', 7, 54);
INSERT INTO `presensi_harian` VALUES (531, 24, 792, 'M', '', '2023-06-08', '2023-06-09 09:52:33', 7, 54);
INSERT INTO `presensi_harian` VALUES (532, 24, 793, 'M', '', '2023-06-08', '2023-06-09 09:52:33', 7, 54);
INSERT INTO `presensi_harian` VALUES (533, 24, 794, 'A', '', '2023-06-08', '2023-06-09 09:52:33', 7, 54);
INSERT INTO `presensi_harian` VALUES (534, 24, 795, 'M', '', '2023-06-08', '2023-06-09 09:52:33', 7, 54);
INSERT INTO `presensi_harian` VALUES (535, 24, 796, 'M', '', '2023-06-08', '2023-06-09 09:52:33', 7, 54);
INSERT INTO `presensi_harian` VALUES (536, 24, 797, 'M', '', '2023-06-08', '2023-06-09 09:52:33', 7, 54);
INSERT INTO `presensi_harian` VALUES (537, 24, 798, 'M', '', '2023-06-08', '2023-06-09 09:52:33', 7, 54);
INSERT INTO `presensi_harian` VALUES (538, 24, 799, 'M', '', '2023-06-08', '2023-06-09 09:52:33', 7, 54);
INSERT INTO `presensi_harian` VALUES (539, 24, 800, 'A', '', '2023-06-08', '2023-06-09 09:52:33', 7, 54);
INSERT INTO `presensi_harian` VALUES (540, 24, 801, 'M', '', '2023-06-08', '2023-06-09 09:52:33', 7, 54);
INSERT INTO `presensi_harian` VALUES (541, 24, 802, 'M', '', '2023-06-08', '2023-06-09 09:52:33', 7, 54);
INSERT INTO `presensi_harian` VALUES (542, 24, 803, 'M', '', '2023-06-08', '2023-06-09 09:52:33', 7, 54);
INSERT INTO `presensi_harian` VALUES (543, 24, 804, 'A', '', '2023-06-08', '2023-06-09 09:52:33', 7, 54);
INSERT INTO `presensi_harian` VALUES (544, 24, 805, 'M', '', '2023-06-08', '2023-06-09 09:52:33', 7, 54);
INSERT INTO `presensi_harian` VALUES (545, 24, 806, 'M', '', '2023-06-08', '2023-06-09 09:52:33', 7, 54);
INSERT INTO `presensi_harian` VALUES (546, 24, 807, 'A', '', '2023-06-08', '2023-06-09 09:52:33', 7, 54);
INSERT INTO `presensi_harian` VALUES (547, 24, 808, 'M', '', '2023-06-08', '2023-06-09 09:52:33', 7, 54);
INSERT INTO `presensi_harian` VALUES (548, 13, 788, 'A', '', '2023-06-08', '2023-06-09 09:53:28', 7, 54);
INSERT INTO `presensi_harian` VALUES (549, 13, 789, 'M', '', '2023-06-08', '2023-06-09 09:53:28', 7, 54);
INSERT INTO `presensi_harian` VALUES (550, 13, 790, 'M', '', '2023-06-08', '2023-06-09 09:53:28', 7, 54);
INSERT INTO `presensi_harian` VALUES (551, 13, 791, 'M', '', '2023-06-08', '2023-06-09 09:53:28', 7, 54);
INSERT INTO `presensi_harian` VALUES (552, 13, 792, 'M', '', '2023-06-08', '2023-06-09 09:53:28', 7, 54);
INSERT INTO `presensi_harian` VALUES (553, 13, 793, 'M', '', '2023-06-08', '2023-06-09 09:53:28', 7, 54);
INSERT INTO `presensi_harian` VALUES (554, 13, 794, 'A', '', '2023-06-08', '2023-06-09 09:53:28', 7, 54);
INSERT INTO `presensi_harian` VALUES (555, 13, 795, 'M', '', '2023-06-08', '2023-06-09 09:53:28', 7, 54);
INSERT INTO `presensi_harian` VALUES (556, 13, 796, 'M', '', '2023-06-08', '2023-06-09 09:53:28', 7, 54);
INSERT INTO `presensi_harian` VALUES (557, 13, 797, 'M', '', '2023-06-08', '2023-06-09 09:53:28', 7, 54);
INSERT INTO `presensi_harian` VALUES (558, 13, 798, 'M', '', '2023-06-08', '2023-06-09 09:53:28', 7, 54);
INSERT INTO `presensi_harian` VALUES (559, 13, 799, 'M', '', '2023-06-08', '2023-06-09 09:53:28', 7, 54);
INSERT INTO `presensi_harian` VALUES (560, 13, 800, 'A', '', '2023-06-08', '2023-06-09 09:53:28', 7, 54);
INSERT INTO `presensi_harian` VALUES (561, 13, 801, 'M', '', '2023-06-08', '2023-06-09 09:53:28', 7, 54);
INSERT INTO `presensi_harian` VALUES (562, 13, 802, 'M', '', '2023-06-08', '2023-06-09 09:53:28', 7, 54);
INSERT INTO `presensi_harian` VALUES (563, 13, 803, 'M', '', '2023-06-08', '2023-06-09 09:53:28', 7, 54);
INSERT INTO `presensi_harian` VALUES (564, 13, 804, 'A', '', '2023-06-08', '2023-06-09 09:53:28', 7, 54);
INSERT INTO `presensi_harian` VALUES (565, 13, 805, 'M', '', '2023-06-08', '2023-06-09 09:53:28', 7, 54);
INSERT INTO `presensi_harian` VALUES (566, 13, 806, 'M', '', '2023-06-08', '2023-06-09 09:53:28', 7, 54);
INSERT INTO `presensi_harian` VALUES (567, 13, 807, 'A', '', '2023-06-08', '2023-06-09 09:53:28', 7, 54);
INSERT INTO `presensi_harian` VALUES (568, 13, 808, 'M', '', '2023-06-08', '2023-06-09 09:53:28', 7, 54);
INSERT INTO `presensi_harian` VALUES (569, 11, 788, 'A', '', '2023-06-08', '2023-06-09 09:58:53', 7, 54);
INSERT INTO `presensi_harian` VALUES (570, 11, 789, 'M', '', '2023-06-08', '2023-06-09 09:58:53', 7, 54);
INSERT INTO `presensi_harian` VALUES (571, 11, 790, 'M', '', '2023-06-08', '2023-06-09 09:58:53', 7, 54);
INSERT INTO `presensi_harian` VALUES (572, 11, 791, 'M', '', '2023-06-08', '2023-06-09 09:58:53', 7, 54);
INSERT INTO `presensi_harian` VALUES (573, 11, 792, 'M', '', '2023-06-08', '2023-06-09 09:58:53', 7, 54);
INSERT INTO `presensi_harian` VALUES (574, 11, 793, 'M', '', '2023-06-08', '2023-06-09 09:58:53', 7, 54);
INSERT INTO `presensi_harian` VALUES (575, 11, 794, 'A', '', '2023-06-08', '2023-06-09 09:58:53', 7, 54);
INSERT INTO `presensi_harian` VALUES (576, 11, 795, 'M', '', '2023-06-08', '2023-06-09 09:58:53', 7, 54);
INSERT INTO `presensi_harian` VALUES (577, 11, 796, 'M', '', '2023-06-08', '2023-06-09 09:58:53', 7, 54);
INSERT INTO `presensi_harian` VALUES (578, 11, 797, 'M', '', '2023-06-08', '2023-06-09 09:58:53', 7, 54);
INSERT INTO `presensi_harian` VALUES (579, 11, 798, 'M', '', '2023-06-08', '2023-06-09 09:58:53', 7, 54);
INSERT INTO `presensi_harian` VALUES (580, 11, 799, 'M', '', '2023-06-08', '2023-06-09 09:58:53', 7, 54);
INSERT INTO `presensi_harian` VALUES (581, 11, 800, 'A', '', '2023-06-08', '2023-06-09 09:58:53', 7, 54);
INSERT INTO `presensi_harian` VALUES (582, 11, 801, 'M', '', '2023-06-08', '2023-06-09 09:58:53', 7, 54);
INSERT INTO `presensi_harian` VALUES (583, 11, 802, 'M', '', '2023-06-08', '2023-06-09 09:58:53', 7, 54);
INSERT INTO `presensi_harian` VALUES (584, 11, 803, 'M', '', '2023-06-08', '2023-06-09 09:58:53', 7, 54);
INSERT INTO `presensi_harian` VALUES (585, 11, 804, 'A', '', '2023-06-08', '2023-06-09 09:58:53', 7, 54);
INSERT INTO `presensi_harian` VALUES (586, 11, 805, 'M', '', '2023-06-08', '2023-06-09 09:58:53', 7, 54);
INSERT INTO `presensi_harian` VALUES (587, 11, 806, 'M', '', '2023-06-08', '2023-06-09 09:58:53', 7, 54);
INSERT INTO `presensi_harian` VALUES (588, 11, 807, 'A', '', '2023-06-08', '2023-06-09 09:58:53', 7, 54);
INSERT INTO `presensi_harian` VALUES (589, 11, 808, 'M', '', '2023-06-08', '2023-06-09 09:58:53', 7, 54);
INSERT INTO `presensi_harian` VALUES (590, 14, 877, 'M', '', '2023-06-09', '2023-06-09 10:01:09', 7, 56);
INSERT INTO `presensi_harian` VALUES (591, 14, 878, 'M', '', '2023-06-09', '2023-06-09 10:01:09', 7, 56);
INSERT INTO `presensi_harian` VALUES (592, 14, 879, 'I', '', '2023-06-09', '2023-06-09 10:01:09', 7, 56);
INSERT INTO `presensi_harian` VALUES (593, 14, 880, 'M', '', '2023-06-09', '2023-06-09 10:01:09', 7, 56);
INSERT INTO `presensi_harian` VALUES (594, 14, 881, 'A', '', '2023-06-09', '2023-06-09 10:01:09', 7, 56);
INSERT INTO `presensi_harian` VALUES (595, 14, 882, 'M', '', '2023-06-09', '2023-06-09 10:01:09', 7, 56);
INSERT INTO `presensi_harian` VALUES (596, 14, 883, 'M', '', '2023-06-09', '2023-06-09 10:01:09', 7, 56);
INSERT INTO `presensi_harian` VALUES (597, 14, 884, 'M', '', '2023-06-09', '2023-06-09 10:01:09', 7, 56);
INSERT INTO `presensi_harian` VALUES (598, 14, 885, 'A', '', '2023-06-09', '2023-06-09 10:01:09', 7, 56);
INSERT INTO `presensi_harian` VALUES (599, 14, 886, 'M', '', '2023-06-09', '2023-06-09 10:01:09', 7, 56);
INSERT INTO `presensi_harian` VALUES (600, 14, 887, 'A', '', '2023-06-09', '2023-06-09 10:01:09', 7, 56);
INSERT INTO `presensi_harian` VALUES (601, 14, 877, 'M', '', '2023-06-08', '2023-06-09 10:03:07', 7, 56);
INSERT INTO `presensi_harian` VALUES (602, 14, 878, 'A', '', '2023-06-08', '2023-06-09 10:03:07', 7, 56);
INSERT INTO `presensi_harian` VALUES (603, 14, 879, 'A', '', '2023-06-08', '2023-06-09 10:03:07', 7, 56);
INSERT INTO `presensi_harian` VALUES (604, 14, 880, 'M', '', '2023-06-08', '2023-06-09 10:03:07', 7, 56);
INSERT INTO `presensi_harian` VALUES (605, 14, 881, 'M', '', '2023-06-08', '2023-06-09 10:03:07', 7, 56);
INSERT INTO `presensi_harian` VALUES (606, 14, 882, 'A', '', '2023-06-08', '2023-06-09 10:03:07', 7, 56);
INSERT INTO `presensi_harian` VALUES (607, 14, 883, 'A', '', '2023-06-08', '2023-06-09 10:03:07', 7, 56);
INSERT INTO `presensi_harian` VALUES (608, 14, 884, 'M', '', '2023-06-08', '2023-06-09 10:03:07', 7, 56);
INSERT INTO `presensi_harian` VALUES (609, 14, 885, 'A', '', '2023-06-08', '2023-06-09 10:03:07', 7, 56);
INSERT INTO `presensi_harian` VALUES (610, 14, 886, 'A', '', '2023-06-08', '2023-06-09 10:03:07', 7, 56);
INSERT INTO `presensi_harian` VALUES (611, 14, 887, 'A', '', '2023-06-08', '2023-06-09 10:03:07', 7, 56);
INSERT INTO `presensi_harian` VALUES (612, 17, 877, 'M', '', '2023-06-08', '2023-06-09 10:03:42', 7, 56);
INSERT INTO `presensi_harian` VALUES (613, 17, 878, 'A', '', '2023-06-08', '2023-06-09 10:03:42', 7, 56);
INSERT INTO `presensi_harian` VALUES (614, 17, 879, 'A', '', '2023-06-08', '2023-06-09 10:03:42', 7, 56);
INSERT INTO `presensi_harian` VALUES (615, 17, 880, 'M', '', '2023-06-08', '2023-06-09 10:03:42', 7, 56);
INSERT INTO `presensi_harian` VALUES (616, 17, 881, 'M', '', '2023-06-08', '2023-06-09 10:03:42', 7, 56);
INSERT INTO `presensi_harian` VALUES (617, 17, 882, 'A', '', '2023-06-08', '2023-06-09 10:03:42', 7, 56);
INSERT INTO `presensi_harian` VALUES (618, 17, 883, 'A', '', '2023-06-08', '2023-06-09 10:03:42', 7, 56);
INSERT INTO `presensi_harian` VALUES (619, 17, 884, 'M', '', '2023-06-08', '2023-06-09 10:03:42', 7, 56);
INSERT INTO `presensi_harian` VALUES (620, 17, 885, 'A', '', '2023-06-08', '2023-06-09 10:03:42', 7, 56);
INSERT INTO `presensi_harian` VALUES (621, 17, 886, 'A', '', '2023-06-08', '2023-06-09 10:03:42', 7, 56);
INSERT INTO `presensi_harian` VALUES (622, 17, 887, 'A', '', '2023-06-08', '2023-06-09 10:03:42', 7, 56);
INSERT INTO `presensi_harian` VALUES (623, 23, 745, 'M', '', '2023-06-10', '2023-06-10 11:02:26', 7, 49);
INSERT INTO `presensi_harian` VALUES (624, 23, 746, 'A', '', '2023-06-10', '2023-06-10 11:02:26', 7, 49);
INSERT INTO `presensi_harian` VALUES (625, 23, 747, 'M', '', '2023-06-10', '2023-06-10 11:02:26', 7, 49);
INSERT INTO `presensi_harian` VALUES (626, 23, 748, 'M', '', '2023-06-10', '2023-06-10 11:02:26', 7, 49);
INSERT INTO `presensi_harian` VALUES (627, 23, 749, 'M', '', '2023-06-10', '2023-06-10 11:02:26', 7, 49);
INSERT INTO `presensi_harian` VALUES (628, 23, 750, 'M', '', '2023-06-10', '2023-06-10 11:02:26', 7, 49);
INSERT INTO `presensi_harian` VALUES (629, 23, 751, 'I', '', '2023-06-10', '2023-06-10 11:02:26', 7, 49);
INSERT INTO `presensi_harian` VALUES (630, 23, 752, 'M', '', '2023-06-10', '2023-06-10 11:02:26', 7, 49);
INSERT INTO `presensi_harian` VALUES (631, 23, 753, 'M', '', '2023-06-10', '2023-06-10 11:02:26', 7, 49);
INSERT INTO `presensi_harian` VALUES (632, 23, 754, 'M', '', '2023-06-10', '2023-06-10 11:02:26', 7, 49);
INSERT INTO `presensi_harian` VALUES (633, 23, 755, 'M', '', '2023-06-10', '2023-06-10 11:02:26', 7, 49);
INSERT INTO `presensi_harian` VALUES (634, 23, 756, 'A', '', '2023-06-10', '2023-06-10 11:02:26', 7, 49);
INSERT INTO `presensi_harian` VALUES (635, 23, 757, 'M', '', '2023-06-10', '2023-06-10 11:02:26', 7, 49);
INSERT INTO `presensi_harian` VALUES (636, 23, 758, 'A', '', '2023-06-10', '2023-06-10 11:02:26', 7, 49);
INSERT INTO `presensi_harian` VALUES (637, 23, 759, 'A', '', '2023-06-10', '2023-06-10 11:02:26', 7, 49);
INSERT INTO `presensi_harian` VALUES (638, 23, 760, 'A', '', '2023-06-10', '2023-06-10 11:02:27', 7, 49);
INSERT INTO `presensi_harian` VALUES (639, 23, 761, 'M', '', '2023-06-10', '2023-06-10 11:02:27', 7, 49);
INSERT INTO `presensi_harian` VALUES (640, 23, 762, 'A', '', '2023-06-10', '2023-06-10 11:02:27', 7, 49);
INSERT INTO `presensi_harian` VALUES (641, 23, 763, 'M', '', '2023-06-10', '2023-06-10 11:02:27', 7, 49);
INSERT INTO `presensi_harian` VALUES (642, 23, 764, 'M', '', '2023-06-10', '2023-06-10 11:02:27', 7, 49);
INSERT INTO `presensi_harian` VALUES (643, 23, 765, 'A', '', '2023-06-10', '2023-06-10 11:02:27', 7, 49);
INSERT INTO `presensi_harian` VALUES (644, 23, 766, 'M', '', '2023-06-10', '2023-06-10 11:02:27', 7, 49);
INSERT INTO `presensi_harian` VALUES (645, 23, 767, 'M', '', '2023-06-10', '2023-06-10 11:02:27', 7, 49);
INSERT INTO `presensi_harian` VALUES (646, 23, 768, 'M', '', '2023-06-10', '2023-06-10 11:02:27', 7, 49);
INSERT INTO `presensi_harian` VALUES (647, 23, 769, 'M', '', '2023-06-10', '2023-06-10 11:02:27', 7, 49);
INSERT INTO `presensi_harian` VALUES (648, 7, 745, 'M', '', '2023-06-10', '2023-06-10 11:04:00', 7, 49);
INSERT INTO `presensi_harian` VALUES (649, 7, 746, 'A', '', '2023-06-10', '2023-06-10 11:04:00', 7, 49);
INSERT INTO `presensi_harian` VALUES (650, 7, 747, 'M', '', '2023-06-10', '2023-06-10 11:04:00', 7, 49);
INSERT INTO `presensi_harian` VALUES (651, 7, 748, 'M', '', '2023-06-10', '2023-06-10 11:04:00', 7, 49);
INSERT INTO `presensi_harian` VALUES (652, 7, 749, 'M', '', '2023-06-10', '2023-06-10 11:04:00', 7, 49);
INSERT INTO `presensi_harian` VALUES (653, 7, 750, 'M', '', '2023-06-10', '2023-06-10 11:04:00', 7, 49);
INSERT INTO `presensi_harian` VALUES (654, 7, 751, 'I', '', '2023-06-10', '2023-06-10 11:04:00', 7, 49);
INSERT INTO `presensi_harian` VALUES (655, 7, 752, 'M', '', '2023-06-10', '2023-06-10 11:04:00', 7, 49);
INSERT INTO `presensi_harian` VALUES (656, 7, 753, 'M', '', '2023-06-10', '2023-06-10 11:04:00', 7, 49);
INSERT INTO `presensi_harian` VALUES (657, 7, 754, 'M', '', '2023-06-10', '2023-06-10 11:04:00', 7, 49);
INSERT INTO `presensi_harian` VALUES (658, 7, 755, 'M', '', '2023-06-10', '2023-06-10 11:04:00', 7, 49);
INSERT INTO `presensi_harian` VALUES (659, 7, 756, 'A', '', '2023-06-10', '2023-06-10 11:04:00', 7, 49);
INSERT INTO `presensi_harian` VALUES (660, 7, 757, 'M', '', '2023-06-10', '2023-06-10 11:04:00', 7, 49);
INSERT INTO `presensi_harian` VALUES (661, 7, 758, 'A', '', '2023-06-10', '2023-06-10 11:04:00', 7, 49);
INSERT INTO `presensi_harian` VALUES (662, 7, 759, 'A', '', '2023-06-10', '2023-06-10 11:04:00', 7, 49);
INSERT INTO `presensi_harian` VALUES (663, 7, 760, 'A', '', '2023-06-10', '2023-06-10 11:04:00', 7, 49);
INSERT INTO `presensi_harian` VALUES (664, 7, 761, 'M', '', '2023-06-10', '2023-06-10 11:04:00', 7, 49);
INSERT INTO `presensi_harian` VALUES (665, 7, 762, 'A', '', '2023-06-10', '2023-06-10 11:04:00', 7, 49);
INSERT INTO `presensi_harian` VALUES (666, 7, 763, 'M', '', '2023-06-10', '2023-06-10 11:04:00', 7, 49);
INSERT INTO `presensi_harian` VALUES (667, 7, 764, 'M', '', '2023-06-10', '2023-06-10 11:04:00', 7, 49);
INSERT INTO `presensi_harian` VALUES (668, 7, 765, 'A', '', '2023-06-10', '2023-06-10 11:04:00', 7, 49);
INSERT INTO `presensi_harian` VALUES (669, 7, 766, 'M', '', '2023-06-10', '2023-06-10 11:04:00', 7, 49);
INSERT INTO `presensi_harian` VALUES (670, 7, 767, 'M', '', '2023-06-10', '2023-06-10 11:04:00', 7, 49);
INSERT INTO `presensi_harian` VALUES (671, 7, 768, 'M', '', '2023-06-10', '2023-06-10 11:04:00', 7, 49);
INSERT INTO `presensi_harian` VALUES (672, 7, 769, 'M', '', '2023-06-10', '2023-06-10 11:04:00', 7, 49);
INSERT INTO `presensi_harian` VALUES (673, 15, 838, 'S', '', '2023-06-10', '2023-06-10 11:07:10', 7, 51);
INSERT INTO `presensi_harian` VALUES (674, 15, 839, 'M', '', '2023-06-10', '2023-06-10 11:07:10', 7, 51);
INSERT INTO `presensi_harian` VALUES (675, 15, 840, 'M', '', '2023-06-10', '2023-06-10 11:07:10', 7, 51);
INSERT INTO `presensi_harian` VALUES (676, 15, 841, 'M', '', '2023-06-10', '2023-06-10 11:07:10', 7, 51);
INSERT INTO `presensi_harian` VALUES (677, 15, 842, 'M', '', '2023-06-10', '2023-06-10 11:07:10', 7, 51);
INSERT INTO `presensi_harian` VALUES (678, 15, 843, 'A', '', '2023-06-10', '2023-06-10 11:07:10', 7, 51);
INSERT INTO `presensi_harian` VALUES (679, 15, 844, 'A', '', '2023-06-10', '2023-06-10 11:07:10', 7, 51);
INSERT INTO `presensi_harian` VALUES (680, 15, 845, 'M', '', '2023-06-10', '2023-06-10 11:07:10', 7, 51);
INSERT INTO `presensi_harian` VALUES (681, 15, 846, 'M', '', '2023-06-10', '2023-06-10 11:07:10', 7, 51);
INSERT INTO `presensi_harian` VALUES (682, 15, 847, 'A', '', '2023-06-10', '2023-06-10 11:07:10', 7, 51);
INSERT INTO `presensi_harian` VALUES (683, 15, 848, 'M', '', '2023-06-10', '2023-06-10 11:07:10', 7, 51);
INSERT INTO `presensi_harian` VALUES (684, 15, 849, 'M', '', '2023-06-10', '2023-06-10 11:07:10', 7, 51);
INSERT INTO `presensi_harian` VALUES (685, 15, 850, 'M', '', '2023-06-10', '2023-06-10 11:07:10', 7, 51);
INSERT INTO `presensi_harian` VALUES (686, 15, 851, 'M', '', '2023-06-10', '2023-06-10 11:07:10', 7, 51);
INSERT INTO `presensi_harian` VALUES (687, 15, 852, 'M', '', '2023-06-10', '2023-06-10 11:07:10', 7, 51);
INSERT INTO `presensi_harian` VALUES (688, 15, 853, 'M', '', '2023-06-10', '2023-06-10 11:07:10', 7, 51);
INSERT INTO `presensi_harian` VALUES (689, 15, 854, 'M', '', '2023-06-10', '2023-06-10 11:07:10', 7, 51);
INSERT INTO `presensi_harian` VALUES (690, 15, 855, 'M', '', '2023-06-10', '2023-06-10 11:07:10', 7, 51);
INSERT INTO `presensi_harian` VALUES (691, 15, 856, 'A', '', '2023-06-10', '2023-06-10 11:07:10', 7, 51);
INSERT INTO `presensi_harian` VALUES (692, 15, 857, 'A', '', '2023-06-10', '2023-06-10 11:07:10', 7, 51);
INSERT INTO `presensi_harian` VALUES (693, 15, 858, 'M', '', '2023-06-10', '2023-06-10 11:07:10', 7, 51);
INSERT INTO `presensi_harian` VALUES (694, 15, 859, 'M', '', '2023-06-10', '2023-06-10 11:07:10', 7, 51);
INSERT INTO `presensi_harian` VALUES (695, 15, 860, 'A', '', '2023-06-10', '2023-06-10 11:07:10', 7, 51);
INSERT INTO `presensi_harian` VALUES (696, 15, 861, 'M', '', '2023-06-10', '2023-06-10 11:07:10', 7, 51);
INSERT INTO `presensi_harian` VALUES (697, 15, 862, 'M', '', '2023-06-10', '2023-06-10 11:07:10', 7, 51);
INSERT INTO `presensi_harian` VALUES (698, 23, 770, 'A', '', '2023-06-10', '2023-06-10 11:09:56', 7, 50);
INSERT INTO `presensi_harian` VALUES (699, 23, 771, 'M', '', '2023-06-10', '2023-06-10 11:09:56', 7, 50);
INSERT INTO `presensi_harian` VALUES (700, 23, 772, 'A', '', '2023-06-10', '2023-06-10 11:09:56', 7, 50);
INSERT INTO `presensi_harian` VALUES (701, 23, 773, 'M', '', '2023-06-10', '2023-06-10 11:09:56', 7, 50);
INSERT INTO `presensi_harian` VALUES (702, 23, 774, 'S', '', '2023-06-10', '2023-06-10 11:09:56', 7, 50);
INSERT INTO `presensi_harian` VALUES (703, 23, 775, 'A', '', '2023-06-10', '2023-06-10 11:09:56', 7, 50);
INSERT INTO `presensi_harian` VALUES (704, 23, 776, 'M', '', '2023-06-10', '2023-06-10 11:09:56', 7, 50);
INSERT INTO `presensi_harian` VALUES (705, 23, 777, 'M', '', '2023-06-10', '2023-06-10 11:09:56', 7, 50);
INSERT INTO `presensi_harian` VALUES (706, 23, 778, 'M', '', '2023-06-10', '2023-06-10 11:09:56', 7, 50);
INSERT INTO `presensi_harian` VALUES (707, 23, 779, 'M', '', '2023-06-10', '2023-06-10 11:09:56', 7, 50);
INSERT INTO `presensi_harian` VALUES (708, 23, 780, 'M', '', '2023-06-10', '2023-06-10 11:09:56', 7, 50);
INSERT INTO `presensi_harian` VALUES (709, 23, 781, 'A', '', '2023-06-10', '2023-06-10 11:09:56', 7, 50);
INSERT INTO `presensi_harian` VALUES (710, 23, 782, 'A', '', '2023-06-10', '2023-06-10 11:09:56', 7, 50);
INSERT INTO `presensi_harian` VALUES (711, 23, 783, 'M', '', '2023-06-10', '2023-06-10 11:09:56', 7, 50);
INSERT INTO `presensi_harian` VALUES (712, 23, 784, 'M', '', '2023-06-10', '2023-06-10 11:09:56', 7, 50);
INSERT INTO `presensi_harian` VALUES (713, 23, 785, 'M', '', '2023-06-10', '2023-06-10 11:09:56', 7, 50);
INSERT INTO `presensi_harian` VALUES (714, 23, 786, 'M', '', '2023-06-10', '2023-06-10 11:09:56', 7, 50);
INSERT INTO `presensi_harian` VALUES (715, 23, 787, 'M', '', '2023-06-10', '2023-06-10 11:09:56', 7, 50);
INSERT INTO `presensi_harian` VALUES (716, 10, 838, 'S', '', '2023-06-10', '2023-06-10 11:12:15', 7, 51);
INSERT INTO `presensi_harian` VALUES (717, 10, 839, 'M', '', '2023-06-10', '2023-06-10 11:12:15', 7, 51);
INSERT INTO `presensi_harian` VALUES (718, 10, 840, 'M', '', '2023-06-10', '2023-06-10 11:12:15', 7, 51);
INSERT INTO `presensi_harian` VALUES (719, 10, 841, 'M', '', '2023-06-10', '2023-06-10 11:12:15', 7, 51);
INSERT INTO `presensi_harian` VALUES (720, 10, 842, 'M', '', '2023-06-10', '2023-06-10 11:12:15', 7, 51);
INSERT INTO `presensi_harian` VALUES (721, 10, 843, 'A', '', '2023-06-10', '2023-06-10 11:12:15', 7, 51);
INSERT INTO `presensi_harian` VALUES (722, 10, 844, 'A', '', '2023-06-10', '2023-06-10 11:12:15', 7, 51);
INSERT INTO `presensi_harian` VALUES (723, 10, 845, 'M', '', '2023-06-10', '2023-06-10 11:12:15', 7, 51);
INSERT INTO `presensi_harian` VALUES (724, 10, 846, 'M', '', '2023-06-10', '2023-06-10 11:12:15', 7, 51);
INSERT INTO `presensi_harian` VALUES (725, 10, 847, 'A', '', '2023-06-10', '2023-06-10 11:12:16', 7, 51);
INSERT INTO `presensi_harian` VALUES (726, 10, 848, 'M', '', '2023-06-10', '2023-06-10 11:12:16', 7, 51);
INSERT INTO `presensi_harian` VALUES (727, 10, 849, 'M', '', '2023-06-10', '2023-06-10 11:12:16', 7, 51);
INSERT INTO `presensi_harian` VALUES (728, 10, 850, 'M', '', '2023-06-10', '2023-06-10 11:12:16', 7, 51);
INSERT INTO `presensi_harian` VALUES (729, 10, 851, 'M', '', '2023-06-10', '2023-06-10 11:12:16', 7, 51);
INSERT INTO `presensi_harian` VALUES (730, 10, 852, 'M', '', '2023-06-10', '2023-06-10 11:12:16', 7, 51);
INSERT INTO `presensi_harian` VALUES (731, 10, 853, 'M', '', '2023-06-10', '2023-06-10 11:12:16', 7, 51);
INSERT INTO `presensi_harian` VALUES (732, 10, 854, 'M', '', '2023-06-10', '2023-06-10 11:12:16', 7, 51);
INSERT INTO `presensi_harian` VALUES (733, 10, 855, 'M', '', '2023-06-10', '2023-06-10 11:12:16', 7, 51);
INSERT INTO `presensi_harian` VALUES (734, 10, 856, 'A', '', '2023-06-10', '2023-06-10 11:12:16', 7, 51);
INSERT INTO `presensi_harian` VALUES (735, 10, 857, 'A', '', '2023-06-10', '2023-06-10 11:12:16', 7, 51);
INSERT INTO `presensi_harian` VALUES (736, 10, 858, 'M', '', '2023-06-10', '2023-06-10 11:12:16', 7, 51);
INSERT INTO `presensi_harian` VALUES (737, 10, 859, 'M', '', '2023-06-10', '2023-06-10 11:12:16', 7, 51);
INSERT INTO `presensi_harian` VALUES (738, 10, 860, 'A', '', '2023-06-10', '2023-06-10 11:12:16', 7, 51);
INSERT INTO `presensi_harian` VALUES (739, 10, 861, 'M', '', '2023-06-10', '2023-06-10 11:12:16', 7, 51);
INSERT INTO `presensi_harian` VALUES (740, 10, 862, 'M', '', '2023-06-10', '2023-06-10 11:12:16', 7, 51);
INSERT INTO `presensi_harian` VALUES (741, 7, 770, 'A', '', '2023-06-10', '2023-06-10 11:13:36', 7, 50);
INSERT INTO `presensi_harian` VALUES (742, 7, 771, 'M', '', '2023-06-10', '2023-06-10 11:13:36', 7, 50);
INSERT INTO `presensi_harian` VALUES (743, 7, 772, 'A', '', '2023-06-10', '2023-06-10 11:13:36', 7, 50);
INSERT INTO `presensi_harian` VALUES (744, 7, 773, 'M', '', '2023-06-10', '2023-06-10 11:13:36', 7, 50);
INSERT INTO `presensi_harian` VALUES (745, 7, 774, 'S', '', '2023-06-10', '2023-06-10 11:13:36', 7, 50);
INSERT INTO `presensi_harian` VALUES (746, 7, 775, 'A', '', '2023-06-10', '2023-06-10 11:13:36', 7, 50);
INSERT INTO `presensi_harian` VALUES (747, 7, 776, 'M', '', '2023-06-10', '2023-06-10 11:13:36', 7, 50);
INSERT INTO `presensi_harian` VALUES (748, 7, 777, 'M', '', '2023-06-10', '2023-06-10 11:13:36', 7, 50);
INSERT INTO `presensi_harian` VALUES (749, 7, 778, 'M', '', '2023-06-10', '2023-06-10 11:13:36', 7, 50);
INSERT INTO `presensi_harian` VALUES (750, 7, 779, 'M', '', '2023-06-10', '2023-06-10 11:13:36', 7, 50);
INSERT INTO `presensi_harian` VALUES (751, 7, 780, 'M', '', '2023-06-10', '2023-06-10 11:13:36', 7, 50);
INSERT INTO `presensi_harian` VALUES (752, 7, 781, 'A', '', '2023-06-10', '2023-06-10 11:13:36', 7, 50);
INSERT INTO `presensi_harian` VALUES (753, 7, 782, 'A', '', '2023-06-10', '2023-06-10 11:13:36', 7, 50);
INSERT INTO `presensi_harian` VALUES (754, 7, 783, 'M', '', '2023-06-10', '2023-06-10 11:13:36', 7, 50);
INSERT INTO `presensi_harian` VALUES (755, 7, 784, 'M', '', '2023-06-10', '2023-06-10 11:13:36', 7, 50);
INSERT INTO `presensi_harian` VALUES (756, 7, 785, 'M', '', '2023-06-10', '2023-06-10 11:13:36', 7, 50);
INSERT INTO `presensi_harian` VALUES (757, 7, 786, 'M', '', '2023-06-10', '2023-06-10 11:13:36', 7, 50);
INSERT INTO `presensi_harian` VALUES (758, 7, 787, 'M', '', '2023-06-10', '2023-06-10 11:13:36', 7, 50);
INSERT INTO `presensi_harian` VALUES (759, 7, 788, 'M', '', '2023-06-10', '2023-06-10 11:14:23', 7, 54);
INSERT INTO `presensi_harian` VALUES (760, 7, 789, 'M', '', '2023-06-10', '2023-06-10 11:14:23', 7, 54);
INSERT INTO `presensi_harian` VALUES (761, 7, 790, 'M', '', '2023-06-10', '2023-06-10 11:14:23', 7, 54);
INSERT INTO `presensi_harian` VALUES (762, 7, 791, 'M', '', '2023-06-10', '2023-06-10 11:14:23', 7, 54);
INSERT INTO `presensi_harian` VALUES (763, 7, 792, 'M', '', '2023-06-10', '2023-06-10 11:14:23', 7, 54);
INSERT INTO `presensi_harian` VALUES (764, 7, 793, 'M', '', '2023-06-10', '2023-06-10 11:14:23', 7, 54);
INSERT INTO `presensi_harian` VALUES (765, 7, 794, 'M', '', '2023-06-10', '2023-06-10 11:14:23', 7, 54);
INSERT INTO `presensi_harian` VALUES (766, 7, 795, 'M', '', '2023-06-10', '2023-06-10 11:14:23', 7, 54);
INSERT INTO `presensi_harian` VALUES (767, 7, 796, 'M', '', '2023-06-10', '2023-06-10 11:14:23', 7, 54);
INSERT INTO `presensi_harian` VALUES (768, 7, 797, 'M', '', '2023-06-10', '2023-06-10 11:14:23', 7, 54);
INSERT INTO `presensi_harian` VALUES (769, 7, 798, 'M', '', '2023-06-10', '2023-06-10 11:14:23', 7, 54);
INSERT INTO `presensi_harian` VALUES (770, 7, 799, 'M', '', '2023-06-10', '2023-06-10 11:14:23', 7, 54);
INSERT INTO `presensi_harian` VALUES (771, 7, 800, 'M', '', '2023-06-10', '2023-06-10 11:14:23', 7, 54);
INSERT INTO `presensi_harian` VALUES (772, 7, 801, 'M', '', '2023-06-10', '2023-06-10 11:14:23', 7, 54);
INSERT INTO `presensi_harian` VALUES (773, 7, 802, 'M', '', '2023-06-10', '2023-06-10 11:14:23', 7, 54);
INSERT INTO `presensi_harian` VALUES (774, 7, 803, 'M', '', '2023-06-10', '2023-06-10 11:14:23', 7, 54);
INSERT INTO `presensi_harian` VALUES (775, 7, 804, 'M', '', '2023-06-10', '2023-06-10 11:14:23', 7, 54);
INSERT INTO `presensi_harian` VALUES (776, 7, 805, 'M', '', '2023-06-10', '2023-06-10 11:14:23', 7, 54);
INSERT INTO `presensi_harian` VALUES (777, 7, 806, 'M', '', '2023-06-10', '2023-06-10 11:14:23', 7, 54);
INSERT INTO `presensi_harian` VALUES (778, 7, 807, 'M', '', '2023-06-10', '2023-06-10 11:14:23', 7, 54);
INSERT INTO `presensi_harian` VALUES (779, 7, 808, 'M', '', '2023-06-10', '2023-06-10 11:14:23', 7, 54);
INSERT INTO `presensi_harian` VALUES (780, 11, 788, 'M', '', '2023-06-10', '2023-06-10 11:14:29', 7, 54);
INSERT INTO `presensi_harian` VALUES (781, 11, 789, 'M', '', '2023-06-10', '2023-06-10 11:14:29', 7, 54);
INSERT INTO `presensi_harian` VALUES (782, 11, 790, 'M', '', '2023-06-10', '2023-06-10 11:14:29', 7, 54);
INSERT INTO `presensi_harian` VALUES (783, 11, 791, 'M', '', '2023-06-10', '2023-06-10 11:14:29', 7, 54);
INSERT INTO `presensi_harian` VALUES (784, 11, 792, 'M', '', '2023-06-10', '2023-06-10 11:14:29', 7, 54);
INSERT INTO `presensi_harian` VALUES (785, 11, 793, 'M', '', '2023-06-10', '2023-06-10 11:14:29', 7, 54);
INSERT INTO `presensi_harian` VALUES (786, 11, 794, 'M', '', '2023-06-10', '2023-06-10 11:14:29', 7, 54);
INSERT INTO `presensi_harian` VALUES (787, 11, 795, 'M', '', '2023-06-10', '2023-06-10 11:14:29', 7, 54);
INSERT INTO `presensi_harian` VALUES (788, 11, 796, 'M', '', '2023-06-10', '2023-06-10 11:14:29', 7, 54);
INSERT INTO `presensi_harian` VALUES (789, 11, 797, 'M', '', '2023-06-10', '2023-06-10 11:14:29', 7, 54);
INSERT INTO `presensi_harian` VALUES (790, 11, 798, 'M', '', '2023-06-10', '2023-06-10 11:14:29', 7, 54);
INSERT INTO `presensi_harian` VALUES (791, 11, 799, 'M', '', '2023-06-10', '2023-06-10 11:14:29', 7, 54);
INSERT INTO `presensi_harian` VALUES (792, 11, 800, 'M', '', '2023-06-10', '2023-06-10 11:14:29', 7, 54);
INSERT INTO `presensi_harian` VALUES (793, 11, 801, 'M', '', '2023-06-10', '2023-06-10 11:14:29', 7, 54);
INSERT INTO `presensi_harian` VALUES (794, 11, 802, 'M', '', '2023-06-10', '2023-06-10 11:14:30', 7, 54);
INSERT INTO `presensi_harian` VALUES (795, 11, 803, 'M', '', '2023-06-10', '2023-06-10 11:14:30', 7, 54);
INSERT INTO `presensi_harian` VALUES (796, 11, 804, 'M', '', '2023-06-10', '2023-06-10 11:14:30', 7, 54);
INSERT INTO `presensi_harian` VALUES (797, 11, 805, 'M', '', '2023-06-10', '2023-06-10 11:14:30', 7, 54);
INSERT INTO `presensi_harian` VALUES (798, 11, 806, 'M', '', '2023-06-10', '2023-06-10 11:14:30', 7, 54);
INSERT INTO `presensi_harian` VALUES (799, 11, 807, 'M', '', '2023-06-10', '2023-06-10 11:14:30', 7, 54);
INSERT INTO `presensi_harian` VALUES (800, 11, 808, 'M', '', '2023-06-10', '2023-06-10 11:14:30', 7, 54);
INSERT INTO `presensi_harian` VALUES (801, 14, 838, 'A', '', '2023-07-14', '2023-07-14 12:41:12', 7, 56);
INSERT INTO `presensi_harian` VALUES (802, 14, 839, 'M', '', '2023-07-14', '2023-07-14 12:41:12', 7, 56);
INSERT INTO `presensi_harian` VALUES (803, 14, 840, 'I', '', '2023-07-14', '2023-07-14 12:41:12', 7, 56);
INSERT INTO `presensi_harian` VALUES (804, 14, 841, 'M', '', '2023-07-14', '2023-07-14 12:41:12', 7, 56);
INSERT INTO `presensi_harian` VALUES (805, 14, 842, 'M', '', '2023-07-14', '2023-07-14 12:41:12', 7, 56);
INSERT INTO `presensi_harian` VALUES (806, 14, 843, 'M', '', '2023-07-14', '2023-07-14 12:41:12', 7, 56);
INSERT INTO `presensi_harian` VALUES (807, 14, 844, 'M', '', '2023-07-14', '2023-07-14 12:41:12', 7, 56);
INSERT INTO `presensi_harian` VALUES (808, 14, 845, 'M', '', '2023-07-14', '2023-07-14 12:41:12', 7, 56);
INSERT INTO `presensi_harian` VALUES (809, 14, 846, 'M', '', '2023-07-14', '2023-07-14 12:41:12', 7, 56);
INSERT INTO `presensi_harian` VALUES (810, 14, 847, 'M', '', '2023-07-14', '2023-07-14 12:41:12', 7, 56);
INSERT INTO `presensi_harian` VALUES (811, 14, 848, 'M', '', '2023-07-14', '2023-07-14 12:41:12', 7, 56);
INSERT INTO `presensi_harian` VALUES (812, 14, 849, 'M', '', '2023-07-14', '2023-07-14 12:41:12', 7, 56);
INSERT INTO `presensi_harian` VALUES (813, 14, 850, 'M', '', '2023-07-14', '2023-07-14 12:41:12', 7, 56);
INSERT INTO `presensi_harian` VALUES (814, 14, 851, 'M', '', '2023-07-14', '2023-07-14 12:41:12', 7, 56);
INSERT INTO `presensi_harian` VALUES (815, 14, 852, 'M', '', '2023-07-14', '2023-07-14 12:41:12', 7, 56);
INSERT INTO `presensi_harian` VALUES (816, 14, 853, 'M', '', '2023-07-14', '2023-07-14 12:41:12', 7, 56);
INSERT INTO `presensi_harian` VALUES (817, 14, 854, 'M', '', '2023-07-14', '2023-07-14 12:41:13', 7, 56);
INSERT INTO `presensi_harian` VALUES (818, 14, 855, 'M', '', '2023-07-14', '2023-07-14 12:41:13', 7, 56);
INSERT INTO `presensi_harian` VALUES (819, 14, 856, 'M', '', '2023-07-14', '2023-07-14 12:41:13', 7, 56);
INSERT INTO `presensi_harian` VALUES (820, 14, 857, 'M', '', '2023-07-14', '2023-07-14 12:41:13', 7, 56);
INSERT INTO `presensi_harian` VALUES (821, 14, 858, 'M', '', '2023-07-14', '2023-07-14 12:41:13', 7, 56);
INSERT INTO `presensi_harian` VALUES (822, 14, 859, 'M', '', '2023-07-14', '2023-07-14 12:41:13', 7, 56);
INSERT INTO `presensi_harian` VALUES (823, 14, 860, 'M', '', '2023-07-14', '2023-07-14 12:41:13', 7, 56);
INSERT INTO `presensi_harian` VALUES (824, 14, 861, 'M', '', '2023-07-14', '2023-07-14 12:41:13', 7, 56);
INSERT INTO `presensi_harian` VALUES (825, 14, 862, 'M', '', '2023-07-14', '2023-07-14 12:41:13', 7, 56);

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
  `create_at` timestamp(0) NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_prestasi_siswa`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of profil_website
-- ----------------------------
INSERT INTO `profil_website` VALUES ('VOHISA', 'Jl. Istana Mekar Wangi Utama No 1P-Q', '085894632505', 'logo-w.png', 'bulb.png', 'undefined', 'Shop with the nature, Please shop with me', '<p>The Balance Small Business makes launching and managing your own business easy. It is home to experts who provide clear, practical advice on entrepreneurship and management. Whether you&rsquo;re just starting up or you want to take your company to the next level, our 20-year-strong library of more than 7,000 pieces of content will answer your questions and turn your business dreams into reality.</p>\n\n<p><a href=\"https://www.thebalancesmb.com/\">The Balance</a>&nbsp;is part of The Balance family of sites, including&nbsp;<a href=\"https://www.thebalance.com/\" rel=\"noopener\" target=\"_blank\">The Balance</a>&nbsp;and&nbsp;<a href=\"https://www.thebalancecareers.com/\" rel=\"noopener\" target=\"_blank\">The Balance Careers</a>, covering personal finance, career, and small business topics. With more than 24 million monthly visitors, The Balance is among the top-10 largest finance properties as measured by comScore, a leading Internet measurement company. Our more than 50 expert writers have extensive qualifications and expertise in their topics, including MBAs, PhDs, CFPs, other advanced degrees and professional certifications.</p>\n\n<p>The Balance family of sites have been honored by multiple awards in the last year, including&nbsp;<a href=\"https://www.tellyawards.com/winners/2017/short-form-social/general-education-discovery\" rel=\"noopener nofollow\" target=\"_blank\">The Telly Awards</a>,&nbsp;<a href=\"https://www.communicatorawards.com/\" rel=\"noopener nofollow\" target=\"_blank\">The Communicator Awards</a>, and&nbsp;<a href=\"https://www.editorandpublisher.com/news/editor-publisher-announces-the-2017-eppy-award-finalists/\" rel=\"noopener nofollow\" target=\"_blank\">Eppy Awards</a>.</p>\n', 'hallo@smkitasy-syadzili.sch.id', 'Abdur Rochim', 'undefined', 'undefined', 'undefined', 'undefined', 'ea4d58dd1254aff316312b7ecbb5c410.jpg', 'Halo Admin, Saya ingin bertanya/membeli/.....', 'd797c14a0070235734508b7d9f409395.jpg', '&copy; 2019. <a href=\"#\">Core Master</a> by<a href=\"https://myber.co.id\" target=\"_blank\">Myber</a>', 'Core Master', 'SMK IT Asy-Syadzili', 'Malang', 'Indonesia', '112.73866966687321', '-7.970856290609433');

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ruangan
-- ----------------------------
DROP TABLE IF EXISTS `ruangan`;
CREATE TABLE `ruangan`  (
  `id_ruangan` int(11) NOT NULL AUTO_INCREMENT,
  `ruangan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`id_ruangan`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sarana
-- ----------------------------
DROP TABLE IF EXISTS `sarana`;
CREATE TABLE `sarana`  (
  `id_sarana` int(11) NOT NULL AUTO_INCREMENT,
  `sarana` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `jumlah` int(11) NULL DEFAULT NULL,
  `idkelompoksarana_fk` int(11) NULL DEFAULT NULL,
  `idkondisisarana_fk` int(11) NULL DEFAULT NULL,
  `no_inventaris` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `spesifikasi` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `foto` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `tahun_pengadaan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `tanggal_pengadaan` date NULL DEFAULT NULL,
  `idlokasi_fk` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_sarana`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 94 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sarana
-- ----------------------------
INSERT INTO `sarana` VALUES (11, 'Monitor LG 24 inc', 1, 7, 1, 'INK/A2/1', 'LG ', '', '2023', '2023-07-04', 2);
INSERT INTO `sarana` VALUES (12, 'Monitor LG 24 inc', 1, 7, 1, 'INK/A2/2', 'LG', '', '2023', '2023-07-04', 2);
INSERT INTO `sarana` VALUES (13, 'Monitor LG 24 inc', 1, 7, 1, 'INK/A2/3', 'LG', '', '2023', '2023-07-04', 2);
INSERT INTO `sarana` VALUES (14, 'Monitor LG 16 inc', 1, 7, 1, 'INK/A2/4', 'LG', '', '2023', '2023-07-04', 2);
INSERT INTO `sarana` VALUES (15, 'Monitor LG 16 inc', 1, 7, 1, 'INK/A2/5', 'LG', '', '2023', '2023-07-04', 2);
INSERT INTO `sarana` VALUES (16, 'Monitor Samsung 16 inc', 1, 7, 1, 'INK/A2/6', 'Samsung', '', '2023', '2023-07-04', 2);
INSERT INTO `sarana` VALUES (17, 'Monitor LG', 1, 7, 1, 'INK/A2/7', 'LG', '', '2023', '2023-07-04', 2);
INSERT INTO `sarana` VALUES (18, 'Monitor LG', 1, 7, 1, 'INK/A2/8', 'LG', '', '2023', '2023-07-04', 2);
INSERT INTO `sarana` VALUES (19, 'Monitor LG', 1, 7, 1, 'INK/A2/9', 'LG', '', '2023', '2023-07-04', 2);
INSERT INTO `sarana` VALUES (20, 'Monitor LG', 1, 7, 1, 'INK/A2/10', 'LG', '', '2023', '2023-07-04', 2);
INSERT INTO `sarana` VALUES (21, 'Monitor LG', 1, 7, 1, 'INK/A2/11', 'LG', '', '2023', '2023-07-04', 2);
INSERT INTO `sarana` VALUES (22, 'Monitor LG', 1, 7, 1, 'INK/A2/12', 'LG', '', '2023', '2023-07-04', 2);
INSERT INTO `sarana` VALUES (23, 'Monitor LG', 1, 7, 1, 'INK/A2/13', 'LG', '', '2023', '2023-07-04', 2);
INSERT INTO `sarana` VALUES (26, 'Keyboard Logitech', 1, 7, 1, 'INK/A9/1', 'Keyboard Logitech', NULL, '2023', '2023-07-04', 2);
INSERT INTO `sarana` VALUES (27, 'Keyboard M-Tech', 1, 7, 1, 'INK/A9/2', 'Keyboard M-Tech', NULL, '2023', '2023-07-04', 2);
INSERT INTO `sarana` VALUES (28, 'Keyboard M-Tech', 1, 7, 1, 'INK/A9/3', 'Keyboard M-Tech', NULL, '2023', '2023-07-04', 2);
INSERT INTO `sarana` VALUES (29, 'Keyboard Eyota', 1, 7, 1, 'INK/A9/4', 'Keyboard Eyota', NULL, '2023', '2023-07-04', 2);
INSERT INTO `sarana` VALUES (30, 'Keyboard M-Tech', 1, 7, 1, 'INK/A9/5', 'Keyboard M-Tech', NULL, '2023', '2023-07-04', 2);
INSERT INTO `sarana` VALUES (31, 'Keyboard Logitech', 1, 7, 1, 'INK/A9/6', 'Keyboard Logitech', NULL, '2023', '2023-07-04', 2);
INSERT INTO `sarana` VALUES (32, 'Keyboard M-Tech', 1, 7, 3, 'INK/A9/7', 'Keyboard M-Tech', NULL, '2023', '2023-07-04', 2);
INSERT INTO `sarana` VALUES (33, 'Keyboard M-Tech', 1, 7, 1, 'INK/A9/8', 'Keyboard M-Tech', NULL, '2023', '2023-07-04', 2);
INSERT INTO `sarana` VALUES (34, 'Keyboard Ikedo', 1, 7, 3, 'INK/A9/9', 'Keyboard Ikedo', NULL, '2023', '2023-07-04', 2);
INSERT INTO `sarana` VALUES (35, 'Keyboard Eyota', 1, 7, 1, 'INK/A9/10', 'Keyboard Eyota', NULL, '2023', '2023-07-04', 2);
INSERT INTO `sarana` VALUES (36, 'Keyboard Logitech', 1, 7, 1, 'INK/A9/11', 'Keyboard Logitech', NULL, '2023', '2023-07-04', 2);
INSERT INTO `sarana` VALUES (37, 'Keyboard ', 1, 7, 1, 'INK/A9/12', 'Keyboard ', NULL, '2023', '2023-07-04', 2);
INSERT INTO `sarana` VALUES (38, 'Lan Tester Kuning', 1, 7, 1, 'INK/A13/1', NULL, NULL, '2023', '2023-07-04', 2);
INSERT INTO `sarana` VALUES (39, 'Baterai ABC', 1, 7, 1, 'INK/B1/1', NULL, NULL, '2023', '2023-07-04', 2);
INSERT INTO `sarana` VALUES (40, 'Baterai ABC', 1, 7, 1, 'INK/B1/2', NULL, NULL, '2023', '2023-07-04', 2);
INSERT INTO `sarana` VALUES (41, 'IOT Rack Staterkit', 1, 7, 1, 'INK/A14/1', NULL, NULL, '2023', '2023-07-04', 2);
INSERT INTO `sarana` VALUES (42, 'Jumper Jumper', 1, 7, 1, 'INK/A14/2', NULL, NULL, '2023', '2023-07-04', 2);
INSERT INTO `sarana` VALUES (43, 'Obeng Kecil Obeng Kecil', 1, 7, 1, 'INK/A13/2', NULL, NULL, '2023', '2023-07-04', 2);
INSERT INTO `sarana` VALUES (44, 'AFO ', 1, 7, 1, 'INK/A13/3', NULL, NULL, '2023', '2023-07-04', 2);
INSERT INTO `sarana` VALUES (45, 'Solder ', 1, 7, 1, 'INK/A14/3', NULL, NULL, '2023', '2023-07-04', 2);
INSERT INTO `sarana` VALUES (46, 'Cas Baterai ', 1, 7, 1, 'INK/A14/4', NULL, NULL, '2023', '2023-07-04', 2);
INSERT INTO `sarana` VALUES (47, 'CPU 15-4570, 868,2TB', 1, 7, 1, 'INK/A1/1', NULL, NULL, '2023', '2023-07-04', 2);
INSERT INTO `sarana` VALUES (48, 'Monitor LG', 1, 7, 1, 'INK/A2/1', NULL, NULL, '2023', '2023-07-04', 2);
INSERT INTO `sarana` VALUES (49, 'CPU 15-4570,868,2TB', 1, 7, 1, 'INK/A1/2', NULL, NULL, '2023', '2023-07-04', 2);
INSERT INTO `sarana` VALUES (50, 'CPU 15-4570,868,2TB', 1, 7, 1, 'INK/A1/3', NULL, NULL, '2023', '2023-07-04', 2);
INSERT INTO `sarana` VALUES (51, 'CPU Core I3', 1, 7, 1, 'INK/A1/4', NULL, NULL, '2023', '2023-07-04', 2);
INSERT INTO `sarana` VALUES (52, 'CPU Server Mini Core 2Pro', 1, 7, 1, 'INK/A1/5', NULL, NULL, '2023', '2023-07-04', 2);
INSERT INTO `sarana` VALUES (53, 'CPU Server 17', 1, 7, 1, 'INK/A1/6', NULL, NULL, '2023', '2023-07-04', 2);
INSERT INTO `sarana` VALUES (54, 'Mouse Logitech', 1, 7, 1, 'INK/A10/1', NULL, NULL, '2023', '2023-07-04', 2);
INSERT INTO `sarana` VALUES (55, 'Mouse M4 Tech', 1, 7, 1, 'INK/A10/2', NULL, NULL, '2023', '2023-07-04', 2);
INSERT INTO `sarana` VALUES (56, 'Mouse Biru Hitam', 1, 7, 1, 'INK/A10/3', NULL, NULL, '2023', '2023-07-04', 2);
INSERT INTO `sarana` VALUES (57, 'Mouse Votre Biru', 1, 7, 1, 'INK/A10/4', NULL, NULL, '2023', '2023-07-04', 2);
INSERT INTO `sarana` VALUES (58, 'Mouse Votre Biru', 1, 7, 1, 'INK/A10/5', NULL, NULL, '2023', '2023-07-04', 2);
INSERT INTO `sarana` VALUES (59, 'Mouse Votre Hitam', 1, 7, 1, 'INK/A10/6', NULL, NULL, '2023', '2023-07-04', 2);
INSERT INTO `sarana` VALUES (60, 'HDD Seagak 160GB', 1, 7, 1, 'INK/A4/1', NULL, NULL, '2023', '2023-07-04', 2);
INSERT INTO `sarana` VALUES (61, 'HDD Seagak 160GB', 1, 7, 1, 'INK/A4/2', NULL, NULL, '2023', '2023-07-04', 2);
INSERT INTO `sarana` VALUES (62, 'HDD Lup 360GB', 1, 7, 1, 'INK/A4/3', NULL, NULL, '2023', '2023-07-04', 2);
INSERT INTO `sarana` VALUES (63, 'HDD Seagak 80GB', 1, 7, 1, 'INK/A4/4', NULL, NULL, '2023', '2023-07-04', 2);
INSERT INTO `sarana` VALUES (64, 'HDD Seagak 160GB', 1, 7, 1, 'INK/A4/5', NULL, NULL, '2023', '2023-07-04', 2);
INSERT INTO `sarana` VALUES (65, 'HDD Seagak 160GB', 1, 7, 1, 'INK/A4/6', NULL, NULL, '2023', '2023-07-04', 2);
INSERT INTO `sarana` VALUES (66, 'HDD Seagak 160GB', 1, 7, 1, 'INK/A4/7', NULL, NULL, '2023', '2023-07-04', 2);
INSERT INTO `sarana` VALUES (67, 'HDD Samsung 160GB', 1, 7, 1, 'INK/A4/8', NULL, NULL, '2023', '2023-07-04', 2);
INSERT INTO `sarana` VALUES (68, 'HDD WP 160GB', 1, 7, 1, 'INK/A4/9', NULL, NULL, '2023', '2023-07-04', 2);
INSERT INTO `sarana` VALUES (69, 'HDD LT No Spec', 1, 7, 1, 'INK/A4/10', NULL, NULL, '2023', '2023-07-04', 2);
INSERT INTO `sarana` VALUES (70, 'PSU Putih', 1, 7, 1, 'INK/A3/1', NULL, NULL, '2023', '2023-07-04', 2);
INSERT INTO `sarana` VALUES (71, 'PSU Putih', 1, 7, 1, 'INK/A3/2', NULL, NULL, '2023', '2023-07-04', 2);
INSERT INTO `sarana` VALUES (72, 'PSU Putih', 1, 7, 1, 'INK/A3/3', NULL, NULL, '2023', '2023-07-04', 2);
INSERT INTO `sarana` VALUES (73, 'PSU Putih', 1, 7, 1, 'INK/A3/4', NULL, NULL, '2023', '2023-07-04', 2);
INSERT INTO `sarana` VALUES (74, 'PSU Putih', 1, 7, 1, 'INK/A3/5', NULL, NULL, '2023', '2023-07-04', 2);
INSERT INTO `sarana` VALUES (75, 'PSU Hitam', 1, 7, 1, 'INK/A3/6', NULL, NULL, '2023', '2023-07-04', 2);
INSERT INTO `sarana` VALUES (76, 'PSU Hitam', 1, 7, 1, 'INK/A3/7', NULL, NULL, '2023', '2023-07-04', 2);
INSERT INTO `sarana` VALUES (77, 'PSU Hitam', 1, 7, 1, 'INK/A3/8', NULL, NULL, '2023', '2023-07-04', 2);
INSERT INTO `sarana` VALUES (78, 'PSU Hitam', 1, 7, 1, 'INK/A3/9', NULL, NULL, '2023', '2023-07-04', 2);
INSERT INTO `sarana` VALUES (79, 'PSU Hitam', 1, 7, 1, 'INK/A3/10', NULL, NULL, '2023', '2023-07-04', 2);
INSERT INTO `sarana` VALUES (81, 'Lan Tester Maxline Putih', 1, 9, 1, 'INK/A13/4', NULL, NULL, '2023', '2023-07-04', 2);
INSERT INTO `sarana` VALUES (82, 'Lan Tester Maxline Putih', 1, 9, 1, 'INK/A13/5', NULL, NULL, '2023', '2023-07-04', 2);
INSERT INTO `sarana` VALUES (83, 'Lan Tester Maxline Putih', 1, 9, 1, 'INK/A13/6', NULL, NULL, '2023', '2023-07-04', 2);
INSERT INTO `sarana` VALUES (84, 'Tang Krimping Merah', 1, 9, 1, 'INK/A13/7', NULL, NULL, '2023', '2023-07-04', 2);
INSERT INTO `sarana` VALUES (85, 'Tang Krimping Hijau', 1, 9, 1, 'INK/A13/8', NULL, NULL, '2023', '2023-07-04', 2);
INSERT INTO `sarana` VALUES (86, 'Tang Krimping Hijau', 1, 9, 1, 'INK/A13/9', NULL, NULL, '2023', '2023-07-04', 2);
INSERT INTO `sarana` VALUES (87, 'Tang Krimping Hijau', 1, 9, 1, 'INK/A13/10', NULL, NULL, '2023', '2023-07-04', 2);
INSERT INTO `sarana` VALUES (88, 'Tang Krimping Hijau', 1, 9, 1, 'INK/A13/11', NULL, NULL, '2023', '2023-07-04', 2);
INSERT INTO `sarana` VALUES (89, 'Switch Hitam 8 Port', 1, 9, 1, 'INK/A13/12', NULL, NULL, '2023', '2023-07-04', 2);
INSERT INTO `sarana` VALUES (90, 'Switch Putih 8 Port', 1, 9, 1, 'INK/A13/13', NULL, NULL, '2023', '2023-07-04', 2);
INSERT INTO `sarana` VALUES (91, 'Switch Hitam 24 Port', 1, 9, 1, 'INK/A13/14', NULL, NULL, '2023', '2023-07-04', 2);
INSERT INTO `sarana` VALUES (92, 'Pisau Krimping Kuning', 1, 9, 1, 'INK/A13/15', NULL, NULL, '2023', '2023-07-04', 2);
INSERT INTO `sarana` VALUES (93, 'Pisau Krimping Kuning', 1, 9, 1, 'INK/A13/16', NULL, NULL, '2023', '2023-07-04', 2);

-- ----------------------------
-- Table structure for semester
-- ----------------------------
DROP TABLE IF EXISTS `semester`;
CREATE TABLE `semester`  (
  `id_semester` int(11) NOT NULL AUTO_INCREMENT,
  `semester` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `create_at` timestamp(0) NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_semester`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of setting_table
-- ----------------------------
INSERT INTO `setting_table` VALUES (1, 'buku_tamu', 'template_excel', 'include/template/excel/format_cetak_buku_tamu', 'Template Buku Tamu');
INSERT INTO `setting_table` VALUES (2, 'prestasi_siswa', 'template_excel', 'include/template/excel/format_cetak_prestasi_siswa', 'Template Prestasi Siswa');
INSERT INTO `setting_table` VALUES (3, 'kontrol_sarana', 'trans_code', 'KS/{rand}/{date}', 'Template Kontrol Sarana');
INSERT INTO `setting_table` VALUES (4, 'peminjaman_sarana', 'trans_code', 'PS/{rand}/{month}', NULL);
INSERT INTO `setting_table` VALUES (5, 'pengembalian_sarana', 'trans_code', 'NP/001/{rand}', NULL);
INSERT INTO `setting_table` VALUES (6, 'surat_masuk', 'kode_arsip', 'ARSIP/{rand}/{date}', NULL);
INSERT INTO `setting_table` VALUES (7, 'surat_masuk', 'no_surat', 'NOS-{date}-{rand}', NULL);
INSERT INTO `setting_table` VALUES (8, 'surat_keluar', 'kode_arsip', 'SK/{rand}/{date}', NULL);
INSERT INTO `setting_table` VALUES (9, 'surat_keluar', 'no_surat', 'NSK-{rand}-{year}', NULL);
INSERT INTO `setting_table` VALUES (10, 'Transaksi_tanggungan_siswa', 'invoice', 'TS/{rand}/{month}', NULL);
INSERT INTO `setting_table` VALUES (11, 'Transaksi_tanggungan_alumni', 'invoice', 'TTA/{rand}/{year}', NULL);
INSERT INTO `setting_table` VALUES (12, 'pemasukan_lain', 'trans_code', 'PML/{rand}/{date_of_month}', NULL);
INSERT INTO `setting_table` VALUES (13, 'pengeluaran_lain', 'trans_code', 'OUT/{rand}', NULL);
INSERT INTO `setting_table` VALUES (14, 'buku_pemanggilan_siswa', 'kode_pemanggilan', 'PPL/{rand}/{date}', NULL);
INSERT INTO `setting_table` VALUES (15, 'guru', 'kode_pegawai', 'PGW{rand}', NULL);
INSERT INTO `setting_table` VALUES (16, 'sarana', 'no_inventaris', 'SMK/{rand}/{month}', NULL);
INSERT INTO `setting_table` VALUES (17, 'prasarana', 'no_inventaris', 'PRS{rand}', NULL);
INSERT INTO `setting_table` VALUES (18, 'buku_tamu', 'header_print_data', '<p><strong>Cetak Buku Tamu </strong>dengan detail sebagai berikut :</p>\r\n', NULL);
INSERT INTO `setting_table` VALUES (19, 'buku_tamu', 'footer_print_data', '<p><strong>Cetak Buku Tamu </strong>dengan detail sebagai berikut {date}:</p>\r\n', NULL);
INSERT INTO `setting_table` VALUES (20, 'buku_tamu', 'title_print_data', 'Tanda Terima Buku Tamu', NULL);
INSERT INTO `setting_table` VALUES (21, 'buku_tamu', 'title_print_table', 'Cetak Data Buku Tamu', NULL);

-- ----------------------------
-- Table structure for setting_website
-- ----------------------------
DROP TABLE IF EXISTS `setting_website`;
CREATE TABLE `setting_website`  (
  `SPP` double(20, 0) NULL DEFAULT NULL,
  `DSP` double(20, 0) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 894 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of siswa
-- ----------------------------
INSERT INTO `siswa` VALUES (745, '0418/0379.066', 'ABDU RAHMAN FANSYAH', 54, 15, NULL, '0069165142', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (746, '0419/0380.066', 'ABDUL HALIM RADITYANSYAH', 54, 15, NULL, '0064649235', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (747, '0420/0381.066', 'ACHMAD FALIH SABILARROSYAD', 54, 15, NULL, '3074543635', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (748, '0421/0382.066', 'ACHMAD MUSTOFA', 54, 15, NULL, '3064306739', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (749, '0422/0383.066', 'AHMAD AKIA RAIHAN ILYASA', 54, 15, NULL, '0073136292', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (750, '0423/0384.066', 'AHMAD DANI LASMANA', 54, 15, NULL, '0061371837', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (751, '0424/0385.066', 'AHMAD FIRQI', 54, 15, NULL, '3078421180', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (752, '0425/0386.066', 'AHMAD HABIBUROSYAD', 54, 15, NULL, '0062799392', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (753, '0426/0387.066', 'AHMAD NUR ROFI\'UDDIN', 54, 15, NULL, '0072789295', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (754, '0428/0389.066', 'AJIB BAHRUL IHSAN', 54, 15, NULL, '0137713577', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (755, '0429/0390.066', 'ANDIKA BAYU NUGROHO', 54, 15, NULL, '0075426850', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (757, '0431/0392.066', 'DIMAS PRAWIRO GHIFARI', 54, 15, NULL, '0073463642', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (758, '0432/0393.066', 'FAHMI ZAINUL MUTTAQIN', 54, 15, NULL, '0079131597', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (761, '0435/0396.066', 'FATHUN NAJA', 54, 15, NULL, '0073095114', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (763, '0437/0398.066', 'M. ALFIATUR ROHMAN', 54, 15, NULL, '0078941559', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (764, '0438/0399.066', 'M. BAGAS FATURRAHMAN', 54, 15, NULL, '3073037538', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (766, '0440/0401.066', 'M. KHOMSUN FADLI', 54, 15, NULL, '0065423383', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (767, '0441/0402.066', 'MUHAMMAD RABBANI ARDIANSYAH', 54, 15, NULL, '0077553331', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (768, '0442/0403.066', 'QODIMUL ZAKWAN MUCHTAR', 54, 15, NULL, '0075749439', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (769, '0527/0442.066', 'AHMAD RAYHAN ARDHANI PUTRA', 54, 15, NULL, '0078509847', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (770, '0443/0404.066', 'MAULANA FAIZ FIRMANSYAH', 55, 15, NULL, '0075501673', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (771, '0444/0405.066', 'MOCHAMAD BASUKI RAHMAT', 55, 15, NULL, '0069430185', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (772, '0445/0406.066', 'MOCHAMMAD MIFTAH ULUMIDDIN', 55, 15, NULL, '0072551440', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (773, '0446/0407.066', 'MOH. ANGGA ARDIANSYAH', 55, 15, NULL, '3140925766', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (774, '0447/0408.066', 'MOH. DAFFA SAFIRUZZAHIQ', 55, 15, NULL, '0071260146', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (775, '0346/0338.066', 'MOH. SAFI', 55, 15, NULL, '0057890376', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (776, '0448/0409.066', 'MOHAMMAD BURHANUDDIN', 55, 15, NULL, '0072388192', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (777, '0449/0410.066', 'MUCHAMMAD ABDUL HADI', 55, 15, NULL, '0076698204', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (778, '0450/0411.066', 'MUCHAMMAD ROYKHAN FIRDAUS', 55, 15, NULL, '0079080304', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (779, '0451/0412.066', 'MUH MAULANA FAHMI RAMADAN', 55, 15, NULL, '0071874212', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (780, '0452/0413.066', 'MUH. SAIFUDDIN ZAKARIA', 55, 15, NULL, '0081788883', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (781, '0453/0414.066', 'MUHAMMAD ASHRUL', 55, 15, NULL, '0068199958', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (782, '0454/0415.066', 'MUHAMMAD FAHRI HUSEIN', 55, 15, NULL, '0062722726', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (783, '0455/0416.066', 'MUHAMMAD HASYIM MASHURI', 55, 15, NULL, '0076831619', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (784, '0456/0417.066', 'MUHAMMAD KHOIRON KHOLES', 55, 15, NULL, '0061884649', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (785, '0457/0418.066', 'R. FANDI MUDIAN PRADANA', 55, 15, NULL, '0062515946', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (786, '0458/0419.066', 'RIDHO SAPUTRA', 55, 15, NULL, '0079697772', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (787, '0459/0420.066', 'SYAHRUL MINAN', 55, 15, NULL, '0066001948', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (788, '0373/0375.066', 'ABDURAHMAN', 59, 15, NULL, '0067880353', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (789, '0330/0322.066', 'ACHMAD THORIQ AL-AYYUBI', 59, 15, NULL, '0056608424', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (790, '0332/0324.066', 'BAGUS SANDIARTA', 59, 15, NULL, '0068814134', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (791, '0333/0325.066', 'CAHYA INDRA LUKMANA', 59, 15, NULL, '0047199197', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (792, '0334/0326.066', 'DANIEL DECO NAJHAN ZALFA', 59, 15, NULL, '0057748395', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (793, '0335/0327.066', 'DHONI AHMAD MUHAJJIR', 59, 15, NULL, '0067878114', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (794, '0336/0328.066', 'DZIKRU ROZAQ', 59, 15, NULL, '0057422277', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (795, '0337/0329.066', 'ERLANGGA CAHYA PUTRA', 59, 15, NULL, '0040594985', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (796, '0338/0330.066', 'FARIHIN IHSAN', 59, 15, NULL, '0066679121', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (797, '0339/0331.066', 'M. DAWAM ROYHANUL MUKAROM', 59, 15, NULL, '0059147289', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (798, '0341/0333.066', 'MOCHAMAD ROYKHAN KEN IZZUDDIN', 59, 15, NULL, '0063548177', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (799, '0342/0334.066', 'MOCHAMMAD FAQIHUDDIN HUDA', 59, 15, NULL, '0062544895', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (800, '0343/0335.066', 'MOCHAMMAD GIAN HARJA YODHA', 59, 15, NULL, '0063349095', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (801, '0347/0339.066', 'MOKHAMAD ZULFIKAR PUTRA IMRON', 59, 15, NULL, '0061887505', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (802, '0351/0343.066', 'MUKHAMAD AMIR AKHSANUL KHOLIQIN', 59, 15, NULL, '0051277067', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (803, '0352/0344.066', 'NAIL MAJID SANTOSO', 59, 15, NULL, '0062660804', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (804, '0353/0345.066', 'NAWWAL IRFAN MUHAMMAD', 59, 15, NULL, '9015710923', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (805, '0354/0346.066', 'NOZA JIMMY PRASETYO', 59, 15, NULL, '0058955052', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (806, '0355/0347.066', 'RAIHAN ALFARIZI', 59, 15, NULL, '0047175695', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (807, '0356/0348.066', 'ROISUL AHYER', 59, 15, NULL, '0054714506', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (808, '0360/0362.066', 'YUSRIL SAFRIL AHMADA', 59, 15, NULL, '0063148476', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (809, '0361/0363.066', 'AGUSTI REVI NUHHA', 60, 15, NULL, '0054483225', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (810, '0362/0364.066', 'AUHA MAY ZIADAH', 60, 15, NULL, '0057243211', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (811, '0363/0365.066', 'DYAH RINI KUSUMAWATI', 60, 15, NULL, '0069144139', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (812, '0528/0443.066', 'ASHA AZARIA', 60, 15, NULL, '0065917319', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (813, '0366/0368.066', 'AISYATUR RIDHO', 60, 15, NULL, '3066149152', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (814, '0367/0369.066', 'FAKHMADIANA MAULIDAH HAFSOH', 60, 15, NULL, '0067749903', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (815, '0368/0370.066', 'FEBBY KHUSNUL RAHMAWATI', 60, 15, NULL, '0061465631', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (816, '0369/0371.066', 'NADINE SYARA FEBRIANA', 60, 15, NULL, '0068591330', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (817, '0370/0372.066', 'TUHFATUS SANIYYAH SALSABILA', 60, 15, NULL, '0068786584', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (818, '0371/0373.066', 'ZAHWA FARAHDINA MAULIDI', 60, 15, NULL, '0067616431', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (819, '0372/0374.066', 'ISMI HELMA RAHMAWATI', 60, 15, NULL, '0058264514', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (820, '0374/0376.066', 'MIRZA IMELIA ANJANI', 60, 15, NULL, '0059090740', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (821, '0523/0121.089', 'ANNISA HARTANTI', 58, 16, NULL, '0065260243', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (822, '0524/0122.089', 'DEVI ZASKIA TIARA R.', 58, 16, NULL, '0068665861', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (823, '0525/0123.089', 'OLGA BERLIN AGUSTIN', 58, 16, NULL, '0067135489', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (824, '0526/0124.089', 'SAFEBRILA', 58, 16, NULL, '0075728322', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (825, '0373/0109.089', 'AINUN JAMILA', 62, 16, NULL, '0052334753', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (827, '0375/0111.089', 'AULIA NABILATUZ ZAHRO AL MAWADDAH', 62, 16, NULL, '0053542754', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (828, '0376/0112.089', 'CITRA CHINTIYA SARI', 62, 16, NULL, '0068427623', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (829, '0377/0113.089', 'EKA FARIHATUL AFIANTI', 62, 16, NULL, '0062729010', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (830, '0364/0366.066', 'KHUSNUL KHOTIMAH PUTRI WIJAYA', 62, 16, NULL, '0061695528', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (831, '0378/0114.089', 'NADIA RAHMA PUTRI', 62, 16, NULL, '0055404878', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (832, '0379/0115.089', 'NAILAL FAROHAH ABIDIN', 62, 16, NULL, '0055065967', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (833, '0380/0116.089', 'NAZLATUS MASDHA', 62, 16, NULL, '0064513847', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (834, '0381/0117.089', 'RENATA SYAKILLA ROHMATUS SYA\'DIYAH', 62, 16, NULL, '0069163400', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (835, '0382/0118.089', 'UMI FARIDA ZULFA', 62, 16, NULL, '0054460115', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (836, '0383/0119.089', 'YASINTA HASNA ANWAR', 62, 16, NULL, '0062008680', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (837, '0384/0120.089', 'ZAKIYAH NAYLAL IZZAH', 62, 16, NULL, '0065032872', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (838, '0482/0150.126', 'ABDUL MUN\'IM ZAM ZAMY', 56, 17, NULL, '0066259392', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (839, '0483/0151.126', 'ABDULLOH ABID AL-QODRI', 56, 17, NULL, '0072608620', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (840, '0485/0152.126', 'AHMAD ROZAK RABANI ', 56, 17, NULL, '0061300124', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (841, '0486/0153.126', 'ALIF MUHAMMAD GATRA ABDULLAH', 56, 17, NULL, '0071343492', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (842, '0487/0154.126', 'ARY ARDIANSYAH', 56, 17, NULL, '0055139870', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (843, '0488/0155.126', 'DAMMAWUZ ZAINAL ALFATH', 56, 17, NULL, '0074572997', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (844, '0490/0157.126', 'DEEDAD AL BALIYA', 56, 17, NULL, '0066782020', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (845, '0492/0159.126', 'FIAN MAULIDAN HARDIYANTA', 56, 17, NULL, '0072547745', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (846, '0493/0160.126', 'GALANG ULUL ALBAB', 56, 17, NULL, '0065148726', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (847, '0494/0161.126', 'GILANG SATRIA RAMADHANI', 56, 17, NULL, '0077913368', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (848, '0495/0162.126', 'IMAM AHMAD KHUDAEFI ALBAR', 56, 17, NULL, '0061429078', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (849, '0496/0163.126', 'KHANSA AFRINANDA AGASI', 56, 17, NULL, '00743950676', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (850, '0529/0444.066', 'M. AGUS SAIFUDIN ZUHRI', 56, 17, NULL, '3060985986', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (851, '0497/0164.126', 'M. FAKHRUR RAMADHANI', 56, 17, NULL, '0069608542', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (852, '0498/0165.126', 'M. IZZUDDIN RIFQI', 56, 17, NULL, '0067447751', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (853, '0499/0166.126', 'MOCH. RAFY DENIS SYAHBANA', 56, 17, NULL, '3068442841', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (854, '0500/0167.126', 'MUCHAMMAD AZAM FANANI', 56, 17, NULL, '0081109823', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (855, '0501/0168.126', 'MUHAMMAD ADILAH RAYHAN', 56, 17, NULL, '0072886495', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (856, '0502/0169.126', 'MUHAMMAD FAROUQ ABDUL GHONI', 56, 17, NULL, '0067454815', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (857, '0503/0170.126', 'MUHAMMAD MAKAYLA AKBAR', 56, 17, NULL, '0079757883', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (858, '0504/0171.126', 'MUHAMMAD RIDWAN KAUTSAR FATAHILLAH', 56, 17, NULL, '3078830961', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (859, '0505/0172.126', 'MUHAMMAD SYAUQI', 56, 17, NULL, '0064331432', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (860, '0506/0173.126', 'SULTAN BILAL AN-NAFI\'', 56, 17, NULL, '0067590318', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (861, '0507/0174.126', 'TRIO MICKI GALIH SAPUTRA', 56, 17, NULL, '0072024702', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (862, '0508/0175.126', 'ZUNNOON NAZRAN JANKI DAUSAT', 56, 17, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (863, '0509/0176.126', 'AFRINA FAROH FIRJANI', 57, 17, NULL, '0066655578', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (864, '0511/0178.126', 'ALIF ALFIYATUS SA\'DIYAH', 57, 17, NULL, '0073331914', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (865, '0512/0179.126', 'AZZAH RATUL KHUSNIAH', 57, 17, NULL, '0078157507', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (866, '0513/0180.126', 'DIHAN AMELIA PUTRI', 57, 17, NULL, '0079035274', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (867, '0481/0191.066', 'DINDA AKTHA FEBIANA', 57, 17, NULL, '0075893411', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (868, '0514/0181.126', 'DWI AFIFAH KHOIRUNISA', 57, 17, NULL, '0077477614', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (869, '0515/0182.126', 'ELSA SALSABILA', 57, 17, NULL, '0065520544', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (870, '0516/0183.126', 'FIRDA NADHIFAH MAULANA', 57, 17, NULL, '0071372648', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (871, '0517/0184.126', 'HIMA TALIA EL-FURQONIA', 57, 17, NULL, '0078626899', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (872, '0518/0185.126', 'INTAN AYU PERMATA SARI', 57, 17, NULL, '0078634684', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (873, '0519/0186.126', 'NAJWA NAJUBA', 57, 17, NULL, '0072568723', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (874, '0520/0187.126', 'RIMAS NIA AGUSTIN', 57, 17, NULL, '0069457284', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (875, '0521/0188.126', 'TATIA NUR DIANA', 57, 17, NULL, '0065492014', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (876, '0522/0189.126', 'ZAFITRI OCTAVIANI', 57, 17, NULL, '0065492014', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (877, '0385/0121.126', 'ACHMAD WAHYU AL-BAIHAQI', 61, 17, NULL, '0053620090', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (879, '0391/0127.126', 'DICKY PUTRA ARDIANSYAH', 61, 17, NULL, '0052215578', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (880, '0392/0128.126', 'FIDI GAUTAMA VALENTINO ANTOLIN', 61, 17, NULL, '0067937559', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (881, '0393/0129.126', 'FIRZHA IBRAHIM WIDYA NUGROHO', 61, 17, NULL, '0065552760', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (882, '0394/0130.126', 'FITRA AL INSANI', 61, 17, NULL, '0062112675', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (883, '0395/0131.126', 'HABIB MAS\'UD DJAZULI', 61, 17, NULL, '0062088628', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (884, '0397/0133.126', 'HASBI AFRIZAL FAHMI', 61, 17, NULL, '0055870342', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (885, '0401/0137.126', 'MUHAMMAD ROIZU DZUL FIKRI', 61, 17, NULL, '0053709363', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (886, '0402/0138.126', 'MUHAMMAD YASYFI FUADANA', 61, 17, NULL, '0069710443', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (887, '0408/0144.126', 'WILDAN SALASA', 61, 17, NULL, '0068160996', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (888, '0386/0122.126', 'ADHELIA PUTRI ISLAMIAH', 66, 17, NULL, '52646450', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (889, '0388/0124.126', 'AMANDA RAHMAWATI', 66, 17, NULL, '67413209', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (890, '0389/0125.126', 'CHOIROTUL ULA', 66, 17, NULL, '59215471', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (891, '0396/0132.126', 'HABIBAH SHOFI FUTUHIL AULIA', 66, 17, NULL, '52600824', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (892, '0403/0139.126', 'NISRINA WASHFA NABILA', 66, 17, NULL, '55944451', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `siswa` VALUES (893, '0406/0142.126', 'SHOFI SAVIRA', 66, 17, NULL, '55178461', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
  `create_at` timestamp(0) NULL DEFAULT current_timestamp(),
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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
  `create_at` timestamp(0) NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_surat_keluar`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
  `create_at` timestamp(0) NULL DEFAULT current_timestamp(),
  `no_surat` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `file_arsip` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  PRIMARY KEY (`id_surat_masuk`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tahun_ajaran
-- ----------------------------
DROP TABLE IF EXISTS `tahun_ajaran`;
CREATE TABLE `tahun_ajaran`  (
  `id_tahun_ajaran` int(11) NOT NULL AUTO_INCREMENT,
  `tahun_ajaran` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `create_at` timestamp(0) NULL DEFAULT current_timestamp(),
  `is_active` int(11) NULL DEFAULT NULL,
  `semester` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`id_tahun_ajaran`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tahun_ajaran
-- ----------------------------
INSERT INTO `tahun_ajaran` VALUES (7, '2022/2023', '2023-05-15 09:50:52', 1, 'genap');

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tingkat
-- ----------------------------
DROP TABLE IF EXISTS `tingkat`;
CREATE TABLE `tingkat`  (
  `id_tingkat` int(11) NOT NULL AUTO_INCREMENT,
  `tingkat` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `create_at` timestamp(0) NULL DEFAULT current_timestamp(),
  `iddepartment_fk` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_tingkat`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
  `create_at` timestamp(0) NULL DEFAULT current_timestamp(),
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
  `create_at` timestamp(0) NULL DEFAULT current_timestamp(),
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
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, '127.0.0.1', 'admin', '$2y$08$mxSDKMRKsKM3IwN6NPoB6.3pQqymDu4ZtGAMIzpw.ppcie3MJM9ty', '', 'hello@admin.com', '', NULL, NULL, NULL, 1268889823, 1689660397, 1, 'admin', 'Yani', 'ADMIN', '085894632505', '3c8f6f36f650d5ce07803470b4f4d4ff.jpg', NULL, NULL, NULL, NULL, 1, 1, 1, 1);
INSERT INTO `users` VALUES (16, '::1', 'Uzza', '$2y$08$NWb0Hx4O1O6sblcUzo79UuYnnx8HsClZxb/pFBVSW5Sx08Q9O4/Vu', NULL, 'Uzza@gmail.com', NULL, NULL, NULL, NULL, 1684205605, 1689319907, 1, 'Roikhatul Uzza, S.Psi', NULL, NULL, NULL, NULL, 43, 'guru', NULL, NULL, 1, 1, 1, 1);
INSERT INTO `users` VALUES (17, '::1', 'avi', '$2y$08$26COncN1CmGyf9DMjwWQ1uv7BTkep.72/9lN3gsMGy7Y.R53EOSyu', NULL, 'avi@gmail.com', NULL, NULL, NULL, NULL, 1684289201, 1689320117, 1, 'Avi Hendratmoko, S.Kom', NULL, NULL, NULL, NULL, 31, 'guru', NULL, NULL, 1, 1, 1, 1);
INSERT INTO `users` VALUES (18, '::1', 'bucin', '$2y$08$ac9q6y7ZJ1JctdH1.EgtlOn20AAq6.C1SzdscU/yqjLDqcYPF3nh6', NULL, 'bucin@gmail.com', NULL, NULL, NULL, NULL, 1684289369, 1689665659, 1, 'Cindy Permata Putri, S.Pd', NULL, NULL, NULL, NULL, 46, 'guru', NULL, NULL, 1, 1, 1, 1);
INSERT INTO `users` VALUES (19, '::1', 'ibusosialita', '$2y$08$NzCE.BnGhAMfzjqQwZjfIexojKwaa7.g5D.DsnWN71u0UjkzFXdFu', NULL, 'ibusosialita@gmail.com', NULL, NULL, NULL, NULL, 1684289621, 1684289772, 1, 'Andiani Kristanti, S.Pd', NULL, NULL, NULL, NULL, 44, 'guru', NULL, NULL, 1, 1, 1, 1);
INSERT INTO `users` VALUES (20, '140.213.57.203', 'dhani', '$2y$08$B/jrm1i1Df7UAY3sv6n8Ou2JuNxDvus70Ha0607TM.jcEFqPtWqO2', NULL, 'dhani@gmail.com', NULL, NULL, NULL, NULL, 1684291380, 1689319867, 1, 'Ramadhani Samboga, S.Pd', NULL, NULL, NULL, NULL, 52, 'guru', NULL, NULL, 1, 1, 1, 1);
INSERT INTO `users` VALUES (21, '140.213.57.161', 'nazib', '$2y$08$QXtCxq7sdoYWHCy7dR1mJuJVqXP3g4wESpSfrM7u2Ax3zENRL/49S', NULL, 'nazib@gmail.com', NULL, NULL, NULL, NULL, 1684294587, 1689313021, 1, 'Mohammad Nazibullah, M.Pd', NULL, NULL, NULL, NULL, 45, 'guru', NULL, NULL, 1, 1, 1, 1);
INSERT INTO `users` VALUES (22, '::1', 'is_456609', '$2y$08$fBvt3x7KVuQVm0ujzkNxseu3qste5SpIol.Tm/xYmkt0YHtLK9rQe', NULL, 'is_456609@gmail.com', NULL, NULL, NULL, NULL, 1689313224, NULL, 1, 'Ika Uswatun Hasanah, S.Pd', NULL, NULL, NULL, NULL, 51, 'guru', NULL, NULL, 1, 1, 1, 1);
INSERT INTO `users` VALUES (23, '::1', 'pohet', '$2y$08$NHZf/dk2ImgvsMBoFkjZJ.YMBRPb9nIz/5VdzbAhD22MUrEWlFMwO', NULL, 'pohet@gmail.com', NULL, NULL, NULL, NULL, 1689319435, 1689573347, 1, 'Pohet Bintoto, S.Pd., M.Si', NULL, NULL, NULL, NULL, 29, 'guru', NULL, NULL, 1, 1, 1, 1);

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
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of users_groups
-- ----------------------------
INSERT INTO `users_groups` VALUES (1, 1, 1);
INSERT INTO `users_groups` VALUES (16, 16, 3);
INSERT INTO `users_groups` VALUES (17, 17, 3);
INSERT INTO `users_groups` VALUES (18, 18, 3);
INSERT INTO `users_groups` VALUES (19, 19, 3);
INSERT INTO `users_groups` VALUES (20, 20, 3);
INSERT INTO `users_groups` VALUES (21, 21, 3);
INSERT INTO `users_groups` VALUES (22, 22, 3);
INSERT INTO `users_groups` VALUES (23, 23, 3);

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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wali_kelas
-- ----------------------------
INSERT INTO `wali_kelas` VALUES (1, 1, 4, 39);

-- ----------------------------
-- View structure for v_bank_soal_quiz
-- ----------------------------
DROP VIEW IF EXISTS `v_bank_soal_quiz`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`localhost` SQL SECURITY DEFINER VIEW `v_bank_soal_quiz` AS select `bank_soal`.`id_bank_soal` AS `id_bank_soal`,`bank_soal`.`soal` AS `soal`,`bank_soal`.`time_soal` AS `time_soal`,`bank_soal`.`code_soal` AS `code_soal`,`bank_soal`.`idmatapelajaran_fk` AS `idmatapelajaran_fk`,`bank_soal`.`idguru_fk` AS `idguru_fk`,`question_cas`.`id_question_cas` AS `id_question_cas`,`question_cas`.`type` AS `type`,`question_cas`.`idbanksoal_fk` AS `idbanksoal_fk`,`question_cas`.`idquiz_fk` AS `idquiz_fk` from (`bank_soal` join `question_cas` on(`question_cas`.`idbanksoal_fk` = `bank_soal`.`id_bank_soal`)) ;

-- ----------------------------
-- View structure for v_buku_pemanggilan_siswa
-- ----------------------------
DROP VIEW IF EXISTS `v_buku_pemanggilan_siswa`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`localhost` SQL SECURITY DEFINER VIEW `v_buku_pemanggilan_siswa` AS select `buku_pemanggilan_siswa`.`id_buku_pemanggilan_siswa` AS `id_buku_pemanggilan_siswa`,`buku_pemanggilan_siswa`.`idsiswa_fk` AS `idsiswa_fk`,`buku_pemanggilan_siswa`.`masalah` AS `masalah`,`buku_pemanggilan_siswa`.`pemecahan` AS `pemecahan`,`buku_pemanggilan_siswa`.`tindak_lanjut` AS `tindak_lanjut`,`buku_pemanggilan_siswa`.`keterangan` AS `keterangan`,`buku_pemanggilan_siswa`.`tanggal` AS `tanggal`,`buku_pemanggilan_siswa`.`kode_pemanggilan` AS `kode_pemanggilan`,`siswa`.`id_siswa` AS `id_siswa`,`siswa`.`nis` AS `nis`,`siswa`.`nama` AS `nama`,`siswa`.`idkelas_fk` AS `idkelas_fk`,`siswa`.`idjurusan_fk` AS `idjurusan_fk`,`siswa`.`agama` AS `agama`,`siswa`.`nisn` AS `nisn`,`siswa`.`no_ijazah_sekolah_asal` AS `no_ijazah_sekolah_asal`,`siswa`.`no_skhun_sekolah_asal` AS `no_skhun_sekolah_asal`,`siswa`.`no_un_sekolah_asal` AS `no_un_sekolah_asal`,`siswa`.`no_kk` AS `no_kk`,`siswa`.`npsn_sekolah_asal` AS `npsn_sekolah_asal`,`siswa`.`nama_sekolah_asal` AS `nama_sekolah_asal`,`siswa`.`tempat_lahir` AS `tempat_lahir`,`siswa`.`tanggal_lahir` AS `tanggal_lahir`,`siswa`.`berkebutuhan_khusus` AS `berkebutuhan_khusus`,`siswa`.`alamat` AS `alamat`,`siswa`.`dusun` AS `dusun`,`siswa`.`rt` AS `rt`,`siswa`.`rw` AS `rw`,`siswa`.`kelurahan` AS `kelurahan`,`siswa`.`foto` AS `foto`,`siswa`.`idprovince_fk` AS `idprovince_fk`,`siswa`.`idcities_fk` AS `idcities_fk`,`siswa`.`nama_ayah` AS `nama_ayah`,`siswa`.`tempat_lahir_ayah` AS `tempat_lahir_ayah`,`siswa`.`tanggal_lahir_ayah` AS `tanggal_lahir_ayah`,`siswa`.`pendidikan_ayah` AS `pendidikan_ayah`,`siswa`.`pekerjaan_ayah` AS `pekerjaan_ayah`,`siswa`.`penghasilan_ayah` AS `penghasilan_ayah`,`siswa`.`nama_ibu` AS `nama_ibu`,`siswa`.`tempat_lahir_ibu` AS `tempat_lahir_ibu`,`siswa`.`tanggal_lahir_ibu` AS `tanggal_lahir_ibu`,`siswa`.`pendidikan_ibu` AS `pendidikan_ibu`,`siswa`.`pekerjaan_ibu` AS `pekerjaan_ibu`,`siswa`.`penghasilan_ibu` AS `penghasilan_ibu`,`siswa`.`tinggi_badan` AS `tinggi_badan`,`siswa`.`berat_badan` AS `berat_badan`,`siswa`.`jarak_ke_sekolah` AS `jarak_ke_sekolah`,`siswa`.`waktu_ke_sekolah` AS `waktu_ke_sekolah`,`siswa`.`jumlah_saudara` AS `jumlah_saudara`,`siswa`.`jenis_kelamin` AS `jenis_kelamin` from (`buku_pemanggilan_siswa` join `siswa` on(`siswa`.`id_siswa` = `buku_pemanggilan_siswa`.`idsiswa_fk`)) ;

-- ----------------------------
-- View structure for v_catatan_siswa
-- ----------------------------
DROP VIEW IF EXISTS `v_catatan_siswa`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`localhost` SQL SECURITY DEFINER VIEW `v_catatan_siswa` AS select `catatan_siswa`.`id_catatan_siswa` AS `id_catatan_siswa`,`catatan_siswa`.`idsiswa_fk` AS `idsiswa_fk`,`catatan_siswa`.`idkelas_fk` AS `idkelas_fk`,`catatan_siswa`.`idguru_fk` AS `idguru_fk`,`catatan_siswa`.`tanggal` AS `tanggal`,`catatan_siswa`.`uraian` AS `uraian`,`catatan_siswa`.`teruskan_ke` AS `teruskan_ke`,`catatan_siswa`.`idtahunajaran_fk` AS `idtahunajaran_fk`,`catatan_siswa`.`idmapel_fk` AS `idmapel_fk`,`siswa`.`id_siswa` AS `id_siswa`,`siswa`.`nis` AS `nis`,`siswa`.`nama` AS `nama`,`siswa`.`idjurusan_fk` AS `idjurusan_fk`,`siswa`.`agama` AS `agama`,`siswa`.`nisn` AS `nisn`,`siswa`.`no_ijazah_sekolah_asal` AS `no_ijazah_sekolah_asal`,`siswa`.`no_skhun_sekolah_asal` AS `no_skhun_sekolah_asal`,`siswa`.`no_un_sekolah_asal` AS `no_un_sekolah_asal`,`siswa`.`no_kk` AS `no_kk`,`siswa`.`npsn_sekolah_asal` AS `npsn_sekolah_asal`,`siswa`.`nama_sekolah_asal` AS `nama_sekolah_asal`,`siswa`.`tempat_lahir` AS `tempat_lahir`,`siswa`.`tanggal_lahir` AS `tanggal_lahir`,`siswa`.`berkebutuhan_khusus` AS `berkebutuhan_khusus`,`siswa`.`alamat` AS `alamat`,`siswa`.`dusun` AS `dusun`,`siswa`.`rt` AS `rt`,`siswa`.`rw` AS `rw`,`siswa`.`kelurahan` AS `kelurahan`,`siswa`.`foto` AS `foto`,`siswa`.`idprovince_fk` AS `idprovince_fk`,`siswa`.`idcities_fk` AS `idcities_fk`,`siswa`.`nama_ayah` AS `nama_ayah`,`siswa`.`tempat_lahir_ayah` AS `tempat_lahir_ayah`,`siswa`.`tanggal_lahir_ayah` AS `tanggal_lahir_ayah`,`siswa`.`pendidikan_ayah` AS `pendidikan_ayah`,`siswa`.`pekerjaan_ayah` AS `pekerjaan_ayah`,`siswa`.`penghasilan_ayah` AS `penghasilan_ayah`,`siswa`.`nama_ibu` AS `nama_ibu`,`siswa`.`tempat_lahir_ibu` AS `tempat_lahir_ibu`,`siswa`.`tanggal_lahir_ibu` AS `tanggal_lahir_ibu`,`siswa`.`pendidikan_ibu` AS `pendidikan_ibu`,`siswa`.`pekerjaan_ibu` AS `pekerjaan_ibu`,`siswa`.`penghasilan_ibu` AS `penghasilan_ibu`,`siswa`.`tinggi_badan` AS `tinggi_badan`,`siswa`.`berat_badan` AS `berat_badan`,`siswa`.`jarak_ke_sekolah` AS `jarak_ke_sekolah`,`siswa`.`waktu_ke_sekolah` AS `waktu_ke_sekolah`,`siswa`.`jumlah_saudara` AS `jumlah_saudara`,`siswa`.`jenis_kelamin` AS `jenis_kelamin` from (`catatan_siswa` join `siswa` on(`catatan_siswa`.`idsiswa_fk` = `siswa`.`id_siswa`)) ;

-- ----------------------------
-- View structure for v_catatan_siswa_harian
-- ----------------------------
DROP VIEW IF EXISTS `v_catatan_siswa_harian`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`localhost` SQL SECURITY DEFINER VIEW `v_catatan_siswa_harian` AS select `catatan_siswa`.`id_catatan_siswa` AS `id_catatan_siswa`,`catatan_siswa`.`idsiswa_fk` AS `idsiswa_fk`,`catatan_siswa`.`idkelas_fk` AS `idkelas_fk`,`catatan_siswa`.`idguru_fk` AS `idguru_fk`,`catatan_siswa`.`tanggal` AS `tanggal`,`catatan_siswa`.`uraian` AS `uraian`,`catatan_siswa`.`teruskan_ke` AS `teruskan_ke`,`catatan_siswa`.`idtahunajaran_fk` AS `idtahunajaran_fk`,`catatan_siswa`.`idmapel_fk` AS `idmapel_fk`,`catatan_siswa`.`is_tindakan` AS `is_tindakan`,`siswa`.`id_siswa` AS `id_siswa`,`siswa`.`nis` AS `nis`,`siswa`.`nama` AS `nama`,`siswa`.`agama` AS `agama`,`siswa`.`nisn` AS `nisn`,`siswa`.`no_ijazah_sekolah_asal` AS `no_ijazah_sekolah_asal`,`siswa`.`no_skhun_sekolah_asal` AS `no_skhun_sekolah_asal`,`siswa`.`no_un_sekolah_asal` AS `no_un_sekolah_asal`,`siswa`.`no_kk` AS `no_kk`,`siswa`.`npsn_sekolah_asal` AS `npsn_sekolah_asal`,`siswa`.`nama_sekolah_asal` AS `nama_sekolah_asal`,`siswa`.`tempat_lahir` AS `tempat_lahir`,`siswa`.`tanggal_lahir` AS `tanggal_lahir`,`siswa`.`berkebutuhan_khusus` AS `berkebutuhan_khusus`,`siswa`.`alamat` AS `alamat`,`siswa`.`dusun` AS `dusun`,`siswa`.`rt` AS `rt`,`siswa`.`rw` AS `rw`,`siswa`.`kelurahan` AS `kelurahan`,`siswa`.`foto` AS `foto`,`siswa`.`idprovince_fk` AS `idprovince_fk`,`siswa`.`idcities_fk` AS `idcities_fk`,`siswa`.`nama_ayah` AS `nama_ayah`,`siswa`.`tempat_lahir_ayah` AS `tempat_lahir_ayah`,`siswa`.`tanggal_lahir_ayah` AS `tanggal_lahir_ayah`,`siswa`.`pendidikan_ayah` AS `pendidikan_ayah`,`siswa`.`pekerjaan_ayah` AS `pekerjaan_ayah`,`siswa`.`penghasilan_ayah` AS `penghasilan_ayah`,`siswa`.`nama_ibu` AS `nama_ibu`,`siswa`.`tempat_lahir_ibu` AS `tempat_lahir_ibu`,`siswa`.`tanggal_lahir_ibu` AS `tanggal_lahir_ibu`,`siswa`.`pendidikan_ibu` AS `pendidikan_ibu`,`siswa`.`pekerjaan_ibu` AS `pekerjaan_ibu`,`siswa`.`penghasilan_ibu` AS `penghasilan_ibu`,`siswa`.`tinggi_badan` AS `tinggi_badan`,`siswa`.`berat_badan` AS `berat_badan`,`siswa`.`jarak_ke_sekolah` AS `jarak_ke_sekolah`,`siswa`.`waktu_ke_sekolah` AS `waktu_ke_sekolah`,`siswa`.`jumlah_saudara` AS `jumlah_saudara`,`siswa`.`jenis_kelamin` AS `jenis_kelamin`,`kelas`.`id_kelas` AS `id_kelas`,`kelas`.`kelas` AS `kelas`,`kelas`.`idtingkat_fk` AS `idtingkat_fk`,`kelas`.`create_at` AS `create_at`,`kelas`.`idjurusan_fk` AS `idjurusan_fk`,`guru`.`id_guru` AS `id_guru`,`guru`.`nama` AS `nama_guru`,`guru`.`nip` AS `nip`,`guru`.`alamat` AS `alamat_guru`,`mata_pelajaran`.`idjenismatapelajaran_fk` AS `idjenismatapelajaran_fk`,`mata_pelajaran`.`id_mata_pelajaran` AS `id_mata_pelajaran`,`mata_pelajaran`.`mata_pelajaran` AS `mata_pelajaran`,`mata_pelajaran`.`kode` AS `kode` from ((((`catatan_siswa` left join `siswa` on(`catatan_siswa`.`idsiswa_fk` = `siswa`.`id_siswa`)) left join `kelas` on(`catatan_siswa`.`idkelas_fk` = `kelas`.`kelas`)) left join `guru` on(`catatan_siswa`.`idguru_fk` = `guru`.`id_guru`)) left join `mata_pelajaran` on(`catatan_siswa`.`idmapel_fk` = `mata_pelajaran`.`id_mata_pelajaran`)) ;

-- ----------------------------
-- View structure for v_catatan_siswa_new
-- ----------------------------
DROP VIEW IF EXISTS `v_catatan_siswa_new`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`localhost` SQL SECURITY DEFINER VIEW `v_catatan_siswa_new` AS select `catatan_siswa`.`id_catatan_siswa` AS `id_catatan_siswa`,`catatan_siswa`.`idsiswa_fk` AS `idsiswa_fk`,`catatan_siswa`.`idkelas_fk` AS `idkelas_fk`,`catatan_siswa`.`idguru_fk` AS `idguru_fk`,`catatan_siswa`.`tanggal` AS `tanggal`,`catatan_siswa`.`uraian` AS `uraian`,`catatan_siswa`.`teruskan_ke` AS `teruskan_ke`,`catatan_siswa`.`idtahunajaran_fk` AS `idtahunajaran_fk`,`catatan_siswa`.`idmapel_fk` AS `idmapel_fk`,`siswa`.`id_siswa` AS `id_siswa`,`siswa`.`nis` AS `nis`,`siswa`.`nama` AS `nama`,`siswa`.`idjurusan_fk` AS `idjurusan_fk`,`siswa`.`agama` AS `agama`,`siswa`.`nisn` AS `nisn`,(select `kelas`.`kelas` from `kelas` where `kelas`.`id_kelas` = `catatan_siswa`.`idkelas_fk`) AS `nama_kelas`,(select `guru`.`nama` from `guru` where `guru`.`id_guru` = `catatan_siswa`.`idguru_fk`) AS `nama_guru`,(select `mata_pelajaran`.`mata_pelajaran` from `mata_pelajaran` where `mata_pelajaran`.`id_mata_pelajaran` = `catatan_siswa`.`idmapel_fk`) AS `mapel` from (`catatan_siswa` join `siswa` on(`catatan_siswa`.`idsiswa_fk` = `siswa`.`id_siswa`)) ;

-- ----------------------------
-- View structure for v_guru_mapel
-- ----------------------------
DROP VIEW IF EXISTS `v_guru_mapel`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`localhost` SQL SECURITY DEFINER VIEW `v_guru_mapel` AS select `guru`.`id_guru` AS `id_guru`,`guru`.`nama` AS `nama`,`guru`.`nip` AS `nip`,`guru`.`alamat` AS `alamat`,`guru`.`agama` AS `agama`,`guru`.`foto` AS `foto`,`guru`.`pendidikan_terakhir` AS `pendidikan_terakhir`,`guru`.`instansi` AS `instansi`,`guru`.`fb` AS `fb`,`guru`.`ig` AS `ig`,`guru`.`twitter` AS `twitter`,`guru`.`youtube` AS `youtube`,`guru`.`jabatan` AS `jabatan`,`guru`.`email` AS `email`,`guru`.`no_hp` AS `no_hp`,`guru_mapel`.`id_guru_mapel` AS `id_guru_mapel`,`guru_mapel`.`idguru_fk` AS `idguru_fk`,`guru_mapel`.`idmapel_fk` AS `idmapel_fk`,`guru_mapel`.`idkelas_fk` AS `idkelas_fk`,`mata_pelajaran`.`id_mata_pelajaran` AS `id_mata_pelajaran`,`mata_pelajaran`.`mata_pelajaran` AS `mata_pelajaran`,`mata_pelajaran`.`kode` AS `kode`,`kelas`.`id_kelas` AS `id_kelas`,`kelas`.`kelas` AS `kelas`,`kelas`.`idtingkat_fk` AS `idtingkat_fk`,`kelas`.`create_at` AS `create_at`,`kelas`.`idjurusan_fk` AS `idjurusan_fk`,`kelas`.`idtahunajaran_fk` AS `idtahunajaran_fk`,`tahun_ajaran`.`id_tahun_ajaran` AS `id_tahun_ajaran`,`tahun_ajaran`.`tahun_ajaran` AS `tahun_ajaran`,`tahun_ajaran`.`is_active` AS `is_active`,`tahun_ajaran`.`semester` AS `semester`,`mata_pelajaran`.`idjenismatapelajaran_fk` AS `idjenismatapelajaran_fk`,`guru`.`kode_pegawai` AS `kode_pegawai` from ((((`guru` join `guru_mapel` on(`guru_mapel`.`idguru_fk` = `guru`.`id_guru`)) join `mata_pelajaran` on(`guru_mapel`.`idmapel_fk` = `mata_pelajaran`.`id_mata_pelajaran`)) join `kelas` on(`kelas`.`id_kelas` = `guru_mapel`.`idkelas_fk`)) join `tahun_ajaran` on(`tahun_ajaran`.`id_tahun_ajaran` = `guru_mapel`.`idtahunajaran_fk`)) ;

-- ----------------------------
-- View structure for v_jadwal_pelajaran
-- ----------------------------
DROP VIEW IF EXISTS `v_jadwal_pelajaran`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`localhost` SQL SECURITY DEFINER VIEW `v_jadwal_pelajaran` AS SELECT
jadwal_pelajaran.id_jadwal_pelajaran AS id_jadwal_pelajaran,
jadwal_pelajaran.idgurumapel_fk AS idgurumapel_fk,
jadwal_pelajaran.idhari_fk AS idhari_fk,
jadwal_pelajaran.idjampelajaran_fk AS idjampelajaran_fk,
guru_mapel.id_guru_mapel AS id_guru_mapel,
guru_mapel.idguru_fk AS idguru_fk,
guru_mapel.idmapel_fk AS idmapel_fk,
guru_mapel.idkelas_fk AS idkelas_fk,
( SELECT `guru`.`nama` FROM `guru` WHERE `guru`.`id_guru` = `guru_mapel`.`idguru_fk` ) AS nama_guru,
( SELECT `guru`.`nip` FROM `guru` WHERE `guru`.`id_guru` = `guru_mapel`.`idguru_fk` ) AS nip,
( SELECT `guru`.`kode_pegawai` FROM `guru` WHERE `guru`.`id_guru` = `guru_mapel`.`idguru_fk` ) AS kode_pegawai,
( SELECT `mata_pelajaran`.`kode` FROM `mata_pelajaran` WHERE `guru_mapel`.`idmapel_fk` = `mata_pelajaran`.`id_mata_pelajaran` ) AS kode_pelajaran,
( SELECT `mata_pelajaran`.`mata_pelajaran` FROM `mata_pelajaran` WHERE `guru_mapel`.`idmapel_fk` = `mata_pelajaran`.`id_mata_pelajaran` ) AS mata_pelajaran,
hari.id_hari AS id_hari,
hari.hari AS hari,
hari.`code` AS `code`,
jam_pelajaran.id_jam_pelajaran AS id_jam_pelajaran,
jam_pelajaran.nama AS nama,
jam_pelajaran.jam_mulai AS jam_mulai,
jam_pelajaran.jam_selesai AS jam_selesai,
kelas.id_kelas AS id_kelas,
kelas.kelas AS kelas,
kelas.idtingkat_fk AS idtingkat_fk,
kelas.create_at AS create_at,
kelas.idjurusan_fk AS idjurusan_fk,
guru_mapel.idtahunajaran_fk
FROM
((((jadwal_pelajaran
JOIN guru_mapel ON (jadwal_pelajaran.idgurumapel_fk = guru_mapel.id_guru_mapel))
JOIN hari ON (hari.id_hari = jadwal_pelajaran.idhari_fk))
JOIN jam_pelajaran ON (jam_pelajaran.id_jam_pelajaran = jadwal_pelajaran.idjampelajaran_fk))
JOIN kelas ON (guru_mapel.idkelas_fk = kelas.id_kelas)) ;

-- ----------------------------
-- View structure for v_jenis_penerimaan
-- ----------------------------
DROP VIEW IF EXISTS `v_jenis_penerimaan`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`localhost` SQL SECURITY DEFINER VIEW `v_jenis_penerimaan` AS select `jenis_penerimaan`.`id_jenis_penerimaan` AS `id_jenis_penerimaan`,`jenis_penerimaan`.`nama` AS `nama`,`jenis_penerimaan`.`kas` AS `kas`,`jenis_penerimaan`.`pendapatan` AS `pendapatan`,`jenis_penerimaan`.`piutang` AS `piutang`,`jenis_penerimaan`.`diskon` AS `diskon`,`jenis_penerimaan`.`is_edit` AS `is_edit`,`jenis_penerimaan`.`bulanan` AS `bulanan`,`jenis_penerimaan`.`template_nota` AS `template_nota`,(select `akun`.`no_ref` from `akun` where `jenis_penerimaan`.`kas` = `akun`.`id_akun`) AS `norefkas`,(select `akun`.`no_ref` from `akun` where `jenis_penerimaan`.`pendapatan` = `akun`.`id_akun`) AS `norefpendapatan`,(select `akun`.`no_ref` from `akun` where `jenis_penerimaan`.`piutang` = `akun`.`id_akun`) AS `norefpiutang`,(select `akun`.`no_ref` from `akun` where `jenis_penerimaan`.`diskon` = `akun`.`id_akun`) AS `norefdiskon`,(select `akun`.`saldo_normal` from `akun` where `jenis_penerimaan`.`kas` = `akun`.`id_akun`) AS `snkas`,(select `akun`.`saldo_normal` from `akun` where `jenis_penerimaan`.`pendapatan` = `akun`.`id_akun`) AS `snpendapatan`,(select `akun`.`saldo_normal` from `akun` where `jenis_penerimaan`.`piutang` = `akun`.`id_akun`) AS `snpiutang`,(select `akun`.`saldo_normal` from `akun` where `jenis_penerimaan`.`diskon` = `akun`.`id_akun`) AS `sndiskon` from `jenis_penerimaan` ;

-- ----------------------------
-- View structure for v_learning
-- ----------------------------
DROP VIEW IF EXISTS `v_learning`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`localhost` SQL SECURITY DEFINER VIEW `v_learning` AS select `learning`.`id_learning` AS `id_learning`,`learning`.`idmatapelajaran_fk` AS `idmatapelajaran_fk`,`learning`.`idkd_fk` AS `idkd_fk`,`learning`.`materi` AS `materi`,`learning`.`open_access` AS `open_access`,`learning`.`password` AS `password`,`learning`.`iduser_fk` AS `iduser_fk`,`learning`.`judul` AS `judul`,`learning`.`create_at` AS `create_at`,`learning`.`idtingkat_fk` AS `idtingkat_fk`,`mata_pelajaran`.`id_mata_pelajaran` AS `id_mata_pelajaran`,`mata_pelajaran`.`mata_pelajaran` AS `mata_pelajaran`,`mata_pelajaran`.`kode` AS `kode`,`mata_pelajaran`.`idjenismatapelajaran_fk` AS `idjenismatapelajaran_fk`,`mata_pelajaran`.`jKode` AS `jKode`,`learning`.`cover` AS `cover`,`learning`.`task_code` AS `task_code` from (`learning` join `mata_pelajaran` on(`learning`.`idmatapelajaran_fk` = `mata_pelajaran`.`id_mata_pelajaran`)) ;

-- ----------------------------
-- View structure for v_materi
-- ----------------------------
DROP VIEW IF EXISTS `v_materi`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`localhost` SQL SECURITY DEFINER VIEW `v_materi` AS select distinct `materi`.`materi` AS `materi`,`materi`.`id_materi` AS `id_materi`,`materi`.`file_materi` AS `file_materi`,`materi`.`file_rpp` AS `file_rpp`,`materi`.`idkelas_fk` AS `idkelas_fk`,`materi`.`idguru_fk` AS `idguru_fk`,`materi`.`idtahunajaran_fk` AS `idtahunajaran_fk`,`materi`.`idmatapelajaran_fk` AS `idmatapelajaran_fk`,`materi`.`trans_code` AS `trans_code`,(select `guru`.`nama` from `guru` where `guru`.`id_guru` = `materi`.`idguru_fk`) AS `nama_guru` from `materi` ;

-- ----------------------------
-- View structure for v_nilai_keterampilan
-- ----------------------------
DROP VIEW IF EXISTS `v_nilai_keterampilan`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`localhost` SQL SECURITY DEFINER VIEW `v_nilai_keterampilan` AS select `input_nilai_keterampilan`.`id_input_nilai_keterampilan` AS `id_input_nilai_keterampilan`,`input_nilai_keterampilan`.`idmatapelajaran_fk` AS `idmatapelajaran_fk`,`input_nilai_keterampilan`.`idtahunajaran_fk` AS `idtahunajaran_fk`,`input_nilai_keterampilan`.`trans_code` AS `trans_code`,`input_nilai_keterampilan`.`idguru_fk` AS `idguru_fk`,`input_nilai_keterampilan`.`idkelas_fk` AS `idkelas_fk`,`input_nilai_keterampilan`.`idjenisketerampilan_fk` AS `idjenisketerampilan_fk`,`nilai_keterampilan`.`id_nilai_keterampilan` AS `id_nilai_keterampilan`,`nilai_keterampilan`.`idsiswa_fk` AS `idsiswa_fk`,`nilai_keterampilan`.`nilai` AS `nilai`,`nilai_keterampilan`.`idinputnilaiketerampilan_fk` AS `idinputnilaiketerampilan_fk`,`nilai_keterampilan`.`create_at` AS `create_at`,`nilai_keterampilan`.`idkd_fk` AS `idkd_fk` from (`input_nilai_keterampilan` join `nilai_keterampilan` on(`input_nilai_keterampilan`.`id_input_nilai_keterampilan` = `nilai_keterampilan`.`idinputnilaiketerampilan_fk`)) ;

-- ----------------------------
-- View structure for v_nilai_pas
-- ----------------------------
DROP VIEW IF EXISTS `v_nilai_pas`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`localhost` SQL SECURITY DEFINER VIEW `v_nilai_pas` AS select `input_nilai_pas`.`id_input_nilai_pas` AS `id_input_nilai_pas`,`input_nilai_pas`.`idmatapelajaran_fk` AS `idmatapelajaran_fk`,`input_nilai_pas`.`idtahunajaran_fk` AS `idtahunajaran_fk`,`input_nilai_pas`.`trans_code` AS `trans_code`,`input_nilai_pas`.`idguru_fk` AS `idguru_fk`,`input_nilai_pas`.`idkelas_fk` AS `idkelas_fk`,`nilai_pas`.`id_nilai_pas` AS `id_nilai_pas`,`nilai_pas`.`idsiswa_fk` AS `idsiswa_fk`,`nilai_pas`.`nilai` AS `nilai`,`nilai_pas`.`idinputnilaipas_fk` AS `idinputnilaipas_fk`,`nilai_pas`.`create_at` AS `create_at` from (`input_nilai_pas` join `nilai_pas` on(`input_nilai_pas`.`id_input_nilai_pas` = `nilai_pas`.`idinputnilaipas_fk`)) ;

-- ----------------------------
-- View structure for v_nilai_pengetahuan
-- ----------------------------
DROP VIEW IF EXISTS `v_nilai_pengetahuan`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`localhost` SQL SECURITY DEFINER VIEW `v_nilai_pengetahuan` AS select `nilai_pengetahuan`.`id_nilai_pengetahuan` AS `id_nilai_pengetahuan`,`nilai_pengetahuan`.`idsiswa_fk` AS `idsiswa_fk`,`nilai_pengetahuan`.`nilai` AS `nilai`,`nilai_pengetahuan`.`idinputnilaipengetahuan_fk` AS `idinputnilaipengetahuan_fk`,`nilai_pengetahuan`.`create_at` AS `create_at`,`nilai_pengetahuan`.`idkd_fk` AS `idkd_fk`,`input_nilai_pengetahuan`.`id_input_nilai_pengetahuan` AS `id_input_nilai_pengetahuan`,`input_nilai_pengetahuan`.`idmatapelajaran_fk` AS `idmatapelajaran_fk`,`input_nilai_pengetahuan`.`idtahunajaran_fk` AS `idtahunajaran_fk`,`input_nilai_pengetahuan`.`trans_code` AS `trans_code`,`input_nilai_pengetahuan`.`idguru_fk` AS `idguru_fk`,`input_nilai_pengetahuan`.`idkelas_fk` AS `idkelas_fk`,`input_nilai_pengetahuan`.`idjenispengetahuan_fk` AS `idjenispengetahuan_fk` from (`nilai_pengetahuan` join `input_nilai_pengetahuan` on(`input_nilai_pengetahuan`.`id_input_nilai_pengetahuan` = `nilai_pengetahuan`.`idinputnilaipengetahuan_fk`)) ;

-- ----------------------------
-- View structure for v_nilai_pts
-- ----------------------------
DROP VIEW IF EXISTS `v_nilai_pts`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`localhost` SQL SECURITY DEFINER VIEW `v_nilai_pts` AS select `input_nilai_pts`.`id_input_nilai_pts` AS `id_input_nilai_pts`,`input_nilai_pts`.`idmatapelajaran_fk` AS `idmatapelajaran_fk`,`input_nilai_pts`.`idtahunajaran_fk` AS `idtahunajaran_fk`,`input_nilai_pts`.`trans_code` AS `trans_code`,`input_nilai_pts`.`idguru_fk` AS `idguru_fk`,`input_nilai_pts`.`idkelas_fk` AS `idkelas_fk`,`nilai_pts`.`id_nilai_pts` AS `id_nilai_pts`,`nilai_pts`.`idsiswa_fk` AS `idsiswa_fk`,`nilai_pts`.`nilai` AS `nilai`,`nilai_pts`.`idinputnilaipts_fk` AS `idinputnilaipts_fk`,`nilai_pts`.`create_at` AS `create_at` from (`input_nilai_pts` join `nilai_pts` on(`input_nilai_pts`.`id_input_nilai_pts` = `nilai_pts`.`idinputnilaipts_fk`)) ;

-- ----------------------------
-- View structure for v_oas_soal
-- ----------------------------
DROP VIEW IF EXISTS `v_oas_soal`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`localhost` SQL SECURITY DEFINER VIEW `v_oas_soal` AS select `oas_soal`.`id_oas_soal` AS `id_oas_soal`,`oas_soal`.`idbanksoal_fk` AS `idbanksoal_fk`,`oas_soal`.`idoas_fk` AS `idoas_fk`,`bank_soal`.`id_bank_soal` AS `id_bank_soal`,`bank_soal`.`soal` AS `soal`,`bank_soal`.`time_soal` AS `time_soal`,`bank_soal`.`code_soal` AS `code_soal`,`bank_soal`.`idmatapelajaran_fk` AS `idmatapelajaran_fk`,`bank_soal`.`idguru_fk` AS `idguru_fk`,`oas`.`id_oas` AS `id_oas`,`oas`.`tanggal_mulai` AS `tanggal_mulai`,`oas`.`tanggal_selesai` AS `tanggal_selesai`,`oas`.`keterangan` AS `keterangan`,`oas`.`is_active` AS `is_active`,`oas`.`kode` AS `kode`,`oas`.`idmapel_fk` AS `idmapel_fk` from ((`oas_soal` join `bank_soal` on(`oas_soal`.`idbanksoal_fk` = `bank_soal`.`id_bank_soal`)) join `oas` on(`oas_soal`.`idoas_fk` = `oas`.`id_oas`)) ;

-- ----------------------------
-- View structure for v_pelanggaran_siswa
-- ----------------------------
DROP VIEW IF EXISTS `v_pelanggaran_siswa`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`localhost` SQL SECURITY DEFINER VIEW `v_pelanggaran_siswa` AS select `pelanggaran_siswa`.`id_pelanggaran_siswa` AS `id_pelanggaran_siswa`,`pelanggaran_siswa`.`tanggal` AS `tanggal`,`pelanggaran_siswa`.`uraian_pelanggaran` AS `uraian_pelanggaran`,`pelanggaran_siswa`.`idpoinpelanggaran_fk` AS `idpoinpelanggaran_fk`,`pelanggaran_siswa`.`idsiswa_fk` AS `idsiswa_fk`,`poin_pelanggaran`.`id_poin_pelanggaran` AS `id_poin_pelanggaran`,`poin_pelanggaran`.`idjenispelanggaran_fk` AS `idjenispelanggaran_fk`,`poin_pelanggaran`.`nama_pelanggaran` AS `nama_pelanggaran`,`poin_pelanggaran`.`poin` AS `poin`,`poin_pelanggaran`.`kode_pelanggaran` AS `kode_pelanggaran`,`jenis_pelanggaran`.`id_jenis_pelanggaran` AS `id_jenis_pelanggaran`,`jenis_pelanggaran`.`jenis_pelanggaran` AS `jenis_pelanggaran`,(select `siswa`.`nama` from `siswa` where `siswa`.`id_siswa` = `pelanggaran_siswa`.`idsiswa_fk`) AS `nama_siswa` from ((`pelanggaran_siswa` left join `poin_pelanggaran` on(`poin_pelanggaran`.`id_poin_pelanggaran` = `pelanggaran_siswa`.`idpoinpelanggaran_fk`)) left join `jenis_pelanggaran` on(`jenis_pelanggaran`.`id_jenis_pelanggaran` = `poin_pelanggaran`.`idjenispelanggaran_fk`)) ;

-- ----------------------------
-- View structure for v_penerimaan
-- ----------------------------
DROP VIEW IF EXISTS `v_penerimaan`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`localhost` SQL SECURITY DEFINER VIEW `v_penerimaan` AS select `penerimaan`.`id_penerimaan` AS `id_penerimaan`,`penerimaan`.`idsiswa_fk` AS `idsiswa_fk`,`penerimaan`.`idjenispenerimaan_fk` AS `idjenispenerimaan_fk`,`penerimaan`.`metode_pembayaran` AS `metode_pembayaran`,`penerimaan`.`tanggal` AS `tanggal`,`penerimaan`.`catatan` AS `catatan`,`penerimaan`.`jumlah` AS `jumlah`,`penerimaan`.`create_at` AS `create_at`,`penerimaan`.`invoice` AS `invoice`,`penerimaan`.`diskon` AS `diskon_penerimaan`,`jenis_penerimaan`.`id_jenis_penerimaan` AS `id_jenis_penerimaan`,`jenis_penerimaan`.`nama` AS `nama`,`jenis_penerimaan`.`kas` AS `kas`,`jenis_penerimaan`.`pendapatan` AS `pendapatan`,`jenis_penerimaan`.`piutang` AS `piutang`,`jenis_penerimaan`.`is_edit` AS `is_edit`,`jenis_penerimaan`.`bulanan` AS `bulanan`,`jenis_penerimaan`.`template_nota` AS `template_nota`,`jenis_penerimaan`.`diskon` AS `diskon`,`siswa`.`id_siswa` AS `id_siswa`,`siswa`.`nis` AS `nis`,`siswa`.`nama` AS `nama_siswa`,`siswa`.`idkelas_fk` AS `idkelas_fk`,`siswa`.`idjurusan_fk` AS `idjurusan_fk`,`siswa`.`agama` AS `agama`,`siswa`.`nisn` AS `nisn`,`siswa`.`no_ijazah_sekolah_asal` AS `no_ijazah_sekolah_asal`,`siswa`.`no_skhun_sekolah_asal` AS `no_skhun_sekolah_asal`,`siswa`.`no_un_sekolah_asal` AS `no_un_sekolah_asal`,`siswa`.`no_kk` AS `no_kk`,`siswa`.`npsn_sekolah_asal` AS `npsn_sekolah_asal`,`siswa`.`nama_sekolah_asal` AS `nama_sekolah_asal`,`siswa`.`tempat_lahir` AS `tempat_lahir`,`siswa`.`tanggal_lahir` AS `tanggal_lahir`,`siswa`.`berkebutuhan_khusus` AS `berkebutuhan_khusus`,`siswa`.`alamat` AS `alamat`,`siswa`.`dusun` AS `dusun`,`siswa`.`rt` AS `rt`,`siswa`.`rw` AS `rw`,`siswa`.`kelurahan` AS `kelurahan`,`siswa`.`foto` AS `foto`,`siswa`.`idprovince_fk` AS `idprovince_fk`,`siswa`.`idcities_fk` AS `idcities_fk`,`siswa`.`nama_ayah` AS `nama_ayah`,`siswa`.`tempat_lahir_ayah` AS `tempat_lahir_ayah`,`siswa`.`tanggal_lahir_ayah` AS `tanggal_lahir_ayah`,`siswa`.`pendidikan_ayah` AS `pendidikan_ayah`,`siswa`.`pekerjaan_ayah` AS `pekerjaan_ayah`,`siswa`.`penghasilan_ayah` AS `penghasilan_ayah`,`siswa`.`nama_ibu` AS `nama_ibu`,`siswa`.`tempat_lahir_ibu` AS `tempat_lahir_ibu`,`siswa`.`tanggal_lahir_ibu` AS `tanggal_lahir_ibu`,`siswa`.`pendidikan_ibu` AS `pendidikan_ibu`,`siswa`.`pekerjaan_ibu` AS `pekerjaan_ibu`,`siswa`.`penghasilan_ibu` AS `penghasilan_ibu`,`siswa`.`tinggi_badan` AS `tinggi_badan`,`siswa`.`berat_badan` AS `berat_badan`,`siswa`.`jarak_ke_sekolah` AS `jarak_ke_sekolah`,`siswa`.`waktu_ke_sekolah` AS `waktu_ke_sekolah`,`siswa`.`jumlah_saudara` AS `jumlah_saudara`,`siswa`.`jenis_kelamin` AS `jenis_kelamin`,`siswa`.`saldo` AS `saldo`,(select `kelas`.`kelas` from `kelas` where `siswa`.`idkelas_fk` = `kelas`.`id_kelas`) AS `kelas` from ((`penerimaan` join `jenis_penerimaan` on(`penerimaan`.`idjenispenerimaan_fk` = `jenis_penerimaan`.`id_jenis_penerimaan`)) join `siswa` on(`penerimaan`.`idsiswa_fk` = `siswa`.`id_siswa`)) ;

-- ----------------------------
-- View structure for v_pkg
-- ----------------------------
DROP VIEW IF EXISTS `v_pkg`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`localhost` SQL SECURITY DEFINER VIEW `v_pkg` AS select `component_penilaian_kinerja_guru`.`idpenilaiankinerjaguru_fk` AS `idpenilaiankinerjaguru_fk`,`penilaian_kinerja_guru`.`id_penilaian_kinerja_guru` AS `id_penilaian_kinerja_guru`,`penilaian_kinerja_guru`.`idguru_fk` AS `idguru_fk`,`penilaian_kinerja_guru`.`bulan` AS `bulan`,`penilaian_kinerja_guru`.`tahun` AS `tahun`,`penilaian_kinerja_guru`.`idtahunajaran_fk` AS `idtahunajaran_fk`,`penilaian_kinerja_guru`.`create_at` AS `create_at`,`penilaian_kinerja_guru`.`trans_code` AS `trans_code`,`component_penilaian_kinerja_guru`.`id_component_penilaian_kinerja_guru` AS `id_component_penilaian_kinerja_guru`,`component_penilaian_kinerja_guru`.`idsubkompetensipkg_fk` AS `idsubkompetensipkg_fk`,`component_penilaian_kinerja_guru`.`nilai` AS `nilai` from (`penilaian_kinerja_guru` join `component_penilaian_kinerja_guru` on(`penilaian_kinerja_guru`.`id_penilaian_kinerja_guru` = `component_penilaian_kinerja_guru`.`idpenilaiankinerjaguru_fk`)) ;

-- ----------------------------
-- View structure for v_poin_pelanggaran
-- ----------------------------
DROP VIEW IF EXISTS `v_poin_pelanggaran`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`localhost` SQL SECURITY DEFINER VIEW `v_poin_pelanggaran` AS SELECT
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
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`localhost` SQL SECURITY DEFINER VIEW `v_poin_pelanggaran_siswa` AS select `siswa`.`id_siswa` AS `id_siswa`,`siswa`.`nisn` AS `nisn`,`siswa`.`nis` AS `nis`,`siswa`.`nama` AS `nama`,(select sum(`v_pelanggaran_siswa`.`poin`) from `v_pelanggaran_siswa` where `v_pelanggaran_siswa`.`idsiswa_fk` = `siswa`.`id_siswa`) AS `poin` from `siswa` where (select sum(`v_pelanggaran_siswa`.`poin`) from `v_pelanggaran_siswa` where `v_pelanggaran_siswa`.`idsiswa_fk` = `siswa`.`id_siswa`) > 0 ;

-- ----------------------------
-- View structure for v_presensi_event
-- ----------------------------
DROP VIEW IF EXISTS `v_presensi_event`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`localhost` SQL SECURITY DEFINER VIEW `v_presensi_event` AS select `event`.`id_event` AS `id_event`,`event`.`event` AS `event`,`event`.`tanggal` AS `tanggal`,`event`.`notulensi` AS `notulensi`,`presensi_event`.`id_presensi_event` AS `id_presensi_event`,`presensi_event`.`idevent_fk` AS `idevent_fk`,`presensi_event`.`idguru_fk` AS `idguru_fk`,`presensi_event`.`is_hadir` AS `is_hadir`,(select `guru`.`nama` from `guru` where `guru`.`id_guru` = `presensi_event`.`idguru_fk`) AS `nama_guru` from (`event` join `presensi_event` on(`presensi_event`.`idevent_fk` = `event`.`id_event`)) ;

-- ----------------------------
-- View structure for v_presensi_harian_set
-- ----------------------------
DROP VIEW IF EXISTS `v_presensi_harian_set`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`localhost` SQL SECURITY DEFINER VIEW `v_presensi_harian_set` AS select `presensi_harian`.`id_presensi_harian` AS `id_presensi_harian`,`presensi_harian`.`idmatapelajaran_fk` AS `idmatapelajaran_fk`,`presensi_harian`.`idsiswa_fk` AS `idsiswa_fk`,`presensi_harian`.`presensi` AS `presensi`,`presensi_harian`.`keterangan` AS `keterangan`,`presensi_harian`.`tanggal` AS `tanggal`,`presensi_harian`.`create_at` AS `create_at`,`presensi_harian`.`idtahunajaran_fk` AS `idtahunajaran_fk`,`presensi_harian`.`idkelas_fk` AS `idkelas_fk`,(select `kelas`.`idjurusan_fk` from `kelas` where `kelas`.`id_kelas` = `presensi_harian`.`idkelas_fk`) AS `id_jurusan` from `presensi_harian` ;

-- ----------------------------
-- View structure for v_prestasi_siswa
-- ----------------------------
DROP VIEW IF EXISTS `v_prestasi_siswa`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`localhost` SQL SECURITY DEFINER VIEW `v_prestasi_siswa` AS select `prestasi_siswa`.`id_prestasi_siswa` AS `id_prestasi_siswa`,`prestasi_siswa`.`idsiswa_fk` AS `idsiswa_fk`,`prestasi_siswa`.`prestasi` AS `prestasi`,`prestasi_siswa`.`lomba` AS `lomba`,`prestasi_siswa`.`tahun` AS `tahun`,`prestasi_siswa`.`jenis_perlombaan` AS `jenis_perlombaan`,(select `siswa`.`nama` from `siswa` where `siswa`.`id_siswa` = `prestasi_siswa`.`idsiswa_fk`) AS `nama_siswa`,(select `siswa`.`nis` from `siswa` where `siswa`.`id_siswa` = `prestasi_siswa`.`idsiswa_fk`) AS `nis_siswa` from `prestasi_siswa` ;

-- ----------------------------
-- View structure for v_siswa_jurusan
-- ----------------------------
DROP VIEW IF EXISTS `v_siswa_jurusan`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`localhost` SQL SECURITY DEFINER VIEW `v_siswa_jurusan` AS select `siswa`.`id_siswa` AS `id_siswa`,`siswa`.`nis` AS `nis`,`siswa`.`nama` AS `nama`,`siswa`.`idkelas_fk` AS `idkelas_fk`,`siswa`.`idjurusan_fk` AS `idjurusan_fk`,`siswa`.`agama` AS `agama`,`siswa`.`nisn` AS `nisn`,`siswa`.`no_ijazah_sekolah_asal` AS `no_ijazah_sekolah_asal`,`siswa`.`no_skhun_sekolah_asal` AS `no_skhun_sekolah_asal`,`siswa`.`no_un_sekolah_asal` AS `no_un_sekolah_asal`,`siswa`.`no_kk` AS `no_kk`,`siswa`.`npsn_sekolah_asal` AS `npsn_sekolah_asal`,`siswa`.`nama_sekolah_asal` AS `nama_sekolah_asal`,`siswa`.`tempat_lahir` AS `tempat_lahir`,`siswa`.`tanggal_lahir` AS `tanggal_lahir`,`siswa`.`berkebutuhan_khusus` AS `berkebutuhan_khusus`,`siswa`.`alamat` AS `alamat`,`siswa`.`dusun` AS `dusun`,`siswa`.`rt` AS `rt`,`siswa`.`rw` AS `rw`,`siswa`.`kelurahan` AS `kelurahan`,`siswa`.`foto` AS `foto`,`siswa`.`idprovince_fk` AS `idprovince_fk`,`siswa`.`idcities_fk` AS `idcities_fk`,`siswa`.`nama_ayah` AS `nama_ayah`,`siswa`.`tempat_lahir_ayah` AS `tempat_lahir_ayah`,`siswa`.`tanggal_lahir_ayah` AS `tanggal_lahir_ayah`,`siswa`.`pendidikan_ayah` AS `pendidikan_ayah`,`siswa`.`pekerjaan_ayah` AS `pekerjaan_ayah`,`siswa`.`penghasilan_ayah` AS `penghasilan_ayah`,`siswa`.`nama_ibu` AS `nama_ibu`,`siswa`.`tempat_lahir_ibu` AS `tempat_lahir_ibu`,`siswa`.`tanggal_lahir_ibu` AS `tanggal_lahir_ibu`,`siswa`.`pendidikan_ibu` AS `pendidikan_ibu`,`siswa`.`pekerjaan_ibu` AS `pekerjaan_ibu`,`siswa`.`penghasilan_ibu` AS `penghasilan_ibu`,`siswa`.`tinggi_badan` AS `tinggi_badan`,`siswa`.`berat_badan` AS `berat_badan`,`siswa`.`jarak_ke_sekolah` AS `jarak_ke_sekolah`,`siswa`.`waktu_ke_sekolah` AS `waktu_ke_sekolah`,`siswa`.`jumlah_saudara` AS `jumlah_saudara`,`siswa`.`jenis_kelamin` AS `jenis_kelamin`,`kelas`.`id_kelas` AS `id_kelas`,`kelas`.`kelas` AS `kelas`,`kelas`.`idtingkat_fk` AS `idtingkat_fk`,`kelas`.`create_at` AS `create_at`,`kelas`.`idtahunajaran_fk` AS `idtahunajaran_fk`,`jurusan`.`id_jurusan` AS `id_jurusan`,`jurusan`.`jurusan` AS `jurusan`,`jurusan`.`singkatan` AS `singkatan`,(select `tingkat`.`tingkat` from `tingkat` where `tingkat`.`id_tingkat` = `kelas`.`idtingkat_fk`) AS `nama_tingkat` from ((`siswa` join `kelas` on(`kelas`.`id_kelas` = `siswa`.`idkelas_fk`)) join `jurusan` on(`jurusan`.`id_jurusan` = `siswa`.`idjurusan_fk`)) ;

-- ----------------------------
-- View structure for v_tanggungan_siswa
-- ----------------------------
DROP VIEW IF EXISTS `v_tanggungan_siswa`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`localhost` SQL SECURITY DEFINER VIEW `v_tanggungan_siswa` AS select `tanggungan_siswa`.`id_tanggungan_siswa` AS `id_tanggungan_siswa`,`tanggungan_siswa`.`idsiswa_fk` AS `idsiswa_fk`,`tanggungan_siswa`.`idjenispenerimaan_fk` AS `idjenispenerimaan_fk`,`tanggungan_siswa`.`jumlah` AS `jumlah`,`jenis_penerimaan`.`id_jenis_penerimaan` AS `id_jenis_penerimaan`,`jenis_penerimaan`.`nama` AS `nama`,`jenis_penerimaan`.`kas` AS `kas`,`jenis_penerimaan`.`pendapatan` AS `pendapatan`,`jenis_penerimaan`.`piutang` AS `piutang`,`jenis_penerimaan`.`diskon` AS `diskon`,`jenis_penerimaan`.`is_edit` AS `is_edit`,`jenis_penerimaan`.`bulanan` AS `bulanan`,`jenis_penerimaan`.`template_nota` AS `template_nota` from (`tanggungan_siswa` join `jenis_penerimaan` on(`tanggungan_siswa`.`idjenispenerimaan_fk` = `jenis_penerimaan`.`id_jenis_penerimaan`)) ;

-- ----------------------------
-- View structure for v_task
-- ----------------------------
DROP VIEW IF EXISTS `v_task`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`localhost` SQL SECURITY DEFINER VIEW `v_task` AS select `task_answer`.`id_task_answer` AS `id_task_answer`,`task_answer`.`idsiswa_fk` AS `idsiswa_fk`,`task_answer`.`ans` AS `ans`,`task_answer`.`idtask_fk` AS `idtask_fk`,`task_answer`.`type` AS `type`,`task`.`id_task` AS `id_task`,`task`.`task_code` AS `task_code`,`task`.`task` AS `task`,`task`.`idguru_fk` AS `idguru_fk`,`task`.`idmapel_fk` AS `idmapel_fk`,`task`.`title` AS `title`,`siswa`.`id_siswa` AS `id_siswa`,`siswa`.`nis` AS `nis`,`siswa`.`nama` AS `nama`,`siswa`.`idkelas_fk` AS `idkelas_fk`,`siswa`.`idjurusan_fk` AS `idjurusan_fk`,`siswa`.`agama` AS `agama`,`siswa`.`nisn` AS `nisn`,`siswa`.`no_ijazah_sekolah_asal` AS `no_ijazah_sekolah_asal`,`siswa`.`no_skhun_sekolah_asal` AS `no_skhun_sekolah_asal`,`siswa`.`no_un_sekolah_asal` AS `no_un_sekolah_asal`,`siswa`.`no_kk` AS `no_kk`,`siswa`.`npsn_sekolah_asal` AS `npsn_sekolah_asal`,`siswa`.`nama_sekolah_asal` AS `nama_sekolah_asal`,`siswa`.`tempat_lahir` AS `tempat_lahir`,`siswa`.`tanggal_lahir` AS `tanggal_lahir`,`siswa`.`berkebutuhan_khusus` AS `berkebutuhan_khusus`,`siswa`.`alamat` AS `alamat`,`siswa`.`dusun` AS `dusun`,`siswa`.`rt` AS `rt`,`siswa`.`rw` AS `rw`,`siswa`.`kelurahan` AS `kelurahan`,`siswa`.`foto` AS `foto`,`siswa`.`idprovince_fk` AS `idprovince_fk`,`siswa`.`idcities_fk` AS `idcities_fk`,`siswa`.`nama_ayah` AS `nama_ayah`,`siswa`.`tempat_lahir_ayah` AS `tempat_lahir_ayah`,`siswa`.`tanggal_lahir_ayah` AS `tanggal_lahir_ayah`,`siswa`.`pendidikan_ayah` AS `pendidikan_ayah`,`siswa`.`pekerjaan_ayah` AS `pekerjaan_ayah`,`siswa`.`penghasilan_ayah` AS `penghasilan_ayah`,`siswa`.`nama_ibu` AS `nama_ibu`,`siswa`.`tempat_lahir_ibu` AS `tempat_lahir_ibu`,`siswa`.`tanggal_lahir_ibu` AS `tanggal_lahir_ibu`,`siswa`.`pendidikan_ibu` AS `pendidikan_ibu`,`siswa`.`pekerjaan_ibu` AS `pekerjaan_ibu`,`siswa`.`penghasilan_ibu` AS `penghasilan_ibu`,`siswa`.`tinggi_badan` AS `tinggi_badan`,`siswa`.`berat_badan` AS `berat_badan`,`siswa`.`jarak_ke_sekolah` AS `jarak_ke_sekolah`,`siswa`.`waktu_ke_sekolah` AS `waktu_ke_sekolah`,`siswa`.`jumlah_saudara` AS `jumlah_saudara`,`siswa`.`jenis_kelamin` AS `jenis_kelamin`,`task_answer`.`nilai` AS `nilai` from ((`task_answer` join `task` on(`task_answer`.`idtask_fk` = `task`.`id_task`)) join `siswa` on(`task_answer`.`idsiswa_fk` = `siswa`.`id_siswa`)) ;

-- ----------------------------
-- View structure for v_walas
-- ----------------------------
DROP VIEW IF EXISTS `v_walas`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`localhost` SQL SECURITY DEFINER VIEW `v_walas` AS select `wali_kelas`.`id_wali_kelas` AS `id_wali_kelas`,`wali_kelas`.`idguru_fk` AS `idguru_fk`,`wali_kelas`.`idtahunajaran_fk` AS `idtahunajaran_fk`,`wali_kelas`.`idkelas_fk` AS `idkelas_fk`,`kelas`.`id_kelas` AS `id_kelas`,`kelas`.`kelas` AS `kelas`,`kelas`.`idtingkat_fk` AS `idtingkat_fk`,`kelas`.`idjurusan_fk` AS `idjurusan_fk`,`tingkat`.`id_tingkat` AS `id_tingkat`,`tingkat`.`tingkat` AS `tingkat`,`jurusan`.`id_jurusan` AS `id_jurusan`,`jurusan`.`jurusan` AS `jurusan`,`jurusan`.`singkatan` AS `singkatan` from (((`wali_kelas` left join `kelas` on(`wali_kelas`.`idkelas_fk` = `kelas`.`id_kelas`)) left join `tingkat` on(`kelas`.`idtingkat_fk` = `tingkat`.`id_tingkat`)) left join `jurusan` on(`kelas`.`idjurusan_fk` = `jurusan`.`id_jurusan`)) ;

-- ----------------------------
-- Triggers structure for table pemasukan_lain
-- ----------------------------
DROP TRIGGER IF EXISTS `jurnal_pemasukan`;
delimiter ;;
CREATE DEFINER = `root`@`localhost` TRIGGER `jurnal_pemasukan` AFTER INSERT ON `pemasukan_lain` FOR EACH ROW BEGIN
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
CREATE DEFINER = `root`@`localhost` TRIGGER `delete_jurnal_umum_from_penerimaan` AFTER DELETE ON `penerimaan` FOR EACH ROW BEGIN
		delete from jurnal_umum where jurnal_umum.table = "penerimaan" and idtable_fk=old.id_penerimaan;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table pengeluaran_lain
-- ----------------------------
DROP TRIGGER IF EXISTS `jurnal`;
delimiter ;;
CREATE DEFINER = `root`@`localhost` TRIGGER `jurnal` AFTER INSERT ON `pengeluaran_lain` FOR EACH ROW BEGIN
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
CREATE DEFINER = `root`@`localhost` TRIGGER `update_jurnal_tanggungan_alumni` AFTER UPDATE ON `tanggungan_alumni` FOR EACH ROW BEGIN
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
CREATE DEFINER = `root`@`localhost` TRIGGER `delete_jurnal_tanggungan_alumni` AFTER DELETE ON `tanggungan_alumni` FOR EACH ROW BEGIN
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
CREATE DEFINER = `root`@`localhost` TRIGGER `update_jurnal` AFTER UPDATE ON `tanggungan_siswa` FOR EACH ROW BEGIN
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
CREATE DEFINER = `root`@`localhost` TRIGGER `delete_jurnal` AFTER DELETE ON `tanggungan_siswa` FOR EACH ROW BEGIN
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
CREATE DEFINER = `root`@`localhost` TRIGGER `delete_trig` AFTER DELETE ON `transaksi_tanggungan_siswa` FOR EACH ROW BEGIN
	delete from penerimaan where penerimaan.idsiswa_fk = old.idsiswa_fk and penerimaan.invoice=old.invoice;
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
