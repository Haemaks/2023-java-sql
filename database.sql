DROP DATABASE IF EXISTS website_users;
CREATE DATABASE website_users;
USE website_users;
CREATE TABLE users (rang VARCHAR(255) DEFAULT "user", 
		    username VARCHAR(255) NOT NULL, 
		    user_password VARCHAR(255) NOT NULL);
INSERT INTO users (username, user_password) VALUES ("Peter", "1234"), ("Martin", "1234");