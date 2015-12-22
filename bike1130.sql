/*
Navicat MySQL Data Transfer

Source Server         : dsgygb_scuinfo
Source Server Version : 50173
Source Host           : 203.195.164.179:3306
Source Database       : test

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2014-11-30 00:38:21
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `bike_admin`
-- ----------------------------
DROP TABLE IF EXISTS `bike_admin`;
CREATE TABLE `bike_admin` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` char(32) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '管理员用户名',
  `password` char(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '密码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of bike_admin
-- ----------------------------

-- ----------------------------
-- Table structure for `bike_lend`
-- ----------------------------
DROP TABLE IF EXISTS `bike_lend`;
CREATE TABLE `bike_lend` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `userId` int(10) DEFAULT NULL COMMENT '借车人的user_id',
  `lendCreateAt` int(10) DEFAULT NULL COMMENT '借车时间,采用标准时间戳保存',
  `lendStationId` int(10) DEFAULT NULL COMMENT '借车站点id',
  `returnStationId` int(10) DEFAULT NULL COMMENT '还车站点id',
  `returnCreateAt` int(10) DEFAULT NULL COMMENT '还车时间',
  `status` tinyint(2) DEFAULT NULL COMMENT '订单状态,0为借出未还,1为已还',
  `updateCreateAt` int(10) DEFAULT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`id`),
  KEY `index` (`userId`,`lendCreateAt`,`lendStationId`,`returnStationId`,`returnCreateAt`,`status`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='自行车借还详情表';

-- ----------------------------
-- Records of bike_lend
-- ----------------------------

-- ----------------------------
-- Table structure for `bike_scan`
-- ----------------------------
DROP TABLE IF EXISTS `bike_scan`;
CREATE TABLE `bike_scan` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `wechatId` char(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '用户微信唯一id',
  `createAt` int(10) DEFAULT NULL COMMENT '扫描时间',
  `stationId` int(10) DEFAULT NULL COMMENT '站点id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of bike_scan
-- ----------------------------

-- ----------------------------
-- Table structure for `bike_station`
-- ----------------------------
DROP TABLE IF EXISTS `bike_station`;
CREATE TABLE `bike_station` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `number` int(11) DEFAULT NULL COMMENT '站台可借自行车数量',
  `name` char(32) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '站台名',
  `x` char(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '站点x坐标',
  `y` char(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '站点y坐标',
  `initNumber` int(11) DEFAULT NULL COMMENT '站点初始车辆',
  PRIMARY KEY (`id`),
  KEY `number` (`number`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='自行车站点信息表';

-- ----------------------------
-- Records of bike_station
-- ----------------------------
INSERT INTO `bike_station` VALUES ('1', '5', '校车站', '23', '30', '5');
INSERT INTO `bike_station` VALUES ('2', '25', '二基楼', '24', '31', '25');

-- ----------------------------
-- Table structure for `bike_user`
-- ----------------------------
DROP TABLE IF EXISTS `bike_user`;
CREATE TABLE `bike_user` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `wechatName` char(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '微信名',
  `wechatId` char(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '微信唯一id',
  `createAt` int(10) DEFAULT NULL COMMENT '注册时间，采用标准时间戳保存',
  `gender` tinyint(4) DEFAULT NULL COMMENT '用户的性别，值为1时是男性，值为2时是女性，值为0时是未知',
  `headImgUrl` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index` (`wechatId`) USING BTREE,
  KEY `time` (`createAt`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='用户信息表';

-- ----------------------------
-- Records of bike_user
-- ----------------------------
INSERT INTO `bike_user` VALUES ('3', '小明', 'oMF6BjiHDIB5C0fgxsKBOGXC5wH8', '1417278343', '1', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM7h6RJJBdkXMP7UN5nicB1zlAwibZ3UwnnXqiccx9icMTTO5JzItAGs5nZibQuYvHME4bgyqEknyzluQow/0');
