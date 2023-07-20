/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 100138
 Source Host           : localhost:3306
 Source Schema         : smm-polaris

 Target Server Type    : MySQL
 Target Server Version : 100138
 File Encoding         : 65001

 Date: 19/05/2023 09:18:12
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for akun
-- ----------------------------
DROP TABLE IF EXISTS `akun`;
CREATE TABLE `akun`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `no_ref` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `nama` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `indukakun_id` int(11) NULL DEFAULT NULL,
  `saldo_normal` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `create_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `is_edit` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of akun
-- ----------------------------
INSERT INTO `akun` VALUES (1, '1101', 'Kas', 1, 'D', '2020-12-11 16:39:34', 0);
INSERT INTO `akun` VALUES (2, '1102', 'BANK', 1, 'D', '2020-12-11 16:39:44', 0);
INSERT INTO `akun` VALUES (3, '1103', 'Deposito', 1, 'D', '2020-12-11 16:39:55', 0);
INSERT INTO `akun` VALUES (4, '1104', 'Piutang', 1, 'D', '2020-12-11 16:40:04', 0);
INSERT INTO `akun` VALUES (5, '1105', 'Persediaan', 1, 'D', '2020-12-11 16:40:12', 0);
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
INSERT INTO `akun` VALUES (35, '4104', 'Diskon Lain', 6, 'D', '2022-07-23 08:31:56', 0);
INSERT INTO `akun` VALUES (36, '4203', 'Diskon Penjualan', 7, 'D', '2023-05-04 20:27:20', 0);
INSERT INTO `akun` VALUES (37, '1106', 'Diskon Pembelian', 1, 'K', '2023-05-04 20:30:00', 0);
INSERT INTO `akun` VALUES (38, '1108', 'PPn Pembelian', 1, 'K', '2023-05-05 21:03:37', 0);
INSERT INTO `akun` VALUES (39, '4204', 'PPn Penjualan', 7, 'D', '2023-05-05 21:03:56', 0);

-- ----------------------------
-- Table structure for bank
-- ----------------------------
DROP TABLE IF EXISTS `bank`;
CREATE TABLE `bank`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bank` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `rekening` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of bank
-- ----------------------------
INSERT INTO `bank` VALUES (1, 'BRI', '12312312');
INSERT INTO `bank` VALUES (2, 'BCA', '23322123');
INSERT INTO `bank` VALUES (3, 'BNI', '3123128309');

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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of coa
-- ----------------------------
INSERT INTO `coa` VALUES (1, 'Aktiva');
INSERT INTO `coa` VALUES (2, 'Kewajiban');
INSERT INTO `coa` VALUES (3, 'Aktiva Bersih');
INSERT INTO `coa` VALUES (4, 'Penerimaan');
INSERT INTO `coa` VALUES (5, 'Biaya');

