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
-- Table `mydb`.`Matricula`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Matricula` (
  `Date` DATE NOT NULL,
  `Alumne` VARCHAR(10) NOT NULL,
  `Assignatura` INT NULL,
  PRIMARY KEY (`Alumne`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Alumne`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Alumne` (
  `DNI` VARCHAR(10) NOT NULL,
  `Nom` VARCHAR(40) NOT NULL,
  `Cognoms` VARCHAR(100) NOT NULL,
  `Email` VARCHAR(150) NULL,
  `Telefon` VARCHAR(20) NULL,
  `Adreça` VARCHAR(100) NOT NULL,
  `Matricula_Alumne` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`DNI`),
  INDEX `fk_Alumne_Matricula_idx` (`Matricula_Alumne` ASC) VISIBLE,
  CONSTRAINT `fk_Alumne_Matricula`
    FOREIGN KEY (`Matricula_Alumne`)
    REFERENCES `mydb`.`Matricula` (`Alumne`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Profesor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Profesor` (
  `DNI` VARCHAR(10) NOT NULL,
  `Nom` VARCHAR(40) NOT NULL,
  `Cognoms` VARCHAR(100) NOT NULL,
  `Titulació` VARCHAR(50) NOT NULL,
  `Departament` INT NULL,
  `Cap de Departament` VARCHAR(40) NULL,
  PRIMARY KEY (`DNI`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Assignatura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Assignatura` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Nom` TINYINT NOT NULL,
  `Credits` INT NOT NULL,
  `Departament` VARCHAR(10) NOT NULL,
  `Profesor` VARCHAR(45) NULL,
  `Matricula_Alumne` VARCHAR(10) NOT NULL,
  `Profesor_DNI` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`ID`, `Profesor_DNI`),
  INDEX `fk_Assignatura_Matricula1_idx` (`Matricula_Alumne` ASC) VISIBLE,
  INDEX `fk_Assignatura_Profesor1_idx` (`Profesor_DNI` ASC) VISIBLE,
  CONSTRAINT `fk_Assignatura_Matricula1`
    FOREIGN KEY (`Matricula_Alumne`)
    REFERENCES `mydb`.`Matricula` (`Alumne`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Assignatura_Profesor1`
    FOREIGN KEY (`Profesor_DNI`)
    REFERENCES `mydb`.`Profesor` (`DNI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Departament`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Departament` (
  `ID` INT NULL AUTO_INCREMENT,
  `Nom` VARCHAR(30) NOT NULL)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
