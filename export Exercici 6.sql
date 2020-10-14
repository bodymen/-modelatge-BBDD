-- MySQL Script generated by MySQL Workbench
-- Wed Oct 14 10:43:22 2020
-- Model: New Model    Version: 1.0
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
-- Table `mydb`.`Direccions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Direccions` (
  `idDireccio` INT NOT NULL AUTO_INCREMENT,
  `carrer` VARCHAR(45) NOT NULL,
  `numero` INT NOT NULL,
  `pis` INT NOT NULL,
  `porta` CHAR NULL,
  `ciutat` VARCHAR(45) NULL,
  `codiPostal` INT NULL,
  `pais` VARCHAR(45) NULL,
  PRIMARY KEY (`idDireccio`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Proveidors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Proveidors` (
  `idProveidor` INT NOT NULL AUTO_INCREMENT,
  `nif` VARCHAR(10) NOT NULL,
  `nom` VARCHAR(45) NOT NULL,
  `telefon` VARCHAR(45) NOT NULL,
  `fax` VARCHAR(45) NULL,
  `Direccio_idDireccio` INT NOT NULL,
  PRIMARY KEY (`idProveidor`),
  INDEX `fk_Proveidors_Direccio1_idx` (`Direccio_idDireccio` ASC) VISIBLE,
  CONSTRAINT `fk_Proveidors_Direccio1`
    FOREIGN KEY (`Direccio_idDireccio`)
    REFERENCES `mydb`.`Direccions` (`idDireccio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Empleats`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Empleats` (
  `idEmpleat` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NOT NULL,
  `telefon` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idEmpleat`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Marques`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Marques` (
  `idMarca` INT NOT NULL,
  `NomMarca` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idMarca`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Ulleres`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Ulleres` (
  `idUllera` INT NOT NULL AUTO_INCREMENT,
  `graducacion_esquerra` DECIMAL NOT NULL,
  `graducacion_dreta` DECIMAL NOT NULL,
  `tipus_muntura` SET("flotant", "pasta", "metàl·lica") NOT NULL,
  `color_muntura` VARCHAR(45) NOT NULL,
  `color_vidre_dreta` VARCHAR(45) NOT NULL,
  `color_vidre_esquerra` VARCHAR(45) NOT NULL,
  `preu` DECIMAL NOT NULL,
  `Empleats_idEmpleat` INT NOT NULL,
  `Marques_idMarca` INT NOT NULL,
  PRIMARY KEY (`idUllera`),
  INDEX `fk_Ulleres_Empleats1_idx` (`Empleats_idEmpleat` ASC) VISIBLE,
  INDEX `fk_Ulleres_Marques1_idx` (`Marques_idMarca` ASC) VISIBLE,
  CONSTRAINT `fk_Ulleres_Empleats1`
    FOREIGN KEY (`Empleats_idEmpleat`)
    REFERENCES `mydb`.`Empleats` (`idEmpleat`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ulleres_Marques1`
    FOREIGN KEY (`Marques_idMarca`)
    REFERENCES `mydb`.`Marques` (`idMarca`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Clients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Clients` (
  `idClient` INT NOT NULL,
  `nom` VARCHAR(45) NOT NULL,
  `telefon` VARCHAR(45) NOT NULL,
  `dataRegistre` DATETIME NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `Direccio_idDireccio` INT NOT NULL,
  `RecomenatPer` INT NOT NULL,
  PRIMARY KEY (`idClient`),
  INDEX `fk_Proveidors_Direccio1_idx` (`Direccio_idDireccio` ASC) VISIBLE,
  INDEX `fk_Clients_Clients1_idx` (`RecomenatPer` ASC) VISIBLE,
  CONSTRAINT `fk_Proveidors_Direccio10`
    FOREIGN KEY (`Direccio_idDireccio`)
    REFERENCES `mydb`.`Direccions` (`idDireccio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Clients_Clients1`
    FOREIGN KEY (`RecomenatPer`)
    REFERENCES `mydb`.`Clients` (`idClient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `mydb`.`Direccions`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`Direccions` (`idDireccio`, `carrer`, `numero`, `pis`, `porta`, `ciutat`, `codiPostal`, `pais`) VALUES (1, 'numancia', 3, 2, 'A', 'Barcelona', 08011, 'esp');
INSERT INTO `mydb`.`Direccions` (`idDireccio`, `carrer`, `numero`, `pis`, `porta`, `ciutat`, `codiPostal`, `pais`) VALUES (2, 'rossellon', 67, 6, '2', 'Barcelona', 08015, 'esp');
INSERT INTO `mydb`.`Direccions` (`idDireccio`, `carrer`, `numero`, `pis`, `porta`, `ciutat`, `codiPostal`, `pais`) VALUES (3, 'balmes', 546, 5, '4', 'Barcelona', 08007, 'esp');
INSERT INTO `mydb`.`Direccions` (`idDireccio`, `carrer`, `numero`, `pis`, `porta`, `ciutat`, `codiPostal`, `pais`) VALUES (4, 'villarroel', 71, 11, '1', 'Barcelona', 08010, 'esp');
INSERT INTO `mydb`.`Direccions` (`idDireccio`, `carrer`, `numero`, `pis`, `porta`, `ciutat`, `codiPostal`, `pais`) VALUES (5, 'casablanca', 88, 5, '1', 'Barcelona', 08012, 'esp');

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`Proveidors`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`Proveidors` (`idProveidor`, `nif`, `nom`, `telefon`, `fax`, `Direccio_idDireccio`) VALUES (1, '123456789A', 'pepe', '611111111', '9154678895', 3);
INSERT INTO `mydb`.`Proveidors` (`idProveidor`, `nif`, `nom`, `telefon`, `fax`, `Direccio_idDireccio`) VALUES (2, '123456789X', 'manuel', '622222222', '9356421356', 2);
INSERT INTO `mydb`.`Proveidors` (`idProveidor`, `nif`, `nom`, `telefon`, `fax`, `Direccio_idDireccio`) VALUES (3, '123456789J', 'david', '633333333', '9365421236', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`Empleats`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`Empleats` (`idEmpleat`, `nom`, `telefon`, `email`) VALUES (1, 'lola', '654123123', 'lola@culAmpolla.com');
INSERT INTO `mydb`.`Empleats` (`idEmpleat`, `nom`, `telefon`, `email`) VALUES (2, 'manolo', '689123654', 'manolo@culAmpolla.com');
INSERT INTO `mydb`.`Empleats` (`idEmpleat`, `nom`, `telefon`, `email`) VALUES (3, 'nuria', '685147856', 'nuria@culAmpolla.com');

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`Marques`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`Marques` (`idMarca`, `NomMarca`) VALUES (1, 'Polo');
INSERT INTO `mydb`.`Marques` (`idMarca`, `NomMarca`) VALUES (2, 'Levis');
INSERT INTO `mydb`.`Marques` (`idMarca`, `NomMarca`) VALUES (3, 'Police');
INSERT INTO `mydb`.`Marques` (`idMarca`, `NomMarca`) VALUES (4, 'Carrera');

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`Ulleres`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`Ulleres` (`idUllera`, `graducacion_esquerra`, `graducacion_dreta`, `tipus_muntura`, `color_muntura`, `color_vidre_dreta`, `color_vidre_esquerra`, `preu`, `Empleats_idEmpleat`, `Marques_idMarca`) VALUES (1, 2.25, 3.15, 'pasta', 'rojo', 'blanco', 'blanco', 100.85, 1, 1);
INSERT INTO `mydb`.`Ulleres` (`idUllera`, `graducacion_esquerra`, `graducacion_dreta`, `tipus_muntura`, `color_muntura`, `color_vidre_dreta`, `color_vidre_esquerra`, `preu`, `Empleats_idEmpleat`, `Marques_idMarca`) VALUES (2, 5.75, 4.25, 'flotant', 'azul', 'blanco', 'blanco', 152.25, 2, 2);
INSERT INTO `mydb`.`Ulleres` (`idUllera`, `graducacion_esquerra`, `graducacion_dreta`, `tipus_muntura`, `color_muntura`, `color_vidre_dreta`, `color_vidre_esquerra`, `preu`, `Empleats_idEmpleat`, `Marques_idMarca`) VALUES (3, 1.25, 2, 'metal·lica', 'negra', 'blanco', 'blanco', 95.65, 3, 3);

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`Clients`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`Clients` (`idClient`, `nom`, `telefon`, `dataRegistre`, `email`, `Direccio_idDireccio`, `RecomenatPer`) VALUES (1, 'rubén', '623145632', '14/10/2020', 'ruben@gmail.com', 4, DEFAULT);
INSERT INTO `mydb`.`Clients` (`idClient`, `nom`, `telefon`, `dataRegistre`, `email`, `Direccio_idDireccio`, `RecomenatPer`) VALUES (2, 'eva', '687452136', '15/10/2020', 'eva@gmail.com', 5, 1);

COMMIT;

