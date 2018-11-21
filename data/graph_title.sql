/*
Navicat MySQL Data Transfer

Source Server         : Localhost
Source Server Version : 50720
Source Host           : 127.0.0.1:3306
Source Database       : epfl

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2018-11-10 13:52:22
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `graph_title`
-- ----------------------------
DROP TABLE IF EXISTS `graph_title`;
CREATE TABLE `graph_title` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of graph_title
-- ----------------------------
INSERT INTO `graph_title` VALUES ('1', 'KIng');
INSERT INTO `graph_title` VALUES ('2', 'Queen');
INSERT INTO `graph_title` VALUES ('3', 'Prince');
INSERT INTO `graph_title` VALUES ('4', 'Princess');
INSERT INTO `graph_title` VALUES ('5', 'Lord');
INSERT INTO `graph_title` VALUES ('6', 'Lady');
INSERT INTO `graph_title` VALUES ('7', 'Ser');
INSERT INTO `graph_title` VALUES ('8', 'Maester');
INSERT INTO `graph_title` VALUES ('9', ' ');
INSERT INTO `graph_title` VALUES ('10', 'Khal');
