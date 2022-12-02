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
-- Table `mydb`.`medico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`medico` (
  `idmedico` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  `sexo` VARCHAR(45) NULL,
  `datanascimendo` DATE NULL,
  `endereco` VARCHAR(45) NULL,
  `crm` INT NULL,
  PRIMARY KEY (`idmedico`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`paciente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`paciente` (
  `idpaciente` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  `sexo` VARCHAR(45) NULL,
  `datanascimendo` DATE NULL,
  `endereco` VARCHAR(45) NULL,
  `cpf` BIGINT(11) NULL,
  PRIMARY KEY (`idpaciente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`consulta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`consulta` (
  `idconsulta` INT NOT NULL,
  `data` DATE NULL,
  `hora` TIME NULL,
  `medico_idmedico` INT NOT NULL,
  `paciente_idpaciente` INT NOT NULL,
  PRIMARY KEY (`idconsulta`),
  INDEX `fk_consulta_medico1_idx` (`medico_idmedico` ASC) VISIBLE,
  INDEX `fk_consulta_paciente1_idx` (`paciente_idpaciente` ASC) VISIBLE,
  CONSTRAINT `fk_consulta_medico1`
    FOREIGN KEY (`medico_idmedico`)
    REFERENCES `mydb`.`medico` (`idmedico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_consulta_paciente1`
    FOREIGN KEY (`paciente_idpaciente`)
    REFERENCES `mydb`.`paciente` (`idpaciente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`medicamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`medicamento` (
  `idmedicamento` INT NOT NULL,
  `descricao` VARCHAR(45) NULL,
  PRIMARY KEY (`idmedicamento`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`consulta_has_medicamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`consulta_has_medicamento` (
  `consulta_idconsulta` INT NOT NULL,
  `medicamento_idmedicamento` INT NOT NULL,
  PRIMARY KEY (`consulta_idconsulta`, `medicamento_idmedicamento`),
  INDEX `fk_consulta_has_medicamento_medicamento1_idx` (`medicamento_idmedicamento` ASC) VISIBLE,
  INDEX `fk_consulta_has_medicamento_consulta_idx` (`consulta_idconsulta` ASC) VISIBLE,
  CONSTRAINT `fk_consulta_has_medicamento_consulta`
    FOREIGN KEY (`consulta_idconsulta`)
    REFERENCES `mydb`.`consulta` (`idconsulta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_consulta_has_medicamento_medicamento1`
    FOREIGN KEY (`medicamento_idmedicamento`)
    REFERENCES `mydb`.`medicamento` (`idmedicamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`exame`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`exame` (
  `idexame` INT NOT NULL,
  `descricao` VARCHAR(45) NULL,
  PRIMARY KEY (`idexame`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`consulta_has_exame`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`consulta_has_exame` (
  `consulta_idconsulta` INT NOT NULL,
  `exame_idexame` INT NOT NULL,
  PRIMARY KEY (`consulta_idconsulta`, `exame_idexame`),
  INDEX `fk_consulta_has_exame_exame1_idx` (`exame_idexame` ASC) VISIBLE,
  INDEX `fk_consulta_has_exame_consulta1_idx` (`consulta_idconsulta` ASC) VISIBLE,
  CONSTRAINT `fk_consulta_has_exame_consulta1`
    FOREIGN KEY (`consulta_idconsulta`)
    REFERENCES `mydb`.`consulta` (`idconsulta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_consulta_has_exame_exame1`
    FOREIGN KEY (`exame_idexame`)
    REFERENCES `mydb`.`exame` (`idexame`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;



