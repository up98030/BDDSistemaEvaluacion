-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema SISTEMAEVALUACION
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `SISTEMAEVALUACION` ;

-- -----------------------------------------------------
-- Schema SISTEMAEVALUACION
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `SISTEMAEVALUACION` DEFAULT CHARACTER SET utf8 ;
USE `SISTEMAEVALUACION` ;

-- -----------------------------------------------------
-- Table `SISTEMAEVALUACION`.`Modulos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SISTEMAEVALUACION`.`Modulos` ;

CREATE TABLE IF NOT EXISTS `SISTEMAEVALUACION`.`Modulos` (
  `idModulo` INT NOT NULL AUTO_INCREMENT,
  `nombreModulo` VARCHAR(45) NULL,
  `estado` VARCHAR(3) NULL,
  `descripcionModulo` VARCHAR(500) NULL,
  PRIMARY KEY (`idModulo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SISTEMAEVALUACION`.`Tareas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SISTEMAEVALUACION`.`Tareas` ;

CREATE TABLE IF NOT EXISTS `SISTEMAEVALUACION`.`Tareas` (
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
  `extensionArchivo` VARCHAR(10) NULL,
  `idPeriodo` INT(11) NULL,
  PRIMARY KEY (`idTarea`),
  INDEX `TAREAFKMODULO_idx` (`IdModulo` ASC),
  CONSTRAINT `TAREAFKMODULO`
    FOREIGN KEY (`IdModulo`)
    REFERENCES `SISTEMAEVALUACION`.`Modulos` (`idModulo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SISTEMAEVALUACION`.`Perfiles`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SISTEMAEVALUACION`.`Perfiles` ;

CREATE TABLE IF NOT EXISTS `SISTEMAEVALUACION`.`Perfiles` (
  `idPerfil` INT NOT NULL,
  `nombrePerfil` VARCHAR(45) NULL,
  `estado` VARCHAR(3) NULL,
  `descripcionPerfil` VARCHAR(45) NULL,
  PRIMARY KEY (`idPerfil`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SISTEMAEVALUACION`.`Usuarios`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SISTEMAEVALUACION`.`Usuarios` ;

CREATE TABLE IF NOT EXISTS `SISTEMAEVALUACION`.`Usuarios` (
  `idUsuario` INT NOT NULL AUTO_INCREMENT,
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
    REFERENCES `SISTEMAEVALUACION`.`Perfiles` (`idPerfil`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `USUARIOFKMODULO`
    FOREIGN KEY (`idModulo`)
    REFERENCES `SISTEMAEVALUACION`.`Modulos` (`idModulo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SISTEMAEVALUACION`.`Criterios`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SISTEMAEVALUACION`.`Criterios` ;

CREATE TABLE IF NOT EXISTS `SISTEMAEVALUACION`.`Criterios` (
  `idCriterio` INT NOT NULL,
  `nombreCriterio` VARCHAR(45) NULL,
  `estado` VARCHAR(3) NULL,
  `valorCriterio` VARCHAR(45) NULL,
  `descripcionCriterio` VARCHAR(45) NULL,
  PRIMARY KEY (`idCriterio`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SISTEMAEVALUACION`.`TareasUsuarios`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SISTEMAEVALUACION`.`TareasUsuarios` ;

CREATE TABLE IF NOT EXISTS `SISTEMAEVALUACION`.`TareasUsuarios` (
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
    REFERENCES `SISTEMAEVALUACION`.`Usuarios` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `TAREAFKTAREA`
    FOREIGN KEY (`idTarea`)
    REFERENCES `SISTEMAEVALUACION`.`Tareas` (`idTarea`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SISTEMAEVALUACION`.`TiposTareas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SISTEMAEVALUACION`.`TiposTareas` ;

CREATE TABLE IF NOT EXISTS `SISTEMAEVALUACION`.`TiposTareas` (
  `idTiposTareas` INT NOT NULL AUTO_INCREMENT,
  `nombreTipoTarea` VARCHAR(45) NULL,
  `descripcionTipoTarea` VARCHAR(45) NULL,
  `estado` VARCHAR(3) NULL,
  PRIMARY KEY (`idTiposTareas`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SISTEMAEVALUACION`.`Periodos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SISTEMAEVALUACION`.`Periodos` ;

CREATE TABLE IF NOT EXISTS `SISTEMAEVALUACION`.`Periodos` (
  `idPeriodo` INT NOT NULL AUTO_INCREMENT,
  `NombrePeriodo` VARCHAR(45) NULL,
  `estado` VARCHAR(5) NULL,
  PRIMARY KEY (`idPeriodo`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
