CREATE DATABASE chat;

USE chat;



-- ---
-- Globals
-- ---

-- SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
-- SET FOREIGN_KEY_CHECKS=0;

-- ---
-- Table 'User'
-- User info
-- ---
DROP TABLE Users, Friends, Messages;


DROP TABLE IF EXISTS `Users`;
    
CREATE TABLE `Users` (
  -- `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `username` VARCHAR(128) NULL DEFAULT NULL,
  PRIMARY KEY (`username`)
) COMMENT 'User info';


-- ---
-- Table 'Rooms'
-- 
-- ---

-- DROP TABLE IF EXISTS `Rooms`;
    
-- CREATE TABLE `Rooms` (
--   `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
--   `roomname` VARCHAR(64) NULL DEFAULT 'Lobby',
--   PRIMARY KEY (`id`)
-- );

-- ---
-- Table 'Friends'
-- 
-- ---

DROP TABLE IF EXISTS `Friends`;
    
CREATE TABLE `Friends` (
  `User` VARCHAR(128)  NULL DEFAULT NULL,
  `UserFriend` VARCHAR(128)  NULL DEFAULT NULL
  -- FOREIGN KEY (`User`) REFERENCES `Users` (`username`),
  -- FOREIGN KEY (`UserFriend`) REFERENCES `Users` (`username`)
);


-- ---
-- Table 'Messages'
-- 
-- ---

DROP TABLE IF EXISTS `Messages`;
    
CREATE TABLE `Messages` (
  `objectId` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `message` MEDIUMTEXT NULL DEFAULT NULL,
  `roomname` VARCHAR(64) NULL DEFAULT 'Lobby',
  `username` VARCHAR(128)  NULL DEFAULT NULL,
  PRIMARY KEY (`objectId`)
  -- FOREIGN KEY (`username`) REFERENCES `Users` (`username`)
  -- FOREIGN KEY (`id_Rooms`) REFERENCES `Rooms` (`id`)
);

--Add Foreign Keys
-- ALTER TABLE `Messages` ADD FOREIGN KEY (id_User) REFERENCES `User` (`id`);
ALTER TABLE `Messages` ADD FOREIGN KEY(username) REFERENCES `User` (`username`);
ALTER TABLE `Friends` ADD FOREIGN KEY(User) REFERENCES `User` (`username`);
ALTER TABLE `Friends` ADD FOREIGN KEY(UserFriend) REFERENCES `User` (`username`);


-- --
-- Inserting Dummy Data
-- --

INSERT IGNORE into `USERS` (`username`)
  VALUES
    ('John Doe'),
    ('Jane Doe'),
    ('John Doe'),
    ('Foo'),
    ('Foo'),
    ('Bar');


-- INSERT INTO `ROOMS` (`roomname`)
--   VALUES
--     ('Lobby'),
--     ('Test'),
--     ('Kitchen');



INSERT into `MESSAGES` (`message`, `id_Users`)
  VALUES
    ('This is a message', 11),
    ('This is another', 12),
    ('This is a different message', 13);

INSERT into `MESSAGES` (`message`, `id_users`)
  SELECT "BODY OF MESSAGE", Users.id
  FROM Users
  WHERE Users.username = "inputted username"

INSERT into `MESSAGES` (`message`, `id_Users`)
  SELECT 'This is a test message', Users.id
  FROM Users
  WHERE Users.username = 'Valjean';
-- --
-- Select Data Testing
-- --

SELECT Users.username, Messages.message, Messages.roomname
  FROM Users, Messages
  WHERE id_Users = Users.id;

SELECT Users.username, Message, Rooms.roomname
  FROM Users, Messages, Rooms
  WHERE id_Rooms = Rooms.id 
    and id_Users = Users.id;

SELECT Message, Rooms.Name
  FROM Messages, Rooms
  WHERE id_Rooms = Rooms.id;
  -- WHERE id_User = User.id;

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




-- CREATE DATABASE chat;

-- USE chat;

-- CREATE TABLE messages (
--   /* Describe your table here.*/
--   username VARCHAR(32),
--   message TEXT,
--   room VARCHAR(16),
--   posted DATE -- "YYYY-MM-DD"
-- );



-- /* Create other tables and define schemas for them here! */
-- INSERT INTO messages (username, message, room, posted)
--   VALUES ('JohnDoe', 'Here lies a message from John Doe', 'TestRoom', '2015-06-06');

-- -- Query to select messages and order by posted date
-- SELECT username, message, room, posted
--   FROM messages
--   ORDER BY posted;



-- /*  Execute this file from the command line by typing:
--  *    mysql -u root < server/schema.sql
--  *  to create the database and the tables.*/

