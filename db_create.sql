CREATE TABLE `workout` (
	`workout_id` INT(6) NOT NULL AUTO_INCREMENT,
	`workout_type_cd` varchar(3) NOT NULL,
	`workout_duration` DECIMAL(3),
	`workout_user_id` INT(2) NOT NULL,
	`workout_date` DATETIME NOT NULL,
	PRIMARY KEY (`workout_id`)
);

CREATE TABLE `user` (
	`user_id` INT(2) NOT NULL AUTO_INCREMENT,
	`user_name` TEXT(15) NOT NULL,
	PRIMARY KEY (`user_id`)
);

CREATE TABLE `workout_type` (
	`code` varchar(3) NOT NULL AUTO_INCREMENT,
	`decode` TEXT(25) NOT NULL UNIQUE,
	PRIMARY KEY (`code`)
);

ALTER TABLE `workout` ADD CONSTRAINT `workout_fk_type` FOREIGN KEY (`workout_type_cd`) REFERENCES `workout_type`(`code`);

ALTER TABLE `workout` ADD CONSTRAINT `workout_fk_usr` FOREIGN KEY (`workout_user_id`) REFERENCES `user`(`user_id`);

