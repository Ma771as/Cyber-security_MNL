-- In this SQL file, write (and comment!) the schema of your database, including the CREATE TABLE, CREATE INDEX, CREATE VIEW, etc. statements that compose it
CREATE DATABASE `Intel`;
USE `Intel`;

-- docker container run --name mysql -p 3306:3306 -v /workspaces/$RepositoryName:/mnt -e MYSQL_ROOT_PASSWORD=crimson -d mysql
-- mysql -h 127.0.0.1 -P 3306 -u root -p
-- SHOW CREATE DATABASE Intel;
-- SHOW CREATE TABLE Tablename;

-- Sources - Where does Intel come From
CREATE TABLE `Sources` (
    `id` INT AUTO_INCREMENT NOT NULL,
    `name` VARCHAR(50) NOT NULL,
    `type` ENUM('Social Media', 'Open Source', 'Classified', 'Business', 'External Report', 'Blog', 'Other') NOT NULL,
    `trust` ENUM('High', 'Medium', 'Low') NOT NULL,
    `last_check` DATETIME NOT NULL,
    PRIMARY KEY(`id`)
);

-- Events - What has happened? Classify and Document
CREATE TABLE `Events` (
    `id` INT AUTO_INCREMENT NOT NULL,
    `source_id` INT NOT NULL,
    `title` VARCHAR(100) NOT NULL,
    `description` VARCHAR(255) NOT NULL,
    `event_date` DATETIME,
    `place` VARCHAR(50) NOT NULL,
    `category` ENUM('Political', 'Social', 'Military', 'Economic', 'Technological', 'other') NOT NULL,
    PRIMARY KEY(`id`),
    FOREIGN KEY(`source_id`) REFERENCES `Sources`(`id`)
);

-- Authors - Who is publishing this info?
CREATE TABLE `Authors` (
    `id` INT AUTO_INCREMENT NOT NULL,
    `name` VARCHAR(255),
    `role` VARCHAR(50),
    PRIMARY KEY(`id`)
);

-- Entities - Who is involved in the Events
-- TODO define importance scale
CREATE TABLE `Entities` (
    `id` INT AUTO_INCREMENT NOT NULL,
    `name` VARCHAR(50) NOT NULL,
    `type` ENUM('Individual', 'Group', 'OCG', 'Business', 'Government') NOT NULL,
    `description` TEXT NOT NULL,
    `place` VARCHAR(100) NOT NULL,
    `importance` ENUM('High', 'Medium', 'Low') NOT NULL
);

-- Relationships - What happened between 2 entities
CREATE TABLE `Relationships` (
    `id` INT AUTO_INCREMENT NOT NULL,
    `prime_entity_id` INT UNSIGNED NOT NULL,
    `second_entity_id` INT UNSIGNED NOT NULL,
    `relation_type` VARCHAR(255) NOT NULL,
    `start_date` DATE NOT NULL,
    `end_date` DATE NULL,
    PRIMARY KEY(`id`),
    FOREIGN KEY(`prime_entity_id`) REFERENCES `Entities`(`id`),
    FOREIGN KEY(`second_entity_id`) REFERENCES `Entities`(`id`)
);

-- Raw-data - What has emerged from an event?
CREATE TABLE `Raw_Data` (
    `id` INT AUTO_INCREMENT NOT NULL,
    `source_id` INT UNSIGNED NOT NULL,
    `content_format` ENUM('Video', 'Text', 'Audio', 'Immage', 'Other') NOT NULL,
    -- 'URL' for the source of video or image
    -- 'Body' For the content of text
    `retrieval_date` DATETIME NOT NULL,
    PRIMARY KEY(`id`),
    FOREIGN KEY(`source_id`) REFERENCES `Sources`(`id`)
);

-- Analysis - What Insights have emerged from raw-data?
CREATE TABLE `Analysis` (
    `id` INT AUTO_INCREMENT NOT NULL,
    `event_id` INT UNSIGNED NOT NULL,
    `author_id` INT UNSIGNED NOT NULL,
    `title` VARCHAR(50),
    `creation_date` DATETIME NOT NULL,
    PRIMARY KEY(`id`),
    FOREIGN KEY(`event_id`) REFERENCES `Events`(`id`),
    FOREIGN KEY(`author_id`) REFERENCES `Authors`(`id`)
);
-- Previsions - What is expected in the future based on the Analysis?
CREATE TABLE `Previsions` (
    `id` INT AUTO_INCREMENT NOT NULL,
    `analysis_id` INT UNSIGNED NOT NULL,
    `description` TEXT NOT NULL,
    `probability` DECIMAL(4,2) NOT NULL,
    `creation_date` DATETIME NOT NULL,
    `status` ENUM('Pending', 'Verified', 'Rejected') DEFAULT 'Pending',
    PRIMARY KEY(`id`),
    FOREIGN KEY(`analysis_id`) REFERENCES `Analysis`(`id`)
);


-- VIEW Event and Sources
CREATE VIEW `view_EventSource` AS
SELECT
    `e`.`id`,
    `e`.`title`,
    `e`.`description`,
    `e`.`event_date`,
    `e`.`place`,
    `e`.`category`,
    `s`.`name` AS 'Source_name',
    `s`.`type` AS 'Source_type',
    `s`.`trust`
FROM `Events` AS `e` JOIN `Sources` AS `s`
ON `e`.`source_id` = `s`.`id`;

-- VIEW Previsions and Analysis
CREATE VIEW `view_LivePrevisions` AS
SELECT
    `p`.`id`,
    `p`.`description`,
    `p`.`probability`,
    `p`.`creation_date`,
    `p`.`status`,
    `a`.`title` AS `Analysis_title`
FROM `Previsions` AS `p` JOIN `Analysis` AS `a`
ON `p`.`analysis_id` = `a`.`id`
WHERE  `p`.`status` = 'Pending' AND `p`.`probability` >= 80;

-- Create INDEX to speed-up repeated searches
CREATE INDEX `idx_event_DataCategory`
ON `Events`(`category`, `event_date`);

CREATE INDEX `idx_previsions_PerStatus`
ON `Previsions`(`probability`, `status`);


-- ONLY IF NEEDED
-- CHANGE COLUMN NAME TO A TABLE
ALTER TABLE --`Events`
CHANGE COLUMN --`type`
    `category` VARCHAR(100);

-- ADD A NEW COLUMN TO A TABLE
ALTER TABLE --`Events`
ADD COLUMN --`risk`
    VARCHAR(100) DEFAULT NULL;

-- ADD A NEW COLUMN TO A TABLE
ALTER TABLE --`Events`
MODIFY COLUMN --`risk`
    VARCHAR(150);



