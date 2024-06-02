DROP DATABASE IF EXISTS `books-db`;
CREATE DATABASE `books-db` DEFAULT CHARACTER SET utf8;

USE `books-db`;

DROP TABLE IF EXISTS `books`;
CREATE TABLE `books` (
  `id_book` int NOT NULL AUTO_INCREMENT,
  `isbn` char(16) NOT NULL,
  `book_title` varchar(256),
  `book_author` varchar(64),
  `year_of_publication` year,
  `publisher` varchar(64),
  `image_url_s` varchar(128),
  `image_url_m` varchar(128),
  `image_url_l` varchar(128),
  PRIMARY KEY (`id_book`)
);

DROP TABLE IF EXISTS `ratings`;
CREATE TABLE `ratings` (
  `id_rating` int NOT NULL AUTO_INCREMENT,
  `user_id` varchar(256),
  `isbn` char(16) NOT NULL,
  `book_rating` int NOT NULL,
  PRIMARY KEY (`id_rating`)
);
