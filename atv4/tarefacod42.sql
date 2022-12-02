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
-- Table `mydb`.`editora`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`editora` (
  `cod` INT NOT NULL,
  `endereco` VARCHAR(45) NULL,
  `tele` INT NULL,
  PRIMARY KEY (`cod`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`livraria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`livraria` (
  `reglivraria` INT NULL,
  `editora_cod` INT NOT NULL,
  PRIMARY KEY (`reglivraria`, `editora_cod`),
  INDEX `fk_livraria_editora1_idx` (`editora_cod` ASC) VISIBLE,
  CONSTRAINT `fk_livraria_editora1`
    FOREIGN KEY (`editora_cod`)
    REFERENCES `mydb`.`editora` (`cod`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`livro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`livro` (
  `nomeAutor` INT NOT NULL,
  `assusto` VARCHAR(45) NULL,
  `editora` VARCHAR(45) NULL,
  `ISBN` BIGINT(11) NULL,
  `quantidade` INT NULL,
  PRIMARY KEY (`nomeAutor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`livraria_has_livro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`livraria_has_livro` (
  `livraria_reglivraria` INT NOT NULL,
  `livro_nomeAutor` INT NOT NULL,
  PRIMARY KEY (`livraria_reglivraria`, `livro_nomeAutor`),
  INDEX `fk_livraria_has_livro_livro1_idx` (`livro_nomeAutor` ASC) VISIBLE,
  INDEX `fk_livraria_has_livro_livraria_idx` (`livraria_reglivraria` ASC) VISIBLE,
  CONSTRAINT `fk_livraria_has_livro_livraria`
    FOREIGN KEY (`livraria_reglivraria`)
    REFERENCES `mydb`.`livraria` (`reglivraria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_livraria_has_livro_livro1`
    FOREIGN KEY (`livro_nomeAutor`)
    REFERENCES `mydb`.`livro` (`nomeAutor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`cliente` (
  `cod` INT NOT NULL,
  `endereco` VARCHAR(45) NULL,
  `cpf/cnpj` BIGINT NULL,
  `livroCompra` INT NULL,
  PRIMARY KEY (`cod`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
