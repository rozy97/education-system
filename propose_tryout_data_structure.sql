-- this table represents user
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL, -- must be unique
  `username` varchar(15) NOT NULL, -- must be unique
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `level` int NOT NULL,
  `status` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
)

-- this table represent quiz (ex: Ujian Nasional Matematika 2023)
-- created, and deleted by admin
-- cannot change after release to public
CREATE TABLE `quizes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `images` varchar(1000) NOT NULL,
  `duration` varchar(255) NOT NULL, -- duration in seconds
  `level` int NOT NULL,
  `label` varchar(255) NOT NULL,
  `tag` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
)

-- this table represent questions that belong to quiz
-- created, and deleted by admin
-- cannot change after release to public
CREATE TABLE `quiz_questions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `quiz_id` int NOT NULL, -- reference to quizes.id
  `description` text NOT NULL,
  `images` varchar(1000) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
)

-- this table represent options that belong to question
-- created, and deleted by admin
-- cannot change after release to public
CREATE TABLE `quiz_question_options` (
  `id` int NOT NULL AUTO_INCREMENT,
  `quiz_question_id` int NOT NULL, -- reference to quizes.id
  `description` text NOT NULL,
  `images` varchar(1000) NOT NULL,
  `is_correct` tinyint NOT NULL, -- 0 or 1 represent true or false
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
)

-- this table represent quiz that bought by user
-- data created when user buy the quiz
-- quiz_start filled with current_timestamp when user start the quiz
-- quiz_end = quiz_start + duration
CREATE TABLE `user_quizes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL, -- reference to users.id
  `quiz_id` int NOT NULL, -- reference to quizes.id
  `quiz_start` datetime DEFAULT CURRENT_TIMESTAMP, -- filled when user start the quiz
  `quiz_end` datetime DEFAULT CURRENT_TIMESTAMP, -- start + quizes.duration
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
)

-- this table represent answer by user
-- can only be made after user start the quiz
CREATE TABLE `user_quiz_answers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_quiz_id` int NOT NULL, -- reference to user_quizes.id
  `quiz_question_id` int NOT NULL, -- reference to quiz_questions.id
  `answer_id` int NOT NULL, -- reference to quiz_question_options.id
  `is_correct` tinyint NOT NULL, -- represent answer status (correct or not)
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
)
