SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Room`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Room` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`Room` (
  `room_id` CHAR NOT NULL ,
  `room_max_capacity` INT NULL ,
  `room_location` CHAR NULL ,
  PRIMARY KEY (`room_id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Course`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Course` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`Course` (
  `course_id` CHAR NOT NULL ,
  `course_name` VARCHAR(45) NULL ,
  `course_description` VARCHAR(45) NULL ,
  `course_outcome` VARCHAR(45) NULL ,
  `course_prerequisite` VARCHAR(45) NULL ,
  PRIMARY KEY (`course_id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Unit`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Unit` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`Unit` (
  `unit_id` CHAR NOT NULL ,
  `unit_title` VARCHAR(45) NULL ,
  `unit_description` VARCHAR(45) NULL ,
  PRIMARY KEY (`unit_id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Lecturer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Lecturer` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`Lecturer` (
  `lecturer_id` INT NOT NULL AUTO_INCREMENT ,
  `lecturer_name` VARCHAR(45) NULL ,
  `lecturer_surname` VARCHAR(45) NULL ,
  `lecturer_email` VARCHAR(45) NULL ,
  `lecturer_department` VARCHAR(45) NULL ,
  PRIMARY KEY (`lecturer_id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Student`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Student` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`Student` (
  `student_id` INT NOT NULL AUTO_INCREMENT ,
  `student_name` VARCHAR(45) NULL ,
  `student_surname` VARCHAR(45) NULL ,
  `student_email` VARCHAR(45) NULL ,
  PRIMARY KEY (`student_id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`TimeTable`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`TimeTable` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`TimeTable` (
  `timetable_id` INT NOT NULL AUTO_INCREMENT ,
  `day_of_week` CHAR NULL ,
  `time` CHAR NULL ,
  `room_id` CHAR NOT NULL ,
  `course_id` CHAR NOT NULL ,
  `unit_id` CHAR NOT NULL ,
  `student_id` INT NOT NULL ,
  `lecturer_id` INT NOT NULL ,
  PRIMARY KEY (`timetable_id`, `room_id`, `course_id`, `unit_id`, `student_id`, `lecturer_id`) ,
  INDEX `fk_TimeTable_Room` (`room_id` ASC) ,
  INDEX `fk_TimeTable_Course1` (`course_id` ASC) ,
  INDEX `fk_TimeTable_Unit1` (`unit_id` ASC) ,
  INDEX `fk_TimeTable_Student1` (`student_id` ASC) ,
  INDEX `fk_TimeTable_Lecturer1` (`lecturer_id` ASC) ,
  CONSTRAINT `fk_TimeTable_Room`
    FOREIGN KEY (`room_id` )
    REFERENCES `mydb`.`Room` (`room_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TimeTable_Course1`
    FOREIGN KEY (`course_id` )
    REFERENCES `mydb`.`Course` (`course_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TimeTable_Unit1`
    FOREIGN KEY (`unit_id` )
    REFERENCES `mydb`.`Unit` (`unit_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TimeTable_Student1`
    FOREIGN KEY (`student_id` )
    REFERENCES `mydb`.`Student` (`student_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TimeTable_Lecturer1`
    FOREIGN KEY (`lecturer_id` )
    REFERENCES `mydb`.`Lecturer` (`lecturer_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
