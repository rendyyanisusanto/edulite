/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 100138 (10.1.38-MariaDB)
 Source Host           : localhost:3306
 Source Schema         : edulite

 Target Server Type    : MySQL
 Target Server Version : 100138 (10.1.38-MariaDB)
 File Encoding         : 65001

 Date: 05/08/2024 06:58:33
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for kategori_penitipan
-- ----------------------------
DROP TABLE IF EXISTS `kategori_penitipan`;
CREATE TABLE `kategori_penitipan`  (
  `id_kategori_penitipan` int NOT NULL AUTO_INCREMENT,
  `kategori` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_kategori_penitipan`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of kategori_penitipan
-- ----------------------------
INSERT INTO `kategori_penitipan` VALUES (3, 'Laptop');

-- ----------------------------
-- Table structure for lokasi_penitipan
-- ----------------------------
DROP TABLE IF EXISTS `lokasi_penitipan`;
CREATE TABLE `lokasi_penitipan`  (
  `id_lokasi_penitipan` int NOT NULL AUTO_INCREMENT,
  `lokasi` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_lokasi_penitipan`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of lokasi_penitipan
-- ----------------------------
INSERT INTO `lokasi_penitipan` VALUES (1, 'Loker Laboratorium No 1');

-- ----------------------------
-- Table structure for mutasi_penitipan
-- ----------------------------
DROP TABLE IF EXISTS `mutasi_penitipan`;
CREATE TABLE `mutasi_penitipan`  (
  `id_mutasi_penitipan` int NOT NULL AUTO_INCREMENT,
  `idpenitipanbarang_fk` int NULL DEFAULT NULL,
  `pinjam` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kembali` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tanggal` date NULL DEFAULT NULL,
  PRIMARY KEY (`id_mutasi_penitipan`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of mutasi_penitipan
-- ----------------------------
INSERT INTO `mutasi_penitipan` VALUES (1, 3, '18:59:18', '', '2024-08-04');
INSERT INTO `mutasi_penitipan` VALUES (2, 4, '19:12:09', '19:16:03', '2024-08-04');

-- ----------------------------
-- Table structure for penitipan_barang
-- ----------------------------
DROP TABLE IF EXISTS `penitipan_barang`;
CREATE TABLE `penitipan_barang`  (
  `id_penitipan_barang` int NOT NULL AUTO_INCREMENT,
  `table` varchar(11) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `idtable_fk` int NULL DEFAULT NULL,
  `nama_barang` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `idlokasipenitipan_fk` int NULL DEFAULT NULL,
  `idkategoripenitipan_fk` int NULL DEFAULT NULL,
  `tanggal` date NULL DEFAULT NULL,
  `spesifikasi` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `keterangan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `kode` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `rfid` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `foto` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_penitipan_barang`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of penitipan_barang
-- ----------------------------
INSERT INTO `penitipan_barang` VALUES (3, 'guru', 40, 'Laptop Rendy', 1, 3, '2024-08-04', 'Core i5', 'Libur untuk kegiatan rapat ', '6475584', '2312312', '1807d15836abb9aa742edbb76bd32cad.png');
INSERT INTO `penitipan_barang` VALUES (4, 'siswa', 754, 'Laptop Ajib', 1, 3, '2024-08-04', 'Core i5', 'Libur untuk kegiatan rapat ', '10', '31231', 'e4c2894a39a6e36b3dfa865df425cf1d.jpg');

SET FOREIGN_KEY_CHECKS = 1;
