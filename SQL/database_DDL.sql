CREATE TABLE `guides`(
    `member_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `skill_id` BIGINT NOT NULL
);
ALTER TABLE
    `guides` ADD UNIQUE `guides_skill_id_unique`(`skill_id`);
CREATE TABLE `rented_equipment`(
    `equipment_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `member_id` BIGINT NOT NULL
);
ALTER TABLE
    `rented_equipment` ADD UNIQUE `rented_equipment_member_id_unique`(`member_id`);
CREATE TABLE `expeditions_details`(
    `expedition_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `place` VARCHAR(255) NOT NULL,
    `no_of_days` TINYINT NOT NULL,
    `category` VARCHAR(255) NOT NULL
);
CREATE TABLE `clients`(
    `member_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY
);
CREATE TABLE `clients_reviews`(
    `rewiev_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `reviewed_id` BIGINT NOT NULL,
    `reviewer_id` BIGINT NOT NULL
);
ALTER TABLE
    `clients_reviews` ADD UNIQUE `clients_reviews_reviewed_id_unique`(`reviewed_id`);
ALTER TABLE
    `clients_reviews` ADD UNIQUE `clients_reviews_reviewer_id_unique`(`reviewer_id`);
CREATE TABLE `guides_reviews`(
    `review_id` BIGINT NOT NULL,
    `reviewed_id` BIGINT NOT NULL,
    `reviewer_id` BIGINT NOT NULL,
    PRIMARY KEY(`review_id`)
);
ALTER TABLE
    `guides_reviews` ADD UNIQUE `guides_reviews_reviewed_id_unique`(`reviewed_id`);
ALTER TABLE
    `guides_reviews` ADD UNIQUE `guides_reviews_reviewer_id_unique`(`reviewer_id`);
CREATE TABLE `expeditions`(
    `expedition_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `guides_id` BIGINT NOT NULL,
    `clients_id` BIGINT NOT NULL
);
ALTER TABLE
    `expeditions` ADD UNIQUE `expeditions_guides_id_unique`(`guides_id`);
ALTER TABLE
    `expeditions` ADD UNIQUE `expeditions_clients_id_unique`(`clients_id`);
CREATE TABLE `reviews`(
    `review_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `expedition_id` BIGINT NOT NULL,
    `rating` BIGINT NOT NULL,
    `description` BIGINT NULL
);
ALTER TABLE
    `reviews` ADD UNIQUE `reviews_expedition_id_unique`(`expedition_id`);
CREATE TABLE `skills`(
    `skill_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `skill_id_name` BIGINT NOT NULL
);
CREATE TABLE `equipment_details`(
    `equipment_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `equipment_name` BIGINT NOT NULL,
    `price` DOUBLE(8, 2) NOT NULL
);
CREATE TABLE `members`(
    `member_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `rented_equipment_id` BIGINT NULL,
    `user_name` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `phone` VARCHAR(255) NOT NULL,
    `password` VARCHAR(255) NOT NULL,
    `age` TINYINT NOT NULL,
    `first_name` VARCHAR(255) NOT NULL,
    `last_name` VARCHAR(255) NOT NULL
);
ALTER TABLE
    `members` ADD UNIQUE `members_rented_equipment_id_unique`(`rented_equipment_id`);
ALTER TABLE
    `reviews` ADD CONSTRAINT `reviews_review_id_foreign` FOREIGN KEY(`review_id`) REFERENCES `guides_reviews`(`review_id`);
ALTER TABLE
    `guides` ADD CONSTRAINT `guides_member_id_foreign` FOREIGN KEY(`member_id`) REFERENCES `members`(`member_id`);
ALTER TABLE
    `expeditions` ADD CONSTRAINT `expeditions_guides_id_foreign` FOREIGN KEY(`guides_id`) REFERENCES `guides`(`member_id`);
ALTER TABLE
    `expeditions_details` ADD CONSTRAINT `expeditions_details_expedition_id_foreign` FOREIGN KEY(`expedition_id`) REFERENCES `expeditions`(`expedition_id`);
ALTER TABLE
    `members` ADD CONSTRAINT `members_rented_equipment_id_foreign` FOREIGN KEY(`rented_equipment_id`) REFERENCES `rented_equipment`(`equipment_id`);
ALTER TABLE
    `guides` ADD CONSTRAINT `guides_skill_id_foreign` FOREIGN KEY(`skill_id`) REFERENCES `skills`(`skill_id`);
ALTER TABLE
    `guides_reviews` ADD CONSTRAINT `guides_reviews_reviewer_id_foreign` FOREIGN KEY(`reviewer_id`) REFERENCES `clients`(`member_id`);
ALTER TABLE
    `clients_reviews` ADD CONSTRAINT `clients_reviews_reviewed_id_foreign` FOREIGN KEY(`reviewed_id`) REFERENCES `clients`(`member_id`);
ALTER TABLE
    `reviews` ADD CONSTRAINT `reviews_review_id_foreign` FOREIGN KEY(`review_id`) REFERENCES `clients_reviews`(`rewiev_id`);
ALTER TABLE
    `clients_reviews` ADD CONSTRAINT `clients_reviews_reviewer_id_foreign` FOREIGN KEY(`reviewer_id`) REFERENCES `guides`(`member_id`);
ALTER TABLE
    `guides_reviews` ADD CONSTRAINT `guides_reviews_reviewed_id_foreign` FOREIGN KEY(`reviewed_id`) REFERENCES `guides`(`member_id`);
ALTER TABLE
    `expeditions` ADD CONSTRAINT `expeditions_clients_id_foreign` FOREIGN KEY(`clients_id`) REFERENCES `clients`(`member_id`);
ALTER TABLE
    `clients` ADD CONSTRAINT `clients_member_id_foreign` FOREIGN KEY(`member_id`) REFERENCES `members`(`member_id`);
ALTER TABLE
    `rented_equipment` ADD CONSTRAINT `rented_equipment_equipment_id_foreign` FOREIGN KEY(`equipment_id`) REFERENCES `equipment_details`(`equipment_id`);