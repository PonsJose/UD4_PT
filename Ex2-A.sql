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
-- Table `mydb`.`Paciente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Paciente` (
  `DNI` VARCHAR(10) NOT NULL,
  `Nombre` VARCHAR(40) NOT NULL,
  `Apellidos` VARCHAR(100) NOT NULL,
  `Teĺéfono` VARCHAR(20) NOT NULL,
  `Dirección` VARCHAR(100) NOT NULL,
  `Número_SS` VARCHAR(12) NOT NULL,
  PRIMARY KEY (`DNI`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Médico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Médico` (
  `Número_Colegiado` VARCHAR(9) NOT NULL,
  `Nombre` VARCHAR(40) NOT NULL,
  `Apellidos` VARCHAR(100) NOT NULL,
  `Especialidad` VARCHAR(20) NOT NULL,
  `Cargo` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`Número_Colegiado`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Consulta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Consulta` (
  `Fecha` DATE NOT NULL,
  `Cama` INT NOT NULL,
  `Planta` INT NOT NULL,
  `Diagnóstico` VARCHAR(255) NOT NULL,
  `Paciente_DNI` VARCHAR(10) NOT NULL,
  `Médico_Número_Colegiado` VARCHAR(9) NOT NULL,
  INDEX `fk_Consulta_Paciente_idx` (`Paciente_DNI` ASC) VISIBLE,
  INDEX `fk_Consulta_Médico1_idx` (`Médico_Número_Colegiado` ASC) VISIBLE,
  CONSTRAINT `fk_Consulta_Paciente`
    FOREIGN KEY (`Paciente_DNI`)
    REFERENCES `mydb`.`Paciente` (`DNI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Consulta_Médico1`
    FOREIGN KEY (`Médico_Número_Colegiado`)
    REFERENCES `mydb`.`Médico` (`Número_Colegiado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
