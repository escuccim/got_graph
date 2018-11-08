/*
Navicat MySQL Data Transfer

Source Server         : Localhost
Source Server Version : 50720
Source Host           : 127.0.0.1:3306
Source Database       : epfl

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2018-11-08 13:09:35
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `graph_house`
-- ----------------------------
DROP TABLE IF EXISTS `graph_house`;
CREATE TABLE `graph_house` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `color` varchar(6) NOT NULL,
  `show_in_legend` int(11) NOT NULL,
  `major_house` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of graph_house
-- ----------------------------
INSERT INTO `graph_house` VALUES ('1', 'Stark', '7d7d7d', '1', '1');
INSERT INTO `graph_house` VALUES ('2', 'Lannister', 'd9c017', '1', '1');
INSERT INTO `graph_house` VALUES ('3', 'Targaryen', 'dd2424', '1', '1');
INSERT INTO `graph_house` VALUES ('4', 'Snow', '9d9999', '0', '0');
INSERT INTO `graph_house` VALUES ('5', 'Baratheon', '350fc3', '1', '1');
INSERT INTO `graph_house` VALUES ('6', 'Storm', 'd9d6d6', '0', '1');
INSERT INTO `graph_house` VALUES ('7', 'Martell', 'f77117', '1', '1');
INSERT INTO `graph_house` VALUES ('8', '(Dothraki)', '000000', '0', '0');
INSERT INTO `graph_house` VALUES ('9', 'Tyrell', 'ef4be9', '1', '1');
INSERT INTO `graph_house` VALUES ('10', 'Tully', '2c9ce6', '1', '1');
INSERT INTO `graph_house` VALUES ('11', 'Bolton', '800054', '1', '1');
INSERT INTO `graph_house` VALUES ('12', 'Arryn', '78c6f9', '1', '1');
INSERT INTO `graph_house` VALUES ('13', 'Greyjoy', '5f5f5f', '1', '1');
INSERT INTO `graph_house` VALUES ('14', 'Sand', 'e4b77c', '0', '0');
