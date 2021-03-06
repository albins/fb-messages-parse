CREATE DATABASE IF NOT EXISTS FBMSG;
ALTER DATABASE FBMSG DEFAULT COLLATE utf8_unicode_ci;

USE FBMSG;

DROP TABLE IF EXISTS message;
DROP TABLE IF EXISTS thread;
DROP TABLE IF EXISTS author;

START TRANSACTION;

CREATE TABLE thread (
       id int PRIMARY KEY AUTO_INCREMENT,
       title varchar(250) UNIQUE NOT NULL
);

CREATE TABLE author (
       id int PRIMARY KEY AUTO_INCREMENT,
       name varchar(250) UNIQUE NOT NULL
);

CREATE TABLE message (
       id int PRIMARY KEY AUTO_INCREMENT,
       msg_text TEXT,
       pub_time DATETIME,
       author_id int,
       thread_id int,
       FOREIGN KEY (author_id) REFERENCES author(id),
       FOREIGN KEY (thread_id) REFERENCES thread(id)
);

COMMIT;
