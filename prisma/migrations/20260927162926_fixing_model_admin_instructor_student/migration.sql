/*
  Warnings:

  - Added the required column `updated_at` to the `table_admins` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updated_at` to the `table_instructors` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updated_at` to the `table_students` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `table_admins` ADD COLUMN `gender` ENUM('Male', 'Female') NULL,
    ADD COLUMN `housePhone` VARCHAR(20) NULL,
    ADD COLUMN `updated_at` DATETIME(3) NOT NULL;

-- AlterTable
ALTER TABLE `table_instructors` ADD COLUMN `gender` ENUM('Male', 'Female') NULL,
    ADD COLUMN `housePhone` VARCHAR(20) NULL,
    ADD COLUMN `updated_at` DATETIME(3) NOT NULL;

-- AlterTable
ALTER TABLE `table_students` ADD COLUMN `father` VARCHAR(100) NULL,
    ADD COLUMN `gender` ENUM('Male', 'Female') NULL,
    ADD COLUMN `housePhone` VARCHAR(20) NULL,
    ADD COLUMN `mother` VARCHAR(100) NULL,
    ADD COLUMN `updated_at` DATETIME(3) NOT NULL;
