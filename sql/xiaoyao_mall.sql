/*
 Navicat Premium Data Transfer

 Source Server         : uat
 Source Server Type    : MySQL
 Source Server Version : 50718 (5.7.18-20170830-log)
 Source Host           : cdb-9dv88oee.bj.tencentcdb.com:10145
 Source Schema         : xiaoyao_mall

 Target Server Type    : MySQL
 Target Server Version : 50718 (5.7.18-20170830-log)
 File Encoding         : 65001

 Date: 20/04/2023 22:17:46
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for member_info
-- ----------------------------
DROP TABLE IF EXISTS `member_info`;
CREATE TABLE `member_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(32) NOT NULL COMMENT '名称',
  `phone` varchar(32) DEFAULT NULL COMMENT '手机号',
  `password` varchar(32) DEFAULT NULL COMMENT '密码',
  `balance` decimal(10,2) DEFAULT '0.00' COMMENT '余额',
  `integral` decimal(10,0) DEFAULT '0' COMMENT '积分',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `version` int(11) DEFAULT '1',
  `modified_by` int(11) DEFAULT NULL COMMENT '修改人',
  `modified_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_by` int(11) DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `is_deleted` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员';

-- ----------------------------
-- Records of member_info
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for order_info
-- ----------------------------
DROP TABLE IF EXISTS `order_info`;
CREATE TABLE `order_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_sn` varchar(64) DEFAULT NULL COMMENT '下单编号',
  `member_id` int(11) DEFAULT NULL COMMENT '用户',
  `member_name` varchar(32) DEFAULT NULL COMMENT '购买人姓名',
  `payment_method` tinyint(4) DEFAULT '4' COMMENT '付款方式(0:账户余额/balance-1:现金/cash-2:支付宝/alipay-3:微信/wechat-4:未支付/notPay)',
  `payment_method_name` varchar(32) DEFAULT NULL COMMENT '付款方式翻译',
  `order_price` decimal(10,2) DEFAULT '0.00' COMMENT '订单金额',
  `fee_price` decimal(10,2) DEFAULT '0.00' COMMENT '优惠金额',
  `pay_price` decimal(10,2) DEFAULT '0.00' COMMENT '支付金额',
  `profit_price` decimal(10,2) DEFAULT '0.00' COMMENT '商品利润',
  `pay_time` datetime DEFAULT NULL COMMENT '支付时间',
  `status` tinyint(4) DEFAULT '0' COMMENT '状态(0:已完成/complete-1:赊账/arrears-2:退货/refund-3:待支付/unpaid-4:已取消/cancel-5:待发货/wait-6:待收货/gather-7:待评价/evaluate-8:退货中/refund_ing)',
  `status_name` varchar(32) DEFAULT NULL COMMENT '状态翻译',
  `address_name` varchar(32) DEFAULT NULL COMMENT '收货人姓名',
  `address_mobile` varchar(32) DEFAULT NULL COMMENT '收货人手机号',
  `province_id` int(11) DEFAULT NULL COMMENT '省',
  `province_name` varchar(32) DEFAULT NULL COMMENT '省翻译',
  `city_id` int(11) DEFAULT NULL COMMENT '市',
  `city_name` varchar(32) DEFAULT NULL COMMENT '市翻译',
  `area_id` int(11) DEFAULT NULL COMMENT '区',
  `area_name` varchar(32) DEFAULT NULL COMMENT '区翻译',
  `detailed_address` varchar(255) DEFAULT NULL COMMENT '详细地址',
  `point` int(11) DEFAULT '0' COMMENT '订单积分',
  `invoice_title` varchar(100) DEFAULT NULL COMMENT '发票抬头',
  `origin` int(11) DEFAULT '0' COMMENT '订单来源(0:微信/wechat-1:线下/scene)',
  `origin_name` varchar(32) DEFAULT NULL COMMENT '订单来源翻译',
  `delivery_type` int(11) DEFAULT '0' COMMENT '配送方式(0:快递/express-1:虚拟发货/virtual-2:商家配送/distribution)',
  `delivery_name` varchar(32) DEFAULT NULL COMMENT '配送方式翻译',
  `express_code` varchar(32) DEFAULT NULL COMMENT '快递公司代码',
  `express_name` varchar(32) DEFAULT NULL COMMENT '快递公司名称',
  `express_no` varchar(64) DEFAULT NULL COMMENT '快递单号',
  `distribution_name` varchar(32) DEFAULT NULL COMMENT '配送人姓名',
  `distribution_phone` varchar(32) DEFAULT NULL COMMENT '配送人联系方式',
  `deliver_time` datetime DEFAULT NULL COMMENT '发货时间',
  `confirm_gather_time` datetime DEFAULT NULL COMMENT '确认收货时间',
  `evaluate_time` datetime DEFAULT NULL COMMENT '评价时间',
  `sponsor_refund_time` datetime DEFAULT NULL COMMENT '发起退货时间',
  `refund_time` datetime DEFAULT NULL COMMENT '确认退货时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `modified_by` int(11) DEFAULT NULL COMMENT '修改人',
  `modified_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_by` int(11) DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `is_deleted` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单信息';

-- ----------------------------
-- Records of order_info
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for order_product_sku
-- ----------------------------
DROP TABLE IF EXISTS `order_product_sku`;
CREATE TABLE `order_product_sku` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `member_id` int(11) DEFAULT NULL COMMENT '用户',
  `member_name` varchar(32) DEFAULT NULL COMMENT '购买人姓名',
  `order_id` int(11) DEFAULT NULL COMMENT '订单详情表id',
  `order_sn` varchar(64) DEFAULT NULL COMMENT '下单编号',
  `product_id` int(11) DEFAULT NULL COMMENT '商品id',
  `product_name` varchar(128) DEFAULT NULL COMMENT '商品',
  `sku_id` int(11) DEFAULT NULL COMMENT '规格id',
  `sku_title` varchar(128) DEFAULT NULL COMMENT '规格',
  `sku_img_url` varchar(128) DEFAULT NULL COMMENT '规格图片',
  `product_prop` varchar(2048) DEFAULT NULL COMMENT '规格的属性',
  `buy_cnt` int(11) DEFAULT '1' COMMENT '购买数量',
  `in_price` decimal(10,2) DEFAULT '0.00' COMMENT '商品进价',
  `out_price` decimal(10,2) DEFAULT '0.00' COMMENT '商品售价',
  `profit_price` decimal(10,2) DEFAULT '0.00' COMMENT '商品利润',
  `total_price` decimal(10,2) DEFAULT '0.00' COMMENT '商品总价',
  `modified_by` int(11) DEFAULT NULL COMMENT '修改人',
  `modified_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_by` int(11) DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `is_deleted` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单详情';

-- ----------------------------
-- Records of order_product_sku
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for product_attr_info
-- ----------------------------
DROP TABLE IF EXISTS `product_attr_info`;
CREATE TABLE `product_attr_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `product_id` int(11) DEFAULT NULL COMMENT '商品',
  `attr_name` varchar(32) DEFAULT NULL COMMENT '属性名',
  `modified_by` int(11) DEFAULT NULL COMMENT '修改人',
  `modified_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_by` int(11) DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `is_deleted` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='商品的属性值';

-- ----------------------------
-- Records of product_attr_info
-- ----------------------------
BEGIN;
INSERT INTO `product_attr_info` (`id`, `product_id`, `attr_name`, `modified_by`, `modified_time`, `create_by`, `create_time`, `is_deleted`) VALUES (1, 1, '颜色', NULL, '2023-04-20 21:45:23', NULL, '2023-04-20 21:45:23', 0);
INSERT INTO `product_attr_info` (`id`, `product_id`, `attr_name`, `modified_by`, `modified_time`, `create_by`, `create_time`, `is_deleted`) VALUES (2, 1, '内存', NULL, '2023-04-20 21:45:27', NULL, '2023-04-20 21:45:27', 0);
COMMIT;

-- ----------------------------
-- Table structure for product_brand_info
-- ----------------------------
DROP TABLE IF EXISTS `product_brand_info`;
CREATE TABLE `product_brand_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `brand_name` varchar(64) DEFAULT NULL COMMENT '品牌名',
  `img_url` varchar(128) DEFAULT NULL COMMENT '图片',
  `modified_by` int(11) DEFAULT NULL COMMENT '修改人',
  `modified_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_by` int(11) DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `is_deleted` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='品牌';

-- ----------------------------
-- Records of product_brand_info
-- ----------------------------
BEGIN;
INSERT INTO `product_brand_info` (`id`, `brand_name`, `img_url`, `modified_by`, `modified_time`, `create_by`, `create_time`, `is_deleted`) VALUES (1, '苹果', NULL, NULL, '2023-04-20 21:37:38', NULL, '2023-04-20 21:37:38', 0);
COMMIT;

-- ----------------------------
-- Table structure for product_category_info
-- ----------------------------
DROP TABLE IF EXISTS `product_category_info`;
CREATE TABLE `product_category_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `parent_id` int(11) DEFAULT '0' COMMENT '父级id',
  `category_name` varchar(32) DEFAULT NULL COMMENT '类型名称',
  `modified_by` int(11) DEFAULT NULL COMMENT '修改人',
  `modified_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_by` int(11) DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `is_deleted` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='商品类型';

-- ----------------------------
-- Records of product_category_info
-- ----------------------------
BEGIN;
INSERT INTO `product_category_info` (`id`, `parent_id`, `category_name`, `modified_by`, `modified_time`, `create_by`, `create_time`, `is_deleted`) VALUES (1, 0, '食品', NULL, '2023-04-20 21:35:01', NULL, '2023-04-20 21:35:01', 0);
INSERT INTO `product_category_info` (`id`, `parent_id`, `category_name`, `modified_by`, `modified_time`, `create_by`, `create_time`, `is_deleted`) VALUES (2, 1, '零食', NULL, '2023-04-20 21:35:15', NULL, '2023-04-20 21:35:09', 0);
INSERT INTO `product_category_info` (`id`, `parent_id`, `category_name`, `modified_by`, `modified_time`, `create_by`, `create_time`, `is_deleted`) VALUES (3, 2, '辣条', NULL, '2023-04-20 21:35:38', NULL, '2023-04-20 21:35:38', 0);
INSERT INTO `product_category_info` (`id`, `parent_id`, `category_name`, `modified_by`, `modified_time`, `create_by`, `create_time`, `is_deleted`) VALUES (4, 0, '电器', NULL, '2023-04-20 21:37:58', NULL, '2023-04-20 21:37:58', 0);
INSERT INTO `product_category_info` (`id`, `parent_id`, `category_name`, `modified_by`, `modified_time`, `create_by`, `create_time`, `is_deleted`) VALUES (5, 4, '数码通讯', NULL, '2023-04-20 21:39:05', NULL, '2023-04-20 21:38:14', 0);
INSERT INTO `product_category_info` (`id`, `parent_id`, `category_name`, `modified_by`, `modified_time`, `create_by`, `create_time`, `is_deleted`) VALUES (6, 5, '手机', NULL, '2023-04-20 21:38:49', NULL, '2023-04-20 21:38:49', 0);
COMMIT;

-- ----------------------------
-- Table structure for product_info
-- ----------------------------
DROP TABLE IF EXISTS `product_info`;
CREATE TABLE `product_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `brand_id` int(11) DEFAULT NULL COMMENT '品牌',
  `category_id` int(11) DEFAULT NULL COMMENT '商品类型',
  `product_name` varchar(128) DEFAULT NULL COMMENT '商品名称',
  `img_url` varchar(2048) DEFAULT NULL COMMENT '商品图片',
  `status` int(4) DEFAULT '0' COMMENT '状态(0:上架-1:下架-2:审核中)',
  `address` varchar(32) DEFAULT NULL COMMENT '地址',
  `content_pc` text COMMENT '商品电脑详情',
  `content_phone` text COMMENT '商品手机详情',
  `description` varchar(255) DEFAULT NULL COMMENT '商品描述',
  `price` decimal(10,2) DEFAULT NULL COMMENT '商品售价',
  `modified_by` int(11) DEFAULT NULL COMMENT '修改人',
  `modified_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_by` int(11) DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `is_deleted` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='商品';

-- ----------------------------
-- Records of product_info
-- ----------------------------
BEGIN;
INSERT INTO `product_info` (`id`, `brand_id`, `category_id`, `product_name`, `img_url`, `status`, `address`, `content_pc`, `content_phone`, `description`, `price`, `modified_by`, `modified_time`, `create_by`, `create_time`, `is_deleted`) VALUES (1, 1, 6, '苹果手机 Apple iPhone 14 5G 双卡双待', '', 0, '中国北京', NULL, NULL, NULL, 8888.00, NULL, '2023-04-20 21:41:51', NULL, '2023-04-20 21:39:12', 0);
COMMIT;

-- ----------------------------
-- Table structure for product_sku
-- ----------------------------
DROP TABLE IF EXISTS `product_sku`;
CREATE TABLE `product_sku` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `brand_id` int(11) DEFAULT NULL COMMENT '品牌',
  `product_id` int(11) DEFAULT NULL COMMENT '商品',
  `category_id` int(11) DEFAULT NULL COMMENT '商品类型',
  `title` varchar(128) DEFAULT NULL COMMENT '规格名称',
  `img_url` varchar(128) DEFAULT NULL COMMENT '规格图片',
  `price` decimal(10,2) DEFAULT '0.00' COMMENT '商品售价',
  `stock` int(11) DEFAULT '0' COMMENT '商品库存',
  `sku_order` int(11) DEFAULT '0' COMMENT '规格排序',
  `version` int(11) DEFAULT '1',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_by` varchar(64) DEFAULT NULL,
  `modified_by` varchar(64) DEFAULT NULL,
  `is_deleted` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='商品规格';

-- ----------------------------
-- Records of product_sku
-- ----------------------------
BEGIN;
INSERT INTO `product_sku` (`id`, `brand_id`, `product_id`, `category_id`, `title`, `img_url`, `price`, `stock`, `sku_order`, `version`, `create_time`, `modified_time`, `create_by`, `modified_by`, `is_deleted`) VALUES (1, 1, 1, 6, '苹果手机 Apple iPhone 14 5G 黑色 128G 双卡双待', NULL, 8888.00, 100, 0, 1, '2023-04-20 21:42:31', '2023-04-20 21:43:57', NULL, NULL, 0);
INSERT INTO `product_sku` (`id`, `brand_id`, `product_id`, `category_id`, `title`, `img_url`, `price`, `stock`, `sku_order`, `version`, `create_time`, `modified_time`, `create_by`, `modified_by`, `is_deleted`) VALUES (2, 1, 1, 6, '苹果手机 Apple iPhone 14 5G 白色 256G 双卡双待', NULL, 12888.00, 0, 0, 1, '2023-04-20 21:43:34', '2023-04-20 21:44:14', NULL, NULL, 0);
COMMIT;

-- ----------------------------
-- Table structure for product_sku_attr
-- ----------------------------
DROP TABLE IF EXISTS `product_sku_attr`;
CREATE TABLE `product_sku_attr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sku_id` int(11) DEFAULT NULL COMMENT '规格',
  `attr_id` int(11) DEFAULT NULL COMMENT '属性名id',
  `attr_value` varchar(11) DEFAULT NULL COMMENT '属性值',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified_time` datetime DEFAULT NULL,
  `create_by` varchar(255) DEFAULT '',
  `modified_by` varchar(255) DEFAULT '',
  `is_deleted` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='规格与属性值';

-- ----------------------------
-- Records of product_sku_attr
-- ----------------------------
BEGIN;
INSERT INTO `product_sku_attr` (`id`, `sku_id`, `attr_id`, `attr_value`, `create_time`, `modified_time`, `create_by`, `modified_by`, `is_deleted`) VALUES (1, 1, 1, '黑色', '2023-04-20 21:45:55', NULL, '', '', 0);
INSERT INTO `product_sku_attr` (`id`, `sku_id`, `attr_id`, `attr_value`, `create_time`, `modified_time`, `create_by`, `modified_by`, `is_deleted`) VALUES (2, 1, 2, '128G', '2023-04-20 21:45:58', NULL, '', '', 0);
INSERT INTO `product_sku_attr` (`id`, `sku_id`, `attr_id`, `attr_value`, `create_time`, `modified_time`, `create_by`, `modified_by`, `is_deleted`) VALUES (3, 2, 1, '白色', '2023-04-20 21:46:43', NULL, '', '', 0);
INSERT INTO `product_sku_attr` (`id`, `sku_id`, `attr_id`, `attr_value`, `create_time`, `modified_time`, `create_by`, `modified_by`, `is_deleted`) VALUES (4, 2, 2, '256G', '2023-04-20 21:46:44', NULL, '', '', 0);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
