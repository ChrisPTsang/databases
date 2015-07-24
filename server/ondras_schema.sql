CREATE DATABASE chatTest;

USE chatTest;



-- ---
-- Globals
-- ---

-- SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
-- SET FOREIGN_KEY_CHECKS=0;

-- ---
-- Table 'User'
-- User info
-- ---

DROP TABLE IF EXISTS `User`;
    
CREATE TABLE `User` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `Name` VARCHAR(128) NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) COMMENT 'User info';

-- ---
-- Table 'Messages'
-- 
-- ---

DROP TABLE IF EXISTS `Messages`;
    
CREATE TABLE `Messages` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `Messages` MEDIUMTEXT NULL DEFAULT NULL,
  `id_User` INTEGER NULL DEFAULT NULL,
  `id_Rooms` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`id_User`) REFERENCES `User` (`id`),
  FOREIGN KEY (`id_Rooms`) REFERENCES `Rooms` (`id`)
);

-- ---
-- Table 'Rooms'
-- 
-- ---

DROP TABLE IF EXISTS `Rooms`;
    
CREATE TABLE `Rooms` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `Name` VARCHAR(64) NULL DEFAULT 'Lobby',
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'Friends'
-- 
-- ---

DROP TABLE IF EXISTS `Friends`;
    
CREATE TABLE `Friends` (
  `User` INT NULL DEFAULT NULL,
  `UserFriend` INTEGER NULL DEFAULT NULL,
  FOREIGN KEY (`User`) REFERENCES `User` (`id`),
  FOREIGN KEY (`UserFriend`) REFERENCES `User` (`id`)
);

-- ---
-- Foreign Keys 
-- ---

-- ALTER TABLE `Messages` ADD FOREIGN KEY (id_User) REFERENCES `User` (`id`);
-- ALTER TABLE `Messages` ADD FOREIGN KEY (id_Rooms) REFERENCES `Rooms` (`id`);
-- ALTER TABLE `Friends` ADD FOREIGN KEY (User) REFERENCES `User` (`id`);
-- ALTER TABLE `Friends` ADD FOREIGN KEY (UserFriend) REFERENCES `User` (`id`);

-- ---
-- Table Properties
-- ---

-- ALTER TABLE `User` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Messages` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Rooms` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Friends` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ---
-- Test Data
-- ---

-- INSERT INTO `User` (`id`,`Name`) VALUES
-- ('','');
-- INSERT INTO `Messages` (`id`,`Messages`,`id_User`,`id_Rooms`) VALUES
-- ('','','','');
-- INSERT INTO `Rooms` (`id`,`Name`) VALUES
-- ('','');
-- INSERT INTO `Friends` (`User`,`UserFriend`) VALUES
-- ('','');

