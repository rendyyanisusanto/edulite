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

 Date: 13/09/2023 07:44:54
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for detail_komponen_penggajian
-- ----------------------------
DROP TABLE IF EXISTS `detail_komponen_penggajian`;
CREATE TABLE `detail_komponen_penggajian`  (
  `id_detail_komponen_penggajian` int NOT NULL AUTO_INCREMENT,
  `idkomponenpenggajian_fk` int NULL DEFAULT NULL,
  `jumlah` decimal(20, 2) NULL DEFAULT NULL,
  `idpenggajian_fk` int NULL DEFAULT NULL,
  `keterangan` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `sum` int NULL DEFAULT NULL,
  `total` decimal(20, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`id_detail_komponen_penggajian`) USING BTREE,
  INDEX `idpenggajian_fk`(`idpenggajian_fk` ASC) USING BTREE,
  CONSTRAINT `detail_komponen_penggajian_ibfk_1` FOREIGN KEY (`idpenggajian_fk`) REFERENCES `penggajian` (`id_penggajian`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 57 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of detail_komponen_penggajian
-- ----------------------------
INSERT INTO `detail_komponen_penggajian` VALUES (33, 1, 800000.00, 7, '', 1, 800000.00);
INSERT INTO `detail_komponen_penggajian` VALUES (34, 2, 25000.00, 7, '', 6, 150000.00);
INSERT INTO `detail_komponen_penggajian` VALUES (35, 3, 10000.00, 7, '', 10, 100000.00);
INSERT INTO `detail_komponen_penggajian` VALUES (36, 4, 10000.00, 7, '', 5, 50000.00);
INSERT INTO `detail_komponen_penggajian` VALUES (37, 5, 10000.00, 7, '', 1, 10000.00);
INSERT INTO `detail_komponen_penggajian` VALUES (38, 6, 5000.00, 7, '', 1, 5000.00);
INSERT INTO `detail_komponen_penggajian` VALUES (39, 7, 10000.00, 7, '', 1, 10000.00);
INSERT INTO `detail_komponen_penggajian` VALUES (40, 8, 5000.00, 7, '', 1, 5000.00);
INSERT INTO `detail_komponen_penggajian` VALUES (41, 1, 600000.00, 8, '', 1, 600000.00);
INSERT INTO `detail_komponen_penggajian` VALUES (42, 2, 25000.00, 8, '', 1, 25000.00);
INSERT INTO `detail_komponen_penggajian` VALUES (43, 3, 10000.00, 8, '', 1, 10000.00);
INSERT INTO `detail_komponen_penggajian` VALUES (44, 4, 10000.00, 8, '', 1, 10000.00);
INSERT INTO `detail_komponen_penggajian` VALUES (45, 5, 10000.00, 8, '', 1, 10000.00);
INSERT INTO `detail_komponen_penggajian` VALUES (46, 6, 5000.00, 8, '', 1, 5000.00);
INSERT INTO `detail_komponen_penggajian` VALUES (47, 7, 10000.00, 8, '', 1, 10000.00);
INSERT INTO `detail_komponen_penggajian` VALUES (48, 8, 5000.00, 8, '', 1, 5000.00);
INSERT INTO `detail_komponen_penggajian` VALUES (49, 1, 0.00, 9, '', 1, 0.00);
INSERT INTO `detail_komponen_penggajian` VALUES (50, 2, 25000.00, 9, '', 1, 25000.00);
INSERT INTO `detail_komponen_penggajian` VALUES (51, 3, 10000.00, 9, '', 1, 10000.00);
INSERT INTO `detail_komponen_penggajian` VALUES (52, 4, 10000.00, 9, '', 1, 10000.00);
INSERT INTO `detail_komponen_penggajian` VALUES (53, 5, 10000.00, 9, '', 1, 10000.00);
INSERT INTO `detail_komponen_penggajian` VALUES (54, 6, 5000.00, 9, '', 1, 5000.00);
INSERT INTO `detail_komponen_penggajian` VALUES (55, 7, 10000.00, 9, '', 1, 10000.00);
INSERT INTO `detail_komponen_penggajian` VALUES (56, 8, 5000.00, 9, '', 1, 5000.00);

-- ----------------------------
-- Table structure for detail_tambahan_penggajian
-- ----------------------------
DROP TABLE IF EXISTS `detail_tambahan_penggajian`;
CREATE TABLE `detail_tambahan_penggajian`  (
  `id_detail_tambahan_penggajian` int NOT NULL AUTO_INCREMENT,
  `idpenggajian_fk` int NULL DEFAULT NULL,
  `nama` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `jumlah` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `saldo` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `keterangan` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_detail_tambahan_penggajian`) USING BTREE,
  INDEX `idpenggajian_fk`(`idpenggajian_fk` ASC) USING BTREE,
  CONSTRAINT `detail_tambahan_penggajian_ibfk_1` FOREIGN KEY (`idpenggajian_fk`) REFERENCES `penggajian` (`id_penggajian`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of detail_tambahan_penggajian
-- ----------------------------
INSERT INTO `detail_tambahan_penggajian` VALUES (21, 7, 'HR Website', '50000', 'D', 'Pembuatan sistem sekolah');
INSERT INTO `detail_tambahan_penggajian` VALUES (22, 7, 'utang ke sekolah', '20000', 'K', '');

-- ----------------------------
-- Table structure for jenis_penggajian
-- ----------------------------
DROP TABLE IF EXISTS `jenis_penggajian`;
CREATE TABLE `jenis_penggajian`  (
  `id_jenis_penggajian` int NOT NULL AUTO_INCREMENT,
  `jenis_penggajian` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `saldo` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_jenis_penggajian`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jenis_penggajian
-- ----------------------------
INSERT INTO `jenis_penggajian` VALUES (1, 'HR', 'D');
INSERT INTO `jenis_penggajian` VALUES (2, 'Potongan', 'K');

-- ----------------------------
-- Table structure for komponen_penggajian
-- ----------------------------
DROP TABLE IF EXISTS `komponen_penggajian`;
CREATE TABLE `komponen_penggajian`  (
  `id_komponen_penggajian` int NOT NULL AUTO_INCREMENT,
  `idtemplatepenggajian_fk` int NULL DEFAULT NULL,
  `komponen_penggajian` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `jumlah` decimal(20, 2) NULL DEFAULT NULL,
  `idjenispenggajian_fk` int NULL DEFAULT NULL,
  `is_sum` int NULL DEFAULT NULL,
  PRIMARY KEY (`id_komponen_penggajian`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of komponen_penggajian
-- ----------------------------
INSERT INTO `komponen_penggajian` VALUES (1, 1, 'HR Jabatan', 0.00, 1, 0);
INSERT INTO `komponen_penggajian` VALUES (2, 1, 'HR Mengajar', 25000.00, 1, 1);
INSERT INTO `komponen_penggajian` VALUES (3, 1, 'HR Mengajar 1/2 Hari', 10000.00, 1, 1);
INSERT INTO `komponen_penggajian` VALUES (4, 1, 'HR Piket', 10000.00, 1, 1);
INSERT INTO `komponen_penggajian` VALUES (5, 1, 'HR Rapat', 10000.00, 1, 1);
INSERT INTO `komponen_penggajian` VALUES (6, 1, 'Konsumsi', 5000.00, 2, 1);
INSERT INTO `komponen_penggajian` VALUES (7, 1, 'TAB', 10000.00, 2, 1);
INSERT INTO `komponen_penggajian` VALUES (8, 1, 'Koperasi', 5000.00, 2, 1);

-- ----------------------------
-- Table structure for penggajian
-- ----------------------------
DROP TABLE IF EXISTS `penggajian`;
CREATE TABLE `penggajian`  (
  `id_penggajian` int NOT NULL AUTO_INCREMENT,
  `bulan` int NULL DEFAULT NULL,
  `tahun` int NULL DEFAULT NULL,
  `keterangan` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `idguru_fk` int NULL DEFAULT NULL,
  `total` double(20, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`id_penggajian`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of penggajian
-- ----------------------------
INSERT INTO `penggajian` VALUES (7, 9, 2023, NULL, '2023-09-12 18:32:02', 40, 1120000.00);
INSERT INTO `penggajian` VALUES (8, 8, 2023, NULL, '2023-09-12 20:50:53', 40, 635000.00);
INSERT INTO `penggajian` VALUES (9, 9, 2023, NULL, '2023-09-12 21:16:32', 30, 35000.00);

-- ----------------------------
-- Table structure for template_penggajian
-- ----------------------------
DROP TABLE IF EXISTS `template_penggajian`;
CREATE TABLE `template_penggajian`  (
  `id_template_penggajian` int NOT NULL AUTO_INCREMENT,
  `kode` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nama` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `is_active` int NULL DEFAULT NULL,
  PRIMARY KEY (`id_template_penggajian`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of template_penggajian
-- ----------------------------
INSERT INTO `template_penggajian` VALUES (1, '1', 'Template 1', 1);
INSERT INTO `template_penggajian` VALUES (2, '2', 'Template 2', 0);

SET FOREIGN_KEY_CHECKS = 1;
