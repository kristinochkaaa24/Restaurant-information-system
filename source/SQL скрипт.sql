-- MySQL Script generated by MySQL Workbench
-- Mon Dec  4 00:40:56 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema restaurant db
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema restaurant db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `restaurant db` DEFAULT CHARACTER SET utf8 ;
USE `restaurant db` ;

-- -----------------------------------------------------
-- Table `restaurant db`.`product*`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restaurant db`.`product*` (
  `product id` INT NOT NULL AUTO_INCREMENT,
  `ingredient` VARCHAR(200) NOT NULL,
  `amount` INT NOT NULL,
  `price` FLOAT NOT NULL,
  PRIMARY KEY (`product id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restaurant db`.`client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restaurant db`.`client` (
  `id client` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `email` VARCHAR(20) NOT NULL,
  `password` VARCHAR(20) NOT NULL,
  `table number` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id client`),
  CONSTRAINT `id client `
    FOREIGN KEY (`id client`)
    REFERENCES `restaurant db`.`product*` (`product id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restaurant db`.`dishes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restaurant db`.`dishes` (
  `dish id` INT NOT NULL AUTO_INCREMENT,
  `category dish` INT NOT NULL,
  `calories` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`dish id`),
  CONSTRAINT `dish id`
    FOREIGN KEY (`dish id`)
    REFERENCES `restaurant db`.`client` (`id client`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restaurant db`.`recipe*`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restaurant db`.`recipe*` (
  `dish` VARCHAR(100) NOT NULL,
  `product id` INT NOT NULL,
  `amount` INT NOT NULL,
  `unit` INT NOT NULL,
  PRIMARY KEY (`product id`),
  CONSTRAINT `dish `
    FOREIGN KEY ()
    REFERENCES `restaurant db`.`dishes` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restaurant db`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restaurant db`.`orders` (
  `order_id` VARCHAR(10) NOT NULL,
  `customer_id` INT NOT NULL,
  `order_date` DATETIME NOT NULL,
  `status` VARCHAR(40) NOT NULL,
  `total_amount` INT NOT NULL,
  PRIMARY KEY (`order_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restaurant db`.`employee*`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restaurant db`.`employee*` (
  `employee id` INT NOT NULL AUTO_INCREMENT,
  `employee name` VARCHAR(45) NOT NULL,
  `employee position` VARCHAR(45) NOT NULL,
  `salary` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`employee id`),
  CONSTRAINT `employee id`
    FOREIGN KEY ()
    REFERENCES `restaurant db`.`orders` ()
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restaurant db`.`restaurant`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restaurant db`.`restaurant` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `city` VARCHAR(50) NOT NULL,
  `street` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `id `
    FOREIGN KEY (`id`)
    REFERENCES `restaurant db`.`employee*` (`employee id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
