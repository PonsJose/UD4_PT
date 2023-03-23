-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Tarifa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tarifa` (
  `CIne` INT NOT NULL,
  `Tipos` VARCHAR(20) NOT NULL,
  `Precios` FLOAT NOT NULL,
  PRIMARY KEY (`CIne`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`CIne`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`CIne` (
  `Nombre` VARCHAR(30) NOT NULL,
  `DIrecciones` VARCHAR(100) NOT NULL,
  `Teléfono` VARCHAR(20) NOT NULL,
  `Población` VARCHAR(40) NOT NULL,
  `Número de salas` INT NOT NULL)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Película`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Película` (
  `Título` VARCHAR(100) NOT NULL,
  `Clasificación` VARCHAR(20) NULL,
  `Género` VARCHAR(20) NOT NULL,
  `Director` VARCHAR(50) NOT NULL,
  `Durada` VARCHAR(9) NOT NULL)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Proyección`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Proyección` (
  `CIne` INT NOT NULL,
  `Película` INT NOT NULL,
  `Hora` TIME NOT NULL,
  `Sala` INT NOT NULL,
  `Fecha` DATE NOT NULL,
  PRIMARY KEY (`CIne`, `Película`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
