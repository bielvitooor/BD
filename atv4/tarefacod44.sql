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
-- Table `mydb`.`reserva`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`reserva` (
  `idreserva` INT NOT NULL,
  `passageiro_nome` VARCHAR(30) NOT NULL,
  `trechosVoos_classe` VARCHAR(45) NOT NULL,
  `passageiro_nome1` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`idreserva`, `trechosVoos_classe`, `passageiro_nome1`),
  INDEX `fk_reserva_trechosVoos1_idx` (`trechosVoos_classe` ASC) VISIBLE,
  INDEX `fk_reserva_passageiro1_idx` (`passageiro_nome1` ASC) VISIBLE,
  CONSTRAINT `fk_reserva_trechosVoos1`
    FOREIGN KEY (`trechosVoos_classe`)
    REFERENCES `mydb`.`trechosVoos` (`classe`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_reserva_passageiro1`
    FOREIGN KEY (`passageiro_nome1`)
    REFERENCES `mydb`.`passageiro` (`nome`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`trechosVoos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`trechosVoos` (
  `data` DATETIME NULL,
  `hora` TIME NULL,
  `classe` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`classe`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`passageiro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`passageiro` (
  `nome` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`nome`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`reserva`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`reserva` (
  `idreserva` INT NOT NULL,
  `passageiro_nome` VARCHAR(30) NOT NULL,
  `trechosVoos_classe` VARCHAR(45) NOT NULL,
  `passageiro_nome1` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`idreserva`, `trechosVoos_classe`, `passageiro_nome1`),
  INDEX `fk_reserva_trechosVoos1_idx` (`trechosVoos_classe` ASC) VISIBLE,
  INDEX `fk_reserva_passageiro1_idx` (`passageiro_nome1` ASC) VISIBLE,
  CONSTRAINT `fk_reserva_trechosVoos1`
    FOREIGN KEY (`trechosVoos_classe`)
    REFERENCES `mydb`.`trechosVoos` (`classe`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_reserva_passageiro1`
    FOREIGN KEY (`passageiro_nome1`)
    REFERENCES `mydb`.`passageiro` (`nome`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`acento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`acento` (
  `idacento` INT NOT NULL,
  `reserva_idreserva` INT NOT NULL,
  PRIMARY KEY (`idacento`, `reserva_idreserva`),
  INDEX `fk_acento_reserva1_idx` (`reserva_idreserva` ASC) VISIBLE,
  CONSTRAINT `fk_acento_reserva1`
    FOREIGN KEY (`reserva_idreserva`)
    REFERENCES `mydb`.`reserva` (`idreserva`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`aeronaves`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`aeronaves` (
  `idaeronaves` INT NOT NULL,
  `voos_idvoos` INT NOT NULL,
  PRIMARY KEY (`idaeronaves`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`voos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`voos` (
  `idvoos` INT NOT NULL,
  `origem` VARCHAR(45) NULL,
  `destino` VARCHAR(45) NULL,
  `trechosVoos_classe` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idvoos`, `trechosVoos_classe`),
  INDEX `fk_voos_trechosVoos1_idx` (`trechosVoos_classe` ASC) VISIBLE,
  CONSTRAINT `fk_voos_trechosVoos1`
    FOREIGN KEY (`trechosVoos_classe`)
    REFERENCES `mydb`.`trechosVoos` (`classe`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`aeronaves_has_voos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`aeronaves_has_voos` (
  `aeronaves_idaeronaves` INT NOT NULL,
  `voos_idvoos` INT NOT NULL,
  PRIMARY KEY (`aeronaves_idaeronaves`, `voos_idvoos`),
  INDEX `fk_aeronaves_has_voos_voos1_idx` (`voos_idvoos` ASC) VISIBLE,
  INDEX `fk_aeronaves_has_voos_aeronaves1_idx` (`aeronaves_idaeronaves` ASC) VISIBLE,
  CONSTRAINT `fk_aeronaves_has_voos_aeronaves1`
    FOREIGN KEY (`aeronaves_idaeronaves`)
    REFERENCES `mydb`.`aeronaves` (`idaeronaves`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_aeronaves_has_voos_voos1`
    FOREIGN KEY (`voos_idvoos`)
    REFERENCES `mydb`.`voos` (`idvoos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`aeronaves_has_trechosVoos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`aeronaves_has_trechosVoos` (
  `aeronaves_idaeronaves` INT NOT NULL,
  `trechosVoos_classe` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`aeronaves_idaeronaves`, `trechosVoos_classe`),
  INDEX `fk_aeronaves_has_trechosVoos_trechosVoos1_idx` (`trechosVoos_classe` ASC) VISIBLE,
  INDEX `fk_aeronaves_has_trechosVoos_aeronaves1_idx` (`aeronaves_idaeronaves` ASC) VISIBLE,
  CONSTRAINT `fk_aeronaves_has_trechosVoos_aeronaves1`
    FOREIGN KEY (`aeronaves_idaeronaves`)
    REFERENCES `mydb`.`aeronaves` (`idaeronaves`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_aeronaves_has_trechosVoos_trechosVoos1`
    FOREIGN KEY (`trechosVoos_classe`)
    REFERENCES `mydb`.`trechosVoos` (`classe`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`trechos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`trechos` (
  `aeropostos` INT NOT NULL,
  PRIMARY KEY (`aeropostos`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`voos_has_trechos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`voos_has_trechos` (
  `voos_idvoos` INT NOT NULL,
  `trechos_aeropostos` INT NOT NULL,
  PRIMARY KEY (`voos_idvoos`, `trechos_aeropostos`),
  INDEX `fk_voos_has_trechos_trechos1_idx` (`trechos_aeropostos` ASC) VISIBLE,
  INDEX `fk_voos_has_trechos_voos1_idx` (`voos_idvoos` ASC) VISIBLE,
  CONSTRAINT `fk_voos_has_trechos_voos1`
    FOREIGN KEY (`voos_idvoos`)
    REFERENCES `mydb`.`voos` (`idvoos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_voos_has_trechos_trechos1`
    FOREIGN KEY (`trechos_aeropostos`)
    REFERENCES `mydb`.`trechos` (`aeropostos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
