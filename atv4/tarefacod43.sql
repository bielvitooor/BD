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
-- Table `mydb`.`enfermeiraChefe`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`enfermeiraChefe` (
  `cre` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  PRIMARY KEY (`cre`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`enfermeira`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`enfermeira` (
  `cre` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  `enfermeiraChefe_cre` INT NOT NULL,
  PRIMARY KEY (`cre`, `enfermeiraChefe_cre`),
  INDEX `fk_enfermeira_enfermeiraChefe1_idx` (`enfermeiraChefe_cre` ASC) VISIBLE,
  CONSTRAINT `fk_enfermeira_enfermeiraChefe1`
    FOREIGN KEY (`enfermeiraChefe_cre`)
    REFERENCES `mydb`.`enfermeiraChefe` (`cre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`area`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`area` (
  `idareaa` INT NOT NULL,
  `enfermeira_cre` INT NOT NULL,
  PRIMARY KEY (`idareaa`, `enfermeira_cre`),
  INDEX `fk_area_enfermeira1_idx` (`enfermeira_cre` ASC) VISIBLE,
  CONSTRAINT `fk_area_enfermeira1`
    FOREIGN KEY (`enfermeira_cre`)
    REFERENCES `mydb`.`enfermeira` (`cre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`hospital`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`hospital` (
  `cnpj` INT NOT NULL,
  `area_idareaa` INT NOT NULL,
  PRIMARY KEY (`cnpj`, `area_idareaa`),
  INDEX `fk_hospital_area_idx` (`area_idareaa` ASC) VISIBLE,
  CONSTRAINT `fk_hospital_area`
    FOREIGN KEY (`area_idareaa`)
    REFERENCES `mydb`.`area` (`idareaa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`plano`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`plano` (
  `nome` VARCHAR(10) NOT NULL,
  `telefone` VARCHAR(45) NULL,
  `nomeresp` VARCHAR(45) NULL,
  PRIMARY KEY (`nome`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`medico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`medico` (
  `crm` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  `especialidade` VARCHAR(45) NULL,
  `plano_nome` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`crm`, `plano_nome`),
  INDEX `fk_medico_plano1_idx` (`plano_nome` ASC) VISIBLE,
  CONSTRAINT `fk_medico_plano1`
    FOREIGN KEY (`plano_nome`)
    REFERENCES `mydb`.`plano` (`nome`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`paciente]`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`paciente]` (
  `nome` VARCHAR(10) NOT NULL,
  `medico_crm` INT NOT NULL,
  PRIMARY KEY (`nome`, `medico_crm`),
  INDEX `fk_paciente]_medico1_idx` (`medico_crm` ASC) VISIBLE,
  CONSTRAINT `fk_paciente]_medico1`
    FOREIGN KEY (`medico_crm`)
    REFERENCES `mydb`.`medico` (`crm`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
