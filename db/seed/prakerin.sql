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

 Date: 14/01/2024 21:01:14
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for prakerin
-- ----------------------------
DROP TABLE IF EXISTS `prakerin`;
CREATE TABLE `prakerin`  (
  `id_prakerin` int NOT NULL AUTO_INCREMENT,
  `tahun_ajaran` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `status` int NULL DEFAULT 1,
  PRIMARY KEY (`id_prakerin`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of prakerin
-- ----------------------------
INSERT INTO `prakerin` VALUES (1, '2024/2025', 1);

-- ----------------------------
-- Table structure for prakerin_jurnal_harian
-- ----------------------------
DROP TABLE IF EXISTS `prakerin_jurnal_harian`;
CREATE TABLE `prakerin_jurnal_harian`  (
  `id_prakerin_jurnal_harian` int NOT NULL AUTO_INCREMENT,
  `idsiswa_fk` int NULL DEFAULT NULL,
  `tanggal` date NULL DEFAULT NULL,
  `kegiatan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `status` int NULL DEFAULT 0,
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_prakerin_jurnal_harian`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of prakerin_jurnal_harian
-- ----------------------------

-- ----------------------------
-- Table structure for prakerin_kelompok
-- ----------------------------
DROP TABLE IF EXISTS `prakerin_kelompok`;
CREATE TABLE `prakerin_kelompok`  (
  `id_prakerin_kelompok` int NOT NULL AUTO_INCREMENT,
  `nama_kelompok` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `idprakerin_fk` int NULL DEFAULT NULL,
  PRIMARY KEY (`id_prakerin_kelompok`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of prakerin_kelompok
-- ----------------------------
INSERT INTO `prakerin_kelompok` VALUES (1, 'Kelompok 1 - Produk Inovasi', 1);
INSERT INTO `prakerin_kelompok` VALUES (2, 'Kelompok 2 - Brand Progli ', 1);
INSERT INTO `prakerin_kelompok` VALUES (3, 'Kelompok 3 - Produk Non Pangan', 1);
INSERT INTO `prakerin_kelompok` VALUES (4, 'Kelompok 4 - Packaging dan Labeling', 1);
INSERT INTO `prakerin_kelompok` VALUES (5, 'Kelompok 5 - Visual Branding 1', 1);
INSERT INTO `prakerin_kelompok` VALUES (6, 'Kelompok 6 - Visual Branding 2', 1);
INSERT INTO `prakerin_kelompok` VALUES (7, 'Kelompok 7 - CC Project', 1);
INSERT INTO `prakerin_kelompok` VALUES (8, 'Kelompok 8 - Maintenance', 1);
INSERT INTO `prakerin_kelompok` VALUES (9, 'Kelompok 9 - Maintenance', 1);
INSERT INTO `prakerin_kelompok` VALUES (10, 'Kelompok 10 - Networking', 1);
INSERT INTO `prakerin_kelompok` VALUES (11, 'Kelompok 11 - Networking', 1);
INSERT INTO `prakerin_kelompok` VALUES (12, 'Kelompok 12 - SARPRAS', 1);
INSERT INTO `prakerin_kelompok` VALUES (13, 'Kelompok 13 - UI/UX', 1);
INSERT INTO `prakerin_kelompok` VALUES (14, 'Kelompok 14 - Game Dev', 1);

-- ----------------------------
-- Table structure for prakerin_pembimbing
-- ----------------------------
DROP TABLE IF EXISTS `prakerin_pembimbing`;
CREATE TABLE `prakerin_pembimbing`  (
  `id_prakerin_pembimbing` int NOT NULL AUTO_INCREMENT,
  `idguru_fk` int NULL DEFAULT NULL,
  `idprakerinkelompok_fk` int NULL DEFAULT NULL,
  PRIMARY KEY (`id_prakerin_pembimbing`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of prakerin_pembimbing
-- ----------------------------
INSERT INTO `prakerin_pembimbing` VALUES (2, 41, 1);
INSERT INTO `prakerin_pembimbing` VALUES (3, 50, 2);
INSERT INTO `prakerin_pembimbing` VALUES (4, 53, 3);
INSERT INTO `prakerin_pembimbing` VALUES (5, 43, 4);
INSERT INTO `prakerin_pembimbing` VALUES (6, 39, 5);
INSERT INTO `prakerin_pembimbing` VALUES (7, 57, 6);
INSERT INTO `prakerin_pembimbing` VALUES (8, 40, 7);
INSERT INTO `prakerin_pembimbing` VALUES (9, 30, 8);
INSERT INTO `prakerin_pembimbing` VALUES (10, 31, 9);
INSERT INTO `prakerin_pembimbing` VALUES (11, 32, 10);
INSERT INTO `prakerin_pembimbing` VALUES (12, 45, 11);
INSERT INTO `prakerin_pembimbing` VALUES (13, 46, 12);
INSERT INTO `prakerin_pembimbing` VALUES (14, 56, 13);
INSERT INTO `prakerin_pembimbing` VALUES (15, 55, 14);

-- ----------------------------
-- Table structure for prakerin_siswa
-- ----------------------------
DROP TABLE IF EXISTS `prakerin_siswa`;
CREATE TABLE `prakerin_siswa`  (
  `id_prakerin_siswa` int NOT NULL AUTO_INCREMENT,
  `idprakerin_fk` int NULL DEFAULT NULL,
  `idsiswa_fk` int NULL DEFAULT NULL,
  `idprakerinkelompok_fk` int NULL DEFAULT NULL,
  PRIMARY KEY (`id_prakerin_siswa`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 68 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of prakerin_siswa
-- ----------------------------
INSERT INTO `prakerin_siswa` VALUES (18, 1, 834, 1);
INSERT INTO `prakerin_siswa` VALUES (19, 1, 829, 1);
INSERT INTO `prakerin_siswa` VALUES (20, 1, 835, 1);
INSERT INTO `prakerin_siswa` VALUES (21, 1, 830, 2);
INSERT INTO `prakerin_siswa` VALUES (22, 1, 831, 2);
INSERT INTO `prakerin_siswa` VALUES (23, 1, 832, 2);
INSERT INTO `prakerin_siswa` VALUES (24, 1, 833, 3);
INSERT INTO `prakerin_siswa` VALUES (25, 1, 836, 3);
INSERT INTO `prakerin_siswa` VALUES (26, 1, 837, 3);
INSERT INTO `prakerin_siswa` VALUES (27, 1, 880, 5);
INSERT INTO `prakerin_siswa` VALUES (28, 1, 882, 5);
INSERT INTO `prakerin_siswa` VALUES (29, 1, 883, 5);
INSERT INTO `prakerin_siswa` VALUES (30, 1, 884, 5);
INSERT INTO `prakerin_siswa` VALUES (31, 1, 885, 5);
INSERT INTO `prakerin_siswa` VALUES (32, 1, 825, 4);
INSERT INTO `prakerin_siswa` VALUES (33, 1, 828, 4);
INSERT INTO `prakerin_siswa` VALUES (34, 1, 877, 6);
INSERT INTO `prakerin_siswa` VALUES (35, 1, 879, 6);
INSERT INTO `prakerin_siswa` VALUES (36, 1, 881, 6);
INSERT INTO `prakerin_siswa` VALUES (37, 1, 886, 6);
INSERT INTO `prakerin_siswa` VALUES (38, 1, 887, 6);
INSERT INTO `prakerin_siswa` VALUES (39, 1, 788, 7);
INSERT INTO `prakerin_siswa` VALUES (40, 1, 791, 7);
INSERT INTO `prakerin_siswa` VALUES (41, 1, 793, 7);
INSERT INTO `prakerin_siswa` VALUES (42, 1, 802, 7);
INSERT INTO `prakerin_siswa` VALUES (43, 1, 803, 7);
INSERT INTO `prakerin_siswa` VALUES (44, 1, 792, 8);
INSERT INTO `prakerin_siswa` VALUES (45, 1, 795, 8);
INSERT INTO `prakerin_siswa` VALUES (46, 1, 797, 8);
INSERT INTO `prakerin_siswa` VALUES (47, 1, 798, 9);
INSERT INTO `prakerin_siswa` VALUES (48, 1, 800, 9);
INSERT INTO `prakerin_siswa` VALUES (49, 1, 805, 9);
INSERT INTO `prakerin_siswa` VALUES (50, 1, 806, 10);
INSERT INTO `prakerin_siswa` VALUES (51, 1, 790, 10);
INSERT INTO `prakerin_siswa` VALUES (52, 1, 794, 10);
INSERT INTO `prakerin_siswa` VALUES (53, 1, 801, 11);
INSERT INTO `prakerin_siswa` VALUES (54, 1, 804, 11);
INSERT INTO `prakerin_siswa` VALUES (55, 1, 808, 11);
INSERT INTO `prakerin_siswa` VALUES (56, 1, 789, 12);
INSERT INTO `prakerin_siswa` VALUES (57, 1, 807, 12);
INSERT INTO `prakerin_siswa` VALUES (58, 1, 888, 13);
INSERT INTO `prakerin_siswa` VALUES (59, 1, 889, 13);
INSERT INTO `prakerin_siswa` VALUES (60, 1, 890, 13);
INSERT INTO `prakerin_siswa` VALUES (61, 1, 891, 13);
INSERT INTO `prakerin_siswa` VALUES (62, 1, 892, 13);
INSERT INTO `prakerin_siswa` VALUES (63, 1, 893, 13);
INSERT INTO `prakerin_siswa` VALUES (64, 1, 809, 14);
INSERT INTO `prakerin_siswa` VALUES (65, 1, 810, 14);
INSERT INTO `prakerin_siswa` VALUES (66, 1, 811, 14);
INSERT INTO `prakerin_siswa` VALUES (67, 1, 812, 14);

SET FOREIGN_KEY_CHECKS = 1;
