-- MySQL Script generated by MySQL Workbench
-- Mon Feb 10 18:21:39 2023
-- Model: Resilia New    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema resiliaNew
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema resiliaNew
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `resiliaNew` DEFAULT CHARACTER SET utf8 ;
USE `resiliaNew` ;

-- -----------------------------------------------------
-- Table `resiliaNew`.`students`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `resiliaNew`.`students` (
  `id` INT NOT NULL,
  `cpf` VARCHAR(11) NOT NULL,
  `name` VARCHAR(90) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  `phone_number` CHAR(14) NOT NULL,
  `photo` VARCHAR(90) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `resiliaNew`.`enrollment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `resiliaNew`.`enrollment` (
  `id` INT NOT NULL,
  `enroll_date` DATE NOT NULL,
  `students_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_enrollment_students1_idx` (`students_id` ASC) VISIBLE,
  CONSTRAINT `fk_enrollment_students1`
    FOREIGN KEY (`students_id`)
    REFERENCES `resiliaNew`.`students` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `resiliaNew`.`courses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `resiliaNew`.`courses` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `duration` INT NOT NULL,
  `availability` TINYINT NOT NULL,
  `description` LONGTEXT NULL,
  `enrollment_id` INT NOT NULL,
  `enrollment_class_id` INT NOT NULL,
  `enrollment_student_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_courses_enrollment1_idx` (`enrollment_id` ASC, `enrollment_class_id` ASC, `enrollment_student_id` ASC) VISIBLE,
  CONSTRAINT `fk_courses_enrollment1`
    FOREIGN KEY (`enrollment_id`)
    REFERENCES `resiliaNew`.`enrollment` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `resiliaNew`.`facilitators`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `resiliaNew`.`facilitators` (
  `id` INT NOT NULL,
  `name` VARCHAR(100) NOT NULL,
  `cpf` VARCHAR(11) NOT NULL,
  `phone_number` CHAR(14) NOT NULL,
  `photo` VARCHAR(90) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `resiliaNew`.`class`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `resiliaNew`.`class` (
  `id` INT NOT NULL,
  `opening` DATE NOT NULL,
  `closure` DATE NOT NULL,
  `courses_id` INT NOT NULL,
  `facilitators_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_class_courses1_idx` (`courses_id` ASC) VISIBLE,
  INDEX `fk_class_facilitators1_idx` (`facilitators_id` ASC) VISIBLE,
  CONSTRAINT `fk_class_courses1`
    FOREIGN KEY (`courses_id`)
    REFERENCES `resiliaNew`.`courses` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_class_facilitators1`
    FOREIGN KEY (`facilitators_id`)
    REFERENCES `resiliaNew`.`facilitators` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;