-- ----------------------------
-- Table structure for detail_bahan_produksi
-- ----------------------------
DROP TABLE IF EXISTS `detail_bahan_produksi`;
CREATE TABLE `detail_bahan_produksi`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `produk_id` int(11) NULL DEFAULT NULL,
  `produksi_id` int(11) NULL DEFAULT NULL,
  `bahan_id` int(11) NULL DEFAULT NULL,
  `qty` int(11) NULL DEFAULT NULL,
  `satuan_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of detail_bahan_produksi
-- ----------------------------
INSERT INTO `detail_bahan_produksi` VALUES (1, 1, 1, 59, 10, 5);
INSERT INTO `detail_bahan_produksi` VALUES (2, 1, 1, 64, 3, 4);
INSERT INTO `detail_bahan_produksi` VALUES (3, 3, 1, 65, 1, 3);
INSERT INTO `detail_bahan_produksi` VALUES (4, 3, 1, 59, 4, 5);
INSERT INTO `detail_bahan_produksi` VALUES (5, 3, 1, 64, 2, 5);
INSERT INTO `detail_bahan_produksi` VALUES (6, 1, 3, 59, 50, 4);
INSERT INTO `detail_bahan_produksi` VALUES (7, 1, 3, 64, 10, 4);
INSERT INTO `detail_bahan_produksi` VALUES (8, 2, 3, 59, 30, 4);
INSERT INTO `detail_bahan_produksi` VALUES (9, 12, 4, 59, 2, 4);
INSERT INTO `detail_bahan_produksi` VALUES (10, 12, 4, 64, 2, 4);
INSERT INTO `detail_bahan_produksi` VALUES (11, 13, 5, 59, 50, 4);
INSERT INTO `detail_bahan_produksi` VALUES (12, 14, 5, 62, 10, 4);
INSERT INTO `detail_bahan_produksi` VALUES (13, 10, 2, 59, 50, 4);
INSERT INTO `detail_bahan_produksi` VALUES (14, 11, 2, 64, 5, 4);
INSERT INTO `detail_bahan_produksi` VALUES (15, 15, 6, 59, 40, 4);
INSERT INTO `detail_bahan_produksi` VALUES (16, 16, 7, 59, 30, 4);
INSERT INTO `detail_bahan_produksi` VALUES (17, 16, 7, 64, 5, 4);
INSERT INTO `detail_bahan_produksi` VALUES (18, 1, 8, 59, 1, 3);
INSERT INTO `detail_bahan_produksi` VALUES (19, 3, 8, 64, 3, 4);
INSERT INTO `detail_bahan_produksi` VALUES (20, 3, 8, 65, 1, 4);
INSERT INTO `detail_bahan_produksi` VALUES (21, NULL, 9, 66, 4, 4);
INSERT INTO `detail_bahan_produksi` VALUES (22, 5, 9, NULL, NULL, NULL);
INSERT INTO `detail_bahan_produksi` VALUES (23, NULL, 9, 65, 6, 4);
INSERT INTO `detail_bahan_produksi` VALUES (24, 5, 9, 58, 1, 1);
INSERT INTO `detail_bahan_produksi` VALUES (25, 17, 10, 58, 1, 1);
INSERT INTO `detail_bahan_produksi` VALUES (26, 17, 10, 59, 10, 4);

-- ----------------------------
-- Table structure for detail_pb_pt
-- ----------------------------
DROP TABLE IF EXISTS `detail_pb_pt`;
CREATE TABLE `detail_pb_pt`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pb_id` int(11) NULL DEFAULT NULL,
  `pt_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of detail_pb_pt
-- ----------------------------
INSERT INTO `detail_pb_pt` VALUES (1, 10, 1);
INSERT INTO `detail_pb_pt` VALUES (2, 11, 1);
INSERT INTO `detail_pb_pt` VALUES (3, 12, 2);
INSERT INTO `detail_pb_pt` VALUES (4, 14, 3);
INSERT INTO `detail_pb_pt` VALUES (5, 15, 3);
INSERT INTO `detail_pb_pt` VALUES (6, 16, 4);
INSERT INTO `detail_pb_pt` VALUES (7, 17, 4);
INSERT INTO `detail_pb_pt` VALUES (8, 18, 5);
INSERT INTO `detail_pb_pt` VALUES (9, 19, 5);
INSERT INTO `detail_pb_pt` VALUES (10, 23, 6);
INSERT INTO `detail_pb_pt` VALUES (11, 22, 7);
INSERT INTO `detail_pb_pt` VALUES (12, 23, 8);
INSERT INTO `detail_pb_pt` VALUES (13, 24, 9);
INSERT INTO `detail_pb_pt` VALUES (14, 25, 10);

-- ----------------------------
-- Table structure for detail_pemasukan_lain
-- ----------------------------
DROP TABLE IF EXISTS `detail_pemasukan_lain`;
CREATE TABLE `detail_pemasukan_lain`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pemasukanlain_id` int(11) NULL DEFAULT NULL,
  `keterangan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `jumlah` double(20, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of detail_pemasukan_lain
-- ----------------------------
INSERT INTO `detail_pemasukan_lain` VALUES (3, 2, 'TV', 500000.00);
INSERT INTO `detail_pemasukan_lain` VALUES (4, 2, 'Kabel', 50000.00);
INSERT INTO `detail_pemasukan_lain` VALUES (5, 3, 'Kayu Bekas', 500000.00);
INSERT INTO `detail_pemasukan_lain` VALUES (6, 3, 'Kursi Bekas', 250000.00);

-- ----------------------------
-- Table structure for detail_pembayaran_sales_order
-- ----------------------------
DROP TABLE IF EXISTS `detail_pembayaran_sales_order`;
CREATE TABLE `detail_pembayaran_sales_order`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pembayaran_sales_order_id` int(11) NULL DEFAULT NULL,
  `metode_pembayaran` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `bank_id` int(11) NULL DEFAULT NULL,
  `jumlah` decimal(20, 0) NULL DEFAULT NULL,
  `keterangan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of detail_pembayaran_sales_order
-- ----------------------------
INSERT INTO `detail_pembayaran_sales_order` VALUES (1, 2, 'TUNAI', 0, 500000, 'dp');
INSERT INTO `detail_pembayaran_sales_order` VALUES (2, 2, 'TRANSFER', 1, 100000, 'dp bank');
INSERT INTO `detail_pembayaran_sales_order` VALUES (3, 4, 'TUNAI', 0, 100000, 'dp');
INSERT INTO `detail_pembayaran_sales_order` VALUES (4, 4, 'TRANSFER', 1, 200000, 'dp');
INSERT INTO `detail_pembayaran_sales_order` VALUES (5, 5, 'TUNAI', 0, 300000, 'DP');
INSERT INTO `detail_pembayaran_sales_order` VALUES (6, 5, 'TRANSFER', 3, 300000, 'DP');
INSERT INTO `detail_pembayaran_sales_order` VALUES (7, 6, 'TUNAI', 0, 50000, '');
INSERT INTO `detail_pembayaran_sales_order` VALUES (8, 7, 'TUNAI', 0, 500000, 'bayar');
INSERT INTO `detail_pembayaran_sales_order` VALUES (9, 8, 'TUNAI', 0, 220000, '');
INSERT INTO `detail_pembayaran_sales_order` VALUES (10, 9, 'TUNAI', 0, 200000, '');
INSERT INTO `detail_pembayaran_sales_order` VALUES (11, 10, 'TUNAI', 0, 500000, 'DP');
INSERT INTO `detail_pembayaran_sales_order` VALUES (12, 11, 'TUNAI', 0, 100000, '');
INSERT INTO `detail_pembayaran_sales_order` VALUES (13, 12, 'TUNAI', 0, 100000, '');
INSERT INTO `detail_pembayaran_sales_order` VALUES (18, 15, 'TUNAI', 0, 50000, '');
INSERT INTO `detail_pembayaran_sales_order` VALUES (19, 15, 'TUNAI', 0, 25000, '');
INSERT INTO `detail_pembayaran_sales_order` VALUES (20, 16, 'TUNAI', 0, 500000, 'DP');
INSERT INTO `detail_pembayaran_sales_order` VALUES (21, 17, 'TUNAI', 0, 100000, '');
INSERT INTO `detail_pembayaran_sales_order` VALUES (22, 18, 'TUNAI', 0, 200000, '');

-- ----------------------------
-- Table structure for detail_pembayaran_tagihan
-- ----------------------------
DROP TABLE IF EXISTS `detail_pembayaran_tagihan`;
CREATE TABLE `detail_pembayaran_tagihan`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pembayaran_tagihan_id` int(11) NULL DEFAULT NULL,
  `metode_pembayaran` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `bank_id` int(11) NULL DEFAULT NULL,
  `jumlah` decimal(20, 0) NULL DEFAULT NULL,
  `keterangan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of detail_pembayaran_tagihan
-- ----------------------------
INSERT INTO `detail_pembayaran_tagihan` VALUES (1, 1, 'TUNAI', 0, 1250000, '-');
INSERT INTO `detail_pembayaran_tagihan` VALUES (2, 1, 'TRANSFER', 1, 12500000, 'DP');
INSERT INTO `detail_pembayaran_tagihan` VALUES (3, 2, 'TUNAI', 0, 1250000, '');
INSERT INTO `detail_pembayaran_tagihan` VALUES (4, 3, 'TUNAI', 0, 2000000, '-');
INSERT INTO `detail_pembayaran_tagihan` VALUES (5, 4, 'TUNAI', 0, 50000, '');
INSERT INTO `detail_pembayaran_tagihan` VALUES (6, 5, 'TUNAI', 0, 300000, '');
INSERT INTO `detail_pembayaran_tagihan` VALUES (7, 5, 'TRANSFER', 1, 50000, 'asd');
INSERT INTO `detail_pembayaran_tagihan` VALUES (8, 5, 'TUNAI', 0, 50000, 'tes');
INSERT INTO `detail_pembayaran_tagihan` VALUES (9, 6, 'TUNAI', 0, 100000, '');
INSERT INTO `detail_pembayaran_tagihan` VALUES (10, 7, 'TUNAI', 0, 100000, '');
INSERT INTO `detail_pembayaran_tagihan` VALUES (11, 8, 'TUNAI', 0, 100000, '');
INSERT INTO `detail_pembayaran_tagihan` VALUES (12, 9, 'TUNAI', 0, 162500, '');
INSERT INTO `detail_pembayaran_tagihan` VALUES (13, 10, 'TUNAI', 0, 225000, '');

-- ----------------------------
-- Table structure for detail_penerimaan_barang
-- ----------------------------
DROP TABLE IF EXISTS `detail_penerimaan_barang`;
CREATE TABLE `detail_penerimaan_barang`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `penerimaan_barang_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `bahan_id` int(11) NULL DEFAULT NULL,
  `qty_pesan` int(11) NULL DEFAULT NULL,
  `qty_terima` int(11) NULL DEFAULT NULL,
  `satuan_beli_id` int(11) NULL DEFAULT NULL,
  `harga_satuan` decimal(20, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 57 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of detail_penerimaan_barang
-- ----------------------------
INSERT INTO `detail_penerimaan_barang` VALUES (5, 3, 58, 1, 1, 1, NULL);
INSERT INTO `detail_penerimaan_barang` VALUES (6, 3, 59, 1, 1, 3, NULL);
INSERT INTO `detail_penerimaan_barang` VALUES (7, 4, 62, 5, 5, 3, NULL);
INSERT INTO `detail_penerimaan_barang` VALUES (8, 4, 66, 1, 1, 3, NULL);
INSERT INTO `detail_penerimaan_barang` VALUES (9, 5, 62, 5, 5, 3, NULL);
INSERT INTO `detail_penerimaan_barang` VALUES (10, 5, 66, 1, 1, 3, NULL);
INSERT INTO `detail_penerimaan_barang` VALUES (11, 5, 62, 5, 5, 3, NULL);
INSERT INTO `detail_penerimaan_barang` VALUES (12, 5, 66, 1, 1, 3, NULL);
INSERT INTO `detail_penerimaan_barang` VALUES (22, 10, 66, 10, 1, 3, NULL);
INSERT INTO `detail_penerimaan_barang` VALUES (23, 10, 65, 5, 2, 3, NULL);
INSERT INTO `detail_penerimaan_barang` VALUES (24, 10, 64, 50, 3, 3, NULL);
INSERT INTO `detail_penerimaan_barang` VALUES (25, 11, 66, 10, 2, 3, NULL);
INSERT INTO `detail_penerimaan_barang` VALUES (26, 11, 65, 5, 2, 3, NULL);
INSERT INTO `detail_penerimaan_barang` VALUES (27, 11, 64, 50, 2, 3, NULL);
INSERT INTO `detail_penerimaan_barang` VALUES (28, 12, 66, 3, 1, 3, NULL);
INSERT INTO `detail_penerimaan_barang` VALUES (29, 12, 65, 2, 1, 3, NULL);
INSERT INTO `detail_penerimaan_barang` VALUES (30, 12, 63, 3, 1, 3, NULL);
INSERT INTO `detail_penerimaan_barang` VALUES (31, 12, 62, 50, 1, 3, NULL);
INSERT INTO `detail_penerimaan_barang` VALUES (32, 13, 66, 2, 1, 4, NULL);
INSERT INTO `detail_penerimaan_barang` VALUES (33, 13, 65, 5, 1, 4, NULL);
INSERT INTO `detail_penerimaan_barang` VALUES (34, 13, 66, 2, 1, 4, NULL);
INSERT INTO `detail_penerimaan_barang` VALUES (35, 14, 66, 10, 2, 4, NULL);
INSERT INTO `detail_penerimaan_barang` VALUES (36, 14, 65, 10, 3, 4, NULL);
INSERT INTO `detail_penerimaan_barang` VALUES (37, 15, 66, 10, 8, 4, NULL);
INSERT INTO `detail_penerimaan_barang` VALUES (38, 15, 65, 10, 7, 4, NULL);
INSERT INTO `detail_penerimaan_barang` VALUES (39, 16, 66, 50, 30, 4, NULL);
INSERT INTO `detail_penerimaan_barang` VALUES (40, 17, 66, 50, 20, 4, NULL);
INSERT INTO `detail_penerimaan_barang` VALUES (41, 18, 65, 5, 3, 4, NULL);
INSERT INTO `detail_penerimaan_barang` VALUES (42, 19, 65, 5, 2, 4, NULL);
INSERT INTO `detail_penerimaan_barang` VALUES (43, 20, 66, 1, 1, 4, NULL);
INSERT INTO `detail_penerimaan_barang` VALUES (47, 22, 66, 5, 1, 4, 200000.00);
INSERT INTO `detail_penerimaan_barang` VALUES (48, 22, 64, 10, 1, 4, 100000.00);
INSERT INTO `detail_penerimaan_barang` VALUES (49, 22, 63, 5, 1, 5, 200000.00);
INSERT INTO `detail_penerimaan_barang` VALUES (50, 23, 66, 5, 2, 4, 200000.00);
INSERT INTO `detail_penerimaan_barang` VALUES (51, 23, 64, 10, 2, 4, 100000.00);
INSERT INTO `detail_penerimaan_barang` VALUES (52, 23, 63, 5, 2, 5, 200000.00);
INSERT INTO `detail_penerimaan_barang` VALUES (53, 24, 66, 10, 10, 4, 10000.00);
INSERT INTO `detail_penerimaan_barang` VALUES (54, 24, 65, 5, 5, 4, 12500.00);
INSERT INTO `detail_penerimaan_barang` VALUES (55, 25, 66, 5, 3, 4, 50000.00);
INSERT INTO `detail_penerimaan_barang` VALUES (56, 25, 65, 10, 3, 4, 25000.00);

-- ----------------------------
-- Table structure for detail_produksi_produk
-- ----------------------------
DROP TABLE IF EXISTS `detail_produksi_produk`;
CREATE TABLE `detail_produksi_produk`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `produk_id` int(11) NULL DEFAULT NULL,
  `produksi_id` int(11) NULL DEFAULT NULL,
  `qty` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of detail_produksi_produk
-- ----------------------------
INSERT INTO `detail_produksi_produk` VALUES (1, 1, 1, 1);
INSERT INTO `detail_produksi_produk` VALUES (2, 3, 1, 2);
INSERT INTO `detail_produksi_produk` VALUES (3, 10, 2, 1);
INSERT INTO `detail_produksi_produk` VALUES (4, 11, 2, 2);
INSERT INTO `detail_produksi_produk` VALUES (5, 1, 3, 1);
INSERT INTO `detail_produksi_produk` VALUES (6, 2, 3, 2);
INSERT INTO `detail_produksi_produk` VALUES (7, 12, 4, 2);
INSERT INTO `detail_produksi_produk` VALUES (8, 13, 5, 1);
INSERT INTO `detail_produksi_produk` VALUES (9, 14, 5, 1);
INSERT INTO `detail_produksi_produk` VALUES (10, 15, 6, 1);
INSERT INTO `detail_produksi_produk` VALUES (11, 16, 7, 1);
INSERT INTO `detail_produksi_produk` VALUES (12, 1, 8, 1);
INSERT INTO `detail_produksi_produk` VALUES (13, 3, 8, 2);
INSERT INTO `detail_produksi_produk` VALUES (14, 5, 9, 2);
INSERT INTO `detail_produksi_produk` VALUES (15, 17, 10, 1);

-- ----------------------------
-- Table structure for detail_purchase_order
-- ----------------------------
DROP TABLE IF EXISTS `detail_purchase_order`;
CREATE TABLE `detail_purchase_order`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `purchase_order_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `bahan_id` int(11) NULL DEFAULT NULL,
  `qty` int(11) NULL DEFAULT NULL,
  `satuan_beli_id` int(11) NULL DEFAULT NULL,
  `harga` decimal(20, 2) NULL DEFAULT NULL,
  `diskon` int(11) NULL DEFAULT NULL,
  `subtotal` decimal(20, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 57 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of detail_purchase_order
-- ----------------------------
INSERT INTO `detail_purchase_order` VALUES (1, 4, 59, 1, 3, 1.00, 1, 990000.00);
INSERT INTO `detail_purchase_order` VALUES (2, 5, 59, 1, 3, 1.00, 1, 990000.00);
INSERT INTO `detail_purchase_order` VALUES (3, 5, 58, 1, 1, 2.00, 2, 1960000.00);
INSERT INTO `detail_purchase_order` VALUES (4, 6, 58, 1, 1, 1.00, 0, 1000000.00);
INSERT INTO `detail_purchase_order` VALUES (5, 6, 59, 1, 4, 50.00, 0, 50000.00);
INSERT INTO `detail_purchase_order` VALUES (6, 7, 58, 1, 1, 1.00, 0, 1000000.00);
INSERT INTO `detail_purchase_order` VALUES (7, 7, 59, 1, 3, 500.00, 0, 500000.00);
INSERT INTO `detail_purchase_order` VALUES (8, 8, 58, 1, 1, 1000000.00, 1, 990000.00);
INSERT INTO `detail_purchase_order` VALUES (9, 8, 59, 1, 3, 2000000.00, 1, 1980000.00);
INSERT INTO `detail_purchase_order` VALUES (10, 9, 63, 1, 3, 250000.00, 0, 250000.00);
INSERT INTO `detail_purchase_order` VALUES (11, 9, 64, 1, 3, 500000.00, 0, 500000.00);
INSERT INTO `detail_purchase_order` VALUES (12, 9, 65, 1, 3, 500000.00, 1, 495000.00);
INSERT INTO `detail_purchase_order` VALUES (13, 9, 58, 1, 1, 2000000.00, 0, 2000000.00);
INSERT INTO `detail_purchase_order` VALUES (14, 9, 59, 1, 3, 200000.00, 0, 200000.00);
INSERT INTO `detail_purchase_order` VALUES (15, 10, 58, 5, 1, 1000000.00, 0, 1000000.00);
INSERT INTO `detail_purchase_order` VALUES (16, 10, 63, 4, 3, 1000000.00, 0, 1000000.00);
INSERT INTO `detail_purchase_order` VALUES (17, 10, 59, 5, 3, 2000000.00, 0, 2000000.00);
INSERT INTO `detail_purchase_order` VALUES (18, 10, 64, 3, 3, 2000000.00, 0, 2000000.00);
INSERT INTO `detail_purchase_order` VALUES (19, 11, 62, 5, 3, 100000.00, 0, 100000.00);
INSERT INTO `detail_purchase_order` VALUES (20, 11, 66, 1, 3, 500000.00, 0, 500000.00);
INSERT INTO `detail_purchase_order` VALUES (21, 12, 63, 5, 3, 1000000.00, 0, 1000000.00);
INSERT INTO `detail_purchase_order` VALUES (22, 12, 59, 5, 3, 2000000.00, 2, 1960000.00);
INSERT INTO `detail_purchase_order` VALUES (23, 13, 66, 10, 3, 150000.00, 0, 1500000.00);
INSERT INTO `detail_purchase_order` VALUES (24, 13, 65, 5, 3, 100000.00, 0, 500000.00);
INSERT INTO `detail_purchase_order` VALUES (25, 13, 64, 50, 3, 50000.00, 0, 2500000.00);
INSERT INTO `detail_purchase_order` VALUES (26, 14, 66, 3, 3, 1000000.00, 0, 3000000.00);
INSERT INTO `detail_purchase_order` VALUES (27, 14, 65, 2, 3, 100000.00, 0, 200000.00);
INSERT INTO `detail_purchase_order` VALUES (28, 14, 63, 3, 3, 100000.00, 0, 300000.00);
INSERT INTO `detail_purchase_order` VALUES (29, 14, 62, 50, 3, 200000.00, 0, 10000000.00);
INSERT INTO `detail_purchase_order` VALUES (30, 15, 66, 2, 4, 200000.00, 0, 400000.00);
INSERT INTO `detail_purchase_order` VALUES (31, 15, 65, 5, 4, 100000.00, 0, 500000.00);
INSERT INTO `detail_purchase_order` VALUES (32, 15, 66, 2, 4, 0.00, 0, 0.00);
INSERT INTO `detail_purchase_order` VALUES (33, 16, 66, 10, 4, 0.00, 0, 0.00);
INSERT INTO `detail_purchase_order` VALUES (34, 16, 65, 10, 4, 200000.00, 0, 2000000.00);
INSERT INTO `detail_purchase_order` VALUES (35, 17, 66, 1, 4, 12000.00, 0, 12000.00);
INSERT INTO `detail_purchase_order` VALUES (36, 18, 66, 50, 4, 1000.00, 0, 50000.00);
INSERT INTO `detail_purchase_order` VALUES (47, 19, 65, 5, 4, 100000.00, 0, 500000.00);
INSERT INTO `detail_purchase_order` VALUES (48, 20, 66, 1, 4, 10000.00, 0, 10000.00);
INSERT INTO `detail_purchase_order` VALUES (49, 21, 63, 4, 5, 200000.00, 0, 800000.00);
INSERT INTO `detail_purchase_order` VALUES (50, 22, 66, 5, 4, 200000.00, 0, 1000000.00);
INSERT INTO `detail_purchase_order` VALUES (51, 22, 64, 10, 4, 100000.00, 0, 1000000.00);
INSERT INTO `detail_purchase_order` VALUES (52, 22, 63, 5, 5, 200000.00, 0, 1000000.00);
INSERT INTO `detail_purchase_order` VALUES (53, 23, 66, 10, 4, 10000.00, 0, 100000.00);
INSERT INTO `detail_purchase_order` VALUES (54, 23, 65, 5, 4, 12500.00, 0, 62500.00);
INSERT INTO `detail_purchase_order` VALUES (55, 24, 66, 5, 4, 50000.00, 0, 250000.00);
INSERT INTO `detail_purchase_order` VALUES (56, 24, 65, 10, 4, 25000.00, 0, 250000.00);

-- ----------------------------
-- Table structure for detail_sales_order
-- ----------------------------
DROP TABLE IF EXISTS `detail_sales_order`;
CREATE TABLE `detail_sales_order`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `sales_order_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `produk_id` int(11) NULL DEFAULT NULL,
  `qty` int(11) NULL DEFAULT NULL,
  `harga` decimal(20, 2) NULL DEFAULT NULL,
  `diskon` int(11) NULL DEFAULT NULL,
  `subtotal` decimal(20, 2) NULL DEFAULT NULL,
  `status_produksi` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of detail_sales_order
-- ----------------------------
INSERT INTO `detail_sales_order` VALUES (1, 2, 3, 1, 200000.00, 1, 200000.00, 0);
INSERT INTO `detail_sales_order` VALUES (2, 2, 2, 1, 100000.00, 1, 100000.00, 0);
INSERT INTO `detail_sales_order` VALUES (3, 3, 2, 1, 100000.00, 0, 100000.00, 0);
INSERT INTO `detail_sales_order` VALUES (4, 3, 5, 4, 400000.00, 1, 1596000.00, 0);
INSERT INTO `detail_sales_order` VALUES (5, 4, 2, 1, 100000.00, 0, 100000.00, 0);
INSERT INTO `detail_sales_order` VALUES (6, 4, 3, 3, 200000.00, 0, 600000.00, 0);
INSERT INTO `detail_sales_order` VALUES (7, 4, 2, 1, 100000.00, 0, 100000.00, 0);
INSERT INTO `detail_sales_order` VALUES (8, 4, 3, 3, 200000.00, 0, 600000.00, 0);
INSERT INTO `detail_sales_order` VALUES (9, 4, 2, 1, 100000.00, 0, 100000.00, 0);
INSERT INTO `detail_sales_order` VALUES (10, 4, 3, 3, 200000.00, 0, 600000.00, 0);
INSERT INTO `detail_sales_order` VALUES (11, 7, 4, 3, 300000.00, 1, 897000.00, 0);
INSERT INTO `detail_sales_order` VALUES (12, 8, 1, 1, 200000.00, 0, 200000.00, 0);
INSERT INTO `detail_sales_order` VALUES (13, 8, 4, 3, 300000.00, 0, 900000.00, 0);
INSERT INTO `detail_sales_order` VALUES (14, 9, 2, 1, 100000.00, 0, 100000.00, 0);
INSERT INTO `detail_sales_order` VALUES (15, 10, 1, 1, 200000.00, 0, 200000.00, 0);
INSERT INTO `detail_sales_order` VALUES (16, 10, 10, 1, 200000.00, 0, 200000.00, 1);
INSERT INTO `detail_sales_order` VALUES (17, 10, 11, 2, 100000.00, 0, 200000.00, 1);
INSERT INTO `detail_sales_order` VALUES (18, 11, 1, 1, 200000.00, 0, 200000.00, 0);
INSERT INTO `detail_sales_order` VALUES (19, 11, 12, 2, 200000.00, 0, 400000.00, 1);
INSERT INTO `detail_sales_order` VALUES (20, 12, 13, 1, 1200000.00, 0, 1200000.00, 1);
INSERT INTO `detail_sales_order` VALUES (21, 12, 14, 1, 1500000.00, 0, 1500000.00, 1);
INSERT INTO `detail_sales_order` VALUES (22, 13, 1, 1, 200000.00, 0, 200000.00, 0);
INSERT INTO `detail_sales_order` VALUES (23, 14, 2, 1, 100000.00, 0, 100000.00, 0);
INSERT INTO `detail_sales_order` VALUES (24, 14, 15, 1, 800000.00, 0, 800000.00, 1);
INSERT INTO `detail_sales_order` VALUES (25, 15, 1, 1, 200000.00, 0, 200000.00, 0);
INSERT INTO `detail_sales_order` VALUES (26, 16, 1, 1, 200000.00, 0, 200000.00, 0);
INSERT INTO `detail_sales_order` VALUES (27, 16, 16, 1, 1000000.00, 0, 1000000.00, 1);
INSERT INTO `detail_sales_order` VALUES (28, 17, 1, 2, 200000.00, 0, 400000.00, 0);
INSERT INTO `detail_sales_order` VALUES (29, 17, 2, 1, 100000.00, 0, 100000.00, 0);
INSERT INTO `detail_sales_order` VALUES (30, 18, 1, 1, 200000.00, 0, 200000.00, 0);
INSERT INTO `detail_sales_order` VALUES (31, 19, 1, 1, 200000.00, 0, 200000.00, 0);
INSERT INTO `detail_sales_order` VALUES (32, 20, 1, 4, 200000.00, 0, 800000.00, 0);
INSERT INTO `detail_sales_order` VALUES (33, 20, 2, 7, 100000.00, 0, 700000.00, 0);
INSERT INTO `detail_sales_order` VALUES (34, 21, 1, 3, 200000.00, 0, 600000.00, 0);
INSERT INTO `detail_sales_order` VALUES (35, 21, 2, 1, 100000.00, 0, 100000.00, 0);
INSERT INTO `detail_sales_order` VALUES (36, 22, 17, 1, 800000.00, 0, 800000.00, 1);

-- ----------------------------
-- Table structure for detail_surat_jalan
-- ----------------------------
DROP TABLE IF EXISTS `detail_surat_jalan`;
CREATE TABLE `detail_surat_jalan`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `surat_jalan_id` int(11) NULL DEFAULT NULL,
  `produk_id` int(11) NULL DEFAULT NULL,
  `qty` int(11) NULL DEFAULT NULL,
  `qty_kirim` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of detail_surat_jalan
-- ----------------------------
INSERT INTO `detail_surat_jalan` VALUES (1, 1, 3, 1, 1);
INSERT INTO `detail_surat_jalan` VALUES (2, 1, 2, 1, 1);
INSERT INTO `detail_surat_jalan` VALUES (3, 2, 2, 1, 1);
INSERT INTO `detail_surat_jalan` VALUES (4, 2, 5, 4, 2);
INSERT INTO `detail_surat_jalan` VALUES (5, 3, 1, 1, 1);
INSERT INTO `detail_surat_jalan` VALUES (6, 3, 4, 3, 1);
INSERT INTO `detail_surat_jalan` VALUES (7, 4, 1, 1, 1);
INSERT INTO `detail_surat_jalan` VALUES (8, 4, 16, 1, 0);

-- ----------------------------
-- Table structure for detail_template_produk
-- ----------------------------
DROP TABLE IF EXISTS `detail_template_produk`;
CREATE TABLE `detail_template_produk`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `produk_id` int(11) NULL DEFAULT NULL,
  `bahan_id` int(11) NULL DEFAULT NULL,
  `satuan_id` int(11) NULL DEFAULT NULL,
  `qty` int(11) NULL DEFAULT NULL,
  `template_produk_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `template_produk_id`(`template_produk_id`) USING BTREE,
  CONSTRAINT `detail_template_produk_ibfk_1` FOREIGN KEY (`template_produk_id`) REFERENCES `template_produk` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of detail_template_produk
-- ----------------------------
INSERT INTO `detail_template_produk` VALUES (3, 1, 66, 4, 5, 1);
INSERT INTO `detail_template_produk` VALUES (8, 1, 65, 4, 3, 1);
INSERT INTO `detail_template_produk` VALUES (9, 1, 66, 4, 5, 2);
INSERT INTO `detail_template_produk` VALUES (10, 1, 65, 4, 4, 2);
INSERT INTO `detail_template_produk` VALUES (11, 1, 66, 4, 3, 3);
INSERT INTO `detail_template_produk` VALUES (12, 5, 66, 4, 2, 4);
INSERT INTO `detail_template_produk` VALUES (13, 5, 65, 4, 3, 4);

-- ----------------------------
-- Table structure for groups
-- ----------------------------
DROP TABLE IF EXISTS `groups`;
CREATE TABLE `groups`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of groups
-- ----------------------------
INSERT INTO `groups` VALUES (1, 'admin', 'Administrator');
INSERT INTO `groups` VALUES (2, 'general', 'General User');
INSERT INTO `groups` VALUES (3, 'Admin Gudang', '-');

-- ----------------------------
-- Table structure for groups_detail
-- ----------------------------
DROP TABLE IF EXISTS `groups_detail`;
CREATE TABLE `groups_detail`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groups_id` int(11) UNSIGNED NULL DEFAULT NULL,
  `submenu_id` int(11) NULL DEFAULT NULL,
  `c` tinyint(1) NULL DEFAULT NULL,
  `r` tinyint(1) NULL DEFAULT NULL,
  `u` tinyint(1) NULL DEFAULT NULL,
  `d` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `groups_id`(`groups_id`) USING BTREE,
  CONSTRAINT `groups_detail_ibfk_1` FOREIGN KEY (`groups_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of groups_detail
-- ----------------------------
INSERT INTO `groups_detail` VALUES (1, 2, 1, 1, 1, 1, 1);
INSERT INTO `groups_detail` VALUES (2, 2, 2, 0, 1, 1, 1);
INSERT INTO `groups_detail` VALUES (3, 2, 3, 1, 1, 1, 1);
INSERT INTO `groups_detail` VALUES (4, 3, 1, 1, 1, 1, 1);
INSERT INTO `groups_detail` VALUES (5, 3, 2, 1, 1, 1, 1);
INSERT INTO `groups_detail` VALUES (6, 3, 3, 1, 1, 1, 1);
INSERT INTO `groups_detail` VALUES (7, 3, 4, 1, 1, 1, 1);
INSERT INTO `groups_detail` VALUES (8, 3, 5, 1, 1, 1, 1);
INSERT INTO `groups_detail` VALUES (9, 3, 6, 0, 0, 0, 0);
INSERT INTO `groups_detail` VALUES (10, 3, 7, 1, 1, 1, 1);
INSERT INTO `groups_detail` VALUES (11, 3, 8, 1, 1, 1, 1);
INSERT INTO `groups_detail` VALUES (12, 3, 9, 0, 0, 0, 0);
INSERT INTO `groups_detail` VALUES (13, 3, 10, 0, 0, 0, 0);
INSERT INTO `groups_detail` VALUES (14, 3, 11, 0, 0, 0, 0);
INSERT INTO `groups_detail` VALUES (15, 3, 12, 0, 0, 0, 0);
INSERT INTO `groups_detail` VALUES (16, 3, 13, 0, 0, 0, 0);
INSERT INTO `groups_detail` VALUES (17, 3, 14, 0, 0, 0, 0);
INSERT INTO `groups_detail` VALUES (18, 3, 15, 0, 0, 0, 0);
INSERT INTO `groups_detail` VALUES (19, 3, 16, 0, 0, 0, 0);
INSERT INTO `groups_detail` VALUES (20, 3, 17, 0, 0, 0, 0);
INSERT INTO `groups_detail` VALUES (21, 3, 18, 0, 0, 0, 0);
INSERT INTO `groups_detail` VALUES (22, 3, 19, 0, 0, 0, 0);
INSERT INTO `groups_detail` VALUES (23, 3, 20, 0, 0, 0, 0);
INSERT INTO `groups_detail` VALUES (24, 3, 21, 0, 0, 0, 0);
INSERT INTO `groups_detail` VALUES (25, 3, 22, 0, 0, 0, 0);
INSERT INTO `groups_detail` VALUES (26, 3, 23, 0, 0, 0, 0);
INSERT INTO `groups_detail` VALUES (27, 3, 24, 0, 0, 0, 0);
INSERT INTO `groups_detail` VALUES (28, 3, 25, 0, 0, 0, 0);
INSERT INTO `groups_detail` VALUES (29, 3, 26, 0, 0, 0, 0);
INSERT INTO `groups_detail` VALUES (30, 3, 27, 0, 0, 0, 0);
INSERT INTO `groups_detail` VALUES (31, 3, 28, 0, 0, 0, 0);

-- ----------------------------
-- Table structure for gudang
-- ----------------------------
DROP TABLE IF EXISTS `gudang`;
CREATE TABLE `gudang`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kode` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT 0,
  `color` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `alamat` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(10) UNSIGNED NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `updated_by` int(10) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1000 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of gudang
-- ----------------------------
INSERT INTO `gudang` VALUES (1, 'Gudang 1', 'GD/2385097', 1, '#9b59b6', NULL, '2023-02-06 19:13:55', NULL, NULL, NULL);
INSERT INTO `gudang` VALUES (2, 'Gudang 2', 'GD/9770989', 1, '#f1c40f', NULL, '2023-02-06 19:13:55', NULL, NULL, NULL);
INSERT INTO `gudang` VALUES (3, 'Gudang 3', 'GD/4199581', 1, '#373f7b', NULL, '2023-02-06 19:13:55', NULL, NULL, NULL);
INSERT INTO `gudang` VALUES (4, 'Gudang 4', 'GD/4329066', 1, '#2fc1a4', NULL, '2023-02-06 19:13:55', NULL, NULL, NULL);
INSERT INTO `gudang` VALUES (5, 'Gudang 5', 'GD/3515021', 1, '#813232', NULL, '2023-02-06 19:13:55', NULL, NULL, NULL);
INSERT INTO `gudang` VALUES (31, 'GUDANG 111', '111', 1, '#000000', NULL, '2023-02-06 19:13:55', NULL, NULL, NULL);
INSERT INTO `gudang` VALUES (32, 'GUDANG 222', '222', 1, '#4e2c2c', NULL, '2023-02-06 19:13:55', NULL, NULL, NULL);
INSERT INTO `gudang` VALUES (33, 'GUDANG 333', '333', 1, '#000000', NULL, '2023-02-06 19:13:55', NULL, NULL, NULL);
INSERT INTO `gudang` VALUES (34, 'GUDANG 444', '444', 1, '#c572fd', NULL, '2023-02-06 19:13:55', NULL, NULL, NULL);
INSERT INTO `gudang` VALUES (35, 'GUDANG 555', '555', 1, '#000000', NULL, '2023-02-06 19:13:55', NULL, NULL, NULL);
INSERT INTO `gudang` VALUES (36, 'GUDANG 666', '666', 1, '#3f5373', NULL, '2023-02-06 19:13:55', NULL, NULL, NULL);
INSERT INTO `gudang` VALUES (37, 'GUDANG 777', '777', 1, '#e59999', NULL, '2023-02-06 19:13:55', NULL, NULL, NULL);
INSERT INTO `gudang` VALUES (38, 'GUDANG 888', '888', 1, '#77b120', NULL, '2023-02-06 19:13:55', NULL, NULL, NULL);
INSERT INTO `gudang` VALUES (39, 'GUDANG 999', '999', 1, '#b8b205', NULL, '2023-02-06 19:13:55', NULL, NULL, NULL);
INSERT INTO `gudang` VALUES (40, 'GUDANG 1110', '1110', 1, '#a02a0d', NULL, '2023-02-06 19:13:55', NULL, NULL, NULL);
INSERT INTO `gudang` VALUES (41, 'GUDANG 1221', '1221', 1, '#000000', NULL, '2023-02-06 19:13:55', NULL, NULL, NULL);
INSERT INTO `gudang` VALUES (42, 'GUDANG 1332', 'GD/2780762', 1, '#000000', 'Malang', '2023-02-06 19:13:55', NULL, NULL, NULL);
INSERT INTO `gudang` VALUES (43, 'Gudang Pogot', 'G100', 1, '#c11a1a', 'Pogot', '2023-02-06 19:13:55', NULL, NULL, NULL);
INSERT INTO `gudang` VALUES (44, 'Gudang Coba', 'G1', 1, '#7e2020', 'malang', '2023-02-06 19:16:51', 1, NULL, NULL);
INSERT INTO `gudang` VALUES (999, 'Gudang Produksi', 'GP', 1, '#7e2020', '-', '2023-04-07 10:59:56', NULL, '2023-04-07 10:59:59', NULL);

-- ----------------------------
-- Table structure for induk_akun
-- ----------------------------
DROP TABLE IF EXISTS `induk_akun`;
CREATE TABLE `induk_akun`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `no_akun` int(11) NULL DEFAULT NULL,
  `nama` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `coa_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

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
-- Table structure for jabatan
-- ----------------------------
DROP TABLE IF EXISTS `jabatan`;
CREATE TABLE `jabatan`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `kode` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nama` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT 1,
  `created_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `updated_by` int(11) NULL DEFAULT NULL,
  `color` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jabatan
-- ----------------------------
INSERT INTO `jabatan` VALUES (1, 'JB-9966405', 'Direktur', 1, '2023-02-06 20:31:10', 1, '2023-02-06 20:31:52', 1, '#000000');

-- ----------------------------
-- Table structure for jurnal_umum
-- ----------------------------
DROP TABLE IF EXISTS `jurnal_umum`;
CREATE TABLE `jurnal_umum`  (
  `id_jurnal_umum` int(11) NOT NULL AUTO_INCREMENT,
  `ref` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `akun_id` int(11) NULL DEFAULT NULL,
  `debit` double NULL DEFAULT NULL,
  `kredit` double NULL DEFAULT NULL,
  `keterangan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `table` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `table_id` int(11) NULL DEFAULT NULL,
  `create_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_jurnal_umum`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 507 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jurnal_umum
-- ----------------------------
INSERT INTO `jurnal_umum` VALUES (459, 'PML/7589', 1, 550000, 0, 'Jual TV Bekas', 'pemasukan_lain', 2, '2023-04-28 10:29:00');
INSERT INTO `jurnal_umum` VALUES (460, 'PML/7589', 19, 0, 550000, 'Jual TV Bekas', 'pemasukan_lain', 2, '2023-04-28 10:29:00');
INSERT INTO `jurnal_umum` VALUES (461, 'PML/1534', 1, 750000, 0, 'Jual Barang Bekas', 'pemasukan_lain', 3, '2023-04-28 10:38:47');
INSERT INTO `jurnal_umum` VALUES (462, 'PML/1534', 21, 0, 750000, 'Jual Barang Bekas', 'pemasukan_lain', 3, '2023-04-28 10:38:47');
INSERT INTO `jurnal_umum` VALUES (463, 'PB-580', 5, 500000, 0, 'Penerimaan Barang pada tanggal 2023-05-05 dengan Kode PB-540, No Surat Jalan 44441 dan Pengirim Rendy', 'penerimaan_barang', 22, '2023-05-05 19:41:45');
INSERT INTO `jurnal_umum` VALUES (464, 'PB-580', 9, 0, 500000, 'Penerimaan Barang pada tanggal 2023-05-05 dengan Kode PB-540, No Surat Jalan 44441 dan Pengirim Rendy', 'penerimaan_barang', 22, '2023-05-05 19:41:45');
INSERT INTO `jurnal_umum` VALUES (465, 'PB-540', 5, 1000000, 0, 'Penerimaan Barang pada tanggal 2023-05-05 dengan Kode PB-540, No Surat Jalan 44441 dan Pengirim Rendy', 'penerimaan_barang', 23, '2023-05-05 19:58:58');
INSERT INTO `jurnal_umum` VALUES (466, 'PB-540', 9, 0, 1000000, 'Penerimaan Barang pada tanggal 2023-05-05 dengan Kode PB-540, No Surat Jalan 44441 dan Pengirim Rendy', 'penerimaan_barang', 23, '2023-05-05 19:58:58');
INSERT INTO `jurnal_umum` VALUES (467, 'Nota/PT/7703', 9, 1000000, 0, 'Pembayaran Tagihan pada tanggal 2023-05-05 dengan Kode Nota/PT/7703, No Tagihan 123 dan Penagih Rendy', 'pembayaran_tagihan', 6, '2023-05-05 21:16:58');
INSERT INTO `jurnal_umum` VALUES (468, 'Nota/PT/7703', 1, 0, 1000000, 'Pembayaran Tagihan pada tanggal 2023-05-05 dengan Kode Nota/PT/7703, No Tagihan 123 dan Penagih Rendy', 'pembayaran_tagihan', 6, '2023-05-05 21:16:58');
INSERT INTO `jurnal_umum` VALUES (469, 'Nota/PT/1878', 9, NULL, 0, 'Pembayaran Tagihan pada tanggal 2023-05-05 dengan Kode Nota/PT/1878, No Tagihan EST/2023/01/112 dan Penagih Rendy', 'pembayaran_tagihan', 7, '2023-05-05 21:23:12');
INSERT INTO `jurnal_umum` VALUES (470, 'Nota/PT/1878', 1, 0, NULL, 'Pembayaran Tagihan pada tanggal 2023-05-05 dengan Kode Nota/PT/1878, No Tagihan EST/2023/01/112 dan Penagih Rendy', 'pembayaran_tagihan', 7, '2023-05-05 21:23:12');
INSERT INTO `jurnal_umum` VALUES (471, 'Nota/PT/2232', 9, 100000, 0, 'Pembayaran Tagihan pada tanggal 2023-05-05 dengan Kode Nota/PT/2232, No Tagihan EST/2023/01/11223 dan Penagih Rendy', 'pembayaran_tagihan', 8, '2023-05-05 21:24:27');
INSERT INTO `jurnal_umum` VALUES (472, 'Nota/PT/2232', 1, 0, 100000, 'Pembayaran Tagihan pada tanggal 2023-05-05 dengan Kode Nota/PT/2232, No Tagihan EST/2023/01/11223 dan Penagih Rendy', 'pembayaran_tagihan', 8, '2023-05-05 21:24:27');
INSERT INTO `jurnal_umum` VALUES (473, 'INV/SO/6014', 4, 500000, 0, 'Penjualan pada tanggal 2023-05-06 dengan Kode INV/SO/6014', 'sales_order', 17, '2023-05-06 20:08:29');
INSERT INTO `jurnal_umum` VALUES (474, 'INV/SO/6014', 20, 0, 500000, 'Penjualan pada tanggal 2023-05-06 dengan Kode INV/SO/6014', 'sales_order', 17, '2023-05-06 20:08:29');
INSERT INTO `jurnal_umum` VALUES (475, 'INV/SO/6999', 4, 200000, 0, 'Penjualan pada tanggal 2023-05-06 dengan Kode INV/SO/6999', 'sales_order', 18, '2023-05-06 20:10:15');
INSERT INTO `jurnal_umum` VALUES (476, 'INV/SO/6999', 20, 0, 200000, 'Penjualan pada tanggal 2023-05-06 dengan Kode INV/SO/6999', 'sales_order', 18, '2023-05-06 20:10:15');
INSERT INTO `jurnal_umum` VALUES (477, 'INV/SO/5514', 4, 200000, 0, 'Penjualan pada tanggal 2023-05-07 dengan Kode INV/SO/5514', 'sales_order', 19, '2023-05-07 07:59:54');
INSERT INTO `jurnal_umum` VALUES (478, 'INV/SO/5514', 20, 0, 200000, 'Penjualan pada tanggal 2023-05-07 dengan Kode INV/SO/5514', 'sales_order', 19, '2023-05-07 07:59:54');
INSERT INTO `jurnal_umum` VALUES (479, '94500', 1, 100000, 0, 'Pembayaran SO pada tanggal 2023-05-07 dengan Kode 94500', 'pembayaran_sales_order', 12, '2023-05-07 07:59:54');
INSERT INTO `jurnal_umum` VALUES (480, '94500', 4, 0, 100000, 'Pembayaran SO pada tanggal 2023-05-07 dengan Kode 94500', 'pembayaran_sales_order', 12, '2023-05-07 07:59:54');
INSERT INTO `jurnal_umum` VALUES (485, 'P222012', 1, 75000, 0, 'Pembayaran SO pada tanggal 2023-05-07 dengan Kode P222012', 'pembayaran_sales_order', 15, '2023-05-07 09:52:29');
INSERT INTO `jurnal_umum` VALUES (486, 'P222012', 4, 0, 75000, 'Pembayaran SO pada tanggal 2023-05-07 dengan Kode P222012', 'pembayaran_sales_order', 15, '2023-05-07 09:52:29');
INSERT INTO `jurnal_umum` VALUES (487, 'INV/SO/6965', 4, 1500000, 0, 'Penjualan pada tanggal 2023-05-07 dengan Kode INV/SO/6965', 'sales_order', 20, '2023-05-07 12:46:08');
INSERT INTO `jurnal_umum` VALUES (488, 'INV/SO/6965', 20, 0, 1500000, 'Penjualan pada tanggal 2023-05-07 dengan Kode INV/SO/6965', 'sales_order', 20, '2023-05-07 12:46:08');
INSERT INTO `jurnal_umum` VALUES (489, '3687', 1, 500000, 0, 'Pembayaran SO pada tanggal 2023-05-07 dengan Kode 3687', 'pembayaran_sales_order', 16, '2023-05-07 12:46:08');
INSERT INTO `jurnal_umum` VALUES (490, '3687', 4, 0, 500000, 'Pembayaran SO pada tanggal 2023-05-07 dengan Kode 3687', 'pembayaran_sales_order', 16, '2023-05-07 12:46:08');
INSERT INTO `jurnal_umum` VALUES (491, 'PB-7098', 5, 162500, 0, 'Penerimaan Barang pada tanggal 2023-05-07 dengan Kode PB-7098, No Surat Jalan 7398127 dan Pengirim Rendy', 'penerimaan_barang', 24, '2023-05-07 14:47:33');
INSERT INTO `jurnal_umum` VALUES (492, 'PB-7098', 9, 0, 162500, 'Penerimaan Barang pada tanggal 2023-05-07 dengan Kode PB-7098, No Surat Jalan 7398127 dan Pengirim Rendy', 'penerimaan_barang', 24, '2023-05-07 14:47:33');
INSERT INTO `jurnal_umum` VALUES (493, 'Nota/PT/1641', 9, 162500, 0, 'Pembayaran Tagihan pada tanggal 2023-05-07 dengan Kode Nota/PT/1641, No Tagihan EST/2023/01/112 dan Penagih Rendy', 'pembayaran_tagihan', 9, '2023-05-07 14:48:50');
INSERT INTO `jurnal_umum` VALUES (494, 'Nota/PT/1641', 1, 0, 162500, 'Pembayaran Tagihan pada tanggal 2023-05-07 dengan Kode Nota/PT/1641, No Tagihan EST/2023/01/112 dan Penagih Rendy', 'pembayaran_tagihan', 9, '2023-05-07 14:48:50');
INSERT INTO `jurnal_umum` VALUES (495, 'PB-7781', 5, 225000, 0, 'Penerimaan Barang pada tanggal 2023-05-07 dengan Kode PB-7781, No Surat Jalan 1 dan Pengirim Rendy', 'penerimaan_barang', 25, '2023-05-07 15:20:27');
INSERT INTO `jurnal_umum` VALUES (496, 'PB-7781', 9, 0, 225000, 'Penerimaan Barang pada tanggal 2023-05-07 dengan Kode PB-7781, No Surat Jalan 1 dan Pengirim Rendy', 'penerimaan_barang', 25, '2023-05-07 15:20:27');
INSERT INTO `jurnal_umum` VALUES (497, 'Nota/PT/6993', 9, 225000, 0, 'Pembayaran Tagihan pada tanggal 2023-05-07 dengan Kode Nota/PT/6993, No Tagihan EST/2023/01/112 dan Penagih Rendy', 'pembayaran_tagihan', 10, '2023-05-07 15:21:32');
INSERT INTO `jurnal_umum` VALUES (498, 'Nota/PT/6993', 1, 0, 225000, 'Pembayaran Tagihan pada tanggal 2023-05-07 dengan Kode Nota/PT/6993, No Tagihan EST/2023/01/112 dan Penagih Rendy', 'pembayaran_tagihan', 10, '2023-05-07 15:21:32');
INSERT INTO `jurnal_umum` VALUES (499, 'INV/SO/7220', 4, 700000, 0, 'Penjualan pada tanggal 2023-05-07 dengan Kode INV/SO/7220', 'sales_order', 21, '2023-05-07 15:23:15');
INSERT INTO `jurnal_umum` VALUES (500, 'INV/SO/7220', 20, 0, 700000, 'Penjualan pada tanggal 2023-05-07 dengan Kode INV/SO/7220', 'sales_order', 21, '2023-05-07 15:23:15');
INSERT INTO `jurnal_umum` VALUES (501, '15337', 1, 100000, 0, 'Pembayaran SO pada tanggal 2023-05-07 dengan Kode 15337', 'pembayaran_sales_order', 17, '2023-05-07 15:23:15');
INSERT INTO `jurnal_umum` VALUES (502, '15337', 4, 0, 100000, 'Pembayaran SO pada tanggal 2023-05-07 dengan Kode 15337', 'pembayaran_sales_order', 17, '2023-05-07 15:23:15');
INSERT INTO `jurnal_umum` VALUES (503, 'P988968', 1, 200000, 0, 'Pembayaran SO pada tanggal 2023-05-07 dengan Kode P988968', 'pembayaran_sales_order', 18, '2023-05-07 15:24:03');
INSERT INTO `jurnal_umum` VALUES (504, 'P988968', 4, 0, 200000, 'Pembayaran SO pada tanggal 2023-05-07 dengan Kode P988968', 'pembayaran_sales_order', 18, '2023-05-07 15:24:03');
INSERT INTO `jurnal_umum` VALUES (505, 'INV/SO/5452', 4, 800000, 0, 'Penjualan pada tanggal 2023-05-07 dengan Kode INV/SO/5452', 'sales_order', 22, '2023-05-07 15:29:12');
INSERT INTO `jurnal_umum` VALUES (506, 'INV/SO/5452', 20, 0, 800000, 'Penjualan pada tanggal 2023-05-07 dengan Kode INV/SO/5452', 'sales_order', 22, '2023-05-07 15:29:12');

-- ----------------------------
-- Table structure for karyawan
-- ----------------------------
DROP TABLE IF EXISTS `karyawan`;
CREATE TABLE `karyawan`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `kode` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nik` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nama` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `jk` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `no_hp` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `alamat` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `province_id` int(11) NULL DEFAULT NULL,
  `city_id` int(11) NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `jabatan_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `tanggal_masuk` date NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(10) UNSIGNED NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `updated_by` int(10) UNSIGNED NULL DEFAULT NULL,
  `status_karyawan_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of karyawan
-- ----------------------------
INSERT INTO `karyawan` VALUES (1, 'KYR-8162650', '350741115505', 'Rendy Yani Susanto, S.Pdi', 'Laki-Laki', '+6285894632505', 'Malang', 15, 232, 'rendyyanisusanto@gmail.com', 1, '2023-02-08', 1, '2023-02-08 19:07:22', 1, '2023-05-17 17:56:24', NULL, 2);
INSERT INTO `karyawan` VALUES (2, 'KYR-3831', '350741115505', 'Achmad Syaifullah', 'Laki-Laki', '+6281933046907', 'Malang', 15, 232, 'A@gmail.com', 1, '2023-05-17', 1, '2023-05-17 17:55:03', 1, '2023-05-17 17:56:13', NULL, 1);

-- ----------------------------
-- Table structure for kategori_bahan
-- ----------------------------
DROP TABLE IF EXISTS `kategori_bahan`;
CREATE TABLE `kategori_bahan`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `kode` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nama` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `color` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT 1,
  `created_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `updated_by` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of kategori_bahan
-- ----------------------------
INSERT INTO `kategori_bahan` VALUES (1, 'B1', 'Bahan Utama', '#2980b9', 1, '2023-02-06 20:01:15', NULL, NULL, NULL);
INSERT INTO `kategori_bahan` VALUES (2, 'B2', 'Bahan Pendukung', '#c0392b', 1, '2023-02-06 20:01:15', NULL, NULL, NULL);
INSERT INTO `kategori_bahan` VALUES (3, 'Bahan8232236', 'Bahan Cadangan', '#000000', 1, '2023-02-06 20:06:37', 1, '2023-02-06 20:07:36', 1);

-- ----------------------------
-- Table structure for kategori_barang
-- ----------------------------
DROP TABLE IF EXISTS `kategori_barang`;
CREATE TABLE `kategori_barang`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `kode` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nama` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `color` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT 1,
  `created_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `updated_by` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of kategori_barang
-- ----------------------------
INSERT INTO `kategori_barang` VALUES (1, 'K1', 'Kursi', '#8e44ad', 1, '2023-02-06 19:49:29', NULL, NULL, NULL);
INSERT INTO `kategori_barang` VALUES (2, 'K2', 'Meja', '#c0392b', 1, '2023-02-06 19:49:29', NULL, NULL, NULL);
INSERT INTO `kategori_barang` VALUES (3, 'GD/256589', 'Kursi Susun', '#811818', 1, '0000-00-00 00:00:00', NULL, '2023-02-06 19:58:16', 1);
INSERT INTO `kategori_barang` VALUES (4, 'GD/7263129', 'Kursi Coba', '#d31212', 1, '2023-02-06 19:58:29', 1, NULL, NULL);

-- ----------------------------
-- Table structure for konversi_satuan_bahan
-- ----------------------------
DROP TABLE IF EXISTS `konversi_satuan_bahan`;
CREATE TABLE `konversi_satuan_bahan`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `bahan_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `satuan_id` int(11) NULL DEFAULT NULL,
  `nilai` int(11) NULL DEFAULT NULL,
  `default` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of konversi_satuan_bahan
-- ----------------------------
INSERT INTO `konversi_satuan_bahan` VALUES (1, 58, 1, 1, 1);
INSERT INTO `konversi_satuan_bahan` VALUES (2, 58, 3, 10, 0);
INSERT INTO `konversi_satuan_bahan` VALUES (3, 58, 4, 100, 0);
INSERT INTO `konversi_satuan_bahan` VALUES (4, 59, 3, 1, 1);
INSERT INTO `konversi_satuan_bahan` VALUES (5, 59, 4, 100, 0);
INSERT INTO `konversi_satuan_bahan` VALUES (6, 60, 1, 1, 1);
INSERT INTO `konversi_satuan_bahan` VALUES (7, 60, 4, 120, 0);
INSERT INTO `konversi_satuan_bahan` VALUES (8, 61, 3, 1, 1);
INSERT INTO `konversi_satuan_bahan` VALUES (9, 61, 4, 500, 0);
INSERT INTO `konversi_satuan_bahan` VALUES (10, 62, 3, 1, 1);
INSERT INTO `konversi_satuan_bahan` VALUES (11, 62, 4, 50, 0);
INSERT INTO `konversi_satuan_bahan` VALUES (12, 63, 3, 1, 0);
INSERT INTO `konversi_satuan_bahan` VALUES (13, 63, 5, 5, 1);
INSERT INTO `konversi_satuan_bahan` VALUES (14, 64, 3, 1, 0);
INSERT INTO `konversi_satuan_bahan` VALUES (15, 64, 4, 1000, 1);
INSERT INTO `konversi_satuan_bahan` VALUES (16, 65, 3, 1, 0);
INSERT INTO `konversi_satuan_bahan` VALUES (17, 65, 4, 50, 1);
INSERT INTO `konversi_satuan_bahan` VALUES (18, 66, 3, 1, 0);
INSERT INTO `konversi_satuan_bahan` VALUES (19, 66, 4, 10, 1);

-- ----------------------------
-- Table structure for login_attempts
-- ----------------------------
DROP TABLE IF EXISTS `login_attempts`;
CREATE TABLE `login_attempts`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `login` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `time` int(10) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for master_barang_jadi
-- ----------------------------
DROP TABLE IF EXISTS `master_barang_jadi`;
CREATE TABLE `master_barang_jadi`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `kode` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nama` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `qty` int(11) NULL DEFAULT NULL,
  `min_qty` int(11) NULL DEFAULT NULL,
  `satuan_barang_id` int(11) NULL DEFAULT NULL,
  `harga_beli` int(11) NULL DEFAULT NULL,
  `kategori_barang_id` int(11) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `updated_by` int(11) NULL DEFAULT NULL,
  `gudang_id` int(11) NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of master_barang_jadi
-- ----------------------------
INSERT INTO `master_barang_jadi` VALUES (1, 'MSBJ/5341588/02/01022023', 'Kursi Kantor', 20, 11, 2, 200000, 2, '2023-02-01 20:58:29', 1, '2023-02-02 11:26:11', 1, 2, 1);
INSERT INTO `master_barang_jadi` VALUES (2, 'MSBJ/2784949/02/02022023', 'MEJA1', 100, 1, 2, 100000, 2, '2023-02-01 21:15:19', 1, '2023-02-02 11:25:37', 1, 1, 1);
INSERT INTO `master_barang_jadi` VALUES (3, 'MSBJ/8214492/02/02022023', 'MEJA 2', 101, 2, 2, 200000, 1, '2023-02-01 21:15:19', 1, '2023-02-02 11:25:32', 1, 2, 1);
INSERT INTO `master_barang_jadi` VALUES (4, 'MSBJ/8567314/02/02022023', 'MEJA3', 102, 3, 1, 300000, 2, '2023-02-01 21:15:19', 1, '2023-02-02 11:25:27', 1, 1, 1);
INSERT INTO `master_barang_jadi` VALUES (5, 'MSBJ/3334951/02/02022023', 'MEJA4', 103, 4, 1, 400000, 1, '2023-02-01 21:15:19', 1, '2023-02-02 11:25:23', 1, 2, 1);
INSERT INTO `master_barang_jadi` VALUES (6, 'MSBJ/4342382/02/02022023', 'MEJA5', 104, 5, 2, 500000, 2, '2023-02-01 21:15:19', 1, '2023-02-02 11:25:19', 1, 1, 1);
INSERT INTO `master_barang_jadi` VALUES (7, 'MSBJ/63151/02/02022023', 'MEJA6', 105, 6, 2, 600000, 1, '2023-02-01 21:15:19', 1, '2023-02-02 11:25:13', 1, 2, 1);
INSERT INTO `master_barang_jadi` VALUES (8, 'MSBJ/3492136/02/02022023', 'Kursi Gaming', 20, 1, 1, 780000, 1, '2023-02-02 10:45:33', 1, '2023-02-02 11:01:46', 1, 2, 1);
INSERT INTO `master_barang_jadi` VALUES (9, 'MSBJ/3613968/02/04022023', 'Kursi Minimalis 1', 150, 100, 2, 150000, 1, '2023-02-04 13:01:35', 1, '2023-02-04 13:02:02', 1, 1, 1);

-- ----------------------------
-- Table structure for master_data_bahan
-- ----------------------------
DROP TABLE IF EXISTS `master_data_bahan`;
CREATE TABLE `master_data_bahan`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `kode` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nama` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `min_qty` int(11) NULL DEFAULT NULL,
  `qty` int(11) NULL DEFAULT NULL,
  `satuan_pakai_id` int(11) NULL DEFAULT NULL,
  `satuan_beli_id` int(11) NULL DEFAULT NULL,
  `gudang_id` int(11) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `updated_by` int(11) NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 67 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of master_data_bahan
-- ----------------------------
INSERT INTO `master_data_bahan` VALUES (2, 'B1470449', 'Paku', 1, 100, NULL, NULL, 1, '2023-02-01 19:17:31', 1, '2023-02-21 10:16:19', 1, 1);
INSERT INTO `master_data_bahan` VALUES (3, 'B9689422', 'Kayu', 1, 200, NULL, NULL, 2, '2023-02-01 19:17:59', 1, '2023-02-21 10:16:08', 1, 1);
INSERT INTO `master_data_bahan` VALUES (4, 'B6005720', 'Spon', 6, 50, NULL, NULL, 1, '2023-02-01 19:18:39', 1, '2023-02-21 10:16:02', 1, 1);
INSERT INTO `master_data_bahan` VALUES (6, 'B2762474', 'PAKU 2', 2, 101, NULL, NULL, 1, '2023-02-01 20:08:49', 1, '2023-02-21 10:15:56', 1, 1);
INSERT INTO `master_data_bahan` VALUES (38, 'B3152482', 'PAKU 17', 17, 116, NULL, NULL, 1, '2023-02-01 20:10:31', 1, '2023-02-21 10:15:50', 1, 1);
INSERT INTO `master_data_bahan` VALUES (39, 'B7219454', 'PAKU 1', 1, 100, NULL, NULL, 1, '2023-02-01 20:11:44', 1, '2023-02-21 10:15:25', 1, 1);
INSERT INTO `master_data_bahan` VALUES (40, 'B5563214', 'PAKU 2', 2, 101, NULL, NULL, 2, '2023-02-01 20:11:44', 1, '2023-02-21 10:15:18', 1, 1);
INSERT INTO `master_data_bahan` VALUES (41, 'B628297', 'PAKU 3', 3, 102, NULL, NULL, 1, '2023-02-01 20:11:44', 1, '2023-02-21 10:08:14', 1, 1);
INSERT INTO `master_data_bahan` VALUES (42, 'B1657335', 'PAKU 4', 4, 103, NULL, NULL, 2, '2023-02-01 20:11:44', 1, '2023-02-21 10:08:09', 1, 1);
INSERT INTO `master_data_bahan` VALUES (43, 'B2334561', 'PAKU 5', 5, 104, NULL, NULL, 1, '2023-02-01 20:11:44', 1, '2023-02-21 10:08:05', 1, 1);
INSERT INTO `master_data_bahan` VALUES (44, 'B9875118', 'PAKU 6', 6, 105, NULL, NULL, 2, '2023-02-01 20:11:44', 1, '2023-02-21 10:08:02', 1, 1);
INSERT INTO `master_data_bahan` VALUES (45, 'B2964561', 'PAKU 7', 7, 106, NULL, NULL, 1, '2023-02-01 20:11:44', 1, '2023-02-21 10:07:58', 1, 1);
INSERT INTO `master_data_bahan` VALUES (55, 'B6865052', 'PAKU 17', 17, 116, NULL, NULL, 1, '2023-02-01 20:11:44', 1, '2023-02-21 10:07:52', 1, 1);
INSERT INTO `master_data_bahan` VALUES (56, 'B484263', 'Paku Payung', 1, 100, NULL, NULL, 5, '2023-02-02 11:09:09', 1, '2023-02-21 10:07:46', 1, 1);
INSERT INTO `master_data_bahan` VALUES (57, 'B2077666', 'Besi Plong', 10, 1000, NULL, NULL, 5, '2023-02-04 12:55:51', 1, '2023-02-21 10:07:43', 1, 1);
INSERT INTO `master_data_bahan` VALUES (58, 'B5484497', 'Cat Kayu', 1, 1, NULL, NULL, 1, '2023-02-18 10:14:11', 1, '2023-02-21 10:07:39', 1, 1);
INSERT INTO `master_data_bahan` VALUES (59, 'B3363445', 'Sekrup', 100, 100, NULL, NULL, 1, '2023-02-18 10:15:30', 1, '2023-02-21 10:07:35', 1, 1);
INSERT INTO `master_data_bahan` VALUES (60, 'B1536779', 'Baut', 100, 100, NULL, NULL, 1, '2023-02-18 10:16:35', 1, '2023-02-21 10:07:27', 1, 1);
INSERT INTO `master_data_bahan` VALUES (61, 'B5233007', 'Paku Payung', 1, 1, NULL, NULL, 1, '2023-02-21 11:02:53', 1, NULL, NULL, 1);
INSERT INTO `master_data_bahan` VALUES (62, 'B2967365', 'Baut 5 mm', 10, 100, NULL, NULL, 1, '2023-02-21 11:04:48', 1, NULL, NULL, 1);
INSERT INTO `master_data_bahan` VALUES (63, 'B2508009', 'Cat Top X', 10, 104, NULL, NULL, 1, '2023-02-28 19:13:45', 1, '2023-05-05 19:58:58', NULL, 1);
INSERT INTO `master_data_bahan` VALUES (64, 'B7535202', 'Karet Kursi', 100, 9, NULL, NULL, 1, '2023-02-28 19:16:29', 1, '2023-05-05 19:58:58', NULL, 1);
INSERT INTO `master_data_bahan` VALUES (65, 'B4720576', 'Kuas', 1, 18, NULL, NULL, 1, '2023-02-28 19:17:26', 1, '2023-05-07 15:20:27', NULL, 1);
INSERT INTO `master_data_bahan` VALUES (66, 'B4134813', 'Besi A', 0, 23, NULL, NULL, 1, '2023-03-12 19:13:57', 1, '2023-05-07 15:20:27', NULL, 1);

-- ----------------------------
-- Table structure for master_data_customer
-- ----------------------------
DROP TABLE IF EXISTS `master_data_customer`;
CREATE TABLE `master_data_customer`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `kode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `no_hp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `alamat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `province_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `city_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `deskripsi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(10) UNSIGNED NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `updated_by` int(10) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1005 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of master_data_customer
-- ----------------------------
INSERT INTO `master_data_customer` VALUES (1, 'CUST/02022023/1136419/20231', 'Achmad Daffa Syifaun F1', '3211', 'begawan pandan sari lor jabung1', 15, 232, 'ahmadmusthofa@gmail.com1', 'CUST/02022023/1136419/20231', 1, '2023-02-02 13:51:00', 1, '2023-02-02 13:52:04', 1);
INSERT INTO `master_data_customer` VALUES (2, 'CUST/11032023/843538/2023', 'Yayan', '1', 'malang', 1, 1, '1@gmail.com', '', 1, '2023-03-11 20:04:38', 1, NULL, NULL);
INSERT INTO `master_data_customer` VALUES (998, 'C998', 'Umum', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-04-07 12:43:24', NULL, '2023-04-07 12:43:28', NULL);
INSERT INTO `master_data_customer` VALUES (999, 'C999', 'Impact', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-04-07 12:43:15', NULL, '2023-04-07 12:43:29', NULL);
INSERT INTO `master_data_customer` VALUES (1000, 'CUST/08042023/589/2023', 'Achmad Syaifullah', '085894635005', 'malang', 15, 232, '', '', 1, '2023-04-08 13:26:33', 1, NULL, NULL);
INSERT INTO `master_data_customer` VALUES (1001, 'CUST/08042023/9925/2023', 'M. Ashab Firdaus', '0858946350051', 'Jombang', 15, 242, '', '', 1, '2023-04-08 13:26:59', 1, NULL, NULL);
INSERT INTO `master_data_customer` VALUES (1002, 'CUST/06052023/3972/2023', 'Rendy Yani Susanto', '0894665523', 'malang', 15, 232, '', '', 1, '2023-05-06 20:07:34', 1, NULL, NULL);
INSERT INTO `master_data_customer` VALUES (1003, 'CUST/06052023/2162/2023', 'Ezhar', '081933046907', 'malang', 15, 232, '', '', 1, '2023-05-06 20:09:36', 1, NULL, NULL);
INSERT INTO `master_data_customer` VALUES (1004, 'CUST/07052023/7960/2023', 'Cicik', '081933046907', 'malang', 15, 257, '', '', 1, '2023-05-07 07:59:13', 1, NULL, NULL);

-- ----------------------------
-- Table structure for master_data_suplier
-- ----------------------------
DROP TABLE IF EXISTS `master_data_suplier`;
CREATE TABLE `master_data_suplier`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `kode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nama` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `no_hp` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `city_id` int(10) UNSIGNED NOT NULL,
  `alamat` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `deskripsi` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(10) UNSIGNED NOT NULL,
  `updated_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  `updated_by` int(10) UNSIGNED NOT NULL,
  `province_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of master_data_suplier
-- ----------------------------
INSERT INTO `master_data_suplier` VALUES (12, 'MST/5662615/2023', 'FM BAEL - 123', '55645555s', 257, 'Malang', 'by998@digipen.edus', 'MST/5662615/2023', 1, '2023-01-25 19:20:55', 1, '2023-01-25 19:33:35', 0, 15);
INSERT INTO `master_data_suplier` VALUES (13, 'MST/6038917/2023', 'PT. Integritas Papua Mandiri', '085894635005', 471, 'Papua', 'A@gmail.com', '', 1, '2023-01-31 09:01:19', 1, '2023-01-31 09:01:19', 0, 34);
INSERT INTO `master_data_suplier` VALUES (15, 'MST/2995593/2023', 'Bagyo Adi', '087621643713', 262, 'Jl. Pacarkeling Surabaya', 'bagyoadi@gmail.com', '-', 1, '2023-02-04 12:33:18', 1, '2023-02-04 12:33:40', 1, 15);
INSERT INTO `master_data_suplier` VALUES (16, 'MST/5408874/2023', 'PT Tjiwi', '085894635005', 262, 'Surabaya', 'A@gmail.com', 'Suplier Kertas', 1, '2023-03-12 19:05:45', 1, '2023-03-12 19:05:45', 0, 15);
INSERT INTO `master_data_suplier` VALUES (17, 'MST/9879370/2023', 'Sinar Jaya', '+6285894632505', 262, 'Surabaya', '', 'Suplier Besi', 1, '2023-03-12 19:09:51', 1, '2023-03-12 19:09:51', 0, 15);
INSERT INTO `master_data_suplier` VALUES (18, 'MST/5774/2023', 'Tokorejo', '085894635005', 262, 'Surabaya', 'tokorejo.center@gmail.com', '', 1, '2023-03-31 18:13:59', 1, '2023-03-31 18:13:59', 0, 15);
INSERT INTO `master_data_suplier` VALUES (19, '', 'UMUM', '', 0, NULL, '', '', 1, '2023-04-08 14:32:57', 0, '2023-04-08 14:33:20', 0, NULL);

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES (1, 'Pengadaan');
INSERT INTO `menu` VALUES (2, 'Produksi');
INSERT INTO `menu` VALUES (3, 'Penjualan');
INSERT INTO `menu` VALUES (4, 'Pengiriman');
INSERT INTO `menu` VALUES (5, 'Keuangan');
INSERT INTO `menu` VALUES (6, 'Laporan');
INSERT INTO `menu` VALUES (7, 'HR');

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `version` bigint(20) NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (2);

-- ----------------------------
-- Table structure for pemasukan_lain
-- ----------------------------
DROP TABLE IF EXISTS `pemasukan_lain`;
CREATE TABLE `pemasukan_lain`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trans_code` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `keterangan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `tanggal` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `total` double(20, 2) NULL DEFAULT NULL,
  `create_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `akun_beban` int(11) NULL DEFAULT NULL,
  `akun_kas` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pemasukan_lain
-- ----------------------------
INSERT INTO `pemasukan_lain` VALUES (2, 'PML/7589', 'Jual TV Bekas', '2023-04-28', 550000.00, '2023-04-28 10:29:00', 19, 1);
INSERT INTO `pemasukan_lain` VALUES (3, 'PML/1534', 'Jual Barang Bekas', '2023-04-28', 750000.00, '2023-04-28 10:38:47', 21, 1);

-- ----------------------------
-- Table structure for pembayaran_purchase_order
-- ----------------------------
DROP TABLE IF EXISTS `pembayaran_purchase_order`;
CREATE TABLE `pembayaran_purchase_order`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `cara_bayar` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `jumlah` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `po_id` int(11) NULL DEFAULT NULL,
  `keterangan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pembayaran_sales_order
-- ----------------------------
DROP TABLE IF EXISTS `pembayaran_sales_order`;
CREATE TABLE `pembayaran_sales_order`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `so_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `kode` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `total` decimal(20, 0) NULL DEFAULT NULL,
  `tanggal` date NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `updated_by` int(11) NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pembayaran_sales_order
-- ----------------------------
INSERT INTO `pembayaran_sales_order` VALUES (1, 4, 'PBSO4312720', 600000, '2023-03-11', '2023-03-11 20:02:04', 1, '2023-05-06 10:36:54', NULL, 0);
INSERT INTO `pembayaran_sales_order` VALUES (2, 4, 'PBSO4312720', 600000, '2023-03-11', '2023-03-11 20:02:51', 1, NULL, NULL, 0);
INSERT INTO `pembayaran_sales_order` VALUES (3, 4, 'PBSO4312720', 600000, '2023-03-11', '2023-03-11 20:03:16', 1, NULL, NULL, 0);
INSERT INTO `pembayaran_sales_order` VALUES (4, 7, '20275', 300000, '2023-03-11', '2023-03-11 20:05:35', 1, NULL, NULL, 0);
INSERT INTO `pembayaran_sales_order` VALUES (5, 8, 'PBSO7717387', 600000, '2023-03-11', '2023-03-11 20:07:53', 1, NULL, NULL, 0);
INSERT INTO `pembayaran_sales_order` VALUES (6, 9, '4838', 50000, '2023-03-12', '2023-03-12 19:20:03', 1, NULL, NULL, 0);
INSERT INTO `pembayaran_sales_order` VALUES (7, 10, '22818', 500000, '2023-04-07', '2023-04-07 11:11:00', 1, NULL, NULL, 0);
INSERT INTO `pembayaran_sales_order` VALUES (8, 11, '7423', 220000, '2023-04-07', '2023-04-07 19:16:37', 1, NULL, NULL, 0);
INSERT INTO `pembayaran_sales_order` VALUES (9, 13, '52405', 200000, '2023-04-08', '2023-04-08 14:40:55', 1, NULL, NULL, 0);
INSERT INTO `pembayaran_sales_order` VALUES (10, 16, '99275', 500000, '2023-04-08', '2023-04-08 15:17:13', 1, NULL, NULL, 0);
INSERT INTO `pembayaran_sales_order` VALUES (11, 18, '48621', 100000, '2023-05-06', '2023-05-06 20:10:15', 1, NULL, NULL, 0);
INSERT INTO `pembayaran_sales_order` VALUES (12, 19, '94500', 100000, '2023-05-07', '2023-05-07 07:59:54', 1, NULL, NULL, 0);
INSERT INTO `pembayaran_sales_order` VALUES (15, 19, 'P222012', 75000, '2023-05-07', '2023-05-07 09:52:29', 1, NULL, NULL, 0);
INSERT INTO `pembayaran_sales_order` VALUES (16, 20, '3687', 500000, '2023-05-07', '2023-05-07 12:46:08', 1, NULL, NULL, 0);
INSERT INTO `pembayaran_sales_order` VALUES (17, 21, '15337', 100000, '2023-05-07', '2023-05-07 15:23:15', 1, NULL, NULL, 0);
INSERT INTO `pembayaran_sales_order` VALUES (18, 21, 'P988968', 200000, '2023-05-07', '2023-05-07 15:24:03', 1, NULL, NULL, 0);

-- ----------------------------
-- Table structure for pembayaran_tagihan
-- ----------------------------
DROP TABLE IF EXISTS `pembayaran_tagihan`;
CREATE TABLE `pembayaran_tagihan`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `kode` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `total` decimal(20, 0) NULL DEFAULT NULL,
  `tanggal` date NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `updated_by` int(11) NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT 0,
  `status_aktif` tinyint(1) NULL DEFAULT 1,
  `no_tagihan` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `penagih` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `jatuh_tempo` date NULL DEFAULT NULL,
  `keterangan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `diskon` decimal(10, 2) NULL DEFAULT NULL,
  `is_ppn` tinyint(1) NULL DEFAULT NULL,
  `ppn_id` int(11) NULL DEFAULT NULL,
  `subtotal` decimal(10, 2) NULL DEFAULT NULL,
  `total_ppn` decimal(10, 2) NULL DEFAULT NULL,
  `suplier_id` int(11) NULL DEFAULT NULL,
  `total_bayar` decimal(10, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pembayaran_tagihan
-- ----------------------------
INSERT INTO `pembayaran_tagihan` VALUES (1, 'Nota/PT/1334', 1111000, '2023-04-04', '2023-04-04 19:40:07', 1, '2023-04-08 14:10:56', NULL, 0, 1, 'PT123', 'Rendy', '2023-04-13', '-', 110000.00, 1, 1, 1100000.00, 121000.00, 17, NULL);
INSERT INTO `pembayaran_tagihan` VALUES (2, 'Nota/PT/4723', 1526000, '2023-04-04', '2023-04-04 20:07:12', 1, '2023-04-04 20:07:49', NULL, 0, 1, 'EST/2023/01/112', 'Yohan', '2023-04-05', '-', 28000.00, 1, 1, 1400000.00, 154000.00, 18, NULL);
INSERT INTO `pembayaran_tagihan` VALUES (3, 'Nota/PT/3620', 2220000, '2023-04-07', '2023-04-07 18:57:33', 1, '2023-04-08 14:52:11', NULL, 0, 1, 'PT123', 'Rendy', '2023-04-07', '', 0.00, 1, 1, 2000000.00, 220000.00, 17, NULL);
INSERT INTO `pembayaran_tagihan` VALUES (4, 'Nota/PT/6520', 55500, '2023-04-08', '2023-04-08 15:11:05', 1, '2023-04-08 15:12:51', NULL, 0, 0, 'EST/2023/01/112', 'Rendy', '2023-04-08', '', 0.00, 1, 1, 50000.00, 5500.00, 13, NULL);
INSERT INTO `pembayaran_tagihan` VALUES (5, 'Nota/PT/5926', 500000, '2023-04-21', '2023-04-21 14:35:12', 1, '2023-04-21 16:38:48', 1, 1, 1, 'PT1234', 'Rendy1', '2023-04-29', 'asd1', 0.00, 0, 0, 500000.00, 0.00, 19, NULL);
INSERT INTO `pembayaran_tagihan` VALUES (6, 'Nota/PT/7703', 1000000, '2023-05-05', '2023-05-05 21:16:58', 1, NULL, NULL, 0, 1, '123', 'Rendy', '2023-05-05', '', 0.00, 0, 0, 1000000.00, 0.00, 18, NULL);
INSERT INTO `pembayaran_tagihan` VALUES (7, 'Nota/PT/1878', 500000, '2023-05-05', '2023-05-05 21:23:12', 1, NULL, NULL, 0, 1, 'EST/2023/01/112', 'Rendy', '2023-05-05', '', 0.00, 0, 0, 500000.00, 0.00, 18, NULL);
INSERT INTO `pembayaran_tagihan` VALUES (8, 'Nota/PT/2232', 1000000, '2023-05-05', '2023-05-05 21:24:27', 1, NULL, NULL, 0, 1, 'EST/2023/01/11223', 'Rendy', '2023-05-05', '', 0.00, 0, 0, 1000000.00, 0.00, 18, 100000.00);
INSERT INTO `pembayaran_tagihan` VALUES (9, 'Nota/PT/1641', 162500, '2023-05-07', '2023-05-07 14:48:50', 1, NULL, NULL, 0, 1, 'EST/2023/01/112', 'Rendy', '2023-05-07', '', 0.00, 0, 0, 162500.00, 0.00, 18, 162500.00);
INSERT INTO `pembayaran_tagihan` VALUES (10, 'Nota/PT/6993', 225000, '2023-05-07', '2023-05-07 15:21:32', 1, NULL, NULL, 0, 1, 'EST/2023/01/112', 'Rendy', '2023-05-07', '', 0.00, 0, 0, 225000.00, 0.00, 18, 225000.00);

-- ----------------------------
-- Table structure for penerimaan_barang
-- ----------------------------
DROP TABLE IF EXISTS `penerimaan_barang`;
CREATE TABLE `penerimaan_barang`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `kode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `purchase_order_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `no_surat_jalan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `gudang_id` int(11) NULL DEFAULT NULL,
  `tanggal` date NULL DEFAULT NULL,
  `nama_pengirim` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `keterangan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `updated_by` int(11) NULL DEFAULT NULL,
  `status_aktif` tinyint(1) NULL DEFAULT 1,
  `total_pembayaran` decimal(20, 2) NULL DEFAULT NULL,
  `nilai_pb` decimal(20, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of penerimaan_barang
-- ----------------------------
INSERT INTO `penerimaan_barang` VALUES (3, 'PB-6753369', 8, '123', 1, '2023-03-02', 'Rendy', '', 1, '2023-03-02 11:40:22', 1, '2023-03-29 18:53:00', NULL, 0, NULL, NULL);
INSERT INTO `penerimaan_barang` VALUES (4, 'PB-8187181', 11, '123', 1, '2023-03-12', 'Rendy', 'asd', 0, '2023-03-12 19:16:29', 1, '2023-03-28 19:55:12', NULL, 0, NULL, NULL);
INSERT INTO `penerimaan_barang` VALUES (5, 'PB-3614', 11, '1', 1, '2023-03-28', 'Rendy', 'asd', 1, '2023-03-28 11:02:55', 1, '2023-03-28 19:55:11', NULL, 0, NULL, NULL);
INSERT INTO `penerimaan_barang` VALUES (6, 'PB-3614', 11, '1', 1, '2023-03-28', 'Rendy', 'asd', 1, '2023-03-28 11:03:06', 1, '2023-03-28 19:55:11', NULL, 0, NULL, NULL);
INSERT INTO `penerimaan_barang` VALUES (10, 'PB-9521', 13, '123', 1, '2023-03-30', 'Rendy', '', 0, '2023-03-30 10:03:20', 1, NULL, NULL, 1, NULL, NULL);
INSERT INTO `penerimaan_barang` VALUES (11, 'PB-6380', 13, '123', 1, '2023-03-30', 'Rendy', '123', 0, '2023-03-30 10:15:49', 1, NULL, NULL, 1, NULL, NULL);
INSERT INTO `penerimaan_barang` VALUES (12, 'PB-3093', 14, '123', 1, '2023-03-31', 'Rendy', '', 0, '2023-03-31 18:16:40', 1, NULL, NULL, 1, NULL, NULL);
INSERT INTO `penerimaan_barang` VALUES (13, 'PB-7041', 15, '123', 1, '2023-04-07', 'Rendy', '', 0, '2023-04-07 18:41:14', 1, NULL, NULL, 1, NULL, NULL);
INSERT INTO `penerimaan_barang` VALUES (14, 'PB-2655', 16, '123', 1, '2023-04-07', '-', '', 0, '2023-04-07 18:49:54', 1, '2023-04-08 14:51:58', NULL, 1, NULL, NULL);
INSERT INTO `penerimaan_barang` VALUES (15, 'PB-9434', 16, '21321', 1, '2023-04-07', 'Rendy', '1', 0, '2023-04-07 18:50:45', 1, '2023-04-08 14:51:58', NULL, 1, NULL, NULL);
INSERT INTO `penerimaan_barang` VALUES (16, 'PB-802', 18, '123', 1, '2023-04-08', 'Rendy', '', 0, '2023-04-08 15:07:35', 1, '2023-04-08 15:12:57', NULL, 0, NULL, NULL);
INSERT INTO `penerimaan_barang` VALUES (17, 'PB-9187', 18, '21321', 1, '2023-04-08', 'Rendy', '1', 0, '2023-04-08 15:08:31', 1, '2023-04-08 15:12:57', NULL, 0, NULL, NULL);
INSERT INTO `penerimaan_barang` VALUES (18, 'PB-7566', 19, '21321', 1, '2023-04-20', 'Rendy', 'tes', 0, '2023-04-20 09:27:06', 1, '2023-04-21 14:33:34', 1, 1, NULL, NULL);
INSERT INTO `penerimaan_barang` VALUES (19, 'PB-8922', 19, '123', 1, '2023-04-21', 'Rendy', '-', 0, '2023-04-21 16:27:29', 1, NULL, NULL, 1, NULL, NULL);
INSERT INTO `penerimaan_barang` VALUES (20, 'PB-5037', 20, '21321', 1, '2023-04-27', 'Rendy', '-', 0, '2023-04-27 15:15:10', 1, NULL, NULL, 1, NULL, NULL);
INSERT INTO `penerimaan_barang` VALUES (22, 'PB-580', 22, '123', 1, '2023-05-05', 'Rendy', '-', 1, '2023-05-05 19:41:45', 1, NULL, NULL, 1, NULL, 500000.00);
INSERT INTO `penerimaan_barang` VALUES (23, 'PB-540', 22, '44441', 1, '2023-05-05', 'Rendy', '-', 0, '2023-05-05 19:58:58', 1, NULL, NULL, 1, NULL, 1000000.00);
INSERT INTO `penerimaan_barang` VALUES (24, 'PB-7098', 23, '7398127', 1, '2023-05-07', 'Rendy', '', 0, '2023-05-07 14:47:33', 1, NULL, NULL, 1, NULL, 162500.00);
INSERT INTO `penerimaan_barang` VALUES (25, 'PB-7781', 24, '1', 1, '2023-05-07', 'Rendy', '', 0, '2023-05-07 15:20:27', 1, NULL, NULL, 1, NULL, 225000.00);

-- ----------------------------
-- Table structure for ppn
-- ----------------------------
DROP TABLE IF EXISTS `ppn`;
CREATE TABLE `ppn`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `kode` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nama` int(11) NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `updated_by` int(11) NULL DEFAULT NULL,
  `is_active` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ppn
-- ----------------------------
INSERT INTO `ppn` VALUES (1, 'PPN-6277925', 11, 1, '2023-02-07 08:00:49', 1, '2023-02-15 11:03:35', 1, 1);
INSERT INTO `ppn` VALUES (2, 'PPN-8646330', 10, 1, '2023-02-15 11:03:25', 1, NULL, NULL, 0);

-- ----------------------------
-- Table structure for produk
-- ----------------------------
DROP TABLE IF EXISTS `produk`;
CREATE TABLE `produk`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `kode` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nama` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `qty` int(11) NULL DEFAULT NULL,
  `min_qty` int(11) NULL DEFAULT 0,
  `satuan_barang_id` int(11) NULL DEFAULT NULL,
  `harga` int(11) NULL DEFAULT NULL,
  `kategori_barang_id` int(11) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `updated_by` int(11) NULL DEFAULT NULL,
  `gudang_id` int(11) NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of produk
-- ----------------------------
INSERT INTO `produk` VALUES (1, 'MSBJ/5341588/02/01022023', 'Kursi Kantor', 20, 11, 2, 200000, 2, '2023-02-01 20:58:29', 1, '2023-02-02 11:26:11', 1, 2, 1);
INSERT INTO `produk` VALUES (2, 'MSBJ/2784949/02/02022023', 'MEJA1', 100, 1, 2, 100000, 2, '2023-02-01 21:15:19', 1, '2023-02-02 11:25:37', 1, 1, 1);
INSERT INTO `produk` VALUES (3, 'MSBJ/8214492/02/02022023', 'MEJA 2', 101, 2, 2, 200000, 1, '2023-02-01 21:15:19', 1, '2023-02-02 11:25:32', 1, 2, 1);
INSERT INTO `produk` VALUES (4, 'MSBJ/8567314/02/02022023', 'MEJA3', 102, 3, 1, 300000, 2, '2023-02-01 21:15:19', 1, '2023-02-02 11:25:27', 1, 1, 1);
INSERT INTO `produk` VALUES (5, 'MSBJ/3334951/02/02022023', 'MEJA4', 103, 4, 1, 400000, 1, '2023-02-01 21:15:19', 1, '2023-02-02 11:25:23', 1, 2, 1);
INSERT INTO `produk` VALUES (6, 'MSBJ/4342382/02/02022023', 'MEJA5', 104, 5, 2, 500000, 2, '2023-02-01 21:15:19', 1, '2023-02-02 11:25:19', 1, 1, 1);
INSERT INTO `produk` VALUES (7, 'MSBJ/63151/02/02022023', 'MEJA6', 105, 6, 2, 600000, 1, '2023-02-01 21:15:19', 1, '2023-02-02 11:25:13', 1, 2, 1);
INSERT INTO `produk` VALUES (8, 'MSBJ/3492136/02/02022023', 'Kursi Gaming', 20, 1, 1, 780000, 1, '2023-02-02 10:45:33', 1, '2023-02-02 11:01:46', 1, 2, 1);
INSERT INTO `produk` VALUES (9, 'MSBJ/3613968/02/04022023', 'Kursi Minimalis 1', 150, 100, 2, 150000, 1, '2023-02-04 13:01:35', 1, '2023-02-04 13:02:02', 1, 1, 1);
INSERT INTO `produk` VALUES (10, '192312', 'Kursi P1', 1, 0, 1, 200000, 1, '2023-04-07 11:11:00', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `produk` VALUES (11, '3213', 'Kursi P2', 2, 0, 1, 100000, 1, '2023-04-07 11:11:00', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `produk` VALUES (12, '1231231', 'Kursi Coba', 2, 0, 1, 200000, 1, '2023-04-07 19:16:37', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `produk` VALUES (13, '312983', 'Kursi Kantor Tipe 1', 1, 0, 1, 1200000, 1, '2023-04-08 13:28:50', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `produk` VALUES (14, '78987', '1 Set Meja Makan Tipe 1', 1, 0, 1, 1500000, 2, '2023-04-08 13:28:50', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `produk` VALUES (15, '231234', 'Kursi Meeting tipe A', 1, 0, 1, 800000, 1, '2023-04-08 14:42:54', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `produk` VALUES (16, '231234', 'Kursi Direktur', 1, 0, 1, 1000000, 1, '2023-04-08 15:17:13', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `produk` VALUES (17, '444', 'Kursi Kantor Custom', 1, 0, 1, 800000, 1, '2023-05-07 15:29:12', NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for produk_suplier
-- ----------------------------
DROP TABLE IF EXISTS `produk_suplier`;
CREATE TABLE `produk_suplier`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `harga` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `created_by` int(11) NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `suplier_id` int(10) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of produk_suplier
-- ----------------------------
INSERT INTO `produk_suplier` VALUES (1, 'Mur', '100', NULL, '2023-02-24 10:25:40', NULL, NULL, 17);
INSERT INTO `produk_suplier` VALUES (2, 'Baut', '200', NULL, '2023-02-24 10:25:40', NULL, NULL, 17);
INSERT INTO `produk_suplier` VALUES (3, 'Sekrup', '300', NULL, '2023-02-24 10:25:40', NULL, NULL, 17);
INSERT INTO `produk_suplier` VALUES (4, 'Lem', '4000', '2023-02-24 10:19:13', '2023-02-24 10:25:45', 1, NULL, 18);
INSERT INTO `produk_suplier` VALUES (5, 'Besi', '5000', '2023-02-24 10:19:13', '2023-02-24 10:25:45', 1, NULL, 18);
INSERT INTO `produk_suplier` VALUES (6, 'Kertas', '100', '2023-03-12 19:05:45', NULL, 1, NULL, 16);
INSERT INTO `produk_suplier` VALUES (7, 'Kertas Buram', '90', '2023-03-12 19:05:45', NULL, 1, NULL, 16);
INSERT INTO `produk_suplier` VALUES (8, 'Baut', '500', '2023-03-12 19:09:51', NULL, 1, NULL, 17);
INSERT INTO `produk_suplier` VALUES (9, 'Lem', '2000', '2023-03-12 19:09:51', NULL, 1, NULL, 17);
INSERT INTO `produk_suplier` VALUES (10, 'Besi', '50000', '2023-03-12 19:09:51', NULL, 1, NULL, 17);

-- ----------------------------
-- Table structure for produksi
-- ----------------------------
DROP TABLE IF EXISTS `produksi`;
CREATE TABLE `produksi`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `tanggal` date NULL DEFAULT NULL,
  `keterangan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `updated_by` int(11) NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT NULL,
  `status_produksi` tinyint(1) NULL DEFAULT NULL,
  `so_id` int(11) NULL DEFAULT NULL,
  `customer_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of produksi
-- ----------------------------
INSERT INTO `produksi` VALUES (1, 'Produksi/5514', '2023-04-07', '1', '2023-04-07 08:28:25', 1, '2023-04-08 13:39:34', NULL, 0, 1, NULL, NULL);
INSERT INTO `produksi` VALUES (2, 'Prod-INV/SO/1282212', '2023-04-07', 'Produksi dari SO : INV/SO/128', '2023-04-07 11:11:00', 1, '2023-04-08 14:38:40', NULL, 1, 2, 10, NULL);
INSERT INTO `produksi` VALUES (3, 'Produksi/7596', '2023-04-08', '', '2023-04-07 19:06:35', 1, '2023-04-08 13:33:38', NULL, 0, 3, NULL, 999);
INSERT INTO `produksi` VALUES (4, 'Prod-INV/SO/9928701', '2023-04-07', 'Produksi dari SO : INV/SO/992', '2023-04-07 19:16:37', 1, NULL, NULL, 1, 0, NULL, NULL);
INSERT INTO `produksi` VALUES (5, 'Prod-INV/SO/999671', '2023-04-08', 'Produksi dari SO : INV/SO/999', '2023-04-08 13:28:50', 1, '2023-04-08 13:30:31', NULL, 1, 2, 12, NULL);
INSERT INTO `produksi` VALUES (6, 'Prod-INV/SO/81989699', '2023-04-08', 'Produksi dari SO : INV/SO/8198', '2023-04-08 14:42:54', 1, '2023-04-08 14:43:59', NULL, 1, 2, 14, NULL);
INSERT INTO `produksi` VALUES (7, 'Prod-INV/SO/63908291', '2023-04-08', 'Produksi dari SO : INV/SO/6390', '2023-04-08 15:17:13', 1, '2023-04-08 15:18:42', NULL, 1, 2, 16, NULL);
INSERT INTO `produksi` VALUES (8, 'Produksi/8929', '2023-04-08', '', '2023-04-08 15:25:06', 1, NULL, NULL, 1, 1, NULL, 999);
INSERT INTO `produksi` VALUES (9, 'Produksi/1972', '2023-05-07', '', '2023-05-07 15:27:58', 1, NULL, NULL, 1, 1, NULL, 999);
INSERT INTO `produksi` VALUES (10, 'Prod-INV/SO/54525973', '2023-05-07', 'Produksi dari SO : INV/SO/5452', '2023-05-07 15:29:12', 1, '2023-05-07 15:30:13', NULL, 1, 2, 22, NULL);

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
INSERT INTO `profil_website` VALUES ('POLARIS', 'Pogot', '085894632505', 'logo-w.png', 'bulb.png', 'undefined', 'Shop with the nature, Please shop with me', '<p>The Balance Small Business makes launching and managing your own business easy. It is home to experts who provide clear, practical advice on entrepreneurship and management. Whether you&rsquo;re just starting up or you want to take your company to the next level, our 20-year-strong library of more than 7,000 pieces of content will answer your questions and turn your business dreams into reality.</p>\n\n<p><a href=\"https://www.thebalancesmb.com/\">The Balance</a>&nbsp;is part of The Balance family of sites, including&nbsp;<a href=\"https://www.thebalance.com/\" rel=\"noopener\" target=\"_blank\">The Balance</a>&nbsp;and&nbsp;<a href=\"https://www.thebalancecareers.com/\" rel=\"noopener\" target=\"_blank\">The Balance Careers</a>, covering personal finance, career, and small business topics. With more than 24 million monthly visitors, The Balance is among the top-10 largest finance properties as measured by comScore, a leading Internet measurement company. Our more than 50 expert writers have extensive qualifications and expertise in their topics, including MBAs, PhDs, CFPs, other advanced degrees and professional certifications.</p>\n\n<p>The Balance family of sites have been honored by multiple awards in the last year, including&nbsp;<a href=\"https://www.tellyawards.com/winners/2017/short-form-social/general-education-discovery\" rel=\"noopener nofollow\" target=\"_blank\">The Telly Awards</a>,&nbsp;<a href=\"https://www.communicatorawards.com/\" rel=\"noopener nofollow\" target=\"_blank\">The Communicator Awards</a>, and&nbsp;<a href=\"https://www.editorandpublisher.com/news/editor-publisher-announces-the-2017-eppy-award-finalists/\" rel=\"noopener nofollow\" target=\"_blank\">Eppy Awards</a>.</p>\n', 'hallo@smkitasy-syadzili.sch.id', 'Andreas', 'undefined', 'undefined', 'undefined', 'undefined', 'ea4d58dd1254aff316312b7ecbb5c410.jpg', 'Halo Admin, Saya ingin bertanya/membeli/.....', 'd797c14a0070235734508b7d9f409395.jpg', '&copy; 2019. <a href=\"#\">Core Master</a> by<a href=\"https://myber.co.id\" target=\"_blank\">Myber</a>', 'Core Master', 'SMK IT Asy-Syadzili', 'Malang', 'Indonesia', '112.66307147573268', '-7.840640250568774');

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
-- Table structure for purchase_order
-- ----------------------------
DROP TABLE IF EXISTS `purchase_order`;
CREATE TABLE `purchase_order`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `kode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `suplier_id` int(11) NULL DEFAULT NULL,
  `tanggal` date NULL DEFAULT NULL,
  `keterangan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `is_ppn` tinyint(1) NULL DEFAULT 0,
  `ppn_id` int(11) NULL DEFAULT NULL,
  `subtotal` decimal(20, 2) NULL DEFAULT NULL,
  `diskon` decimal(20, 2) NULL DEFAULT NULL,
  `total` decimal(20, 2) NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(10) UNSIGNED NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `updated_by` int(11) NULL DEFAULT NULL,
  `total_ppn` decimal(20, 2) NULL DEFAULT NULL,
  `status_aktif` tinyint(1) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of purchase_order
-- ----------------------------
INSERT INTO `purchase_order` VALUES (4, 'PO-6321875', 12, '2023-02-26', '', 0, 0, 915000.00, 2.00, 840000.00, 0, '2023-02-26 09:49:51', 1, '2023-04-18 20:00:13', NULL, 0.00, 1);
INSERT INTO `purchase_order` VALUES (5, 'PO-3502130', 13, '2023-02-26', '', 1, 11, 2875000.00, 1.00, 3108000.00, 0, '2023-02-26 09:50:44', 1, '2023-04-18 20:00:13', NULL, 30800000.00, 1);
INSERT INTO `purchase_order` VALUES (6, 'PO-9542057', 12, '2023-02-26', '-', 1, 11, 975000.00, 0.00, 999000.00, 0, '2023-02-26 19:41:06', 1, '2023-04-18 20:00:13', NULL, 9900000.00, 1);
INSERT INTO `purchase_order` VALUES (7, 'PO-211449', 12, '2023-02-27', '', 1, 11, 1425000.00, 0.00, 1498500.00, 0, '2023-02-27 14:31:19', 1, '2023-04-18 20:00:13', NULL, 14850000.00, 1);
INSERT INTO `purchase_order` VALUES (8, 'PO-3785850', 15, '2023-02-28', '', 1, 11, 2895000.00, 0.00, 3130200.00, 0, '2023-02-28 18:57:38', 1, '2023-04-18 20:00:13', NULL, 31020000.00, 1);
INSERT INTO `purchase_order` VALUES (9, 'PO-5894763', 13, '2023-02-28', '', 0, 0, 3370000.00, 0.00, 3295000.00, 0, '2023-02-28 19:18:15', 1, '2023-04-18 20:00:13', NULL, 0.00, 1);
INSERT INTO `purchase_order` VALUES (10, 'PO-4318686', 13, '2023-02-28', '', 1, 11, 5925000.00, 0.00, 6493500.00, 0, '2023-02-28 19:20:14', 1, '2023-04-18 20:00:13', NULL, 64350000.00, 1);
INSERT INTO `purchase_order` VALUES (11, 'PO-6694136', 17, '2023-03-12', '', 1, 11, 525000.00, 0.00, 499500.00, 0, '2023-03-12 19:14:26', 1, '2023-04-18 20:00:13', NULL, 4950000.00, 0);
INSERT INTO `purchase_order` VALUES (12, 'PO-8957202', 16, '2023-03-16', '', 1, 1, 2885000.00, 0.00, 2838100.00, 0, '2023-03-16 19:27:40', 1, '2023-04-18 20:00:13', NULL, 2810000.00, 1);
INSERT INTO `purchase_order` VALUES (13, 'PO-2123', 12, '2023-03-30', '', 0, 0, 4425000.00, 0.00, 4350000.00, 0, '2023-03-30 09:57:37', 1, '2023-04-18 20:00:13', NULL, 0.00, 1);
INSERT INTO `purchase_order` VALUES (14, 'PO-6215', 18, '2023-03-31', '', 0, 0, 13425000.00, 0.00, 13350000.00, 0, '2023-03-31 18:15:20', 1, '2023-04-18 20:00:13', NULL, 0.00, 1);
INSERT INTO `purchase_order` VALUES (15, 'PO-6548', 16, '2023-04-07', '', 1, 1, 825000.00, 0.00, 757500.00, 0, '2023-04-07 18:40:09', 1, '2023-04-18 20:00:13', NULL, 750000.00, 1);
INSERT INTO `purchase_order` VALUES (16, 'PO-7888', 17, '2023-04-07', '', 1, 1, 1925000.00, 0.00, 1868500.00, 0, '2023-04-07 18:49:12', 1, '2023-04-18 20:00:13', NULL, 1850000.00, 1);
INSERT INTO `purchase_order` VALUES (17, 'PO-9814', 19, '2023-04-08', '', 1, 11, 12000.00, 0.00, 13320.00, 1, '2023-04-08 14:34:17', 1, '2023-04-18 20:18:30', 1, 1320.00, 1);
INSERT INTO `purchase_order` VALUES (18, 'PO-6579', 13, '2023-04-08', '', 1, 11, -25000.00, 0.00, -111000.00, 0, '2023-04-08 15:06:22', 1, '2023-04-18 20:00:13', NULL, -1100000.00, 0);
INSERT INTO `purchase_order` VALUES (19, 'PO-49333', 19, '2023-04-18', 'tes12345', 0, 0, 500000.00, 0.00, 500000.00, 0, '2023-04-18 18:49:42', 1, '2023-04-20 09:10:14', 1, 0.00, 1);
INSERT INTO `purchase_order` VALUES (20, 'PO-6932', 12, '2023-04-27', '', 0, 0, 10000.00, 0.00, 10000.00, 0, '2023-04-27 15:14:17', 1, NULL, NULL, 0.00, 1);
INSERT INTO `purchase_order` VALUES (21, 'PO-2978', 12, '2023-05-05', '', 0, 0, 800000.00, 0.00, 800000.00, 0, '2023-05-05 18:27:58', 1, NULL, NULL, 0.00, 1);
INSERT INTO `purchase_order` VALUES (22, 'PO-4497', 18, '2023-05-05', '', 0, 0, 3000000.00, 0.00, 3000000.00, 0, '2023-05-05 18:46:36', 1, NULL, NULL, 0.00, 1);
INSERT INTO `purchase_order` VALUES (23, 'PO-3806', 18, '2023-05-07', '', 0, 0, 162500.00, 0.00, 162500.00, 0, '2023-05-07 14:46:08', 1, '2023-05-07 14:47:01', 1, 0.00, 1);
INSERT INTO `purchase_order` VALUES (24, 'PO-2994', 18, '2023-05-07', '', 0, 0, 500000.00, 0.00, 500000.00, 0, '2023-05-07 15:17:21', 1, '2023-05-07 15:19:36', 1, 0.00, 1);

-- ----------------------------
-- Table structure for sales_order
-- ----------------------------
DROP TABLE IF EXISTS `sales_order`;
CREATE TABLE `sales_order`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `kode` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tanggal` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `keterangan` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `is_ppn` tinyint(1) NULL DEFAULT NULL,
  `ppn_id` int(11) NULL DEFAULT NULL,
  `subtotal` decimal(20, 2) NULL DEFAULT NULL,
  `diskon` decimal(20, 2) NULL DEFAULT NULL,
  `total_ppn` decimal(20, 2) NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT NULL,
  `total` decimal(20, 2) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `updated_by` int(11) NULL DEFAULT NULL,
  `status_produksi` tinyint(4) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sales_order
-- ----------------------------
INSERT INTO `sales_order` VALUES (1, 2, 'INV/SO/3291483', '2023-03-11', '1', 1, 11, 500000.00, 0.00, 55000.00, 0, 1100000.00, '2023-03-11 19:24:35', 1, '2023-03-22 10:42:46', NULL, 0);
INSERT INTO `sales_order` VALUES (2, 1, 'INV/SO/3292711', '2023-03-11', 'ew', 1, 11, 300000.00, 1.00, 32670.00, 0, 1100000.00, '2023-03-11 19:25:33', 1, '2023-03-22 10:37:19', NULL, 0);
INSERT INTO `sales_order` VALUES (3, 1, 'INV/SO/9815617', '2023-03-11', 'ew', 1, 11, 1696000.00, 1.00, 184694.40, 0, 1100000.00, '2023-03-11 19:59:54', 1, NULL, NULL, 0);
INSERT INTO `sales_order` VALUES (7, 2, 'INV/SO/113393', '2023-03-11', 'asd', 1, 11, 897000.00, 0.00, 98670.00, 0, 300000.00, '2023-03-11 20:05:35', 1, NULL, NULL, 0);
INSERT INTO `sales_order` VALUES (8, 2, 'INV/SO/174716', '2023-03-11', '123', 1, 11, 1100000.00, 0.00, 121000.00, 0, 1221000.00, '2023-03-11 20:07:53', 1, NULL, NULL, 0);
INSERT INTO `sales_order` VALUES (9, 2, 'INV/SO/3339440', '2023-03-12', '', 1, 11, 100000.00, 0.00, 11000.00, 0, 111000.00, '2023-03-12 19:20:03', 1, NULL, NULL, 0);
INSERT INTO `sales_order` VALUES (10, 2, 'INV/SO/128', '2023-04-07', 'tes', 0, 0, 600000.00, 0.00, 0.00, 0, 600000.00, '2023-04-07 11:11:00', 1, NULL, NULL, 1);
INSERT INTO `sales_order` VALUES (11, 2, 'INV/SO/992', '2023-04-07', '', 1, 11, 600000.00, 0.00, 66000.00, 0, 666000.00, '2023-04-07 19:16:37', 1, NULL, NULL, 1);
INSERT INTO `sales_order` VALUES (12, 1000, 'INV/SO/999', '2023-04-08', '-', 1, 11, 2700000.00, 0.00, 297000.00, 1, 2997000.00, '2023-04-08 13:28:50', 1, NULL, NULL, 1);
INSERT INTO `sales_order` VALUES (13, 1000, 'INV/SO/50', '2023-04-08', '', 0, 0, 200000.00, 0.00, 0.00, 1, 200000.00, '2023-04-08 14:40:55', 1, NULL, NULL, 0);
INSERT INTO `sales_order` VALUES (14, 1001, 'INV/SO/8198', '2023-04-08', '', 1, 11, 900000.00, 0.00, 99000.00, 0, 999000.00, '2023-04-08 14:42:54', 1, NULL, NULL, 1);
INSERT INTO `sales_order` VALUES (15, 1000, 'INV/SO/8308', '2023-04-08', '', 1, 11, 200000.00, 0.00, 22000.00, 0, 222000.00, '2023-04-08 15:15:28', 1, NULL, NULL, 0);
INSERT INTO `sales_order` VALUES (16, 1001, 'INV/SO/6390', '2023-04-08', '', 1, 11, 1200000.00, 0.00, 132000.00, 0, 1332000.00, '2023-04-08 15:17:13', 1, NULL, NULL, 1);
INSERT INTO `sales_order` VALUES (17, 1002, 'INV/SO/6014', '2023-05-06', '', 0, 0, 500000.00, 0.00, 0.00, 0, 500000.00, '2023-05-06 20:08:29', 1, NULL, NULL, 0);
INSERT INTO `sales_order` VALUES (18, 1003, 'INV/SO/6999', '2023-05-06', '', 0, 0, 200000.00, 0.00, 0.00, 0, 200000.00, '2023-05-06 20:10:15', 1, NULL, NULL, 0);
INSERT INTO `sales_order` VALUES (19, 1004, 'INV/SO/5514', '2023-05-07', '', 0, 0, 200000.00, 0.00, 0.00, 0, 200000.00, '2023-05-07 07:59:54', 1, NULL, NULL, 0);
INSERT INTO `sales_order` VALUES (20, 1003, 'INV/SO/6965', '2023-05-07', '', 0, 0, 1500000.00, 0.00, 0.00, 0, 1500000.00, '2023-05-07 12:46:08', 1, NULL, NULL, 0);
INSERT INTO `sales_order` VALUES (21, 1003, 'INV/SO/7220', '2023-05-07', '', 0, 0, 700000.00, 0.00, 0.00, 0, 700000.00, '2023-05-07 15:23:15', 1, NULL, NULL, 0);
INSERT INTO `sales_order` VALUES (22, 1003, 'INV/SO/5452', '2023-05-07', '', 0, 0, 800000.00, 0.00, 0.00, 0, 800000.00, '2023-05-07 15:29:12', 1, NULL, NULL, 1);

-- ----------------------------
-- Table structure for satuan_barang
-- ----------------------------
DROP TABLE IF EXISTS `satuan_barang`;
CREATE TABLE `satuan_barang`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `kode` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nama` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of satuan_barang
-- ----------------------------
INSERT INTO `satuan_barang` VALUES (1, 'SS1', 'PCS', 1);
INSERT INTO `satuan_barang` VALUES (2, 'SS2', 'BJ', 1);
INSERT INTO `satuan_barang` VALUES (3, 'SBAR-4268265', 'PST', 1);

-- ----------------------------
-- Table structure for satuan_beli
-- ----------------------------
DROP TABLE IF EXISTS `satuan_beli`;
CREATE TABLE `satuan_beli`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `kode` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nama` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of satuan_beli
-- ----------------------------
INSERT INTO `satuan_beli` VALUES (1, 'SB-7445934', 'KG', 1);
INSERT INTO `satuan_beli` VALUES (2, 'SB-3519503', 'TON', 1);
INSERT INTO `satuan_beli` VALUES (3, 'SB-22599601', 'Box', 1);
INSERT INTO `satuan_beli` VALUES (4, 'SBAR-5682384', 'PCS', 1);
INSERT INTO `satuan_beli` VALUES (5, 'SBAR-8956158', 'Kaleng', 1);

-- ----------------------------
-- Table structure for satuan_pakai
-- ----------------------------
DROP TABLE IF EXISTS `satuan_pakai`;
CREATE TABLE `satuan_pakai`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `kode` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nama` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `satuan_beli_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `pembagi` decimal(20, 6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `satuan_beli_id`(`satuan_beli_id`) USING BTREE,
  CONSTRAINT `satuan_pakai_ibfk_1` FOREIGN KEY (`satuan_beli_id`) REFERENCES `satuan_beli` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of satuan_pakai
-- ----------------------------
INSERT INTO `satuan_pakai` VALUES (1, 'SP1', 'Gram', 1, 0.001000);
INSERT INTO `satuan_pakai` VALUES (2, 'SP2', 'MG', 1, 0.000001);
INSERT INTO `satuan_pakai` VALUES (3, 'STB6620825', 'Pack', 3, 11.000000);

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
) ENGINE = InnoDB AUTO_INCREMENT = 43 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of setting_table
-- ----------------------------
INSERT INTO `setting_table` VALUES (1, 'buku_tamu', 'template_excel', 'include/template/excel/format_cetak_buku_tamu', 'Template Buku Tamu');
INSERT INTO `setting_table` VALUES (2, 'prestasi_siswa', 'template_excel', 'include/template/excel/format_cetak_prestasi_siswa', 'Template Prestasi Siswa');
INSERT INTO `setting_table` VALUES (3, 'master_data_suplier', 'kode', 'MST/{rand}/{year}', NULL);
INSERT INTO `setting_table` VALUES (4, 'master_data_suplier', 'template_excel', 'master_data_suplier.xlsx', NULL);
INSERT INTO `setting_table` VALUES (5, 'master_data_suplier', 'start_row_excel', '4', NULL);
INSERT INTO `setting_table` VALUES (6, 'master_data_bahan', 'kode', 'B{rand}', NULL);
INSERT INTO `setting_table` VALUES (7, 'master_data_bahan', 'template_excel', 'master_data_bahan.xlsx', NULL);
INSERT INTO `setting_table` VALUES (8, 'master_data_bahan', 'start_row_excel', '4', NULL);
INSERT INTO `setting_table` VALUES (9, 'master_barang_jadi', 'kode', 'MSB/{rand}/{month}/{date}', NULL);
INSERT INTO `setting_table` VALUES (10, 'master_barang_jadi', 'template_excel', 'master_barang_jadi.xlsx', NULL);
INSERT INTO `setting_table` VALUES (11, 'master_barang_jadi', 'start_row_excel', '4', NULL);
INSERT INTO `setting_table` VALUES (12, 'master_data_customer', 'kode', 'CUST/{date}/{rand}/{year}', NULL);
INSERT INTO `setting_table` VALUES (13, 'master_data_customer', 'template_excel', 'master_data_customer.xlsx', NULL);
INSERT INTO `setting_table` VALUES (14, 'master_data_customer', 'start_row_excel', '4', NULL);
INSERT INTO `setting_table` VALUES (15, 'gudang', 'kode', 'JB-{rand}', NULL);
INSERT INTO `setting_table` VALUES (16, 'gudang', 'template_excel', 'master_data_customer.xlsx', NULL);
INSERT INTO `setting_table` VALUES (17, 'gudang', 'start_row_excel', '4', NULL);
INSERT INTO `setting_table` VALUES (18, 'satuan_beli', 'kode', 'SBAR-{rand}', NULL);
INSERT INTO `setting_table` VALUES (19, 'satuan_beli', 'template_excel', 'master_data_customer.xlsx', NULL);
INSERT INTO `setting_table` VALUES (20, 'satuan_beli', 'start_row_excel', '4', NULL);
INSERT INTO `setting_table` VALUES (21, 'satuan_barang', 'kode', 'SB-{rand}', NULL);
INSERT INTO `setting_table` VALUES (22, 'satuan_barang', 'template_excel', 'master_data_customer.xlsx', NULL);
INSERT INTO `setting_table` VALUES (23, 'satuan_barang', 'start_row_excel', '4', NULL);
INSERT INTO `setting_table` VALUES (24, 'kategori_barang', 'kode', 'SB-{rand}', NULL);
INSERT INTO `setting_table` VALUES (25, 'kategori_barang', 'template_excel', 'master_data_customer.xlsx', NULL);
INSERT INTO `setting_table` VALUES (26, 'kategori_barang', 'start_row_excel', '4', NULL);
INSERT INTO `setting_table` VALUES (27, 'jabatan', 'kode', 'SB-{rand}', NULL);
INSERT INTO `setting_table` VALUES (28, 'jabatan', 'template_excel', 'master_data_customer.xlsx', NULL);
INSERT INTO `setting_table` VALUES (29, 'jabatan', 'start_row_excel', '4', NULL);
INSERT INTO `setting_table` VALUES (30, 'ppn', 'kode', 'PPN-{rand}', NULL);
INSERT INTO `setting_table` VALUES (31, 'satuan_pakai', 'kode', 'STB{rand}', NULL);
INSERT INTO `setting_table` VALUES (32, 'karyawan', 'kode', 'KYR-{rand}', NULL);
INSERT INTO `setting_table` VALUES (33, 'purchase_order', 'kode', 'PO-{rand}', NULL);
INSERT INTO `setting_table` VALUES (34, 'penerimaan_barang', 'kode', 'PB-{rand}', NULL);
INSERT INTO `setting_table` VALUES (35, 'pembayaran_tagihan', 'kode', 'Nota/PT/{rand}', NULL);
INSERT INTO `setting_table` VALUES (36, 'sales_order', 'kode', 'INV/SO/{rand}', NULL);
INSERT INTO `setting_table` VALUES (37, 'pembayaran_sales_order', 'kode', 'PBSO{rand}', NULL);
INSERT INTO `setting_table` VALUES (38, 'surat_jalan', 'kode', 'SJ/{rand}', NULL);
INSERT INTO `setting_table` VALUES (39, 'produksi', 'kode', 'Produksi/{rand}', NULL);
INSERT INTO `setting_table` VALUES (40, 'template_produk', 'kode', 'Template-{rand}', NULL);
INSERT INTO `setting_table` VALUES (41, 'pemasukan_lain', 'trans_code', 'PML/{rand}', NULL);
INSERT INTO `setting_table` VALUES (42, 'status_karyawan', 'kode', 'SK{rand}', NULL);

-- ----------------------------
-- Table structure for status_karyawan
-- ----------------------------
DROP TABLE IF EXISTS `status_karyawan`;
CREATE TABLE `status_karyawan`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `color` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `updated_by` int(11) NULL DEFAULT NULL,
  `kode` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of status_karyawan
-- ----------------------------
INSERT INTO `status_karyawan` VALUES (1, 'Harian', '#000000', 1, '2023-05-17 17:49:17', 1, NULL, NULL, 'SK2974');
INSERT INTO `status_karyawan` VALUES (2, 'Borongan', '#03b300', 1, '2023-05-17 17:49:33', 1, '2023-05-17 17:49:52', 1, 'SK690');

-- ----------------------------
-- Table structure for submenu
-- ----------------------------
DROP TABLE IF EXISTS `submenu`;
CREATE TABLE `submenu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_id` int(11) NULL DEFAULT NULL,
  `submenu` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `link` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `c` tinyint(255) NULL DEFAULT NULL,
  `r` tinyint(255) NULL DEFAULT NULL,
  `u` tinyint(255) NULL DEFAULT NULL,
  `d` tinyint(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of submenu
-- ----------------------------
INSERT INTO `submenu` VALUES (1, 1, 'Master Data Suplier', 'master_data_suplier/get_data', 1, 1, 1, 1);
INSERT INTO `submenu` VALUES (2, 1, 'Master Data Bahan', 'master_data_bahan/get_data', 1, 1, 1, 1);
INSERT INTO `submenu` VALUES (3, 1, 'Master Data Barang Jadi', 'master_barang_jadi/get_data', 1, 1, 1, 1);
INSERT INTO `submenu` VALUES (4, 1, 'Faktur Pembelian', 'purchase_order/get_data', 1, 1, 1, 1);
INSERT INTO `submenu` VALUES (5, 1, 'Penerimaan Barang', 'penerimaan_barang/get_data', 1, 1, 1, 1);
INSERT INTO `submenu` VALUES (6, 1, 'Pembayaran Tagihan', 'pembayaran_tagihan/get_data', 1, 1, 1, 1);
INSERT INTO `submenu` VALUES (7, 2, 'Produksi', 'produksi/get_data', 1, 1, 1, 1);
INSERT INTO `submenu` VALUES (8, 2, 'Template Produk', 'produk/template', 1, 1, 1, 1);
INSERT INTO `submenu` VALUES (9, 3, 'Master Data Customer', 'master_data_customer/get_data', 1, 1, 1, 1);
INSERT INTO `submenu` VALUES (10, 3, 'Faktur Penjualan', 'sales_order/get_data', 1, 1, 1, 1);
INSERT INTO `submenu` VALUES (11, 3, 'Pembayaran Sales Order', 'Pembayaran_sales_order/get_data', 1, 1, 1, 1);
INSERT INTO `submenu` VALUES (12, 4, 'Form Surat Jalan', 'Surat_jalan/get_data', 1, 1, 1, 1);
INSERT INTO `submenu` VALUES (13, 5, 'Chart of Account', 'Coa/get_data', 1, 1, 1, 1);
INSERT INTO `submenu` VALUES (14, 5, 'Pemasukan Lain', 'Pemasukan_lain/get_data', 1, 1, 1, 1);
INSERT INTO `submenu` VALUES (15, 5, 'Pengeluaran Lain', 'Pengeluaran_lain/get_data', 1, 1, 1, 1);
INSERT INTO `submenu` VALUES (16, 6, 'Pembelian', 'Laporan/pembelian', 1, 1, 0, 0);
INSERT INTO `submenu` VALUES (17, 6, 'Penjualan', 'Laporan/penjualan', 1, 1, 0, 0);
INSERT INTO `submenu` VALUES (18, 6, 'Hutang', NULL, 1, 1, 0, 0);
INSERT INTO `submenu` VALUES (19, 6, 'Piutang', NULL, 1, 1, 0, 0);
INSERT INTO `submenu` VALUES (20, 6, 'Persediaan', NULL, 1, 1, 0, 0);
INSERT INTO `submenu` VALUES (21, 6, 'Jurnal Umum', 'Jurnal_umum/get_data', 1, 1, 0, 0);
INSERT INTO `submenu` VALUES (22, 6, 'Neraca', 'Laporan/neraca', 1, 1, 0, 0);
INSERT INTO `submenu` VALUES (23, 6, 'Laba Rugi', 'Laporan/laba_rugi', 1, 1, 0, 0);
INSERT INTO `submenu` VALUES (24, 6, 'Buku Besar', 'Laporan/buku_besar', 1, 1, 0, 0);
INSERT INTO `submenu` VALUES (25, 6, 'Customer', 'Laporan/customer', 1, 1, 0, 0);
INSERT INTO `submenu` VALUES (26, 7, 'Master Data Karyawan', 'master_data_karyawan/get_data', 1, 1, 1, 1);
INSERT INTO `submenu` VALUES (27, 7, 'Presensi', NULL, 1, 1, 1, 1);
INSERT INTO `submenu` VALUES (28, 7, 'Penggajian', NULL, 1, 1, 1, 1);

-- ----------------------------
-- Table structure for surat_jalan
-- ----------------------------
DROP TABLE IF EXISTS `surat_jalan`;
CREATE TABLE `surat_jalan`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `so_id` int(11) NULL DEFAULT NULL,
  `kode` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tanggal` date NULL DEFAULT NULL,
  `keterangan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `status` tinyint(4) NULL DEFAULT NULL,
  `status_kirim` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `updated_by` int(11) NULL DEFAULT NULL,
  `nama_pengirim` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of surat_jalan
-- ----------------------------
INSERT INTO `surat_jalan` VALUES (1, 2, 'SJ/8512882', '2023-03-22', 'qa', 0, 'PENGIRIMAN', '2023-03-22 12:22:57', NULL, NULL, NULL, NULL);
INSERT INTO `surat_jalan` VALUES (2, 3, 'SJ/7743481', '2023-03-22', 'ds', 0, 'PENGIRIMAN', '2023-03-22 15:29:23', NULL, NULL, NULL, NULL);
INSERT INTO `surat_jalan` VALUES (3, 8, 'SJ/4140129', '2023-03-02', '', 0, 'PENGIRIMAN', '2023-03-22 18:05:37', NULL, NULL, NULL, NULL);
INSERT INTO `surat_jalan` VALUES (4, 16, 'SJ/212', '2023-04-08', '', 0, 'PENGIRIMAN', '2023-04-08 15:22:09', NULL, NULL, NULL, 'Rendy');

-- ----------------------------
-- Table structure for template_produk
-- ----------------------------
DROP TABLE IF EXISTS `template_produk`;
CREATE TABLE `template_produk`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kode` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nama` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `produk_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of template_produk
-- ----------------------------
INSERT INTO `template_produk` VALUES (1, 'T1', 'Template 1', 1);
INSERT INTO `template_produk` VALUES (2, 'T2', 'Template 2 - Warna Hitam', 1);
INSERT INTO `template_produk` VALUES (3, 'T3', 'Template 3', 1);
INSERT INTO `template_produk` VALUES (4, 'M1', 'Template Meja 4 - 1', 5);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `username` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `activation_selector` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `activation_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `forgotten_password_selector` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `forgotten_password_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `forgotten_password_time` int(10) UNSIGNED NULL DEFAULT NULL,
  `remember_selector` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remember_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_on` int(10) UNSIGNED NOT NULL,
  `last_login` int(10) UNSIGNED NULL DEFAULT NULL,
  `active` tinyint(1) UNSIGNED NULL DEFAULT NULL,
  `first_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `last_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `company` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pin` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `email`(`email`) USING BTREE,
  UNIQUE INDEX `activation_selector`(`activation_selector`) USING BTREE,
  UNIQUE INDEX `forgotten_password_selector`(`forgotten_password_selector`) USING BTREE,
  UNIQUE INDEX `remember_selector`(`remember_selector`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, '127.0.0.1', 'administrator', '$2y$10$dxrlMRQtUt9vRv6IiSXLkegTZQtnpumaSX2dZRHtAkwgIBUrB1/Si', 'admin@admin.com', NULL, '', NULL, NULL, NULL, NULL, NULL, 1268889823, 1684320282, 1, 'Admin', 'istrator', 'ADMIN', '0', '101711');
INSERT INTO `users` VALUES (4, '127.0.0.1', 'rendy', '$2y$10$dxrlMRQtUt9vRv6IiSXLkegTZQtnpumaSX2dZRHtAkwgIBUrB1/Si', 'rendy@admin.com', NULL, '', NULL, NULL, NULL, NULL, NULL, 1268889823, 1683637207, 1, 'Remdu', 'remdu', 'ADMIN', '0', '101711');
INSERT INTO `users` VALUES (5, '::1', 'cicik1', '$2y$10$KSZ.vFo6EgZABaIPuzJPXeRQ4wyqzDEN5hndN8hWoxpiLmX1fo/oq', 'cicik1@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1683979536, 1683982161, 1, 'Cicik Winarsih1', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for users_groups
-- ----------------------------
DROP TABLE IF EXISTS `users_groups`;
CREATE TABLE `users_groups`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) UNSIGNED NOT NULL,
  `group_id` mediumint(8) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of users_groups
-- ----------------------------
INSERT INTO `users_groups` VALUES (1, 1, 1);
INSERT INTO `users_groups` VALUES (2, 4, 2);
INSERT INTO `users_groups` VALUES (3, 5, 2);

-- ----------------------------
-- View structure for vdetailpb
-- ----------------------------
DROP VIEW IF EXISTS `vdetailpb`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vdetailpb` AS select `detail_penerimaan_barang`.`id` AS `id`,`detail_penerimaan_barang`.`penerimaan_barang_id` AS `penerimaan_barang_id`,`detail_penerimaan_barang`.`bahan_id` AS `bahan_id`,`detail_penerimaan_barang`.`qty_pesan` AS `qty_pesan`,`detail_penerimaan_barang`.`qty_terima` AS `qty_terima`,`detail_penerimaan_barang`.`satuan_beli_id` AS `satuan_beli_id`,`penerimaan_barang`.`kode` AS `kode`,`penerimaan_barang`.`purchase_order_id` AS `purchase_order_id`,`penerimaan_barang`.`no_surat_jalan` AS `no_surat_jalan`,`penerimaan_barang`.`gudang_id` AS `gudang_id`,`penerimaan_barang`.`tanggal` AS `tanggal`,`penerimaan_barang`.`nama_pengirim` AS `nama_pengirim`,`penerimaan_barang`.`keterangan` AS `keterangan`,`penerimaan_barang`.`status` AS `status`,`penerimaan_barang`.`created_at` AS `created_at`,`penerimaan_barang`.`created_by` AS `created_by`,`penerimaan_barang`.`updated_at` AS `updated_at`,`penerimaan_barang`.`updated_by` AS `updated_by`,`penerimaan_barang`.`status_aktif` AS `status_aktif`,`penerimaan_barang`.`id` AS `pb_id` from (`detail_penerimaan_barang` join `penerimaan_barang` on((`detail_penerimaan_barang`.`penerimaan_barang_id` = `penerimaan_barang`.`id`)));

-- ----------------------------
-- View structure for v_detail_pb_pt
-- ----------------------------
DROP VIEW IF EXISTS `v_detail_pb_pt`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_detail_pb_pt` AS select `detail_pb_pt`.`id` AS `id`,`detail_pb_pt`.`pb_id` AS `pb_id`,`detail_pb_pt`.`pt_id` AS `pt_id`,`penerimaan_barang`.`purchase_order_id` AS `purchase_order_id`,`pembayaran_tagihan`.`status_aktif` AS `status_aktif`,`pembayaran_tagihan`.`kode` AS `kode`,`pembayaran_tagihan`.`tanggal` AS `tanggal` from ((`detail_pb_pt` join `penerimaan_barang` on((`detail_pb_pt`.`pb_id` = `penerimaan_barang`.`id`))) join `pembayaran_tagihan` on((`detail_pb_pt`.`pt_id` = `pembayaran_tagihan`.`id`)));

-- ----------------------------
-- View structure for v_detail_po_bahan
-- ----------------------------
DROP VIEW IF EXISTS `v_detail_po_bahan`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_detail_po_bahan` AS select `detail_purchase_order`.`id` AS `id`,`detail_purchase_order`.`purchase_order_id` AS `purchase_order_id`,`detail_purchase_order`.`bahan_id` AS `bahan_id`,`detail_purchase_order`.`qty` AS `qty`,`detail_purchase_order`.`satuan_beli_id` AS `satuan_beli_id`,`detail_purchase_order`.`harga` AS `harga`,`detail_purchase_order`.`diskon` AS `diskon`,`detail_purchase_order`.`subtotal` AS `subtotal`,`master_data_bahan`.`kode` AS `kode`,`master_data_bahan`.`nama` AS `nama`,`master_data_bahan`.`min_qty` AS `min_qty`,`master_data_bahan`.`qty` AS `qtystok`,`master_data_bahan`.`gudang_id` AS `gudang_id`,`master_data_bahan`.`status` AS `status`,(select `satuan_beli`.`id` from `satuan_beli` where (`detail_purchase_order`.`satuan_beli_id` = `satuan_beli`.`id`)) AS `id_satuan`,(select `satuan_beli`.`nama` from `satuan_beli` where (`detail_purchase_order`.`satuan_beli_id` = `satuan_beli`.`id`)) AS `nama_satuan` from (`detail_purchase_order` join `master_data_bahan` on((`detail_purchase_order`.`bahan_id` = `master_data_bahan`.`id`)));

-- ----------------------------
-- View structure for v_dpb_pb_dpo
-- ----------------------------
DROP VIEW IF EXISTS `v_dpb_pb_dpo`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_dpb_pb_dpo` AS select `detail_penerimaan_barang`.`id` AS `id`,`detail_penerimaan_barang`.`penerimaan_barang_id` AS `penerimaan_barang_id`,`detail_penerimaan_barang`.`bahan_id` AS `bahan_id`,`detail_penerimaan_barang`.`qty_pesan` AS `qty_pesan`,`detail_penerimaan_barang`.`qty_terima` AS `qty_terima`,`detail_penerimaan_barang`.`satuan_beli_id` AS `satuan_beli_id`,(select `master_data_bahan`.`nama` from `master_data_bahan` where (`master_data_bahan`.`id` = `detail_penerimaan_barang`.`bahan_id`)) AS `nama_bahan`,(select `satuan_beli`.`nama` from `satuan_beli` where (`satuan_beli`.`id` = `detail_penerimaan_barang`.`satuan_beli_id`)) AS `nama_satuan`,`penerimaan_barang`.`purchase_order_id` AS `purchase_order_id`,`penerimaan_barang`.`kode` AS `kode`,`penerimaan_barang`.`no_surat_jalan` AS `no_surat_jalan`,`penerimaan_barang`.`tanggal` AS `tanggal`,`penerimaan_barang`.`gudang_id` AS `gudang_id`,`penerimaan_barang`.`nama_pengirim` AS `nama_pengirim`,`penerimaan_barang`.`keterangan` AS `keterangan`,`penerimaan_barang`.`status` AS `status`,(select `detail_purchase_order`.`harga` from `detail_purchase_order` where ((`detail_purchase_order`.`purchase_order_id` = `penerimaan_barang`.`purchase_order_id`) and (`detail_purchase_order`.`bahan_id` = `detail_penerimaan_barang`.`bahan_id`))) AS `harga_satuan` from (`detail_penerimaan_barang` join `penerimaan_barang` on((`detail_penerimaan_barang`.`penerimaan_barang_id` = `penerimaan_barang`.`id`)));

-- ----------------------------
-- View structure for v_groups_detail_submenu
-- ----------------------------
DROP VIEW IF EXISTS `v_groups_detail_submenu`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_groups_detail_submenu` AS select `groups_detail`.`id` AS `id`,`groups_detail`.`groups_id` AS `groups_id`,`groups_detail`.`submenu_id` AS `submenu_id`,`groups_detail`.`c` AS `c`,`groups_detail`.`r` AS `r`,`groups_detail`.`u` AS `u`,`groups_detail`.`d` AS `d`,`submenu`.`menu_id` AS `menu_id`,`submenu`.`submenu` AS `submenu`,`submenu`.`link` AS `link` from (`groups_detail` join `submenu` on((`groups_detail`.`submenu_id` = `submenu`.`id`)));

-- ----------------------------
-- View structure for v_lap_po
-- ----------------------------
DROP VIEW IF EXISTS `v_lap_po`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_lap_po` AS select `purchase_order`.`id` AS `id`,`purchase_order`.`kode` AS `kode`,`purchase_order`.`suplier_id` AS `suplier_id`,`purchase_order`.`tanggal` AS `tanggal`,`purchase_order`.`keterangan` AS `keterangan`,`purchase_order`.`is_ppn` AS `is_ppn`,`purchase_order`.`ppn_id` AS `ppn_id`,`purchase_order`.`subtotal` AS `subtotal`,`purchase_order`.`diskon` AS `diskon`,`purchase_order`.`total` AS `total`,`purchase_order`.`status` AS `status`,`purchase_order`.`created_at` AS `created_at`,`purchase_order`.`created_by` AS `created_by`,`purchase_order`.`updated_at` AS `updated_at`,`purchase_order`.`updated_by` AS `updated_by`,`purchase_order`.`total_ppn` AS `total_ppn`,`purchase_order`.`status_aktif` AS `status_aktif`,(select `master_data_suplier`.`nama` from `master_data_suplier` where (`master_data_suplier`.`id` = `purchase_order`.`suplier_id`)) AS `nama_suplier` from `purchase_order`;

-- ----------------------------
-- View structure for v_lap_so
-- ----------------------------
DROP VIEW IF EXISTS `v_lap_so`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_lap_so` AS select `sales_order`.`id` AS `id`,`sales_order`.`customer_id` AS `customer_id`,`sales_order`.`kode` AS `kode`,`sales_order`.`tanggal` AS `tanggal`,`sales_order`.`keterangan` AS `keterangan`,`sales_order`.`is_ppn` AS `is_ppn`,`sales_order`.`ppn_id` AS `ppn_id`,`sales_order`.`subtotal` AS `subtotal`,`sales_order`.`diskon` AS `diskon`,`sales_order`.`total_ppn` AS `total_ppn`,`sales_order`.`status` AS `status`,`sales_order`.`total` AS `total`,`sales_order`.`created_at` AS `created_at`,`sales_order`.`created_by` AS `created_by`,`sales_order`.`updated_at` AS `updated_at`,`sales_order`.`updated_by` AS `updated_by`,`sales_order`.`status_produksi` AS `status_produksi`,(select `master_data_customer`.`nama` from `master_data_customer` where (`sales_order`.`customer_id` = `master_data_customer`.`id`)) AS `nama_customer`,(select sum(`pembayaran_sales_order`.`total`) from `pembayaran_sales_order` where (`sales_order`.`id` = `pembayaran_sales_order`.`so_id`)) AS `terbayar` from `sales_order`;

-- ----------------------------
-- View structure for v_pb_po
-- ----------------------------
DROP VIEW IF EXISTS `v_pb_po`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_pb_po` AS select `penerimaan_barang`.`id` AS `id`,`penerimaan_barang`.`kode` AS `kode`,`penerimaan_barang`.`purchase_order_id` AS `purchase_order_id`,`penerimaan_barang`.`no_surat_jalan` AS `no_surat_jalan`,`penerimaan_barang`.`gudang_id` AS `gudang_id`,`penerimaan_barang`.`tanggal` AS `tanggal`,`penerimaan_barang`.`nama_pengirim` AS `nama_pengirim`,`penerimaan_barang`.`keterangan` AS `keterangan`,`penerimaan_barang`.`status` AS `status`,`penerimaan_barang`.`status_aktif` AS `status_aktif`,`penerimaan_barang`.`total_pembayaran` AS `total_pembayaran`,`purchase_order`.`kode` AS `kode_po`,`purchase_order`.`suplier_id` AS `suplier_id` from (`penerimaan_barang` join `purchase_order` on((`penerimaan_barang`.`purchase_order_id` = `purchase_order`.`id`)));

-- ----------------------------
-- View structure for v_so_dtso
-- ----------------------------
DROP VIEW IF EXISTS `v_so_dtso`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_so_dtso` AS select `sales_order`.`id` AS `id`,`sales_order`.`customer_id` AS `customer_id`,`sales_order`.`kode` AS `kode`,`sales_order`.`tanggal` AS `tanggal`,`sales_order`.`keterangan` AS `keterangan`,`sales_order`.`is_ppn` AS `is_ppn`,`sales_order`.`ppn_id` AS `ppn_id`,`sales_order`.`subtotal` AS `subtotal`,`sales_order`.`diskon` AS `diskon`,`sales_order`.`total_ppn` AS `total_ppn`,`sales_order`.`status` AS `status`,`sales_order`.`total` AS `total`,`sales_order`.`created_at` AS `created_at`,`sales_order`.`created_by` AS `created_by`,`sales_order`.`updated_at` AS `updated_at`,`sales_order`.`updated_by` AS `updated_by`,`sales_order`.`status_produksi` AS `status_produksi`,`detail_sales_order`.`produk_id` AS `produk_id`,`detail_sales_order`.`qty` AS `qty`,`detail_sales_order`.`harga` AS `harga` from (`sales_order` join `detail_sales_order` on((`sales_order`.`id` = `detail_sales_order`.`sales_order_id`)));

-- ----------------------------
-- Triggers structure for table detail_penerimaan_barang
-- ----------------------------
DROP TRIGGER IF EXISTS `add_stock`;
delimiter ;;
CREATE TRIGGER `add_stock` AFTER INSERT ON `detail_penerimaan_barang` FOR EACH ROW BEGIN
	Update master_data_bahan set qty = qty+NEW.qty_terima where master_data_bahan.id = new.bahan_id;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table detail_purchase_order
-- ----------------------------
DROP TRIGGER IF EXISTS `upd_total`;
delimiter ;;
CREATE TRIGGER `upd_total` AFTER DELETE ON `detail_purchase_order` FOR EACH ROW BEGIN
update purchase_order SET subtotal = subtotal-(OLD.harga*OLD.qty), total=total-(OLD.harga*OLD.qty)  where purchase_order.id = old.purchase_order_id;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table pemasukan_lain
-- ----------------------------
DROP TRIGGER IF EXISTS `jurnal_pemasukan`;
delimiter ;;
CREATE TRIGGER `jurnal_pemasukan` AFTER INSERT ON `pemasukan_lain` FOR EACH ROW BEGIN
-- 	Debit
	INSERT into jurnal_umum(ref, akun_id, debit, kredit, keterangan, jurnal_umum.table, table_id) VALUES (new.trans_code, new.akun_kas, new.total, 0, new.keterangan, "pemasukan_lain", new.id);
-- 	Kredit
	INSERT into jurnal_umum(ref, akun_id, debit, kredit, keterangan, jurnal_umum.table, table_id) VALUES (new.trans_code, new.akun_beban, 0, new.total, new.keterangan, "pemasukan_lain", new.id);

END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table pembayaran_sales_order
-- ----------------------------
DROP TRIGGER IF EXISTS `jurnal_pso`;
delimiter ;;
CREATE TRIGGER `jurnal_pso` AFTER INSERT ON `pembayaran_sales_order` FOR EACH ROW BEGIN
	-- 	Debit
	INSERT into jurnal_umum(ref, akun_id, debit, kredit, keterangan, jurnal_umum.table, table_id) VALUES (new.kode, 1, new.total, 0, CONCAT("Pembayaran SO pada tanggal ",new.tanggal," dengan Kode ",new.kode), "pembayaran_sales_order", new.id);
-- 	Kredit
	INSERT into jurnal_umum(ref, akun_id, debit, kredit, keterangan, jurnal_umum.table, table_id) VALUES (new.kode, 4, 0, new.total, CONCAT("Pembayaran SO pada tanggal ",new.tanggal," dengan Kode ",new.kode), "pembayaran_sales_order", new.id);
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table pembayaran_tagihan
-- ----------------------------
DROP TRIGGER IF EXISTS `jurnal_pt`;
delimiter ;;
CREATE TRIGGER `jurnal_pt` AFTER INSERT ON `pembayaran_tagihan` FOR EACH ROW BEGIN

IF(new.total_ppn > 0 AND new.diskon > 0) THEN
	-- 	Debit
	INSERT into jurnal_umum(ref, akun_id, debit, kredit, keterangan, jurnal_umum.table, table_id) VALUES (new.kode, 9, new.total_bayar, 0, CONCAT("Pembayaran Tagihan pada tanggal ",new.tanggal," dengan Kode ",new.kode , ", No Tagihan ", new.no_tagihan," dan Penagih ", new.penagih), "pembayaran_tagihan", new.id);
	INSERT into jurnal_umum(ref, akun_id, debit, kredit, keterangan, jurnal_umum.table, table_id) VALUES (new.kode, 38, new.total_ppn, 0, CONCAT("Pembayaran Tagihan pada tanggal ",new.tanggal," dengan Kode ",new.kode , ", No Tagihan ", new.no_tagihan," dan Penagih ", new.penagih), "pembayaran_tagihan", new.id);
-- 	Kredit
	INSERT into jurnal_umum(ref, akun_id, debit, kredit, keterangan, jurnal_umum.table, table_id) VALUES (new.kode, 1, 0, ((new.total_bayar + new.total_ppn) - new.diskon), CONCAT("Pembayaran Tagihan pada tanggal ",new.tanggal," dengan Kode ",new.kode , ", No Tagihan ", new.no_tagihan," dan Penagih ", new.penagih), "pembayaran_tagihan", new.id);
	INSERT into jurnal_umum(ref, akun_id, debit, kredit, keterangan, jurnal_umum.table, table_id) VALUES (new.kode, 37, 0, new.diskon, CONCAT("Pembayaran Tagihan pada tanggal ",new.tanggal," dengan Kode ",new.kode , ", No Tagihan ", new.no_tagihan," dan Penagih ", new.penagih), "pembayaran_tagihan", new.id);

ELSEIF(new.total_ppn > 0 AND new.diskon < 1) THEN
	-- 	Debit
	INSERT into jurnal_umum(ref, akun_id, debit, kredit, keterangan, jurnal_umum.table, table_id) VALUES (new.kode, 9, new.total_bayar, 0, CONCAT("Pembayaran Tagihan pada tanggal ",new.tanggal," dengan Kode ",new.kode , ", No Tagihan ", new.no_tagihan," dan Penagih ", new.penagih), "pembayaran_tagihan", new.id);
	INSERT into jurnal_umum(ref, akun_id, debit, kredit, keterangan, jurnal_umum.table, table_id) VALUES (new.kode, 38, new.total_ppn, 0, CONCAT("Pembayaran Tagihan pada tanggal ",new.tanggal," dengan Kode ",new.kode , ", No Tagihan ", new.no_tagihan," dan Penagih ", new.penagih), "pembayaran_tagihan", new.id);
-- 	Kredit
	INSERT into jurnal_umum(ref, akun_id, debit, kredit, keterangan, jurnal_umum.table, table_id) VALUES (new.kode, 1, 0, ((new.total_bayar + new.total_ppn)), CONCAT("Pembayaran Tagihan pada tanggal ",new.tanggal," dengan Kode ",new.kode , ", No Tagihan ", new.no_tagihan," dan Penagih ", new.penagih), "pembayaran_tagihan", new.id);
	
ELSEIF(new.total_ppn < 1 AND new.diskon>0) THEN
	-- 	Debit
	INSERT into jurnal_umum(ref, akun_id, debit, kredit, keterangan, jurnal_umum.table, table_id) VALUES (new.kode, 9, new.total_bayar, 0, CONCAT("Pembayaran Tagihan pada tanggal ",new.tanggal," dengan Kode ",new.kode , ", No Tagihan ", new.no_tagihan," dan Penagih ", new.penagih), "pembayaran_tagihan", new.id);
-- 	Kredit
	INSERT into jurnal_umum(ref, akun_id, debit, kredit, keterangan, jurnal_umum.table, table_id) VALUES (new.kode, 1, 0, (new.total_bayar - new.diskon), CONCAT("Pembayaran Tagihan pada tanggal ",new.tanggal," dengan Kode ",new.kode , ", No Tagihan ", new.no_tagihan," dan Penagih ", new.penagih), "pembayaran_tagihan", new.id);
	INSERT into jurnal_umum(ref, akun_id, debit, kredit, keterangan, jurnal_umum.table, table_id) VALUES (new.kode, 37, 0, new.diskon, CONCAT("Pembayaran Tagihan pada tanggal ",new.tanggal," dengan Kode ",new.kode , ", No Tagihan ", new.no_tagihan," dan Penagih ", new.penagih), "pembayaran_tagihan", new.id);

ELSE
	-- 	Debit
	INSERT into jurnal_umum(ref, akun_id, debit, kredit, keterangan, jurnal_umum.table, table_id) VALUES (new.kode, 9, new.total_bayar, 0, CONCAT("Pembayaran Tagihan pada tanggal ",new.tanggal," dengan Kode ",new.kode , ", No Tagihan ", new.no_tagihan," dan Penagih ", new.penagih), "pembayaran_tagihan", new.id);
-- 	Kredit
	INSERT into jurnal_umum(ref, akun_id, debit, kredit, keterangan, jurnal_umum.table, table_id) VALUES (new.kode, 1, 0, new.total_bayar, CONCAT("Pembayaran Tagihan pada tanggal ",new.tanggal," dengan Kode ",new.kode , ", No Tagihan ", new.no_tagihan," dan Penagih ", new.penagih), "pembayaran_tagihan", new.id);
END IF;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table penerimaan_barang
-- ----------------------------
DROP TRIGGER IF EXISTS `jurnal_pb`;
delimiter ;;
CREATE TRIGGER `jurnal_pb` AFTER INSERT ON `penerimaan_barang` FOR EACH ROW BEGIN
-- 	Debit
	INSERT into jurnal_umum(ref, akun_id, debit, kredit, keterangan, jurnal_umum.table, table_id) VALUES (new.kode, 5, new.nilai_pb, 0, CONCAT("Penerimaan Barang pada tanggal ",new.tanggal," dengan Kode ",new.kode , ", No Surat Jalan ", new.no_surat_jalan," dan Pengirim ", new.nama_pengirim), "penerimaan_barang", new.id);
-- 	Kredit
	INSERT into jurnal_umum(ref, akun_id, debit, kredit, keterangan, jurnal_umum.table, table_id) VALUES (new.kode, 9, 0, new.nilai_pb, CONCAT("Penerimaan Barang pada tanggal ",new.tanggal," dengan Kode ",new.kode , ", No Surat Jalan ", new.no_surat_jalan," dan Pengirim ", new.nama_pengirim), "penerimaan_barang", new.id);

END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table sales_order
-- ----------------------------
DROP TRIGGER IF EXISTS `jurnal_so`;
delimiter ;;
CREATE TRIGGER `jurnal_so` AFTER INSERT ON `sales_order` FOR EACH ROW BEGIN

IF(new.total_ppn > 0 AND new.diskon > 0) THEN
	-- 	Debit
	INSERT into jurnal_umum(ref, akun_id, debit, kredit, keterangan, jurnal_umum.table, table_id) VALUES (new.kode, 4, (new.subtotal + new.total_ppn - new.diskon), 0, CONCAT("Penjualan pada tanggal ",new.tanggal," dengan Kode ",new.kode ), "sales_order", new.id);
	INSERT into jurnal_umum(ref, akun_id, debit, kredit, keterangan, jurnal_umum.table, table_id) VALUES (new.kode, 36, new.diskon, 0,  CONCAT("Penjualan pada tanggal ",new.tanggal," dengan Kode ",new.kode ), "sales_order", new.id);
-- 	Kredit
	INSERT into jurnal_umum(ref, akun_id, debit, kredit, keterangan, jurnal_umum.table, table_id) VALUES (new.kode, 20, 0, new.subtotal,  CONCAT("Penjualan pada tanggal ",new.tanggal," dengan Kode ",new.kode ), "sales_order", new.id);
	INSERT into jurnal_umum(ref, akun_id, debit, kredit, keterangan, jurnal_umum.table, table_id) VALUES (new.kode, 39, 0, new.total_ppn,   CONCAT("Penjualan pada tanggal ",new.tanggal," dengan Kode ",new.kode ), "sales_order", new.id);

ELSEIF(new.total_ppn > 0 AND new.diskon < 1) THEN
	-- 	Debit
	INSERT into jurnal_umum(ref, akun_id, debit, kredit, keterangan, jurnal_umum.table, table_id) VALUES (new.kode, 4, (new.subtotal + new.total_ppn), 0, CONCAT("Penjualan pada tanggal ",new.tanggal," dengan Kode ",new.kode ), "sales_order", new.id);
	
-- 	Kredit
	INSERT into jurnal_umum(ref, akun_id, debit, kredit, keterangan, jurnal_umum.table, table_id) VALUES (new.kode, 20, 0, new.subtotal,  CONCAT("Penjualan pada tanggal ",new.tanggal," dengan Kode ",new.kode ), "sales_order", new.id);
	INSERT into jurnal_umum(ref, akun_id, debit, kredit, keterangan, jurnal_umum.table, table_id) VALUES (new.kode, 39, 0, new.total_ppn,   CONCAT("Penjualan pada tanggal ",new.tanggal," dengan Kode ",new.kode ), "sales_order", new.id);
	
ELSEIF(new.total_ppn < 1 AND new.diskon>0) THEN
-- 	Debit
	INSERT into jurnal_umum(ref, akun_id, debit, kredit, keterangan, jurnal_umum.table, table_id) VALUES (new.kode, 4, (new.subtotal - new.diskon), 0, CONCAT("Penjualan pada tanggal ",new.tanggal," dengan Kode ",new.kode ), "sales_order", new.id);
	INSERT into jurnal_umum(ref, akun_id, debit, kredit, keterangan, jurnal_umum.table, table_id) VALUES (new.kode, 36, new.diskon, 0,  CONCAT("Penjualan pada tanggal ",new.tanggal," dengan Kode ",new.kode ), "sales_order", new.id);
-- 	Kredit
	INSERT into jurnal_umum(ref, akun_id, debit, kredit, keterangan, jurnal_umum.table, table_id) VALUES (new.kode, 20, 0, new.subtotal,  CONCAT("Penjualan pada tanggal ",new.tanggal," dengan Kode ",new.kode ), "sales_order", new.id);

ELSE
	-- 	Debit
	INSERT into jurnal_umum(ref, akun_id, debit, kredit, keterangan, jurnal_umum.table, table_id) VALUES (new.kode, 4, (new.subtotal), 0, CONCAT("Penjualan pada tanggal ",new.tanggal," dengan Kode ",new.kode ), "sales_order", new.id);
	-- 	Kredit
	INSERT into jurnal_umum(ref, akun_id, debit, kredit, keterangan, jurnal_umum.table, table_id) VALUES (new.kode, 20, 0, new.subtotal,  CONCAT("Penjualan pada tanggal ",new.tanggal," dengan Kode ",new.kode ), "sales_order", new.id);
END IF;
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
