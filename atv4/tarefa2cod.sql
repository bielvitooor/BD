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
-- Table `mydb`.`notaFiscal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`notaFiscal` (
  `idnotaFiscal` INT NOT NULL,
  `data` DATE NULL,
  `hora` TIME NULL,
  PRIMARY KEY (`idnotaFiscal`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`item`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`item` (
  `iditem` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  `quant` INT NULL,
  `valor` INT NULL,
  `notaFiscal_idnotaFiscal` INT NOT NULL,
  PRIMARY KEY (`iditem`),
  INDEX `fk_item_notaFiscal_idx` (`notaFiscal_idnotaFiscal` ASC) VISIBLE,
  CONSTRAINT `fk_item_notaFiscal`
    FOREIGN KEY (`notaFiscal_idnotaFiscal`)
    REFERENCES `mydb`.`notaFiscal` (`idnotaFiscal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`decrItem`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`decrItem` (
  `iddecrItem` INT NOT NULL,
  `decrItemcol` VARCHAR(45) NULL,
  `item_iditem` INT NOT NULL,
  PRIMARY KEY (`iddecrItem`),
  INDEX `fk_decrItem_item1_idx` (`item_iditem` ASC) VISIBLE,
  CONSTRAINT `fk_decrItem_item1`
    FOREIGN KEY (`item_iditem`)
    REFERENCES `mydb`.`item` (`iditem`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tipo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tipo` (
  `idtipo` INT NOT NULL,
  `tipocol` VARCHAR(45) NULL,
  `decrItem_iddecrItem` INT NOT NULL,
  PRIMARY KEY (`idtipo`),
  INDEX `fk_tipo_decrItem1_idx` (`decrItem_iddecrItem` ASC) VISIBLE,
  CONSTRAINT `fk_tipo_decrItem1`
    FOREIGN KEY (`decrItem_iddecrItem`)
    REFERENCES `mydb`.`decrItem` (`iddecrItem`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

INSERT INTO `mydb`.`notafiscal` (`idnotaFiscal`) VALUES ('1');
INSERT INTO `mydb`.`notafiscal` (`idnotaFiscal`) VALUES ('2');
INSERT INTO `mydb`.`notafiscal` (`idnotaFiscal`) VALUES ('3');
INSERT INTO `mydb`.`notafiscal` (`idnotaFiscal`) VALUES ('4');
INSERT INTO `mydb`.`notafiscal` (`idnotaFiscal`) VALUES ('5');
INSERT INTO `mydb`.`notafiscal` (`idnotaFiscal`) VALUES ('6');
INSERT INTO `mydb`.`notafiscal` (`idnotaFiscal`) VALUES ('7');
INSERT INTO `mydb`.`notafiscal` (`idnotaFiscal`) VALUES ('8');
INSERT INTO `mydb`.`notafiscal` (`idnotaFiscal`) VALUES ('9');
INSERT INTO `mydb`.`notafiscal` (`idnotaFiscal`) VALUES ('10');

INSERT INTO `mydb`.`item` (`iditem`, `notaFiscal_idnotaFiscal`) VALUES ('1', '1');
INSERT INTO `mydb`.`item` (`iditem`, `notaFiscal_idnotaFiscal`) VALUES ('2', '2');
INSERT INTO `mydb`.`item` (`iditem`, `notaFiscal_idnotaFiscal`) VALUES ('3', '3');
INSERT INTO `mydb`.`item` (`iditem`, `notaFiscal_idnotaFiscal`) VALUES ('4', '4');
INSERT INTO `mydb`.`item` (`iditem`, `notaFiscal_idnotaFiscal`) VALUES ('5', '5');
INSERT INTO `mydb`.`item` (`iditem`, `notaFiscal_idnotaFiscal`) VALUES ('6', '6');
INSERT INTO `mydb`.`item` (`iditem`, `notaFiscal_idnotaFiscal`) VALUES ('7', '7');
INSERT INTO `mydb`.`item` (`iditem`, `notaFiscal_idnotaFiscal`) VALUES ('8', '8');
INSERT INTO `mydb`.`item` (`iditem`, `notaFiscal_idnotaFiscal`) VALUES ('9', '8');
INSERT INTO `mydb`.`item` (`iditem`, `notaFiscal_idnotaFiscal`) VALUES ('10', '10');

INSERT INTO `mydb`.`decritem` (`iddecrItem`, `item_iditem`) VALUES ('1', '1');
INSERT INTO `mydb`.`decritem` (`iddecrItem`, `item_iditem`) VALUES ('2', '2');
INSERT INTO `mydb`.`decritem` (`iddecrItem`, `item_iditem`) VALUES ('3', '3');
INSERT INTO `mydb`.`decritem` (`iddecrItem`, `item_iditem`) VALUES ('4', '4');
INSERT INTO `mydb`.`decritem` (`iddecrItem`, `item_iditem`) VALUES ('5', '5');
INSERT INTO `mydb`.`decritem` (`iddecrItem`, `item_iditem`) VALUES ('6', '6');
INSERT INTO `mydb`.`decritem` (`iddecrItem`, `item_iditem`) VALUES ('7', '7');
INSERT INTO `mydb`.`decritem` (`iddecrItem`, `item_iditem`) VALUES ('8', '8');
INSERT INTO `mydb`.`decritem` (`iddecrItem`, `item_iditem`) VALUES ('9', '9');
INSERT INTO `mydb`.`decritem` (`iddecrItem`, `item_iditem`) VALUES ('10', '10');

INSERT INTO `mydb`.`tipo` (`idtipo`, `decrItem_iddecrItem`) VALUES ('1', '1');
INSERT INTO `mydb`.`tipo` (`idtipo`, `decrItem_iddecrItem`) VALUES ('2', '2');
INSERT INTO `mydb`.`tipo` (`idtipo`, `decrItem_iddecrItem`) VALUES ('3', '3');
INSERT INTO `mydb`.`tipo` (`idtipo`, `decrItem_iddecrItem`) VALUES ('4', '4');
INSERT INTO `mydb`.`tipo` (`idtipo`, `decrItem_iddecrItem`) VALUES ('5', '5');
INSERT INTO `mydb`.`tipo` (`idtipo`, `decrItem_iddecrItem`) VALUES ('6', '6');
INSERT INTO `mydb`.`tipo` (`idtipo`, `decrItem_iddecrItem`) VALUES ('7', '7');
INSERT INTO `mydb`.`tipo` (`idtipo`, `decrItem_iddecrItem`) VALUES ('8', '8');
INSERT INTO `mydb`.`tipo` (`idtipo`, `decrItem_iddecrItem`) VALUES ('9', '9');
INSERT INTO `mydb`.`tipo` (`idtipo`, `decrItem_iddecrItem`) VALUES ('10', '10');



