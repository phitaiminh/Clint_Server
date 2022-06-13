/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50715
Source Host           : localhost:3306
Source Database       : qlbh

Target Server Type    : MYSQL
Target Server Version : 50715
File Encoding         : 65001

Date: 2016-10-26 15:27:24
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for bophan
-- ----------------------------
DROP TABLE IF EXISTS `bophan`;
CREATE TABLE `bophan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ma` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ten` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `ghichu` longtext COLLATE utf8_unicode_ci,
  `activity` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ma` (`ma`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of bophan
-- ----------------------------
INSERT INTO `bophan` VALUES ('1', 'GD', 'Giám Đốc', 'Giám đốc công ty', '');
INSERT INTO `bophan` VALUES ('2', 'KD', 'Phòng kinh doanh', 'Phòng kinh doanh', '');
INSERT INTO `bophan` VALUES ('3', 'KT', 'Phòng kế toán', 'Phòng kế toán', '');
INSERT INTO `bophan` VALUES ('4', 'KTH', 'Phòng Kỹ Thuật', 'Phòng Kỹ Thuật', '');
INSERT INTO `bophan` VALUES ('22', 'Test', 'tesst', '123', '\0');
INSERT INTO `bophan` VALUES ('26', '1', '1', '1', '\0');
INSERT INTO `bophan` VALUES ('27', '1', 'Nhân sự', 'Bộ phận nhân sự', '');
INSERT INTO `bophan` VALUES ('28', '2', '2', '2', '\0');
INSERT INTO `bophan` VALUES ('29', '2', '2222', '1222222', '\0');
INSERT INTO `bophan` VALUES ('30', 'BH', 'Bộ phận bán hàng', 'Bộ phận bán hàng', '');

-- ----------------------------
-- Table structure for chitietchuyenkho
-- ----------------------------
DROP TABLE IF EXISTS `chitietchuyenkho`;
CREATE TABLE `chitietchuyenkho` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ma` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `soluong` int(11) DEFAULT NULL,
  `dongia` double DEFAULT NULL,
  `thanhtien` double DEFAULT NULL,
  `hanghoaid` int(11) DEFAULT NULL,
  `chuyenkhoid` int(11) DEFAULT NULL,
  `activity` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `chitietck_chuyenkho_fkey` (`chuyenkhoid`),
  KEY `chitietck_hanghoa_fkey` (`hanghoaid`),
  CONSTRAINT `chitietck_chuyenkho_fkey` FOREIGN KEY (`chuyenkhoid`) REFERENCES `chuyenkho` (`id`),
  CONSTRAINT `chitietck_hanghoa_fkey` FOREIGN KEY (`hanghoaid`) REFERENCES `hanghoa` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of chitietchuyenkho
-- ----------------------------

-- ----------------------------
-- Table structure for chitietphieunhap
-- ----------------------------
DROP TABLE IF EXISTS `chitietphieunhap`;
CREATE TABLE `chitietphieunhap` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hanghoaid` int(11) DEFAULT NULL,
  `soluong` int(11) DEFAULT NULL,
  `dongia` double DEFAULT NULL,
  `thanhtien` double DEFAULT NULL,
  `ghichu` longtext COLLATE utf8_unicode_ci,
  `phieunhapid` int(11) DEFAULT NULL,
  `activity` bit(1) DEFAULT NULL,
  `ma` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `chitietphieunhap_hanghoa_fkey` (`hanghoaid`),
  KEY `chitietphieunhap_phieunhap_fkey` (`phieunhapid`),
  CONSTRAINT `chitietphieunhap_hanghoa_fkey` FOREIGN KEY (`hanghoaid`) REFERENCES `hanghoa` (`id`),
  CONSTRAINT `chitietphieunhap_phieunhap_fkey` FOREIGN KEY (`phieunhapid`) REFERENCES `phieunhap` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of chitietphieunhap
-- ----------------------------

-- ----------------------------
-- Table structure for chitietphieuxuat
-- ----------------------------
DROP TABLE IF EXISTS `chitietphieuxuat`;
CREATE TABLE `chitietphieuxuat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ma` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hanghoaid` int(11) DEFAULT NULL,
  `phieuxuatid` int(11) DEFAULT NULL,
  `soluong` int(11) DEFAULT NULL,
  `dongia` double DEFAULT NULL,
  `thanhtien` double DEFAULT NULL,
  `activity` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `chitietphieuxuat_hanghoa_fkey` (`hanghoaid`),
  KEY `chitietphieuxuat_phieuxuat_fkey` (`phieuxuatid`),
  CONSTRAINT `chitietphieuxuat_hanghoa_fkey` FOREIGN KEY (`hanghoaid`) REFERENCES `hanghoa` (`id`),
  CONSTRAINT `chitietphieuxuat_phieuxuat_fkey` FOREIGN KEY (`phieuxuatid`) REFERENCES `phieuxuat` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of chitietphieuxuat
-- ----------------------------

-- ----------------------------
-- Table structure for chuyenkho
-- ----------------------------
DROP TABLE IF EXISTS `chuyenkho`;
CREATE TABLE `chuyenkho` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `khochuyenid` int(11) DEFAULT NULL,
  `khonhanid` int(11) DEFAULT NULL,
  `nguoichuyenid` int(11) DEFAULT NULL,
  `nguoinhanid` int(11) DEFAULT NULL,
  `ghichu` text COLLATE utf8_unicode_ci,
  `ma` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phieuchuyentay` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ngay` date DEFAULT NULL,
  `activity` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `chuyenkho_nhanvienchuyen_fkey` (`nguoichuyenid`),
  KEY `chuyenkho_nhanviennhan_fkey` (`nguoinhanid`),
  KEY `chuyenkho_khochuyen_id` (`khochuyenid`),
  KEY `chuyenkho_khonhan_fkey` (`khonhanid`),
  CONSTRAINT `chuyenkho_khochuyen_id` FOREIGN KEY (`khochuyenid`) REFERENCES `khohang` (`id`),
  CONSTRAINT `chuyenkho_khonhan_fkey` FOREIGN KEY (`khonhanid`) REFERENCES `khohang` (`id`),
  CONSTRAINT `chuyenkho_nhanvienchuyen_fkey` FOREIGN KEY (`nguoichuyenid`) REFERENCES `nhanvien` (`id`),
  CONSTRAINT `chuyenkho_nhanviennhan_fkey` FOREIGN KEY (`nguoinhanid`) REFERENCES `nhanvien` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of chuyenkho
-- ----------------------------

-- ----------------------------
-- Table structure for congty
-- ----------------------------
DROP TABLE IF EXISTS `congty`;
CREATE TABLE `congty` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ma` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `ten` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `diachi` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `masothue` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `tel` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `fax` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `website` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `logo` text COLLATE utf8_unicode_ci,
  `activity` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of congty
-- ----------------------------

-- ----------------------------
-- Table structure for donvitinh
-- ----------------------------
DROP TABLE IF EXISTS `donvitinh`;
CREATE TABLE `donvitinh` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ma` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ten` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `ghichu` longtext COLLATE utf8_unicode_ci,
  `activity` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of donvitinh
-- ----------------------------
INSERT INTO `donvitinh` VALUES ('1', 'KG', 'kilogam', 'Kilogam', '\0');

-- ----------------------------
-- Table structure for hanghoa
-- ----------------------------
DROP TABLE IF EXISTS `hanghoa`;
CREATE TABLE `hanghoa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ma` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `khohangid` int(11) DEFAULT NULL,
  `nhomhangid` int(11) DEFAULT NULL,
  `loaihangid` int(11) DEFAULT NULL,
  `nhaccid` int(11) DEFAULT NULL,
  `ten` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `donviid` int(11) DEFAULT NULL,
  `xuatxu` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `giamua` double DEFAULT NULL,
  `giabanle` double DEFAULT NULL,
  `giabansi` double DEFAULT NULL,
  `tonkho` int(11) DEFAULT NULL,
  `anh` text COLLATE utf8_unicode_ci,
  `activity` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `hanghoa_khohang_fkey` (`khohangid`),
  KEY `hanghoa_nhomhang_fkey` (`nhomhangid`),
  KEY `hanghoa_loaihang_fkey` (`loaihangid`),
  KEY `hanghoa_nhacungcap_fkey` (`nhaccid`),
  KEY `hanghoa_donvi_fkey` (`donviid`),
  CONSTRAINT `hanghoa_donvi_fkey` FOREIGN KEY (`donviid`) REFERENCES `donvitinh` (`id`),
  CONSTRAINT `hanghoa_khohang_fkey` FOREIGN KEY (`khohangid`) REFERENCES `khohang` (`id`),
  CONSTRAINT `hanghoa_loaihang_fkey` FOREIGN KEY (`loaihangid`) REFERENCES `loaihang` (`id`),
  CONSTRAINT `hanghoa_nhacungcap_fkey` FOREIGN KEY (`nhaccid`) REFERENCES `nhacungcap` (`id`),
  CONSTRAINT `hanghoa_nhomhang_fkey` FOREIGN KEY (`nhomhangid`) REFERENCES `nhomhanghoa` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of hanghoa
-- ----------------------------

-- ----------------------------
-- Table structure for keeplogged
-- ----------------------------
DROP TABLE IF EXISTS `keeplogged`;
CREATE TABLE `keeplogged` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pass` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `activity` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of keeplogged
-- ----------------------------
INSERT INTO `keeplogged` VALUES ('10', 'ntttue', '1111', '');

-- ----------------------------
-- Table structure for khachhang
-- ----------------------------
DROP TABLE IF EXISTS `khachhang`;
CREATE TABLE `khachhang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ma` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `makh` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `loaikhid` int(11) DEFAULT NULL,
  `khuvucid` int(11) DEFAULT NULL,
  `ten` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `diachi` longtext COLLATE utf8_unicode_ci,
  `masothue` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `dienthoai` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `taikhoan` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `nganhang` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `gioihanno` decimal(30,10) DEFAULT NULL,
  `nohientai` decimal(30,10) DEFAULT NULL,
  `yahoo` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `skype` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `nguoilienhe` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `activity` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `khachang_loaikh_fkey` (`loaikhid`),
  KEY `khachhang_khuvuc_fkey` (`khuvucid`),
  CONSTRAINT `khachang_loaikh_fkey` FOREIGN KEY (`loaikhid`) REFERENCES `loaikhachhang` (`id`),
  CONSTRAINT `khachhang_khuvuc_fkey` FOREIGN KEY (`khuvucid`) REFERENCES `khuvuc` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of khachhang
-- ----------------------------
INSERT INTO `khachhang` VALUES ('1', 'NV0001', null, null, null, 'ntttue', '391 Trần Phú', null, '01699952101', 'ntttue.gl@gmail.com', null, null, null, null, null, null, null, '');
INSERT INTO `khachhang` VALUES ('2', '1', null, null, null, '1', '', null, '', '', null, null, null, null, null, null, null, '');

-- ----------------------------
-- Table structure for khohang
-- ----------------------------
DROP TABLE IF EXISTS `khohang`;
CREATE TABLE `khohang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ma` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ten` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `nguoiqlid` int(11) DEFAULT NULL,
  `nguoilienhe` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `diachi` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `dienthoai` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `fax` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `diengiai` longtext COLLATE utf8_unicode_ci,
  `activity` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `khohang_nhanvien_fkey` (`nguoiqlid`),
  CONSTRAINT `khohang_nhanvien_fkey` FOREIGN KEY (`nguoiqlid`) REFERENCES `nhanvien` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of khohang
-- ----------------------------

-- ----------------------------
-- Table structure for khuvuc
-- ----------------------------
DROP TABLE IF EXISTS `khuvuc`;
CREATE TABLE `khuvuc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ma` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ten` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `ghichu` longtext COLLATE utf8_unicode_ci,
  `activity` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ma` (`ma`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of khuvuc
-- ----------------------------

-- ----------------------------
-- Table structure for loaihang
-- ----------------------------
DROP TABLE IF EXISTS `loaihang`;
CREATE TABLE `loaihang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ma` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ghichu` text COLLATE utf8_unicode_ci,
  `ten` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `activity` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of loaihang
-- ----------------------------

-- ----------------------------
-- Table structure for loaikhachhang
-- ----------------------------
DROP TABLE IF EXISTS `loaikhachhang`;
CREATE TABLE `loaikhachhang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ma` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ten` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `mota` longtext COLLATE utf8_unicode_ci,
  `activity` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ma` (`ma`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of loaikhachhang
-- ----------------------------

-- ----------------------------
-- Table structure for nguoidung
-- ----------------------------
DROP TABLE IF EXISTS `nguoidung`;
CREATE TABLE `nguoidung` (
  `mand` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tennd` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `matkhau` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `roleid` int(11) DEFAULT NULL,
  `nhanvienid` int(11) DEFAULT NULL,
  `diengiai` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `activity` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `nguoidung_vaitro_fkey` (`roleid`),
  KEY `nguoidung_nhanvien_fkey` (`nhanvienid`),
  CONSTRAINT `nguoidung_nhanvien_fkey` FOREIGN KEY (`nhanvienid`) REFERENCES `nhanvien` (`id`),
  CONSTRAINT `nguoidung_quyen_fkey` FOREIGN KEY (`roleid`) REFERENCES `quyen` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of nguoidung
-- ----------------------------
INSERT INTO `nguoidung` VALUES ('ND0001', '2', '1', '1', '1', '3', null, '');
INSERT INTO `nguoidung` VALUES ('ND0002', '3', 'ntttue', '1111', '1', '5', null, '');

-- ----------------------------
-- Table structure for nhacungcap
-- ----------------------------
DROP TABLE IF EXISTS `nhacungcap`;
CREATE TABLE `nhacungcap` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ma` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `khuvucid` int(11) DEFAULT NULL,
  `ten` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `diachi` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `masothue` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `fax` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `tel` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `website` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `taikhoan` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `nganhang` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `manguoilienhe` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `chucvu` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `activity` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `nhacungcap_khuvuc_fkey` (`khuvucid`),
  CONSTRAINT `nhacungcap_khuvuc_fkey` FOREIGN KEY (`khuvucid`) REFERENCES `khuvuc` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of nhacungcap
-- ----------------------------

-- ----------------------------
-- Table structure for nhanvien
-- ----------------------------
DROP TABLE IF EXISTS `nhanvien`;
CREATE TABLE `nhanvien` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Ma` varchar(20) COLLATE utf8_vietnamese_ci NOT NULL,
  `Ten` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `DiaChi` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `GioiTinh` bit(1) DEFAULT NULL,
  `ChucVu` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `Email` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `DienThoai` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `BoPhanId` int(11) DEFAULT NULL,
  `NguoiQuanLyID` int(11) DEFAULT NULL,
  `Luong` double(65,0) DEFAULT NULL,
  `activity` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `nhanvien_bophan_fkey` (`BoPhanId`),
  KEY `NguoiQuanLyID` (`NguoiQuanLyID`),
  CONSTRAINT `nhanvien_bophan_fkey` FOREIGN KEY (`BoPhanId`) REFERENCES `bophan` (`id`),
  CONSTRAINT `nhanvien_nhanvienql_fkey` FOREIGN KEY (`NguoiQuanLyID`) REFERENCES `nhanvien` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- ----------------------------
-- Records of nhanvien
-- ----------------------------
INSERT INTO `nhanvien` VALUES ('3', '1', 'Nguyễn Thị Trí Tuệ', '391 trần phú', '\0', 'Tổng giám đốc', 'ntttue.gl@gmail.com', '01699952101', '1', '9', '20000000', '');
INSERT INTO `nhanvien` VALUES ('4', 'ntttue', 'ntttue', '392 NVC', '', 'Phó Tổng giám đốc', 'ntttue.gl@gmail.com', '01699952101', '1', '3', '20000000', '\0');
INSERT INTO `nhanvien` VALUES ('5', 'NV01', 'Trần văn Trãi', '', '', '', 'ntttue.gl@gmail.com', '', '1', '3', '0', '');
INSERT INTO `nhanvien` VALUES ('6', 'NV02', 'Nguyễn Thanh Nhàn', '', '', '', 'ntnhan@gmail.com', '', '1', null, '0', '');
INSERT INTO `nhanvien` VALUES ('7', 'NV03', 'Phạm Chung Tú', '', '', '', 'pctu@gmail.com', '1699952101', '1', null, '0', '');
INSERT INTO `nhanvien` VALUES ('8', 'NV04', 'Hồ Tuấn Thanh', '', '', '', '', '', '1', '3', '50000000', '');
INSERT INTO `nhanvien` VALUES ('9', 'NV05', 'Lê Ngọc Thành', '', '', '', '', '01699952101', '1', null, '0', '');
INSERT INTO `nhanvien` VALUES ('10', 'NV06', 'Trần Trung Kiên', '', '', '', 'ttkien@gmail.com', '01699952101', '1', null, '20000', '');
INSERT INTO `nhanvien` VALUES ('11', 'NV07', 'Lê Ngọc Sơn', '', '', '', 'lnson@gmail.com', '01699952101', '1', null, '100000', '');
INSERT INTO `nhanvien` VALUES ('12', 'NV08', 'Lương Vĩ Minh', '', '', '', '', '', '1', null, '40000000', '');
INSERT INTO `nhanvien` VALUES ('13', 'NV09', 'Trần Đang Thư', '227 Nguyễn Văn Cừ', '\0', 'Kế toán trưởng', 'tdthu@gmail.com', '01699952101', '3', '3', '100000000', '');
INSERT INTO `nhanvien` VALUES ('14', 'NV010', 'Lâm Như Quỳnh', '227 Nguyễn Văn Cừ', '\0', 'Thư ký', 'lnquyanh@gmail.com', '01699952101', '3', '3', '20000000', '');
INSERT INTO `nhanvien` VALUES ('15', 'NV11', 'Lâm Tâm Như', '227 Nguyễn Văn Cừ', '\0', 'Nhân viên bán hàng', 'ltnhu@gmail.com', '01699952101', '2', '3', '200000000', '');
INSERT INTO `nhanvien` VALUES ('16', 'NV012', 'Triệu Vi', '227 Nguyễn Văn Cừ', '\0', 'nhân viên bán hàng', 'tvi@gmail.com', '01699952101', '2', '3', '20000000', '');
INSERT INTO `nhanvien` VALUES ('17', 'NV013', 'Hồ Trung Dũng', '227 Nguyễn Văn Cừ', '', 'Nhân viên ', 'htdung@gmail.com', '01699952101', '2', '3', '2000000', '');
INSERT INTO `nhanvien` VALUES ('18', 'NV014', 'Đàm Vĩnh Hưng', '', '', '', '', '', '1', null, '0', '');
INSERT INTO `nhanvien` VALUES ('19', 'NV015', 'Mỹ Tâm', '', '\0', '', '', '', '2', '3', '0', '');
INSERT INTO `nhanvien` VALUES ('20', 'NV016', 'Lê Cát Trọng Lý', '', '\0', '', '', '', '2', '3', '0', '');
INSERT INTO `nhanvien` VALUES ('22', 'test1', 'test1', '', '', '', '', '', '1', '3', '0', '');

-- ----------------------------
-- Table structure for nhatky
-- ----------------------------
DROP TABLE IF EXISTS `nhatky`;
CREATE TABLE `nhatky` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nguoidung` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bang` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hanhdong` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ngay` datetime DEFAULT NULL,
  `activity` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of nhatky
-- ----------------------------
INSERT INTO `nhatky` VALUES ('38', 'ND0002 - ntttue', 'Người dùng', 'Đăng nhập', '2016-10-26 02:08:29', '');
INSERT INTO `nhatky` VALUES ('39', 'ND0002 - ntttue', 'Bộ phận công ty', 'Xóa', '2016-10-26 02:08:37', '');
INSERT INTO `nhatky` VALUES ('40', 'ND0002 - ntttue', 'Người dùng', 'Đăng nhập', '2016-10-26 02:11:05', '');
INSERT INTO `nhatky` VALUES ('41', 'ND0002 - ntttue', 'Đơn vị tính', 'Thêm', '2016-10-26 02:11:24', '');
INSERT INTO `nhatky` VALUES ('42', 'ND0002 - ntttue', 'Đơn vị tính', 'Cập nhật', '2016-10-26 02:11:45', '');
INSERT INTO `nhatky` VALUES ('43', 'ND0002 - ntttue', 'Đơn vị tính', 'Xóa', '2016-10-26 02:12:12', '');
INSERT INTO `nhatky` VALUES ('44', 'ND0002 - ntttue', 'Người dùng', 'Đăng nhập', '2016-10-26 02:31:32', '');
INSERT INTO `nhatky` VALUES ('45', 'ND0002 - ntttue', 'Người dùng', 'Đăng nhập', '2016-10-26 03:21:40', '');
INSERT INTO `nhatky` VALUES ('46', 'ND0002 - ntttue', 'Người dùng', 'Đăng nhập', '2016-10-26 03:23:11', '');
INSERT INTO `nhatky` VALUES ('47', 'ND0002 - ntttue', 'Người dùng', 'Đăng nhập', '2016-10-26 03:23:24', '');
INSERT INTO `nhatky` VALUES ('48', 'ND0002 - ntttue', 'Người dùng', 'Đăng nhập', '2016-10-26 03:26:23', '');
INSERT INTO `nhatky` VALUES ('49', 'ND0002 - ntttue', 'Người dùng', 'Đăng nhập', '2016-10-26 03:27:59', '');
INSERT INTO `nhatky` VALUES ('50', 'ND0002 - ntttue', 'Người dùng', 'Đăng nhập', '2016-10-26 03:32:08', '');
INSERT INTO `nhatky` VALUES ('51', 'ND0002 - ntttue', 'Người dùng', 'Đăng nhập', '2016-10-26 03:35:07', '');
INSERT INTO `nhatky` VALUES ('52', 'ND0002 - ntttue', 'Người dùng', 'Đăng nhập', '2016-10-26 03:39:28', '');
INSERT INTO `nhatky` VALUES ('53', 'ND0002 - ntttue', 'Người dùng', 'Đăng nhập', '2016-10-26 03:40:09', '');
INSERT INTO `nhatky` VALUES ('54', 'ND0002 - ntttue', 'Người dùng', 'Đăng nhập', '2016-10-26 03:40:24', '');
INSERT INTO `nhatky` VALUES ('55', 'ND0002 - ntttue', 'Người dùng', 'Đăng nhập', '2016-10-26 03:41:12', '');
INSERT INTO `nhatky` VALUES ('56', 'ND0002 - ntttue', 'Người dùng', 'Đăng nhập', '2016-10-26 03:45:08', '');
INSERT INTO `nhatky` VALUES ('57', 'ND0002 - ntttue', 'Người dùng', 'Đăng nhập', '2016-10-26 03:47:02', '');
INSERT INTO `nhatky` VALUES ('58', 'ND0002 - ntttue', 'Người dùng', 'Đăng nhập', '2016-10-26 03:47:49', '');
INSERT INTO `nhatky` VALUES ('59', 'ND0002 - ntttue', 'Người dùng', 'Đăng nhập', '2016-10-26 03:49:25', '');
INSERT INTO `nhatky` VALUES ('60', 'ND0002 - ntttue', 'Người dùng', 'Đăng nhập', '2016-10-26 03:50:28', '');
INSERT INTO `nhatky` VALUES ('61', 'ND0002 - ntttue', 'Người dùng', 'Đăng nhập', '2016-10-26 03:52:35', '');
INSERT INTO `nhatky` VALUES ('62', 'ND0002 - ntttue', 'Người dùng', 'Đăng nhập', '2016-10-26 03:53:25', '');
INSERT INTO `nhatky` VALUES ('63', 'ND0002 - ntttue', 'Người dùng', 'Đăng nhập', '2016-10-26 03:55:17', '');
INSERT INTO `nhatky` VALUES ('64', 'ND0002 - ntttue', 'Người dùng', 'Đăng nhập', '2016-10-26 03:55:46', '');
INSERT INTO `nhatky` VALUES ('65', 'ND0002 - ntttue', 'Người dùng', 'Đăng nhập', '2016-10-26 03:56:16', '');
INSERT INTO `nhatky` VALUES ('66', 'ND0002 - ntttue', 'Người dùng', 'Đăng nhập', '2016-10-26 03:59:03', '');
INSERT INTO `nhatky` VALUES ('67', 'ND0002 - ntttue', 'Người dùng', 'Đăng nhập', '2016-10-26 09:03:50', '');
INSERT INTO `nhatky` VALUES ('68', 'ND0002 - ntttue', 'Người dùng', 'Đăng nhập', '2016-10-26 09:17:21', '');
INSERT INTO `nhatky` VALUES ('69', 'ND0002 - ntttue', 'Người dùng', 'Đăng nhập', '2016-10-26 09:19:15', '');
INSERT INTO `nhatky` VALUES ('70', 'ND0002 - ntttue', 'Người dùng', 'Đăng nhập', '2016-10-26 09:26:40', '');
INSERT INTO `nhatky` VALUES ('71', 'ND0002 - ntttue', 'Người dùng', 'Đăng nhập', '2016-10-26 09:33:43', '');
INSERT INTO `nhatky` VALUES ('72', 'ND0002 - ntttue', 'Người dùng', 'Đăng nhập', '2016-10-26 09:34:29', '');
INSERT INTO `nhatky` VALUES ('73', 'ND0002 - ntttue', 'Người dùng', 'Đăng nhập', '2016-10-26 09:37:16', '');
INSERT INTO `nhatky` VALUES ('74', 'ND0002 - ntttue', 'Người dùng', 'Đăng nhập', '2016-10-26 09:37:38', '');
INSERT INTO `nhatky` VALUES ('75', 'ND0002 - ntttue', 'Người dùng', 'Đăng nhập', '2016-10-26 14:55:49', '');
INSERT INTO `nhatky` VALUES ('76', 'ND0002 - ntttue', 'Người dùng', 'Đăng nhập', '2016-10-26 14:59:59', '');
INSERT INTO `nhatky` VALUES ('77', 'ND0002 - ntttue', 'Người dùng', 'Đăng nhập', '2016-10-26 15:12:42', '');
INSERT INTO `nhatky` VALUES ('78', 'ND0002 - ntttue', 'Người dùng', 'Đăng nhập', '2016-10-26 15:19:35', '');
INSERT INTO `nhatky` VALUES ('79', 'ND0002 - ntttue', 'Người dùng', 'Đăng nhập', '2016-10-26 15:22:05', '');
INSERT INTO `nhatky` VALUES ('80', 'ND0002 - ntttue', 'Người dùng', 'Cập nhật', '2016-10-26 15:22:46', '');
INSERT INTO `nhatky` VALUES ('81', 'ND0002 - ntttue', 'Người dùng', 'Đăng nhập', '2016-10-26 15:23:05', '');
INSERT INTO `nhatky` VALUES ('82', 'ND0002 - ntttue', 'Người dùng', 'Đăng nhập', '2016-10-26 15:26:26', '');

-- ----------------------------
-- Table structure for nhomhanghoa
-- ----------------------------
DROP TABLE IF EXISTS `nhomhanghoa`;
CREATE TABLE `nhomhanghoa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ma` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ten` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `ghichu` longtext COLLATE utf8_unicode_ci,
  `activity` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of nhomhanghoa
-- ----------------------------

-- ----------------------------
-- Table structure for phieunhap
-- ----------------------------
DROP TABLE IF EXISTS `phieunhap`;
CREATE TABLE `phieunhap` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ma` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nhaccid` int(11) DEFAULT NULL,
  `nhanviennhapid` int(11) DEFAULT NULL,
  `khoid` int(11) DEFAULT NULL,
  `dienthoai` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `diachi` text COLLATE utf8_unicode_ci,
  `ngaynhap` date DEFAULT NULL,
  `ghichu` text COLLATE utf8_unicode_ci,
  `tongtien` double DEFAULT NULL,
  `activity` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `phieunhap_nhacungcap_fkey` (`nhaccid`),
  KEY `phieunhap_nhanvien_fkey` (`nhanviennhapid`),
  KEY `phieunhap_khohang_fkey` (`khoid`),
  CONSTRAINT `phieunhap_khohang_fkey` FOREIGN KEY (`khoid`) REFERENCES `khohang` (`id`),
  CONSTRAINT `phieunhap_nhacungcap_fkey` FOREIGN KEY (`nhaccid`) REFERENCES `nhacungcap` (`id`),
  CONSTRAINT `phieunhap_nhanvien_fkey` FOREIGN KEY (`nhanviennhapid`) REFERENCES `nhanvien` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of phieunhap
-- ----------------------------

-- ----------------------------
-- Table structure for phieuxuat
-- ----------------------------
DROP TABLE IF EXISTS `phieuxuat`;
CREATE TABLE `phieuxuat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ma` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `diachi` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `khoid` int(11) DEFAULT NULL,
  `ngaygiao` date DEFAULT NULL,
  `nhanvienbanhangid` int(11) DEFAULT NULL,
  `ngaylap` date DEFAULT NULL,
  `khachhangid` int(11) DEFAULT NULL,
  `dienthoai` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tongtien` double DEFAULT NULL,
  `ghichu` text COLLATE utf8_unicode_ci,
  `activity` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `phieuxuat_khohang_fkey` (`khoid`),
  KEY `phieuxuat_nhanvien_fkey` (`nhanvienbanhangid`),
  KEY `phieuxuat_khachhang_fkey` (`khachhangid`),
  CONSTRAINT `phieuxuat_khachhang_fkey` FOREIGN KEY (`khachhangid`) REFERENCES `khachhang` (`id`),
  CONSTRAINT `phieuxuat_khohang_fkey` FOREIGN KEY (`khoid`) REFERENCES `khohang` (`id`),
  CONSTRAINT `phieuxuat_nhanvien_fkey` FOREIGN KEY (`nhanvienbanhangid`) REFERENCES `nhanvien` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of phieuxuat
-- ----------------------------

-- ----------------------------
-- Table structure for quyen
-- ----------------------------
DROP TABLE IF EXISTS `quyen`;
CREATE TABLE `quyen` (
  `id` int(11) NOT NULL,
  `ten` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `diengiai` longtext COLLATE utf8_unicode_ci,
  `activity` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of quyen
-- ----------------------------
INSERT INTO `quyen` VALUES ('1', 'admin', 'full quyền', '');
INSERT INTO `quyen` VALUES ('2', 'quanly', null, '');
INSERT INTO `quyen` VALUES ('3', 'nhanvien', null, '');

-- ----------------------------
-- Table structure for tygia
-- ----------------------------
DROP TABLE IF EXISTS `tygia`;
CREATE TABLE `tygia` (
  `ma` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ten` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `tygiaquydoi` float DEFAULT NULL,
  `activity` bit(1) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tygia
-- ----------------------------

-- ----------------------------
-- Table structure for vaitro
-- ----------------------------
DROP TABLE IF EXISTS `vaitro`;
CREATE TABLE `vaitro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ma` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ten` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `diengiai` longtext COLLATE utf8_unicode_ci,
  `vaitrochaid` int(11) DEFAULT NULL,
  `truycap` bit(1) DEFAULT NULL,
  `them` bit(1) DEFAULT NULL,
  `xem` bit(1) DEFAULT NULL,
  `xoa` bit(1) DEFAULT NULL,
  `sua` bit(1) DEFAULT NULL,
  `in` bit(1) DEFAULT NULL,
  `nhap` bit(1) DEFAULT NULL,
  `xuat` bit(1) DEFAULT NULL,
  `activity` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ma` (`ma`),
  KEY `vaitro_vaitro_fkey` (`vaitrochaid`),
  CONSTRAINT `vaitro_vaitro_fkey` FOREIGN KEY (`vaitrochaid`) REFERENCES `vaitro` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of vaitro
-- ----------------------------
