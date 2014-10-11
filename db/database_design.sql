CREATE TABLE user(
	user_id INT(4) UNSIGNED NOT NULL AUTO_INCREMENT,
	nickname VARCHAR(30) UNIQUE,
	email VARCHAR(65),
	password CHAR(512),
	gender CHAR(1) default 'M',
	type VARCHAR(20) NOT NULL DEFAULT 'User' COMMENT 'User type, README.txt has  more  information on this',
	born_date TIMESTAMP DEFAULT NOW() COMMENT 'The age of the user in game day/years',
	PRIMARY KEY(user_id)
) ENGINE=INNODB AUTO_INCREMENT=1;


## The  user resources 
CREATE TABLE user_resources(
	user INT(4) UNSIGNED NOT NULL,
	gold INT( 4 ) UNSIGNED DEFAULT 500,
	metals INT(4) UNSIGNED DEFAULT 0,
	gems INT(4) UNSIGNED DEFAULT 10,
	pvp_mana INT(4) UNSIGNED DEFAULT 5,
	PRIMARY KEY ( user_id ), 
	FOREIGN KEY (user) REFERENCES user(user_id)
        	ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE = INNODB ;

CREATE TABLE class (
	class_id TINYINT(3) UNSIGNED NOT NULL AUTO_INCREMENT,
	name VARCHAR(25) NOT NULL COMMENT 'The name of the class',
	description VARCHAR(5000) NOT NULL COMMENT 'The description of each of the classes',
	PRIMARY KEY(class_id)
) ENGINE = INNODB;


// TODO Set the praying attributes for the character in order for them to increase each of there attributes.
CREATE TABLE character (
	character_id INT(4) UNSIGNED NOT NULL,
	class TINYINT(3) UNSIGNED NOT NULL,
	health DOUBLE PRECISION(7,2) UNSIGNED NOT NULL DEFAULT 50,
	strength DOUBLE PRECISION(7,2) UNSIGNED NOT NULL DEFAULT 5.00 COMMENT 'The strength of the class',
	agility DOUBLE PRECISION(7,2) UNSIGNED NOT NULL DEFAULT 5.00 COMMENT 'The agility of the class',
	intelligence DOUBLE PRECISION(7,2) UNSIGNED NOT NULL DEFAULT 5.00 COMMENT 'The intelligence of the class',
	dark_power DOUBLE PRECISION(7,2) UNSIGNED NOT NULL DEFAULT 5.00 COMMENT 'The dark power manipulation of the class',
	summoning DOUBLE PRECISION(7,2) UNSIGNED NOT NULL DEFAULT 5.00 COMMENT 'the summing power of the class',
	element_power DOUBLE PRECISION(7,2) UNSIGNED NOT NULL DEFAULT 5.00 COMMENT 'The elemental power of the class',
	FOREIGN KEY (class) REFERENCES class(class_id)
		ON DELETE CASCADE ON UPDATE NOT ACTION
) ENGINE = INNODB;

CREATE TABLE user_character (
	user INT(4) UNSIGNED NOT NULL,
	character INT(4) UNSIGNED NOT NULL,
	PRIMARY KEY (user, character),
	FOREIGN KEY (user) REFERENCES user(user_id)
                ON DELETE CASCADE ON UPDATE NOT ACTION
	FOREGIN KEY (character) REFERENCES character(character_id)
                ON DELETE CASCADE ON UPDATE NOT ACTION
) ENGINE = INNODB;

CREATE TABLE user_character_attributes (
	user INT(4) UNSIGNED NOT NULL,
	character INT(4) UNSIGNED NOT NULL,
	health DOUBLE PRECISION(7,2) UNSIGNED NOT NULL
	level TINYINT(2) UNSIGNED NOT NULL,
	mana_remaining SMALLINT(2) UNSIGNED NOT NULL DEFAULT 40 COMMENT 'The remaining mana',
	experience INT(4) UNSIGNED NOT NULL, 
	strength DOUBLE PRECISION(7,2) UNSIGNED NOT NULL,
	agility DOUBLE PRECISION(7,2) UNSIGNED NOT NULL,
	intelligence DOUBLE PRECISION(7,2) UNSIGNED NOT NULL,
	dark_power DOUBLE PRECISION(7,2) UNSIGNED NOT NULL,
	summoning DOUBLE PRECISION(7,2) UNSIGNED NOT NULL,
	elemental_power DOUBLE PRECISION(7,2) UNSIGNED NOT NULL,
	PRIMARY KEY (user,character)
	FOREIGN KEY (user, character) REFERENCES user_character (user, character)
                ON DELETE CASCADE ON UPDATE NOT ACTION
) ENGINE = INNODB;



CREATE TABLE user_character_positions ( 
	user INT(4) UNSIGNED NOT NULL,
	character INT(4) UNSIGNED NOT NULL,
	forward_position_first TINYINT(2) UNSIGNED,
	forward_position_two TINY_INT(2) UNSIGNED,
	rear_position_first TINYINT(2) UNSIGNED,
	rear_position_two TINY_INT(2) UNSIGNED,
	PRIMARY KEY (user,character)
        FOREIGN KEY (user, character) REFERENCES user_character (user, character)
                ON DELETE CASCADE ON UPDATE NOT ACTION
) ENGINE = INNODB;