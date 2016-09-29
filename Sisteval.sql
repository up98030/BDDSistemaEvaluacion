-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Modulos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Modulos` (
  `idModulo` INT NOT NULL,
  `nombreModulo` VARCHAR(45) NULL,
  `estado` VARCHAR(3) NULL,
  PRIMARY KEY (`idModulo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Tareas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tareas` (
  `idTarea` INT NOT NULL AUTO_INCREMENT,
  `nombreTarea` VARCHAR(45) NULL,
  `descripcionTarea` VARCHAR(45) NULL,
  `IdModulo` INT NULL,
  `tipoTarea` VARCHAR(45) NULL,
  `idCreadorTarea` INT NULL,
  `estado` VARCHAR(3) NULL,
  `fechaInicio` DATE NULL,
  `fechaFin` DATE NULL,
  `archivoAdjunto` MEDIUMBLOB NULL,
  `Criterios` VARCHAR(45) NULL,
  `Tareascol` VARCHAR(45) NULL,
  PRIMARY KEY (`idTarea`),
  INDEX `TAREAFKMODULO_idx` (`IdModulo` ASC),
  CONSTRAINT `TAREAFKMODULO`
    FOREIGN KEY (`IdModulo`)
    REFERENCES `mydb`.`Modulos` (`idModulo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Perfiles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Perfiles` (
  `idPerfil` INT NOT NULL,
  `nombrePerfil` VARCHAR(45) NULL,
  `estado` VARCHAR(3) NULL,
  PRIMARY KEY (`idPerfil`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Usuarios` (
  `idUsuario` INT NOT NULL,
  `nombreUsuario` VARCHAR(20) NULL,
  `correoUsuario` VARCHAR(45) NULL,
  `nombreCompletoUsuario` VARCHAR(90) NULL,
  `idPerfil` INT NULL,
  `estado` VARCHAR(3) NULL,
  `password` VARCHAR(45) NULL,
  `idModulo` INT NULL,
  PRIMARY KEY (`idUsuario`),
  INDEX `idPerfil_idx` (`idPerfil` ASC),
  INDEX `USUARIOFKMODULO_idx` (`idModulo` ASC),
  CONSTRAINT `USUARIOFKPERFIL`
    FOREIGN KEY (`idPerfil`)
    REFERENCES `mydb`.`Perfiles` (`idPerfil`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `USUARIOFKMODULO`
    FOREIGN KEY (`idModulo`)
    REFERENCES `mydb`.`Modulos` (`idModulo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Criterios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Criterios` (
  `idCriterio` INT NOT NULL,
  `nombreCriterio` VARCHAR(45) NULL,
  `estado` VARCHAR(3) NULL,
  `valorCriterio` VARCHAR(45) NULL,
  `descripcionCriterio` VARCHAR(45) NULL,
  PRIMARY KEY (`idCriterio`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`TareasUsuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`TareasUsuarios` (
  `idTareaUsuario` INT NOT NULL AUTO_INCREMENT,
  `idUsuario` INT NULL,
  `idTarea` INT NULL,
  `ObservacionesDocente` VARCHAR(500) NULL,
  `ArchivoEnviado` MEDIUMBLOB NULL,
  `FechaEnvio` DATE NULL,
  `estado` VARCHAR(3) NULL,
  `calificacion` INT NULL,
  `ObservacionCalificacion` VARCHAR(500) NULL,
  PRIMARY KEY (`idTareaUsuario`),
  INDEX `idUsuario_idx` (`idUsuario` ASC),
  INDEX `idTarea_idx` (`idTarea` ASC),
  CONSTRAINT `TAREAFKUSUARIOS`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `mydb`.`Usuarios` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `TAREAFKTAREA`
    FOREIGN KEY (`idTarea`)
    REFERENCES `mydb`.`Tareas` (`idTarea`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`TiposTareas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`TiposTareas` (
  `idTiposTareas` INT NOT NULL AUTO_INCREMENT,
  `nombreTipoTarea` VARCHAR(45) NULL,
  `descripcionTipoTarea` VARCHAR(45) NULL,
  `estado` VARCHAR(3) NULL,
  PRIMARY KEY (`idTiposTareas`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
