/*
 Navicat Premium Data Transfer

 Source Server         : XAMPP
 Source Server Type    : MySQL
 Source Server Version : 100138
 Source Host           : localhost:3306
 Source Schema         : edulite

 Target Server Type    : MySQL
 Target Server Version : 100138
 File Encoding         : 65001

 Date: 01/06/2021 22:10:29
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
  PRIMARY KEY (`id_alumni`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of alumni
-- ----------------------------
INSERT INTO `alumni` VALUES (2, 'Rendy Yani Susanto ', '2013', 'jl. Kebonagung malang', '085894632505', 'Universitas Brawijaya Malang', 'Cicik Winarsih', 'Guru SMK IT', 'tidak', '2020-12-15 21:05:54');

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
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of anak_pegawai
-- ----------------------------
INSERT INTO `anak_pegawai` VALUES (1, 23, 'a1', 'm1', '2020-12-08', 'i1');
INSERT INTO `anak_pegawai` VALUES (2, 23, 'a2', 'm2', '2020-12-16', 'i2');
INSERT INTO `anak_pegawai` VALUES (3, 24, 'a1', 'm1', '2020-12-08', 'i1');
INSERT INTO `anak_pegawai` VALUES (4, 24, 'a2', 'm2', '2020-12-16', 'i2');
INSERT INTO `anak_pegawai` VALUES (5, 25, 'M', 'malang', '2020-12-06', 'a');
INSERT INTO `anak_pegawai` VALUES (6, 25, 'p', 'malang', '2020-12-08', 'b');
INSERT INTO `anak_pegawai` VALUES (7, 26, 'M', 'malang', '2020-12-06', 'a');
INSERT INTO `anak_pegawai` VALUES (8, 26, 'p', 'malang', '2020-12-08', 'b');
INSERT INTO `anak_pegawai` VALUES (9, 27, 'M', 'malang', '2020-12-06', 'a');
INSERT INTO `anak_pegawai` VALUES (10, 27, 'p', 'malang', '2020-12-08', 'b');

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
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of blog_article
-- ----------------------------
INSERT INTO `blog_article` VALUES (2, 'YUK TENGOK SERUNYA KEGIATAN PBB YANG DILAKUKAN SETELAH APEL MPLS', 'Pada tanggal 07 Juli 2020 SMP, SMA, dan SMK IT Asy-Syadzili mengadakan acara Masa Pengenalan Lingkungan Sekolah (MPLS) tahun ajaran 2020/2021 yang dihadiri oleh kepala sekolah, Jajaran dewan guru dan seluruh siswa SMP, SMA, dan SMK IT Asy Syadzili.', '2.jpg', '2020-10-04', 'SMK, SMK BISA,PBB', 1);
INSERT INTO `blog_article` VALUES (3, 'KEGIATAN MPLS SMP-SMA-SMK IT ASY SYADZILI TAHUN AJARAN 2020/2021', 'Pada tanggal 07 Juli 2020 SMP, SMA, dan SMK IT Asy-Syadzili mengadakan acara Masa Pengenalan Lingkungan Sekolah (MPLS) tahun ajaran 2020/2021 yang dihadiri oleh kepala sekolah, Jajaran dewan guru dan seluruh siswa SMP, SMA, dan SMK IT Asy Syadzili.', '3.jpg', '2020-09-04', 'SMK, SMK IT, VOHISA, MPLS', 2);
INSERT INTO `blog_article` VALUES (4, 'SMK IT ASY-SYADZILI DAPAT GELAR JUARA 2 BANJARI SE JATIM', 'Banjari merupakan seni penggabungan antara musik dengan keregilian selain itu banjari banyak di gemari oleh masyarakat muda khususnya di jatim\r\n\r\nDan pada tanggal 14 Maret 2020 SMK IT ASY-SYADZILI mendapatkan gelar juara 2 tingkat jatim dengan persiapan waktu kurang lebih seminggu ini sangat mengejutkan dan yang saat itu di gelar di SMA NEGERI 3 MALANG', '4.jpg', '2020-09-04', 'SMK, SMK JUARA', 2);

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
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of blog_course
-- ----------------------------
INSERT INTO `blog_course` VALUES (1, 'Teknik Komputer dan Jaringan', 'Program keahlian yang mempersiapkan siswa menjadi tenaga profesional di bidang perangkat keras komputer dan jaringan. Kemampuan yang dimiliki siswa dalam program keahlian ini meliputi elektronika digital dasar, instalasi sistem operasi berbasis GUI dan Text (Open Source dan Propietary), Setting LAN, WAN, Serta merancang berbagai jenis server.', '<a href=\"#\" class=\"btn btn-primary\">Baca Sekarang</a>', '3 Tahun', 'Avi H', 'unlimited', 'a953aaff-3853-4d38-acb5-25fcc0eff499.jpg');
INSERT INTO `blog_course` VALUES (2, 'Rekayasa Perangkat Lunak', 'Program keahlian yang mempersiapkan siswa menjadi tenaga terampil di bidang pemrogaman software. Siswa di bekali kemampuan dasar instalasi hardware dan software komputer, penguasaan bahasa pemrogaman (Java, Delphi, Pascal, C++, Basic, PHP dsb), dan pengolahan database (Microsoft Acces, MySQL, dsb)', '<a href=\"#\" class=\"btn btn-primary\">Baca Sekarang</a>', '3 Tahun', 'Rendy Y', 'unlimited', 'IMG-20190418-WA0000.jpg');
INSERT INTO `blog_course` VALUES (3, 'Agribisnis Pengolahan Hasil Pertanian', 'Keahlian Agribisnis Pengolahan Hasil Pertanian menjadi pusat pendidikan dan latihan mengenai bidang ilmu Agribisnis Pengolahan Hasil Pertanian sehingga menghasilkan sumber daya yang handal dalam pengembangan pangan lokal masa depan dalam agroindustri yang mampu bersaing   di era globalisasi dengan berwawasan lingkungan.', '<a href=\"#\" class=\"btn btn-primary\">Baca Sekarang</a>', '3 Tahun', 'Zidni M', 'unlimited', 'aphp.jpg');
INSERT INTO `blog_course` VALUES (4, 'Multimedia', 'Program keahlian yang mempersiapkan siswa menjadi terampil di bidang desain dan penguasaan teknologi informasi multimedia. Siswa dibekali kemampuan dasar seni dan desain,penguasaan software desain grafis dan multimedia (2D dan 3D),desain web,dan media interaktif, fotografi, editing audiovisual.', '<a href=\"#\" class=\"btn btn-primary\">Baca Sekarang</a>', '3 Tahun', 'Fahmi', 'unlimited', 'img_1504.jpg');

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
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of blog_slider
-- ----------------------------
INSERT INTO `blog_slider` VALUES (1, '12.jpg', 'SMK IT ASY SYADZILI, SEKOLAH TEKNOLOGI YANG QURANI', 'Kami mendukung dan memfasilitasi kebutuhan teknologi agar siswa memiliki Ilmu Pengetahuan dan Teknologi', '<a href=\"#\" class=\"btn btn-primary px-4 py-3 mt-3\">Contact Us</a>');
INSERT INTO `blog_slider` VALUES (2, 'IMG_7499.jpg', 'GURU YANG BERKUALITAS', 'Kami mendukung dan memfasilitasi kebutuhan teknologi agar siswa memiliki Ilmu Pengetahuan dan Teknologi', '<a href=\"#\" class=\"btn btn-primary px-4 py-3 mt-3\">Contact Us</a>');
INSERT INTO `blog_slider` VALUES (3, 'IMG20200817082440.jpg', 'PROGRAM PENDIDIKAN YANG BERKUALITAS', 'Kami mendukung dan memfasilitasi kebutuhan teknologi agar siswa memiliki Ilmu Pengetahuan dan Teknologi', '<a href=\"#\" class=\"btn btn-primary px-4 py-3 mt-3\">Contact Us</a>');
INSERT INTO `blog_slider` VALUES (4, 'IMG20200817082611.jpg', 'PENGUATAN KARAKTER SISWA', 'Kami mendukung dan memfasilitasi kebutuhan teknologi agar siswa memiliki Ilmu Pengetahuan dan Teknologi', '<a href=\"#\" class=\"btn btn-primary px-4 py-3 mt-3\">Contact Us</a>');

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
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of blog_teacher
-- ----------------------------
INSERT INTO `blog_teacher` VALUES (1, 'Roikhatul Uzza, S.Psi', 'buizza.jpg', 'Bimbingan Konseling', 'I am an ambitious workaholic, but apart from that, pretty simple person.', 10, 'slide4.png');
INSERT INTO `blog_teacher` VALUES (2, 'Refita Fardiani', 'burev.jpg', 'Tata Usaha', 'I am an ambitious workaholic, but apart from that, pretty simple person.', 11, 'slide3.png');
INSERT INTO `blog_teacher` VALUES (3, 'Nur Cholis, S.Pdi', 'bunur.jpg', 'Guru Agama Islam', 'I am an ambitious workaholic, but apart from that, pretty simple person.', 12, 'slide2.png');
INSERT INTO `blog_teacher` VALUES (4, 'Cindy Permata Putri, S.Pd', 'bucin.jpg', 'Guru Bahasa Indonesia', 'I am an ambitious workaholic, but apart from that, pretty simple person.', 9, 'slide1.png');
INSERT INTO `blog_teacher` VALUES (5, 'Rendy Yani Susanto', 'Rendy-Yani-Susanto-IT-Department.jpeg', 'Programmer', '<p>Rendy yani&nbsp;<strong>susanto</strong></p>\r\n', 2, NULL);
INSERT INTO `blog_teacher` VALUES (6, 'Ali Syaifuddin, S.Pd', 'ali.jpg', 'Guru Matematika', 'I am an ambitious workaholic, but apart from that, pretty simple person.', NULL, NULL);
INSERT INTO `blog_teacher` VALUES (7, 'Sutan Taufik, S.Hum', 'top-x.jpg', 'POKJA', 'I am an ambitious workaholic, but apart from that, pretty simple person.', NULL, NULL);
INSERT INTO `blog_teacher` VALUES (9, 'Maimun Muzzaka', 'mymun.jpg', 'Laboran & Guru TKJ', 'I am an ambitious workaholic, but apart from that, pretty simple person.', NULL, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 116 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

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
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of dokumen_pegawai
-- ----------------------------
INSERT INTO `dokumen_pegawai` VALUES (1, 25, NULL, NULL, 'foto_siswa');
INSERT INTO `dokumen_pegawai` VALUES (2, 25, NULL, NULL, 'foto_siswa');
INSERT INTO `dokumen_pegawai` VALUES (3, 25, NULL, NULL, 'foto_siswa');
INSERT INTO `dokumen_pegawai` VALUES (4, 26, NULL, NULL, 'foto_siswa');
INSERT INTO `dokumen_pegawai` VALUES (5, 26, NULL, NULL, 'foto_siswa');
INSERT INTO `dokumen_pegawai` VALUES (6, 26, NULL, NULL, 'foto_siswa');
INSERT INTO `dokumen_pegawai` VALUES (7, 27, NULL, NULL, 'foto_siswa');
INSERT INTO `dokumen_pegawai` VALUES (8, 27, NULL, NULL, 'foto_siswa');
INSERT INTO `dokumen_pegawai` VALUES (9, 27, NULL, NULL, 'foto_siswa');
INSERT INTO `dokumen_pegawai` VALUES (10, 28, NULL, 'IMG-20171103-WA0008.jpg', 'foto_siswa');
INSERT INTO `dokumen_pegawai` VALUES (11, 31, NULL, 'baru.jpg', 'foto_siswa');
INSERT INTO `dokumen_pegawai` VALUES (12, 31, NULL, 'baru.jpg', 'foto_siswa');
INSERT INTO `dokumen_pegawai` VALUES (13, 31, NULL, 'baru.jpg', 'foto_siswa');

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
  PRIMARY KEY (`id_file_rapor_online`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of file_rapor_online
-- ----------------------------
INSERT INTO `file_rapor_online` VALUES (12, '1211db2633ffa4ef3fcc2ec3d5acc13f.pdf', 107, 1, '632328');
INSERT INTO `file_rapor_online` VALUES (13, 'd78a0cf00c20c65fcfe7bf0ed31061a2.pdf', 108, 1, '387426');
INSERT INTO `file_rapor_online` VALUES (14, 'c6cef42fc65d67e9c2f699a8698a9f0f.pdf', 109, 1, '908541');
INSERT INTO `file_rapor_online` VALUES (15, '9dee892d5f2e94929512017de918e662.pdf', 110, 1, '20229');
INSERT INTO `file_rapor_online` VALUES (16, '7a9fe44626b8963b7d029c44ce4ff351.pdf', 111, 1, '808450');
INSERT INTO `file_rapor_online` VALUES (17, '84b4a46411bcd72b174f35f03bc96e98.pdf', 112, 1, '954063');
INSERT INTO `file_rapor_online` VALUES (18, '75b470adc5e64465cc13581c68043af8.pdf', 113, 1, '828285');

-- ----------------------------
-- Table structure for groups
-- ----------------------------
DROP TABLE IF EXISTS `groups`;
CREATE TABLE `groups`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of groups
-- ----------------------------
INSERT INTO `groups` VALUES (1, 'admin', 'Administrator');
INSERT INTO `groups` VALUES (2, 'siswa', 'Siswa');
INSERT INTO `groups` VALUES (3, 'guru', 'Guru');
INSERT INTO `groups` VALUES (4, 'staff', 'Staff');
INSERT INTO `groups` VALUES (5, 'kepsek', 'kepsek');
INSERT INTO `groups` VALUES (6, 'kurikulum', 'kurikulum');
INSERT INTO `groups` VALUES (7, 'tu', 'Tata Usaha');

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
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of guru
-- ----------------------------
INSERT INTO `guru` VALUES (2, 'Rendy Yani Susanto, S.Pd.', '1', 'Malang', '14cd358dd2edfd41fd256b96ec7957bb.jpg', 'S1', 'Universitas Brawijaya', 'Rendy', 'rendy', 'rendy', 'rendy', 'Guru dan Programmer', 'rendy@smkitasy-syadzili.sch.id', '6285894632505', 'Laki-laki', 'Malang', 'Islam', 'WNA', 'Kawin', 'Rumah Kos', 0, 0, 0, 'O', '', '', '', '0000-00-00', '', '', '', 'K001', 'Cicik Winarsih', 'Non PNS', '', '1993-10-03');
INSERT INTO `guru` VALUES (6, 'Abdur Rochim, S.Pd.', '1234', 'Singosari', '148554d23346ab57fd47490df87182f0.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Abdurrochim@gmail.com', '', 'Laki-laki', 'Malang', 'Islam', 'WNA', 'Kawin', 'Rumah Kos', 0, 0, 0, 'O', '', '', '', '0000-00-00', '', '', '', 'K002', '', 'Non PNS', '', '0000-00-00');
INSERT INTO `guru` VALUES (7, 'Avi Hendratmoko, S.Kom.\r\n', '-', 'Dsn Prapatan RT 038 RW 005 Tulusbesar Kec. Tumpang Kab. Malang Jawa Timur', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'K003', NULL, NULL, NULL, NULL);
INSERT INTO `guru` VALUES (8, 'M. Maimun Muzakka\r\n', '123', 'malang', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'K004', NULL, NULL, NULL, NULL);
INSERT INTO `guru` VALUES (9, 'Cindy Permata Putri, S.Pd', NULL, 'Bugis, Saptorenggo', 'bucin.jpg', 'S1', 'IKIP Budi Utomo', '-', 'https://www.instagram.com/cindyputrii95/', 'Cindy', '-', 'Guru Bahasa Indonesia', 'Cindy@smkitasy-syadzili.sch.id', '6285895839663', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'K005', NULL, NULL, NULL, NULL);
INSERT INTO `guru` VALUES (10, 'Roikhatul Uzza, S.Psi', '123', 'Sumberpasir', 'buizza.jpg', 'S1', 'Universitas Islam', 'https://www.facebook.com/izzaclalu.dia', 'https://www.instagram.com/izza.sr/', NULL, NULL, 'Bimbingan Konseling', 'izza@smkitasy-syadzili.sch.id', '6283175798727', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'K006', NULL, NULL, NULL, NULL);
INSERT INTO `guru` VALUES (11, 'Refita Fardiani', NULL, 'Malang', 'burev.jpg', NULL, NULL, NULL, 'https://www.instagram.com/refhii_01/', NULL, NULL, 'Tata Usaha', 'refita@smkitasy-syadzili.sch.id', '6285645230304', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'K007', NULL, NULL, NULL, NULL);
INSERT INTO `guru` VALUES (12, 'Nur Cholis, S.Pdi', NULL, 'Malang', 'bunur.jpg', 'S1', NULL, NULL, NULL, NULL, NULL, 'Guru Pendidikan Agama Islam', 'nur@smkitasy-syadzili.sch.id', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'K008', NULL, NULL, NULL, NULL);
INSERT INTO `guru` VALUES (13, 'Pohet Bintoto, S.Pd., M.Si.\r\n', NULL, NULL, '8.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'K009', NULL, NULL, NULL, NULL);
INSERT INTO `guru` VALUES (14, 'Mohammad Nazibullah, M.Pd.\r\n', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'K010', NULL, NULL, NULL, NULL);
INSERT INTO `guru` VALUES (15, 'Syamsul Arifin, S.Pd.\r\n', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'K011', NULL, NULL, NULL, NULL);
INSERT INTO `guru` VALUES (16, 'M. Mirza Ayatulloh, S.Psi.\r\n', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'K012', NULL, NULL, NULL, NULL);
INSERT INTO `guru` VALUES (17, 'Sutan Taufik, S.Hum\r\n', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'K013', NULL, NULL, NULL, NULL);
INSERT INTO `guru` VALUES (18, 'Fatat Alvin D. N. S.\r\n', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'K014', NULL, NULL, NULL, NULL);
INSERT INTO `guru` VALUES (19, 'Nailatur Rizqiyah S.P.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'K015', NULL, NULL, NULL, NULL);
INSERT INTO `guru` VALUES (20, 'Saifudin Mansur, S.TP\r\n', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'K016', NULL, NULL, NULL, NULL);
INSERT INTO `guru` VALUES (21, 'Faridatuz Zakiyah, S.TP\r\n', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'K017', NULL, NULL, NULL, NULL);
INSERT INTO `guru` VALUES (22, 'Muhammad Iwan Wahyudi, S.Pd.\r\n', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'K018', NULL, NULL, NULL, NULL);
INSERT INTO `guru` VALUES (23, 'Muhammad Yasminto, S.Pd.\r\n', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'K019', NULL, NULL, NULL, NULL);
INSERT INTO `guru` VALUES (24, 'Muhammad Ali Saifudin, S.Pd.', '', '', 'd52da1e8b624f76abcce806a0a1b4470.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', 'Laki-laki', 'Malang', 'Islam', 'WNI', 'Kawin', 'Rumah Kos', 0, 0, 0, 'O', '', '', '', '0000-00-00', '', '', '', 'K020', '', 'Non PNS', '', '0000-00-00');
INSERT INTO `guru` VALUES (25, 'M. Faiz Zidni Mubarok, S.Pt\r\n', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'K021', NULL, NULL, NULL, NULL);
INSERT INTO `guru` VALUES (26, 'Fahmi Jamaludin, S.T.\r\n', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'K022', NULL, NULL, NULL, NULL);
INSERT INTO `guru` VALUES (27, 'Nur Azizah\r\n', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'K023', NULL, NULL, NULL, NULL);

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
  PRIMARY KEY (`id_guru_mapel`) USING BTREE,
  INDEX `idguru_fk`(`idguru_fk`) USING BTREE,
  INDEX `idmapel_fk`(`idmapel_fk`) USING BTREE,
  CONSTRAINT `guru_mapel_ibfk_1` FOREIGN KEY (`idguru_fk`) REFERENCES `guru` (`id_guru`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `guru_mapel_ibfk_2` FOREIGN KEY (`idmapel_fk`) REFERENCES `mata_pelajaran` (`id_mata_pelajaran`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 202 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of guru_mapel
-- ----------------------------
INSERT INTO `guru_mapel` VALUES (1, 2, 14, 1, 11);
INSERT INTO `guru_mapel` VALUES (4, 2, 14, 1, 13);
INSERT INTO `guru_mapel` VALUES (5, 2, 14, 1, 15);
INSERT INTO `guru_mapel` VALUES (6, 2, 7, 1, 19);
INSERT INTO `guru_mapel` VALUES (7, 2, 7, 1, 20);
INSERT INTO `guru_mapel` VALUES (8, 2, 7, 1, 21);
INSERT INTO `guru_mapel` VALUES (9, 2, 7, 1, 22);
INSERT INTO `guru_mapel` VALUES (10, 13, 3, 1, 16);
INSERT INTO `guru_mapel` VALUES (11, 13, 3, 1, 23);
INSERT INTO `guru_mapel` VALUES (12, 13, 3, 1, 24);
INSERT INTO `guru_mapel` VALUES (13, 13, 2, 1, 11);
INSERT INTO `guru_mapel` VALUES (14, 13, 2, 1, 13);
INSERT INTO `guru_mapel` VALUES (15, 13, 2, 1, 15);
INSERT INTO `guru_mapel` VALUES (16, 13, 2, 1, 16);
INSERT INTO `guru_mapel` VALUES (17, 13, 8, 1, 16);
INSERT INTO `guru_mapel` VALUES (18, 13, 9, 1, 16);
INSERT INTO `guru_mapel` VALUES (19, 14, 10, 1, 11);
INSERT INTO `guru_mapel` VALUES (20, 14, 10, 1, 13);
INSERT INTO `guru_mapel` VALUES (21, 14, 10, 1, 15);
INSERT INTO `guru_mapel` VALUES (22, 13, 3, 1, 14);
INSERT INTO `guru_mapel` VALUES (23, 13, 3, 1, 18);
INSERT INTO `guru_mapel` VALUES (24, 13, 2, 1, 14);
INSERT INTO `guru_mapel` VALUES (25, 13, 2, 1, 16);
INSERT INTO `guru_mapel` VALUES (26, 13, 8, 1, 14);
INSERT INTO `guru_mapel` VALUES (27, 13, 8, 1, 18);
INSERT INTO `guru_mapel` VALUES (28, 13, 9, 1, 14);
INSERT INTO `guru_mapel` VALUES (29, 13, 9, 1, 18);
INSERT INTO `guru_mapel` VALUES (30, 13, 2, 1, 17);
INSERT INTO `guru_mapel` VALUES (31, 14, 10, 1, 17);
INSERT INTO `guru_mapel` VALUES (32, 14, 10, 1, 14);
INSERT INTO `guru_mapel` VALUES (33, 14, 10, 1, 16);
INSERT INTO `guru_mapel` VALUES (34, 14, 10, 1, 18);
INSERT INTO `guru_mapel` VALUES (35, 14, 10, 1, 19);
INSERT INTO `guru_mapel` VALUES (36, 14, 10, 1, 20);
INSERT INTO `guru_mapel` VALUES (37, 14, 10, 1, 23);
INSERT INTO `guru_mapel` VALUES (38, 15, 1, 1, 19);
INSERT INTO `guru_mapel` VALUES (39, 15, 1, 1, 20);
INSERT INTO `guru_mapel` VALUES (40, 15, 1, 1, 23);
INSERT INTO `guru_mapel` VALUES (41, 15, 1, 1, 24);
INSERT INTO `guru_mapel` VALUES (42, 16, 11, 1, 19);
INSERT INTO `guru_mapel` VALUES (43, 16, 11, 1, 20);
INSERT INTO `guru_mapel` VALUES (44, 16, 11, 1, 21);
INSERT INTO `guru_mapel` VALUES (45, 16, 11, 1, 22);
INSERT INTO `guru_mapel` VALUES (46, 16, 8, 1, 11);
INSERT INTO `guru_mapel` VALUES (47, 16, 8, 1, 13);
INSERT INTO `guru_mapel` VALUES (48, 16, 8, 1, 15);
INSERT INTO `guru_mapel` VALUES (49, 16, 8, 1, 17);
INSERT INTO `guru_mapel` VALUES (50, 17, 1, 1, 14);
INSERT INTO `guru_mapel` VALUES (51, 17, 1, 1, 16);
INSERT INTO `guru_mapel` VALUES (52, 17, 1, 1, 18);
INSERT INTO `guru_mapel` VALUES (53, 17, 1, 1, 21);
INSERT INTO `guru_mapel` VALUES (54, 18, 12, 1, 14);
INSERT INTO `guru_mapel` VALUES (55, 18, 12, 1, 16);
INSERT INTO `guru_mapel` VALUES (56, 18, 14, 1, 14);
INSERT INTO `guru_mapel` VALUES (57, 18, 14, 1, 16);
INSERT INTO `guru_mapel` VALUES (58, 18, 15, 1, 14);
INSERT INTO `guru_mapel` VALUES (59, 18, 15, 1, 16);
INSERT INTO `guru_mapel` VALUES (60, 18, 13, 1, 14);
INSERT INTO `guru_mapel` VALUES (61, 18, 13, 1, 16);
INSERT INTO `guru_mapel` VALUES (62, 10, 16, 1, 18);
INSERT INTO `guru_mapel` VALUES (63, 10, 17, 1, 23);
INSERT INTO `guru_mapel` VALUES (64, 10, 17, 1, 24);
INSERT INTO `guru_mapel` VALUES (65, 7, 6, 1, 21);
INSERT INTO `guru_mapel` VALUES (66, 7, 6, 1, 22);
INSERT INTO `guru_mapel` VALUES (67, 7, 18, 1, 21);
INSERT INTO `guru_mapel` VALUES (68, 7, 18, 1, 22);
INSERT INTO `guru_mapel` VALUES (69, 19, 19, 1, 23);
INSERT INTO `guru_mapel` VALUES (70, 19, 20, 1, 23);
INSERT INTO `guru_mapel` VALUES (71, 19, 20, 1, 24);
INSERT INTO `guru_mapel` VALUES (72, 19, 21, 1, 23);
INSERT INTO `guru_mapel` VALUES (73, 19, 21, 1, 24);
INSERT INTO `guru_mapel` VALUES (74, 19, 7, 1, 23);
INSERT INTO `guru_mapel` VALUES (75, 19, 7, 1, 24);
INSERT INTO `guru_mapel` VALUES (76, 19, 22, 1, 18);
INSERT INTO `guru_mapel` VALUES (78, 12, 11, 1, 14);
INSERT INTO `guru_mapel` VALUES (79, 12, 11, 1, 16);
INSERT INTO `guru_mapel` VALUES (80, 12, 11, 1, 18);
INSERT INTO `guru_mapel` VALUES (81, 12, 11, 1, 23);
INSERT INTO `guru_mapel` VALUES (82, 12, 11, 1, 24);
INSERT INTO `guru_mapel` VALUES (83, 20, 19, 1, 24);
INSERT INTO `guru_mapel` VALUES (84, 21, 24, 1, 18);
INSERT INTO `guru_mapel` VALUES (85, 21, 25, 1, 18);
INSERT INTO `guru_mapel` VALUES (86, 8, 23, 1, 19);
INSERT INTO `guru_mapel` VALUES (87, 8, 23, 1, 20);
INSERT INTO `guru_mapel` VALUES (88, 8, 5, 1, 19);
INSERT INTO `guru_mapel` VALUES (89, 8, 5, 1, 20);
INSERT INTO `guru_mapel` VALUES (90, 8, 6, 1, 19);
INSERT INTO `guru_mapel` VALUES (91, 8, 8, 1, 20);
INSERT INTO `guru_mapel` VALUES (92, 8, 18, 1, 19);
INSERT INTO `guru_mapel` VALUES (93, 8, 18, 1, 20);
INSERT INTO `guru_mapel` VALUES (94, 9, 4, 1, 11);
INSERT INTO `guru_mapel` VALUES (95, 9, 4, 1, 13);
INSERT INTO `guru_mapel` VALUES (96, 9, 4, 1, 15);
INSERT INTO `guru_mapel` VALUES (97, 9, 4, 1, 17);
INSERT INTO `guru_mapel` VALUES (98, 9, 4, 1, 19);
INSERT INTO `guru_mapel` VALUES (99, 9, 4, 1, 20);
INSERT INTO `guru_mapel` VALUES (100, 9, 4, 1, 14);
INSERT INTO `guru_mapel` VALUES (101, 9, 4, 1, 16);
INSERT INTO `guru_mapel` VALUES (102, 9, 4, 1, 18);
INSERT INTO `guru_mapel` VALUES (103, 9, 4, 1, 21);
INSERT INTO `guru_mapel` VALUES (104, 9, 4, 1, 22);
INSERT INTO `guru_mapel` VALUES (105, 9, 4, 1, 23);
INSERT INTO `guru_mapel` VALUES (106, 9, 4, 1, 24);
INSERT INTO `guru_mapel` VALUES (107, 22, 11, 1, 11);
INSERT INTO `guru_mapel` VALUES (108, 22, 11, 1, 13);
INSERT INTO `guru_mapel` VALUES (109, 22, 11, 1, 15);
INSERT INTO `guru_mapel` VALUES (110, 22, 12, 1, 11);
INSERT INTO `guru_mapel` VALUES (111, 22, 12, 1, 13);
INSERT INTO `guru_mapel` VALUES (112, 22, 12, 1, 15);
INSERT INTO `guru_mapel` VALUES (113, 23, 1, 1, 11);
INSERT INTO `guru_mapel` VALUES (114, 23, 1, 1, 13);
INSERT INTO `guru_mapel` VALUES (115, 23, 1, 1, 14);
INSERT INTO `guru_mapel` VALUES (116, 23, 1, 1, 15);
INSERT INTO `guru_mapel` VALUES (117, 23, 1, 1, 16);
INSERT INTO `guru_mapel` VALUES (118, 23, 1, 1, 17);
INSERT INTO `guru_mapel` VALUES (119, 23, 1, 1, 18);
INSERT INTO `guru_mapel` VALUES (120, 23, 1, 1, 22);
INSERT INTO `guru_mapel` VALUES (121, 24, 3, 1, 11);
INSERT INTO `guru_mapel` VALUES (122, 24, 3, 1, 13);
INSERT INTO `guru_mapel` VALUES (123, 24, 3, 1, 15);
INSERT INTO `guru_mapel` VALUES (124, 24, 3, 1, 17);
INSERT INTO `guru_mapel` VALUES (125, 24, 3, 1, 19);
INSERT INTO `guru_mapel` VALUES (126, 24, 3, 1, 20);
INSERT INTO `guru_mapel` VALUES (127, 24, 3, 1, 21);
INSERT INTO `guru_mapel` VALUES (128, 24, 3, 1, 22);
INSERT INTO `guru_mapel` VALUES (129, 25, 24, 1, 17);
INSERT INTO `guru_mapel` VALUES (130, 25, 25, 1, 17);
INSERT INTO `guru_mapel` VALUES (131, 25, 22, 1, 17);
INSERT INTO `guru_mapel` VALUES (132, 25, 9, 1, 11);
INSERT INTO `guru_mapel` VALUES (133, 25, 9, 1, 13);
INSERT INTO `guru_mapel` VALUES (134, 25, 9, 1, 15);
INSERT INTO `guru_mapel` VALUES (135, 25, 9, 1, 17);
INSERT INTO `guru_mapel` VALUES (136, 25, 16, 1, 17);
INSERT INTO `guru_mapel` VALUES (137, 26, 13, 1, 11);
INSERT INTO `guru_mapel` VALUES (138, 26, 13, 1, 13);
INSERT INTO `guru_mapel` VALUES (139, 26, 13, 1, 15);
INSERT INTO `guru_mapel` VALUES (140, 26, 15, 1, 11);
INSERT INTO `guru_mapel` VALUES (141, 26, 15, 1, 13);
INSERT INTO `guru_mapel` VALUES (142, 26, 15, 1, 15);
INSERT INTO `guru_mapel` VALUES (143, 26, 5, 1, 21);
INSERT INTO `guru_mapel` VALUES (144, 26, 5, 1, 22);
INSERT INTO `guru_mapel` VALUES (145, 17, 27, 1, 11);
INSERT INTO `guru_mapel` VALUES (146, 17, 27, 1, 13);
INSERT INTO `guru_mapel` VALUES (149, 17, 27, 1, 14);
INSERT INTO `guru_mapel` VALUES (150, 17, 27, 1, 15);
INSERT INTO `guru_mapel` VALUES (151, 17, 27, 1, 16);
INSERT INTO `guru_mapel` VALUES (153, 17, 27, 1, 17);
INSERT INTO `guru_mapel` VALUES (155, 17, 27, 1, 18);
INSERT INTO `guru_mapel` VALUES (156, 17, 27, 1, 19);
INSERT INTO `guru_mapel` VALUES (158, 17, 27, 1, 20);
INSERT INTO `guru_mapel` VALUES (159, 17, 27, 1, 21);
INSERT INTO `guru_mapel` VALUES (160, 17, 27, 1, 22);
INSERT INTO `guru_mapel` VALUES (161, 17, 26, 1, 11);
INSERT INTO `guru_mapel` VALUES (162, 17, 26, 1, 13);
INSERT INTO `guru_mapel` VALUES (163, 17, 26, 1, 14);
INSERT INTO `guru_mapel` VALUES (164, 17, 26, 1, 15);
INSERT INTO `guru_mapel` VALUES (165, 17, 26, 1, 16);
INSERT INTO `guru_mapel` VALUES (166, 17, 26, 1, 17);
INSERT INTO `guru_mapel` VALUES (167, 17, 26, 1, 18);
INSERT INTO `guru_mapel` VALUES (168, 17, 26, 1, 19);
INSERT INTO `guru_mapel` VALUES (171, 17, 26, 1, 20);
INSERT INTO `guru_mapel` VALUES (172, 17, 26, 1, 21);
INSERT INTO `guru_mapel` VALUES (174, 17, 26, 1, 22);
INSERT INTO `guru_mapel` VALUES (175, 10, 28, 1, 11);
INSERT INTO `guru_mapel` VALUES (176, 10, 28, 1, 13);
INSERT INTO `guru_mapel` VALUES (177, 10, 28, 1, 14);
INSERT INTO `guru_mapel` VALUES (178, 10, 28, 1, 15);
INSERT INTO `guru_mapel` VALUES (179, 10, 28, 1, 16);
INSERT INTO `guru_mapel` VALUES (180, 10, 28, 1, 17);
INSERT INTO `guru_mapel` VALUES (181, 10, 28, 1, 18);
INSERT INTO `guru_mapel` VALUES (182, 10, 28, 1, 19);
INSERT INTO `guru_mapel` VALUES (183, 10, 28, 1, 20);
INSERT INTO `guru_mapel` VALUES (184, 10, 28, 1, 21);
INSERT INTO `guru_mapel` VALUES (185, 10, 28, 1, 22);
INSERT INTO `guru_mapel` VALUES (186, 10, 28, 1, 23);
INSERT INTO `guru_mapel` VALUES (187, 10, 28, 1, 24);
INSERT INTO `guru_mapel` VALUES (188, 10, 29, 1, 11);
INSERT INTO `guru_mapel` VALUES (189, 10, 29, 1, 13);
INSERT INTO `guru_mapel` VALUES (190, 10, 29, 1, 14);
INSERT INTO `guru_mapel` VALUES (191, 10, 29, 1, 15);
INSERT INTO `guru_mapel` VALUES (192, 10, 29, 1, 16);
INSERT INTO `guru_mapel` VALUES (193, 10, 29, 1, 17);
INSERT INTO `guru_mapel` VALUES (194, 10, 29, 1, 18);
INSERT INTO `guru_mapel` VALUES (195, 10, 30, 1, 11);
INSERT INTO `guru_mapel` VALUES (196, 10, 30, 1, 13);
INSERT INTO `guru_mapel` VALUES (197, 10, 30, 1, 14);
INSERT INTO `guru_mapel` VALUES (198, 10, 30, 1, 15);
INSERT INTO `guru_mapel` VALUES (199, 10, 30, 1, 16);
INSERT INTO `guru_mapel` VALUES (200, 10, 30, 1, 17);
INSERT INTO `guru_mapel` VALUES (201, 10, 30, 1, 18);

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
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of hobi_pegawai
-- ----------------------------
INSERT INTO `hobi_pegawai` VALUES (1, 24, 'H1', 'A', '2');
INSERT INTO `hobi_pegawai` VALUES (2, 24, 'H2', 'A3', 'W');
INSERT INTO `hobi_pegawai` VALUES (3, 25, 'putbol', 'aktif', '2001');
INSERT INTO `hobi_pegawai` VALUES (4, 26, 'putbol', 'aktif', '2001');
INSERT INTO `hobi_pegawai` VALUES (5, 27, 'putbol', 'aktif', '2001');

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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of input_nilai_keterampilan
-- ----------------------------
INSERT INTO `input_nilai_keterampilan` VALUES (1, 14, 1, '6834858519', 2, 11, 1);

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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of input_nilai_pas
-- ----------------------------
INSERT INTO `input_nilai_pas` VALUES (1, 14, 1, '804571518', 2, 11);

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
  PRIMARY KEY (`id_input_nilai_pengetahuan`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of input_nilai_pengetahuan
-- ----------------------------
INSERT INTO `input_nilai_pengetahuan` VALUES (1, 14, 1, '6848538749', 2, 11, 1);

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
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jadwal_guru
-- ----------------------------
INSERT INTO `jadwal_guru` VALUES (6, 2, 1, '7', '14', '2021-04-27 13:00:26', 1);
INSERT INTO `jadwal_guru` VALUES (7, 2, 2, '7', '14', '2021-04-27 13:00:35', 1);
INSERT INTO `jadwal_guru` VALUES (8, 2, 3, '8', '14', '2021-04-27 13:00:47', 1);
INSERT INTO `jadwal_guru` VALUES (9, 2, 4, '7', '13', '2021-05-06 09:21:16', 1);
INSERT INTO `jadwal_guru` VALUES (10, 10, 1, '9', '15', '2021-05-06 09:21:42', 1);
INSERT INTO `jadwal_guru` VALUES (11, 10, 2, '9', '15', '2021-05-06 09:22:06', 1);
INSERT INTO `jadwal_guru` VALUES (12, 10, 3, '10', '15', '2021-05-06 09:22:15', 1);
INSERT INTO `jadwal_guru` VALUES (13, 10, 4, '9', '15', '2021-05-06 09:22:34', 1);
INSERT INTO `jadwal_guru` VALUES (14, 10, 5, '8', '14', '2021-05-06 09:22:43', 1);
INSERT INTO `jadwal_guru` VALUES (15, 15, 1, '8', '15', '2021-05-06 09:22:59', 1);
INSERT INTO `jadwal_guru` VALUES (16, 15, 4, '7', '15', '2021-05-06 09:23:05', 1);
INSERT INTO `jadwal_guru` VALUES (17, 7, 4, '8', '10', '2021-05-06 10:13:41', 1);
INSERT INTO `jadwal_guru` VALUES (18, 9, 6, '7', '13', '2021-05-08 10:27:00', 1);

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
-- Table structure for jurusan
-- ----------------------------
DROP TABLE IF EXISTS `jurusan`;
CREATE TABLE `jurusan`  (
  `id_jurusan` int(11) NOT NULL AUTO_INCREMENT,
  `jurusan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `singkatan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`id_jurusan`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jurusan
-- ----------------------------
INSERT INTO `jurusan` VALUES (1, 'Teknik Komputer dan Jaringan', 'TKJ');
INSERT INTO `jurusan` VALUES (2, 'Rekayasa Perangkat Lunak', 'RPL');
INSERT INTO `jurusan` VALUES (3, 'Multimedia', 'MM');
INSERT INTO `jurusan` VALUES (4, 'Agribisnis Pengolahan Hasil Pertanian', 'APHP');

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
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of kd
-- ----------------------------
INSERT INTO `kd` VALUES (1, 11, 3, 14, '', '3.1. Mengenal Bahasa Pemrograman', 11, 2, 1);
INSERT INTO `kd` VALUES (2, 11, 4, 14, '', '4.1. Mempraktikan bahasa pemrograman', 11, 2, 1);
INSERT INTO `kd` VALUES (3, 11, 3, 14, '', '3.2, Mengenal Variabel dan Tipe Data', 12, 2, 1);
INSERT INTO `kd` VALUES (4, 11, 4, 14, '', '4.2 Mempraktikan Variabel dan Tipe Data', 12, 2, 1);
INSERT INTO `kd` VALUES (5, 11, 3, 14, '', '3.3, Mengenal konstanta', 13, 2, 1);
INSERT INTO `kd` VALUES (6, 11, 4, 14, '', '4.3 Mempraktikan konstanta', 13, 2, 1);
INSERT INTO `kd` VALUES (7, 13, 3, 14, '', 'Mengenal Dasar Pemrograman', 14, 2, 1);
INSERT INTO `kd` VALUES (8, 13, 4, 14, '', 'Mempraktikan Dasar Pemrograman', 14, 2, 1);
INSERT INTO `kd` VALUES (9, 13, 3, 14, '', 'Mengenal Variabel dan Tipe Data', 15, 2, 1);
INSERT INTO `kd` VALUES (10, 13, 4, 14, '', 'Mempraktikan Variabel dan Tipe Data', 15, 2, 1);

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
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of kelas
-- ----------------------------
INSERT INTO `kelas` VALUES (11, 'X TKJ 1 Putra', 1, '2020-08-18 08:47:40', 1, 1);
INSERT INTO `kelas` VALUES (12, 'X TKJ Putri', 1, '2020-08-18 08:47:53', 1, 1);
INSERT INTO `kelas` VALUES (13, 'X RPL Putra', 1, '2020-08-18 08:48:14', 2, 1);
INSERT INTO `kelas` VALUES (14, 'X RPL Putri', 1, '2020-08-18 08:48:30', 2, 1);
INSERT INTO `kelas` VALUES (15, 'X MM Putra', 1, '2020-08-18 08:49:55', 3, 1);
INSERT INTO `kelas` VALUES (16, 'X MM Putri', 1, '2020-08-18 08:50:12', 3, 1);
INSERT INTO `kelas` VALUES (17, 'X APHP Putra', 1, '2020-08-18 08:50:30', 4, 1);
INSERT INTO `kelas` VALUES (18, 'X APHP Putri', 1, '2020-08-18 08:50:49', 4, 1);
INSERT INTO `kelas` VALUES (19, 'XI TKJ 1', 2, '2020-08-18 08:51:41', 1, 1);
INSERT INTO `kelas` VALUES (20, 'XI TKJ 2', 2, '2020-08-18 08:52:03', 1, 1);
INSERT INTO `kelas` VALUES (21, 'XII TKJ 1', 3, '2020-08-18 08:52:17', 1, 1);
INSERT INTO `kelas` VALUES (22, 'XII TKJ 2', 3, '2020-08-18 08:52:30', 1, 1);
INSERT INTO `kelas` VALUES (23, 'XI APHP', 2, '2020-08-18 08:54:28', 4, 1);
INSERT INTO `kelas` VALUES (24, 'XII APHP', 3, '2020-08-18 08:54:44', 4, 1);

-- ----------------------------
-- Table structure for kompetensi_pkg
-- ----------------------------
DROP TABLE IF EXISTS `kompetensi_pkg`;
CREATE TABLE `kompetensi_pkg`  (
  `id_kompetensi_pkg` int(11) NOT NULL AUTO_INCREMENT,
  `kompetensi` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `idtahunajaran_fk` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_kompetensi_pkg`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of kompetensi_pkg
-- ----------------------------
INSERT INTO `kompetensi_pkg` VALUES (1, 'Pedagogik', 1);
INSERT INTO `kompetensi_pkg` VALUES (3, 'Kepribadian', 1);
INSERT INTO `kompetensi_pkg` VALUES (4, 'Sosial', 1);
INSERT INTO `kompetensi_pkg` VALUES (5, 'Profesional', 1);

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
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of kursus_pegawai
-- ----------------------------
INSERT INTO `kursus_pegawai` VALUES (1, 'kk1', 10, 12, 1, 'NASIONAL', 'TIDAK ADA', '23');
INSERT INTO `kursus_pegawai` VALUES (2, 'KK2', 1, 2, 3, 'L', 'P', '23');
INSERT INTO `kursus_pegawai` VALUES (3, 'kk1', 10, 12, 1, 'NASIONAL', 'TIDAK ADA', '24');
INSERT INTO `kursus_pegawai` VALUES (4, 'KK2', 1, 2, 3, 'L', 'P', '24');
INSERT INTO `kursus_pegawai` VALUES (5, 'b.ind', 5, 2, 4, 'nasional', '-', '25');
INSERT INTO `kursus_pegawai` VALUES (6, 'mtk', 2, 2, 1, 'malang', 'tidak', '25');
INSERT INTO `kursus_pegawai` VALUES (7, 'b.ind', 5, 2, 4, 'nasional', '-', '26');
INSERT INTO `kursus_pegawai` VALUES (8, 'mtk', 2, 2, 1, 'malang', 'tidak', '26');
INSERT INTO `kursus_pegawai` VALUES (9, 'b.ind', 5, 2, 4, 'nasional', '-', '27');
INSERT INTO `kursus_pegawai` VALUES (10, 'mtk', 2, 2, 1, 'malang', 'tidak', '27');

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
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of learning
-- ----------------------------
INSERT INTO `learning` VALUES (1, 1, 999, '<p><strong>Pengertian Variabel</strong></p>\r\n<p>Variabel adalah suatu tempat yang berfungsi untuk menyimpan nilai atau&nbsp;<a href=\"https://www.belajarcpp.com/tutorial/konstanta/\">konstanta</a>. nilai tersebut biasanya di dapat dari masukan pengguna, programmer, lingkungan, atau merupakan hasil dari proses program.</p>\r\n<p>Variabel yang telah kita buat merupakan sebuah memori pada&nbsp;<a href=\"https://www.belajarcpp.com/tutorial/komputer/\">komputer</a>. Di dalam komputer, tepatnya pada memori komputer, sebenarnya terdapat banyak sekali memori yang tersusun yang memiliki alamat sebagai penanda memori. Alamat memori diwakili dengan&nbsp;<a href=\"https://www.belajarcpp.com/tutorial/sistem-bilangan/\">bilangan&nbsp;</a><em>hexadecimal</em>&nbsp;dan setiap alamat mewakili satu bit.</p>\r\n<p>Variabel adalah suatu tempat yang berfungsi untuk menyimpan nilai atau&nbsp;<a href=\"https://www.belajarcpp.com/tutorial/konstanta/\">konstanta</a>. nilai tersebut biasanya di dapat dari masukan pengguna, programmer, lingkungan, atau merupakan hasil dari proses program.</p>\r\n<p>Variabel yang telah kita buat merupakan sebuah memori pada&nbsp;<a href=\"https://www.belajarcpp.com/tutorial/komputer/\">komputer</a>. Di dalam komputer, tepatnya pada memori komputer, sebenarnya terdapat banyak sekali memori yang tersusun yang memiliki alamat sebagai penanda memori. Alamat memori diwakili dengan&nbsp;<a href=\"https://www.belajarcpp.com/tutorial/sistem-bilangan/\">bilangan&nbsp;</a><em>hexadecimal</em>&nbsp;dan setiap alamat mewakili satu bit.</p>\r\n<p><strong>Deklarasi Variabel</strong></p>\r\n<p>Deklarasi variabel adalah proses mendirikan atau pembuatan variabel dalam kode program. Untuk mendirikan variabel kita membutuhkan sebuah&nbsp;<a href=\"https://www.belajarcpp.com/tutorial/tipe-data/\">tipe data</a>&nbsp;yang berguna untuk mewakili bentuk nilai yang akan disimpan dan sebuah nama (<em><a href=\"https://www.belajarcpp.com/tutorial/identifier/\">identifier</a></em>) sebagai pengenal.</p>\r\n<p><u>Bentuk Penulisan</u></p>\r\n<div>\r\n<div id=\"highlighter_719294\" class=\"syntaxhighlighter cpp\">\r\n<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n<tbody>\r\n<tr>\r\n<td class=\"gutter\">\r\n<div class=\"line number1 index0 alt2\">1</div>\r\n</td>\r\n<td class=\"code\">\r\n<div class=\"container\">\r\n<div class=\"line number1 index0 alt2\"><code class=\"cpp plain\">tipe_data identitas;</code></div>\r\n</div>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</div>\r\n</div>\r\n<p><u>Contoh Penulisan</u></p>\r\n<div>\r\n<div id=\"highlighter_189378\" class=\"syntaxhighlighter cpp\">\r\n<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n<tbody>\r\n<tr>\r\n<td class=\"gutter\">\r\n<div class=\"line number1 index0 alt2\">1</div>\r\n</td>\r\n<td class=\"code\">\r\n<div class=\"container\">\r\n<div class=\"line number1 index0 alt2\"><code class=\"cpp color1 bold\">int</code> <code class=\"cpp plain\">umur;</code></div>\r\n</div>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</div>\r\n</div>\r\n<p>Pada contoh di atas kita nyatakan bahwa akan kita dirikan sebuah variabel yang dapat menyimpan data dalam bentuk&nbsp;<em>integer</em>&nbsp;dengan nama pengenal adalah&nbsp;<code>umur</code>.</p>\r\n<p>Anda dapat membuat variabel tanpa nilai atau anda juga bisa langsung menyertakan nilai pada saat deklarasi variabel, pemberial nilai saat deklarasi disebut sebagai&nbsp;<a href=\"https://www.belajarcpp.com/tutorial/inisialisasi/\">inisialisasi</a>.</p>\r\n<p><u>Bentuk Penulisan</u></p>\r\n<div>\r\n<div id=\"highlighter_507061\" class=\"syntaxhighlighter cpp\">\r\n<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n<tbody>\r\n<tr>\r\n<td class=\"gutter\">\r\n<div class=\"line number1 index0 alt2\">1</div>\r\n</td>\r\n<td class=\"code\">\r\n<div class=\"container\">\r\n<div class=\"line number1 index0 alt2\"><code class=\"cpp plain\">Tipe_data identitas = inisialisasi;</code></div>\r\n</div>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</div>\r\n</div>\r\n<p><u>Contoh Penulisan</u></p>\r\n<div>\r\n<div id=\"highlighter_182468\" class=\"syntaxhighlighter cpp\">\r\n<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n<tbody>\r\n<tr>\r\n<td class=\"gutter\">\r\n<div class=\"line number1 index0 alt2\">1</div>\r\n</td>\r\n<td class=\"code\">\r\n<div class=\"container\">\r\n<div class=\"line number1 index0 alt2\"><code class=\"cpp color1 bold\">int</code> <code class=\"cpp plain\">umur = 21;</code></div>\r\n</div>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</div>\r\n</div>\r\n<p>Sebuah deklarasi merupakan sebuah pernyataan, Setiap kali pendeklarasian variabel harus diakhiri dengan tanda titik koma&nbsp;<code>;</code>.</p>\r\n<p><em><strong>Peraturan Pembuatan Variabel</strong></em></p>\r\n<p>Dalam peraturan pemberian identitas variabel dapat terdiri dari huruf, angka dan karakter&nbsp;<code>_</code>. nama variabel harus dimulai dengan huruf atau tanda garis bawah&nbsp;<code>_</code>. dan juga huruf besar dan huruf kecil dalam pemrograman C++ akan dianggap beda meskipun memiliki nama yang sama karena C++ merupakan Bahasa Pemrograman&nbsp;<em>Case-Sensitive</em></p>\r\n<p>Ada satu peraturan lainnya dalam pemberian nama pada variabel yaitu tidak boleh menggunakan spasi saat penamaan variabel.</p>\r\n<p>tapi jika nama tersebut memiliki dua kata atau lebih dan ingin tetap menamakanya dengan kata terpisah supaya mudah dibaca, anda tidak bisa menulis namanya menggunakan spasi tapi anda bisa menggantikan spasi dengan tanda&nbsp;<code>_&nbsp;</code>. ini dapat mempermudah anda dalam pembacaan nama yang lebih dari 1 kata.</p>\r\n<p>Peraturan terakhir adalah nama variabel tidak boleh diawali dengan angka atau menggunakan operator aritmetika. contoh penulisan yang benar adalah:</p>\r\n<div>\r\n<div id=\"highlighter_938542\" class=\"syntaxhighlighter cpp\">\r\n<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n<tbody>\r\n<tr>\r\n<td class=\"gutter\">\r\n<div class=\"line number1 index0 alt2\">1</div>\r\n<div class=\"line number2 index1 alt1\">2</div>\r\n<div class=\"line number3 index2 alt2\">3</div>\r\n</td>\r\n<td class=\"code\">\r\n<div class=\"container\">\r\n<div class=\"line number1 index0 alt2\"><code class=\"cpp plain\">belajarcpp</code></div>\r\n<div class=\"line number2 index1 alt1\"><code class=\"cpp plain\">belajar_cpp</code></div>\r\n<div class=\"line number3 index2 alt2\"><code class=\"cpp plain\">belajarCpp5</code></div>\r\n</div>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p><strong>Jenis Tipe Data</strong></p>\r\n<p>Dalam mendirikan sebuah variabel kita akan membutuhkan tipe data untuk menentukan bentuk dari nilai yang dapat disimpan dalam variabel tersebut. Tipe data variable secara umum bisa dibedakan menjadi tiga, yaitu:</p>\r\n<p><u><strong>Variabel Numerik:</strong></u>&nbsp;Memungkinkan pengguna menyimpan data dalam bentuk angka atau bilangan. Variabel numerik dapat dibagi menjadi beberapa bagian yaitu : Bilangan Bulat (<em>Integer</em>&nbsp;<code>int</code>), Bilangan Desimal Berpresisi Tunggal (<em>Floating Point</em>&nbsp;<code>float</code>). Bilangan Desimal Berpresisi Ganda (<em>Double Precision</em>&nbsp;<code>double</code>).</p>\r\n<p><strong>Variabel&nbsp;<em>Text</em>:</strong>&nbsp;memungkinkan pengguna untuk menyimpan data berbentuk karakter. Bahasa pemrograman C++ menyediakan beberapa tipe data untuk variabel jenis ini, seperti&nbsp;<code>char</code>&nbsp;(<em>Character</em>&nbsp;/ Karakter tunggal),&nbsp;<code>string</code>&nbsp;(kumpulan dari karakter atau kata) dll.</p>\r\n<p><strong><em>Boolean</em>:&nbsp;</strong>merupakan jenis yang hanya dapat mewakili satu dari dua pilihan yaitu 1 (<em>True</em>) atau 0 (<em>False</em>). Pada pemrograman C++ kita dapat gunakan tipe data jenis ini, dengan memberikan keyword&nbsp;<code>bool</code>.</p>\r\n</div>\r\n<p><strong>Pembuatan variabel :</strong></p>\r\n<div>\r\n<p><u>Contoh penulisan</u></p>\r\n<div>\r\n<div id=\"highlighter_526249\" class=\"syntaxhighlighter cpp\">\r\n<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n<tbody>\r\n<tr>\r\n<td class=\"gutter\">\r\n<div class=\"line number1 index0 alt2\">1</div>\r\n<div class=\"line number2 index1 alt1\">2</div>\r\n</td>\r\n<td class=\"code\">\r\n<div class=\"container\">\r\n<div class=\"line number1 index0 alt2\"><code class=\"cpp color1 bold\">int</code> <code class=\"cpp plain\">x, i, p;</code></div>\r\n<div class=\"line number2 index1 alt1\"><code class=\"cpp color1 bold\">double</code> <code class=\"cpp plain\">a, b, c;</code></div>\r\n</div>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</div>\r\n</div>\r\n<p>Hal ini sangat berguna karena tidak memakan banyak baris dalam mendirikan banyak variabel.</p>\r\n<p><u>Contoh pendeklarasian banyak variable dengan Inisialisasi :</u></p>\r\n<div>\r\n<div id=\"highlighter_441598\" class=\"syntaxhighlighter cpp\">\r\n<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n<tbody>\r\n<tr>\r\n<td class=\"gutter\">\r\n<div class=\"line number1 index0 alt2\">1</div>\r\n<div class=\"line number2 index1 alt1\">2</div>\r\n</td>\r\n<td class=\"code\">\r\n<div class=\"container\">\r\n<div class=\"line number1 index0 alt2\"><code class=\"cpp color1 bold\">int</code> <code class=\"cpp plain\">x=10, y=21;</code></div>\r\n<div class=\"line number2 index1 alt1\"><code class=\"cpp plain\">string nama =</code><code class=\"cpp string\">\"Belajar C++ \"</code><code class=\"cpp plain\">, website=&rdquo;belajarcpp.com&rdquo;;</code></div>\r\n</div>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</div>\r\n</div>\r\n<p><strong>Tabel Macam-macam Tipe Data.</strong></p>\r\n<table>\r\n<thead>\r\n<tr>\r\n<th>Tipe Data</th>\r\n<th>Bentuk Penulisan</th>\r\n</tr>\r\n</thead>\r\n<tbody>\r\n<tr>\r\n<td><em>Boolean</em></td>\r\n<td><code>bool</code></td>\r\n</tr>\r\n<tr>\r\n<td><em>Character</em></td>\r\n<td><code>char</code></td>\r\n</tr>\r\n<tr>\r\n<td><em>String</em></td>\r\n<td><code>string</code></td>\r\n</tr>\r\n<tr>\r\n<td><em>Integer</em></td>\r\n<td><code>int</code></td>\r\n</tr>\r\n<tr>\r\n<td><em>Floating Point</em></td>\r\n<td><code>float</code></td>\r\n</tr>\r\n<tr>\r\n<td><em>Double Floating Point</em></td>\r\n<td><code>double</code></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p><u>Bentuk Penulisan</u></p>\r\n<div>\r\n<div id=\"highlighter_457289\" class=\"syntaxhighlighter cpp\">\r\n<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n<tbody>\r\n<tr>\r\n<td class=\"gutter\">\r\n<div class=\"line number1 index0 alt2\">1</div>\r\n</td>\r\n<td class=\"code\">\r\n<div class=\"container\">\r\n<div class=\"line number1 index0 alt2\"><code class=\"cpp plain\">tipedata nama_variable=inisialisasi;</code></div>\r\n</div>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</div>\r\n</div>\r\n<p><u>Contoh Penulisan:</u></p>\r\n<div>\r\n<div id=\"highlighter_700776\" class=\"syntaxhighlighter cpp\">\r\n<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n<tbody>\r\n<tr>\r\n<td class=\"gutter\">\r\n<div class=\"line number1 index0 alt2\">1</div>\r\n<div class=\"line number2 index1 alt1\">2</div>\r\n<div class=\"line number3 index2 alt2\">3</div>\r\n<div class=\"line number4 index3 alt1\">4</div>\r\n<div class=\"line number5 index4 alt2\">5</div>\r\n<div class=\"line number6 index5 alt1\">6</div>\r\n</td>\r\n<td class=\"code\">\r\n<div class=\"container\">\r\n<div class=\"line number1 index0 alt2\"><code class=\"cpp color1 bold\">bool</code> <code class=\"cpp plain\">variabelBool = 0, variabel_boolean;</code></div>\r\n<div class=\"line number2 index1 alt1\"><code class=\"cpp color1 bold\">char</code> <code class=\"cpp plain\">variabelChar, variabel_char = </code><code class=\"cpp string\">\'a\'</code><code class=\"cpp plain\">;</code></div>\r\n<div class=\"line number3 index2 alt2\"><code class=\"cpp plain\">string variabelString = </code><code class=\"cpp string\">\"Belajar Cpp\"</code><code class=\"cpp plain\">, variabel_string;</code></div>\r\n<div class=\"line number4 index3 alt1\"><code class=\"cpp color1 bold\">int</code> <code class=\"cpp plain\">variabelInt, variabel_int = 9;</code></div>\r\n<div class=\"line number5 index4 alt2\"><code class=\"cpp color1 bold\">float</code> <code class=\"cpp plain\">variabelFloat = 20,9, variabel_float;</code></div>\r\n<div class=\"line number6 index5 alt1\"><code class=\"cpp color1 bold\">double</code> <code class=\"cpp plain\">variabelDouble, variabel_double = 90,0;</code></div>\r\n</div>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</div>\r\n</div>\r\n<p><u>Contoh Program</u></p>\r\n<div>\r\n<div id=\"highlighter_435667\" class=\"syntaxhighlighter cpp\">\r\n<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n<tbody>\r\n<tr>\r\n<td class=\"gutter\">\r\n<div class=\"line number1 index0 alt2\">1</div>\r\n<div class=\"line number2 index1 alt1\">2</div>\r\n<div class=\"line number3 index2 alt2\">3</div>\r\n<div class=\"line number4 index3 alt1\">4</div>\r\n<div class=\"line number5 index4 alt2\">5</div>\r\n<div class=\"line number6 index5 alt1\">6</div>\r\n<div class=\"line number7 index6 alt2\">7</div>\r\n<div class=\"line number8 index7 alt1\">8</div>\r\n<div class=\"line number9 index8 alt2\">9</div>\r\n<div class=\"line number10 index9 alt1\">10</div>\r\n<div class=\"line number11 index10 alt2\">11</div>\r\n<div class=\"line number12 index11 alt1\">12</div>\r\n<div class=\"line number13 index12 alt2\">13</div>\r\n<div class=\"line number14 index13 alt1\">14</div>\r\n<div class=\"line number15 index14 alt2\">15</div>\r\n<div class=\"line number16 index15 alt1\">16</div>\r\n<div class=\"line number17 index16 alt2\">17</div>\r\n<div class=\"line number18 index17 alt1\">18</div>\r\n<div class=\"line number19 index18 alt2\">19</div>\r\n</td>\r\n<td class=\"code\">\r\n<div class=\"container\">\r\n<div class=\"line number1 index0 alt2\"><code class=\"cpp preprocessor\">#include &lt;iostream&gt;</code></div>\r\n<div class=\"line number2 index1 alt1\"><code class=\"cpp keyword bold\">using</code> <code class=\"cpp keyword bold\">namespace</code> <code class=\"cpp plain\">std;</code></div>\r\n<div class=\"line number3 index2 alt2\">&nbsp;</div>\r\n<div class=\"line number4 index3 alt1\"><code class=\"cpp color1 bold\">int</code> <code class=\"cpp plain\">main ()</code></div>\r\n<div class=\"line number5 index4 alt2\"><code class=\"cpp plain\">{</code></div>\r\n<div class=\"line number6 index5 alt1\"><code class=\"cpp comments\">// Pendeklarasian variabel:</code></div>\r\n<div class=\"line number7 index6 alt2\"><code class=\"cpp color1 bold\">int</code> <code class=\"cpp plain\">a, b = 2;</code></div>\r\n<div class=\"line number8 index7 alt1\"><code class=\"cpp color1 bold\">int</code> <code class=\"cpp plain\">hasil;</code></div>\r\n<div class=\"line number9 index8 alt2\">&nbsp;</div>\r\n<div class=\"line number10 index9 alt1\"><code class=\"cpp comments\">// Operasi</code></div>\r\n<div class=\"line number11 index10 alt2\"><code class=\"cpp plain\">a = 5; </code><code class=\"cpp comments\">//Assignment Operator bukan inisialisasi</code></div>\r\n<div class=\"line number12 index11 alt1\"><code class=\"cpp plain\">a = a + 1;</code></div>\r\n<div class=\"line number13 index12 alt2\"><code class=\"cpp plain\">hasil = a - b;</code></div>\r\n<div class=\"line number14 index13 alt1\">&nbsp;</div>\r\n<div class=\"line number15 index14 alt2\"><code class=\"cpp comments\">//Output hasil operasi di atas</code></div>\r\n<div class=\"line number16 index15 alt1\"><code class=\"cpp plain\">cout &lt;&lt;</code><code class=\"cpp string\">\"Hasil dari operasi variabel adalah :\"</code><code class=\"cpp plain\">&lt;&lt;hasil;</code></div>\r\n<div class=\"line number17 index16 alt2\">&nbsp;</div>\r\n<div class=\"line number18 index17 alt1\"><code class=\"cpp keyword bold\">return</code> <code class=\"cpp plain\">0;</code></div>\r\n<div class=\"line number19 index18 alt2\"><code class=\"cpp plain\">}</code></div>\r\n</div>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</div>\r\n<p>&nbsp;</p>\r\n<p><strong>Tugas :</strong></p>\r\n<p>Saat ini semua negara sedang menghadapi wabah covid19, dibutuhkan sebuah aplikasi yang bisa mendeteksi apakah seseorang terkena covid19 atau tidak. untuk mengetahui dia terkena covid19 adalah jika suhunya lebih dari 38 derajat celcius. coba buat program yang bisa menampung suhu dan tampilkan suhu tersebut..</p>\r\n</div>\r\n</div>\r\n<p><strong>NOTE<br />Anda bisa menggunakan compiler online yang disediakan SMK di link <a href=\"http://elearning.smkitasy-syadzili.sch.id/\">http://elearning.smkitasy-syadzili.sch.id/</a></strong></p>\r\n<p>&nbsp;</p>\r\n</div>', 2, NULL, 1, 'Variabel dan Tipe Data C++', '2020-06-17 18:04:31', 1);
INSERT INTO `learning` VALUES (2, 1, 999, '<div>Salah satu permasalahan yang pasti akan dijumpai dalam pembuatan program adalah suatu percabangan. Percabangan yang dimaksud di sini tidak lain adalah suatu pemilihan statemen yang akan di eksekusi dimana pemilihan tersebut berdasarkan kondisi tertentu. Di dalam C++, terdapat 2 jenis struktur blok (blok program) yang digunakan untuk mengimplementasikan suatu percabangan, yaitu dengan menggunakan struktur if dan struktur switch. Struktur if sendiri pada artikel ini akan dibagi menjadi 4 yaitu : pernyataan if satu kondisi, pernyataan&nbsp;if dua kondisi / if-else, pernyataan&nbsp;if lebih dari dua kondisi / if-else majemuk dan pernyataan&nbsp;if bersarang / nested if.</div>\r\n<div>&nbsp;</div>\r\n<div>Statemen-statemen yang ada dalam sebuah blok percabangan akan dieksekusi hanya jika kondisi yang didefinisikan bernilai benar (terpenuhi). Artinya jika kondisi bernilai salah (tidak terpenuhi), maka statemen-statemen tersebut tidak akan dieksekusi atau akan diabaikan oleh compiler.</div>\r\n<div>&nbsp;</div>\r\n<div>Untuk memahami konsep percabangan, perhatikan kalimat dibawah ini:</div>\r\n<blockquote class=\"tr_bq\">\r\n<p>&nbsp;\"Jika Budi mendapat ranking satu maka Budi akan dibelikan sepatu baru\"</p>\r\n</blockquote>\r\n<div>Coba sobat amati, pada kalimat diatas yang merupakan kondisi adalah mendapat ranking satu. Pada kasus ini sepatu baru hanya akan dibeli jika Budi mendapat ranking satu. Sebaliknya, jika tidak mendapat ranking satu, maka sepatu baru pun tidak akan dibelikan.</div>\r\n<div>&nbsp;</div>\r\n<div>\r\n<p><strong>Macam-macam operator yang digunakan.</strong></p>\r\n<p><strong>Operator Relasi</strong>&nbsp;- Operator ini digunakan untuk membandingkan 2 buah data untuk mendepatkan kondisi benar (TRUE) atau salah (FALSE). Berikut daftarnya:</p>\r\n<table>\r\n<thead>\r\n<tr>\r\n<th>Operator</th>\r\n<th>Keterangan</th>\r\n</tr>\r\n</thead>\r\n<tbody>\r\n<tr>\r\n<td>==</td>\r\n<td>Sama dengan</td>\r\n</tr>\r\n<tr>\r\n<td>!=</td>\r\n<td>Tidak sama dengan</td>\r\n</tr>\r\n<tr>\r\n<td>&lt;</td>\r\n<td>Kurang dari</td>\r\n</tr>\r\n<tr>\r\n<td>&gt;</td>\r\n<td>Lebih dari</td>\r\n</tr>\r\n<tr>\r\n<td>&lt;=</td>\r\n<td>Kurang dari atau sama dengan</td>\r\n</tr>\r\n<tr>\r\n<td>&gt;=</td>\r\n<td>Lebih dari atau sama dengan</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p><strong>Operator Logika</strong>&nbsp;- Faktanya, terkadang kita dihadapkan kondisi yang memiliki lebih dari satu syarat. Jika anda mengalami hal yang sama maka gunakan operator berikut:</p>\r\n<table>\r\n<thead>\r\n<tr>\r\n<th>Operator</th>\r\n<th>Keterangan</th>\r\n</tr>\r\n</thead>\r\n<tbody>\r\n<tr>\r\n<td>&amp;&amp;</td>\r\n<td>And (Semua kondisi harus bernilai benar)</td>\r\n</tr>\r\n<tr>\r\n<td>||</td>\r\n<td>Or (Salah satu harus bernilai benar)</td>\r\n</tr>\r\n<tr>\r\n<td>!</td>\r\n<td>Not (Kebalikan dari kondisi sebenarnya)</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</div>\r\n<div>\r\n<div>\r\n<h2>1. Pernyataan IF Satu Kondisi</h2>\r\n<p>Seperti yang sudah kita ketahui, pernyataan percabangan dipakai untuk memecahkan persoalan dengan cara mengambil suatu keputusan dari berbagai pernyataan yang ada. Untuk keperluan pengambilan keputusan, Dev-C++ menyediakan beberapa perintah salah satunya adalah if satu kondisi. Pernyataan if satu kondisi mempunyai pengertian, \"Jika kondisi bernilai benar, maka perintah akan dikerjakan dan jika kondisi bernilai salah, maka perintah akan diabaikan\".</p>\r\n</div>\r\n<div>&nbsp;</div>\r\n<ul>\r\n<li>Jika kondisi bernilai benar, maka perintah akan dikerjakan.</li>\r\n<li>Jika kondisi bernilai salah, maka perintah tidak akan dikerjakan</li>\r\n</ul>\r\n<div>Pengertian tersebut dapat dicerminkan melalui diagram alir berikut ini:</div>\r\n<table class=\"tr-caption-container\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\">\r\n<tbody>\r\n<tr>\r\n<td><a href=\"https://3.bp.blogspot.com/-DqIL6POdmqA/WQyd2hpXa8I/AAAAAAAAAgg/k6UdoguQWREYtc3fB-INUtOFce5KvKvuwCLcB/s1600/diagram%2Balir%2Bpernyataan%2Bif.JPG\"><img title=\"diagram alir pernyataan if satu kondisi\" src=\"https://3.bp.blogspot.com/-DqIL6POdmqA/WQyd2hpXa8I/AAAAAAAAAgg/k6UdoguQWREYtc3fB-INUtOFce5KvKvuwCLcB/s400/diagram%2Balir%2Bpernyataan%2Bif.JPG\" alt=\"diagram alir pernyataan if satu kondisi\" width=\"318\" height=\"400\" border=\"0\" /></a></td>\r\n</tr>\r\n<tr>\r\n<td class=\"tr-caption\">Diagram alir pernyataan if satu kondisi</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<div>&nbsp;</div>\r\n<div><strong>Struktur If Satu Kondisi</strong></div>\r\n<div>Struktur if satu kondisi merupakan struktur yang paling sederhana karena hanya melibatkan sebuah ekspresi yang akan diperiksa.</div>\r\n<div>&nbsp;</div>\r\n<div>Bentuk umum dari struktur percabangan if satu kondisi adalah sebagai berikut:</div>\r\n<div>\r\n<blockquote class=\"tr_bq\">\r\n<p>&nbsp;// Jika terdapat lebih dari satu pernyataan / statemen<br />if (kondisi){<br />Statemen/Pernyataan;<br />Statemen/Pernyataan;<br />}</p>\r\n<p>// Jika hanya terdapat satu statemen<br />// Dapat ditulis sebagai berikut<br />if (kondisi) Statemen;</p>\r\n</blockquote>\r\n</div>\r\n<div>&nbsp;</div>\r\n<div><strong>Contoh Program dengan Struktur If Satu Kondisi</strong></div>\r\n<div>\r\n<p>Berikut beberapa contoh program yang menerapkan struktur if satu kondisi seperti yang telah kami jelaskan diatas:</p>\r\n<table class=\"tr-caption-container\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\">\r\n<tbody>\r\n<tr>\r\n<td><a href=\"https://3.bp.blogspot.com/-BnPVQhakg9I/WQ1Oh7jhxtI/AAAAAAAAAgw/p_ucl2J8yz8VEt2PkzP1Y5yTmjSyA36tQCLcB/s1600/Contoh%2BProgram%2BI%2Bdengan%2BStruktur%2BIf%2BSatu%2BKondisi.JPG\"><img title=\"Contoh Program I dengan Struktur If Satu Kondisi\" src=\"https://3.bp.blogspot.com/-BnPVQhakg9I/WQ1Oh7jhxtI/AAAAAAAAAgw/p_ucl2J8yz8VEt2PkzP1Y5yTmjSyA36tQCLcB/s400/Contoh%2BProgram%2BI%2Bdengan%2BStruktur%2BIf%2BSatu%2BKondisi.JPG\" alt=\"Contoh Program I dengan Struktur If Satu Kondisi\" width=\"400\" height=\"186\" border=\"0\" /></a></td>\r\n</tr>\r\n<tr>\r\n<td class=\"tr-caption\">Contoh Program I dengan Struktur If Satu Kondisi</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<blockquote class=\"tr_bq\">\r\n<p>&nbsp;#include &lt;iostream&gt;</p>\r\n<p>using namespace std;</p>\r\n<p>int main()<br />{<br />int bilangan;</p>\r\n<p>// Memberikan informasi agar user memasukkan<br />// Sebuah bilangan bulat<br />cout&lt;&lt;\"\\t== Program Bilangan Positif ==\\n\\n\";<br />cout&lt;&lt;\"Masukkan bilangan : \";</p>\r\n<p>// Membaca nilai yang dimasukkan dari keyboard<br />// Dan disimpan ke variabel Bilangan<br />cin&gt;&gt;bilangan;</p>\r\n<p>// Program ini merupakan contoh if satu kondisi<br />// Akan menampilkan sebuah teks jika<br />// Bilangan yang dimasukkan &gt; 0<br /><strong>&nbsp; &nbsp;</strong>if(bilangan &gt; 0){<br />cout&lt;&lt;\"\\nAnda memasukkan bilangan Positif\\n\";<br />cout&lt;&lt;\"Bilangan tersebut adalah \"&lt;&lt;bilangan;<br /><strong>}</strong></p>\r\n<p>return 0;<br />}</p>\r\n</blockquote>\r\n</div>\r\n<div>\r\n<h2>2. Pernyataan IF Dua Kondisi</h2>\r\n<div>\r\n<p>Struktur percabangan if dua kondisi / if-else sedikit lebih kompleks bila dibandingkan dengan struktur if yang hanya memiliki satu buah kondisi. Sebenarnya konsepnya juga sederhana, yaitu pada struktur jenis ini terdapat sebuah statemen khusus yang berfungsi untuk mengatasi kejadia apabila kondisi yang didefinisikan tersebut bernilai salah (tidak terpenuhi).</p>\r\n</div>\r\n<div>Artinya dalam pernyataan if dua kondisi \"Jika kondisi bernilai benar, maka perintah-1 akan dikerjakan dan jika kondisi bernilai salah (tidak terpenuhi) maka akan mengerjakan perintah-2\".</div>\r\n<div>&nbsp;</div>\r\n<div>Dari pengertian tersebut dapat dicerminkan melalui diagram alir berikut ini.</div>\r\n<table class=\"tr-caption-container\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\">\r\n<tbody>\r\n<tr>\r\n<td><a href=\"https://2.bp.blogspot.com/-0gVVnWXYIXM/WQ2LELGIMwI/AAAAAAAAAhQ/EbRPslqcTLMPAVdb5hC9E87Q8Fav2C2zQCLcB/s1600/diagram%2Balir%2Bpernyataan%2Bif%2Bdua%2Bkondisi.JPG\"><img title=\"diagram alir pernyataan if dua kondisi\" src=\"https://2.bp.blogspot.com/-0gVVnWXYIXM/WQ2LELGIMwI/AAAAAAAAAhQ/EbRPslqcTLMPAVdb5hC9E87Q8Fav2C2zQCLcB/s400/diagram%2Balir%2Bpernyataan%2Bif%2Bdua%2Bkondisi.JPG\" alt=\"diagram alir pernyataan if dua kondisi\" width=\"400\" height=\"365\" border=\"0\" /></a></td>\r\n</tr>\r\n<tr>\r\n<td class=\"tr-caption\">diagram alir pernyataan if dua kondisi</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<div>&nbsp;</div>\r\n<div><strong>Struktur If Dua Kondisi (If Else)</strong></div>\r\n<div>Bentuk umum dari struktur percabangan dengan dua kondisi adalah sebagai berikut:</div>\r\n<blockquote class=\"tr_bq\">\r\n<p>&nbsp;if (kondisi){<br />Statemen_jika_kondisi_terpenuhi;<br />}<br />else{<br />Statemen_jika_kondisi_tidak_terpenuhi;<br />}</p>\r\n</blockquote>\r\n<div><strong>Contoh program dengan Struktur If Dua Kondisi (If Else)</strong></div>\r\n<div>Berikut beberapa contoh program yang menerapkan struktur if dua kondisi seperti yang telah kami jelaskan diatas:</div>\r\n<table class=\"tr-caption-container\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\">\r\n<tbody>\r\n<tr>\r\n<td><a href=\"https://2.bp.blogspot.com/-Q53W_QO9HoE/WQ2LEN8D-OI/AAAAAAAAAhU/aBmDplWyoykWHR8stXpoiW-5EeaHduJ7wCEw/s1600/Contoh%2BProgram%2BI%2Bdengan%2BStruktur%2BIf%2BDua%2BKondisi.JPG\"><img title=\"Contoh Program I dengan Struktur If Dua Kondisi\" src=\"https://2.bp.blogspot.com/-Q53W_QO9HoE/WQ2LEN8D-OI/AAAAAAAAAhU/aBmDplWyoykWHR8stXpoiW-5EeaHduJ7wCEw/s400/Contoh%2BProgram%2BI%2Bdengan%2BStruktur%2BIf%2BDua%2BKondisi.JPG\" alt=\"Contoh Program I dengan Struktur If Dua Kondisi\" width=\"400\" height=\"205\" border=\"0\" /></a></td>\r\n</tr>\r\n<tr>\r\n<td class=\"tr-caption\">Contoh Program I dengan Struktur If Dua Kondisi</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<div>\r\n<blockquote class=\"tr_bq\">\r\n<p>&nbsp;#include &lt;iostream&gt;</p>\r\n<p>using namespace std;</p>\r\n<p>int main()<br />{<br />int bilangan;</p>\r\n<p>// Memberikan informasi agar user memasukkan<br />// Sebuah bilangan bulat<br />cout&lt;&lt;\"\\t== Program Bilangan Positif ==\\n\\n\";<br />cout&lt;&lt;\"Masukkan bilangan : \";</p>\r\n<p>// Membaca nilai yang dimasukkan dari keyboard<br />// Dan disimpan ke variabel Bilangan<br />cin&gt;&gt;bilangan;</p>\r\n<p>// Program ini merupakan contoh if dua kondisi<br />if(bilangan &gt; 0){<br />cout&lt;&lt;\"\\nAnda memasukkan bilangan Positif\\n\";<br />cout&lt;&lt;\"Bilangan tersebut adalah \"&lt;&lt;bilangan;<br />}<br />else{<br />cout&lt;&lt;\"\\nAnda memasukkan bilangan kurang dari 1\";<br />cout&lt;&lt;\"\\nBilangan tersebut adalah \"&lt;&lt;bilangan;<br />}</p>\r\n<p>return 0;<br />}</p>\r\n</blockquote>\r\n<h2>3. Pernyataan IF Lebih Dari Dua Kondisi</h2>\r\n<div>Struktur percabangan if lebih dari dua kondisi / if-else majemuk merupakan struktur percabangan yang biasanya membingunggkan para programmer pemula. Percabangan If-else majemuk sebenarnya merupakan pengembangan dari struktur if dua kondisi, karena percabangan ini akan menambahkan (menyisipkan) satu atau lebih kondisi ke dalamnya.<br /><img class=\"alignnone size-full wp-image-742\" src=\"https://smkitasy-syadzili.sch.id/wp-content/uploads/2020/02/Untitled-Diagram.jpg\" alt=\"\" width=\"341\" height=\"391\" /><br />Artinya dalam pernyataan if lebih dari dua kondisi: Jika kondisi1 bernilai benar, maka perintah-1 akan dikerjakan, jika kondisi1 salah maka akan mengecek kondisi2 dan jika kondisi2 bernilai benar, maka perintah-2 akan dikerjakan, jika kondisi2 juga salah maka akan mengecek kondisi berikutnya dan akan mengerjakan perintah pada struktur blok yang memiliki kondisi bernilai benar. Seandainya tidak ada kondisi yang bernilai benar, maka akan mengerjakan perintah yang berada pada struktur blok else. untuk lebih jelasnya mari kita perhatikan struktur if-else majemuk dibawah ini.<strong>Struktur If Lebih Dari Dua Kondisi / If-Else Majemuk</strong><br />Bentuk umum dari struktur percabangan If yang memiliki lebih dari dua kondisi adalah sebagai berikut:\r\n<blockquote class=\"tr_bq\">\r\n<p>&nbsp;if(kondisi1){<br />Statemen_jika_kondisi1_terpenuhi;<br />}<br />else if(kondisi2){<br />Statemen_jika_kondisi2_terpenuhi;<br />}<br />else if(kondisi3){<br />Statemen_jika_kondisi3_terpenuhi;<br />}<br />else if(kondisi4){<br />Statemen_jika_kondisi4_terpenuhi;<br />}<br />.....<br />else{<br />Statemen_jika_semua_kondisi_tidak_terpenuhi;<br />}</p>\r\n</blockquote>\r\n<p><strong>Contoh Program dengan Struktur If Lebih Dari Dua Kondisi / If-Else Majemuk</strong><br />Untuk lebih memahami konsep dari struktur percabangan if-else majemuk, berikut kami sajikan beberapa contoh program yang mengimplementasikan hal tersebut.</p>\r\n<table class=\"tr-caption-container\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\">\r\n<tbody>\r\n<tr>\r\n<td><a href=\"https://4.bp.blogspot.com/-3FBx503uOlY/WQ874zaYq4I/AAAAAAAAAhk/7ur6USbfQxUQPy4DptDBtQ1Y3BHJCSAawCPcB/s1600/Contoh%2BProgram%2BI%2Bdengan%2BStruktur%2BIf%2BLebih%2BDari%2BDua%2BKondisi%2Batau%2BIf-Else%2BMajemuk.JPG\"><img title=\"Contoh Program I dengan Struktur If Lebih Dari Dua Kondisi atau If-Else Majemuk\" src=\"https://4.bp.blogspot.com/-3FBx503uOlY/WQ874zaYq4I/AAAAAAAAAhk/7ur6USbfQxUQPy4DptDBtQ1Y3BHJCSAawCPcB/s400/Contoh%2BProgram%2BI%2Bdengan%2BStruktur%2BIf%2BLebih%2BDari%2BDua%2BKondisi%2Batau%2BIf-Else%2BMajemuk.JPG\" alt=\"Contoh Program I dengan Struktur If Lebih Dari Dua Kondisi atau If-Else Majemuk\" width=\"400\" height=\"200\" border=\"0\" /></a></td>\r\n</tr>\r\n<tr>\r\n<td class=\"tr-caption\">Contoh Program I dengan Struktur If Lebih Dari Dua Kondisi atau If-Else Majemuk</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<blockquote class=\"tr_bq\">\r\n<p>&nbsp;#include &lt;iostream&gt;</p>\r\n<p>using namespace std;</p>\r\n<p>int main()<br />{<br />int bilangan;</p>\r\n<p>// Memberikan informasi agar user memasukkan<br />// Sebuah bilangan<br />cout&lt;&lt;\"\\t== Program Tentukan Bilangan ==\\n\\n\";<br />cout&lt;&lt;\"Masukkan bilangan : \";</p>\r\n<p>// Membaca nilai yang dimasukkan dari keyboard<br />// Dan disimpan ke variabel Bilangan<br />cin&gt;&gt;bilangan;</p>\r\n<p>// Program ini merupakan<br />// Contoh if lebih dari dua kondisi<br />if(bilangan &gt; 0){<br />cout&lt;&lt;\"\\nAnda memasukan bilangan Positif\\n\";<br />cout&lt;&lt;\"Bilangan tersebut adalah \"&lt;&lt;bilangan;<br />}<br />else if (bilangan &lt; 0){<br />cout&lt;&lt;\"\\nAnda memasukan bilangan Negatif\\n\";<br />cout&lt;&lt;\"Bilangan tersebut adalah \"&lt;&lt;bilangan;<br />}<br />else{<br />cout&lt;&lt;\"\\nAnda memasukkan bilangan NOL\\n\";<br />}</p>\r\n<p>return 0;<br />}</p>\r\n</blockquote>\r\n</div>\r\n<div>\r\n<h2>4. Pernyataan IF Bersarang</h2>\r\n<div>Struktur percabangan if bersarang / nested if merupakan struktur if yang paling komplek, karena merupakan perluasan dan kombinasi dari berbagai struktur if lainnya. Konsep dari percabangan ini adalah terdapat Struktur If yang berada didalam Struktur If lainnya. Artinya dalam pernyataan If bersarang jika kondisi If yang paling luar (paling atas) bernilai benar, maka kondisi If yang berada didalamnya baru akan dilihat (di cek).<br /><img class=\"alignnone size-full wp-image-743\" src=\"https://smkitasy-syadzili.sch.id/wp-content/uploads/2020/02/Untitled-Diagram-1.jpg\" alt=\"\" width=\"458\" height=\"471\" /><br /><strong>Struktur If Bersarang / Nested If</strong><br />Bentuk umum dari struktur If bersarang / &nbsp;struktur if yang berada di dalam struktur if lainnya adalah sebagai berikut:</div>\r\n</div>\r\n<div>\r\n<blockquote class=\"tr_bq\">\r\n<p>&nbsp;if(kondisi1){<br />if(kondisi1a){<br />Statemen_jika_kondisi1_dan_1a_terpenuhi;<br />}<br />else if(kondisi1b){<br />Statemen_jika_kondisi1_dan_1b_terpenuhi;<br />}<br />.....<br />else{<br />Statemen_jika_hanya_kondisi1_yang_terpenuhi;<br />}<br />}<br />else if(kondisi2){<br />if(kondisi2a){<br />Statemen_jika_kondisi2_dan_2a_terpenuhi;<br />}<br />else if(kondisi2b){<br />Statemen_jika_kondisi2_dan_2b_terpenuhi;<br />}<br />.....<br />else{<br />Statemen_jika_hanya_kondisi2_yang_terpenuhi;<br />}<br />}<br />else if(kondisi3){<br />Statemen_jika_kondisi3_terpenuhi;<br />}<br />.....<br />else{<br />Statemen_jika_semua_kondisi_tidak_terpenuhi;<br />}</p>\r\n</blockquote>\r\n</div>\r\n<h2>5. Pernyataan Switch-Case</h2>\r\n<div>Selain menggunakan pernyataan If, C++ juga menawarkan kepada kita untuk dapat melakukan percabangan (pemilihan) dengan menggunakan pernyataan Switch-Case.</div>\r\n<div>Sama seperti pernyataan If-Else, pernyataan Switch-Case juga merupakan pernyataan yang digunakan untuk menjalankan salah satu pernyataan dari beberapa kemungkinan pernyataan, Namun penggunaan pernyataan Switch-Case lebih sempit, karena perintah ini haya digunakan untuk memeriksa data yang bertipe integer atau karakter.</div>\r\n<p><strong>Struktur Switch-Case</strong><br />Bentuk umum penggunaan pernyataan Switch-Case adalah sebagai berikut:</p>\r\n<blockquote class=\"tr_bq\">\r\n<p>&nbsp;switch(ekspresi){<br />case nilai_konstanta1:<br />Statemen_atau_Perintah;<br />break;<br />case nilai_konstanta2:<br />Statemen_atau_Perintah;<br />break;<br />case nilai_konstanta3:<br />Statemen_atau_Perintah;<br />break;<br />.....<br />case nilai_konstantaN:<br />Statemen_atau_Perintah;<br />break;<br />default:<br />Statemen_alternatif;<br />}</p>\r\n</blockquote>\r\n</div>\r\n<p>Sumber : http://www.materidosen.com/2017/05/5-macam-operasi-percabangan-c-lengkap.html</p>\r\n</div>\r\n</div>', 2, NULL, 1, 'Percabangan C++', '2020-06-17 18:04:31', 1);
INSERT INTO `learning` VALUES (3, 1, 999, '<p>Apa yang akan kamu lakukan saat disuruh mencetak kalimat berulang-ulang?</p>\r\n<p>Misalnya:</p>\r\n<p>Tolong tampilkan kalimat&nbsp;<code>\"Tutorial Pemrograman C++!\"</code>&nbsp;sebanyak 10x ke layar!</p>\r\n<p>Mungkin kamu akan menggunakan&nbsp;<code>cout</code>&nbsp;sebanyak 10 kali seperti ini:</p>\r\n<div class=\"highlight\">\r\n<pre><code class=\"language-cpp\" data-lang=\"cpp\">#include &lt;iostream&gt;\r\nusing namespace std;\r\n\r\nint main(){\r\n    cout &lt;&lt; \"Tutorial Pemrograman C++!\" &lt;&lt; endl;\r\n    cout &lt;&lt; \"Tutorial Pemrograman C++!\" &lt;&lt; endl;\r\n    cout &lt;&lt; \"Tutorial Pemrograman C++!\" &lt;&lt; endl;\r\n    cout &lt;&lt; \"Tutorial Pemrograman C++!\" &lt;&lt; endl;\r\n    cout &lt;&lt; \"Tutorial Pemrograman C++!\" &lt;&lt; endl;\r\n    cout &lt;&lt; \"Tutorial Pemrograman C++!\" &lt;&lt; endl;\r\n    cout &lt;&lt; \"Tutorial Pemrograman C++!\" &lt;&lt; endl;\r\n    cout &lt;&lt; \"Tutorial Pemrograman C++!\" &lt;&lt; endl;\r\n    cout &lt;&lt; \"Tutorial Pemrograman C++!\" &lt;&lt; endl;\r\n    cout &lt;&lt; \"Tutorial Pemrograman C++!\" &lt;&lt; endl;\r\n    return 0;\r\n}\r\n</code></pre>\r\n</div>\r\n<p>Hasilnya:</p>\r\n<p><img class=\"blur-up lazyload mb-3 img-fluid lazyloaded\" src=\"https://www.petanikode.com/img/cpp/loop/manual-loop.png\" alt=\"Perulangan manual dengan printf\" data-sizes=\"auto\" data-src=\"/img/cpp/loop/manual-loop.png\" /></p>\r\n<p>Apakah boleh seperti ini?</p>\r\n<p>Ya, boleh-boleh saja.</p>\r\n<p>Tapi&hellip;</p>\r\n<p>Bagaimana kalau nanti mau menampilkan sebanyak&nbsp;<code>1000</code>&nbsp;kali.</p>\r\n<p>Pasti capek donk ngetiknya.</p>\r\n<p>Karena itu, kita harus menggunakan&nbsp;<strong>perulangan</strong>.</p>\r\n<div class=\"my-5 adsense blur-up lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded lazyloaded\">&nbsp;</div>\r\n<p>Perulangan akan membantu kita mengeksekusi kode yang berulang-ulang, berapapun yang kita mau.</p>\r\n<p>Ada empat macam bentuk perulangan pada C.</p>\r\n<p>Secara umum, dibagi menjadi dua kelompok.</p>\r\n<p>Yaitu:&nbsp;<em>counted loop</em>&nbsp;dan&nbsp;<em>uncounted loop</em>.</p>\r\n<p>Perbedaanya:</p>\r\n<ul>\r\n<li><strong>Counted Loop</strong>&nbsp;merupakan perulangan yang jelas dan sudah tentu banyak kali perulangannya.</li>\r\n<li>Sedangkan&nbsp;<strong>Uncounted Loop</strong>, merupakan perulangan yang tidak jelas berapa kali ia harus mengulang.</li>\r\n</ul>\r\n<p>&nbsp;</p>\r\n<p>Perulangan yang termasuk dalam&nbsp;<em>Counted Loop</em>:</p>\r\n<ol>\r\n<li>Perulangan For</li>\r\n</ol>\r\n<p>Perulangan yang termasuk dalam&nbsp;<em>Uncounted Loop</em>:</p>\r\n<ol>\r\n<li>Perulangan While</li>\r\n<li>Perulangan Do/While</li>\r\n</ol>\r\n<p>Mari kita bahas satu per satu&hellip;</p>\r\n<h2 id=\"1-blok-perulangan-for\">1. Blok Perulangan For</h2>\r\n<p>Perulangan&nbsp;<code>for</code>&nbsp;merupakan perulangan yang termasuk dalam&nbsp;<em>couted loop</em>, karena sudah jelas berapa kali ia akan mengulang.</p>\r\n<figure class=\"figure mb-3 img-thumbnail rounded-0\"><img class=\"lazyload blur-up figure-img img-fluid mb-0 lazyloaded\" src=\"https://www.petanikode.com/img/c/loop/flowchart-for.webp\" alt=\"Flowchart perulangan for\" data-src=\"/img/c/loop/flowchart-for.webp\" />\r\n<figcaption class=\"figure-caption text-center my-2\">Flowchart perulangan for</figcaption>\r\n</figure>\r\n<p>Bentuknya kodenya seperti ini:</p>\r\n<div class=\"highlight\">\r\n<pre><code class=\"language-c\" data-lang=\"c\">for(int i = 0; i &lt; 10; i++){\r\n    printf(\"Perulangan ke-%i\\n\", i);\r\n}\r\n</code></pre>\r\n</div>\r\n<p>Yang perlu diperhatikan adalah kondisi yang ada di dalam kurung setelah kata&nbsp;<code>for</code>.</p>\r\n<p>Kondisi ini akan menentukan:</p>\r\n<ul>\r\n<li>Hitungan akan dimulai dari&nbsp;<code>0</code>&nbsp;(<code>i = 0</code>);</li>\r\n<li>Hitungannya sampai berapa? Sampai&nbsp;<code>i &lt; 10</code>;</li>\r\n<li>Lalu di setiap perulangan&nbsp;<code>i</code>&nbsp;akan bertambah&nbsp;<code>+1</code>&nbsp;(<code>i++</code>).</li>\r\n</ul>\r\n<p>Variabel&nbsp;<code>i</code>&nbsp;pada perulangan&nbsp;<code>for</code>&nbsp;berfungsi untuk menyimpan nilai hitungan.</p>\r\n<p>Jadi setiap perulangan dilakukan nilai&nbsp;<code>i</code>&nbsp;akan selalu bertambah satu. Karena kita menentukannya di bagian&nbsp;<code>i++</code>.</p>\r\n<p>Contoh program loop dengan for:</p>\r\n<div class=\"highlight\">\r\n<pre><code class=\"language-cpp\" data-lang=\"cpp\">#include &lt;iostream&gt;\r\nusing namespace std;\r\n\r\nint main(){\r\n    for(int i = 0; i &lt; 10; i++){\r\n        printf(\"Perulangan ke-%i\\n\", i);\r\n    }\r\n\r\n    return 0;\r\n}\r\n</code></pre>\r\n</div>\r\n<p>Ini hasil outputnya:</p>\r\n<p><img class=\"blur-up lazyload mb-3 img-fluid lazyloaded\" src=\"https://www.petanikode.com/img/c/loop/for-loop.webp\" alt=\"Perulangan For pada bahasa C\" data-sizes=\"auto\" data-src=\"/img/c/loop/for-loop.webp\" /></p>\r\n<p>Apakah nama variabelnya harus selalu&nbsp;<code>i</code>?</p>\r\n<p>Tidak.</p>\r\n<p>Kita juga bisa menggunakan nama lain.</p>\r\n<p>Misalnya:</p>\r\n<div class=\"highlight\">\r\n<pre><code class=\"language-cpp\" data-lang=\"cpp\">#include &lt;iostream&gt;\r\nusing namespace std;\r\n\r\nint main(){\r\n    for(int counter = 0; counter &lt; 10; counter += 2){\r\n        printf(\"Perulangan ke-%i\\n\", counter);\r\n    }\r\n\r\n    return 0;\r\n}\r\n</code></pre>\r\n</div>\r\n<p>Pada contoh tersebut, kita melakukan perulangan dimulai dari nol&nbsp;<code>0</code>. Lalu di setiap perulangan nilai variabel&nbsp;<code>couter</code>&nbsp;akan ditambah 2 (<code>counter+=2</code>).</p>\r\n<p>Hasilnya:</p>\r\n<p><img class=\"blur-up lazyload mb-3 img-fluid lazyloaded\" src=\"https://www.petanikode.com/img/cpp/loop/for-2.png\" alt=\"Perulangan For pada bahasa C++\" data-sizes=\"auto\" data-src=\"/img/cpp/loop/for-2.png\" /></p>\r\n<p>Bagaimana kalau&nbsp;<em>counter</em>&nbsp;perulangannya dimulai dari akanga yang lebih besar sampai yang ke paling kecil?</p>\r\n<p>Ini biasanya kita buat saat ingin menghitung mundur&hellip;</p>\r\n<p>Caranya gampang.</p>\r\n<p>Kita tinggal isi nilai counter dengan nilai terbesarnya.</p>\r\n<p>Misalnya kita akan mulai hitungan dari&nbsp;<code>10</code>&nbsp;sampai ke&nbsp;<code>0</code>.</p>\r\n<p>Maka nilai&nbsp;<code>counter</code>, kita isi awalnya dengan&nbsp;<code>10</code>.</p>\r\n<p>Lalu di kondisi perbandingannya, kita berikan&nbsp;<code>counter &gt; 0</code>. Artinya perulangan akan dilakukan selama nilai counter lebih besar dari&nbsp;<code>0</code>.</p>\r\n<p>Lalu kita kurangi (<code>-1</code>) nilai counter di setiap perulangan (<code>counter--</code>).</p>\r\n<div class=\"highlight\">\r\n<pre><code class=\"language-cpp\" data-lang=\"cpp\">for(int counter = 10; counter &gt; 0; counter--){\r\n    printf(\"Perulangan ke-%i\\n\", counter);\r\n}\r\n</code></pre>\r\n</div>\r\n<p>Hasilnya:</p>\r\n<p><img class=\"blur-up lazyload mb-3 img-fluid lazyloaded\" src=\"https://www.petanikode.com/img/c/loop/for-downto.webp\" alt=\"Perulangan for dengan hitung mundur\" data-sizes=\"auto\" data-src=\"/img/c/loop/for-downto.webp\" /></p>\r\n<p>Mengapa tidak sampai nol (<code>0</code>)?</p>\r\n<p>Karena kondisi yang kita berikan&nbsp;<code>counter &gt; 0</code>. Apabila&nbsp;<code>counter</code>&nbsp;bernilai&nbsp;<code>0</code>, maka kondisi ini akan menjadi&nbsp;<code>false</code>.</p>\r\n<p>Kecuali kita menggunakan operator lebih besar sama dengan (<code>&gt;=</code>), maka jika&nbsp;<code>counter</code>&nbsp;bernilai&nbsp;<code>0</code>, kondisi akan menjadi&nbsp;<code>true</code>.</p>\r\n<h2 id=\"2-perulangan-while-pada-c\">2. Perulangan While pada C++</h2>\r\n<p>Perulangan&nbsp;<code>while</code>&nbsp;merupakan perulangan yang termasuk dalam perulangan&nbsp;<em>uncounted loop</em>.</p>\r\n<p>Perulangan&nbsp;<code>while</code>&nbsp;juga dapat menjadi perulangan yang&nbsp;<em>counted loop</em>&nbsp;dengan memberikan&nbsp;<em>counter</em>&nbsp;di dalamnya.</p>\r\n<p>Bentuk flow chart-nya sama seperti&nbsp;<em>flow chart for</em>.</p>\r\n<figure class=\"figure mb-3 img-thumbnail rounded-0\"><img class=\"lazyload blur-up figure-img img-fluid mb-0 lazyloaded\" src=\"https://www.petanikode.com/img/c/loop/flowchart-for.webp\" alt=\"Flowchart perulangan while\" data-src=\"/img/c/loop/flowchart-for.webp\" />\r\n<figcaption class=\"figure-caption text-center my-2\">Flowchart perulangan while</figcaption>\r\n</figure>\r\n<p>Untuk memahami perulangan ini&hellip;</p>\r\n<p>&hellip;mari kita coba lihat contohnya:</p>\r\n<div class=\"highlight\">\r\n<pre><code class=\"language-cpp\" data-lang=\"cpp\">#include &lt;iostream&gt;\r\nusing namespace std;\r\n\r\nint main(){\r\n    char ulangi = \'y\';\r\n    int counter = 0;\r\n\r\n    // perulangan while\r\n    while(ulangi == \'y\'){\r\n        printf(\"Apakah kamu mau mengulang?\\n\");\r\n        printf(\"Jawab (y/t): \");\r\n        cin &gt;&gt; ulangi;\r\n\r\n        // increment counter\r\n        counter++;\r\n    }\r\n\r\n    printf(\"\\n\\n----------\\n\");\r\n    printf(\"Perulangan Selesai!\\n\");\r\n    printf(\"Kamu mengulang sebanyak %i kali.\\n\", counter);\r\n\r\n    return 0;\r\n}\r\n</code></pre>\r\n</div>\r\n<p>Hasilnya:</p>\r\n<p><img class=\"blur-up lazyload mb-3 img-fluid lazyloaded\" src=\"https://www.petanikode.com/img/c/loop/while.webp\" alt=\"Perulangan while pada C++\" data-sizes=\"auto\" data-src=\"/img/c/loop/while.webp\" /></p>\r\n<p>Coba perhatikan blok kode&nbsp;<code>while</code>:</p>\r\n<div class=\"highlight\">\r\n<pre><code class=\"language-cpp\" data-lang=\"cpp\">// perulangan while\r\nwhile(ulangi == \'y\'){\r\n    printf(\"Apakah kamu mau mengulang?\\n\");\r\n    printf(\"Jawab (y/t): \");\r\n    cin &gt;&gt; ulangi;\r\n    // increment counter\r\n    counter++;\r\n}\r\n</code></pre>\r\n</div>\r\n<p>Di sana&hellip; Perulangan akan terjadi selama variabel&nbsp;<code>ulangi</code>&nbsp;brenilai&nbsp;<code>y</code>.</p>\r\n<p>Lalu kita menggunakan fungsi&nbsp;<code>scanf()</code>&nbsp;untuk mengambil input.</p>\r\n<p>Selama kita menjawab&nbsp;<strong>y</strong>&nbsp;pada input, maka perulangan akan terus dilakukan.</p>\r\n<p>Tapi kalau kita jawab yang lain, maka perulangan akan dihentikan.</p>\r\n<p>Karena kondisi perulangannya tidak terpenuhi.</p>\r\n<h2 id=\"3-perulangan-dowhile-pada-c\">3. Perulangan Do/While pada C++</h2>\r\n<p>Perulangan&nbsp;<code>do/while</code>&nbsp;sama seperti perulangan&nbsp;<code>while</code>.</p>\r\n<p>Perbedaanya:</p>\r\n<p>Perulangan&nbsp;<code>do/while</code>&nbsp;akan melakukan perulangan sebanyak&nbsp;<code>1</code>&nbsp;kali terlebih dahulu, lalu mengecek kondisi yang ada di dalam kurung&nbsp;<code>while</code>.</p>\r\n<p>Flow chart perulangan do/while:</p>\r\n<p><img class=\"blur-up lazyload mb-3 img-fluid lazyloaded\" src=\"https://www.petanikode.com/img/c/loop/flowchart-dowhile.webp\" alt=\"Flowchart perulangan do/while\" data-sizes=\"auto\" data-src=\"/img/c/loop/flowchart-dowhile.webp\" /></p>\r\n<p>Bentuk kodenya seperti ini:</p>\r\n<div class=\"highlight\">\r\n<pre><code class=\"language-javascript\" data-lang=\"javascript\">do {\r\n    // blok kode yang akan diulang\r\n} while (&lt;kondisi&gt;);\r\n</code></pre>\r\n</div>\r\n<p>Jadi perbedaanya:</p>\r\n<blockquote>\r\n<p>Perulangan&nbsp;<code>do/while</code>&nbsp;akan mengecek kondisi di belakang (sesudah mengulang), sedangkan&nbsp;<code>while</code>&nbsp;akan mencek kondisi di depan atau awal (sbelum mengulang).</p>\r\n</blockquote>\r\n<p>Mari kita coba lihat contohnya:</p>\r\n<div class=\"highlight\">\r\n<pre><code class=\"language-cpp\" data-lang=\"cpp\">#include &lt;iostream&gt;\r\nusing namespace std;\r\n\r\nint main(){\r\n    char ulangi = \'y\';\r\n    int counter = 0;\r\n\r\n    do {\r\n        printf(\"Apakah kamu mau mengulang?\\n\");\r\n        printf(\"Jawab (y/t): \");\r\n        cin &gt;&gt; ulangi;\r\n\r\n        // increment counter\r\n        counter++;\r\n    } while(ulangi == \'y\');\r\n\r\n    printf(\"\\n\\n----------\\n\");\r\n    printf(\"Perulangan Selesai!\\n\");\r\n    printf(\"Kamu mengulang sebanyak %i kali.\\n\", counter);\r\n\r\n    return 0;\r\n}\r\n</code></pre>\r\n</div>\r\n<p>Contoh tersebut sama seperti contoh pada perulangan&nbsp;<code>while</code>.</p>\r\n<p>Saat perulangan pertama, cobalah untuk membatalkan perulangannya dengan menjawab&nbsp;<code>t</code>.</p>\r\n<p>Maka hasilnya:</p>\r\n<p><img class=\"blur-up lazyload mb-3 img-fluid lazyloaded\" src=\"https://www.petanikode.com/img/c/loop/do-while.webp\" alt=\"Perulangan Do While\" data-sizes=\"auto\" data-src=\"/img/c/loop/do-while.webp\" /></p>\r\n<h2 id=\"4-perulangan-bersarang-nested-loop\">4. Perulangan Bersarang&nbsp;<em>(Nested Loop)</em></h2>\r\n<p>Di dalam blok perulangan, kita juga dapat membuat perulangan.</p>\r\n<p>Ini disebut dengan&nbsp;<em>nested loop</em>&nbsp;atau perulangan bersarang atau perulangan di dalam perualangan.</p>\r\n<p>Mari kita coba lihat contohnya:</p>\r\n<div class=\"highlight\">\r\n<pre><code class=\"language-cpp\" data-lang=\"cpp\">#include &lt;iostream&gt;\r\nusing namespace std;\r\n\r\nint main(){\r\n    for(int i = 0; i &lt; 10; i++){\r\n        for(int j = 0; j &lt; 10; j++){\r\n            printf(\"Perulangan ke (%d, %d)\\n\", i, j);\r\n        }\r\n    }\r\n\r\n    return 0;\r\n}\r\n</code></pre>\r\n</div>\r\n<p>Hasilnya:</p>\r\n<p><img class=\"blur-up lazyload mb-3 img-fluid lazyloaded\" src=\"https://www.petanikode.com/img/c/loop/nested-loop.webp\" alt=\"Perulangan bersarang pada C++\" data-sizes=\"auto\" data-src=\"/img/c/loop/nested-loop.webp\" /></p>\r\n<p>Pada perulangan tersebut, kita menggunakan dua perulangan&nbsp;<code>for</code>.</p>\r\n<p>Perulangan pertama menggunakan variabel&nbsp;<code>i</code>&nbsp;sebagai&nbsp;<em>counter</em>, sedangkan perultangan kedua menggunakan variabel&nbsp;<code>j</code>&nbsp;sebagai&nbsp;<em>counter</em>.</p>\r\n<h2 id=\"apa-selanjutnya\">Apa Selanjutnya?</h2>\r\n<p>Intinya perulangan digunakan untuk melakukan pengulangan. Ini merupakan hal dasar yang harus dipahami setiap programmer.</p>\r\n<p>Karena ke depan, kita akan banyak menggunakannya dalam membuat program dengan C++.</p>\r\n<p>Yang perlu diingat, perulangan itu ada dua macam:&nbsp;<em>Counted loop</em>&nbsp;dan&nbsp;<em>uncounted loop</em>.</p>\r\n<p>Selamat belajar&hellip;</p>', 2, 'ASD123', 1, 'Perulangan C++', '2020-06-17 18:04:31', 1);
INSERT INTO `learning` VALUES (4, 1, 999, '<p>Halo sahabat programmer, kali ini kita saya kembali membagikan contoh program&nbsp;<em><strong>bubble sort&nbsp;</strong></em>dengan&nbsp;<a href=\"https://kelasprogrammer.com/category/c/\">C++</a>. Mungkin ketika kalian belajar algoritma atau struktur data teknik&nbsp;<strong>pengurutan bubble sort</strong>&nbsp;ini akan kalian pelajari. Selain&nbsp;<strong><em>bubble sort</em></strong>&nbsp;masih terdapat banyak jenis pengurutan yang lain seperti&nbsp;<em>insertion sort, selection sort,merge sort</em>&nbsp;dan lainnya. Jika diperlukan akan saya bahas pada postingan-postingan selanjutnya.</p>\r\n<h2>Pengertian Pengurutan (Sorting)</h2>\r\n<p>Pengurutan atau&nbsp;<em>sorting&nbsp;</em>adalah suatu proses penyusunan data yang akan disusun menurut pola/aturan tertentu. Terdapat 2 bentuk pengurutan yang dilakukan yaitu:</p>\r\n<ul>\r\n<li>Pengurutan naik&nbsp;<em>(ascending)</em>&nbsp;mengurutkan data dari nilai yang terkecil atau yang terendah ke nilai yang lebih besar/tinggi.</li>\r\n<li>Pengurutan turun&nbsp;<em>(descending)</em>&nbsp;adalah kebalikan dari pengurutan ascending dimana data akan diurutkan dari yang terbesar ke yang terkecil.</li>\r\n</ul>\r\n<p>&nbsp;</p>\r\n<h2>Algoritma Bubble Sort</h2>\r\n<p><strong>Metode Bubble sort</strong>&nbsp;adalah salah satu jenis algoritma pengurutan yang paling sederhana dan mudah baik dalam konsep dan penerapannya didalam program. Bubble sort terinspirasi dari namanya &lsquo;gelembung&rsquo; dimana berat jenis gelembung&nbsp;<strong>lebih kecil</strong>&nbsp;dari berat air sehingga akan mengapung&nbsp;<strong>diatas</strong>&nbsp;permukaan., lewat ilustrasi inilah metode bubble sort bekerja.</p>\r\n<h2>Cara Kerja Algoritma Bubble Sort</h2>\r\n<p><strong>Algoritma bubble sort</strong>&nbsp;bekerja dengan cara membandingkan data dari elemen data yang pertama dibandingkan tepat pada elemen berikutnya hingga elemen ke-n (n adalah banyaknya jumlah data). Bila saat dibandingkan terdapat nilai yang lebih kecil dari elemen pertama maka posisinya akan ditukar. Nilai tersebut akan terus dibandingkan hingga sampai pada elemen ke-n, ini menjadi&nbsp;<strong>iterasi/tahap pertama</strong>&nbsp;pada proses pengurutannya. Hasil pengurutan pada tahap pertama akan menjadi acuan pada iterasi tahap berikutnya dimana nilai pada elemen pertama tidak akan dibandingkan lagi dengan elemen yang lain. Pada tahap/iterasi kedua ini nilai pada elemen ke-2 akan dibandingkan dengan cara yang sama pada iterasi yang pertama. Iterasi akan terus dilakukan hingga nilai pada setiap elemen terurut sesuai aturan (dalam hal ini saya menggunakan aturan&nbsp;<em>ascending</em>).</p>\r\n<h3>Contoh:</h3>\r\n<pre class=\"wp-block-code prettyprinted\"><code class=\" prettyprinted\"><span class=\"pln\">data</span><span class=\"pun\">[</span><span class=\"lit\">1</span><span class=\"pun\">]=</span><span class=\"lit\">3</span><span class=\"pun\">;</span><span class=\"pln\">\r\ndata</span><span class=\"pun\">[</span><span class=\"lit\">2</span><span class=\"pun\">]=</span><span class=\"lit\">7</span><span class=\"pun\">;</span><span class=\"pln\">\r\ndata</span><span class=\"pun\">[</span><span class=\"lit\">3</span><span class=\"pun\">]=</span><span class=\"lit\">4</span><span class=\"pun\">;</span><span class=\"pln\">\r\ndata</span><span class=\"pun\">[</span><span class=\"lit\">4</span><span class=\"pun\">]=</span><span class=\"lit\">2</span><span class=\"pun\">;</span><span class=\"pln\">\r\ndata</span><span class=\"pun\">[</span><span class=\"lit\">5</span><span class=\"pun\">]=</span><span class=\"lit\">1</span><span class=\"pun\">;</span></code></pre>\r\n<p>Perhatikan diatas kita mempunyai 5 elemen data, kita akan coba urutkan dengan teknik bubble sort secara&nbsp;<em>ascending&nbsp;</em>lewat langkah-langkah berikut:</p>\r\n<ul>\r\n<li>Data[1] akan dibandingkan dengan data[2] jika nilai dari data[1] lebih besar dari data[2] maka posisinya akan ditukar.</li>\r\n<li>data[1] selanjutnya akan terus dibandingkan dengan data[3],data[4] dan data[5]. Apabila nilai dari data[1] lebih besar maka posisinya akan terus ditukar.</li>\r\n<li>Ketika data[1] telah selesai membandingkan dengan semua data yang ada, selanjutnya data[2] akan dibandingkan lagi dengan data[3],data[4] dan data[5]. cara kerjanya sama bila nilai pada data[2] lebih besar dengan data yang dibandingkan maka posisinya akan ditukar. Pada tahap ini data[1] sudah tidak dibandingkan lagi karena sudah mempati posisi pengurutan yang tepat.</li>\r\n<li>Proses pembandingan data akan terus berjalan hingga memenuhi urutan yang diinginkan.</li>\r\n</ul>\r\n<p>Artikel lainnya :&nbsp;<a title=\"Contoh program C++ Fungsi dan Prosedur\" href=\"https://kelasprogrammer.com/contoh-program-cpp-fungsi-dan-prosedur/\">Contoh program C++ Fungsi dan Prosedur</a></p>\r\n<h2>Implementasi Kedalam Program c++</h2>\r\n<pre class=\"wp-block-code prettyprinted\"><code class=\" prettyprinted\"><span class=\"com\">#include</span> <span class=\"str\">&lt;iostream&gt;</span>\r\n<span class=\"com\">#include</span> <span class=\"str\">&lt;conio.h&gt;</span>\r\n<span class=\"kwd\">using</span> <span class=\"kwd\">namespace</span><span class=\"pln\"> std</span><span class=\"pun\">;</span>\r\n    <span class=\"kwd\">int</span><span class=\"pln\"> data</span><span class=\"pun\">[</span><span class=\"lit\">10</span><span class=\"pun\">],</span><span class=\"pln\"> data2</span><span class=\"pun\">[</span><span class=\"lit\">10</span><span class=\"pun\">];</span>\r\n    <span class=\"kwd\">int</span><span class=\"pln\"> n</span><span class=\"pun\">;</span>\r\n    \r\n<span class=\"kwd\">int</span><span class=\"pln\"> tukar </span><span class=\"pun\">(</span><span class=\"kwd\">int</span><span class=\"pln\"> a</span><span class=\"pun\">,</span><span class=\"kwd\">int</span><span class=\"pln\"> b</span><span class=\"pun\">){</span>\r\n    <span class=\"kwd\">int</span><span class=\"pln\"> t</span><span class=\"pun\">;</span><span class=\"pln\">\r\n    t</span><span class=\"pun\">=</span><span class=\"pln\">data</span><span class=\"pun\">[</span><span class=\"pln\">b</span><span class=\"pun\">];</span><span class=\"pln\">\r\n    data</span><span class=\"pun\">[</span><span class=\"pln\">b</span><span class=\"pun\">]=</span><span class=\"pln\">data</span><span class=\"pun\">[</span><span class=\"pln\">a</span><span class=\"pun\">];</span><span class=\"pln\">\r\n    data</span><span class=\"pun\">[</span><span class=\"pln\">a</span><span class=\"pun\">]=</span><span class=\"pln\">t</span><span class=\"pun\">;</span>\r\n<span class=\"pun\">}</span>\r\n\r\n<span class=\"kwd\">int</span><span class=\"pln\"> input</span><span class=\"pun\">(){</span><span class=\"pln\">\r\n    cout</span><span class=\"pun\">&lt;&lt;</span><span class=\"str\">\"Masukan Jumlah Data = \"</span><span class=\"pun\">;</span><span class=\"pln\">\r\ncin</span><span class=\"pun\">&gt;&gt;</span><span class=\"pln\">n</span><span class=\"pun\">;</span><span class=\"pln\">\r\n\r\ncout</span><span class=\"pun\">&lt;&lt;</span><span class=\"pln\">endl</span><span class=\"pun\">;</span>\r\n    \r\n    <span class=\"kwd\">for</span> <span class=\"pun\">(</span><span class=\"kwd\">int</span><span class=\"pln\"> i</span><span class=\"pun\">=</span><span class=\"lit\">0</span><span class=\"pun\">;</span><span class=\"pln\">i</span><span class=\"pun\">&lt;</span><span class=\"pln\">n</span><span class=\"pun\">;</span><span class=\"pln\">i</span><span class=\"pun\">++){</span><span class=\"pln\">\r\n    	cout</span><span class=\"pun\">&lt;&lt;</span><span class=\"str\">\"Masukan Data Ke-\"</span><span class=\"pun\">&lt;&lt;</span><span class=\"pln\">i</span><span class=\"pun\">+</span><span class=\"lit\">1</span><span class=\"pun\">&lt;&lt;</span><span class=\"str\">\" = \"</span><span class=\"pun\">;</span><span class=\"pln\">\r\n    	cin</span><span class=\"pun\">&gt;&gt;</span><span class=\"pln\">data</span><span class=\"pun\">[</span><span class=\"pln\">i</span><span class=\"pun\">];</span><span class=\"pln\">\r\n    	\r\n    	data2</span><span class=\"pun\">[</span><span class=\"pln\">i</span><span class=\"pun\">]=</span><span class=\"pln\">data</span><span class=\"pun\">[</span><span class=\"pln\">i</span><span class=\"pun\">];</span>\r\n	<span class=\"pun\">}</span><span class=\"pln\">\r\n	cout</span><span class=\"pun\">&lt;&lt;</span><span class=\"pln\">endl</span><span class=\"pun\">;</span>	\r\n<span class=\"pun\">}</span>\r\n\r\n<span class=\"kwd\">int</span><span class=\"pln\"> tampil</span><span class=\"pun\">(){</span>\r\n	<span class=\"kwd\">for</span> <span class=\"pun\">(</span><span class=\"kwd\">int</span><span class=\"pln\"> i</span><span class=\"pun\">=</span><span class=\"lit\">0</span><span class=\"pun\">;</span><span class=\"pln\">i</span><span class=\"pun\">&lt;</span><span class=\"pln\">n</span><span class=\"pun\">;</span><span class=\"pln\">i</span><span class=\"pun\">++){</span><span class=\"pln\">\r\n	     cout</span><span class=\"pun\">&lt;&lt;</span><span class=\"str\">\"[\"</span><span class=\"pun\">&lt;&lt;</span><span class=\"pln\">data</span><span class=\"pun\">[</span><span class=\"pln\">i</span><span class=\"pun\">]&lt;&lt;</span><span class=\"str\">\"] \"</span><span class=\"pun\">;</span>\r\n	<span class=\"pun\">}</span><span class=\"pln\">\r\n	cout</span><span class=\"pun\">&lt;&lt;</span><span class=\"pln\">endl</span><span class=\"pun\">;</span>\r\n<span class=\"pun\">}</span>\r\n\r\n<span class=\"kwd\">int</span><span class=\"pln\"> bubble_sort</span><span class=\"pun\">(){</span>\r\n	<span class=\"kwd\">for</span> <span class=\"pun\">(</span><span class=\"kwd\">int</span><span class=\"pln\"> i</span><span class=\"pun\">=</span><span class=\"lit\">1</span><span class=\"pun\">;</span><span class=\"pln\"> i</span><span class=\"pun\">&lt;</span><span class=\"pln\">n</span><span class=\"pun\">;</span><span class=\"pln\">i</span><span class=\"pun\">++){</span>\r\n		<span class=\"kwd\">for</span> <span class=\"pun\">(</span><span class=\"kwd\">int</span><span class=\"pln\"> j</span><span class=\"pun\">=</span><span class=\"pln\">n</span><span class=\"pun\">-</span><span class=\"lit\">1</span><span class=\"pun\">;</span><span class=\"pln\"> j</span><span class=\"pun\">&gt;=</span><span class=\"pln\">i</span><span class=\"pun\">;</span><span class=\"pln\">j</span><span class=\"pun\">--){</span>\r\n			<span class=\"kwd\">if</span> <span class=\"pun\">(</span><span class=\"pln\">data</span><span class=\"pun\">[</span><span class=\"pln\">j</span><span class=\"pun\">]&lt;</span><span class=\"pln\">data</span><span class=\"pun\">[</span><span class=\"pln\">j</span><span class=\"pun\">-</span><span class=\"lit\">1</span><span class=\"pun\">]){</span><span class=\"pln\">\r\n				tukar</span><span class=\"pun\">(</span><span class=\"pln\">j</span><span class=\"pun\">,</span><span class=\"pln\">j</span><span class=\"pun\">-</span><span class=\"lit\">1</span><span class=\"pun\">);</span>\r\n			<span class=\"pun\">}</span>\r\n		<span class=\"pun\">}</span><span class=\"pln\">\r\n		tampil</span><span class=\"pun\">();</span>\r\n	<span class=\"pun\">}</span><span class=\"pln\">\r\n	cout</span><span class=\"pun\">&lt;&lt;</span><span class=\"pln\">endl</span><span class=\"pun\">;</span>\r\n<span class=\"pun\">}</span>\r\n\r\n\r\n<span class=\"kwd\">int</span><span class=\"pln\"> main</span><span class=\"pun\">()</span>\r\n  <span class=\"pun\">{</span><span class=\"pln\">\r\n  	cout</span><span class=\"pun\">&lt;&lt;</span><span class=\"str\">\"ALGORITMA BUBBLE SORT\"</span><span class=\"pun\">&lt;&lt;</span><span class=\"pln\">endl</span><span class=\"pun\">;</span><span class=\"pln\">\r\n  	cout</span><span class=\"pun\">&lt;&lt;</span><span class=\"str\">\"----------------------\"</span><span class=\"pun\">&lt;&lt;</span><span class=\"pln\">endl</span><span class=\"pun\">;</span><span class=\"pln\">\r\n	input</span><span class=\"pun\">();</span><span class=\"pln\">\r\n	cout</span><span class=\"pun\">&lt;&lt;</span><span class=\"str\">\"Proses Bubble Sort\"</span><span class=\"pun\">&lt;&lt;</span><span class=\"pln\">endl</span><span class=\"pun\">;</span><span class=\"pln\">\r\n	tampil</span><span class=\"pun\">();</span><span class=\"pln\">\r\n	bubble_sort</span><span class=\"pun\">();</span><span class=\"pln\">\r\n  getch</span><span class=\"pun\">();</span>\r\n  <span class=\"pun\">}</span></code></pre>\r\n<h3>Hasil Output</h3>\r\n<div class=\"wp-block-image\">\r\n<figure class=\"aligncenter is-resized\"><img class=\"wp-image-4027\" src=\"https://kelasprogrammer.com/wp-content/uploads/2020/01/Contoh-Program-C-Bubble-Sort.png\" sizes=\"(max-width: 352px) 100vw, 352px\" srcset=\"https://kelasprogrammer.com/wp-content/uploads/2020/01/Contoh-Program-C-Bubble-Sort.png 469w, https://kelasprogrammer.com/wp-content/uploads/2020/01/Contoh-Program-C-Bubble-Sort-290x300.png 290w\" alt=\"contoh program c++ algoritma bubble sort\" width=\"352\" height=\"365\" /></figure>\r\n</div>\r\n<p>Perhatikan dari hasil output diatas pada tahap pertama data[1] dibandingkan dengan data lainnya, apabila data[1] lebih besar maka posisinya akan ditukar, jika dilihat data[1] lebih besar dari data[4] dan data[5] karena data[5] memili nilai yang paling rendah dibandingkan dengan data[4] maka posisi yang ditukar adalah dengan data[5]. Pada tahap kedua data[2] dibandingkan lagi dengan data-data lainnya didapati bahwa data[2] lebih besar dengan data[5] maka posisinya ditukar. Pada tahap ketiga data[3] dibandingkan dengan data[4] dan data[5], kalo dilihat data[3] memang tidak lebih besar dari data[4] dan data[5] sehingga proses berlanjut dengan membandingkan data[4] dan data[5] data[4] ternyata lebih besar dari data[5] sehingga posisinya ditukar. akhir kita menemukan hasil akhir dari proses pengurutan data dengan bubble sort dari deretan data 3-7-4-2-1 menjadi1-2-3-4-7.</p>', 2, NULL, 1, 'Sorting C++', '2020-06-22 19:00:11', NULL);
INSERT INTO `learning` VALUES (5, 1, 999, '<p>Searching adalah metode pencarian informasi dalam suatu aplikasi dengan suatu kunci (key). Pencarian diperlukan untuk mencari informasi khusus dari table pada saat lokasi yang pasti dari informasi tersebut sebelumnya tidak diketahui.<br /><a name=\"more\"></a><br />Pencarian selalu dinyatakan dengan referensi pada adanya sekelompok data yang tersimpan secara terorganisasi, kelompok data tersebut kita sebut table.<br />Pada metode searhcing (pencarian) ada 2 teknik yang digunakan yaitu :<br />Pencarian sekuensial (Sequential search) dan pencarian biner (Binary search).<br /><br /><strong>1. Pencarain sekuensial (sequential search)</strong><br />Pencarian sekuensial (sequensial search) atau sering disebut pencarian linier menggunakan prinsip sebagai berikut : data yang ada dibandingkan satu persatu secara berurutan dengan yang dicari.<br />Pada dasarnya, pencarian ini hanya melakukan pegulangan dari 1 sampai dengan jumlah data. Pada setiap perulangan, dibandingkan data ke-i dengan yang dicari. Apabila sama, berarti data telah ditemukan. Sebalikanya apabila sampai akhir pengulangan, tidak ada yang sama berarti data tidak ada.<br /><br />Algoritma Linear Searching</p>\r\n<ol>\r\n<li>Input x (data yang dicari)</li>\r\n<li>Bandingkan x dengan data ke-i sampai n</li>\r\n<li>Jika ada data yang sama dengan x maka cetak pesan \"ada\"</li>\r\n<li>Jika tidak ada data yang sama dengan x cetak pesan \"tidak ada\"</li>\r\n</ol>\r\n<div>&nbsp;</div>\r\n<div>&nbsp;</div>\r\n<div><strong>2. Pencarian Bagi Dua (Binary Search)</strong></div>\r\n<div>Salah satu keuntungan data yang terurut adalah memudah pencarian, yang dalam hal ini adalah pencarian bagi dua. Sebenarnya dalam kehidupan sehari-hari kita sering menerapkan algoritma ini. Untuk mencari kata tertentu dalam kamus (misalnya kamus bahasa inggris), kita tidak membuka kamus tersebut dari halaman awal sampai halaman akhir satu persatu, namaun kita mencari dengan cara membelah atau membagi halaman-halaman buku tersebut. Begitu seterusnya sampai kita menemukan kata yang dicari</div>\r\n<div><strong>? Langkah 1:</strong></div>\r\n<div>\r\n<div class=\"su-note\">\r\n<div class=\"su-note-inner su-clearfix\">Bagi 2 elemen larik pada elemen tengah. Elemen tengah adalah elemen dengan indeks k = (Ia+Ib) div 2. (Elemen tengah , L[K], membagi larik menajdi 2 bagian L [Ia...k-1] dan bagian kanan L[k+1...Ib])</div>\r\n</div>\r\n</div>\r\n<div><strong>?&nbsp;Langkah 2:</strong></div>\r\n<div>\r\n<div class=\"su-note\">\r\n<div class=\"su-note-inner su-clearfix\">Periksa apakah L[k]=X. Jika L[k]=X, pencarian dihentikan sebab X sudah ditemukan, tetapi jika tidak, harus ditentukan apakah pencarian pada larik bagian kiri atau larik bagian kanan. Jika L[k] &lt; X maka pencarian dilakukan pada larik kiri. Sebaliknya jika L[k]&gt;X maka pencarian dilakukan pada larik bagian kanan.</div>\r\n</div>\r\n</div>\r\n<div><strong>?&nbsp;Langkah 3:</strong></div>\r\n<div>\r\n<div class=\"su-note\">\r\n<div class=\"su-note-inner su-clearfix\">Ulangi langkah 1 sampai X atau Ia&gt;Ib.</div>\r\n</div>\r\n</div>\r\n<div>&nbsp;</div>\r\n<div>&nbsp;</div>\r\n<div>\r\n<h2 id=\"toc_2\">Contoh Program</h2>\r\n</div>\r\n<div>\r\n<div class=\"su-note\">\r\n<div class=\"su-note-inner su-clearfix\"><strong>Contoh ke-1 Program pencarian sekuensial menggunakan algoritma linier searching</strong></div>\r\n</div>\r\nCobalah program pencarian sekuensial dibawah ini menggunakan algoritma linier searching. Amati dan analisis program tersebut.</div>\r\n<div><strong>Source code :</strong><br />\r\n<pre>#include &lt;iostream&gt;<br /><br />using namespace std;<br /><br />main(){<br />    int i;<br />    int cari, ketemu;<br />    int A[100];<br /><br />    cout&lt;&lt;\"PROGRAM SEARCHING Liniear\\n\";<br />    cout&lt;&lt;\"masukan 7 buah data : \\n\\n\";<br />    for(i=1; i&lt;=7; i++)<br />    {<br />        cout&lt;&lt;\"masukan data ke-\"&lt;&lt;i&lt;&lt;\" = \";<br />        cin&gt;&gt;A[i];<br />    }<br />    cout&lt;&lt;endl;<br />    cout&lt;&lt;\"Input bilangan yang cari : \";cin&gt;&gt;cari;<br />    cout&lt;&lt;endl;<br /><br />    ketemu=0;<br />    for(i=0; i&lt;=7; i++)<br />    {<br />        if (A[i]==cari)<br />        {<br />            ketemu=1;<br />            cout&lt;&lt;\"Data ditemukan pada indeks ke-\"&lt;&lt;i&lt;&lt;endl;<br />        }<br />    }<br />    if(ketemu==0)<br />    {<br />        cout&lt;&lt;\"Data tidak ditemukan\"&lt;&lt;endl;<br />    }<br />}</pre>\r\n<div>\r\n<ul class=\"button\">\r\n<li><a class=\"demo\" href=\"http://cpp.sh/6dct5\" target=\"_blank\" rel=\"noopener\">DEMO</a></li>\r\n</ul>\r\n</div>\r\n<strong>Running program :</strong></div>\r\n<div><a href=\"https://3.bp.blogspot.com/-0NYtSUz0egA/XHu7EdSc7hI/AAAAAAAAFRo/c3ZRrc6ICaIEjtYcQhOFNm1SwdhxZrxFgCK4BGAYYCw/s1600/gbr1.png\"><img title=\"Program pencarian sekuensial menggunakan algoritma linier searching\" src=\"https://3.bp.blogspot.com/-0NYtSUz0egA/XHu7EdSc7hI/AAAAAAAAFRo/c3ZRrc6ICaIEjtYcQhOFNm1SwdhxZrxFgCK4BGAYYCw/s1600/gbr1.png\" alt=\"Program pencarian sekuensial menggunakan algoritma linier searching\" border=\"0\" /></a><br /><br /></div>\r\n<div>&nbsp;</div>\r\n<div>\r\n<div class=\"su-note\">\r\n<div class=\"su-note-inner su-clearfix\"><strong>Contoh ke-2 Program pencarian biner (binary search)&nbsp;</strong></div>\r\n</div>\r\nCobalah program pencarian biner (binary search) sebagai implementasi algoritma binary search. Amati dan analisis program bersebut</div>\r\n<div>\r\n<div>\r\n<div><strong>Source code :</strong></div>\r\n<pre>#include &lt;iostream&gt;<br /><br />using namespace std;<br />main(){<br />    const int arraySize=5;<br />    int target;<br />    int array[arraySize]={1,2,3,4,5};<br />    int first, mid, last;<br /><br />    cout&lt;&lt;\"Masukan angka yang dicari: \";cin&gt;&gt;target;<br />    first=0; //Initialize first and last variables.<br />    last=2;<br /><br />    while(first&lt;=last)<br />    {<br />        mid=(first+last)/2;<br />        if(target&gt;array[mid])<br />        {<br />            first=mid+1;<br />        }else if(target&lt;array[mid])<br />        {<br />            last=mid+1;<br />        }else{<br />            first=last+1;<br />        }<br />    }<br />    if(target==array[mid])<br />    {<br />        cout&lt;&lt;\"Angka ditemukan.\"&lt;&lt;endl;<br />    }else{<br />        cout&lt;&lt;\"Angka tidak ditemukan.\"&lt;&lt;endl;<br />    }<br />}</pre>\r\n<div>\r\n<ul class=\"button\">\r\n<li><a class=\"demo\" href=\"http://cpp.sh/3ddvw\" target=\"_blank\" rel=\"noopener\">DEMO</a></li>\r\n</ul>\r\n</div>\r\n<div><strong>Running program :</strong></div>\r\n</div>\r\n</div>\r\n<div><a href=\"https://3.bp.blogspot.com/-bBqPzecDsMI/XHu7lOAp2FI/AAAAAAAAFR0/7mSqICk4QtYe-fVAbIVKJrgBf7z09ycgQCK4BGAYYCw/s1600/gbr1.png\"><img title=\"program pencarian biner (binary search) \" src=\"https://3.bp.blogspot.com/-bBqPzecDsMI/XHu7lOAp2FI/AAAAAAAAFR0/7mSqICk4QtYe-fVAbIVKJrgBf7z09ycgQCK4BGAYYCw/s1600/gbr1.png\" alt=\"program pencarian biner (binary search) \" border=\"0\" /></a></div>\r\n<div>&nbsp;</div>\r\n<div>&nbsp;</div>\r\n<div>&nbsp;</div>\r\n<div>&nbsp;</div>\r\n<div>\r\n<h2 id=\"toc_3\">Tugas</h2>\r\n</div>\r\n<div>\r\n<ol>\r\n<li>Buatlah algoritma dan program yang dapat mengecek apakah sebuah karakter ada dalam kata yang telah input ?</li>\r\n<li>Buatlah algoritma dan progam yang dapat mengecek apakah sebuah kata ada dalam kalimat yang telah input ?</li>\r\n<li>Buatlah algoritma dan program yang dapat menghitung banyakntya huruf vokal dan konsonan dalam sebuah kalaimat</li>\r\n<li>Modifikasi program soal nomor 4, selain menghitung banyaknya huruf vokal dan konsonan dalam sebuah kalimat, juga dapat menghitung banyaknya angka dalam kalimat tersebut.</li>\r\n</ol>\r\n<div>&nbsp;</div>\r\n</div>', 2, NULL, 1, 'Searching C++', '2020-06-22 19:02:36', NULL);

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
  PRIMARY KEY (`id_mata_pelajaran`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of mata_pelajaran
-- ----------------------------
INSERT INTO `mata_pelajaran` VALUES (1, 'Bahasa Inggris', 'BING', 1);
INSERT INTO `mata_pelajaran` VALUES (2, 'Fisika', 'FIS', 4);
INSERT INTO `mata_pelajaran` VALUES (3, 'Matematika', 'MTK', 1);
INSERT INTO `mata_pelajaran` VALUES (4, 'Bahasa Indonesia', 'BIND', 1);
INSERT INTO `mata_pelajaran` VALUES (5, 'Administrasi Infrastruktur Jaringan', 'AIJ', 3);
INSERT INTO `mata_pelajaran` VALUES (6, 'Administrasi Sistem Jaringan', 'ASJ', 3);
INSERT INTO `mata_pelajaran` VALUES (7, 'Produk Kreatif dan Kewirausahaan', 'PK-KWU', 3);
INSERT INTO `mata_pelajaran` VALUES (8, 'Sistem Komputer dan Digital', 'SISKOMDIG', 4);
INSERT INTO `mata_pelajaran` VALUES (9, 'Kimia', 'KIMIA', 4);
INSERT INTO `mata_pelajaran` VALUES (10, 'Pendidikan Jasmani Olahraga dan Kesehatan', 'PJOK', 2);
INSERT INTO `mata_pelajaran` VALUES (11, 'Pendidikan Pancasila dan Kewarganegaraan', 'PPKN', 1);
INSERT INTO `mata_pelajaran` VALUES (12, 'Sistem Komputer', 'SISKOM', 5);
INSERT INTO `mata_pelajaran` VALUES (13, 'Komputer dan Jaringan Dasar', 'KJD', 5);
INSERT INTO `mata_pelajaran` VALUES (14, 'Pemrograman Dasar', 'PROGDAS', 5);
INSERT INTO `mata_pelajaran` VALUES (15, 'Dasar Desain Grafis', 'DDG', 5);
INSERT INTO `mata_pelajaran` VALUES (16, 'Biologi', 'BIOLOGI', 4);
INSERT INTO `mata_pelajaran` VALUES (17, 'PPHH', 'PPHH', 6);
INSERT INTO `mata_pelajaran` VALUES (18, 'Teknologi Layanan Jaringan', 'TLJ', 5);
INSERT INTO `mata_pelajaran` VALUES (19, 'PPHN', 'PPHN', 5);
INSERT INTO `mata_pelajaran` VALUES (20, 'PPKPH', 'PPKPH', 5);
INSERT INTO `mata_pelajaran` VALUES (21, 'KPPP', 'KPPP', 5);
INSERT INTO `mata_pelajaran` VALUES (22, 'DPMHP', 'DPMHP', 5);
INSERT INTO `mata_pelajaran` VALUES (23, 'Teknologi Jaringan Berbasis Luas', 'TJBL', 5);
INSERT INTO `mata_pelajaran` VALUES (24, 'DPBHP', 'DPBHP', 5);
INSERT INTO `mata_pelajaran` VALUES (25, 'DPPHP', 'DPPHP', 5);
INSERT INTO `mata_pelajaran` VALUES (26, 'Pendidikan Agama Islam', 'PAI', 1);
INSERT INTO `mata_pelajaran` VALUES (27, 'Bahasa ARAB', 'BA', 6);
INSERT INTO `mata_pelajaran` VALUES (28, 'Bahasa Daerah', 'BD', 6);
INSERT INTO `mata_pelajaran` VALUES (29, 'Seni Budaya', 'Senbud', 2);
INSERT INTO `mata_pelajaran` VALUES (30, 'Sejarah Indonesia', 'SI', 1);

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
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of materi
-- ----------------------------
INSERT INTO `materi` VALUES (7, 'Jaringan Dasar', '', '', 21, 2, 1, 5, '779125875');
INSERT INTO `materi` VALUES (8, 'Fiber Optic', '', '', 21, 2, 1, 5, '5595721733');
INSERT INTO `materi` VALUES (9, 'Administrasi Jaringan', '', '', 21, 2, 1, 5, '988317668');
INSERT INTO `materi` VALUES (10, 'Jaringan', '', '', 22, 2, 1, 5, '3627289635');
INSERT INTO `materi` VALUES (11, 'Dasar Pemrograman', '', '', 11, 2, 1, 14, '6869325930');
INSERT INTO `materi` VALUES (12, 'Variabel dan Tipe Data', '', '', 11, 2, 1, 14, '1206746946');
INSERT INTO `materi` VALUES (13, 'Konstanta', '', '', 11, 2, 1, 14, '292181955');
INSERT INTO `materi` VALUES (14, 'Dasar Pemrograman', '', '', 13, 2, 1, 14, '4641037352');
INSERT INTO `materi` VALUES (15, 'Variabel dan Tipe Data', '', '', 13, 2, 1, 14, '2943316709');

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
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of nilai_keterampilan
-- ----------------------------
INSERT INTO `nilai_keterampilan` VALUES (1, 38, 10, '0', 1, '2020-12-28 20:10:24', 2);
INSERT INTO `nilai_keterampilan` VALUES (2, 39, 11, '1', 1, '2020-12-28 20:10:24', 2);
INSERT INTO `nilai_keterampilan` VALUES (3, 40, 12, '2', 1, '2020-12-28 20:10:24', 2);
INSERT INTO `nilai_keterampilan` VALUES (4, 41, 13, '3', 1, '2020-12-28 20:10:24', 2);
INSERT INTO `nilai_keterampilan` VALUES (5, 42, 14, '4', 1, '2020-12-28 20:10:24', 2);
INSERT INTO `nilai_keterampilan` VALUES (6, 43, 15, '5', 1, '2020-12-28 20:10:24', 2);
INSERT INTO `nilai_keterampilan` VALUES (7, 44, 16, '6', 1, '2020-12-28 20:10:24', 2);
INSERT INTO `nilai_keterampilan` VALUES (8, 45, 17, '7', 1, '2020-12-28 20:10:24', 2);
INSERT INTO `nilai_keterampilan` VALUES (9, 46, 18, '8', 1, '2020-12-28 20:10:24', 2);
INSERT INTO `nilai_keterampilan` VALUES (10, 47, 19, '9', 1, '2020-12-28 20:10:24', 2);
INSERT INTO `nilai_keterampilan` VALUES (11, 48, 20, '10', 1, '2020-12-28 20:10:24', 2);
INSERT INTO `nilai_keterampilan` VALUES (12, 49, 21, '11', 1, '2020-12-28 20:10:24', 2);
INSERT INTO `nilai_keterampilan` VALUES (13, 50, 22, '12', 1, '2020-12-28 20:10:24', 2);
INSERT INTO `nilai_keterampilan` VALUES (14, 51, 23, '13', 1, '2020-12-28 20:10:24', 2);
INSERT INTO `nilai_keterampilan` VALUES (15, 52, 24, '14', 1, '2020-12-28 20:10:24', 2);
INSERT INTO `nilai_keterampilan` VALUES (16, 53, 25, '15', 1, '2020-12-28 20:10:24', 2);
INSERT INTO `nilai_keterampilan` VALUES (17, 54, 26, '16', 1, '2020-12-28 20:10:24', 2);
INSERT INTO `nilai_keterampilan` VALUES (18, 55, 27, '17', 1, '2020-12-28 20:10:24', 2);
INSERT INTO `nilai_keterampilan` VALUES (19, 56, 28, '18', 1, '2020-12-28 20:10:24', 2);
INSERT INTO `nilai_keterampilan` VALUES (20, 57, 29, '19', 1, '2020-12-28 20:10:24', 2);
INSERT INTO `nilai_keterampilan` VALUES (21, 58, 30, '20', 1, '2020-12-28 20:10:24', 2);
INSERT INTO `nilai_keterampilan` VALUES (22, 59, 31, '21', 1, '2020-12-28 20:10:24', 2);
INSERT INTO `nilai_keterampilan` VALUES (23, 60, 32, '22', 1, '2020-12-28 20:10:24', 2);
INSERT INTO `nilai_keterampilan` VALUES (24, 61, 33, '23', 1, '2020-12-28 20:10:24', 2);
INSERT INTO `nilai_keterampilan` VALUES (25, 62, 34, '24', 1, '2020-12-28 20:10:24', 2);
INSERT INTO `nilai_keterampilan` VALUES (26, 63, 35, '25', 1, '2020-12-28 20:10:24', 2);
INSERT INTO `nilai_keterampilan` VALUES (27, 64, 36, '26', 1, '2020-12-28 20:10:24', 2);
INSERT INTO `nilai_keterampilan` VALUES (28, 65, 37, '27', 1, '2020-12-28 20:10:24', 2);
INSERT INTO `nilai_keterampilan` VALUES (29, 66, 38, '28', 1, '2020-12-28 20:10:24', 2);
INSERT INTO `nilai_keterampilan` VALUES (30, 67, 39, '29', 1, '2020-12-28 20:10:24', 2);
INSERT INTO `nilai_keterampilan` VALUES (31, 68, 40, '30', 1, '2020-12-28 20:10:24', 2);
INSERT INTO `nilai_keterampilan` VALUES (32, 69, 41, '31', 1, '2020-12-28 20:10:24', 2);
INSERT INTO `nilai_keterampilan` VALUES (33, 70, 42, '32', 1, '2020-12-28 20:10:24', 2);
INSERT INTO `nilai_keterampilan` VALUES (34, 71, 43, '33', 1, '2020-12-28 20:10:24', 2);
INSERT INTO `nilai_keterampilan` VALUES (35, 72, 44, '34', 1, '2020-12-28 20:10:24', 2);
INSERT INTO `nilai_keterampilan` VALUES (36, 73, 45, '35', 1, '2020-12-28 20:10:24', 2);
INSERT INTO `nilai_keterampilan` VALUES (37, 74, 46, '36', 1, '2020-12-28 20:10:24', 2);

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
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of nilai_pas
-- ----------------------------
INSERT INTO `nilai_pas` VALUES (1, 38, 80, '0', 1, '2020-12-28 14:40:46');
INSERT INTO `nilai_pas` VALUES (2, 39, 80, '1', 1, '2020-12-28 14:40:46');
INSERT INTO `nilai_pas` VALUES (3, 40, 80, '2', 1, '2020-12-28 14:40:46');
INSERT INTO `nilai_pas` VALUES (4, 41, 80, '3', 1, '2020-12-28 14:40:46');
INSERT INTO `nilai_pas` VALUES (5, 42, 80, '4', 1, '2020-12-28 14:40:46');
INSERT INTO `nilai_pas` VALUES (6, 43, 80, '5', 1, '2020-12-28 14:40:46');
INSERT INTO `nilai_pas` VALUES (7, 44, 80, '6', 1, '2020-12-28 14:40:46');
INSERT INTO `nilai_pas` VALUES (8, 45, 80, '7', 1, '2020-12-28 14:40:46');
INSERT INTO `nilai_pas` VALUES (9, 46, 80, '8', 1, '2020-12-28 14:40:46');
INSERT INTO `nilai_pas` VALUES (10, 47, 80, '9', 1, '2020-12-28 14:40:46');
INSERT INTO `nilai_pas` VALUES (11, 48, 80, '10', 1, '2020-12-28 14:40:46');
INSERT INTO `nilai_pas` VALUES (12, 49, 80, '11', 1, '2020-12-28 14:40:46');
INSERT INTO `nilai_pas` VALUES (13, 50, 80, '12', 1, '2020-12-28 14:40:46');
INSERT INTO `nilai_pas` VALUES (14, 51, 80, '13', 1, '2020-12-28 14:40:46');
INSERT INTO `nilai_pas` VALUES (15, 52, 80, '14', 1, '2020-12-28 14:40:46');
INSERT INTO `nilai_pas` VALUES (16, 53, 80, '15', 1, '2020-12-28 14:40:46');
INSERT INTO `nilai_pas` VALUES (17, 54, 80, '16', 1, '2020-12-28 14:40:46');
INSERT INTO `nilai_pas` VALUES (18, 55, 80, '17', 1, '2020-12-28 14:40:46');
INSERT INTO `nilai_pas` VALUES (19, 56, 80, '18', 1, '2020-12-28 14:40:46');
INSERT INTO `nilai_pas` VALUES (20, 57, 80, '19', 1, '2020-12-28 14:40:46');
INSERT INTO `nilai_pas` VALUES (21, 58, 80, '20', 1, '2020-12-28 14:40:46');
INSERT INTO `nilai_pas` VALUES (22, 59, 80, '21', 1, '2020-12-28 14:40:46');
INSERT INTO `nilai_pas` VALUES (23, 60, 80, '22', 1, '2020-12-28 14:40:46');
INSERT INTO `nilai_pas` VALUES (24, 61, 80, '23', 1, '2020-12-28 14:40:46');
INSERT INTO `nilai_pas` VALUES (25, 62, 80, '24', 1, '2020-12-28 14:40:46');
INSERT INTO `nilai_pas` VALUES (26, 63, 80, '25', 1, '2020-12-28 14:40:46');
INSERT INTO `nilai_pas` VALUES (27, 64, 80, '26', 1, '2020-12-28 14:40:46');
INSERT INTO `nilai_pas` VALUES (28, 65, 80, '27', 1, '2020-12-28 14:40:46');
INSERT INTO `nilai_pas` VALUES (29, 66, 80, '28', 1, '2020-12-28 14:40:46');
INSERT INTO `nilai_pas` VALUES (30, 67, 80, '29', 1, '2020-12-28 14:40:46');
INSERT INTO `nilai_pas` VALUES (31, 68, 80, '30', 1, '2020-12-28 14:40:46');
INSERT INTO `nilai_pas` VALUES (32, 69, 80, '31', 1, '2020-12-28 14:40:46');
INSERT INTO `nilai_pas` VALUES (33, 70, 80, '32', 1, '2020-12-28 14:40:46');
INSERT INTO `nilai_pas` VALUES (34, 71, 80, '33', 1, '2020-12-28 14:40:46');
INSERT INTO `nilai_pas` VALUES (35, 72, 80, '34', 1, '2020-12-28 14:40:46');
INSERT INTO `nilai_pas` VALUES (36, 73, 80, '35', 1, '2020-12-28 14:40:46');
INSERT INTO `nilai_pas` VALUES (37, 74, 80, '36', 1, '2020-12-28 14:40:46');

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
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of nilai_pengetahuan
-- ----------------------------
INSERT INTO `nilai_pengetahuan` VALUES (1, 38, 50, '0', 1, '2020-12-28 14:49:42', 1);
INSERT INTO `nilai_pengetahuan` VALUES (2, 39, 51, '1', 1, '2020-12-28 14:49:42', 1);
INSERT INTO `nilai_pengetahuan` VALUES (3, 40, 52, '2', 1, '2020-12-28 14:49:42', 1);
INSERT INTO `nilai_pengetahuan` VALUES (4, 41, 53, '3', 1, '2020-12-28 14:49:42', 1);
INSERT INTO `nilai_pengetahuan` VALUES (5, 42, 54, '4', 1, '2020-12-28 14:49:42', 1);
INSERT INTO `nilai_pengetahuan` VALUES (6, 43, 55, '5', 1, '2020-12-28 14:49:42', 1);
INSERT INTO `nilai_pengetahuan` VALUES (7, 44, 56, '6', 1, '2020-12-28 14:49:42', 1);
INSERT INTO `nilai_pengetahuan` VALUES (8, 45, 57, '7', 1, '2020-12-28 14:49:42', 1);
INSERT INTO `nilai_pengetahuan` VALUES (9, 46, 58, '8', 1, '2020-12-28 14:49:42', 1);
INSERT INTO `nilai_pengetahuan` VALUES (10, 47, 59, '9', 1, '2020-12-28 14:49:42', 1);
INSERT INTO `nilai_pengetahuan` VALUES (11, 48, 60, '10', 1, '2020-12-28 14:49:42', 1);
INSERT INTO `nilai_pengetahuan` VALUES (12, 49, 61, '11', 1, '2020-12-28 14:49:42', 1);
INSERT INTO `nilai_pengetahuan` VALUES (13, 50, 62, '12', 1, '2020-12-28 14:49:42', 1);
INSERT INTO `nilai_pengetahuan` VALUES (14, 51, 63, '13', 1, '2020-12-28 14:49:42', 1);
INSERT INTO `nilai_pengetahuan` VALUES (15, 52, 64, '14', 1, '2020-12-28 14:49:42', 1);
INSERT INTO `nilai_pengetahuan` VALUES (16, 53, 65, '15', 1, '2020-12-28 14:49:42', 1);
INSERT INTO `nilai_pengetahuan` VALUES (17, 54, 66, '16', 1, '2020-12-28 14:49:42', 1);
INSERT INTO `nilai_pengetahuan` VALUES (18, 55, 67, '17', 1, '2020-12-28 14:49:42', 1);
INSERT INTO `nilai_pengetahuan` VALUES (19, 56, 68, '18', 1, '2020-12-28 14:49:42', 1);
INSERT INTO `nilai_pengetahuan` VALUES (20, 57, 69, '19', 1, '2020-12-28 14:49:42', 1);
INSERT INTO `nilai_pengetahuan` VALUES (21, 58, 70, '20', 1, '2020-12-28 14:49:42', 1);
INSERT INTO `nilai_pengetahuan` VALUES (22, 59, 71, '21', 1, '2020-12-28 14:49:42', 1);
INSERT INTO `nilai_pengetahuan` VALUES (23, 60, 72, '22', 1, '2020-12-28 14:49:42', 1);
INSERT INTO `nilai_pengetahuan` VALUES (24, 61, 73, '23', 1, '2020-12-28 14:49:42', 1);
INSERT INTO `nilai_pengetahuan` VALUES (25, 62, 74, '24', 1, '2020-12-28 14:49:42', 1);
INSERT INTO `nilai_pengetahuan` VALUES (26, 63, 75, '25', 1, '2020-12-28 14:49:42', 1);
INSERT INTO `nilai_pengetahuan` VALUES (27, 64, 76, '26', 1, '2020-12-28 14:49:42', 1);
INSERT INTO `nilai_pengetahuan` VALUES (28, 65, 77, '27', 1, '2020-12-28 14:49:42', 1);
INSERT INTO `nilai_pengetahuan` VALUES (29, 66, 78, '28', 1, '2020-12-28 14:49:42', 1);
INSERT INTO `nilai_pengetahuan` VALUES (30, 67, 79, '29', 1, '2020-12-28 14:49:42', 1);
INSERT INTO `nilai_pengetahuan` VALUES (31, 68, 80, '30', 1, '2020-12-28 14:49:42', 1);
INSERT INTO `nilai_pengetahuan` VALUES (32, 69, 81, '31', 1, '2020-12-28 14:49:42', 1);
INSERT INTO `nilai_pengetahuan` VALUES (33, 70, 82, '32', 1, '2020-12-28 14:49:42', 1);
INSERT INTO `nilai_pengetahuan` VALUES (34, 71, 83, '33', 1, '2020-12-28 14:49:42', 1);
INSERT INTO `nilai_pengetahuan` VALUES (35, 72, 84, '34', 1, '2020-12-28 14:49:42', 1);
INSERT INTO `nilai_pengetahuan` VALUES (36, 73, 85, '35', 1, '2020-12-28 14:49:42', 1);
INSERT INTO `nilai_pengetahuan` VALUES (37, 74, 86, '36', 1, '2020-12-28 14:49:42', 1);

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
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of organisasi_pegawai
-- ----------------------------
INSERT INTO `organisasi_pegawai` VALUES (1, 'O1', 'J1', '2010', 24);
INSERT INTO `organisasi_pegawai` VALUES (2, 'O2', 'J2', '2011', 24);
INSERT INTO `organisasi_pegawai` VALUES (3, 'fip', 'asd', '2001', 25);
INSERT INTO `organisasi_pegawai` VALUES (4, 'aa', 'd', '2003', 25);
INSERT INTO `organisasi_pegawai` VALUES (5, 'ere', 'ere', '2005', 25);
INSERT INTO `organisasi_pegawai` VALUES (6, 'fip', 'asd', '2001', 26);
INSERT INTO `organisasi_pegawai` VALUES (7, 'aa', 'd', '2003', 26);
INSERT INTO `organisasi_pegawai` VALUES (8, 'ere', 'ere', '2005', 26);
INSERT INTO `organisasi_pegawai` VALUES (9, 'fip', 'asd', '2001', 27);
INSERT INTO `organisasi_pegawai` VALUES (10, 'aa', 'd', '2003', 27);
INSERT INTO `organisasi_pegawai` VALUES (11, 'ere', 'ere', '2005', 27);

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
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pelanggaran_siswa
-- ----------------------------
INSERT INTO `pelanggaran_siswa` VALUES (1, '2020-12-16', 'Tidak Menggunakan sabuk', 2, 95);
INSERT INTO `pelanggaran_siswa` VALUES (2, '2020-12-16', 'Tidak berseragam pramuka', 1, 95);

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
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pembayaran_spp
-- ----------------------------
INSERT INTO `pembayaran_spp` VALUES (1, 95, 10, 2020, 500000, '2020-12-11', '2020-12-11 20:47:56');
INSERT INTO `pembayaran_spp` VALUES (2, 95, 11, 2020, 5000, '2020-12-08', '2020-12-11 20:48:55');

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
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pendidikan_pegawai
-- ----------------------------
INSERT INTO `pendidikan_pegawai` VALUES (1, 23, 'jp1', 'y', 2020);
INSERT INTO `pendidikan_pegawai` VALUES (2, 23, 'jp2', 'b', 2020);
INSERT INTO `pendidikan_pegawai` VALUES (3, 24, 'jp1', 'y', 2020);
INSERT INTO `pendidikan_pegawai` VALUES (4, 24, 'jp2', 'b', 2020);
INSERT INTO `pendidikan_pegawai` VALUES (5, 25, 'smk', 'ya', 2020);
INSERT INTO `pendidikan_pegawai` VALUES (6, 25, 'd3', 'ya', 2020);
INSERT INTO `pendidikan_pegawai` VALUES (7, 26, 'smk', 'ya', 2020);
INSERT INTO `pendidikan_pegawai` VALUES (8, 26, 'd3', 'ya', 2020);
INSERT INTO `pendidikan_pegawai` VALUES (9, 27, 'smk', 'ya', 2020);
INSERT INTO `pendidikan_pegawai` VALUES (10, 27, 'd3', 'ya', 2020);

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
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of penilaian_kinerja_guru
-- ----------------------------
INSERT INTO `penilaian_kinerja_guru` VALUES (2, 2, 5, 2021, 1, '2021-05-30 10:15:38', '18748');
INSERT INTO `penilaian_kinerja_guru` VALUES (3, 6, 5, 2021, 1, '2021-05-31 16:30:54', '32453');
INSERT INTO `penilaian_kinerja_guru` VALUES (5, 7, 5, 2021, 1, '2021-05-31 17:02:59', '76585');
INSERT INTO `penilaian_kinerja_guru` VALUES (6, 10, 5, 2021, 1, '2021-05-31 17:08:46', '52575');
INSERT INTO `penilaian_kinerja_guru` VALUES (8, 2, 4, 2021, 1, '2021-05-31 17:56:21', '97789');
INSERT INTO `penilaian_kinerja_guru` VALUES (9, 2, 3, 2021, 1, '2021-05-31 17:57:55', '30426');

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
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of poin_pelanggaran
-- ----------------------------
INSERT INTO `poin_pelanggaran` VALUES (1, 1, 'Tidak menggunakan seragam', 5, 'A1');
INSERT INTO `poin_pelanggaran` VALUES (2, 2, 'Tidak menggunakan atribut lengkap', 3, 'A2');
INSERT INTO `poin_pelanggaran` VALUES (3, 1, 'T', 9, 'A001');
INSERT INTO `poin_pelanggaran` VALUES (4, 2, 'Terlambat datang', 5, 'A002');

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
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ppdb
-- ----------------------------
INSERT INTO `ppdb` VALUES (21, 'rendy', '123', '2020-12-04', 'DSN Sonosari ', 'rendyyanisusanto@gmail.com', '084994664558', 'Malang', '65162', '165', '56', 'Sugianto', '1956', '081334791464', 'Sri Indahyani', '123123', '00', '1988', 'L', '5', '9', '3', '3', '1', '2', '555', '718979097', '1231', NULL, '2020-12-04 21:18:35');

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
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of presensi_guru
-- ----------------------------
INSERT INTO `presensi_guru` VALUES (15, 2, '2021-04-01', '07:00:00', '11:00:00', '2021-05-08 12:06:37', 1);
INSERT INTO `presensi_guru` VALUES (16, 2, '2021-04-05', '07:00:00', '11:00:00', '2021-05-08 12:06:45', 1);
INSERT INTO `presensi_guru` VALUES (17, 2, '2021-04-06', '07:00:00', '11:00:00', '2021-05-08 12:06:57', 1);
INSERT INTO `presensi_guru` VALUES (18, 2, '2021-04-07', '07:00:00', '11:00:00', '2021-05-08 12:07:05', 1);
INSERT INTO `presensi_guru` VALUES (19, 2, '2021-04-08', '07:00:00', '11:00:00', '2021-05-08 12:12:01', 1);
INSERT INTO `presensi_guru` VALUES (20, 2, '2021-04-12', '07:00:00', '11:00:00', '2021-05-08 12:12:14', 1);
INSERT INTO `presensi_guru` VALUES (21, 2, '2021-04-13', '07:00:00', '11:00:00', '2021-05-08 12:12:29', 1);
INSERT INTO `presensi_guru` VALUES (22, 2, '2021-04-14', '07:00:00', '11:00:00', '2021-05-08 12:13:57', 1);
INSERT INTO `presensi_guru` VALUES (23, 2, '2021-04-15', '07:00:00', '11:00:00', '2021-05-08 12:14:08', 1);
INSERT INTO `presensi_guru` VALUES (24, 2, '2021-04-19', '07:00:00', '11:00:00', '2021-05-08 12:16:31', 1);
INSERT INTO `presensi_guru` VALUES (25, 2, '2021-04-20', '07:00:00', '11:00:00', '2021-05-08 12:16:42', 1);
INSERT INTO `presensi_guru` VALUES (26, 2, '2021-04-21', '07:00:00', '11:00:00', '2021-05-08 12:16:54', 1);
INSERT INTO `presensi_guru` VALUES (27, 2, '2021-04-22', '07:00:00', '11:00:00', '2021-05-08 12:17:05', 1);
INSERT INTO `presensi_guru` VALUES (29, 2, '2021-04-27', '07:00:00', '11:00:00', '2021-05-08 12:17:25', 1);
INSERT INTO `presensi_guru` VALUES (31, 2, '2021-04-29', '07:00:00', '11:00:00', '2021-05-08 12:17:49', 1);

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
) ENGINE = InnoDB AUTO_INCREMENT = 112 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of presensi_harian
-- ----------------------------
INSERT INTO `presensi_harian` VALUES (75, 1, 38, 'A', '', '2021-04-27', '2021-04-27 10:34:35', 1, 11);
INSERT INTO `presensi_harian` VALUES (76, 1, 39, 'S', '', '2021-04-27', '2021-04-27 10:34:36', 1, 11);
INSERT INTO `presensi_harian` VALUES (77, 1, 40, 'A', '', '2021-04-27', '2021-04-27 10:34:36', 1, 11);
INSERT INTO `presensi_harian` VALUES (78, 1, 41, 'M', '', '2021-04-27', '2021-04-27 10:34:36', 1, 11);
INSERT INTO `presensi_harian` VALUES (79, 1, 42, 'M', '', '2021-04-27', '2021-04-27 10:34:36', 1, 11);
INSERT INTO `presensi_harian` VALUES (80, 1, 43, 'M', '', '2021-04-27', '2021-04-27 10:34:36', 1, 11);
INSERT INTO `presensi_harian` VALUES (81, 1, 44, 'M', '', '2021-04-27', '2021-04-27 10:34:36', 1, 11);
INSERT INTO `presensi_harian` VALUES (82, 1, 45, 'I', '', '2021-04-27', '2021-04-27 10:34:36', 1, 11);
INSERT INTO `presensi_harian` VALUES (83, 1, 46, 'M', '', '2021-04-27', '2021-04-27 10:34:36', 1, 11);
INSERT INTO `presensi_harian` VALUES (84, 1, 47, 'S', '', '2021-04-27', '2021-04-27 10:34:36', 1, 11);
INSERT INTO `presensi_harian` VALUES (85, 1, 48, 'M', '', '2021-04-27', '2021-04-27 10:34:36', 1, 11);
INSERT INTO `presensi_harian` VALUES (86, 1, 49, 'M', '', '2021-04-27', '2021-04-27 10:34:36', 1, 11);
INSERT INTO `presensi_harian` VALUES (87, 1, 50, 'M', '', '2021-04-27', '2021-04-27 10:34:36', 1, 11);
INSERT INTO `presensi_harian` VALUES (88, 1, 51, 'M', '', '2021-04-27', '2021-04-27 10:34:36', 1, 11);
INSERT INTO `presensi_harian` VALUES (89, 1, 52, 'M', '', '2021-04-27', '2021-04-27 10:34:36', 1, 11);
INSERT INTO `presensi_harian` VALUES (90, 1, 53, 'M', '', '2021-04-27', '2021-04-27 10:34:36', 1, 11);
INSERT INTO `presensi_harian` VALUES (91, 1, 54, 'M', '', '2021-04-27', '2021-04-27 10:34:36', 1, 11);
INSERT INTO `presensi_harian` VALUES (92, 1, 55, 'M', '', '2021-04-27', '2021-04-27 10:34:36', 1, 11);
INSERT INTO `presensi_harian` VALUES (93, 1, 56, 'M', '', '2021-04-27', '2021-04-27 10:34:36', 1, 11);
INSERT INTO `presensi_harian` VALUES (94, 1, 57, 'M', '', '2021-04-27', '2021-04-27 10:34:37', 1, 11);
INSERT INTO `presensi_harian` VALUES (95, 1, 58, 'M', '', '2021-04-27', '2021-04-27 10:34:37', 1, 11);
INSERT INTO `presensi_harian` VALUES (96, 1, 59, 'M', '', '2021-04-27', '2021-04-27 10:34:37', 1, 11);
INSERT INTO `presensi_harian` VALUES (97, 1, 60, 'M', '', '2021-04-27', '2021-04-27 10:34:37', 1, 11);
INSERT INTO `presensi_harian` VALUES (98, 1, 61, 'M', '', '2021-04-27', '2021-04-27 10:34:37', 1, 11);
INSERT INTO `presensi_harian` VALUES (99, 1, 62, 'M', '', '2021-04-27', '2021-04-27 10:34:37', 1, 11);
INSERT INTO `presensi_harian` VALUES (100, 1, 63, 'M', '', '2021-04-27', '2021-04-27 10:34:37', 1, 11);
INSERT INTO `presensi_harian` VALUES (101, 1, 64, 'M', '', '2021-04-27', '2021-04-27 10:34:37', 1, 11);
INSERT INTO `presensi_harian` VALUES (102, 1, 65, 'M', '', '2021-04-27', '2021-04-27 10:34:37', 1, 11);
INSERT INTO `presensi_harian` VALUES (103, 1, 66, 'M', '', '2021-04-27', '2021-04-27 10:34:37', 1, 11);
INSERT INTO `presensi_harian` VALUES (104, 1, 67, 'M', '', '2021-04-27', '2021-04-27 10:34:37', 1, 11);
INSERT INTO `presensi_harian` VALUES (105, 1, 68, 'M', '', '2021-04-27', '2021-04-27 10:34:37', 1, 11);
INSERT INTO `presensi_harian` VALUES (106, 1, 69, 'M', '', '2021-04-27', '2021-04-27 10:34:37', 1, 11);
INSERT INTO `presensi_harian` VALUES (107, 1, 70, 'M', '', '2021-04-27', '2021-04-27 10:34:37', 1, 11);
INSERT INTO `presensi_harian` VALUES (108, 1, 71, 'M', '', '2021-04-27', '2021-04-27 10:34:37', 1, 11);
INSERT INTO `presensi_harian` VALUES (109, 1, 72, 'A', '', '2021-04-27', '2021-04-27 10:34:37', 1, 11);
INSERT INTO `presensi_harian` VALUES (110, 1, 73, 'A', '', '2021-04-27', '2021-04-27 10:34:37', 1, 11);
INSERT INTO `presensi_harian` VALUES (111, 1, 74, 'A', '', '2021-04-27', '2021-04-27 10:34:37', 1, 11);

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
) ENGINE = InnoDB AUTO_INCREMENT = 112 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of presensi_rapor
-- ----------------------------
INSERT INTO `presensi_rapor` VALUES (38, 2, 38, 11, 10, 20, 10);
INSERT INTO `presensi_rapor` VALUES (39, 2, 39, 11, 2, 2, 2);
INSERT INTO `presensi_rapor` VALUES (40, 2, 40, 11, 3, 3, 3);
INSERT INTO `presensi_rapor` VALUES (41, 2, 41, 11, 4, 4, 4);
INSERT INTO `presensi_rapor` VALUES (42, 2, 42, 11, 5, 5, 5);
INSERT INTO `presensi_rapor` VALUES (43, 2, 43, 11, 6, 6, 6);
INSERT INTO `presensi_rapor` VALUES (44, 2, 44, 11, 7, 7, 7);
INSERT INTO `presensi_rapor` VALUES (45, 2, 45, 11, 8, 8, 8);
INSERT INTO `presensi_rapor` VALUES (46, 2, 46, 11, 9, 9, 9);
INSERT INTO `presensi_rapor` VALUES (47, 2, 47, 11, 10, 10, 10);
INSERT INTO `presensi_rapor` VALUES (48, 2, 48, 11, 11, 11, 11);
INSERT INTO `presensi_rapor` VALUES (49, 2, 49, 11, 12, 12, 12);
INSERT INTO `presensi_rapor` VALUES (50, 2, 50, 11, 13, 13, 13);
INSERT INTO `presensi_rapor` VALUES (51, 2, 51, 11, 14, 14, 14);
INSERT INTO `presensi_rapor` VALUES (52, 2, 52, 11, 15, 15, 15);
INSERT INTO `presensi_rapor` VALUES (53, 2, 53, 11, 16, 16, 16);
INSERT INTO `presensi_rapor` VALUES (54, 2, 54, 11, 17, 17, 17);
INSERT INTO `presensi_rapor` VALUES (55, 2, 55, 11, 18, 18, 18);
INSERT INTO `presensi_rapor` VALUES (56, 2, 56, 11, 19, 19, 19);
INSERT INTO `presensi_rapor` VALUES (57, 2, 57, 11, 20, 20, 20);
INSERT INTO `presensi_rapor` VALUES (58, 2, 58, 11, 21, 21, 21);
INSERT INTO `presensi_rapor` VALUES (59, 2, 59, 11, 22, 22, 22);
INSERT INTO `presensi_rapor` VALUES (60, 2, 60, 11, 23, 23, 23);
INSERT INTO `presensi_rapor` VALUES (61, 2, 61, 11, 24, 24, 24);
INSERT INTO `presensi_rapor` VALUES (62, 2, 62, 11, 25, 25, 25);
INSERT INTO `presensi_rapor` VALUES (63, 2, 63, 11, 26, 26, 26);
INSERT INTO `presensi_rapor` VALUES (64, 2, 64, 11, 27, 27, 27);
INSERT INTO `presensi_rapor` VALUES (65, 2, 65, 11, 28, 28, 28);
INSERT INTO `presensi_rapor` VALUES (66, 2, 66, 11, 29, 29, 29);
INSERT INTO `presensi_rapor` VALUES (67, 2, 67, 11, 30, 30, 30);
INSERT INTO `presensi_rapor` VALUES (68, 2, 68, 11, 31, 31, 31);
INSERT INTO `presensi_rapor` VALUES (69, 2, 69, 11, 32, 32, 32);
INSERT INTO `presensi_rapor` VALUES (70, 2, 70, 11, 33, 33, 33);
INSERT INTO `presensi_rapor` VALUES (71, 2, 71, 11, 34, 34, 34);
INSERT INTO `presensi_rapor` VALUES (72, 2, 72, 11, 35, 35, 35);
INSERT INTO `presensi_rapor` VALUES (73, 2, 73, 11, 36, 36, 36);
INSERT INTO `presensi_rapor` VALUES (74, 2, 74, 11, 37, 37, 37);
INSERT INTO `presensi_rapor` VALUES (75, 2, 38, 11, 10, 20, 10);
INSERT INTO `presensi_rapor` VALUES (76, 2, 39, 11, 2, 2, 2);
INSERT INTO `presensi_rapor` VALUES (77, 2, 40, 11, 3, 3, 3);
INSERT INTO `presensi_rapor` VALUES (78, 2, 41, 11, 4, 4, 4);
INSERT INTO `presensi_rapor` VALUES (79, 2, 42, 11, 5, 5, 5);
INSERT INTO `presensi_rapor` VALUES (80, 2, 43, 11, 6, 6, 6);
INSERT INTO `presensi_rapor` VALUES (81, 2, 44, 11, 7, 7, 7);
INSERT INTO `presensi_rapor` VALUES (82, 2, 45, 11, 8, 8, 8);
INSERT INTO `presensi_rapor` VALUES (83, 2, 46, 11, 9, 9, 9);
INSERT INTO `presensi_rapor` VALUES (84, 2, 47, 11, 10, 10, 10);
INSERT INTO `presensi_rapor` VALUES (85, 2, 48, 11, 11, 11, 11);
INSERT INTO `presensi_rapor` VALUES (86, 2, 49, 11, 12, 12, 12);
INSERT INTO `presensi_rapor` VALUES (87, 2, 50, 11, 13, 13, 13);
INSERT INTO `presensi_rapor` VALUES (88, 2, 51, 11, 14, 14, 14);
INSERT INTO `presensi_rapor` VALUES (89, 2, 52, 11, 15, 15, 15);
INSERT INTO `presensi_rapor` VALUES (90, 2, 53, 11, 16, 16, 16);
INSERT INTO `presensi_rapor` VALUES (91, 2, 54, 11, 17, 17, 17);
INSERT INTO `presensi_rapor` VALUES (92, 2, 55, 11, 18, 18, 18);
INSERT INTO `presensi_rapor` VALUES (93, 2, 56, 11, 19, 19, 19);
INSERT INTO `presensi_rapor` VALUES (94, 2, 57, 11, 20, 20, 20);
INSERT INTO `presensi_rapor` VALUES (95, 2, 58, 11, 21, 21, 21);
INSERT INTO `presensi_rapor` VALUES (96, 2, 59, 11, 22, 22, 22);
INSERT INTO `presensi_rapor` VALUES (97, 2, 60, 11, 23, 23, 23);
INSERT INTO `presensi_rapor` VALUES (98, 2, 61, 11, 24, 24, 24);
INSERT INTO `presensi_rapor` VALUES (99, 2, 62, 11, 25, 25, 25);
INSERT INTO `presensi_rapor` VALUES (100, 2, 63, 11, 26, 26, 26);
INSERT INTO `presensi_rapor` VALUES (101, 2, 64, 11, 27, 27, 27);
INSERT INTO `presensi_rapor` VALUES (102, 2, 65, 11, 28, 28, 28);
INSERT INTO `presensi_rapor` VALUES (103, 2, 66, 11, 29, 29, 29);
INSERT INTO `presensi_rapor` VALUES (104, 2, 67, 11, 30, 30, 30);
INSERT INTO `presensi_rapor` VALUES (105, 2, 68, 11, 31, 31, 31);
INSERT INTO `presensi_rapor` VALUES (106, 2, 69, 11, 32, 32, 32);
INSERT INTO `presensi_rapor` VALUES (107, 2, 70, 11, 33, 33, 33);
INSERT INTO `presensi_rapor` VALUES (108, 2, 71, 11, 34, 34, 34);
INSERT INTO `presensi_rapor` VALUES (109, 2, 72, 11, 35, 35, 35);
INSERT INTO `presensi_rapor` VALUES (110, 2, 73, 11, 36, 36, 36);
INSERT INTO `presensi_rapor` VALUES (111, 2, 74, 11, 37, 37, 37);

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
  `negara` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of profil_website
-- ----------------------------
INSERT INTO `profil_website` VALUES ('VOHISA', 'Jl. Istana Mekar Wangi Utama No 1P-Q', '085894632505', 'logo-w.png', 'bulb.png', 'undefined', 'Shop with the nature, Please shop with me', '<p>The Balance Small Business makes launching and managing your own business easy. It is home to experts who provide clear, practical advice on entrepreneurship and management. Whether you&rsquo;re just starting up or you want to take your company to the next level, our 20-year-strong library of more than 7,000 pieces of content will answer your questions and turn your business dreams into reality.</p>\n\n<p><a href=\"https://www.thebalancesmb.com/\">The Balance</a>&nbsp;is part of The Balance family of sites, including&nbsp;<a href=\"https://www.thebalance.com/\" rel=\"noopener\" target=\"_blank\">The Balance</a>&nbsp;and&nbsp;<a href=\"https://www.thebalancecareers.com/\" rel=\"noopener\" target=\"_blank\">The Balance Careers</a>, covering personal finance, career, and small business topics. With more than 24 million monthly visitors, The Balance is among the top-10 largest finance properties as measured by comScore, a leading Internet measurement company. Our more than 50 expert writers have extensive qualifications and expertise in their topics, including MBAs, PhDs, CFPs, other advanced degrees and professional certifications.</p>\n\n<p>The Balance family of sites have been honored by multiple awards in the last year, including&nbsp;<a href=\"https://www.tellyawards.com/winners/2017/short-form-social/general-education-discovery\" rel=\"noopener nofollow\" target=\"_blank\">The Telly Awards</a>,&nbsp;<a href=\"https://www.communicatorawards.com/\" rel=\"noopener nofollow\" target=\"_blank\">The Communicator Awards</a>, and&nbsp;<a href=\"https://www.editorandpublisher.com/news/editor-publisher-announces-the-2017-eppy-award-finalists/\" rel=\"noopener nofollow\" target=\"_blank\">Eppy Awards</a>.</p>\n', 'hallo@smkitasy-syadzili.sch.id', 'Daniel Elvanda Yohanes', 'undefined', 'undefined', 'undefined', 'undefined', 'a00ae551dd485419a57db462a6ae30b9.jpg', 'Halo Admin, Saya ingin bertanya/membeli/.....', 'd797c14a0070235734508b7d9f409395.jpg', '&copy; 2019. <a href=\"#\">Core Master</a> by<a href=\"https://myber.co.id\" target=\"_blank\">Myber</a>', 'Core Master', 'Klinik Sekarpuro', 'Malang', 'Indonesia');

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
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of quiz
-- ----------------------------
INSERT INTO `quiz` VALUES (2, 'Dasar C++', 0, '123', 1, 1, 2);

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
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of riwayat_kerja_pns_pegawai
-- ----------------------------
INSERT INTO `riwayat_kerja_pns_pegawai` VALUES (1, 23, 'RPNS1', 'D', '123', 'R', '13');
INSERT INTO `riwayat_kerja_pns_pegawai` VALUES (2, 23, 'RPNS2', 'L', '32', 'L', 'J');
INSERT INTO `riwayat_kerja_pns_pegawai` VALUES (3, 24, 'RPNS1', 'D', '123', 'R', '13');
INSERT INTO `riwayat_kerja_pns_pegawai` VALUES (4, 24, 'RPNS2', 'L', '32', 'L', 'J');
INSERT INTO `riwayat_kerja_pns_pegawai` VALUES (5, 25, 'v', 'aas', '2000', '2001', 'ad');
INSERT INTO `riwayat_kerja_pns_pegawai` VALUES (6, 25, 'Vi', 'we', '60000', '2003', 're');
INSERT INTO `riwayat_kerja_pns_pegawai` VALUES (7, 26, 'v', 'aas', '2000', '2001', 'ad');
INSERT INTO `riwayat_kerja_pns_pegawai` VALUES (8, 26, 'Vi', 'we', '60000', '2003', 're');
INSERT INTO `riwayat_kerja_pns_pegawai` VALUES (9, 27, 'v', 'aas', '2000', '2001', 'ad');
INSERT INTO `riwayat_kerja_pns_pegawai` VALUES (10, 27, 'Vi', 'we', '60000', '2003', 're');

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
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of riwayat_kerja_swasta_pegawai
-- ----------------------------
INSERT INTO `riwayat_kerja_swasta_pegawai` VALUES (1, 24, 'RS1', '2012', 'D');
INSERT INTO `riwayat_kerja_swasta_pegawai` VALUES (2, 24, 'RS2', '2010', 'W');
INSERT INTO `riwayat_kerja_swasta_pegawai` VALUES (3, 25, 'guru', '2001', 'smk it');
INSERT INTO `riwayat_kerja_swasta_pegawai` VALUES (4, 25, 'kerja', '2009', 'op');
INSERT INTO `riwayat_kerja_swasta_pegawai` VALUES (5, 26, 'guru', '2001', 'smk it');
INSERT INTO `riwayat_kerja_swasta_pegawai` VALUES (6, 26, 'kerja', '2009', 'op');
INSERT INTO `riwayat_kerja_swasta_pegawai` VALUES (7, 27, 'guru', '2001', 'smk it');
INSERT INTO `riwayat_kerja_swasta_pegawai` VALUES (8, 27, 'kerja', '2009', 'op');

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
) ENGINE = InnoDB AUTO_INCREMENT = 270 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of siswa
-- ----------------------------
INSERT INTO `siswa` VALUES (38, '101010', 'ABU ABDUL UKAIL', 11, 1, 'islam', '', '', '', '', '', '', '', 'Malang', '2021-04-12', 'Ya', '', '', '', '', '', '', NULL, NULL, '', '', '0000-00-00', '', '', '', '', '', '0000-00-00', '', '', '', 0, 0, 0, NULL, 0, 'L');
INSERT INTO `siswa` VALUES (39, '123', 'ACHMAD BALYAN  SYAUQILLAH', 11, 1, 'islam', '', '', '', '', '', '', '', '', '0000-00-00', 'Ya', '', '', '', '', '', '', NULL, NULL, '', '', '0000-00-00', '', '', '', '', '', '0000-00-00', '', '', '', 0, 0, 0, NULL, 0, 'L');
INSERT INTO `siswa` VALUES (40, '123', 'ACHMAD KOMARUDIN', 11, 1, 'islam', '', '', '', '', '', '', '', '', '0000-00-00', 'Ya', '', '', '', '', '', '', NULL, NULL, '', '', '0000-00-00', '', '', '', '', '', '0000-00-00', '', '', '', 0, 0, 0, NULL, 0, 'L');
INSERT INTO `siswa` VALUES (41, '', 'ACHMAD ZAIDAN LAZUARDI', 11, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (42, '', 'ADEL AIDE CANBERRA MUHAMMAD', 11, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (43, '', 'AFFANDIARTA AL MUSTOFA', 11, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (44, '', 'AKBAR HASIM', 11, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (45, '', 'ALTHOFANDI DHIFAN FAJRIN', 11, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (46, '', 'ANANDA PANGESTU RIZKY', 11, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (47, '', 'BARIZUL HAQ AHMAD', 11, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (48, '', 'CHAIS JUNASOR', 11, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (49, '', 'CHOIRU MAZKURI RAHMAN', 11, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (50, '', 'DURRY ABIYYU NAWWAF', 11, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (51, '', 'DWI ILHAM TABAH SAMUDRA', 11, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (52, '', 'FACHRIS FIRMAN RAMADHANI', 11, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (53, '', 'JEFRI SAPUTRO', 11, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (54, '', 'M FARID MUKHOROFI AKBAR', 11, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (55, '', 'M HANIF ZAMZAM', 11, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (56, '', 'M IRFAUR RIZKI', 11, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (57, '', 'M NAUFAL ADDAUFI', 11, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (58, '', 'M. RIFAN ARIL SABRILLA', 11, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (59, '', 'M. SEPTIAN RIZKY WIJAYA', 11, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (60, '', 'MOCHAMAD ULUL ALBAB', 11, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (61, '', 'MUCHAMAD ANTON ARDIYANSAH', 11, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (62, '', 'MUCHAMMAD ILYAS GHOFUR', 11, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (63, '', 'MUHAMMAD FATIH ZAMZAMI', 11, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (64, '', 'MUHAMMAD HUSNI MUBAROK', 11, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (65, '', 'MUHAMMAD KUMOLOJATI AL-GHOZALI', 11, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (66, '', 'MUHAMMAD SYAIFUR RIDHO', 11, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (67, '', 'MUHAMMAD VIKKY NURSYAHRONI', 11, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (68, '', 'MUKHAMMAD CHUDORI RAMADHAN', 11, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (69, '', 'RIZKY AJI BAYU SAMPURNA', 11, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (70, '', 'SYAHRUL FADLI AL MUBAROK', 11, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (71, '', 'SYAHRUL MUBAROQ', 11, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (72, '', 'TEGAR ILYASA', 11, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (73, '', 'ACHMAD AUDI RIZKI', 11, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (74, '', 'REVANZA PUTRA MAULIDANI', 11, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (75, '', 'ACHMAD ZACKY', 15, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (76, '', 'ADAM RAHMATULLOH', 15, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (77, '', 'AHMAD WILDAN MAULANA', 15, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (78, '', 'ALI ASHAR', 15, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (79, '', 'AMAR DJATI DIMAS NUGRAHA', 15, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (80, '', 'DHIMAS FIRMANSYAH', 15, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (81, '', 'KHANAYA EL FARRADZ HARAHAP', 15, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (82, '', 'MOCH. THORIQ ADIL LAIDE K.K', 15, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (83, '', 'MOCHAMMAD RIZA WIDYA CHESTA ABADI', 15, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (84, '', 'MUHAMMAD MUHIBBIL ILMI', 15, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (85, '', 'MUNAWIRUL FUADI', 15, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (86, '', 'NAUFAL AZFA MAULIDIAN', 15, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (87, '', 'RIZKI AGUNG WIBOWO', 15, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (88, '', 'SATRIA YUDHA PAMUNGKAS', 15, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (89, '', 'MISBAHUL RAFLI ALFANDI', 15, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (90, '', 'HANIF ASKAR DZIKIER', 15, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (91, '', 'ACHMAD DAFFAA SYIFA\'UN FADHILLAH', 13, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (92, '', 'ACHMAD DIAUDDIN', 13, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (93, '', 'ACHMAD FADHEL IRSYAD ZAKARIA', 13, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (94, '', 'ACHMAD SIDIQ', 13, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (95, '', 'AHMAD ABBAS FAIDILLAH', 13, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (96, '', 'AHMAD FARHAN BINTARO ALAMSYAH', 13, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (97, '', 'DIMAS DWITYA KUSUMA', 13, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (98, '', 'EKANATA WICAKSONO NUR KAMID', 13, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (99, '', 'IMAM GHOZALI', 13, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (100, '', 'I\'TADUL MUROQIY', 13, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (101, '', 'ILHAM FAHMIANSYAH', 13, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (102, '', 'M. FERDY MAULIDAN', 13, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (103, '', 'MOHAMMAD DZULKIFLI AFRIZAL AHMAD', 13, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (104, '', 'MUHAMMAD HAMZAH ALBATAMY', 13, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (105, '', 'MUHAMMAD MUJAHID ARRIDHO', 13, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (106, '', 'MUHAMMAD NUKMAN ZAINUDDIN', 13, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (107, '', 'ADEL WIBISONO', 17, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (108, '', 'AHMAD NURUDIN ISLAM', 17, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (109, '', 'AQIP IRVAN PURNOMO', 17, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (110, '', 'MUHAMMAD AMRY YUSRON', 17, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (111, '', 'MUHAMMAD FATKHUROHMAN', 17, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (112, '', 'NANDA FRIMA SETIAWAN', 17, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (113, '', 'RAFIANO ZHAKIRI', 17, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (114, '', 'ADITAMI FITRIA', 16, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (115, '', 'DEWI NAYLUL MUFIDAH', 16, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (116, '', 'JENNY CITRA HANDAYANI', 16, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (117, '', 'KHIKMATUL MAKHLUFI ANANTA', 16, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (118, '', 'NABILA FAUZI', 16, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (119, '', 'RAHAF FITRIA', 16, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (120, '', 'SINDI AULIA WARDANI', 16, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (121, '', 'AMELIA DIAN LESTARI', 14, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (122, '', 'AYU DUWI AGUSTINA', 14, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (123, '', 'FADILA AULIA SARI', 14, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (124, '', 'FATIMAH AZZAHRA', 14, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (125, '', 'MAGHFIROH BARIDATUL AFWIYA', 14, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (126, '', 'SYAYLA HANIF FAIZUNA', 14, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (127, '', 'TSALISATUL MAULIDAH', 14, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (128, '', 'VIDIA SARI', 14, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (129, '', 'ANASTASYA STEFANIE QURROTA A\'YUN', 18, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (130, '', 'AZIZATUL MAHMUDA', 18, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (131, '', 'FAMELIA NAILUN NAJWA', 18, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (132, '', 'FIORENTINA RAMADHANI', 18, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (133, '', 'INDANA ZULFA', 18, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (134, '', 'MAYANG AWRELIYA SAKHA SOMALLA', 18, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (135, '', 'NABILAH ZAHRAH ISFANTI', 18, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (136, '', 'NADZIFATUL KHOIRISMA', 18, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (137, '', 'NAILLA KUSUMA YULIANT PUTRI', 18, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (138, '', 'PUTRI SAKINATUS SHOLICHAH', 18, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (139, '', 'RANI LESTARI', 18, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (140, '', 'SANIA NURFARIKHA', 18, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (141, '', 'SAVIRA PUTRI NURHALISA', 18, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (142, '', 'SHIRLI TAHTA ADHILALI', 18, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (143, '', 'USWATUN KHASANAH', 18, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (144, '', 'WARI\'AH KHUSNANIYAH', 18, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (145, '', 'ZILDJIAN DZUN NUR\'AIN AZ-ZAHRA', 18, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (146, '', 'ACHMAD ARISY FIRMANSYAH', 19, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (147, '', 'ABDUL MU\'ID', 19, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (148, '', 'AHMAD ARIFIN ILHAM ', 19, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (149, '', 'ACHMAD BAHRUL ULUM MARZUQI', 19, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (150, '', 'ACHMAD MA\'RIFATUL FIQHI', 19, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (151, '', 'ACHMAD NIZAR', 19, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (152, '', 'ACHMAD NU\'MAN MAQBUL', 19, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (153, '', 'ACHMAD YUSRON', 19, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (154, '', 'AHMAD FARIHUR ROMADHONI', 19, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (155, '', 'ALVIO TREINADI', 19, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (156, '', 'FEBYAN AZIMMY IQBAL MAULIDANI', 19, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (157, '', 'HENDRI ', 19, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (158, '', 'MOCHAMMAD AFIEH RAZALI', 19, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (159, '', 'MUHAMMAD BIRUL WALIDAIN', 19, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (160, '', 'M.IRFAN ASROFI', 19, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (161, '', 'MOCH IRFAN SATRIO', 19, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (162, '', 'MUHAMAD IZZUDDIN FAHMI ABIDIN', 19, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (163, '', 'MUHAMMAD LUKMAN HAKIM', 19, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (164, '', 'M. MUHAIMIN ', 19, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (165, '', 'MUHAMMAD RAFLI', 19, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (166, '', 'MUHAMMAD SHOBIRIN ', 19, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (167, '', 'M. SYAIFUDDIN ZUHRI', 19, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (168, '', 'SULBI RAHMAT', 19, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (169, '', 'TEKAD INDRA PAMUNGKAS', 19, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (170, '', 'ABDUL AZIZ', 20, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (171, '', 'BAYU SATRIO PAMUNGKAS', 20, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (172, '', 'DANDI SETYOKO', 20, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (173, '', 'EMRIZAL HAMED BASSELA', 20, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (174, '', 'FIRDAUS REYHAN PRAMUDYA ANANTA', 20, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (175, '', 'HAMAM ALWI', 20, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (176, '', 'IZUL HABIBULLOH', 20, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (177, '', 'MIFTAHUS SURUR ALHISY', 20, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (178, '', 'MOCH. MAULANA RAMADHAN', 20, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (179, '', 'MOCHAMMAD IMAM FATONI', 20, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (180, '', 'MUHAMMAD BAHARUDIN MA\'RUF', 20, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (181, '', 'MUHAMMAD BINTANG RABBANI', 20, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (182, '', 'MUHAMMAD KHOIRUL ANTARIKSA', 20, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (183, '', 'MUHAMMAD MINANUR ROHMAN', 20, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (184, '', 'MUHAMMAD NAUFAL SYAFIQ AKHSANI', 20, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (185, '', 'MUHAMMAD PUTRA MAULIDANI', 20, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (186, '', 'MUHAMMAD RIF\'AN ZULKIFLI', 20, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (187, '', 'MUHAMMAD UBAIDILLAH', 20, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (188, '', 'NANDA NURUS SHOLIHIN ', 20, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (189, '', 'OSCAR GONZALES PIRY', 20, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (190, '', 'RENDI FERDIANTO', 20, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (191, '', 'ROCHIT SANTOSO', 20, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (192, '', 'SATRIA YUDHA PURNAMA ', 20, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (193, '', 'SUGENG SLAMET RIDHO\'I', 20, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (194, '', 'AFIFATUS SA\'DIAH', 23, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (195, '', 'AINUR ROHMAH', 23, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (196, '', 'AMILATUS SHOLIHAH', 23, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (197, '', 'ARIS FADHILAH', 23, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (198, '', 'DINI SEFIYAH', 23, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (199, '', 'INTAN SODIMIRANDA', 23, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (200, '', 'JUNDA ALIFIA RAHMAWATI', 23, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (201, '', 'KHOIRUN NISA AMALIA', 23, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (202, '', 'MAULIDATUN NABILA', 23, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (203, '', 'NASYWA NUR FILDZAH', 23, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (204, '', 'NIKEN HAYU WARDANI', 23, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (205, '', 'SAFINATUL ISLAMIYAH', 23, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (206, '', 'SAFITRI', 23, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (207, '', 'SHOFY MUFIDATUL UMMAH', 23, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (208, '', 'ZUHAUL FIKRIYAH', 23, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (209, '', 'ZUHRUFUL HIKMATUZ ZAHRO', 23, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (210, '', 'VIA NIKMATUL IZZA', 23, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (211, '', 'AHMAD BUSTONUL FAIDLIN', 21, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (212, '', 'DENI SYAPUTRA ', 21, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (213, '', 'FIKRI RAHMAT MAULANA', 21, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (214, '', 'FIQIH ABDILLAH SAIFUL MUSTOFA', 21, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (215, '', 'IKMAL WAFIQ ARAFAT', 21, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (216, '', 'MOCH AGUS HERMANSYAH', 21, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (217, '', 'M. AIMAR NUR ABABIEL', 21, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (218, '', 'MOCH. ALIEF WAHYUDI', 21, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (219, '', 'M. AMIEN QUTHBI', 21, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (220, '', 'MUHAMMAD HASAN ALI MAULANA', 21, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (221, '', 'M. HILDAN ISFANDIARI', 21, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (222, '', 'M. ILHAM HALIK MAULANA', 21, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (223, '', 'MUHAMMAD IQBAL ZAMZAMI', 21, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (224, '', 'M. IRFAN MUZAKKY', 21, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (225, '', 'M. NIZAR ASROFI', 21, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (226, '', 'M. NURIZ NURZAMAN', 21, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (227, '', 'M. RIFQILLAH MAZID', 21, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (228, '', 'MUHAMAD SHOFIYUDDIN \'AINURRIDLO', 21, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (229, '', 'M. YUSRIL', 21, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (230, '', 'MISBAKHUL MUNIR', 21, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (231, '', 'MUFTI ALI SHOLIHIN', 21, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (232, '', 'MUHAMMAD RAFLI ISRO\'I', 21, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (233, '', 'AHMAD ARIF SYAR\'I', 22, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (234, '', 'ABDILLAH KAMAL PASYA', 22, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (235, '', 'ANANDA MIHDAN', 22, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (236, '', 'HILDAN ACHMAD', 22, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (237, '', 'MUH. ALFAN FIKRI ADITAMA', 22, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (238, '', 'M. ARDI FIRMANSYAH', 22, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (239, '', 'MOHAMMAT FAIZUL M', 22, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (240, '', 'MUHAMMAD HAVID AMINUDIN', 22, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (241, '', 'MUHAMMAD HILMI IBROHIM', 22, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (242, '', 'MUHAMMAD MA\'RUF SHOFIUDIN', 22, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (243, '', 'MUKHAMAD SYAHRUL AZIZI', 22, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (244, '', 'MUHAMMAD SYARIFFUDIN', 22, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (245, '', 'M. TAUFIKUR ROHMAN', 22, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (246, '', 'MUHAMMAD ZAINUL ARIFIN', 22, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (247, '', 'M. ZIDANE ILMAN NAFI\' AL-ADHA', 22, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (248, '', 'MOCH. ARIF MUKLIS', 22, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (249, '', 'REZA AKBAR TAUFANI', 22, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (250, '', 'RIDHO ABDI IMANULLOH', 22, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (251, '', 'SULTON ABDUL AZIZ', 22, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (252, '', 'VILLORIAND ADIAZ DIVANA', 22, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (253, '', 'YUSUF BAKHTIAR', 22, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (254, '', 'ZAINAL ABIDIN', 22, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (255, '', 'ANNISA JIHAN FIRDAUS', 24, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (256, '', 'ARIFAH QURROTA A\'YUN', 24, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (257, '', 'ARINA MANASIKANA', 24, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (258, '', 'CHELSEA RAMADHANI', 24, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (259, '', 'ERICKA MAHDANIA AL FAIRUZZABADI', 24, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (260, '', 'FADILLA NURUSSIVA', 24, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (261, '', 'FATIMATUS ZAHRO', 24, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (262, '', 'FITRI FATCHIYAH', 24, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (263, '', 'KAYYIS MAS\'UDAH', 24, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (264, '', 'KHALYMATUS SA\'DIYAH', 24, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (265, '', 'LULUK MAFIROH', 24, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (266, '', 'MEY MAULIDIA', 24, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (267, '', 'MUBAROKATUN', 24, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (268, '', 'NOFA ALIFIYA', 24, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (269, '', 'SAFIRA YUNITA FRESTANTI', 24, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

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
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tahun_ajaran
-- ----------------------------
INSERT INTO `tahun_ajaran` VALUES (1, '2020/2021', '2020-06-07 10:07:41', 1, 'Ganjil');
INSERT INTO `tahun_ajaran` VALUES (2, '2018/2019', '2020-08-03 11:06:13', 0, 'Genap');

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
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, '127.0.0.1', 'admin', '$2y$08$mxSDKMRKsKM3IwN6NPoB6.3pQqymDu4ZtGAMIzpw.ppcie3MJM9ty', '', 'hello@admin.com', '', NULL, NULL, NULL, 1268889823, 1622537798, 1, 'admin', 'Yani', 'ADMIN', '085894632505', '3c8f6f36f650d5ce07803470b4f4d4ff.jpg', NULL, NULL, NULL);
INSERT INTO `users` VALUES (3, '127.0.0.1', 'rendy', '$2y$08$mxSDKMRKsKM3IwN6NPoB6.3pQqymDu4ZtGAMIzpw.ppcie3MJM9ty', '', 'hello@admin.com', '', NULL, NULL, NULL, 1268889823, 1621471641, 1, 'Rendy', 'Yani', 'ADMIN', '085894632505', '3c8f6f36f650d5ce07803470b4f4d4ff.jpg', 2, 'guru', 1);
INSERT INTO `users` VALUES (4, '::1', 'is_376326', '$2y$08$btIyb0KsgC.oQwjrEAo.kOtGP2v.HAIe6I7fXaGSi1D8ftrhDAKSK', NULL, 'is_376326@gmail.com', NULL, NULL, NULL, NULL, 1609057333, 1622508531, 1, 'Abdur Rochim, S.Pd.', NULL, NULL, NULL, NULL, 6, 'guru', NULL);
INSERT INTO `users` VALUES (5, '::1', 'is_559029', '$2y$08$O0X.fpQqfSjoyvdnwkwMGuizSSh2UGVW65nYjY60F3QT4c0cEAU36', NULL, 'is_559029@gmail.com', NULL, NULL, NULL, NULL, 1609057451, 1609141005, 1, 'Avi Hendratmoko, S.Kom.', NULL, NULL, NULL, NULL, 7, 'guru', NULL);
INSERT INTO `users` VALUES (6, '::1', 'is_692692', '$2y$08$IRAxfjkQv0dssEQI3d6CAeKGJyhxtcvM6jq66D2g681Oe4Z5sFB1S', NULL, 'is_692692@gmail.com', NULL, NULL, NULL, NULL, 1609057777, 1609057789, 1, 'M. Maimun Muzakka', NULL, NULL, NULL, NULL, 8, 'guru', 1);
INSERT INTO `users` VALUES (7, '::1', 'is_591727', '$2y$08$HRS9vvh3bShD9YQ6TJaaru7ypOsaB4yo8Eigjr0ueEK0A07h/H0Xa', NULL, 'is_591727@gmail.com', NULL, NULL, NULL, NULL, 1609057880, 1609057922, 1, 'Cindy Permata Putri, S.Pd', NULL, NULL, NULL, NULL, 9, 'guru', 1);
INSERT INTO `users` VALUES (8, '::1', 'is_988975', '$2y$08$wyknxv1J15BzDCWXjEF/hOj8wSYniCCfz/v9CmD6WCAiVTGX2OD.u', NULL, 'is_988975@gmail.com', NULL, NULL, NULL, NULL, 1609058009, 1621504190, 1, 'Roikhatul Uzza, S.Psi', NULL, NULL, NULL, NULL, 10, 'guru', 1);
INSERT INTO `users` VALUES (9, '::1', 'is_513197', '$2y$08$U6OjOMqa4yvru.SqWTqxpur8XEV1fYjGb4N7HV2X2W.bJ3iNBKevG', NULL, 'is_513197@gmail.com', NULL, NULL, NULL, NULL, 1609058110, 1621504214, 1, 'Nur Cholis, S.Pdi', NULL, NULL, NULL, NULL, 12, 'guru', NULL);
INSERT INTO `users` VALUES (10, '::1', 'is_477147', '$2y$08$a7i0YglvIrBrmFSHLfkGcOLq2bXdyYw6mKQPv0fd5XAdlsGq0xcAm', NULL, 'is_477147@gmail.com', NULL, NULL, NULL, NULL, 1609058143, 1609161762, 1, 'Pohet Bintoto, S.Pd., M.Si.', NULL, NULL, NULL, NULL, 13, 'guru', NULL);
INSERT INTO `users` VALUES (11, '::1', 'is_281057', '$2y$08$/sh4Fl5e6ERosaRuoY1TbeND.a2ZnIlWcecy164L.HeqgwnPN3CXe', NULL, 'is_281057@gmail.com', NULL, NULL, NULL, NULL, 1609058204, 1609058223, 1, 'Mohammad Nazibullah, M.Pd.', NULL, NULL, NULL, NULL, 14, 'guru', 1);
INSERT INTO `users` VALUES (12, '::1', 'is_950864', '$2y$08$.zH8VbjS1kSw.AaeZmn3fepcNXga0u1V4crBNyLotssKcA3pheME2', NULL, 'is_950864@gmail.com', NULL, NULL, NULL, NULL, 1609058269, 1609058286, 1, 'Syamsul Arifin, S.Pd.', NULL, NULL, NULL, NULL, 15, 'guru', NULL);
INSERT INTO `users` VALUES (13, '::1', 'is_64964', '$2y$08$PqXqWLPoMZQxAlRCI3M4sOnRk22Hl1cr3vhTTJhrXNGpH/bQLYXFq', NULL, 'is_64964@gmail.com', NULL, NULL, NULL, NULL, 1609058314, 1609058345, 1, 'M. Mirza Ayatulloh, S.Psi.', NULL, NULL, NULL, NULL, 16, 'guru', 1);
INSERT INTO `users` VALUES (14, '::1', 'is_56015', '$2y$08$16KcxEJG.1uz/KgEm29SNOJ.JaujRK4gp3qKQlsKK044ZP6jcFBii', NULL, 'is_56015@gmail.com', NULL, NULL, NULL, NULL, 1609058398, 1609141823, 1, 'Sutan Taufik, S.Hum', NULL, NULL, NULL, NULL, 17, 'guru', NULL);
INSERT INTO `users` VALUES (15, '::1', 'is_427471', '$2y$08$G46TnI8BorORyqzMbNB.Hu/VABmSGTtT8U6uwe2dmNXcoqmhugzam', NULL, 'is_427471@gmail.com', NULL, NULL, NULL, NULL, 1609058453, 1609058465, 1, 'Fatat Alvin D. N. S.', NULL, NULL, NULL, NULL, 18, 'guru', NULL);
INSERT INTO `users` VALUES (16, '::1', 'is_497512', '$2y$08$RKIXmDz2O2TLJCi.DN3vpuLBEGRXxsu7ALt6S438WHFAJIYJDmAHq', NULL, 'is_497512@gmail.com', NULL, NULL, NULL, NULL, 1609058509, 1609058530, 1, 'Nailatur Rizqiyah S.P.', NULL, NULL, NULL, NULL, 19, 'guru', 1);
INSERT INTO `users` VALUES (17, '::1', 'is_563268', '$2y$08$/PsZXKIavCasI8.GHz48lugp/SKEJH0oOJaDTek4R17azsPG7HS36', NULL, 'is_563268@gmail.com', NULL, NULL, NULL, NULL, 1609058569, 1609058580, 1, 'Saifudin Mansur, S.TP', NULL, NULL, NULL, NULL, 20, 'guru', NULL);
INSERT INTO `users` VALUES (18, '::1', 'is_372371', '$2y$08$/XfJfdVqXX0mE2KYNf6GfOPSPbhkd12YM9UjPIi1G1397y72JqPVq', NULL, 'is_372371@gmail.com', NULL, NULL, NULL, NULL, 1609058613, 1609058633, 1, 'Faridatuz Zakiyah, S.TP', NULL, NULL, NULL, NULL, 21, 'guru', NULL);
INSERT INTO `users` VALUES (19, '::1', 'is_242171', '$2y$08$2WPrn6dI0XcyCJuP.uLZcOLrZGmWDGX1xRPoJuXAbHtvmZ3zN38ba', NULL, 'is_242171@gmail.com', NULL, NULL, NULL, NULL, 1609058682, 1609058717, 1, 'Muhammad Iwan Wahyudi, S.Pd.', NULL, NULL, NULL, NULL, 22, 'guru', NULL);
INSERT INTO `users` VALUES (20, '::1', 'is_762679', '$2y$08$ZtDOeaL3wDh.2/pHqMqfRed1krO5F.qkgeQEHqXGhXuvMQxkrzKBu', NULL, 'is_762679@gmail.com', NULL, NULL, NULL, NULL, 1609058788, 1609058797, 1, 'Muhammad Yasminto, S.Pd.', NULL, NULL, NULL, NULL, 23, 'guru', NULL);
INSERT INTO `users` VALUES (21, '::1', 'is_641841', '$2y$08$VaKYWH0thKssaW0N70np/et8ev9WGT52gnpH7QKkh93mdVg3Af91q', NULL, 'is_641841@gmail.com', NULL, NULL, NULL, NULL, 1609058827, 1609923386, 1, 'Muhammad Ali Saifudin, S.Pd.', NULL, NULL, NULL, '5.png', 24, 'guru', 1);
INSERT INTO `users` VALUES (22, '::1', 'is_454070', '$2y$08$5L1Y0/zyAbZls1E2oA83huR6S9SRORbmqY9IEFQhHZVZ7tQqjZin2', NULL, 'is_454070@gmail.com', NULL, NULL, NULL, NULL, 1609058904, 1610152477, 1, 'M. Faiz Zidni Mubarok, S.Pt', NULL, NULL, NULL, NULL, 25, 'guru', 1);
INSERT INTO `users` VALUES (23, '::1', 'is_998856', '$2y$08$rTEqZyBWEcSveu75gLWTHurjCs2TBYHG5..sb9Vk8qmODZmx2Sqpu', NULL, 'is_998856@gmail.com', NULL, NULL, NULL, NULL, 1609059002, 1609059058, 1, 'Fahmi Jamaludin, S.T.', NULL, NULL, NULL, NULL, 26, 'guru', 1);

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
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of wali_kelas
-- ----------------------------
INSERT INTO `wali_kelas` VALUES (2, 2, 1, 11);
INSERT INTO `wali_kelas` VALUES (3, 26, 1, 15);
INSERT INTO `wali_kelas` VALUES (4, 25, 1, 13);
INSERT INTO `wali_kelas` VALUES (5, 25, 1, 17);
INSERT INTO `wali_kelas` VALUES (6, 10, 1, 14);
INSERT INTO `wali_kelas` VALUES (7, 10, 1, 16);
INSERT INTO `wali_kelas` VALUES (8, 10, 1, 18);
INSERT INTO `wali_kelas` VALUES (9, 14, 1, 19);
INSERT INTO `wali_kelas` VALUES (10, 24, 1, 20);
INSERT INTO `wali_kelas` VALUES (11, 19, 1, 23);
INSERT INTO `wali_kelas` VALUES (12, 8, 1, 21);
INSERT INTO `wali_kelas` VALUES (13, 16, 1, 22);
INSERT INTO `wali_kelas` VALUES (14, 9, 1, 24);

-- ----------------------------
-- View structure for v_bank_soal_quiz
-- ----------------------------
DROP VIEW IF EXISTS `v_bank_soal_quiz`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_bank_soal_quiz` AS SELECT
bank_soal.id_bank_soal,
bank_soal.soal,
bank_soal.time_soal,
bank_soal.code_soal,
bank_soal.idmatapelajaran_fk,
bank_soal.idguru_fk,
question_cas.id_question_cas,
question_cas.type,
question_cas.idbanksoal_fk,
question_cas.idquiz_fk
FROM
bank_soal
INNER JOIN question_cas ON question_cas.idbanksoal_fk = bank_soal.id_bank_soal ;

-- ----------------------------
-- View structure for v_guru_mapel
-- ----------------------------
DROP VIEW IF EXISTS `v_guru_mapel`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_guru_mapel` AS SELECT
guru.id_guru,
guru.nama,
guru.nip,
guru.alamat,
guru.agama,
guru.foto,
guru.pendidikan_terakhir,
guru.instansi,
guru.fb,
guru.ig,
guru.twitter,
guru.youtube,
guru.jabatan,
guru.email,
guru.no_hp,
guru_mapel.id_guru_mapel,
guru_mapel.idguru_fk,
guru_mapel.idmapel_fk,
guru_mapel.idkelas_fk,
mata_pelajaran.id_mata_pelajaran,
mata_pelajaran.mata_pelajaran,
mata_pelajaran.kode,
kelas.id_kelas,
kelas.kelas,
kelas.idtingkat_fk,
kelas.create_at,
kelas.idjurusan_fk,
kelas.idtahunajaran_fk,
tahun_ajaran.id_tahun_ajaran,
tahun_ajaran.tahun_ajaran,
tahun_ajaran.is_active,
tahun_ajaran.semester,
mata_pelajaran.idjenismatapelajaran_fk
FROM
guru
INNER JOIN guru_mapel ON guru_mapel.idguru_fk = guru.id_guru
INNER JOIN mata_pelajaran ON guru_mapel.idmapel_fk = mata_pelajaran.id_mata_pelajaran
INNER JOIN kelas ON kelas.id_kelas = guru_mapel.idkelas_fk
INNER JOIN tahun_ajaran ON tahun_ajaran.id_tahun_ajaran = guru_mapel.idtahunajaran_fk ;

-- ----------------------------
-- View structure for v_nilai_keterampilan
-- ----------------------------
DROP VIEW IF EXISTS `v_nilai_keterampilan`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_nilai_keterampilan` AS SELECT
input_nilai_keterampilan.id_input_nilai_keterampilan,
input_nilai_keterampilan.idmatapelajaran_fk,
input_nilai_keterampilan.idtahunajaran_fk,
input_nilai_keterampilan.trans_code,
input_nilai_keterampilan.idguru_fk,
input_nilai_keterampilan.idkelas_fk,
input_nilai_keterampilan.idjenisketerampilan_fk,
nilai_keterampilan.id_nilai_keterampilan,
nilai_keterampilan.idsiswa_fk,
nilai_keterampilan.nilai,
nilai_keterampilan.idinputnilaiketerampilan_fk,
nilai_keterampilan.create_at,
nilai_keterampilan.idkd_fk
FROM
input_nilai_keterampilan
INNER JOIN nilai_keterampilan ON input_nilai_keterampilan.id_input_nilai_keterampilan = nilai_keterampilan.idinputnilaiketerampilan_fk ;

-- ----------------------------
-- View structure for v_nilai_pas
-- ----------------------------
DROP VIEW IF EXISTS `v_nilai_pas`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_nilai_pas` AS SELECT
input_nilai_pas.id_input_nilai_pas,
input_nilai_pas.idmatapelajaran_fk,
input_nilai_pas.idtahunajaran_fk,
input_nilai_pas.trans_code,
input_nilai_pas.idguru_fk,
input_nilai_pas.idkelas_fk,
nilai_pas.id_nilai_pas,
nilai_pas.idsiswa_fk,
nilai_pas.nilai,
nilai_pas.idinputnilaipas_fk,
nilai_pas.create_at
FROM
input_nilai_pas
INNER JOIN nilai_pas ON input_nilai_pas.id_input_nilai_pas = nilai_pas.idinputnilaipas_fk ;

-- ----------------------------
-- View structure for v_nilai_pengetahuan
-- ----------------------------
DROP VIEW IF EXISTS `v_nilai_pengetahuan`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_nilai_pengetahuan` AS SELECT
nilai_pengetahuan.id_nilai_pengetahuan,
nilai_pengetahuan.idsiswa_fk,
nilai_pengetahuan.nilai,
nilai_pengetahuan.idinputnilaipengetahuan_fk,
nilai_pengetahuan.create_at,
nilai_pengetahuan.idkd_fk,
input_nilai_pengetahuan.id_input_nilai_pengetahuan,
input_nilai_pengetahuan.idmatapelajaran_fk,
input_nilai_pengetahuan.idtahunajaran_fk,
input_nilai_pengetahuan.trans_code,
input_nilai_pengetahuan.idguru_fk,
input_nilai_pengetahuan.idkelas_fk,
input_nilai_pengetahuan.idjenispengetahuan_fk
FROM
nilai_pengetahuan
INNER JOIN input_nilai_pengetahuan ON input_nilai_pengetahuan.id_input_nilai_pengetahuan = nilai_pengetahuan.idinputnilaipengetahuan_fk ;

-- ----------------------------
-- View structure for v_nilai_pts
-- ----------------------------
DROP VIEW IF EXISTS `v_nilai_pts`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_nilai_pts` AS SELECT
input_nilai_pts.id_input_nilai_pts,
input_nilai_pts.idmatapelajaran_fk,
input_nilai_pts.idtahunajaran_fk,
input_nilai_pts.trans_code,
input_nilai_pts.idguru_fk,
input_nilai_pts.idkelas_fk,
nilai_pts.id_nilai_pts,
nilai_pts.idsiswa_fk,
nilai_pts.nilai,
nilai_pts.idinputnilaipts_fk,
nilai_pts.create_at
FROM
input_nilai_pts
INNER JOIN nilai_pts ON input_nilai_pts.id_input_nilai_pts = nilai_pts.idinputnilaipts_fk ;

-- ----------------------------
-- View structure for v_pelanggaran_siswa
-- ----------------------------
DROP VIEW IF EXISTS `v_pelanggaran_siswa`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_pelanggaran_siswa` AS SELECT
pelanggaran_siswa.id_pelanggaran_siswa,
pelanggaran_siswa.tanggal,
pelanggaran_siswa.uraian_pelanggaran,
pelanggaran_siswa.idpoinpelanggaran_fk,
pelanggaran_siswa.idsiswa_fk,
poin_pelanggaran.id_poin_pelanggaran,
poin_pelanggaran.idjenispelanggaran_fk,
poin_pelanggaran.nama_pelanggaran,
poin_pelanggaran.poin,
poin_pelanggaran.kode_pelanggaran,
jenis_pelanggaran.id_jenis_pelanggaran,
jenis_pelanggaran.jenis_pelanggaran
FROM
pelanggaran_siswa
LEFT JOIN poin_pelanggaran ON poin_pelanggaran.id_poin_pelanggaran = pelanggaran_siswa.idpoinpelanggaran_fk
LEFT JOIN jenis_pelanggaran ON jenis_pelanggaran.id_jenis_pelanggaran = poin_pelanggaran.idjenispelanggaran_fk ;

-- ----------------------------
-- View structure for v_pkg
-- ----------------------------
DROP VIEW IF EXISTS `v_pkg`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_pkg` AS SELECT
component_penilaian_kinerja_guru.idpenilaiankinerjaguru_fk,
penilaian_kinerja_guru.id_penilaian_kinerja_guru,
penilaian_kinerja_guru.idguru_fk,
penilaian_kinerja_guru.bulan,
penilaian_kinerja_guru.tahun,
penilaian_kinerja_guru.idtahunajaran_fk,
penilaian_kinerja_guru.create_at,
penilaian_kinerja_guru.trans_code,
component_penilaian_kinerja_guru.id_component_penilaian_kinerja_guru,
component_penilaian_kinerja_guru.idsubkompetensipkg_fk,
component_penilaian_kinerja_guru.nilai
FROM
penilaian_kinerja_guru
INNER JOIN component_penilaian_kinerja_guru ON penilaian_kinerja_guru.id_penilaian_kinerja_guru = component_penilaian_kinerja_guru.idpenilaiankinerjaguru_fk ;

-- ----------------------------
-- View structure for v_poin_pelanggaran
-- ----------------------------
DROP VIEW IF EXISTS `v_poin_pelanggaran`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_poin_pelanggaran` AS SELECT
poin_pelanggaran.id_poin_pelanggaran,
poin_pelanggaran.idjenispelanggaran_fk,
poin_pelanggaran.nama_pelanggaran,
poin_pelanggaran.poin,
poin_pelanggaran.kode_pelanggaran,
jenis_pelanggaran.id_jenis_pelanggaran,
jenis_pelanggaran.jenis_pelanggaran
FROM
poin_pelanggaran
INNER JOIN jenis_pelanggaran ON jenis_pelanggaran.id_jenis_pelanggaran = poin_pelanggaran.idjenispelanggaran_fk ;

-- ----------------------------
-- View structure for v_siswa_jurusan
-- ----------------------------
DROP VIEW IF EXISTS `v_siswa_jurusan`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_siswa_jurusan` AS SELECT
siswa.id_siswa,
siswa.nis,
siswa.nama,
siswa.idkelas_fk,
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
siswa.jenis_kelamin,
kelas.id_kelas,
kelas.kelas,
kelas.idtingkat_fk,
kelas.create_at,
kelas.idtahunajaran_fk,
jurusan.id_jurusan,
jurusan.jurusan,
jurusan.singkatan
FROM
siswa
INNER JOIN kelas ON kelas.id_kelas = siswa.idkelas_fk
INNER JOIN jurusan ON jurusan.id_jurusan = siswa.idjurusan_fk ;

-- ----------------------------
-- View structure for v_walas
-- ----------------------------
DROP VIEW IF EXISTS `v_walas`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_walas` AS SELECT
wali_kelas.id_wali_kelas,
wali_kelas.idguru_fk,
wali_kelas.idtahunajaran_fk,
wali_kelas.idkelas_fk,
kelas.id_kelas,
kelas.kelas,
kelas.idtingkat_fk,
kelas.idjurusan_fk,
tingkat.id_tingkat,
tingkat.tingkat,
jurusan.id_jurusan,
jurusan.jurusan,
jurusan.singkatan
FROM
wali_kelas
LEFT JOIN kelas ON wali_kelas.idkelas_fk = kelas.id_kelas
LEFT JOIN tingkat ON kelas.idtingkat_fk = tingkat.id_tingkat
LEFT JOIN jurusan ON kelas.idjurusan_fk = jurusan.id_jurusan ;

SET FOREIGN_KEY_CHECKS = 1;
