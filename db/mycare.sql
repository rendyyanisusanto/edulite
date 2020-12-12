/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 100138
 Source Host           : localhost:3306
 Source Schema         : mycare

 Target Server Type    : MySQL
 Target Server Version : 100138
 File Encoding         : 65001

 Date: 06/03/2020 22:00:34
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
-- Table structure for akun
-- ----------------------------
DROP TABLE IF EXISTS `akun`;
CREATE TABLE `akun`  (
  `id_akun` int(11) NOT NULL AUTO_INCREMENT,
  `no_ref` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `nama` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `create_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `id_induk_akun` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_akun`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of akun
-- ----------------------------
INSERT INTO `akun` VALUES (1, '1101', 'Kas', '2020-03-06 09:56:54', 1);
INSERT INTO `akun` VALUES (2, '1102 ', 'Bank', '2020-03-06 10:07:47', 1);
INSERT INTO `akun` VALUES (3, '1103', 'Deposito', '2020-03-06 10:08:06', 1);
INSERT INTO `akun` VALUES (4, '1104', 'Piutang', '2020-03-06 10:08:13', 1);
INSERT INTO `akun` VALUES (5, '1105', 'Perlengkapan', '2020-03-06 11:03:20', 1);
INSERT INTO `akun` VALUES (6, '1106', 'Persediaan Obat', '2020-03-06 11:03:36', 1);
INSERT INTO `akun` VALUES (7, '1201', 'Aktiva Tetap', '2020-03-06 10:09:24', 2);
INSERT INTO `akun` VALUES (8, '1202', 'Penyusutan', '2020-03-06 10:09:52', 2);
INSERT INTO `akun` VALUES (9, '1203', 'Investasi', '2020-03-06 10:10:00', 2);
INSERT INTO `akun` VALUES (10, '2101', 'Hutang Usaha', '2020-03-06 10:10:26', 3);
INSERT INTO `akun` VALUES (11, '2102', 'Hutang Pajak', '2020-03-06 10:11:11', 3);
INSERT INTO `akun` VALUES (12, '2103', 'Kewjiban Lancar Lain', '2020-03-06 10:11:51', 3);
INSERT INTO `akun` VALUES (13, '2201', 'Hutang Pihak Ketiga', '2020-03-06 10:12:12', 4);
INSERT INTO `akun` VALUES (14, '2202', 'Hutang Program Lain', '2020-03-06 10:12:20', 4);
INSERT INTO `akun` VALUES (15, '2203', 'Kewajiban Jangka Panjang Lain', '2020-03-06 10:12:35', 4);
INSERT INTO `akun` VALUES (16, '3101', 'Modal Usaha', '2020-03-06 10:13:25', 5);
INSERT INTO `akun` VALUES (17, '3102', 'Prive', '2020-03-06 10:13:39', 5);
INSERT INTO `akun` VALUES (18, '4101', 'Donasi', '2020-03-06 10:15:08', 6);
INSERT INTO `akun` VALUES (19, '4102', 'Sumbangan', '2020-03-06 10:15:17', 6);
INSERT INTO `akun` VALUES (20, '4201', 'Penghasilan Layanan', '2020-03-06 10:15:45', 7);
INSERT INTO `akun` VALUES (21, '4202', 'Penjualan', '2020-03-06 10:19:26', 7);
INSERT INTO `akun` VALUES (22, '4301', 'Pendapatan Lain', '2020-03-06 10:21:07', 8);
INSERT INTO `akun` VALUES (23, '5101', 'Gaji', '2020-03-06 10:21:39', 9);
INSERT INTO `akun` VALUES (24, '5102', 'Biaya Perjalanan', '2020-03-06 10:22:01', 9);
INSERT INTO `akun` VALUES (25, '5103', 'Biaya Kantor', '2020-03-06 10:22:14', 9);
INSERT INTO `akun` VALUES (26, '5104', 'Biaya Sewa', '2020-03-06 10:24:31', 9);
INSERT INTO `akun` VALUES (27, '5105', 'Biaya Pemeliharaan', '2020-03-06 10:24:41', 9);

-- ----------------------------
-- Table structure for antrian
-- ----------------------------
DROP TABLE IF EXISTS `antrian`;
CREATE TABLE `antrian`  (
  `id_antrian` int(11) NOT NULL AUTO_INCREMENT,
  `idpasien_fk` int(11) NULL DEFAULT NULL,
  `create_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(11) NULL DEFAULT NULL,
  `kode` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `no_antrian` int(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id_antrian`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of antrian
-- ----------------------------
INSERT INTO `antrian` VALUES (6, 10, '2020-02-23 10:06:38', 0, 'A7268995', NULL);
INSERT INTO `antrian` VALUES (7, 10, '2020-02-23 10:06:48', 1, 'A5781707', NULL);
INSERT INTO `antrian` VALUES (8, 1, '2020-02-24 07:44:58', 0, 'A15931879', NULL);
INSERT INTO `antrian` VALUES (9, 12, '2020-02-25 20:37:59', 0, 'A77756964', NULL);
INSERT INTO `antrian` VALUES (10, 11, '2020-02-25 20:38:15', 0, 'A26154252', NULL);
INSERT INTO `antrian` VALUES (11, 12, '2020-02-26 07:01:00', 0, 'A85597134', NULL);
INSERT INTO `antrian` VALUES (12, 12, '2020-02-27 07:37:10', 1, 'A2021824', 1);
INSERT INTO `antrian` VALUES (13, 11, '2020-02-27 07:38:04', 0, 'A61355546', 2);
INSERT INTO `antrian` VALUES (16, 1, '2020-02-27 09:24:02', 1, 'A11729316', 3);
INSERT INTO `antrian` VALUES (17, 1, '2020-02-27 11:13:48', 1, 'A13664852', 4);
INSERT INTO `antrian` VALUES (18, 1, '2020-02-27 11:33:30', 0, 'A609173', 5);
INSERT INTO `antrian` VALUES (19, 4, '2020-02-28 07:47:04', 1, 'A63086908', 1);
INSERT INTO `antrian` VALUES (20, 1, '2020-02-28 07:48:55', 1, 'A75784704', 2);
INSERT INTO `antrian` VALUES (21, 10, '2020-02-28 12:47:00', 0, 'A2011395', 3);
INSERT INTO `antrian` VALUES (22, 4, '2020-02-28 17:20:40', 0, 'A4968445', 4);
INSERT INTO `antrian` VALUES (23, NULL, '2020-02-28 18:41:05', 0, 'A76468616', 5);
INSERT INTO `antrian` VALUES (24, 1, '2020-02-28 20:26:14', 0, 'A56602699', 6);
INSERT INTO `antrian` VALUES (25, 5, '2020-02-28 20:40:54', 0, 'A25846899', 7);
INSERT INTO `antrian` VALUES (26, NULL, '2020-02-28 20:43:13', 0, 'A46220673', 8);
INSERT INTO `antrian` VALUES (27, 13, '2020-02-28 20:52:30', 0, 'A44019136', 9);
INSERT INTO `antrian` VALUES (28, 14, '2020-02-28 20:59:01', 0, 'A79274414', 10);
INSERT INTO `antrian` VALUES (29, 15, '2020-02-28 21:02:20', 0, 'A11212071', 11);
INSERT INTO `antrian` VALUES (30, 15, '2020-03-02 09:39:01', 0, 'A1523812', 1);
INSERT INTO `antrian` VALUES (31, 15, '2020-03-04 07:23:15', 0, 'A39157621', 1);
INSERT INTO `antrian` VALUES (32, 1, '2020-03-06 11:24:48', 1, 'A45663497', 1);
INSERT INTO `antrian` VALUES (33, 15, '2020-03-06 11:46:56', 1, 'A69617422', 2);
INSERT INTO `antrian` VALUES (34, 3, '2020-03-06 12:43:57', 1, 'A46066318', 3);
INSERT INTO `antrian` VALUES (35, 3, '2020-03-06 12:47:00', 1, 'A70114885', 4);
INSERT INTO `antrian` VALUES (36, 15, '2020-03-06 12:48:40', 1, 'A56155127', 5);

-- ----------------------------
-- Table structure for biaya
-- ----------------------------
DROP TABLE IF EXISTS `biaya`;
CREATE TABLE `biaya`  (
  `id_biaya` int(11) NOT NULL AUTO_INCREMENT,
  `idjenispasien_fk` int(11) NULL DEFAULT NULL,
  `nama` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `tarif` double(20, 0) NULL DEFAULT NULL,
  `create_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_biaya`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of biaya
-- ----------------------------
INSERT INTO `biaya` VALUES (1, 1, 'Administrasi', 15000, '2020-03-01 07:30:40');
INSERT INTO `biaya` VALUES (2, 1, 'Jasa', 10000, '2020-03-01 07:30:40');
INSERT INTO `biaya` VALUES (3, 2, 'Administrasi', 0, '2020-03-01 07:30:40');
INSERT INTO `biaya` VALUES (4, 2, 'Sumbangan', 10000, '2020-03-01 07:30:40');
INSERT INTO `biaya` VALUES (5, 3, 'Admin', 50000, '2020-03-01 07:30:40');

-- ----------------------------
-- Table structure for component_kartu_stok
-- ----------------------------
DROP TABLE IF EXISTS `component_kartu_stok`;
CREATE TABLE `component_kartu_stok`  (
  `id_component_kartu_stok` int(11) NOT NULL AUTO_INCREMENT,
  `idkartustok_fk` int(11) NULL DEFAULT NULL,
  `idobat_fk` int(11) NULL DEFAULT NULL,
  `stok_awal` int(255) NULL DEFAULT NULL,
  `masuk` int(255) NULL DEFAULT NULL,
  `keterangan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `keluar` int(255) NULL DEFAULT NULL,
  `create_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_component_kartu_stok`) USING BTREE,
  INDEX `idkartustok_fk`(`idkartustok_fk`) USING BTREE,
  CONSTRAINT `component_kartu_stok_ibfk_1` FOREIGN KEY (`idkartustok_fk`) REFERENCES `kartu_stok` (`id_kartu_stok`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of component_kartu_stok
-- ----------------------------
INSERT INTO `component_kartu_stok` VALUES (4, 6, 1, 5, 2, 'asd', 1, '2020-03-01 07:31:07');
INSERT INTO `component_kartu_stok` VALUES (5, 7, 1, 0, 10, '1', 4, '2020-03-01 07:31:07');
INSERT INTO `component_kartu_stok` VALUES (6, 8, 1, 0, 10, '', 2, '2020-03-01 07:31:07');
INSERT INTO `component_kartu_stok` VALUES (7, 9, 1, 0, 11, '12', 32, '2020-03-01 07:31:07');
INSERT INTO `component_kartu_stok` VALUES (8, 10, 1, 10, 2, 'lko', 0, '2020-03-01 07:31:07');
INSERT INTO `component_kartu_stok` VALUES (9, 11, 1, 12, 1, 'asd', 10, '2020-03-01 07:31:07');
INSERT INTO `component_kartu_stok` VALUES (10, 13, 1, 5, 2, 'as', 0, '2020-03-01 07:31:07');
INSERT INTO `component_kartu_stok` VALUES (11, 14, 2, 30, 0, 'Dokter', 5, '2020-03-01 07:31:07');
INSERT INTO `component_kartu_stok` VALUES (12, 14, 1, 7, 10, 'cicik memberi obat', 0, '2020-03-01 07:31:07');

-- ----------------------------
-- Table structure for component_nota_rekam
-- ----------------------------
DROP TABLE IF EXISTS `component_nota_rekam`;
CREATE TABLE `component_nota_rekam`  (
  `id_component_nota_rekam` int(11) NOT NULL AUTO_INCREMENT,
  `component` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `total` double(20, 0) NULL DEFAULT NULL,
  `idnotarekam_fk` int(11) NULL DEFAULT NULL,
  `create_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_component_nota_rekam`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 54 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of component_nota_rekam
-- ----------------------------
INSERT INTO `component_nota_rekam` VALUES (1, 'obat', 50500, 3, '2020-03-01 07:31:30');
INSERT INTO `component_nota_rekam` VALUES (2, 'Jasa', 10000, 3, '2020-03-01 07:31:30');
INSERT INTO `component_nota_rekam` VALUES (3, 'tindakan', 175000, 3, '2020-03-01 07:31:30');
INSERT INTO `component_nota_rekam` VALUES (4, 'konsultasi', 50000, 3, '2020-03-01 07:31:30');
INSERT INTO `component_nota_rekam` VALUES (5, 'tambahan', 1000, 3, '2020-03-01 07:31:30');
INSERT INTO `component_nota_rekam` VALUES (6, 'obat', 100500, 4, '2020-03-01 07:31:30');
INSERT INTO `component_nota_rekam` VALUES (7, 'konsultasi', 50000, 4, '2020-03-01 07:31:30');
INSERT INTO `component_nota_rekam` VALUES (8, 'tindakan', 175000, 4, '2020-03-01 07:31:30');
INSERT INTO `component_nota_rekam` VALUES (9, 'Jasa', 10000, 4, '2020-03-01 07:31:30');
INSERT INTO `component_nota_rekam` VALUES (10, 'Biaya Induk', 100, 4, '2020-03-01 07:31:30');
INSERT INTO `component_nota_rekam` VALUES (11, 'obat', 52500, 5, '2020-03-01 07:31:30');
INSERT INTO `component_nota_rekam` VALUES (12, 'Jasa', 10000, 5, '2020-03-01 07:31:30');
INSERT INTO `component_nota_rekam` VALUES (13, 'tindakan', 150000, 5, '2020-03-01 07:31:30');
INSERT INTO `component_nota_rekam` VALUES (14, 'konsultasi', 50000, 5, '2020-03-01 07:31:30');
INSERT INTO `component_nota_rekam` VALUES (15, 'biaya bayi tabung', 50000, 5, '2020-03-01 07:31:30');
INSERT INTO `component_nota_rekam` VALUES (16, 'obat', 50000, 6, '2020-03-01 07:31:30');
INSERT INTO `component_nota_rekam` VALUES (17, 'Jasa', 10000, 6, '2020-03-01 07:31:30');
INSERT INTO `component_nota_rekam` VALUES (18, 'konsultasi', 50000, 6, '2020-03-01 07:31:30');
INSERT INTO `component_nota_rekam` VALUES (19, 'tindakan', 25000, 6, '2020-03-01 07:31:30');
INSERT INTO `component_nota_rekam` VALUES (20, 'obat', 2500, 7, '2020-03-01 07:31:30');
INSERT INTO `component_nota_rekam` VALUES (21, 'Jasa', 10000, 7, '2020-03-01 07:31:30');
INSERT INTO `component_nota_rekam` VALUES (22, 'obat', 50000, 8, '2020-03-01 07:31:30');
INSERT INTO `component_nota_rekam` VALUES (23, 'Jasa', 10000, 8, '2020-03-01 07:31:30');
INSERT INTO `component_nota_rekam` VALUES (24, 'tindakan', 25000, 8, '2020-03-01 07:31:30');
INSERT INTO `component_nota_rekam` VALUES (25, 'konsultasi', 50000, 8, '2020-03-01 07:31:30');
INSERT INTO `component_nota_rekam` VALUES (26, 'obat', 0, 9, '2020-03-01 07:31:30');
INSERT INTO `component_nota_rekam` VALUES (27, 'Jasa', 10000, 9, '2020-03-01 07:31:30');
INSERT INTO `component_nota_rekam` VALUES (28, 'obat', 2233, 10, '2020-03-06 11:36:54');
INSERT INTO `component_nota_rekam` VALUES (29, 'Jasa', 10000, 10, '2020-03-06 11:36:54');
INSERT INTO `component_nota_rekam` VALUES (30, 'konsultasi', 50000, 10, '2020-03-06 11:36:54');
INSERT INTO `component_nota_rekam` VALUES (31, 'tindakan', 25000, 10, '2020-03-06 11:36:54');
INSERT INTO `component_nota_rekam` VALUES (32, 'obat', 732, 11, '2020-03-06 11:48:25');
INSERT INTO `component_nota_rekam` VALUES (33, 'Jasa', 10000, 11, '2020-03-06 11:48:25');
INSERT INTO `component_nota_rekam` VALUES (34, 'tindakan', 150000, 11, '2020-03-06 11:48:25');
INSERT INTO `component_nota_rekam` VALUES (35, 'obat', 51000, 12, '2020-03-06 12:45:46');
INSERT INTO `component_nota_rekam` VALUES (36, 'tindakan', 25000, 12, '2020-03-06 12:45:46');
INSERT INTO `component_nota_rekam` VALUES (37, 'Jasa', 10000, 12, '2020-03-06 12:45:46');
INSERT INTO `component_nota_rekam` VALUES (38, 'konsultasi', 50000, 12, '2020-03-06 12:45:46');
INSERT INTO `component_nota_rekam` VALUES (39, 'obat', 500, 13, '2020-03-06 12:47:39');
INSERT INTO `component_nota_rekam` VALUES (40, 'Jasa', 10000, 13, '2020-03-06 12:47:39');
INSERT INTO `component_nota_rekam` VALUES (41, 'konsultasi', 50000, 13, '2020-03-06 12:47:39');
INSERT INTO `component_nota_rekam` VALUES (42, 'tindakan', 25000, 13, '2020-03-06 12:47:39');
INSERT INTO `component_nota_rekam` VALUES (43, 'obat', 500, 14, '2020-03-06 12:47:40');
INSERT INTO `component_nota_rekam` VALUES (44, 'Jasa', 10000, 14, '2020-03-06 12:47:40');
INSERT INTO `component_nota_rekam` VALUES (45, 'konsultasi', 50000, 14, '2020-03-06 12:47:40');
INSERT INTO `component_nota_rekam` VALUES (46, 'tindakan', 25000, 14, '2020-03-06 12:47:40');
INSERT INTO `component_nota_rekam` VALUES (47, 'obat', 500, 15, '2020-03-06 12:48:06');
INSERT INTO `component_nota_rekam` VALUES (48, 'Jasa', 10000, 15, '2020-03-06 12:48:06');
INSERT INTO `component_nota_rekam` VALUES (49, 'konsultasi', 50000, 15, '2020-03-06 12:48:06');
INSERT INTO `component_nota_rekam` VALUES (50, 'tindakan', 25000, 15, '2020-03-06 12:48:06');
INSERT INTO `component_nota_rekam` VALUES (51, 'obat', 500, 16, '2020-03-06 12:49:34');
INSERT INTO `component_nota_rekam` VALUES (52, 'Sumbangan', 10000, 16, '2020-03-06 12:49:34');
INSERT INTO `component_nota_rekam` VALUES (53, 'tindakan', 25000, 16, '2020-03-06 12:49:34');

-- ----------------------------
-- Table structure for component_nota_rujuk_keluar
-- ----------------------------
DROP TABLE IF EXISTS `component_nota_rujuk_keluar`;
CREATE TABLE `component_nota_rujuk_keluar`  (
  `id_component_nota_rujuk_keluar` int(11) NOT NULL AUTO_INCREMENT,
  `component` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `total` double(255, 0) NULL DEFAULT NULL,
  `idnotarujukkeluar_fk` int(11) NULL DEFAULT NULL,
  `create_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_component_nota_rujuk_keluar`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of component_nota_rujuk_keluar
-- ----------------------------
INSERT INTO `component_nota_rujuk_keluar` VALUES (1, 'Bon', 10000, 1, '2020-03-01 07:31:47');
INSERT INTO `component_nota_rujuk_keluar` VALUES (2, 'Obat', 15000, 1, '2020-03-01 07:31:47');
INSERT INTO `component_nota_rujuk_keluar` VALUES (3, 'asda', 123, 2, '2020-03-01 07:31:47');
INSERT INTO `component_nota_rujuk_keluar` VALUES (4, 'ds', 222, 2, '2020-03-01 07:31:47');
INSERT INTO `component_nota_rujuk_keluar` VALUES (5, 'dsds', 1010, 2, '2020-03-01 07:31:47');

-- ----------------------------
-- Table structure for component_pengadaan_obat
-- ----------------------------
DROP TABLE IF EXISTS `component_pengadaan_obat`;
CREATE TABLE `component_pengadaan_obat`  (
  `id_component_pengadaan_obat` int(11) NOT NULL AUTO_INCREMENT,
  `idpengadaanobat_fk` int(11) NULL DEFAULT NULL,
  `idobat_fk` int(11) NULL DEFAULT NULL,
  `jml` int(255) NULL DEFAULT NULL,
  `total` double(255, 0) NULL DEFAULT NULL,
  PRIMARY KEY (`id_component_pengadaan_obat`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of component_pengadaan_obat
-- ----------------------------
INSERT INTO `component_pengadaan_obat` VALUES (1, 1, 6, 8, 10000);
INSERT INTO `component_pengadaan_obat` VALUES (2, 1, 1, 6, 20000);
INSERT INTO `component_pengadaan_obat` VALUES (3, 2, 8, 10, 20000);
INSERT INTO `component_pengadaan_obat` VALUES (4, 2, 2, 20, 30000);

-- ----------------------------
-- Table structure for component_penggunaan_lain
-- ----------------------------
DROP TABLE IF EXISTS `component_penggunaan_lain`;
CREATE TABLE `component_penggunaan_lain`  (
  `id_component_penggunaan_lain` int(11) NOT NULL AUTO_INCREMENT,
  `idpenggunaanlain_fk` int(11) NULL DEFAULT NULL,
  `idobat_fk` int(11) NULL DEFAULT NULL,
  `jumlah` int(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id_component_penggunaan_lain`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for dokter
-- ----------------------------
DROP TABLE IF EXISTS `dokter`;
CREATE TABLE `dokter`  (
  `id_dokter` int(11) NOT NULL AUTO_INCREMENT,
  `nama` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `no_hp` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `kode_dokter` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `create_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_dokter`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of dokter
-- ----------------------------
INSERT INTO `dokter` VALUES (1, 'dr. Weewq', '01293123123', 'D0001', '2020-03-01 07:32:00');
INSERT INTO `dokter` VALUES (2, 'dr. Kemet', '8312830', 'D0002', '2020-03-01 07:32:00');

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
-- Table structure for induk_akun
-- ----------------------------
DROP TABLE IF EXISTS `induk_akun`;
CREATE TABLE `induk_akun`  (
  `id_induk_akun` int(11) NOT NULL AUTO_INCREMENT,
  `no_akun` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `nama` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `ref_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_induk_akun`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of induk_akun
-- ----------------------------
INSERT INTO `induk_akun` VALUES (1, '11', 'Aktiva Lancar', 1);
INSERT INTO `induk_akun` VALUES (2, '12', 'Aktiva Tidak Lancar', 1);
INSERT INTO `induk_akun` VALUES (3, '21', 'Kewajiban Lancar', 2);
INSERT INTO `induk_akun` VALUES (4, '22', 'Kewajiban Jangka Panjang', 2);
INSERT INTO `induk_akun` VALUES (5, '31', 'Modal Usaha', 3);
INSERT INTO `induk_akun` VALUES (6, '41', 'Pendapatan', 4);
INSERT INTO `induk_akun` VALUES (7, '42', 'Penghasilan', 4);
INSERT INTO `induk_akun` VALUES (8, '43', 'Pendapatan Lain', 4);
INSERT INTO `induk_akun` VALUES (9, '51', 'Administrasi', 5);
INSERT INTO `induk_akun` VALUES (10, '52', 'Biaya Lain', 5);

-- ----------------------------
-- Table structure for inventaris
-- ----------------------------
DROP TABLE IF EXISTS `inventaris`;
CREATE TABLE `inventaris`  (
  `id_inventaris` int(11) NOT NULL AUTO_INCREMENT,
  `kode` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `nama` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `bulan` int(11) NULL DEFAULT NULL,
  `tahun` int(11) NULL DEFAULT NULL,
  `jumlah` int(11) NULL DEFAULT NULL,
  `keadaan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `deskripsi` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `idjenisbarang_fk` int(11) NULL DEFAULT NULL,
  `idruangan_fk` int(11) NULL DEFAULT NULL,
  `foto` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `create_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_inventaris`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of inventaris
-- ----------------------------
INSERT INTO `inventaris` VALUES (1, '1/k/1231', 'TV', 1, NULL, NULL, 'Baik', '<p>das</p>\r\n', 1, 1, '4243cc9db27ecb0e083266723ee7d273.jpg', '2020-03-01 07:32:10');
INSERT INTO `inventaris` VALUES (2, '312123', 'Kursi', 1, 2020, 5, 'Baik', '<p>sad</p>\r\n', 1, 2, 'ef3f12c9b9d77b9313413512763ed917.jpg,29182323cbf991b8562298928dd6bad0.JPG,4243cc9db27ecb0e083266723ee7d273.jpg', '2020-03-01 07:32:10');

-- ----------------------------
-- Table structure for jenis_barang
-- ----------------------------
DROP TABLE IF EXISTS `jenis_barang`;
CREATE TABLE `jenis_barang`  (
  `id_jenis_barang` int(11) NOT NULL AUTO_INCREMENT,
  `jenis_barang` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `create_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_jenis_barang`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jenis_barang
-- ----------------------------
INSERT INTO `jenis_barang` VALUES (1, 'Alat Umum', '2020-03-01 07:32:28');
INSERT INTO `jenis_barang` VALUES (2, 'Alat Kesehatan', '2020-03-01 07:32:28');

-- ----------------------------
-- Table structure for jenis_pasien
-- ----------------------------
DROP TABLE IF EXISTS `jenis_pasien`;
CREATE TABLE `jenis_pasien`  (
  `id_jenis_pasien` int(11) NOT NULL AUTO_INCREMENT,
  `jenis_pasien` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `create_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_jenis_pasien`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jenis_pasien
-- ----------------------------
INSERT INTO `jenis_pasien` VALUES (1, 'Pasien Umum', '2020-03-01 07:32:21');
INSERT INTO `jenis_pasien` VALUES (2, 'Pasien BPJS', '2020-03-01 07:32:21');
INSERT INTO `jenis_pasien` VALUES (3, 'Pasien THT', '2020-03-01 07:32:21');

-- ----------------------------
-- Table structure for jenis_suplier
-- ----------------------------
DROP TABLE IF EXISTS `jenis_suplier`;
CREATE TABLE `jenis_suplier`  (
  `id_jenis_suplier` int(11) NOT NULL AUTO_INCREMENT,
  `jenis_suplier` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `create_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_jenis_suplier`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jenis_suplier
-- ----------------------------
INSERT INTO `jenis_suplier` VALUES (1, 'Alat Kesehatan', '2020-03-01 07:32:39');
INSERT INTO `jenis_suplier` VALUES (2, 'Obat', '2020-03-01 07:32:39');
INSERT INTO `jenis_suplier` VALUES (4, 'Peralatan Lain', '2020-03-01 07:32:39');
INSERT INTO `jenis_suplier` VALUES (5, 'Tidak Ada', '2020-03-01 07:32:39');

-- ----------------------------
-- Table structure for jurnal_umum
-- ----------------------------
DROP TABLE IF EXISTS `jurnal_umum`;
CREATE TABLE `jurnal_umum`  (
  `id_jurnal_umum` int(11) NOT NULL AUTO_INCREMENT,
  `ref` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `akun` int(11) NULL DEFAULT NULL,
  `debit` double(255, 0) NULL DEFAULT 0,
  `kredit` double(255, 0) NULL DEFAULT 0,
  `keterangan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `create_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `table` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `idtable_fk` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_jurnal_umum`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jurnal_umum
-- ----------------------------
INSERT INTO `jurnal_umum` VALUES (1, '7088885', 1, 102233, 0, 'Rekam Medis Pasien dengan kode 8810710', '2020-03-06 11:36:54', 'Rekam_medis', 19);
INSERT INTO `jurnal_umum` VALUES (2, '7088885', 20, 0, 100000, 'Rekam Medis Pasien dengan kode 8810710', '2020-03-06 11:36:54', 'Rekam_medis', 19);
INSERT INTO `jurnal_umum` VALUES (3, '7088885', 6, 0, 2233, 'Rekam Medis Pasien dengan kode 8810710', '2020-03-06 11:36:54', 'Rekam_medis', 19);
INSERT INTO `jurnal_umum` VALUES (4, '107130', 1, 175732, 0, 'Rekam Medis Pasien dengan kode 6883445', '2020-03-06 11:48:25', 'Rekam_medis', 20);
INSERT INTO `jurnal_umum` VALUES (5, '107130', 20, 0, 175000, 'Rekam Medis Pasien dengan kode 6883445', '2020-03-06 11:48:25', 'Rekam_medis', 20);
INSERT INTO `jurnal_umum` VALUES (6, '107130', 6, 0, 732, 'Rekam Medis Pasien dengan kode 6883445', '2020-03-06 11:48:25', 'Rekam_medis', 20);
INSERT INTO `jurnal_umum` VALUES (23, '6346716', 1, 20000, 0, 'Rekam Medis Pasien dengan kode 6690410', '2020-03-06 12:49:34', 'Rekam_medis', 25);
INSERT INTO `jurnal_umum` VALUES (24, '6346716', 20, 0, 35000, 'Rekam Medis Pasien dengan kode 6690410', '2020-03-06 12:49:34', 'Rekam_medis', 25);
INSERT INTO `jurnal_umum` VALUES (25, '6346716', 6, 0, 500, 'Rekam Medis Pasien dengan kode 6690410', '2020-03-06 12:49:34', 'Rekam_medis', 25);
INSERT INTO `jurnal_umum` VALUES (26, '6346716', 4, 15500, 0, 'Rekam Medis Pasien dengan kode 6690410', '2020-03-06 12:49:34', 'Rekam_medis', 25);

-- ----------------------------
-- Table structure for kartu
-- ----------------------------
DROP TABLE IF EXISTS `kartu`;
CREATE TABLE `kartu`  (
  `id_kartu` int(11) NOT NULL AUTO_INCREMENT,
  `kode_kartu` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `kk` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `tanggal_kadaluarsa` date NULL DEFAULT NULL,
  `create_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_kartu`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of kartu
-- ----------------------------
INSERT INTO `kartu` VALUES (1, '4040', '1234512', '2020-02-28', '2020-03-01 07:32:50');
INSERT INTO `kartu` VALUES (2, 'K-1302633', '2010110', NULL, '2020-03-01 07:32:50');
INSERT INTO `kartu` VALUES (3, 'K-9530271', '132312313', NULL, '2020-03-01 07:32:50');
INSERT INTO `kartu` VALUES (4, 'K-6439252', '112112', NULL, '2020-03-01 07:32:50');
INSERT INTO `kartu` VALUES (7, 'K-7591674', '81203810293810', NULL, '2020-03-01 07:32:50');
INSERT INTO `kartu` VALUES (8, 'K-5649488', '31313123', NULL, '2020-03-01 07:32:50');
INSERT INTO `kartu` VALUES (9, 'K-9349689', '626366268', NULL, '2020-03-01 07:32:50');

-- ----------------------------
-- Table structure for kartu_stok
-- ----------------------------
DROP TABLE IF EXISTS `kartu_stok`;
CREATE TABLE `kartu_stok`  (
  `id_kartu_stok` int(11) NOT NULL AUTO_INCREMENT,
  `kode` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `tanggal` date NULL DEFAULT NULL,
  `create_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_kartu_stok`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of kartu_stok
-- ----------------------------
INSERT INTO `kartu_stok` VALUES (6, 'K_159008071', '2020-02-15', '2020-03-01 07:33:01');
INSERT INTO `kartu_stok` VALUES (7, 'K_987795028', '2020-02-15', '2020-03-01 07:33:01');
INSERT INTO `kartu_stok` VALUES (8, 'K_602722716', '2020-02-21', '2020-03-01 07:33:01');
INSERT INTO `kartu_stok` VALUES (9, 'K_195073772', '2020-02-15', '2020-03-01 07:33:01');
INSERT INTO `kartu_stok` VALUES (10, 'K_178511794', '2020-02-15', '2020-03-01 07:33:01');
INSERT INTO `kartu_stok` VALUES (11, 'K_391583654', '2020-02-26', '2020-03-01 07:33:01');
INSERT INTO `kartu_stok` VALUES (12, 'K_304626184', '2020-02-15', '2020-03-01 07:33:01');
INSERT INTO `kartu_stok` VALUES (13, 'K_329991276', '2020-02-15', '2020-03-01 07:33:01');
INSERT INTO `kartu_stok` VALUES (14, 'K_682457935', '2020-02-17', '2020-03-01 07:33:01');

-- ----------------------------
-- Table structure for konsultasi
-- ----------------------------
DROP TABLE IF EXISTS `konsultasi`;
CREATE TABLE `konsultasi`  (
  `id_konsultasi` int(11) NOT NULL AUTO_INCREMENT,
  `konsultasi` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `tarif` double(255, 0) NULL DEFAULT NULL,
  `create_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_konsultasi`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of konsultasi
-- ----------------------------
INSERT INTO `konsultasi` VALUES (1, 'Konsultasi Kejiwaan', 50000, '2020-03-01 07:33:12');

-- ----------------------------
-- Table structure for konsultasi_rekam
-- ----------------------------
DROP TABLE IF EXISTS `konsultasi_rekam`;
CREATE TABLE `konsultasi_rekam`  (
  `id_konsultasi_rekam` int(11) NOT NULL AUTO_INCREMENT,
  `idrekammedis_fk` int(11) NULL DEFAULT NULL,
  `idkonsultasi_fk` int(11) NULL DEFAULT NULL,
  `create_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_konsultasi_rekam`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of konsultasi_rekam
-- ----------------------------
INSERT INTO `konsultasi_rekam` VALUES (3, 3, 1, '2020-03-01 07:33:23');
INSERT INTO `konsultasi_rekam` VALUES (4, 4, 1, '2020-03-01 07:33:23');
INSERT INTO `konsultasi_rekam` VALUES (5, 10, 1, '2020-03-01 07:33:23');
INSERT INTO `konsultasi_rekam` VALUES (6, 11, 1, '2020-03-01 07:33:23');
INSERT INTO `konsultasi_rekam` VALUES (7, 17, 1, '2020-03-01 07:33:23');
INSERT INTO `konsultasi_rekam` VALUES (8, 19, 1, '2020-03-06 11:36:54');
INSERT INTO `konsultasi_rekam` VALUES (9, 21, 1, '2020-03-06 12:45:46');
INSERT INTO `konsultasi_rekam` VALUES (10, 22, 1, '2020-03-06 12:47:39');
INSERT INTO `konsultasi_rekam` VALUES (11, 23, 1, '2020-03-06 12:47:39');
INSERT INTO `konsultasi_rekam` VALUES (12, 24, 1, '2020-03-06 12:48:06');

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
-- Table structure for media
-- ----------------------------
DROP TABLE IF EXISTS `media`;
CREATE TABLE `media`  (
  `id_media` int(11) NOT NULL AUTO_INCREMENT,
  `img` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `tag` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `title` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`id_media`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of media
-- ----------------------------
INSERT INTO `media` VALUES (7, 'fc2e814f70eb3ae9c73dad70fc9d976a.jpg', NULL, 'fc2e814f70eb3ae9c73dad70fc9d976a.jpg');
INSERT INTO `media` VALUES (8, 'bf493265bde22379ee55109649617029.jpg', NULL, 'bf493265bde22379ee55109649617029.jpg');
INSERT INTO `media` VALUES (9, '4243cc9db27ecb0e083266723ee7d273.jpg', NULL, '4243cc9db27ecb0e083266723ee7d273.jpg');
INSERT INTO `media` VALUES (10, 'd6c79d8e2543d6182ec0fec28fa2390d.JPG', NULL, 'd6c79d8e2543d6182ec0fec28fa2390d.JPG');
INSERT INTO `media` VALUES (11, '7382cdc8340f5753152bc3e21eeff742.JPG', NULL, '7382cdc8340f5753152bc3e21eeff742.JPG');
INSERT INTO `media` VALUES (12, '4a699ed0e334e1082553660e971c0cf8.JPG', NULL, '4a699ed0e334e1082553660e971c0cf8.JPG');
INSERT INTO `media` VALUES (13, '29182323cbf991b8562298928dd6bad0.JPG', NULL, '29182323cbf991b8562298928dd6bad0.JPG');
INSERT INTO `media` VALUES (14, '5d1dc9dd8af6a48fe5144f4b9a713ff7.JPG', NULL, '5d1dc9dd8af6a48fe5144f4b9a713ff7.JPG');
INSERT INTO `media` VALUES (15, 'ef3f12c9b9d77b9313413512763ed917.jpg', NULL, 'ef3f12c9b9d77b9313413512763ed917.jpg');

-- ----------------------------
-- Table structure for nota_rekam
-- ----------------------------
DROP TABLE IF EXISTS `nota_rekam`;
CREATE TABLE `nota_rekam`  (
  `id_nota_rekam` int(11) NOT NULL AUTO_INCREMENT,
  `idrekammedis_fk` int(11) NULL DEFAULT NULL,
  `kode_nota` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `create_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_nota_rekam`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of nota_rekam
-- ----------------------------
INSERT INTO `nota_rekam` VALUES (3, 3, 'N46712477', '2020-02-14 15:21:04');
INSERT INTO `nota_rekam` VALUES (4, 4, 'N53594453', '2020-02-14 15:27:21');
INSERT INTO `nota_rekam` VALUES (5, 10, 'N47944999', '2020-02-27 10:02:24');
INSERT INTO `nota_rekam` VALUES (6, 11, 'N11639393', '2020-02-27 10:12:56');
INSERT INTO `nota_rekam` VALUES (7, 16, 'N4186862', '2020-02-27 11:33:17');
INSERT INTO `nota_rekam` VALUES (8, 17, 'N57075021', '2020-02-28 12:49:06');
INSERT INTO `nota_rekam` VALUES (9, 18, 'N24353957', '2020-02-28 17:17:36');
INSERT INTO `nota_rekam` VALUES (10, 19, 'N24585683', '2020-03-06 11:36:54');
INSERT INTO `nota_rekam` VALUES (11, 20, 'N82270459', '2020-03-06 11:48:25');
INSERT INTO `nota_rekam` VALUES (12, 21, 'N35979816', '2020-03-06 12:45:46');
INSERT INTO `nota_rekam` VALUES (13, 22, 'N15797892', '2020-03-06 12:47:39');
INSERT INTO `nota_rekam` VALUES (14, 23, 'N8692789', '2020-03-06 12:47:40');
INSERT INTO `nota_rekam` VALUES (15, 24, 'N57123824', '2020-03-06 12:48:06');
INSERT INTO `nota_rekam` VALUES (16, 25, 'N93986234', '2020-03-06 12:49:34');

-- ----------------------------
-- Table structure for nota_rujuk_keluar
-- ----------------------------
DROP TABLE IF EXISTS `nota_rujuk_keluar`;
CREATE TABLE `nota_rujuk_keluar`  (
  `id_nota_rujuk_keluar` int(11) NOT NULL AUTO_INCREMENT,
  `idrujukkeluar_fk` int(11) NULL DEFAULT NULL,
  `kode_nota` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `create_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_nota_rujuk_keluar`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of nota_rujuk_keluar
-- ----------------------------
INSERT INTO `nota_rujuk_keluar` VALUES (1, 2, 'N86790784', '2020-02-20 10:13:59');
INSERT INTO `nota_rujuk_keluar` VALUES (2, 3, 'N73910434', '2020-02-23 07:27:47');

-- ----------------------------
-- Table structure for obat
-- ----------------------------
DROP TABLE IF EXISTS `obat`;
CREATE TABLE `obat`  (
  `id_obat` int(11) NOT NULL AUTO_INCREMENT,
  `nama` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `stok` int(255) NULL DEFAULT NULL,
  `foto` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `deskripsi` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `satuan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `harga` double(255, 0) NULL DEFAULT NULL,
  `kode` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `idsuplier_fk` int(11) NULL DEFAULT NULL,
  `limit_stok` int(255) NULL DEFAULT NULL,
  `create_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_obat`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of obat
-- ----------------------------
INSERT INTO `obat` VALUES (1, 'Dramamint', 19, 'fc2e814f70eb3ae9c73dad70fc9d976a.jpg', '<p>ini obat</p>\r\n', 'Kg', 50000, 'DR1', NULL, 10, '2020-02-01 07:33:44');
INSERT INTO `obat` VALUES (2, 'Bodrex', 29, '4243cc9db27ecb0e083266723ee7d273.jpg', '<p>dasdasd</p>\r\n', 'Tablet', 500, 'BR1', NULL, 8, '2020-03-01 07:33:44');
INSERT INTO `obat` VALUES (5, 'Laptop', 1, NULL, NULL, 'a', 111, 'O239957', 2, NULL, '2020-03-03 10:04:21');
INSERT INTO `obat` VALUES (6, 'sda', 4, NULL, NULL, 'q', 122, 'O999858', 2, NULL, '2020-03-03 10:05:38');
INSERT INTO `obat` VALUES (7, 'Laptop Dell 2011', 0, NULL, NULL, 'ew', 13, 'O645505', 2, NULL, '2020-03-03 10:06:14');
INSERT INTO `obat` VALUES (8, 'erre', 1, NULL, NULL, 'a', 222, 'O217007', 2, NULL, '2020-03-03 10:08:22');

-- ----------------------------
-- Table structure for obat_rekam
-- ----------------------------
DROP TABLE IF EXISTS `obat_rekam`;
CREATE TABLE `obat_rekam`  (
  `id_obat_rekam` int(11) NOT NULL AUTO_INCREMENT,
  `idrekammedis_fk` int(11) NULL DEFAULT NULL,
  `idobat_fk` int(11) NULL DEFAULT NULL,
  `jumlah` int(255) NULL DEFAULT NULL,
  `aturan_pakai` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `create_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_obat_rekam`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of obat_rekam
-- ----------------------------
INSERT INTO `obat_rekam` VALUES (5, 3, 2, 1, '', '2020-03-01 07:34:02');
INSERT INTO `obat_rekam` VALUES (6, 3, 1, 1, '', '2020-03-01 07:34:02');
INSERT INTO `obat_rekam` VALUES (7, 4, 2, 1, '3x1', '2020-03-01 07:34:02');
INSERT INTO `obat_rekam` VALUES (8, 4, 1, 2, '', '2020-03-01 07:34:02');
INSERT INTO `obat_rekam` VALUES (9, 10, 1, 1, '3x1', '2020-03-01 07:34:02');
INSERT INTO `obat_rekam` VALUES (10, 10, 2, 5, '3x2', '2020-03-01 07:34:02');
INSERT INTO `obat_rekam` VALUES (11, 11, 1, 1, 'ax1', '2020-03-01 07:34:02');
INSERT INTO `obat_rekam` VALUES (12, 16, 2, 5, '3x1', '2020-03-01 07:34:02');
INSERT INTO `obat_rekam` VALUES (13, 17, 1, 1, '3x1', '2020-03-01 07:34:02');
INSERT INTO `obat_rekam` VALUES (14, 19, 8, 10, '3x3', '2020-03-06 11:36:54');
INSERT INTO `obat_rekam` VALUES (15, 19, 7, 1, '3x1', '2020-03-06 11:36:54');
INSERT INTO `obat_rekam` VALUES (16, 20, 6, 6, '3x1', '2020-03-06 11:48:25');
INSERT INTO `obat_rekam` VALUES (17, 21, 2, 2, '3x1', '2020-03-06 12:45:46');
INSERT INTO `obat_rekam` VALUES (18, 21, 1, 1, '2x2', '2020-03-06 12:45:46');
INSERT INTO `obat_rekam` VALUES (19, 22, 2, 1, '3x1', '2020-03-06 12:47:39');
INSERT INTO `obat_rekam` VALUES (20, 23, 2, 1, '3x1', '2020-03-06 12:47:39');
INSERT INTO `obat_rekam` VALUES (21, 24, 2, 1, '3x1', '2020-03-06 12:48:06');
INSERT INTO `obat_rekam` VALUES (22, 25, 2, 1, '3x2', '2020-03-06 12:49:34');

-- ----------------------------
-- Table structure for pasien
-- ----------------------------
DROP TABLE IF EXISTS `pasien`;
CREATE TABLE `pasien`  (
  `id_pasien` int(11) NOT NULL AUTO_INCREMENT,
  `nama` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `no_hp` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `alamat` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `idkartu_fk` int(11) NULL DEFAULT NULL,
  `no_ktp` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `tanggal_lahir` date NULL DEFAULT NULL,
  `jenis_kelamin` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `pekerjaan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `kode_pasien` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `create_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_pasien`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pasien
-- ----------------------------
INSERT INTO `pasien` VALUES (1, 'Rendy Yani Susanto', '93102', 'Malang', 2, '12354', '2020-02-12', 'L', 'Presiden', 'P-2174021', '2020-03-01 07:34:51');
INSERT INTO `pasien` VALUES (3, 'Cicik Winarsih', '93102', 'Malang', 2, '12354', '2020-02-12', 'P', 'Presiden', 'P-7235158', '2020-03-01 07:34:51');
INSERT INTO `pasien` VALUES (4, 'Avi', '089328931', 'jsda', 3, '123', '2020-02-15', 'L', 'Programmer', 'P-4098774', '2020-03-01 07:34:51');
INSERT INTO `pasien` VALUES (5, 'Yanuar Wahyu', '08929192991', 'Malang', 4, '123112112', '2020-12-31', 'L', 'Magang', 'P-5238931', '2020-03-01 07:34:51');
INSERT INTO `pasien` VALUES (6, 'Agustin Pancarani', '1231', 'Malang', 4, '12391', '2020-12-31', 'P', 'Magang', 'P-2979302', '2020-03-01 07:34:51');
INSERT INTO `pasien` VALUES (10, 'Pak Ponidi', '0892912111', 'Jl. Singosari', 7, '1231231312', '2020-02-04', 'L', 'Petani', 'P-7671750', '2020-03-01 07:34:51');
INSERT INTO `pasien` VALUES (11, 'Bu Juariyah', '9879172938', 'Jl. Singosari', 7, '123138812', '2020-02-04', 'P', 'Petani', 'P-6502751', '2020-03-01 07:34:51');
INSERT INTO `pasien` VALUES (12, 'Aris Budianto', '0873921891', 'Jl. Singosari', 7, '8731298883', '2020-02-12', 'L', 'Siswa', 'P-6852539', '2020-03-01 07:34:51');
INSERT INTO `pasien` VALUES (13, 'ahmad', '312313', 'malang', 8, '31231231231', '2020-02-28', 'L', 'qweq', 'P-6117206', '2020-03-01 07:34:51');
INSERT INTO `pasien` VALUES (14, 'Yohan', '0819283772', 'Malang', 9, '7163662', '2020-02-28', 'L', 'Macul', 'P-2421773', '2020-03-01 07:34:51');
INSERT INTO `pasien` VALUES (15, 'Tacik', '1029', 'Malanh', 9, '166362', '2020-02-16', 'L', 'Rejej', 'P-9361868', '2020-03-01 07:34:51');

-- ----------------------------
-- Table structure for pengadaan_obat
-- ----------------------------
DROP TABLE IF EXISTS `pengadaan_obat`;
CREATE TABLE `pengadaan_obat`  (
  `id_pengadaan_obat` int(11) NOT NULL AUTO_INCREMENT,
  `tanggal` date NULL DEFAULT NULL,
  `idsuplier_fk` int(11) NULL DEFAULT NULL,
  `kode` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `create_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `total` double(255, 0) NULL DEFAULT NULL,
  `dibayar` double(255, 0) NULL DEFAULT NULL,
  `sisa` double(255, 0) NULL DEFAULT NULL,
  PRIMARY KEY (`id_pengadaan_obat`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pengadaan_obat
-- ----------------------------
INSERT INTO `pengadaan_obat` VALUES (1, '2020-03-03', 2, 'P-8428518', '2020-03-03 10:41:52', 30000, NULL, 5000);
INSERT INTO `pengadaan_obat` VALUES (2, '0000-00-00', 0, 'P-9977956', '2020-03-03 16:16:36', 50000, 50000, 0);

-- ----------------------------
-- Table structure for penggunaan_lain
-- ----------------------------
DROP TABLE IF EXISTS `penggunaan_lain`;
CREATE TABLE `penggunaan_lain`  (
  `id_penggunaan_lain` int(11) NOT NULL AUTO_INCREMENT,
  `tanggal` date NULL DEFAULT NULL,
  `kepentingan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `create_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `kode` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`id_penggunaan_lain`) USING BTREE
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
  `breadcrumb_elements` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of profil_website
-- ----------------------------
INSERT INTO `profil_website` VALUES ('Myber', 'Jl. Istana Mekar Wangi Utama No 1P-Q', '0812208979012', 'logo-w.png', 'bulb.png', 'undefined', 'Shop with the nature, Please shop with me', '<p>The Balance Small Business makes launching and managing your own business easy. It is home to experts who provide clear, practical advice on entrepreneurship and management. Whether you&rsquo;re just starting up or you want to take your company to the next level, our 20-year-strong library of more than 7,000 pieces of content will answer your questions and turn your business dreams into reality.</p>\n\n<p><a href=\"https://www.thebalancesmb.com/\">The Balance</a>&nbsp;is part of The Balance family of sites, including&nbsp;<a href=\"https://www.thebalance.com/\" rel=\"noopener\" target=\"_blank\">The Balance</a>&nbsp;and&nbsp;<a href=\"https://www.thebalancecareers.com/\" rel=\"noopener\" target=\"_blank\">The Balance Careers</a>, covering personal finance, career, and small business topics. With more than 24 million monthly visitors, The Balance is among the top-10 largest finance properties as measured by comScore, a leading Internet measurement company. Our more than 50 expert writers have extensive qualifications and expertise in their topics, including MBAs, PhDs, CFPs, other advanced degrees and professional certifications.</p>\n\n<p>The Balance family of sites have been honored by multiple awards in the last year, including&nbsp;<a href=\"https://www.tellyawards.com/winners/2017/short-form-social/general-education-discovery\" rel=\"noopener nofollow\" target=\"_blank\">The Telly Awards</a>,&nbsp;<a href=\"https://www.communicatorawards.com/\" rel=\"noopener nofollow\" target=\"_blank\">The Communicator Awards</a>, and&nbsp;<a href=\"https://www.editorandpublisher.com/news/editor-publisher-announces-the-2017-eppy-award-finalists/\" rel=\"noopener nofollow\" target=\"_blank\">Eppy Awards</a>.</p>\n', 'danielelvanda@yahoo.com', 'Daniel Elvanda Yohanes', 'undefined', 'undefined', 'undefined', 'undefined', 'a00ae551dd485419a57db462a6ae30b9.jpg', 'Halo Admin, Saya ingin bertanya/membeli/.....', 'd797c14a0070235734508b7d9f409395.jpg', '&copy; 2019. <a href=\"#\">Core Master</a> by<a href=\"https://myber.co.id\" target=\"_blank\">Myber</a>', 'Core Master');

-- ----------------------------
-- Table structure for rekam_medis
-- ----------------------------
DROP TABLE IF EXISTS `rekam_medis`;
CREATE TABLE `rekam_medis`  (
  `id_rekam_medis` int(11) NOT NULL AUTO_INCREMENT,
  `td` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `n` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `rr` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `tb` int(11) NULL DEFAULT NULL,
  `bb` int(11) NULL DEFAULT NULL,
  `s` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `keluhan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `idjenispasien_fk` int(11) NULL DEFAULT NULL,
  `diagnosis` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `saran` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `idpasien_fk` int(11) NULL DEFAULT NULL,
  `tanggal` date NULL DEFAULT NULL,
  `iddokter_fk` int(11) NULL DEFAULT NULL,
  `rand` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `total` double(255, 0) NULL DEFAULT NULL,
  `alergi_obat` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `dibayar` double(255, 0) NULL DEFAULT NULL,
  `idantrian_fk` int(11) NULL DEFAULT NULL,
  `create_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_rekam_medis`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of rekam_medis
-- ----------------------------
INSERT INTO `rekam_medis` VALUES (3, '1', '2', '3', 1, 6, '4', 'asd, asd, ss', 1, 'aaa, s, a', 'slad, kdsal', 1, '2020-12-31', 1, '5509109', 301500, NULL, NULL, NULL, '2020-03-01 07:35:04');
INSERT INTO `rekam_medis` VALUES (4, '100', '150', '200', 100, 12, '100', 's, a, s, d, a', 1, 'a, s, f, s, a', 'asd, asa, aa', 3, '2020-12-31', 1, '4211273', 350600, NULL, NULL, NULL, '2020-03-01 07:35:04');
INSERT INTO `rekam_medis` VALUES (10, '1', '2', '3', 1, 6, '4', 'sakit, kepala', 1, 'mending ke laut', 'asd', 1, '2020-02-27', 1, '3504818', 327500, 'drama', 325000, 16, '2020-03-01 07:35:04');
INSERT INTO `rekam_medis` VALUES (16, '10', '15', '10', 10, 112, '20', 'batuk, pilek', 1, 'flu', 'Tidur', 1, '2020-02-27', 1, '3291049', 27500, 'tidak', 27500, 17, '2020-03-01 07:35:04');
INSERT INTO `rekam_medis` VALUES (17, '90', '80', '90', 90, 150, '80', 'mangkel', 1, 'icd', 'coba lagi', 1, '2020-02-28', 1, '2198616', 150000, 'amox', 150000, 20, '2020-03-01 07:35:04');
INSERT INTO `rekam_medis` VALUES (18, '', '', '', 0, 0, '', '', 1, '', '', 4, '2020-02-28', 1, '40227', 25000, '', 0, 19, '2020-03-01 07:35:04');
INSERT INTO `rekam_medis` VALUES (19, '10', '11', '100', 10, 100, '200', 'Sakit', 1, 'lupa', 'mati', 1, '2020-03-06', 1, '8810710', 102233, 'dramamint', 102233, 32, '2020-03-06 11:36:54');
INSERT INTO `rekam_medis` VALUES (20, '59', '100', '100', 59, 101, '100', 'sakit perut, sakit kepala', 1, 'Korona', 'buka bapak', 15, '2020-03-06', 1, '6883445', 175732, 'bodrek', 175732, 33, '2020-03-06 11:48:25');
INSERT INTO `rekam_medis` VALUES (21, '20', '19', '11', 20, 201, '110', 'sakit', 1, 'asd', 'asdad', 3, '2020-03-06', 1, '5737196', 151000, 'dsad', 101000, 34, '2020-03-06 12:45:46');
INSERT INTO `rekam_medis` VALUES (22, '22', '22', '33', 22, 123, '33', 'ewq', 1, 'wqe', 'asd', 3, '2020-03-06', 1, '9479975', 100500, 'asd', 1, 35, '2020-03-06 12:47:39');
INSERT INTO `rekam_medis` VALUES (23, '22', '22', '33', 22, 123, '33', 'ewq', 1, 'wqe', 'asd', 3, '2020-03-06', 1, '9251428', 100500, 'asd', 1, 35, '2020-03-06 12:47:39');
INSERT INTO `rekam_medis` VALUES (24, '22', '22', '33', 22, 123, '33', 'ewq', 1, 'wqe', 'asd', 3, '2020-03-06', 1, '7345774', 100500, 'asd', 50500, 35, '2020-03-06 12:48:06');
INSERT INTO `rekam_medis` VALUES (25, '55', '66', '55', 55, 44, '44', 'asd, asd', 2, '', '', 15, '2020-03-06', 1, '6690410', 35500, '', 15500, 36, '2020-03-06 12:49:34');

-- ----------------------------
-- Table structure for ruangan
-- ----------------------------
DROP TABLE IF EXISTS `ruangan`;
CREATE TABLE `ruangan`  (
  `id_ruangan` int(11) NOT NULL AUTO_INCREMENT,
  `nama` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `kode_ruangan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `create_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `tipe` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `harga` double NULL DEFAULT NULL,
  PRIMARY KEY (`id_ruangan`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ruangan
-- ----------------------------
INSERT INTO `ruangan` VALUES (1, 'Ruang Obat', 'OBAT', '2020-03-01 07:35:15', 'UMUM', NULL);
INSERT INTO `ruangan` VALUES (2, 'Ruang Dapur', 'DAPUR', '2020-03-01 07:35:15', 'UMUM', NULL);
INSERT INTO `ruangan` VALUES (3, 'Ruang Tunggu', 'RUANG TUNGGU', '2020-03-01 07:35:15', 'UMUM', NULL);

-- ----------------------------
-- Table structure for rujukan_keluar
-- ----------------------------
DROP TABLE IF EXISTS `rujukan_keluar`;
CREATE TABLE `rujukan_keluar`  (
  `id_rujukan_keluar` int(11) NOT NULL AUTO_INCREMENT,
  `idpasien_fk` int(11) NULL DEFAULT NULL,
  `diagnosa` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `terapi` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `idtujuanrujuk_fk` int(11) NULL DEFAULT NULL,
  `tanggal` date NULL DEFAULT NULL,
  `rand` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `create_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_rujukan_keluar`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of rujukan_keluar
-- ----------------------------
INSERT INTO `rujukan_keluar` VALUES (2, 6, 'dsakl', 'sfkjla', 1, '2020-02-20', '5187312', '2020-02-20 10:13:59');
INSERT INTO `rujukan_keluar` VALUES (3, 12, 'das, asd', 'asda', 2, '2020-02-23', '528098', '2020-02-23 07:27:47');

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
-- Table structure for suplier
-- ----------------------------
DROP TABLE IF EXISTS `suplier`;
CREATE TABLE `suplier`  (
  `id_suplier` int(11) NOT NULL AUTO_INCREMENT,
  `nama` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `no_hp` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `alamat` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `idjenissuplier_fk` int(11) NULL DEFAULT NULL,
  `deskripsi` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `foto` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `create_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_suplier`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of suplier
-- ----------------------------
INSERT INTO `suplier` VALUES (2, 'Myber', '93102', 'malang', NULL, NULL, NULL, '2020-03-01 07:35:42');
INSERT INTO `suplier` VALUES (3, 'Tidak Ada', NULL, NULL, 0, NULL, NULL, '2020-03-01 07:35:42');

-- ----------------------------
-- Table structure for tindakan
-- ----------------------------
DROP TABLE IF EXISTS `tindakan`;
CREATE TABLE `tindakan`  (
  `id_tindakan` int(11) NOT NULL AUTO_INCREMENT,
  `tindakan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `tarif` double(255, 0) NULL DEFAULT NULL,
  `create_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_tindakan`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tindakan
-- ----------------------------
INSERT INTO `tindakan` VALUES (1, 'Tes Gula Darah', 25000, '2020-03-01 07:35:31');
INSERT INTO `tindakan` VALUES (2, 'Suntik Mati', 150000, '2020-03-01 07:35:31');
INSERT INTO `tindakan` VALUES (3, 'Spooling', 50000, '2020-03-01 07:35:31');

-- ----------------------------
-- Table structure for tindakan_rekam
-- ----------------------------
DROP TABLE IF EXISTS `tindakan_rekam`;
CREATE TABLE `tindakan_rekam`  (
  `id_tindakan_rekam` int(11) NOT NULL AUTO_INCREMENT,
  `idrekammedis_fk` int(11) NULL DEFAULT NULL,
  `idtindakan_fk` int(11) NULL DEFAULT NULL,
  `create_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_tindakan_rekam`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tindakan_rekam
-- ----------------------------
INSERT INTO `tindakan_rekam` VALUES (5, 3, 1, '2020-03-01 07:35:50');
INSERT INTO `tindakan_rekam` VALUES (6, 3, 2, '2020-03-01 07:35:50');
INSERT INTO `tindakan_rekam` VALUES (7, 4, 1, '2020-03-01 07:35:50');
INSERT INTO `tindakan_rekam` VALUES (8, 4, 2, '2020-03-01 07:35:50');
INSERT INTO `tindakan_rekam` VALUES (9, 10, 2, '2020-03-01 07:35:50');
INSERT INTO `tindakan_rekam` VALUES (10, 11, 1, '2020-03-01 07:35:50');
INSERT INTO `tindakan_rekam` VALUES (11, 17, 1, '2020-03-01 07:35:50');
INSERT INTO `tindakan_rekam` VALUES (12, 19, 1, '2020-03-06 11:36:54');
INSERT INTO `tindakan_rekam` VALUES (13, 20, 2, '2020-03-06 11:48:25');
INSERT INTO `tindakan_rekam` VALUES (14, 21, 1, '2020-03-06 12:45:46');
INSERT INTO `tindakan_rekam` VALUES (15, 22, 1, '2020-03-06 12:47:39');
INSERT INTO `tindakan_rekam` VALUES (16, 23, 1, '2020-03-06 12:47:39');
INSERT INTO `tindakan_rekam` VALUES (17, 24, 1, '2020-03-06 12:48:06');
INSERT INTO `tindakan_rekam` VALUES (18, 25, 1, '2020-03-06 12:49:34');

-- ----------------------------
-- Table structure for tujuan_rujuk
-- ----------------------------
DROP TABLE IF EXISTS `tujuan_rujuk`;
CREATE TABLE `tujuan_rujuk`  (
  `id_tujuan_rujuk` int(11) NOT NULL AUTO_INCREMENT,
  `tujuan_rujuk` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `create_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_tujuan_rujuk`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tujuan_rujuk
-- ----------------------------
INSERT INTO `tujuan_rujuk` VALUES (1, 'RS. Panti Nirmala', '2020-03-01 07:35:57');
INSERT INTO `tujuan_rujuk` VALUES (2, 'RS. Saiful Anwar', '2020-03-01 07:35:57');
INSERT INTO `tujuan_rujuk` VALUES (3, 'Klinik Sekarpuro', '2020-03-01 07:35:57');

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
INSERT INTO `users` VALUES (1, '127.0.0.1', 'admin', '$2y$08$mxSDKMRKsKM3IwN6NPoB6.3pQqymDu4ZtGAMIzpw.ppcie3MJM9ty', '', 'hello@admin.com', '', NULL, NULL, NULL, 1268889823, 1583481134, 1, 'Rendy', 'Yani', 'ADMIN', '085894632505', '3c8f6f36f650d5ce07803470b4f4d4ff.jpg', NULL, NULL);

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

-- ----------------------------
-- View structure for v_antrian
-- ----------------------------
DROP VIEW IF EXISTS `v_antrian`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_antrian` AS SELECT
antrian.id_antrian,
antrian.create_at,
antrian.`status`,
pasien.id_pasien,
pasien.nama,
pasien.no_hp,
pasien.alamat,
pasien.idkartu_fk,
pasien.no_ktp,
pasien.tanggal_lahir,
pasien.jenis_kelamin,
pasien.pekerjaan,
pasien.kode_pasien,
antrian.no_antrian,
antrian.kode
FROM
antrian
INNER JOIN pasien ON antrian.idpasien_fk = pasien.id_pasien ;

-- ----------------------------
-- View structure for v_rekam_medis
-- ----------------------------
DROP VIEW IF EXISTS `v_rekam_medis`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_rekam_medis` AS SELECT
pasien.id_pasien,
pasien.nama,
pasien.no_hp,
pasien.alamat,
pasien.idkartu_fk,
pasien.no_ktp,
pasien.tanggal_lahir,
pasien.jenis_kelamin,
pasien.pekerjaan,
pasien.kode_pasien,
rekam_medis.id_rekam_medis,
rekam_medis.td,
rekam_medis.n,
rekam_medis.rr,
rekam_medis.tb,
rekam_medis.bb,
rekam_medis.s,
rekam_medis.keluhan,
rekam_medis.idjenispasien_fk,
rekam_medis.diagnosis,
rekam_medis.saran,
rekam_medis.idpasien_fk,
rekam_medis.tanggal,
rekam_medis.iddokter_fk,
rekam_medis.rand,
rekam_medis.total
FROM
pasien
INNER JOIN rekam_medis ON pasien.id_pasien = rekam_medis.idpasien_fk ;

SET FOREIGN_KEY_CHECKS = 1;
