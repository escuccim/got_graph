/*
Navicat MySQL Data Transfer

Source Server         : Localhost
Source Server Version : 50720
Source Host           : 127.0.0.1:3306
Source Database       : epfl

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2018-11-10 13:52:10
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `graph_person`
-- ----------------------------
DROP TABLE IF EXISTS `graph_person`;
CREATE TABLE `graph_person` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `age` int(11) NOT NULL,
  `gender` varchar(1) NOT NULL,
  `alive` int(11) NOT NULL,
  `house_id` int(11) NOT NULL,
  `title_id` int(11) NOT NULL,
  `birth_house_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `graph_person_house_id_9815c6b9_fk_graph_house_id` (`house_id`),
  KEY `graph_person_title_id_a2e9fd0f_fk_graph_title_id` (`title_id`),
  KEY `graph_person_birth_house_id_09a94099_fk_graph_house_id` (`birth_house_id`),
  CONSTRAINT `graph_person_birth_house_id_09a94099_fk_graph_house_id` FOREIGN KEY (`birth_house_id`) REFERENCES `graph_house` (`id`),
  CONSTRAINT `graph_person_house_id_9815c6b9_fk_graph_house_id` FOREIGN KEY (`house_id`) REFERENCES `graph_house` (`id`),
  CONSTRAINT `graph_person_title_id_a2e9fd0f_fk_graph_title_id` FOREIGN KEY (`title_id`) REFERENCES `graph_title` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of graph_person
-- ----------------------------
INSERT INTO `graph_person` VALUES ('1', 'Ned', '39', 'M', '0', '1', '5', null);
INSERT INTO `graph_person` VALUES ('2', 'Catelyn', '35', 'F', '0', '1', '6', '10');
INSERT INTO `graph_person` VALUES ('3', 'Arya', '10', 'F', '1', '1', '9', null);
INSERT INTO `graph_person` VALUES ('4', 'Sansa', '16', 'F', '1', '1', '6', null);
INSERT INTO `graph_person` VALUES ('5', 'Jon', '17', 'M', '1', '4', '9', null);
INSERT INTO `graph_person` VALUES ('6', 'Robb', '18', 'M', '0', '1', '5', null);
INSERT INTO `graph_person` VALUES ('7', 'Brandon II', '12', 'M', '1', '1', '9', null);
INSERT INTO `graph_person` VALUES ('8', 'Lyanna', '25', 'F', '0', '1', '6', null);
INSERT INTO `graph_person` VALUES ('10', 'Tywin', '50', 'M', '0', '2', '5', null);
INSERT INTO `graph_person` VALUES ('11', 'Tyrion', '30', 'M', '1', '2', '9', null);
INSERT INTO `graph_person` VALUES ('12', 'Jaime', '34', 'M', '1', '2', '7', null);
INSERT INTO `graph_person` VALUES ('13', 'Cersei', '32', 'F', '1', '2', '2', null);
INSERT INTO `graph_person` VALUES ('14', 'Joffrey', '18', 'M', '0', '2', '1', null);
INSERT INTO `graph_person` VALUES ('15', 'Tomen', '16', 'M', '0', '2', '1', null);
INSERT INTO `graph_person` VALUES ('16', 'Myrcella', '15', 'F', '0', '2', '4', null);
INSERT INTO `graph_person` VALUES ('20', 'Daenerys', '25', 'F', '1', '3', '2', null);
INSERT INTO `graph_person` VALUES ('21', 'Drogo', '30', 'M', '0', '8', '10', null);
INSERT INTO `graph_person` VALUES ('30', 'Robert', '39', 'M', '0', '5', '1', null);
INSERT INTO `graph_person` VALUES ('31', 'Stannis', '38', 'M', '0', '5', '5', null);
INSERT INTO `graph_person` VALUES ('32', 'Renly', '35', 'M', '0', '5', '5', null);
INSERT INTO `graph_person` VALUES ('34', 'Shireen', '13', 'F', '0', '5', '9', null);
INSERT INTO `graph_person` VALUES ('35', 'Selyse', '36', 'F', '1', '5', '6', '16');
INSERT INTO `graph_person` VALUES ('37', 'Aerys II', '50', 'M', '0', '3', '1', null);
INSERT INTO `graph_person` VALUES ('38', 'Rhaegar', '30', 'M', '0', '3', '3', null);
INSERT INTO `graph_person` VALUES ('39', 'Viserys', '20', 'M', '0', '3', '9', null);
INSERT INTO `graph_person` VALUES ('40', 'Aegon V', '1', 'M', '0', '3', '3', null);
INSERT INTO `graph_person` VALUES ('41', 'Elia', '25', 'F', '0', '3', '4', '7');
INSERT INTO `graph_person` VALUES ('42', 'Rhaenys', '4', 'F', '0', '3', '4', null);
INSERT INTO `graph_person` VALUES ('43', 'Doran', '50', 'M', '1', '7', '3', null);
INSERT INTO `graph_person` VALUES ('44', 'Oberyn', '40', 'M', '0', '7', '3', null);
INSERT INTO `graph_person` VALUES ('45', 'Quentyn', '20', 'M', '1', '7', '3', null);
INSERT INTO `graph_person` VALUES ('46', 'Margaery', '20', 'F', '1', '5', '2', '10');
INSERT INTO `graph_person` VALUES ('47', 'Olenna', '80', 'F', '1', '9', '6', '15');
INSERT INTO `graph_person` VALUES ('48', 'Mace', '50', 'M', '1', '9', '5', null);
INSERT INTO `graph_person` VALUES ('49', 'Loras', '25', 'M', '1', '9', '7', null);
INSERT INTO `graph_person` VALUES ('50', 'Rhaella', '40', 'F', '0', '3', '2', '3');
INSERT INTO `graph_person` VALUES ('51', 'Hoster', '80', 'M', '0', '10', '5', null);
INSERT INTO `graph_person` VALUES ('52', 'Edmure', '35', 'M', '1', '10', '5', null);
INSERT INTO `graph_person` VALUES ('53', 'Brynden', '50', 'M', '1', '10', '7', null);
INSERT INTO `graph_person` VALUES ('54', 'Brandon I', '35', 'M', '0', '1', '7', null);
INSERT INTO `graph_person` VALUES ('55', 'Benjen', '40', 'M', '1', '1', '9', null);
INSERT INTO `graph_person` VALUES ('56', 'Roose', '50', 'M', '0', '11', '5', null);
INSERT INTO `graph_person` VALUES ('57', 'Ramsay', '30', 'M', '0', '11', '5', null);
INSERT INTO `graph_person` VALUES ('58', 'Robert', '70', 'M', '0', '12', '5', null);
INSERT INTO `graph_person` VALUES ('59', 'Robyn', '10', 'M', '1', '12', '5', null);
INSERT INTO `graph_person` VALUES ('60', 'Lysa', '30', 'F', '0', '12', '6', '10');
INSERT INTO `graph_person` VALUES ('61', 'Theon', '25', 'M', '1', '13', '9', null);
INSERT INTO `graph_person` VALUES ('62', 'Asha', '30', 'F', '1', '13', '9', null);
INSERT INTO `graph_person` VALUES ('63', 'Euron', '45', 'M', '1', '13', '9', null);
INSERT INTO `graph_person` VALUES ('64', 'Aeron', '50', 'M', '1', '13', '5', null);
INSERT INTO `graph_person` VALUES ('65', 'Victarion', '55', 'M', '1', '13', '9', null);
INSERT INTO `graph_person` VALUES ('66', 'Balon', '75', 'M', '0', '13', '5', null);
INSERT INTO `graph_person` VALUES ('67', 'Joanna', '35', 'F', '0', '2', '6', '2');
INSERT INTO `graph_person` VALUES ('68', 'Willas', '40', 'M', '1', '9', '7', null);
INSERT INTO `graph_person` VALUES ('69', 'Garlan', '38', 'M', '1', '9', '7', null);
INSERT INTO `graph_person` VALUES ('70', 'Arianne', '25', 'F', '1', '7', '4', null);
INSERT INTO `graph_person` VALUES ('71', 'Trystane', '18', 'M', '1', '7', '5', null);
INSERT INTO `graph_person` VALUES ('72', 'Ellaria', '30', 'F', '1', '14', '9', null);
INSERT INTO `graph_person` VALUES ('73', 'Elia', '18', 'F', '1', '14', '9', null);
INSERT INTO `graph_person` VALUES ('74', 'Obella', '16', 'F', '1', '14', '9', null);
INSERT INTO `graph_person` VALUES ('75', 'Dorea', '13', 'F', '1', '14', '9', null);
INSERT INTO `graph_person` VALUES ('76', 'Loreza', '7', 'F', '1', '14', '9', null);
INSERT INTO `graph_person` VALUES ('77', 'Rickon', '8', 'M', '1', '1', '9', '1');
