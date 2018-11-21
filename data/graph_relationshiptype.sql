/*
Navicat MySQL Data Transfer

Source Server         : Localhost
Source Server Version : 50720
Source Host           : 127.0.0.1:3306
Source Database       : epfl

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2018-11-10 13:52:16
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `graph_relationshiptype`
-- ----------------------------
DROP TABLE IF EXISTS `graph_relationshiptype`;
CREATE TABLE `graph_relationshiptype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(50) NOT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `weight` int(11) NOT NULL,
  `color` varchar(6) NOT NULL,
  `display` int(11) NOT NULL,
  `display_text` varchar(50) NOT NULL,
  `reciprocal` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of graph_relationshiptype
-- ----------------------------
INSERT INTO `graph_relationshiptype` VALUES ('1', 'Ally', '40', '1', '797979', '0', 'Allies', '0');
INSERT INTO `graph_relationshiptype` VALUES ('2', 'Enemy', '45', '2', 'fb162b', '0', 'Enemies', '0');
INSERT INTO `graph_relationshiptype` VALUES ('3', 'Family', '35', '1', '16c8fb', '0', 'Family', '3');
INSERT INTO `graph_relationshiptype` VALUES ('4', 'Sibling', '25', '3', '3337c1', '1', 'Siblings', '4');
INSERT INTO `graph_relationshiptype` VALUES ('5', 'Spouse', '1', '10', '1739e3', '1', 'Spouse', '5');
INSERT INTO `graph_relationshiptype` VALUES ('6', 'Child', '20', '9', '9f63c9', '1', 'Children', '7');
INSERT INTO `graph_relationshiptype` VALUES ('7', 'Parent', '15', '9', '9f63c9', '1', 'Parents', '6');
INSERT INTO `graph_relationshiptype` VALUES ('11', 'Lover', '5', '8', '2e5ee9', '1', 'Lovers', '11');
INSERT INTO `graph_relationshiptype` VALUES ('12', 'Fiance/e', '10', '3', '2e5ee9', '1', 'Fianc&eacute;/e', '12');
INSERT INTO `graph_relationshiptype` VALUES ('13', 'Foster Parent/Child', '30', '4', '676767', '1', 'Foster Children', '13');
