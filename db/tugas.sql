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

 Date: 27/07/2024 13:53:49
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tugas
-- ----------------------------
DROP TABLE IF EXISTS `tugas`;
CREATE TABLE `tugas`  (
  `id_tugas` int(11) NOT NULL AUTO_INCREMENT,
  `kode` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `deskripsi` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `idguru_fk` int(11) NULL DEFAULT NULL,
  `idmapel_fk` int(11) NULL DEFAULT NULL,
  `judul` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `deadline` date NULL DEFAULT NULL,
  `idtahunajaran_fk` int(11) NULL DEFAULT NULL,
  `idkelas_fk` int(11) NULL DEFAULT NULL,
  `status` tinyint(255) NULL DEFAULT NULL,
  `tanggal` date NULL DEFAULT NULL,
  `foto` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_tugas`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
