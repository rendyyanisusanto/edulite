/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 100138
 Source Host           : localhost:3306
 Source Schema         : edukit

 Target Server Type    : MySQL
 Target Server Version : 100138
 File Encoding         : 65001

 Date: 17/12/2020 07:38:16
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
) ENGINE = InnoDB AUTO_INCREMENT = 173 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of absensi
-- ----------------------------
INSERT INTO `absensi` VALUES (152, 51, '2020-09-23', 5, 1, '', 1, 2, 21, '2020-09-23 14:23:48');
INSERT INTO `absensi` VALUES (153, 52, '2020-09-23', 5, 1, '', 1, 2, 21, '2020-09-23 14:23:48');
INSERT INTO `absensi` VALUES (154, 53, '2020-09-23', 5, 0, 'sakit', 1, 2, 21, '2020-09-23 14:23:48');
INSERT INTO `absensi` VALUES (155, 54, '2020-09-23', 5, 1, '', 1, 2, 21, '2020-09-23 14:23:48');
INSERT INTO `absensi` VALUES (156, 55, '2020-09-23', 5, 1, '', 1, 2, 21, '2020-09-23 14:23:49');
INSERT INTO `absensi` VALUES (157, 56, '2020-09-23', 5, 1, '', 1, 2, 21, '2020-09-23 14:23:49');
INSERT INTO `absensi` VALUES (158, 57, '2020-09-23', 5, 1, '', 1, 2, 21, '2020-09-23 14:23:49');
INSERT INTO `absensi` VALUES (159, 58, '2020-09-23', 5, 1, '', 1, 2, 21, '2020-09-23 14:23:49');
INSERT INTO `absensi` VALUES (160, 59, '2020-09-23', 5, 1, '', 1, 2, 21, '2020-09-23 14:23:49');
INSERT INTO `absensi` VALUES (161, 60, '2020-09-23', 5, 0, '', 1, 2, 21, '2020-09-23 14:23:49');
INSERT INTO `absensi` VALUES (162, 61, '2020-09-23', 5, 1, '', 1, 2, 21, '2020-09-23 14:23:49');
INSERT INTO `absensi` VALUES (163, 62, '2020-09-23', 5, 1, '', 1, 2, 21, '2020-09-23 14:23:49');
INSERT INTO `absensi` VALUES (164, 63, '2020-09-23', 5, 0, '', 1, 2, 21, '2020-09-23 14:23:49');
INSERT INTO `absensi` VALUES (165, 64, '2020-09-23', 5, 1, '', 1, 2, 21, '2020-09-23 14:23:49');
INSERT INTO `absensi` VALUES (166, 65, '2020-09-23', 5, 1, '', 1, 2, 21, '2020-09-23 14:23:49');
INSERT INTO `absensi` VALUES (167, 66, '2020-09-23', 5, 1, '', 1, 2, 21, '2020-09-23 14:23:49');
INSERT INTO `absensi` VALUES (168, 67, '2020-09-23', 5, 1, '', 1, 2, 21, '2020-09-23 14:23:49');
INSERT INTO `absensi` VALUES (169, 68, '2020-09-23', 5, 0, '', 1, 2, 21, '2020-09-23 14:23:49');
INSERT INTO `absensi` VALUES (170, 69, '2020-09-23', 5, 1, '', 1, 2, 21, '2020-09-23 14:23:49');
INSERT INTO `absensi` VALUES (171, 70, '2020-09-23', 5, 0, 'asd', 1, 2, 21, '2020-09-23 14:23:49');
INSERT INTO `absensi` VALUES (172, 71, '2020-09-23', 5, 1, '', 1, 2, 21, '2020-09-23 14:23:49');

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
) ENGINE = InnoDB AUTO_INCREMENT = 99 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ans_bank_soal
-- ----------------------------
INSERT INTO `ans_bank_soal` VALUES (11, 5, '<p>Saya akan membelikan PC dengan spesifikasi processor dan komponen lain biasa</p>\r\n', 5.00);
INSERT INTO `ans_bank_soal` VALUES (12, 5, '<p>Saya akan membelikan PC dengan spesifikasi hardisk yang tinggi dan komponen lain biasa</p>\r\n', 10.00);
INSERT INTO `ans_bank_soal` VALUES (13, 5, '<p>Saya akan membelikan PC dengan spesifikasi vga yang tinggi dan komponen lain biasa</p>\r\n', 2.00);
INSERT INTO `ans_bank_soal` VALUES (14, 5, '<p>Saya akan membelikan PC dengan spesifikasi bandwith yang tinggi dan komponen lain biasa</p>\r\n', 3.00);
INSERT INTO `ans_bank_soal` VALUES (17, 6, '<p>Saya akan meninggikan processor dan ram, spesifikasi lainnya biasa saja</p>\r\n', 10.00);
INSERT INTO `ans_bank_soal` VALUES (18, 6, '<p>Saya akan meninggikan hardisk dan ssd, spesifikasi lainnya biasa saja</p>\r\n', 5.00);
INSERT INTO `ans_bank_soal` VALUES (19, 6, '<p>Saya akan meinggikan ram dan hardisk, spesifikasi lainnya biasa saja</p>\r\n', 7.00);
INSERT INTO `ans_bank_soal` VALUES (20, 6, '<p>Saya akan meinggikan VGA dan hardisk, spesifikasi lainnya biasa saja</p>\r\n', 1.00);
INSERT INTO `ans_bank_soal` VALUES (21, 7, '<p>Punya Skill Tinggi tapi kurang dalam K3LH</p>\r\n', 5.00);
INSERT INTO `ans_bank_soal` VALUES (22, 7, '<p>Skill biasa tapi K3LHnya tinggi</p>\r\n', 10.00);
INSERT INTO `ans_bank_soal` VALUES (23, 8, '<p>notepad</p>\r\n', 3.00);
INSERT INTO `ans_bank_soal` VALUES (24, 8, '<p>Dev C++</p>\r\n', 10.00);
INSERT INTO `ans_bank_soal` VALUES (25, 8, '<p>MinGW</p>\r\n', 10.00);
INSERT INTO `ans_bank_soal` VALUES (26, 8, '<p>Notepad</p>\r\n', 1.00);
INSERT INTO `ans_bank_soal` VALUES (27, 9, '<p>Cout</p>\r\n', 0.00);
INSERT INTO `ans_bank_soal` VALUES (28, 9, '<p>Dev</p>\r\n', 10.00);
INSERT INTO `ans_bank_soal` VALUES (29, 9, '<p>Gout</p>\r\n', 10.00);
INSERT INTO `ans_bank_soal` VALUES (30, 9, '<p>Cin</p>\r\n', 0.00);
INSERT INTO `ans_bank_soal` VALUES (31, 10, '<p>Semua program komputer yang sedang berjalan akan menyimpan data sementara di dalam RAM (Random Access Memori).</p>\r\n', 10.00);
INSERT INTO `ans_bank_soal` VALUES (32, 10, '<p>Semua program komputer yang sedang berjalan akan menyimpan data sementara di dalam Monitor</p>\r\n', 0.00);
INSERT INTO `ans_bank_soal` VALUES (33, 10, '<p>Semua program komputer yang sedang berjalan akan menyimpan data sementara di dalam c++</p>\r\n', 10.00);
INSERT INTO `ans_bank_soal` VALUES (34, 10, '<p>Semua program komputer yang sedang berjalan akan menyimpan data sementara di dalam Processor</p>\r\n', 0.00);
INSERT INTO `ans_bank_soal` VALUES (35, 11, '<p>Cek kabel monitor terlebih dahulu lalu cek VGA</p>\r\n', 10.00);
INSERT INTO `ans_bank_soal` VALUES (36, 11, '<p>Cek VGA kemudian Cek RAM dan motherboard</p>\r\n', 7.00);
INSERT INTO `ans_bank_soal` VALUES (37, 11, '<p>Cek Power Suply dan VGA</p>\r\n', 5.00);
INSERT INTO `ans_bank_soal` VALUES (38, 11, '<p>Cek RAM dan Monitor</p>\r\n', 5.00);
INSERT INTO `ans_bank_soal` VALUES (39, 12, '<p>CIN</p>\r\n', 0.00);
INSERT INTO `ans_bank_soal` VALUES (40, 12, '<p>Printf</p>\r\n', 10.00);
INSERT INTO `ans_bank_soal` VALUES (41, 12, '<p>Scanf</p>\r\n', 0.00);
INSERT INTO `ans_bank_soal` VALUES (42, 12, '<p>Cout</p>\r\n', 10.00);
INSERT INTO `ans_bank_soal` VALUES (43, 13, '<p>Saya akan membuatkan beliau program C++</p>\r\n', 1.00);
INSERT INTO `ans_bank_soal` VALUES (44, 13, '<p>Saya akan membuatkan website dari wordpress</p>\r\n', 10.00);
INSERT INTO `ans_bank_soal` VALUES (45, 13, '<p>saya akan membuatkan website dari html</p>\r\n', 8.00);
INSERT INTO `ans_bank_soal` VALUES (46, 13, '<p>saya akan membantu beliau dengan cara hacking</p>\r\n', 2.00);
INSERT INTO `ans_bank_soal` VALUES (47, 14, '<p>Membantu mencari data</p>\r\n', 2.00);
INSERT INTO `ans_bank_soal` VALUES (48, 14, '<p>Membuatkan aplikasi untuk penyimpanan data</p>\r\n', 8.00);
INSERT INTO `ans_bank_soal` VALUES (49, 14, '<p>Membuatkan sistem penyimpanan dan pengaksesan data</p>\r\n', 10.00);
INSERT INTO `ans_bank_soal` VALUES (50, 14, '<p>Membuatkan internet of things untuk mempermudah</p>\r\n', 5.00);
INSERT INTO `ans_bank_soal` VALUES (51, 15, '<p>Alur Pemrograman</p>\r\n', 1.00);
INSERT INTO `ans_bank_soal` VALUES (52, 15, '<p>Logika</p>\r\n', 3.00);
INSERT INTO `ans_bank_soal` VALUES (53, 15, '<p>Algoritma</p>\r\n', 10.00);
INSERT INTO `ans_bank_soal` VALUES (54, 15, '<p>Pemrograman</p>\r\n', 1.00);
INSERT INTO `ans_bank_soal` VALUES (55, 16, '<p>Bahasa Natural</p>\r\n', 10.00);
INSERT INTO `ans_bank_soal` VALUES (56, 16, '<p>Pseudocode</p>\r\n', 10.00);
INSERT INTO `ans_bank_soal` VALUES (57, 16, '<p>Dev C++</p>\r\n', 1.00);
INSERT INTO `ans_bank_soal` VALUES (58, 16, '<p>Flowchart</p>\r\n', 10.00);
INSERT INTO `ans_bank_soal` VALUES (59, 17, '<p>alamat</p>\r\n', 1.00);
INSERT INTO `ans_bank_soal` VALUES (60, 17, '<p>Agama</p>\r\n', 3.00);
INSERT INTO `ans_bank_soal` VALUES (61, 17, '<p>Buku</p>\r\n', 1.00);
INSERT INTO `ans_bank_soal` VALUES (62, 17, '<p>tahun lahir</p>\r\n', 10.00);
INSERT INTO `ans_bank_soal` VALUES (63, 18, '<p>nama sekolah</p>\r\n', 1.00);
INSERT INTO `ans_bank_soal` VALUES (64, 18, '<p>nama_sekolah</p>\r\n', 10.00);
INSERT INTO `ans_bank_soal` VALUES (65, 18, '<p>tanggal lahir</p>\r\n', 1.00);
INSERT INTO `ans_bank_soal` VALUES (66, 18, '<p>tanggal_lahir</p>\r\n', 10.00);
INSERT INTO `ans_bank_soal` VALUES (67, 19, '<p>Angka</p>\r\n', 10.00);
INSERT INTO `ans_bank_soal` VALUES (68, 19, '<p>Huruf</p>\r\n', 2.00);
INSERT INTO `ans_bank_soal` VALUES (69, 19, '<p>Karakter</p>\r\n', 4.00);
INSERT INTO `ans_bank_soal` VALUES (70, 19, '<p>Benar/Salah</p>\r\n', 1.00);
INSERT INTO `ans_bank_soal` VALUES (71, 20, '<p>Benar</p>\r\n', 2.00);
INSERT INTO `ans_bank_soal` VALUES (72, 20, '<p>Salah</p>\r\n', 10.00);
INSERT INTO `ans_bank_soal` VALUES (73, 20, '<p>Semua Benar</p>\r\n', 1.00);
INSERT INTO `ans_bank_soal` VALUES (74, 20, '<p>Semua Salah</p>\r\n', 0.00);
INSERT INTO `ans_bank_soal` VALUES (75, 21, '<p>Benar</p>\r\n', 10.00);
INSERT INTO `ans_bank_soal` VALUES (76, 21, '<p>Salah</p>\r\n', 2.00);
INSERT INTO `ans_bank_soal` VALUES (77, 21, '<p>Semua Benar</p>\r\n', 1.00);
INSERT INTO `ans_bank_soal` VALUES (78, 21, '<p>Semua Salah</p>\r\n', 1.00);
INSERT INTO `ans_bank_soal` VALUES (79, 22, '<p>Logika</p>\r\n', 3.00);
INSERT INTO `ans_bank_soal` VALUES (80, 22, '<p>Percabangan</p>\r\n', 10.00);
INSERT INTO `ans_bank_soal` VALUES (81, 22, '<p>Perulangan</p>\r\n', 10.00);
INSERT INTO `ans_bank_soal` VALUES (82, 22, '<p>Algoritma</p>\r\n', 2.00);
INSERT INTO `ans_bank_soal` VALUES (83, 23, '<p>Algoritma</p>\r\n', 5.00);
INSERT INTO `ans_bank_soal` VALUES (84, 23, '<p>Diagram Gambar</p>\r\n', 2.00);
INSERT INTO `ans_bank_soal` VALUES (85, 23, '<p>Diagram Alir</p>\r\n', 10.00);
INSERT INTO `ans_bank_soal` VALUES (86, 23, '<p>Diagram Grafik</p>\r\n', 2.00);
INSERT INTO `ans_bank_soal` VALUES (87, 24, '<p>Input</p>\r\n', 3.00);
INSERT INTO `ans_bank_soal` VALUES (88, 24, '<p>Proses</p>\r\n', 10.00);
INSERT INTO `ans_bank_soal` VALUES (89, 24, '<p>Output</p>\r\n', 3.00);
INSERT INTO `ans_bank_soal` VALUES (90, 24, '<p>Mulai</p>\r\n', 3.00);
INSERT INTO `ans_bank_soal` VALUES (91, 25, '<p>Input</p>\r\n', 3.00);
INSERT INTO `ans_bank_soal` VALUES (92, 25, '<p>Proses</p>\r\n', 3.00);
INSERT INTO `ans_bank_soal` VALUES (93, 25, '<p>Output</p>\r\n', 3.00);
INSERT INTO `ans_bank_soal` VALUES (94, 25, '<p>Mulai/Selesai</p>\r\n', 10.00);
INSERT INTO `ans_bank_soal` VALUES (95, 26, '<p>Bahasa Natural</p>\r\n', 3.00);
INSERT INTO `ans_bank_soal` VALUES (96, 26, '<p>Bahasa Pemrograman</p>\r\n', 1.00);
INSERT INTO `ans_bank_soal` VALUES (97, 26, '<p>Bahasa Fundamental</p>\r\n', 1.00);
INSERT INTO `ans_bank_soal` VALUES (98, 26, '<p>Bahasa gambar/simbol</p>\r\n', 10.00);

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
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of bank_soal
-- ----------------------------
INSERT INTO `bank_soal` VALUES (5, '<p>Sebuah negara membutuhkan teknologi untuk menyimpan data penduduk, data penduduk tersebut memiliki jumlah yaitu 120 juta penduduk. Anda sebagai seorang ahli jaringan ditunjuk untuk merekomendasikan pembelian sebuah komputer server. Spesifikasi apakah yang akan anda tinggikan (asumsi hanya untuk melakukan penyimpanan data)</p>\r\n', 1, 'Q-45999', 1, 2);
INSERT INTO `bank_soal` VALUES (6, '<p>Sebuah negara membutuhkan teknologi kependudukan dengan fungsi penduduk bisa melakukan akses terhadap data KTP yang telah tersimpan di server, data penduduk tersebut memiliki jumlah yaitu 120 juta penduduk. Anda sebagai seorang ahli jaringan ditunjuk untuk merekomendasikan pembelian sebuah komputer server. Spesifikasi apakah yang akan anda tinggikan&nbsp;</p>\r\n', 1, 'Q-793', 1, 2);
INSERT INTO `bank_soal` VALUES (7, '<p>Pada sebuah perusahaan multinasional baru, anda ditunjuk sebagai direktur teknologi. anda akan merekrut karyawan baru dengan pertimbangan keselamatan kerja. maka karyawan yang bagaimana yang akan anda ambil</p>\r\n', 1, 'Q-1276', 1, 2);
INSERT INTO `bank_soal` VALUES (8, '<p>Programming C++ bisa dikerjakan melalui ?</p>\r\n', 1, 'Q-44614', 1, 2);
INSERT INTO `bank_soal` VALUES (9, '<p>Perintah yang ada di C++. <strong>Kecuali?</strong></p>\r\n', 1, 'Q-35098', 1, 2);
INSERT INTO `bank_soal` VALUES (10, '<p>Apa yang dimaksud dengan variabel di C++</p>\r\n', 1, 'Q-44609', 1, 2);
INSERT INTO `bank_soal` VALUES (11, '<p>Apa yang akan saya lakukan ketika&nbsp;sebuah komputer tidak menampilkan gambar di monitor</p>\r\n', 1, 'Q-53350', 1, 2);
INSERT INTO `bank_soal` VALUES (12, '<p>Apa perintah di C++ untuk menampilkan sesuatu</p>\r\n', 1, 'Q-38296', 1, 2);
INSERT INTO `bank_soal` VALUES (13, '<p>Tetangga saya memiliki toko, kemudian beliau menginginkan toko tersebut bisa dilihat atau dibeli oleh orang selain yang ada di daerahnya. apa solusi anda untuk permintaan beliau</p>\r\n', 1, 'Q-69888', 1, 2);
INSERT INTO `bank_soal` VALUES (14, '<p>Pak Rochim adalah seorang kepala sekolah SMK IT Asy-Syadzili, beliau bertugas untuk memberikan keputusan di SMK. Pekerjaan beliau sangat membutuhkan data siswa. akan tetapi, ketika meminta data kepada staffnya, mereka kesulitan mencari.</p>\r\n\r\n<p>apa solusi saudara untuk memudahkan pak rochim</p>\r\n', 1, 'Q-7817', 1, 2);
INSERT INTO `bank_soal` VALUES (15, '<p>Urutan Langkah-langkah (instruksi /aksi) yang disusun secara sistematis untuk menyelesaikan sebuah masalah adalah ?</p>\r\n', 1, 'Q-23248', 1, 2);
INSERT INTO `bank_soal` VALUES (16, '<p>Teknik penulisan bahasa pemrograman yang benar adalah menggunakan</p>\r\n', 1, 'Q-32060', 1, 2);
INSERT INTO `bank_soal` VALUES (17, '<p>Variabel berikut yang termasuk variabel numerik yaitu</p>\r\n', 1, 'Q-26902', 1, 2);
INSERT INTO `bank_soal` VALUES (18, '<p>Cara penulisan variabel yang benar yaitu</p>\r\n', 1, 'Q-35876', 1, 2);
INSERT INTO `bank_soal` VALUES (19, '<p>Tipe data integer adalah</p>\r\n', 1, 'Q-69739', 1, 2);
INSERT INTO `bank_soal` VALUES (20, '<p>Perhatikan Algoritma berikut :</p>\r\n\r\n<blockquote>\r\n<p>1. Mulai</p>\r\n\r\n<p>2. Baca Input X</p>\r\n\r\n<p>3. Baca Input Y</p>\r\n\r\n<p>4. Jika X &gt; Y maka nilai benar, jika tidak maka nilai salah</p>\r\n\r\n<p>5. Tampilkan nilai</p>\r\n\r\n<p>6. Selesai</p>\r\n</blockquote>\r\n\r\n<p>Jika X = 5, Y = 6. Maka nilai yang ditampilkan adalah.........</p>\r\n', 1, 'Q-92703', 1, 2);
INSERT INTO `bank_soal` VALUES (21, '<p>Perhatikan Algoritma berikut :</p>\r\n\r\n<blockquote>\r\n<p>1. Mulai</p>\r\n\r\n<p>2. Baca Input X</p>\r\n\r\n<p>3. Baca Input Y</p>\r\n\r\n<p>4. Jika X &gt; Y maka nilai benar, jika tidak maka nilai salah</p>\r\n\r\n<p>5. Tampilkan nilai</p>\r\n\r\n<p>6. Selesai</p>\r\n</blockquote>\r\n\r\n<p>Jika X = 6, Y = 5. Maka nilai yang ditampilkan adalah.........</p>\r\n', 1, 'Q-20588', 1, 2);
INSERT INTO `bank_soal` VALUES (22, '<p>Untuk menyatakan sebuah kondisi dalam algoritma pemrograman disebut...</p>\r\n', 1, 'Q-64716', 1, 2);
INSERT INTO `bank_soal` VALUES (23, '<p>Flowchart adalah.........</p>\r\n', 1, 'Q-76454', 1, 2);
INSERT INTO `bank_soal` VALUES (24, '<p>Simbol <strong>persegi panjang</strong> pada flowchart menunjukkan ?</p>\r\n', 1, 'Q-515', 1, 2);
INSERT INTO `bank_soal` VALUES (25, '<p>Simbol <strong>Elips&nbsp;</strong>pada flowchart menunjukkan ?</p>\r\n', 1, 'Q-89137', 1, 2);
INSERT INTO `bank_soal` VALUES (26, '<p>Flowchart adalah metode penulisan algoritma menggunakan</p>\r\n', 1, 'Q-98771', 1, 2);

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
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of buku_pemanggilan_siswa
-- ----------------------------
INSERT INTO `buku_pemanggilan_siswa` VALUES (1, 95, 'a', 'vb', 's', 'ad', NULL, '2020-12-14', 'BK-199401767791');
INSERT INTO `buku_pemanggilan_siswa` VALUES (2, 95, NULL, NULL, NULL, NULL, NULL, '2020-12-16', NULL);

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
  PRIMARY KEY (`id_buku_tamu`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of buku_tamu
-- ----------------------------
INSERT INTO `buku_tamu` VALUES (1, 'iuoi', 'juu', 'iuio', '2020-08-19', '2020-08-19 11:18:10');

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
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of component_jadwal
-- ----------------------------
INSERT INTO `component_jadwal` VALUES (1, '2020-08-18', 1, 2, 1, 21);
INSERT INTO `component_jadwal` VALUES (2, '2020-08-18', 1, 2, 1, 22);

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
-- Table structure for groups
-- ----------------------------
DROP TABLE IF EXISTS `groups`;
CREATE TABLE `groups`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of groups
-- ----------------------------
INSERT INTO `groups` VALUES (1, 'admin', 'Administrator');
INSERT INTO `groups` VALUES (2, 'siswa', 'Siswa');
INSERT INTO `groups` VALUES (3, 'guru', 'Guru');
INSERT INTO `groups` VALUES (4, 'staff', 'Staff');
INSERT INTO `groups` VALUES (5, 'kepsek', 'kepsek');
INSERT INTO `groups` VALUES (6, 'kurikulum', 'kurikulum');

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
INSERT INTO `guru` VALUES (2, 'Rendy Yani Susanto', '121', 'Malang', 'Rendy-Yani-Susanto-IT-Department.jpeg', 'S1', 'Universitas Brawijaya', 'Rendy', 'rendy', 'rendy', 'rendy', 'Guru dan Programmer', 'rendy@smkitasy-syadzili.sch.id', '6285894632505', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'K001', NULL, NULL, NULL, NULL);
INSERT INTO `guru` VALUES (6, 'Abdur Rochim', '1234', 'Singosari', '91b83a0188e13986037d70730a65daa8.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'K002', NULL, NULL, NULL, NULL);
INSERT INTO `guru` VALUES (7, 'Avi Hendratmoko', '-', 'Dsn Prapatan RT 038 RW 005 Tulusbesar Kec. Tumpang Kab. Malang Jawa Timur', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'K003', NULL, NULL, NULL, NULL);
INSERT INTO `guru` VALUES (8, 'Maimun Muzzaka', '123', 'malang', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'K004', NULL, NULL, NULL, NULL);
INSERT INTO `guru` VALUES (9, 'Cindy Permata Putri, S.Pd', NULL, 'Bugis, Saptorenggo', 'bucin.jpg', 'S1', 'IKIP Budi Utomo', '-', 'https://www.instagram.com/cindyputrii95/', 'Cindy', '-', 'Guru Bahasa Indonesia', 'Cindy@smkitasy-syadzili.sch.id', '6285895839663', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'K005', NULL, NULL, NULL, NULL);
INSERT INTO `guru` VALUES (10, 'Roikhatul Uzza, S.Psi', '123', 'Sumberpasir', 'buizza.jpg', 'S1', 'Universitas Islam', 'https://www.facebook.com/izzaclalu.dia', 'https://www.instagram.com/izza.sr/', NULL, NULL, 'Bimbingan Konseling', 'izza@smkitasy-syadzili.sch.id', '6283175798727', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'K006', NULL, NULL, NULL, NULL);
INSERT INTO `guru` VALUES (11, 'Refita Fardiani', NULL, 'Malang', 'burev.jpg', NULL, NULL, NULL, 'https://www.instagram.com/refhii_01/', NULL, NULL, 'Tata Usaha', 'refita@smkitasy-syadzili.sch.id', '6285645230304', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'K007', NULL, NULL, NULL, NULL);
INSERT INTO `guru` VALUES (12, 'Nur Cholis, S.Pdi', NULL, 'Malang', 'bunur.jpg', 'S1', NULL, NULL, NULL, NULL, NULL, 'Guru Pendidikan Agama Islam', 'nur@smkitasy-syadzili.sch.id', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'K008', NULL, NULL, NULL, NULL);
INSERT INTO `guru` VALUES (13, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `guru` VALUES (14, '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', 'Laki-laki', '', 'Islam', 'WNI', 'Kawin', 'Rumah Pribadi', 0, 0, 0, 'A', '', '', '', '0000-00-00', '', '', '', 'G17883', '', 'PNS', '', NULL);
INSERT INTO `guru` VALUES (15, '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', 'Laki-laki', '', 'Islam', 'WNI', 'Kawin', 'Rumah Pribadi', 0, 0, 0, 'A', '', '', '', '0000-00-00', '', '', '', 'G419769', '', 'PNS', '', NULL);
INSERT INTO `guru` VALUES (16, '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', 'Laki-laki', '', 'Islam', 'WNI', 'Kawin', 'Rumah Pribadi', 0, 0, 0, 'A', '', '', '', '0000-00-00', '', '', '', 'G84716', '', 'PNS', '', NULL);
INSERT INTO `guru` VALUES (17, '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', 'Laki-laki', '', 'Islam', 'WNI', 'Kawin', 'Rumah Pribadi', 0, 0, 0, 'A', '', '', '', '0000-00-00', '', '', '', 'G235870', '', 'PNS', '', NULL);
INSERT INTO `guru` VALUES (18, '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', 'Laki-laki', '', 'Islam', 'WNI', 'Kawin', 'Rumah Pribadi', 0, 0, 0, 'A', '', '', '', '0000-00-00', '', '', '', 'G945983', '', 'PNS', '', NULL);
INSERT INTO `guru` VALUES (19, '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', 'Laki-laki', '', 'Islam', 'WNI', 'Kawin', 'Rumah Pribadi', 0, 0, 0, 'A', '', '', '', '0000-00-00', '', '', '', 'G895233', '', 'PNS', '', NULL);
INSERT INTO `guru` VALUES (20, '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', 'Laki-laki', '', 'Islam', 'WNI', 'Kawin', 'Rumah Pribadi', 0, 0, 0, 'A', '', '', '', '0000-00-00', '', '', '', 'G972778', '', 'PNS', '', NULL);
INSERT INTO `guru` VALUES (21, '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', 'Laki-laki', '', 'Islam', 'WNI', 'Kawin', 'Rumah Pribadi', 0, 0, 0, 'A', '', '', '', '0000-00-00', '', '', '', 'G847076', '', 'PNS', '', NULL);
INSERT INTO `guru` VALUES (22, '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', 'Laki-laki', '', 'Islam', 'WNI', 'Kawin', 'Rumah Pribadi', 0, 0, 0, 'A', '', '', '', '0000-00-00', '', '', '', 'G129943', '', 'PNS', '', NULL);
INSERT INTO `guru` VALUES (23, 'coba', '312', 'Malang,aa', 'ea3ff3aeb4f2ff427c25fe28df0aef81.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'dhumbahabaa@gmail.com', '8887878', 'Laki-laki', 'malang', 'Islam', 'WNI', 'Kawin', 'Rumah Pribadi', 13, 160, 161, 'B', '1', '1', '323', '2020-12-08', 'SD', '2020-12-11', 'AA', 'G259368', 'asd', 'PNS', '3118', NULL);
INSERT INTO `guru` VALUES (24, 'coba', '312', 'Malang,aa', '42afe9a75fed950f237f3bc57c7911b2.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'dhumbahabaa@gmail.com', '8887878', 'Laki-laki', 'malang', 'Islam', 'WNI', 'Kawin', 'Rumah Pribadi', 13, 160, 161, 'B', '1', '1', '323', '2020-12-08', 'SD', '2020-12-11', 'AA', 'G860260', 'asd', 'PNS', '3118', NULL);
INSERT INTO `guru` VALUES (25, 'Cicik Winarsih', '3232', 'Malang', 'd067443b7c5e06c8f489b40226d6ddc3.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'rusthina92@gmail.com', '8887878', 'Perempuan', 'malang', 'Islam', 'WNI', 'Kawin', 'Rumah Pribadi', 22, 40, 150, 'A', 'a', 'a', '2321', '2020-12-11', 'smk', '2020-12-31', 'ad', 'G934936', 'Rendy', 'PNS', '12312', NULL);
INSERT INTO `guru` VALUES (26, 'Cicik Winarsih', '3232', 'Malang', '3cd6f1f7372a9266a67951793bdf8054.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'rusthina92@gmail.com', '8887878', 'Perempuan', 'malang', 'Islam', 'WNI', 'Kawin', 'Rumah Pribadi', 22, 40, 150, 'A', 'a', 'a', '2321', '2020-12-11', 'smk', '2020-12-31', 'ad', 'G981903', 'Rendy', 'PNS', '12312', NULL);
INSERT INTO `guru` VALUES (27, 'Cicik Winarsih', '3232', 'Malang', '754b727e2336bf82482391b0ef4a3e37.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'rusthina92@gmail.com', '8887878', 'Perempuan', 'malang', 'Islam', 'WNI', 'Kawin', 'Rumah Pribadi', 22, 40, 150, 'A', 'a', 'a', '2321', '2020-12-11', 'smk', '2020-12-31', 'ad', 'G44799', 'Rendy', 'PNS', '12312', NULL);
INSERT INTO `guru` VALUES (28, 'erre', '', '', 'b7630316f4b38c532dc20d0ade50c1ff.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'dhumbahabaa@gmail.com', '', 'Laki-laki', 'malang', 'Islam', 'WNI', 'Kawin', 'Rumah Pribadi', 0, 0, 0, 'A', '', '', '', '0000-00-00', '', '', '', 'G97320', 'asd', 'PNS', '', NULL);
INSERT INTO `guru` VALUES (29, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'G320465', NULL, NULL, NULL, NULL);
INSERT INTO `guru` VALUES (30, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'G354309', NULL, NULL, NULL, NULL);
INSERT INTO `guru` VALUES (31, 'ABBOCATH 18', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', 'Laki-laki', '', 'Islam', 'WNI', 'Kawin', 'Rumah Pribadi', 0, 0, 0, 'A', '', '', '', '0000-00-00', '', '', '', 'G840179', '', 'PNS', '', NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of guru_mapel
-- ----------------------------
INSERT INTO `guru_mapel` VALUES (5, 2, 5, 1, 21);
INSERT INTO `guru_mapel` VALUES (6, 2, 5, 1, 22);
INSERT INTO `guru_mapel` VALUES (7, 2, 7, 1, 19);
INSERT INTO `guru_mapel` VALUES (8, 2, 7, 1, 20);
INSERT INTO `guru_mapel` VALUES (9, 2, 7, 1, 21);
INSERT INTO `guru_mapel` VALUES (10, 8, 6, 1, NULL);
INSERT INTO `guru_mapel` VALUES (11, 8, 6, 1, 19);
INSERT INTO `guru_mapel` VALUES (12, 8, 6, 1, 20);
INSERT INTO `guru_mapel` VALUES (14, 8, 5, 1, 20);
INSERT INTO `guru_mapel` VALUES (15, 8, 5, 1, 19);
INSERT INTO `guru_mapel` VALUES (16, 2, 7, 1, 22);
INSERT INTO `guru_mapel` VALUES (17, 13, NULL, NULL, NULL);

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
-- Table structure for jenis_penilaian
-- ----------------------------
DROP TABLE IF EXISTS `jenis_penilaian`;
CREATE TABLE `jenis_penilaian`  (
  `id_jenis_penilaian` int(11) NOT NULL AUTO_INCREMENT,
  `jenis_penilaian` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`id_jenis_penilaian`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jenis_penilaian
-- ----------------------------
INSERT INTO `jenis_penilaian` VALUES (1, 'Pengetahuan');
INSERT INTO `jenis_penilaian` VALUES (2, 'Sikap');
INSERT INTO `jenis_penilaian` VALUES (3, 'Keterampilan');
INSERT INTO `jenis_penilaian` VALUES (4, 'Spiritual');

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
  `idtingkat_fk` int(11) NULL DEFAULT NULL,
  `idjenispenilaian_fk` int(11) NULL DEFAULT NULL,
  `idsemester_fk` int(11) NULL DEFAULT NULL,
  `kode` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `kd` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `ringkasan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`id_kd`) USING BTREE,
  INDEX `idtingkat_fk`(`idtingkat_fk`) USING BTREE,
  INDEX `idjenispenilaian_fk`(`idjenispenilaian_fk`) USING BTREE,
  INDEX `idsemester_fk`(`idsemester_fk`) USING BTREE,
  CONSTRAINT `kd_ibfk_1` FOREIGN KEY (`idtingkat_fk`) REFERENCES `tingkat` (`id_tingkat`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `kd_ibfk_2` FOREIGN KEY (`idjenispenilaian_fk`) REFERENCES `jenis_penilaian` (`id_jenis_penilaian`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `kd_ibfk_3` FOREIGN KEY (`idsemester_fk`) REFERENCES `semester` (`id_semester`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of kd
-- ----------------------------
INSERT INTO `kd` VALUES (1, 1, 1, 1, 'KD 1', 'Mengetahui C++', 'Mengenal C++');

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
  PRIMARY KEY (`id_mata_pelajaran`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of mata_pelajaran
-- ----------------------------
INSERT INTO `mata_pelajaran` VALUES (1, 'Bahasa Inggris', 'BING');
INSERT INTO `mata_pelajaran` VALUES (2, 'Editing', 'EDT');
INSERT INTO `mata_pelajaran` VALUES (3, 'Matematika', 'MTK');
INSERT INTO `mata_pelajaran` VALUES (4, 'Bahasa Indonesia', 'BIND');
INSERT INTO `mata_pelajaran` VALUES (5, 'Administrasi Infrastruktur Jaringan', 'AIJ');
INSERT INTO `mata_pelajaran` VALUES (6, 'Administrasi Sistem Jaringan', 'ASJ');
INSERT INTO `mata_pelajaran` VALUES (7, 'Produk Kreatif dan Kewirausahaan', NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of question_cas
-- ----------------------------
INSERT INTO `question_cas` VALUES (1, '1', 5, 2);
INSERT INTO `question_cas` VALUES (2, '1', 6, 2);
INSERT INTO `question_cas` VALUES (3, '1', 7, 2);
INSERT INTO `question_cas` VALUES (4, '1', 8, 2);
INSERT INTO `question_cas` VALUES (5, '1', 9, 2);
INSERT INTO `question_cas` VALUES (6, '1', 10, 2);
INSERT INTO `question_cas` VALUES (7, '1', 11, 2);
INSERT INTO `question_cas` VALUES (8, '1', 12, 2);
INSERT INTO `question_cas` VALUES (9, '1', 13, 2);
INSERT INTO `question_cas` VALUES (10, '1', 14, 2);

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
) ENGINE = InnoDB AUTO_INCREMENT = 96 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of siswa
-- ----------------------------
INSERT INTO `siswa` VALUES (4, '0130/0077.066', 'A. ARISY FIRMANSYAH', 19, 1, 'islam', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (5, '0132/0079.066', 'ABDUL MU\'ID', 19, 1, 'islam', '0037030560', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (6, '0133/0080.066', 'ACHMAD ARIFIN ILHAM', 19, 1, 'islam', '0040555657', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (7, '0134/0081.066', 'ACHMAD BAHRUL ULUM', 19, 1, 'islam', '0039935410', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (8, '0135/0082.066', 'ACHMAD MA\'RIFATUL FIQHI', 19, 1, 'islam', '0044638277', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (9, '0136/0083.066', 'ACHMAD NIZAR', 19, 1, 'islam', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (10, '0137/0084.066', 'ACHMAD NU\'MAN MAQBUL', 19, 1, 'islam', '0033191826', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (11, '0138/0085.066', 'ACHMAD YUSRON', 19, 1, 'islam', '0036892407', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (12, '0139/0086.066', 'AHMAD FARIHUR ROMADHONI', 19, 1, 'islam', '0036610597', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (13, '0140/0087.066', 'ALVIO TREINADI', 19, 1, 'islam', '0036653307', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (14, '0144/0091.066', 'FEBYAN AZIMMY IQBAL M.', 19, 1, 'islam', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (15, '0147/0094.066', 'HENDRI', 19, 1, 'islam', '0042672865', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (16, '0155/0102.066', 'M. AFIEH RAZALI', 19, 1, 'islam', '0048334539', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (17, '0156/0103.066', 'M. BIRUL WALIDAIN', 19, 1, 'islam', '0038232553', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (18, '0158/0105.066', 'M. IRFAN ASROFI', 19, 1, 'islam', '0042930399', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (19, '0159/0106.066', 'M. IRFAN SATRIO', 19, 1, 'islam', '0038094782', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (20, '0160/0107.066', 'M. IZZUDIN FAHMI ABIDIN', 19, 1, 'islam', '0038214313', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (21, '0175/0122.066', 'M. LUKMAN HAKIM', 19, 1, 'islam', '0018978409', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (22, '0149/0096.066', 'M. MUHAIMIN', 19, 1, 'islam', '0026169043', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (23, '0150/0097.066', 'M. RAFLI', 19, 1, 'islam', '0043116041', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (24, '0153/0100.066', 'M. SHOBIRIN', 19, 1, 'islam', '0044583442', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (25, '0154/0101.066', 'M. SYAIFUDDIN ZUHRI', 19, 1, 'islam', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (26, NULL, 'SULBI RAHMAT', 19, 1, 'islam', '0037343820', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (27, NULL, 'ABDUL AZIZ', 20, 1, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (28, NULL, 'BAYU SATRIO PAMUNGKAS', 20, 1, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (29, NULL, 'DANDI SETYOKO', 20, 1, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (30, NULL, 'EMRIZAL HAMED BASSELA', 20, 1, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (31, NULL, 'FIRDAUS REYHAN P.A', 20, 1, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (32, NULL, 'HAMMAM ALWI', 20, 1, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (33, NULL, 'IZUL HABIBULLOH', 20, 1, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (34, NULL, 'M. BAHARUDIN MA\'RUF', 20, 1, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (35, NULL, 'M. BINTANG RABBANI', 20, 1, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (36, NULL, 'M. IMAM FATHONI', 20, 1, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (37, NULL, 'M. KHOIRUL ANTARIKSA', 20, 1, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (38, NULL, 'M. MAULANA RAMADHAN', 20, 1, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (39, NULL, 'M. MINNANUR ROHMAN', 20, 1, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (40, NULL, 'M. NAUFAL SYAFIQ AKHSANI', 20, 1, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (41, NULL, 'M. PUTRA MAULIDANI', 20, 1, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (42, NULL, 'M. RIF\'AN ZULKIFLI', 20, 1, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (43, NULL, 'M. UBAIDILLAH', 20, 1, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (44, NULL, 'MIFTAHUS SURUR AL-HISY', 20, 1, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (45, NULL, 'NANDA NURUS SHOLIHIN', 20, 1, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (46, NULL, 'OSCAR GONZALES PIRY', 20, 1, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (47, NULL, 'RENDI FERDIANTO', 20, 1, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (48, NULL, 'ROCHIT SANTOSO', 20, 1, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (49, NULL, 'SATRIA YUDHA PURNAMA', 20, 1, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (50, NULL, 'SUGENG SLAMET RIDHO\'I', 20, 1, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (51, NULL, 'A. BUSTHONUL FAIDLIN', 21, 1, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (52, NULL, 'DENI SYAPUTRA', 21, 1, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (53, NULL, 'FIKRI RAHMAT MAULANA', 21, 1, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (54, NULL, 'FIQIH ABDILLAH S. M.', 21, 1, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (55, NULL, 'IKMAL WAFIQ ARAFAT', 21, 1, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (56, NULL, 'M. AGUS HERMANSYAH', 21, 1, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (57, NULL, 'M. AIMAR NUR ABABIEL', 21, 1, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (58, NULL, 'M. ALIEF WAHYUDI', 21, 1, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (59, NULL, 'M. AMIEN  QUTHBI', 21, 1, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (60, NULL, 'M. HASAN ALI MAULANA', 21, 1, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (61, NULL, 'M. HILDAN ISFANDIARI', 21, 1, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (62, NULL, 'M. ILHAM HALIK MAULANA', 21, 1, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (63, NULL, 'M. IQBAL ZAMZAMI', 21, 1, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (64, NULL, 'M. IRFAN MUZAKKY', 21, 1, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (65, NULL, 'M. NIZAR ASROFI', 21, 1, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (66, NULL, 'M. NURIZ NURZAMAN', 21, 1, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (67, NULL, 'M. RIFQILLAH MAZID', 21, 1, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (68, NULL, 'M. SHOFIYUDDIN AINUR R.', 21, 1, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (69, '12312312', 'M. YUSRIL', 21, 1, 'islam', '', '', '', '', '', '', '', '', '0000-00-00', 'Ya', '', '', '', '', '', NULL, NULL, NULL, '', '', '0000-00-00', '', '', '', '', '', '0000-00-00', '', '', '', 0, 0, 0, NULL, 0, 'L');
INSERT INTO `siswa` VALUES (70, NULL, 'MISBAHUL MUNIR', 21, 1, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (71, NULL, 'MUFTI ALI SHOLIHIN', 21, 1, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (72, NULL, 'A. ARIF SYAR\'I', 22, 1, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (73, NULL, 'ABDILLAH KAMAL PASHA', 22, 1, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (74, NULL, 'ANANDA MIHDAN', 22, 1, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (75, NULL, 'HILDAN ACHMAD', 22, 1, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (76, NULL, 'M. ALFAN FIKRI ADITAMA', 22, 1, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (77, NULL, 'M. ARDI FIRMANSYAH', 22, 1, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (78, NULL, 'M. FAIZUL MURTADHO', 22, 1, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (79, '32131231231', 'M. HAFID AMINUDDIN', 22, 1, 'islam', '', '', '', '', '', '', '', '', '0000-00-00', 'Ya', '', '', '', '', '', NULL, NULL, NULL, '', '', '0000-00-00', '', '', '', '', '', '0000-00-00', '', '', '', 0, 0, 0, NULL, 0, 'L');
INSERT INTO `siswa` VALUES (80, NULL, 'M. HILMI IBROHIM', 22, 1, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (81, NULL, 'M. MA\'RUF SHOFIYUDDIN', 22, 1, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (82, NULL, 'M. SYAHRUL AZIZI', 22, 1, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (83, NULL, 'M. SYARIFUDDIN', 22, 1, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (84, NULL, 'M. TAUFIKUR ROHMAN', 22, 1, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (85, NULL, 'M. ZAINUL ARIFIN', 22, 1, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (86, '', 'M. ZIDANE NAFI\' A.', 22, 1, 'islam', '', '', '', '', '', '', '', '', '0000-00-00', 'Ya', '', '', '', '', '', 'fb7e896fb8f0ac4b70d9b590ce2ffdd4.png', NULL, NULL, '', '', '0000-00-00', '', '', '', '', '', '0000-00-00', '', '', '', 0, 0, 0, NULL, 0, 'L');
INSERT INTO `siswa` VALUES (87, NULL, 'MOCH. ARIF MUKLIS', 22, 1, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (88, NULL, 'REZA AKBAR TAUFANI', 22, 1, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (89, NULL, 'RIDHO ABDI IMANULLOH', 22, 1, 'islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (90, '130533608212', 'SULTON ABDUL AZIZ', 22, 1, 'islam', '0023697040', '312', '3213', '32131', '231092', '312312', 'smp', 'Malang', '2020-10-28', 'Ya', '', '', '', '', '', NULL, NULL, NULL, '', '', '0000-00-00', '', '', '', '', '', '0000-00-00', '', '', '', 0, 0, 0, NULL, 0, 'L');
INSERT INTO `siswa` VALUES (91, '', 'VELLORIAND ADIAZ DIFANA', 22, 1, 'islam', '', '', '', '', '', '', '', '', '0000-00-00', 'Ya', '', '', '', '', '', 'b052b09fa735bacedbce846d75db8ab0.png', NULL, NULL, '', '', '0000-00-00', '', '', '', '', '', '0000-00-00', '', '', '', 0, 0, 0, NULL, 0, 'L');
INSERT INTO `siswa` VALUES (92, '123', 'YUSUF BAKHTIAR', 22, 1, 'islam', '', '', '', '', '', '', '', '', '0000-00-00', 'Ya', '', '', '', '', '', '1b0020429c4fac52b182b2a229f3f656.jpg', NULL, NULL, '', '', '0000-00-00', '', '', '', '', '', '0000-00-00', '', '', '', 0, 0, 0, NULL, 0, 'L');
INSERT INTO `siswa` VALUES (93, '231323', 'ZAINAL ABIDIN', 22, 1, 'islam', '', '', '', '', '', '', '', '', '0000-00-00', 'Ya', '', '', '', '', '', '', NULL, NULL, '', '', '0000-00-00', '', '', '', '', '', '0000-00-00', '', '', '', 0, 0, 0, NULL, 0, 'L');
INSERT INTO `siswa` VALUES (95, '312', 'Rendy Yani Susanto', 11, 1, 'islam', '0003719937', '9090', '8888', '132', '9080', '1231', 'smp', 'malang', '1993-10-03', 'Tidak', 'Malang', 'Kebonagung', '32', '07', 'Kebonagung', '186030200011004.jpg', 1, NULL, 'Sugianto', 'Malang', '2020-11-30', 'SMA Sederajat', 'Wiraswasta', 'Rp. 2.000.000 - Rp. 4.999.999', 'Sri Indahyani', 'Malang', '2020-11-30', '', 'Peternak', 'Rp. 500.000 - Rp. 999.999', 160, 22, 10, NULL, 3, 'L');

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
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of siswa_beasiswa
-- ----------------------------
INSERT INTO `siswa_beasiswa` VALUES (3, 3, 'das', 'bonez', '2010', '2012');
INSERT INTO `siswa_beasiswa` VALUES (4, 3, 'jarom', 'jamro', '2020', '2021');

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
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of siswa_dokumen
-- ----------------------------
INSERT INTO `siswa_dokumen` VALUES (7, 3, 'foto_siswa', 'IMG_20190427_152718.jpg');
INSERT INTO `siswa_dokumen` VALUES (8, 3, 'foto_siswa', 'vektor1.PNG');
INSERT INTO `siswa_dokumen` VALUES (9, 3, 'foto_siswa', '5.png');

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
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of siswa_prestasi
-- ----------------------------
INSERT INTO `siswa_prestasi` VALUES (3, 3, 'asd', 'ew', 'ere', '2017', '9020');
INSERT INTO `siswa_prestasi` VALUES (4, 3, 'ere', 'asd', 'ds', '2018', '2020');

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
  PRIMARY KEY (`id_tahun_ajaran`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tahun_ajaran
-- ----------------------------
INSERT INTO `tahun_ajaran` VALUES (1, '2020/2021', '2020-06-07 10:07:41', 1);
INSERT INTO `tahun_ajaran` VALUES (2, '2018/2019', '2020-08-03 11:06:13', 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, '127.0.0.1', 'admin', '$2y$08$mxSDKMRKsKM3IwN6NPoB6.3pQqymDu4ZtGAMIzpw.ppcie3MJM9ty', '', 'hello@admin.com', '', NULL, NULL, NULL, 1268889823, 1608111234, 1, 'admin', 'Yani', 'ADMIN', '085894632505', '3c8f6f36f650d5ce07803470b4f4d4ff.jpg', NULL, NULL, NULL);
INSERT INTO `users` VALUES (3, '127.0.0.1', 'rendy', '$2y$08$mxSDKMRKsKM3IwN6NPoB6.3pQqymDu4ZtGAMIzpw.ppcie3MJM9ty', '', 'hello@admin.com', '', NULL, NULL, NULL, 1268889823, 1606710496, 1, 'Rendy', 'Yani', 'ADMIN', '085894632505', '3c8f6f36f650d5ce07803470b4f4d4ff.jpg', 2, 'guru', 1);

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
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of users_groups
-- ----------------------------
INSERT INTO `users_groups` VALUES (1, 1, 1);
INSERT INTO `users_groups` VALUES (3, 3, 3);

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
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of wali_kelas
-- ----------------------------
INSERT INTO `wali_kelas` VALUES (2, 2, 1, 11);

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
INNER JOIN question_cas ON question_cas.idbanksoal_fk = bank_soal.id_bank_soal ; ;

-- ----------------------------
-- View structure for v_buku_pemanggilan_siswa
-- ----------------------------
DROP VIEW IF EXISTS `v_buku_pemanggilan_siswa`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_buku_pemanggilan_siswa` AS SELECT
buku_pemanggilan_siswa.id_buku_pemanggilan_siswa,
buku_pemanggilan_siswa.idsiswa_fk,
buku_pemanggilan_siswa.masalah,
buku_pemanggilan_siswa.pemecahan,
buku_pemanggilan_siswa.tindak_lanjut,
buku_pemanggilan_siswa.keterangan,
buku_pemanggilan_siswa.tanggal,
buku_pemanggilan_siswa.kode_pemanggilan,
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
siswa.jenis_kelamin
FROM
buku_pemanggilan_siswa
INNER JOIN siswa ON siswa.id_siswa = buku_pemanggilan_siswa.idsiswa_fk ;

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
kelas.idtahunajaran_fk,
jurusan.id_jurusan,
jurusan.jurusan,
jurusan.singkatan
FROM
siswa
LEFT JOIN kelas ON kelas.id_kelas = siswa.idkelas_fk
LEFT JOIN jurusan ON jurusan.id_jurusan = kelas.idjurusan_fk ;

SET FOREIGN_KEY_CHECKS = 1;
