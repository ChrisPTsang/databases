CREATE DATABASE chat;

USE chat;

CREATE TABLE messages (
  /* Describe your table here.*/
  username VARCHAR(32),
  message TEXT,
  room VARCHAR(16),
  posted DATE
);



/* Create other tables and define schemas for them here! */
INSERT INTO messages (username, message, room, posted)
  VALUES ('JohnDoe', 'Here lies a message from John Doe', 'TestRoom', GETDATE());

-- Query to select messages and order by posted date
SELECT username, message, room, posted
  FROM messages
  ORDER BY posted;



/*  Execute this file from the command line by typing:
 *    mysql -u root < server/schema.sql
 *  to create the database and the tables.*/

