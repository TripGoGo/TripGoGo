drop database tripgogo;

create database tripgogo;

use tripgogo;

-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema tripgogo
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema tripgogo
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `tripgogo` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `tripgogo` ;

-- -----------------------------------------------------
-- Table `tripgogo`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tripgogo`.`user` (
  `user_id` VARCHAR(16) NOT NULL,
  `user_name` VARCHAR(20) NOT NULL,
  `user_password` VARCHAR(16) NOT NULL,
  `email` VARCHAR(20) NOT NULL,
  `join_date` TIMESTAMP NOT NULL default current_timestamp,
  PRIMARY KEY (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `tripgogo`.`board`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tripgogo`.`board` (
  `article_no` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `user_id` VARCHAR(16) NOT NULL,
  `subject` VARCHAR(100) NULL DEFAULT NULL,
  `content` VARCHAR(2000) NULL,
  `hit` INT NOT NULL default 0,
  `register_time` TIMESTAMP NOT NULL default current_timestamp,
  PRIMARY KEY (`article_no`),
  INDEX `user_id_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `tripgogo`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `tripgogo`.`city_info`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tripgogo`.`city_info` (
  `address` VARCHAR(20) NOT NULL,
  `city_info_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`city_info_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `tripgogo`.`mytrip`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tripgogo`.`mytrip` (
  `mytrip_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `start_date` DATE NOT NULL,
  `end_date` DATE NOT NULL,
  `period` INT NOT NULL,
  `companion` VARCHAR(20) NOT NULL,
  `trip_style` VARCHAR(20) NOT NULL,
  `user_id` VARCHAR(16) NOT NULL,
  PRIMARY KEY (`mytrip_id`),
  INDEX `user_id_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `mytrip_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `tripgogo`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `tripgogo`.`place`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tripgogo`.`place` (
  `place_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `mytrip_id` BIGINT(20) NOT NULL,
  `user_id` VARCHAR(16) NOT NULL,
  `place_name` VARCHAR(50) NOT NULL,
  `category` VARCHAR(20) NULL DEFAULT NULL,
  `x` VARCHAR(20) NOT NULL,
  `y` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`place_id`),
  INDEX `mytrip_id_idx` (`mytrip_id` ASC) VISIBLE,
  INDEX `user_id_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `mytrip_id`
    FOREIGN KEY (`mytrip_id`)
    REFERENCES `tripgogo`.`mytrip` (`mytrip_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `place_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `tripgogo`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


insert into `tripgogo`.`user` (user_id, user_name, user_password, email, join_date)
values     ('ssafy', '김싸피', '1234', 'ssafy@ssafy.com', now()), 
        ('admin', '관리자', '1234', 'admin@google.com', now());


select * from user;
