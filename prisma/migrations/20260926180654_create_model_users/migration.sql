-- CreateTable
CREATE TABLE `table_users` (
    `id` VARCHAR(191) NOT NULL,
    `name` VARCHAR(200) NOT NULL,
    `slug` VARCHAR(250) NOT NULL,
    `hp` VARCHAR(20) NOT NULL,
    `password` VARCHAR(250) NOT NULL,
    `role` ENUM('Admin', 'Instructor', 'Student') NOT NULL,
    `status` ENUM('Active', 'Completed', 'Suspended', 'Resigned') NOT NULL DEFAULT 'Active',
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL,

    UNIQUE INDEX `table_users_slug_key`(`slug`),
    UNIQUE INDEX `table_users_hp_key`(`hp`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `table_admins` (
    `id` VARCHAR(191) NOT NULL,
    `user_id` VARCHAR(191) NOT NULL,
    `admin_number` VARCHAR(100) NOT NULL,
    `birthPlace` VARCHAR(100) NULL,
    `birthDate` DATETIME(3) NULL,
    `religion` VARCHAR(100) NULL,
    `address` TEXT NULL,
    `education` VARCHAR(100) NULL,
    `specialization` VARCHAR(100) NULL,
    `imageUrl` VARCHAR(250) NULL,

    UNIQUE INDEX `table_admins_user_id_key`(`user_id`),
    UNIQUE INDEX `table_admins_admin_number_key`(`admin_number`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `table_instructors` (
    `id` VARCHAR(191) NOT NULL,
    `user_id` VARCHAR(191) NOT NULL,
    `instructor_number` VARCHAR(100) NOT NULL,
    `birthPlace` VARCHAR(100) NULL,
    `birthDate` DATETIME(3) NULL,
    `religion` VARCHAR(100) NULL,
    `address` TEXT NULL,
    `education` VARCHAR(100) NULL,
    `specialization` VARCHAR(100) NULL,
    `imageUrl` VARCHAR(250) NULL,

    UNIQUE INDEX `table_instructors_user_id_key`(`user_id`),
    UNIQUE INDEX `table_instructors_instructor_number_key`(`instructor_number`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `table_students` (
    `id` VARCHAR(191) NOT NULL,
    `user_id` VARCHAR(191) NOT NULL,
    `student_number` VARCHAR(100) NOT NULL,
    `birthPlace` VARCHAR(100) NULL,
    `birthDate` DATETIME(3) NULL,
    `religion` VARCHAR(100) NULL,
    `address` TEXT NULL,
    `major` VARCHAR(100) NULL,
    `imageUrl` VARCHAR(250) NULL,

    UNIQUE INDEX `table_students_user_id_key`(`user_id`),
    UNIQUE INDEX `table_students_student_number_key`(`student_number`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `table_admins` ADD CONSTRAINT `table_admins_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `table_users`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `table_instructors` ADD CONSTRAINT `table_instructors_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `table_users`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `table_students` ADD CONSTRAINT `table_students_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `table_users`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
