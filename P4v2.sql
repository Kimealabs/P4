-- MySQL Script generated by MySQL Workbench
-- Tue Jul 12 16:51:48 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema ExpressFood
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `ExpressFood` ;

-- -----------------------------------------------------
-- Schema ExpressFood
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ExpressFood` DEFAULT CHARACTER SET utf8 ;
USE `ExpressFood` ;

-- -----------------------------------------------------
-- Table `ExpressFood`.`TypeCompte`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `ExpressFood`.`TypeCompte` (
  `idTypeCompte` TINYINT(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `libelleTypeCompte` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idTypeCompte`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ExpressFood`.`Adresse`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `ExpressFood`.`Adresse` (
  `idAdresse` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `voie` VARCHAR(255) NOT NULL,
  `complement` VARCHAR(255) NULL,
  `codePostal` VARCHAR(5) NOT NULL,
  `ville` VARCHAR(255) NOT NULL,
  `longitude` FLOAT UNSIGNED NOT NULL,
  `latitude` FLOAT UNSIGNED NOT NULL,
  PRIMARY KEY (`idAdresse`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ExpressFood`.`User`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `ExpressFood`.`User` (
  `idUser` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(255) NOT NULL,
  `prenom` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `motDePasse` VARCHAR(255) NOT NULL,
  `telephone` VARCHAR(10) NOT NULL,
  `idTypeCompte` TINYINT(5) UNSIGNED NOT NULL,
  `idAdresse` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`idUser`))  
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ExpressFood`.`Commande`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `ExpressFood`.`Commande` (
  `idCommande` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `date` DATETIME NOT NULL,
  `idUser` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`idCommande`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ExpressFood`.`Client`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `ExpressFood`.`Client` (
  `idClient` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `idUser` INT UNSIGNED NULL,
  PRIMARY KEY (`idClient`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ExpressFood`.`Livreur`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `ExpressFood`.`Livreur` (
  `idLivreur` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `longitude` FLOAT NOT NULL,
  `latitude` FLOAT NOT NULL,
  `status` VARCHAR(45) NOT NULL,
  `idUser` INT UNSIGNED NULL,
  PRIMARY KEY (`idLivreur`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ExpressFood`.`Chef`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `ExpressFood`.`Chef` (
  `idChef` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `idUser` INT UNSIGNED NULL,
  PRIMARY KEY (`idChef`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ExpressFood`.`Livraison`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `ExpressFood`.`Livraison` (
  `idLivraison` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `heure` DATETIME NOT NULL,
  `idCommande` INT UNSIGNED NOT NULL,
  `status` VARCHAR(45) NOT NULL,
  `idLivreur` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`idLivraison`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ExpressFood`.`Plat`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `ExpressFood`.`Plat` (
  `idPlat` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(255) NOT NULL,
  `type` VARCHAR(45) NOT NULL,
  `prixHt` FLOAT UNSIGNED NOT NULL,
  `idChef` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`idPlat`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ExpressFood`.`LigneCommande`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `ExpressFood`.`LigneCommande` (
  `idLigneCommande` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `idCommande` INT UNSIGNED NOT NULL,
  `idPlat` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`idLigneCommande`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ExpressFood`.`Stock`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `ExpressFood`.`Stock` (
  `idStock` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `idPlat` INT UNSIGNED NULL,
  `idLivreur` INT UNSIGNED NULL,
  `status` TINYINT(5) NULL,
  PRIMARY KEY (`idStock`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
