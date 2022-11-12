/*
MySQL Data Transfer
Source Host: localhost
Source Database: kasir
Target Host: localhost
Target Database: kasir
Date: 12/11/2022 17:00:58
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for master_barang
-- ----------------------------
CREATE TABLE `master_barang` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama_barang` varchar(100) DEFAULT NULL,
  `harga_satuan` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for transaksi_pembelian
-- ----------------------------
CREATE TABLE `transaksi_pembelian` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idbeli` varchar(20) NOT NULL,
  `total_harga` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for transaksi_pembelian_barang
-- ----------------------------
CREATE TABLE `transaksi_pembelian_barang` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `transaksi_pembelian_id` varchar(11) DEFAULT NULL,
  `master_barang_id` int(11) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `subtotal` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `master_barang` VALUES ('1', 'Sabun Batang', '3000', null, null);
INSERT INTO `master_barang` VALUES ('2', 'Mie Instan', '2000', null, null);
INSERT INTO `master_barang` VALUES ('3', 'Pensil', '1000', null, null);
INSERT INTO `master_barang` VALUES ('4', 'Kopi Sachet', '1500', null, null);
INSERT INTO `master_barang` VALUES ('5', 'Air Minum Galon', '20000', '2022-11-12 16:36:30', '2022-11-12 09:36:30');
INSERT INTO `transaksi_pembelian` VALUES ('1', 'TR001', '60000', '2022-11-12 08:40:46', '2022-11-12 08:40:46');
INSERT INTO `transaksi_pembelian` VALUES ('2', 'TR002', '3000', '2022-11-12 08:46:24', '2022-11-12 08:46:24');
INSERT INTO `transaksi_pembelian` VALUES ('4', 'TR003', '11000', '2022-11-12 09:07:31', '2022-11-12 09:07:31');
INSERT INTO `transaksi_pembelian` VALUES ('5', 'TR004', '3000', '2022-11-12 09:36:39', '2022-11-12 09:36:39');
INSERT INTO `transaksi_pembelian_barang` VALUES ('2', 'TR001', '4', '4', '6000', '2022-11-12 08:04:44', '2022-11-12 08:04:44');
INSERT INTO `transaksi_pembelian_barang` VALUES ('3', 'TR001', '1', '2', '6000', '2022-11-12 08:30:53', '2022-11-12 08:30:53');
INSERT INTO `transaksi_pembelian_barang` VALUES ('4', 'TR001', '3', '2', '2000', '2022-11-12 08:32:58', '2022-11-12 08:32:58');
INSERT INTO `transaksi_pembelian_barang` VALUES ('5', 'TR001', '5', '2', '40000', '2022-11-12 08:36:12', '2022-11-12 08:36:12');
INSERT INTO `transaksi_pembelian_barang` VALUES ('6', 'TR001', '1', '2', '6000', '2022-11-12 08:37:27', '2022-11-12 08:37:27');
INSERT INTO `transaksi_pembelian_barang` VALUES ('9', 'TR002', '1', '1', '3000', '2022-11-12 08:46:20', '2022-11-12 08:46:20');
INSERT INTO `transaksi_pembelian_barang` VALUES ('10', 'TR003', '3', '2', '2000', '2022-11-12 09:06:16', '2022-11-12 09:06:16');
INSERT INTO `transaksi_pembelian_barang` VALUES ('11', 'TR003', '1', '3', '9000', '2022-11-12 09:07:29', '2022-11-12 09:07:29');
INSERT INTO `transaksi_pembelian_barang` VALUES ('12', 'TR004', '1', '1', '3000', '2022-11-12 09:36:37', '2022-11-12 09:36:37');
