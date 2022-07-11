-- Adminer 4.8.1 MySQL 8.0.18 dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DELIMITER ;;

DROP PROCEDURE IF EXISTS `createUser`;;
CREATE PROCEDURE `createUser`(IN `nameUser` varchar(45), IN `password` varchar(45))
INSERT INTO user(nameUser,password) VALUES (nameUser,password);;

DELIMITER ;

DROP TABLE IF EXISTS `action`;
CREATE TABLE `action` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `goup_members`;
CREATE TABLE `goup_members` (
  `id_user` int(20) NOT NULL,
  `id_group` int(20) NOT NULL,
  `user-iduser` int(20) NOT NULL,
  `group_id` int(20) NOT NULL,
  KEY `id_user` (`id_user`),
  KEY `id_group` (`id_group`),
  KEY `user-iduser` (`user-iduser`),
  KEY `group_id` (`group_id`),
  CONSTRAINT `goup_members_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`idUser`),
  CONSTRAINT `goup_members_ibfk_2` FOREIGN KEY (`id_group`) REFERENCES `group` (`id`),
  CONSTRAINT `goup_members_ibfk_3` FOREIGN KEY (`user-iduser`) REFERENCES `user` (`idUser`),
  CONSTRAINT `goup_members_ibfk_4` FOREIGN KEY (`group_id`) REFERENCES `group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `group`;
CREATE TABLE `group` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `group` (`id`, `name`, `description`) VALUES
(1,	'Alumnos',	'Deben aprobar la cursada '),
(2,	'Docentes',	'Dictado de su materia'),
(3,	'Director',	'Encargado de la institucion'),
(4,	'Preceptora',	'Coordinacion entre alumnos y docentes');

DROP TABLE IF EXISTS `group_accesses`;
CREATE TABLE `group_accesses` (
  `id_group` int(20) NOT NULL,
  `id_action` int(20) NOT NULL,
  `group_id` int(20) NOT NULL,
  `action_id` int(20) NOT NULL,
  KEY `id_group` (`id_group`),
  KEY `id_action` (`id_action`),
  KEY `group_id` (`group_id`),
  KEY `action_id` (`action_id`),
  CONSTRAINT `group_accesses_ibfk_1` FOREIGN KEY (`id_group`) REFERENCES `group` (`id`),
  CONSTRAINT `group_accesses_ibfk_2` FOREIGN KEY (`id_action`) REFERENCES `action` (`id`),
  CONSTRAINT `group_accesses_ibfk_3` FOREIGN KEY (`group_id`) REFERENCES `group` (`id`),
  CONSTRAINT `group_accesses_ibfk_4` FOREIGN KEY (`action_id`) REFERENCES `action` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `idUser` int(20) NOT NULL AUTO_INCREMENT,
  `nameUser` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`idUser`),
  UNIQUE KEY `nameUser` (`nameUser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `user` (`idUser`, `nameUser`, `password`) VALUES
(1,	'Alejandra',	'23220000'),
(3,	'Abigail',	'5466454'),
(4,	'Debora',	'de23232'),
(5,	'Jorge',	'325j454'),
(6,	'Juan',	'336555p'),
(7,	'Cesar',	'698124c1');

DROP TABLE IF EXISTS `user_information`;
CREATE TABLE `user_information` (
  `id_user` int(20) NOT NULL AUTO_INCREMENT,
  `user_idUser` int(11) NOT NULL,
  PRIMARY KEY (`id_user`),
  KEY `user_idUser` (`user_idUser`),
  CONSTRAINT `user_information_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`idUser`),
  CONSTRAINT `user_information_ibfk_2` FOREIGN KEY (`user_idUser`) REFERENCES `user` (`idUser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- 2022-07-11 22:01:19
