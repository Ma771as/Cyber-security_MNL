-- In this SQL file, write (and comment!) the typical SQL queries users will run on your database

-- Insert data in a table
INSERT INTO `Sources` (
    `name`,
    `type`,
    `trust`,
) VALUES
    ('Cybersecurity Watchdog', 'External Report', 'Medium'),
    ('BlogInfo.com', 'Blog', 'Low'),
    ('OSINT Radar', 'Open Source', 'Medium'),
    ('Interior Minister', 'Classified', 'High');


-- What are the most recent events related to the "Technologic" field?
SELECT * FROM `view_EventSource`
WHERE `category` = 'Technological'
AND `event_date` >= CURDATE() - INTERVAL 30 DAY
ORDER BY `event_date` DESC;

-- How many entities have an active relationship (without end-date) with an level of importance 'High'?
SELECT COUNT(DISTINCT `r`.`prime_entity_id`) AS `Total_Active_Entities` FROM `Relationships` AS `r`
JOIN `Entities` AS `e` ON `r`.`prime_entity_id` = `e`.`id`
WHERE `e`.`importance` = 'High' AND `end_date` IS NULL;

-- Which 'Previsions' have an higher than 80% of ocurring and are still 'pending'
SELECT * FROM `view_LivePrevisions`;

-- Which 'Sources' of 'low' trust have actually produced registered events?
SELECT DISTINCT
    `s`.`id`,
    `s`.`name`,
    `s`.`type`,
    `s`.`trust`
FROM `Sources` AS `s` JOIN `Events` AS `e`
ON `s`.`id` = `e`.`source_id`
WHERE `s`.`trust` = 'Low';

-- Which entities of the 'Business' type are present in more than 3 'Relationships'?
SELECT `prime_entity_id`, COUNT(*) AS `Active_Relationship` FROM `Relationships`
WHERE `end_date` IS NULL
GROUP BY `prime_entity_id` HAVING `Active_Relationship` > 3;

-- Which 'Raw-Data' were obtained after a specific event?
SELECT COUNT(*) AS 'Data_Total' FROM `Raw_Data`
WHERE `retrieval_date` > (
    SELECT `event_date` FROM `Events`
    WHERE `id` = -- Insert ID specific event
);
-- How many analysis were performed by a specific Author?
SELECT COUNT(*) AS `Analysis_per_Author` FROM `Analysis`
WHERE `author_id` = -- Insert ID specific Author;
