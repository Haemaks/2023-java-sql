DROP DATABASE IF EXISTS website_users;
CREATE DATABASE website_users;
USE website_users;
CREATE TABLE users (rang VARCHAR(255) DEFAULT "user", 
		    username VARCHAR(255) NOT NULL, 
		    user_password VARCHAR(255) NOT NULL);
INSERT INTO users (username, user_password) VALUES ("Peter", "1234"), ("Martin", "1234");

CREATE TABLE pandora_species(id INT AUTO_INCREMENT,
                             name VARCHAR(255),
                             description VARCHAR(255),
                             PRIMARY KEY(id));

INSERT INTO pandora_species (name, description) VALUES 
                                 ("Direhorse", "The direhorse has two Long, thin antennae that emerge from either side of the top of the skull."),
                                 ("Prolemuris", "The prolemuris has lateral membranes that grow out of its sides and between its lower arm and thigh.");
                             