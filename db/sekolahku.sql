/*
 Navicat Premium Data Transfer

 Source Server         : xampp
 Source Server Type    : MySQL
 Source Server Version : 100138
 Source Host           : localhost:3306
 Source Schema         : sekolahku

 Target Server Type    : MySQL
 Target Server Version : 100138
 File Encoding         : 65001

 Date: 22/06/2020 10:54:59
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

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
-- Table structure for groups
-- ----------------------------
DROP TABLE IF EXISTS `groups`;
CREATE TABLE `groups`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of groups
-- ----------------------------
INSERT INTO `groups` VALUES (1, 'admin', 'Administrator');
INSERT INTO `groups` VALUES (2, 'siswa', 'Siswa');
INSERT INTO `groups` VALUES (3, 'guru', 'Guru');
INSERT INTO `groups` VALUES (4, 'staff', 'Staff');

-- ----------------------------
-- Table structure for guru
-- ----------------------------
DROP TABLE IF EXISTS `guru`;
CREATE TABLE `guru`  (
  `id_guru` int(11) NOT NULL AUTO_INCREMENT,
  `nama` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `nip` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `alamat` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `agama` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `foto` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`id_guru`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of guru
-- ----------------------------
INSERT INTO `guru` VALUES (2, 'Rendy Yani Susanto', '121', 'Malang', 'Islam', NULL);
INSERT INTO `guru` VALUES (3, 'Cicik Winarsih', '2919', 'Malang', 'Islam', NULL);
INSERT INTO `guru` VALUES (5, 'yayan', '3321', 'asd', 'kkk', NULL);
INSERT INTO `guru` VALUES (6, 'Abdur Rochim', '1234', 'Singosari', 'Islam', '91b83a0188e13986037d70730a65daa8.jpg');

-- ----------------------------
-- Table structure for guru_mapel
-- ----------------------------
DROP TABLE IF EXISTS `guru_mapel`;
CREATE TABLE `guru_mapel`  (
  `id_guru_mapel` int(11) NOT NULL AUTO_INCREMENT,
  `idguru_fk` int(11) NULL DEFAULT NULL,
  `idmapel_fk` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_guru_mapel`) USING BTREE,
  INDEX `idguru_fk`(`idguru_fk`) USING BTREE,
  INDEX `idmapel_fk`(`idmapel_fk`) USING BTREE,
  CONSTRAINT `guru_mapel_ibfk_1` FOREIGN KEY (`idguru_fk`) REFERENCES `guru` (`id_guru`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `guru_mapel_ibfk_2` FOREIGN KEY (`idmapel_fk`) REFERENCES `mata_pelajaran` (`id_mata_pelajaran`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of guru_mapel
-- ----------------------------
INSERT INTO `guru_mapel` VALUES (1, 2, 1);
INSERT INTO `guru_mapel` VALUES (2, 2, 3);
INSERT INTO `guru_mapel` VALUES (3, 6, 2);

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
  PRIMARY KEY (`id_jurusan`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jurusan
-- ----------------------------
INSERT INTO `jurusan` VALUES (1, 'Reg');
INSERT INTO `jurusan` VALUES (2, 'Non Reg');

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
  PRIMARY KEY (`id_kelas`) USING BTREE,
  INDEX `idtingkat_fk`(`idtingkat_fk`) USING BTREE,
  CONSTRAINT `kelas_ibfk_1` FOREIGN KEY (`idtingkat_fk`) REFERENCES `tingkat` (`id_tingkat`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of kelas
-- ----------------------------
INSERT INTO `kelas` VALUES (2, 'XII A', 1, '2020-06-08 08:53:03');

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
  PRIMARY KEY (`id_learning`) USING BTREE,
  INDEX `learning_ibfk_1`(`idmatapelajaran_fk`) USING BTREE,
  INDEX `idkd_fk`(`idkd_fk`) USING BTREE,
  INDEX `iduser_fk`(`iduser_fk`) USING BTREE,
  CONSTRAINT `learning_ibfk_1` FOREIGN KEY (`idmatapelajaran_fk`) REFERENCES `mata_pelajaran` (`id_mata_pelajaran`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `learning_ibfk_2` FOREIGN KEY (`iduser_fk`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of learning
-- ----------------------------
INSERT INTO `learning` VALUES (1, 1, 999, 'sdasdasdasda', 2, NULL, 1, 'Mengenal Sejarah C++', '2020-06-17 18:04:31');
INSERT INTO `learning` VALUES (2, 1, 999, 'asdasdaaaa', 1, NULL, 1, 'Ini hal baru', '2020-06-17 18:04:31');
INSERT INTO `learning` VALUES (3, 1, 999, 'Asdasda', 0, 'ASD123', 1, 'Ini terpasword', '2020-06-17 18:04:31');

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
-- Table structure for mata_pelajaran
-- ----------------------------
DROP TABLE IF EXISTS `mata_pelajaran`;
CREATE TABLE `mata_pelajaran`  (
  `id_mata_pelajaran` int(11) NOT NULL AUTO_INCREMENT,
  `mata_pelajaran` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `kode` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`id_mata_pelajaran`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of mata_pelajaran
-- ----------------------------
INSERT INTO `mata_pelajaran` VALUES (1, 'Programming', 'PRG');
INSERT INTO `mata_pelajaran` VALUES (2, 'Editing', 'EDT');
INSERT INTO `mata_pelajaran` VALUES (3, 'Matematika', 'MTK');

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
INSERT INTO `profil_website` VALUES ('Sekolah Myber', 'Jl. Istana Mekar Wangi Utama No 1P-Q', '0812208979012', 'logo-w.png', 'bulb.png', 'undefined', 'Shop with the nature, Please shop with me', '<p>The Balance Small Business makes launching and managing your own business easy. It is home to experts who provide clear, practical advice on entrepreneurship and management. Whether you&rsquo;re just starting up or you want to take your company to the next level, our 20-year-strong library of more than 7,000 pieces of content will answer your questions and turn your business dreams into reality.</p>\n\n<p><a href=\"https://www.thebalancesmb.com/\">The Balance</a>&nbsp;is part of The Balance family of sites, including&nbsp;<a href=\"https://www.thebalance.com/\" rel=\"noopener\" target=\"_blank\">The Balance</a>&nbsp;and&nbsp;<a href=\"https://www.thebalancecareers.com/\" rel=\"noopener\" target=\"_blank\">The Balance Careers</a>, covering personal finance, career, and small business topics. With more than 24 million monthly visitors, The Balance is among the top-10 largest finance properties as measured by comScore, a leading Internet measurement company. Our more than 50 expert writers have extensive qualifications and expertise in their topics, including MBAs, PhDs, CFPs, other advanced degrees and professional certifications.</p>\n\n<p>The Balance family of sites have been honored by multiple awards in the last year, including&nbsp;<a href=\"https://www.tellyawards.com/winners/2017/short-form-social/general-education-discovery\" rel=\"noopener nofollow\" target=\"_blank\">The Telly Awards</a>,&nbsp;<a href=\"https://www.communicatorawards.com/\" rel=\"noopener nofollow\" target=\"_blank\">The Communicator Awards</a>, and&nbsp;<a href=\"https://www.editorandpublisher.com/news/editor-publisher-announces-the-2017-eppy-award-finalists/\" rel=\"noopener nofollow\" target=\"_blank\">Eppy Awards</a>.</p>\n', 'danielelvanda@yahoo.com', 'Daniel Elvanda Yohanes', 'undefined', 'undefined', 'undefined', 'undefined', 'a00ae551dd485419a57db462a6ae30b9.jpg', 'Halo Admin, Saya ingin bertanya/membeli/.....', 'd797c14a0070235734508b7d9f409395.jpg', '&copy; 2019. <a href=\"#\">Core Master</a> by<a href=\"https://myber.co.id\" target=\"_blank\">Myber</a>', 'Core Master', 'Klinik Sekarpuro', 'Malang', 'Indonesia');

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
INSERT INTO `quiz` VALUES (2, 'Dasar C++', 0, NULL, 1, 1, 2);

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
  `themes` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of setting_website
-- ----------------------------
INSERT INTO `setting_website` VALUES ('selling');

-- ----------------------------
-- Table structure for siswa
-- ----------------------------
DROP TABLE IF EXISTS `siswa`;
CREATE TABLE `siswa`  (
  `id_siswa` int(11) NOT NULL AUTO_INCREMENT,
  `nis` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
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
  `idkecamatan_fk` int(11) NULL DEFAULT NULL,
  `foto` text CHARACTER SET hp8 COLLATE hp8_english_ci NULL,
  `idprovinsi_fk` int(11) NULL DEFAULT NULL,
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
  PRIMARY KEY (`id_siswa`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of siswa
-- ----------------------------
INSERT INTO `siswa` VALUES (5, '2', 'ABDUL AZIZ', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (6, '3', 'VIOLIRAND ADIAZ', 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (7, '4', 'SULTON ABDUL AZIZ', 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (8, '5', 'AHMAD FARIHUR ROMDLONI\r\n', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (9, '6', 'MIFTAH HUSURUR ALHISYI\r\n', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (10, '7', 'MUHAMMAD BAHARUDIN MA\'RUF', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (11, '8', 'M. SYAIFUDIN ZUHRI', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (12, '9', 'BAYU SARTRIO', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (13, '10', 'MUHAMMAD SHOBIRIN', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (14, '11', 'M. HASAN ALI MAULANA', 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (15, '12', 'M. MAULANA RAMADHAN', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (16, '13', 'M. RIF\'AN ZULKIFLI', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (17, '14', 'AARISY FIRMANSYAH', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (18, '15', 'MUHAMMAD BIRRUL WALIDAIN', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (19, '16', 'SUGENG SLAMET RIDHO', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (20, '17', 'A.NIZAR', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (21, '18', 'RENDY FERDIANTO', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (22, '19', 'AHMAD ARIF SYAR\'I', 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (23, '20', 'FIKRI RAHMAT MAULANA', 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (24, '21', 'DANDI SETYOKO', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (25, '22', 'HAMMAM ALWI', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (26, '23', 'M. PUTRA M', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (27, '24', 'MUHAMMAD NAUFAL S', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (28, '25', 'M. ALFAN', 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (29, '26', 'ACHMAD YOESRON PENJALINAN', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (30, '27', 'MUHAMMAD BINTANG RABBANI', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (31, '28', 'FEBYAN AZIMMY IQBAL M', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `siswa` VALUES (32, '29', 'EMRIZAL HAMED', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of siswa_mapel
-- ----------------------------
INSERT INTO `siswa_mapel` VALUES (4, 5, 1);
INSERT INTO `siswa_mapel` VALUES (5, 6, 1);
INSERT INTO `siswa_mapel` VALUES (6, 7, 1);
INSERT INTO `siswa_mapel` VALUES (7, 8, 1);
INSERT INTO `siswa_mapel` VALUES (8, 9, 1);
INSERT INTO `siswa_mapel` VALUES (9, 10, 1);
INSERT INTO `siswa_mapel` VALUES (10, 11, 1);
INSERT INTO `siswa_mapel` VALUES (11, 12, 1);
INSERT INTO `siswa_mapel` VALUES (12, 13, 1);
INSERT INTO `siswa_mapel` VALUES (13, 14, 1);
INSERT INTO `siswa_mapel` VALUES (14, 15, 1);
INSERT INTO `siswa_mapel` VALUES (15, 16, 1);
INSERT INTO `siswa_mapel` VALUES (16, 17, 1);
INSERT INTO `siswa_mapel` VALUES (17, 18, 1);
INSERT INTO `siswa_mapel` VALUES (18, 19, 1);
INSERT INTO `siswa_mapel` VALUES (19, 20, 1);
INSERT INTO `siswa_mapel` VALUES (20, 21, 1);
INSERT INTO `siswa_mapel` VALUES (21, 22, 1);
INSERT INTO `siswa_mapel` VALUES (22, 23, 1);
INSERT INTO `siswa_mapel` VALUES (23, 24, 1);
INSERT INTO `siswa_mapel` VALUES (24, 25, 1);
INSERT INTO `siswa_mapel` VALUES (25, 26, 1);
INSERT INTO `siswa_mapel` VALUES (26, 27, 1);
INSERT INTO `siswa_mapel` VALUES (27, 28, 1);
INSERT INTO `siswa_mapel` VALUES (28, 29, 1);
INSERT INTO `siswa_mapel` VALUES (29, 30, 1);
INSERT INTO `siswa_mapel` VALUES (30, 31, 1);
INSERT INTO `siswa_mapel` VALUES (31, 32, 1);

-- ----------------------------
-- Table structure for tahun_ajaran
-- ----------------------------
DROP TABLE IF EXISTS `tahun_ajaran`;
CREATE TABLE `tahun_ajaran`  (
  `id_tahun_ajaran` int(11) NOT NULL AUTO_INCREMENT,
  `tahun_ajaran` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `create_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_tahun_ajaran`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tahun_ajaran
-- ----------------------------
INSERT INTO `tahun_ajaran` VALUES (1, '2020/2021', '2020-06-07 10:07:41');

-- ----------------------------
-- Table structure for tingkat
-- ----------------------------
DROP TABLE IF EXISTS `tingkat`;
CREATE TABLE `tingkat`  (
  `id_tingkat` int(11) NOT NULL AUTO_INCREMENT,
  `tingkat` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `create_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_tingkat`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tingkat
-- ----------------------------
INSERT INTO `tingkat` VALUES (1, '1', '2020-06-07 09:54:48');
INSERT INTO `tingkat` VALUES (2, '2', '2020-06-07 09:54:48');
INSERT INTO `tingkat` VALUES (3, '3', '2020-06-07 09:55:06');
INSERT INTO `tingkat` VALUES (4, '4', '2020-06-07 09:55:13');
INSERT INTO `tingkat` VALUES (5, '5', '2020-06-07 09:55:20');
INSERT INTO `tingkat` VALUES (6, '6', '2020-06-07 09:55:26');

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
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, '127.0.0.1', 'admin', '$2y$08$mxSDKMRKsKM3IwN6NPoB6.3pQqymDu4ZtGAMIzpw.ppcie3MJM9ty', '', 'hello@admin.com', '', NULL, NULL, NULL, 1268889823, 1592617029, 1, 'Rendy', 'Yani', 'ADMIN', '085894632505', '3c8f6f36f650d5ce07803470b4f4d4ff.jpg', NULL, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of users_groups
-- ----------------------------
INSERT INTO `users_groups` VALUES (1, 1, 1);
INSERT INTO `users_groups` VALUES (2, 1, 2);

SET FOREIGN_KEY_CHECKS = 1;
