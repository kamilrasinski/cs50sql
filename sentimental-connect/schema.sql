CREATE TABLE `users` (
    `id` INT AUTO_INCREMENT,
    `first_name` VARCHAR (32) NOT NULL,
    `last_name` VARCHAR (32) NOT NULL,
    `username` VARCHAR (16) NOT NULL UNIQUE,
    `password` VARCHAR (64) NOT NULL,
    PRIMARY KEY (`id`)
);

CREATE TABLE `schools` (
    `id` INT AUTO_INCREMENT,
    `name` VARCHAR (32) NOT NULL,
    `type` VARCHAR (16) NOT NULL,
    `location` VARCHAR (32) NOT NULL,
    `founded` YEAR NOT NULL,
    PRIMARY KEY (`id`)
);

CREATE TABLE `companies` (
    `id` INT AUTO_INCREMENT,
    `name` VARCHAR (32) NOT NULL UNIQUE,
    `industry`VARCHAR (16) NOT NULL,
    `location` VARCHAR (32) NOT NULL,
    PRIMARY KEY (`id`)
);

CREATE TABLE `connections_with_people` (
    `user_1` INT NOT NULL,
    `user_2` INT NOT NULL,
    FOREIGN KEY (`user_1`) REFERENCES `users`(`id`),
    FOREIGN KEY (`user_2`) REFERENCES `users`(`id`),
    CHECK (`user_1` != `user_2`)
);

CREATE TABLE `connections_with_schools` (
    `user_id` INT NOT NULL,
    `school_id` INT NOT NULL,
    `start_date` DATE NOT NULL,
    `end_date` DATE,
    `degree` VARCHAR (8) NOT NULL,
    FOREIGN KEY (`user_id`) REFERENCES `users`(`id`),
    FOREIGN KEY (`school_id`) REFERENCES `schools`(`id`)
);

CREATE TABLE `connections_with_companies` (
    `user_id` INT NOT NULL,
    `company_id` INT NOT NULL,
    `start_date` DATE NOT NULL,
    `end_date` DATE,
    FOREIGN KEY (`user_id`) REFERENCES `users`(`id`),
    FOREIGN KEY (`company_id`) REFERENCES `companies`(`id`)
);
