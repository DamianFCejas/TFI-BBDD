-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema portfolio
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema portfolio
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `portfolio` DEFAULT CHARACTER SET utf8mb4 ;
USE `portfolio` ;

-- -----------------------------------------------------
-- Table `portfolio`.`persona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio`.`persona` (
  `idpersona` INT(11) NOT NULL,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  `apellido` VARCHAR(45) NULL DEFAULT NULL,
  `domicilio` VARCHAR(45) NULL DEFAULT NULL,
  `fechaNac` DATE NULL DEFAULT NULL,
  `telefono` VARCHAR(12) NULL DEFAULT NULL,
  `correo` VARCHAR(45) NULL DEFAULT NULL,
  `sobreMi` VARCHAR(200) NULL DEFAULT NULL,
  `urlFoto` VARCHAR(100) NULL DEFAULT NULL,
  `fecha_nac` VARCHAR(255) NULL DEFAULT NULL,
  `sobre_mi` VARCHAR(255) NULL DEFAULT NULL,
  `url_foto` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`idpersona`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `portfolio`.`institucion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio`.`institucion` (
  `idinstitucion` INT(11) NOT NULL,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  `urlFoto` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`idinstitucion`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `portfolio`.`educacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio`.`educacion` (
  `ideducacion` INT(11) NOT NULL,
  `titulo` VARCHAR(45) NULL DEFAULT NULL,
  `estudioFinalizado` TINYINT(4) NULL DEFAULT NULL,
  `fechaInicio` DATE NULL DEFAULT NULL,
  `fechaFin` DATE NULL DEFAULT NULL,
  `descripcion` VARCHAR(45) NULL DEFAULT NULL,
  `persona_idpersona` INT(11) NOT NULL,
  `institucion_idinstitucion` INT(11) NOT NULL,
  PRIMARY KEY (`ideducacion`, `persona_idpersona`, `institucion_idinstitucion`),
  CONSTRAINT `fk_educacion_persona1`
    FOREIGN KEY (`persona_idpersona`)
    REFERENCES `portfolio`.`persona` (`idpersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_educacion_institucion1`
    FOREIGN KEY (`institucion_idinstitucion`)
    REFERENCES `portfolio`.`institucion` (`idinstitucion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `portfolio`.`empresa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio`.`empresa` (
  `idempresa` INT(11) NOT NULL,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  `urlFoto` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`idempresa`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `portfolio`.`tipoEmpleo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio`.`tipoEmpleo` (
  `idtipoEmpleo` INT(11) NOT NULL,
  `nombreTipo` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idtipoEmpleo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `portfolio`.`experiencia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio`.`experiencia` (
  `idexperiencia` INT(11) NOT NULL,
  `esTrabajoActual` TINYINT(4) NULL DEFAULT NULL,
  `fechaInicio` DATE NULL DEFAULT NULL,
  `fechaFin` VARCHAR(45) NULL DEFAULT NULL,
  `descripcion` VARCHAR(200) NULL DEFAULT NULL,
  `persona_idpersona` INT(11) NOT NULL,
  `tipoEmpleo_idtipoEmpleo` INT(11) NOT NULL,
  `empresa_idempresa` INT(11) NOT NULL,
  PRIMARY KEY (`idexperiencia`, `persona_idpersona`, `tipoEmpleo_idtipoEmpleo`, `empresa_idempresa`),
  CONSTRAINT `fk_experiencia_persona`
    FOREIGN KEY (`persona_idpersona`)
    REFERENCES `portfolio`.`persona` (`idpersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_experiencia_tipoEmpleo1`
    FOREIGN KEY (`tipoEmpleo_idtipoEmpleo`)
    REFERENCES `portfolio`.`tipoEmpleo` (`idtipoEmpleo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_experiencia_empresa1`
    FOREIGN KEY (`empresa_idempresa`)
    REFERENCES `portfolio`.`empresa` (`idempresa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `portfolio`.`hibernate_sequence`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio`.`hibernate_sequence` (
  `next_val` BIGINT(20) NULL DEFAULT NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `portfolio`.`hyss`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio`.`hyss` (
  `idhyss` INT(11) NOT NULL,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  `porcentaje` DECIMAL(5,2) NULL DEFAULT NULL,
  `persona_idpersona` INT(11) NOT NULL,
  PRIMARY KEY (`idhyss`, `persona_idpersona`),
  CONSTRAINT `fk_hyss_persona1`
    FOREIGN KEY (`persona_idpersona`)
    REFERENCES `portfolio`.`persona` (`idpersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `portfolio`.`proyecto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio`.`proyecto` (
  `idproyecto` INT(11) NOT NULL,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  `descripcion` VARCHAR(200) NULL DEFAULT NULL,
  `urlFoto` VARCHAR(100) NULL DEFAULT NULL,
  `persona_idpersona` INT(11) NOT NULL,
  PRIMARY KEY (`idproyecto`, `persona_idpersona`),
  CONSTRAINT `fk_proyecto_persona1`
    FOREIGN KEY (`persona_idpersona`)
    REFERENCES `portfolio`.`persona` (`idpersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
