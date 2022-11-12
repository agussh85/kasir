/*
MySQL Data Transfer
Source Host: localhost
Source Database: billboard
Target Host: localhost
Target Database: billboard
Date: 29/09/2022 19:43:04
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for about
-- ----------------------------
CREATE TABLE `about` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `keterangan` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for alamat
-- ----------------------------
CREATE TABLE `alamat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `namajalan` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for aplikasi
-- ----------------------------
CREATE TABLE `aplikasi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `judul` varchar(50) DEFAULT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `telepon` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `facebook` varchar(50) DEFAULT NULL,
  `instagram` varchar(50) DEFAULT NULL,
  `youtube` varchar(50) DEFAULT NULL,
  `twitter` varchar(50) DEFAULT NULL,
  `whatsapp` varchar(50) DEFAULT NULL,
  `logo` text DEFAULT NULL,
  `slogan` text DEFAULT NULL,
  `tombol` varchar(40) DEFAULT NULL,
  `link` varchar(80) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for bank
-- ----------------------------
CREATE TABLE `bank` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bank` varchar(60) DEFAULT NULL,
  `accountname` varchar(100) DEFAULT NULL,
  `accountnumber` varchar(100) DEFAULT NULL,
  `logo` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for bankmember
-- ----------------------------
CREATE TABLE `bankmember` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_member` int(11) DEFAULT NULL,
  `bank` varchar(100) DEFAULT NULL,
  `accountname` varchar(100) DEFAULT NULL,
  `accountnumber` varchar(100) DEFAULT NULL,
  `status` int(11) DEFAULT 1 COMMENT '1:user,2:publish',
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for contact
-- ----------------------------
CREATE TABLE `contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` text DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for detailorder
-- ----------------------------
CREATE TABLE `detailorder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_product` int(11) DEFAULT NULL,
  `datestart` varchar(20) DEFAULT NULL,
  `dateend` varchar(20) DEFAULT NULL,
  `timestart` varchar(10) DEFAULT NULL,
  `timeend` varchar(255) DEFAULT NULL,
  `filepicture` text DEFAULT NULL,
  `filevideo` text DEFAULT NULL,
  `filetransfer` text DEFAULT NULL,
  `harga` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for invoice
-- ----------------------------
CREATE TABLE `invoice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_order` int(11) DEFAULT NULL,
  `paymentmethod` int(11) DEFAULT NULL,
  `paymentdate` date DEFAULT NULL,
  `paymentstatus` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for kategori
-- ----------------------------
CREATE TABLE `kategori` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `kategori` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for keys
-- ----------------------------
CREATE TABLE `keys` (
  `idkeys` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) NOT NULL,
  `key` varchar(40) NOT NULL,
  `level` int(2) NOT NULL,
  `ignore_limits` tinyint(1) NOT NULL,
  `is_private_key` tinyint(1) DEFAULT NULL,
  `ip_addresses` text DEFAULT NULL,
  `date_created` datetime NOT NULL,
  `updated_at` text DEFAULT NULL,
  `created_at` text DEFAULT NULL,
  PRIMARY KEY (`idkeys`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for member
-- ----------------------------
CREATE TABLE `member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `passw` text DEFAULT NULL,
  `firstname` varchar(60) DEFAULT NULL,
  `lastname` varchar(60) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `nik` varchar(60) DEFAULT NULL,
  `nohp` varchar(20) DEFAULT NULL,
  `companyname` varchar(100) DEFAULT NULL,
  `companyaddress` text DEFAULT NULL,
  `filektp` varchar(100) DEFAULT NULL,
  `filenpwp` varchar(100) DEFAULT NULL,
  `account` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for ordertransaksi
-- ----------------------------
CREATE TABLE `ordertransaksi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_detail` int(11) DEFAULT NULL,
  `id_member` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `orderdate` date DEFAULT NULL,
  `status` int(11) DEFAULT 0 COMMENT '0 : Waiting Form Confirm,1 : On Progress,2 : On Board,3 : Fi',
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for produk
-- ----------------------------
CREATE TABLE `produk` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_publisher` int(11) DEFAULT NULL,
  `id_jalan` int(11) DEFAULT NULL,
  `id_kategori` int(11) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `produk` varchar(80) DEFAULT NULL,
  `ukuran` varchar(20) DEFAULT NULL,
  `size1` int(11) DEFAULT NULL,
  `size2` int(11) DEFAULT NULL,
  `orientasi` varchar(50) DEFAULT NULL,
  `view` int(11) DEFAULT NULL COMMENT '1:North,2:West,3:East,4:South',
  `harga` int(11) DEFAULT 0,
  `deskripsi` text DEFAULT NULL,
  `keterangan` text DEFAULT NULL,
  `address` text DEFAULT NULL,
  `foto` varchar(80) DEFAULT NULL,
  `foto2` varchar(80) DEFAULT NULL,
  `foto3` varchar(80) DEFAULT NULL,
  `operasionalstart` varchar(10) DEFAULT NULL,
  `operasionalend` varchar(10) DEFAULT NULL,
  `clothing` int(11) DEFAULT 0,
  `perbankan` int(11) DEFAULT 0,
  `beauty` int(11) DEFAULT 0,
  `education` int(11) DEFAULT 0,
  `event` int(11) DEFAULT 0,
  `food` int(11) DEFAULT 0,
  `departement` int(11) DEFAULT 0,
  `convenient` int(11) DEFAULT 0,
  `property` int(11) DEFAULT 0,
  `travel` int(11) DEFAULT 0,
  `alcoholic` int(11) DEFAULT NULL,
  `cigarettes` int(11) DEFAULT NULL,
  `media` int(11) DEFAULT NULL,
  `politics` int(11) DEFAULT 0,
  `other` varchar(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for users
-- ----------------------------
CREATE TABLE `users` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `password` text NOT NULL,
  `nama` text NOT NULL,
  `firstname` varchar(60) DEFAULT NULL,
  `lastname` varchar(80) DEFAULT NULL,
  `email` varchar(80) DEFAULT NULL,
  `foto` varchar(250) DEFAULT NULL,
  `level` varchar(11) NOT NULL,
  `saksikode` int(11) NOT NULL,
  `hp` varchar(20) DEFAULT NULL,
  `active` tinyint(4) NOT NULL,
  `updated_at` text DEFAULT NULL,
  `created_at` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `alamat` VALUES ('1', '1wqwqwq reerere', '2022-09-26 10:29:46', '2022-09-26 10:29:46');
INSERT INTO `alamat` VALUES ('2', '1wqwqwq reerere', '2022-09-26 10:29:58', '2022-09-26 10:29:58');
INSERT INTO `alamat` VALUES ('3', '1wqwqwq reerere', '2022-09-26 10:30:08', '2022-09-26 10:30:08');
INSERT INTO `alamat` VALUES ('4', 'Jl Jakarta', '2022-09-28 16:07:48', '2022-09-28 16:07:48');
INSERT INTO `alamat` VALUES ('5', 'Jl Kebumen', '2022-09-28 16:10:11', '2022-09-28 16:10:11');
INSERT INTO `alamat` VALUES ('6', 'rrrrrrrrrr', '2022-09-27 02:05:27', '2022-09-27 02:05:27');
INSERT INTO `alamat` VALUES ('7', 'rrrrrrrrrr', '2022-09-27 02:18:06', '2022-09-27 02:18:06');
INSERT INTO `alamat` VALUES ('8', 'rrrrrrrrrr', '2022-09-27 02:18:52', '2022-09-27 02:18:52');
INSERT INTO `alamat` VALUES ('9', 'rrrrrrrrrr', '2022-09-27 02:20:02', '2022-09-27 02:20:02');
INSERT INTO `alamat` VALUES ('10', 'rrrrrrrrrr lllllllllllll jjjjjjjjjjjj ggggggggggggggg', '2022-09-27 02:39:58', '2022-09-27 02:39:58');
INSERT INTO `alamat` VALUES ('11', 'Jl Kebumen', '2022-09-28 16:10:19', '2022-09-28 16:10:19');
INSERT INTO `alamat` VALUES ('12', 'Jl Sukanagara', '2022-09-28 16:08:19', '2022-09-28 16:08:19');
INSERT INTO `bank` VALUES ('1', 'Bank 1', 'AAAAA', '1111111111111111', null, null, null);
INSERT INTO `bank` VALUES ('2', 'Bank 2', 'BBBBBB', '2222222222222222', null, null, null);
INSERT INTO `bankmember` VALUES ('3', '1', 'DDD', 'rer', '32132323', '1', '2022-09-28 14:50:39', '2022-09-28 14:50:39');
INSERT INTO `bankmember` VALUES ('4', '2', 'wqwqw', 'Fen Laen', '323232', '2', '2022-09-28 14:42:16', '2022-09-28 14:42:16');
INSERT INTO `bankmember` VALUES ('6', '1', 'SSS', 'Test', '3242343443243', '1', '2022-09-28 07:53:41', '2022-09-28 07:53:41');
INSERT INTO `contact` VALUES ('1', 'Jalan Soekarno Hatta 10 ', '021-78778323', 'sample@tes.com', null, null);
INSERT INTO `detailorder` VALUES ('11', '6', '2022-09-08', '2022-09-24', '20:03', '20:03', 'PC_php7DE2.png', '', 'TR_php772A.jpg', '0', '5', 'test\r\ntest\r\ntest\r\n1234', '2022-09-24 20:11:22', '2022-09-24 20:11:22');
INSERT INTO `detailorder` VALUES ('12', '36', '2022-09-17', '2022-09-23', '10:21', '10:20', '', '', null, '424222', '2', null, '2022-09-27 10:19:35', '2022-09-27 10:19:35');
INSERT INTO `kategori` VALUES ('1', 'Billboard', '2022-09-20 20:26:09', '2022-09-20 20:26:09');
INSERT INTO `kategori` VALUES ('2', 'Videotron', '2022-09-20 20:46:50', '2022-09-20 20:46:50');
INSERT INTO `keys` VALUES ('1', '1', 'CODEX@123', '0', '0', '0', null, '2018-10-11 13:34:33', null, null);
INSERT INTO `member` VALUES ('1', 'user@data.com', 'user', 'b2482746173ceb70c4fb2cdc9413e3c536993a0959fac198d9e2b963b11092f2d0bed357d34d10b9b5544d40f5cb9fd9ddf4847b0b21621534570a7b04767f59', 'Connect', 'Printing', '2022-09-06', '999999', '0876766767', 'Premiair Groupa', 'dsdsdsdsd', 'KTP_php8E44.jpg', 'NPWP_php59A6.jpg', '1', null, '2022-09-28 16:20:06', '2022-09-28 16:20:06');
INSERT INTO `member` VALUES ('2', 'publish@data.com', '', 'b2482746173ceb70c4fb2cdc9413e3c536993a0959fac198d9e2b963b11092f2d0bed357d34d10b9b5544d40f5cb9fd9ddf4847b0b21621534570a7b04767f59', null, null, '2022-09-01', null, '080808080', 'Pt Pubh', 'Jl. Mempublish', null, 'NPWP_php2D9D.jpg', '2', null, '2022-09-28 16:17:30', '2022-09-28 16:17:30');
INSERT INTO `ordertransaksi` VALUES ('12', '12', '1', '424222', '2022-09-27', '1', '2022-09-28 11:47:01', '2022-09-28 11:47:01');
INSERT INTO `produk` VALUES ('35', '2', '4', '1', null, 'Billboard 1', '12px x 31 px', '12', '31', '2', '2', '200000', 'Billboard Deskripsi', null, 'Jl Jakarta', 'PR_2_php12EE.jpg', 'PR_2_php97CE.jpg', null, '23:29', '17:35', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2022-09-28 16:07:48', '2022-09-28 09:07:48');
INSERT INTO `produk` VALUES ('36', '2', '5', '1', null, 'Billboard 2', '23px x 42 px', '23', '42', '1', '2', '424222', 'billboard 2', null, 'Jl Kebumen', 'PR_2_php12EE.jpg', 'PR_2_php12EE.jpg', null, '23:42', '17:47', '0', '0', null, null, null, null, null, null, null, null, '0', '0', null, null, null, '2022-09-28 16:15:40', '2022-09-28 16:15:40');
INSERT INTO `produk` VALUES ('43', '2', '12', '2', null, 'Billboard 3', '12px x 31 px', '12', '31', '2', '3', '5600000', 'Billboard Test 3', null, 'Jl Sukanagara', 'PR_2_phpEDBF.jpg', 'PR_2_phpEDD0.jpg', null, '09:05', '09:07', '1', '1', '1', '1', null, null, null, null, null, null, null, null, null, null, 'test', '2022-09-28 16:08:19', '2022-09-28 09:08:19');
INSERT INTO `users` VALUES ('1', 'admin', 'b2482746173ceb70c4fb2cdc9413e3c536993a0959fac198d9e2b963b11092f2d0bed357d34d10b9b5544d40f5cb9fd9ddf4847b0b21621534570a7b04767f59', 'admin', null, null, null, null, 'admin', '0', null, '0', '2022-08-08 06:18:56', null);
