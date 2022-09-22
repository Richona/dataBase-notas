-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema entregaIndividual
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema entregaIndividual
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `entregaIndividual` DEFAULT CHARACTER SET utf8 ;
USE `entregaIndividual` ;

-- -----------------------------------------------------
-- Table `entregaIndividual`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `entregaIndividual`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `entregaIndividual`.`notes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `entregaIndividual`.`notes` (
  `id` INT NOT NULL,
  `title` VARCHAR(100) NOT NULL,
  `fecha_creacion` DATE NOT NULL,
  `fecha_modificacion` DATE NOT NULL,
  `descripcion` VARCHAR(45) NOT NULL,
  `puede_eliminarse` TINYINT NULL DEFAULT 0,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_notes_users_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_notes_users`
    FOREIGN KEY (`user_id`)
    REFERENCES `entregaIndividual`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `entregaIndividual`.`categoryes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `entregaIndividual`.`categoryes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `entregaIndividual`.`notes_categoryes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `entregaIndividual`.`notes_categoryes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `note_id` INT NOT NULL,
  `category_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_notes_categoryes_idx` (`category_id` ASC) VISIBLE,
  INDEX `fk_categoryes_notes_idx` (`note_id` ASC) VISIBLE,
  CONSTRAINT `fk_notes_categoryes`
    FOREIGN KEY (`category_id`)
    REFERENCES `entregaIndividual`.`categoryes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_categoryes_notes`
    FOREIGN KEY (`note_id`)
    REFERENCES `entregaIndividual`.`notes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
